Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8BCFF60C7
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 04:38:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12964.1774931903327390281
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 21:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ndJMJrmp;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fb439299so48000955e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 21:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774931902; x=1775536702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gqbkazts72NW8i3v3xyi0IjBx8sbZzT+lDzo76icaSA=;
        b=ndJMJrmprJEJoKtzK2FBioW/axo04wMGi47nOx1I0H+I16dV3ybWb7YNYEiDjCMG3/
         9ouezdG85Gf0UlfohjszdjlGNIa69fSFsupchTiPhXoXKGv2VcAOtfZdyyOwHOhKG1+Q
         SgRU4HDb03+tqYmhLtXIaEm83uJg+n39KgQvuztTwIuituzKnFb8vVSDWx6QlWGakoGf
         bR42qxa5GsL1ZIBhLKkkFdfCvcqOtl7F9trhjj585REST+JYPCgJo/lHnYe060CGizCF
         smkhQWPDeVypsWLPkBSEi62P7S3d6EAAs7sfatuF/QXzbl000f2eMH+lI9VZbFCP9bvN
         Vksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774931902; x=1775536702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqbkazts72NW8i3v3xyi0IjBx8sbZzT+lDzo76icaSA=;
        b=EjOFlIIojqrsKhdu4P5Pbqd6zn+/15Dm0iO3YIpjc3fFD151g95gH/Im4YEViAU/uX
         oP6Left6glSgpls+PksLARa1ao3GeBlhmXRMN+052fr5QM6zz3QBAP4ZmbA7FHlncS9g
         Ku/+eoMV11nrTvd54ooFAlWspGkVnbC125lX3mdYYoYIgLaolkJYNcFpmVrw8y1U5HWZ
         bZnV2zdMC3RFR83rRCGZkU+BCn2ru+EfbRlLrsBrn5KnzmidPApMmVdtXbuh++PAMJB1
         4UUCwLh0GBNHp3NPQogVvYRdjb8rWVMzCNkoeUjW8Df5y5O9R451VV65f17RCtkGMp3n
         4JJg==
X-Gm-Message-State: AOJu0Yw+CncWWLYLHAaBqypn6ob9oXd7T9Cv5qyPisOkUC/3s0QIYrjw
	iGtjkXhVUBNzbeVLGFNoo8cfojRSWUPC6DKGfK37cQ+YZQrKGpQ+nDqTYKLTrg==
X-Gm-Gg: ATEYQzx7iqjhwPWCwliTshytCvDii1ItUV2CKv2+olqmSECY3oqvSigP2wH/00+OdpF
	bVyiosBWd9MWIozX5MEywQBFigWoYl6GMpzfGEsVbuXedGsFxXhaWsUb9TN/YCRqvq42MX6Nx18
	uA6fD/p6E9EUH7UTXGu0vZSbTmJC2pCK3EfCHqnxMFkHe7FmE7E3cuiO4X/QxbozU0uVlLKgKfZ
	TwVoqUY5mKF70dHttlAJweccJp/saHcECUn2x7wKN36uTQHWLsK2eurxWqBf6AE3Ruiu6++fOnK
	ow4ZUaV+MwyEx1M+EP13cnheJeFa3u3xWJCjEVy9o3Bh/toHkHq3kmo93BE2ljQLMm9b0Namb5g
	3w8QEI1UGwvqD1GHOiiRgcYBmsdn7QPrFAQiLcNJn/GSDiaLhb28NWSI4dg7iHfqS0Z0AKd6g6T
	B6fUwMhTcY1K3UI3i7cEEq
X-Received: by 2002:a05:6000:2489:b0:439:bdba:56be with SMTP id ffacd0b85a97d-43b9e9d5adcmr24236216f8f.10.1774931901272;
        Mon, 30 Mar 2026 21:38:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm35412995f8f.0.2026.03.30.21.38.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 21:38:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Kirkstone pull request 31st March
Date: Tue, 31 Mar 2026 06:38:18 +0200
Message-ID: <20260331043818.3061342-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 04:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125872

Today's Kirkstone PR brings a handful CVE fixes - thanks to all contributors!

Artifacts:
World build qemuarm: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/23707143535
World build qemuarm64: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/23710823327
World build qemux86: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/23707292542
World build qemux86-64: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/23727871556
YP layer compatibility: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/23707198938
Ptest execution (logs available at the link): https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/23734945482

As expected, one testcase has failed from python3-django_2 ptests.

Since a new patch has arrived on the ML already, it means that this is not the final PR 
for Kirkstone yet - the next one will be, however. New patches will be accepted for a 
few more weeks.
The last Kirkstone PR is planned to be sent either about a week after the last Kirkston 
Yocto release, or soon after Wrynose is released - whichever comes later.

Just reply to this message in case of any questions or comments.

Thank you,
Gyorgy



The following changes since commit 8a598a2bc9199a4fbb9008a32ab143fb509a0933:

  poppler: mark CVE-2022-38171 patched (2026-02-15 15:30:54 +0100)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut

for you to fetch changes up to 9d8ef26a9693e2c70ae34abe1a753873d42ec588:

  libssh: Fix CVE-2026-0964 (2026-03-29 11:11:33 +0200)

----------------------------------------------------------------
Ankur Tyagi (1):
      dovecot: ignore CVE-2025-30189

Aviv Daum (1):
      lldpd: fix xml PACKAGECONFIG dependency

Chen Qi (1):
      iperf3: remove incorrect CVE_PRODUCT setting

Gyorgy Sarvari (42):
      cups-filters: patch CVE-2025-64503
      dante: patch CVE-2024-54662
      protobuf: ignore CVE-2026-0994
      fontforge: patch CVE-2025-15269
      fontforge: patch CVE-2025-15270
      fontforge: patch CVE-2025-15275
      fontforge: patch CVE-2025-15279
      libconfuse: patch CVE-2022-40320
      keepalived: patch CVE-2024-41184
      webmin: patch CVE-2025-67738
      quagga: patch CVE-2017-3224
      quagga: ignore CVE-2021-44038
      ndpi: ignore CVE-2025-25066
      python3-werkzeug: ignore CVE-2026-27199
      streamripper: ignore CVE-2020-37065
      gnome-shell: ignore CVE-2021-3982
      dovecot: patch CVE-2021-29157
      emacs: patch CVE-2022-48337
      exiv2: patch CVE-2021-37615 and CVE-2021-37616
      exiv2: patch CVE-2021-37618
      exiv2: patch CVE-2021-37619
      exiv2: patch CVE-2021-37620
      exiv2: patch CVE-2021-37621
      exiv2: patch CVE-2021-37622
      opem-vm-tools: ignore multiple CVEs
      memcached: patch CVE-2023-46852
      memcached: patch CVE-2023-46853
      netdata: patch CVE-2023-22497
      gimp: ignore irrelevant CVEs
      lmdb: patch CVE-2026-22185
      vlc: ignore CVE-2026-26227 and CVE-2026-26228
      gimp: patch CVE-2023-44441
      gimp: patch CVE-2023-44442
      gimp: patch CVE-2023-44443 and CVE-2023-44444
      gimp: patch CVE-2025-14422
      exiv2: patch CVE-2026-25884
      exiv2: patch CVE-2026-27596
      ettercap: patch CVE-2026-3603
      hiawatha: fix SRC_URI
      postgresql: upgrade 14.21 -> 14.22
      capnproto: patch CVE-2026-32239 and CVE-2026-32240
      libde265: patch CVE-2025-61147

Hitendra Prajapati (4):
      wireshark: Fix multiple CVEs
      postgresql: upgrade 14.20 -> 14.21
      python3-cbor2: patch CVE-2025-68131
      wireshark: fix CVE-2025-5601

Martin Jansa (1):
      freeglut: return x11 to REQUIRED_DISTRO_FEATURES

Nitin Wankhade (6):
      imagemagick: Fix CVE-2025-43965
      imagemagick: Fix CVE-2025-66628
      imagemagick: Fix CVE-2025-68618
      imagemagick: Fix CVE-2026-22770
      imagemagick: Fix CVE-2026-23874
      imagemagick: Fix CVE-2026-23876

Peter Marko (3):
      nginx: patch CVE-2026-1642
      fcgi: add follow-up patch for CVE-2025-23016
      nginx: apply patchs for CVE-2025-23419 and CVE-2026-1642 to all versions

Vijay Anusuri (6):
      libssh: Fix CVE-2026-3731
      mariadb: Fix CVE-2025-13699
      giflib: Fix CVE-2026-23868
      libssh: Fix CVE-2026-0966
      libssh: Update CVE-2026-0966-2.patch
      libssh: Fix CVE-2026-0964

Zahir Hussain (1):
      rocksdb: Add an option to set static library

 .../recipes-gimp/gimp/gimp/CVE-2023-44441.patch    |  61 +++
 .../recipes-gimp/gimp/gimp/CVE-2023-44442.patch    |  28 ++
 .../gimp/gimp/CVE-2023-44443_CVE-2023-44444.patch  |  47 ++
 .../recipes-gimp/gimp/gimp/CVE-2025-14422.patch    |  66 +++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb       |   7 +
 .../recipes-gnome/gnome-shell/gnome-shell_42.9.bb  |   2 +
 .../libde265/libde265/CVE-2025-61147.patch         |  84 ++++
 .../recipes-multimedia/libde265/libde265_1.0.5.bb  |   1 +
 .../streamripper/streamripper_1.64.6.bb            |   3 +
 .../recipes-multimedia/vlc/vlc_3.0.17.4.bb         |   3 +
 .../keepalived/keepalived/CVE-2024-41184-1.patch   | 100 ++++
 .../keepalived/keepalived/CVE-2024-41184-2.patch   |  88 ++++
 .../keepalived/keepalived/CVE-2024-41184-3.patch   |  94 ++++
 .../keepalived/keepalived/CVE-2024-41184-4.patch   |  33 ++
 .../recipes-daemons/keepalived/keepalived_2.2.2.bb |   4 +
 .../recipes-daemons/lldpd/lldpd_1.0.8.bb           |   2 +-
 .../dante/dante/CVE-2024-54662.patch               |  71 +++
 .../recipes-protocols/dante/dante_1.4.1.bb         |   3 +-
 .../quagga/files/CVE-2017-3224.patch               |  90 ++++
 .../recipes-protocols/quagga/quagga.inc            |   3 +-
 .../recipes-protocols/quagga/quagga_1.2.4.bb       |   1 +
 .../dovecot/dovecot/CVE-2021-29157.patch           | 152 ++++++
 .../recipes-support/dovecot/dovecot_2.3.14.bb      |   4 +
 .../ettercap/ettercap/CVE-2026-3606.patch          |  48 ++
 .../recipes-support/ettercap/ettercap_0.8.3.1.bb   |   4 +-
 .../libconfuse/libconfuse/CVE-2022-40320.patch     |  40 ++
 .../recipes-support/libconfuse/libconfuse_3.3.bb   |   4 +-
 .../memcached/memcached/CVE-2023-46852.patch       |  68 +++
 .../memcached/memcached/CVE-2023-46853.patch       | 114 +++++
 .../recipes-support/memcached/memcached_1.6.15.bb  |   2 +
 meta-networking/recipes-support/ntopng/ndpi_4.2.bb |   3 +
 .../open-vm-tools/open-vm-tools_11.3.5.bb          |  10 +
 .../wireshark/files/CVE-2024-8645.patch            |  88 ++++
 .../wireshark/files/CVE-2025-13945.patch           | 339 ++++++++++++++
 .../wireshark/files/CVE-2025-5601.patch            |  68 +++
 .../wireshark/files/CVE-2026-0960.patch            |  43 ++
 .../recipes-support/wireshark/wireshark_3.4.16.bb  |   4 +
 meta-oe/recipes-benchmark/iperf3/iperf3_3.15.bb    |   2 -
 .../recipes-dbs/lmdb/files/CVE-2026-22185.patch    |  29 ++
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb            |   1 +
 meta-oe/recipes-dbs/mysql/mariadb.inc              |   2 +
 .../mysql/mariadb/CVE-2025-13699-1.patch           |  90 ++++
 .../mysql/mariadb/CVE-2025-13699-2.patch           | 173 +++++++
 ...ure.ac-bypass-autoconf-2.69-version-check.patch |   4 +-
 .../{postgresql_14.20.bb => postgresql_14.22.bb}   |   4 +-
 .../rocksdb/files/static_library_as_option.patch   |  72 +++
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb      |   4 +-
 .../capnproto/CVE-2026-32239_CVE-2026-32240.patch  | 160 +++++++
 .../recipes-devtools/capnproto/capnproto_0.9.2.bb  |   1 +
 .../giflib/giflib/CVE-2026-23868.patch             |  34 ++
 meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb    |   1 +
 .../recipes-devtools/protobuf/protobuf_3.19.6.bb   |   3 +
 .../fontforge/fontforge/CVE-2025-15269.patch       |  35 ++
 .../fontforge/fontforge/CVE-2025-15270.patch       |  44 ++
 .../fontforge/fontforge/CVE-2025-15275.patch       |  33 ++
 .../fontforge/fontforge/CVE-2025-15279-1.patch     |  41 ++
 .../fontforge/fontforge/CVE-2025-15279-2.patch     |  34 ++
 .../fontforge/fontforge_20190801.bb                |   5 +
 .../recipes-graphics/freeglut/freeglut_3.2.1.bb    |   4 +-
 meta-oe/recipes-printing/cups/cups-filters.inc     |   1 +
 .../cups/cups-filters/CVE-2025-64503.patch         |  43 ++
 meta-oe/recipes-support/emacs/emacs_27.2.bb        |   1 +
 .../emacs/files/CVE-2022-48337.patch               | 108 +++++
 .../exiv2/exiv2/CVE-2021-37615-1.patch             |  80 ++++
 .../exiv2/exiv2/CVE-2021-37615-2.patch             | 142 ++++++
 .../exiv2/exiv2/CVE-2021-37618.patch               |  32 ++
 .../exiv2/exiv2/CVE-2021-37619.patch               |  37 ++
 .../exiv2/exiv2/CVE-2021-37620-1.patch             |  26 ++
 .../exiv2/exiv2/CVE-2021-37620-2.patch             | 306 +++++++++++++
 .../exiv2/exiv2/CVE-2021-37621-1.patch             |  25 +
 .../exiv2/exiv2/CVE-2021-37621-2.patch             | 187 ++++++++
 .../exiv2/exiv2/CVE-2021-37622-1.patch             |  25 +
 .../exiv2/exiv2/CVE-2021-37622-2.patch             |  25 +
 .../exiv2/exiv2/CVE-2026-25884.patch               |  25 +
 .../exiv2/exiv2/CVE-2026-27596-1.patch             |  58 +++
 .../exiv2/exiv2/CVE-2026-27596-2.patch             |  24 +
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb      |  13 +
 .../imagemagick/files/CVE-2025-43965.patch         |  21 +
 .../imagemagick/files/CVE-2025-66628.patch         |  23 +
 .../imagemagick/files/CVE-2025-68618.patch         |  95 ++++
 .../imagemagick/files/CVE-2026-22770.patch         |  37 ++
 .../imagemagick/files/CVE-2026-23874.patch         |  36 ++
 .../imagemagick/files/CVE-2026-23876.patch         |  63 +++
 .../imagemagick/imagemagick_7.0.10.bb              |   6 +
 .../libssh/libssh/CVE-2026-0964.patch              |  46 ++
 .../libssh/libssh/CVE-2026-0966-1.patch            |  38 ++
 .../libssh/libssh/CVE-2026-0966-2.patch            |  62 +++
 .../libssh/libssh/CVE-2026-3731.patch              |  44 ++
 meta-oe/recipes-support/libssh/libssh_0.8.9.bb     |   4 +
 .../python/python3-cbor2/CVE-2025-68131.patch      | 507 +++++++++++++++++++++
 .../recipes-devtools/python/python3-cbor2_5.4.2.bb |   1 +
 .../python/python3-werkzeug_2.1.2.bb               |   2 +-
 .../recipes-httpd/hiawatha/hiawatha_10.12.bb       |   2 +-
 .../recipes-httpd/nginx/files/CVE-2026-1642.patch  |  46 ++
 meta-webserver/recipes-httpd/nginx/nginx.inc       |   2 +
 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb |   2 -
 ...VE-2025-23016.patch => CVE-2025-23016-01.patch} |   0
 .../fcgi/fcgi/CVE-2025-23016-02.patch              |  83 ++++
 meta-webserver/recipes-support/fcgi/fcgi_git.bb    |   3 +-
 .../netdata/netdata/CVE-2023-22497.patch           | 120 +++++
 .../recipes-webadmin/netdata/netdata_1.34.1.bb     |   4 +-
 .../webmin/files/CVE-2025-67738.patch              |  37 ++
 .../recipes-webadmin/webmin/webmin_1.850.bb        |   1 +
 103 files changed, 4981 insertions(+), 20 deletions(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44441.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44442.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44443_CVE-2023-44444.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-1.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-2.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-3.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-4.patch
 create mode 100644 meta-networking/recipes-protocols/dante/dante/CVE-2024-54662.patch
 create mode 100644 meta-networking/recipes-protocols/quagga/files/CVE-2017-3224.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2021-29157.patch
 create mode 100644 meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
 create mode 100644 meta-networking/recipes-support/libconfuse/libconfuse/CVE-2022-40320.patch
 create mode 100644 meta-networking/recipes-support/memcached/memcached/CVE-2023-46852.patch
 create mode 100644 meta-networking/recipes-support/memcached/memcached/CVE-2023-46853.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2024-8645.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-13945.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-5601.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2026-0960.patch
 create mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-1.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-13699-2.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.20.bb => postgresql_14.22.bb} (71%)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
 create mode 100644 meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-32240.patch
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64503.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/CVE-2022-48337.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615-2.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37618.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37619.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37620-2.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37621-2.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37622-2.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-43965.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-66628.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-68618.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2026-22770.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2026-23874.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2026-23876.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0964.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
 rename meta-webserver/recipes-support/fcgi/fcgi/{CVE-2025-23016.patch => CVE-2025-23016-01.patch} (100%)
 create mode 100644 meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016-02.patch
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/CVE-2023-22497.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/CVE-2025-67738.patch

