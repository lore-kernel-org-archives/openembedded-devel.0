Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O1guI-0003mu-6n
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 16:16:03 +0200
Received: by ewy3 with SMTP id 3so302233ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 07:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=V/hikZE7B8f147cjwwDtJmeU4XksoryIxItoNYYKW+g=;
	b=sRELaEKEz64/4jCeThiN3YI+Aj/BceTYjYf18X8MGHau9Nrq377fyVZZrGUzpNqQcE
	w3e5hDmvZD4JEm7IJyxx1Jc9q0A7+TlAllKKQ0mPJ4xaZ/GKpyraI+nc4UUuRjp4hhTa
	trAJYcssiICQxdu8XfmRBgLI94cBGitHrhhFM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=xo83QYcxtyo7D9okZAf7ZfFpARjQaYLcCp+298MycvBGrHxgnrSmKH5pEhRvbaL2YY
	zxWJxcre969lOj2rXNOtwF+NbrXX4Xo4xBXYiGgsTiYL7TfAmYO1vFM3crYSsHz6b/C5
	0MUDW8iPF7oHurh66lWG1JyZmAuwyDpXdegj8=
Received: by 10.102.226.1 with SMTP id y1mr3191275mug.0.1271167952854;
	Tue, 13 Apr 2010 07:12:32 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t10sm23634795muh.29.2010.04.13.07.12.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Apr 2010 07:12:32 -0700 (PDT)
Date: Tue, 13 Apr 2010 16:12:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100413141237.GE3616@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL, BAYES_00, SPF_PASS,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Download status for all recipes in oe.dev
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
X-List-Received-Date: Tue, 13 Apr 2010 14:16:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

with script moving checksums to recipes I ended with ~1000 recipes
failing to parse/download/checksum.

My last few commits show what was common problem. Here is list of
recipes which I cannot/wont fix from my position. And also list of
recipes still waiting to test manually (because it takes much longer
than I expected/wanted to spend on it).

Be aware, that some are maybe only temprorary problems and this list was
created before big TI merge so those recipes from /ti/ are probabaly
already fixed or removed.

FYI: 60G   /home/downloads/OE/

http://svn.o-hand.com/ shows only matchbox repo, not clutter
./clutter/aaina_svn.bb
./clutter/clutter-box2d_svn.bb
./clutter/clutter-cairo_svn.bb
./clutter/clutter-glx_svn.bb
./clutter/clutter-gst_svn.bb
./clutter/clutter_svn.bb
./clutter/table_svn.bb
./clutter/tidy_svn.bb + missing SRCREV
./eds/eds-dbus_svn.bb
./exmap-console/exmap-console_svn.bb
./matchbox-panel/matchbox-panel_svn.bb + missing SRCREV
./matchbox-themes-extra/matchbox-theme-sato_svn.bb + missing SRCREV
./openmoko2/openmoko-contacts2_svn.bb
./openmoko2/openmoko-dates2_svn.bb
./openmoko2/openmoko-tasks2_svn.bb
./pimlico/contacts_svn.bb + missing SRCREV
./pimlico/dates_svn.bb + missing SRCREV
./pimlico/tasks_svn.bb + missing SRCREV
./clutter/clutter-gst_0.4svn.bb + missing SRCREV
./clutter/clutter_0.4svn.bb
./clutter/clutter_0.6svn.bb

http://gpephone.linuxtogo.org seems gone as well as svn repo there
./gpephone/addressbook_svn.bb
./gpephone/almmgrd_svn.bb
./gpephone/calendar2_svn.bb
./gpephone/contact_svn.bb
./gpephone/dialer_svn.bb
./gpephone/firewall_svn.bb
./gpephone/gpe-applauncher_svn.bb
./gpephone/libabenabler2_svn.bb
./gpephone/libabenabler_svn.bb
./gpephone/libalmmgr_svn.bb
./gpephone/libcalenabler2_svn.bb
./gpephone/libgemwidget_svn.bb
./gpephone/libgpephone_svn.bb
./gpephone/libiac2_svn.bb
./gpephone/libiac_svn.bb
./gpephone/libim2_svn.bb
./gpephone/liblipsevent2_svn.bb
./gpephone/libmsgenabler2_svn.bb
./gpephone/libmsgenabler_svn.bb
./gpephone/librecord2_svn.bb
./gpephone/libsettings_svn.bb
./gpephone/libtapi_svn.bb
./gpephone/libvoc_svn.bb
./gpephone/machined_svn.bb
./gpephone/ptim-engine_svn.bb
./gpephone/ptim-headers_svn.bb
./gpephone/ptim-helper_svn.bb
./gpephone/ptim-manager_svn.bb
./gpephone/quickdial_svn.bb
./gpephone/useen_svn.bb
./gpephone/addressbook_0.1.bb
./gpephone/audioplayer_1.0.bb
./gpephone/libabenabler_0.1.bb
./gpephone/libgemwidget_0.1.bb
./gpephone/libiac_0.1.bb
./gpephone/librecord_0.1.bb

git://git.moblin.org/ some repos seems gone
./clutter/moblin-proto_git.bb
./libgdbus/libgdbus_git.bb
./moblin/bickley_git.bb
./moblin/bognor-regis_git.bb
./moblin/hornsey_git.bb
./moblin/librest_git.bb
./moblin/mojito_git.bb
./moblin/nbtk_git.bb
./mux/mux_git.bb

svn://garage.maemo.org also missing something?
./maemo-mapper/maemo-mapper-nohildon_svn.bb
./maemo-mapper/maemo-mapper_svn.bb
./mplayer/mplayer-maemo_svn.bb
./sapwood/sapwood_svn.bb

svn://svn.openmoko.org also missing few dirs
./openmoko-base/openmoko-common_svn.bb
./openmoko-base/openmoko-icon-theme-standard_svn.bb
./openmoko-base/openmoko-libs_svn.bb
./openmoko-base/openmoko-session_svn.bb
./openmoko-base/openmoko-sound-theme-standard_svn.bb
./openmoko-base/openmoko-theme-standard-qvga_svn.bb
./openmoko-base/openmoko-theme-standard_svn.bb
./openmoko-examples/openmoko-finger-demo_svn.bb
./openmoko-examples/openmoko-panel-demo-simple_svn.bb
./openmoko-examples/openmoko-panel-demo_svn.bb
./openmoko-examples/openmoko-stylus-demo-simple_svn.bb
./openmoko-examples/openmoko-stylus-demo_svn.bb
./openmoko2/openmoko-alsa-scenarios_svn.bb
./samsung-soc-utils/s3c2410-boot-usb-native_svn.bb

svn://svn.projects.openmoko.org
./openmoko-projects/diversity-daemon_svn.bb

git://git.openmoko.org
./openmoko-projects/tichy_git.bb
404 http://downloads.openmoko.org/sources/juce_1_29.zip
./juce/juce_1.29.bb
Who wants to buy www.epiawiki.org?
404 http://www.epiawiki.org/files/epia_kernel/patch-2.6.8.1-epia1.bz2
./linux/linux-epia_2.6.8.1.bb
./xffm/xffm_4.3.99.2.bb
404 http://www.us.xfce.org/archive/xfce/4.3.99.2/src/xffm-4.3.99.2.tar.bz2
./xmonobut/xmonobut_0.4.bb
403 http://www.handhelds.org/~mallum/downloadables/xmonobut/xmonobut-0.4.tar.gz
./libqanava/libqanava_0.0.7.bb
404 http://www.libqanava.org/dl/libqanava_0.0.7.bb
./debianutils/debianutils_2.19.bb
404 ftp://ftp.debian.org/debian/pool/main/d/debianutils/debianutils_2.19.tar.gz
./prism54/prism54-module_cvs.bb
404 http://prism54.org/pub/linux/snapshot/tars/prism54-cvs-latest.tar.bz2
./avr-libc/avr-libc_1.0.3.bb
404 http://savannah.nongnu.org/download/avr-libc/avr-libc-1.0.3.tar.bz2
./binutils/mingw-binutils-canadian-cross_2.20.bb
404 http://downloads.sourceforge.net/mingw/binutils-2.20-src.tar.gz
./binutils/mingw-binutils_2.20.bb
404 http://downloads.sourceforge.net/mingw/binutils-2.20-src.tar.gz

git://git.neurostechnology.com
./neuros-public/neuros-app-photoalbum_git.bb
./neuros-public/neuros-app-vplayer_git.bb
./neuros-public/neuros-lib-gui_git.bb
./neuros-public/neuros-lib-widgets_git.bb
./neuros-public/neuros-mainmenu_git.bb
./neuros-public/neuros-nwm_git.bb
./neuros-public/neuros-qt-plugins_git.bb

svn: OPTIONS of 'https://svn.musicpd.org/gmpc/trunk': SSL handshake failed: SSL error: unknown protocol (https://svn.musicpd.org)
./musicpd/gmpc_svn.bb

cumulus-snapshot.tgz doesn't exist anymore, but there is some CumulusQt4-snapshot.tbz CumulusQt2-snapshot.tbz    
./cumulus/cumulus_cvs.bb

moved to GIT
./cwiid/cwiid_svn.bb

wengophone renamed to QuteCom and source is now in Mercurial (but haven't found dbus-c++).
./dbus/dbus-c++-native_svn.bb
./dbus/dbus-c++_svn.bb


svn: OPTIONS of 'http://svn.om.vptt.ch/trunk/bubble-keyboard': could not connect to server (http://svn.om.vptt.ch)
./e17/bubble-keyboard_svn.bb
./efl1/libefso_svn.bb
./e17/gridpad_svn.bb
./e17/intuition_svn.bb
./e17/essential-dialer_svn.bb

moved to edje in http://trac.enlightenment.org/e/changeset/47344
./e17/edje-player_svn.bb
gone http://trac.enlightenment.org/e/changeset/45979
./e17/eve_svn.bb

ugly custom do_fetch
./linux/linux-efika_2.6.21+git.bb
./linux/linux-jlime-jornada7xx_2.6.32+git.bb

404 http://fpdownload.macromedia.com/get/flashplayer/current//flash-plugin-10.0.22.87-release.i386.rpm
./adobe-flash/flash-plugin_10.0.22.87.bb

Unknown host anoncvs.gnome.org.
./gnet/gnet_cvs.bb
./horizon/horizon_cvs.bb

Unknown host cvs.irssi.org.
./irssi/xirssi_cvs.bb

./ixp4xx/ixp4xx-npe-native_2.1.bb
http://www.intel.com/Please-Read-The-BB-File/IPL_ixp400NpeLibrary-2_1.zip - reading it didn't help me much :) You have to read different recipe: ixp4xx-npe_2.4.bb
./ixp4xx/ixp4xx-npe_2.1.bb
http://www.intel.com/Please-Read-The-BB-File/IPL_ixp400NpeLibrary-2_1.zip

cvs [checkout aborted]: reading from server: Connection reset by peer
./gomunicator/gomunicator_cvs.bb

linuxtogo problem?
./gpe-autostarter/gpe-autostarter_svn.bb
./gpe-clock/gpe-clock_svn.bb
./gpe-edit/gpe-edit_svn.bb
./gpe-ownerinfo/gpe-ownerinfo_svn.bb
./gpe-su/gpe-su_svn.bb
./gpe-todo/gpe-todo_svn.bb
./libxsettings/libxsettings_svn.bb
project seems gone from projects.linuxtogo.org
./detect-stylus/detect-stylus_svn.bb

no SRCREV
./hal/hal_git.bb
./linux/linux-ml403-mvista-2.6.x_git.bb
./gtk-theme-torturer/gtk-theme-torturer_git.bb
./linux/linux-z_2.6.20.bb

cvs [checkout aborted]: no such tag linux_2_6_15
./linux/linux-mtx-3_2.6.15.bb

svn://svn.kismetwireless.net
./kismet/kismet-newcore_svn.bb
./kismet/kismet_svn.bb

svn://anonsvn.opensource.apple.com
./llvm/llvm-gcc4-cross_svn.bb
./llvm/llvm-gcc4_svn.bb

404 http://download.berlin.freifunk.net/meshcube.org/nylon/stable/sources/logrotate_20100412.tgz
./logrotate-script/logrotate-script_cvs.bb

Downloading linux tree from git seems quite faulty (timeouts during clone)
./linux/linux-jlime-current.bb
no SRCREV
./linux/linux-jlime-jornada6xx_2.6.25.bb
fatal: Unable to look up jlime.org (port 9418) (Name or service not known)
./linux/linux-kirkwood_2.6.31.bb
NOTE: Task failed: Unknown fetch Error: [Errno 2] No such file or directory: '/OE/downloads/git_git.marvell.com.orion.git_8cb424312d88810bb62edbeef42a510725ceb482.tar.gz'
./linux/linux-leviathan_git.bb
NOTE: Task failed: Unknown fetch Error: [Errno 2] No such file or directory: '/OE/downloads/git_gitorious.org.htc-msm-2-6-32.leviathan-incoming.git_e94465547ea4b765024ff08c36afffb5664f3121.tar.gz'
./linux/linux-neuros_git.bb
NOTE: Task failed: Unknown fetch Error: [Errno 2] No such file or directory: '/OE/downloads/git_github.com.vu3rdd.linux-davinci-osd2.git_465f0ba12501e1c4e048f0a3ca8182404aeb66fc.tar.gz'
./linux/linux-omapzoom_git.bb
NOTE: Task failed: Unknown fetch Error: [Errno 2] No such file or directory: '/OE/downloads/git_git.omapzoom.org.repo.omapkernel.git_26d16dad66b1d3955d8958938f9de5f2e0fce7fb.tar.gz'
./linux/linux-replicant_git.bb
NOTE: Task failed: Unknown fetch Error: [Errno 2] No such file or directory: '/OE/downloads/git_gitorious.org.replicant.gnulinuxkernel.git_d2fc2471ba384dabad1c9a4126e2e2372349d34c.tar.gz'
./linux/linux-smdk2440_2.6.20+git.bb
NOTE: Task failed: Unknown fetch Error: [Errno 2] No such file or directory: '/OE/downloads/git_opensource.wolfsonmicro.com.linux-2.6-asoc-ggdev_asoc-merge-0002.tar.gz'

svn: No access allowed to this repository
./openocd/openocd-native_svn.bb
./openocd/openocd_svn.bb

# Different checksum in my download
./xapian/xapian-quickstartindex-native_1.0.bb:#CHECKSUMS.INI MISMATCH: I
./xapian/xapian-quickstartindex_1.0.bb:#CHECKSUMS.INI MISMATCH: I got
./linux/linux-geodegx_2.4.24.bb:# CHECKSUMS.INI MISMATCH: I got this
./linux/linux-sun4cdm_2.6.8.1.bb:# CHECKSUMS.INI MISMATCH: I got this:
./gpephone/libgemwidget_0.1.bb:# CHECKSUMS.INI MISMATCH: I got this:

# still waiting for manual check
END 0 ./madwifi/madwifi-modules_cvs.bb
END 0 ./makeself/makeself-native_cvs.bb
END 0 ./networkmanager/networkmanager_svn.bb
END 0 ./opencvs/opencvs_cvs.bb
END 0 ./opensync/msynctool_svn.bb
END 0 ./putty/putty_svn.bb
END 0 ./puzzles/puzzles_svn.bb
END 0 ./python/python-coherence_svn.bb
END 0 ./sdr/dttsp_svn.bb
END 0 ./squeezeclient/squeezeslave_svn.bb
END 0 ./ti/bitblit_svn.bb
END 0 ./ti/gstreamer-ti_svn.bb
END 0 ./ti/ti-dmai_svn.bb
END 0 ./tinymail/libtinymail_svn.bb
END 0 ./tinymail/tmut_svn.bb
END 0 ./u-boot/u-boot-omap3_git.bb
END 0 ./waimea/waimea_cvs.bb
END 0 ./xorg-xserver/xserver-kdrive_git.bb
END 0 ./abiword/abiword-plugins_2.4.6.bb
END 0 ./agg/agg-minimal_2.5.bb
END 0 ./aircrack/aircrack_2.1.bb
END 0 ./asterisk/asterisk-addons_1.6.0-beta2.bb
END 0 ./asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb
END 0 ./asterisk/asterisk-moh-freeplay-g729_0.0.0.bb
END 0 ./asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb
END 0 ./asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb
END 0 ./asterisk/asterisk_1.2.24.bb
END 0 ./asterisk/asterisk_1.2.28.bb
END 0 ./asterisk/asterisk_1.6.0-beta8.bb
END 0 ./bmon/bmon_2.1.0.bb
END 0 ./bootmenu/bootmenu_0.6.bb
END 0 ./c3110x/cx3110x_1.1.bb
END 0 ./callweaver/callweaver_1.2.0-rc5.bb
END 0 ./cdtool/cdtool_2.1.8.bb
END 0 ./chillispot/chillispot_0.98.bb
END 0 ./chillispot/chillispot_1.0RC3.bb
END 0 ./classpath/classpath_0.97.2.bb
END 0 ./cpusage/cpusage_0.1.bb
END 0 ./cxcrypt/cxcrypt_1.0.bb
END 0 ./dash/dash_0.5.5.1.bb
END 0 ./debianutils/debianutils_2.19.bb
END 0 ./desktop-file-utils/desktop-file-utils_0.3.bb
END 0 ./dgen/dgen-sdl_1.23.bb
END 0 ./dhcdbd/dhcdbd_1.14.bb
END 0 ./dhcdbd/dhcdbd_1.16.bb
END 0 ./dialog/dialog_1.0-20050306.bb
END 0 ./dircproxy/dircproxy_1.1.0.bb
END 0 ./directfb/directfb_1.1.1.bb
END 0 ./directfb/fusionsound_1.1.0+git20070709.bb
END 0 ./directfb/lite_0.9.26+cvs20070207.bb
END 0 ./dt/dt_15.14.bb
END 0 ./dtc/dtc-native_20070216.bb
END 0 ./dtc/dtc_20070216.bb
END 0 ./ekg/ekg_1.6.bb
END 0 ./elfutils/elfutils_0.89.bb
END 0 ./em8300/em8300_0.16.3.bb
END 0 ./emelfm2/emelfm2_0.0.8.bb
END 0 ./flnx/flnx_0.18.bb
END 0 ./fltk/fltk_1.1.4.bb
END 0 ./fontconfig/fontconfig_2.6.99.bb
END 0 ./fpdf/fpdf_1.53.bb
END 0 ./frotz/frotz_2.42.bb
END 0 ./geode-drivers/geode-accessbus5536_2.6.11.bb
END 0 ./geode-drivers/geode-aeslx_2.6.11.bb
END 0 ./geode-drivers/geode-alsa5536_2.6.11.bb
END 0 ./gpsdrive/gpsdrive-pda_2.10pre2.bb
END 0 ./gtk2-ssh-askpass/gtk2-ssh-askpass_0.3.bb
END 0 ./gtkhtml/gtkhtml-2.0_2.6.3.bb
END 0 ./hibernate-script/hibernate-script_1.12.bb
END 0 ./howl/howl_0.9.7.bb
END 0 ./hvsc/hvsc_45.bb
END 0 ./ica/ica-bin_8.0.bb
END 0 ./ipatience/ipatience_0.1.bb
END 0 ./konqueror/konqueror-embedded_20060404.bb
END 0 ./libdessert/libdessert_0.86.14.bb
END 0 ./libgsasl/libgsasl_1.4.0.bb
END 0 ./libmatthew/libmatthew_0.7.bb
END 0 ./libtomcrypt/libtomcrypt_1.17.bb
END 0 ./libvorbis/libvorbis_1.0.1.bb
END 0 ./libw100/libw100_0.0.2.bb
END 0 ./lvm2/lvm2_2.01.09.bb
END 0 ./madwifi/madwifi-modules_cvs-bsd.bb
END 0 ./madwifi/madwifi-ng_r3878-20081204.bb
END 0 ./mailx/mailx_8.1.2-0.20020411cvs.bb
END 0 ./mailx/mailx_8.1.2-0.20040524cvs.bb
END 0 ./maradns/maradns_1.0.39.bb
END 0 ./matchbox-applet-tasks/mb-applet-tasks_1.0.0.bb
END 0 ./mathomatic/mathomatic_12.4.2.bb
END 0 ./mathomatic/mathomatic_unstable.bb
END 0 ./microwindows/microwindows-snapshot.bb
END 0 ./miglayout/miglayout_3.0.3.bb
END 0 ./minipredict/dictionary_en-GB.bb
END 0 ./mipl-mipv6/mipv6_1.1-v2.4.26.bb
END 0 ./misc-binary-only/tda1004x-firmware.bb
END 0 ./mutt/mutt_1.5.9i.bb
END 0 ./netpipes/netpipes_4.2.bb
END 0 ./networkmanager/networkmanager-openvpn_0.8.bb
END 0 ./networkmanager/networkmanager_0.7.bb
END 0 ./nis/ypbind-mt_1.18.bb
END 0 ./nonworking/freenx/nx-X11_1.5.0-15.bb
END 0 ./nonworking/freenx/nxagent_1.5.0-90.bb
END 0 ./nonworking/freenx/nxcomp_1.5.0-65.bb
END 0 ./nonworking/freenx/nxcompext_1.5.0-16.bb
END 0 ./nonworking/freenx/nxdesktop_1.5.0-61.bb
END 0 ./nonworking/freenx/nxssh_1.5.0-21.bb
END 0 ./nonworking/freenx/nxviewer_1.5.0-14.bb
END 0 ./nonworking/freenx/nxwin_1.5.0-3.bb
END 0 ./nonworking/imkit/imkit_0.4.5.bb
END 0 ./nonworking/kde/arts_1.2.2.bb
END 0 ./nonworking/libbtctl/libbtctl_0.4.1.bb
END 0 ./nonworking/monotone-viz/monotone-viz_0.11.bb
END 0 ./nonworking/nylon/simple-firewall.bb
END 0 ./nonworking/python/python-gsl_0.2.0.bb
END 0 ./nonworking/python/python-itools_0.50.1.bb
END 0 ./nonworking/remind/remind_03.00.22.bb
END 0 ./nonworking/unison/unison_2.9.1.bb
END 0 ./nonworking/zethereal/zethereal_1.0.0.bb
END 0 ./ntfs-3g/ntfs-3g_1.0.bb
END 0 ./nvidia-drivers/nvidia-display_1.0-8756.bb
END 0 ./nvidia-drivers/nvidia-display_190.42.bb
END 0 ./nvidia-drivers/nvidia-nforce_1.0-0310.bb
END 0 ./obsolete/dbus/dbus_0.20.bb
END 0 ./obsolete/dbus/dbus_0.21.bb
END 0 ./obsolete/didiwiki/didiwiki_0.2.bb
END 0 ./obsolete/didiwiki/didiwiki_0.4.bb
END 0 ./obsolete/gaim/gaim_1.0.3.bb
END 0 ./obsolete/gaim/gaim_1.1.0.bb
END 0 ./obsolete/gaim/gaim_1.1.1.bb
END 0 ./obsolete/gaim/gaim_1.1.2.bb
END 0 ./obsolete/gaim/gaim_1.4.0.bb
END 0 ./obsolete/gaim/gaim_2.0.0-cvs-mco1.bb
END 0 ./obsolete/gimp/gimp_2.2.10.bb
END 0 ./obsolete/gimp/gimp_2.3.7.bb
END 0 ./obsolete/gtk-webcore/midori_0.0.10.bb
END 0 ./obsolete/gtk-webcore/midori_0.0.11.bb
END 0 ./obsolete/gtk-webcore/midori_0.0.12.bb
END 0 ./obsolete/gtk-webcore/midori_0.0.13.bb
END 0 ./obsolete/gtk-webcore/midori_0.0.15.bb
END 0 ./obsolete/gtk-webcore/midori_0.0.17.bb
END 0 ./obsolete/gtk-webcore/midori_0.0.8.bb
END 0 ./obsolete/libpixman/libpixman-native_0.12.0.bb
END 0 ./obsolete/olsr/olsrd_0.4.8.bb
END 0 ./obsolete/olsr/olsrd_0.4.9.bb
END 0 ./obsolete/xmame/xmame_0.86.bb
END 0 ./obsolete/xmame/xmame_0.87.bb
END 0 ./obsolete/xmame/xmame_0.95.bb
END 0 ./obsolete/zd1211/zd1211_r77.bb
END 0 ./obsolete/zd1211/zd1211_r83.bb
END 0 ./octave/octave_2.9.19.bb
END 0 ./omnewrotate/omnewrotate_0.5.4.bb
END 0 ./openal/openal_0.0.8.bb
END 0 ./openmoko-3rdparty/babiloo-efl_bzr.bb
END 0 ./openmoko-3rdparty/epiano_0.3.1.bb
END 0 ./openmoko-3rdparty/openmoko-gps_0.0.1+svnr9.bb
END 0 ./opensync/libopensync-plugin-evo2-sync_0.22.bb
END 0 ./opensync/libopensync-plugin-file-sync_0.22.bb
END 0 ./opensync/libopensync-plugin-file_0.18.bb
END 0 ./opensync/libopensync-plugin-gpe_0.18.bb
END 0 ./opensync/libopensync-plugin-irmc-sync_0.22.bb
END 0 ./opensync/libopensync-plugin-irmc_0.18.bb
END 0 ./opensync/libopensync-plugin-syncml-client-plugin_0.1.bb
END 0 ./opensync/libopensync_0.22.bb
END 0 ./opensync/msynctool_0.22.bb
END 0 ./opensync/syncml-client_0.1.bb
END 0 ./openvpn/openvpn_1.5.0.bb
END 0 ./perl/libintl-perl_1.11.bb
END 0 ./perl/libio-socket-inet6-perl_2.57.bb
END 0 ./phalanx/phalanx_22.bb
END 0 ./phoneme/phoneme-advanced-foundation_0.0.b87.bb
END 0 ./phoneme/phoneme-advanced-personal-qt3_0.0.b87.bb
END 0 ./picocom/picocom_1.3.bb
END 0 ./pmtools/pmtools_20050926.bb
END 0 ./prism54/prism54-module_1.2.bb
END 0 ./puzzles/puzzles_r7436.bb
END 0 ./pwc/pwc_10.0.6a.bb
END 0 ./pwc/pwc_10.0.9-rc1.bb
END 0 ./pwlib/pwlib_1.6.6.4.bb
END 0 ./qc-usb/qc-usb-messenger_0.8.bb
END 0 ./qc-usb/qc-usb-messenger_1.1.bb
END 0 ./quake/quake1_0.0.1.bb
END 0 ./quake/quetoo_0.6.1.bb
END 0 ./qxmp/qxmp_1.0.bb
END 0 ./rp-pppoe/rp-pppoe_3.5.bb
END 0 ./rtmp/get-iplayer_2.64.bb
END 0 ./rxvt-unicode/rxvt-unicode_5.2.bb
END 0 ./sablevm/sablevm-classpath_1.1.9.bb
END 0 ./sablevm/sablevm-classpath_1.11.3.bb
END 0 ./sablevm/sablevm_1.1.9.bb
END 0 ./schroedinger/gst-plugin-schroedinger_1.0.9.bb
END 0 ./scsi-idle/scsi-idle_2.4.23.bb
END 0 ./scummvm/opie-scummvm_1.0.1.bb
END 0 ./servlet-api/jsp2.0_5.5.26.bb
END 0 ./sidplay-base/sidplay-base_1.0.9.bb
END 0 ./silo/silo_1.4.8.bb
END 0 ./skype/skype-static_2.0.0.72.bb
END 0 ./skype/skype_2.0.0.72.bb
END 0 ./smpeg/smpeg_0.4.4+0.4.5cvs20040311.bb
END 0 ./soundtracker/soundtracker-gtk2_0.6.7.bb
END 0 ./spca5xx/spca5xx_20060501.bb
END 0 ./sphinx-search/sphinx_0.9.8.bb
END 0 ./startup-notification/startup-notification_0.5.bb
END 0 ./tango/tango-icon-theme-extras_0.1.0.bb
END 0 ./thc/hydra_4.4.bb
END 0 ./ti/ti-cgt6x-native_6.0.21.bb
END 0 ./ti/ti-cgt6x-native_6.1.9.bb
END 0 ./ti/ti-codec-engine_2.24.01.bb
END 0 ./ti/ti-codec-engine_2.25.01.bb
END 0 ./ti/ti-codecs-dm365_1.0.6.bb
END 0 ./ti/ti-codecs-omap3530_1.01.bb
END 0 ./ti/ti-codecs-omapl137_1.0.bb
END 0 ./ti/ti-dm365mm-module_1.0.1.bb
END 0 ./ti/ti-dspbios-native_5.33.02.bb
END 0 ./ti/ti-dspbios-native_5.33.04.bb
END 0 ./ti/ti-dsplink-module_1.61.3.bb
END 0 ./ti/ti-dvsdk-demos_3.10.00.00.bb
END 0 ./tsclient/tsclient_0.132.bb
END 0 ./tsclient/tsclient_0.140.bb
END 0 ./u-boot/u-boot-omap3beagleboard_1.1.4.bb
END 0 ./u2nl/u2nl_1.3.bb
END 0 ./uml-utilities/uml-utilities_20040406.bb
END 0 ./unicap/unicap_0.9.3.bb
END 0 ./unicap/unicap_0.9.4.bb
END 0 ./usbutils/usbmodeswitch_1.0.7.bb
END 0 ./usrp/usrp_0.12.bb
END 0 ./valgrind/valgrind_3.2.1.bb
END 0 ./vlc/vlc-davinci_0.8.6h.bb
END 0 ./watchdog/watchdog_5.2.6.bb
END 0 ./watchdog/watchdog_5.4.bb
END 0 ./whois/whois_5.0.0.bb
END 0 ./wlags-modules/kernel-module-wlags49-h1-cs_718.bb
END 0 ./wlags-modules/kernel-module-wlags49-h2-cs_718.bb
END 0 ./wrt/wrt-utils.bb
-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


