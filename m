Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 111BA77310
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 12:39:41 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c85so10804529wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 04:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WxZzU9iZZgytBKx4LVCEe3OoFMs5Ht4QPyUCsyqdaqA=;
	b=nL6NZiK0BwsNN4y2GE/npy4qvK0Ucv4aCxgwx/11QG9VH//M4WE4avcL9GxrFPn0Ov
	dU7TXGdaSurz02CVjDdvqch14dNcFpKYIaQWHGE4A9gFcJPrkqFuaOUBBIEvm+5txH1v
	dIjtBeV+/3iQGh5N0omwCWEYAo85GWI1qvjnHzLdt9Qov7xIjtn/ZLTI1BwZFz5YsCAV
	32txO0FI4Wq2maz1Ux3bCeE3o7j1PzsxTGTflBjOjQK9/KVAt6gRLPP1fFTjjl2xLywN
	WBfyri4Ld6smm0rTVihBIygzduCUWTBPA1vnK3gcVPdNryMlU4zW8lM5J3hoVO4u8R1/
	pUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WxZzU9iZZgytBKx4LVCEe3OoFMs5Ht4QPyUCsyqdaqA=;
	b=gbNRorsx2vxHQkXh/YrmGs8YF/ViAofLxnZOsbOfIqJpKnpPc2GE82F4onU7hSna9Q
	bjT6owXxIW+VdMGWzYOBUqjP+nHSFiqSTyHGOM8QBT9QtessVEBxjl7KNE2BsE6+eEMR
	hYBYNRecAjj0oLfJJ41sjZXgqYO3DxtI4Es7jQMGz8sONrBJ9VLKcv9e2U+ivmMloKXi
	46ne/68RuDQIS6F3Du13ldIFAx265UXWs9/2WNTxNZL3+t6DSFetElzgyQZahoUACNrs
	8oEjwvCj4tiY475f+/AZVencFUyuGur75sqmNPT9SA3G5wbUGFcj+9ETyTyARvzdMSn7
	4aug==
X-Gm-Message-State: AMke39m2OBMo4sCOl2xMf3spe9rxJnT8A6RwPWRukPtvv59GqkyCCKdFY1PJwhJWmYhFaQ==
X-Received: by 10.28.32.198 with SMTP id g189mr10709949wmg.37.1486816780686;
	Sat, 11 Feb 2017 04:39:40 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s18sm5060065wmb.18.2017.02.11.04.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Feb 2017 04:39:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2017 13:39:35 +0100
Message-Id: <20170211123936.4128-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170211123936.4128-1-Martin.Jansa@gmail.com>
References: <20170211123936.4128-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/3] python-edbus exquisite elementary libeweather unionfs-fuse xfsprogs gmtk devilspie2 gnome-backgrounds gnome-desktop gnome-mime-data gtk-engines gtksourceview2 libgnomekbd libidl-native onboard libgpewidget ubi-utils-klibc kexec-tools-klibc gupnp-igd gupnp-tools dvb-apps gstreamer mpd crda openconnect openflow netcat-openbsd wireshark gnokii libmbim mosh networkmanager-openvpn libtelepathy dbus-daemon-proxy libdbus-c++ glibmm geany php vala-dbus-binding-tool collectd libgxim pywbem gtkhtml2 libglade fbida fontforge libsexy wayland-fits xstdcmap xf86-video-glamo font-adobe-100dpi font-adobe-utopia-100dpi font-bh-100dpi font-bh-lucidatypewriter-100dpi font-misc-misc crash audiofile a2jmidid libsdl2-mixer libsdl-mixer minidlna sylpheed libsdl2-ttf libsdl-ttf ode pidgin poppler postgresql syslog-ng usb-modeswitch xdg-user-dirs gateone python3-cryptography-vectors python3-ndg-httpsclient python-cryptography-vectors python-pbr bundler nostromo sthttpd netdata menulibre xfce4-notifyd openzone xfce4-verve-plugin iperf terminus-font xf86-video-nouveau ipmiutil klibc-utils pmbw gegl multipath-tools: Blacklist
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
X-List-Received-Date: Sat, 11 Feb 2017 12:39:42 -0000

* fails repeatedly as reported in:
  http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111112.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb                 | 2 ++
 meta-efl/recipes-efl/e17/exquisite_svn.bb                              | 2 ++
 meta-efl/recipes-efl/efl/elementary_1.15.1.bb                          | 2 ++
 meta-efl/recipes-efl/efl/libeweather_svn.bb                            | 2 ++
 meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb | 2 ++
 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb              | 2 ++
 meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb                    | 2 ++
 meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb                  | 2 ++
 meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb | 2 ++
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb         | 2 ++
 meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb     | 2 ++
 meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb             | 2 ++
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb        | 2 ++
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb                | 2 ++
 meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb                | 2 ++
 meta-gnome/recipes-support/onboard/onboard_1.3.0.bb                    | 2 ++
 meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb           | 2 ++
 meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb             | 2 ++
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb           | 2 ++
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb         | 2 ++
 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb          | 2 ++
 meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb       | 2 ++
 meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb                 | 2 ++
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb | 2 ++
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb              | 2 ++
 meta-networking/recipes-connectivity/crda/crda_3.18.bb                 | 2 ++
 meta-networking/recipes-connectivity/openconnect/openconnect_git.bb    | 2 ++
 meta-networking/recipes-protocols/openflow/openflow_git.bb             | 2 ++
 meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb         | 2 ++
 meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb           | 2 ++
 meta-oe/recipes-benchmark/pmbw/pmbw_git.bb                             | 2 ++
 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb                   | 2 ++
 meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb                 | 2 ++
 meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb                        | 2 ++
 .../networkmanager/networkmanager-openvpn_1.2.6.bb                     | 2 ++
 meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb           | 2 ++
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb                     | 2 ++
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb                         | 2 ++
 meta-oe/recipes-devtools/geany/geany_1.29.bb                           | 2 ++
 meta-oe/recipes-devtools/php/php_7.1.0.bb                              | 2 ++
 .../vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb               | 2 ++
 meta-oe/recipes-extended/collectd/collectd_5.5.0.bb                    | 2 ++
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb                      | 2 ++
 meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb                        | 3 +++
 meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb                         | 2 ++
 meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb                       | 2 ++
 meta-oe/recipes-graphics/fbida/fbida_2.10.bb                           | 2 ++
 meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb               | 2 ++
 meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb                            | 2 ++
 meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb                     | 2 ++
 meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb           | 2 ++
 meta-oe/recipes-graphics/wayland/wayland-fits_git.bb                   | 2 ++
 meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb                    | 2 ++
 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb           | 2 ++
 meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb      | 2 ++
 meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb          | 2 ++
 meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb   | 2 ++
 meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb             | 2 ++
 .../xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb                 | 2 ++
 meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb             | 2 ++
 meta-oe/recipes-kernel/crash/crash_7.1.5.bb                            | 2 ++
 meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb                | 2 ++
 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb                          | 2 ++
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb         | 2 ++
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb         | 2 ++
 meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb                  | 2 ++
 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb                      | 2 ++
 meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb                     | 2 ++
 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb                | 2 ++
 meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb               | 2 ++
 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb         | 2 ++
 meta-oe/recipes-support/ode/ode_0.13.bb                                | 3 +++
 meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb                        | 2 ++
 meta-oe/recipes-support/poppler/poppler_0.51.0.bb                      | 2 ++
 meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb                   | 2 ++
 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb         | 2 ++
 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb            | 2 ++
 meta-python/recipes-connectivity/gateone/gateone_git.bb                | 2 ++
 meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb | 2 ++
 meta-python/recipes-devtools/python/python-pbr_1.10.0.bb               | 2 ++
 .../recipes-devtools/python/python3-cryptography-vectors_1.6.bb        | 2 ++
 meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb   | 2 ++
 meta-ruby/recipes-devtools/ruby/bundler_git.bb                         | 2 ++
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb                | 2 ++
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb                 | 2 ++
 meta-webserver/recipes-webadmin/netdata/netdata_git.bb                 | 2 ++
 meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb                    | 2 ++
 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb            | 2 ++
 meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb                  | 2 ++
 meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb      | 2 ++
 90 files changed, 182 insertions(+)

diff --git a/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb b/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
index 9e5ff0a..ce7de83 100644
--- a/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
+++ b/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
@@ -4,3 +4,5 @@ PR = "r1"
 
 SRC_URI[md5sum] = "40b479444bb06147429a276127981890"
 SRC_URI[sha256sum] = "78e5ca334ee25185748660b4e612f984f4d3bced018f062278701429868f117b"
+
+PNBLACKLIST[python-edbus] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130600/"
diff --git a/meta-efl/recipes-efl/e17/exquisite_svn.bb b/meta-efl/recipes-efl/e17/exquisite_svn.bb
index 8f2d25d..1b1c659 100644
--- a/meta-efl/recipes-efl/e17/exquisite_svn.bb
+++ b/meta-efl/recipes-efl/e17/exquisite_svn.bb
@@ -39,3 +39,5 @@ INITSCRIPT_NAME = "exquisite"
 INITSCRIPT_PARAMS = "start 01 S . stop 20 0 1 6 ."
 
 FILES_${PN} += "/mnt/.splash/"
+
+PNBLACKLIST[exquisite] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130619/"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.15.1.bb b/meta-efl/recipes-efl/efl/elementary_1.15.1.bb
index f53eb44..894abc5 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.15.1.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.15.1.bb
@@ -14,3 +14,5 @@ SRC_URI[sha256sum] = "ae5540c2103fcdc69fd7469277ce25a8a00a0f701fc2c20771dc010840
 # autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
 # which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
 B = "${S}"
+
+PNBLACKLIST[elementary] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130584/"
diff --git a/meta-efl/recipes-efl/efl/libeweather_svn.bb b/meta-efl/recipes-efl/efl/libeweather_svn.bb
index eff8586..a2f4d57 100644
--- a/meta-efl/recipes-efl/efl/libeweather_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeweather_svn.bb
@@ -44,3 +44,5 @@ RRECOMMENDS_${PN} = "\
     ${PN}-themes \
     ${PN}-plugins \
 "
+
+PNBLACKLIST[libeweather] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130649/"
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
index d98d35a..18b9d6f 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
@@ -15,3 +15,5 @@ do_install() {
 }
 
 RDEPENDS_${PN} += "bash"
+
+PNBLACKLIST[unionfs-fuse] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130648/"
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
index 9959f0d..b4c50a2 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
@@ -54,3 +54,5 @@ do_configure_prepend () {
 do_install_append() {
         oe_runmake 'DESTDIR=${D}' install install-dev
 }
+
+PNBLACKLIST[xfsprogs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130663/"
diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
index d455f14..ddc10aa 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
@@ -14,3 +14,5 @@ SRC_URI[sha256sum] = "a07130d62719e8c1244f8405dd97445798df5204fc0f3f2f2b669b1251
 EXTRA_OECONF = "--disable-gconf --with-gio --with-alsa --enable-keystore"
 
 inherit gettext pkgconfig autotools gconf
+
+PNBLACKLIST[gmtk] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130661/"
diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
index b00a449..ab0ed4f 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
@@ -28,3 +28,5 @@ do_install() {
     install -d ${D}/${sysconfdir}/xdg/autostart
     install -m 644 ${WORKDIR}/devilspie2.desktop ${D}/${sysconfdir}/xdg/autostart
 }
+
+PNBLACKLIST[devilspie2] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130666/"
diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
index 2adb81b..eeddcb7 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
@@ -17,3 +17,5 @@ GNOME_COMPRESS_TYPE="bz2"
 
 FILES_${PN} += "${datadir}/gnome-background-properties"
 
+
+PNBLACKLIST[gnome-backgrounds] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130647/"
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index 17950fc..c94b659 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -24,3 +24,5 @@ do_configure_prepend () {
 PACKAGES =+ "libgnome-desktop"
 FILES_libgnome-desktop = "${libdir}/lib*${SOLIBS} ${datadir}/libgnome-desktop/pnp.ids"
 FILES_${PN} += "${datadir}/gnome-about"
+
+PNBLACKLIST[gnome-desktop] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130595/"
diff --git a/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb b/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb
index a31eb55..6dc80b5 100644
--- a/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb
@@ -17,3 +17,5 @@ GNOME_COMPRESS_TYPE="bz2"
 
 DEPENDS += "shared-mime-info intltool-native"
 RDEPENDS_${PN} = "shared-mime-info"
+
+PNBLACKLIST[gnome-mime-data] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130589/"
diff --git a/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 90ed5a4..2a0022b 100644
--- a/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -53,3 +53,5 @@ SRC_URI += "file://glib-2.32.patch \
             file://substitute-tests.patch"
 SRC_URI[archive.md5sum] = "5deb287bc6075dc21812130604c7dc4f"
 SRC_URI[archive.sha256sum] = "15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5"
+
+PNBLACKLIST[gtk-engines] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130602/"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
index 06ae4b1..ac7540e 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
@@ -29,3 +29,5 @@ do_configure_prepend() {
 }
 
 FILES_${PN} += " ${datadir}/gtksourceview-2.0"
+
+PNBLACKLIST[gtksourceview2] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130597/"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
index e5914e0..7735627 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
@@ -16,3 +16,5 @@ do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
     find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
 }
+
+PNBLACKLIST[libgnomekbd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130608/"
diff --git a/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb b/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
index a27da5e..dc126cd 100644
--- a/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
+++ b/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
@@ -8,3 +8,5 @@ DEPENDS = "bison-native glib-2.0-native"
 
 SRC_URI[md5sum] = "bb8e10a218fac793a52d404d14adedcb"
 SRC_URI[sha256sum] = "c5d24d8c096546353fbc7cedf208392d5a02afe9d56ebcc1cccb258d7c4d2220"
+
+PNBLACKLIST[libidl-native] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130582/"
diff --git a/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb b/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb
index 82393c3..3b4a0b4 100644
--- a/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb
+++ b/meta-gnome/recipes-support/onboard/onboard_1.3.0.bb
@@ -23,3 +23,5 @@ RDEPENDS_${PN} += " \
     python3-pycairo \
     python3-pygobject \
 "
+
+PNBLACKLIST[onboard] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130637/"
diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
index 87a3ed0..28fc1e3 100644
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
+++ b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
@@ -21,3 +21,5 @@ EXTRA_OECONF = "--enable-cairo --disable-gtk-doc"
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
 PACKAGES =+ "${PN}-bin"
+
+PNBLACKLIST[libgpewidget] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130594/"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb
index 06e71cb..ebf43bd 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb
@@ -12,3 +12,5 @@ require klibc-utils.inc
 require klibc.inc
 
 DEPENDS = "klibc"
+
+PNBLACKLIST[klibc-utils] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130679/"
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
index 8ca1ca7..81fae97 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
@@ -48,3 +48,5 @@ FILES_ubirename-klibc = "${sbindir}/ubirename"
 FILES_ubirmvol-klibc = "${sbindir}/ubirmvol"
 FILES_ubirsvol-klibc = "${sbindir}/ubirsvol"
 FILES_ubiupdatevol-klibc = "${sbindir}/ubiupdatevol"
+
+PNBLACKLIST[ubi-utils-klibc] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130665/"
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
index c9fec25..0e97046 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -38,3 +38,5 @@ PACKAGES =+ "kexec-klibc kdump-klibc"
 
 FILES_kexec-klibc = "${sbindir}/kexec"
 FILES_kdump-klibc = "${sbindir}/kdump"
+
+PNBLACKLIST[kexec-tools-klibc] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130674/"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
index 0cc4a3a..97680bf 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
@@ -12,3 +12,5 @@ SRC_URI[sha256sum] = "73b6a98a0f13b29b34c3bfc07f99f78b1319211cb95a8585752873af2b
 inherit autotools pkgconfig gtk-doc gobject-introspection
 
 EXTRA_OECONF = "--disable-python"
+
+PNBLACKLIST[gupnp-igd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130645/"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
index eda70e8..d42e3ff 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
@@ -10,3 +10,5 @@ SRC_URI[md5sum] = "ad8423d036e98bc6f877528d6b846f6a"
 SRC_URI[sha256sum] = "592c53289ff1cd70e676405c56ca87b28d2da37a385d34a3bb9b944ba9108d17"
 
 inherit autotools pkgconfig
+
+PNBLACKLIST[gupnp-tools] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130670/"
diff --git a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
index 0b4b72d..29e7396 100644
--- a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
@@ -132,3 +132,5 @@ RDEPENDS_dvb-scan =+ "libdvbapi libdvbcfg libdvbsec"
 RDEPENDS_dvb-apps =+ "libdvbapi libdvbcfg libdvbsec libdvben50221 libucsi"
 RDEPENDS_dvb-femon =+ "libdvbapi"
 RDEPENDS_dvbnet =+ "libdvbapi"
+
+PNBLACKLIST[dvb-apps] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130603/"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
index 512a28f..fa80dda 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
@@ -51,3 +51,5 @@ RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-raw
 FILES_${PN} += " ${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dev += " ${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
 FILES_${PN}-dbg += " ${libdir}/gstreamer-0.10/.debug/ ${libexecdir}/gstreamer-0.10/.debug/"
+
+PNBLACKLIST[gstreamer] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130583/"
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
index 82518d6..a2b85b8 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
@@ -63,3 +63,5 @@ USERADD_PARAM_${PN} = " \
     --home ${localstatedir}/lib/mpd \
     --groups audio \
     --user-group mpd"
+
+PNBLACKLIST[mpd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130612/"
diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index dbddd55..2aa9a09 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -34,3 +34,5 @@ do_install() {
 }
 
 RDEPENDS_${PN} = "udev wireless-regdb"
+
+PNBLACKLIST[crda] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130675/"
diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
index 60e7e6e..d5fe22f 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
@@ -25,3 +25,5 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF += "--with-vpnc-script=${SYSROOT_DESTDIR}${sysconfdir}/vpnc/vpnc-script \
                  --disable-static"
+
+PNBLACKLIST[openconnect] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130672/"
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index 6403bfb..4fb3e4f 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -2,3 +2,5 @@ include ${BPN}.inc
 
 SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
 PV = "1.0+git${SRCPV}"
+
+PNBLACKLIST[openflow] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130643/"
diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
index 0afe10c..bb21e0c 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -42,3 +42,5 @@ do_install() {
     install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
 }
 ALTERNATIVE_PRIORITY = "60"
+
+PNBLACKLIST[netcat-openbsd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130673/"
diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
index 29dfbfe..a012d84 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
@@ -69,3 +69,5 @@ do_install_append () {
 }
 
 FILES_${PN} += "${datadir}*"
+
+PNBLACKLIST[wireshark] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130671/"
diff --git a/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb b/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb
index 7a69395..9cdaa96 100644
--- a/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb
+++ b/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb
@@ -26,3 +26,5 @@ PACKAGES =+ "${PN}-stats2gnuplot"
 FILES_${PN}-stats2gnuplot = "${bindir}/stats2gnuplot"
 
 RRECOMMENDS_${PN} = "${PN}-stats2gnuplot"
+
+PNBLACKLIST[pmbw] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130568/"
diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
index 2de547a..1d367ad 100644
--- a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
+++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
@@ -32,3 +32,5 @@ FILES_libgnokii = "${libdir}/libgnokii.so.*"
 
 SRC_URI[md5sum] = "d9627f4a1152d3ea7806df4532850d5f"
 SRC_URI[sha256sum] = "8f5a083b05c1a66a3402ca5cd80084e14c2c0632c991bb53b03c78e9adb02501"
+
+PNBLACKLIST[gnokii] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130662/"
diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
index 02a1788..0f18112 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
@@ -16,3 +16,5 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
 "
 SRC_URI[md5sum] = "2ed809e65c85353d3ab59e372890e549"
 SRC_URI[sha256sum] = "ca8d52a95a18cbabae8f15f83f1572316e888b6504f946e6645d24405127ab5b"
+
+PNBLACKLIST[libmbim] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130590/"
diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
index 4bf238d..91b8763 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
@@ -45,3 +45,5 @@ RDEPENDS_${PN}-server += "openssh-sshd ${NEEDED_PERL_MODULES}"
 #| {standard input}:2103: Error: instruction not supported in Thumb16 mode -- `adcs r7,r7,r7'
 #| {standard input}:2104: Error: selected processor does not support Thumb mode `it cs'
 ARM_INSTRUCTION_SET = "arm"
+
+PNBLACKLIST[mosh] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130653/"
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
index 7ae566e..e2b28dd 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
@@ -33,3 +33,5 @@ RDEPENDS_${PN} = " \
     networkmanager \
     openvpn \
 "
+
+PNBLACKLIST[networkmanager-openvpn] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130667/"
diff --git a/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
index c398dc1..9fb69a1 100644
--- a/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
+++ b/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
@@ -22,3 +22,5 @@ inherit autotools pkgconfig pythonnative
 
 FILES_${PN} += "${datadir}/telepathy \
     ${datadir}/dbus-1"
+
+PNBLACKLIST[libtelepathy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130609/"
diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
index 205e1d1..da94138 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -20,3 +20,5 @@ do_install() {
     install -m 0755 dbus-daemon-proxy ${D}${bindir}
 }
 
+
+PNBLACKLIST[dbus-daemon-proxy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130613/"
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
index 9b053fe..3a62c3d 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
+++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
@@ -27,3 +27,5 @@ PACKAGE_BEFORE_PN = "${PN}-tools"
 FILES_${PN}-tools = "${bindir}"
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[libdbus-c++] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130644/"
diff --git a/meta-oe/recipes-devtools/geany/geany_1.29.bb b/meta-oe/recipes-devtools/geany/geany_1.29.bb
index db6a34a..7a7ef7d 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.29.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.29.bb
@@ -13,3 +13,5 @@ SRC_URI[sha256sum] = "394307596bc908419617e4c33e93eae8b5b733dfc8d01161677b8cbd3a
 FILES_${PN} += "${datadir}/icons"
 
 EXTRA_OECONF = "--disable-html-docs"
+
+PNBLACKLIST[geany] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130611/"
diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb b/meta-oe/recipes-devtools/php/php_7.1.0.bb
index 210d91f..ee8155c 100644
--- a/meta-oe/recipes-devtools/php/php_7.1.0.bb
+++ b/meta-oe/recipes-devtools/php/php_7.1.0.bb
@@ -12,3 +12,5 @@ PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
                         ,mysql5"
 
 FILES_${PN}-fpm += "${sysconfdir}/php-fpm.d/www.conf.default"
+
+PNBLACKLIST[php] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130601/"
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
index 02a869f..bcc6c98 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
@@ -16,3 +16,5 @@ SRC_URI = "git://github.com/freesmartphone/vala-dbus-binding-tool.git;protocol=h
     file://0001-configure.ac-don-t-use-dash-in-m4-macro-names.patch \
 "
 S = "${WORKDIR}/git"
+
+PNBLACKLIST[vala-dbus-binding-tool] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130581/"
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
index 34edecf..b544b92 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
@@ -86,3 +86,5 @@ INITSCRIPT_PARAMS = "defaults"
 # threshold.so load.so are also provided by gegl
 # disk.so is also provided by libgphoto2-camlibs
 PRIVATE_LIBS = "threshold.so load.so disk.so"
+
+PNBLACKLIST[collectd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130654/"
diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
index 2e002f3..26da755 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -23,3 +23,5 @@ EXTRA_OECONF = " --disable-static --disable-rebuilds --enable-compile-warnings=m
 DEPENDS += "gtk+ glib-2.0 ruby-native intltool-native gnome-common-native"
 
 inherit autotools pkgconfig gettext
+
+PNBLACKLIST[libgxim] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130604/"
diff --git a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
index 2f9a5bd..8b5394e 100644
--- a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
+++ b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
@@ -34,3 +34,6 @@ do_install_append() {
 }
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[pywbem] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130596/"
+PNBLACKLIST[pywbem] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130681/"
diff --git a/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
index cd22576..86265bb 100644
--- a/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ b/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
@@ -37,3 +37,5 @@ S = "${WORKDIR}/trunk"
 inherit pkgconfig autotools
 
 EXTRA_OECONF = " --disable-accessibility"
+
+PNBLACKLIST[gtkhtml2] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130633/"
diff --git a/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb b/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb
index 8cd023a..8fbc68a 100644
--- a/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -29,3 +29,5 @@ FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-data = "${datadir}/xml/libglade/glade-2.0.dtd"
 FILES_${PN}-dev += "${bindir}/libglade-convert"
 #RDEPENDS_${PN} = "${PN}-data"
+
+PNBLACKLIST[libglade] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130585/"
diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
index c14fc9b..6e786f2 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
@@ -64,3 +64,5 @@ do_install() {
 }
 
 RDEPENDS_${PN} = "ttf-dejavu-sans-mono bash"
+
+PNBLACKLIST[fbida] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130677/"
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
index 544149d..7d30312 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
@@ -58,3 +58,5 @@ RDEPENDS_${PN}-python = "python"
 
 # for e.g kde's oxygen-fonts
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[fontforge] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130639/"
diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb b/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
index 9de8489..5e1f2e2 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
@@ -28,3 +28,5 @@ FILES_${PN}-dev_remove = "${libdir}/lib*.so"
 # gegl-0.2.0/operations/common/matting-global.c: In function 'matting_process':
 # gegl-0.2.0/operations/common/matting-global.c:463:1: internal compiler error: in patch_jump_insn, at cfgrtl.c:1275
 ARM_INSTRUCTION_SET = "arm"
+
+PNBLACKLIST[gegl] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130509/"
diff --git a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
index 86b4958..e96edd2 100644
--- a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
+++ b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
@@ -4,3 +4,5 @@ PR = "r2"
 
 SRC_URI[md5sum] = "33c079a253270ec8bfb9508e4bb30754"
 SRC_URI[sha256sum] = "8c4101a8cda5fccbba85ba1a15f46f2cf75deaa8b3c525ce5b135b9e1a8fe49e"
+
+PNBLACKLIST[libsexy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130607/"
diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
index e5bea97..de8038a 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
@@ -43,3 +43,5 @@ PACKAGES += "${PN}-consolefonts ${PN}-consoletrans ${PN}-pcf"
 FILES_${PN}-consolefonts = "${datadir}/consolefonts"
 FILES_${PN}-consoletrans = "${datadir}/consoletrans"
 FILES_${PN}-pcf = "${datadir}/fonts/terminus"
+
+PNBLACKLIST[terminus-font] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130638/"
diff --git a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
index d060c47..ea7c750 100755
--- a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
+++ b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
@@ -31,3 +31,5 @@ do_install_append() {
 
 FILES_${PN} += "${bindir}/wfits ${libdir}/weston/*.so"
 FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/weston/.debug ${prefix}/src"
+
+PNBLACKLIST[wayland-fits] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130632/"
diff --git a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb
index 3f5511e..db902d9 100644
--- a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb
@@ -13,3 +13,5 @@ BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "eb5473acaef15a5db9b50df29c6a7f90"
 SRC_URI[sha256sum] = "f648e2b0cf16aa29856de998e2c7204be39dc1f8daeda9464d32288e0b580fc1"
+
+PNBLACKLIST[xstdcmap] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130660/"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index 74c066f..97d80c2 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -21,3 +21,5 @@ S = "${WORKDIR}/git"
 SRCREV = "cb9ed17035a79e49dde26a1e7e2bc5f10fd8144b"
 
 EXTRA_OECONF = " --disable-kms "
+
+PNBLACKLIST[xf86-video-glamo] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130629/"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb
index 3a7507c..436c92c 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb
@@ -15,3 +15,5 @@ COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 SRC_URI[md5sum] = "dc79910c7b9e32321cefc7af250c7765"
 SRC_URI[sha256sum] = "0ea057ad7fc31caba2d4e46c7e418fe2b3c762b04fb8d382f53383397fd8391e"
 
+
+PNBLACKLIST[xf86-video-nouveau] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130657/"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
index 85a4466..03ee525 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
@@ -16,3 +16,5 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "1347c3031b74c9e91dc4dfa53b12f143"
 SRC_URI[sha256sum] = "b2c08433eab5cb202470aa9f779efefce8d9cab2534f34f3aa4a31d05671c054"
+
+PNBLACKLIST[font-adobe-100dpi] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130621/"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
index 16e3d2c..54be284 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
@@ -16,3 +16,5 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "66fb6de561648a6dce2755621d6aea17"
 SRC_URI[sha256sum] = "d16f5e3f227cc6dd07a160a71f443559682dbc35f1c056a5385085aaec4fada5"
+
+PNBLACKLIST[font-adobe-utopia-100dpi] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130623/"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
index 08ed6b6..d32a47b 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
@@ -16,3 +16,5 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "9f11ade089d689b9d59e0f47d26f39cd"
 SRC_URI[sha256sum] = "23c07162708e4b79eb33095c8bfa62c783717a9431254bbf44863734ea239481"
+
+PNBLACKLIST[font-bh-100dpi] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130624/"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
index 5ded41a..bffeb95 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
@@ -16,3 +16,5 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "c8b73a53dcefe3e8d3907d3500e484a9"
 SRC_URI[sha256sum] = "62a83363c2536095fda49d260d21e0847675676e4e3415054064cbdffa641fbb"
+
+PNBLACKLIST[font-bh-lucidatypewriter-100dpi] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130625/"
diff --git a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
index a7c284a..342572a 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
@@ -15,3 +15,5 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "c88eb44b3b903d79fb44b860a213e623"
 SRC_URI[sha256sum] = "b8e77940e4e1769dc47ef1805918d8c9be37c708735832a07204258bacc11794"
+
+PNBLACKLIST[font-misc-misc] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130628/"
diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.5.bb b/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
index 936438b..3ea5820 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
@@ -111,3 +111,5 @@ RDEPENDS_${PN}_class-cross = ""
 # Causes gcc to get stuck and eat all available memory in qemuarm builds
 # jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
 ARM_INSTRUCTION_SET = "arm"
+
+PNBLACKLIST[crash] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130678/"
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 2d67b5a..b33038e 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -20,3 +20,5 @@ SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8c
 inherit autotools lib_package binconfig
 
 DEPENDS = "asciidoc-native libogg flac"
+
+PNBLACKLIST[audiofile] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130588/"
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
index d7e93b6..325140e 100644
--- a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
@@ -20,3 +20,5 @@ inherit waf
 export LINKFLAGS="${LDFLAGS}"
 
 FILES_${PN} += "${datadir}/dbus-1/services"
+
+PNBLACKLIST[a2jmidid] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130646/"
diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
index f1a01b9..06623f8 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
@@ -38,3 +38,5 @@ do_configure () {
     done
 }
 
+
+PNBLACKLIST[libsdl-mixer] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130592/"
diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
index 2dc48e4..3080d59 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
@@ -25,3 +25,5 @@ do_configure_prepend () {
         rm -f acinclude/$i
     done
 }
+
+PNBLACKLIST[libsdl2-mixer] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130659/"
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb
index 7c6db62..9892e35 100644
--- a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb
@@ -2,3 +2,5 @@ require ${BPN}.inc
 
 SRCREV = "v1_1_5"
 LIC_FILES_CHKSUM = "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
+
+PNBLACKLIST[minidlna] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130630/"
diff --git a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
index 304b654..4e4fe68 100644
--- a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
+++ b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
@@ -29,3 +29,5 @@ do_configure_prepend() {
 
 inherit autotools pkgconfig
 
+
+PNBLACKLIST[sylpheed] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130651/"
diff --git a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
index 8d36a32..925a8f7 100644
--- a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
+++ b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
@@ -60,3 +60,5 @@ do_install () {
 }
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
+
+PNBLACKLIST[ipmiutil] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130641/"
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb
index 0249abe..091d6ef 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb
@@ -25,3 +25,5 @@ do_configure_prepend() {
         rm -f ${S}/acinclude/$i
     done
 }
+
+PNBLACKLIST[libsdl-ttf] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130598/"
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
index af5a55c..da74fba 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
@@ -25,3 +25,5 @@ do_configure_prepend() {
         rm -f ${S}/acinclude/$i
     done
 }
+
+PNBLACKLIST[libsdl2-ttf] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130656/"
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index e107c8f..6706bec 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -59,3 +59,5 @@ FILES_kpartx = "${base_sbindir}/kpartx \
                "
 
 RDEPENDS_${PN} += "kpartx"
+
+PNBLACKLIST[multipath-tools] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130529/"
diff --git a/meta-oe/recipes-support/ode/ode_0.13.bb b/meta-oe/recipes-support/ode/ode_0.13.bb
index 2dc82a8..5d47a66 100644
--- a/meta-oe/recipes-support/ode/ode_0.13.bb
+++ b/meta-oe/recipes-support/ode/ode_0.13.bb
@@ -26,3 +26,6 @@ PACKAGECONFIG ?= ""
 # if it isn't explicitly selected and "$build_os" == "$target_os", then configure will run
 # series of AC_TRY_RUN which won't work for cross-compilation and configure fails
 PACKAGECONFIG[double-precision] = "--enable-double-precision,--disable-double-precision"
+
+PNBLACKLIST[ode] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130599/"
+PNBLACKLIST[ode] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130620/"
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb b/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb
index e997146..aacb30a 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb
@@ -118,3 +118,5 @@ python populate_packages_prepend () {
         description='Finch plugin %s',
         prepend=True, extra_depends='')
 }
+
+PNBLACKLIST[pidgin] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130634/"
diff --git a/meta-oe/recipes-support/poppler/poppler_0.51.0.bb b/meta-oe/recipes-support/poppler/poppler_0.51.0.bb
index 4aa2dba..90c2056 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.51.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.51.0.bb
@@ -60,3 +60,5 @@ FILES_libpoppler = "${libdir}/libpoppler.so.*"
 FILES_libpoppler-glib = "${libdir}/libpoppler-glib.so.*"
 
 RDEPENDS_libpoppler = "poppler-data"
+
+PNBLACKLIST[poppler] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130593/"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
index 73609af..bee1e19 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
@@ -13,3 +13,5 @@ SRC_URI += " \
 
 SRC_URI[md5sum] = "e9f401615e92e5eb27396c995c1446ba"
 SRC_URI[sha256sum] = "7be11df31ac7d716f1f952e22b5ae8e2049edd633a41b223776a853d9106f4e7"
+
+PNBLACKLIST[syslog-ng] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130631/"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
index 425f66b..5211d7b 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
@@ -17,3 +17,5 @@ RRECOMMENDS_${PN} = "usb-modeswitch-data"
 do_install() {
     oe_runmake DESTDIR=${D} install
 }
+
+PNBLACKLIST[usb-modeswitch] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130620/"
diff --git a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
index b94e0cc..22b4bb6 100644
--- a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
+++ b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
@@ -20,3 +20,5 @@ CONFFILES_${PN} += " \
     ${sysconfdir}/xdg/user-dirs.conf \
     ${sysconfdir}/xdg/user-dirs.defaults \
 "
+
+PNBLACKLIST[xdg-user-dirs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130635/"
diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
index 8b2a192..ba9a799 100644
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
@@ -86,3 +86,5 @@ RDEPENDS_${PN} = "mime-support \
 
 SYSTEMD_SERVICE_${PN} = "gateone.service"
 INITSCRIPT_NAME = "gateone"
+
+PNBLACKLIST[gateone] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130642/"
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb
index 4975278..92b4907 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools
 require python-cryptography-vectors.inc
+
+PNBLACKLIST[python-cryptography-vectors] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130664/"
diff --git a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
index 7fddf7a..74d7866 100644
--- a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
@@ -14,3 +14,5 @@ RDEPENDS_${PN}_class-target += " \
         "
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[python-pbr] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130650/"
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb
index 58994ff..909bbb4 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools3
 require python-cryptography-vectors.inc
+
+PNBLACKLIST[python3-cryptography-vectors] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130626/"
diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb
index 3f07b2e..c8fb94e 100644
--- a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools3
 require python-ndg-httpsclient.inc
+
+PNBLACKLIST[python3-ndg-httpsclient] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130615/"
diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
index 31e72e5..f2d8f3c 100644
--- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
+++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
@@ -29,3 +29,5 @@ inherit ruby
 RDEPENDS_${PN} = "git"
 
 BBCLASSEXTEND = "native"
+
+PNBLACKLIST[bundler] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130640/"
diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
index 5493c12..cefcb8a 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
@@ -62,3 +62,5 @@ pkg_postinst_${PN} () {
         fi
     fi
 }
+
+PNBLACKLIST[nostromo] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130655/"
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb
index efa533a..74363ce 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb
@@ -50,3 +50,5 @@ SYSTEMD_SERVICE_${PN} = "thttpd.service"
 FILES_${PN} += "${SRV_DIR}"
 FILES_${PN}-dbg += "${SRV_DIR}/cgi-bin/.debug"
 
+
+PNBLACKLIST[sthttpd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130676/"
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index 40b32ad..ec74320 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -51,3 +51,5 @@ do_install_append() {
 
 FILES_${PN}-dbg += "${libexecdir}/netdata/plugins.d/.debug"
 RDEPENDS_${PN} = "bash zlib"
+
+PNBLACKLIST[netdata] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130636/"
diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb
index e945f01..73af1a8 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb
@@ -34,3 +34,5 @@ RDEPENDS_${PN} += " \
     python3-unixadmin \
     python3-psutil \
 "
+
+PNBLACKLIST[menulibre] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130617/"
diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb
index 6310a17..80cb591 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb
@@ -19,3 +19,5 @@ FILES_${PN} += " \
     ${datadir}/themes \
     ${datadir}/dbus-1 \
 "
+
+PNBLACKLIST[xfce4-notifyd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130616/"
diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
index 9547736..bf4b0d8 100644
--- a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
+++ b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
@@ -27,3 +27,5 @@ python populate_packages_prepend () {
 
 PACKAGES_DYNAMIC += "^openzone-.*"
 ALLOW_EMPTY_${PN} = "1"
+
+PNBLACKLIST[openzone] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130682/"
diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb
index 65503a4..e11c433 100644
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb
@@ -7,3 +7,5 @@ inherit xfce-panel-plugin
 
 SRC_URI[md5sum] = "ddd0190ae56f6117dbcf9ff2bf5a8cbf"
 SRC_URI[sha256sum] = "a3196f818c7ad57d19cd6581e168fd2b9f96de070246aea70c35ce2e5f9d9c84"
+
+PNBLACKLIST[xfce4-verve-plugin] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130622/"
-- 
2.10.2


