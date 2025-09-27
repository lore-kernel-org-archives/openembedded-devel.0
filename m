Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DC3CAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:32:26 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.6893.1758954744517255478
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B2yNBo66;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-42480cb4127so33424065ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954743; x=1759559543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XwswPvm3guy3yPIIhNonbHHYbyL3rFafVEdBlhJWb0=;
        b=B2yNBo66xbkvt/jP92jMV4NjlVOJJ8WGqgEA1ysjP4cldmfu1lZ3wgNTcS54JKyJro
         IUuhOfbc3rtbxDwaRkdPDlhTXPHqbM1B58Pgjlxt89G4Xoqa+BB33550RR0doy49P2jZ
         WJ4ekJFrFT/q1HJ35GhblkkAkmqcCccweElWPL7CQlJ92BxpkhZiG2EeXrAYDpcYzOVo
         ZhDihLfJZ00Dg72O+bb1ZZM4AvXLNDL4d5zYErFXgMQ9MaUKVJ8ykePzTEqAFS4BKYdo
         GZtPYHfQArnqkzY9xu0jDHHDb2M2srX77DEOh4mYu14u8fqEW89ZXy+GoxwAssPMqlzt
         iD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954743; x=1759559543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XwswPvm3guy3yPIIhNonbHHYbyL3rFafVEdBlhJWb0=;
        b=Rna+He63gDub9zJhKq2CQDFtF07BELDxSfswKc9qs9wND8Qjm082pDUg2IfVcW46oE
         c0A4y6xOB/kQ4ARw9hRLbFwDkgg/U4QW/7wINgcK+Okt9XsxUgpDffzrqwPIcWh4cApK
         +YnrVW8enYu7yWXJFwVBL0tfimqzYKM/gjP3kz1FszlI67RVm2Yxz5H50ltmo/xH+Yxa
         wb+fuVdBqENHuKvb5GGkcdNmvbmXPeYIyAu3ozJJQCW0hd63h7hXNluxa1hxvx7tHOb4
         c+nYlGG/734LGqrVqhZykC6cq+m/h46MZviAdQ5Zs4s932y+0Cu4LkkuHkUYLN6yTSQF
         UXyw==
X-Gm-Message-State: AOJu0Yxp5JF9LBgwzCpbtmvH1Ubos0f9Eyogln+BkzpLYqeiDqRP0mDV
	KPvpv1oHXq77Jyh8iI/1i8vKJpFK7OFZ8LVRRZ8TKk4yYYhPcV8kC1bcXwRNaA==
X-Gm-Gg: ASbGncs/9txgySiA/6vqBGRRH72IDy9NDI1VWwoZmn2RanQz7QicBjk65kW6UoAMOld
	HexTvzOmNShAC/IO6GBFCWuY+SmyzC8Iezb10Gbv6wP2EEllKLgz6iiItROhVbYVDVuyWGrGHzk
	mkWCh/5bkL3Ppj+rTve9ryrx4r2cJ/dZ/xyeHdtDv6NKGPbijahWA9nrmzkcy+0Lfqn6pGYNWNp
	+k6aRypqgstHn/kF1VdpivE6Fxk4WTCNY0G2YPp9ZUJrc9FdGZam+8+Uhh+5aarpFTRFdKr2cV7
	7a5MAYKr1PT3NOFqV1wv5ZNNhAHapZdMBOjyqOFaTQmzBeBcUO3c1PjBIG9VsRrEutmQdQglwiL
	rOCSfQOPwfquJdpwgpAwdW1PLmy7jyw7Ne4blH6aIQQBETPwe8hbD6vSFXMtLIQ==
X-Google-Smtp-Source: AGHT+IFK8BtWsNt2g8JlOQT0TUp7HlCLyGSE7HBoWxVssrfWUPWKUNqAAo7TfoK6IVHbFZ1qNAKTNg==
X-Received: by 2002:a05:6e02:278a:b0:427:a3ef:5701 with SMTP id e9e14a558f8ab-427a3ef581emr65290555ab.14.1758954743459;
        Fri, 26 Sep 2025 23:32:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:23 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 00/21] Trying to keep recipes in the walnascar branch updated with useful fixes from the master branch.
Date: Sat, 27 Sep 2025 18:31:55 +1200
Message-ID: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119954

I have tried to carefully review the change logs and commit logs while updating
recipe versions.

Did basic validation by building against qemux86-64 and qemuarm64
machine targets.

Ankur Tyagi (1):
  lsscsi: fix versioning

Changqing Li (1):
  pahole: fix a Segmentation fault error

Jason Schonberg (1):
  Remove the use of http://ftp.gnome.org/pub/gnome

Jeroen Hofstee (1):
  php: ignore CVE-2024-3566

Khem Raj (2):
  tomlplusplus: Fix test failures with clang/libcxx
  safec: Pass Qunused-arguments when using clang

Leon Anavi (1):
  ssd1306: Update to newer version

Miaoqing Pan (1):
  hostapd: enable 802.11be, SAE-PK, OWE, SuiteB, ACS, and MBO support

Nitin Wankhade (1):
  iperf3: Fix CVE-2025-54350

Peace Lee (1):
  guider: Upgrade 3.9.8 -> 3.9.9

Peter Kjellerstedt (1):
  hostapd: Backport a patch to build SAE-PK correctly

Wang Mingyu (9):
  gensio: upgrade 2.8.7 -> 2.8.15
  libimobiledevice-glue: upgrade 1.3.1 -> 1.3.2
  ser2net: upgrade 4.6.4 -> 4.6.5
  mm-common: upgrade 1.0.6 -> 1.0.7
  valijson: upgrade 1.0.4 -> 1.0.5
  valijson: upgrade 1.0.5 -> 1.0.6
  tk: upgrade 9.0.1 -> 9.0.2
  sexpect: upgrade 2.3.14 -> 2.3.15
  iptraf-ng: upgrade 1.2.1 -> 1.2.2

Yi Zhao (1):
  tk8: upgrade 8.6.15 -> 8.6.17

 .../iperf3/iperf3/CVE-2025-54350.patch        | 24 +++++++++
 .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  3 +-
 meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb      |  2 +
 .../{gensio_2.8.7.bb => gensio_2.8.15.bb}     |  4 +-
 ...e64-for-hostapd-CONFIG_SAE_PK-builds.patch | 40 ++++++++++++++
 .../hostapd/hostapd/defconfig                 | 28 ++++++++++
 .../hostapd/hostapd_2.11.bb                   |  1 +
 ....3.1.bb => libimobiledevice-glue_1.3.2.bb} |  2 +-
 .../{ser2net_4.6.4.bb => ser2net_4.6.5.bb}    |  2 +-
 .../libsigc++-2.0/libsigc++-2.0_2.12.1.bb     |  2 +-
 .../libsigc++-2.0/libsigc++-3_3.6.0.bb        |  2 +-
 ...{mm-common_1.0.6.bb => mm-common_1.0.7.bb} |  4 +-
 .../proxy-libintl/proxy-libintl_20100902.bb   |  4 +-
 meta-oe/recipes-core/safec/safec_3.7.1.bb     |  3 ++
 .../recipes-devtools/glade/glade_3.36.0.bb    |  2 +-
 .../{guider_3.9.8.bb => guider_3.9.9.bb}      |  8 +--
 ...{iptraf-ng_1.2.1.bb => iptraf-ng_1.2.2.bb} |  4 +-
 ...r-Fix-elf_functions-cleanup-on-error.patch | 54 +++++++++++++++++++
 .../recipes-devtools/pahole/pahole_1.29.bb    |  3 +-
 meta-oe/recipes-devtools/php/php_8.4.10.bb    |  1 +
 .../{sexpect_2.3.14.bb => sexpect_2.3.15.bb}  |  4 +-
 .../recipes-devtools/ssd1306/ssd1306_git.bb   |  2 +-
 .../tcltk/{tk8_8.6.15.bb => tk8_8.6.17.bb}    |  2 +-
 .../tcltk/{tk_9.0.1.bb => tk_9.0.2.bb}        |  2 +-
 .../tomlplusplus/tomlplusplus_git.bb          |  4 ++
 .../{valijson_1.0.4.bb => valijson_1.0.6.bb}  |  4 +-
 .../gnome-themes/gnome-themes-extra_3.28.bb   |  2 +-
 meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb    |  2 +-
 28 files changed, 187 insertions(+), 28 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.8.7.bb => gensio_2.8.15.bb} (92%)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
 rename meta-oe/recipes-connectivity/libimobiledevice-glue/{libimobiledevice-glue_1.3.1.bb => libimobiledevice-glue_1.3.2.bb} (89%)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.4.bb => ser2net_4.6.5.bb} (91%)
 rename meta-oe/recipes-core/mm-common/{mm-common_1.0.6.bb => mm-common_1.0.7.bb} (78%)
 rename meta-oe/recipes-devtools/guider/{guider_3.9.8.bb => guider_3.9.9.bb} (75%)
 rename meta-oe/recipes-devtools/iptraf/{iptraf-ng_1.2.1.bb => iptraf-ng_1.2.2.bb} (89%)
 create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
 rename meta-oe/recipes-devtools/sexpect/{sexpect_2.3.14.bb => sexpect_2.3.15.bb} (82%)
 rename meta-oe/recipes-devtools/tcltk/{tk8_8.6.15.bb => tk8_8.6.17.bb} (97%)
 rename meta-oe/recipes-devtools/tcltk/{tk_9.0.1.bb => tk_9.0.2.bb} (97%)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.0.4.bb => valijson_1.0.6.bb} (90%)


