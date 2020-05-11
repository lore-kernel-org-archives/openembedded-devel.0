Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web11.13043.1589207304984187833
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 07:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==4003dd60f2f==cbing@cybernetics.com)
X-ASG-Debug-ID: 1589207303-0fb3b0649e755170001-aWHRdb
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id Zi38cmZpKPRW3aRD for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2020 10:28:23 -0400 (EDT)
X-Barracuda-Envelope-From: cbing@cybernetics.com
X-ASG-Whitelist: Client
Received: from [10.157.1.18] (account cbing HELO cy-rd-cb)
  by cybernetics.com (CommuniGate Pro SMTP 5.1.14)
  with ESMTPA id 9950947 for openembedded-devel@lists.openembedded.org; Mon, 11 May 2020 10:28:22 -0400
Date: Mon, 11 May 2020 10:29:07 -0400
From: "Claude Bing" <cbing@cybernetics.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] php: fix opcache link issue in 7.4.4
Message-ID: <20200511102907.34c93726@cy-rd-cb>
X-ASG-Orig-Subj: [meta-oe][dunfell][PATCH] php: fix opcache link issue in 7.4.4
Organization: Cybernetics
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1589207303
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 3282
X-Barracuda-BRTS-Status: 1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The source of this issue are the updates to
0001-opcache-config.m4-enable-opcache.patch (commit 7cc7a9ec).  Instead
of working around the issue in the recipe file, update the patch to
restore the call to PHP_ADD_LIBRARY().

  (cherry picked from commit 3cfd16be4e1b62efe8ac640cecc080709cf2b9f9)

Signed-off-by: Claude Bing <cbing@cybernetics.com>
---
 ...001-opcache-config.m4-enable-opcache.patch | 19 +++++++++++++------
 meta-oe/recipes-devtools/php/php_7.4.4.bb     |  6 ++++++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
index ee0d5edcd..1f3e683a0 100644
--- a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
@@ -1,4 +1,7 @@
-opcache/config.m4: enable opcache
+From a74b42098aededd296ec6a3cd4cf5a17e59d6f29 Mon Sep 17 00:00:00 2001
+From: Claude Bing <cbing@cybernetics.com>
+Date: Fri, 8 May 2020 10:15:32 -0400
+Subject: [PATCH] opcache/config.m4: enable opcache
 
 We can't use AC_TRY_RUN to run programs in a cross compile environment.
 Set
@@ -12,15 +15,18 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 
 update patch to version 7.4.4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+fix issue linking with librt
+Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
- ext/opcache/config.m4 | 194 +-------------------------------------------------
- 1 file changed, 3 insertions(+), 191 deletions(-)
+ ext/opcache/config.m4 | 195 +-----------------------------------------
+ 1 file changed, 4 insertions(+), 191 deletions(-)
 
 diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index 6c40caf..84ddf1e 100644
+index 6c40cafc1c..6569aa9e1c 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -23,201 +23,13 @@ if test "$PHP_OPCACHE" != "no"; then
+@@ -23,201 +23,14 @@ if test "$PHP_OPCACHE" != "no"; then
    AC_CHECK_FUNCS([mprotect])
  
    AC_MSG_CHECKING(for sysvipc shared memory support)
@@ -222,9 +228,10 @@ index 6c40caf..84ddf1e 100644
 -    AC_MSG_RESULT([no])
 -  ])
 +  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
++  PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
  
    PHP_NEW_EXTENSION(opcache,
  	ZendAccelerator.c \
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
index ff4c28e13..52bf87038 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -110,6 +110,12 @@ export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
 CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
 
+# Adding these flags enables dynamic library support, which is disabled by
+# default when cross compiling
+# See https://bugs.php.net/bug.php?id=60109
+CFLAGS += " -DHAVE_LIBDL "
+LDFLAGS += " -ldl "
+
 EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
 
 acpaths = ""
-- 
2.17.1

