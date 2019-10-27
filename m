Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id EDAE37FAAC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:15 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p21so7559988wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tXT+4QJtMRp7SF67Er+g/uGg/7MNagA4werb8/lBu+U=;
	b=rNEK+SBXo1lasOY/pOfUwOSYyMGqqVeixyRVvGylZProBWnJRnGHMvb5nrESxVq5zZ
	/5+wrA7d//pTl5uV2sjMaTaSa/athNUBTSOsUWfdMvdq3sOag38xyI0241IjgTdP73Gh
	5c6+50667HN0A+jsngkqSY/ycviD9cJ06+3T7ZON3ZpDYP9V+WspeRONsU3i75vsawHG
	TeaR3e0/7NAs89DAUzedb3JfEd6Y5wK4mBeXUFvY0gzpBEj+8oy6l4BWVT3PWTdngeyd
	ShUNeP7ka63rIo8QSowbhLUz9RhGiaWDRNPGfbqNMl3yStqBAYOAIxQteLfUSCq4Uqo8
	qfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tXT+4QJtMRp7SF67Er+g/uGg/7MNagA4werb8/lBu+U=;
	b=W3KvieKbYwBdGYpu/UTOzPKWPgF4ng9YQWRlEt3IM9BSqiKcBPCPWJ5JjND/8bkyGa
	i5ASzd96EWJjoHLN/PIaITfO3HLyy5fzfxVJiXdBZthenx15OUx+i4Kbubs8OO5YODcg
	0XIt9zhARQUHAaCtslFuEaJ8mlQ48mXZS6TgIpi2OIAKIpwJy96PVwRFLXQ5ZEDafMbf
	Zm0F3Rez7JuxyTdvEUU6+lZM9GwvIK5Ly+Adj//ZG9JLp7PH05UdBeknDz0siwpubjdo
	AcKCmKsd/KiCLp46AXdocXVkugFBSlp1ujEVZqwqphXFOqTrgcE7tc6U7IouIxPUykxs
	swJg==
X-Gm-Message-State: APjAAAX7RiXZVRJ8QcbJN0YJs0rFQXOEH/q6SvrDTw3Q/tTpU6UbSLxa
	TzebGQQrhvtiYyCEZHbEu7SNi1FC
X-Google-Smtp-Source: APXvYqxEdAY+uvwcMHT+mtO/Dz7y5NUSmtGXAURHg9VDf1sDtaDaCKtnOnK6p/zhSSp5x4IqTjaCOg==
X-Received: by 2002:a7b:c08b:: with SMTP id r11mr9825293wmh.39.1572219376466; 
	Sun, 27 Oct 2019 16:36:16 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:44 +0100
Message-Id: <20191027233545.4146-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 18/19] network-manager-applet: upgrade 1.8.22 -> 1.8.23 / build with meson / cleanup
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cleanup means:
* remove unnecessary dependencies
* gobject-introspection builds fine for musl these days

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../network-manager-applet_1.8.22.bb          | 44 -------------------
 .../network-manager-applet_1.8.24.bb          | 29 ++++++++++++
 2 files changed, 29 insertions(+), 44 deletions(-)
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
deleted file mode 100644
index 37f512a73..000000000
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "GTK+ applet for NetworkManager"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-DEPENDS = "gtk+3 libnotify libsecret networkmanager \
-           libgnome-keyring iso-codes nss \
-           intltool-native \
-"
-
-GNOMEBASEBUILDCLASS = "autotools-brokensep"
-inherit distro_features_check gnomebase gsettings gtk-icon-cache gobject-introspection gettext
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI[archive.md5sum] = "e0373f4c0d0637716e6e385799a9080f"
-SRC_URI[archive.sha256sum] = "ebef1c1050ff6d94cad060e8d259f2a88ae159cf83ca75cb71d9f76867877eed"
-
-PACKAGECONFIG[modemmanager] = "--with-wwan,--without-wwan,modemmanager"
-PACKAGECONFIG[mobile-provider-info] = "--enable-mobile-broadband-provider-info,--disable-mobile-broadband-provider-info,mobile-broadband-provider-info,mobile-broadband-provider-info"
-PACKAGECONFIG ??= ""
-
-EXTRA_OECONF = " \
-    --without-selinux \
-"
-
-# gobject-introspection related
-GI_DATA_ENABLED_libc-musl = "False"
-
-do_compile_prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/src/libnma/.libs"
-}
-
-RDEPENDS_${PN} =+ "networkmanager"
-
-FILES_${PN} += " \
-    ${datadir}/nm-applet/ \
-    ${datadir}/libnma/wifi.ui \
-    ${datadir}/metainfo \
-"
-
-# musl builds generate gir files which otherwise go un-packaged
-FILES_${PN}-dev += " \
-    ${datadir}/gir-1.0 \
-"
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb
new file mode 100644
index 000000000..90390e15f
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb
@@ -0,0 +1,29 @@
+SUMMARY = "GTK+ applet for NetworkManager"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+DEPENDS = "gtk+3 libnotify libsecret networkmanager iso-codes nss"
+
+GNOMEBASEBUILDCLASS = "meson"
+inherit distro_features_check gnomebase gsettings gtk-doc gtk-icon-cache gobject-introspection gettext
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.md5sum] = "5c1bf351fde5adc12200345550516050"
+SRC_URI[archive.sha256sum] = "118bbb8a5027634b62e8b45b16ceafce74441529c99bf230654e3bec38f9fbbf"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gcr] = "-Dgcr=true, -Dgcr=false, gcr"
+PACKAGECONFIG[modemmanager] = "-Dwwan=true, -Dwwan=false, modemmanager"
+PACKAGECONFIG[mobile-provider-info] = "-Dmobile_broadband_provider_info=true, -Dmobile_broadband_provider_info=false, mobile-broadband-provider-info,mobile-broadband-provider-info"
+PACKAGECONFIG[selinux] = "-Dselinux=true, -Dselinux=false, libselinux"
+
+RDEPENDS_${PN} =+ "networkmanager"
+
+FILES_${PN} += " \
+    ${datadir}/nm-applet/ \
+    ${datadir}/libnma/wifi.ui \
+    ${datadir}/metainfo \
+"
-- 
2.21.0


