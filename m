Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247C8C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 12:09:30 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.6102.1678882161939880679
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 05:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FqPoB3YJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id f1so16137055qvx.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678882161;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi1WL8XiAVM71UmOaG6uzdclC816npYCQlth0kbSYxc=;
        b=FqPoB3YJmskRfQk439o3eeT+qRuYyNOiP6z0UVPqWZ1ez4Qmbz5C6JmTg7n7PT+YaD
         QVEUiDuMHmbUDmHibIyQcZKyqEuel2b6rLBKuCz68cixCZccPgXNOwhuOLe221y8pHqr
         LZKCAaSCvGL9rhMoJX68JEEeNtE24CFnAKaesWh5oxYrBebvv8FE0W9vs7DuLRt/+DJp
         RKU3mLpmmAMIf2qbzKtqAcjQ/h3DqQ6l3kj7pefsa/GLWAWPEbuVqzP6nEBe2/o4ONU8
         QNjlOLc09XYHWdoCeue4OGW0iraWwwUb1FCVdD1B+yUuORvJ43NW8m2txOWCZFDE9mBw
         nUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678882161;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zi1WL8XiAVM71UmOaG6uzdclC816npYCQlth0kbSYxc=;
        b=pa7ZZA33w9AC+1DZsa/1Fs+/6NiJci4NdGmvZztfB50TiN4JJx6yP0xmU2MqpnLuxq
         nT4j59hWIfFMeN17vXzKm/05IzKfUJRHcY90gQHETbtfCvezw/Lpalv0BPJO8lbQpgWA
         wS7r8yesZC3+t4rnkIiVkX/jBHamW3FHouMQbIMq1LhlBJcUykj6sF5ZQBGPDWxhVPWU
         jseGkBghgCyuacnSH0zefiSSK+RrGkal5jHzQ0x2N3GJaxe+KG92Ej7R1sNTq61vZdUe
         ePy6JJ7awlNFG506/iOOJxK2T+XUZZkhr7oQ3zKacGqFuusOxDzy6rUzldceX5/ipPRR
         N0Mg==
X-Gm-Message-State: AO0yUKWviRCU26guJUEvvVLHi9JT1MpSTG4wmQRUhYbjcEyO6fHdQXZX
	GQXPVEn+AfSoln4zCCE39xnyktqK0LE=
X-Google-Smtp-Source: AK7set8ECVrdt2BFfC7E+Z9GgKQDzYn/itiCa57L9V4eEMq5CnodX4I1x7o7U1aBU38vgt25evSuFg==
X-Received: by 2002:ac8:5fcc:0:b0:3bf:a4b4:cc6 with SMTP id k12-20020ac85fcc000000b003bfa4b40cc6mr29548058qta.25.1678882160874;
        Wed, 15 Mar 2023 05:09:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:1a66:139c:5bc3:8376? ([2600:1700:9190:ba10:1a66:139c:5bc3:8376])
        by smtp.gmail.com with ESMTPSA id s67-20020a372c46000000b0073b8745fd39sm3571972qkh.110.2023.03.15.05.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 05:09:20 -0700 (PDT)
Message-ID: <b385804f-5528-518a-ef4a-f206487eab5f@gmail.com>
Date: Wed, 15 Mar 2023 08:09:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Mar 15th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 12:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101535

The following changes since commit 82c75b466e55d7dca7a2364986ecb704cf63d141:

   phoronix-test-suite: Fix CVE-2022-40704 (2023-02-16 07:30:46 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 9cf4ebeb3de524009a73f49722489dc4aa183adb:

   nodejs: Upgrade 16.19.0 -> 16.19.1 (2023-03-13 08:58:37 -0400)

----------------------------------------------------------------
Andrej Valek (1):
       grpc: upgrade 1.46.6 -> 1.46.7

Changqing Li (4):
       liblockfile: fix do_install failure when ldconfig is not installed
       postgresql: fix CVE-2022-41862
       redis: upgrade 7.0.7 -> 7.0.9
       redis: upgrade 6.2.8 -> 6.2.11

Chee Yang Lee (1):
       cifs-utils: fix CVE-2022-27239 CVE-2022-29869

Dmitry Baryshkov (1):
       nss: fix cross-compilation error

Geoff Parker (1):
       python3-pillow: add tk to RDEPENDS ptest pkg only if x11 in 
DISTRO_FEATURES

Khem Raj (4):
       mpd: Update to 0.23.8
       mpd: Upgrade to 0.23.9
       ncmpc: Upgrade to 0.47
       mpd: Upgrade to 0.23.12 release

Martin Jansa (2):
       exiv2: fix SRC_URI
       mdns: use git fetcher

Mingli Yu (1):
       php: Upgrade to 8.1.16

Polampalli, Archana (1):
       nodejs: Upgrade 16.19.0 -> 16.19.1

Preeti Sachan (1):
       fluidsynth: update SRC_URI to remove non-existing 2.2.x branch

Tom Hochstein (1):
       nlohmann-json: Allow empty main package for SDK

Urade, Yogita (2):
       multipath-tools: fix CVE-2022-41974
       poppler: fix CVE-2021-30860

  meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc    | 2 +-
  .../musicpd/{mpd_0.23.6.bb => mpd_0.23.12.bb} |   2 +-
  ...1-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch | 37 
++++++
  .../recipes-multimedia/musicpd/{ncmpc_0.46.bb => ncmpc_0.47.bb} |   3 +-
  .../0001-Create-subroutine-for-cleaning-recent-interfaces.patch | 0
  .../{files => mdns}/0001-dns-sd-Include-missing-headers.patch |   0
  .../{files => mdns}/0001-mdns-include-stddef.h-for-NULL.patch |   0
  .../0002-Create-subroutine-for-tearing-down-an-interface.patch  | 0
  .../0002-mdns-cross-compilation-fixes-for-bitbake.patch         | 0
  .../{files => mdns}/0003-Track-interface-socket-family.patch |   0
  .../{files => mdns}/0004-Use-list-for-changed-interfaces.patch |   0
  .../mdns/{files => mdns}/0006-Remove-unneeded-function.patch |   0
  .../mdns/mdns/0006-make-Add-top-level-Makefile.patch            | 175 
++++++++++++++++++++++++++++
  .../0008-Mark-deleted-interfaces-as-being-changed.patch         | 0
  .../{files => mdns}/0009-Fix-possible-NULL-dereference.patch |   0
  .../{files => mdns}/0010-Handle-errors-from-socket-calls.patch |   0
  ...011-Change-a-dynamic-allocation-to-file-scope-variable.patch | 0
  .../recipes-protocols/mdns/{files => mdns}/mdns.service |   0
  meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb       | 44 
++++---
  meta-networking/recipes-support/cifs/cifs-utils_6.14.bb         | 5 +-
  meta-networking/recipes-support/cifs/files/CVE-2022-27239.patch | 40 
+++++++
  meta-networking/recipes-support/cifs/files/CVE-2022-29869.patch | 48 
++++++++
  ...1-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch | 50 
++++++++
  meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb               | 1 +
  .../recipes-devtools/grpc/{grpc_1.46.6.bb => grpc_1.46.7.bb} |   2 +-
  meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb  | 2 +-
  .../nodejs/{nodejs_16.19.0.bb => nodejs_16.19.1.bb} |   2 +-
  meta-oe/recipes-devtools/php/{php_8.1.12.bb => php_8.1.16.bb} |   2 +-
  ...1-Makefile.in-fix-install-failure-on-host-without-ldco.patch | 63 
++++++++++
  meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb        | 1 +
  .../recipes-extended/redis/{redis_6.2.8.bb => redis_6.2.11.bb} |   2 +-
  .../recipes-extended/redis/{redis_7.0.7.bb => redis_7.0.9.bb} |   2 +-
  meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb                   | 2 +-
  .../recipes-support/multipath-tools/files/CVE-2022-41974.patch  | 164 
++++++++++++++++++++++++++
  .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 1 +
  .../nss/nss/0001-nss-fix-support-cross-compiling.patch          | 7 +-
  .../poppler/0001-JBIG2Stream-Fix-crash-on-broken-file.patch     | 41 
+++++++
  meta-oe/recipes-support/poppler/poppler_22.04.0.bb              | 1 +
  meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb     | 2 +-
  39 files changed, 672 insertions(+), 29 deletions(-)
  rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.6.bb => 
mpd_0.23.12.bb} (98%)
  create mode 100644 
meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch
  rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.46.bb => 
ncmpc_0.47.bb} (92%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0001-Create-subroutine-for-cleaning-recent-interfaces.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0001-dns-sd-Include-missing-headers.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0001-mdns-include-stddef.h-for-NULL.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0002-Create-subroutine-for-tearing-down-an-interface.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0002-mdns-cross-compilation-fixes-for-bitbake.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0003-Track-interface-socket-family.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0004-Use-list-for-changed-interfaces.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0006-Remove-unneeded-function.patch (100%)
  create mode 100644 
meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0008-Mark-deleted-interfaces-as-being-changed.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0009-Fix-possible-NULL-dereference.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0010-Handle-errors-from-socket-calls.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/mdns.service (100%)
  create mode 100644 
meta-networking/recipes-support/cifs/files/CVE-2022-27239.patch
  create mode 100644 
meta-networking/recipes-support/cifs/files/CVE-2022-29869.patch
  create mode 100644 
meta-oe/recipes-dbs/postgresql/files/0001-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch
  rename meta-oe/recipes-devtools/grpc/{grpc_1.46.6.bb => 
grpc_1.46.7.bb} (98%)
  rename meta-oe/recipes-devtools/nodejs/{nodejs_16.19.0.bb => 
nodejs_16.19.1.bb} (98%)
  rename meta-oe/recipes-devtools/php/{php_8.1.12.bb => php_8.1.16.bb} (99%)
  create mode 100644 
meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch
  rename meta-oe/recipes-extended/redis/{redis_6.2.8.bb => 
redis_6.2.11.bb} (96%)
  rename meta-oe/recipes-extended/redis/{redis_7.0.7.bb => 
redis_7.0.9.bb} (96%)
  create mode 100644 
meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/0001-JBIG2Stream-Fix-crash-on-broken-file.patch


