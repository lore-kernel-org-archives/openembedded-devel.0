Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 113907F95C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 20:54:16 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b3so71171wrs.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Nov 2019 12:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=dX8yFKifRnd6zkLL0dBySpdHFb2kXlNL24wEgN0/T7Y=;
	b=r/QuRoHXhwtao8tBQHneNhZbucr/qU2BPljzN+EldG+Nq3IHtkzzSt8+SnA6i0Kn69
	U/9J+gmO77zImo9BPJ1XBgtRlqmySUEwSRgGq2wezfaSU/AEPnX+N73VMwn2dM0ZHO22
	hhSpjeBCjSxkxm14VUdNlu/xZ0uGYFINclLFNTMfy/Fh6fKP2VfCYoClen0cZ6STJbRd
	wSXYVEqqSfaFPqwTPzYP9wNbH8bIby5ONCai6ebbBWsIYTAR5P47JUuEENY+M6xW8MHp
	oFsf9VmxrV22jI/he0XKwZ0X3PWLvCe/nCvhmmpEtCF7HbMtyfOmPVmnFHV64iV3YZcA
	jGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dX8yFKifRnd6zkLL0dBySpdHFb2kXlNL24wEgN0/T7Y=;
	b=KNCgNd2qxTDq53Y+APVkeZN0Z4TcLKZF8es9bpZQVt74QLmcWzkvORYZJyqTLnWCsV
	qq4LqhBhzkQbrtGsrFKYMYWah3pKRCKL24khYKH904X9EKHEb7TzBy1BSNXklUifq+79
	mSbYFvzY3vySjC8Plrh9Rt/Uhk2z8fpYbjkB/zUmWnjLeaY1AfsaJueKe23N0zYCQwGx
	eOmiERBCM0yEm1L4WAWQDYWclculep6OH1XOKm92rQRiGlmVSohtAY/se+L6sQG996iL
	dSxM+Ngt4FU5Dvd7LCC46x25nESPZT06YPBtm6cnX+N9a1GPM7Ipc2txG/JRTOZdSUdF
	xr8w==
X-Gm-Message-State: APjAAAV0A9YviSFyQuwS+/O0Mvllb9XMYvsSaRYSJSmnwmIw8RBUR+Ca
	IJwxmgC8ahcD6+/G6NdOhteA5bA9
X-Google-Smtp-Source: APXvYqx2jnPdqIBdo0/dBn/fUm727gj+OGL9WTTATkAJG0PV5So61LRkoa51byx7XpmZDYbJY3Mlow==
X-Received: by 2002:a5d:6585:: with SMTP id q5mr4364263wru.158.1573073657565; 
	Wed, 06 Nov 2019 12:54:17 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F438C581B49BA34826387FE.dip0.t-ipconnect.de.
	[2003:f0:7f43:8c58:1b49:ba34:8263:87fe])
	by smtp.gmail.com with ESMTPSA id
	i13sm17699440wrp.12.2019.11.06.12.54.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 12:54:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	zhengrq.fnst@cn.fujitsu.com
Date: Wed,  6 Nov 2019 21:54:07 +0100
Message-Id: <20191106205407.18957-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191106205407.18957-1-schnitzeltony@gmail.com>
References: <20191106205407.18957-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libpeas: upgrade 1.22.0 -> 1.24.1
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
X-List-Received-Date: Wed, 06 Nov 2019 20:54:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* move to meson build
* remove intltool-native & gnome-common from DEPENDS - they are not needed
* with meson build gir is configurable -> gobject-introspection-data is not a
  required distro feature any more

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libpeas_1.22.0.bb => libpeas_1.24.1.bb}    | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-gnome/libpeas/{libpeas_1.22.0.bb => libpeas_1.24.1.bb} (41%)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.24.1.bb
similarity index 41%
rename from meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb
rename to meta-oe/recipes-gnome/libpeas/libpeas_1.24.1.bb
index dd1b53e39..6c8e0e0bf 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.24.1.bb
@@ -3,20 +3,17 @@ HOMEPAGE = "https://wiki.gnome.org/Projects/Libpeas"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
 
-DEPENDS = "gnome-common gtk+3 intltool-native"
+DEPENDS = "gtk+3"
 
-inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache distro_features_check
+GNOMEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk_doc"
 
-# gobject-introspection is mandatory and cannot be configured
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache
 
-SRC_URI[archive.md5sum] = "a20dc55c3f88ad06da9491cfd7de7558"
-SRC_URI[archive.sha256sum] = "5b2fc0f53962b25bca131a5ec0139e6fef8e254481b6e777975f7a1d2702a962"
+SRC_URI[archive.md5sum] = "bbecf334a7333d0a5d4d655ba38be9b4"
+SRC_URI[archive.sha256sum] = "9c3acf7a567cbb4f8bf62b096e013f12c3911cc850c3fa9900cbd5aa4f6ec284"
 
-PACKAGECONFIG[python3] = "--enable-python3,--disable-python3,python3-pygobject"
-
-export GIR_EXTRA_LIBS_PATH = "${B}/libpeas/.libs"
+PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
 
 PACKAGES =+ "${PN}-demo ${PN}-python3"
 FILES_${PN}-demo = " \
-- 
2.21.0


