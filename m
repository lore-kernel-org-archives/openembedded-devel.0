Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC886B7AF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:07:18 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so3671546wes.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2014 23:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cHM5sDWLvWHtxRiiV0tUpvfsSyu9SJCgTfDJsUVkeyQ=;
	b=d1fZ+D+udKX41vVm4Xa/KCHXqvqHId1b9bUiL16WU+t4JWfAWyO2ybBuyLaj7ir1Ws
	p7dLHUT1uxs4R8YkGLMZE4Ppz0sRCyum3md+BiE1++K1sFLWrXf3RjP4LCaM8OZcrMJw
	dFAsD9Z9BlTGOjKVhzLun6psKiP25d18jot4Kdo60n1uyqsP1G1W2PoNf0sl/+WI+IAw
	3jmTUTK7Fgiu2fAgDW2R0HhlCuypmOckk03HEsZXEIX3fbaT6mVwdO3DdrUrpW32QR0a
	20ICyx0MwRnlkJ4d2XjRAd1J7Fh0aNpR3GhyxgVgKejHnApVDhwMVuDTtMrv2LoTQdOS
	icag==
X-Gm-Message-State: ALoCoQkvE/d2l9G2ov2Y/DzDDCdAs0Af27cnX7iz/iuL1fULls769ALe/DC6dkBWJ1yOQSi3ZbSI
X-Received: by 10.180.189.69 with SMTP id gg5mr1100470wic.40.1389337639660;
	Thu, 09 Jan 2014 23:07:19 -0800 (PST)
Received: from localhost ([2001:610:612:0:223:32ff:fece:c738])
	by mx.google.com with ESMTPSA id xl18sm1121727wib.9.2014.01.09.23.07.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 23:07:19 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jan 2014 08:07:11 +0100
Message-Id: <1389337631-1844-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1389337631-1844-1-git-send-email-koen@dominion.thruhere.net>
References: <1389337631-1844-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCH 4/4] dovecot: add 2.2.10
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
X-List-Received-Date: Fri, 10 Jan 2014 07:07:19 -0000

Dovecot is an IMAP server.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...c-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch | 91 ++++++++++++++++++++++
 .../recipes-support/dovecot/dovecot_2.2.10.bb      | 44 +++++++++++
 2 files changed, 135 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
new file mode 100644
index 0000000..6f5c279
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
@@ -0,0 +1,91 @@
+From 483f120603ada8db680085e3f462396da937e036 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 8 Jan 2014 09:30:36 +0100
+Subject: [PATCH] configure.ac: convert AC_TRY_RUN to AC_TRY_LINK statements
+
+This is not completely safe, but it's the least invasive fix.
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Upstream-status: Inappropriate
+---
+ configure.ac | 23 +++++++----------------
+ 1 file changed, 7 insertions(+), 16 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 95984bb..dff1f87 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -499,13 +499,10 @@ have_ioloop=no
+ 
+ if test "$ioloop" = "best" || test "$ioloop" = "epoll"; then
+   AC_CACHE_CHECK([whether we can use epoll],i_cv_epoll_works,[
+-    AC_TRY_RUN([
++    AC_TRY_LINK([
+       #include <sys/epoll.h>
+-  
+-      int main()
+-      {
+-	return epoll_create(5) < 1;
+-      }
++     ], [ 
++       epoll_create(5) < 1;
+     ], [
+       i_cv_epoll_works=yes
+     ], [
+@@ -551,15 +548,13 @@ have_notify=none
+ if test "$notify" = "" || test "$notify" = "inotify" ; then
+   dnl * inotify?
+   AC_CACHE_CHECK([whether we can use inotify],i_cv_inotify_works,[
+-    AC_TRY_RUN([
++    AC_TRY_LINK([
+       #define _GNU_SOURCE
+       #include <sys/ioctl.h>
+       #include <fcntl.h>
+       #include <sys/inotify.h>
+       #include <stdio.h>
+-    
+-      int main()
+-      {
++    ], [
+ 	int wd, fd;
+ 	char * fn = "/tmp";
+       
+@@ -581,8 +576,6 @@ if test "$notify" = "" || test "$notify" = "inotify" ; then
+ 	inotify_rm_watch (fd, wd);
+   
+ 	close (fd);
+-	return 0;
+-      }
+     ], [
+       i_cv_inotify_works=yes
+     ], [
+@@ -670,7 +663,7 @@ fi
+ dnl * Old glibcs have broken posix_fallocate(). Make sure not to use it.
+ dnl * It may also be broken in AIX.
+ AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
+-  AC_TRY_RUN([
++  AC_TRY_LINK([
+     #define _XOPEN_SOURCE 600
+     #include <stdio.h>
+     #include <stdlib.h>
+@@ -679,7 +672,7 @@ AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
+     #if defined(__GLIBC__) && (__GLIBC__ < 2 || __GLIBC_MINOR__ < 7)
+       possibly broken posix_fallocate
+     #endif
+-    int main() {
++   ], [
+       int fd = creat("conftest.temp", 0600);
+       int ret;
+       if (fd == -1) {
+@@ -688,8 +681,6 @@ AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate_works,[
+       }
+       ret = posix_fallocate(fd, 1024, 1024) < 0 ? 1 : 0;
+       unlink("conftest.temp");
+-      return ret;
+-    }
+   ], [
+     i_cv_posix_fallocate_works=yes
+   ], [
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
new file mode 100644
index 0000000..4b754b2
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.10.bb
@@ -0,0 +1,44 @@
+SUMMARY = "Dovecot is an open source IMAP and POP3 email server"
+DESCRIPTION = "Dovecot is an open source IMAP and POP3 email server for Linux/UNIX-like systems, written with security primarily in mind. Dovecot is an excellent choice for both small and large installations. It's fast, simple to set up, requires no special administration and it uses very little memory."
+
+LICENSE = "LGPLv2.1 & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a981379bd0f1c362f8d1d21515e5b30b"
+
+SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
+           file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
+          "
+SRC_URI[md5sum] = "037e9c9e07d9dbff54dcff09f280fc8c"
+SRC_URI[sha256sum] = "75592483d40dc4f76cc3b41af40caa4be80478946a699d46846d5d03e4d2e09b"
+
+DEPENDS = "openssl lzma zlib bzip2"
+
+inherit autotools
+
+PACKAGECONFIG ??= " \
+                   ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                  "
+
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
+PACKAGECONFIG[ldap] = "--with-ldap=plugin,--without-ldap,openldap,"
+
+# From native build in armv7a-hf/eglibc
+CACHED_CONFIGUREVARS += "i_cv_signed_size_t=no \
+                         i_cv_gmtime_max_time_t=32 \
+                         i_cv_signed_time_t=yes \
+                         i_cv_mmap_plays_with_write=yes \
+                         i_cv_fd_passing=yes \
+                         i_cv_c99_vsnprintf=yes \
+                         lib_cv___va_copy=yes \
+                         lib_cv_va_copy=yes \
+                         lib_cv_va_val_copy=yes \
+                        "
+
+# hardcode epoll() to avoid running unsafe tests
+# BSD needs kqueue and uclibc poll()
+EXTRA_OECONF = " --with-ioloop=epoll"
+
+FILES_${PN}-staticdev += "${libdir}/dovecot/*/*.a"
+FILES_${PN}-dev += "${libdir}/dovecot/*.so"
+FILES_${PN}-dbg += "${libdir}/dovecot/*/.debug"
+
-- 
1.8.4.2


