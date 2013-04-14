Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1URQ5u-00051u-E0 for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 18:48:03 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1URPp2-0004OG-R3 for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 18:30:32 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 18:30:32 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 18:30:32 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 14 Apr 2013 18:30:26 +0200
Message-ID: <kkelis$rj6$1@ger.gmane.org>
References: <20130413134648.GE2477@jama>
	<1365891129-8299-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
In-Reply-To: <1365891129-8299-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.5.1
Subject: Re: [meta-oe][PATCH] recipes: Unify indentation
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
X-List-Received-Date: Sun, 14 Apr 2013 16:48:06 -0000
X-List-Received-Date: Sun, 14 Apr 2013 16:48:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-04-13 00:12, Martin Jansa schreef:
> * This change is only aesthetic (unlike indentation in Python tasks). *
> Some recipes were using tabs. * Some were using 8 spaces. * Some were
> using mix or different number of spaces. * Make them consistently use 4
> spaces everywhere. * Yocto styleguide advises to use tabs (but the only
> reason to keep tabs is the need to update a lot of recipes). Lately this
> advice was also merged into the styleguide on the OE wiki. * Using 4
> spaces in both types of tasks is better because it's less error prone
> when someone is not sure if e.g. do_generate_toolchain_file() is Python
> or shell task and also allows to highlight every tab used in .bb, .inc,
> .bbappend, .bbclass as potentially bad (shouldn't be used for indenting
> of multiline variable assignments and cannot be used for Python tasks).
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I still hate spaces for shell methods, but I support the reasons behind it, so:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> --- meta-efl/recipes-devtools/python/python-efl.inc    |   2 +- 
> meta-efl/recipes-efl/e17/e-tasks_git.bb            |  20 +- 
> meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb |  10 +- 
> meta-efl/recipes-efl/e17/e-wm.inc                  | 160
> ++++++++-------- meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb          |   6
> +- meta-efl/recipes-efl/e17/e-wm_svn.bb               |   6 +- 
> meta-efl/recipes-efl/e17/elmdentica_svn.bb         |   2 +- 
> meta-efl/recipes-efl/e17/enjoy_svn.bb              |   8 +- 
> meta-efl/recipes-efl/e17/eve_svn.bb                |   6 +- 
> meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |   2 +- 
> meta-efl/recipes-efl/e17/exquisite_svn.bb          |  16 +- 
> meta-efl/recipes-efl/e17/terminology.inc           |   4 +- 
> meta-efl/recipes-efl/e17/terminology_0.3.0.bb      |   2 +- 
> meta-efl/recipes-efl/efl/azy_svn.bb                |  10 +- 
> meta-efl/recipes-efl/efl/ecore.inc                 |  56 +++--- 
> meta-efl/recipes-efl/efl/ecore_1.7.6.bb            |   4 +- 
> meta-efl/recipes-efl/efl/ecore_svn.bb              |   4 +- 
> meta-efl/recipes-efl/efl/edbus2_svn.bb             |   2 +- 
> meta-efl/recipes-efl/efl/edbus_1.7.6.bb            |   2 +- 
> meta-efl/recipes-efl/efl/edbus_svn.bb              |   2 +- 
> meta-efl/recipes-efl/efl/edje.inc                  |  14 +- 
> meta-efl/recipes-efl/efl/edje_1.7.6.bb             |   2 +- 
> meta-efl/recipes-efl/efl/edje_svn.bb               |   2 +- 
> meta-efl/recipes-efl/efl/eet.inc                   |  14 +- 
> meta-efl/recipes-efl/efl/eet_1.7.6.bb              |   2 +- 
> meta-efl/recipes-efl/efl/eet_svn.bb                |   2 +- 
> meta-efl/recipes-efl/efl/eeze_1.7.6.bb             |   2 +- 
> meta-efl/recipes-efl/efl/eeze_svn.bb               |   2 +- 
> meta-efl/recipes-efl/efl/efreet_1.7.6.bb           |   2 +- 
> meta-efl/recipes-efl/efl/efreet_svn.bb             |   2 +- 
> meta-efl/recipes-efl/efl/eina_1.7.6.bb             |   2 +- 
> meta-efl/recipes-efl/efl/eina_svn.bb               |   2 +- 
> meta-efl/recipes-efl/efl/eio_1.7.6.bb              |   2 +- 
> meta-efl/recipes-efl/efl/eio_svn.bb                |   2 +- 
> meta-efl/recipes-efl/efl/elementary.inc            |  54 +++--- 
> meta-efl/recipes-efl/efl/elementary_1.7.6.bb       |   2 +- 
> meta-efl/recipes-efl/efl/elementary_svn.bb         |   2 +- 
> meta-efl/recipes-efl/efl/embryo_1.7.6.bb           |   2 +- 
> meta-efl/recipes-efl/efl/embryo_svn.bb             |   2 +- 
> meta-efl/recipes-efl/efl/emotion_1.7.6.bb          |   2 +- 
> meta-efl/recipes-efl/efl/emotion_svn.bb            |   2 +- 
> meta-efl/recipes-efl/efl/entrance_svn.bb           |   8 +- 
> meta-efl/recipes-efl/efl/ethumb.inc                |   6 +- 
> meta-efl/recipes-efl/efl/ethumb_1.7.6.bb           |   2 +- 
> meta-efl/recipes-efl/efl/ethumb_svn.bb             |   2 +- 
> meta-efl/recipes-efl/efl/evas-generic-loaders.inc  |  10 +- 
> .../recipes-efl/efl/evas-generic-loaders_1.7.6.bb  |   2 +- 
> .../recipes-efl/efl/evas-generic-loaders_svn.bb    |   2 +- 
> meta-efl/recipes-efl/efl/evas.inc                  |  22 +-- 
> meta-efl/recipes-efl/efl/evas_1.7.6.1.bb           |   2 +- 
> meta-efl/recipes-efl/efl/evas_svn.bb               |   2 +- 
> meta-efl/recipes-efl/efl/expedite.inc              |  26 +-- 
> meta-efl/recipes-efl/efl/expedite_1.7.6.bb         |   2 +- 
> meta-efl/recipes-efl/efl/expedite_svn.bb           |   2 +- 
> meta-efl/recipes-efl/efl/libeweather_svn.bb        |  20 +- 
> .../packagegroups/packagegroup-x11-illume.bb       |  12 +- 
> meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |  12 +- 
> meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb    |   2 +- 
> .../network-manager-applet_0.9.2.0.bb              |  18 +- 
> meta-gnome/recipes-gnome/abiword/abiword.inc       |  34 ++-- 
> meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |   6 +- 
> meta-gnome/recipes-gnome/bonobo/libbonobo.inc      |  16 +- 
> .../recipes-gnome/devilspie/devilspie2_0.24.bb     |  20 +- 
> .../recipes-gnome/eds/evolution-data-server_git.bb |   4 +- 
> .../recipes-gnome/epiphany/epiphany_2.30.6.bb      |   4 +- 
> meta-gnome/recipes-gnome/evince/evince_2.32.0.bb   |   4 +- 
> .../recipes-gnome/gcalctool/gcalctool_5.32.0.bb    |   2 +- 
> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |  40 ++-- 
> meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     |   4 +- 
> .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb      |   4 +- 
> .../gnome-control-center_2.32.1.bb                 |   2 +- 
> .../gnome-desktop/gnome-desktop_2.32.1.bb          |   4 +- 
> .../gnome-disk-utility_2.32.0.bb                   |  10 +- 
> .../gnome-panel/gnome-panel3_3.0.2.bb              |   8 +- 
> .../gnome-panel/gnome-panel_2.32.1.bb              |  12 +- 
> .../gnome-power-manager_2.32.0.bb                  |  28 +-- 
> .../gnome-session/gnome-session_2.32.1.bb          |   8 +- 
> .../gnome-settings-daemon_2.32.1.bb                |   2 +- 
> .../gnome-system-monitor_2.28.2.bb                 |   4 +- 
> .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |   4 +- 
> .../recipes-gnome/gnome/libgnomecups_0.2.3.bb      |   8 +- 
> .../recipes-gnome/gnome/libgnomekbd_2.26.0.bb      |   4 +- 
> .../recipes-gnome/gnome/libgnomeprint_2.18.7.bb    |   8 +- 
> meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb   |   2 +- 
> .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |  28 +-- 
> .../recipes-gnome/gweather/libgweather3_3.0.2.bb   |   2 +- 
> .../recipes-gnome/gweather/libgweather_2.30.3.bb   |   2 +- 
> .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |   2 +- 
> .../recipes-gnome/libgnome/libgnome_2.32.1.bb      |   4 +- 
> .../recipes-gnome/libgnome/libgnomekbd_2.32.0.bb   |   4 +- 
> meta-gnome/recipes-gnome/libgnome/libgnomeui.inc   |   2 +- 
> meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb  |   8 +- 
> .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |   6 +- 
> .../recipes-gnome/libnotify/libnotify_0.6.0.bb     |   4 +- 
> .../recipes-gnome/libxklavier/libxklavier_5.0.bb   |  10 +- 
> .../recipes-gnome/metacity/metacity_2.34.13.bb     |   4 +- 
> .../recipes-gnome/nautilus/nautilus3_3.2.1.bb      |   6 +- 
> .../recipes-gnome/nautilus/nautilus_2.32.2.bb      |   8 +- 
> .../nonworking/gnome/gnome-terminal_2.26.3.bb      |   2 +- 
> .../system-tools/system-tools-backends_2.10.2.bb   |  20 +- 
> meta-gnome/recipes-gnome/pimlico/contacts.inc      |  10 +- 
> meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb   |   4 +- 
> meta-gnome/recipes-gnome/pimlico/contacts_git.bb   |   2 +- 
> meta-gnome/recipes-gnome/pimlico/dates_git.bb      |   8 +- 
> .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |   2 +- 
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb   |   2 +- 
> .../recipes-support/goffice/goffice_0.8.17.bb      |  32 ++-- 
> meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb |   2 +- 
> .../libgpewidget/libgpewidget_0.117.bb             |   2 +- 
> .../recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb     |   6 +- 
> meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc |  14 +- 
> .../recipes-devtools/klibc/klcc-cross_2.0.2.bb     |   8 +- 
> .../klibc/klibc-static-utils_2.0.2.bb              |   2 +- 
> .../recipes-devtools/klibc/klibc-utils.inc         |  93 +++++---- 
> .../recipes-devtools/klibc/klibc-utils_2.0.2.bb    |   2 +- 
> meta-initramfs/recipes-devtools/klibc/klibc.inc    |   3 +- 
> .../recipes-devtools/klibc/klibc_2.0.2.bb          |  20 +- 
> .../linux/linux-yocto-tiny-kexecboot_3.2.bb        |   4 +- 
> .../linux/linux-yocto-tiny-kexecboot_3.4.bb        |   4 +- 
> .../recipes-connectivity/gupnp/gupnp.inc           |   4 +- 
> .../recipes-connectivity/gupnp/no-vala.inc         |   6 +- 
> .../recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb         |  54 +++--- 
> .../recipes-dvb/tvheadend/tvheadend_git.bb         |  14 +- 
> .../recipes-mediacentre/xbmc/xbmc_git.bb           |  32 ++-- 
> .../recipes-mkv/libebml/libebml_1.2.2.bb           |  30 +-- 
> .../recipes-mkv/libmatroska/libmatroska_1.3.0.bb   |  30 +-- 
> .../recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb     |   6 +- 
> .../dleyna/media-service-upnp_0.4.0.bb             |   4 +- 
> .../dleyna/renderer-service-upnp_0.3.0.bb          |   4 +- 
> .../recipes-multimedia/mpg123/mpg123_1.15.3.bb     |  12 +- 
> .../recipes-connectivity/crda/crda_1.1.3.bb        |   8 +- 
> .../inetutils/inetutils_1.9.1.bb                   |  50 ++--- 
> .../recipes-connectivity/vpnc/vpnc_0.5.3.bb        |   8 +- 
> .../recipes-daemons/autofs/autofs_5.0.7.bb         |   8 +- 
> .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |  30 +-- 
> meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb |   6 +- 
> .../recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb  |   2 +- 
> meta-networking/recipes-daemons/radvd/radvd.inc    |  32 ++-- 
> .../recipes-daemons/radvd/radvd_1.9.1.bb           |   2 +- 
> .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |  26 +-- 
> .../recipes-daemons/vblade/vblade_20.bb            |   8 +- 
> .../conntrack-tools/conntrack-tools_1.4.0.bb       |  28 +-- 
> .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |  30 +-- 
> .../recipes-filter/libmnl/libmnl_1.0.3.bb          |   2 +- 
> meta-networking/recipes-irc/znc/znc_git.bb         |   2 +- 
> .../pptp-linux/pptp-linux_1.7.2.bb                 |  16 +- 
> .../recipes-protocols/quagga/quagga.inc            |  16 +- 
> .../recipes-protocols/xl2tpd/xl2tpd.inc            |  26 +-- 
> .../recipes-protocols/zeroconf/zeroconf_0.9.bb     |  12 +- 
> .../recipes-support/aoetools/aoetools_34.bb        |   2 +- 
> .../recipes-support/arptables/arptables_0.0.3-4.bb |  12 +- 
> .../recipes-support/cifs/cifs-utils_git.bb         |   6 +- 
> .../recipes-support/macchanger/macchanger_1.5.0.bb |  10 +- 
> .../recipes-support/ndisc6/ndisc6_1.0.2.bb         |  34 ++-- 
> .../recipes-support/netcat/netcat-openbsd_1.89.bb  |  12 +- 
> .../recipes-support/netcat/netcat_0.7.1.bb         |   4 +- 
> .../recipes-support/netperf/netperf_2.6.0.bb       |  44 ++--- 
> meta-networking/recipes-support/nis/nis.inc        |   2 +- 
> .../recipes-support/nis/yp-tools_2.12.bb           |   4 +- 
> meta-networking/recipes-support/ntp/ntp.inc        |  62 +++--- 
> meta-networking/recipes-support/tunctl/tunctl.inc  |   6 +- 
> meta-oe/classes/gpe.bbclass                        |   4 +- 
> meta-oe/classes/vala.bbclass                       |   6 +- 
> meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb |   8 +- 
> .../cpuburn/cpuburn-neon_20120610.bb               |  10 +- 
> meta-oe/recipes-benchmark/dbench/dbench_4.0.bb     |   6 +- 
> meta-oe/recipes-benchmark/fio/fio_2.0.5.bb         |   6 +- 
> meta-oe/recipes-benchmark/iozone3/iozone3_263.bb   |  40 ++-- 
> meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb     |  18 +- 
> .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |  40 ++-- 
> .../recipes-benchmark/memtester/memtester_4.1.3.bb |  14 +- 
> .../nbench-byte/nbench-byte_2.2.3.bb               |   8 +- 
> .../bridge-utils/bridge-utils.inc                  |  12 +- 
> .../cherokee/cherokee_1.2.98.bb                    |  12 +- 
> .../dnsmasq/dnsmasq-dbus_2.55.bb                   |   4 +- 
> meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc   |  18 +- 
> meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb |  44 ++--- 
> .../recipes-connectivity/gateone/gateone_git.bb    |  14 +- 
> .../recipes-connectivity/gnuradio/gnuradio_git.bb  |  20 +- 
> .../hostapd/hostap-daemon_1.0.bb                   |  22 +-- 
> meta-oe/recipes-connectivity/iw/iw_3.6.bb          |   2 +- 
> .../libmicrohttpd/libmicrohttpd_0.4.6.bb           |   2 +- 
> .../recipes-connectivity/libnet/libnet_1.1.5.bb    |   2 +- 
> .../networkmanager/networkmanager_0.9.2.0.bb       |  52 ++--- 
> meta-oe/recipes-connectivity/obex/openobex_1.5.bb  |   4 +- 
> meta-oe/recipes-connectivity/openvpn/openvpn.inc   |   8 +- 
> .../recipes-connectivity/openvpn/openvpn_2.1.3.bb  |   6 +- 
> meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb  |   4 +- 
> .../recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb  |  12 +- 
> meta-oe/recipes-connectivity/samba/samba.inc       |  74 ++++---- 
> meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |  30 +-- 
> .../uhd/uhd-firmware_003.005.002.bb                |  10 +- 
> .../recipes-connectivity/vsftpd/vsftpd_2.3.5.bb    |  24 +-- 
> .../recipes-core/busybox/busybox_1.20.2.bbappend   |   4 +- 
> meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb |   6 +- 
> .../recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb    |   6 +- 
> meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb   |   8 +- 
> meta-oe/recipes-core/glib-2.0/glibmm.inc           |   8 +- 
> meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb     |   2 +- 
> meta-oe/recipes-core/llvm/llvm-common.bb           |   8 +- 
> meta-oe/recipes-core/llvm/llvm.inc                 | 132 ++++++------- 
> meta-oe/recipes-core/llvm/llvm2.9_2.9.bb           |  28 +-- 
> meta-oe/recipes-core/meta/distro-feed-configs.bb   |   4 +- 
> .../packagegroups/packagegroup-basic.bb            |  30 +-- 
> .../packagegroups/packagegroup-cli-tools.bb        |  52 ++--- 
> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb      |  54 +++--- 
> .../concurrencykit/concurrencykit_git.bb           |  16 +- 
> meta-oe/recipes-devtools/glade/glade3_3.8.2.bb     |   2 +- 
> meta-oe/recipes-devtools/lemon/lemon.inc           |  14 +- 
> .../libc-client/libc-client_2007e.bb               |  12 +- 
> meta-oe/recipes-devtools/libgee/libgee.inc         |   8 +- 
> meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb  |  50 ++--- 
> meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb    |  96 +++++----- 
> meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb       |  36 ++-- 
> meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb    |  26 +-- 
> .../mercurial/mercurial-native_1.9.bb              |   6 +- 
> meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb  |  30 +-- 
> meta-oe/recipes-devtools/nodejs/nodejs_0.10.4.bb   |  10 +- 
> meta-oe/recipes-devtools/orc/orc.inc               |   2 +- 
> .../packagekit/packagekit_0.5.6.bb                 |  12 +- 
> meta-oe/recipes-devtools/php/php.inc               |   6 +- 
> .../recipes-devtools/php/php/phar-makefile.patch   |   8 +- 
> .../python/python-dateutil_1.4.1.bb                |   4 +- 
> .../python/python-matplotlib_1.1.0.bb              |   8 +- 
> .../recipes-devtools/python/python-numpy_1.7.0.bb  |  20 +- 
> .../recipes-devtools/python/python-pexpect_2.3.bb  |  10 +- 
> .../recipes-devtools/python/python-pyqt_4.9.6.bb   |  38 ++-- 
> .../recipes-devtools/python/python-pyserial_2.4.bb |   6 +- 
> .../python/python-pyudev_0.16.1.bb                 |   6 +- 
> .../python/python-pyusb_1.0.0a2.bb                 |   2 +- 
> .../recipes-devtools/python/python-pyyaml_3.10.bb  |   4 +- 
> .../python/python-simplejson_2.2.1.bb              |  10 +- 
> .../recipes-devtools/python/python-sip_4.14.2.bb   |  16 +- 
> .../recipes-devtools/python/python-smbus_3.0.3.bb  |   6 +- 
> .../python/python-twisted_10.2.0.bb                |  80 ++++---- 
> meta-oe/recipes-devtools/swig/swig.inc             |  56 +++--- 
> meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb         |  30 +-- 
> meta-oe/recipes-extended/atftp/atftp_git.bb        |   6 +- 
> meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb |   4 +- 
> .../recipes-extended/dmidecode/dmidecode_2.10.bb   |   4 +- 
> meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb  |  10 +- 
> meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |   2 +- 
> meta-oe/recipes-extended/iotop/iotop_0.4.4.bb      |   8 +- 
> meta-oe/recipes-extended/lcdproc/lcdproc5.inc      |  50 ++--- 
> meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb  |   8 +- 
> .../liblockfile/liblockfile_1.09.bb                |  10 +- 
> meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb  |   2 +- 
> .../mml-widget/gtkmathview_0.8.0.bb                |   4 +- 
> meta-oe/recipes-extended/net-snmp/net-snmp.inc     |  56 +++--- 
> .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |  12 +- 
> meta-oe/recipes-extended/owfs/owfs_2.8p20.bb       |   8 +- 
> meta-oe/recipes-extended/polkit/polkit_0.104.bb    |   2 +- 
> meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb  |  22 +-- 
> meta-oe/recipes-extended/rsyslog/rsyslog.inc       |   4 +- 
> meta-oe/recipes-extended/sip/sip-native_4.14.2.bb  |  16 +- 
> .../socketcan/libsocketcan_0.0.8.bb                |   4 +- 
> .../recipes-extended/subsurface/subsurface_git.bb  |   4 +- 
> meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb      |   4 +- 
> meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb      |  42 ++--- 
> meta-oe/recipes-extended/tmux/tmux_1.6.bb          |   2 +- 
> .../uml-utilities/uml-utilities_20040406.bb        |   4 +- 
> meta-oe/recipes-extended/zram/zram_0.1.bb          |  10 +- 
> meta-oe/recipes-gnome/gtk+/gtkmm.inc               |   6 +- 
> meta-oe/recipes-graphics/clutter/clutter-box2d.inc |   4 +- 
> meta-oe/recipes-graphics/fbida/fbida_2.09.bb       |   6 +- 
> meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb        |   4 +- 
> .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |   8 +- 
> meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |  36 ++-- 
> .../recipes-graphics/nonworking/slim/slim_1.3.2.bb |  70 +++---- 
> .../packagegroups/packagegroup-fonts-truetype.bb   |  32 ++-- 
> meta-oe/recipes-graphics/tslib/tslib_git.bb        |   6 +- 
> .../recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb  |   4 +- 
> .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |   2 +- 
> .../ttf-fonts/ttf-inconsolata_20100526.bb          |  10 +- 
> .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |   4 +- 
> .../ttf-fonts/ttf-sazanami_20040629.bb             |  12 +- 
> .../ttf-fonts/ttf-wqy-zenhei_0.6.26.bb             |   6 +- 
> .../xdotool/xdotool_1.20100416.2809.bb             |   2 +- 
> .../xinput-calibrator/pointercal-xinput_0.0.bb     |  10 +- 
> .../xinput-calibrator/xinput-calibrator_git.bb     |  14 +- 
> meta-oe/recipes-graphics/xorg-app/xterm_277.bb     |   6 +- 
> .../xorg-driver/xf86-input-mtev_git.bb             |   4 +- 
> .../xorg-driver/xf86-input-tslib_0.0.6.bb          |  10 +- 
> meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb |   6 +- 
> .../xserver-common/xserver-common_1.34.bb          |  26 +-- 
> .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |  12 +- 
> .../compat-wireless/compat-wireless.inc            |   8 +- 
> meta-oe/recipes-kernel/linux/linux.inc             | 182
> +++++++++--------- meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb |
> 8 +- meta-oe/recipes-multimedia/esound/esound_0.2.36.bb |   2 +- 
> meta-oe/recipes-multimedia/libass/libass.inc       |   8 +- 
> meta-oe/recipes-multimedia/libav/libav.inc         |  66 +++---- 
> meta-oe/recipes-multimedia/libav/libav_0.8.4.bb    |   4 +- 
> .../libmodplug/libmodplug_0.8.7.bb                 |   6 +- 
> .../libpostproc/libpostproc_git.bb                 |  30 +-- 
> .../libsdl-image/libsdl-image_1.2.12.bb            |  16 +- 
> .../libsdl-mixer/libsdl-mixer_1.2.12.bb            |  30 +-- 
> meta-oe/recipes-multimedia/live555/live555.inc     |  48 ++--- 
> .../recipes-multimedia/mikmod/libmikmod_3.1.12.bb  |  28 +-- 
> .../recipes-multimedia/mplayer/mplayer-common.bb   |   4 +- 
> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 210
> ++++++++++----------- .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
> |   8 +- meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb   |   4 +- 
> meta-oe/recipes-multimedia/vlc/vlc.inc             | 100 +++++----- 
> meta-oe/recipes-multimedia/webm/libvpx.inc         |  14 +- 
> meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb    |   4 +- 
> meta-oe/recipes-multimedia/x264/x264_git.bb        |   4 +- 
> meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb    |   6 +- 
> .../foxtrotgps/foxtrotgps_1.1.1.bb                 |   4 +- 
> meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb        |  30 +-- 
> meta-oe/recipes-navigation/navit/navit.inc         |  52 ++--- 
> meta-oe/recipes-navigation/omgps/omgps_svn.bb      |   4 +- 
> meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |   4 +- 
> meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb  |  28 +-- 
> .../libconnman-qt/libconnman-qt_0.4.0.bb           |  34 ++-- 
> .../qcanobserver/qcanobserver-socketcan_svn.bb     |   6 +- 
> .../recipes-qt/qcanobserver/qcanobserver_svn.bb    |  18 +- 
> .../qextserialport/qextserialport_1.2rc.bb         |  32 ++-- 
> .../recipes-sato/claws-mail/claws-mail_3.9.0.bb    |  32 ++-- 
> meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb  |   2 +- 
> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb |  26 +-- 
> .../ca-certificates-cross_20130119.bb              |   6 +- 
> .../ca-certificates/ca-certificates_20130119.bb    |  26 +-- 
> meta-oe/recipes-support/ckermit/ckermit_301.bb     |  50 ++--- 
> .../cpufrequtils/cpufrequtils_008.bb               |   4 +- 
> meta-oe/recipes-support/cramfs/cramfs_1.1.bb       |   8 +- 
> .../debianutils/debianutils_2.30.bb                |   6 +- 
> .../devicekit/devicekit-power_014.bb               |   6 +- 
> meta-oe/recipes-support/devmem2/devmem2.bb         |   6 +- 
> .../dfu-util/dfu-util-native_0.4.bb                |   8 +- 
> .../dfu-util/dfu-util-native_svn.bb                |   8 +- 
> meta-oe/recipes-support/emacs/emacs.inc            | 188
> +++++++++--------- meta-oe/recipes-support/enca/enca_1.9.bb           |
> 16 +- meta-oe/recipes-support/espeak/espeak-data_1.37.bb |  18 +- 
> meta-oe/recipes-support/espeak/espeak_1.37.bb      |  40 ++-- 
> .../recipes-support/farsight/farsight2_0.0.22.bb   |   6 +- 
> meta-oe/recipes-support/farsight/libnice_0.0.13.bb |  10 +- 
> meta-oe/recipes-support/fbset/fbset_2.1.bb         |   8 +- 
> meta-oe/recipes-support/fbtest/fb-test_git.bb      |   8 +- 
> meta-oe/recipes-support/fftw/fftw.inc              |   2 +- 
> meta-oe/recipes-support/fftw/fftwf_3.3.3.bb        |   4 +- 
> meta-oe/recipes-support/flite/flite.inc            |   8 +- 
> meta-oe/recipes-support/fuse/fuse_2.9.2.bb         |   2 +- 
> meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb      |  10 +- 
> .../recipes-support/hddtemp/hddtemp_0.3-beta15.bb  |   8 +- 
> .../recipes-support/i2c-tools/i2c-tools_3.1.0.bb   |  12 +- 
> .../imagemagick/imagemagick_6.7.5.bb               |   2 +- 
> .../recipes-support/ipsec-tools/ipsec-tools.inc    |   2 +- 
> .../libatasmart/libatasmart_0.19.bb                |   2 +- 
> .../libcanberra/libcanberra_0.29.bb                |  18 +- 
> .../libsdl-ttf/libsdl-ttf_2.0.10.bb                |   6 +- 
> .../recipes-support/lm_sensors/lmsensors_3.3.3.bb  |   6 +- 
> meta-oe/recipes-support/lzma/lzma.inc              |  12 +- 
> .../recipes-support/mbuffer/mbuffer_20091227.bb    |   4 +- 
> .../mime-support/mime-support_3.48.bb              |  74 ++++---- 
> meta-oe/recipes-support/mini-iconv/mini-iconv.bb   |   2 +- 
> .../recipes-support/mysql/mysql5-native_5.1.40.bb  |  10 +- 
> meta-oe/recipes-support/mysql/mysql5_5.1.40.inc    | 210
> ++++++++++----------- meta-oe/recipes-support/nmon/nmon_13g.bb
> |   6 +- .../nonworking/fftw/benchfft_3.1.bb                |   2 +- 
> .../nonworking/syslog-ng/syslog-ng.inc             |  94 ++++----- 
> .../nonworking/syslog-ng/syslog-ng_3.2.5.bb        |   4 +- 
> .../recipes-support/opencv/opencv-samples_2.4.3.bb |  18 +- 
> meta-oe/recipes-support/opencv/opencv_2.4.3.bb     |   4 +- 
> .../recipes-support/openmotif/openmotif_2.3.3.bb   |   8 +- 
> meta-oe/recipes-support/p910nd/p910nd_0.95.bb      |   6 +- 
> .../recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb   |   8 +- 
> meta-oe/recipes-support/picocom/picocom_1.6.bb     |   4 +- 
> meta-oe/recipes-support/pidgin/pidgin.inc          |  28 +-- 
> meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb     |  20 +- 
> meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb |  10 +- 
> .../recipes-support/poppler/poppler-data_0.4.5.bb  |   2 +- 
> meta-oe/recipes-support/poppler/poppler.inc        |  10 +- 
> meta-oe/recipes-support/postgresql/postgresql.inc  |   2 +- 
> meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb    |   4 +- 
> meta-oe/recipes-support/rng-tools/rng-tools_2.bb   |  12 +- 
> .../samsung-soc-utils/s3c24xx-gpio_svn.bb          |   6 +- 
> .../samsung-soc-utils/s3c64xx-gpio_svn.bb          |   6 +- 
> .../samsung-soc-utils/sjf2410-linux-native_svn.bb  |  10 +- 
> meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb    |  42 ++--- 
> .../start-stop-daemon_1.16.0.2.bb                  |  20 +- 
> .../recipes-support/strongswan/strongswan_5.0.0.bb |   4 +- 
> meta-oe/recipes-support/synergy/synergy_1.3.8.bb   |   4 +- 
> meta-oe/recipes-support/talloc/talloc_2.0.1.bb     |  18 +- 
> meta-oe/recipes-support/tbb/tbb_4.1.bb             |   8 +- 
> meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb   |  34 ++-- 
> meta-oe/recipes-support/toscoterm/toscoterm_git.bb |  10 +- 
> meta-oe/recipes-support/upower/upower_0.9.14.bb    |   6 +- 
> .../usb-modeswitch/usb-modeswitch-data_20121109.bb |   2 +- 
> .../usb-modeswitch/usb-modeswitch_1.2.5.bb         |   4 +- 
> meta-oe/recipes-support/vim/vim.inc                |  52 ++--- 
> meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb |   4 +- 
> meta-oe/recipes-support/xchat/xchat_2.8.8.bb       |   8 +- 
> meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb |  42 ++--- 
> meta-ruby/recipes-devtools/ruby/ruby.inc           |  12 +- 
> meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb |  44 ++--- 
> .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |   4 +- 
> .../recipes-connectivity/dhcp/dhcp_4.2.5.bbappend  |   8 +- 
> .../openssh/openssh_6.1p1.bbappend                 |   8 +- 
> .../portmap/portmap_6.0.bbappend                   |   4 +- 
> .../recipes-core/busybox/busybox_1.20.2.bbappend   |  12 +- 
> .../dropbear/dropbear_2012.55.bbappend             |  10 +- 
> .../oe-core/recipes-extended/at/at_3.1.13.bbappend |   4 +- 
> .../recipes-extended/cronie/cronie_1.4.9.bbappend  |   4 +- 
> .../lighttpd/lighttpd_1.4.32.bbappend              |   4 +- 
> .../recipes-extended/pam/libpam_1.1.6.bbappend     |   2 +- 
> .../rpcbind/rpcbind_0.2.0.bbappend                 |   4 +- 
> .../recipes-httpd/apache2/apache2-native_2.4.3.bb  |  36 ++-- 
> .../recipes-httpd/apache2/apache2_2.4.3.bb         | 126 ++++++------- 
> meta-webserver/recipes-php/modphp/modphp5.inc      |  56 +++--- 
> .../recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb   |   8 +- 
> meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb  |  14 +- 
> .../recipes-webadmin/ajenti/ajenti_git.bb          |  30 +-- 
> .../xfce4-screenshooter_1.8.1.bb                   |   2 +- 
> .../recipes-art/cursor-themes/openzone_1.2.3.bb    |   8 +- 
> .../closebutton/xfce4-closebutton-plugin_git.bb    |   2 +- 
> .../weather/xfce4-weather-plugin_0.7.4.bb          |  12 +- 
> .../xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb      |   4 +- 
> .../recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb |   2 +- 
> .../xfce4-settings/xfce4-settings_4.11.0.bb        |   6 +- 
> .../multipath-tools/multipath-tools_git.bb         |   2 +- 
> toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc   | 138 +++++++------- 
> .../recipes-devtools/gcc/gcc-cross-canadian_4.6.bb |   6 +- 
> toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb |  68 +++---- 424
> files changed, 3507 insertions(+), 3513 deletions(-)
> 
> diff --git a/meta-efl/recipes-devtools/python/python-efl.inc
> b/meta-efl/recipes-devtools/python/python-efl.inc index 2bcc434..b622c40
> 100644 --- a/meta-efl/recipes-devtools/python/python-efl.inc +++
> b/meta-efl/recipes-devtools/python/python-efl.inc @@ -17,7 +17,7 @@
> inherit e-base autotools pkgconfig distutils-base SRCVER = "${PV}"
> 
> SRC_URI = "\ -  ${E_MIRROR}/BINDINGS/python/${SRCNAME}-${SRCVER}.tar.bz2
> \ +    ${E_MIRROR}/BINDINGS/python/${SRCNAME}-${SRCVER}.tar.bz2 \ " S =
> "${WORKDIR}/${SRCNAME}-${SRCVER}"
> 
> diff --git a/meta-efl/recipes-efl/e17/e-tasks_git.bb
> b/meta-efl/recipes-efl/e17/e-tasks_git.bb index dea6f03..29dec4f 100644 
> --- a/meta-efl/recipes-efl/e17/e-tasks_git.bb +++
> b/meta-efl/recipes-efl/e17/e-tasks_git.bb @@ -17,16 +17,16 @@ SRC_URI =
> "git://github.com/shr-project/e-tasks.git;protocol=git;branch=master \ S
> = "${WORKDIR}/git"
> 
> do_install_append() { -        install -d "${D}/${datadir}/pixmaps" -
> install -m 0644 "${S}/resources/e-tasks.png" "${D}/${datadir}/pixmaps" -
> install -d "${D}/${datadir}/applications" -        install -m 0644
> "${S}/resources/e-tasks.desktop" "${D}/${datadir}/applications" -
> install -d  "${D}/${datadir}/e-tasks" -        for ico in
> "${S}/resources/"*.png; do -                if [ "$(basename $ico)" !=
> "e-tasks.png" ]; then -                        install -m 0644 $ico
> "${D}/${datadir}/e-tasks" -                fi -        done +    install
> -d "${D}/${datadir}/pixmaps" +    install -m 0644
> "${S}/resources/e-tasks.png" "${D}/${datadir}/pixmaps" +    install -d
> "${D}/${datadir}/applications" +    install -m 0644
> "${S}/resources/e-tasks.desktop" "${D}/${datadir}/applications" +
> install -d  "${D}/${datadir}/e-tasks" +    for ico in
> "${S}/resources/"*.png; do +        if [ "$(basename $ico)" !=
> "e-tasks.png" ]; then +            install -m 0644 $ico
> "${D}/${datadir}/e-tasks" +        fi +    done }
> 
> FILES_${PN} += "/usr/share/e-tasks/* /usr/share/applications/*
> /usr/share/pixmaps/*" diff --git
> a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
> b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb index
> f826e10..af32a35 100644 ---
> a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb +++
> b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb @@ -18,14 +18,14 @@
> SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};protocol=http" S =
> "${WORKDIR}/${SRCNAME}/e"
> 
> do_compile() { -	# unfortunately hardcoded edje_cc in Makefile -	sed -i
> "s#\tedje_cc#\t${STAGING_BINDIR_NATIVE}/edje_cc#g" Makefile -	make +    #
> unfortunately hardcoded edje_cc in Makefile +    sed -i
> "s#\tedje_cc#\t${STAGING_BINDIR_NATIVE}/edje_cc#g" Makefile +    make }
> 
> do_install() { -        install -d
> ${D}${datadir}/enlightenment/data/themes/ -        install -m 0644
> ${S}/b_and_w.edj ${D}${datadir}/enlightenment/data/themes/ +    install
> -d ${D}${datadir}/enlightenment/data/themes/ +    install -m 0644
> ${S}/b_and_w.edj ${D}${datadir}/enlightenment/data/themes/ }
> 
> FILES_${PN} = "${datadir}/enlightenment/data/themes/" diff --git
> a/meta-efl/recipes-efl/e17/e-wm.inc b/meta-efl/recipes-efl/e17/e-wm.inc 
> index 61c21d4..78fbd95 100644 --- a/meta-efl/recipes-efl/e17/e-wm.inc +++
> b/meta-efl/recipes-efl/e17/e-wm.inc @@ -9,11 +9,11 @@ inherit e
> update-alternatives gettext S = "${WORKDIR}/${SRCNAME}"
> 
> EXTRA_OECONF = "\ -  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \ -
> --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \ -
> --x-includes=${STAGING_INCDIR}/X11 \ -  --x-libraries=${STAGING_LIBDIR}
> \ -  --enable-simple-x11 \ +
> --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \ +
> --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \ +
> --x-includes=${STAGING_INCDIR}/X11 \ +    --x-libraries=${STAGING_LIBDIR}
> \ +    --enable-simple-x11 \ "
> 
> do_configure_prepend() { @@ -52,16 +52,16 @@ do_install_append() { }
> 
> RDEPENDS_${PN} += "\ -  shared-mime-info \ -  mime-support \ -  setxkbmap
> \ -  edje-utils \ -  ${PN}-utils \ -  dbus-x11 \ -  evas-loader-png \ -
> evas-loader-jpeg \ -  evas-loader-gif \ -  evas-generic-loader-svg \ +
> shared-mime-info \ +    mime-support \ +    setxkbmap \ +    edje-utils
> \ +    ${PN}-utils \ +    dbus-x11 \ +    evas-loader-png \ +
> evas-loader-jpeg \ +    evas-loader-gif \ +    evas-generic-loader-svg \ 
> "
> 
> # Uclibc build don't have 'glibc-utils' @@ -75,57 +75,57 @@
> RCONFLICTS_${PN}-config-mobile = "${PN}-config-illume2" 
> RPROVIDES_${PN}-config-mobile = "${PN}-config-illume2"
> 
> PACKAGES =+ "\ -  ${PN}-config-default \ -  ${PN}-config-mobile \ -
> ${PN}-config-minimalist \ -  ${PN}-config-netbook \ -
> ${PN}-config-scaleable \ -  ${PN}-config-standard \ -
> ${PN}-theme-default \ -  ${PN}-background-dark-gradient \ -
> ${PN}-background-light-gradient \ -  ${PN}-backgrounds \ -  ${PN}-images
> \ -  ${PN}-icons \ -  ${PN}-other \ -  ${PN}-input-methods \ -
> ${PN}-sysactions \ -  ${PN}-utils \ -  ${PN}-menu \ -  efm-desktop-icon
> \ -  illume-keyboard-default-alpha \ -  illume-keyboard-default-numeric
> \ -  illume-keyboard-default-terminal \ +    ${PN}-config-default \ +
> ${PN}-config-mobile \ +    ${PN}-config-minimalist \ +
> ${PN}-config-netbook \ +    ${PN}-config-scaleable \ +
> ${PN}-config-standard \ +    ${PN}-theme-default \ +
> ${PN}-background-dark-gradient \ +    ${PN}-background-light-gradient \ +
> ${PN}-backgrounds \ +    ${PN}-images \ +    ${PN}-icons \ +
> ${PN}-other \ +    ${PN}-input-methods \ +    ${PN}-sysactions \ +
> ${PN}-utils \ +    ${PN}-menu \ +    efm-desktop-icon \ +
> illume-keyboard-default-alpha \ +    illume-keyboard-default-numeric \ +
> illume-keyboard-default-terminal \ "
> 
> ESYSACTIONS ?= "${PN}-sysactions"
> 
> RRECOMMENDS_${PN} = "\ -  ${PN}-config-default \ -  ${PN}-images \ -
> ${PN}-icons \ -  ${PN}-other \ -  ${PN}-input-methods \ -  ${ESYSACTIONS}
> \ +    ${PN}-config-default \ +    ${PN}-images \ +    ${PN}-icons \ +
> ${PN}-other \ +    ${PN}-input-methods \ +    ${ESYSACTIONS} \ "
> 
> FILES_${PN} = "\ -  ${bindir}/* \ -  ${libdir}/enlightenment/utils/* \ -
> ${libdir}/enlightenment/modules/*/*.* \ -
> ${libdir}/enlightenment/modules/*/*/* \ -
> ${libdir}/enlightenment/modules/*/*/.order \ -
> ${libdir}/enlightenment/modules/keyboards/ignore_built_in_keyboards \ -
> ${libdir}/enlightenment/*plugins/*/*/* \ -
> ${libdir}/enlightenment/preload/e_precache.so \ -
> ${datadir}/enlightenment/data/icons \ -
> ${datadir}/enlightenment/data/favorites \ -
> ${datadir}/enlightenment/data/input_methods \ -
> ${datadir}/enlightenment/data/config/profile.cfg \ -
> ${datadir}/enlightenment/AUTHORS \ -  ${datadir}/enlightenment/COPYING \ 
> -  ${datadir}/xsessions/enlightenment.desktop \ -  ${sysconfdir}/xdg \ +
> ${bindir}/* \ +    ${libdir}/enlightenment/utils/* \ +
> ${libdir}/enlightenment/modules/*/*.* \ +
> ${libdir}/enlightenment/modules/*/*/* \ +
> ${libdir}/enlightenment/modules/*/*/.order \ +
> ${libdir}/enlightenment/modules/keyboards/ignore_built_in_keyboards \ +
> ${libdir}/enlightenment/*plugins/*/*/* \ +
> ${libdir}/enlightenment/preload/e_precache.so \ +
> ${datadir}/enlightenment/data/icons \ +
> ${datadir}/enlightenment/data/favorites \ +
> ${datadir}/enlightenment/data/input_methods \ +
> ${datadir}/enlightenment/data/config/profile.cfg \ +
> ${datadir}/enlightenment/AUTHORS \ +    ${datadir}/enlightenment/COPYING
> \ +    ${datadir}/xsessions/enlightenment.desktop \ +
> ${sysconfdir}/xdg \ "
> 
> FILES_${PN}-config-default =
> "${datadir}/enlightenment/data/config/default" @@ -148,53 +148,53 @@
> FILES_${PN}-utils = "${libdir}/enlightenment/utils/*" FILES_${PN}-menu =
> "${sysconfdir}/xdg/menus/applications.menu"
> 
> FILES_efm-desktop-icon = "\ -  ${datadir}/applications/efm.desktop \ -
> ${datadir}/applications/enlightenment_filemanager.desktop \ -
> ${datadir}/icons/e-module-fileman.png \ +
> ${datadir}/applications/efm.desktop \ +
> ${datadir}/applications/enlightenment_filemanager.desktop \ +
> ${datadir}/icons/e-module-fileman.png \ "
> 
> KEYBOARDS_DIR="${libdir}/enlightenment/modules/illume-keyboard/keyboards"
>
> 
FILES_illume-keyboard-default-alpha = "\
> -  ${KEYBOARDS_DIR}/Default.kbd \ -  ${KEYBOARDS_DIR}/alpha.png \ +
> ${KEYBOARDS_DIR}/Default.kbd \ +    ${KEYBOARDS_DIR}/alpha.png \ " 
> FILES_illume-keyboard-default-numeric = "\ -
> ${KEYBOARDS_DIR}/Numbers.kbd \ -  ${KEYBOARDS_DIR}/numeric.png \ +
> ${KEYBOARDS_DIR}/Numbers.kbd \ +    ${KEYBOARDS_DIR}/numeric.png \ " 
> FILES_illume-keyboard-default-terminal = "\ -
> ${KEYBOARDS_DIR}/Terminal.kbd \ -  ${KEYBOARDS_DIR}/qwerty.png \ +
> ${KEYBOARDS_DIR}/Terminal.kbd \ +    ${KEYBOARDS_DIR}/qwerty.png \ "
> 
> RRECOMMENDS_${PN}-config-default = "${PN}-theme-default" 
> RRECOMMENDS_${PN}-config-mobile = "\ -  illume-keyboard-default-alpha \ -
> illume-keyboard-default-numeric \ -  illume-keyboard-default-terminal \ +
> illume-keyboard-default-alpha \ +    illume-keyboard-default-numeric \ +
> illume-keyboard-default-terminal \ "
> 
> RRECOMMENDS_${PN}-config-minimalist = "\ -
> ${PN}-background-light-gradient \ -  ${PN}-theme-default \ +
> ${PN}-background-light-gradient \ +    ${PN}-theme-default \ " 
> RRECOMMENDS_${PN}-config-netbook = "\ -  ${PN}-background-dark-gradient
> \ -  ${PN}-theme-default \ +    ${PN}-background-dark-gradient \ +
> ${PN}-theme-default \ " RRECOMMENDS_${PN}-config-scaleable =
> "${PN}-theme-default" RRECOMMENDS_${PN}-config-standard =
> "${PN}-theme-default"
> 
> FILES_${PN}-dbg += "\ -  ${libdir}/enlightenment/modules/*/*/.debug/ \ -
> ${libdir}/enlightenment/modules/policies/.debug/ \ -
> ${libdir}/enlightenment/preload/.debug/ \ -
> ${libdir}/enlightenment/utils/.debug/ \ -
> ${libdir}/enlightenment/*plugins/*/*/.debug \ +
> ${libdir}/enlightenment/modules/*/*/.debug/ \ +
> ${libdir}/enlightenment/modules/policies/.debug/ \ +
> ${libdir}/enlightenment/preload/.debug/ \ +
> ${libdir}/enlightenment/utils/.debug/ \ +
> ${libdir}/enlightenment/*plugins/*/*/.debug \ "
> 
> FILES_${PN}-doc += "\ -  ${datadir}/enlightenment/doc \ +
> ${datadir}/enlightenment/doc \ "
> 
> CONFFILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu" diff
> --git a/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
> b/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb index ebd5900..228c122
> 100644 --- a/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb +++
> b/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb @@ -7,9 +7,9 @@ SRCNAME =
> "enlightenment" S = "${WORKDIR}/${SRCNAME}-${PV}"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ -
> file://enlightenment_start.oe \ -  file://applications.menu \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> file://enlightenment_start.oe \ +    file://applications.menu \ "
> 
> SRC_URI[md5sum] = "e78018ba7a4622efbcbebd6d093b7fa4" diff --git
> a/meta-efl/recipes-efl/e17/e-wm_svn.bb
> b/meta-efl/recipes-efl/e17/e-wm_svn.bb index 22eb821..fc03ff3 100644 ---
> a/meta-efl/recipes-efl/e17/e-wm_svn.bb +++
> b/meta-efl/recipes-efl/e17/e-wm_svn.bb @@ -10,7 +10,7 @@ SRCREV =
> "${EFL_SRCREV}" S = "${WORKDIR}/${SRCNAME}"
> 
> SRC_URI = "\ -  ${E_SVN}/trunk;module=${SRCNAME};protocol=http \ -
> file://enlightenment_start.oe \ -  file://applications.menu \ +
> ${E_SVN}/trunk;module=${SRCNAME};protocol=http \ +
> file://enlightenment_start.oe \ +    file://applications.menu \ " diff
> --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
> b/meta-efl/recipes-efl/e17/elmdentica_svn.bb index f3bf939..543b9b7
> 100644 --- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb +++
> b/meta-efl/recipes-efl/e17/elmdentica_svn.bb @@ -19,5 +19,5 @@ SRCREV =
> "${EFL_SRCREV}" RDEPENDS_${PN} = "${PN}-themes"
> 
> do_configure_prepend() { -        autopoint --force +    autopoint
> --force } diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb
> b/meta-efl/recipes-efl/e17/enjoy_svn.bb index 5137c4e..a6c130c 100644 ---
> a/meta-efl/recipes-efl/e17/enjoy_svn.bb +++
> b/meta-efl/recipes-efl/e17/enjoy_svn.bb @@ -22,8 +22,8 @@ RDEPENDS_${PN}
> += "\
> 
> inherit e gettext SRC_URI = " \ -
> ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \ -
> file://0001-always-use-position-as-percent-and-define-a-1-second.patch \ 
> +    ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \ +
> file://0001-always-use-position-as-percent-and-define-a-1-second.patch \ 
> " S = "${WORKDIR}/${SRCNAME}"
> 
> @@ -32,11 +32,11 @@ PR = "r1" FILES_${PN} += "${datadir}/icons/"
> 
> EXTRA_OECONF = "\ -  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \ +
> --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \ "
> 
> do_configure_prepend() { -       autopoint || touch config.rpath +
> autopoint || touch config.rpath }
> 
> pkg_postinst_${PN} () { diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb
> b/meta-efl/recipes-efl/e17/eve_svn.bb index 9f4b93b..128bd1a 100644 ---
> a/meta-efl/recipes-efl/e17/eve_svn.bb +++
> b/meta-efl/recipes-efl/e17/eve_svn.bb @@ -10,16 +10,16 @@ SRC_URI =
> "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep" S =
> "${WORKDIR}/${SRCNAME}"
> 
> do_configure_prepend() { -       autopoint || touch config.rpath +
> autopoint || touch config.rpath }
> 
> SRC_URI += "file://eve-theme-for-smaller-screens.patch \ "
> 
> EXTRA_OECONF = "\ -  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \ +
> --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \ "
> 
> FILES_${PN} += "\ -        ${datadir}/icons/eve.png \ +
> ${datadir}/icons/eve.png \ " diff --git
> a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
> b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb index
> 9037f68..5948e20 100644 ---
> a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb +++
> b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb @@ -21,7 +21,7 @@
> SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};protocol=http \ S =
> "${WORKDIR}/${SRCNAME}"
> 
> do_compile() { -   ${STAGING_BINDIR_NATIVE}/edje_cc exquisite.edc
> illume.edj +    ${STAGING_BINDIR_NATIVE}/edje_cc exquisite.edc
> illume.edj }
> 
> do_install() { diff --git a/meta-efl/recipes-efl/e17/exquisite_svn.bb
> b/meta-efl/recipes-efl/e17/exquisite_svn.bb index 62453b8..7dfb8e4
> 100644 --- a/meta-efl/recipes-efl/e17/exquisite_svn.bb +++
> b/meta-efl/recipes-efl/e17/exquisite_svn.bb @@ -21,18 +21,18 @@ SRC_URI
> += "file://splashfuncs" inherit update-rc.d
> 
> do_install_prepend() { -  install -d ${D}/mnt/.splash/ -  install -d
> ${D}${sysconfdir}/init.d -  install -m 0755 ${WORKDIR}/exquisite-init
> ${D}${sysconfdir}/init.d/exquisite -  install -d
> ${D}${sysconfdir}/default -  install -m 0755 ${WORKDIR}/splashfuncs
> ${D}${sysconfdir}/default/splashfuncs -  install -d ${D}${bindir} -  ln
> -s exquisite-write ${D}${bindir}/splash-write +    install -d
> ${D}/mnt/.splash/ +    install -d ${D}${sysconfdir}/init.d +    install
> -m 0755 ${WORKDIR}/exquisite-init ${D}${sysconfdir}/init.d/exquisite +
> install -d ${D}${sysconfdir}/default +    install -m 0755
> ${WORKDIR}/splashfuncs ${D}${sysconfdir}/default/splashfuncs +    install
> -d ${D}${bindir} +    ln -s exquisite-write ${D}${bindir}/splash-write }
> 
> 
> do_install_append() { -  rm -rf ${D}${datadir}/exquisite/data/fonts/* +
> rm -rf ${D}${datadir}/exquisite/data/fonts/* }
> 
> INITSCRIPT_NAME = "exquisite" diff --git
> a/meta-efl/recipes-efl/e17/terminology.inc
> b/meta-efl/recipes-efl/e17/terminology.inc index 15af6ea..00b8f83 100644 
> --- a/meta-efl/recipes-efl/e17/terminology.inc +++
> b/meta-efl/recipes-efl/e17/terminology.inc @@ -10,11 +10,11 @@ INC_PR =
> "r2" PE = "2"
> 
> EXTRA_OECONF = "\ -  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \ +
> --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \ "
> 
> FILES_${PN} += "\ -        ${datadir}/icons/terminology.png \ +
> ${datadir}/icons/terminology.png \ "
> 
> # doesn't start without own theme diff --git
> a/meta-efl/recipes-efl/e17/terminology_0.3.0.bb
> b/meta-efl/recipes-efl/e17/terminology_0.3.0.bb index 5bd485b..d3cd59c
> 100644 --- a/meta-efl/recipes-efl/e17/terminology_0.3.0.bb +++
> b/meta-efl/recipes-efl/e17/terminology_0.3.0.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "7cecd058cb4509873412252477f2ce5b" diff --git
> a/meta-efl/recipes-efl/efl/azy_svn.bb
> b/meta-efl/recipes-efl/efl/azy_svn.bb index 8082196..a670b9c 100644 ---
> a/meta-efl/recipes-efl/efl/azy_svn.bb +++
> b/meta-efl/recipes-efl/efl/azy_svn.bb @@ -15,14 +15,14 @@ BBCLASSEXTEND =
> "native" EXTRA_OECONF += " --disable-mysql-tests"
> 
> do_configure_prepend_class-target() { -  sed -i
> "s#\./lemon#${STAGING_BINDIR_NATIVE}/azy_lemon#g"
> ${S}/src/bin/Makefile.am -  sed -i "s#\$(top_builddir)/src/bin/azy_parser
> -H -p -o#${STAGING_BINDIR_NATIVE}/azy_parser -H -p -o#g"
> ${S}/src/tests/Makefile.am -  sed -i
> "s#\$(top_builddir)/src/bin/azy_parser -eHn
> -m#${STAGING_BINDIR_NATIVE}/azy_parser -eHn -m#g"
> ${S}/src/tests/identi.ca/Makefile.am +    sed -i
> "s#\./lemon#${STAGING_BINDIR_NATIVE}/azy_lemon#g"
> ${S}/src/bin/Makefile.am +    sed -i
> "s#\$(top_builddir)/src/bin/azy_parser -H -p
> -o#${STAGING_BINDIR_NATIVE}/azy_parser -H -p -o#g"
> ${S}/src/tests/Makefile.am +    sed -i
> "s#\$(top_builddir)/src/bin/azy_parser -eHn
> -m#${STAGING_BINDIR_NATIVE}/azy_parser -eHn -m#g"
> ${S}/src/tests/identi.ca/Makefile.am }
> 
> do_install_append_class-native() { -  install -d ${D}/${bindir} -
> install -m 0755 ${S}/src/bin/lemon ${D}/${bindir}/azy_lemon +    install
> -d ${D}/${bindir} +    install -m 0755 ${S}/src/bin/lemon
> ${D}/${bindir}/azy_lemon }
> 
> inherit efl diff --git a/meta-efl/recipes-efl/efl/ecore.inc
> b/meta-efl/recipes-efl/efl/ecore.inc index d329f57..5e7e892 100644 ---
> a/meta-efl/recipes-efl/efl/ecore.inc +++
> b/meta-efl/recipes-efl/efl/ecore.inc @@ -40,7 +40,7 @@ PACKAGES =+ "\ 
> AUTO_LIBNAME_PKGS = ""
> 
> FILES_${PN} = "${libdir}/libecore*.so.* \ -  ${bindir} \ +    ${bindir}
> \ " FILES_${PN}-con = "${libdir}/libecore_con*.so.*" FILES_${PN}-config =
> "${libdir}/libecore_config*.so.*" @@ -51,7 +51,7 @@ FILES_${PN}-evas =
> "${libdir}/libecore_evas*.so.*" FILES_${PN}-fb =
> "${libdir}/libecore_fb*.so.*" FILES_${PN}-file =
> "${libdir}/libecore_file*.so.*" FILES_${PN}-imf =
> "${libdir}/libecore_imf*.so.* \ -  ${libdir}/ecore/immodules/*.so \ +
> ${libdir}/ecore/immodules/*.so \ " FILES_${PN}-imf-evas =
> "${libdir}/libecore_imf_evas*.so.*" FILES_${PN}-ipc =
> "${libdir}/libecore_ipc*.so.*" @@ -61,32 +61,32 @@ FILES_${PN}-x =
> "${libdir}/libecore_x*.so.*" FILES_${PN}-input =
> "${libdir}/libecore_input*.so.*"
> 
> ECORE_OECONF = "\ -  --x-includes=${STAGING_INCDIR}/X11 \ -
> --x-libraries=${STAGING_LIBDIR} \ -  --enable-simple-x11 \ -
> --enable-ecore-config \ -  --enable-ecore-x \ -  --enable-ecore-job \ -
> --enable-ecore-fb \ -  --enable-ecore-evas \ -
> --enable-ecore-evas-software-16-x11 \ -  --enable-ecore-evas-xrender \ -
> --enable-abstract-sockets \ -  --enable-ecore-con \ -  --enable-ecore-ipc
> \ -  --enable-ecore-file \ -  --enable-inotify \ -
> --disable-ecore-desktop \ -  --disable-ecore-x-xcb \ -
> --disable-ecore-x-xprint \ -  --disable-ecore-directfb \ -
> --disable-ecore-sdl \ -  --enable-ecore-evas-opengl-x11 \ -
> --disable-ecore-evas-dfb \ -  --disable-ecore-evas-sdl \ -
> --disable-openssl \ -  --disable-poll \ -  --enable-xim \ +
> --x-includes=${STAGING_INCDIR}/X11 \ +    --x-libraries=${STAGING_LIBDIR}
> \ +    --enable-simple-x11 \ +    --enable-ecore-config \ +
> --enable-ecore-x \ +    --enable-ecore-job \ +    --enable-ecore-fb \ +
> --enable-ecore-evas \ +    --enable-ecore-evas-software-16-x11 \ +
> --enable-ecore-evas-xrender \ +    --enable-abstract-sockets \ +
> --enable-ecore-con \ +    --enable-ecore-ipc \ +    --enable-ecore-file
> \ +    --enable-inotify \ +    --disable-ecore-desktop \ +
> --disable-ecore-x-xcb \ +    --disable-ecore-x-xprint \ +
> --disable-ecore-directfb \ +    --disable-ecore-sdl \ +
> --enable-ecore-evas-opengl-x11 \ +    --disable-ecore-evas-dfb \ +
> --disable-ecore-evas-sdl \ +    --disable-openssl \ +    --disable-poll
> \ +    --enable-xim \ "
> 
> EXTRA_OECONF = "${ECORE_OECONF} \ diff --git
> a/meta-efl/recipes-efl/efl/ecore_1.7.6.bb
> b/meta-efl/recipes-efl/efl/ecore_1.7.6.bb index 4df653e..0842878 100644 
> --- a/meta-efl/recipes-efl/efl/ecore_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/ecore_1.7.6.bb @@ -3,8 +3,8 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ -
> file://fix-ecore-fb-initialization.patch \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> file://fix-ecore-fb-initialization.patch \ "
> 
> SRC_URI[md5sum] = "a41828b5b4ca42283d8658c0fe54db07" diff --git
> a/meta-efl/recipes-efl/efl/ecore_svn.bb
> b/meta-efl/recipes-efl/efl/ecore_svn.bb index 945cfad..f421c2b 100644 ---
> a/meta-efl/recipes-efl/efl/ecore_svn.bb +++
> b/meta-efl/recipes-efl/efl/ecore_svn.bb @@ -8,7 +8,7 @@
> DEFAULT_PREFERENCE = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ -
> file://fix-ecore-fb-initialization.patch \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> file://fix-ecore-fb-initialization.patch \ " S = "${WORKDIR}/${SRCNAME}" 
> diff --git a/meta-efl/recipes-efl/efl/edbus2_svn.bb
> b/meta-efl/recipes-efl/efl/edbus2_svn.bb index 26d8092..e87f147 100644 
> --- a/meta-efl/recipes-efl/efl/edbus2_svn.bb +++
> b/meta-efl/recipes-efl/efl/edbus2_svn.bb @@ -6,7 +6,7 @@ PR =
> "${INC_PR}.2" DEFAULT_PREFERENCE = "-1"
> 
> SRC_URI = "\ -
> ${E_SVN}/trunk/IN-EFL;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/trunk/IN-EFL;module=${SRCNAME};protocol=http;scmdata=keep \ " S
> = "${WORKDIR}/${SRCNAME}"
> 
> diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.6.bb
> b/meta-efl/recipes-efl/efl/edbus_1.7.6.bb index 196dd37..17f7c1b 100644 
> --- a/meta-efl/recipes-efl/efl/edbus_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/edbus_1.7.6.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "3b4694a1b7c8f635effb225fe4c1f43d" diff --git
> a/meta-efl/recipes-efl/efl/edbus_svn.bb
> b/meta-efl/recipes-efl/efl/edbus_svn.bb index 95d8e02..5b13b9e 100644 ---
> a/meta-efl/recipes-efl/efl/edbus_svn.bb +++
> b/meta-efl/recipes-efl/efl/edbus_svn.bb @@ -8,6 +8,6 @@
> DEFAULT_PREFERENCE = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git a/meta-efl/recipes-efl/efl/edje.inc
> b/meta-efl/recipes-efl/efl/edje.inc index 6f50ea8..b34453c 100644 ---
> a/meta-efl/recipes-efl/efl/edje.inc +++
> b/meta-efl/recipes-efl/efl/edje.inc @@ -44,9 +44,9 @@ PACKAGES =+
> "${PN}-utils" RDEPENDS_${PN}-utils = "cpp cpp-symlinks embryo-tests"
> 
> RRECOMMENDS_${PN}-utils = "\ -  evas-saver-png \ -  evas-saver-jpeg \ -
> evas-saver-eet \ +    evas-saver-png \ +    evas-saver-jpeg \ +
> evas-saver-eet \ "
> 
> DEBIAN_NOAUTONAME_${PN}-utils = "1" @@ -54,10 +54,10 @@
> DEBIAN_NOAUTONAME_${PN}-utils = "1" AUTO_LIBNAME_PKGS = ""
> 
> FILES_${PN}-utils = "\ -  ${bindir}/edje_* \ -  ${bindir}/inkscape2edc \ 
> -  ${libdir}/edje/utils/epp \ -  ${datadir}/edje/include/edje.inc \ +
> ${bindir}/edje_* \ +    ${bindir}/inkscape2edc \ +
> ${libdir}/edje/utils/epp \ +    ${datadir}/edje/include/edje.inc \ "
> 
> FILES_${PN} += "${libdir}/${PN}/modules/*/*/module.so \ diff --git
> a/meta-efl/recipes-efl/efl/edje_1.7.6.bb
> b/meta-efl/recipes-efl/efl/edje_1.7.6.bb index 4708ff6..0795e8d 100644 
> --- a/meta-efl/recipes-efl/efl/edje_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/edje_1.7.6.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "2fa9079a1c53efebad47dccf6cb3a62c" diff --git
> a/meta-efl/recipes-efl/efl/edje_svn.bb
> b/meta-efl/recipes-efl/efl/edje_svn.bb index 95d8e02..5b13b9e 100644 ---
> a/meta-efl/recipes-efl/efl/edje_svn.bb +++
> b/meta-efl/recipes-efl/efl/edje_svn.bb @@ -8,6 +8,6 @@ DEFAULT_PREFERENCE
> = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git a/meta-efl/recipes-efl/efl/eet.inc
> b/meta-efl/recipes-efl/efl/eet.inc index 0f6a9fe..a7864ec 100644 ---
> a/meta-efl/recipes-efl/efl/eet.inc +++
> b/meta-efl/recipes-efl/efl/eet.inc @@ -9,16 +9,16 @@ BBCLASSEXTEND =
> "native" INC_PR = "r0"
> 
> EXTRA_OECONF = "\ -  --enable-openssl \ -  --enable-cypher \ -
> --enable-signature \ -  --disable-coverage \ -
> --enable-old-eet-file-format \ -  --disable-assert \ +
> --enable-openssl \ +    --enable-cypher \ +    --enable-signature \ +
> --disable-coverage \ +    --enable-old-eet-file-format \ +
> --disable-assert \ "
> 
> PACKAGES =+ "${PN}-utils"
> 
> FILES_${PN}-utils = "\ -  ${bindir}/${PN} \ +    ${bindir}/${PN} \ " diff
> --git a/meta-efl/recipes-efl/efl/eet_1.7.6.bb
> b/meta-efl/recipes-efl/efl/eet_1.7.6.bb index f014fe3..023dab0 100644 ---
> a/meta-efl/recipes-efl/efl/eet_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/eet_1.7.6.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "16a3b3cffbc7d63a5efdd673793e4a7a" diff --git
> a/meta-efl/recipes-efl/efl/eet_svn.bb
> b/meta-efl/recipes-efl/efl/eet_svn.bb index 95d8e02..5b13b9e 100644 ---
> a/meta-efl/recipes-efl/efl/eet_svn.bb +++
> b/meta-efl/recipes-efl/efl/eet_svn.bb @@ -8,6 +8,6 @@ DEFAULT_PREFERENCE
> = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git
> a/meta-efl/recipes-efl/efl/eeze_1.7.6.bb
> b/meta-efl/recipes-efl/efl/eeze_1.7.6.bb index 76a4c89..85dd6b1 100644 
> --- a/meta-efl/recipes-efl/efl/eeze_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/eeze_1.7.6.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "8e23ead15f9f52df5ffd05560153756f" diff --git
> a/meta-efl/recipes-efl/efl/eeze_svn.bb
> b/meta-efl/recipes-efl/efl/eeze_svn.bb index 95d8e02..5b13b9e 100644 ---
> a/meta-efl/recipes-efl/efl/eeze_svn.bb +++
> b/meta-efl/recipes-efl/efl/eeze_svn.bb @@ -8,6 +8,6 @@ DEFAULT_PREFERENCE
> = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git
> a/meta-efl/recipes-efl/efl/efreet_1.7.6.bb
> b/meta-efl/recipes-efl/efl/efreet_1.7.6.bb index a72b47c..af7e44b 100644 
> --- a/meta-efl/recipes-efl/efl/efreet_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/efreet_1.7.6.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "3888d88fcbf50e8977fc9f198facee8e" diff --git
> a/meta-efl/recipes-efl/efl/efreet_svn.bb
> b/meta-efl/recipes-efl/efl/efreet_svn.bb index 95d8e02..5b13b9e 100644 
> --- a/meta-efl/recipes-efl/efl/efreet_svn.bb +++
> b/meta-efl/recipes-efl/efl/efreet_svn.bb @@ -8,6 +8,6 @@
> DEFAULT_PREFERENCE = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git
> a/meta-efl/recipes-efl/efl/eina_1.7.6.bb
> b/meta-efl/recipes-efl/efl/eina_1.7.6.bb index 69fda64..b3dafd5 100644 
> --- a/meta-efl/recipes-efl/efl/eina_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/eina_1.7.6.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "4f0075f404223284dac0f34f676c511e" diff --git
> a/meta-efl/recipes-efl/efl/eina_svn.bb
> b/meta-efl/recipes-efl/efl/eina_svn.bb index 95d8e02..5b13b9e 100644 ---
> a/meta-efl/recipes-efl/efl/eina_svn.bb +++
> b/meta-efl/recipes-efl/efl/eina_svn.bb @@ -8,6 +8,6 @@ DEFAULT_PREFERENCE
> = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git
> a/meta-efl/recipes-efl/efl/eio_1.7.6.bb
> b/meta-efl/recipes-efl/efl/eio_1.7.6.bb index 7265cf2..5c45c92 100644 ---
> a/meta-efl/recipes-efl/efl/eio_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/eio_1.7.6.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "c180817c536822153a1853b74a96d01a" diff --git
> a/meta-efl/recipes-efl/efl/eio_svn.bb
> b/meta-efl/recipes-efl/efl/eio_svn.bb index 95d8e02..5b13b9e 100644 ---
> a/meta-efl/recipes-efl/efl/eio_svn.bb +++
> b/meta-efl/recipes-efl/efl/eio_svn.bb @@ -8,6 +8,6 @@ DEFAULT_PREFERENCE
> = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git
> a/meta-efl/recipes-efl/efl/elementary.inc
> b/meta-efl/recipes-efl/efl/elementary.inc index 34338e8..a8ed15f 100644 
> --- a/meta-efl/recipes-efl/efl/elementary.inc +++
> b/meta-efl/recipes-efl/efl/elementary.inc @@ -8,63 +8,63 @@ inherit efl
> gettext INC_PR = "r0"
> 
> EXTRA_OECONF = "\ -  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \ -
> --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \ -  --disable-web \ +
> --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \ +
> --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \ +    --disable-web \ "
> 
> do_compile_append() { -        sed -i -e s:${STAGING_DIR_TARGET}::g \ -
> -e s:/${TARGET_SYS}::g \ -                  elementary.pc +    sed -i -e
> s:${STAGING_DIR_TARGET}::g \ +           -e s:/${TARGET_SYS}::g \ +
> elementary.pc }
> 
> PACKAGES += "${PN}-configs ${PN}-accessibility"
> 
> RDEPENDS_${PN} = "\ -  ${PN}-themes \ -  ${PN}-configs \ +
> ${PN}-themes \ +    ${PN}-configs \ " RSUGGESTS_${PN} = "${PN}-tests
> ${PN}-accessibility"
> 
> FILES_${PN} += "\ -  ${libdir}/edje/modules/elm \ -
> ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.so \ +
> ${libdir}/edje/modules/elm \ +
> ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.so \ "
> 
> FILES_${PN}-dev += "\ -
> ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.la \ +
> ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.la \ "
> 
> FILES_${PN}-themes = "\ -  ${datadir}/elementary/themes \ +
> ${datadir}/elementary/themes \ "
> 
> FILES_${PN}-configs = "\ -  ${datadir}/elementary/config \ +
> ${datadir}/elementary/config \ "
> 
> FILES_${PN}-dbg += "\ -  ${libdir}/elementary/modules/test_entry/*/.debug
> \ -  ${libdir}/elementary/modules/test_map/*/.debug \ -
> ${libdir}/elementary/modules/access_output/*/.debug \ -
> ${libdir}/elementary/modules/datetime_input_ctxpopup/*/.debug \ -
> ${libdir}/edje/modules/elm/*/.debug \ +
> ${libdir}/elementary/modules/test_entry/*/.debug \ +
> ${libdir}/elementary/modules/test_map/*/.debug \ +
> ${libdir}/elementary/modules/access_output/*/.debug \ +
> ${libdir}/elementary/modules/datetime_input_ctxpopup/*/.debug \ +
> ${libdir}/edje/modules/elm/*/.debug \ "
> 
> FILES_${PN}-tests = "\ -  ${bindir}/elementary* \ -
> ${datadir}/elementary/images \ -  ${datadir}/elementary/objects \ -
> ${datadir}/elementary/examples \ -  ${datadir}/applications/* \ -
> ${datadir}/icons/* \ -  ${libdir}/elementary/modules/test_entry/* \ -
> ${libdir}/elementary/modules/test_map/* \ +    ${bindir}/elementary* \ +
> ${datadir}/elementary/images \ +    ${datadir}/elementary/objects \ +
> ${datadir}/elementary/examples \ +    ${datadir}/applications/* \ +
> ${datadir}/icons/* \ +    ${libdir}/elementary/modules/test_entry/* \ +
> ${libdir}/elementary/modules/test_map/* \ "
> 
> FILES_${PN}-accessibility = "\ -
> ${libdir}/elementary/modules/access_output/* \ +
> ${libdir}/elementary/modules/access_output/* \ "
> 
> # Some upgrade path tweaking, as in evas diff --git
> a/meta-efl/recipes-efl/efl/elementary_1.7.6.bb
> b/meta-efl/recipes-efl/efl/elementary_1.7.6.bb index f719253..060a854
> 100644 --- a/meta-efl/recipes-efl/efl/elementary_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/elementary_1.7.6.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "48f28d887432f9aca434c864de33d5f8" diff --git
> a/meta-efl/recipes-efl/efl/elementary_svn.bb
> b/meta-efl/recipes-efl/efl/elementary_svn.bb index 95d8e02..5b13b9e
> 100644 --- a/meta-efl/recipes-efl/efl/elementary_svn.bb +++
> b/meta-efl/recipes-efl/efl/elementary_svn.bb @@ -8,6 +8,6 @@
> DEFAULT_PREFERENCE = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git
> a/meta-efl/recipes-efl/efl/embryo_1.7.6.bb
> b/meta-efl/recipes-efl/efl/embryo_1.7.6.bb index bb3aa74..a288052 100644 
> --- a/meta-efl/recipes-efl/efl/embryo_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/embryo_1.7.6.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "6302e1845d50074a949d8d822e2c8874" diff --git
> a/meta-efl/recipes-efl/efl/embryo_svn.bb
> b/meta-efl/recipes-efl/efl/embryo_svn.bb index 95d8e02..5b13b9e 100644 
> --- a/meta-efl/recipes-efl/efl/embryo_svn.bb +++
> b/meta-efl/recipes-efl/efl/embryo_svn.bb @@ -8,6 +8,6 @@
> DEFAULT_PREFERENCE = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git
> a/meta-efl/recipes-efl/efl/emotion_1.7.6.bb
> b/meta-efl/recipes-efl/efl/emotion_1.7.6.bb index 9435a9f..1a7edb3
> 100644 --- a/meta-efl/recipes-efl/efl/emotion_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/emotion_1.7.6.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "eb15b6faa1e4a30f80622a1381c670fc" diff --git
> a/meta-efl/recipes-efl/efl/emotion_svn.bb
> b/meta-efl/recipes-efl/efl/emotion_svn.bb index 95d8e02..5b13b9e 100644 
> --- a/meta-efl/recipes-efl/efl/emotion_svn.bb +++
> b/meta-efl/recipes-efl/efl/emotion_svn.bb @@ -8,6 +8,6 @@
> DEFAULT_PREFERENCE = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git
> a/meta-efl/recipes-efl/efl/entrance_svn.bb
> b/meta-efl/recipes-efl/efl/entrance_svn.bb index 02eb64b..9a85f7b 100644 
> --- a/meta-efl/recipes-efl/efl/entrance_svn.bb +++
> b/meta-efl/recipes-efl/efl/entrance_svn.bb @@ -6,8 +6,8 @@ SECTION =
> "e/apps"
> 
> inherit e gettext systemd SRC_URI =
> "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep \ -
> file://0001-pam-use-common-auth-instead-of-system-auth.patch \ -
> file://entrance.service \ +
> file://0001-pam-use-common-auth-instead-of-system-auth.patch \ +
> file://entrance.service \ " S = "${WORKDIR}/${SRCNAME}"
> 
> @@ -33,6 +33,6 @@ RCONFLICTS_${PN} += "${PN}-systemd" 
> SYSTEMD_SERVICE_${PN} = "entrance.service"
> 
> do_install_append() { -	install -d ${D}${systemd_unitdir}/system -
> install -m 0644 ${WORKDIR}/entrance.service
> ${D}${systemd_unitdir}/system +    install -d
> ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/entrance.service ${D}${systemd_unitdir}/system } diff --git
> a/meta-efl/recipes-efl/efl/ethumb.inc
> b/meta-efl/recipes-efl/efl/ethumb.inc index 92a83ee..32a1306 100644 ---
> a/meta-efl/recipes-efl/efl/ethumb.inc +++
> b/meta-efl/recipes-efl/efl/ethumb.inc @@ -8,9 +8,9 @@ INC_PR = "r0" 
> inherit efl
> 
> EXTRA_OECONF = "\ -  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \ -
> --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \ -  --disable-docs \ +
> --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \ +
> --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \ +    --disable-docs \ "
> 
> # Some upgrade path tweaking, as in evas diff --git
> a/meta-efl/recipes-efl/efl/ethumb_1.7.6.bb
> b/meta-efl/recipes-efl/efl/ethumb_1.7.6.bb index f66a678..b8ced29 100644 
> --- a/meta-efl/recipes-efl/efl/ethumb_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/ethumb_1.7.6.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "343ef0dfda62295db353b7dca059e4a7" diff --git
> a/meta-efl/recipes-efl/efl/ethumb_svn.bb
> b/meta-efl/recipes-efl/efl/ethumb_svn.bb index 95d8e02..5b13b9e 100644 
> --- a/meta-efl/recipes-efl/efl/ethumb_svn.bb +++
> b/meta-efl/recipes-efl/efl/ethumb_svn.bb @@ -8,6 +8,6 @@
> DEFAULT_PREFERENCE = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git
> a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
> b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc index
> 4f84291..43cdb86 100644 ---
> a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc +++
> b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc @@ -10,11 +10,11 @@
> INC_PR = "r0" SRCNAME = "evas_generic_loaders"
> 
> EXTRA_OECONF = " \ -  --enable-poppler \ -  --enable-svg \ -
> --disable-gstreamer \ -  --disable-libraw \ -  --disable-spectre \ +
> --enable-poppler \ +    --enable-svg \ +    --disable-gstreamer \ +
> --disable-libraw \ +    --disable-spectre \ "
> 
> python populate_packages_prepend () { diff --git
> a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb
> b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb index
> d3ea978..eb2e6f9 100644 ---
> a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb @@ -3,7 +3,7 @@
> require ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "f025e08a673ba4f11a3d17fc50e0abb1" diff --git
> a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
> b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb index
> 95d8e02..5b13b9e 100644 ---
> a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb +++
> b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb @@ -8,6 +8,6 @@
> DEFAULT_PREFERENCE = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git a/meta-efl/recipes-efl/efl/evas.inc
> b/meta-efl/recipes-efl/efl/evas.inc index 04cf835..4e5e1e3 100644 ---
> a/meta-efl/recipes-efl/efl/evas.inc +++
> b/meta-efl/recipes-efl/efl/evas.inc @@ -48,17 +48,17 @@ PACKAGES_DYNAMIC
> += "^evas-engine-.* ^evas-loader-.* ^evas-saver-.* ^evas-cserve 
> RRECOMMENDS_${PN} += "evas-loader-generic evas-generic-loader-svn"
> 
> RRECOMMENDS_${PN} = " \ -  evas-engine-fb \ -
> evas-engine-software-generic \ -  evas-engine-software-x11 \ -
> evas-engine-software-16 \ -  evas-engine-software-16-x11 \ -
> evas-engine-xrender-x11 \ - \ -  evas-loader-png \ -  evas-loader-jpeg \ 
> -  evas-loader-gif \ -  evas-loader-svg \ +    evas-engine-fb \ +
> evas-engine-software-generic \ +    evas-engine-software-x11 \ +
> evas-engine-software-16 \ +    evas-engine-software-16-x11 \ +
> evas-engine-xrender-x11 \ +    \ +    evas-loader-png \ +
> evas-loader-jpeg \ +    evas-loader-gif \ +    evas-loader-svg \ "
> 
> # Some upgrade path tweaking diff --git
> a/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb
> b/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb index 2ea56ee..f434d1a 100644 
> --- a/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb +++
> b/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.1"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "c1710b7769c6dc8cfb0a21190fbc0c9b" diff --git
> a/meta-efl/recipes-efl/efl/evas_svn.bb
> b/meta-efl/recipes-efl/efl/evas_svn.bb index 95d8e02..5b13b9e 100644 ---
> a/meta-efl/recipes-efl/efl/evas_svn.bb +++
> b/meta-efl/recipes-efl/efl/evas_svn.bb @@ -8,6 +8,6 @@ DEFAULT_PREFERENCE
> = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git
> a/meta-efl/recipes-efl/efl/expedite.inc
> b/meta-efl/recipes-efl/efl/expedite.inc index 9399d82..89500bf 100644 ---
> a/meta-efl/recipes-efl/efl/expedite.inc +++
> b/meta-efl/recipes-efl/efl/expedite.inc @@ -8,20 +8,20 @@ INC_PR = "r0" 
> inherit e
> 
> EXTRA_OECONF = "\ -  --x-includes=${STAGING_INCDIR}/X11 \ -
> --x-libraries=${STAGING_LIBDIR} \ -  --enable-simple-x11 \ +
> --x-includes=${STAGING_INCDIR}/X11 \ +    --x-libraries=${STAGING_LIBDIR}
> \ +    --enable-simple-x11 \ \ -  --disable-opengl-glew \ -
> --enable-software-x11 \ -  --enable-xrender-x11 \ -
> --enable-software-16-x11 \ -  --enable-opengl-x11 \ -  --enable-fb \ -
> --disable-software-ddraw \ -  --disable-software-16-ddraw \ -
> --disable-direct3d \ -  --disable-software-sdl \ +
> --disable-opengl-glew \ +    --enable-software-x11 \ +
> --enable-xrender-x11 \ +    --enable-software-16-x11 \ +
> --enable-opengl-x11 \ +    --enable-fb \ +    --disable-software-ddraw \ 
> +    --disable-software-16-ddraw \ +    --disable-direct3d \ +
> --disable-software-sdl \ "
> 
> FILES_${PN} += "${datadir}" diff --git
> a/meta-efl/recipes-efl/efl/expedite_1.7.6.bb
> b/meta-efl/recipes-efl/efl/expedite_1.7.6.bb index 42431aa..c582ad1
> 100644 --- a/meta-efl/recipes-efl/efl/expedite_1.7.6.bb +++
> b/meta-efl/recipes-efl/efl/expedite_1.7.6.bb @@ -3,7 +3,7 @@ require
> ${BPN}.inc PR = "${INC_PR}.0"
> 
> SRC_URI = "\ -  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ +
> ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \ "
> 
> SRC_URI[md5sum] = "a4a6f3a84ff85d78c74e56a046bd3419" diff --git
> a/meta-efl/recipes-efl/efl/expedite_svn.bb
> b/meta-efl/recipes-efl/efl/expedite_svn.bb index 95d8e02..5b13b9e 100644 
> --- a/meta-efl/recipes-efl/efl/expedite_svn.bb +++
> b/meta-efl/recipes-efl/efl/expedite_svn.bb @@ -8,6 +8,6 @@
> DEFAULT_PREFERENCE = "-1" SRCNAME_append = "-1.7"
> 
> SRC_URI = "\ -
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ +
> ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \ " S =
> "${WORKDIR}/${SRCNAME}" diff --git
> a/meta-efl/recipes-efl/efl/libeweather_svn.bb
> b/meta-efl/recipes-efl/efl/libeweather_svn.bb index 934efa1..bc7bce6
> 100644 --- a/meta-efl/recipes-efl/efl/libeweather_svn.bb +++
> b/meta-efl/recipes-efl/efl/libeweather_svn.bb @@ -16,31 +16,31 @@
> EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc" 
> RSUGGESTS_${PN} = "elementary-tests"
> 
> do_compile_append() { -        sed -i -e s:${STAGING_DIR_TARGET}::g \ -
> -e s:/${TARGET_SYS}::g \ -                  eweather.pc +    sed -i -e
> s:${STAGING_DIR_TARGET}::g \ +           -e s:/${TARGET_SYS}::g \ +
> eweather.pc }
> 
> PACKAGES += "${PN}-plugins"
> 
> FILES_${PN}-themes = "\ -  ${datadir} \ +    ${datadir} \ "
> 
> FILES_${PN}-plugins = "\ -  ${libdir}/eweather/plugins/*.so \ +
> ${libdir}/eweather/plugins/*.so \ "
> 
> FILES_${PN}-dbg += "\ -  ${libdir}/eweather/plugins/.debug \ +
> ${libdir}/eweather/plugins/.debug \ "
> 
> FILES_${PN}-dev += "\ -  ${libdir}/eweather/plugins/*.a \ -
> ${libdir}/eweather/plugins/*.la \ +    ${libdir}/eweather/plugins/*.a \ +
> ${libdir}/eweather/plugins/*.la \ "
> 
> RRECOMMENDS_${PN} = "\ -  ${PN}-themes \ -  ${PN}-plugins \ +
> ${PN}-themes \ +    ${PN}-plugins \ " diff --git
> a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
> b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb index
> 11b01f6..47f758a 100644 ---
> a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb +++
> b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb @@ -15,10
> +15,10 @@ RPROVIDES_${PN} += "task-x11-illume" RREPLACES_${PN} +=
> "task-x11-illume" RCONFLICTS_${PN} += "task-x11-illume" RDEPENDS_${PN} =
> "\ -  packagegroup-core-x11-xserver \ -  packagegroup-core-x11-utils \ -
> \ -  e-wm \ -  ${ECONFIG} \ -  ${ETHEME} \ +
> packagegroup-core-x11-xserver \ +    packagegroup-core-x11-utils \ +
> \ +    e-wm \ +    ${ECONFIG} \ +    ${ETHEME} \ " diff --git
> a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
> b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb index 1b782cd..33100c2
> 100644 --- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb +++
> b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb @@ -17,17 +17,17 @@ PR =
> "r2" SRCREV_FORMAT = "source"
> 
> SRC_URI = "\ -
> svn://svn.webkit.org/repository/webkit/trunk;module=Source;name=source;protocol=http;subdir=src
> \ -
> svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;protocol=http;subdir=src
> \ -
> svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;protocol=http;subdir=src
> \ -  file://CMakeLists.txt \ -  file://bison-2.6.patch \ +
> svn://svn.webkit.org/repository/webkit/trunk;module=Source;name=source;protocol=http;subdir=src
> \ +
> svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;protocol=http;subdir=src
> \ +
> svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;protocol=http;subdir=src
> \ +    file://CMakeLists.txt \ +    file://bison-2.6.patch \ "
> 
> S = "${WORKDIR}/src"
> 
> do_configure_prepend() { -  cp ${WORKDIR}/CMakeLists.txt ${S}; +    cp
> ${WORKDIR}/CMakeLists.txt ${S}; }
> 
> inherit cmake lib_package pkgconfig perlnative pythonnative diff --git
> a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
> b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb index 1e8a98b..388d240
> 100644 --- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb +++
> b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb @@ -17,5 +17,5 @@
> RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta" 
> EXTRA_OECONF += "--disable-scrollkeeper"
> 
> do_configure_prepend() { -	sed -i -e "s: help : :g" ${S}/Makefile.am +
> sed -i -e "s: help : :g" ${S}/Makefile.am } diff --git
> a/meta-gnome/recipes-connectivity/networkmanager/network-manager-applet_0.9.2.0.bb
> b/meta-gnome/recipes-connectivity/networkmanager/network-manager-applet_0.9.2.0.bb
>
> 
index 7939c1e..eecdf55 100644
> ---
> a/meta-gnome/recipes-connectivity/networkmanager/network-manager-applet_0.9.2.0.bb
>
> 
+++
b/meta-gnome/recipes-connectivity/networkmanager/network-manager-applet_0.9.2.0.bb
> @@ -15,21 +15,21 @@ EXTRA_OECONF += "--with-gtkver=2 \ "
> 
> do_configure_append() { -        rm config.log -        # Sigh...
> --enable-compile-warnings=no doesn't actually turn off -Werror -
> for i in $(find ${S} -name "Makefile") ; do -            sed -i -e
> s:-Werror::g $i -        done +    rm config.log +    # Sigh...
> --enable-compile-warnings=no doesn't actually turn off -Werror +    for i
> in $(find ${S} -name "Makefile") ; do +        sed -i -e s:-Werror::g $i 
> +    done }
> 
> RDEPENDS_${PN} =+ "networkmanager" RRECOMMENDS_${PN} =+ "gnome-bluetooth
> gnome-keyring"
> 
> FILES_${PN} += "${datadir}/nm-applet/ \ -
> ${datadir}/libnm-gtk/wifi.ui \ -        ${datadir}/gnome-vpn-properties/
> \ -        ${datadir}/gnome/autostart/ \ -        " +
> ${datadir}/libnm-gtk/wifi.ui \ +    ${datadir}/gnome-vpn-properties/ \ +
> ${datadir}/gnome/autostart/ \ +    "
> 
> FILES_${PN} += "${libdir}/gnome-bluetooth/plugins/*.so" FILES_${PN}-dev
> += "${libdir}/gnome-bluetooth/plugins/libnma.la" diff --git
> a/meta-gnome/recipes-gnome/abiword/abiword.inc
> b/meta-gnome/recipes-gnome/abiword/abiword.inc index 8fbcd3b..74b2ffa
> 100644 --- a/meta-gnome/recipes-gnome/abiword/abiword.inc +++
> b/meta-gnome/recipes-gnome/abiword/abiword.inc @@ -20,15 +20,15 @@ CVSSRC
> = "${WORKDIR}/abi" SHRT_VER =
> "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
> 
> FILES_${PN} += " \ -		${datadir}/icons/* \ -		${datadir}/mime-info \ -
> ${datadir}/abiword-${SHRT_VER}/glade \ -
> ${datadir}/abiword-${SHRT_VER}/system.profile-en \ -
> ${datadir}/abiword-${SHRT_VER}/system.profile-en-GB \ -  " +
> ${datadir}/icons/* \ +    ${datadir}/mime-info \ +
> ${datadir}/abiword-${SHRT_VER}/glade \ +
> ${datadir}/abiword-${SHRT_VER}/system.profile-en \ +
> ${datadir}/abiword-${SHRT_VER}/system.profile-en-GB \ +    "
> 
> -#		${datadir}/abiword-${SHRT_VER}/templates/normal.awt \ -#
> ${datadir}/abiword-${SHRT_VER}/templates/normal.awt-en_GB \ +#
> ${datadir}/abiword-${SHRT_VER}/templates/normal.awt \ +#
> ${datadir}/abiword-${SHRT_VER}/templates/normal.awt-en_GB \
> 
> inherit autotools pkgconfig
> 
> @@ -40,10 +40,10 @@ PARALLEL_MAKE = "" # --disable-exports options
> 
> EXTRA_OECONF = " --enable-embedded=poky    \ -		 --disable-printing   \ -
> --with-sys-wv 	     \ -		 --disable-exports    \ -
> --disable-spellcheck" +    --disable-printing \ +    --with-sys-wv \ +
> --disable-exports \ +    --disable-spellcheck"
> 
> # TODO -- refactor this, so that instead of two strings and profiles #
> packages we have lots of locale packages, each with a set of strings and 
> @@ -51,14 +51,14 @@ EXTRA_OECONF = " --enable-embedded=poky    \ # 
> PACKAGES += " abiword-strings abiword-systemprofiles"
> 
> -FILES_abiword-strings 		+= "${datadir}/abiword-${SHRT_VER}/strings" 
> -FILES_abiword-systemprofiles 	+=
> "${datadir}/abiword-${SHRT_VER}/system.profile*" +FILES_abiword-strings
> += "${datadir}/abiword-${SHRT_VER}/strings" +FILES_abiword-systemprofiles
> += "${datadir}/abiword-${SHRT_VER}/system.profile*"
> 
> # AbiWord configure.ac does not play nicely with autoreconf # so use the
> autogen.sh script that comes with AbiWord # do_configure() { -	cd ${S} -
> export NOCONFIGURE="no"; ./autogen.sh -	oe_runconf +    cd ${S} +
> export NOCONFIGURE="no"; ./autogen.sh +    oe_runconf } diff --git
> a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
> b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb index
> a2cd1cc..1aa88cb 100644 ---
> a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb +++
> b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb @@ -50,9 +50,9 @@
> do_configure() { }
> 
> do_install_append() { -        install -d ${D}${datadir}/pixmaps/ -
> mv ${D}${datadir}/icons/* ${D}${datadir}/pixmaps/ -        rmdir
> ${D}${datadir}/icons +    install -d ${D}${datadir}/pixmaps/ +    mv
> ${D}${datadir}/icons/* ${D}${datadir}/pixmaps/ +    rmdir
> ${D}${datadir}/icons }
> 
> PACKAGES += " ${PN}-clipart ${PN}-icons ${PN}-strings
> ${PN}-systemprofiles ${PN}-templates " diff --git
> a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc index d9a8618..a8e9250
> 100644 --- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc +++
> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc @@ -15,7 +15,7 @@
> ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
> 
> FILES_${PN} += "${libdir}/orbit-2.0/*.so ${libdir}/bonobo/monikers/*.so" 
> FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug \ -
> ${libdir}/bonobo-2.0/samples/.debug ${libdir}/orbit-2.0/.debug" +
> ${libdir}/bonobo-2.0/samples/.debug ${libdir}/orbit-2.0/.debug" 
> FILES_${PN}-dev += "${libdir}/orbit-2.0/*.la
> ${libdir}/bonobo/monikers/*.la ${libdir}/bonobo-2.0/samples" 
> FILES_${PN}-staticdev += "${libdir}/orbit-2.0/*.a
> ${libdir}/bonobo/monikers/*.a"
> 
> @@ -24,17 +24,17 @@ LEAD_SONAME = "libbonobo-2.so" PARALLEL_MAKE = ""
> 
> do_configure_prepend() { -	install -d m4 -	install ${WORKDIR}/gtk-doc.m4
> m4/ -	install ${WORKDIR}/gtk-doc.make ./ +    install -d m4 +    install
> ${WORKDIR}/gtk-doc.m4 m4/ +    install ${WORKDIR}/gtk-doc.make ./ }
> 
> do_compile() { -	oe_runmake ORBIT_IDL="${ORBIT_IDL_SRC}" +    oe_runmake
> ORBIT_IDL="${ORBIT_IDL_SRC}" }
> 
> do_install() { -	oe_runmake ORBIT_IDL="${ORBIT_IDL_SRC}" DESTDIR="${D}"
> install -	install -d ${D}${datadir}/idl/bonobo-activation-2.0/ -	install
> idl/*.idl ${D}${datadir}/idl/bonobo-activation-2.0/ +    oe_runmake
> ORBIT_IDL="${ORBIT_IDL_SRC}" DESTDIR="${D}" install +    install -d
> ${D}${datadir}/idl/bonobo-activation-2.0/ +    install idl/*.idl
> ${D}${datadir}/idl/bonobo-activation-2.0/ } diff --git
> a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb
> b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb index
> 05311fd..9e6ba90 100644 ---
> a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb +++
> b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb @@ -7,9 +7,9 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=00aefaa50aad75c21367df66102d542c
> \ DEPENDS = "gtk+ glib-2.0 libwnck lua5.1 virtual/libx11"
> 
> SRC_URI = " \ -
> http://www.gusnan.se/devilspie2/download/devilspie2_${PV}-src.tar.gz \ -
> file://default.lua \ -	file://devilspie2.desktop \ +
> http://www.gusnan.se/devilspie2/download/devilspie2_${PV}-src.tar.gz \ +
> file://default.lua \ +    file://devilspie2.desktop \ " SRC_URI[md5sum] =
> "90b354662659e2922bd051fdde3b0971" SRC_URI[sha256sum] =
> "9c94fa13ed8c0bf6914fdda513e21a4bd527821b97a53d8004168a8d465a646a" @@
> -17,14 +17,14 @@ SRC_URI[sha256sum] =
> "9c94fa13ed8c0bf6914fdda513e21a4bd527821b97a53d8004168a8d46 inherit
> pkgconfig
> 
> do_compile() { -	export GTK2=1 -	oe_runmake CC="${CC}"
> CPPFLAGS="${CPPFLAGS}" LDFLAGS=" -ldl -lm ${LDFLAGS}" +    export GTK2=1 
> +    oe_runmake CC="${CC}" CPPFLAGS="${CPPFLAGS}" LDFLAGS=" -ldl -lm
> ${LDFLAGS}" }
> 
> do_install() { -	oe_runmake DESTDIR="${D}" PREFIX="${prefix}" install -
> install -d ${D}/${sysconfdir}/devilspie2 -	install -m 644
> ${WORKDIR}/default.lua ${D}/${sysconfdir}/devilspie2 -	install -d
> ${D}/${sysconfdir}/xdg/autostart -	install -m 644
> ${WORKDIR}/devilspie2.desktop ${D}/${sysconfdir}/xdg/autostart +
> oe_runmake DESTDIR="${D}" PREFIX="${prefix}" install +    install -d
> ${D}/${sysconfdir}/devilspie2 +    install -m 644 ${WORKDIR}/default.lua
> ${D}/${sysconfdir}/devilspie2 +    install -d
> ${D}/${sysconfdir}/xdg/autostart +    install -m 644
> ${WORKDIR}/devilspie2.desktop ${D}/${sysconfdir}/xdg/autostart } diff
> --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
> b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb index
> 958a90c..23a6cef 100644 ---
> a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb +++
> b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb @@ -40,8
> +40,8 @@ LDFLAGS += "-lpthread" #PARALLEL_MAKE = ""
> 
> do_configure_append () { -        cp ${WORKDIR}/iconv-detect.h ${S} -
> sed -i 's/-DG_DISABLE_DEPRECATED//g' ${S}/libedataserver/Makefile +    cp
> ${WORKDIR}/iconv-detect.h ${S} +    sed -i 's/-DG_DISABLE_DEPRECATED//g'
> ${S}/libedataserver/Makefile }
> 
> EXTRA_OECONF = "--without-openldap --with-dbus --without-bug-buddy \ diff
> --git a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
> b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb index
> de02e26..495172d 100644 ---
> a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb +++
> b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb @@ -11,8 +11,8 @@
> SRC_URI[archive.sha256sum] =
> "278a5c00ce07e6a3ea440d289de22dbec3ebec4ded4ff3b4c4 EXTRA_OECONF += "
> --disable-nss --with-distributor-name=${DISTRO} --without-ca-file"
> 
> do_configure_prepend() { -        touch ${S}/gnome-doc-utils.make -
> sed -i -e s:help::g Makefile.am +    touch ${S}/gnome-doc-utils.make +
> sed -i -e s:help::g Makefile.am }
> 
> FILES_${PN} += "${datadir}/icons ${datadir}/dbus-1" diff --git
> a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
> b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb index 74958d8..d0d6566
> 100644 --- a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb +++
> b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb @@ -21,8 +21,8 @@
> EXTRA_OECONF = " --enable-thumbnailer \ "
> 
> do_install_append() { -	install -d install -d ${D}${datadir}/pixmaps -
> install -m 0755 ${S}/data/icons/48x48/apps/evince.png
> ${D}${datadir}/pixmaps/ +    install -d install -d
> ${D}${datadir}/pixmaps +    install -m 0755
> ${S}/data/icons/48x48/apps/evince.png ${D}${datadir}/pixmaps/ }
> 
> RDEPENDS_${PN} += "glib-2.0-utils" diff --git
> a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
> b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb index
> 88cf1d6..d5a1751 100644 ---
> a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb +++
> b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb @@ -14,5 +14,5
> @@ SRC_URI[sha256sum] =
> "346f645c0fdef900642f6e9a2c18e7ba9a7ca9bc62fe2b08eb418f065a inherit
> autotools pkgconfig gsettings
> 
> do_configure_prepend() { -	sed -i -e "s: help: :g" ${S}/Makefile.am +
> sed -i -e "s: help: :g" ${S}/Makefile.am } diff --git
> a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
> b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb index 45bddc8..182aec1
> 100644 --- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb +++
> b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb @@ -29,36 +29,36 @@
> EXTRA_OECONF = " --enable-authentication-scheme=shadow \ 
> --disable-scrollkeeper"
> 
> do_configure_prepend() { -	sed -i -e "s:\bdocs::g" ${S}/Makefile.am +
> sed -i -e "s:\bdocs::g" ${S}/Makefile.am }
> 
> do_install_prepend() { -	mkdir -p ${D}/var/lib/gdm/.gconf.mandatory -	cp
> ${WORKDIR}/%gconf-tree.xml ${D}/var/lib/gdm/.gconf.mandatory/ +    mkdir
> -p ${D}/var/lib/gdm/.gconf.mandatory +    cp ${WORKDIR}/%gconf-tree.xml
> ${D}/var/lib/gdm/.gconf.mandatory/ }
> 
> do_install_append() { -	install -d ${D}/${sysconfdir}/init.d -	install -m
> 0755 ${WORKDIR}/gdm ${D}/${sysconfdir}/init.d/ +    install -d
> ${D}/${sysconfdir}/init.d +    install -m 0755 ${WORKDIR}/gdm
> ${D}/${sysconfdir}/init.d/
> 
> -	install -d ${D}/${sysconfdir}/gdm -	install -m 0644 ${WORKDIR}/gdm.conf
> ${D}/${sysconfdir}/gdm/ +    install -d ${D}/${sysconfdir}/gdm +
> install -m 0644 ${WORKDIR}/gdm.conf ${D}/${sysconfdir}/gdm/
> 
> -	install -d ${D}/${sysconfdir}/pam.d -	install -m 0755
> ${WORKDIR}/gdm-pam       ${D}/${sysconfdir}/pam.d/gdm +    install -d
> ${D}/${sysconfdir}/pam.d +    install -m 0755 ${WORKDIR}/gdm-pam
> ${D}/${sysconfdir}/pam.d/gdm
> 
> -	install -d ${D}/${sysconfdir}/gdm/Init -	install -m 0755
> ${WORKDIR}/Default ${D}/${sysconfdir}/gdm/Init +    install -d
> ${D}/${sysconfdir}/gdm/Init +    install -m 0755 ${WORKDIR}/Default
> ${D}/${sysconfdir}/gdm/Init
> 
> -	install -d ${D}${systemd_unitdir}/system -	sed -e
> 's,%sbindir%,${sbindir},g' \ -		< ${WORKDIR}/gdm.service.in \ -		>
> ${D}${systemd_unitdir}/system/gdm.service +    install -d
> ${D}${systemd_unitdir}/system +    sed -e 's,%sbindir%,${sbindir},g' \ +
> < ${WORKDIR}/gdm.service.in \ +        >
> ${D}${systemd_unitdir}/system/gdm.service }
> 
> FILES_${PN} += "${datadir}/icon* \ -		${datadir}/xsession* \ -
> " +    ${datadir}/xsession* \ +"
> 
> RDEPENDS_${PN} += "grep dbus-x11 shadow" # "libpam-base-files" @@ -81,8
> +81,8 @@ pkg_postinst_${PN} () { grep "^gdm:" /etc/passwd > /dev/null ||
> adduser --disabled-password --system --home /var/lib/gdm gdm --ingroup
> gdm -g gdm
> 
> if [ -d /var/lib/gdm ]; then -  chown -R gdm:gdm /var/lib/gdm -  chmod
> 0750 /var/lib/gdm +    chown -R gdm:gdm /var/lib/gdm +    chmod 0750
> /var/lib/gdm fi
> 
> # Register up as default dm @@ -94,5 +94,5 @@ echo "${bindir}/gdm" >
> ${sysconfdir}/X11/default-display-manager pkg_postrm_${PN} () { deluser
> gdm || true delgroup gdm || true -	sed -i /gdm/d
> ${sysconfdir}/X11/default-display-manager || true +    sed -i /gdm/d
> ${sysconfdir}/X11/default-display-manager || true } diff --git
> a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
> b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb index 11e0945..11f1a60
> 100644 --- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb +++
> b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb @@ -16,8 +16,8 @@
> EXTRA_OECONF = "--disable-scrollkeeper \ --enable-gvfs-metadata"
> 
> do_configure_prepend() { -	gnome-doc-common --copy || true -
> gnome-doc-prepare --force --copy || true +    gnome-doc-common --copy ||
> true +    gnome-doc-prepare --force --copy || true }
> 
> FILES_${PN} += "${libdir}/gedit-2/plugin* ${datadir}/gedit-2" diff --git
> a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
> b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb 
> index 2b4ccbb..a2037cf 100644 ---
> a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb +++
> b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb @@
> -19,11 +19,11 @@ EXTRA_OECONF += "--enable-nautilus-sendto=no"
> 
> # No native docbook XSL stylesheets recipe in OE yet 
> do_configure_prepend() { -	sed -i s/help// Makefile.am +    sed -i
> s/help// Makefile.am }
> 
> do_configure_append() { -	sed -i 's,func_fatal_error "error: cannot
> install,echo "bogus message about,' ${HOST_SYS}-libtool +    sed -i
> 's,func_fatal_error "error: cannot install,echo "bogus message about,'
> ${HOST_SYS}-libtool }
> 
> RRECOMMENDS_${PN} += "obexd obex-data-server" diff --git
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
>
> 
index ea4ce4b..72b2905 100644
> ---
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
>
> 
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
> @@ -14,7 +14,7 @@ SRC_URI[archive.sha256sum] =
> "7c568b57358e5c08f4d8dd76dbac7df2539135ad081872b605 LDFLAGS +=
> "-lgthread-2.0 -lxml2"
> 
> do_configure_prepend() { -	sed -i s:help::g Makefile.am +    sed -i
> s:help::g Makefile.am }
> 
> FILES_${PN} += "${datadir}/icon* \ diff --git
> a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
> b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb index
> 612e88f..333f8cb 100644 ---
> a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb +++
> b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb @@ -16,8
> +16,8 @@ DEPENDS += "gconf libxrandr virtual/libx11 gtk+ glib-2.0
> gnome-doc-utils" EXTRA_OECONF = "--disable-scrollkeeper
> --disable-desktop-docs"
> 
> do_configure_prepend () { -	cp
> ${STAGING_DATADIR_NATIVE}/gnome-common/data/omf.make ${S} -	sed -i -e
> s:^#!@PYTHON@:#!${bindir}/python: ${S}/gnome-about/gnome-about.in +    cp
> ${STAGING_DATADIR_NATIVE}/gnome-common/data/omf.make ${S} +    sed -i -e
> s:^#!@PYTHON@:#!${bindir}/python: ${S}/gnome-about/gnome-about.in }
> 
> PACKAGES =+ "libgnome-desktop" diff --git
> a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
> b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
>
> 
index 595d9dc..f71318e 100644
> ---
> a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
>
> 
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
> @@ -12,15 +12,15 @@ SRC_URI[archive.md5sum] =
> "f0366c8baebca0404d190b2d78f3582d" SRC_URI[archive.sha256sum] =
> "03e461b6bda7f773f8018d25fa3213d3073d4dc83a76e6b39d962652f4de6a98"
> 
> SRC_URI += "\ -     file://disable-scrollkeeper.patch \ -
> file://fix-dbus-interfaces.patch \ -
> file://sysrooted-pkg-config.patch \ -     " +
> file://disable-scrollkeeper.patch \ +    file://fix-dbus-interfaces.patch
> \ +    file://sysrooted-pkg-config.patch \ +    "
> 
> EXTRA_OECONF += "--disable-scrollkeeper"
> 
> do_configure_prepend() { -       sed -i -e "s: help : :g"
> ${S}/Makefile.am +    sed -i -e "s: help : :g" ${S}/Makefile.am }
> 
> PACKAGES =+ "${PN}-nautilus-extension" diff --git
> a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
> b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb index
> 13614a0..9127ade 100644 ---
> a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb +++
> b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb @@ -27,13
> +27,13 @@ SRC_URI[archive.sha256sum] =
> "25db8ec026c4bf47f0ef5cc7e2712f2aad175bd7fb8e4952ef EXTRA_OECONF =
> "--disable-scrollkeeper --disable-eds --enable-bonobo=no
> --with-in-process-applets=none"
> 
> do_configure_prepend() { -	gnome-doc-prepare --automake -	sed -i -e
> s:help:: ${S}/Makefile.am +    gnome-doc-prepare --automake +    sed -i
> -e s:help:: ${S}/Makefile.am }
> 
> pkg_postinst_${PN}_append () { -	gconftool-2
> --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults \ -		--direct
> --load /etc/gconf/schemas/panel-default-setup.entries +    gconftool-2
> --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults \ +
> --direct --load /etc/gconf/schemas/panel-default-setup.entries }
> 
> PACKAGES =+ "libpanel-applet" diff --git
> a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
> b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb index
> e54579d..ca06c8f 100644 ---
> a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb +++
> b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb @@ -21,17
> +21,17 @@ S = "${WORKDIR}/git" EXTRA_OECONF = "--disable-scrollkeeper
> --disable-eds --enable-bonobo=no --with-in-process-applets=none"
> 
> do_configure_prepend() { -	gnome-doc-prepare --automake -	sed -i -e
> s:help:: ${S}/Makefile.am -	sed -i -e s:^#!@PYTHON@:#!/usr/bin/python:
> ${S}/gnome-panel/gnome-panel-add.in +    gnome-doc-prepare --automake +
> sed -i -e s:help:: ${S}/Makefile.am +    sed -i -e
> s:^#!@PYTHON@:#!/usr/bin/python: ${S}/gnome-panel/gnome-panel-add.in }
> 
> pkg_postinst_${PN}_append () { if [ -n "$D" ]; then -	exit 1 +    exit 1 
> fi -	gconftool-2
> --config-source=xml:readwrite:${sysconfdir}/gconf/gconf.xml.defaults \ -
> --direct --load ${sysconfdir}/gconf/schemas/panel-default-setup.entries +
> gconftool-2
> --config-source=xml:readwrite:${sysconfdir}/gconf/gconf.xml.defaults \ +
> --direct --load ${sysconfdir}/gconf/schemas/panel-default-setup.entries 
> }
> 
> PACKAGES =+ "libpanel-applet" diff --git
> a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
> b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
>
> 
index aeaf688..b2fc2d2 100644
> ---
> a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
>
> 
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
> @@ -24,29 +24,31 @@ EXTRA_OECONF = " --disable-scrollkeeper \ "
> 
> do_configure_prepend() { -        sed -i -e 's:	man	::g'
> ${S}/Makefile.am +    sed -i -e 's:    man    ::g' ${S}/Makefile.am }
> 
> do_configure_append() { -        rm config.log -        # Sigh...
> --enable-compile-warnings=no doesn't actually turn off -Werror -
> for i in $(find ${S} -name "Makefile") ; do -            sed -i -e
> s:-Werror::g $i -        done -		sed -e "s/libtool
> --/${TARGET_SYS}-libtool --/" -i ${S}/src/Makefile +    rm config.log +
> # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror 
> +    for i in $(find ${S} -name "Makefile") ; do +        sed -i -e
> s:-Werror::g $i +    done +    sed -e "s/libtool --/${TARGET_SYS}-libtool
> --/" -i ${S}/src/Makefile }
> 
> PACKAGES =+ "${PN}-applets"
> 
> FILES_${PN}-applets = "${bindir}/*applet* \ -
> ${libdir}/bonobo/servers \ -		       ${datadir}/gnome-2.0/ui" +
> ${libdir}/bonobo/servers \ +    ${datadir}/gnome-2.0/ui \ +"
> 
> FILES_${PN} += "${datadir}/icons \ -                ${datadir}/dbus-1 \ -
> ${datadir}/gnome/autostart \ -		" +    ${datadir}/dbus-1 \ +
> ${datadir}/gnome/autostart \ +"
> 
> FILES_${PN}-doc += "${datadir}/omf \ -
> ${datadir}/gnome/help " +    ${datadir}/gnome/help \ +"
> 
> diff --git
> a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
> b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb index
> e1fa519..93b0284 100644 ---
> a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb +++
> b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb @@
> -15,10 +15,10 @@ SRC_URI[archive.sha256sum] =
> "22d93ce433fcf9c7ce6b5f36dd81f64e692ea0e41faaa0f611 EXTRA_OECONF = "
> --with-gtk=2.0 ac_cv_path_GCONF_SANITY_CHECK=set --disable-docbook-docs"
> 
> do_configure_append() { -	for i in $(find ${S} -name "Makefile") ; do -
> sed -i -e s:"GCONFTOOL = .*/usr/bin/gconftool-2":"GCONFTOOL =
> /usr/bin/gconftool-2":g $i -		sed -i -e s:"GCONF_SANITY_CHECK =
> set":"GCONF_SANITY_CHECK = /usr/libexec/gconf-sanity-check-2":g $i -	done
>  +    for i in $(find ${S} -name "Makefile") ; do +        sed -i -e
> s:"GCONFTOOL = .*/usr/bin/gconftool-2":"GCONFTOOL =
> /usr/bin/gconftool-2":g $i +        sed -i -e s:"GCONF_SANITY_CHECK =
> set":"GCONF_SANITY_CHECK = /usr/libexec/gconf-sanity-check-2":g $i +
> done }
> 
> RRECOMMENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'pam',
> 'pam-plugin-ck-connector', '', d)}" diff --git
> a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
> b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
>
> 
index f5f394e..dcfea03 100644
> ---
> a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
>
> 
+++
b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
> @@ -20,7 +20,7 @@ EXTRA_OECONF = "--disable-esd \ "
> 
> do_configure_prepend() { -	sed -i -e 's:-L$libdir::g' -e
> 's:-I$includedir::g' configure.ac +    sed -i -e 's:-L$libdir::g' -e
> 's:-I$includedir::g' configure.ac }
> 
> FILES_${PN} += "${libdir}/gnome-settings-daemon-2.0/*.so
> ${libdir}/gnome-settings-daemon-2.0/*plugin \ diff --git
> a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
> b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
>
> 
index 98b7b8d..978beca 100644
> ---
> a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
>
> 
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
> @@ -12,13 +12,13 @@ SRC_URI[archive.sha256sum] =
> "b628edfd39e3a6b374ce133f367d3568475eb4e981a367f4f9 SRC_URI +=
> "file://0001-Fix-glib-includes.patch"
> 
> do_configure_prepend() { -        sed -i -e s:help::g ${S}/Makefile.am +
> sed -i -e s:help::g ${S}/Makefile.am }
> 
> FILES_${PN} += "${datadir}/icons \ ${datadir}/dbus-1 \ 
> ${datadir}/gnome/autostart \ -		" +        "
> 
> FILES_${PN}-doc += "${datadir}/omf \ ${datadir}/gnome/help " diff --git
> a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
> b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb index
> cfe7125..6804fc2 100644 ---
> a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb +++
> b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb @@ -21,7 +21,7
> @@ inherit gnome RPROVIDES_${PN} = "gnome-vfs-plugin-dbus"
> 
> SRC_URI += "file://gconftool-lossage.patch \ -
> file://gnome-vfs-no-kerberos.patch;striplevel=0" +
> file://gnome-vfs-no-kerberos.patch;striplevel=0"
> 
> SRC_URI[archive.md5sum] = "a05fab03eeef10a47dd156b758982f2e" 
> SRC_URI[archive.sha256sum] =
> "62de64b5b804eb04104ff98fcd6a8b7276d510a49fbd9c0feb568f8996444faa" @@
> -33,7 +33,7 @@ EXTRA_OECONF = " --disable-hal \ ac_cv_lib_sec_acl=no \ 
> gvfs_cv_HAVE_SOLARIS_ACLS=no \ gvfs_cv_HAVE_POSIX_ACLS=no \ -		 " +
> "
> 
> FILES_${PN} += "${libdir}/vfs ${datadir}/dbus-1/services" FILES_${PN}-dbg
> += "${libdir}/gnome-vfs-2.0/modules/.debug" diff --git
> a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
> b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb index
> f317997..8f4a6eb 100644 ---
> a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb +++
> b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb @@ -9,13 +9,13 @@
> PR = "r2" inherit gnome pkgconfig
> 
> do_compile_append () { -	cp libgnomecups-1.0.pc libgnomecups-1.0.pc.old -
> sed 's:${STAGING_DIR_HOST}::' < libgnomecups-1.0.pc.old >
> libgnomecups-1.0.pc +    cp libgnomecups-1.0.pc libgnomecups-1.0.pc.old +
> sed 's:${STAGING_DIR_HOST}::' < libgnomecups-1.0.pc.old >
> libgnomecups-1.0.pc }
> 
> SRC_URI += "\ -  file://libgnomecups-0.2.3-glib.h.patch \ -
> file://libgnomecups-0.2.3-cups-1.6.patch \ +
> file://libgnomecups-0.2.3-glib.h.patch \ +
> file://libgnomecups-0.2.3-cups-1.6.patch \ "
> 
> SRC_URI[archive.md5sum] = "dc4920c15c9f886f73ea74fbff0ae48b" diff --git
> a/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
> b/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb index
> f2e4ec5..640882a 100644 ---
> a/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb +++
> b/meta-gnome/recipes-gnome/gnome/libgnomekbd_2.26.0.bb @@ -6,8 +6,8 @@
> DEPENDS = "gconf-dbus dbus libxklavier gtk+" inherit gnome
> 
> do_configure_append() { -        find ${S} -name Makefile | xargs sed -i
> s:'-I$(includedir)':'-I.':g -        find ${S} -name Makefile | xargs sed
> -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g +    find ${S} -name
> Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g +    find ${S} -name
> Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g }
> 
> 
> diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
> b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb index
> 8c8574a..8e31f1d 100644 ---
> a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb +++
> b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb @@ -15,10 +15,10
> @@ SRC_URI[archive.md5sum] = "d66b81ee8aa3b3a33f5efc9a47ce07e3" 
> SRC_URI[archive.sha256sum] =
> "8b34f81599423ef3da9c43775495da602f83cbbee069c9e760ffeae6aa4768e6"
> 
> FILES_${PN}-dbg += "\ -  ${libdir}/${PN}/${PV}/modules/.debug \ -
> ${libdir}/${PN}/${PV}/modules/*/.debug \ +
> ${libdir}/${PN}/${PV}/modules/.debug \ +
> ${libdir}/${PN}/${PV}/modules/*/.debug \ " FILES_${PN}-staticdev += "\ -
> ${libdir}/${PN}/${PV}/modules/*.a \ -
> ${libdir}/${PN}/${PV}/modules/*/*.a \ +
> ${libdir}/${PN}/${PV}/modules/*.a \ +
> ${libdir}/${PN}/${PV}/modules/*/*.a \ " diff --git
> a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
> b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb index 0414386..2cac8aa
> 100644 --- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb +++
> b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb @@ -16,7 +16,7 @@
> SRC_URI[archive.sha256sum] =
> "cf809695230ab8892a078be454a42ade865754c72ec1da7c3d SRC_URI +=
> "file://parallel.patch"
> 
> do_install_append () { -	rm ${D}${libdir}/${BPN}/extensions/*.a +    rm
> ${D}${libdir}/${BPN}/extensions/*.a }
> 
> FILES_${PN} += "${datadir}/icons" diff --git
> a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
> b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb index
> 3bc6b2b..8fe72ed 100644 ---
> a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb +++
> b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb @@
> -12,18 +12,18 @@ EXTRA_OECONF += "--disable-gphoto2 \ --disable-samba"
> 
> do_install_append() { -	rm -rf ${D}${sysconfdir} -	rm -rf ${D}${bindir} -
> rm -rf ${D}${includedir} -	rm -rf ${D}${libdir}/gio -	rm -rf
> ${D}${libdir}/lib* -	rmdir --ignore-fail-on-non-empty ${D}${libdir} -	rm
> -rf ${D}${datadir}/gvfs/mounts -	rm -rf ${D}${datadir}/glib-2.0 -	rm -rf
> ${D}${datadir}/GConf -	rm -f ${D}${datadir}/dbus-1/services/gvfs-* -	rm
> -rf ${D}${datadir}/locale -	rm -f ${D}${libexecdir}/gvfsd* -	rm -f
> ${D}${libexecdir}/gvfs-fuse-daemon -	rm -f
> ${D}${libexecdir}/gvfs-gphoto2-volume-monitor +    rm -rf
> ${D}${sysconfdir} +    rm -rf ${D}${bindir} +    rm -rf
> ${D}${includedir} +    rm -rf ${D}${libdir}/gio +    rm -rf
> ${D}${libdir}/lib* +    rmdir --ignore-fail-on-non-empty ${D}${libdir} +
> rm -rf ${D}${datadir}/gvfs/mounts +    rm -rf ${D}${datadir}/glib-2.0 +
> rm -rf ${D}${datadir}/GConf +    rm -f
> ${D}${datadir}/dbus-1/services/gvfs-* +    rm -rf ${D}${datadir}/locale +
> rm -f ${D}${libexecdir}/gvfsd* +    rm -f
> ${D}${libexecdir}/gvfs-fuse-daemon +    rm -f
> ${D}${libexecdir}/gvfs-gphoto2-volume-monitor } diff --git
> a/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
> b/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb index
> 0e39707..5d6467f 100644 ---
> a/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb +++
> b/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb @@ -11,7 +11,7
> @@ SRC_URI[archive.md5sum] = "f1a96c6f19c9a0bc6b4e12acc9a8a85d" 
> SRC_URI[archive.sha256sum] =
> "9041526fa0466b99dae5cf06c2cc70376f25531eec5d58b1e1378acfb302410c"
> 
> do_configure_prepend() { -	sed -i -e 's: doc : :g' ${S}/Makefile.am +
> sed -i -e 's: doc : :g' ${S}/Makefile.am }
> 
> FILES_${PN} += "${datadir}/gnome* \ diff --git
> a/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
> b/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb index
> f54e9dc..09388fb 100644 ---
> a/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb +++
> b/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb @@ -10,7 +10,7
> @@ SRC_URI[archive.md5sum] = "bf6a0a05051341ecb250f332e3edfb88" 
> SRC_URI[archive.sha256sum] =
> "b835374661423f37c46aa8e37368ae24a68856f117b7c21e475a21efdba5264c"
> 
> do_configure_prepend() { -	sed -i -e 's: doc : :g' ${S}/Makefile.am +
> sed -i -e 's: doc : :g' ${S}/Makefile.am }
> 
> FILES_${PN} += "${datadir}/gnome* \ diff --git
> a/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
> b/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb 
> index 8d48dec..53786e9 100644 ---
> a/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb 
> +++
> b/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb 
> @@ -19,5 +19,5 @@ SRC_URI[sha256sum] =
> "9edca690617eaa19054951ca53501c802180262be8880ed84754ac46c9 FILES_${PN}
> += "${datadir}/icons"
> 
> do_install_append () { -	install -m 0644 ${WORKDIR}/index.theme
> ${D}/${datadir}/icons/hicolor +    install -m 0644 ${WORKDIR}/index.theme
> ${D}/${datadir}/icons/hicolor } diff --git
> a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
> b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb index
> 0c0a0df..0813973 100644 ---
> a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb +++
> b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb @@ -16,8 +16,8 @@
> EXTRA_OECONF += "--disable-gtk-doc"
> 
> do_configure_prepend() { sed -i -e s:docs::g ${S}/Makefile.am -	echo
> "EXTRA_DIST = version.xml" > gnome-doc-utils.make -	echo "EXTRA_DIST =
> version.xml" > gtk-doc.make +    echo "EXTRA_DIST = version.xml" >
> gnome-doc-utils.make +    echo "EXTRA_DIST = version.xml" > gtk-doc.make 
> }
> 
> FILES_${PN} += "${libdir}/bonobo/servers ${libdir}/bonobo/monikers/*.so
> \ diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
> b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb index
> d1ca977..4b773bd 100644 ---
> a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb +++
> b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb @@ -12,8 +12,8
> @@ SRC_URI[archive.md5sum] = "de32a6e3e3464b566eecdc4332bf34bd" 
> SRC_URI[archive.sha256sum] =
> "ddd52c4cc7d83ad7ef964a1bcb4db87407e65b00ffc3e70c088ca4ee7383d256"
> 
> do_configure_append() { -        find ${S} -name Makefile | xargs sed -i
> s:'-I$(includedir)':'-I.':g -        find ${S} -name Makefile | xargs sed
> -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g +    find ${S} -name
> Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g +    find ${S} -name
> Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g }
> 
> 
> diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc
> b/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc index bf9ae69..8f55909
> 100644 --- a/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc +++
> b/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc @@ -19,6 +19,6 @@
> SRC_URI += "file://gnome-stock-pixbufs.h file://no-pixbuf-csource.patch" 
> EXTRA_OECONF = "--disable-gtk-doc"
> 
> do_configure_prepend() { -	install -m 0644
> ${WORKDIR}/gnome-stock-pixbufs.h
> ${S}/libgnomeui/pixmaps/gnome-stock-pixbufs.h +    install -m 0644
> ${WORKDIR}/gnome-stock-pixbufs.h
> ${S}/libgnomeui/pixmaps/gnome-stock-pixbufs.h }
> 
> diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
> b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb index
> a4f1ec2..1157962 100644 ---
> a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb +++
> b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb @@ -15,9 +15,9 @@
> SRC_URI[archive.md5sum] = "2b702648b853402554c97d75405c60d3" 
> SRC_URI[archive.sha256sum] =
> "eef0a9d6eca4e6af6c16b208947e3c958c428b94d22792bdd0b80c08a4b301db"
> 
> EXTRA_OECONF = "\ -		--without-python \ -		--without-gnome-vfs
> --without-bonobo \ -		--disable-gtk-doc \ -		--with-bz2" +
> --without-python \ +        --without-gnome-vfs --without-bonobo \ +
> --disable-gtk-doc \ +        --with-bz2"
> 
> RDEPENDS_${PN} = "gconf" diff --git
> a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
> b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb index
> 891b625..564a71c 100644 ---
> a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb +++
> b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb @@ -8,13
> +8,13 @@ PR = "r4" inherit autotools
> 
> SRC_URI = "http://burtonini.com/temp/${PN}-${PV}.tar.gz \ -
> file://gtkstylus.sh" +    file://gtkstylus.sh" SRC_URI[md5sum] =
> "fa1c82cd9fd2fafd7ff10d78eb5781c5" SRC_URI[sha256sum] =
> "383e0a22a537f653b8d41688277560f95678a042967198085ec7caa1a5cc2f4c"
> 
> do_install_append() { -	install -d ${D}/${sysconfdir}/X11/Xsession.d -
> install -m 755 ${WORKDIR}/gtkstylus.sh
> ${D}/${sysconfdir}/X11/Xsession.d/45gtkstylus +    install -d
> ${D}/${sysconfdir}/X11/Xsession.d +    install -m 755
> ${WORKDIR}/gtkstylus.sh ${D}/${sysconfdir}/X11/Xsession.d/45gtkstylus }
> 
> # Horrible but rpm falls over if you use '*' diff --git
> a/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
> b/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb index
> 3e91e97..0a590e3 100644 ---
> a/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb +++
> b/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb @@ -12,6 +12,6 @@
> SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516" 
> SRC_URI[archive.sha256sum] =
> "73b16a79bb2fed62dcf146b11c4405776cb96a09dce66379ca541da7dbd64210"
> 
> do_configure_prepend() { -	sed -i /GTK3/d configure.ac -	sed -i -e
> /test-gtk3/d -e 's/test-xy-stress \\/test-xy-stress/' tests/Makefile.am +
> sed -i /GTK3/d configure.ac +    sed -i -e /test-gtk3/d -e
> 's/test-xy-stress \\/test-xy-stress/' tests/Makefile.am } diff --git
> a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb
> b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb index
> df2dde1..a769a55 100644 ---
> a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb +++
> b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb @@ -12,14
> +12,14 @@ SRC_URI[archive.sha256sum] =
> "dfd94b17a752b2839281764f0a16af2b338024c8867c10fba7 EXTRA_OECONF =
> "--with-xkb-bin-base=${bindir}"
> 
> do_configure_append() { -        find ${S} -name Makefile | xargs sed -i
> s:'-I$(includedir)':'-I.':g -        find ${S} -name Makefile | xargs sed
> -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g +    find ${S} -name
> Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g +    find ${S} -name
> Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g }
> 
> do_compile_append() { -        sed -i -e s:${STAGING_DIR_TARGET}::g \ -
> -e s:/${TARGET_SYS}::g \ -                  libxklavier.pc +    sed -i -e
> s:${STAGING_DIR_TARGET}::g \ +           -e s:/${TARGET_SYS}::g \ +
> libxklavier.pc }
> 
> 
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
> b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb index
> 3605201..23e5dda 100644 ---
> a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb +++
> b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb @@ -20,10 +20,10
> @@ ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/metacity" 
> ALTERNATIVE_PRIORITY = "10"
> 
> EXTRA_OECONF += "--disable-verbose \ -	         --disable-xinerama" +
> --disable-xinerama"
> 
> do_configure_prepend() { -	sed -i -e 's:$ZENITY:$NOZENITY:g' -e
> 's:-Werror::g' ${S}/configure.in +    sed -i -e 's:$ZENITY:$NOZENITY:g'
> -e 's:-Werror::g' ${S}/configure.in }
> 
> FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center
> ${datadir}/gnome" diff --git
> a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
> b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb index
> 488df1c..4d4ddee 100644 ---
> a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb +++
> b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb @@ -24,8 +24,8 @@
> EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb
> --enable-nst-extensi export SYSROOT = "${STAGING_DIR_HOST}"
> 
> do_configure() { -	sed -i -e /docs/d Makefile.am -
> autotools_do_configure +    sed -i -e /docs/d Makefile.am +
> autotools_do_configure }
> 
> RDEPENDS_${PN} = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash glib-2.0-utils" 
> @@ -36,7 +36,7 @@ FILES_${PN} += "${datadir}/icons \ 
> ${libdir}/nautilus/extensions*/*.so \ " FILES_${PN}-dbg +=
> "/usr/libexec/.debug \ -  ${libdir}/nautilus/extensions*/.debug" +
> ${libdir}/nautilus/extensions*/.debug"
> 
> # Don't make nautils drag us in PRIVATE_LIBS =
> "libnautilus-extension.so.1" diff --git
> a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
> b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb index
> bc45342..0714815 100644 ---
> a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb +++
> b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb @@ -26,10 +26,10
> @@ EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb " export
> SYSROOT = "${STAGING_DIR_HOST}"
> 
> do_configure() { -	sed -i -e /docs/d Makefile.am -
> autotools_do_configure -	# We need native orbit-idl with target idl
> files. No way to say it in a clean way: -	find -name Makefile -exec sed
> -i
> '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}'
> {} \; +    sed -i -e /docs/d Makefile.am +    autotools_do_configure +
> # We need native orbit-idl with target idl files. No way to say it in a
> clean way: +    find -name Makefile -exec sed -i
> '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}'
> {} \; }
> 
> RDEPENDS_${PN} = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash glib-networking" 
> diff --git
> a/meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal_2.26.3.bb
> b/meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal_2.26.3.bb 
> index a177797..9bf6b6d 100644 ---
> a/meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal_2.26.3.bb +++
> b/meta-gnome/recipes-gnome/nonworking/gnome/gnome-terminal_2.26.3.bb @@
> -12,7 +12,7 @@ EXTRA_OECONF += "--disable-scrollkeeper"
> 
> # Remove an autogenerated file that needs to be rebuilt 
> do_configure_prepend () { -	rm -f ${S}/src/terminal-type-builtins.c +
> rm -f ${S}/src/terminal-type-builtins.c }
> 
> SRC_URI[archive.md5sum] = "0395af0d444ed4fbfabf65d3583119c8" diff --git
> a/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb
> b/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb
>
> 
index ef696f8..b353615 100644
> ---
> a/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb
>
> 
+++
b/meta-gnome/recipes-gnome/nonworking/system-tools/system-tools-backends_2.10.2.bb
> @@ -21,20 +21,20 @@ SRC_URI_append_angstrom = " \ EXTRA_OECONF = "
> --with-net-dbus=${libdir}/perl5 "
> 
> do_configure() { -	rm missing || true -	automake --add-missing -	sed -i
> -e 's:CC=$(CC):CC="$(CC)":g' ${S}/Net-DBus/Makefile.am -	sed -i -e
> 's:CC=$(CC):CC="$(CC)":g' ${S}/Net-DBus/Makefile.in -	libtoolize --force
> --install -	aclocal +    rm missing || true +    automake --add-missing +
> sed -i -e 's:CC=$(CC):CC="$(CC)":g' ${S}/Net-DBus/Makefile.am +    sed -i
> -e 's:CC=$(CC):CC="$(CC)":g' ${S}/Net-DBus/Makefile.in +    libtoolize
> --force --install +    aclocal gnu-configize -	oe_runconf -	cp
> ${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool ${S} +    oe_runconf +    cp
> ${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool ${S} }
> 
> do_install_append () { -	install -d ${D}/${sysconfdir}/init.d -	install
> -m 0755 ${WORKDIR}/system-tools-backends ${D}/${sysconfdir}/init.d/ +
> install -d ${D}/${sysconfdir}/init.d +    install -m 0755
> ${WORKDIR}/system-tools-backends ${D}/${sysconfdir}/init.d/ }
> 
> INITSCRIPT_NAME = "system-tools-backends" diff --git
> a/meta-gnome/recipes-gnome/pimlico/contacts.inc
> b/meta-gnome/recipes-gnome/pimlico/contacts.inc index e19727c..d3d64f7
> 100644 --- a/meta-gnome/recipes-gnome/pimlico/contacts.inc +++
> b/meta-gnome/recipes-gnome/pimlico/contacts.inc @@ -13,14 +13,14 @@
> EXTRA_OECONF += "--disable-gnome-vfs" EXTRA_OEMAKE +=
> "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1"
> 
> do_install_append () { -	install -d ${D}/${datadir}/pixmaps -	install -m
> 0644 ${WORKDIR}/stock_contact.png ${D}/${datadir}/pixmaps -	install -m
> 0644 ${WORKDIR}/stock_person.png ${D}/${datadir}/pixmaps +    install -d
> ${D}/${datadir}/pixmaps +    install -m 0644 ${WORKDIR}/stock_contact.png
> ${D}/${datadir}/pixmaps +    install -m 0644 ${WORKDIR}/stock_person.png
> ${D}/${datadir}/pixmaps }
> 
> FILES_${PN} += "${datadir}/pixmaps/stock_contact.png \ -
> ${datadir}/pixmaps/stock_person.png \ -		${datadir}/icons/hicolor" +
> ${datadir}/pixmaps/stock_person.png \ +        ${datadir}/icons/hicolor"
> 
> SRC_URI = "file://stock_contact.png \ file://stock_person.png \ diff
> --git a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
> b/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb index da6959b..bdc7f48
> 100644 --- a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb +++
> b/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb @@ -13,6 +13,6 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
> \ 
> file://src/contacts-gtk.c;endline=21;md5=1c2e3f55b215635eff4ba76f7696f8ee"
>
>  do_configure_prepend () { -	# It used 8 spaces to instead of a tab, but
> it doesn't work for us -	sed -i 's/^        $(MAKE) dist
> distdir=/\t$(MAKE) dist distdir/' Makefile.am +    # It used 8 spaces to
> instead of a tab, but it doesn't work for us +    sed -i 's/^
> $(MAKE) dist distdir=/\t$(MAKE) dist distdir/' Makefile.am } diff --git
> a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
> b/meta-gnome/recipes-gnome/pimlico/contacts_git.bb index 45a6a0d..28e5fe2
> 100644 --- a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb +++
> b/meta-gnome/recipes-gnome/pimlico/contacts_git.bb @@ -12,7 +12,7 @@ PR =
> "r4" S = "${WORKDIR}/git"
> 
> SRC_URI =+ "git://git.gnome.org/${BPN};protocol=git \ -
> file://make-382.patch" +        file://make-382.patch"
> 
> S = "${WORKDIR}/git"
> 
> diff --git a/meta-gnome/recipes-gnome/pimlico/dates_git.bb
> b/meta-gnome/recipes-gnome/pimlico/dates_git.bb index cf5343d..8966303
> 100644 --- a/meta-gnome/recipes-gnome/pimlico/dates_git.bb +++
> b/meta-gnome/recipes-gnome/pimlico/dates_git.bb @@ -12,7 +12,7 @@ PR =
> "r9" S = "${WORKDIR}/git"
> 
> SRC_URI = "git://git.gnome.org/${BPN};protocol=git \ -
> file://make-382.patch \ -	   file://dso_linking_change_build_fix.patch \ 
> -	   file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \ -          " +
> file://make-382.patch \ +    file://dso_linking_change_build_fix.patch \ 
> +    file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \ +" diff --git
> a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
> b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb index
> 8c15754..346b324 100644 ---
> a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb +++
> b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb @@ -13,7 +13,7
> @@ EXTRA_OECONF += "--enable-all-themes --disable-hicolor-check" inherit
> gnome perlnative
> 
> do_configure_prepend() { -	sed -i -e 's:`$PKG_CONFIG
> --variable=program_path
> icon-naming-utils`:${STAGING_DIR_NATIVE}${libdir}/icon-naming-utils:g'
> configure.in +    sed -i -e 's:`$PKG_CONFIG --variable=program_path
> icon-naming-utils`:${STAGING_DIR_NATIVE}${libdir}/icon-naming-utils:g'
> configure.in }
> 
> PACKAGES =+ " gnome-theme-crux gnome-theme-highcontrast
> gnome-theme-highcontrastinverse gnome-theme-highcontrastlargeprint
> gnome-theme-highcontrastlargeprintinverse gnome-theme-largeprint
> gnome-theme-mist" diff --git
> a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
> b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb index a1fa786..89d95de
> 100644 --- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb +++
> b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb @@ -13,6 +13,6 @@
> SRC_URI[archive.sha256sum] =
> "8838be041a07364b62a4281c971392e4a09bb01bb3237a836e EXTRA_OECONF +=
> "--disable-scrollkeeper" # remove -I/usr/include from zenity_CPPFLAGS 
> do_configure_prepend() { -	sed -i -e '/-I$(includedir)/d'
> src/Makefile.am +    sed -i -e '/-I$(includedir)/d' src/Makefile.am }
> 
> diff --git a/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
> b/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb index
> 637ee18..f15dba2 100644 ---
> a/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb +++
> b/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb @@ -19,25 +19,25
> @@ SRC_URI[archive.sha256sum] =
> "dd8caef5fefffbc53938fa619de9f58e7c4dc71a1803de1340 FILES_${PN}-dbg +=
> "${libdir}/goffice/${PV}/plugins/*/.debug"
> 
> RRECOMMENDS_${PN} = " \ -  goffice-plugin-plot-barcol \ -
> goffice-plugin-plot-distrib \ -  goffice-plugin-plot-pie \ -
> goffice-plugin-plot-radar \ -  goffice-plugin-plot-surface \ -
> goffice-plugin-plot-xy \ -  goffice-plugin-reg-linear \ -
> goffice-plugin-reg-logfit \ -  goffice-plugin-smoothing \ +
> goffice-plugin-plot-barcol \ +    goffice-plugin-plot-distrib \ +
> goffice-plugin-plot-pie \ +    goffice-plugin-plot-radar \ +
> goffice-plugin-plot-surface \ +    goffice-plugin-plot-xy \ +
> goffice-plugin-reg-linear \ +    goffice-plugin-reg-logfit \ +
> goffice-plugin-smoothing \ "
> 
> FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/*
> ${libdir}/lib*${SOLIBS} \ -            ${sysconfdir} ${sharedstatedir}
> ${localstatedir} \ -            ${base_bindir}/* ${base_sbindir}/* \ -
> ${base_libdir}/*${SOLIBS} \ -            ${datadir}/${PN} \ -
> ${datadir}/pixmaps ${datadir}/applications \ -            ${datadir}/idl
> ${datadir}/omf ${datadir}/sounds \ -
> ${libdir}/bonobo/servers" +    ${sysconfdir} ${sharedstatedir}
> ${localstatedir} \ +    ${base_bindir}/* ${base_sbindir}/* \ +
> ${base_libdir}/*${SOLIBS} \ +    ${datadir}/${PN} \ +
> ${datadir}/pixmaps ${datadir}/applications \ +    ${datadir}/idl
> ${datadir}/omf ${datadir}/sounds \ +    ${libdir}/bonobo/servers"
> 
> PACKAGES_DYNAMIC += "^goffice-plugin-.*"
> 
> diff --git a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
> b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb index
> c416ff5..b003119 100644 ---
> a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb +++
> b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb @@ -16,7 +16,7 @@
> GPE_TARBALL_SUFFIX = "bz2" inherit gpe autotools
> 
> SRC_URI +=
> "file://0001-Fix-the-ordering-of-LDADD-options-to-fix-a-compilati.patch
> \ -  file://use.libsoup-2.4.patch \ +    file://use.libsoup-2.4.patch \ 
> "
> 
> RREPLACES_${PN} = "gpe-screenshot" diff --git
> a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
> b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb index
> 8e504c1..df774ee 100644 ---
> a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb +++
> b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb @@ -10,7
> +10,7 @@ PR = "r5" inherit gpe pkgconfig autotools gtk-doc
> 
> SRC_URI += "file://pkgconfig.patch;striplevel=0 \ -
> file://glib-2.32.patch \ +    file://glib-2.32.patch \ " SRC_URI[md5sum]
> = "b85a839264a35d0faf9a1a38c486e189" SRC_URI[sha256sum] =
> "f96d30c09b0395ea4e146730fd52d9ea303b619bb139051d9f12d3f868a9e18c" diff
> --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
> b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb index
> 6f70edd..0b305f0 100644 ---
> a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb +++
> b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb @@ -50,9
> +50,9 @@ APPEND=${CMDLINE} ${CMDLINE_DEBUG} }
> 
> do_install () { -        install -d ${D}/boot -        install -m 0644
> boot.cfg ${D}/boot/boot.cfg -        install -m 0644 icon.xpm
> ${D}/boot/icon.xpm +    install -d ${D}/boot +    install -m 0644
> boot.cfg ${D}/boot/boot.cfg +    install -m 0644 icon.xpm
> ${D}/boot/icon.xpm }
> 
> PACKAGE_ARCH = "${MACHINE_ARCH}" diff --git
> a/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
> b/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc index
> 2a53f96..b06293c 100644 ---
> a/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc +++
> b/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc @@ -38,12 +38,12 @@
> inherit autotools EXTRA_OECONF = "--enable-delay=2
> --enable-evdev-rate=1000,250"
> 
> do_install () { -        install -d ${D}${bindir} -        install -m
> 0755 kexecboot ${D}${bindir}/ -        install -d ${D}/proc -
> install -d ${D}/mnt -        install -d ${D}/dev -        install -d
> ${D}/sys +    install -d ${D}${bindir} +    install -m 0755 kexecboot
> ${D}${bindir}/ +    install -d ${D}/proc +    install -d ${D}/mnt +
> install -d ${D}/dev +    install -d ${D}/sys }
> 
> PACKAGE_ARCH = "${MACHINE_ARCH}" @@ -51,5 +51,5 @@ PACKAGE_ARCH =
> "${MACHINE_ARCH}" FILES_${PN} += " ${bindir}/kexecboot /init /proc /mnt
> /dev /sys"
> 
> pkg_postinst_${PN} () { -        ln -sf ${bindir}/kexecboot $D/init +
> ln -sf ${bindir}/kexecboot $D/init } diff --git
> a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
> b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb index
> 56456f7..0c187d2 100644 ---
> a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb +++
> b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb @@ -14,14
> +14,14 @@ FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:" inherit cross
> 
> do_configure () { -        : +    : }
> 
> do_compile() { -        oe_runmake klcc +    oe_runmake klcc }
> 
> do_install() { -        install -d ${D}${base_bindir} -        install -m
> 0755 klcc/klcc ${D}${base_bindir}/${TARGET_PREFIX}klcc +    install -d
> ${D}${base_bindir} +    install -m 0755 klcc/klcc
> ${D}${base_bindir}/${TARGET_PREFIX}klcc } diff --git
> a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb
> b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb index
> 484134e..ffad585 100644 ---
> a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb +++
> b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb @@
> -6,7 +6,7 @@ KLIBC_UTILS_PKGNAME = "klibc-static-utils" FILESPATH =.
> "${FILE_DIRNAME}/klibc-${PV}:"
> 
> do_install() { -        : +    : }
> 
> PACKAGES_${PN} = "${PN}" diff --git
> a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc index
> cdcaafa..a626c96 100644 ---
> a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc +++
> b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc @@ -4,55 +4,54 @@
> KLIBC_UTILS_PKGNAME ?= "klibc-utils" # losetup goes in ${base_sbindir}
> 
> do_install_append() { +    install -d ${D}${base_bindir} +    install -d
> ${D}${base_sbindir}
> 
> -        install -d ${D}${base_bindir} -        install -d
> ${D}${base_sbindir} +    # debian packages kinit + kinit.shared but only
> sh.shared +    if [ "${KLIBC_UTILS_VARIANT}" = "shared" ]; then +
> install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit +        install
> -m 755 usr/kinit/kinit.shared ${D}${base_bindir}/kinit.shared +
> install -m 755 usr/dash/sh.shared ${D}${base_bindir}/sh.shared +    else 
> +        install -m 755 usr/dash/sh ${D}${base_bindir}/sh +
> install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit +    fi
> 
> -        # debian packages kinit + kinit.shared but only sh.shared -
> if [ "${KLIBC_UTILS_VARIANT}" = "shared" ]; then -            install -m
> 755 usr/kinit/kinit ${D}${base_bindir}/kinit -            install -m 755
> usr/kinit/kinit.shared ${D}${base_bindir}/kinit.shared -
> install -m 755 usr/dash/sh.shared ${D}${base_bindir}/sh.shared -
> else -            install -m 755 usr/dash/sh ${D}${base_bindir}/sh -
> install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit -        fi - -
> install -m 755 usr/gzip/gzip ${D}${base_bindir} -        install -m 755
> usr/kinit/fstype/${KLIBC_UTILS_VARIANT}/fstype ${D}${base_bindir} -
> install -m 755 usr/kinit/ipconfig/${KLIBC_UTILS_VARIANT}/ipconfig
> ${D}${base_bindir} -        install -m 755
> usr/kinit/nfsmount/${KLIBC_UTILS_VARIANT}/nfsmount ${D}${base_bindir} -
> install -m 755 usr/kinit/resume/${KLIBC_UTILS_VARIANT}/resume
> ${D}${base_bindir} -        install -m 755
> usr/kinit/run-init/${KLIBC_UTILS_VARIANT}/run-init ${D}${base_bindir} -
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/cat ${D}${base_bindir} -
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/chroot
> ${D}${base_bindir} -        install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/cpio ${D}${base_bindir} -        install
> -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/dd ${D}${base_bindir} -
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/dmesg ${D}${base_bindir} 
> -        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/false
> ${D}${base_bindir} -        install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/halt ${D}${base_bindir} -        install
> -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/kill ${D}${base_bindir} -
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ln ${D}${base_bindir} -
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/losetup
> ${D}${base_sbindir} -        install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/ls ${D}${base_bindir} -        install
> -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/minips ${D}${base_bindir} -
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/mkdir ${D}${base_bindir} 
> -        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/mkfifo
> ${D}${base_bindir} -        install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/mknod ${D}${base_bindir} -
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/mount ${D}${base_bindir} 
> -        install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/mv
> ${D}${base_bindir} -        install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/nuke ${D}${base_bindir} -        install
> -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/pivot_root ${D}${base_bindir} -
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/poweroff
> ${D}${base_bindir} -        install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/readlink ${D}${base_bindir} -
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/reboot
> ${D}${base_bindir} -        install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/sleep ${D}${base_bindir} -
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/sync ${D}${base_bindir} -
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/true ${D}${base_bindir} -
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/umount
> ${D}${base_bindir} -        install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/uname ${D}${base_bindir} -        ln -s
> gzip ${D}${base_bindir}/gunzip -        ln -s gzip
> ${D}${base_bindir}/zcat +    install -m 755 usr/gzip/gzip
> ${D}${base_bindir} +    install -m 755
> usr/kinit/fstype/${KLIBC_UTILS_VARIANT}/fstype ${D}${base_bindir} +
> install -m 755 usr/kinit/ipconfig/${KLIBC_UTILS_VARIANT}/ipconfig
> ${D}${base_bindir} +    install -m 755
> usr/kinit/nfsmount/${KLIBC_UTILS_VARIANT}/nfsmount ${D}${base_bindir} +
> install -m 755 usr/kinit/resume/${KLIBC_UTILS_VARIANT}/resume
> ${D}${base_bindir} +    install -m 755
> usr/kinit/run-init/${KLIBC_UTILS_VARIANT}/run-init ${D}${base_bindir} +
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/cat ${D}${base_bindir} +
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/chroot
> ${D}${base_bindir} +    install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/cpio ${D}${base_bindir} +    install -m
> 755 usr/utils/${KLIBC_UTILS_VARIANT}/dd ${D}${base_bindir} +    install
> -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/dmesg ${D}${base_bindir} +
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/false ${D}${base_bindir} 
> +    install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/halt
> ${D}${base_bindir} +    install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/kill ${D}${base_bindir} +    install -m
> 755 usr/utils/${KLIBC_UTILS_VARIANT}/ln ${D}${base_bindir} +    install
> -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/losetup ${D}${base_sbindir} +
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ls ${D}${base_bindir} +
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/minips
> ${D}${base_bindir} +    install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/mkdir ${D}${base_bindir} +    install -m
> 755 usr/utils/${KLIBC_UTILS_VARIANT}/mkfifo ${D}${base_bindir} +
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/mknod ${D}${base_bindir} 
> +    install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/mount
> ${D}${base_bindir} +    install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/mv ${D}${base_bindir} +    install -m
> 755 usr/utils/${KLIBC_UTILS_VARIANT}/nuke ${D}${base_bindir} +    install
> -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/pivot_root ${D}${base_bindir} +
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/poweroff
> ${D}${base_bindir} +    install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/readlink ${D}${base_bindir} +    install
> -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/reboot ${D}${base_bindir} +
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/sleep ${D}${base_bindir} 
> +    install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/sync
> ${D}${base_bindir} +    install -m 755
> usr/utils/${KLIBC_UTILS_VARIANT}/true ${D}${base_bindir} +    install -m
> 755 usr/utils/${KLIBC_UTILS_VARIANT}/umount ${D}${base_bindir} +
> install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/uname ${D}${base_bindir} 
> +    ln -s gzip ${D}${base_bindir}/gunzip +    ln -s gzip
> ${D}${base_bindir}/zcat }
> 
> EXTRA_KLIBC_DEPS = '${@base_conditional("KLIBC_UTILS_VARIANT", "shared",
> "${THIS_LIBKLIBC}", "", d)}' diff --git
> a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb
> b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb index
> 37cab84..96fd19e 100644 ---
> a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb +++
> b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb @@ -6,7 +6,7
> @@ KLIBC_UTILS_PKGNAME = "klibc-utils" FILESPATH =.
> "${FILE_DIRNAME}/klibc-${PV}:"
> 
> do_install() { -        : +    : }
> 
> PACKAGES_${PN} = "${PN}" diff --git
> a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> b/meta-initramfs/recipes-devtools/klibc/klibc.inc index fa31f73..b9b36ae
> 100644 --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc +++
> b/meta-initramfs/recipes-devtools/klibc/klibc.inc @@ -46,8 +46,7 @@
> EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \ "
> 
> do_configure () { - -        ln -sf "${STAGING_DIR_TARGET}${exec_prefix}"
> linux +    ln -sf "${STAGING_DIR_TARGET}${exec_prefix}" linux }
> 
> THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})" diff --git
> a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
> b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb index
> 8eaab2c..3d42b04 100644 ---
> a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb +++
> b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb @@ -3,19 +3,17 @@
> PR = "${INC_PR}.0" export INST = "${D}"
> 
> do_install() { +    oe_runmake install
> 
> -        oe_runmake install - -        # the crosscompiler is packaged by
> klcc-cross -        # remove klcc -        rm ${D}${base_bindir}/klcc -
> # remove now empty dir -        rmdir ${D}${base_bindir} - -
> install -d ${D}${base_libdir} -        install -m 755
> usr/klibc/klibc-*.so ${D}${base_libdir} -        (cd  ${D}${base_libdir};
> ln -s klibc-*.so klibc.so) +    # the crosscompiler is packaged by
> klcc-cross +    # remove klcc +    rm ${D}${base_bindir}/klcc +    #
> remove now empty dir +    rmdir ${D}${base_bindir}
> 
> +    install -d ${D}${base_libdir} +    install -m 755
> usr/klibc/klibc-*.so ${D}${base_libdir} +    (cd  ${D}${base_libdir}; ln
> -s klibc-*.so klibc.so) }
> 
> PACKAGES = "libklibc libklibc-staticdev libklibc-dev" diff --git
> a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb
> b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb 
> index edf8f3f..d4798e8 100644 ---
> a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb 
> +++
> b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb 
> @@ -9,9 +9,9 @@ KERNEL_IMAGE_SYMLINK_NAME =
> "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE} INITRAMFS_IMAGE =
> "initramfs-kexecboot-klibc-image"
> 
> do_populate_sysroot() { -        : +    : }
> 
> do_install() { -        : +    : } diff --git
> a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb
> b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb 
> index 47215b5..189f87b 100644 ---
> a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb 
> +++
> b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb 
> @@ -9,9 +9,9 @@ KERNEL_IMAGE_SYMLINK_NAME =
> "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE} INITRAMFS_IMAGE =
> "initramfs-kexecboot-klibc-image"
> 
> do_populate_sysroot() { -        : +    : }
> 
> do_install() { -        : +    : } diff --git
> a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
> b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc index
> f793236..b63f223 100644 ---
> a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc +++
> b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc @@ -16,6 +16,6 @@
> FILES_${PN}-dev += "${bindir}/gupnp-binding-tool" 
> SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
> 
> gupnp_sysroot_preprocess () { -	install -d
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ -	install -m 755
> ${D}${bindir}/gupnp-binding-tool
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ +    install -d
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ +    install -m 755
> ${D}${bindir}/gupnp-binding-tool
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ } diff --git
> a/meta-multimedia/recipes-connectivity/gupnp/no-vala.inc
> b/meta-multimedia/recipes-connectivity/gupnp/no-vala.inc index
> a4f3fb6..5a45cd1 100644 ---
> a/meta-multimedia/recipes-connectivity/gupnp/no-vala.inc +++
> b/meta-multimedia/recipes-connectivity/gupnp/no-vala.inc @@ -1,5 +1,5 @@ 
> do_configure_prepend () { -	# Vala needs gobject-introspection so won't
> work. Instead of depending -	# on vala-native just to run configure,
> comment out the Vala macro. -	sed -i -e 's/\(^[
> \t]*VALA_PROG_VAPIGEN\)/dnl \1/g' ${S}/configure.ac +    # Vala needs
> gobject-introspection so won't work. Instead of depending +    # on
> vala-native just to run configure, comment out the Vala macro. +    sed
> -i -e 's/\(^[ \t]*VALA_PROG_VAPIGEN\)/dnl \1/g' ${S}/configure.ac } diff
> --git a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
> b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb index
> c39acac..e259db6 100644 ---
> a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb +++
> b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb @@ -10,36 +10,36
> @@ SRCREV = "3fc7dfa68484" S = "${WORKDIR}/${BPN}"
> 
> do_configure() { -	sed -i -e s:/usr/include:${STAGING_INCDIR}:g
> util/av7110_loadkeys/generate-keynames.sh +    sed -i -e
> s:/usr/include:${STAGING_INCDIR}:g
> util/av7110_loadkeys/generate-keynames.sh }
> 
> do_install() { -	make DESTDIR=${D} install -	install -d ${D}/${bindir} -
> install -d ${D}/${docdir}/dvb-apps -	install -d
> ${D}/${docdir}/dvb-apps/scan -	install -d ${D}/${docdir}/dvb-apps/szap -
> chmod a+rx ${D}/${libdir}/*.so* - -	# Install tests -	install -m 0755
> ${S}/test/setvoltage      ${D}${bindir}/test_setvoltage -	install -m 0755
> ${S}/test/set22k          ${D}${bindir}/test_set22k -	install -m 0755
> ${S}/test/sendburst       ${D}${bindir}/test_sendburst -	install -m 0755
> ${S}/test/diseqc          ${D}${bindir}/test_diseqc -	install -m 0755
> ${S}/test/test_sections   ${D}${bindir}/ -	install -m 0755
> ${S}/test/test_av_play    ${D}${bindir}/ -	install -m 0755
> ${S}/test/test_stillimage ${D}${bindir}/ -	install -m 0755
> ${S}/test/test_dvr_play   ${D}${bindir}/ -	install -m 0755
> ${S}/test/test_tt         ${D}${bindir}/ -	install -m 0755
> ${S}/test/test_sec_ne     ${D}${bindir}/ -	install -m 0755
> ${S}/test/test_stc        ${D}${bindir}/ -	install -m 0755
> ${S}/test/test_av         ${D}${bindir}/ -	install -m 0755
> ${S}/test/test_vevent     ${D}${bindir}/ -	install -m 0755
> ${S}/test/test_pes        ${D}${bindir}/ -	install -m 0755
> ${S}/test/test_dvr        ${D}${bindir}/ - -	cp -pPR
> ${S}/util/szap/channels-conf* ${D}/${docdir}/dvb-apps/szap/ -	cp -pPR
> ${S}/util/szap/README   ${D}/${docdir}/dvb-apps/szap/ +    make
> DESTDIR=${D} install +    install -d ${D}/${bindir} +    install -d
> ${D}/${docdir}/dvb-apps +    install -d ${D}/${docdir}/dvb-apps/scan +
> install -d ${D}/${docdir}/dvb-apps/szap +    chmod a+rx
> ${D}/${libdir}/*.so* + +    # Install tests +    install -m 0755
> ${S}/test/setvoltage      ${D}${bindir}/test_setvoltage +    install -m
> 0755 ${S}/test/set22k          ${D}${bindir}/test_set22k +    install -m
> 0755 ${S}/test/sendburst       ${D}${bindir}/test_sendburst +    install
> -m 0755 ${S}/test/diseqc          ${D}${bindir}/test_diseqc +    install
> -m 0755 ${S}/test/test_sections   ${D}${bindir}/ +    install -m 0755
> ${S}/test/test_av_play    ${D}${bindir}/ +    install -m 0755
> ${S}/test/test_stillimage ${D}${bindir}/ +    install -m 0755
> ${S}/test/test_dvr_play   ${D}${bindir}/ +    install -m 0755
> ${S}/test/test_tt         ${D}${bindir}/ +    install -m 0755
> ${S}/test/test_sec_ne     ${D}${bindir}/ +    install -m 0755
> ${S}/test/test_stc        ${D}${bindir}/ +    install -m 0755
> ${S}/test/test_av         ${D}${bindir}/ +    install -m 0755
> ${S}/test/test_vevent     ${D}${bindir}/ +    install -m 0755
> ${S}/test/test_pes        ${D}${bindir}/ +    install -m 0755
> ${S}/test/test_dvr        ${D}${bindir}/ + +    cp -pPR
> ${S}/util/szap/channels-conf* ${D}/${docdir}/dvb-apps/szap/ +    cp -pPR
> ${S}/util/szap/README   ${D}/${docdir}/dvb-apps/szap/ }
> 
> python populate_packages_prepend () { diff --git
> a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb index
> 212bca1..ad69c66 100644 ---
> a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb +++
> b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb @@ -15,16 +15,16
> @@ PV = "3.3" S = "${WORKDIR}/git"
> 
> do_configure() { -	./configure --prefix=${prefix} \ -
> --libdir=${libdir} \ -	            --bindir=${bindir} \ -
> --datadir=${datadir} \ -	            --arch=${TARGET_ARCH} \ -
> --disable-bundle +    ./configure --prefix=${prefix} \ +
> --libdir=${libdir} \ +                --bindir=${bindir} \ +
> --datadir=${datadir} \ +                --arch=${TARGET_ARCH} \ +
> --disable-bundle }
> 
> do_install() { -	oe_runmake install DESTDIR=${D} +    oe_runmake install
> DESTDIR=${D} }
> 
> FILES_${PN} += "${datadir}/${BPN}" diff --git
> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb index
> c2e8ed1..80c802a 100644 ---
> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb +++
> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb @@ -27,16 +27,16
> @@ S = "${WORKDIR}/git" CCACHE = ""
> 
> CACHED_CONFIGUREVARS += " \ -
> ac_cv_path_PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python" \ +
> ac_cv_path_PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python" \ "
> 
> EXTRA_OECONF = " \ - --disable-rpath \ - --enable-libusb \ -
> --enable-airplay \ - --disable-optical-drive \ -
> --enable-external-libraries \ - ${@base_contains('DISTRO_FEATURES',
> 'opengl', '--enable-gl', '--enable-gles', d)} \ +    --disable-rpath \ +
> --enable-libusb \ +    --enable-airplay \ +    --disable-optical-drive \ 
> +    --enable-external-libraries \ +
> ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl',
> '--enable-gles', d)} \ "
> 
> FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations
> -fomit-frame-pointer -O4 -ffast-math" @@ -52,27 +52,27 @@ export
> STAGING_INCDIR export PYTHON_DIR
> 
> do_configure() { -	sh bootstrap -	oe_runconf +    sh bootstrap +
> oe_runconf }
> 
> PARALLEL_MAKE = ""
> 
> do_compile_prepend() { -	for i in $(find . -name "Makefile") ; do -		sed
> -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' $i -	done +    for i in
> $(find . -name "Makefile") ; do +        sed -i -e
> 's:I/usr/include:I${STAGING_INCDIR}:g' $i +    done
> 
> -	for i in $(find . -name "*.mak*" -o	-name "Makefile") ; do -		sed -i -e
> 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir):-rpath
> ${libdir}:g' $i -	done +    for i in $(find . -name "*.mak*" -o    -name
> "Makefile") ; do +        sed -i -e
> 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir):-rpath
> ${libdir}:g' $i +    done }
> 
> INSANE_SKIP_${PN} = "rpaths"
> 
> # on ARM architectures xbmc will use GLES which will make the regular
> wrapper fail, so start it directly do_install_append_arm() { -	sed -i -e
> 's:Exec=xbmc:Exec=${libdir}/xbmc/xbmc.bin:g'
> ${D}${datadir}/applications/xbmc.desktop +    sed -i -e
> 's:Exec=xbmc:Exec=${libdir}/xbmc/xbmc.bin:g'
> ${D}${datadir}/applications/xbmc.desktop }
> 
> FILES_${PN} += "${datadir}/xsessions ${datadir}/icons" diff --git
> a/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb
> b/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb index
> 210a409..b66160d 100644 ---
> a/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb +++
> b/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb @@ -7,25 +7,25 @@
> SRC_URI[md5sum] = "726cc2bd1a525929ff35ff9854c0ebab" SRC_URI[sha256sum] =
> "476b08c6436a96c024a53e788e7c945ce9b41cd8654165763444aa7e5245b7a5"
> 
> do_compile() { -	cd ${S}/make/linux -	oe_runmake
> CROSS="${TARGET_PREFIX}" +    cd ${S}/make/linux +    oe_runmake
> CROSS="${TARGET_PREFIX}" }
> 
> do_install() { -	cd ${S}/make/linux +    cd ${S}/make/linux
> 
> -	install -d ${D}${libdir} -	install -m 0644 libebml.a ${D}${libdir} -
> install -m 0755 libebml.so.* ${D}${libdir} -	cp -a libebml.so
> ${D}${libdir} +    install -d ${D}${libdir} +    install -m 0644
> libebml.a ${D}${libdir} +    install -m 0755 libebml.so.* ${D}${libdir} +
> cp -a libebml.so ${D}${libdir}
> 
> -	install -d ${D}${includedir}/ebml -	for i in ../../ebml/*.h; do -
> install -m 0644 $i ${D}${includedir}/ebml -	done +    install -d
> ${D}${includedir}/ebml +    for i in ../../ebml/*.h; do +        install
> -m 0644 $i ${D}${includedir}/ebml +    done
> 
> -	install -d ${D}${includedir}/ebml/c -	for i in ../../ebml/c/*.h; do -
> install -m 0644 $i ${D}${includedir}/ebml/c -	done +    install -d
> ${D}${includedir}/ebml/c +    for i in ../../ebml/c/*.h; do +
> install -m 0644 $i ${D}${includedir}/ebml/c +    done } diff --git
> a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.3.0.bb
> b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.3.0.bb index
> 3a3dd0e..cedd283 100644 ---
> a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.3.0.bb +++
> b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.3.0.bb @@ -9,25
> +9,25 @@ SRC_URI[md5sum] = "f4a8c411f09d39c754eb726efd616043" 
> SRC_URI[sha256sum] =
> "5231ec958571365e719a6fd3c220227af6cf0f14e0bd1bcf766ddbc068d18e69"
> 
> do_compile() { -	cd ${S}/make/linux -	oe_runmake
> CROSS="${TARGET_PREFIX}" +    cd ${S}/make/linux +    oe_runmake
> CROSS="${TARGET_PREFIX}" }
> 
> do_install() { -	cd ${S}/make/linux +    cd ${S}/make/linux
> 
> -	install -d ${D}${libdir} -	install -m 0644 libmatroska.a ${D}${libdir} 
> -	install -m 0755 libmatroska.so.* ${D}${libdir} -	cp -a libmatroska.so
> ${D}${libdir} +    install -d ${D}${libdir} +    install -m 0644
> libmatroska.a ${D}${libdir} +    install -m 0755 libmatroska.so.*
> ${D}${libdir} +    cp -a libmatroska.so ${D}${libdir}
> 
> -	install -d ${D}${includedir}/matroska -	for i in ../../matroska/*.h;
> do -		install -m 0644 $i ${D}${includedir}/matroska -	done +    install
> -d ${D}${includedir}/matroska +    for i in ../../matroska/*.h; do +
> install -m 0644 $i ${D}${includedir}/matroska +    done
> 
> -	install -d ${D}${includedir}/matroska/c -	for i in
> ../../matroska/c/*.h; do -		install -m 0644 $i
> ${D}${includedir}/matroska/c -	done +    install -d
> ${D}${includedir}/matroska/c +    for i in ../../matroska/c/*.h; do +
> install -m 0644 $i ${D}${includedir}/matroska/c +    done } diff --git
> a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
> b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb index
> e7f93d2..c0dfb66 100644 ---
> a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb +++
> b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb @@ -17,14
> +17,14 @@ EXTRA_OECONF = " --with-boost-libdir=${STAGING_LIBDIR} \
> 
> # remove some hardcoded searchpaths do_configure_prepend() { -	sed -i -e
> s:/usr/local/lib:${STAGING_LIBDIR}:g -e
> s:/usr/local/include:${STAGING_INCDIR}:g ac/ebml.m4 +    sed -i -e
> s:/usr/local/lib:${STAGING_LIBDIR}:g -e
> s:/usr/local/include:${STAGING_INCDIR}:g ac/ebml.m4 }
> 
> # Yeah, no makefile do_compile() { -	./drake +    ./drake }
> 
> do_install() { -	./drake install DESTDIR=${D} +    ./drake install
> DESTDIR=${D} } diff --git
> a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb
> b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb 
> index a76409a..6d81ed2 100644 ---
> a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb 
> +++
> b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb 
> @@ -14,8 +14,8 @@ SRC_URI[sha256sum] =
> "9cdee47bbbfa3de5aaa5cf3fc9e208ccd97e5079f6d8fa84a6d1f24a1b inherit
> autotools
> 
> do_install_append() { -	install -d ${D}${bindir} -        install -m 0755
> dms-info ${D}${bindir} +    install -d ${D}${bindir} +    install -m 0755
> dms-info ${D}${bindir} }
> 
> PACKAGES =+ "${PN}-tests" diff --git
> a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
> b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
>
> 
index cdce8d5..d23babe 100644
> ---
> a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
>
> 
+++ b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
> @@ -14,8 +14,8 @@ SRC_URI[sha256sum] =
> "d6623d98dd35ee32bc08349b4a22d12101dda38a2ece1e468ff0160e51 inherit
> autotools
> 
> do_install_append() { -	install -d ${D}${bindir} -        install -m 0755
> test/rendererconsole.py ${D}${bindir} +    install -d ${D}${bindir} +
> install -m 0755 test/rendererconsole.py ${D}${bindir} }
> 
> PACKAGES =+ "${PN}-tests" diff --git
> a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
> b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb index
> e2e41ea..1a0e1ba 100644 ---
> a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb +++
> b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb @@ -20,10
> +20,10 @@ S = "${WORKDIR}/mpg123-${PV}" inherit autotools pkgconfig
> 
> EXTRA_OECONF = " \ -	--enable-shared \ -
> ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)}
> \ -	${@bb.utils.contains('TUNE_FEATURES', 'altivec',
> '--with-cpu=altivec', '', d)} \ -	${@bb.utils.contains('DISTRO_FEATURES',
> 'alsa', '--with-default-audio=alsa', '', d)} \ -
> ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio',
> '--with-default-audio=pulse', '', d)} \ -	" +    --enable-shared \ +
> ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)}
> \ +    ${@bb.utils.contains('TUNE_FEATURES', 'altivec',
> '--with-cpu=altivec', '', d)} \ +
> ${@bb.utils.contains('DISTRO_FEATURES', 'alsa',
> '--with-default-audio=alsa', '', d)} \ +
> ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio',
> '--with-default-audio=pulse', '', d)} \ +    "
> 
> diff --git a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
> b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb index
> d736c7a..ae643c2 100644 ---
> a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb +++
> b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb @@ -20,15
> +20,15 @@ inherit python-dir pythonnative EXTRA_OEMAKE = "MAKEFLAGS=
> DESTDIR=${D}"
> 
> do_compile() { -	oe_runmake all_noverify +    oe_runmake all_noverify }
> 
> do_install() { -	oe_runmake install +    oe_runmake install
> 
> -	install -d ${D}${libdir}/crda/ +    install -d ${D}${libdir}/crda/
> 
> -	install -m 0644 ${WORKDIR}/2013.01.11-regulatory.bin
> ${D}${libdir}/crda/regulatory.bin +    install -m 0644
> ${WORKDIR}/2013.01.11-regulatory.bin ${D}${libdir}/crda/regulatory.bin }
> 
> 
> diff --git
> a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb index
> 155befe..9a32367 100644 ---
> a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb +++
> b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb @@
> -25,40 +25,40 @@ inherit autotools gettext
> 
> noipv6="${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6
> gl_cv_socket_ipv6=no', d)}" EXTRA_OECONF =
> "--with-ncurses-include-dir=${STAGING_INCDIR} \ -
> --with-path-procnet-dev=/proc/net/dev \ -		${noipv6} \ -		" +
> --with-path-procnet-dev=/proc/net/dev \ +        ${noipv6} \ +        "
> 
> do_configure_prepend () { -	export HELP2MAN='true' -	cp
> ${STAGING_DATADIR_NATIVE}/gettext/config.rpath
> ${S}/build-aux/config.rpath -	rm -f ${S}/glob/configure* +    export
> HELP2MAN='true' +    cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath
> ${S}/build-aux/config.rpath +    rm -f ${S}/glob/configure* }
> 
> do_install () { -	autotools_do_install -	install -d ${D}${base_sbindir}
> ${D}${base_bindir} -	mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${BPN} -	mv
> ${D}${bindir}/telnet ${D}${bindir}/telnet.${BPN} -	mv
> ${D}${bindir}/logger ${D}${bindir}/logger.${BPN} -	mv
> ${D}${bindir}/traceroute ${D}${bindir}/traceroute.${BPN} -	mv
> ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${BPN} -	mv
> ${D}${bindir}/ifconfig ${D}${base_sbindir}/ifconfig.${BPN} +
> autotools_do_install +    install -d ${D}${base_sbindir}
> ${D}${base_bindir} +    mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${BPN} +
> mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${BPN} +    mv
> ${D}${bindir}/logger ${D}${bindir}/logger.${BPN} +    mv
> ${D}${bindir}/traceroute ${D}${bindir}/traceroute.${BPN} +    mv
> ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${BPN} +    mv
> ${D}${bindir}/ifconfig ${D}${base_sbindir}/ifconfig.${BPN} }
> 
> pkg_postinst_${PN} () { -	update-alternatives --install ${bindir}/tftp
> tftp tftp.${BPN} 100 -	update-alternatives --install ${bindir}/telnet
> telnet telnet.${BPN} 100 -	update-alternatives --install ${bindir}/logger
> logger logger.${BPN} 100 -	update-alternatives --install
> ${bindir}/traceroute traceroute traceroute.${BPN} 100 -
> update-alternatives --install ${base_bindir}/hostname hostname
> hostname.${BPN} 100 -	update-alternatives --install
> ${base_sbindir}/ifconfig ifconfig ifconfig.${BPN} 100 +
> update-alternatives --install ${bindir}/tftp tftp tftp.${BPN} 100 +
> update-alternatives --install ${bindir}/telnet telnet telnet.${BPN} 100 +
> update-alternatives --install ${bindir}/logger logger logger.${BPN} 100 +
> update-alternatives --install ${bindir}/traceroute traceroute
> traceroute.${BPN} 100 +    update-alternatives --install
> ${base_bindir}/hostname hostname hostname.${BPN} 100 +
> update-alternatives --install ${base_sbindir}/ifconfig ifconfig
> ifconfig.${BPN} 100 }
> 
> pkg_prerm_${PN} () { -	update-alternatives --remove tftp tftp.${BPN} -
> update-alternatives --remove telnet telnet.${BPN} -	update-alternatives
> --remove logger logger.${BPN} -	update-alternatives --remove traceroute
> traceroute.${BPN} -	update-alternatives --remove ifconfig
> ifconfig.${BPN} +    update-alternatives --remove tftp tftp.${BPN} +
> update-alternatives --remove telnet telnet.${BPN} +
> update-alternatives --remove logger logger.${BPN} +
> update-alternatives --remove traceroute traceroute.${BPN} +
> update-alternatives --remove ifconfig ifconfig.${BPN} } diff --git
> a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb index
> 1b2b8bf..2ce9530 100644 ---
> a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb +++
> b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb @@ -12,10
> +12,10 @@ CFLAGS_append = ' -DVERSION=\\"${PV}\\"' LDFLAGS_append = "
> -lgcrypt -lgpg-error"
> 
> do_install () { -	sed -i s:m600:m\ 600:g Makefile -	oe_runmake
> 'DESTDIR=${D}' 'PREFIX=/usr' install -	rm -f
> ${D}${sysconfdir}/vpnc/vpnc.conf #This file is useless -	install
> ${WORKDIR}/default.conf ${D}${sysconfdir}/vpnc/default.conf +    sed -i
> s:m600:m\ 600:g Makefile +    oe_runmake 'DESTDIR=${D}' 'PREFIX=/usr'
> install +    rm -f ${D}${sysconfdir}/vpnc/vpnc.conf #This file is
> useless +    install ${WORKDIR}/default.conf
> ${D}${sysconfdir}/vpnc/default.conf }
> 
> CONFFILES_${PN} = "${sysconfdir}/vpnc/default.conf" diff --git
> a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb index
> 8db4378..0ab5163 100644 ---
> a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb +++
> b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb @@ -87,13 +87,13
> @@ CACHED_CONFIGUREVARS = "ac_cv_path_RANLIB=${RANLIB} \ "
> 
> do_configure_prepend () { -        if [ ! -e acinclude.m4 ]; then -
> cp aclocal.m4 acinclude.m4 -        fi +    if [ ! -e acinclude.m4 ];
> then +        cp aclocal.m4 acinclude.m4 +    fi }
> 
> do_install_append () { -	test -d ${D}/run && rmdir ${D}/run +    test -d
> ${D}/run && rmdir ${D}/run }
> 
> INSANE_SKIP_${PN} = "dev-so" diff --git
> a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb index
> db24b35..a53080e 100644 ---
> a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb +++
> b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb @@ -21,32
> +21,32 @@ inherit autotools useradd update-rc.d
> 
> EXTRA_OECONF = "--disable-cap \ --disable-auth-pam \ -		" +"
> 
> # proftpd uses libltdl which currently makes configuring using #
> autotools.bbclass a pain... do_configure () { -	oe_runconf +
> oe_runconf }
> 
> FTPUSER = "ftp" FTPGROUP = "ftp"
> 
> do_install () { -	oe_runmake DESTDIR=${D} install -	rmdir
> ${D}${libdir}/proftpd ${D}${datadir}/locale -	[ -d ${D}${libexecdir} ] &&
> rmdir ${D}${libexecdir} -	sed -i '/ *User[ \t]*/s/ftp/${FTPUSER}/'
> ${D}${sysconfdir}/proftpd.conf -	sed -i '/ *Group[
> \t]*/s/ftp/${FTPGROUP}/' ${D}${sysconfdir}/proftpd.conf -	install -d
> ${D}${sysconfdir}/init.d -	install -m 0755 ${WORKDIR}/proftpd-basic.init
> ${D}${sysconfdir}/init.d/proftpd -	sed -i 's!/usr/sbin/!${sbindir}/!g'
> ${D}${sysconfdir}/init.d/proftpd -	sed -i 's!/etc/!${sysconfdir}/!g'
> ${D}${sysconfdir}/init.d/proftpd -	sed -i 's!/var/!${localstatedir}/!g'
> ${D}${sysconfdir}/init.d/proftpd -	sed -i
> 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'
> ${D}${sysconfdir}/init.d/proftpd +    oe_runmake DESTDIR=${D} install +
> rmdir ${D}${libdir}/proftpd ${D}${datadir}/locale +    [ -d
> ${D}${libexecdir} ] && rmdir ${D}${libexecdir} +    sed -i '/ *User[
> \t]*/s/ftp/${FTPUSER}/' ${D}${sysconfdir}/proftpd.conf +    sed -i '/
> *Group[ \t]*/s/ftp/${FTPGROUP}/' ${D}${sysconfdir}/proftpd.conf +
> install -d ${D}${sysconfdir}/init.d +    install -m 0755
> ${WORKDIR}/proftpd-basic.init ${D}${sysconfdir}/init.d/proftpd +    sed
> -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/proftpd +    sed
> -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/proftpd +    sed
> -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/proftpd +
> sed -i
> 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'
> ${D}${sysconfdir}/init.d/proftpd
> 
> -	install -d ${D}${sysconfdir}/default -	install -m 0755
> ${WORKDIR}/default ${D}${sysconfdir}/default/proftpd +    install -d
> ${D}${sysconfdir}/default +    install -m 0755 ${WORKDIR}/default
> ${D}${sysconfdir}/default/proftpd }
> 
> INITSCRIPT_NAME = "proftpd" diff --git
> a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> b/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb index
> 39a0cdd..f2e895d 100644 ---
> a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb +++
> b/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb @@ -22,7 +22,7 @@ S
> = "${WORKDIR}/ptpd-${PV}/src" EXTRA_OEMAKE = ""
> 
> do_install() { -        install -d ${D}${bindir} ${D}${mandir}/man8 -
> install -m 0755 ptpd2 ${D}${bindir} -        install -m 0644 ptpd2.8
> ${D}${mandir}/man8 +    install -d ${D}${bindir} ${D}${mandir}/man8 +
> install -m 0755 ptpd2 ${D}${bindir} +    install -m 0644 ptpd2.8
> ${D}${mandir}/man8 } diff --git
> a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb
> b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb index
> 871ab6e..fb96549 100644 ---
> a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb +++
> b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb @@ -9,7
> +9,7 @@ PR = "r0"
> 
> SRC_URI =
> "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.tar.gz
> \ file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
> \ -	   file://nostrip.patch \ +           file://nostrip.patch \ " 
> SRC_URI[md5sum] = "bbcb48e8aa6ec1abff9775b89f84af91" SRC_URI[sha256sum] =
> "90fb63b1a9d448076aa9f3e3c74b298965f98e03c824e9a4d241fffe8eb3a130" diff
> --git a/meta-networking/recipes-daemons/radvd/radvd.inc
> b/meta-networking/recipes-daemons/radvd/radvd.inc index 4061279..89669f7
> 100644 --- a/meta-networking/recipes-daemons/radvd/radvd.inc +++
> b/meta-networking/recipes-daemons/radvd/radvd.inc @@ -14,21 +14,21 @@
> SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \ 
> inherit autotools update-rc.d useradd
> 
> do_install_append () { -	install -m 0755 -d ${D}${sysconfdir}/init.d \ -
> ${D}${sysconfdir}/default/volatiles \ -
> ${D}${docdir}/radvd -	# Install init script and volatiles -	install -m
> 0755 ${WORKDIR}/radvd.init ${D}${sysconfdir}/init.d/radvd -	sed -i
> 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/radvd -	sed -i
> 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/radvd -	sed -i
> 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/radvd -	sed -i
> 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'
> ${D}${sysconfdir}/init.d/radvd - -	install -m 0644
> ${WORKDIR}/volatiles.03_radvd
> ${D}${sysconfdir}/default/volatiles/volatiles.03_radvd -	# Documentation 
> -	for i in radvd.conf.example README; do \ -		install -m 0644 $i
> ${D}${docdir}/radvd; \ -	done +    install -m 0755 -d
> ${D}${sysconfdir}/init.d \ +
> ${D}${sysconfdir}/default/volatiles \ +
> ${D}${docdir}/radvd +    # Install init script and volatiles +    install
> -m 0755 ${WORKDIR}/radvd.init ${D}${sysconfdir}/init.d/radvd +    sed -i
> 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/radvd +    sed -i
> 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/radvd +    sed -i
> 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/radvd +    sed -i
> 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'
> ${D}${sysconfdir}/init.d/radvd + +    install -m 0644
> ${WORKDIR}/volatiles.03_radvd
> ${D}${sysconfdir}/default/volatiles/volatiles.03_radvd +    #
> Documentation +    for i in radvd.conf.example README; do \ +
> install -m 0644 $i ${D}${docdir}/radvd; \ +    done }
> 
> INITSCRIPT_NAME = "radvd" @@ -38,5 +38,5 @@ USERADD_PACKAGES = "${PN}" 
> USERADD_PARAM_${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g
> nogroup radvd"
> 
> pkg_postinst_${PN} () { -
> ${sysconfdir}/init.d/populate-volatile.sh update +
> ${sysconfdir}/init.d/populate-volatile.sh update } diff --git
> a/meta-networking/recipes-daemons/radvd/radvd_1.9.1.bb
> b/meta-networking/recipes-daemons/radvd/radvd_1.9.1.bb index
> 37c224b..0dccded 100644 ---
> a/meta-networking/recipes-daemons/radvd/radvd_1.9.1.bb +++
> b/meta-networking/recipes-daemons/radvd/radvd_1.9.1.bb @@ -6,4 +6,4 @@
> SRC_URI[md5sum] = "e807ad7e9a76d46b6133df391385cd31" SRC_URI[sha256sum] =
> "54eb5704a2b710ba946fa30d2bca811fa23b1b3bfab322c38cb0c2a9619aa933"
> 
> SRC_URI += "\ -	file://change-scanner-dependency.patch" +
> file://change-scanner-dependency.patch" diff --git
> a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb index
> af48455..cb5b234 100644 ---
> a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb +++
> b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb @@ -34,24
> +34,24 @@ EXTRA_OECONF += "--disable-option-checking"
> 
> # configure.in has errors do_configure() { -	oe_runconf +    oe_runconf 
> }
> 
> do_install() { -	oe_runmake install INSTALLROOT=${D} -	mv
> ${D}${bindir}/tftp ${D}${bindir}/tftp-hpa -	mv ${D}${sbindir}/in.tftpd
> ${D}${sbindir}/in.tftpd-hpa +    oe_runmake install INSTALLROOT=${D} +
> mv ${D}${bindir}/tftp ${D}${bindir}/tftp-hpa +    mv
> ${D}${sbindir}/in.tftpd ${D}${sbindir}/in.tftpd-hpa
> 
> -	install -m 755 -d ${D}${localstatedir}/lib/tftpboot/ -	install -d
> ${D}${sysconfdir}/init.d -	install -m 0755 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/tftpd-hpa -	sed -i 's!/usr/sbin/!${sbindir}/!g'
> ${D}${sysconfdir}/init.d/tftpd-hpa -	sed -i 's!/etc/!${sysconfdir}/!g'
> ${D}${sysconfdir}/init.d/tftpd-hpa -	sed -i 's!/var/!${localstatedir}/!g'
> ${D}${sysconfdir}/init.d/tftpd-hpa -	sed -i
> 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'
> ${D}${sysconfdir}/init.d/tftpd-hpa +    install -m 755 -d
> ${D}${localstatedir}/lib/tftpboot/ +    install -d
> ${D}${sysconfdir}/init.d +    install -m 0755 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/tftpd-hpa +    sed -i
> 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa +    sed
> -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa +    sed
> -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa +
> sed -i
> 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'
> ${D}${sysconfdir}/init.d/tftpd-hpa
> 
> -	install -d ${D}${sysconfdir}/default -	install -m 0644
> ${WORKDIR}/default ${D}${sysconfdir}/default/tftpd-hpa +    install -d
> ${D}${sysconfdir}/default +    install -m 0644 ${WORKDIR}/default
> ${D}${sysconfdir}/default/tftpd-hpa }
> 
> FILES_${PN} = "${bindir}" diff --git
> a/meta-networking/recipes-daemons/vblade/vblade_20.bb
> b/meta-networking/recipes-daemons/vblade/vblade_20.bb index
> 3756d53..5b7c167 100644 ---
> a/meta-networking/recipes-daemons/vblade/vblade_20.bb +++
> b/meta-networking/recipes-daemons/vblade/vblade_20.bb @@ -5,7 +5,7 @@
> LICENSE = "GPLv2" LIC_FILES_CHKSUM =
> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> 
> SRC_URI = "${SOURCEFORGE_MIRROR}/aoetools/${BPN}-${PV}.tgz \ -
> file://cross.patch" +       file://cross.patch"
> 
> SRC_URI[md5sum] = "3c80e4a6bc7d66ae0c235b88cb44bd59" SRC_URI[sha256sum] =
> "c8fe2fc4f2fba8e07e5cfdf17335982584eef2cd5c78bf8b1db93f2b56e7121d" @@
> -13,8 +13,8 @@ SRC_URI[sha256sum] =
> "c8fe2fc4f2fba8e07e5cfdf17335982584eef2cd5c78bf8b1db93f2b56 inherit
> autotools
> 
> do_install() { -	install -D -m 0755 ${S}/vblade ${D}/${sbindir}/vblade -
> install -D -m 0755 ${S}/vbladed ${D}/${sbindir}/vbladed -	install -D -m
> 0644 ${S}/vblade.8 ${D}/${mandir}/man8/vblade.8 +    install -D -m 0755
> ${S}/vblade ${D}/${sbindir}/vblade +    install -D -m 0755 ${S}/vbladed
> ${D}/${sbindir}/vbladed +    install -D -m 0644 ${S}/vblade.8
> ${D}/${mandir}/man8/vblade.8 }
> 
> diff --git
> a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
> b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
>
> 
index 9938e24..aac038a 100644
> ---
> a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
>
> 
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.0.bb
> @@ -7,10 +7,10 @@ DEPENDS = "libnfnetlink libnetfilter-conntrack
> libnetfilter-cttimeout \ PR = "r0"
> 
> SRC_URI = " \ -
> http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2;name=tar
> \ -	file://conntrack-failover \ -	file://init \ -	" +
> http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2;name=tar
> \ +    file://conntrack-failover \ +    file://init \ +    " 
> SRC_URI[tar.md5sum] = "ee737c774e01349f75e935228a2d851b" 
> SRC_URI[tar.sha256sum] =
> "036b032a5c4d180aad686df21399d74506b9b3d3000794eb13ac313482e24896"
> 
> @@ -19,15 +19,15 @@ inherit autotools update-rc.d INITSCRIPT_NAME =
> "conntrackd"
> 
> do_install_append() { -	install -d ${D}/${sysconfdir}/conntrackd -
> install -d ${D}/${sysconfdir}/init.d -	install -m 0644
> doc/sync/ftfw/conntrackd.conf
> ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample -	install -m 0755
> ${WORKDIR}/conntrack-failover
> ${D}/${sysconfdir}/init.d/conntrack-failover -	install -m 0755
> ${WORKDIR}/init ${D}/${sysconfdir}/init.d/conntrackd +    install -d
> ${D}/${sysconfdir}/conntrackd +    install -d ${D}/${sysconfdir}/init.d +
> install -m 0644 doc/sync/ftfw/conntrackd.conf
> ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample +    install -m 0755
> ${WORKDIR}/conntrack-failover
> ${D}/${sysconfdir}/init.d/conntrack-failover +    install -m 0755
> ${WORKDIR}/init ${D}/${sysconfdir}/init.d/conntrackd
> 
> -	# Fix hardcoded paths in scripts -	sed -i 's!/usr/sbin/!${sbindir}/!g'
> ${D}/${sysconfdir}/init.d/conntrack-failover
> ${D}/${sysconfdir}/init.d/conntrackd -	sed -i 's!/etc/!${sysconfdir}/!g'
> ${D}/${sysconfdir}/init.d/conntrack-failover
> ${D}/${sysconfdir}/init.d/conntrackd -	sed -i
> 's!/var/!${localstatedir}/!g'
> ${D}/${sysconfdir}/init.d/conntrack-failover
> ${D}/${sysconfdir}/init.d/conntrackd
> ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample -	sed -i 's!^export
> PATH=.*!export PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'
> ${D}/${sysconfdir}/init.d/conntrackd +    # Fix hardcoded paths in
> scripts +    sed -i 's!/usr/sbin/!${sbindir}/!g'
> ${D}/${sysconfdir}/init.d/conntrack-failover
> ${D}/${sysconfdir}/init.d/conntrackd +    sed -i
> 's!/etc/!${sysconfdir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover
> ${D}/${sysconfdir}/init.d/conntrackd +    sed -i
> 's!/var/!${localstatedir}/!g'
> ${D}/${sysconfdir}/init.d/conntrack-failover
> ${D}/${sysconfdir}/init.d/conntrackd
> ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample +    sed -i
> 's!^export PATH=.*!export
> PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'
> ${D}/${sysconfdir}/init.d/conntrackd } diff --git
> a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb index
> d6d803a..625fdfd 100644 ---
> a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb +++
> b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb @@ -34,21
> +34,21 @@ EXTRA_OEMAKE = " \ "
> 
> do_install () { -	install -d ${D}${sysconfdir}/init.d -	install -d
> ${D}${sysconfdir}/default -	install -d ${D}${sysconfdir}/ebtables -
> oe_runmake DESTDIR='${D}' install -	install -m 0755
> ${WORKDIR}/ebtables.init ${D}/${sysconfdir}/init.d/ebtables -	mv
> ${D}${sysconfdir}/default/ebtables-config
> ${D}${sysconfdir}/default/ebtables - -	# Fix hardcoded paths in scripts -
> sed -i 's!/sbin/!${base_sbindir}/!g' ${D}/${sysconfdir}/init.d/ebtables -
> sed -i 's!/etc/!${sysconfdir}/!g' ${D}/${sysconfdir}/init.d/ebtables - -
> # The script ebtables-save refernces perl in exec_prefix, so -	# move it
> to sbindir to avoid QA issue -	install -d ${D}/${sbindir} -	mv
> ${D}/${base_sbindir}/ebtables-save ${D}/${sbindir} +    install -d
> ${D}${sysconfdir}/init.d +    install -d ${D}${sysconfdir}/default +
> install -d ${D}${sysconfdir}/ebtables +    oe_runmake DESTDIR='${D}'
> install +    install -m 0755 ${WORKDIR}/ebtables.init
> ${D}/${sysconfdir}/init.d/ebtables +    mv
> ${D}${sysconfdir}/default/ebtables-config
> ${D}${sysconfdir}/default/ebtables + +    # Fix hardcoded paths in
> scripts +    sed -i 's!/sbin/!${base_sbindir}/!g'
> ${D}/${sysconfdir}/init.d/ebtables +    sed -i 's!/etc/!${sysconfdir}/!g'
> ${D}/${sysconfdir}/init.d/ebtables + +    # The script ebtables-save
> refernces perl in exec_prefix, so +    # move it to sbindir to avoid QA
> issue +    install -d ${D}/${sbindir} +    mv
> ${D}/${base_sbindir}/ebtables-save ${D}/${sbindir} }
> 
> CONFFILES_${PN} += "${sysconfdir}/default/ebtables" diff --git
> a/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
> b/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb index
> 369aaa9..74f9096 100644 ---
> a/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb +++
> b/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb @@ -1,6 +1,6 @@ 
> SUMMARY = "Minimalistic user-space Netlink utility library" DESCRIPTION =
> "Minimalistic user-space library oriented to Netlink developers,
> providing \ - functions for common tasks in parsing, validating, and
> constructing both the Netlink header and TLVs." +    functions for common
> tasks in parsing, validating, and constructing both the Netlink header
> and TLVs." HOMEPAGE =
> "http://www.netfilter.org/projects/libmnl/index.html" LICENSE =
> "LGPLv2.1+" LIC_FILES_CHKSUM =
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c" diff --git
> a/meta-networking/recipes-irc/znc/znc_git.bb
> b/meta-networking/recipes-irc/znc/znc_git.bb index aea8ed4..817e2c4
> 100644 --- a/meta-networking/recipes-irc/znc/znc_git.bb +++
> b/meta-networking/recipes-irc/znc/znc_git.bb @@ -15,5 +15,5 @@ inherit
> autotools
> 
> # ZNC has a custom autogen.sh that states that this command is needed
> *and* expected to fail do_configure_prepend() { -	automake --add-missing
> || true +    automake --add-missing || true } diff --git
> a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
> b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb index
> c173af4..634e166 100644 ---
> a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb +++
> b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb @@
> -1,9 +1,9 @@ SUMMARY = "Client for Microsoft PPTP VPNs" DESCRIPTION =
> "PPTP Client is a Linux, FreeBSD, NetBSD \ - and OpenBSD client for the
> proprietary Microsoft Point-to-Point \ - Tunneling Protocol, PPTP. Allows
> connection to a PPTP based \ - Virtual Private Network (VPN) as used by
> employers and some \ - cable and ADSL internet service providers." +
> and OpenBSD client for the proprietary Microsoft Point-to-Point \ +
> Tunneling Protocol, PPTP. Allows connection to a PPTP based \ +
> Virtual Private Network (VPN) as used by employers and some \ +    cable
> and ADSL internet service providers." HOMEPAGE =
> "http://pptpclient.sourceforge.net" SECTION = "network" LICENSE =
> "GPLv2+" @@ -22,10 +22,10 @@ SRC_URI[sha256sum] =
> "e98ae0065d2a39fa3131654ff28cb7070e996f668ed6d0e7d9a445b8d3 S =
> "${WORKDIR}/pptp-${PV}"
> 
> do_install() { -        install -d ${D}${sbindir} ${D}${sysconfdir}/ppp
> ${D}${mandir}/man8 -        install -m 555 pptp ${D}${sbindir} -
> install -m 644 pptp.8 ${D}${mandir}/man8 -        install -m 644
> ${WORKDIR}/options.pptp ${D}${sysconfdir}/ppp +    install -d
> ${D}${sbindir} ${D}${sysconfdir}/ppp ${D}${mandir}/man8 +    install -m
> 555 pptp ${D}${sbindir} +    install -m 644 pptp.8 ${D}${mandir}/man8 +
> install -m 644 ${WORKDIR}/options.pptp ${D}${sysconfdir}/ppp }
> 
> RDEPENDS_${PN} = "ppp" diff --git
> a/meta-networking/recipes-protocols/quagga/quagga.inc
> b/meta-networking/recipes-protocols/quagga/quagga.inc index
> b40c858..160c458 100644 ---
> a/meta-networking/recipes-protocols/quagga/quagga.inc +++
> b/meta-networking/recipes-protocols/quagga/quagga.inc @@ -136,33 +136,33
> @@ pkg_postinst_${PN} () {
> 
> # Stop apps before uninstall pkg_prerm_${PN} () { -
> ${sysconfdir}/init.d/quagga stop +    ${sysconfdir}/init.d/quagga stop }
> 
> pkg_prerm_${PN}-ospfd () { -        ${sysconfdir}/init.d/quagga stop
> ospfd +    ${sysconfdir}/init.d/quagga stop ospfd }
> 
> pkg_prerm_${PN}-ospf6d () { -        ${sysconfdir}/init.d/quagga stop
> ospf6d +    ${sysconfdir}/init.d/quagga stop ospf6d }
> 
> pkg_prerm_${PN}-babeld () { -        ${sysconfdir}/init.d/quagga stop
> babeld +    ${sysconfdir}/init.d/quagga stop babeld }
> 
> pkg_prerm_${PN}-bgpd () { -        ${sysconfdir}/init.d/quagga stop bgpd 
> +    ${sysconfdir}/init.d/quagga stop bgpd }
> 
> pkg_prerm_${PN}-ripd () { -        ${sysconfdir}/init.d/quagga stop ripd 
> +    ${sysconfdir}/init.d/quagga stop ripd }
> 
> pkg_prerm_${PN}-ripngd () { -        ${sysconfdir}/init.d/quagga stop
> ripngd +    ${sysconfdir}/init.d/quagga stop ripngd }
> 
> pkg_prerm_${PN}-isisd () { -        ${sysconfdir}/init.d/quagga stop
> isisd +    ${sysconfdir}/init.d/quagga stop isisd } diff --git
> a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc index
> cea5427..f4ea2b8 100644 ---
> a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc +++
> b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc @@ -15,22 +15,22 @@
> S = "${WORKDIR}/git" inherit update-rc.d
> 
> do_compile () { -	oe_runmake CFLAGS="${CFLAGS} -DLINUX"
> LDFLAGS="${LDFLAGS}" PREFIX="${prefix}" KERNELSRC=${STAGING_KERNEL_DIR}
> all +    oe_runmake CFLAGS="${CFLAGS} -DLINUX" LDFLAGS="${LDFLAGS}"
> PREFIX="${prefix}" KERNELSRC=${STAGING_KERNEL_DIR} all }
> 
> do_install () { -	oe_runmake PREFIX="${D}${prefix}" install - -	install
> -d ${D}${sysconfdir}/init.d -	touch ${D}${sysconfdir}/xl2tpd.conf -
> install -m 0755 debian/xl2tpd.init ${D}${sysconfdir}/init.d/xl2tpd -	sed
> -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/xl2tpd -	sed -i
> 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/xl2tpd -	sed -i
> 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/xl2tpd -	sed -i
> 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'
> ${D}${sysconfdir}/init.d/xl2tpd - -	install -d ${D}${sysconfdir}/default 
> -	install -m 0644 debian/xl2tpd.default ${D}${sysconfdir}/default/xl2tpd 
> +    oe_runmake PREFIX="${D}${prefix}" install + +    install -d
> ${D}${sysconfdir}/init.d +    touch ${D}${sysconfdir}/xl2tpd.conf +
> install -m 0755 debian/xl2tpd.init ${D}${sysconfdir}/init.d/xl2tpd +
> sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/xl2tpd +
> sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/xl2tpd +
> sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/xl2tpd +
> sed -i
> 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'
> ${D}${sysconfdir}/init.d/xl2tpd + +    install -d
> ${D}${sysconfdir}/default +    install -m 0644 debian/xl2tpd.default
> ${D}${sysconfdir}/default/xl2tpd }
> 
> CONFFILES_${PN} += "${sysconfdir}/xl2tpd.conf
> ${sysconfdir}/default/xl2tpd" diff --git
> a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
> b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb index
> f755940..9307263 100644 ---
> a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb +++
> b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb @@ -25,10
> +25,10 @@ SRC_URI[md5sum] = "bdafb16b008ebb5633e4e581f77821d2" 
> SRC_URI[sha256sum] =
> "a8c74df127753e2310fa1e072f3c9ca44a404bb0bbce9cfec7a84c6dff8bec7b"
> 
> do_install () { -	install -d ${D}${sbindir} -	install -d
> ${D}${sysconfdir}/network/if-up.d -	install -d ${D}${sysconfdir}/default 
> -	install -c -m 755 ${S}/zeroconf ${D}${sbindir}/zeroconf -	install -c -m
> 755 ${WORKDIR}/debian-zeroconf
> ${D}${sysconfdir}/network/if-up.d/zeroconf -	install -c
> ${WORKDIR}/zeroconf-default ${D}${sysconfdir}/default/zeroconf +
> install -d ${D}${sbindir} +    install -d
> ${D}${sysconfdir}/network/if-up.d +    install -d
> ${D}${sysconfdir}/default +    install -c -m 755 ${S}/zeroconf
> ${D}${sbindir}/zeroconf +    install -c -m 755 ${WORKDIR}/debian-zeroconf
> ${D}${sysconfdir}/network/if-up.d/zeroconf +    install -c
> ${WORKDIR}/zeroconf-default ${D}${sysconfdir}/default/zeroconf } diff
> --git a/meta-networking/recipes-support/aoetools/aoetools_34.bb
> b/meta-networking/recipes-support/aoetools/aoetools_34.bb index
> 68ff4bb..cf00298 100644 ---
> a/meta-networking/recipes-support/aoetools/aoetools_34.bb +++
> b/meta-networking/recipes-support/aoetools/aoetools_34.bb @@ -21,5 +21,5
> @@ SRC_URI[sha256sum] =
> "fd6c57244e9458d7cbe7a0171295ddee4d8cdcae291e40d6acbc641df7 EXTRA_OEMAKE
> = ""
> 
> do_install() { -        oe_runmake DESTDIR=${D} install +    oe_runmake
> DESTDIR=${D} install } diff --git
> a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb index
> 86b900a..ccf1f54 100644 ---
> a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb +++
> b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb @@ -9,17
> +9,17 @@ RDEPENDS_${PN} += "perl"
> 
> LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
>
> 
SRC_URI = " \
> -	${SOURCEFORGE_MIRROR}/ebtables/arptables-v${PV}.tar.gz;name=arptables
> \ -	file://arptables-compile-install.patch \ -
> file://arptables-init-busybox.patch \ -	" +
> ${SOURCEFORGE_MIRROR}/ebtables/arptables-v${PV}.tar.gz;name=arptables \ +
> file://arptables-compile-install.patch \ +
> file://arptables-init-busybox.patch \ +    " SRC_URI[arptables.md5sum] =
> "1d4ab05761f063b0751645d8f2b8f8e5" SRC_URI[arptables.sha256sum] =
> "e529fd465c67d69ad335299a043516e6b38cdcd337a5ed21718413e96073f928"
> 
> S = "${WORKDIR}/arptables-v${PV}"
> 
> do_compile () { -	oe_runmake +    oe_runmake }
> 
> # the install target is not multi-job safe, but it doesn't do much @@
> -28,5 +28,5 @@ do_compile () { PARALLEL_MAKEINST = "-j1"
> 
> fakeroot do_install () { -	oe_runmake 'BINDIR=${sbindir}'
> 'MANDIR=${mandir}/' 'DESTDIR=${D}' install +    oe_runmake
> 'BINDIR=${sbindir}' 'MANDIR=${mandir}/' 'DESTDIR=${D}' install } diff
> --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> b/meta-networking/recipes-support/cifs/cifs-utils_git.bb index
> 53285a1..19b60ad 100644 ---
> a/meta-networking/recipes-support/cifs/cifs-utils_git.bb +++
> b/meta-networking/recipes-support/cifs/cifs-utils_git.bb @@ -14,7 +14,7
> @@ S = "${WORKDIR}/git" inherit autotools
> 
> do_install_append() { -       # Remove empty /usr/bin and /usr/sbin
> directories since the mount helper -       # is installed to /sbin -
> rmdir ${D}${bindir} ${D}${sbindir} +    # Remove empty /usr/bin and
> /usr/sbin directories since the mount helper +    # is installed to
> /sbin +    rmdir ${D}${bindir} ${D}${sbindir} } diff --git
> a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb index
> 51c4a34..ff30558 100644 ---
> a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb +++
> b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb @@
> -12,14 +12,14 @@ SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7" 
> SRC_URI[sha256sum] =
> "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe"
> 
> FILES_${PN} = " \ -  ${bindir}/${PN} \ -  ${datadir}/${PN}/wireless.list
> \ -  ${datadir}/${PN}/OUI.list \ +    ${bindir}/${PN} \ +
> ${datadir}/${PN}/wireless.list \ +    ${datadir}/${PN}/OUI.list \ "
> 
> FILES_${PN}-doc = " \ -  ${datadir}/info \ -  ${datadir}/man \ +
> ${datadir}/info \ +    ${datadir}/man \ "
> 
> inherit autotools diff --git
> a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
> b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb index
> 3920c1a..88a4091 100644 ---
> a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb +++
> b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb @@ -22,25 +22,25
> @@ inherit autotools gettext # Split into seperate packages since we
> normal don't want them all # The main package is left empty and therefore
> not created. PACKAGES += "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \ -
> ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \ -             ${PN}-tracert6
> ${PN}-rdnssd ${PN}-misc" -FILES_${PN}			= "" -FILES_${PN}-ndisc6		=
> "${bindir}/ndisc6" -FILES_${PN}-tcpspray6 		= "${bindir}/tcpspray6" 
> -FILES_${PN}-rdisc6		= "${bindir}/rdisc6" -FILES_${PN}-tcptraceroute6	=
> "${bindir}/tcptraceroute6" -FILES_${PN}-rltraceroute6	=
> "${bindir}/rltraceroute6" -FILES_${PN}-tracert6		= "${bindir}/tracert6" 
> -FILES_${PN}-rdnssd		= "${sbindir}/rdnssd ${sysconfdir}/rdnssd" +
> ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \ +    ${PN}-tracert6
> ${PN}-rdnssd ${PN}-misc" +FILES_${PN}            = "" +FILES_${PN}-ndisc6
> = "${bindir}/ndisc6" +FILES_${PN}-tcpspray6         =
> "${bindir}/tcpspray6" +FILES_${PN}-rdisc6        = "${bindir}/rdisc6" 
> +FILES_${PN}-tcptraceroute6    = "${bindir}/tcptraceroute6" 
> +FILES_${PN}-rltraceroute6    = "${bindir}/rltraceroute6" 
> +FILES_${PN}-tracert6        = "${bindir}/tracert6" +FILES_${PN}-rdnssd
> = "${sbindir}/rdnssd ${sysconfdir}/rdnssd" FILES_${PN}-misc
> = "${bindir}/dnssort ${bindir}/name2addr ${bindir}/tcpspray
> ${bindir}/addr2name"
> 
> -DESCRIPTION_${PN}-ndisc6	= "ICMPv6 Neighbor Discovery tool. \ 
> +DESCRIPTION_${PN}-ndisc6    = "ICMPv6 Neighbor Discovery tool. \ 
> Performs IPv6 neighbor discovery in userland. Replaces arping from the \ 
> IPv4 world." -DESCRIPTION_${PN}-rdisc6	= "ICMPv6 Router Discovery tool.
> \ +DESCRIPTION_${PN}-rdisc6    = "ICMPv6 Router Discovery tool. \ Queries
> IPv6 routers on the network for advertised prefixes. Can be used \ to
> detect rogue IPv6 routers, monitor legitimate IPv6 routers." 
> -DESCRITPION_${PN}-tcpspray6	= "Performs bandwidth measurements of TCP \ 
> +DESCRITPION_${PN}-tcpspray6    = "Performs bandwidth measurements of TCP
> \ sessions between the local system and a remote echo server in either
> IPv6 \ or IPv4."
> 
> @@ -48,15 +48,15 @@ DESCRITPION_${PN}-rdnssd       = "Daemon to
> autoconfigure the list of DNS \ servers through slateless IPv6
> autoconfiguration."
> 
> do_install_append () { -	rm -rf ${D}${localstatedir} +    rm -rf
> ${D}${localstatedir} } # Enable SUID bit for applications that need it 
> pkg_postinst_${PN}-rltraceroute6 () { -	chmod 4555
> ${bindir}/rltraceroute6 +    chmod 4555 ${bindir}/rltraceroute6 } 
> pkg_postinst_${PN}-ndisc6 () { -	chmod 4555 ${bindir}/ndisc6 +    chmod
> 4555 ${bindir}/ndisc6 } pkg_postinst_${PN}-rdisc6 () { -	chmod 4555
> ${bindir}/rdisc6 +    chmod 4555 ${bindir}/rdisc6 } diff --git
> a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb index
> 00eec3e..0a30de6 100644 ---
> a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb +++
> b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb @@ -19,14
> +19,14 @@ S = "${WORKDIR}/${BPN}-${PV}.orig" do_configure[noexec] = "1"
> 
> do_compile() { -	cd ${S} -        while read line; do patch -p1
> <debian/patches/$line; done <debian/patches/series -	pkgrel=4 -
> oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\"" +
> cd ${S} +    while read line; do patch -p1 <debian/patches/$line; done
> <debian/patches/series +    pkgrel=4 +    oe_runmake CFLAGS="$CFLAGS
> -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\"" }
> 
> do_install() { -        install -d ${D}${bindir} -        install -m 755
> ${S}/nc ${D}${bindir}/nc.${BPN} +    install -d ${D}${bindir} +
> install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN} } ALTERNATIVE_PRIORITY =
> "50" diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb index
> 2d98122..bdcf18e 100644 ---
> a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb +++
> b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb @@ -16,7 +16,7
> @@ SRC_URI[sha256sum] =
> "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df0967 inherit
> autotools
> 
> do_install_append() { -        install -d ${D}${bindir} -        mv
> ${D}${bindir}/nc ${D}${bindir}/nc.${BPN} +    install -d ${D}${bindir} +
> mv ${D}${bindir}/nc ${D}${bindir}/nc.${BPN} } ALTERNATIVE_PRIORITY =
> "100" diff --git
> a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb index
> 7b78840..eda7859 100644 ---
> a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb +++
> b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb @@ -26,31
> +26,31 @@ CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE" #
> autotools.bbclass attends to include m4 files with path depth <= 2 by #
> "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4. 
> do_configure_prepend() { -	test -d m4/m4 && mv -f m4/m4 m4-files +
> test -d m4/m4 && mv -f m4/m4 m4-files }
> 
> do_install() { -	sed -e 's#/usr/sbin/#${sbindir}/#g' -i ${WORKDIR}/init 
> - -	install -d ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d -
> install -m 4755 src/netperf ${D}${bindir} -	install -m 4755 src/netserver
> ${D}${sbindir} -	install -m 0755 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/netperf - -	# man -	install -d
> ${D}${mandir}/man1/ -	install -m 0644 doc/netserver.man
> ${D}${mandir}/man1/netserver.1 -	install -m 0644 doc/netperf.man
> ${D}${mandir}/man1/netperf.1 - -	# move scripts to examples directory -
> install -d ${D}${docdir}/netperf/examples -	install -m 0644
> doc/examples/*_script ${D}${docdir}/netperf/examples/ - -	# docs .. -
> install -m 0644 COPYING ${D}${docdir}/netperf -	install -m 0644
> Release_Notes ${D}${docdir}/netperf -	install -m 0644 README
> ${D}${docdir}/netperf -	install -m 0644 doc/netperf_old.ps
> ${D}${docdir}/netperf +    sed -e 's#/usr/sbin/#${sbindir}/#g' -i
> ${WORKDIR}/init + +    install -d ${D}${sbindir} ${D}${bindir}
> ${D}${sysconfdir}/init.d +    install -m 4755 src/netperf ${D}${bindir} +
> install -m 4755 src/netserver ${D}${sbindir} +    install -m 0755
> ${WORKDIR}/init ${D}${sysconfdir}/init.d/netperf + +    # man +
> install -d ${D}${mandir}/man1/ +    install -m 0644 doc/netserver.man
> ${D}${mandir}/man1/netserver.1 +    install -m 0644 doc/netperf.man
> ${D}${mandir}/man1/netperf.1 + +    # move scripts to examples directory 
> +    install -d ${D}${docdir}/netperf/examples +    install -m 0644
> doc/examples/*_script ${D}${docdir}/netperf/examples/ + +    # docs .. +
> install -m 0644 COPYING ${D}${docdir}/netperf +    install -m 0644
> Release_Notes ${D}${docdir}/netperf +    install -m 0644 README
> ${D}${docdir}/netperf +    install -m 0644 doc/netperf_old.ps
> ${D}${docdir}/netperf }
> 
> INITSCRIPT_NAME="netperf" diff --git
> a/meta-networking/recipes-support/nis/nis.inc
> b/meta-networking/recipes-support/nis/nis.inc index f9f5bd1..f2eef05
> 100644 --- a/meta-networking/recipes-support/nis/nis.inc +++
> b/meta-networking/recipes-support/nis/nis.inc @@ -18,7 +18,7 @@ inherit
> autotools gettext # a security problem (and this fix to the build problem
> is *much* # easier and more maintainable.) do_install() { -	oe_runmake
> 'DESTDIR=${D}' install-strip +    oe_runmake 'DESTDIR=${D}'
> install-strip }
> 
> # An attempt to build on uclibc will fail, causing annoyance, diff --git
> a/meta-networking/recipes-support/nis/yp-tools_2.12.bb
> b/meta-networking/recipes-support/nis/yp-tools_2.12.bb index
> 8593c6b..0017845 100644 ---
> a/meta-networking/recipes-support/nis/yp-tools_2.12.bb +++
> b/meta-networking/recipes-support/nis/yp-tools_2.12.bb @@ -26,6 +26,6 @@
> RCONFLICTS_${PN} += "${PN}-systemd" SYSTEMD_SERVICE_${PN} =
> "domainname.service"
> 
> do_install_append() { -	install -d ${D}${systemd_unitdir}/system -
> install -m 0644 ${WORKDIR}/domainname.service
> ${D}${systemd_unitdir}/system +    install -d
> ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/domainname.service ${D}${systemd_unitdir}/system } diff --git
> a/meta-networking/recipes-support/ntp/ntp.inc
> b/meta-networking/recipes-support/ntp/ntp.inc index 3f53fff..c432b41
> 100644 --- a/meta-networking/recipes-support/ntp/ntp.inc +++
> b/meta-networking/recipes-support/ntp/ntp.inc @@ -37,27 +37,27 @@
> PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \ 
> openssl"
> 
> do_install_append() { -	install -d ${D}${sysconfdir}/init.d -	install -m
> 644 ${WORKDIR}/ntp.conf ${D}${sysconfdir} -	install -m 755
> ${WORKDIR}/ntpd ${D}${sysconfdir}/init.d -	install -d ${D}${bindir} -
> install -m 755 ${WORKDIR}/ntpdate ${D}${bindir}/ntpdate-sync - -	# Fix
> hardcoded paths in scripts -	sed -i 's!/usr/sbin/!${sbindir}/!g'
> ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync -	sed -i
> 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/ntpd
> ${D}${bindir}/ntpdate-sync -	sed -i 's!/etc/!${sysconfdir}/!g'
> ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync -	sed -i
> 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd
> ${D}${bindir}/ntpdate-sync -	sed -i
> 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'
> ${D}${bindir}/ntpdate-sync - -	install -d ${D}/${sysconfdir}/default -
> install -m 644 ${WORKDIR}/ntpdate.default
> ${D}${sysconfdir}/default/ntpdate -	install -d
> ${D}/${sysconfdir}/network/if-up.d -	ln -s ${bindir}/ntpdate-sync
> ${D}/${sysconfdir}/network/if-up.d - -	install -d
> ${D}${systemd_unitdir}/system -	install -m 0644
> ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/ -	install -m
> 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/ +    install
> -d ${D}${sysconfdir}/init.d +    install -m 644 ${WORKDIR}/ntp.conf
> ${D}${sysconfdir} +    install -m 755 ${WORKDIR}/ntpd
> ${D}${sysconfdir}/init.d +    install -d ${D}${bindir} +    install -m
> 755 ${WORKDIR}/ntpdate ${D}${bindir}/ntpdate-sync + +    # Fix hardcoded
> paths in scripts +    sed -i 's!/usr/sbin/!${sbindir}/!g'
> ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync +    sed -i
> 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/ntpd
> ${D}${bindir}/ntpdate-sync +    sed -i 's!/etc/!${sysconfdir}/!g'
> ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync +    sed -i
> 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd
> ${D}${bindir}/ntpdate-sync +    sed -i
> 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!'
> ${D}${bindir}/ntpdate-sync + +    install -d ${D}/${sysconfdir}/default +
> install -m 644 ${WORKDIR}/ntpdate.default
> ${D}${sysconfdir}/default/ntpdate +    install -d
> ${D}/${sysconfdir}/network/if-up.d +    ln -s ${bindir}/ntpdate-sync
> ${D}/${sysconfdir}/network/if-up.d + +    install -d
> ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/ +    install -m
> 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/ }
> 
> PACKAGES += "ntpdate ${PN}-tickadj ${PN}-utils" @@ -89,10 +89,10 @@
> FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf
> ${sysconfdir}/init.d/ntpd $ FILES_${PN}-tickadj = "${bindir}/tickadj" 
> FILES_${PN}-utils = "${bindir}" FILES_ntpdate = "${bindir}/ntpdate \ -
> ${sysconfdir}/network/if-up.d/ntpdate-sync \ -  ${bindir}/ntpdate-sync \ 
> -  ${sysconfdir}/default/ntpdate \ -
> ${systemd_unitdir}/system/ntpdate.service \ +
> ${sysconfdir}/network/if-up.d/ntpdate-sync \ +    ${bindir}/ntpdate-sync
> \ +    ${sysconfdir}/default/ntpdate \ +
> ${systemd_unitdir}/system/ntpdate.service \ "
> 
> CONFFILES_${PN} = "${sysconfdir}/ntp.conf" @@ -104,13 +104,13 @@
> INITSCRIPT_PARAMS = "defaults"
> 
> pkg_postinst_ntpdate() { if test "x$D" != "x"; then -        exit 1 +
> exit 1 else -        if ! grep -q -s ntpdate /var/spool/cron/root; then -
> echo "adding crontab" -                test -d /var/spool/cron || mkdir
> -p /var/spool/cron -                echo "30 * * * *
> ${bindir}/ntpdate-sync silent" >> /var/spool/cron/root -        fi +
> if ! grep -q -s ntpdate /var/spool/cron/root; then +        echo "adding
> crontab" +        test -d /var/spool/cron || mkdir -p /var/spool/cron +
> echo "30 * * * *    ${bindir}/ntpdate-sync silent" >>
> /var/spool/cron/root +    fi fi }
> 
> diff --git a/meta-networking/recipes-support/tunctl/tunctl.inc
> b/meta-networking/recipes-support/tunctl/tunctl.inc index
> 29aed44..e95cfa5 100644 ---
> a/meta-networking/recipes-support/tunctl/tunctl.inc +++
> b/meta-networking/recipes-support/tunctl/tunctl.inc @@ -6,10 +6,10 @@
> LIC_FILES_CHKSUM =
> "file://tunctl.c;beginline=1;endline=4;md5=ff3a09996bc5fff6bc SRC_URI =
> "${SOURCEFORGE_MIRROR}/tunctl/tunctl-${PV}.tar.gz"
> 
> do_compile() { -	oe_runmake tunctl +    oe_runmake tunctl }
> 
> do_install() { -	install -d ${D}/${sbindir} -	install -m 755 tunctl
> ${D}/${sbindir} +    install -d ${D}/${sbindir} +    install -m 755
> tunctl ${D}/${sbindir} } diff --git a/meta-oe/classes/gpe.bbclass
> b/meta-oe/classes/gpe.bbclass index 7e042ee..2adbd48 100644 ---
> a/meta-oe/classes/gpe.bbclass +++ b/meta-oe/classes/gpe.bbclass @@ -7,11
> +7,11 @@ SECTION ?= "gpe" inherit gettext
> 
> gpe_do_compile() { -	oe_runmake PREFIX=${prefix} +    oe_runmake
> PREFIX=${prefix} }
> 
> gpe_do_install() { -	oe_runmake PREFIX=${prefix} DESTDIR=${D} install +
> oe_runmake PREFIX=${prefix} DESTDIR=${D} install }
> 
> EXPORT_FUNCTIONS do_compile do_install diff --git
> a/meta-oe/classes/vala.bbclass b/meta-oe/classes/vala.bbclass index
> d4ba831..c7db08c 100644 --- a/meta-oe/classes/vala.bbclass +++
> b/meta-oe/classes/vala.bbclass @@ -12,7 +12,7 @@ export XDG_DATA_DIRS =
> "${STAGING_DATADIR}"
> 
> # Package additional files FILES_${PN}-dev += "\ -
> ${datadir}/vala/vapi/*.vapi \ -  ${datadir}/vala/vapi/*.deps \ -
> ${datadir}/gir-1.0 \ +    ${datadir}/vala/vapi/*.vapi \ +
> ${datadir}/vala/vapi/*.deps \ +    ${datadir}/gir-1.0 \ " diff --git
> a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
> b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb index
> 7a6b798..875b1cc 100644 ---
> a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb +++
> b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb @@ -17,10 +17,10 @@
> EXES = "bonnie++ zcav" TARGET_CC_ARCH += "${LDFLAGS}"
> 
> do_install () { -        install -d ${D}/bin -        install -d
> ${D}/sbin -        install -m 0755 ${EXES} ${D}/sbin -        install -m
> 0755 ${SCRIPTS} ${D}/bin +    install -d ${D}/bin +    install -d
> ${D}/sbin +    install -m 0755 ${EXES} ${D}/sbin +    install -m 0755
> ${SCRIPTS} ${D}/bin }
> 
> PACKAGES =+ "bonnie-scripts" diff --git
> a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb
> b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb index
> 5bc3129..25b6388 100644 ---
> a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb +++
> b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb @@ -17,13
> +17,13 @@ SRC_URI[ssvb.sha256sum] =
> "bfddd3226a499ffdf71bb58c05ccdc6dac5bb2c2c3bdb10ac610e S = "${WORKDIR}"
> 
> do_compile() { -	${CC} ${CFLAGS} ${LDFLAGS} burn.S -o burn -	${CC}
> ${CFLAGS} ${LDFLAGS} ssvb-cpuburn-a8.S -o burn-neona8 +    ${CC}
> ${CFLAGS} ${LDFLAGS} burn.S -o burn +    ${CC} ${CFLAGS} ${LDFLAGS}
> ssvb-cpuburn-a8.S -o burn-neona8 }
> 
> do_install() { -	install -d ${D}${bindir} -	install -m 0755 ${S}/burn
> ${D}${bindir}/burn-neon -	install -m 0755 ${S}/burn-neona8
> ${D}${bindir}/ +    install -d ${D}${bindir} +    install -m 0755
> ${S}/burn ${D}${bindir}/burn-neon +    install -m 0755 ${S}/burn-neona8
> ${D}${bindir}/ }
> 
> diff --git a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
> b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb index b61eb91..5afeda2
> 100644 --- a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb +++
> b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb @@ -8,9 +8,9 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
> DEPENDS = "popt"
> 
> SRC_URI = "\ -  http://samba.org/ftp/tridge/dbench/dbench-${PV}.tar.gz \ 
> -  file://destdir.patch \ -  file://makefile.patch" +
> http://samba.org/ftp/tridge/dbench/dbench-${PV}.tar.gz \ +
> file://destdir.patch \ +    file://makefile.patch"
> 
> inherit autotools
> 
> diff --git a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
> b/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb index 4c086c8..e21ab6d
> 100644 --- a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb +++
> b/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb @@ -21,7 +21,7 @@ S =
> "${WORKDIR}/git" EXTRA_OEMAKE = "CC='${CC}' CFLAGS='${CFLAGS}'
> LDFLAGS='${LDFLAGS}'"
> 
> do_install() { -	oe_runmake install DESTDIR=${D} bindir=${bindir}
> mandir=${mandir} -	install -d ${D}/${docdir}/${PN} -	cp -a ${S}/examples
> ${D}/${docdir}/${PN}/ +    oe_runmake install DESTDIR=${D}
> bindir=${bindir} mandir=${mandir} +    install -d ${D}/${docdir}/${PN} +
> cp -a ${S}/examples ${D}/${docdir}/${PN}/ } diff --git
> a/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
> b/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb index c1aa7fb..c5d5d0d
> 100644 --- a/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb +++
> b/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb @@ -7,9 +7,9 @@
> LIC_FILES_CHKSUM =
> "file://iozone.c;beginline=237;endline=241;md5=ab42a6185fd044
> 
> 
> SRC_URI = "http://www.iozone.org/src/current/iozone3_263.tar \ -
> file://copyright.txt \ -           file://fileop-arm.patch \ -
> " +    file://copyright.txt \ +    file://fileop-arm.patch \ +    " 
> SRC_URI[md5sum] = "44fd88df361ec4508e10c8d6615245fa" SRC_URI[sha256sum] =
> "920fde1a3843539570e2df4aa611e74df102e52d363c5973d5a9d15bdf976461"
> 
> @@ -23,26 +23,26 @@ EXTRA_OEMAKE = "linux CC='${CC}'" TARGET_CC_ARCH +=
> "${LDFLAGS}"
> 
> do_install() { -       install -d ${D}${bindir} \ -
> ${D}${mandir}/man1 \ -		  ${D}${datadir}/doc/${PN}/examples +    install
> -d ${D}${bindir} \ +        ${D}${mandir}/man1 \ +
> ${D}${datadir}/doc/${PN}/examples
> 
> -       install -m 0755 ${S}/iozone ${D}${bindir} -       install -m 0755
> ${S}/fileop ${D}${bindir} -       install -m 0644
> ${WORKDIR}/${PN}_${PV}/docs/iozone.1 ${D}${mandir}/man1/ -       install
> -m 0644 ${WORKDIR}/copyright.txt ${D}${datadir}/doc/${PN}/ +    install
> -m 0755 ${S}/iozone ${D}${bindir} +    install -m 0755 ${S}/fileop
> ${D}${bindir} +    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/iozone.1
> ${D}${mandir}/man1/ +    install -m 0644 ${WORKDIR}/copyright.txt
> ${D}${datadir}/doc/${PN}/
> 
> -       install -m 0644 ${S}/*.dem ${D}${datadir}/doc/${PN}/examples -
> install -m 0644 ${S}/client_list ${D}${datadir}/doc/${PN}/examples -
> install -m 0644 ${S}/Gnuplot.txt ${D}${datadir}/doc/${PN}/examples +
> install -m 0644 ${S}/*.dem ${D}${datadir}/doc/${PN}/examples +    install
> -m 0644 ${S}/client_list ${D}${datadir}/doc/${PN}/examples +    install
> -m 0644 ${S}/Gnuplot.txt ${D}${datadir}/doc/${PN}/examples
> 
> -       install -m 0755 ${S}/Generate_Graphs
> ${D}${datadir}/doc/${PN}/examples -       install -m 0755
> ${S}/gengnuplot.sh ${D}${datadir}/doc/${PN}/examples -       install -m
> 0755 ${S}/report.pl ${D}${datadir}/doc/${PN}/examples +    install -m
> 0755 ${S}/Generate_Graphs ${D}${datadir}/doc/${PN}/examples +    install
> -m 0755 ${S}/gengnuplot.sh ${D}${datadir}/doc/${PN}/examples +    install
> -m 0755 ${S}/report.pl ${D}${datadir}/doc/${PN}/examples
> 
> -       install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/Iozone_ps.gz
> ${D}${datadir}/doc/${PN}/ -       install -m 0644
> ${WORKDIR}/${PN}_${PV}/docs/IOzone_msword_98.pdf
> ${D}${datadir}/doc/${PN}/ -       install -m 0644
> ${WORKDIR}/${PN}_${PV}/docs/Run_rules.doc ${D}${datadir}/doc/${PN}/ +
> install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/Iozone_ps.gz
> ${D}${datadir}/doc/${PN}/ +    install -m 0644
> ${WORKDIR}/${PN}_${PV}/docs/IOzone_msword_98.pdf
> ${D}${datadir}/doc/${PN}/ +    install -m 0644
> ${WORKDIR}/${PN}_${PV}/docs/Run_rules.doc ${D}${datadir}/doc/${PN}/ }
> 
> FILES_${PN} += "${datadir}/doc/${PN}/copyright.txt" @@ -66,7 +66,7 @@
> FILES_${PN} += "${datadir}/doc/${PN}/copyright.txt" # # Marcin, # -#
> Re-distribution is permitted as long as the copyright is +#
> Re-distribution is permitted as long as the copyright is #     maintained
> and the source code is not changed. I do not #     see a problem with
> your mods to enable fileop for Linux-arm, #     as these mods have been
> returned to the Iozone folks, diff --git
> a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
> b/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb index bd8bac1..fd6465a
> 100644 --- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb +++
> b/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb @@ -5,7 +5,7 @@ LICENSE
> = "NewBSD" LIC_FILES_CHKSUM =
> "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
> 
> SRC_URI = " \ -	${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz \ +
> ${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz \ 
> file://000-Iperf_Fix-CPU-Usage.diff \ 
> file://001-cast-to-max_size_t-instead-of-int.patch \ 
> file://003-fix-hyphen-used-as-minus-sign.patch \ @@ -15,7 +15,7 @@
> SRC_URI = " \ file://007-iperf-reporter-deadlock.patch \ 
> file://008-numofreport.patch \ file://009-delayloop.patch \ -	" +    "
> 
> 
> SRC_URI[md5sum] = "8c5bc14cc2ea55f18f22afe3c23e3dcb" @@ -28,19 +28,19 @@
> S="${WORKDIR}/iperf-${PV}" EXTRA_OECONF =
> "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
> 
> do_configure() { -	export ac_cv_func_malloc_0_nonnull=yes -
> gnu-configize -	oe_runconf +    export ac_cv_func_malloc_0_nonnull=yes +
> gnu-configize +    oe_runconf }
> 
> do_compile() { -	cd ${WORKDIR}/iperf-${PV} -	oe_runmake +    cd
> ${WORKDIR}/iperf-${PV} +    oe_runmake }
> 
> do_install() { -	cd ${WORKDIR}/iperf-${PV}/src -	oe_runmake DESTDIR=${D}
> install +    cd ${WORKDIR}/iperf-${PV}/src +    oe_runmake DESTDIR=${D}
> install }
> 
> 
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb index
> 25d0a67..186f584 100644 ---
> a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb +++
> b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb @@ -24,32 +24,32 @@
> EXTRA_OEMAKE = 'CC="${CC}" AR="${AR}" RANLIB="${RANLIB}"
> CFLAGS="${CFLAGS}" \ TARGET="${TARGET_OS}" BASE="${prefix}"
> MANDIR="${mandir}"'
> 
> do_configure() { -	: +    : }
> 
> do_compile () { -	. ${CONFIG_SITE} -	if [ X"$ac_cv_uint" = X"yes" ];
> then -		CFLAGS="${CFLAGS} -DHAVE_uint" -	fi -	install -d
> ${S}/bin/${TARGET_SYS} -	oe_runmake -C src +    . ${CONFIG_SITE} +    if
> [ X"$ac_cv_uint" = X"yes" ]; then +        CFLAGS="${CFLAGS}
> -DHAVE_uint" +    fi +    install -d ${S}/bin/${TARGET_SYS} +
> oe_runmake -C src }
> 
> do_install () { -	install -d ${D}${localstatedir}/run/lmbench \ -
> ${D}${bindir} ${D}${mandir} ${D}${libdir}/lmbench \ -
> ${D}${datadir}/lmbench/scripts -	oe_runmake 'BASE=${D}${prefix}' \ -
> -C src install -	mv ${D}${bindir}/line ${D}${bindir}/lm_line -	install -m
> 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/ -	sed -i -e
> 's,^SHAREDIR=.*$,SHAREDIR=${datadir}/${PN},;' \ -	       -e
> 's,^BINDIR=.*$,BINDIR=${libdir}/${PN},;' \ -	       -e
> 's,^CONFIG=.*$,CONFIG=$SHAREDIR/`$SCRIPTSDIR/config`,;' \ -
> ${D}${bindir}/lmbench-run -	install -m 0755 ${S}/scripts/lmbench
> ${D}${bindir} -	install -m 0755 ${S}/scripts/*
> ${D}${datadir}/lmbench/scripts +    install -d
> ${D}${localstatedir}/run/lmbench \ +           ${D}${bindir}
> ${D}${mandir} ${D}${libdir}/lmbench \ +
> ${D}${datadir}/lmbench/scripts +    oe_runmake 'BASE=${D}${prefix}' \ +
> -C src install +    mv ${D}${bindir}/line ${D}${bindir}/lm_line +
> install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/ +    sed -i -e
> 's,^SHAREDIR=.*$,SHAREDIR=${datadir}/${PN},;' \ +           -e
> 's,^BINDIR=.*$,BINDIR=${libdir}/${PN},;' \ +           -e
> 's,^CONFIG=.*$,CONFIG=$SHAREDIR/`$SCRIPTSDIR/config`,;' \ +
> ${D}${bindir}/lmbench-run +    install -m 0755 ${S}/scripts/lmbench
> ${D}${bindir} +    install -m 0755 ${S}/scripts/*
> ${D}${datadir}/lmbench/scripts }
> 
> RDEPENDS_${PN} = "debianutils" diff --git
> a/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb
> b/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb index
> f220553..5273078 100644 ---
> a/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb +++
> b/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb @@ -12,14 +12,14
> @@ SRC_URI[md5sum] = "e562451620cf5343016950462bc0dc38" 
> SRC_URI[sha256sum] =
> "ac56f0b6d6d6e58bcf2a3fa7f2c9b29894f5177871f21115a1906c535106acf6"
> 
> do_compile () { -	echo '${CC} ${CFLAGS} -DPOSIX -c' > conf-cc -	echo
> '${CC} ${LDFLAGS}' > conf-ld -	oe_runmake +    echo '${CC} ${CFLAGS}
> -DPOSIX -c' > conf-cc +    echo '${CC} ${LDFLAGS}' > conf-ld +
> oe_runmake }
> 
> do_install () { -	install -d ${D}${bindir} -	install -d
> ${D}${mandir}/man8 -	install -m 0755 memtester ${D}${bindir}/ -	install
> -m 0755 memtester.8 ${D}${mandir}/man8/ +    install -d ${D}${bindir} +
> install -d ${D}${mandir}/man8 +    install -m 0755 memtester
> ${D}${bindir}/ +    install -m 0755 memtester.8 ${D}${mandir}/man8/ } 
> diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb index
> 8dd289b..37f3e46 100644 ---
> a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb +++
> b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb @@ -14,11
> +14,11 @@ SRC_URI[sha256sum] =
> "723dd073f80e9969639eb577d2af4b540fc29716b6eafdac488d8f5aed
> 
> TARGET_CC_ARCH += "${CFLAGS} ${LDFLAGS}" do_compile() { -	oe_runmake +
> oe_runmake }
> 
> do_install () { -	install -d ${D}${bindir} -	install -m 0644 NNET.DAT
> ${D}${bindir}/ -	install -m 0755 nbench ${D}${bindir}/ +    install -d
> ${D}${bindir} +    install -m 0644 NNET.DAT ${D}${bindir}/ +    install
> -m 0755 nbench ${D}${bindir}/ } diff --git
> a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc
> b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc index
> 75bf2a9..3fc54ba 100644 ---
> a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc +++
> b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc @@ -10,19
> +10,19 @@ inherit autotools EXTRA_OECONF =
> "--with-linux-headers=${STAGING_INCDIR}"
> 
> do_install_append () { -	mv ${D}${sbindir}/brctl
> ${D}${sbindir}/brctl.${PN} -	install -d ${D}/${datadir}/bridge-utils -
> install -d ${D}/${sysconfdir}/network/if-pre-up.d -	install -d
> ${D}/${sysconfdir}/network/if-post-down.d +    mv ${D}${sbindir}/brctl
> ${D}${sbindir}/brctl.${PN} +    install -d ${D}/${datadir}/bridge-utils +
> install -d ${D}/${sysconfdir}/network/if-pre-up.d +    install -d
> ${D}/${sysconfdir}/network/if-post-down.d }
> 
> DEPENDS = "sysfsutils" RRECOMMENDS_${PN} = "kernel-module-bridge"
> 
> pkg_postinst_${PN} () { -	update-alternatives --install ${sbindir}/brctl
> brctl brctl.${PN} 100 +    update-alternatives --install ${sbindir}/brctl
> brctl brctl.${PN} 100 }
> 
> pkg_prerm_${PN} () { -	update-alternatives --remove brctl brctl.${PN} +
> update-alternatives --remove brctl brctl.${PN} } diff --git
> a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
> b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb index
> 422ebda..8255d60 100644 ---
> a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb +++
> b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb @@ -24,14
> +24,14 @@ EXTRA_OECONF = "--disable-static \ "
> 
> do_install_append () { -	install -m 0755 -d ${D}${sysconfdir}/init.d -
> install -m 755 ${WORKDIR}/cherokee.init
> ${D}${sysconfdir}/init.d/cherokee +    install -m 0755 -d
> ${D}${sysconfdir}/init.d +    install -m 755 ${WORKDIR}/cherokee.init
> ${D}${sysconfdir}/init.d/cherokee
> 
> -	# clean up .la files for plugins -	rm -f ${D}${libdir}/cherokee/*.la +
> # clean up .la files for plugins +    rm -f ${D}${libdir}/cherokee/*.la
> 
> -	install -d ${D}${systemd_unitdir}/system -	install -m 0644
> ${WORKDIR}/cherokee.service ${D}${systemd_unitdir}/system +    install -d
> ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/cherokee.service ${D}${systemd_unitdir}/system }
> 
> # Put -dev near the front so we can move the .la files into it with a
> wildcard diff --git
> a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb
> b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb index
> 896952d..7d698c6 100644 ---
> a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb +++
> b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq-dbus_2.55.bb @@ -8,6 +8,6
> @@ DEPENDS = "dbus" EXTRA_OEMAKE = "COPTS=-DHAVE_DBUS"
> 
> do_install_append () { -        install -d
> ${D}${sysconfdir}/dbus-1/system.d -        install -m 644
> dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/ +    install -d
> ${D}${sysconfdir}/dbus-1/system.d +    install -m 644 dbus/dnsmasq.conf
> ${D}${sysconfdir}/dbus-1/system.d/ } diff --git
> a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
> b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc index ef99f48..46188a4
> 100644 --- a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc +++
> b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc @@ -19,16 +19,16 @@
> INITSCRIPT_NAME = "dnsmasq" INITSCRIPT_PARAMS = "defaults"
> 
> do_install () { -        oe_runmake "PREFIX=${D}${prefix}" \ -
> "BINDIR=${D}${bindir}" \ -                   "MANDIR=${D}${mandir}" \ -
> install -        install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d
> ${D}${sysconfdir}/dnsmasq.d -        install -m 644
> ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/ -        install -m 755
> ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq +    oe_runmake
> "PREFIX=${D}${prefix}" \ +               "BINDIR=${D}${bindir}" \ +
> "MANDIR=${D}${mandir}" \ +               install +    install -d
> ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d ${D}${sysconfdir}/dnsmasq.d +
> install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/ +    install -m
> 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> 
> -        install -d ${D}${systemd_unitdir}/system -        install -m
> 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system +
> install -d ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system }
> 
> CONFFILES_${PN} = "${sysconfdir}/dnsmasq.conf" diff --git
> a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
> b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb index
> 3a2da3e..06bd588 100644 ---
> a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb +++
> b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb @@ -6,9 +6,9 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf" 
> HOMEPAGE = "http://www.gammu.org/"
> 
> SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}/${PV}/${PN}-${PV}.tar.bz2 \ 
> -     file://gammurc \ -     file://gammu-smsdrc \ -     " +
> file://gammurc \ +    file://gammu-smsdrc \ +    "
> 
> SRC_URI[md5sum] = "8ea16c6b3cc48097a8e62311fe0e25b9" SRC_URI[sha256sum] =
> "de67caa102aa4c8fbed5300e5a0262e40411c4cc79f4379a8d34eed797968fc3" @@
> -16,34 +16,34 @@ SRC_URI[sha256sum] =
> "de67caa102aa4c8fbed5300e5a0262e40411c4cc79f4379a8d34eed797 inherit
> distutils cmake gettext
> 
> do_install_append() { -     # these files seem to only be used by symbian
> and trigger QA warnings -     rm -rf ${D}/usr/share/gammu -     #install
> default configuration files -     install -d ${D}${sysconfdir} -
> install -m 0644 ${WORKDIR}/gammurc ${D}${sysconfdir}/gammurc -
> install -m 0644 ${WORKDIR}/gammu-smsdrc ${D}${sysconfdir}/gammu-smsdrc +
> # these files seem to only be used by symbian and trigger QA warnings +
> rm -rf ${D}/usr/share/gammu +    #install default configuration files +
> install -d ${D}${sysconfdir} +    install -m 0644 ${WORKDIR}/gammurc
> ${D}${sysconfdir}/gammurc +    install -m 0644 ${WORKDIR}/gammu-smsdrc
> ${D}${sysconfdir}/gammu-smsdrc }
> 
> EXTRA_OECONF = " \ -     --enable-shared \ -     --enable-backup \ -
> --enable-protection \ -     " +    --enable-shared \ +    --enable-backup
> \ +    --enable-protection \ +    "
> 
> EXTRA_OECMAKE = " \ -     -DWITH_CURL=OFF \ -     -DWITH_BLUETOOTH=OFF \ 
> -     -DWITH_NOKIA_SUPPORT=OFF \ -     -DWITH_IRDA=OFF \ -
> -DWITH_PYTHON=OFF \ -     -DWITH_MySQL=ON \ -     -DWITH_Postgres=OFF \ -
> " +    -DWITH_CURL=OFF \ +    -DWITH_BLUETOOTH=OFF \ +
> -DWITH_NOKIA_SUPPORT=OFF \ +    -DWITH_IRDA=OFF \ +    -DWITH_PYTHON=OFF
> \ +    -DWITH_MySQL=ON \ +    -DWITH_Postgres=OFF \ +    "
> 
> PACKAGES =+ "${PN}-smsd libgammu libgsmsd python-${PN}"
> 
> FILES_${PN} = "${bindir}/gammu ${bindir}/jadmaker
> ${sysconfdir}/bash_completion.d/gammu \ -     ${bindir}/gammu-detect
> ${sysconfdir}/gammurc" +    ${bindir}/gammu-detect
> ${sysconfdir}/gammurc" CONFFILES_${PN} = "${sysconfdir}/gammurc" 
> FILES_${PN}-smsd = "${bindir}/gammu-smsd* ${sysconfdir}/gammu-smsdrc" 
> CONFFILES_${PN}-smsd = "${sysconfdir}/gammu-smsdrc" diff --git
> a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
> b/meta-oe/recipes-connectivity/gateone/gateone_git.bb index
> 3552009..07a9a66 100644 ---
> a/meta-oe/recipes-connectivity/gateone/gateone_git.bb +++
> b/meta-oe/recipes-connectivity/gateone/gateone_git.bb @@ -19,15 +19,15 @@
> inherit distutils allarch python-dir systemd export prefix =
> "${localstatedir}/lib"
> 
> do_install_append() { -	install -d ${D}${localstatedir}/log/${BPN} +
> install -d ${D}${localstatedir}/log/${BPN}
> 
> -	install -m 0755 -d ${D}${sysconfdir}/avahi/services/ -	install -m 0644
> ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/ +
> install -m 0755 -d ${D}${sysconfdir}/avahi/services/ +    install -m 0644
> ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
> 
> -	install -m 0644 ${WORKDIR}/server.conf
> ${D}/var/lib/gateone/server.conf - -	install -d
> ${D}${systemd_unitdir}/system -	install -m 0644
> ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system +    install -m
> 0644 ${WORKDIR}/server.conf ${D}/var/lib/gateone/server.conf + +
> install -d ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system }
> 
> FILES_${PN} = "${localstatedir}/lib ${localstatedir}/log
> ${localstatedir}/volatile/log ${base_libdir} ${sysconfdir}
> ${PYTHON_SITEPACKAGES_DIR}" diff --git
> a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb index
> efecc64..3acff82 100644 ---
> a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb +++
> b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb @@ -32,19 +32,19
> @@ RDEPENDS_${PN}-grc = "python-pygtk python-lxml python-cheetah" 
> C_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> 
> do_configure_prepend() { -	${BUILD_CC}
> ${S}/gr-vocoder/lib/codec2/generate_codebook.c -o
> ${S}/gr-vocoder/lib/generate_codebook -lm -	echo
> "ADD_EXECUTABLE(generate_codebook IMPORTED)"
> >${S}/gr-vocoder/lib/generate_codebook.txt -	echo "SET_PROPERTY(TARGET
> generate_codebook APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)"
> >>${S}/gr-vocoder/lib/generate_codebook.txt -	echo
> 'SET_TARGET_PROPERTIES(generate_codebook PROPERTIES
> IMPORTED_LOCATION_RELEASE "${S}/gr-vocoder/lib/generate_codebook")'
> >>${S}/gr-vocoder/lib/generate_codebook.txt +    ${BUILD_CC}
> ${S}/gr-vocoder/lib/codec2/generate_codebook.c -o
> ${S}/gr-vocoder/lib/generate_codebook -lm +    echo
> "ADD_EXECUTABLE(generate_codebook IMPORTED)"
> >${S}/gr-vocoder/lib/generate_codebook.txt +    echo "SET_PROPERTY(TARGET
> generate_codebook APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)"
> >>${S}/gr-vocoder/lib/generate_codebook.txt +    echo
> 'SET_TARGET_PROPERTIES(generate_codebook PROPERTIES
> IMPORTED_LOCATION_RELEASE "${S}/gr-vocoder/lib/generate_codebook")'
> >>${S}/gr-vocoder/lib/generate_codebook.txt }
> 
> do_compile_prepend() { -	cp ${S}/gr-vocoder/lib/codec2/defines.h
> ${OECMAKE_BUILDPATH}/gr-vocoder/lib/codec2 +    cp
> ${S}/gr-vocoder/lib/codec2/defines.h
> ${OECMAKE_BUILDPATH}/gr-vocoder/lib/codec2 }
> 
> PACKAGES += " \ -  ${PN}-examples \ -  ${PN}-grc \ +    ${PN}-examples \ 
> +    ${PN}-grc \ "
> 
> FILES_${PN}-grc = "${datadir}/gnuradio/grc" @@ -57,7 +57,7 @@ FILES_${PN}
> += "${prefix}/etc/gnuradio/*" FILES_${PN}-dbg +=
> "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \ 
> ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \ 
> ${datadir}/gnuradio/examples/*/.debug \ -		   " +           " 
> FILES_${PN}-examples = "${datadir}/gnuradio/examples"
> 
> PV = "3.6.4.1" @@ -96,7 +96,7 @@ EXTRA_OEMAKE = "-C
> ${OECMAKE_BUILDPATH}"
> 
> # Only builds for machines with neon instructions. Problem is in upstream
> cmake. python () { -        if not oe.utils.contains ('TUNE_FEATURES',
> 'neon', True, False, d): -                raise
> bb.parse.SkipPackage("'neon' not in TUNE_FEATURES") +    if not
> oe.utils.contains ('TUNE_FEATURES', 'neon', True, False, d): +
> raise bb.parse.SkipPackage("'neon' not in TUNE_FEATURES") }
> 
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
> b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb index
> e62531f..c1cac1e 100644 ---
> a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb +++
> b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb @@ -13,29
> +13,29 @@ PR = "r0" DEFAULT_PREFERENCE = "-1"
> 
> SRC_URI = " \ -  http://hostap.epitest.fi/releases/hostapd-${PV}.tar.gz
> \ -  file://defconfig \ -  file://init \ +
> http://hostap.epitest.fi/releases/hostapd-${PV}.tar.gz \ +
> file://defconfig \ +    file://init \ "
> 
> S = "${WORKDIR}/hostapd-${PV}/hostapd"
> 
> 
> do_configure() { -	install -m 0644 ${WORKDIR}/defconfig ${S}/.config +
> install -m 0644 ${WORKDIR}/defconfig ${S}/.config }
> 
> do_compile() { -	export CFLAGS="-MMD -O2 -Wall -g
> -I${STAGING_INCDIR}/libnl3" -	make +    export CFLAGS="-MMD -O2 -Wall -g
> -I${STAGING_INCDIR}/libnl3" +    make }
> 
> do_install() { -	install -d ${D}${sbindir} ${D}${sysconfdir}/init.d -
> install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir} -	install -m 0755
> ${S}/hostapd ${D}${sbindir} -	install -m 0755 ${S}/hostapd_cli
> ${D}${sbindir} -	install -m 755 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/hostapd +    install -d ${D}${sbindir}
> ${D}${sysconfdir}/init.d +    install -m 0644 ${S}/hostapd.conf
> ${D}${sysconfdir} +    install -m 0755 ${S}/hostapd ${D}${sbindir} +
> install -m 0755 ${S}/hostapd_cli ${D}${sbindir} +    install -m 755
> ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd }
> 
> CONFFILES_${PN} += "${sysconfdir}/hostapd.conf" diff --git
> a/meta-oe/recipes-connectivity/iw/iw_3.6.bb
> b/meta-oe/recipes-connectivity/iw/iw_3.6.bb index 42a43c3..8fa3272
> 100644 --- a/meta-oe/recipes-connectivity/iw/iw_3.6.bb +++
> b/meta-oe/recipes-connectivity/iw/iw_3.6.bb @@ -19,5 +19,5 @@
> SRC_URI[sha256sum] =
> "df11036ac11df31f44083da962a6e9c74bdea7c01c596c4b5840f948cd EXTRA_OEMAKE
> = ""
> 
> do_install() { -	oe_runmake DESTDIR=${D} install +    oe_runmake
> DESTDIR=${D} install } diff --git
> a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
> b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb index
> 134e2e5..ebaa485 100644 ---
> a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb +++
> b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb @@
> -12,5 +12,5 @@ SRC_URI[sha256sum] =
> "0cb09e26678d1531a4fd40a748abff5142bfdad3ae11cfe3bb7ad7317a inherit
> autotools lib_package
> 
> do_compile_append() { -	sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc 
> +    sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc } diff --git
> a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
> b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb index
> ec426a5..1020fd2 100644 ---
> a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb +++
> b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb @@ -20,5 +20,5 @@ S
> = "${WORKDIR}/${PN}-${PV}" inherit autotools binconfig
> 
> do_configure_prepend() { -        rm -f aclocal.m4 Makefile.am ltmain.sh 
> +    rm -f aclocal.m4 Makefile.am ltmain.sh } diff --git
> a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
> b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb 
> index cc6abd7..e63955d 100644 ---
> a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb 
> +++
> b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb 
> @@ -23,12 +23,12 @@ SRC_URI[sha256sum] =
> "a178ed2f0b5a1045ec47b217ea531d0feba9208f6bcfe64b701174a5c1 S =
> "${WORKDIR}/NetworkManager-${PV}"
> 
> EXTRA_OECONF = " \ -		--with-distro=debian \ -		--with-crypto=gnutls \ -
> --disable-more-warnings \ -
> --with-dhclient=${base_sbindir}/dhclient \ -
> --with-iptables=${sbindir}/iptables \ -                --with-tests \ +
> --with-distro=debian \ +    --with-crypto=gnutls \ +
> --disable-more-warnings \ +    --with-dhclient=${base_sbindir}/dhclient
> \ +    --with-iptables=${sbindir}/iptables \ +    --with-tests \ "
> 
> EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd',
> '--with-systemdsystemunitdir=${systemd_unitdir}/system/',
> '--without-systemdsystemunitdir', d)}" @@ -42,21 +42,21 @@
> do_configure_prepend() {
> 
> # Work around dbus permission problems since we lack a proper at_console 
> do_install_prepend() { -	sed -i -e s:deny:allow:g
> ${S}/src/NetworkManager.conf -	sed -i -e s:deny:allow:g
> ${S}/callouts/nm-dispatcher.conf +    sed -i -e s:deny:allow:g
> ${S}/src/NetworkManager.conf +    sed -i -e s:deny:allow:g
> ${S}/callouts/nm-dispatcher.conf }
> 
> do_install_append () { -	install -d ${D}/etc/dbus-1/event.d -	#
> Additional test binaries -	install -d ${D}/usr/bin -	install -m 0755
> ${S}/test/.libs/libnm* ${D}/usr/bin +    install -d
> ${D}/etc/dbus-1/event.d +    # Additional test binaries +    install -d
> ${D}/usr/bin +    install -m 0755 ${S}/test/.libs/libnm* ${D}/usr/bin
> 
> -	install -d ${D}/etc/NetworkManager/ +    install -d
> ${D}/etc/NetworkManager/
> 
> -	# Install an empty VPN folder as nm-connection-editor will happily
> segfault without it :o. -	# With or without VPN support built in ;). -
> install -d ${D}/etc/NetworkManager/VPN +    # Install an empty VPN folder
> as nm-connection-editor will happily segfault without it :o. +    # With
> or without VPN support built in ;). +    install -d
> ${D}/etc/NetworkManager/VPN }
> 
> PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests" @@ -66,23
> +66,23 @@ FILES_libnmglib += "${libdir}/libnm_glib.so.*" 
> FILES_libnmglib-vpn += "${libdir}/libnm_glib_vpn.so.*"
> 
> FILES_${PN} += " \ -		${libexecdir} \ -
> ${libdir}/pppd/*/nm-pppd-plugin.so \ -		${libdir}/NetworkManager/*.so \ -
> ${datadir}/polkit-1 \ -		${datadir}/dbus-1 \ -		${base_libdir}/udev/* \ -
> ${systemd_unitdir}/system/NetworkManager-wait-online.service \ +
> ${libexecdir} \ +    ${libdir}/pppd/*/nm-pppd-plugin.so \ +
> ${libdir}/NetworkManager/*.so \ +    ${datadir}/polkit-1 \ +
> ${datadir}/dbus-1 \ +    ${base_libdir}/udev/* \ +
> ${systemd_unitdir}/system/NetworkManager-wait-online.service \ "
> 
> RRECOMMENDS_${PN} += "iptables" RCONFLICTS_${PN} = "connman" 
> RDEPENDS_${PN} = "wpa-supplicant dhcp-client \ -
> ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \ -
> " +    ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \ 
> +"
> 
> FILES_${PN}-dbg += "${libdir}/NetworkManager/.debug/ \ -
> ${libdir}/pppd/*/.debug/ " +                    ${libdir}/pppd/*/.debug/
> "
> 
> FILES_${PN}-dev += "${datadir}/NetworkManager/gdb-cmd \ 
> ${libdir}/pppd/*/*.la \ diff --git
> a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
> b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb index
> d08420c..779c557 100644 ---
> a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb +++
> b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb @@ -21,8 +21,8 @@
> EXTRA_OECONF = "--enable-apps --enable-syslog --enable-dump \ 
> --with-usb=${STAGING_LIBDIR}/.. --with-bluez=${STAGING_LIBDIR}/.."
> 
> do_install_append() { -	install -d ${D}${datadir}/aclocal -	install -m
> 0644 ${S}/openobex.m4 ${D}${datadir}/aclocal +    install -d
> ${D}${datadir}/aclocal +    install -m 0644 ${S}/openobex.m4
> ${D}${datadir}/aclocal }
> 
> PACKAGES += "openobex-apps" diff --git
> a/meta-oe/recipes-connectivity/openvpn/openvpn.inc
> b/meta-oe/recipes-connectivity/openvpn/openvpn.inc index 50483ea..61f91a3
> 100644 --- a/meta-oe/recipes-connectivity/openvpn/openvpn.inc +++
> b/meta-oe/recipes-connectivity/openvpn/openvpn.inc @@ -8,7 +8,7 @@
> RRECOMMENDS_${PN} = "kernel-module-tun" INC_PR = "r2"
> 
> SRC_URI = "http://openvpn.net/release/openvpn-${PV}.tar.gz \ -
> file://openvpn" +    file://openvpn" S = "${WORKDIR}/openvpn-${PV}"
> 
> CFLAGS += "-fno-inline" @@ -16,7 +16,7 @@ CFLAGS += "-fno-inline" inherit
> autotools
> 
> do_install_append() { -	install -d ${D}/${sysconfdir}/init.d -	install -d
> ${D}/${sysconfdir}/openvpn -	install -m 755 ${WORKDIR}/openvpn
> ${D}/${sysconfdir}/init.d +    install -d ${D}/${sysconfdir}/init.d +
> install -d ${D}/${sysconfdir}/openvpn +    install -m 755
> ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d } diff --git
> a/meta-oe/recipes-connectivity/openvpn/openvpn_2.1.3.bb
> b/meta-oe/recipes-connectivity/openvpn/openvpn_2.1.3.bb index
> 34567bc..594b266 100644 ---
> a/meta-oe/recipes-connectivity/openvpn/openvpn_2.1.3.bb +++
> b/meta-oe/recipes-connectivity/openvpn/openvpn_2.1.3.bb @@ -17,9 +17,9 @@
> CFLAGS += "-fno-inline" EXTRA_OECONF += "--enable-password-save"
> 
> do_install_append() { -        install -d ${D}/${sysconfdir}/init.d -
> install -d ${D}/${sysconfdir}/openvpn -        install -m 755
> ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d +    install -d
> ${D}/${sysconfdir}/init.d +    install -d ${D}/${sysconfdir}/openvpn +
> install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d }
> 
> SRC_URI[md5sum] = "7486d3e270ba4b033e311d3e022a0ad7" diff --git
> a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
> b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb index
> 430cf65..f90736d 100644 ---
> a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb +++
> b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb @@ -12,10 +12,10 @@
> SRC_URI[md5sum] = "727892c0fb35c80ee3849fbe89b45350" SRC_URI[sha256sum] =
> "ca10e4827a5f0a36e093aee6ad81b5febf81f8097d7d858889ac51ff364168c1"
> 
> do_compile() { -        oe_runmake +    oe_runmake } do_install() { -
> oe_runmake DESTDIR=${D} install +    oe_runmake DESTDIR=${D} install }
> 
> inherit update-alternatives diff --git
> a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
> b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb index
> 7deac84..cbb4721 100644 ---
> a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb +++
> b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb @@ -22,12 +22,12
> @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${P}.tar.gz \ 
> inherit autotools update-rc.d
> 
> do_install() { -        # Install init script and default settings -
> install -m 0755 -d ${D}${sysconfdir}/default ${D}${sysconfdir}/init.d -
> install -m 0644 ${WORKDIR}/pppoe-server.default
> ${D}${sysconfdir}/default/pppoe-server -        install -m 0755
> ${WORKDIR}/pppoe-server.init ${D}${sysconfdir}/init.d/pppoe-server -
> # Install -        oe_runmake -C ${S} RPM_INSTALL_ROOT=${D}
> docdir=${docdir} install +    # Install init script and default settings 
> +    install -m 0755 -d ${D}${sysconfdir}/default
> ${D}${sysconfdir}/init.d +    install -m 0644
> ${WORKDIR}/pppoe-server.default ${D}${sysconfdir}/default/pppoe-server +
> install -m 0755 ${WORKDIR}/pppoe-server.init
> ${D}${sysconfdir}/init.d/pppoe-server +    # Install +    oe_runmake -C
> ${S} RPM_INSTALL_ROOT=${D} docdir=${docdir} install }
> 
> # Insert server package before main package diff --git
> a/meta-oe/recipes-connectivity/samba/samba.inc
> b/meta-oe/recipes-connectivity/samba/samba.inc index 42ddce5..a45e1e7
> 100644 --- a/meta-oe/recipes-connectivity/samba/samba.inc +++
> b/meta-oe/recipes-connectivity/samba/samba.inc @@ -49,51 +49,51 @@
> INITSCRIPT_PARAMS = "defaults" CONFFILES_${PN} =
> "${sysconfdir}/samba/smb.conf"
> 
> do_configure_prepend () { -	./script/mkversion.sh -	if [ ! -e
> acinclude.m4 ]; then -		touch aclocal.m4 -		cat aclocal.m4 >
> acinclude.m4 -	fi +    ./script/mkversion.sh +    if [ ! -e acinclude.m4
> ]; then +        touch aclocal.m4 +        cat aclocal.m4 > acinclude.m4 
> +    fi }
> 
> do_compile () { -	oe_runmake proto_exists -	base_do_compile +
> oe_runmake proto_exists +    base_do_compile }
> 
> do_install_append() { -	install -d ${D}${libdir}/pkgconfig/ -	cp
> ${WORKDIR}/tdb.pc ${D}${libdir}/pkgconfig/ -	mv
> ${D}${libdir}/libsmbclient.so ${D}${libdir}/libsmbclient.so.0 || true -
> ln -sf libsmbclient.so.0 ${D}${libdir}/libsmbclient.so -	mkdir -p
> ${D}${base_sbindir} -	rm -f ${D}${bindir}/*.old -	rm -f
> ${D}${sbindir}/*.old -	[ -f ${D}${sbindir}/mount.cifs ] && mv
> ${D}${sbindir}/mount.cifs ${D}${base_sbindir}/ -	[ -f
> ${D}${sbindir}/umount.cifs ] && mv ${D}${sbindir}/umount.cifs
> ${D}${base_sbindir}/ +    install -d ${D}${libdir}/pkgconfig/ +    cp
> ${WORKDIR}/tdb.pc ${D}${libdir}/pkgconfig/ +    mv
> ${D}${libdir}/libsmbclient.so ${D}${libdir}/libsmbclient.so.0 || true +
> ln -sf libsmbclient.so.0 ${D}${libdir}/libsmbclient.so +    mkdir -p
> ${D}${base_sbindir} +    rm -f ${D}${bindir}/*.old +    rm -f
> ${D}${sbindir}/*.old +    [ -f ${D}${sbindir}/mount.cifs ] && mv
> ${D}${sbindir}/mount.cifs ${D}${base_sbindir}/ +    [ -f
> ${D}${sbindir}/umount.cifs ] && mv ${D}${sbindir}/umount.cifs
> ${D}${base_sbindir}/
> 
> -	# This is needed for < 3.2.4 -	rm -f ${D}${sbindir}/mount.smbfs
> ${D}${base_sbindir}/mount.smbfs -	if [ -f ${D}${bindir}/smbmount ]; then 
> -		ln -sf ${bindir}/smbmount ${D}${base_sbindir}/mount.smb -		ln -sf
> ${bindir}/smbmount ${D}${base_sbindir}/mount.smbfs -	fi - +    # This is
> needed for < 3.2.4 +    rm -f ${D}${sbindir}/mount.smbfs
> ${D}${base_sbindir}/mount.smbfs +    if [ -f ${D}${bindir}/smbmount ];
> then +        ln -sf ${bindir}/smbmount ${D}${base_sbindir}/mount.smb +
> ln -sf ${bindir}/smbmount ${D}${base_sbindir}/mount.smbfs +    fi + 
> install -D -m 755 ${WORKDIR}/init.samba ${D}${sysconfdir}/init.d/samba 
> install -D -m 755 ${WORKDIR}/init.winbind
> ${D}${sysconfdir}/init.d/winbind -	install -D -m 644 ${WORKDIR}/smb.conf
> ${D}${sysconfdir}/samba/smb.conf -	install -D -m 644
> ${WORKDIR}/volatiles.03_samba
> ${D}${sysconfdir}/default/volatiles/volatiles.03_samba -	install -d
> ${D}/var/log/samba -	install -d ${D}/var/spool/samba +    install -D -m
> 644 ${WORKDIR}/smb.conf ${D}${sysconfdir}/samba/smb.conf +    install -D
> -m 644 ${WORKDIR}/volatiles.03_samba
> ${D}${sysconfdir}/default/volatiles/volatiles.03_samba +    install -d
> ${D}/var/log/samba +    install -d ${D}/var/spool/samba
> 
> -	# Install other stuff not installed by "make install" -	if [ -d
> ${WORKDIR}/${PN}-${PV}/nsswitch ]; then -		install -m 0644
> ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.so
> ${D}${libdir}/libnss_winbind.so.2 -		install -m 0644
> ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so
> ${D}${libdir}/libnss_wins.so.2 -	fi +    # Install other stuff not
> installed by "make install" +    if [ -d ${WORKDIR}/${PN}-${PV}/nsswitch
> ]; then +        install -m 0644
> ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.so
> ${D}${libdir}/libnss_winbind.so.2 +        install -m 0644
> ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so
> ${D}${libdir}/libnss_wins.so.2 +    fi
> 
> -	rmdir --ignore-fail-on-non-empty ${D}${base_sbindir} -	sed -i -e
> '1s,#!.*perl,#!${USRBINPATH}/env perl,' ${D}${bindir}/findsmb +    rmdir
> --ignore-fail-on-non-empty ${D}${base_sbindir} +    sed -i -e
> '1s,#!.*perl,#!${USRBINPATH}/env perl,' ${D}${bindir}/findsmb }
> 
> 
> @@ -102,8 +102,8 @@ pkg_postinst_libnss-winbind () { # add wins to the
> list of resolvers ns=$D${sysconfdir}/nsswitch.conf if ! grep
> "hosts:.*wins" $ns > /dev/null; then -	hosts="`grep '^hosts:' $ns`" -
> hosts=`echo "$hosts" | sed 's/\[/\\\\[/g; s/\]/\\\\]/g'` -	sed -i
> "s/$hosts/$hosts wins/" "$ns" +    hosts="`grep '^hosts:' $ns`" +
> hosts=`echo "$hosts" | sed 's/\[/\\\\[/g; s/\]/\\\\]/g'` +    sed -i
> "s/$hosts/$hosts wins/" "$ns" fi } diff --git
> a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb index
> 35d20c5..7c39dbe 100644 ---
> a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb +++
> b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb @@ -36,24 +36,24 @@
> SRC_URI[sha256sum] =
> "4f5a171a8d902c6b4f822ed875c51eb8339196d9ccf0ecd7f6521c966b S =
> "${WORKDIR}/samba-${PV}/source3"
> 
> EXTRA_OECONF += "\ -	ac_cv_path_PYTHON=/not/exist \ -
> ac_cv_path_PYTHON_CONFIG=/not/exist \ -
> SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \ -
> samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \ -	linux_getgrouplist_ok=no \ -
> samba_cv_HAVE_BROKEN_GETGROUPS=no \ -	samba_cv_HAVE_FTRUNCATE_EXTEND=yes
> \ -	samba_cv_have_setresuid=yes \ -	samba_cv_have_setresgid=yes \ -
> samba_cv_HAVE_WRFILE_KEYTAB=yes \ -	samba_cv_linux_getgrouplist_ok=yes \ 
> -	" +    ac_cv_path_PYTHON=/not/exist \ +
> ac_cv_path_PYTHON_CONFIG=/not/exist \ +
> SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \ +
> samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \ +    linux_getgrouplist_ok=no \ +
> samba_cv_HAVE_BROKEN_GETGROUPS=no \ +
> samba_cv_HAVE_FTRUNCATE_EXTEND=yes \ +    samba_cv_have_setresuid=yes \ +
> samba_cv_have_setresgid=yes \ +    samba_cv_HAVE_WRFILE_KEYTAB=yes \ +
> samba_cv_linux_getgrouplist_ok=yes \ +    "
> 
> do_configure() { -	gnu-configize --force -	oe_runconf +    gnu-configize
> --force +    oe_runconf }
> 
> do_compile () { -	base_do_compile +    base_do_compile } diff --git
> a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb
> b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb index
> e3180d2..3afae27 100644 ---
> a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb +++
> b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb @@ -15,11
> +15,11 @@ SRC_URI[sha256sum] =
> "217efa814fb031ad136bd3dcf89ca219dd6d7ee01aa7e65c56c56b7737 S =
> "${WORKDIR}/uhd-images_${PV}-release"
> 
> do_install() { -	install -d ${D}${datadir}/uhd/images -	install -d
> ${D}${datadir}/uhd/images/bit -	install -m 0644
> ${S}/share/uhd/images/bit/* ${D}${datadir}/uhd/images/bit -	rm -rf
> ${S}/share/uhd/images/bit -	install -m 0644 ${S}/share/uhd/images/*
> ${D}${datadir}/uhd/images +    install -d ${D}${datadir}/uhd/images +
> install -d ${D}${datadir}/uhd/images/bit +    install -m 0644
> ${S}/share/uhd/images/bit/* ${D}${datadir}/uhd/images/bit +    rm -rf
> ${S}/share/uhd/images/bit +    install -m 0644 ${S}/share/uhd/images/*
> ${D}${datadir}/uhd/images }
> 
> PACKAGES = "${PN}" diff --git
> a/meta-oe/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb
> b/meta-oe/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb index
> e5fd7ee..1669d96 100644 ---
> a/meta-oe/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb +++
> b/meta-oe/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb @@ -18,21 +18,21 @@
> CONFFILES_${PN} = "${sysconfdir}/vsftpd.conf" LDFLAGS_append =" -lcrypt
> -lcap"
> 
> do_configure() { -        # Fix hardcoded /usr, /etc, /var mess. -
> cat tunables.c|sed s:\"/usr:\"${prefix}:g|sed
> s:\"/var:\"${localstatedir}:g \ -        |sed
> s:\"${prefix}/share/empty:\"${localstatedir}/share/empty:g |sed
> s:\"/etc:\"${sysconfdir}:g > tunables.c.new -        mv tunables.c.new
> tunables.c +    # Fix hardcoded /usr, /etc, /var mess. +    cat
> tunables.c|sed s:\"/usr:\"${prefix}:g|sed s:\"/var:\"${localstatedir}:g
> \ +    |sed s:\"${prefix}/share/empty:\"${localstatedir}/share/empty:g
> |sed s:\"/etc:\"${sysconfdir}:g > tunables.c.new +    mv tunables.c.new
> tunables.c }
> 
> do_install() { -        install -d ${D}${sbindir} -        install -d
> ${D}${mandir}/man8 -        install -d ${D}${mandir}/man5 -
> oe_runmake 'DESTDIR=${D}' install -        install -d ${D}${sysconfdir} -
> install -m 0755 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf -
> install -d ${D}${sysconfdir}/init.d/ -        install -m 755
> ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd +    install -d
> ${D}${sbindir} +    install -d ${D}${mandir}/man8 +    install -d
> ${D}${mandir}/man5 +    oe_runmake 'DESTDIR=${D}' install +    install -d
> ${D}${sysconfdir} +    install -m 0755 ${WORKDIR}/vsftpd.conf
> ${D}${sysconfdir}/vsftpd.conf +    install -d ${D}${sysconfdir}/init.d/ +
> install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd }
> 
> INITSCRIPT_PACKAGES = "${PN}" diff --git
> a/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> b/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend index
> 5d06265..721ef19 100644 ---
> a/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend +++
> b/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend @@ -6,8 +6,8 @@
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:" SRC_URI +=
> "file://busybox-syslog.default"
> 
> do_install_append() { -	install -d ${D}${sysconfdir}/default -	install -m
> 0644 ${WORKDIR}/busybox-syslog.default
> ${D}${sysconfdir}/default/busybox-syslog +    install -d
> ${D}${sysconfdir}/default +    install -m 0644
> ${WORKDIR}/busybox-syslog.default
> ${D}${sysconfdir}/default/busybox-syslog }
> 
> FILES_${PN}-syslog += "${sysconfdir}/default/busybox-syslog" diff --git
> a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb index
> 03b510e..18d3efb 100644 ---
> a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb +++
> b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb @@ -12,11 +12,11 @@
> SRC_URI =
> "git://git.collabora.co.uk/git/user/alban/dbus-daemon-proxy;protocol=g S
> = "${WORKDIR}/git"
> 
> do_compile() { -	${CC} ${LDFLAGS} `pkg-config --cflags --libs
> dbus-glib-1` -o dbus-daemon-proxy dbus-daemon-proxy.c +    ${CC}
> ${LDFLAGS} `pkg-config --cflags --libs dbus-glib-1` -o dbus-daemon-proxy
> dbus-daemon-proxy.c }
> 
> do_install() { -	install -d ${D}${bindir} -	install -m 0755
> dbus-daemon-proxy ${D}${bindir} +    install -d ${D}${bindir} +
> install -m 0755 dbus-daemon-proxy ${D}${bindir} }
> 
> diff --git a/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb
> b/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb index
> 292a88a..e5b5439 100644 ---
> a/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb +++
> b/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb @@ -13,7 +13,7 @@
> inherit autotools BBCLASSEXTEND = "native"
> 
> do_configure_prepend() { -	# workaround for endless do_configure loop: -
> # make: Warning: File `Makefile.am' has modification time 5.3e+04 s in
> the future -	touch ${S}/* +    # workaround for endless do_configure
> loop: +    # make: Warning: File `Makefile.am' has modification time
> 5.3e+04 s in the future +    touch ${S}/* } diff --git
> a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
> b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb index a277a69..8288dfb
> 100644 --- a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb +++
> b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb @@ -6,18 +6,18 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949" 
> PR = "r0"
> 
> SRC_URI = "\ -
> ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.orig.tar.bz2 \ +
> ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.orig.tar.bz2 \ "
> 
> inherit autotools
> 
> do_configure_prepend() { -        mkdir -p ${S}/build-aux +    mkdir -p
> ${S}/build-aux }
> 
> do_install_append() { -        install -d ${D}${includedir}/fakeroot -
> install -m 644 *.h ${D}${includedir}/fakeroot +    install -d
> ${D}${includedir}/fakeroot +    install -m 644 *.h
> ${D}${includedir}/fakeroot }
> 
> # fakeroot needs getopt which is provided by the util-linux package diff
> --git a/meta-oe/recipes-core/glib-2.0/glibmm.inc
> b/meta-oe/recipes-core/glib-2.0/glibmm.inc index 15aeaac..bdb6ff8 100644 
> --- a/meta-oe/recipes-core/glib-2.0/glibmm.inc +++
> b/meta-oe/recipes-core/glib-2.0/glibmm.inc @@ -14,11 +14,11 @@ SRC_URI =
> "ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV} 
> inherit autotools pkgconfig
> 
> do_install_append() { -	install -d ${D}${datadir}/glibmm-2.4 -	install -d
> ${D}${datadir}/aclocal +    install -d ${D}${datadir}/glibmm-2.4 +
> install -d ${D}${datadir}/aclocal
> 
> -	install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.4/ -
> install -m 0644 scripts/glibmm_check_perl.m4 ${D}${datadir}/aclocal/ ||
> true +    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.4/ 
> +    install -m 0644 scripts/glibmm_check_perl.m4 ${D}${datadir}/aclocal/
> || true }
> 
> FILES_${PN} = "${libdir}/lib*.so.*" diff --git
> a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb index d87743b..4fd258f
> 100644 --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb +++
> b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb @@ -23,7 +23,7 @@
> inherit autotools pkgconfig
> 
> EXTRA_OECONF = "--with-jpeg8 "
> 
> -PACKAGES =+         "jpeg-tools libturbojpeg" +PACKAGES =+ "jpeg-tools
> libturbojpeg"
> 
> DESCRIPTION_jpeg-tools = "The jpeg-tools package includes the client
> programs for access libjpeg functionality.  These tools allow for the
> compression, decompression, transformation and display of JPEG files." 
> FILES_jpeg-tools =  "${bindir}/*" diff --git
> a/meta-oe/recipes-core/llvm/llvm-common.bb
> b/meta-oe/recipes-core/llvm/llvm-common.bb index 38ca1ee..96b716d 100644 
> --- a/meta-oe/recipes-core/llvm/llvm-common.bb +++
> b/meta-oe/recipes-core/llvm/llvm-common.bb @@ -7,13 +7,13 @@
> LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3 SRC_URI =
> "file://llvm-config"
> 
> do_install() { -  install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/ -
> install -m 0755 ${WORKDIR}/llvm-config
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ +    install -d
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ +    install -m 0755
> ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/ }
> 
> do_install_virtclass-native() { -  install -d ${D}${bindir} -  install -m
> 0755 ${WORKDIR}/llvm-config ${D}${bindir} +    install -d ${D}${bindir} +
> install -m 0755 ${WORKDIR}/llvm-config ${D}${bindir} }
> 
> BBCLASSEXTEND = "native" diff --git a/meta-oe/recipes-core/llvm/llvm.inc
> b/meta-oe/recipes-core/llvm/llvm.inc index 1fbb0ef..1767e31 100644 ---
> a/meta-oe/recipes-core/llvm/llvm.inc +++
> b/meta-oe/recipes-core/llvm/llvm.inc @@ -48,20 +48,20 @@ LLVM_RELEASE =
> "${PV}" OECMAKE_SOURCEPATH = ".." OECMAKE_BUILDPATH = "build" 
> EXTRA_OECMAKE = "\ -
> -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen \ -
> -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH} \ -  -DCMAKE_LINKER:FILEPATH=${LD}
> \ -  -DCMAKE_AR:FILEPATH=${AR} \ -  -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY}
> \ -  -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \ -
> -DCMAKE_RANLIB:FILEPATH=${RANLIB} \ -  -DCMAKE_STRIP:FILEPATH=${STRIP} \ 
> -  -DNM_PATH:FILEPATH=${NM} \ -  -DLLVM_ENABLE_PIC:BOOL=ON \ -
> -DLLVM_TARGET_ARCH:STRING=${LLVM_ARCH} \ -
> -DLLVM_ENABLE_ASSERTIONS:BOOL=ON \ -
> -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \ -  -DBUILD_SHARED_LIBS:BOOL=ON
> \ +
> -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen \ +
> -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH} \ +    -DCMAKE_LINKER:FILEPATH=${LD}
> \ +    -DCMAKE_AR:FILEPATH=${AR} \ +
> -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \ +
> -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \ +
> -DCMAKE_RANLIB:FILEPATH=${RANLIB} \ +    -DCMAKE_STRIP:FILEPATH=${STRIP}
> \ +    -DNM_PATH:FILEPATH=${NM} \ +    -DLLVM_ENABLE_PIC:BOOL=ON \ +
> -DLLVM_TARGET_ARCH:STRING=${LLVM_ARCH} \ +
> -DLLVM_ENABLE_ASSERTIONS:BOOL=ON \ +
> -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \ +
> -DBUILD_SHARED_LIBS:BOOL=ON \ " # We need to reset this to avoid breakage
> as we build out of tree TOOLCHAIN_OPTIONS = "" @@ -71,14 +71,14 @@
> PACKAGES_DYNAMIC = "llvm-*" # the difference to the non-native build is
> that we do not need # to declare the location of the tblgen executable. 
> EXTRA_OECMAKE_virtclass-native = "\ -
> -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH} \ -  -DCMAKE_LINKER:FILEPATH=${LD}
> \ -  -DCMAKE_AR:FILEPATH=${AR} \ -  -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY}
> \ -  -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \ -
> -DCMAKE_RANLIB:FILEPATH=${RANLIB} \ -  -DCMAKE_STRIP:FILEPATH=${STRIP} \ 
> -  -DNM_PATH:FILEPATH=${NM} \ +    -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH}
> \ +    -DCMAKE_LINKER:FILEPATH=${LD} \ +    -DCMAKE_AR:FILEPATH=${AR} \ +
> -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \ +
> -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \ +
> -DCMAKE_RANLIB:FILEPATH=${RANLIB} \ +    -DCMAKE_STRIP:FILEPATH=${STRIP}
> \ +    -DNM_PATH:FILEPATH=${NM} \ "
> 
> PACKAGES_virtclass-native = "" @@ -115,7 +115,7 @@ do_install() { install
> -d ${D}${includedir}/llvm${LLVM_RELEASE} install -d
> ${D}${libdir}/llvm${LLVM_RELEASE}
> 
> -    #	Move headers into their own directory +    #    Move headers into
> their own directory cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm
> \ ${D}${includedir}/llvm${LLVM_RELEASE}/ cp -R
> ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \ @@ -124,67 +124,67 @@
> do_install() { find ${WORKDIR}/llvm-install/${prefix}/lib -name "*"
> -maxdepth 1 -exec \ install {} ${D}${libdir}/llvm${LLVM_RELEASE} \;
> 
> -	#	I dont know another way out. Binaries are installed into a special
> subdir -	find ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1
> -exec \ -	install {} ${D}${bindir}/llvm${LLVM_RELEASE} \; +    #    I
> dont know another way out. Binaries are installed into a special subdir +
> find ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1 -exec \ 
> +    install {} ${D}${bindir}/llvm${LLVM_RELEASE} \;
> 
> -	# LLVM does not install this by default. -	install bin/tblgen
> ${D}${bindir}/llvm${LLVM_RELEASE} +    # LLVM does not install this by
> default. +    install bin/tblgen ${D}${bindir}/llvm${LLVM_RELEASE}
> 
> # we install it here unmodified for native and none native and overwrite
> it # later for native case install -d ${D}${bindir} install -m 0755
> bin/llvm-config ${D}${bindir}
> 
> -	# Fix the paths in the config script to make it find the binaries and -
> # library files. Doing so allows 3rd party configure scripts working -	#
> unmodified. -	sed -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR =
> "${STAGING_DIR_TARGET}";!' \ -		-e's!my.*INCLUDEDIR =.*!my $INCLUDEDIR =
> "${STAGING_INCDIR}/llvm${LLVM_RELEASE}";!' \ -		-e's!my.*LIBDIR.*!my
> $LIBDIR = "${STAGING_LIBDIR}/llvm${LLVM_RELEASE}";!' \ -
> -e's!my.*BINDIR.*!my $BINDIR = "${STAGING_BINDIR}/llvm${LLVM_RELEASE}";!'
> \ -		bin/llvm-config > bin/llvm-config${LLVM_RELEASE} +    # Fix the
> paths in the config script to make it find the binaries and +    #
> library files. Doing so allows 3rd party configure scripts working +    #
> unmodified. +    sed -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR =
> "${STAGING_DIR_TARGET}";!' \ +        -e's!my.*INCLUDEDIR =.*!my
> $INCLUDEDIR = "${STAGING_INCDIR}/llvm${LLVM_RELEASE}";!' \ +
> -e's!my.*LIBDIR.*!my $LIBDIR = "${STAGING_LIBDIR}/llvm${LLVM_RELEASE}";!'
> \ +        -e's!my.*BINDIR.*!my $BINDIR =
> "${STAGING_BINDIR}/llvm${LLVM_RELEASE}";!' \ +        bin/llvm-config >
> bin/llvm-config${LLVM_RELEASE}
> 
> install -d ${SYSROOT_DESTDIR}${bindir_crossscripts} install -m 0755
> bin/llvm-config${LLVM_RELEASE} ${SYSROOT_DESTDIR}${bindir_crossscripts} 
> }
> 
> do_install_virtclass-native() { -	# Install into a private directory to
> be able to reorganize the files. +    # Install into a private directory
> to be able to reorganize the files.
> 
> cd ${OECMAKE_BUILDPATH}
> 
> oe_runmake DESTDIR=${WORKDIR}/llvm-install install
> 
> -	# Create our custom target directories -	install -d
> ${D}${bindir}/llvm${LLVM_RELEASE} -	install -d
> ${D}${includedir}/llvm${LLVM_RELEASE} -	install -d
> ${D}${libdir}/llvm${LLVM_RELEASE} - -	#	Move headers into their own
> directory -	cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm \ -
> ${D}${includedir}/llvm${LLVM_RELEASE}/ -	cp -R
> ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \ -
> ${D}${includedir}/llvm${LLVM_RELEASE}/ - -	find
> ${WORKDIR}/llvm-install/${prefix}/lib -name "*" -maxdepth 1 -exec \ -
> install {} ${D}${libdir}/llvm${LLVM_RELEASE} \; - -	#	I dont know another
> way out. Binaries are installed into a special subdir -	find
> ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1 -exec \ -
> install {} ${D}${bindir}/llvm${LLVM_RELEASE} \; - -	# LLVM does not
> install this by default. -	install bin/tblgen
> ${D}${bindir}/llvm${LLVM_RELEASE} - -	# Fix the paths in the config
> script to make it find the binaries and -	# library files. Doing so
> allows 3rd party configure scripts working -	# unmodified. -	sed
> -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR = "${STAGING_DIR_TARGET}";!' \ -
> -e's!my.*INCLUDEDIR =.*!my $INCLUDEDIR =
> "${STAGING_INCDIR}/llvm${LLVM_RELEASE}";!' \ -		-e's!my.*LIBDIR.*!my
> $LIBDIR = "${STAGING_LIBDIR}/llvm${LLVM_RELEASE}";!' \ -
> -e's!my.*BINDIR.*!my $BINDIR = "${STAGING_BINDIR}/llvm${LLVM_RELEASE}";!'
> \ -		bin/llvm-config > bin/llvm-config${LLVM_RELEASE} +    # Create our
> custom target directories +    install -d
> ${D}${bindir}/llvm${LLVM_RELEASE} +    install -d
> ${D}${includedir}/llvm${LLVM_RELEASE} +    install -d
> ${D}${libdir}/llvm${LLVM_RELEASE} + +    #    Move headers into their own
> directory +    cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm \ +
> ${D}${includedir}/llvm${LLVM_RELEASE}/ +    cp -R
> ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \ +
> ${D}${includedir}/llvm${LLVM_RELEASE}/ + +    find
> ${WORKDIR}/llvm-install/${prefix}/lib -name "*" -maxdepth 1 -exec \ +
> install {} ${D}${libdir}/llvm${LLVM_RELEASE} \; + +    #    I dont know
> another way out. Binaries are installed into a special subdir +    find
> ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1 -exec \ +
> install {} ${D}${bindir}/llvm${LLVM_RELEASE} \; + +    # LLVM does not
> install this by default. +    install bin/tblgen
> ${D}${bindir}/llvm${LLVM_RELEASE} + +    # Fix the paths in the config
> script to make it find the binaries and +    # library files. Doing so
> allows 3rd party configure scripts working +    # unmodified. +    sed
> -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR = "${STAGING_DIR_TARGET}";!' \ +
> -e's!my.*INCLUDEDIR =.*!my $INCLUDEDIR =
> "${STAGING_INCDIR}/llvm${LLVM_RELEASE}";!' \ +
> -e's!my.*LIBDIR.*!my $LIBDIR = "${STAGING_LIBDIR}/llvm${LLVM_RELEASE}";!'
> \ +        -e's!my.*BINDIR.*!my $BINDIR =
> "${STAGING_BINDIR}/llvm${LLVM_RELEASE}";!' \ +        bin/llvm-config >
> bin/llvm-config${LLVM_RELEASE}
> 
> install -d ${D}${bindir} install -m 0755 bin/llvm-config${LLVM_RELEASE}
> ${D}${bindir} diff --git a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
> b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb index b956aad..68cf70b 100644 
> --- a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb +++
> b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb @@ -7,20 +7,20 @@
> SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch " 
> PARALLEL_MAKE_virtclass-native = ""
> 
> EXTRA_OECMAKE = "\ -
> -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen \ -
> -DLLVM_TARGETS_TO_BUILD="X86;${LLVM_ARCH}" \ -
> -DCMAKE_LINKER:FILEPATH=${LD} \ -  -DCMAKE_AR:FILEPATH=${AR} \ -
> -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \ -
> -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \ -
> -DCMAKE_RANLIB:FILEPATH=${RANLIB} \ -  -DCMAKE_STRIP:FILEPATH=${STRIP} \ 
> -  -DNM_PATH:FILEPATH=${NM} \ -  -DLLVM_ENABLE_PIC:BOOL=ON \ -
> -DLLVM_TARGET_ARCH:STRING=${LLVM_ARCH} \ -
> -DLLVM_ENABLE_ASSERTIONS:BOOL=ON \ -
> -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \ -  -DBUILD_SHARED_LIBS:BOOL=ON
> \ +
> -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen \ +
> -DLLVM_TARGETS_TO_BUILD="X86;${LLVM_ARCH}" \ +
> -DCMAKE_LINKER:FILEPATH=${LD} \ +    -DCMAKE_AR:FILEPATH=${AR} \ +
> -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \ +
> -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \ +
> -DCMAKE_RANLIB:FILEPATH=${RANLIB} \ +    -DCMAKE_STRIP:FILEPATH=${STRIP}
> \ +    -DNM_PATH:FILEPATH=${NM} \ +    -DLLVM_ENABLE_PIC:BOOL=ON \ +
> -DLLVM_TARGET_ARCH:STRING=${LLVM_ARCH} \ +
> -DLLVM_ENABLE_ASSERTIONS:BOOL=ON \ +
> -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \ +
> -DBUILD_SHARED_LIBS:BOOL=ON \ "
> 
> LLVM_RELEASE = "2.9" diff --git
> a/meta-oe/recipes-core/meta/distro-feed-configs.bb
> b/meta-oe/recipes-core/meta/distro-feed-configs.bb index cff0946..462af45
> 100644 --- a/meta-oe/recipes-core/meta/distro-feed-configs.bb +++
> b/meta-oe/recipes-core/meta/distro-feed-configs.bb @@ -13,8 +13,8 @@
> do_compile() { done } do_install () { -        install -d
> ${D}${sysconfdir}/opkg -        install -m 0644 ${S}/${sysconfdir}/opkg/*
> ${D}${sysconfdir}/opkg/ +    install -d ${D}${sysconfdir}/opkg +
> install -m 0644 ${S}/${sysconfdir}/opkg/* ${D}${sysconfdir}/opkg/ }
> 
> PACKAGE_ARCH = "${MACHINE_ARCH}" diff --git
> a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb index
> 402579c..389d72b 100644 ---
> a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb +++
> b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb @@ -35,9 +35,9
> @@ RCONFLICTS_${PN} += "task-basic" # Util-linux (u)mount is included
> because the busybox one can't handle /etc/mtab being symlinked to
> /proc/mounts # RDEPENDS_${PN} = "\ -	${TASK_BASIC_SSHDAEMON} \ -
> avahi-daemon avahi-utils \ -	" +    ${TASK_BASIC_SSHDAEMON} \ +
> avahi-daemon avahi-utils \ +    "
> 
> # # The following section is split in 3: @@ -46,16 +46,16 @@
> RDEPENDS_${PN} = "\ #   3) Nice to have: packages that are nice to have,
> but aren't strictly needed # RRECOMMENDS_${PN} = "\ -
> ${MACHINE_EXTRA_RRECOMMENDS} \ -	${@base_contains("MACHINE_FEATURES",
> "usbhost", "usbutils", "", d)} \ -	${@base_contains("MACHINE_FEATURES",
> "alsa", "alsa-utils-alsamixer", "", d)} \ -
> ${@base_contains("MACHINE_FEATURES", "usbgadget", "kernel-module-g-ether
> kernel-module-g-serial kernel-module-g-mass-storage", "", d)} \ -	\ -
> ${@base_contains("DISTRO_FEATURES", "bluetooth", "bluez4", "", d)} \ -
> ${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "", d)}
> \ -	\ -	tzdata \ -	\ -	cpufrequtils \ -	htop \ +
> ${MACHINE_EXTRA_RRECOMMENDS} \ +    ${@base_contains("MACHINE_FEATURES",
> "usbhost", "usbutils", "", d)} \ +
> ${@base_contains("MACHINE_FEATURES", "alsa", "alsa-utils-alsamixer", "",
> d)} \ +    ${@base_contains("MACHINE_FEATURES", "usbgadget",
> "kernel-module-g-ether kernel-module-g-serial
> kernel-module-g-mass-storage", "", d)} \ +    \ +
> ${@base_contains("DISTRO_FEATURES", "bluetooth", "bluez4", "", d)} \ +
> ${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "", d)}
> \ +    \ +    tzdata \ +    \ +    cpufrequtils \ +    htop \ " diff
> --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb index
> 88b62b8..fa53a67 100644 ---
> a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb +++
> b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb @@ -18,36
> +18,36 @@ RCONFLICTS_${PN} += "task-cli-tools" RCONFLICTS_${PN}-debug +=
> "task-cli-tools-debug"
> 
> RDEPENDS_${PN} = "\ -  dbus-daemon-proxy \ -  dosfstools \ -  htop \ -
> iptables \ -  lsof \ -  mbuffer \ -  mtd-utils \ -  nano \ -
> nfs-utils-client \ -  nmon \ -  powertop \ -  screen \ -  socat \ -
> sysstat \ +    dbus-daemon-proxy \ +    dosfstools \ +    htop \ +
> iptables \ +    lsof \ +    mbuffer \ +    mtd-utils \ +    nano \ +
> nfs-utils-client \ +    nmon \ +    powertop \ +    screen \ +    socat
> \ +    sysstat \ "
> 
> RDEPENDS_${PN}-debug = "\ -  evtest \ -  devmem2 \ -  i2c-tools \ -  gdb
> \ -  procps \ -  pxaregs \ -  s3c24xx-gpio \ -  s3c64xx-gpio \ -
> serial-forward \ -  strace \ -  tcpdump \ +    evtest \ +    devmem2 \ +
> i2c-tools \ +    gdb \ +    procps \ +    pxaregs \ +    s3c24xx-gpio \ +
> s3c64xx-gpio \ +    serial-forward \ +    strace \ +    tcpdump \ "
> 
> RRECOMMENDS_${PN}-debug = "\ -  ltrace \ +    ltrace \ " diff --git
> a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
> b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb index 9ae25bb..8067e04
> 100644 --- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb +++
> b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb @@ -68,41 +68,41 @@
> SRCREV_FORMAT = "cloud9ide" S = "${WORKDIR}/git"
> 
> do_configure () { - cd ${WORKDIR}/o3 - node-waf -vv configure +    cd
> ${WORKDIR}/o3 +    node-waf -vv configure }
> 
> EXTRA_CXXFLAGS = "-Idefault/include -I../include -Idefault/hosts
> -I../hosts -Idefault/modules -I../modules -Idefault/deps -I../deps
> -I${STAGING_DIR_NATIVE}/usr/include/node4 -fPIC -DPIC"
> 
> do_compile () { - cd ${WORKDIR}/o3 - node4 tools/gluegen.js - cd hosts -
> ${CXX} ${TARGET_CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o sh_node.o
> node-o3/sh_node.cc - ${CXX} ${TARGET_CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o
> sh_node_libs.o node-o3/sh_node_libs.cc - cd .. - ${CXX} ${TARGET_LDFLAGS}
> hosts/sh_node.o hosts/sh_node_libs.o -o o3.node -shared -Wl,-Bdynamic
> -lxml2 +    cd ${WORKDIR}/o3 +    node4 tools/gluegen.js +    cd hosts +
> ${CXX} ${TARGET_CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o sh_node.o
> node-o3/sh_node.cc +    ${CXX} ${TARGET_CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o
> sh_node_libs.o node-o3/sh_node_libs.cc +    cd .. +    ${CXX}
> ${TARGET_LDFLAGS} hosts/sh_node.o hosts/sh_node_libs.o -o o3.node -shared
> -Wl,-Bdynamic -lxml2 }
> 
> do_install () { - install -m 0755 -d ${D}${datadir}/cloud9 ${D}${bindir}
> ${D}/var/lib/cloud9 - rsync -r --exclude=".*" ${S}/*
> ${D}${datadir}/cloud9 - - touch ${D}${bindir}/cloud9 - echo "#!/bin/sh" >
> ${D}${bindir}/cloud9 - echo "node4 ${datadir}/cloud9/bin/cloud9.js -l
> 0.0.0.0 -w /var/lib/cloud9 -p 3000" >> ${D}${bindir}/cloud9 - chmod 0755
> ${D}${bindir}/cloud9 - - install -m 0755 -d
> ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml -
> install -m 0644 ${WORKDIR}/index.js
> ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/index.js
>
> 
- - install -m 0644 ${WORKDIR}/o3/modules/o3.js
${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.js
> - install -m 0755 ${WORKDIR}/o3/o3.node
> ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.node
>
> 
- -
> -  install -m 0755 -d ${D}${sysconfdir}/avahi/services/ -  install -m
> 0644 ${WORKDIR}/cloud9-avahi.service ${D}${sysconfdir}/avahi/services/ -
>  -  install -d ${D}${systemd_unitdir}/system -  install -m 0644
> ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system +    install -m
> 0755 -d ${D}${datadir}/cloud9 ${D}${bindir} ${D}/var/lib/cloud9 +
> rsync -r --exclude=".*" ${S}/* ${D}${datadir}/cloud9 + +    touch
> ${D}${bindir}/cloud9 +    echo "#!/bin/sh" > ${D}${bindir}/cloud9 +
> echo "node4 ${datadir}/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9
> -p 3000" >> ${D}${bindir}/cloud9 +    chmod 0755 ${D}${bindir}/cloud9 + +
> install -m 0755 -d
> ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml +
> install -m 0644 ${WORKDIR}/index.js
> ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/index.js
>
> 
+    install -m 0644 ${WORKDIR}/o3/modules/o3.js
${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.js
> +    install -m 0755 ${WORKDIR}/o3/o3.node
> ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.node
>
> 
+
> +     install -m 0755 -d ${D}${sysconfdir}/avahi/services/ +     install
> -m 0644 ${WORKDIR}/cloud9-avahi.service
> ${D}${sysconfdir}/avahi/services/ + +     install -d
> ${D}${systemd_unitdir}/system +     install -m 0644
> ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system }
> 
> FILES_${PN}-dbg +=
> "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/.debug
> \ diff --git
> a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb index
> b0ff5cf..0369788 100644 ---
> a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb +++
> b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb @@ -23,18
> +23,18 @@ PLAT_powerpc64 = "ppc64" PLAT ?= "${HOST_ARCH}"
> 
> do_configure () { -	export PLATFORM=${PLAT} -	export COMPILER='gcc' -
> ${S}/configure \ -	--prefix=${prefix} \ -	--includedir=${includedir} \ -
> --libdir=${libdir} \ +    export PLATFORM=${PLAT} +    export
> COMPILER='gcc' +    ${S}/configure \ +    --prefix=${prefix} \ +
> --includedir=${includedir} \ +    --libdir=${libdir} \ }
> 
> do_compile () { -	oe_runmake +    oe_runmake }
> 
> do_install () { -	oe_runmake 'DESTDIR=${D}' install +    oe_runmake
> 'DESTDIR=${D}' install } diff --git
> a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
> b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb index 733b8ed..9a6a56f
> 100644 --- a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb +++
> b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb @@ -17,7 +17,7 @@
> SRC_URI[sha256sum] =
> "f180a5018eee6e3fe574854cb025af897dd9962b01d17d5752e626876d EXTRA_OECONF
> += "--disable-scrollkeeper"
> 
> do_configure_prepend() { -	sed -i '/^if HAVE_GNOME_DOC_UTILS/,/^endif/d'
> ${S}/Makefile.am +    sed -i '/^if HAVE_GNOME_DOC_UTILS/,/^endif/d'
> ${S}/Makefile.am }
> 
> FILES_${PN} += "${datadir}/icons" diff --git
> a/meta-oe/recipes-devtools/lemon/lemon.inc
> b/meta-oe/recipes-devtools/lemon/lemon.inc index 9a8d3ab..57b9fb7 100644 
> --- a/meta-oe/recipes-devtools/lemon/lemon.inc +++
> b/meta-oe/recipes-devtools/lemon/lemon.inc @@ -9,16 +9,16 @@ SRC_URI =
> "http://www.sqlite.org/sqlite-${PV}.tar.gz \ S =
> "${WORKDIR}/sqlite-${PV}/tool"
> 
> do_compile() { -	${CC} ${CFLAGS} lemon.c -c -o lemon.o -	${CCLD}
> ${LDFLAGS} lemon.o -o lemon +    ${CC} ${CFLAGS} lemon.c -c -o lemon.o +
> ${CCLD} ${LDFLAGS} lemon.o -o lemon }
> 
> do_install() { -	install -d ${D}${bindir} -	install -m 0755 lemon
> ${D}${bindir} -	install -m 0644 lempar.c ${D}${bindir} -	install -d
> ${D}${mandir}/man1 -	install -m 0644 ${WORKDIR}/lemon.1
> ${D}${mandir}/man1/ +    install -d ${D}${bindir} +    install -m 0755
> lemon ${D}${bindir} +    install -m 0644 lempar.c ${D}${bindir} +
> install -d ${D}${mandir}/man1 +    install -m 0644 ${WORKDIR}/lemon.1
> ${D}${mandir}/man1/ }
> 
> BBCLASSEXTEND = "native" diff --git
> a/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
> b/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb index
> 1ecbe68..b961e30 100644 ---
> a/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb +++
> b/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb @@ -21,15
> +21,15 @@ EXTRA_OEMAKE = "CC='${CC}'" HEADERS = "src/c-client/*.h
> src/osdep/unix/*.h c-client/auths.c c-client/linkage.c c-client/linkage.h
> c-client/osdep.h"
> 
> do_compile() { -        echo "SSLINCLUDE=${STAGING_INCDIR}
> SSLLIB=${STAGING_LIBDIR}" > ${S}/SPECIALS -        oe_runmake lnp +
> echo "SSLINCLUDE=${STAGING_INCDIR} SSLLIB=${STAGING_LIBDIR}" >
> ${S}/SPECIALS +    oe_runmake lnp }
> 
> do_install() { -        install -d ${D}${includedir}/c-client -
> install ${HEADERS} ${D}${includedir}/c-client -        install -d
> ${D}${libdir} -        install c-client/c-client.a
> ${D}${libdir}/libc-client.a +    install -d ${D}${includedir}/c-client +
> install ${HEADERS} ${D}${includedir}/c-client +    install -d
> ${D}${libdir} +    install c-client/c-client.a
> ${D}${libdir}/libc-client.a }
> 
> ALLOW_EMPTY_${PN} = "1" diff --git
> a/meta-oe/recipes-devtools/libgee/libgee.inc
> b/meta-oe/recipes-devtools/libgee/libgee.inc index 8542cde..c681285
> 100644 --- a/meta-oe/recipes-devtools/libgee/libgee.inc +++
> b/meta-oe/recipes-devtools/libgee/libgee.inc @@ -11,8 +11,8 @@ PE = "1"
> 
> inherit autotools vala do_configure_prepend() { -     MACROS="libtool.m4
> lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4" -      for i in
> ${MACROS}; do -         rm -f m4/$i -      done +    MACROS="libtool.m4
> lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4" +    for i in
> ${MACROS}; do +        rm -f m4/$i +    done } diff --git
> a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
> b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb index
> 4b8ff98..e721e7e 100644 ---
> a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb +++
> b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb @@ -22,42 +22,42 @@ S
> = "${WORKDIR}/git" LTPROOT = "/opt/ltp"
> 
> EXTRA_OEMAKE_append = " \ -	prefix=${LTPROOT} \ -
> CROSS_COMPILE=${HOST_PREFIX} \ -	SKIP_IDCHECK=1 \ -
> KERNEL_INC=${STAGING_KERNEL_DIR}/include \ -
> KERNEL_USR_INC=${STAGING_INCDIR} \ -	ALSA_INCPATH=${STAGING_INCDIR} \ -
> ALSA_LIBPATH=${STAGING_LIBDIR} \ -	PLATFORM=${MACHINE} \ +
> prefix=${LTPROOT} \ +    CROSS_COMPILE=${HOST_PREFIX} \ +
> SKIP_IDCHECK=1 \ +    KERNEL_INC=${STAGING_KERNEL_DIR}/include \ +
> KERNEL_USR_INC=${STAGING_INCDIR} \ +    ALSA_INCPATH=${STAGING_INCDIR} \ 
> +    ALSA_LIBPATH=${STAGING_LIBDIR} \ +    PLATFORM=${MACHINE} \ "
> 
> TARGET_CC_ARCH += "${LDFLAGS}"
> 
> FILES_${PN}-dbg += " \ -	${LTPROOT}/.debug \ -	${LTPROOT}/bin/.debug \ -
> ${LTPROOT}/runtest/.debug \ -	${LTPROOT}/testcases/bin/.debug \ -
> ${LTPROOT}/testcases/bin/*/bin/.debug \ -
> ${LTPROOT}/testcases/bin/*/test/.debug \ -
> ${LTPROOT}/testcases/bin/ddt/.debug \ -
> ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \ -
> ${LTPROOT}/testcases/bin/ddt/*/test/.debug \ +    ${LTPROOT}/.debug \ +
> ${LTPROOT}/bin/.debug \ +    ${LTPROOT}/runtest/.debug \ +
> ${LTPROOT}/testcases/bin/.debug \ +
> ${LTPROOT}/testcases/bin/*/bin/.debug \ +
> ${LTPROOT}/testcases/bin/*/test/.debug \ +
> ${LTPROOT}/testcases/bin/ddt/.debug \ +
> ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \ +
> ${LTPROOT}/testcases/bin/ddt/*/test/.debug \ "
> 
> FILES_${PN} += "${LTPROOT}/*"
> 
> do_configure() { -	cp ${S}/include/config.h.default
> ${S}/include/config.h -	cp ${S}/include/mk/config.mk.default
> ${S}/include/mk/config.mk -	cp ${S}/include/mk/features.mk.default
> ${S}/include/mk/features.mk -	echo "${TAG}" > ${S}/ChangeLog +    cp
> ${S}/include/config.h.default ${S}/include/config.h +    cp
> ${S}/include/mk/config.mk.default ${S}/include/mk/config.mk +    cp
> ${S}/include/mk/features.mk.default ${S}/include/mk/features.mk +    echo
> "${TAG}" > ${S}/ChangeLog }
> 
> do_install() { -	oe_runmake DESTDIR=${D} install -	install -d
> ${D}${datadir} -	cp -a ${D}${LTPROOT}/share/* ${D}${datadir} -	rm -rf
> ${D}${LTPROOT}/share/ +    oe_runmake DESTDIR=${D} install +    install
> -d ${D}${datadir} +    cp -a ${D}${LTPROOT}/share/* ${D}${datadir} +
> rm -rf ${D}${LTPROOT}/share/ } diff --git
> a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
> b/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb index 9fd423f..7cefa76
> 100644 --- a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb +++
> b/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb @@ -11,14 +11,14 @@ PR
> = "r5" COMPATIBLE_TARGET_SYS = "(?!sh[34])"
> 
> SRC_URI = "\ -
> ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=archive \ -
> ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.1.diff.gz;name=patch \ -
> file://add-sysdep.patch \ -  file://ltrace-compile.patch \ -
> file://ltrace-mips-remove-CP.patch \ -  file://ltrace-mips.patch \ -
> file://ltrace-ppc.patch \ -  file://ltrace-fix-sysdep_h-dependency.patch
> \ +
> ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=archive \ +
> ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.1.diff.gz;name=patch \ +
> file://add-sysdep.patch \ +    file://ltrace-compile.patch \ +
> file://ltrace-mips-remove-CP.patch \ +    file://ltrace-mips.patch \ +
> file://ltrace-ppc.patch \ +
> file://ltrace-fix-sysdep_h-dependency.patch \ " inherit autotools
> 
> @@ -26,53 +26,53 @@ export TARGET_CFLAGS = "${SELECTED_OPTIMIZATION}
> -isystem ${STAGING_INCDIR}" TARGET_CC_ARCH += "${LDFLAGS}"
> 
> do_configure_prepend() { -	case ${TARGET_ARCH} in -		arm*)  ln -sf
> ./linux-gnu sysdeps/linux-gnueabi ;; -		mips*)  ln -sf ./mipsel
> sysdeps/linux-gnu/mips ;; -	esac -	sed -e 's:uname -m:echo @HOST_CPU@:'
> \ -		sysdeps/linux-gnu/Makefile > sysdeps/linux-gnu/Makefile.in +    case
> ${TARGET_ARCH} in +        arm*)  ln -sf ./linux-gnu
> sysdeps/linux-gnueabi ;; +        mips*)  ln -sf ./mipsel
> sysdeps/linux-gnu/mips ;; +    esac +    sed -e 's:uname -m:echo
> @HOST_CPU@:' \ +        sysdeps/linux-gnu/Makefile >
> sysdeps/linux-gnu/Makefile.in
> 
> }
> 
> do_compile() { -	case ${TARGET_ARCH} in -		alpha*)   LTRACE_ARCH=alpha
> ;; -		arm*)     LTRACE_ARCH=arm ;; -		cris*)    LTRACE_ARCH=cris ;; -
> hppa*)    LTRACE_ARCH=parisc ;; -		i*86*)    LTRACE_ARCH=i386 ;; -
> ia64*)    LTRACE_ARCH=ia64 ;; -		mips*)    LTRACE_ARCH=mips ;; -		m68k*)
> LTRACE_ARCH=m68k ;; -		powerpc*) LTRACE_ARCH=ppc ;; -		s390*)
> LTRACE_ARCH=s390 ;; -		sh*)      LTRACE_ARCH=sh ;; -		sparc64*)
> LTRACE_ARCH=sparc64 ;; -		sparc*)   LTRACE_ARCH=sparc ;; -		x86_64*)
> LTRACE_ARCH=x86_64 ;; -	esac -	oe_runmake LDFLAGS="${TARGET_LDFLAGS}"
> LIBS="-lsupc++ -liberty -Wl,-Bstatic -lelf -Wl,-Bdynamic" ${EXTRA_OEMAKE}
> ARCH=${LTRACE_ARCH} +    case ${TARGET_ARCH} in +        alpha*)
> LTRACE_ARCH=alpha ;; +        arm*)     LTRACE_ARCH=arm ;; +
> cris*)    LTRACE_ARCH=cris ;; +        hppa*)    LTRACE_ARCH=parisc ;; +
> i*86*)    LTRACE_ARCH=i386 ;; +        ia64*)    LTRACE_ARCH=ia64 ;; +
> mips*)    LTRACE_ARCH=mips ;; +        m68k*)    LTRACE_ARCH=m68k ;; +
> powerpc*) LTRACE_ARCH=ppc ;; +        s390*)    LTRACE_ARCH=s390 ;; +
> sh*)      LTRACE_ARCH=sh ;; +        sparc64*) LTRACE_ARCH=sparc64 ;; +
> sparc*)   LTRACE_ARCH=sparc ;; +        x86_64*)  LTRACE_ARCH=x86_64 ;; +
> esac +    oe_runmake LDFLAGS="${TARGET_LDFLAGS}" LIBS="-lsupc++ -liberty
> -Wl,-Bstatic -lelf -Wl,-Bdynamic" ${EXTRA_OEMAKE} ARCH=${LTRACE_ARCH} }
> 
> do_install() { -	case ${TARGET_ARCH} in -		alpha*)   LTRACE_ARCH=alpha
> ;; -		arm*)     LTRACE_ARCH=arm ;; -		cris*)    LTRACE_ARCH=cris ;; -
> hppa*)    LTRACE_ARCH=parisc ;; -		i*86*)    LTRACE_ARCH=i386 ;; -
> ia64*)    LTRACE_ARCH=ia64 ;; -		mips*)    LTRACE_ARCH=mips ;; -		m68k*)
> LTRACE_ARCH=m68k ;; -		powerpc*) LTRACE_ARCH=ppc ;; -		s390*)
> LTRACE_ARCH=s390 ;; -		sh*)      LTRACE_ARCH=sh ;; -		sparc64*)
> LTRACE_ARCH=sparc64 ;; -		sparc*)   LTRACE_ARCH=sparc ;; -		x86_64*)
> LTRACE_ARCH=x86_64 ;; -	esac -	oe_runmake install ${EXTRA_OEMAKE}
> ARCH=${LTRACE_ARCH} DESTDIR=${D} +    case ${TARGET_ARCH} in +
> alpha*)   LTRACE_ARCH=alpha ;; +        arm*)     LTRACE_ARCH=arm ;; +
> cris*)    LTRACE_ARCH=cris ;; +        hppa*)    LTRACE_ARCH=parisc ;; +
> i*86*)    LTRACE_ARCH=i386 ;; +        ia64*)    LTRACE_ARCH=ia64 ;; +
> mips*)    LTRACE_ARCH=mips ;; +        m68k*)    LTRACE_ARCH=m68k ;; +
> powerpc*) LTRACE_ARCH=ppc ;; +        s390*)    LTRACE_ARCH=s390 ;; +
> sh*)      LTRACE_ARCH=sh ;; +        sparc64*) LTRACE_ARCH=sparc64 ;; +
> sparc*)   LTRACE_ARCH=sparc ;; +        x86_64*)  LTRACE_ARCH=x86_64 ;; +
> esac +    oe_runmake install ${EXTRA_OEMAKE} ARCH=${LTRACE_ARCH}
> DESTDIR=${D} }
> 
> SRC_URI[archive.md5sum] = "3fa7fe715ab879db08bd06d1d59fd90f" diff --git
> a/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
> b/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb index f303d87..ab43239
> 100644 --- a/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb +++
> b/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb @@ -22,30 +22,30 @@
> TARGET_CC_ARCH += " -fPIC ${LDFLAGS}" EXTRA_OEMAKE = "'CC=${CC} -fPIC'
> 'MYCFLAGS=${CFLAGS} -DLUA_USE_LINUX -fPIC' MYLDFLAGS='${LDFLAGS}'"
> 
> do_configure_prepend() { -	sed -i -e s:/usr/local:${prefix}:g
> src/luaconf.h -	sed -i -e s:lib/lua/5.1/:${base_libdir}/lua/5.1/:g
> src/luaconf.h +    sed -i -e s:/usr/local:${prefix}:g src/luaconf.h +
> sed -i -e s:lib/lua/5.1/:${base_libdir}/lua/5.1/:g src/luaconf.h }
> 
> do_compile () { -	oe_runmake linux +    oe_runmake linux }
> 
> do_install () { -	oe_runmake \ -		'INSTALL_TOP=${D}${prefix}' \ -
> 'INSTALL_BIN=${D}${bindir}' \ -		'INSTALL_INC=${D}${includedir}/' \ -
> 'INSTALL_MAN=${D}${mandir}/man1' \ -		'INSTALL_SHARE=${D}${datadir}/lua'
> \ -		'INSTALL_LIB=${D}${libdir}' \ -
> 'INSTALL_CMOD=${D}${libdir}/lua/5.1' \ -		install -	install -d
> ${D}${libdir}/pkgconfig -	install -m 0644 ${WORKDIR}/lua5.1.pc
> ${D}${libdir}/pkgconfig/lua5.1.pc -	rmdir ${D}${libdir}/lua/5.1 -	rmdir
> ${D}${libdir}/lua -	rmdir ${D}${datadir}/lua/5.1 -	rmdir
> ${D}${datadir}/lua +    oe_runmake \ +        'INSTALL_TOP=${D}${prefix}'
> \ +        'INSTALL_BIN=${D}${bindir}' \ +
> 'INSTALL_INC=${D}${includedir}/' \ +
> 'INSTALL_MAN=${D}${mandir}/man1' \ +
> 'INSTALL_SHARE=${D}${datadir}/lua' \ +        'INSTALL_LIB=${D}${libdir}'
> \ +        'INSTALL_CMOD=${D}${libdir}/lua/5.1' \ +        install +
> install -d ${D}${libdir}/pkgconfig +    install -m 0644
> ${WORKDIR}/lua5.1.pc ${D}${libdir}/pkgconfig/lua5.1.pc +    rmdir
> ${D}${libdir}/lua/5.1 +    rmdir ${D}${libdir}/lua +    rmdir
> ${D}${datadir}/lua/5.1 +    rmdir ${D}${datadir}/lua } BBCLASSEXTEND =
> "native"
> 
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
> b/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb index a7f96f8..e1fc11a
> 100644 --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb +++
> b/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb @@ -16,8 +16,8 @@ S =
> "${WORKDIR}/LuaJIT-${PV}" inherit pkgconfig binconfig
> 
> do_configure_prepend() { -	sed -i -e s:/usr/local:${prefix}:g
> ${S}/Makefile -	sed -i -e s:/lib$:${base_libdir}:g ${S}/Makefile +    sed
> -i -e s:/usr/local:${prefix}:g ${S}/Makefile +    sed -i -e
> s:/lib$:${base_libdir}:g ${S}/Makefile }
> 
> EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} TARGET_CFLAGS="${TOOLCHAIN_OPTIONS}"
> TARGET_LDFLAGS="${TOOLCHAIN_OPTIONS}"
> TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}"' @@ -29,25 +29,25 @@
> EXTRA_OEMAKE_append_arm = ' HOST_CC="${BUILD_CC} -m32"' 
> EXTRA_OEMAKE_append_mips64 = ' HOST_CC="${BUILD_CC} -m32"'
> 
> do_compile () { -	oe_runmake +    oe_runmake }
> 
> do_install () { -	oe_runmake 'DESTDIR=${D}' install -	rmdir
> ${D}${datadir}/lua/5.1 \ -	      ${D}${datadir}/lua \ -
> ${D}${libdir}/lua/5.1 \ -	      ${D}${libdir}/lua +    oe_runmake
> 'DESTDIR=${D}' install +    rmdir ${D}${datadir}/lua/5.1 \ +
> ${D}${datadir}/lua \ +          ${D}${libdir}/lua/5.1 \ +
> ${D}${libdir}/lua }
> 
> PACKAGES += 'luajit-common'
> 
> FILES_${PN} += "${libdir}/libluajit-5.1.so.2 \ -
> ${libdir}/libluajit-5.1.so.2.0.0 \ -	       " +
> ${libdir}/libluajit-5.1.so.2.0.0 \ +" FILES_${PN}-dev +=
> "${libdir}/libluajit-5.1.a \ -		    ${libdir}/libluajit-5.1.so \ -
> ${libdir}/pkgconfig/luajit.pc \ -                   " +
> ${libdir}/libluajit-5.1.so \ +    ${libdir}/pkgconfig/luajit.pc \ +" 
> FILES_luajit-common = "${datadir}/${BPN}-${PV}"
> 
> diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
> b/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb index
> 41b29fb..6a135f6 100644 ---
> a/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb +++
> b/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb @@ -15,13
> +15,13 @@ S = "${WORKDIR}/mercurial-${PV}" inherit native
> 
> EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR}
> STAGING_INCDIR=${STAGING_INCDIR} \ -        BUILD_SYS=${BUILD_SYS}
> HOST_SYS=${HOST_SYS} PREFIX=${prefix}" +    BUILD_SYS=${BUILD_SYS}
> HOST_SYS=${HOST_SYS} PREFIX=${prefix}"
> 
> do_configure_append () { -        sed -i -e
> 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python:g'
> ${S}/Makefile +    sed -i -e
> 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python:g'
> ${S}/Makefile }
> 
> do_install () { -        oe_runmake -e install-bin DESTDIR=${D}
> PREFIX=${prefix} +    oe_runmake -e install-bin DESTDIR=${D}
> PREFIX=${prefix} }
> 
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb index
> 58ca135..9a82f3b 100644 ---
> a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb +++
> b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb @@ -6,8 +6,8 @@
> LIC_FILES_CHKSUM = "file://LICENSE;md5=d6237f3a840aef5b7880fb4e49eecfe5" 
> DEPENDS = "openssl"
> 
> SRC_URI = " \ -  http://nodejs.org/dist/node-v${PV}.tar.gz \ -
> file://libev-cross-cc_${PV}.patch \ +
> http://nodejs.org/dist/node-v${PV}.tar.gz \ +
> file://libev-cross-cc_${PV}.patch \ " SRC_URI[md5sum] =
> "a6375eaa43db5356bf443e25b828ae16" SRC_URI[sha256sum] =
> "c01af05b933ad4d2ca39f63cac057f54f032a4d83cff8711e42650ccee24fce4" @@
> -18,29 +18,29 @@ S = "${WORKDIR}/node-v${PV}" CCACHE = ""
> 
> do_configure () { -  sed -i -e 's:/usr/lib:${STAGING_LIBDIR}:g' wscript -
> sed -i -e 's:/usr/local/lib:${STAGING_LIBDIR}:g' wscript -  ./configure
> --prefix=${prefix} --without-snapshot +    sed -i -e
> 's:/usr/lib:${STAGING_LIBDIR}:g' wscript +    sed -i -e
> 's:/usr/local/lib:${STAGING_LIBDIR}:g' wscript +    ./configure
> --prefix=${prefix} --without-snapshot }
> 
> do_compile () { -  make +    make }
> 
> do_install () { -  DESTDIR=${D} oe_runmake install +    DESTDIR=${D}
> oe_runmake install
> 
> -  # fix namespace conflicts with other nodejs recipes -  mv
> ${D}${bindir}/node ${D}${bindir}/node4 -  mv ${D}${bindir}/node-waf
> ${D}${bindir}/node4-waf +    # fix namespace conflicts with other nodejs
> recipes +    mv ${D}${bindir}/node ${D}${bindir}/node4 +    mv
> ${D}${bindir}/node-waf ${D}${bindir}/node4-waf
> 
> -  mv ${D}${includedir}/node ${D}${includedir}/node4 +    mv
> ${D}${includedir}/node ${D}${includedir}/node4
> 
> -  mv ${D}${libdir}/node ${D}${libdir}/node4 -  mv
> ${D}${libdir}/pkgconfig/nodejs.pc ${D}${libdir}/pkgconfig/nodejs4.pc -
> sed -i -e s:include/node:include/node4:
> ${D}${libdir}/pkgconfig/nodejs4.pc +    mv ${D}${libdir}/node
> ${D}${libdir}/node4 +    mv ${D}${libdir}/pkgconfig/nodejs.pc
> ${D}${libdir}/pkgconfig/nodejs4.pc +    sed -i -e
> s:include/node:include/node4: ${D}${libdir}/pkgconfig/nodejs4.pc
> 
> -  mv ${D}${datadir}/man/man1/node.1 ${D}${datadir}/man/man1/node4.1 +
> mv ${D}${datadir}/man/man1/node.1 ${D}${datadir}/man/man1/node4.1 }
> 
> FILES_${PN} += "${libdir}/node4/wafadmin" diff --git
> a/meta-oe/recipes-devtools/nodejs/nodejs_0.10.4.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.4.bb index 1e43b71..13e3136
> 100644 --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.10.4.bb +++
> b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.4.bb @@ -20,18 +20,18 @@
> ARCHFLAGS ?= ""
> 
> # Node is way too cool to use proper autotools, so we install two
> wrappers to forcefully inject proper arch cflags to workaround gypi 
> do_configure () { -  export LD="${CXX}" +    export LD="${CXX}"
> 
> -  ./configure --prefix=${prefix} --without-snapshot ${ARCHFLAGS} +
> ./configure --prefix=${prefix} --without-snapshot ${ARCHFLAGS} }
> 
> do_compile () { -  export LD="${CXX}" -  make BUILDTYPE=Release +
> export LD="${CXX}" +    make BUILDTYPE=Release }
> 
> do_install () { -  oe_runmake install DESTDIR=${D} +    oe_runmake
> install DESTDIR=${D} }
> 
> RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess
> python-crypt python-textutils python-netclient " diff --git
> a/meta-oe/recipes-devtools/orc/orc.inc
> b/meta-oe/recipes-devtools/orc/orc.inc index 3a9b2f4..4a356e4 100644 ---
> a/meta-oe/recipes-devtools/orc/orc.inc +++
> b/meta-oe/recipes-devtools/orc/orc.inc @@ -21,5 +21,5 @@ python
> populate_packages_prepend () { }
> 
> do_compile_prepend_virtclass-native () { -	sed -i -e 's#/tmp#.#g'
> ${S}/orc/orccodemem.c +    sed -i -e 's#/tmp#.#g' ${S}/orc/orccodemem.c 
> } diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
> b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb index
> f7c8063..6cacfa3 100644 ---
> a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb +++
> b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb @@ -29,17
> +29,17 @@ EXTRA_OECONF = "--with-security-framework=dummy \ "
> 
> #do_configure_prepend() { -#	mkdir -p m4 -#	echo "EXTRA_DIST=" >
> gtk-doc.make +#    mkdir -p m4 +#    echo "EXTRA_DIST=" > gtk-doc.make 
> #}
> 
> do_configure_append() { -	for i in $(find . -name Makefile) ; do -
> sed -i -e s:${STAGING_DIR_NATIVE}::g \ +    for i in $(find . -name
> Makefile) ; do +        sed -i -e s:${STAGING_DIR_NATIVE}::g \ -e
> s:${bindir}/mkdir:${STAGING_BINDIR_NATIVE}/mkdir:g \ -e
> s:/usr/bin/intltool-merge:${STAGING_BINDIR_NATIVE}/intltool-merge:g \ -
> $i -	done +               $i +    done }
> 
> PACKAGES =+ "${PN}-website" diff --git
> a/meta-oe/recipes-devtools/php/php.inc
> b/meta-oe/recipes-devtools/php/php.inc index 29e82fa..3e11046 100644 ---
> a/meta-oe/recipes-devtools/php/php.inc +++
> b/meta-oe/recipes-devtools/php/php.inc @@ -30,7 +30,7 @@ EXTRA_OECONF =
> "--enable-mbstring --enable-discard-path --enable-wddx \ 
> --disable-embedded-mysqli \ --with-mysql="${STAGING_DIR_TARGET}${prefix}"
> \ --with-mysqli="${STAGING_BINDIR_CROSS}/mysql_config" \ -
> --with-sqlite3=${STAGING_LIBDIR}/.. --enable-sqlite-utf8 \ +
> --with-sqlite3=${STAGING_LIBDIR}/.. --enable-sqlite-utf8 \ 
> --with-pdo-mysql="${STAGING_BINDIR_CROSS}/mysql_config" \ 
> --with-pdo-sqlite=${STAGING_LIBDIR}/.. ${COMMON_EXTRA_OECONF} \ " @@
> -82,8 +82,8 @@ do_install_append_pn-php() { install -m 0755
> ${S}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm 
> TMP=`dirname ${D}/${TMPDIR}` while test ${TMP} != ${D}; do -      rmdir
> ${TMP} -      TMP=`dirname ${TMP}`; +        rmdir ${TMP} +
> TMP=`dirname ${TMP}`; done }
> 
> diff --git a/meta-oe/recipes-devtools/php/php/phar-makefile.patch
> b/meta-oe/recipes-devtools/php/php/phar-makefile.patch index
> 6fde251..9d1dc7b 100644 ---
> a/meta-oe/recipes-devtools/php/php/phar-makefile.patch +++
> b/meta-oe/recipes-devtools/php/php/phar-makefile.patch @@ -4,8 +4,8 @@
> index fc93d1d..9a8cd65 100755 +++ b/ext/phar/Makefile.frag @@ -6,19 +6,8
> @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
> 
> - PHP_PHARCMD_SETTINGS = -d 'open_basedir=' -d 'output_buffering=0' -d
> 'memory_limit=-1' -d phar.readonly=0 -d 'safe_mode=0' -
> PHP_PHARCMD_EXECUTABLE = ` \ +    PHP_PHARCMD_SETTINGS = -d
> 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d
> phar.readonly=0 -d 'safe_mode=0' +    PHP_PHARCMD_EXECUTABLE = ` \ -	if
> test -x "$(top_builddir)/$(SAPI_CLI_PATH)"; then \ -
> $(top_srcdir)/build/shtool echo -n -- "$(top_builddir)/$(SAPI_CLI_PATH)
> -n"; \ -		if test "x$(PHP_MODULES)" != "x"; then \ @@ -21,6 +21,6 @@
> index fc93d1d..9a8cd65 100755 -	fi;` +		$(top_srcdir)/build/shtool echo
> -n -- "$(PHP_EXECUTABLE)"; ` + - PHP_PHARCMD_BANG =
> `$(top_srcdir)/build/shtool echo -n --
> "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
>
> 
+    PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n --
"$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
> 
> - $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc +
> $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc diff --git
> a/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
> b/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb index
> a449f03..2d913e4 100644 ---
> a/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb +++
> b/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb @@ -15,8 +15,8
> @@ PACKAGES =+ "${PN}-zoneinfo" FILES_${PN}-zoneinfo =
> "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
> 
> RDEPENDS_${PN} = "\ -  python-core \ -  python-datetime \ +
> python-core \ +    python-datetime \ "
> 
> SRC_URI[md5sum] = "2a5f25ab12fcefcf0b21348f2d47595a" diff --git
> a/meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb
> b/meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb index
> 788ba2f..751cce0 100644 ---
> a/meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb +++
> b/meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb @@ -10,7
> +10,7 @@ RDEPENDS_${PN} = "python-core python-distutils python-numpy
> freetype libpng" SRC_URI =
> "${SOURCEFORGE_MIRROR}/matplotlib/matplotlib-${PV}.tar.gz \ 
> file://fix_setup.patch \ file://fix_setupext.patch \ -	  " +      "
> 
> S = "${WORKDIR}/matplotlib-${PV}"
> 
> @@ -19,9 +19,9 @@ EXTRA_OECONF = "--disable-docs
> --with-python-includes=${STAGING_INCDIR}/../" inherit distutils
> 
> do_compile_prepend() { -         BUILD_SYS=${BUILD_SYS}
> HOST_SYS=${HOST_SYS} \ -         ${STAGING_BINDIR_NATIVE}/python setup.py
> build ${DISTUTILS_BUILD_ARGS} || \ -         true +
> BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \ +
> ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUILD_ARGS} ||
> \ +    true }
> 
> # need to export these variables for python-config to work diff --git
> a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb index
> 23bec15..369924c 100644 ---
> a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb +++
> b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb @@ -9,14 +9,14 @@
> SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \ 
> CONFIGFILESURI ?= ""
> 
> CONFIGFILESURI_aarch64 = "file://config.h \ -	   file://_numpyconfig.h \ 
> -	  " +       file://_numpyconfig.h \ +      " CONFIGFILESURI_arm =
> "file://config.h \ -	   file://numpyconfig.h \ -	  " +
> file://numpyconfig.h \ +      " CONFIGFILESURI_mipsel = "file://config.h
> \ -	   file://numpyconfig.h \ -	  " +       file://numpyconfig.h \ +
> "
> 
> CONFIGFILESURI_i586 = "file://config.h \ file://numpyconfig.h \ @@ -29,10
> +29,10 @@ inherit distutils # Make the build fail and replace *config.h
> with proper one # This is a ugly, ugly hack - Koen do_compile_prepend()
> { -         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \ -
> ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build
> ${DISTUTILS_BUILD_ARGS} || \ -         true -	 cp ${WORKDIR}/*config.h
> ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/ +
> BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \ +
> ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build
> ${DISTUTILS_BUILD_ARGS} || \ +    true +    cp ${WORKDIR}/*config.h
> ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/ }
> 
> FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a" 
> diff --git a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
> b/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb index
> d1b8530..1c64365 100644 ---
> a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb +++
> b/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb @@ -11,11 +11,11
> @@ S = "${WORKDIR}/${SRCNAME}-${PV}" inherit distutils
> 
> RDEPENDS_${PN} = "\ -  python-core \ -  python-io \ -  python-terminal \ 
> -  python-resource \ -  python-fcntl \ +    python-core \ +    python-io
> \ +    python-terminal \ +    python-resource \ +    python-fcntl \ "
> 
> 
> diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
> b/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb index
> 340796a..f21464a 100644 ---
> a/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb +++
> b/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb @@ -4,11 +4,11 @@
> AUTHOR = "Phil Thomson @ riverbank.co.uk" SECTION = "devel/python" 
> LICENSE = "GPLv2 & GPLv3 & GPL_EXCEPTION" LIC_FILES_CHKSUM = "\ -
> file://GPL_EXCEPTION.TXT;md5=b73b0be471db679533dc94781c14af58 \ -
> file://GPL_EXCEPTION_ADDENDUM.TXT;md5=c1e04ec2aa0911061005a801abf81e40 \ 
> -  file://OPENSOURCE-NOTICE.TXT;md5=6ad9123620cc04a22c394753ad4767d7 \ -
> file://LICENSE.GPL2;md5=276c6b9cad5f85a3af3534299825feff \ -
> file://LICENSE.GPL3;md5=eda942b9c6ba7eb0f40fee79e94950d5 \ +
> file://GPL_EXCEPTION.TXT;md5=b73b0be471db679533dc94781c14af58 \ +
> file://GPL_EXCEPTION_ADDENDUM.TXT;md5=c1e04ec2aa0911061005a801abf81e40 \ 
> +    file://OPENSOURCE-NOTICE.TXT;md5=6ad9123620cc04a22c394753ad4767d7 \ 
> +    file://LICENSE.GPL2;md5=276c6b9cad5f85a3af3534299825feff \ +
> file://LICENSE.GPL3;md5=eda942b9c6ba7eb0f40fee79e94950d5 \ "
> 
> DEPENDS = "sip-native python-sip" @@ -18,8 +18,8 @@ PYQT_OE_VERSION =
> "Qt_4_8_3" PR = "r1"
> 
> SRC_URI = "\ -  ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \ -
> file://pyqt-generated.patch;apply=no \ +
> ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \ +
> file://pyqt-generated.patch;apply=no \ " SRC_URI[md5sum] =
> "514e1f9597771dc732ba75ba9fa5c6b6" SRC_URI[sha256sum] =
> "a350f9e5c6d8062671c0f29bf1a70824719b18175ce8372c29bf7c1eda44b18d" @@
> -27,11 +27,11 @@ S = "${WORKDIR}/PyQt-x11-gpl-${PV}"
> 
> # arm and mips machines need some extra patches SRC_URI_append_arm = "\ -
> file://qreal_float_support.diff \ +    file://qreal_float_support.diff \ 
> "
> 
> SRC_URI_append_mipsel = "\ -  file://qreal_float_support.diff \ +
> file://qreal_float_support.diff \ "
> 
> inherit qt4x11 sip distutils-base @@ -51,16 +51,16 @@ SIP_MODULES =
> "QtCore QtDeclarative QtGui QtNetwork QtSql QtSvg QtXml QtWebKit" 
> MAKE_MODULES = "qpy ${SIP_MODULES}"
> 
> EXTRA_QMAKEVARS_POST += "\ -  INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/Qt \ -
> INCLUDEPATH+=${STAGING_INCDIR}/${PYTHON_DIR} \ -
> INCLUDEPATH+=../qpy/QtCore \ -  INCLUDEPATH+=../qpy/QtGui \ -
> INCLUDEPATH+=../qpy/QtDeclarative \ -
> INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtCore \ -
> INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtGui \ -
> INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtDeclarative \ -
> INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtWebKit \ -
> INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtNetwork \ +
> INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/Qt \ +
> INCLUDEPATH+=${STAGING_INCDIR}/${PYTHON_DIR} \ +
> INCLUDEPATH+=../qpy/QtCore \ +    INCLUDEPATH+=../qpy/QtGui \ +
> INCLUDEPATH+=../qpy/QtDeclarative \ +
> INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtCore \ +
> INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtGui \ +
> INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtDeclarative \ +
> INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtWebKit \ +
> INCLUDEPATH+=${OE_QMAKE_INCDIR_QT}/QtNetwork \ " FIX_QREAL = "\ " diff
> --git a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
> b/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb index
> 02ba6b7..0cce5cb 100644 ---
> a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb +++
> b/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb @@ -13,9 +13,9
> @@ inherit setuptools # FIXME might stop packaging serialwin32 and
> serialjava files
> 
> RDEPENDS_${PN} = "\ -  python-fcntl \ -  python-io \ -  python-stringold
> \ +    python-fcntl \ +    python-io \ +    python-stringold \ "
> 
> SRC_URI[md5sum] = "eec19df59fd75ba5a136992897f8e468" diff --git
> a/meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb
> b/meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb index
> ec54b44..741d037 100644 ---
> a/meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb +++
> b/meta-oe/recipes-devtools/python/python-pyudev_0.16.1.bb @@ -19,7 +19,7
> @@ do_configure_prepend() { }
> 
> RDEPENDS_${PN} = "\ -  python-ctypes \ -  python-subprocess \ -
> python-misc \ +    python-ctypes \ +    python-subprocess \ +
> python-misc \ " diff --git
> a/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
> b/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb index
> 4024282..e5956db 100644 ---
> a/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb +++
> b/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb @@ -7,7 +7,7 @@
> DEPENDS = "libusb1" PR = "r1"
> 
> SRC_URI = "\ -  ${SOURCEFORGE_MIRROR}/pyusb/${SRCNAME}-${PV}.tar.gz \ +
> ${SOURCEFORGE_MIRROR}/pyusb/${SRCNAME}-${PV}.tar.gz \ " SRC_URI[md5sum] =
> "9136b3dc019272c62a5b6d4eb624f89f" SRC_URI[sha256sum] =
> "dacbf7d568c0bb09a974d56da66d165351f1ba3c4d5169ab5b734266623e1736" diff
> --git a/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb
> b/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb index
> 625efd5..f433e20 100644 ---
> a/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb +++
> b/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb @@ -17,6 +17,6 @@
> S = "${WORKDIR}/PyYAML-${PV}" inherit distutils
> 
> do_configure_prepend() { -	# upstream setup.py overcomplicated, use ours 
> -	install -m 0644 ${WORKDIR}/setup.py ${S} +    # upstream setup.py
> overcomplicated, use ours +    install -m 0644 ${WORKDIR}/setup.py ${S} 
> } diff --git a/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb
> b/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb index
> 6be59c9..85d69c1 100644 ---
> a/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb +++
> b/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb @@ -17,11
> +17,11 @@ S = "${WORKDIR}/${SRCNAME}-${PV}" inherit distutils
> 
> RDEPENDS_${PN} = "\ -  python-core \ -  python-re \ -  python-io \ -
> python-netserver \ -  python-numbers \ +    python-core \ +    python-re
> \ +    python-io \ +    python-netserver \ +    python-numbers \ "
> 
> 
> diff --git a/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
> b/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb index
> 1159a2a..747d896 100644 ---
> a/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb +++
> b/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb @@ -29,17 +29,17
> @@ EXTRA_QMAKEVARS_POST += " TEMPLATE=lib \
> 
> 
> do_configure_prepend() { -	cat siplib.sbf.in | sed s,target,TARGET, | sed
> s,sources,SOURCES, | sed s,headers,HEADERS, | sed
> s,@CFG_MODULE_BASENAME@,sip, > siplib.pro -	cat siplib.c.in | sed
> s,@CFG_MODULE_BASENAME@,sip, > siplib.c -	cat sip.h.in | sed -e
> s,@CFG_MODULE_NAME@,sip,g > sip.h +    cat siplib.sbf.in | sed
> s,target,TARGET, | sed s,sources,SOURCES, | sed s,headers,HEADERS, | sed
> s,@CFG_MODULE_BASENAME@,sip, > siplib.pro +    cat siplib.c.in | sed
> s,@CFG_MODULE_BASENAME@,sip, > siplib.c +    cat sip.h.in | sed -e
> s,@CFG_MODULE_NAME@,sip,g > sip.h }
> 
> do_install() { -	install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/ -
> install -m 0755 libsip.so.1.0.0
> ${D}${libdir}/${PYTHON_DIR}/site-packages/sip.so -	# sipconfig.py
> sipdistutils.py -	install -d ${D}${includedir} -	install -m 0644
> ../siplib/sip.h ${D}${includedir}/sip.h +    install -d
> ${D}${libdir}/${PYTHON_DIR}/site-packages/ +    install -m 0755
> libsip.so.1.0.0 ${D}${libdir}/${PYTHON_DIR}/site-packages/sip.so +    #
> sipconfig.py sipdistutils.py +    install -d ${D}${includedir} +
> install -m 0644 ../siplib/sip.h ${D}${includedir}/sip.h }
> 
> FILES_${PN} = "${libdir}/${PYTHON_DIR}/site-packages/sip.so" diff --git
> a/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb
> b/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb index
> 5ba24c6..5272ab3 100644 ---
> a/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb +++
> b/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb @@ -14,7 +14,7 @@
> inherit distutils S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
> 
> do_configure_prepend() { -	# Adjust for OE header rename -	sed -i
> s:linux/i2c-dev.h:linux/i2c-dev-user.h: Module.mk -	sed -i
> s:linux/i2c-dev.h:linux/i2c-dev-user.h: smbusmodule.c +    # Adjust for
> OE header rename +    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h:
> Module.mk +    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h:
> smbusmodule.c } diff --git
> a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
> b/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb index
> 5320946..d585bfa 100644 ---
> a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb +++
> b/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb @@ -23,68
> +23,68 @@ do_install_append() { }
> 
> PACKAGES += "\ -  ${PN}-zsh \ -  ${PN}-test \ -  ${PN}-protocols \ -
> ${PN}-bin \ -  ${PN}-conch \ -  ${PN}-lore \ -  ${PN}-mail \ -
> ${PN}-names \ -  ${PN}-news \ -  ${PN}-runner \ -  ${PN}-web \ -
> ${PN}-words \ -  ${PN}-flow \ -  ${PN}-pair \ -  ${PN}-core \ +
> ${PN}-zsh \ +    ${PN}-test \ +    ${PN}-protocols \ +    ${PN}-bin \ +
> ${PN}-conch \ +    ${PN}-lore \ +    ${PN}-mail \ +    ${PN}-names \ +
> ${PN}-news \ +    ${PN}-runner \ +    ${PN}-web \ +    ${PN}-words \ +
> ${PN}-flow \ +    ${PN}-pair \ +    ${PN}-core \ "
> 
> RDEPENDS_${PN} = "python-core python-zopeinterface" RDEPENDS_${PN} += "\ 
> -  ${PN}-bin \ -  ${PN}-conch \ -  ${PN}-lore \ -  ${PN}-mail \ -
> ${PN}-names \ -  ${PN}-news \ -  ${PN}-runner \ -  ${PN}-web \ -
> ${PN}-words \ +    ${PN}-bin \ +    ${PN}-conch \ +    ${PN}-lore \ +
> ${PN}-mail \ +    ${PN}-names \ +    ${PN}-news \ +    ${PN}-runner \ +
> ${PN}-web \ +    ${PN}-words \ "
> 
> ALLOW_EMPTY_${PN} = "1" FILES_${PN} = ""
> 
> FILES_${PN}-test = " \ -
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \ -
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \ +
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \ +
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \ "
> 
> FILES_${PN}-protocols = " \ -
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \ -
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \ -
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \ +
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \ +
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \ +
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \ "
> 
> FILES_${PN}-zsh = " \ -
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \ -
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \ +
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \ +
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \ "
> 
> FILES_${PN}-bin = " \ -
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/_c_urlarg.so \ -
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/cBanana.so \ +
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/_c_urlarg.so \ +
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/cBanana.so \ "
> 
> FILES_${PN}-conch = " \ -  ${bindir}/ckeygen \ -  ${bindir}/tkconch \ -
> ${bindir}/conch \ -  ${bindir}/conchftp \ -  ${bindir}/cftp \ -
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_conch.py*
> \ -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/conch  \ +
> ${bindir}/ckeygen \ +    ${bindir}/tkconch \ +    ${bindir}/conch \ +
> ${bindir}/conchftp \ +    ${bindir}/cftp \ +
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_conch.py*
> \ +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/conch  \ "
> 
> FILES_${PN}-core = " \ diff --git
> a/meta-oe/recipes-devtools/swig/swig.inc
> b/meta-oe/recipes-devtools/swig/swig.inc index df6f780..0476d53 100644 
> --- a/meta-oe/recipes-devtools/swig/swig.inc +++
> b/meta-oe/recipes-devtools/swig/swig.inc @@ -15,38 +15,38 @@ SRC_URI =
> "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz" inherit autotools
> pythonnative
> 
> EXTRA_OECONF = " \ -	--with-python=${PYTHON} \ -	--without-allegrocl \ -
> --without-android \ -	--without-boost \ -	--without-chicken \ -
> --without-clisp \ -	--without-csharp \ -	--without-d \ -	--without-gcj \ 
> -	--without-go \ -	--without-guile \ -	--without-java \ -	--without-lua
> \ -	--without-mzscheme \ -	--without-ocaml \ -	--without-octave \ -
> --without-perl5 \ -	--without-pike \ -	--without-php \ -
> --without-python3 \ -	--without-r \ -	--without-ruby \ -	--without-tcl \ 
> +    --with-python=${PYTHON} \ +    --without-allegrocl \ +
> --without-android \ +    --without-boost \ +    --without-chicken \ +
> --without-clisp \ +    --without-csharp \ +    --without-d \ +
> --without-gcj \ +    --without-go \ +    --without-guile \ +
> --without-java \ +    --without-lua \ +    --without-mzscheme \ +
> --without-ocaml \ +    --without-octave \ +    --without-perl5 \ +
> --without-pike \ +    --without-php \ +    --without-python3 \ +
> --without-r \ +    --without-ruby \ +    --without-tcl \ "
> 
> BBCLASSEXTEND = "native"
> 
> do_configure() { -	install -m 0755
> ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/Tools/config -
> install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub
> ${S}/Tools/config -	install -m 0755
> ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S} -	install -m 0755
> ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S} -	oe_runconf +
> install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess
> ${S}/Tools/config +    install -m 0755
> ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/Tools/config +
> install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S} +
> install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S} +
> oe_runconf }
> 
> diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb
> b/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb index 247e55b..d44b407
> 100644 --- a/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb +++
> b/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb @@ -6,14 +6,14 @@
> LIC_FILES_CHKSUM =
> "file://license.terms;md5=24954e7e6b54c1b4e16de861b9d392fc" DEPENDS =
> "tcl virtual/libx11 libxt"
> 
> SRC_URI = "\ -  ${SOURCEFORGE_MIRROR}/tcl/tk${PV}-src.tar.gz \ -
> file://confsearch.diff;striplevel=2 \ -
> file://manpages.diff;striplevel=2 \ -  file://non-linux.diff;striplevel=2
> \ -  file://rpath.diff;striplevel=2 \ -
> file://tklibrary.diff;striplevel=2 \ -
> file://tkprivate.diff;striplevel=2 \ -  file://fix-xft.diff \ +
> ${SOURCEFORGE_MIRROR}/tcl/tk${PV}-src.tar.gz \ +
> file://confsearch.diff;striplevel=2 \ +
> file://manpages.diff;striplevel=2 \ +
> file://non-linux.diff;striplevel=2 \ +    file://rpath.diff;striplevel=2
> \ +    file://tklibrary.diff;striplevel=2 \ +
> file://tkprivate.diff;striplevel=2 \ +    file://fix-xft.diff \ " 
> SRC_URI[md5sum] = "13bf90602e16fc530e05196431021dc6" SRC_URI[sha256sum] =
> "9737da5c30e631281062b6acbb4753840f9e95657c78e37657d9c520589ab2d4" @@
> -23,16 +23,16 @@ S = "${WORKDIR}/tk${PV}/unix" inherit autotools
> 
> EXTRA_OECONF = "\ -  --enable-threads \ -
> --with-tcl=${STAGING_BINDIR_CROSS} \ -  --x-includes=${STAGING_INCDIR} \ 
> -  --x-libraries=${STAGING_LIBDIR} \ +    --enable-threads \ +
> --with-tcl=${STAGING_BINDIR_CROSS} \ +    --x-includes=${STAGING_INCDIR}
> \ +    --x-libraries=${STAGING_LIBDIR} \ "
> 
> do_install_append() { -        mv libtk8.5.so libtk8.5.so.0 -
> oe_libinstall -so libtk8.5 ${D}${libdir} -        ln -sf wish8.5
> ${D}${bindir}/wish +    mv libtk8.5.so libtk8.5.so.0 +    oe_libinstall
> -so libtk8.5 ${D}${libdir} +    ln -sf wish8.5 ${D}${bindir}/wish }
> 
> PACKAGES =+ "${PN}-lib" diff --git
> a/meta-oe/recipes-extended/atftp/atftp_git.bb
> b/meta-oe/recipes-extended/atftp/atftp_git.bb index 67a2c1b..731bc75
> 100644 --- a/meta-oe/recipes-extended/atftp/atftp_git.bb +++
> b/meta-oe/recipes-extended/atftp/atftp_git.bb @@ -43,9 +43,9 @@ PACKAGES
> =+ "atftpd" FILES_${PN} = "${bindir}/*"
> 
> FILES_${PN}d = "${sbindir}/* \ -  ${sysconfdir}/init.d/* \ -  /srv/tftp
> \ -  ${systemd_unitdir}/system/atftpd.service \ +
> ${sysconfdir}/init.d/* \ +    /srv/tftp \ +
> ${systemd_unitdir}/system/atftpd.service \ "
> 
> SYSTEMD_PACKAGES = "${PN}d" diff --git
> a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
> b/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb index
> 7e0a4fb..50202c1 100644 ---
> a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb +++
> b/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb @@ -1,7 +1,7 @@ 
> SUMMARY = "Data recovery tool" DESCRIPTION = "GNU ddrescue is a data
> recovery tool. It copies data \ - from one file or block device (hard
> disc, cdrom, etc) to another, \ - trying hard to rescue data in case of
> read errors." +    from one file or block device (hard disc, cdrom, etc)
> to another, \ +    trying hard to rescue data in case of read errors." 
> HOMEPAGE = "http://www.gnu.org/software/ddrescue/ddrescue.html" SECTION =
> "console" LICENSE = "GPLv3+" diff --git
> a/meta-oe/recipes-extended/dmidecode/dmidecode_2.10.bb
> b/meta-oe/recipes-extended/dmidecode/dmidecode_2.10.bb index
> ae06de9..3437ef1 100644 ---
> a/meta-oe/recipes-extended/dmidecode/dmidecode_2.10.bb +++
> b/meta-oe/recipes-extended/dmidecode/dmidecode_2.10.bb @@ -10,11 +10,11
> @@ SRC_URI =
> "http://savannah.nongnu.org/download/dmidecode/${P}.tar.bz2" 
> COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
> 
> do_compile() { -	oe_runmake +    oe_runmake }
> 
> do_install() { -	oe_runmake DESTDIR="${D}" install +    oe_runmake
> DESTDIR="${D}" install }
> 
> SRC_URI[md5sum] = "3c9c4d55a40b78600f3b43bfa64616f9" diff --git
> a/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb
> b/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb index
> d922afc..4ea312f 100644 ---
> a/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb +++
> b/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb @@ -3,11 +3,11 @@
> require gnuplot.inc PR = "r1"
> 
> SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${PN}-${PV}.tar.gz;name=archive
> \ -   http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot
> \ -   file://subdirs.patch \ -   file://gnuplot.desktop \ -
> file://gnuplot.png \ -   file://automake-1.12.x.patch \ +
> http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \ +
> file://subdirs.patch \ +    file://gnuplot.desktop \ +
> file://gnuplot.png \ +    file://automake-1.12.x.patch \ "
> 
> SRC_URI[archive.md5sum] = "97a43328e81e57ebed7f135ca0c07e82" diff --git
> a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
> b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb index b9c270d..f70149c
> 100644 --- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb +++
> b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb @@ -8,7 +8,7 @@ SRC_URI
> = "${SOURCEFORGE_MIRROR}/${PN}/${PN}-${PV}.tar.gz \ 
> file://setup-add-sleep-after-cups-reset.patch \ 
> file://fix-libusb-paths.patch \ file://cups-1.6.patch \ -	  " +      "
> 
> DEPENDS += "cups python libusb"
> 
> diff --git a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
> b/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb index 3b8150b..14d2ee5
> 100644 --- a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb +++
> b/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb @@ -1,7 +1,7 @@ SUMMARY =
> "Simple top-like I/O monitor" DESCRIPTION = "iotop does for I/O usage
> what top(1) does for CPU usage. \ - It watches I/O usage information
> output by the Linux kernel and displays \ - a table of current I/O usage
> by processes on the system." +    It watches I/O usage information output
> by the Linux kernel and displays \ +    a table of current I/O usage by
> processes on the system." HOMEPAGE = "http://guichaz.free.fr/iotop/"
> 
> PR = "r1" @@ -16,8 +16,8 @@ SRC_URI[sha256sum] =
> "46f3279fb1a7dfc129b5d00950c6e8389e4aedeb58880e848b88d68648 inherit
> distutils
> 
> do_install_append() { -	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.pyo ||
> true -	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py  || true +    rm -f
> ${D}${PYTHON_SITEPACKAGES_DIR}/site.pyo || true +    rm -f
> ${D}${PYTHON_SITEPACKAGES_DIR}/site.py  || true }
> 
> RDEPENDS_${PN} = "python-distutils python-curses python-textutils \ diff
> --git a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
> b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc index 4040870..f5a1f3c
> 100644 --- a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc +++
> b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc @@ -19,29 +19,29 @@
> LCD_DEFAULT_DRIVER ?= "curses" EXTRA_OECONF =
> "--enable-drivers=${LCD_DRIVERS} --enable-libusb"
> 
> do_install () { -	# binaries -	install -D -m 0755 server/LCDd
> ${D}${sbindir}/LCDd -	install -D -m 0755 clients/lcdproc/lcdproc
> ${D}${bindir}/lcdproc - -	# init scripts -	install -d
> ${D}${sysconfdir}/init.d -	# so far, not fixed :-( and now even uglier
> :-(( -	cat scripts/init-LCDd.debian | sed -e s'/--oknodo//' -e 's/ -s -f
> / -s 1 -f 1 /' -e 's/force-reload/force-restart/' -e 's/sleep 1/sleep 4/'
> > ${D}${sysconfdir}/init.d/lcdd -	chmod 0755
> ${D}${sysconfdir}/init.d/lcdd -	install -m 0755
> scripts/init-lcdproc.debian ${D}${sysconfdir}/init.d/lcdproc -	sed -i
> s'/--oknodo//' ${D}${sysconfdir}/init.d/lcdproc - -	# configuration
> files -	install -m 0644 LCDd.conf ${D}${sysconfdir}/LCDd.conf -	sed -i
> 's!^DriverPath=.*!DriverPath=${libdir}/lcdproc/!'
> ${D}${sysconfdir}/LCDd.conf -	sed -i
> 's!^Driver=.*!Driver=${LCD_DEFAULT_DRIVER}!' ${D}${sysconfdir}/LCDd.conf 
> -	install -m 0644 clients/lcdproc/lcdproc.conf
> ${D}${sysconfdir}/lcdproc.conf - -	# driver library files -	install -d
> ${D}${libdir}/lcdproc -	for i in server/drivers/*.so; do -		install -m
> 0644 $i ${D}${libdir}/lcdproc/ -	done +    # binaries +    install -D -m
> 0755 server/LCDd ${D}${sbindir}/LCDd +    install -D -m 0755
> clients/lcdproc/lcdproc ${D}${bindir}/lcdproc + +    # init scripts +
> install -d ${D}${sysconfdir}/init.d +    # so far, not fixed :-( and now
> even uglier :-(( +    cat scripts/init-LCDd.debian | sed -e
> s'/--oknodo//' -e 's/ -s -f / -s 1 -f 1 /' -e
> 's/force-reload/force-restart/' -e 's/sleep 1/sleep 4/' >
> ${D}${sysconfdir}/init.d/lcdd +    chmod 0755
> ${D}${sysconfdir}/init.d/lcdd +    install -m 0755
> scripts/init-lcdproc.debian ${D}${sysconfdir}/init.d/lcdproc +    sed -i
> s'/--oknodo//' ${D}${sysconfdir}/init.d/lcdproc + +    # configuration
> files +    install -m 0644 LCDd.conf ${D}${sysconfdir}/LCDd.conf +    sed
> -i 's!^DriverPath=.*!DriverPath=${libdir}/lcdproc/!'
> ${D}${sysconfdir}/LCDd.conf +    sed -i
> 's!^Driver=.*!Driver=${LCD_DEFAULT_DRIVER}!' ${D}${sysconfdir}/LCDd.conf 
> +    install -m 0644 clients/lcdproc/lcdproc.conf
> ${D}${sysconfdir}/lcdproc.conf + +    # driver library files +    install
> -d ${D}${libdir}/lcdproc +    for i in server/drivers/*.so; do +
> install -m 0644 $i ${D}${libdir}/lcdproc/ +    done }
> 
> PACKAGES =+ "lcdd" @@ -49,8 +49,8 @@ PACKAGES =+ "lcdd" RRECOMMENDS_${PN}
> = "lcdd"
> 
> FILES_lcdd = "${sysconfdir}/LCDd.conf \ -	${sbindir}/LCDd \ -
> ${sysconfdir}/init.d/lcdd" +    ${sbindir}/LCDd \ +
> ${sysconfdir}/init.d/lcdd"
> 
> CONFFILES_lcdd = "${sysconfdir}/LCDd.conf" CONFFILES_${PN} =
> "${sysconfdir}/lcdproc.conf" diff --git
> a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
> b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb index
> 0276c55..39e6074 100644 ---
> a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb +++
> b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb @@ -11,11 +11,11 @@
> PACKAGECONFIG[g15] = ",,libg15 g15daemon libg15render," 
> LCD_DRIVERS_append = "${@base_contains('PACKAGECONFIG', 'g15', '',
> ',!g15', d)}"
> 
> do_install_append () { -	# binaries -	install -D -m 0755
> clients/lcdvc/lcdvc ${D}${sbindir}/lcdvc +    # binaries +    install -D
> -m 0755 clients/lcdvc/lcdvc ${D}${sbindir}/lcdvc
> 
> -	# configuration files -	install -D -m 0644 clients/lcdvc/lcdvc.conf
> ${D}${sysconfdir}/lcdvc.conf +    # configuration files +    install -D
> -m 0644 clients/lcdvc/lcdvc.conf ${D}${sysconfdir}/lcdvc.conf }
> 
> PACKAGES =+ "lcdvc" diff --git
> a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
> b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb index
> c72e28d..72a8482 100644 ---
> a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb +++
> b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb @@ -4,10 +4,10
> @@ LICENSE = "LGPLv2+ & GPLv2+" LIC_FILES_CHKSUM =
> "file://COPYRIGHT;md5=ac284a60d48eaa4bc811cddc377fa341"
> 
> SRC_URI =
> "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.09.orig.tar.gz \ -
> file://install.patch \ -	   file://configure.patch \ -
> file://ldflags.patch \ -          " +    file://install.patch \ +
> file://configure.patch \ +    file://ldflags.patch \ +"
> 
> SRC_URI[md5sum] = "2aa269e4405ee8235ff17d1b357c6ae8" SRC_URI[sha256sum] =
> "16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a0695f1b7f" @@
> -17,6 +17,6 @@ inherit autotools EXTRA_OECONF = "--enable-shared
> --enable-static"
> 
> do_install () { -	oe_runmake 'ROOT=${D}' INSTGRP='' install +
> oe_runmake 'ROOT=${D}' INSTGRP='' install }
> 
> diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
> b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb index
> c06b906..77cca2b 100644 ---
> a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb +++
> b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb @@ -15,7 +15,7 @@
> BBCLASSEXTEND = "native" inherit autotools
> 
> SRC_URI =
> "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=tarball
> \ -           file://libwmf-0.2.8.4-intoverflow.patch
> \ +           file://libwmf-0.2.8.4-intoverflow.patch \ 
> file://libwmf-0.2.8.4-useafterfree.patch" SRC_URI[tarball.md5sum] =
> "d1177739bf1ceb07f57421f0cee191e0" SRC_URI[tarball.sha256sum] =
> "5b345c69220545d003ad52bfd035d5d6f4f075e65204114a9e875e84895a7cf8" diff
> --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
> b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb index
> a80447f..83a3b39 100644 ---
> a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb +++
> b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb @@ -9,7 +9,7
> @@ PR = "r3" SRC_URI =
> "http://helm.cs.unibo.it/mml-widget/sources/${P}.tar.gz \ 
> file://mathview-gcc43x.diff \ file://mathview-gcc47x.diff \ -	  " +
> " SRC_URI[md5sum] = "b53564e553728d4b69f7d366dfeb5299" SRC_URI[sha256sum]
> = "1dc30175da6a3c560a7d62d1abe1c2f9829d988e6f1a7c5e766544575c558c43"
> 
> @@ -18,5 +18,5 @@ inherit autotools EXTRA_OECONF = "--disable-binreloc"
> 
> do_configure_prepend() { -	sed -i -e s:AM_BINRELOC::g ${S}/configure.ac +
> sed -i -e s:AM_BINRELOC::g ${S}/configure.ac } diff --git
> a/meta-oe/recipes-extended/net-snmp/net-snmp.inc
> b/meta-oe/recipes-extended/net-snmp/net-snmp.inc index e369ccf..5a6ec9f
> 100644 --- a/meta-oe/recipes-extended/net-snmp/net-snmp.inc +++
> b/meta-oe/recipes-extended/net-snmp/net-snmp.inc @@ -19,26 +19,26 @@
> EXTRA_OECONF = "--enable-shared --disable-manuals --with-defaults \ 
> ${@base_conditional('SITEINFO_ENDIANNESS', 'le',
> '--with-endianness=little', '--with-endianness=big', d)}"
> 
> do_install () { -	oe_runmake install +    oe_runmake install }
> 
> do_install_append() { -	install -d ${D}${sysconfdir}/snmp -	install -d
> ${D}${sysconfdir}/init.d -	install -m 755 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/snmpd -	install -m 644 ${WORKDIR}/snmpd.conf
> ${D}${sysconfdir}/snmp/ -	install -m 644 ${WORKDIR}/snmptrapd.conf
> ${D}${sysconfdir}/snmp/ -	install -d ${STAGING_BINDIR} -	install -m 0755
> ${D}${bindir}/net-snmp-config ${STAGING_BINDIR}/ -	sed -e
> "s@-I/usr/include@@g" \ -		-e "s@^prefix=.*@prefix=${STAGING_DIR_HOST}@g"
> \ -		-e "s@^exec_prefix=.*@exec_prefix=${STAGING_DIR_HOST}@g" \ -		-e
> "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \ -		-e
> "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \ -		-i
> ${STAGING_BINDIR}/net-snmp-config -        install -d
> ${D}${systemd_unitdir}/system -        install -m 0644
> ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system -        install
> -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system +
> install -d ${D}${sysconfdir}/snmp +    install -d
> ${D}${sysconfdir}/init.d +    install -m 755 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/snmpd +    install -m 644 ${WORKDIR}/snmpd.conf
> ${D}${sysconfdir}/snmp/ +    install -m 644 ${WORKDIR}/snmptrapd.conf
> ${D}${sysconfdir}/snmp/ +    install -d ${STAGING_BINDIR} +    install -m
> 0755 ${D}${bindir}/net-snmp-config ${STAGING_BINDIR}/ +    sed -e
> "s@-I/usr/include@@g" \ +        -e
> "s@^prefix=.*@prefix=${STAGING_DIR_HOST}@g" \ +        -e
> "s@^exec_prefix=.*@exec_prefix=${STAGING_DIR_HOST}@g" \ +        -e
> "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \ +        -e
> "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \ +        -i
> ${STAGING_BINDIR}/net-snmp-config +    install -d
> ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system +    install -m
> 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system }
> 
> PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static
> ${PN}-libs \ @@ -48,13 +48,13 @@ ALLOW_EMPTY_${PN}-server = "1" 
> FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}" FILES_${PN}-mibs =
> "${datadir}/snmp/mibs" FILES_${PN}-server-snmpd = "${sbindir}/snmpd \ -
> ${sysconfdir}/snmp/snmpd.conf \ -  ${sysconfdir}/init.d \ -
> ${systemd_unitdir}/system/snmpd.service \ +
> ${sysconfdir}/snmp/snmpd.conf \ +    ${sysconfdir}/init.d \ +
> ${systemd_unitdir}/system/snmpd.service \ " FILES_${PN}-server-snmptrapd
> = "${sbindir}/snmptrapd \ -  ${sysconfdir}/snmp/snmptrapd.conf \ -
> ${systemd_unitdir}/system/snmptrapd.service \ +
> ${sysconfdir}/snmp/snmptrapd.conf \ +
> ${systemd_unitdir}/system/snmptrapd.service \ " FILES_${PN}-client =
> "${bindir}/* ${datadir}/snmp/" FILES_${PN}-dbg += "${libdir}/.debug/
> ${sbindir}/.debug/ ${bindir}/.debug/" @@ -86,10 +86,10 @@
> RCONFLICTS_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd" 
> LEAD_SONAME = "libnetsnmp.so"
> 
> pkg_postrm_${PN}-server() { -	if test "x$D" != "x"; then -		OPT="-r $D " 
> -	else -		OPT="" -		/etc/init.d/snmpd stop -	fi +    if test "x$D" !=
> "x"; then +        OPT="-r $D " +    else +        OPT="" +
> /etc/init.d/snmpd stop +    fi } diff --git
> a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
> b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb index
> 74d006c..14c1036 100644 ---
> a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb +++
> b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb @@ -18,12 +18,12 @@
> EXTRA_OECONF += "--disable-embedded-perl --with-perl-modules=no" 
> EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
> 
> do_configure_prepend() { -        gnu-configize -f -        # We better
> change sources and re-autoconf here, but -        # required autoconf is
> too new for us. -        sed -e '/echo.*\".*\\\\.*\"/s/echo/echo -e/g' \ 
> -            -e 's/tail -1/tail -n 1/g'                \ -            -i
> configure +    gnu-configize -f +    # We better change sources and
> re-autoconf here, but +    # required autoconf is too new for us. +
> sed -e '/echo.*\".*\\\\.*\"/s/echo/echo -e/g' \ +        -e 's/tail
> -1/tail -n 1/g' \ +        -i configure }
> 
> PARALLEL_MAKE = "" diff --git
> a/meta-oe/recipes-extended/owfs/owfs_2.8p20.bb
> b/meta-oe/recipes-extended/owfs/owfs_2.8p20.bb index d010867..d99cbb3
> 100644 --- a/meta-oe/recipes-extended/owfs/owfs_2.8p20.bb +++
> b/meta-oe/recipes-extended/owfs/owfs_2.8p20.bb @@ -32,10 +32,10 @@
> EXTRA_OECONF = " \ "
> 
> do_install_prepend() { -        install -d ${D}${sysconfdir}/default/ -
> install -d ${D}${sysconfdir}/init.d/ -        install -m 0755
> ${WORKDIR}/owhttpd ${D}${sysconfdir}/init.d/owhttpd -        install -m
> 0755 ${WORKDIR}/owserver ${D}${sysconfdir}/init.d/owserver +    install
> -d ${D}${sysconfdir}/default/ +    install -d ${D}${sysconfdir}/init.d/ +
> install -m 0755 ${WORKDIR}/owhttpd ${D}${sysconfdir}/init.d/owhttpd +
> install -m 0755 ${WORKDIR}/owserver ${D}${sysconfdir}/init.d/owserver }
> 
> PACKAGES =+ "owftpd owhttpd owserver owshell libowcapi libow libownet
> owmon owtap" diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bb
> b/meta-oe/recipes-extended/polkit/polkit_0.104.bb index cc39654..b28a6b8
> 100644 --- a/meta-oe/recipes-extended/polkit/polkit_0.104.bb +++
> b/meta-oe/recipes-extended/polkit/polkit_0.104.bb @@ -33,7 +33,7 @@
> EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages
> --disable-introspectio inherit autotools gtk-doc pkgconfig
> 
> do_install_append() { -	rm -f ${D}${libdir}/${BPN}-1/extensions/*.a +
> rm -f ${D}${libdir}/${BPN}-1/extensions/*.a }
> 
> FILES_${PN} += "${libdir}/${BPN}-1/extensions/*.so \ diff --git
> a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb index
> 465ef8a..f723767 100644 ---
> a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb +++
> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb @@ -20,17 +20,17 @@
> inherit autotools gettext EXTRA_AUTORECONF = "-I m4"
> 
> EXTRA_OECONF = " \ -	--enable-shared \ -	--enable-local-libpng \ -
> --enable-local-zlib \ -	 --disable-libwrap \ -	--program-prefix='' \ -
> rd_cv_ieee_works=yes \ -	--disable-perl \ -	--disable-python \ -
> --disable-ruby \ -	--disable-lua \ -	--disable-rpath \ +
> --enable-shared \ +    --enable-local-libpng \ +    --enable-local-zlib
> \ +    --disable-libwrap \ +    --program-prefix='' \ +
> rd_cv_ieee_works=yes \ +    --disable-perl \ +    --disable-python \ +
> --disable-ruby \ +    --disable-lua \ +    --disable-rpath \ "
> 
> 
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
> b/meta-oe/recipes-extended/rsyslog/rsyslog.inc index dc6e511..5cfd236
> 100644 --- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc +++
> b/meta-oe/recipes-extended/rsyslog/rsyslog.inc @@ -15,8 +15,8 @@ inherit
> autotools systemd EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES',
> 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/',
> '--without-systemdsystemunitdir', d)}"
> 
> do_install_append() { -        install -d ${D}/${sysconfdir}/${PN} -
> install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf +
> install -d ${D}/${sysconfdir}/${PN} +    install ${WORKDIR}/rsyslog.conf
> ${D}${sysconfdir}/rsyslog.conf }
> 
> CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf" diff --git
> a/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
> b/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb index
> 32579c0..33caa1e 100644 ---
> a/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb +++
> b/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb @@ -22,14 +22,14 @@
> export STAGING_LIBDIR export STAGING_INCDIR
> 
> do_configure_prepend() { -        cat sipgen.sbf | sed s,target,TARGET, |
> sed s,sources,SOURCES, | sed s,headers,HEADERS, > sipgen.pro +    cat
> sipgen.sbf | sed s,target,TARGET, | sed s,sources,SOURCES, | sed
> s,headers,HEADERS, > sipgen.pro } do_install() { -        install -d
> ${D}${bindir} -        install -m 0755 sip ${D}${bindir}/sip -        #
> python-pyqt expects sip4 -        ln -sf sip ${D}${bindir}/sip4 -
> cd ${WORKDIR}/sip-${PV} && python configure.py -        install -d
> ${D}${PYTHON_SITEPACKAGES_DIR} -        install -m 0755 sip*.py
> ${D}${PYTHON_SITEPACKAGES_DIR} +    install -d ${D}${bindir} +    install
> -m 0755 sip ${D}${bindir}/sip +    # python-pyqt expects sip4 +    ln -sf
> sip ${D}${bindir}/sip4 +    cd ${WORKDIR}/sip-${PV} && python
> configure.py +    install -d ${D}${PYTHON_SITEPACKAGES_DIR} +    install
> -m 0755 sip*.py ${D}${PYTHON_SITEPACKAGES_DIR} } diff --git
> a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb
> b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb index
> 89b4f06..97f7fcc 100644 ---
> a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb +++
> b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb @@ -8,12 +8,12
> @@ LIC_FILES_CHKSUM =
> "file://src/libsocketcan.c;beginline=3;endline=17;md5=97e38ad SRCREV =
> "3a2cec63a4e6212cc63d21008453bd799cfe8774"
> 
> SRC_URI =
> "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git \ -	" +
> "
> 
> S = "${WORKDIR}/git"
> 
> inherit autotools pkgconfig
> 
> do_configure_prepend() { -	sed -i -e s:tests/GNUmakefile::g -e
> s:trunk:0.0.8: configure.ac +    sed -i -e s:tests/GNUmakefile::g -e
> s:trunk:0.0.8: configure.ac } diff --git
> a/meta-oe/recipes-extended/subsurface/subsurface_git.bb
> b/meta-oe/recipes-extended/subsurface/subsurface_git.bb index
> d401c4e..64b60be 100644 ---
> a/meta-oe/recipes-extended/subsurface/subsurface_git.bb +++
> b/meta-oe/recipes-extended/subsurface/subsurface_git.bb @@ -21,8 +21,8 @@
> EXTRA_OEMAKE = "CC='${CC}' \ "
> 
> do_install() { -	oe_runmake install DESTDIR=${D} -	rm
> ${D}${datadir}/icons/hicolor/icon-theme.cache +    oe_runmake install
> DESTDIR=${D} +    rm ${D}${datadir}/icons/hicolor/icon-theme.cache }
> 
> FILES_${PN} += "${datadir}/icons/hicolor/scalable/apps/subsurface.svg" 
> diff --git a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
> b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb index f905c9d..c367a4d
> 100644 --- a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb +++
> b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb @@ -22,8 +22,8 @@
> EXTRA_OECONF = "--with-x --without-athena" EXTRA_OEMAKE = "without_doc"
> 
> do_configure() { -	rm -f ${S}/ac-tools/aclocal.m4 -
> autotools_do_configure +    rm -f ${S}/ac-tools/aclocal.m4 +
> autotools_do_configure }
> 
> FILES_${PN} += " ${datadir}/t1lib/t1lib.config" diff --git
> a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
> b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb index bba89bf..16ecdb0
> 100644 --- a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb +++
> b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb @@ -1,7 +1,7 @@ 
> DESCRIPTION = "TENEX C Shell, an enhanced version of Berkeley csh \ - The
> TENEX C Shell is an enhanced version of the Berkeley Unix C shell. \ - It
> includes all features of 4.4BSD C shell, plus a command-line editor, \ -
> programmable word completion, spelling correction and more." +    The
> TENEX C Shell is an enhanced version of the Berkeley Unix C shell. \ +
> It includes all features of 4.4BSD C shell, plus a command-line editor,
> \ +    programmable word completion, spelling correction and more."
> 
> HOMEPAGE = "http://www.tcsh.org/" LICENSE = "BSD" @@ -9,18 +9,18 @@
> LIC_FILES_CHKSUM =
> "file://Copyright;md5=1cf29be62df2be1a3763118b25b4c780" SECTION = "base" 
> DEPENDS = "ncurses" SRC_URI = " \ -
> ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}.orig.tar.gz;name=tarball \ -
> ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}-2.diff.gz;name=diffs \ -
> file://01_build.1.patch \ -	file://01_build.2.patch \ -
> file://01_build.3.patch \ -	file://15_no-strip.patch \ -
> file://disable-test-notty.patch \ -	file://disable-test-nice.patch \ -
> file://disable-lexical.at-31.patch \ -	file://12_unknown_lscolors.patch
> \ -	file://tcsh-6.17.02-multibyte.patch \ -
> file://disable-broken-test.patch \ +
> ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}.orig.tar.gz;name=tarball \ +
> ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}-2.diff.gz;name=diffs \ +
> file://01_build.1.patch \ +    file://01_build.2.patch \ +
> file://01_build.3.patch \ +    file://15_no-strip.patch \ +
> file://disable-test-notty.patch \ +    file://disable-test-nice.patch \ +
> file://disable-lexical.at-31.patch \ +
> file://12_unknown_lscolors.patch \ +
> file://tcsh-6.17.02-multibyte.patch \ +
> file://disable-broken-test.patch \ " SRC_URI[tarball.md5sum] =
> "6eed09dbd4223ab5b6955378450d228a" SRC_URI[tarball.sha256sum] =
> "d81ca27851f3e8545666399b4bcf25433e602a195113b3f7c73886fef84c9fa8" @@
> -30,14 +30,14 @@ SRC_URI[diffs.sha256sum] =
> "95b0c1a339b745c47c5d2f9d02c22a71597462e2e882b51614a9 inherit autotools
> 
> do_install_append () { -	oe_runmake install.man DESTDIR=${D} +
> oe_runmake install.man DESTDIR=${D}
> 
> -	install -d ${D}${base_bindir} -	ln -s /usr/bin/tcsh
> ${D}${base_bindir}/tcsh +    install -d ${D}${base_bindir} +    ln -s
> /usr/bin/tcsh ${D}${base_bindir}/tcsh
> 
> -	install -d ${D}${sysconfdir}/csh/login.d -	install -m 0644
> ${S}/debian/csh.cshrc ${S}/debian/csh.login ${S}/debian/csh.logout
> ${S}/complete.tcsh ${D}${sysconfdir} -	install -D -m 0644
> ${S}/csh-mode.el ${D}${datadir}/emacs/site-lisp/csh-mode.el +    install
> -d ${D}${sysconfdir}/csh/login.d +    install -m 0644
> ${S}/debian/csh.cshrc ${S}/debian/csh.login ${S}/debian/csh.logout
> ${S}/complete.tcsh ${D}${sysconfdir} +    install -D -m 0644
> ${S}/csh-mode.el ${D}${datadir}/emacs/site-lisp/csh-mode.el }
> 
> FILES_${PN} += "${datadir}/emacs/site-lisp/csh-mode.el" diff --git
> a/meta-oe/recipes-extended/tmux/tmux_1.6.bb
> b/meta-oe/recipes-extended/tmux/tmux_1.6.bb index 6be2355..470b25c
> 100644 --- a/meta-oe/recipes-extended/tmux/tmux_1.6.bb +++
> b/meta-oe/recipes-extended/tmux/tmux_1.6.bb @@ -14,5 +14,5 @@
> SRC_URI[sha256sum] =
> "faee08ba1bd8c22537cd5b7458881d1bdb4985df88ed6bc5967c56881a inherit
> autotools
> 
> do_configure_prepend () { -	sed -i -e 's:-I/usr/local/include::'
> Makefile.am || bb_fatal "sed failed" +    sed -i -e
> 's:-I/usr/local/include::' Makefile.am || bb_fatal "sed failed" } diff
> --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
> b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb index
> 80b3c9a..ea07c1f 100644 ---
> a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb +++
> b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb @@
> -15,11 +15,11 @@ PR = "r1" S = "${WORKDIR}/tools"
> 
> do_compile() { -	oe_runmake +    oe_runmake }
> 
> do_install() { -	oe_runmake install DESTDIR=${D} +    oe_runmake install
> DESTDIR=${D} }
> 
> FILES_${PN} += "${libdir}" diff --git
> a/meta-oe/recipes-extended/zram/zram_0.1.bb
> b/meta-oe/recipes-extended/zram/zram_0.1.bb index 115e643..d926da8
> 100644 --- a/meta-oe/recipes-extended/zram/zram_0.1.bb +++
> b/meta-oe/recipes-extended/zram/zram_0.1.bb @@ -14,12 +14,12 @@ SRC_URI =
> " \ "
> 
> do_install () { -	# Sysvinit -	install -d ${D}${sysconfdir}/init.d -
> install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram +    #
> Sysvinit +    install -d ${D}${sysconfdir}/init.d +    install -m 0755
> ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
> 
> -	install -d ${D}${systemd_unitdir}/system -	install -m 0644
> ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system +    install -d
> ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system }
> 
> FILES_${PN} = "${sysconfdir}/init.d" diff --git
> a/meta-oe/recipes-gnome/gtk+/gtkmm.inc
> b/meta-oe/recipes-gnome/gtk+/gtkmm.inc index b1a170a..fe72a73 100644 ---
> a/meta-oe/recipes-gnome/gtk+/gtkmm.inc +++
> b/meta-oe/recipes-gnome/gtk+/gtkmm.inc @@ -17,9 +17,9 @@ EXTRA_OECONF = "
> --disable-documentation " LIBV = "2.4.0"
> 
> do_install_append () { -        install -d ${D}${includedir}/gtkmm-2.4 -
> install -m 0644 gdk/gdkmmconfig.h ${D}${includedir}/gtkmm-2.4 -
> install -m 0644 gtk/gtkmmconfig.h ${D}${includedir}/gtkmm-2.4 +
> install -d ${D}${includedir}/gtkmm-2.4 +    install -m 0644
> gdk/gdkmmconfig.h ${D}${includedir}/gtkmm-2.4 +    install -m 0644
> gtk/gtkmmconfig.h ${D}${includedir}/gtkmm-2.4 }
> 
> PACKAGES =+ "${PN}-demo" diff --git
> a/meta-oe/recipes-graphics/clutter/clutter-box2d.inc
> b/meta-oe/recipes-graphics/clutter/clutter-box2d.inc index
> 056b091..646b785 100644 ---
> a/meta-oe/recipes-graphics/clutter/clutter-box2d.inc +++
> b/meta-oe/recipes-graphics/clutter/clutter-box2d.inc @@ -8,8 +8,8 @@
> PACKAGE_ARCH = "${MACHINE_ARCH}" inherit autotools pkgconfig gtk-doc
> 
> do_install_append () { -	install -d ${D}${bindir} -	install
> ${S}/examples/.libs/blockbox ${D}${bindir} +    install -d ${D}${bindir} 
> +    install ${S}/examples/.libs/blockbox ${D}${bindir} }
> 
> FILESPATH = "${FILE_DIRNAME}/clutter-box2d" diff --git
> a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
> b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb index 455fd8a..02ea57f
> 100644 --- a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb +++
> b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb @@ -15,12 +15,12 @@ S =
> "${WORKDIR}/git" EXTRA_OEMAKE = "STRIP="
> 
> do_compile() { -	sed -i -e 's: cpp: ${TARGET_PREFIX}cpp:g' GNUmakefile -
> oe_runmake +    sed -i -e 's: cpp: ${TARGET_PREFIX}cpp:g' GNUmakefile +
> oe_runmake }
> 
> do_install() { -	oe_runmake 'DESTDIR=${D}' install +    oe_runmake
> 'DESTDIR=${D}' install }
> 
> RDEPENDS_${PN} = "ttf-dejavu-sans-mono" diff --git
> a/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb
> b/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb index 44e66ea..e9bbdcf
> 100644 --- a/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb +++
> b/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb @@ -16,8 +16,8 @@
> EXTRA_OECONF = "--disable-python \ --without-wmf"
> 
> do_configure_append() { -	find ${S} -name Makefile | xargs sed -i
> s:'-I$(includedir)':'-I.':g -	find ${S} -name Makefile | xargs sed -i
> s:'-I/usr/include':'-I${STAGING_INCDIR}':g +    find ${S} -name Makefile
> | xargs sed -i s:'-I$(includedir)':'-I.':g +    find ${S} -name Makefile
> | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g }
> 
> FILES_${PN}-dbg += "${libdir}/gimp/2.0/*/.debug" diff --git
> a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb index
> 60271cc..fd547d9 100644 ---
> a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb +++
> b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb @@ -26,10 +26,10
> @@ inherit autotools pkgconfig gettext lib_package EXTRA_OECONF = "
> --with-drivers=all udevscriptdir=/lib/udev
> ac_cv_lib_ltdl_lt_dlcaller_register=yes"
> 
> do_configure_append() { -	cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in
> ${S}/libgphoto2_port/po/ -	cd ${S}/libgphoto2_port/ -	autoreconf -Wcross
> --verbose --install --force ${EXTRA_AUTORECONF} $acpaths -	cd ${S} +
> cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/ 
> +    cd ${S}/libgphoto2_port/ +    autoreconf -Wcross --verbose --install
> --force ${EXTRA_AUTORECONF} $acpaths +    cd ${S} }
> 
> do_install_append() { diff --git
> a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb index a6f266c..a24f75c
> 100644 --- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb +++
> b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb @@ -3,11 +3,11 @@ HOMEPAGE =
> "http://blog.lxde.org/?p=531" LICENSE = "GPLv3" LIC_FILES_CHKSUM =
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" SRC_URI = " \ -
> git://lxde.git.sourceforge.net/gitroot/lxde/${BPN};protocol=git;branch=master
> \ -	file://lxdm.conf \ -	file://lxdm-pam \ -	file://lxdm-pam-debug \ -
> ${@base_contains("DISTRO_TYPE", "debug", "",
> "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \ 
> +
> git://lxde.git.sourceforge.net/gitroot/lxde/${BPN};protocol=git;branch=master
> \ +    file://lxdm.conf \ +    file://lxdm-pam \ +
> file://lxdm-pam-debug \ +    ${@base_contains("DISTRO_TYPE", "debug", "",
> "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \ 
> "
> 
> LXDM_PAM = "${@base_contains("DISTRO_TYPE", "debug", "lxdm-pam-debug",
> "lxdm-pam",d)}" @@ -29,22 +29,22 @@ S = "${WORKDIR}/git" EXTRA_OECONF +=
> "${@base_contains('DISTRO_FEATURES', 'systemd',
> '--with-systemdsystemunitdir=${systemd_unitdir}/system/',
> '--without-systemdsystemunitdir', d)}"
> 
> do_compile_append() { -	# default background configured not available /
> no password field available / no default screensaver -	sed -i 	-e
> 's,bg=,# bg=,g' \ -		-e 's,# skip_password=,skip_password=,g' \ -		-e
> 's,# arg=.*,arg=${bindir}/X -s 0,g' \ -		${S}/data/lxdm.conf.in -	# add
> default configuration -	oe_runmake -C ${S}/data lxdm.conf +    # default
> background configured not available / no password field available / no
> default screensaver +    sed -i     -e 's,bg=,# bg=,g' \ +        -e 's,#
> skip_password=,skip_password=,g' \ +        -e 's,#
> arg=.*,arg=${bindir}/X -s 0,g' \ +        ${S}/data/lxdm.conf.in +    #
> add default configuration +    oe_runmake -C ${S}/data lxdm.conf }
> 
> do_install_append() { -	install -d ${D}${localstatedir}/lib/lxdm -
> install -m 644 ${WORKDIR}/lxdm.conf ${D}${localstatedir}/lib/lxdm -	#
> ArchLinux version of pam config has the following advantages: -	# *
> simple setup of passwordless login -	# * in XFCE powerdown/restart
> enabled in logoff dialog -	install -m 644 ${WORKDIR}/${LXDM_PAM}
> ${D}${sysconfdir}/pam.d/lxdm +    install -d
> ${D}${localstatedir}/lib/lxdm +    install -m 644 ${WORKDIR}/lxdm.conf
> ${D}${localstatedir}/lib/lxdm +    # ArchLinux version of pam config has
> the following advantages: +    # * simple setup of passwordless login +
> # * in XFCE powerdown/restart enabled in logoff dialog +    install -m
> 644 ${WORKDIR}/${LXDM_PAM} ${D}${sysconfdir}/pam.d/lxdm }
> 
> # make installed languages choosable diff --git
> a/meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb
> b/meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb index
> 1428806..57b47f6 100644 ---
> a/meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb +++
> b/meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb @@ -8,19 +8,19
> @@ PR = "r1" DEPENDS = "virtual/libx11 libxmu libpng jpeg freetype
> sessreg ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> 
> SRC_URI = " \ -  http://download.berlios.de/${PN}/${P}.tar.gz \ -
> file://0002-Fix-image-handling-integer-overflows.patch \ -
> file://0003-Fix-build-failure-with-ld-as-needed.patch \ -
> file://0004-Add-support-libpng15.patch \ -
> file://0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch \ -
> file://0006-Remove-localhost-from-Authenticator-of-pam.patch \ -
> file://0007-Fix-tty-slowness.patch \ -
> file://0008-restart-Xserver-if-killed.patch \ -  file://slim-dynwm \ -
> file://update_slim_wmlist \ -  file://Makefile.oe \ -  file://slim.pamd
> \ -  file://slim.service \ +
> http://download.berlios.de/${PN}/${P}.tar.gz \ +
> file://0002-Fix-image-handling-integer-overflows.patch \ +
> file://0003-Fix-build-failure-with-ld-as-needed.patch \ +
> file://0004-Add-support-libpng15.patch \ +
> file://0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch \ +
> file://0006-Remove-localhost-from-Authenticator-of-pam.patch \ +
> file://0007-Fix-tty-slowness.patch \ +
> file://0008-restart-Xserver-if-killed.patch \ +    file://slim-dynwm \ +
> file://update_slim_wmlist \ +    file://Makefile.oe \ +
> file://slim.pamd \ +    file://slim.service \ "
> 
> SRC_URI[md5sum] = "ca1ae6120e6f4b4969f2d6cf94f47b42" @@ -28,32 +28,32 @@
> SRC_URI[sha256sum] =
> "f1560125005f253b9b88220598fed7a9575ef405716862c6ca3fcc72db
> 
> 
> EXTRA_OEMAKE += " \ -  USE_PAM=${@base_contains('DISTRO_FEATURES', 'pam',
> '1', '0', d)} \ -  PREFIX=${prefix} \ -  CFGDIR=${sysconfdir} \ -
> MANDIR=${mandir} \ -  DESTDIR=${D} \ -
> CFLAGS+=-I${STAGING_INCDIR}/freetype2 \ -
> CXXFLAGS+=-I${STAGING_INCDIR}/freetype2 \ +
> USE_PAM=${@base_contains('DISTRO_FEATURES', 'pam', '1', '0', d)} \ +
> PREFIX=${prefix} \ +    CFGDIR=${sysconfdir} \ +    MANDIR=${mandir} \ +
> DESTDIR=${D} \ +    CFLAGS+=-I${STAGING_INCDIR}/freetype2 \ +
> CXXFLAGS+=-I${STAGING_INCDIR}/freetype2 \ "
> 
> do_compile_prepend() { -  cp -pP ${WORKDIR}/Makefile.oe ${S}/Makefile +
> cp -pP ${WORKDIR}/Makefile.oe ${S}/Makefile }
> 
> do_install() { -  oe_runmake install -  install -d ${D}${bindir} -
> install -m 0755 ${WORKDIR}/slim-dynwm ${D}${bindir}/ -  install -m 0755
> ${WORKDIR}/update_slim_wmlist ${D}${bindir}/ -  install -d
> ${D}${sysconfdir}/pam.d/ -  install -m 0644 ${WORKDIR}/slim.pamd
> ${D}${sysconfdir}/pam.d/slim - -  install -d
> ${D}${systemd_unitdir}/system/ -  install -m 0644 ${WORKDIR}/*.service
> ${D}${systemd_unitdir}/system/ - -  echo 'sessionstart_cmd
> /usr/bin/sessreg -a -l $DISPLAY %user' >> ${D}${sysconfdir}/slim.conf -
> echo 'sessionstop_cmd     /usr/bin/sessreg -d -l $DISPLAY %user' >>
> ${D}${sysconfdir}/slim.conf +    oe_runmake install +    install -d
> ${D}${bindir} +    install -m 0755 ${WORKDIR}/slim-dynwm ${D}${bindir}/ +
> install -m 0755 ${WORKDIR}/update_slim_wmlist ${D}${bindir}/ +    install
> -d ${D}${sysconfdir}/pam.d/ +    install -m 0644 ${WORKDIR}/slim.pamd
> ${D}${sysconfdir}/pam.d/slim + +    install -d
> ${D}${systemd_unitdir}/system/ +    install -m 0644 ${WORKDIR}/*.service
> ${D}${systemd_unitdir}/system/ + +    echo 'sessionstart_cmd
> /usr/bin/sessreg -a -l $DISPLAY %user' >> ${D}${sysconfdir}/slim.conf +
> echo 'sessionstop_cmd     /usr/bin/sessreg -d -l $DISPLAY %user' >>
> ${D}${sysconfdir}/slim.conf }
> 
> 
> @@ -62,7 +62,7 @@ FILES_${PN} += "${systemd_unitdir}/system/"
> 
> pkg_postinst_${PN} () { if test "x$D" != "x"; then -	exit 1 +    exit 1 
> fi systemctl enable slim.service
> 
> @@ -73,7 +73,7 @@ echo "${bindir}/slim" >
> ${sysconfdir}/X11/default-display-manager
> 
> pkg_postrm_${PN} () { if test "x$D" != "x"; then -	exit 1 +    exit 1 fi 
> systemctl disable slim.service sed -i /slim/d
> $D${sysconfdir}/X11/default-display-manager || true diff --git
> a/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
> b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb 
> index e05ff38..d6e0681 100644 ---
> a/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb 
> +++
> b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb 
> @@ -8,9 +8,9 @@ PR = "r2" inherit packagegroup allarch
> 
> PACKAGES += "\ -  ${PN}-core \ -  ${PN}-chinese \ -  ${PN}-japanese \ +
> ${PN}-core \ +    ${PN}-chinese \ +    ${PN}-japanese \ " RPROVIDES_${PN}
> += "task-fonts-truetype" RPROVIDES_${PN}-core +=
> "task-fonts-truetype-core" @@ -26,27 +26,27 @@ RCONFLICTS_${PN}-chinese
> += "task-fonts-truetype-chinese" RCONFLICTS_${PN}-japanese +=
> "task-fonts-truetype-japanese"
> 
> RRECOMMENDS_${PN} = "\ -  ${PN}-core \ -  ${PN}-chinese \ -
> ${PN}-japanese \ +    ${PN}-core \ +    ${PN}-chinese \ +
> ${PN}-japanese \ "
> 
> RDEPENDS_${PN}-core = "\ -  fontconfig-utils \ -  \ -  ttf-dejavu-common
> \ -  ttf-dejavu-sans \ -  ttf-dejavu-sans-mono \ +    fontconfig-utils \ 
> +    \ +    ttf-dejavu-common \ +    ttf-dejavu-sans \ +
> ttf-dejavu-sans-mono \ " #  ttf-dejavu-serif
> 
> RDEPENDS_${PN}-chinese = "\ -  ${PN}-core \ -  ttf-arphic-uming \ +
> ${PN}-core \ +    ttf-arphic-uming \ "
> 
> RDEPENDS_${PN}-japanese = "\ -  ${PN}-core \ -  ttf-sazanami-gothic \ -
> ttf-sazanami-mincho \ +    ${PN}-core \ +    ttf-sazanami-gothic \ +
> ttf-sazanami-mincho \ " diff --git
> a/meta-oe/recipes-graphics/tslib/tslib_git.bb
> b/meta-oe/recipes-graphics/tslib/tslib_git.bb index 71a63ee..b653978
> 100644 --- a/meta-oe/recipes-graphics/tslib/tslib_git.bb +++
> b/meta-oe/recipes-graphics/tslib/tslib_git.bb @@ -28,12 +28,12 @@ inherit
> autotools pkgconfig EXTRA_OECONF = "--enable-shared --disable-h3600
> --enable-input --disable-corgi --disable-collie --disable-mk712
> --disable-arctic2 --disable-ucb1x00"
> 
> do_install_prepend() { -	install -m 0644 ${WORKDIR}/ts.conf
> ${S}/etc/ts.conf +    install -m 0644 ${WORKDIR}/ts.conf
> ${S}/etc/ts.conf }
> 
> do_install_append() { -	install -d ${D}${sysconfdir}/profile.d/ -	install
> -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/ +    install -d
> ${D}${sysconfdir}/profile.d/ +    install -m 0755 ${WORKDIR}/tslib.sh
> ${D}${sysconfdir}/profile.d/ }
> 
> SRC_URI_OVERRIDES_PACKAGE_ARCH = "0" diff --git
> a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb index
> bcc797c..72bc2d2 100644 ---
> a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb +++
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb @@ -20,8 +20,8 @@
> SRC_URI = "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.bz2 \ 
> S = "${WORKDIR}/dejavu-fonts-ttf-${PV}/ttf"
> 
> do_install_append () { -	install -d ${D}${sysconfdir}/fonts/conf.d/ -
> install -m 0644 ${WORKDIR}/30-dejavu-aliases.conf
> ${D}${sysconfdir}/fonts/conf.d/ +    install -d
> ${D}${sysconfdir}/fonts/conf.d/ +    install -m 0644
> ${WORKDIR}/30-dejavu-aliases.conf ${D}${sysconfdir}/fonts/conf.d/ }
> 
> PACKAGES = "\ diff --git
> a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb index
> a96bc51..c1180b8 100644 ---
> a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb +++
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb @@ -13,7 +13,7 @@
> SRC_URI =
> "git://github.com/android/platform_frameworks_base.git;protocol=git;br S
> = "${WORKDIR}/git/data/fonts"
> 
> do_install_prepend() { -	rm ${S}/Ahem.ttf MTLc3m.ttf DroidSansArabic.ttf
> DroidSansThai.ttf Clockopia.ttf MTLmr3m.ttf DroidSansHebrew.ttf
> DroidSansFallbackLegacy.ttf # we're not packaging it +    rm
> ${S}/Ahem.ttf MTLc3m.ttf DroidSansArabic.ttf DroidSansThai.ttf
> Clockopia.ttf MTLmr3m.ttf DroidSansHebrew.ttf DroidSansFallbackLegacy.ttf
> # we're not packaging it }
> 
> PACKAGES = "ttf-droid-sans ttf-droid-sans-mono \ diff --git
> a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb index
> 8359bd8..129e137 100644 ---
> a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb +++
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb @@ -7,20
> +7,20 @@ LIC_FILES_CHKSUM =
> "file://../OFL.txt;md5=969851e3a70122069a4d9ee61dd5a2ed" PR = "r0"
> 
> SRC_URI = "http://levien.com/type/myfonts/Inconsolata.otf \ -
> file://OFL.txt" +    file://OFL.txt"
> 
> S = "${WORKDIR}/ttf-inconsolata-${PV}"
> 
> FILES_${PN} = "${datadir}/fonts/truetype/Inconsolata.ttf \ -
> ${datadir}/doc/ttf-inconsolata/*" +    ${datadir}/doc/ttf-inconsolata/*"
> 
> do_configure() { -	mv ${WORKDIR}/Inconsolata.otf ${S}/Inconsolata.ttf +
> mv ${WORKDIR}/Inconsolata.otf ${S}/Inconsolata.ttf }
> 
> do_install_append() { -	install -d ${D}${datadir}/doc/ttf-inconsolata/ -
> install -m 0644 ${WORKDIR}/OFL.txt ${D}${datadir}/doc/ttf-inconsolata/ +
> install -d ${D}${datadir}/doc/ttf-inconsolata/ +    install -m 0644
> ${WORKDIR}/OFL.txt ${D}${datadir}/doc/ttf-inconsolata/ }
> 
> SRC_URI[md5sum] = "0fbe014c1f0fb5e3c71140ff0dc63edf" diff --git
> a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb index
> 5237944..d2e84c2 100644 ---
> a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb +++
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb @@ -18,8 +18,8 @@
> python populate_packages_prepend() { }
> 
> do_install() { -	install -d ${D}${datadir}/fonts/ttf-mplus -	install -m
> 0644 *.ttf ${D}${datadir}/fonts/ttf-mplus/ +    install -d
> ${D}${datadir}/fonts/ttf-mplus +    install -m 0644 *.ttf
> ${D}${datadir}/fonts/ttf-mplus/ }
> 
> SRC_URI[md5sum] = "d1400184b51b3871e8d2fca6c50e18ae" diff --git
> a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb index
> d883734..0390740 100644 ---
> a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb +++
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb @@ -23,12
> +23,12 @@ FILES_ttf-sazanami-mincho =
> "${datadir}/fonts/truetype/sazanami-mincho.ttf \ 
> ${datadir}/doc/ttf-sazanami-mincho/README"
> 
> do_install_append() { -	# README contains the redistribution license -
> install -d ${D}${datadir}/doc/ -	install -d
> ${D}${datadir}/doc/ttf-sazanami-gothic -	install -d
> ${D}${datadir}/doc/ttf-sazanami-mincho -	install -m 0644 ${S}/README
> ${D}${datadir}/doc/ttf-sazanami-gothic -	install -m 0644 ${S}/README
> ${D}${datadir}/doc/ttf-sazanami-mincho +    # README contains the
> redistribution license +    install -d ${D}${datadir}/doc/ +    install
> -d ${D}${datadir}/doc/ttf-sazanami-gothic +    install -d
> ${D}${datadir}/doc/ttf-sazanami-mincho +    install -m 0644 ${S}/README
> ${D}${datadir}/doc/ttf-sazanami-gothic +    install -m 0644 ${S}/README
> ${D}${datadir}/doc/ttf-sazanami-mincho }
> 
> SRC_URI[md5sum] = "ceef10579a75c92483171f3bd7f77df2" diff --git
> a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb index
> 6095386..88fca6c 100644 ---
> a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb +++
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb @@ -11,9
> +11,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}-0.tar.gz" 
> S = "${WORKDIR}/wqy-zenhei"
> 
> do_install_append () { -	install -d ${D}${sysconfdir}/fonts/conf.d/ -
> install -m 0644 ${S}/44-wqy-zenhei.conf ${D}${sysconfdir}/fonts/conf.d/ -
> install -m 0644 ${S}/66-wqy-zenhei-sharp.conf
> ${D}${sysconfdir}/fonts/conf.d/ +    install -d
> ${D}${sysconfdir}/fonts/conf.d/ +    install -m 0644
> ${S}/44-wqy-zenhei.conf ${D}${sysconfdir}/fonts/conf.d/ +    install -m
> 0644 ${S}/66-wqy-zenhei-sharp.conf ${D}${sysconfdir}/fonts/conf.d/ }
> 
> PACKAGES = "${PN}" diff --git
> a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
> b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb index
> 4f13058..a79b57f 100644 ---
> a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb +++
> b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb @@ -14,6
> +14,6 @@ SRC_URI[sha256sum] =
> "42d7271fbc796e53db71bb221f311b9ff3c51d90a71c9487a9bd3101ca EXTRA_OEMAKE
> = "PREFIX=${prefix} INSTALLMAN=${mandir}"
> 
> do_install() { -	oe_runmake -e install DESTDIR=${D} PREFIX=${prefix} +
> oe_runmake -e install DESTDIR=${D} PREFIX=${prefix} }
> 
> diff --git
> a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb 
> index 9b68d54..bfb952f 100644 ---
> a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb +++
> b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb @@
> -8,11 +8,11 @@ SRC_URI = "file://pointercal.xinput" S = "${WORKDIR}"
> 
> do_install() { -	# Only install file if it has a contents -	if [ -s
> ${S}/pointercal.xinput ]; then -	        install -d ${D}${sysconfdir}/ -
> install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/ -	fi +    #
> Only install file if it has a contents +    if [ -s
> ${S}/pointercal.xinput ]; then +        install -d ${D}${sysconfdir}/ +
> install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/ +    fi }
> 
> PACKAGE_ARCH = "${MACHINE_ARCH}" diff --git
> a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb 
> index b01f62d..593d465 100644 ---
> a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb +++
> b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb @@
> -19,15 +19,15 @@ S = "${WORKDIR}/git" EXTRA_OECONF += "--with-gui=x11"
> 
> do_install_append() { -        install -d ${D}${bindir} -        install
> -m 0755 scripts/xinput_calibrator_pointercal.sh
> ${D}${bindir}/xinput_calibrator_once.sh +    install -d ${D}${bindir} +
> install -m 0755 scripts/xinput_calibrator_pointercal.sh
> ${D}${bindir}/xinput_calibrator_once.sh
> 
> -        install -d ${D}${sysconfdir}/xdg/autostart -        sed -i -e
> 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,'
> scripts/xinput_calibrator.desktop -        install -m 0644
> scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart +
> install -d ${D}${sysconfdir}/xdg/autostart +    sed -i -e
> 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,'
> scripts/xinput_calibrator.desktop +    install -m 0644
> scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
> 
> -	install -d ${D}${systemd_unitdir}/system -	install -m 0644
> ${WORKDIR}/xinput-calibrator.service ${D}${systemd_unitdir}/system +
> install -d ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/xinput-calibrator.service ${D}${systemd_unitdir}/system }
> 
> FILES_${PN} += "${sysconfdir}/xdg/autostart" diff --git
> a/meta-oe/recipes-graphics/xorg-app/xterm_277.bb
> b/meta-oe/recipes-graphics/xorg-app/xterm_277.bb index 18abe35..c56be09
> 100644 --- a/meta-oe/recipes-graphics/xorg-app/xterm_277.bb +++
> b/meta-oe/recipes-graphics/xorg-app/xterm_277.bb @@ -15,9 +15,9 @@
> EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \ --disable-setuid"
> 
> do_configure() { -        gnu-configize --force -        sed -e
> "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure -
> oe_runconf +    gnu-configize --force +    sed -e
> "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure +    oe_runconf 
> }
> 
> FILES_${PN} += " /usr/lib/X11" diff --git
> a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
> b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb index
> a604d46..0397fb2 100644 ---
> a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb +++
> b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb @@ -16,6
> +16,6 @@ EXTRA_OEMAKE = "'INCLUDE=-I${STAGING_INCDIR}/xorg
> -I${STAGING_INCDIR}/pixman-1'"
> 
> #skip xorg-driver-common.inc AC_CHECK_FILE mangling do_configure_prepend
> () { -	sed 's#gcc#${CC}#g' -i Makefile -	return +    sed 's#gcc#${CC}#g'
> -i Makefile +    return } diff --git
> a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
> b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb index
> d00fb4e..fab7fab 100644 ---
> a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb +++
> b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb @@
> -22,13 +22,13 @@ SRC_URI[md5sum] = "b7a4d2f11637ee3fcf432e044b1d017f" 
> SRC_URI[sha256sum] =
> "5f46fdef095a6e44a69e0f0b57c7d665224b26d990d006611236d8332e85b105"
> 
> do_configure_prepend() { -        rm -rf ${S}/m4/ || true +    rm -rf
> ${S}/m4/ || true } do_install_append() { -        install -d
> ${D}/${datadir}/hal/fdi/policy/20thirdparty -        install -m 0644
> ${WORKDIR}/10-x11-input-tslib.fdi
> ${D}/${datadir}/hal/fdi/policy/20thirdparty -        install -d
> ${D}/lib/udev/rules.d -        install -m 0644
> ${WORKDIR}/99-xf86-input-tslib.rules ${D}/lib/udev/rules.d/ +    install
> -d ${D}/${datadir}/hal/fdi/policy/20thirdparty +    install -m 0644
> ${WORKDIR}/10-x11-input-tslib.fdi
> ${D}/${datadir}/hal/fdi/policy/20thirdparty +    install -d
> ${D}/lib/udev/rules.d +    install -m 0644
> ${WORKDIR}/99-xf86-input-tslib.rules ${D}/lib/udev/rules.d/ }
> 
> FILES_${PN} += "${datadir}/hal /lib/udev" diff --git
> a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
> b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb index
> f5a4a6f..83cd1f9 100644 ---
> a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb +++
> b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb @@ -14,9 +14,9 @@
> SRC_URI[sha256sum] =
> "2d96bcf92638b8ec5c91d379f5ec2e7b15133adeb2ba22066d48bf3239 EXTRA_OECONF
> += " --disable-docs "
> 
> do_install_append () { -        ln -sf libXaw6.so.6
> ${D}${libdir}/libXaw.so.6 -        ln -sf libXaw7.so.7
> ${D}${libdir}/libXaw.so.7 -        ln -sf libXaw7.so.7
> ${D}${libdir}/libXaw.so +    ln -sf libXaw6.so.6
> ${D}${libdir}/libXaw.so.6 +    ln -sf libXaw7.so.7
> ${D}${libdir}/libXaw.so.7 +    ln -sf libXaw7.so.7
> ${D}${libdir}/libXaw.so }
> 
> PACKAGES =+ "libxaw6 libxaw7 libxaw8" diff --git
> a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
> b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb index
> f307419..3bb8b61 100644 ---
> a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb +++
> b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb @@
> -11,22 +11,22 @@ SRC_URI[md5sum] = "82f2f84cd96610e8f7b92c700cd31c14" 
> SRC_URI[sha256sum] =
> "cd04c33418f776b1e13fcc7af3d6bd0c7cccd03fbabd7dbcd97f88166cc34210"
> 
> SRC_URI_append = " \ -  file://0001-COPYING-add-GPLv2-license-file.patch
> \ -  file://0002-add-setdpi-Xinit.d-script.patch \ -
> file://0003-add-89xdgautostart-Xsession.d-script.patch \ -
> file://0005-add-XWindowManager-Xsession.d-script.patch \ -
> file://0006-add-support-for-etc-X11-xserver-system.patch \ -
> file://0007-use-own-functions-file-instead-etc-init.d-functions.patch \ -
> file://0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch \ 
> -  file://0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch
> \ -
> file://0010-xserver-common-add-support-for-nexus-S-alias-herring.patch \ 
> -  file://0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch
> \ -
> file://0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch \ 
> -  file://0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch
> \ +    file://0001-COPYING-add-GPLv2-license-file.patch \ +
> file://0002-add-setdpi-Xinit.d-script.patch \ +
> file://0003-add-89xdgautostart-Xsession.d-script.patch \ +
> file://0005-add-XWindowManager-Xsession.d-script.patch \ +
> file://0006-add-support-for-etc-X11-xserver-system.patch \ +
> file://0007-use-own-functions-file-instead-etc-init.d-functions.patch \ +
> file://0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch \ 
> +
> file://0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch \ 
> +
> file://0010-xserver-common-add-support-for-nexus-S-alias-herring.patch \ 
> +
> file://0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch \ 
> +
> file://0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch \ 
> +
> file://0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch \ 
> "
> 
> do_install_append() { -        sed -i 's:^BINDIR=.*$:BINDIR=${bindir}:'
> ${D}/etc/X11/xserver-common +    sed -i 's:^BINDIR=.*$:BINDIR=${bindir}:'
> ${D}/etc/X11/xserver-common }
> 
> inherit allarch diff --git
> a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
> b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb 
> index bbed445..aa85c8c 100644 ---
> a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb +++
> b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb @@
> -19,13 +19,13 @@ INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ." 
> INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
> 
> do_install() { -	install -d ${D}${sysconfdir}/init.d -	install
> xserver-nodm ${D}${sysconfdir}/init.d +    install -d
> ${D}${sysconfdir}/init.d +    install xserver-nodm
> ${D}${sysconfdir}/init.d
> 
> -	install -d ${D}${sysconfdir}/default -	install -d
> ${D}${systemd_unitdir}/system -	install xserver-nodm.conf
> ${D}${sysconfdir}/default/xserver-nodm -	install -m 0644
> ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/system +
> install -d ${D}${sysconfdir}/default +    install -d
> ${D}${systemd_unitdir}/system +    install xserver-nodm.conf
> ${D}${sysconfdir}/default/xserver-nodm +    install -m 0644
> ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/system }
> 
> RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit" diff --git
> a/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc
> b/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc index
> 30d52cc..41f673a 100644 ---
> a/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc +++
> b/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc @@ -10,8
> +10,8 @@ COMPAT_WIRELESS_VERSION = "${PV}-1" SHRT_VER =
> "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
> 
> SRC_URI = " \ -
> http://www.orbit-lab.org/kernel/compat-wireless-3-stable/v${SHRT_VER}/compat-wireless-${COMPAT_WIRELESS_VERSION}.tar.bz2
> \ -  file://0001-ath5k-fix-compilation-without-CONFIG_PCI.patch \ +
> http://www.orbit-lab.org/kernel/compat-wireless-3-stable/v${SHRT_VER}/compat-wireless-${COMPAT_WIRELESS_VERSION}.tar.bz2
> \ +    file://0001-ath5k-fix-compilation-without-CONFIG_PCI.patch \ "
> 
> S = "${WORKDIR}/compat-wireless-${COMPAT_WIRELESS_VERSION}" @@ -21,9
> +21,9 @@ inherit module EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR}
> KLIB=${D}"
> 
> do_configure_append() { -	sed -i "s#@./scripts/update-initramfs## "
> Makefile +    sed -i "s#@./scripts/update-initramfs## " Makefile }
> 
> do_install() { -	oe_runmake DEPMOD=echo DESTDIR="${D}"
> INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules +    oe_runmake
> DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS=""
> install-modules } diff --git a/meta-oe/recipes-kernel/linux/linux.inc
> b/meta-oe/recipes-kernel/linux/linux.inc index 2b2fbf3..7b301ae 100644 
> --- a/meta-oe/recipes-kernel/linux/linux.inc +++
> b/meta-oe/recipes-kernel/linux/linux.inc @@ -25,106 +25,106 @@
> LOCALVERSION ?= ""
> 
> #kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\"" 
> kernel_conf_variable() { -	CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[
> =]/d;" -	if test "$2" = "n" -	then -		echo "# CONFIG_$1 is not set" >>
> ${S}/.config -	else -		echo "CONFIG_$1=$2" >> ${S}/.config -	fi +
> CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[ =]/d;" +    if test "$2" =
> "n" +    then +        echo "# CONFIG_$1 is not set" >> ${S}/.config +
> else +        echo "CONFIG_$1=$2" >> ${S}/.config +    fi }
> 
> do_configure_prepend() { -        echo "" > ${S}/.config -
> CONF_SED_SCRIPT="" - -        # -        # logo support, if you supply
> logo_linux_clut224.ppm in SRC_URI, then it's going to be used -        # 
> -        if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then -
> install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm
> drivers/video/logo/logo_linux_clut224.ppm -		kernel_conf_variable LOGO y 
> -		kernel_conf_variable LOGO_LINUX_CLUT224 y -        fi - -        # -
> # oabi / eabi support -        # -	kernel_conf_variable AEABI y -	if [
> "${ARM_KEEP_OABI}" = "1" ] ; then -		kernel_conf_variable OABI_COMPAT y -
> else -		kernel_conf_variable OABI_COMPAT n -	fi - -        # When
> enabling thumb for userspace we also need thumb support in the kernel -
> if [ "${ARM_INSTRUCTION_SET}" = "thumb" ] ; then -		kernel_conf_variable
> ARM_THUMB y -        fi - -	kernel_conf_variable CMDLINE "\"${CMDLINE}
> ${CMDLINE_DEBUG}\"" - -	kernel_conf_variable LOCALVERSION
> "\"${LOCALVERSION}\"" -	kernel_conf_variable LOCALVERSION_AUTO n - -
> kernel_conf_variable SYSFS_DEPRECATED n -	kernel_conf_variable
> SYSFS_DEPRECATED_V2 n -        kernel_conf_variable HOTPLUG y -
> kernel_conf_variable UEVENT_HELPER_PATH \"\" -
> kernel_conf_variable UNIX y -        kernel_conf_variable SYSFS y -
> kernel_conf_variable PROC_FS y -        kernel_conf_variable TMPFS y -
> kernel_conf_variable INOTIFY_USER y -        kernel_conf_variable
> SIGNALFD y -        kernel_conf_variable TMPFS_POSIX_ACL y -
> kernel_conf_variable BLK_DEV_BSG y -        kernel_conf_variable DEVTMPFS
> y -        kernel_conf_variable DEVTMPFS_MOUNT y - -        # Newer inits
> like systemd need cgroup support -        if [ "${KERNEL_ENABLE_CGROUPS}"
> = "1" ] ; then -            kernel_conf_variable CGROUP_SCHED y -
> kernel_conf_variable CGROUPS y -            kernel_conf_variable
> CGROUP_NS y -            kernel_conf_variable CGROUP_FREEZER y -
> kernel_conf_variable CGROUP_DEVICE y -            kernel_conf_variable
> CPUSETS y -            kernel_conf_variable PROC_PID_CPUSET y -
> kernel_conf_variable CGROUP_CPUACCT y -            kernel_conf_variable
> RESOURCE_COUNTERS y -        fi - -        # -        #
> root-over-nfs-over-usb-eth support. Limited, but should cover some
> cases. -        # Enable this by setting a proper CMDLINE_NFSROOT_USB. -
> # -        if [ ! -z "${CMDLINE_NFSROOT_USB}" ]; then -
> bbnote "Configuring the kernel for root-over-nfs-over-usb-eth with
> CMDLINE ${CMDLINE_NFSROOT_USB}" -                kernel_conf_variable
> INET y -                kernel_conf_variable IP_PNP y -
> kernel_conf_variable USB_GADGET y -                kernel_conf_variable
> USB_GADGET_SELECTED y -                kernel_conf_variable USB_ETH y -
> kernel_conf_variable NFS_FS y -                kernel_conf_variable
> ROOT_NFS y -                kernel_conf_variable CMDLINE
> \"${CMDLINE_NFSROOT_USB} ${CMDLINE_DEBUG}\" -        fi - -        sed -e
> "${CONF_SED_SCRIPT}" \ -		< '${WORKDIR}/defconfig' >>'${S}/.config' - -
> yes '' | oe_runmake oldconfig +    echo "" > ${S}/.config +
> CONF_SED_SCRIPT="" + +    # +    # logo support, if you supply
> logo_linux_clut224.ppm in SRC_URI, then it's going to be used +    # +
> if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then +        install -m
> 0644 ${WORKDIR}/logo_linux_clut224.ppm
> drivers/video/logo/logo_linux_clut224.ppm +    kernel_conf_variable LOGO
> y +    kernel_conf_variable LOGO_LINUX_CLUT224 y +    fi + +    # +    #
> oabi / eabi support +    # +    kernel_conf_variable AEABI y +    if [
> "${ARM_KEEP_OABI}" = "1" ] ; then +        kernel_conf_variable
> OABI_COMPAT y +    else +        kernel_conf_variable OABI_COMPAT n +
> fi + +    # When enabling thumb for userspace we also need thumb support
> in the kernel +    if [ "${ARM_INSTRUCTION_SET}" = "thumb" ] ; then +
> kernel_conf_variable ARM_THUMB y +    fi + +    kernel_conf_variable
> CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\"" + +    kernel_conf_variable
> LOCALVERSION "\"${LOCALVERSION}\"" +    kernel_conf_variable
> LOCALVERSION_AUTO n + +    kernel_conf_variable SYSFS_DEPRECATED n +
> kernel_conf_variable SYSFS_DEPRECATED_V2 n +    kernel_conf_variable
> HOTPLUG y +    kernel_conf_variable UEVENT_HELPER_PATH \"\" +
> kernel_conf_variable UNIX y +    kernel_conf_variable SYSFS y +
> kernel_conf_variable PROC_FS y +    kernel_conf_variable TMPFS y +
> kernel_conf_variable INOTIFY_USER y +    kernel_conf_variable SIGNALFD y 
> +    kernel_conf_variable TMPFS_POSIX_ACL y +    kernel_conf_variable
> BLK_DEV_BSG y +    kernel_conf_variable DEVTMPFS y +
> kernel_conf_variable DEVTMPFS_MOUNT y + +    # Newer inits like systemd
> need cgroup support +    if [ "${KERNEL_ENABLE_CGROUPS}" = "1" ] ; then +
> kernel_conf_variable CGROUP_SCHED y +        kernel_conf_variable CGROUPS
> y +        kernel_conf_variable CGROUP_NS y +        kernel_conf_variable
> CGROUP_FREEZER y +        kernel_conf_variable CGROUP_DEVICE y +
> kernel_conf_variable CPUSETS y +        kernel_conf_variable
> PROC_PID_CPUSET y +        kernel_conf_variable CGROUP_CPUACCT y +
> kernel_conf_variable RESOURCE_COUNTERS y +    fi + +    # +    #
> root-over-nfs-over-usb-eth support. Limited, but should cover some
> cases. +    # Enable this by setting a proper CMDLINE_NFSROOT_USB. +
> # +    if [ ! -z "${CMDLINE_NFSROOT_USB}" ]; then +        bbnote
> "Configuring the kernel for root-over-nfs-over-usb-eth with CMDLINE
> ${CMDLINE_NFSROOT_USB}" +        kernel_conf_variable INET y +
> kernel_conf_variable IP_PNP y +        kernel_conf_variable USB_GADGET y 
> +        kernel_conf_variable USB_GADGET_SELECTED y +
> kernel_conf_variable USB_ETH y +        kernel_conf_variable NFS_FS y +
> kernel_conf_variable ROOT_NFS y +        kernel_conf_variable CMDLINE
> \"${CMDLINE_NFSROOT_USB} ${CMDLINE_DEBUG}\" +    fi + +    sed -e
> "${CONF_SED_SCRIPT}" \ +    < '${WORKDIR}/defconfig' >>'${S}/.config' + +
> yes '' | oe_runmake oldconfig }
> 
> do_configure_append() { -        if test -e scripts/Makefile.fwinst ;
> then -		sed -i -e "s:-m0644:-m 0644:g" scripts/Makefile.fwinst -	fi +
> if test -e scripts/Makefile.fwinst ; then +        sed -i -e "s:-m0644:-m
> 0644:g" scripts/Makefile.fwinst +    fi }
> 
> do_install_append() { -	oe_runmake headers_install
> INSTALL_HDR_PATH=${D}${exec_prefix}/src/linux-${KERNEL_VERSION}
> ARCH=$ARCH +    oe_runmake headers_install
> INSTALL_HDR_PATH=${D}${exec_prefix}/src/linux-${KERNEL_VERSION}
> ARCH=$ARCH }
> 
> PACKAGES =+ "kernel-headers" diff --git
> a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb
> b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb index
> 52634c1..a455cad 100644 ---
> a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb +++
> b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb @@ -6,16 +6,16 @@
> DEPENDS = "alsa-lib" PR = "r1"
> 
> SRC_URI = "ftp://ftp.alsa-project.org/pub/oss-lib/alsa-oss-${PV}.tar.bz2
> \ -	   file://libio.patch \ -	  " +    file://libio.patch \ +"
> 
> inherit autotools
> 
> LEAD_SONAME = "libaoss.so.0"
> 
> do_configure_prepend () { -	touch NEWS README AUTHORS ChangeLog -	sed -i
> "s/libaoss.so/${LEAD_SONAME}/" ${S}/alsa/aoss.in +    touch NEWS README
> AUTHORS ChangeLog +    sed -i "s/libaoss.so/${LEAD_SONAME}/"
> ${S}/alsa/aoss.in }
> 
> SRC_URI[md5sum] = "1b1850c2fc91476a73d50f537cbd402f" diff --git
> a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
> b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb index
> d5cfb3f..ee4a7b1 100644 ---
> a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb +++
> b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb @@ -22,7 +22,7 @@
> EXTRA_OECONF = " \ --disable-artstest \ " do_configure_prepend() { -	sed
> -i -e 's:/usr/include/mme:${STAGING_INCDIR}/mme:g' configure.ac +    sed
> -i -e 's:/usr/include/mme:${STAGING_INCDIR}/mme:g' configure.ac }
> 
> PACKAGES =+ "esddsp esd esd-utils" diff --git
> a/meta-oe/recipes-multimedia/libass/libass.inc
> b/meta-oe/recipes-multimedia/libass/libass.inc index 28d6caa..4dd5181
> 100644 --- a/meta-oe/recipes-multimedia/libass/libass.inc +++
> b/meta-oe/recipes-multimedia/libass/libass.inc @@ -14,13 +14,13 @@
> SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.gz" inherit
> autotools pkgconfig
> 
> EXTRA_OECONF = " \ -	--enable-enca \ -	--enable-fontconfig \ -
> --enable-png \ +    --enable-enca \ +    --enable-fontconfig \ +
> --enable-png \ "
> 
> PACKAGES =+ "${PN}-tests"
> 
> FILES_${PN}-tests = " \ -	${libdir}/test/test \ +    ${libdir}/test/test
> \ " diff --git a/meta-oe/recipes-multimedia/libav/libav.inc
> b/meta-oe/recipes-multimedia/libav/libav.inc index 54307af..6e91061
> 100644 --- a/meta-oe/recipes-multimedia/libav/libav.inc +++
> b/meta-oe/recipes-multimedia/libav/libav.inc @@ -15,10 +15,10 @@ INC_PR =
> "r8"
> 
> inherit autotools pkgconfig
> 
> -#        --enable-libgsm -#        --enable-libmp3lame -#
> --enable-libschroedinger -#        --enable-libvpx +#    --enable-libgsm 
> +#    --enable-libmp3lame +#    --enable-libschroedinger +#
> --enable-libvpx
> 
> B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
> 
> @@ -29,28 +29,28 @@ EXTRA_FFCONF_armv7a = "--cpu=cortex-a8" EXTRA_FFCONF
> ?= ""
> 
> EXTRA_OECONF = " \ -        --enable-shared \ -        --enable-pthreads
> \ -        --enable-gpl \ -        --enable-avfilter \ -        \ -
> --cross-prefix=${TARGET_PREFIX} \ -        --prefix=${prefix} \ -
> \ -        --enable-avserver \ -        --enable-avplay \ -
> --enable-x11grab \ -        --enable-libtheora  \ -
> --enable-libvorbis \ -        --enable-libx264 \ -
> --arch=${TARGET_ARCH} \ -        --target-os="linux" \ -
> --enable-cross-compile \ -        --extra-cflags="${TARGET_CFLAGS}
> ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \ -
> --extra-ldflags="${TARGET_LDFLAGS}" \ -
> --sysroot="${STAGING_DIR_TARGET}" \ -        --enable-hardcoded-tables \ 
> -        ${EXTRA_FFCONF} \ +    --enable-shared \ +    --enable-pthreads
> \ +    --enable-gpl \ +    --enable-avfilter \ +    \ +
> --cross-prefix=${TARGET_PREFIX} \ +    --prefix=${prefix} \ +    \ +
> --enable-avserver \ +    --enable-avplay \ +    --enable-x11grab \ +
> --enable-libtheora  \ +    --enable-libvorbis \ +    --enable-libx264 \ +
> --arch=${TARGET_ARCH} \ +    --target-os="linux" \ +
> --enable-cross-compile \ +    --extra-cflags="${TARGET_CFLAGS}
> ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \ +
> --extra-ldflags="${TARGET_LDFLAGS}" \ +
> --sysroot="${STAGING_DIR_TARGET}" \ +    --enable-hardcoded-tables \ +
> ${EXTRA_FFCONF} \ "
> 
> #| yasm not found, use --disable-yasm for a crippled build @@ -58,16
> +58,16 @@ EXTRA_OECONF_append_x86-64 = " --disable-yasm" 
> EXTRA_OECONF_append_x86 = " --disable-yasm"
> 
> do_configure() { -	# We don't have TARGET_PREFIX-pkgconfig -	sed -i
> '/pkg_config_default="${cross_prefix}${pkg_config_default}"/d'
> ${S}/configure -	mkdir -p ${B} -	cd ${B} -	${S}/configure
> ${EXTRA_OECONF} -	sed -i -e s:Os:O4:g ${B}/config.h +    # We don't have
> TARGET_PREFIX-pkgconfig +    sed -i
> '/pkg_config_default="${cross_prefix}${pkg_config_default}"/d'
> ${S}/configure +    mkdir -p ${B} +    cd ${B} +    ${S}/configure
> ${EXTRA_OECONF} +    sed -i -e s:Os:O4:g ${B}/config.h }
> 
> do_install_append() { -	install -m 0644 ${S}/libavfilter/*.h
> ${D}${includedir}/libavfilter/ +    install -m 0644 ${S}/libavfilter/*.h
> ${D}${includedir}/libavfilter/ }
> 
> FFMPEG_LIBS = "libavcodec libavdevice libavformat \ diff --git
> a/meta-oe/recipes-multimedia/libav/libav_0.8.4.bb
> b/meta-oe/recipes-multimedia/libav/libav_0.8.4.bb index ebab2c1..b48ae96
> 100644 --- a/meta-oe/recipes-multimedia/libav/libav_0.8.4.bb +++
> b/meta-oe/recipes-multimedia/libav/libav_0.8.4.bb @@ -1,13 +1,13 @@ 
> require libav.inc
> 
> EXTRA_OECONF += " \ -        --enable-postproc \ +    --enable-postproc
> \ "
> 
> FILESEXTRAPATHS_prepend := "${THISDIR}/libav-0.8.4:"
> 
> SRC_URI_append = " \ -
> file://0001-configure-enable-pic-for-AArch64.patch \ +
> file://0001-configure-enable-pic-for-AArch64.patch \ " LIC_FILES_CHKSUM =
> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \ 
> file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \ diff --git
> a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.7.bb
> b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.7.bb index
> f65270d..3028985 100644 ---
> a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.7.bb +++
> b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.7.bb @@ -14,8
> +14,8 @@ EXTRA_OECONF = "--disable-option-checking"
> 
> # NOTE: autotools_stage_all does nothing here, we need to do it manually 
> do_install_append() { -	install -d ${D}${includedir}/libmodplug -	install
> -m 0644 ${S}/src/modplug.h ${D}${includedir}/libmodplug -	install -m 0644
> ${S}/src/modplug.h ${D}${includedir}/ +    install -d
> ${D}${includedir}/libmodplug +    install -m 0644 ${S}/src/modplug.h
> ${D}${includedir}/libmodplug +    install -m 0644 ${S}/src/modplug.h
> ${D}${includedir}/ }
> 
> diff --git a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
> b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb index
> 1520628..b39f208 100644 ---
> a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb +++
> b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb @@ -24,21
> +24,21 @@ EXTRA_FFCONF_armv7a = "--cpu=cortex-a8" EXTRA_FFCONF ?= ""
> 
> EXTRA_OECONF = " \ -        --enable-shared \ -        --enable-pthreads
> \ -        --enable-gpl \ -        --enable-postproc \ -        \ -
> --cross-prefix=${TARGET_PREFIX} \ -        --prefix=${prefix} \ -
> \ -        --arch=${TARGET_ARCH} \ -        --target-os="linux" \ -
> --enable-cross-compile \ -        --extra-cflags="${TARGET_CFLAGS}
> ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \ -
> --extra-ldflags="${TARGET_LDFLAGS}" \ -
> --sysroot="${STAGING_DIR_TARGET}" \ -        ${EXTRA_FFCONF} \ +
> --enable-shared \ +    --enable-pthreads \ +    --enable-gpl \ +
> --enable-postproc \ +    \ +    --cross-prefix=${TARGET_PREFIX} \ +
> --prefix=${prefix} \ +    \ +    --arch=${TARGET_ARCH} \ +
> --target-os="linux" \ +    --enable-cross-compile \ +
> --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \ +
> --extra-ldflags="${TARGET_LDFLAGS}" \ +
> --sysroot="${STAGING_DIR_TARGET}" \ +    ${EXTRA_FFCONF} \ "
> 
> do_configure() { diff --git
> a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
> b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb index
> ccc3d40..4317d93 100644 ---
> a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb +++
> b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb @@
> -22,12 +22,12 @@ export SDL_CONFIG =
> "${STAGING_BINDIR_CROSS}/sdl-config" EXTRA_OECONF +=
> "--disable-jpg-shared --disable-png-shared -disable-tif-shared"
> 
> do_configure_prepend() { -	# Removing this file fixes a libtool version
> mismatch. -	rm -f acinclude/libtool.m4 -	rm -f acinclude/sdl.m4 -	rm -f
> acinclude/pkg.m4 -	rm -f acinclude/lt~obsolete.m4 -	rm -f
> acinclude/ltoptions.m4 -	rm -f acinclude/ltsugar.m4 -	rm -f
> acinclude/ltversion.m4 +    # Removing this file fixes a libtool version
> mismatch. +    rm -f acinclude/libtool.m4 +    rm -f acinclude/sdl.m4 +
> rm -f acinclude/pkg.m4 +    rm -f acinclude/lt~obsolete.m4 +    rm -f
> acinclude/ltoptions.m4 +    rm -f acinclude/ltsugar.m4 +    rm -f
> acinclude/ltversion.m4 } diff --git
> a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
> b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb index
> c8fa6ca..ee72e9d 100644 ---
> a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb +++
> b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb @@
> -19,20 +19,20 @@ EXTRA_AUTORECONF += "--include=acinclude" EXTRA_OECONF =
> "--disable-music-mp3 --enable-music-ogg --enable-music-ogg-tremor
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '',
> '--enable-music-mp3-mad-gpl', d)} LIBS=-L${STAGING_LIBDIR}"
> 
> do_configure () { -	# Remove old libtool macros. -	MACROS="libtool.m4
> lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4" -	for i in
> ${MACROS}; do -		rm -f acinclude/$i -	done -	cp build-scripts/* . ||
> true -	rm -rf build-scripts/ -	export SYSROOT=$PKG_CONFIG_SYSROOT_DIR - -
> autotools_do_configure - -	rm config.log -	for i in $(find -name
> "Makefile") ; do -		sed -i -e 's:-L/usr/lib:-L${STAGING_LIBDIR}:g' $i -
> done +    # Remove old libtool macros. +    MACROS="libtool.m4
> lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4" +    for i in
> ${MACROS}; do +        rm -f acinclude/$i +    done +    cp
> build-scripts/* . || true +    rm -rf build-scripts/ +    export
> SYSROOT=$PKG_CONFIG_SYSROOT_DIR + +    autotools_do_configure + +    rm
> config.log +    for i in $(find -name "Makefile") ; do +        sed -i -e
> 's:-L/usr/lib:-L${STAGING_LIBDIR}:g' $i +    done }
> 
> diff --git a/meta-oe/recipes-multimedia/live555/live555.inc
> b/meta-oe/recipes-multimedia/live555/live555.inc index 443f818..966224d
> 100644 --- a/meta-oe/recipes-multimedia/live555/live555.inc +++
> b/meta-oe/recipes-multimedia/live555/live555.inc @@ -19,36 +19,36 @@ S =
> "${WORKDIR}/live" TARGET_CC_ARCH += "${LDFLAGS}"
> 
> do_configure() { -	cp ${WORKDIR}/config.linux-cross . -	echo
> "COMPILE_OPTS+=" -fPIC "" >> config.linux-cross -	./genMakefiles
> linux-cross +    cp ${WORKDIR}/config.linux-cross . +    echo
> "COMPILE_OPTS+=" -fPIC "" >> config.linux-cross +    ./genMakefiles
> linux-cross }
> 
> do_compile() { -	make +    make }
> 
> do_install() { -	install -d ${D}${includedir}/BasicUsageEnvironment -
> install -d ${D}${includedir}/groupsock -	install -d
> ${D}${includedir}/liveMedia -	install -d
> ${D}${includedir}/UsageEnvironment -	install -d ${D}${libdir} -	cp -a
> ${S}/BasicUsageEnvironment/include/*.hh
> ${D}${includedir}/BasicUsageEnvironment/ -	cp -a
> ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/ -	cp -a
> ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/ -	cp -a
> ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/ -	cp -a
> ${S}/UsageEnvironment/include/*.hh ${D}${includedir}/UsageEnvironment/ -
> # Find all the headers -	for i in $(find . -name "*.hh") $(find . -name
> "*.h") ; do -		install ${i} ${D}${includedir} -	done -	cp ${S}/*/*.a
> ${D}${libdir} -	install -d ${D}${bindir} -	for i in
> MPEG2TransportStreamIndexer openRTSP playSIP sapWatch
> testMPEG1or2AudioVideoToDarwin testMPEG1or2ProgramToTransportStream
> testMPEG1or2Splitter testMPEG1or2VideoReceiver
> testMPEG2TransportStreamTrickPlay testMPEG4VideoToDarwin
> testOnDemandRTSPServer testRelay testAMRAudioStreamer testDVVideoStreamer
> testMP3Receiver testMP3Streamer testMPEG1or2AudioVideoStreamer
> testMPEG1or2VideoStreamer testMPEG2TransportStreamer
> testMPEG4VideoStreamer testWAVAudioStreamer vobStreamer; do -		install -m
> 0755 ${S}/testProgs/${i} ${D}${bindir}/ -	done -	install -m 0755
> ${S}/mediaServer/live555MediaServer ${D}${bindir}/ +    install -d
> ${D}${includedir}/BasicUsageEnvironment +    install -d
> ${D}${includedir}/groupsock +    install -d ${D}${includedir}/liveMedia +
> install -d ${D}${includedir}/UsageEnvironment +    install -d
> ${D}${libdir} +    cp -a ${S}/BasicUsageEnvironment/include/*.hh
> ${D}${includedir}/BasicUsageEnvironment/ +    cp -a
> ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/ +    cp -a
> ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/ +    cp -a
> ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/ +    cp -a
> ${S}/UsageEnvironment/include/*.hh ${D}${includedir}/UsageEnvironment/ +
> # Find all the headers +    for i in $(find . -name "*.hh") $(find .
> -name "*.h") ; do +        install ${i} ${D}${includedir} +    done +
> cp ${S}/*/*.a ${D}${libdir} +    install -d ${D}${bindir} +    for i in
> MPEG2TransportStreamIndexer openRTSP playSIP sapWatch
> testMPEG1or2AudioVideoToDarwin testMPEG1or2ProgramToTransportStream
> testMPEG1or2Splitter testMPEG1or2VideoReceiver
> testMPEG2TransportStreamTrickPlay testMPEG4VideoToDarwin
> testOnDemandRTSPServer testRelay testAMRAudioStreamer testDVVideoStreamer
> testMP3Receiver testMP3Streamer testMPEG1or2AudioVideoStreamer
> testMPEG1or2VideoStreamer testMPEG2TransportStreamer
> testMPEG4VideoStreamer testWAVAudioStreamer vobStreamer; do +
> install -m 0755 ${S}/testProgs/${i} ${D}${bindir}/ +    done +    install
> -m 0755 ${S}/mediaServer/live555MediaServer ${D}${bindir}/ }
> 
> PACKAGES =+ " live555-openrtsp live555-playsip live555-mediaserver" diff
> --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb
> b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb index
> af5b5ff..efef5d2 100644 ---
> a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb +++
> b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb @@ -6,12 +6,12 @@
> LIC_FILES_CHKSUM =
> "file://COPYING.LESSER;md5=b2b941d484c442e5c031a51463d8e11b" DEPENDS =
> "alsa-lib"
> 
> SRC_URI = "\ -  ${SOURCEFORGE_MIRROR}/mikmod/libmikmod-${PV}.tar.gz \ -
> file://m4.patch \ -  file://autofoo.patch \ -  file://ldflags.patch \ -
> file://CVE-2010-2971.patch \ -  file://obsolete_automake_macros.patch \ +
> ${SOURCEFORGE_MIRROR}/mikmod/libmikmod-${PV}.tar.gz \ +
> file://m4.patch \ +    file://autofoo.patch \ +    file://ldflags.patch
> \ +    file://CVE-2010-2971.patch \ +
> file://obsolete_automake_macros.patch \ "
> 
> SRC_URI[md5sum] = "9f3c740298260d5f88981fc0d51f6f16" @@ -20,13 +20,13 @@
> SRC_URI[sha256sum] =
> "891a2b780306e6ef86e381f459e71a085d4e7f56c970a879d3bf341c01 inherit
> autotools binconfig lib_package
> 
> EXTRA_OECONF = "\ -  --disable-af \ -  --enable-alsa \ -  --disable-esd
> \ -  --enable-oss \ -  --disable-sam9407 \ -  --disable-ultra \ -
> --disable-esdtest \ -  --enable-threads \ +    --disable-af \ +
> --enable-alsa \ +    --disable-esd \ +    --enable-oss \ +
> --disable-sam9407 \ +    --disable-ultra \ +    --disable-esdtest \ +
> --enable-threads \ "
> 
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
> b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb index
> 889bb95..9a42b82 100644 ---
> a/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb +++
> b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb @@ -12,9 +12,9 @@
> SRC_URI = "file://mplayer.conf"
> 
> # Yes, really /usr/etc!!! do_install() { -	install -d
> "${D}/usr${sysconfdir}/mplayer" +    install -d
> "${D}/usr${sysconfdir}/mplayer"
> 
> -	install -m 0644 ${WORKDIR}/mplayer.conf
> "${D}/usr${sysconfdir}/mplayer" +    install -m 0644
> ${WORKDIR}/mplayer.conf "${D}/usr${sysconfdir}/mplayer" }
> 
> FILES_${PN} = "/usr${sysconfdir}/mplayer" diff --git
> a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb index
> 0dfc1ed..fd595ad 100644 ---
> a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb +++
> b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb @@ -4,7 +4,7 @@
> HOMEPAGE = "http://www.mplayerhq.hu/" DEPENDS = "libvpx live555
> libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \ libpng jpeg liba52
> freetype fontconfig alsa-lib lzo ncurses \ libxv virtual/libx11 libass
> speex faad2 \ -	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '',
> 'libmad liba52 lame', d)}" +
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame',
> d)}"
> 
> RDEPENDS_${PN} = "mplayer-common" PROVIDES = "mplayer" @@ -38,95 +38,95
> @@ CONFFILES_${PN} += "/usr/etc/mplayer/input.conf \ inherit autotools
> pkgconfig
> 
> EXTRA_OECONF = " \ -	--prefix=/usr \ -	--mandir=${mandir} \ -
> --target=${SIMPLE_TARGET_SYS} \ -	\ -	--disable-lirc \ -	--disable-lircc
> \ -	--disable-joystick \ -	--disable-vm \ -	--disable-xf86keysym \ -
> --enable-tv \ -	--disable-tv-v4l1 \ -	--enable-tv-v4l2 \ -
> --disable-tv-bsdbt848 \ -	--enable-rtc \ -	--enable-networking \ -
> --disable-smb \ -	--enable-live \ -	--disable-dvdnav \ -	--enable-dvdread
> \ -	--disable-dvdread-internal \ -	--disable-libdvdcss-internal \ -
> --disable-cdparanoia \ -	--enable-freetype \ -	--enable-sortsub \ -
> --disable-fribidi \ -	--disable-enca \ -	--disable-ftp \ -
> --disable-vstream \ -	\ -	--disable-gif \ -	--enable-png \ -
> --enable-jpeg \ -	--disable-libcdio \ -	--disable-qtx \ -	--disable-xanim
> \ -	--disable-real \ -	--disable-xvid \ -	\ -	--enable-speex \ -
> --enable-theora \ -	--disable-ladspa \ -	--disable-libdv \ -	--enable-mad
> \ -	--disable-xmms \ -	--disable-musepack \ -	\ -	--disable-gl \ -
> --disable-vesa \ -	--disable-svga \ -	--enable-sdl \ -	--disable-aa \ -
> --disable-caca \ -	--disable-ggi \ -	--disable-ggiwmh \ -
> --disable-directx \ -	--disable-dxr3 \ -	--disable-dvb \ -	--disable-mga
> \ -	--disable-xmga \ -	--enable-xv \ -	--disable-vm \ -
> --disable-xinerama \ -	--enable-x11 \ -	--enable-fbdev \ -	--disable-3dfx
> \ -	--disable-tdfxfb \ -	--disable-s3fb \ -	--disable-directfb \ -
> --disable-bl \ -	--disable-tdfxvid \ -	--disable-tga \ -	--disable-pnm \ 
> -	--disable-md5sum \ -	\ -	--enable-alsa \ -	--enable-ossaudio \ -
> --disable-arts \ -	--disable-esd \ -	--disable-pulse \ -	--disable-jack
> \ -	--disable-openal \ -	--disable-nas \ -	--disable-sgiaudio \ -
> --disable-sunaudio \ -	--disable-win32waveout \ -	--enable-select \ -
> --enable-libass \ -	\ -	--extra-libs=' -lXext -lX11
> -lBasicUsageEnvironment -lUsageEnvironment -lgroupsock -lliveMedia
> -lstdc++ -lvorbis ' \ +    --prefix=/usr \ +    --mandir=${mandir} \ +
> --target=${SIMPLE_TARGET_SYS} \ +    \ +    --disable-lirc \ +
> --disable-lircc \ +    --disable-joystick \ +    --disable-vm \ +
> --disable-xf86keysym \ +    --enable-tv \ +    --disable-tv-v4l1 \ +
> --enable-tv-v4l2 \ +    --disable-tv-bsdbt848 \ +    --enable-rtc \ +
> --enable-networking \ +    --disable-smb \ +    --enable-live \ +
> --disable-dvdnav \ +    --enable-dvdread \ +
> --disable-dvdread-internal \ +    --disable-libdvdcss-internal \ +
> --disable-cdparanoia \ +    --enable-freetype \ +    --enable-sortsub \ +
> --disable-fribidi \ +    --disable-enca \ +    --disable-ftp \ +
> --disable-vstream \ +    \ +    --disable-gif \ +    --enable-png \ +
> --enable-jpeg \ +    --disable-libcdio \ +    --disable-qtx \ +
> --disable-xanim \ +    --disable-real \ +    --disable-xvid \ +    \ +
> --enable-speex \ +    --enable-theora \ +    --disable-ladspa \ +
> --disable-libdv \ +    --enable-mad \ +    --disable-xmms \ +
> --disable-musepack \ +    \ +    --disable-gl \ +    --disable-vesa \ +
> --disable-svga \ +    --enable-sdl \ +    --disable-aa \ +
> --disable-caca \ +    --disable-ggi \ +    --disable-ggiwmh \ +
> --disable-directx \ +    --disable-dxr3 \ +    --disable-dvb \ +
> --disable-mga \ +    --disable-xmga \ +    --enable-xv \ +
> --disable-vm \ +    --disable-xinerama \ +    --enable-x11 \ +
> --enable-fbdev \ +    --disable-3dfx \ +    --disable-tdfxfb \ +
> --disable-s3fb \ +    --disable-directfb \ +    --disable-bl \ +
> --disable-tdfxvid \ +    --disable-tga \ +    --disable-pnm \ +
> --disable-md5sum \ +    \ +    --enable-alsa \ +    --enable-ossaudio \ +
> --disable-arts \ +    --disable-esd \ +    --disable-pulse \ +
> --disable-jack \ +    --disable-openal \ +    --disable-nas \ +
> --disable-sgiaudio \ +    --disable-sunaudio \ +
> --disable-win32waveout \ +    --enable-select \ +    --enable-libass \ +
> \ +    --extra-libs=' -lXext -lX11 -lBasicUsageEnvironment
> -lUsageEnvironment -lgroupsock -lliveMedia -lstdc++ -lvorbis ' \ "
> 
> EXTRA_OECONF_append_armv6 = " --enable-armv6" @@ -138,25 +138,25 @@
> BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}" CFLAGS_append = "
> -I${S}/libdvdread4 "
> 
> do_configure() { -	sed -i 's|/usr/include|${STAGING_INCDIR}|g'
> ${S}/configure -	sed -i 's|/usr/lib|${STAGING_LIBDIR}|g' ${S}/configure -
> sed -i 's|/usr/\S*include[\w/]*||g' ${S}/configure -	sed -i
> 's|/usr/\S*lib[\w/]*||g' ${S}/configure -	sed -i
> 's|_install_strip="-s"|_install_strip=""|g' ${S}/configure -	sed -i
> 's|HOST_CC|BUILD_CC|' ${S}/Makefile - -	export SIMPLE_TARGET_SYS="$(echo
> ${TARGET_SYS} | sed s:${TARGET_VENDOR}::g)" -	./configure
> ${EXTRA_OECONF} - +    sed -i 's|/usr/include|${STAGING_INCDIR}|g'
> ${S}/configure +    sed -i 's|/usr/lib|${STAGING_LIBDIR}|g'
> ${S}/configure +    sed -i 's|/usr/\S*include[\w/]*||g' ${S}/configure +
> sed -i 's|/usr/\S*lib[\w/]*||g' ${S}/configure +    sed -i
> 's|_install_strip="-s"|_install_strip=""|g' ${S}/configure +    sed -i
> 's|HOST_CC|BUILD_CC|' ${S}/Makefile + +    export
> SIMPLE_TARGET_SYS="$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}::g)" +
> ./configure ${EXTRA_OECONF} + }
> 
> do_compile () { -	oe_runmake +    oe_runmake }
> 
> do_install_append() { -        install -d ${D}/usr/etc/mplayer -
> install ${S}/etc/input.conf ${D}/usr/etc/mplayer/ -        install
> ${S}/etc/example.conf ${D}/usr/etc/mplayer/ -        install
> ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/ +    install -d
> ${D}/usr/etc/mplayer +    install ${S}/etc/input.conf
> ${D}/usr/etc/mplayer/ +    install ${S}/etc/example.conf
> ${D}/usr/etc/mplayer/ +    install ${S}/etc/codecs.conf
> ${D}/usr/etc/mplayer/ } diff --git
> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb index
> ce5c5e1..14b8565 100644 ---
> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb +++
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb @@ -22,10 +22,10
> @@ S = "${WORKDIR}/git" EXTRA_OECONF = "--disable-qv4l2 --enable-shared"
> 
> 
> do_configure() { -	# autotools_do_configure fails with: -	# |
> configure.ac:139: error: required file 'build-aux/config.rpath' not
> found -	autoreconf -vfi -	oe_runconf +    # autotools_do_configure fails
> with: +    # | configure.ac:139: error: required file
> 'build-aux/config.rpath' not found +    autoreconf -vfi +    oe_runconf 
> }
> 
> PACKAGES =+ "rc-keymaps libv4l libv4l-dbg libv4l-dev" diff --git
> a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb index d007bcb..98b5e0e
> 100644 --- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb +++
> b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb @@ -11,8 +11,8 @@ PR =
> "r2" S = "${WORKDIR}/git"
> 
> do_install() { -	install -d ${D}${bindir} -	install -m 0755 yavta
> ${D}${bindir} +    install -d ${D}${bindir} +    install -m 0755 yavta
> ${D}${bindir} }
> 
> 
> diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc
> b/meta-oe/recipes-multimedia/vlc/vlc.inc index 00d8663..3cf0d30 100644 
> --- a/meta-oe/recipes-multimedia/vlc/vlc.inc +++
> b/meta-oe/recipes-multimedia/vlc/vlc.inc @@ -21,65 +21,65 @@ PACKAGES =+
> "libvlc-dbg libvlc-dev libvlc" FILES_libvlc-dev = "${libdir}/lib*.so"
> 
> FILES_libvlc-dbg = "\ -	${libdir}/.debug \ -
> ${libdir}/vlc/meta_engine/.debug \ -	${libdir}/vlc/audio_filter/.debug
> ${libdir}/vlc/audio_output/.debug \ -	${libdir}/vlc/demux/.debug
> ${libdir}/vlc/control/.debug \ -	${libdir}/vlc/gui/.debug
> ${libdir}/vlc/packetizer/.debug \ -	${libdir}/vlc/audio_mixer/.debug
> ${libdir}/vlc/stream_out/.debug \ -	${libdir}/vlc/mux/.debug
> ${libdir}/vlc/access/.debug \ -	${libdir}/vlc/visualization/.debug
> ${libdir}/vlc/access_filter/.debug \ -	${libdir}/vlc/access_output/.debug
> ${libdir}/vlc/video_output/.debug \ -
> ${libdir}/vlc/services_discovery/.debug ${libdir}/vlc/video_chroma/.debug
> \ -	${libdir}/vlc/video_codec/.debug ${libdir}/vlc/video_filter/.debug \ 
> -	${libdir}/vlc/misc/.debug ${libdir}/vlc/codec/.debug \ -	" +
> ${libdir}/.debug \ +    ${libdir}/vlc/meta_engine/.debug \ +
> ${libdir}/vlc/audio_filter/.debug ${libdir}/vlc/audio_output/.debug \ +
> ${libdir}/vlc/demux/.debug ${libdir}/vlc/control/.debug \ +
> ${libdir}/vlc/gui/.debug ${libdir}/vlc/packetizer/.debug \ +
> ${libdir}/vlc/audio_mixer/.debug ${libdir}/vlc/stream_out/.debug \ +
> ${libdir}/vlc/mux/.debug ${libdir}/vlc/access/.debug \ +
> ${libdir}/vlc/visualization/.debug ${libdir}/vlc/access_filter/.debug \ +
> ${libdir}/vlc/access_output/.debug ${libdir}/vlc/video_output/.debug \ +
> ${libdir}/vlc/services_discovery/.debug ${libdir}/vlc/video_chroma/.debug
> \ +    ${libdir}/vlc/video_codec/.debug ${libdir}/vlc/video_filter/.debug
> \ +    ${libdir}/vlc/misc/.debug ${libdir}/vlc/codec/.debug \ +    "
> 
> FILES_libvlc = "${libdir}/lib*.so.*"
> 
> FILES_${PN} += "${bindir}/vlc \ -	${datadir}/applications \ -
> ${datadir}/vlc/ \ -	${datadir}/icons \ -	" +    ${datadir}/applications
> \ +    ${datadir}/vlc/ \ +    ${datadir}/icons \ +    "
> 
> -FILES_${PN}-dbg	+= "${libdir}/vlc/*/.debug
> ${libdir}/vlc/plugins/*/.debug" +FILES_${PN}-dbg    +=
> "${libdir}/vlc/*/.debug ${libdir}/vlc/plugins/*/.debug"
> 
> EXTRA_OECONF = "\ -	--enable-dvdread \ -	--enable-libtool \ -
> --with-contrib \ -	--enable-run-as-root \ -	--disable-wxwidgets \ -
> --enable-x11 --enable-xvideo \ -	--disable-screen --disable-caca \ -
> --enable-httpd --enable-vlm \ -	--enable-freetype \ -	--enable-sdl \ -
> --enable-png \ -	--enable-live555 --enable-tremor \ -	--enable-v4l2
> --enable-v4l --disable-aa --enable-wma --disable-faad \ -	--enable-dbus
> \ -	--disable-hal \ -	--without-contrib \ -	--without-kde-solid \ -
> --disable-opengl --disable-glx \ -	--enable-realrtsp \ -
> ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \ -
> ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}/rcc4 \ -
> ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \ +    --enable-dvdread \ +
> --enable-libtool \ +    --with-contrib \ +    --enable-run-as-root \ +
> --disable-wxwidgets \ +    --enable-x11 --enable-xvideo \ +
> --disable-screen --disable-caca \ +    --enable-httpd --enable-vlm \ +
> --enable-freetype \ +    --enable-sdl \ +    --enable-png \ +
> --enable-live555 --enable-tremor \ +    --enable-v4l2 --enable-v4l
> --disable-aa --enable-wma --disable-faad \ +    --enable-dbus \ +
> --disable-hal \ +    --without-contrib \ +    --without-kde-solid \ +
> --disable-opengl --disable-glx \ +    --enable-realrtsp \ +
> ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \ +
> ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}/rcc4 \ +
> ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \ "
> 
> 
> do_configure() { -	cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/ -
> ./bootstrap -	gnu-configize --force -	libtoolize --force -	#autoreconf
> --force -i -	cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ ||
> true -	oe_runconf -	rm config.log -	sed -i -e
> s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config -	sed -i -e s:'$(MOC)
> $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${S}/include\ -DSYS_LINUX:g
> ${S}/modules/gui/qt4/Makefile +    cp
> ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/ +    ./bootstrap +
> gnu-configize --force +    libtoolize --force +    #autoreconf --force
> -i +    cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true +
> oe_runconf +    rm config.log +    sed -i -e
> s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config +    sed -i -e s:'$(MOC)
> $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${S}/include\ -DSYS_LINUX:g
> ${S}/modules/gui/qt4/Makefile } diff --git
> a/meta-oe/recipes-multimedia/webm/libvpx.inc
> b/meta-oe/recipes-multimedia/webm/libvpx.inc index 31dafb8..4d8ba9d
> 100644 --- a/meta-oe/recipes-multimedia/webm/libvpx.inc +++
> b/meta-oe/recipes-multimedia/webm/libvpx.inc @@ -21,18 +21,18 @@
> VPXTARGET_armv7a = "armv7-linux-gcc" VPXTARGET ?= "generic-gnu"
> 
> CONFIGUREOPTS = " \ -          --target=${VPXTARGET} \ -
> --enable-vp8 \ -          --enable-libs \ -
> --disable-install-docs \ +    --target=${VPXTARGET} \ +    --enable-vp8
> \ +    --enable-libs \ +    --disable-install-docs \ " do_configure() { -
> ${S}/configure ${CONFIGUREOPTS} +    ${S}/configure ${CONFIGUREOPTS} } 
> do_compile() { -	oe_runmake +    oe_runmake } do_install() { -	oe_runmake
> install DESTDIR=${D} +    oe_runmake install DESTDIR=${D} }
> 
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb
> b/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb index 878d5e2..0f453ef
> 100644 --- a/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb +++
> b/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb @@ -13,7 +13,7 @@
> SRC_URI[md5sum] = "4bf2f2c76700202c1fe9201fcb0680e3" SRC_URI[sha256sum] =
> "2e93968afcded113a7e218de047feecf6659a089058803a9e40fb687de5f9bfa"
> 
> CONFIGUREOPTS += " \ -        --prefix=${prefix} \ -
> --libdir=${libdir} \ +    --prefix=${prefix} \ +    --libdir=${libdir} \ 
> "
> 
> diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb
> b/meta-oe/recipes-multimedia/x264/x264_git.bb index 056c25c..439849d
> 100644 --- a/meta-oe/recipes-multimedia/x264/x264_git.bb +++
> b/meta-oe/recipes-multimedia/x264/x264_git.bb @@ -34,7 +34,7 @@
> EXTRA_OECONF = '--prefix=${prefix} \ '
> 
> do_configure() { -	./configure ${EXTRA_OECONF} +    ./configure
> ${EXTRA_OECONF} }
> 
> # Get rid of -e @@ -42,5 +42,5 @@ EXTRA_OEMAKE = "" AS =
> "${TARGET_PREFIX}gcc"
> 
> do_install() { -	oe_runmake install DESTDIR=${D} +    oe_runmake install
> DESTDIR=${D} } diff --git
> a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
> b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb index cc66f24..7720799
> 100644 --- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb +++
> b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb @@ -12,9 +12,9 @@ S =
> "${WORKDIR}/xpext-1.0" inherit autotools pkgconfig
> 
> do_configure_prepend () { -  cd ${S} -  chmod +x ./autogen.sh -
> ./autogen.sh +    cd ${S} +    chmod +x ./autogen.sh +    ./autogen.sh }
> 
> SRC_URI[md5sum] = "1b0cb67b6f2bd7c4abef17648b062896" diff --git
> a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
> b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb index
> 62860b8..ca1a01e 100644 ---
> a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb +++
> b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb @@ -15,9
> +15,9 @@ inherit autotools pkgconfig perlnative gconf PR = "r2"
> 
> do_configure_prepend() { -  if [ -f ${S}/configure.in ] ; then +    if [
> -f ${S}/configure.in ] ; then mv ${S}/configure.in ${S}/configure.ac -
> fi +    fi }
> 
> RRECOMMENDS_${PN} = "gpsd" diff --git
> a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
> b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb index 1228614..99f019b
> 100644 --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb +++
> b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb @@ -10,14 +10,14 @@
> EXTRANATIVEPATH += "chrpath-native" PR = "r6"
> 
> SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \ 
> -  file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \ -
> file://0004-SConstruct-remove-rpath.patch \ -
> file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \ 
> -  file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch
> \ -  file://gpsd-default \ -  file://gpsd \ -  file://60-gpsd.rules \ -
> file://gpsd.service \ +
> file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \ +
> file://0004-SConstruct-remove-rpath.patch \ +
> file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \ 
> +
> file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch \ 
> +    file://gpsd-default \ +    file://gpsd \ +    file://60-gpsd.rules
> \ +    file://gpsd.service \ " SRC_URI[md5sum] =
> "52d9785eaf1a51298bb8900dbde88f98" SRC_URI[sha256sum] =
> "7800c478ee9d7ca7a502b0f892828561b1fbf7bc69d9d38c447c82c3628302ac" @@
> -33,11 +33,11 @@ export STAGING_INCDIR export STAGING_LIBDIR
> 
> EXTRA_OESCONS = " \ -  sysroot=${STAGING_DIR_TARGET} \ -
> libQgpsmm='false' \ -  debug='true' \ -  strip='false' \ -
> systemd='${SYSTEMD_OESCONS}' \ +    sysroot=${STAGING_DIR_TARGET} \ +
> libQgpsmm='false' \ +    debug='true' \ +    strip='false' \ +
> systemd='${SYSTEMD_OESCONS}' \ " # this cannot be used, because then
> chrpath is not found and only static lib is built # target=${HOST_SYS} @@
> -88,11 +88,11 @@ do_install_append() { }
> 
> pkg_postinst_${PN}-conf() { -	update-alternatives --install
> ${sysconfdir}/default/gpsd gpsd-defaults
> ${sysconfdir}/default/gpsd.default 10 +    update-alternatives --install
> ${sysconfdir}/default/gpsd gpsd-defaults
> ${sysconfdir}/default/gpsd.default 10 }
> 
> pkg_postrm_${PN}-conf() { -	update-alternatives --remove gpsd-defaults
> ${sysconfdir}/default/gpsd.default +    update-alternatives --remove
> gpsd-defaults ${sysconfdir}/default/gpsd.default }
> 
> PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev
> gpsd-conf gpsd-gpsctl gps-utils" diff --git
> a/meta-oe/recipes-navigation/navit/navit.inc
> b/meta-oe/recipes-navigation/navit/navit.inc index dc2370b..2194087
> 100644 --- a/meta-oe/recipes-navigation/navit/navit.inc +++
> b/meta-oe/recipes-navigation/navit/navit.inc @@ -18,14 +18,14 @@ INC_PR =
> "r9" inherit autotools gettext
> 
> EXTRA_OECONF += " \ -  --disable-binding-python \ -  --disable-samplemap
> \ -  --enable-avoid-unaligned \ -  --enable-graphics-qt-qpainter \ -
> --enable-gui-qml \ -  --enable-svg2png-scaling-flag=32 \ -
> --disable-speech-speech-dispatcher \ -  --enable-cache-size=20971520 \ +
> --disable-binding-python \ +    --disable-samplemap \ +
> --enable-avoid-unaligned \ +    --enable-graphics-qt-qpainter \ +
> --enable-gui-qml \ +    --enable-svg2png-scaling-flag=32 \ +
> --disable-speech-speech-dispatcher \ +    --enable-cache-size=20971520 \ 
> "
> 
> #  --enable-avoid-float \ @@ -38,12 +38,12 @@ PACKAGES =+ "${PN}-maptool
> ${PN}-config ${PN}-dbus ${PN}-speech-cmdline ${PN}-sp EXTRA_AUTORECONF =
> " -I m4"
> 
> CONFFILES_${PN}-config += "${datadir}/navit/navit.default.xml \ -
> ${datadir}/navit/navit.xml \ -
> ${datadir}/navit/maps.xml \ -                    ${datadir}/navit/osd.xml
> \ -                    ${datadir}/navit/speech.xml \ -
> ${datadir}/navit/plugins.xml \ -                   " +
> ${datadir}/navit/navit.xml \ +    ${datadir}/navit/maps.xml \ +
> ${datadir}/navit/osd.xml \ +    ${datadir}/navit/speech.xml \ +
> ${datadir}/navit/plugins.xml \ +       "
> 
> SRC_URI += "file://navit.xml \ file://maps.xml \ @@ -68,21 +68,21 @@
> FILES_${PN}-graphics-gtk = "
> ${libdir}/${PN}/graphics/libgraphics_gtk_drawing_ar FILES_${PN}-icons =
> "/usr/share/navit/xpm/"
> 
> do_configure_prepend() { -  # MOC=`$PKG_CONFIG QtGui
> --variable=moc_location` returns only /usr/bin/moc4 which is not
> available on hosts without Qt -  sed -i
> "s#MOC=#MOC=${STAGING_DIR_NATIVE}#g" ${S}/configure.in +    #
> MOC=`$PKG_CONFIG QtGui --variable=moc_location` returns only
> /usr/bin/moc4 which is not available on hosts without Qt +    sed -i
> "s#MOC=#MOC=${STAGING_DIR_NATIVE}#g" ${S}/configure.in }
> 
> do_install_append() { -	# fix QA issue -	sed -i
> 's#Categories=GTK;Utility;Geography;#Categories=Graphics;#g'
> ${D}${datadir}/applications/navit.desktop +    # fix QA issue +    sed -i
> 's#Categories=GTK;Utility;Geography;#Categories=Graphics;#g'
> ${D}${datadir}/applications/navit.desktop
> 
> -	rm ${D}${libdir}/${PN}/*/*.la +    rm ${D}${libdir}/${PN}/*/*.la
> 
> -        #Use split config -        mv ${D}${datadir}/navit/navit.xml
> ${D}${datadir}/navit/navit.default.xml -        install -m 0644
> ${WORKDIR}/navit.xml ${D}${datadir}/navit/navit.xml -        install -m
> 0644 ${WORKDIR}/maps.xml ${D}${datadir}/navit/maps.xml -        install
> -m 0644 ${WORKDIR}/osd.xml ${D}${datadir}/navit/osd.xml -        install
> -m 0644 ${WORKDIR}/speech.xml ${D}${datadir}/navit/speech.xml -
> install -m 0644 ${WORKDIR}/plugins.xml ${D}${datadir}/navit/plugins.xml +
> #Use split config +    mv ${D}${datadir}/navit/navit.xml
> ${D}${datadir}/navit/navit.default.xml +    install -m 0644
> ${WORKDIR}/navit.xml ${D}${datadir}/navit/navit.xml +    install -m 0644
> ${WORKDIR}/maps.xml ${D}${datadir}/navit/maps.xml +    install -m 0644
> ${WORKDIR}/osd.xml ${D}${datadir}/navit/osd.xml +    install -m 0644
> ${WORKDIR}/speech.xml ${D}${datadir}/navit/speech.xml +    install -m
> 0644 ${WORKDIR}/plugins.xml ${D}${datadir}/navit/plugins.xml } diff --git
> a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
> b/meta-oe/recipes-navigation/omgps/omgps_svn.bb index 7c787a4..e1c1a71
> 100644 --- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb +++
> b/meta-oe/recipes-navigation/omgps/omgps_svn.bb @@ -10,8 +10,8 @@ PR =
> "r2" S = "${WORKDIR}/${PN}"
> 
> do_configure_prepend() { -   sed -i "s#PY_VERSION = 2.6#PY_VERSION =
> ${PYTHON_BASEVERSION}#g" ${S}/Makefile.am -   sed -i "s#PY_INC_DIR =
> \$(OPIEDIR)#PY_INC_DIR = ${STAGING_DIR_HOST}#g" ${S}/Makefile.am +    sed
> -i "s#PY_VERSION = 2.6#PY_VERSION = ${PYTHON_BASEVERSION}#g"
> ${S}/Makefile.am +    sed -i "s#PY_INC_DIR = \$(OPIEDIR)#PY_INC_DIR =
> ${STAGING_DIR_HOST}#g" ${S}/Makefile.am }
> 
> SRC_URI =
> "svn://omgps.googlecode.com/svn/trunk;module=omgps;protocol=http \ diff
> --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
> b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb index c216f29..5c08057
> 100644 --- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb +++
> b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb @@ -18,8 +18,8 @@
> SRC_URI[sha256sum] =
> "645166a5e05b2064ab630534a514697fc47b681951e7fe1d635c259cbd S =
> "${WORKDIR}/${PN}"
> 
> do_configure_prepend() { -  # fix DSO issue with binutils-2.22 -  sed -i
> 's/ -lrt/ -lrt -lm/g' ${S}/Makefile.am +    # fix DSO issue with
> binutils-2.22 +    sed -i 's/ -lrt/ -lrt -lm/g' ${S}/Makefile.am } 
> do_install_append() { install -d ${D}${datadir}/orrery diff --git
> a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
> b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb index
> 9d590fd..c31261a 100644 ---
> a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb +++
> b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb @@ -12,7 +12,7 @@ PR
> = "r0" inherit qt4x11 pkgconfig
> 
> SRC_URI = " \ -  http://hqh.unlink.org/harmattan/fingerterm-${PV}.tar.gz
> \ +    http://hqh.unlink.org/harmattan/fingerterm-${PV}.tar.gz \ "
> 
> SRC_URI[md5sum] = "d53b0f463c025583cd52accf95715448" @@ -21,24 +21,24 @@
> SRC_URI[sha256sum] =
> "c21a07cc411d09739bd7fa248eba2bf96427b3f032382a044b6674dd82 S =
> "${WORKDIR}/${PN}"
> 
> FILES_${PN} = " \ -  ${bindir}/${PN} \ -
> ${datadir}/applications/${PN}.desktop \ -  ${datadir}/pixmaps/${PN}.png
> \ +    ${bindir}/${PN} \ +    ${datadir}/applications/${PN}.desktop \ +
> ${datadir}/pixmaps/${PN}.png \ "
> 
> do_install() { -  install -d ${D}${bindir} -  install -m 0744 ${S}/${PN}
> ${D}${bindir} +    install -d ${D}${bindir} +    install -m 0744
> ${S}/${PN} ${D}${bindir}
> 
> -  sed -i -e '/Exec.*/d' fingerterm.desktop -  sed -i -e '/Icon.*/d'
> fingerterm.desktop +    sed -i -e '/Exec.*/d' fingerterm.desktop +    sed
> -i -e '/Icon.*/d' fingerterm.desktop
> 
> -  echo 'Exec=${bindir}/${PN}' >> fingerterm.desktop -  echo 'Icon=${PN}'
> >> fingerterm.desktop +    echo 'Exec=${bindir}/${PN}' >>
> fingerterm.desktop +    echo 'Icon=${PN}' >> fingerterm.desktop
> 
> -  install -d ${D}${datadir}/applications -  install -m 0644
> ${S}/${PN}.desktop ${D}${datadir}/applications +    install -d
> ${D}${datadir}/applications +    install -m 0644 ${S}/${PN}.desktop
> ${D}${datadir}/applications
> 
> -  install -d ${D}${datadir}/pixmaps -  install -m 0644 ${S}/${PN}.png
> ${D}${datadir}/pixmaps +    install -d ${D}${datadir}/pixmaps +
> install -m 0644 ${S}/${PN}.png ${D}${datadir}/pixmaps } diff --git
> a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb
> b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb index
> d15d8d7..50c149f 100644 ---
> a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb +++
> b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_0.4.0.bb @@ -22,8 +22,8
> @@ BRANCH = "master" SRCREV = "3af5bd38d82255942f582398160a5d3354346ca3"
> 
> SRC_URI = " \ -  git://github.com/nemomobile/${PN}.git;branch=${BRANCH}
> \ -
> file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \ 
> +    git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \ +
> file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \ 
> "
> 
> S = "${WORKDIR}/git" @@ -33,37 +33,37 @@ QT_IMPORTS_DIR =
> "${libdir}/qt4/imports" PLUGINS_TARGET =
> "${QT_IMPORTS_DIR}/MeeGo/Connman"
> 
> EXTRA_QMAKEVARS_PRE = " \ -  CONFIG+=notest \ +    CONFIG+=notest \ "
> 
> do_configure_prepend() { -  # Hack *.pro variables -  find
> ${S}/plugin/*.pro -exec sed -i -e
> 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';' +    # Hack
> *.pro variables +    find ${S}/plugin/*.pro -exec sed -i -e
> 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';' }
> 
> do_install() { -  export INSTALL_ROOT=${D} -  oe_runmake install +
> export INSTALL_ROOT=${D} +    oe_runmake install }
> 
> FILES_${PN} = " \ -  ${libdir}/libconnman-qt4${SOLIBS} \ +
> ${libdir}/libconnman-qt4${SOLIBS} \ "
> 
> FILES_${PN}-dev = " \ -  ${includedir}/connman-qt/* \ -
> ${libdir}/libconnman-qt4${SOLIBSDEV} \ -  ${libdir}/libconnman-qt4.prl \ 
> -  ${libdir}/pkgconfig/connman-qt4.pc \ -  ${libdir}/connman-qt4.pc \ +
> ${includedir}/connman-qt/* \ +    ${libdir}/libconnman-qt4${SOLIBSDEV} \ 
> +    ${libdir}/libconnman-qt4.prl \ +
> ${libdir}/pkgconfig/connman-qt4.pc \ +    ${libdir}/connman-qt4.pc \ "
> 
> FILES_${PN}-plugin = " \ -  ${PLUGINS_TARGET}/qmldir \ -
> ${PLUGINS_TARGET}/lib*.so \ +    ${PLUGINS_TARGET}/qmldir \ +
> ${PLUGINS_TARGET}/lib*.so \ "
> 
> FILES_${PN}-plugin-dbg = " \ -  ${PLUGINS_TARGET}/.debug \ -
> ${PLUGINS_TARGET}/.debug/* \ +    ${PLUGINS_TARGET}/.debug \ +
> ${PLUGINS_TARGET}/.debug/* \ " diff --git
> a/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb
> b/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb index
> aed190c..9bba750 100644 ---
> a/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb +++
> b/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb @@ -16,13
> +16,13 @@ S = "${WORKDIR}/qcanobserver/DeviceLib/linux/SocketCAN" 
> CXXFLAGS += " -DPF_CAN=29  -DAF_CAN=PF_CAN"
> 
> do_configure_prepend() { -	sed -i
> s:/usr/include/qwt5/:${STAGING_INCDIR}:g *.pro +    sed -i
> s:/usr/include/qwt5/:${STAGING_INCDIR}:g *.pro }
> 
> do_install() { -	install -d ${D}${datadir}/qcanobserver/lib +    install
> -d ${D}${datadir}/qcanobserver/lib
> 
> -	install -m 0755 ${S}/lib* ${D}${datadir}/qcanobserver/lib/ +    install
> -m 0755 ${S}/lib* ${D}${datadir}/qcanobserver/lib/ }
> 
> FILES_${PN} += "${datadir}/qcanobserver/lib" diff --git
> a/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb
> b/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb index
> 3d79fdc..ef866b4 100644 ---
> a/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb +++
> b/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb @@ -19,23 +19,23 @@
> S = "${WORKDIR}/qcanobserver/" CXXFLAGS += " -DPF_CAN=29
> -DAF_CAN=PF_CAN"
> 
> do_configure_prepend() { -	sed -i -e
> s:/usr/include/qwt5/:${STAGING_INCDIR}:g -e
> 's:-L/usr/lib/:-L${STAGING_DIR_TARGET}/lib -ldl:g' *.pro +    sed -i -e
> s:/usr/include/qwt5/:${STAGING_INCDIR}:g -e
> 's:-L/usr/lib/:-L${STAGING_DIR_TARGET}/lib -ldl:g' *.pro }
> 
> do_configure_append() { -	sed -i -e s:-L/usr/lib::g Makefile +    sed -i
> -e s:-L/usr/lib::g Makefile }
> 
> do_install() { -	install -d ${D}${datadir}/qcanobserver -	install -d
> ${D}${datadir}/qcanobserver/cfg -	install -d
> ${D}${datadir}/qcanobserver/lib -	install -d
> ${D}${datadir}/qcanobserver/db +    install -d
> ${D}${datadir}/qcanobserver +    install -d
> ${D}${datadir}/qcanobserver/cfg +    install -d
> ${D}${datadir}/qcanobserver/lib +    install -d
> ${D}${datadir}/qcanobserver/db
> 
> -	install -m 0755 ${S}/QCanObserver ${D}${datadir}/qcanobserver +
> install -m 0755 ${S}/QCanObserver ${D}${datadir}/qcanobserver
> 
> -	install -m 0644 ${WORKDIR}/candemo.xml ${D}${datadir}/qcanobserver/db -
> install -m 0644 ${S}/db/*.xml ${D}${datadir}/qcanobserver/db +    install
> -m 0644 ${WORKDIR}/candemo.xml ${D}${datadir}/qcanobserver/db +
> install -m 0644 ${S}/db/*.xml ${D}${datadir}/qcanobserver/db }
> 
> FILES_${PN}-dbg += "${datadir}/qcanobserver/.debug" diff --git
> a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
> b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb index
> da65215..617319a 100644 ---
> a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb +++
> b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb @@ -15,7
> +15,7 @@ inherit qt4x11 pkgconfig DEPENDS = "udev"
> 
> SRC_URI = " \ -
> http://qextserialport.googlecode.com/files/qextserialport-${REAL_PV}.zip
> \ +
> http://qextserialport.googlecode.com/files/qextserialport-${REAL_PV}.zip
> \ "
> 
> SRC_URI[md5sum] = "ffa061edb9f64666468d18402eee6108" @@ -26,30 +26,30 @@
> S = "${WORKDIR}/qextserialport-${REAL_PV}" FILES_${PN} =
> "${libdir}/libqextserialport${SOLIBS}"
> 
> FILES_${PN}-dev = " \ -  ${libdir}/libqextserialport${SOLIBSDEV} \ -
> ${libdir}/libqextserialport.prl \ -  ${includedir}/QtExtSerialPort/*.h \ 
> -  ${datadir}/qt4/mkspecs/features/extserialport.prf \ +
> ${libdir}/libqextserialport${SOLIBSDEV} \ +
> ${libdir}/libqextserialport.prl \ +    ${includedir}/QtExtSerialPort/*.h
> \ +    ${datadir}/qt4/mkspecs/features/extserialport.prf \ "
> 
> FILES_${PN}-dbg += " \ -  ${libdir}/.debug/libqextserialport.so* \ +
> ${libdir}/.debug/libqextserialport.so* \ "
> 
> do_configure_prepend() { -  # based on the documentation, this line make
> sure we use udev in linux -  cd ${S} && echo "linux*:CONFIG +=
> qesp_linux_udev" > .qmake.cache +    # based on the documentation, this
> line make sure we use udev in linux +    cd ${S} && echo "linux*:CONFIG
> += qesp_linux_udev" > .qmake.cache
> 
> -  # Hacking hardcoded qmake variables -  find *.pro -exec sed -i -e
> 's,$$\[QT_INSTALL_HEADERS\],${includedir},g' '{}' ';' -  find *.pro -exec
> sed -i -e 's,$$\[QT_INSTALL_LIBS\],${libdir},g' '{}' ';' -  find *.pro
> -exec sed -i -e 's,$$\[QMAKE_MKSPECS\],${datadir}/qt4/mkspecs/,g' '{}'
> ';' +    # Hacking hardcoded qmake variables +    find *.pro -exec sed -i
> -e 's,$$\[QT_INSTALL_HEADERS\],${includedir},g' '{}' ';' +    find *.pro
> -exec sed -i -e 's,$$\[QT_INSTALL_LIBS\],${libdir},g' '{}' ';' +    find
> *.pro -exec sed -i -e 's,$$\[QMAKE_MKSPECS\],${datadir}/qt4/mkspecs/,g'
> '{}' ';' }
> 
> do_install() { -  export INSTALL_ROOT=${D} -  oe_runmake install +
> export INSTALL_ROOT=${D} +    oe_runmake install
> 
> -  # This is necessary to make it work with the qt based SDK -  cd
> ${D}/${datadir}/qt4/mkspecs/features && sed -i -e
> "s|${STAGING_INCDIR_NATIVE}/qt4|\$(OE_QMAKE_INCDIR_QT)/..|"
> ./extserialport.prf +    # This is necessary to make it work with the qt
> based SDK +    cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e
> "s|${STAGING_INCDIR_NATIVE}/qt4|\$(OE_QMAKE_INCDIR_QT)/..|"
> ./extserialport.prf } diff --git
> a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
> b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb index
> 318d6c9..9abc6b8 100644 ---
> a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb +++
> b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb @@ -20,22 +20,22 @@
> do_configure_append() { # FIXME: maemo builds may want --enable-maemo #
> FIXME: some platforms may want --enable-generic-umpc EXTRA_OECONF = " \ -
> --disable-aspell-test \ -        --enable-aspell \ -
> --disable-manual \ -        --disable-crash-dialog \ -
> --disable-jpilot \ -        --disable-trayicon-plugin \ -
> --disable-spamassassin-plugin \ -        --disable-bogofilter-plugin \ -
> --disable-pgpcore-plugin \ -        --disable-pgpmime-plugin \ -
> --disable-pgpinline-plugin \ -        --disable-dillo-viewer-plugin \ -
> --disable-clamav-plugin \ -        --disable-gnomeprint \ -
> --disable-valgrind \ -        " +    --disable-aspell-test \ +
> --enable-aspell \ +    --disable-manual \ +    --disable-crash-dialog \ +
> --disable-jpilot \ +    --disable-trayicon-plugin \ +
> --disable-spamassassin-plugin \ +    --disable-bogofilter-plugin \ +
> --disable-pgpcore-plugin \ +    --disable-pgpmime-plugin \ +
> --disable-pgpinline-plugin \ +    --disable-dillo-viewer-plugin \ +
> --disable-clamav-plugin \ +    --disable-gnomeprint \ +
> --disable-valgrind \ +    "
> 
> # Remove enchant references: do_install_prepend() { diff --git
> a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
> b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb index
> f42d0da..1ca25ab 100644 ---
> a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb +++
> b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb @@ -8,7 +8,7 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4
> \ PR = "r2"
> 
> SRC_URI = "http://sylpheed.sraoss.jp/sylpheed/v2.7/sylpheed-${PV}.tar.bz2
> \ -  file://glib-2.32.patch \ +    file://glib-2.32.patch \ " 
> SRC_URI[md5sum] = "1f470525c1fbe53253813a0978c18228" SRC_URI[sha256sum] =
> "8bb6457db4e2eea1877b487d9ac8513546372db9a6a2e4271d11229f4af84e23" diff
> --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
> b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb index
> bd11f0d..5ab92fc 100644 ---
> a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb +++
> b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb @@ -15,25 +15,25 @@
> EXTRA_OECONF = "--enable-usb \ --with-distname=${DISTRO}"
> 
> do_configure() { -	export topdir=${S} -	cp -a ${S}/autoconf/configure.in
> ${S} +    export topdir=${S} +    cp -a ${S}/autoconf/configure.in ${S}
> 
> -	if ! [ -d ${S}/platforms/${DISTRO} ] ; then -		cp -a
> ${S}/platforms/unknown ${S}/platforms/${DISTRO} -	fi +    if ! [ -d
> ${S}/platforms/${DISTRO} ] ; then +        cp -a ${S}/platforms/unknown
> ${S}/platforms/${DISTRO} +    fi
> 
> -	gnu-configize --force -	# install --help says '-c' is an ignored
> option, but it turns out that the argument to -c isn't ignored, so drop
> the complete '-c path/to/strip' line -	sed -i -e 's:$(INSTALL_PROGRAM)
> $(STRIP):$(INSTALL_PROGRAM):g' ${S}/autoconf/targets.mak -	# Searching in
> host dirs triggers the QA checks -	sed -i -e 's:-I/usr/local/include::g'
> -e 's:-L/usr/local/lib64::g' -e 's:-L/usr/local/lib::g' ${S}/configure +
> gnu-configize --force +    # install --help says '-c' is an ignored
> option, but it turns out that the argument to -c isn't ignored, so drop
> the complete '-c path/to/strip' line +    sed -i -e 's:$(INSTALL_PROGRAM)
> $(STRIP):$(INSTALL_PROGRAM):g' ${S}/autoconf/targets.mak +    # Searching
> in host dirs triggers the QA checks +    sed -i -e
> 's:-I/usr/local/include::g' -e 's:-L/usr/local/lib64::g' -e
> 's:-L/usr/local/lib::g' ${S}/configure
> 
> -	# m4 macros are missing, using autotools_do_configure leads to linking
> errors with gethostname_re -	oe_runconf +    # m4 macros are missing,
> using autotools_do_configure leads to linking errors with gethostname_re 
> +    oe_runconf }
> 
> do_install_append() { -	rm ${D}${datadir}/hal -rf +    rm
> ${D}${datadir}/hal -rf }
> 
> 
> diff --git
> a/meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb
> b/meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb
>
> 
index 8e344fd..171d6a0 100644
> ---
> a/meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb
>
> 
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb
> @@ -1,12 +1,12 @@ require ca-certificates-${PV}.inc
> 
> do_install() { -        install -d ${D}${bindir_crossscripts} -
> install -m755 ${S}/sbin/update-ca-certificates
> ${D}${bindir_crossscripts} +    install -d ${D}${bindir_crossscripts} +
> install -m755 ${S}/sbin/update-ca-certificates
> ${D}${bindir_crossscripts} }
> 
> SYSROOT_PREPROCESS_FUNCS += "ca_certificates_sysroot_preprocess"
> 
> ca_certificates_sysroot_preprocess() { -        sysroot_stage_dir
> ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts} +
> sysroot_stage_dir ${D}${bindir_crossscripts}
> ${SYSROOT_DESTDIR}${bindir_crossscripts} } diff --git
> a/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb
> b/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb 
> index a1eb1c4..504190f 100644 ---
> a/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb +++
> b/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb @@
> -5,22 +5,22 @@ require ca-certificates-${PV}.inc inherit autotools
> 
> do_install_prepend() { -        mkdir -p ${D}/usr/share/ca-certificates -
> mkdir -p ${D}/usr/sbin -        mkdir -p ${D}/etc/ssl/certs -
> mkdir -p ${D}/etc/ca-certificates/update.d +    mkdir -p
> ${D}/usr/share/ca-certificates +    mkdir -p ${D}/usr/sbin +    mkdir -p
> ${D}/etc/ssl/certs +    mkdir -p ${D}/etc/ca-certificates/update.d }
> 
> do_install_append() { -        cd ${D}/usr/share/ca-certificates -
> echo "# Lines starting with # will be ignored" >
> ${D}/etc/ca-certificates.conf -        echo "# Lines starting with ! will
> remove certificate on next update" >> ${D}/etc/ca-certificates.conf -
> echo "#" >> ${D}/etc/ca-certificates.conf -        for crt in $(find .
> -type f -name '*.crt' -print) -        do -                crt=$(echo
> $crt | sed -e 's/\.\///') -                echo $crt >>
> ${D}/etc/ca-certificates.conf -        done +    cd
> ${D}/usr/share/ca-certificates +    echo "# Lines starting with # will be
> ignored" > ${D}/etc/ca-certificates.conf +    echo "# Lines starting with
> ! will remove certificate on next update" >>
> ${D}/etc/ca-certificates.conf +    echo "#" >>
> ${D}/etc/ca-certificates.conf +    for crt in $(find . -type f -name
> '*.crt' -print) +    do +        crt=$(echo $crt | sed -e 's/\.\///') +
> echo $crt >> ${D}/etc/ca-certificates.conf +    done }
> 
> pkg_postinst_${PN} () { diff --git
> a/meta-oe/recipes-support/ckermit/ckermit_301.bb
> b/meta-oe/recipes-support/ckermit/ckermit_301.bb index 4074cf0..c46369f
> 100644 --- a/meta-oe/recipes-support/ckermit/ckermit_301.bb +++
> b/meta-oe/recipes-support/ckermit/ckermit_301.bb @@ -23,35 +23,35 @@
> CKERMIT_ADDITIONAL_libc-uclibc = "-DNOARROWKEYS" TARGET_CC_ARCH +=
> "${LDFLAGS}"
> 
> do_compile () { -	# The original makefile doesn't differentiate between
> CC and CC_FOR_BUILD, -	# so we build wart manually. Note that you need a
> ckwart.o with the proper -	# timestamp to make this hack work: -
> ${BUILD_CC} -c ckwart.c -	${BUILD_CC} -o wart ckwart.o -	./wart ckcpro.w
> ckcpro.c +    # The original makefile doesn't differentiate between CC
> and CC_FOR_BUILD, +    # so we build wart manually. Note that you need a
> ckwart.o with the proper +    # timestamp to make this hack work: +
> ${BUILD_CC} -c ckwart.c +    ${BUILD_CC} -o wart ckwart.o +    ./wart
> ckcpro.w ckcpro.c
> 
> -	# read ${S}/ckccfg.txt to understand this :-) -	oe_runmake wermit
> CFLAGS="${CFLAGS} -DLINUX -DCK_POSIX_SIG \ -		-DNOTCPOPTS -DLINUXFSSTND
> -DNOCOTFMC -DPOSIX -DUSE_STRERROR \ -		-DNOSYSLOG -DHAVE_PTMX
> -DNO_DNS_SRV -DNOGFTIMER \ -		-DNOB_50 -DNOB_75 -DNOB_134 -DNOB_150
> -DNOB_200 \ -		-DNOB_1800 -DNOB_3600 -DNOB_7200 -DNOB_76K -DNOB_230K \ -
> -DNOB_460K -DNOB_921K \ -		-DNOCSETS -DNONET -DNOUNICODE -DNOHELP
> -DNODEBUG \ -		-DNOFRILLS -DNOFTP -DNODIAL -DNOPUSH -DNOIKSD -DNOHTTP
> -DNOFLOAT \ -		-DNOSERVER -DNOSEXP -DNORLOGIN -DNOOLDMODEMS -DNOSSH
> -DNOLISTEN \ -		-DNORESEND -DNOAUTODL -DNOSTREAMING -DNOHINTS -DNOCKXYZ
> -DNOLEARN \ -		-DNOMKDIR -DNOPERMS -DNOCKTIMERS -DNOCKREGEX -DNOREALPATH
> \ -		-DCK_SMALL -DNOLOGDIAL -DNORENAME -DNOWHATAMI \ -
> ${CKERMIT_ADDITIONAL}" +    # read ${S}/ckccfg.txt to understand this
> :-) +    oe_runmake wermit CFLAGS="${CFLAGS} -DLINUX -DCK_POSIX_SIG \ +
> -DNOTCPOPTS -DLINUXFSSTND -DNOCOTFMC -DPOSIX -DUSE_STRERROR \ +
> -DNOSYSLOG -DHAVE_PTMX -DNO_DNS_SRV -DNOGFTIMER \ +        -DNOB_50
> -DNOB_75 -DNOB_134 -DNOB_150 -DNOB_200 \ +        -DNOB_1800 -DNOB_3600
> -DNOB_7200 -DNOB_76K -DNOB_230K \ +        -DNOB_460K -DNOB_921K \ +
> -DNOCSETS -DNONET -DNOUNICODE -DNOHELP -DNODEBUG \ +        -DNOFRILLS
> -DNOFTP -DNODIAL -DNOPUSH -DNOIKSD -DNOHTTP -DNOFLOAT \ +
> -DNOSERVER -DNOSEXP -DNORLOGIN -DNOOLDMODEMS -DNOSSH -DNOLISTEN \ +
> -DNORESEND -DNOAUTODL -DNOSTREAMING -DNOHINTS -DNOCKXYZ -DNOLEARN \ +
> -DNOMKDIR -DNOPERMS -DNOCKTIMERS -DNOCKREGEX -DNOREALPATH \ +
> -DCK_SMALL -DNOLOGDIAL -DNORENAME -DNOWHATAMI \ +
> ${CKERMIT_ADDITIONAL}" }
> 
> do_install () { -	install -d ${D}${BINDIR} ${D}${MANDIR} ${D}${INFODIR} -
> oe_runmake 'DESTDIR=${D}' install -	# Fix up dangling symlink -	rm
> ${D}${BINDIR}/kermit-sshsub -	(cd ${D}${BINDIR} && ln -s ${BINDIR}/kermit
> kermit-sshusb) +    install -d ${D}${BINDIR} ${D}${MANDIR}
> ${D}${INFODIR} +    oe_runmake 'DESTDIR=${D}' install +    # Fix up
> dangling symlink +    rm ${D}${BINDIR}/kermit-sshsub +    (cd
> ${D}${BINDIR} && ln -s ${BINDIR}/kermit kermit-sshusb) }
> 
> SRC_URI[md5sum] = "59e80f909edf305933af8e0348dcc5d7" diff --git
> a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb index
> 809a8a2..1c872f0 100644 ---
> a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb +++
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb @@ -23,10
> +23,10 @@ TARGET_CC_ARCH += "${LDFLAGS}" EXTRA_OEMAKE = "V=1
> CROSS=${TARGET_PREFIX} LIBTOOL='${HOST_SYS}-libtool --tag cc'
> STRIPCMD=echo"
> 
> do_compile() { -        oe_runmake +    oe_runmake }
> 
> do_install() { -        oe_runmake -e install DESTDIR=${D} +
> oe_runmake -e install DESTDIR=${D} }
> 
> diff --git a/meta-oe/recipes-support/cramfs/cramfs_1.1.bb
> b/meta-oe/recipes-support/cramfs/cramfs_1.1.bb index aa397a9..14d9754
> 100644 --- a/meta-oe/recipes-support/cramfs/cramfs_1.1.bb +++
> b/meta-oe/recipes-support/cramfs/cramfs_1.1.bb @@ -17,13 +17,13 @@
> EXTRA_OEMAKE = "\ "
> 
> do_compile_prepend() { -        ln -sf GNUmakefile Makefile +    ln -sf
> GNUmakefile Makefile }
> 
> do_install() { -	install -d ${D}${bindir} -	install mkcramfs
> ${D}${bindir} -	install cramfsck ${D}${bindir} +    install -d
> ${D}${bindir} +    install mkcramfs ${D}${bindir} +    install cramfsck
> ${D}${bindir} }
> 
> BBCLASSEXTEND = "native" diff --git
> a/meta-oe/recipes-support/debianutils/debianutils_2.30.bb
> b/meta-oe/recipes-support/debianutils/debianutils_2.30.bb index
> 0a532e9..e6c03eb 100644 ---
> a/meta-oe/recipes-support/debianutils/debianutils_2.30.bb +++
> b/meta-oe/recipes-support/debianutils/debianutils_2.30.bb @@ -10,7 +10,7
> @@ SRC_URI[sha256sum] =
> "d62e98fee5b1a758d83b62eed8d8bdec473677ff782fed89fc4ae3ba3f inherit
> autotools
> 
> do_configure_prepend() { -	sed -i -e 's:tempfile.1 which.1:which.1:g'
> Makefile.am +    sed -i -e 's:tempfile.1 which.1:which.1:g' Makefile.am 
> }
> 
> do_install_append() { @@ -30,11 +30,9 @@ pkg_prerm_${PN} () { if [ "x$D"
> != "x" ]; then echo "can't do u-a offline" ; exit 1 else - for app in
> add-shell  installkernel  mkboot  remove-shell run-parts  savelog
> sensible-browser  sensible-editor  sensible-pager  tempfile  which ; do 
> update-alternatives --remove $app $app.${PN} done - fi }
> 
> @@ -42,7 +40,6 @@ pkg_postinst_${PN} () { if [ "x$D" != "x" ]; then echo
> "can't do u-a offline" ; exit 1 else - for app in add-shell
> installkernel  mkboot  remove-shell ; do update-alternatives --install
> ${sbindir}/$app $app $app.${PN} 100 done @@ -54,7 +51,6 @@ else for app
> in run-parts  tempfile ; do update-alternatives --install
> ${base_bindir}/$app $app $app.${PN} 100 done - fi }
> 
> diff --git a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
> b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb index
> 069a598..70d7471 100644 ---
> a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb +++
> b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb @@ -15,9 +15,9
> @@ inherit autotools pkgconfig EXTRA_OECONF = " --with-backend=linux"
> 
> do_configure_prepend() { -	sed -i -e s:-nonet:\:g
> ${S}/doc/man/Makefile.am -	sed -i -e 's: doc : :g' ${S}/Makefile.am -} +
> sed -i -e s:-nonet:\:g ${S}/doc/man/Makefile.am +    sed -i -e 's: doc :
> :g' ${S}/Makefile.am +}
> 
> FILES_${PN} += "${datadir}/dbus-1/ \ ${datadir}/polkit-1/ \ diff --git
> a/meta-oe/recipes-support/devmem2/devmem2.bb
> b/meta-oe/recipes-support/devmem2/devmem2.bb index b99752d..0b45412
> 100644 --- a/meta-oe/recipes-support/devmem2/devmem2.bb +++
> b/meta-oe/recipes-support/devmem2/devmem2.bb @@ -10,12 +10,12 @@ S =
> "${WORKDIR}" CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
> 
> do_compile() { -	${CC} -o devmem2 devmem2.c ${CFLAGS} ${LDFLAGS} +
> ${CC} -o devmem2 devmem2.c ${CFLAGS} ${LDFLAGS} }
> 
> do_install() { -	install -d ${D}${bindir} -	install devmem2
> ${D}${bindir} +    install -d ${D}${bindir} +    install devmem2
> ${D}${bindir} }
> 
> SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d" diff --git
> a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.4.bb
> b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.4.bb index
> 4a830a3..ce6e566 100644 ---
> a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.4.bb +++
> b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.4.bb @@ -9,10 +9,10
> @@ FILESPATH =. "${FILE_DIRNAME}/${BPN}-${PV}:" SRC_URI +=
> "file://0001-Revert-Makefile.am-Drop-static-dfu-util.patch"
> 
> do_deploy() { -	install -d ${DEPLOY_DIR_TOOLS} -	install -m 0755
> src/dfu-util_static ${DEPLOY_DIR_TOOLS}/dfu-util-${PV} -	rm -f
> ${DEPLOY_DIR_TOOLS}/dfu-util -	ln -sf ./dfu-util-${PV}
> ${DEPLOY_DIR_TOOLS}/dfu-util +    install -d ${DEPLOY_DIR_TOOLS} +
> install -m 0755 src/dfu-util_static ${DEPLOY_DIR_TOOLS}/dfu-util-${PV} +
> rm -f ${DEPLOY_DIR_TOOLS}/dfu-util +    ln -sf ./dfu-util-${PV}
> ${DEPLOY_DIR_TOOLS}/dfu-util
> 
> }
> 
> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb
> b/meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb index
> c103509..4bed46a 100644 ---
> a/meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb +++
> b/meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb @@ -6,10 +6,10
> @@ do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}" DEPENDS =
> "libusb-compat usbpath-native"
> 
> do_deploy() { -	install -d ${DEPLOY_DIR_TOOLS} -	install -m 0755
> src/dfu-util_static ${DEPLOY_DIR_TOOLS}/dfu-util-${PV} -	rm -f
> ${DEPLOY_DIR_TOOLS}/dfu-util -	ln -sf ./dfu-util-${PV}
> ${DEPLOY_DIR_TOOLS}/dfu-util +    install -d ${DEPLOY_DIR_TOOLS} +
> install -m 0755 src/dfu-util_static ${DEPLOY_DIR_TOOLS}/dfu-util-${PV} +
> rm -f ${DEPLOY_DIR_TOOLS}/dfu-util +    ln -sf ./dfu-util-${PV}
> ${DEPLOY_DIR_TOOLS}/dfu-util
> 
> }
> 
> diff --git a/meta-oe/recipes-support/emacs/emacs.inc
> b/meta-oe/recipes-support/emacs/emacs.inc index a823713..5068596 100644 
> --- a/meta-oe/recipes-support/emacs/emacs.inc +++
> b/meta-oe/recipes-support/emacs/emacs.inc @@ -9,11 +9,11 @@ DEPENDS +=
> "qemu-native" DEPENDS +=" liblockfile"
> 
> X11DEPENDS = " \ -  libice libsm atk cairo dbus expat libffi fontconfig
> freetype gconf giflib \ -  jpeg xz pixman libpng librsvg tiff libcroco \ 
> -  libx11 libxau libxcomposite libxcursor libxdamage libxdmcp libxext
> libxfixes \ -  libxft libxpm libxrandr libxrender \ -  gdk-pixbuf
> glib-2.0 gtk+ pango libxcb harfbuzz icu \ +    libice libsm atk cairo
> dbus expat libffi fontconfig freetype gconf giflib \ +    jpeg xz pixman
> libpng librsvg tiff libcroco \ +    libx11 libxau libxcomposite
> libxcursor libxdamage libxdmcp libxext libxfixes \ +    libxft libxpm
> libxrandr libxrender \ +    gdk-pixbuf glib-2.0 gtk+ pango libxcb
> harfbuzz icu \ "
> 
> EXTRA_OECONF =  "--without-sound --with-crt-dir=${STAGING_LIBDIR} " @@
> -45,100 +45,100 @@ QEMU = "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L
> ${TREEDIR} " export LOGNAME = "$(whoami)"
> 
> do_compile_prepend() { -	sed -i ':1;s:\(START.* \|LIB_STANDARD.*
> \|LIBES.* \)/usr/lib:\1${STAGING_LIBDIR}:;t1' ${S}/src/s/gnu-linux.h
> `find "${S}" -name Makefile` -	export
> LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${TOOLCHAIN_PATH}/${TARGET_SYS}/lib" +
> sed -i ':1;s:\(START.* \|LIB_STANDARD.* \|LIBES.*
> \)/usr/lib:\1${STAGING_LIBDIR}:;t1' ${S}/src/s/gnu-linux.h `find "${S}"
> -name Makefile` +    export
> LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${TOOLCHAIN_PATH}/${TARGET_SYS}/lib" #
> Ugly hack, see files/use-qemu.patch for more: -	ln -sf ../src/emacs
> lisp/emacs -	ln -sf ../src/emacs lib-src/emacs -	ln -sf ../src/emacs
> leim/emacs +    ln -sf ../src/emacs lisp/emacs +    ln -sf ../src/emacs
> lib-src/emacs +    ln -sf ../src/emacs leim/emacs #copy
> STAGING_DIR_TARGET and libgcc_s.so* to WORKDIR/qemu-treedir #copied code
> from glibc-package.bbclass -	treedir=${TREEDIR} -	if [ -e $treedir
> ];then -		rm -rf $treedir -	fi - -	mkdir -p $treedir/${base_libdir} - -
> if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so ];
> then -		cp -pPR
> ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so
> $treedir/${base_libdir} -	fi -	if [ -f
> ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.* ]; then -
> cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.*
> $treedir/${base_libdir} -	fi -	# stupid hack, but without it, it tries to
> use /usr/lib/libc.so from host and fails -	# temacs: error while loading
> shared libraries: /usr/lib/libc.so: ELF file version does not match
> current one -	if [ ! -f $treedir/${base_libdir}/libc.so ]; then -		ln -s
> libc.so.6 $treedir/${base_libdir}/libc.so -	fi - -	# copy only as much
> stuff as we need -	# before: 5.5G   ../../qemu-treedir/ -	# after:   17M
> ../../qemu-treedir/ -	cp -pPR \ -
> ${STAGING_DIR_TARGET}/${base_libdir}/ld-* \ -
> ${STAGING_DIR_TARGET}/${base_libdir}/libc.* \ -
> ${STAGING_DIR_TARGET}/${base_libdir}/libc-* \ -
> ${STAGING_DIR_TARGET}/${base_libdir}/libm-* \ -
> ${STAGING_DIR_TARGET}/${base_libdir}/libm.* \ -
> ${STAGING_DIR_TARGET}/${base_libdir}/libtinfo.so.* \ -
> ${STAGING_DIR_TARGET}/${base_libdir}/libresolv* \ -
> ${STAGING_DIR_TARGET}/${base_libdir}/libdl* \ -
> ${STAGING_DIR_TARGET}/${base_libdir}/librt* \ -
> ${STAGING_DIR_TARGET}/${base_libdir}/libgcc_s.so.* \ -
> ${STAGING_DIR_TARGET}/${base_libdir}/libpthread*
> $treedir/${base_libdir}/ - -	if [ ! -z
> "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" ] ; then -
> echo "X11 build enabled" -		# copy only as much stuff as we need -		#
> before: 5.5G   ../../qemu-treedir/ -		# after:   86M
> ../../qemu-treedir/ -		cp -pPR \ -
> ${STAGING_DIR_TARGET}/${base_libdir}/libuuid.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libICE.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libSM.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libatk-1.0.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libcairo.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libdbus-1.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libdbus-glib-1.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libexpat.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libffi.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libfontconfig.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libfreetype.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libgconf-2.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libgif.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libjpeg.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/liblzma.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libpixman-1.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libpng1*.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/librsvg-2.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libstdc++.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libtiff.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libxml2.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libcroco-0.6.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libharfbuzz.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libicule.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libicuuc.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libicudata.so.* \ -
> ${STAGING_DIR_TARGET}/${libdir}/libz.so.* $treedir/${base_libdir}/ - -		#
> X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes Xft Xpm Xrandr
> Xrender -		cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libX*.so.*
> $treedir/${base_libdir}/ - -		# gdk-x11 gdk_pixbuf gio glib gmodule
> gobject gthread gtk-x11 -		cp -pPR
> ${STAGING_DIR_TARGET}/${libdir}/libg*-2.0.so.* $treedir/${base_libdir}/ 
> - -		# pango pangocairo pangoft2 -		cp -pPR
> ${STAGING_DIR_TARGET}/${libdir}/libpango*-1.0.so.*
> $treedir/${base_libdir}/ - -		# xcb-render xcb-shm xcb -		cp -pPR
> ${STAGING_DIR_TARGET}/${libdir}/libxcb*.so.* $treedir/${base_libdir}/ -
> fi +    treedir=${TREEDIR} +    if [ -e $treedir ];then +        rm -rf
> $treedir +    fi + +    mkdir -p $treedir/${base_libdir} + +    if [ -f
> ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so ]; then +
> cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so
> $treedir/${base_libdir} +    fi +    if [ -f
> ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.* ]; then +
> cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.*
> $treedir/${base_libdir} +    fi +    # stupid hack, but without it, it
> tries to use /usr/lib/libc.so from host and fails +    # temacs: error
> while loading shared libraries: /usr/lib/libc.so: ELF file version does
> not match current one +    if [ ! -f $treedir/${base_libdir}/libc.so ];
> then +        ln -s libc.so.6 $treedir/${base_libdir}/libc.so +    fi + +
> # copy only as much stuff as we need +    # before: 5.5G
> ../../qemu-treedir/ +    # after:   17M   ../../qemu-treedir/ +    cp
> -pPR \ +    ${STAGING_DIR_TARGET}/${base_libdir}/ld-* \ +
> ${STAGING_DIR_TARGET}/${base_libdir}/libc.* \ +
> ${STAGING_DIR_TARGET}/${base_libdir}/libc-* \ +
> ${STAGING_DIR_TARGET}/${base_libdir}/libm-* \ +
> ${STAGING_DIR_TARGET}/${base_libdir}/libm.* \ +
> ${STAGING_DIR_TARGET}/${base_libdir}/libtinfo.so.* \ +
> ${STAGING_DIR_TARGET}/${base_libdir}/libresolv* \ +
> ${STAGING_DIR_TARGET}/${base_libdir}/libdl* \ +
> ${STAGING_DIR_TARGET}/${base_libdir}/librt* \ +
> ${STAGING_DIR_TARGET}/${base_libdir}/libgcc_s.so.* \ +
> ${STAGING_DIR_TARGET}/${base_libdir}/libpthread*
> $treedir/${base_libdir}/ + +    if [ ! -z
> "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" ] ; then +
> echo "X11 build enabled" +        # copy only as much stuff as we need +
> # before: 5.5G   ../../qemu-treedir/ +        # after:   86M
> ../../qemu-treedir/ +        cp -pPR \ +
> ${STAGING_DIR_TARGET}/${base_libdir}/libuuid.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libICE.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libSM.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libatk-1.0.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libcairo.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libdbus-1.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libdbus-glib-1.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libexpat.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libffi.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libfontconfig.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libfreetype.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libgconf-2.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libgif.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libjpeg.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/liblzma.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libpixman-1.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libpng1*.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/librsvg-2.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libstdc++.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libtiff.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libxml2.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libcroco-0.6.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libharfbuzz.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libicule.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libicuuc.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libicudata.so.* \ +
> ${STAGING_DIR_TARGET}/${libdir}/libz.so.* $treedir/${base_libdir}/ + +
> # X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes Xft Xpm Xrandr
> Xrender +        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libX*.so.*
> $treedir/${base_libdir}/ + +        # gdk-x11 gdk_pixbuf gio glib gmodule
> gobject gthread gtk-x11 +        cp -pPR
> ${STAGING_DIR_TARGET}/${libdir}/libg*-2.0.so.* $treedir/${base_libdir}/ 
> + +        # pango pangocairo pangoft2 +        cp -pPR
> ${STAGING_DIR_TARGET}/${libdir}/libpango*-1.0.so.*
> $treedir/${base_libdir}/ + +        # xcb-render xcb-shm xcb +        cp
> -pPR ${STAGING_DIR_TARGET}/${libdir}/libxcb*.so.*
> $treedir/${base_libdir}/ +    fi }
> 
> do_install_append() { -	# freaks package.bbclass and whole bitbake call
> returns error code -	# ERROR: runstrip: ''arm-oe-linux-gnueabi-strip'
> '/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/emacs-23.4-r0/package/usr/share/emacs/23.4/etc/tutorials/TUTORIAL.ko''
> strip command failed -	mv
> ${D}${datadir}/${BPN}/${PV}/etc/tutorials/TUTORIAL.ko
> ${D}${datadir}/${BPN}/${PV}/etc/tutorials/TUTORIAL.KO +    # freaks
> package.bbclass and whole bitbake call returns error code +    # ERROR:
> runstrip: ''arm-oe-linux-gnueabi-strip'
> '/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/emacs-23.4-r0/package/usr/share/emacs/23.4/etc/tutorials/TUTORIAL.ko''
> strip command failed +    mv
> ${D}${datadir}/${BPN}/${PV}/etc/tutorials/TUTORIAL.ko
> ${D}${datadir}/${BPN}/${PV}/etc/tutorials/TUTORIAL.KO }
> 
> EXTRA_OEMAKE += 'QEMU="${QEMU}"' diff --git
> a/meta-oe/recipes-support/enca/enca_1.9.bb
> b/meta-oe/recipes-support/enca/enca_1.9.bb index 5472af4..ba6d70d 100644 
> --- a/meta-oe/recipes-support/enca/enca_1.9.bb +++
> b/meta-oe/recipes-support/enca/enca_1.9.bb @@ -6,10 +6,10 @@ LICENSE =
> "GPLv2" LIC_FILES_CHKSUM =
> "file://COPYING;md5=24b9569831c46d4818450b55282476b4"
> 
> SRC_URI =
> "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/enca-${PV}.tar.bz2
> \ -	file://configure-hack.patch \ -	file://dont-run-tests.patch \ -
> file://configure-remove-dumbness.patch \ -
> file://makefile-remove-tools.patch " +    file://configure-hack.patch \ +
> file://dont-run-tests.patch \ +    file://configure-remove-dumbness.patch
> \ +    file://makefile-remove-tools.patch "
> 
> SRC_URI[md5sum] = "b3581e28d68d452286fb0bfe58bed3b3" SRC_URI[sha256sum] =
> "02acfef2b24a9c842612da49338138311f909f1cd33933520c07b8b26c410f4d" @@
> -19,13 +19,13 @@ inherit autotools EXTRA_OECONF =
> "--with-libiconv-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
> 
> do_configure_prepend() { -	# remove failing test which checks for
> something that isn't even used -	sed -i -e
> '/ye_FUNC_SCANF_MODIF_SIZE_T/d' configure.ac +    # remove failing test
> which checks for something that isn't even used +    sed -i -e
> '/ye_FUNC_SCANF_MODIF_SIZE_T/d' configure.ac }
> 
> do_configure_append() { -	sed -i s:-I/usr/include::g Makefile -	sed -i
> s:-I/usr/include::g */Makefile +    sed -i s:-I/usr/include::g Makefile +
> sed -i s:-I/usr/include::g */Makefile }
> 
> do_compile() { diff --git
> a/meta-oe/recipes-support/espeak/espeak-data_1.37.bb
> b/meta-oe/recipes-support/espeak/espeak-data_1.37.bb index
> d15d496..914bf36 100644 ---
> a/meta-oe/recipes-support/espeak/espeak-data_1.37.bb +++
> b/meta-oe/recipes-support/espeak/espeak-data_1.37.bb @@ -9,18 +9,18 @@
> PACKAGE_ARCH = "${MACHINE_ARCH}" TARGET_ARCH = "${MACHINE_ARCH}"
> 
> do_compile() { -        # Fixing byte order of phoneme data files -
> cd "${S}/platforms/big_endian" -        sed -i '/^ *CC *=/d' Makefile -
> sed -i 's/\(.*BYTE_ORDER\)/#undef BYTE_ORDER\n#define BYTE_ORDER
> BIG_ENDIAN\n\1/' espeak-phoneme-data.c -        oe_runmake -
> ./espeak-phoneme-data "${S}/espeak-data" -        cp -f phondata
> phonindex phontab "${S}/espeak-data" +    # Fixing byte order of phoneme
> data files +    cd "${S}/platforms/big_endian" +    sed -i '/^ *CC *=/d'
> Makefile +    sed -i 's/\(.*BYTE_ORDER\)/#undef BYTE_ORDER\n#define
> BYTE_ORDER BIG_ENDIAN\n\1/' espeak-phoneme-data.c +    oe_runmake +
> ./espeak-phoneme-data "${S}/espeak-data" +    cp -f phondata phonindex
> phontab "${S}/espeak-data" }
> 
> do_install() { -        install -d ${D}${layout_datadir}/espeak-data -
> install -m 0644 ${S}/espeak-data/phon* ${D}${layout_datadir}/espeak-data 
> +    install -d ${D}${layout_datadir}/espeak-data +    install -m 0644
> ${S}/espeak-data/phon* ${D}${layout_datadir}/espeak-data }
> 
> SRC_URI[md5sum] = "5c7b292d0537232868b4ac1317d76c02" diff --git
> a/meta-oe/recipes-support/espeak/espeak_1.37.bb
> b/meta-oe/recipes-support/espeak/espeak_1.37.bb index 6cc4cd4..c7f4b52
> 100644 --- a/meta-oe/recipes-support/espeak/espeak_1.37.bb +++
> b/meta-oe/recipes-support/espeak/espeak_1.37.bb @@ -13,30 +13,30 @@
> TARGET_CC_ARCH += "${LDFLAGS}" FILES_${PN} += "${datadir}/espeak-data"
> 
> do_configure() { -       #  "speak" binary, a TTS engine, uses portaudio
> in either APIs V18 or V19, use V19 -       cp "${S}/src/portaudio19.h"
> "${S}/src/portaudio.h" +    #  "speak" binary, a TTS engine, uses
> portaudio in either APIs V18 or V19, use V19 +    cp
> "${S}/src/portaudio19.h" "${S}/src/portaudio.h" }
> 
> do_compile() { -       cd src -       oe_runmake +    cd src +
> oe_runmake }
> 
> do_install() { -        install -d ${D}${bindir} -        install -d
> ${D}${libdir} -        install -d ${D}${includedir} -        install -d
> ${D}${datadir}/espeak-data - -        # we do not ship "speak" binary
> though. -        install -m 0755 ${S}/src/espeak ${D}${bindir} -
> install -m 0644 ${S}/src/speak_lib.h ${D}${includedir} -
> oe_libinstall -so -C src libespeak ${D}${libdir} - -	if [
> "${SITEINFO_ENDIANNESS}" = "be" ] ; then -		# the big-endian phon* files
> are provided by the package espeak-data -		rm -f ${S}/espeak-data/phon* -
> fi - -        cp -prf ${S}/espeak-data/* ${D}${datadir}/espeak-data +
> install -d ${D}${bindir} +    install -d ${D}${libdir} +    install -d
> ${D}${includedir} +    install -d ${D}${datadir}/espeak-data + +    # we
> do not ship "speak" binary though. +    install -m 0755 ${S}/src/espeak
> ${D}${bindir} +    install -m 0644 ${S}/src/speak_lib.h
> ${D}${includedir} +    oe_libinstall -so -C src libespeak ${D}${libdir} 
> + +    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then +        # the
> big-endian phon* files are provided by the package espeak-data +
> rm -f ${S}/espeak-data/phon* +    fi + +    cp -prf ${S}/espeak-data/*
> ${D}${datadir}/espeak-data } diff --git
> a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb index
> fe94fc4..5abf1d7 100644 ---
> a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb +++
> b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb @@ -12,9 +12,9 @@
> DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer
> gst-plugins-base" inherit autotools
> 
> EXTRA_OECONF = " \ -  --disable-debug \ -  --disable-gtk-doc \ -
> --disable-python \ +    --disable-debug \ +    --disable-gtk-doc \ +
> --disable-python \ "
> 
> FILES_${PN} += "${libdir}/*/*.so" diff --git
> a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
> b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb index
> 48ca0a5..94ec9a2 100644 ---
> a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb +++
> b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb @@ -21,11 +21,11 @@
> FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a" FILES_${PN}-dbg
> += "${libdir}/gstreamer-0.10/.debug"
> 
> do_compile_append() { -        for i in $(find ${S} -name "*.pc") ; do -
> sed -i -e s:${STAGING_DIR_TARGET}::g \ -                   -e
> s:/${TARGET_SYS}::g \ -                      $i -        done +    for i
> in $(find ${S} -name "*.pc") ; do +        sed -i -e
> s:${STAGING_DIR_TARGET}::g \ +               -e s:/${TARGET_SYS}::g \ +
> $i +    done }
> 
> 
> diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb
> b/meta-oe/recipes-support/fbset/fbset_2.1.bb index 9fe2728..88d4f5e
> 100644 --- a/meta-oe/recipes-support/fbset/fbset_2.1.bb +++
> b/meta-oe/recipes-support/fbset/fbset_2.1.bb @@ -21,10 +21,10 @@ inherit
> autotools update-alternatives PARALLEL_MAKE = ""
> 
> do_install() { -        install -d ${D}${sbindir} ${D}${datadir}/man/man8
> ${D}${datadir}/man/man5 -        install -m 0755 ${WORKDIR}/${P}/fbset
> ${D}${sbindir}/fbset.real -        install -m 0644 ${WORKDIR}/${P}/*.5
> ${D}${datadir}/man/man5 -        install -m 0644 ${WORKDIR}/${P}/*.8
> ${D}${datadir}/man/man8 +    install -d ${D}${sbindir}
> ${D}${datadir}/man/man8 ${D}${datadir}/man/man5 +    install -m 0755
> ${WORKDIR}/${P}/fbset ${D}${sbindir}/fbset.real +    install -m 0644
> ${WORKDIR}/${P}/*.5 ${D}${datadir}/man/man5 +    install -m 0644
> ${WORKDIR}/${P}/*.8 ${D}${datadir}/man/man8 }
> 
> ALTERNATIVE_fbset = "fbset" diff --git
> a/meta-oe/recipes-support/fbtest/fb-test_git.bb
> b/meta-oe/recipes-support/fbtest/fb-test_git.bb index 43acfd6..eea1be4
> 100644 --- a/meta-oe/recipes-support/fbtest/fb-test_git.bb +++
> b/meta-oe/recipes-support/fbtest/fb-test_git.bb @@ -11,9 +11,9 @@ SRC_URI
> = "git://github.com/prpplague/fb-test-app.git" S = "${WORKDIR}/git"
> 
> do_install() { -	install -d ${D}${bindir} -	for prog in perf rect fb-test
> offset ; do -		install -m 0755 $prog ${D}${bindir} -	done +    install -d
> ${D}${bindir} +    for prog in perf rect fb-test offset ; do +
> install -m 0755 $prog ${D}${bindir} +    done }
> 
> diff --git a/meta-oe/recipes-support/fftw/fftw.inc
> b/meta-oe/recipes-support/fftw/fftw.inc index 80fc656..074a53b 100644 ---
> a/meta-oe/recipes-support/fftw/fftw.inc +++
> b/meta-oe/recipes-support/fftw/fftw.inc @@ -12,7 +12,7 @@ S =
> "${WORKDIR}/fftw-${PV}" inherit autotools pkgconfig
> 
> do_configure_prepend() { -        echo 'AM_PROG_AS' >> ${S}/configure.ac
>  +    echo 'AM_PROG_AS' >> ${S}/configure.ac }
> 
> PACKAGES =+ "lib${PN}" diff --git
> a/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb
> b/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb index a7b8b67..e2989d6
> 100644 --- a/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb +++
> b/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb @@ -1,8 +1,8 @@ require
> fftw.inc
> 
> EXTRA_OECONF = "--disable-fortran --enable-single --enable-shared \ -
> --enable-threads \ -  ${@base_contains('TUNE_FEATURES', 'neon',
> '--enable-neon', '', d)} \ +    --enable-threads \ +
> ${@base_contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)} \ "
> 
> SRC_URI[md5sum] = "0a05ca9c7b3bfddc8278e7c40791a1c2" diff --git
> a/meta-oe/recipes-support/flite/flite.inc
> b/meta-oe/recipes-support/flite/flite.inc index a0d718c..b9d5e5a 100644 
> --- a/meta-oe/recipes-support/flite/flite.inc +++
> b/meta-oe/recipes-support/flite/flite.inc @@ -18,9 +18,9 @@ PACKAGES +=
> "lib${PN} lib${PN}-vox8 lib${PN}-vox16" FILES_${PN} = "${bindir}"
> 
> FILES_lib${PN} ="${libdir}/libflite.so.* \ -
> ${libdir}/libflite_cmu_time_awb.so.* \ -		 ${libdir}/libflite_cmulex.so.*
> \ -		 ${libdir}/libflite_usenglish.so.*" +
> ${libdir}/libflite_cmu_time_awb.so.* \ +
> ${libdir}/libflite_cmulex.so.* \ +    ${libdir}/libflite_usenglish.so.*"
> 
> FILES_lib${PN}-vox8 = "${libdir}/libflite_cmu_us_kal.so.*"
> 
> @@ -29,5 +29,5 @@ FILES_lib${PN}-vox16 =
> "${libdir}/libflite_cmu_us_kal16.so.*" LEAD_SONAME = "libflite.so"
> 
> do_install() { -        oe_runmake INSTALLBINDIR="${D}${bindir}"
> INSTALLLIBDIR="${D}${libdir}" INSTALLINCDIR="${D}${includedir}" install +
> oe_runmake INSTALLBINDIR="${D}${bindir}" INSTALLLIBDIR="${D}${libdir}"
> INSTALLINCDIR="${D}${includedir}" install } diff --git
> a/meta-oe/recipes-support/fuse/fuse_2.9.2.bb
> b/meta-oe/recipes-support/fuse/fuse_2.9.2.bb index b558c4d..fca0e8e
> 100644 --- a/meta-oe/recipes-support/fuse/fuse_2.9.2.bb +++
> b/meta-oe/recipes-support/fuse/fuse_2.9.2.bb @@ -36,5 +36,5 @@
> DEBIAN_NOAUTONAME_fuse-utils = "1" DEBIAN_NOAUTONAME_fuse-utils-dbg =
> "1"
> 
> do_install_append() { -  rm -rf ${D}${base_prefix}/dev +    rm -rf
> ${D}${base_prefix}/dev } diff --git
> a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
> b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb index 5db2e61..ba8b619
> 100644 --- a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb +++
> b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb @@ -3,11 +3,11 @@ require
> gsoap_${PV}.inc DEPENDS = "gsoap-native openssl"
> 
> do_install_append() { -   install -d ${D}${libdir} -   for lib in
> libgsoapssl libgsoapssl++ libgsoap libgsoapck++ libgsoap++ libgsoapck -
> do -       oe_libinstall -C gsoap $lib ${D}${libdir} -   done +
> install -d ${D}${libdir} +    for lib in libgsoapssl libgsoapssl++
> libgsoap libgsoapck++ libgsoap++ libgsoapck +    do +
> oe_libinstall -C gsoap $lib ${D}${libdir} +    done }
> 
> FILES_${PN} = "${bindir}/wsdl2h ${bindir}/soapcpp2" diff --git
> a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
> b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb index
> 9483b5c..1687c03 100644 ---
> a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb +++
> b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb @@ -22,10 +22,10
> @@ inherit autotools gettext update-rc.d FILES_${PN} +=
> "/usr/share/misc/hddtemp.db"
> 
> do_install_append() { -	install -d ${D}/usr/share/misc/ -	install -m 0644
> ${WORKDIR}/hddtemp.db ${D}/usr/share/misc/hddtemp.db -	install -d
> ${D}${sysconfdir}/init.d -	install -m 0644 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/hddtemp +    install -d ${D}/usr/share/misc/ +
> install -m 0644 ${WORKDIR}/hddtemp.db ${D}/usr/share/misc/hddtemp.db +
> install -d ${D}${sysconfdir}/init.d +    install -m 0644 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/hddtemp }
> 
> INITSCRIPT_NAME = "hddtemp" diff --git
> a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
> b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb index
> e504f61..a8a4011 100644 ---
> a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb +++
> b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb @@ -14,13 +14,13
> @@ SRC_URI[sha256sum] =
> "960023f61de292c6dd757fcedec4bffa7dd036e8594e24b26a706094ca inherit
> autotools
> 
> do_compile_prepend() { -        cp ${WORKDIR}/Module.mk ${S}/eepromer/ -
> sed -i 's#/usr/local#/usr#' Makefile -        echo "include
> eepromer/Module.mk" >> Makefile +    cp ${WORKDIR}/Module.mk
> ${S}/eepromer/ +    sed -i 's#/usr/local#/usr#' Makefile +    echo
> "include eepromer/Module.mk" >> Makefile }
> 
> do_install_append() { -        install -d ${D}${includedir}/linux -
> install -m 0644 include/linux/i2c-dev.h
> ${D}${includedir}/linux/i2c-dev-user.h -	rm -f
> ${D}${includedir}/linux/i2c-dev.h +    install -d
> ${D}${includedir}/linux +    install -m 0644 include/linux/i2c-dev.h
> ${D}${includedir}/linux/i2c-dev-user.h +    rm -f
> ${D}${includedir}/linux/i2c-dev.h } diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
> b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb index
> 9f3d4ea..fac3ce8 100644 ---
> a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb +++
> b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb @@ -10,7 +10,7
> @@ PR = "r5" PATCHSET = "6" SRC_URI =
> "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2
> \ file://PerlMagic_MakePatch.patch \ -	   file://remove.dist-lzip.patch
> \ +           file://remove.dist-lzip.patch \ " SRC_URI[md5sum] =
> "bcf07cf0822572fa2b47fa6d506f699a" SRC_URI[sha256sum] =
> "d9347f31d3d35b40009e1bbcf713c5ad252411e05ee621d5a7dae01e47bdbd80" diff
> --git a/meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc
> b/meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc index
> caf2b0b..264b49a 100644 ---
> a/meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc +++
> b/meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc @@ -40,7 +40,7 @@
> EXTRA_OECONF = "--with-kernel-headers=${STAGING_INCDIR} \ 
> --without-libradius \ --without-gssapi \ --without-libpam \ -
> --disable-security-context" +                --disable-security-context"
> 
> # See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=530527 CFLAGS +=
> "-fno-strict-aliasing" diff --git
> a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb index
> 9e7d2fc..e1e5ff2 100644 ---
> a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb +++
> b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb @@ -12,7 +12,7
> @@ S = "${WORKDIR}/git" inherit autotools lib_package
> 
> do_install_append() { -	sed -i -e s://:/:g -e
> 's:=${libdir}/libudev.la:-ludev:g' ${D}${libdir}/libatasmart.la +    sed
> -i -e s://:/:g -e 's:=${libdir}/libudev.la:-ludev:g'
> ${D}${libdir}/libatasmart.la }
> 
> PACKAGES =+ "${PN}-dev-vala" diff --git
> a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
> b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb index
> a6d68d4..89cbce0 100644 ---
> a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb +++
> b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb @@ -14,15
> +14,15 @@ SRC_URI[md5sum] = "2594093a5d61047bd9cc87e955f86df8" 
> SRC_URI[sha256sum] =
> "127a5ef07805856d63758e5180ebfb241d1f80094fd301c287591a15b8cfcd72"
> 
> EXTRA_OECONF = "\ -  --enable-null \ -  --enable-alsa \ -
> --enable-gstreamer \ -  --enable-pulse \ -  --disable-oss \ -
> --enable-gtk \ -  --enable-gtk3 \ -  --disable-tdb \ -  --disable-lynx \ 
> +    --enable-null \ +    --enable-alsa \ +    --enable-gstreamer \ +
> --enable-pulse \ +    --disable-oss \ +    --enable-gtk \ +
> --enable-gtk3 \ +    --disable-tdb \ +    --disable-lynx \ "
> 
> python populate_packages_prepend() { diff --git
> a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
> b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb index
> ce4e316..ca8f2dc 100644 ---
> a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb +++
> b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb @@ -19,11
> +19,11 @@ TARGET_CC_ARCH += "${LDFLAGS}"
> 
> do_configure_prepend() {
> 
> -   MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4
> ltversion.m4" +    MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4
> ltsugar.m4 ltversion.m4"
> 
> -   for i in ${MACROS}; do +    for i in ${MACROS}; do rm acinclude/$i -
> done +    done
> 
> }
> 
> diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
> b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb index
> 4f15535..60df0c6 100644 ---
> a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb +++
> b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb @@ -25,9 +25,9 @@
> INITSCRIPT_PARAMS_${PN}-sensord = "defaults 67" S =
> "${WORKDIR}/lm_sensors-${PV}"
> 
> EXTRA_OEMAKE = 'LINUX=${STAGING_KERNEL_DIR} EXLDFLAGS="${LDFLAGS}" \ -
> MACHINE=${TARGET_ARCH} PREFIX=${prefix} MANDIR=${mandir} \ -
> LIBDIR=${libdir} \ -		CC="${CC}" AR="${AR}"' +
> MACHINE=${TARGET_ARCH} PREFIX=${prefix} MANDIR=${mandir} \ +
> LIBDIR=${libdir} \ +        CC="${CC}" AR="${AR}"'
> 
> do_compile() { oe_runmake user PROG_EXTRA="sensors sensord" diff --git
> a/meta-oe/recipes-support/lzma/lzma.inc
> b/meta-oe/recipes-support/lzma/lzma.inc index 75e6d67..912d281 100644 ---
> a/meta-oe/recipes-support/lzma/lzma.inc +++
> b/meta-oe/recipes-support/lzma/lzma.inc @@ -21,15 +21,15 @@
> do_unpack_append() { }
> 
> do_compile() { -        oe_runmake CFLAGS='${CFLAGS} -c' -C C/LzmaUtil -
> oe_runmake CXX_C='${CC} ${CFLAGS}' CXX='${CXX} ${CXXFLAGS}' \ -		-C
> CPP/7zip/Compress/LZMA_Alone +    oe_runmake CFLAGS='${CFLAGS} -c' -C
> C/LzmaUtil +    oe_runmake CXX_C='${CC} ${CFLAGS}' CXX='${CXX}
> ${CXXFLAGS}' \ +    -C CPP/7zip/Compress/LZMA_Alone }
> 
> do_install() { -        install -d ${D}${bindir} ${D}${libdir} -
> install -m 0755 CPP/7zip/Compress/LZMA_Alone/lzma ${D}${bindir} -
> oe_libinstall -a -C C/LzmaUtil liblzma ${D}${libdir} +    install -d
> ${D}${bindir} ${D}${libdir} +    install -m 0755
> CPP/7zip/Compress/LZMA_Alone/lzma ${D}${bindir} +    oe_libinstall -a -C
> C/LzmaUtil liblzma ${D}${libdir} }
> 
> BBCLASSEXTEND = "native" diff --git
> a/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
> b/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb index
> 5dda2fb..dcd8a47 100644 ---
> a/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb +++
> b/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb @@ -12,7 +12,7 @@
> SRC_URI[sha256sum] =
> "e708b66f6cec9ba090877e8eb38e5627ac69aea9ebd9bca1360a29c739 inherit
> autotools
> 
> do_configure() { -	gnu-configize -	oe_runconf +    gnu-configize +
> oe_runconf }
> 
> diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
> b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb index
> f281f6d..e730102 100644 ---
> a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb +++
> b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb @@ -15,43
> +15,43 @@ inherit allarch docdir_append = "/${PN}"
> 
> do_install () { -	install -d ${D}${sysconfdir} -	install -d
> ${D}${libdir}/mime/packages -	install -d ${D}${docdir} -	install -d
> ${D}${sbindir} -	install -d ${D}${bindir} -	install -d
> ${D}${mandir}/man1 -	install -d ${D}${mandir}/man5 -	install -d
> ${D}${mandir}/man8 -	install -m 644 mime.types 		${D}${sysconfdir}/ -
> install -m 644 mailcap    		${D}${libdir}/mime/ -	install -m 644
> mailcap.order   		${D}${sysconfdir}/ -	install -m 644 mailcap.man
> ${D}${mandir}/man5/mailcap.5 -	install -m 644 mailcap.order.man
> ${D}${mandir}/man5/mailcap.order.5 -#	install -m 755 install-mime
> ${D}${sbindir}/ -#	install -m 644 install-mime.man
> ${D}${mandir}/man8/install-mime.8 -	install -m 755 update-mime
> ${D}${sbindir}/ -	install -m 644 update-mime.man
> ${D}${mandir}/man8/update-mime.8 -	install -m 755 run-mailcap
> ${D}${bindir}/ -	install -m 644 run-mailcap.man
> ${D}${mandir}/man1/run-mailcap.1 -#	install -m 644 rfcs/*
> ${D}${docdir}/ -	install -m 644 debian/changelog
> ${D}${docdir}/changelog.Debian -	install -m 644 debian/README
> ${D}${docdir}/copyright -	install -m 755 debian-view
> ${D}${libdir}/mime/ -	install -m 755 playaudio		${D}${libdir}/mime/ -
> install -m 755 playdsp			${D}${libdir}/mime/ -	install -m 644
> mailcap.entries		${D}${libdir}/mime/packages/mime-support -	cd
> ${D}${mandir}; gzip -9fv */* -	cd ${D}${docdir}; gzip -9v * -	cd
> ${D}${docdir}; gunzip copyright.gz -	cd ${D}${bindir}; ln -s run-mailcap
> see -	cd ${D}${bindir}; ln -s run-mailcap edit -	cd ${D}${bindir}; ln -s
> run-mailcap compose -	cd ${D}${bindir}; ln -s run-mailcap print -	cd
> ${D}${mandir}/man1; ln -s run-mailcap.1.gz see.1.gz -	cd
> ${D}${mandir}/man1; ln -s run-mailcap.1.gz edit.1.gz -	cd
> ${D}${mandir}/man1; ln -s run-mailcap.1.gz compose.1.gz -	cd
> ${D}${mandir}/man1; ln -s run-mailcap.1.gz print.1.gz +    install -d
> ${D}${sysconfdir} +    install -d ${D}${libdir}/mime/packages +
> install -d ${D}${docdir} +    install -d ${D}${sbindir} +    install -d
> ${D}${bindir} +    install -d ${D}${mandir}/man1 +    install -d
> ${D}${mandir}/man5 +    install -d ${D}${mandir}/man8 +    install -m 644
> mime.types         ${D}${sysconfdir}/ +    install -m 644 mailcap
> ${D}${libdir}/mime/ +    install -m 644 mailcap.order
> ${D}${sysconfdir}/ +    install -m 644 mailcap.man
> ${D}${mandir}/man5/mailcap.5 +    install -m 644 mailcap.order.man
> ${D}${mandir}/man5/mailcap.order.5 +#    install -m 755 install-mime
> ${D}${sbindir}/ +#    install -m 644 install-mime.man
> ${D}${mandir}/man8/install-mime.8 +    install -m 755 update-mime
> ${D}${sbindir}/ +    install -m 644 update-mime.man
> ${D}${mandir}/man8/update-mime.8 +    install -m 755 run-mailcap
> ${D}${bindir}/ +    install -m 644 run-mailcap.man
> ${D}${mandir}/man1/run-mailcap.1 +#    install -m 644 rfcs/*
> ${D}${docdir}/ +    install -m 644 debian/changelog
> ${D}${docdir}/changelog.Debian +    install -m 644 debian/README
> ${D}${docdir}/copyright +    install -m 755 debian-view
> ${D}${libdir}/mime/ +    install -m 755 playaudio
> ${D}${libdir}/mime/ +    install -m 755 playdsp
> ${D}${libdir}/mime/ +    install -m 644 mailcap.entries
> ${D}${libdir}/mime/packages/mime-support +    cd ${D}${mandir}; gzip -9fv
> */* +    cd ${D}${docdir}; gzip -9v * +    cd ${D}${docdir}; gunzip
> copyright.gz +    cd ${D}${bindir}; ln -s run-mailcap see +    cd
> ${D}${bindir}; ln -s run-mailcap edit +    cd ${D}${bindir}; ln -s
> run-mailcap compose +    cd ${D}${bindir}; ln -s run-mailcap print +
> cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz see.1.gz +    cd
> ${D}${mandir}/man1; ln -s run-mailcap.1.gz edit.1.gz +    cd
> ${D}${mandir}/man1; ln -s run-mailcap.1.gz compose.1.gz +    cd
> ${D}${mandir}/man1; ln -s run-mailcap.1.gz print.1.gz }
> 
> SRC_URI[md5sum] = "d6e5d715e331147352c50c158dbdec6d" diff --git
> a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
> b/meta-oe/recipes-support/mini-iconv/mini-iconv.bb index 3150013..5626097
> 100644 --- a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb +++
> b/meta-oe/recipes-support/mini-iconv/mini-iconv.bb @@ -17,5 +17,5 @@
> SRC_URI[sha256sum] =
> "3552262bf1bcf8e859a2a3a7adfb0367af8593383e730c492e981477aa S =
> "${WORKDIR}/${PN}"
> 
> do_install() { -	oe_runmake install DESTDIR=${D} PREFIX=${prefix}
> LIB=${base_libdir} +    oe_runmake install DESTDIR=${D} PREFIX=${prefix}
> LIB=${base_libdir} } diff --git
> a/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
> b/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb index
> b2bbfc4..dcaf0c6 100644 ---
> a/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb +++
> b/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb @@ -12,12 +12,12
> @@ EXTRA_OEMAKE = "" EXTRA_OECONF = " --with-embedded-server "
> 
> do_install() { -        oe_runmake 'DESTDIR=${D}' install -        mv -f
> ${D}${libdir}/mysql/* ${D}${libdir} -        rmdir ${D}${libdir}/mysql +
> oe_runmake 'DESTDIR=${D}' install +    mv -f ${D}${libdir}/mysql/*
> ${D}${libdir} +    rmdir ${D}${libdir}/mysql
> 
> -        install -d ${D}${bindir} -        install -m 0755
> sql/gen_lex_hash ${D}${bindir}/ +    install -d ${D}${bindir} +
> install -m 0755 sql/gen_lex_hash ${D}${bindir}/ }
> 
> SRC_URI[md5sum] = "32e7373c16271606007374396e6742ad" diff --git
> a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
> b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc index af0ddbb..3d79e19
> 100644 --- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc +++
> b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc @@ -35,13 +35,13 @@
> EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'" 
> EXTRA_OECONF = " --with-atomic-ops=up --with-embedded-server
> --prefix=/usr --sysconfdir=/etc/mysql --localstatedir=/var/mysql
> --disable-dependency-tracking --without-raid --without-debug
> --with-low-memory --without-query-cache --without-man --without-docs
> --without-innodb "
> 
> do_configure_append() { -     sed -i /comp_err/d ${S}/sql/share/Makefile 
> +    sed -i /comp_err/d ${S}/sql/share/Makefile
> 
> -     # handle distros with different values of ${libexecdir} -
> libexecdir2=`echo ${libexecdir} | sed -e 's+/usr/++g'` -     sed -i -e
> "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysql_install_db.sh -     sed
> -i -e "s:mysqld libexec:mysqld $libexecdir2:g"
> ${S}/scripts/mysql_install_db.sh -     sed -i -e
> "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysqld_safe.sh +    # handle
> distros with different values of ${libexecdir} +    libexecdir2=`echo
> ${libexecdir} | sed -e 's+/usr/++g'` +    sed -i -e
> "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysql_install_db.sh +    sed -i
> -e "s:mysqld libexec:mysqld $libexecdir2:g"
> ${S}/scripts/mysql_install_db.sh +    sed -i -e
> "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysqld_safe.sh }
> 
> SYSROOT_PREPROCESS_FUNCS += "mysql5_sysroot_preprocess" @@ -52,45 +52,45
> @@ SYSROOT_PREPROCESS_FUNCS += "mysql5_sysroot_preprocess" # plugindir is
> not fixed, but we don't create any plugins. # mysql5_sysroot_preprocess
> () { -	sed -i
> -es,^pkgincludedir=.*,pkgincludedir=\'${STAGING_INCDIR}/mysql\',
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/mysql_config -	sed -i
> -es,^pkglibdir=.*,pkglibdir=\'${STAGING_LIBDIR}\',
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/mysql_config +    sed -i
> -es,^pkgincludedir=.*,pkgincludedir=\'${STAGING_INCDIR}/mysql\',
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/mysql_config +    sed -i
> -es,^pkglibdir=.*,pkglibdir=\'${STAGING_LIBDIR}\',
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/mysql_config }
> 
> do_install() { -	oe_runmake 'DESTDIR=${D}' install -	mv -f
> ${D}${libdir}/mysql/* ${D}${libdir} -	rmdir ${D}${libdir}/mysql +
> oe_runmake 'DESTDIR=${D}' install +    mv -f ${D}${libdir}/mysql/*
> ${D}${libdir} +    rmdir ${D}${libdir}/mysql
> 
> -	install -d ${D}/etc/init.d -	install -m 0644 ${WORKDIR}/my.cnf
> ${D}/etc/ -	install -m 0755 ${WORKDIR}/mysqld.sh ${D}/etc/init.d/mysqld +
> install -d ${D}/etc/init.d +    install -m 0644 ${WORKDIR}/my.cnf
> ${D}/etc/ +    install -m 0755 ${WORKDIR}/mysqld.sh
> ${D}/etc/init.d/mysqld }
> 
> pkg_postinst_mysql5-server () { -	if [ "x$D" != "x" ]; then -		exit 1 -
> fi +    if [ "x$D" != "x" ]; then +        exit 1 +    fi
> 
> -	grep mysql /etc/passwd || adduser --disabled-password --home=/var/mysql
> --ingroup nogroup mysql +    grep mysql /etc/passwd || adduser
> --disabled-password --home=/var/mysql --ingroup nogroup mysql
> 
> -	#Install the database -	test -d /usr/bin || mkdir -p /usr/bin -	test -e
> /usr/bin/hostname || ln -s /bin/hostname /usr/bin/hostname -	mkdir
> /var/lib/mysql -	chown mysql.nogroup /var/lib/mysql +    #Install the
> database +    test -d /usr/bin || mkdir -p /usr/bin +    test -e
> /usr/bin/hostname || ln -s /bin/hostname /usr/bin/hostname +    mkdir
> /var/lib/mysql +    chown mysql.nogroup /var/lib/mysql
> 
> -	mysql_install_db +    mysql_install_db
> 
> }
> 
> pkg_postrm_mysql5-server () { -	grep mysql /etc/passwd && deluser mysql +
> grep mysql /etc/passwd && deluser mysql }
> 
> PACKAGES = "${PN}-dbg ${PN} \ -libmysqlclient-r libmysqlclient-r-dev
> libmysqlclient-r-staticdev libmysqlclient-r-dbg \ -libmysqlclient
> libmysqlclient-dev libmysqlclient-staticdev libmysqlclient-dbg \ 
> -${PN}-client ${PN}-server ${PN}-leftovers" +    libmysqlclient-r
> libmysqlclient-r-dev libmysqlclient-r-staticdev libmysqlclient-r-dbg \ +
> libmysqlclient libmysqlclient-dev libmysqlclient-staticdev
> libmysqlclient-dbg \ +    ${PN}-client ${PN}-server ${PN}-leftovers" 
> CONFFILES_${PN}-server += "${sysconfdir}/my.cnf"
> 
> FILES_${PN} = " " @@ -98,95 +98,95 @@ RDEPENDS_${PN} = "${PN}-client
> ${PN}-server" ALLOW_EMPTY_${PN} = "1"
> 
> FILES_libmysqlclient = "\ -${libdir}/libmysqlclient.so.* \ 
> -${libdir}/plugin/*.so.*" +    ${libdir}/libmysqlclient.so.* \ +
> ${libdir}/plugin/*.so.*" FILES_libmysqlclient-dev = " \ 
> -${includedir}/mysql/ \ -${libdir}/libmysqlclient.so \ 
> -${libdir}/libmysqlclient.la \ -${libdir}/plugin/*.so \ 
> -${libdir}/plugin/*.la \ -${sysconfdir}/aclocal \ 
> -${bindir}/mysql_config" +    ${includedir}/mysql/ \ +
> ${libdir}/libmysqlclient.so \ +    ${libdir}/libmysqlclient.la \ +
> ${libdir}/plugin/*.so \ +    ${libdir}/plugin/*.la \ +
> ${sysconfdir}/aclocal \ +    ${bindir}/mysql_config" 
> FILES_libmysqlclient-staticdev = "\ -${libdir}/*.a \ 
> -${libdir}/plugin/*.a" +    ${libdir}/*.a \ +    ${libdir}/plugin/*.a" 
> FILES_libmysqlclient-dbg = "${libdir}/plugin/.debug/ \ 
> -/usr/mysql-test/lib/My/SafeProcess/.debug/my_safe_process" +
> /usr/mysql-test/lib/My/SafeProcess/.debug/my_safe_process"
> 
> FILES_libmysqlclient-r = "${libdir}/libmysqlclient_r.so.*" 
> FILES_libmysqlclient-r-dev = "\ -${libdir}/libmysqlclient_r.so \ 
> -${libdir}/libmysqlclient_r.la" +    ${libdir}/libmysqlclient_r.so \ +
> ${libdir}/libmysqlclient_r.la" FILES_libmysqlclient-r-staticdev =
> "${libdir}/libmysqlclient_r.a" FILES_libmysqlclient-r-dbg =
> "${libdir}/plugin/.debuglibmysqlclient_r.so.*"
> 
> FILES_${PN}-client = "\ -${bindir}/myisam_ftdump \ -${bindir}/mysql \ 
> -${bindir}/mysql_client_test \ -${bindir}/mysql_client_test_embedded \ 
> -${bindir}/mysql_find_rows \ -${bindir}/mysql_fix_extensions \ 
> -${bindir}/mysql_waitpid \ -${bindir}/mysqlaccess \ -${bindir}/mysqladmin
> \ -${bindir}/mysqlbug \ -${bindir}/mysqlcheck \ -${bindir}/mysqldump \ 
> -${bindir}/mysqldumpslow \ -${bindir}/mysqlimport \ -${bindir}/mysqlshow
> \ -${bindir}/mysqlslap \ -${bindir}/mysqltest_embedded \ 
> -${libexecdir}/mysqlmanager" +    ${bindir}/myisam_ftdump \ +
> ${bindir}/mysql \ +    ${bindir}/mysql_client_test \ +
> ${bindir}/mysql_client_test_embedded \ +    ${bindir}/mysql_find_rows \ +
> ${bindir}/mysql_fix_extensions \ +    ${bindir}/mysql_waitpid \ +
> ${bindir}/mysqlaccess \ +    ${bindir}/mysqladmin \ +
> ${bindir}/mysqlbug \ +    ${bindir}/mysqlcheck \ +    ${bindir}/mysqldump
> \ +    ${bindir}/mysqldumpslow \ +    ${bindir}/mysqlimport \ +
> ${bindir}/mysqlshow \ +    ${bindir}/mysqlslap \ +
> ${bindir}/mysqltest_embedded \ +    ${libexecdir}/mysqlmanager"
> 
> FILES_${PN}-server = "\ -${bindir}/comp_err \ -${bindir}/isamchk \ 
> -${bindir}/isamlog \ -${bindir}/msql2mysql \ -${bindir}/my_print_defaults
> \ -${bindir}/myisamchk \ -${bindir}/myisamlog \ -${bindir}/myisampack \ 
> -${bindir}/mysql_convert_table_format \ 
> -${bindir}/mysql_fix_privilege_tables \ -${bindir}/mysql_install_db \ 
> -${bindir}/mysql_secure_installation \ -${bindir}/mysql_setpermission \ 
> -${bindir}/mysql_tzinfo_to_sql \ -${bindir}/mysql_upgrade \ 
> -${bindir}/mysql_zap \ -${bindir}/mysqlbinlog \ -${bindir}/mysqld_multi
> \ -${bindir}/mysqld_safe \ -${bindir}/mysqlhotcopy \ -${bindir}/mysqltest
> \ -${bindir}/ndb_delete_all \ -${bindir}/ndb_desc \ 
> -${bindir}/ndb_drop_index \ -${bindir}/ndb_drop_table \ 
> -${bindir}/ndb_mgm \ -${bindir}/ndb_restore \ -${bindir}/ndb_select_all
> \ -${bindir}/ndb_select_count \ -${bindir}/ndb_show_tables \ 
> -${bindir}/ndb_waiter \ -${bindir}/pack_isam \ -${bindir}/perror \ 
> -${bindir}/replace \ -${bindir}/resolve_stack_dump \ -${bindir}/resolveip
> \ -${libexecdir}/mysqld \ -${sbindir}/mysqld \ -${sbindir}/ndb_cpcd \ 
> -${sbindir}/ndbd \ -${sbindir}/ndb_mgmd \ -${datadir}/mysql/ \ 
> -${localstatedir}/mysql/ \ -${sysconfdir}/init.d \ 
> -${sysconfdir}/my.cnf" +    ${bindir}/comp_err \ +    ${bindir}/isamchk
> \ +    ${bindir}/isamlog \ +    ${bindir}/msql2mysql \ +
> ${bindir}/my_print_defaults \ +    ${bindir}/myisamchk \ +
> ${bindir}/myisamlog \ +    ${bindir}/myisampack \ +
> ${bindir}/mysql_convert_table_format \ +
> ${bindir}/mysql_fix_privilege_tables \ +    ${bindir}/mysql_install_db \ 
> +    ${bindir}/mysql_secure_installation \ +
> ${bindir}/mysql_setpermission \ +    ${bindir}/mysql_tzinfo_to_sql \ +
> ${bindir}/mysql_upgrade \ +    ${bindir}/mysql_zap \ +
> ${bindir}/mysqlbinlog \ +    ${bindir}/mysqld_multi \ +
> ${bindir}/mysqld_safe \ +    ${bindir}/mysqlhotcopy \ +
> ${bindir}/mysqltest \ +    ${bindir}/ndb_delete_all \ +
> ${bindir}/ndb_desc \ +    ${bindir}/ndb_drop_index \ +
> ${bindir}/ndb_drop_table \ +    ${bindir}/ndb_mgm \ +
> ${bindir}/ndb_restore \ +    ${bindir}/ndb_select_all \ +
> ${bindir}/ndb_select_count \ +    ${bindir}/ndb_show_tables \ +
> ${bindir}/ndb_waiter \ +    ${bindir}/pack_isam \ +    ${bindir}/perror
> \ +    ${bindir}/replace \ +    ${bindir}/resolve_stack_dump \ +
> ${bindir}/resolveip \ +    ${libexecdir}/mysqld \ +    ${sbindir}/mysqld
> \ +    ${sbindir}/ndb_cpcd \ +    ${sbindir}/ndbd \ +
> ${sbindir}/ndb_mgmd \ +    ${datadir}/mysql/ \ +
> ${localstatedir}/mysql/ \ +    ${sysconfdir}/init.d \ +
> ${sysconfdir}/my.cnf"
> 
> DESCRIPTION_${PN}-leftovers = "unpackaged and probably unneeded files for
> ${PN}" FILES_${PN}-leftovers = "/" diff --git
> a/meta-oe/recipes-support/nmon/nmon_13g.bb
> b/meta-oe/recipes-support/nmon/nmon_13g.bb index bc82c0a..38ea3e5 100644 
> --- a/meta-oe/recipes-support/nmon/nmon_13g.bb +++
> b/meta-oe/recipes-support/nmon/nmon_13g.bb @@ -20,10 +20,10 @@ LDFLAGS +=
> "-ltinfo -lncursesw" ASNEEDED_pn-nmon = ""
> 
> do_compile() { -	${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/lmon13g.c -o nmon 
> +    ${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/lmon13g.c -o nmon }
> 
> do_install() { -	install -d ${D}${bindir} -	install -m 0755 nmon
> ${D}${bindir} +    install -d ${D}${bindir} +    install -m 0755 nmon
> ${D}${bindir} } diff --git
> a/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb
> b/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb index
> 52fd1bf..7d85016 100644 ---
> a/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb +++
> b/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb @@ -12,7 +12,7
> @@ EXTRA_OECONF = "--disable-fortran --enable-single --enable-shared" 
> inherit autotools pkgconfig
> 
> do_compile_prepend() { -	sed -i -e
> 's:all-recursive:$(RECURSIVE_TARGETS):g' ${S}/Makefile +    sed -i -e
> 's:all-recursive:$(RECURSIVE_TARGETS):g' ${S}/Makefile }
> 
> SRC_URI[md5sum] = "9356e5e9dcb3f1481977009720a2ccf8" diff --git
> a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc
> b/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc index
> bac1be1..8484658 100644 ---
> a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc +++
> b/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc @@ -16,41
> +16,41 @@ SRC_URI =
> "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source 
> noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '',
> '--disable-ipv6', d)}"
> 
> EXTRA_OECONF = " \ -  --with-libnet=${STAGING_BINDIR_CROSS} \ -
> --enable-dynamic-linking \ -  ${noipv6} \ -  --enable-ssl \ -
> --disable-sub-streams \ -  --disable-pacct \ -  --disable-linux-caps \ -
> --disable-pcre \ -  --disable-sql \ +
> --with-libnet=${STAGING_BINDIR_CROSS} \ +    --enable-dynamic-linking \ +
> ${noipv6} \ +    --enable-ssl \ +    --disable-sub-streams \ +
> --disable-pacct \ +    --disable-linux-caps \ +    --disable-pcre \ +
> --disable-sql \ "
> 
> EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd',
> '--with-systemdsystemunitdir=${systemd_unitdir}/system/',
> '--without-systemdsystemunitdir', d)}" EXTRA_OECONF +=
> "${@base_contains('DISTRO_FEATURES', 'systemd', '--enable-systemd',
> '--disable-systemd', d)}"
> 
> do_configure_prepend() { -        eval
> "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e
> "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//"
> ${S}/configure.in', d)}" +    eval "${@base_contains('DISTRO_FEATURES',
> 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e
> "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}" }
> 
> # rename modules.conf because it breaks update-modules # see
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035537.html
>
> 
do_install_append() {
> -        mv ${D}/${sysconfdir}/modules.conf
> ${D}/${sysconfdir}/scl-modules.conf -        sed -i "s#@include
> 'modules.conf'#@include 'scl-modules.conf'#g"
> ${D}/${sysconfdir}/scl.conf -        install -d ${D}/${sysconfdir}/${PN} 
> -        install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf -
> install -d ${D}/${sysconfdir}/init.d -        install -m 755
> ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN} +    mv
> ${D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-modules.conf +
> sed -i "s#@include 'modules.conf'#@include 'scl-modules.conf'#g"
> ${D}/${sysconfdir}/scl.conf +    install -d ${D}/${sysconfdir}/${PN} +
> install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf +
> install -d ${D}/${sysconfdir}/init.d +    install -m 755
> ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN} }
> 
> FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/*
> ${libdir}/lib*${SOLIBS} \ -            ${sysconfdir} ${sharedstatedir}
> ${localstatedir} \ -            ${base_bindir}/* ${base_sbindir}/* \ -
> ${base_libdir}/*${SOLIBS} \ -            ${datadir}/${BPN}
> ${libdir}/${BPN}/*${SOLIBS} \ -            ${datadir}/include/scl/
> ${datadir}/xsd" +    ${sysconfdir} ${sharedstatedir} ${localstatedir} \ +
> ${base_bindir}/* ${base_sbindir}/* \ +    ${base_libdir}/*${SOLIBS} \ +
> ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \ +
> ${datadir}/include/scl/ ${datadir}/xsd" FILES_${PN}-dev +=
> "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIBSDEV}" CONFFILES_${PN}
> = "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf
> ${sysconfdir}/scl-modules.conf"
> 
> @@ -60,39 +60,39 @@ RCONFLICTS_${PN} += "${PN}-systemd" 
> SYSTEMD_SERVICE_${PN} = "${PN}.service"
> 
> pkg_postinst_${PN} () { -        /etc/init.d/syslog stop -
> update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init
> syslog.${PN} 200 - -        if test "x$D" != "x"; then -
> OPT="-r $D" -        else -                OPT="-s" -        fi -
> # remove all rc.d-links potentially created from alternative -        #
> syslog packages before creating new ones -        update-rc.d $OPT -f
> syslog remove -        update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90
> 0 1 6 . +    /etc/init.d/syslog stop +    update-alternatives --install
> ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 200 + +    if test
> "x$D" != "x"; then +        OPT="-r $D" +    else +        OPT="-s" +
> fi +    # remove all rc.d-links potentially created from alternative +
> # syslog packages before creating new ones +    update-rc.d $OPT -f
> syslog remove +    update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1
> 6 . }
> 
> pkg_prerm_${PN} () { -        if test "x$D" = "x"; then -
> if test "$1" = "upgrade" -o "$1" = "remove"; then -
> /etc/init.d/syslog stop -                fi +    if test "x$D" = "x";
> then +        if test "$1" = "upgrade" -o "$1" = "remove"; then +
> /etc/init.d/syslog stop fi +    fi
> 
> -        update-alternatives --remove syslog-init syslog.${PN} +
> update-alternatives --remove syslog-init syslog.${PN} }
> 
> pkg_postrm_${PN} () { -        if test "x$D" != "x"; then -
> OPT="-r $D" -        else -                OPT="" -        fi -        if
> test "$1" = "remove" -o "$1" = "purge"; then -                if ! test
> -e "/etc/init.d/syslog"; then -                        update-rc.d $OPT
> syslog remove -                fi +    if test "x$D" != "x"; then +
> OPT="-r $D" +    else +        OPT="" +    fi +    if test "$1" =
> "remove" -o "$1" = "purge"; then +        if ! test -e
> "/etc/init.d/syslog"; then +            update-rc.d $OPT syslog remove 
> fi +    fi } diff --git
> a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bb
> b/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bb index
> 62faa83..6d1fee7 100644 ---
> a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bb +++
> b/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bb @@ -2,8
> +2,8 @@ require syslog-ng.inc PR = "${INC_PR}.1"
> 
> SRC_URI += " \ -  file://syslog-ng.conf \ -  file://initscript \ +
> file://syslog-ng.conf \ +    file://initscript \ "
> 
> SRC_URI[md5sum] = "60737452ce898f9dc7170dfdc9bfd732" diff --git
> a/meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb
> b/meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb index
> 3d76226..f806818 100644 ---
> a/meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb +++
> b/meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb @@ -18,23 +18,23
> @@ S = "${WORKDIR}/OpenCV-${PV}"
> 
> do_install() { cd samples/c -	install -d ${D}/${bindir} -	install -d
> ${D}/${datadir}/opencv/samples +    install -d ${D}/${bindir} +
> install -d ${D}/${datadir}/opencv/samples
> 
> -	cp * ${D}/${datadir}/opencv/samples || true +    cp *
> ${D}/${datadir}/opencv/samples || true
> 
> for i in *.c; do echo "compiling $i" ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb
> `pkg-config --cflags opencv` -o `basename $i .c` $i `pkg-config --libs
> opencv` || true -		install -m 0755 `basename $i .c` ${D}/${bindir} ||
> true -		rm ${D}/${datadir}/opencv/samples/`basename $i .c` || true -
> done +        install -m 0755 `basename $i .c` ${D}/${bindir} || true +
> rm ${D}/${datadir}/opencv/samples/`basename $i .c` || true +    done for
> i in *.cpp; do echo "compiling $i" ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb
> `pkg-config --cflags opencv` -o `basename $i .cpp` $i `pkg-config --libs
> opencv` || true -		install -m 0755 `basename $i .cpp` ${D}/${bindir} ||
> true -		rm ${D}/${datadir}/opencv/samples/`basename $i .cpp` || true -
> done +        install -m 0755 `basename $i .cpp` ${D}/${bindir} || true +
> rm ${D}/${datadir}/opencv/samples/`basename $i .cpp` || true +    done }
> 
> FILES_${PN}-dev += "${datadir}/opencv/samples/*.c*
> ${datadir}/opencv/samples/*.vcp* ${datadir}/opencv/samples/build*" diff
> --git a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
> b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb index 916c8c5..4f8a574
> 100644 --- a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb +++
> b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb @@ -81,6 +81,6 @@
> FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*" 
> RDEPENDS_python-opencv = "python-core python-numpy"
> 
> do_install_append() { -	cp ${S}/include/opencv/*.h
> ${D}${includedir}/opencv/ -	sed -i '/blobtrack/d'
> ${D}${includedir}/opencv/cvaux.h +    cp ${S}/include/opencv/*.h
> ${D}${includedir}/opencv/ +    sed -i '/blobtrack/d'
> ${D}${includedir}/opencv/cvaux.h } diff --git
> a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
> b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb index
> 9888246..f450949 100644 ---
> a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb +++
> b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb @@ -22,10 +22,10
> @@ PACKAGES += "${PN}-bin" FILES_${PN}-bin = "${bindir}"
> 
> do_compile() { -	( -		# HACK: build a native binaries need during the
> build -		unset CC LD CXX CCLD CFLAGS -		oe_runmake -C config/util
> CC="${BUILD_CC}" LD="${BUILD_LD}" CXX="${BUILD_CXX}" LIBS="" makestrs +
> ( +        # HACK: build a native binaries need during the build +
> unset CC LD CXX CCLD CFLAGS +        oe_runmake -C config/util
> CC="${BUILD_CC}" LD="${BUILD_LD}" CXX="${BUILD_CXX}" LIBS="" makestrs ) 
> if [ "$?" != "0" ]; then exit 1 diff --git
> a/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
> b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb index 2905147..6880e1c
> 100644 --- a/meta-oe/recipes-support/p910nd/p910nd_0.95.bb +++
> b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb @@ -12,10 +12,10 @@
> SRC_URI[md5sum] = "c7ac6afdf7730ac8387a8e87198d4491" SRC_URI[sha256sum] =
> "7d78642c86dc247fbdef1ff85c56629dcdc6b2a457c786420299e284fffcb029"
> 
> do_compile () { -	${CC} ${LDFLAGS} -o p910nd p910nd.c +    ${CC}
> ${LDFLAGS} -o p910nd p910nd.c }
> 
> do_install () { -	install -D -m 0755 ${S}/p910nd ${D}${sbindir}/p910nd -
> install -D -m 0644 ${S}/p910nd.conf ${D}${sysconfdir}/p910nd.conf +
> install -D -m 0755 ${S}/p910nd ${D}${sbindir}/p910nd +    install -D -m
> 0644 ${S}/p910nd.conf ${D}${sysconfdir}/p910nd.conf } diff --git
> a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
> b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb index
> 04ec03c..a491fd6 100644 ---
> a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb +++
> b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb @@ -13,10 +13,10
> @@ PR = "r3" inherit autotools systemd
> 
> EXTRA_OECONF = " \ -	--disable-libusb \ -	--enable-libudev \ -
> --enable-usbdropdir=${libdir}/pcsc/drivers \ -	" +    --disable-libusb \ 
> +    --enable-libudev \ +    --enable-usbdropdir=${libdir}/pcsc/drivers
> \ +    "
> 
> S = "${WORKDIR}/pcsc-lite-${PV}"
> 
> diff --git a/meta-oe/recipes-support/picocom/picocom_1.6.bb
> b/meta-oe/recipes-support/picocom/picocom_1.6.bb index b7744aa..9fdd9d6
> 100644 --- a/meta-oe/recipes-support/picocom/picocom_1.6.bb +++
> b/meta-oe/recipes-support/picocom/picocom_1.6.bb @@ -9,8 +9,8 @@ SRC_URI
> = "http://picocom.googlecode.com/files/picocom-1.6.tar.gz" 
> CPPFLAGS_append = '-DVERSION_STR=\\"${PV}\\"
> -DUUCP_LOCK_DIR=\\"/var/lock\\" -DHIGH_BAUD'
> 
> do_install () { -	install -d ${D}${bindir} -	install -m 0755 ${PN} pcasc
> pcxm pcym pczm ${D}${bindir}/ +    install -d ${D}${bindir} +    install
> -m 0755 ${PN} pcasc pcxm pcym pczm ${D}${bindir}/ }
> 
> SRC_URI[md5sum] = "426c3d30b82cbc80b0dafdccd6020c6c" diff --git
> a/meta-oe/recipes-support/pidgin/pidgin.inc
> b/meta-oe/recipes-support/pidgin/pidgin.inc index 340e7f2..b1ba182
> 100644 --- a/meta-oe/recipes-support/pidgin/pidgin.inc +++
> b/meta-oe/recipes-support/pidgin/pidgin.inc @@ -8,21 +8,21 @@ INC_PR =
> "r3" inherit autotools gettext pkgconfig gconf perlnative
> 
> EXTRA_OECONF = " \ -		--enable-vv \ -		--disable-perl \ -		--disable-tcl
> \ -		--disable-gevolution \ -		--disable-schemas-install \ -
> --x-includes=${STAGING_INCDIR} \ -		--x-libraries=${STAGING_LIBDIR} \ -
> --enable-gnutls=yes \ -		--with-ncurses-headers=${STAGING_INCDIR} \ -
> --with-gnutls-includes=${STAGING_INCDIR} \ -
> --with-gnutls-libs=${STAGING_LIBDIR} \ -		" +        --enable-vv \ +
> --disable-perl \ +        --disable-tcl \ +        --disable-gevolution
> \ +        --disable-schemas-install \ +
> --x-includes=${STAGING_INCDIR} \ +        --x-libraries=${STAGING_LIBDIR}
> \ +        --enable-gnutls=yes \ +
> --with-ncurses-headers=${STAGING_INCDIR} \ +
> --with-gnutls-includes=${STAGING_INCDIR} \ +
> --with-gnutls-libs=${STAGING_LIBDIR} \ +        "
> 
> do_configure_prepend() { -	touch ${S}/po/Makefile +    touch
> ${S}/po/Makefile }
> 
> OE_LT_RPATH_ALLOW=":${libdir}/purple-2:" @@ -50,7 +50,7 @@
> FILES_finch-dbg      = "${bindir}/.debug/finch \ ${libdir}/finch/.debug"
> 
> FILES_${PN} = "${bindir} ${datadir}/${PN} ${libdir}/${PN}/*.so \ -
> ${datadir}/applications" +           ${datadir}/applications" 
> RRECOMMENDS_${PN} = "${PN}-data libpurple-plugin-ssl-gnutls
> libpurple-protocol-irc libpurple-protocol-xmpp"
> 
> FILES_${PN}-data = "${datadir}/pixmaps ${datadir}/sounds
> ${datadir}/icons" diff --git
> a/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
> b/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb index d229c15..3ce3cc3
> 100644 --- a/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb +++
> b/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb @@ -4,20 +4,20 @@ PR =
> "${INC_PR}.3" DEPENDS += "farsight2 libidn"
> 
> SRC_URI = "\ -  ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \ -
> file://sanitize-configure.ac.patch \ -
> file://pidgin.desktop-set-icon.patch \ -
> file://purple-OE-branding-25.patch \ -
> file://pidgin-cross-python-265.patch \ +
> ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \ +
> file://sanitize-configure.ac.patch \ +
> file://pidgin.desktop-set-icon.patch \ +
> file://purple-OE-branding-25.patch \ +
> file://pidgin-cross-python-265.patch \ "
> 
> SRC_URI[md5sum] = "9bc6cf953ed7d383b215fa8487bf8829" SRC_URI[sha256sum] =
> "9722d7f199a6704e29900c80f270d9409d5c28caab77f495b68108d81ba3e19e"
> 
> EXTRA_OECONF += "\ -  --disable-gtkspell \ -  --disable-meanwhile \ -
> --disable-nm \ -  --disable-screensaver \ -  --enable-nss=no \ +
> --disable-gtkspell \ +    --disable-meanwhile \ +    --disable-nm \ +
> --disable-screensaver \ +    --enable-nss=no \ " diff --git
> a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
> b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb index
> 59f22df..bec8236 100644 ---
> a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb +++
> b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb @@ -10,13 +10,13 @@
> SRC_URI[md5sum] = "980bd6d9a3830fdce746d7fe3c9166ee" SRC_URI[sha256sum] =
> "77f0a039ac64df55fbd06af6f872fdbad4f639d009bbb5cd5cbe4db25690f35f"
> 
> do_compile() { -	oe_runmake -f Makefile.unx
> INCS=-I${STAGING_DIR_HOST}${incdir}
> LIBS=${STAGING_DIR_HOST}${libdir}/libz.a +    oe_runmake -f Makefile.unx
> INCS=-I${STAGING_DIR_HOST}${incdir}
> LIBS=${STAGING_DIR_HOST}${libdir}/libz.a }
> 
> do_install() { -	install -d ${D}${bindir} -	install pngcheck
> ${D}${bindir} -	install png-fix-IDAT-windowsize ${D}${bindir} -	install
> pngsplit ${D}${bindir} +    install -d ${D}${bindir} +    install
> pngcheck ${D}${bindir} +    install png-fix-IDAT-windowsize
> ${D}${bindir} +    install pngsplit ${D}${bindir} }
> 
> diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb
> b/meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb index
> cbb02b4..56a30e4 100644 ---
> a/meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb +++
> b/meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb @@ -11,7 +11,7 @@
> do_compile() { }
> 
> do_install() { -	oe_runmake install DESTDIR=${D} +    oe_runmake install
> DESTDIR=${D} }
> 
> FILES_${PN} += "${datadir}" diff --git
> a/meta-oe/recipes-support/poppler/poppler.inc
> b/meta-oe/recipes-support/poppler/poppler.inc index a624c1b..d0c0074
> 100644 --- a/meta-oe/recipes-support/poppler/poppler.inc +++
> b/meta-oe/recipes-support/poppler/poppler.inc @@ -8,11 +8,11 @@ SRC_URI =
> "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz" inherit autotools
> pkgconfig
> 
> EXTRA_OECONF = "\ -  --enable-xpdf-headers \ -  --disable-gtk-test \ -
> --disable-poppler-qt \ -  --disable-poppler-qt4 \ -  --enable-zlib \ +
> --enable-xpdf-headers \ +    --disable-gtk-test \ +
> --disable-poppler-qt \ +    --disable-poppler-qt4 \ +    --enable-zlib \ 
> "
> 
> # check for TARGET_FPU=soft and inform configure of the result so it can
> disable some floating points diff --git
> a/meta-oe/recipes-support/postgresql/postgresql.inc
> b/meta-oe/recipes-support/postgresql/postgresql.inc index
> 4e7aec2..4fda67b 100644 ---
> a/meta-oe/recipes-support/postgresql/postgresql.inc +++
> b/meta-oe/recipes-support/postgresql/postgresql.inc @@ -22,7 +22,7 @@
> EXTRA_OECONF_sh4 = "--disable-spinlocks --disable-rpath" 
> EXTRA_OECONF_aarch64 += "--disable-spinlocks"
> 
> do_compile_append() { -         cp /usr/sbin/zic ${S}/src/timezone/ +
> cp /usr/sbin/zic ${S}/src/timezone/ }
> 
> SSTATE_SCAN_FILES += "Makefile.global" diff --git
> a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
> b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb index d5a5b4b..3241b83
> 100644 --- a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb +++
> b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb @@ -17,8 +17,8 @@
> do_compile() { }
> 
> do_install() { -	install -d ${D}${sbindir}/ -	install -m 0755 pxaregs
> ${D}${sbindir}/ +    install -d ${D}${sbindir}/ +    install -m 0755
> pxaregs ${D}${sbindir}/ }
> 
> SRC_URI[md5sum] = "a43baa88842cd5926dbffb6fb87624f6" diff --git
> a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb index ef753cf..cccc6a5
> 100644 --- a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb +++
> b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb @@ -13,13 +13,13 @@
> SRC_URI[sha256sum] =
> "1126f0ecc8cab3af14a562cddc5d8ffeef47df7eba34a7aadcdee35a25 inherit
> autotools update-rc.d
> 
> do_install_append() { -        install -d "${D}${sysconfdir}/init.d" -
> install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools -
> sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir},' \ -
> ${D}${sysconfdir}/init.d/rng-tools +    install -d
> "${D}${sysconfdir}/init.d" +    install -m 0755 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/rng-tools +    sed -i -e
> 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir},' \ +
> ${D}${sysconfdir}/init.d/rng-tools
> 
> -        install -d "${D}${sysconfdir}/default" -        install -m 0644
> ${WORKDIR}/default ${D}${sysconfdir}/default +    install -d
> "${D}${sysconfdir}/default" +    install -m 0644 ${WORKDIR}/default
> ${D}${sysconfdir}/default }
> 
> INITSCRIPT_NAME = "rng-tools" diff --git
> a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
> b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb index
> d465803..ca98ab5 100644 ---
> a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb +++
> b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb @@ -11,10
> +11,10 @@ SRC_URI =
> "svn://svn.openmoko.org/trunk/src/target;module=gpio;protocol=http" S =
> "${WORKDIR}/gpio"
> 
> do_compile() { -	${CC} ${CFLAGS} ${LDFLAGS} -static -o ${PN} gpio.c +
> ${CC} ${CFLAGS} ${LDFLAGS} -static -o ${PN} gpio.c }
> 
> do_install() { -	install -d ${D}${sbindir} -	install -m 0755 ${PN}
> ${D}${sbindir} +    install -d ${D}${sbindir} +    install -m 0755 ${PN}
> ${D}${sbindir} } diff --git
> a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
> b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb index
> 96285e9..a0dbef4 100644 ---
> a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb +++
> b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb @@ -11,10
> +11,10 @@ SRC_URI =
> "svn://svn.openmoko.org/trunk/src/target;module=gpio;protocol=http" S =
> "${WORKDIR}/gpio"
> 
> do_compile() { -	${CC} ${CFLAGS} ${LDFLAGS} -static -o ${PN}
> gpio-s3c6410.c +    ${CC} ${CFLAGS} ${LDFLAGS} -static -o ${PN}
> gpio-s3c6410.c }
> 
> do_install() { -	install -d ${D}${sbindir} -	install -m 0755 ${PN}
> ${D}${sbindir} +    install -d ${D}${sbindir} +    install -m 0755 ${PN}
> ${D}${sbindir} } diff --git
> a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
> b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb 
> index 9e0c087..a6ec087 100644 ---
> a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb 
> +++
> b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb 
> @@ -16,17 +16,17 @@ do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}" 
> CFLAGS += "-DLINUX_PPDEV"
> 
> do_compile() { -	oe_runmake +    oe_runmake }
> 
> do_install() { -        install -d ${D}/${bindir} -        install -m
> 0755 sjf2410 ${D}/${bindir} +    install -d ${D}/${bindir} +    install
> -m 0755 sjf2410 ${D}/${bindir} }
> 
> do_deploy() { -        install -d ${DEPLOY_DIR_TOOLS} -        install -m
> 0755 sjf2410 ${DEPLOY_DIR_TOOLS}/sjf2410-${PV} +    install -d
> ${DEPLOY_DIR_TOOLS} +    install -m 0755 sjf2410
> ${DEPLOY_DIR_TOOLS}/sjf2410-${PV} }
> 
> addtask deploy before do_build after do_install diff --git
> a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb
> b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb index 733bb9e..54b59bf
> 100644 --- a/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb +++
> b/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb @@ -8,9 +8,9 @@
> LIC_FILES_CHKSUM =
> "file://src/main.c;beginline=1;endline=10;md5=e98469a8efa024a PR = "r7"
> 
> SRC_URI = "http://www.hwaci.com/sw/sqlite/sqlite-${PV}.tar.gz \ -
> file://mainmk_build_dynamic.patch \ -       file://mainmk_no_tcl.patch \ 
> -       file://sqlite.pc" +    file://mainmk_build_dynamic.patch \ +
> file://mainmk_no_tcl.patch \ +    file://sqlite.pc"
> 
> SOURCES = "attach.o auth.o btree.o btree_rb.o build.o copy.o date.o
> delete.o \ expr.o func.o hash.o insert.o main.o opcodes.o os.o pager.o \ 
> @@ -26,27 +26,27 @@ do_configure() { }
> 
> do_compile() { -	oe_runmake -f Makefile.linux-gcc \ -
> TOP="${S}" \ -                   BCC="${BUILD_CC}" \ -
> TCC="${CC}" \ -                   OPTS="-fPIC -D'INTPTR_TYPE=int'" \ -
> TCL_FLAGS= LIBTCL= \ -
> READLINE_FLAGS="-DHAVE_READLINE=1 -I${STAGING_INCDIR}" \ -
> LIBREADLINE="-L. -L${STAGING_LIBDIR} -lreadline -lncurses" +
> oe_runmake -f Makefile.linux-gcc \ +             TOP="${S}" \ +
> BCC="${BUILD_CC}" \ +             TCC="${CC}" \ +             OPTS="-fPIC
> -D'INTPTR_TYPE=int'" \ +             TCL_FLAGS= LIBTCL= \ +
> READLINE_FLAGS="-DHAVE_READLINE=1 -I${STAGING_INCDIR}" \ +
> LIBREADLINE="-L. -L${STAGING_LIBDIR} -lreadline -lncurses" }
> 
> do_install() { -	install -d ${D}${libdir} ${D}${bindir} -	install sqlite
> ${D}${bindir} -	install -m 0755 libsqlite.so
> ${D}${libdir}/libsqlite.so.0.8.6 -	ln -sf libsqlite.so.0.8.6
> ${D}${libdir}/libsqlite.so -        ln -sf libsqlite.so.0.8.6
> ${D}${libdir}/libsqlite.so.0 -        ln -sf libsqlite.so.0.8.6
> ${D}${libdir}/libsqlite.so.0.8 -        install -d ${D}${includedir} -
> install -m 0644 sqlite.h ${D}${includedir}/sqlite.h -        install -d
> ${D}${libdir}/pkgconfig -        install -m 0644 ${S}/sqlite.pc
> ${D}${libdir}/pkgconfig/sqlite.pc +    install -d ${D}${libdir}
> ${D}${bindir} +    install sqlite ${D}${bindir} +    install -m 0755
> libsqlite.so ${D}${libdir}/libsqlite.so.0.8.6 +    ln -sf
> libsqlite.so.0.8.6 ${D}${libdir}/libsqlite.so +    ln -sf
> libsqlite.so.0.8.6 ${D}${libdir}/libsqlite.so.0 +    ln -sf
> libsqlite.so.0.8.6 ${D}${libdir}/libsqlite.so.0.8 +    install -d
> ${D}${includedir} +    install -m 0644 sqlite.h
> ${D}${includedir}/sqlite.h +    install -d ${D}${libdir}/pkgconfig +
> install -m 0644 ${S}/sqlite.pc ${D}${libdir}/pkgconfig/sqlite.pc }
> 
> PACKAGES += "${PN}-bin" diff --git
> a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
> b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
>
> 
index 9b1084a..f8a1ef4 100644
> ---
> a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
>
> 
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
> @@ -15,17 +15,17 @@ inherit autotools gettext S =
> "${WORKDIR}/dpkg-${PV}"
> 
> EXTRA_OECONF = " \ -  --with-start-stop-daemon \ -  --without-bz2 \ -
> --without-deselect \ -  --without-install-info \ -  --without-selinux \ -
> --without-update-alternatives \ +    --with-start-stop-daemon \ +
> --without-bz2 \ +    --without-deselect \ +    --without-install-info \ +
> --without-selinux \ +    --without-update-alternatives \ "
> 
> do_install_append () { -  # remove everything that is not related to
> start-stop-daemon, since there -  # is no explicit rule for only
> installing ssd -  find ${D} -type f -not -name "*start-stop-daemon*"
> -exec rm {} \; -  find ${D} -depth -type d -empty -exec rmdir {} \; +
> # remove everything that is not related to start-stop-daemon, since
> there +    # is no explicit rule for only installing ssd +    find ${D}
> -type f -not -name "*start-stop-daemon*" -exec rm {} \; +    find ${D}
> -depth -type d -empty -exec rmdir {} \; } diff --git
> a/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
> b/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb index
> 2713f5b..eb49494 100644 ---
> a/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb +++
> b/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb @@ -12,8 +12,8
> @@ SRC_URI[md5sum] = "c8b861305def7c0abae04f7bbefec212" 
> SRC_URI[sha256sum] =
> "efc13c86e715b5e596d9d8535640c830f83e977fe521afd2c70d68926c4b573e"
> 
> EXTRA_OECONF = "--disable-curl --disable-soup --disable-ldap \ -
> --enable-gmp --disable-mysql --disable-sqlite \ -		--enable-openssl" +
> --enable-gmp --disable-mysql --disable-sqlite \ +
> --enable-openssl"
> 
> EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd',
> '--with-systemdsystemunitdir=${systemd_unitdir}/system/',
> '--without-systemdsystemunitdir', d)}"
> 
> diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
> b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb index b8d1e6c..02a24b7
> 100644 --- a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb +++
> b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb @@ -16,7 +16,7 @@ S =
> "${WORKDIR}/${PN}-${PV}-Source" inherit cmake
> 
> do_install() { -	install -d ${D}/usr/bin -	install -m 0755
> ${S}/bin/synergy* ${D}/usr/bin/ +    install -d ${D}/usr/bin +    install
> -m 0755 ${S}/bin/synergy* ${D}/usr/bin/ }
> 
> diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
> b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb index 6aa5a9e..15021d5
> 100644 --- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb +++
> b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb @@ -17,21 +17,21 @@ PR =
> "r2"
> 
> # autoreconf doesn't work well while reconfiguring included libreplace 
> do_configure () { -       gnu-configize -       oe_runconf +
> gnu-configize +    oe_runconf }
> 
> do_install_prepend() { -       # Hack the way swig interface for talloc
> is installed -       # This hack is accompanied by
> install-swig-interface-in-SWINGLIBDIR.patch -       type swig > /dev/null
> 2>&1 && SWIGLIBDIR=`swig -swiglib` &&
> SWIGLIBDIR=${SWIGLIBDIR##${STAGING_DIR_NATIVE}} && export SWIGLIBDIR ||
> echo "No swig found" +    # Hack the way swig interface for talloc is
> installed +    # This hack is accompanied by
> install-swig-interface-in-SWINGLIBDIR.patch +    type swig > /dev/null
> 2>&1 && SWIGLIBDIR=`swig -swiglib` &&
> SWIGLIBDIR=${SWIGLIBDIR##${STAGING_DIR_NATIVE}} && export SWIGLIBDIR ||
> echo "No swig found" }
> 
> do_install_append() { -       install -d ${D}${libdir} -       ln -s
> libtalloc.so.2.0.1 ${D}${libdir}/libtalloc.so.2.0 -       ln -s
> libtalloc.so.2.0 ${D}${libdir}/libtalloc.so.2 -       ln -s
> libtalloc.so.2 ${D}${libdir}/libtalloc.so +    install -d ${D}${libdir} +
> ln -s libtalloc.so.2.0.1 ${D}${libdir}/libtalloc.so.2.0 +    ln -s
> libtalloc.so.2.0 ${D}${libdir}/libtalloc.so.2 +    ln -s libtalloc.so.2
> ${D}${libdir}/libtalloc.so }
> 
> PACKAGES += "${PN}-swig" diff --git
> a/meta-oe/recipes-support/tbb/tbb_4.1.bb
> b/meta-oe/recipes-support/tbb/tbb_4.1.bb index 48427ee..1dfcad3 100644 
> --- a/meta-oe/recipes-support/tbb/tbb_4.1.bb +++
> b/meta-oe/recipes-support/tbb/tbb_4.1.bb @@ -1,8 +1,8 @@ DESCRIPTION =
> "Parallelism library for C++ - runtime files \ - TBB is a library that
> helps you leverage multi-core processor \ - performance without having to
> be a threading expert. It represents a \ - higher-level, task-based
> parallelism that abstracts platform details \ - and threading mechanism
> for performance and scalability." +    TBB is a library that helps you
> leverage multi-core processor \ +    performance without having to be a
> threading expert. It represents a \ +    higher-level, task-based
> parallelism that abstracts platform details \ +    and threading
> mechanism for performance and scalability." HOMEPAGE =
> "http://threadingbuildingblocks.org/" LICENSE = "GPLv2" LIC_FILES_CHKSUM
> = "file://COPYING;md5=2c7f2caf277a3933e3acdf7f89d54cc1" diff --git
> a/meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb
> b/meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb index d3ca24f..1da8194
> 100644 --- a/meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb +++
> b/meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb @@ -6,11 +6,11 @@
> SECTION = "console/network" DEPENDS = "libpcap"
> 
> SRC_URI = " \ -	http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \ -
> file://tcpdump_configure_no_-O2.patch \ -
> file://0001-minimal-IEEE802.15.4-allowed.patch \ -
> file://ipv6-cross.patch \ -	file://configure.patch \ +
> http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \ +
> file://tcpdump_configure_no_-O2.patch \ +
> file://0001-minimal-IEEE802.15.4-allowed.patch \ +
> file://ipv6-cross.patch \ +    file://configure.patch \ " SRC_URI[md5sum]
> = "a3fe4d30ac85ff5467c889ff46b7e1e8" SRC_URI[sha256sum] =
> "efd08b610210d39977ec3175fa82dad9fbd33587930081be2a905a712dba4286" @@
> -19,25 +19,25 @@ inherit autotools CACHED_CONFIGUREVARS =
> "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
> 
> EXTRA_OECONF = "--without-crypto --disable-rpath \ -
> ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6',
> '--disable-ipv6', d)}" +        ${@base_contains('DISTRO_FEATURES',
> 'ipv6', '--enable-ipv6', '--disable-ipv6', d)}"
> 
> EXTRA_AUTORECONF += " -I m4"
> 
> do_configure_prepend() { -	mkdir -p ${S}/m4 -	if [ -f aclocal.m4 ]; then 
> -		mv aclocal.m4 ${S}/m4 -	fi -	# AC_CHECK_LIB(dlpi.. was looking to host
> /lib -	sed -i 's:-L/lib::g' ./configure.in +    mkdir -p ${S}/m4 +    if
> [ -f aclocal.m4 ]; then +        mv aclocal.m4 ${S}/m4 +    fi +    #
> AC_CHECK_LIB(dlpi.. was looking to host /lib +    sed -i 's:-L/lib::g'
> ./configure.in } do_configure_append() { -	sed -i 's:-L/usr/lib::'
> ./Makefile -	sed -i 's:-Wl,-rpath,${STAGING_LIBDIR}::' ./Makefile -	sed
> -i 's:-I/usr/include::' ./Makefile +    sed -i 's:-L/usr/lib::'
> ./Makefile +    sed -i 's:-Wl,-rpath,${STAGING_LIBDIR}::' ./Makefile +
> sed -i 's:-I/usr/include::' ./Makefile }
> 
> do_install_append() { -	# tcpdump 4.0.0 installs a copy to
> /usr/sbin/tcpdump.4.0.0 -	rm -f ${D}${sbindir}/tcpdump.${PV} +    #
> tcpdump 4.0.0 installs a copy to /usr/sbin/tcpdump.4.0.0 +    rm -f
> ${D}${sbindir}/tcpdump.${PV} } diff --git
> a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb index
> baaac29..5c5fab9 100644 ---
> a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb +++
> b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb @@ -14,14 +14,14 @@
> S = "${WORKDIR}/git" inherit gitpkgv pkgconfig
> 
> do_compile() { -	oe_runmake \ -		CC="${CC}" \ -		CFLAGS="`pkg-config
> --cflags vte`${CFLAGS}" \ -		LDFLAGS="`pkg-config --libs vte`
> ${LDFLAGS}" +    oe_runmake \ +        CC="${CC}" \ +
> CFLAGS="`pkg-config --cflags vte`${CFLAGS}" \ +
> LDFLAGS="`pkg-config --libs vte` ${LDFLAGS}" }
> 
> do_install() { -	oe_runmake PREFIX="${prefix}" DESTDIR="${D}" install +
> oe_runmake PREFIX="${prefix}" DESTDIR="${D}" install }
> 
> RDEPENDS_${PN}_append_libc-glibc += "glibc-gconv-ibm437" diff --git
> a/meta-oe/recipes-support/upower/upower_0.9.14.bb
> b/meta-oe/recipes-support/upower/upower_0.9.14.bb index 5a33ab9..e643c07
> 100644 --- a/meta-oe/recipes-support/upower/upower_0.9.14.bb +++
> b/meta-oe/recipes-support/upower/upower_0.9.14.bb @@ -15,9 +15,9 @@
> inherit autotools pkgconfig gettext EXTRA_OECONF = "
> --with-backend=linux"
> 
> do_configure_prepend() { -	sed -i -e s:-nonet:\:g
> ${S}/doc/man/Makefile.am -	sed -i -e 's: doc : :g' ${S}/Makefile.am -} +
> sed -i -e s:-nonet:\:g ${S}/doc/man/Makefile.am +    sed -i -e 's: doc :
> :g' ${S}/Makefile.am +}
> 
> 
> RRECOMMENDS_${PN} += "pm-utils" diff --git
> a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20121109.bb
> b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20121109.bb 
> index 8a6fc13..de81812 100644 ---
> a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20121109.bb 
> +++
> b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20121109.bb 
> @@ -9,7 +9,7 @@ SRC_URI[md5sum] = "a7d23a03157871013a0d708ab2b1b6df" 
> SRC_URI[sha256sum] =
> "a74346a471d540ba9da7d7b332ad35ea05ff7375297c0da87da5be675293d5a5"
> 
> do_install() { -	oe_runmake install DESTDIR=${D} +    oe_runmake install
> DESTDIR=${D} }
> 
> RDEPENDS_${PN} = "usb-modeswitch" diff --git
> a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.5.bb
> b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.5.bb index
> b0c9e95..fe6ea62 100644 ---
> a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.5.bb +++
> b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.5.bb @@ -11,8
> +11,8 @@ SRC_URI[md5sum] = "c393603908eceab95444c5bde790f6f0" 
> SRC_URI[sha256sum] =
> "ce47a3dec3e4c93e0a2fcea64278d0e289e6e78d8e1381c54f03986e443ab90f"
> 
> do_install() { -	sed 's_!/usr/bin_!'"${bindir}"'_' <usb_modeswitch.tcl
> >usb_modeswitch_dispatcher -	oe_runmake install DESTDIR=${D} +    sed
> 's_!/usr/bin_!'"${bindir}"'_' <usb_modeswitch.tcl
> >usb_modeswitch_dispatcher +    oe_runmake install DESTDIR=${D} }
> 
> FILES_${PN} = "${bindir} ${sysconfdir} ${base_libdir}/udev/usb_modeswitch
> ${sbindir} ${localstatedir}/lib/usb_modeswitch" diff --git
> a/meta-oe/recipes-support/vim/vim.inc
> b/meta-oe/recipes-support/vim/vim.inc index 4fa8f7c..e288fff 100644 ---
> a/meta-oe/recipes-support/vim/vim.inc +++
> b/meta-oe/recipes-support/vim/vim.inc @@ -12,10 +12,10 @@ VIMDIR =
> "${PN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[ 
> INC_PR = "r13"
> 
> SRC_URI = " \ -
> ftp://ftp.${PN}.org/pub/${PN}/unix/${PN}-${PV_MAJOR}.tar.bz2;name=${VIMDIR}
> \ -
> ftp://ftp.${PN}.org/pub/${PN}/extra/${PN}-${PV_MAJOR}-extra.tar.gz;name=${VIMDIR}-extra
> \ -
> ftp://ftp.${PN}.org/pub/${PN}/extra/${PN}-${PV_MAJOR}-lang.tar.gz;name=${VIMDIR}-lang
> \ -  file://vimrc \ +
> ftp://ftp.${PN}.org/pub/${PN}/unix/${PN}-${PV_MAJOR}.tar.bz2;name=${VIMDIR}
> \ +
> ftp://ftp.${PN}.org/pub/${PN}/extra/${PN}-${PV_MAJOR}-extra.tar.gz;name=${VIMDIR}-extra
> \ +
> ftp://ftp.${PN}.org/pub/${PN}/extra/${PN}-${PV_MAJOR}-lang.tar.gz;name=${VIMDIR}-lang
> \ +    file://vimrc \ "
> 
> S = "${WORKDIR}/${VIMDIR}/src" @@ -24,13 +24,13 @@ inherit autotools
> update-alternatives
> 
> # vim configure.in contains functions which got 'dropped' by
> autotools.bbclass do_configure () { -  rm -f auto/* -  touch
> auto/config.mk -  aclocal -  autoconf -  oe_runconf -  touch
> auto/configure -  touch auto/config.mk auto/config.h +    rm -f auto/* +
> touch auto/config.mk +    aclocal +    autoconf +    oe_runconf +
> touch auto/configure +    touch auto/config.mk auto/config.h }
> 
> #Available PACKAGECONFIG options are gtkgui, x11, tiny @@ -41,25 +41,25
> @@ PACKAGECONFIG[x11] = "--with-x,--without-x,xt," PACKAGECONFIG[tiny] =
> "--with-features=tiny,--with-features=big,,"
> 
> EXTRA_OECONF = " \ -  --disable-gpm \ -  --disable-gtktest \ -
> --disable-xim \ -  --disable-netbeans \ -  --with-tlib=ncurses \ -
> ac_cv_small_wchar_t=no \ -  vim_cv_getcwd_broken=no \ -
> vim_cv_memmove_handles_overlap=yes \ -  vim_cv_stat_ignores_slash=no \ -
> vim_cv_terminfo=yes \ -  vim_cv_tgent=non-zero \ -
> vim_cv_toupper_broken=no \ -  vim_cv_tty_group=world \ +    --disable-gpm
> \ +    --disable-gtktest \ +    --disable-xim \ +    --disable-netbeans
> \ +    --with-tlib=ncurses \ +    ac_cv_small_wchar_t=no \ +
> vim_cv_getcwd_broken=no \ +    vim_cv_memmove_handles_overlap=yes \ +
> vim_cv_stat_ignores_slash=no \ +    vim_cv_terminfo=yes \ +
> vim_cv_tgent=non-zero \ +    vim_cv_toupper_broken=no \ +
> vim_cv_tty_group=world \ "
> 
> # Work around rpm picking up csh as a dep do_install_append() { -	chmod
> -x ${D}${datadir}/${PN}/${VIMDIR}/tools/vim132 -	install -m 0644
> ${WORKDIR}/vimrc ${D}/${datadir}/${PN} +    chmod -x
> ${D}${datadir}/${PN}/${VIMDIR}/tools/vim132 +    install -m 0644
> ${WORKDIR}/vimrc ${D}/${datadir}/${PN} }
> 
> PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc
> ${PN}-data" diff --git
> a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
> b/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb index
> 6d1fa9a..6c9037b 100644 ---
> a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb +++
> b/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb @@ -12,7 +12,7 @@ S
> = "${WORKDIR}/AR6kSDK.build_sw.18/host/tools/wmiconfig" TARGET_CC_ARCH +=
> "${LDFLAGS}"
> 
> do_install() { -	install -d ${D}${bindir} -	install -m 0755 wmiconfig
> ${D}${bindir} +    install -d ${D}${bindir} +    install -m 0755
> wmiconfig ${D}${bindir} }
> 
> diff --git a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
> b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb index 70dc150..d0a868e
> 100644 --- a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb +++
> b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb @@ -9,15 +9,15 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b" 
> PR = "r1"
> 
> SRC_URI = "http://xchat.org/files/source/2.8/xchat-${PV}.tar.bz2 \ -
> file://glib-2.32.patch \ +    file://glib-2.32.patch \ "
> 
> inherit autotools gettext
> 
> EXTRA_OECONF = "\ -  --disable-perl \ -  --disable-python \ -
> --disable-tcl \ +    --disable-perl \ +    --disable-python \ +
> --disable-tcl \ " do_configure_prepend(){ rm -f ${S}/po/Makefile.in.in 
> diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb
> b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb index
> ef5224b..ba3490d 100644 ---
> a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb +++
> b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb @@ -8,8 +8,8 @@
> DEPENDS = "util-linux" PR = "r1"
> 
> SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz \ -
> file://remove-install-as-user.patch \ -
> file://drop-configure-check-for-aio.patch \ +
> file://remove-install-as-user.patch \ +
> file://drop-configure-check-for-aio.patch \ "
> 
> SRC_URI[md5sum] = "f70b2e7200d4c29f0af1cf70e7be1db6" @@ -27,16 +27,16 @@
> FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
> 
> EXTRA_OECONF = "--enable-gettext=no" do_configure () { -	# Prevent
> Makefile from calling configure without arguments, -	# when do_configure
> gets called for a second time. -	rm -f include/builddefs
> include/platform_defs.h -	# Recreate configure script. -	rm -f configure 
> -	oe_runmake configure -	# Configure. -	export DEBUG="-DNDEBUG" -
> gnu-configize --force -	oe_runconf +    # Prevent Makefile from calling
> configure without arguments, +    # when do_configure gets called for a
> second time. +    rm -f include/builddefs include/platform_defs.h +    #
> Recreate configure script. +    rm -f configure +    oe_runmake
> configure +    # Configure. +    export DEBUG="-DNDEBUG" +
> gnu-configize --force +    oe_runconf }
> 
> LIBTOOL = "${HOST_SYS}-libtool" @@ -45,13 +45,13 @@ TARGET_CC_ARCH +=
> "${LDFLAGS}" PARALLEL_MAKE = ""
> 
> do_install () { -	export DIST_ROOT=${D} -	oe_runmake install -	# needed
> for xfsdump -	oe_runmake install-dev -	rm ${D}${base_libdir}/libhandle.a 
> -	rm ${D}${base_libdir}/libhandle.la -	rm
> ${D}${base_libdir}/libhandle.so -	rm ${D}${libdir}/libhandle.so -	ln -s
> ../..${base_libdir}/libhandle.so.1 ${D}${libdir}/libhandle.so +    export
> DIST_ROOT=${D} +    oe_runmake install +    # needed for xfsdump +
> oe_runmake install-dev +    rm ${D}${base_libdir}/libhandle.a +    rm
> ${D}${base_libdir}/libhandle.la +    rm ${D}${base_libdir}/libhandle.so +
> rm ${D}${libdir}/libhandle.so +    ln -s
> ../..${base_libdir}/libhandle.so.1 ${D}${libdir}/libhandle.so } diff
> --git a/meta-ruby/recipes-devtools/ruby/ruby.inc
> b/meta-ruby/recipes-devtools/ruby/ruby.inc index 894e3e6..becf64c 100644 
> --- a/meta-ruby/recipes-devtools/ruby/ruby.inc +++
> b/meta-ruby/recipes-devtools/ruby/ruby.inc @@ -8,10 +8,10 @@ HOMEPAGE =
> "http://www.ruby-lang.org/" SECTION = "devel/ruby" LICENSE = "Ruby | BSD
> | GPLv2" LIC_FILES_CHKSUM = "\ -
> file://COPYING;md5=837b32593517ae48b9c3b5c87a5d288c \ -
> file://BSDL;md5=3949e007205deef714bd225e1ee4a8ea \ -
> file://GPL;md5=393a5ca445f6965873eca0259a17f833 \ -
> file://LEGAL;md5=e88686821918c0b6d2b1b8328116cec5 \ +
> file://COPYING;md5=837b32593517ae48b9c3b5c87a5d288c \ +
> file://BSDL;md5=3949e007205deef714bd225e1ee4a8ea \ +
> file://GPL;md5=393a5ca445f6965873eca0259a17f833 \ +
> file://LEGAL;md5=e88686821918c0b6d2b1b8328116cec5 \ "
> 
> DEPENDS = "ruby-native zlib openssl tcl" @@ -38,6 +38,6 @@ inherit
> autotools # built.
> 
> do_configure_prepend() { -	sed -i "s#%%TARGET_CFLAGS%%#$TARGET_CFLAGS#;
> s#%%TARGET_LDFLAGS%%#$TARGET_LDFLAGS#" ${S}/common.mk -	rm -rf
> ${S}/ruby/ +    sed -i "s#%%TARGET_CFLAGS%%#$TARGET_CFLAGS#;
> s#%%TARGET_LDFLAGS%%#$TARGET_LDFLAGS#" ${S}/common.mk +    rm -rf
> ${S}/ruby/ } diff --git
> a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb
> b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb index
> b9f7915..6611ce1 100644 ---
> a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb +++
> b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb @@ -4,40 +4,40 @@ PR
> = "${INC_PR}.0" DEPENDS += "libyaml"
> 
> SRC_URI += "\ -
> file://0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch \ 
> -  file://ruby-1.9.3-always-use-i386.patch \ -
> file://ruby-1.9.3-disable-versioned-paths.patch \ -
> file://ruby-1.9.3-fix-s390x-build.patch \ -
> file://ruby-1.9.3-rubygems-1.8.11-uninstaller.patch \ -
> file://ruby-1.9.3-webrick-test-fix.patch \ -
> file://ruby-1.9.3-bignum-test-fix.patch \ -
> file://ruby-1.9.3-custom-rubygems-location.patch \ -
> file://rubygems-1.8.11-binary-extensions.patch \ -
> file://ruby-1.9.3-mkmf-verbose.patch \ -
> file://ruby-1.9.3-install-cross.patch \ +
> file://0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch \ 
> +    file://ruby-1.9.3-always-use-i386.patch \ +
> file://ruby-1.9.3-disable-versioned-paths.patch \ +
> file://ruby-1.9.3-fix-s390x-build.patch \ +
> file://ruby-1.9.3-rubygems-1.8.11-uninstaller.patch \ +
> file://ruby-1.9.3-webrick-test-fix.patch \ +
> file://ruby-1.9.3-bignum-test-fix.patch \ +
> file://ruby-1.9.3-custom-rubygems-location.patch \ +
> file://rubygems-1.8.11-binary-extensions.patch \ +
> file://ruby-1.9.3-mkmf-verbose.patch \ +
> file://ruby-1.9.3-install-cross.patch \ "
> 
> SRC_URI[md5sum] = "bc0c715c69da4d1d8bd57069c19f6c0e" SRC_URI[sha256sum] =
> "46e2fa80be7efed51bd9cdc529d1fe22ebc7567ee0f91db4ab855438cf4bd8bb"
> 
> EXTRA_OECONF = "\ -  --enable-wide-getaddrinfo \ -
> --with-rubygemsdir=${datadir}/rubygems \ -  --disable-versioned-paths \ -
> --disable-rpath \ -  --enable-shared \ +    --enable-wide-getaddrinfo \ +
> --with-rubygemsdir=${datadir}/rubygems \ +    --disable-versioned-paths
> \ +    --disable-rpath \ +    --enable-shared \ "
> 
> EXTRA_OEMAKE = " \ -  LIBRUBYARG='-lruby-static' \ +
> LIBRUBYARG='-lruby-static' \ "
> 
> do_install() { -	if [ ${PN} = "ruby" ]; then -		oe_runmake 'DESTDIR=${D}'
> install install-cross -	else -		oe_runmake 'DESTDIR=${D}' install -	fi +
> if [ ${PN} = "ruby" ]; then +        oe_runmake 'DESTDIR=${D}' install
> install-cross +    else +        oe_runmake 'DESTDIR=${D}' install +
> fi }
> 
> FILES_${PN} += "${datadir}/rubygems \ diff --git
> a/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
> b/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend index
> 9d97025..36b83e0 100644 ---
> a/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend +++
> b/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend @@ -10,7
> +10,7 @@ RCONFLICTS_${PN} += "${PN}-systemd" SYSTEMD_SERVICE_${PN} =
> "${PN}.service"
> 
> do_install_append() { -	install -d ${D}${systemd_unitdir}/system -
> install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system +
> install -d ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system }
> 
> diff --git
> a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
> b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend 
> index 5fbe857..19f18f4 100644 ---
> a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend +++
> b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend @@
> -28,9 +28,9 @@ SRC_URI += "file://dhcpd.service \ file://dhcrelay.service
> \ " do_install_append() { -	install -d ${D}${systemd_unitdir}/system -
> install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system -
> install -m 0644 ${WORKDIR}/dhclient.service
> ${D}${systemd_unitdir}/system -	install -m 0644
> ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system +    install -d
> ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system +    install -m
> 0644 ${WORKDIR}/dhclient.service ${D}${systemd_unitdir}/system +
> install -m 0644 ${WORKDIR}/dhcrelay.service
> ${D}${systemd_unitdir}/system }
> 
> diff --git
> a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
> b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
>
> 
index d757c70..4789ad0 100644
> ---
> a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
>
> 
+++ b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
> @@ -13,9 +13,9 @@ inherit systemd
> 
> SRC_URI += "file://sshd.socket file://sshd@.service
> file://sshdgenkeys.service" do_install_append() { -	install -d
> ${D}${systemd_unitdir}/system -	install -m 0644 ${WORKDIR}/sshd.socket
> ${D}${systemd_unitdir}/system -	install -m 0644 ${WORKDIR}/sshd@.service
> ${D}${systemd_unitdir}/system -	install -m 0644
> ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system +    install
> -d ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system +    install -m
> 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system }
> 
> diff --git
> a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend
> b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend 
> index b7ab2a4..5efba3e 100644 ---
> a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend 
> +++
> b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbappend 
> @@ -12,7 +12,7 @@ SYSTEMD_AUTO_ENABLE = "disable"
> 
> SRC_URI_append = " file://portmap.service" do_install_append() { -
> install -d ${D}${systemd_unitdir}/system -	install -m 0644
> ${WORKDIR}/portmap.service ${D}${systemd_unitdir}/system +    install -d
> ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/portmap.service ${D}${systemd_unitdir}/system }
> 
> diff --git
> a/meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend
> b/meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend index
> 0699302..1c21104 100644 ---
> a/meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend +++
> b/meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend @@
> -12,12 +12,12 @@ SYSTEMD_PACKAGES = "${PN}-syslog" 
> SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
> 
> do_install_append() { -	install -d ${D}${systemd_unitdir}/system -	sed
> 's,@base_sbindir@,${base_sbindir},g' <
> ${WORKDIR}/busybox-syslog.service.in \ -	     >
> ${D}${systemd_unitdir}/system/busybox-syslog.service -	sed
> 's,@base_sbindir@,${base_sbindir},g' <
> ${WORKDIR}/busybox-klogd.service.in \ -	     >
> ${D}${systemd_unitdir}/system/busybox-klogd.service +    install -d
> ${D}${systemd_unitdir}/system +    sed
> 's,@base_sbindir@,${base_sbindir},g' <
> ${WORKDIR}/busybox-syslog.service.in \ +         >
> ${D}${systemd_unitdir}/system/busybox-syslog.service +    sed
> 's,@base_sbindir@,${base_sbindir},g' <
> ${WORKDIR}/busybox-klogd.service.in \ +         >
> ${D}${systemd_unitdir}/system/busybox-klogd.service
> 
> -	ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service +    ln
> -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service } 
> FILES_${PN}-syslog += "${systemd_unitdir}/system/syslog.service" diff
> --git
> a/meta-systemd/oe-core/recipes-core/dropbear/dropbear_2012.55.bbappend
> b/meta-systemd/oe-core/recipes-core/dropbear/dropbear_2012.55.bbappend 
> index 23e2820..edaa66e 100644 ---
> a/meta-systemd/oe-core/recipes-core/dropbear/dropbear_2012.55.bbappend 
> +++
> b/meta-systemd/oe-core/recipes-core/dropbear/dropbear_2012.55.bbappend @@
> -15,9 +15,9 @@ RCONFLICTS_${PN} += "${PN}-systemd" SYSTEMD_SERVICE_${PN}
> = "dropbear.socket"
> 
> do_install_append() { -	install -d ${D}${systemd_unitdir}/system -
> install -m 0644 ${WORKDIR}/dropbearkey.service
> ${D}${systemd_unitdir}/system -	install -m 0644
> ${WORKDIR}/dropbear@.service ${D}${systemd_unitdir}/system -	install -m
> 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_unitdir}/system -	ln -sf
> /dev/null ${D}${systemd_unitdir}/system/dropbear.service +    install -d
> ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/dropbearkey.service ${D}${systemd_unitdir}/system +    install
> -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_unitdir}/system +
> install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_unitdir}/system 
> +    ln -sf /dev/null ${D}${systemd_unitdir}/system/dropbear.service } 
> diff --git a/meta-systemd/oe-core/recipes-extended/at/at_3.1.13.bbappend
> b/meta-systemd/oe-core/recipes-extended/at/at_3.1.13.bbappend index
> 3d58a64..cae078a 100644 ---
> a/meta-systemd/oe-core/recipes-extended/at/at_3.1.13.bbappend +++
> b/meta-systemd/oe-core/recipes-extended/at/at_3.1.13.bbappend @@ -12,7
> +12,7 @@ RREPLACES_${PN} += "${PN}-systemd" RCONFLICTS_${PN} +=
> "${PN}-systemd" SYSTEMD_SERVICE_${PN} = "atd.service" do_install_append()
> { -	install -d ${D}${systemd_unitdir}/system -	install -m 0644
> ${WORKDIR}/atd.service ${D}${systemd_unitdir}/system +    install -d
> ${D}${systemd_unitdir}/system +    install -m 0644 ${WORKDIR}/atd.service
> ${D}${systemd_unitdir}/system }
> 
> diff --git
> a/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend
> b/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend 
> index dd1eacf..210c025 100644 ---
> a/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend +++
> b/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend @@
> -13,7 +13,7 @@ SYSTEMD_SERVICE_${PN} = "crond.service" SRC_URI +=
> "file://crond.service"
> 
> do_install_append() { -	install -d ${D}${systemd_unitdir}/system -
> install -m 0644 ${WORKDIR}/crond.service ${D}${systemd_unitdir}/system +
> install -d ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/crond.service ${D}${systemd_unitdir}/system }
> 
> diff --git
> a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
> b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
>
> 
index 6dded40..96fa989 100644
> ---
> a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
>
> 
+++ b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
> @@ -12,7 +12,7 @@ RCONFLICTS_${PN} += "${PN}-systemd" 
> SYSTEMD_SERVICE_${PN} = "lighttpd.service"
> 
> do_install_append() { -	install -d ${D}${systemd_unitdir}/system -
> install -m 0644 ${WORKDIR}/lighttpd.service
> ${D}${systemd_unitdir}/system +    install -d
> ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system }
> 
> diff --git
> a/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend
> b/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend index
> 640fa37..5b9181b 100644 ---
> a/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend +++
> b/meta-systemd/oe-core/recipes-extended/pam/libpam_1.1.6.bbappend @@ -2,5
> +2,5 @@ PRINC := "${@int(PRINC) + 2}"
> 
> # Register with logind to make screen/tmux/etc work do_install_append()
> { -	echo "session required	pam_systemd.so" >>
> ${D}${sysconfdir}/pam.d/common-session +    echo "session required
> pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session } diff --git
> a/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
> b/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend 
> index 6586809..9f83f65 100644 ---
> a/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend 
> +++
> b/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend @@
> -13,7 +13,7 @@ RCONFLICTS_${PN} += "${PN}-systemd" SYSTEMD_SERVICE_${PN}
> = "rpcbind.service"
> 
> do_install_append() { -	install -d ${D}${systemd_unitdir}/system -
> install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir}/system 
> +    install -d ${D}${systemd_unitdir}/system +    install -m 0644
> ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir}/system }
> 
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.3.bb
> b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.3.bb index
> 230510c..064e6bd 100644 ---
> a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.3.bb +++
> b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.3.bb @@ -18,26
> +18,26 @@ SRC_URI[md5sum] = "87aaf7bc7e8715f0455997bb8c6791aa" 
> SRC_URI[sha256sum] =
> "d82102b9c111f1892fb20a2bccf4370de579c6521b2f172ed0b36f2759fb249e"
> 
> do_configure () { -	./configure
> --with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ -
> --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \ -
> --prefix=${prefix} --datadir=${datadir}/apache2 +    ./configure
> --with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ +
> --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \ +
> --prefix=${prefix} --datadir=${datadir}/apache2 }
> 
> do_install () { -	install -d ${D}${bindir} ${D}${libdir} -	cp
> server/gen_test_char ${D}${bindir} -	install -m 755 support/apxs
> ${D}${bindir}/ -	install -m 755 httpd ${D}${bindir}/ -	install -d
> ${D}${datadir}/apache2/build -	cp build/*.mk
> ${D}${datadir}/apache2/build -	cp build/instdso.sh
> ${D}${datadir}/apache2/build - -	install -d ${D}${includedir}/apache2 -
> cp include/* ${D}${includedir}/apache2 -	cp os/unix/os.h
> ${D}${includedir}/apache2 -	cp os/unix/unixd.h ${D}${includedir}/apache2 
> - -	cp support/envvars-std ${D}${bindir}/envvars -	chmod 755
> ${D}${bindir}/envvars +    install -d ${D}${bindir} ${D}${libdir} +    cp
> server/gen_test_char ${D}${bindir} +    install -m 755 support/apxs
> ${D}${bindir}/ +    install -m 755 httpd ${D}${bindir}/ +    install -d
> ${D}${datadir}/apache2/build +    cp build/*.mk
> ${D}${datadir}/apache2/build +    cp build/instdso.sh
> ${D}${datadir}/apache2/build + +    install -d ${D}${includedir}/apache2 
> +    cp include/* ${D}${includedir}/apache2 +    cp os/unix/os.h
> ${D}${includedir}/apache2 +    cp os/unix/unixd.h
> ${D}${includedir}/apache2 + +    cp support/envvars-std
> ${D}${bindir}/envvars +    chmod 755 ${D}${bindir}/envvars }
> 
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb index
> a221e1d..a7f3586 100644 ---
> a/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb +++
> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb @@ -30,67 +30,67
> @@ inherit autotools update-rc.d CFLAGS_append = " -DPATH_MAX=4096" 
> CFLAGS_prepend = "-I${STAGING_INCDIR}/openssl " EXTRA_OECONF =
> "--enable-ssl \ -		--with-ssl=${STAGING_LIBDIR}/.. \ -
> --with-expat=${STAGING_LIBDIR}/.. \ -		--with-apr=${WORKDIR}/apr-1-config
> \ -		--with-apr-util=${WORKDIR}/apu-1-config \ -		--enable-info \ -
> --enable-rewrite \ -		--with-dbm=sdbm \ -		--with-berkeley-db=no \ -
> --localstatedir=/var/${PN} \ -		--with-gdbm=no \ -		--with-ndbm=no \ -
> --includedir=${includedir}/${PN} \ -		--datadir=${datadir}/${PN} \ -
> --sysconfdir=${sysconfdir}/${PN} \ -
> --libexecdir=${libdir}/${PN}/modules \ -		ap_cv_void_ptr_lt_long=no \ -
> --enable-mpms-shared \ -		ac_cv_have_threadsafe_pollset=no" +
> --with-ssl=${STAGING_LIBDIR}/.. \ +    --with-expat=${STAGING_LIBDIR}/..
> \ +    --with-apr=${WORKDIR}/apr-1-config \ +
> --with-apr-util=${WORKDIR}/apu-1-config \ +    --enable-info \ +
> --enable-rewrite \ +    --with-dbm=sdbm \ +    --with-berkeley-db=no \ +
> --localstatedir=/var/${PN} \ +    --with-gdbm=no \ +    --with-ndbm=no \ 
> +    --includedir=${includedir}/${PN} \ +    --datadir=${datadir}/${PN}
> \ +    --sysconfdir=${sysconfdir}/${PN} \ +
> --libexecdir=${libdir}/${PN}/modules \ +    ap_cv_void_ptr_lt_long=no \ +
> --enable-mpms-shared \ +    ac_cv_have_threadsafe_pollset=no"
> 
> do_configure_prepend() { -	# FIXME: this hack is required to work around
> an issue with apr/apr-util -	# Can be removed when fixed in OE-Core (also
> revert --with-* options above) -	# see
> http://bugzilla.yoctoproject.org/show_bug.cgi?id=3267 -	cp
> ${STAGING_BINDIR_CROSS}/apr-1-config ${STAGING_BINDIR_CROSS}/apu-1-config
> ${WORKDIR} -	sed -i -e 's:location=source:location=installed:'
> ${WORKDIR}/apr-1-config -	sed -i -e
> 's:location=source:location=installed:' ${WORKDIR}/apu-1-config +    #
> FIXME: this hack is required to work around an issue with apr/apr-util +
> # Can be removed when fixed in OE-Core (also revert --with-* options
> above) +    # see http://bugzilla.yoctoproject.org/show_bug.cgi?id=3267 +
> cp ${STAGING_BINDIR_CROSS}/apr-1-config
> ${STAGING_BINDIR_CROSS}/apu-1-config ${WORKDIR} +    sed -i -e
> 's:location=source:location=installed:' ${WORKDIR}/apr-1-config +    sed
> -i -e 's:location=source:location=installed:' ${WORKDIR}/apu-1-config }
> 
> do_install_append() { -	install -d ${D}/${sysconfdir}/init.d -	cat
> ${WORKDIR}/init | \ -		sed -e 's,/usr/sbin/,${sbindir}/,g' \ -		    -e
> 's,/usr/bin/,${bindir}/,g' \ -		    -e 's,/usr/lib,${libdir}/,g' \ -
> -e 's,/etc/,${sysconfdir}/,g' \ -		    -e 's,/usr/,${prefix}/,g' >
> ${D}/${sysconfdir}/init.d/${PN} -	chmod 755
> ${D}/${sysconfdir}/init.d/${PN} -	# remove the goofy original files... -
> rm -rf ${D}/${sysconfdir}/${PN}/original -	# Expat should be found in the
> staging area via DEPENDS... -	rm -f ${D}/${libdir}/libexpat.* - -	install
> -d ${D}${sysconfdir}/${PN}/conf.d -	install -d
> ${D}${sysconfdir}/${PN}/modules.d - -	# Ensure configuration file pulls
> in conf.d and modules.d -	printf "\nIncludeOptional
> ${sysconfdir}/${PN}/conf.d/*.conf" >>
> ${D}/${sysconfdir}/${PN}/httpd.conf -	printf "\nIncludeOptional
> ${sysconfdir}/${PN}/modules.d/*.conf\n\n" >>
> ${D}/${sysconfdir}/${PN}/httpd.conf +    install -d
> ${D}/${sysconfdir}/init.d +    cat ${WORKDIR}/init | \ +        sed -e
> 's,/usr/sbin/,${sbindir}/,g' \ +            -e 's,/usr/bin/,${bindir}/,g'
> \ +            -e 's,/usr/lib,${libdir}/,g' \ +            -e
> 's,/etc/,${sysconfdir}/,g' \ +            -e 's,/usr/,${prefix}/,g' >
> ${D}/${sysconfdir}/init.d/${PN} +    chmod 755
> ${D}/${sysconfdir}/init.d/${PN} +    # remove the goofy original
> files... +    rm -rf ${D}/${sysconfdir}/${PN}/original +    # Expat
> should be found in the staging area via DEPENDS... +    rm -f
> ${D}/${libdir}/libexpat.* + +    install -d
> ${D}${sysconfdir}/${PN}/conf.d +    install -d
> ${D}${sysconfdir}/${PN}/modules.d + +    # Ensure configuration file
> pulls in conf.d and modules.d +    printf "\nIncludeOptional
> ${sysconfdir}/${PN}/conf.d/*.conf" >>
> ${D}/${sysconfdir}/${PN}/httpd.conf +    printf "\nIncludeOptional
> ${sysconfdir}/${PN}/modules.d/*.conf\n\n" >>
> ${D}/${sysconfdir}/${PN}/httpd.conf }
> 
> SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
> 
> apache_sysroot_preprocess () { -	install -d
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ -	install -m 755
> ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}/ -	sed -i
> 's!my $installbuilddir = .*!my $installbuilddir =
> "${STAGING_DIR_HOST}/${datadir}/${PN}/build";!'
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs -	sed -i 's!my $libtool =
> .*!my $libtool = "${STAGING_BINDIR_CROSS}/${TARGET_PREFIX}libtool";!'
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs - -	sed -i 's!^APR_CONFIG =
> .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!'
> ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk -	sed -i
> 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!'
> ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk -	sed -i
> 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!'
> ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk +    install -d
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ +    install -m 755
> ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}/ +    sed -i
> 's!my $installbuilddir = .*!my $installbuilddir =
> "${STAGING_DIR_HOST}/${datadir}/${PN}/build";!'
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs +    sed -i 's!my $libtool
> = .*!my $libtool = "${STAGING_BINDIR_CROSS}/${TARGET_PREFIX}libtool";!'
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs + +    sed -i
> 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!'
> ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk +    sed -i
> 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!'
> ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk +    sed -i
> 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!'
> ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk }
> 
> # @@ -103,21 +103,21 @@ LEAD_SONAME = "libapr-1.so.0" PACKAGES =
> "${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
> 
> CONFFILES_${PN} = "${sysconfdir}/${PN}/httpd.conf \ -
> ${sysconfdir}/${PN}/magic \ -		   ${sysconfdir}/${PN}/mime.types \ -
> ${sysconfdir}/init.d/${PN} " +    ${sysconfdir}/${PN}/magic \ +
> ${sysconfdir}/${PN}/mime.types \ +    ${sysconfdir}/init.d/${PN} "
> 
> # we override here rather than append so that .so links are # included in
> the runtime package rather than here (-dev) # and to get build, icons,
> error into the -dev package FILES_${PN}-dev = "${datadir}/${PN}/build \ -
> ${datadir}/${PN}/icons \ -		${datadir}/${PN}/error \ -
> ${bindir}/apr-config ${bindir}/apu-config \ -		${libdir}/apr*.exp \ -
> ${includedir}/${PN} \ -		${libdir}/*.la \ -		${libdir}/*.a" +
> ${datadir}/${PN}/icons \ +    ${datadir}/${PN}/error \ +
> ${bindir}/apr-config ${bindir}/apu-config \ +    ${libdir}/apr*.exp \ +
> ${includedir}/${PN} \ +    ${libdir}/*.la \ +    ${libdir}/*.a"
> 
> # manual to manual FILES_${PN}-doc += " ${datadir}/${PN}/manual" @@
> -126,8 +126,8 @@ FILES_${PN}-doc += " ${datadir}/${PN}/manual" # override
> this too - here is the default, less datadir # FILES_${PN} =  "${bindir}
> ${sbindir} ${libexecdir} ${libdir}/lib*.so.* ${sysconfdir} \ -
> ${sharedstatedir} ${localstatedir} /bin /sbin /lib/*.so* \ -
> ${libdir}/${PN}" +    ${sharedstatedir} ${localstatedir} /bin /sbin
> /lib/*.so* \ +    ${libdir}/${PN}"
> 
> # we want htdocs and cgi-bin to go with the binary FILES_${PN} +=
> "${datadir}/${PN}/htdocs ${datadir}/${PN}/cgi-bin" diff --git
> a/meta-webserver/recipes-php/modphp/modphp5.inc
> b/meta-webserver/recipes-php/modphp/modphp5.inc index 33dbe89..a3b4163
> 100644 --- a/meta-webserver/recipes-php/modphp/modphp5.inc +++
> b/meta-webserver/recipes-php/modphp/modphp5.inc @@ -52,43 +52,43 @@
> acpaths = "" # which breaks everything... # do_configure() { -
> gnu-configize --force -	find . -name config.m4 -o -name configure | xargs
> -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!' -
> export PHP_LIBXML_DIR=${STAGING_DIR_NATIVE}${layout_exec_prefix} -
> oe_runconf - -	# No libtool, we really don't want rpath set... -	sed -i
> 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool 
> -	sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g'
> libtool +    gnu-configize --force +    find . -name config.m4 -o -name
> configure | xargs -n1 sed -i
> 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!' +    export
> PHP_LIBXML_DIR=${STAGING_DIR_NATIVE}${layout_exec_prefix} +
> oe_runconf + +    # No libtool, we really don't want rpath set... +
> sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g'
> libtool +    sed -i
> 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool }
> 
> do_install  () { -	install -d ${D}${libdir}/apache2/modules -	install -d
> ${D}${sysconfdir}/apache2/modules.d -	install -d
> ${D}${sysconfdir}/php/apache2-php5 -	install -m 755  libs/libphp5.so
> ${D}${libdir}/apache2/modules -	sed -i s,lib/,${libdir}/,
> ${WORKDIR}/70_mod_php5.conf -	install -m 644  ${WORKDIR}/70_mod_php5.conf
> ${D}${sysconfdir}/apache2/modules.d -	cat ${S}/php.ini-production | \ -
> sed -e 's,extension_dir = \"\./\",extension_dir =
> \"/usr/lib/extensions\",' \ -		>
> ${D}${sysconfdir}/php/apache2-php5/php.ini - -	install -d ${D}${bindir} -
> install -m 755 scripts/phpize ${D}${bindir} -	install -m 755
> scripts/php-config ${D}${bindir} - -	oe_runmake install-build
> install-headers INSTALL_ROOT=${D} +    install -d
> ${D}${libdir}/apache2/modules +    install -d
> ${D}${sysconfdir}/apache2/modules.d +    install -d
> ${D}${sysconfdir}/php/apache2-php5 +    install -m 755  libs/libphp5.so
> ${D}${libdir}/apache2/modules +    sed -i s,lib/,${libdir}/,
> ${WORKDIR}/70_mod_php5.conf +    install -m 644
> ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/modules.d +    cat
> ${S}/php.ini-production | \ +        sed -e 's,extension_dir =
> \"\./\",extension_dir = \"/usr/lib/extensions\",' \ +        >
> ${D}${sysconfdir}/php/apache2-php5/php.ini + +    install -d
> ${D}${bindir} +    install -m 755 scripts/phpize ${D}${bindir} +
> install -m 755 scripts/php-config ${D}${bindir} + +    oe_runmake
> install-build install-headers INSTALL_ROOT=${D} }
> 
> SYSROOT_PREPROCESS_FUNCS += "php_sysroot_preprocess"
> 
> php_sysroot_preprocess () { -        install -d
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ -        install -m 755
> ${D}${bindir}/phpize ${SYSROOT_DESTDIR}${bindir_crossscripts}/ -
> install -m 755 ${D}${bindir}/php-config
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ +    install -d
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ +    install -m 755
> ${D}${bindir}/phpize ${SYSROOT_DESTDIR}${bindir_crossscripts}/ +
> install -m 755 ${D}${bindir}/php-config
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> 
> -	sed -i 's!eval echo /!eval echo ${STAGING_DIR_HOST}/!'
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/phpize -	sed -i
> 's!^include_dir=.*!include_dir=${STAGING_INCDIR}/php!'
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/php-config +    sed -i 's!eval
> echo /!eval echo ${STAGING_DIR_HOST}/!'
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/phpize +    sed -i
> 's!^include_dir=.*!include_dir=${STAGING_INCDIR}/php!'
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/php-config }
> 
> RDEPENDS_${PN} = "apache2" diff --git
> a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb
> b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb index
> 1118e23..996aa63 100644 ---
> a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb +++
> b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb @@ -18,11
> +18,11 @@ S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages" inherit
> allarch
> 
> do_install() { -	install -d ${D}${datadir}/${BPN} -	cp -a *
> ${D}${datadir}/${BPN} +    install -d ${D}${datadir}/${BPN} +    cp -a *
> ${D}${datadir}/${BPN}
> 
> -	install -d ${D}${sysconfdir}/apache2/conf.d -	install -m 0644
> ${WORKDIR}/apache.conf ${D}${sysconfdir}/apache2/conf.d/phpmyadmin.conf +
> install -d ${D}${sysconfdir}/apache2/conf.d +    install -m 0644
> ${WORKDIR}/apache.conf ${D}${sysconfdir}/apache2/conf.d/phpmyadmin.conf 
> }
> 
> FILES_${PN} = "${datadir}/${BPN} \ diff --git
> a/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb
> b/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb index
> 48e1f8e..d09473c 100644 ---
> a/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb +++
> b/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb @@ -16,17 +16,17 @@
> inherit autotools EXTRA_OECONF += "--enable-xdebug
> -with-php-config=${STAGING_BINDIR_CROSS}/php-config"
> 
> do_configure() { -	${STAGING_BINDIR_CROSS}/phpize +
> ${STAGING_BINDIR_CROSS}/phpize
> 
> -	# Running autoreconf as autotools_do_configure would do here -	# breaks
> the libtool configuration resulting in a failure later -	# in do_compile.
> It's possible this may be fixable, however the -	# easiest course of
> action for the moment is to avoid doing that. -	oe_runconf +    # Running
> autoreconf as autotools_do_configure would do here +    # breaks the
> libtool configuration resulting in a failure later +    # in do_compile.
> It's possible this may be fixable, however the +    # easiest course of
> action for the moment is to avoid doing that. +    oe_runconf }
> 
> do_install() { -	oe_runmake install INSTALL_ROOT=${D} +    oe_runmake
> install INSTALL_ROOT=${D} }
> 
> FILES_${PN} += "${libdir}/php5/extensions/*/*.so" diff --git
> a/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb
> b/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb index
> dc1508e..83e92f6 100644 ---
> a/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb +++
> b/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb @@ -36,22 +36,22
> @@ do_configure_prepend() { }
> 
> do_install_append() { -	install -d ${D}${sysconfdir} -	install -d
> ${D}${sysconfdir}/ajenti -	install -m 0644 packaging/files/ajenti.conf
> ${D}${sysconfdir}/ajenti/ -	install -d ${D}${sysconfdir}/ajenti/users -
> install -m 0644 packaging/files/admin.conf
> ${D}${sysconfdir}/ajenti/users/ -	install -d ${D}${sysconfdir}/init.d -
> install -m 0755 packaging/files/ajenti ${D}${sysconfdir}/init.d/ -
> install -d ${D}${localstatedir} -	install -d ${D}${localstatedir}/lib -
> install -d ${D}${localstatedir}/lib/ajenti -	install -d
> ${D}${localstatedir}/lib/ajenti/plugins -	install -m 0644
> packaging/files/.placeholder ${D}${localstatedir}/lib/ajenti/plugins +
> install -d ${D}${sysconfdir} +    install -d ${D}${sysconfdir}/ajenti +
> install -m 0644 packaging/files/ajenti.conf ${D}${sysconfdir}/ajenti/ +
> install -d ${D}${sysconfdir}/ajenti/users +    install -m 0644
> packaging/files/admin.conf ${D}${sysconfdir}/ajenti/users/ +    install
> -d ${D}${sysconfdir}/init.d +    install -m 0755 packaging/files/ajenti
> ${D}${sysconfdir}/init.d/ +    install -d ${D}${localstatedir} +
> install -d ${D}${localstatedir}/lib +    install -d
> ${D}${localstatedir}/lib/ajenti +    install -d
> ${D}${localstatedir}/lib/ajenti/plugins +    install -m 0644
> packaging/files/.placeholder ${D}${localstatedir}/lib/ajenti/plugins
> 
> -	for plugin in plugins/* ; do -		cp -r $plugin
> ${D}${localstatedir}/lib/ajenti/plugins/ -	done +    for plugin in
> plugins/* ; do +        cp -r $plugin
> ${D}${localstatedir}/lib/ajenti/plugins/ +    done }
> 
> INITSCRIPT_NAME = "ajenti" diff --git
> a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
> b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
>
> 
index b05c298..9ec034a 100644
> ---
> a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
>
> 
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
> @@ -12,4 +12,4 @@ SRC_URI[md5sum] = "d0ffea2052a8e70154cf13789070711f" 
> SRC_URI[sha256sum] =
> "40419892bd28989315eed053c159bba0f4264ed8c6c6738806024e481eab9492"
> 
> FILES_${PN} += "${datadir}/xfce4/panel/plugins \ -
> ${libdir}/xfce4/panel/plugins" +        ${libdir}/xfce4/panel/plugins" 
> diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
> b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb index
> 2e19d89..8d990f3 100644 ---
> a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb +++
> b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb @@ -14,10 +14,10
> @@ SRC_URI[sha256sum] =
> "dc20f97a49e1ff1becf7853ef5f137ed30a4c27490540e755021d78d33 S =
> "${WORKDIR}/OpenZone"
> 
> do_install() { -	install -d ${D}${datadir}/icons -	for theme in `find
> -name '*.tar.xz'`; do -		tar -Jxf ${theme} -C ${D}${datadir}/icons -
> done +    install -d ${D}${datadir}/icons +    for theme in `find -name
> '*.tar.xz'`; do +        tar -Jxf ${theme} -C ${D}${datadir}/icons +
> done }
> 
> python populate_packages_prepend () { diff --git
> a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
> b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
>
> 
index 879d1d6..7348170 100644
> ---
> a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
>
> 
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
> @@ -16,7 +16,7 @@ S = "${WORKDIR}/git" EXTRA_OECONF +=
> "--enable-maintainer-mode"
> 
> do_configure_prepend() { -	NOCONFIGURE=yes ./autogen.sh +
> NOCONFIGURE=yes ./autogen.sh }
> 
> FILES_${PN} += "${datadir}/xfce4/closebutton/themes" diff --git
> a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb
> b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb 
> index 202078e..68307a8 100644 ---
> a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb 
> +++
> b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb 
> @@ -11,12 +11,12 @@ SRC_URI[md5sum] = "03c972d13eba5cd226432ff66e3ff282" 
> SRC_URI[sha256sum] =
> "3f76207b8a845d15bfec6825bd5300aedd086c455259c4dd8670a89a3c8ab382"
> 
> do_compile_prepend() { -	# Switch to a working license key -	#
> https://bugs.archlinux.org/task/26815 -	sed -i \ -		-e 's/^#define
> PARTNER_ID.*/#define PARTNER_ID "1003666583"/' \ -		-e 's/^#define
> LICENSE_KEY.*/#define LICENSE_KEY "4128909340a9b2fc"/' \ -
> ${S}/panel-plugin/weather.h +    # Switch to a working license key +    #
> https://bugs.archlinux.org/task/26815 +    sed -i \ +        -e
> 's/^#define PARTNER_ID.*/#define PARTNER_ID "1003666583"/' \ +        -e
> 's/^#define LICENSE_KEY.*/#define LICENSE_KEY "4128909340a9b2fc"/' \ +
> ${S}/panel-plugin/weather.h
> 
> }
> 
> diff --git
> a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb
> b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb index
> 1955fcc..8779b01 100644 ---
> a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb +++
> b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb @@
> -14,8 +14,8 @@ SRC_URI[md5sum] = "372b74f432e7e02d946c2ea9d3de2805" 
> SRC_URI[sha256sum] =
> "f79649bbfbbf16881494ee9f67035063765aec12e23ab9bac31de2c8a4f32bf8"
> 
> do_install_append() { -       install -d ${D}${datadir}/aclocal -
> install -m 644 m4macros/*.m4 ${D}${datadir}/aclocal/ +    install -d
> ${D}${datadir}/aclocal +    install -m 644 m4macros/*.m4
> ${D}${datadir}/aclocal/ }
> 
> FILES_${PN} += "${datadir}/xfce4/dev-tools/m4macros/*.m4" diff --git
> a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb
> b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb index
> f7d7c46..02a6cb1 100644 ---
> a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb +++
> b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb @@ -26,4 +26,4
> @@ FILES_${PN} += "${libdir}/xfce4/panel/migrate \ 
> ${libdir}/xfce4/panel/wrapper"
> 
> FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug \ -		   " +" 
> diff --git
> a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb
> b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb index
> c5cb033..d633fa6 100644 ---
> a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb +++
> b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb @@ -23,9
> +23,9 @@ SRC_URI[sha256sum] =
> "4a4f1e79a58b524f3a6dd030b6fc687671b35566f847e6f516c6f84211 FILES_${PN}
> += "${libdir}/xfce4"
> 
> do_install_prepend() { -	# somehow binary files are not patched correctly
> by oe-patch - so copy them -	cp ${WORKDIR}/touchscreen/invisible
> ${S}/cursors -	cp ${WORKDIR}/touchscreen/wait ${S}/cursors +    # somehow
> binary files are not patched correctly by oe-patch - so copy them +    cp
> ${WORKDIR}/touchscreen/invisible ${S}/cursors +    cp
> ${WORKDIR}/touchscreen/wait ${S}/cursors }
> 
> RRECOMMENDS_${PN} += "gnome-icon-theme" diff --git
> a/recipes-support/multipath-tools/multipath-tools_git.bb
> b/recipes-support/multipath-tools/multipath-tools_git.bb index
> 808bc28..b52b111 100644 ---
> a/recipes-support/multipath-tools/multipath-tools_git.bb +++
> b/recipes-support/multipath-tools/multipath-tools_git.bb @@ -16,7 +16,7
> @@ PV = "0.4.9+git" EXTRA_OEMAKE = "MULTIPATH_VERSION=${PV} DESTDIR=${D}
> syslibdir=${base_libdir} libdir=${base_libdir}/multipath"
> 
> do_install() { -	oe_runmake install +    oe_runmake install }
> 
> FILES_${PN}-dbg += "${base_libdir}/multipath/.debug" diff --git
> a/toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc
> b/toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc index 20ceb49..83e9a9f
> 100644 --- a/toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc +++
> b/toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc @@ -28,55 +28,55 @@
> NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native" 
> LICENSE="GPL-3.0-with-GCC-exception & GPLv3"
> 
> LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552
> \ -
> file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \ -
> file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \ -
> file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \ -
> file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8" +
> file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \ +
> file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \ +
> file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \ +
> file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
> 
> SRC_URI =
> "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};protocol=http \ -
> file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \ -
> file://100-uclibc-conf.patch \ -
> file://gcc-uclibc-locale-ctype_touplow_t.patch \ -
> file://cache-amnesia.patch \ -	   file://gcc-flags-for-build.patch \ -
> file://103-uclibc-conf-noupstream.patch  \ -
> file://200-uclibc-locale.patch  \ -
> file://203-uclibc-locale-no__x.patch; \ -
> file://204-uclibc-locale-wchar_fix.patch; \ -
> file://205-uclibc-locale-update.patch; \ -
> file://301-missing-execinfo_h.patch  \ -
> file://302-c99-snprintf.patch  \ -
> file://303-c99-complex-ugly-hack.patch  \ -
> file://304-index_macro.patch  \ -
> file://305-libmudflap-susv3-legacy.patch  \ -
> file://306-libstdc++-namespace.patch  \ -
> file://740-sh-pr24836.patch  \ -           file://800-arm-bigendian.patch
> \ -           file://904-flatten-switch-stmt-00.patch  \ -
> file://arm-nolibfloat.patch  \ -           file://arm-softfloat.patch \ -
> file://zecke-xgcc-cpp.patch \ -
> file://gcc-poison-system-directories.patch \ -
> file://gcc-poison-dir-extend.patch \ -
> file://gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \ -
> file://64bithack.patch \ -	   file://optional_libstdc.patch \ -
> file://disable_relax_pic_calls_flag.patch \ -
> file://COLLECT_GCC_OPTIONS.patch \ -
> file://use-defaults.h-and-t-oe-in-B.patch \ -
> file://powerpc-e5500.patch \ -           file://fix-for-ice-50099.patch
> \ -	   file://gcc-with-linker-hash-style.patch \ -
> file://pr46934.patch \ -	   file://pr32219.patch \ -
> file://pr47551.patch \ -	   file://gcc-arm-set-cost.patch \ -
> file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \ -
> file://fortran-cross-compile-hack.patch \ -
> file://cpp-honour-sysroot.patch \ -	   file://mips64-default-n64.patch \ 
> -	   file://gcc-argument-list-too-long.patch \ -	  " +
> file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \ +
> file://100-uclibc-conf.patch \ +
> file://gcc-uclibc-locale-ctype_touplow_t.patch \ +
> file://cache-amnesia.patch \ +    file://gcc-flags-for-build.patch \ +
> file://103-uclibc-conf-noupstream.patch  \ +
> file://200-uclibc-locale.patch  \ +
> file://203-uclibc-locale-no__x.patch; \ +
> file://204-uclibc-locale-wchar_fix.patch; \ +
> file://205-uclibc-locale-update.patch; \ +
> file://301-missing-execinfo_h.patch  \ +    file://302-c99-snprintf.patch
> \ +    file://303-c99-complex-ugly-hack.patch  \ +
> file://304-index_macro.patch  \ +
> file://305-libmudflap-susv3-legacy.patch  \ +
> file://306-libstdc++-namespace.patch  \ +    file://740-sh-pr24836.patch
> \ +    file://800-arm-bigendian.patch  \ +
> file://904-flatten-switch-stmt-00.patch  \ +
> file://arm-nolibfloat.patch  \ +    file://arm-softfloat.patch \ +
> file://zecke-xgcc-cpp.patch \ +
> file://gcc-poison-system-directories.patch \ +
> file://gcc-poison-dir-extend.patch \ +
> file://gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \ +
> file://64bithack.patch \ +    file://optional_libstdc.patch \ +
> file://disable_relax_pic_calls_flag.patch \ +
> file://COLLECT_GCC_OPTIONS.patch \ +
> file://use-defaults.h-and-t-oe-in-B.patch \ +
> file://powerpc-e5500.patch \ +    file://fix-for-ice-50099.patch \ +
> file://gcc-with-linker-hash-style.patch \ +    file://pr46934.patch \ +
> file://pr32219.patch \ +    file://pr47551.patch \ +
> file://gcc-arm-set-cost.patch \ +
> file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \ +
> file://fortran-cross-compile-hack.patch \ +
> file://cpp-honour-sysroot.patch \ +    file://mips64-default-n64.patch \ 
> +    file://gcc-argument-list-too-long.patch \ +"
> 
> SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
> 
> @@ -89,31 +89,31 @@ FORTRAN = "" JAVA = ""
> 
> EXTRA_OECONF_BASE = " --enable-lto \ -			--enable-libssp \ -
> --disable-bootstrap \ -			--disable-libgomp \ -			--disable-libmudflap \ 
> -			--with-system-zlib \ -
> --with-linker-hash-style=${LINKER_HASH_STYLE} \ -			--with-ppl=no \ -
> --with-cloog=no \ -			--enable-cheaders=c_global " +    --enable-libssp
> \ +    --disable-bootstrap \ +    --disable-libgomp \ +
> --disable-libmudflap \ +    --with-system-zlib \ +
> --with-linker-hash-style=${LINKER_HASH_STYLE} \ +    --with-ppl=no \ +
> --with-cloog=no \ +    --enable-cheaders=c_global "
> 
> EXTRA_OECONF_INITIAL = "--disable-libmudflap \ -			--disable-libgomp \ -
> --disable-libssp \ -			--disable-libquadmath \ -			--with-system-zlib \ -
> --disable-lto \ -			--disable-plugin \ -			--enable-decimal-float=no" +
> --disable-libgomp \ +    --disable-libssp \ +    --disable-libquadmath \ 
> +    --with-system-zlib \ +    --disable-lto \ +    --disable-plugin \ +
> --enable-decimal-float=no"
> 
> EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \ -
> --disable-libgomp \ -				--disable-libquadmath \ -				--with-system-zlib
> \ -				--disable-lto \ -				--disable-plugin \ -				--disable-libssp" +
> --disable-libgomp \ +    --disable-libquadmath \ +    --with-system-zlib
> \ +    --disable-lto \ +    --disable-plugin \ +    --disable-libssp"
> 
> EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float " diff --git
> a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
> b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb index
> 788391a..5c2435f 100644 ---
> a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb +++
> b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb @@ -13,9
> +13,9 @@ SYSTEMLIBS = "/lib/" SYSTEMLIBS1 = "/usr/lib/"
> 
> EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \ -
> --disable-libgomp --disable-libmudflap \ -
> --with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \ -
> --with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix}" +
> --disable-libgomp --disable-libmudflap \ +
> --with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \ +
> --with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix}"
> 
> # to find libmpfr # export LD_LIBRARY_PATH =
> "{STAGING_DIR_HOST}${layout_exec_prefix}" diff --git
> a/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb
> b/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb index
> 4dade08..6fdd0bc 100644 ---
> a/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb +++
> b/toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb @@ -8,56 +8,56 @@
> PKGSUFFIX = "" PKGSUFFIX_class-nativesdk = "-nativesdk"
> 
> PACKAGES = "\ -  ${PN} \ -  ${PN}-dev \ -  ${PN}-dbg \ -
> libgcov${PKGSUFFIX}-dev \ -  " +    ${PN} \ +    ${PN}-dev \ +
> ${PN}-dbg \ +    libgcov${PKGSUFFIX}-dev \ +    "
> 
> FILES_${PN} = "${base_libdir}/libgcc*.so.*" FILES_${PN}-dev = " \ -
> ${base_libdir}/libgcc*.so \ -  ${libdir}/${TARGET_SYS}/${BINV}/*crt* \ -
> ${libdir}/${TARGET_SYS}/${BINV}/libgcc*" +    ${base_libdir}/libgcc*.so
> \ +    ${libdir}/${TARGET_SYS}/${BINV}/*crt* \ +
> ${libdir}/${TARGET_SYS}/${BINV}/libgcc*" FILES_libgcov${PKGSUFFIX}-dev =
> " \ -  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \ -  " +
> ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \ +    " FILES_${PN}-dbg +=
> "${base_libdir}/.debug/"
> 
> do_configure () { -	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e
> s#-nativesdk##` -	install -d ${D}${base_libdir} ${D}${libdir} -	cp -fpPR
> ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B} -	mkdir -p
> ${B}/${BPN} -	cd ${B}/${BPN} -	chmod a+x ${S}/${BPN}/configure -
> ${S}/${BPN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} +    target=`echo
> ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##` +    install -d
> ${D}${base_libdir} ${D}${libdir} +    cp -fpPR
> ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B} +    mkdir -p
> ${B}/${BPN} +    cd ${B}/${BPN} +    chmod a+x ${S}/${BPN}/configure +
> ${S}/${BPN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} }
> 
> do_compile () { -	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##` -
> cd ${B}/${BPN} -	oe_runmake MULTIBUILDTOP=${B}/$target/${BPN}/ +
> target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##` +    cd ${B}/${BPN} +
> oe_runmake MULTIBUILDTOP=${B}/$target/${BPN}/ }
> 
> do_install () { -	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##` -
> cd ${B}/${BPN} -	oe_runmake 'DESTDIR=${D}'
> MULTIBUILDTOP=${B}/$target/${BPN}/ install +    target=`echo
> ${TARGET_SYS} | sed -e s#-nativesdk##` +    cd ${B}/${BPN} +
> oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${BPN}/ install
> 
> -	# Move libgcc_s into /lib -	mkdir -p ${D}${base_libdir} -	if [ -f
> ${D}${libdir}/nof/libgcc_s.so ]; then -		mv ${D}${libdir}/nof/libgcc*
> ${D}${base_libdir} -	else -		mv ${D}${libdir}/libgcc* ${D}${base_libdir}
> || true -	fi +    # Move libgcc_s into /lib +    mkdir -p
> ${D}${base_libdir} +    if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then +
> mv ${D}${libdir}/nof/libgcc* ${D}${base_libdir} +    else +        mv
> ${D}${libdir}/libgcc* ${D}${base_libdir} || true +    fi
> 
> -	# install the runtime in /usr/lib/ not in /usr/lib/gcc on target -	# so
> that cross-gcc can find it in the sysroot +    # install the runtime in
> /usr/lib/ not in /usr/lib/gcc on target +    # so that cross-gcc can find
> it in the sysroot
> 
> -	mv ${D}${libdir}/gcc/* ${D}${libdir} -	rm -rf ${D}${libdir}/gcc/ +
> mv ${D}${libdir}/gcc/* ${D}${libdir} +    rm -rf ${D}${libdir}/gcc/ }
> 
> do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_package"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRatmhMkyGM64RGpERApwBAJsH2D3QiN7sC77XNvV3ySWafxu7VwCfV2vh
aqhYQKPr7+RyBidkX/gWgio=
=T+ye
-----END PGP SIGNATURE-----



