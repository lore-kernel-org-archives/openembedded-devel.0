Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33ADC44500
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:54 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14723.1782634312126757309
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qZFuvQIP;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30b6dad2382so4557360eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634311; x=1783239111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eULasOgFerkPiuXP7ajxJf1sXKchC/xOE7IX0PMY98o=;
        b=qZFuvQIPUOglVTTgduTwkmY5ir1O2dMHo2ytNfKkI36uau14N7coPGKMK/+t5pHY8p
         6o9ILjhXkOQXiYtExQ+9u0FFqs9qlqpNyJkQOlxbdz/hziYontueivB0vIs8PEVaZZbR
         NYa3eh+2t7rcTlOSnF/Ujc1CWkcjmmbXya5trAilxrwl8WUc4YqKBVg49QynJ82QJcPn
         V+gAa3FnZOUYIJx9RbVtqi46bCq96gi1czvQApqZbjt1EXnNkDTNSH1xaImijGkb2s7D
         fn3lMHqFhzSZ2XWMRkFoPfAgnJN0RtWgPu0R193yn8Ud92UNvL/yrd1BldMtOBsumz3G
         7YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634311; x=1783239111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eULasOgFerkPiuXP7ajxJf1sXKchC/xOE7IX0PMY98o=;
        b=KZ8W1M6c/Ke4kpcXXay6vz/ankmAimxJ5GE20U5p1JQ6NxvRt70v4DZXcYYy1jbEby
         6o/trmz1vlFJDhONLTIKOlVnNgLEqvtke9F0W5JWl5Q6u8kmC3xBSAnLdyiUKvp5lvXg
         kHhZUK/U0QvUTgRvB5IRAXDDqhFD2XvBX0Bh4Z8CwbI7tfOqBmYgHVSjp1ShVub5l6c6
         iugOhGzI/z5ic+ZDtHfEAyxuVDMEN3yeG/N9jety+1+rdS4+bIvQ1kUvnYMXzIufWUBO
         2Ry3mkNrYUVUDsEwTyQrCECOUrLrRNS3a1CH8iNNB1AC46ap2MmyF4RkKrt9HfmoxT7P
         IxOg==
X-Gm-Message-State: AOJu0YxALGejebqliDUxKBdmEWzZRl67y7Rtke3VnyZ264KggZTrBCdJ
	+/6VmcLi6UhivGbeuInYBzi04sDDPLizew01oSxowj9+hQ2oIca3bMPs5cJ+vs7CBMSzfw==
X-Gm-Gg: AfdE7ckll4qiuUqwcBBf2HuMVtPmjru5eJIjjltJFLgFo1ZRu9vnJQyffZGhvGQkOuD
	LFKwgGD4clieNUthsbhU6BtZrI8P0jy6WM9fdflqDc+z7q6udkqfbjTTgHU4TEs0B1Blql1qwjD
	Xwvs3yYlYDm8iIHEB4ivt8Tr2VT1e6ipeIJkdWRN6Ebe/++CFNBOsHs82JW+oNhXeHdsi6Gd3L3
	tVtczrNtni+E17+tTSl/9jUJ1LevWAWc9RlK+PXSt7POBF8ar0pNVQMFVj0ZxROmFdiWXb2Zx7I
	OX2aM4xIHFlU22uIltrlYQW54XQs7tuHdDFKywIzT8+3pKniaek0JS6PrGErDX2uU7IMQf+w0wb
	pCCAAuloxIQ66txLM62IfvwdiaU2Ub10mM8SF6gevQfrTBVJ0E6rFS7SxjWAXYP+YJCZ9IL3lWj
	BF2LDPNCwm1qBDL5brfp9fLujpr5liMQs4rHOHv8qF71dD9CvJDTwn/vHXbR1J9NGjJSU9maplb
	7RLHz+etaps9QlP6o2z84hTl7VO2N0PRqQZ4mFk5zDT2E1+S2+HmkYMX0S2zH5oCaVcGSnvJ0Oa
	S6TLApSKMwTNFXJfjEopu2qruf4y0Q==
X-Received: by 2002:a05:7301:37c4:b0:304:de43:130 with SMTP id 5a478bee46e88-30c84b2d00cmr12690708eec.2.1782634311346;
        Sun, 28 Jun 2026 01:11:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 028/128] ncftp: upgrade 3.2.7 -> 3.3.0
Date: Sun, 28 Jun 2026 01:09:39 -0700
Message-ID: <20260628081122.178348-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127838

Add a patch fixing the autoconf 2.13-era idioms that abort autom4te
under autoconf 2.73, and regenerate the existing patches so they apply
without fuzz.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ining-PREFIX_BINDIR-to-use-new-autoc.patch |  5 +--
 .../ncftp/0001-ncftp-3.2.7-fix-gcc14.patch    | 20 ---------
 .../ncftp/0002-ncftp-3.2.7-fix-clang.patch    | 43 +++----------------
 ...-fix-AC_LANG-usage-for-autoconf-2.73.patch | 29 +++++++++++++
 .../recipes-daemons/ncftp/ncftp/unistd.patch  |  6 ++-
 .../ncftp/{ncftp_3.2.7.bb => ncftp_3.3.0.bb}  |  6 +--
 6 files changed, 43 insertions(+), 66 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
 create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/0003-aclocal-fix-AC_LANG-usage-for-autoconf-2.73.patch
 rename meta-networking/recipes-daemons/ncftp/{ncftp_3.2.7.bb => ncftp_3.3.0.bb} (84%)

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch b/meta-networking/recipes-daemons/ncftp/ncftp/0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch
index efd1f345e6..c33c80d24f 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp/0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch
+++ b/meta-networking/recipes-daemons/ncftp/ncftp/0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch
@@ -11,11 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.in b/configure.in
-index c3ef568..a320c56 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -44,7 +44,7 @@ wi_EXTRA_SYSV_SUNOS_DIRS	dnl	For better curses library on SunOS 4
- 
+@@ -37,7 +37,7 @@
+ wi_EXTRA_SYSV_SUNOS_DIRS	dnl	For better curses library on SunOS 4
  dnl Try to use PATH rather than hardcode the installation path, if possible.
  if test "${prefix-NONE}" != "NONE" && test "$prefix" != "/usr/local" && test "$prefix" != "/usr"; then
 -	AC_DEFINE_UNQUOTED(PREFIX_BINDIR, "$prefix/bin")
diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch b/meta-networking/recipes-daemons/ncftp/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
deleted file mode 100644
index 9b8a0c778b..0000000000
--- a/meta-networking/recipes-daemons/ncftp/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-fix select arg detection
-
-Reference:
- https://bugs.gentoo.org/921487
-
-Upstream-Status: Inappropriate [unresponsive contact email address]
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/autoconf_local/aclocal.m4
-+++ b/autoconf_local/aclocal.m4
-@@ -4196,7 +4196,7 @@ AC_MSG_CHECKING([types of arguments for
- #include <sys/select.h>
- #endif
- #include <sys/socket.h>	/* MG: always incl */
--extern select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
-+extern int select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
-         [ac_not_found=no ; break 3],ac_not_found=yes)
-       done
-      done
diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/0002-ncftp-3.2.7-fix-clang.patch b/meta-networking/recipes-daemons/ncftp/ncftp/0002-ncftp-3.2.7-fix-clang.patch
index a8de816e62..10ddd79505 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp/0002-ncftp-3.2.7-fix-clang.patch
+++ b/meta-networking/recipes-daemons/ncftp/ncftp/0002-ncftp-3.2.7-fix-clang.patch
@@ -10,9 +10,10 @@ Upstream-Status: Inappropriate [unresponsive contact email address]
 
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+diff --git a/autoconf_local/aclocal.m4 b/autoconf_local/aclocal.m4
 --- a/autoconf_local/aclocal.m4
 +++ b/autoconf_local/aclocal.m4
-@@ -3057,6 +3057,7 @@ AC_TRY_LINK([
+@@ -3139,6 +3139,7 @@
  #include <sys/uio.h>
  #include <sys/socket.h>
  #include <sys/un.h>
@@ -20,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ],[
  struct sockaddr_un uaddr;
  
-@@ -3285,6 +3286,7 @@ AC_TRY_LINK([
+@@ -3364,6 +3365,7 @@
  #ifdef HAVE_RESOLV_H
  #	include <resolv.h>
  #endif
@@ -28,43 +29,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ],[
  	/* function-body */
  	int len;
-@@ -3363,6 +3365,7 @@ else
- #include <stdio.h>
- #include <stdlib.h>
- 		 
-+			int
- 			main(int argc, char **argv)
- 			{
- 				/* Note:  don't actually call readline,
-@@ -5144,6 +5147,7 @@ do
- #ifdef HAVE_STDLIB_H
- #	include <stdlib.h>
- #endif
-+#include <string.h>
- 
- #ifdef HAVE_NCURSES_H
- #	define NCURSES_OPAQUE 0
-@@ -5175,6 +5179,7 @@ do
- #endif
- 
-  
-+int
- main(int argc, char **argv)
- {
- 	/* Note:  don't actually call curses, since it may block;
-@@ -6509,7 +6514,6 @@ char *malloc();
- #endif
- #endif			/* MG */
- 
--int
- int  main(void)
- {
- 	char *data, *data2, *data3;
-@@ -6606,8 +6610,9 @@ else
- 	AC_CACHE_CHECK(whether setvbuf arguments are reversed,
- 	  ac_cv_func_setvbuf_reversed,
+@@ -6609,7 +6611,7 @@
  	[AC_TRY_RUN([#include <stdio.h>
-+	$include <stdlib.h>
+ #include <stdlib.h>
  	/* If setvbuf has the reversed format, exit 0. */
 -	main () {
 +	int main (void) {
diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/0003-aclocal-fix-AC_LANG-usage-for-autoconf-2.73.patch b/meta-networking/recipes-daemons/ncftp/ncftp/0003-aclocal-fix-AC_LANG-usage-for-autoconf-2.73.patch
new file mode 100644
index 0000000000..105c73120c
--- /dev/null
+++ b/meta-networking/recipes-daemons/ncftp/ncftp/0003-aclocal-fix-AC_LANG-usage-for-autoconf-2.73.patch
@@ -0,0 +1,29 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Jun 2026 00:00:00 +0000
+Subject: [PATCH] aclocal: fix AC_LANG usage for autoconf 2.73
+
+wi_TRY_RUN_NATIVE used the autoconf 2.13-era idiom
+"ifelse(AC_LANG, CPLUSPLUS, ...)". In modern autoconf AC_LANG is a macro
+that sets the current language rather than expanding to its name, so
+expanding it bare aborts autom4te ("m4 failed with exit status 1").
+ncftp is built as C, so emit the harmless C++ guard unconditionally.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+--- a/autoconf_local/aclocal.m4
++++ b/autoconf_local/aclocal.m4
+@@ -416,10 +416,10 @@
+ [cat > conftest.$ac_ext <<EOF
+ [#]line __oline__ "configure"
+ #include "confdefs.h"
+-ifelse(AC_LANG, CPLUSPLUS, [#ifdef __cplusplus
++#ifdef __cplusplus
+ extern "C" void exit(int);
+ #endif
+-])dnl
++dnl
+ wi_STD_INCLUDES
+ [$1]
+ EOF
diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/unistd.patch b/meta-networking/recipes-daemons/ncftp/ncftp/unistd.patch
index 22e4f7837b..442b0d60b8 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp/unistd.patch
+++ b/meta-networking/recipes-daemons/ncftp/ncftp/unistd.patch
@@ -18,11 +18,13 @@ Upstream-Status: Pending
 Signed-of-by: Khem Raj <raj.khem@gmail.com>
 --- a/autoconf_local/aclocal.m4
 +++ b/autoconf_local/aclocal.m4
-@@ -4220,7 +4220,6 @@ changequote({{, }})dnl
+@@ -4400,9 +4400,6 @@ cat << 'EOF' > "$wi_tmpdir/unistd.c"
  cat << 'EOF' > "$wi_tmpdir/unistd.c"
  #include <confdefs.h>
  
--#include <unistd.h>
+-#ifdef HAVE_UNISTD_H
+-#	include <unistd.h>
+-#endif
  #include <sys/types.h>
  #include <sys/socket.h>
  #include <netinet/in.h>
diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.3.0.bb
similarity index 84%
rename from meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
rename to meta-networking/recipes-daemons/ncftp/ncftp_3.3.0.bb
index c97fbdfe66..54dc8d54e8 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.3.0.bb
@@ -5,14 +5,14 @@ LICENSE = "ClArtistic"
 LIC_FILES_CHKSUM = "file://ncftp/cmds.c;beginline=3;endline=4;md5=9c2390809f71465aa7ff76e03dc14d91"
 DEPENDS = "ncurses"
 
-SRC_URI = "https://www.ncftp.com/public_ftp/ncftp/older_versions/${BP}-src.tar.gz \
+SRC_URI = "https://www.ncftp.com/public_ftp/ncftp/${BP}-src.tar.gz \
            file://ncftp-configure-use-BUILD_CC-for-ccdv.patch \
            file://unistd.patch \
            file://0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch \
-           file://0001-ncftp-3.2.7-fix-gcc14.patch \
            file://0002-ncftp-3.2.7-fix-clang.patch \
+           file://0003-aclocal-fix-AC_LANG-usage-for-autoconf-2.73.patch \
            "
-SRC_URI[sha256sum] = "dbde0d3b4d28ba3a445621e10deaee57a6ba3ced277cc9dbce4052bcddf6cb2a"
+SRC_URI[sha256sum] = "7920f884c2adafc82c8e41c46d6f3d22698785c7b3f56f5677a8d5c866396386"
 
 # Doesn't use automake
 inherit autotools-brokensep pkgconfig

