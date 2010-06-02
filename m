Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OJoEn-0005uT-5r
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 15:44:07 +0200
Received: by fxm9 with SMTP id 9so985544fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 06:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=LVsT5cmlpuUE6hHfYuiOP0xItPKa7NxYiQObHet87Cw=;
	b=sheKlhmZN3jjnGtaa6yjVHmBu2C05FBEz7OSMFBWQv0bof2Dx6yFnKQogv1plu69au
	WPHvWGVRYPLzGgBHPW+82Bd4ZYgWap4dPdmPLdBSRoIrSdegC8e5GkH7EPqG4cxfDtbz
	yHbrUB8r6RL5cd6WPjSzaUUcbLhJgzkgmemUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uNtEgvZ3O9CJ6pjHOUFJSRaVxog87/4MLynexlq5AOrROsebDb8Bh074dinVWrodor
	tyu3E00aeZtuez9J0LhAhEexFwQhs2NmKzPd0pikuO52ZqEwjFzYL4tAvXTNYo1WdBW0
	qn64gxSY5MDPhcVFki7QdxXj+GqrWdQmpbzLU=
Received: by 10.223.18.67 with SMTP id v3mr8645911faa.93.1275485990328;
	Wed, 02 Jun 2010 06:39:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id g10sm52375475fai.0.2010.06.02.06.39.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 06:39:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 15:39:31 +0200
Message-Id: <1275485971-23536-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Scanned: No (on linuxtogo.org);
	Message bigger than SAmaxbody (256000)
Subject: [PATCH] recipes: conform to OE packaging guidelines with RDEPENDS/RREDEPENDS
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
X-List-Received-Date: Wed, 02 Jun 2010 13:44:07 -0000

* there is probably very few cases when it's needed without _${PN},
  if you find one in attached patch, please enlighten me
* there is maybe few possible fixes also in bbclasses
  cpan-base.bbclass:RDEPENDS  += "${@["perl", ""][(bb.data.inherits_class('native', d))]}"
  distutils-base.bbclass:RDEPENDS += "python-core"
  gtk-icon-cache.bbclass:RDEPENDS += "hicolor-icon-theme"
  image.bbclass:RDEPENDS += "${IMAGE_INSTALL} ${IMAGE_BOOT}"
  module.bbclass:RDEPENDS += "kernel (${KERNEL_VERSION}) update-modules"
  ?opie_i18n.bbclass:      rdepends =  bb.data.getVar("RDEPENDS", d, 1)
  ?opie_i18n.bbclass:                      bb.data.setVar('RDEPENDS_%s' % x[0].lower(), pn, d)
  ?opie_i18n.bbclass:              bb.data.setVar('RDEPENDS', rdepends, d)
  rubyextension.bbclass:RDEPENDS += "ruby"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/abiword/abiword-2.5.inc                    |    2 +-
 recipes/abiword/abiword-plugins_2.4.6.bb           |    2 +-
 recipes/abiword/abiword-plugins_2.5.1.bb           |    2 +-
 recipes/abiword/abiword-plugins_2.5.2.bb           |    2 +-
 recipes/abiword/abiword-plugins_2.6.0.bb           |    2 +-
 recipes/abiword/abiword-plugins_2.6.4.bb           |    2 +-
 recipes/abiword/abiword-plugins_2.6.8.bb           |    2 +-
 recipes/abiword/abiword.inc                        |    2 +-
 recipes/accelges/accelges_svn.bb                   |    2 +-
 .../aceofpenguins/aceofpenguins-launcher_0.4.bb    |    2 +-
 recipes/angstrom/angstrom-bootmanager.bb           |    2 +-
 .../angstrom/angstrom-gnome-icon-theme-enable.bb   |    2 +-
 recipes/angstrom/angstrom-x11-base-depends.bb      |    2 +-
 recipes/angstrom/angstrom-x11vnc-xinit.bb          |    2 +-
 recipes/angstrom/angstrom-zeroconf-audio.bb        |    2 +-
 recipes/angstrom/epiphany-firefox-replacement.bb   |    2 +-
 recipes/anki/anki.inc                              |    4 ++--
 recipes/anki/anki_0.4.3.bb                         |    2 +-
 recipes/aoetools/aoetools_29.bb                    |    2 +-
 recipes/apache2/apache2_2.2.14.bb                  |    2 +-
 recipes/apache2/apache2_2.2.3.bb                   |    2 +-
 .../application-registry_0.1.bb                    |    2 +-
 recipes/apt/apt_0.7.14.bb                          |    2 +-
 recipes/apt/apt_0.7.19.bb                          |    2 +-
 recipes/apt/apt_0.7.20.2.bb                        |    2 +-
 recipes/ark3116/ark3116_0.4.1.bb                   |    2 +-
 recipes/arpwatch/arpwatch_2.1a15.bb                |    2 +-
 recipes/at76c503a/at76c503a-modules_0.17.bb        |    2 +-
 recipes/avahi/avahi.inc                            |    2 +-
 recipes/balsa/balsa_2.0.17.bb                      |    2 +-
 recipes/barnyard/barnyard_0.2.0.bb                 |    2 +-
 .../bash-completion/bash-completion_20040711.bb    |    2 +-
 recipes/batmand/batmand.inc                        |    2 +-
 recipes/bitbake/bitbake.inc                        |    2 +-
 recipes/blipomoko/blipomoko_git.bb                 |    2 +-
 recipes/blueman/blueman_1.10.bb                    |    2 +-
 recipes/blueman/blueman_1.21.bb                    |    2 +-
 recipes/bluez/bluez-gnome_1.8.bb                   |    2 +-
 recipes/boa/boa_0.94.13.bb                         |    2 +-
 recipes/bogofilter/bogofilter_0.96.6.bb            |    2 +-
 recipes/bootchart/bootchart_0.9.bb                 |    2 +-
 recipes/bridge-utils/bridge-utils.inc              |    2 +-
 recipes/bt-configure/bt-configure_git.bb           |    2 +-
 recipes/bt-gps/bt-gps.bb                           |    2 +-
 recipes/bt950-cs/bt950-cs_0.1.bb                   |    2 +-
 recipes/busybox/busybox.inc                        |    4 ++--
 recipes/cacao/cacao-cldc.inc                       |    2 +-
 recipes/cacao/cacao.inc                            |    2 +-
 recipes/callrec/callrec_svn.bb                     |    2 +-
 recipes/callweaver/callweaver-perl.bb              |    2 +-
 recipes/callweaver/callweaver_1.2.0-rc5.bb         |    4 ++--
 recipes/cbrpager/cbrpager.inc                      |    2 +-
 recipes/ccid/ccid_1.3.8.bb                         |    2 +-
 recipes/cellhunter/cellhunter_0.5.0.bb             |    2 +-
 recipes/cfu1/cfu1-modules_2.6.bb                   |    2 +-
 recipes/changedfiles/changedfiles.inc              |    2 +-
 recipes/char-driver/char-driver.bb                 |    2 +-
 recipes/chicken/chicken_4.2.0.bb                   |    2 +-
 recipes/chillispot/chillispot_0.98.bb              |    2 +-
 recipes/chillispot/chillispot_1.0RC3.bb            |    2 +-
 recipes/connman/mokonnect_svn.bb                   |    2 +-
 recipes/corsair/corsair_0.2.6.bb                   |    2 +-
 recipes/crda/crda_1.1.1.bb                         |    2 +-
 recipes/cryptsetup/cryptsetup_1.0.5.bb             |    2 +-
 recipes/ctorrent/ctcs_1.4.1.bb                     |    2 +-
 recipes/cup/cup-native_0.10k.bb                    |    2 +-
 recipes/cup/cup_0.10k.bb                           |    2 +-
 recipes/ddclient/ddclient_3.6.3.bb                 |    2 +-
 recipes/detect-stylus/detect-stylus_0.10.bb        |    2 +-
 recipes/detect-stylus/detect-stylus_0.13.bb        |    2 +-
 recipes/detect-stylus/detect-stylus_svn.bb         |    2 +-
 recipes/devlabel/devlabel_0.48.01.bb               |    2 +-
 recipes/dhcdbd/dhcdbd_2.0.bb                       |    2 +-
 recipes/dhcdbd/dhcdbd_3.0.bb                       |    2 +-
 recipes/dictator/dictator_0.2.bb                   |    2 +-
 recipes/dillo/dillo2_0.6.6.bb                      |    2 +-
 recipes/dillo/dillo2_2.1.1.bb                      |    2 +-
 recipes/distcc/distcc_2.18.3.bb                    |    2 +-
 recipes/distcc/distcc_3.1.bb                       |    2 +-
 recipes/dpkg/dpkg-native.inc                       |    2 +-
 recipes/dpkg/dpkg.inc                              |    2 +-
 recipes/dropbear/dropbear-early_1.0.bb             |    2 +-
 recipes/dvd+rw-tools/dvd+rw-tools_7.1.bb           |    2 +-
 recipes/e17/elementary-alarm_svn.bb                |    2 +-
 recipes/e17/entrance_0.9.0.010.bb                  |    2 +-
 recipes/e17/exalt_svn.bb                           |    2 +-
 recipes/e17/expedite_svn.bb                        |    2 +-
 recipes/e17/exquisite_svn.bb                       |    2 +-
 recipes/e2fsprogs/e2fsprogs.inc                    |    2 +-
 recipes/ebrainy/ebrainy_svn.bb                     |    2 +-
 recipes/eciadsl/eciadsl_0.11.bb                    |    2 +-
 recipes/eglibc/eglibc.inc                          |    2 +-
 recipes/ekiga/ekiga_3.0.2.bb                       |    2 +-
 recipes/ekiga/ekiga_3.1.0.bb                       |    2 +-
 recipes/ekiga/ekiga_3.2.0.bb                       |    2 +-
 recipes/ekiga/ekiga_3.2.4.bb                       |    2 +-
 recipes/ekiga/ekiga_3.2.5.bb                       |    2 +-
 recipes/ekiga/ekiga_git.bb                         |    2 +-
 recipes/enchant/enchant_1.1.3.bb                   |    2 +-
 recipes/enchant/enchant_1.2.5.bb                   |    2 +-
 recipes/enchant/enchant_1.3.0.bb                   |    2 +-
 recipes/evince/evince_0.5.2.bb                     |    4 ++--
 recipes/evince/evince_0.6.1.bb                     |    4 ++--
 recipes/evince/evince_0.9.0.bb                     |    4 ++--
 recipes/evince/evince_0.9.2.bb                     |    4 ++--
 recipes/evince/evince_2.20.0.bb                    |    4 ++--
 recipes/evince/evince_2.23.4.bb                    |    4 ++--
 recipes/evince/evince_2.24.1.bb                    |    2 +-
 recipes/evince/evince_2.26.2.bb                    |    2 +-
 recipes/evince/evince_2.28.0.bb                    |    2 +-
 recipes/evince/evince_2.30.0.bb                    |    2 +-
 recipes/evopedia/evopedia_git.bb                   |    4 ++--
 recipes/fakeroot/fakeroot-native_1.12.4.bb         |    2 +-
 recipes/fakeroot/fakeroot_1.12.4.bb                |    2 +-
 recipes/fakeroot/fakeroot_1.9.6.bb                 |    2 +-
 recipes/fbida/fbida_2.07.bb                        |    2 +-
 recipes/fbset/fbset_2.1.bb                         |    2 +-
 recipes/ffalarms/atd-over-fso_0.70.bb              |    2 +-
 recipes/ffalarms/ffalarms_git.bb                   |    2 +-
 recipes/file-roller/file-roller_2.28.0.bb          |    2 +-
 recipes/flnx/flnx_0.17.bb                          |    2 +-
 recipes/flnx/flnx_0.18.bb                          |    2 +-
 recipes/fltk/fltkcocktailbar_svn.bb                |    2 +-
 recipes/fltk/fltkcurrency_svn.bb                   |    4 ++--
 recipes/fltk/fltkhackdiet_svn.bb                   |    2 +-
 recipes/flumotion/flumotion_0.4.1.bb               |    2 +-
 recipes/foonas-init/foonas-init_0.10.bb            |    2 +-
 recipes/forte/forte.inc                            |    2 +-
 recipes/fpdf/fpdf_1.53.bb                          |    2 +-
 recipes/freesmartphone/fso-gsm0710muxd_git.bb      |    2 +-
 recipes/freesmartphone/fsodatad_git.bb             |    2 +-
 recipes/freesmartphone/fsodeviced_git.bb           |    4 ++--
 recipes/freesmartphone/fsomusicd_git.bb            |    6 +++---
 recipes/freesmartphone/fsonetworkd_git.bb          |    2 +-
 recipes/freesmartphone/gsmd2_git.bb                |    2 +-
 recipes/freesmartphone/opimd-utils_git.bb          |    2 +-
 recipes/freesmartphone/zhone_git.bb                |    2 +-
 recipes/fuse/curlftpfs_0.9.2.bb                    |    2 +-
 recipes/fuse/fuse-module_2.6.5.bb                  |    2 +-
 recipes/fuse/fuse-module_2.7.1.bb                  |    2 +-
 recipes/fuse/fuse-module_2.7.4.bb                  |    2 +-
 recipes/fuse/gmailfs.inc                           |    2 +-
 recipes/g15daemon/g15daemon_1.2.6a.bb              |    4 ++--
 recipes/gabriel/gabriel_svn.bb                     |    2 +-
 recipes/galculator/galculator_1.2.3.bb             |    2 +-
 recipes/gallery/gallery_1.5.5.bb                   |    2 +-
 recipes/geda/geda-xgsch2pcb_0.1.2.bb               |    2 +-
 recipes/geda/geda_1.4.3.bb                         |    4 ++--
 recipes/ghettotooth/ghettotooth.bb                 |    2 +-
 recipes/giftcurs/giftcurs_0.6.2.bb                 |    2 +-
 recipes/gkdial/gkdial_1.8.1.bb                     |    2 +-
 recipes/gnome-mplayer/gecko-mediaplayer_0.9.8.bb   |    2 +-
 recipes/gnome-mplayer/gecko-mediaplayer_svn.bb     |    2 +-
 recipes/gnome-mplayer/gnome-mplayer.inc            |    2 +-
 recipes/gnome/epiphany_2.21.92.bb                  |    2 +-
 recipes/gnome/epiphany_2.22.1.bb                   |    2 +-
 recipes/gnome/epiphany_2.24.0.bb                   |    2 +-
 recipes/gnome/epiphany_2.24.2.bb                   |    2 +-
 recipes/gnome/epiphany_2.27.1.bb                   |    2 +-
 recipes/gnome/epiphany_2.28.0.bb                   |    2 +-
 recipes/gnome/epiphany_2.30.0.bb                   |    2 +-
 recipes/gnome/epiphany_2.30.2.bb                   |    2 +-
 recipes/gnome/epiphany_svn.bb                      |    2 +-
 recipes/gnome/gconf_2.28.0.bb                      |    2 +-
 recipes/gnome/gedit_2.26.2.bb                      |    2 +-
 recipes/gnome/gedit_2.28.0.bb                      |    2 +-
 recipes/gnome/gedit_2.30.0.bb                      |    2 +-
 recipes/gnome/gnome-dvb-daemon_0.1.14.bb           |    2 +-
 recipes/gnome/gnome-icon-theme_2.28.0.bb           |    4 ++--
 recipes/gnome/gnome-mime-data_2.18.0.bb            |    2 +-
 recipes/gnome/gnome-mime-data_2.4.2.bb             |    2 +-
 recipes/gnome/gnome-python_2.22.1.bb               |    2 +-
 recipes/gnome/gnome-python_2.26.1.bb               |    2 +-
 recipes/gnome/gnome-python_2.28.0.bb               |    2 +-
 recipes/gnome/gnome-python_2.28.1.bb               |    2 +-
 recipes/gnome/gnome-themes_2.28.0.bb               |    2 +-
 recipes/gnome/gnome-vfs_2.22.0.bb                  |    2 +-
 recipes/gnome/gnome-vfs_2.24.1.bb                  |    2 +-
 recipes/gnome/libgsf_1.13.3.bb                     |    2 +-
 recipes/gnome/libgsf_1.14.16.bb                    |    2 +-
 recipes/gnome/libgsf_1.14.8.bb                     |    2 +-
 recipes/gnome/system-tools-backends_2.10.0.bb      |    2 +-
 recipes/gnome/system-tools-backends_2.8.3.bb       |    2 +-
 recipes/gnuchess/fltk-chess_0.5.bb                 |    2 +-
 recipes/gnuchess/fltk-chess_0.51.bb                |    2 +-
 recipes/gourmet/gourmet_0.15.2.bb                  |    2 +-
 recipes/gpe-aerial/gpe-aerial_0.2.11.bb            |    2 +-
 recipes/gpe-aerial/gpe-aerial_0.2.12.bb            |    2 +-
 recipes/gpe-aerial/gpe-aerial_0.2.13.bb            |    2 +-
 recipes/gpe-aerial/gpe-aerial_0.3.0.bb             |    2 +-
 recipes/gpe-aerial/gpe-aerial_svn.bb               |    2 +-
 recipes/gpe-autostarter/gpe-autostarter_0.11.bb    |    2 +-
 recipes/gpe-autostarter/gpe-autostarter_0.12.bb    |    2 +-
 recipes/gpe-autostarter/gpe-autostarter_0.6.bb     |    2 +-
 recipes/gpe-autostarter/gpe-autostarter_0.7.bb     |    2 +-
 recipes/gpe-autostarter/gpe-autostarter_svn.bb     |    2 +-
 recipes/gpe-beam/gpe-beam_0.2.3.bb                 |    2 +-
 recipes/gpe-beam/gpe-beam_0.2.6.bb                 |    2 +-
 recipes/gpe-beam/gpe-beam_0.2.7.bb                 |    2 +-
 recipes/gpe-beam/gpe-beam_0.2.8.bb                 |    2 +-
 recipes/gpe-beam/gpe-beam_0.2.9.bb                 |    2 +-
 recipes/gpe-bluetooth/gpe-bluetooth.inc            |    2 +-
 recipes/gpe-bootsplash/gpe-bootsplash-theme-e.bb   |    2 +-
 .../gpe-bootsplash-theme-gpephone.bb               |    2 +-
 .../gpe-bootsplash/gpe-bootsplash-theme-opie.bb    |    2 +-
 recipes/gpe-calendar/gpe-calendar_0.72.bb          |    2 +-
 recipes/gpe-calendar/gpe-calendar_0.90.bb          |    2 +-
 recipes/gpe-calendar/gpe-calendar_0.91.bb          |    2 +-
 recipes/gpe-calendar/gpe-calendar_0.92.bb          |    2 +-
 recipes/gpe-calendar/gpe-calendar_svn.bb           |    2 +-
 recipes/gpe-clock/gpe-clock.inc                    |    2 +-
 recipes/gpe-contacts/gpe-contacts.inc              |    2 +-
 recipes/gpe-contacts/gpe-contacts_0.45.bb          |    2 +-
 recipes/gpe-contacts/gpe-contacts_0.46.bb          |    2 +-
 recipes/gpe-contacts/gpe-contacts_0.47.bb          |    2 +-
 recipes/gpe-contacts/gpe-contacts_0.49.bb          |    2 +-
 recipes/gpe-contacts/gpe-contacts_svn.bb           |    2 +-
 recipes/gpe-filemanager/gpe-filemanager_0.23.bb    |    4 ++--
 recipes/gpe-filemanager/gpe-filemanager_0.24.bb    |    4 ++--
 recipes/gpe-filemanager/gpe-filemanager_0.25.bb    |    4 ++--
 recipes/gpe-filemanager/gpe-filemanager_0.30.bb    |    4 ++--
 recipes/gpe-filemanager/gpe-filemanager_0.31.bb    |    4 ++--
 recipes/gpe-filemanager/gpe-filemanager_svn.bb     |    4 ++--
 recipes/gpe-go/gpe-go_0.05.bb                      |    2 +-
 recipes/gpe-helpviewer/gpe-helpviewer_1.0.bb       |    2 +-
 recipes/gpe-icons/gpe-icons.inc                    |    2 +-
 recipes/gpe-login/gpe-login_0.93.bb                |    2 +-
 recipes/gpe-login/gpe-login_svn.bb                 |    2 +-
 recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb  |    2 +-
 recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb  |    2 +-
 recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb  |    2 +-
 recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb  |    2 +-
 recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb  |    2 +-
 recipes/gpe-mini-browser/gpe-mini-browser_svn.bb   |    2 +-
 recipes/gpe-mininet/gpe-mininet_0.6.bb             |    2 +-
 recipes/gpe-mininet/gpe-mininet_0.7.bb             |    2 +-
 recipes/gpe-mininet/gpe-mininet_svn.bb             |    2 +-
 recipes/gpe-nmf/gpe-nmf.inc                        |    4 ++--
 recipes/gpe-nmf/gpe-nmf_0.17.bb                    |    4 ++--
 recipes/gpe-nmf/gpe-nmf_0.20.bb                    |    2 +-
 recipes/gpe-nmf/gpe-nmf_0.21.bb                    |    2 +-
 recipes/gpe-nmf/gpe-nmf_0.22.bb                    |    4 ++--
 recipes/gpe-package/gpe-package_0.2.bb             |    2 +-
 recipes/gpe-package/gpe-package_0.3.bb             |    2 +-
 recipes/gpe-package/gpe-package_0.4.bb             |    2 +-
 recipes/gpe-plucker/gpe-plucker_0.4.bb             |    2 +-
 recipes/gpe-question/gpe-question_0.04.bb          |    2 +-
 recipes/gpe-shield/gpe-shield_0.9.bb               |    4 ++--
 recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb     |    2 +-
 recipes/gpe-terminal/gpe-terminal_1.1.bb           |    2 +-
 recipes/gpe-terminal/gpe-terminal_svn.bb           |    2 +-
 recipes/gpe-themes/gpe-theme-clearlooks_0.2.bb     |    2 +-
 recipes/gpe-themes/gpe-theme-clearlooks_0.3.bb     |    2 +-
 recipes/gpe-themes/gpe-theme-e17_0.1.bb            |    2 +-
 recipes/gpe-themes/gpe-theme-foxbox_0.1.bb         |    2 +-
 recipes/gpe-themes/gpe-theme-industrial_0.1.bb     |    2 +-
 recipes/gpe-themes/gpe-theme-industrial_0.2.bb     |    2 +-
 recipes/gpe-timesheet/gpe-timesheet.inc            |    2 +-
 recipes/gpe-todo/gpe-todo-hildon_0.54.bb           |    2 +-
 recipes/gpe-todo/gpe-todo-hildon_0.55.bb           |    2 +-
 recipes/gphoto2/ptp-gadget_git.bb                  |    2 +-
 recipes/gpio-event/gpio-event.bb                   |    2 +-
 recipes/gqview/gqview_2.1.5.bb                     |    2 +-
 recipes/grdesktop/grdesktop_0.23.bb                |    2 +-
 recipes/gsm/gsmd.inc                               |    2 +-
 recipes/gspcav1/gspcav1_20070110.bb                |    2 +-
 recipes/gspcav1/gspcav1_20070508.bb                |    2 +-
 recipes/gstreamer/gst-player_svn.bb                |    2 +-
 recipes/gtk+/gdk-pixbuf-csource-native_2.12.11.bb  |    2 +-
 recipes/gtk-sharp/gtk-sharp.inc                    |    2 +-
 recipes/gtk-webcore/osb-browser_20050430.bb        |    2 +-
 recipes/gtk-webcore/osb-browser_20060212.bb        |    2 +-
 recipes/gtk-webcore/osb-browser_svn.bb             |    2 +-
 .../gtk2-theme-angelistic_0.3.bb                   |    2 +-
 recipes/gxine/gxine_0.4.1.bb                       |    4 ++--
 recipes/gxine/gxine_0.4.1enhanced.bb               |    4 ++--
 recipes/hal/hal.inc                                |    4 ++--
 recipes/help2man/help2man_1.36.4.bb                |    2 +-
 .../hicolor-icon-theme/hicolor-icon-theme_0.10.bb  |    4 ++--
 .../hicolor-icon-theme/hicolor-icon-theme_0.11.bb  |    4 ++--
 recipes/hostap/hostap-conf_1.0.bb                  |    2 +-
 recipes/hostap/hostap-daemon.inc                   |    2 +-
 recipes/hostap/hostap-modules.inc                  |    2 +-
 recipes/hotplug-dbus/hotplug-dbus_0.9.bb           |    2 +-
 recipes/hotplug-qcop/hotplug-qcop_cvs.bb           |    2 +-
 recipes/hsetroot/hsetroot_1.0.2.bb                 |    2 +-
 recipes/htb-init/htb-init_0.8.5.bb                 |    4 ++--
 recipes/ica/ica-bin_10.6.bb                        |    2 +-
 recipes/icewm/icewm_1.2.30.bb                      |    2 +-
 recipes/images/shr-image.bb                        |    2 +-
 recipes/images/shr-image.inc                       |    2 +-
 recipes/initrdscripts/initramfs-jffs2_0.1.bb       |    2 +-
 recipes/initrdscripts/initramfs-module-aufs_1.0.bb |    2 +-
 .../initrdscripts/initramfs-module-block_1.0.bb    |    2 +-
 .../initramfs-module-bootldr-buster_1.0.bb         |    2 +-
 .../initrdscripts/initramfs-module-bootmenu_1.0.bb |    4 ++--
 .../initramfs-module-check-modules_1.0.bb          |    2 +-
 recipes/initrdscripts/initramfs-module-ext3_1.0.bb |    2 +-
 .../initrdscripts/initramfs-module-initfs_1.0.bb   |    4 ++--
 .../initramfs-module-kexecboot_1.0.bb              |    2 +-
 recipes/initrdscripts/initramfs-module-loop_1.0.bb |    4 ++--
 recipes/initrdscripts/initramfs-module-nfs_1.0.bb  |    4 ++--
 .../initrdscripts/initramfs-module-psplash_1.0.bb  |    2 +-
 .../initrdscripts/initramfs-module-squashfs_1.0.bb |    2 +-
 recipes/initrdscripts/initramfs-uniboot_1.0.bb     |    2 +-
 recipes/initscripts/initscripts-openmoko_1.0.bb    |    2 +-
 recipes/initscripts/initscripts-slugos_1.0.bb      |    2 +-
 recipes/initscripts/initscripts_1.0.bb             |    2 +-
 recipes/intltool/intltool_0.35.0.bb                |    4 ++--
 recipes/intltool/intltool_0.35.2.bb                |    4 ++--
 recipes/intltool/intltool_0.35.5.bb                |    4 ++--
 recipes/intone-video/intone-video_svn.bb           |    2 +-
 recipes/intone/intone_svn.bb                       |    2 +-
 recipes/iotop/iotop_0.2.1.bb                       |    2 +-
 recipes/ipaq-sleep/ipaq-sleep_0.9.bb               |    2 +-
 .../ipkg-utils-native_1.6+cvs20050404.bb           |    2 +-
 recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb   |    2 +-
 recipes/iptables/iptables.inc                      |    2 +-
 recipes/ipython/ipython_0.10.bb                    |    2 +-
 recipes/ipython/ipython_0.9.1.bb                   |    2 +-
 recipes/iscsi-target/iscsi-target_0.4.17.bb        |    2 +-
 recipes/iscsi-target/iscsi-target_1.4.19.bb        |    2 +-
 recipes/iscsi-target/iscsi-target_svn.bb           |    2 +-
 recipes/ivman/ivman_0.6.14.bb                      |    2 +-
 recipes/jaaa/clxclient_3.6.1.bb                    |    2 +-
 recipes/jakarta-commons/commons-beanutils_1.8.0.bb |    2 +-
 .../jakarta-commons/commons-configuration_1.5.bb   |    2 +-
 recipes/jakarta-commons/commons-digester_1.8.bb    |    2 +-
 recipes/jakarta-commons/commons-discovery_0.4.bb   |    2 +-
 recipes/jakarta-commons/commons-el_1.0.bb          |    2 +-
 .../jakarta-commons/commons-fileupload_1.2.1.bb    |    2 +-
 recipes/jakarta-commons/commons-httpclient_3.1.bb  |    2 +-
 recipes/jakarta-commons/commons-jxpath_1.3.bb      |    2 +-
 .../jakarta-commons/commons-net-native_1.4.1.bb    |    2 +-
 recipes/jakarta-commons/commons-net_1.4.1.bb       |    2 +-
 recipes/jamvm/jamvm-native.inc                     |    2 +-
 recipes/jamvm/jamvm.inc                            |    2 +-
 recipes/jards/jards_1.0.bb                         |    4 ++--
 recipes/jcraft/jsch-native_0.1.40.bb               |    2 +-
 recipes/jcraft/jsch_0.1.40.bb                      |    2 +-
 recipes/jikes/jikes_1.22.bb                        |    2 +-
 recipes/jlex/jlex-native_1.2.6.bb                  |    2 +-
 recipes/jlex/jlex_1.2.6.bb                         |    2 +-
 recipes/julius/ti-julius-demo_r962.bb              |    2 +-
 recipes/kernbench/kernbench_0.41.bb                |    2 +-
 recipes/keylaunch/keylaunch_2.0.10.bb              |    2 +-
 recipes/knights/knights_1.14.bb                    |    2 +-
 recipes/kxml2/kxml2_2.3.0.bb                       |    2 +-
 recipes/libgpewidget/libgpewidget-hildon_0.102.bb  |    2 +-
 recipes/libgpewidget/libgpewidget_0.115.bb         |    2 +-
 recipes/libopieobex/libopieobex0.inc               |    2 +-
 recipes/linux/linux-mtx-1_2.4.27.bb                |    2 +-
 recipes/linux/linux-mtx-2_2.4.27.bb                |    2 +-
 recipes/linux/linux-mtx-3_2.6.15.4.bb              |    2 +-
 recipes/linux/linux-mtx-3_2.6.15.bb                |    2 +-
 recipes/linux/linux-sgh-i900_2.6.32.bb             |    2 +-
 recipes/lirc/lirc_0.8.0.bb                         |    2 +-
 recipes/lirc/lirc_0.8.1+cvs20070307.bb             |    2 +-
 recipes/lirc/lirc_0.8.4a.bb                        |    2 +-
 recipes/lirc/lirc_0.8.5.bb                         |    2 +-
 recipes/litephone/litephone.inc                    |    2 +-
 recipes/lmbench/lmbench_2.0.4.bb                   |    2 +-
 recipes/lmbench/lmbench_2.5.bb                     |    2 +-
 recipes/logic-analyzer/logic-analyzer_0.8.bb       |    2 +-
 recipes/logrotate-script/logrotate-script_cvs.bb   |    2 +-
 recipes/logrotate/logrotate_3.7.1.bb               |    2 +-
 recipes/lua/lua-gtk2_0.3.bb                        |    2 +-
 recipes/lxde/lxpanel_0.3.99.bb                     |    2 +-
 recipes/lyx/lyx_1.6.1.bb                           |    2 +-
 recipes/lyx/lyx_1.6.4.1.bb                         |    2 +-
 recipes/madwifi/madwifi-modules_0.9.3.bb           |    2 +-
 recipes/madwifi/madwifi-modules_cvs-bsd.bb         |    2 +-
 recipes/madwifi/madwifi-modules_cvs.bb             |    2 +-
 recipes/madwifi/madwifi-ng_r.inc                   |    2 +-
 recipes/maemo-mapper/maemo-mapper-nohildon_svn.bb  |    2 +-
 recipes/maemo-mapper/maemo-mapper_svn.bb           |    4 ++--
 .../maemo/osso-application-installer_1.0.03-1.bb   |    2 +-
 recipes/maemo/osso-core-config_200515.1.bb         |    2 +-
 recipes/maemo/sdk-default-theme-config_1.0-1.bb    |    2 +-
 recipes/mailx/mailx_8.1.2-0.20050715cvs.bb         |    2 +-
 recipes/mamona/mamona-sound-n770_0.1.0.bb          |    2 +-
 recipes/mamona/mamona-sound-n800_0.1.0.bb          |    2 +-
 recipes/mamona/udev-usbserial_0.1.bb               |    2 +-
 recipes/mamona/usbnet_0.1.0.bb                     |    2 +-
 recipes/man-pages/man-pages_3.21.bb                |    2 +-
 recipes/matchbox-common/matchbox-common_0.9.1.bb   |    2 +-
 recipes/matchbox-common/matchbox_0.8.1.bb          |    2 +-
 recipes/matchbox-common/matchbox_0.9.1.bb          |    2 +-
 recipes/matchbox-common/matchbox_0.9.bb            |    2 +-
 .../matchbox-config-gtk/matchbox-config-gtk_svn.bb |    2 +-
 recipes/matchbox-desktop/matchbox-desktop_0.9.1.bb |    2 +-
 recipes/matchbox-panel/matchbox-panel_0.8.bb       |    2 +-
 recipes/matchbox-sato/matchbox-sato_0.1.bb         |    2 +-
 recipes/matchbox-session/matchbox-session.bb       |    2 +-
 recipes/matchbox-themes-gtk/matchbox-themes-gtk.bb |    2 +-
 recipes/matchbox-wm/matchbox-wm_0.9.5.bb           |    2 +-
 recipes/matchbox-wm/matchbox-wm_1.0.bb             |    2 +-
 recipes/matchbox-wm/matchbox-wm_1.1.bb             |    2 +-
 recipes/matchbox-wm/matchbox-wm_1.2.bb             |    2 +-
 recipes/matchbox-wm/matchbox-wm_svn.bb             |    2 +-
 recipes/matchbox2/matchbox-desktop-2_svn.bb        |    2 +-
 recipes/matchbox2/matchbox2_2.0.bb                 |    2 +-
 recipes/mb-desktop-xine/mb-desktop-xine_0.4.bb     |    2 +-
 recipes/mc/mc.inc                                  |    2 +-
 recipes/mdk/mdk2_v33.bb                            |    2 +-
 recipes/mesa/mesa-dri_6.5.2.bb                     |    2 +-
 recipes/mesa/mesa-dri_7.0.3.bb                     |    2 +-
 recipes/mesa/mesa_6.4.1+cvs20060101.bb             |    2 +-
 recipes/meta/canadian-sdk.bb                       |    2 +-
 recipes/meta/meta-angstrom-2007.bb                 |    8 ++++----
 recipes/meta/meta-e-x11-core.bb                    |    2 +-
 recipes/meta/meta-e-x11.bb                         |    2 +-
 recipes/meta/meta-gpe-extras.bb                    |    2 +-
 recipes/meta/meta-gpe.bb                           |    2 +-
 recipes/meta/meta-maemo.bb                         |    2 +-
 recipes/meta/meta-mamona-light.bb                  |    2 +-
 recipes/meta/meta-mamona.bb                        |    2 +-
 recipes/meta/meta-nas-server.bb                    |    2 +-
 recipes/meta/meta-opie-all.bb                      |    2 +-
 recipes/meta/meta-opie.bb                          |    2 +-
 recipes/meta/meta-sdl.bb                           |    2 +-
 recipes/meta/meta-toolchain.bb                     |    2 +-
 recipes/meta/openmoko-feed.bb                      |    2 +-
 recipes/meta/slugos-native.bb                      |    2 +-
 recipes/meta/xbase-clients.bb                      |    2 +-
 recipes/midpath/midpath-core_0.2+0.3rc2.bb         |    2 +-
 recipes/midpath/midpath-demos_0.2+0.3rc2.bb        |    2 +-
 recipes/midpath/midpath-maemo_0.2+0.3rc2.bb        |    2 +-
 recipes/midpath/midpath-openmoko_0.2+0.3rc2.bb     |    2 +-
 recipes/midpath/midpath.inc                        |    2 +-
 recipes/mime-support/mime-support_3.28.bb          |    2 +-
 recipes/mime-support/mime-support_3.44.bb          |    2 +-
 recipes/miniclipboard/miniclipboard_0.3.bb         |    2 +-
 recipes/minipredict/libdictionary.bb               |    2 +-
 recipes/mipl-mipv6/mipv6_2.0.2.bb                  |    2 +-
 recipes/misc-binary-only/acx-firmware_1.0.bb       |    2 +-
 recipes/misc-binary-only/prism-firmware.bb         |    2 +-
 .../prism2-firmware-update_1.7.4.bb                |    2 +-
 recipes/moblin/bickley_git.bb                      |    2 +-
 recipes/modphp/modphp5.inc                         |    2 +-
 .../module-init-tools-cross_3.2.2.bb               |    2 +-
 recipes/mokoko/mokoko_svn.bb                       |    2 +-
 recipes/mono-xsp/mono-xsp_1.2.5.bb                 |    2 +-
 recipes/mono-xsp/mono-xsp_2.4.2.bb                 |    2 +-
 recipes/mozilla/firefox-addon.inc                  |    2 +-
 recipes/mozilla/firefox-l10n.inc                   |    2 +-
 recipes/mozilla/thunderbird_1.0.7.bb               |    2 +-
 recipes/mplayer/mplayer-maemo_svn.bb               |    2 +-
 recipes/mplayer/mplayer_0.0+1.0rc1.bb              |    2 +-
 recipes/mplayer/mplayer_0.0+1.0rc2.bb              |    2 +-
 recipes/mplayer/mplayer_git.bb                     |    2 +-
 recipes/mplayer/mplayer_svn.bb                     |    2 +-
 recipes/mrtg/mrtg.inc                              |    2 +-
 recipes/mtkbabel/mtkbabel_0.8.bb                   |    2 +-
 recipes/musicpd/mpd-alsa_0.11.5.bb                 |    2 +-
 recipes/musicpd/mpd-alsa_0.14.2.bb                 |    2 +-
 recipes/nautilus/nautilus-cd-burner_2.24.0.bb      |    2 +-
 recipes/nautilus/nautilus_2.24.2.bb                |    2 +-
 recipes/nautilus/nautilus_2.26.1.bb                |    2 +-
 recipes/nautilus/nautilus_2.28.0.bb                |    2 +-
 recipes/nautilus/nautilus_2.28.1.bb                |    2 +-
 recipes/nautilus/nautilus_2.30.0.bb                |    2 +-
 recipes/navit/navit-icons_svn.bb                   |    2 +-
 recipes/navit/navit.inc                            |    2 +-
 recipes/navit/navit_svn.bb                         |    4 ++--
 recipes/netbook-launcher/human-icon-theme_0.35.bb  |    4 ++--
 recipes/netkit-tftp/netkit-tftpd_0.17.bb           |    2 +-
 recipes/netpbm/netpbm_10.28.bb                     |    6 +++---
 recipes/networkmanager/cnetworkmanager_git.bb      |    2 +-
 recipes/networkmanager/netm-cli_0.2.bb             |    2 +-
 recipes/networkmanager/netm-cli_git.bb             |    2 +-
 .../network-manager-applet_0.7.1.997.bb            |    2 +-
 .../networkmanager/network-manager-applet_0.7.1.bb |    2 +-
 .../networkmanager/network-manager-applet_0.8.bb   |    2 +-
 .../networkmanager/network-manager-applet_git.bb   |    2 +-
 recipes/networkmanager/networkmanager-0.7.inc      |    2 +-
 .../networkmanager/networkmanager-applet_0.6.6.bb  |    2 +-
 .../networkmanager/networkmanager-applet_svn.bb    |    2 +-
 .../networkmanager/networkmanager-openvpn_0.7.1.bb |    2 +-
 .../networkmanager/networkmanager-openvpn_0.8.bb   |    2 +-
 recipes/networkmanager/networkmanager-pre0.7.inc   |    2 +-
 recipes/networkmanager/networkmanager.inc          |    2 +-
 recipes/networkmanager/networkmanager_0.6.4.bb     |    2 +-
 recipes/nfs-utils/nfs-utils_1.0.6.bb               |    4 ++--
 recipes/nfs-utils/nfs-utils_1.1.2.bb               |    4 ++--
 recipes/nonworking/e2fsprogs/e2fsprogs.inc         |    2 +-
 recipes/nonworking/e2fsprogs/e2fsprogs_1.41.2.bb   |    2 +-
 .../gpe-contacts/gpe-contacts-hildon_0.40.bb       |    2 +-
 .../gpe-contacts/gpe-contacts-hildon_0.42.bb       |    2 +-
 recipes/nonworking/gpe-contacts/gpe-contacts.inc   |    2 +-
 recipes/nonworking/greader/greader_0.61.bb         |    2 +-
 recipes/nonworking/icecast/icecast_2.2.0.bb        |    4 ++--
 recipes/nonworking/imkit/imkit_0.4.5.bb            |    2 +-
 recipes/nonworking/linux/linux-mtx-1_2.4.24.bb     |    2 +-
 recipes/nonworking/meta/meta-gpephone.bb           |    2 +-
 recipes/nonworking/meta/meta-sectest-gpe.bb        |    2 +-
 .../nonworking/monotone-viz/monotone-viz_0.11.bb   |    2 +-
 .../opie-mediaplayer1-libmpeg3plugin_cvs.bb        |    2 +-
 recipes/nonworking/pixdev/pixdev-stable_0.1.bb     |    2 +-
 recipes/nonworking/python/python-gsl_0.2.0.bb      |    2 +-
 recipes/nonworking/python/python-pyx_0.6.bb        |    2 +-
 recipes/nonworking/python/python-sword_1.5.10.bb   |    2 +-
 recipes/notifier/notifier_0.2.bb                   |    2 +-
 recipes/ntfs-3g/ntfs-3g_1.0.bb                     |    2 +-
 recipes/ntfs-3g/ntfs-3g_2009.4.4.bb                |    2 +-
 recipes/ntpclient/ntpclient_2003_194.bb            |    2 +-
 recipes/ntpclient/ntpclient_2007_365.bb            |    2 +-
 recipes/numptyphysics/numptyphysics_svn.bb         |    2 +-
 recipes/nunome/nunome_1.0.2.bb                     |    2 +-
 recipes/nxcl/libnxcl_0.9.bb                        |    2 +-
 recipes/nylon/nylon-config.bb                      |    2 +-
 recipes/nylon/nylon-scripts_cvs.bb                 |    2 +-
 recipes/nylon/nylon-statistics.bb                  |    2 +-
 recipes/nylon/simple-firewall.bb                   |    2 +-
 recipes/obsolete/antlr/antlr_2.7.5.bb              |    2 +-
 recipes/obsolete/ffalarms/ffalarms_0.2.2.bb        |    2 +-
 .../obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb    |    2 +-
 .../openmoko-3rdparty/babiloo-efl_2.0.9-3.bb       |    2 +-
 .../openmoko-3rdparty/babiloo-efl_2.0.9-4.bb       |    2 +-
 recipes/obsolete/python/python-efl.inc             |    2 +-
 recipes/obsolete/python/python-epsilon_svn.bb      |    2 +-
 recipes/obsolete/python/python-etk_svn.bb          |    2 +-
 recipes/obsolete/shr/etk-theme.inc                 |    2 +-
 .../libframeworkd-phonegui-efl-theme-neo_git.bb    |    2 +-
 recipes/obsolete/tasks/task-bootstrap-unionroot.bb |    4 ++--
 recipes/obsolete/tasks/task-bootstrap.bb           |    4 ++--
 .../obsolete/xorg-xserver/xserver-xorg_1.6.1.bb    |    2 +-
 recipes/obsolete/zd1211/zd1211_r77.bb              |    2 +-
 recipes/obsolete/zd1211/zd1211_r83.bb              |    2 +-
 recipes/octave/octave.inc                          |    2 +-
 recipes/offlineimap/offlineimap_4.0.14.bb          |    2 +-
 recipes/omview/omview_svn.bb                       |    2 +-
 recipes/openbmap/openbmap-logger_0.2.0.bb          |    2 +-
 recipes/openbmap/openbmap-logger_0.4.0.bb          |    2 +-
 recipes/openbsc/openbsc.inc                        |    2 +-
 recipes/opencv/opencv_1.0.0.bb                     |    2 +-
 recipes/openjade/openjade_1.3.2.bb                 |    2 +-
 recipes/openmoko-3rdparty/advancedcaching_git.bb   |    2 +-
 recipes/openmoko-3rdparty/babiloo-efl_2.0.9-10.bb  |    2 +-
 recipes/openmoko-3rdparty/babiloo-efl_bzr.bb       |    2 +-
 recipes/openmoko-3rdparty/calc_0.0.4.bb            |    2 +-
 recipes/openmoko-3rdparty/calc_git.bb              |    2 +-
 recipes/openmoko-3rdparty/emtooth_svn.bb           |    2 +-
 recipes/openmoko-3rdparty/iliwi_git.bb             |    2 +-
 recipes/openmoko-3rdparty/neolight_svn.bb          |    2 +-
 recipes/openmoko-3rdparty/neomis_svn.bb            |    2 +-
 recipes/openmoko-3rdparty/numberx_svn.bb           |    2 +-
 recipes/openmoko-3rdparty/om-neon_svn.bb           |    2 +-
 .../openmoko-3rdparty/openmoko-gps_0.0.1+svnr9.bb  |    2 +-
 recipes/openmoko-3rdparty/pisi_0.5.3.bb            |    2 +-
 recipes/openmoko-3rdparty/podboy_svn.bb            |    2 +-
 recipes/openmoko-3rdparty/rtmom_0.1.3.bb           |    2 +-
 .../openmoko-3rdparty/settingsgui_0.7+0.8-beta.bb  |    2 +-
 recipes/openmoko-3rdparty/spojegui_svn.bb          |    2 +-
 recipes/openmoko-3rdparty/thone_0.7.bb             |    2 +-
 recipes/openmoko-3rdparty/ventura_svn.bb           |    2 +-
 recipes/openmoko-base/openmoko-session_svn.bb      |    2 +-
 .../openmoko-base/openmoko-sound-system_0.1.0.bb   |    2 +-
 .../openmoko-panel-memory_svn.bb                   |    2 +-
 .../openmoko-projects/assassin-thumbnail_svn.bb    |    2 +-
 recipes/openmoko-projects/assassin_svn.bb          |    2 +-
 recipes/openmoko-projects/enlazar_svn.bb           |    2 +-
 recipes/openmoko-projects/om-settings_svn.bb       |    2 +-
 recipes/openmoko-projects/paroli_git.bb            |    2 +-
 recipes/openmoko-projects/pyefl-sudoku_svn.bb      |    2 +-
 recipes/openmoko-system/ompower_svn.bb             |    2 +-
 recipes/openmoko2/neod_svn.bb                      |    2 +-
 recipes/openmoko2/openmoko-appearance_svn.bb       |    2 +-
 recipes/openmoko2/openmoko-contacts2_svn.bb        |    2 +-
 recipes/openmoko2/openmoko-dates2_svn.bb           |    2 +-
 recipes/openmoko2/openmoko-mediaplayer2_svn.bb     |    2 +-
 recipes/openmoko2/openmoko-sound-system2_0.1.0.bb  |    2 +-
 recipes/openmoko2/openmoko-tasks2_svn.bb           |    2 +-
 recipes/openmoko2/openmoko-today2_svn.bb           |    2 +-
 recipes/openmoko2/settingsgui_0.8.bb               |    2 +-
 recipes/openprotium-init/openprotium-init_0.10.bb  |    2 +-
 recipes/openswan/openswan_2.2.0.bb                 |    2 +-
 recipes/openswan/openswan_2.4.7.bb                 |    2 +-
 recipes/opensync/libopensync-plugin-file_0.18.bb   |    2 +-
 recipes/opensync/libopensync-plugin-gpe_0.18.bb    |    2 +-
 recipes/opensync/libopensync-plugin-irmc_0.18.bb   |    2 +-
 recipes/opensync/libopensync-plugin.inc            |    2 +-
 recipes/opensync/libsyncml_0.5.4.bb                |    2 +-
 recipes/openttd/openttd_0.7.4.bb                   |    2 +-
 recipes/openvpn/openvpn.inc                        |    2 +-
 recipes/openvz/vzctl_3.0.23.bb                     |    2 +-
 recipes/opie-addressbook/opie-addressbook.inc      |    2 +-
 recipes/opie-advancedfm/opie-advancedfm.inc        |    2 +-
 recipes/opie-alarm/opie-alarm.inc                  |    2 +-
 .../opie-bluetoothmanager.inc                      |    2 +-
 .../opie-button-settings/opie-button-settings.inc  |    2 +-
 recipes/opie-camera/opie-camera.inc                |    2 +-
 recipes/opie-citytime/opie-citytime.inc            |    2 +-
 recipes/opie-console/opie-console.inc              |    2 +-
 .../opie-datebook-birthdayplugin.inc               |    2 +-
 .../opie-datebook-chrisholidayplugin.inc           |    2 +-
 .../opie-datebook-nationalholidayplugin.inc        |    2 +-
 recipes/opie-datebook/opie-datebook.inc            |    2 +-
 recipes/opie-dvorak/opie-dvorak.inc                |    2 +-
 .../opie-embeddedkonsole/opie-embeddedkonsole.inc  |    2 +-
 .../opie-examples-python/opie-examples-python.inc  |    2 +-
 recipes/opie-eye/opie-eye.inc                      |    2 +-
 recipes/opie-freetype/opie-freetype.inc            |    2 +-
 recipes/opie-keyboard/opie-keyboard.inc            |    2 +-
 recipes/opie-kjumpx/opie-kjumpx.inc                |    2 +-
 recipes/opie-lockapplet/opie-lockapplet.inc        |    2 +-
 recipes/opie-login/opie-login.inc                  |    2 +-
 recipes/opie-mail/opie-mail.inc                    |    2 +-
 .../opie-mediaplayer1-libmadplugin.inc             |    2 +-
 .../opie-mediaplayer1-libmodplugin.inc             |    2 +-
 .../opie-mediaplayer1-libtremorplugin.inc          |    2 +-
 .../opie-mediaplayer1-libwavplugin.inc             |    2 +-
 .../opie-mediaplayer1/opie-mediaplayer1-core.inc   |    2 +-
 recipes/opie-mediaplayer1/opie-mediaplayer1.inc    |    4 ++--
 recipes/opie-mediaplayer2/opie-mediaplayer2.inc    |    4 ++--
 recipes/opie-multikey/opie-multikey.inc            |    4 ++--
 recipes/opie-networkapplet/opie-networkapplet.inc  |    2 +-
 recipes/opie-pimconverter/opie-pimconverter.inc    |    2 +-
 recipes/opie-remote/opie-remote.inc                |    2 +-
 .../opie-securityplugin-blueping.inc               |    2 +-
 .../opie-securityplugins/opie-securityplugin.inc   |    2 +-
 recipes/opie-sh-snes/opie-sh-snes.inc              |    2 +-
 recipes/opie-sh-snes/opie-sh-snes_0.2.bb           |    2 +-
 recipes/opie-sshkeys/opie-sshkeys.inc              |    2 +-
 recipes/opie-stumbler/opie-stumbler.inc            |    2 +-
 recipes/opie-systemtime/opie-systemtime.inc        |    2 +-
 recipes/opie-taskbar/opie-taskbar.inc              |    2 +-
 .../opie-today-addressbookplugin.inc               |    2 +-
 .../opie-today-datebookplugin.inc                  |    2 +-
 .../opie-today-fortuneplugin.inc                   |    2 +-
 .../opie-today-mailplugin.inc                      |    2 +-
 .../opie-today-todolistplugin.inc                  |    2 +-
 .../opie-today-weatherplugin.inc                   |    2 +-
 recipes/opie-todo/opie-todo.inc                    |    2 +-
 recipes/opie-vmemo/opie-vmemo.inc                  |    2 +-
 recipes/opie-wellenreiter/opie-wellenreiter.inc    |    2 +-
 recipes/opie-zkbapplet/opie-zkbapplet.inc          |    2 +-
 recipes/opkg-utils/opkg-utils-native_svn.bb        |    2 +-
 recipes/opkg-utils/opkg-utils_svn.bb               |    2 +-
 recipes/opkg/opkg-ipkg-compat.bb                   |    2 +-
 recipes/oprofile/oprofile.inc                      |    4 ++--
 recipes/oprofile/oprofile_cvs.bb                   |    2 +-
 recipes/orinoco/orinoco-conf_1.0.bb                |    2 +-
 recipes/orinoco/orinoco-modules_0.15rc1.bb         |    2 +-
 recipes/orinoco/orinoco-modules_0.15rc2.bb         |    2 +-
 recipes/orinoco/orinoco-modules_cvs.bb             |    2 +-
 recipes/p910nd/p910nd_0.92.bb                      |    2 +-
 recipes/pam/libpam-base-files.bb                   |    4 ++--
 recipes/pcmanfm/pcmanfm_0.5.bb                     |    2 +-
 recipes/pcmcia-cs/pcmcia-cs_3.2.8.bb               |    2 +-
 recipes/pcmciautils/pcmciautils.inc                |    2 +-
 recipes/perl/libalgorithm-diff-perl_1.1902.bb      |    2 +-
 recipes/perl/libarchive-tar-perl_1.30.bb           |    2 +-
 recipes/perl/libarchive-zip-perl_1.30.bb           |    2 +-
 recipes/perl/libauthen-pam-perl_0.16.bb            |    2 +-
 recipes/perl/libcache-cache-perl_1.06.bb           |    2 +-
 recipes/perl/libclass-container-perl_0.12.bb       |    2 +-
 recipes/perl/libdata-optlist-perl_0.101.bb         |    2 +-
 recipes/perl/libdate-manip-perl_5.54.bb            |    2 +-
 recipes/perl/libdbd-mysql-perl_4.010.bb            |    2 +-
 recipes/perl/libdbi-perl_1.607.bb                  |    2 +-
 recipes/perl/libdevice-serialport-perl_1.04.bb     |    2 +-
 recipes/perl/libemail-date-format-perl_1.002.bb    |    2 +-
 recipes/perl/libexception-class-perl_1.23.bb       |    2 +-
 recipes/perl/libhtml-parser-perl_3.60.bb           |    2 +-
 recipes/perl/libhtml-parser-perl_3.64.bb           |    2 +-
 recipes/perl/libhtml-treebuilder-perl_3.23.bb      |    2 +-
 recipes/perl/libintl-perl_1.11.bb                  |    2 +-
 recipes/perl/libintl-perl_1.16.bb                  |    2 +-
 recipes/perl/libintl-perl_1.20.bb                  |    2 +-
 recipes/perl/libio-zlib-perl_1.04.bb               |    2 +-
 recipes/perl/libio-zlib-perl_1.10.bb               |    2 +-
 recipes/perl/libmath-bigint-gmp-perl_1.18.bb       |    2 +-
 recipes/perl/libmime-lite-perl_3.024.bb            |    2 +-
 recipes/perl/libmodule-build-perl_0.2805.bb        |    2 +-
 recipes/perl/libmodule-load-perl_0.16.bb           |    2 +-
 recipes/perl/libnet-dbus-perl_0.33.5.bb            |    2 +-
 recipes/perl/libnet-dbus-perl_0.33.6.bb            |    2 +-
 recipes/perl/libnet-ip-perl_1.25.bb                |    2 +-
 recipes/perl/libnet-rawip-perl_0.25.bb             |    2 +-
 recipes/perl/libparams-util-perl_0.20.bb           |    2 +-
 recipes/perl/libsub-exporter-perl_0.970.bb         |    2 +-
 recipes/perl/libsub-install-perl_0.922.bb          |    2 +-
 recipes/perl/libsub-uplevel-perl_0.13.bb           |    2 +-
 recipes/perl/libtest-builder-tester-perl_1.01.bb   |    2 +-
 recipes/perl/libtest-differences-perl_0.47.bb      |    2 +-
 recipes/perl/libtest-exception-perl_0.22.bb        |    2 +-
 recipes/perl/libtest-mockmodule-perl_0.05.bb       |    2 +-
 recipes/perl/libtest-output-perl_0.10.bb           |    2 +-
 recipes/perl/libtext-diff-perl_0.35.bb             |    2 +-
 recipes/perl/libtimedate-perl_1.20.bb              |    2 +-
 recipes/perl/liburi-perl_1.52.bb                   |    2 +-
 recipes/perl/libxml-dom-perl_1.44.bb               |    2 +-
 recipes/perl/libyaml-perl_0.62.bb                  |    2 +-
 recipes/pimlico/contacts.inc                       |    2 +-
 recipes/pimlico/contacts_svn.bb                    |    4 ++--
 recipes/pimlico/dates.inc                          |    2 +-
 recipes/plone/plone_3.1.7.bb                       |    2 +-
 recipes/poboxserver/qpobox_0.5.4.bb                |    2 +-
 recipes/podget/podget_0.5.8.bb                     |    2 +-
 recipes/poppler/poppler_0.12.3.bb                  |    2 +-
 recipes/poptop/poptop_1.3.0.bb                     |    2 +-
 recipes/povray/povray_3.6.1.bb                     |    2 +-
 recipes/ppp-dialin/ppp-dialin_0.1.bb               |    2 +-
 recipes/ppp-dsl/ppp-dsl_0.1.bb                     |    4 ++--
 recipes/ppp/ppp-gprs_1.0.bb                        |    2 +-
 recipes/pptp-linux/pptp-linux_1.7.1.bb             |    2 +-
 recipes/prboom/prboom_2.4.7.bb                     |    2 +-
 recipes/prboom/prboom_2.5.0.bb                     |    2 +-
 recipes/prism54/prism54-module_1.2.bb              |    4 ++--
 .../prismstumbler/prismstumbler_0.7.3+0.7.4pre1.bb |    4 ++--
 recipes/prismstumbler/prismstumbler_0.7.3.bb       |    2 +-
 recipes/psplash/psplash.inc                        |    2 +-
 recipes/pulseaudio/pulseaudio-alsa-wrapper.bb      |    2 +-
 recipes/pulseaudio/pulseaudio-esd-wrapper.bb       |    2 +-
 recipes/pulseaudio/pulseaudio-meta_0.9.10.bb       |    2 +-
 recipes/pvrusb2-mci/pvrusb2-mci_20060903.bb        |    2 +-
 recipes/pvrusb2-mci/pvrusb2-mci_20080210.bb        |    2 +-
 recipes/pyphonelog/pyphonelog_git.bb               |    2 +-
 recipes/python/pydes_1.3.1.bb                      |    2 +-
 recipes/python/pyring_1.1.10.bb                    |    2 +-
 recipes/python/python-blipapi_0.02.04.bb           |    2 +-
 recipes/python/python-cheetah_2.0.1.bb             |    2 +-
 recipes/python/python-cython-native_0.10.3.bb      |    2 +-
 recipes/python/python-cython-native_0.12.1.bb      |    2 +-
 recipes/python/python-cython-native_0.12.bb        |    2 +-
 recipes/python/python-daap_0.7.1.bb                |    2 +-
 recipes/python/python-ecore_svn.bb                 |    2 +-
 recipes/python/python-edbus_svn.bb                 |    2 +-
 recipes/python/python-edje_svn.bb                  |    2 +-
 recipes/python/python-efl.inc                      |    2 +-
 recipes/python/python-elementary_svn.bb            |    2 +-
 recipes/python/python-emotion_svn.bb               |    2 +-
 recipes/python/python-fam_1.1.1.bb                 |    2 +-
 recipes/python/python-gdata_1.2.4.bb               |    2 +-
 recipes/python/python-imaging_1.1.6.bb             |    2 +-
 recipes/python/python-iniparse-native_0.2.3.bb     |    2 +-
 recipes/python/python-libgmail_0.1.11.bb           |    2 +-
 recipes/python/python-netfilter_0.5.5.bb           |    2 +-
 recipes/python/python-pexpect_2.3.bb               |    2 +-
 recipes/python/python-phoneutils_git.bb            |    2 +-
 recipes/python/python-psyco_1.6.bb                 |    2 +-
 recipes/python/python-pycap_0.1.6.bb               |    2 +-
 recipes/python/python-pycups_1.9.45.bb             |    2 +-
 recipes/python/python-pycurl_7.18.2.bb             |    2 +-
 recipes/python/python-pycurl_7.19.0.bb             |    2 +-
 recipes/python/python-pyfits_1.3.bb                |    2 +-
 recipes/python/python-pyftpdlib_0.5.1.bb           |    2 +-
 recipes/python/python-pygame_1.9.1.bb              |    2 +-
 recipes/python/python-pygoogle_0.6.bb              |    2 +-
 recipes/python/python-pygtk-1.2_0.6.12.bb          |    2 +-
 recipes/python/python-pygtk_2.10.4.bb              |    2 +-
 recipes/python/python-pygtk_2.16.0.bb              |    2 +-
 recipes/python/python-pygtk_2.6.3.bb               |    2 +-
 recipes/python/python-pygtk_2.8.6.bb               |    2 +-
 recipes/python/python-pylint_0.15.2.bb             |    2 +-
 recipes/python/python-pymp3_0.3.4.bb               |    2 +-
 recipes/python/python-pyopenssl_0.8.bb             |    2 +-
 recipes/python/python-pyqt_4.4.3.bb                |    2 +-
 recipes/python/python-pyrad_1.1.bb                 |    2 +-
 recipes/python/python-pyraf_1.7.bb                 |    2 +-
 recipes/python/python-pyrex-native_0.9.8.5.bb      |    2 +-
 recipes/python/python-pyro_3.8.1.bb                |    2 +-
 recipes/python/python-pyserial_2.4.bb              |    2 +-
 recipes/python/python-pysqlite2-native_2.4.0.bb    |    2 +-
 recipes/python/python-pysqlite2_2.4.0.bb           |    2 +-
 recipes/python/python-pyxml_0.8.4.bb               |    2 +-
 recipes/python/python-scapy_2.0.0.9.bb             |    2 +-
 recipes/python/python-scons-native_1.2.0.bb        |    2 +-
 recipes/python/python-setuptools_0.6c9.bb          |    3 +--
 recipes/python/python-simplejson_2.0.7.bb          |    2 +-
 recipes/python/python-sip.inc                      |    2 +-
 recipes/python/python-soappy_0.11.6.bb             |    2 +-
 recipes/python/python-sqlobject_0.10.4.bb          |    2 +-
 recipes/python/python-traits_3.0.3.bb              |    2 +-
 recipes/python/python-twisted_2.5.0.bb             |    2 +-
 recipes/python/python-twisted_8.2.0.bb             |    2 +-
 recipes/python/python-urlgrabber-native_3.1.0.bb   |    2 +-
 recipes/python/python-vobject_0.8.1c.bb            |    2 +-
 recipes/python/python-webpy_0.31.bb                |    2 +-
 recipes/python/yum-metadata-parser-native_1.1.2.bb |    2 +-
 recipes/qpe-gaim/qpe-gaim_20041030.bb              |    2 +-
 recipes/qpe-gaim/qpe-libgaim_1.5.0.bb              |    2 +-
 recipes/qpe-nmap/qpe-nmap_0.02.bb                  |    2 +-
 recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb |    2 +-
 recipes/qpegps/qpegps.inc                          |    2 +-
 recipes/qpf-fonts/qpf.inc                          |    2 +-
 recipes/quasar/quasar_0.9beta3.bb                  |    2 +-
 recipes/qwo/qwo_0.4.bb                             |    2 +-
 recipes/qwo/qwo_0.5.bb                             |    2 +-
 recipes/qxmp/qxmp_1.0.bb                           |    2 +-
 recipes/rcs/rcs_5.7.bb                             |    2 +-
 recipes/remoko/remoko_svn.bb                       |    2 +-
 recipes/resolvconf/resolvconf_1.43.bb              |    2 +-
 recipes/resolvconf/resolvconf_1.45.bb              |    2 +-
 recipes/roadmap/roadmap.inc                        |    2 +-
 recipes/roadster/roadster_cvs.bb                   |    2 +-
 recipes/robostix-module/robostix-module.bb         |    2 +-
 recipes/robostix/robostix.bb                       |    2 +-
 recipes/rox/rox-filer_2.5.bb                       |    2 +-
 recipes/ruby/ruby-dbus_0.2.1.bb                    |    2 +-
 recipes/sablevm/sablevm_1.1.9.bb                   |    2 +-
 recipes/sablevm/sablevm_1.11.3.bb                  |    2 +-
 recipes/sablevm/sablevm_1.12.bb                    |    2 +-
 recipes/scratchbox/sbrsh_7.1.bb                    |    2 +-
 recipes/scummvm/opie-scummvm_1.0.1.bb              |    2 +-
 recipes/servlet-api/jsp2.0_5.5.26.bb               |    2 +-
 recipes/settings-daemon/settings-daemon_svn.bb     |    2 +-
 ...harp-camera-support_2.4.18-rmk7-pxa3-embedix.bb |    2 +-
 recipes/sharp-binary-only/sharp-compat-libs_0.5.bb |    2 +-
 recipes/sharp-binary-only/sharp-sdmmc-support.bb   |    2 +-
 recipes/shfs/shfs-utils_0.35.bb                    |    2 +-
 recipes/shorewall/shorewall_2.0.9-monolithic.bb    |    2 +-
 recipes/shorewall/shorewall_2.0.9.bb               |    4 ++--
 recipes/shr/e-wm-config-illume2-shr_git.bb         |    2 +-
 recipes/shr/e-wm-theme-illume-gry_git.bb           |    2 +-
 recipes/shr/e-wm-theme-illume-neo_git.bb           |    2 +-
 recipes/shr/elementary-theme-gry_git.bb            |    2 +-
 recipes/shr/gtk-theme-neo_git.bb                   |    2 +-
 recipes/shr/gtk-theme.inc                          |    2 +-
 recipes/shr/icon-theme-neo_git.bb                  |    2 +-
 recipes/shr/phoneui-shr-theme-neo_git.bb           |    2 +-
 recipes/shr/phoneui-shr-theme-o2_git.bb            |    2 +-
 recipes/shr/shr-e-gadgets_git.bb                   |    2 +-
 recipes/shr/shr-installer_git.bb                   |    2 +-
 recipes/shr/shr-settings_git.bb                    |    2 +-
 recipes/shr/shr-splash-theme.inc                   |    2 +-
 recipes/shr/shr-splash_git.bb                      |    2 +-
 recipes/shr/shr-theme-gry.bb                       |    2 +-
 recipes/shr/shr-theme-neo.bb                       |    2 +-
 recipes/shr/shr-theme-niebiee.bb                   |    2 +-
 recipes/shr/shr-theme-o2.bb                        |    2 +-
 recipes/shr/shr-theme-sixteen.bb                   |    2 +-
 recipes/shr/shr-today_git.bb                       |    2 +-
 recipes/shr/shr-wizard_git.bb                      |    2 +-
 recipes/slugimage/slugimage-native.bb              |    2 +-
 recipes/slugimage/slugimage.bb                     |    2 +-
 recipes/slugos-init/slugos-init_0.10.bb            |    2 +-
 recipes/slugos-init/slugos-init_4.8.bb             |    2 +-
 recipes/slugos-init/slugos-init_5.0.bb             |    2 +-
 recipes/snes232/snes232_cvs.bb                     |    2 +-
 recipes/snort/snort_2.8.5.3.bb                     |    2 +-
 recipes/spamassassin/spamassassin_3.3.1.bb         |    2 +-
 recipes/squidguard/squidguard_1.4.bb               |    2 +-
 recipes/squidview/squidview_0.72.bb                |    2 +-
 recipes/starling/starling_0.9.bb                   |    4 ++--
 recipes/subversion/subversion_1.4.3.bb             |    2 +-
 recipes/subversion/subversion_1.6.5.bb             |    2 +-
 recipes/sudo/sudo-enable-wheel-group.bb            |    2 +-
 recipes/sudo/sudo_1.7.2p4.bb                       |    2 +-
 recipes/sugar/etoys_3.0.2076.bb                    |    2 +-
 recipes/sugar/etoys_4.0.2212.bb                    |    2 +-
 recipes/sugar/sugar-artwork_0.84.1.bb              |    2 +-
 recipes/sugar/sugar-base_0.82.2.bb                 |    2 +-
 recipes/sugar/sugar-base_0.83.2.bb                 |    2 +-
 recipes/sugar/sugar-base_0.84.1.bb                 |    2 +-
 recipes/sugar/sugar-datastore_0.82.0.bb            |    2 +-
 recipes/sugar/sugar-datastore_0.84.0.bb            |    2 +-
 recipes/sugar/sugar-toolkit_0.84.4.bb              |    2 +-
 recipes/sugar/sugar_0.82.9.bb                      |    2 +-
 recipes/sugar/sugar_0.83.4.bb                      |    2 +-
 recipes/sugar/sugar_0.84.6.bb                      |    2 +-
 recipes/suspend-desktop/suspend-desktop_1.0.bb     |    4 ++--
 recipes/swfdec/swfdec-mozilla_0.7.2.bb             |    2 +-
 recipes/swfdec/swfdec-mozilla_0.7.4.bb             |    2 +-
 recipes/swfdec/swfdec-mozilla_0.8.2.bb             |    2 +-
 recipes/swfdec/swfdec-mozilla_0.9.2.bb             |    2 +-
 recipes/sysconf/sysconf_0.1.bb                     |    2 +-
 recipes/tango/tango-icon-theme-enable.bb           |    2 +-
 recipes/tangogps/tangogps.inc                      |    2 +-
 recipes/tapioca/tapiocaui_0.3.9.1.bb               |    2 +-
 recipes/tasks/mamona-sdk.inc                       |    2 +-
 recipes/tasks/task-devimage.bb                     |    4 ++--
 recipes/tasks/task-efl.bb                          |    2 +-
 recipes/tasks/task-mamona-base.bb                  |    2 +-
 recipes/tasks/task-mamona-devel.bb                 |    2 +-
 recipes/tasks/task-mamona-python.bb                |    2 +-
 recipes/tasks/task-mamona-sdk-noemu.bb             |    2 +-
 recipes/tasks/task-mamona-sdk.bb                   |    2 +-
 recipes/tasks/task-mamona-systemtap.bb             |    2 +-
 recipes/tasks/task-mamona-wm.bb                    |    2 +-
 recipes/tasks/task-mamona.bb                       |    2 +-
 recipes/tasks/task-mipl.bb                         |    4 ++--
 recipes/tasks/task-openprotium.bb                  |    4 ++--
 recipes/tasks/task-python-efl-examples.bb          |    2 +-
 recipes/tasks/task-python-efl.bb                   |    2 +-
 recipes/tasks/task-python-everything.bb            |    2 +-
 recipes/tasks/task-python-sharprom_20060425.bb     |    2 +-
 recipes/tasks/task-sdk-base.bb                     |    2 +-
 recipes/tasks/task-sdk-gpephone.bb                 |    2 +-
 recipes/tasks/task-sdk-sbox-gpe.bb                 |    2 +-
 recipes/tasks/task-sdk-sbox.bb                     |    2 +-
 recipes/tasks/task-self-hosting.bb                 |    2 +-
 recipes/tasks/task-slugos.bb                       |   12 ++++++------
 recipes/telepathy/empathy_0.1.bb                   |    4 ++--
 recipes/telepathy/empathy_0.14.bb                  |    4 ++--
 recipes/telepathy/empathy_0.4.bb                   |    4 ++--
 recipes/telepathy/empathy_0.5.bb                   |    4 ++--
 recipes/telepathy/empathy_2.23.90.bb               |    4 ++--
 recipes/telepathy/empathy_2.24.0.bb                |    4 ++--
 recipes/telepathy/empathy_2.26.1.bb                |    4 ++--
 recipes/telepathy/empathy_2.28.2.bb                |    4 ++--
 recipes/temper/temper_0.0.1.bb                     |    2 +-
 recipes/tgt/tgt_1.0.3.bb                           |    2 +-
 recipes/tickypip/tickypip-levels_1.1.bb            |    2 +-
 recipes/tickypip/tickypip_0.1.2.bb                 |    2 +-
 recipes/tinc/tinc_1.0.2.bb                         |    2 +-
 recipes/tsclient/tsclient_0.140.bb                 |    2 +-
 recipes/tslib/tslib.inc                            |    2 +-
 recipes/ttf-fonts/ttf-dejavu_2.23.bb               |    2 +-
 recipes/ttf-fonts/ttf.inc                          |    2 +-
 recipes/udev/udev-static-devices.bb                |    2 +-
 recipes/unionfs/unionroot-utils_0.1.1.bb           |    2 +-
 recipes/unionfs/unionroot_0.1.1.bb                 |    2 +-
 recipes/update-modules/update-modules_1.0.bb       |    2 +-
 recipes/upslug/upslug2.inc                         |    2 +-
 recipes/usrp/usrp_0.12.bb                          |    2 +-
 recipes/util-linux-ng/util-linux-ng.inc            |    2 +-
 recipes/vagalume/vagalume_0.7.1.bb                 |    4 ++--
 recipes/vagalume/vagalume_0.8.3.bb                 |    4 ++--
 recipes/vala-terminal/vala-terminal_git.bb         |    2 +-
 recipes/vde/vde_2.0.2.bb                           |    2 +-
 recipes/vlan/vlan_1.8.bb                           |    2 +-
 recipes/vlan/vlan_1.9.bb                           |    2 +-
 recipes/vmedit/vmedit_0.02.bb                      |    2 +-
 recipes/vnc/fbvncserver2_cvs.bb                    |    2 +-
 recipes/vnc/fbvncserver_0.9.4.bb                   |    2 +-
 recipes/vpnc/vpnc.inc                              |    2 +-
 recipes/wifi-radar/wifi-radar_1.9.6.bb             |    2 +-
 recipes/wifistix/wifistix-modules_5.0.16.p0.bb     |    2 +-
 recipes/wpa-supplicant/wpa-gui_0.4.8.bb            |    2 +-
 recipes/wpa-supplicant/wpa-gui_0.6.4.bb            |    2 +-
 recipes/wpa-supplicant/wpa-gui_0.6.9.bb            |    4 ++--
 recipes/wvdial/wvdial_1.56.bb                      |    2 +-
 recipes/wvdial/wvdial_1.60.bb                      |    2 +-
 recipes/xaos/xaos_3.2.3.bb                         |    2 +-
 recipes/xerces-j/xerces-j-native_2.9.1.bb          |    2 +-
 recipes/xerces-j/xerces-j_2.9.1.bb                 |    2 +-
 recipes/xfce-base/libxfce4menu_4.6.1.bb            |    2 +-
 recipes/xfce-base/libxfcegui4_4.6.1.bb             |    2 +-
 recipes/xfce-base/thunar_0.9.0.bb                  |    2 +-
 recipes/xfce-base/thunar_1.0.1.bb                  |    4 ++--
 recipes/xfce-base/xfce-terminal_0.2.12.bb          |    2 +-
 recipes/xfce-base/xfce-terminal_0.2.8.bb           |    2 +-
 recipes/xfce-base/xfce-terminal_0.4.2.bb           |    2 +-
 recipes/xfce-base/xfce4-settings_4.6.1.bb          |    2 +-
 recipes/xfce-base/xfconf_4.6.1.bb                  |    2 +-
 recipes/xfce-base/xfdesktop_4.6.1.bb               |    2 +-
 recipes/xfce-base/xfwm4-themes_4.6.0.bb            |    2 +-
 recipes/xfce-base/xfwm4_4.4.2.bb                   |    2 +-
 recipes/xfce-base/xfwm4_4.6.1.bb                   |    2 +-
 recipes/xfce-extras/gigolo_0.3.2.bb                |    2 +-
 recipes/xfce-extras/mousepad_0.2.16.bb             |    2 +-
 recipes/xfce-extras/orage_4.6.1.bb                 |    2 +-
 recipes/xfce-extras/ristretto_0.0.21.bb            |    2 +-
 recipes/xfce-extras/squeeze_0.2.3.bb               |    2 +-
 recipes/xfce-extras/xfce4-notifyd_0.1.0.bb         |    2 +-
 recipes/xfce-extras/xfce4-power-manager_0.8.4.2.bb |    2 +-
 recipes/xkbd/xkbd-layout-ru_0.1.1.bb               |    2 +-
 recipes/xkeyboard-config/xkeyboard-config_1.4.bb   |    2 +-
 recipes/xmltv/xmltv_0.5.56.bb                      |    2 +-
 recipes/xorg-app/mkfontdir_1.0.3.bb                |    2 +-
 recipes/xorg-app/mkfontdir_1.0.4.bb                |    2 +-
 recipes/xorg-app/mkfontdir_1.0.5.bb                |    2 +-
 recipes/xorg-app/xman_1.0.2.bb                     |    2 +-
 recipes/xorg-app/xman_1.0.3.bb                     |    2 +-
 recipes/xorg-app/xman_1.1.0.bb                     |    2 +-
 recipes/xorg-data/xkbdata_1.0.1.bb                 |    2 +-
 recipes/xorg-driver/xf86-input-tslib_0.0.5.bb      |    2 +-
 recipes/xorg-driver/xf86-video-glamo_git.bb        |    2 +-
 recipes/xorg-driver/xf86-video-intel_2.10.0.bb     |    2 +-
 recipes/xorg-driver/xf86-video-vesa_2.2.0.bb       |    2 +-
 recipes/xorg-font/font-alias_1.0.1.bb              |    2 +-
 recipes/xorg-font/font-alias_1.0.2.bb              |    2 +-
 recipes/xorg-font/font-util_1.0.1.bb               |    2 +-
 recipes/xorg-font/font-util_1.1.1.bb               |    2 +-
 recipes/xorg-font/xorg-font-common.inc             |    2 +-
 recipes/xorg-util/gccmakedep_1.0.2.bb              |    2 +-
 recipes/xorg-util/imake_1.0.2.bb                   |    2 +-
 recipes/xorg-util/imake_1.0.3.bb                   |    2 +-
 recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb    |    2 +-
 recipes/xorg-xserver/xserver-kdrive_1.4.2.bb       |    2 +-
 recipes/xorg-xserver/xserver-kdrive_1.4.99.901.bb  |    2 +-
 recipes/xorg-xserver/xserver-kdrive_1.4.bb         |    2 +-
 recipes/xorg-xserver/xserver-kdrive_1.5.3.bb       |    2 +-
 recipes/xorg-xserver/xserver-xorg_1.4.2.bb         |    2 +-
 recipes/xorg-xserver/xserver-xorg_1.4.bb           |    2 +-
 recipes/xorg-xserver/xserver-xorg_1.5.1.bb         |    2 +-
 recipes/xorg-xserver/xserver-xorg_1.5.3.bb         |    2 +-
 recipes/xournal/xournal_0.4.0.1.bb                 |    2 +-
 recipes/xournal/xournal_0.4.1.bb                   |    2 +-
 recipes/xournal/xournal_0.4.5.bb                   |    2 +-
 recipes/xqtlauncher/xqtlauncher-blackbox-config.bb |    2 +-
 recipes/xqtlauncher/xqtlauncher.bb                 |    2 +-
 recipes/xtscal/xtscal.inc                          |    2 +-
 recipes/yeaphone/yeaphone_0.1.bb                   |    4 ++--
 recipes/yum/yum_3.2.18.bb                          |    2 +-
 recipes/zaurusd/zaurusd_svn.bb                     |    2 +-
 recipes/zd1211/zd1211_r85.bb                       |    2 +-
 recipes/zope/zope_3.3.1.bb                         |    4 ++--
 recipes/zten/zten_1.6.2.bb                         |    2 +-
 1001 files changed, 1089 insertions(+), 1090 deletions(-)

diff --git a/recipes/abiword/abiword-2.5.inc b/recipes/abiword/abiword-2.5.inc
index 7e87c93..ec3033a 100644
--- a/recipes/abiword/abiword-2.5.inc
+++ b/recipes/abiword/abiword-2.5.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.abiword.org"
 SECTION = "x11/office"
 LICENSE = "GPLv2"
 DEPENDS     = "asio goffice perl-native wv libgsf libgnomeprint libgnomeprintui libglade libfribidi enchant jpeg libpng libxml2"
-RDEPENDS    = "enchant glibc-gconv-ibm850 glibc-gconv-cp1252 \
+RDEPENDS_${PN}    = "enchant glibc-gconv-ibm850 glibc-gconv-cp1252 \
                glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
 
 SRC_URI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz"
diff --git a/recipes/abiword/abiword-plugins_2.4.6.bb b/recipes/abiword/abiword-plugins_2.4.6.bb
index 372eb8f..8055761 100644
--- a/recipes/abiword/abiword-plugins_2.4.6.bb
+++ b/recipes/abiword/abiword-plugins_2.4.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.abiword.org"
 SECTION = "x11/office"
 LICENSE = "GPLv2"
 DEPENDS = "libwpd librsvg goffice poppler"
-RDEPENDS = "abiword"
+RDEPENDS_${PN} = "abiword"
 
 PR = "r1"
 
diff --git a/recipes/abiword/abiword-plugins_2.5.1.bb b/recipes/abiword/abiword-plugins_2.5.1.bb
index cca2d6b..fd524f9 100644
--- a/recipes/abiword/abiword-plugins_2.5.1.bb
+++ b/recipes/abiword/abiword-plugins_2.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.abiword.org"
 SECTION = "x11/office"
 LICENSE = "GPLv2"
 DEPENDS = "libwpd librsvg goffice poppler libglade"
-RDEPENDS = "abiword"
+RDEPENDS_${PN} = "abiword"
 
 PR = "r1"
 
diff --git a/recipes/abiword/abiword-plugins_2.5.2.bb b/recipes/abiword/abiword-plugins_2.5.2.bb
index 9310031..eb4d007 100644
--- a/recipes/abiword/abiword-plugins_2.5.2.bb
+++ b/recipes/abiword/abiword-plugins_2.5.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.abiword.org"
 SECTION = "x11/office"
 LICENSE = "GPLv2"
 DEPENDS = "boost loudmouth libwpd librsvg goffice poppler libglade"
-RDEPENDS = "abiword"
+RDEPENDS_${PN} = "abiword"
 
 PR = "r1"
 
diff --git a/recipes/abiword/abiword-plugins_2.6.0.bb b/recipes/abiword/abiword-plugins_2.6.0.bb
index 8209b42..106e29c 100644
--- a/recipes/abiword/abiword-plugins_2.6.0.bb
+++ b/recipes/abiword/abiword-plugins_2.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.abiword.org"
 SECTION = "x11/office"
 LICENSE = "GPLv2"
 DEPENDS = "boost loudmouth libwpd librsvg goffice poppler libglade"
-RDEPENDS = "abiword"
+RDEPENDS_${PN} = "abiword"
 
 SRC_URI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-plugins-${PV}.tar.gz;name=plugins \
            http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz;name=archive \
diff --git a/recipes/abiword/abiword-plugins_2.6.4.bb b/recipes/abiword/abiword-plugins_2.6.4.bb
index 03df1f7..333e9b0 100644
--- a/recipes/abiword/abiword-plugins_2.6.4.bb
+++ b/recipes/abiword/abiword-plugins_2.6.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.abiword.org"
 SECTION = "x11/office"
 LICENSE = "GPLv2"
 DEPENDS = "asio boost loudmouth libwpd librsvg goffice poppler libglade"
-RDEPENDS = "abiword"
+RDEPENDS_${PN} = "abiword"
 
 PR = "r1"
 
diff --git a/recipes/abiword/abiword-plugins_2.6.8.bb b/recipes/abiword/abiword-plugins_2.6.8.bb
index af88690..6efd8af 100644
--- a/recipes/abiword/abiword-plugins_2.6.8.bb
+++ b/recipes/abiword/abiword-plugins_2.6.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.abiword.org"
 SECTION = "x11/office"
 LICENSE = "GPLv2"
 DEPENDS = "asio boost loudmouth libwpd librsvg goffice poppler libglade"
-RDEPENDS = "abiword"
+RDEPENDS_${PN} = "abiword"
 
 
 SRC_URI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-plugins-${PV}.tar.gz;name=plugins \
diff --git a/recipes/abiword/abiword.inc b/recipes/abiword/abiword.inc
index 58f712a..0cbb8db 100644
--- a/recipes/abiword/abiword.inc
+++ b/recipes/abiword/abiword.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.abiword.org""
 SECTION = "x11/office"
 LICENSE = "GPLv2"
 DEPENDS     = "perl-native libgsf libgnomeprint libgnomeprintui libglade libfribidi enchant jpeg libpng libxml2"
-RDEPENDS    = "enchant "
+RDEPENDS_${PN}    = "enchant "
 RDEPENDS_linux += "glibc-gconv-ibm850 glibc-gconv-cp1252 \
                    glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
 PR = "r2"
diff --git a/recipes/accelges/accelges_svn.bb b/recipes/accelges/accelges_svn.bb
index b351d41..941a5a6 100644
--- a/recipes/accelges/accelges_svn.bb
+++ b/recipes/accelges/accelges_svn.bb
@@ -10,7 +10,7 @@ PE = "1"
 SRCREV = "206"
 
 DEPENDS = "dbus dbus-glib libxrandr libnotify notification-daemon curl gtk+"
-RDEPENDS = "dbus dbus-glib libxrandr libnotify notification-daemon libcurl gtk+"
+RDEPENDS_${PN} = "dbus dbus-glib libxrandr libnotify notification-daemon libcurl gtk+"
 
 SRC_URI = "svn://accelges.googlecode.com/svn/;module=trunk;proto=http"
 S = "${WORKDIR}/trunk"
diff --git a/recipes/aceofpenguins/aceofpenguins-launcher_0.4.bb b/recipes/aceofpenguins/aceofpenguins-launcher_0.4.bb
index 9c205a3..9e69000 100644
--- a/recipes/aceofpenguins/aceofpenguins-launcher_0.4.bb
+++ b/recipes/aceofpenguins/aceofpenguins-launcher_0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://shr-project.org"
 SHR_RELEASE ?= "shr"
 LICENSE ?= "GPL"
 DEPENDS = "python-native python-elementary"
-RDEPENDS = "aceofpenguins"
+RDEPENDS_${PN} = "aceofpenguins"
 SECTION = "x11/application"
 
 PACKAGE_ARCH = "all"
diff --git a/recipes/angstrom/angstrom-bootmanager.bb b/recipes/angstrom/angstrom-bootmanager.bb
index 5c5ee90..6cae115 100644
--- a/recipes/angstrom/angstrom-bootmanager.bb
+++ b/recipes/angstrom/angstrom-bootmanager.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A graphical Boot Manager for the 
 AUTHOR = "Michael 'Mickey' Lauer <mickey@Vanille.de>"
 SECTION = "base"
 DEPENDS = "evas-fb ecore-fb esmart-fb imlib2-fb edje efl++-fb"
-#RDEPENDS = "libefl++0"
+#RDEPENDS_${PN} = "libefl++0"
 
 ALLOW_EMPTY = "1"
 
diff --git a/recipes/angstrom/angstrom-gnome-icon-theme-enable.bb b/recipes/angstrom/angstrom-gnome-icon-theme-enable.bb
index 423dd00..bb6306e 100644
--- a/recipes/angstrom/angstrom-gnome-icon-theme-enable.bb
+++ b/recipes/angstrom/angstrom-gnome-icon-theme-enable.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Enable gnome-icon-theme in gtkrc"
 LICENSE = "MIT"
 
-RDEPENDS = "gnome-icon-theme"
+RDEPENDS_${PN} = "gnome-icon-theme"
 
 ALLOW_EMPTY_${PN} = "1"
 PACKAGE_ARCH = "all"
diff --git a/recipes/angstrom/angstrom-x11-base-depends.bb b/recipes/angstrom/angstrom-x11-base-depends.bb
index 0395c62..ec55f60 100644
--- a/recipes/angstrom/angstrom-x11-base-depends.bb
+++ b/recipes/angstrom/angstrom-x11-base-depends.bb
@@ -9,7 +9,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "virtual/xserver"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     ${XSERVER} \
     dbus-x11 \
     ttf-dejavu-sans \
diff --git a/recipes/angstrom/angstrom-x11vnc-xinit.bb b/recipes/angstrom/angstrom-x11vnc-xinit.bb
index ee21d81..d4d9d43 100644
--- a/recipes/angstrom/angstrom-x11vnc-xinit.bb
+++ b/recipes/angstrom/angstrom-x11vnc-xinit.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Script to start a passwordless vnc of the current X session"
 LICENSE = "MIT"
-RDEPENDS = "x11vnc"
+RDEPENDS_${PN} = "x11vnc"
 
 do_install() {
 	install -d ${D}/${sysconfdir}/X11/Xinit.d
diff --git a/recipes/angstrom/angstrom-zeroconf-audio.bb b/recipes/angstrom/angstrom-zeroconf-audio.bb
index 2256b6a..6629050 100644
--- a/recipes/angstrom/angstrom-zeroconf-audio.bb
+++ b/recipes/angstrom/angstrom-zeroconf-audio.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Meta package to enable zeroconf audio with pulseaudio"
 DEPENDS = "avahi pulseaudio"
-RDEPENDS = " \
+RDEPENDS_${PN} = " \
   avahi-daemon \
   pulseaudio-server \
   pulseaudio-module-alsa-sink \
diff --git a/recipes/angstrom/epiphany-firefox-replacement.bb b/recipes/angstrom/epiphany-firefox-replacement.bb
index 2ced2c9..50de217 100644
--- a/recipes/angstrom/epiphany-firefox-replacement.bb
+++ b/recipes/angstrom/epiphany-firefox-replacement.bb
@@ -1,6 +1,6 @@
 # This is a hack because $*#($*($# e17 doesn't check if firefox is present and puts it in the menu blindly
 
-RDEPENDS = "epiphany"
+RDEPENDS_${PN} = "epiphany"
 RCONFLICTS = "firefox"
 
 do_install() {
diff --git a/recipes/anki/anki.inc b/recipes/anki/anki.inc
index d11457b..82f7ae8 100644
--- a/recipes/anki/anki.inc
+++ b/recipes/anki/anki.inc
@@ -5,8 +5,8 @@ HOMEPAGE = "http://ichi2.net/anki/"
 AUTHOR = "Damien Elmes"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
-RDEPENDS = "python-pyqt"
-RRECOMMENDS = "kakasi virtual-japanese-font"
+RDEPENDS_${PN} = "python-pyqt"
+RRECOMMENDS_${PN} = "kakasi virtual-japanese-font"
 
 SRC_URI = "http://ichi2.net/anki/download/anki-${PV}.tgz"
 
diff --git a/recipes/anki/anki_0.4.3.bb b/recipes/anki/anki_0.4.3.bb
index 97cc3ee..93682f7 100644
--- a/recipes/anki/anki_0.4.3.bb
+++ b/recipes/anki/anki_0.4.3.bb
@@ -1,6 +1,6 @@
 require anki.inc
 
-RDEPENDS += "libanki"
+RDEPENDS_${PN} += "libanki"
 PR = "r2"
 
 export PV := "${PV}"
diff --git a/recipes/aoetools/aoetools_29.bb b/recipes/aoetools/aoetools_29.bb
index 92625e3..638d05c 100644
--- a/recipes/aoetools/aoetools_29.bb
+++ b/recipes/aoetools/aoetools_29.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "ATA over Ethernet Tools"
 SECTION = "console/network"
-RRECOMMENDS = "kernel-module-aoe"
+RRECOMMENDS_${PN} = "kernel-module-aoe"
 PR = "r0"
 LICENSE = "GPL"
 
diff --git a/recipes/apache2/apache2_2.2.14.bb b/recipes/apache2/apache2_2.2.14.bb
index 7361167..2018dda 100644
--- a/recipes/apache2/apache2_2.2.14.bb
+++ b/recipes/apache2/apache2_2.2.14.bb
@@ -1,7 +1,7 @@
 SECTION = "net"
 DESCRIPTION = "The apache v2 web server"
 DEPENDS = "apache2-native openssl expat pcre"
-RDEPENDS += "openssl"
+RDEPENDS_${PN} += "openssl"
 
 PR = "r1"
 
diff --git a/recipes/apache2/apache2_2.2.3.bb b/recipes/apache2/apache2_2.2.3.bb
index 91a341e..8d631f1 100644
--- a/recipes/apache2/apache2_2.2.3.bb
+++ b/recipes/apache2/apache2_2.2.3.bb
@@ -1,7 +1,7 @@
 SECTION = "net"
 DESCRIPTION = "The apache v2 web server"
 DEPENDS = "apache2-native openssl expat pcre"
-RDEPENDS += "openssl"
+RDEPENDS_${PN} += "openssl"
 
 PR = "r6"
 
diff --git a/recipes/application-registry/application-registry_0.1.bb b/recipes/application-registry/application-registry_0.1.bb
index 1ebfbdd..2dce770 100644
--- a/recipes/application-registry/application-registry_0.1.bb
+++ b/recipes/application-registry/application-registry_0.1.bb
@@ -2,7 +2,7 @@ PR = "r3"
 
 DESCRIPTION = "additional application registry files"
 DEPENDS = "shared-mime-info"
-RDEPENDS = "shared-mime-info"
+RDEPENDS_${PN} = "shared-mime-info"
 SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "MIT"
diff --git a/recipes/apt/apt_0.7.14.bb b/recipes/apt/apt_0.7.14.bb
index 84a4e12..d6f4623 100644
--- a/recipes/apt/apt_0.7.14.bb
+++ b/recipes/apt/apt_0.7.14.bb
@@ -1,5 +1,5 @@
 DEPENDS = "curl db"
-RDEPENDS = "dpkg"
+RDEPENDS_${PN} = "dpkg"
 
 require apt.inc
 
diff --git a/recipes/apt/apt_0.7.19.bb b/recipes/apt/apt_0.7.19.bb
index ab84f0d..bfc85da 100644
--- a/recipes/apt/apt_0.7.19.bb
+++ b/recipes/apt/apt_0.7.19.bb
@@ -1,5 +1,5 @@
 DEPENDS = "curl db"
-RDEPENDS = "dpkg"
+RDEPENDS_${PN} = "dpkg"
 
 require apt.inc
 
diff --git a/recipes/apt/apt_0.7.20.2.bb b/recipes/apt/apt_0.7.20.2.bb
index 09dbbc4..e635841 100644
--- a/recipes/apt/apt_0.7.20.2.bb
+++ b/recipes/apt/apt_0.7.20.2.bb
@@ -1,5 +1,5 @@
 DEPENDS = "curl db"
-RDEPENDS = "dpkg"
+RDEPENDS_${PN} = "dpkg"
 
 require apt.inc
 
diff --git a/recipes/ark3116/ark3116_0.4.1.bb b/recipes/ark3116/ark3116_0.4.1.bb
index 8c110d7..e308dc2 100644
--- a/recipes/ark3116/ark3116_0.4.1.bb
+++ b/recipes/ark3116/ark3116_0.4.1.bb
@@ -7,7 +7,7 @@ PRIORITY = "optional"
 SECTION = "kernel/modules"
 LICENSE = "GPL"
 PR = "r2"
-RRECOMMENDS = "kernel-module-usbserial"
+RRECOMMENDS_${PN} = "kernel-module-usbserial"
 
 SRC_URI = "http://avr.auctionant.de/ark3116_linux_driver/releases/ark3116-0.4.1.tgz \
            file://ark3116.c.patch \
diff --git a/recipes/arpwatch/arpwatch_2.1a15.bb b/recipes/arpwatch/arpwatch_2.1a15.bb
index 34f3ca9..704cc86 100644
--- a/recipes/arpwatch/arpwatch_2.1a15.bb
+++ b/recipes/arpwatch/arpwatch_2.1a15.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Ethernet/FDDI station activity monitor"
 HOMEPAGE = "http://www-nrg.ee.lbl.gov/"
 SECTION = "network"
 LICENSE = "BSD"
-RRECOMMENDS = "arpwatch-data"
+RRECOMMENDS_${PN} = "arpwatch-data"
 PR = "r2"
 
 SRC_URI = "ftp://ftp.ee.lbl.gov/arpwatch-${PV}.tar.gz \
diff --git a/recipes/at76c503a/at76c503a-modules_0.17.bb b/recipes/at76c503a/at76c503a-modules_0.17.bb
index e222042..bc588df 100644
--- a/recipes/at76c503a/at76c503a-modules_0.17.bb
+++ b/recipes/at76c503a/at76c503a-modules_0.17.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 
 PR = "r2"
 
-RDEPENDS = "at76c503-firmware"
+RDEPENDS_${PN} = "at76c503-firmware"
 
 SRC_URI = "http://download.berlios.de/at76c503a/at76_usb-0.17.tar.gz"
 SRC_URI_ixp4xx = "http://download.berlios.de/at76c503a/at76_usb-0.17.tar.gz \
diff --git a/recipes/avahi/avahi.inc b/recipes/avahi/avahi.inc
index 150fa99..26a8cba 100644
--- a/recipes/avahi/avahi.inc
+++ b/recipes/avahi/avahi.inc
@@ -15,7 +15,7 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
 	   file://00avahi-autoipd file://99avahi-autoipd"
 
 inherit autotools pkgconfig update-rc.d python-dir
-# handle update-rc.d RDEPENDS manually, we don't need it on
+# handle update-rc.d RDEPENDS_${PN} manually, we don't need it on
 # anything but avahi-daemon and avahi-autoipd
 RDEPENDS_append = ""
 
diff --git a/recipes/balsa/balsa_2.0.17.bb b/recipes/balsa/balsa_2.0.17.bb
index 16b303a..9f53b47 100644
--- a/recipes/balsa/balsa_2.0.17.bb
+++ b/recipes/balsa/balsa_2.0.17.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://balsa.gnome.org"
 SECTION = "x11/network"
 LICENSE = "GPL"
 DEPENDS = "libesmtp glib-2.0 libgnome libgnomeui gtk+ gnome-vfs libbonobo aspell libpcre libtool openssl gtkhtml-3.0"
-RDEPENDS = "gdk-pixbuf-loader-xpm"
+RDEPENDS_${PN} = "gdk-pixbuf-loader-xpm"
 PR = "r3"
 
 SRC_URI = "http://talinux.fi.tal.org/pub/talinux/sources/balsa-${PV}.tar.bz2 \
diff --git a/recipes/barnyard/barnyard_0.2.0.bb b/recipes/barnyard/barnyard_0.2.0.bb
index 3536541..8ce14a0 100644
--- a/recipes/barnyard/barnyard_0.2.0.bb
+++ b/recipes/barnyard/barnyard_0.2.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Barnyard is a output system for Snort."
 HOMEPAGE = "http://www.snort.org/"
 LICENSE = "QPL"
 DEPENDS = "libpcap"
-RDEPENDS = "libpcap"
+RDEPENDS_${PN} = "libpcap"
 PR = "r1"
 
 SRC_URI = " http://dl.snort.org/barnyard/${P}.tar.gz;name=tarball \
diff --git a/recipes/bash-completion/bash-completion_20040711.bb b/recipes/bash-completion/bash-completion_20040711.bb
index 6022d9b..94223a8 100644
--- a/recipes/bash-completion/bash-completion_20040711.bb
+++ b/recipes/bash-completion/bash-completion_20040711.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Programmable Completion for Bash"
 SECTION = "console/utils"
-RDEPENDS = "bash"
+RDEPENDS_${PN} = "bash"
 LICENSE = "GPL"
 
 SRC_URI = "http://www.caliban.org/files/bash/bash-completion-${PV}.tar.gz \
diff --git a/recipes/batmand/batmand.inc b/recipes/batmand/batmand.inc
index 625241f..ef87dad 100644
--- a/recipes/batmand/batmand.inc
+++ b/recipes/batmand/batmand.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.open-mesh.net/"
 
 INC_PR = "r1"
 
-RDEPENDS = "kernel-module-tun"
+RDEPENDS_${PN} = "kernel-module-tun"
 
 SRC_URI = "http://downloads.open-mesh.net/batman/stable/sources/batman/batman-${PV}.tar.gz \
            file://makefile-fix.patch \
diff --git a/recipes/bitbake/bitbake.inc b/recipes/bitbake/bitbake.inc
index 4669006..67dc6a5 100644
--- a/recipes/bitbake/bitbake.inc
+++ b/recipes/bitbake/bitbake.inc
@@ -9,7 +9,7 @@ HOMEPAGE = "http://developer.berlios.de/projects/bitbake/"
 LICENSE = "GPL MIT"
 SECTION = "devel"
 SUMMARY = "BitBake build tool"
-RDEPENDS += "python-shell python-lang python-textutils python-pickle python-crypt python-netclient"
+RDEPENDS_${PN} += "python-shell python-lang python-textutils python-pickle python-crypt python-netclient"
 
 # crypt for md5
 # netclient for tinderclient.bbclass
diff --git a/recipes/blipomoko/blipomoko_git.bb b/recipes/blipomoko/blipomoko_git.bb
index ec57666..8b1cc9b 100644
--- a/recipes/blipomoko/blipomoko_git.bb
+++ b/recipes/blipomoko/blipomoko_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "python-elementary and python-blipapi based blip.pl client"
 AUTHOR = "Sebastian Krzyszkowiak <seba.dos1@gmail.com>"
 HOMEPAGE = "http://wiki.github.com/dos1/blipomoko"
 LICENSE ?= "GPL"
-RDEPENDS = "python-elementary python-dbus python-edbus python-ecore"
+RDEPENDS_${PN} = "python-elementary python-dbus python-edbus python-ecore"
 SECTION = "x11/applications"
 
 SRC_URI = "git://github.com/dos1/blipomoko.git;protocol=http"
diff --git a/recipes/blueman/blueman_1.10.bb b/recipes/blueman/blueman_1.10.bb
index de83f15..2cd06ef 100644
--- a/recipes/blueman/blueman_1.10.bb
+++ b/recipes/blueman/blueman_1.10.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Blueman is a GTK+ Bluetooth Manager"
 HOMEPAGE = "http://www.blueman-project.org/"
 SECTION = "optional"
 DEPENDS = "gtk+ glib-2.0 bluez4 intltool python python-native python-pyrex startup-notification"
-RDEPENDS = "python-dbus python-pygobject python dbus bluez4 python-pygtk python-notify obex-data-server \
+RDEPENDS_${PN} = "python-dbus python-pygobject python dbus bluez4 python-pygtk python-notify obex-data-server \
 "
 
 PR = "r1"
diff --git a/recipes/blueman/blueman_1.21.bb b/recipes/blueman/blueman_1.21.bb
index 337d30f..e6cfee7 100644
--- a/recipes/blueman/blueman_1.21.bb
+++ b/recipes/blueman/blueman_1.21.bb
@@ -7,7 +7,7 @@ DEPENDS = "gtk+ glib-2.0 bluez4 intltool python \
            startup-notification \
 "
 
-RDEPENDS = "python-dbus python-pygobject python \
+RDEPENDS_${PN} = "python-dbus python-pygobject python \
             dbus bluez4 python-pygtk obex-data-server \
 "
 
diff --git a/recipes/bluez/bluez-gnome_1.8.bb b/recipes/bluez/bluez-gnome_1.8.bb
index 4d9cbfa..28c513b 100644
--- a/recipes/bluez/bluez-gnome_1.8.bb
+++ b/recipes/bluez/bluez-gnome_1.8.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL+LGPL"
 PR = "r1"
 
 DEPENDS = "dbus-glib gconf libnotify gtk+"
-RRECOMMENDS = "gnome-icon-theme"
+RRECOMMENDS_${PN} = "gnome-icon-theme"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/${P}.tar.gz \
 	   file://add-device-from-rfcomm-crash.patch \
diff --git a/recipes/boa/boa_0.94.13.bb b/recipes/boa/boa_0.94.13.bb
index d75a099..1356529 100644
--- a/recipes/boa/boa_0.94.13.bb
+++ b/recipes/boa/boa_0.94.13.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Lightweight and High Performance WebServer"
 SECTION = "console/network"
 LICENSE = "GPL"
-RDEPENDS = "mime-support"
+RDEPENDS_${PN} = "mime-support"
 RPROVIDES = "httpd"
 PR = "r3"
 
diff --git a/recipes/bogofilter/bogofilter_0.96.6.bb b/recipes/bogofilter/bogofilter_0.96.6.bb
index ab4c86b..8003384 100644
--- a/recipes/bogofilter/bogofilter_0.96.6.bb
+++ b/recipes/bogofilter/bogofilter_0.96.6.bb
@@ -1,6 +1,6 @@
 SECTION = "console/network"
 DEPENDS = "virtual/db"
-RDEPENDS = "glibc-gconv glibc-gconv-iso8859-1"
+RDEPENDS_${PN} = "glibc-gconv glibc-gconv-iso8859-1"
 DESCRIPTION = "Bogofilter is a mail filter that classifies mail as spam or ham (non-spam) \
 by a statistical analysis of the message's header and content (body). \
 The program is able to learn from the user's classifications and corrections."
diff --git a/recipes/bootchart/bootchart_0.9.bb b/recipes/bootchart/bootchart_0.9.bb
index 160cc06..91a6f0b 100644
--- a/recipes/bootchart/bootchart_0.9.bb
+++ b/recipes/bootchart/bootchart_0.9.bb
@@ -8,7 +8,7 @@ PR = "r1"
 
 #needed for a real /bin/sh and /bin/sleep
 DEPENDS = "bash coreutils acct"
-RDEPENDS = "bash coreutils acct"
+RDEPENDS_${PN} = "bash coreutils acct"
 
 #this is a plain shell script
 PACKAGE_ARCH = "all"
diff --git a/recipes/bridge-utils/bridge-utils.inc b/recipes/bridge-utils/bridge-utils.inc
index a4ccf07..5ac6c83 100644
--- a/recipes/bridge-utils/bridge-utils.inc
+++ b/recipes/bridge-utils/bridge-utils.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://bridge.sourceforge.net/"
 SECTION = "console/network"
 LICENSE = "GPL"
 DEPENDS = "sysfsutils"
-RRECOMMENDS = "kernel-module-bridge"
+RRECOMMENDS_${PN} = "kernel-module-bridge"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz file://ifupdown.sh"
 
diff --git a/recipes/bt-configure/bt-configure_git.bb b/recipes/bt-configure/bt-configure_git.bb
index d2f056b..827c16f 100644
--- a/recipes/bt-configure/bt-configure_git.bb
+++ b/recipes/bt-configure/bt-configure_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python keyring"
 SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "python python-pygtk bluez4"
+RDEPENDS_${PN} = "python python-pygtk bluez4"
 
 SRCREV = "9654c88ff74bca89cf747937cbec67421d2f1cbc"
 PV = "1.0.0+gitr${SRCPV}"
diff --git a/recipes/bt-gps/bt-gps.bb b/recipes/bt-gps/bt-gps.bb
index afcae4a..51b4937 100644
--- a/recipes/bt-gps/bt-gps.bb
+++ b/recipes/bt-gps/bt-gps.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Turns your Neo Freerunner into a bluetooth GPS"
 SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "python python-pygtk gps-utils"
+RDEPENDS_${PN} = "python python-pygtk gps-utils"
 
 SRC_URI = "http://handheldshell.com/software/fso/btgps.tgz  \
 	  "
diff --git a/recipes/bt950-cs/bt950-cs_0.1.bb b/recipes/bt950-cs/bt950-cs_0.1.bb
index 305bae3..e38cdab 100644
--- a/recipes/bt950-cs/bt950-cs_0.1.bb
+++ b/recipes/bt950-cs/bt950-cs_0.1.bb
@@ -3,7 +3,7 @@ SECTION = "kernel/modules"
 LICENSE = "GPLv2"
 HOMEPAGE = "http://www.holtmann.org/linux/bluetooth/bt950.html"
 DEPENDS = "pcmcia-cs"
-RDEPENDS = "pcmcia-cs"
+RDEPENDS_${PN} = "pcmcia-cs"
 PR = "r1"
 
 SRC_URI = "http://www.holtmann.org/linux/bluetooth/bt950-${PV}.tar.gz \
diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 8abda7c..f554478 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -34,10 +34,10 @@ export EXTRA_CFLAGS = "${CFLAGS}"
 EXTRA_OEMAKE_append = " CROSS=${HOST_PREFIX}"
 PACKAGES =+ "${PN}-mountall ${PN}-httpd ${PN}-syslog ${PN}-udhcpd"
 
-# We need this RRECOMMENDS because libc dlopens libgcc
+# We need this RRECOMMENDS_${PN} because libc dlopens libgcc
 # and shlib mechanism can not detect it because its not
 # listed in the NEEDED field.
-RRECOMMENDS += "libgcc"
+RRECOMMENDS_${PN} += "libgcc"
 
 FILES_${PN}-mountall = "${sysconfdir}/default/mountall.${PN}"
 RDEPENDS_${PN} += "${PN}-mountall"
diff --git a/recipes/cacao/cacao-cldc.inc b/recipes/cacao/cacao-cldc.inc
index 0a6e524..b7db6c2 100644
--- a/recipes/cacao/cacao-cldc.inc
+++ b/recipes/cacao/cacao-cldc.inc
@@ -8,7 +8,7 @@ DEPENDS = "zlib libtool classpath midpath-cldc cacaoh-cldc-native virtual/javac-
 
 # Avoid version number here, otherwise dpkg will expect a package name
 # and cannot be satisfied with a package that provides classpath.
-RDEPENDS = "midpath-cldc"
+RDEPENDS_${PN} = "midpath-cldc"
 
 PROVIDES = "cacao-cldc virtual/java-cldc"
 RPROVIDES_cacao-cldc = "java-cldc-runtime"
diff --git a/recipes/cacao/cacao.inc b/recipes/cacao/cacao.inc
index c22bbff..fedc5ac 100644
--- a/recipes/cacao/cacao.inc
+++ b/recipes/cacao/cacao.inc
@@ -8,7 +8,7 @@ DEPENDS = "zlib libtool classpath cacaoh-native virtual/javac-native"
 
 # Avoid version number here, otherwise dpkg will expect a package name
 # and cannot be satisfied with a package that provides classpath.
-RDEPENDS = "classpath"
+RDEPENDS_${PN} = "classpath"
 
 RPROVIDES_cacao = "java2-runtime"
 
diff --git a/recipes/callrec/callrec_svn.bb b/recipes/callrec/callrec_svn.bb
index 6930648..8f0bfe7 100644
--- a/recipes/callrec/callrec_svn.bb
+++ b/recipes/callrec/callrec_svn.bb
@@ -4,7 +4,7 @@ SECTION = "system/applications"
 LICENSE = "GPLv3 or later"
 SRCNAME = "callrec"
 DEPENDS = "gtk+"
-RDEPENDS += "alsa-utils-alsactl alsa-utils-aplay"
+RDEPENDS_${PN} += "alsa-utils-alsactl alsa-utils-aplay"
 PV = "0.2.4+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/recipes/callweaver/callweaver-perl.bb b/recipes/callweaver/callweaver-perl.bb
index de579f8..c98d24a 100644
--- a/recipes/callweaver/callweaver-perl.bb
+++ b/recipes/callweaver/callweaver-perl.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Callweaver::OGI Perl Gateway Interface Module"
 HOMEPAGE = "http://www.callweaver.org"
 SECTION = "libs"
 LICENSE = "GPL"
-RDEPENDS = "perl callweaver-ogi"
+RDEPENDS_${PN} = "perl callweaver-ogi"
 PR = "r0"
 S = "${WORKDIR}/callweaver-1.2-${CWRCV}/contrib/ogi-perl/callweaver-perl-0.0.1"
 
diff --git a/recipes/callweaver/callweaver_1.2.0-rc5.bb b/recipes/callweaver/callweaver_1.2.0-rc5.bb
index bdd8e0d..9280e46 100644
--- a/recipes/callweaver/callweaver_1.2.0-rc5.bb
+++ b/recipes/callweaver/callweaver_1.2.0-rc5.bb
@@ -4,12 +4,12 @@ DESCRIPTION_${PN}-fax = "Fax send/receive file and T.38 support for Callweaver"
 DESCRIPTION_${PN}-ldap = "LDAP Directory services interface for Callweaver"
 DESCRIPTION_${PN}-sounds = "Standard set of audio prompts for Callweaver"
 HOMEPAGE = "http://www.callweaver.org"
-RDEPENDS = "ssmtp"
+RDEPENDS_${PN} = "ssmtp"
 SECTION = "voip"
 LICENSE = "GPL"
 DEPENDS = "openssl zlib tiff libcap spandsp (>= 0.0.3+0.0.4pre10) speex readline js \
            sox-native findutils-native"
-RRECOMMENDS = "logrotate"
+RRECOMMENDS_${PN} = "logrotate"
 RRECOMMENDS_${PN}-ogi = "perl perl-module-strict callweaver-perl"
 PR = "r1"
 S = "${WORKDIR}/callweaver-1.2-rc5"
diff --git a/recipes/cbrpager/cbrpager.inc b/recipes/cbrpager/cbrpager.inc
index 86bb0cf..c39a0bd 100644
--- a/recipes/cbrpager/cbrpager.inc
+++ b/recipes/cbrpager/cbrpager.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "A no-nonsense, simple to use, small viewer for cbr and cbz (comic
 SECTION = "x11/applications"
 LICENSE = "GPL"
 DEPENDS = "gtk+ libgnomeui"
-RDEPENDS = "unzip"
+RDEPENDS_${PN} = "unzip"
 
 INC_PR = "r2"
 
diff --git a/recipes/ccid/ccid_1.3.8.bb b/recipes/ccid/ccid_1.3.8.bb
index aad557a..03e48c2 100644
--- a/recipes/ccid/ccid_1.3.8.bb
+++ b/recipes/ccid/ccid_1.3.8.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 PR = "r0"
 
 DEPENDS = "virtual/libusb0 pcsc-lite"
-RDEPENDS = "pcsc-lite"
+RDEPENDS_${PN} = "pcsc-lite"
 
 SRC_URI = "http://alioth.debian.org/download.php/2482/ccid-${PV}.tar.bz2"
 
diff --git a/recipes/cellhunter/cellhunter_0.5.0.bb b/recipes/cellhunter/cellhunter_0.5.0.bb
index 881a7b2..bd2577c 100644
--- a/recipes/cellhunter/cellhunter_0.5.0.bb
+++ b/recipes/cellhunter/cellhunter_0.5.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "CellHunter - A game to collect information about mobile phone cells"
 SECTION = "x11/utils"
 DEPENDS = "python"
-RDEPENDS = "python-subprocess python-netclient python-math python-core python-io python-pygtk python-dbus frameworkd"
+RDEPENDS_${PN} = "python-subprocess python-netclient python-math python-core python-io python-pygtk python-dbus frameworkd"
 PR = "r0"
 
 SRC_URI = "\
diff --git a/recipes/cfu1/cfu1-modules_2.6.bb b/recipes/cfu1/cfu1-modules_2.6.bb
index b6446c6..7534435 100644
--- a/recipes/cfu1/cfu1-modules_2.6.bb
+++ b/recipes/cfu1/cfu1-modules_2.6.bb
@@ -3,7 +3,7 @@ SECTION = "kernel/modules"
 PRIORITY = "optional"
 DEPENDS = "virtual/kernel"
 LICENSE = "GPL"
-RDEPENDS = "kernel-module-usbcore"
+RDEPENDS_${PN} = "kernel-module-usbcore"
 PR = "r2"
 
 SRC_URI = "file://rex-cfu1.conf \
diff --git a/recipes/changedfiles/changedfiles.inc b/recipes/changedfiles/changedfiles.inc
index 3a440d0..27a93c8 100644
--- a/recipes/changedfiles/changedfiles.inc
+++ b/recipes/changedfiles/changedfiles.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "fget"
-RDEPENDS = "fget"
+RDEPENDS_${PN} = "fget"
 
 SRC_URI = "http://www.bangstate.com/changedfiles-${PV}.tar.gz"
 S = "${WORKDIR}/changedfiles-${PV}"
diff --git a/recipes/char-driver/char-driver.bb b/recipes/char-driver/char-driver.bb
index 22f6d5e..a4758fe 100644
--- a/recipes/char-driver/char-driver.bb
+++ b/recipes/char-driver/char-driver.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "char-driver and userspace program"
 PRIORITY = "optional"
 SECTION = "base"
 LICENSE = "GPL"
-RDEPENDS = "kernel (${KERNEL_VERSION})"
+RDEPENDS_${PN} = "kernel (${KERNEL_VERSION})"
 DEPENDS = "virtual/kernel"
 
 PR = "r3"
diff --git a/recipes/chicken/chicken_4.2.0.bb b/recipes/chicken/chicken_4.2.0.bb
index f2a2de8..3547d94 100644
--- a/recipes/chicken/chicken_4.2.0.bb
+++ b/recipes/chicken/chicken_4.2.0.bb
@@ -1,7 +1,7 @@
 require chicken.inc
 
 DEPENDS = "gcc-cross-sdk"
-RDEPENDS = "gcc-cross-sdk"
+RDEPENDS_${PN} = "gcc-cross-sdk"
 PR = "${INC_PR}.1"
 
 do_compile() {
diff --git a/recipes/chillispot/chillispot_0.98.bb b/recipes/chillispot/chillispot_0.98.bb
index 7fa01f1..0b086ed 100644
--- a/recipes/chillispot/chillispot_0.98.bb
+++ b/recipes/chillispot/chillispot_0.98.bb
@@ -6,7 +6,7 @@ PR = "r1"
 SRC_URI = "http://www.chillispot.org/download/chillispot-${PV}.tar.gz \
 	file://no-ansi.patch \
 	file://init"
-RRECOMMENDS = "kernel-module-tun"
+RRECOMMENDS_${PN} = "kernel-module-tun"
 
 inherit autotools
 
diff --git a/recipes/chillispot/chillispot_1.0RC3.bb b/recipes/chillispot/chillispot_1.0RC3.bb
index 7b060e0..0b59336 100644
--- a/recipes/chillispot/chillispot_1.0RC3.bb
+++ b/recipes/chillispot/chillispot_1.0RC3.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 SRC_URI = "http://www.chillispot.org/download/chillispot-${PV}.tar.gz \
 	file://no-ansi.patch \
 	file://init"
-RDEPENDS = "kernel-module-tun"
+RDEPENDS_${PN} = "kernel-module-tun"
 
 inherit autotools
 
diff --git a/recipes/connman/mokonnect_svn.bb b/recipes/connman/mokonnect_svn.bb
index 3dceb09..9d267aa 100644
--- a/recipes/connman/mokonnect_svn.bb
+++ b/recipes/connman/mokonnect_svn.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.assembla.com/wiki/show/shrdev"
 AUTHOR = "Fate"
 LICENSE = "GPLv2"
 SECTION = "e/apps"
-RDEPENDS = "python-elementary connman connman-plugin-wifi connman-plugin-udhcp"
+RDEPENDS_${PN} = "python-elementary connman connman-plugin-wifi connman-plugin-udhcp"
 
 SRCREV = "113"
 PV = "0.4+svnr${SRCPV}"
diff --git a/recipes/corsair/corsair_0.2.6.bb b/recipes/corsair/corsair_0.2.6.bb
index 5bb7ee2..3b8b66b 100644
--- a/recipes/corsair/corsair_0.2.6.bb
+++ b/recipes/corsair/corsair_0.2.6.bb
@@ -3,7 +3,7 @@ SECTION = "opie/applications"
 LICENSE = "GPL"
 AUTHOR = "Joe Rumsey <joe@rumsey.org>"
 HOMEPAGE = "http://corsair.sf.net/"
-RDEPENDS = "opie-pics"
+RDEPENDS_${PN} = "opie-pics"
 
 PR = "r1"
 
diff --git a/recipes/crda/crda_1.1.1.bb b/recipes/crda/crda_1.1.1.bb
index 8d6cf38..9acf947 100644
--- a/recipes/crda/crda_1.1.1.bb
+++ b/recipes/crda/crda_1.1.1.bb
@@ -6,7 +6,7 @@ LICENSE = "ISC"
 PR = "r0"
 
 DEPENDS = "libgcrypt libnl python-native python-m2crypto-native"
-RDEPENDS = "udev"
+RDEPENDS_${PN} = "udev"
 
 SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
 	http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2009.11.25-regulatory.bin;name=reg \
diff --git a/recipes/cryptsetup/cryptsetup_1.0.5.bb b/recipes/cryptsetup/cryptsetup_1.0.5.bb
index 2ff2824..000c6ac 100644
--- a/recipes/cryptsetup/cryptsetup_1.0.5.bb
+++ b/recipes/cryptsetup/cryptsetup_1.0.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://luks.endorphin.org/"
 SECTION = "console"
 LICENSE = "GPL"
 DEPENDS = "util-linux-ng device-mapper libgcrypt popt"
-RRECOMMENDS = "kernel-module-aes \
+RRECOMMENDS_${PN} = "kernel-module-aes \
                kernel-module-dm-crypt \
                kernel-module-md5 \
                kernel-module-cbc \
diff --git a/recipes/ctorrent/ctcs_1.4.1.bb b/recipes/ctorrent/ctcs_1.4.1.bb
index db15287..afaee6f 100644
--- a/recipes/ctorrent/ctcs_1.4.1.bb
+++ b/recipes/ctorrent/ctcs_1.4.1.bb
@@ -1,7 +1,7 @@
 require ctorrent.inc
 
 DESCRIPTION += "This is the controller of the enhanced version"
-RDEPENDS = "perl perl-module-strict perl-module-socket perl-module-tcntl \
+RDEPENDS_${PN} = "perl perl-module-strict perl-module-socket perl-module-tcntl \
             perl-module-errno perl-module-sys-hostname"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/dtorrent/ctcs-${PV}.tar.gz"
diff --git a/recipes/cup/cup-native_0.10k.bb b/recipes/cup/cup-native_0.10k.bb
index f808d1a..96cb570 100644
--- a/recipes/cup/cup-native_0.10k.bb
+++ b/recipes/cup/cup-native_0.10k.bb
@@ -3,7 +3,7 @@ require cup_${PV}.bb
 inherit java-native
 
 DEPENDS += "virtual/java-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 do_configure() {
 	sed -i \
diff --git a/recipes/cup/cup_0.10k.bb b/recipes/cup/cup_0.10k.bb
index 4577834..c792c11 100644
--- a/recipes/cup/cup_0.10k.bb
+++ b/recipes/cup/cup_0.10k.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Lexical analyzer generator for Java"
 AUTHOR = "Elliot Berk, A. Appel, C. Scott Ananian"
 
 DEPENDS = "virtual/javac-native fastjar-native"
-RDEPENDS = "java2-runtime"
+RDEPENDS_${PN} = "java2-runtime"
 
 inherit java-library
 
diff --git a/recipes/ddclient/ddclient_3.6.3.bb b/recipes/ddclient/ddclient_3.6.3.bb
index 5d07b4b..82d3d02 100644
--- a/recipes/ddclient/ddclient_3.6.3.bb
+++ b/recipes/ddclient/ddclient_3.6.3.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL"
 SRC_URI = "${SOURCEFORGE_MIRROR}/ddclient/ddclient-${PV}.tar.bz2 \
 	file://ip-up"
 
-RDEPENDS = "perl perl-module-strict perl-module-getopt-long perl-module-vars perl-module-warnings-register perl-module-warnings perl-module-carp perl-module-exporter perl-module-constant perl-module-exporter-heavy perl-module-sys-hostname perl-module-xsloader perl-module-autoloader perl-module-io-socket perl-module-io-handle perl-module-symbol perl-module-selectsaver perl-module-io perl-module-socket perl-module-errno perl-module-config perl-module-io-socket-inet perl-module-io-socket-unix perl-module-integer"
+RDEPENDS_${PN} = "perl perl-module-strict perl-module-getopt-long perl-module-vars perl-module-warnings-register perl-module-warnings perl-module-carp perl-module-exporter perl-module-constant perl-module-exporter-heavy perl-module-sys-hostname perl-module-xsloader perl-module-autoloader perl-module-io-socket perl-module-io-handle perl-module-symbol perl-module-selectsaver perl-module-io perl-module-socket perl-module-errno perl-module-config perl-module-io-socket-inet perl-module-io-socket-unix perl-module-integer"
 
 do_install() {
 	install -d ${D}${sbindir} ${D}${sysconfdir} ${D}${sysconfdir}/init.d
diff --git a/recipes/detect-stylus/detect-stylus_0.10.bb b/recipes/detect-stylus/detect-stylus_0.10.bb
index c32deb8..f80e45f 100644
--- a/recipes/detect-stylus/detect-stylus_0.10.bb
+++ b/recipes/detect-stylus/detect-stylus_0.10.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 PR = "r2"
 
 DEPENDS = "virtual/libx11 xrdb xcursor-transparent-theme"
-RDEPENDS = "xrdb xcursor-transparent-theme"
+RDEPENDS_${PN} = "xrdb xcursor-transparent-theme"
 SECTION = "gpe"
 
 DESCRIPTION = "Touchscreen detection utility"
diff --git a/recipes/detect-stylus/detect-stylus_0.13.bb b/recipes/detect-stylus/detect-stylus_0.13.bb
index dc11678..29e5121 100644
--- a/recipes/detect-stylus/detect-stylus_0.13.bb
+++ b/recipes/detect-stylus/detect-stylus_0.13.bb
@@ -5,7 +5,7 @@ PR = "r2"
 
 DEPENDS = "virtual/libx11 xcursor-transparent-theme xrdb"
 SECTION = "gpe"
-RDEPENDS = "xrdb"
+RDEPENDS_${PN} = "xrdb"
 
 DESCRIPTION = "Touchscreen detection utility"
 
diff --git a/recipes/detect-stylus/detect-stylus_svn.bb b/recipes/detect-stylus/detect-stylus_svn.bb
index c82ecd4..3208fef 100644
--- a/recipes/detect-stylus/detect-stylus_svn.bb
+++ b/recipes/detect-stylus/detect-stylus_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Touchscreen detection utility"
 SECTION = "gpe"
 LICENSE = "GPL"
 DEPENDS = "virtual/libx11 xcursor-transparent-theme xrdb"
-RDEPENDS = "xrdb"
+RDEPENDS_${PN} = "xrdb"
 PV = "0.13+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/recipes/devlabel/devlabel_0.48.01.bb b/recipes/devlabel/devlabel_0.48.01.bb
index c252d21..991d1fb 100644
--- a/recipes/devlabel/devlabel_0.48.01.bb
+++ b/recipes/devlabel/devlabel_0.48.01.bb
@@ -2,7 +2,7 @@ SECTION = "base"
 HOMEPAGE = "http://linux.dell.com/devlabel/devlabel.html"
 DESCRIPTION = "tool for user-define static device labels"
 DEPENDS = "util-linux-ng"
-RDEPENDS = "bash util-linux-ng"
+RDEPENDS_${PN} = "bash util-linux-ng"
 LICENSE = "GPL"
 PR = "r0"
 
diff --git a/recipes/dhcdbd/dhcdbd_2.0.bb b/recipes/dhcdbd/dhcdbd_2.0.bb
index b29bdad..d2108b2 100644
--- a/recipes/dhcdbd/dhcdbd_2.0.bb
+++ b/recipes/dhcdbd/dhcdbd_2.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "DBus-enabled dhcp client"
 SECTION = "net"
 LICENSE = "GPL"
 DEPENDS = "dbus"
-RDEPENDS = "dhcp-client"
+RDEPENDS_${PN} = "dhcp-client"
 PR = "r1"
 
 SRC_URI = "https://fedorahosted.org/releases/d/h/dhcdbd/dhcdbd-${PV}.tar.bz2 \
diff --git a/recipes/dhcdbd/dhcdbd_3.0.bb b/recipes/dhcdbd/dhcdbd_3.0.bb
index e34665e..c894c7a 100644
--- a/recipes/dhcdbd/dhcdbd_3.0.bb
+++ b/recipes/dhcdbd/dhcdbd_3.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "DBus-enabled dhcp client"
 SECTION = "net"
 LICENSE = "GPL"
 DEPENDS = "dbus"
-RDEPENDS = "dhcp-client"
+RDEPENDS_${PN} = "dhcp-client"
 PR = "r1"
 
 SRC_URI = "https://fedorahosted.org/releases/d/h/dhcdbd/dhcdbd-${PV}.tar.bz2 \
diff --git a/recipes/dictator/dictator_0.2.bb b/recipes/dictator/dictator_0.2.bb
index 5ebb0c9..31a473c 100644
--- a/recipes/dictator/dictator_0.2.bb
+++ b/recipes/dictator/dictator_0.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Call recodering program for Neo Smartphones"
 SECTION = "utils"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "python python-pygtk python-xml python-netclient pydes python-audio"
+RDEPENDS_${PN} = "python python-pygtk python-xml python-netclient pydes python-audio"
 PR="r2"
 
 ARCH_pyring = "all"
diff --git a/recipes/dillo/dillo2_0.6.6.bb b/recipes/dillo/dillo2_0.6.6.bb
index 48d3ae5..215db32 100644
--- a/recipes/dillo/dillo2_0.6.6.bb
+++ b/recipes/dillo/dillo2_0.6.6.bb
@@ -2,7 +2,7 @@ SECTION = "x11/network"
 DESCRIPTION = "Lightweight gtk+2 browser."
 LICENSE = "GPL"
 DEPENDS = "gtk+"
-RDEPENDS = "gdk-pixbuf-loader-xpm"
+RDEPENDS_${PN} = "gdk-pixbuf-loader-xpm"
 SRC_URI="http://www.dillo.org/download/dillo-${PV}.tar.gz \
          file://dillo2-gcc4.patch \
          file://gtk2.patch \
diff --git a/recipes/dillo/dillo2_2.1.1.bb b/recipes/dillo/dillo2_2.1.1.bb
index b867072..20a6c16 100644
--- a/recipes/dillo/dillo2_2.1.1.bb
+++ b/recipes/dillo/dillo2_2.1.1.bb
@@ -4,7 +4,7 @@ SECTION = "x11/network"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "fltk2 libpng openssl"
-RDEPENDS = "fltk2-images"
+RDEPENDS_${PN} = "fltk2-images"
 SRC_URI="http://www.dillo.org/download/dillo-${PV}.tar.bz2 \
          file://dillo.desktop \
          file://dillo.png"
diff --git a/recipes/distcc/distcc_2.18.3.bb b/recipes/distcc/distcc_2.18.3.bb
index 0034a06..2b33bb1 100644
--- a/recipes/distcc/distcc_2.18.3.bb
+++ b/recipes/distcc/distcc_2.18.3.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 PR = "r4"
 
 DEPENDS = "avahi gtk+"
-RRECOMMENDS = "avahi-daemon"
+RRECOMMENDS_${PN} = "avahi-daemon"
 
 SRC_URI = "http://distcc.samba.org/ftp/distcc/distcc-${PV}.tar.bz2 \
 	   file://distcc-avahi.patch \
diff --git a/recipes/distcc/distcc_3.1.bb b/recipes/distcc/distcc_3.1.bb
index 7dac5a7..71fc4e4 100644
--- a/recipes/distcc/distcc_3.1.bb
+++ b/recipes/distcc/distcc_3.1.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 PR = "r1"
 
 DEPENDS = "avahi gtk+"
-RRECOMMENDS = "avahi-daemon"
+RRECOMMENDS_${PN} = "avahi-daemon"
 
 SRC_URI = "http://distcc.googlecode.com/files/distcc-${PV}.tar.bz2 \
            file://default \
diff --git a/recipes/dpkg/dpkg-native.inc b/recipes/dpkg/dpkg-native.inc
index 72db286..e2041cf 100644
--- a/recipes/dpkg/dpkg-native.inc
+++ b/recipes/dpkg/dpkg-native.inc
@@ -3,7 +3,7 @@ require dpkg.inc
 inherit native
 
 DEPENDS = "perl-native bzip2-native zlib-native virtual/update-alternatives-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 SRC_URI += "file://noman.patch"
 FILESPATH += "dpkg-${PV}"
diff --git a/recipes/dpkg/dpkg.inc b/recipes/dpkg/dpkg.inc
index c3c9a90..133eff3 100644
--- a/recipes/dpkg/dpkg.inc
+++ b/recipes/dpkg/dpkg.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/dpkg-${PV}"
 
 DEPENDS_${PN} += "update-alternatives"
 
-RDEPENDS += "perl perl-module-base perl-module-carp perl-module-cwd perl-module-english perl-module-exporter perl-module-exporter-heavy perl-module-fcntl perl-module-file-spec-unix perl-module-file-temp perl-module-io perl-module-io-handle perl-module-posix perl-module-strict perl-module-vars perl-module-warnings perl-module-warnings-register perl-module-autoloader perl-module-config perl-module-constant perl-module-errno perl-module-file-basename perl-module-file-path perl-module-file-spec perl-module-overload perl-module-selectsaver perl-module-symbol perl-module-xsloader"
+RDEPENDS_${PN} += "perl perl-module-base perl-module-carp perl-module-cwd perl-module-english perl-module-exporter perl-module-exporter-heavy perl-module-fcntl perl-module-file-spec-unix perl-module-file-temp perl-module-io perl-module-io-handle perl-module-posix perl-module-strict perl-module-vars perl-module-warnings perl-module-warnings-register perl-module-autoloader perl-module-config perl-module-constant perl-module-errno perl-module-file-basename perl-module-file-path perl-module-file-spec perl-module-overload perl-module-selectsaver perl-module-symbol perl-module-xsloader"
 
 PARALLEL_MAKE = ""
 
diff --git a/recipes/dropbear/dropbear-early_1.0.bb b/recipes/dropbear/dropbear-early_1.0.bb
index c947cf0..2042400 100644
--- a/recipes/dropbear/dropbear-early_1.0.bb
+++ b/recipes/dropbear/dropbear-early_1.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Allow to start dropbear soon after boot, depending on kernel command line option."
 SECTION = "devel"
-RDEPENDS = "dropbear"
+RDEPENDS_${PN} = "dropbear"
 PR = "r3"
 
 SRC_URI = "file://dropbear-early"
diff --git a/recipes/dvd+rw-tools/dvd+rw-tools_7.1.bb b/recipes/dvd+rw-tools/dvd+rw-tools_7.1.bb
index 124ade7..bca36a1 100644
--- a/recipes/dvd+rw-tools/dvd+rw-tools_7.1.bb
+++ b/recipes/dvd+rw-tools/dvd+rw-tools_7.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "tools to write DVDs"
 PR = "r2"
 DEPENDS += "m4-native"
-RDEPENDS += "cdrkit"
+RDEPENDS_${PN} += "cdrkit"
 SRC_URI = "http://fy.chalmers.se/~appro/linux/DVD+RW/tools/dvd+rw-tools-${PV}.tar.gz \
            file://01-growisofs-pioneer.dpatch;apply=yes \
            file://02-growisofs-manpage.dpatch;apply=yes \
diff --git a/recipes/e17/elementary-alarm_svn.bb b/recipes/e17/elementary-alarm_svn.bb
index 9fee65d..8635959 100644
--- a/recipes/e17/elementary-alarm_svn.bb
+++ b/recipes/e17/elementary-alarm_svn.bb
@@ -11,7 +11,7 @@ inherit e
 SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk/TMP/st;module=elementary-alarm;proto=http"
 S = "${WORKDIR}/elementary-alarm"
 
-RDEPENDS = "waker"
+RDEPENDS_${PN} = "waker"
 FILES_${PN} += "${bindir}/*"
 FILES_${PN} += "${datadir}/${PN}"
 FILES_${PN} += "${datadir}/icons/*"
diff --git a/recipes/e17/entrance_0.9.0.010.bb b/recipes/e17/entrance_0.9.0.010.bb
index 92c235b..1ef9abe 100644
--- a/recipes/e17/entrance_0.9.0.010.bb
+++ b/recipes/e17/entrance_0.9.0.010.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Entrance is the Enlightenment login manager"
 LICENSE = "MIT BSD"
 # can also use pam and crypt
 DEPENDS = "evas ecore edje esmart bash keylaunch xserver-common login-manager"
-RDEPENDS += "glibc-gconv-iso8859-1 entrance-themes"
+RDEPENDS_${PN} += "glibc-gconv-iso8859-1 entrance-themes"
 PR = "r2"
 
 # entrance and estickies were removed in 46590 for rewrite, move back to EFL_SRCREV when they're back
diff --git a/recipes/e17/exalt_svn.bb b/recipes/e17/exalt_svn.bb
index 4e9f39f..11175b7 100644
--- a/recipes/e17/exalt_svn.bb
+++ b/recipes/e17/exalt_svn.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://watchwolf.fr/wiki/doku.php?id=exalt"
 
 LICENSE = "LGPLv2"
 DEPENDS = "elementary vpnc wpa-supplicant ecore eet edbus"
-RDEPENDS = "vpnc wpa-supplicant"
+RDEPENDS_${PN} = "vpnc wpa-supplicant"
 
 PV = "0.9+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
diff --git a/recipes/e17/expedite_svn.bb b/recipes/e17/expedite_svn.bb
index f5c26e3..31b43cd 100644
--- a/recipes/e17/expedite_svn.bb
+++ b/recipes/e17/expedite_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Expedite is a comprehensive benchmarking suite for Evas"
 DEPENDS = "eet evas"
-RDEPENDS = "expedite-themes evas-engine-buffer evas-engine-fb evas-engine-software-generic evas-engine-software-x11 evas-loader-png"
+RDEPENDS_${PN} = "expedite-themes evas-engine-buffer evas-engine-fb evas-engine-software-generic evas-engine-software-x11 evas-loader-png"
 LICENSE = "MIT BSD"
 PV = "0.6.0+svnr${SRCPV}"
 PR = "r3"
diff --git a/recipes/e17/exquisite_svn.bb b/recipes/e17/exquisite_svn.bb
index 256b5bd..f9f55e5 100644
--- a/recipes/e17/exquisite_svn.bb
+++ b/recipes/e17/exquisite_svn.bb
@@ -4,7 +4,7 @@ DEPENDS = "eet evas ecore embryo edje"
 PV = "0.0.1+svnr${SRCPV}"
 PR = "r9"
 SRCREV = "${EFL_SRCREV}"
-RDEPENDS = "initscripts"
+RDEPENDS_${PN} = "initscripts"
 RRECOMMENDS_${PN} = "exquisite-themes"
 RCONFLICTS_${PN} = "psplash virtual-psplash"
 
diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fsprogs.inc
index 119efb0..f9dae6e 100644
--- a/recipes/e2fsprogs/e2fsprogs.inc
+++ b/recipes/e2fsprogs/e2fsprogs.inc
@@ -106,7 +106,7 @@ pkg_prerm_e2fsprogs-mke2fs () {
 }
 
 # blkid used to be part of e2fsprogs but is useful outside, add it
-# as an RDEPENDS so that anything relying on it being in e2fsprogs
+# as an RDEPENDS_${PN} so that anything relying on it being in e2fsprogs
 # still works
 RDEPENDS_e2fsprogs = "util-linux-ng e2fsprogs-badblocks"
 
diff --git a/recipes/ebrainy/ebrainy_svn.bb b/recipes/ebrainy/ebrainy_svn.bb
index 166cb55..8d63bfa 100644
--- a/recipes/ebrainy/ebrainy_svn.bb
+++ b/recipes/ebrainy/ebrainy_svn.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/ebrainy/"
 AUTHOR = "quickdev"
 LICENSE = "GPL"
 SECTION = "e/apps"
-RDEPENDS = "elementary sqlite3 python-sqlalchemy python-mysqldb python-netserver"
+RDEPENDS_${PN} = "elementary sqlite3 python-sqlalchemy python-mysqldb python-netserver"
 
 PV = "0.0.1+svnr${SRCPV}"
 PR = "r1"
diff --git a/recipes/eciadsl/eciadsl_0.11.bb b/recipes/eciadsl/eciadsl_0.11.bb
index fa5c2c2..3a48a51 100644
--- a/recipes/eciadsl/eciadsl_0.11.bb
+++ b/recipes/eciadsl/eciadsl_0.11.bb
@@ -3,7 +3,7 @@ SECTION = "net"
 SRC_URI = "http://eciadsl.flashtux.org/download/eciadsl-usermode-${PV}.tar.gz \
            file://eciadsl-bash.patch"
 LICENSE = "GPL"
-RDEPENDS = "bash kernel-module-n_hdlc ppp grep"
+RDEPENDS_${PN} = "bash kernel-module-n_hdlc ppp grep"
 S = "${WORKDIR}/eciadsl-usermode-${PV}"
 
 inherit autotools
diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index 10a4a23..c40bc37 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -9,7 +9,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
 #RDEPENDS_ldd += " bash"
 # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
-#RDEPENDS += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
+#RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES += "virtual/libintl virtual/libiconv"
 inherit autotools
diff --git a/recipes/ekiga/ekiga_3.0.2.bb b/recipes/ekiga/ekiga_3.0.2.bb
index 585332c..3ea11f5 100644
--- a/recipes/ekiga/ekiga_3.0.2.bb
+++ b/recipes/ekiga/ekiga_3.0.2.bb
@@ -7,7 +7,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 inherit gnome
 DEPENDS += " avahi libnotify eds-dbus libgnome gtkmm libsigc++-2.0 gstreamer opal ptlib"
-RDEPENDS += "opal ptlib"
+RDEPENDS_${PN} += "opal ptlib"
 
 SRC_URI = "http://www.ekiga.org/admin/downloads/latest/sources/ekiga_${PV}/ekiga-${PV}.tar.gz \
            file://static-fix.diff"
diff --git a/recipes/ekiga/ekiga_3.1.0.bb b/recipes/ekiga/ekiga_3.1.0.bb
index 7d52a29..e2ed15b 100644
--- a/recipes/ekiga/ekiga_3.1.0.bb
+++ b/recipes/ekiga/ekiga_3.1.0.bb
@@ -7,7 +7,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 inherit gnome
 DEPENDS += " avahi libnotify eds-dbus libgnome gtkmm libsigc++-2.0 gstreamer gst-plugins-good gst-plugins-base gst-plugins-bad opal ptlib gnome-doc-utils"
-RDEPENDS += "gst-plugin-app gst-plugin-video4linux2 opal ptlib"
+RDEPENDS_${PN} += "gst-plugin-app gst-plugin-video4linux2 opal ptlib"
 
 EXTRA_OECONF = "--enable-static-libs   --disable-ldap --disable-gnome --enable-gstreamer   --disable-gdu --disable-scrollkeeper "
 
diff --git a/recipes/ekiga/ekiga_3.2.0.bb b/recipes/ekiga/ekiga_3.2.0.bb
index 49fffe3..07996f7 100644
--- a/recipes/ekiga/ekiga_3.2.0.bb
+++ b/recipes/ekiga/ekiga_3.2.0.bb
@@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 inherit gnome
 DEPENDS += " avahi libnotify eds-dbus libgnome gtkmm libsigc++-2.0 gstreamer gst-plugins-good gst-plugins-base gst-plugins-bad opal ptlib gnome-doc-utils"
-RDEPENDS += "gst-plugin-app gst-plugin-video4linux2 opal ptlib"
+RDEPENDS_${PN} += "gst-plugin-app gst-plugin-video4linux2 opal ptlib"
 
 EXTRA_OECONF = "--enable-static-libs   --disable-ldap --disable-gnome --enable-gstreamer   --disable-gdu --disable-scrollkeeper "
 
diff --git a/recipes/ekiga/ekiga_3.2.4.bb b/recipes/ekiga/ekiga_3.2.4.bb
index ad96bd9..756ed7e 100644
--- a/recipes/ekiga/ekiga_3.2.4.bb
+++ b/recipes/ekiga/ekiga_3.2.4.bb
@@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 inherit gnome
 DEPENDS += " avahi libnotify eds-dbus libgnome gtkmm libsigc++-2.0 gstreamer gst-plugins-good gst-plugins-base gst-plugins-bad opal ptlib gnome-doc-utils"
-RDEPENDS += "gst-plugin-app gst-plugin-video4linux2 opal ptlib"
+RDEPENDS_${PN} += "gst-plugin-app gst-plugin-video4linux2 opal ptlib"
 
 EXTRA_OECONF = "--enable-static-libs   --disable-ldap --disable-gnome --enable-gstreamer   --disable-gdu --disable-scrollkeeper "
 
diff --git a/recipes/ekiga/ekiga_3.2.5.bb b/recipes/ekiga/ekiga_3.2.5.bb
index 2d9f9fe..e315160 100644
--- a/recipes/ekiga/ekiga_3.2.5.bb
+++ b/recipes/ekiga/ekiga_3.2.5.bb
@@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 inherit gnome
 DEPENDS += " avahi libnotify eds-dbus libgnome gtkmm libsigc++-2.0 gstreamer gst-plugins-good gst-plugins-base gst-plugins-bad opal ptlib gnome-doc-utils"
-RDEPENDS += "gst-plugin-app gst-plugin-video4linux2 opal ptlib"
+RDEPENDS_${PN} += "gst-plugin-app gst-plugin-video4linux2 opal ptlib"
 
 EXTRA_OECONF = "--enable-static-libs   --disable-ldap --disable-gnome --enable-gstreamer   --disable-gdu --disable-scrollkeeper "
 
diff --git a/recipes/ekiga/ekiga_git.bb b/recipes/ekiga/ekiga_git.bb
index a4d62e0..ed9cd67 100644
--- a/recipes/ekiga/ekiga_git.bb
+++ b/recipes/ekiga/ekiga_git.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://git.gnome.org/ekiga;protocol=git;branch=master \
 S = "${WORKDIR}/git"
 
 DEPENDS += " boost avahi libnotify eds-dbus libgnome gtkmm libsigc++-2.0 gstreamer gst-plugins-good gst-plugins-base gst-plugins-bad opal ptlib gnome-doc-utils"
-RDEPENDS += "gst-plugin-app gst-plugin-video4linux2 opal ptlib"
+RDEPENDS_${PN} += "gst-plugin-app gst-plugin-video4linux2 opal ptlib"
 
 EXTRA_OECONF = " \
 #  --enable-static-libs \
diff --git a/recipes/enchant/enchant_1.1.3.bb b/recipes/enchant/enchant_1.1.3.bb
index 0663f21..5556e78 100644
--- a/recipes/enchant/enchant_1.1.3.bb
+++ b/recipes/enchant/enchant_1.1.3.bb
@@ -3,7 +3,7 @@ PRIORITY    = "optional"
 SECTION = "libs"
 
 DEPENDS     = "aspell"
-RDEPENDS    = "aspell"
+RDEPENDS_${PN}    = "aspell"
 
 inherit autotools pkgconfig
 
diff --git a/recipes/enchant/enchant_1.2.5.bb b/recipes/enchant/enchant_1.2.5.bb
index 7713a9d..5537ae2 100644
--- a/recipes/enchant/enchant_1.2.5.bb
+++ b/recipes/enchant/enchant_1.2.5.bb
@@ -3,7 +3,7 @@ PRIORITY    = "optional"
 SECTION = "libs"
 LICENSE     = "LGPL"
 DEPENDS     = "aspell"
-RDEPENDS    = "aspell"
+RDEPENDS_${PN}    = "aspell"
 
 inherit autotools pkgconfig
 
diff --git a/recipes/enchant/enchant_1.3.0.bb b/recipes/enchant/enchant_1.3.0.bb
index 7349762..bb11cb7 100644
--- a/recipes/enchant/enchant_1.3.0.bb
+++ b/recipes/enchant/enchant_1.3.0.bb
@@ -3,7 +3,7 @@ PRIORITY    = "optional"
 SECTION     = "libs"
 LICENSE     = "LGPL"
 DEPENDS     = "aspell glib-2.0"
-RDEPENDS    = "aspell"
+RDEPENDS_${PN}    = "aspell"
 
 inherit autotools pkgconfig
 
diff --git a/recipes/evince/evince_0.5.2.bb b/recipes/evince/evince_0.5.2.bb
index 3cda4a4..5c50615 100644
--- a/recipes/evince/evince_0.5.2.bb
+++ b/recipes/evince/evince_0.5.2.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Evince is a document viewer for document formats like pdf, ps, dj
 LICENSE = "GPL"
 SECTION = "x11/office"
 DEPENDS = "tiff espgs poppler gtk+ libgnomeui libgnomeprint libgnomeprintui"
-RDEPENDS = "espgs gconf"
-RRECOMMENDS = "gnome-vfs-plugin-file"
+RDEPENDS_${PN} = "espgs gconf"
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file"
 PR = "r2"
 
 inherit gnome pkgconfig
diff --git a/recipes/evince/evince_0.6.1.bb b/recipes/evince/evince_0.6.1.bb
index 50650a4..5c3a83f 100644
--- a/recipes/evince/evince_0.6.1.bb
+++ b/recipes/evince/evince_0.6.1.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Evince is a document viewer for document formats like pdf, ps, dj
 LICENSE = "GPL"
 SECTION = "x11/office"
 DEPENDS = "tiff libxt espgs poppler gtk+ libgnomeui libgnomeprint libgnomeprintui"
-RDEPENDS = "espgs gconf"
-RRECOMMENDS = "gnome-vfs-plugin-file"
+RDEPENDS_${PN} = "espgs gconf"
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file"
 PR = "r1"
 
 inherit gnome pkgconfig
diff --git a/recipes/evince/evince_0.9.0.bb b/recipes/evince/evince_0.9.0.bb
index 7d3ec11..87b8218 100644
--- a/recipes/evince/evince_0.9.0.bb
+++ b/recipes/evince/evince_0.9.0.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Evince is a document viewer for document formats like pdf, ps, dj
 LICENSE = "GPL"
 SECTION = "x11/office"
 DEPENDS = "tiff libxt espgs gnome-doc-utils poppler libxml2 gtk+ gnome-vfs gconf libglade gnome-keyring "
-RDEPENDS = "espgs "
-RRECOMMENDS = "gnome-vfs-plugin-file"
+RDEPENDS_${PN} = "espgs "
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file"
 PR = "r2"
 
 inherit gnome pkgconfig gtk-icon-cache
diff --git a/recipes/evince/evince_0.9.2.bb b/recipes/evince/evince_0.9.2.bb
index d3487a0..6ddab27 100644
--- a/recipes/evince/evince_0.9.2.bb
+++ b/recipes/evince/evince_0.9.2.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Evince is a document viewer for document formats like pdf, ps, dj
 LICENSE = "GPL"
 SECTION = "x11/office"
 DEPENDS = "tiff djvulibre libxt espgs gnome-doc-utils poppler libxml2 gtk+ gnome-vfs gconf libglade gnome-keyring "
-RDEPENDS = "espgs "
-RRECOMMENDS = "gnome-vfs-plugin-file"
+RDEPENDS_${PN} = "espgs "
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file"
 PR = "r2"
 
 inherit gnome pkgconfig gtk-icon-cache
diff --git a/recipes/evince/evince_2.20.0.bb b/recipes/evince/evince_2.20.0.bb
index aa50c75..8118c92 100644
--- a/recipes/evince/evince_2.20.0.bb
+++ b/recipes/evince/evince_2.20.0.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Evince is a document viewer for document formats like pdf, ps, dj
 LICENSE = "GPL"
 SECTION = "x11/office"
 DEPENDS = "tiff djvulibre libxt espgs gnome-doc-utils poppler libxml2 gtk+ gnome-vfs gconf libglade gnome-keyring "
-RDEPENDS = "espgs "
-RRECOMMENDS = "gnome-vfs-plugin-file"
+RDEPENDS_${PN} = "espgs "
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file"
 PR = "r2"
 
 inherit gnome pkgconfig gtk-icon-cache
diff --git a/recipes/evince/evince_2.23.4.bb b/recipes/evince/evince_2.23.4.bb
index 052e8ca..17cb219 100644
--- a/recipes/evince/evince_2.23.4.bb
+++ b/recipes/evince/evince_2.23.4.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Evince is a document viewer for document formats like pdf, ps, dj
 LICENSE = "GPL"
 SECTION = "x11/office"
 DEPENDS = "gnome-icon-theme tiff libxt espgs gnome-doc-utils poppler libxml2 gtk+ gnome-vfs gconf libglade gnome-keyring "
-RDEPENDS = "espgs gnome-icon-theme"
-RRECOMMENDS = "gnome-vfs-plugin-file"
+RDEPENDS_${PN} = "espgs gnome-icon-theme"
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file"
 PR = "r2"
 
 inherit gnome pkgconfig gtk-icon-cache
diff --git a/recipes/evince/evince_2.24.1.bb b/recipes/evince/evince_2.24.1.bb
index d9d3389..a1a5312 100644
--- a/recipes/evince/evince_2.24.1.bb
+++ b/recipes/evince/evince_2.24.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Evince is a document viewer for document formats like pdf, ps, dj
 LICENSE = "GPL"
 SECTION = "x11/office"
 DEPENDS = "nautilus gnome-icon-theme tiff libxt espgs gnome-doc-utils poppler libxml2 gtk+ gconf libglade gnome-keyring "
-RDEPENDS = "espgs gnome-icon-theme"
+RDEPENDS_${PN} = "espgs gnome-icon-theme"
 PR = "r2"
 
 inherit gnome pkgconfig gtk-icon-cache
diff --git a/recipes/evince/evince_2.26.2.bb b/recipes/evince/evince_2.26.2.bb
index f3dcace..d5a679d 100644
--- a/recipes/evince/evince_2.26.2.bb
+++ b/recipes/evince/evince_2.26.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Evince is a document viewer for document formats like pdf, ps, dj
 LICENSE = "GPL"
 SECTION = "x11/office"
 DEPENDS = "nautilus gnome-icon-theme tiff libxt espgs gnome-doc-utils poppler libxml2 gtk+ gconf libglade gnome-keyring "
-RDEPENDS = "espgs gnome-icon-theme"
+RDEPENDS_${PN} = "espgs gnome-icon-theme"
 
 inherit gnome pkgconfig gtk-icon-cache
 
diff --git a/recipes/evince/evince_2.28.0.bb b/recipes/evince/evince_2.28.0.bb
index 4c9ec29..43460f0 100644
--- a/recipes/evince/evince_2.28.0.bb
+++ b/recipes/evince/evince_2.28.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Evince is a document viewer for document formats like pdf, ps, dj
 LICENSE = "GPL"
 SECTION = "x11/office"
 DEPENDS = "nautilus gnome-icon-theme tiff libxt espgs gnome-doc-utils poppler libxml2 gtk+ gconf libglade gnome-keyring "
-RDEPENDS = "espgs gnome-icon-theme"
+RDEPENDS_${PN} = "espgs gnome-icon-theme"
 
 PR = "r1"
 
diff --git a/recipes/evince/evince_2.30.0.bb b/recipes/evince/evince_2.30.0.bb
index d07624e..0a034f2 100644
--- a/recipes/evince/evince_2.30.0.bb
+++ b/recipes/evince/evince_2.30.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Evince is a document viewer for document formats like pdf, ps, dj
 LICENSE = "GPL"
 SECTION = "x11/office"
 DEPENDS = "nautilus gnome-icon-theme tiff libxt espgs gnome-doc-utils poppler libxml2 gtk+ gconf libglade gnome-keyring "
-RDEPENDS = "espgs gnome-icon-theme"
+RDEPENDS_${PN} = "espgs gnome-icon-theme"
 
 inherit gnome pkgconfig gtk-icon-cache
 
diff --git a/recipes/evopedia/evopedia_git.bb b/recipes/evopedia/evopedia_git.bb
index 09f148d..de53ecf 100644
--- a/recipes/evopedia/evopedia_git.bb
+++ b/recipes/evopedia/evopedia_git.bb
@@ -3,9 +3,9 @@ AUTHOR = "Christian Reitwießner"
 HOMEPAGE = "http://www.reitwiessner.de/openmoko/evopedia.html"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "python python-xml python-shell python-netclient python-mime \
+RDEPENDS_${PN} = "python python-xml python-shell python-netclient python-mime \
             python-netserver python-io python-compression"
-RRECOMMENDS = "midori"
+RRECOMMENDS_${PN} = "midori"
 RRECOMMENDS_shr = "ventura"
 
 PV = "0.3.0-rc3+gitr${SRCPV}"
diff --git a/recipes/fakeroot/fakeroot-native_1.12.4.bb b/recipes/fakeroot/fakeroot-native_1.12.4.bb
index 915886b..2279094 100644
--- a/recipes/fakeroot/fakeroot-native_1.12.4.bb
+++ b/recipes/fakeroot/fakeroot-native_1.12.4.bb
@@ -17,7 +17,7 @@ do_stage_append () {
     oe_libinstall -so libfakeroot ${STAGING_LIBDIR}/libfakeroot/
 }
 
-RDEPENDS = "util-linux-native"
+RDEPENDS_${PN} = "util-linux-native"
 
 SRC_URI[md5sum] = "aaefede2405a40c87438e7e833d69b70"
 SRC_URI[sha256sum] = "dbcab1f495b857e67feff882e018ca59958b8d189ff1f76684d28e35463ec29d"
diff --git a/recipes/fakeroot/fakeroot_1.12.4.bb b/recipes/fakeroot/fakeroot_1.12.4.bb
index f0f00f3..bfb52a5 100644
--- a/recipes/fakeroot/fakeroot_1.12.4.bb
+++ b/recipes/fakeroot/fakeroot_1.12.4.bb
@@ -17,7 +17,7 @@ do_stage() {
 }
 
 # fakeroot needs getopt which is provided by the util-linux package
-RDEPENDS = "util-linux"
+RDEPENDS_${PN} = "util-linux"
 
 
 SRC_URI[md5sum] = "aaefede2405a40c87438e7e833d69b70"
diff --git a/recipes/fakeroot/fakeroot_1.9.6.bb b/recipes/fakeroot/fakeroot_1.9.6.bb
index a25f2b2..cdb410a 100644
--- a/recipes/fakeroot/fakeroot_1.9.6.bb
+++ b/recipes/fakeroot/fakeroot_1.9.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://fakeroot.alioth.debian.org/"
 SECTION = "base"
 LICENSE = "GPL"
 # fakeroot needs getopt which is provided by the util-linux package
-RDEPENDS = "util-linux"
+RDEPENDS_${PN} = "util-linux"
 PR = "r1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.tar.gz \
diff --git a/recipes/fbida/fbida_2.07.bb b/recipes/fbida/fbida_2.07.bb
index 886fe81..2406157 100644
--- a/recipes/fbida/fbida_2.07.bb
+++ b/recipes/fbida/fbida_2.07.bb
@@ -11,7 +11,7 @@ SECTION = "utils"
 PR = "r3"
 
 DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif"
-RDEPENDS = "ttf-dejavu-sans-mono"
+RDEPENDS_${PN} = "ttf-dejavu-sans-mono"
 
 SRC_URI = "http://dl.bytesex.org/releases/fbida/fbida-${PV}.tar.gz \
 	   file://exiftran.c.patch \
diff --git a/recipes/fbset/fbset_2.1.bb b/recipes/fbset/fbset_2.1.bb
index e1bbd57..e64ae94 100644
--- a/recipes/fbset/fbset_2.1.bb
+++ b/recipes/fbset/fbset_2.1.bb
@@ -7,7 +7,7 @@
 
 DESCRIPTION = "The fbset console tool"
 LICENSE = "GPLv2"
-RRECOMMENDS = "fbset-modes"
+RRECOMMENDS_${PN} = "fbset-modes"
 
 PR = "r2"
 
diff --git a/recipes/ffalarms/atd-over-fso_0.70.bb b/recipes/ffalarms/atd-over-fso_0.70.bb
index 4b2bd0f..f73ecb8 100644
--- a/recipes/ffalarms/atd-over-fso_0.70.bb
+++ b/recipes/ffalarms/atd-over-fso_0.70.bb
@@ -11,7 +11,7 @@ RCONFLICTS_${PN}-dev = "at-dev atd-dev"
 RREPLACES_${PN}-dev = "at-dev atd-dev"
 RPROVIDES_${PN}-dev = "atd-dev"
 DEPENDS = "dbus-glib pkgconfig"
-RDEPENDS += "dbus dbus-glib frameworkd"
+RDEPENDS_${PN} += "dbus dbus-glib frameworkd"
 
 PR = "r4"
 
diff --git a/recipes/ffalarms/ffalarms_git.bb b/recipes/ffalarms/ffalarms_git.bb
index 8516b7d..34ca00e 100644
--- a/recipes/ffalarms/ffalarms_git.bb
+++ b/recipes/ffalarms/ffalarms_git.bb
@@ -5,7 +5,7 @@ SECTION = "x11/applications"
 PRIORITY = "optional"
 LICENSE = "GPLv3"
 DEPENDS = "elementary libeflvala libical"
-RDEPENDS = "atd alsa-utils-amixer ttf-dejavu-sans libical"
+RDEPENDS_${PN} = "atd alsa-utils-amixer ttf-dejavu-sans libical"
 RSUGGESTS = "mplayer alsa-utils-aplay frameworkd"
 PV = "0.4+gitr${SRCPV}"
 PR = "r1"
diff --git a/recipes/file-roller/file-roller_2.28.0.bb b/recipes/file-roller/file-roller_2.28.0.bb
index 1f93555..2bb91ef 100644
--- a/recipes/file-roller/file-roller_2.28.0.bb
+++ b/recipes/file-roller/file-roller_2.28.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "An archive manager for the GNOME environment"
 LICENSE="GPL"
 SECTION = "x11/gnome"
 DEPENDS="gtk+ libgnomeui gnome-common gnome-vfs libglade libbonoboui"
-RDEPENDS = "unzip"
+RDEPENDS_${PN} = "unzip"
 
 PR = "r2"
 
diff --git a/recipes/flnx/flnx_0.17.bb b/recipes/flnx/flnx_0.17.bb
index d6ebd31..54de2ab 100644
--- a/recipes/flnx/flnx_0.17.bb
+++ b/recipes/flnx/flnx_0.17.bb
@@ -1,7 +1,7 @@
 SECTION = "x11/libs"
 LICENSE = "LGPL"
 DEPENDS = "microwindows"
-RDEPENDS = "microwindows"
+RDEPENDS_${PN} = "microwindows"
 SRC_URI = "ftp://ftp.microwindows.org/pub/microwindows/flnx/flnx-${PV}.tar.gz"
 DESCRIPTION = "fltk library for microwindows."
 
diff --git a/recipes/flnx/flnx_0.18.bb b/recipes/flnx/flnx_0.18.bb
index 5172aa3..b7cb512 100644
--- a/recipes/flnx/flnx_0.18.bb
+++ b/recipes/flnx/flnx_0.18.bb
@@ -1,6 +1,6 @@
 SECTION = "x11/libs"
 DEPENDS = "microwindows"
-RDEPENDS = "microwindows"
+RDEPENDS_${PN} = "microwindows"
 DESCRIPTION = "fltk library for microwindows."
 SRC_URI = "ftp://ftp.microwindows.org/pub/microwindows/flnx/flnx-${PV}.tar.gz \
 	   file://gcc3.patch"
diff --git a/recipes/fltk/fltkcocktailbar_svn.bb b/recipes/fltk/fltkcocktailbar_svn.bb
index bd74e99..ca08c46 100644
--- a/recipes/fltk/fltkcocktailbar_svn.bb
+++ b/recipes/fltk/fltkcocktailbar_svn.bb
@@ -4,7 +4,7 @@ AUTHOR = "Benjamin 'blindcoder' Schieder'
 LICENSE = "GPLv2"
 SECTION = "x11/tool"
 DEPENDS = "fltk zlib cairo"
-RDEPENDS = "curl"
+RDEPENDS_${PN} = "curl"
 SRCREV = "52"
 PV = "1.0+svnr${SRCPV}"
 PR = "r0"
diff --git a/recipes/fltk/fltkcurrency_svn.bb b/recipes/fltk/fltkcurrency_svn.bb
index f0bd1ad..39ef44d 100644
--- a/recipes/fltk/fltkcurrency_svn.bb
+++ b/recipes/fltk/fltkcurrency_svn.bb
@@ -4,12 +4,12 @@ AUTHOR = "Benjamin 'blindcoder' Schieder'
 LICENSE = "GPLv2"
 SECTION = "other/tool"
 DEPENDS = "fltk"
-RDEPENDS = "curl"
+RDEPENDS_${PN} = "curl"
 SRCREV = "10"
 PV = "1.0+svnr${SRCPV}"
 PR = "r0"
 S = "${WORKDIR}/trunk"
-RDEPENDS = "bash wget"
+RDEPENDS_${PN} = "bash wget"
 
 inherit autotools
 
diff --git a/recipes/fltk/fltkhackdiet_svn.bb b/recipes/fltk/fltkhackdiet_svn.bb
index 7ff81bc..0347e12 100644
--- a/recipes/fltk/fltkhackdiet_svn.bb
+++ b/recipes/fltk/fltkhackdiet_svn.bb
@@ -4,7 +4,7 @@ AUTHOR = "Benjamin 'blindcoder' Schieder'
 LICENSE = "GPLv2"
 SECTION = "x11/tool"
 DEPENDS = "fltk"
-RDEPENDS = "curl"
+RDEPENDS_${PN} = "curl"
 SRCREV = "67"
 PV = "1.0+svnr${SRCPV}"
 PR = "r0"
diff --git a/recipes/flumotion/flumotion_0.4.1.bb b/recipes/flumotion/flumotion_0.4.1.bb
index 7bc107f..e96d160 100644
--- a/recipes/flumotion/flumotion_0.4.1.bb
+++ b/recipes/flumotion/flumotion_0.4.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Fluendo Streaming Server"
 LICENSE = "GPL"
 DEPENDS = "gstreamer python-imaging python-gst python-twisted python-pygtk"
-RDEPENDS = "python-resource python-pprint python-threading \
+RDEPENDS_${PN} = "python-resource python-pprint python-threading \
             python-imaging python-xml python-curses \
             python-compression python-fcntl python-pygobject \
             python-pickle python-netclient python-datetime \
diff --git a/recipes/foonas-init/foonas-init_0.10.bb b/recipes/foonas-init/foonas-init_0.10.bb
index 7c51606..18eaf77 100644
--- a/recipes/foonas-init/foonas-init_0.10.bb
+++ b/recipes/foonas-init/foonas-init_0.10.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "required"
 LICENSE = "GPL"
 DEPENDS = "base-files devio"
-RDEPENDS = "busybox devio"
+RDEPENDS_${PN} = "busybox devio"
 PR = "r1"
 
 SRC_URI = "file://initscripts/fixfstab \
diff --git a/recipes/forte/forte.inc b/recipes/forte/forte.inc
index fa97055..a379d76 100644
--- a/recipes/forte/forte.inc
+++ b/recipes/forte/forte.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "4DIAC-RTE (FORTE) is a small portable implementation of an IEC 61
 HOMEPAGE = "http://www.fordiac.org/8.0.html"
 SECTION = "console/network"
 DEPENDS = ""
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 LICENSE = "EPL"
 
 inherit autotools
diff --git a/recipes/fpdf/fpdf_1.53.bb b/recipes/fpdf/fpdf_1.53.bb
index 5f71dd3..13f7674 100644
--- a/recipes/fpdf/fpdf_1.53.bb
+++ b/recipes/fpdf/fpdf_1.53.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Free PDF Creator for PHP"
 SECTION = "libs"
 DEPENDS = ""
-RDEPENDS = "php"
+RDEPENDS_${PN} = "php"
 LICENSE = "FREEWARE"
 PR = "r0"
 
diff --git a/recipes/freesmartphone/fso-gsm0710muxd_git.bb b/recipes/freesmartphone/fso-gsm0710muxd_git.bb
index aec38f0..6fae6af 100644
--- a/recipes/freesmartphone/fso-gsm0710muxd_git.bb
+++ b/recipes/freesmartphone/fso-gsm0710muxd_git.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools
 
-RDEPENDS = "dbus dbus-glib"
+RDEPENDS_${PN} = "dbus dbus-glib"
 RCONFLICTS = "gsm0710muxd"
 RREPLACES = "gsm0710muxd"
 
diff --git a/recipes/freesmartphone/fsodatad_git.bb b/recipes/freesmartphone/fsodatad_git.bb
index 9892e12..1ee76cf 100644
--- a/recipes/freesmartphone/fsodatad_git.bb
+++ b/recipes/freesmartphone/fsodatad_git.bb
@@ -9,4 +9,4 @@ DEPENDS += "\
   libxml2 \
   mobile-broadband-provider-info \
 "
-RDEPENDS += "mobile-broadband-provider-info"
+RDEPENDS_${PN} += "mobile-broadband-provider-info"
diff --git a/recipes/freesmartphone/fsodeviced_git.bb b/recipes/freesmartphone/fsodeviced_git.bb
index e7ea1c0..2ceff82 100644
--- a/recipes/freesmartphone/fsodeviced_git.bb
+++ b/recipes/freesmartphone/fsodeviced_git.bb
@@ -2,9 +2,9 @@ require cornucopia.inc
 inherit fso-plugin
 
 DEPENDS += "alsa-lib libcanberra libfsoresource"
-RDEPENDS += "libcanberra-alsa"
+RDEPENDS_${PN} += "libcanberra-alsa"
 # Included in fsodeviced itself now
-# RRECOMMENDS += "fso-alsa-data"
+# RRECOMMENDS_${PN} += "fso-alsa-data"
 RPROVIDES_${PN} = "openmoko-alsa-scenarios virtual/alsa-scenarios"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
 PV = "0.9.0+gitr${SRCPV}"
diff --git a/recipes/freesmartphone/fsomusicd_git.bb b/recipes/freesmartphone/fsomusicd_git.bb
index 2d1de2b..e542205 100644
--- a/recipes/freesmartphone/fsomusicd_git.bb
+++ b/recipes/freesmartphone/fsomusicd_git.bb
@@ -1,6 +1,6 @@
 require cornucopia.inc
 # Seems like bitbake cannot find dynamicaly created package names in
-# gst-plugins.inc. Image creation usually fail with missing RDEPENDS for
+# gst-plugins.inc. Image creation usually fail with missing RDEPENDS_${PN} for
 # gst-plugin-mad gst-plugin-flac gst-plugin-wavparse gst-plugin-sid
 # so add recipes needed for runtime dependencies manually here
 
@@ -10,12 +10,12 @@ PV = "0.0.1+gitr${SRCPV}"
 PR = "${INC_PR}.3"
 PE = "1"
 
-RDEPENDS += "\
+RDEPENDS_${PN} += "\
 #gst-plugins-base
   gst-plugin-volume \
   gst-plugin-alsa \
 "
-RRECOMMENDS += "\
+RRECOMMENDS_${PN} += "\
 #gst-plugins-base
   gst-plugin-ogg \
   gst-plugin-audioconvert \
diff --git a/recipes/freesmartphone/fsonetworkd_git.bb b/recipes/freesmartphone/fsonetworkd_git.bb
index 974ac3c..9c6c7ba 100644
--- a/recipes/freesmartphone/fsonetworkd_git.bb
+++ b/recipes/freesmartphone/fsonetworkd_git.bb
@@ -4,4 +4,4 @@ SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
 PV = "0.1.0.0+gitr${SRCPV}"
 PE = "1"
 PR = "${INC_PR}.3"
-RDEPENDS += "iptables"
+RDEPENDS_${PN} += "iptables"
diff --git a/recipes/freesmartphone/gsmd2_git.bb b/recipes/freesmartphone/gsmd2_git.bb
index 12ddac5..777a6f5 100644
--- a/recipes/freesmartphone/gsmd2_git.bb
+++ b/recipes/freesmartphone/gsmd2_git.bb
@@ -16,4 +16,4 @@ inherit autotools
 
 EXTRA_OECONF = "--disable-tests"
 
-RDEPENDS = "fso-gsm0710muxd"
+RDEPENDS_${PN} = "fso-gsm0710muxd"
diff --git a/recipes/freesmartphone/opimd-utils_git.bb b/recipes/freesmartphone/opimd-utils_git.bb
index 50fb8f3..34d18a0 100644
--- a/recipes/freesmartphone/opimd-utils_git.bb
+++ b/recipes/freesmartphone/opimd-utils_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Test scripts for freesmartphone.org opimd interface"
 HOMEPAGE = "http://freesmartphone.org"
 SHR_RELEASE ?= "shr"
 LICENSE ?= "GPL"
-RDEPENDS = "python-elementary python-dbus python-codecs python-shell python python-core python-edbus frameworkd"
+RDEPENDS_${PN} = "python-elementary python-dbus python-codecs python-shell python python-core python-edbus frameworkd"
 SECTION = "x11/application"
 SRCREV = "98ccc66d1e0e5e74bd8ea8c761116fb6a1844fc7"
 PV = "0.0.3+gitr${SRCPV}"
diff --git a/recipes/freesmartphone/zhone_git.bb b/recipes/freesmartphone/zhone_git.bb
index c1559f4..86327bd 100644
--- a/recipes/freesmartphone/zhone_git.bb
+++ b/recipes/freesmartphone/zhone_git.bb
@@ -20,7 +20,7 @@ do_install_append() {
 
 FILES_${PN} += "${datadir} ${sysconfdir}"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   python-edbus \
   python-edje \
   python-ecore \
diff --git a/recipes/fuse/curlftpfs_0.9.2.bb b/recipes/fuse/curlftpfs_0.9.2.bb
index 86009b6..ae9ae91 100644
--- a/recipes/fuse/curlftpfs_0.9.2.bb
+++ b/recipes/fuse/curlftpfs_0.9.2.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
 DEPENDS = "glib-2.0 fuse curl"
-RDEPENDS += " libcurl "
+RDEPENDS_${PN} += " libcurl "
 PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/curlftpfs/${P}.tar.gz"
diff --git a/recipes/fuse/fuse-module_2.6.5.bb b/recipes/fuse/fuse-module_2.6.5.bb
index 1947770..3fea537 100644
--- a/recipes/fuse/fuse-module_2.6.5.bb
+++ b/recipes/fuse/fuse-module_2.6.5.bb
@@ -1,6 +1,6 @@
 require fuse.inc
 
-RRECOMMENDS = "fuse"
+RRECOMMENDS_${PN} = "fuse"
 PR = "r1"
 
 S = "${WORKDIR}/fuse-${PV}"
diff --git a/recipes/fuse/fuse-module_2.7.1.bb b/recipes/fuse/fuse-module_2.7.1.bb
index 3342a73..d3a4f47 100644
--- a/recipes/fuse/fuse-module_2.7.1.bb
+++ b/recipes/fuse/fuse-module_2.7.1.bb
@@ -1,6 +1,6 @@
 require fuse.inc
 
-RRECOMMENDS = "fuse"
+RRECOMMENDS_${PN} = "fuse"
 PR = "r0"
 
 S = "${WORKDIR}/fuse-${PV}"
diff --git a/recipes/fuse/fuse-module_2.7.4.bb b/recipes/fuse/fuse-module_2.7.4.bb
index 24a7520..ee2afd8 100644
--- a/recipes/fuse/fuse-module_2.7.4.bb
+++ b/recipes/fuse/fuse-module_2.7.4.bb
@@ -1,6 +1,6 @@
 require fuse.inc
 
-RRECOMMENDS = "fuse"
+RRECOMMENDS_${PN} = "fuse"
 PR = "r0"
 
 S = "${WORKDIR}/fuse-${PV}"
diff --git a/recipes/fuse/gmailfs.inc b/recipes/fuse/gmailfs.inc
index 9f1c676..7364839 100644
--- a/recipes/fuse/gmailfs.inc
+++ b/recipes/fuse/gmailfs.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://richard.jones.name/google-hacks/gmail-filesystem/gmail-filesy
 LICENSE = "GPLv2"
 
 DEPENDS = "fuse python-libgmail python-fuse"
-RDEPENDS = "fuse python-libgmail python-fuse python-unixadmin  python-lang python-textutils python-core"
+RDEPENDS_${PN} = "fuse python-libgmail python-fuse python-unixadmin  python-lang python-textutils python-core"
 
 SRC_URI = "http://richard.jones.name/google-hacks/gmail-filesystem/${PN}-${PV}.tar.gz"
 
diff --git a/recipes/g15daemon/g15daemon_1.2.6a.bb b/recipes/g15daemon/g15daemon_1.2.6a.bb
index c538594..b2f2e1e 100644
--- a/recipes/g15daemon/g15daemon_1.2.6a.bb
+++ b/recipes/g15daemon/g15daemon_1.2.6a.bb
@@ -9,8 +9,8 @@ LICENSE = "GPLv2"
 SECTION = "console/utils"
 PRIORITY = "optional"
 DEPENDS = "libdaemon libg15"
-RDEPENDS = "libg15"
-RRECOMMENDS = "kernel-module-uinput"
+RDEPENDS_${PN} = "libg15"
+RRECOMMENDS_${PN} = "kernel-module-uinput"
 PR ="r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/g15daemon/g15daemon-${PV}.tar.bz2"
diff --git a/recipes/gabriel/gabriel_svn.bb b/recipes/gabriel/gabriel_svn.bb
index 3da92e1..2ec0181 100644
--- a/recipes/gabriel/gabriel_svn.bb
+++ b/recipes/gabriel/gabriel_svn.bb
@@ -12,4 +12,4 @@ S = "${WORKDIR}/gabriel"
 
 inherit autotools_stage
 
-RDEPENDS = "socat"
+RDEPENDS_${PN} = "socat"
diff --git a/recipes/galculator/galculator_1.2.3.bb b/recipes/galculator/galculator_1.2.3.bb
index 8888c9a..48a6f47 100644
--- a/recipes/galculator/galculator_1.2.3.bb
+++ b/recipes/galculator/galculator_1.2.3.bb
@@ -6,7 +6,7 @@ inherit autotools pkgconfig gconf
 PROVIDES = "galculator"
 DESCRIPTION = "GTK Advanced Calculator"
 DEPENDS = "virtual/libc gtk+ libglade gnome-desktop"
-RDEPENDS = "gnome-desktop"
+RDEPENDS_${PN} = "gnome-desktop"
 SECTION = "gpe"
 PRIORITY = "optional"
 
diff --git a/recipes/gallery/gallery_1.5.5.bb b/recipes/gallery/gallery_1.5.5.bb
index a854c90..98b15e5 100644
--- a/recipes/gallery/gallery_1.5.5.bb
+++ b/recipes/gallery/gallery_1.5.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Gallery v1 web image gallery"
 SECTION = "apps"
 LICENSE = "GPL"
-RDEPENDS = "apache2 modphp imagemagick jhead"
+RDEPENDS_${PN} = "apache2 modphp imagemagick jhead"
 PR = "r2"
 
 SRC_URI = "http://{SOURCEFORGE_MIRROR}/sourceforge/gallery/gallery-${PV}-pl1.tar.gz"
diff --git a/recipes/geda/geda-xgsch2pcb_0.1.2.bb b/recipes/geda/geda-xgsch2pcb_0.1.2.bb
index 93511d2..9cb3e61 100644
--- a/recipes/geda/geda-xgsch2pcb_0.1.2.bb
+++ b/recipes/geda/geda-xgsch2pcb_0.1.2.bb
@@ -6,7 +6,7 @@ PR = "r1"
 
 DEPENDS = "python-native"
 # python-codecs for gettext.py
-RDEPENDS = "geda-gschem geda-utils pcb python-codecs python-dbus python-pygtk python-subprocess"
+RDEPENDS_${PN} = "geda-gschem geda-utils pcb python-codecs python-dbus python-pygtk python-subprocess"
 
 SRC_URI = "http://geda.seul.org/dist/${P}.tar.gz \
            file://skip-python-checks.patch"
diff --git a/recipes/geda/geda_1.4.3.bb b/recipes/geda/geda_1.4.3.bb
index 65ccdf4..1655a14 100644
--- a/recipes/geda/geda_1.4.3.bb
+++ b/recipes/geda/geda_1.4.3.bb
@@ -6,6 +6,6 @@ PR = "r1"
 
 DEPENDS = "libgeda gtk+"
 DEPENDS += "geda-utils geda-gattrib geda-gnetlist geda-gschem geda-gsymcheck geda-symbols geda-docs geda-examples pcb"
-RDEPENDS = "geda-utils geda-gattrib geda-gnetlist geda-gschem geda-gsymcheck geda-symbols pcb"
-RRECOMMENDS = "geda-docs geda-examples"
+RDEPENDS_${PN} = "geda-utils geda-gattrib geda-gnetlist geda-gschem geda-gsymcheck geda-symbols pcb"
+RRECOMMENDS_${PN} = "geda-docs geda-examples"
 ALLOW_EMPTY_${PN} = "1"
diff --git a/recipes/ghettotooth/ghettotooth.bb b/recipes/ghettotooth/ghettotooth.bb
index 7cfd40d..760dc94 100644
--- a/recipes/ghettotooth/ghettotooth.bb
+++ b/recipes/ghettotooth/ghettotooth.bb
@@ -1,7 +1,7 @@
 SECTION = "network/misc"
 DESCRIPTION = "Bluetooth scanner"
 LICENSE = "GPL"
-RDEPENDS = "perl"
+RDEPENDS_${PN} = "perl"
 
 SRC_URI = "http://www.wardriving.ch/hpneu/blue/perl/ghettotooth.pl"
 
diff --git a/recipes/giftcurs/giftcurs_0.6.2.bb b/recipes/giftcurs/giftcurs_0.6.2.bb
index 71c7b3e..541dbfb 100644
--- a/recipes/giftcurs/giftcurs_0.6.2.bb
+++ b/recipes/giftcurs/giftcurs_0.6.2.bb
@@ -1,6 +1,6 @@
 SECTION = "console/network"
 DEPENDS = "ncurses glib-2.0"
-RDEPENDS = "gift"
+RDEPENDS_${PN} = "gift"
 LICENSE = "GPL"
 DESCRIPTION = "giFTcurs is a cursed frontend to the giFT daemon and \
 has been described as 'seriously slick'. It wont work that well \
diff --git a/recipes/gkdial/gkdial_1.8.1.bb b/recipes/gkdial/gkdial_1.8.1.bb
index 27df6a8..41d55c4 100644
--- a/recipes/gkdial/gkdial_1.8.1.bb
+++ b/recipes/gkdial/gkdial_1.8.1.bb
@@ -2,7 +2,7 @@ inherit autotools pkgconfig gconf
 
 DESCRIPTION = "GTK PPP dialing tool"
 DEPENDS = "gconf gtk+ libglade gettext ppp gpe-su"
-RDEPENDS = "ppp gconf gpe-su"
+RDEPENDS_${PN} = "ppp gconf gpe-su"
 SECTION = "gpe"
 PRIORITY = "optional"
 
diff --git a/recipes/gnome-mplayer/gecko-mediaplayer_0.9.8.bb b/recipes/gnome-mplayer/gecko-mediaplayer_0.9.8.bb
index 932d6e9..785a4e1 100644
--- a/recipes/gnome-mplayer/gecko-mediaplayer_0.9.8.bb
+++ b/recipes/gnome-mplayer/gecko-mediaplayer_0.9.8.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Gecko plugin for gnome-mplayer"
 HOMEPAGE = "http://dekorte.homeip.net/download/gecko-mediaplayer/"
 LICENSE = "GPL"
 DEPENDS = "firefox gtk+ gconf dbus-glib"
-RDEPENDS = "firefox gnome-mplayer"
+RDEPENDS_${PN} = "firefox gnome-mplayer"
 
 PR = "r8"
 
diff --git a/recipes/gnome-mplayer/gecko-mediaplayer_svn.bb b/recipes/gnome-mplayer/gecko-mediaplayer_svn.bb
index 1bae6fa..105dfd8 100644
--- a/recipes/gnome-mplayer/gecko-mediaplayer_svn.bb
+++ b/recipes/gnome-mplayer/gecko-mediaplayer_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Gecko plugin for gnome-mplayer"
 HOMEPAGE = "http://dekorte.homeip.net/download/gecko-mediaplayer/"
 LICENSE = "GPL"
 DEPENDS = "firefox gtk+ gconf dbus-glib"
-RDEPENDS = "firefox gnome-mplayer"
+RDEPENDS_${PN} = "firefox gnome-mplayer"
 
 PV = "0.9.9.2+${SRCPV}"
 SRCREV = "387"
diff --git a/recipes/gnome-mplayer/gnome-mplayer.inc b/recipes/gnome-mplayer/gnome-mplayer.inc
index 9e544af..a46bfb8 100644
--- a/recipes/gnome-mplayer/gnome-mplayer.inc
+++ b/recipes/gnome-mplayer/gnome-mplayer.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://code.google.com/p/gnome-mplayer/"
 SECTION = "x11/multimedia"
 LICENSE = "GPL"
 DEPENDS = "curl gtk+ gconf dbus-glib libmusicbrainz libgpod"
-RDEPENDS = "mplayer"
+RDEPENDS_${PN} = "mplayer"
 
 inherit gnome
 
diff --git a/recipes/gnome/epiphany_2.21.92.bb b/recipes/gnome/epiphany_2.21.92.bb
index b9c6691..d39bf1e 100644
--- a/recipes/gnome/epiphany_2.21.92.bb
+++ b/recipes/gnome/epiphany_2.21.92.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNOME default webbrowser"
 DEPENDS = "gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
-RDEPENDS = "gnome-vfs-plugin-http iso-codes"
+RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
 PR ="r2"
 
 inherit gnome
diff --git a/recipes/gnome/epiphany_2.22.1.bb b/recipes/gnome/epiphany_2.22.1.bb
index 01c93b5..eff32d7 100644
--- a/recipes/gnome/epiphany_2.22.1.bb
+++ b/recipes/gnome/epiphany_2.22.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNOME default webbrowser"
 DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
-RDEPENDS = "gnome-vfs-plugin-http iso-codes"
+RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
 
 PR = "r2"
 
diff --git a/recipes/gnome/epiphany_2.24.0.bb b/recipes/gnome/epiphany_2.24.0.bb
index c8e2d3f..cfdb9e3 100644
--- a/recipes/gnome/epiphany_2.24.0.bb
+++ b/recipes/gnome/epiphany_2.24.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNOME default webbrowser"
 DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
-RDEPENDS = "gnome-vfs-plugin-http iso-codes"
+RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
 PR = "r1"
 
 inherit gnome
diff --git a/recipes/gnome/epiphany_2.24.2.bb b/recipes/gnome/epiphany_2.24.2.bb
index 5cee877..1fbe9bd 100644
--- a/recipes/gnome/epiphany_2.24.2.bb
+++ b/recipes/gnome/epiphany_2.24.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNOME default webbrowser"
 DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
-RDEPENDS = "gnome-vfs-plugin-http iso-codes"
+RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
 
 inherit gnome
 
diff --git a/recipes/gnome/epiphany_2.27.1.bb b/recipes/gnome/epiphany_2.27.1.bb
index 31dde7e..3d890bf 100644
--- a/recipes/gnome/epiphany_2.27.1.bb
+++ b/recipes/gnome/epiphany_2.27.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNOME default webbrowser"
 DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
-RDEPENDS = "gnome-vfs-plugin-http iso-codes"
+RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
 PR = "r1"
 
 inherit gnome
diff --git a/recipes/gnome/epiphany_2.28.0.bb b/recipes/gnome/epiphany_2.28.0.bb
index 5497bea..dc968d9 100644
--- a/recipes/gnome/epiphany_2.28.0.bb
+++ b/recipes/gnome/epiphany_2.28.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNOME default webbrowser"
 DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
-RDEPENDS = "gnome-vfs-plugin-http iso-codes"
+RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
 
 inherit gnome
 
diff --git a/recipes/gnome/epiphany_2.30.0.bb b/recipes/gnome/epiphany_2.30.0.bb
index 04bd102..97b4c5d 100644
--- a/recipes/gnome/epiphany_2.30.0.bb
+++ b/recipes/gnome/epiphany_2.30.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNOME default webbrowser"
 DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
-RDEPENDS = "gnome-vfs-plugin-http iso-codes"
+RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
 
 inherit gnome
 
diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epiphany_2.30.2.bb
index 94fa7f0..ba34d4d 100644
--- a/recipes/gnome/epiphany_2.30.2.bb
+++ b/recipes/gnome/epiphany_2.30.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNOME default webbrowser"
 DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
-RDEPENDS = "gnome-vfs-plugin-http iso-codes"
+RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
 
 inherit gnome
 
diff --git a/recipes/gnome/epiphany_svn.bb b/recipes/gnome/epiphany_svn.bb
index 6629c5b..63e2e34 100644
--- a/recipes/gnome/epiphany_svn.bb
+++ b/recipes/gnome/epiphany_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNOME default webbrowser"
 DEPENDS = "gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
-RDEPENDS = "gnome-vfs-plugin-http iso-codes"
+RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
 
 SRCREV = "7837"
 PV = "2.20.1+svnr${SRCPV}"
diff --git a/recipes/gnome/gconf_2.28.0.bb b/recipes/gnome/gconf_2.28.0.bb
index e0aaffe..59e913f 100644
--- a/recipes/gnome/gconf_2.28.0.bb
+++ b/recipes/gnome/gconf_2.28.0.bb
@@ -12,7 +12,7 @@ SRC_URI[archive.sha256sum] = "d057dcfe2bfb2a80e592349c2a78d7dce12d19542aeced466c
 
 PR="r1"
 
-RDEPENDS += "dbus-x11"
+RDEPENDS_${PN} += "dbus-x11"
 
 EXTRA_OECONF = " --without-openldap --disable-gtk-doc --enable-gtk POLKIT_POLICY_FILE_VALIDATE=true"
 
diff --git a/recipes/gnome/gedit_2.26.2.bb b/recipes/gnome/gedit_2.26.2.bb
index 358653c..6423250 100644
--- a/recipes/gnome/gedit_2.26.2.bb
+++ b/recipes/gnome/gedit_2.26.2.bb
@@ -3,7 +3,7 @@ SECTION = "x11/gnome"
 LICENSE = "GPL"
 
 DEPENDS = "iso-codes gnome-common glib-2.0 gtk+ gconf gtksourceview2"
-RDEPENDS += " gtksourceview2"
+RDEPENDS_${PN} += " gtksourceview2"
 
 inherit gnome pkgconfig
 
diff --git a/recipes/gnome/gedit_2.28.0.bb b/recipes/gnome/gedit_2.28.0.bb
index af54ac2..9bf3841 100644
--- a/recipes/gnome/gedit_2.28.0.bb
+++ b/recipes/gnome/gedit_2.28.0.bb
@@ -3,7 +3,7 @@ SECTION = "x11/gnome"
 LICENSE = "GPL"
 
 DEPENDS = "iso-codes gnome-common glib-2.0 gtk+ gconf gtksourceview2"
-RDEPENDS += " gtksourceview2"
+RDEPENDS_${PN} += " gtksourceview2"
 
 PR = "r2"
 
diff --git a/recipes/gnome/gedit_2.30.0.bb b/recipes/gnome/gedit_2.30.0.bb
index 9f4a8e1..50875ab 100644
--- a/recipes/gnome/gedit_2.30.0.bb
+++ b/recipes/gnome/gedit_2.30.0.bb
@@ -3,7 +3,7 @@ SECTION = "x11/gnome"
 LICENSE = "GPL"
 
 DEPENDS = "iso-codes gnome-common glib-2.0 gtk+ gconf gtksourceview2"
-RDEPENDS += " gtksourceview2"
+RDEPENDS_${PN} += " gtksourceview2"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "aebd49797406fdde7b25624b71990860"
diff --git a/recipes/gnome/gnome-dvb-daemon_0.1.14.bb b/recipes/gnome/gnome-dvb-daemon_0.1.14.bb
index 2df43df..ff0adf6 100644
--- a/recipes/gnome/gnome-dvb-daemon_0.1.14.bb
+++ b/recipes/gnome/gnome-dvb-daemon_0.1.14.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GNOME DVB Daemon is a daemon written in Vala based on GStreamer t
 LICENSE = "GPLv3"
 
 DEPENDS = "libxml2 python-dbus python-gst python-pygtk libgee vala-native gstreamer gst-plugins-good gst-plugins-bad glib-2.0 dbus-glib sqlite3 gst-rtsp"
-RDEPENDS = "python-dbus python-gst python-pygtk gst-plugin-dvb gst-fluendo-mpegdemux dvb-apps dvb-scan dvb-tzap dvb-czap dvbstream"
+RDEPENDS_${PN} = "python-dbus python-gst python-pygtk gst-plugin-dvb gst-fluendo-mpegdemux dvb-apps dvb-scan dvb-tzap dvb-czap dvbstream"
 
 inherit gnome
 
diff --git a/recipes/gnome/gnome-icon-theme_2.28.0.bb b/recipes/gnome/gnome-icon-theme_2.28.0.bb
index 2561e6c..6493d92 100644
--- a/recipes/gnome/gnome-icon-theme_2.28.0.bb
+++ b/recipes/gnome/gnome-icon-theme_2.28.0.bb
@@ -2,8 +2,8 @@ SECTION = "x11/gnome"
 LICENSE = "GPL"
 DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native"
 
-RDEPENDS = "hicolor-icon-theme"
-RRECOMMENDS = "librsvg-gtk"
+RDEPENDS_${PN} = "hicolor-icon-theme"
+RRECOMMENDS_${PN} = "librsvg-gtk"
 
 PR = "r3"
 
diff --git a/recipes/gnome/gnome-mime-data_2.18.0.bb b/recipes/gnome/gnome-mime-data_2.18.0.bb
index 49aa5bf..3d8c5f5 100644
--- a/recipes/gnome/gnome-mime-data_2.18.0.bb
+++ b/recipes/gnome/gnome-mime-data_2.18.0.bb
@@ -2,7 +2,7 @@ LICENSE = "GPL"
 inherit gnome
 
 DEPENDS += "shared-mime-info intltool-native"
-RDEPENDS = "shared-mime-info"
+RDEPENDS_${PN} = "shared-mime-info"
 
 FILES_${PN}-dev += "${datadir}/pkgconfig/*.pc"
 
diff --git a/recipes/gnome/gnome-mime-data_2.4.2.bb b/recipes/gnome/gnome-mime-data_2.4.2.bb
index b16fca4..d5c874b 100644
--- a/recipes/gnome/gnome-mime-data_2.4.2.bb
+++ b/recipes/gnome/gnome-mime-data_2.4.2.bb
@@ -2,7 +2,7 @@ LICENSE = "GPL"
 inherit gnome
 
 DEPENDS += "libxml-parser-perl-native shared-mime-info intltool-native"
-RDEPENDS = "shared-mime-info"
+RDEPENDS_${PN} = "shared-mime-info"
 
 PR = "r2"
 
diff --git a/recipes/gnome/gnome-python_2.22.1.bb b/recipes/gnome/gnome-python_2.22.1.bb
index fe3c00d..7316114 100644
--- a/recipes/gnome/gnome-python_2.22.1.bb
+++ b/recipes/gnome/gnome-python_2.22.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GNOME Python miscellaneous bindings"
 LICENSE = "LGPL"
 DEPENDS = "libgnomeui pyorbit python-pygtk"
-RDEPENDS = "pyorbit"
+RDEPENDS_${PN} = "pyorbit"
 
 PR = "r2"
 
diff --git a/recipes/gnome/gnome-python_2.26.1.bb b/recipes/gnome/gnome-python_2.26.1.bb
index f5fd3c3..9b858c7 100644
--- a/recipes/gnome/gnome-python_2.26.1.bb
+++ b/recipes/gnome/gnome-python_2.26.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GNOME Python miscellaneous bindings"
 LICENSE = "LGPL"
 DEPENDS = "libgnomeui pyorbit python-pygtk"
-RDEPENDS = "pyorbit"
+RDEPENDS_${PN} = "pyorbit"
 
 PR = "r1"
 
diff --git a/recipes/gnome/gnome-python_2.28.0.bb b/recipes/gnome/gnome-python_2.28.0.bb
index 8278534..fc217bc 100644
--- a/recipes/gnome/gnome-python_2.28.0.bb
+++ b/recipes/gnome/gnome-python_2.28.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GNOME Python miscellaneous bindings"
 LICENSE = "LGPL"
 DEPENDS = "libgnomeui pyorbit python-pygtk"
-RDEPENDS = "pyorbit"
+RDEPENDS_${PN} = "pyorbit"
 
 PR = "r2"
 
diff --git a/recipes/gnome/gnome-python_2.28.1.bb b/recipes/gnome/gnome-python_2.28.1.bb
index 2bfaf4b..a9c5815 100644
--- a/recipes/gnome/gnome-python_2.28.1.bb
+++ b/recipes/gnome/gnome-python_2.28.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GNOME Python miscellaneous bindings"
 LICENSE = "LGPL"
 DEPENDS = "libgnomeui pyorbit python-pygtk"
-RDEPENDS = "pyorbit"
+RDEPENDS_${PN} = "pyorbit"
 
 inherit gnome distutils-base pkgconfig
 
diff --git a/recipes/gnome/gnome-themes_2.28.0.bb b/recipes/gnome/gnome-themes_2.28.0.bb
index 7320259..3de48d9 100644
--- a/recipes/gnome/gnome-themes_2.28.0.bb
+++ b/recipes/gnome/gnome-themes_2.28.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GNOME themes"
 LICENSE = "GPL"
 SECTION = "x11/gnome"
 DEPENDS = "gtk-engines icon-naming-utils-native glib-2.0 intltool-native"
-RDEPENDS = "gnome-icon-theme"
+RDEPENDS_${PN} = "gnome-icon-theme"
 
 EXTRA_OECONF = "--enable-all-themes --disable-hicolor-check"
 
diff --git a/recipes/gnome/gnome-vfs_2.22.0.bb b/recipes/gnome/gnome-vfs_2.22.0.bb
index d3d24b1..e0dc46f 100644
--- a/recipes/gnome/gnome-vfs_2.22.0.bb
+++ b/recipes/gnome/gnome-vfs_2.22.0.bb
@@ -1,6 +1,6 @@
 LICENSE = "GPL"
 DEPENDS = "libxml2 gconf gnutls avahi dbus dbus-glib bzip2 gnome-mime-data zlib"
-RRECOMMENDS = "gnome-vfs-plugin-file shared-mime-info"
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file shared-mime-info"
 # Some legacy packages will require gnome-mime-data to be installed, but use of
 # it is deprecated.
 PR = "r1"
diff --git a/recipes/gnome/gnome-vfs_2.24.1.bb b/recipes/gnome/gnome-vfs_2.24.1.bb
index 3902e77..19104d4 100644
--- a/recipes/gnome/gnome-vfs_2.24.1.bb
+++ b/recipes/gnome/gnome-vfs_2.24.1.bb
@@ -1,6 +1,6 @@
 LICENSE = "GPL"
 DEPENDS = "libxml2 gconf gnutls avahi dbus dbus-glib bzip2 gnome-mime-data zlib gtk-doc-native"
-RRECOMMENDS = "gnome-vfs-plugin-file shared-mime-info"
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file shared-mime-info"
 # Some legacy packages will require gnome-mime-data to be installed, but use of
 # it is deprecated.
 PR = "r2"
diff --git a/recipes/gnome/libgsf_1.13.3.bb b/recipes/gnome/libgsf_1.13.3.bb
index f01c37f..5bae38d 100644
--- a/recipes/gnome/libgsf_1.13.3.bb
+++ b/recipes/gnome/libgsf_1.13.3.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 PR = "r1"
 
 DEPENDS= "libxml2 glib-2.0 zlib gtk-doc libbonobo gnome-vfs"
-RDEPENDS = "gconf gnome-vfs"
+RDEPENDS_${PN} = "gconf gnome-vfs"
 
 
 PACKAGES =+ "${PN}-gnome ${PN}-gnome-dev "
diff --git a/recipes/gnome/libgsf_1.14.16.bb b/recipes/gnome/libgsf_1.14.16.bb
index aa83dc8..239ab63 100644
--- a/recipes/gnome/libgsf_1.14.16.bb
+++ b/recipes/gnome/libgsf_1.14.16.bb
@@ -2,7 +2,7 @@ LICENSE = "GPL"
 SECTION = "libs"
 
 DEPENDS= "gtk+ libxml2 bzip2 glib-2.0 zlib gtk-doc libbonobo gnome-vfs"
-RDEPENDS = "gconf gnome-vfs"
+RDEPENDS_${PN} = "gconf gnome-vfs"
 
 PACKAGES =+ "${PN}-gnome ${PN}-gnome-dev "
 
diff --git a/recipes/gnome/libgsf_1.14.8.bb b/recipes/gnome/libgsf_1.14.8.bb
index 9c39b47..49deeb9 100644
--- a/recipes/gnome/libgsf_1.14.8.bb
+++ b/recipes/gnome/libgsf_1.14.8.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 PR = "r0"
 
 DEPENDS= "libxml2 bzip2 glib-2.0 zlib gtk-doc libbonobo gnome-vfs"
-RDEPENDS = "gconf gnome-vfs"
+RDEPENDS_${PN} = "gconf gnome-vfs"
 
 
 PACKAGES =+ "${PN}-gnome ${PN}-gnome-dev "
diff --git a/recipes/gnome/system-tools-backends_2.10.0.bb b/recipes/gnome/system-tools-backends_2.10.0.bb
index ca4d102..69f24d3 100644
--- a/recipes/gnome/system-tools-backends_2.10.0.bb
+++ b/recipes/gnome/system-tools-backends_2.10.0.bb
@@ -5,7 +5,7 @@ DEPENDS = "dbus dbus-glib glib-2.0 policykit"
 
 # Shadow added so there is a full adduser/deluser
 # (Gnome images tend to pull in shadow anyway)
-RDEPENDS = "shadow"
+RDEPENDS_${PN} = "shadow"
 
 inherit gnome pkgconfig update-rc.d
 
diff --git a/recipes/gnome/system-tools-backends_2.8.3.bb b/recipes/gnome/system-tools-backends_2.8.3.bb
index d924d81..b555795 100644
--- a/recipes/gnome/system-tools-backends_2.8.3.bb
+++ b/recipes/gnome/system-tools-backends_2.8.3.bb
@@ -7,7 +7,7 @@ DEPENDS = "dbus dbus-glib glib-2.0 policykit"
 
 # Shadow added so there is a full adduser/deluser
 # (Gnome images tend to pull in shadow anyway)
-RDEPENDS = "shadow"
+RDEPENDS_${PN} = "shadow"
 
 inherit gnome pkgconfig update-rc.d
 
diff --git a/recipes/gnuchess/fltk-chess_0.5.bb b/recipes/gnuchess/fltk-chess_0.5.bb
index c2ad342..9604c8c 100644
--- a/recipes/gnuchess/fltk-chess_0.5.bb
+++ b/recipes/gnuchess/fltk-chess_0.5.bb
@@ -4,7 +4,7 @@ SECTION = "x11/games"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "fltk"
-RDEPENDS = "gnuchess"
+RDEPENDS_${PN} = "gnuchess"
 
 
 SRC_URI = "http://members.cheese.at/woody/fltk-chess/fltk-chess-${PV}.tgz \
diff --git a/recipes/gnuchess/fltk-chess_0.51.bb b/recipes/gnuchess/fltk-chess_0.51.bb
index 8702f7c..b7ede18 100644
--- a/recipes/gnuchess/fltk-chess_0.51.bb
+++ b/recipes/gnuchess/fltk-chess_0.51.bb
@@ -4,7 +4,7 @@ SECTION = "x11/games"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "fltk"
-RDEPENDS = "gnuchess"
+RDEPENDS_${PN} = "gnuchess"
 
 
 SRC_URI = "http://members.cheese.at/woody/zaurus/src/fltk-chess-${PV}.tgz"
diff --git a/recipes/gourmet/gourmet_0.15.2.bb b/recipes/gourmet/gourmet_0.15.2.bb
index 47f0c11..dd63b80 100644
--- a/recipes/gourmet/gourmet_0.15.2.bb
+++ b/recipes/gourmet/gourmet_0.15.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://grecipe-manager.sf.net"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "gtk+ python-pygtk"
-RDEPENDS = "python-core"
+RDEPENDS_${PN} = "python-core"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/grecipe-manager/${PN}-${PV}.tar.gz"
 
diff --git a/recipes/gpe-aerial/gpe-aerial_0.2.11.bb b/recipes/gpe-aerial/gpe-aerial_0.2.11.bb
index 751d164..ac78aec 100644
--- a/recipes/gpe-aerial/gpe-aerial_0.2.11.bb
+++ b/recipes/gpe-aerial/gpe-aerial_0.2.11.bb
@@ -4,7 +4,7 @@ PR = "r1"
 
 DESCRIPTION = "GPE wireless LAN communication applet"
 DEPENDS = "gtk+ libgpewidget prismstumbler"
-RDEPENDS = "prismstumbler"
+RDEPENDS_${PN} = "prismstumbler"
 SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPL"
diff --git a/recipes/gpe-aerial/gpe-aerial_0.2.12.bb b/recipes/gpe-aerial/gpe-aerial_0.2.12.bb
index 5d5146d..9c62357 100644
--- a/recipes/gpe-aerial/gpe-aerial_0.2.12.bb
+++ b/recipes/gpe-aerial/gpe-aerial_0.2.12.bb
@@ -4,7 +4,7 @@ PR = "r1"
 
 DESCRIPTION = "GPE wireless LAN communication applet"
 DEPENDS = "gtk+ libgpewidget prismstumbler"
-RDEPENDS = "prismstumbler"
+RDEPENDS_${PN} = "prismstumbler"
 SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPL"
diff --git a/recipes/gpe-aerial/gpe-aerial_0.2.13.bb b/recipes/gpe-aerial/gpe-aerial_0.2.13.bb
index 178b63e..1448cb9 100644
--- a/recipes/gpe-aerial/gpe-aerial_0.2.13.bb
+++ b/recipes/gpe-aerial/gpe-aerial_0.2.13.bb
@@ -5,7 +5,7 @@ PR = "r1"
 
 DESCRIPTION = "GPE wireless LAN communication applet"
 DEPENDS = "gtk+ libgpewidget prismstumbler"
-RDEPENDS = "prismstumbler"
+RDEPENDS_${PN} = "prismstumbler"
 SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPL"
diff --git a/recipes/gpe-aerial/gpe-aerial_0.3.0.bb b/recipes/gpe-aerial/gpe-aerial_0.3.0.bb
index 59caad2..36a8dd2 100644
--- a/recipes/gpe-aerial/gpe-aerial_0.3.0.bb
+++ b/recipes/gpe-aerial/gpe-aerial_0.3.0.bb
@@ -3,7 +3,7 @@ inherit gpe autotools
 PR = "r0"
 DESCRIPTION = "GPE wireless LAN communication applet"
 DEPENDS  = "gtk+ libgpewidget prismstumbler"
-RDEPENDS = "prismstumbler"
+RDEPENDS_${PN} = "prismstumbler"
 SECTION  = "gpe"
 PRIORITY = "optional"
 LICENSE  = "GPL"
diff --git a/recipes/gpe-aerial/gpe-aerial_svn.bb b/recipes/gpe-aerial/gpe-aerial_svn.bb
index faa8b5c..c8a597a 100644
--- a/recipes/gpe-aerial/gpe-aerial_svn.bb
+++ b/recipes/gpe-aerial/gpe-aerial_svn.bb
@@ -2,7 +2,7 @@ inherit gpe autotools
 
 DESCRIPTION = "GPE wireless LAN communication applet"
 DEPENDS  = "gtk+ libgpewidget prismstumbler"
-RDEPENDS = "prismstumbler"
+RDEPENDS_${PN} = "prismstumbler"
 SECTION  = "gpe"
 PRIORITY = "optional"
 LICENSE  = "GPL"
diff --git a/recipes/gpe-autostarter/gpe-autostarter_0.11.bb b/recipes/gpe-autostarter/gpe-autostarter_0.11.bb
index b9e8210..45fe304 100644
--- a/recipes/gpe-autostarter/gpe-autostarter_0.11.bb
+++ b/recipes/gpe-autostarter/gpe-autostarter_0.11.bb
@@ -1,6 +1,6 @@
 SECTION = "gpe"
 DEPENDS = "glib-2.0 dbus-glib hotplug-dbus virtual/libx11"
-RDEPENDS = "hotplug-dbus"
+RDEPENDS_${PN} = "hotplug-dbus"
 LICENSE = "GPL"
 
 inherit gpe
diff --git a/recipes/gpe-autostarter/gpe-autostarter_0.12.bb b/recipes/gpe-autostarter/gpe-autostarter_0.12.bb
index dfd1393..c05f578 100644
--- a/recipes/gpe-autostarter/gpe-autostarter_0.12.bb
+++ b/recipes/gpe-autostarter/gpe-autostarter_0.12.bb
@@ -1,7 +1,7 @@
 LICENSE = "GPL"
 SECTION = "gpe"
 DEPENDS = "glib-2.0 dbus-glib hotplug-dbus virtual/libx11"
-RDEPENDS = "hotplug-dbus"
+RDEPENDS_${PN} = "hotplug-dbus"
 
 inherit gpe
 
diff --git a/recipes/gpe-autostarter/gpe-autostarter_0.6.bb b/recipes/gpe-autostarter/gpe-autostarter_0.6.bb
index 1b16bf5..9fa051b 100644
--- a/recipes/gpe-autostarter/gpe-autostarter_0.6.bb
+++ b/recipes/gpe-autostarter/gpe-autostarter_0.6.bb
@@ -1,7 +1,7 @@
 LICENSE = "GPL"
 SECTION = "gpe"
 DEPENDS = "glib-2.0 dbus-glib hotplug-dbus"
-RDEPENDS = "hotplug-dbus"
+RDEPENDS_${PN} = "hotplug-dbus"
 
 inherit gpe
 
diff --git a/recipes/gpe-autostarter/gpe-autostarter_0.7.bb b/recipes/gpe-autostarter/gpe-autostarter_0.7.bb
index 99ef22a..4a8df34 100644
--- a/recipes/gpe-autostarter/gpe-autostarter_0.7.bb
+++ b/recipes/gpe-autostarter/gpe-autostarter_0.7.bb
@@ -1,7 +1,7 @@
 LICENSE = "GPL"
 SECTION = "gpe"
 DEPENDS = "glib-2.0 dbus-glib hotplug-dbus virtual/libx11"
-RDEPENDS = "hotplug-dbus"
+RDEPENDS_${PN} = "hotplug-dbus"
 
 inherit gpe
 
diff --git a/recipes/gpe-autostarter/gpe-autostarter_svn.bb b/recipes/gpe-autostarter/gpe-autostarter_svn.bb
index 16ac050..fe37206 100644
--- a/recipes/gpe-autostarter/gpe-autostarter_svn.bb
+++ b/recipes/gpe-autostarter/gpe-autostarter_svn.bb
@@ -1,7 +1,7 @@
 SECTION = "gpe"
 LICENSE = "GPL"
 DEPENDS = "glib-2.0 dbus-glib hotplug-dbus virtual/libx11"
-RDEPENDS = "hotplug-dbus"
+RDEPENDS_${PN} = "hotplug-dbus"
 
 inherit gpe
 
diff --git a/recipes/gpe-beam/gpe-beam_0.2.3.bb b/recipes/gpe-beam/gpe-beam_0.2.3.bb
index b5cbeec..eae5a3c 100644
--- a/recipes/gpe-beam/gpe-beam_0.2.3.bb
+++ b/recipes/gpe-beam/gpe-beam_0.2.3.bb
@@ -1,6 +1,6 @@
 require ${PN}.inc
 
-RDEPENDS = "libopenobex-1.0-1"
+RDEPENDS_${PN} = "libopenobex-1.0-1"
 
 inherit gpe pkgconfig
 
diff --git a/recipes/gpe-beam/gpe-beam_0.2.6.bb b/recipes/gpe-beam/gpe-beam_0.2.6.bb
index 6252ed9..6d6569e 100644
--- a/recipes/gpe-beam/gpe-beam_0.2.6.bb
+++ b/recipes/gpe-beam/gpe-beam_0.2.6.bb
@@ -1,6 +1,6 @@
 require ${PN}.inc
 
-RDEPENDS = "libopenobex-1.0-1 irda-utils"
+RDEPENDS_${PN} = "libopenobex-1.0-1 irda-utils"
 PR = "r1"
 
 SRC_URI += "file://vcard-send.patch;striplevel=0"
diff --git a/recipes/gpe-beam/gpe-beam_0.2.7.bb b/recipes/gpe-beam/gpe-beam_0.2.7.bb
index 19fcbd3..2effb37 100644
--- a/recipes/gpe-beam/gpe-beam_0.2.7.bb
+++ b/recipes/gpe-beam/gpe-beam_0.2.7.bb
@@ -1,6 +1,6 @@
 require ${PN}.inc
 
-RDEPENDS = "libopenobex-1.0-1 irda-utils"
+RDEPENDS_${PN} = "libopenobex-1.0-1 irda-utils"
 PR = "r1"
 
 SRC_URI += "file://decl.patch;striplevel=0"
diff --git a/recipes/gpe-beam/gpe-beam_0.2.8.bb b/recipes/gpe-beam/gpe-beam_0.2.8.bb
index 99e8db1..7a53509 100644
--- a/recipes/gpe-beam/gpe-beam_0.2.8.bb
+++ b/recipes/gpe-beam/gpe-beam_0.2.8.bb
@@ -1,6 +1,6 @@
 require ${PN}.inc
 
-RDEPENDS = "irda-utils"
+RDEPENDS_${PN} = "irda-utils"
 
 SRC_URI += "file://dbus-new-api.patch"
 
diff --git a/recipes/gpe-beam/gpe-beam_0.2.9.bb b/recipes/gpe-beam/gpe-beam_0.2.9.bb
index 216c40c..335a3f3 100644
--- a/recipes/gpe-beam/gpe-beam_0.2.9.bb
+++ b/recipes/gpe-beam/gpe-beam_0.2.9.bb
@@ -1,6 +1,6 @@
 require ${PN}.inc
 
-RDEPENDS = "irda-utils"
+RDEPENDS_${PN} = "irda-utils"
 
 inherit gpe
 
diff --git a/recipes/gpe-bluetooth/gpe-bluetooth.inc b/recipes/gpe-bluetooth/gpe-bluetooth.inc
index c258832..d0cc30d 100644
--- a/recipes/gpe-bluetooth/gpe-bluetooth.inc
+++ b/recipes/gpe-bluetooth/gpe-bluetooth.inc
@@ -3,7 +3,7 @@ SECTION = "gpe"
 LICENSE = "GPL"
 PRIORITY = "optional"
 DEPENDS = "gtk+ libcontactsdb libdisplaymigration libgpewidget openobex libgpevtype bluez-libs sqlite dbus-glib libglade blueprobe bluez-utils-dbus"
-RDEPENDS = "bluez-utils-dbus blueprobe"
+RDEPENDS_${PN} = "bluez-utils-dbus blueprobe"
 
 GPE_TARBALL_SUFFIX= "bz2"
 inherit gpe autotools
diff --git a/recipes/gpe-bootsplash/gpe-bootsplash-theme-e.bb b/recipes/gpe-bootsplash/gpe-bootsplash-theme-e.bb
index 9790d8e..6b8eab0 100644
--- a/recipes/gpe-bootsplash/gpe-bootsplash-theme-e.bb
+++ b/recipes/gpe-bootsplash/gpe-bootsplash-theme-e.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "gpe-bootsplash"
-RDEPENDS = "gpe-bootsplash"
+RDEPENDS_${PN} = "gpe-bootsplash"
 PR = "r1"
 
 export THEME = "e"
diff --git a/recipes/gpe-bootsplash/gpe-bootsplash-theme-gpephone.bb b/recipes/gpe-bootsplash/gpe-bootsplash-theme-gpephone.bb
index c170746..041cdb1 100644
--- a/recipes/gpe-bootsplash/gpe-bootsplash-theme-gpephone.bb
+++ b/recipes/gpe-bootsplash/gpe-bootsplash-theme-gpephone.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "LiPS"
 DEPENDS = "gpe-bootsplash"
-RDEPENDS = "gpe-bootsplash"
+RDEPENDS_${PN} = "gpe-bootsplash"
 PR = "r0"
 
 export THEME = "gpephone"
diff --git a/recipes/gpe-bootsplash/gpe-bootsplash-theme-opie.bb b/recipes/gpe-bootsplash/gpe-bootsplash-theme-opie.bb
index 293766a..8e2338e 100644
--- a/recipes/gpe-bootsplash/gpe-bootsplash-theme-opie.bb
+++ b/recipes/gpe-bootsplash/gpe-bootsplash-theme-opie.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "gpe-bootsplash"
-RDEPENDS = "gpe-bootsplash"
+RDEPENDS_${PN} = "gpe-bootsplash"
 PR = "r1"
 
 export THEME = "opie"
diff --git a/recipes/gpe-calendar/gpe-calendar_0.72.bb b/recipes/gpe-calendar/gpe-calendar_0.72.bb
index 3a165d5..4b367ee 100644
--- a/recipes/gpe-calendar/gpe-calendar_0.72.bb
+++ b/recipes/gpe-calendar/gpe-calendar_0.72.bb
@@ -3,7 +3,7 @@ SECTION = "gpe"
 LICENSE = "GPL"
 
 DEPENDS = "dbus-glib libeventdb libschedule libxsettings-client libgpepimc libgpevtype"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 
 PR = "r0"
 
diff --git a/recipes/gpe-calendar/gpe-calendar_0.90.bb b/recipes/gpe-calendar/gpe-calendar_0.90.bb
index e448e2d..308560e 100644
--- a/recipes/gpe-calendar/gpe-calendar_0.90.bb
+++ b/recipes/gpe-calendar/gpe-calendar_0.90.bb
@@ -3,7 +3,7 @@ SECTION = "gpe"
 LICENSE = "GPL"
 
 DEPENDS = "libhandoff libsoup libeventdb libschedule libxsettings libxsettings-client libgpepimc libdisplaymigration libgpevtype"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 
 PR = "r0"
 
diff --git a/recipes/gpe-calendar/gpe-calendar_0.91.bb b/recipes/gpe-calendar/gpe-calendar_0.91.bb
index 870226d..7a89d39 100644
--- a/recipes/gpe-calendar/gpe-calendar_0.91.bb
+++ b/recipes/gpe-calendar/gpe-calendar_0.91.bb
@@ -3,7 +3,7 @@ SECTION = "gpe"
 LICENSE = "GPL"
 
 DEPENDS = "libhandoff libsoup libeventdb libschedule libxsettings libxsettings-client libgpepimc libdisplaymigration libgpevtype libsoundgen"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 
 PR = "r0"
 
diff --git a/recipes/gpe-calendar/gpe-calendar_0.92.bb b/recipes/gpe-calendar/gpe-calendar_0.92.bb
index 155ce6e..2e2101c 100644
--- a/recipes/gpe-calendar/gpe-calendar_0.92.bb
+++ b/recipes/gpe-calendar/gpe-calendar_0.92.bb
@@ -3,7 +3,7 @@ SECTION = "gpe"
 LICENSE = "GPL"
 
 DEPENDS = "libhandoff libsoup libeventdb libschedule libxsettings libxsettings-client libgpepimc libdisplaymigration libgpevtype libsoundgen"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 
 PR = "r0"
 
diff --git a/recipes/gpe-calendar/gpe-calendar_svn.bb b/recipes/gpe-calendar/gpe-calendar_svn.bb
index 3462ebf..cb18609 100644
--- a/recipes/gpe-calendar/gpe-calendar_svn.bb
+++ b/recipes/gpe-calendar/gpe-calendar_svn.bb
@@ -5,7 +5,7 @@ SECTION = "gpe"
 LICENSE = "GPL"
 
 DEPENDS = "libhandoff libsoup libeventdb libschedule libxsettings libxsettings-client libgpepimc libdisplaymigration libgpevtype libsoundgen"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 
 inherit autotools gpe
 
diff --git a/recipes/gpe-clock/gpe-clock.inc b/recipes/gpe-clock/gpe-clock.inc
index 9a447fe..ff59d93 100644
--- a/recipes/gpe-clock/gpe-clock.inc
+++ b/recipes/gpe-clock/gpe-clock.inc
@@ -3,7 +3,7 @@ SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "gtk+ libschedule libgpewidget gpe-announce libgpelaunch"
-RDEPENDS = "gpe-announce atd"
+RDEPENDS_${PN} = "gpe-announce atd"
 
 INC_PR = "r2"
 
diff --git a/recipes/gpe-contacts/gpe-contacts.inc b/recipes/gpe-contacts/gpe-contacts.inc
index e6af955..b98d6b3 100644
--- a/recipes/gpe-contacts/gpe-contacts.inc
+++ b/recipes/gpe-contacts/gpe-contacts.inc
@@ -5,7 +5,7 @@ PR = "r0"
 
 DEPENDS = "libgpewidget libdisplaymigration libgpevtype dbus"
 SECTION = "gpe"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 DESCRIPTION = "GPE contacts manager"
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.bz2"
 
diff --git a/recipes/gpe-contacts/gpe-contacts_0.45.bb b/recipes/gpe-contacts/gpe-contacts_0.45.bb
index c69a957..65c4e11 100644
--- a/recipes/gpe-contacts/gpe-contacts_0.45.bb
+++ b/recipes/gpe-contacts/gpe-contacts_0.45.bb
@@ -5,7 +5,7 @@ PR = "r0"
 
 DEPENDS = "libcontactsdb libgpewidget libgpepimc libdisplaymigration libgpevtype dbus-glib"
 SECTION = "gpe"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 DESCRIPTION = "GPE contacts manager"
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.bz2"
 
diff --git a/recipes/gpe-contacts/gpe-contacts_0.46.bb b/recipes/gpe-contacts/gpe-contacts_0.46.bb
index 93a6305..b88220d 100644
--- a/recipes/gpe-contacts/gpe-contacts_0.46.bb
+++ b/recipes/gpe-contacts/gpe-contacts_0.46.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 SECTION = "gpe"
 
 DEPENDS = "libcontactsdb libgpewidget libgpepimc libdisplaymigration libgpevtype dbus-glib"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 
 GPE_TARBALL_SUFFIX = "bz2"
 
diff --git a/recipes/gpe-contacts/gpe-contacts_0.47.bb b/recipes/gpe-contacts/gpe-contacts_0.47.bb
index e5a08c2..0415ad6 100644
--- a/recipes/gpe-contacts/gpe-contacts_0.47.bb
+++ b/recipes/gpe-contacts/gpe-contacts_0.47.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 SECTION = "gpe"
 
 DEPENDS = "libcontactsdb libgpewidget libgpepimc libdisplaymigration libgpevtype dbus-glib"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 
 GPE_TARBALL_SUFFIX = "bz2"
 
diff --git a/recipes/gpe-contacts/gpe-contacts_0.49.bb b/recipes/gpe-contacts/gpe-contacts_0.49.bb
index d4165f0..4208953 100644
--- a/recipes/gpe-contacts/gpe-contacts_0.49.bb
+++ b/recipes/gpe-contacts/gpe-contacts_0.49.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 SECTION = "gpe"
 
 DEPENDS = "libcontactsdb libgpewidget libgpepimc libdisplaymigration libgpevtype dbus-glib"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 
 GPE_TARBALL_SUFFIX = "bz2"
 
diff --git a/recipes/gpe-contacts/gpe-contacts_svn.bb b/recipes/gpe-contacts/gpe-contacts_svn.bb
index e167182..a818910 100644
--- a/recipes/gpe-contacts/gpe-contacts_svn.bb
+++ b/recipes/gpe-contacts/gpe-contacts_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GPE contacts manager"
 SECTION = "gpe"
 LICENSE = "GPL"
 DEPENDS = "libcontactsdb libgpewidget libgpepimc libdisplaymigration libgpevtype dbus"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 SRCREV = "9312"
 PV = "0.47+svnr${SRCPV}"
 PR = "r2"
diff --git a/recipes/gpe-filemanager/gpe-filemanager_0.23.bb b/recipes/gpe-filemanager/gpe-filemanager_0.23.bb
index 995c1f7..7388bc5 100644
--- a/recipes/gpe-filemanager/gpe-filemanager_0.23.bb
+++ b/recipes/gpe-filemanager/gpe-filemanager_0.23.bb
@@ -6,8 +6,8 @@ LICENSE     = "GPL"
 DESCRIPTION = "GPE file manager"
 DEPENDS     = "libgpewidget gnome-vfs dbus-glib"
 SECTION = "gpe"
-RDEPENDS    = "gpe-icons"
-RRECOMMENDS = "gnome-vfs-plugin-file"
+RDEPENDS_${PN}    = "gpe-icons"
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file"
 
 FILES_${PN} += " ${datadir}/gpe"
 
diff --git a/recipes/gpe-filemanager/gpe-filemanager_0.24.bb b/recipes/gpe-filemanager/gpe-filemanager_0.24.bb
index c6702ba..8d919e5 100644
--- a/recipes/gpe-filemanager/gpe-filemanager_0.24.bb
+++ b/recipes/gpe-filemanager/gpe-filemanager_0.24.bb
@@ -6,8 +6,8 @@ LICENSE     = "GPL"
 DESCRIPTION = "GPE file manager"
 DEPENDS     = "libgpewidget gnome-vfs dbus-glib"
 SECTION = "gpe"
-RDEPENDS    = "gpe-icons"
-RRECOMMENDS = "gnome-vfs-plugin-file"
+RDEPENDS_${PN}    = "gpe-icons"
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file"
 
 FILES_${PN} += " ${datadir}/gpe"
 
diff --git a/recipes/gpe-filemanager/gpe-filemanager_0.25.bb b/recipes/gpe-filemanager/gpe-filemanager_0.25.bb
index 9c24b38..beddbf7 100644
--- a/recipes/gpe-filemanager/gpe-filemanager_0.25.bb
+++ b/recipes/gpe-filemanager/gpe-filemanager_0.25.bb
@@ -6,8 +6,8 @@ LICENSE     = "GPL"
 DESCRIPTION = "GPE file manager"
 DEPENDS     = "libgpewidget gnome-vfs dbus-glib"
 SECTION = "gpe"
-RDEPENDS    = "gpe-icons"
-RRECOMMENDS = "gnome-vfs-plugin-file gnome-vfs-plugin-smb gnome-vfs-plugin-ftp gnome-vfs-plugin-computer gnome-vfs-plugin-network gnome-vfs-plugin-sftp gnome-vfs-plugin-http"
+RDEPENDS_${PN}    = "gpe-icons"
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file gnome-vfs-plugin-smb gnome-vfs-plugin-ftp gnome-vfs-plugin-computer gnome-vfs-plugin-network gnome-vfs-plugin-sftp gnome-vfs-plugin-http"
 
 FILES_${PN} += " ${datadir}/gpe"
 
diff --git a/recipes/gpe-filemanager/gpe-filemanager_0.30.bb b/recipes/gpe-filemanager/gpe-filemanager_0.30.bb
index 944fa82..25f5e7d 100644
--- a/recipes/gpe-filemanager/gpe-filemanager_0.30.bb
+++ b/recipes/gpe-filemanager/gpe-filemanager_0.30.bb
@@ -7,8 +7,8 @@ LICENSE     = "GPL"
 DESCRIPTION = "GPE file manager"
 DEPENDS     = "libgpewidget gnome-vfs dbus-glib"
 SECTION = "gpe"
-RDEPENDS    = "gpe-icons"
-RRECOMMENDS = "gnome-vfs-plugin-file gnome-vfs-plugin-smb gnome-vfs-plugin-ftp gnome-vfs-plugin-computer gnome-vfs-plugin-network gnome-vfs-plugin-sftp gnome-vfs-plugin-http"
+RDEPENDS_${PN}    = "gpe-icons"
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file gnome-vfs-plugin-smb gnome-vfs-plugin-ftp gnome-vfs-plugin-computer gnome-vfs-plugin-network gnome-vfs-plugin-sftp gnome-vfs-plugin-http"
 
 FILES_${PN} += " ${datadir}/gpe"
 
diff --git a/recipes/gpe-filemanager/gpe-filemanager_0.31.bb b/recipes/gpe-filemanager/gpe-filemanager_0.31.bb
index 26a3769..ab33a9a 100644
--- a/recipes/gpe-filemanager/gpe-filemanager_0.31.bb
+++ b/recipes/gpe-filemanager/gpe-filemanager_0.31.bb
@@ -7,8 +7,8 @@ LICENSE     = "GPL"
 DESCRIPTION = "GPE file manager"
 DEPENDS     = "libgpewidget gnome-vfs dbus-glib"
 SECTION = "gpe"
-RDEPENDS    = "gpe-icons"
-RRECOMMENDS = "gnome-vfs-plugin-file gnome-vfs-plugin-smb gnome-vfs-plugin-ftp gnome-vfs-plugin-computer gnome-vfs-plugin-network gnome-vfs-plugin-sftp gnome-vfs-plugin-http"
+RDEPENDS_${PN}    = "gpe-icons"
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file gnome-vfs-plugin-smb gnome-vfs-plugin-ftp gnome-vfs-plugin-computer gnome-vfs-plugin-network gnome-vfs-plugin-sftp gnome-vfs-plugin-http"
 
 FILES_${PN} += " ${datadir}/gpe"
 
diff --git a/recipes/gpe-filemanager/gpe-filemanager_svn.bb b/recipes/gpe-filemanager/gpe-filemanager_svn.bb
index fb9929c..184a941 100644
--- a/recipes/gpe-filemanager/gpe-filemanager_svn.bb
+++ b/recipes/gpe-filemanager/gpe-filemanager_svn.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "GPE file manager"
 SECTION = "gpe"
 LICENSE = "GPL"
 DEPENDS = "libgpewidget gnome-vfs dbus-glib"
-RDEPENDS = "gpe-icons"
-RRECOMMENDS = "gnome-vfs-plugin-file gnome-vfs-plugin-smb gnome-vfs-plugin-ftp gnome-vfs-plugin-computer gnome-vfs-plugin-network gnome-vfs-plugin-sftp gnome-vfs-plugin-http"
+RDEPENDS_${PN} = "gpe-icons"
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file gnome-vfs-plugin-smb gnome-vfs-plugin-ftp gnome-vfs-plugin-computer gnome-vfs-plugin-network gnome-vfs-plugin-sftp gnome-vfs-plugin-http"
 PR = "r1"
 PV = "0.25+svn-${SRCDATE}"
 
diff --git a/recipes/gpe-go/gpe-go_0.05.bb b/recipes/gpe-go/gpe-go_0.05.bb
index d071eca..abf507e 100644
--- a/recipes/gpe-go/gpe-go_0.05.bb
+++ b/recipes/gpe-go/gpe-go_0.05.bb
@@ -2,7 +2,7 @@ inherit gpe
 LICENSE = "GPL"
 DESCRIPTION = "A Go Board for GPE."
 DEPENDS = "gtk+ libgpewidget gpe-icons"
-RDEPENDS = "gdk-pixbuf-loader-jpeg"
+RDEPENDS_${PN} = "gdk-pixbuf-loader-jpeg"
 SECTION = "gpe"
 PRIORITY = "optional"
 PR = "r1"
diff --git a/recipes/gpe-helpviewer/gpe-helpviewer_1.0.bb b/recipes/gpe-helpviewer/gpe-helpviewer_1.0.bb
index 639efe5..2aea095 100644
--- a/recipes/gpe-helpviewer/gpe-helpviewer_1.0.bb
+++ b/recipes/gpe-helpviewer/gpe-helpviewer_1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A helpviewer based on gtk+webcore"
 LICENSE = "GPL"
 DEPENDS = "osb-nrcit"
-RDEPENDS = "gpe-helpviewer-doc"
+RDEPENDS_${PN} = "gpe-helpviewer-doc"
 PR = "r2"
 
 SRC_URI = "http://stag.mind.be/gpe-helpviewer-${PV}.tar.bz2"
diff --git a/recipes/gpe-icons/gpe-icons.inc b/recipes/gpe-icons/gpe-icons.inc
index fca142a..d5644ac 100644
--- a/recipes/gpe-icons/gpe-icons.inc
+++ b/recipes/gpe-icons/gpe-icons.inc
@@ -1,5 +1,5 @@
 SECTION = "gpe"
-RDEPENDS += "gdk-pixbuf-loader-png"
+RDEPENDS_${PN} += "gdk-pixbuf-loader-png"
 
 #only icons present in the package
 PACKAGE_ARCH = "all"
diff --git a/recipes/gpe-login/gpe-login_0.93.bb b/recipes/gpe-login/gpe-login_0.93.bb
index 4fdd44c..85b8d47 100644
--- a/recipes/gpe-login/gpe-login_0.93.bb
+++ b/recipes/gpe-login/gpe-login_0.93.bb
@@ -3,7 +3,7 @@ SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "gtk+ libgpewidget gpe-ownerinfo xkbd"
-RDEPENDS = "xkbd gpe-theme-clearlooks"
+RDEPENDS_${PN} = "xkbd gpe-theme-clearlooks"
 RPROVIDES_${PN} = "gpe-session-starter"
 PR = "r1"
 
diff --git a/recipes/gpe-login/gpe-login_svn.bb b/recipes/gpe-login/gpe-login_svn.bb
index 87ac97f..3144bb0 100644
--- a/recipes/gpe-login/gpe-login_svn.bb
+++ b/recipes/gpe-login/gpe-login_svn.bb
@@ -3,7 +3,7 @@ SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "gtk+ libgpewidget gpe-ownerinfo xkbd"
-RDEPENDS = "xkbd"
+RDEPENDS_${PN} = "xkbd"
 RPROVIDES_${PN} = "gpe-session-starter"
 PV = "0.93+svn${SRCDATE}"
 
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb b/recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb
index 6cab904..5499ca3 100644
--- a/recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb
+++ b/recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb
@@ -2,7 +2,7 @@ require gpe-mini-browser.inc
 
 SRC_URI = "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-browser-${PV}.tar.gz"
 DEPENDS = "osb-nrcit sqlite libgpewidget"
-RRECOMMENDS = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
 
 
 S = "${WORKDIR}/gpe-mini-browser-${PV}"
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb b/recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb
index b8146ed..9c67dcc 100644
--- a/recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb
+++ b/recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb
@@ -2,7 +2,7 @@ require gpe-mini-browser.inc
 
 SRC_URI = "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-browser-${PV}.tar.gz"
 DEPENDS = "osb-nrcit sqlite libgpewidget"
-RRECOMMENDS = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
 
 
 S = "${WORKDIR}/gpe-mini-browser-${PV}"
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb b/recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb
index d2cac63..eb3b2dc 100644
--- a/recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb
+++ b/recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb
@@ -2,7 +2,7 @@ require gpe-mini-browser.inc
 
 SRC_URI = "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-${PV}.tar.gz"
 DEPENDS = "osb-nrcit sqlite libgpewidget"
-RRECOMMENDS = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
 
 PR = "r1"
 
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb b/recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb
index 9069e53..b472c7c 100644
--- a/recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb
+++ b/recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb
@@ -2,7 +2,7 @@ require gpe-mini-browser.inc
 
 SRC_URI = "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-${PV}.tar.gz"
 DEPENDS = "osb-nrcit sqlite libgpewidget"
-RRECOMMENDS = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
 
 PR = "r1"
 
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb b/recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb
index 5601180..ad80370 100644
--- a/recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb
+++ b/recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb
@@ -2,7 +2,7 @@ require gpe-mini-browser.inc
 
 SRC_URI = "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-${PV}.tar.gz"
 DEPENDS = "osb-nrcit sqlite libgpewidget"
-RRECOMMENDS = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
 
 PR = "r1"
 
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb b/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
index d382706..a68c6e8 100644
--- a/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
+++ b/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
@@ -1,5 +1,5 @@
 DEPENDS = "sqlite gettext gtk+ glib-2.0 osb-nrcit libgpewidget"
-RRECOMMENDS = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
 
 SRCREV = "9900"
 PV = "0.20+svn${SRCDATE}"
diff --git a/recipes/gpe-mininet/gpe-mininet_0.6.bb b/recipes/gpe-mininet/gpe-mininet_0.6.bb
index 256e730..5bc072d 100644
--- a/recipes/gpe-mininet/gpe-mininet_0.6.bb
+++ b/recipes/gpe-mininet/gpe-mininet_0.6.bb
@@ -3,7 +3,7 @@ inherit autotools gpe pkgconfig
 PR = "r0"
 LICENSE = "GPL"
 DEPENDS = "libgpewidget gpe-icons gpe-conf"
-RRECOMMENDS = "gpe-conf"
+RRECOMMENDS_${PN} = "gpe-conf"
 SECTION = "gpe"
 
 DESCRIPTION = "GPE network connection checker"
diff --git a/recipes/gpe-mininet/gpe-mininet_0.7.bb b/recipes/gpe-mininet/gpe-mininet_0.7.bb
index 882bd8d..3a360fb 100644
--- a/recipes/gpe-mininet/gpe-mininet_0.7.bb
+++ b/recipes/gpe-mininet/gpe-mininet_0.7.bb
@@ -3,7 +3,7 @@ inherit autotools gpe pkgconfig
 PR = "r0"
 LICENSE = "GPL"
 DEPENDS = "libgpewidget gpe-icons gpe-conf"
-RRECOMMENDS = "gpe-conf"
+RRECOMMENDS_${PN} = "gpe-conf"
 SECTION = "gpe"
 
 DESCRIPTION = "GPE network connection checker"
diff --git a/recipes/gpe-mininet/gpe-mininet_svn.bb b/recipes/gpe-mininet/gpe-mininet_svn.bb
index 1acca05..49f0d74 100644
--- a/recipes/gpe-mininet/gpe-mininet_svn.bb
+++ b/recipes/gpe-mininet/gpe-mininet_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GPE network connection checker"
 SECTION = "gpe"
 LICENSE = "GPL"
 DEPENDS = "libgpewidget gpe-icons gpe-conf"
-RRECOMMENDS = "gpe-conf"
+RRECOMMENDS_${PN} = "gpe-conf"
 PR = "r0"
 PV = "0.7+svn-${SRCDATE}"
 
diff --git a/recipes/gpe-nmf/gpe-nmf.inc b/recipes/gpe-nmf/gpe-nmf.inc
index b7992e8..c465133 100644
--- a/recipes/gpe-nmf/gpe-nmf.inc
+++ b/recipes/gpe-nmf/gpe-nmf.inc
@@ -3,8 +3,8 @@ SECTION = "gpe/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "gtk+ libgpewidget gstreamer gst-plugins"
-RDEPENDS = "esd gst-plugins gst-plugin-audio gst-plugin-audioconvert gst-plugin-audiofile gst-plugin-esd gst-plugin-typefindfunctions gst-plugin-volume"
-RRECOMMENDS = "gst-plugin-mad gst-plugin-tagedit"
+RDEPENDS_${PN} = "esd gst-plugins gst-plugin-audio gst-plugin-audioconvert gst-plugin-audiofile gst-plugin-esd gst-plugin-typefindfunctions gst-plugin-volume"
+RRECOMMENDS_${PN} = "gst-plugin-mad gst-plugin-tagedit"
 
 inherit gpe pkgconfig
 
diff --git a/recipes/gpe-nmf/gpe-nmf_0.17.bb b/recipes/gpe-nmf/gpe-nmf_0.17.bb
index a5646dc..7ed86eb 100644
--- a/recipes/gpe-nmf/gpe-nmf_0.17.bb
+++ b/recipes/gpe-nmf/gpe-nmf_0.17.bb
@@ -1,7 +1,7 @@
 require gpe-nmf.inc
 
-RDEPENDS = ""
-RRECOMMENDS = ""
+RDEPENDS_${PN} = ""
+RRECOMMENDS_${PN} = ""
 
 SRC_URI += "file://fix_makefiles.patch"
 
diff --git a/recipes/gpe-nmf/gpe-nmf_0.20.bb b/recipes/gpe-nmf/gpe-nmf_0.20.bb
index d1440eb..331897d 100644
--- a/recipes/gpe-nmf/gpe-nmf_0.20.bb
+++ b/recipes/gpe-nmf/gpe-nmf_0.20.bb
@@ -1,6 +1,6 @@
 require gpe-nmf.inc
 
-RRECOMMENDS += "gst-plugin-tcp"
+RRECOMMENDS_${PN} += "gst-plugin-tcp"
 PR = "r1"
 
 SRC_URI[md5sum] = "28e1ff870af9b38d0cce345d339b857a"
diff --git a/recipes/gpe-nmf/gpe-nmf_0.21.bb b/recipes/gpe-nmf/gpe-nmf_0.21.bb
index a32de39..6a0d24f 100644
--- a/recipes/gpe-nmf/gpe-nmf_0.21.bb
+++ b/recipes/gpe-nmf/gpe-nmf_0.21.bb
@@ -1,6 +1,6 @@
 require gpe-nmf.inc
 
-RRECOMMENDS += "gst-plugin-tcp"
+RRECOMMENDS_${PN} += "gst-plugin-tcp"
 
 SRC_URI[md5sum] = "3181586b20fa77d1bd83024bc0aaa584"
 SRC_URI[sha256sum] = "2629167d8d27b083e34a6b39e0c8fffa035c84819f8058fdc6dceab60e3a0cf9"
diff --git a/recipes/gpe-nmf/gpe-nmf_0.22.bb b/recipes/gpe-nmf/gpe-nmf_0.22.bb
index c80f78d..fd249e4 100644
--- a/recipes/gpe-nmf/gpe-nmf_0.22.bb
+++ b/recipes/gpe-nmf/gpe-nmf_0.22.bb
@@ -1,7 +1,7 @@
 require gpe-nmf.inc
 
-RDEPENDS += "gst-plugin-decodebin"
-RRECOMMENDS += "gst-plugin-ivorbis gst-plugin-tcp"
+RDEPENDS_${PN} += "gst-plugin-decodebin"
+RRECOMMENDS_${PN} += "gst-plugin-ivorbis gst-plugin-tcp"
 PR = "r3"
 
 SRC_URI += " file://playlist-segfault.patch;striplevel=0 \
diff --git a/recipes/gpe-package/gpe-package_0.2.bb b/recipes/gpe-package/gpe-package_0.2.bb
index 424ba32..3840d39 100644
--- a/recipes/gpe-package/gpe-package_0.2.bb
+++ b/recipes/gpe-package/gpe-package_0.2.bb
@@ -4,7 +4,7 @@ inherit gpe pkgconfig
 
 DESCRIPTION = "A package manager GUI for GPE"
 DEPENDS = "ipkg libgpewidget"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 SECTION = "gpe"
 PRIORITY = "optional"
 
diff --git a/recipes/gpe-package/gpe-package_0.3.bb b/recipes/gpe-package/gpe-package_0.3.bb
index 81f9b2f..8080748 100644
--- a/recipes/gpe-package/gpe-package_0.3.bb
+++ b/recipes/gpe-package/gpe-package_0.3.bb
@@ -4,7 +4,7 @@ inherit gpe pkgconfig
 
 DESCRIPTION = "A package manager GUI for GPE"
 DEPENDS = "ipkg libpcre libgpewidget"
-RDEPENDS = "gpe-icons gpe-su"
+RDEPENDS_${PN} = "gpe-icons gpe-su"
 SECTION = "gpe"
 PRIORITY = "optional"
 
diff --git a/recipes/gpe-package/gpe-package_0.4.bb b/recipes/gpe-package/gpe-package_0.4.bb
index 77fd48e..5e9a436 100644
--- a/recipes/gpe-package/gpe-package_0.4.bb
+++ b/recipes/gpe-package/gpe-package_0.4.bb
@@ -4,7 +4,7 @@ inherit gpe pkgconfig
 
 DESCRIPTION = "A package manager GUI for GPE"
 DEPENDS = "ipkg libpcre libgpewidget"
-RDEPENDS = "gpe-icons gpe-su"
+RDEPENDS_${PN} = "gpe-icons gpe-su"
 SECTION = "gpe"
 PRIORITY = "optional"
 
diff --git a/recipes/gpe-plucker/gpe-plucker_0.4.bb b/recipes/gpe-plucker/gpe-plucker_0.4.bb
index 3a37f9d..e753c78 100644
--- a/recipes/gpe-plucker/gpe-plucker_0.4.bb
+++ b/recipes/gpe-plucker/gpe-plucker_0.4.bb
@@ -2,7 +2,7 @@ inherit gpe pkgconfig
 LICENSE = "GPL"
 DESCRIPTION = "Plucker ebook reader"
 DEPENDS = "gtk+ libgpewidget gpe-icons"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 SECTION = "gpe"
 PRIORITY = "optional"
 PR = "r3"
diff --git a/recipes/gpe-question/gpe-question_0.04.bb b/recipes/gpe-question/gpe-question_0.04.bb
index ffcf999..f8c2869 100644
--- a/recipes/gpe-question/gpe-question_0.04.bb
+++ b/recipes/gpe-question/gpe-question_0.04.bb
@@ -4,7 +4,7 @@ inherit gpe
 SRC_URI += "file://makefile-fix.patch"
 
 DEPENDS = "libgpewidget"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 SECTION = "gpe"
 DESCRIPTION = "GPE interface for asking questions from shell scripts"
 
diff --git a/recipes/gpe-shield/gpe-shield_0.9.bb b/recipes/gpe-shield/gpe-shield_0.9.bb
index c7ee88a..f2b2ad5 100644
--- a/recipes/gpe-shield/gpe-shield_0.9.bb
+++ b/recipes/gpe-shield/gpe-shield_0.9.bb
@@ -3,8 +3,8 @@ SECTION = "gpe"
 LICENSE     = "GPL"
 
 DEPENDS     = "libgpewidget iptables virtual/kernel"
-RDEPENDS    = "iptables"
-RRECOMMENDS = "kernel-module-ipt-state"
+RDEPENDS_${PN}    = "iptables"
+RRECOMMENDS_${PN} = "kernel-module-ipt-state"
 
 PR          = "r1"
 
diff --git a/recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb b/recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb
index 2d70322..bc0b751 100644
--- a/recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb
+++ b/recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb
@@ -1,5 +1,5 @@
 DEPENDS = "libgpewidget sqlite"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 LICENSE = "GPL"
 DESCRIPTION = "A GPE notebook to sketch your notes"
 export CVSBUILD = "no"
diff --git a/recipes/gpe-terminal/gpe-terminal_1.1.bb b/recipes/gpe-terminal/gpe-terminal_1.1.bb
index 3d89e35..a755436 100644
--- a/recipes/gpe-terminal/gpe-terminal_1.1.bb
+++ b/recipes/gpe-terminal/gpe-terminal_1.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GPE terminal wrapper"
 SECTION = "gpe"
 LICENSE = "GPL"
-RRECOMMENDS = "rxvt-unicode"
+RRECOMMENDS_${PN} = "rxvt-unicode"
 PR = "r1"
 
 SRC_URI = "file://${PN}.desktop file://${PN}.png"
diff --git a/recipes/gpe-terminal/gpe-terminal_svn.bb b/recipes/gpe-terminal/gpe-terminal_svn.bb
index 80fbe7a..904ef84 100644
--- a/recipes/gpe-terminal/gpe-terminal_svn.bb
+++ b/recipes/gpe-terminal/gpe-terminal_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GPE terminal wrapper"
 SECTION = "gpe"
 LICENSE = "GPL"
-RRECOMMENDS = "rxvt-unicode"
+RRECOMMENDS_${PN} = "rxvt-unicode"
 PR = "r1"
 PV = "1.1+svn-${SRCDATE}" 
 
diff --git a/recipes/gpe-themes/gpe-theme-clearlooks_0.2.bb b/recipes/gpe-themes/gpe-theme-clearlooks_0.2.bb
index 6e74f3f..cf6182d 100644
--- a/recipes/gpe-themes/gpe-theme-clearlooks_0.2.bb
+++ b/recipes/gpe-themes/gpe-theme-clearlooks_0.2.bb
@@ -4,7 +4,7 @@ PR = "r1"
 
 #it doesn't really depends on it, but it's nice to make OE build it
 DEPENDS = "gtk-engines"
-RDEPENDS = "gtk-engine-clearlooks"
+RDEPENDS_${PN} = "gtk-engine-clearlooks"
 
 FILES_${PN} = "${datadir}/themes/"
 SRC_URI = "http://dominion.thruhere.net/koen/pda/files/${P}.tar.gz"
diff --git a/recipes/gpe-themes/gpe-theme-clearlooks_0.3.bb b/recipes/gpe-themes/gpe-theme-clearlooks_0.3.bb
index 3103f6b..2c53664 100644
--- a/recipes/gpe-themes/gpe-theme-clearlooks_0.3.bb
+++ b/recipes/gpe-themes/gpe-theme-clearlooks_0.3.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 
 #it doesn't really depends on it, but it's nice to make OE build it
 DEPENDS = "gtk-engines"
-RDEPENDS = "gtk-engine-clearlooks"
+RDEPENDS_${PN} = "gtk-engine-clearlooks"
 
 FILES_${PN} = "${datadir}/themes/"
 SRC_URI = "http://dominion.thruhere.net/koen/pda/files/${P}.tar.gz"
diff --git a/recipes/gpe-themes/gpe-theme-e17_0.1.bb b/recipes/gpe-themes/gpe-theme-e17_0.1.bb
index 73ac5af..833a78b 100644
--- a/recipes/gpe-themes/gpe-theme-e17_0.1.bb
+++ b/recipes/gpe-themes/gpe-theme-e17_0.1.bb
@@ -3,7 +3,7 @@ LICENSE = 	"MIT + GPL"
 PR =		"r0"
 
 #it doesn't really depends on it, but it's nice to make OE build it
-RDEPENDS =		"gtk+"
+RDEPENDS_${PN} =		"gtk+"
 
 FILES_${PN} =		"${datadir}/themes/"
 SRC_URI =		"http://linuxtogo.org/~koen/gpe/themes/${P}.tar.gz"
diff --git a/recipes/gpe-themes/gpe-theme-foxbox_0.1.bb b/recipes/gpe-themes/gpe-theme-foxbox_0.1.bb
index 10758fa..770627b 100644
--- a/recipes/gpe-themes/gpe-theme-foxbox_0.1.bb
+++ b/recipes/gpe-themes/gpe-theme-foxbox_0.1.bb
@@ -5,7 +5,7 @@ PR = 			"r2"
 SECTION = 		"x11/base"
 DESCRIPTION = 	"Simple GPE theme using the Smooth theming engine."
 DEPENDS = 		"gtk-engines"
-RDEPENDS = 		"gtk-engine-smooth"
+RDEPENDS_${PN} = 		"gtk-engine-smooth"
 S = 			"${WORKDIR}/foxbox"
 
 FILES_${PN} = 	"${datadir}/themes"
diff --git a/recipes/gpe-themes/gpe-theme-industrial_0.1.bb b/recipes/gpe-themes/gpe-theme-industrial_0.1.bb
index 4c5612f..1dea097 100644
--- a/recipes/gpe-themes/gpe-theme-industrial_0.1.bb
+++ b/recipes/gpe-themes/gpe-theme-industrial_0.1.bb
@@ -4,7 +4,7 @@ PR =		"r0"
 
 #it doesn't really depends on it, but it's nice to make OE build it
 DEPENDS =		"gtk-engines"
-RDEPENDS =		"gtk-engine-industrial"
+RDEPENDS_${PN} =		"gtk-engine-industrial"
 
 FILES_${PN} =	"${datadir}/themes/"
 SRC_URI =		"http://dominion.thruhere.net/koen/pda/files/${P}.tar.gz"
diff --git a/recipes/gpe-themes/gpe-theme-industrial_0.2.bb b/recipes/gpe-themes/gpe-theme-industrial_0.2.bb
index d597367..a34e9a1 100644
--- a/recipes/gpe-themes/gpe-theme-industrial_0.2.bb
+++ b/recipes/gpe-themes/gpe-theme-industrial_0.2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 
 #it doesn't really depends on it, but it's nice to make OE build it
 DEPENDS = "gtk-engines"
-RDEPENDS = "gtk-engine-industrial"
+RDEPENDS_${PN} = "gtk-engine-industrial"
 
 FILES_${PN} = "${datadir}/themes/"
 SRC_URI = "http://dominion.thruhere.net/koen/pda/files/${P}.tar.gz"
diff --git a/recipes/gpe-timesheet/gpe-timesheet.inc b/recipes/gpe-timesheet/gpe-timesheet.inc
index 11c1327..4bc1c62 100644
--- a/recipes/gpe-timesheet/gpe-timesheet.inc
+++ b/recipes/gpe-timesheet/gpe-timesheet.inc
@@ -3,7 +3,7 @@ SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "libgpewidget gtk+ sqlite libtododb"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 
 inherit autotools gpe
 
diff --git a/recipes/gpe-todo/gpe-todo-hildon_0.54.bb b/recipes/gpe-todo/gpe-todo-hildon_0.54.bb
index a59ff6e..bbbe807 100644
--- a/recipes/gpe-todo/gpe-todo-hildon_0.54.bb
+++ b/recipes/gpe-todo/gpe-todo-hildon_0.54.bb
@@ -2,7 +2,7 @@ LICENSE     = "GPL"
 PR          = "r0"
 DESCRIPTION = "GPE to-do list"
 DEPENDS     = "libgpewidget-hildon libgpepimc-hildon libtododb sdk-default-icons libosso"
-RDEPENDS    = "sdk-default-icons"
+RDEPENDS_${PN}    = "sdk-default-icons"
 SECTION = "gpe"
 PRIORITY    = "optional"
 
diff --git a/recipes/gpe-todo/gpe-todo-hildon_0.55.bb b/recipes/gpe-todo/gpe-todo-hildon_0.55.bb
index f7c2d53..a535e18 100644
--- a/recipes/gpe-todo/gpe-todo-hildon_0.55.bb
+++ b/recipes/gpe-todo/gpe-todo-hildon_0.55.bb
@@ -2,7 +2,7 @@ LICENSE     = "GPL"
 PR          = "r0"
 DESCRIPTION = "GPE to-do list"
 DEPENDS     = "libgpewidget-hildon libgpepimc-hildon libtododb sdk-default-icons libosso"
-RDEPENDS    = "sdk-default-icons"
+RDEPENDS_${PN}    = "sdk-default-icons"
 SECTION = "gpe"
 PRIORITY    = "optional"
 
diff --git a/recipes/gphoto2/ptp-gadget_git.bb b/recipes/gphoto2/ptp-gadget_git.bb
index 5809100..5d89712 100644
--- a/recipes/gphoto2/ptp-gadget_git.bb
+++ b/recipes/gphoto2/ptp-gadget_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This is a device-side implementation of the PTP (Picture Transfer
 LICENSE = "GPLv3"
 
 DEPENDS = "virtual/kernel"
-RDEPENDS = "imagemagick"
+RDEPENDS_${PN} = "imagemagick"
 
 PV = "1.1"
 PR = "r1"
diff --git a/recipes/gpio-event/gpio-event.bb b/recipes/gpio-event/gpio-event.bb
index 582c80b..946d283 100644
--- a/recipes/gpio-event/gpio-event.bb
+++ b/recipes/gpio-event/gpio-event.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "gpio-event driver and userspace program"
 PRIORITY = "optional"
 SECTION = "base"
 LICENSE = "GPL"
-RDEPENDS = "kernel (${KERNEL_VERSION})"
+RDEPENDS_${PN} = "kernel (${KERNEL_VERSION})"
 DEPENDS = "virtual/kernel"
 
 PR = "r4"
diff --git a/recipes/gqview/gqview_2.1.5.bb b/recipes/gqview/gqview_2.1.5.bb
index 5bb2821..c07e209 100644
--- a/recipes/gqview/gqview_2.1.5.bb
+++ b/recipes/gqview/gqview_2.1.5.bb
@@ -3,7 +3,7 @@ SECTION = "x11/graphics"
 DEPENDS = "gtk+"
 LICENSE = "GPL"
 HOMEPAGE = "http://gqview.sourceforge.net/"
-RRECOMMENDS = "gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png gdk-pixbuf-loader-gif"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png gdk-pixbuf-loader-gif"
 PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/gqview/gqview-2.1.5.tar.gz \
diff --git a/recipes/grdesktop/grdesktop_0.23.bb b/recipes/grdesktop/grdesktop_0.23.bb
index 6fb64ef..860934b 100644
--- a/recipes/grdesktop/grdesktop_0.23.bb
+++ b/recipes/grdesktop/grdesktop_0.23.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2"
 
 DEPENDS = "gtk+ libgnomeui"
            
-RDEPENDS ="rdesktop gail orbit2 gnome-vfs gnome-keyring libbonobo libbonoboui \ 
+RDEPENDS_${PN} ="rdesktop gail orbit2 gnome-vfs gnome-keyring libbonobo libbonoboui \ 
             libart-lgpl libgnome libidl libglade libgnomecanvas "
 
 PR = "r1"
diff --git a/recipes/gsm/gsmd.inc b/recipes/gsm/gsmd.inc
index 2e0aad1..64393e5 100644
--- a/recipes/gsm/gsmd.inc
+++ b/recipes/gsm/gsmd.inc
@@ -14,7 +14,7 @@ SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gsm;proto=http \
 S = "${WORKDIR}/gsm"
 
 inherit autotools pkgconfig update-rc.d
-# handle update-rc.d RDEPENDS manually, we don't need it on
+# handle update-rc.d RDEPENDS_${PN} manually, we don't need it on
 # anything but gsmd
 RDEPENDS_append = ""
 
diff --git a/recipes/gspcav1/gspcav1_20070110.bb b/recipes/gspcav1/gspcav1_20070110.bb
index 9222486..e894a53 100644
--- a/recipes/gspcav1/gspcav1_20070110.bb
+++ b/recipes/gspcav1/gspcav1_20070110.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL"
 
 PR = "r2"
 
-RRECOMMENDS = "kernel-module-videodev kernel-module-v4l1-compat kernel-module-v4l2-common"
+RRECOMMENDS_${PN} = "kernel-module-videodev kernel-module-v4l1-compat kernel-module-v4l2-common"
 
 SRC_URI = "http://mxhaard.free.fr/spca50x/Download/oldrelease/${PN}-${PV}.tar.gz \
            file://Makefile.patch \
diff --git a/recipes/gspcav1/gspcav1_20070508.bb b/recipes/gspcav1/gspcav1_20070508.bb
index 24325ca..1cdc3b9 100644
--- a/recipes/gspcav1/gspcav1_20070508.bb
+++ b/recipes/gspcav1/gspcav1_20070508.bb
@@ -8,7 +8,7 @@ DEFAULT_PREFERENCE = "-1"
 
 PR = "r2"
 
-RRECOMMENDS = "kernel-module-videodev kernel-module-v4l1-compat kernel-module-v4l2-common"
+RRECOMMENDS_${PN} = "kernel-module-videodev kernel-module-v4l1-compat kernel-module-v4l2-common"
 
 SRC_URI = "http://mxhaard.free.fr/spca50x/Download/oldrelease/${PN}-${PV}.tar.gz \
            file://Makefile.patch \
diff --git a/recipes/gstreamer/gst-player_svn.bb b/recipes/gstreamer/gst-player_svn.bb
index c44213b..e0022a4 100644
--- a/recipes/gstreamer/gst-player_svn.bb
+++ b/recipes/gstreamer/gst-player_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION="A simple gstreamer based player"
 
 DEPENDS = "gstreamer"
-RDEPENDS = "gstreamer-ti"
+RDEPENDS_${PN} = "gstreamer-ti"
 
 SRCREV = "6"
 SRC_URI = "svn://gstplayer.googlecode.com/svn;module=trunk;proto=http"
diff --git a/recipes/gtk+/gdk-pixbuf-csource-native_2.12.11.bb b/recipes/gtk+/gdk-pixbuf-csource-native_2.12.11.bb
index 86ae530..5e62637 100644
--- a/recipes/gtk+/gdk-pixbuf-csource-native_2.12.11.bb
+++ b/recipes/gtk+/gdk-pixbuf-csource-native_2.12.11.bb
@@ -6,7 +6,7 @@ FILESPATH = "${FILE_DIRNAME}/gdk-pixbuf-csource:${FILE_DIRNAME}/gtk+-${PV}:${FIL
 SRC_URI += "file://reduce-dependencies.patch"
 
 #clear recommends for uclibc builds
-RRECOMMENDS = " "
+RRECOMMENDS_${PN} = " "
 RRECOMMENDS_${PN}_linux = "  "
 RRECOMMENDS_${PN}_linux-gnueabi = " "
 
diff --git a/recipes/gtk-sharp/gtk-sharp.inc b/recipes/gtk-sharp/gtk-sharp.inc
index 1fc9941..8005367 100644
--- a/recipes/gtk-sharp/gtk-sharp.inc
+++ b/recipes/gtk-sharp/gtk-sharp.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "GTK bindings for mono"
 SECTION = "devel/mono"
 
 DEPENDS = "mono mono-native gtk+ atk pango cairo glib-2.0 libglade "
-RDEPENDS = "mono"
+RDEPENDS_${PN} = "mono"
 
 inherit autotools
 
diff --git a/recipes/gtk-webcore/osb-browser_20050430.bb b/recipes/gtk-webcore/osb-browser_20050430.bb
index d7692ca..4877f4a 100644
--- a/recipes/gtk-webcore/osb-browser_20050430.bb
+++ b/recipes/gtk-webcore/osb-browser_20050430.bb
@@ -9,7 +9,7 @@ PV = "0.5.0+cvs${FIXEDSRCDATE}"
 PR = "r1"
 
 DEPENDS = "osb-nrcit gtk+ glib-2.0 libglade"
-RRECOMMENDS = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-ico gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-ico gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png"
 
 SRC_URI = "cvs://anonymous@gtk-webcore.cvs.sourceforge.net/cvsroot/gtk-webcore;module=osb-browser;date=${FIXEDSRCDATE} \
            file://no-pedantic.patch"
diff --git a/recipes/gtk-webcore/osb-browser_20060212.bb b/recipes/gtk-webcore/osb-browser_20060212.bb
index 180c149..f9cede0 100644
--- a/recipes/gtk-webcore/osb-browser_20060212.bb
+++ b/recipes/gtk-webcore/osb-browser_20060212.bb
@@ -9,7 +9,7 @@ PV = "0.5.0+cvs${FIXEDSRCDATE}"
 PR = "r0"
 
 DEPENDS = "osb-nrcit gtk+ glib-2.0 libglade"
-RRECOMMENDS = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-ico gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-ico gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png"
 
 SRC_URI = "cvs://anonymous@gtk-webcore.cvs.sourceforge.net/cvsroot/gtk-webcore;module=osb-browser;date=${FIXEDSRCDATE} \
            file://no-pedantic.patch"
diff --git a/recipes/gtk-webcore/osb-browser_svn.bb b/recipes/gtk-webcore/osb-browser_svn.bb
index b6fc792..ddfd829 100644
--- a/recipes/gtk-webcore/osb-browser_svn.bb
+++ b/recipes/gtk-webcore/osb-browser_svn.bb
@@ -4,7 +4,7 @@ SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "osb-nrcit gtk+ glib-2.0 libglade"
-RRECOMMENDS = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-ico gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png"
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-ico gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png"
 SRCREV = "125"
 PV = "0.5.0+svnr${SRCPV}"
 PR = "r0"
diff --git a/recipes/gtk2-theme-angelistic/gtk2-theme-angelistic_0.3.bb b/recipes/gtk2-theme-angelistic/gtk2-theme-angelistic_0.3.bb
index 54e1284..3e20a98 100644
--- a/recipes/gtk2-theme-angelistic/gtk2-theme-angelistic_0.3.bb
+++ b/recipes/gtk2-theme-angelistic/gtk2-theme-angelistic_0.3.bb
@@ -2,7 +2,7 @@ SECTION = "x11/base"
 LICENSE = "GPL"
 SRC_URI = "file://gtkrc file://gtkrc-global"
 DEPENDS = "gnome-themes"
-RDEPENDS = "gtk-engine-mist"
+RDEPENDS_${PN} = "gtk-engine-mist"
 PR = "r3"
 
 FILES_${PN} += "${datadir}/themes"
diff --git a/recipes/gxine/gxine_0.4.1.bb b/recipes/gxine/gxine_0.4.1.bb
index 73c739b..dbf86ba 100644
--- a/recipes/gxine/gxine_0.4.1.bb
+++ b/recipes/gxine/gxine_0.4.1.bb
@@ -6,8 +6,8 @@ PR = "r2"
 
 DEFAULT_PREFERENCE = "-1"
 
-# Long list of RDEPENDS required to playback mp3/ogg audio and mpeg/mpeg4 video
-RDEPENDS = "libxine-plugin-vo-out-xshm \
+# Long list of RDEPENDS_${PN} required to playback mp3/ogg audio and mpeg/mpeg4 video
+RDEPENDS_${PN} = "libxine-plugin-vo-out-xshm \
 	    libxine-plugin-vo-out-none \
 	    libxine-plugin-ao-out-esd \
 	    libxine-plugin-ao-out-none \
diff --git a/recipes/gxine/gxine_0.4.1enhanced.bb b/recipes/gxine/gxine_0.4.1enhanced.bb
index 3e11065..f0ba73f 100644
--- a/recipes/gxine/gxine_0.4.1enhanced.bb
+++ b/recipes/gxine/gxine_0.4.1enhanced.bb
@@ -4,8 +4,8 @@ LICENSE = "GPL"
 DEPENDS = "gtk+ libxine"
 PR = "r1"
 
-# Long list of RDEPENDS required to playback mp3/ogg audio and mpeg/mpeg4 video
-RDEPENDS = "libxine-plugin-vo-out-xshm \
+# Long list of RDEPENDS_${PN} required to playback mp3/ogg audio and mpeg/mpeg4 video
+RDEPENDS_${PN} = "libxine-plugin-vo-out-xshm \
 	    libxine-plugin-vo-out-none \
 	    libxine-plugin-ao-out-esd \
 	    libxine-plugin-ao-out-none \
diff --git a/recipes/hal/hal.inc b/recipes/hal/hal.inc
index b930894..8e9e344 100644
--- a/recipes/hal/hal.inc
+++ b/recipes/hal/hal.inc
@@ -10,8 +10,8 @@ S = "${WORKDIR}/hal-${PV}"
 inherit autotools pkgconfig
 
 DEPENDS = "consolekit virtual/kernel util-linux-ng dbus-glib udev intltool intltool-native expat virtual/libusb0 gperf-native"
-RDEPENDS += "hal-info udev-utils"
-RRECOMMENDS += "eject"
+RDEPENDS_${PN} += "hal-info udev-utils"
+RRECOMMENDS_${PN} += "eject"
 
 SRC_URI += "file://99_hal \
             file://20hal \
diff --git a/recipes/help2man/help2man_1.36.4.bb b/recipes/help2man/help2man_1.36.4.bb
index 396d4c1..1039719 100644
--- a/recipes/help2man/help2man_1.36.4.bb
+++ b/recipes/help2man/help2man_1.36.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE    = "http://www.gnu.org/software/help2man"
 SECTION     = "console/utils"
 LICENSE     = "GPLv2"
 DEPENDS     = "gettext-native perl-native liblocale-gettext-perl-native"
-RDEPENDS    = "gettext perl liblocale-gettext-perl"
+RDEPENDS_${PN}    = "gettext perl liblocale-gettext-perl"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
diff --git a/recipes/hicolor-icon-theme/hicolor-icon-theme_0.10.bb b/recipes/hicolor-icon-theme/hicolor-icon-theme_0.10.bb
index 34a2c3a..609e8b0 100644
--- a/recipes/hicolor-icon-theme/hicolor-icon-theme_0.10.bb
+++ b/recipes/hicolor-icon-theme/hicolor-icon-theme_0.10.bb
@@ -2,8 +2,8 @@ SECTION = "unknown"
 LICENSE = "GPL"
 inherit autotools gtk-icon-cache
 
-# Override RDEPENDS = hicolor-icon-theme from gtk-icon-cache
-RDEPENDS = ""
+# Override RDEPENDS_${PN} = hicolor-icon-theme from gtk-icon-cache
+RDEPENDS_${PN} = ""
 RDEPENDS_${PN} = ""
 
 SRC_URI = "http://icon-theme.freedesktop.org/releases/${P}.tar.gz"
diff --git a/recipes/hicolor-icon-theme/hicolor-icon-theme_0.11.bb b/recipes/hicolor-icon-theme/hicolor-icon-theme_0.11.bb
index 776233c..569ec53 100644
--- a/recipes/hicolor-icon-theme/hicolor-icon-theme_0.11.bb
+++ b/recipes/hicolor-icon-theme/hicolor-icon-theme_0.11.bb
@@ -2,8 +2,8 @@ SECTION = "unknown"
 LICENSE = "GPL"
 inherit autotools gtk-icon-cache
 
-# Override RDEPENDS = hicolor-icon-theme from gtk-icon-cache
-RDEPENDS = ""
+# Override RDEPENDS_${PN} = hicolor-icon-theme from gtk-icon-cache
+RDEPENDS_${PN} = ""
 RDEPENDS_${PN} = ""
 
 SRC_URI = "http://icon-theme.freedesktop.org/releases/${P}.tar.gz"
diff --git a/recipes/hostap/hostap-conf_1.0.bb b/recipes/hostap/hostap-conf_1.0.bb
index e0909dd..70ff05d 100644
--- a/recipes/hostap/hostap-conf_1.0.bb
+++ b/recipes/hostap/hostap-conf_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "PCMCIA-cs configuration files for wireless LAN cards based on Int
 SECTION = "kernel/modules"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "update-modules"
+RDEPENDS_${PN} = "update-modules"
 PACKAGE_ARCH = "all"
 PR = "r9"
 
diff --git a/recipes/hostap/hostap-daemon.inc b/recipes/hostap/hostap-daemon.inc
index 33dc1c1..fe74560 100644
--- a/recipes/hostap/hostap-daemon.inc
+++ b/recipes/hostap/hostap-daemon.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://hostap.epitest.fi"
 SECTION = "kernel/userland"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "hostap-utils (${PV})"
+RDEPENDS_${PN} = "hostap-utils (${PV})"
 DEPENDS = "openssl"
 DEPENDS_append_mtx-1 = " madwifi-modules"
 DEPENDS_append_mtx-2 = " madwifi-modules"
diff --git a/recipes/hostap/hostap-modules.inc b/recipes/hostap/hostap-modules.inc
index 40e6742..02d880c 100644
--- a/recipes/hostap/hostap-modules.inc
+++ b/recipes/hostap/hostap-modules.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "A driver for wireless LAN cards based on Intersil's Prism2/2.5/3
 SECTION = "kernel/modules"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RRECOMMENDS = "apm-wifi-suspendfix"
+RRECOMMENDS_${PN} = "apm-wifi-suspendfix"
 
 SRC_URI = "http://hostap.epitest.fi/releases/hostap-driver-${PV}.tar.gz"
 SRC_URI_append_mtx-1 = " file://mtx_compat.diff;striplevel=0 \
diff --git a/recipes/hotplug-dbus/hotplug-dbus_0.9.bb b/recipes/hotplug-dbus/hotplug-dbus_0.9.bb
index 3a54727..284c049 100644
--- a/recipes/hotplug-dbus/hotplug-dbus_0.9.bb
+++ b/recipes/hotplug-dbus/hotplug-dbus_0.9.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 DESCRIPTION = "D-BUS glue for hotplug system"
 # DEPENDS = "dbus hotplug"
 DEPENDS = "dbus"
-RDEPENDS = "hotplug"
+RDEPENDS_${PN} = "hotplug"
 LICENSE = "GPL"
 
 inherit gpe
diff --git a/recipes/hotplug-qcop/hotplug-qcop_cvs.bb b/recipes/hotplug-qcop/hotplug-qcop_cvs.bb
index 5c0d238..55a91b2 100644
--- a/recipes/hotplug-qcop/hotplug-qcop_cvs.bb
+++ b/recipes/hotplug-qcop/hotplug-qcop_cvs.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "HotPlug -> QCOP Event Bridge"
 SECTION = "opie/base"
-RDEPENDS = "opie-qcop hotplug"
+RDEPENDS_${PN} = "opie-qcop hotplug"
 LICENSE = "GPL"
 PR = "r0"
 
diff --git a/recipes/hsetroot/hsetroot_1.0.2.bb b/recipes/hsetroot/hsetroot_1.0.2.bb
index 6b17bb0..37dd91a 100644
--- a/recipes/hsetroot/hsetroot_1.0.2.bb
+++ b/recipes/hsetroot/hsetroot_1.0.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Yet another X Wallpaper Utility"
 DEPENDS += "imlib2 freetype zlib virtual/libx11 libxext"
-RDEPENDS += "imlib2-loaders"
+RDEPENDS_${PN} += "imlib2-loaders"
 LICENSE = "GPL"
 
 SRC_URI = "http://thegraveyard.org/files/hsetroot-${PV}.tar.gz \
diff --git a/recipes/htb-init/htb-init_0.8.5.bb b/recipes/htb-init/htb-init_0.8.5.bb
index 2ef889b..5295648 100644
--- a/recipes/htb-init/htb-init_0.8.5.bb
+++ b/recipes/htb-init/htb-init_0.8.5.bb
@@ -6,8 +6,8 @@ PR = "r2"
 SRC_URI = "${SOURCEFORGE_MIRROR}/htbinit/htb.init-v${PV} \
 	file://htb.init+ingress+predef+verbose.diff;striplevel=0 \
 	file://htb-basic-verbose.diff;striplevel=0"
-RRECOMMENDS = "kernel-module-sch-ingress kernel-module-cls-route kernel-module-cls-u32 kernel-module-cls-fw kernel-module-sch-sfq kernel-module-sch-htb"
-RDEPENDS = "iproute2"
+RRECOMMENDS_${PN} = "kernel-module-sch-ingress kernel-module-cls-route kernel-module-cls-u32 kernel-module-cls-fw kernel-module-sch-sfq kernel-module-sch-htb"
+RDEPENDS_${PN} = "iproute2"
 
 S="${WORKDIR}"
 
diff --git a/recipes/ica/ica-bin_10.6.bb b/recipes/ica/ica-bin_10.6.bb
index 1f60720..15fc63a 100644
--- a/recipes/ica/ica-bin_10.6.bb
+++ b/recipes/ica/ica-bin_10.6.bb
@@ -3,7 +3,7 @@
 # Released under the MIT license (see packages/COPYING)
 
 DEPENDS = "virtual/libx11 libxaw rpm2cpio-native fakeroot-native"
-RDEPENDS = "libxaw"
+RDEPENDS_${PN} = "libxaw"
 
 HOMEPAGE="www.citrix.com/download/"
 
diff --git a/recipes/icewm/icewm_1.2.30.bb b/recipes/icewm/icewm_1.2.30.bb
index 18af8e4..6e3de76 100644
--- a/recipes/icewm/icewm_1.2.30.bb
+++ b/recipes/icewm/icewm_1.2.30.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "IceWM Window Manager"
 SECTION = "x11/wm"
 LICENSE = "GPL"
 DEPENDS = "virtual/libx11 libxext libxcomposite libxfixes libxdamage libxrender libxinerama libxpm xrandr xft mkfontdir-native"
-RRECOMMENDS = "ttf-dejavu-sans"
+RRECOMMENDS_${PN} = "ttf-dejavu-sans"
 PR = "r2"
 
 SRC_URI = "\
diff --git a/recipes/images/shr-image.bb b/recipes/images/shr-image.bb
index 3d72ca0..7a01460 100644
--- a/recipes/images/shr-image.bb
+++ b/recipes/images/shr-image.bb
@@ -3,7 +3,7 @@ require shr-image.inc
 IMAGE_BASENAME = "full"
 
 DEPENDS += "task-shr"
-RDEPENDS += "\
+RDEPENDS_${PN} += "\
     task-shr-apps \
     task-shr-games \
     task-shr-gtk \
diff --git a/recipes/images/shr-image.inc b/recipes/images/shr-image.inc
index 160593b..f369a8e 100644
--- a/recipes/images/shr-image.inc
+++ b/recipes/images/shr-image.inc
@@ -8,7 +8,7 @@ PR = "r13"
 
 DEPENDS += "task-shr-minimal"
 
-RDEPENDS += "\
+RDEPENDS_${PN} += "\
   task-shr-minimal-base \
   task-shr-minimal-cli \
   task-shr-minimal-fso \
diff --git a/recipes/initrdscripts/initramfs-jffs2_0.1.bb b/recipes/initrdscripts/initramfs-jffs2_0.1.bb
index 812e612..cbb476f 100644
--- a/recipes/initrdscripts/initramfs-jffs2_0.1.bb
+++ b/recipes/initrdscripts/initramfs-jffs2_0.1.bb
@@ -1,6 +1,6 @@
 SRC_URI = "file://jffs2boot.sh"
 PR = "r3"
-RRECOMMENDS = "kernel-module-mtdblock kernel-module-mtdram"
+RRECOMMENDS_${PN} = "kernel-module-mtdblock kernel-module-mtdram"
 
 do_install() {
         install -m 0755 ${WORKDIR}/jffs2boot.sh ${D}/init
diff --git a/recipes/initrdscripts/initramfs-module-aufs_1.0.bb b/recipes/initrdscripts/initramfs-module-aufs_1.0.bb
index aa31cee..1b8721b 100644
--- a/recipes/initrdscripts/initramfs-module-aufs_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-aufs_1.0.bb
@@ -1,7 +1,7 @@
 SRC_URI = "file://98-aufs.sh"
 PR = "r1"
 DESCRIPTION = "An initramfs module for mount aufs."
-RDEPENDS = "initramfs-uniboot aufs"
+RDEPENDS_${PN} = "initramfs-uniboot aufs"
 
 do_install() {
     install -d ${D}/initrd.d
diff --git a/recipes/initrdscripts/initramfs-module-block_1.0.bb b/recipes/initrdscripts/initramfs-module-block_1.0.bb
index b4b2d43..f715eae 100644
--- a/recipes/initrdscripts/initramfs-module-block_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-block_1.0.bb
@@ -1,6 +1,6 @@
 SRC_URI = "file://85-blockboot.sh"
 PR = "r3"
-RDEPENDS = "initramfs-uniboot"
+RDEPENDS_${PN} = "initramfs-uniboot"
 DESCRIPTION = "An initramfs module for booting off normal block devices."
 
 do_install() {
diff --git a/recipes/initrdscripts/initramfs-module-bootldr-buster_1.0.bb b/recipes/initrdscripts/initramfs-module-bootldr-buster_1.0.bb
index 8c4c2f7..f33ecd3 100644
--- a/recipes/initrdscripts/initramfs-module-bootldr-buster_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-bootldr-buster_1.0.bb
@@ -1,7 +1,7 @@
 SRC_URI = "file://01-bootldr-buster.sh"
 PR = "r2"
 DESCRIPTION = "An initramfs module for ignoring bogus kernel commandline from Compaq bootldr"
-RDEPENDS = "initramfs-uniboot"
+RDEPENDS_${PN} = "initramfs-uniboot"
 
 do_install() {
 	install -d ${D}/initrd.d
diff --git a/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb b/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb
index f4fd3be..50f9519 100644
--- a/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb
@@ -1,9 +1,9 @@
 SRC_URI = "file://30-bootmenu.sh"
 PR = "r18"
 DESCRIPTION = "An initramfs module with UI for selection of boot device."
-RDEPENDS = "klibc-utils-static-fstype initramfs-uniboot initramfs-module-block initramfs-module-loop initramfs-module-nfs"
+RDEPENDS_${PN} = "klibc-utils-static-fstype initramfs-uniboot initramfs-module-block initramfs-module-loop initramfs-module-nfs"
 # For VFAT mounting.
-RRECOMMENDS = "kernel-module-nls-cp437 kernel-module-nls-iso8859-1"
+RRECOMMENDS_${PN} = "kernel-module-nls-cp437 kernel-module-nls-iso8859-1"
 
 do_install() {
 	install -d ${D}/initrd.d
diff --git a/recipes/initrdscripts/initramfs-module-check-modules_1.0.bb b/recipes/initrdscripts/initramfs-module-check-modules_1.0.bb
index 6986316..e1eeb6f 100644
--- a/recipes/initrdscripts/initramfs-module-check-modules_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-check-modules_1.0.bb
@@ -1,7 +1,7 @@
 SRC_URI = "file://90-check-modules.sh"
 PR = "r0"
 DESCRIPTION = "An initramfs module for checking that kernel modules exist in rootfs"
-RDEPENDS = "initramfs-uniboot"
+RDEPENDS_${PN} = "initramfs-uniboot"
 
 do_install() {
 	install -d ${D}/initrd.d
diff --git a/recipes/initrdscripts/initramfs-module-ext3_1.0.bb b/recipes/initrdscripts/initramfs-module-ext3_1.0.bb
index e95dcdc..ad483c4 100644
--- a/recipes/initrdscripts/initramfs-module-ext3_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-ext3_1.0.bb
@@ -1,7 +1,7 @@
 SRC_URI = "file://80-ext3.sh"
 PR = "r1"
 DESCRIPTION = "An initramfs module for mount ext3."
-RDEPENDS = "initramfs-uniboot"
+RDEPENDS_${PN} = "initramfs-uniboot"
 
 do_install() {
     install -d ${D}/initrd.d
diff --git a/recipes/initrdscripts/initramfs-module-initfs_1.0.bb b/recipes/initrdscripts/initramfs-module-initfs_1.0.bb
index 2c2ec07..a7ca82b 100644
--- a/recipes/initrdscripts/initramfs-module-initfs_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-initfs_1.0.bb
@@ -1,8 +1,8 @@
 SRC_URI = "file://10-initfs.sh"
 PR = "r4"
 DESCRIPTION = "An initramfs module for initializing filesystems."
-RDEPENDS = "initramfs-uniboot"
-RRECOMMENDS = "kernel-module-vfat kernel-module-ext2"
+RDEPENDS_${PN} = "initramfs-uniboot"
+RRECOMMENDS_${PN} = "kernel-module-vfat kernel-module-ext2"
 
 do_install() {
 	install -d ${D}/initrd.d
diff --git a/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb b/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb
index 7f1e7cd..585ea9a 100644
--- a/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb
@@ -1,7 +1,7 @@
 SRC_URI = "file://87-kexecboot.sh"
 PR = "r2"
 DESCRIPTION = "An initramfs module for kexecing kernel from rootfs."
-RDEPENDS = "initramfs-uniboot kexec-klibc-static"
+RDEPENDS_${PN} = "initramfs-uniboot kexec-klibc-static"
 
 do_install() {
 	install -d ${D}/initrd.d
diff --git a/recipes/initrdscripts/initramfs-module-loop_1.0.bb b/recipes/initrdscripts/initramfs-module-loop_1.0.bb
index 1a2d0a9..5d10bd3 100644
--- a/recipes/initrdscripts/initramfs-module-loop_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-loop_1.0.bb
@@ -2,8 +2,8 @@ SRC_URI = "file://80-loopboot.sh"
 PR = "r2"
 DESCRIPTION = "An initramfs module for booting a filesystem image by loopback \
                mounting it."
-RDEPENDS = "initramfs-uniboot initramfs-module-initfs"
-RRECOMMENDS = "kernel-module-loop kernel-module-vfat"
+RDEPENDS_${PN} = "initramfs-uniboot initramfs-module-initfs"
+RRECOMMENDS_${PN} = "kernel-module-loop kernel-module-vfat"
 
 do_install() {
 	install -d ${D}/initrd.d
diff --git a/recipes/initrdscripts/initramfs-module-nfs_1.0.bb b/recipes/initrdscripts/initramfs-module-nfs_1.0.bb
index 77c3879..0c303cb 100644
--- a/recipes/initrdscripts/initramfs-module-nfs_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-nfs_1.0.bb
@@ -1,8 +1,8 @@
 SRC_URI = "file://80-nfsboot.sh"
 PR = "r2"
 DESCRIPTION = "An initramfs module for booting via NFS."
-RDEPENDS = "initramfs-uniboot"
-RRECOMMENDS = "kernel-module-g-ether kernel-module-nfs"
+RDEPENDS_${PN} = "initramfs-uniboot"
+RRECOMMENDS_${PN} = "kernel-module-g-ether kernel-module-nfs"
 
 do_install() {
 	install -d ${D}/initrd.d
diff --git a/recipes/initrdscripts/initramfs-module-psplash_1.0.bb b/recipes/initrdscripts/initramfs-module-psplash_1.0.bb
index 08d1cc6..0a44966 100644
--- a/recipes/initrdscripts/initramfs-module-psplash_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-psplash_1.0.bb
@@ -1,6 +1,6 @@
 SRC_URI = "file://00-psplash.sh file://99-psplash.sh"
 PR = "r5"
-RDEPENDS = "initramfs-uniboot virtual-psplash"
+RDEPENDS_${PN} = "initramfs-uniboot virtual-psplash"
 DESCRIPTION = "An initramfs module to enable psplash."
 
 do_install() {
diff --git a/recipes/initrdscripts/initramfs-module-squashfs_1.0.bb b/recipes/initrdscripts/initramfs-module-squashfs_1.0.bb
index f3d50ff..c8e04b0 100644
--- a/recipes/initrdscripts/initramfs-module-squashfs_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-squashfs_1.0.bb
@@ -1,7 +1,7 @@
 SRC_URI = "file://80-squashfs.sh"
 PR = "r1"
 DESCRIPTION = "An initramfs module for mount squashfs."
-RDEPENDS = "initramfs-uniboot"
+RDEPENDS_${PN} = "initramfs-uniboot"
 
 do_install() {
     install -d ${D}/initrd.d
diff --git a/recipes/initrdscripts/initramfs-uniboot_1.0.bb b/recipes/initrdscripts/initramfs-uniboot_1.0.bb
index fcbbdbd..2ceea68 100644
--- a/recipes/initrdscripts/initramfs-uniboot_1.0.bb
+++ b/recipes/initrdscripts/initramfs-uniboot_1.0.bb
@@ -1,7 +1,7 @@
 SRC_URI = "file://init.sh"
 PR = "r11"
 DESCRIPTON = "A modular initramfs init script system."
-RRECOMMENDS = "kernel-module-mtdblock"
+RRECOMMENDS_${PN} = "kernel-module-mtdblock"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init.sh ${D}/init
diff --git a/recipes/initscripts/initscripts-openmoko_1.0.bb b/recipes/initscripts/initscripts-openmoko_1.0.bb
index d6d233b..d928468 100644
--- a/recipes/initscripts/initscripts-openmoko_1.0.bb
+++ b/recipes/initscripts/initscripts-openmoko_1.0.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "required"
 LICENSE = "GPL"
 DEPENDS = ""
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 RCONFLICTS_${PN} = "initscripts"
 
diff --git a/recipes/initscripts/initscripts-slugos_1.0.bb b/recipes/initscripts/initscripts-slugos_1.0.bb
index 43153c0..b793514 100644
--- a/recipes/initscripts/initscripts-slugos_1.0.bb
+++ b/recipes/initscripts/initscripts-slugos_1.0.bb
@@ -12,7 +12,7 @@ RCONFLICTS = "initscripts"
 # the below lines serve to remove the dependency on the full makedevs package,
 # as well as adding the dependency for the update-rc.d package.
 DEPENDS = "update-rc.d-native"
-RDEPENDS = "update-rc.d"
+RDEPENDS_${PN} = "update-rc.d"
 
 # All other standard definitions inherited from initscripts
 # Except the PR which is hacked here.  The format used is
diff --git a/recipes/initscripts/initscripts_1.0.bb b/recipes/initscripts/initscripts_1.0.bb
index 588375d..601622f 100644
--- a/recipes/initscripts/initscripts_1.0.bb
+++ b/recipes/initscripts/initscripts_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SysV init scripts"
 SECTION = "base"
 PRIORITY = "required"
 DEPENDS = "makedevs"
-RDEPENDS = "makedevs"
+RDEPENDS_${PN} = "makedevs"
 LICENSE = "GPL"
 PR = "r120"
 
diff --git a/recipes/intltool/intltool_0.35.0.bb b/recipes/intltool/intltool_0.35.0.bb
index 17d4cc6..966e373 100644
--- a/recipes/intltool/intltool_0.35.0.bb
+++ b/recipes/intltool/intltool_0.35.0.bb
@@ -1,7 +1,7 @@
 require intltool.inc
 
-#RDEPENDS = "libxml-parser-perl"
-RRECOMMENDS = "perl-modules"
+#RDEPENDS_${PN} = "libxml-parser-perl"
+RRECOMMENDS_${PN} = "perl-modules"
 
 PR = "${INC_PR}.0"
 
diff --git a/recipes/intltool/intltool_0.35.2.bb b/recipes/intltool/intltool_0.35.2.bb
index 8e55fe8..dd308fc 100644
--- a/recipes/intltool/intltool_0.35.2.bb
+++ b/recipes/intltool/intltool_0.35.2.bb
@@ -1,7 +1,7 @@
 require intltool.inc
 
-RDEPENDS = "perl-module-text-wrap perl-module-re"
-RRECOMMENDS = "perl-modules"
+RDEPENDS_${PN} = "perl-module-text-wrap perl-module-re"
+RRECOMMENDS_${PN} = "perl-modules"
 
 PR = "${INC_PR}.0"
 
diff --git a/recipes/intltool/intltool_0.35.5.bb b/recipes/intltool/intltool_0.35.5.bb
index 6db0f23..fb8b941 100644
--- a/recipes/intltool/intltool_0.35.5.bb
+++ b/recipes/intltool/intltool_0.35.5.bb
@@ -1,7 +1,7 @@
 require intltool.inc
 
-RDEPENDS = "perl-module-text-wrap perl-module-re"
-RRECOMMENDS = "perl-modules"
+RDEPENDS_${PN} = "perl-module-text-wrap perl-module-re"
+RRECOMMENDS_${PN} = "perl-modules"
 
 PR = "${INC_PR}.0"
 
diff --git a/recipes/intone-video/intone-video_svn.bb b/recipes/intone-video/intone-video_svn.bb
index 352a1f5..8acc7b9 100644
--- a/recipes/intone-video/intone-video_svn.bb
+++ b/recipes/intone-video/intone-video_svn.bb
@@ -4,7 +4,7 @@ AUTHOR = "cchandel"
 LICENSE = "GPLv2"
 SECTION = "e/apps"
 DEPENDS = "elementary eina sqlite3 edbus"
-RDEPENDS = "mplayer lame libxv libsdl-x11"
+RDEPENDS_${PN} = "mplayer lame libxv libsdl-x11"
 
 SRCREV = "12"
 PV = "0.13+svnr${SRCPV}"
diff --git a/recipes/intone/intone_svn.bb b/recipes/intone/intone_svn.bb
index d1561f3..bbd1c9f 100644
--- a/recipes/intone/intone_svn.bb
+++ b/recipes/intone/intone_svn.bb
@@ -4,7 +4,7 @@ AUTHOR = "cchandel"
 LICENSE = "GPLv2"
 SECTION = "e/apps"
 DEPENDS = "elementary eina sqlite3 edbus libvorbis id3lib"
-RDEPENDS = "mplayer lame libxv libsdl-x11"
+RDEPENDS_${PN} = "mplayer lame libxv libsdl-x11"
 
 SRCREV = "76"
 PV = "0.66+svnr${SRCPV}"
diff --git a/recipes/iotop/iotop_0.2.1.bb b/recipes/iotop/iotop_0.2.1.bb
index 1ffb221..e00d8d8 100644
--- a/recipes/iotop/iotop_0.2.1.bb
+++ b/recipes/iotop/iotop_0.2.1.bb
@@ -2,7 +2,7 @@ HOMEPAGE = "http://guichaz.free.fr/iotop/"
 LICENSE = "GPL"
 PR = "r2"
 
-RDEPENDS = "python-distutils python-curses python-setuptools python-textutils"
+RDEPENDS_${PN} = "python-distutils python-curses python-setuptools python-textutils"
 
 SRC_URI = "http://guichaz.free.fr/iotop/files/${PN}-${PV}.tar.bz2"
 
diff --git a/recipes/ipaq-sleep/ipaq-sleep_0.9.bb b/recipes/ipaq-sleep/ipaq-sleep_0.9.bb
index fa5ab6a..62cff95 100644
--- a/recipes/ipaq-sleep/ipaq-sleep_0.9.bb
+++ b/recipes/ipaq-sleep/ipaq-sleep_0.9.bb
@@ -3,7 +3,7 @@ SECTION = "x11/base"
 LICENSE = "GPL"
 DEPENDS = "apmd virtual/xserver libxext virtual/libx11 libxau xscrnsaverh libxss"
 DISTRO_APM ?= "apm"
-RDEPENDS = "${DISTRO_APM}"
+RDEPENDS_${PN} = "${DISTRO_APM}"
 PR = "r7"
 
 inherit gpe pkgconfig
diff --git a/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
index 758814f..2ae1d5c 100644
--- a/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
+++ b/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
@@ -1,6 +1,6 @@
 require ipkg-utils_${PV}.bb
 
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 PR = "r21"
 
 inherit native
diff --git a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
index 98b0cf7..bc3ea7f 100644
--- a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
+++ b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
 CONFLICTS = "ipkg-link"
-RDEPENDS = "python"
+RDEPENDS_${PN} = "python"
 SRCDATE = "20050930"
 PR = "r24"
 
diff --git a/recipes/iptables/iptables.inc b/recipes/iptables/iptables.inc
index b2daf48..a86ae85 100644
--- a/recipes/iptables/iptables.inc
+++ b/recipes/iptables/iptables.inc
@@ -15,7 +15,7 @@ RPROVIDES_${PN} += "iptables-utils"
 FILES_${PN}-dbg += "${libexecdir}/xtables/.debug"
 FILES_${PN}-doc += "${mandir}"
 
-RRECOMMENDS = "\
+RRECOMMENDS_${PN} = "\
   kernel-module-ip-tables \
   kernel-module-iptable-nat \
   kernel-module-iptable-filter \
diff --git a/recipes/ipython/ipython_0.10.bb b/recipes/ipython/ipython_0.10.bb
index cd3928b..43891dc 100644
--- a/recipes/ipython/ipython_0.10.bb
+++ b/recipes/ipython/ipython_0.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://ipython.scipy.org/moin/"
 SECTION = "devel/python"
 LICENSE = "BSD"
 DEPENDS = "less"
-RDEPENDS = "python-pprint python-io python-shell python-misc python-lang \
+RDEPENDS_${PN} = "python-pprint python-io python-shell python-misc python-lang \
             python-stringold python-codecs python-crypt python-threading \
             python-pydoc python-debugger python-textutils python-pickle \
             python-subprocess"
diff --git a/recipes/ipython/ipython_0.9.1.bb b/recipes/ipython/ipython_0.9.1.bb
index 793563e..07ce4bc 100644
--- a/recipes/ipython/ipython_0.9.1.bb
+++ b/recipes/ipython/ipython_0.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://ipython.scipy.org/moin/"
 SECTION = "devel/python"
 LICENSE = "BSD"
 DEPENDS = "less"
-RDEPENDS = "python-pprint python-io python-shell python-misc python-lang \
+RDEPENDS_${PN} = "python-pprint python-io python-shell python-misc python-lang \
             python-stringold python-codecs python-crypt python-threading \
             python-pydoc python-debugger python-textutils python-pickle \
             python-subprocess"
diff --git a/recipes/iscsi-target/iscsi-target_0.4.17.bb b/recipes/iscsi-target/iscsi-target_0.4.17.bb
index 1e12338..d237b51 100644
--- a/recipes/iscsi-target/iscsi-target_0.4.17.bb
+++ b/recipes/iscsi-target/iscsi-target_0.4.17.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/iscsitarget/iscsitarget-${PV}.tar.gz \
 S = "${WORKDIR}/iscsitarget-${PV}"
 
 DEPENDS = "openssl"
-RRECOMMENDS = "kernel-module-crc32c kernel-module-libcrc32c"
+RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
 
 inherit module
 
diff --git a/recipes/iscsi-target/iscsi-target_1.4.19.bb b/recipes/iscsi-target/iscsi-target_1.4.19.bb
index ff38f15..cf6e6a9 100644
--- a/recipes/iscsi-target/iscsi-target_1.4.19.bb
+++ b/recipes/iscsi-target/iscsi-target_1.4.19.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/iscsitarget-${PV}"
 
 
 DEPENDS = "openssl"
-RRECOMMENDS = "kernel-module-crc32c kernel-module-libcrc32c"
+RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
 
 inherit module
 
diff --git a/recipes/iscsi-target/iscsi-target_svn.bb b/recipes/iscsi-target/iscsi-target_svn.bb
index 289d025..c5e51a6 100644
--- a/recipes/iscsi-target/iscsi-target_svn.bb
+++ b/recipes/iscsi-target/iscsi-target_svn.bb
@@ -12,7 +12,7 @@ SRC_URI = "svn://svn.berlios.de/iscsitarget/;module=trunk;rev=HEAD \
 		"
 
 DEPENDS = " openssl"
-RRECOMMENDS = "kernel-module-crc32c kernel-module-libcrc32c"
+RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
 
 S = "${WORKDIR}/trunk"
 
diff --git a/recipes/ivman/ivman_0.6.14.bb b/recipes/ivman/ivman_0.6.14.bb
index 72ec23d..cc87eee 100644
--- a/recipes/ivman/ivman_0.6.14.bb
+++ b/recipes/ivman/ivman_0.6.14.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 PR = "r1"
 
 DEPENDS = "hal libxml2"
-RDEPENDS = "hal pmount-hal"
+RDEPENDS_${PN} = "hal pmount-hal"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ivman/${P}.tar.bz2 \
            file://ivman-0.6-hotpluggable.patch \
diff --git a/recipes/jaaa/clxclient_3.6.1.bb b/recipes/jaaa/clxclient_3.6.1.bb
index 9f2ed50..42000ae 100644
--- a/recipes/jaaa/clxclient_3.6.1.bb
+++ b/recipes/jaaa/clxclient_3.6.1.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL"
 PR = "r0"
 
 DEPENDS = "libx11 clthreads freetype libxft"
-RDEPENDS = "libx11-locale"
+RDEPENDS_${PN} = "libx11-locale"
 
 SRC_URI = "http://www.kokkinizita.net/linuxaudio/downloads/clxclient-${PV}.tar.bz2 \
 	file://clxclient-Makefile.patch \
diff --git a/recipes/jakarta-commons/commons-beanutils_1.8.0.bb b/recipes/jakarta-commons/commons-beanutils_1.8.0.bb
index 915ab17..500937d 100644
--- a/recipes/jakarta-commons/commons-beanutils_1.8.0.bb
+++ b/recipes/jakarta-commons/commons-beanutils_1.8.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Static utility methods useful in manipulating Java classes that c
 SRC_URI = "http://www.apache.org/dist/commons/beanutils/source/${BP}-src.tar.gz"
 
 DEPENDS += "commons-collections3 commons-logging"
-RDEPENDS = "libcommons-collections3-java libcommons-logging-java"
+RDEPENDS_${PN} = "libcommons-collections3-java libcommons-logging-java"
 
 CP = "commons-collections3 commons-logging"
 
diff --git a/recipes/jakarta-commons/commons-configuration_1.5.bb b/recipes/jakarta-commons/commons-configuration_1.5.bb
index edba5ad..00c98b9 100644
--- a/recipes/jakarta-commons/commons-configuration_1.5.bb
+++ b/recipes/jakarta-commons/commons-configuration_1.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
 "
 
 DEPENDS += "commons-logging commons-collections3 commons-beanutils commons-codec commons-digester commons-jxpath commons-lang servlet2.4"
-RDEPENDS = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libcommons-codec-java libcommons-digester-java libcommons-jxpath-java libcommons-lang-java libservlet2.4-java"
+RDEPENDS_${PN} = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libcommons-codec-java libcommons-digester-java libcommons-jxpath-java libcommons-lang-java libservlet2.4-java"
 
 CP = "commons-logging commons-collections3 commons-beanutils commons-codec commons-digester commons-jxpath commons-lang servlet-api-2.4"
 
diff --git a/recipes/jakarta-commons/commons-digester_1.8.bb b/recipes/jakarta-commons/commons-digester_1.8.bb
index 2b39b9c..feb0786 100644
--- a/recipes/jakarta-commons/commons-digester_1.8.bb
+++ b/recipes/jakarta-commons/commons-digester_1.8.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Converts XML to a Java object by a set of mapping rules."
 SRC_URI = "http://www.apache.org/dist/commons/digester/source/${BP}-src.tar.gz"
 
 DEPENDS += "commons-logging commons-beanutils"
-RDEPENDS = "libcommons-logging-java libcommons-beanutils-java"
+RDEPENDS_${PN} = "libcommons-logging-java libcommons-beanutils-java"
 
 CP = "commons-logging commons-beanutils"
 
diff --git a/recipes/jakarta-commons/commons-discovery_0.4.bb b/recipes/jakarta-commons/commons-discovery_0.4.bb
index 9c31f28..0de4c5c 100644
--- a/recipes/jakarta-commons/commons-discovery_0.4.bb
+++ b/recipes/jakarta-commons/commons-discovery_0.4.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "discovering, or finding, implementations for pluggable interfaces
 SRC_URI = "http://www.apache.org/dist/commons/discovery/source/${BP}-src.tar.gz"
 
 DEPENDS += "commons-logging"
-RDEPENDS = "libcommons-logging-java"
+RDEPENDS_${PN} = "libcommons-logging-java"
 
 CP = "commons-logging"
 
diff --git a/recipes/jakarta-commons/commons-el_1.0.bb b/recipes/jakarta-commons/commons-el_1.0.bb
index 46a83b8..3ba21ee 100644
--- a/recipes/jakarta-commons/commons-el_1.0.bb
+++ b/recipes/jakarta-commons/commons-el_1.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Implementation of the JSP2.0 Expression Language API"
 SRC_URI = "http://www.apache.org/dist/commons/el/source/${BP}-src.tar.gz"
 
 DEPENDS += "jsp2.0 servlet2.4"
-RDEPENDS = "libjsp2.0-java libservlet2.4-java"
+RDEPENDS_${PN} = "libjsp2.0-java libservlet2.4-java"
 
 CP = "jsp-api-2.0 servlet-api-2.4"
 
diff --git a/recipes/jakarta-commons/commons-fileupload_1.2.1.bb b/recipes/jakarta-commons/commons-fileupload_1.2.1.bb
index dc59dae..34ff2c1 100644
--- a/recipes/jakarta-commons/commons-fileupload_1.2.1.bb
+++ b/recipes/jakarta-commons/commons-fileupload_1.2.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Robust, high-performance, file upload capability for Java servlet
 SRC_URI = "http://www.apache.org/dist/commons/fileupload/source/${BP}-src.tar.gz"
 
 DEPENDS += "commons-beanutils commons-io servlet2.3"
-RDEPENDS = "libcommons-beanutils-java libcommons-io-java libservlet2.3-java"
+RDEPENDS_${PN} = "libcommons-beanutils-java libcommons-io-java libservlet2.3-java"
 
 CP = "commons-beanutils commons-io servlet-2.3"
 
diff --git a/recipes/jakarta-commons/commons-httpclient_3.1.bb b/recipes/jakarta-commons/commons-httpclient_3.1.bb
index 5e23f58..64f80f6 100644
--- a/recipes/jakarta-commons/commons-httpclient_3.1.bb
+++ b/recipes/jakarta-commons/commons-httpclient_3.1.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://www.apache.org/dist/httpcomponents/commons-httpclient/source/$
 S = "${WORKDIR}/${BP}"
 
 DEPENDS += "commons-logging commons-codec"
-RDEPENDS = "libcommons-logging-java libcommons-codec-java"
+RDEPENDS_${PN} = "libcommons-logging-java libcommons-codec-java"
 
 CP = "commons-logging commons-codec"
 
diff --git a/recipes/jakarta-commons/commons-jxpath_1.3.bb b/recipes/jakarta-commons/commons-jxpath_1.3.bb
index be76d00..9e612b2 100644
--- a/recipes/jakarta-commons/commons-jxpath_1.3.bb
+++ b/recipes/jakarta-commons/commons-jxpath_1.3.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "JXPath interpreter for Java"
 SRC_URI = "http://www.apache.org/dist/commons/jxpath/source/${BP}-src.tar.gz"
 
 DEPENDS += "commons-logging commons-collections3 commons-beanutils servlet2.3 jdom"
-RDEPENDS = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libservlet2.3-java libjdom-java"
+RDEPENDS_${PN} = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libservlet2.3-java libjdom-java"
 
 CP = "commons-logging commons-collections3 commons-beanutils servlet-2.3 jdom"
 
diff --git a/recipes/jakarta-commons/commons-net-native_1.4.1.bb b/recipes/jakarta-commons/commons-net-native_1.4.1.bb
index f1d39ea..d2a4b7d 100644
--- a/recipes/jakarta-commons/commons-net-native_1.4.1.bb
+++ b/recipes/jakarta-commons/commons-net-native_1.4.1.bb
@@ -3,5 +3,5 @@ require commons-net_${PV}.bb
 inherit java-native 
 
 DEPENDS = "fastjar-native oro-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
diff --git a/recipes/jakarta-commons/commons-net_1.4.1.bb b/recipes/jakarta-commons/commons-net_1.4.1.bb
index a5c6477..8790449 100644
--- a/recipes/jakarta-commons/commons-net_1.4.1.bb
+++ b/recipes/jakarta-commons/commons-net_1.4.1.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://www.apache.org/dist/commons/net/source/${BP}-src.tar.gz"
 S = "${WORKDIR}/${BP}"
 
 DEPENDS += "oro"
-RDEPENDS = "liboro-java"
+RDEPENDS_${PN} = "liboro-java"
 
 CP = "oro"
 
diff --git a/recipes/jamvm/jamvm-native.inc b/recipes/jamvm/jamvm-native.inc
index ff2dba6..97c17c4 100644
--- a/recipes/jamvm/jamvm-native.inc
+++ b/recipes/jamvm/jamvm-native.inc
@@ -1,7 +1,7 @@
 require jamvm.inc 
 
 DEPENDS = "zlib-native classpath-native ecj-initial"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 PROVIDES = "virtual/java-native"
 
diff --git a/recipes/jamvm/jamvm.inc b/recipes/jamvm/jamvm.inc
index 428e6b2..eabed08 100644
--- a/recipes/jamvm/jamvm.inc
+++ b/recipes/jamvm/jamvm.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://jamvm.sourceforge.net/"
 LICENSE = "GPL"
 
 DEPENDS = "zlib classpath virtual/javac-native"
-RDEPENDS = "classpath"
+RDEPENDS_${PN} = "classpath"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz"
 
diff --git a/recipes/jards/jards_1.0.bb b/recipes/jards/jards_1.0.bb
index 82dd605..436cec3 100644
--- a/recipes/jards/jards_1.0.bb
+++ b/recipes/jards/jards_1.0.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "http://gakusei.sf.net"
 SECTION = "opie/applications"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "virtual-japanese-font qte-mt libpng (>= 1) kpengine"
+RDEPENDS_${PN} = "virtual-japanese-font qte-mt libpng (>= 1) kpengine"
 PR = "r8"
 
 #  stuff that still needs fixing
-#) is the RDEPENDS line correct and sufficient?
+#) is the RDEPENDS_${PN} line correct and sufficient?
 #) upon execution there is a message that /usr/lib/libpng12.so.0 does not have version information
 #) desktop icon missing
 #) Desktop png file an falscher Stelle, daher kein Icon
diff --git a/recipes/jcraft/jsch-native_0.1.40.bb b/recipes/jcraft/jsch-native_0.1.40.bb
index a93fa76..7faf023 100644
--- a/recipes/jcraft/jsch-native_0.1.40.bb
+++ b/recipes/jcraft/jsch-native_0.1.40.bb
@@ -5,4 +5,4 @@ S = "${WORKDIR}/jsch-${PV}"
 inherit java-native
 
 DEPENDS = "fastjar-native jzlib-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
diff --git a/recipes/jcraft/jsch_0.1.40.bb b/recipes/jcraft/jsch_0.1.40.bb
index 469f7d7..a041a4d 100644
--- a/recipes/jcraft/jsch_0.1.40.bb
+++ b/recipes/jcraft/jsch_0.1.40.bb
@@ -8,7 +8,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/jsch/jsch-${PV}.zip"
 inherit java-library
 
 DEPENDS = "fastjar-native jzlib"
-RDEPENDS = "libjzlib-java"
+RDEPENDS_${PN} = "libjzlib-java"
 
 do_compile() {
   mkdir -p build
diff --git a/recipes/jikes/jikes_1.22.bb b/recipes/jikes/jikes_1.22.bb
index 62bb40f..8c1a16e 100644
--- a/recipes/jikes/jikes_1.22.bb
+++ b/recipes/jikes/jikes_1.22.bb
@@ -5,7 +5,7 @@ SECTION = "devel"
 LICENSE = "IBM"
 PR = "r1"
 
-RDEPENDS = "classpath"
+RDEPENDS_${PN} = "classpath"
 PROVIDES_virtclass-native = ""
 RDEPENDS_virtclass-native = ""
 
diff --git a/recipes/jlex/jlex-native_1.2.6.bb b/recipes/jlex/jlex-native_1.2.6.bb
index 305a729..1d0ea52 100644
--- a/recipes/jlex/jlex-native_1.2.6.bb
+++ b/recipes/jlex/jlex-native_1.2.6.bb
@@ -3,7 +3,7 @@ require jlex_${PV}.bb
 inherit java-native
 
 DEPENDS += "virtual/java-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 do_configure() {
   sed -i \
diff --git a/recipes/jlex/jlex_1.2.6.bb b/recipes/jlex/jlex_1.2.6.bb
index ba8d8e7..65a6e9a 100644
--- a/recipes/jlex/jlex_1.2.6.bb
+++ b/recipes/jlex/jlex_1.2.6.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Lexical analyzer generator for Java"
 AUTHOR = "Elliot Berk, A. Appel, C. Scott Ananian"
 
 DEPENDS = "fastjar-native"
-RDEPENDS = "java2-runtime"
+RDEPENDS_${PN} = "java2-runtime"
 
 inherit java-library
 
diff --git a/recipes/julius/ti-julius-demo_r962.bb b/recipes/julius/ti-julius-demo_r962.bb
index 084f269..c9d96a2 100644
--- a/recipes/julius/ti-julius-demo_r962.bb
+++ b/recipes/julius/ti-julius-demo_r962.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "TI speech recognizer demo"
 LICENSE = "GPL"
 
-RDEPENDS = "julius"
+RDEPENDS_${PN} = "julius"
 PACKAGE_ARCH = "all"
 
 SRC_URI = "http://dominion.thruhere.net/koen/OE/ecas-julius_acousticfiles.${PV}.tar.gz"
diff --git a/recipes/kernbench/kernbench_0.41.bb b/recipes/kernbench/kernbench_0.41.bb
index 840d263..175b5a4 100644
--- a/recipes/kernbench/kernbench_0.41.bb
+++ b/recipes/kernbench/kernbench_0.41.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "cpu throughput benchmark"
 HOMEPAGE = "http://kernbench.kolivas.org/"
 LICENSE = "GPL"
-RDEPENDS = "time"
+RDEPENDS_${PN} = "time"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/people/ck/apps/kernbench/kernbench-${PV}.tar.bz2"
 
diff --git a/recipes/keylaunch/keylaunch_2.0.10.bb b/recipes/keylaunch/keylaunch_2.0.10.bb
index 0ea3247..01df39c 100644
--- a/recipes/keylaunch/keylaunch_2.0.10.bb
+++ b/recipes/keylaunch/keylaunch_2.0.10.bb
@@ -1,7 +1,7 @@
 inherit gpe
 
 DEPENDS = "virtual/xserver libxtst libxau libxpm libgpelaunch keylaunch-conf"
-RDEPENDS = "keylaunch-conf"
+RDEPENDS_${PN} = "keylaunch-conf"
 
 SECTION = "gpe"
 LICENSE = "GPL"
diff --git a/recipes/knights/knights_1.14.bb b/recipes/knights/knights_1.14.bb
index 4e64a63..119e80c 100644
--- a/recipes/knights/knights_1.14.bb
+++ b/recipes/knights/knights_1.14.bb
@@ -4,7 +4,7 @@ SECTION = "opie/games"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "phalanx"
-RDEPENDS = "phalanx"
+RDEPENDS_${PN} = "phalanx"
 PR = "r2"
 
 SRC_URI = "http://www.openzaurus.org/mirror/knights.tar.gz \
diff --git a/recipes/kxml2/kxml2_2.3.0.bb b/recipes/kxml2/kxml2_2.3.0.bb
index e91a8ad..6d43597 100644
--- a/recipes/kxml2/kxml2_2.3.0.bb
+++ b/recipes/kxml2/kxml2_2.3.0.bb
@@ -8,7 +8,7 @@ PR = "r1"
 inherit java-library
 
 DEPENDS = "xmlpull"
-RDEPENDS = "libxmlpull-java"
+RDEPENDS_${PN} = "libxmlpull-java"
 
 S = "${WORKDIR}"
 
diff --git a/recipes/libgpewidget/libgpewidget-hildon_0.102.bb b/recipes/libgpewidget/libgpewidget-hildon_0.102.bb
index b0f5bc7..fad3c5e 100644
--- a/recipes/libgpewidget/libgpewidget-hildon_0.102.bb
+++ b/recipes/libgpewidget/libgpewidget-hildon_0.102.bb
@@ -20,7 +20,7 @@ do_stage () {
 	autotools_stage_includes
 }
 
-RDEPENDS = "sdk-default-icons"
+RDEPENDS_${PN} = "sdk-default-icons"
 RPROVIDES = "libgpewidget"
 
 SRC_URI[md5sum] = "9eb90850adf65ec0d0ff26833f7cb8c6"
diff --git a/recipes/libgpewidget/libgpewidget_0.115.bb b/recipes/libgpewidget/libgpewidget_0.115.bb
index d60cc0f..877aa41 100644
--- a/recipes/libgpewidget/libgpewidget_0.115.bb
+++ b/recipes/libgpewidget/libgpewidget_0.115.bb
@@ -20,7 +20,7 @@ do_stage () {
 
 PACKAGES =+ "libgpewidget-bin"
 FILES_libgpewidget-bin = "${bindir}/*"
-RRECOMMENDS = "gpe-icons"
+RRECOMMENDS_${PN} = "gpe-icons"
 
 SRC_URI[md5sum] = "88d53855c41fa7713263e913871a5fcc"
 SRC_URI[sha256sum] = "ebbbc25a27587c21ed640b5d87b7c7783f4820c59c22f7b07e29e2306f1bbd65"
diff --git a/recipes/libopieobex/libopieobex0.inc b/recipes/libopieobex/libopieobex0.inc
index 3fe3d53..507fa8e 100644
--- a/recipes/libopieobex/libopieobex0.inc
+++ b/recipes/libopieobex/libopieobex0.inc
@@ -3,7 +3,7 @@ SECTION = "opie/libs"
 PRIORITY = "optional"
 LICENSE = "LGPL"
 DEPENDS = "libopietooth1 opie-taskbar openobex-apps"
-RDEPENDS = "openobex-apps"
+RDEPENDS_${PN} = "openobex-apps"
 APPNAME = "obex"
 
 S = "${WORKDIR}/obex"
diff --git a/recipes/linux/linux-mtx-1_2.4.27.bb b/recipes/linux/linux-mtx-1_2.4.27.bb
index 3927520..d43fa74 100644
--- a/recipes/linux/linux-mtx-1_2.4.27.bb
+++ b/recipes/linux/linux-mtx-1_2.4.27.bb
@@ -6,7 +6,7 @@ PR = "r11"
 inherit module-base kernel
 
 PROVIDES = "virtual/kernel"
-RDEPENDS = "mtd-utils"
+RDEPENDS_${PN} = "mtd-utils"
 
 SRC_URI = "cvs://cvs:cvs@ftp.linux-mips.org/home/cvs;module=linux;tag=linux_2_4_27 \
 	file://01-mtd-2004-01-27.diff \
diff --git a/recipes/linux/linux-mtx-2_2.4.27.bb b/recipes/linux/linux-mtx-2_2.4.27.bb
index 90a0dff..e919577 100644
--- a/recipes/linux/linux-mtx-2_2.4.27.bb
+++ b/recipes/linux/linux-mtx-2_2.4.27.bb
@@ -6,7 +6,7 @@ PR = "r11"
 inherit module-base kernel
 
 PROVIDES = "virtual/kernel"
-RDEPENDS = "mtd-utils"
+RDEPENDS_${PN} = "mtd-utils"
 
 SRC_URI += "cvs://cvs:cvs@ftp.linux-mips.org/home/cvs;module=linux;tag=linux_2_4_27 \
 	file://00-mtx-2.diff \
diff --git a/recipes/linux/linux-mtx-3_2.6.15.4.bb b/recipes/linux/linux-mtx-3_2.6.15.4.bb
index 772e573..1f831f4 100644
--- a/recipes/linux/linux-mtx-3_2.6.15.4.bb
+++ b/recipes/linux/linux-mtx-3_2.6.15.4.bb
@@ -9,7 +9,7 @@ inherit kernel
 # PROVIDES = "virtual/kernel"
 
 DEPENDS = "u-boot"
-RDEPENDS = "mtd-utils"
+RDEPENDS_${PN} = "mtd-utils"
 
 SRC_URI += "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${KV}.tar.bz2;name=kernel \
 	file://00-mtx-3.diff \
diff --git a/recipes/linux/linux-mtx-3_2.6.15.bb b/recipes/linux/linux-mtx-3_2.6.15.bb
index 1fc44f4..af2934d 100644
--- a/recipes/linux/linux-mtx-3_2.6.15.bb
+++ b/recipes/linux/linux-mtx-3_2.6.15.bb
@@ -6,7 +6,7 @@ PR = "r11"
 inherit module-base kernel
 
 PROVIDES = "virtual/kernel"
-RDEPENDS = "mtd-utils"
+RDEPENDS_${PN} = "mtd-utils"
 
 SRC_URI += "cvs://cvs:cvs@ftp.linux-mips.org/home/cvs;module=linux;tag=linux_2_6_15 \
 	file://defconfig-mtx-3"
diff --git a/recipes/linux/linux-sgh-i900_2.6.32.bb b/recipes/linux/linux-sgh-i900_2.6.32.bb
index f45da3f..c9c31a9 100644
--- a/recipes/linux/linux-sgh-i900_2.6.32.bb
+++ b/recipes/linux/linux-sgh-i900_2.6.32.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Linux 2.6.32 kernel for the Samsung Omnia SGH-i900."
 SECTION = "kernel"
 LICENSE = "GPLv2"
 
-RDEPENDS += "marvell-gspi-fw"
+RDEPENDS_${PN} += "marvell-gspi-fw"
 
 COMPATIBLE_MACHINE = "sgh-i900"
 
diff --git a/recipes/lirc/lirc_0.8.0.bb b/recipes/lirc/lirc_0.8.0.bb
index 2d66459..2d91582 100644
--- a/recipes/lirc/lirc_0.8.0.bb
+++ b/recipes/lirc/lirc_0.8.0.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.lirc.org"
 LICENSE = "GPL"
 DEPENDS = "virtual/kernel virtual/libx11 libxau libsm libice"
 DEPENDS_nslu2 = "virtual/kernel lirc-modules"
-RDEPENDS = "lirc-modules"
+RDEPENDS_${PN} = "lirc-modules"
 RDEPENDS_lirc-x = "lirc"
 RDEPENDS_lirc-exec = "lirc"
 RDEPENDS_lirc-nslu2example = "lirc lirc-exec"
diff --git a/recipes/lirc/lirc_0.8.1+cvs20070307.bb b/recipes/lirc/lirc_0.8.1+cvs20070307.bb
index cf484b6..1ab8878 100644
--- a/recipes/lirc/lirc_0.8.1+cvs20070307.bb
+++ b/recipes/lirc/lirc_0.8.1+cvs20070307.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.lirc.org"
 LICENSE = "GPL"
 DEPENDS = "virtual/kernel virtual/libx11 libxau libsm libice"
 DEPENDS_nslu2 = "virtual/kernel lirc-modules"
-RDEPENDS = "lirc-modules"
+RDEPENDS_${PN} = "lirc-modules"
 RDEPENDS_lirc-x = "lirc"
 RDEPENDS_lirc-exec = "lirc"
 RDEPENDS_lirc-nslu2example = "lirc lirc-exec"
diff --git a/recipes/lirc/lirc_0.8.4a.bb b/recipes/lirc/lirc_0.8.4a.bb
index 8fea68c..d7f9947 100644
--- a/recipes/lirc/lirc_0.8.4a.bb
+++ b/recipes/lirc/lirc_0.8.4a.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.lirc.org"
 LICENSE = "GPL"
 DEPENDS = "virtual/kernel virtual/libx11 libxau libsm libice"
 DEPENDS_nslu2 = "virtual/kernel lirc-modules"
-RDEPENDS = "lirc-modules"
+RDEPENDS_${PN} = "lirc-modules"
 RDEPENDS_lirc-x = "lirc"
 RDEPENDS_lirc-exec = "lirc"
 RDEPENDS_lirc-nslu2example = "lirc lirc-exec"
diff --git a/recipes/lirc/lirc_0.8.5.bb b/recipes/lirc/lirc_0.8.5.bb
index 9181fa1..f0a254e 100644
--- a/recipes/lirc/lirc_0.8.5.bb
+++ b/recipes/lirc/lirc_0.8.5.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.lirc.org"
 LICENSE = "GPL"
 DEPENDS = "virtual/kernel virtual/libx11 libxau libsm libice"
 DEPENDS_nslu2 = "virtual/kernel lirc-modules"
-RDEPENDS = "lirc-modules"
+RDEPENDS_${PN} = "lirc-modules"
 RDEPENDS_lirc-x = "lirc"
 RDEPENDS_lirc-exec = "lirc"
 RDEPENDS_lirc-nslu2example = "lirc lirc-exec"
diff --git a/recipes/litephone/litephone.inc b/recipes/litephone/litephone.inc
index e2ca8ca..06739ca 100644
--- a/recipes/litephone/litephone.inc
+++ b/recipes/litephone/litephone.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.litephone.org"
 SECTION = "x11/applications"
 PRIORITY = "optional"
 LICENSE = "GPL QPL"
-RRECOMMENDS = "fsodeviced fsogsmd fsousaged frameworkd"
+RRECOMMENDS_${PN} = "fsodeviced fsogsmd fsousaged frameworkd"
 INC_PR = "r0"
 
 inherit qt4x11
diff --git a/recipes/lmbench/lmbench_2.0.4.bb b/recipes/lmbench/lmbench_2.0.4.bb
index bb852ab..274764b 100644
--- a/recipes/lmbench/lmbench_2.0.4.bb
+++ b/recipes/lmbench/lmbench_2.0.4.bb
@@ -1,7 +1,7 @@
 SECTION = "console/utils"
 DESCRIPTION = "Tools for performance analysis."
 LICENSE = "GPL"
-RDEPENDS = "debianutils"
+RDEPENDS_${PN} = "debianutils"
 PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
diff --git a/recipes/lmbench/lmbench_2.5.bb b/recipes/lmbench/lmbench_2.5.bb
index 3692daf..6532198 100644
--- a/recipes/lmbench/lmbench_2.5.bb
+++ b/recipes/lmbench/lmbench_2.5.bb
@@ -1,7 +1,7 @@
 SECTION = "console/utils"
 DESCRIPTION = "Tools for performance analysis."
 LICENSE = "GPL"
-RDEPENDS = "debianutils"
+RDEPENDS_${PN} = "debianutils"
 PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
diff --git a/recipes/logic-analyzer/logic-analyzer_0.8.bb b/recipes/logic-analyzer/logic-analyzer_0.8.bb
index 4c4011c..dedc6f2 100644
--- a/recipes/logic-analyzer/logic-analyzer_0.8.bb
+++ b/recipes/logic-analyzer/logic-analyzer_0.8.bb
@@ -7,7 +7,7 @@ PR = "r2"
 inherit java
 
 DEPENDS = "rxtx"
-RDEPENDS = "java2-runtime classpath-awt librxtx-java"
+RDEPENDS_${PN} = "java2-runtime classpath-awt librxtx-java"
 
 SRC_URI = "\
     http://sump.org/projects/analyzer/downloads/la-src-${PV}.tar.bz2 \
diff --git a/recipes/logrotate-script/logrotate-script_cvs.bb b/recipes/logrotate-script/logrotate-script_cvs.bb
index 2c6fd90..89f7108 100644
--- a/recipes/logrotate-script/logrotate-script_cvs.bb
+++ b/recipes/logrotate-script/logrotate-script_cvs.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "simple logrotate bash script"
-RDEPENDS = "busybox"
+RDEPENDS_${PN} = "busybox"
 SECTION = "admin"
 PRIORITY = "optional"
 LICENSE = "GPL"
diff --git a/recipes/logrotate/logrotate_3.7.1.bb b/recipes/logrotate/logrotate_3.7.1.bb
index cc57b90..6e129ef 100644
--- a/recipes/logrotate/logrotate_3.7.1.bb
+++ b/recipes/logrotate/logrotate_3.7.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Rotates, compresses, removes and mails system log files"
 HOMEPAGE = "http://packages.debian.org/unstable/admin/logrotate"
 RCONFLICTS = "logrotate-script"
 DEPENDS = "popt"
-RDEPENDS = "cron"
+RDEPENDS_${PN} = "cron"
 SECTION = "admin"
 LICENSE = "GPL"
 PR = "r2"
diff --git a/recipes/lua/lua-gtk2_0.3.bb b/recipes/lua/lua-gtk2_0.3.bb
index 268398c..d2ac46c 100644
--- a/recipes/lua/lua-gtk2_0.3.bb
+++ b/recipes/lua/lua-gtk2_0.3.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
 DEPENDS = "gtk+ lua-native perl-native readline libffi"
-RDEPENDS = "lua"
+RDEPENDS_${PN} = "lua"
 
 inherit gpe
 
diff --git a/recipes/lxde/lxpanel_0.3.99.bb b/recipes/lxde/lxpanel_0.3.99.bb
index f44692a..9330f77 100644
--- a/recipes/lxde/lxpanel_0.3.99.bb
+++ b/recipes/lxde/lxpanel_0.3.99.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "LXDE Panel"
 SECTION = "x11"
 DEPENDS = "menu-cache"
-RDEPENDS = "lxmenu-data"
+RDEPENDS_${PN} = "lxmenu-data"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/${PN}-${PV}.tar.gz"
 
diff --git a/recipes/lyx/lyx_1.6.1.bb b/recipes/lyx/lyx_1.6.1.bb
index 9c4ac08..eb7200a 100644
--- a/recipes/lyx/lyx_1.6.1.bb
+++ b/recipes/lyx/lyx_1.6.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 HOMEPAGE = "http://www.lyx.org"
 DEPENDS = "qt4-x11-free"
 RSUGGESTS = "tetex"
-RDEPENDS = "python-shell python-textutils"
+RDEPENDS_${PN} = "python-shell python-textutils"
 PR = "r0"
 
 SRC_URI = "\
diff --git a/recipes/lyx/lyx_1.6.4.1.bb b/recipes/lyx/lyx_1.6.4.1.bb
index 885293f..8163c99 100644
--- a/recipes/lyx/lyx_1.6.4.1.bb
+++ b/recipes/lyx/lyx_1.6.4.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 HOMEPAGE = "http://www.lyx.org"
 DEPENDS = "qt4-x11-free"
 RSUGGESTS = "tetex"
-RDEPENDS = "python-shell python-textutils"
+RDEPENDS_${PN} = "python-shell python-textutils"
 
 SRC_URI = "\
   ftp://ftp.lyx.org/pub/lyx/stable/1.6.x/lyx-${PV}.tar.bz2 \
diff --git a/recipes/madwifi/madwifi-modules_0.9.3.bb b/recipes/madwifi/madwifi-modules_0.9.3.bb
index 5391498..ec94e1b 100644
--- a/recipes/madwifi/madwifi-modules_0.9.3.bb
+++ b/recipes/madwifi/madwifi-modules_0.9.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Linux driver for 802.11a/b/g universal NIC cards using Atheros ch
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "kernel (${KERNEL_VERSION}) wireless-tools (>=27)"
+RDEPENDS_${PN} = "kernel (${KERNEL_VERSION}) wireless-tools (>=27)"
 DEPENDS = "virtual/kernel"
 CONFLICTS = "hostap-daemon (<0.4.8)"
 SRCDATE = "20050803"
diff --git a/recipes/madwifi/madwifi-modules_cvs-bsd.bb b/recipes/madwifi/madwifi-modules_cvs-bsd.bb
index d570816..6916f9d 100644
--- a/recipes/madwifi/madwifi-modules_cvs-bsd.bb
+++ b/recipes/madwifi/madwifi-modules_cvs-bsd.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Linux driver for 802.11a/b/g universal NIC cards using Atheros ch
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "kernel (${KERNEL_VERSION})"
+RDEPENDS_${PN} = "kernel (${KERNEL_VERSION})"
 DEPENDS = "virtual/kernel"
 PV = "1.0.0+cvs${SRCDATE}-bsd"
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/madwifi/madwifi-modules_cvs.bb b/recipes/madwifi/madwifi-modules_cvs.bb
index 2548b8d..e00a614 100644
--- a/recipes/madwifi/madwifi-modules_cvs.bb
+++ b/recipes/madwifi/madwifi-modules_cvs.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Linux driver for 802.11a/b/g universal NIC cards using Atheros ch
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "kernel (${KERNEL_VERSION})"
+RDEPENDS_${PN} = "kernel (${KERNEL_VERSION})"
 DEPENDS = "virtual/kernel"
 SRCDATE = "20060814"
 PV = "1.0.0+cvs${SRCDATE}"
diff --git a/recipes/madwifi/madwifi-ng_r.inc b/recipes/madwifi/madwifi-ng_r.inc
index baab484..6897516 100644
--- a/recipes/madwifi/madwifi-ng_r.inc
+++ b/recipes/madwifi/madwifi-ng_r.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Linux driver for 802.11a/b/g universal NIC cards using Atheros ch
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "kernel (${KERNEL_VERSION})"
+RDEPENDS_${PN} = "kernel (${KERNEL_VERSION})"
 DEPENDS = "virtual/kernel"
 PR ="r6"
 
diff --git a/recipes/maemo-mapper/maemo-mapper-nohildon_svn.bb b/recipes/maemo-mapper/maemo-mapper-nohildon_svn.bb
index 0385263..a54f320 100644
--- a/recipes/maemo-mapper/maemo-mapper-nohildon_svn.bb
+++ b/recipes/maemo-mapper/maemo-mapper-nohildon_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GPS navigation/map display software"
 LICENSE = "GPL"
 DEPENDS = "sqlite3 gtk+ gnome-vfs dbus bluez-libs"
-RDEPENDS = "bluez-utils"
+RDEPENDS_${PN} = "bluez-utils"
 SRCDATE = "20061114"
 PV = "1.2.4+svn${SRCDATE}"
 PR = "r1"
diff --git a/recipes/maemo-mapper/maemo-mapper_svn.bb b/recipes/maemo-mapper/maemo-mapper_svn.bb
index 94fccab..9ee18a1 100644
--- a/recipes/maemo-mapper/maemo-mapper_svn.bb
+++ b/recipes/maemo-mapper/maemo-mapper_svn.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "GPS navigation/map display software"
 LICENSE = "GPL"
 DEPENDS = "gdbm libconic sqlite3 gtk+ libhildonfm libosso osso-ic-oss libosso-help gnome-vfs dbus bluez-libs"
-RDEPENDS = "bluez-utils"
-RRECOMMENDS = "gpsd flite"
+RDEPENDS_${PN} = "bluez-utils"
+RRECOMMENDS_${PN} = "gpsd flite"
 SRCREV = "118"
 PV = "2.0.3+svnr${SRCPV}"
 PR = "r2"
diff --git a/recipes/maemo/osso-application-installer_1.0.03-1.bb b/recipes/maemo/osso-application-installer_1.0.03-1.bb
index 550c8a5..17cb3a2 100644
--- a/recipes/maemo/osso-application-installer_1.0.03-1.bb
+++ b/recipes/maemo/osso-application-installer_1.0.03-1.bb
@@ -2,7 +2,7 @@ PR         = "r0"
 LICENSE    = "GPL"
 
 DEPENDS = "hildon-lgpl hildon-base-lib libosso hildon-libs hildon-control-panel shared-mime-info"
-RDEPENDS = "shared-mime-info"
+RDEPENDS_${PN} = "shared-mime-info"
 
 SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/o/${PN}/${PN}_${PV}.tar.gz \
            file://fix-buildsystem.patch"
diff --git a/recipes/maemo/osso-core-config_200515.1.bb b/recipes/maemo/osso-core-config_200515.1.bb
index 986959b..9329438 100644
--- a/recipes/maemo/osso-core-config_200515.1.bb
+++ b/recipes/maemo/osso-core-config_200515.1.bb
@@ -2,7 +2,7 @@ LICENSE    = "unknown"
 PR         = "r6"
 
 DEPENDS =	"base-passwd osso-af-startup"
-RDEPENDS =	"base-passwd osso-af-startup"
+RDEPENDS_${PN} =	"base-passwd osso-af-startup"
 
 SRC_URI =	"http://stage.maemo.org:80/pool/maemo/ossw/source/o/${PN}/${PN}_${PV}.tar.gz"
 
diff --git a/recipes/maemo/sdk-default-theme-config_1.0-1.bb b/recipes/maemo/sdk-default-theme-config_1.0-1.bb
index 39e88d9..567727d 100644
--- a/recipes/maemo/sdk-default-theme-config_1.0-1.bb
+++ b/recipes/maemo/sdk-default-theme-config_1.0-1.bb
@@ -2,7 +2,7 @@ PR         = "r0"
 LICENSE    = "GPL"
 
 DEPENDS = "sdk-default-theme"
-RDEPENDS = "sdk-default-theme"
+RDEPENDS_${PN} = "sdk-default-theme"
 
 SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/s/${PN}/${PN}_${PV}.tar.gz"
 
diff --git a/recipes/mailx/mailx_8.1.2-0.20050715cvs.bb b/recipes/mailx/mailx_8.1.2-0.20050715cvs.bb
index aad6a7a..4f5d75f 100644
--- a/recipes/mailx/mailx_8.1.2-0.20050715cvs.bb
+++ b/recipes/mailx/mailx_8.1.2-0.20050715cvs.bb
@@ -1,6 +1,6 @@
 SECTION = "console/network"
 DEPENDS = "liblockfile"
-RRECOMMENDS = "ssmtp"
+RRECOMMENDS_${PN} = "ssmtp"
 DESCRIPTION = "mailx is the traditional command-line-mode \
 mail user agent."
 PR = "r0"
diff --git a/recipes/mamona/mamona-sound-n770_0.1.0.bb b/recipes/mamona/mamona-sound-n770_0.1.0.bb
index c0bea6a..5cafb80 100644
--- a/recipes/mamona/mamona-sound-n770_0.1.0.bb
+++ b/recipes/mamona/mamona-sound-n770_0.1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Mamona's sound configuration for Nokia N770"
 HOMEPAGE = "http://dev.openbossa.org/trac/mamona/"
 #SECTION = "console/utils"
 LICENSE = "GPL"
-RDEPENDS = "dspgw-utils udev alsa-lib alsa-utils-alsactl"
+RDEPENDS_${PN} = "dspgw-utils udev alsa-lib alsa-utils-alsactl"
 PR = "r1"
 
 PACKAGES = "${PN}"
diff --git a/recipes/mamona/mamona-sound-n800_0.1.0.bb b/recipes/mamona/mamona-sound-n800_0.1.0.bb
index 0050734..6d7e2e1 100644
--- a/recipes/mamona/mamona-sound-n800_0.1.0.bb
+++ b/recipes/mamona/mamona-sound-n800_0.1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Mamona's sound configuration for Nokia N800"
 HOMEPAGE = "http://dev.openbossa.org/trac/mamona/"
 LICENSE = "GPL"
-RDEPENDS = "dspgw-utils udev alsa-lib alsa-utils-alsactl"
+RDEPENDS_${PN} = "dspgw-utils udev alsa-lib alsa-utils-alsactl"
 PR = "r1"
 
 PACKAGES = "${PN}"
diff --git a/recipes/mamona/udev-usbserial_0.1.bb b/recipes/mamona/udev-usbserial_0.1.bb
index 32e967d..2a6e9d5 100644
--- a/recipes/mamona/udev-usbserial_0.1.bb
+++ b/recipes/mamona/udev-usbserial_0.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Udev rules file to spawn getty in ttyUSB"
 SECTION = "utils"
 LICENSE = "GPL"
-RDEPENDS = "udev"
+RDEPENDS_${PN} = "udev"
 PR = "r1"
 
 PACKAGES = "${PN}"
diff --git a/recipes/mamona/usbnet_0.1.0.bb b/recipes/mamona/usbnet_0.1.0.bb
index 37c4189..8ac122c 100644
--- a/recipes/mamona/usbnet_0.1.0.bb
+++ b/recipes/mamona/usbnet_0.1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "USB Networking"
 HOMEPAGE = "http://dev.openbossa.org/trac/mamona/"
 SECTION = "utils"
 LICENSE = "GPL"
-RDEPENDS = "module-init-tools busybox"
+RDEPENDS_${PN} = "module-init-tools busybox"
 PR = "r1"
 
 PACKAGES = "${PN}"
diff --git a/recipes/man-pages/man-pages_3.21.bb b/recipes/man-pages/man-pages_3.21.bb
index 9904ffd..0605adb 100644
--- a/recipes/man-pages/man-pages_3.21.bb
+++ b/recipes/man-pages/man-pages_3.21.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "base set of man pages"
 LICENSE = "GPL"
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/docs/man-pages/Archive/man-pages-${PV}.tar.bz2"
 PR = "r1"
-RRECOMMENDS = "man"
+RRECOMMENDS_${PN} = "man"
 PACKAGE_ARCH = "all"
 
 EXTRA_OEMAKE = ""
diff --git a/recipes/matchbox-common/matchbox-common_0.9.1.bb b/recipes/matchbox-common/matchbox-common_0.9.1.bb
index b3666b2..fc8b198 100644
--- a/recipes/matchbox-common/matchbox-common_0.9.1.bb
+++ b/recipes/matchbox-common/matchbox-common_0.9.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Matchbox window manager common files"
 SECTION = "x11/wm"
 LICENSE = "GPL"
 DEPENDS = "libmatchbox"
-RDEPENDS += "matchbox-panel"
+RDEPENDS_${PN} += "matchbox-panel"
 PR = "r6"
 
 SRC_URI = "http://projects.o-hand.com/matchbox/sources/${PN}/0.9/${PN}-${PV}.tar.gz \
diff --git a/recipes/matchbox-common/matchbox_0.8.1.bb b/recipes/matchbox-common/matchbox_0.8.1.bb
index 701c2bc..174eccb 100644
--- a/recipes/matchbox-common/matchbox_0.8.1.bb
+++ b/recipes/matchbox-common/matchbox_0.8.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Metapackage for Matchbox suite"
 LICENSE = "GPL"
 DEPENDS = "matchbox-common matchbox-wm matchbox-panel matchbox-desktop"
-RDEPENDS = "matchbox-common matchbox-wm matchbox-panel matchbox-desktop"
+RDEPENDS_${PN} = "matchbox-common matchbox-wm matchbox-panel matchbox-desktop"
 SECTION = "x11/wm"
 PACKAGES= "${PN}"
 ALLOW_EMPTY = "1"
diff --git a/recipes/matchbox-common/matchbox_0.9.1.bb b/recipes/matchbox-common/matchbox_0.9.1.bb
index 0821b03..a1b0f35 100644
--- a/recipes/matchbox-common/matchbox_0.9.1.bb
+++ b/recipes/matchbox-common/matchbox_0.9.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Metapackage for Matchbox suite"
 LICENSE = "GPL"
-RDEPENDS = "matchbox-common matchbox-wm matchbox-panel matchbox-desktop"
+RDEPENDS_${PN} = "matchbox-common matchbox-wm matchbox-panel matchbox-desktop"
 SECTION = "x11/wm"
 PR = "r1"
 
diff --git a/recipes/matchbox-common/matchbox_0.9.bb b/recipes/matchbox-common/matchbox_0.9.bb
index 701c2bc..174eccb 100644
--- a/recipes/matchbox-common/matchbox_0.9.bb
+++ b/recipes/matchbox-common/matchbox_0.9.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Metapackage for Matchbox suite"
 LICENSE = "GPL"
 DEPENDS = "matchbox-common matchbox-wm matchbox-panel matchbox-desktop"
-RDEPENDS = "matchbox-common matchbox-wm matchbox-panel matchbox-desktop"
+RDEPENDS_${PN} = "matchbox-common matchbox-wm matchbox-panel matchbox-desktop"
 SECTION = "x11/wm"
 PACKAGES= "${PN}"
 ALLOW_EMPTY = "1"
diff --git a/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb b/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
index d209414..6c32260 100644
--- a/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
+++ b/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Matchbox GTK+ theme configuration application."
 LICENSE = "GPL"
 DEPENDS = "gconf gtk+"
-RDEPENDS = "settings-daemon"
+RDEPENDS_${PN} = "settings-daemon"
 
 SRCREV = "1614"
 PV = "0.0+svnr${SRCPV}"
diff --git a/recipes/matchbox-desktop/matchbox-desktop_0.9.1.bb b/recipes/matchbox-desktop/matchbox-desktop_0.9.1.bb
index c63a64f..a0ee9fb 100644
--- a/recipes/matchbox-desktop/matchbox-desktop_0.9.1.bb
+++ b/recipes/matchbox-desktop/matchbox-desktop_0.9.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://projects.o-hand.com/matchbox/sources/matchbox-desktop/0.9/matc
            file://pkgconfig_fix.patch \
            file://mb-desktop-multi-category-matching.patch"
 
-RDEPENDS += "matchbox-common"
+RDEPENDS_${PN} += "matchbox-common"
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dnotify"
 
diff --git a/recipes/matchbox-panel/matchbox-panel_0.8.bb b/recipes/matchbox-panel/matchbox-panel_0.8.bb
index 889b926..0a9e57f 100644
--- a/recipes/matchbox-panel/matchbox-panel_0.8.bb
+++ b/recipes/matchbox-panel/matchbox-panel_0.8.bb
@@ -2,7 +2,7 @@ SECTION = "x11/utils"
 DESCRIPTION = "Matchbox panel"
 LICENSE = "GPL"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxpm"
-RDEPENDS = "libmatchbox matchbox-common"
+RDEPENDS_${PN} = "libmatchbox matchbox-common"
 
 SRC_URI = "http://projects.o-hand.com/matchbox/sources/matchbox-panel/${PV}/matchbox-panel-${PV}.tar.bz2"
 S = "${WORKDIR}/matchbox-panel-${PV}"
diff --git a/recipes/matchbox-sato/matchbox-sato_0.1.bb b/recipes/matchbox-sato/matchbox-sato_0.1.bb
index b622f24..9d3fef6 100644
--- a/recipes/matchbox-sato/matchbox-sato_0.1.bb
+++ b/recipes/matchbox-sato/matchbox-sato_0.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Custom MB session files for poky"
 LICENSE = "GPL"
 SECTION = "x11"
-RDEPENDS = "gtk-sato-engine matchbox-theme-sato gtk-theme-sato matchbox-panel-2 matchbox-desktop-sato"
+RDEPENDS_${PN} = "gtk-sato-engine matchbox-theme-sato gtk-theme-sato matchbox-panel-2 matchbox-desktop-sato"
 RCONFLICTS = "matchbox-common"
 PR = "r17"
 
diff --git a/recipes/matchbox-session/matchbox-session.bb b/recipes/matchbox-session/matchbox-session.bb
index c9014f9..9976251 100644
--- a/recipes/matchbox-session/matchbox-session.bb
+++ b/recipes/matchbox-session/matchbox-session.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Matchbox session support"
-RDEPENDS = "matchbox-common"
+RDEPENDS_${PN} = "matchbox-common"
 # they do the same in other way
 RCONFLICTS = "gpe-session-scripts"
 
diff --git a/recipes/matchbox-themes-gtk/matchbox-themes-gtk.bb b/recipes/matchbox-themes-gtk/matchbox-themes-gtk.bb
index 769aeec..0e6645f 100644
--- a/recipes/matchbox-themes-gtk/matchbox-themes-gtk.bb
+++ b/recipes/matchbox-themes-gtk/matchbox-themes-gtk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Gtk2 theme files to accompany default Matchbox themes"
 LICENSE = "GPL"
-RDEPENDS = "matchbox-wm gtk2-theme-angelistic"
+RDEPENDS_${PN} = "matchbox-wm gtk2-theme-angelistic"
 SECTION = "x11/base"
 
 SRC_URI = "file://gtkrc"
diff --git a/recipes/matchbox-wm/matchbox-wm_0.9.5.bb b/recipes/matchbox-wm/matchbox-wm_0.9.5.bb
index 25f835f..9cfbc28 100644
--- a/recipes/matchbox-wm/matchbox-wm_0.9.5.bb
+++ b/recipes/matchbox-wm/matchbox-wm_0.9.5.bb
@@ -1,7 +1,7 @@
 require matchbox-wm.inc
 
 DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes libxdamage libxrender startup-notification expat gconf "
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 PR ="r2"
 
 SRC_URI = "http://projects.o-hand.com/matchbox/sources/matchbox-window-manager/0.9/matchbox-window-manager-${PV}.tar.gz \
diff --git a/recipes/matchbox-wm/matchbox-wm_1.0.bb b/recipes/matchbox-wm/matchbox-wm_1.0.bb
index 6eb141f..c9807ab 100644
--- a/recipes/matchbox-wm/matchbox-wm_1.0.bb
+++ b/recipes/matchbox-wm/matchbox-wm_1.0.bb
@@ -1,7 +1,7 @@
 require matchbox-wm.inc
 
 DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes libxdamage libxrender startup-notification expat gconf "
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 PR ="r3"
 
diff --git a/recipes/matchbox-wm/matchbox-wm_1.1.bb b/recipes/matchbox-wm/matchbox-wm_1.1.bb
index 1b7dcad..25768cf 100644
--- a/recipes/matchbox-wm/matchbox-wm_1.1.bb
+++ b/recipes/matchbox-wm/matchbox-wm_1.1.bb
@@ -1,7 +1,7 @@
 require matchbox-wm.inc
 
 DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes libxdamage libxrender startup-notification expat gconf "
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 PR ="r2"
 
diff --git a/recipes/matchbox-wm/matchbox-wm_1.2.bb b/recipes/matchbox-wm/matchbox-wm_1.2.bb
index 5a66719..cd28cb5 100644
--- a/recipes/matchbox-wm/matchbox-wm_1.2.bb
+++ b/recipes/matchbox-wm/matchbox-wm_1.2.bb
@@ -1,7 +1,7 @@
 require matchbox-wm.inc
 
 DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes libxdamage libxrender startup-notification expat gconf gconf-native "
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 PR ="r5"
 
diff --git a/recipes/matchbox-wm/matchbox-wm_svn.bb b/recipes/matchbox-wm/matchbox-wm_svn.bb
index 554811d..97bf8d9 100644
--- a/recipes/matchbox-wm/matchbox-wm_svn.bb
+++ b/recipes/matchbox-wm/matchbox-wm_svn.bb
@@ -1,7 +1,7 @@
 require matchbox-wm.inc
 
 DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes libxdamage libxrender startup-notification expat gconf "
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 PV = "1.1+svn${SRCDATE}"
 PR = "r4"
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/matchbox2/matchbox-desktop-2_svn.bb b/recipes/matchbox2/matchbox-desktop-2_svn.bb
index bf7557d..ccea183 100644
--- a/recipes/matchbox2/matchbox-desktop-2_svn.bb
+++ b/recipes/matchbox2/matchbox-desktop-2_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Matchbox Window Manager Desktop"
 LICENSE = "GPL"
 SECTION = "x11/panels"
 DEPENDS = "gtk+ startup-notification"
-RDEPENDS = "matchbox-common"
+RDEPENDS_${PN} = "matchbox-common"
 SRCREV = "2096"
 PV = "2.0+svnr${SRCPV}"
 PR = "r1"
diff --git a/recipes/matchbox2/matchbox2_2.0.bb b/recipes/matchbox2/matchbox2_2.0.bb
index fc7e9ef..477b744 100644
--- a/recipes/matchbox2/matchbox2_2.0.bb
+++ b/recipes/matchbox2/matchbox2_2.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Metapackage for Matchbox2 suite"
 LICENSE = "GPL"
 DEPENDS = "matchbox-wm-2 matchbox-panel-2 matchbox-desktop-2"
-RDEPENDS = "matchbox-wm-2 matchbox-panel-2 matchbox-desktop-2"
+RDEPENDS_${PN} = "matchbox-wm-2 matchbox-panel-2 matchbox-desktop-2"
 SECTION = "x11/wm"
 PR = "r1"
 
diff --git a/recipes/mb-desktop-xine/mb-desktop-xine_0.4.bb b/recipes/mb-desktop-xine/mb-desktop-xine_0.4.bb
index 5d276b6..39953f6 100644
--- a/recipes/mb-desktop-xine/mb-desktop-xine_0.4.bb
+++ b/recipes/mb-desktop-xine/mb-desktop-xine_0.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "foo"
 HOMEPAGE = "http://projects.o-hand.com/matchbox/"
 LICENSE = "GPL"
 DEPENDS = "matchbox-desktop libxine"
-RDEPENDS = "libxine-plugin-vo-out-xshm \
+RDEPENDS_${PN} = "libxine-plugin-vo-out-xshm \
             libxine-plugin-vo-out-none \
             libxine-plugin-ao-out-esd \
             libxine-plugin-ao-out-none \
diff --git a/recipes/mc/mc.inc b/recipes/mc/mc.inc
index 24ea394..508cb6e 100644
--- a/recipes/mc/mc.inc
+++ b/recipes/mc/mc.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 SECTION = "console/utils"
 PRIORITY = "optional"
 DEPENDS = "ncurses glib-2.0 glib-2.0-native"
-RDEPENDS = "ncurses-terminfo"
+RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.ibiblio.org/pub/Linux/utils/file/managers/mc/mc-${PV}.tar.gz"
 
diff --git a/recipes/mdk/mdk2_v33.bb b/recipes/mdk/mdk2_v33.bb
index 5663137..587a83c 100644
--- a/recipes/mdk/mdk2_v33.bb
+++ b/recipes/mdk/mdk2_v33.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "ASPj is drunk"
 HOMEPAGE = "http://homepages.tu-darmstadt.de/~p_larbig/wlan/"
 LICENSE = "GPLv2"
 DEPENDS = ""
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 PR ="r1"
 
 SRC_URI = "http://homepages.tu-darmstadt.de/~p_larbig/wlan/mdk2-${PV}.tar.bz2 \
diff --git a/recipes/mesa/mesa-dri_6.5.2.bb b/recipes/mesa/mesa-dri_6.5.2.bb
index 323d20f..2baa88f 100644
--- a/recipes/mesa/mesa-dri_6.5.2.bb
+++ b/recipes/mesa/mesa-dri_6.5.2.bb
@@ -10,7 +10,7 @@ PR = "${INC_PR}.0"
 
 DEPENDS += "libdrm"
 # DRI is useless without the kernel drivers
-RRECOMMENDS += " kernel-module-drm kernel-module-radeon "
+RRECOMMENDS_${PN} += " kernel-module-drm kernel-module-radeon "
 
 do_configure() {
 	cd configs
diff --git a/recipes/mesa/mesa-dri_7.0.3.bb b/recipes/mesa/mesa-dri_7.0.3.bb
index 3ce7d98..1893d47 100644
--- a/recipes/mesa/mesa-dri_7.0.3.bb
+++ b/recipes/mesa/mesa-dri_7.0.3.bb
@@ -11,7 +11,7 @@ PR = "${INC_PR}.0"
 
 DEPENDS += "libdrm"
 # DRI is useless without the kernel drivers
-RRECOMMENDS += " kernel-module-drm kernel-module-radeon "
+RRECOMMENDS_${PN} += " kernel-module-drm kernel-module-radeon "
 
 do_configure() {
 	cd configs
diff --git a/recipes/mesa/mesa_6.4.1+cvs20060101.bb b/recipes/mesa/mesa_6.4.1+cvs20060101.bb
index 0ecd04f..69b1c0c 100644
--- a/recipes/mesa/mesa_6.4.1+cvs20060101.bb
+++ b/recipes/mesa/mesa_6.4.1+cvs20060101.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/Mesa"
 
 LICENSE = "LGPL"
 
-RDEPENDS = "expat"
+RDEPENDS_${PN} = "expat"
 DEPENDS = "makedepend-native xf86vidmodeproto glproto virtual/libx11 libxext libxxf86vm libxi libxmu libice"
 
 # gcc-3.4 blows up in gtktext with -frename-registers on arm-linux
diff --git a/recipes/meta/canadian-sdk.bb b/recipes/meta/canadian-sdk.bb
index 86b645b..47529a2 100644
--- a/recipes/meta/canadian-sdk.bb
+++ b/recipes/meta/canadian-sdk.bb
@@ -32,7 +32,7 @@ FEED_ARCH ?= "${TARGET_ARCH}"
 SDK_SUFFIX = "toolchain"
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_SYS}-${DISTRO}-${DISTRO_VERSION}-${FEED_ARCH}-${TARGET_OS}-${SDK_SUFFIX}"
 
-RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_CANADIAN_HOST_TASK}"
+RDEPENDS_${PN} = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_CANADIAN_HOST_TASK}"
 
 TOOLCHAIN_FEED_URI ?= "${DISTRO_FEED_URI}"
 
diff --git a/recipes/meta/meta-angstrom-2007.bb b/recipes/meta/meta-angstrom-2007.bb
index a3a2c78..8355b10 100644
--- a/recipes/meta/meta-angstrom-2007.bb
+++ b/recipes/meta/meta-angstrom-2007.bb
@@ -5,16 +5,16 @@
  
 inherit meta
 
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 # Basic tools
-RDEPENDS += " \
+RDEPENDS_${PN} += " \
          task-proper-tools \
 	 screen \
 	 "
 
 # Browsers know to work on all archs
-RDEPENDS += " \
+RDEPENDS_${PN} += " \
          gpe-mini-browser \
          midori \
 	 minimo \
@@ -23,7 +23,7 @@ RDEPENDS += " \
          "
 
 # Webservers
-RDEPENDS += " \
+RDEPENDS_${PN} += " \
         apache2 \
         boa \
 	cherokee \
diff --git a/recipes/meta/meta-e-x11-core.bb b/recipes/meta/meta-e-x11-core.bb
index 58ea1b4..3f22399 100644
--- a/recipes/meta/meta-e-x11-core.bb
+++ b/recipes/meta/meta-e-x11-core.bb
@@ -5,6 +5,6 @@ PR = "r1"
 PACKAGE_ARCH = "all"
 LICENSE = "MIT"
 
-RDEPENDS = "task-e-x11-core"
+RDEPENDS_${PN} = "task-e-x11-core"
 
 inherit meta
diff --git a/recipes/meta/meta-e-x11.bb b/recipes/meta/meta-e-x11.bb
index c0b430b..25d42e4 100644
--- a/recipes/meta/meta-e-x11.bb
+++ b/recipes/meta/meta-e-x11.bb
@@ -5,6 +5,6 @@ PR = "r1"
 PACKAGE_ARCH = "all"
 LICENSE = "MIT"
 
-RDEPENDS = "task-e-x11"
+RDEPENDS_${PN} = "task-e-x11"
 
 inherit meta
diff --git a/recipes/meta/meta-gpe-extras.bb b/recipes/meta/meta-gpe-extras.bb
index 24be129..7d7739a 100644
--- a/recipes/meta/meta-gpe-extras.bb
+++ b/recipes/meta/meta-gpe-extras.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Meta-package of extra applications for the GPE Palmtop Environmen
 LICENSE = "MIT"
 PR ="r3"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     task-gpe-apps \
     task-gpe-games \
     task-gpe-web \
diff --git a/recipes/meta/meta-gpe.bb b/recipes/meta/meta-gpe.bb
index 15e9fd1..40de91d 100644
--- a/recipes/meta/meta-gpe.bb
+++ b/recipes/meta/meta-gpe.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Meta-package for GPE Palmtop Environment"
 LICENSE = "MIT"
 PR = "r43"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     task-gpe-base \
     task-gpe-settings \
     task-gpe-pim \
diff --git a/recipes/meta/meta-maemo.bb b/recipes/meta/meta-maemo.bb
index 6669a50..d18497a 100644
--- a/recipes/meta/meta-maemo.bb
+++ b/recipes/meta/meta-maemo.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Meta-package for maemo environment"
 LICENSE = "MIT"
 PR = "r0"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     maemo-task-base \
     maemo-task-apps \
     maemo-task-libs-install \
diff --git a/recipes/meta/meta-mamona-light.bb b/recipes/meta/meta-mamona-light.bb
index 562ba5b..b03923c 100644
--- a/recipes/meta/meta-mamona-light.bb
+++ b/recipes/meta/meta-mamona-light.bb
@@ -5,7 +5,7 @@ PR = "r1"
 inherit meta
 EXCLUDE_FROM_WORLD = "1"
 
-RDEPENDS = " \
+RDEPENDS_${PN} = " \
 task-mamona \
 "
 
diff --git a/recipes/meta/meta-mamona.bb b/recipes/meta/meta-mamona.bb
index a7e3d9f..44d5059 100644
--- a/recipes/meta/meta-mamona.bb
+++ b/recipes/meta/meta-mamona.bb
@@ -5,7 +5,7 @@ PR = "r2"
 inherit meta
 EXCLUDE_FROM_WORLD = "1"
 
-RDEPENDS = " \
+RDEPENDS_${PN} = " \
 task-mamona-base \
 task-mamona \
 task-mamona-devel \
diff --git a/recipes/meta/meta-nas-server.bb b/recipes/meta/meta-nas-server.bb
index 3deb44c..114c15b 100644
--- a/recipes/meta/meta-nas-server.bb
+++ b/recipes/meta/meta-nas-server.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Meta-package for a network attached storage server"
 LICENSE = "MIT"
 PR = "r0"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
 	task-nas-server-everything \
 	"
 
diff --git a/recipes/meta/meta-opie-all.bb b/recipes/meta/meta-opie-all.bb
index 90b3912..0f80754 100644
--- a/recipes/meta/meta-opie-all.bb
+++ b/recipes/meta/meta-opie-all.bb
@@ -3,7 +3,7 @@ SECTION = "opie/base"
 LICENSE = "MIT"
 PR = "r3"
 
-RDEPENDS = " \
+RDEPENDS_${PN} = " \
     task-qpe-applets \
     task-qpe-games \
     task-qpe-inputmethods \
diff --git a/recipes/meta/meta-opie.bb b/recipes/meta/meta-opie.bb
index 04b20c3..55576d2 100644
--- a/recipes/meta/meta-opie.bb
+++ b/recipes/meta/meta-opie.bb
@@ -3,7 +3,7 @@ SECTION = "opie/base"
 PR = "r34"
 LICENSE = "MIT"
 
-RDEPENDS = "task-opie-applets task-opie-apps task-opie-base \
+RDEPENDS_${PN} = "task-opie-applets task-opie-apps task-opie-base \
             task-opie-base-applets task-opie-base-apps \
             task-opie-base-decorations task-opie-base-inputmethods \
             task-opie-base-pim task-opie-base-settings \
diff --git a/recipes/meta/meta-sdl.bb b/recipes/meta/meta-sdl.bb
index 8b2fbcd..bf5307f 100644
--- a/recipes/meta/meta-sdl.bb
+++ b/recipes/meta/meta-sdl.bb
@@ -2,6 +2,6 @@ DESCRIPTION = "Meta-package for SDL"
 LICENSE = "MIT"
 PR = "r2"
 
-RDEPENDS = "task-sdl-libs task-sdl-games task-sdl-emulators"
+RDEPENDS_${PN} = "task-sdl-libs task-sdl-games task-sdl-emulators"
 
 inherit meta
diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index adc057a..064fc3b 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -21,7 +21,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${DISTRO}-${DISTRO_VERSION}-${SDK_SYS}-${FEED_ARCH}-${T
 
 DISTRO_FEED_CONFIGS ?= " "
 
-RDEPENDS = "${DISTRO_FEED_CONFIGS} ${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
+RDEPENDS_${PN} = "${DISTRO_FEED_CONFIGS} ${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
 
 TOOLCHAIN_FEED_URI ?= "${DISTRO_FEED_URI}"
 
diff --git a/recipes/meta/openmoko-feed.bb b/recipes/meta/openmoko-feed.bb
index 9cc227c..21bdbc6 100644
--- a/recipes/meta/openmoko-feed.bb
+++ b/recipes/meta/openmoko-feed.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Meta-package for Openmoko Misc. Feed Items"
 LICENSE = "MIT"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   task-openmoko-debug \
   task-openmoko-native-sdk \
   task-openmoko-feed \
diff --git a/recipes/meta/slugos-native.bb b/recipes/meta/slugos-native.bb
index 9dae7e8..5247a16 100644
--- a/recipes/meta/slugos-native.bb
+++ b/recipes/meta/slugos-native.bb
@@ -98,5 +98,5 @@ SLUGOS_NATIVE_DP = "\
 	python \
 	"
 
-RDEPENDS = '${SLUGOS_NATIVE_RT} ${SLUGOS_NATIVE}'
+RDEPENDS_${PN} = '${SLUGOS_NATIVE_RT} ${SLUGOS_NATIVE}'
 DEPENDS  = '${SLUGOS_NATIVE_DP} ${SLUGOS_NATIVE}'
diff --git a/recipes/meta/xbase-clients.bb b/recipes/meta/xbase-clients.bb
index 5f3c640..35ca4e6 100644
--- a/recipes/meta/xbase-clients.bb
+++ b/recipes/meta/xbase-clients.bb
@@ -5,7 +5,7 @@ PR = "r1"
 ALLOW_EMPTY = "1"
 PACKAGES = "${PN}"
 
-RDEPENDS = 'xauth \
+RDEPENDS_${PN} = 'xauth \
 	xhost \
 	xmodmap \
 	xrdb \
diff --git a/recipes/midpath/midpath-core_0.2+0.3rc2.bb b/recipes/midpath/midpath-core_0.2+0.3rc2.bb
index 4f63d6d..9f28b47 100644
--- a/recipes/midpath/midpath-core_0.2+0.3rc2.bb
+++ b/recipes/midpath/midpath-core_0.2+0.3rc2.bb
@@ -19,7 +19,7 @@ SRC_URI += "\
 PROVIDES = "java-midp2.0"
 DEPENDS += "midpath-cldc midpath-backend-sdl midpath-backend-escher swt3.4-gtk kxml2 bluez-libs"
 
-RDEPENDS += "libkxml2-java"
+RDEPENDS_${PN} += "libkxml2-java"
 
 JAR = "midpath.jar"
 
diff --git a/recipes/midpath/midpath-demos_0.2+0.3rc2.bb b/recipes/midpath/midpath-demos_0.2+0.3rc2.bb
index 159e214..0a6443a 100644
--- a/recipes/midpath/midpath-demos_0.2+0.3rc2.bb
+++ b/recipes/midpath/midpath-demos_0.2+0.3rc2.bb
@@ -7,7 +7,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/midpath/midpath-0.3rc2.tar.gz"
 S = "${WORKDIR}/midpath-0.3rc2"
 
 DEPENDS = "midpath-core midpath-location midpath-messaging midpath-svg midpath-opengles midpath-m3g"
-RDEPENDS = "midpath midpath-location midpath-messaging midpath-svg-midp midpath-opengles midpath-m3g"
+RDEPENDS_${PN} = "midpath midpath-location midpath-messaging midpath-svg-midp midpath-opengles midpath-m3g"
 
 DESCRIPTION = "Demonstration programs of the MIDPath library"
 
diff --git a/recipes/midpath/midpath-maemo_0.2+0.3rc2.bb b/recipes/midpath/midpath-maemo_0.2+0.3rc2.bb
index 07246e7..424ff24 100644
--- a/recipes/midpath/midpath-maemo_0.2+0.3rc2.bb
+++ b/recipes/midpath/midpath-maemo_0.2+0.3rc2.bb
@@ -13,7 +13,7 @@ PR = "r0"
 
 SRC_URI += "file://configuration_maemo.cfg"
 
-RDEPENDS += "java2-runtime libswt3.4-gtk-java midpath-core-bluetooth"
+RDEPENDS_${PN} += "java2-runtime libswt3.4-gtk-java midpath-core-bluetooth"
 
 CONFIGURATION = "configuration_maemo.cfg"
 
diff --git a/recipes/midpath/midpath-openmoko_0.2+0.3rc2.bb b/recipes/midpath/midpath-openmoko_0.2+0.3rc2.bb
index b818013..3e524d8 100644
--- a/recipes/midpath/midpath-openmoko_0.2+0.3rc2.bb
+++ b/recipes/midpath/midpath-openmoko_0.2+0.3rc2.bb
@@ -13,7 +13,7 @@ PR = "r0"
 
 SRC_URI += "file://configuration_openmoko.cfg"
 
-RDEPENDS += "java2-runtime midpath-backend-alsa libswt3.4-gtk-java midpath-core-bluetooth"
+RDEPENDS_${PN} += "java2-runtime midpath-backend-alsa libswt3.4-gtk-java midpath-core-bluetooth"
 
 CONFIGURATION = "configuration_openmoko.cfg"
 
diff --git a/recipes/midpath/midpath.inc b/recipes/midpath/midpath.inc
index 19b4179..50fd8ef 100644
--- a/recipes/midpath/midpath.inc
+++ b/recipes/midpath/midpath.inc
@@ -5,7 +5,7 @@
 # RDEPENDS.
 require midpath-common.inc
 
-RDEPENDS = "midpath-core midpath-core-bluetooth midpath-core-ogg ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'midpath-core-mp3', d)}"
+RDEPENDS_${PN} = "midpath-core midpath-core-bluetooth midpath-core-ogg ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'midpath-core-mp3', d)}"
 
 PROVIDES = "midpath"
 RPROVIDES = "midpath"
diff --git a/recipes/mime-support/mime-support_3.28.bb b/recipes/mime-support/mime-support_3.28.bb
index 61b0ebc..a9de27d 100644
--- a/recipes/mime-support/mime-support_3.28.bb
+++ b/recipes/mime-support/mime-support_3.28.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "MIME files 'mime.types' & 'mailcap', and support programs"
 LICENSE = "PD"
 
 DEPENDS = "file"
-RRECOMMENDS = "file"
+RRECOMMENDS_${PN} = "file"
 
 PR = "r3"
 
diff --git a/recipes/mime-support/mime-support_3.44.bb b/recipes/mime-support/mime-support_3.44.bb
index 6a0a41d..42baed8 100644
--- a/recipes/mime-support/mime-support_3.44.bb
+++ b/recipes/mime-support/mime-support_3.44.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "MIME files 'mime.types' & 'mailcap', and support programs"
 LICENSE = "PD"
 
 DEPENDS = "file"
-RRECOMMENDS = "file"
+RRECOMMENDS_${PN} = "file"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}-1.tar.gz"
 S = "${WORKDIR}/${PN}"
diff --git a/recipes/miniclipboard/miniclipboard_0.3.bb b/recipes/miniclipboard/miniclipboard_0.3.bb
index 8e358d1..be92a73 100644
--- a/recipes/miniclipboard/miniclipboard_0.3.bb
+++ b/recipes/miniclipboard/miniclipboard_0.3.bb
@@ -3,7 +3,7 @@ inherit gpe
 LICENSE = "GPL"
 DESCRIPTION = "Clipboard management application"
 DEPENDS = "virtual/libx11 libxpm"
-RDEPENDS = "gdk-pixbuf-loader-xpm"
+RDEPENDS_${PN} = "gdk-pixbuf-loader-xpm"
 PR = "r2"
 
 SRC_URI += "file://miniclipboard.desktop \
diff --git a/recipes/minipredict/libdictionary.bb b/recipes/minipredict/libdictionary.bb
index c2803b7..5298978 100644
--- a/recipes/minipredict/libdictionary.bb
+++ b/recipes/minipredict/libdictionary.bb
@@ -1,7 +1,7 @@
 inherit gpe pkgconfig
 
 DESCRIPTION = "Dictionary access library, used by minipredict."
-RRECOMMENDS = "dictionary"
+RRECOMMENDS_${PN} = "dictionary"
 SECTION = "gpe"
 PRIORITY = "optional"
 
diff --git a/recipes/mipl-mipv6/mipv6_2.0.2.bb b/recipes/mipl-mipv6/mipv6_2.0.2.bb
index b560cab..29b87fb 100644
--- a/recipes/mipl-mipv6/mipv6_2.0.2.bb
+++ b/recipes/mipl-mipv6/mipv6_2.0.2.bb
@@ -1,6 +1,6 @@
 LICENSE = "GPL"
 DEPENDS = "virtual/kernel"
-RRECOMMENDS = "kernel-module-mip6 kernel-module-ipv6"
+RRECOMMENDS_${PN} = "kernel-module-mip6 kernel-module-ipv6"
 
 SRC_URI = "http://www.mobile-ipv6.org/software/download/mipv6-${PV}.tar.gz"
 
diff --git a/recipes/misc-binary-only/acx-firmware_1.0.bb b/recipes/misc-binary-only/acx-firmware_1.0.bb
index ca6c1a8..4706c5b 100644
--- a/recipes/misc-binary-only/acx-firmware_1.0.bb
+++ b/recipes/misc-binary-only/acx-firmware_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ACX (iPAQ HX4700/HTC Universal) wireless firmware."
 SECTION = "base"
 LICENSE = "Unknown"
 PR = "r2"
-RRECOMMENDS = "kernel-module-firmware-class"
+RRECOMMENDS_${PN} = "kernel-module-firmware-class"
 
 SRC_URI = "http://sdgsystems.com/pub/ipaq/hx4700/src/RADIO0d.BIN;name=radio0d \
            http://sdgsystems.com/pub/ipaq/hx4700/src/RADIO11.BIN;name=radio11 \
diff --git a/recipes/misc-binary-only/prism-firmware.bb b/recipes/misc-binary-only/prism-firmware.bb
index 030121b..fac20bc 100644
--- a/recipes/misc-binary-only/prism-firmware.bb
+++ b/recipes/misc-binary-only/prism-firmware.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Firmware for the Prism 2.x/3 cards"
 SECTION = "base"
 LICENSE = "closed"
-RDEPENDS = "hostap-utils"
+RDEPENDS_${PN} = "hostap-utils"
 RREPLACES = "prism3-firmware prism3-support"
 RCONFLICTS = "prism3-firmware prism3-support"
 PACKAGE_ARCH = "all"
diff --git a/recipes/misc-binary-only/prism2-firmware-update_1.7.4.bb b/recipes/misc-binary-only/prism2-firmware-update_1.7.4.bb
index 501fa8a..43638a8 100644
--- a/recipes/misc-binary-only/prism2-firmware-update_1.7.4.bb
+++ b/recipes/misc-binary-only/prism2-firmware-update_1.7.4.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "one-time install package to upgrade the firmware of all installed prism2 based cards."
-RDEPENDS = "hostap-modules-pci hostap-utils"
+RDEPENDS_${PN} = "hostap-modules-pci hostap-utils"
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "unknown"
diff --git a/recipes/moblin/bickley_git.bb b/recipes/moblin/bickley_git.bb
index de94a7a..99518ce 100644
--- a/recipes/moblin/bickley_git.bb
+++ b/recipes/moblin/bickley_git.bb
@@ -5,7 +5,7 @@ PR_append = "+git${SRCREV}"
 PR = "r3"
 
 DEPENDS = "redland gtk+ dbus-glib clutter-gst-0.9 libexif taglib gupnp gupnp-av samba"
-RDEPENDS = "xdg-user-dirs"
+RDEPENDS_${PN} = "xdg-user-dirs"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes/modphp/modphp5.inc b/recipes/modphp/modphp5.inc
index 6e6d570..f402e26 100644
--- a/recipes/modphp/modphp5.inc
+++ b/recipes/modphp/modphp5.inc
@@ -1,7 +1,7 @@
 SECTION = "console/network"
 DESCRIPTION = "A server-side, HTML-embedded scripting language. This package provides the apache php module."
 LICENSE = "PHP"
-RDEPENDS = "apache2"
+RDEPENDS_${PN} = "apache2"
 DEPENDS = "apache2-native apache2 zlib"
 SRC_URI = "http://de3.php.net/distributions/php-${PV}.tar.bz2 \
 	   file://configure.patch \
diff --git a/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb b/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb
index 4fa5bf4..24b8b79 100644
--- a/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb
+++ b/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb
@@ -3,7 +3,7 @@ inherit cross
 DEFAULT_PREFERENCE = "0"
 PROVIDES += "virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.6"
 
-# Remove the RDEPENDS we picked up from the "require";
+# Remove the RDEPENDS_${PN} we picked up from the "require";
 # it's simply extraneous for the cross package
 RDEPENDS_${PN} = ""
 
diff --git a/recipes/mokoko/mokoko_svn.bb b/recipes/mokoko/mokoko_svn.bb
index a66e01e..2ddca60 100644
--- a/recipes/mokoko/mokoko_svn.bb
+++ b/recipes/mokoko/mokoko_svn.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/om-mediaplayer/"
 SECTION = "openmoko/applications"
 LICENSE = "GPL"
 DEPENDS = "gstreamer"
-RDEPENDS = "gstreamer"
+RDEPENDS_${PN} = "gstreamer"
 
 SRCREV = "127"
 PV = "0.1+svnr${SRCPV}"
diff --git a/recipes/mono-xsp/mono-xsp_1.2.5.bb b/recipes/mono-xsp/mono-xsp_1.2.5.bb
index 27194cb..204d054 100644
--- a/recipes/mono-xsp/mono-xsp_1.2.5.bb
+++ b/recipes/mono-xsp/mono-xsp_1.2.5.bb
@@ -11,7 +11,7 @@ SECTION = "devel/mono"
 PR = "r4"
 
 DEPENDS = "mono"
-RDEPENDS = "mono"
+RDEPENDS_${PN} = "mono"
 
 inherit autotools mono
 
diff --git a/recipes/mono-xsp/mono-xsp_2.4.2.bb b/recipes/mono-xsp/mono-xsp_2.4.2.bb
index cca1f78..2d61391 100644
--- a/recipes/mono-xsp/mono-xsp_2.4.2.bb
+++ b/recipes/mono-xsp/mono-xsp_2.4.2.bb
@@ -9,7 +9,7 @@ SECTION = "devel/mono"
 
 
 DEPENDS = "mono"
-RDEPENDS = "mono"
+RDEPENDS_${PN} = "mono"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/mozilla/firefox-addon.inc b/recipes/mozilla/firefox-addon.inc
index fa0eca6..427dce5 100644
--- a/recipes/mozilla/firefox-addon.inc
+++ b/recipes/mozilla/firefox-addon.inc
@@ -2,7 +2,7 @@
 # Released under the MIT license (see packages/COPYING)
 
 DEPENDS = "unzip-native"
-RDEPENDS = "firefox"
+RDEPENDS_${PN} = "firefox"
 
 S = "${WORKDIR}"
 FIREFOX_VERSION = "3.0.4"
diff --git a/recipes/mozilla/firefox-l10n.inc b/recipes/mozilla/firefox-l10n.inc
index 31555e3..640981e 100644
--- a/recipes/mozilla/firefox-l10n.inc
+++ b/recipes/mozilla/firefox-l10n.inc
@@ -12,7 +12,7 @@ def get_language_name(package):
     return lang
 
 DEPENDS = "unzip-native"
-RDEPENDS = "firefox"
+RDEPENDS_${PN} = "firefox"
 LANGUAGE = "${@get_language_name('${PN}')}"
 
 SRC_URI = "http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/linux-i686/xpi/${LANGUAGE}.xpi"
diff --git a/recipes/mozilla/thunderbird_1.0.7.bb b/recipes/mozilla/thunderbird_1.0.7.bb
index e7f4d37..7665012 100644
--- a/recipes/mozilla/thunderbird_1.0.7.bb
+++ b/recipes/mozilla/thunderbird_1.0.7.bb
@@ -1,6 +1,6 @@
 SECTION = "x11/utils"
 DEPENDS += "gnupg"
-RRECOMMENDS += "gnupg"
+RRECOMMENDS_${PN} += "gnupg"
 PR = "r1"
 
 EMVER="0.92.0"
diff --git a/recipes/mplayer/mplayer-maemo_svn.bb b/recipes/mplayer/mplayer-maemo_svn.bb
index 6851387..f52eb2e 100644
--- a/recipes/mplayer/mplayer-maemo_svn.bb
+++ b/recipes/mplayer/mplayer-maemo_svn.bb
@@ -12,7 +12,7 @@ PE = "1"
 
 RCONFLICTS_${PN} = "mplayer"
 
-RDEPENDS = "mplayer-common"
+RDEPENDS_${PN} = "mplayer-common"
 LICENSE = "GPL"
 SRC_URI = "svn://garage.maemo.org/svn/mplayer/;module=trunk;proto=https \
            file://Makefile-codec-cfg.patch \
diff --git a/recipes/mplayer/mplayer_0.0+1.0rc1.bb b/recipes/mplayer/mplayer_0.0+1.0rc1.bb
index cb6ce51..28967cc 100644
--- a/recipes/mplayer/mplayer_0.0+1.0rc1.bb
+++ b/recipes/mplayer/mplayer_0.0+1.0rc1.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 HOMEPAGE = "http://www.mplayerhq.hu/"
 DEPENDS = "virtual/libsdl zlib libpng jpeg freetype fontconfig alsa-lib lzo ncurses libxv virtual/libx11 \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame', d)}"
-RDEPENDS = "mplayer-common"
+RDEPENDS_${PN} = "mplayer-common"
 LICENSE = "GPL"
 SRC_URI = "http://www1.mplayerhq.hu/MPlayer/releases/MPlayer-1.0rc1.tar.bz2;name=archive \
            file://vo_w100.c \
diff --git a/recipes/mplayer/mplayer_0.0+1.0rc2.bb b/recipes/mplayer/mplayer_0.0+1.0rc2.bb
index 876c88b..5adf238 100644
--- a/recipes/mplayer/mplayer_0.0+1.0rc2.bb
+++ b/recipes/mplayer/mplayer_0.0+1.0rc2.bb
@@ -9,7 +9,7 @@ DEPENDS_append_hx4700 = " libw100 "
 
 DEFAULT_PREFERENCE_avr32 = "1"
 
-RDEPENDS = "mplayer-common"
+RDEPENDS_${PN} = "mplayer-common"
 LICENSE = "GPL"
 SRC_URI = "http://www1.mplayerhq.hu/MPlayer/releases/MPlayer-1.0rc2.tar.bz2 \
            file://vo_w100.c \
diff --git a/recipes/mplayer/mplayer_git.bb b/recipes/mplayer/mplayer_git.bb
index c08676a..49124e2 100644
--- a/recipes/mplayer/mplayer_git.bb
+++ b/recipes/mplayer/mplayer_git.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.mplayerhq.hu/"
 DEPENDS = "live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame libxv virtual/libx11 virtual/kernel \
 	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame', d)}"
 
-RDEPENDS = "mplayer-common"
+RDEPENDS_${PN} = "mplayer-common"
 LICENSE = "GPL"
 SRC_URI = "git://repo.or.cz/mplayer/glamo.git;protocol=git;branch=master \
    file://makefile-nostrip-svn.patch \
diff --git a/recipes/mplayer/mplayer_svn.bb b/recipes/mplayer/mplayer_svn.bb
index ae24cdb..c197d67 100644
--- a/recipes/mplayer/mplayer_svn.bb
+++ b/recipes/mplayer/mplayer_svn.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.mplayerhq.hu/"
 DEPENDS = "live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame libxv virtual/libx11 virtual/kernel \
 	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame', d)}"
 
-RDEPENDS = "mplayer-common"
+RDEPENDS_${PN} = "mplayer-common"
 LICENSE = "GPL"
 SRC_URI = "svn://svn.mplayerhq.hu/mplayer;module=trunk \
 	   file://makefile-nostrip-svn.patch \
diff --git a/recipes/mrtg/mrtg.inc b/recipes/mrtg/mrtg.inc
index afe4398..9ac137d 100644
--- a/recipes/mrtg/mrtg.inc
+++ b/recipes/mrtg/mrtg.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Multi Router Traffic Grapher"
 SECTION = "net"
 DEPENDS = "gd perl-native"
-RDEPENDS = " \
+RDEPENDS_${PN} = " \
 	 gd \
 	 net-snmp-server \
 	 perl \
diff --git a/recipes/mtkbabel/mtkbabel_0.8.bb b/recipes/mtkbabel/mtkbabel_0.8.bb
index 375d8d7..c474e09 100644
--- a/recipes/mtkbabel/mtkbabel_0.8.bb
+++ b/recipes/mtkbabel/mtkbabel_0.8.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 PACKAGE_ARCH = "all"
 PR = "r1"
 
-RDEPENDS = "libdevice-serialport-perl libtimedate-perl perl-module-file-basename perl-module-getopt-std"
+RDEPENDS_${PN} = "libdevice-serialport-perl libtimedate-perl perl-module-file-basename perl-module-getopt-std"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/sourceforge/${PN}/${P}.tar.gz \
 	   file://fast-logging.patch"
diff --git a/recipes/musicpd/mpd-alsa_0.11.5.bb b/recipes/musicpd/mpd-alsa_0.11.5.bb
index 2389637..10430c6 100644
--- a/recipes/musicpd/mpd-alsa_0.11.5.bb
+++ b/recipes/musicpd/mpd-alsa_0.11.5.bb
@@ -4,7 +4,7 @@ SECTION = "console/multimedia"
 LICENSE = "GPLv2"
 DEPENDS = "libvorbis libogg libao-alsa zlib libmikmod flac audiofile virtual/libiconv \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag', d)}"
-RDEPENDS = "libao-alsa"
+RDEPENDS_${PN} = "libao-alsa"
 PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/musicpd/mpd-${PV}.tar.gz \
diff --git a/recipes/musicpd/mpd-alsa_0.14.2.bb b/recipes/musicpd/mpd-alsa_0.14.2.bb
index c9c71bb..a179adb 100644
--- a/recipes/musicpd/mpd-alsa_0.14.2.bb
+++ b/recipes/musicpd/mpd-alsa_0.14.2.bb
@@ -4,7 +4,7 @@ SECTION = "console/multimedia"
 LICENSE = "GPLv2"
 DEPENDS = "libvorbis libogg libao-alsa zlib flac audiofile virtual/libiconv faad2 \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag', d)}"
-RDEPENDS = "libao-alsa"
+RDEPENDS_${PN} = "libao-alsa"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/musicpd/mpd-${PV}.tar.bz2 \
 file://mpd/mpd.conf \
diff --git a/recipes/nautilus/nautilus-cd-burner_2.24.0.bb b/recipes/nautilus/nautilus-cd-burner_2.24.0.bb
index 3a9fef5..eb78af1 100644
--- a/recipes/nautilus/nautilus-cd-burner_2.24.0.bb
+++ b/recipes/nautilus/nautilus-cd-burner_2.24.0.bb
@@ -7,7 +7,7 @@ DEPENDS="dbus-glib eel glib-2.0 gtk+ hal libglade libgnomeui nautilus"
 # recipe does not exist yet:
 #DEPENDS += "gnome-mount"
 # FIXME: recipes are missing
-#RDEPENDS = "genisoimage growisofs wodim"
+#RDEPENDS_${PN} = "genisoimage growisofs wodim"
 
 PACKAGES += "nautilus-extension-nautilus-cd-burner"
 FILES_nautilus-extension-nautilus-cd-burner = "${libdir}/nautilus"
diff --git a/recipes/nautilus/nautilus_2.24.2.bb b/recipes/nautilus/nautilus_2.24.2.bb
index 2b5054b..d5eab01 100644
--- a/recipes/nautilus/nautilus_2.24.2.bb
+++ b/recipes/nautilus/nautilus_2.24.2.bb
@@ -12,7 +12,7 @@ LICENSE="GPL"
 PR = "r1"
 
 DEPENDS += " gvfs tracker librsvg libexif eel esound gnome-desktop orbit2-native"
-RDEPENDS = "gvfs"
+RDEPENDS_${PN} = "gvfs"
 
 EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb "
 
diff --git a/recipes/nautilus/nautilus_2.26.1.bb b/recipes/nautilus/nautilus_2.26.1.bb
index 8b7d84a..4b1271e 100644
--- a/recipes/nautilus/nautilus_2.26.1.bb
+++ b/recipes/nautilus/nautilus_2.26.1.bb
@@ -13,7 +13,7 @@ export SYSROOT = "${STAGING_DIR_HOST}"
 LICENSE="GPL"
 
 DEPENDS += "libunique  gvfs tracker librsvg libexif eel esound gnome-desktop orbit2-native"
-RDEPENDS = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash"
+RDEPENDS_${PN} = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash"
 
 EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb "
 
diff --git a/recipes/nautilus/nautilus_2.28.0.bb b/recipes/nautilus/nautilus_2.28.0.bb
index 6d1c052..6b0f85a 100644
--- a/recipes/nautilus/nautilus_2.28.0.bb
+++ b/recipes/nautilus/nautilus_2.28.0.bb
@@ -13,7 +13,7 @@ export SYSROOT = "${STAGING_DIR_HOST}"
 LICENSE="GPL"
 
 DEPENDS += "libunique  gvfs tracker librsvg libexif eel esound gnome-desktop orbit2-native"
-RDEPENDS = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash"
+RDEPENDS_${PN} = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash"
 
 EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb "
 
diff --git a/recipes/nautilus/nautilus_2.28.1.bb b/recipes/nautilus/nautilus_2.28.1.bb
index 6b4f3b1..44a3191 100644
--- a/recipes/nautilus/nautilus_2.28.1.bb
+++ b/recipes/nautilus/nautilus_2.28.1.bb
@@ -13,7 +13,7 @@ export SYSROOT = "${STAGING_DIR_HOST}"
 LICENSE="GPL"
 
 DEPENDS += "libunique  gvfs tracker librsvg libexif eel esound gnome-desktop orbit2-native"
-RDEPENDS = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash"
+RDEPENDS_${PN} = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash"
 
 EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb "
 
diff --git a/recipes/nautilus/nautilus_2.30.0.bb b/recipes/nautilus/nautilus_2.30.0.bb
index 1366c35..be7ff32 100644
--- a/recipes/nautilus/nautilus_2.30.0.bb
+++ b/recipes/nautilus/nautilus_2.30.0.bb
@@ -16,7 +16,7 @@ export SYSROOT = "${STAGING_DIR_HOST}"
 LICENSE="GPL"
 
 DEPENDS += "libunique  gvfs tracker librsvg libexif esound gnome-desktop orbit2-native"
-RDEPENDS = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash"
+RDEPENDS_${PN} = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash"
 
 EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb "
 
diff --git a/recipes/navit/navit-icons_svn.bb b/recipes/navit/navit-icons_svn.bb
index 92f7a5e..80b77c2 100644
--- a/recipes/navit/navit-icons_svn.bb
+++ b/recipes/navit/navit-icons_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Navit is a car navigation system with routing engine."
 LICENSE = "GPL"
 SECTION = "x11/applications"
 DEPENDS = "glib-2.0 gtk+ imagemagick-native librsvg-native"
-RRECOMMENDS = "gpsd espeak flite"
+RRECOMMENDS_${PN} = "gpsd espeak flite"
 
 #only icons present in the package
 PACKAGE_ARCH = "all"
diff --git a/recipes/navit/navit.inc b/recipes/navit/navit.inc
index ad29f34..32f6233 100644
--- a/recipes/navit/navit.inc
+++ b/recipes/navit/navit.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Navit is a car navigation system with routing engine."
 LICENSE = "GPL"
 SECTION = "x11/applications"
 DEPENDS = "glib-2.0 gtk+"
-RRECOMMENDS = "gpsd speechd flite"
+RRECOMMENDS_${PN} = "gpsd speechd flite"
 
 PE = "1"
 INC_PR = "r5"
diff --git a/recipes/navit/navit_svn.bb b/recipes/navit/navit_svn.bb
index 7cde038..e74189b 100644
--- a/recipes/navit/navit_svn.bb
+++ b/recipes/navit/navit_svn.bb
@@ -6,11 +6,11 @@ PR = "${INC_PR}.5"
 S = "${WORKDIR}/navit"
 
 # override navit.inc RRECOMMENDS, we only suggest a text2speech app
-RRECOMMENDS = "gpsd"
+RRECOMMENDS_${PN} = "gpsd"
 RSUGGESTS_${PN} = "flite espeak"
 
 DEPENDS_shr += " gd librsvg-native"
-RDEPENDS = " navit-icons"
+RDEPENDS_${PN} = " navit-icons"
 EXTRA_OECONF += " --enable-svg2png-scaling-flag=32 --disable-speech-speech-dispatcher --enable-cache-size=20971520"
 
 SRCREV = "3279"
diff --git a/recipes/netbook-launcher/human-icon-theme_0.35.bb b/recipes/netbook-launcher/human-icon-theme_0.35.bb
index fdb858f..8fb5a17 100644
--- a/recipes/netbook-launcher/human-icon-theme_0.35.bb
+++ b/recipes/netbook-launcher/human-icon-theme_0.35.bb
@@ -1,8 +1,8 @@
 DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native"
 
 LICENSE = "CC-BY-SA"
-RDEPENDS = "hicolor-icon-theme"
-RRECOMMENDS = "librsvg-gtk"
+RDEPENDS_${PN} = "hicolor-icon-theme"
+RRECOMMENDS_${PN} = "librsvg-gtk"
 
 inherit gnome
 
diff --git a/recipes/netkit-tftp/netkit-tftpd_0.17.bb b/recipes/netkit-tftp/netkit-tftpd_0.17.bb
index 0d57e25..cba5357 100644
--- a/recipes/netkit-tftp/netkit-tftpd_0.17.bb
+++ b/recipes/netkit-tftp/netkit-tftpd_0.17.bb
@@ -1,7 +1,7 @@
 SECTION = "console/network"
 DESCRIPTION = "netkit-tftpd includes a tftp server."
 DEPENDS = "netkit-base"
-RDEPENDS = "netkit-base"
+RDEPENDS_${PN} = "netkit-base"
 LICENSE = "BSD"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/netkit-tftp-${PV}"
 
diff --git a/recipes/netpbm/netpbm_10.28.bb b/recipes/netpbm/netpbm_10.28.bb
index de94abb..d33c6b7 100644
--- a/recipes/netpbm/netpbm_10.28.bb
+++ b/recipes/netpbm/netpbm_10.28.bb
@@ -10,7 +10,7 @@ LICENSE = "GPL MIT Artistic"
 # subject to the licenses of the libraries they use too - including
 # libpng libz, IJG, and libtiff licenses
 DEPENDS = "jpeg zlib libpng tiff flex-native"
-RDEPENDS = "perl\
+RDEPENDS_${PN} = "perl\
 	perl-module-cwd\
 	perl-module-english\
 	perl-module-fcntl\
@@ -22,8 +22,8 @@ RDEPENDS = "perl\
 
 # these should not be required, they are here because the perl
 # module dependencies are currently incorrect:
-RDEPENDS += "perl-module-exporter-heavy"
-RDEPENDS += "perl-module-file-spec-unix"
+RDEPENDS_${PN} += "perl-module-exporter-heavy"
+RDEPENDS_${PN} += "perl-module-file-spec-unix"
 
 PR = "r7"
 
diff --git a/recipes/networkmanager/cnetworkmanager_git.bb b/recipes/networkmanager/cnetworkmanager_git.bb
index 2a8ba64..1bb5be7 100644
--- a/recipes/networkmanager/cnetworkmanager_git.bb
+++ b/recipes/networkmanager/cnetworkmanager_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Command line interface for Network Manager"
 HOMEPAGE = "http://vidner.net/martin/software/cnetworkmanager/"
 LICENSE = "GPL"
 SECTION = "console/network"
-RDEPENDS = "python-core python-crypt python-dbus python-math python-pygobject python-re python-textutils python-uuid python-xml"
+RDEPENDS_${PN} = "python-core python-crypt python-dbus python-math python-pygobject python-re python-textutils python-uuid python-xml"
 PR = "r1"
 PV = "0.8+git"
 
diff --git a/recipes/networkmanager/netm-cli_0.2.bb b/recipes/networkmanager/netm-cli_0.2.bb
index 34bc7bf..5892184 100644
--- a/recipes/networkmanager/netm-cli_0.2.bb
+++ b/recipes/networkmanager/netm-cli_0.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Command Line interface for Network Manager"
 HOMEPAGE = "http://dev.openbossa.org/mamona/gitweb?p=users/salveti/netm-cli.git;a=summary"
 LICENSE = "GPLv2"
 SECTION = "console/network"
-RDEPENDS = "python-dbus python-pygobject python-textutils networkmanager (>=0.6) networkmanager (<0.7)"
+RDEPENDS_${PN} = "python-dbus python-pygobject python-textutils networkmanager (>=0.6) networkmanager (<0.7)"
 PR = "r3"
 
 inherit setuptools
diff --git a/recipes/networkmanager/netm-cli_git.bb b/recipes/networkmanager/netm-cli_git.bb
index 9317001..b740e6c 100644
--- a/recipes/networkmanager/netm-cli_git.bb
+++ b/recipes/networkmanager/netm-cli_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Command Line interface for Network Manager"
 HOMEPAGE = "http://dev.openbossa.org/mamona/gitweb?p=users/salveti/netm-cli.git;a=summary"
 LICENSE = "GPLv2"
 SECTION = "console/network"
-RDEPENDS = "python-dbus python-pygobject python-textutils networkmanager (>= 0.7)"
+RDEPENDS_${PN} = "python-dbus python-pygobject python-textutils networkmanager (>= 0.7)"
 
 SRCREV = "2c71e6b537c7fceb4bfe6e"
 
diff --git a/recipes/networkmanager/network-manager-applet_0.7.1.997.bb b/recipes/networkmanager/network-manager-applet_0.7.1.997.bb
index e00a20d..32249c2 100644
--- a/recipes/networkmanager/network-manager-applet_0.7.1.997.bb
+++ b/recipes/networkmanager/network-manager-applet_0.7.1.997.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GTK+ applet for NetworkManager" 
 LICENSE = "GPL"
 DEPENDS = "policykit-gnome libnotify networkmanager dbus-glib libglade gconf gnome-keyring"
-RDEPENDS = "networkmanager"
+RDEPENDS_${PN} = "networkmanager"
 
 inherit gnome
 
diff --git a/recipes/networkmanager/network-manager-applet_0.7.1.bb b/recipes/networkmanager/network-manager-applet_0.7.1.bb
index 1a2af78..f5d241a 100644
--- a/recipes/networkmanager/network-manager-applet_0.7.1.bb
+++ b/recipes/networkmanager/network-manager-applet_0.7.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GTK+ applet for NetworkManager" 
 LICENSE = "GPL"
 DEPENDS = "policykit-gnome libnotify networkmanager dbus-glib libglade gconf gnome-keyring"
-RDEPENDS = "networkmanager"
+RDEPENDS_${PN} = "networkmanager"
 
 PR = "r2"
 
diff --git a/recipes/networkmanager/network-manager-applet_0.8.bb b/recipes/networkmanager/network-manager-applet_0.8.bb
index 462b9ef..27d9828 100644
--- a/recipes/networkmanager/network-manager-applet_0.8.bb
+++ b/recipes/networkmanager/network-manager-applet_0.8.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GTK+ applet for NetworkManager" 
 LICENSE = "GPL"
 DEPENDS = "gnome-bluetooth policykit-gnome libnotify networkmanager dbus-glib libglade gconf gnome-keyring"
-RDEPENDS = "networkmanager"
+RDEPENDS_${PN} = "networkmanager"
 
 PR = "r2"
 
diff --git a/recipes/networkmanager/network-manager-applet_git.bb b/recipes/networkmanager/network-manager-applet_git.bb
index 524e73f..3cab4a0 100644
--- a/recipes/networkmanager/network-manager-applet_git.bb
+++ b/recipes/networkmanager/network-manager-applet_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GTK+ applet for NetworkManager" 
 LICENSE = "GPL"
 DEPENDS = "libnotify networkmanager dbus-glib libglade gconf gnome-keyring"
-RDEPENDS = "networkmanager"
+RDEPENDS_${PN} = "networkmanager"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/networkmanager/networkmanager-0.7.inc b/recipes/networkmanager/networkmanager-0.7.inc
index 6d3f9a2..baa1155 100644
--- a/recipes/networkmanager/networkmanager-0.7.inc
+++ b/recipes/networkmanager/networkmanager-0.7.inc
@@ -3,7 +3,7 @@ SECTION = "net/misc"
 LICENSE = "GPL"
 PRIORITY = "optional"
 DEPENDS = "libnl dbus dbus-glib hal wireless-tools policykit gnutls util-linux-ng ppp"
-RDEPENDS = "wpa-supplicant dhcp-client \
+RDEPENDS_${PN} = "wpa-supplicant dhcp-client \
            ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \
            "
 
diff --git a/recipes/networkmanager/networkmanager-applet_0.6.6.bb b/recipes/networkmanager/networkmanager-applet_0.6.6.bb
index 1f72761..6f6c5bd 100644
--- a/recipes/networkmanager/networkmanager-applet_0.6.6.bb
+++ b/recipes/networkmanager/networkmanager-applet_0.6.6.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GTK+ applet for NetworkManager"
 LICENSE = "GPL"
 DEPENDS = "networkmanager dbus-glib libglade gconf gnome-keyring"
 #TODO DEPENDS libnotify
-RDEPENDS = "networkmanager"
+RDEPENDS_${PN} = "networkmanager"
 
 inherit gnome gtk-icon-cache
 
diff --git a/recipes/networkmanager/networkmanager-applet_svn.bb b/recipes/networkmanager/networkmanager-applet_svn.bb
index ea8c0a8..ece04f8 100644
--- a/recipes/networkmanager/networkmanager-applet_svn.bb
+++ b/recipes/networkmanager/networkmanager-applet_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GTK+ applet for NetworkManager"
 LICENSE = "GPL"
 DEPENDS = "networkmanager dbus-glib libglade gconf gnome-keyring"
 #TODO DEPENDS libnotify
-RDEPENDS = "networkmanager"
+RDEPENDS_${PN} = "networkmanager"
 
 inherit gnome gtk-icon-cache
 
diff --git a/recipes/networkmanager/networkmanager-openvpn_0.7.1.bb b/recipes/networkmanager/networkmanager-openvpn_0.7.1.bb
index 1b319fe..cb5402b 100644
--- a/recipes/networkmanager/networkmanager-openvpn_0.7.1.bb
+++ b/recipes/networkmanager/networkmanager-openvpn_0.7.1.bb
@@ -3,7 +3,7 @@ SECTION = "net/misc"
 LICENSE = "GPL"
 PRIORITY = "optional"
 DEPENDS = "networkmanager libnl dbus dbus-glib hal wireless-tools policykit gnutls util-linux-ng ppp"
-RDEPENDS = "wpa-supplicant dhcp-client \
+RDEPENDS_${PN} = "wpa-supplicant dhcp-client \
            ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \
            "
 
diff --git a/recipes/networkmanager/networkmanager-openvpn_0.8.bb b/recipes/networkmanager/networkmanager-openvpn_0.8.bb
index dab9899..0750bac 100644
--- a/recipes/networkmanager/networkmanager-openvpn_0.8.bb
+++ b/recipes/networkmanager/networkmanager-openvpn_0.8.bb
@@ -3,7 +3,7 @@ SECTION = "net/misc"
 LICENSE = "GPL"
 PRIORITY = "optional"
 DEPENDS = "networkmanager libnl dbus dbus-glib hal wireless-tools policykit gnutls util-linux-ng ppp libglade gnome-keyring"
-RDEPENDS = "wpa-supplicant dhcp-client \
+RDEPENDS_${PN} = "wpa-supplicant dhcp-client \
            ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \
            "
 
diff --git a/recipes/networkmanager/networkmanager-pre0.7.inc b/recipes/networkmanager/networkmanager-pre0.7.inc
index e1b8091..73d8b7e 100644
--- a/recipes/networkmanager/networkmanager-pre0.7.inc
+++ b/recipes/networkmanager/networkmanager-pre0.7.inc
@@ -3,7 +3,7 @@ SECTION = "net/misc"
 LICENSE = "GPL"
 PRIORITY = "optional"
 DEPENDS = "libnl dbus dbus-glib hal wireless-tools ppp policykit gnutls"
-RDEPENDS = "hal wpa-supplicant iproute2 dhcp-client dhcdbd"
+RDEPENDS_${PN} = "hal wpa-supplicant iproute2 dhcp-client dhcdbd"
 
 # Providers that require this file MUST append the source to SRC_URI
 # These are just the common patches
diff --git a/recipes/networkmanager/networkmanager.inc b/recipes/networkmanager/networkmanager.inc
index c159883..82d016f 100644
--- a/recipes/networkmanager/networkmanager.inc
+++ b/recipes/networkmanager/networkmanager.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 HOMEPAGE = "http://www.gnome.org"
 PRIORITY = "optional"
 DEPENDS = "libnl dbus dbus-glib hal gconf wireless-tools ppp"
-RDEPENDS = "hal wpa-supplicant iproute2 dhcp-client dhcdbd"
+RDEPENDS_${PN} = "hal wpa-supplicant iproute2 dhcp-client dhcdbd"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/0.6/NetworkManager-${PV}.tar.bz2 \
 	  file://25NetworkManager \
diff --git a/recipes/networkmanager/networkmanager_0.6.4.bb b/recipes/networkmanager/networkmanager_0.6.4.bb
index f7f9746..ee65477 100644
--- a/recipes/networkmanager/networkmanager_0.6.4.bb
+++ b/recipes/networkmanager/networkmanager_0.6.4.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 HOMEPAGE = "http://www.gnome.org"
 PRIORITY = "optional"
 DEPENDS = "libnl dbus dbus-glib libhal-nm libgpewidget gnome-keyring gconf wireless-tools libglade"
-RDEPENDS = "wpa-supplicant iproute2 dhcdbd gnome-keyring hicolor-icon-theme"
+RDEPENDS_${PN} = "wpa-supplicant iproute2 dhcdbd gnome-keyring hicolor-icon-theme"
 
 PR = "r6"
 
diff --git a/recipes/nfs-utils/nfs-utils_1.0.6.bb b/recipes/nfs-utils/nfs-utils_1.0.6.bb
index e847c86..3a07856 100644
--- a/recipes/nfs-utils/nfs-utils_1.0.6.bb
+++ b/recipes/nfs-utils/nfs-utils_1.0.6.bb
@@ -20,8 +20,8 @@ PARALLEL_MAKE = ""
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-RDEPENDS = "portmap"
-RRECOMMENDS = "kernel-module-nfsd"
+RDEPENDS_${PN} = "portmap"
+RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
 INITSCRIPT_NAME = "nfsserver"
 # The server has no dependencies at the user run levels, so just put
diff --git a/recipes/nfs-utils/nfs-utils_1.1.2.bb b/recipes/nfs-utils/nfs-utils_1.1.2.bb
index be45310..5d3352e 100644
--- a/recipes/nfs-utils/nfs-utils_1.1.2.bb
+++ b/recipes/nfs-utils/nfs-utils_1.1.2.bb
@@ -20,8 +20,8 @@ PARALLEL_MAKE = ""
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-RDEPENDS = "portmap"
-RRECOMMENDS = "kernel-module-nfsd"
+RDEPENDS_${PN} = "portmap"
+RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
 INITSCRIPT_NAME = "nfsserver"
 # The server has no dependencies at the user run levels, so just put
diff --git a/recipes/nonworking/e2fsprogs/e2fsprogs.inc b/recipes/nonworking/e2fsprogs/e2fsprogs.inc
index 119efb0..f9dae6e 100644
--- a/recipes/nonworking/e2fsprogs/e2fsprogs.inc
+++ b/recipes/nonworking/e2fsprogs/e2fsprogs.inc
@@ -106,7 +106,7 @@ pkg_prerm_e2fsprogs-mke2fs () {
 }
 
 # blkid used to be part of e2fsprogs but is useful outside, add it
-# as an RDEPENDS so that anything relying on it being in e2fsprogs
+# as an RDEPENDS_${PN} so that anything relying on it being in e2fsprogs
 # still works
 RDEPENDS_e2fsprogs = "util-linux-ng e2fsprogs-badblocks"
 
diff --git a/recipes/nonworking/e2fsprogs/e2fsprogs_1.41.2.bb b/recipes/nonworking/e2fsprogs/e2fsprogs_1.41.2.bb
index c35193d..13b0154 100644
--- a/recipes/nonworking/e2fsprogs/e2fsprogs_1.41.2.bb
+++ b/recipes/nonworking/e2fsprogs/e2fsprogs_1.41.2.bb
@@ -30,7 +30,7 @@ do_stage () {
 }
 
 # blkid used to be part of e2fsprogs but is useful outside, add it
-# as an RDEPENDS so that anything relying on it being in e2fsprogs
+# as an RDEPENDS_${PN} so that anything relying on it being in e2fsprogs
 # still works
 RDEPENDS_e2fsprogs = "e2fsprogs-blkid e2fsprogs-uuidgen e2fsprogs-badblocks"
 
diff --git a/recipes/nonworking/gpe-contacts/gpe-contacts-hildon_0.40.bb b/recipes/nonworking/gpe-contacts/gpe-contacts-hildon_0.40.bb
index 240a678..e65c15c 100644
--- a/recipes/nonworking/gpe-contacts/gpe-contacts-hildon_0.40.bb
+++ b/recipes/nonworking/gpe-contacts/gpe-contacts-hildon_0.40.bb
@@ -4,7 +4,7 @@ PR ="r2"
 SRC_URI = "${GPE_MIRROR}/gpe-contacts-${PV}.tar.bz2"
 
 DEPENDS += "gtk+-2.6.4-1.osso7 libgpepimc-hildon libosso hildon-lgpl"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 EXTRA_OECONF += "--enable-hildon"
 
diff --git a/recipes/nonworking/gpe-contacts/gpe-contacts-hildon_0.42.bb b/recipes/nonworking/gpe-contacts/gpe-contacts-hildon_0.42.bb
index 63a8864..e8ccced 100644
--- a/recipes/nonworking/gpe-contacts/gpe-contacts-hildon_0.42.bb
+++ b/recipes/nonworking/gpe-contacts/gpe-contacts-hildon_0.42.bb
@@ -4,7 +4,7 @@ PR ="r2"
 SRC_URI = "${GPE_MIRROR}/gpe-contacts-${PV}.tar.bz2"
 
 DEPENDS += "gtk+-2.6.4-1.osso7 libgpepimc-hildon libosso hildon-lgpl"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 EXTRA_OECONF += "--enable-hildon"
 
diff --git a/recipes/nonworking/gpe-contacts/gpe-contacts.inc b/recipes/nonworking/gpe-contacts/gpe-contacts.inc
index e6af955..b98d6b3 100644
--- a/recipes/nonworking/gpe-contacts/gpe-contacts.inc
+++ b/recipes/nonworking/gpe-contacts/gpe-contacts.inc
@@ -5,7 +5,7 @@ PR = "r0"
 
 DEPENDS = "libgpewidget libdisplaymigration libgpevtype dbus"
 SECTION = "gpe"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 DESCRIPTION = "GPE contacts manager"
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.bz2"
 
diff --git a/recipes/nonworking/greader/greader_0.61.bb b/recipes/nonworking/greader/greader_0.61.bb
index a75d208..d3a1459 100644
--- a/recipes/nonworking/greader/greader_0.61.bb
+++ b/recipes/nonworking/greader/greader_0.61.bb
@@ -3,7 +3,7 @@ inherit autotools gpe
 DESCRIPTION = "GReader"
 DEPENDS = "libgpewidget zlib"
 SECTION = "gpe/applications"
-#RDEPENDS = "gpe-icons"
+#RDEPENDS_${PN} = "gpe-icons"
 
 SRC_URI = "http://handhelds.org/~gberenfield/${PN}_${PV}_src.tgz \
            file://greader.patch"
diff --git a/recipes/nonworking/icecast/icecast_2.2.0.bb b/recipes/nonworking/icecast/icecast_2.2.0.bb
index 0d7f06a..59f607c 100644
--- a/recipes/nonworking/icecast/icecast_2.2.0.bb
+++ b/recipes/nonworking/icecast/icecast_2.2.0.bb
@@ -3,9 +3,9 @@ LICENSE = "GPLv2"
 
 DEPENDS = "libvorbis libogg libxslt"
 
-# The RDEPENDS line is a workaround to make sure
+# The RDEPENDS_${PN} line is a workaround to make sure
 # icecast pulls in necessary library deps.
-RDEPENDS = "libvorbis libogg libxslt"
+RDEPENDS_${PN} = "libvorbis libogg libxslt"
 
 SRC_URI = "http://downloads.us.xiph.org/releases/icecast/${PN}-${PV}.tar.gz"
 
diff --git a/recipes/nonworking/imkit/imkit_0.4.5.bb b/recipes/nonworking/imkit/imkit_0.4.5.bb
index 90d41fa..1a735aa 100644
--- a/recipes/nonworking/imkit/imkit_0.4.5.bb
+++ b/recipes/nonworking/imkit/imkit_0.4.5.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "An Inputmethod for Opie - frontend to the japanese anthy engine"
 HOMEPAGE = "http://zaurus-ja.sourceforge.jp/imkit-anthy.html.en"
 SECTION = "opie/inputmethods"
 LICENSE = "GPL"
-RDEPENDS = "anthy"
+RDEPENDS_${PN} = "anthy"
 
 SRC_URI = "http://downloads.sourceforge.jp/zaurus-ja/9316/imkit-0.4.5.tar.gz"
 S = "${WORKDIR}/imkit-${PV}"
diff --git a/recipes/nonworking/linux/linux-mtx-1_2.4.24.bb b/recipes/nonworking/linux/linux-mtx-1_2.4.24.bb
index 52f5d9d..728ea1b 100644
--- a/recipes/nonworking/linux/linux-mtx-1_2.4.24.bb
+++ b/recipes/nonworking/linux/linux-mtx-1_2.4.24.bb
@@ -2,7 +2,7 @@ SECTION = "kernel"
 DESCRIPTION = "Linux kernel for MTX-1 (MeshCube)"
 LICENSE = "GPL"
 KV = "${PV}"
-RDEPENDS = "mtd-utils"
+RDEPENDS_${PN} = "mtd-utils"
 PR ="r2"
 
 SRC_URI = "cvs://cvs:cvs@ftp.linux-mips.org/home/cvs;module=linux;tag=linux_2_4_24_pre2 \
diff --git a/recipes/nonworking/meta/meta-gpephone.bb b/recipes/nonworking/meta/meta-gpephone.bb
index 9c11890..0a80341 100644
--- a/recipes/nonworking/meta/meta-gpephone.bb
+++ b/recipes/nonworking/meta/meta-gpephone.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Meta-package for GPE Palmtop Environment Phone packages"
 LICENSE = "MIT"
 PR = "r1"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     gpephone-task-base \
     gpephone-task-settings \
     gpephone-task-pim \
diff --git a/recipes/nonworking/meta/meta-sectest-gpe.bb b/recipes/nonworking/meta/meta-sectest-gpe.bb
index b8f8815..288f0fb 100644
--- a/recipes/nonworking/meta/meta-sectest-gpe.bb
+++ b/recipes/nonworking/meta/meta-sectest-gpe.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Meta-package for GPE Security Testing Image"
 LICENSE = "MIT"
 PR = "r6"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     gpe-task-base \
     gpe-base-depends \
     gpe-task-base \
diff --git a/recipes/nonworking/monotone-viz/monotone-viz_0.11.bb b/recipes/nonworking/monotone-viz/monotone-viz_0.11.bb
index de77958..968c93e 100644
--- a/recipes/nonworking/monotone-viz/monotone-viz_0.11.bb
+++ b/recipes/nonworking/monotone-viz/monotone-viz_0.11.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =	"Monotone-viz is a small GTK+ application that visualizes monotone ancestry graphs."
 DEPENDS =	"gtk+ libgnomecanvas lablgtk sqlite3 ocaml-cross"
-RDEPENDS =	"graphviz"
+RDEPENDS_${PN} =	"graphviz"
 
 
 SRC_URI =	"http://oandrieu.nerim.net/monotone-viz/archive/monotone-viz-0.11.tar.gz"
diff --git a/recipes/nonworking/opie-mediaplayer1-libmpeg3plugin/opie-mediaplayer1-libmpeg3plugin_cvs.bb b/recipes/nonworking/opie-mediaplayer1-libmpeg3plugin/opie-mediaplayer1-libmpeg3plugin_cvs.bb
index 95a41a5..ca6e9a2 100644
--- a/recipes/nonworking/opie-mediaplayer1-libmpeg3plugin/opie-mediaplayer1-libmpeg3plugin_cvs.bb
+++ b/recipes/nonworking/opie-mediaplayer1-libmpeg3plugin/opie-mediaplayer1-libmpeg3plugin_cvs.bb
@@ -3,7 +3,7 @@ SECTION = "opie/codecs"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "opie-mediaplayer1"
-RDEPENDS = "opie-mediaplayer1"
+RDEPENDS_${PN} = "opie-mediaplayer1"
 PV = "${OPIE_CVS_PV}"
 APPNAME = "mpeg3plugin"
 
diff --git a/recipes/nonworking/pixdev/pixdev-stable_0.1.bb b/recipes/nonworking/pixdev/pixdev-stable_0.1.bb
index 405b802..59e2a73 100644
--- a/recipes/nonworking/pixdev/pixdev-stable_0.1.bb
+++ b/recipes/nonworking/pixdev/pixdev-stable_0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Pixil Operating Environment"
 SECTION = "gui"
 PRIORITY = "optional"
 DEPENDS = "microwindows"
-RDEPENDS = "microwindows"
+RDEPENDS_${PN} = "microwindows"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pixdev/pixdev-stable-${PV}.tar.gz \
           file://${FILESDIR}/braces.patch"
diff --git a/recipes/nonworking/python/python-gsl_0.2.0.bb b/recipes/nonworking/python/python-gsl_0.2.0.bb
index 7673f23..8f94f5a 100644
--- a/recipes/nonworking/python/python-gsl_0.2.0.bb
+++ b/recipes/nonworking/python/python-gsl_0.2.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GNU Scientific Library Python Bindings"
 SECTION = "base"
 PRIORITY = "optional"
 DEPENDS = "gsl"
-RDEPENDS = "python-core gsl"
+RDEPENDS_${PN} = "python-core gsl"
 SRCNAME = "pygsl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
diff --git a/recipes/nonworking/python/python-pyx_0.6.bb b/recipes/nonworking/python/python-pyx_0.6.bb
index 53a0796..d422805 100644
--- a/recipes/nonworking/python/python-pyx_0.6.bb
+++ b/recipes/nonworking/python/python-pyx_0.6.bb
@@ -3,7 +3,7 @@ It provides both an abstraction of PostScript and a TeX/LaTeX interface. Complex
 2d and 3d plots in publication-ready quality are built out of these primitives."
 SECTION = "devel/python"
 PRIORITY = "optional"
-RDEPENDS = "python-core"
+RDEPENDS_${PN} = "python-core"
 DEPENDS = "kpsewhich-native"
 SRCNAME = "PyX"
 
diff --git a/recipes/nonworking/python/python-sword_1.5.10.bb b/recipes/nonworking/python/python-sword_1.5.10.bb
index 744c53d..bb41993 100644
--- a/recipes/nonworking/python/python-sword_1.5.10.bb
+++ b/recipes/nonworking/python/python-sword_1.5.10.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python bindings for the sword library"
 SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "python-core sword"
+RDEPENDS_${PN} = "python-core sword"
 DEPENDS = "sword-${PV} swig-native"
 SRCNAME = "sword"
 PR = "r0"
diff --git a/recipes/notifier/notifier_0.2.bb b/recipes/notifier/notifier_0.2.bb
index 15ef00a..6dac95a 100644
--- a/recipes/notifier/notifier_0.2.bb
+++ b/recipes/notifier/notifier_0.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A notifier for new calls and messages"
 HOMEPAGE = "http://www.telefoninux.org"
 AUTHOR = "Pietro Montorfano"
 LICENSE = "GPLv3"
-RDEPENDS = "python-elementary python python-edbus"
+RDEPENDS_${PN} = "python-elementary python python-edbus"
 SECTION = "x11/application"
 PR = "r2"
 
diff --git a/recipes/ntfs-3g/ntfs-3g_1.0.bb b/recipes/ntfs-3g/ntfs-3g_1.0.bb
index 4991885..02dea3c 100644
--- a/recipes/ntfs-3g/ntfs-3g_1.0.bb
+++ b/recipes/ntfs-3g/ntfs-3g_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The NTFS-3G driver is an open source, freely available NTFS drive
 HOMEPAGE = "http://www.ntfs-3g.org/"
 LICENSE = "GPLv2"
 DEPENDS = "fuse"
-RDEPENDS = "fuse"
+RDEPENDS_${PN} = "fuse"
 PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/ntfs-3g/ntfs-3g_2009.4.4.bb b/recipes/ntfs-3g/ntfs-3g_2009.4.4.bb
index c8b6f75..b01f181 100644
--- a/recipes/ntfs-3g/ntfs-3g_2009.4.4.bb
+++ b/recipes/ntfs-3g/ntfs-3g_2009.4.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The NTFS-3G driver is an open source, freely available NTFS drive
 HOMEPAGE = "http://www.ntfs-3g.org/"
 LICENSE = "GPLv2"
 DEPENDS = "fuse"
-RDEPENDS = "fuse"
+RDEPENDS_${PN} = "fuse"
 
 SRC_URI = http://www.ntfs-3g.org/ntfs-3g-${PV}.tgz
 
diff --git a/recipes/ntpclient/ntpclient_2003_194.bb b/recipes/ntpclient/ntpclient_2003_194.bb
index beb082d..8b224da 100644
--- a/recipes/ntpclient/ntpclient_2003_194.bb
+++ b/recipes/ntpclient/ntpclient_2003_194.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "NTP (RFC-1305) client for unix-alike computers"
 HOMEPAGE = "http://doolittle.icarus.com/ntpclient"
 AUTHOR = "Larry Doolittle <larry@doolittle.boa.org>"
-RDEPENDS = "busybox"
+RDEPENDS_${PN} = "busybox"
 SECTION = "admin"
 LICENSE = "GPLv2"
 PR = "r1"
diff --git a/recipes/ntpclient/ntpclient_2007_365.bb b/recipes/ntpclient/ntpclient_2007_365.bb
index 90a4f3a..f3c85df 100644
--- a/recipes/ntpclient/ntpclient_2007_365.bb
+++ b/recipes/ntpclient/ntpclient_2007_365.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "NTP (RFC-1305) client for unix-alike computers"
 HOMEPAGE = "http://doolittle.icarus.com/ntpclient"
 AUTHOR = "Larry Doolittle <larry@doolittle.boa.org>"
-RDEPENDS = "busybox"
+RDEPENDS_${PN} = "busybox"
 SECTION = "admin"
 LICENSE = "GPLv2"
 PR = "r2"
diff --git a/recipes/numptyphysics/numptyphysics_svn.bb b/recipes/numptyphysics/numptyphysics_svn.bb
index 23920c6..2f6aa2d 100644
--- a/recipes/numptyphysics/numptyphysics_svn.bb
+++ b/recipes/numptyphysics/numptyphysics_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Numpty Physics is a drawing puzzle game in the spirit (and style?) \
 of Crayon Physics using the same excellent Box2D engine."
 DEPENDS = "virtual/libsdl libsdl-image libpng"
-RDEPENDS += "libpng"
+RDEPENDS_${PN} += "libpng"
 LICENSE = "GPL"
 HOMEPAGE = "http://numptyphysics.garage.maemo.org/"
 SECTION = "x11/games"
diff --git a/recipes/nunome/nunome_1.0.2.bb b/recipes/nunome/nunome_1.0.2.bb
index d1a0ff6..1d98028 100644
--- a/recipes/nunome/nunome_1.0.2.bb
+++ b/recipes/nunome/nunome_1.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.sikigami.com/nunome-Qtopia-1.0/"
 SECTION = "opie/inputmethods"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "virtual-japanese-font"
+RDEPENDS_${PN} = "virtual-japanese-font"
 PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/gakusei/nunome-${PV}.tar.bz2 \
diff --git a/recipes/nxcl/libnxcl_0.9.bb b/recipes/nxcl/libnxcl_0.9.bb
index 7b860b9..6900248 100644
--- a/recipes/nxcl/libnxcl_0.9.bb
+++ b/recipes/nxcl/libnxcl_0.9.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPL"
 PR = "r2"
 
-RDEPENDS = "nxproxy nxssh"
+RDEPENDS_${PN} = "nxproxy nxssh"
 
 SRC_URI = "http://download.berlios.de/freenx/freenx-client-${PV}.tar.bz2 \
 	   file://gcc4.3-ftbfs.patch \
diff --git a/recipes/nylon/nylon-config.bb b/recipes/nylon/nylon-config.bb
index 66e8e78..7228e83 100644
--- a/recipes/nylon/nylon-config.bb
+++ b/recipes/nylon/nylon-config.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 MAINTAINER = "Bruno Randolf <bruno.randolf@4g-systems.biz>"
 LICENSE = "closed"
 DEPENDS = "perl virtual/kernel hostap-daemon busybox"
-RDEPENDS = "perl perl-module-exporter perl-module-posix perl-module-autoloader perl-module-strict perl-module-xsloader perl-module-data-dumper perl-module-carp perl-module-bytes perl-module-overload perl-module-warnings-register perl-module-warnings  kernel-module-aes madwifi-modules hostap-daemon simple-firewall wlan-ng-utils busybox-httpd"
+RDEPENDS_${PN} = "perl perl-module-exporter perl-module-posix perl-module-autoloader perl-module-strict perl-module-xsloader perl-module-data-dumper perl-module-carp perl-module-bytes perl-module-overload perl-module-warnings-register perl-module-warnings  kernel-module-aes madwifi-modules hostap-daemon simple-firewall wlan-ng-utils busybox-httpd"
 CVSDATE = "20051026"
 PV = "cvs${CVSDATE}"
 
diff --git a/recipes/nylon/nylon-scripts_cvs.bb b/recipes/nylon/nylon-scripts_cvs.bb
index 6a253a6..e22be32 100644
--- a/recipes/nylon/nylon-scripts_cvs.bb
+++ b/recipes/nylon/nylon-scripts_cvs.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 SRCDATE = "20051022"
 PV = "1.0.0+cvs${SRCDATE}"
 PR = "r2"
-RDEPENDS = "bash"
+RDEPENDS_${PN} = "bash"
 
 SRC_URI = "http://download.berlin.freifunk.net/meshcube.org/nylon/stable/sources/${PN}_gruen.4g__${SRCDATE}.tar.gz \
 	file://firewall-bash.diff"
diff --git a/recipes/nylon/nylon-statistics.bb b/recipes/nylon/nylon-statistics.bb
index abed005..03cfe0c 100644
--- a/recipes/nylon/nylon-statistics.bb
+++ b/recipes/nylon/nylon-statistics.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "statistics & graphing for nylon"
-RDEPENDS = "rrdtool"
+RDEPENDS_${PN} = "rrdtool"
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
diff --git a/recipes/nylon/simple-firewall.bb b/recipes/nylon/simple-firewall.bb
index 8e34f3a..f78002b 100644
--- a/recipes/nylon/simple-firewall.bb
+++ b/recipes/nylon/simple-firewall.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL"
 DEPENDS = "virtual/kernel"
 # these kernel modules are needed if the functionality is not hard-built into the kernel:
 # kernel-module-ip-tables kernel-module-iptable-filter kernel-module-iptable-nat kernel-module-ipt-state kernel-module-ipt-reject kernel-module-ipt-masquerade 
-RDEPENDS = "kernel-module-ipt-limit kernel-module-ipt-tcpmss"
+RDEPENDS_${PN} = "kernel-module-ipt-limit kernel-module-ipt-tcpmss"
 PV = "cvs20051022"
 
 SRC_URI = "http://br1.einfach.org/nylon/stable/sources/simple-firewall_gruen.4g__20051022.tar.gz \
diff --git a/recipes/obsolete/antlr/antlr_2.7.5.bb b/recipes/obsolete/antlr/antlr_2.7.5.bb
index fceb965..3b273ee 100644
--- a/recipes/obsolete/antlr/antlr_2.7.5.bb
+++ b/recipes/obsolete/antlr/antlr_2.7.5.bb
@@ -6,7 +6,7 @@ LICENSE = "PD"
 PRIORITY = "optional"
 SECTION = "devel"
 # DEPENDS += "virtual/java"
-RDEPENDS += "java-virtual-machine"
+RDEPENDS_${PN} += "java-virtual-machine"
 
 SRC_URI = "http://www.antlr.org/download/antlr-${PV}.tar.gz \
 	   file://install.patch"
diff --git a/recipes/obsolete/ffalarms/ffalarms_0.2.2.bb b/recipes/obsolete/ffalarms/ffalarms_0.2.2.bb
index 292c25a..70a35a1 100644
--- a/recipes/obsolete/ffalarms/ffalarms_0.2.2.bb
+++ b/recipes/obsolete/ffalarms/ffalarms_0.2.2.bb
@@ -16,7 +16,7 @@ inherit distutils
 
 FILES_${PN} += "${datadir}/${PN} ${datadir}/applications/ffalarms.desktop ${datadir}/pixmaps"
 
-RDEPENDS += "python-re python-datetime python-edje python-ecore \
+RDEPENDS_${PN} += "python-re python-datetime python-edje python-ecore \
              atd-over-fso alsa-utils-amixer alsa-utils-alsactl \
              ttf-dejavu-sans"
 
diff --git a/recipes/obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb b/recipes/obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb
index 392c8bc..c0ae618 100644
--- a/recipes/obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb
+++ b/recipes/obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb
@@ -8,7 +8,7 @@ RPROVIDES = "gnome-vfs"
 inherit gnome pkgconfig
 
 DEPENDS = "libxml2 gconf-osso dbus-0.23.1-osso5 bzip2 gnome-mime-data zlib samba osso-gwconnect"
-RRECOMMENDS = "gnome-vfs-plugin-file shared-mime-info"
+RRECOMMENDS_${PN} = "gnome-vfs-plugin-file shared-mime-info"
 
 SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/o/${PN}/${PN}_${PV}.tar.gz \
            file://gconftool-lossage.patch"
diff --git a/recipes/obsolete/openmoko-3rdparty/babiloo-efl_2.0.9-3.bb b/recipes/obsolete/openmoko-3rdparty/babiloo-efl_2.0.9-3.bb
index 4bff706..e9b0a56 100644
--- a/recipes/obsolete/openmoko-3rdparty/babiloo-efl_2.0.9-3.bb
+++ b/recipes/obsolete/openmoko-3rdparty/babiloo-efl_2.0.9-3.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 AUTHOR = "Luca Vaudano <vaudano@gmail.com>"
 HOMEPAGE = "http://babiloo-project.org"
-RDEPENDS = "python-elementary python-compression python-misc python-netclient"
+RDEPENDS_${PN} = "python-elementary python-compression python-misc python-netclient"
 
 PACKAGE_ARCH = "all"
 
diff --git a/recipes/obsolete/openmoko-3rdparty/babiloo-efl_2.0.9-4.bb b/recipes/obsolete/openmoko-3rdparty/babiloo-efl_2.0.9-4.bb
index 2964584..32ca643 100644
--- a/recipes/obsolete/openmoko-3rdparty/babiloo-efl_2.0.9-4.bb
+++ b/recipes/obsolete/openmoko-3rdparty/babiloo-efl_2.0.9-4.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 AUTHOR = "Luca Vaudano <vaudano@gmail.com>"
 HOMEPAGE = "http://babiloo-project.org"
-RDEPENDS = "python-elementary python-compression python-misc python-netclient"
+RDEPENDS_${PN} = "python-elementary python-compression python-misc python-netclient"
 
 PACKAGE_ARCH = "all"
 
diff --git a/recipes/obsolete/python/python-efl.inc b/recipes/obsolete/python/python-efl.inc
index 9ed7a4c..d8559ea 100644
--- a/recipes/obsolete/python/python-efl.inc
+++ b/recipes/obsolete/python/python-efl.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 # we need to build pyrex otherwise cython doesn't get called to build
 # the extension modules.
 DEPENDS = "python-cython-native python-pyrex-native python-numeric eina"
-RDEPENDS += "python-lang"
+RDEPENDS_${PN} += "python-lang"
 PV = "0.3.1+svnr${SRCPV}"
 PR = "ml0"
 
diff --git a/recipes/obsolete/python/python-epsilon_svn.bb b/recipes/obsolete/python/python-epsilon_svn.bb
index e70d4ec..8ef7220 100644
--- a/recipes/obsolete/python/python-epsilon_svn.bb
+++ b/recipes/obsolete/python/python-epsilon_svn.bb
@@ -1,6 +1,6 @@
 require python-efl.inc
 DEPENDS += "epsilon python-ecore"
-RDEPENDS += "python-ecore"
+RDEPENDS_${PN} += "python-ecore"
 
 SRCREV = "${EFL_SRCREV}"
 SRC_URI = "svn://svn.enlightenment.org/svn/e/OLD/BINDINGS/python;module=${PN};proto=http"
diff --git a/recipes/obsolete/python/python-etk_svn.bb b/recipes/obsolete/python/python-etk_svn.bb
index bc0ad98..54f9c6e 100644
--- a/recipes/obsolete/python/python-etk_svn.bb
+++ b/recipes/obsolete/python/python-etk_svn.bb
@@ -1,6 +1,6 @@
 require python-efl.inc
 DEPENDS += "etk python-evas python-ecore"
-RDEPENDS += "python-evas python-ecore python-edje python-numeric python-math etk-themes" 
+RDEPENDS_${PN} += "python-evas python-ecore python-edje python-numeric python-math etk-themes" 
 PV = "0.1.1+svnr${SRCPV}"
 PR = "ml1"
 
diff --git a/recipes/obsolete/shr/etk-theme.inc b/recipes/obsolete/shr/etk-theme.inc
index 6e8b33d..b7adb6a 100644
--- a/recipes/obsolete/shr/etk-theme.inc
+++ b/recipes/obsolete/shr/etk-theme.inc
@@ -1,6 +1,6 @@
 SECTION = "e/utils"
 DEPENDS = "edje-native"
-RDEPENDS = "etk"
+RDEPENDS_${PN} = "etk"
 
 S = "${WORKDIR}/git/etk/${PN}/"
 
diff --git a/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb b/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb
index b94914e..637aa36 100644
--- a/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb
+++ b/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nEo libframeworkd-phonegui-efl - a very fast, high contrast etk theme"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
-RDEPENDS = "libframeworkd-phonegui-efl"
+RDEPENDS_${PN} = "libframeworkd-phonegui-efl"
 RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo etk-theme-neo gpe-theme-neo icon-theme-neo"
 LICENSE = "unknown"
 
diff --git a/recipes/obsolete/tasks/task-bootstrap-unionroot.bb b/recipes/obsolete/tasks/task-bootstrap-unionroot.bb
index a4340eb..c780979 100644
--- a/recipes/obsolete/tasks/task-bootstrap-unionroot.bb
+++ b/recipes/obsolete/tasks/task-bootstrap-unionroot.bb
@@ -16,7 +16,7 @@ require task-bootstrap.inc
 
 HOTPLUG ?= "linux-hotplug"
 
-RDEPENDS = 'base-files base-passwd busybox \
+RDEPENDS_${PN} = 'base-files base-passwd busybox \
 	initscripts \
 	netbase sysvinit sysvinit-pidof tinylogin \
 	modutils-initscripts \
@@ -28,6 +28,6 @@ RDEPENDS = 'base-files base-passwd busybox \
 	unionroot \
 	unionroot-utils'
 
-RRECOMMENDS = 'dropbear portmap \
+RRECOMMENDS_${PN} = 'dropbear portmap \
 	${BOOTSTRAP_EXTRA_RRECOMMENDS}'
 LICENSE = "MIT"
diff --git a/recipes/obsolete/tasks/task-bootstrap.bb b/recipes/obsolete/tasks/task-bootstrap.bb
index ebe7805..af2a37d 100644
--- a/recipes/obsolete/tasks/task-bootstrap.bb
+++ b/recipes/obsolete/tasks/task-bootstrap.bb
@@ -13,7 +13,7 @@ require task-bootstrap.inc
 
 HOTPLUG ?= "linux-hotplug"
 
-RDEPENDS = 'base-files base-passwd busybox \
+RDEPENDS_${PN} = 'base-files base-passwd busybox \
 	initscripts \
 	netbase sysvinit sysvinit-pidof tinylogin \
 	modutils-initscripts fuser setserial\
@@ -21,6 +21,6 @@ RDEPENDS = 'base-files base-passwd busybox \
 	${BOOTSTRAP_EXTRA_RDEPENDS} \
 	${@bootstrap_modutils_rdepends(d)}'
 
-RRECOMMENDS = 'dropbear portmap \
+RRECOMMENDS_${PN} = 'dropbear portmap \
 	${BOOTSTRAP_EXTRA_RRECOMMENDS}'
 LICENSE = "MIT"
diff --git a/recipes/obsolete/xorg-xserver/xserver-xorg_1.6.1.bb b/recipes/obsolete/xorg-xserver/xserver-xorg_1.6.1.bb
index c2f2c06..4d0c0a2 100644
--- a/recipes/obsolete/xorg-xserver/xserver-xorg_1.6.1.bb
+++ b/recipes/obsolete/xorg-xserver/xserver-xorg_1.6.1.bb
@@ -2,7 +2,7 @@ require xorg-xserver-common.inc
 
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl xineramaproto libxinerama"
-RDEPENDS += "hal"
+RDEPENDS_${PN} += "hal"
 PE = "2"
 PR = "${INC_PR}.1"
 
diff --git a/recipes/obsolete/zd1211/zd1211_r77.bb b/recipes/obsolete/zd1211/zd1211_r77.bb
index c04e3db..54c938e 100644
--- a/recipes/obsolete/zd1211/zd1211_r77.bb
+++ b/recipes/obsolete/zd1211/zd1211_r77.bb
@@ -3,7 +3,7 @@ PRIORITY = "optional"
 SECTION = "kernel/modules"
 LICENSE = "GPL"
 PR = "r3"
-RDEPENDS = "wireless-tools"
+RDEPENDS_${PN} = "wireless-tools"
 
 SRC_URI = "http://zd1211.ath.cx/download/zd1211-driver-${PV}.tgz \
 	file://makefile.patch \
diff --git a/recipes/obsolete/zd1211/zd1211_r83.bb b/recipes/obsolete/zd1211/zd1211_r83.bb
index ad710da..8237682 100644
--- a/recipes/obsolete/zd1211/zd1211_r83.bb
+++ b/recipes/obsolete/zd1211/zd1211_r83.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://zd1211.ath.cx/"
 SECTION = "kernel/modules"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "wireless-tools"
+RDEPENDS_${PN} = "wireless-tools"
 PR = "r1"
 
 SRC_URI = "http://zd1211.ath.cx/download/zd1211-driver-${PV}.tgz \
diff --git a/recipes/octave/octave.inc b/recipes/octave/octave.inc
index a7161bb..57c2c35 100644
--- a/recipes/octave/octave.inc
+++ b/recipes/octave/octave.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/octave/"
 SECTION = "console/scientific"
 LICENSE = "GPL"
 DEPENDS = "gperf-native readline ncurses fftw"
-RDEPENDS = "libfftw3"
+RDEPENDS_${PN} = "libfftw3"
 # fftw compiled with --disable-fortran
 
 ARM_INSTRUCTION_SET = "arm"
diff --git a/recipes/offlineimap/offlineimap_4.0.14.bb b/recipes/offlineimap/offlineimap_4.0.14.bb
index fcfd1f9..eb41672 100644
--- a/recipes/offlineimap/offlineimap_4.0.14.bb
+++ b/recipes/offlineimap/offlineimap_4.0.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://gopher.quux.org:70/devel/offlineimap"
 LICENSE = "GPL"
 SECTION = "console/network"
 LICENSE = "GPL PSF"
-RDEPENDS = "python-re python-netclient python-lang \
+RDEPENDS_${PN} = "python-re python-netclient python-lang \
             python-threading python-stringold python-crypt python-mailbox"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/o/offlineimap/offlineimap_${PV}.tar.gz"
diff --git a/recipes/omview/omview_svn.bb b/recipes/omview/omview_svn.bb
index 8157820..7e65d2b 100644
--- a/recipes/omview/omview_svn.bb
+++ b/recipes/omview/omview_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "OMView"
 SECTION = "x11/graphics"
 PKG_TAGS_${PN} = "group::communication"
 DEPENDS += " evas ewl epsilon"
-RDEPENDS += " epsilon-thumbd"
+RDEPENDS_${PN} += " epsilon-thumbd"
 SRCREV = "34"
 PV = "0.0.1+svnr${SRCPV}"
 PR = "r2"
diff --git a/recipes/openbmap/openbmap-logger_0.2.0.bb b/recipes/openbmap/openbmap-logger_0.2.0.bb
index 8b027ab..ee61fb7 100644
--- a/recipes/openbmap/openbmap-logger_0.2.0.bb
+++ b/recipes/openbmap/openbmap-logger_0.2.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "openBmap logger and uploader of GPS/GSM data"
 SECTION = "x11/utils"
 DEPENDS = "python python-dbus python-pygobject python-pygtk libglade"
-RDEPENDS = "python-subprocess python-netclient python-math python-core python-io"
+RDEPENDS_${PN} = "python-subprocess python-netclient python-math python-core python-io"
 PR = "r1"
 
 inherit python-dir
diff --git a/recipes/openbmap/openbmap-logger_0.4.0.bb b/recipes/openbmap/openbmap-logger_0.4.0.bb
index 099694f..f364ccb 100644
--- a/recipes/openbmap/openbmap-logger_0.4.0.bb
+++ b/recipes/openbmap/openbmap-logger_0.4.0.bb
@@ -9,7 +9,7 @@ file://fsogsmd-fix.patch \
 
 inherit distutils
 
-RDEPENDS = "python python-dbus python-pygobject python-pygtk libglade \
+RDEPENDS_${PN} = "python python-dbus python-pygobject python-pygtk libglade \
 	python-subprocess python-netclient python-math python-core python-io frameworkd"
 
 FILES_${PN} += "${datadir}"
diff --git a/recipes/openbsc/openbsc.inc b/recipes/openbsc/openbsc.inc
index bb51e2b..d4549ee 100644
--- a/recipes/openbsc/openbsc.inc
+++ b/recipes/openbsc/openbsc.inc
@@ -2,7 +2,7 @@ DESCRITOPN = "OpenBSC a Free Software GSM BaseStationController"
 DEPENDS = "libdbi"
 HOMEPAGE = "http://openbsc.gnumonks.org"
 
-RDEPENDS = "libdbd-sqlite3"
+RDEPENDS_${PN} = "libdbd-sqlite3"
 
 INC_PR="r0"
 
diff --git a/recipes/opencv/opencv_1.0.0.bb b/recipes/opencv/opencv_1.0.0.bb
index 32ca2d0..60e0d5b 100644
--- a/recipes/opencv/opencv_1.0.0.bb
+++ b/recipes/opencv/opencv_1.0.0.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2"
 PR = "r2"
 
 DEPENDS = "libtool swig swig-native python jpeg zlib libpng tiff glib-2.0"
-#RDEPENDS = "python jpeg zlib libpng tiff glib-2.0"
+#RDEPENDS_${PN} = "python jpeg zlib libpng tiff glib-2.0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-${PV}.tar.gz \
           file://debian/010_enable_static.diff \
diff --git a/recipes/openjade/openjade_1.3.2.bb b/recipes/openjade/openjade_1.3.2.bb
index c7ea360..03af4e7 100644
--- a/recipes/openjade/openjade_1.3.2.bb
+++ b/recipes/openjade/openjade_1.3.2.bb
@@ -1,6 +1,6 @@
 SECTION = "unknown"
 DEPENDS = "opensp"
-RDEPENDS = "sgml-common"
+RDEPENDS_${PN} = "sgml-common"
 DESCRIPTION = "OpenJade is a suite of tools for validating, \
 processing, and applying DSSSL (Document Style Semantics and \
 Specification Language) stylesheets to SGML and XML documents."
diff --git a/recipes/openmoko-3rdparty/advancedcaching_git.bb b/recipes/openmoko-3rdparty/advancedcaching_git.bb
index f8f2fc2..3cb7f95 100644
--- a/recipes/openmoko-3rdparty/advancedcaching_git.bb
+++ b/recipes/openmoko-3rdparty/advancedcaching_git.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "GPL"
 HOMEPAGE = "http://www.opkg.org/package_268.html"
-RDEPENDS = "python-pygtk python-html python-image python-netclient python-misc python-sqlite3 python-mime python-json"
+RDEPENDS_${PN} = "python-pygtk python-html python-image python-netclient python-misc python-sqlite3 python-mime python-json"
 SRCREV = "9c3661f5573d2dd712437f1590070153d12e4c02"
 PV = "0.1.2+gitr${SRCPV}"
 
diff --git a/recipes/openmoko-3rdparty/babiloo-efl_2.0.9-10.bb b/recipes/openmoko-3rdparty/babiloo-efl_2.0.9-10.bb
index 76f3b60..1cbe45a 100644
--- a/recipes/openmoko-3rdparty/babiloo-efl_2.0.9-10.bb
+++ b/recipes/openmoko-3rdparty/babiloo-efl_2.0.9-10.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 AUTHOR = "Luca Vaudano <vaudano@gmail.com>"
 HOMEPAGE = "http://babiloo-project.org"
-RDEPENDS = "python-elementary python-compression python-misc python-netclient"
+RDEPENDS_${PN} = "python-elementary python-compression python-misc python-netclient"
 
 PACKAGE_ARCH = "all"
 
diff --git a/recipes/openmoko-3rdparty/babiloo-efl_bzr.bb b/recipes/openmoko-3rdparty/babiloo-efl_bzr.bb
index ce0e591..bfe8082 100644
--- a/recipes/openmoko-3rdparty/babiloo-efl_bzr.bb
+++ b/recipes/openmoko-3rdparty/babiloo-efl_bzr.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 AUTHOR = "Luca Vaudano <vaudano@gmail.com>"
 HOMEPAGE = "http://babiloo-project.org"
-RDEPENDS = "python-elementary python-compression python-misc python-netclient"
+RDEPENDS_${PN} = "python-elementary python-compression python-misc python-netclient"
 
 PACKAGE_ARCH = "all"
 
diff --git a/recipes/openmoko-3rdparty/calc_0.0.4.bb b/recipes/openmoko-3rdparty/calc_0.0.4.bb
index 1e261f8..b39d6d7 100644
--- a/recipes/openmoko-3rdparty/calc_0.0.4.bb
+++ b/recipes/openmoko-3rdparty/calc_0.0.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A simple calculator which is elementary-themed"
 HOMEPAGE = "http://github.com/spaetz/calc"
 AUTHOR = "Sebastian Spaeth <Sebastian@SSpaeth.de>"
 LICENSE  = "MIT"
-RDEPENDS = "python-elementary python python-edbus"
+RDEPENDS_${PN} = "python-elementary python python-edbus"
 SECTION = "x11/application"
 PR = "r0"
 
diff --git a/recipes/openmoko-3rdparty/calc_git.bb b/recipes/openmoko-3rdparty/calc_git.bb
index 9a21a2c..4976cdb 100644
--- a/recipes/openmoko-3rdparty/calc_git.bb
+++ b/recipes/openmoko-3rdparty/calc_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/spaetz/calc"
 AUTHOR = "Sebastian Spaeth <Sebastian@SSpaeth.de>"
 SHR_RELEASE ?= "shr"
 LICENSE  = "MIT"
-RDEPENDS = "python-elementary python python-edbus"
+RDEPENDS_${PN} = "python-elementary python python-edbus"
 SECTION = "x11/application"
 SRCREV = "cff7c833d4fce0d39de0812bfc9ed9e0eb8fac09"
 PV = "0.0.1+gitr${SRCPV}"
diff --git a/recipes/openmoko-3rdparty/emtooth_svn.bb b/recipes/openmoko-3rdparty/emtooth_svn.bb
index b1854fc..5073aa4 100644
--- a/recipes/openmoko-3rdparty/emtooth_svn.bb
+++ b/recipes/openmoko-3rdparty/emtooth_svn.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://code.google.com/p/emtooth/"
 SECTION = "x11/applications"
 LICENSE = "GPLv2"
 DEPENDS = "elementary eina edbus"
-RDEPENDS = "bluez4 obexd"
+RDEPENDS_${PN} = "bluez4 obexd"
 
 SRCREV = "77"
 PV = "0.1+svnr${SRCPV}"
diff --git a/recipes/openmoko-3rdparty/iliwi_git.bb b/recipes/openmoko-3rdparty/iliwi_git.bb
index 63d61d1..67564f4 100644
--- a/recipes/openmoko-3rdparty/iliwi_git.bb
+++ b/recipes/openmoko-3rdparty/iliwi_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 AUTHOR = "Esben Damgaard <ebbe@hvemder.dk>"
 DEPENDS = "dbus-glib elementary"
 # killall and udhcpc from busybox are enough
-RDEPENDS = "wireless-tools wpa-supplicant"
+RDEPENDS_${PN} = "wireless-tools wpa-supplicant"
 
 SRCREV = "5be2b301033418fb9a33759047274b676034f096"
 PV = "0.0.1+gitr${SRCPV}"
diff --git a/recipes/openmoko-3rdparty/neolight_svn.bb b/recipes/openmoko-3rdparty/neolight_svn.bb
index 8568072..1b00a85 100644
--- a/recipes/openmoko-3rdparty/neolight_svn.bb
+++ b/recipes/openmoko-3rdparty/neolight_svn.bb
@@ -17,7 +17,7 @@ inherit distutils
 
 FILES_${PN} += "${datadir}/neolight ${datadir}/applications/neolight.desktop ${datadir}/pixmaps/neolight.png"
 
-RDEPENDS += "python-edbus python-elementary"
+RDEPENDS_${PN} += "python-edbus python-elementary"
 
 do_compile_prepend() {
 	${STAGING_BINDIR_NATIVE}/edje_cc -id ${S}/data ${S}/data/neolight.edc
diff --git a/recipes/openmoko-3rdparty/neomis_svn.bb b/recipes/openmoko-3rdparty/neomis_svn.bb
index 1af7619..5a315f1 100644
--- a/recipes/openmoko-3rdparty/neomis_svn.bb
+++ b/recipes/openmoko-3rdparty/neomis_svn.bb
@@ -24,4 +24,4 @@ do_configure_prepend_shr() {
 
 FILES_${PN} += "${datadir}/neomis ${datadir}/applications/neomis.desktop ${datadir}/pixmaps"
 
-RDEPENDS += "python-audio python-pyalsaaudio python-elementary" 
+RDEPENDS_${PN} += "python-audio python-pyalsaaudio python-elementary" 
diff --git a/recipes/openmoko-3rdparty/numberx_svn.bb b/recipes/openmoko-3rdparty/numberx_svn.bb
index 3deaf6a..b5b93d6 100644
--- a/recipes/openmoko-3rdparty/numberx_svn.bb
+++ b/recipes/openmoko-3rdparty/numberx_svn.bb
@@ -17,6 +17,6 @@ SRC_URI = "svn://numberx.googlecode.com/svn;module=trunk;proto=http"
 
 inherit distutils
 
-RDEPENDS += "python-math python-elementary" 
+RDEPENDS_${PN} += "python-math python-elementary" 
 
 FILES_${PN} += "${datadir}"
diff --git a/recipes/openmoko-3rdparty/om-neon_svn.bb b/recipes/openmoko-3rdparty/om-neon_svn.bb
index 7e1f24e..11318a6 100644
--- a/recipes/openmoko-3rdparty/om-neon_svn.bb
+++ b/recipes/openmoko-3rdparty/om-neon_svn.bb
@@ -21,7 +21,7 @@ inherit distutils
 
 FILES_${PN} += "${datadir}/neon ${datadir}/applications/neon.desktop ${datadir}/pixmaps"
 
-RDEPENDS += "python-textutils python-evas python-ecore python-edje"
+RDEPENDS_${PN} += "python-textutils python-evas python-ecore python-edje"
 
 do_compile_prepend() {
 	sed -i "s/\/opt\/bin\/edje_cc -v/${@"${STAGING_BINDIR_NATIVE}".replace('/', '\/')}\/edje_cc/g" ${S}/build_edje.py
diff --git a/recipes/openmoko-3rdparty/openmoko-gps_0.0.1+svnr9.bb b/recipes/openmoko-3rdparty/openmoko-gps_0.0.1+svnr9.bb
index 4772c73..e4f311c 100644
--- a/recipes/openmoko-3rdparty/openmoko-gps_0.0.1+svnr9.bb
+++ b/recipes/openmoko-3rdparty/openmoko-gps_0.0.1+svnr9.bb
@@ -12,7 +12,7 @@ HOMEPAGE = "http://forge.bearstech.com/trac/wiki/OpenmokoGPS"
 SECTION = "base"
 LICENSE = "GPL"
 
-RDEPENDS = "python-pygtk"
+RDEPENDS_${PN} = "python-pygtk"
 
 PR = "r0" 
 
diff --git a/recipes/openmoko-3rdparty/pisi_0.5.3.bb b/recipes/openmoko-3rdparty/pisi_0.5.3.bb
index 08d3bbe..f82fa0b 100644
--- a/recipes/openmoko-3rdparty/pisi_0.5.3.bb
+++ b/recipes/openmoko-3rdparty/pisi_0.5.3.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 HOMEPAGE = "http://freshmeat.net/projects/pisiom"
 SRCNAME = "pisi"
 DEPENDS = "python-native"
-RDEPENDS = "python-vobject python-core python-pygtk python-pygobject python-pycairo\
+RDEPENDS_${PN} = "python-vobject python-core python-pygtk python-pygobject python-pycairo\
            python-gdata python-webdav python-ldap python-epydoc python-core\
            python-dateutil python-sqlite3 python-netserver python-netclient\
            python-misc python-ctypes libsyncml"
diff --git a/recipes/openmoko-3rdparty/podboy_svn.bb b/recipes/openmoko-3rdparty/podboy_svn.bb
index 08c0655..d633232 100644
--- a/recipes/openmoko-3rdparty/podboy_svn.bb
+++ b/recipes/openmoko-3rdparty/podboy_svn.bb
@@ -19,7 +19,7 @@ inherit distutils
 FILES_${PN} += "${datadir}/podboy ${datadir}/applications/podboy.desktop ${datadir}/pixmaps/podboy.png"
 
 DEPENDS = "${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)}"
-RDEPENDS += "python-compression python-elementary python-gst python-html python-netclient python-netserver python-sqlite3 python-subprocess gst-plugin-alsa gst-plugin-audioconvert gst-plugin-audioresample gst-plugin-bluez ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugin-mad', d)} gst-plugin-ogg gst-plugin-volume gst-plugin-vorbis"
+RDEPENDS_${PN} += "python-compression python-elementary python-gst python-html python-netclient python-netserver python-sqlite3 python-subprocess gst-plugin-alsa gst-plugin-audioconvert gst-plugin-audioresample gst-plugin-bluez ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugin-mad', d)} gst-plugin-ogg gst-plugin-volume gst-plugin-vorbis"
 
 do_compile_prepend() {
 	${STAGING_BINDIR_NATIVE}/edje_cc ${S}/data/podboy.edc
diff --git a/recipes/openmoko-3rdparty/rtmom_0.1.3.bb b/recipes/openmoko-3rdparty/rtmom_0.1.3.bb
index e858c73..f5c8f5d 100644
--- a/recipes/openmoko-3rdparty/rtmom_0.1.3.bb
+++ b/recipes/openmoko-3rdparty/rtmom_0.1.3.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 HOMEPAGE = "http://freshmeat.net/projects/rtmom"
 SRCNAME = "rtmom"
 DEPENDS = "python python-elementary"
-RDEPENDS = "python-core pyrtm"
+RDEPENDS_${PN} = "python-core pyrtm"
 RSUGGESTS_${PN} = "python-simplejson"
 
 PACKAGE_ARCH = "all"
diff --git a/recipes/openmoko-3rdparty/settingsgui_0.7+0.8-beta.bb b/recipes/openmoko-3rdparty/settingsgui_0.7+0.8-beta.bb
index 65e17fe..932f0a6 100644
--- a/recipes/openmoko-3rdparty/settingsgui_0.7+0.8-beta.bb
+++ b/recipes/openmoko-3rdparty/settingsgui_0.7+0.8-beta.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Openmoko Settings GUI"
 AUTHOR = "Kristian M."
 SECTION = "openmoko/applications"
-RDEPENDS = "python-pygtk python-subprocess python-threading"
+RDEPENDS_${PN} = "python-pygtk python-subprocess python-threading"
 LICENSE = "GPL"
 PR = "r0"
 
diff --git a/recipes/openmoko-3rdparty/spojegui_svn.bb b/recipes/openmoko-3rdparty/spojegui_svn.bb
index 6be7461..f1374ae 100644
--- a/recipes/openmoko-3rdparty/spojegui_svn.bb
+++ b/recipes/openmoko-3rdparty/spojegui_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 AUTHOR = "Josef Jebavy <josef.jebavy@gmail.com>"
 SECTION = "x11/applications"
 PRIORITY = "optional"
-RDEPENDS = "python-core python-elementary python-sqlite3 python-netclient"
+RDEPENDS_${PN} = "python-core python-elementary python-sqlite3 python-netclient"
 
 SRCREV = "64"
 PV = "0.4.2+svnr${SRCPV}"
diff --git a/recipes/openmoko-3rdparty/thone_0.7.bb b/recipes/openmoko-3rdparty/thone_0.7.bb
index 1ab44b9..6e71ab0 100644
--- a/recipes/openmoko-3rdparty/thone_0.7.bb
+++ b/recipes/openmoko-3rdparty/thone_0.7.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Terminal phone for OpenMoko/FSO"
 HOMEPAGE = "http://code.google.com/p/thone/"
 LICENSE = "GPLv3"
 AUTHOR = "pike"
-RDEPENDS = "bash python python-dbus"
+RDEPENDS_${PN} = "bash python python-dbus"
 PACKAGE_ARCH = "all"
 
 SRC_URI = "http://thone.googlecode.com/files/${P}.tgz;name=archive"
diff --git a/recipes/openmoko-3rdparty/ventura_svn.bb b/recipes/openmoko-3rdparty/ventura_svn.bb
index 6bfa4e4..dbb4d0e 100644
--- a/recipes/openmoko-3rdparty/ventura_svn.bb
+++ b/recipes/openmoko-3rdparty/ventura_svn.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://code.google.com/p/elm-browser/"
 SECTION = "e/apps"
 LICENSE = "GPLv2"
 DEPENDS = "elementary webkit-efl sqlite3"
-RRECOMMENDS = "ca-certificates"
+RRECOMMENDS_${PN} = "ca-certificates"
 PV = "0.2+svnr${SRCPV}"
 PR = "1"
 
diff --git a/recipes/openmoko-base/openmoko-session_svn.bb b/recipes/openmoko-base/openmoko-session_svn.bb
index 4b5e6e3..cdb02df 100644
--- a/recipes/openmoko-base/openmoko-session_svn.bb
+++ b/recipes/openmoko-base/openmoko-session_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Matchbox session files for Openmoko"
 SECTION = "openmoko/base"
-RDEPENDS = "matchbox-panel-2 matchbox-wm openmoko-today gconf"
+RDEPENDS_${PN} = "matchbox-panel-2 matchbox-wm openmoko-today gconf"
 PV = "0.1+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/recipes/openmoko-base/openmoko-sound-system_0.1.0.bb b/recipes/openmoko-base/openmoko-sound-system_0.1.0.bb
index 67fe16c..1ecf8b9 100644
--- a/recipes/openmoko-base/openmoko-sound-system_0.1.0.bb
+++ b/recipes/openmoko-base/openmoko-sound-system_0.1.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Openmoko Sound System"
 SECTION = "openmoko/base"
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   pulseaudio-server \
   pulseaudio-module-alsa-sink \
   pulseaudio-module-alsa-source \
diff --git a/recipes/openmoko-panel-plugins/openmoko-panel-memory_svn.bb b/recipes/openmoko-panel-plugins/openmoko-panel-memory_svn.bb
index 413f14e..76e6bf0 100644
--- a/recipes/openmoko-panel-plugins/openmoko-panel-memory_svn.bb
+++ b/recipes/openmoko-panel-plugins/openmoko-panel-memory_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Shows an out-of-memory warning in the Openmoko panel"
 DEPENDS = "libnotify"
-RDEPENDS = "openmoko-dialer2"
+RDEPENDS_${PN} = "openmoko-dialer2"
 SRCREV = "3903"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r0"
diff --git a/recipes/openmoko-projects/assassin-thumbnail_svn.bb b/recipes/openmoko-projects/assassin-thumbnail_svn.bb
index ccf5579..8e524c8 100644
--- a/recipes/openmoko-projects/assassin-thumbnail_svn.bb
+++ b/recipes/openmoko-projects/assassin-thumbnail_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Assassin Packages Thumbnails"
 HOMEPAGE = "http://assassin.projects.openmoko.org/"
 LICENSE = "GPL"
-RDEPENDS = "assassin"
+RDEPENDS_${PN} = "assassin"
 SRCREV = "4690"
 PV = "0.1+svnr${SRCPV}"
 PR = "r1"
diff --git a/recipes/openmoko-projects/assassin_svn.bb b/recipes/openmoko-projects/assassin_svn.bb
index 96189dc..8433c08 100644
--- a/recipes/openmoko-projects/assassin_svn.bb
+++ b/recipes/openmoko-projects/assassin_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Action GUI for Installer"
 HOMEPAGE = "http://assassin.projects.openmoko.org/"
 LICENSE = "GPL"
 DEPENDS = "dbus (>= 1.1.1) glib-2.0 e-wm packagekit etk edbus eet"
-RDEPENDS = "etk-theme-ninja"
+RDEPENDS_${PN} = "etk-theme-ninja"
 SRCREV = "268"
 PV = "0.2+svnr${SRCPV}"
 PR = "r6.04"
diff --git a/recipes/openmoko-projects/enlazar_svn.bb b/recipes/openmoko-projects/enlazar_svn.bb
index 1c16d53..eba09a6 100644
--- a/recipes/openmoko-projects/enlazar_svn.bb
+++ b/recipes/openmoko-projects/enlazar_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Enlazar - Network part for Assasin"
 HOMEPAGE = "http://enlazar.projects.openmoko.org/"
 LICENSE = "GPL"
 DEPENDS = "evas edje ecore edbus"
-RDEPENDS = "networkmanager"
+RDEPENDS_${PN} = "networkmanager"
 SRCREV = "37"
 PV = "0.1+svnr${SRCPV}"
 PR = "r4"
diff --git a/recipes/openmoko-projects/om-settings_svn.bb b/recipes/openmoko-projects/om-settings_svn.bb
index 13132c6..a46771d 100644
--- a/recipes/openmoko-projects/om-settings_svn.bb
+++ b/recipes/openmoko-projects/om-settings_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Exposure all devices on neo1973"
 DEPENDS = "python-etk python-edbus"
-RDEPENDS = "python-etk python-re python-codecs python-edbus python-pyxdg"
+RDEPENDS_${PN} = "python-etk python-re python-codecs python-edbus python-pyxdg"
 SRCREV = "74"
 PV = "0.0.1+svnr${SRCPV}"
 PR = "r3"
diff --git a/recipes/openmoko-projects/paroli_git.bb b/recipes/openmoko-projects/paroli_git.bb
index e3f2523..394c2c3 100644
--- a/recipes/openmoko-projects/paroli_git.bb
+++ b/recipes/openmoko-projects/paroli_git.bb
@@ -13,7 +13,7 @@ inherit distutils
 
 PACKAGES += "${PN}-autostart ${PN}-theme ${PN}-sounds ${PN}-calculator"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   python-datetime \
   python-subprocess \
   python-textutils \
diff --git a/recipes/openmoko-projects/pyefl-sudoku_svn.bb b/recipes/openmoko-projects/pyefl-sudoku_svn.bb
index 0cb9191..973dd77 100644
--- a/recipes/openmoko-projects/pyefl-sudoku_svn.bb
+++ b/recipes/openmoko-projects/pyefl-sudoku_svn.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyefl-sudoku.projects.openmoko.org/"
 SECTION = "openmoko/applications"
 LICENSE = "GPL"
 DEPENDS = "python-evas python-edje python-ecore"
-RDEPENDS = "python-evas python-edje python-ecore"
+RDEPENDS_${PN} = "python-evas python-edje python-ecore"
 SRCREV = "49"
 PV = "0.0.2+svnr${SRCPV}"
 PR = "r3"
diff --git a/recipes/openmoko-system/ompower_svn.bb b/recipes/openmoko-system/ompower_svn.bb
index 8ff55f8..a399d1a 100644
--- a/recipes/openmoko-system/ompower_svn.bb
+++ b/recipes/openmoko-system/ompower_svn.bb
@@ -4,7 +4,7 @@ DEPENDS = "ecore edbus"
 SRCREV = "4727"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r4"
-RDEPENDS = "initscripts"
+RDEPENDS_${PN} = "initscripts"
 
 SRCNAME = "ompower"
 S = "${WORKDIR}/${PN}"
diff --git a/recipes/openmoko2/neod_svn.bb b/recipes/openmoko2/neod_svn.bb
index eebb154..84f50f5 100644
--- a/recipes/openmoko2/neod_svn.bb
+++ b/recipes/openmoko2/neod_svn.bb
@@ -3,7 +3,7 @@ SECTION = "openmoko/daemons"
 
 DISTRO_APM ?= "apm"
 DEPENDS = "gtk+ pulseaudio apmd"
-RDEPENDS = "gpe-scap xrandr alsa-utils-amixer ${DISTRO_APM} dbus"
+RDEPENDS_${PN} = "gpe-scap xrandr alsa-utils-amixer ${DISTRO_APM} dbus"
 SRCREV = "4617"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r7"
diff --git a/recipes/openmoko2/openmoko-appearance_svn.bb b/recipes/openmoko2/openmoko-appearance_svn.bb
index 850305b..f7044ed 100644
--- a/recipes/openmoko2/openmoko-appearance_svn.bb
+++ b/recipes/openmoko2/openmoko-appearance_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Openmoko Appearance Editor"
 SECTION = "openmoko/pim"
 DEPENDS = "libmokoui2 gconf gtk+"
-RDEPENDS = "libedata-cal openmoko-today2-folders"
+RDEPENDS_${PN} = "libedata-cal openmoko-today2-folders"
 SRCREV = "3262"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r0"
diff --git a/recipes/openmoko2/openmoko-contacts2_svn.bb b/recipes/openmoko2/openmoko-contacts2_svn.bb
index 82d3d85..bcb0e8b 100644
--- a/recipes/openmoko2/openmoko-contacts2_svn.bb
+++ b/recipes/openmoko2/openmoko-contacts2_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Legacy Om address book application."
 SECTION = "openmoko/pim"
 DEPENDS = "libmokoui2 libmokojournal2 dbus-glib"
-RDEPENDS = "libedata-book"
+RDEPENDS_${PN} = "libedata-book"
 SRCREV = "419"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r6"
diff --git a/recipes/openmoko2/openmoko-dates2_svn.bb b/recipes/openmoko2/openmoko-dates2_svn.bb
index 6f6ce93..5f6f858 100644
--- a/recipes/openmoko2/openmoko-dates2_svn.bb
+++ b/recipes/openmoko2/openmoko-dates2_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Legacy Om calendar application."
 SECTION = "openmoko/pim"
 DEPENDS = "libmokoui2 libmokojournal2 gtk+ libglade eds-dbus libjana"
-RDEPENDS = "libedata-cal"
+RDEPENDS_${PN} = "libedata-cal"
 SRCREV = "703"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r3"
diff --git a/recipes/openmoko2/openmoko-mediaplayer2_svn.bb b/recipes/openmoko2/openmoko-mediaplayer2_svn.bb
index 2fabcc9..bf038e9 100644
--- a/recipes/openmoko2/openmoko-mediaplayer2_svn.bb
+++ b/recipes/openmoko2/openmoko-mediaplayer2_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Om application for playing media files."
 SECTION = "openmoko/tools"
 DEPENDS = "libmokoui2 expat gstreamer libspiff curl"
-RDEPENDS = "gst-meta-audio gconf gst-plugin-alsa"
+RDEPENDS_${PN} = "gst-meta-audio gconf gst-plugin-alsa"
 SRCREV = "4750"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r6"
diff --git a/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb b/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb
index ec45bfa..aa93cce 100644
--- a/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb
+++ b/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Openmoko Sound System"
 SECTION = "openmoko/base"
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   pulseaudio-server \
   pulseaudio-module-alsa-sink \
   pulseaudio-module-alsa-source \
diff --git a/recipes/openmoko2/openmoko-tasks2_svn.bb b/recipes/openmoko2/openmoko-tasks2_svn.bb
index 934c8d8..5ba07db 100644
--- a/recipes/openmoko2/openmoko-tasks2_svn.bb
+++ b/recipes/openmoko2/openmoko-tasks2_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Openmoko Agenda"
 SECTION = "openmoko/pim"
 DEPENDS = "dbus-glib eds-dbus libmokoui2"
-RDEPENDS = "libedata-cal"
+RDEPENDS_${PN} = "libedata-cal"
 SRCREV = "404"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r1"
diff --git a/recipes/openmoko2/openmoko-today2_svn.bb b/recipes/openmoko2/openmoko-today2_svn.bb
index 2ff5b90..2af2128 100644
--- a/recipes/openmoko2/openmoko-today2_svn.bb
+++ b/recipes/openmoko2/openmoko-today2_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Openmoko Application Launcher"
 SECTION = "openmoko/pim"
 DEPENDS = "libmokoui2 libmokojournal2 libjana startup-notification dbus-glib libice libsm"
-RDEPENDS = "libedata-cal openmoko-today2-folders"
+RDEPENDS_${PN} = "libedata-cal openmoko-today2-folders"
 SRCREV = "4168"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r2"
diff --git a/recipes/openmoko2/settingsgui_0.8.bb b/recipes/openmoko2/settingsgui_0.8.bb
index cc57052..b010f33 100644
--- a/recipes/openmoko2/settingsgui_0.8.bb
+++ b/recipes/openmoko2/settingsgui_0.8.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Openmoko Settings GUI"
 AUTHOR = "Kristian M."
 SECTION = "openmoko/applications"
-RDEPENDS = "python-pygtk python-subprocess python-threading"
+RDEPENDS_${PN} = "python-pygtk python-subprocess python-threading"
 LICENSE = "GPL"
 PR = "r0"
 
diff --git a/recipes/openprotium-init/openprotium-init_0.10.bb b/recipes/openprotium-init/openprotium-init_0.10.bb
index 7443fc9..6776d19 100644
--- a/recipes/openprotium-init/openprotium-init_0.10.bb
+++ b/recipes/openprotium-init/openprotium-init_0.10.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "required"
 LICENSE = "GPL"
 DEPENDS = "base-files devio"
-RDEPENDS = "busybox devio"
+RDEPENDS_${PN} = "busybox devio"
 PR = "r71"
 
 SRC_URI = "file://boot/flash \
diff --git a/recipes/openswan/openswan_2.2.0.bb b/recipes/openswan/openswan_2.2.0.bb
index a0bf652..d481ab1 100644
--- a/recipes/openswan/openswan_2.2.0.bb
+++ b/recipes/openswan/openswan_2.2.0.bb
@@ -4,7 +4,7 @@ Linux operating system."
 HOMEPAGE = "http://www.openswan.org"
 LICENSE = "GPLv2"
 DEPENDS = "gmp flex-native"
-RRECOMMENDS = "kernel-module-ipsec"
+RRECOMMENDS_${PN} = "kernel-module-ipsec"
 RDEPENDS_append_nylon = "perl"
 PR = "r6"
 
diff --git a/recipes/openswan/openswan_2.4.7.bb b/recipes/openswan/openswan_2.4.7.bb
index 0f154cf..862b18c 100644
--- a/recipes/openswan/openswan_2.4.7.bb
+++ b/recipes/openswan/openswan_2.4.7.bb
@@ -4,7 +4,7 @@ Linux operating system."
 HOMEPAGE = "http://www.openswan.org"
 LICENSE = "GPLv2"
 DEPENDS = "gmp flex-native"
-RRECOMMENDS = "kernel-module-ipsec"
+RRECOMMENDS_${PN} = "kernel-module-ipsec"
 RDEPENDS_append_nylon = "perl"
 PR = "r1"
 
diff --git a/recipes/opensync/libopensync-plugin-file_0.18.bb b/recipes/opensync/libopensync-plugin-file_0.18.bb
index cf44183..510ed28 100644
--- a/recipes/opensync/libopensync-plugin-file_0.18.bb
+++ b/recipes/opensync/libopensync-plugin-file_0.18.bb
@@ -3,7 +3,7 @@ SRC_URI = "http://ewi546.ewi.utwente.nl/OE/source/${P}.tar.gz"
 
 LICENSE = "LGPL"
 DEPENDS = "libopensync"
-RRECOMMENDS = "multisync"
+RRECOMMENDS_${PN} = "multisync"
 HOMEPAGE = "http://www.opensync.org/"
 
 inherit autotools pkgconfig
diff --git a/recipes/opensync/libopensync-plugin-gpe_0.18.bb b/recipes/opensync/libopensync-plugin-gpe_0.18.bb
index bfdaa34..18b2951 100644
--- a/recipes/opensync/libopensync-plugin-gpe_0.18.bb
+++ b/recipes/opensync/libopensync-plugin-gpe_0.18.bb
@@ -3,7 +3,7 @@ SRC_URI = "http://ewi546.ewi.utwente.nl/OE/source/${P}.tar.gz"
 
 LICENSE = "LGPL"
 DEPENDS = "libopensync"
-RRECOMMENDS = "multisync"
+RRECOMMENDS_${PN} = "multisync"
 HOMEPAGE = "http://www.opensync.org/"
 
 inherit autotools pkgconfig
diff --git a/recipes/opensync/libopensync-plugin-irmc_0.18.bb b/recipes/opensync/libopensync-plugin-irmc_0.18.bb
index e418b6c..9e8ff19 100644
--- a/recipes/opensync/libopensync-plugin-irmc_0.18.bb
+++ b/recipes/opensync/libopensync-plugin-irmc_0.18.bb
@@ -3,7 +3,7 @@ SRC_URI = "http://ewi546.ewi.utwente.nl/OE/source/${P}.tar.gz"
 
 LICENSE = "LGPL"
 DEPENDS = "libopensync openobex bluez-libs"
-RRECOMMENDS = "multisync"
+RRECOMMENDS_${PN} = "multisync"
 HOMEPAGE = "http://www.opensync.org/"
 
 inherit autotools pkgconfig
diff --git a/recipes/opensync/libopensync-plugin.inc b/recipes/opensync/libopensync-plugin.inc
index b1986a9..99e0c78 100644
--- a/recipes/opensync/libopensync-plugin.inc
+++ b/recipes/opensync/libopensync-plugin.inc
@@ -7,7 +7,7 @@ S ?= "${WORKDIR}/${PLUGIN_NAME}"
 
 LICENSE ?= "LGPL"
 DEPENDS += " libopensync"
-RRECOMMENDS += " msynctool"
+RRECOMMENDS_${PN} += " msynctool"
 HOMEPAGE ?= "http://www.opensync.org/"
 
 inherit autotools pkgconfig
diff --git a/recipes/opensync/libsyncml_0.5.4.bb b/recipes/opensync/libsyncml_0.5.4.bb
index 4bda5ce..edcdcf1 100644
--- a/recipes/opensync/libsyncml_0.5.4.bb
+++ b/recipes/opensync/libsyncml_0.5.4.bb
@@ -5,7 +5,7 @@ PRIORITY = "optional"
 LICENSE = "LGPL"
 
 DEPENDS = "libxml2 glib-2.0"
-RRECOMMENDS = "wbxml2 openobex libsoup"
+RRECOMMENDS_${PN} = "wbxml2 openobex libsoup"
 
 PR = "r1"
 
diff --git a/recipes/openttd/openttd_0.7.4.bb b/recipes/openttd/openttd_0.7.4.bb
index 8693d92..d8fc760 100644
--- a/recipes/openttd/openttd_0.7.4.bb
+++ b/recipes/openttd/openttd_0.7.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Open source clone of the Microprose game 'Transport Tycoon Deluxe
 HOMEPAGE = "http://www.openttd.org"
 LICENSE = "GPLv2"
 DEPENDS = "libsdl-net libpng zlib freetype fontconfig"
-RRECOMMENDS = "openttd-gfx openttd-sfx"
+RRECOMMENDS_${PN} = "openttd-gfx openttd-sfx"
 
 inherit siteinfo sdl
 
diff --git a/recipes/openvpn/openvpn.inc b/recipes/openvpn/openvpn.inc
index 70cdf4c..c4870b5 100644
--- a/recipes/openvpn/openvpn.inc
+++ b/recipes/openvpn/openvpn.inc
@@ -4,7 +4,7 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 PRIORITY = "optional"
 DEPENDS = "lzo openssl"
-RDEPENDS = "kernel-module-tun"
+RDEPENDS_${PN} = "kernel-module-tun"
 
 SRC_URI = "http://openvpn.net/release/openvpn-${PV}.tar.gz \
 	file://openvpn"
diff --git a/recipes/openvz/vzctl_3.0.23.bb b/recipes/openvz/vzctl_3.0.23.bb
index 51c1e4d..6cc7676 100644
--- a/recipes/openvz/vzctl_3.0.23.bb
+++ b/recipes/openvz/vzctl_3.0.23.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "An utility to manage OpenVZ containers"
 LICENSE = "GPLv2"
 
-RDEPENDS = "bash gawk sed grep coreutils tar"
+RDEPENDS_${PN} = "bash gawk sed grep coreutils tar"
 
 SRC_URI = "http://download.openvz.org/utils/vzctl/${PV}/src/vzctl-${PV}.tar.bz2 \
            file://vzctl-add-arm-syscalls.patch \
diff --git a/recipes/opie-addressbook/opie-addressbook.inc b/recipes/opie-addressbook/opie-addressbook.inc
index c98c354..f943324 100644
--- a/recipes/opie-addressbook/opie-addressbook.inc
+++ b/recipes/opie-addressbook/opie-addressbook.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Contacts"
 SECTION = "opie/pim"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-pics"
+RDEPENDS_${PN} = "opie-pics"
 APPNAME = "addressbook"
 
 
diff --git a/recipes/opie-advancedfm/opie-advancedfm.inc b/recipes/opie-advancedfm/opie-advancedfm.inc
index a74ff4b..daa0a13 100644
--- a/recipes/opie-advancedfm/opie-advancedfm.inc
+++ b/recipes/opie-advancedfm/opie-advancedfm.inc
@@ -3,7 +3,7 @@ SECTION = "opie/applications"
 PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "advancedfm"
-RDEPENDS = "opie-advancedfm-pics"
+RDEPENDS_${PN} = "opie-advancedfm-pics"
 
 S = "${WORKDIR}/${APPNAME}"
 
diff --git a/recipes/opie-alarm/opie-alarm.inc b/recipes/opie-alarm/opie-alarm.inc
index 60ef1e1..7d24005 100644
--- a/recipes/opie-alarm/opie-alarm.inc
+++ b/recipes/opie-alarm/opie-alarm.inc
@@ -3,7 +3,7 @@ SECTION = "opie/base"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "apmd"
-RDEPENDS = "apmd"
+RDEPENDS_${PN} = "apmd"
 
 S = "${WORKDIR}/opiealarm"
 
diff --git a/recipes/opie-bluetoothmanager/opie-bluetoothmanager.inc b/recipes/opie-bluetoothmanager/opie-bluetoothmanager.inc
index 84d737b..538473b 100644
--- a/recipes/opie-bluetoothmanager/opie-bluetoothmanager.inc
+++ b/recipes/opie-bluetoothmanager/opie-bluetoothmanager.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Bluetooth manager for Opie"
 SECTION = "opie/settings"
 PRIORITY = "optional"
 DEPENDS = "libopietooth1 obexftp"
-RDEPENDS = "opie-bluepin"
+RDEPENDS_${PN} = "opie-bluepin"
 LICENSE = "GPL"
 APPNAME = "bluetooth-manager"
 
diff --git a/recipes/opie-button-settings/opie-button-settings.inc b/recipes/opie-button-settings/opie-button-settings.inc
index 7ceb13a..7cb6489 100644
--- a/recipes/opie-button-settings/opie-button-settings.inc
+++ b/recipes/opie-button-settings/opie-button-settings.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Opie device buttons settings dialog"
 SECTION = "opie/settings"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-button-settings-pics"
+RDEPENDS_${PN} = "opie-button-settings-pics"
 APPNAME = "buttonsettings"
 
 S = "${WORKDIR}/button"
diff --git a/recipes/opie-camera/opie-camera.inc b/recipes/opie-camera/opie-camera.inc
index 955dc8e..3a131b4 100644
--- a/recipes/opie-camera/opie-camera.inc
+++ b/recipes/opie-camera/opie-camera.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Opie Camera, Photo and Video Capturing Application for the Sharp
 SECTION = "opie/applications"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "sharp-camera-support"
+RDEPENDS_${PN} = "sharp-camera-support"
 APPNAME = "camera"
 APPTYPE = "binary"
 
diff --git a/recipes/opie-citytime/opie-citytime.inc b/recipes/opie-citytime/opie-citytime.inc
index 529eba0..6dbf8a4 100644
--- a/recipes/opie-citytime/opie-citytime.inc
+++ b/recipes/opie-citytime/opie-citytime.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Opie Time-zone / world clock settings"
 SECTION = "opie/applications"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RRECOMMENDS = "tzdata"
+RRECOMMENDS_${PN} = "tzdata"
 PR = "r1"
 
 APPNAME = "citytime"
diff --git a/recipes/opie-console/opie-console.inc b/recipes/opie-console/opie-console.inc
index 67a39d6..b8e57b6 100644
--- a/recipes/opie-console/opie-console.inc
+++ b/recipes/opie-console/opie-console.inc
@@ -3,7 +3,7 @@ SECTION = "opie/applications"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "opie-keytabs"
-RDEPENDS = "opie-keytabs"
+RDEPENDS_${PN} = "opie-keytabs"
 APPNAME = "opie-console"
 APPTYPE = "binary"
 
diff --git a/recipes/opie-datebook-birthdayplugin/opie-datebook-birthdayplugin.inc b/recipes/opie-datebook-birthdayplugin/opie-datebook-birthdayplugin.inc
index 6840edf..62c014a 100644
--- a/recipes/opie-datebook-birthdayplugin/opie-datebook-birthdayplugin.inc
+++ b/recipes/opie-datebook-birthdayplugin/opie-datebook-birthdayplugin.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Opie datebook birthday plugin"
 SECTION = "opie/datebook"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-datebook"
+RDEPENDS_${PN} = "opie-datebook"
 APPNAME = "birthdayplugin"
 
 S = "${WORKDIR}/birthday"
diff --git a/recipes/opie-datebook-chrisholidayplugin/opie-datebook-chrisholidayplugin.inc b/recipes/opie-datebook-chrisholidayplugin/opie-datebook-chrisholidayplugin.inc
index 4b3b7c9..b8b817f 100644
--- a/recipes/opie-datebook-chrisholidayplugin/opie-datebook-chrisholidayplugin.inc
+++ b/recipes/opie-datebook-chrisholidayplugin/opie-datebook-chrisholidayplugin.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Opie datebook christian holidays plugin"
 SECTION = "opie/datebook"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-datebook"
+RDEPENDS_${PN} = "opie-datebook"
 APPNAME = "chrisholidayplugin"
 
 S = "${WORKDIR}/christian"
diff --git a/recipes/opie-datebook-nationalholidayplugin/opie-datebook-nationalholidayplugin.inc b/recipes/opie-datebook-nationalholidayplugin/opie-datebook-nationalholidayplugin.inc
index 0ec79d0..aa62ae4 100644
--- a/recipes/opie-datebook-nationalholidayplugin/opie-datebook-nationalholidayplugin.inc
+++ b/recipes/opie-datebook-nationalholidayplugin/opie-datebook-nationalholidayplugin.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Opie datebook national holidays plugin"
 SECTION = "opie/datebook"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-datebook"
+RDEPENDS_${PN} = "opie-datebook"
 APPNAME = "nationaldayplugin"
 
 S = "${WORKDIR}/national"
diff --git a/recipes/opie-datebook/opie-datebook.inc b/recipes/opie-datebook/opie-datebook.inc
index 6b42159..c97a6f2 100644
--- a/recipes/opie-datebook/opie-datebook.inc
+++ b/recipes/opie-datebook/opie-datebook.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "A datebook/appointment manager"
 SECTION = "opie/pim"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-pics"
+RDEPENDS_${PN} = "opie-pics"
 APPNAME = "datebook"
 
 
diff --git a/recipes/opie-dvorak/opie-dvorak.inc b/recipes/opie-dvorak/opie-dvorak.inc
index 78ba4fc..9b89436 100644
--- a/recipes/opie-dvorak/opie-dvorak.inc
+++ b/recipes/opie-dvorak/opie-dvorak.inc
@@ -3,7 +3,7 @@ SECTION = "opie/inputmethods"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "opie-pickboard"
-RDEPENDS = "opie-pickboard"
+RDEPENDS_${PN} = "opie-pickboard"
 APPNAME = "qdvorak"
 
 S = "${WORKDIR}/dvorak"
diff --git a/recipes/opie-embeddedkonsole/opie-embeddedkonsole.inc b/recipes/opie-embeddedkonsole/opie-embeddedkonsole.inc
index d878dfe..5997afd 100644
--- a/recipes/opie-embeddedkonsole/opie-embeddedkonsole.inc
+++ b/recipes/opie-embeddedkonsole/opie-embeddedkonsole.inc
@@ -3,7 +3,7 @@ SECTION = "opie/applications"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "libqtaux2 opie-keytabs"
-RDEPENDS = "opie-keytabs"
+RDEPENDS_${PN} = "opie-keytabs"
 APPNAME = "embeddedkonsole"
 
 S = "${WORKDIR}/${APPNAME}"
diff --git a/recipes/opie-examples-python/opie-examples-python.inc b/recipes/opie-examples-python/opie-examples-python.inc
index 10ba40a..3a784a3 100644
--- a/recipes/opie-examples-python/opie-examples-python.inc
+++ b/recipes/opie-examples-python/opie-examples-python.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Python examples for Opie"
 SECTION = "opie/base"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "python-pyqt opie-pyquicklaunchapplet"
+RDEPENDS_${PN} = "python-pyqt opie-pyquicklaunchapplet"
 APPNAME = "python"
 PACKAGE_ARCH = "all"
 
diff --git a/recipes/opie-eye/opie-eye.inc b/recipes/opie-eye/opie-eye.inc
index 925f9aa..019d2ce 100644
--- a/recipes/opie-eye/opie-eye.inc
+++ b/recipes/opie-eye/opie-eye.inc
@@ -3,7 +3,7 @@ SECTION = "opie/applications"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "libopiecore2 libopieui2 libopiemm2"
-RDEPENDS = "opie-advancedfm-pics"
+RDEPENDS_${PN} = "opie-advancedfm-pics"
 APPNAME = "opie-eye"
 
 S = "${WORKDIR}/${APPNAME}"
diff --git a/recipes/opie-freetype/opie-freetype.inc b/recipes/opie-freetype/opie-freetype.inc
index 2a8a833..6ca053a 100644
--- a/recipes/opie-freetype/opie-freetype.inc
+++ b/recipes/opie-freetype/opie-freetype.inc
@@ -3,7 +3,7 @@ SECTION = "opie/fontfactories"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "freetype opie-ttf-support"
-RDEPENDS = "opie-ttf-support"
+RDEPENDS_${PN} = "opie-ttf-support"
 APPNAME = "freetypefactory"
 APPTYPE = "plugin"
 
diff --git a/recipes/opie-keyboard/opie-keyboard.inc b/recipes/opie-keyboard/opie-keyboard.inc
index 122e30f..e76e84f 100644
--- a/recipes/opie-keyboard/opie-keyboard.inc
+++ b/recipes/opie-keyboard/opie-keyboard.inc
@@ -3,7 +3,7 @@ SECTION = "opie/inputmethods"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "opie-pickboard"
-RDEPENDS = "opie-pickboard"
+RDEPENDS_${PN} = "opie-pickboard"
 APPNAME = "qkeyboard"
 
 S = "${WORKDIR}/keyboard"
diff --git a/recipes/opie-kjumpx/opie-kjumpx.inc b/recipes/opie-kjumpx/opie-kjumpx.inc
index 95644a5..23ea711 100644
--- a/recipes/opie-kjumpx/opie-kjumpx.inc
+++ b/recipes/opie-kjumpx/opie-kjumpx.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Koreanized JumpX input method"
 SECTION = "opie/inputmethods"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-pics"
+RDEPENDS_${PN} = "opie-pics"
 APPNAME = "qkjumpx"
 
 
diff --git a/recipes/opie-lockapplet/opie-lockapplet.inc b/recipes/opie-lockapplet/opie-lockapplet.inc
index a71078d..17c9460 100644
--- a/recipes/opie-lockapplet/opie-lockapplet.inc
+++ b/recipes/opie-lockapplet/opie-lockapplet.inc
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "lockapplet"
 DEPENDS = "opie-security"
-RDEPENDS = "opie-security"
+RDEPENDS_${PN} = "opie-security"
 
 
 S = "${WORKDIR}/lockapplet"
diff --git a/recipes/opie-login/opie-login.inc b/recipes/opie-login/opie-login.inc
index 8000cf9..ced9fd7 100644
--- a/recipes/opie-login/opie-login.inc
+++ b/recipes/opie-login/opie-login.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Opie Login Manager (similar to gdm, xdm or kdm)"
 SECTION = "opie/base"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RRECOMMENDS = "opie-logoutapplet"
+RRECOMMENDS_${PN} = "opie-logoutapplet"
 APPNAME = "opie-login"
 
 BROKEN = "1"
diff --git a/recipes/opie-mail/opie-mail.inc b/recipes/opie-mail/opie-mail.inc
index 40e2b8a..09f8b7a 100644
--- a/recipes/opie-mail/opie-mail.inc
+++ b/recipes/opie-mail/opie-mail.inc
@@ -3,7 +3,7 @@ SECTION = "opie/pim"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "libmailwrapper libetpan"
-RDEPENDS = "opie-pics"
+RDEPENDS_${PN} = "opie-pics"
 APPNAME = "opiemail"
 
 
diff --git a/recipes/opie-mediaplayer1-libmadplugin/opie-mediaplayer1-libmadplugin.inc b/recipes/opie-mediaplayer1-libmadplugin/opie-mediaplayer1-libmadplugin.inc
index 4066f63..a4c1dbd 100644
--- a/recipes/opie-mediaplayer1-libmadplugin/opie-mediaplayer1-libmadplugin.inc
+++ b/recipes/opie-mediaplayer1-libmadplugin/opie-mediaplayer1-libmadplugin.inc
@@ -3,7 +3,7 @@ SECTION = "opie/codecs"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "opie-mediaplayer1-core libmad"
-RDEPENDS = "opie-mediaplayer1-core"
+RDEPENDS_${PN} = "opie-mediaplayer1-core"
 APPNAME = "madplugin"
 
 
diff --git a/recipes/opie-mediaplayer1-libmodplugin/opie-mediaplayer1-libmodplugin.inc b/recipes/opie-mediaplayer1-libmodplugin/opie-mediaplayer1-libmodplugin.inc
index 16cc11e..bf725cc 100644
--- a/recipes/opie-mediaplayer1-libmodplugin/opie-mediaplayer1-libmodplugin.inc
+++ b/recipes/opie-mediaplayer1-libmodplugin/opie-mediaplayer1-libmodplugin.inc
@@ -3,7 +3,7 @@ SECTION = "opie/codecs"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "opie-mediaplayer1-core"
-RDEPENDS = "opie-mediaplayer1-core"
+RDEPENDS_${PN} = "opie-mediaplayer1-core"
 APPNAME = "modplugin"
 
 
diff --git a/recipes/opie-mediaplayer1-libtremorplugin/opie-mediaplayer1-libtremorplugin.inc b/recipes/opie-mediaplayer1-libtremorplugin/opie-mediaplayer1-libtremorplugin.inc
index f55d0eb..e4d6417 100644
--- a/recipes/opie-mediaplayer1-libtremorplugin/opie-mediaplayer1-libtremorplugin.inc
+++ b/recipes/opie-mediaplayer1-libtremorplugin/opie-mediaplayer1-libtremorplugin.inc
@@ -3,7 +3,7 @@ SECTION = "opie/codecs"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "opie-mediaplayer1-core tremor"
-RDEPENDS = "opie-mediaplayer1-core"
+RDEPENDS_${PN} = "opie-mediaplayer1-core"
 APPNAME = "tremorplugin"
 
 
diff --git a/recipes/opie-mediaplayer1-libwavplugin/opie-mediaplayer1-libwavplugin.inc b/recipes/opie-mediaplayer1-libwavplugin/opie-mediaplayer1-libwavplugin.inc
index 858f8b3..4ef8b0a 100644
--- a/recipes/opie-mediaplayer1-libwavplugin/opie-mediaplayer1-libwavplugin.inc
+++ b/recipes/opie-mediaplayer1-libwavplugin/opie-mediaplayer1-libwavplugin.inc
@@ -3,7 +3,7 @@ SECTION = "opie/codecs"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "opie-mediaplayer1-core"
-RDEPENDS = "opie-mediaplayer1-core"
+RDEPENDS_${PN} = "opie-mediaplayer1-core"
 APPNAME = "wavplugin"
 
 
diff --git a/recipes/opie-mediaplayer1/opie-mediaplayer1-core.inc b/recipes/opie-mediaplayer1/opie-mediaplayer1-core.inc
index de9ea19..f38b653 100644
--- a/recipes/opie-mediaplayer1/opie-mediaplayer1-core.inc
+++ b/recipes/opie-mediaplayer1/opie-mediaplayer1-core.inc
@@ -3,7 +3,7 @@ SECTION = "opie/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "libqtaux2"
-RDEPENDS = "opie-mediaplayer2-skin-default"
+RDEPENDS_${PN} = "opie-mediaplayer2-skin-default"
 APPNAME = "opieplayer"
 APPTYPE = "binary"
 
diff --git a/recipes/opie-mediaplayer1/opie-mediaplayer1.inc b/recipes/opie-mediaplayer1/opie-mediaplayer1.inc
index f60d7a5..b1fd82a 100644
--- a/recipes/opie-mediaplayer1/opie-mediaplayer1.inc
+++ b/recipes/opie-mediaplayer1/opie-mediaplayer1.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "The classic Opie media player (core+plugins)."
 LICENSE = "GPL"
 ALLOW_EMPTY = "1"
 PACKAGE_ARCH = "all"
-RDEPENDS = "opie-mediaplayer1-core"
-RRECOMMENDS = "opie-mediaplayer1-libmadplugin opie-mediaplayer1-libwavplugin \
+RDEPENDS_${PN} = "opie-mediaplayer1-core"
+RRECOMMENDS_${PN} = "opie-mediaplayer1-libmadplugin opie-mediaplayer1-libwavplugin \
 opie-mediaplayer1-libmodplugin opie-mediaplayer1-libtremorplugin"
 
diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2.inc b/recipes/opie-mediaplayer2/opie-mediaplayer2.inc
index 248704d..6ee2460 100644
--- a/recipes/opie-mediaplayer2/opie-mediaplayer2.inc
+++ b/recipes/opie-mediaplayer2/opie-mediaplayer2.inc
@@ -4,8 +4,8 @@ SECTION = "opie/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "libxine libqtaux2 opie-mediaplayer2-skin-default"
-RDEPENDS = "opie-mediaplayer2-skin-default"
-RRECOMMENDS = "libxine-plugin-ao-out-oss libxine-plugin-inp-file \
+RDEPENDS_${PN} = "opie-mediaplayer2-skin-default"
+RRECOMMENDS_${PN} = "libxine-plugin-ao-out-oss libxine-plugin-inp-file \
 libxine-plugin-decode-ff libxine-plugin-decode-mad \
 libxine-plugin-dmx-audio libxine-plugin-dmx-avi libxine-plugin-dmx-mpeg"
 APPNAME = "opieplayer2"
diff --git a/recipes/opie-multikey/opie-multikey.inc b/recipes/opie-multikey/opie-multikey.inc
index 46bebc7..0615280 100644
--- a/recipes/opie-multikey/opie-multikey.inc
+++ b/recipes/opie-multikey/opie-multikey.inc
@@ -3,8 +3,8 @@ SECTION = "opie/inputmethods"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "libqtaux2 opie-pickboard"
-RDEPENDS = "opie-pics opie-pickboard"
-RRECOMMENDS = "opie-multikeyapplet"
+RDEPENDS_${PN} = "opie-pics opie-pickboard"
+RRECOMMENDS_${PN} = "opie-multikeyapplet"
 APPNAME = "qmultikey"
 
 S = "${WORKDIR}/multikey"
diff --git a/recipes/opie-networkapplet/opie-networkapplet.inc b/recipes/opie-networkapplet/opie-networkapplet.inc
index dcb5c93..c1ebfbe 100644
--- a/recipes/opie-networkapplet/opie-networkapplet.inc
+++ b/recipes/opie-networkapplet/opie-networkapplet.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Network Applet"
 SECTION = "opie/applets"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-networksettings"
+RDEPENDS_${PN} = "opie-networksettings"
 APPNAME = "networkapplet"
 
 S = "${WORKDIR}/${APPNAME}"
diff --git a/recipes/opie-pimconverter/opie-pimconverter.inc b/recipes/opie-pimconverter/opie-pimconverter.inc
index 4c50ce4..66afa44 100644
--- a/recipes/opie-pimconverter/opie-pimconverter.inc
+++ b/recipes/opie-pimconverter/opie-pimconverter.inc
@@ -3,7 +3,7 @@ SECTION = "opie/pim"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "sqlite3 sqlite" 
-RDEPENDS = "sqlite3 sqlite-bin" 
+RDEPENDS_${PN} = "sqlite3 sqlite-bin" 
 
 APPNAME = "opimconverter"
 
diff --git a/recipes/opie-remote/opie-remote.inc b/recipes/opie-remote/opie-remote.inc
index e7fc766..b710cb4 100644
--- a/recipes/opie-remote/opie-remote.inc
+++ b/recipes/opie-remote/opie-remote.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "A remote control"
 SECTION = "opie/applications"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "lirc"
+RDEPENDS_${PN} = "lirc"
 APPNAME = "remote"
 APPTYPE = "binary"
 
diff --git a/recipes/opie-securityplugins/opie-securityplugin-blueping.inc b/recipes/opie-securityplugins/opie-securityplugin-blueping.inc
index 35f972e..e2cd58b 100644
--- a/recipes/opie-securityplugins/opie-securityplugin-blueping.inc
+++ b/recipes/opie-securityplugins/opie-securityplugin-blueping.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Blueping plugin for opie-security authentication. \
 This is a bluetooth-based authentication plugin (you need \
 to have another Bluetooth device around to use it)."
-RDEPENDS += "bluez-utils"
+RDEPENDS_${PN} += "bluez-utils"
 APPNAME = "multiauthbluepingplugin"
 
 include opie-securityplugin.inc
diff --git a/recipes/opie-securityplugins/opie-securityplugin.inc b/recipes/opie-securityplugins/opie-securityplugin.inc
index f21cfdb..231c201 100644
--- a/recipes/opie-securityplugins/opie-securityplugin.inc
+++ b/recipes/opie-securityplugins/opie-securityplugin.inc
@@ -1,7 +1,7 @@
 SECTION = "opie/security"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-security"
+RDEPENDS_${PN} = "opie-security"
 I18N_FILES = "lib${APPNAME}.ts"
 
 inherit opie
diff --git a/recipes/opie-sh-snes/opie-sh-snes.inc b/recipes/opie-sh-snes/opie-sh-snes.inc
index 1f17876..15a8ac0 100644
--- a/recipes/opie-sh-snes/opie-sh-snes.inc
+++ b/recipes/opie-sh-snes/opie-sh-snes.inc
@@ -3,7 +3,7 @@ SECTION = "opie/shell"
 PRIORITY = "optional"
 LICENSE = "GPL"
 
-RDEPENDS = "opie-sh"
+RDEPENDS_${PN} = "opie-sh"
 
 inherit opie
 
diff --git a/recipes/opie-sh-snes/opie-sh-snes_0.2.bb b/recipes/opie-sh-snes/opie-sh-snes_0.2.bb
index 4701e1a..b4af758 100644
--- a/recipes/opie-sh-snes/opie-sh-snes_0.2.bb
+++ b/recipes/opie-sh-snes/opie-sh-snes_0.2.bb
@@ -3,7 +3,7 @@ SECTION = "opie/shell"
 PRIORITY = "optional"
 LICENSE = "GPL"
 
-RDEPENDS = "opie-sh"
+RDEPENDS_${PN} = "opie-sh"
 
 
 PR = "r2"
diff --git a/recipes/opie-sshkeys/opie-sshkeys.inc b/recipes/opie-sshkeys/opie-sshkeys.inc
index cf160f3..f8d7bee 100644
--- a/recipes/opie-sshkeys/opie-sshkeys.inc
+++ b/recipes/opie-sshkeys/opie-sshkeys.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Utility for managing ssh-agent keys"
 SECTION = "opie/settings"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "ssh opie-sh-ssh-askpass"
+RDEPENDS_${PN} = "ssh opie-sh-ssh-askpass"
 APPNAME = "sshkeys"
 
 
diff --git a/recipes/opie-stumbler/opie-stumbler.inc b/recipes/opie-stumbler/opie-stumbler.inc
index 4c16fa8..50843a3 100644
--- a/recipes/opie-stumbler/opie-stumbler.inc
+++ b/recipes/opie-stumbler/opie-stumbler.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "A Wireless Network Scanner"
 SECTION = "opie/applications"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RRECOMMENDS = "manufacturers"
+RRECOMMENDS_${PN} = "manufacturers"
 APPNAME = "opiestumbler"
 
 S = "${WORKDIR}/${APPNAME}"
diff --git a/recipes/opie-systemtime/opie-systemtime.inc b/recipes/opie-systemtime/opie-systemtime.inc
index 724e38e..e91d971 100644
--- a/recipes/opie-systemtime/opie-systemtime.inc
+++ b/recipes/opie-systemtime/opie-systemtime.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Set the system time - utilizing ntpdate, if available."
 SECTION = "opie/settings"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RRECOMMENDS = "ntpdate"
+RRECOMMENDS_${PN} = "ntpdate"
 
 APPNAME = "systemtime"
 
diff --git a/recipes/opie-taskbar/opie-taskbar.inc b/recipes/opie-taskbar/opie-taskbar.inc
index 3d8ca17..d969df9 100644
--- a/recipes/opie-taskbar/opie-taskbar.inc
+++ b/recipes/opie-taskbar/opie-taskbar.inc
@@ -7,7 +7,7 @@ DEPENDS = "opie-libqrsync opie-qss"
 # Instead of seeing if something in package package lists selects needed package among the rest
 # or errors out otherwise, it just install random package which has needed Provides. So, comment
 # this out.
-#RDEPENDS = "opie-taskbar-images"
+#RDEPENDS_${PN} = "opie-taskbar-images"
 APPNAME = "qpe"
 
 S = "${WORKDIR}/launcher"
diff --git a/recipes/opie-today-addressbookplugin/opie-today-addressbookplugin.inc b/recipes/opie-today-addressbookplugin/opie-today-addressbookplugin.inc
index 9503972..8f2f9b0 100644
--- a/recipes/opie-today-addressbookplugin/opie-today-addressbookplugin.inc
+++ b/recipes/opie-today-addressbookplugin/opie-today-addressbookplugin.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Addressbook plugin for Today"
 SECTION = "opie/today"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-today"
+RDEPENDS_${PN} = "opie-today"
 APPNAME = "todayaddressbookplugin"
 
 
diff --git a/recipes/opie-today-datebookplugin/opie-today-datebookplugin.inc b/recipes/opie-today-datebookplugin/opie-today-datebookplugin.inc
index 4f980fa..4f28b66 100644
--- a/recipes/opie-today-datebookplugin/opie-today-datebookplugin.inc
+++ b/recipes/opie-today-datebookplugin/opie-today-datebookplugin.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Datebook plugin for Today"
 SECTION = "opie/today"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-today"
+RDEPENDS_${PN} = "opie-today"
 APPNAME = "todaydatebookplugin"
 
 
diff --git a/recipes/opie-today-fortuneplugin/opie-today-fortuneplugin.inc b/recipes/opie-today-fortuneplugin/opie-today-fortuneplugin.inc
index 245078a..6f29feb 100644
--- a/recipes/opie-today-fortuneplugin/opie-today-fortuneplugin.inc
+++ b/recipes/opie-today-fortuneplugin/opie-today-fortuneplugin.inc
@@ -3,7 +3,7 @@ SECTION = "opie/today"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "opie-today libqtaux2"
-RDEPENDS = "fortune-mod opie-today"
+RDEPENDS_${PN} = "fortune-mod opie-today"
 APPNAME = "todayfortuneplugin"
 
 S = "${WORKDIR}/fortune"
diff --git a/recipes/opie-today-mailplugin/opie-today-mailplugin.inc b/recipes/opie-today-mailplugin/opie-today-mailplugin.inc
index f228c61..d451964 100644
--- a/recipes/opie-today-mailplugin/opie-today-mailplugin.inc
+++ b/recipes/opie-today-mailplugin/opie-today-mailplugin.inc
@@ -3,7 +3,7 @@ SECTION = "opie/today"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "opie-today opie-mailapplet"
-RDEPENDS = "opie-today opie-mailapplet"
+RDEPENDS_${PN} = "opie-today opie-mailapplet"
 APPNAME = "todaymailplugin"
 
 
diff --git a/recipes/opie-today-todolistplugin/opie-today-todolistplugin.inc b/recipes/opie-today-todolistplugin/opie-today-todolistplugin.inc
index 00f29ce..9d2eeac 100644
--- a/recipes/opie-today-todolistplugin/opie-today-todolistplugin.inc
+++ b/recipes/opie-today-todolistplugin/opie-today-todolistplugin.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Todo list plugin for Today"
 SECTION = "opie/today"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-today"
+RDEPENDS_${PN} = "opie-today"
 APPNAME = "todaytodolistplugin"
 
 
diff --git a/recipes/opie-today-weatherplugin/opie-today-weatherplugin.inc b/recipes/opie-today-weatherplugin/opie-today-weatherplugin.inc
index f4f865d..b7718e2 100644
--- a/recipes/opie-today-weatherplugin/opie-today-weatherplugin.inc
+++ b/recipes/opie-today-weatherplugin/opie-today-weatherplugin.inc
@@ -3,7 +3,7 @@ SECTION = "opie/today"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "libopiecore2 libopiepim2"
-RDEPENDS = "opie-today"
+RDEPENDS_${PN} = "opie-today"
 APPNAME = "todayweatherplugin"
 
 
diff --git a/recipes/opie-todo/opie-todo.inc b/recipes/opie-todo/opie-todo.inc
index b31869f..226c8ad 100644
--- a/recipes/opie-todo/opie-todo.inc
+++ b/recipes/opie-todo/opie-todo.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Todo list manager"
 SECTION = "opie/pim"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-pics"
+RDEPENDS_${PN} = "opie-pics"
 APPNAME = "todolist"
 
 
diff --git a/recipes/opie-vmemo/opie-vmemo.inc b/recipes/opie-vmemo/opie-vmemo.inc
index 9b45eff..e2849bd 100644
--- a/recipes/opie-vmemo/opie-vmemo.inc
+++ b/recipes/opie-vmemo/opie-vmemo.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Voice Memo Recorder Applet"
 SECTION = "opie/applets"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "opie-vmemo-settings"
+RDEPENDS_${PN} = "opie-vmemo-settings"
 I18N_FILES = "libvmemoapplet.ts"
 APPNAME = "vmemoapplet"
 
diff --git a/recipes/opie-wellenreiter/opie-wellenreiter.inc b/recipes/opie-wellenreiter/opie-wellenreiter.inc
index 137fe87..d7a2a73 100644
--- a/recipes/opie-wellenreiter/opie-wellenreiter.inc
+++ b/recipes/opie-wellenreiter/opie-wellenreiter.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "A Wireless Network Monitor"
 SECTION = "opie/applications"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RRECOMMENDS = "manufacturers"
+RRECOMMENDS_${PN} = "manufacturers"
 APPNAME = "wellenreiter"
 APPTYPE = "binary"
 
diff --git a/recipes/opie-zkbapplet/opie-zkbapplet.inc b/recipes/opie-zkbapplet/opie-zkbapplet.inc
index f1b09cf..3203bce 100644
--- a/recipes/opie-zkbapplet/opie-zkbapplet.inc
+++ b/recipes/opie-zkbapplet/opie-zkbapplet.inc
@@ -3,7 +3,7 @@ SECTION = "opie/applets"
 PRIORITY = "optional"
 LICENSE = "GPL"
 APPNAME = "zkbapplet"
-RDEPENDS = "opie-pics"
+RDEPENDS_${PN} = "opie-pics"
 I18N_FILES = "keyz-cfg.ts"
 
 
diff --git a/recipes/opkg-utils/opkg-utils-native_svn.bb b/recipes/opkg-utils/opkg-utils-native_svn.bb
index 49b8e98..b670378 100644
--- a/recipes/opkg-utils/opkg-utils-native_svn.bb
+++ b/recipes/opkg-utils/opkg-utils-native_svn.bb
@@ -1,7 +1,7 @@
 require opkg-utils_svn.bb
 SRCREV = "4595"
 
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 inherit native
 
diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_svn.bb
index d049bb7..bb404a6 100644
--- a/recipes/opkg-utils/opkg-utils_svn.bb
+++ b/recipes/opkg-utils/opkg-utils_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "OPKG Package Manager Utilities"
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "python"
+RDEPENDS_${PN} = "python"
 SRCREV = "4578"
 PR = "r2"
 
diff --git a/recipes/opkg/opkg-ipkg-compat.bb b/recipes/opkg/opkg-ipkg-compat.bb
index 58c8145..5a35f6d 100644
--- a/recipes/opkg/opkg-ipkg-compat.bb
+++ b/recipes/opkg/opkg-ipkg-compat.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Files to make opkg and ipkg coexist"
-RDEPENDS = "opkg ipkg ipkg-collateral"
+RDEPENDS_${PN} = "opkg ipkg ipkg-collateral"
 
 PR = "r0"
 PACKAGE_ARCH = "all"
diff --git a/recipes/oprofile/oprofile.inc b/recipes/oprofile/oprofile.inc
index 8400dde..9fe49c9 100644
--- a/recipes/oprofile/oprofile.inc
+++ b/recipes/oprofile/oprofile.inc
@@ -3,8 +3,8 @@ DESCRIPTION = "OProfile is a system-wide profiler for Linux systems, capable \
 of profiling all running code at low overhead."
 LICENSE = "GPL"
 DEPENDS = "popt binutils"
-RDEPENDS += "binutils-symlinks"
-RRECOMMENDS += "kernel-vmlinux"
+RDEPENDS_${PN} += "binutils-symlinks"
+RRECOMMENDS_${PN} += "kernel-vmlinux"
 INC_PR = "r11"
 
 S = "${WORKDIR}/oprofile-${PV}"
diff --git a/recipes/oprofile/oprofile_cvs.bb b/recipes/oprofile/oprofile_cvs.bb
index ba4fb35..f9f645f 100644
--- a/recipes/oprofile/oprofile_cvs.bb
+++ b/recipes/oprofile/oprofile_cvs.bb
@@ -4,7 +4,7 @@ SRCDATE = "20080210"
 PV = "0.9.4+cvs${SRCDATE}"
 PR = "r3"
 
-RDEPENDS += "binutils-symlinks"
+RDEPENDS_${PN} += "binutils-symlinks"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/orinoco/orinoco-conf_1.0.bb b/recipes/orinoco/orinoco-conf_1.0.bb
index 0062e87..a37b25e 100644
--- a/recipes/orinoco/orinoco-conf_1.0.bb
+++ b/recipes/orinoco/orinoco-conf_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "PCMCIA-cs configuration files for Hermes (Orinoco) wireless LAN c
 SECTION = "kernel/modules"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "update-modules"
+RDEPENDS_${PN} = "update-modules"
 PACKAGE_ARCH = "all"
 PR = "r3"
 
diff --git a/recipes/orinoco/orinoco-modules_0.15rc1.bb b/recipes/orinoco/orinoco-modules_0.15rc1.bb
index 6188ee6..881725f 100644
--- a/recipes/orinoco/orinoco-modules_0.15rc1.bb
+++ b/recipes/orinoco/orinoco-modules_0.15rc1.bb
@@ -1,7 +1,7 @@
 require orinoco-modules.inc
 
 DEPENDS = "orinoco-conf spectrum-fw"
-RDEPENDS += "orinoco-conf"
+RDEPENDS_${PN} += "orinoco-conf"
 RDEPENDS_orinoco-modules-cs += "orinoco-modules spectrum-fw"
 PR = "r8"
 
diff --git a/recipes/orinoco/orinoco-modules_0.15rc2.bb b/recipes/orinoco/orinoco-modules_0.15rc2.bb
index 1af5dca..d1ae67e 100644
--- a/recipes/orinoco/orinoco-modules_0.15rc2.bb
+++ b/recipes/orinoco/orinoco-modules_0.15rc2.bb
@@ -1,7 +1,7 @@
 require orinoco-modules.inc
 
 DEPENDS = "orinoco-conf spectrum-fw"
-RDEPENDS += "orinoco-conf"
+RDEPENDS_${PN} += "orinoco-conf"
 RDEPENDS_orinoco-modules-cs += "orinoco-modules spectrum-fw"
 PR = "r10"
 
diff --git a/recipes/orinoco/orinoco-modules_cvs.bb b/recipes/orinoco/orinoco-modules_cvs.bb
index 2939b5d..6467c4d 100644
--- a/recipes/orinoco/orinoco-modules_cvs.bb
+++ b/recipes/orinoco/orinoco-modules_cvs.bb
@@ -1,7 +1,7 @@
 require orinoco-modules.inc
 
 DEPENDS = "orinoco-conf spectrum-fw"
-RDEPENDS += "orinoco-conf"
+RDEPENDS_${PN} += "orinoco-conf"
 RDEPENDS_orinoco-modules-cs = "orinoco-modules spectrum-fw"
 PR = "r3"
 
diff --git a/recipes/p910nd/p910nd_0.92.bb b/recipes/p910nd/p910nd_0.92.bb
index 7e232d3..e9e3a9b 100644
--- a/recipes/p910nd/p910nd_0.92.bb
+++ b/recipes/p910nd/p910nd_0.92.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://p910nd.sourceforge.net/"
 LICENSE = "GPLv2"
 SECTION = "console/utils"
 PR = "r0"
-RRECOMMENDS = "avahi"
+RRECOMMENDS_${PN} = "avahi"
 
 inherit update-rc.d
 
diff --git a/recipes/pam/libpam-base-files.bb b/recipes/pam/libpam-base-files.bb
index 9ba57a7..7ceb46d 100644
--- a/recipes/pam/libpam-base-files.bb
+++ b/recipes/pam/libpam-base-files.bb
@@ -4,8 +4,8 @@ SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
 DEPENDS = ""
-RDEPENDS = "libpam"
-RRECOMMENDS = "libpam-meta"
+RDEPENDS_${PN} = "libpam"
+RRECOMMENDS_${PN} = "libpam-meta"
 
 PR = "r5"
 
diff --git a/recipes/pcmanfm/pcmanfm_0.5.bb b/recipes/pcmanfm/pcmanfm_0.5.bb
index 8c723e8..736b063 100644
--- a/recipes/pcmanfm/pcmanfm_0.5.bb
+++ b/recipes/pcmanfm/pcmanfm_0.5.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "procfs tools"
 SECTION = "x11"
 PRIORITY = "optional"
 DEPENDS = "gtk+ hal gamin startup-notification"
-RRECOMMENDS = "pmount-hal"
+RRECOMMENDS_${PN} = "pmount-hal"
 PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.gz \
diff --git a/recipes/pcmcia-cs/pcmcia-cs_3.2.8.bb b/recipes/pcmcia-cs/pcmcia-cs_3.2.8.bb
index 155a217..7ad34c4 100644
--- a/recipes/pcmcia-cs/pcmcia-cs_3.2.8.bb
+++ b/recipes/pcmcia-cs/pcmcia-cs_3.2.8.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 PRIORITY = "required"
 LICENSE = "GPL"
 DEPENDS = "virtual/kernel"
-RDEPENDS = "hostap-conf orinoco-conf"
+RDEPENDS_${PN} = "hostap-conf orinoco-conf"
 PR = "r28"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmcia-cs/pcmcia-cs-${PV}.tar.gz \
diff --git a/recipes/pcmciautils/pcmciautils.inc b/recipes/pcmciautils/pcmciautils.inc
index f9ef159..4470efe 100644
--- a/recipes/pcmciautils/pcmciautils.inc
+++ b/recipes/pcmciautils/pcmciautils.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Linux Kernel 2.6 Userland Utilities for the PCMCIA Subsystem"
 DEPENDS = "sysfsutils"
-RDEPENDS = "udev module-init-tools"
+RDEPENDS_${PN} = "udev module-init-tools"
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/pcmcia/pcmcia.html"
 SECTION = "kernel/userland"
 PRIORITY = "optional"
diff --git a/recipes/perl/libalgorithm-diff-perl_1.1902.bb b/recipes/perl/libalgorithm-diff-perl_1.1902.bb
index 1180894..d932760 100644
--- a/recipes/perl/libalgorithm-diff-perl_1.1902.bb
+++ b/recipes/perl/libalgorithm-diff-perl_1.1902.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Algorithm::Diff - Compute intelligent differences between two files / lists"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
-RDEPENDS += "perl-module-exporter perl-module-strict perl-module-vars \
+RDEPENDS_${PN} += "perl-module-exporter perl-module-strict perl-module-vars \
 	     perl-module-strict perl-module-vars"
 PR = "r4"
 
diff --git a/recipes/perl/libarchive-tar-perl_1.30.bb b/recipes/perl/libarchive-tar-perl_1.30.bb
index 840f08e..33acdfe 100644
--- a/recipes/perl/libarchive-tar-perl_1.30.bb
+++ b/recipes/perl/libarchive-tar-perl_1.30.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Archive::Tar - module for manipulations of tar archives"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS += "libio-zlib-perl-native"
-RDEPENDS += "libio-zlib-perl"
+RDEPENDS_${PN} += "libio-zlib-perl"
 PR = "r5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/K/KA/KANE/Archive-Tar-${PV}.tar.gz"
diff --git a/recipes/perl/libarchive-zip-perl_1.30.bb b/recipes/perl/libarchive-zip-perl_1.30.bb
index 672f1ea..12b644c 100644
--- a/recipes/perl/libarchive-zip-perl_1.30.bb
+++ b/recipes/perl/libarchive-zip-perl_1.30.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 
 DEPENDS += "libio-zlib-perl-native"
-RDEPENDS += "libio-zlib-perl"
+RDEPENDS_${PN} += "libio-zlib-perl"
 PR= "r0"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Archive-Zip-${PV}.tar.gz"
diff --git a/recipes/perl/libauthen-pam-perl_0.16.bb b/recipes/perl/libauthen-pam-perl_0.16.bb
index c8fdfa4..f191005 100644
--- a/recipes/perl/libauthen-pam-perl_0.16.bb
+++ b/recipes/perl/libauthen-pam-perl_0.16.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Authen::PAM - Perl interface to PAM library"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS = "libpam"
-RDEPENDS = "perl-module-posix"
+RDEPENDS_${PN} = "perl-module-posix"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NI/NIKIP/Authen-PAM-${PV}.tar.gz;name=authen-pam-perl-${PV}"
 SRC_URI[authen-pam-perl-0.16.md5sum] = "7278471dfa694d9ef312bc92d7099af2"
diff --git a/recipes/perl/libcache-cache-perl_1.06.bb b/recipes/perl/libcache-cache-perl_1.06.bb
index f441b44..cee4455 100644
--- a/recipes/perl/libcache-cache-perl_1.06.bb
+++ b/recipes/perl/libcache-cache-perl_1.06.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS = "libdigest-sha1-perl-native liberror-perl-native \
            libipc-sharelite-perl-native"
-RDEPENDS = "libdigest-sha1-perl liberror-perl libipc-sharelite-perl"
+RDEPENDS_${PN} = "libdigest-sha1-perl liberror-perl libipc-sharelite-perl"
 PR = "r0"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JS/JSWARTZ/Cache-Cache-${PV}.tar.gz"
diff --git a/recipes/perl/libclass-container-perl_0.12.bb b/recipes/perl/libclass-container-perl_0.12.bb
index 8522107..beffb37 100644
--- a/recipes/perl/libclass-container-perl_0.12.bb
+++ b/recipes/perl/libclass-container-perl_0.12.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Class::Container - Glues object frameworks together transparently
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS = "libparams-validate-perl-native"
-RDEPENDS = "libparams-validate-perl"
+RDEPENDS_${PN} = "libparams-validate-perl"
 PR = "r7"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/Class-Container-${PV}.tar.gz"
diff --git a/recipes/perl/libdata-optlist-perl_0.101.bb b/recipes/perl/libdata-optlist-perl_0.101.bb
index 1369f11..44ccf43 100644
--- a/recipes/perl/libdata-optlist-perl_0.101.bb
+++ b/recipes/perl/libdata-optlist-perl_0.101.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Data::OptList - parse and validate simple name/value option pairs
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS += "libsub-install-perl-native libparams-util-perl-native"
-RDEPENDS += "perl-module-list-util libparams-util-perl perl-module-strict \
+RDEPENDS_${PN} += "perl-module-list-util libparams-util-perl perl-module-strict \
              libsub-install-perl perl-module-warnings "
 PR = "r4"
 
diff --git a/recipes/perl/libdate-manip-perl_5.54.bb b/recipes/perl/libdate-manip-perl_5.54.bb
index 790dc17..381e7f0 100644
--- a/recipes/perl/libdate-manip-perl_5.54.bb
+++ b/recipes/perl/libdate-manip-perl_5.54.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 PR = "r1"
 
-RDEPENDS = "perl-module-test-more \
+RDEPENDS_${PN} = "perl-module-test-more \
             perl-module-io-file \
             perl-module-carp"
 
diff --git a/recipes/perl/libdbd-mysql-perl_4.010.bb b/recipes/perl/libdbd-mysql-perl_4.010.bb
index b77f05e..2030ca9 100644
--- a/recipes/perl/libdbd-mysql-perl_4.010.bb
+++ b/recipes/perl/libdbd-mysql-perl_4.010.bb
@@ -1,7 +1,7 @@
 require libdbd-mysql-perl.inc
 
 DEPENDS = "libdbi-perl mysql"
-RDEPENDS = "perl-module-data-dumper \
+RDEPENDS_${PN} = "perl-module-data-dumper \
             libdbi-perl \
             perl-module-scalar-util \
             perl-module-file-spec \
diff --git a/recipes/perl/libdbi-perl_1.607.bb b/recipes/perl/libdbi-perl_1.607.bb
index 7bb7745..2d52376 100644
--- a/recipes/perl/libdbi-perl_1.607.bb
+++ b/recipes/perl/libdbi-perl_1.607.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 PR = "r1"
 
-RDEPENDS = "perl-module-scalar-util \
+RDEPENDS_${PN} = "perl-module-scalar-util \
             perl-module-file-spec \
             perl-module-storable \
             perl-module-test-simple"
diff --git a/recipes/perl/libdevice-serialport-perl_1.04.bb b/recipes/perl/libdevice-serialport-perl_1.04.bb
index fa39694..583a818 100644
--- a/recipes/perl/libdevice-serialport-perl_1.04.bb
+++ b/recipes/perl/libdevice-serialport-perl_1.04.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Device::SerialPort - Linux/POSIX emulation of Win32::SerialPort functions."
 SECTION = "libs"
 LICENSE = "GPL"
-RDEPENDS += "perl-module-carp perl-module-posix perl-module-io-handle \
+RDEPENDS_${PN} += "perl-module-carp perl-module-posix perl-module-io-handle \
 	     perl-module-strict perl-module-warnings perl-module-vars \
 	     perl-module-xsloader"
 PR= "r1"
diff --git a/recipes/perl/libemail-date-format-perl_1.002.bb b/recipes/perl/libemail-date-format-perl_1.002.bb
index 13ee4b6..0885a06 100644
--- a/recipes/perl/libemail-date-format-perl_1.002.bb
+++ b/recipes/perl/libemail-date-format-perl_1.002.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 PR = "r1"
 
-RDEPENDS = "perl-module-test-more \
+RDEPENDS_${PN} = "perl-module-test-more \
             perl-module-time-local"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-Date-Format-${PV}.tar.gz"
diff --git a/recipes/perl/libexception-class-perl_1.23.bb b/recipes/perl/libexception-class-perl_1.23.bb
index a28f8f6..e242f0d 100644
--- a/recipes/perl/libexception-class-perl_1.23.bb
+++ b/recipes/perl/libexception-class-perl_1.23.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Exception::Class - A module that allows you to declare real excep
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS = "libclass-data-inheritable-perl-native libdevel-stacktrace-perl-native"
-RDEPENDS = "libclass-data-inheritable-perl libdevel-stacktrace-perl"
+RDEPENDS_${PN} = "libclass-data-inheritable-perl libdevel-stacktrace-perl"
 PR = "r8"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Exception-Class-${PV}.tar.gz"
diff --git a/recipes/perl/libhtml-parser-perl_3.60.bb b/recipes/perl/libhtml-parser-perl_3.60.bb
index b87f78d..522e4c0 100644
--- a/recipes/perl/libhtml-parser-perl_3.60.bb
+++ b/recipes/perl/libhtml-parser-perl_3.60.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 PR = "r1"
 
-RDEPENDS = "perl-module-test-more \
+RDEPENDS_${PN} = "perl-module-test-more \
             perl-module-xsloader \
             perl-module-test-simple \
             libhtml-tagset-perl"
diff --git a/recipes/perl/libhtml-parser-perl_3.64.bb b/recipes/perl/libhtml-parser-perl_3.64.bb
index 00199f8..fdc59e0 100644
--- a/recipes/perl/libhtml-parser-perl_3.64.bb
+++ b/recipes/perl/libhtml-parser-perl_3.64.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 PR = "r1"
 
-RDEPENDS = "perl-module-test-more \
+RDEPENDS_${PN} = "perl-module-test-more \
             perl-module-xsloader \
             perl-module-test-simple \
             libhtml-tagset-perl"
diff --git a/recipes/perl/libhtml-treebuilder-perl_3.23.bb b/recipes/perl/libhtml-treebuilder-perl_3.23.bb
index ac0a5b8..7063918 100644
--- a/recipes/perl/libhtml-treebuilder-perl_3.23.bb
+++ b/recipes/perl/libhtml-treebuilder-perl_3.23.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 PR = "r3"
 
-RDEPENDS = "perl-module-extutils-makemaker"
+RDEPENDS_${PN} = "perl-module-extutils-makemaker"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PETEK/HTML-Tree-${PV}.tar.gz"
 
diff --git a/recipes/perl/libintl-perl_1.11.bb b/recipes/perl/libintl-perl_1.11.bb
index cf5af66..4272022 100644
--- a/recipes/perl/libintl-perl_1.11.bb
+++ b/recipes/perl/libintl-perl_1.11.bb
@@ -9,7 +9,7 @@ SRC_URI[md5sum] = "091e05542e36f030c785f2919f05b73f"
 SRC_URI[sha256sum] = "71e397949e79eb0f789f73259db5fc7be1e2ba1c604510c8d44b101d7d6e6479"
 
 DEPENDS = "perl"
-RDEPENDS = "perl-module-vars perl-module-locale perl-module-io-handle perl-module-symbol perl-module-selectsaver perl-module-io perl-module-integer perl-module-exporter-heavy"
+RDEPENDS_${PN} = "perl-module-vars perl-module-locale perl-module-io-handle perl-module-symbol perl-module-selectsaver perl-module-io perl-module-integer perl-module-exporter-heavy"
 
 S = "${WORKDIR}/libintl-perl-${PV}"
 
diff --git a/recipes/perl/libintl-perl_1.16.bb b/recipes/perl/libintl-perl_1.16.bb
index 50c6145..c7a8211 100644
--- a/recipes/perl/libintl-perl_1.16.bb
+++ b/recipes/perl/libintl-perl_1.16.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "libintl-perl is an internationalization library for Perl"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
-RDEPENDS = "perl-module-vars perl-module-locale perl-module-io-handle \
+RDEPENDS_${PN} = "perl-module-vars perl-module-locale perl-module-io-handle \
             perl-module-symbol perl-module-selectsaver perl-module-io \
             perl-module-integer perl-module-exporter-heavy"
 PR = "r4"
diff --git a/recipes/perl/libintl-perl_1.20.bb b/recipes/perl/libintl-perl_1.20.bb
index 0905f66..4c41c33 100644
--- a/recipes/perl/libintl-perl_1.20.bb
+++ b/recipes/perl/libintl-perl_1.20.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "libintl-perl is an internationalization library for Perl"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
-RDEPENDS = "perl-module-vars perl-module-locale perl-module-io-handle \
+RDEPENDS_${PN} = "perl-module-vars perl-module-locale perl-module-io-handle \
             perl-module-symbol perl-module-selectsaver perl-module-io \
             perl-module-integer perl-module-exporter-heavy"
 PR = "r0"
diff --git a/recipes/perl/libio-zlib-perl_1.04.bb b/recipes/perl/libio-zlib-perl_1.04.bb
index 6d70409..32b44ae 100644
--- a/recipes/perl/libio-zlib-perl_1.04.bb
+++ b/recipes/perl/libio-zlib-perl_1.04.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "IO::Zlib - IO:: style interface to Compress::Zlib"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS = "libcompress-zlib-perl-native"
-RDEPENDS += "libcompress-zlib-perl"
+RDEPENDS_${PN} += "libcompress-zlib-perl"
 PR = "r5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TO/TOMHUGHES/IO-Zlib-${PV}.tar.gz"
diff --git a/recipes/perl/libio-zlib-perl_1.10.bb b/recipes/perl/libio-zlib-perl_1.10.bb
index de891dd..30c0228 100644
--- a/recipes/perl/libio-zlib-perl_1.10.bb
+++ b/recipes/perl/libio-zlib-perl_1.10.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "IO::Zlib - IO:: style interface to Compress::Zlib"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS = "libcompress-zlib-perl-native"
-RDEPENDS += "libcompress-zlib-perl"
+RDEPENDS_${PN} += "libcompress-zlib-perl"
 PR = "r0"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TO/TOMHUGHES/IO-Zlib-${PV}.tar.gz;name=io-zlib-${PV}"
diff --git a/recipes/perl/libmath-bigint-gmp-perl_1.18.bb b/recipes/perl/libmath-bigint-gmp-perl_1.18.bb
index 7b57983..7014703 100644
--- a/recipes/perl/libmath-bigint-gmp-perl_1.18.bb
+++ b/recipes/perl/libmath-bigint-gmp-perl_1.18.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Math::BigInt::GMP - Use the GMP library for Math::BigInt routines
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS += "gmp-native"
-RDEPENDS += "gmp"
+RDEPENDS_${PN} += "gmp"
 PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TE/TELS/math/Math-BigInt-GMP-${PV}.tar.gz"
diff --git a/recipes/perl/libmime-lite-perl_3.024.bb b/recipes/perl/libmime-lite-perl_3.024.bb
index d6dfa04..fae42e3 100644
--- a/recipes/perl/libmime-lite-perl_3.024.bb
+++ b/recipes/perl/libmime-lite-perl_3.024.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 PR = "r1"
 
-RDEPENDS = "perl-module-file-spec \
+RDEPENDS_${PN} = "perl-module-file-spec \
             libemail-date-format-perl \
             perl-module-test-more \
             perl-module-time-local"
diff --git a/recipes/perl/libmodule-build-perl_0.2805.bb b/recipes/perl/libmodule-build-perl_0.2805.bb
index c4ecea4..095d485 100644
--- a/recipes/perl/libmodule-build-perl_0.2805.bb
+++ b/recipes/perl/libmodule-build-perl_0.2805.bb
@@ -6,7 +6,7 @@ DEPENDS = "libyaml-perl-native libversion-perl-native \
            libextutils-cbuilder-perl-native \
            libextutils-parsexs-perl-native \
            libarchive-tar-perl-native"
-RDEPENDS = "libyaml-perl libversion-perl libextutils-cbuilder-perl \
+RDEPENDS_${PN} = "libyaml-perl libversion-perl libextutils-cbuilder-perl \
             libextutils-parsexs-perl libarchive-tar-perl"
 PR = "r5"
 
diff --git a/recipes/perl/libmodule-load-perl_0.16.bb b/recipes/perl/libmodule-load-perl_0.16.bb
index 107bbe2..5063990 100644
--- a/recipes/perl/libmodule-load-perl_0.16.bb
+++ b/recipes/perl/libmodule-load-perl_0.16.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 PR = "r1"
 
-RDEPENDS = "perl-module-test-more"
+RDEPENDS_${PN} = "perl-module-test-more"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/K/KA/KANE/Module-Load-${PV}.tar.gz"
 
diff --git a/recipes/perl/libnet-dbus-perl_0.33.5.bb b/recipes/perl/libnet-dbus-perl_0.33.5.bb
index f301068..5e18628 100644
--- a/recipes/perl/libnet-dbus-perl_0.33.5.bb
+++ b/recipes/perl/libnet-dbus-perl_0.33.5.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 PR = "r0"
 
-RDEPENDS = "perl-module-vars perl-module-locale perl-module-io-handle \
+RDEPENDS_${PN} = "perl-module-vars perl-module-locale perl-module-io-handle \
             perl-module-symbol perl-module-selectsaver perl-module-io \
             perl-module-integer perl-module-exporter-heavy"
 
diff --git a/recipes/perl/libnet-dbus-perl_0.33.6.bb b/recipes/perl/libnet-dbus-perl_0.33.6.bb
index 45a52e1..15a0633 100644
--- a/recipes/perl/libnet-dbus-perl_0.33.6.bb
+++ b/recipes/perl/libnet-dbus-perl_0.33.6.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Net::DBus - Perl D-Bus module"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 
-RDEPENDS = "perl-module-vars perl-module-locale perl-module-io-handle \
+RDEPENDS_${PN} = "perl-module-vars perl-module-locale perl-module-io-handle \
             perl-module-symbol perl-module-selectsaver perl-module-io \
             perl-module-integer perl-module-exporter-heavy"
 
diff --git a/recipes/perl/libnet-ip-perl_1.25.bb b/recipes/perl/libnet-ip-perl_1.25.bb
index 201bf57..ec88045 100644
--- a/recipes/perl/libnet-ip-perl_1.25.bb
+++ b/recipes/perl/libnet-ip-perl_1.25.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Net::IP - Perl extension for manipulating IPv4/IPv6 addresses"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS += "libio-zlib-perl-native"
-RDEPENDS += "libio-zlib-perl perl-module-math-bigint"
+RDEPENDS_${PN} += "libio-zlib-perl perl-module-math-bigint"
 PR = "r6"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MANU/Net-IP-${PV}.tar.gz"
diff --git a/recipes/perl/libnet-rawip-perl_0.25.bb b/recipes/perl/libnet-rawip-perl_0.25.bb
index e0da338..57cdf4e 100644
--- a/recipes/perl/libnet-rawip-perl_0.25.bb
+++ b/recipes/perl/libnet-rawip-perl_0.25.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Perl extension to manipulate raw IP packets with interface to lib
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS = "libpcap"
-RDEPENDS = " \
+RDEPENDS_${PN} = " \
 	 perl-module-class-struct \
 	 perl-module-data-dumper \
 	 perl-module-english \
diff --git a/recipes/perl/libparams-util-perl_0.20.bb b/recipes/perl/libparams-util-perl_0.20.bb
index e988f19..7ad689b 100644
--- a/recipes/perl/libparams-util-perl_0.20.bb
+++ b/recipes/perl/libparams-util-perl_0.20.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Params::Util - Simple, compact and correct param-checking functions"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
-RDEPENDS += "perl-module-exporter perl-module-overload \
+RDEPENDS_${PN} += "perl-module-exporter perl-module-overload \
              perl-module-scalar-util perl-module-strict perl-module-vars"
 PR = "r4"
 
diff --git a/recipes/perl/libsub-exporter-perl_0.970.bb b/recipes/perl/libsub-exporter-perl_0.970.bb
index 574eaa6..4b299e3 100644
--- a/recipes/perl/libsub-exporter-perl_0.970.bb
+++ b/recipes/perl/libsub-exporter-perl_0.970.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS += "libdata-optlist-perl-native libsub-install-perl-native \
             libparams-util-perl-native"
-RDEPENDS += "perl-module-carp libdata-optlist-perl libparams-util-perl \
+RDEPENDS_${PN} += "perl-module-carp libdata-optlist-perl libparams-util-perl \
              perl-module-strict libsub-install-perl perl-module-warnings"
 PR = "r4"
 
diff --git a/recipes/perl/libsub-install-perl_0.922.bb b/recipes/perl/libsub-install-perl_0.922.bb
index eb49db4..5af0cc5 100644
--- a/recipes/perl/libsub-install-perl_0.922.bb
+++ b/recipes/perl/libsub-install-perl_0.922.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Sub::Install - install subroutines into packages easily"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
-RDEPENDS += "perl-module-carp perl-module-scalar-util perl-module-strict \
+RDEPENDS_${PN} += "perl-module-carp perl-module-scalar-util perl-module-strict \
              perl-module-warnings"
 PR = "r4"
 
diff --git a/recipes/perl/libsub-uplevel-perl_0.13.bb b/recipes/perl/libsub-uplevel-perl_0.13.bb
index 754f471..c8227e5 100644
--- a/recipes/perl/libsub-uplevel-perl_0.13.bb
+++ b/recipes/perl/libsub-uplevel-perl_0.13.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Sub::Uplevel - apparently run a function in a higher stack frame"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
-RDEPENDS += "perl-module-exporter perl-module-strict perl-module-vars"
+RDEPENDS_${PN} += "perl-module-exporter perl-module-strict perl-module-vars"
 PR = "r4"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Sub-Uplevel-${PV}.tar.gz"
diff --git a/recipes/perl/libtest-builder-tester-perl_1.01.bb b/recipes/perl/libtest-builder-tester-perl_1.01.bb
index 73259f9..78373ca 100644
--- a/recipes/perl/libtest-builder-tester-perl_1.01.bb
+++ b/recipes/perl/libtest-builder-tester-perl_1.01.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Test::Builder::Tester - test testsuites that have been built with Test::Builder"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
-RDEPENDS += "perl-module-strict perl-module-carp perl-module-exporter \
+RDEPENDS_${PN} += "perl-module-strict perl-module-carp perl-module-exporter \
              perl-module-symbol perl-module-vars"
 PR = "r3"
 
diff --git a/recipes/perl/libtest-differences-perl_0.47.bb b/recipes/perl/libtest-differences-perl_0.47.bb
index 434fefb..ea95fa7 100644
--- a/recipes/perl/libtest-differences-perl_0.47.bb
+++ b/recipes/perl/libtest-differences-perl_0.47.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Test::Differences - Test strings and data structures and show dif
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS += "libtext-diff-perl-native"
-RDEPENDS += "perl-module-carp perl-module-constant perl-module-exporter \
+RDEPENDS_${PN} += "perl-module-carp perl-module-constant perl-module-exporter \
              perl-module-strict libtext-diff-perl"
 PR = "r3"
 
diff --git a/recipes/perl/libtest-exception-perl_0.22.bb b/recipes/perl/libtest-exception-perl_0.22.bb
index e48e177..11213f0 100644
--- a/recipes/perl/libtest-exception-perl_0.22.bb
+++ b/recipes/perl/libtest-exception-perl_0.22.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Test::Exception - Test exception based code"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS += "libsub-uplevel-perl-native"
-RDEPENDS += "perl-module-base perl-module-carp perl-module-strict \
+RDEPENDS_${PN} += "perl-module-base perl-module-carp perl-module-strict \
              libsub-uplevel-perl perl-module-test-builder \
              perl-module-warnings"
 PR = "r3"
diff --git a/recipes/perl/libtest-mockmodule-perl_0.05.bb b/recipes/perl/libtest-mockmodule-perl_0.05.bb
index 3ceedd3..f49eef2 100644
--- a/recipes/perl/libtest-mockmodule-perl_0.05.bb
+++ b/recipes/perl/libtest-mockmodule-perl_0.05.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Test::MockModule - Override subroutines in a module for unit testing"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
-RDEPENDS += "perl-module-carp perl-module-scalar-util perl-module-strict \
+RDEPENDS_${PN} += "perl-module-carp perl-module-scalar-util perl-module-strict \
              perl-module-vars "
 PR = "r3"
 
diff --git a/recipes/perl/libtest-output-perl_0.10.bb b/recipes/perl/libtest-output-perl_0.10.bb
index 1746a08..ce1eb9a 100644
--- a/recipes/perl/libtest-output-perl_0.10.bb
+++ b/recipes/perl/libtest-output-perl_0.10.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Test::Output - Utilities to test STDOUT and STDERR messages"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS += "libsub-exporter-perl-native"
-RDEPENDS += "libsub-exporter-perl"
+RDEPENDS_${PN} += "libsub-exporter-perl"
 PR = "r3"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SS/SSORICHE/Test-Output-${PV}.tar.gz"
diff --git a/recipes/perl/libtext-diff-perl_0.35.bb b/recipes/perl/libtext-diff-perl_0.35.bb
index 122dea6..c48b1eb 100644
--- a/recipes/perl/libtext-diff-perl_0.35.bb
+++ b/recipes/perl/libtext-diff-perl_0.35.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Text::Diff - Perform diffs on files and record sets"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS += "libalgorithm-diff-perl-native"
-RDEPENDS += "libalgorithm-diff-perl perl-module-carp perl-module-constant \
+RDEPENDS_${PN} += "libalgorithm-diff-perl perl-module-carp perl-module-constant \
              perl-module-exporter perl-module-strict perl-module-carp \
              perl-module-strict "
 PR = "r4"
diff --git a/recipes/perl/libtimedate-perl_1.20.bb b/recipes/perl/libtimedate-perl_1.20.bb
index bbf9873..fcd9b4f 100644
--- a/recipes/perl/libtimedate-perl_1.20.bb
+++ b/recipes/perl/libtimedate-perl_1.20.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 PR = "r0"
 
-RDEPENDS += "perl-module-carp perl-module-exporter perl-module-strict perl-module-time-local"
+RDEPENDS_${PN} += "perl-module-carp perl-module-exporter perl-module-strict perl-module-time-local"
 PACKAGE_ARCH = "all"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.gz"
diff --git a/recipes/perl/liburi-perl_1.52.bb b/recipes/perl/liburi-perl_1.52.bb
index 8b522aa..e32495a 100644
--- a/recipes/perl/liburi-perl_1.52.bb
+++ b/recipes/perl/liburi-perl_1.52.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Manipulates and accesses URI strings"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
-#RDEPENDS += " libmime-base64-perl libnet-perl"
+#RDEPENDS_${PN} += " libmime-base64-perl libnet-perl"
 PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/URI-${PV}.tar.gz"
diff --git a/recipes/perl/libxml-dom-perl_1.44.bb b/recipes/perl/libxml-dom-perl_1.44.bb
index e89d87c..66e158d 100644
--- a/recipes/perl/libxml-dom-perl_1.44.bb
+++ b/recipes/perl/libxml-dom-perl_1.44.bb
@@ -7,7 +7,7 @@ DEPENDS += "libxml-parser-perl-native libxml-regexp-perl-native \
 	libhtml-parser-perl-native libhtml-tagset-perl-native \
 	liburi-perl-native libwww-perl-native"
 
-RDEPENDS += "libxml-parser-perl libxml-regexp-perl \
+RDEPENDS_${PN} += "libxml-parser-perl libxml-regexp-perl \
 	libhtml-parser-perl libhtml-tagset-perl liburi-perl libwww-perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TJ/TJMATHER/XML-DOM-${PV}.tar.gz"
diff --git a/recipes/perl/libyaml-perl_0.62.bb b/recipes/perl/libyaml-perl_0.62.bb
index 99f798f..c98c797 100644
--- a/recipes/perl/libyaml-perl_0.62.bb
+++ b/recipes/perl/libyaml-perl_0.62.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS = "libdigest-sha1-perl-native liberror-perl-native \
            libipc-sharelite-perl-native"
-RDEPENDS = "libdigest-sha1-perl liberror-perl libipc-sharelite-perl"
+RDEPENDS_${PN} = "libdigest-sha1-perl liberror-perl libipc-sharelite-perl"
 PR = "r5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/I/IN/INGY/YAML-${PV}.tar.gz"
diff --git a/recipes/pimlico/contacts.inc b/recipes/pimlico/contacts.inc
index 6baab5e..bd37226 100644
--- a/recipes/pimlico/contacts.inc
+++ b/recipes/pimlico/contacts.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Address-book application."
 LICENSE = "LGPL"
 SECTION = "x11"
 DEPENDS = "glib-2.0 gtk+ eds-dbus libowl"
-RDEPENDS = "libedata-book"
+RDEPENDS_${PN} = "libedata-book"
 
 inherit autotools pkgconfig
 
diff --git a/recipes/pimlico/contacts_svn.bb b/recipes/pimlico/contacts_svn.bb
index daf1014..bf34650 100644
--- a/recipes/pimlico/contacts_svn.bb
+++ b/recipes/pimlico/contacts_svn.bb
@@ -1,8 +1,8 @@
 require contacts.inc
 
 #DEPENDS += "gnome-vfs"
-#RDEPENDS += "gnome-vfs-plugin-file"
-#RRECOMMENDS += "gnome-vfs-plugin-http"
+#RDEPENDS_${PN} += "gnome-vfs-plugin-file"
+#RRECOMMENDS_${PN} += "gnome-vfs-plugin-http"
 
 PV = "0.8+svnr${SRCPV}"
 
diff --git a/recipes/pimlico/dates.inc b/recipes/pimlico/dates.inc
index 40a88ea..b0d4f7b 100644
--- a/recipes/pimlico/dates.inc
+++ b/recipes/pimlico/dates.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Dates is a calendar application."
 LICENSE = "LGPL"
 SECTION = "x11"
 DEPENDS = "glib-2.0 gtk+ libglade eds-dbus libowl"
-RDEPENDS = "libedata-cal"
+RDEPENDS_${PN} = "libedata-cal"
 
 inherit autotools pkgconfig gtk-icon-cache
 
diff --git a/recipes/plone/plone_3.1.7.bb b/recipes/plone/plone_3.1.7.bb
index 0df2a65..222b9a0 100644
--- a/recipes/plone/plone_3.1.7.bb
+++ b/recipes/plone/plone_3.1.7.bb
@@ -12,7 +12,7 @@ do_install() {
 	cp -pPR ${S}/* ${D}${libdir}/python/Products/
 }
 
-RDEPENDS = "zope"
+RDEPENDS_${PN} = "zope"
 FILES_${PN} = "${libdir}/python/Products/"
 
 SRC_URI[md5sum] = "d2690e2c6d9f477ee0d3851388c0fef9"
diff --git a/recipes/poboxserver/qpobox_0.5.4.bb b/recipes/poboxserver/qpobox_0.5.4.bb
index f107e4d..ee0b211 100644
--- a/recipes/poboxserver/qpobox_0.5.4.bb
+++ b/recipes/poboxserver/qpobox_0.5.4.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A japanese inputmethod for Qt/Embedded based palmtop environments."
 SECTION = "opie/inputmethods"
-RDEPENDS = "poboxserver virtual-japanese-font"
+RDEPENDS_${PN} = "poboxserver virtual-japanese-font"
 LICENSE = "GPL"
 HOMEPAGE = "http://takahr.dhis.portside.net/cgi-bin/rwiki.cgi?cmd=view;name=QPOBox"
 PR = "r2"
diff --git a/recipes/podget/podget_0.5.8.bb b/recipes/podget/podget_0.5.8.bb
index f5b0508..82e12e1 100644
--- a/recipes/podget/podget_0.5.8.bb
+++ b/recipes/podget/podget_0.5.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://podget.sourceforge.net/"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS += "virtual/libiconv"
-RDEPENDS = "bash sed wget"
+RDEPENDS_${PN} = "bash sed wget"
 PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/podget/podget_${PV}.tar.gz \
diff --git a/recipes/poppler/poppler_0.12.3.bb b/recipes/poppler/poppler_0.12.3.bb
index 8aa63ff..988c541 100644
--- a/recipes/poppler/poppler_0.12.3.bb
+++ b/recipes/poppler/poppler_0.12.3.bb
@@ -5,7 +5,7 @@ DEFAULT_PREFERENCE_angstrom = "1"
 
 EXTRA_OECONF_append = " --disable-abiword-output "
 
-RDEPENDS = "poppler-data"
+RDEPENDS_${PN} = "poppler-data"
 
 SRC_URI[md5sum] = "d0ca8344d8d94e27aaba6d432688365d"
 SRC_URI[sha256sum] = "7a4ffe6d2950c446c285700d3b2dc399540a27ce635dd712aff646f02f8dfbcc"
diff --git a/recipes/poptop/poptop_1.3.0.bb b/recipes/poptop/poptop_1.3.0.bb
index b51e17d..5d430a0 100644
--- a/recipes/poptop/poptop_1.3.0.bb
+++ b/recipes/poptop/poptop_1.3.0.bb
@@ -9,7 +9,7 @@ LICENSE     = "GPL"
 SECTION = "network"
 PRIORITY    = "optional"
 DEPENDS     = "ppp"
-RDEPENDS    = "ppp"
+RDEPENDS_${PN}    = "ppp"
 
 PR = "r0"
 
diff --git a/recipes/povray/povray_3.6.1.bb b/recipes/povray/povray_3.6.1.bb
index 33a6e17..f5aea2b 100644
--- a/recipes/povray/povray_3.6.1.bb
+++ b/recipes/povray/povray_3.6.1.bb
@@ -4,7 +4,7 @@ SECTION = "console/graphics"
 #Make this a weak assigment to allow branding of the povray binary
 LICENSE = "povray"
 DEPENDS = "virtual/libx11 zlib jpeg libpng tiff"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 PR = "r2"
 
diff --git a/recipes/ppp-dialin/ppp-dialin_0.1.bb b/recipes/ppp-dialin/ppp-dialin_0.1.bb
index 51a4a2b..0ed55d2 100644
--- a/recipes/ppp-dialin/ppp-dialin_0.1.bb
+++ b/recipes/ppp-dialin/ppp-dialin_0.1.bb
@@ -1,7 +1,7 @@
 SECTION = "console/network"
 DESCRIPTION = "Enables PPP dial-in through a serial connection"
 DEPENDS = "ppp"
-RDEPENDS = "ppp"
+RDEPENDS_${PN} = "ppp"
 PR = "r6"
 LICENSE = "MIT"
 
diff --git a/recipes/ppp-dsl/ppp-dsl_0.1.bb b/recipes/ppp-dsl/ppp-dsl_0.1.bb
index 8d63e8f..a43781b 100644
--- a/recipes/ppp-dsl/ppp-dsl_0.1.bb
+++ b/recipes/ppp-dsl/ppp-dsl_0.1.bb
@@ -2,8 +2,8 @@ SECTION = "console/network"
 DESCRIPTION = "Enables PPP dial-in through a DSL connection"
 LICENSE = "PD"
 DEPENDS = "ppp rp-pppoe"
-RDEPENDS = "ppp rp-pppoe"
-RRECOMMENDS = "kernel-module-ppp-async kernel-module-ppp-generic kernel-module-slhc"
+RDEPENDS_${PN} = "ppp rp-pppoe"
+RRECOMMENDS_${PN} = "kernel-module-ppp-async kernel-module-ppp-generic kernel-module-slhc"
 PR = "r5"
 
 SRC_URI = "file://dsl-provider \
diff --git a/recipes/ppp/ppp-gprs_1.0.bb b/recipes/ppp/ppp-gprs_1.0.bb
index 2db6e80..e016324 100644
--- a/recipes/ppp/ppp-gprs_1.0.bb
+++ b/recipes/ppp/ppp-gprs_1.0.bb
@@ -1,7 +1,7 @@
 SECTION = "console/network"
 DESCRIPTION = "PPP scripts for easy GPRS connection"
 LICENSE = "GPL"
-RDEPENDS = "ppp"
+RDEPENDS_${PN} = "ppp"
 PR = "r1"
 
 SRC_URI = "file://peers/* file://chats/*"
diff --git a/recipes/pptp-linux/pptp-linux_1.7.1.bb b/recipes/pptp-linux/pptp-linux_1.7.1.bb
index c281025..332f06d 100644
--- a/recipes/pptp-linux/pptp-linux_1.7.1.bb
+++ b/recipes/pptp-linux/pptp-linux_1.7.1.bb
@@ -6,7 +6,7 @@ cable and ADSL internet service providers."
 HOMEPAGE = "http://pptpclient.sourceforge.net"
 SECTION = "network"
 LICENSE = "GPL"
-RDEPENDS = "ppp"
+RDEPENDS_${PN} = "ppp"
 PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/sourceforge/pptpclient/pptp-${PV}.tar.gz \
diff --git a/recipes/prboom/prboom_2.4.7.bb b/recipes/prboom/prboom_2.4.7.bb
index deeb4cd..e94f842 100644
--- a/recipes/prboom/prboom_2.4.7.bb
+++ b/recipes/prboom/prboom_2.4.7.bb
@@ -5,7 +5,7 @@ DEPENDS = "virtual/libsdl libsdl-mixer libsdl-net"
 LICENSE = "GPL"
 
 PR = "r1"
-RRECOMMENDS = "freedoom"
+RRECOMMENDS_${PN} = "freedoom"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/prboom/prboom-${PV}.tar.gz \
 	   "
diff --git a/recipes/prboom/prboom_2.5.0.bb b/recipes/prboom/prboom_2.5.0.bb
index 18bd5f1..4fd0d2a 100644
--- a/recipes/prboom/prboom_2.5.0.bb
+++ b/recipes/prboom/prboom_2.5.0.bb
@@ -5,7 +5,7 @@ DEPENDS = "virtual/libsdl libsdl-mixer libsdl-net"
 LICENSE = "GPL"
 
 PR = "r1"
-RRECOMMENDS = "freedoom"
+RRECOMMENDS_${PN} = "freedoom"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/prboom/prboom-${PV}.tar.gz \
 	   "
diff --git a/recipes/prism54/prism54-module_1.2.bb b/recipes/prism54/prism54-module_1.2.bb
index c1dee8d..8bd3308 100644
--- a/recipes/prism54/prism54-module_1.2.bb
+++ b/recipes/prism54/prism54-module_1.2.bb
@@ -3,8 +3,8 @@ SECTION = "base"
 PRIORITY = "optional"
 HOMEPAGE = "http://prism54.org"
 LICENSE = "GPL"
-RDEPENDS = "kernel (${KERNEL_VERSION}) prism54-firmware (1.0.3.0) hotplug"
-RRECOMMENDS = "kernel-module-firmware-class"
+RDEPENDS_${PN} = "kernel (${KERNEL_VERSION}) prism54-firmware (1.0.3.0) hotplug"
+RRECOMMENDS_${PN} = "kernel-module-firmware-class"
 DEPENDS = "virtual/kernel prism54-firmware"
 PR = "r1"
 
diff --git a/recipes/prismstumbler/prismstumbler_0.7.3+0.7.4pre1.bb b/recipes/prismstumbler/prismstumbler_0.7.3+0.7.4pre1.bb
index dd36ce7..00493d8 100644
--- a/recipes/prismstumbler/prismstumbler_0.7.3+0.7.4pre1.bb
+++ b/recipes/prismstumbler/prismstumbler_0.7.3+0.7.4pre1.bb
@@ -6,8 +6,8 @@ DESCRIPTION = "Prismstumbler wireless LAN scanner"
 DESCRIPTION_prismstumbler-frontend = "Prismstumbler wireless LAN scanner GTK frontend"
 LICENSE = "GPL"
 DEPENDS = "libpcap gtk+ wireless-tools sqlite zlib dbus-glib gpsd"
-RDEPENDS = "wireless-tools"
-RRECOMMENDS = "gpsd"
+RDEPENDS_${PN} = "wireless-tools"
+RRECOMMENDS_${PN} = "gpsd"
 
 # wireless.patch is required for linux-libc-headers == 2.6.23
 # but breaks build with linux-libc-headers >= 2.6.30.
diff --git a/recipes/prismstumbler/prismstumbler_0.7.3.bb b/recipes/prismstumbler/prismstumbler_0.7.3.bb
index 531efcc..7cb7411 100644
--- a/recipes/prismstumbler/prismstumbler_0.7.3.bb
+++ b/recipes/prismstumbler/prismstumbler_0.7.3.bb
@@ -5,7 +5,7 @@ PACKAGES = "${PN}-dbg prismstumbler prismstumbler-frontend prismstumbler-doc"
 DESCRIPTION = "Prismstumbler wireless LAN scanner"
 LICENSE = "GPL"
 DEPENDS = "libpcap gtk+ wireless-tools sqlite zlib libxpm"
-RDEPENDS = "wireless-tools"
+RDEPENDS_${PN} = "wireless-tools"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/prismstumbler/${PN}-${PV}.tar.bz2 \
 	file://bogoconf.patch \
diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
index b7dd6e8..71fd7bd 100644
--- a/recipes/psplash/psplash.inc
+++ b/recipes/psplash/psplash.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Userspace framebuffer boot logo based on usplash."
 HOMEPAGE = "http://projects.o-hand.com/psplash"
 SECTION = "base"
 LICENSE = "GPL"
-RDEPENDS = "initscripts"
+RDEPENDS_${PN} = "initscripts"
 PROVIDES = "virtual/psplash"
 RPROVIDES_${PN} = "virtual-psplash"
 RCONFLICTS_${PN} = "exquisite"
diff --git a/recipes/pulseaudio/pulseaudio-alsa-wrapper.bb b/recipes/pulseaudio/pulseaudio-alsa-wrapper.bb
index e555d50..a428ded 100644
--- a/recipes/pulseaudio/pulseaudio-alsa-wrapper.bb
+++ b/recipes/pulseaudio/pulseaudio-alsa-wrapper.bb
@@ -5,7 +5,7 @@ PR = "r1"
 
 SRC_URI = "file://asound.conf.pulseaudio"
 
-RDEPENDS = "hal \
+RDEPENDS_${PN} = "hal \
 	pulseaudio-server \
 	pulseaudio-misc \
 	pulseaudio-module-alsa-sink \
diff --git a/recipes/pulseaudio/pulseaudio-esd-wrapper.bb b/recipes/pulseaudio/pulseaudio-esd-wrapper.bb
index d1ae362..1eef52b 100644
--- a/recipes/pulseaudio/pulseaudio-esd-wrapper.bb
+++ b/recipes/pulseaudio/pulseaudio-esd-wrapper.bb
@@ -6,7 +6,7 @@ PR = "r1"
 RCONFLICTS = "esd"
 RREPLACES = "esd"
 
-RDEPENDS = " \
+RDEPENDS_${PN} = " \
 	pulseaudio-server \
 	pulseaudio-misc \
 	pulseaudio-lib-protocol-esound \
diff --git a/recipes/pulseaudio/pulseaudio-meta_0.9.10.bb b/recipes/pulseaudio/pulseaudio-meta_0.9.10.bb
index 7f5f72d..0b06105 100644
--- a/recipes/pulseaudio/pulseaudio-meta_0.9.10.bb
+++ b/recipes/pulseaudio/pulseaudio-meta_0.9.10.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Pulseaudio Meta package w/ initscript et. al."
 SECTION = "audio"
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   pulseaudio-server \
   pulseaudio-module-alsa-sink \
   pulseaudio-module-alsa-source \
diff --git a/recipes/pvrusb2-mci/pvrusb2-mci_20060903.bb b/recipes/pvrusb2-mci/pvrusb2-mci_20060903.bb
index ffc1c8f..d3b9746 100644
--- a/recipes/pvrusb2-mci/pvrusb2-mci_20060903.bb
+++ b/recipes/pvrusb2-mci/pvrusb2-mci_20060903.bb
@@ -3,7 +3,7 @@
 
 require pvrusb2-mci2.inc
 
-RRECOMMENDS = "kernel-module-tveeprom \
+RRECOMMENDS_${PN} = "kernel-module-tveeprom \
 	kernel-module-firmware-class \
 	kernel-module-tuner \
 	kernel-module-msp3400 \
diff --git a/recipes/pvrusb2-mci/pvrusb2-mci_20080210.bb b/recipes/pvrusb2-mci/pvrusb2-mci_20080210.bb
index 92ff4c1..d4c5a71 100644
--- a/recipes/pvrusb2-mci/pvrusb2-mci_20080210.bb
+++ b/recipes/pvrusb2-mci/pvrusb2-mci_20080210.bb
@@ -3,7 +3,7 @@
 
 require pvrusb2-mci2.inc
 
-RRECOMMENDS = "kernel-module-tveeprom \
+RRECOMMENDS_${PN} = "kernel-module-tveeprom \
 	kernel-module-firmware-class \
 	kernel-module-tuner \
 	kernel-module-msp3400 \
diff --git a/recipes/pyphonelog/pyphonelog_git.bb b/recipes/pyphonelog/pyphonelog_git.bb
index 54da541..30a4bc9 100644
--- a/recipes/pyphonelog/pyphonelog_git.bb
+++ b/recipes/pyphonelog/pyphonelog_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://wiki.openmoko.org/wiki/PyPhonelog"
 SECTION = "x11/applications"
 LICENSE = "GPLv2"
 SRCNAME = "pyphonelog"
-RDEPENDS += "python python-pygtk python-sqlite3 python-phoneutils"
+RDEPENDS_${PN} += "python python-pygtk python-sqlite3 python-phoneutils"
 
 inherit distutils
 
diff --git a/recipes/python/pydes_1.3.1.bb b/recipes/python/pydes_1.3.1.bb
index b63c59b..7a12a35 100644
--- a/recipes/python/pydes_1.3.1.bb
+++ b/recipes/python/pydes_1.3.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python DES implementation"
 SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "python"
+RDEPENDS_${PN} = "python"
 
 PR = "r1"
 ARCH_pydes = "all"
diff --git a/recipes/python/pyring_1.1.10.bb b/recipes/python/pyring_1.1.10.bb
index 7bd5d6b..4d2e413 100644
--- a/recipes/python/pyring_1.1.10.bb
+++ b/recipes/python/pyring_1.1.10.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python keyring"
 SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "python python-pygtk python-xml python-netclient python-numeric pydes"
+RDEPENDS_${PN} = "python python-pygtk python-xml python-netclient python-numeric pydes"
 
 ARCH_pyring = "all"
 
diff --git a/recipes/python/python-blipapi_0.02.04.bb b/recipes/python/python-blipapi_0.02.04.bb
index 4fcb2b1..6324ad3 100644
--- a/recipes/python/python-blipapi_0.02.04.bb
+++ b/recipes/python/python-blipapi_0.02.04.bb
@@ -3,7 +3,7 @@ AUTHOR = "Marcin Sztolcman <marcin@urzenia.net>"
 HOMEPAGE = "http://blipapi.googlecode.com/"
 DEPENDS = "python-setuptools"
 LICENSE = "GPL"
-RDEPENDS += "python-json"
+RDEPENDS_${PN} += "python-json"
 PR = "r0"
 inherit setuptools
 
diff --git a/recipes/python/python-cheetah_2.0.1.bb b/recipes/python/python-cheetah_2.0.1.bb
index 82d7bbf..def89eb 100644
--- a/recipes/python/python-cheetah_2.0.1.bb
+++ b/recipes/python/python-cheetah_2.0.1.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
 
-RDEPENDS = "python-pickle python-pprint"
+RDEPENDS_${PN} = "python-pickle python-pprint"
 
 SRC_URI[md5sum] = "7845a2950ea850a13c488a26b61ac50a"
 SRC_URI[sha256sum] = "70b618a03506831f59ba1ff8433907ee8d4ead5fc9f1b3f610d384e08a26938c"
diff --git a/recipes/python/python-cython-native_0.10.3.bb b/recipes/python/python-cython-native_0.10.3.bb
index a5c78ce..d7867c4 100644
--- a/recipes/python/python-cython-native_0.10.3.bb
+++ b/recipes/python/python-cython-native_0.10.3.bb
@@ -1,7 +1,7 @@
 require python-cython_${PV}.bb
 inherit native
 DEPENDS = "python-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 do_stage() {
     BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
diff --git a/recipes/python/python-cython-native_0.12.1.bb b/recipes/python/python-cython-native_0.12.1.bb
index 95886ae..d42d1fd 100644
--- a/recipes/python/python-cython-native_0.12.1.bb
+++ b/recipes/python/python-cython-native_0.12.1.bb
@@ -1,7 +1,7 @@
 require python-cython_${PV}.bb
 inherit native
 DEPENDS = "python-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 do_stage() {
     PYTHONPATH=${STAGING_BINDIR} BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
diff --git a/recipes/python/python-cython-native_0.12.bb b/recipes/python/python-cython-native_0.12.bb
index 95886ae..d42d1fd 100644
--- a/recipes/python/python-cython-native_0.12.bb
+++ b/recipes/python/python-cython-native_0.12.bb
@@ -1,7 +1,7 @@
 require python-cython_${PV}.bb
 inherit native
 DEPENDS = "python-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 do_stage() {
     PYTHONPATH=${STAGING_BINDIR} BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
diff --git a/recipes/python/python-daap_0.7.1.bb b/recipes/python/python-daap_0.7.1.bb
index 806297f..a16573a 100644
--- a/recipes/python/python-daap_0.7.1.bb
+++ b/recipes/python/python-daap_0.7.1.bb
@@ -8,7 +8,7 @@ inherit distutils
 SRC_URI = "http://jerakeen.org/files/PythonDaap-${PV}.tar.gz"
 S = "${WORKDIR}/PythonDaap-${PV}"
 
-RDEPENDS = "python-compression"
+RDEPENDS_${PN} = "python-compression"
 
 
 SRC_URI[md5sum] = "b3db3d60b0ee83f5f23101d2c3bb99e0"
diff --git a/recipes/python/python-ecore_svn.bb b/recipes/python/python-ecore_svn.bb
index 94daaf1..ed8a0ca 100644
--- a/recipes/python/python-ecore_svn.bb
+++ b/recipes/python/python-ecore_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "python-evas ecore"
-RDEPENDS += "python-evas"
+RDEPENDS_${PN} += "python-evas"
 
 do_stage() {
     distutils_stage_all
diff --git a/recipes/python/python-edbus_svn.bb b/recipes/python/python-edbus_svn.bb
index 00fffed..799ba18 100644
--- a/recipes/python/python-edbus_svn.bb
+++ b/recipes/python/python-edbus_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "edbus python-dbus"
-RDEPENDS += "python-dbus"
+RDEPENDS_${PN} += "python-dbus"
 
 SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk/BINDINGS/python;module=python-e_dbus;proto=http"
 S = "${WORKDIR}/python-e_dbus"
diff --git a/recipes/python/python-edje_svn.bb b/recipes/python/python-edje_svn.bb
index 793db0c..09cfbb0 100644
--- a/recipes/python/python-edje_svn.bb
+++ b/recipes/python/python-edje_svn.bb
@@ -1,6 +1,6 @@
 require python-efl.inc
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "edje python-evas"
-RDEPENDS += "python-evas"
+RDEPENDS_${PN} += "python-evas"
 
 SRC_URI += "file://0001-fix-unicode-conversion.patch"
diff --git a/recipes/python/python-efl.inc b/recipes/python/python-efl.inc
index 9ed7a4c..d8559ea 100644
--- a/recipes/python/python-efl.inc
+++ b/recipes/python/python-efl.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 # we need to build pyrex otherwise cython doesn't get called to build
 # the extension modules.
 DEPENDS = "python-cython-native python-pyrex-native python-numeric eina"
-RDEPENDS += "python-lang"
+RDEPENDS_${PN} += "python-lang"
 PV = "0.3.1+svnr${SRCPV}"
 PR = "ml0"
 
diff --git a/recipes/python/python-elementary_svn.bb b/recipes/python/python-elementary_svn.bb
index ad82e04..72948c0 100644
--- a/recipes/python/python-elementary_svn.bb
+++ b/recipes/python/python-elementary_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary"
-RDEPENDS += "python-evas python-ecore python-edje" 
+RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
 PV = "0.1+svnr${SRCPV}"
 PR = "ml0"
 
diff --git a/recipes/python/python-emotion_svn.bb b/recipes/python/python-emotion_svn.bb
index 38e1355..9f558f8 100644
--- a/recipes/python/python-emotion_svn.bb
+++ b/recipes/python/python-emotion_svn.bb
@@ -1,4 +1,4 @@
 require python-efl.inc
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "emotion python-evas"
-RDEPENDS += "python-ecore"
+RDEPENDS_${PN} += "python-ecore"
diff --git a/recipes/python/python-fam_1.1.1.bb b/recipes/python/python-fam_1.1.1.bb
index e7ff4bb..b8ceada 100644
--- a/recipes/python/python-fam_1.1.1.bb
+++ b/recipes/python/python-fam_1.1.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.gz"
 
 inherit distutils
 
-RDEPENDS = "fam python-core python-io"
+RDEPENDS_${PN} = "fam python-core python-io"
 
 
 SRC_URI[md5sum] = "f6c760c6d8e5ea69a3fce029f7973558"
diff --git a/recipes/python/python-gdata_1.2.4.bb b/recipes/python/python-gdata_1.2.4.bb
index 6c85726..6e74f60 100644
--- a/recipes/python/python-gdata_1.2.4.bb
+++ b/recipes/python/python-gdata_1.2.4.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/gdata.py-${PV}"
 
 FILES_${PN} += "${datadir}"
 
-RDEPENDS = "python-elementtree"
+RDEPENDS_${PN} = "python-elementtree"
 
 
 SRC_URI[md5sum] = "521f33a377d64f8a6505ba119415b787"
diff --git a/recipes/python/python-imaging_1.1.6.bb b/recipes/python/python-imaging_1.1.6.bb
index cf8f348..3cf8760 100644
--- a/recipes/python/python-imaging_1.1.6.bb
+++ b/recipes/python/python-imaging_1.1.6.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "freetype jpeg tiff"
-RDEPENDS = "python-lang python-stringold"
+RDEPENDS_${PN} = "python-lang python-stringold"
 SRCNAME = "Imaging"
 PR = "ml1"
 
diff --git a/recipes/python/python-iniparse-native_0.2.3.bb b/recipes/python/python-iniparse-native_0.2.3.bb
index 68dd218..8c17505 100644
--- a/recipes/python/python-iniparse-native_0.2.3.bb
+++ b/recipes/python/python-iniparse-native_0.2.3.bb
@@ -1,7 +1,7 @@
 require python-iniparse_${PV}.bb
 inherit native
 DEPENDS = "python-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 PR = "r1"
 
 do_stage() {
diff --git a/recipes/python/python-libgmail_0.1.11.bb b/recipes/python/python-libgmail_0.1.11.bb
index 308652a..644f3b8 100644
--- a/recipes/python/python-libgmail_0.1.11.bb
+++ b/recipes/python/python-libgmail_0.1.11.bb
@@ -19,7 +19,7 @@ do_install() {
 	done
 }
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   python-core \
   python-netclient \
   python-email \
diff --git a/recipes/python/python-netfilter_0.5.5.bb b/recipes/python/python-netfilter_0.5.5.bb
index 3722625..4537d78 100644
--- a/recipes/python/python-netfilter_0.5.5.bb
+++ b/recipes/python/python-netfilter_0.5.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python module to manage netfilter rules"
 SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "iptables iptables-utils python-logging python-shell python-subprocess"
+RDEPENDS_${PN} = "iptables iptables-utils python-logging python-shell python-subprocess"
 SRCNAME = "python-netfilter"
 PR = "ml0"
 
diff --git a/recipes/python/python-pexpect_2.3.bb b/recipes/python/python-pexpect_2.3.bb
index 329e13b..a661c21 100644
--- a/recipes/python/python-pexpect_2.3.bb
+++ b/recipes/python/python-pexpect_2.3.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   python-core \
   python-io \
   python-terminal \
diff --git a/recipes/python/python-phoneutils_git.bb b/recipes/python/python-phoneutils_git.bb
index 1cf705a..492f803 100644
--- a/recipes/python/python-phoneutils_git.bb
+++ b/recipes/python/python-phoneutils_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python Bindings for libphone-utils"
 SECTION = "devel/python"
 DEPENDS = "libphone-utils python-cython-native python-pyrex-native"
-RDEPENDS = "libphone-utils"
+RDEPENDS_${PN} = "libphone-utils"
 
 SRCREV = "8a7c719e0c3f1f8c10f77f17422da02d7177f0dd"
 PV = "0.0.2+gitr${SRCPV}"
diff --git a/recipes/python/python-psyco_1.6.bb b/recipes/python/python-psyco_1.6.bb
index 7cc09bb..f916fb8 100644
--- a/recipes/python/python-psyco_1.6.bb
+++ b/recipes/python/python-psyco_1.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://psyco.sourceforge.net"
 SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "PSF"
-RDEPENDS = "python-core"
+RDEPENDS_${PN} = "python-core"
 SRCNAME = "psyco"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}-src.tar.gz"
diff --git a/recipes/python/python-pycap_0.1.6.bb b/recipes/python/python-pycap_0.1.6.bb
index 0757d5f..61d4b53 100644
--- a/recipes/python/python-pycap_0.1.6.bb
+++ b/recipes/python/python-pycap_0.1.6.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python Packet Capture Library"
 SECTION = "devel/python"
 PRIORITY = "optional"
-RDEPENDS = "python-core"
+RDEPENDS_${PN} = "python-core"
 DEPENDS = "libpcap libnet"
 SRCNAME = "pycap"
 PR = "r1"
diff --git a/recipes/python/python-pycups_1.9.45.bb b/recipes/python/python-pycups_1.9.45.bb
index 145cd7c..66afd92 100644
--- a/recipes/python/python-pycups_1.9.45.bb
+++ b/recipes/python/python-pycups_1.9.45.bb
@@ -13,7 +13,7 @@ inherit distutils
 # used during compilation
 CFLAGS += -DVERSION=\\"${PV}\\"
 
-RDEPENDS = "python-core cups"
+RDEPENDS_${PN} = "python-core cups"
 
 SRC_URI[md5sum] = "ff634a6751f8a859ed26751bf03abef0"
 SRC_URI[sha256sum] = "ef6e576e5465da9c338ac8ff9f162825cfb7997359efc52e6a110c295a9f363b"
diff --git a/recipes/python/python-pycurl_7.18.2.bb b/recipes/python/python-pycurl_7.18.2.bb
index c66e94c..401a46c 100644
--- a/recipes/python/python-pycurl_7.18.2.bb
+++ b/recipes/python/python-pycurl_7.18.2.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
 
-RDEPENDS = "python-core curl (>=${PV})"
+RDEPENDS_${PN} = "python-core curl (>=${PV})"
 
 SRC_URI[md5sum] = "39210d56f1d5a75ac8dd6a2866a93dd5"
 SRC_URI[sha256sum] = "95d21bd61e03d22ee4ac18fc0b9040c163cb504c4b2cf1dc43c18f32508f6736"
diff --git a/recipes/python/python-pycurl_7.19.0.bb b/recipes/python/python-pycurl_7.19.0.bb
index 3551b32..7160985 100644
--- a/recipes/python/python-pycurl_7.19.0.bb
+++ b/recipes/python/python-pycurl_7.19.0.bb
@@ -16,4 +16,4 @@ SRC_URI[archive.sha256sum] = "eb782dfcc5a7c023539a077462b83c167e178128ee9f720166
 
 inherit distutils
 
-RDEPENDS = "python-core curl"
+RDEPENDS_${PN} = "python-core curl"
diff --git a/recipes/python/python-pyfits_1.3.bb b/recipes/python/python-pyfits_1.3.bb
index ea99a46..bf5f077 100644
--- a/recipes/python/python-pyfits_1.3.bb
+++ b/recipes/python/python-pyfits_1.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "PyFITS provides an interface to FITS formatted files under the Python scripting language."
 HOMEPAGE = "http://www.stsci.edu/resources/software_hardware/pyfits"
 AUTHOR = "Space Telescope Science Institute"
-RDEPENDS = "python-numpy"
+RDEPENDS_${PN} = "python-numpy"
 SECTION = "devel/python"
 LICENSE = "AURA"
 PR = "ml0"
diff --git a/recipes/python/python-pyftpdlib_0.5.1.bb b/recipes/python/python-pyftpdlib_0.5.1.bb
index b2ee723..1cee075 100644
--- a/recipes/python/python-pyftpdlib_0.5.1.bb
+++ b/recipes/python/python-pyftpdlib_0.5.1.bb
@@ -9,7 +9,7 @@ inherit distutils
 SRC_URI = "http://pyftpdlib.googlecode.com/files/pyftpdlib-${PV}.tar.gz"
 S = "${WORKDIR}/pyftpdlib-${PV}"
 
-RDEPENDS = "python-netserver"
+RDEPENDS_${PN} = "python-netserver"
 
 SRC_URI[md5sum] = "f64ac67ebec1d8ab47c0766082617384"
 SRC_URI[sha256sum] = "6daed9475412eaab232e021ed76568c6520dacd75c58da406454139bef95c393"
diff --git a/recipes/python/python-pygame_1.9.1.bb b/recipes/python/python-pygame_1.9.1.bb
index bbeedda..dba915f 100644
--- a/recipes/python/python-pygame_1.9.1.bb
+++ b/recipes/python/python-pygame_1.9.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.pygame.org"
 LICENSE = "LGPL"
 DEPENDS = "libsdl-x11 libsdl-image libsdl-mixer libsdl-net libsdl-ttf python-numeric"
 DEPENDS += "${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'smpeg', d)}"
-RDEPENDS = "python-numeric"
+RDEPENDS_${PN} = "python-numeric"
 SRCNAME = "pygame"
 PR = "ml4"
 
diff --git a/recipes/python/python-pygoogle_0.6.bb b/recipes/python/python-pygoogle_0.6.bb
index 69ee9f8..29e6d63 100644
--- a/recipes/python/python-pygoogle_0.6.bb
+++ b/recipes/python/python-pygoogle_0.6.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 HOMEPAGE = "http://pygoogle.sourceforge.net/"
 PRIORITY = "optional"
 LICENSE = "PSF"
-RDEPENDS = "python-soappy"
+RDEPENDS_${PN} = "python-soappy"
 SRCNAME = "pygoogle"
 PR = "ml1"
 
diff --git a/recipes/python/python-pygtk-1.2_0.6.12.bb b/recipes/python/python-pygtk-1.2_0.6.12.bb
index f8dcdd0..c8410bf 100644
--- a/recipes/python/python-pygtk-1.2_0.6.12.bb
+++ b/recipes/python/python-pygtk-1.2_0.6.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gtk.org"
 SECTION = "devel/python"
 LICENSE = "LGPL"
 DEPENDS = "gtk+-1.2"
-RDEPENDS = "python-shell python-re"
+RDEPENDS_${PN} = "python-shell python-re"
 SRCNAME = "pygtk"
 PR = "r3"
 
diff --git a/recipes/python/python-pygtk_2.10.4.bb b/recipes/python/python-pygtk_2.10.4.bb
index daf854c..cab2d7b 100644
--- a/recipes/python/python-pygtk_2.10.4.bb
+++ b/recipes/python/python-pygtk_2.10.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python GTK+ 2.10.x Bindings"
 SECTION = "devel/python"
 # needs gtk+ 2.10.x
 DEPENDS = "gtk+ libglade python-pycairo python-pygobject"
-RDEPENDS = "python-shell python-pycairo python-pygobject"
+RDEPENDS_${PN} = "python-shell python-pycairo python-pygobject"
 PROVIDES = "python-pygtk2"
 SRCNAME = "pygtk"
 LICENSE = "LGPL"
diff --git a/recipes/python/python-pygtk_2.16.0.bb b/recipes/python/python-pygtk_2.16.0.bb
index eaea9af..40a8be2 100644
--- a/recipes/python/python-pygtk_2.16.0.bb
+++ b/recipes/python/python-pygtk_2.16.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python GTK+ 2.10.x Bindings"
 SECTION = "devel/python"
 # needs gtk+ 2.10.x
 DEPENDS = "gtk+ libglade python-pycairo python-pygobject"
-RDEPENDS = "python-shell python-pycairo python-pygobject"
+RDEPENDS_${PN} = "python-shell python-pycairo python-pygobject"
 PROVIDES = "python-pygtk2"
 SRCNAME = "pygtk"
 LICENSE = "LGPL"
diff --git a/recipes/python/python-pygtk_2.6.3.bb b/recipes/python/python-pygtk_2.6.3.bb
index e37fe1f..73565f5 100644
--- a/recipes/python/python-pygtk_2.6.3.bb
+++ b/recipes/python/python-pygtk_2.6.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python GTK+ Bindings"
 SECTION = "devel/python"
 DEPENDS = "gtk+-2.6.10 libglade"
-RDEPENDS = "python-shell"
+RDEPENDS_${PN} = "python-shell"
 SRCNAME = "pygtk"
 LICENSE = "LGPL"
 PR = "ml1"
diff --git a/recipes/python/python-pygtk_2.8.6.bb b/recipes/python/python-pygtk_2.8.6.bb
index a96cca7..c595ef4 100644
--- a/recipes/python/python-pygtk_2.8.6.bb
+++ b/recipes/python/python-pygtk_2.8.6.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 PRIORITY = "optional"
 # needs gtk+ 2.8.x
 DEPENDS = "gtk+-2.8.16 libglade"
-RDEPENDS = "python-shell"
+RDEPENDS_${PN} = "python-shell"
 SRCNAME = "pygtk"
 LICENSE = "LGPL"
 PR = "r2"
diff --git a/recipes/python/python-pylint_0.15.2.bb b/recipes/python/python-pylint_0.15.2.bb
index dd8805a..9a8c736 100644
--- a/recipes/python/python-pylint_0.15.2.bb
+++ b/recipes/python/python-pylint_0.15.2.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 HOMEPAGE = "http://www.logilab.org/857"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "python-logilab-common"
+RDEPENDS_${PN} = "python-logilab-common"
 SRCNAME = "pylint"
 PR = "ml0"
 
diff --git a/recipes/python/python-pymp3_0.3.4.bb b/recipes/python/python-pymp3_0.3.4.bb
index 436285d..978e2e2 100644
--- a/recipes/python/python-pymp3_0.3.4.bb
+++ b/recipes/python/python-pymp3_0.3.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A Curses-based mp3 player. See http://damien.degois.info/PyMP3/"
 SECTION = "console/multimedia"
 PRIORITY = "optional"
-RDEPENDS = "python-core python-curses python-pyid3lib python-mad python-ao"
+RDEPENDS_${PN} = "python-core python-curses python-pyid3lib python-mad python-ao"
 LICENSE = "GPL"
 PR = "r3"
 
diff --git a/recipes/python/python-pyopenssl_0.8.bb b/recipes/python/python-pyopenssl_0.8.bb
index 0fb3941..3ec4e4d 100644
--- a/recipes/python/python-pyopenssl_0.8.bb
+++ b/recipes/python/python-pyopenssl_0.8.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
 
-RDEPENDS = "python-threading"
+RDEPENDS_${PN} = "python-threading"
 
 
 SRC_URI[md5sum] = "00377690f224d9e59c833fb0459603f4"
diff --git a/recipes/python/python-pyqt_4.4.3.bb b/recipes/python/python-pyqt_4.4.3.bb
index a0003aa..7c75dad 100644
--- a/recipes/python/python-pyqt_4.4.3.bb
+++ b/recipes/python/python-pyqt_4.4.3.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "sip-native python-sip"
-RDEPENDS = "python-core"
+RDEPENDS_${PN} = "python-core"
 SRCNAME = "pyqt"
 PR = "ml5"
 
diff --git a/recipes/python/python-pyrad_1.1.bb b/recipes/python/python-pyrad_1.1.bb
index 5736aa6..52025ba 100644
--- a/recipes/python/python-pyrad_1.1.bb
+++ b/recipes/python/python-pyrad_1.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python Radius Client and Server"
 SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "BSD"
-RDEPENDS = "python-crypt"
+RDEPENDS_${PN} = "python-crypt"
 SRCNAME = "pyrad"
 PR = "r1"
 
diff --git a/recipes/python/python-pyraf_1.7.bb b/recipes/python/python-pyraf_1.7.bb
index cdb55ad..ce0aa8c 100644
--- a/recipes/python/python-pyraf_1.7.bb
+++ b/recipes/python/python-pyraf_1.7.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/pyraf-${PV}"
 
 inherit distutils
 
-RDEPENDS = "python-numarray"
+RDEPENDS_${PN} = "python-numarray"
 
 
 SRC_URI[md5sum] = "9a728aef7bebcd54abc103b00e2e1de6"
diff --git a/recipes/python/python-pyrex-native_0.9.8.5.bb b/recipes/python/python-pyrex-native_0.9.8.5.bb
index 62cb4ae..109b49e 100644
--- a/recipes/python/python-pyrex-native_0.9.8.5.bb
+++ b/recipes/python/python-pyrex-native_0.9.8.5.bb
@@ -1,7 +1,7 @@
 require python-pyrex_${PV}.bb
 inherit native
 DEPENDS = "python-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 do_stage() {
 	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
diff --git a/recipes/python/python-pyro_3.8.1.bb b/recipes/python/python-pyro_3.8.1.bb
index a36fe9b..89d4707 100644
--- a/recipes/python/python-pyro_3.8.1.bb
+++ b/recipes/python/python-pyro_3.8.1.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/Pyro-${PV}"
 
 inherit distutils
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   python-crypt \
   python-io \
   python-lang \
diff --git a/recipes/python/python-pyserial_2.4.bb b/recipes/python/python-pyserial_2.4.bb
index 9c5ea88..1e16a2b 100644
--- a/recipes/python/python-pyserial_2.4.bb
+++ b/recipes/python/python-pyserial_2.4.bb
@@ -12,7 +12,7 @@ inherit setuptools
 
 # FIXME might stop packaging serialwin32 and serialjava files
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   python-fcntl \
   python-io \
   python-stringold \
diff --git a/recipes/python/python-pysqlite2-native_2.4.0.bb b/recipes/python/python-pysqlite2-native_2.4.0.bb
index 0a7d667..7740628 100644
--- a/recipes/python/python-pysqlite2-native_2.4.0.bb
+++ b/recipes/python/python-pysqlite2-native_2.4.0.bb
@@ -1,7 +1,7 @@
 require python-pysqlite2_${PV}.bb
 inherit native
 DEPENDS = "python-native sqlite3-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 do_stage() {
     BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
diff --git a/recipes/python/python-pysqlite2_2.4.0.bb b/recipes/python/python-pysqlite2_2.4.0.bb
index 3ed8940..37bb1fb 100644
--- a/recipes/python/python-pysqlite2_2.4.0.bb
+++ b/recipes/python/python-pysqlite2_2.4.0.bb
@@ -17,7 +17,7 @@ do_install_append() {
     mv ${D}${datadir}/pysqlite2-doc ${D}${datadir}/doc/${PN}
 }
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
  python-datetime \
  python-lang \
  python-crypt \
diff --git a/recipes/python/python-pyxml_0.8.4.bb b/recipes/python/python-pyxml_0.8.4.bb
index d8022ba..ba776d3 100644
--- a/recipes/python/python-pyxml_0.8.4.bb
+++ b/recipes/python/python-pyxml_0.8.4.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/PyXML-${PV}"
 
 inherit distutils
 
-RDEPENDS = "python-xml python-netclient"
+RDEPENDS_${PN} = "python-xml python-netclient"
 
 
 SRC_URI[md5sum] = "1f7655050cebbb664db976405fdba209"
diff --git a/recipes/python/python-scapy_2.0.0.9.bb b/recipes/python/python-scapy_2.0.0.9.bb
index 36256da..67df8b1 100644
--- a/recipes/python/python-scapy_2.0.0.9.bb
+++ b/recipes/python/python-scapy_2.0.0.9.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   python-netclient \
   python-netserver \
 "
diff --git a/recipes/python/python-scons-native_1.2.0.bb b/recipes/python/python-scons-native_1.2.0.bb
index f946782..bdad3ee 100644
--- a/recipes/python/python-scons-native_1.2.0.bb
+++ b/recipes/python/python-scons-native_1.2.0.bb
@@ -1,7 +1,7 @@
 require python-scons_${PV}.bb
 inherit native
 DEPENDS = "python-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 do_stage() {
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
diff --git a/recipes/python/python-setuptools_0.6c9.bb b/recipes/python/python-setuptools_0.6c9.bb
index df24384..506a936 100644
--- a/recipes/python/python-setuptools_0.6c9.bb
+++ b/recipes/python/python-setuptools_0.6c9.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/setuptools"
 SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "MIT"
-RDEPENDS = "python-distutils python-compression"
 SRCNAME = "setuptools"
 PR = "ml0"
 
@@ -19,7 +18,7 @@ do_install_prepend() {
     install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
 }
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   python-distutils \
   python-compression \
 "
diff --git a/recipes/python/python-simplejson_2.0.7.bb b/recipes/python/python-simplejson_2.0.7.bb
index d99d61a..f10ed7e 100644
--- a/recipes/python/python-simplejson_2.0.7.bb
+++ b/recipes/python/python-simplejson_2.0.7.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   python-core \
   python-re \
   python-io \
diff --git a/recipes/python/python-sip.inc b/recipes/python/python-sip.inc
index 1267d07..99af450 100644
--- a/recipes/python/python-sip.inc
+++ b/recipes/python/python-sip.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
 AUTHOR = "Phil Thompson"
 LICENSE = "GPL"
 DEPENDS = "python"
-RDEPENDS = "python-core"
+RDEPENDS_${PN} = "python-core"
 
 SRC_URI = "http://www.riverbankcomputing.com/static/Downloads/sip4/sip-${PV}.tar.gz"
 
diff --git a/recipes/python/python-soappy_0.11.6.bb b/recipes/python/python-soappy_0.11.6.bb
index 93e9fd1..25ef6a7 100644
--- a/recipes/python/python-soappy_0.11.6.bb
+++ b/recipes/python/python-soappy_0.11.6.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 HOMEPAGE = "http://pywebsvcs.sourceforge.net/"
 PRIORITY = "optional"
 LICENSE = "BSD"
-RDEPENDS = "python-xml python-fpconst"
+RDEPENDS_${PN} = "python-xml python-fpconst"
 SRCNAME = "SOAPpy"
 PR = "r1"
 
diff --git a/recipes/python/python-sqlobject_0.10.4.bb b/recipes/python/python-sqlobject_0.10.4.bb
index 44d2516..45de2b5 100644
--- a/recipes/python/python-sqlobject_0.10.4.bb
+++ b/recipes/python/python-sqlobject_0.10.4.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-RDEPENDS = "python-formencode"
+RDEPENDS_${PN} = "python-formencode"
 
 SRC_URI[md5sum] = "20039279c5b799c49e6496b9fe71f03f"
 SRC_URI[sha256sum] = "8204bf5aeaca5b72e6bf3bd11db440346f3ed6d13b856166e3b84c4b3ec7152f"
diff --git a/recipes/python/python-traits_3.0.3.bb b/recipes/python/python-traits_3.0.3.bb
index 83ee814..187f0da 100644
--- a/recipes/python/python-traits_3.0.3.bb
+++ b/recipes/python/python-traits_3.0.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/Traits-${PV}"
 
-RDEPENDS = "python-netclient"
+RDEPENDS_${PN} = "python-netclient"
 
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/enthought/traits/.debug"
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/enthought/traits/protocols/.debug"
diff --git a/recipes/python/python-twisted_2.5.0.bb b/recipes/python/python-twisted_2.5.0.bb
index d8f2458..63f0a43 100644
--- a/recipes/python/python-twisted_2.5.0.bb
+++ b/recipes/python/python-twisted_2.5.0.bb
@@ -29,7 +29,7 @@ PACKAGES += "\
   ${PN}-core \
 "
 
-RDEPENDS = "python-core python-zopeinterface"
+RDEPENDS_${PN} = "python-core python-zopeinterface"
 RDEPENDS_${PN} += "\
   ${PN}-bin \
   ${PN}-conch \
diff --git a/recipes/python/python-twisted_8.2.0.bb b/recipes/python/python-twisted_8.2.0.bb
index 0d84c8c..0925d1c 100644
--- a/recipes/python/python-twisted_8.2.0.bb
+++ b/recipes/python/python-twisted_8.2.0.bb
@@ -30,7 +30,7 @@ PACKAGES += "\
   ${PN}-core \
 "
 
-RDEPENDS = "python-core python-zopeinterface"
+RDEPENDS_${PN} = "python-core python-zopeinterface"
 RDEPENDS_${PN} += "\
   ${PN}-bin \
   ${PN}-conch \
diff --git a/recipes/python/python-urlgrabber-native_3.1.0.bb b/recipes/python/python-urlgrabber-native_3.1.0.bb
index 5c2af55..d7468df 100644
--- a/recipes/python/python-urlgrabber-native_3.1.0.bb
+++ b/recipes/python/python-urlgrabber-native_3.1.0.bb
@@ -1,7 +1,7 @@
 require python-urlgrabber_${PV}.bb
 inherit native
 DEPENDS = "python-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 PR = "r1"
 
 do_stage() {
diff --git a/recipes/python/python-vobject_0.8.1c.bb b/recipes/python/python-vobject_0.8.1c.bb
index f86e7a3..afb41ca 100644
--- a/recipes/python/python-vobject_0.8.1c.bb
+++ b/recipes/python/python-vobject_0.8.1c.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "Apache License V2.0" 
 HOMEPAGE = "http://vobject.skyhouseconsulting.com/" 
 SRCNAME = "vobject" 
-RDEPENDS = "python python-dateutil"
+RDEPENDS_${PN} = "python python-dateutil"
 PR = "r1"
 
 SRC_URI = "http://vobject.skyhouseconsulting.com/${SRCNAME}-${PV}.tar.gz" 
diff --git a/recipes/python/python-webpy_0.31.bb b/recipes/python/python-webpy_0.31.bb
index b3af54c..ce87b0d 100644
--- a/recipes/python/python-webpy_0.31.bb
+++ b/recipes/python/python-webpy_0.31.bb
@@ -9,7 +9,7 @@ S = "${WORKDIR}/webpy"
 
 inherit distutils
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   python-netserver \
   python-netclient \
   python-pprint \
diff --git a/recipes/python/yum-metadata-parser-native_1.1.2.bb b/recipes/python/yum-metadata-parser-native_1.1.2.bb
index 15d26a1..5d91345 100644
--- a/recipes/python/yum-metadata-parser-native_1.1.2.bb
+++ b/recipes/python/yum-metadata-parser-native_1.1.2.bb
@@ -1,7 +1,7 @@
 require yum-metadata-parser_${PV}.bb
 inherit native
 DEPENDS = "python-native sqlite3-native glib-2.0-native libxml2-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 PR = "r1"
 
 do_stage() {
diff --git a/recipes/qpe-gaim/qpe-gaim_20041030.bb b/recipes/qpe-gaim/qpe-gaim_20041030.bb
index c26d710..3a6f5fe 100644
--- a/recipes/qpe-gaim/qpe-gaim_20041030.bb
+++ b/recipes/qpe-gaim/qpe-gaim_20041030.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A multi protocol instant messager application, Qt/Embedded based Palmtop Environments Edition"
 SECTION = "opie/applications"
 DEPENDS = "qpe-libgaim glib-2.0"
-RDEPENDS = "libgaim-plugins glibc-gconv-iso8859-1"
+RDEPENDS_${PN} = "libgaim-plugins glibc-gconv-iso8859-1"
 LICENSE = "GPL"
 HOMEPAGE = "http://qpe-gaim.sourceforge.net/"
 APPNAME = "gaim"
diff --git a/recipes/qpe-gaim/qpe-libgaim_1.5.0.bb b/recipes/qpe-gaim/qpe-libgaim_1.5.0.bb
index 872c729..6556c86 100644
--- a/recipes/qpe-gaim/qpe-libgaim_1.5.0.bb
+++ b/recipes/qpe-gaim/qpe-libgaim_1.5.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A multi protocol instant messager library, Qt/Embedded based Palmtop Environments Edition"
 SECTION = "opie/applications"
 DEPENDS = "glib-2.0 gnutls"
-RDEPENDS = "libgaim-plugins"
+RDEPENDS_${PN} = "libgaim-plugins"
 LICENSE = "GPL"
 HOMEPAGE = "http://gaim.sourceforge.net/"
 PR = "r3"
diff --git a/recipes/qpe-nmap/qpe-nmap_0.02.bb b/recipes/qpe-nmap/qpe-nmap_0.02.bb
index c607776..9afb478 100644
--- a/recipes/qpe-nmap/qpe-nmap_0.02.bb
+++ b/recipes/qpe-nmap/qpe-nmap_0.02.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A frontend for the nmap port scanner, Qt/Embedded Palmtop Environ
 SECTION = "opie/applications"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "nmap"
+RDEPENDS_${PN} = "nmap"
 PR = "r0"
 
 SRC_URI = "http://www.bluelightning.org/qpe-nmap/files/qpe-nmap-${PV}.tar.bz2"
diff --git a/recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb b/recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb
index de38d97..fd8b456 100644
--- a/recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb
+++ b/recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 AUTHOR = "Anton Maslovsky"
 HOMEPAGE = "http://my-zaurus.narod.ru/"
-RDEPENDS = "qpealarmclock"
+RDEPENDS_${PN} = "qpealarmclock"
 RCONFLICTS = "opie-clockapplet"
 RREPLACES = "opie-clockapplet"
 
diff --git a/recipes/qpegps/qpegps.inc b/recipes/qpegps/qpegps.inc
index e117d5f..68baf8c 100644
--- a/recipes/qpegps/qpegps.inc
+++ b/recipes/qpegps/qpegps.inc
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 HOMEPAGE = "http://qpegps.sourceforge.net/"
 
 DEPENDS = "gpsd"
-RRECOMMENDS = "gpsd"
+RRECOMMENDS_${PN} = "gpsd"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/qpegps/qpegps_${PV}_src.zip \
            file://qpegps.desktop \
diff --git a/recipes/qpf-fonts/qpf.inc b/recipes/qpf-fonts/qpf.inc
index 97e6658..c2ff3c1 100644
--- a/recipes/qpf-fonts/qpf.inc
+++ b/recipes/qpf-fonts/qpf.inc
@@ -1,4 +1,4 @@
-RDEPENDS = "font-update-common qpf-font-common"
+RDEPENDS_${PN} = "font-update-common qpf-font-common"
 
 do_configure() {
 	:
diff --git a/recipes/quasar/quasar_0.9beta3.bb b/recipes/quasar/quasar_0.9beta3.bb
index dc40da4..3c3206a 100644
--- a/recipes/quasar/quasar_0.9beta3.bb
+++ b/recipes/quasar/quasar_0.9beta3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://katastrophos.net/andre/blog/software/quasar-media-player/"
 AUTHOR = "Andre Beckedorf"
 LICENSE = "GPL"
 SECTION = "multimedia"
-RDEPENDS = "mplayer"
+RDEPENDS_${PN} = "mplayer"
 PV = "0.8+0.9beta3"
 S = "${WORKDIR}/v0.9_beta3"
 
diff --git a/recipes/qwo/qwo_0.4.bb b/recipes/qwo/qwo_0.4.bb
index d226e5a..7059d67 100644
--- a/recipes/qwo/qwo_0.4.bb
+++ b/recipes/qwo/qwo_0.4.bb
@@ -5,7 +5,7 @@ SECTION = "x11"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
 DEPENDS = "libxtst libxext virtual/imlib2 libconfig"
-RDEPENDS += "imlib2-loaders"
+RDEPENDS_${PN} += "imlib2-loaders"
 PV = "0.4"
 PR = "r0"
 
diff --git a/recipes/qwo/qwo_0.5.bb b/recipes/qwo/qwo_0.5.bb
index c0a5cd0..fd73848 100644
--- a/recipes/qwo/qwo_0.5.bb
+++ b/recipes/qwo/qwo_0.5.bb
@@ -5,7 +5,7 @@ SECTION = "x11"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
 DEPENDS = "libxtst libxext virtual/imlib2 libconfig"
-RDEPENDS += "imlib2-loaders"
+RDEPENDS_${PN} += "imlib2-loaders"
 PR = "r1"
 
 SRC_URI = "http://download.savannah.nongnu.org/releases/qwo/qwo-${PV}.tar.gz \
diff --git a/recipes/qxmp/qxmp_1.0.bb b/recipes/qxmp/qxmp_1.0.bb
index 68feba4..0460207 100644
--- a/recipes/qxmp/qxmp_1.0.bb
+++ b/recipes/qxmp/qxmp_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Qxmp is a Qt4 media player based on MPlayer"
 LICENSE = "GPL"
 SECTION = "x11/multimedia"
 HOMEPAGE = "http://www.xm1math.net/qxmp/index.html"
-RDEPENDS = "mplayer"
+RDEPENDS_${PN} = "mplayer"
 
 SRC_URI = "http://www.xm1math.net/qxmp/qxmp-${PV}.tar.bz2"
 
diff --git a/recipes/rcs/rcs_5.7.bb b/recipes/rcs/rcs_5.7.bb
index 5d780f1..631a2a6 100644
--- a/recipes/rcs/rcs_5.7.bb
+++ b/recipes/rcs/rcs_5.7.bb
@@ -18,7 +18,7 @@ do_compile_prepend() {
 	install -m 0644 ${WORKDIR}/oe-src-conf.h ${S}/src/conf.h
 }
 
-RDEPENDS = "diffutils"
+RDEPENDS_${PN} = "diffutils"
 
 SRC_URI[md5sum] = "423282f0edb353296d9f3498ab683abf"
 SRC_URI[sha256sum] = "7b7d2f7f5c2bbb096d23ee6dc5590b7d0b84e16ed54694d5794b7a4a989a63ad"
diff --git a/recipes/remoko/remoko_svn.bb b/recipes/remoko/remoko_svn.bb
index 8a70a9b..7f803b8 100644
--- a/recipes/remoko/remoko_svn.bb
+++ b/recipes/remoko/remoko_svn.bb
@@ -13,5 +13,5 @@ S = "${WORKDIR}/BT_HID_UI"
 
 inherit distutils
 
-RDEPENDS = "remoko-server python-evas python-ecore python-edje python-edbus"
+RDEPENDS_${PN} = "remoko-server python-evas python-ecore python-edje python-edbus"
 FILES_${PN} += "${datadir}"
diff --git a/recipes/resolvconf/resolvconf_1.43.bb b/recipes/resolvconf/resolvconf_1.43.bb
index 9c89dc2..d03dda5 100644
--- a/recipes/resolvconf/resolvconf_1.43.bb
+++ b/recipes/resolvconf/resolvconf_1.43.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 DEPENDS = "bash"
-RDEPENDS = "bash"
+RDEPENDS_${PN} = "bash"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
diff --git a/recipes/resolvconf/resolvconf_1.45.bb b/recipes/resolvconf/resolvconf_1.45.bb
index 04490da..bc14dc4 100644
--- a/recipes/resolvconf/resolvconf_1.45.bb
+++ b/recipes/resolvconf/resolvconf_1.45.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 DEPENDS = "bash"
-RDEPENDS = "bash"
+RDEPENDS_${PN} = "bash"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
diff --git a/recipes/roadmap/roadmap.inc b/recipes/roadmap/roadmap.inc
index d98a7f8..a7e9544 100644
--- a/recipes/roadmap/roadmap.inc
+++ b/recipes/roadmap/roadmap.inc
@@ -15,5 +15,5 @@ do_install() {
         install -m 0644 ${WORKDIR}/usdir.rdm ${D}${datadir}/roadmap/
 }
 
-RRECOMMENDS = "gpsd flite"
+RRECOMMENDS_${PN} = "gpsd flite"
 FILES_${PN} += "${datadir}/roadmap"
diff --git a/recipes/roadster/roadster_cvs.bb b/recipes/roadster/roadster_cvs.bb
index 2dac8dd..0e1173a 100644
--- a/recipes/roadster/roadster_cvs.bb
+++ b/recipes/roadster/roadster_cvs.bb
@@ -7,7 +7,7 @@ PV = "0.0+cvs${SRCDATE}"
 PR = "r1"
 
 DEPENDS = "tcp-wrappers mysql gpsd gtk+ cairo libxml2 libgnomeui libglade"
-RDEPENDS = "gpsd gtk+ cairo libxml2"
+RDEPENDS_${PN} = "gpsd gtk+ cairo libxml2"
 
 SRC_URI = "cvs://anoncvs@cvs.cairographics.org/cvs/cairo;module=roadster"
 S = "${WORKDIR}/${PN}"
diff --git a/recipes/robostix-module/robostix-module.bb b/recipes/robostix-module/robostix-module.bb
index 7f95adf..7f13ed1 100644
--- a/recipes/robostix-module/robostix-module.bb
+++ b/recipes/robostix-module/robostix-module.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Linux Driver for Gumstix robostix daughtercards"
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "kernel (${KERNEL_VERSION})"
+RDEPENDS_${PN} = "kernel (${KERNEL_VERSION})"
 DEPENDS = "virtual/kernel"
 
 PR = "r1"
diff --git a/recipes/robostix/robostix.bb b/recipes/robostix/robostix.bb
index 368f5a1..403324f 100644
--- a/recipes/robostix/robostix.bb
+++ b/recipes/robostix/robostix.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Robostix programs"
 PRIORITY = "optional"
 SECTION = "base"
 LICENSE = "GPL"
-RDEPENDS = "kernel (${KERNEL_VERSION})"
+RDEPENDS_${PN} = "kernel (${KERNEL_VERSION})"
 DEPENDS = "virtual/kernel"
 
 PR = "r0"
diff --git a/recipes/rox/rox-filer_2.5.bb b/recipes/rox/rox-filer_2.5.bb
index 6e46ee9..196eb4f 100644
--- a/recipes/rox/rox-filer_2.5.bb
+++ b/recipes/rox/rox-filer_2.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://rox.sf.net"
 LICENSE = "GPL"
 SECTION = "x11/applications"
 DEPENDS = "gtk+ shared-mime-info"
-RDEPENDS = "shared-mime-info"
+RDEPENDS_${PN} = "shared-mime-info"
 PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/rox/${P}.tar.bz2 \
diff --git a/recipes/ruby/ruby-dbus_0.2.1.bb b/recipes/ruby/ruby-dbus_0.2.1.bb
index 909c833..3cb3ac1 100644
--- a/recipes/ruby/ruby-dbus_0.2.1.bb
+++ b/recipes/ruby/ruby-dbus_0.2.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "${PN} bindings"
 SECTION = "devel/ruby"
 LICENSE = "LGPL"
-RDEPENDS = "dbus ruby"
+RDEPENDS_${PN} = "dbus ruby"
 
 SRC_URI = "http://trac.luon.net/data/${PN}/releases/${PN}-0.2.1.tar.gz"
 
diff --git a/recipes/sablevm/sablevm_1.1.9.bb b/recipes/sablevm/sablevm_1.1.9.bb
index 7c5198c..5411481 100644
--- a/recipes/sablevm/sablevm_1.1.9.bb
+++ b/recipes/sablevm/sablevm_1.1.9.bb
@@ -8,7 +8,7 @@ PR = "r1"
 DEPENDS = "libffi libtool popt \
            sablevm-classpath"
 #          unzip"
-RRECOMMENDS = "sablevm-classpath (${PV})"
+RRECOMMENDS_${PN} = "sablevm-classpath (${PV})"
 
 SRC_URI = "http://sablevm.org/download/release/${PV}/${PN}-${PV}.tar.gz"
 
diff --git a/recipes/sablevm/sablevm_1.11.3.bb b/recipes/sablevm/sablevm_1.11.3.bb
index 434279d..7ed25ed 100644
--- a/recipes/sablevm/sablevm_1.11.3.bb
+++ b/recipes/sablevm/sablevm_1.11.3.bb
@@ -7,7 +7,7 @@ SECTION = "interpreters"
 DEPENDS = "libffi libtool popt \
            sablevm-classpath"
 #          unzip"
-RRECOMMENDS = "sablevm-classpath (>= ${PV})"
+RRECOMMENDS_${PN} = "sablevm-classpath (>= ${PV})"
 
 SRC_URI = "http://sablevm.org/download/release/${PV}/${PN}-${PV}.tar.gz"
 
diff --git a/recipes/sablevm/sablevm_1.12.bb b/recipes/sablevm/sablevm_1.12.bb
index 7d1ad8c..84e3d5b 100644
--- a/recipes/sablevm/sablevm_1.12.bb
+++ b/recipes/sablevm/sablevm_1.12.bb
@@ -7,7 +7,7 @@ SECTION = "interpreters"
 DEPENDS = "libffi libtool popt \
            sablevm-classpath"
 #          unzip"
-RRECOMMENDS = "sablevm-classpath (>= ${PV})"
+RRECOMMENDS_${PN} = "sablevm-classpath (>= ${PV})"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/sablevm/${PN}-${PV}.tar.gz \
            file://no-internal-libs.patch"
diff --git a/recipes/scratchbox/sbrsh_7.1.bb b/recipes/scratchbox/sbrsh_7.1.bb
index 6f0e7db..eee3237 100644
--- a/recipes/scratchbox/sbrsh_7.1.bb
+++ b/recipes/scratchbox/sbrsh_7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://scratchbox.org"
 LICENSE = "GPLv2"
 DEPENDS = "fakeroot"
 PR = "r1"
-RRECOMMENDS = "kernel-module-nfs"
+RRECOMMENDS_${PN} = "kernel-module-nfs"
 
 SRC_URI = "http://scratchbox.org/download/files/sbox-releases/1.0/src/${P}.tar.gz"
 
diff --git a/recipes/scummvm/opie-scummvm_1.0.1.bb b/recipes/scummvm/opie-scummvm_1.0.1.bb
index d65f93e..311d80f 100644
--- a/recipes/scummvm/opie-scummvm_1.0.1.bb
+++ b/recipes/scummvm/opie-scummvm_1.0.1.bb
@@ -6,7 +6,7 @@ APPNAME = "opie-scummvm"
 APPTYPE = "binary"
 APPDESKTOP = "${S}"
 
-RDEPENDS = "scummvm-qpe"
+RDEPENDS_${PN} = "scummvm-qpe"
 SRC_URI = "http://sickpeople.wmc-allstars.com/law/files/scummvm/opie-scummvm-${PV}-r0_arm.tar.bz2"
 
 SRC_URI[md5sum] = "a71902804ea20314b7336a3d566f1977"
diff --git a/recipes/servlet-api/jsp2.0_5.5.26.bb b/recipes/servlet-api/jsp2.0_5.5.26.bb
index 562a5ca..054b437 100644
--- a/recipes/servlet-api/jsp2.0_5.5.26.bb
+++ b/recipes/servlet-api/jsp2.0_5.5.26.bb
@@ -9,7 +9,7 @@ S = "${WORKDIR}/apache-tomcat-${PV}-src/servletapi/jsr152"
 inherit java-library
 
 DEPENDS = "fastjar-native servlet2.4"
-RDEPENDS = "libservlet2.4-java"
+RDEPENDS_${PN} = "libservlet2.4-java"
 
 # Value of implementation.revision in build.xml
 IMPL_REVISION = "public_draft"
diff --git a/recipes/settings-daemon/settings-daemon_svn.bb b/recipes/settings-daemon/settings-daemon_svn.bb
index 0b94830..aa244d0 100644
--- a/recipes/settings-daemon/settings-daemon_svn.bb
+++ b/recipes/settings-daemon/settings-daemon_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Settings-daemon provides a bridge between gconf and xsettings"
 LICENSE = "GPL"
 DEPENDS = "gconf glib-2.0 gtk+"
-RDEPENDS = "xrdb"
+RDEPENDS_${PN} = "xrdb"
 SECTION = "x11"
 SRCREV = "2006"
 PV = "0.0+svnr${SRCPV}"
diff --git a/recipes/sharp-binary-only/sharp-camera-support_2.4.18-rmk7-pxa3-embedix.bb b/recipes/sharp-binary-only/sharp-camera-support_2.4.18-rmk7-pxa3-embedix.bb
index 78f9d2a..d63b515 100644
--- a/recipes/sharp-binary-only/sharp-camera-support_2.4.18-rmk7-pxa3-embedix.bb
+++ b/recipes/sharp-binary-only/sharp-camera-support_2.4.18-rmk7-pxa3-embedix.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Driver for the SHARP CG-AG06 digital compact flash camera for lin
 SECTION = "kernel/modules"
 PRIORITY = "optional"
 LICENSE = "CLOSED"
-RDEPENDS = "kernel (${KERNEL_VERSION})"
+RDEPENDS_${PN} = "kernel (${KERNEL_VERSION})"
 PR = "r4"
 
 SRC_URI = "http://openzaurus.sf.net/mirror/camera-modules-2.4.18-rmk7-pxa3-embedix.tar.bz2 \
diff --git a/recipes/sharp-binary-only/sharp-compat-libs_0.5.bb b/recipes/sharp-binary-only/sharp-compat-libs_0.5.bb
index 9e63725..d054136 100644
--- a/recipes/sharp-binary-only/sharp-compat-libs_0.5.bb
+++ b/recipes/sharp-binary-only/sharp-compat-libs_0.5.bb
@@ -4,7 +4,7 @@ Library program in the Settings menu to make them use these libraries."
 SECTION = "opie/settings"
 PRIORITY = "optional"
 DEPENDS = "opie-sh"
-RDEPENDS = "opie-sh"
+RDEPENDS_${PN} = "opie-sh"
 RPROVIDES = "oz-compat"
 RCONFLICTS = "oz-compat"
 LICENSE = "GPL"
diff --git a/recipes/sharp-binary-only/sharp-sdmmc-support.bb b/recipes/sharp-binary-only/sharp-sdmmc-support.bb
index 407f717..7cbfc9d 100644
--- a/recipes/sharp-binary-only/sharp-sdmmc-support.bb
+++ b/recipes/sharp-binary-only/sharp-sdmmc-support.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Driver for the SHARP Zaurus SD/MMC Slot for linux ${PV}"
 SECTION = "kernel/modules"
 PRIORITY = "optional"
 LICENSE = "CLOSED"
-RDEPENDS = "kernel (${PV})"
+RDEPENDS_${PN} = "kernel (${PV})"
 PR = "r23"
 PACKAGE_ARCH = "${MACHINE}"
 
diff --git a/recipes/shfs/shfs-utils_0.35.bb b/recipes/shfs/shfs-utils_0.35.bb
index 2bb392b..8aac31c 100644
--- a/recipes/shfs/shfs-utils_0.35.bb
+++ b/recipes/shfs/shfs-utils_0.35.bb
@@ -3,7 +3,7 @@ It supports some nice features like number of different caches for access speedu
 SECTION = "kernel/userland"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "shfs-modules (${PV})"
+RDEPENDS_${PN} = "shfs-modules (${PV})"
 DEPENDS = "virtual/kernel"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/shfs/shfs-${PV}.tar.gz"
diff --git a/recipes/shorewall/shorewall_2.0.9-monolithic.bb b/recipes/shorewall/shorewall_2.0.9-monolithic.bb
index 19dfa2e..0f91852 100644
--- a/recipes/shorewall/shorewall_2.0.9-monolithic.bb
+++ b/recipes/shorewall/shorewall_2.0.9-monolithic.bb
@@ -1,6 +1,6 @@
 include shorewall_2.0.9.bb
 
-RDEPENDS = "iptables kernel-module-ipt-multiport kernel-module-ipt-mac kernel-module-ipt-mark kernel-module-ipt-pkttype kernel-module-ipt-tos"
+RDEPENDS_${PN} = "iptables kernel-module-ipt-multiport kernel-module-ipt-mac kernel-module-ipt-mark kernel-module-ipt-pkttype kernel-module-ipt-tos"
 
 S = "${WORKDIR}/shorewall-2.0.9"
 
diff --git a/recipes/shorewall/shorewall_2.0.9.bb b/recipes/shorewall/shorewall_2.0.9.bb
index def9603..5af69fc 100644
--- a/recipes/shorewall/shorewall_2.0.9.bb
+++ b/recipes/shorewall/shorewall_2.0.9.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 PRIORITY = "optional"
 PR = "r3"
 
-RDEPENDS = "iptables"
-RRECOMMENDS = "kernel-module-ip-tables kernel-module-ip-conntrack kernel-module-ipt-conntrack kernel-module-ipt-multiport kernel-module-ipt-log kernel-module-ipt-mac kernel-module-ipt-mark kernel-module-ipt-masquerade kernel-module-ipt-pkttype kernel-module-ipt-reject kernel-module-ipt-state kernel-module-ipt-tos kernel-module-iptable-filter kernel-module-iptable-mangle kernel-module-iptable-nat"
+RDEPENDS_${PN} = "iptables"
+RRECOMMENDS_${PN} = "kernel-module-ip-tables kernel-module-ip-conntrack kernel-module-ipt-conntrack kernel-module-ipt-multiport kernel-module-ipt-log kernel-module-ipt-mac kernel-module-ipt-mark kernel-module-ipt-masquerade kernel-module-ipt-pkttype kernel-module-ipt-reject kernel-module-ipt-state kernel-module-ipt-tos kernel-module-iptable-filter kernel-module-iptable-mangle kernel-module-iptable-nat"
 
 SRC_URI = "http://www.shorewall.net/pub/shorewall/2.0/shorewall-2.0.9/shorewall-2.0.9.tgz \
 	file://install-no-chown.diff;striplevel=0"
diff --git a/recipes/shr/e-wm-config-illume2-shr_git.bb b/recipes/shr/e-wm-config-illume2-shr_git.bb
index 0716c4e..e011304 100644
--- a/recipes/shr/e-wm-config-illume2-shr_git.bb
+++ b/recipes/shr/e-wm-config-illume2-shr_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "illume2 SHR config"
 SECTION = "e/utils"
 DEPENDS = "eet"
 LICENSE = "MIT BSD"
-RDEPENDS = "shr-e-gadgets"
+RDEPENDS_${PN} = "shr-e-gadgets"
 SRCREV = "1247d22a007435a58f0967189fc92db2931b31cb"
 PV = "1.2+gitr${SRCPV}"
 
diff --git a/recipes/shr/e-wm-theme-illume-gry_git.bb b/recipes/shr/e-wm-theme-illume-gry_git.bb
index 3d5a5fd..1ed1579 100644
--- a/recipes/shr/e-wm-theme-illume-gry_git.bb
+++ b/recipes/shr/e-wm-theme-illume-gry_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/utils"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
 DEPENDS = "edje-native"
-RRECOMMENDS = "elementary-theme-gry"
+RRECOMMENDS_${PN} = "elementary-theme-gry"
 LICENCE = "unknown"
 
 SRCREV = "a0a974b1e1150aefdf29e8f0ac471a2a60e62532"
diff --git a/recipes/shr/e-wm-theme-illume-neo_git.bb b/recipes/shr/e-wm-theme-illume-neo_git.bb
index 43705c8..89b6818 100644
--- a/recipes/shr/e-wm-theme-illume-neo_git.bb
+++ b/recipes/shr/e-wm-theme-illume-neo_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/utils"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
 DEPENDS = "edje-native"
-RDEPENDS = "e-wm"
+RDEPENDS_${PN} = "e-wm"
 RSUGGESTS = "elementary-theme-neo gtk-theme-neo gpe-theme-neo icon-theme-neo"
 LICENCE = "unknown"
 
diff --git a/recipes/shr/elementary-theme-gry_git.bb b/recipes/shr/elementary-theme-gry_git.bb
index ca690d6..162416e 100644
--- a/recipes/shr/elementary-theme-gry_git.bb
+++ b/recipes/shr/elementary-theme-gry_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/utils"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
 DEPENDS = "edje-native"
-RRECOMMENDS = "e-wm-theme-illume-gry"
+RRECOMMENDS_${PN} = "e-wm-theme-illume-gry"
 LICENSE = "unknown"
 
 SRCREV = "722b0dcc2b1bf79515eaaddd9ebc7819c7f923d0"
diff --git a/recipes/shr/gtk-theme-neo_git.bb b/recipes/shr/gtk-theme-neo_git.bb
index d979e24..7f35ecd 100644
--- a/recipes/shr/gtk-theme-neo_git.bb
+++ b/recipes/shr/gtk-theme-neo_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nEo GTK theme - a very fast, high contrast GTK theme"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
-RDEPENDS += "icon-theme-neo"
+RDEPENDS_${PN} += "icon-theme-neo"
 RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gpe-theme-neo icon-theme-neo"
 LICENSE = "unknown"
 
diff --git a/recipes/shr/gtk-theme.inc b/recipes/shr/gtk-theme.inc
index 449d0e0..ccc8798 100644
--- a/recipes/shr/gtk-theme.inc
+++ b/recipes/shr/gtk-theme.inc
@@ -1,5 +1,5 @@
 RPROVIDES_${PN} += "virtual/theme-gtk"
-RDEPENDS = "gtk+"
+RDEPENDS_${PN} = "gtk+"
 SECTION = "gtk"
 
 inherit update-alternatives
diff --git a/recipes/shr/icon-theme-neo_git.bb b/recipes/shr/icon-theme-neo_git.bb
index ff2bfb9..73c5286 100644
--- a/recipes/shr/icon-theme-neo_git.bb
+++ b/recipes/shr/icon-theme-neo_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "nEo icon theme - a high contrast icon theme which looks especiall
 SECTION = "e/utils"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
-RDEPENDS = "e-wm"
+RDEPENDS_${PN} = "e-wm"
 RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo gpe-theme-neo"
 LICENSE = "unknown"
 
diff --git a/recipes/shr/phoneui-shr-theme-neo_git.bb b/recipes/shr/phoneui-shr-theme-neo_git.bb
index ffe5c66..9652546 100644
--- a/recipes/shr/phoneui-shr-theme-neo_git.bb
+++ b/recipes/shr/phoneui-shr-theme-neo_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://jmccloud.jm.funpic.de"
 SECTION = "e/utils"
 LICENSE = "unknown"
 DEPENDS = "edje-native"
-RDEPENDS = "libphone-ui-shr"
+RDEPENDS_${PN} = "libphone-ui-shr"
 RSUGGESTS = "e-wm-theme-illume-neo gtk-theme-neo icon-theme-neo elementary-theme-neo"
 SRCREV = "20e5e82819a7612aa31c753a6898ccc9e940c7c6"
 PV = "0.1+gitr${SRCPV}"
diff --git a/recipes/shr/phoneui-shr-theme-o2_git.bb b/recipes/shr/phoneui-shr-theme-o2_git.bb
index 06303bb..1fe0e70 100644
--- a/recipes/shr/phoneui-shr-theme-o2_git.bb
+++ b/recipes/shr/phoneui-shr-theme-o2_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://jmccloud.jm.funpic.de"
 SECTION = "e/utils"
 LICENSE = "unknown"
 DEPENDS = "edje-native"
-RDEPENDS = "libphone-ui-shr"
+RDEPENDS_${PN} = "libphone-ui-shr"
 RSUGGESTS = "elementary-theme-o2"
 SRCREV = "20e5e82819a7612aa31c753a6898ccc9e940c7c6"
 PV = "0.1+gitr${SRCPV}"
diff --git a/recipes/shr/shr-e-gadgets_git.bb b/recipes/shr/shr-e-gadgets_git.bb
index bb4944b..b00f654 100644
--- a/recipes/shr/shr-e-gadgets_git.bb
+++ b/recipes/shr/shr-e-gadgets_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "An e17 module for a lot of needed shr-gadgets"
 HOMEPAGE = "http://shr-project.org"
 LICENSE = "BSD"
 DEPENDS = "e-wm"
-RDEPENDS = "e-wm"
+RDEPENDS_${PN} = "e-wm"
 SECTION = "x11/application"
 
 SRCREV = "6480322a8a419e8cbe4af5e627661ff03f56ed18"
diff --git a/recipes/shr/shr-installer_git.bb b/recipes/shr/shr-installer_git.bb
index 8823cba..5e25056 100644
--- a/recipes/shr/shr-installer_git.bb
+++ b/recipes/shr/shr-installer_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "EFL frontend for packagekit"
 HOMEPAGE = "http://shr-project.org"
 SHR_RELEASE ?= "shr"
 LICENSE ?= "GPL"
-RDEPENDS = "python-elementary python-dbus python-core python-edbus packagekit"
+RDEPENDS_${PN} = "python-elementary python-dbus python-core python-edbus packagekit"
 SECTION = "x11/application"
 
 SRCREV = "8608816ea1a1ac14b6e9faaa3685dd2b6450e889"
diff --git a/recipes/shr/shr-settings_git.bb b/recipes/shr/shr-settings_git.bb
index a751674..adfab7f 100644
--- a/recipes/shr/shr-settings_git.bb
+++ b/recipes/shr/shr-settings_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Modular settings application for SHR based on python-elementary"
 HOMEPAGE = "http://shr-project.org"
 SHR_RELEASE ?= "shr"
 LICENSE ?= "GPL"
-RDEPENDS = "python-elementary python-dbus python-codecs python-shell python-pyrtc python python-core python-edbus dbus-x11 frameworkd python-phoneutils python-pexpect"
+RDEPENDS_${PN} = "python-elementary python-dbus python-codecs python-shell python-pyrtc python python-core python-edbus dbus-x11 frameworkd python-phoneutils python-pexpect"
 SECTION = "x11/application"
 SRCREV = "b6de5ae2e6b73821614f9cea4a1334a3415d60c4"
 PE = "1"
diff --git a/recipes/shr/shr-splash-theme.inc b/recipes/shr/shr-splash-theme.inc
index d9a199b..9fb1fd2 100644
--- a/recipes/shr/shr-splash-theme.inc
+++ b/recipes/shr/shr-splash-theme.inc
@@ -1,6 +1,6 @@
 RPROVIDES_${PN} = "virtual/shr-splash-theme"
 PROVIDES  = "virtual/shr-splash-theme"
-RDEPENDS += "shr-splash"
+RDEPENDS_${PN} += "shr-splash"
 
 inherit update-alternatives
 
diff --git a/recipes/shr/shr-splash_git.bb b/recipes/shr/shr-splash_git.bb
index 7686dc4..7902dc8 100644
--- a/recipes/shr/shr-splash_git.bb
+++ b/recipes/shr/shr-splash_git.bb
@@ -5,7 +5,7 @@ SRCREV = "0375bf2b66a053dd490774004c56b5d949f02ac8"
 PV = "1.2+gitr${SRCPV}"
 PR = "r5"
 DEPENDS = "virtual/shr-splash-theme"
-RRECOMMENDS = "virtual/shr-splash-theme"
+RRECOMMENDS_${PN} = "virtual/shr-splash-theme"
 
 inherit update-rc.d
 
diff --git a/recipes/shr/shr-theme-gry.bb b/recipes/shr/shr-theme-gry.bb
index 7a2e6e1..9f6362a 100644
--- a/recipes/shr/shr-theme-gry.bb
+++ b/recipes/shr/shr-theme-gry.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "gry* - a fast, shiny theme"
 SECTION = "x11/data"
-RDEPENDS += "e-wm-theme-illume-gry elementary-theme-gry"
+RDEPENDS_${PN} += "e-wm-theme-illume-gry elementary-theme-gry"
 PV = "0.1"
 PR = "r1"
 
diff --git a/recipes/shr/shr-theme-neo.bb b/recipes/shr/shr-theme-neo.bb
index e852632..6939582 100644
--- a/recipes/shr/shr-theme-neo.bb
+++ b/recipes/shr/shr-theme-neo.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "nEo shr theme - a very fast, high contrast shr theme"
 SECTION = "x11/data"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
-RDEPENDS = "phoneui-shr-theme-neo elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo gpe-theme-neo icon-theme-neo"
+RDEPENDS_${PN} = "phoneui-shr-theme-neo elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo gpe-theme-neo icon-theme-neo"
 LICENSE = "unknown"
 
 PV = "0.2"
diff --git a/recipes/shr/shr-theme-niebiee.bb b/recipes/shr/shr-theme-niebiee.bb
index 5e5a139..50e6e9e 100644
--- a/recipes/shr/shr-theme-niebiee.bb
+++ b/recipes/shr/shr-theme-niebiee.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Niebiee - extremely blue theme for SHR (metapackage)"
 SECTION = "x11/data"
-RDEPENDS += "e-wm-theme-illume-niebiee elementary-theme-niebiee shr-splash-theme-niebiee"
+RDEPENDS_${PN} += "e-wm-theme-illume-niebiee elementary-theme-niebiee shr-splash-theme-niebiee"
 PV = "0.1"
 PR = "r1"
 
diff --git a/recipes/shr/shr-theme-o2.bb b/recipes/shr/shr-theme-o2.bb
index 6c03d12..cdd272b 100644
--- a/recipes/shr/shr-theme-o2.bb
+++ b/recipes/shr/shr-theme-o2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "o2 theme suit for shr - it looks like om2007.2"
 SECTION = "x11/data"
 HOMEPAGE = "http://jmccloud.jm.funpic.de"
 AUTHOR = "Jesus McCloud <bernd.pruenster@gmail.com"
-RDEPENDS = "phoneui-shr-theme-o2 elementary-theme-o2"
+RDEPENDS_${PN} = "phoneui-shr-theme-o2 elementary-theme-o2"
 LICENSE = "unknown"
 
 PV = "0.1"
diff --git a/recipes/shr/shr-theme-sixteen.bb b/recipes/shr/shr-theme-sixteen.bb
index d7b7892..a2c04fb 100644
--- a/recipes/shr/shr-theme-sixteen.bb
+++ b/recipes/shr/shr-theme-sixteen.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Sixteen SHR theme"
 SECTION = "x11/data"
-RDEPENDS += "e-wm-theme-illume-sixteen elementary-theme-sixteen"
+RDEPENDS_${PN} += "e-wm-theme-illume-sixteen elementary-theme-sixteen"
 PV = "0.1"
 PR = "r1"
 
diff --git a/recipes/shr/shr-today_git.bb b/recipes/shr/shr-today_git.bb
index 439dd77..88e406d 100644
--- a/recipes/shr/shr-today_git.bb
+++ b/recipes/shr/shr-today_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "python-elementary and opimd based lock and today screen for the S
 HOMEPAGE = "http://wiki.github.com/slyon/today"
 SHR_RELEASE ?= "shr"
 LICENSE ?= "GPL"
-RDEPENDS = "python-edje python-dbus python-edbus python-ecore"
+RDEPENDS_${PN} = "python-edje python-dbus python-edbus python-ecore"
 SECTION = "x11/applications"
 
 SRCREV = "7b69649a9df0e85f0c0f7985fd1d93543c3b11e2"
diff --git a/recipes/shr/shr-wizard_git.bb b/recipes/shr/shr-wizard_git.bb
index aed5820..4e35508 100644
--- a/recipes/shr/shr-wizard_git.bb
+++ b/recipes/shr/shr-wizard_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "An e17 module and a python app for the SHR first run wizard"
 HOMEPAGE = "http://shr-project.org"
 LICENSE = "GPL"
 DEPENDS = "e-wm"
-RDEPENDS = "python-elementary shr-settings python-phoneutils e-wm python-dbus python-edbus"
+RDEPENDS_${PN} = "python-elementary shr-settings python-phoneutils e-wm python-dbus python-edbus"
 SECTION = "x11/application"
 SRCREV = "24450cba257e7057045ad576530f158a03bd0f8b"
 PV = "0.0.0+gitr${SRCPV}"
diff --git a/recipes/slugimage/slugimage-native.bb b/recipes/slugimage/slugimage-native.bb
index f8408a1..841acc6 100644
--- a/recipes/slugimage/slugimage-native.bb
+++ b/recipes/slugimage/slugimage-native.bb
@@ -2,7 +2,7 @@
 require slugimage.bb
 
 # slugimage depends on perl, we assume that this is installed.
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
 
 inherit native
 
diff --git a/recipes/slugimage/slugimage.bb b/recipes/slugimage/slugimage.bb
index 67367d5..cb4c030 100644
--- a/recipes/slugimage/slugimage.bb
+++ b/recipes/slugimage/slugimage.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Slugimage is a small app to disassemble and reassemble \
 flash images for the Linksys NSLU2 device. It also has jffs2 support"
 PR = "r12"
 
-RDEPENDS = "perl"
+RDEPENDS_${PN} = "perl"
 
 SLUGIMAGE_SVN_REV  ?= "104"
 SLUGIMAGE_SVN_REPO ?= "http://svn.nslu2-linux.org/svnroot/slugimage/trunk"
diff --git a/recipes/slugos-init/slugos-init_0.10.bb b/recipes/slugos-init/slugos-init_0.10.bb
index 2523e2e..650f12c 100644
--- a/recipes/slugos-init/slugos-init_0.10.bb
+++ b/recipes/slugos-init/slugos-init_0.10.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "required"
 LICENSE = "GPL"
 DEPENDS = "base-files devio"
-RDEPENDS = "busybox devio"
+RDEPENDS_${PN} = "busybox devio"
 PR = "r90"
 
 SRC_URI = "file://boot/flash \
diff --git a/recipes/slugos-init/slugos-init_4.8.bb b/recipes/slugos-init/slugos-init_4.8.bb
index 37b82c5..cdec9e3 100644
--- a/recipes/slugos-init/slugos-init_4.8.bb
+++ b/recipes/slugos-init/slugos-init_4.8.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "required"
 LICENSE = "GPL"
 DEPENDS = "base-files devio"
-RDEPENDS = "busybox devio"
+RDEPENDS_${PN} = "busybox devio"
 PR = "r5"
 
 SRC_URI = "file://boot/flash \
diff --git a/recipes/slugos-init/slugos-init_5.0.bb b/recipes/slugos-init/slugos-init_5.0.bb
index bf3bb6f..04fc0a1 100644
--- a/recipes/slugos-init/slugos-init_5.0.bb
+++ b/recipes/slugos-init/slugos-init_5.0.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "required"
 LICENSE = "GPL"
 DEPENDS = "base-files devio"
-RDEPENDS = "busybox devio"
+RDEPENDS_${PN} = "busybox devio"
 PR = "r11"
 
 SRC_URI = "file://boot/flash \
diff --git a/recipes/snes232/snes232_cvs.bb b/recipes/snes232/snes232_cvs.bb
index 1afde81..2f24f35 100644
--- a/recipes/snes232/snes232_cvs.bb
+++ b/recipes/snes232/snes232_cvs.bb
@@ -3,7 +3,7 @@ PR = "r4"
 LICENSE = "GPL"
 PACKAGE_STRIP = "no"
 
-RRECOMMENDS = "kernel-module-serport"
+RRECOMMENDS_${PN} = "kernel-module-serport"
 
 SRC_URI = "${HANDHELDS_CVS};module=gpe/games/snes232 \
 	file://snes232-2.6.patch;striplevel=0 \
diff --git a/recipes/snort/snort_2.8.5.3.bb b/recipes/snort/snort_2.8.5.3.bb
index ca9130f..fe5bf33 100644
--- a/recipes/snort/snort_2.8.5.3.bb
+++ b/recipes/snort/snort_2.8.5.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "snort - a free lightweight network intrusion detection system for
 HOMEPAGE = "http://www.snort.org/"
 LICENSE = "GPL"
 DEPENDS = "libpcap libnet libpcre"
-RDEPENDS = "libpcap libnet libpcre barnyard"
+RDEPENDS_${PN} = "libpcap libnet libpcre barnyard"
 
 PR = "r1"
 
diff --git a/recipes/spamassassin/spamassassin_3.3.1.bb b/recipes/spamassassin/spamassassin_3.3.1.bb
index 77ec567..8fb99af 100644
--- a/recipes/spamassassin/spamassassin_3.3.1.bb
+++ b/recipes/spamassassin/spamassassin_3.3.1.bb
@@ -26,7 +26,7 @@ DEPENDS += " \
 	openssl \
 	zlib \
 	"
-RDEPENDS += " \
+RDEPENDS_${PN} += " \
 	libarchive-tar-perl \
 	libdb-file-perl \
 	libdbi-perl \
diff --git a/recipes/squidguard/squidguard_1.4.bb b/recipes/squidguard/squidguard_1.4.bb
index 8b624bb..f08fb62 100644
--- a/recipes/squidguard/squidguard_1.4.bb
+++ b/recipes/squidguard/squidguard_1.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Squid URL redirector"
 HOMEPAGE = "http://www.squidguard.org/"
 SECTION = "network"
 DEPENDS = "virtual/db openldap mysql5 zlib"
-RDEPENDS += "squid"
+RDEPENDS_${PN} += "squid"
 LICENSE = "GPL"
 PR = "r1"
 
diff --git a/recipes/squidview/squidview_0.72.bb b/recipes/squidview/squidview_0.72.bb
index 3733b16..22ff5d3 100644
--- a/recipes/squidview/squidview_0.72.bb
+++ b/recipes/squidview/squidview_0.72.bb
@@ -3,7 +3,7 @@ SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
-RDEPENDS = "squid"
+RDEPENDS_${PN} = "squid"
 
 S = "${WORKDIR}/squidview-${PV}"
 
diff --git a/recipes/starling/starling_0.9.bb b/recipes/starling/starling_0.9.bb
index bc1f369..5a8b279 100644
--- a/recipes/starling/starling_0.9.bb
+++ b/recipes/starling/starling_0.9.bb
@@ -9,7 +9,7 @@ inherit gpe autotools
 
 SRC_URI = "http://gpe.linuxtogo.org/download/source/starling-${PV}.tar.bz2"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   esd \
   gst-plugin-audioconvert \
   gst-plugin-esd \
@@ -17,7 +17,7 @@ RDEPENDS = "\
   gst-plugin-decodebin \
   gst-plugin-volume \
 "
-RRECOMMENDS = "\
+RRECOMMENDS_${PN} = "\
   gst-plugin-mad \
   gst-plugin-modplug \
   gst-plugin-ivorbis \
diff --git a/recipes/subversion/subversion_1.4.3.bb b/recipes/subversion/subversion_1.4.3.bb
index addb43e..fc2a9fb 100644
--- a/recipes/subversion/subversion_1.4.3.bb
+++ b/recipes/subversion/subversion_1.4.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Subversion (svn) client"
 SECTION = "console/network"
 DEPENDS = "apr-util neon"
-RDEPENDS = "neon"
+RDEPENDS_${PN} = "neon"
 LICENSE = "Apache BSD"
 HOMEPAGE = "http://subversion.tigris.org"
 
diff --git a/recipes/subversion/subversion_1.6.5.bb b/recipes/subversion/subversion_1.6.5.bb
index c26a483..b20354c 100644
--- a/recipes/subversion/subversion_1.6.5.bb
+++ b/recipes/subversion/subversion_1.6.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Subversion (svn) client"
 SECTION = "console/network"
 DEPENDS = "apr-util neon sqlite3"
-RDEPENDS = "neon"
+RDEPENDS_${PN} = "neon"
 LICENSE = "Apache BSD"
 HOMEPAGE = "http://subversion.tigris.org/"
 
diff --git a/recipes/sudo/sudo-enable-wheel-group.bb b/recipes/sudo/sudo-enable-wheel-group.bb
index b281ddb..7e79be4 100644
--- a/recipes/sudo/sudo-enable-wheel-group.bb
+++ b/recipes/sudo/sudo-enable-wheel-group.bb
@@ -1,6 +1,6 @@
 PR = "r0"
 
-RDEPENDS = "sudo"
+RDEPENDS_${PN} = "sudo"
 
 ALLOW_EMPTY_${PN} = "1"
 PACKAGE_ARCH = "all"
diff --git a/recipes/sudo/sudo_1.7.2p4.bb b/recipes/sudo/sudo_1.7.2p4.bb
index 3fe7aef..e2d7739 100644
--- a/recipes/sudo/sudo_1.7.2p4.bb
+++ b/recipes/sudo/sudo_1.7.2p4.bb
@@ -1,7 +1,7 @@
 PR = "r3"
 
 DEPENDS = "libpam"
-RDEPENDS = "libpam libpam-meta"
+RDEPENDS_${PN} = "libpam libpam-meta"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz;name=src \
   file://sudo.pamd \
diff --git a/recipes/sugar/etoys_3.0.2076.bb b/recipes/sugar/etoys_3.0.2076.bb
index 0bbe352..07817ba 100644
--- a/recipes/sugar/etoys_3.0.2076.bb
+++ b/recipes/sugar/etoys_3.0.2076.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 PR = "r1"
 
 DEPENDS = "sugar"
-RDEPENDS = "sugar shared-mime-info"
+RDEPENDS_${PN} = "sugar shared-mime-info"
 
 SRC_URI = "http://dev.laptop.org/pub/sugar/sources/etoys/etoys-${PV}.tar.gz \
            file://etoys.diff"
diff --git a/recipes/sugar/etoys_4.0.2212.bb b/recipes/sugar/etoys_4.0.2212.bb
index 123ceae..0c6debe 100644
--- a/recipes/sugar/etoys_4.0.2212.bb
+++ b/recipes/sugar/etoys_4.0.2212.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 PR = "r0"
 
 DEPENDS = "sugar"
-RDEPENDS = "sugar shared-mime-info"
+RDEPENDS_${PN} = "sugar shared-mime-info"
 
 SRC_URI = "http://download.sugarlabs.org/sources/sucrose/glucose/etoys/etoys-${PV}.tar.gz \
            file://etoys.diff"
diff --git a/recipes/sugar/sugar-artwork_0.84.1.bb b/recipes/sugar/sugar-artwork_0.84.1.bb
index b6b151e..5f02cac 100644
--- a/recipes/sugar/sugar-artwork_0.84.1.bb
+++ b/recipes/sugar/sugar-artwork_0.84.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 PR = "r0"
 
 DEPENDS = "sugar icon-slicer-native"
-RDEPENDS = "ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-sans-condensed \
+RDEPENDS_${PN} = "ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-sans-condensed \
             ttf-dejavu-serif ttf-dejavu-serif-condensed \
             python-pycairo fontconfig freetype python-pygtk"
 
diff --git a/recipes/sugar/sugar-base_0.82.2.bb b/recipes/sugar/sugar-base_0.82.2.bb
index 7aae27b..34c09b2 100644
--- a/recipes/sugar/sugar-base_0.82.2.bb
+++ b/recipes/sugar/sugar-base_0.82.2.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2"
 PR = "r11"
 
 DEPENDS = "python-pygtk sugar-toolkit"
-RDEPENDS = "librsvg-gtk \
+RDEPENDS_${PN} = "librsvg-gtk \
             ohm-plugin-x11 ohm \
 	    hippo-canvas \
             python-datetime \
diff --git a/recipes/sugar/sugar-base_0.83.2.bb b/recipes/sugar/sugar-base_0.83.2.bb
index 5c30e17..cde687f 100644
--- a/recipes/sugar/sugar-base_0.83.2.bb
+++ b/recipes/sugar/sugar-base_0.83.2.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2"
 PR = "r1"
 
 DEPENDS = "python-pygtk sugar-toolkit"
-RDEPENDS = "librsvg-gtk \
+RDEPENDS_${PN} = "librsvg-gtk \
             ohm-plugin-x11 ohm \
 	    hippo-canvas \
             python-datetime \
diff --git a/recipes/sugar/sugar-base_0.84.1.bb b/recipes/sugar/sugar-base_0.84.1.bb
index 34d5bab..47159dd 100644
--- a/recipes/sugar/sugar-base_0.84.1.bb
+++ b/recipes/sugar/sugar-base_0.84.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Sugar base system"
 LICENSE = "LGPLv2"
 
 DEPENDS = "python-pygtk sugar-toolkit"
-RDEPENDS = "librsvg-gtk \
+RDEPENDS_${PN} = "librsvg-gtk \
             gconf \
             matchbox-wm \
             ohm-plugin-x11 ohm \
diff --git a/recipes/sugar/sugar-datastore_0.82.0.bb b/recipes/sugar/sugar-datastore_0.82.0.bb
index 6a51f9a..8905956 100644
--- a/recipes/sugar/sugar-datastore_0.82.0.bb
+++ b/recipes/sugar/sugar-datastore_0.82.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 PR = "r0"
 
 DEPENDS = "sugar-toolkit python-xappy "
-RDEPENDS = "sugar-toolkit sugar-base python-xappy"
+RDEPENDS_${PN} = "sugar-toolkit sugar-base python-xappy"
 
 SRC_URI = "http://dev.laptop.org/pub/sugar/sources/sugar-datastore/${PN}-${PV}.tar.bz2"
 
diff --git a/recipes/sugar/sugar-datastore_0.84.0.bb b/recipes/sugar/sugar-datastore_0.84.0.bb
index 8d497f1..8a48498 100644
--- a/recipes/sugar/sugar-datastore_0.84.0.bb
+++ b/recipes/sugar/sugar-datastore_0.84.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 PR = "r0"
 
 DEPENDS = "sugar-toolkit python-xappy "
-RDEPENDS = "sugar-toolkit sugar-base python-xappy python-cjson xapian-bindings-python"
+RDEPENDS_${PN} = "sugar-toolkit sugar-base python-xappy python-cjson xapian-bindings-python"
 
 SRC_URI = "http://download.sugarlabs.org/sources/sucrose/glucose/sugar-datastore/${PN}-${PV}.tar.bz2"
 
diff --git a/recipes/sugar/sugar-toolkit_0.84.4.bb b/recipes/sugar/sugar-toolkit_0.84.4.bb
index 3bb305a..c6effef 100644
--- a/recipes/sugar/sugar-toolkit_0.84.4.bb
+++ b/recipes/sugar/sugar-toolkit_0.84.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Sugar toolkit"
 LICENSE = "LGPLv2"
 DEPENDS = "python-pygtk libxml-parser-perl-native libxml2 gtk+ alsa-lib"
-RDEPENDS = "python-pygtk"
+RDEPENDS_${PN} = "python-pygtk"
 
 SRC_URI = "http://download.sugarlabs.org/sources/sucrose/glucose/sugar-toolkit/sugar-toolkit-${PV}.tar.bz2"
 
diff --git a/recipes/sugar/sugar_0.82.9.bb b/recipes/sugar/sugar_0.82.9.bb
index 56ab4af..9ebbd90 100644
--- a/recipes/sugar/sugar_0.82.9.bb
+++ b/recipes/sugar/sugar_0.82.9.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 PR = "r4"
 
 DEPENDS = "sugar-toolkit libxml2 gtk+"
-RDEPENDS = "sugar-toolkit sugar-base sugar-datastore gnome-python-desktop"
+RDEPENDS_${PN} = "sugar-toolkit sugar-base sugar-datastore gnome-python-desktop"
 
 SRC_URI = "http://dev.laptop.org/pub/sugar/sources/sugar/${PN}-${PV}.tar.bz2"
 
diff --git a/recipes/sugar/sugar_0.83.4.bb b/recipes/sugar/sugar_0.83.4.bb
index a023f3e..2788073 100644
--- a/recipes/sugar/sugar_0.83.4.bb
+++ b/recipes/sugar/sugar_0.83.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Sugar base system"
 LICENSE = "GPLv2"
 
 DEPENDS = "sugar-toolkit libxml2 gtk+"
-RDEPENDS = "sugar-toolkit sugar-base sugar-datastore gnome-python-desktop"
+RDEPENDS_${PN} = "sugar-toolkit sugar-base sugar-datastore gnome-python-desktop"
 
 SRC_URI = "http://download.sugarlabs.org/sources/sucrose/glucose/sugar/${PN}-${PV}.tar.bz2"
 
diff --git a/recipes/sugar/sugar_0.84.6.bb b/recipes/sugar/sugar_0.84.6.bb
index db141fc..b31bb4c 100644
--- a/recipes/sugar/sugar_0.84.6.bb
+++ b/recipes/sugar/sugar_0.84.6.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Sugar base system"
 LICENSE = "GPLv2"
 
 DEPENDS = "sugar-toolkit libxml2 gtk+"
-RDEPENDS = "sugar-toolkit sugar-base sugar-datastore sugar-artwork gnome-python gnome-python-desktop python-cjson python-pygtksourceview"
+RDEPENDS_${PN} = "sugar-toolkit sugar-base sugar-datastore sugar-artwork gnome-python gnome-python-desktop python-cjson python-pygtksourceview"
 
 SRC_URI = "http://download.sugarlabs.org/sources/sucrose/glucose/sugar/${PN}-${PV}.tar.bz2"
 
diff --git a/recipes/suspend-desktop/suspend-desktop_1.0.bb b/recipes/suspend-desktop/suspend-desktop_1.0.bb
index 085d686..e927e87 100644
--- a/recipes/suspend-desktop/suspend-desktop_1.0.bb
+++ b/recipes/suspend-desktop/suspend-desktop_1.0.bb
@@ -6,8 +6,8 @@ LICENSE     = "GPL"
 PR          = "r2"
 
 DISTRO_APM ?= "apm"
-RDEPENDS    = "gpe-conf"
-RRECOMMENDS = "${DISTRO_APM}"
+RDEPENDS_${PN}    = "gpe-conf"
+RRECOMMENDS_${PN} = "${DISTRO_APM}"
 
 PACKAGES    = "${PN}"
 PACKAGE_ARCH = "all"
diff --git a/recipes/swfdec/swfdec-mozilla_0.7.2.bb b/recipes/swfdec/swfdec-mozilla_0.7.2.bb
index 33cf349..e422d0d 100644
--- a/recipes/swfdec/swfdec-mozilla_0.7.2.bb
+++ b/recipes/swfdec/swfdec-mozilla_0.7.2.bb
@@ -5,7 +5,7 @@ PR = "r2"
 
 DEPENDS = "gst-ffmpeg swfdec gstreamer libsoup-2.4 pango cairo liboil zlib gtk+ alsa-lib \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
-RDEPENDS = "gst-ffmpeg"
+RDEPENDS_${PN} = "gst-ffmpeg"
 
 SRC_URI = "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.7/${P}.tar.gz \
 "
diff --git a/recipes/swfdec/swfdec-mozilla_0.7.4.bb b/recipes/swfdec/swfdec-mozilla_0.7.4.bb
index 98ef8c7..c2d9120 100644
--- a/recipes/swfdec/swfdec-mozilla_0.7.4.bb
+++ b/recipes/swfdec/swfdec-mozilla_0.7.4.bb
@@ -5,7 +5,7 @@ PR = "r1"
 
 DEPENDS = "gst-ffmpeg swfdec gstreamer libsoup-2.4 pango cairo liboil zlib gtk+ alsa-lib \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
-RDEPENDS = "gst-ffmpeg"
+RDEPENDS_${PN} = "gst-ffmpeg"
 
 SRC_URI = "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.7/${P}.tar.gz \
 "
diff --git a/recipes/swfdec/swfdec-mozilla_0.8.2.bb b/recipes/swfdec/swfdec-mozilla_0.8.2.bb
index 5360a7e..a296d4f 100644
--- a/recipes/swfdec/swfdec-mozilla_0.8.2.bb
+++ b/recipes/swfdec/swfdec-mozilla_0.8.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Swfdec plugin for browsers using NPAPI. Swfdec is a decoder/rende
 LICENSE = "LGPL"
 
 DEPENDS = "swfdec glib-2.0"
-RDEPENDS = "gst-ffmpeg"
+RDEPENDS_${PN} = "gst-ffmpeg"
 
 SRC_URI = "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.8/${P}.tar.gz \
 "
diff --git a/recipes/swfdec/swfdec-mozilla_0.9.2.bb b/recipes/swfdec/swfdec-mozilla_0.9.2.bb
index c78203e..0a7f241 100644
--- a/recipes/swfdec/swfdec-mozilla_0.9.2.bb
+++ b/recipes/swfdec/swfdec-mozilla_0.9.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Swfdec plugin for browsers using NPAPI. Swfdec is a decoder/rende
 LICENSE = "LGPL"
 PR = "r1"
 DEPENDS = "swfdec glib-2.0"
-RDEPENDS = "gst-ffmpeg"
+RDEPENDS_${PN} = "gst-ffmpeg"
 
 SRC_URI = "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.9/${P}.tar.gz \
 "
diff --git a/recipes/sysconf/sysconf_0.1.bb b/recipes/sysconf/sysconf_0.1.bb
index 608868f..5625ad4 100644
--- a/recipes/sysconf/sysconf_0.1.bb
+++ b/recipes/sysconf/sysconf_0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "System Configuration save/restore functionality"
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "devio cpio findutils diffutils"
+RDEPENDS_${PN} = "devio cpio findutils diffutils"
 PR = "r10"
 
 # Currently, the scripts only support ixp4xx machines.
diff --git a/recipes/tango/tango-icon-theme-enable.bb b/recipes/tango/tango-icon-theme-enable.bb
index 58ad592..e6d9cc6 100644
--- a/recipes/tango/tango-icon-theme-enable.bb
+++ b/recipes/tango/tango-icon-theme-enable.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Enable tango-icon-theme in gtkrc"
 
-RDEPENDS = "tango-icon-theme"
+RDEPENDS_${PN} = "tango-icon-theme"
 
 ALLOW_EMPTY_${PN} = "1"
 PACKAGE_ARCH = "all"
diff --git a/recipes/tangogps/tangogps.inc b/recipes/tangogps/tangogps.inc
index bab91a1..18ae847 100644
--- a/recipes/tangogps/tangogps.inc
+++ b/recipes/tangogps/tangogps.inc
@@ -11,5 +11,5 @@ S = "${WORKDIR}/tangogps-${PV}"
 
 inherit autotools pkgconfig
 
-RRECOMMENDS = "gpsd"
+RRECOMMENDS_${PN} = "gpsd"
 RRECOMMENDS_shr = "fso-gpsd"
diff --git a/recipes/tapioca/tapiocaui_0.3.9.1.bb b/recipes/tapioca/tapiocaui_0.3.9.1.bb
index 8aad16e..3a576c1 100644
--- a/recipes/tapioca/tapiocaui_0.3.9.1.bb
+++ b/recipes/tapioca/tapiocaui_0.3.9.1.bb
@@ -1,7 +1,7 @@
 HOMEPAGE = "http://tapioca-voip.sourceforge.net/wiki/index.php/Tapioca"
 LICENSE = "LGPL"
 DEPENDS = "gtk+ glib-2.0 dbus gconf tapioca-xmpp tapioca farsight gst-plugins-farsight"
-RDEPENDS = "tapioca-xmpp"
+RDEPENDS_${PN} = "tapioca-xmpp"
 PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/tapioca-voip/${P}.tar.gz"
diff --git a/recipes/tasks/mamona-sdk.inc b/recipes/tasks/mamona-sdk.inc
index fb54eab..bbf3309 100644
--- a/recipes/tasks/mamona-sdk.inc
+++ b/recipes/tasks/mamona-sdk.inc
@@ -4,7 +4,7 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = "${PN}"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   task-mamona \
   automake \
   bison \
diff --git a/recipes/tasks/task-devimage.bb b/recipes/tasks/task-devimage.bb
index 2bea4bb..1eff219 100644
--- a/recipes/tasks/task-devimage.bb
+++ b/recipes/tasks/task-devimage.bb
@@ -7,7 +7,7 @@ inherit task
 DEVIMAGE_EXTRA_RDEPENDS ?= ""
 DEVIMAGE_EXTRA_RRECOMMENDS ?= ""
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     devimage \
     busybox dropbear udev \
     util-linux-mount \
@@ -18,7 +18,7 @@ RDEPENDS = "\
     ${DEVIMAGE_EXTRA_RDEPENDS} \
     "
 
-RRECOMMENDS = "\
+RRECOMMENDS_${PN} = "\
     kernel \
     kernel-image \
     kernel-module-msdos \
diff --git a/recipes/tasks/task-efl.bb b/recipes/tasks/task-efl.bb
index 00236a4..2176310 100644
--- a/recipes/tasks/task-efl.bb
+++ b/recipes/tasks/task-efl.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task package: Enlightenment Foundation Libraries"
 LICENSE = "MIT"
 SECTION = "devel/efl"
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   eet \
   evas \
   ecore \
diff --git a/recipes/tasks/task-mamona-base.bb b/recipes/tasks/task-mamona-base.bb
index 29e88ff..1c3f226 100644
--- a/recipes/tasks/task-mamona-base.bb
+++ b/recipes/tasks/task-mamona-base.bb
@@ -5,7 +5,7 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = "${PN}"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   apt \
   base-files \
   base-passwd \
diff --git a/recipes/tasks/task-mamona-devel.bb b/recipes/tasks/task-mamona-devel.bb
index a330834..012ea3f 100644
--- a/recipes/tasks/task-mamona-devel.bb
+++ b/recipes/tasks/task-mamona-devel.bb
@@ -5,7 +5,7 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = "${PN}"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   task-mamona \
   gdb \
   strace \
diff --git a/recipes/tasks/task-mamona-python.bb b/recipes/tasks/task-mamona-python.bb
index f17d6e7..d8b0670 100644
--- a/recipes/tasks/task-mamona-python.bb
+++ b/recipes/tasks/task-mamona-python.bb
@@ -4,7 +4,7 @@ PR = "r0"
 
 PACKAGES = "${PN}"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     python-ao \
     python-cheetah \
     python-constraint \
diff --git a/recipes/tasks/task-mamona-sdk-noemu.bb b/recipes/tasks/task-mamona-sdk-noemu.bb
index 0ef65b9..31e7215 100644
--- a/recipes/tasks/task-mamona-sdk-noemu.bb
+++ b/recipes/tasks/task-mamona-sdk-noemu.bb
@@ -5,7 +5,7 @@ require mamona-sdk.inc
 RCONFLICTS = "task-mamona-sdk"
 RREPLACES = "task-mamona-sdk"
 
-RDEPENDS += "\
+RDEPENDS_${PN} += "\
   bash-noemu \
   binutils-noemu \
   binutils-noemu-symlinks \
diff --git a/recipes/tasks/task-mamona-sdk.bb b/recipes/tasks/task-mamona-sdk.bb
index 6e57865..d2b1fca 100644
--- a/recipes/tasks/task-mamona-sdk.bb
+++ b/recipes/tasks/task-mamona-sdk.bb
@@ -5,7 +5,7 @@ include mamona-sdk.inc
 RCONFLICTS = "task-mamona-sdk-noemu"
 RREPLACES = "task-mamona-sdk-noemu"
 
-RDEPENDS += "\
+RDEPENDS_${PN} += "\
   bash \
   binutils \
   binutils-symlinks \
diff --git a/recipes/tasks/task-mamona-systemtap.bb b/recipes/tasks/task-mamona-systemtap.bb
index 01664d3..d577161 100644
--- a/recipes/tasks/task-mamona-systemtap.bb
+++ b/recipes/tasks/task-mamona-systemtap.bb
@@ -4,7 +4,7 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = "${PN}"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     libcap \
     systemtap \
     task-mamona-sdk \
diff --git a/recipes/tasks/task-mamona-wm.bb b/recipes/tasks/task-mamona-wm.bb
index 55893e0..cfa0ece 100644
--- a/recipes/tasks/task-mamona-wm.bb
+++ b/recipes/tasks/task-mamona-wm.bb
@@ -5,7 +5,7 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = "${PN}"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     task-mamona \
     e-wm \
     libmamona-im-ecore \
diff --git a/recipes/tasks/task-mamona.bb b/recipes/tasks/task-mamona.bb
index 372af29..9448eb0 100644
--- a/recipes/tasks/task-mamona.bb
+++ b/recipes/tasks/task-mamona.bb
@@ -5,7 +5,7 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = "${PN}"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     task-mamona-base \
     alsa-conf-base \
     alsa-utils-alsamixer \
diff --git a/recipes/tasks/task-mipl.bb b/recipes/tasks/task-mipl.bb
index a2eff40..1ee2403 100644
--- a/recipes/tasks/task-mipl.bb
+++ b/recipes/tasks/task-mipl.bb
@@ -7,8 +7,8 @@ DESCRIPTION = "Mobile ipv6 extensions"
 
 inherit task
 
-RDEPENDS = "mipv6"
-RRECOMMENDS = "kernel-module-ipv6 \
+RDEPENDS_${PN} = "mipv6"
+RRECOMMENDS_${PN} = "kernel-module-ipv6 \
                kernel-module-mip6 \
               "
 
diff --git a/recipes/tasks/task-openprotium.bb b/recipes/tasks/task-openprotium.bb
index 4a8e1e4..68e093e 100644
--- a/recipes/tasks/task-openprotium.bb
+++ b/recipes/tasks/task-openprotium.bb
@@ -23,7 +23,7 @@ DISTRO_EXTRA_RDEPENDS += "diffutils cpio findutils"
 # pick up the fw_set/get env utils.
 DISTRO_EXTRA_RDEPENDS += "u-boot-utils"
 
-RDEPENDS = " kernel \
+RDEPENDS_${PN} = " kernel \
 	base-files \
 	base-passwd \
 	netbase \
@@ -47,6 +47,6 @@ RDEPENDS = " kernel \
 	${MACHINE_EXTRA_RDEPENDS} \
 	${DISTRO_EXTRA_RDEPENDS} "
 
-RRECOMMENDS += " \
+RRECOMMENDS_${PN} += " \
 	${DISTRO_EXTRA_RRECOMMENDS} \
 	${MACHINE_EXTRA_RRECOMMENDS}"
diff --git a/recipes/tasks/task-python-efl-examples.bb b/recipes/tasks/task-python-efl-examples.bb
index d882cec..3bd4b58 100644
--- a/recipes/tasks/task-python-efl-examples.bb
+++ b/recipes/tasks/task-python-efl-examples.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python Examples for the Enlightenment Foundation Libraries"
 LICENSE = "MIT"
 SECTION = "devel/python"
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   task-python-efl \
   python-ecore-examples \
   python-emotion-examples \
diff --git a/recipes/tasks/task-python-efl.bb b/recipes/tasks/task-python-efl.bb
index 79d50c7..fc22f10 100644
--- a/recipes/tasks/task-python-efl.bb
+++ b/recipes/tasks/task-python-efl.bb
@@ -5,7 +5,7 @@ PR = "ml4.1"
 
 ALLOW_EMPTY = "1"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   python-evas \
   python-ecore \
   python-edje \
diff --git a/recipes/tasks/task-python-everything.bb b/recipes/tasks/task-python-everything.bb
index 16a48f2..b6b327f 100644
--- a/recipes/tasks/task-python-everything.bb
+++ b/recipes/tasks/task-python-everything.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 PV = "2.6"
 PR = "ml44"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
   python-ao \
   python-cheetah \
   python-coherence \
diff --git a/recipes/tasks/task-python-sharprom_20060425.bb b/recipes/tasks/task-python-sharprom_20060425.bb
index 5dbd59d..4aac5e9 100644
--- a/recipes/tasks/task-python-sharprom_20060425.bb
+++ b/recipes/tasks/task-python-sharprom_20060425.bb
@@ -16,7 +16,7 @@ NONWORKING = "\
 		python-sword            \
 		python-vorbis"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
 		python-ao 		\
 		python-constraint	\
 		python-dialog		\
diff --git a/recipes/tasks/task-sdk-base.bb b/recipes/tasks/task-sdk-base.bb
index 0dc41f3..5143470 100644
--- a/recipes/tasks/task-sdk-base.bb
+++ b/recipes/tasks/task-sdk-base.bb
@@ -5,7 +5,7 @@ ALLOW_EMPTY = "1"
 
 DEPENDS = "task-sdk-bare"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     task-sdk-bare \
     glibc \
     virtual-libc-dev \
diff --git a/recipes/tasks/task-sdk-gpephone.bb b/recipes/tasks/task-sdk-gpephone.bb
index 7a9f78c..2641adb 100644
--- a/recipes/tasks/task-sdk-gpephone.bb
+++ b/recipes/tasks/task-sdk-gpephone.bb
@@ -3,7 +3,7 @@ PR = "r0"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     libidn-dev \
     libim-dev \
     gloox-dev \
diff --git a/recipes/tasks/task-sdk-sbox-gpe.bb b/recipes/tasks/task-sdk-sbox-gpe.bb
index 930de7c..51ab447 100644
--- a/recipes/tasks/task-sdk-sbox-gpe.bb
+++ b/recipes/tasks/task-sdk-sbox-gpe.bb
@@ -3,7 +3,7 @@ PR = "r0"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     glib-2.0-utils \
     gdk-pixbuf-loader-png \
     gdk-pixbuf-loader-jpeg \
diff --git a/recipes/tasks/task-sdk-sbox.bb b/recipes/tasks/task-sdk-sbox.bb
index d50954a..3226e37 100644
--- a/recipes/tasks/task-sdk-sbox.bb
+++ b/recipes/tasks/task-sdk-sbox.bb
@@ -3,7 +3,7 @@ PR = "r7"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     strace \
     gdb \
     sbrsh \
diff --git a/recipes/tasks/task-self-hosting.bb b/recipes/tasks/task-self-hosting.bb
index 38f2cb1..5ee20d5 100644
--- a/recipes/tasks/task-self-hosting.bb
+++ b/recipes/tasks/task-self-hosting.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "All tools needed for OpenEmbedded build"
 SECTION = "devel"
 LICENSE = "MIT"
-RDEPENDS = "task-native-sdk python-modules bash texinfo cvs subversion git"
+RDEPENDS_${PN} = "task-native-sdk python-modules bash texinfo cvs subversion git"
 PR = "r1"
 
 #
diff --git a/recipes/tasks/task-slugos.bb b/recipes/tasks/task-slugos.bb
index 0ebf149..69bf6ca 100644
--- a/recipes/tasks/task-slugos.bb
+++ b/recipes/tasks/task-slugos.bb
@@ -81,7 +81,7 @@ kernel-module-md-mod \
 kernel-module-raid1 \
 "
 
-# Add the machine-specific RRECOMMENDS stuff -- kernel modules required for
+# Add the machine-specific RRECOMMENDS_${PN} stuff -- kernel modules required for
 # network support.
 SLUGOS_MACHINE_RRECOMMENDS_nslu2 = "\
 kernel-module-mii \
@@ -89,7 +89,7 @@ kernel-module-ixp4xx-mac \
 kernel-module-ixp4xx-qmgr \
 "
 
-# Add machine-specific RDEPENDS stuff - packages such as the NPE firmware
+# Add machine-specific RDEPENDS_${PN} stuff - packages such as the NPE firmware
 SLUGOS_MACHINE_RDEPENDS_nslu2 = "\
 ixp4xx-npe \
 "
@@ -100,7 +100,7 @@ DEPENDS += "${DISTRO_EXTRA_DEPENDS}"
 DISTRO_EXTRA_RDEPENDS ?= ""
 
 ## This comment block is temporary, to be removed once SlugOS 5.0 stabilizes
-##RDEPENDS += "\
+##RDEPENDS_${PN} += "\
 ##	kernel ixp4xx-npe \
 ##	base-files base-passwd netbase \
 ##        busybox initscripts-slugos slugos-init \
@@ -115,7 +115,7 @@ DISTRO_EXTRA_RDEPENDS ?= ""
 ##	util-linux-losetup \
 ##	${SLUGOS_STANDARD_RDEPENDS} \
 ##	${DISTRO_EXTRA_RDEPENDS}"
-## SlugOS 5.0 - original RDEPENDS above for reference; tinylogin and the
+## SlugOS 5.0 - original RDEPENDS_${PN} above for reference; tinylogin and the
 ## util-linux-* utilities are now replaced by busybox tools.  Also, ipkg
 ## is replaced by a trimmed-down version of opkg (no package signatures,
 ## and it uses the busybox wget command instead of libcurl - MJW
@@ -123,7 +123,7 @@ DISTRO_EXTRA_RDEPENDS ?= ""
 ## SlugOS 5.2 - module-init-tools reinstated due to busybox bugs - MJW
 ## SlugOS 5.4 - util-linux-mount reinstated due to busybox bugs - MJW
 
-RDEPENDS += "\
+RDEPENDS_${PN} += "\
 	kernel \
 	base-files base-passwd netbase \
         busybox initscripts-slugos slugos-init \
@@ -138,7 +138,7 @@ RDEPENDS += "\
 	${DISTRO_EXTRA_RDEPENDS}"
 
 DISTRO_EXTRA_RRECOMMENDS ?= ""
-RRECOMMENDS += "\
+RRECOMMENDS_${PN} += "\
 	openssh \
 	${SLUGOS_STANDARD_RRECOMMENDS} \
         ${SLUGOS_MACHINE_RRECOMMENDS} \
diff --git a/recipes/telepathy/empathy_0.1.bb b/recipes/telepathy/empathy_0.1.bb
index 7dcc29d..299485e 100644
--- a/recipes/telepathy/empathy_0.1.bb
+++ b/recipes/telepathy/empathy_0.1.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Empathy: a Telepathy based IM client"
 HOMEPAGE = "http://blogs.gnome.org/view/xclaesse/2007/04/26/0"
 LICENSE = "GPL"
 DEPENDS = "telepathy-mission-control libtelepathy gtk+ gconf libglade"
-RDEPENDS = "telepathy-mission-control"
-RRECOMMENDS = "telepathy-gabble"
+RDEPENDS_${PN} = "telepathy-mission-control"
+RRECOMMENDS_${PN} = "telepathy-gabble"
 
 PR ="r1"
 
diff --git a/recipes/telepathy/empathy_0.14.bb b/recipes/telepathy/empathy_0.14.bb
index b585fd7..374d22d 100644
--- a/recipes/telepathy/empathy_0.14.bb
+++ b/recipes/telepathy/empathy_0.14.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Empathy: a Telepathy based IM client"
 HOMEPAGE = "http://blogs.gnome.org/view/xclaesse/2007/04/26/0"
 LICENSE = "GPL"
 DEPENDS = "telepathy-mission-control libtelepathy gtk+ gconf libglade gnome-vfs"
-RDEPENDS = "telepathy-mission-control"
-RRECOMMENDS = "telepathy-gabble"
+RDEPENDS_${PN} = "telepathy-mission-control"
+RRECOMMENDS_${PN} = "telepathy-gabble"
 
 PR ="r0"
 
diff --git a/recipes/telepathy/empathy_0.4.bb b/recipes/telepathy/empathy_0.4.bb
index 1ba77cd..ff69498 100644
--- a/recipes/telepathy/empathy_0.4.bb
+++ b/recipes/telepathy/empathy_0.4.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Empathy: a Telepathy based IM client"
 HOMEPAGE = "http://blogs.gnome.org/view/xclaesse/2007/04/26/0"
 LICENSE = "GPL"
 DEPENDS = "libgnomeui telepathy-mission-control libtelepathy gtk+ gconf libglade"
-RDEPENDS = "telepathy-mission-control"
-RRECOMMENDS = "telepathy-gabble"
+RDEPENDS_${PN} = "telepathy-mission-control"
+RRECOMMENDS_${PN} = "telepathy-gabble"
 
 PR ="r0"
 
diff --git a/recipes/telepathy/empathy_0.5.bb b/recipes/telepathy/empathy_0.5.bb
index bc47e09..078eb08 100644
--- a/recipes/telepathy/empathy_0.5.bb
+++ b/recipes/telepathy/empathy_0.5.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Empathy: a Telepathy based IM client"
 HOMEPAGE = "http://blogs.gnome.org/view/xclaesse/2007/04/26/0"
 LICENSE = "GPL"
 DEPENDS = "telepathy-mission-control libtelepathy gtk+ gconf libglade gnome-vfs"
-RDEPENDS = "telepathy-mission-control"
-RRECOMMENDS = "telepathy-gabble"
+RDEPENDS_${PN} = "telepathy-mission-control"
+RRECOMMENDS_${PN} = "telepathy-gabble"
 
 PR ="r1"
 
diff --git a/recipes/telepathy/empathy_2.23.90.bb b/recipes/telepathy/empathy_2.23.90.bb
index 92154fc..95ba85a 100644
--- a/recipes/telepathy/empathy_2.23.90.bb
+++ b/recipes/telepathy/empathy_2.23.90.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Empathy: a Telepathy based IM client"
 HOMEPAGE = "http://blogs.gnome.org/view/xclaesse/2007/04/26/0"
 LICENSE = "GPL"
 DEPENDS = "python-native telepathy-python telepathy-mission-control libtelepathy telepathy-glib gtk+ gconf libglade eds-dbus"
-RDEPENDS = "telepathy-mission-control"
-RRECOMMENDS = "telepathy-gabble"
+RDEPENDS_${PN} = "telepathy-mission-control"
+RRECOMMENDS_${PN} = "telepathy-gabble"
 
 inherit gnome
 
diff --git a/recipes/telepathy/empathy_2.24.0.bb b/recipes/telepathy/empathy_2.24.0.bb
index 851197c..5b459d3 100644
--- a/recipes/telepathy/empathy_2.24.0.bb
+++ b/recipes/telepathy/empathy_2.24.0.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Empathy: a Telepathy based IM client"
 HOMEPAGE = "http://blogs.gnome.org/view/xclaesse/2007/04/26/0"
 LICENSE = "GPL"
 DEPENDS = "gnome-doc-utils python-native telepathy-python telepathy-mission-control libtelepathy telepathy-glib gtk+ gconf libglade eds-dbus"
-RDEPENDS = "telepathy-mission-control"
-RRECOMMENDS = "telepathy-gabble"
+RDEPENDS_${PN} = "telepathy-mission-control"
+RRECOMMENDS_${PN} = "telepathy-gabble"
 
 inherit gnome
 
diff --git a/recipes/telepathy/empathy_2.26.1.bb b/recipes/telepathy/empathy_2.26.1.bb
index 114694c..a2b708f 100644
--- a/recipes/telepathy/empathy_2.26.1.bb
+++ b/recipes/telepathy/empathy_2.26.1.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Empathy: a Telepathy based IM client"
 HOMEPAGE = "http://blogs.gnome.org/view/xclaesse/2007/04/26/0"
 LICENSE = "GPL"
 DEPENDS = "libcanberra telepathy-farsight gnome-doc-utils python-native telepathy-python telepathy-mission-control libtelepathy telepathy-glib gtk+ gconf libglade eds-dbus"
-RDEPENDS = "telepathy-mission-control"
-RRECOMMENDS = "telepathy-gabble"
+RDEPENDS_${PN} = "telepathy-mission-control"
+RRECOMMENDS_${PN} = "telepathy-gabble"
 
 inherit gnome
 
diff --git a/recipes/telepathy/empathy_2.28.2.bb b/recipes/telepathy/empathy_2.28.2.bb
index 0a83851..d789aa3 100644
--- a/recipes/telepathy/empathy_2.28.2.bb
+++ b/recipes/telepathy/empathy_2.28.2.bb
@@ -5,8 +5,8 @@ DEPENDS = "libcanberra telepathy-farsight gnome-doc-utils \
 python-native telepathy-python telepathy-mission-control \
 libtelepathy telepathy-glib gtk+ gconf libglade eds-dbus \
 libunique"
-RDEPENDS = "telepathy-mission-control"
-RRECOMMENDS = "telepathy-gabble"
+RDEPENDS_${PN} = "telepathy-mission-control"
+RRECOMMENDS_${PN} = "telepathy-gabble"
 
 inherit gnome
 
diff --git a/recipes/temper/temper_0.0.1.bb b/recipes/temper/temper_0.0.1.bb
index 2d6679d..6821982 100644
--- a/recipes/temper/temper_0.0.1.bb
+++ b/recipes/temper/temper_0.0.1.bb
@@ -3,7 +3,7 @@ SECTION = "console/network"
 PR = "r1"
 LICENSE = "GPL"
 COMPATIBLE_MACHINE = "(n1200|n2100)"
-RDEPENDS = "hddtemp"
+RDEPENDS_${PN} = "hddtemp"
 
 SRC_URI = "file://temper \
            file://init"
diff --git a/recipes/tgt/tgt_1.0.3.bb b/recipes/tgt/tgt_1.0.3.bb
index a7e61fd..607e5e0 100644
--- a/recipes/tgt/tgt_1.0.3.bb
+++ b/recipes/tgt/tgt_1.0.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Linux target framework (tgt) aims to simplify various SCSI target
 HOMEPAGE = "http://stgt.berlios.de/"
 LICENSE = "GPLv2"
 DEPENDS = "openssl"
-RDEPENDS = "iscsi-target"
+RDEPENDS_${PN} = "iscsi-target"
 
 PR = "r0"
 SRC_URI = "http://stgt.berlios.de/releases/tgt-${PV}.tar.gz;name=tgttargz"
diff --git a/recipes/tickypip/tickypip-levels_1.1.bb b/recipes/tickypip/tickypip-levels_1.1.bb
index 53fea3a..a3bc343 100644
--- a/recipes/tickypip/tickypip-levels_1.1.bb
+++ b/recipes/tickypip/tickypip-levels_1.1.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "${PN}"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 AUTHOR = "NetWalk Group <netwalkgroup@hotmail.com>"
-RDEPENDS = "tickypip"
+RDEPENDS_${PN} = "tickypip"
 PACKAGE_ARCH = "all"
 PR = "r1"
 
diff --git a/recipes/tickypip/tickypip_0.1.2.bb b/recipes/tickypip/tickypip_0.1.2.bb
index 28c05c5..fe28ffa 100644
--- a/recipes/tickypip/tickypip_0.1.2.bb
+++ b/recipes/tickypip/tickypip_0.1.2.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 AUTHOR = "Christian Hammond"
 HOMEPAGE = "http://www.chipx86.com/projects/tickypip/"
-RRECOMMENDS = "tickypip-levels"
+RRECOMMENDS_${PN} = "tickypip-levels"
 PR = "r5"
 
 SRC_URI = "http://www.openzaurus.org/download/3.5.4/sources/tickypip-0.1.2.tar.gz \
diff --git a/recipes/tinc/tinc_1.0.2.bb b/recipes/tinc/tinc_1.0.2.bb
index c1c57b1..b754d0d 100644
--- a/recipes/tinc/tinc_1.0.2.bb
+++ b/recipes/tinc/tinc_1.0.2.bb
@@ -10,7 +10,7 @@ SRC_URI="http://www.tinc-vpn.org/packages/tinc-1.0.2.tar.gz \
 	file://init"
 
 DEPENDS = "openssl lzo zlib"
-RRECOMMENDS = "kernel-module-tun"
+RRECOMMENDS_${PN} = "kernel-module-tun"
 
 inherit autotools
 
diff --git a/recipes/tsclient/tsclient_0.140.bb b/recipes/tsclient/tsclient_0.140.bb
index b091ee1..f123181 100644
--- a/recipes/tsclient/tsclient_0.140.bb
+++ b/recipes/tsclient/tsclient_0.140.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A frontend for rdesktop and other remote desktop tools"
 HOMEPAGE = "http://www.gnomepro.com/tsclient/"
 LICENSE = "GPL"
 DEPENDS = "glib-2.0 gtk+ gnome-panel rdesktop"
-RDEPENDS = "rdesktop"
+RDEPENDS_${PN} = "rdesktop"
 PR = "r1"
 
 SRC_URI = "http://www.gnomepro.com/tsclient/${P}.tar.gz"
diff --git a/recipes/tslib/tslib.inc b/recipes/tslib/tslib.inc
index 715b7e7..a14a288 100644
--- a/recipes/tslib/tslib.inc
+++ b/recipes/tslib/tslib.inc
@@ -66,7 +66,7 @@ DEBIAN_NOAUTONAME_tslib-calibrate = "1"
 
 RDEPENDS_${PN} = "tslib-conf"
 # Ship calibration data if it exists
-RRECOMMENDS = " pointercal "
+RRECOMMENDS_${PN} = " pointercal "
 
 FILES_${PN}-dbg += "${libdir}/ts/.debug*"
 FILES_tslib-conf = "${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tslib.sh ${datadir}/tslib"
diff --git a/recipes/ttf-fonts/ttf-dejavu_2.23.bb b/recipes/ttf-fonts/ttf-dejavu_2.23.bb
index 0c4bd41..931b9e6 100644
--- a/recipes/ttf-fonts/ttf-dejavu_2.23.bb
+++ b/recipes/ttf-fonts/ttf-dejavu_2.23.bb
@@ -3,7 +3,7 @@ require ttf.inc
 DESCRIPTION = "DejaVu font - TTF Edition"
 HOMEPAGE = "http://dejavu.sourceforge.net/wiki/"
 LICENSE = "Bitstream Vera"
-RDEPENDS = "ttf-dejavu-common"
+RDEPENDS_${PN} = "ttf-dejavu-common"
 RDEPENDS_ttf-dejavu-common = ""
 PR = "r2"
 
diff --git a/recipes/ttf-fonts/ttf.inc b/recipes/ttf-fonts/ttf.inc
index 3c04f1b..101d11b 100644
--- a/recipes/ttf-fonts/ttf.inc
+++ b/recipes/ttf-fonts/ttf.inc
@@ -1,7 +1,7 @@
 DESCRIPTION ?= "TrueType font package ${PN}"
 SECTION = "fonts"
 PRIORITY = "optional"
-RRECOMMENDS += "font-update-common"
+RRECOMMENDS_${PN} += "font-update-common"
 
 # we don't need a compiler nor a c library for these fonts
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/recipes/udev/udev-static-devices.bb b/recipes/udev/udev-static-devices.bb
index f0aab5a..952c376 100644
--- a/recipes/udev/udev-static-devices.bb
+++ b/recipes/udev/udev-static-devices.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Provide per-machine static nodes of /dev"
-RDEPENDS = "udev"
+RDEPENDS_${PN} = "udev"
 
 PR = "r0"
 
diff --git a/recipes/unionfs/unionroot-utils_0.1.1.bb b/recipes/unionfs/unionroot-utils_0.1.1.bb
index 0da9c9a..f41fbe6 100644
--- a/recipes/unionfs/unionroot-utils_0.1.1.bb
+++ b/recipes/unionfs/unionroot-utils_0.1.1.bb
@@ -2,7 +2,7 @@ LICENSE = "GPL"
 
 DESCRIPTION = "Tools for administering a system that utilises unionroot."
 DEPENDS = "ipkg-collateral unionroot busybox"
-RDEPENDS = "ipkg-collateral unionroot busybox"
+RDEPENDS_${PN} = "ipkg-collateral unionroot busybox"
 SECTION = "base"
 PRIORITY = "optional"
 
diff --git a/recipes/unionfs/unionroot_0.1.1.bb b/recipes/unionfs/unionroot_0.1.1.bb
index 4047c2f..5d404e3 100644
--- a/recipes/unionfs/unionroot_0.1.1.bb
+++ b/recipes/unionfs/unionroot_0.1.1.bb
@@ -2,7 +2,7 @@ LICENSE = "GPL"
 
 DESCRIPTION = "Provides an init script that changes the root file-system to unionfs."
 DEPENDS = "busybox base-files"
-RDEPENDS = "busybox base-files"
+RDEPENDS_${PN} = "busybox base-files"
 SECTION = "base"
 PRIORITY = "optional"
 
diff --git a/recipes/update-modules/update-modules_1.0.bb b/recipes/update-modules/update-modules_1.0.bb
index 9ec2ff0..3469602 100644
--- a/recipes/update-modules/update-modules_1.0.bb
+++ b/recipes/update-modules/update-modules_1.0.bb
@@ -2,7 +2,7 @@ SECTION = "base"
 DESCRIPTION = "Script to manage module configuration files"
 LICENSE = "GPLv2"
 PACKAGE_ARCH = "all"
-RDEPENDS = "${@base_contains("MACHINE_FEATURES", "kernel26",  "module-init-tools-depmod","modutils-depmod",d)} "
+RDEPENDS_${PN} = "${@base_contains("MACHINE_FEATURES", "kernel26",  "module-init-tools-depmod","modutils-depmod",d)} "
 PR = "r8"
 
 SRC_URI = "file://update-modules"
diff --git a/recipes/upslug/upslug2.inc b/recipes/upslug/upslug2.inc
index 1450cf2..8214a8d 100644
--- a/recipes/upslug/upslug2.inc
+++ b/recipes/upslug/upslug2.inc
@@ -19,7 +19,7 @@ LIBPCAP_RDEPENDS = "libpcap"
 LIBPCAP_RDEPENDS_linux = ""
 LIBPCAP_RDEPENDS_linux-uclibc = ""
 
-RDEPENDS += "${LIBPCAP_RDEPENDS}"
+RDEPENDS_${PN} += "${LIBPCAP_RDEPENDS}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nslu/upslug2-${PV}.tar.gz"
 
diff --git a/recipes/usrp/usrp_0.12.bb b/recipes/usrp/usrp_0.12.bb
index a4708b6..6d28ca3 100644
--- a/recipes/usrp/usrp_0.12.bb
+++ b/recipes/usrp/usrp_0.12.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 HOMEPAGE = "http://comsec.com/wiki?UniversalSoftwareRadioPeripheral"
 SECTION = "devel"
 DEPENDS = "swig-native sdcc-native virtual/libusb0 python boost"
-RDEPENDS = "python-core"
+RDEPENDS_${PN} = "python-core"
 PR = "r1"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/gnuradio/old/usrp-${PV}.tar.gz \
diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 10d4116..a5de201 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -25,7 +25,7 @@ PACKAGES_virtclass-native = ""
 
 PACKAGES_DYNAMIC = "libblkid* libuuid*"
 
-# Provide old util-linux names (several recipes still use DEPENDS or RDEPENDS = "util-linux"):
+# Provide old util-linux names (several recipes still use DEPENDS or RDEPENDS_${PN} = "util-linux"):
 PROVIDES = "util-linux"
 RPROVIDES_${PN} = "util-linux"
 RPROVIDES_util-linux-ng-fdisk = "util-linux-fdisk"
diff --git a/recipes/vagalume/vagalume_0.7.1.bb b/recipes/vagalume/vagalume_0.7.1.bb
index 6c7234e..e41998b 100644
--- a/recipes/vagalume/vagalume_0.7.1.bb
+++ b/recipes/vagalume/vagalume_0.7.1.bb
@@ -3,8 +3,8 @@ AUTHOR = "agarcia@igalia.com"
 HOMEPAGE = "http://vagalume.igalia.com/"
 SECTION = "x11"
 DEPENDS = "gtk+ gstreamer curl gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)}"
-RDEPENDS = "curl gst-plugin-autodetect gst-plugin-audioconvert gst-plugin-alsa librsvg-gtk ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugin-mad', d)}"
-RRECOMMENDS = "dbus-x11"
+RDEPENDS_${PN} = "curl gst-plugin-autodetect gst-plugin-audioconvert gst-plugin-alsa librsvg-gtk ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugin-mad', d)}"
+RRECOMMENDS_${PN} = "dbus-x11"
 PR = "r2"
 
 SRC_URI = "http://vagalume.igalia.com/files/source/vagalume_${PV}.orig.tar.gz\
diff --git a/recipes/vagalume/vagalume_0.8.3.bb b/recipes/vagalume/vagalume_0.8.3.bb
index dc2225c..328fb69 100644
--- a/recipes/vagalume/vagalume_0.8.3.bb
+++ b/recipes/vagalume/vagalume_0.8.3.bb
@@ -3,8 +3,8 @@ AUTHOR = "agarcia@igalia.com"
 HOMEPAGE = "http://vagalume.igalia.com/"
 SECTION = "x11"
 DEPENDS = "gtk+ gstreamer curl gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)}"
-RDEPENDS = "curl gst-plugin-autodetect gst-plugin-audioconvert gst-plugin-alsa gst-plugin-gconfelements librsvg-gtk ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugin-mad', d)}"
-RRECOMMENDS = "dbus-x11 hicolor-icon-theme"
+RDEPENDS_${PN} = "curl gst-plugin-autodetect gst-plugin-audioconvert gst-plugin-alsa gst-plugin-gconfelements librsvg-gtk ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugin-mad', d)}"
+RRECOMMENDS_${PN} = "dbus-x11 hicolor-icon-theme"
 PR = "r0"
 
 SRC_URI = "http://vagalume.igalia.com/files/source/vagalume_${PV}.orig.tar.gz\
diff --git a/recipes/vala-terminal/vala-terminal_git.bb b/recipes/vala-terminal/vala-terminal_git.bb
index a4c519d..e49b9fa 100644
--- a/recipes/vala-terminal/vala-terminal_git.bb
+++ b/recipes/vala-terminal/vala-terminal_git.bb
@@ -11,6 +11,6 @@ inherit autotools
 SRC_URI = "${FREESMARTPHONE_GIT}/vala-terminal.git;protocol=git;branch=master"
 S = "${WORKDIR}/git"
 
-RDEPENDS = "ttf-liberation-mono"
+RDEPENDS_${PN} = "ttf-liberation-mono"
 RREPLACES = "openmoko-terminal2"
 RPROVIDES = "openmoko-terminal2"
diff --git a/recipes/vde/vde_2.0.2.bb b/recipes/vde/vde_2.0.2.bb
index e3154cc..ccb8560 100644
--- a/recipes/vde/vde_2.0.2.bb
+++ b/recipes/vde/vde_2.0.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "VDE can be used: (i) to create a general purpose tunnel (every pr
 LICENSE = "GPLv2"
 HOMEPAGE = "http://vde.sf.net"
 
-RRECOMMENDS = "kernel-module-tun kernel-module-tap"
+RRECOMMENDS_${PN} = "kernel-module-tun kernel-module-tap"
 
 inherit autotools pkgconfig
 
diff --git a/recipes/vlan/vlan_1.8.bb b/recipes/vlan/vlan_1.8.bb
index 697043a..15ae499 100644
--- a/recipes/vlan/vlan_1.8.bb
+++ b/recipes/vlan/vlan_1.8.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "802.1q vlan support program"
-RRECOMMENDS = "kernel-module-8021q"
+RRECOMMENDS_${PN} = "kernel-module-8021q"
 PR = "r2"
 
 S = "${WORKDIR}/vlan/"
diff --git a/recipes/vlan/vlan_1.9.bb b/recipes/vlan/vlan_1.9.bb
index 4382a91..2ca38d4 100644
--- a/recipes/vlan/vlan_1.9.bb
+++ b/recipes/vlan/vlan_1.9.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "802.1q vlan support program"
-RRECOMMENDS = "kernel-module-8021q"
+RRECOMMENDS_${PN} = "kernel-module-8021q"
 PR = "r0"
 
 S = "${WORKDIR}/vlan/"
diff --git a/recipes/vmedit/vmedit_0.02.bb b/recipes/vmedit/vmedit_0.02.bb
index 5600c84..a302a5f 100644
--- a/recipes/vmedit/vmedit_0.02.bb
+++ b/recipes/vmedit/vmedit_0.02.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://194.213.43.198/"
 AUTHOR = "Vladimir Martinek <vm@sykora.cz>"
 SECTION = "gpe"
 LICENSE = "GPL"
-RDEPENDS = "gpe-icons"
+RDEPENDS_${PN} = "gpe-icons"
 
 inherit gpe autotools
 
diff --git a/recipes/vnc/fbvncserver2_cvs.bb b/recipes/vnc/fbvncserver2_cvs.bb
index 29ce532..023d321 100644
--- a/recipes/vnc/fbvncserver2_cvs.bb
+++ b/recipes/vnc/fbvncserver2_cvs.bb
@@ -5,7 +5,7 @@ SECTION = "console/utils"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
 DEPENDS = "libvncserver jpeg zlib gmp tslib"
-RRECOMMENDS = "kernel-modules-uinput kernel-module-keybdev"
+RRECOMMENDS_${PN} = "kernel-modules-uinput kernel-module-keybdev"
 RCONFLICTS = "fbvncserver, fbvncserver-kmodule"
 PV = "0.0.0+cvs${SRCDATE}"
 PR = "r0"
diff --git a/recipes/vnc/fbvncserver_0.9.4.bb b/recipes/vnc/fbvncserver_0.9.4.bb
index 7a913bb..9b40766 100644
--- a/recipes/vnc/fbvncserver_0.9.4.bb
+++ b/recipes/vnc/fbvncserver_0.9.4.bb
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "libvncserver jpeg zlib"
-RDEPENDS = "fbvncserver-kmodule libvncserver-storepasswd libvncserver-javaapplet"
+RDEPENDS_${PN} = "fbvncserver-kmodule libvncserver-storepasswd libvncserver-javaapplet"
 PR = "r3"
 
 SRC_URI = "http://sdgsystems.com/download/fbvncserver-${PV}.tar.gz \
diff --git a/recipes/vpnc/vpnc.inc b/recipes/vpnc/vpnc.inc
index 46f627b..43af4f3 100644
--- a/recipes/vpnc/vpnc.inc
+++ b/recipes/vpnc/vpnc.inc
@@ -5,7 +5,7 @@ SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "libgcrypt"
-RDEPENDS = "kernel-module-tun"
+RDEPENDS_${PN} = "kernel-module-tun"
 
 CFLAGS_append = ' -DVERSION=\\"${PV}\\"'
 LDFLAGS_append = " -lgcrypt -lgpg-error"
diff --git a/recipes/wifi-radar/wifi-radar_1.9.6.bb b/recipes/wifi-radar/wifi-radar_1.9.6.bb
index a50f602..1af2a6d 100644
--- a/recipes/wifi-radar/wifi-radar_1.9.6.bb
+++ b/recipes/wifi-radar/wifi-radar_1.9.6.bb
@@ -7,7 +7,7 @@ PR = "r2"
 
 PACKAGE_ARCH = "all"
 
-RDEPENDS = "python-core python-pygtk python-re python-io python-pygobject python-pycairo"
+RDEPENDS_${PN} = "python-core python-pygtk python-re python-io python-pygobject python-pycairo"
 
 SRC_URI="http://wifi-radar.systemimager.org/pub/${PN}-${PV}.tar.bz2 \
         file://wifi-radar.patch \
diff --git a/recipes/wifistix/wifistix-modules_5.0.16.p0.bb b/recipes/wifistix/wifistix-modules_5.0.16.p0.bb
index c97bc9e..f4833d6 100644
--- a/recipes/wifistix/wifistix-modules_5.0.16.p0.bb
+++ b/recipes/wifistix/wifistix-modules_5.0.16.p0.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.gumstix.com"
 LICENSE = "GPL"
-RDEPENDS = "kernel (${KERNEL_VERSION})"
+RDEPENDS_${PN} = "kernel (${KERNEL_VERSION})"
 DEPENDS = "virtual/kernel"
 PR = "r0"
 
diff --git a/recipes/wpa-supplicant/wpa-gui_0.4.8.bb b/recipes/wpa-supplicant/wpa-gui_0.4.8.bb
index 5755489..860c9a0 100644
--- a/recipes/wpa-supplicant/wpa-gui_0.4.8.bb
+++ b/recipes/wpa-supplicant/wpa-gui_0.4.8.bb
@@ -5,7 +5,7 @@ edit wpa_supplicant networks."
 SECTION = "network"
 LICENSE = "GPL BSD"
 HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
-RDEPENDS = "wpa-supplicant"
+RDEPENDS_${PN} = "wpa-supplicant"
 PR = "r1"
 
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz "
diff --git a/recipes/wpa-supplicant/wpa-gui_0.6.4.bb b/recipes/wpa-supplicant/wpa-gui_0.6.4.bb
index 9da6649..0c8f4f8 100644
--- a/recipes/wpa-supplicant/wpa-gui_0.6.4.bb
+++ b/recipes/wpa-supplicant/wpa-gui_0.6.4.bb
@@ -5,7 +5,7 @@ edit wpa_supplicant networks."
 SECTION = "network"
 LICENSE = "GPL BSD"
 HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
-RDEPENDS = "wpa-supplicant"
+RDEPENDS_${PN} = "wpa-supplicant"
 
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz "
 
diff --git a/recipes/wpa-supplicant/wpa-gui_0.6.9.bb b/recipes/wpa-supplicant/wpa-gui_0.6.9.bb
index 3a230c0..c30c868 100644
--- a/recipes/wpa-supplicant/wpa-gui_0.6.9.bb
+++ b/recipes/wpa-supplicant/wpa-gui_0.6.9.bb
@@ -6,8 +6,8 @@ SECTION = "network"
 LICENSE = "GPL BSD"
 HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
 DEPENDS = "librsvg-native imagemagick-native"
-RDEPENDS = "wpa-supplicant"
-RRECOMMENDS = "${LIBC}-gconv-utf-16"
+RDEPENDS_${PN} = "wpa-supplicant"
+RRECOMMENDS_${PN} = "${LIBC}-gconv-utf-16"
 PR = "r1"
 
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz;name=archive\
diff --git a/recipes/wvdial/wvdial_1.56.bb b/recipes/wvdial/wvdial_1.56.bb
index c6af1af..7dc5253 100644
--- a/recipes/wvdial/wvdial_1.56.bb
+++ b/recipes/wvdial/wvdial_1.56.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://www.alumnit.ca/download/wvdial-1.56.tar.gz \
            file://fixmakefile.patch"
 
 DEPENDS = "wvstreams"
-RDEPENDS = "ppp"
+RDEPENDS_${PN} = "ppp"
 
 EXTRA_OEMAKE = ""
 export WVLINK="${LD}"
diff --git a/recipes/wvdial/wvdial_1.60.bb b/recipes/wvdial/wvdial_1.60.bb
index 0612a04..1cff1e2 100644
--- a/recipes/wvdial/wvdial_1.60.bb
+++ b/recipes/wvdial/wvdial_1.60.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL"
 SRC_URI = "http://www.alumnit.ca/download/wvdial-1.60.tar.gz"
 
 DEPENDS = "wvstreams"
-RDEPENDS = "ppp"
+RDEPENDS_${PN} = "ppp"
 
 EXTRA_OEMAKE = ""
 export CC="${CXX}"
diff --git a/recipes/xaos/xaos_3.2.3.bb b/recipes/xaos/xaos_3.2.3.bb
index 8217c62..25b8806 100644
--- a/recipes/xaos/xaos_3.2.3.bb
+++ b/recipes/xaos/xaos_3.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://wmi.math.u-szeged.hu/xaos/doku.php"
 SECTION = "graphics"
 LICENSE = "GPLv2"
 DEPENDS = "aalib libx11 zlib libpng"
-RDEPENDS += "libxxf86dga"
+RDEPENDS_${PN} += "libxxf86dga"
 PR = "r0"
 
 SRC_URI = "http://easynews.dl.sourceforge.net/sourceforge/xaos/XaoS-3.2.3.tar.gz \
diff --git a/recipes/xerces-j/xerces-j-native_2.9.1.bb b/recipes/xerces-j/xerces-j-native_2.9.1.bb
index 9238ad9..f7241cc 100644
--- a/recipes/xerces-j/xerces-j-native_2.9.1.bb
+++ b/recipes/xerces-j/xerces-j-native_2.9.1.bb
@@ -5,4 +5,4 @@ S = "${WORKDIR}/xerces-2_9_1"
 inherit java-native
 
 DEPENDS = "fastjar-native jaxp1.3-native xml-commons-resolver1.1-native"
-RDEPENDS = ""
+RDEPENDS_${PN} = ""
diff --git a/recipes/xerces-j/xerces-j_2.9.1.bb b/recipes/xerces-j/xerces-j_2.9.1.bb
index 619323a..eda263e 100644
--- a/recipes/xerces-j/xerces-j_2.9.1.bb
+++ b/recipes/xerces-j/xerces-j_2.9.1.bb
@@ -11,7 +11,7 @@ inherit java-library
 JPN = "libxerces2-java"
 
 DEPENDS = "fastjar-native jaxp1.3 xml-commons-resolver1.1"
-RDEPENDS = "libjaxp1.3-java libxml-commons-resolver1.1-java"
+RDEPENDS_${PN} = "libjaxp1.3-java libxml-commons-resolver1.1-java"
 
 do_unpackpost() {
   find src -exec \
diff --git a/recipes/xfce-base/libxfce4menu_4.6.1.bb b/recipes/xfce-base/libxfce4menu_4.6.1.bb
index f8edcb6..ed16740 100644
--- a/recipes/xfce-base/libxfce4menu_4.6.1.bb
+++ b/recipes/xfce-base/libxfce4menu_4.6.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION="a freedesktop.org compliant menu library for Xfce4"
 HOMEPAGE="http://www.xfce.org/projects/libraries"
 DEPENDS = "gettext pkgconfig libxfce4util intltool"
-RDEPENDS = "gtk+ libxfce4util"
+RDEPENDS_${PN} = "gtk+ libxfce4util"
 
 LICENSE="LGPL-2 FDL-1.1"
 PR = "r2"
diff --git a/recipes/xfce-base/libxfcegui4_4.6.1.bb b/recipes/xfce-base/libxfcegui4_4.6.1.bb
index e858219..069269e 100644
--- a/recipes/xfce-base/libxfcegui4_4.6.1.bb
+++ b/recipes/xfce-base/libxfcegui4_4.6.1.bb
@@ -2,7 +2,7 @@
 
 DESCRIPTION = "Xfce Widget library and X Window System interaction"
 DEPENDS = "gettext pkgconfig intltool virtual/libx11 libxfce4util xfconf dbh libxml2 gtk+ libglade"
-RDEPENDS = "xfconf startup-notification "
+RDEPENDS_${PN} = "xfconf startup-notification "
 
 SECTION = "x11/libs"
 PR = "r5"
diff --git a/recipes/xfce-base/thunar_0.9.0.bb b/recipes/xfce-base/thunar_0.9.0.bb
index 6895164..a44c38c 100644
--- a/recipes/xfce-base/thunar_0.9.0.bb
+++ b/recipes/xfce-base/thunar_0.9.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "File manager for the Xfce Desktop Environment"
 DEPENDS = "libxfcegui4 exo dbus-glib libexif xfce4-panel libice libsm gamin"
-RRECOMMENDS = "shared-mime-info"
+RRECOMMENDS_${PN} = "shared-mime-info"
 
 inherit xfce pkgconfig
 
diff --git a/recipes/xfce-base/thunar_1.0.1.bb b/recipes/xfce-base/thunar_1.0.1.bb
index 502831f..bf7865f 100644
--- a/recipes/xfce-base/thunar_1.0.1.bb
+++ b/recipes/xfce-base/thunar_1.0.1.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "File manager for the Xfce Desktop Environment"
 HOMEPAGE="http://thunar.xfce.org"
 DEPENDS = "exo dbus-glib libexif xfce4-panel libice libsm gamin"
-RDEPENDS = "libxfcegui4 exo dbus-glib libexif xfce4-panel libice libsm gamin"
-RRECOMMENDS = "shared-mime-info"
+RDEPENDS_${PN} = "libxfcegui4 exo dbus-glib libexif xfce4-panel libice libsm gamin"
+RRECOMMENDS_${PN} = "shared-mime-info"
 SECTION = "x11"
 PR = "r2"
 
diff --git a/recipes/xfce-base/xfce-terminal_0.2.12.bb b/recipes/xfce-base/xfce-terminal_0.2.12.bb
index df5b296..d2fe7be 100644
--- a/recipes/xfce-base/xfce-terminal_0.2.12.bb
+++ b/recipes/xfce-base/xfce-terminal_0.2.12.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Terminal emulator for the Xfce desktop environment"
 DEPENDS = "exo vte dbus-glib gtk+"
-RDEPENDS += "gnome-pty-helper"
+RDEPENDS_${PN} += "gnome-pty-helper"
 PR = "r2"
 
 inherit xfce46
diff --git a/recipes/xfce-base/xfce-terminal_0.2.8.bb b/recipes/xfce-base/xfce-terminal_0.2.8.bb
index 1a23241..b818f68 100644
--- a/recipes/xfce-base/xfce-terminal_0.2.8.bb
+++ b/recipes/xfce-base/xfce-terminal_0.2.8.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Terminal emulator for the Xfce desktop environment"
 DEPENDS = "exo vte dbus-glib gtk+"
-RDEPENDS += "gnome-pty-helper"
+RDEPENDS_${PN} += "gnome-pty-helper"
 PR = "r2"
 
 inherit xfce
diff --git a/recipes/xfce-base/xfce-terminal_0.4.2.bb b/recipes/xfce-base/xfce-terminal_0.4.2.bb
index 253c0b2..3612562 100644
--- a/recipes/xfce-base/xfce-terminal_0.4.2.bb
+++ b/recipes/xfce-base/xfce-terminal_0.4.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Terminal emulator for the Xfce desktop environment"
 DEPENDS = "exo vte dbus-glib gtk+"
-RDEPENDS += "gnome-pty-helper"
+RDEPENDS_${PN} += "gnome-pty-helper"
 PR = "r2"
 
 inherit xfce46
diff --git a/recipes/xfce-base/xfce4-settings_4.6.1.bb b/recipes/xfce-base/xfce4-settings_4.6.1.bb
index 7ac82cf..7334572 100644
--- a/recipes/xfce-base/xfce4-settings_4.6.1.bb
+++ b/recipes/xfce-base/xfce4-settings_4.6.1.bb
@@ -4,7 +4,7 @@ SECTION = "x11/wm"
 LICENSE = "GPL-2"
 
 DEPENDS = "virtual/libx11 virtual/xserver libxi libwnck xrandr exo libxfce4util"
-RDEPENDS = "gtk+ libxfce4util libxfcegui4 xfconf exo"
+RDEPENDS_${PN} = "gtk+ libxfce4util libxfcegui4 xfconf exo"
 
 PR = "r2"
 
diff --git a/recipes/xfce-base/xfconf_4.6.1.bb b/recipes/xfce-base/xfconf_4.6.1.bb
index ce091ca..078203a 100644
--- a/recipes/xfce-base/xfconf_4.6.1.bb
+++ b/recipes/xfce-base/xfconf_4.6.1.bb
@@ -4,7 +4,7 @@ SECTION = "x11/wm"
 LICENSE = "GPL-2"
 
 DEPENDS = "libxfce4util"
-RDEPENDS = "libxfce4util"
+RDEPENDS_${PN} = "libxfce4util"
 
 PR = "r2"
 
diff --git a/recipes/xfce-base/xfdesktop_4.6.1.bb b/recipes/xfce-base/xfdesktop_4.6.1.bb
index 827a372..38d579f 100644
--- a/recipes/xfce-base/xfdesktop_4.6.1.bb
+++ b/recipes/xfce-base/xfdesktop_4.6.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "XFCE4 Desktop Manager"
 SECTION = "x11/base"
 
 DEPENDS = "virtual/libx11 exo libxfcegui4 xfce4-panel thunar gtk+"
-RDEPENDS = "libxfcegui4 libxml2 xfce4-panel thunar exo gtk+"
+RDEPENDS_${PN} = "libxfcegui4 libxml2 xfce4-panel thunar exo gtk+"
 PR = "r2"
 
 inherit xfce46
diff --git a/recipes/xfce-base/xfwm4-themes_4.6.0.bb b/recipes/xfce-base/xfwm4-themes_4.6.0.bb
index 512c57a..b37ba1b 100644
--- a/recipes/xfce-base/xfwm4-themes_4.6.0.bb
+++ b/recipes/xfce-base/xfwm4-themes_4.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "x11/wm"
 PR = "r3"
 
 DEPENDS = "xfwm4 libglade libxml2"
-RDEPENDS = "xfwm4 libglade libxml2"
+RDEPENDS_${PN} = "xfwm4 libglade libxml2"
 
 inherit xfce46
 
diff --git a/recipes/xfce-base/xfwm4_4.4.2.bb b/recipes/xfce-base/xfwm4_4.4.2.bb
index 9875089..e418e83 100644
--- a/recipes/xfce-base/xfwm4_4.4.2.bb
+++ b/recipes/xfce-base/xfwm4_4.4.2.bb
@@ -9,7 +9,7 @@ inherit xfce update-alternatives
 FILES_${PN} += "${datadir}/xfwm4/defaults ${datadir}/xfwm4/themes/default.keys/*"
 
 DEPENDS = "startup-notification virtual/libx11 libxpm libxfce4util libxfcegui4 libxfce4mcs xfce-mcs-manager"
-RDEPENDS = "xfwm4-theme-default"
+RDEPENDS_${PN} = "xfwm4-theme-default"
 
 
 EXTRA_OECONF += " --enable-startup-notification"
diff --git a/recipes/xfce-base/xfwm4_4.6.1.bb b/recipes/xfce-base/xfwm4_4.6.1.bb
index 9ced1c2..49e5113 100644
--- a/recipes/xfce-base/xfwm4_4.6.1.bb
+++ b/recipes/xfce-base/xfwm4_4.6.1.bb
@@ -9,7 +9,7 @@ inherit xfce46 update-alternatives
 FILES_${PN} += "${datadir}/xfwm4/defaults ${datadir}/xfwm4/themes/default.keys/*"
 
 DEPENDS = "startup-notification virtual/libx11 libxpm libxfce4util libxfcegui4"
-RDEPENDS = "xfwm4-theme-default"
+RDEPENDS_${PN} = "xfwm4-theme-default"
 
 EXTRA_OECONF += " --enable-startup-notification"
 
diff --git a/recipes/xfce-extras/gigolo_0.3.2.bb b/recipes/xfce-extras/gigolo_0.3.2.bb
index c37cdfc..4af7672 100644
--- a/recipes/xfce-extras/gigolo_0.3.2.bb
+++ b/recipes/xfce-extras/gigolo_0.3.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Gigolo is a frontend to easily manage connections to remote filesystems using GIO/GVfs."
 DEPENDS = "pkgconfig gtk+ gvfs"
-RDEPENDS = "libxfce4util libxfcegui4 gvfs fuse-utils"
+RDEPENDS_${PN} = "libxfce4util libxfcegui4 gvfs fuse-utils"
 
 SECTION = "x11"
 LICENSE = "GPL-2"
diff --git a/recipes/xfce-extras/mousepad_0.2.16.bb b/recipes/xfce-extras/mousepad_0.2.16.bb
index 40895c6..ad23b88 100644
--- a/recipes/xfce-extras/mousepad_0.2.16.bb
+++ b/recipes/xfce-extras/mousepad_0.2.16.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Text editor for Xfce based on Leafpad"
-RDEPENDS = "libxfce4util hal"
+RDEPENDS_${PN} = "libxfce4util hal"
 SECTION = "x11"
 PR = "r2"
 
diff --git a/recipes/xfce-extras/orage_4.6.1.bb b/recipes/xfce-extras/orage_4.6.1.bb
index 08d332d..7d4bce7 100644
--- a/recipes/xfce-extras/orage_4.6.1.bb
+++ b/recipes/xfce-extras/orage_4.6.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Calendar application for the Xfce Desktop  Environment"
 DEPENDS = "libxfcegui4  exo xfce4-panel"
-RDEPENDS = "xfce4-panel"
+RDEPENDS_${PN} = "xfce4-panel"
 RREPLACES = "xfcalendar"
 
 SECTION = "x11"
diff --git a/recipes/xfce-extras/ristretto_0.0.21.bb b/recipes/xfce-extras/ristretto_0.0.21.bb
index d221d58..ab12b7b 100644
--- a/recipes/xfce-extras/ristretto_0.0.21.bb
+++ b/recipes/xfce-extras/ristretto_0.0.21.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Ristretto is a picture-viewer for XFCE"
 DEPENDS = "thunar libxfce4util libxfcegui4 libexif dbus"
-RDEPENDS = "thunar libxfce4util libxfcegui4"
+RDEPENDS_${PN} = "thunar libxfce4util libxfcegui4"
 
 SECTION = "x11"
 PR = "r1"
diff --git a/recipes/xfce-extras/squeeze_0.2.3.bb b/recipes/xfce-extras/squeeze_0.2.3.bb
index d68afc0..676d465 100644
--- a/recipes/xfce-extras/squeeze_0.2.3.bb
+++ b/recipes/xfce-extras/squeeze_0.2.3.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Squeeze is an archive manager for the Xfce Desktop  Environment"
 DEPENDS = "pkgconfig dbus gtk+ thunar"
-RDEPENDS = "libxfce4util"
+RDEPENDS_${PN} = "libxfce4util"
 
 SECTION = "x11"
 PR = "r1"
diff --git a/recipes/xfce-extras/xfce4-notifyd_0.1.0.bb b/recipes/xfce-extras/xfce4-notifyd_0.1.0.bb
index 24150cb..0a73eb0 100644
--- a/recipes/xfce-extras/xfce4-notifyd_0.1.0.bb
+++ b/recipes/xfce-extras/xfce4-notifyd_0.1.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Notification daemon for the Xfce desktop."
 DEPENDS = "pkgconfig dbus gtk+ libsexy"
-RDEPENDS = "libxfce4util libxfcegui4 libnotify xfconf"
+RDEPENDS_${PN} = "libxfce4util libxfcegui4 libnotify xfconf"
 
 SECTION = "x11"
 PR = "r1"
diff --git a/recipes/xfce-extras/xfce4-power-manager_0.8.4.2.bb b/recipes/xfce-extras/xfce4-power-manager_0.8.4.2.bb
index 728b564..7eedc06 100644
--- a/recipes/xfce-extras/xfce4-power-manager_0.8.4.2.bb
+++ b/recipes/xfce-extras/xfce4-power-manager_0.8.4.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Xfce panel plugins for power management."
 DEPENDS = "libxfce4util libxfcegui4 libnotify xfconf xfce4-panel"
-RDEPENDS = "libxfce4util libxfcegui4 libnotify xfce4-panel"
+RDEPENDS_${PN} = "libxfce4util libxfcegui4 libnotify xfce4-panel"
 
 SECTION = "x11"
 PR = "r1"
diff --git a/recipes/xkbd/xkbd-layout-ru_0.1.1.bb b/recipes/xkbd/xkbd-layout-ru_0.1.1.bb
index 53fbb3c..3292430 100644
--- a/recipes/xkbd/xkbd-layout-ru_0.1.1.bb
+++ b/recipes/xkbd/xkbd-layout-ru_0.1.1.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 PACKAGE_ARCH = "all"
 PR = "r1"
-RDEPENDS = "xkbd"
+RDEPENDS_${PN} = "xkbd"
 
 #SRC_URI = "http://whitenoise.ssrlab.com/pda/xkbd/xkbd-ru-en-123_0.1.1.tar.gz" 
 SRC_URI = "file://en-ru-123.xkbd"
diff --git a/recipes/xkeyboard-config/xkeyboard-config_1.4.bb b/recipes/xkeyboard-config/xkeyboard-config_1.4.bb
index fb7f5fc..670916f 100644
--- a/recipes/xkeyboard-config/xkeyboard-config_1.4.bb
+++ b/recipes/xkeyboard-config/xkeyboard-config_1.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Common X11 Keyboard layouts"
 LICENSE = "MIT"
 DEPENDS = "intltool xkbcomp-native"
-RDEPENDS = "xkbcomp"
+RDEPENDS_${PN} = "xkbcomp"
 PR = "r4"
 
 SRC_URI = "http://xlibs.freedesktop.org/xkbdesc/xkeyboard-config-${PV}.tar.bz2 \
diff --git a/recipes/xmltv/xmltv_0.5.56.bb b/recipes/xmltv/xmltv_0.5.56.bb
index dc55bb7..ff27d66 100644
--- a/recipes/xmltv/xmltv_0.5.56.bb
+++ b/recipes/xmltv/xmltv_0.5.56.bb
@@ -4,7 +4,7 @@ PARALLEL_MAKE = ""
 SRC_URI="http://downloads.sourceforge.net/xmltv/xmltv-${PV}.tar.bz2 \
          file://Makefile.PL.patch"
 
-RDEPENDS = "perl \
+RDEPENDS_${PN} = "perl \
             libarchive-zip-perl \
             libdate-manip-perl \
             libdatetime-format-strptime-perl \
diff --git a/recipes/xorg-app/mkfontdir_1.0.3.bb b/recipes/xorg-app/mkfontdir_1.0.3.bb
index bdbab32..8ee6f9c 100644
--- a/recipes/xorg-app/mkfontdir_1.0.3.bb
+++ b/recipes/xorg-app/mkfontdir_1.0.3.bb
@@ -2,7 +2,7 @@ require xorg-app-common.inc
 
 PE = "1"
 
-RDEPENDS += "mkfontscale"
+RDEPENDS_${PN} += "mkfontscale"
 
 
 SRC_URI[archive.md5sum] = "4d0f89a23f77e22f1671a77bf0898955"
diff --git a/recipes/xorg-app/mkfontdir_1.0.4.bb b/recipes/xorg-app/mkfontdir_1.0.4.bb
index b8c0452..7cc84ce 100644
--- a/recipes/xorg-app/mkfontdir_1.0.4.bb
+++ b/recipes/xorg-app/mkfontdir_1.0.4.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "a program to create an index of X font files in a directory"
 
 PE = "1"
 
-RDEPENDS += "mkfontscale"
+RDEPENDS_${PN} += "mkfontscale"
 
 
 SRC_URI[archive.md5sum] = "35394bf3f746a57fba624dba52fdbba3"
diff --git a/recipes/xorg-app/mkfontdir_1.0.5.bb b/recipes/xorg-app/mkfontdir_1.0.5.bb
index 8539023..ec75d30 100644
--- a/recipes/xorg-app/mkfontdir_1.0.5.bb
+++ b/recipes/xorg-app/mkfontdir_1.0.5.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "a program to create an index of X font files in a directory"
 
 PE = "1"
 
-RDEPENDS += "mkfontscale"
+RDEPENDS_${PN} += "mkfontscale"
 
 
 SRC_URI[archive.md5sum] = "9365ac66d19186eaf030482d312fca06"
diff --git a/recipes/xorg-app/xman_1.0.2.bb b/recipes/xorg-app/xman_1.0.2.bb
index c6db560..dbaa9d2 100644
--- a/recipes/xorg-app/xman_1.0.2.bb
+++ b/recipes/xorg-app/xman_1.0.2.bb
@@ -2,7 +2,7 @@ require xorg-app-common.inc
 PE = "1"
 
 DEPENDS += " libxaw libxprintutil libxp libxt"
-RDEPENDS = " man"
+RDEPENDS_${PN} = " man"
 
 FILES_${PN} += " /usr/share/X11/xman.help"
 
diff --git a/recipes/xorg-app/xman_1.0.3.bb b/recipes/xorg-app/xman_1.0.3.bb
index c858f8c..40c4009 100644
--- a/recipes/xorg-app/xman_1.0.3.bb
+++ b/recipes/xorg-app/xman_1.0.3.bb
@@ -2,7 +2,7 @@ require xorg-app-common.inc
 
 DESCRIPTION = "manual page browser for X"
 DEPENDS += " libxaw libxprintutil libxp libxt"
-RDEPENDS = " man"
+RDEPENDS_${PN} = " man"
 PE = "1"
 
 FILES_${PN} += " /usr/share/X11/xman.help"
diff --git a/recipes/xorg-app/xman_1.1.0.bb b/recipes/xorg-app/xman_1.1.0.bb
index aba92ae..e51e67d 100644
--- a/recipes/xorg-app/xman_1.1.0.bb
+++ b/recipes/xorg-app/xman_1.1.0.bb
@@ -2,7 +2,7 @@ require xorg-app-common.inc
 
 DESCRIPTION = "manual page browser for X"
 DEPENDS += " libxaw libxprintutil libxp libxt"
-RDEPENDS = " man"
+RDEPENDS_${PN} = " man"
 PE = "1"
 
 FILES_${PN} += " /usr/share/X11/xman.help"
diff --git a/recipes/xorg-data/xkbdata_1.0.1.bb b/recipes/xorg-data/xkbdata_1.0.1.bb
index f951d0d..fec535c 100644
--- a/recipes/xorg-data/xkbdata_1.0.1.bb
+++ b/recipes/xorg-data/xkbdata_1.0.1.bb
@@ -1,7 +1,7 @@
 require xorg-data-common.inc
 PE = "1"
 
-RDEPENDS = "xkbcomp"
+RDEPENDS_${PN} = "xkbcomp"
 
 FILES_${PN} += " /usr/share/X11/xkb"
 
diff --git a/recipes/xorg-driver/xf86-input-tslib_0.0.5.bb b/recipes/xorg-driver/xf86-input-tslib_0.0.5.bb
index 693c703..11c39c8 100644
--- a/recipes/xorg-driver/xf86-input-tslib_0.0.5.bb
+++ b/recipes/xorg-driver/xf86-input-tslib_0.0.5.bb
@@ -1,7 +1,7 @@
 require xorg-driver-input.inc
 
 DESCRIPTION = "X.Org X server -- tslib input driver"
-RRECOMMENDS += "hal tslib-calibrate"
+RRECOMMENDS_${PN} += "hal tslib-calibrate"
 DEPENDS += "tslib"
 
 PR = "r8"
diff --git a/recipes/xorg-driver/xf86-video-glamo_git.bb b/recipes/xorg-driver/xf86-video-glamo_git.bb
index 98e6a7b..60aac90 100644
--- a/recipes/xorg-driver/xf86-video-glamo_git.bb
+++ b/recipes/xorg-driver/xf86-video-glamo_git.bb
@@ -8,7 +8,7 @@ PV = "1.0.0+gitr${SRCPV}"
 PE = "2"
 PR = "r5"
 
-RDEPENDS = "xserver-xorg-extension-dri xserver-xorg-extension-dri2 xserver-xorg-extension-glx mesa-dri"
+RDEPENDS_${PN} = "xserver-xorg-extension-dri xserver-xorg-extension-dri2 xserver-xorg-extension-glx mesa-dri"
 DEPENDS += "libdrm"
 
 DESCRIPTION = "X.Org X server -- Glamo display driver with KMS support"
diff --git a/recipes/xorg-driver/xf86-video-intel_2.10.0.bb b/recipes/xorg-driver/xf86-video-intel_2.10.0.bb
index baac57b..74b4f5b 100644
--- a/recipes/xorg-driver/xf86-video-intel_2.10.0.bb
+++ b/recipes/xorg-driver/xf86-video-intel_2.10.0.bb
@@ -2,7 +2,7 @@ require xorg-driver-video.inc
 
 DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
 DEPENDS += " virtual/libx11 libxvmc drm xf86driproto "
-RDEPENDS += "xserver-xorg-extension-dri \
+RDEPENDS_${PN} += "xserver-xorg-extension-dri \
              xserver-xorg-extension-dri2 \
 	     xserver-xorg-extension-glx"
 PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-vesa_2.2.0.bb b/recipes/xorg-driver/xf86-video-vesa_2.2.0.bb
index b5ffdfe..363f15b 100644
--- a/recipes/xorg-driver/xf86-video-vesa_2.2.0.bb
+++ b/recipes/xorg-driver/xf86-video-vesa_2.2.0.bb
@@ -6,7 +6,7 @@ SRC_URI += "file://fix-includepath.patch \
 
 #DESCRIPTION = ""
 
-RDEPENDS += "xserver-xorg-module-libint10 "
+RDEPENDS_${PN} += "xserver-xorg-module-libint10 "
 PR = "r2"
 SRC_URI[archive.md5sum] = "9a86b683f73f3806f55d05cd804a6f4a"
 SRC_URI[archive.sha256sum] = "8b3e077d2534722033d7b1c647aa7f31fc7fbb5014da096b7a53170005e80226"
diff --git a/recipes/xorg-font/font-alias_1.0.1.bb b/recipes/xorg-font/font-alias_1.0.1.bb
index 727f257..017d376 100644
--- a/recipes/xorg-font/font-alias_1.0.1.bb
+++ b/recipes/xorg-font/font-alias_1.0.1.bb
@@ -3,7 +3,7 @@ require xorg-font-common.inc
 DESCRIPTION = "X font aliases."
 
 DEPENDS = "virtual/xserver font-util"
-RDEPENDS = "encodings font-util"
+RDEPENDS_${PN} = "encodings font-util"
 
 PE = "1"
 PR = "${INC_PR}.0"
diff --git a/recipes/xorg-font/font-alias_1.0.2.bb b/recipes/xorg-font/font-alias_1.0.2.bb
index a96f2b4..902d8ee 100644
--- a/recipes/xorg-font/font-alias_1.0.2.bb
+++ b/recipes/xorg-font/font-alias_1.0.2.bb
@@ -3,7 +3,7 @@ require xorg-font-common.inc
 DESCRIPTION = "X font aliases."
 
 DEPENDS = "virtual/xserver font-util"
-RDEPENDS = "encodings font-util"
+RDEPENDS_${PN} = "encodings font-util"
 
 PE = "1"
 PR = "${INC_PR}.0"
diff --git a/recipes/xorg-font/font-util_1.0.1.bb b/recipes/xorg-font/font-util_1.0.1.bb
index 26945bc..61a43f7 100644
--- a/recipes/xorg-font/font-util_1.0.1.bb
+++ b/recipes/xorg-font/font-util_1.0.1.bb
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
 DESCRIPTION = "X font utils."
 
 DEPENDS = "encodings"
-RDEPENDS = "mkfontdir mkfontscale encodings"
+RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
 
 PE = "1"
 PR = "${INC_PR}.1"
diff --git a/recipes/xorg-font/font-util_1.1.1.bb b/recipes/xorg-font/font-util_1.1.1.bb
index ed21be3..f42b505 100644
--- a/recipes/xorg-font/font-util_1.1.1.bb
+++ b/recipes/xorg-font/font-util_1.1.1.bb
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
 DESCRIPTION = "X font utils."
 
 DEPENDS = "encodings util-macros"
-RDEPENDS = "mkfontdir mkfontscale encodings"
+RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
 
 PE = "1"
 PR = "${INC_PR}.1"
diff --git a/recipes/xorg-font/xorg-font-common.inc b/recipes/xorg-font/xorg-font-common.inc
index 0fc2e8f..2637f13 100644
--- a/recipes/xorg-font/xorg-font-common.inc
+++ b/recipes/xorg-font/xorg-font-common.inc
@@ -3,7 +3,7 @@ SECTION = "x11/fonts"
 LICENSE = "MIT-X"
 
 DEPENDS = " encodings font-alias font-util-native mkfontdir-native mkfontscale-native"
-RDEPENDS = "encodings font-util font-alias"
+RDEPENDS_${PN} = "encodings font-util font-alias"
 
 XORG_PN = "${PN}"
 INC_PR = "r1"
diff --git a/recipes/xorg-util/gccmakedep_1.0.2.bb b/recipes/xorg-util/gccmakedep_1.0.2.bb
index 1abaec5..dbfc648 100644
--- a/recipes/xorg-util/gccmakedep_1.0.2.bb
+++ b/recipes/xorg-util/gccmakedep_1.0.2.bb
@@ -1,7 +1,7 @@
 require xorg-util-common.inc
 
 DESCRIPTION = "create dependencies in makefiles using 'gcc -M'"
-RDEPENDS = "gcc"
+RDEPENDS_${PN} = "gcc"
 
 PR = "r3"
 PE = "1"
diff --git a/recipes/xorg-util/imake_1.0.2.bb b/recipes/xorg-util/imake_1.0.2.bb
index 4d3efd6..1e90a9b 100644
--- a/recipes/xorg-util/imake_1.0.2.bb
+++ b/recipes/xorg-util/imake_1.0.2.bb
@@ -1,7 +1,7 @@
 require xorg-util-common.inc
 
 DESCRIPTION = "C preprocessor interface to the make utility"
-RDEPENDS = "perl xproto"
+RDEPENDS_${PN} = "perl xproto"
 
 PR = "r2"
 PE = "1"
diff --git a/recipes/xorg-util/imake_1.0.3.bb b/recipes/xorg-util/imake_1.0.3.bb
index ce51d59..10e4f73 100644
--- a/recipes/xorg-util/imake_1.0.3.bb
+++ b/recipes/xorg-util/imake_1.0.3.bb
@@ -1,7 +1,7 @@
 require xorg-util-common.inc
 
 DESCRIPTION = "C preprocessor interface to the make utility"
-RDEPENDS = "perl xproto"
+RDEPENDS_${PN} = "perl xproto"
 
 PR = "r2"
 PE = "1"
diff --git a/recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb b/recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb
index 42a48ce..f28c545 100644
--- a/recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb
+++ b/recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb
@@ -1,7 +1,7 @@
 require xserver-kdrive-common.inc
 
 DEPENDS += "hal libxkbfile libxcalibrate pixman"
-RDEPENDS += "hal"
+RDEPENDS_${PN} += "hal"
 
 PE = "1"
 PR = "${INC_PR}.0"
diff --git a/recipes/xorg-xserver/xserver-kdrive_1.4.2.bb b/recipes/xorg-xserver/xserver-kdrive_1.4.2.bb
index 1c63866..0ac7bd3 100644
--- a/recipes/xorg-xserver/xserver-kdrive_1.4.2.bb
+++ b/recipes/xorg-xserver/xserver-kdrive_1.4.2.bb
@@ -1,7 +1,7 @@
 require xserver-kdrive-common.inc
 
 DEPENDS += "hal libxkbfile libxcalibrate pixman"
-RDEPENDS += "hal"
+RDEPENDS_${PN} += "hal"
 
 PE = "1"
 PR = "${INC_PR}.1"
diff --git a/recipes/xorg-xserver/xserver-kdrive_1.4.99.901.bb b/recipes/xorg-xserver/xserver-kdrive_1.4.99.901.bb
index 483133e..7b4066b 100644
--- a/recipes/xorg-xserver/xserver-kdrive_1.4.99.901.bb
+++ b/recipes/xorg-xserver/xserver-kdrive_1.4.99.901.bb
@@ -1,7 +1,7 @@
 require xserver-kdrive-common.inc
 
 DEPENDS += "hal libxkbfile libxcalibrate pixman"
-RDEPENDS += "hal"
+RDEPENDS_${PN} += "hal"
 
 DEFAULT_PREFERENCE = "-99" 
 
diff --git a/recipes/xorg-xserver/xserver-kdrive_1.4.bb b/recipes/xorg-xserver/xserver-kdrive_1.4.bb
index a00160a..0fca6c5 100644
--- a/recipes/xorg-xserver/xserver-kdrive_1.4.bb
+++ b/recipes/xorg-xserver/xserver-kdrive_1.4.bb
@@ -1,7 +1,7 @@
 require xserver-kdrive-common.inc
 
 DEPENDS += "hal libxkbfile libxcalibrate pixman"
-RDEPENDS += "hal"
+RDEPENDS_${PN} += "hal"
 
 PE = "1"
 PR = "${INC_PR}.0"
diff --git a/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb b/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
index 5de73c5..680582e 100644
--- a/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
+++ b/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
@@ -1,7 +1,7 @@
 require xserver-kdrive-common.inc
 
 DEPENDS += "hal libxkbfile libxcalibrate pixman"
-RDEPENDS += "hal"
+RDEPENDS_${PN} += "hal"
 
 DEFAULT_PREFERENCE = "-99" 
 
diff --git a/recipes/xorg-xserver/xserver-xorg_1.4.2.bb b/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
index 692c6c3..cfdecb1 100644
--- a/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
+++ b/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
@@ -2,7 +2,7 @@ require xorg-xserver-common.inc
 
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman"
-RDEPENDS += "hal"
+RDEPENDS_${PN} += "hal"
 PE = "1"
 PR = "${INC_PR}.0"
 
diff --git a/recipes/xorg-xserver/xserver-xorg_1.4.bb b/recipes/xorg-xserver/xserver-xorg_1.4.bb
index fcddb1d..b73df6c 100644
--- a/recipes/xorg-xserver/xserver-xorg_1.4.bb
+++ b/recipes/xorg-xserver/xserver-xorg_1.4.bb
@@ -2,7 +2,7 @@ require xorg-xserver-common.inc
 
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman"
-RDEPENDS += "hal"
+RDEPENDS_${PN} += "hal"
 PE = "1"
 PR = "${INC_PR}.0"
 
diff --git a/recipes/xorg-xserver/xserver-xorg_1.5.1.bb b/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
index a1af8c3..d25a39d 100644
--- a/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
@@ -2,7 +2,7 @@ require xorg-xserver-common.inc
 
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl"
-RDEPENDS += "hal"
+RDEPENDS_${PN} += "hal"
 PE = "1"
 PR = "${INC_PR}.0"
 
diff --git a/recipes/xorg-xserver/xserver-xorg_1.5.3.bb b/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
index 502ad6d..4770c86 100644
--- a/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
+++ b/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
@@ -2,7 +2,7 @@ require xorg-xserver-common.inc
 
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl"
-RDEPENDS += "hal"
+RDEPENDS_${PN} += "hal"
 PE = "2"
 PR = "${INC_PR}.1"
 
diff --git a/recipes/xournal/xournal_0.4.0.1.bb b/recipes/xournal/xournal_0.4.0.1.bb
index 47e234c..891997e 100644
--- a/recipes/xournal/xournal_0.4.0.1.bb
+++ b/recipes/xournal/xournal_0.4.0.1.bb
@@ -2,7 +2,7 @@ HOMEPAGE = "http://xournal.sf.net/"
 DESCRIPTION = "Xournal is an application for notetaking, sketching, keeping a journal using a stylus."
 DEPENDS = "gtk+ libgnomecanvas libgnomeprintui"
 # For pdftopnm:
-RDEPENDS = "poppler"
+RDEPENDS_${PN} = "poppler"
 SECTION = "x11"
 LICENSE = "GPL"
 PR = "r1"
diff --git a/recipes/xournal/xournal_0.4.1.bb b/recipes/xournal/xournal_0.4.1.bb
index 49b3cdd..a7736b4 100644
--- a/recipes/xournal/xournal_0.4.1.bb
+++ b/recipes/xournal/xournal_0.4.1.bb
@@ -2,7 +2,7 @@ HOMEPAGE = "http://xournal.sf.net/"
 DESCRIPTION = "Xournal is an application for notetaking, sketching, keeping a journal using a stylus."
 DEPENDS = "gtk+ libgnomecanvas libgnomeprintui"
 # For pdftopnm:
-RDEPENDS = "poppler"
+RDEPENDS_${PN} = "poppler"
 SECTION = "x11"
 LICENSE = "GPL"
 PR = "r0"
diff --git a/recipes/xournal/xournal_0.4.5.bb b/recipes/xournal/xournal_0.4.5.bb
index 84788fc..ac3936d 100644
--- a/recipes/xournal/xournal_0.4.5.bb
+++ b/recipes/xournal/xournal_0.4.5.bb
@@ -2,7 +2,7 @@ HOMEPAGE = "http://xournal.sf.net/"
 DESCRIPTION = "Xournal is an application for notetaking, sketching, keeping a journal using a stylus."
 DEPENDS = "gtk+ libgnomecanvas libgnomeprintui"
 # For pdftopnm:
-RDEPENDS = "poppler"
+RDEPENDS_${PN} = "poppler"
 SECTION = "x11"
 LICENSE = "GPL"
 PR = "r0"
diff --git a/recipes/xqtlauncher/xqtlauncher-blackbox-config.bb b/recipes/xqtlauncher/xqtlauncher-blackbox-config.bb
index acd5873..1fe2f7f 100644
--- a/recipes/xqtlauncher/xqtlauncher-blackbox-config.bb
+++ b/recipes/xqtlauncher/xqtlauncher-blackbox-config.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://angstrom-distribution.org/"
 LICENSE = "GPL"
 PR = "r0"
 
-RDEPENDS = "blackbox xqtlauncher"
+RDEPENDS_${PN} = "blackbox xqtlauncher"
 
 SRC_URI = "file://blackboxrc \
            file://defaultwm"
diff --git a/recipes/xqtlauncher/xqtlauncher.bb b/recipes/xqtlauncher/xqtlauncher.bb
index 5fc80b1..cfeb0c6 100644
--- a/recipes/xqtlauncher/xqtlauncher.bb
+++ b/recipes/xqtlauncher/xqtlauncher.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://angstrom-distribution.org/"
 LICENSE = "GPL"
 PR = "r2"
 
-RDEPENDS = "xqt2 xorg-minimal-fonts"
+RDEPENDS_${PN} = "xqt2 xorg-minimal-fonts"
 
 SRC_URI = "file://dot.directory \
 	file://startxqt \
diff --git a/recipes/xtscal/xtscal.inc b/recipes/xtscal/xtscal.inc
index 723aab0..07c53e0 100644
--- a/recipes/xtscal/xtscal.inc
+++ b/recipes/xtscal/xtscal.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 DEPENDS = "virtual/libx11 libxcalibrate libxft libxrandr"
 
 # xtscal needs a font to display text
-RRECOMMENDS = "ttf-dejavu-sans"
+RRECOMMENDS_${PN} = "ttf-dejavu-sans"
 
 SRC_URI = "${GPE_MIRROR}/xtscal-${PV}.tar.bz2"
 
diff --git a/recipes/yeaphone/yeaphone_0.1.bb b/recipes/yeaphone/yeaphone_0.1.bb
index 721c534..89e0f01 100644
--- a/recipes/yeaphone/yeaphone_0.1.bb
+++ b/recipes/yeaphone/yeaphone_0.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.devbase.at/voip/"
 LICENSE = "GPLv2"
 PRIORITY = "optional"
 DEPENDS = "liblinphone"
-RDEPENDS = "liblinphone"
-RRECOMMENDS = "\
+RDEPENDS_${PN} = "liblinphone"
+RRECOMMENDS_${PN} = "\
 	linphonec \
 	kernel-module-yealink \
 	kernel-module-usbhid \
diff --git a/recipes/yum/yum_3.2.18.bb b/recipes/yum/yum_3.2.18.bb
index 9ae5ce2..1f19c16 100644
--- a/recipes/yum/yum_3.2.18.bb
+++ b/recipes/yum/yum_3.2.18.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
 	   file://yum-install-recommends.py \
 	   file://extract-postinst.awk"
 
-RDEPENDS = "python-rpm python-core python-iniparse python-urlgrabber \
+RDEPENDS_${PN} = "python-rpm python-core python-iniparse python-urlgrabber \
             python-shell python-re python-logging python-pickle \
 	    python-netserver python-compression \
 	    python-unixadmin python-xml python-sqlite3 \
diff --git a/recipes/zaurusd/zaurusd_svn.bb b/recipes/zaurusd/zaurusd_svn.bb
index 47d5106..e0bbe51 100644
--- a/recipes/zaurusd/zaurusd_svn.bb
+++ b/recipes/zaurusd/zaurusd_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Daemon to handle device specific features."
 SECTION = "base"
 LICENSE = "GPL"
 DEPENDS = "tslib"
-RDEPENDS = "procps"
+RDEPENDS_${PN} = "procps"
 SRCDATE = "20090501"
 PV = "0.0+svn${SRCDATE}"
 PR = "r22"
diff --git a/recipes/zd1211/zd1211_r85.bb b/recipes/zd1211/zd1211_r85.bb
index 6d85458..315d9af 100644
--- a/recipes/zd1211/zd1211_r85.bb
+++ b/recipes/zd1211/zd1211_r85.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://zd1211.ath.cx/"
 SECTION = "kernel/modules"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS = "wireless-tools"
+RDEPENDS_${PN} = "wireless-tools"
 PR = "r1"
 
 SRC_URI = "http://zd1211.ath.cx/download/zd1211-driver-${PV}.tgz \
diff --git a/recipes/zope/zope_3.3.1.bb b/recipes/zope/zope_3.3.1.bb
index d274f33..b104670 100644
--- a/recipes/zope/zope_3.3.1.bb
+++ b/recipes/zope/zope_3.3.1.bb
@@ -1,5 +1,5 @@
-RDEPENDS = "python-shell"
-RRECOMMENDS += "zope-interfaces"
+RDEPENDS_${PN} = "python-shell"
+RRECOMMENDS_${PN} += "zope-interfaces"
 
 inherit distutils-base
 
diff --git a/recipes/zten/zten_1.6.2.bb b/recipes/zten/zten_1.6.2.bb
index 32ec721..6be6309 100644
--- a/recipes/zten/zten_1.6.2.bb
+++ b/recipes/zten/zten_1.6.2.bb
@@ -5,7 +5,7 @@ SECTION = "opie/applications"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "eb kakasi"
-RDEPENDS = "virtual-japanese-font"
+RDEPENDS_${PN} = "virtual-japanese-font"
 RCONFLICTS = "ztenv"
 PR = "r1"
 
-- 
1.7.1



