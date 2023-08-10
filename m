Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35C4C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:17:46 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.18236.1691677060606738186
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FLaJVRP+;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-687ca37628eso845282b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 07:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691677060; x=1692281860;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aj2WLFF8Y8ANb/fC2jZRu4YQpglT3w0ZAuHa/j9zShM=;
        b=FLaJVRP+11KkHxDC+Fowfe6GEOV51N2wJwtXQpGgBtY7eE45WYbEt255+Ye5eFRGrr
         lDIJxhdv+b1Aptfxvl79mph9PFQ1Vjb2Y4AIbrzmy/kHSq/QlBSfOZWhWzflZEtjPRhb
         FATdcih3nZDOZtxMqekJSaSeKM1JCU5WrTTdjhBPsGEKt5dmoAYn14/y3bOOq5ZwkapC
         LhmSfeWShGXoWSA3gf6Ti2AXGzL9BbmTffA6LmmVSEjIk7S44eWIFeoDl8MRWlzcMhUg
         Df9FmoQTUo8Ecch/vMu1DUEngJtsIJ/Xa0SjFn6aySDRhVpdiwEL49Vcm+mCpecQ8M1O
         8zhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691677060; x=1692281860;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aj2WLFF8Y8ANb/fC2jZRu4YQpglT3w0ZAuHa/j9zShM=;
        b=ULeJCBCgEO9yH+oQOQpS/aCH46FRmrLyCmqZ6MvQWixhOc6KuMDdawQAEF5LBaMI6x
         99Rv5FIVxw+LYPoSDMULsYbTgw5oSZCj5AM6TNYrgRCgXiEqNHJN/ce2lj93eFeI8of6
         ZNaN/z1ZCfJlXMn24Vr4d9wwr14pOZPgpmkXxFnfcdDzjfhVDg3abl2znAdwzCY6srTj
         r4OAdcN0Aja9lmBb5YqJJFxtwpodO5fW3wi7P88chsRBHZYe+1sadvf4XyIF0dej5cnD
         jHxs345/iA3Qd/F744WcuCR5YvkkbUBzf9N7GcXgwyyL8cgnaOuStGdWdrC8aVFeXxN+
         HpcQ==
X-Gm-Message-State: AOJu0YzMUrssyHNaD3jy+L1WIS++XB80N6Sn7uomMSN6j2AwhEmGDYoI
	WGFzuNfsmFNvrtAe3lbD7CUt3PK1rac=
X-Google-Smtp-Source: AGHT+IGsnJWNdSiceKrcp6hBzdTgB/7bGBMgocRGCwLMhlBg775zR6tybPlFPM67Bk/Oe7Flh6ZTRg==
X-Received: by 2002:a05:6a21:81a0:b0:140:ef2a:9b79 with SMTP id pd32-20020a056a2181a000b00140ef2a9b79mr2679737pzb.33.1691677059900;
        Thu, 10 Aug 2023 07:17:39 -0700 (PDT)
Received: from [192.168.19.123] (c-73-90-186-127.hsd1.ca.comcast.net. [73.90.186.127])
        by smtp.gmail.com with ESMTPSA id a26-20020aa7865a000000b00663b712bfbdsm1579767pfo.57.2023.08.10.07.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 07:17:39 -0700 (PDT)
Message-ID: <14bbe32a-ff58-e649-b436-266da366f927@gmail.com>
Date: Thu, 10 Aug 2023 10:17:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Aug 10th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 14:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104322

The following changes since commit 4da92ed9be41734f6ced46b981958e2e868cbff2:

   python3-gcovr: Fix parsing of gcc-11 gcov metadata (2023-07-25 
07:24:25 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 594c9cf6d3205c8e40ff772383fd9ab7dd3ed2cc:

   redis: upgrade 7.0.11 -> 7.0.12 (2023-08-03 16:50:52 -0400)

----------------------------------------------------------------
J.D. Schroeder (1):
       Fix groupname gid change warning

Narpat Mali (2):
       python3-django: upgrade 3.2.19 -> 3.2.20
       python3-django: upgrade 4.2.1 -> 4.2.3

Polampalli, Archana (2):
       yasm: fix CVE-2023-31975
       redis: upgrade 7.0.11 -> 7.0.12

Urade, Yogita (1):
       zabbix: fix CVE-2023-29450

Urade, Yogitag (1):
       zabbix: fix CVE-2023-29449

  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb | 1 +
  meta-networking/recipes-daemons/radvd/radvd.inc                 | 1 +
  meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29449.patch | 247 
++++++++++++++++++++++++++++
  meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29450.patch | 241 
+++++++++++++++++++++++++++
  meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb            | 2 +
  meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch         | 29 ++++
  meta-oe/recipes-devtools/yasm/yasm_git.bb                       | 1 +
  .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
  .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
  .../redis/{redis-7.0.11 => redis-7.0.12}/GNU_SOURCE-7.patch |   0
  .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
  .../redis/{redis-7.0.11 => redis-7.0.12}/init-redis-server |   0
  .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
  .../{redis-7.0.11 => redis-7.0.12}/oe-use-libc-malloc.patch |   0
  .../redis/{redis-7.0.11 => redis-7.0.12}/redis.conf |   0
  .../redis/{redis-7.0.11 => redis-7.0.12}/redis.service |   0
  .../recipes-extended/redis/{redis_7.0.11.bb => redis_7.0.12.bb} |   2 +-
  .../{python3-django_3.2.19.bb => python3-django_3.2.20.bb} |   4 +-
  .../python/{python3-django_4.2.1.bb => python3-django_4.2.3.bb} |   4 +-
  19 files changed, 527 insertions(+), 5 deletions(-)
  create mode 100644 
meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29449.patch
  create mode 100644 
meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29450.patch
  create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch
  rename meta-oe/recipes-extended/redis/{redis-7.0.11 => 
redis-7.0.12}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.11 => 
redis-7.0.12}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.11 => 
redis-7.0.12}/GNU_SOURCE-7.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.11 => 
redis-7.0.12}/hiredis-use-default-CC-if-it-is-set.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.11 => 
redis-7.0.12}/init-redis-server (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.11 => 
redis-7.0.12}/lua-update-Makefile-to-use-environment-build-setting.patch 
(100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.11 => 
redis-7.0.12}/oe-use-libc-malloc.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.11 => 
redis-7.0.12}/redis.conf (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.11 => 
redis-7.0.12}/redis.service (100%)
  rename meta-oe/recipes-extended/redis/{redis_7.0.11.bb => 
redis_7.0.12.bb} (96%)
  rename meta-python/recipes-devtools/python/{python3-django_3.2.19.bb 
=> python3-django_3.2.20.bb} (59%)
  rename meta-python/recipes-devtools/python/{python3-django_4.2.1.bb => 
python3-django_4.2.3.bb} (61%)


