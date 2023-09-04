Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4BEC71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 15:45:26 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.96.1693842323786583277
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 08:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LeLgvlGQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6beff322a97so1252721a34.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 08:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693842323; x=1694447123; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCGyZW4IVO5+QwQIlUQxBDzGXJIb4burtKce3bNxzVU=;
        b=LeLgvlGQpe4zCGPuPgRxKvFSMfX6Vq4Ka4/Y4z7JUmwWmYrSbVRkarIpzcx/Z9F3CB
         GxQgQ0CCQA0mFDwmHiVjwmktWBm3yCTfj0hykF4f7SnWEMRup7kXUuJqC3YvZ3ql1qTB
         iejem0okkk5yoKXMWSm9X6IbBbUhcNQpTj0D/gvne8rA0Js7fgSxE2rhYoiEEfg0EfEy
         5JTD4BFy7cWGh7G2ZREk1Hvyd8M04K2BvwLAPR+nhHjP11CvccelkM8oUQJqAp+BXq3d
         F03RxGboUY8GQeik6MANS7sXOANazXOrE2Xgv6dvRwFyN6mbdg/GaGIvq3Jzdj4uXc+A
         F1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693842323; x=1694447123;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lCGyZW4IVO5+QwQIlUQxBDzGXJIb4burtKce3bNxzVU=;
        b=d1Ufg9823z7SUt5l84ahZLoBIuPNTDJwmm3W/R3g+AoNQfsSTh311WZyOmlhyOX20M
         iDBbvrjzIOpsWVjirTmwMHWD0cOOfpZbKcSE4TupAxuq0+R7mrL4pdXTZWVaKO9NaIq3
         RcatYDVgr0jRg/6ZvPTk2hZut1r4wc1nEkX5ZgssmVWZfz+fL7VXgIeijmlLZ2v0BS6W
         kSkLZCzWIaCXSaKZUX139Nxwzrh4JazVTNx6ZYxAA27+0JcaDLNd7W8cvlilaGVgzs20
         6hmo+tCQ//S2BFY8tZZrnUvDhlqX0m+BE6x9DqmL2jda9SsaGHWuRoQC27/sn5VBoWUq
         PKzQ==
X-Gm-Message-State: AOJu0Yx3NIdJG+EUL7lNAfV814n2bpp3OfueuoKbUiPg3k1CX2uycWdd
	y2TQMegZaW4ydhM2PYumqIdG75wGGO4=
X-Google-Smtp-Source: AGHT+IE5OryKk1+G6ZRxmTUxnTMsxegHPLV1o+45OqmYs+OnX+uw6mGUJkajy0i9azDXjkBKki7PDg==
X-Received: by 2002:a05:6358:883:b0:139:4783:5140 with SMTP id m3-20020a056358088300b0013947835140mr13138739rwj.16.1693842322854;
        Mon, 04 Sep 2023 08:45:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:56c:37be:a1cc:4348? ([2600:1700:9190:ba10:56c:37be:a1cc:4348])
        by smtp.gmail.com with ESMTPSA id l6-20020a25bcc6000000b00d0bad22d652sm2270390ybm.36.2023.09.04.08.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 08:45:22 -0700 (PDT)
Message-ID: <c9760974-8930-40ae-e491-00b3ea69bc4b@gmail.com>
Date: Mon, 4 Sep 2023 11:45:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Mickledore merge request Sept 4th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 15:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104715

The following changes since commit 75cf318cef3b4ee81fad2782cf063ecd69ba8842:

   lmsensors: do not pull in unneeded perl modules for run-time 
dependencies (2023-08-03 16:46:11 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to 41fffef6b044b2722aa13f7e7648a3f848231851:

   yasm: fix CVE-2023-37732 (2023-09-03 10:43:56 -0400)

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

Polampalli, Archana (2):
       nodejs: upgrade 18.16.1 -> 18.17.1
       hwloc: fix CVE-2022-47022

Soumya (1):
       yasm: fix CVE-2023-37732

Wang Mingyu (1):
       iperf3: upgrade 3.13 -> 3.14

Yi Zhao (1):
       frr: Security fix CVE-2023-3748

  meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch   | 54 
++++++++++++++++++++
  meta-networking/recipes-protocols/frr/frr_8.4.4.bb              | 1 +
  .../recipes-benchmark/iperf3/{iperf3_3.13.bb => iperf3_3.14.bb} |  2 +-
  .../oe-npm-cache                                                | 0
  ...oe-cache-native_18.16.bb => nodejs-oe-cache-native_18.17.bb} |  0
  .../nodejs/{nodejs_18.16.1.bb => nodejs_18.17.1.bb} |  4 +-
  meta-oe/recipes-devtools/php/{php_8.2.6.bb => php_8.2.8.bb} |  2 +-
  meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_1.patch       | 43 
++++++++++++++++
  meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_2.patch       | 31 
++++++++++++
  meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                     | 5 +-
  meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch         | 41 
++++++++++++++++
  meta-oe/recipes-devtools/yasm/yasm_git.bb                       | 1 +
  meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch       | 76 
+++++++++++++++++++++++++++++
  meta-oe/recipes-extended/hwloc/hwloc_2.9.0.bb                   | 4 +-
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
++++++++++++++++++++
  meta-oe/recipes-support/iniparser/iniparser_4.1.bb              | 3 +-
  meta-oe/recipes-support/mcelog/mcelog_191.bb                    | 11 ++++-
  29 files changed, 324 insertions(+), 12 deletions(-)
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-3748.patch
  rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.13.bb => 
iperf3_3.14.bb} (95%)
  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.16 => 
nodejs-oe-cache-18.17}/oe-npm-cache (100%)
  rename 
meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.16.bb => 
nodejs-oe-cache-native_18.17.bb} (100%)
  rename meta-oe/recipes-devtools/nodejs/{nodejs_18.16.1.bb => 
nodejs_18.17.1.bb} (97%)
  rename meta-oe/recipes-devtools/php/{php_8.2.6.bb => php_8.2.8.bb} (99%)
  create mode 100644 
meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_1.patch
  create mode 100644 
meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460_2.patch
  create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch
  create mode 100644 
meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch
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


