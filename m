Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id CE4C070A7C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 01:03:46 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id eu11so9211415pac.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 18:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=pjg47+dhzO6xDvrEx/3vGIWoX9ZJ7IJofU7VfVwxwik=;
	b=EJd06c4SgWv2ljjYDX6pQaI/qBYk9hgW+ow+I538g8QKs38RLhcif14j8NJfJximmq
	lUNOzelkx8GsoRn3SedaVuiRPNWOgg8rq9HMeA5ZXAr6In2lsqEc4RbRIRfJeGXRZVdp
	qsOH7sVueYFnbClCJKoaWfpyY122tAXCyDYgtPHHa2WWsQqLYO8/A0KOxQ4ohGdxHsOO
	Xoh+kf2NPVNja/A544hXnnAnF1TrfFAVtst0Jia0ZBjq3yhkvkapTQYolcPU+ycdXCfX
	kGaNTh+CAHbL89ddpELL7RvE47U5EkStufw4lLNKB0M7HR2gZxhwpFuAF95gyOEurF7h
	xCFg==
X-Received: by 10.70.88.237 with SMTP id bj13mr33127058pdb.57.1407632628002;
	Sat, 09 Aug 2014 18:03:48 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id fu13sm150134pdb.81.2014.08.09.18.03.45
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Aug 2014 18:03:46 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:01:13 -0700
Message-Id: <df6c707e6db09c6b640084b8a4a69919b147ad07.1407632366.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1407632366.git.chris_larson@mentor.com>
References: <cover.1407632366.git.chris_larson@mentor.com>
In-Reply-To: <cover.1407632366.git.chris_larson@mentor.com>
References: <cover.1407632366.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 3/5] dnsmasq: fix parallel make issue
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
X-List-Received-Date: Sun, 10 Aug 2014 01:03:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.68.bb           |  2 ++
 .../recipes-support/dnsmasq/files/parallel-make.patch | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/parallel-make.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
index b1bef7a..6caa92a 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
@@ -1,4 +1,6 @@
 require dnsmasq.inc
 
+SRC_URI += "file://parallel-make.patch"
+
 SRC_URI[dnsmasq-2.68.md5sum] = "6f8351ca0901f248efdb81532778d2ef"
 SRC_URI[dnsmasq-2.68.sha256sum] = "402019d61f53f1ccc04cc6218719fd3b158ea3fca9a83ab55471f981a2097c2f"
diff --git a/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch b/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
new file mode 100644
index 0000000..6d5b722
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
@@ -0,0 +1,19 @@
+The dnsmasq target depends on .configured and $(objs). .configured does an rm
+-f *.o. Yet the only thing telling make to build the .configured target before
+the $(objs) target was the order of the dependencies of the dnsmasq target. We
+can't rely on that order when doing a paralllel make build, so add an explicit
+rule to enforce that order.
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-status: Pending
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
1.8.3.4


