Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1107E7615E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 08:46:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98718602"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jul 2015 16:50:22 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6M8iqZE028044
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 16:44:53 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 22 Jul 2015 16:46:40 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Jul 2015 16:46:36 +0800
Message-ID: <1437554796-1815-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH] dovecot: upgrade 2.2.10 -> 2.2.18
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
X-List-Received-Date: Wed, 22 Jul 2015 08:46:44 -0000
Content-Type: text/plain

Dropped building-rquota_xdr.c-depend-on-rquota.h.patch,since 2.2.18 fixed the problem.

Update 0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch,since
the file configure.ac has been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 ...c-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch | 57 ++++++----------------
 .../building-rquota_xdr.c-depend-on-rquota.h.patch | 28 -----------
 .../{dovecot_2.2.10.bb => dovecot_2.2.18.bb}       |  5 +-
 3 files changed, 18 insertions(+), 72 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dovecot/dovecot/building-rquota_xdr.c-depend-on-rquota.h.patch
 rename meta-networking/recipes-support/dovecot/{dovecot_2.2.10.bb => dovecot_2.2.18.bb} (92%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
index 6f5c279..f862350 100644
--- a/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
@@ -1,21 +1,23 @@
-From 483f120603ada8db680085e3f462396da937e036 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 8 Jan 2014 09:30:36 +0100
+From 07150f3a27681e034f18ab2ed2b68914c1e10af6 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Sat, 18 Jul 2015 05:03:57 +0900
 Subject: [PATCH] configure.ac: convert AC_TRY_RUN to AC_TRY_LINK statements
 
 This is not completely safe, but it's the least invasive fix.
 
+Upstream-Status: pending
+
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-Upstream-status: Inappropriate
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
- configure.ac | 23 +++++++----------------
- 1 file changed, 7 insertions(+), 16 deletions(-)
+ configure.ac | 15 +++++----------
+ 1 file changed, 5 insertions(+), 10 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 95984bb..dff1f87 100644
+index 3b32614..94ec002 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -499,13 +499,10 @@ have_ioloop=no
+@@ -519,13 +519,10 @@ have_ioloop=no
  
  if test "$ioloop" = "best" || test "$ioloop" = "epoll"; then
    AC_CACHE_CHECK([whether we can use epoll],i_cv_epoll_works,[
@@ -27,39 +29,12 @@ index 95984bb..dff1f87 100644
 -      {
 -	return epoll_create(5) < 1;
 -      }
-+     ], [ 
-+       epoll_create(5) < 1;
-     ], [
-       i_cv_epoll_works=yes
-     ], [
-@@ -551,15 +548,13 @@ have_notify=none
- if test "$notify" = "" || test "$notify" = "inotify" ; then
-   dnl * inotify?
-   AC_CACHE_CHECK([whether we can use inotify],i_cv_inotify_works,[
--    AC_TRY_RUN([
-+    AC_TRY_LINK([
-       #define _GNU_SOURCE
-       #include <sys/ioctl.h>
-       #include <fcntl.h>
-       #include <sys/inotify.h>
-       #include <stdio.h>
--    
--      int main()
--      {
 +    ], [
- 	int wd, fd;
- 	char * fn = "/tmp";
-       
-@@ -581,8 +576,6 @@ if test "$notify" = "" || test "$notify" = "inotify" ; then
- 	inotify_rm_watch (fd, wd);
-   
- 	close (fd);
--	return 0;
--      }
++      epoll_create(5) < 1;
      ], [
-       i_cv_inotify_works=yes
+       i_cv_epoll_works=yes
      ], [
-@@ -670,7 +663,7 @@ fi
+@@ -653,7 +650,7 @@ fi
  dnl * Old glibcs have broken posix_fallocate(). Make sure not to use it.
  dnl * It may also be broken in AIX.
  AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
@@ -68,16 +43,16 @@ index 95984bb..dff1f87 100644
      #define _XOPEN_SOURCE 600
      #include <stdio.h>
      #include <stdlib.h>
-@@ -679,7 +672,7 @@ AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
+@@ -662,7 +659,7 @@ AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
      #if defined(__GLIBC__) && (__GLIBC__ < 2 || __GLIBC_MINOR__ < 7)
        possibly broken posix_fallocate
      #endif
 -    int main() {
-+   ], [
++    ], [
        int fd = creat("conftest.temp", 0600);
        int ret;
        if (fd == -1) {
-@@ -688,8 +681,6 @@ AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
+@@ -671,8 +668,6 @@ AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
        }
        ret = posix_fallocate(fd, 1024, 1024) < 0 ? 1 : 0;
        unlink("conftest.temp");
diff --git a/meta-networking/recipes-support/dovecot/dovecot/building-rquota_xdr.c-depend-on-rquota.h.patch b/meta-networking/recipes-support/dovecot/dovecot/building-rquota_xdr.c-depend-on-rquota.h.patch
deleted file mode 100644
index 11d9d8c..0000000
--- a/meta-networking/recipes-support/dovecot/dovecot/building-rquota_xdr.c-depend-on-rquota.h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-[PATCH] building rquota_xdr.c depends on rquota.h
-
-Upstream-status: Pending
-
-rquota.h is generated automatically, and building rquota_xdr.c
-needs rquota.h, so add the dependency on rquota.h for rquota_xdr.c
-
-Signed-off-by: rongqing li <rli2@yow-blade4.wrs.com>
----
- src/plugins/quota/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/plugins/quota/Makefile.am b/src/plugins/quota/Makefile.am
-index 8a6988d..3626d79 100644
---- a/src/plugins/quota/Makefile.am
-+++ b/src/plugins/quota/Makefile.am
-@@ -70,7 +70,7 @@ RQUOTA_XDR = rquota_xdr.c
- RQUOTA_XDR_LO = rquota_xdr.lo
- #RQUOTA_X = /usr/include/rpcsvc/rquota.x
- RQUOTA_X = $(srcdir)/rquota.x
--rquota_xdr.c: Makefile $(RQUOTA_X)
-+rquota_xdr.c: Makefile $(RQUOTA_X) rquota.h
- 	if [ "$(top_srcdir)" != "$(top_builddir)" ]; then \
- 	  cp $(RQUOTA_X) $(top_builddir)/src/plugins/quota/; \
- 	fi; \
--- 
-1.8.2.1
-
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
similarity index 92%
rename from meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
index 4b2f6c0..f3177c3 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a981379bd0f1c362f8d1d21515e5b30b"
 
 SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
-           file://building-rquota_xdr.c-depend-on-rquota.h.patch \
            file://dovecot.service \
            file://dovecot.socket"
 
-SRC_URI[md5sum] = "037e9c9e07d9dbff54dcff09f280fc8c"
-SRC_URI[sha256sum] = "75592483d40dc4f76cc3b41af40caa4be80478946a699d46846d5d03e4d2e09b"
+SRC_URI[md5sum] = "1e42eb3b69544c447ad882d7858f3630"
+SRC_URI[sha256sum] = "b6d8468cea47f1227f47b80618f7fb872e2b2e9d3302adc107a005dd083865bb"
 
 DEPENDS = "openssl xz zlib bzip2 libcap"
 
-- 
1.8.4.2


