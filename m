Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6615EE4993
	for <webhook@archiver.kernel.org>; Sun, 20 Aug 2023 14:32:18 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.29392.1692541930929264232
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Aug 2023 07:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cIUXAc1h;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-58d31f142eeso28213917b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Aug 2023 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692541930; x=1693146730;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXMnXKAVZXm5O52/la/w8RyLOxwBw2VXByYPQ0VWhMU=;
        b=cIUXAc1hXTxzY0m6Sbiu1p/OlJXYXnuoRb0+RO2VJ7P7ep1Bhly1HFsEZhN5rNiMlt
         rMHANJoPRNfQIwih4+wgU8iXj1bmIdhcTS2qpfbSRLcjUhIuwAxhBfWD5cQiZQQrBKve
         JUnnE9F1UhnuU3xf4L/7Uno3CRMZnEz6u6R3RXlULa33B7yOj6XsjYdYl4smWil5hSr2
         o0gcFCcmOY8AyTu1CYwVj57yOVu958o2CtWIsyQ1mt8JZjpDlO7uss2834BNdB4erXy3
         klV32EqZpLOXhuQwauGX9FsRVvBRjzGcfVx1btkkw7JEUIkeqxRFxKm5ywn9VkCTdgeW
         8OxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541930; x=1693146730;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IXMnXKAVZXm5O52/la/w8RyLOxwBw2VXByYPQ0VWhMU=;
        b=fd2OWJtIrE52OlNVDTKK8XSGQg2Md1ZUC6hzOkFNTGg5MFsug2QmRGCTuc6vnZPPln
         lwqwzoedgmXeAlTdfSA1kcAZLuMv06FyzOTPRfvvenI0Ei4l/A53KI48Hs3GIMwJgE6j
         xTDjAnJ1+HqvTtrqyuqZKN2pp0vvzRRfL86olWBkW0NJZO6a4cJYwSLt5OHF2wHKS2EP
         T5WNybw3VHVfrek5hARocHmefTk0lOukuEO6kFSA1SW5DDHcy3wT2P+EUt8+7Bvx7Zx6
         EETvQqZXEC0/EOFJ9Et6/slfDV7F8IiGAa8FpYTKr6hxeeSe+4JTA64UzYZzN2+VFveK
         Z8Tg==
X-Gm-Message-State: AOJu0YzdDptEytd+pcDWdHyJyhEi88NzTMAp6tXjM8HK3LoxbccDITSd
	5FZ7H3ilieLAVvsYT5y0Xqg=
X-Google-Smtp-Source: AGHT+IGImZKnHdNdVV2vmJqUXybdS0JhCGIL22DxOBXnt2KYAgF7SZ84bp2m8CAWdGclOfom6N0ymg==
X-Received: by 2002:a0d:d811:0:b0:589:e586:6f0a with SMTP id a17-20020a0dd811000000b00589e5866f0amr5026623ywe.3.1692541929904;
        Sun, 20 Aug 2023 07:32:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:e280:592d:aee1:5220? ([2600:1700:9190:ba10:e280:592d:aee1:5220])
        by smtp.gmail.com with ESMTPSA id z3-20020a81c203000000b005899c8e8242sm1712190ywc.138.2023.08.20.07.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Aug 2023 07:32:09 -0700 (PDT)
Message-ID: <c7d7e163-2df0-1c1f-2b49-0d7aa89768e0@gmail.com>
Date: Sun, 20 Aug 2023 10:32:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Mickledore merge request : Aug 20th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Aug 2023 14:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104500

The following changes since commit 75cf318cef3b4ee81fad2782cf063ecd69ba8842:

   lmsensors: do not pull in unneeded perl modules for run-time 
dependencies (2023-08-03 16:46:11 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to b0ba472191c2b7709ef04ae9c5a23bea040518f9:

   mcelog: Drop unneeded autotools-brokensep (2023-08-16 08:33:38 -0400)

----------------------------------------------------------------
Changqing Li (2):
       redis: upgrade 6.2.12 -> 6.2.13
       redis: upgrade 7.0.11 -> 7.0.12

Linus Jacobson (1):
       khronos-cts: Replace wayland feature dependancy with vulkan

Mingli Yu (4):
       yajl: Fix CVE-2023-33460
       iniparser: Fix CVE-2023-33461
       php: Upgrade to 8.2.8
       mcelog: Drop unneeded autotools-brokensep

  meta-oe/recipes-devtools/php/{php_8.2.6.bb => php_8.2.8.bb} |  2 +-
  meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_1.patch       | 43 
++++++++++++++++++++++++
  meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_2.patch       | 31 
+++++++++++++++++
  meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                     | 5 ++-
  .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
  .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
  .../redis/{redis-7.0.11 => redis-7.0.12}/GNU_SOURCE-7.patch |  0
  .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
  .../redis/{redis-7.0.11 => redis-7.0.12}/init-redis-server |  0
  .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
  .../{redis-7.0.11 => redis-7.0.12}/oe-use-libc-malloc.patch |  0
  .../redis/{redis-7.0.11 => redis-7.0.12}/redis.conf |  0
  .../redis/{redis-7.0.11 => redis-7.0.12}/redis.service |  0
  .../recipes-extended/redis/{redis_6.2.12.bb => redis_6.2.13.bb} |  2 +-
  .../recipes-extended/redis/{redis_7.0.11.bb => redis_7.0.12.bb} |  2 +-
  meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc              | 2 +-
  .../recipes-support/iniparser/iniparser/CVE-2023-33461.patch    | 52 
+++++++++++++++++++++++++++++
  meta-oe/recipes-support/iniparser/iniparser_4.1.bb              | 3 +-
  meta-oe/recipes-support/mcelog/mcelog_191.bb                    | 11 
++++--
  19 files changed, 145 insertions(+), 8 deletions(-)
  rename meta-oe/recipes-devtools/php/{php_8.2.6.bb => php_8.2.8.bb} (99%)
  create mode 100644 
meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_1.patch
  create mode 100644 
meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_2.patch
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
  rename meta-oe/recipes-extended/redis/{redis_6.2.12.bb => 
redis_6.2.13.bb} (96%)
  rename meta-oe/recipes-extended/redis/{redis_7.0.11.bb => 
redis_7.0.12.bb} (96%)
  create mode 100644 
meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch


