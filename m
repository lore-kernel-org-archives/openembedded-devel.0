Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E32E7718B
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 12:15:58 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.81409.1735647353631589699
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Dec 2024 04:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cc/gl8na;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e479e529ebcso11806086276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 04:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735647353; x=1736252153; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JG5PC4/tlYNeN+vbV2ZsGoHlvKRkQJkCih0NQmDmBU=;
        b=cc/gl8nae4zQnvczGiuTiyCvlvtZrwO8oYX+nXkES5gQhPC6eIfy5wIQuyvDIi25Nk
         /bFgB8Umye51LtdoRNLoLX7VyKFrNxZDG5cvNYg5EXZuwa/cJATaT6XZgrfsC4X1ah/m
         Jc6cP7R3xV7pYDf7XH8olRN3YnJHc6NAfrGCg4FlCCkqcpdEKmSweL4wtimaIq4kChhU
         +q66nIb4zLQrzPDSBADfjqqrRxELrl+DeN/jzCq+Ye5eGz3SjLkBPCNdNVM5bnuzmz9w
         SnYdK0e6TM/5CWUVpJAdpneH+YbnsDExlJHkAnFGVZX/4010hK0vA3YVV16/BRu60hZV
         qu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735647353; x=1736252153;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JG5PC4/tlYNeN+vbV2ZsGoHlvKRkQJkCih0NQmDmBU=;
        b=UHmByhZW0BoC6qScaYDS3lAn5vswbTR+NUXt5+jOy/vCvuiGDWysEMJrPsiuMKFdQG
         pfLddGbc2QZXT56BKa7t4zNTo5YTOucB7pdHtd9D/hDI5HZoHpDxYqRdjCeRvNy2pYm8
         M3im3l9FgwDPUqVmk5MwqPJjU8RsFE6QKMc0+Up88KDqb/746ugWPsbullxUo5AsUUus
         Jom2FH0XNEq5ldDa3O0L9h/h8KMLnXycLAP1PCR2bvwW5+GUQiySFnhqgHd/GEkYbmex
         MOlmo5opbt54rzf49geWysjLyDJ8XQs4XWNcBT3wcXFAt9uC6eiCsrvy73DqU9u1Klx1
         9hXw==
X-Forwarded-Encrypted: i=1; AJvYcCXjEsz0IP2TLLSPiDbLsYcugXLprj5kcuNhaUionXmUykmC7EZRy7A48bS+ju6A9D07JHjRi02vwXRucAJQmXuqBkY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzffGMqTsxAUP0ZEx/FKgR/fkvSSzW7OARLvr0FCfOJs8Qxk/8A
	tpmHeovYMhRfpW+D+3sTqbSOOQBzlOKDLcLKCcMH2A4QqFUqQ9Mx
X-Gm-Gg: ASbGncvvCLBatxnIhX08HAJXAmPCpngMwAbrxMi47Pcn++zjh7m8I1LhSb1F9kxF9fU
	U/qesqn8AfToCoVwASHyS0mogZYZpv0/Szzm3Uuug0NI1/E4aVLxlyk82O5FsTDut4R+Q/TjJnA
	HEDItThC6ARbTIZn5OZyvaxmtdETRXHksH9HSE+Nzq33DpdeuGcIkuEVpb2r3Twjp9ztecmvZ7b
	wDF1Xx0BZ3MMOJ5b3VMMfpoKp5ZRSu2w27UzD1sAEp1LWs6PUr+dIajUqwf/yHFlWDBtNrGKrtp
	wWaj9JousOSf1uW0X8raE2hEXSY=
X-Google-Smtp-Source: AGHT+IECK73NfLGtC+5+or7S/QxxWYfcKoEcIJcEt9LB9AnSV8FC+cYx1dQWWOC3jr5vQTEGfVaCBg==
X-Received: by 2002:a05:690c:4443:b0:6ef:5097:5daa with SMTP id 00721157ae682-6f3f820d006mr237848497b3.34.1735647352629;
        Tue, 31 Dec 2024 04:15:52 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:c83e:ad2:5c14:ece? ([2600:1700:45dd:7000:c83e:ad2:5c14:ece])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783680csm61177687b3.100.2024.12.31.04.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 04:15:52 -0800 (PST)
Message-ID: <43576444-0a8a-4a50-baf9-5260bf0f2b33@gmail.com>
Date: Tue, 31 Dec 2024 07:15:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: Dec 31st
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 12:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114605

The following changes since commit b8d1a14f7f3b76457c36752202ea7ae5881b6654:

   freeradius: upgrade 3.2.3 -> 3.2.5 (2024-11-24 17:38:31 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 3c293e14492f01e22a64004e2330fb620c27578a:

   python3-tornado: Upgrade 6.4 -> 6.4.2 (2024-12-27 09:24:53 -0500)

----------------------------------------------------------------
AmateurECE (1):
       pipewire: Add glib-2.0-native dep for bluez5

Chen Qi (1):
       protobuf: fix CVE-2024-7254

Fabrice Aeschbacher (1):
       mosquitto: upgrade 2.0.18 -> 2.0.19

Jiaying Song (1):
       xmlsec1: Switch SRC_URI to use github release

Khem Raj (2):
       ndisc: Remove buildpaths from binaries
       ndisc6: Fix reproducible build

Leon Anavi (1):
       sip: Upgrade 6.8.3 -> 6.8.6

Libo Chen (1):
       grpc: Fix CVE-2024-7246

Soumya Sambu (2):
       python3-werkzeug: upgrade 3.0.3 -> 3.0.6
       python3-tornado: Upgrade 6.4 -> 6.4.2

Wang Mingyu (2):
       redis: upgrade 7.2.4 -> 7.2.5
       mosquitto: upgrade 2.0.19 -> 2.0.20

Yi Zhao (2):
       hostapd: Security fix for CVE-2023-52160
       redis: upgrade 7.2.5 -> 7.2.6

Yogita Urade (2):
       php: upgrade 8.2.20 -> 8.2.24
       postgresql: upgrade 16.4 -> 16.5

Zhang Peng (6):
       frr: fix CVE-2024-34088
       frr: fix CVE-2024-31950
       frr: fix CVE-2024-31951
       frr: fix CVE-2024-31948
       frr: fix CVE-2024-31949
       libgsf: upgrade 1.14.52 -> 1.14.53

hongxu (1):
       p7zip: fix CVE-2023-52169 and CVE-2023-52168

  .../libgsf/{libgsf_1.14.52.bb => libgsf_1.14.53.bb} |   4 +-
  meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb   | 2 +-
  meta-networking/recipes-connectivity/mosquitto/files/1571.patch | 22 -
  meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 25 -
  .../mosquitto/{mosquitto_2.0.18.bb => mosquitto_2.0.20.bb} |   4 +-
  meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch  | 130 
+++++
  meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch  | 163 
++++++
  meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch  | 68 +++
  meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch  | 110 ++++
  meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch  | 83 +++
  meta-networking/recipes-protocols/frr/frr_9.1.bb                | 5 +
  ...1-Remove-use-of-variables-indicating-buildtime-informa.patch | 85 +++
  meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb          | 5 +
  .../recipes-connectivity/hostapd/hostapd/CVE-2023-52160.patch   | 198 
+++++++
  meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb            | 1 +
  .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6 +-
  .../postgresql/{postgresql_16.4.bb => postgresql_16.5.bb} |   2 +-
  meta-oe/recipes-devtools/grpc/grpc/CVE-2024-7246.patch          | 420 
+++++++++++++++
  meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb                    | 1 +
  .../php/php/0001-ext-opcache-config.m4-enable-opcache.patch     | 15 +-
  meta-oe/recipes-devtools/php/{php_8.2.20.bb => php_8.2.24.bb} |   2 +-
  ...1-Add-recursion-check-when-parsing-unknown-fields-in-J.patch | 794 
++++++++++++++++++++++++++++
  meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb            | 1 +
  meta-oe/recipes-devtools/sip/{sip_6.8.3.bb => sip_6.8.6.bb} |   8 +-
  .../files/0001-Fix-two-buffer-overflow-vulnerabilities.patch    | 455 
++++++++++++++++
  meta-oe/recipes-extended/p7zip/p7zip_16.02.bb                   | 1 +
  .../0001-hiredis-use-default-CC-if-it-is-set.patch}             | 7 +-
  ...-lua-update-Makefile-to-use-environment-build-setting.patch} | 6 +-
  .../0003-hack-to-force-use-of-libc-malloc.patch}                | 7 +-
  .../0004-src-Do-not-reset-FINAL_LIBS.patch}                     | 4 +-
  ...5-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} | 6 +-
  .../0006-Define-correct-gregs-for-RISCV32.patch                 | 4 +-
  .../redis/{redis-7.2.4 => redis-7.2.6}/init-redis-server |   0
  .../redis/{redis-7.2.4 => redis-7.2.6}/redis.conf |   0
  .../redis/{redis-7.2.4 => redis-7.2.6}/redis.service |   0
  .../recipes-extended/redis/{redis_7.2.4.bb => redis_7.2.6.bb} |  17 +-
  meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb                | 2 +-
  .../python/{python3-tornado_6.4.bb => python3-tornado_6.4.2.bb} |   4 +-
  .../{python3-werkzeug_3.0.3.bb => python3-werkzeug_3.0.6.bb} |   2 +-
  39 files changed, 2572 insertions(+), 97 deletions(-)
  rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.52.bb => 
libgsf_1.14.53.bb} (72%)
  delete mode 100644 
meta-networking/recipes-connectivity/mosquitto/files/1571.patch
  delete mode 100644 
meta-networking/recipes-connectivity/mosquitto/files/2894.patch
  rename 
meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.18.bb => 
mosquitto_2.0.20.bb} (95%)
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
  create mode 100644 
meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch
  create mode 100644 
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2023-52160.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_16.4.bb => 
postgresql_16.5.bb} (86%)
  create mode 100644 meta-oe/recipes-devtools/grpc/grpc/CVE-2024-7246.patch
  rename meta-oe/recipes-devtools/php/{php_8.2.20.bb => php_8.2.24.bb} (99%)
  create mode 100644 
meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch
  rename meta-oe/recipes-devtools/sip/{sip_6.8.3.bb => sip_6.8.6.bb} (64%)
  create mode 100644 
meta-oe/recipes-extended/p7zip/files/0001-Fix-two-buffer-overflow-vulnerabilities.patch
  rename 
meta-oe/recipes-extended/redis/{redis-7.2.4/hiredis-use-default-CC-if-it-is-set.patch 
=> redis-7.2.6/0001-hiredis-use-default-CC-if-it-is-set.patch} (95%)
  rename 
meta-oe/recipes-extended/redis/{redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch 
=> 
redis-7.2.6/0002-lua-update-Makefile-to-use-environment-build-setting.patch} 
(97%)
  rename 
meta-oe/recipes-extended/redis/{redis-7.2.4/oe-use-libc-malloc.patch => 
redis-7.2.6/0003-hack-to-force-use-of-libc-malloc.patch} (94%)
  rename 
meta-oe/recipes-extended/redis/{redis-7.2.4/0001-src-Do-not-reset-FINAL_LIBS.patch 
=> redis-7.2.6/0004-src-Do-not-reset-FINAL_LIBS.patch} (92%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.4/GNU_SOURCE-7.patch 
=> 
redis-7.2.6/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} 
(88%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.4 => 
redis-7.2.6}/0006-Define-correct-gregs-for-RISCV32.patch (97%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.4 => 
redis-7.2.6}/init-redis-server (100%)
  mode change 100755 => 100644
  rename meta-oe/recipes-extended/redis/{redis-7.2.4 => 
redis-7.2.6}/redis.conf (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.2.4 => 
redis-7.2.6}/redis.service (100%)
  rename meta-oe/recipes-extended/redis/{redis_7.2.4.bb => 
redis_7.2.6.bb} (81%)
  rename meta-python/recipes-devtools/python/{python3-tornado_6.4.bb => 
python3-tornado_6.4.2.bb} (90%)
  rename meta-python/recipes-devtools/python/{python3-werkzeug_3.0.3.bb 
=> python3-werkzeug_3.0.6.bb} (90%)


