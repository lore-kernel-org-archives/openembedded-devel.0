Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B43C4706C
	for <webhook@archiver.kernel.org>; Sat, 13 Jan 2024 13:05:01 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.18427.1705151099856952728
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jan 2024 05:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tg0MQPnR;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5e734251f48so57980877b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 05:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705151099; x=1705755899; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QlOyt6tnZpBNeIpus8z+WmWSZBLYoJEBeKmQjb8Beo=;
        b=Tg0MQPnRQEhTxJiOLjKW7SL0xQKnyxE5ZbNkaZqWWHro14plOF87Kl56fFWlFZNmd4
         wMtSUjy5tlINVHUi8Iy//c9a0bi8O3/1yYhQu8AeaHuFCmPHL8EX0yiicyKJ5JcAbPBU
         ovIM93acT39YYRH0uvStDo3U82QUP6lFjWA9oauChPJSpitBP1w0xFnv9geZPIONeYB0
         62TGrBItNvwdCzYo6KuBCZPDnyFNNd4JRFFsola9vlEgbqZM3jSmux7KlTg2qi5P1yHP
         CbBJ0DEKJ6fL/4hIgsHLqxa3J2QrpqFRUaJQU/hjY5yYGoV3BeL1ajxfzmSZIjOlTQGf
         akDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705151099; x=1705755899;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4QlOyt6tnZpBNeIpus8z+WmWSZBLYoJEBeKmQjb8Beo=;
        b=gRkmKk1D4PaQfuj2zyEm+iqJ4ri/b1Dgn8w5KeS1fXTupBHVcMUr83zSnGvfrHcSZs
         k4/Ek+exgbF8heYrDMj65fgbmnc3ZSKx6mmLgh3H7mmQ/wKSUy92bVSq2mVIr3KeB3i8
         llICTlqj2eT1gKhky8bHO++wITxw4/FvY05gI+KidrgRRYknodP2t795t5eRN4gJRjcw
         ABVJFy4xaAJ2Hw3rwICQPnxJsTkTT8w5/ybR6y+LoTkVHg3NN9I++qT8TA7YdqvyE2NT
         iVwtcyN3+B5to6tmbJOhvfTPqJlFN8neY4ppr7Hbm8oTh4WJl9+x4xjh+NQ0ldtnNfKi
         jjZA==
X-Gm-Message-State: AOJu0YxwNbAa37V255dB28P+PQYxYxeHAnd75/jg53rmUZeBQTURiUf8
	lHnOnCB7QT/0NEp8fjSbl6U=
X-Google-Smtp-Source: AGHT+IFoYE/hQziozliwCHCfLYWvV8UOp/w8lZDnCQLlnpT3nQKCZYOOF2pCUOYwoTFMqdmthvizXg==
X-Received: by 2002:a81:b205:0:b0:5f5:a2c4:f2ea with SMTP id q5-20020a81b205000000b005f5a2c4f2eamr2027249ywh.35.1705151098900;
        Sat, 13 Jan 2024 05:04:58 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:60dc:eeec:7709:194c? ([2600:1700:9190:ba10:60dc:eeec:7709:194c])
        by smtp.gmail.com with ESMTPSA id bf22-20020a05690c029600b005d0fea7ad01sm2198273ywb.122.2024.01.13.05.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jan 2024 05:04:58 -0800 (PST)
Message-ID: <3ee2cd79-f05e-46bb-a33a-51415450b7d3@gmail.com>
Date: Sat, 13 Jan 2024 08:04:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Jan 13th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 13:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108265

The following changes since commit 402affcc073db39f782c1ebfd718edd5f11eed4c:

   squid: fix CVE-2023-46847 Denial of Service in HTTP Digest 
Authentication (2023-12-13 13:35:51 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 730e44900a0a86265bad93a16b5a5ff344a07266:

   proftpd: Fix CVE-2023-51713 Out-of-bounds buffer read (2024-01-12 
07:14:16 -0500)

----------------------------------------------------------------
Archana Polampalli (3):
       strongswan: upgrade 5.9.6 -> 5.9.12
       cjson: upgrade 1.7.15 -> 1.7.17
       samba: fix CVE-2023-42669

Hitendra Prajapati (1):
       proftpd: Fix CVE-2023-51713 Out-of-bounds buffer read

Jeffrey Pautler (1):
       apache2: add vendor to product name used for CVE checking

Martin Jansa (1):
       glmark2: inherit python3native to fix build with python-3.12 on 
build host

Narpat Mali (4):
       python3-django: Fix for CVE-2023-43665 and CVE-2023-46695
       python3-django: upgrade 3.2.21 -> 3.2.23
       python3-django: upgrade 4.2.5 -> 4.2.7
       apache2: upgrade 2.4.57 -> 2.4.58

Rob Woolley (2):
       sip3: Add sipconfig.py
       sip3: Add py_ssize_t_clean argument

Soumya (1):
       yasm: fix CVE-2023-37732

Wentao Zhang (1):
       libbytesize: update github branch to 'main'

dnyandev (1):
       python3-pillow: Fix CVE-2023-44271

vkumbhar (2):
       wireshark: fix CVE-2023-1992 RPCoRDMA dissector crash
       wireshark: fix CVE-2022-4345 multiple (BPv6, OpenFlow, and Kafka 
protocol) dissector infinite loops

  .../recipes-connectivity/samba/samba/CVE-2023-42669.patch |    94 +
  meta-networking/recipes-connectivity/samba/samba_4.14.14.bb |     1 +
  .../recipes-daemons/proftpd/files/CVE-2023-51713.patch          | 277 +
  meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb |     1 +
  .../strongswan/{strongswan_5.9.6.bb => strongswan_5.9.12.bb} |    12 +-
  .../recipes-support/wireshark/files/CVE-2022-4345.patch |    52 +
  .../recipes-support/wireshark/files/CVE-2023-1992.patch |    61 +
  meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb |     2 +
  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb |     2 +-
  .../recipes-devtools/cjson/{cjson_1.7.15.bb => cjson_1.7.17.bb} |     2 +-
  ...-the-py_ssize_t_clean-argument-to-the-module-directive.patch | 
17679 ++++++++++++++++++++++++++
  meta-oe/recipes-devtools/sip/sip3_4.19.23.bb |    21 +-
  meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch |    41 +
  meta-oe/recipes-devtools/yasm/yasm_git.bb |     1 +
  meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb |     2 +-
  .../recipes-devtools/python/python3-django/CVE-2023-43665.patch | 199 +
  .../recipes-devtools/python/python3-django/CVE-2023-46695.patch |    90 +
  meta-python/recipes-devtools/python/python3-django_2.2.28.bb |     2 +
  .../{python3-django_3.2.21.bb => python3-django_3.2.23.bb} |     4 +-
  .../python/{python3-django_4.2.5.bb => python3-django_4.2.7.bb} |     4 +-
  .../recipes-devtools/python/python3-pillow/CVE-2023-44271.patch | 156 +
  meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb |     1 +
  ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch |    31 -
  .../apache2/{apache2_2.4.57.bb => apache2_2.4.58.bb} |     5 +-
  24 files changed, 18693 insertions(+), 47 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch
  create mode 100644 
meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
  rename meta-networking/recipes-support/strongswan/{strongswan_5.9.6.bb 
=> strongswan_5.9.12.bb} (96%)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2022-4345.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch
  rename meta-oe/recipes-devtools/cjson/{cjson_1.7.15.bb => 
cjson_1.7.17.bb} (91%)
  create mode 100644 
meta-oe/recipes-devtools/sip/sip3/added-the-py_ssize_t_clean-argument-to-the-module-directive.patch
  create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2023-43665.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2023-46695.patch
  rename meta-python/recipes-devtools/python/{python3-django_3.2.21.bb 
=> python3-django_3.2.23.bb} (61%)
  rename meta-python/recipes-devtools/python/{python3-django_4.2.5.bb => 
python3-django_4.2.7.bb} (61%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-pillow/CVE-2023-44271.patch
  delete mode 100644 
meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb => 
apache2_2.4.58.bb} (97%)


