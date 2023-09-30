Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D6BE77372
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 11:54:00 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.39385.1696074837580947410
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Sep 2023 04:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gfb3/OQu;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59bebd5bdadso184115957b3.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 04:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696074837; x=1696679637; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ntmmk162D4/XI8uRZVEnDr08O0aWRO6+qP/O0S8QNpw=;
        b=gfb3/OQutWVMLZuur+YGvJfmKYl2gk0mKkvSZwhNbJ2iDJ3SRRW1769t2HE/tQJj5I
         Rud3U8Oy6xTG//Xqis3SKkoRhTeoj7EOIBYmWIOgJs1frrnb4DOXApXUIRiKPlpEjwow
         pjc0co3wXM8qvBTjz74C8WM2iZjSuH99PvszKF+BpYkwqK/lxAa7l9x9GXccLst899Zh
         VBRAi3isM8A9wNa/h7RSYpfnWajn/sodL9HOVcluVPc2xhQ6Jnkjh1qIu7XD06w0CoDS
         dMJ1M3e4G2+SOKQrbMMWnB/iiSGbbTPg1SxVlhJfR9vghGJpTD8IT22/Yd1jUQHkZkSC
         v4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696074837; x=1696679637;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ntmmk162D4/XI8uRZVEnDr08O0aWRO6+qP/O0S8QNpw=;
        b=YAQCYoqQ8WVhubhQDqbbpR+j+GCmKa8yJmq/+sq1L4wxTLx0tN0tGypLdG74S/8OrO
         HkzuQYqgEV/6p5MLmoIEl4bvpgTJzGPqss7E75UvlO/HUucpGUt9GAgTJZmFZmvCPW29
         4726I00kCDOpWDrPPO9u3Z67YySqCjbDFj1VjrmyLItnqlRx+/kRhcsnzBZQJR1AWz6B
         er3XQ2FjwTqZe0rX+yvprIL9Cw7xv+CmczyWKBj09NluGmDRscEDWLhhZlBjPpblw/xc
         fTTRHvYlnC8O+AkiRD2gA5vecQLHt3T90v78oi7oLv12DtBJOVSc+AddiSMbZ1n+Mf7a
         +klw==
X-Gm-Message-State: AOJu0YxhT+RKIvRo69nIPkZePAhOil4tk8UFGuWw5jPxq/shd43RGB+x
	Fb1c9yPcx8OU/Gk3UDoQUeE=
X-Google-Smtp-Source: AGHT+IGVYgtiG5AA0Gn73ym0ht00NVeAIOYlEPNuixAdY3LRT9P7Dxxr1yjicyR1qM20GXrZBCUE0A==
X-Received: by 2002:a0d:fe84:0:b0:5a1:d11e:b754 with SMTP id o126-20020a0dfe84000000b005a1d11eb754mr6727191ywf.26.1696074836591;
        Sat, 30 Sep 2023 04:53:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:6fe6:8aee:cf6d:41e6? ([2600:1700:9190:ba10:6fe6:8aee:cf6d:41e6])
        by smtp.gmail.com with ESMTPSA id m12-20020a819c0c000000b0059b24bd4f2asm6201663ywa.57.2023.09.30.04.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 04:53:55 -0700 (PDT)
Message-ID: <75ff44f4-5540-ed6f-c293-641cba5c4a05@gmail.com>
Date: Sat, 30 Sep 2023 07:53:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Sept 30th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 11:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105282

The following changes since commit a88cb922f91fda95e8a584cee3092083d5ad3e98:

   hwloc: fix CVE-2022-47022 (2023-09-06 09:13:26 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff:

   python3-django: upgrade 4.2.3 -> 4.2.5 (2023-09-27 10:23:28 -0400)

----------------------------------------------------------------
Armin Kuster (2):
       frr: Fix CVE-2023-41909
       openldap: update to 2.5.16

Hitendra Prajapati (1):
       wireshark: Fix CVE-2023-2906

Jose Quaresma (1):
       opensc: ignore CVE-2021-34193

Khem Raj (1):
       freeglut: Add packageconfigs for x11/wayland/gles

Mingli Yu (1):
       hdf5: Fix CVE-2021-37501

Narpat Mali (3):
       python3-django: fix CVE-2023-41164
       python3-django: upgrade 3.2.20 -> 3.2.21
       python3-django: upgrade 4.2.3 -> 4.2.5

Polampalli, Archana (1):
       redis: upgrade 7.0.12 -> 7.0.13

Shinu Chandran (1):
       c-ares: CVE-ID correction for CVE-2022-4904

Soumya Sambu (1):
       rabbitmq-c: Fix CVE-2023-35789

  meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch  | 42 
+++++++++
  meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
  .../recipes-support/wireshark/files/CVE-2023-2906.patch         | 38 
++++++++
  meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 1 +
  .../recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch  | 135 
++++++++++++++++++++++++++++
  meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb    | 4 +-
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
  meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb             | 18 +++-
  meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch       | 2 +-
  meta-oe/recipes-support/hdf5/files/CVE-2021-37501.patch         | 37 
++++++++
  meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb                     | 1 +
  .../openldap/0001-ldif-filter-fix-parallel-build-failure.patch  | 32 
-------
  .../0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch    | 33 
-------
  ...1-librewrite-include-ldap_pvt_thread.h-before-redefini.patch | 54 
-----------
  meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch | 30 
-------
  meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch | 76 
----------------
  .../openldap/{openldap_2.5.12.bb => openldap_2.5.16.bb} |   7 +-
  meta-oe/recipes-support/opensc/opensc_0.22.0.bb                 | 5 ++
  .../recipes-devtools/python/python3-django/CVE-2023-41164.patch | 105 
++++++++++++++++++++++
  meta-python/recipes-devtools/python/python3-django_2.2.28.bb    | 1 +
  .../{python3-django_3.2.20.bb => python3-django_3.2.21.bb} |   4 +-
  .../python/{python3-django_4.2.3.bb => python3-django_4.2.5.bb} |   4 +-
  31 files changed, 390 insertions(+), 242 deletions(-)
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch
  create mode 100644 
meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch
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
  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2021-37501.patch
  delete mode 100644 
meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-build-failure.patch
  delete mode 100644 
meta-oe/recipes-support/openldap/openldap/0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch
  delete mode 100644 
meta-oe/recipes-support/openldap/openldap/0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch
  delete mode 100644 
meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
  delete mode 100644 
meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
  rename meta-oe/recipes-support/openldap/{openldap_2.5.12.bb => 
openldap_2.5.16.bb} (96%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2023-41164.patch
  rename meta-python/recipes-devtools/python/{python3-django_3.2.20.bb 
=> python3-django_3.2.21.bb} (61%)
  rename meta-python/recipes-devtools/python/{python3-django_4.2.3.bb => 
python3-django_4.2.5.bb} (61%)


