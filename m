Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BCCC3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 12:09:50 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.5742.1722946188389286284
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 05:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mMYyMSnX;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-65f7bd30546so5753737b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 05:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722946187; x=1723550987; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPTNXR5uCgRZpJo4pwUxGrAeipu2yLEJ+xTWIs7vwZ0=;
        b=mMYyMSnX4HDxM7uOt0RoPefGEk7UoV0Kpw/0VT2yhSGO4cenrYLjgq1NnSCrDfg+VX
         KpGjDbyJMqhM/04LWHnbRHCsYxdrd2io+92INo6PwNvusW/P1uvG5GaL7KVUZ6X3dDBR
         cxCBslaJLd6pIAtO/L9pHTV2jpyugfkqoI9N14ZsWrfTUxiGAzs5oIonzJxzWzkJYJTm
         vJTMIJQubkcDTcmz/75yBnrqarwzIjNKVn/I3fLBV6JQWPmgi+PQBblA77PSjx/udIwb
         V+99w4a/gOV8E6IYshjmnCD6Tvuflh5FTxfi6n0ZsJ0yBCR0MYrcLuxuLFc2AFWslpS1
         MISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722946187; x=1723550987;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPTNXR5uCgRZpJo4pwUxGrAeipu2yLEJ+xTWIs7vwZ0=;
        b=I+s+bcnEhZ7LqlQxAyRlmOBalAZehFpyDU4GlwbMc4WVrLV5YZNiRZN6wU4mA/duCw
         v6g4QvwJnajmHrfA3HQUzqQxW6Fpok3hxvduzIsyqJJ+c0RwmtFrSbW28mwp6ojcW7z6
         9ozG52er8dq9metEj3z2zGpqIAkMw4z5jmj2uZCYG8Gr1UpNOoK/rdpeLffkLuwzVuOk
         IdQ1xd1UA8GnGPx0T3PKk03gAfMXKEcaMPoQl4nx2KLu1VwUG40l9SQvjjeU1xEzCCoJ
         RxbN4CCX97ZyRU/pgDI9Ln7+sarz5TXxVLgl3Pt99zBokGceMXFhZJYZZ+kYOCfwUuhH
         7FfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUamwKutDyo+3c7I1u/KhPgQdrsDXvvQ8ncepSSehZ4lvwesunQmKNaVhAXGxvz6cIUead+Tx5w3tcIq8mwV5LTVCPfHUkHX1oPvL6GUNS0KFHBt65KfoTHgQ==
X-Gm-Message-State: AOJu0YzkUKecQouww9nsbTp5E2aAAOhhs5q8lZJm69MRWxaIBTlnJTx8
	/p25y86cEjqnfiuU/R4B/ZRpNn+74YexKzK0ZgifH37jYnPKjT5j
X-Google-Smtp-Source: AGHT+IGsoZc6kprHUYHaUJsp+L+rnJAdocxiQpsvzlrcnMK2RV/DA27WDT+bH3LhQL9ym9JQgIiJbw==
X-Received: by 2002:a0d:e741:0:b0:65f:d6fe:5de4 with SMTP id 00721157ae682-688554df748mr130166097b3.21.1722946187347;
        Tue, 06 Aug 2024 05:09:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:4300:30cd:ed94:a289? ([2600:1700:45dd:7000:4300:30cd:ed94:a289])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-68a136bfa14sm15293757b3.121.2024.08.06.05.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 05:09:47 -0700 (PDT)
Message-ID: <94a40b8b-36f1-4af0-a452-f3c8f58ec389@gmail.com>
Date: Tue, 6 Aug 2024 08:09:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: Aug 6th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 12:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111580

The following changes since commit 80e01188fa822d87d301ee71973c462d7a865493:

   nftables: change ptest output format (2024-07-23 15:24:57 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 2338409efc51cf2022ff5610a9fb689251706e2b:

   python3-pydantic-core: Fix build with python 3.12.4 (2024-08-03 
12:25:17 -0400)

----------------------------------------------------------------
Barry Grussling (1):
       postgresql: Break perl RDEPENDS

Benjamin Szőke (1):
       tree: fix broken links

Chen Qi (1):
       python3-protobuf: remove useless and problematic .pth file

Etienne Cordonnier (2):
       uutils-coreutils: upgrade 0.0.25 -> 0.0.26
       uutils-coreutils: upgrade 0.0.26 -> 0.0.27

Khem Raj (1):
       python3-pydantic-core: Fix build with python 3.12.4

Poonam Jadhav (1):
       tcpreplay: Fix CVE-2023-4256

Siddharth Doshi (1):
       apache2: Upgrade 2.4.60 -> 2.4.62

Soumya Sambu (2):
       python3-sqlparse: Fix CVE-2024-4340
       python3-werkzeug: upgrade 3.0.1 -> 3.0.3

Wang Mingyu (1):
       python3-email-validator: upgrade 2.1.0 -> 2.1.1

Yogita Urade (2):
       graphviz: fix CVE-2023-46045
       hdf5: upgrade to 1.14.4

Zhang Peng (1):
       hiredis: remove ANSI color from ptest result

  .../recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch     | 27 +++
  meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb    | 1 +
  .../recipes-core/uutils-coreutils/uutils-coreutils-crates.inc   | 288 
+++++++++++++++++-----------
  .../{uutils-coreutils_0.0.25.bb => uutils-coreutils_0.0.27.bb} |   2 +-
  meta-oe/recipes-dbs/postgresql/postgresql.inc                   | 10 +-
  meta-oe/recipes-extended/hiredis/hiredis/run-ptest              | 12 +-
  .../graphviz/graphviz/CVE-2023-46045-0001.patch                 | 37 ++++
  .../graphviz/graphviz/CVE-2023-46045-0002.patch                 | 38 ++++
  .../graphviz/graphviz/CVE-2023-46045-0003.patch                 | 33 ++++
  meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb             | 3 +
  .../hdf5/files/0001-cmake-remove-build-flags.patch              | 41 +---
  .../recipes-support/hdf5/{hdf5_1.14.2.bb => hdf5_1.14.4-3.bb} |  13 +-
  meta-oe/recipes-support/tree/tree_2.1.1.bb                      | 4 +-
  ...mail-validator_2.1.0.bb => python3-email-validator_2.1.1.bb} |   4 +-
  meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb  | 8 +
  .../0001-Fix-generate_self_schema-for-Python-3.12-1299.patch    | 29 +++
  .../recipes-devtools/python/python3-pydantic-core_2.16.3.bb     | 3 +-
  .../python/python3-sqlparse/CVE-2024-4340.patch                 | 48 +++++
  meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb   | 1 +
  .../{python3-werkzeug_3.0.1.bb => python3-werkzeug_3.0.3.bb} |   4 +-
  .../apache2/{apache2_2.4.60.bb => apache2_2.4.62.bb} |   2 +-
  21 files changed, 437 insertions(+), 171 deletions(-)
  create mode 100644 
meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch
  rename 
meta-oe/recipes-core/uutils-coreutils/{uutils-coreutils_0.0.25.bb => 
uutils-coreutils_0.0.27.bb} (98%)
  create mode 100644 
meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0001.patch
  create mode 100644 
meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0002.patch
  create mode 100644 
meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0003.patch
  rename meta-oe/recipes-support/hdf5/{hdf5_1.14.2.bb => 
hdf5_1.14.4-3.bb} (84%)
  rename 
meta-python/recipes-devtools/python/{python3-email-validator_2.1.0.bb => 
python3-email-validator_2.1.1.bb} (59%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-sqlparse/CVE-2024-4340.patch
  rename meta-python/recipes-devtools/python/{python3-werkzeug_3.0.1.bb 
=> python3-werkzeug_3.0.3.bb} (83%)
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.60.bb => 
apache2_2.4.62.bb} (99%)

