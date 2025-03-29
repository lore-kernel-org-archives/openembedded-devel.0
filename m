Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F2EC36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 18:11:27 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.15748.1743271881529901142
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Mar 2025 11:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H0lCflYF;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e60ad903382so2256307276.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743271880; x=1743876680; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8IOkSEHAAA1kqSBLH/nYLSny6KNKNC2672unQAVsng=;
        b=H0lCflYFJcXsZDPNM88jP7fxvxQSF/RTDfLHLPty7k2slzdKYAN6x+AthZXDjy1eqB
         q3edxXV2muR9Y8aVKyjKEvyOTv9DDoq/55zI00rz2OcdlOWgVDF0B3diG+YsqH8ygo2s
         Rw/NX0ZEcvwYv68jiQzQ3v8R2Zi7YEqsNGHvCVnsjM4d1L9SnohSkzdra+FDNLADxazG
         U7YX14JKML94ew4/7C6BTlHQ2k8ILedVEEyzWriwH4WiE12O9pMwvhExPb8hdmC9j3GL
         jYqjzrwqm3oLmwuWos+wI0n8hT+bUo3j5qxxiA+Ed3TtNNjnaRe6uwAgQqx152QkvCA+
         8IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743271880; x=1743876680;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8IOkSEHAAA1kqSBLH/nYLSny6KNKNC2672unQAVsng=;
        b=Zh4GG1f7QmdaF1rbEvSEdElUaq7qJFFMZSArDhS8mMOpgrcZx6hDW87+27BSpQ85Pt
         EQ5tsS85VCQMe9oUMjMMoixgOYz2mdmOCFhE/LEvnQfF0iPNY/yw+XIWxB0oyAWOHbaN
         gewL5AVWEWAFOFdyC5tZHJCQGCVIrHQHvwxklxdJIsdNA6TvV12qTmD5Vb4nMA1jEPWO
         WDA8rbc60vvL39Dd9kds406e/2V3O7BWJt2xGtC4NXio4s3PZH2pqiaFiuGgJ6rRzgZY
         a7RbpGMqtsGVitt0+TY/sJ5C61UrDew5KqnslMZv9FLKC8cKCFFtmo/wVZvo1ZPAHKDR
         tq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWobzCeLGGeU1WMYU9Up3R18tnSZf3DdTMdW9ndhlGXsKAJlQibOXc0jmt4W19YkRmLAf/B4FTTcISYTmD9nrL+5z8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzh0s++MWcBIltCVOWgNuyHwvVCj1WJw3P7Az0VToZ8eLluyMKn
	E5nmKyuyrayZrD4C9QEnvYzeQcBtKgQBZJTK62UdLYKH2iQsF59u
X-Gm-Gg: ASbGnctEcfofSB2NIih2SIDhehSTUTNnxiqravXL9OKoxc+Kise1dpuylSDLhB7VOu7
	C0QXxTGkyHnnYoqnO6hwuKIpVlW9i2lnWLD34IekkKpHFOVn6V94x13hHMRj9T4Xnqxtqx+5sXi
	tbzarKsO2xEK/FlrexDNENZys0VUKoi/D0uF/7v/V1MxhQvGjG6NxQzfEtwGhT3lNyXsrkGFjxf
	fzaourgmxjMPyH5o30oX69g/chgvwaSLc05KDCz7QDFEEX39cEHa0mKiWmK+3fodR3/ymA0E5uu
	PXnxSkEcgEhTQV6GGsOtM43O1XSV1dJKU7zPrq4uAbOhfAPlmKi4/GYSK37Il+JBe00Im9+Ek+9
	UtgfEYlGCBX3iE/tPbHMu
X-Google-Smtp-Source: AGHT+IHtFNeul+7tGuxYFrp5ABmOpD08Zm5DzhdQlJsl8meC5kWD8rSDVHj8ih7bghpzZomowvBCgA==
X-Received: by 2002:a05:690c:6103:b0:6f9:8605:ec98 with SMTP id 00721157ae682-702572f0bbcmr48800427b3.28.1743271880610;
        Sat, 29 Mar 2025 11:11:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:e1a8:da73:9f2c:90fb? ([2600:1700:45dd:7000:e1a8:da73:9f2c:90fb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7023a341c08sm13240377b3.9.2025.03.29.11.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 11:11:20 -0700 (PDT)
Message-ID: <a1271383-1bbb-434a-a8cf-1b34a1b32146@gmail.com>
Date: Sat, 29 Mar 2025 14:11:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: March 29th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 18:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116372

The following changes since commit edd1a1e284fdcb80cd48d411f235d47f23bc27ae:

   mongodb: fix build with python 3.12 (2025-03-07 19:40:51 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 67ad83dd7c2485dae0c90eac345007af6195b84d:

   krb5: fix CVE-2025-24528 (2025-03-27 14:04:21 -0400)

----------------------------------------------------------------
Alexandre Truong (1):
       lcov: include UPSTREAM_CHECK_* to fix UNKNOWN_BROKEN status

Claus Stovgaard (2):
       lcov: sort RDEPENDS alphabetical
       lcov: Add missing RDEPENDS

Divya Chellam (1):
       krb5: fix CVE-2025-24528

Jinfeng Wang (1):
       netplan: Fix CVE-2022-4968

Libo Chen (1):
       libgpiod: fix gpiod-cxx-test failed test case

Sofiane HAMAM (2):
       Wolfssl: add ptest
       wolfssl: Upgrade 5.7.0 -> 5.7.2

Vijay Anusuri (2):
       postgresql: upgrade 16.5 -> 16.8
       wireshark: upgrade 4.2.7 -> 4.2.9

  .../conf/include/ptest-packagelists-meta-networking.inc         | 1 +
  meta-networking/recipes-connectivity/wolfssl/files/run-ptest    | 24 ++
  meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb   | 22 --
  meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb   | 41 +++
  .../recipes-core/images/meta-networking-image-ptest.bb          | 1 +
  .../recipes-support/wireshark/files/CVE-2024-9781.patch         | 133 
--------
  .../wireshark/{wireshark_4.2.7.bb => wireshark_4.2.9.bb} |   3 +-
  .../recipes-connectivity/netplan/netplan/CVE-2022-4968.patch    | 452 
++++++++++++++++++++++++++++
  .../meta-python/recipes-connectivity/netplan/netplan_1.0.bb     | 1 +
  meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-24528.patch     | 68 +++++
  meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb                | 1 +
  .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 2 +-
  .../postgresql/{postgresql_16.5.bb => postgresql_16.8.bb} |   4 +-
  meta-oe/recipes-support/lcov/lcov_1.16.bb                       | 17 +-
  ...1-bindings-cxx-tests-set-direction-when-reconfiguring-.patch | 38 +++
  meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb              | 2 +
  16 files changed, 645 insertions(+), 165 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/wolfssl/files/run-ptest
  delete mode 100644 
meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.0.bb
  create mode 100644 
meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
  delete mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch
  rename meta-networking/recipes-support/wireshark/{wireshark_4.2.7.bb 
=> wireshark_4.2.9.bb} (96%)
  create mode 100644 
meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/CVE-2022-4968.patch
  create mode 100644 
meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-24528.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_16.5.bb => 
postgresql_16.8.bb} (75%)
  create mode 100644 
meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-set-direction-when-reconfiguring-.patch


