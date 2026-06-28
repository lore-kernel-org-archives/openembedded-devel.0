Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65F8C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:43 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69116.1782634303366871803
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JsW+s+kV;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30c591fb1cbso3619095eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634303; x=1783239103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wMxhC2DyxjDa1Cf/Ex3tPA/hcajnfYQUJq6CDMEGTI=;
        b=JsW+s+kV48+CZ4+Da7rg8izHThaGzKg8dO/Hv0jLTIMkfJSBFAaQq7mHjcQrtakUkd
         8d0do+YmndkdeYByzWo3RO1i38IpYGBwkhRi01NyqbHcuPqsSCxB3VS+1bwDzcd+Sybk
         0f4TTHDRX2cNGpMIO60+jNlIDwkwanLPnsL7y00m1j3hyZfIkfPdBvLC+brqsBBkvg7R
         K7rS4WBne0rTp7ty0tfEBhmMKkczYi2Sz2QTk42NuSKYzgJvbMgQchB/hljHlLfoGCWi
         HqH9ZThK/6J1/teHnh86uWt7EjgJ0swrGGRKzP+LwhbvVsDwb1dDc38Ie3i1Wjr6sju7
         hf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634303; x=1783239103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wMxhC2DyxjDa1Cf/Ex3tPA/hcajnfYQUJq6CDMEGTI=;
        b=ZYxdBmBo2lnCR2tBHkmXvu8Co9JlBrLlxUQDoci6CeEVwRiCcXL03CMGG3Hq/ld0bC
         6iK+c0AxeE7Ec7GXOk1YqkX0eD0qmLmvLF/c2PJe5GVPlOWnxHe/1qFRQ6kpcR/7bYuU
         5Je+2KDq9Ap2pI9sHeiEzVnYfi3Ki+Tdg0J8JcvIVMgwHX1HBQIB+kyV9JeRFXyMaakT
         kYcPkmRJ1qfDtLOwLkFZcWha+kAA2yydNVu9WTtuATuqfMAdhEJsE6bBL3tR+vduf3NZ
         dIjatJW8gix4C38AXnDPHBjMc7GwAC6LuggchF8JteVzchi4ar9lt2IXdxiw6QGpC6dy
         ezAg==
X-Gm-Message-State: AOJu0Yz/Z1Y2Du2Iwf7vA5dBtW1mVl5mcfdVkBZCN2taFQoSDv9QglRf
	yUO3MgvmIprRgjKaPoh+yMWDTiHwW4X9K/pDs8L87VTB/U4Opt2OzRXqs6h6MbBPc75oBg==
X-Gm-Gg: AfdE7cktPENCgr5xXYA7JGzY9Xmom+y3VK8CfCJ8zc0ZffWS54FyWnFBY7a+7Q63/xi
	Ok5iW9DD1zQS6P7wAl68tgmZypTiCPaRKkekrzOEs7YBOwqKlQ/ALBYXDf0iC+wXF5lAoctLCiR
	YyCwCWe74SoGNhs5Q5728S97HKmOmBF+4poD4vc17/CM/bzzOJ47BrmTtly3qQIXbIhzPM3xZpD
	TPxYqKLTTGTMH+zMOqeGOH2x/bE8vMBaxJqLIficdanT564gFSfn4VvCc6Ih0als5iW94Sc1HLo
	iEwclYFxCgP/uoVzOrMe7/NW7dPzO9hPaDQPhmtzosywQWAuUFx5Rq/nnPcxfDHzx6af5SHpkt1
	yJGk95nL8vfDUQ3ej3YWnMo2dJhfbBPyCjAeZo4NcdjBrQHhYf38qml0BRulvW1XJx1MB941JWE
	CYTCrYgwuae3J/PxELSxHQ0Ji9o3jZVyeppm40DwXyMhuC5vwmN2S2XQMFF1ixTd0ZVLUSGXsjT
	LCEXua96TZiHHDWFZ9DjbG0yC8RAkpWzFyKnuk5WCfwS3uo0AE/eQa7eyGLvPOqLF5TaiFgSJu1
	7SnnJrIfyUQ9beG0C4JEevpnC/m6RCm0Q1M/Sgo1
X-Received: by 2002:a05:7301:a83:b0:30c:b4c0:e785 with SMTP id 5a478bee46e88-30cb4c0fae2mr4599227eec.24.1782634302688;
        Sun, 28 Jun 2026 01:11:42 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 019/128] nbd: upgrade 3.26.1 -> 3.27.0
Date: Sun, 28 Jun 2026 01:09:30 -0700
Message-ID: <20260628081122.178348-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127829

Drop the patches now present in 3.27.0.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...1-nbd-client-Fix-build-on-musl-gcc14.patch | 43 ----------------
 ...8b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch | 50 -------------------
 .../nbd/{nbd_3.26.1.bb => nbd_3.27.0.bb}      |  4 +-
 3 files changed, 1 insertion(+), 96 deletions(-)
 delete mode 100644 meta-networking/recipes-support/nbd/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch
 delete mode 100644 meta-networking/recipes-support/nbd/nbd/f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch
 rename meta-networking/recipes-support/nbd/{nbd_3.26.1.bb => nbd_3.27.0.bb} (78%)

diff --git a/meta-networking/recipes-support/nbd/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch b/meta-networking/recipes-support/nbd/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch
deleted file mode 100644
index 15b439e255..0000000000
--- a/meta-networking/recipes-support/nbd/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 909d20a2ee4afecd5ae4cc5950c8ee599f72972d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 May 2024 17:48:13 -0700
-Subject: [PATCH] nbd-client: Fix build on musl + gcc14
-
-GCC-14 has promoted incompatible-pointer-types warning into error which is
-now flagged especially with when building on musl
-
-Fixes following error
-
-| ../nbd-3.26.1/nbd-client.c: In function 'openunix':
-| ../nbd-3.26.1/nbd-client.c:345:27: error: passing argument 2 of 'connect' from incompatible pointer type [-Wincompatible-pointer-types]
-|   345 |         if (connect(sock, &un_addr, sizeof(un_addr)) == -1) {
-|       |                           ^~~~~~~~
-|       |                           |
-|       |                           struct sockaddr_un *
-| In file included from ../nbd-3.26.1/nbd-client.c:25:
-| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/nbd/3.26.1/recipe-sysroot/usr/include/sys/socket.h:386:19: note: expected 'const struct sockaddr *' but argument is of type 'struct sockaddr_un *'
-|   386 | int connect (int, const struct sockaddr *, socklen_t);
-|       |                   ^~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://lists.debian.org/nbd/2024/05/msg00012.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- nbd-client.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nbd-client.c b/nbd-client.c
-index 8d1101b..7b25c67 100644
---- a/nbd-client.c
-+++ b/nbd-client.c
-@@ -342,7 +342,7 @@ int openunix(const char *path) {
- 		return -1;
- 	};
- 
--	if (connect(sock, &un_addr, sizeof(un_addr)) == -1) {
-+	if (connect(sock, (struct sockaddr*)&un_addr, sizeof(un_addr)) == -1) {
- 		err_nonfatal("CONNECT failed");
- 		close(sock);
- 		return -1;
--- 
-2.45.1
-
diff --git a/meta-networking/recipes-support/nbd/nbd/f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch b/meta-networking/recipes-support/nbd/nbd/f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch
deleted file mode 100644
index 716ded55be..0000000000
--- a/meta-networking/recipes-support/nbd/nbd/f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c Mon Sep 17 00:00:00 2001
-From: Dave Jones <dave.jones@canonical.com>
-Date: Thu, 14 Mar 2024 11:13:05 +0000
-Subject: [PATCH] Fix the check & no cases of enable_manpages
-
-Currently, running "configure --disable-manpages" while docbook2man *is*
-installed results in the error "don't know what to do here" when it
-should disable manpages.
-
-There also appears to be a missing conditional at the start of the line;
-there's closing un-matched ]) at the end of the line. Still, at this
-point the check can be done in pure shell; no need for AC macros. I've
-also removed the confusing m4_divert_text call on the check case. Not
-sure why that was there, but it appears unnecessary.
-
-Upstream-Status: Backport [https://github.com/NetworkBlockDevice/nbd/commit/f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -328,7 +328,7 @@ AC_MSG_CHECKING([whether man pages are r
- AC_ARG_ENABLE([manpages],
- 	AS_HELP_STRING([--disable-manpages], [Do not install man pages]),
- 	[],
--	[: m4_divert_text([DEFAULTS], [enable_manpages=check])]
-+	[enable_manpages=check]
- )
- AC_MSG_RESULT([$enable_manpages])
- 
-@@ -337,9 +337,14 @@ AS_IF([test "x$enable_manpages" != "xno"
- 	])
- AS_IF([test "x$enable_manpages" = "xyes" -a "x$DB2M" = "x"], [
-        AC_MSG_ERROR([docbook2man not found, but is required to build manpages])
--	],
--      [test "x$DB2M" != "x"], [enable_manpages=yes],
--       [AC_MSG_ERROR([don't know what to do here])])
-+	])
-+if test "x$enable_manpages" = "xcheck"; then
-+	if test "x$DB2M" = "x"; then
-+		enable_manpages=no
-+	else
-+		enable_manpages=yes
-+	fi
-+fi
- AC_MSG_CHECKING([whether to build manpages])
- AC_MSG_RESULT([$enable_manpages])
- 
diff --git a/meta-networking/recipes-support/nbd/nbd_3.26.1.bb b/meta-networking/recipes-support/nbd/nbd_3.27.0.bb
similarity index 78%
rename from meta-networking/recipes-support/nbd/nbd_3.26.1.bb
rename to meta-networking/recipes-support/nbd/nbd_3.27.0.bb
index a69d35fa96..2dcf01204d 100644
--- a/meta-networking/recipes-support/nbd/nbd_3.26.1.bb
+++ b/meta-networking/recipes-support/nbd/nbd_3.27.0.bb
@@ -7,10 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "autoconf-archive bison-native glib-2.0 libnl zlib bison-native"
 
 SRC_URI = "https://github.com/NetworkBlockDevice/${BPN}/releases/download/${BP}/${BP}.tar.xz \
-           file://f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch \
-           file://0001-nbd-client-Fix-build-on-musl-gcc14.patch \
            "
-SRC_URI[sha256sum] = "f0cf509fa5b20b1a07f7904eb637e9b47d3e30b6ed6f00075af5d8b701c78fef"
+SRC_URI[sha256sum] = "422a02adcdbab01c622307c6babeda5c84ca6c6f2d4e0b29936e6ae9b6a7662f"
 
 inherit autotools pkgconfig
 

