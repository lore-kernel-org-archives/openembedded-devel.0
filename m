Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD4FC46CC7
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 23:16:05 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.398.1700003762215562175
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 15:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V0WDpdlf;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5b499b18b28so71770987b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 15:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700003761; x=1700608561; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khW0tzOd2z0eVbmcLf19Hkzq5blwM3mKNRq9KDJimKA=;
        b=V0WDpdlfxFiO1lM46xk4ivREnjuEjK6u0ZDVJdjaDrxBQvtf5OklYwBDFqlYWATvKl
         BOFkHeKOsbjyTZ7tKzJdIvKYgXzl6ylDC+CPAA5DzvgH+My/AoBcUSWqcWN2pmO5cDbr
         LOarBqc/2XoULsXxw5dTK9YfMxSVHcViX09sqHYXNO/d5hp+jQbVs0R2ca5d/XALH+B7
         IWVWmreugsrxZKuKPXgecF1XQQjsRaCWqA/R00B3FO+F5N2lsh8d+X6pETS/S7rzl7BU
         uejm3+VxbcmX8elbcwaEed64z73dT2X3zx4j7UhldAepbLW4YxlNjvcIbQiRhD6oBC9Z
         WrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700003761; x=1700608561;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khW0tzOd2z0eVbmcLf19Hkzq5blwM3mKNRq9KDJimKA=;
        b=A3LQE6xLer5NTwn9Mw81M31LySxO/X/lEsITh1K9oxhsWfuO4RCXh1kZutjPoqNT+V
         uz90sCtY3GPeoOod/PpRP1/OFUcdIrsozKhGcfbZVfG3NK66FrFVARyr4heajnOXhop+
         LoxfhAoKD1nOMXjirAxJeSiDcjhPvn7Q6wGSJBVuQAoKhbyaf10ugZyxVpVqfOzjMFen
         EaTX2MsD3W55lTV9oISOL4udviXoWG5eB1Nb31dPgnmJ7J8ULpYZq4kucnpS80c9zyl6
         tOwm5cQANuSmry7as8PL+q4wFjGdxOPy8N4fVsCKpqDANQC+121vk09+8BmmzlqCnhCi
         mhOQ==
X-Gm-Message-State: AOJu0YxHGQbput+Kqq2yEJNd4uymgHHTSVHEi1eBvApF7Fa6YtBPYKxn
	ngEECccq4Jq1W8QiEyeGdRs=
X-Google-Smtp-Source: AGHT+IEBCdX/OLZxgx6WT+BvXHDzkwV2S3N2vooFlZ4lMzR91S7Z0MeBukX/gK4SEiTVICbW1wuFXQ==
X-Received: by 2002:a0d:f9c7:0:b0:5a8:19c0:bb6b with SMTP id j190-20020a0df9c7000000b005a819c0bb6bmr10784212ywf.36.1700003761207;
        Tue, 14 Nov 2023 15:16:01 -0800 (PST)
Received: from [172.20.0.127] ([12.110.163.194])
        by smtp.gmail.com with ESMTPSA id a65-20020a818a44000000b00559f1cb8444sm31405ywg.70.2023.11.14.15.16.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 15:16:00 -0800 (PST)
Message-ID: <5df64760-584e-4980-b07c-57fb6a330fc6@gmail.com>
Date: Tue, 14 Nov 2023 18:15:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: Nov 14th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106725

The following changes since commit 300be975359fdb3a3b2bf7c6fe15dea7acac575d:

   libssh2: Backport fix for CVE-2020-22218 (2023-10-21 16:31:35 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 9135c7ea7350d5d241f4afc3b28087122ebe2d19:

   glmark2: fix compatibility with python-3.11 (2023-11-12 10:42:03 -0500)

----------------------------------------------------------------
Hitendra Prajapati (1):
       wireshark: Fix CVE-2023-3649

Khem Raj (1):
       ibus: Swith to use main branch instead of master

Martin Jansa (2):
       libiio: use main branch instead of master
       glmark2: fix compatibility with python-3.11

Richard Purdie (1):
       grubby: Update branchname to match upstream

  meta-gnome/recipes-support/ibus/ibus.inc                        | 2 +-
  meta-initramfs/recipes-devtools/grubby/grubby_git.bb            | 2 +-
  .../recipes-support/wireshark/files/CVE-2023-3649.patch         | 231 
++++++++++++++++++++++++++++
  meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb   | 1 +
  .../files/0001-waflib-fix-compatibility-with-python-3.11.patch  | 76 
+++++++++
  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb                | 5 +-
  meta-oe/recipes-support/libiio/libiio_git.bb                    | 2 +-
  7 files changed, 314 insertions(+), 5 deletions(-)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-3649.patch
  create mode 100644 
meta-oe/recipes-benchmark/glmark2/files/0001-waflib-fix-compatibility-with-python-3.11.patch


