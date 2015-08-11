Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1F40776952
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:21 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so64819776wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=OSbZAQ9WRT3xkHsSHTaUOexSojUQF4+nHL5DdbmFM4M=;
	b=Mz6WA2Z3E9s8pjwS0+Ar6Qm7msWxAFSsxdFWuyvLFeSca/GwUm76zj5tQc7pAme6+u
	KKU+dzrOuang0Yyxy80NHtgKrH1CB7vLDNyb47/heBDjyQYb8lItAQEVoJWpvM7+OHTI
	ENQyeWXW4PpaatIUQLSrLGxNzLxP/aNpMuYt9AYN2KoK8rDwuxFkObApHs0X8jCX4IqJ
	PKOnB/hWC/1s0QGkbs+I6yxniGdyt+2qFvDNHWO6TTbUwbcamXpAGt7KgordL7u438S0
	9+9PIo0KZnRZ+N/ZX3GXOGkCCtLgYYVr+KEpa5hiAZN2p2pH1Wqpn1+7PcUxtGr1tDxI
	KY7w==
X-Received: by 10.194.87.4 with SMTP id t4mr58659507wjz.84.1439279902088;
	Tue, 11 Aug 2015 00:58:22 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:34 +0200
Message-Id: <1439279859-1815-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 12/17] gparted: update to 0.23.0
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

a patch better than mine was applied mainline

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...c-use-pkg-config-to-check-for-version-of-.patch | 68 ----------------------
 .../{gparted_0.20.0.bb => gparted_0.23.0.bb}       |  9 +--
 2 files changed, 3 insertions(+), 74 deletions(-)
 delete mode 100644 meta-gnome/recipes-extended/gparted/gparted/0001-configure.ac-use-pkg-config-to-check-for-version-of-.patch
 rename meta-gnome/recipes-extended/gparted/{gparted_0.20.0.bb => gparted_0.23.0.bb} (57%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted/0001-configure.ac-use-pkg-config-to-check-for-version-of-.patch b/meta-gnome/recipes-extended/gparted/gparted/0001-configure.ac-use-pkg-config-to-check-for-version-of-.patch
deleted file mode 100644
index 1c99ff5..0000000
--- a/meta-gnome/recipes-extended/gparted/gparted/0001-configure.ac-use-pkg-config-to-check-for-version-of-.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From a39d205ec3c6db6fe98aa2c7f8352db767557f60 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 12 Nov 2014 11:26:19 +0100
-Subject: [PATCH] configure.ac: use pkg-config to check for version of gparted
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-running test programs causes headaches when cross-compiling
-
-Upstream-Status: submitted [1]
-
-[1] https://bugzilla.gnome.org/show_bug.cgi?id=740004
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac | 34 ++++++----------------------------
- 1 file changed, 6 insertions(+), 28 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 37025b0..17bb686 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -48,35 +48,13 @@ LIBPARTED_REQUIRED_VERSION='1.7.1'
- AC_MSG_CHECKING([for libparted >= $LIBPARTED_REQUIRED_VERSION])
- LIBPARTED_REQUIRED_INT=`echo "$LIBPARTED_REQUIRED_VERSION" |
- 	$AWK -F. '{print $1 * 10000 + $2 * 100 + $3}'`
--AC_RUN_IFELSE(
--	[AC_LANG_SOURCE(
--		[[
--#include <stdio.h>
--#include <stdlib.h>
--#include <parted/parted.h>
--
--int main()
--{
--	const char *version = ped_get_version();
--	if (version == NULL)
--	{
--		fprintf(stderr, "ERROR: ped_get_version() returned NULL\n");
--		return EXIT_FAILURE;
--	}
--	printf("%s\n", version);
--	return EXIT_SUCCESS;
--}
--		]]
--	)],
--	dnl Run test program again to cache libparted version.
--	[LIBPARTED_FOUND_VERSION=`./conftest$EXEEXT`
--	 LIBPARTED_FOUND_INT=`echo "$LIBPARTED_FOUND_VERSION" |
--		$AWK -F. '{print $1 * 10000 + $2 * 100 + $3}'`
--	 test "$LIBPARTED_FOUND_INT" -ge "$LIBPARTED_REQUIRED_INT" ||
-+
-+LIBPARTED_FOUND_VERSION="`pkg-config libparted --modversion`"
-+LIBPARTED_FOUND_INT=`echo "$LIBPARTED_FOUND_VERSION" |
-+	$AWK -F. '{print $1 * 10000 + $2 * 100 + $3}'`
-+
-+test "$LIBPARTED_FOUND_INT" -ge "$LIBPARTED_REQUIRED_INT" ||
- 		AC_MSG_ERROR([*** libparted too old.  Require libparted >= $LIBPARTED_REQUIRED_VERSION but only found libparted $LIBPARTED_FOUND_VERSION.])
--	],
--	[AC_MSG_ERROR([*** Error querying libparted version.  Check config.log for details.])]
--)
- 
- 
- dnl Check for libparted >= 2.2 for improved informing the kernel to
--- 
-1.8.3.1
-
diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.20.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb
similarity index 57%
rename from meta-gnome/recipes-extended/gparted/gparted_0.20.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb
index 30eac8e..0705439 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.20.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb
@@ -5,12 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit autotools pkgconfig
 
-SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
-    file://0001-configure.ac-use-pkg-config-to-check-for-version-of-.patch \
-"
-SRC_URI[md5sum] = "d9df57f9d4b4dbd148644774f8bbccfb"
-SRC_URI[sha256sum] = "9b34d73d4519352a7e7344c8403ef61253be1b4db3ff332c397b0b1eb5c1ddc2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "5901dca33ced32213cccb13a2713dea8"
+SRC_URI[sha256sum] = "7fd1dddf29814c2982f55ab765b8918561e1b5dabf792012c66b4d3ba25da754"
 
 DEPENDS = "glib-2.0 gtkmm parted"
 
-- 
2.1.0


