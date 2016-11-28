Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3F30671AB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 22:58:04 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id e9so14299125pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 14:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=00TREWHLQgjhgJqtPqSDqUnaxxWdbv5K1Rtz2TPnS9U=;
	b=pXkkgWhHzgNFMlQeZfJwelF3ctqy9lf9TW7vO8DmvBE8VV4v4Na4N96rt863HYyrCo
	2hTMvF6kkoDYzSx8tQ7lJOwvIIFKNJA6q+5Rgfg9+L+RWnf4HjtGSYMN2LQTLS7Fds87
	nu2yduxRCO4Vhrjj9k7FDRrMgd9gmOdNXlv8MMUJJBmoVDw3IevbYDuCbZbyE/8IzlK8
	+1AlVhnYlJz0x3N2EYFmsJ88dVcyXVf7RIoKSLiOhxxmlAqZpS+HkNspcO/onLPOdT8S
	NsM/eW2j+8I4ph/HBgXHoANb/95MSy6XpfIJWc+3Zo21CgjzJcirlmznQL3rDV874Gs6
	FXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=00TREWHLQgjhgJqtPqSDqUnaxxWdbv5K1Rtz2TPnS9U=;
	b=b1KfQ0zLIAD9AVUyFZe0bUaIPxDcwdIa1ODi32TGW3ELceSrx9sAZX3BqEIN5JWnOJ
	C0FQbJmSao2YWnR45TILWdC7+G/guEI+PIRxJOicHggwm29cV+pITRZezBTwCXYUM6W8
	SuwepI1yJy7orC8EqFCnM/IBNRRLbht+n0ZxvmUHhEZ6wORii7/E4PI12GTBeq+d7CXQ
	y70YBjh3dyy6PNQn7u5eFTNKhx0aQcSdVJDo6phKNeBWtirS1470mWFVWDLYo0knPGe6
	ZzcWO8IZidLsS+mgT0LqK8clxxqHZB4qbN8+sJTBtcKic6ClaCWw5c+1p4Iynl9gccLN
	RxAQ==
X-Gm-Message-State: AKaTC03m8ckrzaTp7k6yqld7tpfbfNc0IZlGn6WmpR1leX1pL4Hdt7kbUVZALngBr3IMzQ==
X-Received: by 10.98.220.157 with SMTP id c29mr24324055pfl.29.1480373885759;
	Mon, 28 Nov 2016 14:58:05 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	89sm89515362pfi.70.2016.11.28.14.58.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 14:58:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2016 14:57:59 -0800
Message-Id: <20161128225759.9756-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Mon, 28 Nov 2016 22:58:07 -0000

This recipe is used by intel and amd BSP layers
additional copies are also there see
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=libva

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libva/libva_1.7.3.bb | 48 +++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libva/libva_1.7.3.bb

diff --git a/meta-oe/recipes-graphics/libva/libva_1.7.3.bb b/meta-oe/recipes-graphics/libva/libva_1.7.3.bb
new file mode 100644
index 0000000..9994158
--- /dev/null
+++ b/meta-oe/recipes-graphics/libva/libva_1.7.3.bb
@@ -0,0 +1,48 @@
+SUMMARY = "Video Acceleration (VA) API for Linux"
+DESCRIPTION = "Video Acceleration API (VA API) is a library (libVA) \
+and API specification which enables and provides access to graphics \
+hardware (GPU) acceleration for video processing on Linux and UNIX \
+based operating systems. Accelerated processing includes video \
+decoding, video encoding, subpicture blending and rendering. The \
+specification was originally designed by Intel for its GMA (Graphics \
+Media Accelerator) series of GPU hardware, the API is however not \
+limited to GPUs or Intel specific hardware, as other hardware and \
+manufacturers can also freely use this API for hardware accelerated \
+video decoding."
+
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/vaapi"
+BUGTRACKER = "https://bugs.freedesktop.org"
+
+SECTION = "x11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
+
+SRC_URI = "http://www.freedesktop.org/software/vaapi/releases/libva/${BP}.tar.bz2"
+SRC_URI[md5sum] = "dafb1d7d6449e850e9eb1a099895c683"
+SRC_URI[sha256sum] = "22bc139498065a7950d966dbdb000cad04905cbd3dc8f3541f80d36c4670b9d9"
+
+DEPENDS = "libdrm virtual/mesa virtual/libgles1 virtual/libgles2 virtual/egl"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-dummy-driver"
+
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11", "", d)} \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "", d)}"
+PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxext libxfixes"
+PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland"
+
+PACKAGES =+ "${PN}-x11 ${PN}-tpi ${PN}-glx ${PN}-egl ${PN}-wayland"
+
+RDEPENDS_${PN}-tpi =+ "${PN}"
+RDEPENDS_${PN}-x11 =+ "${PN}"
+RDEPENDS_${PN}-glx =+ "${PN}-x11"
+RDEPENDS_${PN}-egl =+ "${PN}-x11"
+
+FILES_${PN}-dbg += "${libdir}/dri/.debug"
+
+FILES_${PN}-x11 =+ "${libdir}/libva-x11*${SOLIBS}"
+FILES_${PN}-tpi =+ "${libdir}/libva-tpi*${SOLIBS}"
+FILES_${PN}-glx =+ "${libdir}/libva-glx*${SOLIBS}"
+FILES_${PN}-egl =+ "${libdir}/libva-egl*${SOLIBS}"
+FILES_${PN}-wayland =+ "${libdir}/libva-wayland*${SOLIBS}"
-- 
2.10.2


