Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id F33FB7E391
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b18so4848173wrq.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U7XniA7JQVoo2DGWkm25K1ZxYAfNsKlp5b2YqSC1eF8=;
	b=Sopnivg32ULE5sTYO2UHPn4r2Ha35+GAUrNpwLEq5nQAcetSseL4y0RTAlfA1xNcLB
	iLCtmfiNUM5tzxfOgtDj793GzqdA45+5A6ry9PZZgLGOs74U9C3AoB9fmof+ueTmkTOy
	hOnfJulTxoRi7LhY2DTPyZcxxqgz2oukeVSDSIUaJFvVEfRc5RNwCFBhB1T4EViB2Zfj
	HokgmkaAbUzVsG+MM+tpj3k53wuWsTVrUOLoydA6Ff7KOWu5/RTRmIh5iB9i/4WB2gJA
	oU2HjRawJPhwlS5/6YlmM2hmMwk5dFjiZCZxOxJMwjRzYjadUmTOe2U14ZG/l6hZRYSH
	bzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U7XniA7JQVoo2DGWkm25K1ZxYAfNsKlp5b2YqSC1eF8=;
	b=tHIfYt/8ssHgC2Omi+ebI4fGGfXXzqXOgGk6q5uEpfkSaKZzeEoIM/nrzUT5N2Bd/7
	Nw1Idfh1FQM2GIHX976AchdylZm+7kqxM8UA6hHgGFj/e4gQlkjVzWa0gCtbWlsUlI5J
	lgkB2BiDlt0U29nYGTfsb+9rmlWuIidYn9fBg7yuUCE1Au3HdNJXL6fFq5itOgRQxqIW
	8q+QqH+ZMWlbZnK83UDF8bUVbePc9Wsry5Sd27ToXrX8+P/8rNoa97Hzqlrzxj1Ou1Wv
	nVxWoFdDN+WaWS1O0w640hUYY8LCiqGs79hcNTqNbpWCsMImiN4+VTpvSO//gOGklO0l
	geig==
X-Gm-Message-State: APjAAAXUgxd0G/ZooTUQHj6CcvRp++ad+sufji1/208NR7ZXF2lu+klM
	MQ8O3nSK/syT0VyLTbGZ4JccaInohio=
X-Google-Smtp-Source: APXvYqyJCl2pvFlL152TnskhZq399VcokUFWynbI/vGpZVv198gj4tHC/LjLKN8BEtq8pG/m6M3lgQ==
X-Received: by 2002:a5d:5506:: with SMTP id b6mr56183060wrv.221.1558594147187; 
	Wed, 22 May 2019 23:49:07 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:18 +0200
Message-Id: <20190523064859.24336-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 00/41] More GNOME & cleanups
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
X-List-Received-Date: Thu, 23 May 2019 06:49:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have more patches for GNOM in my WIP but remaining patches need more love.
To avoid nasty rebasing I have cherry-picked this series - hope I did not 
overlook some missing dependency or...

Andreas Müller (41):
  libstemmer: initial add
  appstream: initial add 0.12.6
  appstream-glib: initial add 0.7.15
  yelp-xsl: initial add 3.32.1
  yelp-tools: initial add 3.32.0
  yelp: initial add 3.32.1
  gnome-help.bbclass: Handle gnome-help files with new distro feature
    'helpfiles'
  evolution-data-server: uprade 3.26.6 -> 3.32.2 and rework
  gnome-menus3: upgrade 3.10.1 -> 3.32.0
  gnome-bluetooth: upgrade 3.18.2 -> 3.32.1
  glade3: upgrade 3.8.5 -> 3.8.6
  gnome-bluetooth: add upstream-version-is-even to inherit
  gtksourceview4: upgrade 4.2.0 -> 4.3.1
  gtksourceview3: upgrade 3.24.10 -> 3.24.11
  mousepad: move to gtk3
  network-manager-applet: port to meson build
  network-manager-applet: cleanup
  abiword: remove
  evince: upgrade 3.28.2 -> 3.32.0
  exiv2: initial add 0.27.0
  gexiv2: initial add 0.12.0
  gnome-autoar: inital add 0.2.3
  tracker: initial add 2.2.2
  nautilus: upgrade 3.18.5 -> 3.32.1
  ibus: initial add 1.5.20
  gnome-desktop3: upgrade 3.32.0 -> 3.32.2
  libgusb: initial add 0.3.0+
  colord: initial add 1.4.4
  colord-gtk: initial add 0.1.26
  itstool: upgrade 2.0.5 -> 2.0.6
  libwacom: initial add 0.33
  geocode-glib: initial add 3.26.1
  libgweather: initial add 3.32.1
  pinpoint: remove dead project
  libgnomekbd: cleanup
  libwnck: GNOME_COMPRESS_TYPE = "xz"
  rygel: remove GNOME_COMPRESS_TYPE = "xz"
  libmediaart(-2.0): remove GNOME_COMPRESS_TYPE = "xz"
  gvfs: upgrade 1.40.0 -> 1.40.1
  upower: upgrade 0.99.7 -> 0.99.10
  xserver-xorg-cvt-native: initial add 1.20.4

 meta-gnome/classes/gnome-help.bbclass         |  71 +++++++
 meta-gnome/conf/layer.conf                    |   3 +
 .../recipes-apps/pinpoint/pinpoint_git.bb     |  24 ---
 .../network-manager-applet_1.8.20.bb          |  34 +---
 ...1-Bug-13770-Require-C-11-from-now-on.patch | 180 ------------------
 .../recipes-gnome/abiword/abiword_3.0.2.bb    | 142 --------------
 ...nded-way-to-handle-the-icu-namespace.patch |  46 -----
 ...-format-attribute-to-_synctex_malloc.patch |  12 +-
 .../evince/0001-help-remove-YELP-macro.patch  |  24 ---
 ...vDocumentModel-get-type-function-dec.patch |  33 ----
 ...02-add-a-formatting-attribute-check.patch} |   0
 .../{evince_3.28.2.bb => evince_3.32.0.bb}    |  60 +++---
 .../evolution-data-server-native.bb           |  23 +++
 .../evolution-data-server.bb}                 | 123 +++---------
 .../evolution-data-server.inc                 |  16 ++
 ...keLists.txt-Remove-TRY_RUN-for-iconv.patch |  24 ++-
 ...txt-remove-CHECK_C_SOURCE_RUNS-check.patch |   0
 ...the-Novell-sample-contact-with-somet.patch |   0
 ...abi-from-the-default-C-warning-flags.patch |  29 +++
 .../0005-call-native-helpers.patch            |  45 +++++
 .../evolution-data-server/iconv-detect.h      |   0
 .../geocode-glib/geocode-glib_3.26.1.bb       |  20 ++
 .../recipes-gnome/gexiv2/gexiv2_0.12.0.bb     |  21 ++
 .../gnome-autoar/gnome-autoar_0.2.3.bb        |  18 ++
 ...th_3.18.2.bb => gnome-bluetooth_3.32.1.bb} |  14 +-
 ...op3_3.32.0.bb => gnome-desktop3_3.32.2.bb} |  10 +-
 ...enus3_3.10.1.bb => gnome-menus3_3.32.0.bb} |  11 +-
 ...3_3.24.10.bb => gtksourceview3_3.24.11.bb} |   6 +-
 ...view4_4.2.0.bb => gtksourceview4_4.3.1.bb} |  13 +-
 .../gvfs/{gvfs_1.40.0.bb => gvfs_1.40.1.bb}   |  12 +-
 .../libgnomekbd_3.26.1.bb                     |   9 +-
 .../libgweather/libgweather_3.32.1.bb         |  24 +++
 .../recipes-gnome/libwnck/libwnck_2.31.0.bb   |   1 -
 ...ome-desktop-thumbnail-API-with-new-g.patch |  40 ----
 .../recipes-gnome/nautilus/nautilus_3.18.5.bb |  33 ----
 .../recipes-gnome/nautilus/nautilus_3.32.1.bb |  32 ++++
 .../recipes-gnome/tracker/tracker_2.2.2.bb    |  51 +++++
 .../recipes-gnome/yelp/yelp-tools_3.32.0.bb   |  21 ++
 .../recipes-gnome/yelp/yelp-xsl_3.32.1.bb     |  18 ++
 meta-gnome/recipes-gnome/yelp/yelp_3.32.1.bb  |  37 ++++
 .../appstream-glib/appstream-glib_0.7.15.bb   |  37 ++++
 .../colord-gtk/colord-gtk_0.1.26.bb           |  19 ++
 .../recipes-support/ibus/ibus-native.bb       |  28 +++
 meta-gnome/recipes-support/ibus/ibus.bb       |  28 +++
 meta-gnome/recipes-support/ibus/ibus.inc      |  33 ++++
 ...start-dbus-we-do-not-have-dbus-lauch.patch |  39 ++++
 .../libstemmer/0001-Build-so-lib.patch        |  63 ++++++
 .../libstemmer/libstemmer_0.0.0.bb            |  46 +++++
 .../recipes-support/libwacom/libwacom_0.33.bb |  14 ++
 .../rygel/rygel_0.37.0.bb                     |   1 -
 .../libmediaart/libmediaart.inc               |   2 -
 .../0001-Do-not-use-host-include-path.patch   |  51 +++--
 .../appstream/appstream_0.12.6.bb             |  41 ++++
 .../recipes-support/colord/colord-native.bb   |  64 +++++++
 ...n-cd_icc_create_from_edid-to-avoid-u.patch | 166 ++++++++++++++++
 .../colord/colord-native/Makefile             |  48 +++++
 meta-oe/recipes-support/colord/colord.bb      |  42 ++++
 meta-oe/recipes-support/colord/colord.inc     |  13 ++
 ...Run-native-cd_idt8-cd_create_profile.patch |  59 ++++++
 meta-oe/recipes-support/exiv2/exiv2.bb        |  26 +++
 ...es-only-installed-with-the-exiv2-app.patch |  41 ++++
 ...nings-about-missing-PDB-files-in-3rd.patch |  64 +++++++
 ...-to-exiv2-xmp-to-avoid-name-conflict.patch |  82 ++++++++
 ...nstall-header-files-without-globbing.patch | 111 +++++++++++
 ...t-installation-dir-for-generated-doc.patch |  28 +++
 ...t-installation-dir-for-cmake-config-.patch | 124 ++++++++++++
 ...psdk-Build-with-DBanAllEntityUsage-1.patch |  34 ++++
 ...compile-warnings-in-ExpatAdapter.cpp.patch |  31 +++
 ...e-for-being-compatible-with-more-dis.patch |  27 +++
 ...ate-install-exiv2ConfigVersion.cmake.patch |  50 +++++
 ...on-fault-bug-introduced-with-version.patch |  33 ++++
 .../{itstool_2.0.5.bb => itstool_2.0.6.bb}    |   9 +-
 .../recipes-support/libgusb/libgusb_git.bb    |  12 ++
 ...everity-of-unhandled-action-messages.patch |  31 ---
 .../{upower_0.99.7.bb => upower_0.99.10.bb}   |  16 +-
 .../xserver-xorg-cvt-native_1.20.4.bb         |  43 +++++
 .../recipes-apps/mousepad/mousepad_0.4.1.bb   |   5 +-
 .../{glade3_3.8.5.bb => glade3_3.8.6.bb}      |  21 +-
 78 files changed, 2038 insertions(+), 824 deletions(-)
 create mode 100644 meta-gnome/classes/gnome-help.bbclass
 delete mode 100644 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/0001-Bug-13770-Require-C-11-from-now-on.patch
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
 rename meta-gnome/recipes-gnome/evince/evince/{0001-add-a-formatting-attribute-check.patch => 0002-add-a-formatting-attribute-check.patch} (100%)
 rename meta-gnome/recipes-gnome/evince/{evince_3.28.2.bb => evince_3.32.0.bb} (32%)
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb
 rename meta-gnome/recipes-gnome/{eds/evolution-data-server_3.26.6.bb => evolution-data-server/evolution-data-server.bb} (15%)
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
 rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch (59%)
 rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch (100%)
 rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch (100%)
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-I-94-Remove-Wabi-from-the-default-C-warning-flags.patch
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-call-native-helpers.patch
 rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/iconv-detect.h (100%)
 create mode 100644 meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_3.18.2.bb => gnome-bluetooth_3.32.1.bb} (48%)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.32.0.bb => gnome-desktop3_3.32.2.bb} (69%)
 rename meta-gnome/recipes-gnome/gnome-menus/{gnome-menus3_3.10.1.bb => gnome-menus3_3.32.0.bb} (41%)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview3_3.24.10.bb => gtksourceview3_3.24.11.bb} (75%)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview4_4.2.0.bb => gtksourceview4_4.3.1.bb} (65%)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.40.0.bb => gvfs_1.40.1.bb} (87%)
 rename meta-gnome/recipes-gnome/{libgnome => libgnomekbd}/libgnomekbd_3.26.1.bb (63%)
 create mode 100644 meta-gnome/recipes-gnome/libgweather/libgweather_3.32.1.bb
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
 create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.32.1.bb
 create mode 100644 meta-gnome/recipes-gnome/tracker/tracker_2.2.2.bb
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.0.bb
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp-xsl_3.32.1.bb
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp_3.32.1.bb
 create mode 100644 meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.15.bb
 create mode 100644 meta-gnome/recipes-support/colord-gtk/colord-gtk_0.1.26.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus-native.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus.inc
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
 create mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
 create mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer_0.0.0.bb
 create mode 100644 meta-gnome/recipes-support/libwacom/libwacom_0.33.bb
 rename meta-gnome/recipes-gnome/abiword/abiword/0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch => meta-oe/recipes-support/appstream/appstream/0001-Do-not-use-host-include-path.patch (10%)
 create mode 100644 meta-oe/recipes-support/appstream/appstream_0.12.6.bb
 create mode 100644 meta-oe/recipes-support/colord/colord-native.bb
 create mode 100644 meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
 create mode 100644 meta-oe/recipes-support/colord/colord-native/Makefile
 create mode 100644 meta-oe/recipes-support/colord/colord.bb
 create mode 100644 meta-oe/recipes-support/colord/colord.inc
 create mode 100644 meta-oe/recipes-support/colord/colord/0001-Run-native-cd_idt8-cd_create_profile.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2.bb
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-cmake-man-pages-only-installed-with-the-exiv2-app.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0002-cmake-ignore-warnings-about-missing-PDB-files-in-3rd.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0003-cmake-Rename-xmp-to-exiv2-xmp-to-avoid-name-conflict.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0004-cmake-Install-header-files-without-globbing.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0005-cmake-Use-correct-installation-dir-for-generated-doc.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0006-cmake-Use-correct-installation-dir-for-cmake-config-.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0007-xmpsdk-Build-with-DBanAllEntityUsage-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0008-xmpsdk-Fix-compile-warnings-in-ExpatAdapter.cpp.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0009-Fixes-in-.pc-file-for-being-compatible-with-more-dis.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0010-create-install-exiv2ConfigVersion.cmake.patch
 create mode 100644 meta-oe/recipes-support/itstool/itstool/0001-Fix-a-segmentation-fault-bug-introduced-with-version.patch
 rename meta-oe/recipes-support/itstool/{itstool_2.0.5.bb => itstool_2.0.6.bb} (70%)
 create mode 100644 meta-oe/recipes-support/libgusb/libgusb_git.bb
 delete mode 100644 meta-oe/recipes-support/upower/upower/0001-linux-lower-severity-of-unhandled-action-messages.patch
 rename meta-oe/recipes-support/upower/{upower_0.99.7.bb => upower_0.99.10.bb} (73%)
 create mode 100644 meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.4.bb
 rename meta-xfce/recipes-devtools/glade/{glade3_3.8.5.bb => glade3_3.8.6.bb} (42%)

-- 
2.20.1


