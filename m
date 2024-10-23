Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EF1CF5396
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 14:52:52 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.11206.1729695167646601968
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 07:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QdXQa6su;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e59a9496f9so78521767b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 07:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729695167; x=1730299967; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KROgiZszi3YN6puNTgnxaN0PFB3MPUst8R9zxPJdwWE=;
        b=QdXQa6su+OLUigxgc1wzux9xknAJjQdcMrJp8aFY4JuICN/izbJ0BC0pyzDSKJBewH
         MEei93/fZF6DQxh2bQuNNgQ+RylAjT43oIy45rZtje4S6bfhQyMZpY1AeT/m144JcFmz
         01kP2cvZgv2mQ6+9DUuBKSUNwOyxcBXVP9nBlMuWql6mA7Jgz4uIjpH9+0TFJTjuWYjl
         C+jm9JZh90hVtGWXHfRgtysRAPq6Bdt82nVzLAp053Pmz/RoZE5eiu8UN78ODPNVHGod
         lsUKh9hkDR7Ou6qFer7eoOrH3mpv1IvWdXJ81z0i2vtFcm7drgN63g8Ug5dbDemgCKbM
         NNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729695167; x=1730299967;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KROgiZszi3YN6puNTgnxaN0PFB3MPUst8R9zxPJdwWE=;
        b=nTTHF1uLCFeE/MJndjOXPFKbQD/n9TzNGhPaP3z0Ttw6tnscT9PaeQF9VypDmFA77H
         cOMnpk2yl0JzB4PG/Ew8xn3Zl6LiG40EnEJxY/fPcfaPUMsebivP3M4CzXuqWdLEaIGP
         Y4LtQBW29yuuQBoD5QEWnC2p1IWv+X8yxJfWIOUXPYYWioe7DxT+KBZNebI50JaOdM2O
         5KVDz/bRz57GuoHJ3Z6h3LosfZuTd1/e31SyReCo84HvzyLry4OR5d2ZIcSar06H3jwY
         E9Fs9Clc2N+mh44+ZN3KrOpOHS5nmTMklfPIR46UKadNtM5VL8a56+jbInNY++mESLV6
         DG/A==
X-Forwarded-Encrypted: i=1; AJvYcCW23F3JFl4ybxzgl8QHx4JNX6sB+j49gAbFB4AoduPRcI+0u4eX+G9IWzd89CKACB2OAD1C98AfM7++QYdkNXlRoNI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMENnoqXN/41YwLkJTlFjx7qUsaxXMRGv07APWSJHPhI+3aYN2
	3XbS6IuqL3BNa+udabNuPW507ycCDjrcsmWPa8uTG2Gmd/Tly25m
X-Google-Smtp-Source: AGHT+IF5xX5EHkbvRHpFfbx8q/mUxCLtSdCUJaLWEoQSdqLtC87OHf0IUwN+4dofCeoAVzQuNDaHiA==
X-Received: by 2002:a05:690c:4b92:b0:6e3:39e5:f0ed with SMTP id 00721157ae682-6e7f0e54f65mr33824387b3.26.1729695166754;
        Wed, 23 Oct 2024 07:52:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:785d:b950:7f06:79a3? ([2600:1700:45dd:7000:785d:b950:7f06:79a3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ccb41csm15701297b3.97.2024.10.23.07.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 07:52:46 -0700 (PDT)
Message-ID: <c7b875af-a2c0-4c29-a3fa-21d6e51ae25d@gmail.com>
Date: Wed, 23 Oct 2024 10:52:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Oct 23rd
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 14:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113153

The following changes since commit dd3d2293ffdf2559f8a433f241765a8ab50cd085:

   python3-smbus2: Fix LIC_FILES_CHKSUM (2024-09-22 10:16:22 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 4ad41baed6236d499804cbfc4f174042d84fce97:

   sound-theme-freedesktop: Update SRC_URI (2024-10-13 11:19:56 -0400)

----------------------------------------------------------------
Divya Chellam (1):
       frr: fix CVE-2024-44070

Dmitry Baryshkov (1):
       android-tools: Create flag file /etc/usb-debugging-enabled

Guocai He (1):
       xmlrpc-c: fix do_fetch error

Liyin Zhang (3):
       libatasmart: Update SRC_URI to fix fetch issue
       keyutils: Update SRC_URI
       sound-theme-freedesktop: Update SRC_URI

Mingli Yu (1):
       rocksdb: Add ptest support

Peter Kjellerstedt (1):
       libdevmapper: Inherit nopackages

Peter Marko (1):
       cjson: upgrade 1.7.17 -> 1.7.18

Raghuvarya S (1):
       android-tools-adbd.service: Update ConditionPathExists to /etc

Vijay Anusuri (1):
       tgt: Security fix for CVE-2024-45751

  meta-networking/recipes-extended/tgt/files/CVE-2024-45751.patch | 68 
++++++++++++++++++++++++++++
  meta-networking/recipes-extended/tgt/tgt_git.bb                 | 1 +
  meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch  | 69 
+++++++++++++++++++++++++++++
  meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
  meta-oe/recipes-dbs/rocksdb/files/run-ptest                     | 12 +++++
  meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb                   | 19 
+++++++-
  .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
  .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
  .../recipes-devtools/cjson/{cjson_1.7.17.bb => cjson_1.7.18.bb} |  2 +-
  meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb           | 2 +-
  .../sound-themes/sound-theme-freedesktop_0.8.bb                 | 2 +-
  meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb             | 2 +-
  meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb         | 2 +-
  meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb            | 2 +
  14 files changed, 177 insertions(+), 9 deletions(-)
  create mode 100644 
meta-networking/recipes-extended/tgt/files/CVE-2024-45751.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
  create mode 100644 meta-oe/recipes-dbs/rocksdb/files/run-ptest
  rename meta-oe/recipes-devtools/cjson/{cjson_1.7.17.bb => 
cjson_1.7.18.bb} (91%)


