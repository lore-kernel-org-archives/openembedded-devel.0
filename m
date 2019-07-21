Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 111117EE4F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:28 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id r7so16203030pfl.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5Z/U6hjA2iT0rW+VLj1msmLop96uomEzbWTaSP86aA8=;
	b=OgXahe1v/zGwbTj/PAglfSK8wVqpD4bSQDTxyXBjRu/AMMCvm9wO7TVB5t00/E51Ax
	r41iR7om6xDdxwYrru+kSI/X8189tdIsArhVLfcDTILF1/U58QsbojUm7tU2fd92US4b
	IfqWQv71Tj9JPRxGKpmxqjsrwaoUcB82DZcU4Bv9WxV2TLLRcS6c9vlVa6k2v9ELQzHK
	9Xr8PdeVkIQHyCNMykjUio/LVGFYStdeBkXKswrD7N9YjP5CK+XKnTHkXe/6X1/25plO
	wneBRkZfW5qBYwlVRigzkp2aOo2cHjXV8aPfN6v2LdukabJdYUcW+fjA8IdJpG7096jw
	xnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5Z/U6hjA2iT0rW+VLj1msmLop96uomEzbWTaSP86aA8=;
	b=fdZq3iV9gAzQE2ty5rQ8k0VPrkL8fcwTY2kF6cc6AJR40f9WfuMl8IMPTTgagooVhO
	7BjlpZ3vi2kcfNK+ggO0BTCMF9NG1NcdFJkU7DEopadR55mzoq23buQ0OxjU3Ty9ot0n
	JMkhEy/HONoFBmMDWgZOg3bd0EyXFNOwrPfZKDC0Q8B5GEuZJKarxGbPqQ945i7ee5Xz
	rmUW9xaVMmrLvGZAVXhGLfMEnDQ8ZfElt7ks02na/S1CM/hFZ3YrOV8SrOLQphoRPunE
	Qf6HHjSUt7U7JcT3pPQTUIx1Wv6lQDWLDF2SWAzUa2v2UzljuB8j9LTwSz765qsBK+6I
	hvAw==
X-Gm-Message-State: APjAAAW+FYFTjFQX+bpHJW1+iUkq11yoDs6VOOsTWAxGsVlNx1/aERfA
	2V9RylW8MS/WAvQxYmFi+htlqkZ77JI=
X-Google-Smtp-Source: APXvYqx5oOOINSzw5YjQQDoiBUqxpryKu3O+pz8fkmg9nL1eCu7Up5w/nsVZO0tFiH0qB23Qpm1U/Q==
X-Received: by 2002:a17:90a:214e:: with SMTP id
	a72mr30476013pje.0.1563727169633; 
	Sun, 21 Jul 2019 09:39:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:06 -0700
Message-Id: <20190721163919.32659-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 01/14] recipes: Use BPN instead of PN in SRC_URIs
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:29 -0000
Content-Transfer-Encoding: 8bit

Makes it work for multilib case and fixes QA error

SRC_URI uses PN not BPN [src-uri-bad]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb | 2 +-
 meta-oe/recipes-devtools/geany/geany-plugins_1.34.bb         | 4 ++--
 meta-oe/recipes-extended/nana/nana_2.5.bb                    | 2 +-
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb           | 2 +-
 meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb             | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index f11ae7e4d2..68dc804241 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -8,7 +8,7 @@ PR = "r1"
 PROVIDES = "virtual/libintl"
 
 SRC_URI = " \
-    http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${PN}-dev_${PV}_win32.zip \
+    http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${BPN}-dev_${PV}_win32.zip \
 "
 SRC_URI[md5sum] = "aef407c2b97ee829383aadd867c61d1e"
 SRC_URI[sha256sum] = "291ac350cc5eb4a01b0d651ca99fae64cee8a1c06b2005277fab5a4356f9ae91"
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.34.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.34.bb
index 6c1c1535e0..84adc7abe4 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.34.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.34.bb
@@ -29,7 +29,7 @@ inherit distro_features_check autotools pkgconfig gtk-icon-cache
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = " \
-    http://plugins.geany.org/${PN}/${PN}-${PV}.tar.bz2 \
+    http://plugins.geany.org/${BPN}/${BP}.tar.bz2 \
     file://0001-Use-pkg-config-to-find-gpgme.patch \
 "
 SRC_URI[md5sum] = "bf5fdd50727ad8bbbfe00027ccf2dac5"
@@ -40,7 +40,7 @@ do_configure_prepend() {
 }
 
 FILES_${PN} += "${datadir}/icons"
-FILES_${PN}-dev += "${libdir}/geany/*.la ${libdir}/${PN}/*/*.la"
+FILES_${PN}-dev += "${libdir}/geany/*.la ${libdir}/${BPN}/*/*.la"
 
 PLUGINS += "${PN}-addons"
 LIC_FILES_CHKSUM += "file://addons/COPYING;md5=4325afd396febcb659c36b49533135d4"
diff --git a/meta-oe/recipes-extended/nana/nana_2.5.bb b/meta-oe/recipes-extended/nana/nana_2.5.bb
index 19a90ff07b..595852a9f6 100644
--- a/meta-oe/recipes-extended/nana/nana_2.5.bb
+++ b/meta-oe/recipes-extended/nana/nana_2.5.bb
@@ -4,7 +4,7 @@ checking (as in assert.h) and logging (printf style debugging) in \
 GNU C and C++."
 SECTION = "Development/Languages/C and C++"
 
-SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${BP}.tar.gz \
+SRC_URI = "http://download.savannah.gnu.org/releases/${BPN}/${BP}.tar.gz \
     file://change-mandir-to-DESTDIR.patch \
     file://modify-acinclude.m4-and-configure.in.patch \
 "
diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
index b9aae0f6c8..310c410674 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://gtkwave.sourceforge.net/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
-SRC_URI = "http://gtkwave.sourceforge.net/${PN}-${PV}.tar.gz"
+SRC_URI = "http://gtkwave.sourceforge.net/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "eac3073ef381e0c09da33590296ca37f"
 SRC_URI[sha256sum] = "efa6bbbeb3bd54104425a69a2aa0d079bb5c3ecc1c420ba57dcaa1c97c5a22f6"
diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
index 6306ddb55a..f5d1285000 100644
--- a/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
+++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libusb1"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://github.com/mvp/${PN}/archive/v${PV}.tar.gz"
+SRC_URI = "https://github.com/mvp/${BPN}/archive/v${PV}.tar.gz"
 SRC_URI[md5sum] = "5c711911d766d76813333c3812277574"
 SRC_URI[sha256sum] = "4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e"
 
-- 
2.22.0


