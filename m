Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07F896B07F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2019 23:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id BF890186E1;
	Sat, 20 Apr 2019 01:56:13 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id aX5z6zhbI2TD; Sat, 20 Apr 2019 01:56:11 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id AD7DD186C0;
	Sat, 20 Apr 2019 01:56:10 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9822A1A05E;
	Sat, 20 Apr 2019 01:56:10 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C42F1A05C;
	Sat, 20 Apr 2019 01:56:10 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sat, 20 Apr 2019 01:56:10 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 7F0171A75;
	Sat, 20 Apr 2019 01:56:10 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x3JNuAvi003601;
	Sat, 20 Apr 2019 01:56:11 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x3JNuAV9003598;
	Sat, 20 Apr 2019 01:56:10 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Apr 2019 01:56:01 +0200
Message-Id: <20190419235602.3553-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [meta-webserver][PATCH 1/2] apache2: Correct appending to SYSROOT_PREPROCESS_FUNCS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Apr 2019 23:56:14 -0000

A missing space lead to problems if something else was already added to
SYSROOT_PREPROCESS_FUNCS.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

We have a bbappend which amongst others inherits useradd, which also
appends to SYSROOT_PREPROCESS_FUNCS. What really confuses me though,
is that there was no error due to not being able to find the non-
existent useradd_sysroot_sstateapache_sysroot_preprocess function...
Only reason I noticed that there was a problem was because other
packages failed to build because apxs had not been installed in the
sysroot as expected.

 meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
index d58ccb8f2..c6961ef9b 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
@@ -147,7 +147,7 @@ do_install_append_class-native() {
     install -m 755 server/gen_test_char ${D}${bindir}
 }
 
-SYSROOT_PREPROCESS_FUNCS_append_class-target = "apache_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS_append_class-target = " apache_sysroot_preprocess"
 
 apache_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-- 
2.12.0


