Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BBAC87FCE
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 18:40:31 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.65145.1753641624527322507
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jul 2025 11:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TB37g1bF;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-719f5a141a3so5973617b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jul 2025 11:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753641624; x=1754246424; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQ96uQyEfJJaZWvA9oD/oR6ocH28S4TLtDLabyEmGfE=;
        b=TB37g1bF4AsyJ4H01pXU9x6hGXqKNQusuWXL/YpAVj9DIcbQRbLJJDxZUFhtZ+ueuc
         ex63NII+Ggmkl9P+0NXkYk8GxDA7UxPNWRDVjJ51poleyrIKyzIE7tuj6/Q+F11OGm7i
         1HWVEDRWEc111Ab8NBC1+cq2vJFhH4vRMDLhzvu9zOobzCUHQhyvkZmDCMwcBZeS+W5s
         Gsk238etoNUr/KiguLekjiuL5TTFPmVr/6nEjWCQTl14061WjpoouOlcQAABeYuBzEbR
         j37RuytVsmdh3zT8g0pCTpZ5g+X03CPm/5J85/DIe34o7QgJrznpZ9RXuplEJNkplLWP
         mhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753641624; x=1754246424;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQ96uQyEfJJaZWvA9oD/oR6ocH28S4TLtDLabyEmGfE=;
        b=PS5Jf3iuXgDgm0aUuZWJVsJZJMffwU2ogWbsVgI29W/iX25ZsmGeMqEcTMNN4tbcQy
         0s8i5JP2QDwk2p3B4xxIRnaWJEE9hw+mNoNeMPfwMCW6Kx+t7vrQcBSEWcpyyzmTjBmh
         faOUg2mW9V/aeuadyNpQ4YOeFonaqZU4G0AvGRzNtcDpj3T1m7Gr6tPrXY/H5UbGC/tC
         V7UZnl1gh254gFi21AnPvPbTZtzTgx2F70db1OLrW8YHjjdMM/ioBZRs0K0X01+ji8Aw
         32wQqmYiGbSk0EmWMmb72p8JMyEizkSjUmBKmvQubRXoe5dvvaMqAZPYw4+gVMzvOYXl
         7mQA==
X-Forwarded-Encrypted: i=1; AJvYcCXVgSqkwbrn84xryZUfPDkhLbo3opojgcBj41Y9VNArD2QhwtfLLUWknmGg4PIEMFvHYiBamjguOE/w7ws1GE/jO6M=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4zs9s88QA7gL5gF9F6pt7AembjzhLkXCVYcmxevDzaur9Ry9/
	HkRQfVO/yFLWi+fXptWvhdXorYbeR9BwO8SxRomb/fSsfLivDFebG0Jl
X-Gm-Gg: ASbGnctbqXirpI6aFAbArqA05Yfnts1Nxolcf+PZOLBQC26kHk6fPWzVgcqJ3UDUfBc
	8UQXo29q4b9RjDlAA+th6SCT6h2sGxtkxGnrJCUXlCx6+RYsGRyER4AgZ2DW/+yTS1vRCB2KPCH
	RvmE/JpYlbYn142z0PspwEEQbFaqfmywuB2pC2Nc8YfFyx8gYsT7Xu6VRNL9jjaxDyDy6D7N/lt
	uzjVil8Rlp62ucqp03VL2/EnOpQTiOE+Ypp+DHo5Y0E0jz+eIyj/sf0JabFsa1jIqJovwVAAEGQ
	Fas1iYPAjHk+Fceryq8X3yYrigW/qv18zJvwOITADWjfG7t/xktw5oFCaokjrEZmXxVxp9/isRQ
	Cb/nVMJunInjvfn07eHnGZdg+hoMSrVc=
X-Google-Smtp-Source: AGHT+IE+kbV1CN4URaZonvd97P9wDDgJK2YB8hHPbWFhhRcIehYuiUQPEoTOt8E+2T/m6rn4yKvQ9A==
X-Received: by 2002:a05:690c:91:b0:713:ffaa:5767 with SMTP id 00721157ae682-719ce7e164amr160600787b3.7.1753641622717;
        Sun, 27 Jul 2025 11:40:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000::19? ([2600:1700:45dd:7000::19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-719f2408089sm9299917b3.90.2025.07.27.11.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 11:40:22 -0700 (PDT)
Message-ID: <4341066e-e2d3-4636-b0e2-76cb44047e18@gmail.com>
Date: Sun, 27 Jul 2025 14:40:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: walnscar merge request: July 27th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Jul 2025 18:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118743

The following changes since commit c009244a045923a9dfc32d7f2996cb61629870f6:

   udisks2: Hardening measure of CVE-2025-6019 (2025-07-06 19:23:22 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded walnascar-next

for you to fetch changes up to dca497d728792e3cb655c78455c2d649af312ce8:

   ][PATCH] ufs-utils: fix crash for ufs-utils list_bsg (2025-07-27 
14:35:10 -0400)

----------------------------------------------------------------
Jiaying Song (1):
       python3-aiohttp: fix CVE-2025-53643

Martin Jansa (1):
       xmlsec1: fix build with gnutls or openssl PACKAGECONFIG not enabled

Peter Marko (4):
       libcoap: patch CVE-2024-31031
       spdlog: patch CVE-2025-6140
       minifi-cpp: patch spdlog CVE-2025-6140
       poco: patch CVE-2025-6375

Praveen Kumar (2):
       syslog-ng: upgrade 4.8.1 -> 4.8.2
       python3-tornado: upgrade 6.4.2 -> 6.5

Wang Mingyu (1):
       mbedtls: upgrade 3.6.3 -> 3.6.3.1

Yi Zhao (1):
       ][PATCH] ufs-utils: fix crash for ufs-utils list_bsg

Yogita Urade (2):
       poppler: upgrade 25.04.0 -> 25.06.0
       mariadb: upgrade 11.4.5 -> 11.4.6

gudni (1):
       mbedtls: upgrade 3.6.3.1 -> 3.6.4

  ...1-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch | 39 +++
  meta-filesystems/recipes-utils/ufs-utils/ufs-utils_4.13.5.bb    | 1 +
  .../mbedtls/{mbedtls_3.6.3.bb => mbedtls_3.6.4.bb} |   7 +-
  .../recipes-devtools/libcoap/libcoap/CVE-2024-31031.patch       | 82 +++++
  meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb       | 1 +
  .../{mariadb-native_11.4.5.bb => mariadb-native_11.4.6.bb} |   0
  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 4 +-
  .../mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch  | 40 +--
  meta-oe/recipes-dbs/mysql/mariadb/3871.patch                    | 29 --
  meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch               | 23 --
  .../recipes-dbs/mysql/{mariadb_11.4.5.bb => mariadb_11.4.6.bb} |   0
  meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch   | 46 +++
  meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb        | 1 +
  meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch           | 34 ++
  meta-oe/recipes-support/poco/poco_1.13.3.bb                     | 1 +
  .../poppler/{poppler_25.04.0.bb => poppler_25.06.0.bb} |   2 +-
  meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch       | 46 +++
  meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb                 | 4 +-
  .../syslog-ng/{syslog-ng_4.8.1.bb => syslog-ng_4.8.2.bb} |   2 +-
  meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb                | 2 +-
  .../python/python3-aiohttp/CVE-2025-53643.patch                 | 526 
++++++++++++++++++++++++++++
  meta-python/recipes-devtools/python/python3-aiohttp_3.11.16.bb  | 2 +
  .../python/{python3-tornado_6.4.2.bb => python3-tornado_6.5.bb} |   2 +-
  23 files changed, 806 insertions(+), 88 deletions(-)
  create mode 100644 
meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.3.bb 
=> mbedtls_3.6.4.bb} (94%)
  create mode 100644 
meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-31031.patch
  rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.5.bb => 
mariadb-native_11.4.6.bb} (100%)
  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/3871.patch
  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
  rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.5.bb => 
mariadb_11.4.6.bb} (100%)
  create mode 100644 
meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch
  create mode 100644 meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch
  rename meta-oe/recipes-support/poppler/{poppler_25.04.0.bb => 
poppler_25.06.0.bb} (96%)
  create mode 100644 
meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch
  rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.8.1.bb => 
syslog-ng_4.8.2.bb} (98%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
  rename meta-python/recipes-devtools/python/{python3-tornado_6.4.2.bb 
=> python3-tornado_6.5.bb} (93%)


