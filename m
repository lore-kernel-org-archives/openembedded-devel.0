Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B59C5DF75
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:42 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24556.1786747657895363096
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T/8XHcSF;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1391424a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747657; x=1787352457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0XlHc4g0y5DrHxVHS6w05yxyFG1dOQ/+us6kcUxgcw=;
        b=T/8XHcSFzIhA9BW1C8tneyOYih/7ttWErG6UME3kWAV+TJTNFBSewLTXHd/lGaAxIO
         X28bg82kwk/Fw9KjMT2ZgPaCg6s6OpO5tdq0kMeXTDKijH3Wv9SchVNCnySb8AVlnF4O
         VPzZI1S3eQZNCQZn3prndOioGZCnJV5uRihES7huMTvNF5+lkgdyPbKdmrur79wSdHym
         W0kGsuI84/cq7JtJsKfMxvV11uW7LEshqcS15vxISoU4bSrPSNP+of1wzu0xBpRjeP2F
         CeIzS+b80rD0TX9bcA+ZKuefQNj17V/N89YAAcUdnmhw6j1QNWjE5KI6t08d/tTi9lFn
         I9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747657; x=1787352457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0XlHc4g0y5DrHxVHS6w05yxyFG1dOQ/+us6kcUxgcw=;
        b=JSaaBws9qzbA+6kmM6F8iFlxrTgVIXr+Rtfis3VWaw3kMx4+cnOLGuVqaK9UVyTVNe
         ZpET5UO57ziLhAOXhDTD3gkWVDm2+yapq9OB50g/adOsIr1G85Qre7JTo0cq0x8zZiYY
         3a1wMwJkZ2vBYBhzZzuUPpcIMJhWgsrNQbmIwLboUzwAIVYsnPre8fGsxJXS8CNS6TFF
         5zipZUOsJp97L6oMNlwt/rJ292CwMSezFufyoqWLpFqFrj4ImVf7ORnBIzNWRJy3ygzd
         zpmRlDSx8aCu6yLIZrCQilRFUT6bdIydS5zUL3UkEAePNgydeqMbYWaPFF9c1yO/b75c
         +S/A==
X-Gm-Message-State: AOJu0YwpYqbk36jdAoHQQaiHkErcGwJ5KKTlTezpEeYDGaAp6uC+BfEs
	Yc4QBt7n/HvLC94jEMJNNHYyBdIyQ77D0J+sKV6cSpRhnRg0OxSuDE5crv/ztnsp
X-Gm-Gg: AR+sD13vzvFIfstXtAeAacEhat8eLuOMOiGLeE16a0sqDZIQofhyjRuC0E3WEJGORJ1
	jWIFHB5qIC63pPnVQ+Yy7BgwR4W0biGmgmJDObAZvJvuO48X/g2GkxaGS70IKRVj10lZWvs6BGn
	2kp+ZgtamI0q6EBsvLeXG/R9tmfg+SA8N57sWVUyobV3WChXFscbBSgH6jwUraUPuzCroB0LnCC
	52BiOshObAZrY3VPK4kta9p3p1FXNGtQ96VNayj+PM/EYis7lIyf49YDMRkOXT8+i+6O6BS/NaD
	dd44Ily4DcuhyZsSMH1i3qtnf15N9kIRGl7QhuzavNPj3ZWHWrPZsDmy2oHN247dRDP6MgKyiG/
	zx+MEhFlCe2poP9HjpVdwmPkCceOyPYzrzDlWlgItO4rHlKDjRhBG3ynMVICq97IQ7AyskfsBeV
	sZg4SqkLZRIP1OYksXdPRdS/MxoHpv9HPyzQ9xTVJhzAZnHLe9tOdnX4kbaaMA4ror9RUHbR69t
	wZ4sFm5PF9HloyMRu7W49jQ+PG2gO4feRzrcUzx0THR+5N4rGN+WhdpCEGyU02/GLTFm/j1D1H/
	f0mVcWtZVGbCUGk4b6Xpk2bjGDXTlA4njPG1bFL/zke0TUoXyOCOKKdzSBZt6xycMmVnFV3spJS
	9BQiYabr9Gj2BhAEXI/nFiitlh96c2FzhALI4gKldAPDeLA==
X-Received: by 2002:a05:6a20:7d9f:b0:3cc:3d08:da39 with SMTP id adf61e73a8af0-3cc714e62bbmr11098516637.0.1786747656994;
        Fri, 14 Aug 2026 15:47:36 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 097/109] netcat-openbsd: upgrade 1.228 -> 1.238
Date: Fri, 14 Aug 2026 15:45:23 -0700
Message-ID: <20260814224539.1523174-97-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129161

Update the Debian-snapshot SRC_URI to snapshot.debian.org's 1.238-1
timestamp (20260519T203124Z). LIC_FILES_CHKSUM is refreshed since
debian/copyright's md5 changed (license text/terms unchanged,
BSD-3-Clause).

0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch is dropped: Debian's
own quilt-patches/quit-timer.patch (applied before our OE patches via
netcat_do_patch) already changes quit() to take an int sig argument in
1.238-1, making our GCC-15 fix fully redundant.

0001-bundle-own-base64-encode-decode-functions.patch is kept (still
needed, no libc-provided b64_ntop/b64_pton) but rebased: the Makefile
hunk's context line changed from "LIBS=" to "LIBS ?=" and the netcat.c
hunk's context line changed from "static void quit();" to
"static void quit(int sig);" following the quit-timer.patch rebase
upstream; both are updated to apply without fuzz.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-own-base64-encode-decode-functions.patch |  8 +--
 ...fix-netcat-openbsd-ftbfs-with-GCC-15.patch | 51 -------------------
 ...enbsd_1.228.bb => netcat-openbsd_1.238.bb} | 11 ++--
 3 files changed, 9 insertions(+), 61 deletions(-)
 delete mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch
 rename meta-networking/recipes-support/netcat/{netcat-openbsd_1.228.bb => netcat-openbsd_1.238.bb} (65%)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch
index 7e665d777f..49c17acaf0 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.patch
@@ -32,8 +32,8 @@ index 8247cfd..b8d8547 100644
 +SRCS=	netcat.c atomicio.c socks.c base64.c
  
  PKG_CONFIG ?= pkg-config
--LIBS=  `$(PKG_CONFIG) --libs libbsd` -lresolv
-+LIBS=  `$(PKG_CONFIG) --libs libbsd`
+-LIBS ?= `$(PKG_CONFIG) --libs libbsd` -lresolv
++LIBS ?= `$(PKG_CONFIG) --libs libbsd`
  OBJS=  $(SRCS:.c=.o)
  CFLAGS=  -g -O2
  LDFLAGS=  -Wl,--no-add-needed
@@ -362,8 +362,8 @@ index a0fb51b..9c4ed23 100644
 +++ b/netcat.c
 @@ -239,6 +239,9 @@ char *proto_name(int, int);
  static int connect_with_timeout(int, const struct sockaddr *, socklen_t, int);
- static void quit();
- 
+ static void quit(int sig);
+
 +int    b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
 +int    b64_pton(char const *src, u_char *target, size_t targsize);
 +
diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch
deleted file mode 100644
index d574ee0b67..0000000000
--- a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 4ca437b129252635e89694446945e69912300ceb Mon Sep 17 00:00:00 2001
-From: "mark.yang" <mark.yang@lge.com>
-Date: Wed, 16 Apr 2025 20:35:46 +0900
-Subject: [PATCH] fix netcat-openbsd: ftbfs with GCC-15
-
-* fix build failure with GCC-15
-netcat.c:1443:41: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
- 1443 |                         signal(SIGALRM, quit);
-      |                                         ^~~~
-      |                                         |
-      |                                         void (*)(void)
-In file included from netcat.c:100:
-TOPDIR/tmp/work/core2-64-oe-linux/netcat-openbsd/1.195/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
-   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
-      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
-netcat.c:241:13: note: 'quit' declared here
-  241 | static void quit();
-      |             ^~~~
-TOPDIR/tmp/work/core2-64-oe-linux/netcat-openbsd/1.195/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
-   72 | typedef void (*__sighandler_t) (int);
-      |                ^~~~~~~~~~~~~~
-make: *** [Makefile:17: netcat.o] Error 1
-
-Upstream-Status: Submitted [https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1097448]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- netcat.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/netcat.c b/netcat.c
-index 62d01d8..7367f47 100644
---- a/netcat.c
-+++ b/netcat.c
-@@ -237,7 +237,7 @@ ssize_t fillbuf(int, unsigned char *, size_t *);
- 
- char *proto_name(int, int);
- static int connect_with_timeout(int, const struct sockaddr *, socklen_t, int);
--static void quit();
-+static void quit(int sig);
- 
- int    b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
- int    b64_pton(char const *src, u_char *target, size_t targsize);
-@@ -2347,7 +2347,7 @@ usage(int ret)
-  * quit()
-  * handler for a "-q" timeout (exit 0 instead of 1)
-  */
--static void quit()
-+static void quit(__attribute__((unused)) int sig)
- {
- 	exit(0);
- }
diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.228.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.238.bb
similarity index 65%
rename from meta-networking/recipes-support/netcat/netcat-openbsd_1.228.bb
rename to meta-networking/recipes-support/netcat/netcat-openbsd_1.238.bb
index 82753b9f42..01eafa06d0 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.228.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.238.bb
@@ -2,19 +2,18 @@ require netcat.inc
 SUMMARY = "OpenBSD Netcat"
 HOMEPAGE = "http://ftp.debian.org"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=7c58e21ba8c9e76c25f46b2182b23bb8"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=258066eab695382a48c91d09e865d7c3"
 
 DEPENDS += "glib-2.0 libbsd"
 do_patch[depends] = "quilt-native:do_populate_sysroot"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20250301T025722Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
-           http://snapshot.debian.org/archive/debian/20250301T025722Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}-1.debian.tar.xz;name=netcat-patch;subdir=${BP} \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20260519T203124Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
+           http://snapshot.debian.org/archive/debian/20260519T203124Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}-1.debian.tar.xz;name=netcat-patch;subdir=${BP} \
            file://0001-bundle-own-base64-encode-decode-functions.patch \
-           file://0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch \
            "
 
-SRC_URI[netcat.sha256sum] = "e501b0239db0d8f981b964adee74effe80e6337e5d402a00515a6df8d933269e"
-SRC_URI[netcat-patch.sha256sum] = "7989cc18b3ffa4ef1da57149bd3fc03999546a91c35b82b49caf4d758015c573"
+SRC_URI[netcat.sha256sum] = "9f72a37d85dec1366309fdb0172be4e67e09ec26e89f13156315149e17c02479"
+SRC_URI[netcat-patch.sha256sum] = "eefeb9ff863ebd4384274b132a3ff9b492aacb244e445c34dbfb36cfee596930"
 
 inherit pkgconfig
 

