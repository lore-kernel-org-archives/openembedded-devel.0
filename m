Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19D8C0218C
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 00:48:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.1277.1737679709428840083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 16:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UsV64TEA;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-215770613dbso19664175ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 16:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737679709; x=1738284509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxxIvtRr8vO+tznK1RSCQJwYeK1CzyMpbp25Ir56J1s=;
        b=UsV64TEA8M1zQAZj4ZfM1QsIDzHYvjeFDoF9lPSNZSm3GaXiEpO0I2d1ggAX98Y2qX
         moM6SWzSJtSh3cB5naFioPQFpYjo6ZkM0shJ4CcWosuPehKbpcVfUb4PGOZ7lGmJ/Adr
         9nzbo3wZftijBdHbcBrKPYsCc+eAxrlh2kZJitcEtUJuESrFiS1cu1vCij6jkPAzHNl7
         G4gSXw7yYSrNsCC39fYwHzqPk2Av1+/qc+mUWaEeOWZIangPAbVvDY6kkxBlNHGXYi3P
         l1cf+LDI/iE6u8bXsbBAeZ+YVjN2vEIIFqxZVuBPlnBDpoMBxpBYx5dsxBCFnGbRJpR3
         +CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737679709; x=1738284509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxxIvtRr8vO+tznK1RSCQJwYeK1CzyMpbp25Ir56J1s=;
        b=X2qPHg6oqDVGXyWndwW4pkRVIWGr/LNauLzpBZrN4N0PHWnrPcdyF21fflpiuex8fw
         j6etW6oyvM2weAweOp7jJR2F7z2pL5fqJ0aSGx6VYOrN478WDw4yqEYjDiD+LO/FvV7M
         fCCb7zJGOsmI3OLdViVmnfiqSIWjDhZChm2qDSjudrU/EwSSkQH1iYOOSTCauvxOJDrg
         7voEYZ+TiclDTbk2XkrQYyGtLeXWQEA6QvWif/6I71VCLuWi3unqX72T3rQoy26DoA/J
         WBhKObBGHXHLmANiU2GxPjLgVeW3JFxFPJgNLQPIbVpMNSaEGZq0kUNhbvOx3S5rS4lj
         hcTg==
X-Gm-Message-State: AOJu0YzofHMyE0TTlL8mhtYmA0Du4kgzcsr6ckf3JbybHiRN6XEtjxnR
	c4CgzQ/BcE3rGF73oLMJLxxehzPmG/hSGd+k7riGFOsqnWwhcLVfxNx0VUeD
X-Gm-Gg: ASbGncuQmb1ST5K6+W/+R0GuECub8LIczGd4v5NpdCmbf+tVLjWJ9t9VFgipR1enHup
	MF5tXO5jhs0dQ9GhHUFTBpRRBGSNgyfCzWsZvy5KlIqFPhMH7mLtiNOTvoo1qMQIp+KtNIsBFT1
	X7j4g50quK5vCxsDRPFT+LlcEUaNYUQem92vc3LDgR9l1h0y1cwF1Iw6vVZHbNEORmJ1Ddhh6Bt
	hA+KJQUzefJhlhtfnUg5XBLRkFzRYynDgI3rDMwT2B4sDMlpnr/t/VieMu56MfKgKJd7yGg
X-Google-Smtp-Source: AGHT+IFre7y1ZVCJVs5AN+foqBoFAoyuuXpdxxBv4bqpCemFy/K9qIyl4XFyow0Rt3693Uc/TVau+Q==
X-Received: by 2002:a17:903:2a88:b0:215:9894:5679 with SMTP id d9443c01a7336-21c34ccef5fmr420160365ad.0.1737679708647;
        Thu, 23 Jan 2025 16:48:28 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::d2e2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac48fe53bddsm475599a12.25.2025.01.23.16.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 16:48:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/5] ncftp: Replace references to ACLOCALEXTRAPATH
Date: Thu, 23 Jan 2025 16:48:22 -0800
Message-ID: <20250124004825.3525640-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124004825.3525640-1-raj.khem@gmail.com>
References: <20250124004825.3525640-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 00:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115041

- ACLOCALEXTRAPATH is gone in core with commit 878e1517d4890b31332a506ce903d57e1d7dff87
- Add patches to fix build with latest clang and gcc
- Drop disabling warnings as the fixes above take care of the problem

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ncftp/0001-ncftp-3.2.7-fix-gcc14.patch    | 20 +++++
 .../ncftp/0002-ncftp-3.2.7-fix-clang.patch    | 73 +++++++++++++++++++
 .../recipes-daemons/ncftp/ncftp_3.2.7.bb      |  8 +-
 3 files changed, 96 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
 create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/0002-ncftp-3.2.7-fix-clang.patch

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch b/meta-networking/recipes-daemons/ncftp/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
new file mode 100644
index 0000000000..9b8a0c778b
--- /dev/null
+++ b/meta-networking/recipes-daemons/ncftp/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
@@ -0,0 +1,20 @@
+fix select arg detection
+
+Reference:
+ https://bugs.gentoo.org/921487
+
+Upstream-Status: Inappropriate [unresponsive contact email address]
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/autoconf_local/aclocal.m4
++++ b/autoconf_local/aclocal.m4
+@@ -4196,7 +4196,7 @@ AC_MSG_CHECKING([types of arguments for
+ #include <sys/select.h>
+ #endif
+ #include <sys/socket.h>	/* MG: always incl */
+-extern select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
++extern int select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
+         [ac_not_found=no ; break 3],ac_not_found=yes)
+       done
+      done
diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/0002-ncftp-3.2.7-fix-clang.patch b/meta-networking/recipes-daemons/ncftp/ncftp/0002-ncftp-3.2.7-fix-clang.patch
new file mode 100644
index 0000000000..a8de816e62
--- /dev/null
+++ b/meta-networking/recipes-daemons/ncftp/ncftp/0002-ncftp-3.2.7-fix-clang.patch
@@ -0,0 +1,73 @@
+Fix compilation with clang-16
+
+aclocal.m4 contains code that no longer compiles: missing headers and missing
+return types.
+
+Reference:
+ https://gitweb.gentoo.org/repo/gentoo.git/tree/net-ftp/ncftp/files/ncftp-3.2.7-fix-clang.patch
+
+Upstream-Status: Inappropriate [unresponsive contact email address]
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/autoconf_local/aclocal.m4
++++ b/autoconf_local/aclocal.m4
+@@ -3057,6 +3057,7 @@ AC_TRY_LINK([
+ #include <sys/uio.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
++#include <string.h>
+ ],[
+ struct sockaddr_un uaddr;
+ 
+@@ -3285,6 +3286,7 @@ AC_TRY_LINK([
+ #ifdef HAVE_RESOLV_H
+ #	include <resolv.h>
+ #endif
++#include <string.h>
+ ],[
+ 	/* function-body */
+ 	int len;
+@@ -3363,6 +3365,7 @@ else
+ #include <stdio.h>
+ #include <stdlib.h>
+ 		 
++			int
+ 			main(int argc, char **argv)
+ 			{
+ 				/* Note:  don't actually call readline,
+@@ -5144,6 +5147,7 @@ do
+ #ifdef HAVE_STDLIB_H
+ #	include <stdlib.h>
+ #endif
++#include <string.h>
+ 
+ #ifdef HAVE_NCURSES_H
+ #	define NCURSES_OPAQUE 0
+@@ -5175,6 +5179,7 @@ do
+ #endif
+ 
+  
++int
+ main(int argc, char **argv)
+ {
+ 	/* Note:  don't actually call curses, since it may block;
+@@ -6509,7 +6514,6 @@ char *malloc();
+ #endif
+ #endif			/* MG */
+ 
+-int
+ int  main(void)
+ {
+ 	char *data, *data2, *data3;
+@@ -6606,8 +6610,9 @@ else
+ 	AC_CACHE_CHECK(whether setvbuf arguments are reversed,
+ 	  ac_cv_func_setvbuf_reversed,
+ 	[AC_TRY_RUN([#include <stdio.h>
++	$include <stdlib.h>
+ 	/* If setvbuf has the reversed format, exit 0. */
+-	main () {
++	int main (void) {
+ 	  /* This call has the arguments reversed.
+ 	     A reversed system may check and see that the address of main
+ 	     is not _IOLBF, _IONBF, or _IOFBF, and return nonzero.  */
diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
index de111cac05..b27bf86154 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
@@ -9,6 +9,8 @@ SRC_URI = "https://www.ncftp.com/public_ftp/ncftp/${BP}-src.tar.xz \
            file://ncftp-configure-use-BUILD_CC-for-ccdv.patch \
            file://unistd.patch \
            file://0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch \
+           file://0001-ncftp-3.2.7-fix-gcc14.patch \
+           file://0002-ncftp-3.2.7-fix-clang.patch \
            "
 SRC_URI[sha256sum] = "d41c5c4d6614a8eae2ed4e4d7ada6b6d3afcc9fb65a4ed9b8711344bef24f7e8"
 
@@ -20,7 +22,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[ccdv] = "--enable-ccdv,--disable-ccdv,,"
 
 EXTRA_OECONF = "--disable-precomp --disable-universal ac_cv_path_TAR=tar"
-ACLOCALEXTRAPATH:append = " -I ${S}/autoconf_local"
+EXTRA_AUTORECONF += "-I ${S}/autoconf_local"
 
 do_install () {
     install -d ${D}${bindir} ${D}${sysconfdir} ${D}${mandir}
@@ -28,7 +30,3 @@ do_install () {
         'SYSCONFDIR=${D}${sysconfdir}' 'mandir=${D}${mandir}' \
         install
 }
-
-# http://errors.yoctoproject.org/Errors/Details/766888/
-# ncftp/3.2.7/ncftp-3.2.7/config.h:358:28: error: passing argument 2 of 'select' from incompatible pointer type [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"

