Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id DAFDE601A3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 May 2014 17:02:05 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id ik5so6756362vcb.18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 May 2014 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZtyvG31+VMjZM//ATAgis+Olmo4LCh16tXqAluZSvos=;
	b=hhT2LzxyqlUN6GDSRdiJ9eJviX8c2eMztQquVOySy35TmjqUyNZa3CukGhCY2Iyas+
	6tsTIfwOjzU8cWSYCYyBunoDc/d5TFKEpUbJhd48swhtlxHfE9W65aN9n4xnDcbCv/po
	sJOXg92kBanDS0jsAWZJWVyA7lz5jVKzjvYCxewkWSpYoLt2JodefaZfn1rg+7Wt2FOn
	cKShhmQQjXY0JgOhbq0xTMFW/vJJvurrN5hPOaYnQ4i7ruQWFoMyLAeWLxTyY9dLh1BF
	HF7Pe/s/gWY+OupJUJ+DIuGdiokscAsS8UB/+HoT3LjvE6nLIhyez6sP+Zh3U/C4CaNj
	FYaQ==
X-Received: by 10.221.34.7 with SMTP id sq7mr18641141vcb.5.1399136526387;
	Sat, 03 May 2014 10:02:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	tf10sm5902142vdc.0.2014.05.03.10.02.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 May 2014 10:02:05 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 May 2014 19:02:18 +0200
Message-Id: <1399136538-6276-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1399136538-6276-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399136538-6276-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 2/2] recipes: inherit autotools-brokensep or set B = ${S} for failing recipes
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
X-List-Received-Date: Sat, 03 May 2014 17:02:08 -0000

* this 'marks' broken recipes and allows to get resonable report from world builds
  but ideally we should fix the issues in the recipes or the components.

* I'll keep this on ML for a while to see if we find some volunteers to fix their
  favourite recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/cpu_svn.bb                       |  2 ++
 meta-efl/recipes-efl/e17/diskio_svn.bb                    |  2 ++
 meta-efl/recipes-efl/e17/e-wm_0.18.7.bb                   |  2 ++
 meta-efl/recipes-efl/e17/edje-viewer_svn.bb               |  2 ++
 meta-efl/recipes-efl/e17/elfe_git.bb                      |  2 ++
 meta-efl/recipes-efl/e17/elmdentica_svn.bb                |  2 ++
 meta-efl/recipes-efl/e17/enjoy_git.bb                     |  2 ++
 meta-efl/recipes-efl/e17/ephoto_svn.bb                    |  2 ++
 meta-efl/recipes-efl/e17/eve_git.bb                       |  2 ++
 meta-efl/recipes-efl/e17/exalt-client_svn.bb              |  2 ++
 meta-efl/recipes-efl/e17/exalt_svn.bb                     |  2 ++
 meta-efl/recipes-efl/e17/exquisite_svn.bb                 |  2 ++
 meta-efl/recipes-efl/e17/flame_svn.bb                     |  2 ++
 meta-efl/recipes-efl/e17/forecasts_svn.bb                 |  2 ++
 meta-efl/recipes-efl/e17/places_svn.bb                    |  2 ++
 meta-efl/recipes-efl/e17/rain_svn.bb                      |  2 ++
 meta-efl/recipes-efl/e17/terminology_0.4.0.bb             |  2 ++
 meta-efl/recipes-efl/e17/uptime_svn.bb                    |  2 ++
 meta-efl/recipes-efl/efl/azy_svn.bb                       |  2 ++
 meta-efl/recipes-efl/efl/elementary_1.9.3.bb              |  2 ++
 meta-efl/recipes-efl/efl/entrance_svn.bb                  |  2 ++
 meta-efl/recipes-efl/efl/expedite_1.7.9.bb                |  2 ++
 meta-efl/recipes-efl/efl/libeflvala_svn.bb                |  2 +-
 .../lightmediascanner/lightmediascanner_0.4.4.bb          |  2 +-
 meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb   |  2 +-
 .../network-manager-applet_0.9.8.0.bb                     |  2 ++
 meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb      |  2 ++
 .../recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb       |  2 ++
 .../gnome-power-manager/gnome-power-manager_2.32.0.bb     |  2 ++
 .../gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb |  2 ++
 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb      |  2 ++
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb   |  2 ++
 meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb   |  2 ++
 meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb      |  2 ++
 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb          |  3 ++-
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb     |  2 +-
 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb      |  2 ++
 .../recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb            |  2 +-
 .../dleyna/renderer-service-upnp_0.3.0.bb                 |  2 +-
 meta-multimedia/recipes-multimedia/faac/faac_1.28.bb      |  2 +-
 .../recipes-multimedia/libdc1394/libdc1394_git.bb         |  2 +-
 .../schroedinger/schroedinger_1.0.11.bb                   |  2 +-
 meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb       |  2 ++
 .../recipes-connectivity/barnyard2/barnyard2_1.8.bb       |  2 +-
 meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb    |  2 +-
 .../recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb       |  2 +-
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb |  2 +-
 meta-networking/recipes-daemons/radvd/radvd_1.9.8.bb      |  2 ++
 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb  |  2 +-
 meta-networking/recipes-daemons/vblade/vblade_20.bb       |  2 +-
 .../conntrack-tools/conntrack-tools_1.4.0.bb              |  2 +-
 meta-networking/recipes-irc/znc/znc_git.bb                |  2 +-
 .../recipes-protocols/openflow/openflow_git.bb            |  2 ++
 .../recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb            |  2 +-
 meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb    |  2 +-
 meta-networking/recipes-support/iftop/iftop_1.0pre2.bb    |  2 +-
 meta-networking/recipes-support/netcf/netcf_git.bb        |  2 +-
 .../recipes-support/tcpreplay/tcpreplay_3.4.4.bb          |  2 +-
 meta-oe/recipes-benchmark/dbench/dbench_4.0.bb            |  2 +-
 meta-oe/recipes-connectivity/daq/daq_2.0.2.bb             |  2 +-
 meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb          |  2 +-
 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb       |  2 +-
 .../networkmanager/networkmanager_0.9.8.0.bb              |  2 ++
 .../recipes-connectivity/phonet-utils/phonet-utils_git.bb |  2 +-
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb         |  2 ++
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb    |  2 +-
 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb                  |  2 ++
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb             |  2 ++
 .../recipes-devtools/concurrencykit/concurrencykit_git.bb |  2 +-
 meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb     |  2 +-
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb             |  2 +-
 meta-oe/recipes-devtools/php/php_5.4.14.bb                |  2 ++
 meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb                |  2 +-
 .../recipes-extended/dialog/dialog-static_1.1-20120706.bb |  2 ++
 meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb    |  2 ++
 meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb        |  2 +-
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb            |  2 +-
 meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb         |  2 ++
 meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb     |  2 +-
 meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb  |  2 +-
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb         |  2 +-
 meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb  |  2 +-
 meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb     |  2 +-
 meta-oe/recipes-extended/tmux/tmux_1.6.bb                 |  2 +-
 meta-oe/recipes-extended/zsh/zsh_5.0.5.bb                 |  2 ++
 meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb     |  2 ++
 meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb             |  2 +-
 meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb               |  2 +-
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb                 |  2 +-
 meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb          |  2 +-
 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb       |  2 ++
 .../recipes-graphics/xorg-driver/xf86-input-mtev_git.bb   |  2 ++
 .../libsdl-image/libsdl-image_1.2.12.bb                   |  2 +-
 .../libsdl-mixer/libsdl-mixer_1.2.12.bb                   |  2 +-
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb        |  2 +-
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb    |  2 +-
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb           |  2 +-
 meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb            |  2 +-
 meta-oe/recipes-navigation/omgps/omgps_svn.bb             |  2 +-
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb           |  2 +-
 meta-oe/recipes-qt/qconnman/qconnman-e_git.bb             |  2 ++
 meta-oe/recipes-qt/qconnman/qconnman_git.bb               |  2 ++
 meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb       |  2 ++
 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb         |  2 +-
 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb        |  2 +-
 meta-oe/recipes-support/daemonize/daemonize_git.bb        |  2 +-
 meta-oe/recipes-support/debianutils/debianutils_4.4.bb    |  2 +-
 meta-oe/recipes-support/eject/eject_2.1.5.bb              |  2 +-
 meta-oe/recipes-support/emacs/emacs_23.4.bb               |  2 ++
 meta-oe/recipes-support/enca/enca_1.9.bb                  |  2 +-
 meta-oe/recipes-support/flite/flite-alsa_1.3.bb           |  2 ++
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb               |  2 +-
 meta-oe/recipes-support/gpm/gpm_1.99.7.bb                 |  2 +-
 meta-oe/recipes-support/lcms/lcms_1.17.bb                 | 15 +++++++++++++++
 meta-oe/recipes-support/libetpan/libetpan_0.57.bb         |  2 +-
 meta-oe/recipes-support/libol/libol_0.3.18.bb             |  2 +-
 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb   |  2 +-
 meta-oe/recipes-support/libusbg/libusbg_git.bb            |  2 +-
 meta-oe/recipes-support/lockdev/lockdev_git.bb            |  2 +-
 meta-oe/recipes-support/maliit/maliit-framework_git.bb    |  2 +-
 meta-oe/recipes-support/maliit/maliit-plugins_git.bb      |  2 +-
 meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb       |  2 +-
 meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb    |  2 ++
 meta-oe/recipes-support/mysql/mariadb_5.1.67.bb           |  2 ++
 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb      |  2 +-
 meta-oe/recipes-support/pidgin/libotr_4.0.0.bb            |  2 +-
 meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb    |  2 ++
 meta-oe/recipes-support/pv/pv_1.4.6.bb                    |  2 +-
 meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb           |  2 +-
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb            |  2 +-
 .../usb-modeswitch/usb-modeswitch_2.0.1.bb                |  2 +-
 .../recipes-support/vala-terminal/vala-terminal_git.bb    |  2 +-
 meta-oe/recipes-support/xchat/xchat_2.8.8.bb              |  2 +-
 meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb    |  2 +-
 meta-webserver/recipes-php/modphp/modphp_5.5.10.bb        |  2 ++
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb         |  2 +-
 .../recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb     |  2 ++
 .../xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb      |  2 ++
 .../xfce4-taskmanager/xfce4-taskmanager_git.bb            |  2 ++
 .../closebutton/xfce4-closebutton-plugin_git.bb           |  2 ++
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb    |  2 +-
 .../xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb             |  2 +-
 .../recipes-xfce/xfce4-settings/xfce4-settings_git.bb     |  2 ++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb                 |  2 ++
 144 files changed, 221 insertions(+), 81 deletions(-)
 create mode 100644 meta-oe/recipes-support/lcms/lcms_1.17.bb

diff --git a/meta-efl/recipes-efl/e17/cpu_svn.bb b/meta-efl/recipes-efl/e17/cpu_svn.bb
index c0ad6a4..2a0d35b 100644
--- a/meta-efl/recipes-efl/e17/cpu_svn.bb
+++ b/meta-efl/recipes-efl/e17/cpu_svn.bb
@@ -6,3 +6,5 @@ PV = "0.0.1+svnr${SRCREV}"
 PR = "${INC_PR}.0"
 
 require e-module.inc
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/diskio_svn.bb b/meta-efl/recipes-efl/e17/diskio_svn.bb
index 01a6576..9f98503 100644
--- a/meta-efl/recipes-efl/e17/diskio_svn.bb
+++ b/meta-efl/recipes-efl/e17/diskio_svn.bb
@@ -6,3 +6,5 @@ PV = "0.0.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 
 require e-module.inc
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.18.7.bb b/meta-efl/recipes-efl/e17/e-wm_0.18.7.bb
index 0e39727..33921ec 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.18.7.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.18.7.bb
@@ -18,3 +18,5 @@ do_configure_prepend() {
 }
 
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
index 2b927a0..f1cfe3b 100644
--- a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
+++ b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
@@ -14,3 +14,5 @@ SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 FILES_${PN} += "${datadir}"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/elfe_git.bb b/meta-efl/recipes-efl/e17/elfe_git.bb
index fcb97a9..4d1e6c3 100644
--- a/meta-efl/recipes-efl/e17/elfe_git.bb
+++ b/meta-efl/recipes-efl/e17/elfe_git.bb
@@ -13,3 +13,5 @@ S = "${WORKDIR}/git"
 SRCREV = "1ec0e7713c3ca901014811ff78277d9e2aaac981"
 
 DEPENDS += "elementary"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
index 94bcbac..07c9e8a 100644
--- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
+++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
@@ -21,3 +21,5 @@ RDEPENDS_${PN} = "${PN}-themes"
 do_configure_prepend() {
     autopoint --force
 }
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/enjoy_git.bb b/meta-efl/recipes-efl/e17/enjoy_git.bb
index bc3168e..ce7190b 100644
--- a/meta-efl/recipes-efl/e17/enjoy_git.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_git.bb
@@ -45,3 +45,5 @@ pkg_postinst_${PN} () {
     echo "enjoy:"
     echo "enjoy:    Use test-lms -P to see available formats that can be scanned"
 }
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/ephoto_svn.bb b/meta-efl/recipes-efl/e17/ephoto_svn.bb
index def68af..0604acd 100644
--- a/meta-efl/recipes-efl/e17/ephoto_svn.bb
+++ b/meta-efl/recipes-efl/e17/ephoto_svn.bb
@@ -12,3 +12,5 @@ inherit gettext
 DEPENDS += "elementary ethumb ecore eio"
 
 SRCNAME = "${PN}"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/eve_git.bb b/meta-efl/recipes-efl/e17/eve_git.bb
index 7879d6a..68897f0 100644
--- a/meta-efl/recipes-efl/e17/eve_git.bb
+++ b/meta-efl/recipes-efl/e17/eve_git.bb
@@ -32,3 +32,5 @@ EXTRA_OECONF = "\
 FILES_${PN} += "\
     ${datadir}/icons/eve.png \
 "
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/exalt-client_svn.bb b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
index b8c204d..09baa7b 100644
--- a/meta-efl/recipes-efl/e17/exalt-client_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
@@ -23,3 +23,5 @@ FILES_${PN}-dev += "${libdir}/enlightenment/modules/*/*/*.la"
 FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug"
  
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/exalt_svn.bb b/meta-efl/recipes-efl/e17/exalt_svn.bb
index 2993f5c..7b3ae98 100644
--- a/meta-efl/recipes-efl/e17/exalt_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt_svn.bb
@@ -32,3 +32,5 @@ do_install_append() {
 
 FILES_${PN} += "${datadir}/dbus-1"
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/exquisite_svn.bb b/meta-efl/recipes-efl/e17/exquisite_svn.bb
index dc46a94..e0bb0a1 100644
--- a/meta-efl/recipes-efl/e17/exquisite_svn.bb
+++ b/meta-efl/recipes-efl/e17/exquisite_svn.bb
@@ -39,3 +39,5 @@ INITSCRIPT_NAME = "exquisite"
 INITSCRIPT_PARAMS = "start 01 S . stop 20 0 1 6 ."
 
 FILES_${PN} += "/mnt/.splash/"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/flame_svn.bb b/meta-efl/recipes-efl/e17/flame_svn.bb
index 97683dd..e80e5f2 100644
--- a/meta-efl/recipes-efl/e17/flame_svn.bb
+++ b/meta-efl/recipes-efl/e17/flame_svn.bb
@@ -14,3 +14,5 @@ do_configure_prepend() {
 
 
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/forecasts_svn.bb b/meta-efl/recipes-efl/e17/forecasts_svn.bb
index a030952..3a51eec 100644
--- a/meta-efl/recipes-efl/e17/forecasts_svn.bb
+++ b/meta-efl/recipes-efl/e17/forecasts_svn.bb
@@ -10,3 +10,5 @@ require e-module.inc
 
 
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/places_svn.bb b/meta-efl/recipes-efl/e17/places_svn.bb
index 6a6184b..51f3164 100644
--- a/meta-efl/recipes-efl/e17/places_svn.bb
+++ b/meta-efl/recipes-efl/e17/places_svn.bb
@@ -12,3 +12,5 @@ do_configure_prepend() {
 
 # Calls /usr/bin/eject for media
 RRECOMMENDS_${PN} += "eject"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/rain_svn.bb b/meta-efl/recipes-efl/e17/rain_svn.bb
index d5e6803..32d93b1 100644
--- a/meta-efl/recipes-efl/e17/rain_svn.bb
+++ b/meta-efl/recipes-efl/e17/rain_svn.bb
@@ -15,3 +15,5 @@ do_configure_prepend() {
 
 
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.4.0.bb b/meta-efl/recipes-efl/e17/terminology_0.4.0.bb
index 83ceee8..be97d17 100644
--- a/meta-efl/recipes-efl/e17/terminology_0.4.0.bb
+++ b/meta-efl/recipes-efl/e17/terminology_0.4.0.bb
@@ -6,3 +6,5 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "5a2eee4849d4fa44db4caf743b3beb37"
 SRC_URI[sha256sum] = "63f2d1fa584ecda6c4ef61b05b8956415feb955c4bb13c0872c11d98024dcfc6"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/e17/uptime_svn.bb b/meta-efl/recipes-efl/e17/uptime_svn.bb
index a296a5e..f41a2e1 100644
--- a/meta-efl/recipes-efl/e17/uptime_svn.bb
+++ b/meta-efl/recipes-efl/e17/uptime_svn.bb
@@ -10,3 +10,5 @@ require e-module.inc
 
 
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
index 97c509b..ebf3893 100644
--- a/meta-efl/recipes-efl/efl/azy_svn.bb
+++ b/meta-efl/recipes-efl/efl/azy_svn.bb
@@ -30,3 +30,5 @@ inherit efl
 SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.9.3.bb b/meta-efl/recipes-efl/efl/elementary_1.9.3.bb
index 32ae663..00582d8 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.9.3.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.9.3.bb
@@ -10,3 +10,5 @@ SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defi
 
 SRC_URI[md5sum] = "cc75bb1c7c4c49de120ec33e413130ce"
 SRC_URI[sha256sum] = "49f896066b72ba51eefd8e92f0b7e7b8e190b0dd26323b12cbd4f26216f578fb"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/efl/entrance_svn.bb b/meta-efl/recipes-efl/efl/entrance_svn.bb
index 198fe03..bb42577 100644
--- a/meta-efl/recipes-efl/efl/entrance_svn.bb
+++ b/meta-efl/recipes-efl/efl/entrance_svn.bb
@@ -39,3 +39,5 @@ do_install_append() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/entrance.service ${D}${systemd_unitdir}/system
 }
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.9.bb b/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
index cee2d60..8df552b 100644
--- a/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
@@ -6,3 +6,5 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "954fe8e40fec6a561190ff0fb75b6bdd"
 SRC_URI[sha256sum] = "a05be096c911e0d66d4bdc497ebb935a04ad23696de9084aed9959b5172a593e"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index b27590f..4922b1b 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -10,7 +10,7 @@ PR = "r2"
 SRCREV = "${EFL_SRCREV}"
 SRCNAME = "vala"
 
-inherit e-base autotools pkgconfig vala
+inherit e-base autotools-brokensep pkgconfig vala
 
 SRC_URI = "${E_SVN}/trunk/BINDINGS;module=${SRCNAME};protocol=http \
     file://disable.eina.test.patch \
diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
index 2b12a87..639bc8f 100644
--- a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/release_${PV}"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[ogg] = "--enable-ogg,--disable-ogg,libvorbis"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 do_install_append() {
     install -d ${D}/${bindir}/
diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb
index b46940e..e8b34d3 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/owfs/owfs-${PV}.tar.gz \
 SRC_URI[md5sum] = "56ba145be208002e58775a7203369851"
 SRC_URI[sha256sum] = "9d22dbff72d235476688c02669f7171b23e21dffadf40bbdd3b8263908218424"
 
-inherit autotools update-rc.d
+inherit autotools-brokensep update-rc.d
 
 EXTRA_OECONF = " \
                  --with-fuseinclude=${STAGING_INCDIR} \
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
index 6c00283..9da8889 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
@@ -46,3 +46,5 @@ FILES_${PN}-dev += "${libdir}/gnome-bluetooth/plugins/libnma.la"
 FILES_${PN}-staticdev += "${libdir}/gnome-bluetooth/plugins/libnma.a"
 FILES_${PN}-dbg += "${libdir}/gnome-bluetooth/plugins/.debug/"
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
index 3d7fc18..03848bc 100644
--- a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
+++ b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
@@ -19,3 +19,5 @@ FILES_${PN} += "${datadir}/icons ${datadir}/dbus-1"
 RDEPENDS_${PN} = "iso-codes"
 RRECOMMENDS_${PN} = "ca-certificates"
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index 4957a99..5f0be7f 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -35,3 +35,5 @@ FILES_${PN} =+ "${datadir}/gnome* \
                 ${datadir}/PolicyKit \
                 ${libdir}/bonobo \
 "
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
index ddc436e..33dab40 100644
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
@@ -51,3 +51,5 @@ FILES_${PN}-doc += "${datadir}/omf \
     ${datadir}/gnome/help \
 "
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 34c9197..c76c85f 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -36,3 +36,5 @@ FILES_${PN}-dbg += "${libdir}/gnome-settings-daemon-2.0/.debug"
 FILES_${PN}-dev += "${libdir}/gnome-settings-daemon-2.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/gnome-settings-daemon-2.0/*.a"
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
index 3c7d92f..728e50c 100644
--- a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
@@ -44,3 +44,5 @@ python populate_packages_prepend () {
         recursive=True,
         prepend=True)
 }
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
index 48ec450..fde839a 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
@@ -20,3 +20,5 @@ do_configure_append() {
 
 
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
index 3eff298..d179892 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
@@ -24,3 +24,5 @@ do_compile_append() {
 }
 
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
index 0714815..3a50e4f 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
@@ -38,3 +38,5 @@ FILES_${PN} += "${datadir}/icons"
 # Don't make nautils3 drag us in
 PRIVATE_LIBS = "libnautilus-extension.so.1"
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
index fb15900..3d318bf 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
@@ -16,4 +16,5 @@ EXTRA_OECONF += "--disable-scrollkeeper"
 do_configure_prepend() {
     sed -i -e '/-I$(includedir)/d' src/Makefile.am
 }
-
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
index 4657505..d0176c5 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
@@ -42,7 +42,7 @@ SRC_URI = "https://github.com/kexecboot/kexecboot/archive/v${PV}.tar.gz"
 SRC_URI[md5sum] = "46b7c1a6f20531be56445ebb8669a2b8"
 SRC_URI[sha256sum] = "6b360b8aa59bc5d68a96705349a0dd416f8ed704e931fa0ac7849298258f0f15"
 
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_OECONF = "--enable-delay=2 --enable-evdev-rate=1000,250"
 
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 4b65152..723aeb6 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -97,3 +97,5 @@ RRECOMMENDS_${PN}_append = " libcec \
                              ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-demos', '', d)} \
 "
 RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 glibc-gconv-ibm850"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
index 3b8eb32..6eddea5 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://www.bunkus.org/videotools/mkvtoolnix/sources/mkvtoolnix-${PV}.
 SRC_URI[md5sum] = "033621461ef8eb922fc1366e0a9a6f16"
 SRC_URI[sha256sum] = "d913f531331c3332d2fb334c872ea19bfea7293dfedc4bf33ae7162e4efcbde1"
 
-inherit autotools gettext
+inherit autotools-brokensep gettext
 
 # make sure rb files are used from sysroot, not from host
 # ruby-1.9.3-always-use-i386.patch is doing target_cpu=`echo $target_cpu | sed s/i.86/i386/`
diff --git a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
index 478b1c7..6eeadb0 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/01org/${BPN}.git"
 SRCREV = "4a0b1d7cd8e22d3cb0e09c77c344ceccbcbbd34f"
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_install_append() {
     install -d ${D}${bindir}
diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
index c7dcdb9..ef28e92 100644
--- a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
+++ b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
 
-inherit autotools
+inherit autotools-brokensep
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BPN}-${PV}.tar.gz \
            file://build-fix.patch"
diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
index 5bc77f2..0ea5cb9 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -17,6 +17,6 @@ SRC_URI = "git://git.code.sf.net/p/libdc1394/code;branch=master;protocol=git \
 
 S = "${WORKDIR}/git/${PN}"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 EXTRA_OECONF += "--disable-doxygen-doc --disable-examples"
diff --git a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
index c338903..d38eb94 100644
--- a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
+++ b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger_1.0.11.bb
@@ -18,5 +18,5 @@ SRC_URI[sha256sum] = "1e572a0735b92aca5746c4528f9bebd35aa0ccf8619b22fa2756137a8c
 
 EXTRA_OECONF += "STAGING_DIR=${STAGING_DIR_NATIVE}"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
index 46a2712..6960e48 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
@@ -9,3 +9,5 @@ SRC_URI += "file://0001-enable-subdir-objects.patch \
 
 SRC_URI[md5sum] = "7ed67d22f7425011078772bfc62ac222"
 SRC_URI[sha256sum] = "3e566c7525478167e18cc53dc75d621e4af91eb40aabb6231e47db25d682d5d3"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb b/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
index 14acdac..4a9aa80 100644
--- a/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
+++ b/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "72fc6c490db6ea6a0f46c27d24998067"
 SRC_URI[sha256sum] = "1abfe6530d721debd98921421722b02c844c289564730b1e85729e4915b2bb7a"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 EXTRA_OECONF = "--enable-prelude --enable-gre --without-mysql"
 
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
index 501e40a..966dada 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -7,7 +7,7 @@ PR = "r6"
 
 DEPENDS += "libtirpc flex-native bison-native"
 
-inherit autotools systemd
+inherit autotools-brokensep systemd
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 \
            file://autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch \
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index e3ff56d..ea9cd1c 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -12,7 +12,7 @@ SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
 	   file://sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch \
 	   "
 
-inherit autotools pkgconfig useradd
+inherit autotools-brokensep pkgconfig useradd
 
 EXTRA_OECONF += "--with-dblib=berkeley \
                  --with-bdb-libdir=${STAGING_LIBDIR} \
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index cfbadfb..c154c6d 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -20,7 +20,7 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "0871e0b93c9c3c88ca950b6d9a04aed2"
 SRC_URI[sha256sum] = "9f659585cea90fc6af34a0ffae4a90e4ed37abe92dbd9b6c311f95a436c961cb"
 
-inherit autotools useradd update-rc.d
+inherit autotools-brokensep useradd update-rc.d
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses --enable-ncurses,--disable-curses --disable-ncurses,ncurses"
diff --git a/meta-networking/recipes-daemons/radvd/radvd_1.9.8.bb b/meta-networking/recipes-daemons/radvd/radvd_1.9.8.bb
index 407eb43..8c3e1b8 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_1.9.8.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_1.9.8.bb
@@ -4,3 +4,5 @@ require radvd.inc
 
 SRC_URI[md5sum] = "7a96a38252c3964ee18bbc1fdeae25fa"
 SRC_URI[sha256sum] = "645ccf1c9b16e769ff4179813712e580e2c8786d64a888d8afa1e296c057c1c1"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 6978e06..5baa61b 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.t
 SRC_URI[md5sum] = "46c9bd20bbffa62f79c958c7b99aac21"
 SRC_URI[sha256sum] = "0a9f88d4c1c02687b4853b02ab5dd8779d4de4ffdb9b2e5c9332841304d1a269"
 
-inherit autotools update-rc.d update-alternatives
+inherit autotools-brokensep update-rc.d update-alternatives
 
 EXTRA_OECONF += "--disable-option-checking"
 
diff --git a/meta-networking/recipes-daemons/vblade/vblade_20.bb b/meta-networking/recipes-daemons/vblade/vblade_20.bb
index 5b7c167..a2ebb5a 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_20.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_20.bb
@@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/aoetools/${BPN}-${PV}.tgz \
 SRC_URI[md5sum] = "3c80e4a6bc7d66ae0c235b88cb44bd59"
 SRC_URI[sha256sum] = "c8fe2fc4f2fba8e07e5cfdf17335982584eef2cd5c78bf8b1db93f2b56e7121d"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_install() {
     install -D -m 0755 ${S}/vblade ${D}/${sbindir}/vblade
diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
index 907a3be..dc404ac 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
 SRC_URI[tar.md5sum] = "ee737c774e01349f75e935228a2d851b"
 SRC_URI[tar.sha256sum] = "036b032a5c4d180aad686df21399d74506b9b3d3000794eb13ac313482e24896"
 
-inherit autotools update-rc.d
+inherit autotools-brokensep update-rc.d
 
 INITSCRIPT_NAME = "conntrackd"
 
diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
index b648cd2..33318e1 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/znc/znc.git"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools-brokensep
 
 # ZNC has a custom autogen.sh that states that this command is needed *and* expected to fail
 do_configure_prepend() {
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index 6403bfb..89a0ba7 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -2,3 +2,5 @@ include ${BPN}.inc
 
 SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
 PV = "1.0+git${SRCPV}"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
index 90a8f4d..b3e60fe 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
@@ -20,7 +20,7 @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \
 SRC_URI[md5sum] = "0e32760f498f9cde44081ee6aafc823b"
 SRC_URI[sha256sum] = "d916e9cfe1e62395f63a5361936fa855f6d0f0a37dc7227b394cdb725f553479"
 
-inherit autotools update-rc.d
+inherit autotools-brokensep update-rc.d
 
 do_install() {
     # Install init script and default settings
diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index c217343..9ff2093 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://curlpp.googlecode.com/files/curlpp-${PV}.tar.gz \
 SRC_URI[md5sum] = "ccc3d30d4b3b5d2cdbed635898c29485"
 SRC_URI[sha256sum] = "e3f9427b27c5bddf898d383d45c0d3d5397e2056ff935d9a5cdaef6a9a653bd5"
 
-inherit autotools pkgconfig binconfig
+inherit autotools-brokensep pkgconfig binconfig
 
 EXTRA_OECONF = "--prefix=${STAGING_DIR} \
 		--with-boost=${STAGING_DIR} \
diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb b/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
index 73f2d85..cc1f8b0 100644
--- a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
+++ b/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
@@ -10,5 +10,5 @@ SRC_URI = "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar.gz"
 SRC_URI[md5sum] = "fef521a49ec0122458d02c64212af3c5"
 SRC_URI[sha256sum] = "1b193037bb3019afae88cd94c87468aac4b045d81ab816ed8d2f489716b14027"
 
-inherit autotools
+inherit autotools-brokensep
 
diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index 6c36ce8..5a301e3 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -16,7 +16,7 @@ DEPENDS += "augeas libnl libxslt libxml2 gnulib"
 
 S = "${WORKDIR}/git"
 
-inherit gettext autotools
+inherit gettext autotools-brokensep
 
 EXTRA_OECONF_append_class-target = " --with-driver=redhat"
 do_configure_prepend() {
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
index d211888..4bce270 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
@@ -18,5 +18,5 @@ DEPENDS = "libpcap"
 
 EXTRA_OECONF += "--with-libpcap=${STAGING_DIR_HOST}/usr"
 
-inherit siteinfo autotools
+inherit siteinfo autotools-brokensep
 
diff --git a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
index 1915e4c..4a89ea3 100644
--- a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
+++ b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     file://destdir.patch \
     file://makefile.patch"
 
-inherit autotools
+inherit autotools-brokensep
 
 PACKAGES =+ "tbench tbench-dbg"
 
diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
index 508e304..3c0938ec 100644
--- a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
+++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
@@ -16,4 +16,4 @@ SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
 SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0"
 SRC_URI[sha256sum] = "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
 
-inherit autotools
+inherit autotools-brokensep
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
index 5d25527..7dbc301 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=1d9c8180d79838c02eb5eb1a3b184eb9"
 DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
 
-inherit autotools binconfig perlnative
+inherit autotools-brokensep binconfig perlnative
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${SHRT_VER}/${P}-signed.tar \
diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
index f4ea800..3825354 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
@@ -33,7 +33,7 @@ skip_udev_rules_generation () {
 	cp ${WORKDIR}/69-libmtp.rules ${S}/
 }
 
-inherit autotools pkgconfig lib_package
+inherit autotools-brokensep pkgconfig lib_package
 
 EXTRA_OECONF += "--disable-rpath"
 
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index 3c7944d..3b0df20 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
@@ -109,3 +109,5 @@ FILES_${PN}-tests = " \
 FILES_${PN}-bash-completion = "${datadir}/bash-completion"
 
 SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
index 206023e..5589963 100644
--- a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
+++ b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
@@ -8,6 +8,6 @@ S = "${WORKDIR}/git"
 SRCREV = "4acfa720fd37d178a048fc2be17180137d4a70ea"
 PV = "0.0.0+gitr${SRCPV}"
 
-inherit autotools
+inherit autotools-brokensep
 
 FILES_${PN} += "${base_libdir}/udev/rules.d/85-phonet-utils.rules"
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index 20b609d..4e861ba 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -67,3 +67,5 @@ do_install_append() {
     rmdir "${D}${localstatedir}/run"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 }
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 00df2b8..b028435 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://${PN}.googlecode.com/files/${PN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
 SRC_URI[sha256sum] = "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 PARALLEL_MAKE = ""
 
diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
index 65db1a8..7e497fb 100644
--- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
+++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "68766b1e70d05a25e2f502e997a3cb3937187a3296595cf6e0977d5cd6
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[r600] = "--enable-experimental-targets=R600,,,"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index b5dbaa8..fc830a8 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -115,3 +115,5 @@ RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "cloud9.service"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index fe57d9e..8dff1f1 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64).*-linux*"
 
-inherit autotools
+inherit autotools-brokensep
 
 PLAT_powerpc64 = "ppc64"
 PLAT ?= "${HOST_ARCH}"
diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
index 9e08a64..a5a827a 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
@@ -11,6 +11,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/log4cplus/log4cplus-stable/${PV}/log4cp
 SRC_URI[md5sum] = "104bd6dd07ee71bc52ee9adca4d4d5fc"
 SRC_URI[sha256sum] = "96905e763fc6f1e3a854c3d1964c21e877de909bdddd0aed99806c62a68be838"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 BBCLASSEXTEND += "native"
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 149af52..f5dbd06 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git \
           "
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_configure_prepend () {
 	./autogen.sh
diff --git a/meta-oe/recipes-devtools/php/php_5.4.14.bb b/meta-oe/recipes-devtools/php/php_5.4.14.bb
index 4e0efb1..8038da5 100644
--- a/meta-oe/recipes-devtools/php/php_5.4.14.bb
+++ b/meta-oe/recipes-devtools/php/php_5.4.14.bb
@@ -19,3 +19,5 @@ SRC_URI_append_pn-php += "file://iconv.patch \
 
 SRC_URI[md5sum] = "cfdc044be2c582991a1fe0967898fa38"
 SRC_URI[sha256sum] = "5450f3843bc651eb3fb00601f0cce1930aaaf65c7c966c02fe4a46f9c81be20a"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
index a7d6349..d114d1d 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "5c708b2b6f658916df59190b27750fa1ea2bc10992108e10f961c0700f
 PNBLACKLIST[tk] = "work/core2-64-oe-linux/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined reference to 'FcFontRenderPrepare'"
 S = "${WORKDIR}/tk${PV}/unix"
 LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/8.6.0/lib"
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_OECONF = "\
     --enable-threads \
diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
index 595f323..7536ad5 100644
--- a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
+++ b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
@@ -4,3 +4,5 @@ LDFLAGS += "-static"
 
 SRC_URI[md5sum] = "2e538305977178eb085a9859511c299d"
 SRC_URI[sha256sum] = "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44d079cb87cf0ce2f5"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb b/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
index c87fb61..081b471 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
@@ -2,3 +2,5 @@ require dialog.inc
 
 SRC_URI[md5sum] = "2e538305977178eb085a9859511c299d"
 SRC_URI[sha256sum] = "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44d079cb87cf0ce2f5"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
index d0658db..1c387cd 100644
--- a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
+++ b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
@@ -12,6 +12,6 @@ SRC_URI = "http://rigaux.org/${PN}-${PV}.src.tgz \
 SRC_URI[md5sum] = "a5af1378d028512a9cad27a5ba3e15f9"
 SRC_URI[sha256sum] = "6a126da30a77f5c0b08038aa7a881d910e3b65d13767fb54c58c983963b88dd7"
 
-inherit autotools
+inherit autotools-brokensep
 
 S = "${WORKDIR}/${PN}"
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
index 655f907..50a5d2d 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}-${PV}.tar.gz \
 
 DEPENDS += "cups python libusb"
 
-inherit autotools python-dir pythonnative
+inherit autotools-brokensep python-dir pythonnative
 
 export BUILD_SYS
 export HOST_SYS
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
index 39e6074..c050316 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
@@ -22,3 +22,5 @@ PACKAGES =+ "lcdvc"
 CONFFILES_lcdvc = "${sysconfdir}/lcdvc.conf"
 FILES_lcdvc = "${sysconfdir}/lcdvc.conf ${sbindir}/lcdvc"
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
index c7d3cf7..22eecf8 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
 SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 SRC_URI[md5sum] = "b6ee0ce2b3ef844bad7cac2803a90634"
 SRC_URI[sha256sum] = "09c8979252e60193e2969e9b0e1cd597f7820087867989b2f0939ad164473041"
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
index fa68fd0..0b9fdaf 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
@@ -13,7 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.09.orig.tar.gz \
 SRC_URI[md5sum] = "2aa269e4405ee8235ff17d1b357c6ae8"
 SRC_URI[sha256sum] = "16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a0695f1b7f"
 
-inherit autotools
+inherit autotools-brokensep
 
 # set default mailgroup to mail
 # --with-libnfslock specify where to install nfslock.so.NVER
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
index 2994df28..1eb3325 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://oss.oetiker.ch/rrdtool/pub/rrdtool-${PV}.tar.gz \
 SRC_URI[md5sum] = "ffe369d8921b4dfdeaaf43812100c38f"
 SRC_URI[sha256sum] = "956aaf431c955ba88dd7d98920ade3a8c4bad04adb1f9431377950a813a7af11"
 
-inherit autotools gettext pythonnative perlnative python-dir
+inherit autotools-brokensep gettext pythonnative perlnative python-dir
 
 EXTRA_AUTORECONF = "-I m4"
 
diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
index df3c163..7c9cbab 100644
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 do_configure_prepend() {
     sed -i -e s:tests/GNUmakefile::g -e s:trunk:0.0.9: configure.ac
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
index ee56952..17399e8 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
@@ -7,7 +7,7 @@ SRCREV = "292a03e17f889013fca2c7bd0aaeebd600c88f40"
 
 DEPENDS="virtual/kernel"
 
-inherit autotools
+inherit autotools-brokensep
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
index def5520..4564873 100644
--- a/meta-oe/recipes-extended/tmux/tmux_1.6.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tmux/${P}.tar.gz"
 SRC_URI[md5sum] = "3e37db24aa596bf108a0442a81c845b3"
 SRC_URI[sha256sum] = "faee08ba1bd8c22537cd5b7458881d1bdb4985df88ed6bc5967c56881a7efbd6"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_configure_prepend () {
     sed -i -e 's:-I/usr/local/include::' Makefile.am || bb_fatal "sed failed"
diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
index a7170dc..8676c94 100644
--- a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
+++ b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
@@ -3,3 +3,5 @@ DEPENDS += "libcap libpcre gdbm groff-native"
 
 SRC_URI[md5sum] = "6fb0e3e52a0f8de5ca63138391b81ce0"
 SRC_URI[sha256sum] = "b35cf19e4a6ba39fd03c6372b8a8760a491cc2e2e4aba3d15023ff291c2894b4"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
index 4bac59b..aadb5e7 100644
--- a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -12,3 +12,5 @@ S = "${WORKDIR}/git"
 
 DEPENDS += "clutter-1.0"
 PROVIDES = "clutter-box2d-1.6"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
index 48edc2c..97b62d2 100644
--- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 DEPENDS = "libpng zlib"
 SRC_URI = "http://fbgrab.monells.se/${P}.tar.gz"
 
-inherit autotools
+inherit autotools-brokensep
 
 S = "${WORKDIR}/${PN}"
 
diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
index 6e5000b..e895a65 100644
--- a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
+++ b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "3f6bf2de2952b9adcbeb3db12c2a979e999a81dd1e314a03bc58e24f1e
 
 PARALLEL_MAKE = ""
 
-inherit autotools
+inherit autotools-brokensep
 
 # Don't use provided regex.c
 EXTRA_OECONF = "fim_cv_regex=no fim_cv_regex_broken=no \
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index c602ad3..08a7a39 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -22,7 +22,7 @@ DEPENDS += "${@base_contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}
 # combine oe-core way with angstrom DISTRO_TYPE
 DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
-inherit autotools pkgconfig gettext systemd
+inherit autotools-brokensep pkgconfig gettext systemd
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb b/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
index 7006b41..f23621d 100644
--- a/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
+++ b/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
@@ -9,6 +9,6 @@ PV = "8.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 DEPENDS = "virtual/libx11 libxmu libxi virtual/libgl libglu"
diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
index 2b0775d..ba9c81e 100644
--- a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
@@ -11,3 +11,5 @@ SRC_URI[sha256sum] = "eaf59057ba3d7cffe29526562ce50868da7da823487a4cfb3e16946e5f
 require recipes-graphics/xorg-app/xorg-app-common.inc
 
 BBCLASSEXTEND = "native"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
index ac47cee..cd0fa2c 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
@@ -18,3 +18,5 @@ do_configure_prepend () {
     sed 's#gcc#${CC}#g' -i Makefile
     return
 }
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index ef78927..23f2a37 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a8
 
 S = "${WORKDIR}/SDL_image-${PV}"
 
-inherit autotools
+inherit autotools-brokensep
 
 export SDL_CONFIG = "${STAGING_BINDIR_CROSS}/sdl-config"
 
diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
index 19b9236..f1a01b9 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f
 
 S = "${WORKDIR}/SDL_mixer-${PV}"
 
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_AUTORECONF += "--include=acinclude"
 EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --enable-music-ogg-tremor LIBS=-L${STAGING_LIBDIR}"
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 65fab1f..6b3d120 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -36,7 +36,7 @@ CONFFILES_${PN} += "/usr/etc/mplayer/input.conf \
                     /usr/etc/mplayer/codecs.conf \
 "
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 EXTRA_OECONF = " \
     --prefix=/usr \
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
index 485a416..e1eb767 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
@@ -7,7 +7,7 @@ PR = "r2"
 
 DEPENDS = "jpeg virtual/libx11"
 
-inherit autotools gettext
+inherit autotools-brokensep gettext
 
 # libv4l was absorbed into this, let OE know that
 PROVIDES = "libv4l"
diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
index 7cb84ff..32287cc 100644
--- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
+++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/${PN}/${PN}_${PV
            file://auxdir.patch;striplevel=0"
 S = "${WORKDIR}/xpext-1.0"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 do_configure_prepend () {
     cd ${S}
diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
index 4fa6de1..c7cb928 100644
--- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "ftp://download.osgeo.org/gdal/${PV}/${P}.tar.xz"
 SRC_URI[md5sum] = "f354c614aea76e5630e4edbf06e5c292"
 SRC_URI[sha256sum] = "e6c9c6c4480228c943af29120d87435ddfe9ca460458bc60b91639fb8d443791"
 
-inherit autotools lib_package binconfig
+inherit autotools-brokensep lib_package binconfig
 
 EXTRA_OECONF = "--without-perl \
                 --without-php \
diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
index a56a51b..cf33cd2 100644
--- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
+++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
@@ -24,4 +24,4 @@ SRC_URI = "svn://omgps.googlecode.com/svn/trunk;module=omgps;protocol=http \
            file://0001-g_type_init-is-deprecated-for-glib-2.35.0.patch \
 "
 
-inherit autotools
+inherit autotools-brokensep
diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
index f5523e3..1507b4a 100644
--- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
+++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://orrery.c;endline=25;md5=d792bdf2b591972da175aecc38d88cfe"
 DEPENDS = "gtk+"
 
-inherit autotools
+inherit autotools-brokensep
 
 SRC_URI = "http://projects.openmoko.org/frs/download.php/923/orrery_2.7_clean.tar.gz \
            file://orrery.png \
diff --git a/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb b/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
index 1033bf2..9021103 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
+++ b/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
@@ -8,3 +8,5 @@ EXTRA_QMAKEVARS_PRE += "PREFIX=/usr"
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
 
 FILES_${PN} += "${datadir}/qconnman/"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-qt/qconnman/qconnman_git.bb b/meta-oe/recipes-qt/qconnman/qconnman_git.bb
index d298cb5..b448be1 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman_git.bb
+++ b/meta-oe/recipes-qt/qconnman/qconnman_git.bb
@@ -6,3 +6,5 @@ inherit qt4x11
 
 EXTRA_QMAKEVARS_PRE += "PREFIX=/usr"
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
index 831a140..502e3b2 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
@@ -57,3 +57,5 @@ do_install_append() {
 }
 
 RSUGGESTS_${PN} = "claws-plugin-gtkhtml2-viewer claws-plugin-mailmbox claws-plugin-rssyl"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
index a878220..ac0f875 100644
--- a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
+++ b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
@@ -27,7 +27,7 @@ do_configure_prepend() {
     done
 }
 
-inherit autotools
+inherit autotools-brokensep
 
 do_install_append() {
     install -d ${D}${datadir}/applications
diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
index 07b8ccb..667fa82 100644
--- a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
+++ b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://garr.dl.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/3
 SRC_URI[md5sum] = "5928822d855c5cf7ac29655e3e0b8c23"
 SRC_URI[sha256sum] = "0707b5ec9916fbde9e44eb8d18037c8d8f75dfd6aeef51aba5487e189eef2032"
 
-inherit autotools
+inherit autotools-brokensep
 
 LD = "${CXX}"
 
diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe/recipes-support/daemonize/daemonize_git.bb
index 57dc15b3..ebb2e69 100644
--- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
+++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=3cf9084faa88bc8554a9139d8d7dd35f"
 PV = "1.7.3+git${SRCPV}"
 
-inherit autotools
+inherit autotools-brokensep
 
 SRCREV = "93788682a4749d8b577ce6549d6d3dd6df166ba4"
 SRC_URI = "git://github.com/bmc/daemonize.git"
diff --git a/meta-oe/recipes-support/debianutils/debianutils_4.4.bb b/meta-oe/recipes-support/debianutils/debianutils_4.4.bb
index 30dd9a6..8320b0e 100644
--- a/meta-oe/recipes-support/debianutils/debianutils_4.4.bb
+++ b/meta-oe/recipes-support/debianutils/debianutils_4.4.bb
@@ -7,7 +7,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.gz"
 SRC_URI[md5sum] = "c0cb076754d7f4eb1e3397d00916647f"
 SRC_URI[sha256sum] = "190850cdd6b5302e0a1ba1aaed1bc7074d67d3bd8d04c613f242f7145afa53a6"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_configure_prepend() {
     sed -i -e 's:tempfile.1 which.1:which.1:g' ${S}/Makefile.am
diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index c47c653..544290a 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://eject.sourceforge.net/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-inherit autotools gettext update-alternatives
+inherit autotools-brokensep gettext update-alternatives
 
 SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz \
            file://eject-2.1.5-error-return.patch \
diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipes-support/emacs/emacs_23.4.bb
index 3db5da6..416ef66 100644
--- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
+++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
@@ -10,3 +10,5 @@ SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
 "
 SRC_URI[tarball.md5sum] = "34405165fcd978fbc8b304cbd99ccf4f"
 SRC_URI[tarball.sha256sum] = "b9a2b8434052771f797d2032772eba862ff9aa143029efc72295170607289c18"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.9.bb
index e65a143..452c01e 100644
--- a/meta-oe/recipes-support/enca/enca_1.9.bb
+++ b/meta-oe/recipes-support/enca/enca_1.9.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/enca-${PV}
 SRC_URI[md5sum] = "b3581e28d68d452286fb0bfe58bed3b3"
 SRC_URI[sha256sum] = "02acfef2b24a9c842612da49338138311f909f1cd33933520c07b8b26c410f4d"
 
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_OECONF = "--with-libiconv-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
 
diff --git a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
index 51012e6..c533b68 100644
--- a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
+++ b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
@@ -10,3 +10,5 @@ SRC_URI = "http://www.speech.cs.cmu.edu/flite/packed/flite-${PV}/flite-${PV}-rel
 
 SRC_URI[md5sum] = "ae0aca1cb7b4801f4372f3a75a9e52b5"
 SRC_URI[sha256sum] = "922225f7001e57a0fbace8833b0a48790a68f6c7b491f2d47c78ad537ab78a8b"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
index 4909460..fa01455 100644
--- a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
+++ b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
@@ -16,7 +16,7 @@ SRC_URI = "ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/fltk/${PV}/fl
 
 S = "${WORKDIR}/fltk-${PV}"
 
-inherit lib_package autotools binconfig
+inherit lib_package autotools-brokensep binconfig
 
 TARGET_CC_ARCH += "${LDFLAGS} -DXFT_MAJOR=2"
 
diff --git a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
index a30a891..7022057 100644
--- a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
+++ b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
@@ -15,7 +15,7 @@ SRC_URI = "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
            file://eglibc-2.17.patch \
            file://init"
 
-inherit autotools update-rc.d
+inherit autotools-brokensep update-rc.d
 
 INITSCRIPT_NAME = "gpm"
 INITSCRIPT_PARAMS = "defaults"
diff --git a/meta-oe/recipes-support/lcms/lcms_1.17.bb b/meta-oe/recipes-support/lcms/lcms_1.17.bb
new file mode 100644
index 0000000..e7176bd
--- /dev/null
+++ b/meta-oe/recipes-support/lcms/lcms_1.17.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Little cms is a small-footprint, speed optimized color management engine"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=156745cad721a8783cb847e82b79f586"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms-${PV}.tar.gz"
+DEPENDS = "tiff"
+
+PR = "r4"
+
+BBCLASSEXTEND = "native"
+
+inherit autotools-brokensep
+
+SRC_URI[md5sum] = "07bdbb4cfb05d21caa58fe3d1c84ddc1"
+SRC_URI[sha256sum] = "5ef3b4dab30956772009e29dba33fe1256cf9da161106a1e70b0966c96d14583"
diff --git a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
index 0dbd782..ebb329b 100644
--- a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
+++ b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
@@ -12,7 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libetpan/libetpan-${PV}.tar.gz \
            file://libetpan-autoreconf.patch \
            file://libetpan-ldflags.patch"
 
-inherit autotools pkgconfig gettext binconfig
+inherit autotools-brokensep pkgconfig gettext binconfig
 
 EXTRA_OECONF = "--without-openssl --without-sasl --with-gnutls --disable-db"
 
diff --git a/meta-oe/recipes-support/libol/libol_0.3.18.bb b/meta-oe/recipes-support/libol/libol_0.3.18.bb
index 429945f..0fbab18 100644
--- a/meta-oe/recipes-support/libol/libol_0.3.18.bb
+++ b/meta-oe/recipes-support/libol/libol_0.3.18.bb
@@ -7,4 +7,4 @@ SRC_URI = "http://www.balabit.com/downloads/files/libol/0.3/${P}.tar.gz"
 SRC_URI[md5sum] = "cbadf4b7ea276dfa85acc38a1cc5ff17"
 SRC_URI[sha256sum] = "9de3bf13297ff882e02a1e6e5f6bf760a544aff92a9d8a1cf4328a32005cefe7"
 
-inherit autotools binconfig
+inherit autotools-brokensep binconfig
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
index c6e5a15..b39a986 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-${PV}.tar.gz \
 S = "${WORKDIR}/SDL_ttf-${PV}"
 EXTRA_OECONF += "SDL_CONFIG=${STAGING_BINDIR_CROSS}/sdl-config "
 
-inherit autotools
+inherit autotools-brokensep
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
diff --git a/meta-oe/recipes-support/libusbg/libusbg_git.bb b/meta-oe/recipes-support/libusbg/libusbg_git.bb
index ed5ac65..e1f98e1 100644
--- a/meta-oe/recipes-support/libusbg/libusbg_git.bb
+++ b/meta-oe/recipes-support/libusbg/libusbg_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
-inherit autotools
+inherit autotools-brokensep
 
 PV = "0.1.0"
 SRCREV = "7e2b04363f319e8936a606bdb122dbde249a2f58"
diff --git a/meta-oe/recipes-support/lockdev/lockdev_git.bb b/meta-oe/recipes-support/lockdev/lockdev_git.bb
index 919487f..023b9a7 100644
--- a/meta-oe/recipes-support/lockdev/lockdev_git.bb
+++ b/meta-oe/recipes-support/lockdev/lockdev_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://anonscm.debian.org/lockdev/lockdev.git"
 
 S = "${WORKDIR}/git"
 
-inherit lib_package autotools
+inherit lib_package autotools-brokensep
 
 do_configure_prepend () {
     ./scripts/git-version > VERSION
diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index 76e6f49..6a4e155 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://wiki.maliit.org/Main_Page"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
 
-inherit autotools qt4x11 gtk-immodules-cache
+inherit autotools-brokensep qt4x11 gtk-immodules-cache
 
 
 SRC_URI = "git://github.com/maliit/framework.git;branch=master \
diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
index 903825a..7dac75c 100644
--- a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://wiki.maliit.org/Main_Page"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f29b21caa8e460097bfad9c026a33621"
 
-inherit autotools qt4x11
+inherit autotools-brokensep qt4x11
 
 DEPENDS = "maliit-framework"
 
diff --git a/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb b/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
index bd80c84..6e82716 100644
--- a/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
+++ b/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://www.maier-komor.de/software/mbuffer/mbuffer-20091227.tgz"
 SRC_URI[md5sum] = "191663396b4b1752d7104803631b9e54"
 SRC_URI[sha256sum] = "e708b66f6cec9ba090877e8eb38e5627ac69aea9ebd9bca1360a29c7398a88ce"
 
-inherit autotools
+inherit autotools-brokensep
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[md5] = "--enable-md5,--disable-md5,openssl"
diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
index 942afcc..8627d7b 100644
--- a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
+++ b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
@@ -18,3 +18,5 @@ do_install() {
     install -m 0755 sql/gen_lex_hash ${D}${bindir}/
 }
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb b/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
index 6ad1fe6..6b99e62 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
@@ -24,3 +24,5 @@ RPROVIDES_${PN}-server += "mysql5-server"
 RREPLACES_${PN}-server += "mysql5-server"
 RCONFLICTS_${PN}-server += "mysql5-server"
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
index 2e41524..49c9731 100644
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://motif.ics.com/sites/default/files/openmotif-2.3.3.tar.gz \
 SRC_URI[md5sum] = "fd27cd3369d6c7d5ef79eccba524f7be"
 SRC_URI[sha256sum] = "c85f5545e218fa0c59a3789192132d472fc5a33e914a221a568eee4fc10cd103"
 
-inherit autotools
+inherit autotools-brokensep
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
diff --git a/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb b/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
index 7396efd..9976772 100644
--- a/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
+++ b/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
@@ -11,4 +11,4 @@ SRC_URI = "http://www.cypherpunks.ca/otr/${P}.tar.gz \
 SRC_URI[md5sum] = "00979dca82d70383fcd1b01f3974363c"
 SRC_URI[sha256sum] = "3f911994409898e74527730745ef35ed75c352c695a1822a677a34b2cf0293b4"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb b/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
index 49ca53f..45c6897 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
@@ -11,3 +11,5 @@ SRC_URI += "\
 
 SRC_URI[md5sum] = "6ee5bb53b97da7c6ad9cb0825d3300dd"
 SRC_URI[sha256sum] = "d97dd918a88a4449225998f46aafa85216a3f89163a3411830d6890507ffae93"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-oe/recipes-support/pv/pv_1.4.6.bb b/meta-oe/recipes-support/pv/pv_1.4.6.bb
index 8aec14c..84752b7 100644
--- a/meta-oe/recipes-support/pv/pv_1.4.6.bb
+++ b/meta-oe/recipes-support/pv/pv_1.4.6.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.bz2"
 SRC_URI[md5sum] = "d55ff76f5caa83efc23aa527dbb0b191"
 SRC_URI[sha256sum] = "edfea0033ec6222eb60b4ec6d905dd2dccdb5900beef03f67f42ca9ed67e9fe2"
 
-inherit autotools
+inherit autotools-brokensep
 
 # broken autotools
 do_configure() {
diff --git a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
index 5148f35..ed1e8bd 100644
--- a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
+++ b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
@@ -17,7 +17,7 @@ SOURCES = "attach.o auth.o btree.o btree_rb.o build.o copy.o date.o delete.o \
            parse.o pragma.o printf.o random.o select.o table.o tokenize.o \
            trigger.o update.o util.o vacuum.o vdbe.o vdbeaux.o where.o"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 do_configure() {
     echo "main.mk is patched, no need to configure"
diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
index 6b7e4f1..be7f51f 100644
--- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
+++ b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://talloc.samba.org"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://NEWS;md5=5fe776b23a711c9153ee94bc87e47334"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 SRC_URI = "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz \
            file://install-swig-interface-in-SWINGLIBDIR.patch \
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
index 92d1ac4..a30a6fc 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "A mode switching tool for controlling 'flip flop' (multiple device) U
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit autotools
+inherit autotools-brokensep
 
 DEPENDS = "libusb1"
 
diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
index 447381a..69fc4a7 100644
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
@@ -8,7 +8,7 @@ PV = "1.3+gitr${SRCPV}"
 PE = "1"
 PR = "r1"
 
-inherit autotools perlnative vala
+inherit autotools-brokensep perlnative vala
 
 SRC_URI = "${FREESMARTPHONE_GIT}/vala-terminal.git;branch=master"
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
index 8f05062..6c91ce2 100644
--- a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
+++ b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://xchat.org/files/source/2.8/xchat-${PV}.tar.bz2 \
     file://glib-2.32.patch \
 "
 
-inherit autotools gettext
+inherit autotools-brokensep gettext
 
 PACKAGECONFIG ??= "dbus"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
diff --git a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
index 770ccab..5897c8d 100644
--- a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
+++ b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/xmlstar/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "0c6db295d0cf9ff0d439edb755b7e8f6"
 SRC_URI[sha256sum] = "47b4ed042ea2909257f2a386001af49fceb303f84da7214779ccf99fffc6bbba"
 
-inherit autotools
+inherit autotools-brokensep
 
 # doc build: requires (native) xstlproc, fop, pdf2ps
 EXTRA_OECONF="--disable-build-docs \
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.10.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.10.bb
index fcdb11e..7901cb2 100644
--- a/meta-webserver/recipes-php/modphp/modphp_5.5.10.bb
+++ b/meta-webserver/recipes-php/modphp/modphp_5.5.10.bb
@@ -5,3 +5,5 @@ EXTRA_OECONF += "--disable-opcache"
 SRC_URI[md5sum] = "d608230c7890b6a0cc5b92e66e866226"
 SRC_URI[sha256sum] = "bb34e61f8e6f56c612867bfe85d144d5045cd5e44497539bc126a4e8c6795419"
 
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index 9e4b696..6b30256 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -12,7 +12,7 @@ SRCREV = "e80e90528c9aab2fe36d9078b945b44c05cc20d3"
 PV = "0.5.3"
 S = "${WORKDIR}/git"
 
-inherit xfce-git gettext pkgconfig autotools gtk-icon-cache
+inherit xfce-git gettext pkgconfig autotools-brokensep gtk-icon-cache
 
 # install tap files for thunar-archive-plugin in ${libdir}/thunar-archive-plugin
 EXTRA_OECONF += "--libexecdir=${libdir}"
diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
index 08af66d..259f731 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
@@ -15,3 +15,5 @@ FILES_${PN} += " \
 
 SRC_URI[md5sum] = "8687fb7a0f270231ada265e363b6ffcc"
 SRC_URI[sha256sum] = "b66e68dfc2164bcf479acd3c7e8b6f83065d23aef988535e2db3506d06a39168"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
index 4cda352..bce73aa 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
@@ -13,3 +13,5 @@ SRC_URI[sha256sum] = "40419892bd28989315eed053c159bba0f4264ed8c6c6738806024e481e
 
 FILES_${PN} += "${datadir}/xfce4/panel/plugins \
         ${libdir}/xfce4/panel/plugins"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
index 289cf55..029e6e2 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
@@ -16,3 +16,5 @@ S = "${WORKDIR}/git"
 PV = "1.0.0+git${SRCPV}"
 
 EXTRA_OECONF += "--enable-maintainer-mode"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
index f96009e..8f10d1c 100644
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -16,3 +16,5 @@ S = "${WORKDIR}/git"
 EXTRA_OECONF += "--enable-maintainer-mode"
 
 FILES_${PN} += "${datadir}/xfce4/closebutton/themes"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
index 52792f5..cf1a26a 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
 
-inherit autotools gettext xfce xfce-git
+inherit autotools-brokensep gettext xfce xfce-git
 
 SRC_URI = " \
     git://git.xfce.org/xfce/libxfce4ui;protocol=git \
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
index 3312fbd..3e288a5 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "glib-2.0"
 
-inherit autotools
+inherit autotools-brokensep
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index b34bb7a..fba3fec 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -45,3 +45,5 @@ do_install_prepend() {
 RRECOMMENDS_${PN} += "gnome-icon-theme"
 RRECOMMENDS_${PN} += "${@base_contains('DISTRO_FEATURES','alsa','libcanberra-alsa','',d)}"
 RRECOMMENDS_${PN} += "${@base_contains('DISTRO_FEATURES','pulseaudio','libcanberra-pulse','',d)}"
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
index f8cd4b2..4d4c151 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
@@ -34,3 +34,5 @@ FILES_${PN} += "${libdir}/xfce4/xfwm4/helper-dialog \
 "
 FILES_${PN}-dbg += "${libexecdir}/xfce4/xfwm4/.debug/*"
 
+# autotools-brokensep
+B = "${S}"
-- 
1.9.1


