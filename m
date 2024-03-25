Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CCCCD11DB
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 11:15:01 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.49189.1711365292234608449
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 04:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PIGIKVYm;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso3906301276.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 04:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711365291; x=1711970091; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufMZp3hP/dBKfbc8sCWrUM6zKMnbE7x318F3G+LZvBk=;
        b=PIGIKVYmrAJ/AJ5TAXVOnySN/EtqGZOfj/tXOwggNfI4nmvVwwOJCejjgen8mhIWK5
         ZrLBdKj1SEz5PwMDjDUpiV4S2gCZVeWj9GpTHE1NKFES7G7nqP1pGAv9eBfEh0WRtKiO
         4gyZPTbaV0kD9fCdD421yK+W3EzwVqVHf4aLIvFnNdhq4UIzxufMaSgp9CLoRUueYfXY
         CXoUZ7DrntSzHBH1yUCr48Ppc0pjl9K6q+sOHqAtmZL4GgCiYnwMRVW6K2OV1WsyWMPV
         iQaPyu5XIsySbeJEdnoKdUd5S6mDey2X7KyxyuDbxsgE0jw35TT5WsPdoE/jUpzzNG1m
         lW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711365291; x=1711970091;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufMZp3hP/dBKfbc8sCWrUM6zKMnbE7x318F3G+LZvBk=;
        b=B6fXLwuy+XIydx0Dpu3yocMbAZJJzCNKQYsYCII52PiwGlQ73AlXpM/MUyGAYxri1M
         h7GO6NpnWCwcHZBS2SwkdC5NXBz/Yk+zX5TYm+BSO3D62XwlS3A1WwX5Vu7JB0SBecb5
         AKgZ+0GMoaet9joLArTCCQNNhLcjztWDw4Hqg/thwvVYlV1xKzx8E85qcJV25OQ9Cs93
         YFqubQXFam22kIKA2DHQOgurGPbtMb4CeyrKrll8OesjOXq1gsV612IRJRR+C/SamD8I
         It3PyUXTn4nPoQ21vb1KbAYz9UXMvceDG7pJjpCJk6vx8p/+y94qmZBo1gUSTAhodgHX
         O56A==
X-Forwarded-Encrypted: i=1; AJvYcCU/vHxbyN/WDIOp5Rxn7/SiSilk0H657cIKoJEW3BFL8ypQ82euOSZVRwGzsNFBzxcHukLS8HI2OikZyUW3m5cwQEYFvWQYzzCDldG9V4mnqnTxFIfejBDrJg==
X-Gm-Message-State: AOJu0YzW6/am/oLYLNCEq9cyLn+DaVeHLApM2kqe5alSJNuhLuYpzUgF
	MopIv/7Kh5XGWC9nKVmGsaryBvHTvBs0nFUmed/bgakLZPdLTyyl
X-Google-Smtp-Source: AGHT+IEcvH1c5p2NQQ/9TsDtmlfv8nL8j/ER5gxvnHQzm7KYai7YLEoXKWft1ckEP3eiXKVgmyhGLg==
X-Received: by 2002:a25:8e10:0:b0:dcd:ef35:91d5 with SMTP id p16-20020a258e10000000b00dcdef3591d5mr4496456ybl.2.1711365291318;
        Mon, 25 Mar 2024 04:14:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:a44a:c9fd:554f:a28a? ([2600:1700:45dd:7000:a44a:c9fd:554f:a28a])
        by smtp.gmail.com with ESMTPSA id d127-20020a254f85000000b00dcdb990f93bsm991950ybb.64.2024.03.25.04.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 04:14:50 -0700 (PDT)
Message-ID: <4d9e595a-b765-4364-b92c-18deebdc7ce0@gmail.com>
Date: Mon, 25 Mar 2024 07:14:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Marck 25th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 11:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109576

The following changes since commit fda737ec0cc1d2a5217548a560074a8e4d5ec580:

   mbedtls: Upgrade 3.5.0 -> 3.5.2 (2024-02-28 08:18:18 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 8bb16533532b6abc2eded7d9961ab2a108fd7a5b:

   dnsmasq: Upgrade 2.87 -> 2.90 (2024-03-25 07:11:05 -0400)

----------------------------------------------------------------
Anuj Mittal (1):
       opencv: fix reproducibility issues

Soumya Sambu (4):
       openvpn: ignore CVE-2023-7235
       postgresql: Upgrade to 14.11
       unixodbc: Fix CVE-2024-1013
       dnsmasq: Upgrade 2.87 -> 2.90

Vivek Kumbhar (1):
       openjpeg: Backport fix CVE-2021-3575

Yogita Urade (1):
       c-ares: fix CVE-2024-25629

  meta-networking/recipes-support/dnsmasq/dnsmasq.inc             | 1 -
  meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch       | 31 ---
  meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb         | 7 -
  meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb         | 3 +
  .../recipes-support/dnsmasq/files/CVE-2023-28450.patch          | 48 -----
  meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb        | 3 +
  .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6 +-
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch        | 125 
------------
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch        | 294 
----------------------------
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch        | 108 
----------
  .../postgresql/{postgresql_14.9.bb => postgresql_14.11.bb} |   7 +-
  meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-3575.patch  | 45 +++++
  meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb             | 1 +
  meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch      | 34 ++++
  meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                 | 1 +
  meta-oe/recipes-support/opencv/opencv_4.5.5.bb                  | 34 ++--
  meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch      | 53 +++++
  meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb              | 1 +
  18 files changed, 163 insertions(+), 639 deletions(-)
  delete mode 100644 
meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb
  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
  delete mode 100644 
meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch
  delete mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_14.9.bb => 
postgresql_14.11.bb} (61%)
  create mode 100644 
meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-3575.patch
  create mode 100644 
meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch
  create mode 100644 
meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch


