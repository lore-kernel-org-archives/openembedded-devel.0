Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4B1EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 11:10:23 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.5028.1687173013006802829
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 04:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OE828Ztf;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-39cd0c3e8deso2143779b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 04:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687173012; x=1689765012;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVkAoooNqKZL8Jbj33SKSCdL10FVUvGJ/n64HhTYJfY=;
        b=OE828ZtfujYfYZSvIsx7HL8ODr1oYoVHTx6La3cE9gXHs2b8epkRh9DGFHDj4clKAi
         0OSJFfWhr3OtECmWGSoVfkTfAoaICyzZGpmgOXf7FRKFaqkdoMniiI3xvuemy9ijNPaN
         DYwDdG/+SM417KhnnzGkjqcQRwxJ1EKWV/0xDHYWckjN2quezdsWRBr3zBGXzRSe5lZ/
         7ebQ6x1a3zIyUVzbYP7i85OxUHcUKQEVhDSfH3Xr3qmpNxLTg5OwPyuEQ63HG6bMGB0u
         kKvY7dYbHyyzOAXqI+bjhrFAJqt71j/jocKGdbhKcyLPUFYhpARRDs9JxonUUIcJIpWm
         qAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687173012; x=1689765012;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mVkAoooNqKZL8Jbj33SKSCdL10FVUvGJ/n64HhTYJfY=;
        b=GdDhe8dAcAf111+AtalnKhW4Qzvi++8WS/qDHHUmSBgWxPxRP2+uik+RAMleMx01NM
         PLKSlyWHhYUQbTsS8X7TG9y3I1jh98DSCYdoOA1667c8AAoEBTQK4zEszm4qxHDDLK1N
         Bg3spCl6ujk80mr0dSovUUWuyD0NLNKeSzZ0uIn08CSFYhqz8prkqg5M50Wl38ClmZd8
         RdzCdbXk0dynzjWukQFROFymfFuFv5FjQ7zzLnNkscpxTNTL2hj/tov/AEJur90TlTUF
         aviErRKURcbanHDBO8Z4YGnduk6f04B/Yyak9F4MX3yBaqeh0QCjDgt+xbH0KR2MuW/H
         SvsQ==
X-Gm-Message-State: AC+VfDwyO+MEMr0G16whCKugRQFL9clTr1gOqNd3szbF7vd5iMXq/MFZ
	bWh/9aM25els0ZWOJ4aGNNkNJ+tVpZk=
X-Google-Smtp-Source: ACHHUZ5s2tO0yECKb+YR1/2pgNEkhdTxrrwottnUZoirlUOnZ34bNqczx37CnkOeszeMaU7eU8LRbw==
X-Received: by 2002:a05:6808:1986:b0:39e:c872:b5bb with SMTP id bj6-20020a056808198600b0039ec872b5bbmr3552850oib.14.1687173012145;
        Mon, 19 Jun 2023 04:10:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:c3d0:ee42:2807:16d4? ([2600:1700:9190:ba10:c3d0:ee42:2807:16d4])
        by smtp.gmail.com with ESMTPSA id w138-20020a814990000000b005731f3c8989sm1123366ywa.62.2023.06.19.04.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 04:10:11 -0700 (PDT)
Message-ID: <8f1fd184-4efb-e493-f561-f472a4f955ac@gmail.com>
Date: Mon, 19 Jun 2023 07:10:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickledore merge request: June 19th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 11:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103382

The following changes since commit 928658212611ea457a5eacec48f0760e03269a24:

   gnulib: Update recipe name to 2018-12-18 (2023-05-31 10:50:50 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to 5a01ab461c9bcabcbb2298236602373948f8f073:

   wireshark: CVE-2023-2952 XRA dissector infinite loop (2023-06-17 
13:15:57 -0400)

----------------------------------------------------------------
Chen Qi (1):
       redis: use the files path correctly

Hitendra Prajapati (3):
       wireshark: Fix CVE-2023-2855 & CVE-2023-2856
       wireshark: Fix CVE-2023-2858 & CVE-2023-2879
       wireshark: CVE-2023-2952 XRA dissector infinite loop

Joe Slater (1):
       libgpiod: modify test 'gpioset: toggle (continuous)'

Khem Raj (2):
       fftw: Check for TOOLCHAIN_OPTIONS to be non-empty before sed ops
       system-config-printer: Delete __pycache__ files

Ross Burton (5):
       glade: add autoconf-archive-native DEPENDS
       libgxim: add autoconf-archive-native DEPENDS
       libblockdev: clean up DEPENDS
       imsettings: add missing DEPENDS on autoconf-archive-native
       system-config-printer: clean up DEPENDS

Urade, Yogita t.mo (1):
       c-ares: fix CVE-2023-32067

Xiangyu Chen (2):
       libbpf: installing uapi headers for native package
       meta-oe: add pahole to NON_MULTILIB_RECIPES

  .../system-config-printer/system-config-printer_1.5.18.bb       | 13 +++-
  .../recipes-support/wireshark/files/CVE-2023-2855.patch         | 108 
++++++++++++++++++++++++++++
  .../recipes-support/wireshark/files/CVE-2023-2856.patch         | 69 
++++++++++++++++++
  .../recipes-support/wireshark/files/CVE-2023-2858.patch         | 95 
++++++++++++++++++++++++
  .../recipes-support/wireshark/files/CVE-2023-2879.patch         | 37 
++++++++++
  .../recipes-support/wireshark/files/CVE-2023-2952.patch         | 98 
+++++++++++++++++++++++++
  meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 5 ++
  meta-oe/conf/layer.conf                                         | 2 +-
  meta-oe/recipes-devtools/glade/glade_3.22.2.bb                  | 1 +
  meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb        | 6 +-
  meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb               | 2 +-
  .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
  .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
  .../redis/{redis-7 => redis-7.0.11}/GNU_SOURCE-7.patch |   0
  .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
  .../redis/{redis-7 => redis-7.0.11}/init-redis-server |   0
  .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
  .../redis/{redis-7 => redis-7.0.11}/oe-use-libc-malloc.patch |   0
  .../recipes-extended/redis/{redis-7 => redis-7.0.11}/redis.conf |   0
  .../redis/{redis-7 => redis-7.0.11}/redis.service |   0
  meta-oe/recipes-extended/redis/redis_7.0.11.bb                  | 2 -
  meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb                   | 5 ++
  meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch      | 87 
++++++++++++++++++++++
  meta-oe/recipes-support/c-ares/c-ares_1.19.0.bb                 | 4 +-
  meta-oe/recipes-support/fftw/fftw_3.3.10.bb                     | 2 +-
  .../libgpiod/libgpiod-2.0/gpio-tools-test-bats-modify.patch     | 67 
+++++++++++++++++
  meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb                | 2 +
  meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb       | 2 +-
  28 files changed, 596 insertions(+), 11 deletions(-)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2855.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2858.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2879.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/GNU_SOURCE-7.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/hiredis-use-default-CC-if-it-is-set.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/init-redis-server (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/lua-update-Makefile-to-use-environment-build-setting.patch 
(100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/oe-use-libc-malloc.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/redis.conf (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/redis.service (100%)
  create mode 100644 
meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
  create mode 100644 
meta-oe/recipes-support/libgpiod/libgpiod-2.0/gpio-tools-test-bats-modify.patch


