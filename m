Return-Path: <mbc@koumoul.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 17ADA738AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 14:47:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u188so18228420wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 06:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=4vxaQ2wd6bChKL0NSj7EYY9KRjre+mmkysFRlCjHwPs=;
	b=YYseUopAdaDIJl4OZ0Heg9nFtjqUNZOkY9rLMHNkql64BpWir5anm5vTbyJPmtCFKt
	wklG/jEA2uTuPXXlJRWZNnHAE6KhXiXyEIR2oV2LJaHF+vjbhnBZN70pmCcm/FJc5OQH
	RanJhPVMNF8/D6dzUFOS4gdAy2z7inN1AsaoQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=4vxaQ2wd6bChKL0NSj7EYY9KRjre+mmkysFRlCjHwPs=;
	b=imPHYtXxaFOgN37kgv9Mh0mlmuu8kb1YeMl/D7MYxK1NZg9RGJivCzkqRBwJzTYvlt
	YscdK1UMFjh0OO/yLlOfQ9dqo3cZyMl4sjM5ZgPjhqANCcz9nqtY9Vv9agAc5Lozpn8k
	SmXqx5x9JI7Em43CxYPD2swKkgj5x53qI+5O4PqVlUsAUq+mqs9Jt34pGy4UiDydm545
	9QWyxc2+8W2m8rCtGJmjdC1TZkdjd7zZvJfSsu0esrtWeIu7JN03WAmzf545wucuIUdW
	l55ONUfOBumCxEbC7kbcbTKFeQ+BS+pOx9hb9YTdEj9UHA7RDEOujwyFF2ZjtwimeH3X
	CSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=4vxaQ2wd6bChKL0NSj7EYY9KRjre+mmkysFRlCjHwPs=;
	b=AosUcUjwxNwEYGMmX0iuYCU7nv1FkOnPBGv4ur5oFTbbSzcqKRlEiVNX3zCHzEkdL4
	G91u/n0vxbsad/oIwpOmhpuEeuraoRjmO3GCgij9OaYjxBPIt+9lm1Q6h/lzFW0IdcEs
	96jwRZ+227xfhCHsTj2UaE/3CRZC1LuGK/llXDVuhjtDRaAvTEuVyBEqpY7mJ34kawxl
	ZckUTabNnsnFcCUF9pM9C9/bBJ4m45u0P3ZW4mEl2dikdDXeW9HNdLN9fmP1EKzFyvnY
	XHMIVJ8pUOXE8/7DSBYhke49el+0UGhmLn5SJQ4P4RBVIoDMrvBdxKIh9asnix3fJ85m
	5U7w==
X-Gm-Message-State: AG10YOSqzV86Bc8bNDsLmi+xsCbTUeyxZ9h6I5BlMDZlvOgJ+gL4jDK/JP+JTrMvTMOB0w==
X-Received: by 10.194.104.38 with SMTP id gb6mr4175344wjb.22.1453474075606;
	Fri, 22 Jan 2016 06:47:55 -0800 (PST)
Received: from localhost.localdomain
	(ARennes-655-1-69-63.w109-218.abo.wanadoo.fr. [109.218.244.63])
	by smtp.gmail.com with ESMTPSA id
	x189sm7576743wmg.1.2016.01.22.06.47.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jan 2016 06:47:55 -0800 (PST)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2016 15:51:41 +0100
Message-Id: <1453474301-26578-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: [PATCH 2/2][meta-multimedia] rygel: Update to 0.28.2
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
X-List-Received-Date: Fri, 22 Jan 2016 14:47:56 -0000

From: Manuel Bachmann <mbc@iot.bzh>

Update to latest version. This mainly fixes file uploading,
which did not work in previous version (see upstream commit
"1d45866a3fd7ca47bdbea60156bd18b994710662" among others).

Rygel will not keep running anymore when its "plugins"
folder is absent or empty. Thus, to avoid disappointments,
we now RRECOMMEND at least the "media-export" plugin.

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
index 0000000..f1c47a0
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
+DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0"
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
+PACKAGECONFIG[media-export] = "--enable-media-export-plugin,--disable-media-export-plugin,sqlite3"
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


