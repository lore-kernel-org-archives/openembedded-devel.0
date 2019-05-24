Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 45AA67E464
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 04:07:53 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id g9so4467272pfo.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 21:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XY/jk5jNPOH2Qf9wE4OrDtgIbd/9snICK1o4DZSu43s=;
	b=hRqx3vOzL2x9vgd3TVsCysjlJc//5Zopdej/qgGMUr8BAHd4iWJg4lZHurtBg/X6KP
	AizqiFp16BL8+OKbeE4npuKBXxUk/gkMFLPOYNMFii3HbHvE3CqCMM45PqfNRq0MMsPe
	bPeURZQsUs7agNIRwWAX9tAOXWL3Sijt+nz6ENZE27tyRkOo6Wb/ly2Rbx1fgemkdP6o
	zJDZ/iDa2d8b6o72+7qfyTXLU+7KaH2Cdn+5xQ6nhTy0wT4AZzo8W4dxCKZUYlVGb5U6
	U88x9n3OmN4z6qILQVUW6YrKkFs1mGv/sksuzyqpHgZBAsdf6OSmF9VgyNRLRZr/tNFS
	TalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=XY/jk5jNPOH2Qf9wE4OrDtgIbd/9snICK1o4DZSu43s=;
	b=B9PRk/hJAev5f9Nt5QprBwoC6U2Ashxx57dR+vKiSlOws4ySjGQupfouy7zA0bFAbp
	JFgys9jvRvf1PIWf1NVIZ1xamDgAuL9VMhKStiX3r+kH+My/Lf06FsBlWSdSXr9H/sXI
	fxNTQB/MLxl7tN8DPZVlOuxwvF4m4QEHExpxQvz6OW9jStrJDlA0oylwKtVjz3aC0Iyb
	D2xUmkqqnQr77qVFECW15c6YG+IlNk5eF7ahly7TXWEKxd1EW0qwALrd5I2f3/06KYwc
	UyghHSldiWPJ7X+hD7So/zzg/LyfasSoZHzeqP8pqUbEDUAK+ZP1Hq6CD6zfx+sY1ksI
	pTBw==
X-Gm-Message-State: APjAAAUjZXrwosE6gppqC8tCcM/Z9oangjCMxt09Hn0cL+Yp6WO2TiEa
	2vRR2HADK56I6qW0Tijqv5pCmBddfNM=
X-Google-Smtp-Source: APXvYqziUjHe1dS4mueXm0/G27Fq7NVuLZHz5aQCuM0D/8RC0U0+jHM7jznnRcXRZBnUpaO2GH0oPw==
X-Received: by 2002:a63:1c4:: with SMTP id 187mr75726302pgb.317.1558670873557; 
	Thu, 23 May 2019 21:07:53 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:313d:8ef2:9687:9b74])
	by smtp.gmail.com with ESMTPSA id
	o66sm946470pfb.184.2019.05.23.21.07.52
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 21:07:53 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8008aa3c-b117-c46c-aa1c-618a8c1a504d@gmail.com>
Date: Thu, 23 May 2019 21:07:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
Subject: Re: [PATCH 00/41] More GNOME & cleanups
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
X-List-Received-Date: Fri, 24 May 2019 04:07:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Andreas

This is good stuff, I wanted to stage it for some CI but the series
does not apply cleanly over master-next. If you can send a v2 of whole 
series rebased on master-next that will be super cool

Thanks
-Khem

On 5/22/19 11:48 PM, Andreas Müller wrote:
> Have more patches for GNOM in my WIP but remaining patches need more love.
> To avoid nasty rebasing I have cherry-picked this series - hope I did not
> overlook some missing dependency or...
> 
> Andreas Müller (41):
>    libstemmer: initial add
>    appstream: initial add 0.12.6
>    appstream-glib: initial add 0.7.15
>    yelp-xsl: initial add 3.32.1
>    yelp-tools: initial add 3.32.0
>    yelp: initial add 3.32.1
>    gnome-help.bbclass: Handle gnome-help files with new distro feature
>      'helpfiles'
>    evolution-data-server: uprade 3.26.6 -> 3.32.2 and rework
>    gnome-menus3: upgrade 3.10.1 -> 3.32.0
>    gnome-bluetooth: upgrade 3.18.2 -> 3.32.1
>    glade3: upgrade 3.8.5 -> 3.8.6
>    gnome-bluetooth: add upstream-version-is-even to inherit
>    gtksourceview4: upgrade 4.2.0 -> 4.3.1
>    gtksourceview3: upgrade 3.24.10 -> 3.24.11
>    mousepad: move to gtk3
>    network-manager-applet: port to meson build
>    network-manager-applet: cleanup
>    abiword: remove
>    evince: upgrade 3.28.2 -> 3.32.0
>    exiv2: initial add 0.27.0
>    gexiv2: initial add 0.12.0
>    gnome-autoar: inital add 0.2.3
>    tracker: initial add 2.2.2
>    nautilus: upgrade 3.18.5 -> 3.32.1
>    ibus: initial add 1.5.20
>    gnome-desktop3: upgrade 3.32.0 -> 3.32.2
>    libgusb: initial add 0.3.0+
>    colord: initial add 1.4.4
>    colord-gtk: initial add 0.1.26
>    itstool: upgrade 2.0.5 -> 2.0.6
>    libwacom: initial add 0.33
>    geocode-glib: initial add 3.26.1
>    libgweather: initial add 3.32.1
>    pinpoint: remove dead project
>    libgnomekbd: cleanup
>    libwnck: GNOME_COMPRESS_TYPE = "xz"
>    rygel: remove GNOME_COMPRESS_TYPE = "xz"
>    libmediaart(-2.0): remove GNOME_COMPRESS_TYPE = "xz"
>    gvfs: upgrade 1.40.0 -> 1.40.1
>    upower: upgrade 0.99.7 -> 0.99.10
>    xserver-xorg-cvt-native: initial add 1.20.4
> 
>   meta-gnome/classes/gnome-help.bbclass         |  71 +++++++
>   meta-gnome/conf/layer.conf                    |   3 +
>   .../recipes-apps/pinpoint/pinpoint_git.bb     |  24 ---
>   .../network-manager-applet_1.8.20.bb          |  34 +---
>   ...1-Bug-13770-Require-C-11-from-now-on.patch | 180 ------------------
>   .../recipes-gnome/abiword/abiword_3.0.2.bb    | 142 --------------
>   ...nded-way-to-handle-the-icu-namespace.patch |  46 -----
>   ...-format-attribute-to-_synctex_malloc.patch |  12 +-
>   .../evince/0001-help-remove-YELP-macro.patch  |  24 ---
>   ...vDocumentModel-get-type-function-dec.patch |  33 ----
>   ...02-add-a-formatting-attribute-check.patch} |   0
>   .../{evince_3.28.2.bb => evince_3.32.0.bb}    |  60 +++---
>   .../evolution-data-server-native.bb           |  23 +++
>   .../evolution-data-server.bb}                 | 123 +++---------
>   .../evolution-data-server.inc                 |  16 ++
>   ...keLists.txt-Remove-TRY_RUN-for-iconv.patch |  24 ++-
>   ...txt-remove-CHECK_C_SOURCE_RUNS-check.patch |   0
>   ...the-Novell-sample-contact-with-somet.patch |   0
>   ...abi-from-the-default-C-warning-flags.patch |  29 +++
>   .../0005-call-native-helpers.patch            |  45 +++++
>   .../evolution-data-server/iconv-detect.h      |   0
>   .../geocode-glib/geocode-glib_3.26.1.bb       |  20 ++
>   .../recipes-gnome/gexiv2/gexiv2_0.12.0.bb     |  21 ++
>   .../gnome-autoar/gnome-autoar_0.2.3.bb        |  18 ++
>   ...th_3.18.2.bb => gnome-bluetooth_3.32.1.bb} |  14 +-
>   ...op3_3.32.0.bb => gnome-desktop3_3.32.2.bb} |  10 +-
>   ...enus3_3.10.1.bb => gnome-menus3_3.32.0.bb} |  11 +-
>   ...3_3.24.10.bb => gtksourceview3_3.24.11.bb} |   6 +-
>   ...view4_4.2.0.bb => gtksourceview4_4.3.1.bb} |  13 +-
>   .../gvfs/{gvfs_1.40.0.bb => gvfs_1.40.1.bb}   |  12 +-
>   .../libgnomekbd_3.26.1.bb                     |   9 +-
>   .../libgweather/libgweather_3.32.1.bb         |  24 +++
>   .../recipes-gnome/libwnck/libwnck_2.31.0.bb   |   1 -
>   ...ome-desktop-thumbnail-API-with-new-g.patch |  40 ----
>   .../recipes-gnome/nautilus/nautilus_3.18.5.bb |  33 ----
>   .../recipes-gnome/nautilus/nautilus_3.32.1.bb |  32 ++++
>   .../recipes-gnome/tracker/tracker_2.2.2.bb    |  51 +++++
>   .../recipes-gnome/yelp/yelp-tools_3.32.0.bb   |  21 ++
>   .../recipes-gnome/yelp/yelp-xsl_3.32.1.bb     |  18 ++
>   meta-gnome/recipes-gnome/yelp/yelp_3.32.1.bb  |  37 ++++
>   .../appstream-glib/appstream-glib_0.7.15.bb   |  37 ++++
>   .../colord-gtk/colord-gtk_0.1.26.bb           |  19 ++
>   .../recipes-support/ibus/ibus-native.bb       |  28 +++
>   meta-gnome/recipes-support/ibus/ibus.bb       |  28 +++
>   meta-gnome/recipes-support/ibus/ibus.inc      |  33 ++++
>   ...start-dbus-we-do-not-have-dbus-lauch.patch |  39 ++++
>   .../libstemmer/0001-Build-so-lib.patch        |  63 ++++++
>   .../libstemmer/libstemmer_0.0.0.bb            |  46 +++++
>   .../recipes-support/libwacom/libwacom_0.33.bb |  14 ++
>   .../rygel/rygel_0.37.0.bb                     |   1 -
>   .../libmediaart/libmediaart.inc               |   2 -
>   .../0001-Do-not-use-host-include-path.patch   |  51 +++--
>   .../appstream/appstream_0.12.6.bb             |  41 ++++
>   .../recipes-support/colord/colord-native.bb   |  64 +++++++
>   ...n-cd_icc_create_from_edid-to-avoid-u.patch | 166 ++++++++++++++++
>   .../colord/colord-native/Makefile             |  48 +++++
>   meta-oe/recipes-support/colord/colord.bb      |  42 ++++
>   meta-oe/recipes-support/colord/colord.inc     |  13 ++
>   ...Run-native-cd_idt8-cd_create_profile.patch |  59 ++++++
>   meta-oe/recipes-support/exiv2/exiv2.bb        |  26 +++
>   ...es-only-installed-with-the-exiv2-app.patch |  41 ++++
>   ...nings-about-missing-PDB-files-in-3rd.patch |  64 +++++++
>   ...-to-exiv2-xmp-to-avoid-name-conflict.patch |  82 ++++++++
>   ...nstall-header-files-without-globbing.patch | 111 +++++++++++
>   ...t-installation-dir-for-generated-doc.patch |  28 +++
>   ...t-installation-dir-for-cmake-config-.patch | 124 ++++++++++++
>   ...psdk-Build-with-DBanAllEntityUsage-1.patch |  34 ++++
>   ...compile-warnings-in-ExpatAdapter.cpp.patch |  31 +++
>   ...e-for-being-compatible-with-more-dis.patch |  27 +++
>   ...ate-install-exiv2ConfigVersion.cmake.patch |  50 +++++
>   ...on-fault-bug-introduced-with-version.patch |  33 ++++
>   .../{itstool_2.0.5.bb => itstool_2.0.6.bb}    |   9 +-
>   .../recipes-support/libgusb/libgusb_git.bb    |  12 ++
>   ...everity-of-unhandled-action-messages.patch |  31 ---
>   .../{upower_0.99.7.bb => upower_0.99.10.bb}   |  16 +-
>   .../xserver-xorg-cvt-native_1.20.4.bb         |  43 +++++
>   .../recipes-apps/mousepad/mousepad_0.4.1.bb   |   5 +-
>   .../{glade3_3.8.5.bb => glade3_3.8.6.bb}      |  21 +-
>   78 files changed, 2038 insertions(+), 824 deletions(-)
>   create mode 100644 meta-gnome/classes/gnome-help.bbclass
>   delete mode 100644 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
>   delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/0001-Bug-13770-Require-C-11-from-now-on.patch
>   delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
>   delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
>   delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch
>   delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
>   rename meta-gnome/recipes-gnome/evince/evince/{0001-add-a-formatting-attribute-check.patch => 0002-add-a-formatting-attribute-check.patch} (100%)
>   rename meta-gnome/recipes-gnome/evince/{evince_3.28.2.bb => evince_3.32.0.bb} (32%)
>   create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server-native.bb
>   rename meta-gnome/recipes-gnome/{eds/evolution-data-server_3.26.6.bb => evolution-data-server/evolution-data-server.bb} (15%)
>   create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
>   rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch (59%)
>   rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch (100%)
>   rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch (100%)
>   create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-I-94-Remove-Wabi-from-the-default-C-warning-flags.patch
>   create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-call-native-helpers.patch
>   rename meta-gnome/recipes-gnome/{eds => evolution-data-server}/evolution-data-server/iconv-detect.h (100%)
>   create mode 100644 meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
>   create mode 100644 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb
>   create mode 100644 meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb
>   rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_3.18.2.bb => gnome-bluetooth_3.32.1.bb} (48%)
>   rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.32.0.bb => gnome-desktop3_3.32.2.bb} (69%)
>   rename meta-gnome/recipes-gnome/gnome-menus/{gnome-menus3_3.10.1.bb => gnome-menus3_3.32.0.bb} (41%)
>   rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview3_3.24.10.bb => gtksourceview3_3.24.11.bb} (75%)
>   rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview4_4.2.0.bb => gtksourceview4_4.3.1.bb} (65%)
>   rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.40.0.bb => gvfs_1.40.1.bb} (87%)
>   rename meta-gnome/recipes-gnome/{libgnome => libgnomekbd}/libgnomekbd_3.26.1.bb (63%)
>   create mode 100644 meta-gnome/recipes-gnome/libgweather/libgweather_3.32.1.bb
>   delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch
>   delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
>   create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.32.1.bb
>   create mode 100644 meta-gnome/recipes-gnome/tracker/tracker_2.2.2.bb
>   create mode 100644 meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.0.bb
>   create mode 100644 meta-gnome/recipes-gnome/yelp/yelp-xsl_3.32.1.bb
>   create mode 100644 meta-gnome/recipes-gnome/yelp/yelp_3.32.1.bb
>   create mode 100644 meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.15.bb
>   create mode 100644 meta-gnome/recipes-support/colord-gtk/colord-gtk_0.1.26.bb
>   create mode 100644 meta-gnome/recipes-support/ibus/ibus-native.bb
>   create mode 100644 meta-gnome/recipes-support/ibus/ibus.bb
>   create mode 100644 meta-gnome/recipes-support/ibus/ibus.inc
>   create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
>   create mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
>   create mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer_0.0.0.bb
>   create mode 100644 meta-gnome/recipes-support/libwacom/libwacom_0.33.bb
>   rename meta-gnome/recipes-gnome/abiword/abiword/0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch => meta-oe/recipes-support/appstream/appstream/0001-Do-not-use-host-include-path.patch (10%)
>   create mode 100644 meta-oe/recipes-support/appstream/appstream_0.12.6.bb
>   create mode 100644 meta-oe/recipes-support/colord/colord-native.bb
>   create mode 100644 meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
>   create mode 100644 meta-oe/recipes-support/colord/colord-native/Makefile
>   create mode 100644 meta-oe/recipes-support/colord/colord.bb
>   create mode 100644 meta-oe/recipes-support/colord/colord.inc
>   create mode 100644 meta-oe/recipes-support/colord/colord/0001-Run-native-cd_idt8-cd_create_profile.patch
>   create mode 100644 meta-oe/recipes-support/exiv2/exiv2.bb
>   create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-cmake-man-pages-only-installed-with-the-exiv2-app.patch
>   create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0002-cmake-ignore-warnings-about-missing-PDB-files-in-3rd.patch
>   create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0003-cmake-Rename-xmp-to-exiv2-xmp-to-avoid-name-conflict.patch
>   create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0004-cmake-Install-header-files-without-globbing.patch
>   create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0005-cmake-Use-correct-installation-dir-for-generated-doc.patch
>   create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0006-cmake-Use-correct-installation-dir-for-cmake-config-.patch
>   create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0007-xmpsdk-Build-with-DBanAllEntityUsage-1.patch
>   create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0008-xmpsdk-Fix-compile-warnings-in-ExpatAdapter.cpp.patch
>   create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0009-Fixes-in-.pc-file-for-being-compatible-with-more-dis.patch
>   create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0010-create-install-exiv2ConfigVersion.cmake.patch
>   create mode 100644 meta-oe/recipes-support/itstool/itstool/0001-Fix-a-segmentation-fault-bug-introduced-with-version.patch
>   rename meta-oe/recipes-support/itstool/{itstool_2.0.5.bb => itstool_2.0.6.bb} (70%)
>   create mode 100644 meta-oe/recipes-support/libgusb/libgusb_git.bb
>   delete mode 100644 meta-oe/recipes-support/upower/upower/0001-linux-lower-severity-of-unhandled-action-messages.patch
>   rename meta-oe/recipes-support/upower/{upower_0.99.7.bb => upower_0.99.10.bb} (73%)
>   create mode 100644 meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.4.bb
>   rename meta-xfce/recipes-devtools/glade/{glade3_3.8.5.bb => glade3_3.8.6.bb} (42%)
> 

