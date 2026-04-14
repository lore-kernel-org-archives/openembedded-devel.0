Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3519F531E6
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 02:15:49 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9434.1776132946089120592
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 19:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ac40xltY;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2d7bdb5ffffso5574326eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 19:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776132945; x=1776737745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UiuL7kIbcJNheuxhw4zeVYr5wyojg9JuHgdRAPzZJ1s=;
        b=Ac40xltYAWfCLIgmV2rr2cKIG61cVGFaYmpD/6kiH53fWMpCgYsC5QcsSU/ZwPg1C/
         dmAgxcZQSa9/PYRaiMY5xqmQE1r0ZgH+E1QLWO4qV7fjeJHhXbTZwpx8xAU9zn6EjTvr
         fwT6mxnfprcjY0f8Kjx+vwnyT4Z+xvGpEgbAywU7uwiDophyPZoTahyeQpgRnbTpBLyn
         dBO0m13btLBHVmLHFV0wMG1eCXGAZZYGFsZacsYMo2O8pez8XtkJiiP6tjAvFHaz7qd6
         hg1OX8N07NehLinzufghspqP0b3u3igV/qYQ9ZCK6I4qCeKEiPBzELD9ilq5FxTylYa9
         qHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776132945; x=1776737745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiuL7kIbcJNheuxhw4zeVYr5wyojg9JuHgdRAPzZJ1s=;
        b=GLVIvdZ0iz6x58uAUkNPG4+ePiT0dkUa04jHwT0EaNWGpq3tEpJLzm/5M/TsplZ1rQ
         DkbsVz6jET8yVi+aJF0ui5cWIyFoLng6KlNuWE2zqvOG54m1ajhCQ8ni/UD09StjpPsI
         A/BHNdVI3FWmlFdsZ+79d1CcDO2e9+JyV8jnfJmvEyXlOike6nAB6j1JB/1d3AjAy0+A
         xACpyhaOnJVJdW9JyqR/xos842WHWSRCBogyhnqil3qubSCaorRPxWfnTFkw9OueMLjG
         FR/Y1h2ZtFWm1Rm5ImQDVH4y1/XgBuJ4z8ADuXB6NOnbBmiYeSPl5bGEAZDdcb9k73tG
         JSXw==
X-Gm-Message-State: AOJu0YxXgBZaX3hs6BywP9Q6G5ocnMZdvxQhX7ShpRbzpOjUmTIS3Ckn
	X/OGBhKx3I1jLAKyOXDvX4aRD/lJLaQtRUH9BCxDstKXv43NUBI8T08C2j/Ep5W7
X-Gm-Gg: AeBDiev6kQTPgmary2emCZFY937FAAl0Jq7f2CbmwwNSm1UnjWYDM6YwXCRsbvNmLnu
	84zbugIVu2WrE0x6N7eWge5HNMGHLhxDlrfJCuOm0pnrg0P9k0vWognLpEZDRAIrqkURenQKV9a
	TMkfqqmtwJmUOQCmIbs+sb9Oki4NdkmuRzoaGpFEcIsFMr64KjC5V+bOdKA0GJ+oWzhpAZJbgQg
	w0H+nxakERGeeaJPGXafsvjo+pJilZ1t69u8i1A1F6FxBGQ/uSkCe9JXtdSAPyP6t1Valq9Vrgm
	R5C1iCdJ5Fzm21Nku/rUkCt9w5cqCHWTtWyk4VUaaSm7IuTwSo7v+ruNVPOPViQVnQG6PSw/qQe
	u3fqKmNQZZ+IUYvgtopfYzdiZ6TG3PN8ftxnXTHAgBwY4hlhNfsgcHC2/kzQrH5bV14X/xLhRM7
	pZZyDO+IXQSpSFmADsjqcWmAiVzKBeUHbVuepb9FcdHC9E1FehS/iXpbfqJntnhe2d+b6bRsaKn
	6ZU7DnNRD4T+Er3vI+3MWJ4CF4nUSEDipQcXFPyJhUphFQNfE0+IV7kdhzr8twLPCbl7FvoSTvD
	KOtX/FNX28MP4xLxsRUCWEBmTRMh+bOHsl6T2DyPv4zK64zMf4RwGeodoSZUZQ==
X-Received: by 2002:a05:7301:e0a:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2d58aa831d2mr10464102eec.28.1776132944891;
        Mon, 13 Apr 2026 19:15:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d8dee27fccsm8264758eec.28.2026.04.13.19.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 19:15:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH] ntp: Fix build with -std=gnu23
Date: Mon, 13 Apr 2026 19:15:41 -0700
Message-ID: <20260414021541.3206069-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 02:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126292

Backport a patch from openLDAP to fix the configure errors with clang-22 -std=gnu23
Fix another issue by dropping C89 signatures in favor of C99 function prototypes

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...fix-compatibility-with-stricter-C99-.patch | 102 ++++++++++++++++++
 ...pkgver-colcomp.c-Convert-K-R-functio.patch |  32 ++++++
 .../recipes-support/ntp/ntp_4.2.8p18.bb       |   2 +
 3 files changed, 136 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/0001-ITS-10011-build-fix-compatibility-with-stricter-C99-.patch
 create mode 100644 meta-networking/recipes-support/ntp/ntp/0001-colcomp-sntp-libpkgver-colcomp.c-Convert-K-R-functio.patch

diff --git a/meta-networking/recipes-support/ntp/ntp/0001-ITS-10011-build-fix-compatibility-with-stricter-C99-.patch b/meta-networking/recipes-support/ntp/ntp/0001-ITS-10011-build-fix-compatibility-with-stricter-C99-.patch
new file mode 100644
index 0000000000..6558fae4ae
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/0001-ITS-10011-build-fix-compatibility-with-stricter-C99-.patch
@@ -0,0 +1,102 @@
+From 58c160ce28328f9a75d41c283ee9b94c10d6ec62 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Thu, 9 Feb 2023 23:17:53 +0000
+Subject: [PATCH] ITS#10011 build: fix compatibility with stricter C99
+ compilers
+
+Fix the following warnings:
+- -Wimplicit-int (fatal with Clang 16)
+- -Wimplicit-function-declaration (fatal with Clang 16)
+- -Wincompatible-function-pointer-types (fatal with Clang 16)
+- -Wint-conversion (fatal with Clang 15)
+- Old style prototypes (K&R, removed from C23)
+
+These warnings-now-error led to misconfigurations and failure to build
+OpenLDAP, as the tests used during configure caused the wrong results
+to be emitted.
+
+For more information, see LWN.net [0] or LLVM's Discourse [1], the Gentoo wiki [2],
+or the (new) c-std-porting mailing list [3].
+
+[0] https://lwn.net/Articles/913505/
+[1] https://discourse.llvm.org/t/configure-script-breakage-with-the-new-werror-implicit-function-declaration/65213
+[2] https://wiki.gentoo.org/wiki/Modern_C_porting
+[3] hosted at lists.linux.dev.
+
+Bug: https://bugs.gentoo.org/871288
+
+Upstream-Status: Pending
+
+Signed-off-by: Sam James <sam@gentoo.org>
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ sntp/m4/openldap.m4 | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/sntp/m4/openldap.m4 b/sntp/m4/openldap.m4
+index 49ffb87..2db6aa3 100644
+--- a/sntp/m4/openldap.m4
++++ b/sntp/m4/openldap.m4
+@@ -154,6 +154,7 @@ fi
+ if test $ol_cv_header_stdc = yes; then
+   # /bin/cc in Irix-4.0.5 gets non-ANSI ctype macros unless using -ansi.
+ AC_RUN_IFELSE([AC_LANG_SOURCE([[#include <ctype.h>
++#include <stdlib.h>
+ #ifndef HAVE_EBCDIC
+ #	define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
+ #	define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
+@@ -610,8 +611,12 @@ AC_DEFUN([OL_PTHREAD_TEST_INCLUDES], [[
+ #define NULL (void*)0
+ #endif
+
++#ifdef __STDC__
++static void *task(void *p)
++#else
+ static void *task(p)
+ 	void *p;
++#endif
+ {
+ 	return (void *) (p == NULL);
+ }
+@@ -667,9 +672,13 @@ AC_DEFUN([OL_PTHREAD_TEST_FUNCTION],[[
+ AC_DEFUN([OL_PTHREAD_TEST_PROGRAM], [
+ AC_LANG_SOURCE([OL_PTHREAD_TEST_INCLUDES
+
++#ifdef __STDC__
++int main(int argc, char **argv)
++#else
+ int main(argc, argv)
+ 	int argc;
+ 	char **argv;
++#endif
+ {
+ OL_PTHREAD_TEST_FUNCTION
+ }
+@@ -791,7 +800,7 @@ AC_CACHE_CHECK([for compatible POSIX regex],ol_cv_c_posix_regex,[
+ #include <sys/types.h>
+ #include <regex.h>
+ static char *pattern, *string;
+-main()
++int main(void)
+ {
+ 	int rc;
+ 	regex_t re;
+@@ -818,7 +827,8 @@ AC_DEFUN([OL_C_UPPER_LOWER],
+ [AC_CACHE_CHECK([if toupper() requires islower()],ol_cv_c_upper_lower,[
+ 	AC_RUN_IFELSE([AC_LANG_SOURCE([[
+ #include <ctype.h>
+-main()
++#include <stdlib.h>
++int main(void)
+ {
+ 	if ('C' == toupper('C'))
+ 		exit(0);
+@@ -873,7 +883,7 @@ AC_DEFUN([OL_NONPOSIX_STRERROR_R],
+ 			]])],[ol_cv_nonposix_strerror_r=yes],[ol_cv_nonposix_strerror_r=no])
+ 	else
+ 		AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-			main() {
++			int main(void) {
+ 				char buf[100];
+ 				buf[0] = 0;
+ 				strerror_r( 1, buf, sizeof buf );
diff --git a/meta-networking/recipes-support/ntp/ntp/0001-colcomp-sntp-libpkgver-colcomp.c-Convert-K-R-functio.patch b/meta-networking/recipes-support/ntp/ntp/0001-colcomp-sntp-libpkgver-colcomp.c-Convert-K-R-functio.patch
new file mode 100644
index 0000000000..39f7e537c1
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/0001-colcomp-sntp-libpkgver-colcomp.c-Convert-K-R-functio.patch
@@ -0,0 +1,32 @@
+From cd54486bdced460c174fcb98680ad5ffe64f906a Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 13 Apr 2026 19:09:24 -0700
+Subject: [PATCH] colcomp: sntp/libpkgver/colcomp.c: Convert K&R function
+ definition to ANSI C style
+
+Replace old-style K&R function declaration with modern ANSI C prototype
+syntax for colcomp(). Also remove trailing whitespace after return type.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ sntp/libpkgver/colcomp.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/sntp/libpkgver/colcomp.c b/sntp/libpkgver/colcomp.c
+index 4b151e3..29ecb3e 100644
+--- a/sntp/libpkgver/colcomp.c
++++ b/sntp/libpkgver/colcomp.c
+@@ -33,10 +33,8 @@
+ #endif
+
+
+-int
+-colcomp (s1, s2)
+-     register char *s1;
+-     register char *s2;
++int
++colcomp (register char *s1, register char *s2)
+ {
+   int hilo = 0;			/* comparison value */
+
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
index e59725e3e9..6f9bb01c02 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
@@ -17,6 +17,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch \
            file://0001-sntp-Fix-types-in-check-for-pthread_detach.patch \
            file://0001-include-fix-build-failure-with-glibc-2.43-_Generic-m.patch \
+           file://0001-ITS-10011-build-fix-compatibility-with-stricter-C99-.patch \
+           file://0001-colcomp-sntp-libpkgver-colcomp.c-Convert-K-R-functio.patch \
            file://ntpd \
            file://ntp.conf \
            file://ntpd.service \

