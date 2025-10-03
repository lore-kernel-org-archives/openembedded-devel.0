Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164A1CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 13:55:11 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.8114.1759499708012776364
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 06:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ktyobT0V;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso3969012a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759499706; x=1760104506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x4e0dx5IBqW67OFrJF2eJ7jtJxKTmQwOIOPNKfHxaoQ=;
        b=ktyobT0VBRIjoAmyfVtA+lHOqOaWiXnRHhM7mfZ7mz25IyxceyRrddVAQBK4Bxba1T
         5YYmuyd94P0PuBiaBYSXp2qOTbSnyA/I0qJXwMAWEt+uKMkYT/KE8TIrnybn6O+qsVRt
         mFEvgtBYwZxnn6dsltiTOZPnnECkDzSqwueUxMGoSkz32xOvTKmuPDK4v7nE0FywSFCn
         ApIob6mMKkZcXL7BqMrkSMIPeb/OU9KWPJLFfMtb8+FFofvEtlh3xx1Z2+lM8MmvolOb
         H6aK3KF31k3KfmAljGK8rRHSIBdXg9XMJbXiHu82LmbAevyZH5A0hp8jx4uFtbD2PU6L
         WGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759499706; x=1760104506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x4e0dx5IBqW67OFrJF2eJ7jtJxKTmQwOIOPNKfHxaoQ=;
        b=txN9uSHvNMHhv3jfXe38jdeOKVDT/wAc0uwOmPES9j1aT8lxhwVvCSilzM9HQEf5+1
         g6Q0vvbNHDMPIWRL74x5VtkNmkmqqInmLo7uh3jeUkLtzkaai8qTbf0C8FrZlufFpvSy
         Dm5rLyxkFil4Y2G6DxSHfnu7Vcqb6ZQb4495qPtUY51x2lAU5r2Mm558bm+KWiVa6jeC
         i6OvL7KCnLPIiWACLHFvxFe+JewGY9d6r9VMf9HioKeFVjpKob5U+v+HOD90dTrRaJN4
         pe/r04SbqZqsPVmuVa1N+TOEriB81wpQGF33KPTpPIGRkNG3vadlKTvs2MgdyvSzqZK2
         qRDg==
X-Gm-Message-State: AOJu0YwSLj2ZtMFtPES9sXXYx9vppBuVcIA87FY84vb1O6rx8PfesKwr
	cfGHksaxJRKx8xfeQUmyZJUrznHi8zSYIKpc80iMaANf7a0eb1VRrvZ8+XmDQw==
X-Gm-Gg: ASbGncsdI94mEFp41Bi7EBzM4D2oCYX2b2KJhrCT7OUohzR54HGJjWQnKVTz9f99wSR
	YPvXW7sXldtVKA/QNK/4YfYrzQmCxxxdxT8ZXtnFZS7mVeNNzll1UgjKuLYaHrkUI0dS82tVBz0
	RBNc5QZsPcRF4FuOMo7GqBbjoafLBrI+q98i16dbYQmdgsfiaSrWlwjrMYteaNuX27ZUpnhb06k
	SsAu9YMAKtMrThqv8jhQVakynFD+07cME2vVnerlNDAE34O5+5przOU7qt44/9Bf43d0Cesz1Dh
	h4FwzBhMnUETbNpSvSp28crIp/fTf87prubpV37ukoEOXtMMhjf0D68K9KArVY2nPNXn4GJxo4y
	hvC/HCeS8O14NQvWtzTBKaAlC3aWHx96xgL9NyA9eSjkKvaPxVSa0vEo=
X-Google-Smtp-Source: AGHT+IGCYzOQqArmYsgd8iakOzEIrpI4juDS3P1/1jiA4/dn4jZ+cb/dTsZ/Gbeq/eroMqxIAsjlbQ==
X-Received: by 2002:a05:6402:90d:b0:637:e619:3570 with SMTP id 4fb4d7f45d1cf-639348f142dmr3372140a12.14.1759499705763;
        Fri, 03 Oct 2025 06:55:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3aaf87sm4040005a12.4.2025.10.03.06.55.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 06:55:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Kirkstone Pull Request Oct 3rd
Date: Fri,  3 Oct 2025 15:55:03 +0200
Message-ID: <20251003135504.1121319-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 13:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120218

As most probably it was expected, this PR would contain more commits than
usual - it is a mixture of patches from the community, and cherry-picks from master branch:
mostly smaller recipes fixes (SRC_URI, R/DEPENDS, LICENSE corrections), 
CVE fixes, and minor recipe version updates.

These changes have been build tested successfully for arm, aarch64, x86 and x86-64 platforms,
using a world build.

Please let me know if you have any questions or comments.

Thank you.

--

The following changes since commit 5c138125018fef4b240e62b664a809d19f4b26a5:

  readme: update maintainer (2025-09-16 09:04:49 +0200)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut

for you to fetch changes up to 96fbc156364fd78530d2bfbe1b8a77789f52997d:

  collectd: set working SRC_URI (2025-10-02 15:16:50 +0200)

----------------------------------------------------------------
Alex Stewart (2):
      gvfs: stylize DEPENDS
      gvfs: obviate the ssh-client requirement for gvfs

Alex Yao (1):
      lcov: Fix Perl Path

Alexandre Truong (1):
      fb-test: include UPSTREAM_CHECK_COMMITS to fix UNKNOWN_BROKEN status

Alexandre Videgrain (1):
      openbox: fix crash on alt+tab with fullscreen app

AshishKumar Mishra (1):
      image_types_sparse: backport optionally remove RAW image

Bartosz Golaszewski (7):
      python3-nmap: add missing run-time dependencies
      python3-gsocketpool: add missing run-time dependencies
      python3-txws: add missing run-time dependencies
      python3-hpack: add missing run-time dependencies
      python3-thrift: add missing run-time dependencies
      python3-pyparted: add missing run-time dependencies
      python3-send2trash: add missing run-time dependencies

Benjamin Szőke (1):
      tree: fix broken links

Bergin, Peter (1):
      freediameter: fix typo and old overide syntax

Changqing Li (1):
      libtimezonemap: correct package version

Dan McGregor (1):
      dash: correct licence

Divya Chellam (1):
      krb5: fix CVE-2025-24528

Enguerrand de Ribaucourt (3):
      cukinia: upgrade 0.6.1 -> 0.6.2
      cukinia: inherit allarch
      cukinia: add libgpiod-tools to RRECOMMENDS

Etienne Cordonnier (1):
      fsverity-utils: fix SRC_URI

Fabio Estevam (1):
      multipath-tools: Use https for github

Gianfranco Costamagna (1):
      mosquitto: bump to 2.0.22

Gyorgy Sarvari (15):
      readme: update maintainer
      pm-qa: update git fetch protocol
      krb5: fix packaging with ldap PACKAGECONFIG
      fatresize: set correct LICENSE
      tokyocabinet: switch to working SRC_URI
      tokyocabinet: fix license
      ibus: missing installed file w/ gtk2 PACKAGECONFIG
      keybinder: set correct license
      libdvbcsa: set correct LICENSE
      znc: fix LICENSE value, clean up SRC_URI
      nmap: add missing dependency
      liboop: set correct LICENSE
      xfce4-sensors-plugin: correct netcat PACKAGECONFIG
      psqlodbc: set valid SRC_URI
      collectd: set working SRC_URI

Ivan Maidanski (1):
      bdwgc: Fix typo in EXTRA_OECONF and remove unneeded extra CFLAGS

Jiaying Song (3):
      libconfig: switch source to GitHub repository
      vlock: fix do_fetch error
      softhsm: switch source to GitHub repository

Jim Broadus (1):
      networkmanager: fix iptables and nft paths

Joe Slater (1):
      bats: use baselib

Julian Haller (1):
      openct: Fix typo in SUMMARY variable

Justin Bronder (1):
      tk: inherit pkgconfig

Kai Kang (2):
      fltk-native: fix libdl link issue
      libtimezonemap: rename downloaded file name

Katariina Lounento (1):
      libtar: patch CVEs

Khem Raj (20):
      augeas: Check for __GLIBC__ to use gnu extention for strerror_r
      ctapi-common: Point to working SRC_URI locations
      ctapi-common: Use archives.fedoraproject.org to fetch srpm
      hddtemp: Add missing prototype for ata_get_powermode in sata.c
      faenza-icon-theme: Switch to a valid download  location for SRC_URI
      libtimezonemap: Point to a working SRC_URI
      ibus: Point python interpreter to target location
      dracut: Do not undefine _FILE_OFFSET_BITS
      libdc1394: upgrade 2.2.6 -> 2.2.7
      libdvdcss: upgrade 1.4.2 -> 1.4.3
      libdvbpsi: upgrade 1.3.0 -> 1.3.3
      libmediaart-2.0: upgrade 1.9.5 -> 1.9.6
      dhcp-relay: Pass cross configure flags to bind build
      nfacct: Update SRC_URI to point to valid URL
      openflow: Include sys/stat.h for fchmod
      openflow: Switch SRC_URI to github mirror
      radiusclient-ng: Point SRC_URI to archive.ubuntu.com
      ssmping: Use debian mirror for SRC_URI
      debootstrap: Update SRC_URI to point to valid URL
      nicstat: Use SOURCEFORGE_MIRROR in SRC_URI

Lee Chee Yang (2):
      libsdl: fix CVE-2022-34568
      x11vnc: Fix CVE-2020-29074

Louis Rannou (1):
      mosquitto: bump to 2.0.21

Marcus Flyckt (1):
      python3-pyconnman: Add 'future' runtime dependency

Markus Volk (3):
      gvfs: fix polkit homedir
      gvfs: fix dependencies
      p8platform: unbreak do_populate_sdk

Martin Jansa (2):
      cukinia: drop allarch
      ne10: append +git instead of gitr+

Matthias Klein (3):
      paho-mqtt-c: upgrade 1.3.10 -> 1.3.11
      paho-mqtt-c: upgrade 1.3.11 -> 1.3.12
      paho-mqtt-c: upgrade 1.3.12 -> 1.3.13

Mingli Yu (15):
      gnulib: Update SRC_URI
      libnma: add opengl to REQUIRED_DISTRO_FEATURES
      network-manager-applet: add opengl to REQUIRED_DISTRO_FEATURES
      gnome-bluetooth: add opengl to REQUIRED_DISTRO_FEATURES
      gnome-desktop: add opengl to REQUIRED_DISTRO_FEATURES
      gtksourceview5: add opengl to REQUIRED_DISTRO_FEATURES
      evince: add opengl to REQUIRED_DISTRO_FEATURES
      gnome-calculator: add opengl to REQUIRED_DISTRO_FEATURES
      gnome-calendar: add opengl to REQUIRED_DISTRO_FEATURES
      gnome-font-viewer: add opengl to REQUIRED_DISTRO_FEATURES
      nautilus: add opengl to REQUIRED_DISTRO_FEATURES
      ibus: add opengl related check
      gssdp: check opengl is enabled or not
      dialog: Update the SRC_URI
      minicoredumper: correct the sysvinit service file attribute

Ninette Adhikari (1):
      procmail: Update status for CVE-1999-0475

Nitin Wankhade (2):
      iperf3: Fix CVE-2025-54350
      iperf3: Fix CVE-2025-54349

Peter Kjellerstedt (5):
      autossh: Correct the license information
      paho-mqtt-c: Improve the license information
      recipes: Remove double protocol= from SRC_URIs
      paho-mqtt-cpp: Improve the license information
      libjs-jquery-icheck: Correct LIC_FILES_CHKSUM

Peter Marko (15):
      cpputest: add possibility to build extensions
      opusfile: patch CVE-2022-47021
      audiofile: fix multiple CVEs
      audiofile: patch CVE-2017-6829
      audiofile: fix multiple CVEs
      audiofile: patch CVE-2017-6831
      audiofile: patch CVE-2017-6839
      libmad: ignore CVE-2017-11552 and CVE-2018-7263
      libmad: patch CVE-2017-8372 and CVE-2017-8373
      libmad: patch CVE-2017-8372 and CVE-2017-8373
      libtinyxml: patch CVE-2021-42260
      libtinyxml: patch CVE-2023-34194
      procmail: patch CVE-2014-3618
      procmail: patch CVE-2017-16844.
      synergy: patch CVE-2020-15117

Philip-Dylan Gleonec (1):
      cukinia: Fix license field

Philippe Coval (1):
      ot-br-posix: Add dep to ipset as used by firewall

Praveen Kumar (1):
      polkit: fix CVE-2025-7519

Randy MacLeod (4):
      ncftp: Upgrade to 3.2.7
      pimd: switch SRC_URI to https
      tnftp: switch the SRC_URI to https
      libmad: switch links/SRC_URI to https sites

Sean Anderson (2):
      image_types_sparse: backport fix pad source image to block size
      image_types_sparse: backport generate "don't care" chunks

Shubham Pushpkar (1):
      cjson 1.7.18: Fix CVE-2025-57052

Soumya Sambu (7):
      python3-twisted: Fix CVE-2024-41810
      python3-twisted: Fix CVE-2023-46137
      php: upgrade 8.1.31 -> 8.1.33
      iperf3: Fix CVE-2023-7250
      iperf3: Fix CVE-2024-26306
      iperf3: Fix CVE-2024-53580
      gtk+: Fix CVE-2024-6655

Sunil Dora (1):
      layer.conf: add bpftrace to NON_MULTILIB_RECIPES

Tim Orling (1):
      span-lite: do not inherit ptest

Wang Mingyu (25):
      cukinia: upgrade 0.6.0 -> 0.6.1
      avro-c: upgrade 1.11.1 -> 1.11.2
      cmark: upgrade 0.30.2 -> 0.30.3
      colord: upgrade 1.4.5 -> 1.4.6
      colord-native: upgrade 1.4.6 -> 1.4.7
      sshfs-fuse: upgrade 3.7.2 -> 3.7.3
      evolution-data-server: upgrade 3.44.1 -> 3.44.2
      gjs: upgrade 1.72.1 -> 1.72.2
      gnome-bluetooth: upgrade 42.2 -> 42.3
      gedit: upgrade 42.0 -> 42.1
      gvfs: upgrade 1.50.2 -> 1.50.3
      gvfs: upgrade 1.50.3 -> 1.50.4
      tracker: upgrade 3.3.2 -> 3.3.3
      colord-gtk: upgrade 0.3.0 -> 0.3.1
      pure-ftpd: upgrade 1.0.51 -> 1.0.52
      libnftnl: upgrade 1.2.3 -> 1.2.4
      libnftnl: upgrade 1.2.5 -> 1.2.6
      ndisc6: upgrade 1.0.6 -> 1.0.7
      ndisc6: upgrade 1.0.7 -> 1.0.8
      uftp: upgrade 5.0 -> 5.0.1
      uftp: upgrade 5.0.1 -> 5.0.2
      uftp: upgrade 5.0.2 -> 5.0.3
      iperf3: upgrade 3.14 -> 3.15
      flashrom: upgrade 1.2 -> 1.2.1
      smarty: upgrade 4.1.0 -> 4.1.1

Yi Zhao (12):
      fltk: upgrade 1.3.8 -> 1.3.9
      yaffs2-utils: update SRC_URI
      evince: fix typo for RRECOMMENDS
      grubby: fix syntax for ALTERNATIVE
      dhcp-relay: upgrade 4.4.3 -> 4.4.3-P1
      libnftnl: upgrade 1.2.2 -> 1.2.3
      libnftnl: upgrade 1.2.4 -> 1.2.5
      devecot: set dovecot.conf file mode with chmod
      lksctp-tools: upgrade 1.0.19 -> 1.0.20
      lksctp-tools: upgrade 1.0.20 -> 1.0.21
      libtdb: upgrade 1.4.3 -> 1.4.7
      libcrypt-openssl-guess-perl: fix syntax for PROVIDES

Yoann Congal (1):
      testfloat: update UPSTREAM_CHECK_* variables to fix devtool upgrades

Zhang Xiao (1):
      dhcp-relay: dev subpackage conflicts with bind-dev

alperak (5):
      catch2: upgrade 2.13.7 -> 2.13.10
      avro-c: upgrade 1.11.2 -> 1.11.3
      libupnp: upgrade 1.14.6 -> 1.14.18
      opencore-amr: upgrade 0.1.3 -> 0.1.6
      adcli: use https protocol for fetching

wangmy (15):
      avro-c: upgrade 1.11.0 -> 1.11.1
      evolution-data-server: upgrade 3.44.0 -> 3.44.1
      gjs: upgrade 1.72.0 -> 1.72.1
      gnome-bluetooth: upgrade 42.0 -> 42.1
      gnome-bluetooth: upgrade 42.1 -> 42.2
      evince: upgrade 42.2 -> 42.3
      gedit: upgrade 42.1 -> 42.2
      gnome-calculator: upgrade 42.0 -> 42.2
      gnome-commander: upgrade 1.14.2 -> 1.14.3
      gnome-text-editor: upgrade 42.1 -> 42.2
      gvfs: upgrade 1.50.0 -> 1.50.2
      zenity: upgrade 3.42.0 -> 3.42.1
      pure-ftpd: upgrade 1.0.50 -> 1.0.51
      libnftnl: upgrade 1.2.1 -> 1.2.2
      cifs-utils: upgrade 6.14 -> 6.15

zhengrq.fnst (2):
      gnome-text-editor: upgrade 42.0 -> 42.1
      yelp: upgrade 42.1 -> 42.2

zhengrq.fnst@fujitsu.com (1):
      yelp-tools: upgrade 42.0 -> 42.1

 README                                             |   1 +
 meta-filesystems/README                            |   1 +
 .../{sshfs-fuse_3.7.2.bb => sshfs-fuse_3.7.3.bb}   |   2 +-
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb |   3 +-
 .../recipes-utils/fatresize/fatresize_1.1.0.bb     |   2 +-
 meta-gnome/README                                  |   1 +
 .../recipes-connectivity/libnma/libnma_1.8.38.bb   |   2 +-
 .../network-manager-applet_1.26.0.bb               |   2 +-
 .../evince/{evince_42.2.bb => evince_42.3.bb}      |   8 +-
 .../evolution-data-server.inc                      |   4 +-
 .../faenza-icon-theme/faenza-icon-theme_1.3.bb     |   3 +-
 .../gedit/{gedit_42.0.bb => gedit_42.2.bb}         |   2 +-
 .../gjs/{gjs_1.72.0.bb => gjs_1.72.2.bb}           |   2 +-
 ...e-bluetooth_42.0.bb => gnome-bluetooth_42.3.bb} |   4 +-
 ...calculator_42.0.bb => gnome-calculator_42.2.bb} |   4 +-
 .../gnome-calendar/gnome-calendar_42.0.bb          |   2 +-
 ...mmander_1.14.2.bb => gnome-commander_1.14.3.bb} |   2 +-
 .../gnome-desktop/gnome-desktop_42.0.bb            |   2 +-
 .../gnome-font-viewer/gnome-font-viewer_42.0.bb    |   2 +-
 ...xt-editor_42.0.bb => gnome-text-editor_42.2.bb} |   2 +-
 .../gtksourceview/gtksourceview5_5.4.1.bb          |   1 +
 .../gvfs/{gvfs_1.50.0.bb => gvfs_1.50.4.bb}        |  22 +-
 .../0001-configure.ac-correct-the-version.patch    |  29 +
 .../libtimezonemap/libtimezonemap_0.4.6.bb         |   4 +-
 .../recipes-gnome/nautilus/nautilus_42.1.1.bb      |   2 +-
 .../tracker/{tracker_3.3.2.bb => tracker_3.3.3.bb} |   2 +-
 .../{yelp-tools_42.0.bb => yelp-tools_42.1.bb}     |   2 +-
 .../yelp/{yelp_42.1.bb => yelp_42.2.bb}            |   2 +-
 .../zenity/{zenity_3.42.0.bb => zenity_3.42.1.bb}  |   2 +-
 .../{colord-gtk_0.3.0.bb => colord-gtk_0.3.1.bb}   |   2 +-
 meta-gnome/recipes-support/ibus/ibus.bb            |   7 +-
 meta-gnome/recipes-support/ibus/ibus.inc           |   3 +
 .../recipes-support/keybinder/keybinder_3.0.bb     |   2 +-
 meta-initramfs/README                              |   2 +-
 ...01-install-Do-not-undef-_FILE_OFFSET_BITS.patch |  32 +
 .../recipes-devtools/dracut/dracut_056.bb          |   1 +
 .../recipes-devtools/grubby/grubby_git.bb          |   2 +-
 meta-multimedia/README                             |   1 +
 .../recipes-connectivity/gupnp/gssdp_1.4.0.1.bb    |   6 +-
 ...-pthread_mutexattr_gettype-pthread_mutexa.patch |  42 --
 .../{libupnp_1.14.6.bb => libupnp_1.14.18.bb}      |   3 +-
 .../{libdc1394_2.2.6.bb => libdc1394_2.2.7.bb}     |   3 +-
 .../libdvbcsa/libdvbcsa_1.1.0.bb                   |   2 +-
 .../{libdvbpsi_1.3.0.bb => libdvbpsi_1.3.3.bb}     |   3 +-
 ...opencore-amr_0.1.3.bb => opencore-amr_0.1.6.bb} |   6 +-
 .../opusfile/opusfile/CVE-2022-47021.patch         |  44 ++
 .../recipes-multimedia/opusfile/opusfile_0.12.bb   |   2 +
 .../vlc/{libdvdcss_1.4.2.bb => libdvdcss_1.4.3.bb} |   3 +-
 ...iaart-2.0_1.9.5.bb => libmediaart-2.0_1.9.6.bb} |   2 +-
 meta-networking/README                             |   2 +-
 .../recipes-connectivity/adcli/adcli_0.9.0.bb      |   2 +-
 .../recipes-connectivity/autossh/autossh_1.4g.bb   |   5 +-
 .../{dhcp-relay_4.4.3.bb => dhcp-relay_4.4.3p1.bb} |  20 +-
 .../dhcp/files/CVE-2022-2928.patch                 | 120 ---
 .../dhcp/files/CVE-2022-2929.patch                 |  40 -
 .../mosquitto/files/2895.patch                     |  17 +-
 .../{mosquitto_2.0.20.bb => mosquitto_2.0.22.bb}   |   2 +-
 .../networkmanager/networkmanager_1.36.2.bb        |   2 +
 .../openthread/ot-br-posix_git.bb                  |   2 +-
 .../ncftp/ncftp/ncftp-3.2.5-gcc10.patch            |  83 ---
 .../ncftp/{ncftp_3.2.6.bb => ncftp_3.2.7.bb}       |   8 +-
 ...coded-usr-local-includes-from-configure.a.patch |  15 +-
 .../pure-ftpd/pure-ftpd/nostrip.patch              |   7 +-
 .../{pure-ftpd_1.0.50.bb => pure-ftpd_1.0.52.bb}   |   4 +-
 ...ng-local-function-as-one-of-printf-family.patch | 650 ----------------
 .../0001-configure.ac-Add-serial-tests.patch       |   8 +-
 .../{libnftnl_1.2.1.bb => libnftnl_1.2.6.bb}       |  10 +-
 .../recipes-filter/nfacct/nfacct_1.0.2.bb          |   8 +-
 meta-networking/recipes-irc/znc/znc_1.8.2.bb       |  12 +-
 .../freediameter/freediameter_1.4.0.bb             |   2 +-
 .../recipes-protocols/openflow/openflow.inc        |   2 +-
 ...-Specify-export-dynamic-directly-to-linke.patch |  30 +
 ...socket-util-Include-sys-stat.h-for-fchmod.patch |  23 +
 .../recipes-protocols/openflow/openflow_git.bb     |   7 +-
 .../radiusclient-ng/radiusclient-ng_0.5.6.bb       |   3 +-
 .../{cifs-utils_6.14.bb => cifs-utils_6.15.bb}     |   7 +-
 .../cifs/files/CVE-2022-27239.patch                |  40 -
 .../cifs/files/CVE-2022-29869.patch                |  48 --
 .../recipes-support/dovecot/dovecot_2.3.14.bb      |   3 +-
 ...1-tdb-Add-configure-options-for-packages.patch} |  21 +-
 ...-Fix-pyext_PATTERN-for-cross-compilation.patch} |  10 +-
 ...0003-wscript-skip-checking-PYTHONHASHSEED.patch |  30 +
 .../libtdb/{libtdb_1.4.3.bb => libtdb_1.4.7.bb}    |  12 +-
 ...sctp-tools_1.0.19.bb => lksctp-tools_1.0.21.bb} |  12 +-
 .../ndisc6/{ndisc6_1.0.6.bb => ndisc6_1.0.8.bb}    |   2 +-
 meta-networking/recipes-support/pimd/pimd_2.3.2.bb |   3 +-
 .../recipes-support/ssmping/ssmping_0.9.1.bb       |   3 +-
 .../recipes-support/tnftp/tnftp_20210827.bb        |   2 +-
 .../uftp/{uftp_5.0.bb => uftp_5.0.3.bb}            |   2 +-
 .../recipes-support/unbound/unbound_1.15.0.bb      |   2 +-
 meta-oe/README                                     |   3 +-
 meta-oe/classes/image_types_sparse.bbclass         |  20 +-
 meta-oe/conf/layer.conf                            |   2 +-
 .../iperf3/iperf3/CVE-2024-26306.patch             | 218 ++++++
 .../iperf3/iperf3/CVE-2024-53580.patch             | 276 +++++++
 .../iperf3/iperf3/CVE-2025-54349.patch             |  56 ++
 .../iperf3/iperf3/CVE-2025-54350.patch             |  25 +
 .../iperf3/{iperf3_3.14.bb => iperf3_3.15.bb}      |   6 +-
 ...0001-typecast-enum-conversions-explicitly.patch |  45 --
 .../{flashrom_1.2.bb => flashrom_1.2.1.bb}         |   4 +-
 .../krb5/krb5/CVE-2025-24528.patch                 |  68 ++
 meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb   |   4 +-
 .../obex/obex-data-server_0.4.6.bb                 |   3 +-
 ...paho-mqtt-c_1.3.10.bb => paho-mqtt-c_1.3.13.bb} |   7 +-
 .../paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb           |   5 +-
 meta-oe/recipes-core/emlog/emlog.inc               |   2 +-
 meta-oe/recipes-core/mdbus2/mdbus2_git.bb          |   2 +-
 .../fsverity-utils/fsverity-utils_1.5.bb           |   2 +-
 .../recipes-dbs/psqlodbc/psqlodbc_09.05.0300.bb    |   2 +-
 ...plit-off-most-of-sparse_file_read_normal-.patch |  60 ++
 ...bsparse-Add-hole-mode-to-sparse_file_read.patch | 188 +++++
 ...d-support-for-converting-holes-to-don-t-c.patch | 114 +++
 .../android-tools/android-tools_5.1.1.r37.bb       |   3 +
 .../cjson/cjson/CVE-2025-57052.patch               |  33 +
 meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb     |   4 +-
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |   2 +-
 .../php/{php_8.1.31.bb => php_8.1.33.bb}           |   2 +-
 meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb        |   2 +-
 .../cmpi-bindings/cmpi-bindings_1.0.1.bb           |   2 +-
 .../recipes-extended/collectd/collectd_5.12.0.bb   |   2 +-
 .../recipes-extended/dialog/dialog_1.3-20210509.bb |   2 +-
 .../jpnevulator/jpnevulator_git.bb                 |   2 +-
 .../recipes-extended/libconfig/libconfig_1.7.3.bb  |  10 +-
 meta-oe/recipes-extended/mraa/mraa_git.bb          |   2 +-
 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb   |   2 +-
 .../recipes-extended/p8platform/p8platform_git.bb  |   2 +
 .../polkit/files/CVE-2025-7519.patch               |  34 +
 meta-oe/recipes-extended/polkit/polkit_0.119.bb    |   1 +
 meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb  |   2 +-
 meta-oe/recipes-extended/upm/upm_git.bb            |   2 +-
 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb      |   2 +-
 .../recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch    |  40 +
 meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb         |   1 +
 .../libsdl/libsdl-1.2.15/CVE-2022-34568.patch      |  28 +
 meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb   |   1 +
 ...list-traversal-issue-in-client_calc_layer.patch |  56 ++
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb  |   1 +
 .../recipes-graphics/renderdoc/renderdoc_1.13.bb   |   2 +-
 .../x11vnc/files/CVE-2020-29074.patch              |  27 +
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb   |   1 +
 .../minicoredumper/minicoredumper_2.0.1.bb         |   2 +-
 .../audiofile/audiofile_0.3.6.bb                   |   5 +
 ...4-Always-check-the-number-of-coefficients.patch |  45 ++
 ...x-values-to-fix-index-overflow-in-IMA.cpp.patch |  43 ++
 ...-for-multiplication-overflow-in-sfconvert.patch |  79 ++
 ...lly-fail-when-error-occurs-in-parseFormat.patch |  46 ++
 ...ultiplication-overflow-in-MSADPCM-decodeS.patch | 126 ++++
 .../libmad/CVE-2017-8372_CVE-2017-8373.patch       |  69 ++
 .../libmad/libmad/CVE-2017-8374.patch              | 830 +++++++++++++++++++++
 .../recipes-multimedia/libmad/libmad_0.15.1b.bb    |  12 +-
 meta-oe/recipes-security/nmap/nmap_7.80.bb         |   8 +-
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb  |   5 +-
 meta-oe/recipes-shells/dash/dash_0.5.11.5.bb       |   2 +-
 meta-oe/recipes-support/augeas/augeas.inc          |  33 -
 ...l-Use-__GLIBC__-to-check-for-GNU-extentio.patch |  34 +
 meta-oe/recipes-support/augeas/augeas_1.12.0.bb    |  34 +-
 .../avro/{avro-c_1.11.0.bb => avro-c_1.11.3.bb}    |   2 +-
 meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb       |   4 +-
 .../cmark/{cmark_0.30.2.bb => cmark_0.30.3.bb}     |   2 +-
 ...nction-cd_icc_create_from_edid-to-avoid-u.patch |   9 +-
 meta-oe/recipes-support/colord/colord.inc          |   4 +-
 .../ctapi-common/ctapi-common_1.1-14.bb            |   5 +-
 meta-oe/recipes-support/fltk/fltk-native.bb        |   5 +-
 meta-oe/recipes-support/fltk/fltk.inc              |   4 +-
 ...ces.cxx-do-not-use-dlopen-in-case-glibc-s.patch |   1 +
 .../fltk/fltk/fltk-native-link-libdl.patch         |  44 ++
 .../recipes-support/gnulib/gnulib_2018-12-18.bb    |   2 +-
 ...ata.c-Declare-ata_get_powermode-prototype.patch |  33 +
 .../recipes-support/hddtemp/hddtemp_0.3-beta15.bb  |   1 +
 meta-oe/recipes-support/lcov/lcov_1.14.bb          |   2 +-
 .../libjs/libjs-jquery-icheck_1.0.3.bb             |   2 +-
 meta-oe/recipes-support/liboop/liboop_1.0.1.bb     |   2 +-
 ...3-Fix-missing-prototype-compiler-warnings.patch |  53 ++
 ...004-Fix-invalid-memory-de-reference-issue.patch |  44 ++
 ...ile-descriptor-leaks-reported-by-cppcheck.patch | 101 +++
 .../0006-fix-memleak-on-tar_open-failure.patch     |  26 +
 ...007-fix-memleaks-in-libtar-sample-program.patch | 119 +++
 ...d-using-a-static-buffer-in-th_get_pathnam.patch |  89 +++
 ...Check-for-NULL-before-freeing-th_pathname.patch |  30 +
 ...Added-stdlib.h-for-malloc-in-lib-decode.c.patch |  26 +
 ...programming-mistakes-detected-by-static-a.patch | 100 +++
 .../libtar/files/CVE-2013-4420.patch               | 160 ++++
 ...-2021-33640-CVE-2021-33645-CVE-2021-33646.patch |  42 ++
 .../files/CVE-2021-33643-CVE-2021-33644.patch      |  52 ++
 meta-oe/recipes-support/libtar/libtar_1.2.20.bb    |  12 +
 .../libtinyxml/libtinyxml/CVE-2021-42260.patch     |  27 +
 .../libtinyxml/libtinyxml/CVE-2023-34194.patch     |  31 +
 .../recipes-support/libtinyxml/libtinyxml_2.6.2.bb |   5 +-
 .../multipath-tools/multipath-tools_0.8.4.bb       |   2 +-
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb         |   2 +-
 meta-oe/recipes-support/openct/openct_0.6.20.bb    |   2 +-
 .../procmail/procmail/CVE-2014-3618.patch          |  29 +
 .../procmail/procmail/CVE-2017-16844.patch         |  20 +
 meta-oe/recipes-support/procmail/procmail_3.22.bb  |   8 +-
 .../smarty/{smarty_4.1.0.bb => smarty_4.1.1.bb}    |   2 +-
 .../recipes-support/span-lite/span-lite_0.10.3.bb  |   1 -
 .../synergy/synergy/CVE-2020-15117.patch           |  48 ++
 meta-oe/recipes-support/synergy/synergy_git.bb     |   1 +
 .../tokyocabinet/tokyocabinet_1.4.48.bb            |   4 +-
 meta-oe/recipes-support/tree/tree_2.0.2.bb         |   4 +-
 meta-oe/recipes-test/bats/bats_1.6.1.bb            |   9 +-
 .../catch2/{catch2_2.13.7.bb => catch2_2.13.10.bb} |   2 +-
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb      |   4 +-
 .../cukinia/{cukinia_0.6.0.bb => cukinia_0.6.2.bb} |   6 +-
 meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb       |   3 +
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb            |   2 +-
 meta-oe/recipes-test/testfloat/testfloat_3e.bb     |   1 +
 meta-perl/README                                   |   2 +-
 .../libcrypt/libcrypt-openssl-guess-perl_0.15.bb   |   2 +-
 meta-python/README                                 |   1 +
 .../python3-gsocketpool_0.1.6.bb                   |   3 +-
 .../python-hpack/python3-hpack_4.0.0.bb            |   2 +
 .../python-pyconnman/python3-pyconnman_0.2.0.bb    |   2 +-
 .../python-thrift/python3-thrift_0.16.0.bb         |   1 +
 .../python-txws/python3-txws_0.9.1.bb              |   5 +
 .../python/python3-twisted/CVE-2023-46137.patch    | 196 +++++
 .../python/python3-twisted/CVE-2024-41810.patch    | 109 +++
 .../python/python3-twisted_22.2.0.bb               |   4 +-
 .../python-pyparted/python3-pyparted_3.12.0.bb     |   5 +-
 .../send2trash/python3-send2trash_1.8.0.bb         |   2 +
 meta-webserver/README                              |   2 +-
 meta-xfce/README                                   |   1 +
 .../sensors/xfce4-sensors-plugin_1.4.3.bb          |   2 +-
 223 files changed, 4475 insertions(+), 1372 deletions(-)
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_3.7.2.bb => sshfs-fuse_3.7.3.bb} (93%)
 rename meta-gnome/recipes-gnome/evince/{evince_42.2.bb => evince_42.3.bb} (80%)
 rename meta-gnome/recipes-gnome/gedit/{gedit_42.0.bb => gedit_42.2.bb} (91%)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.72.0.bb => gjs_1.72.2.bb} (92%)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.0.bb => gnome-bluetooth_42.3.bb} (87%)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_42.0.bb => gnome-calculator_42.2.bb} (83%)
 rename meta-gnome/recipes-gnome/gnome-commander/{gnome-commander_1.14.2.bb => gnome-commander_1.14.3.bb} (87%)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_42.0.bb => gnome-text-editor_42.2.bb} (84%)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.50.0.bb => gvfs_1.50.4.bb} (87%)
 create mode 100644 meta-gnome/recipes-gnome/libtimezonemap/files/0001-configure.ac-correct-the-version.patch
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.3.2.bb => tracker_3.3.3.bb} (93%)
 rename meta-gnome/recipes-gnome/yelp/{yelp-tools_42.0.bb => yelp-tools_42.1.bb} (83%)
 rename meta-gnome/recipes-gnome/yelp/{yelp_42.1.bb => yelp_42.2.bb} (88%)
 rename meta-gnome/recipes-gnome/zenity/{zenity_3.42.0.bb => zenity_3.42.1.bb} (88%)
 rename meta-gnome/recipes-support/colord-gtk/{colord-gtk_0.3.0.bb => colord-gtk_0.3.1.bb} (89%)
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.6.bb => libupnp_1.14.18.bb} (87%)
 rename meta-multimedia/recipes-multimedia/libdc1394/{libdc1394_2.2.6.bb => libdc1394_2.2.7.bb} (84%)
 rename meta-multimedia/recipes-multimedia/libdvbpsi/{libdvbpsi_1.3.0.bb => libdvbpsi_1.3.3.bb} (75%)
 rename meta-multimedia/recipes-multimedia/opencore-amr/{opencore-amr_0.1.3.bb => opencore-amr_0.1.6.bb} (59%)
 create mode 100644 meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch
 rename meta-multimedia/recipes-multimedia/vlc/{libdvdcss_1.4.2.bb => libdvdcss_1.4.3.bb} (76%)
 rename meta-multimedia/recipes-support/libmediaart/{libmediaart-2.0_1.9.5.bb => libmediaart-2.0_1.9.6.bb} (90%)
 rename meta-networking/recipes-connectivity/dhcp/{dhcp-relay_4.4.3.bb => dhcp-relay_4.4.3p1.bb} (78%)
 delete mode 100644 meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch
 delete mode 100644 meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.20.bb => mosquitto_2.0.22.bb} (97%)
 delete mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch
 rename meta-networking/recipes-daemons/ncftp/{ncftp_3.2.6.bb => ncftp_3.2.7.bb} (80%)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.50.bb => pure-ftpd_1.0.52.bb} (81%)
 delete mode 100644 meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.1.bb => libnftnl_1.2.6.bb} (89%)
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0001-socket-util-Include-sys-stat.h-for-fchmod.patch
 rename meta-networking/recipes-support/cifs/{cifs-utils_6.14.bb => cifs-utils_6.15.bb} (90%)
 delete mode 100644 meta-networking/recipes-support/cifs/files/CVE-2022-27239.patch
 delete mode 100644 meta-networking/recipes-support/cifs/files/CVE-2022-29869.patch
 rename meta-networking/recipes-support/libtdb/libtdb/{tdb-Add-configure-options-for-packages.patch => 0001-tdb-Add-configure-options-for-packages.patch} (93%)
 rename meta-networking/recipes-support/libtdb/libtdb/{0001-Fix-pyext_PATTERN-for-cross-compilation.patch => 0002-Fix-pyext_PATTERN-for-cross-compilation.patch} (83%)
 create mode 100644 meta-networking/recipes-support/libtdb/libtdb/0003-wscript-skip-checking-PYTHONHASHSEED.patch
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.3.bb => libtdb_1.4.7.bb} (78%)
 rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.19.bb => lksctp-tools_1.0.21.bb} (80%)
 rename meta-networking/recipes-support/ndisc6/{ndisc6_1.0.6.bb => ndisc6_1.0.8.bb} (98%)
 rename meta-networking/recipes-support/uftp/{uftp_5.0.bb => uftp_5.0.3.bb} (84%)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2024-26306.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2024-53580.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.14.bb => iperf3_3.15.bb} (84%)
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
 rename meta-oe/recipes-bsp/flashrom/{flashrom_1.2.bb => flashrom_1.2.1.bb} (79%)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-24528.patch
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.10.bb => paho-mqtt-c_1.3.13.bb} (75%)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patch
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
 rename meta-oe/recipes-devtools/php/{php_8.1.31.bb => php_8.1.33.bb} (99%)
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2025-7519.patch
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2022-34568.patch
 create mode 100644 meta-oe/recipes-graphics/openbox/files/0001-Fix-list-traversal-issue-in-client_calc_layer.patch
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8372_CVE-2017-8373.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8374.patch
 delete mode 100644 meta-oe/recipes-support/augeas/augeas.inc
 create mode 100644 meta-oe/recipes-support/augeas/augeas/0001-src-internal-Use-__GLIBC__-to-check-for-GNU-extentio.patch
 rename meta-oe/recipes-support/avro/{avro-c_1.11.0.bb => avro-c_1.11.3.bb} (88%)
 rename meta-oe/recipes-support/cmark/{cmark_0.30.2.bb => cmark_0.30.3.bb} (89%)
 create mode 100644 meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch
 create mode 100644 meta-oe/recipes-support/hddtemp/hddtemp/0001-sata.c-Declare-ata_get_powermode-prototype.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0003-Fix-missing-prototype-compiler-warnings.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0004-Fix-invalid-memory-de-reference-issue.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0005-fix-file-descriptor-leaks-reported-by-cppcheck.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0006-fix-memleak-on-tar_open-failure.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0007-fix-memleaks-in-libtar-sample-program.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0008-decode-avoid-using-a-static-buffer-in-th_get_pathnam.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0009-Check-for-NULL-before-freeing-th_pathname.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0010-Added-stdlib.h-for-malloc-in-lib-decode.c.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0011-libtar-fix-programming-mistakes-detected-by-static-a.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2013-4420.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33640-CVE-2021-33645-CVE-2021-33646.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33643-CVE-2021-33644.patch
 create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch
 create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
 rename meta-oe/recipes-support/smarty/{smarty_4.1.0.bb => smarty_4.1.1.bb} (94%)
 create mode 100644 meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch
 rename meta-oe/recipes-test/catch2/{catch2_2.13.7.bb => catch2_2.13.10.bb} (93%)
 rename meta-oe/recipes-test/cukinia/{cukinia_0.6.0.bb => cukinia_0.6.2.bb} (82%)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2023-46137.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch

