Return-Path: <radek.dostal@streamunlimited.com>
Received: from bsmtp4.bon.at (bsmtp4.bon.at [195.3.86.186])
	by mail.openembedded.org (Postfix) with ESMTP id C4EF66012A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2015 09:40:19 +0000 (UTC)
Received: from rdostal-desktop.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp4.bon.at (Postfix) with ESMTPSA id 3p6WCQ6tnlz5tlG;
	Fri, 27 Nov 2015 10:40:18 +0100 (CET)
From: Radek Dostal <radek.dostal@streamunlimited.com>
To: openembedded-devel@lists.openembedded.org,
	martin.jansa@gmail.com
Date: Fri, 27 Nov 2015 10:39:39 +0100
Message-Id: <1448617179-27159-1-git-send-email-radek.dostal@streamunlimited.com>
X-Mailer: git-send-email 1.9.1
Cc: Radek Dostal <radek.dostal@streamunlimited.com>
Subject: [meta-oe][PATCH] htop: delete not used patch
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
X-List-Received-Date: Fri, 27 Nov 2015 09:40:21 -0000

remove-proc-test.patch was not used since commit
78909f65d8 "htop: upgrade to version 1.0.2"

Signed-off-by: Radek Dostal <radek.dostal@streamunlimited.com>
---
 meta-oe/recipes-support/htop/htop/remove-proc-test.patch | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-oe/recipes-support/htop/htop/remove-proc-test.patch

diff --git a/meta-oe/recipes-support/htop/htop/remove-proc-test.patch b/meta-oe/recipes-support/htop/htop/remove-proc-test.patch
deleted file mode 100644
index 3185fdd..0000000
--- a/meta-oe/recipes-support/htop/htop/remove-proc-test.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- htop-0.6.6/configure.ac	2007-05-21 13:06:15.000000000 -0500
-+++ htop-0.6.6-cross/configure.ac	2007-11-16 14:12:16.000000000 -0600
-@@ -58,8 +58,8 @@
-    fi,
-    AC_DEFINE(PROCDIR, "/proc", [Path of proc filesystem]))
- 
--AC_CHECK_FILE($PROCDIR/stat,,AC_MSG_ERROR(Cannot find /proc/stat. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help.))
--AC_CHECK_FILE($PROCDIR/meminfo,,AC_MSG_ERROR(Cannot find /proc/meminfo. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help.))
-+#AC_CHECK_FILE($PROCDIR/stat,,AC_MSG_ERROR(Cannot find /proc/stat. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help.))
-+#AC_CHECK_FILE($PROCDIR/meminfo,,AC_MSG_ERROR(Cannot find /proc/meminfo. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help.))
- 
- AC_CONFIG_FILES([Makefile])
- AC_OUTPUT
-- 
1.9.1


