Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4068974688
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:04 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id h76so15713396wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G8VrsVLeAr/aXKuP6vfNOwKIjGs59nwdmE3/nrgWoKY=;
	b=rDEJsDaVLxhnTiBJS5FGzaVaPIjxJDwwasxaFBx+anvV8pjR076FYyCFy2n3yTzzHg
	7A+gYdjJbrn6m1vIuUEjlI1h2o9naKFynpmVm8XcQPYtb2RUYlp+sPjGrFzkj0lHNoa1
	oPEdveQeCo3CRy6NJcQRxENlx+urodi4W6P5IDlucVUQS4notvtn+w+/Hr+4Jj3Ec+uo
	3qy7rEE7DhvIivgIc1ZbTvNqkStVWqSAktHCrInnW+o5nzrln4B1aiGtPIFHX0c/q+JD
	rBNwypqE+f4GnuQkLj1wfFoxz6aua45WT68NZMg6FlZqsmDbO1DA/7Zbifs5hh+rRECL
	BJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G8VrsVLeAr/aXKuP6vfNOwKIjGs59nwdmE3/nrgWoKY=;
	b=smBb+kgHWcK9Xp1UGbY2Ol4N1KdpKfpvlFFCcKznAnTZRbQME4nmwd07dch03DFT+H
	yZPtYgTPuzZFbnSoADHBk0sT/weOiuHI1ja/juKYhZk+XlTI3SQ3Cp/aAsb477HGw4QR
	pfmWeormSDrCHD+3WgRXv9ZtRNyqARlg5XnJinjPPq16xWQh2PcadqRxFRoFGTra8wCr
	XRYzCscnAvfufPo5hQb+WV1fUKTqb2Vc1xZ9ZrdeRvUAQ4jz7qZOjEB4vpKmE7M0uqxV
	PGunTVNgf68lAEeSPrWeHR0t2MgnjIRf/v7RW8YrL5Ixn5IgHHxzwh3II9KcYiAZuLkZ
	i6NA==
X-Gm-Message-State: AElRT7HmgMOwN1/I8J8JrHfin9hzPKbZQJGJROnR9i6rtabqTQggSVjo
	jc/2LqMA/fWmRAkIo/Y/BHfL0g==
X-Google-Smtp-Source: AIpwx4+fwBpI1UnW2IW/hNZrfwVMZqJiv87yBBcjaQWxT0cO4hPSJs4J3fh/q01gssS+V6tr39c5WA==
X-Received: by 10.28.237.6 with SMTP id l6mr2119244wmh.122.1522416724539;
	Fri, 30 Mar 2018 06:32:04 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:12 +0200
Message-Id: <20180330133151.25882-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 00/39] Consolitaded pull request (resend)
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I've put together what is important from my perspective. All of them were
sent already but I hope things get easier by consolidated pull request.

* libgnomeui/libgnome remove: Since there was no discussion I assume the 
  slipped through
* libgnome-keyring update: was rebased
* libsdl-ttf/libsdl2-ttf refresh patches: Reworked completely

All recipes touched here build from scratch cleanly for me and most - if not all
of them are running in my current images without issues.

The following changes since commit b02424812ede9ec095702734427f3f761d61452b:

  libqb: Upgrade to 1.0.3 (2018-03-29 16:58:44 -0700)

are available in the Git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git consolidated-pull

for you to fetch changes up to 875c24f07910f4b8920d8cde3e43d68bc27d3bf8:

  xterm: add update-alternatives for resize to avoid conflict with busybox (2018-03-30 13:39:46 +0200)

----------------------------------------------------------------
Andreas Müller (36):
      libgnomeui: remove
      libgnome: remove
      mozjs: refresh patch Manually_mmap_heap_memory_esr17.patch
      krb5: refresh 0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
      libxfce4ui: refresh 0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch
      libqmi: refresh 0001-Detect-clang.patch
      exo: refresh patches
      mariadb(-native): refresh fix-mysqlclient-r-version.patch
      glmark2: refresh Fix-configure-for-sqrt-check.patch
      networkmanager: fix gobject-introspection/musl and cleanup
      libgnome-keyring: update 2.32.0 -> 3.12.0
      network-manager-applet: update 1.4.4 -> 1.8.10
      libunique: move to meta-xfce
      gtkmm3: add initial 3.22.2
      gtkmm: minor cleanup
      libgtop: update 2.30.0 -> 2.38.0
      gnome-system-monitor: re-add 3.26.0
      metacity: remove
      xfce4-pulseaudio-plugin: update 0.3.5 -> 0.4.0
      xfce4-settings: update 4.12.2 -> 4.12.3
      gnome-keyring: update 2.32.1 -> 3.20.0
      upower: update 0.99.5 -> 0.99.7
      libblockdev: update 2.10 -> 2.16
      udisks2: update 2.1.8 -> 2.7.6
      gvfs: update 1.34.1 -> 1.36.0
      gparted: update 0.30.0 -> 0.31.0
      hunspell: update 1.6.1 -> 1.6.2
      libgphoto2: 2.5.14 -> 2.5.16
      libass: update 0.13.6 -> 0.14.0
      mm-common: update 0.9.10 -> 0.9.11
      mpd: update 0.19.21 -> 0.20.18
      libupnp1.6: remove
      xdg-user-dirs: 0.15 -> 0.17
      libsdl-ttf/libsdl2-ttf: refresh patches
      remove slim leftovers
      xterm: add update-alternatives for resize to avoid conflict with busybox

Chen Qi (1):
      cyrus-sasl: fix systemd related setting

Martin Jansa (1):
      ntp: refresh patch

Pablo Saavedra (1):
      networkmanager upgrade to 1.10.6

 meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.4.4.bb => network-manager-applet_1.8.10.bb}         |   17 +-
 meta-gnome/recipes-extended/gparted/{gparted_0.30.0.bb => gparted_0.31.0.bb}                                                         |    4 +-
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch                                                                 |   55 -
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb                                                                       |   58 -
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb                                                                       |   42 +
 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb                                                                    |   20 -
 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb                                                                    |   17 +
 meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch                                                |   28 +
 meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb                                                         |   32 +
 meta-gnome/recipes-gnome/gvfs/{gvfs_1.34.1.bb => gvfs_1.36.0.bb}                                                                     |    9 +-
 meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch                                  |   35 -
 meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch                                                                 |   26 -
 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb                                                                                 |   38 -
 meta-gnome/recipes-gnome/libgnome/libgnomeui/0001-suppress-string-format-literal-warning-to-fix-build-.patch                         |   78 --
 meta-gnome/recipes-gnome/libgnome/libgnomeui/05_fix_invalid_utf8.patch                                                               |   21 -
 meta-gnome/recipes-gnome/libgnome/libgnomeui/gnome-stock-pixbufs.h                                                                   | 4030 ---------------------------------------------------------------------
 meta-gnome/recipes-gnome/libgnome/libgnomeui/no-pixbuf-csource.patch                                                                 |   11 -
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb                                                                               |   34 -
 meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb                                                                                   |   15 -
 meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb                                                                                   |   13 +
 meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch                                                          |   27 -
 meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch                                                          |   28 -
 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb                                                                                |   35 -
 meta-multimedia/recipes-connectivity/libupnp/libupnp1.6/sepbuildfix.patch                                                            |   34 -
 meta-multimedia/recipes-connectivity/libupnp/libupnp1.6_1.6.21.bb                                                                    |   20 -
 meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.21.bb => mpd_0.20.18.bb}                                                        |   10 +-
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch              |   82 --
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-check-for-strndupa-before-using-it.patch                     |   67 --
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch              |  621 -----------
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch    |   29 -
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch   |   36 -
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch   |   40 +
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch            |   29 -
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fix-nm-version-macro-includes.patch                          |   58 -
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch     |   25 +
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch          |   30 -
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch   |   67 --
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch                                        |   39 -
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch   |   77 ++
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch              |   93 --
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch   |   36 -
 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch                                        |   53 +
 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch                          |   35 +
 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch                              |   72 ++
 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch                                 |   62 ++
 meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.4.4.bb => networkmanager_1.10.6.bb}                            |   48 +-
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb                                                                      |    4 +-
 meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch                                                                      |   20 +-
 meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch                                                           |   22 +-
 meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch                                |   11 +-
 meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch                                                                   |    3 +-
 meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb                                                                                   |   12 -
 meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb                                                                                   |    9 +
 meta-oe/recipes-dbs/mysql/mariadb/fix-mysqlclient-r-version.patch                                                                    |   21 +-
 meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch                                             |   14 +-
 meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-compiling-with-with-dm.patch                                     |   66 +-
 meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-against-musl-C-library.patch                                     |   12 +-
 meta-oe/recipes-extended/libblockdev/files/0005-fix-a-clang-compiling-issue.patch                                                    |   36 +-
 meta-oe/recipes-extended/libblockdev/{libblockdev_2.10.bb => libblockdev_2.16.bb}                                                    |   30 +-
 meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch                                                           |   13 +-
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb                                                                                          |   22 +
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb                                                                                           |    4 +-
 meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.14.bb => libgphoto2_2.5.16.bb}                                                      |    4 +-
 meta-oe/recipes-graphics/slim/slim/Makefile.oe                                                                                       |   64 --
 meta-oe/recipes-graphics/slim/slim/slim-dynwm                                                                                        |    8 -
 meta-oe/recipes-graphics/slim/slim/slim.pamd                                                                                         |   19 -
 meta-oe/recipes-graphics/slim/slim/slim.service                                                                                      |   11 -
 meta-oe/recipes-graphics/slim/slim/update_slim_wmlist                                                                                |   76 --
 meta-oe/recipes-graphics/xorg-app/xterm_330.bb                                                                                       |    5 +
 meta-oe/recipes-multimedia/libass/libass_0.13.6.bb                                                                                   |    4 -
 meta-oe/recipes-multimedia/libass/{libass.inc => libass_0.14.0.bb}                                                                   |    4 +-
 meta-oe/recipes-support/hunspell/{hunspell_1.6.1.bb => hunspell_1.6.2.bb}                                                            |    4 +-
 meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch                                                                      |   13 -
 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf/use.pkg-config.for.freetype2.patch                                                     |   62 ++
 meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/automake_foreign.patch                                                                |   21 +
 meta-oe/recipes-support/libsdl-ttf/{files => libsdl2-ttf}/use.pkg-config.for.freetype2.patch                                         |   13 +-
 meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch                                                         |   35 +
 meta-oe/recipes-support/udisks/udisks2_2.1.8.bb                                                                                      |   39 -
 meta-oe/recipes-support/udisks/udisks2_2.7.6.bb                                                                                      |   49 +
 meta-oe/recipes-support/upower/{upower_0.99.5.bb => upower_0.99.7.bb}                                                                |    9 +-
 meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch                          |   31 -
 meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop                                                                    |    9 -
 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb                                                                          |   25 -
 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb                                                                          |   16 +
 .../recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch |    0
 {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch   |    0
 {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/build.patch                                                |    0
 {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch                       |    0
 {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/noconst.patch                                              |    0
 {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique_1.1.6.bb                                                   |    0
 meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.5.bb => xfce4-pulseaudio-plugin_0.4.0.bb}                    |    4 +-
 meta-xfce/recipes-xfce/exo/exo/configure.patch                                                                                       |   20 +-
 meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch                                                                                |   21 +-
 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch                                                                |    3 +-
 meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch                              |    5 +-
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb                                                                          |    6 +-
 96 files changed, 965 insertions(+), 6250 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.4.4.bb => network-manager-applet_1.8.10.bb} (73%)
 rename meta-gnome/recipes-extended/gparted/{gparted_0.30.0.bb => gparted_0.31.0.bb} (90%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.34.1.bb => gvfs_1.36.0.bb} (90%)
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui/0001-suppress-string-format-literal-warning-to-fix-build-.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui/05_fix_invalid_utf8.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui/gnome-stock-pixbufs.h
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui/no-pixbuf-csource.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
 delete mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
 create mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
 delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
 delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp1.6/sepbuildfix.patch
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp1.6_1.6.21.bb
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.21.bb => mpd_0.20.18.bb} (90%)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-check-for-strndupa-before-using-it.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fix-nm-version-macro-includes.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.4.4.bb => networkmanager_1.10.6.bb} (70%)
 delete mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb
 create mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.10.bb => libblockdev_2.16.bb} (73%)
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.14.bb => libgphoto2_2.5.16.bb} (92%)
 delete mode 100644 meta-oe/recipes-graphics/slim/slim/Makefile.oe
 delete mode 100644 meta-oe/recipes-graphics/slim/slim/slim-dynwm
 delete mode 100644 meta-oe/recipes-graphics/slim/slim/slim.pamd
 delete mode 100644 meta-oe/recipes-graphics/slim/slim/slim.service
 delete mode 100644 meta-oe/recipes-graphics/slim/slim/update_slim_wmlist
 delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.6.bb
 rename meta-oe/recipes-multimedia/libass/{libass.inc => libass_0.14.0.bb} (86%)
 rename meta-oe/recipes-support/hunspell/{hunspell_1.6.1.bb => hunspell_1.6.2.bb} (75%)
 delete mode 100644 meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch
 create mode 100644 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf/use.pkg-config.for.freetype2.patch
 create mode 100644 meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/automake_foreign.patch
 rename meta-oe/recipes-support/libsdl-ttf/{files => libsdl2-ttf}/use.pkg-config.for.freetype2.patch (83%)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
 create mode 100644 meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
 rename meta-oe/recipes-support/upower/{upower_0.99.5.bb => upower_0.99.7.bb} (86%)
 delete mode 100644 meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch
 delete mode 100644 meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop
 delete mode 100644 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
 create mode 100644 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/build.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/noconst.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique_1.1.6.bb (100%)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.5.bb => xfce4-pulseaudio-plugin_0.4.0.bb} (73%)

