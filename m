Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.11399.1599063305506161028
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 09:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PON5vAns;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id z15so2513654plo.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=re9aAQo3nIH1A8o/ZOeRKgZmgRoSk4xCwNnpdshX6WM=;
        b=PON5vAnsNLgljZMZvQ8nyAKol9BCcTLVbCkD5alSce6veRtxE6d+6X9W3d1wDTG63R
         57cboWz9RYX/qXjTBiFNcN3V+altcvf3cXt7i2MO8f+NtQlNeqLHej4xafIsejs1O7Ph
         C8058qq2a8D3forDHqm/3RIJgElbYDn4lcSuWgNpeEPOJpqa7SnouCj2g+IHFu9OqDHV
         Z9Ljd2aVcP0Pz7KA1PTKgX6BrlEiNIBYQSMQnHOpI4gdCem5cyDp8BPCTwRFPgOgGSs1
         6dzsZer/99EbHxrMnuuQVRXB11o4Ipdeh0nLvhW2ljvxZG0RDCJpDZSQi7BfYEPP8D8T
         K3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=re9aAQo3nIH1A8o/ZOeRKgZmgRoSk4xCwNnpdshX6WM=;
        b=Nnjd88ya2k6vvpiNFJBVI1FeLwgIMMfJnc/OS+W+AvqQKHLPMy1BMDa/HDIkvoUWut
         IXhTIl6iiMniVCTUVwNF5IDeZCZuwB2qyyQ1xhu/vygfahPhxfSWMH28C6GLUB0JKVX9
         4X+CvYmpRoQG0ALVjU3AU0sB4oHib/buwW5btbx+gUHqS9o9EeE3zaI+kRL1khlDqMf0
         Latgr81G+MndqXa1i/rdj5SGWXY1Q3HZBQPzt+FFPw0Lqm9kHgMsRfriKpgBQO/sWtR6
         hSy9hASxAK1zfx0UVgSdn8BFZ+rtK61FaFpCj0zWSBMuI9giVLGv1LujfiBxRg5WuZRI
         Qvpw==
X-Gm-Message-State: AOAM533J3qamR5XrWqYmDvsAPwYlfbcP/itRZJUs2GkAGbpRGjeyzPQH
	4LOgiaZDMcT1KIkF8oQX64ITiPbAdQ0=
X-Google-Smtp-Source: ABdhPJy4VEJWXLi+w2rS6Y3xMPgqZ3s4TpNL9idHSdR1oFdumM34jTKkyqZtPkUV4GviedzkusNflg==
X-Received: by 2002:a17:902:a981:: with SMTP id bh1mr2533825plb.157.1599063304747;
        Wed, 02 Sep 2020 09:15:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3889:a22b:6ae0:235a])
        by smtp.gmail.com with ESMTPSA id q127sm4218940pfb.61.2020.09.02.09.15.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 09:15:04 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] dhcpcd: pkg moved to core
Date: Wed,  2 Sep 2020 09:15:00 -0700
Message-Id: <20200902161500.22518-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902161500.22518-1-akuster808@gmail.com>
References: <20200902161500.22518-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dhcpcd/dhcpcd_9.1.4.bb                    | 29 ------------
 ...e-INCLUDEDIR-to-prevent-build-issues.patch | 45 -------------------
 ...-on-systems-that-do-not-define-ALIGN.patch | 34 --------------
 3 files changed, 108 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
 delete mode 100644 meta-networking/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
 delete mode 100644 meta-networking/recipes-connectivity/dhcpcd/files/0002-Fix-compile-without-IPv6-on-systems-that-do-not-define-ALIGN.patch

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
deleted file mode 100644
index 766df3a2b0..0000000000
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SECTION = "console/network"
-SUMMARY = "dhcpcd - a DHCP client"
-DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
-               computer to work on the attached networks without trouble \
-               and mostly without configuration."
-
-HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9674cc803c5d71306941e6e8b5c002f2"
-
-UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
-
-SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
-           file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
-	   file://0002-Fix-compile-without-IPv6-on-systems-that-do-not-define-ALIGN.patch"
-
-SRC_URI[sha256sum] = "5fe133e5497d8af6d26bd6e6b8dd48ab12d124d6cc4cefe6de6536ff97f76820"
-
-inherit pkgconfig autotools-brokensep
-
-PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-
-PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
-
-EXTRA_OECONF = "--enable-ipv4"
-
-FILES_${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
diff --git a/meta-networking/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta-networking/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
deleted file mode 100644
index 37d2344438..0000000000
--- a/meta-networking/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From aa9e3982c1e75ad49945a62f5e262279c7a905a4 Mon Sep 17 00:00:00 2001
-From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
-Date: Sun, 13 Jan 2019 01:50:52 +0100
-Subject: [PATCH] remove INCLUDEDIR to prevent build issues
-
-Upstream-Status: Pending
-
-Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
----
- configure | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/configure b/configure
-index 6c81e0db..32dea2b4 100755
---- a/configure
-+++ b/configure
-@@ -20,7 +20,6 @@ BUILD=
- HOST=
- HOSTCC=
- TARGET=
--INCLUDEDIR=
- DEBUG=
- FORK=
- STATIC=
-@@ -72,7 +71,6 @@ for x do
- 	--mandir) MANDIR=$var;;
- 	--datadir) DATADIR=$var;;
- 	--with-ccopts|CFLAGS) CFLAGS=$var;;
--	-I|--includedir) INCLUDEDIR="$INCLUDEDIR${INCLUDEDIR:+ }-I$var";;
- 	CC) CC=$var;;
- 	CPPFLAGS) CPPFLAGS=$var;;
- 	PKG_CONFIG) PKG_CONFIG=$var;;
-@@ -309,9 +307,6 @@ if [ -n "$CPPFLAGS" ]; then
- 	echo "CPPFLAGS=" >>$CONFIG_MK
- 	echo "CPPFLAGS+=	$CPPFLAGS" >>$CONFIG_MK
- fi
--if [ -n "$INCLUDEDIR" ]; then
--	echo "CPPFLAGS+=	$INCLUDEDIR" >>$CONFIG_MK
--fi
- if [ -n "$LDFLAGS" ]; then
- 	echo "LDFLAGS=" >>$CONFIG_MK
- 	echo "LDFLAGS+=	$LDFLAGS" >>$CONFIG_MK
--- 
-2.17.2 (Apple Git-113)
-
diff --git a/meta-networking/recipes-connectivity/dhcpcd/files/0002-Fix-compile-without-IPv6-on-systems-that-do-not-define-ALIGN.patch b/meta-networking/recipes-connectivity/dhcpcd/files/0002-Fix-compile-without-IPv6-on-systems-that-do-not-define-ALIGN.patch
deleted file mode 100644
index 2c7f24ebfa..0000000000
--- a/meta-networking/recipes-connectivity/dhcpcd/files/0002-Fix-compile-without-IPv6-on-systems-that-do-not-define-ALIGN.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7643b6615aab4de290ead6c1a6b56f10a82bbe6f Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Sat, 4 Jul 2020 13:21:09 +0100
-Subject: [PATCH] Fix compile without IPv6 on systems that do not define ALIGN
-
-Upstream-Status: backport
-
----
- src/dhcpcd.h | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/src/dhcpcd.h b/src/dhcpcd.h
-index 61a6a081..d9719c0a 100644
---- a/src/dhcpcd.h
-+++ b/src/dhcpcd.h
-@@ -96,7 +96,6 @@ TAILQ_HEAD(if_head, interface);
- 
- #include "privsep.h"
- 
--#ifdef INET6
- /* dhcpcd requires CMSG_SPACE to evaluate to a compile time constant. */
- #if defined(__QNX) || \
- 	(defined(__NetBSD_Version__) && __NetBSD_Version__ < 600000000)
-@@ -113,10 +112,6 @@ TAILQ_HEAD(if_head, interface);
- #define	CMSG_SPACE(len)	(ALIGN(sizeof(struct cmsghdr)) + ALIGN(len))
- #endif
- 
--#define IP6BUFLEN	(CMSG_SPACE(sizeof(struct in6_pktinfo)) + \
--			CMSG_SPACE(sizeof(int)))
--#endif
--
- struct passwd;
- 
- struct dhcpcd_ctx {
-- 
2.17.1

