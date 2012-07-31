Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1us-00073B-9I
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:10:34 +0200
Received: by wgbds1 with SMTP id ds1so2843200wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 18:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WxQKJLIklQvQj/tsKoefJpCSiabpgAbVQ/wFTYK9FN4=;
	b=AVxXYwbOylvxOeU/g55rxZJtCxaJ7AYk+WVD1Qv0PHtijT83DILs6HplOf5wkv4NFI
	lp1HNYCWClpLaalIjyr66/aj0hzBokNm+AlSvIYjgrbz5PoKqGuCFtmlxtCqIAM9mUH9
	dzA6uCUEPIIjm2vO65LLCJd0xQQY4I+yznHGeKXvXyzqC9AJSDjCXn55Iz3u4ox50J+K
	R9UV8oq4/7RSLhGFe1wu6MWMEcifz/vodmiDyFY55STgjK6+9JAcVIP2LqYswdvNI94o
	U/ejhrtSs0krUnSRe+27PSFFBzH62MHPumpM8L3DslMd3bv8PKASVeoyGcAwmH/wO1dP
	TQRQ==
Received: by 10.180.91.1 with SMTP id ca1mr559544wib.8.1343699937736;
	Mon, 30 Jul 2012 18:58:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm28794550wix.6.2012.07.30.18.58.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 18:58:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:31 +0200
Message-Id: <cover.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 00/24] Merge some recipes from meta-smartphone + few fixes
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
X-List-Received-Date: Tue, 31 Jul 2012 02:10:34 -0000

The following changes since commit 9afc488a1b97bfc5378f139ba04a7a5297b15fdb:

  nano: add PACKAGECONFIG for 'tiny' build (2012-07-25 09:18:12 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (24):
  tcpdump: bump PR to rebuild against libpcap1 instead libpcap
  vala-dbus-binding-tool: bump SRCREV and add recipe for 0.4.0 tarball
  libwnck: use gobject-introspection-stub instead of -native which was
    removed in oe-core
  libgee: use gobject-introspection-stub instead of -native which was
    removed in oe-core
  upower: use gobject-introspection-stub instead of -native which was
    removed in oe-core
  gpsd: drop older version 3.4
  webkit-efl: upgrade to 1.9.3
  eve: add patch to build against newer webkit-efl
  e-wm: use new update-alternatives syntax
  gpsd: add chrpath-native to DEPENDS otherwise it could autodetect
    host chrpath
  udev-extra-rules: drop in favor of udev-extraconf from oe-core
  meta-elf: e-module: add *.a to PN-staticdev
  gnuplot: import from meta-smartphone
  libetpan: import from meta-smartphone
  claws-mail, sylpheed: import from meta-smartphone
  python-epydoc, python-gdata, python-ldap, python-webdav: import from
    meta-smartphone
  mcnavi, monav, omgps, orrery: import from meta-smartphone
  emacs: import from meta-smartphone
  fbreader, fltk, gpm, iksemel, joe, links, ode, openldap, opensync,
    xchat: import from meta-smartphone
  liblockfile, libungif: import from oe-classic
  emacs: fix dso build
  emacs: upgrade to 23.4
  pixman: add patch to fix SEGFAULT when parsing auxv
  emacs: drop older version 23.1

 meta-efl/recipes-efl/e17/e-module.inc              |    1 +
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    9 +-
 .../eve/0001-eve-update-for-newer-webkit-efl.patch |   38 ++
 meta-efl/recipes-efl/e17/eve_svn.bb                |    2 +
 ...t-pass-P-to-the-preprocessor-when-running.patch |   76 ---
 ...ore-add-EINA_LIBRARIES-to-shell-build-for.patch |   28 -
 .../recipes-efl/webkit/webkit-efl/CMakeLists.txt   |   38 +-
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |   11 +-
 meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb |   10 +-
 meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb |   10 +-
 meta-oe/recipes-core/udev/udev-extra-rules.bb      |   36 --
 .../udev/udev-extra-rules/automount.rules          |   19 -
 .../udev/udev-extra-rules/autonet.rules            |   19 -
 .../recipes-core/udev/udev-extra-rules/local.rules |   21 -
 .../udev/udev-extra-rules/mount.blacklist          |    3 -
 .../recipes-core/udev/udev-extra-rules/mount.sh    |   64 ---
 .../recipes-core/udev/udev-extra-rules/network.sh  |   58 --
 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb    |    7 +-
 .../recipes-devtools/python/python-epydoc_3.0.1.bb |   18 +
 .../recipes-devtools/python/python-gdata_1.2.4.bb  |   18 +
 .../python/python-ldap/setup.cfg.patch             |   14 +
 .../recipes-devtools/python/python-ldap_2.3.9.bb   |   13 +
 .../recipes-devtools/python/python-webdav_0.1.2.bb |   19 +
 .../vala-dbus-binding-tool.inc                     |    2 +-
 .../vala-dbus-binding-tool_0.4.0.bb                |    4 +
 .../vala-dbus-binding-tool_git.bb                  |    7 +-
 .../gnuplot/gnuplot-4.4.4/automake-1.12.x.patch    |   44 ++
 .../gnuplot/gnuplot-4.4.4/subdirs.patch            |   11 +
 meta-oe/recipes-extended/gnuplot/gnuplot.inc       |   35 ++
 .../gnuplot/gnuplot/gnuplot.desktop                |    8 +
 .../recipes-extended/gnuplot/gnuplot/gnuplot.png   |  Bin 0 -> 9383 bytes
 .../recipes-extended/gnuplot/gnuplot/qtopia.trm    |  483 ++++++++++++++++
 meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb  |   16 +
 .../liblockfile/liblockfile-1.06/configure.patch   |   25 +
 .../liblockfile/liblockfile-1.06/glibc-2.4.patch   |   70 +++
 .../liblockfile/liblockfile-1.06/install.patch     |   48 ++
 .../liblockfile/liblockfile-1.06/ldflags.patch     |   21 +
 .../liblockfile/liblockfile_1.06.bb                |   21 +
 .../recipes-extended/libungif/libungif_4.1.3.bb    |   14 +
 ...lated-workarounds-in-cpu-features-detecti.patch |  121 ++++
 .../xorg-lib/pixman_0.26.2.bbappend                |    6 +-
 ...t-fix-DSO-build-for-ntpshm-garmin_monitor.patch |   41 --
 ...prefix-includepy-with-sysroot-and-drop-sy.patch |   72 ---
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |  123 -----
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |    5 +-
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |    4 +-
 meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb  |   18 +
 .../recipes-navigation/monav/monav/monav.desktop   |   10 +
 meta-oe/recipes-navigation/monav/monav/monav.png   |  Bin 0 -> 21543 bytes
 meta-oe/recipes-navigation/monav/monav_0.3.bb      |   37 ++
 .../omgps/omgps/fix.capability.patch               |   59 ++
 .../recipes-navigation/omgps/omgps/gcc-4.4.patch   |   68 +++
 .../omgps/omgps/sysfs.node.2.6.32.patch            |   11 +
 .../omgps/omgps/use.unused.variable.patch          |   12 +
 meta-oe/recipes-navigation/omgps/omgps_svn.bb      |   23 +
 .../recipes-navigation/orrery/orrery/orrery.png    |  Bin 0 -> 19475 bytes
 .../orrery/orrery/use.GdkPixbuf.patch              |   59 ++
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |   30 +
 .../claws-mail-3.6.1/claws-mail-g_strcmp0.patch    |  575 ++++++++++++++++++++
 .../claws-mail/claws-mail-3.6.1/desktop.patch      |   19 +
 .../claws-mail-3.6.1/duplicate-header.patch        |   10 +
 .../claws-mail/claws-mail-3.6.1/glib-2.32.patch    |   11 +
 .../recipes-sato/claws-mail/claws-mail_3.6.1.bb    |   62 +++
 .../claws-plugin-gtkhtml2-viewer_0.31.bb           |   19 +
 .../claws-plugin-mailmbox-fixup.patch              |  218 ++++++++
 .../claws-mail/claws-plugin-mailmbox_1.14.bb       |   19 +
 .../claws-mail/claws-plugin-rssyl_0.18.bb          |   18 +
 .../claws-mail/sylpheed/glib-2.32.patch            |   11 +
 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb  |   37 ++
 .../emacs/emacs-23.4/nostdlib-unwind.patch         |   16 +
 .../emacs/emacs-23.4/use-qemu.patch                |  104 ++++
 meta-oe/recipes-support/emacs/emacs.inc            |   68 +++
 meta-oe/recipes-support/emacs/emacs_23.4.bb        |    8 +
 .../fbreader/fbreader-0.12.10/Makefile.patch       |   22 +
 .../fbreader/fbreader-0.12.10/gcc45.patch          |   20 +
 .../recipes-support/fbreader/fbreader_0.12.10.bb   |   45 ++
 meta-oe/recipes-support/fbreader/fbreader_git.bb   |   45 ++
 ...ation-of-the-icons-when-RESOLUTION-is-set.patch |   40 ++
 .../fltk/fltk-1.1.10/disable_test.patch            |   13 +
 .../recipes-support/fltk/fltk-1.1.10/dso-fix.patch |   13 +
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb        |   37 ++
 meta-oe/recipes-support/gpm/gpm-1.99.7/init        |   32 ++
 .../recipes-support/gpm/gpm-1.99.7/no-docs.patch   |   18 +
 .../gpm/gpm-1.99.7/processcreds.patch              |   12 +
 meta-oe/recipes-support/gpm/gpm_1.99.7.bb          |   43 ++
 .../recipes-support/iksemel/iksemel-1.4/r25.diff   |   32 ++
 meta-oe/recipes-support/iksemel/iksemel_1.4.bb     |   16 +
 meta-oe/recipes-support/joe/joe_3.1.bb             |   13 +
 .../libetpan-0.57/libetpan-autoreconf.patch        |   12 +
 .../libetpan/libetpan-0.57/libetpan-ldflags.patch  |   11 +
 meta-oe/recipes-support/libetpan/libetpan_0.57.bb  |   24 +
 .../recipes-support/links/files/ac-prog-cxx.patch  |   11 +
 .../links/files/cookies-save-0.96.patch            |  106 ++++
 ...-2.1pre17-fix-segfault-on-loading-cookies.patch |   20 +
 meta-oe/recipes-support/links/files/links2.desktop |   14 +
 .../links/links-x11_2.0+2.1pre30.bb                |   26 +
 meta-oe/recipes-support/links/links.inc            |   19 +
 .../recipes-support/links/links_2.0+2.1pre30.bb    |   13 +
 meta-oe/recipes-support/ode/ode/install.patch      |   23 +
 meta-oe/recipes-support/ode/ode_0.9.bb             |   24 +
 .../openldap/openldap-2.4.23/initscript            |   29 +
 .../openldap/openldap-2.4.23/install-strip.patch   |   14 +
 .../openldap-2.4.23/openldap-m4-pthread.patch      |   20 +
 .../recipes-support/openldap/openldap_2.4.23.bb    |  270 +++++++++
 .../recipes-support/opensync/libsyncml_0.5.4.bb    |   29 +
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb  |   29 +
 meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb   |    2 +-
 meta-oe/recipes-support/upower/upower_0.9.14.bb    |    4 +-
 .../xchat/xchat-2.8.8/glib-2.32.patch              |   44 ++
 meta-oe/recipes-support/xchat/xchat_2.8.8.bb       |   30 +
 .../recipes-navigation/gpsd/gpsd_3.4.bbappend      |   18 -
 111 files changed, 3791 insertions(+), 637 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/eve/0001-eve-update-for-newer-webkit-efl.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules.bb
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules/automount.rules
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules/autonet.rules
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules/local.rules
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules/mount.blacklist
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules/mount.sh
 delete mode 100644 meta-oe/recipes-core/udev/udev-extra-rules/network.sh
 create mode 100644 meta-oe/recipes-devtools/python/python-epydoc_3.0.1.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-gdata_1.2.4.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-ldap/setup.cfg.patch
 create mode 100644 meta-oe/recipes-devtools/python/python-ldap_2.3.9.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-webdav_0.1.2.bb
 create mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automake-1.12.x.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/subdirs.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot.inc
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.desktop
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.png
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/qtopia.trm
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.06/configure.patch
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.06/glibc-2.4.patch
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.06/install.patch
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.06/ldflags.patch
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile_1.06.bb
 create mode 100644 meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
 create mode 100644 meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
 create mode 100644 meta-oe/recipes-navigation/monav/monav/monav.desktop
 create mode 100644 meta-oe/recipes-navigation/monav/monav/monav.png
 create mode 100644 meta-oe/recipes-navigation/monav/monav_0.3.bb
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps_svn.bb
 create mode 100644 meta-oe/recipes-navigation/orrery/orrery/orrery.png
 create mode 100644 meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch
 create mode 100644 meta-oe/recipes-navigation/orrery/orrery_2.7.bb
 create mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/claws-mail-g_strcmp0.patch
 create mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/desktop.patch
 create mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/duplicate-header.patch
 create mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail-3.6.1/glib-2.32.patch
 create mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail_3.6.1.bb
 create mode 100644 meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
 create mode 100644 meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox-1.14/claws-plugin-mailmbox-fixup.patch
 create mode 100644 meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.14.bb
 create mode 100644 meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.18.bb
 create mode 100644 meta-oe/recipes-sato/claws-mail/sylpheed/glib-2.32.patch
 create mode 100644 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
 create mode 100644 meta-oe/recipes-support/emacs/emacs-23.4/nostdlib-unwind.patch
 create mode 100644 meta-oe/recipes-support/emacs/emacs-23.4/use-qemu.patch
 create mode 100644 meta-oe/recipes-support/emacs/emacs.inc
 create mode 100644 meta-oe/recipes-support/emacs/emacs_23.4.bb
 create mode 100644 meta-oe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
 create mode 100644 meta-oe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
 create mode 100644 meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb
 create mode 100644 meta-oe/recipes-support/fbreader/fbreader_git.bb
 create mode 100644 meta-oe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/disable_test.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/dso-fix.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk_1.1.10.bb
 create mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/init
 create mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/no-docs.patch
 create mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.patch
 create mode 100644 meta-oe/recipes-support/gpm/gpm_1.99.7.bb
 create mode 100644 meta-oe/recipes-support/iksemel/iksemel-1.4/r25.diff
 create mode 100644 meta-oe/recipes-support/iksemel/iksemel_1.4.bb
 create mode 100644 meta-oe/recipes-support/joe/joe_3.1.bb
 create mode 100644 meta-oe/recipes-support/libetpan/libetpan-0.57/libetpan-autoreconf.patch
 create mode 100644 meta-oe/recipes-support/libetpan/libetpan-0.57/libetpan-ldflags.patch
 create mode 100644 meta-oe/recipes-support/libetpan/libetpan_0.57.bb
 create mode 100644 meta-oe/recipes-support/links/files/ac-prog-cxx.patch
 create mode 100644 meta-oe/recipes-support/links/files/cookies-save-0.96.patch
 create mode 100644 meta-oe/recipes-support/links/files/links-2.1pre17-fix-segfault-on-loading-cookies.patch
 create mode 100644 meta-oe/recipes-support/links/files/links2.desktop
 create mode 100644 meta-oe/recipes-support/links/links-x11_2.0+2.1pre30.bb
 create mode 100644 meta-oe/recipes-support/links/links.inc
 create mode 100644 meta-oe/recipes-support/links/links_2.0+2.1pre30.bb
 create mode 100644 meta-oe/recipes-support/ode/ode/install.patch
 create mode 100644 meta-oe/recipes-support/ode/ode_0.9.bb
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.23/initscript
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-m4-pthread.patch
 create mode 100644 meta-oe/recipes-support/openldap/openldap_2.4.23.bb
 create mode 100644 meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
 create mode 100644 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
 create mode 100644 meta-oe/recipes-support/xchat/xchat-2.8.8/glib-2.32.patch
 create mode 100644 meta-oe/recipes-support/xchat/xchat_2.8.8.bb
 delete mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend

-- 
1.7.8.6



