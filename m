Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmknP-0000kO-Ks
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:36:47 +0100
Received: by mail-ea0-f177.google.com with SMTP id c10so2503492eaa.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=i369BWAXcrkmM8RB7afIH6oiZzDoZuqYhkdTHcDDWJs=;
	b=Gu1tXY7cRzRC9EVoejsT5Wi3Pxzgg38ZuS/U5ng4LOtDJbZFgmiwn3PzSqmcVkt1ZT
	yNOuQXMEAnqjSBkX6YHbRQCFU/kJCR7ibezFn1voCoucaod4NEby3TAsxHVZiUNK9Baq
	qEIBZCibEpSDRlqn1d0IwH86zxlKlxFnX8dt/1jeGdqIZ5JUh4eLjLwaDjcIx9HCsmuU
	AohnGtCpdFvCl6wIB2V8VN5aHtnqbsKklBzQilz9QkucesJ44UZB/58YFB5tKF/kFHb4
	HICv0OKRr/O9hEts4O8FBiVsaalDJlD2sm8Tl7A4w/ApHYFKR6dHOigFZto6mFBUzNz5
	FUWg==
X-Received: by 10.14.209.193 with SMTP id s41mr48207393eeo.9.1356265319090;
	Sun, 23 Dec 2012 04:21:59 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w44sm34543585eep.6.2012.12.23.04.21.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:21:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:25 +0100
Message-Id: <cover.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [meta-oe][PATCH 00/30] E17 release and fixes for new libpng, gdb-pixbuf, world
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
X-List-Received-Date: Sun, 23 Dec 2012 12:36:47 -0000

Updated list of packages failing in bitbake world:
  openembedded-core/meta/recipes-graphics/clutter/cogl_1.8.2.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb, do_compile
  openembedded-core/meta/recipes-extended/sat-solver/sat-solver_git.bb, do_compile
  meta-openembedded/meta-oe/recipes-connectivity/uhd/uhd_git.bb, do_compile
  openembedded-core/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb, do_compile
  meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, do_compile
  meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_0.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb, do_compile
  meta-openembedded/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb, do_compile
  meta-openembedded/meta-networking/recipes-support/netcat/netcat_0.7.1.bb, do_compile
  meta-openembedded/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb, do_fetch
  meta-openembedded/meta-oe/recipes-graphics/slim/slim_1.3.2.bb, do_compile
  meta-openembedded/meta-oe/recipes-graphics/fbida/fbida_2.08.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb, do_configure
  meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do_compile
  openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb, do_compile
  meta-openembedded/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb, do_install
  meta-openembedded/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb, do_compile
  meta-openembedded/meta-oe/recipes-support/fftw/benchfft_3.1.bb, do_configure
  meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb, do_compile
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_configure
Log:
http://jenkins.nas-admin.org/job/shr-core-branches_world_qemuarm/22/console

Some issues weren't tested in runtime most of the changes except efl are to recipes
I'm not using in my images and feed (otherwise they would be fixed long time ago).
Please test them.

The following changes since commit a623fd942f6561a425278cf9f114d212d06e5982:

  samba: disable avahi and build without acl (2012-12-21 16:45:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull2

Martin Jansa (30):
  e-base: bump EFL_SRCREV for E17 zero
  meta-efl: upgrade efl to 1.7.4
  meta-efl: update efl svn recipes PV to 1.7.4+svnr
  e-wm: add recipe for released tarball
  edbus2: include edbus-codegen in PN-utils
  libass: upgrade to 0.10.1
  emacs: fix build with libpng-1.5 from oe-core
  abiword: fix build with libpng-1.5 from oe-core
  fltk: fix build with libpng-1.5 from oe-core
  links: upgrade to 2.7 to fix build with libpng-1.5
  omgps: fix build with gdk-pixbuf-2.26.5 from oe-core
  gpm: disable -Werror
  meta-openembedded: use correct format of Upstream-Status
  qwt-e: exclude from world
  hddtemp: rename files to hddtemp for faster lookup
  hddtemp: apply hddtemp-db.patch to our hddtemp.db
  udh: inherit pythonnative
  nautilus3: add FILESEXTRAPATHS to find correct
    no-try-run-strftime.diff first
  libmicrohttpd: change SRC_URI to mirror with old archive still
    available
  libedit: upgrade to 20121213 and fix download
  libgnomecups: fix build with >=glib-2.31
  hplip: fix build with newer cups
  gvfs: disable afc
  navit: bump SRCREV to latest
  libgnomecups: fix build with cups-1.6 from oe-core
  libgnomeprint: fix build with newer toolchain
  libgnomeprint: fix packaging issues
  nautilus3: upgrade to 3.2.1
  pavucontrol: upgrade to 1.0
  nautilus3: fix packaging issue

 meta-efl/classes/e-base.bbclass                    |   2 +-
 .../conf/distro/include/efl-from-svn-recipes.inc   |   4 +-
 meta-efl/recipes-efl/e17/e-wm.inc                  | 205 +++++++++++
 meta-efl/recipes-efl/e17/e-wm_0.17.0.bb            |  16 +
 meta-efl/recipes-efl/e17/e-wm_svn.bb               | 211 +----------
 .../efl/{ecore_1.7.3.bb => ecore_1.7.4.bb}         |   4 +-
 meta-efl/recipes-efl/efl/ecore_svn.bb              |   2 +-
 meta-efl/recipes-efl/efl/edbus2_svn.bb             |   5 +-
 .../efl/{eeze_1.7.3.bb => edbus_1.7.4.bb}          |   4 +-
 meta-efl/recipes-efl/efl/edbus_svn.bb              |   2 +-
 .../efl/{edbus_1.7.3.bb => edje_1.7.4.bb}          |   4 +-
 meta-efl/recipes-efl/efl/edje_svn.bb               |   2 +-
 .../efl/{edje_1.7.3.bb => eet_1.7.4.bb}            |   4 +-
 meta-efl/recipes-efl/efl/eet_svn.bb                |   2 +-
 .../efl/{eet_1.7.3.bb => eeze_1.7.4.bb}            |   4 +-
 meta-efl/recipes-efl/efl/eeze_svn.bb               |   2 +-
 meta-efl/recipes-efl/efl/efreet_1.7.3.bb           |  10 -
 meta-efl/recipes-efl/efl/efreet_1.7.4.bb           |  10 +
 meta-efl/recipes-efl/efl/efreet_svn.bb             |   2 +-
 meta-efl/recipes-efl/efl/eina_1.7.3.bb             |  10 -
 meta-efl/recipes-efl/efl/eina_1.7.4.bb             |  10 +
 meta-efl/recipes-efl/efl/eina_svn.bb               |   2 +-
 meta-efl/recipes-efl/efl/eio_1.7.3.bb              |  10 -
 meta-efl/recipes-efl/efl/eio_1.7.4.bb              |  10 +
 meta-efl/recipes-efl/efl/eio_svn.bb                |   2 +-
 meta-efl/recipes-efl/efl/elementary_1.7.3.bb       |  10 -
 meta-efl/recipes-efl/efl/elementary_1.7.4.bb       |  10 +
 meta-efl/recipes-efl/efl/elementary_svn.bb         |   2 +-
 meta-efl/recipes-efl/efl/embryo_1.7.3.bb           |  10 -
 meta-efl/recipes-efl/efl/embryo_1.7.4.bb           |  10 +
 meta-efl/recipes-efl/efl/embryo_svn.bb             |   2 +-
 meta-efl/recipes-efl/efl/emotion_1.7.3.bb          |  10 -
 meta-efl/recipes-efl/efl/emotion_1.7.4.bb          |  10 +
 meta-efl/recipes-efl/efl/emotion_svn.bb            |   2 +-
 meta-efl/recipes-efl/efl/ethumb_1.7.3.bb           |  10 -
 meta-efl/recipes-efl/efl/ethumb_1.7.4.bb           |  10 +
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |   2 +-
 .../recipes-efl/efl/evas-generic-loaders_1.7.3.bb  |  10 -
 .../recipes-efl/efl/evas-generic-loaders_1.7.4.bb  |  10 +
 .../recipes-efl/efl/evas-generic-loaders_svn.bb    |   2 +-
 meta-efl/recipes-efl/efl/evas_1.7.3.bb             |  10 -
 meta-efl/recipes-efl/efl/evas_1.7.4.bb             |  10 +
 meta-efl/recipes-efl/efl/evas_svn.bb               |   2 +-
 meta-efl/recipes-efl/efl/expedite_1.7.3.bb         |  10 -
 meta-efl/recipes-efl/efl/expedite_1.7.4.bb         |  10 +
 meta-efl/recipes-efl/efl/expedite_svn.bb           |   2 +-
 .../recipes-gnome/abiword/abiword/libpng15.patch   | 102 ++++++
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |   6 +-
 .../0001-Remove-user-switch-applet.patch           |   2 +-
 .../files/0001-Fix-glib-includes.patch             |   2 +-
 .../libgnomecups/libgnomecups-0.2.3-cups-1.6.patch | 288 +++++++++++++++
 .../libgnomecups/libgnomecups-0.2.3-glib.h.patch   |  42 +++
 .../recipes-gnome/gnome/libgnomecups_0.2.3.bb      |   7 +
 .../gnome/libgnomeprint/fix.includes.patch         |  11 +
 .../recipes-gnome/gnome/libgnomeprint_2.18.7.bb    |  15 +-
 .../0001-gvfsfusedaemon.c-fix-glib-build.patch     |   2 +-
 meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb        |   5 +-
 .../{nautilus3_3.0.2.bb => nautilus3_3.2.1.bb}     |  11 +-
 .../florence/files/0001-Fix-glib-includes.patch    |   2 +-
 .../recipes-daemons/vblade/files/cross.patch       |   2 +-
 ....sh-don-t-use-git-describe-for-versioning.patch |   2 +-
 .../libmicrohttpd/libmicrohttpd_0.4.6.bb           |   3 +-
 ...o-run-sbin-dhclient-to-get-the-version-nu.patch |   2 +-
 meta-oe/recipes-connectivity/uhd/uhd.inc           |   4 +-
 ...g-add-rudimentary-support-for-ARM-cpuinfo.patch |   2 +-
 ...c-os-release-and-use-PRETTY_NAME-for-the-.patch |   2 +-
 .../{libedit_20120601.bb => libedit_20121213.bb}   |   6 +-
 ...01-php-don-t-use-broken-wrapper-for-mkdir.patch |   2 +-
 .../0001-disable-AI_ADDRCONFIG-flag.patch          |   2 +-
 .../hplip/hplip-3.12.6/cups-1.6.patch              | 395 +++++++++++++++++++++
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |   3 +
 meta-oe/recipes-multimedia/libass/libass.inc       |   3 +-
 meta-oe/recipes-multimedia/libass/libass_0.10.1.bb |   5 +
 meta-oe/recipes-multimedia/libass/libass_0.9.11.bb |   7 -
 .../pulseaudio/pavucontrol_1.0.bb                  |  13 +
 .../pulseaudio/pavucontrol_git.bb                  |  17 -
 .../navit/taking-address-of-temporary-array.patch  |  76 ----
 meta-oe/recipes-navigation/navit/navit_svn.bb      |   3 +-
 .../omgps/omgps/fix.build.with.glib.2.34.patch     |   3 +
 .../omgps/omgps/fix.capability.patch               |   3 +
 .../recipes-navigation/omgps/omgps/gcc-4.4.patch   |   3 +
 .../omgps/omgps/gdk-pixbuf-2.26.5.patch            |  15 +
 .../omgps/omgps/sysfs.node.2.6.32.patch            |   3 +
 .../omgps/omgps/use.unused.variable.patch          |   3 +
 meta-oe/recipes-navigation/omgps/omgps_svn.bb      |   3 +-
 meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb              |   2 +
 meta-oe/recipes-support/emacs/emacs.inc            |   2 +-
 meta-oe/recipes-support/emacs/emacs_23.4.bb        |   2 +-
 .../fltk/fltk-1.1.10/libpng15.patch                |  61 ++++
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb        |   3 +
 meta-oe/recipes-support/gpm/gpm_1.99.7.bb          |   5 +
 .../recipes-support/hddtemp/files/hddtemp-db.patch | 133 -------
 .../hddtemp-0.3-beta15-autodetect-717479.patch     |   0
 .../hddtemp-no-nls-support.patch                   |   0
 .../hddtemp/{files => hddtemp}/hddtemp.db          |  34 +-
 .../{files => hddtemp}/hddtemp_0.3-beta15-52.diff  |   0
 .../hddtemp/{files => hddtemp}/init                |   0
 .../recipes-support/hddtemp/hddtemp_0.3-beta15.bb  |   3 +-
 .../links/files/cookies-save-0.96.patch            | 106 ------
 ...-2.1pre17-fix-segfault-on-loading-cookies.patch |  20 --
 ...{links-x11_2.0+2.1pre30.bb => links-x11_2.7.bb} |   7 +-
 meta-oe/recipes-support/links/links.inc            |  12 +-
 .../links/{links_2.0+2.1pre30.bb => links_2.7.bb}  |   4 +-
 ...usbmodeswitch-leave-stripping-to-packager.patch |   2 +-
 ...modeswitch-leave-script-munging-to-recipe.patch |   2 +-
 .../recipes-httpd/hiawatha/files/xslt-fix.patch    |   2 +-
 .../files/0001-Fix-panel-plugin-build.patch        |   2 +-
 .../datetime/files/0001-port-to-libxfce4ui.patch   |   2 +-
 ...re.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch |   2 +-
 ...ultiple-interactive-session-save-bug-5379.patch |   2 +-
 ...ttings.xml-remove-trouble-causing-comment.patch |   2 +-
 111 files changed, 1420 insertions(+), 760 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm.inc
 create mode 100644 meta-efl/recipes-efl/e17/e-wm_0.17.0.bb
 rename meta-efl/recipes-efl/efl/{ecore_1.7.3.bb => ecore_1.7.4.bb} (50%)
 rename meta-efl/recipes-efl/efl/{eeze_1.7.3.bb => edbus_1.7.4.bb} (41%)
 rename meta-efl/recipes-efl/efl/{edbus_1.7.3.bb => edje_1.7.4.bb} (41%)
 rename meta-efl/recipes-efl/efl/{edje_1.7.3.bb => eet_1.7.4.bb} (41%)
 rename meta-efl/recipes-efl/efl/{eet_1.7.3.bb => eeze_1.7.4.bb} (41%)
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.4.bb
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword/libpng15.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-cups-1.6.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-glib.h.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomeprint/fix.includes.patch
 rename meta-gnome/recipes-gnome/nautilus/{nautilus3_3.0.2.bb => nautilus3_3.2.1.bb} (76%)
 rename meta-oe/recipes-devtools/libedit/{libedit_20120601.bb => libedit_20121213.bb} (60%)
 create mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/cups-1.6.patch
 create mode 100644 meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
 delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.9.11.bb
 create mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_1.0.bb
 delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_git.bb
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/gdk-pixbuf-2.26.5.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/libpng15.patch
 delete mode 100644 meta-oe/recipes-support/hddtemp/files/hddtemp-db.patch
 rename meta-oe/recipes-support/hddtemp/{files => hddtemp}/hddtemp-0.3-beta15-autodetect-717479.patch (100%)
 rename meta-oe/recipes-support/hddtemp/{files => hddtemp}/hddtemp-no-nls-support.patch (100%)
 rename meta-oe/recipes-support/hddtemp/{files => hddtemp}/hddtemp.db (95%)
 rename meta-oe/recipes-support/hddtemp/{files => hddtemp}/hddtemp_0.3-beta15-52.diff (100%)
 rename meta-oe/recipes-support/hddtemp/{files => hddtemp}/init (100%)
 delete mode 100644 meta-oe/recipes-support/links/files/cookies-save-0.96.patch
 delete mode 100644 meta-oe/recipes-support/links/files/links-2.1pre17-fix-segfault-on-loading-cookies.patch
 rename meta-oe/recipes-support/links/{links-x11_2.0+2.1pre30.bb => links-x11_2.7.bb} (84%)
 rename meta-oe/recipes-support/links/{links_2.0+2.1pre30.bb => links_2.7.bb} (73%)

-- 
1.8.0.2



