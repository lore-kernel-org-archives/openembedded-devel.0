Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A47EEB58A
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 11:27:17 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.14749.1694258828083215024
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Sep 2023 04:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Q7fBJ+I0;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5920efd91c7so29658607b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 04:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694258827; x=1694863627; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgRw96GjL45oyhjBLu3vOBlIwMsTIY/mPgrqfG3mJig=;
        b=Q7fBJ+I01BR3sjdQqxWGGGBAxWWFwC2Y0p6kM/CKEFV+kmKU3F4T8Gxv8IXe4FeKgg
         GutKFDzkxNkzJL8tKq51d6OjDXpndPwf4oGqGG5N+FPdGPEmwo3FRioC/SxUR+vCtAbD
         SPWjYvctF9DCsoqlfoB5w05HdbzJLuBmotbkDtQGHOHi5mt4rBADvfupjqFm84+4sSVx
         /vkxUns2e33Ehgjp7P5IPpgZVfnyTdcetlybdP6uXil2LCjEBBp12hsiDAEiRq7IdOGx
         CfYzjwjqF9W+W5WDMWPozuuUpBuVRETQe1NuNGDEBRTJPc3oo9LEqzbrPtceWlEySkRn
         w5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694258827; x=1694863627;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YgRw96GjL45oyhjBLu3vOBlIwMsTIY/mPgrqfG3mJig=;
        b=FIAPIodC7JIyC0/s2FIw6/6CQ5oCqmLcvyBhbk+luYTbafdkSpfZduSX8J1SuxBFSx
         8yFcd7Vl3p1OBNzlsV5DqIRW1z81VlgHVGaV5bzoePTMgU1YmsFxrlbXZwI8KaQ+EgqH
         tvo2zgnmAuKST+NVI4JXOK3+cZkkhCk1LmhtV5EaU8IPQg29t8Zh7UHn5K1vFQW37vBT
         lmego1Y5d5fKwet5LGOrBsp2ubOlTlMywe3j/WCnRNZjLOSylYFDl6nX+WJUhxZRUGpk
         qw7Al3/7Bc945QNju7EJDSTSedTBBnzbyVphwCV/ig4p+OyvKeWrGoiG8g7qIWZrrov3
         XXfA==
X-Gm-Message-State: AOJu0YyQoEtwLSp3C/pFoACq/zzrPbbimu7I+d3yUeOtQpzYyk1yZV9V
	9hYVIcspiX043AshwR+MZd1TbdC7Pew=
X-Google-Smtp-Source: AGHT+IF2+MARmilTeVOf22Qw14nLSza7GBE0dihENEHCh3iN39iKNupQ8+1QGHQzZ/2O/u+GMJLY0A==
X-Received: by 2002:a81:8941:0:b0:595:733b:38b with SMTP id z62-20020a818941000000b00595733b038bmr6203701ywf.19.1694258827153;
        Sat, 09 Sep 2023 04:27:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:2fc7:531e:3376:5faf? ([2600:1700:9190:ba10:2fc7:531e:3376:5faf])
        by smtp.gmail.com with ESMTPSA id l4-20020a0de204000000b00592a0cad26esm888773ywe.26.2023.09.09.04.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Sep 2023 04:27:06 -0700 (PDT)
Message-ID: <6bb02cf5-a195-b046-3edc-580d4887db67@gmail.com>
Date: Sat, 9 Sep 2023 07:27:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Sept 9th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 11:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104814

The following changes since commit 529620141e773080a6a7be4615fb7993204af883:

   nodejs: upgrade 16.20.1 -> 16.20.2 (2023-08-11 10:32:04 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to a88cb922f91fda95e8a584cee3092083d5ad3e98:

   hwloc: fix CVE-2022-47022 (2023-09-06 09:13:26 -0400)

----------------------------------------------------------------
Chen Qi (1):
       spice-protocol: fix populate_sdk error when spice is installed

Marine Vovard (1):
       python3-kivy: Require X11 or Wayland in DISTRO_FEATURES

Martin Jansa (1):
       libiio: use main branch instead of master

Narpat Mali (4):
       libqb: upgrade 2.0.6 -> 2.0.8
       python3-django: fix CVE-2023-36053
       python3-aiohttp: upgrade 3.8.1 -> 3.8.5
       frr: Fix CVE-2023-38802 and CVE-2023-41358

Polampalli, Archana (2):
       php: upgrade 8.1.16 -> 8.1.22
       nodejs: fix CVE-2022-25883

Robert Joslyn (1):
       postgresql: Update to 14.9

Soumya Sambu (3):
       krb5: Fix CVE-2023-36054
       iperf3: upgrade 3.11 -> 3.14
       hwloc: fix CVE-2022-47022

Sourav Kumar Pramanik (1):
       meta-oe-components: Avoid usage of nobranch=1

Sourav Pramanik (2):
       rapidjson: Avoid usage of nobranch=1
       nlohmann-json: Avoid usage of nobranch=1

Wang Mingyu (3):
       tcpdump: upgrade 4.99.1 -> 4.99.2
       tcpdump: upgrade 4.99.2 -> 4.99.3
       tcpdump: upgrade 4.99.3 -> 4.99.4

Yogita Urade (1):
       poppler: fix CVE-2023-34872

  meta-gnome/recipes-connectivity/geary/geary_40.0.bb             | 2 +-
  meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb    | 2 +-
  meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch  | 136 
++++++++++++++
  meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch  | 105 
+++++++++++
  meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 2 +
  meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb  | 2 +
  .../tcpdump/{tcpdump_4.99.1.bb => tcpdump_4.99.4.bb} |   3 +-
  .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb   | 2 +-
  .../recipes-benchmark/iperf3/{iperf3_3.11.bb => iperf3_3.14.bb} |   4 +-
  meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch     | 68 
+++++++
  meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb                | 1 +
  .../postgresql/files/0001-Add-support-for-RISC-V.patch          | 10 +-
  .../postgresql/files/0001-Improve-reproducibility.patch         | 6 +-
  ...1-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch | 50 
------
  .../files/0001-config_info.c-not-expose-build-info.patch        | 18 +-
  .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6 +-
  .../files/0001-postgresql-fix-ptest-failure-of-sysviews.patch   | 11 +-
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch        | 235 
-------------------------
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch        | 118 
-------------
  meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch    | 10 +-
  meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch     | 38 ----
  .../postgresql/{postgresql_14.5.bb => postgresql_14.9.bb} |   8 +-
  meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb  | 2 +-
  meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch     | 262 
+++++++++++++++++++++++++++
  meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb               | 1 +
  meta-oe/recipes-devtools/php/{php_8.1.16.bb => php_8.1.22.bb} |   2 +-
  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb             | 2 +-
  meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch       | 77 
++++++++
  meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb                 | 4 +-
  .../recipes-extended/libqb/{libqb_2.0.6.bb => libqb_2.0.8.bb} |   2 +-
  meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb              | 2 +-
  meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb               | 2 +-
  meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb                     | 2 +-
  meta-oe/recipes-support/glog/glog_0.5.0.bb                      | 2 +-
  meta-oe/recipes-support/libiio/libiio_git.bb                    | 2 +-
  meta-oe/recipes-support/libmxml/libmxml_3.3.bb                  | 2 +-
  meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch    | 46 +++++
  meta-oe/recipes-support/poppler/poppler_22.04.0.bb              | 1 +
  .../{python3-aiohttp_3.8.1.bb => python3-aiohttp_3.8.5.bb} |   4 +-
  .../recipes-devtools/python/python3-django/CVE-2023-36053.patch | 263 
++++++++++++++++++++++++++++
  meta-python/recipes-devtools/python/python3-django_2.2.28.bb    | 4 +-
  meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb      | 4 +-
  42 files changed, 1022 insertions(+), 501 deletions(-)
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
  rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.1.bb => 
tcpdump_4.99.4.bb} (90%)
  rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.11.bb => 
iperf3_3.14.bb} (89%)
  create mode 100644 
meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/0001-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_14.5.bb => 
postgresql_14.9.bb} (54%)
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch
  rename meta-oe/recipes-devtools/php/{php_8.1.16.bb => php_8.1.22.bb} (99%)
  create mode 100644 
meta-oe/recipes-extended/hwloc/files/CVE-2022-47022.patch
  rename meta-oe/recipes-extended/libqb/{libqb_2.0.6.bb => 
libqb_2.0.8.bb} (93%)
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch
  rename meta-python/recipes-devtools/python/{python3-aiohttp_3.8.1.bb 
=> python3-aiohttp_3.8.5.bb} (80%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch


