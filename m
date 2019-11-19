Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id C53397F848
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:17:42 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id w9so22498649wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=c+rUFhGhniOOOA5c6oYe9Nu4f6HeSb24J0ijJQG9K4o=;
	b=Ax0UvwAOHape6CDlFp2UtwX0KtGNciLQpMHDF7IiSK1xmuuYf3JpG5vRKTqWjUbU0l
	oQ8SzqUAk4MA18vegsH63v+GNZGYsEvLJdBzVA4e2UUGImcUlm6R6AdxE8yLOUrltll4
	/5ET7zw6suIy3PoT++cAODtJrSuyNwI2NArwkelmY5QDiKd5WggY4gzgyRo0WYzRW/LP
	W6evWF2QJHymRaysaTf8GN+DlbCjsCrnxJ4k+MAWju4UnuRtvw7/QN7+CADoY06L5egS
	IUdT0eatIwGxz6WGwVdNewck8iaaWEH6N0dPpoW2hCzCaHHFQCjcEqEs1Q5kucLK9ia/
	FC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=c+rUFhGhniOOOA5c6oYe9Nu4f6HeSb24J0ijJQG9K4o=;
	b=NbeBXOMfA2MMP9QZLpp8IgtLp4R1KWeja9hSucR9+SZVqNF2X1lTMX8IRbGTJPe1bl
	BzB7DA22iE7lwjyxGFpIPBitx3aME2Clf6wbmphWC4DR+SOzI9+QggiWyuDxs0q/ZJE+
	SlbetcmsO+FdhBlUtX99pr3Mj+3ynEQoJUfnZJeWyEMrnzGLUc8zssRq0OMPLnHWj6YG
	G9q7q+s69R+PiCabTq6ldTrKISPJfBBfvLhHq8rzU2H1KDtvnazc3ATGDPt0Pz/WNmiJ
	N61uY44mhEdb/CQBZ7uQj7x5ajXPcqzgsGJ5weibgu+VwIiUB1f+De8wSMELwECOv+Ej
	d8OQ==
X-Gm-Message-State: APjAAAWPNKtL8NGAFA3O8aRP3kO/I2D4kvgu869fY9Awzf5F+UxVmR0P
	eXwC3ed1jYG0rp8wL6Lvi0dcmxNm
X-Google-Smtp-Source: APXvYqxFTHWegiVM0Zszl6YDypT2El1z3txIofjZzmVwVb8PRgG5PhvHPIMyiFRkfbgZQb9Jsp9yWw==
X-Received: by 2002:a5d:4ad2:: with SMTP id y18mr19876457wrs.396.1574147863296;
	Mon, 18 Nov 2019 23:17:43 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0CB657F29A81DEDF319DFC.dip0.t-ipconnect.de.
	[2003:f0:7f0c:b657:f29a:81de:df31:9dfc])
	by smtp.gmail.com with ESMTPSA id
	b1sm24480182wrs.74.2019.11.18.23.17.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 23:17:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 08:17:24 +0100
Message-Id: <20191119071730.2682-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119071730.2682-1-schnitzeltony@gmail.com>
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] tracker-miners: initial add 2.3.1
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
X-List-Received-Date: Tue, 19 Nov 2019 07:17:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tracker-miners is a mandatory runtime-dependency for nautilus

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../tracker/tracker-miners_2.3.1.bb           | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb
new file mode 100644
index 000000000..465145a15
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb
@@ -0,0 +1,66 @@
+SUMMARY = "Tracker miners and metadata extractors"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+    file://COPYING.GPL;md5=ee31012bf90e7b8c108c69f197f3e3a4 \
+    file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+"
+
+DEPENDS = " \
+    intltool-native \
+    tracker \
+    zlib \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion distro_features_check
+
+SRC_URI[archive.md5sum] = "0321d8f4ad27e3fccdbc8384e5b3cb83"
+SRC_URI[archive.sha256sum] = "7b1de06a7a79ea1c7813c8a21f8cd1c55f2b95f799cf9f47f0204f3be8a590e0"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+PACKAGECONFIG ??= " \
+    ffmpeg \
+    flac \
+    gexiv2 \
+    gstreamer \
+    icu \
+    libexif \
+    libgsf \
+    jpeg \
+    png \
+    tiff \
+    xml \
+    pdf \
+"
+
+PACKAGECONFIG[ffmpeg]     = ",,ffmpeg"
+PACKAGECONFIG[flac]       = "-Dflac=enabled,-Dflac=disabled,flac"
+PACKAGECONFIG[gexiv2]     = ",,gexiv2"
+PACKAGECONFIG[gstreamer]  = ",,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[gupnp]      = ",,gupnp-dlna"
+PACKAGECONFIG[icu]        = ",,icu"
+PACKAGECONFIG[libexif]    = "-Dexif=enabled,-Dexif=disabled,libexif"
+PACKAGECONFIG[libgsf]     = "-Dgsf=enabled,-Dgsf=disabled,libgsf"
+PACKAGECONFIG[jpeg]       = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
+PACKAGECONFIG[png]        = "-Dpng=enabled,-Dpng=disabled,libpng"
+PACKAGECONFIG[tiff]       = "-Dtiff=enabled,-Dtiff=disabled,tiff"
+PACKAGECONFIG[xml]        = "-Dxml=enabled,-Dxml=disabled,libxml2"
+PACKAGECONFIG[vorbis]     = "-Dvorbis=enabled,-Dvorbis=disabled,libvorbis"
+PACKAGECONFIG[pdf]        = "-Dpdf=enabled,-Dpdf=disabled,poppler"
+PACKAGECONFIG[upower]     = ",,upower"
+
+# meta-selinux
+PACKAGECONFIG[libseccomp] = ",,libseccomp"
+# not yet in meta-gnome
+PACKAGECONFIG[rss]        = "-Dminer_rss=true,-Dminer_rss=false,libgrss"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/tracker \
+    ${libdir}/tracker-miners-2.0 \
+    ${systemd_user_unitdir} \
+"
-- 
2.21.0


