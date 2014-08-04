Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0F95465CA8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 09:11:45 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id ft15so9359247pdb.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Aug 2014 02:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=S3QxebvrrtJ+oQSLZ8eagHIr2O5mN8pdwqrTyBYh9gE=;
	b=j0jyiY8i+XGpD+ru2cExsyVTW8iLrrT7Es2LYpmShsijGJaALPUCfei58zhGxnb6RP
	tcaSFLPhpIQPpcAcOyKog2Or0bRA1viCctUpQyi1VmcoM6I24U46MTsQjC5NeWKxnqLv
	zR1OUjk/vwutR9rVm6Lf6c5pAJQycAQsAA6lcl++wMdvLt/LEFLjpcnHDHzY2/w68Yvc
	pNnLfGPAswKAIhnuC7+Y7R++JYKX5kGTBX36LsnXhY3RcJKAsLJXgiChzqxjEn2A3URt
	P4xZAg0fmLXY7ScGqczvs9vdQ2OivrnM45woTq2i/06lX0c2wuHEcp8sRuGTd1O++bHy
	2ang==
X-Received: by 10.68.104.66 with SMTP id gc2mr22765673pbb.17.1407143507225;
	Mon, 04 Aug 2014 02:11:47 -0700 (PDT)
Received: from localhost.localdomain ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	co3sm16755674pbb.89.2014.08.04.02.11.45 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Aug 2014 02:11:46 -0700 (PDT)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Aug 2014 14:42:57 +0530
Message-Id: <1407143577-22390-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: [PATCH] dnsmasq: fix parallel make failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Aug 2014 09:11:52 -0000

From: Shrikant Bobade <Shrikant_Bobade@mentor.com>

The dnsmasq target depends on .configured and $(objs). .configured does an rm
-f *.o. Yet the only thing telling make to build the .configured target before
the $(objs) target was the order of the dependencies of the dnsmasq target. We
can't rely on that order when doing a paralllel make build, so add an explicit
rule to enforce that order.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
---
 .../recipes-support/dnsmasq/dnsmasq.inc            |    1 +
 .../dnsmasq/files/parallel-make.patch              |   18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/parallel-make.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index e57ab72..1955d6f 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -11,6 +11,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://init \
            file://dnsmasq.conf \
            file://dnsmasq.service \
+           file://parallel-make.patch \
 "
 
 inherit update-rc.d systemd
diff --git a/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch b/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
new file mode 100644
index 0000000..3d1040c
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
@@ -0,0 +1,18 @@
+The dnsmasq target depends on .configured and $(objs). .configured does an rm
+-f *.o. Yet the only thing telling make to build the .configured target before
+the $(objs) target was the order of the dependencies of the dnsmasq target. We
+can't rely on that order when doing a paralllel make build, so add an explicit
+rule to enforce that order.
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+--- dnsmasq-2.68.orig/Makefile
++++ dnsmasq-2.68/Makefile
+@@ -139,6 +139,8 @@ bloatcheck : $(BUILDDIR)/dnsmasq_baselin
+	@rm -f *.o
+	@touch $@
+
++$(objs): .configured
++
+ $(objs:.o=.c) $(hdrs):
+	ln -s $(top)/$(SRC)/$@ .
-- 
1.7.9.5


