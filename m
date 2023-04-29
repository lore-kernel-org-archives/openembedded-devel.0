Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEEBC77B7C
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 15:57:46 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.49769.1682783865091816361
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Apr 2023 08:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=E7Fjj2hQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-54fe25c2765so17184907b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Apr 2023 08:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682783864; x=1685375864;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJbS980J+VCyllnGjDBRHzNpx96jjO0rNjpjF8WBUQw=;
        b=E7Fjj2hQBrbBR3d2PfcmfODMHA4Xm0hIeDL97ehhtNOAwqFQ+ovMKlk+LIgsQT+gvs
         vuAeSztrfVU+8pswmg7oO0R2xvqrMAR3e5ChqicwiHhRJaASgZRRhICkhZdBfbS3PWeK
         eoO/SS7H2eg9quwf9J9vu/ALwRmfB0gen+V6tEeoawccLmbgoac6kEZkEpyhRv2PMgim
         nhkVa2JhiBOPrLQndxEk6kUIK13P9WMPH3Ig4DwHojyAxmExsc7wjPfuRZVknkooPgG9
         FnCDsmp2hKSZ1TFhuH5c/e0m68aPXHm2wT9A1a13H6lWBwbgFOjlya74HYocymaNLDN1
         QgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682783864; x=1685375864;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xJbS980J+VCyllnGjDBRHzNpx96jjO0rNjpjF8WBUQw=;
        b=jeWwDSemwgZo6WAJy3bPfx+ZFuXaHmsvvfqrYwskuOs3KHdvQzWacJnGTPFrnADukm
         pz+glGmabO+XbmLeRkr2u76GwNcW/3cNOoZ3FqW//MC4YT2y7PDTwGLXTi+15f0wcYza
         gC4pvRvFf6vfYYlo5vi2ck9WH1ZG6F9XmbjthMzj3Tlx13hTVjivK+jlwr2cpAHl4A6D
         Jzt0jGC/YqJFzlqu4s1yXgWBpQZ5IxyfIkxbZgjQGgW/DkMsyVY+RtXR8I6acnHjtMut
         efbR9ZuKNX0M0TRYaElvycXr7RqWFdGe9xkEZN2tZ7gJj/YfSGWuyvxptd4pz+FNfFyL
         HCdQ==
X-Gm-Message-State: AC+VfDx5npGn6efoUIWpXmeCFmH4ZqGfQaxfATAJPDTKucbuBYKhdSWP
	HEvQPGRoZZTUYaG91ij4raA=
X-Google-Smtp-Source: ACHHUZ6tOVn5pldJ0nKEolZPqleHM9zF5Gaes9u/GUF+r8ktG7C0pAMJvWf/dvqvBKzwm0/ebqe+GQ==
X-Received: by 2002:a81:4654:0:b0:556:c776:96a2 with SMTP id t81-20020a814654000000b00556c77696a2mr6753977ywa.44.1682783864225;
        Sat, 29 Apr 2023 08:57:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:22bb:f1fd:f3d8:f06c? ([2600:1700:9190:ba10:22bb:f1fd:f3d8:f06c])
        by smtp.gmail.com with ESMTPSA id u5-20020a0dd205000000b0054f9e7fed7asm6198168ywd.137.2023.04.29.08.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Apr 2023 08:57:43 -0700 (PDT)
Message-ID: <a2dcb0b3-bb27-e5f5-90ed-0a39f358231a@gmail.com>
Date: Sat, 29 Apr 2023 11:57:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: April 29th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Apr 2023 15:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102229

The following changes since commit 571e36e20e9d1f27af0eb4545291beeb64f280e2:

   syslog-ng: fix CVE-2022-38725 (2023-04-04 09:06:45 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to df452d9d98659b49888fa8a5428a0a8bd3e3aaec:

   redis: upgrade 7.0.10 -> 7.0.11 (2023-04-28 07:25:03 -0400)

----------------------------------------------------------------
BINDU (1):
       flatbuffers: adapt for cross-compilation environments

Changqing Li (4):
       zabbix: fix CVE-2023-29451
       redis: upgrade 6.2.11 -> 6.2.12
       redis: upgrade 7.0.9 -> 7.0.10
       redis: upgrade 7.0.10 -> 7.0.11

Khem Raj (1):
       postfix: Fix build on systems with linux 6.x

Manoj Saun (1):
       postgresql: fix ptest failure of sysviews test

Martin Jansa (8):
       jack: fix compatibility with python-3.11
       restinio: fix S variable in multilib builds
       mongodb: fix chown user for multilib builds
       pahole: respect libdir
       lvgl,lv-lib-png,lv-drivers: fix installed-vs-shipped QA issue 
with multilib
       lirc: fix do_install with multilib
       dleyna-{server,renderer}: fix dev-so QA issue with multilib
       zsh: fix installed-vs-shipped with multilib

Neetika Singh (1):
       libcroco: Add fix for CVE-2020-12825

Urade, Yogita (1):
       dlt-daemon: fix CVE-2023-26257

Wang Mingyu (1):
       openwsman: Change download branch from master to main.

  .../recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb          | 2 +-
  .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb            | 2 +-
  .../recipes-connectivity/restinio/restinio_0.6.13.bb            | 4 +-
  .../files/0006-makedefs-Account-for-linux-6.x-version.patch     | 35 +++++
  meta-networking/recipes-daemons/postfix/postfix_3.6.7.bb        | 1 +
  .../meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb        | 6 +-
  .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 2 +-
  meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29451.patch | 116 
+++++++++++++++++
  meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb            | 1 +
  .../files/0001-postgresql-fix-ptest-failure-of-sysviews.patch   | 42 
++++++
  meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb               | 1 +
  meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb       | 7 +-
  meta-oe/recipes-devtools/pahole/pahole_1.22.bb                  | 2 +-
  .../dlt-daemon/dlt-daemon/0001-Fix-memory-leak.patch            | 34 +++++
  meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb        | 1 +
  meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb          | 2 +-
  .../recipes-extended/redis/{redis_6.2.11.bb => redis_6.2.12.bb} |   2 +-
  .../recipes-extended/redis/{redis_7.0.9.bb => redis_7.0.11.bb} |   2 +-
  meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb              | 8 +-
  meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb               | 8 +-
  meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb                     | 6 +-
  ...1-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch | 52 
++++++++
  meta-oe/recipes-multimedia/jack/jack_1.19.20.bb                 | 4 +-
  meta-oe/recipes-shells/zsh/zsh_5.8.bb                           | 4 +-
  meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch     | 190 
++++++++++++++++++++++++++++
  meta/recipes-support/libcroco/libcroco_0.6.13.bb                | 22 ++++
  26 files changed, 530 insertions(+), 26 deletions(-)
  create mode 100644 
meta-networking/recipes-daemons/postfix/files/0006-makedefs-Account-for-linux-6.x-version.patch
  create mode 100644 
meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29451.patch
  create mode 100644 
meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-failure-of-sysviews.patch
  create mode 100644 
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memory-leak.patch
  rename meta-oe/recipes-extended/redis/{redis_6.2.11.bb => 
redis_6.2.12.bb} (96%)
  rename meta-oe/recipes-extended/redis/{redis_7.0.9.bb => 
redis_7.0.11.bb} (96%)
  create mode 100644 
meta-oe/recipes-multimedia/jack/jack/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch
  create mode 100644 
meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
  create mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb


