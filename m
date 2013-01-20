Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tx3u7-0005XX-Kg
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2013 00:02:21 +0100
Received: from mail-wi0-f200.google.com ([209.85.212.200])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 20 Jan 2013 14:45:42 -0800
Received: by mail-wi0-f200.google.com with SMTP id hn14so6606579wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 14:46:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=YWyl0GBSKbnmOIVx+tX3xjq2Cx3/y7wyCzV2Gfi/Dp0=;
	b=B1kvMjQuJ/P8D4RXYPW6Axx1nN+5e3oT8JeV0KM4AHI5g4TV8GYBEX2BZ2k87oy2cd
	/er7FiKGpX05077vczOkLZCoXWiRoxE6meI8KgYd7gg1cBmmYomJFIfJFo7gHH+gMdDh
	ODbcIFCGsRPyeLtrb+DxbDaX/XxaD1MKn+eLMtdcXysP84lauYgWGcLoEdtPmBR971xf
	OVfwqSgwQ5DqxTDTNL14CL1F6HnKaHh7CIX6xQGaIny3o4IVDglydp1R15LqTTfrNlM5
	ZGB/HShjDzMP+/ewrO2+WtohMtDOY4Y+IqIGXYiRY7aR0UN5w/YT+YzI15xm7YJMG4mU
	RXRw==
X-Received: by 10.194.158.100 with SMTP id wt4mr23200572wjb.37.1358722005912; 
	Sun, 20 Jan 2013 14:46:45 -0800 (PST)
X-Received: by 10.194.158.100 with SMTP id wt4mr23200564wjb.37.1358722005704; 
	Sun, 20 Jan 2013 14:46:45 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eo10sm15847492wib.9.2013.01.20.14.46.44
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 14:46:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 22:44:39 +0000
Message-Id: <1358721879-1549-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnzMRY8VVrftDTksFGbcZ2hUOhR1m7YzdzczhNwq0IIW76gK5duoMsHMqR0Juz7HC8QwNfsRX+P8DOVvma56FzYYqVxjGSDD7AsbJSz+vJwGTjn08mJY/XHpEFX6ONoEKAP+3vkg7E1y4plXRVLmESqzjgbyAfpRoLxyloU3sduH1/AbHotdy/MT7ik6dcaO14XBwLd
Subject: [meta-oe][PATCH] libcanberra: upgrade and refresh packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jan 2013 23:02:22 -0000

Update to 0.29 (latest, 0.30, needs GStreamer 1.0) and refresh the package based
on the different recipes in oe-core and meta-oe.

Explicitly depend on GTK+ 2 and GTK+ 3, but split those dependencies into
different packages.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libcanberra-increase-buffer-size.patch         |   13 ----
 .../libcanberra/libcanberra_0.26.bb                |   63 --------------------
 .../libcanberra/libcanberra_0.29.bb                |   55 +++++++++++++++++
 3 files changed, 55 insertions(+), 76 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/libcanberra/libcanberra/libcanberra-increase-buffer-size.patch
 delete mode 100644 meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
 create mode 100644 meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb

diff --git a/meta-oe/recipes-devtools/libcanberra/libcanberra/libcanberra-increase-buffer-size.patch b/meta-oe/recipes-devtools/libcanberra/libcanberra/libcanberra-increase-buffer-size.patch
deleted file mode 100644
index 1005d78..0000000
--- a/meta-oe/recipes-devtools/libcanberra/libcanberra/libcanberra-increase-buffer-size.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: libcanberra-0.14/src/alsa.c
-===================================================================
---- libcanberra-0.14.orig/src/alsa.c
-+++ libcanberra-0.14/src/alsa.c
-@@ -272,7 +272,7 @@
-     return translate_error(ret);
- }
- 
--#define BUFSIZE (16*1024)
-+#define BUFSIZE (128*1024)
- 
- static void* thread_func(void *userdata) {
-     struct outstanding *out = userdata;
diff --git a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb b/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
deleted file mode 100644
index 5cf9a55..0000000
--- a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-DESCRIPTION = "Libcanberra is an implementation of the XDG Sound Theme and Name \
-Specifications, for generating event sounds on free desktops."
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1"
-DEPENDS = "alsa-lib gstreamer gtk+ libtool libvorbis gconf"
-SECTION = "libs/multimedia"
-AUTHOR = "Lennart Poettering"
-HOMEPAGE = "http://0pointer.de/lennart/projects/libcanberra"
-PR = "r2"
-
-inherit autotools vala
-
-SRC_URI = "http://0pointer.de/lennart/projects/libcanberra/libcanberra-${PV}.tar.gz \
-           file://libcanberra-increase-buffer-size.patch"
-
-SRC_URI[md5sum] = "ee2c66ada7c851a4e7b6eb1682285a24"
-SRC_URI[sha256sum] = "4b5d8d2c2835133620adbc53745dd107b6e58b9a2963059e8f457143fee00982"
-
-EXTRA_OECONF = "\
-  --enable-alsa \
-  --enable-gstreamer \
-  --enable-gtk \
-  --enable-multi \
-  --enable-null \
-  --disable-oss \
-  --disable-pulse \
-  --disable-tdb \
-"
-# enable pulse again when pulseaudio >= 0.9.11 is the default in OE
-
-python populate_packages_prepend() {
-    plugindir = d.expand('${libdir}/${P}/')
-    do_split_packages(d, plugindir, '^libcanberra-(.*)\.so$', 'libcanberra-%s', '%s support library', extra_depends='' )
-}
-
-PACKAGES =+ "${PN}-gtk"
-
-PACKAGES_DYNAMIC += "^libcanberra-.*"
-
-FILES_${PN}-gtk = "\
-  ${sysconfdir}/gconf \
-  ${bindir}/* \
-  ${libdir}/libcanberra-gtk.so.* \
-  ${libdir}/gtk-2.0/modules/* \
-  ${libdir}/gtk-3.0/modules/* \
-  ${datadir}/gnome \
-  ${datadir}/gdm \
-"
-
-# /usr/lib/gtk-3.0/modules/libcanberra-gtk-module.so > /usr/lib/gtk-3.0/modules/libcanberra-gtk3-module.so
-INSANE_SKIP_${PN}-gtk = "dev-so"
-
-FILES_${PN}-dev += "\
-  ${libdir}/gtk-2.0/modules/*.la \
-  ${libdir}/gtk-3.0/modules/*.la \
-  ${libdir}/${P}/*.la \
-"
-
-FILES_${PN}-dbg += "\
-  ${libdir}/gtk-2.0/modules/.debug \
-  ${libdir}/gtk-3.0/modules/.debug \
-  ${libdir}/${P}/.debug \
-"
diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
new file mode 100644
index 0000000..a6d68d4
--- /dev/null
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
@@ -0,0 +1,55 @@
+SUMMARY = "Implementation of XDG Sound Theme and Name Specifications"
+DESCRIPTION = "Libcanberra is an implementation of the XDG Sound Theme and Name Specifications, for generating event sounds on free desktops."
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://src/canberra.h;beginline=7;endline=24;md5=c616c687cf8da540a14f917e0d23ab03"
+
+DEPENDS = "alsa-lib gstreamer gtk+ gtk+3 libtool libvorbis pulseaudio"
+PR = "r0"
+
+inherit autotools
+
+SRC_URI = "http://0pointer.de/lennart/projects/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "2594093a5d61047bd9cc87e955f86df8"
+SRC_URI[sha256sum] = "127a5ef07805856d63758e5180ebfb241d1f80094fd301c287591a15b8cfcd72"
+
+EXTRA_OECONF = "\
+  --enable-null \
+  --enable-alsa \
+  --enable-gstreamer \
+  --enable-pulse \
+  --disable-oss \
+  --enable-gtk \
+  --enable-gtk3 \
+  --disable-tdb \
+  --disable-lynx \
+"
+
+python populate_packages_prepend() {
+    plugindir = d.expand('${libdir}/${P}/')
+    do_split_packages(d, plugindir, '^libcanberra-(.*)\.so$', 'libcanberra-%s', '%s support library', extra_depends='' )
+    do_split_packages(d, plugindir, '^libcanberra-(.*)\.la$', 'libcanberra-%s', '%s support library', extra_depends='' )
+}
+
+PACKAGES =+ "${PN}-gnome ${PN}-gtk2 ${PN}-gtk3 ${PN}-systemd"
+
+FILES_${PN} = "${bindir}/ ${libdir}/${BPN}.so.*"
+
+FILES_${PN}-dev += "${datadir}/vala/vapi"
+
+FILES_${PN}-dbg += "${libdir}/${P}/.debug ${libdir}/gtk-*/modules/.debug"
+
+FILES_${PN}-gtk2 = "${libdir}/${BPN}-gtk.so.* \
+                    ${libdir}/gtk-2.0/modules/*.la \
+                    ${libdir}/gtk-2.0/modules/*.so"
+
+# -gtk3 ships a symlink to a .so
+INSANE_SKIP_${PN}-gtk3 = "dev-so"
+FILES_${PN}-gtk3 = "${libdir}/${BPN}-gtk3.so.* \
+                    ${libdir}/gtk-3.0/modules/*.la \
+                    ${libdir}/gtk-3.0/modules/*.so"
+
+FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/ \
+                     ${datadir}/gdm/ ${datadir}/gnome/"
+
+FILES_${PN}-systemd = "${base_libdir}/systemd/system/*.service"
-- 
1.7.10.4



