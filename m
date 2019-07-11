Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BAA5B7EF65
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 10:04:25 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x15so5063492wmj.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 03:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/hL7QPKlDR9Nqo5x3eft1GCkilE7O2hYd0hAYq6cNC0=;
	b=IWo+fdM1/nMfyR8DTTyGPYcIayZcfo9d4U1rIODeOCHUKAZsZcmMBeqH34BqiO9rHX
	3BjMEIbBPD06bPIBdzXKE+Js+XLFdvJ9YN7j7kCkvxDTa7zPBIJpq2YW7qNiThZEOMjK
	pY1DNVcoE6anOauXYKTTcLMw68W3iwdtpC2LNXkOWsyqtIiTGIayN2ROvtgXNhh7WtIQ
	UN8sy1JajXeUwqP3dYNmTWSmZVvUUkSHaSB6N1F11RW8T8cv+t++09JQ8ODmrofFqadU
	hXySxaoSbSfIjzSzEuvBJVvIYezPsOCy5ID7W0cT4FmqCYDznO4UjEEaxh+zm7l7dXWv
	1b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/hL7QPKlDR9Nqo5x3eft1GCkilE7O2hYd0hAYq6cNC0=;
	b=CC1s0q31Zycik3WxwsOVCpLjoSzV/bD40kjO1PCff/t5zM6C5U2Bk8apVSuJc0LSwy
	ddenP1wKAvItYostBEOFTZWAwzOq/4B7RhEhIoI3qwOgxJwRiX5SgRoThjraJB17vsdz
	0+MpuXg7Hl8FHezEnl7Zg3ruqVY6oimplP3cEQRffd4azzDFT14aVEGcsXI3pJ67cXF3
	GSu+1hVKVEJoI7vbah3mJiFVzvGE3Kg/aEe69wa836X/F3nyLlQ9Eh/j+ITQh9DQsmy9
	xPNl0mJ6nqQs/lB2PoRPKBQYxjV3UO8Epcu6rSG2FFm1zAfjewzzU1NEzXoLQ3JckZ5D
	2zxg==
X-Gm-Message-State: APjAAAURu/eYCTA5mQQ/CvLx3o0+W8D12HE7QWik88FLxCh1E4VDAHBn
	EWGKPLx+1p9mpA6r0ZzCtKw4PlFaMmM=
X-Google-Smtp-Source: APXvYqzIj1RVbnReUyMKCIO7aRqouVRDZWCT8qtGX9GJnXVzfje22JDQ3R+OSiBR7KGWxL5Ax7Ystg==
X-Received: by 2002:a1c:5f55:: with SMTP id t82mr3356631wmb.111.1562839466055; 
	Thu, 11 Jul 2019 03:04:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y12sm3113563wrm.79.2019.07.11.03.04.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Jul 2019 03:04:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Jul 2019 11:04:21 +0100
Message-Id: <20190711100421.777-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190711100421.777-1-ross.burton@intel.com>
References: <20190711100421.777-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gnome-themes-standard: add recipe for GTK+ 2 Adwaita
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
X-List-Received-Date: Thu, 11 Jul 2019 10:04:26 -0000
Content-Transfer-Encoding: 8bit

This is the GTK+ 2 Adwaita theme, which has just been removed from oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnome-themes-standard_3.22.3.bb           | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.22.3.bb

diff --git a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.22.3.bb b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.22.3.bb
new file mode 100644
index 0000000000..55ee277606
--- /dev/null
+++ b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.22.3.bb
@@ -0,0 +1,46 @@
+SUMMARY = "GTK+2 standard themes"
+HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/sources/gnome-themes-standard/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+SECTION = "x11/gnome"
+
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+inherit autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even distro_features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+
+DEPENDS += "intltool-native gtk+"
+
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
+          "
+
+SRC_URI[md5sum] = "b51c362b157b6407303d44f93c31ee11"
+SRC_URI[sha256sum] = "61dc87c52261cfd5b94d65e8ffd923ddeb5d3944562f84942eeeb197ab8ab56a"
+
+EXTRA_OECONF = "--disable-gtk3-engine"
+
+do_install_append() {
+        # Only building Adwaita, remove highcontrast files
+        rm -rf ${D}${prefix}/share/themes/HighContrast \
+               ${D}${prefix}/share/icons
+
+	# The libtool archive file is unneeded with shared libs on modern Linux
+	rm -rf ${D}${libdir}/gtk-2.0/2.10.0/engines/libadwaita.la
+}
+
+# There could be gnome-theme-highcontrast as well but that requires
+# gtk+3 and includes lots of icons (is also broken with B != S).
+PACKAGES += "gnome-theme-adwaita \
+             gnome-theme-adwaita-dark \
+             "
+
+FILES_gnome-theme-adwaita = "${prefix}/share/themes/Adwaita \
+                              ${libdir}/gtk-2.0/2.10.0/engines/libadwaita.so"
+
+FILES_gnome-theme-adwaita-dark = "${prefix}/share/themes/Adwaita-dark"
+RDEPENDS_gnome-theme-adwaita-dark = "gnome-theme-adwaita"
+
+# gnome-themes-standard is empty and doesn't exist
+RDEPENDS_${PN}-dev = ""
-- 
2.20.1


