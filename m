Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P8HdE-0000OV-U9
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 21:13:57 +0200
Received: by gxk6 with SMTP id 6so124894gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 12:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=vjIH9Ub409vpDwJYN2m7qoI9uajwORRBXwJsb2t3C9o=;
	b=mAJ3/sCru3Fjrxj1DBKuA2yKbL95RVOkxVnjMwhaZ+HIE7K3YqO/fi576APs7OcJBk
	JhqL/UE/aRWon2EPdz6IY5JCdH3PHBR1ppxTKEbT80KWO33PDNa7G6n6QxjBYFwcmmtu
	3w+Qutl3EhryD9iE+pmBwR2NlhsMXYNxBJFP4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kTMqWRoaeiub+0ZCFnr/jVOxAnxmW/B3EAHt/WvKqzZk6t2xgV0O7RNrbsqP72JMN+
	C4pb044XAeDqwru/1Hnv6I9fSu5shLuYaFiN6IFEMhgQgmDEEYsFNr1I0qQXO0qtJD5x
	NYHDweULp0Jy7+7SAp28bC48bc6EtW/ycnPa4=
Received: by 10.151.20.3 with SMTP id x3mr9430940ybi.322.1287515597297;
	Tue, 19 Oct 2010 12:13:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p38sm6032035ybk.4.2010.10.19.12.13.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 12:13:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 12:13:09 -0700
Message-Id: <1287515589-25224-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287515589-25224-1-git-send-email-raj.khem@gmail.com>
References: <1287515589-25224-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] gcc-configure-target.inc: Filter out --with-sysroot
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Oct 2010 19:13:57 -0000

* For target gcc we dont need to specify --with-sysroot
  even with libtool 2.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-configure-target.inc |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes/gcc/gcc-configure-target.inc b/recipes/gcc/gcc-configure-target.inc
index 03d7a6b..4c9ef8b 100644
--- a/recipes/gcc/gcc-configure-target.inc
+++ b/recipes/gcc/gcc-configure-target.inc
@@ -3,4 +3,10 @@ require gcc-configure-common.inc
 EXTRA_OECONF_PATHS = " \
     --with-local-prefix=${prefix}/local \
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
-    --with-build-sysroot=${STAGING_DIR_HOST}"
+    --with-build-sysroot=${STAGING_DIR_HOST} \
+   "
+
+python __anonymous () {
+	cfg = oe_filter_out('^--with-sysroot$', bb.data.getVar('CONFIGUREOPTS', d, 1) or "", d)
+	bb.data.setVar('CONFIGUREOPTS', cfg, d)
+}
-- 
1.7.1



