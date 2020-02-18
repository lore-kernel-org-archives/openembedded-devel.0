Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9074B615B0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:23:49 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id dw13so553625pjb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DZYBg8+xKvrr2AMLUNBHXkuvK2zGEVVJIju4PzOjdDY=;
	b=OyBkwTKyuVdDr1uZSQhe/0H8L8AuK6oq4+6GnPbPBmS7SFBDCu0lH8o/21EXSo+G59
	zhJpQHQwMQT0/BIqwJqNoDDcqtBgPkjmhE72q3aHOhTufN6hW5AwDVswx3Z+UCv9Slve
	RBdSZvJM6WRBZXhAQmDTanH/ARZZTUt8oqM/eUnMGxGFMRnclBDX1O2Jyh4OnezKXUHZ
	alo9s9dtyUc6TkRIS3Yu7OJjmPeVD2OrXV6KDRKJu1yu7J66k/APOCzmVLLiBnmoVf1Z
	HUigXSSay2hMiuUxkPDv44rzSim9IlWymY2Ajbbh3Na23IonPiMs3RxyTqHbhGOFUZsz
	Uzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DZYBg8+xKvrr2AMLUNBHXkuvK2zGEVVJIju4PzOjdDY=;
	b=JPe90bOGg0jgU9GbAxq0h2SAMV4qkmwiryEBstHNe8mEawUr48WtXvA/Js8tDLkqGQ
	1zB3aQ340Qxf/krD/phOmrKNkaQJpxjcXLgilhC8hB5LAsBwMhwWMKjp8qg9IpY18Yc5
	oA+RPXdCf22+b6Rl7hx8V00jPhwuOHpAvMC+Vp+/u1u2v+qIO64/mp5FnKBqnqMV1Mx6
	AEvrHNdvGrIazwb57Y3DFk3avDgqY0R3/Vh7k5QPEVjDvdB23mxu/g153/QCwO7rF3ED
	f/7O1B6rPNdvPFzQe8Ou+vrDRqj+9QJHHzt/VErXG1k7/enmJKOloGlPKFMSnP8LM63/
	8eiw==
X-Gm-Message-State: APjAAAWPkx9omr/nX/HadC774ynVsh3zKl4gYuy2xKRJuoEM3Afbbkqb
	+fQ6Z/nja1nkVih8TZ99n0sgA3GY82M=
X-Google-Smtp-Source: APXvYqygL+N4gP+fwRbAbZluCq43eccATCUCoWL1XdO5QtpYA4Rmk7LpeBUsefAmhGullIQR+s9aWA==
X-Received: by 2002:a17:90a:a617:: with SMTP id
	c23mr870157pjq.32.1582007029993; 
	Mon, 17 Feb 2020 22:23:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id h26sm2573363pfr.9.2020.02.17.22.23.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 22:23:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 22:23:47 -0800
Message-Id: <20200218062348.3742529-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200218062348.3742529-1-raj.khem@gmail.com>
References: <20200218062348.3742529-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 7/8] gupnp-igd: Upgrade to 0.2.5
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
X-List-Received-Date: Tue, 18 Feb 2020 06:23:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport patch to support gupnp 1.2 APIs
Add gsspd to deps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Swtich-to-new-GUPnP-API.patch        | 101 ++++++++++++++++++
 ...{gupnp-igd_0.2.4.bb => gupnp-igd_0.2.5.bb} |  10 +-
 2 files changed, 107 insertions(+), 4 deletions(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/0001-Swtich-to-new-GUPnP-API.patch
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-igd_0.2.4.bb => gupnp-igd_0.2.5.bb} (63%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/0001-Swtich-to-new-GUPnP-API.patch b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/0001-Swtich-to-new-GUPnP-API.patch
new file mode 100644
index 0000000000..ff5a6d9c6c
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/0001-Swtich-to-new-GUPnP-API.patch
@@ -0,0 +1,101 @@
+From 63531558a16ac2334a59f627b2fca5576dcfbb2e Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Sat, 1 Dec 2018 21:33:21 +0100
+Subject: [PATCH] Swtich to new GUPnP API
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gupnp-igd/commit/63531558a16ac2334a59f627b2fca5576dcfbb2e]
+---
+ configure.ac                    | 2 +-
+ gupnp-igd-1.0-uninstalled.pc.in | 2 +-
+ gupnp-igd-1.0.pc.in             | 2 +-
+ libgupnp-igd/Makefile.am        | 2 +-
+ tests/gtest/gupnp-simple-igd.c  | 6 ++++--
+ 5 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f03921f..aa7f0ca 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -11,7 +11,7 @@ AC_STDC_HEADERS
+ AC_PROG_LIBTOOL
+ AC_FUNC_MMAP
+ 
+-PKG_CHECK_MODULES(LIBGUPNP, glib-2.0 >= 2.26 gobject-2.0 >= 2.26 gssdp-1.0 gupnp-1.0 >= 0.18 gthread-2.0)
++PKG_CHECK_MODULES(LIBGUPNP, glib-2.0 >= 2.26 gobject-2.0 >= 2.26 gssdp-1.2 gupnp-1.2 >= 0.18 gthread-2.0)
+ 
+ # glib-genmarshal
+ GLIB_GENMARSHAL=`pkg-config --variable=glib_genmarshal glib-2.0`
+diff --git a/gupnp-igd-1.0-uninstalled.pc.in b/gupnp-igd-1.0-uninstalled.pc.in
+index 483956f..6db3bee 100644
+--- a/gupnp-igd-1.0-uninstalled.pc.in
++++ b/gupnp-igd-1.0-uninstalled.pc.in
+@@ -5,7 +5,7 @@ includedir=${pcfiledir}/
+ 
+ Name: gupnp-igd-1.0
+ Description: GUPnP Simple IGD library
+-Requires: gupnp-1.0
++Requires: gupnp-1.2
+ Version: @VERSION@
+ Libs: ${libdir}/libgupnp-av-1.0.la
+ Cflags: -I${includedir}
+diff --git a/gupnp-igd-1.0.pc.in b/gupnp-igd-1.0.pc.in
+index 6660d63..aa74ed3 100644
+--- a/gupnp-igd-1.0.pc.in
++++ b/gupnp-igd-1.0.pc.in
+@@ -5,7 +5,7 @@ includedir=@includedir@
+ 
+ Name: gupnp-igd-1.0
+ Description: GUPnP Simple IGD library
+-Requires: gupnp-1.0
++Requires: gupnp-1.2
+ Version: @VERSION@
+ Libs: -L${libdir} -lgupnp-igd-1.0
+ Cflags: -I${includedir}/gupnp-igd-1.0
+diff --git a/libgupnp-igd/Makefile.am b/libgupnp-igd/Makefile.am
+index fe020b5..e10d857 100644
+--- a/libgupnp-igd/Makefile.am
++++ b/libgupnp-igd/Makefile.am
+@@ -60,7 +60,7 @@ GUPnPIgd_1_0_gir_VERSION = 1.0
+ GUPnPIgd_1_0_gir_LIBS = $(lib_LTLIBRARIES)
+ GUPnPIgd_1_0_gir_FILES = $(libgupnp_igd_1_0_la_SOURCES) $(libgupnp_igd_inc_HEADERS)
+ GUPnPIgd_1_0_gir_INCLUDES=GObject-2.0
+-GUPnPIgd_1_0_gir_PACKAGES=gupnp-1.0
++GUPnPIgd_1_0_gir_PACKAGES=gupnp-1.2
+ GUPnPIgd_1_0_gir_CFLAGS=-I$(srcdir) -I$(top_srcdir)
+ 
+ if HAVE_INTROSPECTION
+diff --git a/tests/gtest/gupnp-simple-igd.c b/tests/gtest/gupnp-simple-igd.c
+index 9b32b2a..d051d13 100644
+--- a/tests/gtest/gupnp-simple-igd.c
++++ b/tests/gtest/gupnp-simple-igd.c
+@@ -273,13 +273,14 @@ run_gupnp_simple_igd_test (GMainContext *mainctx, GUPnPSimpleIgd *igd,
+   GUPnPDeviceInfo *subdev1;
+   GUPnPDeviceInfo *subdev2;
+   const gchar *xml_path = ".";
++  GError *error = NULL;
+ 
+   g_signal_connect (igd, "context-available",
+         G_CALLBACK (ignore_non_localhost), NULL);
+ 
+   if (mainctx)
+     g_main_context_push_thread_default (mainctx);
+-  context = gupnp_context_new (NULL, "lo", 0, NULL);
++  context = gupnp_context_new ("lo", 0, NULL);
+   g_assert (context);
+ 
+   if (g_getenv ("XML_PATH"))
+@@ -293,8 +294,9 @@ run_gupnp_simple_igd_test (GMainContext *mainctx, GUPnPSimpleIgd *igd,
+   gupnp_context_host_path (context, "WANPPPConnection.xml", "/WANPPPConnection.xml");
+   */
+ 
+-  dev = gupnp_root_device_new (context, "InternetGatewayDevice.xml", xml_path);
++  dev = gupnp_root_device_new (context, "InternetGatewayDevice.xml", xml_path, &error);
+   g_assert (dev);
++  g_assert (error == NULL);
+ 
+   subdev1 = gupnp_device_info_get_device (GUPNP_DEVICE_INFO (dev),
+       "urn:schemas-upnp-org:device:WANDevice:1");
+-- 
+2.25.1
+
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.5.bb
similarity index 63%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.4.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.5.bb
index 0aa594dc78..1a98ace80c 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.4.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.5.bb
@@ -3,11 +3,13 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libgupnp-igd/gupnp-simple-igd.c;beginline=1;endline=21;md5=aa292c0d9390463a6e1055dc5fc68e80"
 
-DEPENDS = "glib-2.0 gupnp sqlite3"
+DEPENDS = "glib-2.0 gssdp gupnp sqlite3"
 
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.2/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "124371136b5a7b1056a3681780a62772"
-SRC_URI[sha256sum] = "38c4a6d7718d17eac17df95a3a8c337677eda77e58978129ad3182d769c38e44"
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.2/${BPN}-${PV}.tar.xz \
+           file://0001-Swtich-to-new-GUPnP-API.patch \
+          "
+SRC_URI[md5sum] = "d164e096d0f140bb1f5d9503727b424a"
+SRC_URI[sha256sum] = "8b4a1aa38bacbcac2c1755153147ead7ee9af7d4d1f544b6577cfc35e10e3b20"
 
 inherit autotools pkgconfig gtk-doc gobject-introspection
 
-- 
2.25.1


