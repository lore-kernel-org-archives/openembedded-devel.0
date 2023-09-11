Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E6CEE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 11:13:10 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.55931.1694430786102119792
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Sep 2023 04:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=s3zjxuEO;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-58dce1f42d6so74697067b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 04:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694430785; x=1695035585; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEXXhw9HT4PpHxp1vmvRcHksDGqZN7+GbZcOg02MtlI=;
        b=s3zjxuEOyF51tl8hQgHiNiQpvTDsbsSpaaLxXYRVBi0V6uKnkRcl57P/FTgRFV+dQ7
         LL4MuM+ooTfI3+gJmMkcBDVhp9B+vNgoXJMGeHUKjd4UVOQaoeKMTJ/yxEQytEaDYYV8
         xBmeWM7sU/G2T7O4X+BO2nPI6uGjC5DvfSX24zOf/MbfoVFcC86JeHwchJoUmdyaNd1B
         mXOAWuqiSXhocjQ0oUufZHnGduSvdoZk45PCR0SBd7udde/h6EjSV4hw5cexyI/7yTUt
         aGz1hs8eZExFZgi1W2GnNS0Wuiq1OfaQhbewHAWEhf4dNHjxJtFWqJCOiupLknBSXn1C
         o1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430785; x=1695035585;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JEXXhw9HT4PpHxp1vmvRcHksDGqZN7+GbZcOg02MtlI=;
        b=BLfcOPuFMsk7cXRU44heWP4P4sDDYjp2hKpN0lRyXgt6FDRXBgtMwtZ9PhvL2dLZa8
         NEfITqf4xnxK/Hi4aqxQYNdDvKaseNII3iJs9/wUMhzPl1GBw1o+vvBKP65kOL0ow54w
         7dSX+7JanhoDEX7jSXFMZlvUMvtN7v25CpeJ6s0BXdJepGn8fqbzskYtWR4VcWQfG3dj
         FqOW9pqOo4FafD1uNTvSC1pw3ExBXVpKXaDbXUwCD8CRurztlz+5zUdvT1dQALT4WEoa
         LQWEMY3uqaR4XC0eFq+bUL8efpai9okBEx1N21sJUfY1JGbMBKEN25o+NbyUwloBQkc0
         XrEQ==
X-Gm-Message-State: AOJu0YyWjT9Ie5TNelSxFHzB5Lnyrg0BpUOseHR4DensNdmKRs9hmz0U
	whbpFWGpnxZktxTv1aFMohA=
X-Google-Smtp-Source: AGHT+IEtdmGVjDt3h+81ZY73D2Hu1NHql83YxtT3bL8HE75Vp/1lejjruC55Q8Ab/ls6kwqRPcPx5A==
X-Received: by 2002:a0d:cc46:0:b0:56f:f0db:759a with SMTP id o67-20020a0dcc46000000b0056ff0db759amr11506844ywd.13.1694430785233;
        Mon, 11 Sep 2023 04:13:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:d725:4d6d:c490:bc1? ([2600:1700:9190:ba10:d725:4d6d:c490:bc1])
        by smtp.gmail.com with ESMTPSA id y190-20020a0dd6c7000000b00589f4021f84sm1915930ywd.37.2023.09.11.04.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:13:04 -0700 (PDT)
Message-ID: <9c4a9d38-5e62-f2d5-a0cf-60511b7912dc@gmail.com>
Date: Mon, 11 Sep 2023 07:13:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell pull request: Sept 11th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 11:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104838

The following changes since commit b8b0b06821d4d4df0cce4f07fa31a8ca1dd38f46:

   sysdig: Depend on system libb64 (2023-07-22 07:49:35 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to e42d1e758f9f08b98c0e8c6f0532316951bb276f:

   postgresql: refresh patches (2023-09-09 12:52:03 -0400)

----------------------------------------------------------------
Armin Kuster (1):
       postgresql: refresh patches

Ashish Sharma (1):
       php: Backport fix CVE-2023-3247

Khem Raj (1):
       nodejs: Fix build with gcc13

Martin Jansa (1):
       nodejs-14: add -fpermissive BUILD_CXXFLAGS to fix build with 
gcc-13 on host

Robert Joslyn (1):
       postgresql: Update to 12.16

Sourav Kumar Pramanik (1):
       meta-oe-components: Avoid usage of nobranch=1

Sourav Pramanik (2):
       rapidjson: Avoid usage of nobranch=1
       nlohmann-json: Avoid usage of nobranch=1

Vijay Anusuri (1):
       c-ares: CVE-2023-32067 0-byte UDP payload Denial of Service

  .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb   | 2 +-
  .../postgresql/files/0001-Add-support-for-RISC-V.patch          | 13 +-
  .../postgresql/files/0001-Improve-reproducibility.patch         | 13 +-
  meta-oe/recipes-dbs/postgresql/files/CVE-2022-1552.patch        | 947 
----------------------------
  meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625.patch        | 904 
--------------------------
  meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch       | 48 --
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch        | 235 
-------
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch        | 118 ----
  meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch    | 13 +-
  meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch     | 38 --
  meta-oe/recipes-dbs/postgresql/postgresql_12.16.bb              | 11 +
  meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb               | 17 -
  meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb   | 2 +-
  meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch              | 63 ++
  meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb              | 1 +
  meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb               | 4 +
  meta-oe/recipes-devtools/php/php/CVE-2023-3247-1.patch          | 87 +++
  meta-oe/recipes-devtools/php/php/CVE-2023-3247-2.patch          | 29 +
  meta-oe/recipes-devtools/php/php_7.4.33.bb                      | 2 +
  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb             | 2 +-
  meta-oe/recipes-extended/zstd/zstd_1.4.5.bb                     | 2 +-
  meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch      | 84 +++
  meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                 | 1 +
  23 files changed, 301 insertions(+), 2335 deletions(-)
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2022-1552.patch
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625.patch
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
  create mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_12.16.bb
  delete mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2023-3247-1.patch
  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2023-3247-2.patch
  create mode 100644 
meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch


