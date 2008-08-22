Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KWfP6-0004AG-Rv
	for openembedded-devel@openembedded.org; Sat, 23 Aug 2008 00:46:49 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KWfNq-0005hw-Qe
	for openembedded-devel@openembedded.org; Fri, 22 Aug 2008 22:45:30 +0000
Received: from ip-62-143-12-162.hsi.ish.de ([62.143.12.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 22 Aug 2008 22:45:30 +0000
Received: from no2spam by ip-62-143-12-162.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 22 Aug 2008 22:45:30 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 23 Aug 2008 00:45:30 +0200
Message-ID: <g8nfi3$viv$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-12-162.hsi.ish.de
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
Sender: news <news@ger.gmane.org>
Subject: bitbake world
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
X-List-Received-Date: Fri, 22 Aug 2008 22:46:49 -0000
Content-Type: multipart/mixed; boundary="------------050909090204020307000604"

--------------050909090204020307000604
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

as I wrote here previously, I am trying my luck with "bitbake world". 
And boy-oh-boy, I must have been the first to do so since 2006. 
Anyways, pb was kind enough to help me with one stubborn circular 
dependency in udhcp and so I could move on.  Today was the first day 
after locally dropping recipes left and right that "bitbake world" 
actually got to the compile stage.  Before, it would always abort, 
because the dependency tree was unresolvable.  It was suggested in IRC 
that I sent the list of stuff I had to temporarily drop to oe-devel.  It 
has about 200 entries.  So, here it is (I hope the attachment makes it 
through).  I'll keep the list at http://oss.leggewie.org/wip/dropped.txt 
current.  My compile tests were for qemuarm/.dev/spitz.

Regards

Rolf
  dropped  packages/angstrom/angstrom-bootmanager.bb
  dropped  packages/antlr/antlr-native_2.7.5.bb
  dropped  packages/antlr/antlr_2.7.5.bb
  dropped  packages/boost-asio/boost-asio_0.3.7.bb
  dropped  packages/bt950-cs/bt950-cs_0.1.bb
  dropped  packages/elfkickers/elfkickers-native_2.0a.bb
  dropped  packages/elfkickers/elfkickers_2.0a.bb
  dropped  packages/feh/feh-1.2.6
  dropped  packages/feh/feh-1.2.6/cross.patch
  dropped  packages/feh/feh-1.2.7
  dropped  packages/feh/feh-1.2.7/cross.patch
  dropped  packages/feh/feh_1.2.6.bb
  dropped  packages/feh/feh_1.2.7.bb
  dropped  packages/freesmartphone/task-pyneo.bb
  dropped  packages/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb
  dropped  packages/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb
  dropped  packages/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb
  dropped  packages/gpe-todo/gpe-todo-hildon_0.54.bb
  dropped  packages/gpe-todo/gpe-todo-hildon_0.55.bb
  dropped  packages/gpephone/firewall_svn.bb
  dropped  packages/gpephone/libmsgenabler2_svn.bb
  dropped  packages/gpephone/libmsgenabler_1.0.bb
  dropped  packages/gpephone/libmsgenabler_svn.bb
  dropped  packages/gpephone/phoneserver
  dropped  packages/gpephone/phoneserver/changeport.patch
  dropped  packages/gpephone/phoneserver/phoneserver-gta01.patch
  dropped  packages/gpephone/phoneserver_1.0.bb
  dropped  packages/gpephone/sms-1.0
  dropped  packages/gpephone/sms-1.0/somefixes.patch
  dropped  packages/gpephone/sms_1.0.bb
  dropped  packages/gpephone/sms_1.1.bb
  dropped  packages/gthumb/gthumb_2.6.9.bb
  dropped  packages/images/nylon-image-extended.bb
  dropped  packages/inputpipe/inputpipe_svn.bb
  dropped  packages/juce/juce_1.29.bb
  dropped  packages/kdepimpi
  dropped  packages/kdepimpi/files
  dropped  packages/kdepimpi/files/gcc4.patch
  dropped  packages/kdepimpi/files/gcc42.patch
  dropped  packages/kdepimpi/files/qt-mt.patch
  dropped  packages/kdepimpi/kdepimpi-base.inc
  dropped  packages/kdepimpi/kdepimpi-qte.inc
  dropped  packages/kdepimpi/kdepimpi-x11
  dropped  packages/kdepimpi/kdepimpi-x11/kabc.patch
  dropped  packages/kdepimpi/kdepimpi-x11/kammu.patch
  dropped  packages/kdepimpi/kdepimpi-x11/korganizer.patch
  dropped  packages/kdepimpi/kdepimpi-x11/libkcal.patch
  dropped  packages/kdepimpi/kdepimpi-x11/nomail.patch
  dropped  packages/kdepimpi/kdepimpi-x11.inc
  dropped  packages/kdepimpi/kdepimpi-x11_2.2.3.bb
  dropped  packages/kdepimpi/kdepimpi_2.2.7.bb
  dropped  packages/kdepimpi/kphonepi_1.0.0.bb
  dropped  packages/kdepimpi/ktimetrackerpi_0.9.7.bb
  dropped  packages/kdepimpi/pwmpi.inc
  dropped  packages/kdepimpi/pwmpi_2.2.7.bb
  dropped  packages/libao/libao-plugin-alsa_0.8.6.bb
  dropped  packages/libdbi/libdbi-drivers_0.7.1.bb
  dropped  packages/libgpepimc/libgpepimc-hildon_0.5.bb
  dropped  packages/libqanava/libqanava_0.0.7.bb
  dropped  packages/librcf/librcf_0.4.bb
  dropped  packages/maemo/audiofile_0.2.6-3osso4.bb
  dropped  packages/maemo/hildon-control-panel
  dropped  packages/maemo/hildon-control-panel/config-path.patch
  dropped  packages/maemo/hildon-control-panel/noWerror.patch
  dropped  packages/maemo/hildon-control-panel_0.9.1-1.2.bb
  dropped  packages/maemo/hildon-status-bar
  dropped  packages/maemo/hildon-status-bar/source.patch
  dropped  packages/maemo/hildon-status-bar_0.8.11-1.bb
  dropped  packages/maemo/lessertunjo_0.0.10.bb
  dropped  packages/maemo/libosso-help
  dropped  packages/maemo/libosso-help/help-header-pp.patch
  dropped  packages/maemo/libosso-help/no-Werror.patch
  dropped  packages/maemo/libosso-help_1.0.01.bb
  dropped  packages/maemo/libosso_0.8.9.bb
  dropped  packages/maemo/osso-af-settings_0.8.5.bb
  dropped  packages/maemo/osso-af-startup
  dropped  packages/maemo/osso-af-startup/launch-no-o.patch
  dropped  packages/maemo/osso-af-startup/osso-af-startup-source.patch
  dropped  packages/maemo/osso-af-startup_0.28-1.bb
  dropped  packages/maemo/osso-af-utils_0.4.bb
  dropped  packages/maemo/osso-app-killer_0.4-3.bb
  dropped  packages/maemo/osso-application-installer
  dropped  packages/maemo/osso-application-installer/fix-buildsystem.patch
  dropped  packages/maemo/osso-application-installer_1.0.03-1.bb
  dropped  packages/maemo/osso-bttools_0.25.1.bb
  dropped  packages/maemo/osso-core-config_200515.1.bb
  dropped  packages/maemo/osso-dsp-headers_0.1.bb
  dropped  packages/maemo/osso-esd_0.5.bb
  dropped  packages/maemo/osso-gwconnect
  dropped  packages/maemo/osso-gwconnect/osso-gwconnect-stdio.patch
  dropped  packages/maemo/osso-gwconnect_0.70.1.bb
  dropped  packages/maemo/osso-gwobex_0.26.1.bb
  dropped  packages/maemo/osso-sounds_0.3-1.bb
  dropped  packages/maemo-mapper/files
  dropped  packages/maemo-mapper/files/fix_segfault.patch
  dropped  packages/maemo-mapper/files/mapper-hildon1.diff
  dropped  packages/maemo-mapper/maemo-mapper-nohildon_svn.bb
  dropped  packages/maemo-mapper/maemo-mapper_svn.bb
  dropped  packages/maemo4/hildon-control-panel_2.0.1.bb
  dropped  packages/maemo4/hildon-thumbnail.inc
  dropped  packages/maemo4/hildon-thumbnail_0.14.bb
  dropped  packages/maemo4/libconic_0.13.bb
  dropped  packages/maemo4/libhildon
  dropped  packages/maemo4/libhildon/libhildon-buildfix.patch
  dropped  packages/maemo4/libhildon.inc
  dropped  packages/maemo4/libhildon_1.99.0.bb
  dropped  packages/maemo4/libhildonfm
  dropped  packages/maemo4/libhildonfm/libhildonfm-gtkmaemo-ifdef.patch
  dropped  packages/maemo4/libhildonfm.inc
  dropped  packages/maemo4/libhildonfm_1.9.46.bb
  dropped  packages/maemo4/libhildonhelp.inc
  dropped  packages/maemo4/libhildonhelp_1.9.6.bb
  dropped  packages/maemo4/libhildonmime.inc
  dropped  packages/maemo4/libhildonmime_1.10.0.bb
  dropped  packages/maemo4/libhildonmime_1.9.5.bb
  dropped  packages/maemo4/libosso
  dropped  packages/maemo4/libosso/libosso-buildfix.patch
  dropped  packages/maemo4/libosso-gsf_1.11.10.4.bb
  dropped  packages/maemo4/libosso-help_2.1.2.bb
  dropped  packages/maemo4/libosso.inc
  dropped  packages/maemo4/libosso_2.13.bb
  dropped  packages/maemo4/osso-gnome-vfs2
  dropped  packages/maemo4/osso-gnome-vfs2/gnome-vfs-no-kerberos.patch
  dropped  packages/maemo4/osso-gnome-vfs2_2.16.3.bb
  dropped  packages/maemo4/osso-gwconnect.inc
  dropped  packages/maemo4/osso-gwconnect_1.0.12.bb
  dropped  packages/maemo4/osso-ic-oss
  dropped  packages/maemo4/osso-ic-oss/dbus-api-update.patch
  dropped  packages/maemo4/osso-ic-oss_1.0.4.bb
  dropped  packages/mamona/mamona-sound-n800_0.1.0.bb
  dropped  packages/meta
  dropped  packages/meta/cross-linkage_1.0.bb
  dropped  packages/meta/distro-feed-configs.bb
  dropped  packages/meta/external-toolchain.bb
  dropped  packages/meta/foonas-packages.bb
  dropped  packages/meta/mamona-buildall.inc
  dropped  packages/meta/meta-angstrom-2007.bb
  dropped  packages/meta/meta-e-x11-core.bb
  dropped  packages/meta/meta-e-x11.bb
  dropped  packages/meta/meta-gpe-extras.bb
  dropped  packages/meta/meta-gpe.bb
  dropped  packages/meta/meta-gpephone.bb
  dropped  packages/meta/meta-maemo.bb
  dropped  packages/meta/meta-mamona-light.bb
  dropped  packages/meta/meta-mamona.bb
  dropped  packages/meta/meta-nas-server.bb
  dropped  packages/meta/meta-opie-all.bb
  dropped  packages/meta/meta-opie.bb
  dropped  packages/meta/meta-sdl.bb
  dropped  packages/meta/meta-sectest-gpe.bb
  dropped  packages/meta/meta-toolchain-gpe-sbox.bb
  dropped  packages/meta/meta-toolchain-gpe.bb
  dropped  packages/meta/meta-toolchain-neuros.bb
  dropped  packages/meta/meta-toolchain-openmoko.bb
  dropped  packages/meta/meta-toolchain-sbox.bb
  dropped  packages/meta/meta-toolchain-slugos.bb
  dropped  packages/meta/meta-toolchain.bb
  dropped  packages/meta/nylon-feed.bb
  dropped  packages/meta/nylon-feed.inc
  dropped  packages/meta/openmoko-feed.bb
  dropped  packages/meta/openprotium-packages.bb
  dropped  packages/meta/oplinux-packages.bb
  dropped  packages/meta/package-index.bb
  dropped  packages/meta/slugos-native-packages.bb
  dropped  packages/meta/slugos-native.bb
  dropped  packages/meta/slugos-packages.bb
  dropped  packages/meta/staging-linkage_1.0.bb
  dropped  packages/meta/unslung-packages.bb
  dropped  packages/meta/xbase-clients.bb
  dropped  packages/midpath/midpath-backend-gtk-hildon_0.2+0.3rc1.bb
  dropped  packages/minisip
  dropped  packages/minisip/libmikey_svn.bb
  dropped  packages/minisip/libmnetutil_svn.bb
  dropped  packages/minisip/libmsip_svn.bb
  dropped  packages/minisip/libmutil0_svn.bb
  dropped  packages/minisip/minisip-video_svn.bb
  dropped  packages/minisip/minisip_svn.bb
  dropped  packages/neuros-public/neuros-app-photoalbum_git.bb
  dropped  packages/neuros-public/neuros-app-vplayer_git.bb
  dropped  packages/neuros-public/neuros-lib-gui_git.bb
  dropped  packages/neuros-public/neuros-lib-widgets_git.bb
  dropped  packages/neuros-public/neuros-mainmenu_git.bb
  dropped  packages/neuros-public/neuros-nwm_git.bb
  dropped  packages/neuros-public/neuros-qt-plugins_git.bb
  dropped  packages/openmoko-base/openmoko-session_svn.bb
  dropped  packages/opie-i18n/opie-i18n_1.2.3.bb
  dropped  packages/opie-i18n/opie-i18n_cvs.bb
  dropped  packages/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb
  dropped  packages/qpf-fonts/qpf-bitstream-vera_1.10.bb
  dropped  packages/qt4/qt-embedded_4.4.1.bb
  dropped  packages/sphyrna/sphyrna_svn.bb
  dropped  packages/swt/swt3.4-gtk-hildon_3.3+3.4M3.bb
  dropped  packages/swt/swt3.4-gtk-hildon_3.3+3.4M5.bb
  dropped  packages/tasks/task-gmae.bb
  dropped  packages/tasks/task-gpe.bb
  dropped  packages/tasks/task-gpephone.bb
  dropped  packages/tasks/task-maemo.bb
  dropped  packages/tasks/task-mamona-extras.bb
  dropped  packages/tasks/task-mamona-nokia-it.bb
  dropped  packages/tasks/task-mamona.bb
  dropped  packages/tasks/task-openprotium.bb
  dropped  packages/tasks/task-python-sharprom_20060425.bb
  dropped  packages/tasks/task-qpe.bb
  dropped  packages/tasks/task-sdk-extra.bb
  dropped  packages/tasks/task-sdk-gpephone.bb
  dropped  packages/tracker/tracker_0.5.4.bb
  dropped  packages/ukeyboard
  dropped  packages/ukeyboard/ukeyboard_1.2.bb

--------------050909090204020307000604--
