Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYE-0003rN-2G
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:28:46 +0200
Received: by fxi1 with SMTP id 1so3592229fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=Mp6F3t2mcUtRt7AxsnZyO//aD/fFmNJkyFbdQLGxvTc=;
	b=pQZsyDzynxDelFgAVsCGdmUV1mYRbBslYu490Q14GJeV5friCZOjL3kzvBl6j/xepX
	tpO7dCUC8fOATgXBtnSPYdVd5dhf0FFw2GUSdh4VdRvSJkAgyzLTWwOrNMjYwx9oaP+Q
	yRmgeVeOMNQb7P5zHZqTorp/dhrapgBbsu280=
Received: by 10.223.44.89 with SMTP id z25mr1919113fae.42.1316345010657;
	Sun, 18 Sep 2011 04:23:30 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:29 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:02 +0400
Message-Id: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-opie 00/17] big opie pull
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
X-List-Received-Date: Sun, 18 Sep 2011 11:28:46 -0000

The following changes since commit 963ac303ee49fd77d32d1edaaebf0358af4a6fd0:

  libopieobex0: fix disable-bit-check patch for current git (2011-09-17 14:43:22 +0100)

are available in the git repository at:
  git@github.com:lumag/meta-opie.git master

Dmitry Eremin-Solenikov (17):
      libopie2: also use gcc45_opiemm_include.patch for git version
      libqpe-opie: fix LnkProperties desctructor visibility issues
      opie-taskbar: fix linking issues
      opie-taskbar: launcher also uses opiepim2 library, add it to LIBS
      opie-today-addressbookplugin: add dependencies on opie-today and libqtaux2
      opie-libqrsync: package static library
      libopieobex0: drop setting of FILES for -dbg package
      task-opie: provide defaults for screen resolution
      opie: drop MOC and UIC overrides on command line
      uicmoc-native: install tools with suffix 2
      qmake.bbclass: adapt for  {moc,uic} -> {moc,uic}2 change
      qte-common: adapt for  {moc,uic} -> {moc,uic}2 change
      qmake: do not try to regenerate moc
      opie: fix GPLv2 plus license
      opie: mass-correct licesnses for LGPL packages
      opie: mass GPL->GPLv2 fixup
      opie-icon-reload: for completeness add git version

 classes/qmake.bbclass                              |    4 +-
 recipes-opie/libopie/libopie2.inc                  |    4 +-
 recipes-opie/libopie/libopie2_git.bb               |    1 +
 recipes-opie/libopieobex/libopieobex0.inc          |    4 ---
 recipes-opie/libqpe/libqpe-opie.inc                |    2 +-
 .../qpe-fix-lnkproperties-visibility.patch         |   22 ++++++++++++++++++++
 recipes-opie/libqpe/libqpe-opie_1.2.5.bb           |    3 +-
 recipes-opie/libqpe/libqpe-opie_git.bb             |    3 +-
 recipes-opie/libqtaux/libqtaux2.inc                |    2 +-
 .../nonworking/opie-dagger/opie-dagger.inc         |    2 +-
 .../nonworking/opie-dasher/opie-dasher.inc         |    2 +-
 recipes-opie/opie-aboutapplet/opie-aboutapplet.inc |    2 +-
 recipes-opie/opie-addressbook/opie-addressbook.inc |    2 +-
 recipes-opie/opie-advancedfm/opie-advancedfm.inc   |    2 +-
 recipes-opie/opie-alarm/opie-alarm.inc             |    2 +-
 recipes-opie/opie-appearance/opie-appearance.inc   |    2 +-
 recipes-opie/opie-aqpkg/opie-aqpkg.inc             |    2 +-
 .../opie-autorotateapplet.inc                      |    2 +-
 recipes-opie/opie-backgammon/opie-backgammon.inc   |    2 +-
 recipes-opie/opie-backup/opie-backup.inc           |    2 +-
 recipes-opie/opie-bartender/opie-bartender.inc     |    2 +-
 .../opie-batteryapplet/opie-batteryapplet.inc      |    2 +-
 recipes-opie/opie-bluepin/opie-bluepin.inc         |    2 +-
 .../opie-bluetoothapplet/opie-bluetoothapplet.inc  |    2 +-
 .../opie-bluetoothmanager.inc                      |    3 +-
 recipes-opie/opie-bounce/opie-bounce.inc           |    4 +-
 .../opie-brightnessapplet.inc                      |    2 +-
 .../opie-button-settings/opie-button-settings.inc  |    2 +-
 recipes-opie/opie-buzzword/opie-buzzword.inc       |    4 +-
 recipes-opie/opie-calculator/opie-calculator.inc   |    2 +-
 recipes-opie/opie-camera/opie-camera.inc           |    2 +-
 recipes-opie/opie-cardapplet/opie-cardapplet.inc   |    4 +-
 recipes-opie/opie-checkbook/opie-checkbook.inc     |    2 +-
 recipes-opie/opie-citytime/opie-citytime.inc       |    2 +-
 .../opie-clipboardapplet/opie-clipboardapplet.inc  |    2 +-
 recipes-opie/opie-clock/opie-clock.inc             |    2 +-
 recipes-opie/opie-clockapplet/opie-clockapplet.inc |    2 +-
 recipes-opie/opie-confeditor/opie-confeditor.inc   |    2 +-
 recipes-opie/opie-console/opie-console.inc         |    2 +-
 .../opie-datebook-birthdayplugin.inc               |    2 +-
 .../opie-datebook-chrisholidayplugin.inc           |    2 +-
 .../opie-datebook-nationalholidayplugin.inc        |    2 +-
 recipes-opie/opie-datebook/opie-datebook.inc       |    2 +-
 recipes-opie/opie-deco-flat/opie-deco-flat.inc     |    2 +-
 recipes-opie/opie-deco-liquid/opie-deco-liquid.inc |    2 +-
 .../opie-deco-polished/opie-deco-polished.inc      |    2 +-
 recipes-opie/opie-doctab/opie-doctab.inc           |    2 +-
 recipes-opie/opie-drawpad/opie-drawpad.inc         |    2 +-
 recipes-opie/opie-dvorak/opie-dvorak.inc           |    2 +-
 .../opie-embeddedkonsole/opie-embeddedkonsole.inc  |    2 +-
 recipes-opie/opie-euroconv/opie-euroconv.inc       |    2 +-
 .../opie-examples-python/opie-examples-python.inc  |    2 +-
 recipes-opie/opie-examples/opie-examples.inc       |    2 +-
 recipes-opie/opie-eye/opie-eye.inc                 |    2 +-
 recipes-opie/opie-fifteen/opie-fifteen.inc         |    2 +-
 recipes-opie/opie-formatter/opie-formatter.inc     |    2 +-
 recipes-opie/opie-freetype/opie-freetype.inc       |    2 +-
 recipes-opie/opie-ftp/opie-ftp.inc                 |    2 +-
 recipes-opie/opie-ftplib/opie-ftplib.inc           |    4 +-
 recipes-opie/opie-go/opie-go.inc                   |    2 +-
 .../opie-gutenbrowser/opie-gutenbrowser.inc        |    2 +-
 recipes-opie/opie-handwriting/opie-handwriting.inc |    2 +-
 recipes-opie/opie-help-en/opie-help-en.inc         |    2 +-
 recipes-opie/opie-helpbrowser/opie-helpbrowser.inc |    2 +-
 recipes-opie/opie-homeapplet/opie-homeapplet.inc   |    2 +-
 recipes-opie/opie-i18n/opie-i18n.inc               |    2 +-
 recipes-opie/opie-i18n/opie-lrelease-native.inc    |    2 +-
 recipes-opie/opie-i18n/opie-lupdate-native.inc     |    2 +-
 recipes-opie/opie-icon-reload/opie-icon-reload.inc |    2 +-
 .../opie-icon-reload/opie-icon-reload_git.bb       |    3 ++
 recipes-opie/opie-init/opie-init.inc               |    2 +-
 recipes-opie/opie-irc/opie-irc.inc                 |    2 +-
 recipes-opie/opie-irdaapplet/opie-irdaapplet.inc   |    2 +-
 recipes-opie/opie-jumpx/opie-jumpx.inc             |    2 +-
 recipes-opie/opie-kbill/opie-kbill.inc             |    2 +-
 recipes-opie/opie-kcheckers/opie-kcheckers.inc     |    2 +-
 recipes-opie/opie-keyboard/opie-keyboard.inc       |    2 +-
 recipes-opie/opie-keypebble/opie-keypebble.inc     |    2 +-
 recipes-opie/opie-keytabs/opie-keytabs.inc         |    2 +-
 recipes-opie/opie-keyview/opie-keyview.inc         |    2 +-
 recipes-opie/opie-kjumpx/opie-kjumpx.inc           |    2 +-
 recipes-opie/opie-kpacman/opie-kpacman.inc         |    2 +-
 recipes-opie/opie-language/opie-language.inc       |    2 +-
 .../opie-launcher-settings.inc                     |    2 +-
 recipes-opie/opie-libqrsync/opie-libqrsync.inc     |    6 ++++-
 .../opie-light-and-power/opie-light-and-power.inc  |    2 +-
 recipes-opie/opie-lockapplet/opie-lockapplet.inc   |    2 +-
 recipes-opie/opie-login/opie-login.inc             |    5 ++-
 .../opie-logoutapplet/opie-logoutapplet.inc        |    2 +-
 recipes-opie/opie-mail/opie-mail.inc               |    2 +-
 recipes-opie/opie-mailapplet/opie-mailapplet.inc   |    2 +-
 .../opie-mediaplayer1/opie-mediaplayer1-core.inc   |    2 +-
 .../opie-mediaplayer1/opie-mediaplayer1.inc        |    2 +-
 ...ie-mediaplayer2-skin-default-landscape_1.2.5.bb |    2 +-
 ...opie-mediaplayer2-skin-default-landscape_git.bb |    2 +-
 .../opie-mediaplayer2-skin-default_1.2.5.bb        |    2 +-
 .../opie-mediaplayer2-skin-default_git.bb          |    2 +-
 .../opie-mediaplayer2-skin-pod_1.2.5.bb            |    2 +-
 .../opie-mediaplayer2-skin-pod_git.bb              |    2 +-
 .../opie-mediaplayer2-skin-techno_1.2.5.bb         |    2 +-
 .../opie-mediaplayer2-skin-techno_git.bb           |    2 +-
 .../opie-mediaplayer2/opie-mediaplayer2.inc        |    2 +-
 recipes-opie/opie-mediummount/opie-mediummount.inc |    2 +-
 .../opie-memoryapplet/opie-memoryapplet.inc        |    2 +-
 recipes-opie/opie-mindbreaker/opie-mindbreaker.inc |    2 +-
 recipes-opie/opie-minesweep/opie-minesweep.inc     |    2 +-
 recipes-opie/opie-multikey/opie-multikey.inc       |    2 +-
 .../opie-multikeyapplet/opie-multikeyapplet.inc    |    2 +-
 .../opie-networkapplet/opie-networkapplet.inc      |    2 +-
 .../opie-networksettings/opie-networksettings.inc  |    2 +-
 recipes-opie/opie-notes/opie-notes.inc             |    2 +-
 recipes-opie/opie-notesapplet/opie-notesapplet.inc |    2 +-
 recipes-opie/opie-odict/opie-odict.inc             |    2 +-
 recipes-opie/opie-oxygen/opie-oxygen.inc           |    2 +-
 recipes-opie/opie-oyatzee/opie-oyatzee.inc         |    2 +-
 .../opie-packagemanager/opie-packagemanager.inc    |    4 +-
 recipes-opie/opie-parashoot/opie-parashoot.inc     |    2 +-
 recipes-opie/opie-pickboard/opie-pickboard.inc     |    2 +-
 recipes-opie/opie-pics/opie-pics.inc               |    2 +-
 .../opie-pimconverter/opie-pimconverter.inc        |    4 +-
 recipes-opie/opie-powerchord/opie-powerchord.inc   |    2 +-
 .../opie-pyquicklaunchapplet.inc                   |    2 +-
 recipes-opie/opie-qasteroids/opie-qasteroids.inc   |    2 +-
 recipes-opie/opie-qcop/opie-qcop.inc               |    2 +-
 recipes-opie/opie-qss/opie-qss.inc                 |    2 +-
 .../opie-quicklauncher/opie-quicklauncher.inc      |    2 +-
 recipes-opie/opie-rdesktop/opie-rdesktop.inc       |    2 +-
 recipes-opie/opie-reader/opie-reader.inc           |    2 +-
 recipes-opie/opie-reader/uqtreader_1.2.5.bb        |    2 +-
 recipes-opie/opie-reader/uqtreader_git.bb          |    2 +-
 recipes-opie/opie-recorder/opie-recorder.inc       |    2 +-
 recipes-opie/opie-remote/opie-remote.inc           |    2 +-
 .../opie-restartapplet/opie-restartapplet.inc      |    2 +-
 .../opie-restartapplet2/opie-restartapplet2.inc    |    2 +-
 .../opie-rotateapplet/opie-rotateapplet.inc        |    4 +-
 .../opie-screenshotapplet.inc                      |    2 +-
 recipes-opie/opie-search/opie-search.inc           |    2 +-
 recipes-opie/opie-security/opie-security.inc       |    2 +-
 .../opie-securityplugins/opie-securityplugin.inc   |    2 +-
 recipes-opie/opie-sfcave/opie-sfcave.inc           |    2 +-
 recipes-opie/opie-sh-snes/opie-sh-snes.inc         |    2 +-
 recipes-opie/opie-sh-snes/opie-sh-snes_0.2.bb      |    2 +-
 recipes-opie/opie-sh/opie-sh.inc                   |    2 +-
 recipes-opie/opie-sheet/opie-sheet.inc             |    2 +-
 recipes-opie/opie-snake/opie-snake.inc             |    2 +-
 recipes-opie/opie-solitaire/opie-solitaire.inc     |    2 +-
 recipes-opie/opie-sounds/opie-sounds.inc           |    2 +-
 recipes-opie/opie-sshkeys/opie-sshkeys.inc         |    2 +-
 recipes-opie/opie-stumbler/opie-stumbler.inc       |    2 +-
 recipes-opie/opie-style-flat/opie-style-flat.inc   |    2 +-
 recipes-opie/opie-style-fresh/opie-style-fresh.inc |    2 +-
 .../opie-style-liquid/opie-style-liquid.inc        |    2 +-
 recipes-opie/opie-style-metal/opie-style-metal.inc |    2 +-
 recipes-opie/opie-style-phase/opie-style-phase.inc |    2 +-
 recipes-opie/opie-style-web/opie-style-web.inc     |    2 +-
 .../opie-suspendapplet/opie-suspendapplet.inc      |    2 +-
 recipes-opie/opie-symlinker/opie-symlinker.inc     |    2 +-
 recipes-opie/opie-sysinfo/opie-sysinfo.inc         |    2 +-
 recipes-opie/opie-systemtime/opie-systemtime.inc   |    4 +-
 recipes-opie/opie-tableviewer/opie-tableviewer.inc |    2 +-
 recipes-opie/opie-taskbar/opie-taskbar-images.inc  |    2 +-
 recipes-opie/opie-taskbar/opie-taskbar.inc         |    2 +-
 .../opie-taskbar/fix-crypt-reference.patch         |   21 +++++++++++++++++++
 .../opie-taskbar/opie-taskbar/server-pro-git.patch |    2 +-
 recipes-opie/opie-taskbar/opie-taskbar_1.2.5.bb    |    3 +-
 recipes-opie/opie-tetrix/opie-tetrix.inc           |    2 +-
 recipes-opie/opie-textedit/opie-textedit.inc       |    2 +-
 recipes-opie/opie-theme/opie-theme.inc             |    2 +-
 recipes-opie/opie-tictac/opie-tictac.inc           |    2 +-
 recipes-opie/opie-tinykate/opie-tinykate.inc       |    2 +-
 .../opie-today-addressbookplugin.inc               |    3 +-
 .../opie-today-datebookplugin.inc                  |    2 +-
 .../opie-today-fortuneplugin.inc                   |    2 +-
 .../opie-today-mailplugin.inc                      |    2 +-
 .../opie-today-stocktickerplugin.inc               |    2 +-
 .../opie-today-todolistplugin.inc                  |    2 +-
 .../opie-today-weatherplugin.inc                   |    2 +-
 recipes-opie/opie-today/opie-today.inc             |    2 +-
 recipes-opie/opie-todo/opie-todo.inc               |    4 +-
 recipes-opie/opie-tonleiter/opie-tonleiter.inc     |    2 +-
 recipes-opie/opie-unikeyboard/opie-unikeyboard.inc |    2 +-
 .../opie-vmemo-settings/opie-vmemo-settings.inc    |    2 +-
 recipes-opie/opie-vmemo/opie-vmemo.inc             |    2 +-
 .../opie-volumeapplet/opie-volumeapplet.inc        |    2 +-
 recipes-opie/opie-vtapplet/opie-vtapplet.inc       |    2 +-
 .../opie-wellenreiter/opie-wellenreiter.inc        |    2 +-
 .../opie-wirelessapplet/opie-wirelessapplet.inc    |    2 +-
 recipes-opie/opie-wordgame/opie-wordgame.inc       |    2 +-
 recipes-opie/opie-write/opie-write.inc             |    2 +-
 recipes-opie/opie-zkbapplet/opie-zkbapplet.inc     |    2 +-
 recipes-opie/opie-zlines/opie-zlines.inc           |    2 +-
 recipes-opie/opie-zsafe/opie-zsafe.inc             |    2 +-
 recipes-opie/opie-zsame/opie-zsame.inc             |    2 +-
 recipes-opie/tasks/task-opie.bb                    |    2 +
 recipes-qt/qmake/files/linux-oe-qmake.conf         |    2 +-
 recipes-qt/qmake/qmake-native_1.07a.bb             |    2 +-
 recipes-qt/qte/qte-common_2.3.10.inc               |    4 +-
 recipes-qt/uicmoc/uicmoc-native_2.3.10.bb          |    7 +++--
 198 files changed, 267 insertions(+), 211 deletions(-)
 create mode 100644 recipes-opie/libqpe/libqpe-opie/qpe-fix-lnkproperties-visibility.patch
 create mode 100644 recipes-opie/opie-icon-reload/opie-icon-reload_git.bb
 create mode 100644 recipes-opie/opie-taskbar/opie-taskbar/fix-crypt-reference.patch



