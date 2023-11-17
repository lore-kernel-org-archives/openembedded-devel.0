Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C08C197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 15:33:35 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.14231.1700235212393261844
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 07:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AmMR5G0j;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5a7b3d33663so23651167b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 07:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700235211; x=1700840011; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijF0a9ZN15VPqKi5itnsnC+7TaqV7yriJTwevis+mMQ=;
        b=AmMR5G0jKH7N7caxcntw8lxpIgV5odfQc9sDLBHNPVe1z1E6XHPxVtt/SdVqcxRMqR
         SFDYoplDD9wsZnpC6hprQGYK1euF1lSH/S+wGuoy8Qxf3eyIyQ/v8Lg76xfsE99FFeFq
         +HvUYyHkm6LKxB4r6gMgjXdqFW7LqZTanfQ1ale6SNnzSTT2l3QrRZOpWskbSJmdv0At
         oMfZ3aIXKX+sYfrZPGD+9N4EWdCUYQ7aJ2nNtSeIoScrrzwE4AyjtCtONsihl/DQg7AJ
         XCIjs8KckU/I5AkYI6jhku200R6JAcFbljaVX6tiFTw36UPolKVWlKczgzKfkZBvgJmH
         QluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700235211; x=1700840011;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ijF0a9ZN15VPqKi5itnsnC+7TaqV7yriJTwevis+mMQ=;
        b=BFWwfPofiteWCDJ5oPcgbNLzdAO8kLKHEQXZ7PbaT19xDlqX+nVltXU4XshgsmeahG
         bVXKRLQQEnZNJ5akdyy+pUL17NZg8oK8fPE6cewqFO7n2LkdKMSF/UBdo8pwUQBXUVwB
         7xQ9t8uK3B6ylAppx24L+1IUVU9ABMdB9mXnXF5tYw1+e4C/+NqhFRlyZRKpzYcRWsbN
         sLb48J4eqHfCkL4YTUjCKPFAO0WlulF8jTdkxmfF2sJmcKGymHa3NJqO9+ygH1/XKolL
         aLc0iH5+HaQ/0PJIlLCxYKgNZFpcvQ1o33w5j3PriRLpq2m3k59NCJNowA2EScxW3rG5
         f7PQ==
X-Gm-Message-State: AOJu0YxkiXZMBBJ7ZButaoGkSlebcxOMS37BWjmnz8T6s2ioTIhIOZsJ
	CN20S/UmCKkfnKK+TEoM7ZA=
X-Google-Smtp-Source: AGHT+IEV7Q4mB5i63+GNEdTTYG+hba68FvNeo6bsv5O6Pb16/Hw9ukd13YZSve11pQcRi/QwntHmGw==
X-Received: by 2002:a0d:d204:0:b0:5a7:b560:12df with SMTP id u4-20020a0dd204000000b005a7b56012dfmr19481021ywd.8.1700235211475;
        Fri, 17 Nov 2023 07:33:31 -0800 (PST)
Received: from [10.52.31.114] ([209.198.250.118])
        by smtp.gmail.com with ESMTPSA id u123-20020a818481000000b005a8dbe385d1sm539096ywf.12.2023.11.17.07.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 07:33:31 -0800 (PST)
Message-ID: <5cd95dd6-6410-4f51-be8e-40b3a01f6191@gmail.com>
Date: Fri, 17 Nov 2023 10:33:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickeldore merge request: Nov 17th.
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 15:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106869

The following changes since commit 39968837196cb48209b71e8852dd04a2f8ccdca8:

   nginx: add configure option (2023-10-15 19:09:42 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to aa5e8edabbc414d8ec1b2ad63c8743c7baf99626:

   nlohmann-json: Add ptest support (2023-11-16 21:49:15 -0500)

----------------------------------------------------------------
Archana Polampalli (2):
       nodejs: Upgrade 18.17.1 -> 18.18.2
       open-vm-tools: fix CVE-2023-34058

Changqing Li (1):
       cpuid: fix do_install

Joe Slater (1):
       python3-pynacl: add RCONFLICTS with python3-nacl

Mingli Yu (1):
       nlohmann-json: Add ptest support

Narpat Mali (1):
       traceroute: upgrade 2.1.2 -> 2.1.3

Sourav Pramanik (1):
       nlohmann-json: Avoid usage of nobranch=1

Wang Mingyu (1):
       postgresql: upgrade 15.3 -> 15.4

Yi Zhao (2):
       mbedtls: upgrade 2.28.3 -> 2.28.5
       libssh: upgrade 0.10.4 -> 0.10.5

  .../mbedtls/{mbedtls_2.28.3.bb => mbedtls_2.28.5.bb} |   2 +-
  .../open-vm-tools/open-vm-tools/CVE-2023-34058.patch            | 241 
++++++++++++++++++++++++++++
  .../recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb       | 1 +
  .../traceroute/{traceroute_2.1.2.bb => traceroute_2.1.3.bb} |   2 +-
  .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 8 +-
  .../postgresql/{postgresql_15.3.bb => postgresql_15.4.bb} |   2 +-
  meta-oe/recipes-devtools/cpuid/cpuid_20211129.bb                | 10 +-
  ...001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch | 36 +++++
  ...0001-custom-allocators-define-missing-rebind-type-3895.patch | 61 
+++++++
  ...1-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch | 31 ++++
  meta-oe/recipes-devtools/nlohmann-json/files/run-ptest          | 12 ++
  meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb  | 24 ++-
  .../oe-npm-cache                                                | 0
  ...oe-cache-native_18.17.bb => nodejs-oe-cache-native_18.18.bb} |   0
  .../nodejs/{nodejs_18.17.1.bb => nodejs_18.18.2.bb} |   4 +-
  meta-oe/recipes-support/libssh/libssh/run-ptest                 | 42 +----
  .../libssh/{libssh_0.10.4.bb => libssh_0.10.5.bb} |   5 +-
  meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb     | 4 +
  18 files changed, 429 insertions(+), 56 deletions(-)
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.3.bb 
=> mbedtls_2.28.5.bb} (98%)
  create mode 100644 
meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-34058.patch
  rename meta-networking/recipes-support/traceroute/{traceroute_2.1.2.bb 
=> traceroute_2.1.3.bb} (94%)
  rename meta-oe/recipes-dbs/postgresql/{postgresql_15.3.bb => 
postgresql_15.4.bb} (84%)
  create mode 100644 
meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch
  create mode 100644 
meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch
  create mode 100644 
meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch
  create mode 100755 meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.17 => 
nodejs-oe-cache-18.18}/oe-npm-cache (100%)
  rename 
meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.17.bb => 
nodejs-oe-cache-native_18.18.bb} (100%)
  rename meta-oe/recipes-devtools/nodejs/{nodejs_18.17.1.bb => 
nodejs_18.18.2.bb} (97%)
  rename meta-oe/recipes-support/libssh/{libssh_0.10.4.bb => 
libssh_0.10.5.bb} (85%)


