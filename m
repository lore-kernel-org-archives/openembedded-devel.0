Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE17CDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 12:21:28 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.211886.1697545278778802162
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 05:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y4HualM0;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5a86b6391e9so28706097b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697545278; x=1698150078; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8ILzoINks0Vh1TyYGgI61iXCB8aIWyld6DtHjDJ3mg=;
        b=Y4HualM0Z1OWWpNh8NGz4Qfmt4FEKFYl7j2dl+80NaiWYL+WcWYbEkR6v9nROm0VMO
         FuHj8bDKxme9x2GPgTcAE+xdUCzZ0AjLZ+arrtat3EvDFhS+K7fUpiP0K0gQxiCnavTh
         7Ko4nZNlOWmI8LTMfr1zhQa16lEU5Xe9Dn9oPP1W7eziwpZrtCggXijmjmsjYEqAiXsX
         v15Icmd9Jmuayr6/CQffnLzGTfdSRKcM7SwMb0xmPIDTx8Nl7uU/m8caYxWyRBPNrxEa
         wMJZ7hiQjyQNyodKDAlLbsceWdyIUxb/Uivawkio5oFyr5j2YCL7h8Q/JWDVmfM6LeOn
         gdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697545278; x=1698150078;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8ILzoINks0Vh1TyYGgI61iXCB8aIWyld6DtHjDJ3mg=;
        b=XK2cWMaXm9khxOmRBkvHpBShsYRZiiSLwFdIqYtbz0dzWErXpenHxFiXu7bGCZ0Shm
         jhUgpLigQTfvxA1dHAOQTvFDB88p6U2Z1cjNfVSk+ZL06vu85pMjHRhWVzSzOYXGvn6C
         HmQX0c8GZkd+PRCxka5wCFbozJOqof+OldfKvHJs7fD6RWQvyJ18uagzXMGJC++CY/UN
         hRXmexWriqhBRLXzvApLwkmWnIW0rFyWpS+nCXUhgBTQsUpw+uLihI34rqMsiX7vlb6b
         2NsNN8hXwbrro1zN58N4BTqLbcnIiCK06bJEHvAGQhIL24/dL+tStHPm3/0OQEjc/iO5
         QhwQ==
X-Gm-Message-State: AOJu0YzHZCb5GyGylNU2Nyb7jZhl3WPjh8L2Lwsu+jMH70fdFK8xVHkt
	volH2jS4gjb7mG++SRE69QA=
X-Google-Smtp-Source: AGHT+IFa+nVeiySasDgnd1DxqsgusPoITNjfu+fciouY6LIfsSBNS/Ya9BD07DYqkMsqmw01ppOx+w==
X-Received: by 2002:a05:690c:9e:b0:59b:bed9:9a3a with SMTP id be30-20020a05690c009e00b0059bbed99a3amr2628007ywb.41.1697545277753;
        Tue, 17 Oct 2023 05:21:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:4958:98c8:dad1:e83e? ([2600:1700:9190:ba10:4958:98c8:dad1:e83e])
        by smtp.gmail.com with ESMTPSA id g134-20020a81528c000000b0059ae483b89dsm568999ywb.50.2023.10.17.05.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 05:21:17 -0700 (PDT)
Message-ID: <51e74848-ab36-4dc2-97bb-760c2b26e40a@gmail.com>
Date: Tue, 17 Oct 2023 08:21:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickledore merge request: Oct 17th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 12:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105552

The following changes since commit 922f41b39f364e5b6be596b4b51e0fb37ffe1971:

   x11vnc: Fix CVE-2020-29074 (2023-09-27 07:40:56 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to 39968837196cb48209b71e8852dd04a2f8ccdca8:

   nginx: add configure option (2023-10-15 19:09:42 -0400)

----------------------------------------------------------------
Changqing Li (1):
       redis: upgrade 7.0.12 -> 7.0.13

Joe Slater (2):
       python3-inotify: fix tests
       nginx: add configure option

Khem Raj (1):
       kernel-selftest: Build headers before compiling tests

Meenali Gupta (1):
       lldpd: upgrade 1.0.16 -> 1.0.17

Robert Yang (1):
       frr: Fix CVE-2023-41358 and CVE-2023-41360

Yi Zhao (1):
       frr: Security fix CVE-2023-38802

  .../recipes-daemons/lldpd/{lldpd_1.0.16.bb => lldpd_1.0.17.bb} |   2 +-
  meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch  | 139 
+++++++
  meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch  | 106 
+++++
  meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch  | 35 ++
  meta-networking/recipes-protocols/frr/frr_8.4.4.bb              | 3 +
  .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
  .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
  .../redis/{redis-7.0.12 => redis-7.0.13}/GNU_SOURCE-7.patch |   0
  .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
  .../redis/{redis-7.0.12 => redis-7.0.13}/init-redis-server |   0
  .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
  .../{redis-7.0.12 => redis-7.0.13}/oe-use-libc-malloc.patch |   0
  .../redis/{redis-7.0.12 => redis-7.0.13}/redis.conf |   0
  .../redis/{redis-7.0.12 => redis-7.0.13}/redis.service |   0
  .../recipes-extended/redis/{redis_7.0.12.bb => redis_7.0.13.bb} |   2 +-
  meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb       | 2 +-
  .../python/python3-inotify/new-test-inotify.patch               | 620 
++++++++++++++++++++++++++++
  meta-python/recipes-devtools/python/python3-inotify_git.bb      | 1 +
  .../recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch | 39 ++
  meta-webserver/recipes-httpd/nginx/nginx.inc                    | 3 +
  20 files changed, 949 insertions(+), 3 deletions(-)
  rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.16.bb => 
lldpd_1.0.17.bb} (96%)
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch
  rename meta-oe/recipes-extended/redis/{redis-7.0.12 => 
redis-7.0.13}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.12 => 
redis-7.0.13}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.12 => 
redis-7.0.13}/GNU_SOURCE-7.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.12 => 
redis-7.0.13}/hiredis-use-default-CC-if-it-is-set.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.12 => 
redis-7.0.13}/init-redis-server (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.12 => 
redis-7.0.13}/lua-update-Makefile-to-use-environment-build-setting.patch 
(100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.12 => 
redis-7.0.13}/oe-use-libc-malloc.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.12 => 
redis-7.0.13}/redis.conf (100%)
  rename meta-oe/recipes-extended/redis/{redis-7.0.12 => 
redis-7.0.13}/redis.service (100%)
  rename meta-oe/recipes-extended/redis/{redis_7.0.12.bb => 
redis_7.0.13.bb} (96%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-inotify/new-test-inotify.patch
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch


