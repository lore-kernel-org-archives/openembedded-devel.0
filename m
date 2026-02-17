Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF8DE83856
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 06:54:44 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7092.1771311275835799955
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 22:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b1FpEIEI;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43638a33157so3738705f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 22:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771311274; x=1771916074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oV5R6fj5xbLg3RDWMIfXVald4fOH8X8hi4mFr/6cCMo=;
        b=b1FpEIEIA/Q1XZK1K1o4cSzE8JwObQgBOj4wL3y9iyDjMAc4ualJP1E2/9jv2NZ8qm
         35eI7JHtEUZG52irBWRDAFW8EdNk639FvTNqVF1XBgPuomTV9cmUxxzvX47RZbe491I5
         IDcqiTMOXHFsNaBasuKsFARDyjgUsW2KBa90bDsXrvcliuAg7BT9GJ5uKO442UPtJdCa
         ANj8iWQQcr9RL/yHbYGtbB4iX/W01pCntbz9frtzf5mJgnMcfLPZs85jlhLpw0/3+i9A
         DsRSSuSChbfT12cMmw7Fir6lTjk4TkvZNJph97U5bOysE4iVWXp2wGFsUSM3TnAs/c1Q
         8ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771311274; x=1771916074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oV5R6fj5xbLg3RDWMIfXVald4fOH8X8hi4mFr/6cCMo=;
        b=IHDY690PVirvh7DRGYkjD7zIUhKhOYUgzItlwBKDDSmJcNzJHkR0CMgWjFB05fEZE+
         EHI4Pd3s8bTzIQTuE9qxd2W5Pe9+BLh785lG8taRF2EexVYgAMbCQnInzSKHucd+3kPK
         ohzvf/pV/OQfkWxnLHeOKgynutntyqSUNd6GBFgtMw9h8WYyo4bv7zlVEpWEigWhDpjG
         nMjJ+yyMFdJ3wF59TedviE8l9NJbuhttu/6TPrhmZrLr6UFIjcQmBy/lBRLZhRhX1u53
         0qUgTjmOAvjdeJDk2ZULMZVz4NGKiz+T//f4LOtER4ievpXy4j+tpUSeicnEpQYAzqNo
         kE2Q==
X-Gm-Message-State: AOJu0YzUeH+RF4aIM5M2a7Eut33ZZqDfzpzFm4c5SnJGjlDIWnSg75/G
	BTPm1aHrVOXZQ723N5SoegLZB0QNbeEFe0I/OCSNkVEN0OF05uI8HQir9Qn81w==
X-Gm-Gg: AZuq6aITJXCxdx0aD1K1p339ZUOry3g60JWhOroTaEr3v/mXsg6om7t28SYKDGQkScb
	vHKvhLGh0dMCPgPpww0oY5Wcttv+OyFxSBKHLXclB4fhLltJnoUp5vGWSc8x/LXQW9Idnz9MFJX
	3zWxra8+sbWGUiHwIcebYFCNQFAiy6bc9MUwlAH8n6tw8qZEbKThu9LTJKYCuVm7gDeHQNQJ+Og
	96O8O9x2Anez69HIqg8oic61svcwYhRvIwHxvxHqxwHJ3fCe4ukrm+5c/7Z1u+/IYgD0M/o2pko
	piMf0qF0/NaO1ia4BRq1oHLciKqZdAg28y5P5M35fNUdFsp6qP2f8MGaiF0s2nOEhfo9VY2Ef4H
	KMv+4p1rv6T6l+RZgWQDQ5C5pBxge87fnOo40b69c+7ETN1Ks0ha3D7VJch7WoFsh2zHk51X2Jg
	FzSikS97Tl1AK4iZG8I72b
X-Received: by 2002:a05:6000:290b:b0:42b:38b1:e32e with SMTP id ffacd0b85a97d-4379792bf61mr27116569f8f.46.1771311273834;
        Mon, 16 Feb 2026 22:54:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abd259sm34121328f8f.24.2026.02.16.22.54.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:54:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Kirkstone pull request Feb 17th
Date: Tue, 17 Feb 2026 07:54:32 +0100
Message-ID: <20260217065432.3205412-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 06:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124439

Today's Kirkstone PR brings many CVE fixes, and a handful of recipe upgrades. Thank you to all contributors.

Artifacts:
World build qemuarm: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21994661881
World build qemuarm64: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21996250526
World build qemux86: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/22012443626
World build qemux86-64: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/22017019379
YP layer compability: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21993845066
Ptest execution (logs available at the link): https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/22034966536

Just as last time, there is a failing test in python3-django_2.2.28 - that is expected keep happening
in Kirkstone, unless it gets fixed by someone.

If you have any questions or comments, please ping me.

===

The following changes since commit 8f5f5cf4b335a09313c48394c62bfb614868fc1e:

  python3-django: (4.2.27) add back setuptools3 support (2026-01-19 15:24:39 +0100)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut

for you to fetch changes up to 46287c44c1755df1c3d0289cdaa7a3972b091d65:

  poppler: mark CVE-2022-38171 patched (2026-02-13 17:04:32 +0100)

----------------------------------------------------------------
Ankur Tyagi (1):
      influxdb: ignore CVE-2024-30896

Gyorgy Sarvari (90):
      raptor2: patch CVE-2017-18926
      raptor2: patch CVE-2020-25713
      raptor2: patch CVE-2024-57822
      raptor2: patch CVE-2024-57823
      squid: upgrade 4.15 -> 4.17
      python3-eventlet: upgrade 0.33.0 -> 0.33.3
      python3-eventlet: patch CVE-2025-58068
      python3-ldap: patch CVE-2025-61911
      python3-ldap: patch CVE-2025-61912
      python3-werkzeug: ignore CVE-2026-21860
      python3-twisted: patch CVE-2022-24801
      python3-blivet: upgrade 3.4.3 -> 3.4.4
      openvpn: ignore CVE-2024-4877 and CVE-2025-13751
      fluidsynth: patch CVE-2025-56225
      boinc-client: mark CVE-2013-2018 patched
      freerdp: patch CVE-2022-24883
      freerdp: patch CVE-2022-39282
      freerdp: mark CVE-2022-39317 patched
      freerdp: patch CVE-2022-39320
      freerdp: patch CVE-2023-39350
      freerdp: patch CVE-2023-39351
      freerdp: patch CVE-2023-39352
      freerdp: patch CVE-2023-39353
      freerdp: patch CVE-2023-40181
      freerdp: patch CVE-2023-40569
      freerdp: add ptest support
      freerdp: patch CVE-2023-40589
      freerdp: patch CVE-2024-22211
      freerdp: patch CVE-2024-32039
      freerdp: patch CVE-2024-32040
      freerdp: mark CVE-2024-32041 patched
      freerdp: patch CVE-2024-32458
      freerdp: patch CVE-2024-32459
      freerdp: patch CVE-2024-32460
      freerdp: patch CVE-2024-32658
      python3-paramiko: upgrade 2.10.3 -> 2.10.6
      yelp: patch CVE-2025-3155
      tracker-miners: update 3.2.1 -> 3.2.2
      mutter: upgrade 42.0 -> 42.9
      evince: upgrade 42.3 -> 42.4
      gjs: upgrade 1.72.2 -> 1.72.4
      gnome-bluetooth: upgrade 42.3 -> 42.8
      gnome-control-center: upgrade 42.0 -> 42.10
      gnome-desktop: upgrade 42.0 -> 42.10
      gnome-settings-daemon: upgrade 42.1 -> 42.2
      gnome-shell-extensions: upgrade 42.0 -> 42.3
      gnome-shell: upgrade 42.0 -> 42.9
      gnome-terminal: upgrade 3.42.2 -> 3.42.3
      gnome-tweaks: upgrade 40.0 -> 40.10
      gtk4: upgrade 4.6.2 -> 4.6.9
      gtksourceview4: upgrade 4.8.2 -> 4.8.4
      gtksourceview5: upgrade 5.4.1 -> 5.4.2
      gtk4: fix qa error with gstreamer PACKAGECONFIG
      gvfs: upgrade 1.50.4 -> 1.50.7
      libadwaita: upgrade 1.1.1 -> 1.1.7
      nautilus: upgrade 42.1.1 -> 42.6
      catfish: upgrade 4.16.3 -> 4.16.4
      libvncserver: patch CVE-2020-29260
      proftpd: ignore CVE-2021-47865
      python3-twitter: mark CVE-2012-5825 patched
      gpsd: patch CVE-2025-67268
      gnome-settings-daemon: ignore CVE-2024-38394
      frr: ignore CVE-2023-3748, CVE-2023-41359..61
      libass: patch CVE-2020-24994
      python3-ecdsa: ignore CVE-2024-23342
      libiec61850: patch CVE-2024-45969
      libiec61850: patch CVE-2024-45970
      python3-pymongo: patch CVE-2024-5629
      faad2: patch CVE-2021-32276
      sox: patch CVE-2017-11332
      sox: patch CVE-2017-11358
      sox: patch CVE-2017-11359
      sox: patch CVE-2017-15370
      sox: patch CVE-2017-15371
      sox: patch CVE-2017-15372
      sox: patch CVE-2017-15642
      sox: patch CVE-2017-18189
      sox: mark CVE-2019-1010004 as patched
      sox: patch CVE-2019-13590
      sox: patch CVE-2019-8354
      tigervnc: sync xserver component with oe-core
      tigervnc: ignore CVE-2023-6377
      tigervnc: ignore CVE-2023-6478
      tigervnc: ignore CVE-2025-26594...26601
      tigervnc: mark CVE-2024-0408 and CVE-2024-0409 patched
      ez-ipupdate: patch CVE-2003-0887
      libeml: patch CVE-2015-8791
      mercurial: ignore CVE-2022-43410
      python3-django: upgrade 4.2.27 -> 4.2.28
      poppler: mark CVE-2022-38171 patched

Jackson (1):
      tcpreplay 4.4.4: Fix CVE-2025-9384

Jason Schonberg (1):
      Use https when accessing archive.xfce.org

Peter Marko (1):
      python3-protobuf: patch CVE-2026-0994

Rohini Sangam (1):
      strongswan: Security fix for CVE-2025-62291

Vijay Anusuri (1):
      mariadb: Fix CVE-2025-30693

Wang Mingyu (4):
      python3-bidict: upgrade 0.22.0 -> 0.22.1
      python3-smpplib: upgrade 2.2.1 -> 2.2.2
      python3-smpplib: upgrade 2.2.2 -> 2.2.3
      sanlock: upgrade 3.8.4 -> 3.8.5

Xu Huan (2):
      python3-werkzeug: upgrade 2.1.1 -> 2.1.2
      python3-croniter: upgrade 1.3.4 -> 1.3.5

wangmy (1):
      python3-croniter: upgrade 1.3.5 -> 1.3.7

zhengruoqin (1):
      python3-pymongo: upgrade 4.1.0 -> 4.1.1

 .../evince/{evince_42.3.bb => evince_42.4.bb}      |    2 +-
 .../gjs/{gjs_1.72.2.bb => gjs_1.72.4.bb}           |    2 +-
 ...e-bluetooth_42.3.bb => gnome-bluetooth_42.8.bb} |    2 +-
 ...enter_42.0.bb => gnome-control-center_42.10.bb} |    2 +-
 ...nome-desktop_42.0.bb => gnome-desktop_42.10.bb} |    2 +-
 ...aemon_42.1.bb => gnome-settings-daemon_42.2.bb} |    5 +-
 ...ions_42.0.bb => gnome-shell-extensions_42.3.bb} |    2 +-
 .../{gnome-shell_42.0.bb => gnome-shell_42.9.bb}   |    2 +-
 ...terminal_3.42.2.bb => gnome-terminal_3.42.3.bb} |    2 +-
 ...002-meson-fix-invalid-positional-argument.patch |   33 -
 ...{gnome-tweaks_40.0.bb => gnome-tweaks_40.10.bb} |    3 +-
 .../gtk4/{gtk4_4.6.2.bb => gtk4_4.6.9.bb}          |    3 +-
 ...ourceview4_4.8.2.bb => gtksourceview4_4.8.4.bb} |    2 +-
 ...ourceview5_5.4.1.bb => gtksourceview5_5.4.2.bb} |    2 +-
 .../gvfs/{gvfs_1.50.4.bb => gvfs_1.50.7.bb}        |    2 +-
 .../{libadwaita_1.1.1.bb => libadwaita_1.1.7.bb}   |    2 +-
 .../mutter/{mutter_42.0.bb => mutter_42.9.bb}      |    2 +-
 .../{nautilus_42.1.1.bb => nautilus_42.6.bb}       |    2 +-
 ...ker-miners_3.2.1.bb => tracker-miners_3.2.2.bb} |    2 +-
 .../recipes-gnome/yelp/yelp/CVE-2025-3155.patch    |  119 +++
 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb         |    1 +
 .../libebml/libebml/CVE-2015-8791.patch            |   29 +
 .../recipes-mkv/libebml/libebml_1.3.0.bb           |   10 +-
 .../recipes-multimedia/fluidsynth/fluidsynth.inc   |    4 +-
 .../fluidsynth/fluidsynth/CVE-2025-56225.patch     |   25 +
 .../sox/sox/CVE-2017-11332.patch                   |   28 +
 .../sox/sox/CVE-2017-11358.patch                   |   29 +
 .../sox/sox/CVE-2017-11359.patch                   |   30 +
 .../sox/sox/CVE-2017-15370.patch                   |   29 +
 .../sox/sox/CVE-2017-15371.patch                   |   40 +
 .../sox/sox/CVE-2017-15372.patch                   |  100 ++
 .../sox/sox/CVE-2017-15642.patch                   |   35 +
 .../sox/sox/CVE-2017-18189.patch                   |   34 +
 .../sox/sox/CVE-2019-13590.patch                   |   34 +
 .../recipes-multimedia/sox/sox/CVE-2019-8354.patch |   29 +
 .../recipes-multimedia/sox/sox_14.4.2.bb           |   10 +
 .../ez-ipupdate/ez-ipupdate_3.0.11b7.bb            |    7 +
 .../ez-ipupdate/files/CVE-2003-0887.patch          |  158 +++
 .../libiec61850/files/CVE-2024-45969.patch         |   31 +
 .../libiec61850/files/CVE-2024-45970.patch         |   71 ++
 .../libiec61850/libiec61850_1.5.1.bb               |    4 +-
 .../recipes-daemons/proftpd/proftpd_1.3.7c.bb      |    3 +
 .../squid/{squid_4.15.bb => squid_4.17.bb}         |    2 +-
 .../python/python3-ldap/CVE-2025-61911.patch       |   41 +
 .../python/python3-ldap/CVE-2025-61912.patch       |   42 +
 .../recipes-devtools/python/python3-ldap_3.4.0.bb  |    2 +
 meta-networking/recipes-protocols/frr/frr_8.2.2.bb |    9 +
 .../recipes-support/openvpn/openvpn_2.5.11.bb      |    4 +-
 .../strongswan/files/CVE-2025-62291.patch          |   49 +
 .../strongswan/strongswan_5.9.13.bb                |    1 +
 .../tcpreplay/tcpreplay/CVE-2025-9384.patch        |   38 +
 .../recipes-support/tcpreplay/tcpreplay_4.4.4.bb   |    1 +
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb    |    2 +
 meta-oe/recipes-dbs/mysql/mariadb.inc              |    1 +
 .../recipes-dbs/mysql/mariadb/CVE-2025-30693.patch |  156 +++
 .../recipes-devtools/mercurial/mercurial_6.1.bb    |    2 +
 .../recipes-extended/boinc/boinc-client_7.18.1.bb  |    4 +
 .../sanlock/sanlock/setuptools.patch               |   18 -
 .../sanlock/{sanlock_3.8.4.bb => sanlock_3.8.5.bb} |    3 +-
 .../libvncserver/libvncserver/CVE-2020-29260.patch |   28 +
 .../libvncserver/libvncserver_0.9.13.bb            |    4 +-
 ...n.h-Increase-supported-Xorg-version-to-1..patch |   29 +
 ...001-xserver21.1.1.patch-Add-Xorg-21-patch.patch |   95 ++
 .../tigervnc/files/0001-xvnc-adapt-for-1.21.patch  |   46 +
 .../recipes-graphics/tigervnc/tigervnc_1.11.0.bb   |   38 +-
 .../faad2/faad2/CVE-2021-32276-1.patch             |   83 ++
 .../faad2/faad2/CVE-2021-32276-2.patch             |   36 +
 meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb    |    2 +
 .../libass/libass/CVE-2020-24994.patch             |   48 +
 meta-oe/recipes-multimedia/libass/libass_0.14.0.bb |    4 +-
 .../gpsd/gpsd/CVE-2025-67268.patch                 |   97 ++
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb     |    1 +
 .../freerdp/freerdp/CVE-2022-24883.patch           |  102 ++
 .../freerdp/freerdp/CVE-2022-39282.patch           |   38 +
 .../freerdp/freerdp/CVE-2022-39316.patch           |    2 +-
 .../freerdp/freerdp/CVE-2022-39320.patch           |   33 +
 .../freerdp/freerdp/CVE-2023-39350.patch           |   42 +
 .../freerdp/freerdp/CVE-2023-39351.patch           |   30 +
 .../freerdp/freerdp/CVE-2023-39352.patch           |  124 +++
 .../freerdp/freerdp/CVE-2023-39353.patch           |   53 +
 .../freerdp/freerdp/CVE-2023-40181.patch           |   33 +
 .../freerdp/freerdp/CVE-2023-40569.patch           |   38 +
 .../freerdp/freerdp/CVE-2023-40589.patch           |  319 ++++++
 .../freerdp/freerdp/CVE-2024-22211.patch           |   36 +
 .../freerdp/freerdp/CVE-2024-32039.patch           |   78 ++
 .../freerdp/freerdp/CVE-2024-32040.patch           |   30 +
 .../freerdp/freerdp/CVE-2024-32458.patch           |  118 +++
 .../freerdp/freerdp/CVE-2024-32459.patch           |   31 +
 .../freerdp/freerdp/CVE-2024-32460.patch           | 1030 ++++++++++++++++++++
 .../freerdp/freerdp/CVE-2024-32658.patch           |   36 +
 meta-oe/recipes-support/freerdp/freerdp/run-ptest  |   66 ++
 meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb   |   49 +-
 ...0001-JBIG2Stream-Fix-crash-on-broken-file.patch |    2 +-
 .../raptor2/files/CVE-2017-18926.patch             |   44 +
 .../raptor2/files/CVE-2020-25713.patch             |   33 +
 .../raptor2/files/CVE-2024-57822.patch             |   42 +
 .../raptor2/files/CVE-2024-57823.patch             |   29 +
 meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb  |   11 +-
 ...3-bidict_0.22.0.bb => python3-bidict_0.22.1.bb} |    2 +-
 ...croniter_1.3.4.bb => python3-croniter_1.3.7.bb} |    2 +-
 .../0001-add-back-setuptools-support.patch         |    0
 ...3-django_4.2.27.bb => python3-django_4.2.28.bb} |    2 +-
 .../python/python3-ecdsa_0.17.0.bb                 |    3 +
 .../python/python3-eventlet/CVE-2025-58068.patch   |   41 +
 ...entlet_0.33.0.bb => python3-eventlet_0.33.3.bb} |    3 +-
 ...ramiko_2.10.3.bb => python3-paramiko_2.10.6.bb} |    2 +-
 .../python/python3-protobuf/CVE-2026-0994.patch    |   47 +
 .../python/python3-protobuf_3.20.3.bb              |    1 +
 .../python/python3-pymongo/CVE-2024-5629.patch     |   49 +
 ...3-pymongo_4.1.0.bb => python3-pymongo_4.1.1.bb} |    3 +-
 ...3-smpplib_2.2.1.bb => python3-smpplib_2.2.3.bb} |    2 +-
 .../python/python3-twisted/CVE-2022-24801-1.patch  |  132 +++
 .../python/python3-twisted/CVE-2022-24801-2.patch  |   63 ++
 .../python/python3-twisted/CVE-2022-24801-3.patch  |   25 +
 .../python/python3-twisted/CVE-2022-24801-4.patch  |   25 +
 .../python/python3-twisted/CVE-2022-24801-5.patch  |   71 ++
 .../python/python3-twisted/CVE-2022-24801-6.patch  |  129 +++
 .../python/python3-twisted/CVE-2022-24801-7.patch  |   27 +
 .../python/python3-twisted/CVE-2022-24801-8.patch  |  108 ++
 .../python/python3-twisted/CVE-2022-24801-9.patch  |   25 +
 .../python/python3-twisted_22.2.0.bb               |   16 +-
 .../python/python3-twitter_4.8.0.bb                |    3 +
 .../python/python3-werkzeug/CVE-2023-23934.patch   |    5 +-
 .../python/python3-werkzeug/CVE-2023-25577.patch   |    6 +-
 ...werkzeug_2.1.1.bb => python3-werkzeug_2.1.2.bb} |    4 +-
 ...on3-blivet_3.4.3.bb => python3-blivet_3.4.4.bb} |    2 +-
 meta-xfce/classes/thunar-plugin.bbclass            |    2 +-
 meta-xfce/classes/xfce-app.bbclass                 |    2 +-
 meta-xfce/classes/xfce-panel-plugin.bbclass        |    2 +-
 meta-xfce/classes/xfce.bbclass                     |    2 +-
 .../{catfish_4.16.3.bb => catfish_4.16.4.bb}       |    2 +-
 .../xfce4-panel-profiles_1.0.13.bb                 |    2 +-
 .../xfwm4-themes/xfwm4-themes_4.10.0.bb            |    2 +-
 .../recipes-bindings/vala/xfce4-vala_4.10.3.bb     |    2 +-
 .../diskperf/xfce4-diskperf-plugin_2.7.0.bb        |    2 +-
 .../netload/xfce4-netload-plugin_1.4.0.bb          |    2 +-
 .../xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb      |    2 +-
 137 files changed, 4941 insertions(+), 148 deletions(-)
 rename meta-gnome/recipes-gnome/evince/{evince_42.3.bb => evince_42.4.bb} (94%)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.72.2.bb => gjs_1.72.4.bb} (92%)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.3.bb => gnome-bluetooth_42.8.bb} (91%)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_42.0.bb => gnome-control-center_42.10.bb} (94%)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_42.0.bb => gnome-desktop_42.10.bb} (92%)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-daemon_42.1.bb => gnome-settings-daemon_42.2.bb} (87%)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_42.0.bb => gnome-shell-extensions_42.3.bb} (85%)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_42.0.bb => gnome-shell_42.9.bb} (95%)
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.42.2.bb => gnome-terminal_3.42.3.bb} (90%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0002-meson-fix-invalid-positional-argument.patch
 rename meta-gnome/recipes-gnome/gnome-tweaks/{gnome-tweaks_40.0.bb => gnome-tweaks_40.10.bb} (84%)
 rename meta-gnome/recipes-gnome/gtk4/{gtk4_4.6.2.bb => gtk4_4.6.9.bb} (97%)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview4_4.8.2.bb => gtksourceview4_4.8.4.bb} (93%)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.4.1.bb => gtksourceview5_5.4.2.bb} (90%)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.50.4.bb => gvfs_1.50.7.bb} (97%)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.1.1.bb => libadwaita_1.1.7.bb} (86%)
 rename meta-gnome/recipes-gnome/mutter/{mutter_42.0.bb => mutter_42.9.bb} (96%)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_42.1.1.bb => nautilus_42.6.bb} (92%)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.2.1.bb => tracker-miners_3.2.2.bb} (96%)
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp/CVE-2025-3155.patch
 create mode 100644 meta-multimedia/recipes-mkv/libebml/libebml/CVE-2015-8791.patch
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11332.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11358.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11359.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15370.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15371.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15372.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15642.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-13590.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-8354.patch
 create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45969.patch
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45970.patch
 rename meta-networking/recipes-daemons/squid/{squid_4.15.bb => squid_4.17.bb} (98%)
 create mode 100644 meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61911.patch
 create mode 100644 meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61912.patch
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2025-62291.patch
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9384.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-30693.patch
 delete mode 100644 meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.8.4.bb => sanlock_3.8.5.bb} (95%)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2020-29260.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xorg-version.h-Increase-supported-Xorg-version-to-1..patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xserver21.1.1.patch-Add-Xorg-21-patch.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xvnc-adapt-for-1.21.patch
 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/CVE-2021-32276-1.patch
 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/CVE-2021-32276-2.patch
 create mode 100644 meta-oe/recipes-multimedia/libass/libass/CVE-2020-24994.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2022-24883.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39282.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39320.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39350.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39351.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39352.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39353.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40181.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40569.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40589.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-22211.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32039.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32040.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32458.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32459.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32460.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32658.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/run-ptest
 create mode 100644 meta-oe/recipes-support/raptor2/files/CVE-2017-18926.patch
 create mode 100644 meta-oe/recipes-support/raptor2/files/CVE-2020-25713.patch
 create mode 100644 meta-oe/recipes-support/raptor2/files/CVE-2024-57822.patch
 create mode 100644 meta-oe/recipes-support/raptor2/files/CVE-2024-57823.patch
 rename meta-python/recipes-devtools/python/{python3-bidict_0.22.0.bb => python3-bidict_0.22.1.bb} (79%)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.3.4.bb => python3-croniter_1.3.7.bb} (78%)
 rename meta-python/recipes-devtools/python/{python3-django-4.2.27 => python3-django-4.2.28}/0001-add-back-setuptools-support.patch (100%)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.27.bb => python3-django_4.2.28.bb} (83%)
 create mode 100644 meta-python/recipes-devtools/python/python3-eventlet/CVE-2025-58068.patch
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.33.0.bb => python3-eventlet_0.33.3.bb} (73%)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.10.3.bb => python3-paramiko_2.10.6.bb} (82%)
 create mode 100644 meta-python/recipes-devtools/python/python3-protobuf/CVE-2026-0994.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo/CVE-2024-5629.patch
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.1.0.bb => python3-pymongo_4.1.1.bb} (87%)
 rename meta-python/recipes-devtools/python/{python3-smpplib_2.2.1.bb => python3-smpplib_2.2.3.bb} (87%)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-4.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-5.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-6.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-7.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-8.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/CVE-2022-24801-9.patch
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.1.1.bb => python3-werkzeug_2.1.2.bb} (90%)
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.4.3.bb => python3-blivet_3.4.4.bb} (93%)
 rename meta-xfce/recipes-apps/catfish/{catfish_4.16.3.bb => catfish_4.16.4.bb} (90%)

