Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web12.2748.1588967535539479069
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 12:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==397780a3020==cbing@cybernetics.com)
X-ASG-Debug-ID: 1588967525-0fb3b0649e6a8f70001-aWHRdb
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id MVErqN93wBi3szXO for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 15:52:05 -0400 (EDT)
X-Barracuda-Envelope-From: cbing@cybernetics.com
X-ASG-Whitelist: Client
Received: from [10.157.1.18] (account cbing HELO cy-rd-cb)
  by cybernetics.com (CommuniGate Pro SMTP 5.1.14)
  with ESMTPA id 9948901 for openembedded-devel@lists.openembedded.org; Fri, 08 May 2020 15:52:05 -0400
Date: Fri, 8 May 2020 15:52:46 -0400
From: "Claude Bing" <cbing@cybernetics.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] php: update fix for opcache link issue in 7.4.4
Message-ID: <20200508155246.70b26f2d@cy-rd-cb>
X-ASG-Orig-Subj: [meta-oe][PATCH] php: update fix for opcache link issue in 7.4.4
Organization: Cybernetics
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1588967525
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 3497
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The source of the issue is the update for PHP 7.4 support in
0001-opcache-config.m4-enable-opcache.patch (commit 7cc7a9ec).  Instead
of working around the issue in the recipe file, update the patch to
restore the call to PHP_ADD_LIBRARY().

Signed-off-by: Claude Bing <cbing@cybernetics.com>
---
 ...001-opcache-config.m4-enable-opcache.patch | 19 +++++++++++++------
 meta-oe/recipes-devtools/php/php_7.4.4.bb     |  5 -----
 2 files changed, 13 insertions(+), 11 deletions(-)

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
index 68005c0bb..f74533c1d 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -111,11 +111,6 @@ export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
 CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
 
-# link against librt (libc) if opcache is specified in order to avoid the
-# following error:
-# Failed loading /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined symbol: shm_unlink
-LDFLAGS += "${@ " -lrt " if bb.utils.contains('PACKAGECONFIG', 'opcache', 'true', 'false', d) else "" }"
-
 # Adding these flags enables dynamic library support, which is disabled by
 # default when cross compiling
 # See https://bugs.php.net/bug.php?id=60109
-- 
2.17.1

