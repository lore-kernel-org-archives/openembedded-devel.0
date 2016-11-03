Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B2B3871C2E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 18:47:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n85so5552404pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Rs5e3dJwxnz6gOjxz19OoipPX19S7bOrC1nkkbJW+DU=;
	b=rEOFwSvXQ3nH/2uG+PlwnjkKA4DKzbWYKp5TSzgJJxSFXV6/MoKUcztnKNQD/DoBkb
	lgAFXSrWo3TXoJSOpC+3HqbT9VQfER4bNz/mwb41LWva3gEYMoNuykej9u5fqMOCy4Ue
	dKDMptqn/2B/wSkaEf0T3yH301tA3FtMlahfKTOfpEhql/KSZOfO7IfCYRFRKQaBkroQ
	WMd0R5u/hE6xRGAxMYuURLcpWGUfWzAX/RiF5U+4lb6+2RtfFCmPuImPhvzYfDpZHXwT
	FcpPgEogQYUgS0eECZILmL7D6PG2bFZoF99gRZFm3wdgWPykSZ6nDbUNSdDxEuX6Nwu5
	XDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Rs5e3dJwxnz6gOjxz19OoipPX19S7bOrC1nkkbJW+DU=;
	b=EWsZq20UnXIgkznHsiBcxQ4Ft2Whl7ZB5wmxPgbWyK4Yf3g7qPZ1NUu0l3rlNZdTuv
	cTyU65/2Srso6BkgAwaztymDwQb+dcUIGGZ3EkqNtS4yC/HxpjEN97Lw5CmJG25hONab
	Fg5a4PpnkMPdb82OvYyLcf9oRm0xkPhgpwr3fwPQMRTuc2zx5zaymnQWlH1ToWWWPAim
	CjX1GRrCa0XjrRxTP9Y8+qmjKNApNUJG/oS8Wpw24Qkcd591e27c9pjTSBGJ3GzjDwiK
	YrZ3v0q22STHUbyICHlHOHHhcbYvqgaKL/w7oW5DqyoST1tZ5WyaSWaH8SyBl4iifp2/
	sbgw==
X-Gm-Message-State: ABUngvc3ILLtNuQjhrzvLP3u4U1r20WsauI0DgjBfp1RRGkYYO2h1E5m/cfvuexsrvJrqQ==
X-Received: by 10.98.101.71 with SMTP id z68mr19082482pfb.13.1478198866667;
	Thu, 03 Nov 2016 11:47:46 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	128sm14482324pfy.4.2016.11.03.11.47.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 11:47:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 11:47:39 -0700
Message-Id: <20161103184740.13712-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 7/8] libcec: Update to 3.1.0+
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Nov 2016 18:47:45 -0000

Depends on p8platform therefore add recipe for
p8platform

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes from V1 -> V2:
- Add x11 dependencies if x11 is in DISTRO_FEATURES

 meta-oe/recipes-extended/libcec/libcec_git.bb         | 18 ++++++++++++------
 meta-oe/recipes-extended/p8platform/p8platform_git.bb | 18 ++++++++++++++++++
 2 files changed, 30 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-extended/p8platform/p8platform_git.bb

diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index 0f2a64e..32ab4b9 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -2,18 +2,24 @@ SUMMARY = "USB CEC Adaptor communication Library"
 HOMEPAGE = "http://libcec.pulse-eight.com/"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5e8e16396992369f73f3d28875f846da"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e61fd86f9c947b430126181da2c6c715"
 
-DEPENDS = "udev lockdev"
+DEPENDS = "p8platform udev lockdev"
 
-PV = "2.1.4"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 libxrandr', '', d)}"
 
-SRCREV = "81e38211724bc6e8bd7a60f484433053ed682635"
-SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release"
+PV = "3.1.0+gitr${SRCPV}"
+
+SRCREV = "6d68d21243aa92862592435e8396b4280ea46c3f"
+SRC_URI = "git://github.com/Pulse-Eight/libcec.git"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit cmake pkgconfig
+
+# Disable python wrapper, it doesn't have crosscompiles
+EXTRA_OECMAKE = "-DCMAKE_INSTALL_LIBDIR=${libdir} -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir} \
+                 -DSKIP_PYTHON_WRAPPER=1"
 
 # cec-client and xbmc need the .so present to work :(
 FILES_${PN} += "${libdir}/*.so"
diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
new file mode 100644
index 0000000..f6347c2
--- /dev/null
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Platform support library used by libCEC and binary add-ons for Kodi"
+HOMEPAGE = "http://libcec.pulse-eight.com/"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://src/os.h;md5=752555fa94e82005d45fd201fee5bd33"
+
+PV = "2.1.0"
+
+SRC_URI = "git://github.com/Pulse-Eight/platform.git"
+SRCREV = "d7bceb64541cb046421cbcd4c98d91e9bf24822f"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE += "-DCMAKE_INSTALL_LIBDIR=${libdir} -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir}"
+
+FILES_${PN}-dev += "${libdir}/p8-platform"
-- 
2.10.2


