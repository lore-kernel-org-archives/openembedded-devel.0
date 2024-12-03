Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC79E69EBA
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8068.1733185011864318003
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YE4GDL5Q;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185012; x=1764721012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hjgVxsMLNR1uC2Nk8OubHmZuKvI8jnlOMArt4I030BU=;
  b=YE4GDL5Qwv5JFGjCsz9buqVm1LRfefofIhqZJYEtRufjkycU210QxxWV
   lXn3ozw1xtIIqlChUkOIKbgXJB+rMtgbCsy+Vq6pFZ/MxjBEr3+tY+AK9
   zJc3yxebcVPBjEpUUBA+625n7lclK4hEMuw27i+j8C263DXyx54vLQsTC
   xaTJVE366ESNhTZaXPw6FzCOJwuXyGR75n6V3+31YoM5c8zAReSERRUQa
   VFRC5eItzrJ4zWpjXcjpj9mUgalEZuPkRoagTB8ch+ZfPmjEsA1ekpgWB
   NYBbyO2HGu6eC10FxOkE0grKgS5frxSCDEIvqwIpTWIY2e+bwhUdKMsEt
   A==;
X-CSE-ConnectionGUID: P3uePoX9QQmehBAMYykwEQ==
X-CSE-MsgGUID: 2HY4uVagRW6xOL/WZQ+97w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="182406401"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="182406401"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:50 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 569FADC699
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 275B3D4BC2
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BD0A920071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:47 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 684A71A0003;
	Tue,  3 Dec 2024 08:16:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/34] evolution-data-server: upgrade 3.54.1 -> 3.54.2
Date: Tue,  3 Dec 2024 08:16:10 +0800
Message-Id: <1733184999-27041-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--7.082200-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yTo39wOA02LhQRlUSJjs8Z8H4DTIEE89jMEj
	oFgm7EFK2FE7W2Z5UHqpXR7NA6GzIogrKnsJ1GRgv5rsfD7H2pk/xRB6OGnb2rKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYmHuYMFu+jpUaxXbwRJk57xZNYSHk3Zr0enkXQERoCWftDgmvV2H8PldHL
	0OBPA3VItUMxfMQaZFMU9HuIO9+upnLZrdrkdgaXzmmMD/HXF+6SmFaeUM9ve4GyTmeN+AbNWrF
	FAqqfvH+H5zDDs0S2psV8o+pqqC6J5rk1/xA3Ohh2VzUlo4HVOb+3jd3k4Rfpa5+gecZQ1+5QO4
	P7F5MJwbr3UVaT2Z5SZAMkTWXOgor78SC5iivxwURSScn+QSXt0H8LFZNFG7/nnwJ52QYi/M/gW
	u/p797u2lQY5SyoJVGPVXQdLErAMngZHxkuncQUGJi1UKJVu/ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114146

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-I-574-Fails-to-build-link-against-icu-76.1.patch
removed since it's included in 3.54.2

Changelog:
==========
- libedataserverui: Avoid initializing the icon_theme when building introspection data
- Fails to build/link against icu 76.1
- Correct certificate key usage constants

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../evolution-data-server.bb                  | 18 ++++----
 .../evolution-data-server.inc                 |  4 +-
 ...Fails-to-build-link-against-icu-76.1.patch | 42 -------------------
 3 files changed, 10 insertions(+), 54 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-I-574-Fails-to-build-link-against-icu-76.1.patch

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
index f0b43256d7..713d5ae289 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
@@ -11,16 +11,14 @@ inherit pkgconfig gsettings gobject-introspection mime-xdg features_check gtk-do
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI += " \
-    file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
-    file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
-    file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
-    file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
-    file://0004-call-native-helpers.patch \
-    file://0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch \
-    file://0001-I-574-Fails-to-build-link-against-icu-76.1.patch \
-    file://iconv-detect.h \
-"
+SRC_URI += "file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
+           file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
+           file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
+           file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
+           file://0004-call-native-helpers.patch \
+           file://0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch \
+           file://iconv-detect.h \
+           "
 
 LKSTRFTIME = "HAVE_LKSTRFTIME=ON"
 LKSTRFTIME:libc-musl = "HAVE_LKSTRFTIME=OFF"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 516f94a665..f9dc173a9e 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 GNOMEBASEBUILDCLASS = "cmake"
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "25b336c48a6babc36321d88094b382aeaf18abcbab4a9438b3fff90c29e105ae"
-PV = "3.54.1"
+SRC_URI[archive.sha256sum] = "11f0253089c8abf456cffda3fe658a35a0de2b8ae93d8f257d6b020ae7963d20"
+PV = "3.54.2"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-I-574-Fails-to-build-link-against-icu-76.1.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-I-574-Fails-to-build-link-against-icu-76.1.patch
deleted file mode 100644
index 9f1bbfe5e0..0000000000
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-I-574-Fails-to-build-link-against-icu-76.1.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 12666816df679118fe50f15ba2da3244c62ac215 Mon Sep 17 00:00:00 2001
-From: Milan Crha <mcrha@redhat.com>
-Date: Tue, 19 Nov 2024 11:15:12 +0100
-Subject: [PATCH] I#574 - Fails to build/link against icu 76.1
-
-Closes https://gitlab.gnome.org/GNOME/evolution-data-server/-/issues/574
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/evolution-data-server/-/pipelines/761044]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 42721b3..fcaa188 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -376,13 +376,13 @@ endif(WIN32)
- # ICU started shipping pkg-config files but it's not present
- # on many systems, if we don't find the pkg-config
- # file then let's fallback on a manual check
--pkg_check_modules(ICU icu-i18n)
-+pkg_check_modules(ICU icu-i18n icu-uc)
- 
- if(NOT ICU_FOUND)
- 	CHECK_INCLUDE_FILE(unicode/ucol.h HAVE_UNICODE_UCOL_H)
- 	if(NOT HAVE_UNICODE_UCOL_H)
- 		message(FATAL_ERROR "ICU unicode/ucol.h not found; icu-i18n is required")
--	endif(HAVE_UNICODE_UCOL_H)
-+	endif(NOT HAVE_UNICODE_UCOL_H)
- 
- 	set(CMAKE_REQUIRED_LIBRARIES "-licui18n -licuuc -licudata")
- 	CHECK_C_SOURCE_COMPILES("#include <unicode/ucol.h>
-@@ -393,7 +393,7 @@ if(NOT ICU_FOUND)
- 		set(ICU_CFLAGS -D_REENTRANT)
- 		set(ICU_LIBS "-licui18n -licuuc -licudata")
- 	else(HAVE_UCOL_OPEN)
--		message(FATAL_ERROR "Failed to find icu-i18n, install its development files or build them first")
-+		message(FATAL_ERROR "Failed to find icui18n, icuuc and icudata, install its development files or build them first")
- 	endif(HAVE_UCOL_OPEN)
- endif(NOT ICU_FOUND)
- 
-- 
2.34.1


