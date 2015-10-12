Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id AA3557704D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 11:40:27 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so145411928wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=oXQmLTXTuayQf1v4/Db3hEkpQD9lwAWd4TFx5tQZV80=;
	b=QYEuNdw75csbFh0kDV6MNni/7lH610OiuGy7tnbY54H0rx6SvxmLxo4DccWLYoCPLt
	H4x5Wj8luZmwAd0S3mSCOMAinuNdgu8fY6gtoZoze0WFFWq+SBfCXoU7+B/WBD6nfDt2
	db2J5UNTqMEC491keUZOMIowHOJBFZ480WEec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=oXQmLTXTuayQf1v4/Db3hEkpQD9lwAWd4TFx5tQZV80=;
	b=aMxo1t0/ML6N+fxeuSDWFQpImnmqU066kR05BjkvCi5DFAtyzHFGpSN6oepeUfYmhE
	3P/Uzxw1W2/qSpzZA/+x7IR4FIExqVAdyAzob0GqVsf4BcSIIZgsb1usQzTB+AcVttzP
	uUERWCXfc8R/UJucnFsBo3rMUfO1mJU0KtBRgb7FSvaL8f3PhkrXZHEo5fEm7mfmbWaP
	WuvU68K6vIc1CwXIIbJsqIpqaz8EtBcLOWn36lOdqQzF6WJD+gdhaPSMT5zS5zoiDaAk
	1LZluBG9VFndBF/nKiflfXydEwqqnEa5rdYBzejdlhkB18IzZFIAQhegbjX4Kb+pJYJ7
	PG1g==
X-Gm-Message-State: ALoCoQlqt1kA8P5CDyrvkNbKoq/E3+vqyuumSvsYgFUfUvd9gtURD6gTIVQ1Rzis1Woc0/pAbiv4
X-Received: by 10.181.29.102 with SMTP id jv6mr6431401wid.59.1444650027506;
	Mon, 12 Oct 2015 04:40:27 -0700 (PDT)
Received: from centos7.vannes.iot ([46.18.96.42])
	by smtp.gmail.com with ESMTPSA id
	uq5sm19379008wjc.3.2015.10.12.04.40.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Oct 2015 04:40:26 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Oct 2015 13:39:57 +0200
Message-Id: <1444649997-15077-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v3 4/4][meta-multimedia] rygel: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Oct 2015 11:40:28 -0000

Rygel is a UPnP Audio-Video media server, that allows to
share media files to other devices. It can also become a
MediaRenderer controlled by UPnP or DLNA Controllers.

Rygel makes use of the GStreamer library to recognize and
index media files. UPnp clients will then be able to browse
through them with the aid of metadata (artist, date...).

We do not propose to build without GStreamer support
(because then if cannot parse any actual media file, and
this is pointless), and for the same reason always include
the GStreamer engine in the main package ; but allow
separate packages for plugins.

(disable tracker plugin for now, because it pulls 3 layers
and needs us to have a PREFERRED udev provider, which is a
bit extreme for a first version)

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
Author: Manuel Bachmann <manuel.bachmann@iot.bzh>
Author: Ross Burton <ross.burton@intel.com>
---
 .../recipes-connectivity/rygel/rygel_0.26.1.bb     | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
new file mode 100644
index 0000000..af3f2be
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
@@ -0,0 +1,58 @@
+SUMMARY = "A UPnP AV media server and renderer"
+DESCRIPTION = "Rygel is a home media solution (UPnP AV MediaServer) that \
+allow you to easily share audio, video and pictures to other devices. \
+Additionally, media player software may use Rygel to become a MediaRenderer \
+that may be controlled remotely by a UPnP or DLNA Controller."
+HOMEPAGE = "http://live.gnome.org/Rygel"
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://src/rygel/rygel-main.vala;endline=25;md5=a4cce4d389da1c1638fe68d07ae9d811"
+
+DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0"
+RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
+
+GNOME_COMPRESS_TYPE = "xz"
+SRC_URI[archive.md5sum] = "f182d54913a528bb5b4fb2f291aca0fc"
+SRC_URI[archive.sha256sum] = "390740609e34399b886ddb9a8f7eca25055ad72048dfdd869edf02999b1e1d8f"
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
1.8.3.1


