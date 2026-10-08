Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4029DCA600C
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 19:31:06 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2798.1791487864012647032
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 12:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=skDzL9QT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261008193102eda5e874e800020701-fakfv5@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261008193102eda5e874e800020701
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 08 Oct 2026 21:31:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cpWthRHRbQTJ7VN9dluLNALBbSht7kdtqPf/b3heg/c=;
 b=skDzL9QToojAe6wUdCsY5gTwgZMxv9WnMPBNorTt5SKCKE1brK9li5r2i0UlyfQOHNFHp5
 q8mKm0V+9+OsYge6mA1SgWjlHC2hMp6BqlTrw2L0zP9/y/2+tpvB/hvOl4lL/ymbOGWu9CiA
 PDqMnNT2xatG0z7WZ2cv46W/5vcNGPkkxSGyI32pGlB1X897yaMVofUIpWl/UGiNGg3Nx+lc
 0/p0k+ediQy/4jOyF/4aUmra88FzQyR0OPxDrfwNTDk+gLZgPizeOQtKtZOpQURfbuHvCvuV
 LWOubUVGhKMOx6TizzviklBYedcUTpYFdMYxhXHuIRWG4ek+skvCZkeA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][wrynose][PATCH 2/2] squid: upgrade 7.6 -> 7.7
Date: Thu,  8 Oct 2026 21:27:58 +0200
Message-ID: <20261008192758.1176465-2-peter.marko@siemens.com>
In-Reply-To: <20261008192758.1176465-1-peter.marko@siemens.com>
References: <20261008192758.1176465-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 19:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130677

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also refresh patches for the new version.

Changelog:
https://github.com/squid-cache/squid/blob/SQUID_7_7/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(From meta-oe rev: 1ce230524143a6db6c83115cd96f6ad5f7af16e5)
Fixes CVE-2026-104786 and SQUID-2026:8.
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...l-remove-reference-to-nonexisting-directory.patch |  5 +----
 ...-make-squid-conf-tests-run-on-target-device.patch | 12 ++++++------
 .../squid/files/Set-up-for-cross-compilation.patch   | 10 ++++------
 .../squid/files/Skip-AC_RUN_IFELSE-tests.patch       |  9 ++++-----
 ...uid-use-serial-tests-config-needed-by-ptest.patch |  5 ++---
 .../squid/{squid_7.6.bb => squid_7.7.bb}             |  2 +-
 6 files changed, 18 insertions(+), 25 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_7.6.bb => squid_7.7.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch b/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
index 9babcfb24d..d5c83a8834 100644
--- a/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
+++ b/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
@@ -1,4 +1,4 @@
-From a6638a007a42917fea4b03e5c30d9b7208c634c4 Mon Sep 17 00:00:00 2001
+From 9c3718bce43146f219dec3c3cd47e57a6b418a19 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Thu, 7 Nov 2024 22:04:40 +0100
 Subject: [PATCH] libltdl: remove reference to nonexisting directory
@@ -50,6 +50,3 @@ index 9929557..c77df2e 100644
  AUTOMAKE_OPTIONS = foreign
  
  # -I$(srcdir) is needed for user that built libltdl with a sub-Automake
--- 
-2.30.2
-
diff --git a/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch b/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
index 86b454d710..b42f77bc74 100644
--- a/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
+++ b/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
@@ -1,4 +1,4 @@
-From cd8bf8a4bf881f84c23a5fc1f48bb716efa51512 Mon Sep 17 00:00:00 2001
+From 9f6eb086ee1d525cf404189893fccfb8a03235bb Mon Sep 17 00:00:00 2001
 From: Patrick Wicki <patrick.wicki@siemens.com>
 Date: Wed, 22 Nov 2023 15:35:44 +0100
 Subject: [PATCH] squid: make squid-conf-tests run on target device
@@ -20,7 +20,7 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  3 files changed, 18 insertions(+), 18 deletions(-)
 
 diff --git a/src/TestHeaders.am b/src/TestHeaders.am
-index 0ed5f56..d668876 100644
+index 4562d28..bc57e4c 100644
 --- a/src/TestHeaders.am
 +++ b/src/TestHeaders.am
 @@ -14,8 +14,8 @@ EXCLUDE_FROM_HDR_TESTING =
@@ -42,7 +42,7 @@ index 0ed5f56..d668876 100644
 +#TESTS += testHeaders
  CLEANFILES += testHeaders
 diff --git a/test-suite/Makefile.am b/test-suite/Makefile.am
-index 0da5844..0bc381a 100644
+index 1a7d91d..f51bf92 100644
 --- a/test-suite/Makefile.am
 +++ b/test-suite/Makefile.am
 @@ -11,7 +11,7 @@ include $(top_srcdir)/src/Common.am
@@ -105,7 +105,7 @@ index 0da5844..0bc381a 100644
 +	/var/log/squid-stderr.log.next \
 +	/var/log/squid-stderr.log.unmatched
 diff --git a/test-suite/test-squid-conf.sh b/test-suite/test-squid-conf.sh
-index 413a927..f678c5a 100755
+index 7d88ea5..bb5d76f 100755
 --- a/test-suite/test-squid-conf.sh
 +++ b/test-suite/test-squid-conf.sh
 @@ -76,7 +76,7 @@ expectMessages()
@@ -124,5 +124,5 @@ index 413a927..f678c5a 100755
 -errorLog="squid-stderr.log"
 +errorLog="/var/log/squid-stderr.log"
  
- $sbindir/squid -k parse -f $configFile 2> $errorLog
- result=$?
+ # Start `$sbindir/squid` from $configFile's directory, so that Squid can find files included by $configFile.
+ # If we decide to support relative `$sbindir` paths, we will add a portable realpath replacement.
diff --git a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
index f80d37de20..a4cb5f40ef 100644
--- a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
+++ b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From c0be3192f608037682464bcb728e97f9d9b543aa Mon Sep 17 00:00:00 2001
+From 19c82bff799611303f2985a2d317662b0529b24d Mon Sep 17 00:00:00 2001
 From: Jim Somerville <Jim.Somerville@windriver.com>
 Date: Wed, 16 Oct 2013 16:41:03 -0400
 Subject: [PATCH] Set up for cross compilation
@@ -8,16 +8,14 @@ Message-Id: <17e5a28667f667859c48bee25e575a072d39ee1b.1381956170.git.Jim.Somervi
 Set the host compiler to BUILD_CXX so
 proper cross compilation can occur.
 
-Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
-
----
 Upstream-Status: Pending
-
+Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+---
  configure.ac | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/configure.ac b/configure.ac
-index c7312d8..3b0e9e2 100644
+index cd7fbfd..850fdaf 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -29,6 +29,7 @@ m4_include([acinclude/lib-checks.m4])
diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
index 39392e1cc7..66987e02e6 100644
--- a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
@@ -1,4 +1,4 @@
-From 050f8ab275a7a5f3d94045da6b15a2b63dfbeb3f Mon Sep 17 00:00:00 2001
+From 822fd6630617040a713df5eb876d68051a716a0f Mon Sep 17 00:00:00 2001
 From: Jim Somerville <Jim.Somerville@windriver.com>
 Date: Tue, 14 Oct 2014 02:56:08 -0400
 Subject: [PATCH] Skip AC_RUN_IFELSE tests
@@ -10,13 +10,12 @@ environment.  Choose sane defaults.
 
 Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
 ---
- acinclude/lib-checks.m4 |  8 ++++++--
- 2 files changed, 15 insertions(+), 3 deletions(-)
+ acinclude/lib-checks.m4 | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/acinclude/lib-checks.m4 b/acinclude/lib-checks.m4
-index 9793b9a..4f2dc83 100644
+index 573ca17..f9c4666 100644
 --- a/acinclude/lib-checks.m4
 +++ b/acinclude/lib-checks.m4
 @@ -207,7 +207,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
diff --git a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
index d57ebe7869..21439a1334 100644
--- a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
+++ b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
@@ -1,4 +1,4 @@
-From 3d881c112bba765731d581194aae95651819b715 Mon Sep 17 00:00:00 2001
+From 5ce613e9f0c4725aaa82d9a62f76c809e375fe49 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Tue, 19 Jul 2016 01:56:23 -0400
 Subject: [PATCH] squid: use serial-tests config needed by ptest
@@ -9,13 +9,12 @@ serial-tests is required to generate those targets.
 Upstream-Status: Inappropriate [default automake behavior incompatible with ptest]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3b0e9e2..c730212 100644
+index 850fdaf..10968b3 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -10,7 +10,7 @@ AC_PREREQ(2.61)
diff --git a/meta-networking/recipes-daemons/squid/squid_7.6.bb b/meta-networking/recipes-daemons/squid/squid_7.7.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_7.6.bb
rename to meta-networking/recipes-daemons/squid/squid_7.7.bb
index 637d1f6942..b657197fd7 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.6.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://squid.nm \
            "
 
-SRC_URI[sha256sum] = "852178fdc37c5b0786a934fc990c7d2fffc82acf19b2284be209b96431d25992"
+SRC_URI[sha256sum] = "e3bd613b91b1c498ec2992276063342a85cd6edddd5521294e04f44bc055da9b"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://errors/COPYRIGHT;md5=41d117978dbffedc893e8eeca12537d0 \

