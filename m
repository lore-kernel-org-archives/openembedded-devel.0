Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B5ED1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 14:19:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8688.1765289985828003478
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 06:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KktVKnPL;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso47457135e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 06:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289984; x=1765894784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Z8Yzqe2VhyA4sZxmD/VNgUvxeUE3/CF33Zj/BSMouU=;
        b=KktVKnPL/R7eHOYLiHSFzBqH8TzQxLnBj2NAy1ZNtZXK6muXAJimq6arv4HzN5e/Gi
         joa3QL3KUhoPKAK05E6pmO6GA4Eod49rQeTdgnAFWQXKLXJNbS2YI+qXtsqTGO4C817e
         tl84vvB+aKOKc5HtpfMtHPDCa6gGB/mC5NZM/6soClYIVh8Ryqsw1PUbEIvpSrDngSnv
         voIQi9EYXB6ovIEUYhAOCKTmgHSolKfEyOMwvdATxUS3RO9EfA76ABVsjx4BDsKq994a
         dUQ0QtkCLtVFXbjnTf/coCxWMe76C+9KdAifj0TDwA5S1z0axGZV15sbiEuBZfEVsFe0
         XJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289984; x=1765894784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Z8Yzqe2VhyA4sZxmD/VNgUvxeUE3/CF33Zj/BSMouU=;
        b=kF9tb1TPYZODTwL3CqTU9BqcvYojE0sESnKgTEhHYhE6MXZlDQk+N5/naQh2XuL9gL
         9juJfZTSunHPDQPTeGS6w1+ROzv0YKHP/Ui0sglj1zeeFyPLbIbWtAfIVuZk7SOvK5cu
         Dsewf7Iq71LAYSAtmYREVvRJk1XAXgNJp+S0eDlv5LH1Qo4a2EzGCyhETf5EghX0lRb/
         QvW5TtnCr09L2I7KG+wj72wiInqltbPvHGvZRnQd2sFTjGv4tEWaoUnjXURmmvW01gsQ
         QW0gus5sEOz636N1l67aSckBgviU6d6P1Q+me384kSp3BORlwx/PJIoS+Y2RHyNzEJLc
         3ASA==
X-Gm-Message-State: AOJu0Yy+G0bwOPR6VajTr4UTiUGtVKbuQZjCzSz9cqvVz+mXTDrKOahH
	2OjyvZnP98Av20pTqomxTslO+E+xs4w1USAe4AYMyhJ0Xx7XYtUXA9NrQwz/fA==
X-Gm-Gg: ASbGncstxG/xnKD0KIesd/snzE8EkV5JS2S867A7TQsjpMD/R5bRkVBXOJ9ZGZdedKt
	W1U9o9quMIG6GBETRgx1gl86PV4T6gQpEW99LkRa3+Yhx4ug5TLo6sXyR03OJ6/ccK4VnwMHHP0
	XRzDskeY7fnbPi7qeg+zuOPkxAcikd0RRdUtv1METlUcsfqnIU1CmXndo21vkjp73ulNPMM0DXK
	lR46DqirpCADjBJ3yEEsi3/FNPsH0eZFb307/+/pbgvJoMJly08+Ya+28cv7Xa2mze9SkzA4psG
	m9A/PwChdwMx+ejLLJ1jbcM9svi5ZG2zOiD2sq2fw+YnUghwBfYTfKYijxOftV5KitdByE5xgaj
	w6XBmrEN5iIxkCy/EJRIEh3piLekGDpY6p/uqrnzeBBmGuGpiRlA/mTcOtDZC8tWagmKy0+hjnK
	joNckiH+Ep
X-Google-Smtp-Source: AGHT+IHshBIyWzIj2IYrbWyI0bvo5FbsQW5K9nGjHxx0O9o/5fYMc5BmVzDf4TehL9Tt02UgvkxkFQ==
X-Received: by 2002:a05:600c:8184:b0:477:8ba7:fe0a with SMTP id 5b1f17b1804b1-47939e27710mr127224285e9.24.1765289983842;
        Tue, 09 Dec 2025 06:19:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7da0866csm17427595e9.9.2025.12.09.06.19.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 06:19:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Kirkstone Pull Request Dec 9th
Date: Tue,  9 Dec 2025 15:19:42 +0100
Message-ID: <20251209141942.35940-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 14:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122459

Hello,

This new Kirkstone Pull Request contains mostly SRC_URI and CVE fixes, along with a
few new ptest additions.

Logs:
world build qemuarm: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20001299417
world build qemuarm64: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20005412844
world build qemux86: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20009397404
world build qemux86-64: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20009398184
YP compatibility: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20019326942
ptest execution (qemux86-64): https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/20020165299
ptest logs: https://sarvari.me/yocto/ptest-kirkstone-2025-12.tar.gz

Please let me know if you have any questions or comments.

Thank you

---

The following changes since commit 07ac1890c843b374c27e150f1a2e53ad3db2a8e4:

  libssh: fix CVE-2025-8277 (2025-11-11 08:50:50 +0100)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut

for you to fetch changes up to 97d4be2839754dadfc326c21948472c2fc2985ce:

  gupnp-igd: add ptest support (2025-12-06 19:34:22 +0100)

----------------------------------------------------------------
AshishKumar Mishra (1):
      imagemagick: adds ptest for imagemagick recipe

Divya Chellam (1):
      libssh : fix CVE-2025-8114

Gerard Salvatella (1):
      libwebsockets: fix buildpath warnings

Gyorgy Sarvari (94):
      zabbix: update SRC_URI
      http-parser: fix SRC_URI branch
      cmpi-bindings: update SRC_URI branch
      xf86-video-armsoc: fix SRC_URI
      transmission: update SRC_URI branch
      usbredir: update SRC_URI
      ncftp: correct SRC_URI
      netsniff-ng: update SRC_URI branch
      consolation: fix SRC_URI protocol
      unicode-ucd: Updates due to license.txt updates
      unicode-ucd: Rename the license.txt in DL_DIR to avoid conflicts
      breakpad: update SRC_URI branch
      mpd: fix SRC_URI branch
      iksemel: fix SRC_URI branch
      libvdpau: fix SRC_URI
      nng: Rename default branch of github.com:nanomsg/nng.git
      wifi-test-suite: correct SRC_URI
      spirv-shader-generator: fix SRC_URI branch
      spice: correct SRC_URI
      python3-behave: update SRC_URI branch
      pyxdg: update SRC_URI
      redis: update test error message in CVE patch
      usrsctp: patch CVE-2019-20503
      usbredir: patch CVE-2021-3700
      tmux: ignore CVE-2020-27347
      libwmf: add proper CVE tag to patch
      libwmf: add missing CVE tag to patch
      libwmf: patch CVE-2015-0848 and CVE-2015-4588
      libwmf: patch CVE-2015-4695
      libwmf: patch CVE-2015-4696
      libwmf: patch CVE-2016-9011
      rsyslog: set status for CVE-2015-3243
      audiofile: patch CVE-2019-13147 and CVE-2022-24599
      audiofile: add ptest support
      audiofile: backport test for CVE-2015-7747
      audiofile: patch CVE-2018-13440 and CVE-2018-17059
      evince: fix typo in CVE_CHECK_IGNORE
      linuxptp: ignore CVE-2024-42861
      poco: patch CVE-2023-52389
      logcheck: ignore CVE-2017-20148
      libtorrent: ignore CVE-2016-5301
      exiv2: patch CVE-2021-29623
      exiv2: add missing CVE tag to patch
      exiv2: patch CVE-2021-32617
      exiv2: patch CVE-2021-32815
      exiv2: patch CVE-2021-34334
      exiv2: patch CVE-2021-34335
      redis: ignore CVE-2022-3734 and CVE-2022-0543
      redis: upgrade 6.2.12 -> 6.2.21
      redis: upgrade 7.0.13 -> 7.0.15
      redis-7: ignore CVE-2022-3734 and CVE-2022-0543
      jasper: patch CVE-2023-51257
      jasper: patch CVE-2025-8835
      jasper: patch CVE-2025-8836
      jasper: patch CVE-2025-8837
      links: set CVE_PRODUCT
      libde265: patch CVE-2022-1253
      cockpit: set correct CVE_PRODUCT
      libao: ignore CVE-2017-11548
      tigervnc: ignore CVE-2014-8241
      libraw: ignore CVE-2020-35530
      libraw: ignore CVE-2020-35531
      libraw: ignore CVE-2020-35532
      libraw: ignore CVE-2020-35533
      libraw: ignore CVE-2020-35534
      libraw: ignore CVE-2020-35535
      libraw: patch CVE-2023-1729
      libraw: patch CVE-2025-43961 and CVE-2025-43962
      libraw: patch CVE-2025-43963
      libraw: patch CVE-2025-43964
      yasm: add alternative CVE_PRODUCT
      yasm: patch CVE-2023-29579
      yasm: patch CVE-2021-33464
      yasm: patch CVE-2021-33456
      fontforge: ignore CVE-2019-15785
      fontforge: patch CVE-2020-5395, CVE-2020-25690 and CVE-2020-5496
      fontforge: patch CVE-2024-25081 and CVE-2024-25082
      babeld: fix installation with usrmerge
      gradm: fix installation with usrmerge enabled
      xrdp: upgrade 0.9.18 -> 0.9.18.1
      xrdp: patch CVE-2022-23468
      xrdp: patch CVE-2022-23477
      xrdp: patch CVE-2022-23478
      xrdp: patch CVE-2022-23479
      xrdp: patch CVE-2022-23480
      xrdp: patch CVE-2022-23481
      xrdp: patch CVE-2022-23483
      xrdp: patch CVE-2022-23484
      xrdp: patch CVE-2022-23493
      xrdp: add ptest support
      gssdp: add ptest support
      gupnp: add ptest support
      gupnp-av: add ptest support
      gupnp-igd: add ptest support

Khem Raj (3):
      audiofile: Fix build with clang++
      libwebsockets: Fix reference to TMPDIR
      scsirastools: Fix build with usrmerge

Martin Jansa (2):
      libwebsockets: remove STAGING_LIBDIR with /
      libwebsockets: fix buildpath warnings from libcap.so

Mingli Yu (1):
      nspr: fix buildpaths issue

Naman Jain (1):
      p7zip: ignore CVE-2022-47069

Ninette Adhikari (1):
      monkey: Update status for CVE-2013-2183

Peter Marko (4):
      audiofile: mark CVE-2020-18781 as patched
      uw-imap: patch CVE-2018-19518
      rtmpdump: mark CVE-2015-8270, CVE-2015-8271 and CVE-2015-8272 as fixed
      monkey: ignore CVE-2013-1771

Saravanan (11):
      python3-django: upgrade 3.2.23 -> 3.2.25
      python3-django: upgrade 4.2.17 -> 4.2.26
      python3-django: fix CVE-2024-27351
      python3-django: fix CVE-2025-26699
      python3-django: fix CVE-2024-56374
      python3-django: fix CVE-2025-57833
      python3-django: fix CVE-2024-39329
      python3-django: fix CVE-2024-39330
      python3-django: fix CVE-2024-41991
      python3-django: fix CVE-2024-53907
      python3-django: fix CVE-2025-32873

Zhang Peng (1):
      wxwidgets: fix CVE-2024-58249

 meta-gnome/recipes-gnome/evince/evince_42.3.bb     |   2 +-
 .../recipes-connectivity/gupnp/gssdp/run-ptest     |  12 +
 .../recipes-connectivity/gupnp/gssdp_1.4.0.1.bb    |   9 +-
 .../recipes-connectivity/gupnp/gupnp-av/run-ptest  |  12 +
 .../recipes-connectivity/gupnp/gupnp-av_0.14.0.bb  |  21 +-
 .../recipes-connectivity/gupnp/gupnp-igd/run-ptest |  13 +
 .../recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb  |  11 +-
 .../recipes-connectivity/gupnp/gupnp/run-ptest     |  12 +
 .../recipes-connectivity/gupnp/gupnp_1.4.1.bb      |  14 +-
 .../recipes-multimedia/libao/libao_1.2.0.bb        |   3 +
 .../libde265/libde265/CVE-2022-1253.patch          |  34 ++
 .../recipes-multimedia/libde265/libde265_1.0.5.bb  |   4 +-
 .../recipes-multimedia/musicpd/mpd_0.23.12.bb      |   2 +-
 .../recipes-multimedia/rtmpdump/rtmpdump_2.4.bb    |   3 +
 .../recipes-connectivity/nanomsg/nng_1.5.2.bb      |   2 +-
 .../recipes-daemons/ncftp/ncftp_3.2.7.bb           |   4 +-
 .../recipes-protocols/babeld/babeld_1.10.bb        |   2 +-
 .../usrsctp/usrsctp/CVE-2019-20503.patch           |  54 ++++
 .../recipes-protocols/usrsctp/usrsctp_git.bb       |   3 +-
 .../http-parser/http-parser_2.9.4.bb               |   2 +-
 .../netsniff-ng/netsniff-ng_0.6.8.bb               |   2 +-
 meta-networking/recipes-support/spice/spice_git.bb |   4 +-
 .../spice/usbredir/CVE-2021-3700.patch             |  74 +++++
 .../recipes-support/spice/usbredir_0.9.0.bb        |   6 +-
 .../libtorrent/libtorrent_git.bb                   |   1 +
 .../libwebsockets/libwebsockets_4.2.2.bb           |  11 +
 .../linuxptp/linuxptp_3.1.1.bb                     |   3 +
 .../transmission/transmission_git.bb               |   2 +-
 .../wifi-test-suite/wifi-test-suite_git.bb         |   2 +-
 .../recipes-connectivity/zabbix/zabbix_5.4.12.bb   |   2 +-
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb  |   2 +-
 .../uw-imap/uw-imap/CVE-2018-19518.patch           |  24 ++
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb  |   1 +
 .../yasm/yasm/CVE-2021-33456.patch                 |  35 ++
 .../yasm/yasm/CVE-2021-33464.patch                 |  34 ++
 .../yasm/yasm/CVE-2023-29579.patch                 |  39 +++
 meta-oe/recipes-devtools/yasm/yasm_git.bb          |   7 +-
 .../cmpi-bindings/cmpi-bindings_1.0.1.bb           |   2 +-
 .../libwmf/CVE-2015-0848-CVE-2015-4588.patch       | 135 ++++++++
 .../libwmf/libwmf/CVE-2015-4695.patch              |  70 ++++
 .../libwmf/libwmf/CVE-2015-4696.patch              |  37 +++
 .../libwmf/libwmf/CVE-2016-9011.patch              |  50 +++
 .../libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch |   2 +
 .../libwmf/libwmf-0.2.8.4-useafterfree.patch       |   2 +
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb  |   6 +-
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb      |   3 +
 .../redis/redis-7.0.13/CVE-2023-41056.patch        |  63 ----
 .../redis/redis-7.0.13/CVE-2023-45145.patch        |  72 -----
 .../0001-src-Do-not-reset-FINAL_LIBS.patch         |   0
 .../0006-Define-correct-gregs-for-RISCV32.patch    |   0
 .../CVE-2024-31227.patch                           |   0
 .../CVE-2024-31228.patch                           |   0
 .../CVE-2024-31449.patch                           |   0
 .../CVE-2024-46981.patch                           |   0
 .../CVE-2024-51741.patch                           |   4 +-
 .../CVE-2025-21605.patch                           |   0
 .../CVE-2025-27151.patch                           |   0
 .../CVE-2025-32023.patch                           |   0
 .../CVE-2025-46817.patch                           |   0
 .../CVE-2025-46818.patch                           |   0
 .../CVE-2025-46819.patch                           |   0
 .../CVE-2025-48367.patch                           |   0
 .../CVE-2025-49844.patch                           |   0
 .../GNU_SOURCE-7.patch                             |   0
 .../hiredis-use-default-CC-if-it-is-set.patch      |   0
 .../init-redis-server                              |   0
 ...Makefile-to-use-environment-build-setting.patch |   0
 .../oe-use-libc-malloc.patch                       |   0
 .../{redis-7.0.13 => redis-7.0.15}/redis.conf      |   0
 .../{redis-7.0.13 => redis-7.0.15}/redis.service   |   0
 .../redis/redis/CVE-2023-45145.patch               |  72 -----
 .../redis/redis/CVE-2024-31228.patch               |  68 ----
 .../redis/redis/CVE-2024-31449.patch               |  49 ---
 .../redis/redis/CVE-2024-46981.patch               |  39 ---
 .../redis/{redis_6.2.12.bb => redis_6.2.21.bb}     |  11 +-
 .../redis/{redis_7.0.13.bb => redis_7.0.15.bb}     |   9 +-
 .../recipes-extended/rsyslog/rsyslog/rsyslog.conf  |   1 +
 .../recipes-extended/rsyslog/rsyslog_8.2206.0.bb   |   3 +
 .../scsirastools/scsirastools_1.6.6.bb             |   2 +-
 meta-oe/recipes-extended/tmux/tmux_3.1c.bb         |   4 +
 .../wxwidgets/wxwidgets/CVE-2024-58249.patch       | 177 ++++++++++
 .../recipes-extended/wxwidgets/wxwidgets_3.1.5.bb  |   1 +
 meta-oe/recipes-gnome/pyxdg/pyxdg_0.27.bb          |   2 +-
 .../fontforge/fontforge/CVE-2020-25690-1.patch     |  81 +++++
 .../fontforge/fontforge/CVE-2020-25690-2.patch     |  32 ++
 .../fontforge/fontforge/CVE-2024-25081-25082.patch | 181 +++++++++++
 .../fontforge/fontforge_20190801.bb                |   8 +-
 .../jasper/jasper/CVE-2023-51257.patch             |  40 +++
 .../jasper/jasper/CVE-2025-8835.patch              | 170 ++++++++++
 .../jasper/jasper/CVE-2025-8836.patch              |  78 +++++
 .../jasper/jasper/CVE-2025-8837.patch              |  63 ++++
 meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb   |   7 +-
 .../spir/spirv-shader-generator_git.bb             |   2 +-
 .../recipes-graphics/tigervnc/tigervnc_1.11.0.bb   |   3 +
 meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb     |   2 +-
 .../xorg-driver/xf86-video-armsoc_1.4.1.bb         |   2 +-
 .../audiofile/audiofile_0.3.6.bb                   |  24 +-
 ...0001-test-sign.cpp-Fix-C-narrowing-errors.patch |  41 +++
 ...4-Always-check-the-number-of-coefficients.patch |   1 +
 .../audiofile/files/CVE-2018-13440.patch           |  36 +++
 .../audiofile/files/CVE-2018-17059.patch           |  35 ++
 .../audiofile/files/CVE-2019-13147.patch           |  31 ++
 .../audiofile/files/CVE-2022-24599.patch           |  50 +++
 .../recipes-multimedia/audiofile/files/run-ptest   |  14 +
 .../audiofile/files/test-for-CVE-2015-7747.patch   | 166 ++++++++++
 .../consolation/consolation_0.0.8.bb               |   2 +-
 .../exiv2/exiv2/CVE-2021-29458.patch               |   3 +
 .../exiv2/exiv2/CVE-2021-29623.patch               |  29 ++
 .../exiv2/exiv2/CVE-2021-32617.patch               | 129 ++++++++
 .../exiv2/exiv2/CVE-2021-32815.patch               |  36 +++
 .../exiv2/exiv2/CVE-2021-34334-1.patch             |  36 +++
 .../exiv2/exiv2/CVE-2021-34334-2.patch             | 322 +++++++++++++++++++
 .../exiv2/exiv2/CVE-2021-34334-3.patch             |  35 ++
 .../exiv2/exiv2/CVE-2021-34334-4.patch             |  25 ++
 .../exiv2/exiv2/CVE-2021-34335-1.patch             |  43 +++
 .../exiv2/exiv2/CVE-2021-34335-2.patch             |  57 ++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb      |  28 +-
 .../gradm/0001-make-Define-SBINDIR-flag.patch      |  69 ++++
 .../gradm/gradm_3.1-201903191516.bb                |   2 +
 meta-oe/recipes-support/iksemel/iksemel_1.5.bb     |   2 +-
 .../imagemagick/files/imagemagick-ptest.sh         | 128 ++++++++
 .../recipes-support/imagemagick/files/run-ptest    |  43 +++
 .../imagemagick/imagemagick_7.0.10.bb              |   8 +-
 .../libraw/libraw/CVE-2023-1729.patch              |  25 ++
 .../libraw/libraw/CVE-2025-43961-43962.patch       | 104 ++++++
 .../libraw/libraw/CVE-2025-43963.patch             |  36 +++
 .../libraw/libraw/CVE-2025-43964.patch             |  25 ++
 meta-oe/recipes-support/libraw/libraw_0.20.2.bb    |  17 +-
 .../libssh/libssh/CVE-2025-8114.patch              |  50 +++
 meta-oe/recipes-support/libssh/libssh_0.8.9.bb     |   1 +
 meta-oe/recipes-support/links/links.inc            |   2 +
 ...-config-nspr-config.in-don-t-pass-LDFLAGS.patch |  30 ++
 meta-oe/recipes-support/nspr/nspr_4.29.bb          |   1 +
 .../recipes-support/poco/poco/CVE-2023-52389.patch | 122 +++++++
 meta-oe/recipes-support/poco/poco_1.11.2.bb        |   1 +
 .../unicode-ucd/unicode-ucd_14.0.0.bb              |   6 +-
 .../recipes-support/xrdp/xrdp/CVE-2022-23468.patch |  34 ++
 .../recipes-support/xrdp/xrdp/CVE-2022-23477.patch |  38 +++
 .../recipes-support/xrdp/xrdp/CVE-2022-23478.patch |  85 +++++
 .../recipes-support/xrdp/xrdp/CVE-2022-23479.patch |  83 +++++
 .../xrdp/xrdp/CVE-2022-23480-1.patch               | 356 +++++++++++++++++++++
 .../xrdp/xrdp/CVE-2022-23480-2.patch               |  54 ++++
 .../recipes-support/xrdp/xrdp/CVE-2022-23481.patch |  46 +++
 .../recipes-support/xrdp/xrdp/CVE-2022-23483.patch |  65 ++++
 .../recipes-support/xrdp/xrdp/CVE-2022-23484.patch |  31 ++
 .../recipes-support/xrdp/xrdp/CVE-2022-23493.patch |  33 ++
 meta-oe/recipes-support/xrdp/xrdp/run-ptest        |  13 +
 .../xrdp/{xrdp_0.9.18.bb => xrdp_0.9.18.1.bb}      |  47 ++-
 .../recipes-extended/logcheck/logcheck_1.3.23.bb   |   3 +
 .../recipes-devtools/python/python-django.inc      |   6 +-
 .../python/python3-behave_1.2.6.bb                 |   2 +-
 .../python3-django-3.2.25/CVE-2024-39329.patch     | 114 +++++++
 .../python3-django-3.2.25/CVE-2024-39330.patch     | 184 +++++++++++
 .../python3-django-3.2.25/CVE-2024-41991.patch     | 143 +++++++++
 .../python3-django-3.2.25/CVE-2024-53907.patch     | 124 +++++++
 .../python3-django-3.2.25/CVE-2024-56374.patch     | 308 ++++++++++++++++++
 .../python3-django-3.2.25/CVE-2025-26699.patch     | 106 ++++++
 .../python3-django-3.2.25/CVE-2025-32873.patch     | 110 +++++++
 .../python3-django-3.2.25/CVE-2025-57833.patch     | 110 +++++++
 .../python/python3-django/CVE-2024-27351.patch     | 149 +++++++++
 .../python/python3-django/CVE-2024-39329.patch     | 111 +++++++
 .../python/python3-django/CVE-2024-39330.patch     | 181 +++++++++++
 .../python/python3-django/CVE-2024-56374.patch     | 315 ++++++++++++++++++
 .../python/python3-django/CVE-2025-26699.patch     | 107 +++++++
 .../python/python3-django/CVE-2025-32873.patch     | 107 +++++++
 .../python/python3-django/CVE-2025-57833.patch     |  95 ++++++
 .../python/python3-django_2.2.28.bb                |   7 +
 .../python/python3-django_3.2.23.bb                |  13 -
 .../python/python3-django_3.2.25.bb                |  23 ++
 .../python/python3-django_4.2.17.bb                |  13 -
 .../python/python3-django_4.2.26.bb                |  17 +
 .../recipes-httpd/monkey/monkey_1.6.9.bb           |   4 +
 .../recipes-webadmin/cockpit/cockpit_220.bb        |   2 +
 173 files changed, 6620 insertions(+), 455 deletions(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp/run-ptest
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-av/run-ptest
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/run-ptest
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2022-1253.patch
 create mode 100644 meta-networking/recipes-protocols/usrsctp/usrsctp/CVE-2019-20503.patch
 create mode 100644 meta-networking/recipes-support/spice/usbredir/CVE-2021-3700.patch
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-0848-CVE-2015-4588.patch
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4695.patch
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4696.patch
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-9011.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-41056.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-45145.patch
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2024-31227.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2024-31228.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2024-31449.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2024-46981.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2024-51741.patch (94%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-21605.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-27151.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-32023.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-46817.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-46818.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-46819.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-48367.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-49844.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/oe-use-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/redis.service (100%)
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2023-45145.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2024-31228.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2024-31449.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2024-46981.patch
 rename meta-oe/recipes-extended/redis/{redis_6.2.12.bb => redis_6.2.21.bb} (88%)
 rename meta-oe/recipes-extended/redis/{redis_7.0.13.bb => redis_7.0.15.bb} (90%)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2020-25690-1.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2020-25690-2.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081-25082.patch
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/CVE-2023-51257.patch
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8835.patch
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8836.patch
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8837.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0001-test-sign.cpp-Fix-C-narrowing-errors.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2018-13440.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2018-17059.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2019-13147.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2022-24599.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/run-ptest
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/test-for-CVE-2015-7747.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29623.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32617.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-32815.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-2.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-3.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-4.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335-2.patch
 create mode 100644 meta-oe/recipes-support/gradm/gradm/0001-make-Define-SBINDIR-flag.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/imagemagick-ptest.sh
 create mode 100644 meta-oe/recipes-support/imagemagick/files/run-ptest
 create mode 100644 meta-oe/recipes-support/libraw/libraw/CVE-2023-1729.patch
 create mode 100644 meta-oe/recipes-support/libraw/libraw/CVE-2025-43961-43962.patch
 create mode 100644 meta-oe/recipes-support/libraw/libraw/CVE-2025-43963.patch
 create mode 100644 meta-oe/recipes-support/libraw/libraw/CVE-2025-43964.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch
 create mode 100644 meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch
 create mode 100644 meta-oe/recipes-support/poco/poco/CVE-2023-52389.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-1.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-2.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/run-ptest
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.18.bb => xrdp_0.9.18.1.bb} (64%)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-39329.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-39330.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-41991.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-53907.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2024-56374.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-26699.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-32873.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.25/CVE-2025-57833.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-27351.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_3.2.23.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_3.2.25.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_4.2.17.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_4.2.26.bb

