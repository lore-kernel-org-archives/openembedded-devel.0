Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 5280F6E7D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 14:52:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,505,1389740400"; d="scan'208";a="41430446"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 19 Feb 2014 15:52:47 +0100
Received: from COSNPREXC3.usr.ingenico.loc (10.1.1.182) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	id 14.2.318.1; Wed, 19 Feb 2014 15:52:47 +0100
Received: from u85.usr.ingenico.loc ([10.23.7.85]) by
	COSNPREXC3.usr.ingenico.loc with Microsoft SMTPSVC(6.0.3790.1830);
	Wed, 19 Feb 2014 15:52:46 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Feb 2014 15:47:36 +0100
Message-ID: <1392821256-7969-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
MIME-Version: 1.0
X-OriginalArrivalTime: 19 Feb 2014 14:52:46.0771 (UTC)
	FILETIME=[40791830:01CF2D82]
Subject: [meta-*][PATCH] recipes: convert remaining SUMMARY/DESCRIPTION cosmetic issues
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
X-List-Received-Date: Wed, 19 Feb 2014 14:52:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Changes:
- rename SUMMARY with length > 80 to DESCRIPTION
- rename DESCRIPTION with length < 80 to (non present tag) SUMMARY
- drop final point character at the end of SUMMARY string
- remove trailing whitespace of SUMMARY line

Note: don't bump PR

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-efl/recipes-efl/e17/e-tasks_git.bb                  |  2 +-
 meta-efl/recipes-efl/e17/edje-viewer_svn.bb              |  2 +-
 meta-efl/recipes-efl/e17/elmdentica_svn.bb               |  2 +-
 meta-efl/recipes-efl/e17/enjoy_svn.bb                    |  2 +-
 meta-efl/recipes-efl/e17/eve_svn.bb                      |  2 +-
 meta-efl/recipes-efl/e17/exalt_svn.bb                    |  2 +-
 meta-efl/recipes-efl/e17/exquisite_svn.bb                |  2 +-
 meta-efl/recipes-efl/e17/rage_svn.bb                     |  2 +-
 meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb      |  2 +-
 meta-efl/recipes-efl/efl/ecore_1.7.9.bb                  |  2 +-
 meta-efl/recipes-efl/efl/edb_svn.bb                      |  2 +-
 meta-efl/recipes-efl/efl/edje_1.7.9.bb                   |  2 +-
 meta-efl/recipes-efl/efl/eet_1.7.9.bb                    |  2 +-
 meta-efl/recipes-efl/efl/eeze_1.7.9.bb                   |  2 +-
 meta-efl/recipes-efl/efl/efreet_1.7.9.bb                 |  2 +-
 meta-efl/recipes-efl/efl/eina_1.7.9.bb                   |  2 +-
 meta-efl/recipes-efl/efl/eio_1.7.9.bb                    |  2 +-
 meta-efl/recipes-efl/efl/embryo_1.7.9.bb                 |  2 +-
 meta-efl/recipes-efl/efl/emotion_1.7.9.bb                |  2 +-
 meta-efl/recipes-efl/efl/engrave_svn.bb                  |  2 +-
 meta-efl/recipes-efl/efl/entrance_svn.bb                 |  2 +-
 meta-efl/recipes-efl/efl/epdf_svn.bb                     |  2 +-
 meta-efl/recipes-efl/efl/epeg_svn.bb                     |  2 +-
 meta-efl/recipes-efl/efl/ethumb_1.7.9.bb                 |  2 +-
 meta-efl/recipes-efl/efl/evas_1.7.9.bb                   |  2 +-
 meta-efl/recipes-efl/efl/imlib2_svn.bb                   |  2 +-
 meta-efl/recipes-efl/efl/libeflvala_svn.bb               |  2 +-
 meta-efl/recipes-efl/efl/libeweather_svn.bb              |  2 +-
 .../recipes-efl/packagegroups/packagegroup-efl-sdk.bb    |  2 +-
 .../packagegroup-efl-standalone-sdk-target.bb            |  2 +-
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb            |  2 +-
 .../lightmediascanner/lightmediascanner_0.4.4.bb         |  2 +-
 meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb       |  2 +-
 .../recipes-filesystems/ifuse/ifuse_1.1.2.bb             |  2 +-
 .../recipes-filesystems/smbnetfs/smbnetfs_git.bb         |  7 ++++++-
 .../recipes-filesystems/sshfs-fuse/sshfs-fuse_2.4.bb     |  2 +-
 meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb      | 10 +++++-----
 meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb  |  2 +-
 .../recipes-utils/f2fs-tools/f2fs-tools_1.1.0.bb         |  2 +-
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb          |  2 +-
 meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb      |  2 +-
 .../recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb    |  2 +-
 .../recipes-apps/nonworking/epdfview/epdfview_0.1.8.bb   |  2 +-
 .../network-manager-applet_0.9.8.0.bb                    |  2 +-
 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb       |  2 +-
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb        |  2 +-
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb           |  2 +-
 .../recipes-gnome/eds/evolution-data-server_git.bb       |  2 +-
 meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb     |  2 +-
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb         |  2 +-
 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb                |  2 +-
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb               |  2 +-
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb           |  2 +-
 .../gnome-backgrounds/gnome-backgrounds_2.32.0.bb        |  2 +-
 .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb            |  2 +-
 .../gnome-control-center/gnome-control-center_2.32.1.bb  |  2 +-
 .../recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb  |  2 +-
 .../recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb  |  2 +-
 .../gnome-disk-utility/gnome-disk-utility_2.32.0.bb      |  2 +-
 .../recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb  |  2 +-
 .../gnome-keyring/libgnome-keyring_2.32.0.bb             |  2 +-
 .../recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb      |  2 +-
 .../recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb      |  2 +-
 .../recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb      |  2 +-
 .../gnome-power-manager/gnome-power-manager_2.32.0.bb    |  2 +-
 .../recipes-gnome/gnome-session/gnome-session_2.32.1.bb  |  2 +-
 .../gnome-settings-daemon_2.32.1.bb                      |  2 +-
 .../gnome-system-monitor/gnome-system-monitor_2.28.2.bb  |  2 +-
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb   |  2 +-
 meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb  |  2 +-
 meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb     |  2 +-
 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb     |  2 +-
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb         |  2 +-
 .../recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb |  2 +-
 meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb      |  2 +-
 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb     |  2 +-
 .../recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb      |  2 +-
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb  |  2 +-
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb        |  2 +-
 .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb       |  2 +-
 meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb       |  2 +-
 meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb   |  2 +-
 meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb       |  2 +-
 meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb       |  2 +-
 meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb  |  2 +-
 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb    |  2 +-
 .../nonworking/gcalctool/gcalctool_5.32.0.bb             |  2 +-
 .../system-tools/system-tools-backends_2.10.2.bb         |  2 +-
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb        |  2 +-
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb   |  2 +-
 meta-gnome/recipes-gnome/wv/wv_1.2.0.bb                  |  2 +-
 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb         |  2 +-
 meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb       |  2 +-
 meta-gpe/recipes-graphics/minilite/minilite_0.50.bb      |  2 +-
 meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb    |  2 +-
 meta-gpe/recipes-support/fbreader/fbreader_git.bb        |  2 +-
 .../recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb      |  2 +-
 meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb   |  2 +-
 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb     |  2 +-
 meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb     |  2 +-
 .../recipes-multimedia/coriander/coriander_2.0.2.bb      |  2 +-
 .../recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb    |  2 +-
 .../recipes-multimedia/gstreamer/gst-rtsp_0.10.8.bb      |  2 +-
 meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb  |  4 +++-
 .../recipes-multimedia/libdc1394/libdc1394_git.bb        |  2 +-
 .../recipes-multimedia/musicpd/libmpd_11.8.17.bb         |  2 +-
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb |  2 +-
 .../recipes-multimedia/openal/openal-soft_1.15.1.bb      |  2 +-
 .../sample-content/bigbuckbunny-1080p.bb                 |  2 +-
 .../sample-content/bigbuckbunny-480p.bb                  |  2 +-
 .../sample-content/bigbuckbunny-720p.bb                  |  2 +-
 .../sample-content/tearsofsteel-1080p.bb                 |  2 +-
 meta-networking/recipes-connectivity/crda/crda_1.1.3.bb  |  2 +-
 .../recipes-connectivity/libdnet/libdnet_1.12.bb         |  2 +-
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb  |  2 +-
 meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb   |  2 +-
 .../recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb      |  2 +-
 .../recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb        |  3 ++-
 .../recipes-filter/ebtables/ebtables_2.0.10-4.bb         |  4 +++-
 meta-networking/recipes-irc/znc/znc_git.bb               |  2 +-
 .../recipes-protocols/accel-ppp/accel-ppp_git.bb         |  2 +-
 .../recipes-support/arptables/arptables_0.0.3-4.bb       |  2 +-
 meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb   |  2 +-
 meta-networking/recipes-support/iftop/iftop_1.0pre2.bb   |  2 +-
 .../recipes-support/netcat/netcat-openbsd_1.105.bb       |  2 +-
 meta-networking/recipes-support/netcat/netcat_0.7.1.bb   |  2 +-
 meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb |  2 +-
 meta-networking/recipes-support/stunnel/stunnel_4.56.bb  |  3 ++-
 meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb |  2 +-
 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb       |  2 +-
 .../recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb   |  2 +-
 meta-oe/recipes-benchmark/dbench/dbench_4.0.bb           |  6 +++---
 meta-oe/recipes-benchmark/iozone3/iozone3_263.bb         |  2 +-
 .../recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb   |  2 +-
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb      |  2 +-
 meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb   |  2 +-
 meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb     |  2 +-
 meta-oe/recipes-connectivity/daq/daq_2.0.1.bb            |  2 +-
 meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb       |  2 +-
 meta-oe/recipes-connectivity/gateone/gateone_git.bb      |  2 +-
 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb     |  2 +-
 .../recipes-connectivity/hostapd/hostap-daemon_1.0.bb    |  2 +-
 meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb         |  2 +-
 .../libimobiledevice/libimobiledevice_1.1.4.bb           |  2 +-
 meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb      |  2 +-
 .../networkmanager/networkmanager_0.9.8.0.bb             |  2 +-
 .../phonet-utils/phonet-utils_git.bb                     |  2 +-
 meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb        |  2 +-
 meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb  |  2 +-
 meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb    |  2 +-
 meta-oe/recipes-connectivity/soft66/soft66_git.bb        |  2 +-
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb   |  2 +-
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb       |  2 +-
 meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb         |  2 +-
 meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb           |  2 +-
 .../recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb   |  2 +-
 meta-oe/recipes-core/llvm/llvm-common.bb                 |  2 +-
 meta-oe/recipes-core/meta/distro-feed-configs.bb         |  2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb |  2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-boot.bb  |  2 +-
 .../recipes-core/packagegroups/packagegroup-cli-tools.bb |  4 ++--
 .../recipes-core/proxy-libintl/proxy-libintl_20100902.bb |  2 +-
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb            |  2 +-
 meta-oe/recipes-devtools/geany/geany_1.23.bb             |  2 +-
 meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb          |  2 +-
 meta-oe/recipes-devtools/glade/glade3_3.8.2.bb           |  2 +-
 .../recipes-devtools/libc-client/libc-client_2007e.bb    |  2 +-
 meta-oe/recipes-devtools/libedit/libedit_20121213.bb     |  2 +-
 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb    |  2 +-
 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb        |  2 +-
 meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb          |  2 +-
 .../recipes-devtools/mercurial/mercurial-native_1.9.bb   |  2 +-
 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb        |  2 +-
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb         |  2 +-
 .../packagegroups/packagegroup-sdk-target.bb             |  2 +-
 meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb  |  2 +-
 meta-oe/recipes-devtools/python/pyrtm_0.2.bb             |  2 +-
 meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb  |  2 +-
 meta-oe/recipes-devtools/python/python-dateutil_1.5.bb   |  2 +-
 meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb    |  2 +-
 .../recipes-devtools/python/python-m2crypto_0.21.1.bb    |  2 +-
 meta-oe/recipes-devtools/python/python-numeric_24.2.bb   |  2 +-
 meta-oe/recipes-devtools/python/python-pexpect_2.3.bb    |  2 +-
 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb      |  2 +-
 meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb   |  2 +-
 .../recipes-devtools/python/python-pyalsaaudio_0.4.bb    |  2 +-
 meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb     |  2 +-
 meta-oe/recipes-devtools/python/python-pyserial_2.4.bb   |  2 +-
 meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb  |  2 +-
 meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb  |  2 +-
 .../recipes-devtools/python/python-simplejson_2.2.1.bb   |  2 +-
 meta-oe/recipes-devtools/python/python-sip_4.14.2.bb     |  2 +-
 meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb    |  2 +-
 meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb |  2 +-
 .../python/python-zopeinterface_3.5.1.bb                 |  2 +-
 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb            |  2 +-
 meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb               |  2 +-
 meta-oe/recipes-extended/acpica/acpitests_20140114.bb    |  2 +-
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb           |  2 +-
 meta-oe/recipes-extended/jansson/jansson_2.4.bb          |  2 +-
 meta-oe/recipes-extended/libcec/libcec_git.bb            |  2 +-
 .../recipes-extended/libimobiledevice/libplist_1.8.bb    |  2 +-
 meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb |  2 +-
 meta-oe/recipes-extended/libuio/libuio_0.2.1.bb          |  2 +-
 meta-oe/recipes-extended/libungif/libungif_4.1.4.bb      |  2 +-
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb        |  2 +-
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb        |  2 +-
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb        |  2 +-
 meta-oe/recipes-extended/sip/sip-native_4.14.2.bb        |  2 +-
 .../recipes-extended/smartmontools/smartmontools_6.1.bb  |  2 +-
 meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb     |  2 +-
 meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb |  2 +-
 meta-oe/recipes-extended/subsurface/subsurface_git.bb    |  2 +-
 meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb            |  2 +-
 meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb    |  2 +-
 meta-oe/recipes-extended/tmux/tmux_1.6.bb                |  2 +-
 .../uml-utilities/uml-utilities_20040406.bb              |  2 +-
 meta-oe/recipes-extended/zram/zram_0.1.bb                |  2 +-
 meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb                |  2 +-
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb               |  2 +-
 meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb           |  2 +-
 meta-oe/recipes-graphics/babl/babl_0.1.10.bb             |  2 +-
 meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb         |  2 +-
 meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb    |  2 +-
 meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb            |  2 +-
 meta-oe/recipes-graphics/fbida/fbida_2.09.bb             |  2 +-
 meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb              |  2 +-
 meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb             |  2 +-
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb    |  2 +-
 meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb        |  2 +-
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb                |  2 +-
 meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb        |  2 +-
 meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb        |  2 +-
 .../packagegroups/packagegroup-fonts-truetype.bb         |  2 +-
 meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb         |  2 +-
 .../ttf-fonts/ttf-arphic-uming_20080216.bb               |  2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb    |  2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb      |  2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb   |  2 +-
 .../recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb   |  2 +-
 .../ttf-fonts/ttf-inconsolata_20100526.bb                |  2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb |  2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb      |  2 +-
 .../recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb  |  6 +++---
 .../ttf-fonts/ttf-ubuntu-font-family_0.80.bb             |  2 +-
 .../recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb  |  2 +-
 .../recipes-graphics/xdotool/xdotool_1.20100416.2809.bb  |  2 +-
 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb       |  2 +-
 meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb       |  2 +-
 meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb           |  2 +-
 meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb        |  2 +-
 meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb          |  2 +-
 meta-oe/recipes-graphics/xorg-app/xterm_293.bb           |  2 +-
 meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb     |  2 +-
 .../recipes-graphics/xorg-driver/xf86-input-mtev_git.bb  |  2 +-
 .../xorg-driver/xf86-input-tslib_0.0.6.bb                |  2 +-
 .../xorg-driver/xf86-input-void_1.4.0.bb                 |  2 +-
 .../xorg-driver/xf86-video-geode_2.11.14.bb              |  2 +-
 .../recipes-graphics/xorg-driver/xf86-video-glamo_git.bb |  2 +-
 meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb    |  2 +-
 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb       |  2 +-
 meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb      |  2 +-
 .../xserver-common/xserver-common_1.34.bb                |  2 +-
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb           |  2 +-
 meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb           |  2 +-
 meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb       |  2 +-
 meta-oe/recipes-multimedia/esound/esound_0.2.36.bb       |  2 +-
 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb            |  2 +-
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb        |  2 +-
 .../recipes-multimedia/libdvdread/libdvdread_4.2.0.bb    |  2 +-
 meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb        |  2 +-
 .../recipes-multimedia/libmodplug/libmodplug_0.8.7.bb    |  2 +-
 .../recipes-multimedia/libpostproc/libpostproc_git.bb    |  2 +-
 .../libsdl-image/libsdl-image_1.2.12.bb                  |  2 +-
 .../libsdl-mixer/libsdl-mixer_1.2.12.bb                  |  2 +-
 meta-oe/recipes-multimedia/mplayer/mplayer-common.bb     |  2 +-
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb       |  2 +-
 .../sound-themes/sound-theme-freedesktop_0.8.bb          |  2 +-
 meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb     |  2 +-
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb   |  2 +-
 meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb         |  2 +-
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb          |  2 +-
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb            |  2 +-
 .../recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb    |  2 +-
 meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb           |  2 +-
 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb |  2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb              | 16 ++++++++--------
 meta-oe/recipes-navigation/omgps/omgps_svn.bb            |  2 +-
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb          |  2 +-
 meta-oe/recipes-qt/libqofono/libqofono_0.4.bb            |  2 +-
 .../qcanobserver/qcanobserver-socketcan_svn.bb           |  2 +-
 .../nonworking/qcanobserver/qcanobserver_svn.bb          |  2 +-
 .../recipes-qt/qextserialport/qextserialport_1.2rc.bb    |  2 +-
 meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb        |  2 +-
 meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb      |  2 +-
 .../claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb      |  2 +-
 .../claws-mail/claws-plugin-mailmbox_1.15.bb             |  2 +-
 .../recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb   |  2 +-
 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb        |  2 +-
 .../bash-completion/bash-completion_2.0.bb               |  2 +-
 meta-oe/recipes-support/ccid/ccid_1.4.8.bb               |  2 +-
 meta-oe/recipes-support/daemonize/daemonize_git.bb       |  2 +-
 meta-oe/recipes-support/debianutils/debianutils_2.30.bb  |  2 +-
 meta-oe/recipes-support/devicekit/devicekit-power_014.bb |  2 +-
 meta-oe/recipes-support/devmem2/devmem2.bb               |  2 +-
 meta-oe/recipes-support/dfu-util/dfu-util_svn.bb         |  2 +-
 meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb       |  2 +-
 meta-oe/recipes-support/enca/enca_1.9.bb                 |  2 +-
 meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb      |  2 +-
 meta-oe/recipes-support/evtest/evtest_1.25.bb            |  2 +-
 meta-oe/recipes-support/fbset/fbset-modes.bb             |  2 +-
 meta-oe/recipes-support/fbset/fbset_2.1.bb               |  2 +-
 meta-oe/recipes-support/fbtest/fb-test_git.bb            |  2 +-
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb              |  2 +-
 meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb        |  2 +-
 meta-oe/recipes-support/gperftools/gperftools_2.1.bb     |  2 +-
 meta-oe/recipes-support/htop/htop_1.0.2.bb               |  2 +-
 meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb     |  2 +-
 meta-oe/recipes-support/iksemel/iksemel_1.4.bb           |  2 +-
 meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb |  2 +-
 meta-oe/recipes-support/inih/libinih_git.bb              |  2 +-
 meta-oe/recipes-support/joe/joe_3.1.bb                   |  2 +-
 meta-oe/recipes-support/lcms/lcms_1.17.bb                |  2 +-
 meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb  |  2 +-
 meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb     |  2 +-
 meta-oe/recipes-support/libol/libol_0.3.18.bb            |  2 +-
 meta-oe/recipes-support/libraw1394/libraw1394_2.1.0.bb   |  2 +-
 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb  |  2 +-
 meta-oe/recipes-support/libsoc/libsoc_0.6.bb             |  5 ++++-
 meta-oe/recipes-support/libssh/libssh_git.bb             |  2 +-
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb   |  2 +-
 meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb         |  2 +-
 meta-oe/recipes-support/lockdev/lockdev_git.bb           |  2 +-
 meta-oe/recipes-support/lzip/lzip_1.14.bb                |  2 +-
 meta-oe/recipes-support/maliit/maliit-framework_git.bb   |  2 +-
 meta-oe/recipes-support/maliit/maliit-plugins_git.bb     |  2 +-
 meta-oe/recipes-support/mg/mg_20110905.bb                |  2 +-
 .../recipes-support/mime-support/mime-support_3.48.bb    |  2 +-
 meta-oe/recipes-support/mini-iconv/mini-iconv.bb         |  2 +-
 .../multipath-tools/multipath-tools_git.bb               |  2 +-
 meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb      |  2 +-
 meta-oe/recipes-support/nmon/nmon_13g.bb                 |  2 +-
 meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb  |  2 +-
 meta-oe/recipes-support/ode/ode_0.9.bb                   |  2 +-
 meta-oe/recipes-support/opencv/opencv-samples_2.4.bb     |  2 +-
 meta-oe/recipes-support/opencv/opencv_2.4.bb             |  4 ++--
 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb     |  2 +-
 meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb      |  2 +-
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb        |  2 +-
 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb        |  2 +-
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb     |  2 +-
 meta-oe/recipes-support/picocom/picocom_1.6.bb           |  2 +-
 meta-oe/recipes-support/pidgin/libotr_4.0.0.bb           |  2 +-
 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb       |  2 +-
 meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb       |  2 +-
 meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb    |  2 +-
 meta-oe/recipes-support/poppler/poppler_0.22.4.bb        |  2 +-
 meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb   |  2 +-
 meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb          |  2 +-
 meta-oe/recipes-support/re2c/re2c_0.13.5.bb              |  2 +-
 meta-oe/recipes-support/rng-tools/rng-tools_2.bb         |  2 +-
 .../samsung-soc-utils/s3c24xx-gpio_svn.bb                |  2 +-
 .../samsung-soc-utils/s3c64xx-gpio_svn.bb                |  2 +-
 .../samsung-soc-utils/sjf2410-linux-native_svn.bb        |  2 +-
 .../recipes-support/serial-utils/pty-forward-native.bb   |  2 +-
 .../recipes-support/serial-utils/serial-forward_git.bb   |  2 +-
 meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb      |  2 +-
 meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb          |  2 +-
 .../start-stop-daemon/start-stop-daemon_1.16.0.2.bb      |  2 +-
 meta-oe/recipes-support/synergy/synergy_1.3.8.bb         |  2 +-
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb           |  2 +-
 meta-oe/recipes-support/toscoterm/toscoterm_git.bb       |  2 +-
 .../usb-modeswitch/usb-modeswitch-data_20130807.bb       |  2 +-
 .../usb-modeswitch/usb-modeswitch_2.0.1.bb               |  2 +-
 meta-oe/recipes-support/usbpath/usbpath_svn.bb           |  2 +-
 .../recipes-support/vala-terminal/vala-terminal_git.bb   |  2 +-
 meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb       |  2 +-
 meta-oe/recipes-support/xchat/xchat_2.8.8.bb             |  2 +-
 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb            |  2 +-
 .../recipes-core/systemd/systemd-machine-units_1.0.bb    |  2 +-
 meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb    |  2 +-
 meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb        |  2 +-
 meta-xfce/recipes-apps/orage/orage_4.8.4.bb              |  2 +-
 meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb      |  2 +-
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb        |  2 +-
 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb |  2 +-
 .../recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb    |  2 +-
 .../xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb     |  2 +-
 .../xfce4-taskmanager/xfce4-taskmanager_git.bb           |  2 +-
 .../recipes-apps/xfce4-terminal/xfce4-terminal_0.6.2.bb  |  2 +-
 meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb    |  2 +-
 .../xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb           |  2 +-
 .../recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb      |  2 +-
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb     |  2 +-
 .../packagegroups/packagegroup-xfce-multimedia.bb        |  2 +-
 .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb           |  2 +-
 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb        |  2 +-
 .../battery/xfce4-battery-plugin_1.0.5.bb                |  2 +-
 .../clipman/xfce4-clipman-plugin_1.2.3.bb                |  2 +-
 .../closebutton/xfce4-closebutton-plugin_git.bb          |  2 +-
 .../cpufreq/xfce4-cpufreq-plugin_1.1.0.bb                |  2 +-
 .../cpugraph/xfce4-cpugraph-plugin_1.0.5.bb              |  2 +-
 .../datetime/xfce4-datetime-plugin_0.6.2.bb              |  2 +-
 .../diskperf/xfce4-diskperf-plugin_2.5.4.bb              |  2 +-
 .../eyes/xfce4-eyes-plugin_4.4.2.bb                      |  2 +-
 .../mount/xfce4-mount-plugin_0.6.4.bb                    |  2 +-
 .../netload/xfce4-netload-plugin_1.2.0.bb                |  2 +-
 .../notes/xfce4-notes-plugin_1.7.7.bb                    |  2 +-
 .../time-out/xfce4-time-out-plugin_1.0.1.bb              |  2 +-
 .../wavelan/xfce4-wavelan-plugin_0.5.11.bb               |  2 +-
 .../weather/xfce4-weather-plugin_0.8.3.bb                |  2 +-
 .../recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb  |  2 +-
 .../media-tags/thunar-media-tags-plugin_0.2.1.bb         |  2 +-
 .../gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb             |  2 +-
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb   |  2 +-
 .../recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb     |  2 +-
 .../recipes-xfce/packagegroups/packagegroup-xfce-base.bb |  2 +-
 .../packagegroups/packagegroup-xfce-extended.bb          |  2 +-
 .../recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb    |  2 +-
 meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb            |  2 +-
 .../xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb            |  2 +-
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.1.bb |  2 +-
 .../xfce4-power-manager/xfce4-power-manager_1.2.0.bb     |  2 +-
 .../recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb   |  2 +-
 .../recipes-xfce/xfce4-settings/xfce4-settings_git.bb    |  2 +-
 meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb           |  2 +-
 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb     |  2 +-
 427 files changed, 458 insertions(+), 444 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-tasks_git.bb b/meta-efl/recipes-efl/e17/e-tasks_git.bb
index 6e08861..a445abc 100644
--- a/meta-efl/recipes-efl/e17/e-tasks_git.bb
+++ b/meta-efl/recipes-efl/e17/e-tasks_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "e-tasks is a todo program for Openmoko phones"
+SUMMARY = "e-tasks is a todo program for Openmoko phones"
 HOMEPAGE = "http://code.google.com/p/e-tasks/"
 AUTHOR = "cchandel"
 LICENSE = "GPLv3"
diff --git a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
index 0315f66..2b927a0 100644
--- a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
+++ b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Edje_Viewer is just that."
+SUMMARY = "Edje_Viewer is just that"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
                     file://COPYING-PLAIN;md5=e01359041001e8bf24c09acca556e792"
diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
index 543b9b7..94bcbac 100644
--- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
+++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A indenti.ca client for E"
+SUMMARY = "A indenti.ca client for E"
 DEPENDS = "glib-2.0 gconf curl elementary sqlite3-native azy"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index 2e1a8a2..d1c3855 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Enjoy music player"
+SUMMARY = "Enjoy music player"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary emotion lightmediascanner edbus2 gst-plugins-good"
diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index 128bd1a..f635edd 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = " Enlightenment Web Browser"
+SUMMARY = "Enlightenment Web Browser"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary webkit-efl edbus2"
diff --git a/meta-efl/recipes-efl/e17/exalt_svn.bb b/meta-efl/recipes-efl/e17/exalt_svn.bb
index 973bb67..2993f5c 100644
--- a/meta-efl/recipes-efl/e17/exalt_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Exalt is a network manager for the windows manager Enlightenment DR17."
+SUMMARY = "Exalt is a network manager for the windows manager Enlightenment DR17"
 HOMEPAGE = "http://watchwolf.fr/wiki/doku.php?id=exalt"
 
 LICENSE = "LGPLv2.1"
diff --git a/meta-efl/recipes-efl/e17/exquisite_svn.bb b/meta-efl/recipes-efl/e17/exquisite_svn.bb
index 7dfb8e4..dc46a94 100644
--- a/meta-efl/recipes-efl/e17/exquisite_svn.bb
+++ b/meta-efl/recipes-efl/e17/exquisite_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A psplash replacement for display"
+SUMMARY = "A psplash replacement for display"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14defa372a91118e755133bc8e6aff83"
 DEPENDS = "eet evas ecore embryo edje"
diff --git a/meta-efl/recipes-efl/e17/rage_svn.bb b/meta-efl/recipes-efl/e17/rage_svn.bb
index 5e3d5f7..3cf576f 100644
--- a/meta-efl/recipes-efl/e17/rage_svn.bb
+++ b/meta-efl/recipes-efl/e17/rage_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Rage is a media center application based on EFL"
+SUMMARY = "Rage is a media center application based on EFL"
 AUTHOR = "Carsten 'The Rasterman' Haitzler"
 HOMEPAGE = "http://www.rasterman.com"
 LICENSE = "MIT BSD"
diff --git a/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb b/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
index 6247523..17f668b 100644
--- a/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
+++ b/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Polish dictionary for Illume keyboard"
+SUMMARY = "Polish dictionary for Illume keyboard"
 SECTION = "x11/data"
 SRCREV = "38fdd9bb0d8296e984bb6443466801eea6f62f00"
 PV = "1.0+gitr${SRCPV}"
diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.9.bb b/meta-efl/recipes-efl/efl/ecore_1.7.9.bb
index c34eb27..ef05159 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Ecore is the Enlightenment application framework library"
+SUMMARY = "Ecore is the Enlightenment application framework library"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d6ff2c3c85de2faf5fd7dcd9ccfc8886"
 DEPENDS = "virtual/libiconv tslib curl eet evas glib-2.0 gnutls \
diff --git a/meta-efl/recipes-efl/efl/edb_svn.bb b/meta-efl/recipes-efl/efl/edb_svn.bb
index 9fe6760..a895cb3 100644
--- a/meta-efl/recipes-efl/efl/edb_svn.bb
+++ b/meta-efl/recipes-efl/efl/edb_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Edb is the Enlightenment database library"
+SUMMARY = "Edb is the Enlightenment database library"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8a7c08df3bc3280208b959be7215c25 \
                     file://COPYING-PLAIN;md5=f59cacc08235a546b0c34a5422133035"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.9.bb b/meta-efl/recipes-efl/efl/edje_1.7.9.bb
index 2e8c566..b2e369d 100644
--- a/meta-efl/recipes-efl/efl/edje_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/edje_1.7.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Edje is the Enlightenment graphical design & layout library"
+SUMMARY = "Edje is the Enlightenment graphical design & layout library"
 DEPENDS = "lua5.1 eet evas ecore embryo edje-native eina libsndfile1 eio"
 DEPENDS_virtclass-native = "lua5.1-native evas-native ecore-native eet-native embryo-native eina-native"
 DEPENDS_virtclass-nativesdk = "evas-native ecore-native eet-native embryo-native eina-native"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.9.bb b/meta-efl/recipes-efl/efl/eet_1.7.9.bb
index 9521e68..6437f5f 100644
--- a/meta-efl/recipes-efl/efl/eet_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/eet_1.7.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "EET is the Enlightenment data storage library"
+SUMMARY = "EET is the Enlightenment data storage library"
 DEPENDS = "pkgconfig zlib jpeg openssl eina gnutls"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=da947f414a2ca4323245f1abb1980953"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.9.bb b/meta-efl/recipes-efl/efl/eeze_1.7.9.bb
index 7ae7fbb..65f3751 100644
--- a/meta-efl/recipes-efl/efl/eeze_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/eeze_1.7.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Eeze is a library to simplify the use of devices"
+SUMMARY = "Eeze is a library to simplify the use of devices"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=315521fe061b6fd4290ef01db714a3c8"
 DEPENDS = "ecore eet udev"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.9.bb b/meta-efl/recipes-efl/efl/efreet_1.7.9.bb
index 0d87eb7..9688c68 100644
--- a/meta-efl/recipes-efl/efl/efreet_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/efreet_1.7.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The Enlightenment freedesktop.org library"
+SUMMARY = "The Enlightenment freedesktop.org library"
 DEPENDS = "ecore"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9594ec75c5a57e71fccedcbe10dd3ef4"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.9.bb b/meta-efl/recipes-efl/efl/eina_1.7.9.bb
index 3638123..aa6200d 100644
--- a/meta-efl/recipes-efl/efl/eina_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/eina_1.7.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Eina is the Enlightenment data library"
+SUMMARY = "Eina is the Enlightenment data library"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9cc092d35d7bbfcd986232cde130a551"
 
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.9.bb b/meta-efl/recipes-efl/efl/eio_1.7.9.bb
index 5bf34b2..186e9bf 100644
--- a/meta-efl/recipes-efl/efl/eio_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/eio_1.7.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Enlightenment Input Output Library"
+SUMMARY = "Enlightenment Input Output Library"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=180fca752525726bd6ba021689509a08"
 DEPENDS = "ecore eina"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.9.bb b/meta-efl/recipes-efl/efl/embryo_1.7.9.bb
index 08d7e49..332fa51 100644
--- a/meta-efl/recipes-efl/efl/embryo_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/embryo_1.7.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The Enlightenment C-like scripting language for Edje"
+SUMMARY = "The Enlightenment C-like scripting language for Edje"
 
 inherit efl
 
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.9.bb b/meta-efl/recipes-efl/efl/emotion_1.7.9.bb
index b7e1b16..ac9e363 100644
--- a/meta-efl/recipes-efl/efl/emotion_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/emotion_1.7.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The Enlightenment multimedia library"
+SUMMARY = "The Enlightenment multimedia library"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
 # we no longer build the libxine backend, since the gstreamer backend seems more promising
diff --git a/meta-efl/recipes-efl/efl/engrave_svn.bb b/meta-efl/recipes-efl/efl/engrave_svn.bb
index f0f5d4f..3e35c9c 100644
--- a/meta-efl/recipes-efl/efl/engrave_svn.bb
+++ b/meta-efl/recipes-efl/efl/engrave_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Engrave is an Edje Editing Library"
+SUMMARY = "Engrave is an Edje Editing Library"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=edf2d968b9eb026bfa82cccbd0e6f9f5"
 # also requires yacc and lex on host
diff --git a/meta-efl/recipes-efl/efl/entrance_svn.bb b/meta-efl/recipes-efl/efl/entrance_svn.bb
index 36f78e1..6e1f78c 100644
--- a/meta-efl/recipes-efl/efl/entrance_svn.bb
+++ b/meta-efl/recipes-efl/efl/entrance_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Login manager for Enlightenment"
+SUMMARY = "Login manager for Enlightenment"
 DEPENDS = "efreet eina eet ecore elementary"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index 9f414cd..63e8436 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Epdf is the glue between EFL and libpoppler"
+SUMMARY = "Epdf is the glue between EFL and libpoppler"
 
 DEPENDS = "poppler evas ecore"
 PV = "0.1.0+svnr${SRCPV}"
diff --git a/meta-efl/recipes-efl/efl/epeg_svn.bb b/meta-efl/recipes-efl/efl/epeg_svn.bb
index 41152ff..1b24d91 100644
--- a/meta-efl/recipes-efl/efl/epeg_svn.bb
+++ b/meta-efl/recipes-efl/efl/epeg_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Epeg is a small library for handling thumbnails."
+SUMMARY = "Epeg is a small library for handling thumbnails"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
                     file://COPYING-PLAIN;md5=f59cacc08235a546b0c34a5422133035"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.9.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.9.bb
index d0a5389..ad1fe7b 100644
--- a/meta-efl/recipes-efl/efl/ethumb_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_1.7.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "EFL based thumbnail generation library"
+SUMMARY = "EFL based thumbnail generation library"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
 DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.9.bb b/meta-efl/recipes-efl/efl/evas_1.7.9.bb
index 1b6c7b3..a947193 100644
--- a/meta-efl/recipes-efl/efl/evas_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/evas_1.7.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Evas is the Enlightenment canvas API"
+SUMMARY = "Evas is the Enlightenment canvas API"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b9b25b03d63aa496552658c7e78b11a1"
 # can also depend on valgrind, libsdl-x11, directfb
diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_svn.bb
index f263e2a..8bd8032 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A graphic library for file loading, saving, rendering, and manipulation."
+SUMMARY = "A graphic library for file loading, saving, rendering, and manipulation"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 # can also depend on tiff34, ungif or gif, z, bz2, id3tag
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index 1eb9c13..9f9ac44 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Vala meets the Enlightenment Foundation Libraries"
+SUMMARY = "Vala meets the Enlightenment Foundation Libraries"
 AUTHOR = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-efl/recipes-efl/efl/libeweather_svn.bb b/meta-efl/recipes-efl/efl/libeweather_svn.bb
index bc7bce6..eff8586 100644
--- a/meta-efl/recipes-efl/efl/libeweather_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeweather_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "EFL-based weather widget library"
+SUMMARY = "EFL-based weather widget library"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://COPYING-PLAIN;md5=c910b645eda0005ccec46f75203dc96e"
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
index fa261a5..4e5ce78 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Efl Software Development Kit"
+SUMMARY = "Efl Software Development Kit"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
index b761317..1bcac45 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Efl Software Development Kit"
+SUMMARY = "Efl Software Development Kit"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index a45717e..617c056 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Webkit browser engine, EFL edition"
+SUMMARY = "Webkit browser engine, EFL edition"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Source/WebKit/LICENSE;md5=4646f90082c40bcf298c285f8bab0b12 \
                     file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
index f17a443..2b12a87 100644
--- a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices"
+SUMMARY = "Lightweight media scanner meant to be used in not-so-powerful devices"
 AUTHOR = "ProFUSION"
 HOMEPAGE = "http://lms.garage.maemo.org/"
 SECTION = "libs/multimedia"
diff --git a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
index 1df3234..d07b143 100644
--- a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
+++ b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Free GPS navigation for car and outdoor with OpenStreetMap maps"
+SUMMARY = "Free GPS navigation for car and outdoor with OpenStreetMap maps"
 HOMEPAGE = "http://www.gps-routes.info/index.php?name=Content&pa=showpage&pid=1"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
diff --git a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
index 4d98bfc..f0b58b9 100644
--- a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
+++ b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A fuse filesystem to access the contents of an iPhone or iPod Touch"
+SUMMARY = "A fuse filesystem to access the contents of an iPhone or iPod Touch"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
 HOMEPAGE ="http://www.libimobiledevice.org/"
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index 32c2142..350dad5 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -1,4 +1,9 @@
-DESCRIPTION = "smbnetfs"
+SUMMARY = "FUSE module for mounting an entire SMB/NMB network in a single directory"
+DESCRIPTION = "SMBNetFS is a Linux/FreeBSD filesystem that allow you to use \
+               samba/microsoft network in the same manner as the network \
+               neighborhood in Microsoft Windows. Please donate me to help \
+               in SMBNetFS development."
+
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 HOMEPAGE ="http://sourceforge.net/projects/smbnetfs"
diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.4.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.4.bb
index f550f71..2a5546e 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.4.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "This is a filesystem client based on the SSH File Transfer Protocol using FUSE."
+SUMMARY = "This is a filesystem client based on the SSH File Transfer Protocol using FUSE"
 AUTHOR = "Miklos Szeredi <miklos@szeredi.hu>"
 HOMEPAGE = "http://fuse.sourceforge.net/sshfs.html"
 SECTION = "console/network"
diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
index 358b58e..a761932 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
@@ -1,9 +1,9 @@
-SUMMARY = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
+SUMMARY = "Implementation of a fully functional filesystem in a userspace program"
 DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspace \
-programs to export a virtual filesystem to the Linux kernel.  FUSE \
-also aims to provide a secure method for non privileged users to \
-create and mount their own filesystem implementations. \
-"
+               programs to export a virtual filesystem to the Linux kernel. FUSE \
+               also aims to provide a secure method for non privileged users to \
+               create and mount their own filesystem implementations. \
+              "
 HOMEPAGE = "http://fuse.sf.net"
 SECTION = "libs"
 LICENSE = "GPLv2 & LGPLv2"
diff --git a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb b/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
index 641d7ec..9ad7fab 100644
--- a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
+++ b/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "PhysicsFS is a library to provide abstract access to various archives"
+SUMMARY = "PhysicsFS is a library to provide abstract access to various archives"
 HOMEAPAGE = "http://icculus.org/physfs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5d94e3eaaa10b00ca803ba35a3e87cde"
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.1.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.1.0.bb
index dbb42a0..267aef0 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.1.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tools for Flash-Friendly File System (F2FS)"
+SUMMARY = "Tools for Flash-Friendly File System (F2FS)"
 HOMEPAGE = "http://sourceforge.net/projects/f2fs-tools/"
 
 LICENSE = "GPLv2"
diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
index 388d240..611e83e 100644
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Take photos and videos with your webcam, with fun graphical effects"
+SUMMARY = "Take photos and videos with your webcam, with fun graphical effects"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 
diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
index 0a4b484..6dc5159 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GTK+ widget and function libraries for gnome-mplayer"
+SUMMARY = "GTK+ widget and function libraries for gnome-mplayer"
 HOMEPAGE = "http://code.google.com/p/gmtk"
 SECTION = "libs"
 
diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
index d7d2314..53e65ba 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A GTK+ interface to MPlayer"
+SUMMARY = "A GTK+ interface to MPlayer"
 HOMEPAGE = "http://code.google.com/p/gnome-mplayer"
 SECTION = "multimedia"
 
diff --git a/meta-gnome/recipes-apps/nonworking/epdfview/epdfview_0.1.8.bb b/meta-gnome/recipes-apps/nonworking/epdfview/epdfview_0.1.8.bb
index 53951e1..9167cd3 100644
--- a/meta-gnome/recipes-apps/nonworking/epdfview/epdfview_0.1.8.bb
+++ b/meta-gnome/recipes-apps/nonworking/epdfview/epdfview_0.1.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A lightweight PDF viewer based on gtk and poppler"
+SUMMARY = "A lightweight PDF viewer based on gtk and poppler"
 HOMEPAGE = "http://www.emma-soft.com/projects/epdfview/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
index 7dca91c..6c00283 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GTK+ applet for NetworkManager" 
+SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
index dcd9d0c..0f04081 100644
--- a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
+++ b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "OBEX Server and Client"
+SUMMARY = "OBEX Server and Client"
 DEPENDS = "glib-2.0 dbus bluez4 libical"
 
 LICENSE = "GPLv2"
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 11565e3..de1b335 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "AbiWord is free word processing program similar to Microsoft(r) Word"
+SUMMARY = "AbiWord is free word processing program similar to Microsoft(r) Word"
 HOMEPAGE = "http://www.abiword.org"
 SECTION = "x11/office"
 LICENSE = "GPLv2"
diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index ae9c809..1fd53bf 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "configuation database system"
+SUMMARY = "configuation database system"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index c454e0c..162471b 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Evolution database backend server"
+SUMMARY = "Evolution database backend server"
 HOMEPAGE = "http://www.gnome.org/projects/evolution/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
index 00d51f9..df22e36 100644
--- a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
+++ b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME default webbrowser"
+SUMMARY = "GNOME default webbrowser"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
index 6197564..263765f 100644
--- a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Evince is a document viewer for document formats like pdf, ps, djvu."
+SUMMARY = "Evince is a document viewer for document formats like pdf, ps, djvu"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
diff --git a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
index d88a22a..71911af 100644
--- a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
+++ b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A library for bits of crypto UI and parsing etc"
+SUMMARY = "A library for bits of crypto UI and parsing etc"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index b341c8a..d8f0150 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Graphical login manager"
+SUMMARY = "Graphical login manager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 11f1a60..16b2a97 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME editor"
+SUMMARY = "GNOME editor"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2+"
 PR = "r2"
diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
index 28ca329..498c73c 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Gnome background images"
+SUMMARY = "Gnome background images"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index 00ac3f8..421de95 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME bluetooth manager"
+SUMMARY = "GNOME bluetooth manager"
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index e85314b..beecfa7 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME control center"
+SUMMARY = "GNOME control center"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
index 96f3d14..16f1c60 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME library for reading .desktop files"
+SUMMARY = "GNOME library for reading .desktop files"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index 4c01d46..f167516 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME library for reading .desktop files"
+SUMMARY = "GNOME library for reading .desktop files"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index f2f3790..6bfbfaf 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME disk utility"
+SUMMARY = "GNOME disk utility"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 0d0f171..91813d4 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Password and keyring managing daemon"
+SUMMARY = "Password and keyring managing daemon"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
index 8ed44f3..667bdf8 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Compatibility library for accessing secrets"
+SUMMARY = "Compatibility library for accessing secrets"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
index f8b2fac..5d223d7 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME menus"
+SUMMARY = "GNOME menus"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
index a82ceb9..8802dba 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME panel"
+SUMMARY = "GNOME panel"
 LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
 
 BPN = "gnome-panel"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index 6abf73e..91d814a 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME panel"
+SUMMARY = "GNOME panel"
 LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
index dabd5e7..ddc436e 100644
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Power management daemon"
+SUMMARY = "Power management daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
index 73f1ad5..cd8f43d 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Gnome session manager"
+SUMMARY = "Gnome session manager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 2a6cdeb..34c9197 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME settings daemon"
+SUMMARY = "GNOME settings daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
index 4e0d0da..1c14952 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Gnome system monitor"
+SUMMARY = "Gnome system monitor"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11/gnome"
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index d0b5e3d..7823cec 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "a userspace virtual filesystem"
+SUMMARY = "a userspace virtual filesystem"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
index 0f44900..ce4dd90 100644
--- a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
+++ b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME Terminal"
+SUMMARY = "GNOME Terminal"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b51eba4ba4cafe64073227530c061ed"
 DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte gnome-doc-utils"
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb b/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
index 640882a..5f72399 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME keyboard library"
+SUMMARY = "GNOME keyboard library"
 LICENSE = "LGPL"
 
 DEPENDS = "gconf-dbus dbus libxklavier gtk+"
diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
index 041ab3f..3c7d92f 100644
--- a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
@@ -3,7 +3,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=be0de417af78dd340558810d1ced52e6"
 SECTION = "x11/utils"
 S = "${WORKDIR}/gnumeric-${PV}"
 DEPENDS = "gdk-pixbuf libgsf gtk+3 libxml2 libglade libart-lgpl intltool-native libgnomecanvas libgnomeprint libbonoboui orbit2-native goffice"
-DESCRIPTION = "Gnumeric spreadsheet for GNOME"
+SUMMARY = "Gnumeric spreadsheet for GNOME"
 
 GNOME_COMPRESS_TYPE = "xz"
 
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 2cac8aa..70ef193 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "gThumb is an image viewer and browser for the GNOME Desktop"
+SUMMARY = "gThumb is an image viewer and browser for the GNOME Desktop"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
index 7b4253a..877b1c1 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Portable C library for multiline text editing"
+SUMMARY = "Portable C library for multiline text editing"
 HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
 
 LICENSE = "GPLv2"
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
index c3f4047..6cea7ae 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GLib-based library for accessing online service APIs using the GData protocol"
+SUMMARY = "GLib-based library for accessing online service APIs using the GData protocol"
 HOMEPAGE = "http://live.gnome.org/libgdata"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
index 2ccf6cb..0a2f41c 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Gnome application programming libraries"
+SUMMARY = "Gnome application programming libraries"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 SECTION = "x11/gnome/libs"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
index 0821abb..4a210a4 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A powerful object-oriented display"
+SUMMARY = "A powerful object-oriented display"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 SECTION = "x11/gnome/libs"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
index 4b773bd..48ec450 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME keyboard library"
+SUMMARY = "GNOME keyboard library"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
index b9a9877..d08552a 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME Structured File Library"
+SUMMARY = "GNOME Structured File Library"
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
                     file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"
diff --git a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
index 564a71c..46ab1a0 100644
--- a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
+++ b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GTK plugin for stylus based systems"
+SUMMARY = "GTK plugin for stylus based systems"
 SECTION = "libs"
 DEPENDS = "gtk+"
 LICENSE = "LGPL-2.0+"
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
index 8f0c89f..9edb247 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "LibGTop2"
+SUMMARY = "LibGTop2"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://copyright.txt;md5=dbc839bf158d19a20e661db14db7a58c"
 
diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb b/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
index fb9752f..b66fe97 100644
--- a/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
+++ b/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Send desktop notifications to a notification daemon"
+SUMMARY = "Send desktop notifications to a notification daemon"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
index 51a6ab7..1edd2ba 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Window navigation construction toolkit"
+SUMMARY = "Window navigation construction toolkit"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
index 6d23e27..6f4722d 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Window navigation construction toolkit"
+SUMMARY = "Window navigation construction toolkit"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb
index c81d21b..4c5be1d 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Helper lib for keyboard management"
+SUMMARY = "Helper lib for keyboard management"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
index dbd31b8..5f44e69 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -1,5 +1,5 @@
 SECTION = "x11/wm"
-DESCRIPTION = "Metacity is the boring window manager for the adult in you."
+SUMMARY = "Metacity is the boring window manager for the adult in you"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
diff --git a/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb b/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
index d5a1751..f16551f 100644
--- a/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
+++ b/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "gcalctool is a powerful calculator"
+SUMMARY = "gcalctool is a powerful calculator"
 SECTION = "x11"
 DEPENDS = "gtk+ gnome-doc-utils"
 
diff --git a/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb b/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb
index ed4a556..584d796 100644
--- a/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb
+++ b/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "gnome system tools backends"
+SUMMARY = "gnome system tools backends"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
index ba3982d..88f164f 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "CORBA ORB"
+SUMMARY = "CORBA ORB"
 SECTION = "x11/gnome/libs"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index 346b324..864c953 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME themes"
+SUMMARY = "GNOME themes"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b543dc97eb7594d026af39d9b54204b"
 
diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
index 3ac40aa..ff0ab54 100644
--- a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
+++ b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Programs for accessing Microsoft Word documents"
+SUMMARY = "Programs for accessing Microsoft Word documents"
 HOMEPAGE = "http://wvware.sourceforge.net/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6cbca01f1c9178aca280e8ff64d85b2f"
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
index 17fe0ee..8a8409d 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Display dialog boxes from the commandline and shell scripts"
+SUMMARY = "Display dialog boxes from the commandline and shell scripts"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
diff --git a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
index b003119..f51f616 100644
--- a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
+++ b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A GPE application that allows you to take screenshots."
+SUMMARY = "A GPE application that allows you to take screenshots"
 SECTION = "gpe"
 
 LICENSE = "GPLv2"
diff --git a/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb b/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
index ebb1b86..81095be 100644
--- a/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
+++ b/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GPE Screen light control dockapp"
+SUMMARY = "GPE Screen light control dockapp"
 SECTION = "gpe"
 
 LICENSE = "GPLv2"
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
index 662224c..98b9814 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "FBreader is an ebook reader"
+SUMMARY = "FBreader is an ebook reader"
 HOMEPAGE = "http://www.fbreader.org"
 SECTION = "x11/utils"
 LICENSE = "GPLv2+"
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_git.bb b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
index cb64e90..7bb826c 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_git.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "FBreader is an ebook reader"
+SUMMARY = "FBreader is an ebook reader"
 HOMEPAGE = "http://www.fbreader.org"
 SECTION = "x11/utils"
 LICENSE = "GPLv2+"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
index 7a26453..178cea3 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tools for GUPnP"
+SUMMARY = "Tools for GUPnP"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/network-light/main.c;beginline=1;endline=21;md5=033bf37c030780c5a72165846b3003f6"
diff --git a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
index e259db6..1c0d686 100644
--- a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
@@ -1,5 +1,5 @@
 HOMEPAGE = "http://www.linuxtv.org"
-SUMMARY = "Linux DVB API applications and utilities."
+SUMMARY = "Linux DVB API applications and utilities"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 2316fb7..67cbc5a 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "XBMC Media Center"
+SUMMARY = "XBMC Media Center"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff"
diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb
index b66160d..eafbdb3 100644
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb
@@ -1,4 +1,4 @@
-SUMMARY = "libebml is a C++ libary to parse EBML files."
+SUMMARY = "libebml is a C++ libary to parse EBML files"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=f14599a2f089f6ff8c97e2baa4e3d575"
 
diff --git a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
index 64ccc9b..4b1302b 100755
--- a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Control and capture GUI for IIDC compliant cameras"
+SUMMARY = "Control and capture GUI for IIDC compliant cameras"
 HOMEPAGE = "http://damien.douxchamps.net/ieee1394/coriander/"
 SECTION = "applications"
 LICENSE = "GPL-3.0"
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
index 9f6c351..c497d98 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Fluidsynth is a software synthesizer"
+SUMMARY = "Fluidsynth is a software synthesizer"
 HOMEPAGE = "http://www.fluidsynth.org/"
 SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.0+"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp_0.10.8.bb b/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp_0.10.8.bb
index 40872f5..9318656 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp_0.10.8.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp_0.10.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GStreamer RTSP server"
+SUMMARY = "GStreamer RTSP server"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
index efd5ec3..c855a54 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
@@ -1,5 +1,7 @@
+SUMMARY = "Cross-platform audio output library and plugins"
+DESCRIPTION = "Libao is a cross-platform audio library that allows programs to \
+               output audio using a simple API on a wide variety of platforms."
 SECTION = "multimedia"
-SUMMARY = "Libao is a cross-platform audio library that allows programs to output audio using a simple API on a wide variety of platforms"
 HOMEPAGE = "https://www.xiph.org/ao/"
 
 LICENSE = "GPLv2"
diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
index 2ce439d..330f78f 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Capture and control API for IIDC compliant cameras"
+SUMMARY = "Capture and control API for IIDC compliant cameras"
 HOMEPAGE = "http://sourceforge.net/projects/libdc1394/"
 SECTION = "libs"
 LICENSE = "LGPL-2.0"
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
index ec48b2c..b340c5a 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Music Player Daemon library"
+SUMMARY = "Music Player Daemon library"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE ="http://sourceforge.net/projects/musicpd"
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
index b89eb0e..77ccc1f 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Music Player Daemon"
+SUMMARY = "Music Player Daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE ="http://sourceforge.net/projects/musicpd"
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
index 086339d..b956b84 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "OpenAL is a cross-platform 3D audio API"
+SUMMARY = "OpenAL is a cross-platform 3D audio API"
 HOMEPAGE = "http://kcat.strangesoft.net/openal.html"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=facc3a8f452930083bbb95d82b989c35"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
index e49b472..e91ba45 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Big Buck Bunny movie - 1080P"
+SUMMARY = "Big Buck Bunny movie - 1080P"
 LICENSE = "CC-BY-3.0"
 # http://www.bigbuckbunny.org/index.php/about/
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
index 84f3259..e7029d9 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Big Buck Bunny movie - 480P"
+SUMMARY = "Big Buck Bunny movie - 480P"
 LICENSE = "CC-BY-3.0"
 # http://www.bigbuckbunny.org/index.php/about/
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
index 810e05f..55fceab 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Big Buck Bunny movie - 720P"
+SUMMARY = "Big Buck Bunny movie - 720P"
 LICENSE = "CC-BY-3.0"
 # http://www.bigbuckbunny.org/index.php/about/
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
index b403502..bb7ee7c 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tears of Steel movie - 1080P"
+SUMMARY = "Tears of Steel movie - 1080P"
 LICENSE = "CC-BY-3.0"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
 
diff --git a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
index 8339893..bee3e82 100644
--- a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Wireless Central Regulatory Domain Agent"
+SUMMARY = "Wireless Central Regulatory Domain Agent"
 HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
 
 LICENSE = "ISC"
diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
index b6462e6..4752506 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "dumb networking library"
+SUMMARY = "dumb networking library"
 HOMEPAGE = "http://code.google.com/p/libdnet/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index addd150..986416a 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A client for the Cisco3000 VPN Concentrator"
+SUMMARY = "A client for the Cisco3000 VPN Concentrator"
 HOMEPAGE = "http://www.unix-ag.uni-kl.de/~massar/vpnc/"
 AUTHOR = "Maurice Massar vpnc@unix-ag.uni-kl.de"
 SECTION = "console/network"
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
index 54e89f5..501e40a 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Kernel based automounter for linux."
+SUMMARY = "Kernel based automounter for linux"
 SECTION = "base"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 7338277..e3ff56d 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Generic client/server library for SASL authentication."
+SUMMARY = "Generic client/server library for SASL authentication"
 SECTION = "console/network"
 DEPENDS = "openssl virtual/db"
 LICENSE = "BSD"
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
index 1a3c745..974e6b7 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
@@ -1,4 +1,5 @@
-SUMMARY = "Pure-FTPd is a free (BSD), secure, production-quality and standard-conformant FTP server"
+SUMMARY = "FTP Server with a strong focus on software security"
+DESCRIPTION = "Pure-FTPd is a free (BSD license), secure, production-quality and standard-conformant FTP server."
 HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae9e161311a5a0768c333b537a40e332"
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index 6ac886e..9222b2d 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -1,4 +1,6 @@
-SUMMARY = "Utility for basic Ethernet frame filtering on a Linux bridge, MAC NAT and brouting."
+SUMMARY = "Filtering tool for a Linux-based bridging firewall"
+DESCRIPTION = "Utility for basic Ethernet frame filtering on a Linux bridge, \
+               advanced logging, MAC DNAT/SNAT and brouting."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
 SECTION = "console/network"
diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
index 817e2c4..b648cd2 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "ZNC, an advanced IRC bouncer"
+SUMMARY = "ZNC, an advanced IRC bouncer"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
index dde1f43..526818c 100644
--- a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
+++ b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
@@ -1,4 +1,4 @@
-SUMMARY = "ACCEL-PPP is a high performance VPN server application for linux."
+SUMMARY = "ACCEL-PPP is a high performance VPN server application for linux"
 HOMEPAGE = "http://sourceforge.net/apps/trac/accel-ppp/wiki"
 
 LICENSE = "GPLv2"
diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
index f3deaeb..74f81b5 100644
--- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
+++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Administration tool for arp packet filtering"
+SUMMARY = "Administration tool for arp packet filtering"
 PRIORITY = "optional"
 LICENSE = "GPL-2.0"
 SECTION = "console/network"
diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index 605cd5a..c217343 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -1,4 +1,4 @@
-SUMMARY = "C++ library for client-side URL transfers."
+SUMMARY = "C++ library for client-side URL transfers"
 HOMEPAGE = "http://code.google.com/p/curlpp/"
 SECTION = "console/network"
 LICENSE = "MIT"
diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb b/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
index f1ecf3d..73f2d85 100644
--- a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
+++ b/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
@@ -1,4 +1,4 @@
-SUMMARY = "iftop does for network usage what top(1) does for CPU usage."
+SUMMARY = "iftop does for network usage what top(1) does for CPU usage"
 HOMEPAGE = "http://www.ex-parrot.com/pdw/iftop/"
 
 DEPENDS = "libpcap ncurses"
diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
index 8f6cc54..4474e1d 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -1,5 +1,5 @@
 require netcat.inc
-DESCRIPTION = "OpenBSD Netcat"
+SUMMARY = "OpenBSD Netcat"
 HOMEPAGE = "http://ftp.debian.org"
 LICENSE = "BSD-3-Clause"
 
diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index 0bb5c87..8710c36 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -1,5 +1,5 @@
 require netcat.inc
-DESCRIPTION = "GNU Netcat"
+SUMMARY = "GNU Netcat"
 HOMEPAGE = "http://netcat.sourceforge.net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb b/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
index f58756e..9ef0fbf 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.1.3.bb
@@ -1,4 +1,4 @@
-SUMMARY = "A full-featured SSL VPN solution via tun device."
+SUMMARY = "A full-featured SSL VPN solution via tun device"
 HOMEPAGE = "http://openvpn.sourceforge.net"
 SECTION = "console/network"
 LICENSE = "GPLv2"
diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
index 0ee8cc8..7ac2e23 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
@@ -1,4 +1,5 @@
-SUMMARY = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
+SUMMARY = "Program for providing universal TLS/SSL tunneling service"
+DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
 SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
index 6c62cc0..fcb2964 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A sophisticated network protocol analyzer"
+SUMMARY = "A sophisticated network protocol analyzer"
 HOMEPAGE = "http://www.tcpdump.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
index 529be8e..bff0d72 100644
--- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tests large file IO and creation/deletion of small files."
+SUMMARY = "Tests large file IO and creation/deletion of small files"
 HOMEPAGE = "http://www.coker.com.au/bonnie++/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb
index 25b6388..8ec5e95 100644
--- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "CPU burn app that loads the NEON coprocessor fully"
+SUMMARY = "CPU burn app that loads the NEON coprocessor fully"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://burn.S;md5=823abc72c2cd448e87df9bc5355a4456"
 
diff --git a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
index 5afeda2..1915e4c 100644
--- a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
+++ b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
@@ -1,6 +1,6 @@
-DESCRIPTION = "The dbench (disk) and tbench (TCP) benchmarks"
-DESCRIPTION_dbench = "Filesystem load benchmark"
-DESCRIPTION_tbench = "TCP load benchmark"
+SUMMARY = "The dbench (disk) and tbench (TCP) benchmarks"
+SUMMARY_dbench = "Filesystem load benchmark"
+SUMMARY_tbench = "TCP load benchmark"
 HOMEPAGE = "http://samba.org/ftp/tridge/dbench/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
index b0e0dad..9de0ac7 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Filesystem and Disk Benchmarking Tool"
+SUMMARY = "Filesystem and Disk Benchmarking Tool"
 HOMEPAGE = "http://www.iozone.org/"
 AUTHOR = "Don Capps <don.capps2@verizon.net>, William D. Norcott <wnorcott@us.oracle.com>"
 SECTION = "console/tests"
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 5d0963c..5ee6e8e 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A library which provides easy access to huge pages of memory"
+SUMMARY = "A library which provides easy access to huge pages of memory"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index eb38f07..267f75e 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tools for performance analysis."
+SUMMARY = "Tools for performance analysis"
 HOMEPAGE = "http://lmbench.sourceforge.net/"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb b/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb
index 5273078..74e704b 100644
--- a/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb
+++ b/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Utility to test for faulty memory subsystem"
+SUMMARY = "Utility to test for faulty memory subsystem"
 HOMEPAGE = "http://pyropus.ca/software/memtester/"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
index fd04b06..af6c53c 100644
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Threaded I/O tester"
+SUMMARY = "Threaded I/O tester"
 HOMEPAGE = "http://sourceforge.net/projects/tiobench/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
index 4c1be44..c12ccde 100644
--- a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
+++ b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The dump DAQ test the various inline mode features "
+SUMMARY = "The dump DAQ test the various inline mode features "
 HOMEPAGE = "http://www.snort.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
index 095a77c..714aa50 100644
--- a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNU All Mobile Managment Utilities"
+SUMMARY = "GNU All Mobile Managment Utilities"
 SECTION = "console/network"
 DEPENDS = "cmake-native virtual/libiconv libdbi mysql5"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index ac5aa5b..0069c26 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
+SUMMARY = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 
diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
index 7845ae2..356d5bd 100644
--- a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
+++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Cellphone tools and driver software"
+SUMMARY = "Cellphone tools and driver software"
 SECTION = "console/network"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
index b993494..1699103 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
@@ -3,7 +3,7 @@ SECTION = "kernel/userland"
 LICENSE = "GPLv2 | BSD"
 LIC_FILES_CHKSUM = "file://README;md5=4d709ce0f9c84b87d148e16731f647e1"
 DEPENDS = "libnl openssl"
-DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
+SUMMARY = "User space daemon for extended IEEE 802.11 management"
 
 inherit update-rc.d
 INITSCRIPT_NAME = "hostapd"
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
index d0dfc46..5d25527 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A network authentication protocol"
+SUMMARY = "A network authentication protocol"
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
index 045b067..555cce1 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A protocol library to access an iPhone or iPod Touch in Linux"
+SUMMARY = "A protocol library to access an iPhone or iPod Touch in Linux"
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
index 7392b2a..76959fe 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A packet dissection and creation library"
+SUMMARY = "A packet dissection and creation library"
 # libnet at packetfactory.net is dead
 HOMEPAGE = "https://github.com/sam-github/libnet"
 SECTION = "libs"
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index fb58f68..46b3cc7 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "NetworkManager"
+SUMMARY = "NetworkManager"
 SECTION = "net/misc"
 
 LICENSE = "GPLv2+"
diff --git a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
index 874637f..206023e 100644
--- a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
+++ b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "This small package provides a few command line tools for Linux Phonet"
+SUMMARY = "This small package provides a few command line tools for Linux Phonet"
 HOMEPAGE = ""
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
index 1c2930a..62634c2 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "rfkill CLI utility"
+SUMMARY = "rfkill CLI utility"
 HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/rfkill"
 SECTION = "base"
 LICENSE = "BSD"
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
index e391e7c..adc112f 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Torrent client"
+SUMMARY = "Torrent client"
 HOMEPAGE = "http://libtorrent.rakshasa.no/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
index a973b9e..9877190 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A serial to network proxy"
+SUMMARY = "A serial to network proxy"
 SECTION = "console/network"
 HOMEPAGE = "http://sourceforge.net/projects/ser2net/"
 
diff --git a/meta-oe/recipes-connectivity/soft66/soft66_git.bb b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
index b88411f..3255152 100644
--- a/meta-oe/recipes-connectivity/soft66/soft66_git.bb
+++ b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library and tools for Soft66ADD and related SDR radio receivers"
+SUMMARY = "Library and tools for Soft66ADD and related SDR radio receivers"
 LICENSE = "GPLv3 LGPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 "
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index ce2b337..90d64a8 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -1,5 +1,5 @@
 HOMEPAGE = "http://alumnit.ca/wiki/index.php?page=WvStreams"
-DESCRIPTION = "WvStreams is a network programming library in C++"
+SUMMARY = "WvStreams is a network programming library in C++"
 
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=55ca817ccb7d5b5b66355690e9abc605"
diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
index 181e303..205e1d1 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "dbus forwarding daemon"
+SUMMARY = "dbus forwarding daemon"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://dbus-daemon-proxy.c;endline=19;md5=41df6d21fe1c97d6a1cc22a5bf374cba"
 DEPENDS = "dbus dbus-glib"
diff --git a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
index 78dfce6..156d513 100644
--- a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
+++ b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Gives a fake root environment"
+SUMMARY = "Gives a fake root environment"
 HOMEPAGE = "http://fakeroot.alioth.debian.org"
 SECTION = "base"
 LICENSE = "GPLv3"
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
index 9735d6a..e68eb50 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "C++ bindings for the glib library."
+SUMMARY = "C++ bindings for the glib library"
 HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"
 LICENSE = "LGPLv2.1 & GPLv2"
diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
index fe3c891..b6ce5fc 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A library for loose coupling of C++ method calls"
+SUMMARY = "A library for loose coupling of C++ method calls"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
diff --git a/meta-oe/recipes-core/llvm/llvm-common.bb b/meta-oe/recipes-core/llvm/llvm-common.bb
index cedfde7..618cc1e 100644
--- a/meta-oe/recipes-core/llvm/llvm-common.bb
+++ b/meta-oe/recipes-core/llvm/llvm-common.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Helper script for OE's llvm support"
+SUMMARY = "Helper script for OE's llvm support"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
diff --git a/meta-oe/recipes-core/meta/distro-feed-configs.bb b/meta-oe/recipes-core/meta/distro-feed-configs.bb
index 462af45..29739c2 100644
--- a/meta-oe/recipes-core/meta/distro-feed-configs.bb
+++ b/meta-oe/recipes-core/meta/distro-feed-configs.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Configuration files for online package repositories aka feeds"
+SUMMARY = "Configuration files for online package repositories aka feeds"
 PR = "r1"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 4f7e705..08db943 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -1,7 +1,7 @@
 # This recipe is intended as a 'simpler' replacement for packagegroup-base.
 # Please communicate your use cases and suggestions to the mailinglist(s)
 
-DESCRIPTION = "Basic task to get a device online"
+SUMMARY = "Basic task to get a device online"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
index c29d9ef..3b634f3 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Basic task to get a device booting"
+SUMMARY = "Basic task to get a device booting"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
index 8807fd1..fbba23c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
@@ -1,5 +1,5 @@
-DESCRIPTION = "A set of useful command line tools"
-DESCRIPTION_${PN}-debug = "A set of command line tools useful for debugging"
+SUMMARY = "A set of useful command line tools"
+SUMMARY_${PN}-debug = "A set of command line tools useful for debugging"
 SECTION = "console"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index df12299..a46a91c 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Proxy libintl"
+SUMMARY = "Proxy libintl"
 HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/"
 SECTION = "libs"
 LICENSE = "LGPLv2"
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index 44b2142..757c954 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Meet Cloud9, development-as-a-service for Javascripters and other developers"
+SUMMARY = "Meet Cloud9, development-as-a-service for Javascripters and other developers"
 HOMEPAGE = "http://c9.io"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
diff --git a/meta-oe/recipes-devtools/geany/geany_1.23.bb b/meta-oe/recipes-devtools/geany/geany_1.23.bb
index 604c7c2..4e0d4bf 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.23.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.23.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A fast and lightweight IDE"
+SUMMARY = "A fast and lightweight IDE"
 HOMEPAGE = "http://www.geany.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bd7b2c994af21d318bd2cd3b3f80c2d5"
diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb b/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
index e1a0777..1f85308 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "shared library for GIF images"
+SUMMARY = "shared library for GIF images"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
index 9a6a56f..eec40e4 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Glade - A User Interface Designer"
+SUMMARY = "Glade - A User Interface Designer"
 HOMEPAGE = "http://www.gnu.org/software/gnash"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
diff --git a/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb b/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
index b961e30..150ff90 100644
--- a/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
+++ b/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "UW c-client library for mail protocols"
+SUMMARY = "UW c-client library for mail protocols"
 SECTION = "devel"
 
 LICENSE = "Apache-2.0"
diff --git a/meta-oe/recipes-devtools/libedit/libedit_20121213.bb b/meta-oe/recipes-devtools/libedit/libedit_20121213.bb
index 08dba44..bd02d86 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20121213.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20121213.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "BSD replacement for libreadline"
+SUMMARY = "BSD replacement for libreadline"
 HOMEPAGE = "http://www.thrysoee.dk/editline/"
 SECTION = "libs"
 LICENSE = "BSD"
diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
index 71858e3..cb4bc24 100644
--- a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
+++ b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Fribidi library for bidirectional text"
+SUMMARY = "Fribidi library for bidirectional text"
 SECTION = "libs"
 PR = "r1"
 LICENSE = "LGPLv2.1"
diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
index c6ddf3d..d156d66 100644
--- a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Embedded Linux Device Driver Tests based on Linux Test Project"
+SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
 HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb
index 6ca5f34..36ec58f 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = " a Just-In-Time Compiler for Lua"
+SUMMARY = "Just-In-Time Compiler for Lua"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1793ef52a5d577794cd886a501a7f861"
 HOMEPAGE = "http://luajit.org"
diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
index 6a135f6..516a9ec 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The Mercurial distributed SCM"
+SUMMARY = "The Mercurial distributed SCM"
 HOMEPAGE = "http://mercurial.selenic.com/"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
index 89a3232..7e67bcb 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+SUMMARY = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & zlib"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6237f3a840aef5b7880fb4e49eecfe5"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
index ec9e4cf..996d68e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+SUMMARY = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95a589a3257ab7dfe37d8a8379e3c72d"
diff --git a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
index 346ccf1..9b8cc9a 100644
--- a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
+++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Packages required for a target (on-device) SDK"
+SUMMARY = "Packages required for a target (on-device) SDK"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
index 7d9c2bf..96cc468 100644
--- a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
+++ b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "PackageKit package management abstraction"
+SUMMARY = "PackageKit package management abstraction"
 SECTION = "libs"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-oe/recipes-devtools/python/pyrtm_0.2.bb b/meta-oe/recipes-devtools/python/pyrtm_0.2.bb
index 0cc5e8e..ee7b6d0 100644
--- a/meta-oe/recipes-devtools/python/pyrtm_0.2.bb
+++ b/meta-oe/recipes-devtools/python/pyrtm_0.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python interface for Remember The Milk API."
+SUMMARY = "Python interface for Remember The Milk API"
 AUTHOR = "Sridhar Ratnakumar / srid"
 HOMEPAGE = "http://pypi.python.org/pypi/pyrtm"
 LICENSE = "MIT"
diff --git a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
index 9dc4aaa..e015d0b 100644
--- a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python template engine and code generation tool"
+SUMMARY = "Python template engine and code generation tool"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aff1107514aa6aae948f9fe71fdc393b"
diff --git a/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb b/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
index 906fcd8..784f560 100644
--- a/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
+++ b/meta-oe/recipes-devtools/python/python-dateutil_1.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Extensions to the standard Python date/time support"
+SUMMARY = "Extensions to the standard Python date/time support"
 HOMEPAGE = "http://labix.org/python-dateutil"
 SECTION = "devel/python"
 LICENSE = "PSF"
diff --git a/meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb b/meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb
index 7351759..ea60277 100644
--- a/meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb
+++ b/meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Google Data APIs Python Client Library"
+SUMMARY = "Google Data APIs Python Client Library"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.txt;md5=473bd4dff0ddca1f958244b2dc7a162c"
diff --git a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
index 9babc04..5581d00 100644
--- a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
+++ b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A Python crypto and SSL toolkit"
+SUMMARY = "A Python crypto and SSL toolkit"
 HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
 
 DEPENDS = "openssl swig-native"
diff --git a/meta-oe/recipes-devtools/python/python-numeric_24.2.bb b/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
index 35ace89..c0b04e1 100644
--- a/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
+++ b/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A sophisticated Numeric Processing Package for Python"
+SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "PSF & LLNL"
 LIC_FILES_CHKSUM = "file://Legal.htm;md5=e3ce75dedd4043918d15979ae43e312e"
diff --git a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb b/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
index 1c64365..d4c2ba4 100644
--- a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
+++ b/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A Pure Python Expect like Module for Python"
+SUMMARY = "A Pure Python Expect like Module for Python"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04a2bf11b85ce49d4a8c0c413fd34404"
diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
index 435b29a..d1a7c8b 100644
--- a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
+++ b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
@@ -1,4 +1,4 @@
-SUMMARY = "PIP is a tool for installing and managing Python packages."
+SUMMARY = "PIP is a tool for installing and managing Python packages"
 LICENSE = "MIT & GPL"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd00425a3465a0e4c81929b94241d3de"
 
diff --git a/meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb b/meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb
index 6e462c0..ff113d0 100644
--- a/meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb
+++ b/meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A cross-platform process and system utilities module for Python"
+SUMMARY = "A cross-platform process and system utilities module for Python"
 SECTION = "devel/python"
 HOMEPAGE = "http://code.google.com/p/psutil"
 LICENSE = "BSD"
diff --git a/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb b/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
index 49fbc8f..0e660ad 100644
--- a/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
+++ b/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Support for the Linux 2.6.x ALSA Sound System"
+SUMMARY = "Support for the Linux 2.6.x ALSA Sound System"
 SECTION = "devel/python"
 DEPENDS = "alsa-lib"
 LICENSE = "PSF"
diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb b/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
index f21464a..2f0e189 100644
--- a/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
+++ b/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python Qt4 Bindings"
+SUMMARY = "Python Qt4 Bindings"
 HOMEPAGE = "http://riverbankcomputing.co.uk"
 AUTHOR = "Phil Thomson @ riverbank.co.uk"
 SECTION = "devel/python"
diff --git a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb b/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
index 0cce5cb..2263b2c 100644
--- a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
+++ b/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Serial Port Support for Python"
+SUMMARY = "Serial Port Support for Python"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7424386ffe323e815ee62ee9ad591dd8"
diff --git a/meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb b/meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb
index 741d037..964b5f9 100644
--- a/meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb
+++ b/meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A libudev binding"
+SUMMARY = "A libudev binding"
 HOMEPAGE = "http://pypi.python.org/pypi/pyudev"
 SECTION = "devel/python"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb b/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
index e5956db..360f213 100644
--- a/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
+++ b/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "PyUSB provides USB access on the Python language"
+SUMMARY = "PyUSB provides USB access on the Python language"
 HOMEPAGE = "http://pyusb.sourceforge.net/"
 SECTION = "devel/python"
 LICENSE = "BSD"
diff --git a/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb b/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb
index 85d69c1..7e42a7c 100644
--- a/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb
+++ b/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Simple, fast, extensible JSON encoder/decoder for Python"
+SUMMARY = "Simple, fast, extensible JSON encoder/decoder for Python"
 HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 SECTION = "devel/python"
 
diff --git a/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb b/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
index 747d896..acabc97 100644
--- a/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
+++ b/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Runtime helper for sip-generated python wrapper libraries"
+SUMMARY = "Runtime helper for sip-generated python wrapper libraries"
 SECTION = "devel/python"
 HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
 AUTHOR = "Phil Thompson"
diff --git a/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb b/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb
index 3085d2f..14548a9 100644
--- a/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb
+++ b/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Set of i2c tools for linux - Python module"
+SUMMARY = "Set of i2c tools for linux - Python module"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://smbusmodule.c;startline=1;endline=17;md5=fa24df321a520ff8e10f203425ab9fa8"
 
diff --git a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb b/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
index 5c6d82b..a28c02f 100644
--- a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
+++ b/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python package for parsing and generating vCard and vCalendar files" 
+SUMMARY = "Python package for parsing and generating vCard and vCalendar files"
 SECTION = "devel/python" 
 LICENSE = "Apache-2.0" 
 LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
diff --git a/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb b/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
index f2dbee2..d73a5be 100644
--- a/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
+++ b/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Interface definitions for Zope products"
+SUMMARY = "Interface definitions for Zope products"
 SECTION = "console/network"
 
 LICENSE = "ZPL-2.1"
diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
index 8cbe912..c6bedea 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Templatized C++ Command Line Parser" 
+SUMMARY = "Templatized C++ Command Line Parser"
 HOMEPAGE = "http://tclap.sourceforge.net/" 
 LICENSE = "MIT" 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c8ab0ff134bcc584d0e6b5b9f8732453"
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
index e999522..d12973c 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tool Command Language ToolKit Extension"
+SUMMARY = "Tool Command Language ToolKit Extension"
 HOMEPAGE = "http://tcl.sourceforge.net"
 SECTION = "devel/tcltk"
 LICENSE = "tcl"
diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140114.bb b/meta-oe/recipes-extended/acpica/acpitests_20140114.bb
index d84ac64..4afe3a9 100644
--- a/meta-oe/recipes-extended/acpica/acpitests_20140114.bb
+++ b/meta-oe/recipes-extended/acpica/acpitests_20140114.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Test suite used to validate ACPICA."
+SUMMARY = "Test suite used to validate ACPICA"
 HOMEPAGE = "http://www.acpica.org/"
 
 LICENSE = "Intel"
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
index 08735a0..655f907 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "HP Linux Imaging and Printing"
+SUMMARY = "HP Linux Imaging and Printing"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=442bb3cbbeeb60643a87325718b8a8ee"
 
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.4.bb b/meta-oe/recipes-extended/jansson/jansson_2.4.bb
index 811c830..c235729 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.4.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Jansson is a C library for encoding, decoding and manipulating JSON data."
+SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
 HOMEPAGE = "http://www.digip.org/jansson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6946b728e700de875e60ebb453cc3a20"
diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index 8b1f086..db032f9 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "USB CEC Adaptor communication Library"
+SUMMARY = "USB CEC Adaptor communication Library"
 HOMEPAGE = "http://libcec.pulse-eight.com/"
 
 LICENSE = "GPLv2+"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
index 2da8058..6e8d69f 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A library to handle Apple Property List format whereas it's binary or XML"
+SUMMARY = "A library to handle Apple Property List format whereas it's binary or XML"
 
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
index 72a8482..3ef52cf 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "File locking library."
+SUMMARY = "File locking library"
 SECTION = "libs"
 LICENSE = "LGPLv2+ & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ac284a60d48eaa4bc811cddc377fa341"
diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
index 48e2930..0142ce7 100644
--- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
+++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Libuio - helper library for UIO subsystem."
+SUMMARY = "Libuio - helper library for UIO subsystem"
 SECTION = "base"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
diff --git a/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb b/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb
index 9c9d2ed..aa05653 100644
--- a/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb
+++ b/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "shared library for GIF images"
+SUMMARY = "shared library for GIF images"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index 77cca2b..53ef81a 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library for converting WMF files"
+SUMMARY = "Library for converting WMF files"
 HOMEPAGE = "http://wvware.sourceforge.net/libwmf.html"
 SECTION = "libs"
 
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
index dc43163..533451f 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "High performance data logging and graphing system for time series data."
+SUMMARY = "High performance data logging and graphing system for time series data"
 HOMEPAGE = "http://oss.oetiker.ch/rrdtool/"
 
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index 916d33e..034592a 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
+SUMMARY = "Rsyslog is an enhanced multi-threaded syslogd"
 DEPENDS = "zlib libestr json-c"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 HOMEPAGE = "http://www.rsyslog.com/"
diff --git a/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb b/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
index 33caa1e..602dc25 100644
--- a/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
+++ b/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "SIP is a C++/Python Wrapper Generator"
+SUMMARY = "SIP is a C++/Python Wrapper Generator"
 AUTHOR = "Phil Thompson"
 HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
 SECTION = "devel"
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.1.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.1.bb
index 556c89f..d38ae8a 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.1.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.1.bb
@@ -1,5 +1,5 @@
 SECTION = "console/utils"
-DESCRIPTION = "Control and monitor storage systems using S.M.A.R.T."
+SUMMARY = "Control and monitor storage systems using S.M.A.R.T"
 HOMEPAGE = "http://smartmontools.sourceforge.net/"
 
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
index 504c510..8195ed9 100644
--- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
+++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "canutils (PTX flavour)"
+SUMMARY = "canutils (PTX flavour)"
 HOMEPAGE = "http://www.pengutronix.de"
 SECTION = "console/network"
 
diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
index 6b31a1e..df3c163 100644
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Control basic functions in socketcan from userspace"
+SUMMARY = "Control basic functions in socketcan from userspace"
 HOMEPAGE = "http://www.pengutronix.de"
 SECTION = "libs/network"
 
diff --git a/meta-oe/recipes-extended/subsurface/subsurface_git.bb b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
index 20cc5ac..eb4536a 100644
--- a/meta-oe/recipes-extended/subsurface/subsurface_git.bb
+++ b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Subsurface is an open source dive log program."
+SUMMARY = "Subsurface is an open source dive log program"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
index c367a4d..d687ddb 100644
--- a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
+++ b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A Type1 Font Rastering Library"
+SUMMARY = "A Type1 Font Rastering Library"
 SECTION = "libs"
 DEPENDS = "virtual/libx11 libxaw"
 
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
index f91ef0e..ee56952 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Transparent Inter-Process Communication protocol"
+SUMMARY = "Transparent Inter-Process Communication protocol"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://tipc-config/tipc-config.c;endline=32;md5=527a3d5745e1581b15a4fddfb5dfda68"
 
diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
index 470b25c..def5520 100644
--- a/meta-oe/recipes-extended/tmux/tmux_1.6.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Terminal multiplexer"
+SUMMARY = "Terminal multiplexer"
 HOMEPAGE = "http://tmux.sourceforge.net"
 SECTION = "console/utils"
 
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index 4d9d3c2..45cc2e7 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -1,5 +1,5 @@
 SECTION = "console/utils"
-DESCRIPTION = "Utilities for User-Mode-Linux"
+SUMMARY = "Utilities for User-Mode-Linux"
 LICENSE = "GPL-2.0"
 DEPENDS = "zlib ncurses readline"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
index 1a89e7e..3b1c845 100644
--- a/meta-oe/recipes-extended/zram/zram_0.1.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Linux zram compressed in-memory swap"
+SUMMARY = "Linux zram compressed in-memory swap"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb b/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
index 12522f2..6f51e34 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "C++ bindings for the atk"
+SUMMARY = "C++ bindings for the atk"
 SECTION = "libs"
 
 LICENSE = "LGPLv2.1 & GPLv2"
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb
index 2e09071..80595fe 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "C++ bindings for the GTK+ toolkit."
+SUMMARY = "C++ bindings for the GTK+ toolkit"
 HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"
 
diff --git a/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
index 58d41ee..cd22576 100644
--- a/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ b/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
@@ -1,6 +1,6 @@
 SECTION = "libs"
 DEPENDS = "gtk+ glib-2.0 libxml2"
-DESCRIPTION = "A GTK+ HTML rendering library."
+SUMMARY = "A GTK+ HTML rendering library"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 
diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.10.bb b/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
index 689c4fa..1ef4956 100644
--- a/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
+++ b/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Babl is a dynamic, any to any, pixel format conversion library."
+SUMMARY = "Babl is a dynamic, any to any, pixel format conversion library"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 
diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
index 8615d76..86ba552 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/cairo/cairo.inc
 
-DESCRIPTION = "C++ bindings for Cairo graphics library"
+SUMMARY = "C++ bindings for Cairo graphics library"
 
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"
diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
index 496c1dd..a88caf8 100644
--- a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Simple bootsplash for systemd systems"
+SUMMARY = "Simple bootsplash for systemd systems"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
index 5b55762..2b04c74 100644
--- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "FBGrab is a framebuffer screenshot program."
+SUMMARY = "FBGrab is a framebuffer screenshot program"
 HOMEPAGE = "http://fbgrab.monells.se/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
index 24100ee..32f376f 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
@@ -1,5 +1,5 @@
 HOMEPAGE = "http://linux.bytesex.org/fbida/"
-DESCRIPTION = "frame buffer image and doc viewer tools"
+SUMMARY = "frame buffer image and doc viewer tools"
 AUTHOR = "Gerd Hoffmann"
 SECTION = "utils"
 
diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
index e5fc066..9d8d190 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GEGL (Generic Graphics Library) is a graph based image processing framework."
+SUMMARY = "GEGL (Generic Graphics Library) is a graph based image processing framework"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jpeg virtual/libsdl"
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
index c747168..b70148e 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The GIMP is the GNU Image Manipulation Program."
+SUMMARY = "The GIMP is the GNU Image Manipulation Program"
 HOMEPAGE = "http://www.gimp.org"
 SECTION = "x11/graphics"
 LICENSE = "GPLv3"
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
index ccca0c9..ec96920 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "libgphoto2 allows you to access digital cameras"
+SUMMARY = "libgphoto2 allows you to access digital cameras"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
diff --git a/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb b/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
index a454501..2c51319 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Jpeg 2000 implementation"
+SUMMARY = "Jpeg 2000 implementation"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=baa697d7510288a9cdcce9bd7edaf9bc"
 
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index 5f9d2f4..c12eddf 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "LXDM is the lightweight display manager"
+SUMMARY = "LXDM is the lightweight display manager"
 HOMEPAGE = "http://blog.lxde.org/?p=531"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
index 22dfbe4..ec875f0 100644
--- a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
+++ b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Enable NumLock in X11 sessions"
+SUMMARY = "Enable NumLock in X11 sessions"
 HOMEPAGE = "http://home.kde.org/~seli/numlockx/"
 SECTION = "x11/apps"
 LICENSE = "MIT-X"
diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
index 9480388..54a14f9 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "openbox Window Manager"
+SUMMARY = "openbox Window Manager"
 SECTION = "x11/wm"
 DEPENDS = "glib-2.0 pango libxml2 virtual/libx11"
 LICENSE = "GPLv2+"
diff --git a/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
index d6e0681..931564f 100644
--- a/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
+++ b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Install one of these tasks to get support for truetype fonts."
+SUMMARY = "Install one of these tasks to get support for truetype fonts"
 SECTION = "fonts"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb b/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
index d00b063..36afb9f 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "C++ bindings for the pango library."
+SUMMARY = "C++ bindings for the pango library"
 SECTION = "libs"
 LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index 44550f7..522f0fb 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Unicode Mingti (printed) TrueType Font"
+SUMMARY = "Unicode Mingti (printed) TrueType Font"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/CJKUnifonts"
 LICENSE = "Arphic-Public-License"
 LIC_FILES_CHKSUM = "file://README;md5=62be011094b7865ddc4d1a648444d31a"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
index 72bc2d2..e4363e2 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
@@ -1,6 +1,6 @@
 require ttf.inc
 
-DESCRIPTION = "DejaVu font - TTF Edition"
+SUMMARY = "DejaVu font - TTF Edition"
 HOMEPAGE = "http://dejavu.sourceforge.net/wiki/"
 LICENSE = "Bitstream Vera"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/dejavu-fonts-ttf-${PV}/LICENSE;md5=9f867da7a73fad2715291348e80d0763"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
index 35bd89d..e62badf 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
@@ -1,6 +1,6 @@
 require ttf.inc
 
-DESCRIPTION = "Droid fonts - TTF Edition"
+SUMMARY = "Droid fonts - TTF Edition"
 HOMEPAGE = "http://www.droidfonts.com/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.txt;md5=83544262a86f1f1ec761e75897df92bc"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
index d289e80..6a6258a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
@@ -1,6 +1,6 @@
 require ttf.inc
 
-DESCRIPTION = "Gentium fonts - TTF Version"
+SUMMARY = "Gentium fonts - TTF Version"
 HOMEPAGE = "http://scripts.sil.org/gentium"
 LICENSE = "OFL"
 LICENSE_URL = "http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&item_id=OFL"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
index 97a82ef..5cd9935 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
@@ -1,6 +1,6 @@
 require ttf.inc
 
-DESCRIPTION = "Hunky fonts - TTF Version"
+SUMMARY = "Hunky fonts - TTF Version"
 HOMEPAGE = "http://sourceforge.net/projects/hunkyfonts"
 LICENSE = "LGPL"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=7fbc338309ac38fefcd64b04bb903e34"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
index 4c11700..20041bb 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
@@ -1,6 +1,6 @@
 require ttf.inc
 
-DESCRIPTION = "Inconsolata font - TTF Version"
+SUMMARY = "Inconsolata font - TTF Version"
 HOMEPAGE = "http://www.levien.com/type/myfonts/inconsolata.html"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://../OFL.txt;md5=969851e3a70122069a4d9ee61dd5a2ed"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
index 7ed4a64..7204c92 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
@@ -1,6 +1,6 @@
 require ttf.inc
 
-DESCRIPTION = "Liberation fonts - TTF Version"
+SUMMARY = "Liberation fonts - TTF Version"
 HOMEPAGE = "https://www.redhat.com/promo/fonts/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index d2e84c2..11c1ac1 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -1,6 +1,6 @@
 require ttf.inc
 
-DESCRIPTION = "MPlus font - TTF Edition"
+SUMMARY = "MPlus font - TTF Edition"
 HOMEPAGE = "http://dejavu.sourceforge.net/wiki/"
 LICENSE = "${PN}"
 LIC_FILES_CHKSUM = "file://LICENSE_E;md5=ac161e96eda00db9a3aec7870b5d9658 \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index 0390740..2d413ba 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -1,8 +1,8 @@
 require ttf.inc
 
-DESCRIPTION = "Sazanami Gothic/Mincho Japanese TrueType fonts"
-DESCRIPTION_ttf-sazanami-gothic = "Sazanami Gothic Japanese TrueType font"
-DESCRIPTION_ttf-sazanami-mincho = "Sazanami Mincho Japanese TrueType font"
+SUMMARY = "Sazanami Gothic/Mincho Japanese TrueType fonts"
+SUMMARY_ttf-sazanami-gothic = "Sazanami Gothic Japanese TrueType font"
+SUMMARY_ttf-sazanami-mincho = "Sazanami Mincho Japanese TrueType font"
 AUTHOR = "Electronic Font Open Laboratory (/efont/)"
 HOMEPAGE = "http://sourceforge.jp/projects/efont/"
 LICENSE = "Public domain"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
index bd83980..d5d1b9a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
@@ -1,6 +1,6 @@
 require ttf.inc
 
-DESCRIPTION = "Ubuntu Font Family - TTF Version"
+SUMMARY = "Ubuntu Font Family - TTF Version"
 HOMEPAGE = "http://font.ubuntu.com"
 LICENSE = "UFL"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=325a1a9029112a2405e743c7f816427b"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
index 88fca6c..30ad91a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
@@ -1,6 +1,6 @@
 require ttf.inc
 
-DESCRIPTION = "WenQuanYi Zen Hei - A Hei-Ti Style Chinese font"
+SUMMARY = "WenQuanYi Zen Hei - A Hei-Ti Style Chinese font"
 AUTHOR = "Qianqian Fang and The WenQuanYi Project Contributors"
 HOMEPAGE = "http://wqy.sourceforge.net/en/"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
index a79b57f..e718465 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "xdotool - command-line X11 automation tool - utilising X11 XTEST interface"
+SUMMARY = "xdotool - command-line X11 automation tool - utilising X11 XTEST interface"
 HOMEPAGE = "http://www.semicomplete.com/projects/xdotool"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=2f9cbf7e9401cec8a38666a08851ce6b"
diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
index d3fbd13..9d4d1c7 100644
--- a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
@@ -1,5 +1,5 @@
 require recipes-graphics/xorg-app/xorg-app-common.inc
-DESCRIPTION = "Tool for manipulating ICE protocol authorization records"
+SUMMARY = "Tool for manipulating ICE protocol authorization records"
 LIC_FILES_CHKSUM = "file://COPYING;md5=13f70acf3c27f5f834bbc954df775f8e"
 DEPENDS += "libice"
 PR = "r6"
diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb
index 702bac7..ec89064 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/xorg-app/xorg-app-common.inc
 
-DESCRIPTION = "a simple program for managing utmp/wtmp entries"
+SUMMARY = "a simple program for managing utmp/wtmp entries"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=07e6423e8815e6b372cd45da76faacd0"
 
diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
index a0a0eaf..d569fd0 100644
--- a/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
@@ -1,5 +1,5 @@
 require recipes-graphics/xorg-app/xorg-app-common.inc
-DESCRIPTION = "tiny window manager"
+SUMMARY = "tiny window manager"
 DEPENDS += " libxext libxt libxmu bison-native"
 
 LICENSE = "MIT"
diff --git a/meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb
index 8b6088b..cf970d5 100644
--- a/meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/xorg-app/xorg-app-common.inc
 
-DESCRIPTION = "analog / digital clock for X"
+SUMMARY = "analog / digital clock for X"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=857759ade8f2ddde5c7b32ef7356ea36"
 
diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb b/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
index 1cc8534..f258bb2 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
@@ -1,5 +1,5 @@
 require recipes-graphics/xorg-app/xorg-app-common.inc
-DESCRIPTION = "X server resource database utility"
+SUMMARY = "X server resource database utility"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d1167c4f586bd41f0c62166db4384a69"
 
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_293.bb b/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
index 20e88f1..67853b9 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
@@ -1,5 +1,5 @@
 require recipes-graphics/xorg-app/xorg-app-common.inc
-DESCRIPTION = "xterm is the standard terminal emulator for the X Window System."
+SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
 
 LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=33;md5=3aaef904421576f75ce2ee32af88c375"
diff --git a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb
index 629d932..973a00f 100644
--- a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb
+++ b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb
@@ -1,6 +1,6 @@
 require xorg-data-common.inc
 
-DESCRIPTION = "Common X11 Bitmaps"
+SUMMARY = "Common X11 Bitmaps"
 LICENSE = "MIT"
 DEPENDS += "libxmu"
 
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
index 031cddf..ac47cee 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
@@ -1,5 +1,5 @@
 require recipes-graphics/xorg-driver/xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- multitouch input driver"
+SUMMARY = "X.Org X server -- multitouch input driver"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
 
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
index fab7fab..77c080a 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
@@ -1,5 +1,5 @@
 require recipes-graphics/xorg-driver/xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- tslib input driver"
+SUMMARY = "X.Org X server -- tslib input driver"
 DEPENDS += "tslib"
 RRECOMMENDS_${PN} += "tslib-calibrate"
 RSUGGESTS_${PN} += "hal"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
index 89c7806..fec64cb 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
@@ -1,5 +1,5 @@
 require recipes-graphics/xorg-driver/xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- void input driver"
+SUMMARY = "X.Org X server -- void input driver"
 PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4be6a915bfbf111cd88706fc6a6f141b"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb
index fdc49b2..2fdb210 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb
@@ -1,7 +1,7 @@
 require recipes-graphics/xorg-driver/xorg-driver-video.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7f3e39474aeea5af381a8e103dafc36"
 
-DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
+SUMMARY = "X.org server -- Geode GX2/LX display driver"
 PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "c9a4e1c5438240e5bdce332f92df9163"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index 583730f..38c12f3 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -1,5 +1,5 @@
 require recipes-graphics/xorg-driver/xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Glamo display driver with KMS support"
+SUMMARY = "X.Org X server -- Glamo display driver with KMS support"
 DEPENDS += "libdrm"
 RDEPENDS_${PN} += "xserver-xorg-module-exa"
 
diff --git a/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb b/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
index e8b74f9..7d26d14 100644
--- a/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
@@ -2,7 +2,7 @@ require recipes-graphics/xorg-lib/xorg-lib-common.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b0d5bdc98f7ebab3b6c3791d9bf40907"
 
-DESCRIPTION = "XFIXES Extension"
+SUMMARY = "XFIXES Extension"
 DEPENDS += " xextproto xproto zlib"
 PE = "1"
 PR = "r11"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
index 83cd1f9..fef5acd 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
@@ -1,5 +1,5 @@
 require recipes-graphics/xorg-lib/xorg-lib-common.inc
-DESCRIPTION = "X Athena Widget Set"
+SUMMARY = "X Athena Widget Set"
 DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxau xmlto-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb b/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
index c56ee18..66a717e 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
@@ -1,5 +1,5 @@
 require recipes-graphics/xorg-lib/xorg-lib-common.inc
-DESCRIPTION = "X11 keyboard UI presentation library"
+SUMMARY = "X11 keyboard UI presentation library"
 LICENSE = "GPL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4641deddaa80fe7ca88e944e1fd94a94"
 DEPENDS += "virtual/libx11 libxt libxkbfile"
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 5bc37b0..12fff9a 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Common X11 scripts and support files"
+SUMMARY = "Common X11 scripts and support files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index d5e461a..47470fb 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Simple Xserver Init Script (no dm)"
+SUMMARY = "Simple Xserver Init Script (no dm)"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
diff --git a/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb b/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb
index ce6885c..62f2a99 100644
--- a/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb
+++ b/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb
@@ -2,7 +2,7 @@
 
 require ktap.inc
 
-DESCRIPTION = "KTAP is a scripting dynamic tracing tool for Linux"
+SUMMARY = "KTAP is a scripting dynamic tracing tool for Linux"
 
 inherit module
 
diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb
index a455cad..8966dbb 100644
--- a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb
+++ b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Alsa OSS Compatibility Package"
+SUMMARY = "Alsa OSS Compatibility Package"
 SECTION = "libs/multimedia"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
diff --git a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
index ee4a7b1..d454384 100644
--- a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
+++ b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Enlightened Sound Daemon"
+SUMMARY = "Enlightened Sound Daemon"
 SECTION = "gpe/base"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
index 855299c..3723f8d 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library for reading some sort of media format."
+SUMMARY = "Library for reading some sort of media format"
 SECTION = "libs"
 LICENSE = "GPLv2"
 
diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index 6818413..3089b8e 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library for interacting with ID3 tags."
+SUMMARY = "Library for interacting with ID3 tags"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
index afc8a14..4895dd2 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "DVD access multimeda library"
+SUMMARY = "DVD access multimeda library"
 SECTION = "libs/multimedia"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
diff --git a/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb b/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb
index d277d73..9e2d98b 100644
--- a/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb
+++ b/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "MMS stream protocol library"
+SUMMARY = "MMS stream protocol library"
 HOMEPAGE = "http://sourceforge.net/projects/libmms/"
 SECTION = "libs/multimedia"
 
diff --git a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.7.bb b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.7.bb
index 3028985..2361875 100644
--- a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.7.bb
+++ b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library for reading mod-like audio files."
+SUMMARY = "Library for reading mod-like audio files"
 HOMEPAGE = "http://modplug-xmms.sf.net"
 
 LICENSE = "PD"
diff --git a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
index b39f208..148d169 100644
--- a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
+++ b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "FFmpeg derived postprocessing library"
+SUMMARY = "FFmpeg derived postprocessing library"
 HOMEPAGE = "http://git.videolan.org/?p=libpostproc.git;a=summary"
 SECTION = "libs"
 DEPENDS = "libav"
diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index 459bf12..ef78927 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Simple DirectMedia Layer image library."
+SUMMARY = "Simple DirectMedia Layer image library"
 SECTION = "libs"
 
 LICENSE = "Zlib"
diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
index d3f3bb0..19b9236 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Simple DirectMedia Layer mixer library."
+SUMMARY = "Simple DirectMedia Layer mixer library"
 SECTION = "libs"
 DEPENDS = "virtual/libsdl flac libmikmod libvorbis"
 LICENSE = "Zlib"
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
index 9a42b82..a4e8b70 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
@@ -1,7 +1,7 @@
 # Copyright Matthias Hentges <devel@hentges.net> (c) 2006
 # License: MIT (see COPYING.MIT)
 
-DESCRIPTION = "Preconfigured mplayer preferences"
+SUMMARY = "Preconfigured mplayer preferences"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 259792f..3c80782 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Open Source multimedia player."
+SUMMARY = "Open Source multimedia player"
 SECTION = "multimedia"
 HOMEPAGE = "http://www.mplayerhq.hu/"
 DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
index 446cdfa..71f4053 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Freedesktop sound theme"
+SUMMARY = "Freedesktop sound theme"
 HOMEPAGE = "http://freedesktop.org/wiki/Specifications/sound-theme-spec"
 LICENSE = "GPLv2+ CC-BY-3.0 CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://CREDITS;md5=3213e601ce34bb42ddc3498903ac4e69"
diff --git a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
index 8f61571..86e5364 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Media controller control application"
+SUMMARY = "Media controller control application"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
 
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
index 6737870..485a416 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "v4l2 and IR applications"
+SUMMARY = "v4l2 and IR applications"
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
                     file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
index a3c683a..a20f591 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Yet Another V4L2 Test Application"
+SUMMARY = "Yet Another V4L2 Test Application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
index 7720799..7cb84ff 100644
--- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
+++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
@@ -1,5 +1,5 @@
 LICENSE= "MIT"
-DESCRIPTION = "X Server Nokia 770 extensions library"
+SUMMARY = "X Server Nokia 770 extensions library"
 SECTION = "x11/libs"
 DEPENDS = "virtual/libx11 libxext"
 
diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
index 35f3ce6..22d92ca 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -1,5 +1,5 @@
 LICENSE= "MIT"
-DESCRIPTION = "X Server Nokia 770 extensions library"
+SUMMARY = "X Server Nokia 770 extensions library"
 SECTION = "x11/libs"
 DEPENDS = "virtual/libx11 libxext xpext"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea2bda168c508c7cd8afa567b2fcc549"
diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
index 860f84e..7ed3bf2 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "FoxtrotGPS is a map and GPS application using OpenStreetMap"
+SUMMARY = "FoxtrotGPS is a map and GPS application using OpenStreetMap"
 AUTHOR = "Joshua Judson Rosen <rozzin@geekspace.com>"
 HOMEPAGE = "http://www.foxtrotgps.org/"
 SECTION = "x11/applications"
diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
index ce8574e..4fa6de1 100644
--- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GDAL is a translator library for raster geospatial data formats"
+SUMMARY = "GDAL is a translator library for raster geospatial data formats"
 HOMEPAGE = "http://www.gdal.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=b9bd75ae5af7ff87ab259be0121c4106"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
index 2042383..d023c5d 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Machine specific gpsd config"
+SUMMARY = "Machine specific gpsd config"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index 12541cc..e78f80e 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
+SUMMARY = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
@@ -108,28 +108,28 @@ FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
 RDEPENDS_${PN} = "gpsd-gpsctl"
 RRECOMMENDS_${PN} = "gpsd-conf gpsd-udev gpsd-machine-conf"
 
-DESCRIPTION_gpsd-udev = "udev relevant files to use gpsd hotplugging"
+SUMMARY_gpsd-udev = "udev relevant files to use gpsd hotplugging"
 FILES_gpsd-udev = "${base_libdir}/udev ${sysconfdir}/udev/*"
 RDEPENDS_gpsd-udev += "udev gpsd-conf"
 
-DESCRIPTION_libgpsd = "C service library used for communicating with gpsd"
+SUMMARY_libgpsd = "C service library used for communicating with gpsd"
 FILES_libgpsd = "${libdir}/libgpsd.so.*"
 
-DESCRIPTION_libgps = "C service library used for communicating with gpsd"
+SUMMARY_libgps = "C service library used for communicating with gpsd"
 FILES_libgps = "${libdir}/libgps.so.*"
 
-DESCRIPTION_gpsd-conf = "gpsd configuration files and init scripts"
+SUMMARY_gpsd-conf = "gpsd configuration files and init scripts"
 FILES_gpsd-conf = "${sysconfdir}"
 CONFFILES_gpsd-conf = "${sysconfdir}/default/gpsd.default"
 
-DESCRIPTION_gpsd-gpsctl = "Tool for tweaking GPS modes"
+SUMMARY_gpsd-gpsctl = "Tool for tweaking GPS modes"
 FILES_gpsd-gpsctl = "${bindir}/gpsctl"
 
-DESCRIPTION_gps-utils = "Utils used for simulating, monitoring,... a GPS"
+SUMMARY_gps-utils = "Utils used for simulating, monitoring,... a GPS"
 FILES_gps-utils = "${bindir}/*"
 RDEPENDS_gps-utils = "python-pygps"
 
-DESCRIPTION_python-pygps = "Python bindings to gpsd"
+SUMMARY_python-pygps = "Python bindings to gpsd"
 FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"
 
diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
index 625377d..a56a51b 100644
--- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
+++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GPS application for openmoko freerunner"
+SUMMARY = "GPS application for openmoko freerunner"
 HOMEPAGE = "http://omgps.googlecode.com"
 SECTION = "openmoko/applications"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
index 5c08057..f5523e3 100644
--- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
+++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Astronomical application which displays the night sky"
+SUMMARY = "Astronomical application which displays the night sky"
 HOMEPAGE    = "http://projects.openmoko.org/projects/orrery/"
 SECTION = "x11/scientific"
 LICENSE = "GPLv2+"
diff --git a/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb b/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
index 6af8e5e..d526044 100644
--- a/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
+++ b/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Qt Library for oFono"
+SUMMARY = "Qt Library for oFono"
 HOMEPAGE = "https://github.com/nemomobile/libqofono"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README;endline=3;md5=8a15bce3921d1238d9a9f23828612947"
diff --git a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver-socketcan_svn.bb b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver-socketcan_svn.bb
index 9bba750..9852b0c 100644
--- a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver-socketcan_svn.bb
+++ b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver-socketcan_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The Linux CAN Sniffer - SocketCAN driver"
+SUMMARY = "The Linux CAN Sniffer - SocketCAN driver"
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://../../../modeltest/LICENSE.GPL;md5=34337af480a8c452bfafe22a78fa20cb"
diff --git a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver_svn.bb b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver_svn.bb
index ef866b4..4b566f7 100644
--- a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver_svn.bb
+++ b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The Linux CAN Sniffer"
+SUMMARY = "The Linux CAN Sniffer"
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://modeltest/LICENSE.GPL;md5=34337af480a8c452bfafe22a78fa20cb"
diff --git a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
index 201321f..abf48cf 100644
--- a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
+++ b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Qt Ext Serial Port Library"
+SUMMARY = "Qt Ext Serial Port Library"
 HOMEPAGE = "http://http://code.google.com/p/qextserialport/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b866a28cda707ec714878bd933f46251"
diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
index 44eb672..2da3c05 100644
--- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
+++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Lightweight, cross-platform integrated development environment"
+SUMMARY = "Lightweight, cross-platform integrated development environment"
 
 HOMEPAGE = "http://qt-project.org/"
 LICENSE = "LGPLv2.1"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
index 15824bb..831a140 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
@@ -1,5 +1,5 @@
 SECTION = "x11/network"
-DESCRIPTION = "Mail user agent"
+SUMMARY = "Mail user agent"
 DEPENDS = "gtk+ libetpan openssl aspell curl"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e059bde2972c1790af786f3e86bac22e"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
index 3bd3deb..f203cc0 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
@@ -1,5 +1,5 @@
 SECTION = "x11/network"
-DESCRIPTION = "Mail user agent plugins"
+SUMMARY = "Mail user agent plugins"
 DEPENDS = "claws-mail gtkhtml2 curl"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=977f04a8048c04684e521c06e2844a94"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
index 5ae1632..a4717dc 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
@@ -1,5 +1,5 @@
 SECTION = "x11/network"
-DESCRIPTION = "Mail user agent plugins"
+SUMMARY = "Mail user agent plugins"
 DEPENDS = "claws-mail"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
index caf32b4..f441c98 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
@@ -1,5 +1,5 @@
 SECTION = "x11/network"
-DESCRIPTION = "Mail user agent plugins"
+SUMMARY = "Mail user agent plugins"
 DEPENDS = "claws-mail libxml2 curl glib-2.0 gtk+"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c2348e0a084e573f0220f5e45d8097e"
diff --git a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
index 1ca25ab..a878220 100644
--- a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
+++ b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
@@ -1,5 +1,5 @@
 SECTION = "x11/network"
-DESCRIPTION = "Mail user agent"
+SUMMARY = "Mail user agent"
 DEPENDS = "gtk+ gpgme gnutls"
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4 \
diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
index 014d122..ad7fd28 100644
--- a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
+++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Programmable Completion for Bash 4"
+SUMMARY = "Programmable Completion for Bash 4"
 HOMEPAGE = "http://bash-completion.alioth.debian.org/"
 BUGTRACKER = "https://alioth.debian.org/projects/bash-completion/"
 
diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.8.bb b/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
index e70ec39..efaf72d 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Generic USB CCID smart card reader driver"
+SUMMARY = "Generic USB CCID smart card reader driver"
 HOMEPAGE = "http://pcsclite.alioth.debian.org/ccid.html"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe/recipes-support/daemonize/daemonize_git.bb
index f6e5203..57dc15b 100644
--- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
+++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A tool to run a command as a daemon"
+SUMMARY = "A tool to run a command as a daemon"
 HOMEPAGE = "http://software.clapper.org/daemonize/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=3cf9084faa88bc8554a9139d8d7dd35f"
diff --git a/meta-oe/recipes-support/debianutils/debianutils_2.30.bb b/meta-oe/recipes-support/debianutils/debianutils_2.30.bb
index 8b378b0..624cf3c 100644
--- a/meta-oe/recipes-support/debianutils/debianutils_2.30.bb
+++ b/meta-oe/recipes-support/debianutils/debianutils_2.30.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Miscellaneous utilities specific to Debian"
+SUMMARY = "Miscellaneous utilities specific to Debian"
 SECTION = "base"
 LICENSE = "GPLv2 & BSD & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=b948675029f79c64840e78881e91e1d4"
diff --git a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
index daf76d3..7c40fbc 100644
--- a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
+++ b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Devicekit power"
+SUMMARY = "Devicekit power"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=756cf97871f77233638937da21b025d3"
 
diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index 0b45412..e48cc92 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Simple program to read/write from/to any location in memory."
+SUMMARY = "Simple program to read/write from/to any location in memory"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=dd68f2b0a5184b3db3dc25c99e0bd0cd"
 PR = "r7"
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb b/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
index 7e71820..026a904 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "USB Device Firmware Upgrade utility"
+SUMMARY = "USB Device Firmware Upgrade utility"
 SECTION = "devel"
 AUTHOR = "Harald Welte <laforge@openmoko.org>"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb b/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
index 26ab3b6..2582820 100644
--- a/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
+++ b/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "read temperature sensors in a 1-Wire net"
+SUMMARY = "read temperature sensors in a 1-Wire net"
 SECTION = "util"
 DEPENDS = "libusb1"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.9.bb
index ba6d70d..e65a143 100644
--- a/meta-oe/recipes-support/enca/enca_1.9.bb
+++ b/meta-oe/recipes-support/enca/enca_1.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Enca is an Extremely Naive Charset Analyser"
+SUMMARY = "Enca is an Extremely Naive Charset Analyser"
 SECTION = "libs"
 HOMEPAGE = "http://trific.ath.cx/software/enca/"
 
diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb b/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
index f82991b..e31c194 100644
--- a/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
+++ b/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Replacement syslog API"
+SUMMARY = "Replacement syslog API"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b8ba8e77bcda9a53fac0fe39fe957767"
 
diff --git a/meta-oe/recipes-support/evtest/evtest_1.25.bb b/meta-oe/recipes-support/evtest/evtest_1.25.bb
index 5e11131..34b5b74 100644
--- a/meta-oe/recipes-support/evtest/evtest_1.25.bb
+++ b/meta-oe/recipes-support/evtest/evtest_1.25.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Simple tool for input event debugging."
+SUMMARY = "Simple tool for input event debugging"
 HOMEPAGE = "http://people.freedesktop.org/~whot/evtest/"
 AUTHOR = "Vojtech Pavlik <vojtech@suse.cz>"
 SECTION = "console/utils"
diff --git a/meta-oe/recipes-support/fbset/fbset-modes.bb b/meta-oe/recipes-support/fbset/fbset-modes.bb
index e3b26ec..1310e6f 100644
--- a/meta-oe/recipes-support/fbset/fbset-modes.bb
+++ b/meta-oe/recipes-support/fbset/fbset-modes.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Default display timings and resolutions for fbset"
+SUMMARY = "Default display timings and resolutions for fbset"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
index 88d4f5e..aa78008 100644
--- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
+++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
@@ -5,7 +5,7 @@
 # Filename: fbset_2.1.bb
 # Date: 28-May-06
 
-DESCRIPTION = "The fbset console tool"
+SUMMARY = "The fbset console tool"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://fbset.c;endline=19;md5=bf326f82cdfcac391af208f019c5603f"
 RRECOMMENDS_${PN} = "fbset-modes"
diff --git a/meta-oe/recipes-support/fbtest/fb-test_git.bb b/meta-oe/recipes-support/fbtest/fb-test_git.bb
index eea1be4..c8b4a1b 100644
--- a/meta-oe/recipes-support/fbtest/fb-test_git.bb
+++ b/meta-oe/recipes-support/fbtest/fb-test_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Test suite for Linux framebuffer"
+SUMMARY = "Test suite for Linux framebuffer"
 
 PV = "0.0"
 
diff --git a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
index 6b7a1af..4909460 100644
--- a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
+++ b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "FLTK is a cross-platform C++ GUI toolkit"
+SUMMARY = "FLTK is a cross-platform C++ GUI toolkit"
 HOMEPAGE = "http://www.fltk.org"
 SECTION = "libs"
 LICENSE = "LGPLv2 & FLTK"
diff --git a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
index 2439d52..957c4eb 100644
--- a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
+++ b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
@@ -1,7 +1,7 @@
 SECTION = "libs"
 LICENSE = "GD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
-DESCRIPTION = "gd is a library used to create PNG, JPEG, or WBMP images."
+SUMMARY = "gd is a library used to create PNG, JPEG, or WBMP images"
 DEPENDS = "freetype libpng jpeg zlib"
 PR = "r5"
 
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.1.bb
index 50681e1..7d4a0b0 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Fast, multi-threaded malloc() and nifty performance analysis tools"
+SUMMARY = "Fast, multi-threaded malloc() and nifty performance analysis tools"
 HOMEPAGE = "http://code.google.com/p/gperftools/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
diff --git a/meta-oe/recipes-support/htop/htop_1.0.2.bb b/meta-oe/recipes-support/htop/htop_1.0.2.bb
index 3982f66..234978b 100644
--- a/meta-oe/recipes-support/htop/htop_1.0.2.bb
+++ b/meta-oe/recipes-support/htop/htop_1.0.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "htop process monitor"
+SUMMARY = "htop process monitor"
 HOMEPAGE = "http://htop.sf.net"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
index 3d76f8b..a9e8593 100644
--- a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
+++ b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Set of i2c tools for linux"
+SUMMARY = "Set of i2c tools for linux"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
index 9869149..c7de2f4 100644
--- a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
+++ b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Fast and portable XML parser and Jabber protocol library"
+SUMMARY = "Fast and portable XML parser and Jabber protocol library"
 AUTHOR = "Gurer Ozen <meduketto at gmail.com>"
 HOMEPAGE = "http://iksemel.googlecode.com"
 SECTION = "libs"
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
index 34e8013..9ff03c3 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "ImageMagick is an image convertion tools"
+SUMMARY = "ImageMagick is an image convertion tools"
 SECTION = "console/utils"
 LICENSE = "ImageMagick"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1bf06a8d02cb00b02dea7d03ef9525f"
diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
index 4709be0..2a13d0a 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "C and C++ INI Library"
+SUMMARY = "C and C++ INI Library"
 HOMEPAGE = "http://code.google.com/p/inih/"
 PV = "0.0+gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
diff --git a/meta-oe/recipes-support/joe/joe_3.1.bb b/meta-oe/recipes-support/joe/joe_3.1.bb
index 7c5922d..fb9a9fb 100644
--- a/meta-oe/recipes-support/joe/joe_3.1.bb
+++ b/meta-oe/recipes-support/joe/joe_3.1.bb
@@ -1,5 +1,5 @@
 SECTION = "console/utils"
-DESCRIPTION = "Console text editor with good functionality, good choice for vi-haters."
+SUMMARY = "Console text editor with good functionality, good choice for vi-haters"
 HOMEPAGE = "http://joe-editor.sourceforge.net/"
 LICENSE = "GPLv1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=da10ed7cf8038981c580e11c1d3e8fb6"
diff --git a/meta-oe/recipes-support/lcms/lcms_1.17.bb b/meta-oe/recipes-support/lcms/lcms_1.17.bb
index 156bc31..64e6f07 100644
--- a/meta-oe/recipes-support/lcms/lcms_1.17.bb
+++ b/meta-oe/recipes-support/lcms/lcms_1.17.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Little cms is a small-footprint, speed optimized color management engine."
+SUMMARY = "Little cms is a small-footprint, speed optimized color management engine"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=156745cad721a8783cb847e82b79f586"
diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
index 0a378b4..21f4e2a 100644
--- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
+++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "ATA S.M.A.R.T. Reading and Parsing Library"
+SUMMARY = "ATA S.M.A.R.T. Reading and Parsing Library"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
diff --git a/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
index a169390..2e5f07f 100644
--- a/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
+++ b/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Replacement for the old crypt() package and crypt(1) command, with extensions."
+SUMMARY = "Replacement for the old crypt() package and crypt(1) command, with extensions"
 HOMEPAGE = "http://mcrypt.sourceforge.net/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
diff --git a/meta-oe/recipes-support/libol/libol_0.3.18.bb b/meta-oe/recipes-support/libol/libol_0.3.18.bb
index 2375369..429945f 100644
--- a/meta-oe/recipes-support/libol/libol_0.3.18.bb
+++ b/meta-oe/recipes-support/libol/libol_0.3.18.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A tiny C support library"
+SUMMARY = "A tiny C support library"
 SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
diff --git a/meta-oe/recipes-support/libraw1394/libraw1394_2.1.0.bb b/meta-oe/recipes-support/libraw1394/libraw1394_2.1.0.bb
index 617ba1b..811829e 100644
--- a/meta-oe/recipes-support/libraw1394/libraw1394_2.1.0.bb
+++ b/meta-oe/recipes-support/libraw1394/libraw1394_2.1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "base library for low-level IEEE 1394 accesses"
+SUMMARY = "base library for low-level IEEE 1394 accesses"
 HOMEPAGE = "https://ieee1394.wiki.kernel.org/index.php/Libraries#libraw1394"
 SECTION = "libs"
 LICENSE = "LGPL-2.1"
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
index 09e5ec2..c6e5a15 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Simple DirectMedia Layer truetype font library."
+SUMMARY = "Simple DirectMedia Layer truetype font library"
 SECTION = "libs"
 DEPENDS = "virtual/libsdl freetype"
 LICENSE = "LGPLv2.1"
diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb b/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
index ceb2b86..79c171a 100644
--- a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
@@ -1,4 +1,7 @@
-SUMMARY = "libsoc is a C library for interfacing with common SoC peripherals through generic kernel interfaces"
+SUMMARY = "Library for interfacing with common SoC peripherals"
+DESCRIPTION = "libsoc is a C library to interface with common peripherals (gpio, i2c, spi, pwm) \
+               found in SoC (System on Chips) through generic Linux Kernel interfaces."
+
 HOMEPAGE = "https://github.com/jackmitch/libsoc"
 
 LICENSE = "LGPLv2.1"
diff --git a/meta-oe/recipes-support/libssh/libssh_git.bb b/meta-oe/recipes-support/libssh/libssh_git.bb
index 14fd1e4..3f118a0 100644
--- a/meta-oe/recipes-support/libssh/libssh_git.bb
+++ b/meta-oe/recipes-support/libssh/libssh_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Multiplatform C library implementing the SSHv2 and SSHv1 protocol"
+SUMMARY = "Multiplatform C library implementing the SSHv2 and SSHv1 protocol"
 HOMEPAGE = "http://www.libssh.org"
 SECTION = "libs"
 
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index 8670fac..e09a539 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -1,6 +1,6 @@
 # (c) Copyright 2012  Hewlett-Packard Development Company, L.P. 
 
-DESCRIPTION = "a simple, small, minimal, C++ XML parser"
+SUMMARY = "a simple, small, minimal, C++ XML parser"
 HOMEPAGE = "http://www.sourceforge.net/projects/tinyxml"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://readme.txt;md5=f8f366f3370dda889f60faa7db162cf4"
diff --git a/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb b/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
index 32d45b0..af8d63f 100644
--- a/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
+++ b/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
@@ -1,4 +1,4 @@
-SUMMARY = "LibYAML is a YAML parser and emitter written in C."
+SUMMARY = "LibYAML is a YAML parser and emitter written in C"
 HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
 SECTION = "libs/devel"
 LICENSE = "MIT"
diff --git a/meta-oe/recipes-support/lockdev/lockdev_git.bb b/meta-oe/recipes-support/lockdev/lockdev_git.bb
index 22d14b9..919487f 100644
--- a/meta-oe/recipes-support/lockdev/lockdev_git.bb
+++ b/meta-oe/recipes-support/lockdev/lockdev_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Locking devices library" 
+SUMMARY = "Locking devices library"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM="file://COPYING;md5=4fbd65380cdd255951079008b364516c"
diff --git a/meta-oe/recipes-support/lzip/lzip_1.14.bb b/meta-oe/recipes-support/lzip/lzip_1.14.bb
index 6a1e339..8b4a3fb 100644
--- a/meta-oe/recipes-support/lzip/lzip_1.14.bb
+++ b/meta-oe/recipes-support/lzip/lzip_1.14.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Lzip is a lossless data compressor based on the LZMA algorithm"
+SUMMARY = "Lzip is a lossless data compressor based on the LZMA algorithm"
 HOMEPAGE = "http://lzip.nongnu.org/lzip.html"
 SECTION = "console/utils"
 LICENSE = "GPLv3"
diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index 5e30df1..76e6f49 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A virtual keyboard for touch-screen based user interfaces"
+SUMMARY = "A virtual keyboard for touch-screen based user interfaces"
 HOMEPAGE = "https://wiki.maliit.org/Main_Page"
 
 LICENSE = "LGPLv2.1"
diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
index 326c9fa..903825a 100644
--- a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Plugins for a virtual keyboard for touch-screen based user interfaces"
+SUMMARY = "Plugins for a virtual keyboard for touch-screen based user interfaces"
 HOMEPAGE = "https://wiki.maliit.org/Main_Page"
 
 LICENSE = "BSD"
diff --git a/meta-oe/recipes-support/mg/mg_20110905.bb b/meta-oe/recipes-support/mg/mg_20110905.bb
index 7a6a1c7..33cc038 100644
--- a/meta-oe/recipes-support/mg/mg_20110905.bb
+++ b/meta-oe/recipes-support/mg/mg_20110905.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A portable version of the mg maintained by the OpenBSD team"
+SUMMARY = "A portable version of the mg maintained by the OpenBSD team"
 HOMEPAGE = "http://homepage.boetes.org/software/mg/"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://version.c;md5=811e1b67a5cd60c12b218a2b7c1adbf2"
diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
index db481e3..a4628c1 100644
--- a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
+++ b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
@@ -1,5 +1,5 @@
 SECTION = "base"
-DESCRIPTION = "MIME files 'mime.types' & 'mailcap', and support programs"
+SUMMARY = "MIME files 'mime.types' & 'mailcap', and support programs"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://debian/README;md5=36bbe2ace0a05c3fb684b73208fbf30b"
 
diff --git a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb b/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
index 93a4f4e..0f1548a 100644
--- a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
+++ b/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "A minimal iconv implementation w/ support for UTF-8, ASCII, ISO-8859-1"
+SUMMARY = "A minimal iconv implementation w/ support for UTF-8, ASCII, ISO-8859-1"
 HOMEPAGE = "http://tinderbox.dev.gentoo.org/portage/local/misc/mini-iconv/"
 LICENSE = "MPL-1.1"
 SECTION = "libs"
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index b52b111..038f4e2 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The upstream project used to drive the Device Mapper multipathing driver."
+SUMMARY = "The upstream project used to drive the Device Mapper multipathing driver"
 
 DEPENDS = "lvm2 libaio readline"
 
diff --git a/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb b/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
index 1178e90..6fc974e 100644
--- a/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
+++ b/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python interface to MySQL"
+SUMMARY = "Python interface to MySQL"
 HOMEPAGE = "https://github.com/farcepest/MySQLdb1"
 SECTION = "devel/python"
 LICENSE = "GPLv2"
diff --git a/meta-oe/recipes-support/nmon/nmon_13g.bb b/meta-oe/recipes-support/nmon/nmon_13g.bb
index 38ea3e5..1f75189 100644
--- a/meta-oe/recipes-support/nmon/nmon_13g.bb
+++ b/meta-oe/recipes-support/nmon/nmon_13g.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "nmon performance monitor"
+SUMMARY = "nmon performance monitor"
 HOMEPAGE = "http://nmon.sf.net"
 SECTION = "console/utils"
 LICENSE = "GPLv3"
diff --git a/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb b/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb
index 7d85016..5da4561 100644
--- a/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb
+++ b/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "FFTW benchmarks"
+SUMMARY = "FFTW benchmarks"
 SECTION = "libs"
 LICENSE = "GPLv2"
 
diff --git a/meta-oe/recipes-support/ode/ode_0.9.bb b/meta-oe/recipes-support/ode/ode_0.9.bb
index d076abb..1f3a5ca 100644
--- a/meta-oe/recipes-support/ode/ode_0.9.bb
+++ b/meta-oe/recipes-support/ode/ode_0.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "ODE is an Open Source Physics Engine."
+SUMMARY = "ODE is an Open Source Physics Engine"
 SECTION = "libs"
 HOMEPAGE = "http://www.ode.org"
 LICENSE = "LGPLv2.1 & BSD"
diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
index e00a5e6..9d862fe 100644
--- a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Opencv : The Open Computer Vision Library"
+SUMMARY = "Opencv : The Open Computer Vision Library"
 HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
 SECTION = "libs"
 LICENSE = "BSD"
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 538c7a3..df512f6 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Opencv : The Open Computer Vision Library"
+SUMMARY = "Opencv : The Open Computer Vision Library"
 HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
 SECTION = "libs"
 
@@ -83,7 +83,7 @@ FILES_${PN}-doc = "${datadir}/OpenCV/doc"
 ALLOW_EMPTY_${PN} = "1"
 
 INSANE_SKIP_python-opencv = "True"
-DESCRIPTION_python-opencv = "Python bindings to opencv"
+SUMMARY_python-opencv = "Python bindings to opencv"
 FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python-opencv = "python-core python-numpy"
 
diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
index 1f01215..2e41524 100644
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -1,5 +1,5 @@
 SECTION = "libs"
-DESCRIPTION = "OSM/Motif implementation."
+SUMMARY = "OSM/Motif implementation"
 LICENSE = "OGPL"
 DEPENDS = "xbitmaps virtual/libx11 libxt libxft xproto"
 
diff --git a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
index 8053eda..e740b6d 100644
--- a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
+++ b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Libsyncml is an implementation of the SyncML protocol."
+SUMMARY = "Libsyncml is an implementation of the SyncML protocol"
 HOMEPAGE = "https://libsyncml.opensync.org/"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
diff --git a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
index c66e6dc..d383c65 100644
--- a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
+++ b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "WBXML parsing and encoding library."
+SUMMARY = "WBXML parsing and encoding library"
 HOMEPAGE = "http://libwbxml.opensync.org/"
 SECTION = "libs"
 LICENSE = "LGPLv2.1+"
diff --git a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
index c5b6129..67c2c00 100644
--- a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
+++ b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Provides a way to load and enumerate PKCS#11 modules"
+SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
 
diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
index 85ec414..00a9635 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "PC/SC Lite smart card framework and applications"
+SUMMARY = "PC/SC Lite smart card framework and applications"
 HOMEPAGE = "http://pcsclite.alioth.debian.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a39d325b7d9cf2f07826a5154b16500c"
diff --git a/meta-oe/recipes-support/picocom/picocom_1.6.bb b/meta-oe/recipes-support/picocom/picocom_1.6.bb
index 9fdd9d6..6b5200c 100644
--- a/meta-oe/recipes-support/picocom/picocom_1.6.bb
+++ b/meta-oe/recipes-support/picocom/picocom_1.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Lightweight and minimal (~20K) dumb-terminal emulation program."
+SUMMARY = "Lightweight and minimal (~20K) dumb-terminal emulation program"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
 HOMEPAGE = "http://code.google.com/p/picocom/"
diff --git a/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb b/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
index bb79501..7396efd 100644
--- a/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
+++ b/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "(OTR) Messaging allows you to have private conversations over instant messaging"
+SUMMARY = "(OTR) Messaging allows you to have private conversations over instant messaging"
 HOMEPAGE = "http://www.cypherpunks.ca/otr/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=92fe174bad6da3763f6e9e9eaff6df24"
diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
index 93139b9..cf3c680 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "(OTR) Messaging allows you to have private conversations over instant messaging"
+SUMMARY = "(OTR) Messaging allows you to have private conversations over instant messaging"
 HOMEPAGE = "http://www.cypherpunks.ca/otr/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=92fe174bad6da3763f6e9e9eaff6df24"
diff --git a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
index bec8236..445e8ad 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
+++ b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "pngcheck verifies the integrity of PNG, JNG and MNG files"
+SUMMARY = "pngcheck verifies the integrity of PNG, JNG and MNG files"
 HOMEPAGE = "http://www.libpng.org/pub/png/apps/pngcheck.html"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://gpl/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb
index cb502d4..644e318 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Poppler is a PDF rendering library based on the xpdf-3.0 code base."
+SUMMARY = "Poppler is a PDF rendering library based on the xpdf-3.0 code base"
 LICENSE = "Adobe"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
                     file://COPYING.adobe;md5=63c6a8a9df204c00461fa5f163d8a663 \
diff --git a/meta-oe/recipes-support/poppler/poppler_0.22.4.bb b/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
index f1f4561..7aa0dfc 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Poppler is a PDF rendering library based on the xpdf-3.0 code base."
+SUMMARY = "Poppler is a PDF rendering library based on the xpdf-3.0 code base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
index 454bd34..c8d7378 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A portable audio library"
+SUMMARY = "A portable audio library"
 SECTION = "libs/multimedia"
 LICENSE = "PortAudio"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
index 3241b83..84094dc 100644
--- a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
+++ b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tool to display and modify PXA registers at runtime"
+SUMMARY = "Tool to display and modify PXA registers at runtime"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://pxaregs.c;endline=12;md5=2cb6b33300eacdec4d7299bc42533740"
 AUTHOR = "Holger Schurig <hs4233@mail.mn-solutions.de>"
diff --git a/meta-oe/recipes-support/re2c/re2c_0.13.5.bb b/meta-oe/recipes-support/re2c/re2c_0.13.5.bb
index d87f176..fff7a78 100644
--- a/meta-oe/recipes-support/re2c/re2c_0.13.5.bb
+++ b/meta-oe/recipes-support/re2c/re2c_0.13.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tool for writing very fast and very flexible scanners"
+SUMMARY = "Tool for writing very fast and very flexible scanners"
 HOMEPAGE = "http://re2c.sourceforge.net/"
 AUTHOR = "Marcus Börger <helly@users.sourceforge.net>"
 SECTION = "devel"
diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
index cccc6a5..7803b28 100644
--- a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
+++ b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Random number generator daemon"
+SUMMARY = "Random number generator daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS_append_libc-uclibc = " argp-standalone"
diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
index ca98ab5..269c1b7 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A user-space tool to show and modify the state of GPIOs on the S3c24xx platform"
+SUMMARY = "A user-space tool to show and modify the state of GPIOs on the S3c24xx platform"
 SECTION = "console/utils"
 AUTHOR = "Werner Almesberger <werner@openmoko.org>"
 LICENSE = "GPLv2+"
diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
index 168395f..256da09 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A user-space tool to show and modify the state of GPIOs on the S3c64xx platform"
+SUMMARY = "A user-space tool to show and modify the state of GPIOs on the S3c64xx platform"
 SECTION = "console/utils"
 AUTHOR = "Werner Almesberger <werner@openmoko.org>"
 LICENSE = "GPLv2+"
diff --git a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
index a6ec087..2d5935d 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "JTAG utility to interface w/ a S3C2410 device"
+SUMMARY = "JTAG utility to interface w/ a S3C2410 device"
 SECTION = "devel"
 AUTHOR = "Harald Welte <laforge@openmoko.org>"
 LICENSE = "GPLv2+"
diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
index 5d89b64..b2b878d 100644
--- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
+++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Receive a forwarded serial from serial-forward and provide a PTY"
+SUMMARY = "Receive a forwarded serial from serial-forward and provide a PTY"
 AUTHOR = "Holger 'Zecke' Freyther"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
index 9d7b990..129a3be 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Forward a serial using TCP/IP"
+SUMMARY = "Forward a serial using TCP/IP"
 AUTHOR = "Holger 'Zecke' Freyther'"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
index 8b0b76a..29fe132 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Utilities for working with generic SCSI devices"
+SUMMARY = "Utilities for working with generic SCSI devices"
 HOMEPAGE = "http://sg.danny.cz/sg/sg3_utils.html"
 SECTION = "console/admin"
 
diff --git a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
index 54b59bf..5148f35 100644
--- a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
+++ b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "An Embeddable SQL Database Engine"
+SUMMARY = "An Embeddable SQL Database Engine"
 HOMEPAGE = "http://www.sqlite.org/"
 SECTION = "libs"
 DEPENDS = "readline ncurses"
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
index c31eae1..bb649a2 100644
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Debian's start-stop-daemon utility extracted from the dpkg \
+SUMMARY = "Debian's start-stop-daemon utility extracted from the dpkg \
 package"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;md5=a963623e4588f70122865aaa7a370ce4"
diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
index 02a24b7..c73582e 100644
--- a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
+++ b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Synergy - control multiple computers with one keyboard and mouse"
+SUMMARY = "Synergy - control multiple computers with one keyboard and mouse"
 HOMEPAGE = "http://synergy.googlecode.com"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9772a11e3569985855e2ce450e56f991"
 LICENSE = "GPL-2.0"
diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
index 83bb0c2..6b7e4f1 100644
--- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
+++ b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Hierarchical, reference counted memory pool system with destructors"
+SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
 HOMEPAGE = "http://talloc.samba.org"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://NEWS;md5=5fe776b23a711c9153ee94bc87e47334"
diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
index 5c5fab9..24f813b 100644
--- a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
+++ b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A very small and simple terminal emulator"
+SUMMARY = "A very small and simple terminal emulator"
 SECTION = "x11/applications"
 DEPENDS = "vte"
 
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
index fc0fbfb..e33f296 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Data files for usbmodeswitch"
+SUMMARY = "Data files for usbmodeswitch"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
index 3485523..92d1ac4 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A mode switching tool for controlling 'flip flop' (multiple device) USB gear"
+SUMMARY = "A mode switching tool for controlling 'flip flop' (multiple device) USB gear"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta-oe/recipes-support/usbpath/usbpath_svn.bb b/meta-oe/recipes-support/usbpath/usbpath_svn.bb
index 903a33d..001683e 100644
--- a/meta-oe/recipes-support/usbpath/usbpath_svn.bb
+++ b/meta-oe/recipes-support/usbpath/usbpath_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Convert the physical locations of a USB device to/from its number"
+SUMMARY = "Convert the physical locations of a USB device to/from its number"
 AUTHOR = "Werner Almesberger <werner@openmoko.org>"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
index 0d22d1d..447381a 100644
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A lightweight Terminal Emulator based on libvte, written in Vala."
+SUMMARY = "A lightweight Terminal Emulator based on libvte, written in Vala"
 SECTION = "x11/applications"
 DEPENDS = "vte"
 SRCREV = "0fefa38087581f85fa0631b40500b9428369c146"
diff --git a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb b/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
index 6c9037b..a114d2f 100644
--- a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
+++ b/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Atheros 6K Wifi configuration utility"
+SUMMARY = "Atheros 6K Wifi configuration utility"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://wmiconfig.c;endline=19;md5=4394a56bca1c5b2446c9f8e406c82911"
 SECTION = "console/network"
diff --git a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
index 4e8fe71..8f05062 100644
--- a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
+++ b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Full-featured IRC chat client with scripting support"
+SUMMARY = "Full-featured IRC chat client with scripting support"
 LICENSE = "GPLv2+"
 HOMEPAGE = "http://www.xchat.org"
 SECTION = "x11/network"
diff --git a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
index 447c791..9188c8a 100644
--- a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
+++ b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A shell-script tool for converting XML files to various formats" 
+SUMMARY = "A shell-script tool for converting XML files to various formats"
 HOMEPAGE = "https://fedorahosted.org/xmlto/" 
 SECTION = "docs/xmlto" 
 LICENSE = "GPLv2" 
diff --git a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
index 56130f2..73f4e6e 100644
--- a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Machine specific systemd units"
+SUMMARY = "Machine specific systemd units"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
index 94bcbc6..57005c5 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Lightweight secure web server"
+SUMMARY = "Lightweight secure web server"
 HOMEPAGE = "http://www.hiawatha-webserver.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
index 859c90e..26eec31 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A simple text editor for Xfce"
+SUMMARY = "A simple text editor for Xfce"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-apps/orage/orage_4.8.4.bb b/meta-xfce/recipes-apps/orage/orage_4.8.4.bb
index 69211cc..cf3081e 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.8.4.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.8.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Xfce Calender"
+SUMMARY = "Xfce Calender"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb
index 959dcad..8e485f9 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tiny image-viewer"
+SUMMARY = "Tiny image-viewer"
 HOMEPAGE = "http://goodies.xfce.org/projects/applications/ristretto"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index c383b82..ba538e6 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Lightweight, desktop independent GTK+ archive manager"
+SUMMARY = "Lightweight, desktop independent GTK+ archive manager"
 HOMEPAGE = "http://xarchiver.sourceforge.net"
 SECTION = "x11"
 
diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb
index 57bcf42..aa3202f 100644
--- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A volume control application based on GStreamer"
+SUMMARY = "A volume control application based on GStreamer"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
index 8f03ddd..08af66d 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Easily themable notification daemon with transparency effects"
+SUMMARY = "Easily themable notification daemon with transparency effects"
 HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-notifyd"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
index 9ec034a..4cda352 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Application to take screenshots"
+SUMMARY = "Application to take screenshots"
 HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-screenshooter"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
index 502c203..88e646b 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Easy to use task manager"
+SUMMARY = "Easy to use task manager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.2.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.2.bb
index 470bf60..8b2619d 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Terminal emulator for the Xfce desktop environment"
+SUMMARY = "Terminal emulator for the Xfce desktop environment"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0 gtk+ vte libxfce4ui"
diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
index 8d990f3..9547736 100644
--- a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
+++ b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "X11 Mouse Theme"
+SUMMARY = "X11 Mouse Theme"
 HOMEPAGE = "http://xfce-look.org/content/show.php/OpenZone?content=111343"
 SECTION = "x11/wm"
 LICENSE = "MIT"
diff --git a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb b/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
index 6777cec..ac104e2 100644
--- a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
+++ b/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "xfce4 icon theme rodent"
+SUMMARY = "xfce4 icon theme rodent"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
index 400e11e..fc1062f 100644
--- a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
+++ b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Additional (old) themes for Xfwm4"
+SUMMARY = "Additional (old) themes for Xfwm4"
 SECTION = "x11/wm"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index aae3ff0..8e8e691 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Xfce4 Vala provides bindings for the Xfce framework"
+SUMMARY = "Xfce4 Vala provides bindings for the Xfce framework"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 DEPENDS = "libxfce4util garcon xfconf libxfce4ui xfce4-panel exo vala xfce4-dev-tools-native"
diff --git a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
index d9e0ae6..00b0b91 100644
--- a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
+++ b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "All packages multimedia packages available for XFCE"
+SUMMARY = "All packages multimedia packages available for XFCE"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb
index a4a4c3e..ebef2ba 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Simple client plugin for Music Player Daemon"
+SUMMARY = "Simple client plugin for Music Player Daemon"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"
 SECTION = "x11/application"
 LICENSE = "BSD"
diff --git a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb
index 1f31be9..b1cabd6 100644
--- a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb
+++ b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Music Player Daemon (MPD) client written in GTK+"
+SUMMARY = "Music Player Daemon (MPD) client written in GTK+"
 HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfmpc"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb
index 97ffd52..36cb444 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A battery monitor panel plugin for Xfce4, compatible with APM and ACP"
+SUMMARY = "A battery monitor panel plugin for Xfce4, compatible with APM and ACP"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-battery-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb
index 80792cf..06f0d94 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Clipman is a clipboard manager for Xfce"
+SUMMARY = "Clipman is a clipboard manager for Xfce"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-clipman-plugin"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
index 15b4ced..e095899 100644
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Plugin displaying close button for application currently active"
+SUMMARY = "Plugin displaying close button for application currently active"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.0.bb
index 07b1a9a..7a99b4f 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Panel plugin to display frequency of all cpus"
+SUMMARY = "Panel plugin to display frequency of all cpus"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-cpufreq-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.5.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.5.bb
index e32cbfb..83e2bb5 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.5.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Panel plugin with graphical representation of the cpu frequency"
+SUMMARY = "Panel plugin with graphical representation of the cpu frequency"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-cpugraph-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.6.2.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.6.2.bb
index 544c768..a97ba6c 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.6.2.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.6.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Panel plugin displaying date and time and a calendar when left-clicked"
+SUMMARY = "Panel plugin displaying date and time and a calendar when left-clicked"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-datetime-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb
index 6946931..1aadd2c 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Panel plugin displaying instant disk/partition performance"
+SUMMARY = "Panel plugin displaying instant disk/partition performance"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-diskperf-plugin"
 LICENSE = "RogerSeguin"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb
index 4acc3d8..f1ed6c7 100644
--- a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Panel plugin with graphical representation of the cpu frequency"
+SUMMARY = "Panel plugin with graphical representation of the cpu frequency"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-eyes-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb
index b0e02c9..6dc2c17 100644
--- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Mount/umount utility for the xfce panel"
+SUMMARY = "Mount/umount utility for the xfce panel"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mount-plugin"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb
index faf623d..ef1039b 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Panel plugin displaying current load of the network interfaces"
+SUMMARY = "Panel plugin displaying current load of the network interfaces"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-netload-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb
index b97bc24..fee5a4d 100644
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Notes plugin for the Xfce Panel"
+SUMMARY = "Notes plugin for the Xfce Panel"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb
index 9763dee..1f6ea04 100644
--- a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "This plugin makes it possible to take periodical breaks."
+SUMMARY = "This plugin makes it possible to take periodical breaks"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-time-out-plugin"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
index b241cba..1883a0c 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Panel plugin displaying stats from a wireless lan interface"
+SUMMARY = "Panel plugin displaying stats from a wireless lan interface"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-wavelan-plugin"
 LICENSE = "BenediktMeurer FlorianRivoal"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
index 45c6d83..b57f91c 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Panel plugin to display current temperature and weather condition"
+SUMMARY = "Panel plugin to display current temperature and weather condition"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-weather-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
index d27e4cd..1109f31 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "XKB layout switching panel plug-in for the Xfce desktop environment"
+SUMMARY = "XKB layout switching panel plug-in for the Xfce desktop environment"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-xkb-plugin"
 SECTION = "x11/application"
 LICENSE = "Alexander_Iliev"
diff --git a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.2.1.bb b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.2.1.bb
index 3fb250c..90f150b 100644
--- a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.2.1.bb
+++ b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.2.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Adds ID3/OGG tag support to the Thunar bulk rename dialog"
+SUMMARY = "Adds ID3/OGG tag support to the Thunar bulk rename dialog"
 HOMEPAGE = "http://thunar.xfce.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb
index 3ccd2e6..d62208f 100644
--- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "XFCE theme for GTK"
+SUMMARY = "XFCE theme for GTK"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
index 1a2b58a..cc63a9f 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Xfce4 Widget library and X Window System interaction"
+SUMMARY = "Xfce4 Widget library and X Window System interaction"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb
index 150d20a..b4e15e8 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Basic utility library for Xfce4"
+SUMMARY = "Basic utility library for Xfce4"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index 4b789b2..7fcb388 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "All packages required for a base installation of XFCE"
+SUMMARY = "All packages required for a base installation of XFCE"
 SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index bf0135a..aef2f70 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "All packages for full XFCE installation"
+SUMMARY = "All packages for full XFCE installation"
 SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb
index 28f9597..909ae85 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Automatic management of removable drives and media for thunar"
+SUMMARY = "Automatic management of removable drives and media for thunar"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
index 1a92a9c..aa67fdf 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "File manager for the Xfce Desktop Environment"
+SUMMARY = "File manager for the Xfce Desktop Environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb
index 8779b01..68e848a 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Xfce4 development tools"
+SUMMARY = "Xfce4 development tools"
 HOMEPAGE = "http://www.xfce.org"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.1.bb
index b0ed49b..08703e7 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Xfce4 Panel"
+SUMMARY = "Xfce4 Panel"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
index efd5aea..6e92186 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Power manager for the Xfce desktop environment"
+SUMMARY = "Power manager for the Xfce desktop environment"
 HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-power-manager"
 SECTION = "x11"
 
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
index f7f4ba0..f7aec5e 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
+SUMMARY = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index f7d5de3..f7fc244 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Xfce4 settings"
+SUMMARY = "Xfce4 settings"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
index 945819e..aa6ad2c 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Xfce configuration daemon and utilities"
+SUMMARY = "Xfce configuration daemon and utilities"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb
index 11aab8a..93b0854 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Xfce4 Desktop Manager"
+SUMMARY = "Xfce4 Desktop Manager"
 SECTION = "x11/base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-- 
1.8.5.4


