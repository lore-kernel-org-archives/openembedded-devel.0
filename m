Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.48675.1591047931176516036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I5sOgJdk;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id c3so1271076wru.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x8ASGNT5qjaP28AhE+cTNULGk1lWJrmuZ6xgWxAoCE8=;
        b=I5sOgJdkB//NbFJfPGnfBYMvtsdKdGhCC1+gQdI4YAp7T73Jhj9oS2uFXZhXS/BYfc
         HHEm3xbfbql0nn7fen/b1GFYY8g1539OzF9NTvy1l59n7ExKto8BVGD6w4FmHVpst/11
         kNt+vHYnezASNyfWhCwKcO1EwU1MCd/ae4cMkisfAQqQdl4CBGpDUl6+xeC7rDhKhy8k
         ZXgTLiKWHfQh5ooJt+/uc+i1XFzBEOYhrw88WNmYjX4QWMx5/HwdnImfmn5YmDj6OPDr
         dz/G50o1eZf390kdy6kbkdfNJqgKqFlozpHUVzKmMdFrIzux1IZmZg5puznDVv+9Sij+
         B2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x8ASGNT5qjaP28AhE+cTNULGk1lWJrmuZ6xgWxAoCE8=;
        b=klEopTXeyLtQEsCw4qxtXZ6UPQLiRuKOJS7WIXahxa6oZZoQEvCiCKsnTmtWsCWrQ5
         yMl+bCNXVjVTDh1HApM302mrmBV/l1zonIN/3gWJaNBSWSzaMXupAMGLJ9iu69ukycZX
         RCi+c17ypBuPrDSBKnJmcxq+LWLWickd9BFZLCw+cgIYJM+QTgqM83btP4sKBrJBFwzJ
         13LZgkIx7lZMdP2WMfkNExSRG161cx9MF4Z6gTZRszfQgKfoRyRK3I7Vqnk6kJt397D+
         aR8PwoW1fIkHHxGynRY7/YWObWWXCFbHpXIEie84cAxH729y9Zrc0itIoPdCxpCTNUmv
         6H7A==
X-Gm-Message-State: AOAM5319OUSnLNI7S17ob1Mc5C6J1T4+fXIDQrDlcu1yIFnkI2PffQLU
	Xmd4p0p1zUwilOu2kwvLtgkhK73EJAw=
X-Google-Smtp-Source: ABdhPJzDEomozct1JA1gnHS11iL/Xu7a9LvPthR2KIGc0yTJwg26ZcH7d5VYdj5IJ2/vhCPOP9nv0A==
X-Received: by 2002:adf:9507:: with SMTP id 7mr23354239wrs.63.1591047929027;
        Mon, 01 Jun 2020 14:45:29 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:28 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/38] GNOME 3.36 first batch
Date: Mon,  1 Jun 2020 23:44:38 +0200
Message-Id: <20200601214516.26624-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Not yet upgraded:

* gjs/gnome-shell: Require mozjs68 - we do not not have it yet (and it is far
  from trivial)
* mutter: Prepared a building upgrade to 3.36 but gnome-shell 3.34 is not
  building with mutter 3.36

Andreas Müller (38):
  gfbgraph: initial add 0.2.4
  libgdata: Change PACKAGECONFIG defaults
  gnome-photos: initial add 3.34.2
  dconf: upgrade 0.34.0 -> 0.36.0
  dconf-editor: upgrade 3.34.2 -> 3.36.2
  nautilus: upgrade 3.34.3 -> 3.36.3
  evince: upgrade 3.34.2 -> 3.36.3
  evolution-data-server: upgrade 3.34.4 -> 3.36.3
  file-roller: upgrade 3.32.5 -> 3.36.2
  amtk: initial add 5.1.1
  uchardet: initial add 0.0.7
  tepl: initial add 4.4.0
  gedit: upgradde 3.34.1 -> 3.36.2
  gdm: upgrade 3.34.1 -> 3.36.2
  gnome-backgrounds: upgrade 3.34.0 -> 3.36.0
  gnome-calculator: upgrade 3.34.1 -> 3.36.0
  gnome-system-monitor: upgrade 3.32.1 -> 3.36.1
  gvfs: upgrade 1.42.2 -> 1.44.1
  gtksourceview4: upgrade 4.4.0 -> 4.6.0
  gnome-desktop3; upgrade 3.34.5 -> 3.36.2
  gnome-panel: upgrade 3.34.1 -> 3.36.1
  gnome-flashback: upgrade 3.34.2 -> 3.36.3
  gnome-keyring: upgrade 3.34.0 -> 3.36.0
  gnome-menus3: upgrade 3.32.0 -> 3.36.0
  gnome-online-accounts: upgrade 3.34.1 -> 3.36.0
  gnome-session: upgrade 3.34.2 -> 3.36.0
  gnome-settings-daemon: upgrade 3.34.2 -> 3.36.1
  gnome-terminal: upgrade 3.34.2 -> 3.36.2
  grilo: upgrade 0.3.10 0.3.12
  libgnomekbd: remove
  libgweather: upgrade 3.34.0 -> 3.36.0
  libwnck3: upgrade 3.32.0 -> 3.36.0
  metacity: upgrade 3.34.1 -> 3.36.1
  graphene: initial add 1.10.0
  yelp-xsl: upgrade 3.34.2 -> 3.36.0
  yelp: upgrade 3.34.0 -> 3.36.0
  sysprof: upgrade 3.34.1 -> 3.36.0
  gnome-control-center: upgrade 3.34.5 -> 3.36.2

 meta-gnome/recipes-gnome/amtk/amtk_5.1.1.bb   | 15 +++++
 ...ditor_3.34.2.bb => dconf-editor_3.36.2.bb} |  4 +-
 .../dconf/dconf/fix-meson-0.52.patch          | 25 --------
 .../{dconf_0.34.0.bb => dconf_0.36.0.bb}      |  6 +-
 ...002-add-a-formatting-attribute-check.patch | 29 ---------
 .../{evince_3.34.2.bb => evince_3.36.3.bb}    | 19 +++---
 .../evolution-data-server.inc                 |  6 +-
 ...roller_3.32.5.bb => file-roller_3.36.2.bb} |  4 +-
 .../gdm/{gdm_3.34.1.bb => gdm_3.36.2.bb}      |  4 +-
 .../{gedit_3.34.1.bb => gedit_3.36.2.bb}      | 14 ++---
 .../recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb  | 22 +++++++
 ..._3.34.0.bb => gnome-backgrounds_3.36.0.bb} |  4 +-
 ...r_3.34.1.bb => gnome-calculator_3.36.0.bb} |  4 +-
 ...001-Add-meson-option-to-pass-sysroot.patch |  2 +-
 ...34.5.bb => gnome-control-center_3.36.2.bb} |  4 +-
 ...op3_3.34.5.bb => gnome-desktop3_3.36.2.bb} |  4 +-
 ...ck_3.34.2.bb => gnome-flashback_3.36.3.bb} | 12 ++--
 ...ring_3.34.0.bb => gnome-keyring_3.36.0.bb} |  5 +-
 ...enus3_3.32.0.bb => gnome-menus3_3.36.0.bb} |  4 +-
 ...4.1.bb => gnome-online-accounts_3.36.0.bb} |  4 +-
 ...nd-ZONEINFO-it-tries-to-run-compiled.patch | 37 -----------
 ...-panel_3.34.1.bb => gnome-panel_3.36.1.bb} |  7 +--
 .../gnome-photos/gnome-photos_3.34.2.bb       | 36 +++++++++++
 ...sion_3.34.2.bb => gnome-session_3.36.0.bb} |  4 +-
 ...4.2.bb => gnome-settings-daemon_3.36.1.bb} |  4 +-
 ...32.1.bb => gnome-system-monitor_3.36.1.bb} |  4 +-
 ...nal_3.34.2.bb => gnome-terminal_3.36.2.bb} |  4 +-
 .../recipes-gnome/graphene/graphene_1.10.0.bb | 19 ++++++
 .../{grilo_0.3.10.bb => grilo_0.3.12.bb}      |  4 +-
 ...view4_4.4.0.bb => gtksourceview4_4.6.0.bb} |  6 +-
 .../gvfs/{gvfs_1.42.2.bb => gvfs_1.44.1.bb}   |  4 +-
 .../libgdata/libgdata_0.17.12.bb              |  3 +-
 .../libgnome/libgnomekbd_3.26.1.bb            | 14 -----
 ...eather_3.34.0.bb => libgweather_3.36.0.bb} |  4 +-
 ...{libwnck3_3.32.0.bb => libwnck3_3.36.0.bb} |  4 +-
 ...{metacity_3.34.1.bb => metacity_3.36.1.bb} |  4 +-
 ...{nautilus_3.34.3.bb => nautilus_3.36.3.bb} |  4 +-
 ...-Define-NT_GNU_BUILD_ID-if-undefined.patch |  0
 ...t-hardcode-linux-as-host_machine-.s.patch} |  2 +-
 ...E_FORMAT-instead-of-G_GUINT64_FORMAT.patch | 31 +++++++++
 .../sysprof/sysprof_3.36.0.bb}                | 39 +++++++-----
 meta-gnome/recipes-gnome/tepl/tepl_4.4.0.bb   | 17 +++++
 ...{yelp-xsl_3.34.2.bb => yelp-xsl_3.36.0.bb} |  4 +-
 .../yelp/{yelp_3.34.0.bb => yelp_3.36.0.bb}   |  4 +-
 ...rof-ui-Rename-environ-to-sys_environ.patch | 63 -------------------
 .../packagegroups/packagegroup-gnome-apps.bb  |  1 +
 .../uchardet/uchardet_0.0.7.bb                |  9 +++
 47 files changed, 254 insertions(+), 269 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/amtk/amtk_5.1.1.bb
 rename meta-gnome/recipes-gnome/dconf/{dconf-editor_3.34.2.bb => dconf-editor_3.36.2.bb} (67%)
 delete mode 100644 meta-gnome/recipes-gnome/dconf/dconf/fix-meson-0.52.patch
 rename meta-gnome/recipes-gnome/dconf/{dconf_0.34.0.bb => dconf_0.36.0.bb} (75%)
 rename meta-gnome/recipes-gnome/evince/{evince_3.34.2.bb => evince_3.36.3.bb} (73%)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_3.32.5.bb => file-roller_3.36.2.bb} (81%)
 rename meta-gnome/recipes-gnome/gdm/{gdm_3.34.1.bb => gdm_3.36.2.bb} (89%)
 rename meta-gnome/recipes-gnome/gedit/{gedit_3.34.1.bb => gedit_3.36.2.bb} (63%)
 create mode 100644 meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_3.34.0.bb => gnome-backgrounds_3.36.0.bb} (68%)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_3.34.1.bb => gnome-calculator_3.36.0.bb} (80%)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_3.34.5.bb => gnome-control-center_3.36.2.bb} (89%)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.34.5.bb => gnome-desktop3_3.36.2.bb} (88%)
 rename meta-gnome/recipes-gnome/gnome-flashback/{gnome-flashback_3.34.2.bb => gnome-flashback_3.36.3.bb} (72%)
 rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_3.34.0.bb => gnome-keyring_3.36.0.bb} (88%)
 rename meta-gnome/recipes-gnome/gnome-menus/{gnome-menus3_3.32.0.bb => gnome-menus3_3.36.0.bb} (75%)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-accounts_3.34.1.bb => gnome-online-accounts_3.36.0.bb} (88%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
 rename meta-gnome/recipes-gnome/gnome-panel/{gnome-panel_3.34.1.bb => gnome-panel_3.36.1.bb} (68%)
 create mode 100644 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_3.34.2.bb
 rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_3.34.2.bb => gnome-session_3.36.0.bb} (86%)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-daemon_3.34.2.bb => gnome-settings-daemon_3.36.1.bb} (91%)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_3.32.1.bb => gnome-system-monitor_3.36.1.bb} (81%)
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.34.2.bb => gnome-terminal_3.36.2.bb} (83%)
 create mode 100644 meta-gnome/recipes-gnome/graphene/graphene_1.10.0.bb
 rename meta-gnome/recipes-gnome/grilo/{grilo_0.3.10.bb => grilo_0.3.12.bb} (84%)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview4_4.4.0.bb => gtksourceview4_4.6.0.bb} (79%)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.42.2.bb => gvfs_1.44.1.bb} (95%)
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
 rename meta-gnome/recipes-gnome/libgweather/{libgweather_3.34.0.bb => libgweather_3.36.0.bb} (79%)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_3.32.0.bb => libwnck3_3.36.0.bb} (81%)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.34.1.bb => metacity_3.36.1.bb} (86%)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_3.34.3.bb => nautilus_3.36.3.bb} (85%)
 rename meta-gnome/{recipes-kernel/sysprof/files => recipes-gnome/sysprof/sysprof}/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch (100%)
 rename meta-gnome/{recipes-kernel/sysprof/files/0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch => recipes-gnome/sysprof/sysprof/0002-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch} (99%)
 create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0003-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch
 rename meta-gnome/{recipes-kernel/sysprof/sysprof_3.34.1.bb => recipes-gnome/sysprof/sysprof_3.36.0.bb} (50%)
 create mode 100644 meta-gnome/recipes-gnome/tepl/tepl_4.4.0.bb
 rename meta-gnome/recipes-gnome/yelp/{yelp-xsl_3.34.2.bb => yelp-xsl_3.36.0.bb} (77%)
 rename meta-gnome/recipes-gnome/yelp/{yelp_3.34.0.bb => yelp_3.36.0.bb} (80%)
 delete mode 100644 meta-gnome/recipes-kernel/sysprof/files/0001-libsysprof-ui-Rename-environ-to-sys_environ.patch
 create mode 100644 meta-oe/recipes-support/uchardet/uchardet_0.0.7.bb

-- 
2.21.3

