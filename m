Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95159C64ED8
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 15:30:22 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.13613.1676734214588186168
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 07:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q9rG1Tw3;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id k27-20020a0568301bfb00b0068dbf908574so163862otb.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 07:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeXXlTJ6qjL9Laj+LGu7X6tCOt+n4zMb1hUyejMQuU8=;
        b=Q9rG1Tw3e3nrAx7PTBxyoBb+DMCeiSDSGN9inq64/WBZvjHbpiyO3EHhEa5HIAPLwQ
         edH5UezC3yLxgIxmtaHwyWIN6M1ehHZ+v/lfKd78u7s8jrXM13YSFdVbhG+/I5a+K4Aw
         ZEnrwfmtJbv1W9jjYXIJl/TpQr6qhv5Haz3fe4kGjkeg6Tf4STlG6dUlA+Cf+jVPcsqX
         VDiTkqZIuMZR/9w7rj32ebCWYWHN/upZtrPPG7Df2OeVqKcjVPlz2fEB0O+Cl1OK9qZj
         CR3GaUjikqai7Hpv8eYUWOkhuwOgOFI5GECyzSQ1G3Qtkjx3Zik+nToD7f6iFOVIw0D4
         Ja6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EeXXlTJ6qjL9Laj+LGu7X6tCOt+n4zMb1hUyejMQuU8=;
        b=rObGTjQJqEHmoVUeung7Ni8VWzewNjXnOap014I9nJFzdkqBdnbJlbB1iBWZTBF9Fj
         uy6fZQ1PYTzi7hQMLFAP6dtQsTuTB7NBxb7jGk1LqGoC5SSQ7WYeOjuYxzv0SX0GTKzX
         mu1ac2AaIQeRg61HMYRnh4SeIUtHxrmW5plTM7qSP3mohpFFX/6qbFz5tr1sdq9YXci3
         Ja+HEy7ATdkhdAqNWE1twDdYb6yZtoW/xeZ1yuiG5GfeYeiCEopJuN7lJVDQXSB4oyft
         7hcxIVueP6qAWGqAxkvCStEoOwXdYg3xRxzn/Hu42f1jBKBGq28BdTOBEvcIiNjkCbbw
         zcmQ==
X-Gm-Message-State: AO0yUKVJU1yl/2FSS+BYQHVm8EoZUUa27BWesUu+J1MyHFNeZ52y7FB5
	sowl0WTa4gwI9f0kEUaNzonQ0NdHWeU=
X-Google-Smtp-Source: AK7set+psdOgo9t7BV7vVPoS8W+dJnfhDoGLMqVfa8SKQ419P80iJ64DOlqGprdAIMVO/a+CI/fLTw==
X-Received: by 2002:a9d:7187:0:b0:68b:bc6c:d955 with SMTP id o7-20020a9d7187000000b0068bbc6cd955mr1566671otj.17.1676734213729;
        Sat, 18 Feb 2023 07:30:13 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:6068:6c1c:d873:82db? ([2600:1700:9190:ba10:6068:6c1c:d873:82db])
        by smtp.gmail.com with ESMTPSA id q15-20020a05683033cf00b00690f7c779ebsm1135400ott.7.2023.02.18.07.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 07:30:13 -0800 (PST)
Message-ID: <5dab99f6-266d-7c31-e226-98e6e24188bc@gmail.com>
Date: Sat, 18 Feb 2023 10:30:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: langdale merge request: Feb 18th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 15:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101143

The following changes since commit e7c754778edb25f35896137c8b174669392c492a:

   nodejs: upgrade 16.18.1 -> 16.19.0 (2023-02-04 12:16:04 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded langdale-next

for you to fetch changes up to 30f4c2b3ae182513b967185e06bc8409a0ee6092:

   mdns: use git fetcher (2023-02-15 08:02:50 -0500)

----------------------------------------------------------------
Chee Yang Lee (1):
       tinyproxy: fix CVE-2022-40468

Dmitry Baryshkov (1):
       nss: fix cross-compilation error

Joe Slater (1):
       phoronix-test-suite: fix CVE-2022-40704

Khem Raj (1):
       net-snmp: Fix build with clang16

Martin Jansa (2):
       exiv2: fix SRC_URI
       mdns: use git fetcher

Narpat Mali (1):
       net-snmp: CVE-2022-44792 & CVE-2022-44793 Fix NULL Pointer Exception

Randy MacLeod (2):
       python3-pillow: add ptest support
       python3-pillow: Add distutils, unixadmin for ptest

Wang Mingyu (5):
       python3-pillow: upgrade 9.2.0 -> 9.3.0
       python3-pillow: upgrade 9.3.0 -> 9.4.0
       apache2: upgrade 2.4.54 -> 2.4.55
       python3-django: upgrade 4.1 -> 4.1.3
       python3-django: upgrade 4.1.3 -> 4.1.6

Yi Zhao (1):
       freeradius: Security fixes for CVE-2022-41860 CVE-2022-41861

  .../recipes-connectivity/freeradius/files/CVE-2022-41860.patch  | 118 
+++++++++++++++++++
  .../recipes-connectivity/freeradius/files/CVE-2022-41861.patch  | 53 
+++++++++
  .../recipes-connectivity/freeradius/freeradius_3.0.21.bb        | 2 +
  .../0001-Create-subroutine-for-cleaning-recent-interfaces.patch | 0
  .../{files => mdns}/0001-dns-sd-Include-missing-headers.patch |   0
  .../{files => mdns}/0001-mdns-include-stddef.h-for-NULL.patch |   0
  .../0002-Create-subroutine-for-tearing-down-an-interface.patch  | 0
  .../0002-mdns-cross-compilation-fixes-for-bitbake.patch         | 0
  .../{files => mdns}/0003-Track-interface-socket-family.patch |   0
  .../{files => mdns}/0004-Use-list-for-changed-interfaces.patch |   0
  .../mdns/{files => mdns}/0006-Remove-unneeded-function.patch |   0
  .../mdns/mdns/0006-make-Add-top-level-Makefile.patch            | 175 
++++++++++++++++++++++++++++
  .../0008-Mark-deleted-interfaces-as-being-changed.patch         | 0
  .../{files => mdns}/0009-Fix-possible-NULL-dereference.patch |   0
  .../{files => mdns}/0010-Handle-errors-from-socket-calls.patch |   0
  ...011-Change-a-dynamic-allocation-to-file-scope-variable.patch | 0
  .../recipes-protocols/mdns/{files => mdns}/mdns.service |   0
  meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb       | 44 
++++---
  .../0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch      | 32 +++++
  .../net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch       | 121 
+++++++++++++++++++
  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb    | 2 +
  .../recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch    | 33 
++++++
  meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb   | 1 +
  .../phoronix-test-suite/files/CVE-2022-40704.patch              | 46 
++++++++
  .../phoronix-test-suite/phoronix-test-suite_10.8.4.bb           | 5 +-
  meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb                   | 2 +-
  .../nss/nss/0001-nss-fix-support-cross-compiling.patch          | 7 +-
  .../python/{python3-django_4.1.bb => python3-django_4.1.6.bb} |   2 +-
  meta-python/recipes-devtools/python/python3-pillow/run-ptest    | 3 +
  .../python/{python3-pillow_9.2.0.bb => python3-pillow_9.4.0.bb} |  30 
++++-
  .../apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb} |   2 +-
  31 files changed, 653 insertions(+), 25 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
  create mode 100644 
meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0001-Create-subroutine-for-cleaning-recent-interfaces.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0001-dns-sd-Include-missing-headers.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0001-mdns-include-stddef.h-for-NULL.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0002-Create-subroutine-for-tearing-down-an-interface.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0002-mdns-cross-compilation-fixes-for-bitbake.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0003-Track-interface-socket-family.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0004-Use-list-for-changed-interfaces.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0006-Remove-unneeded-function.patch (100%)
  create mode 100644 
meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0008-Mark-deleted-interfaces-as-being-changed.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0009-Fix-possible-NULL-dereference.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0010-Handle-errors-from-socket-calls.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch (100%)
  rename meta-networking/recipes-protocols/mdns/{files => 
mdns}/mdns.service (100%)
  create mode 100644 
meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch
  create mode 100644 
meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
  create mode 100644 
meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
  create mode 100644 
meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch
  rename meta-python/recipes-devtools/python/{python3-django_4.1.bb => 
python3-django_4.1.6.bb} (58%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-pillow/run-ptest
  rename meta-python/recipes-devtools/python/{python3-pillow_9.2.0.bb => 
python3-pillow_9.4.0.bb} (53%)
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.54.bb => 
apache2_2.4.55.bb} (99%)


