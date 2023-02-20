Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BBBC636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 15:55:31 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.16775.1676908529298530522
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 07:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cceucXKR;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id bg11so1489987oib.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Oiun/YAcY7M2LctT0aIlp/JhMyXwh2h3XMzDn2GG7E=;
        b=cceucXKR3LpCg/7csnEgEKwTqxvn91gCmBp3LHLArtIJ9DO22BL/1i7yYMWr1u+79Y
         R+Rz5fVtO8COYsj3wQW4iZ6owuB9UfmM4jueKVSITW+ekCh0IXhTM80E3rx0qdJsA5uP
         nNklX+sP3BlgSK9oE8nHiq6W2n57qONgeX7lAkXDw0j7T19WWpINtMf8TpSN1KA3W4Nz
         CWWVkItU7JmX/6+IXkZjF8fI3xBYbdcDfrAJ4y/OEcQIctYb4TA2oNR9qSCbnxFqmbNM
         iA9RKEWM1PX5qzk0otxKV4KrHTOKtsN+uLCFkVcDYyPj2fCkWaalGZBf8QHPY6Xal0tV
         E0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Oiun/YAcY7M2LctT0aIlp/JhMyXwh2h3XMzDn2GG7E=;
        b=jPCjCH1X8j4yyUBDnrJkTdc6BaMBaLQGws+kVhM/Jp70V1S+cTT7UhX3sEaJa6Z2zP
         9xrDIq+GS0tnGnZ2DW0hk2aG5gVgcogI/3ggIrT4B/mMfcBwmhWF06RYAL3GjzUQYDvq
         HT046HDtzENo77v37H/ma6s0w2gdhuDC9m7VSjjfIHa+2Rgzt2Z+iHi+B5Bn18gIyY/c
         BgijVrIyh26agJCwoVC/l2erGwqqA3xc2rOrJ0bz0IWzePD1Rqoh3WpjrMCOCPl2BH78
         ITEQyCaa2SEcDjinGpyqBXygyb1KdK1Z3lmFLXV+TQSkPGbogYcJuIf0KP1BOj0kVKPs
         AgLg==
X-Gm-Message-State: AO0yUKVouI9ZEoFtiNm3kxoKaDewLJQ8bF6fnMmF6G6/CQUGVJBupO7b
	QM+zkT6FgzVCi6PwZYYIoKw=
X-Google-Smtp-Source: AK7set+wPuOl0avlKxZlE5vB1UGGxnHzTLBLuHI65BO2scP6yoC2g2tJkJPOMlQF61RdjH48lA1m5A==
X-Received: by 2002:a05:6808:7cb:b0:37f:ac17:879a with SMTP id f11-20020a05680807cb00b0037fac17879amr6095119oij.35.1676908528441;
        Mon, 20 Feb 2023 07:55:28 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:7a19:18b1:fbe9:75f5? ([2600:1700:9190:ba10:7a19:18b1:fbe9:75f5])
        by smtp.gmail.com with ESMTPSA id w67-20020aca6246000000b0037832f60518sm296021oib.14.2023.02.20.07.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 07:55:27 -0800 (PST)
Message-ID: <d3b8c584-e930-e648-b390-3c08c9af59fe@gmail.com>
Date: Mon, 20 Feb 2023 10:55:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Feb 20th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 15:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101176

The following changes since commit 278ec081a64e6a7679d6def550101158126cd935:

   nodejs: upgrade 16.18.1 -> 16.19.0 (2023-02-04 12:16:38 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 82c75b466e55d7dca7a2364986ecb704cf63d141:

   phoronix-test-suite: Fix CVE-2022-40704 (2023-02-16 07:30:46 -0500)

----------------------------------------------------------------
Gary Huband (1):
       chrony: add pkgconfig class as pkg-config is explicitly searched for

Joe Slater (1):
       phoronix-test-suite: Fix CVE-2022-40704

Randy MacLeod (2):
       python3-pillow: add ptest support
       python3-pillow: Add distutils, unixadmin for ptest

Wang Mingyu (3):
       python3-pillow: upgrade 9.2.0 -> 9.3.0
       python3-pillow: upgrade 9.3.0 -> 9.4.0
       apache2: upgrade 2.4.54 -> 2.4.55

Xu Huan (1):
       python3-pillow: upgrade 9.0.1 -> 9.1.1

Yi Zhao (2):
       freeradius: Security fixes for CVE-2022-41860 CVE-2022-41861
       frr: Security fix for CVE-2022-42917

zhengruoqin (1):
       python3-pillow: upgrade 9.1.1 -> 9.2.0

  .../recipes-connectivity/freeradius/files/CVE-2022-41860.patch  | 118 
++++++++++++++++++++++++++++
  .../recipes-connectivity/freeradius/files/CVE-2022-41861.patch  | 53 
+++++++++++++
  .../recipes-connectivity/freeradius/freeradius_3.0.21.bb        | 2 +
  meta-networking/recipes-protocols/frr/frr/CVE-2022-42917.patch  | 36 
+++++++++
  meta-networking/recipes-protocols/frr/frr/frr.pam               | 3 +-
  meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
  meta-networking/recipes-support/chrony/chrony_4.2.bb            | 2 +-
  .../phoronix-test-suite/files/CVE-2022-40704.patch              | 46 
+++++++++++
  .../phoronix-test-suite/phoronix-test-suite_10.8.2.bb           | 6 +-
  meta-python/recipes-devtools/python/python3-pillow/run-ptest    | 3 +
  .../python/{python3-pillow_9.0.1.bb => python3-pillow_9.4.0.bb} |  32 
++++++--
  .../apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb} |   2 +-
  12 files changed, 295 insertions(+), 9 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
  create mode 100644 
meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2022-42917.patch
  create mode 100644 
meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-pillow/run-ptest
  rename meta-python/recipes-devtools/python/{python3-pillow_9.0.1.bb => 
python3-pillow_9.4.0.bb} (52%)
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.54.bb => 
apache2_2.4.55.bb} (99%)


