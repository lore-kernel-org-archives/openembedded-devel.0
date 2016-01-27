Return-Path: <mbc@koumoul.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 369CE7665F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 21:07:34 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r129so5628223wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 13:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=MeKCOV+80DMBAE7KNVqYdLrxIfDG0cP3n+bHP/N1WVY=;
	b=Fjny7yMUhDpkvnvHOn2lMLSX/uz/tan4AgL2vYq6tbchT9Ks265iKu+yDmYuooK4Q3
	aK5q/ObwVd79kpzzPjEnZpit1iBQVnZtZt1CeCl6a0zzahtqNGyC0q/hWk+tI9ai9Gp0
	DWf3zD0tz6fmL8Q+xR9yRHQsurjzN6RmqcJSA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=MeKCOV+80DMBAE7KNVqYdLrxIfDG0cP3n+bHP/N1WVY=;
	b=Dny3CEpS3BQ6S/Cu4BswsNTr3ylaSBtMPSLAQzOuTldlKnAKfK6YG26OdLQJ7zdkMp
	Wm9N3ucpc9N9PgjmMzrAkHUcUPYZ9SpK2Cl3KUGAN2bR/TGLAsKS8tEAVJetR+RhkQiT
	LmjsrfngL5IIpvLG3vNzxfPof3RLSOPpPhsBnOevMUp6yzCvk2Ne6eL8DBWoW9pCrmMT
	tlMnyHslHsS/yzsdNlVMag8Ykv7mbB3grw8GpJQ6/mHvbNIz3CA89qNJMIUzoYs9qeDW
	eYrZgIAZstt1D4P0f9FE6m7b1Dtc838OflK03Og4kcwK2lCFXmleLNnhqGqvoYgk2f+1
	8vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=MeKCOV+80DMBAE7KNVqYdLrxIfDG0cP3n+bHP/N1WVY=;
	b=N2GXg6LlV7h3yHTkXkA5f2akMG/HJep5EKgz2PbAMN0t6fKfxfwppPfba6EeaCfaO1
	UswzBn5qJHwGCFBNSwYtYcMTBcjiGFDQEqumZae1aWn1dOXSjAuR1MBBXFhirQtGOJ3k
	jyPIbfu1qlPBMexkpVGxOfqH8kHoHgswFtC4c2ubiv+fgh8Mi3P21j09A0PgHVrgS+/C
	larjYDgRduVXh+12w6cR8cS1ojAF5kz+6KLBENOFyIw6WAkTIemQ3A5wjq1zu9pI+idR
	s29I2wH7CuOaV7TUi2YKtBflxod+sihssS0nV5D5NRGKQW+G6OUBA3HvppFNhLUlXoIB
	OGWw==
X-Gm-Message-State: AG10YOSnp8UjoUmYQ11ZxE7fHwV2udLJPY3r666Og0P+d2JObpfd6f0g1KbSkbGyJfSxhw==
X-Received: by 10.194.174.36 with SMTP id bp4mr30754217wjc.137.1453928855465; 
	Wed, 27 Jan 2016 13:07:35 -0800 (PST)
Received: from localhost.localdomain
	(ARennes-655-1-93-157.w92-139.abo.wanadoo.fr. [92.139.132.157])
	by smtp.gmail.com with ESMTPSA id q6sm7963302wja.19.2016.01.27.13.07.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 13:07:35 -0800 (PST)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jan 2016 22:12:23 +0100
Message-Id: <1453929143-10975-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: [meta-multimedia][PATCH 2/2] rygel: Update to 0.28.2
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
X-List-Received-Date: Wed, 27 Jan 2016 21:07:35 -0000

From: Manuel Bachmann <mbc@iot.bzh>

Update to latest version. This mainly fixes file uploading,
which did not work in previous version (see upstream commit
"1d45866a3fd7ca47bdbea60156bd18b994710662" among others).

sqlite3 is now required to build whole rygel, as some
media-export plugin routines have been centralized ;
libunistring also improves collation logic if present.

Rygel will not keep running anymore when its "plugins"
folder is absent or empty. Thus, to avoid disappointments,
we now RRECOMMEND at least the media-export plugin.

Signed-off-by: Manuel Bachmann <mbc@iot.bzh>
---
 .../recipes-connectivity/rygel/rygel_0.26.1.bb     |   58 -------------------
 .../recipes-connectivity/rygel/rygel_0.28.2.bb     |   59 ++++++++++++++++++++
 2 files changed, 59 insertions(+), 58 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
 create mode 100644 meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
deleted file mode 100644
index af3f2be..0000000
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-SUMMARY = "A UPnP AV media server and renderer"
-DESCRIPTION = "Rygel is a home media solution (UPnP AV MediaServer) that \
-allow you to easily share audio, video and pictures to other devices. \
-Additionally, media player software may use Rygel to become a MediaRenderer \
-that may be controlled remotely by a UPnP or DLNA Controller."
-HOMEPAGE = "http://live.gnome.org/Rygel"
-
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
-                    file://src/rygel/rygel-main.vala;endline=25;md5=a4cce4d389da1c1638fe68d07ae9d811"
-
-DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0"
-RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
-
-GNOME_COMPRESS_TYPE = "xz"
-SRC_URI[archive.md5sum] = "f182d54913a528bb5b4fb2f291aca0fc"
-SRC_URI[archive.sha256sum] = "390740609e34399b886ddb9a8f7eca25055ad72048dfdd869edf02999b1e1d8f"
-
-inherit gnomebase vala
-
-EXTRA_OECONF = "--disable-introspection --disable-tracker-plugin --with-media-engine=gstreamer"
-
-PACKAGECONFIG ?= "external mpris mediathek ruih media-export gst-launch gtk+3"
-PACKAGECONFIG[external] = "--enable-external-plugin,--disable-external-plugin"
-PACKAGECONFIG[mpris] = "--enable-mpris-plugin,--disable-mpris-plugin"
-PACKAGECONFIG[mediathek] = "--enable-mediathek-plugin,--disable-mediathek-plugin"
-PACKAGECONFIG[ruih] = "--enable-ruih-plugin,--disable-ruih-plugin"
-PACKAGECONFIG[media-export] = "--enable-media-export-plugin,--disable-media-export-plugin,sqlite3"
-PACKAGECONFIG[gst-launch] = "--enable-gst-launch-plugin,--disable-gst-launch-plugin"
-PACKAGECONFIG[gtk+3] = ",--without-ui,gtk+3"
-
-LIBV = "2.6"
-
-do_install_append() {
-       # Remove .la files for loadable modules
-       rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
-       rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
-}
-
-FILES_${PN} += "${libdir}/rygel-${LIBV}/engines ${datadir}/dbus-1 ${datadir}/icons"
-FILES_${PN}-dbg += "${libdir}/rygel-${LIBV}/engines/.debug ${libdir}/rygel-${LIBV}/plugins/.debug"
-
-PACKAGES += "${PN}-meta"
-ALLOW_EMPTY_${PN}-meta = "1"
-
-PACKAGES_DYNAMIC = "${PN}-plugin-*"
-
-python populate_packages_prepend () {
-    rygel_libdir = d.expand('${libdir}/rygel-${LIBV}')
-    postinst = d.getVar('plugin_postinst', True)
-    pkgs = []
-
-    pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"), 'librygel-(.*)\.so$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
-    pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"), '(.*)\.plugin$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
-
-    metapkg = d.getVar('PN', True) + '-meta'
-    d.setVar('RDEPENDS_' + metapkg, ' '.join(pkgs))
-}
diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
new file mode 100644
index 0000000..663f55e
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
@@ -0,0 +1,59 @@
+SUMMARY = "A UPnP AV media server and renderer"
+DESCRIPTION = "Rygel is a home media solution (UPnP AV MediaServer) that \
+allow you to easily share audio, video and pictures to other devices. \
+Additionally, media player software may use Rygel to become a MediaRenderer \
+that may be controlled remotely by a UPnP or DLNA Controller."
+HOMEPAGE = "http://live.gnome.org/Rygel"
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://src/rygel/rygel-main.vala;endline=27;md5=99324118da4c012d25edae2f779ae9b3"
+
+DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0 libunistring sqlite3"
+RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
+RRECOMMENDS_${PN} = "rygel-plugin-media-export"
+
+GNOME_COMPRESS_TYPE = "xz"
+SRC_URI[archive.md5sum] = "9fbe4fb53b6cfa2f3f3723b7649a2215"
+SRC_URI[archive.sha256sum] = "9ea23df7186caac5f1aad3137edf6d507d339b9a469fc3133df4043fa66b61f5"
+
+inherit gnomebase vala
+
+EXTRA_OECONF = "--disable-introspection --disable-tracker-plugin --with-media-engine=gstreamer"
+
+PACKAGECONFIG ?= "external mpris mediathek ruih media-export gst-launch gtk+3"
+PACKAGECONFIG[external] = "--enable-external-plugin,--disable-external-plugin"
+PACKAGECONFIG[mpris] = "--enable-mpris-plugin,--disable-mpris-plugin"
+PACKAGECONFIG[mediathek] = "--enable-mediathek-plugin,--disable-mediathek-plugin"
+PACKAGECONFIG[ruih] = "--enable-ruih-plugin,--disable-ruih-plugin"
+PACKAGECONFIG[media-export] = "--enable-media-export-plugin,--disable-media-export-plugin"
+PACKAGECONFIG[gst-launch] = "--enable-gst-launch-plugin,--disable-gst-launch-plugin"
+PACKAGECONFIG[gtk+3] = ",--without-ui,gtk+3"
+
+LIBV = "2.6"
+
+do_install_append() {
+       # Remove .la files for loadable modules
+       rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
+       rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
+}
+
+FILES_${PN} += "${libdir}/rygel-${LIBV}/engines ${datadir}/dbus-1 ${datadir}/icons"
+FILES_${PN}-dbg += "${libdir}/rygel-${LIBV}/engines/.debug ${libdir}/rygel-${LIBV}/plugins/.debug"
+
+PACKAGES += "${PN}-meta"
+ALLOW_EMPTY_${PN}-meta = "1"
+
+PACKAGES_DYNAMIC = "${PN}-plugin-*"
+
+python populate_packages_prepend () {
+    rygel_libdir = d.expand('${libdir}/rygel-${LIBV}')
+    postinst = d.getVar('plugin_postinst', True)
+    pkgs = []
+
+    pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"), 'librygel-(.*)\.so$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
+    pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"), '(.*)\.plugin$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
+
+    metapkg = d.getVar('PN', True) + '-meta'
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(pkgs))
+}
-- 
1.7.10.4


