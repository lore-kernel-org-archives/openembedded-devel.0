Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DA3CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 17:14:43 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.28119.1755191681762954669
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 10:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IIKhL41I;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e93265d07b5so528613276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 10:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755191681; x=1755796481; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9LiRAP/IeV1+5CCXmKG62aTOggnNr9ZR0FCNQ0w9Ks=;
        b=IIKhL41IkzZx0yS1II0tEl1vUlVtWWwy728b9F0cHcK1VK9ZfL+aePe0PB5en+lJbt
         9UcVuptdfh8LfC80qAI8gTbiRIFNe1oNtjICmyOenHronxPel7d7jCsr4fYJUeblm96W
         /0LNi68vI0bVnVpRUCdlIBnTGoAifkm9Sm8U7SLX6AFeTzcZ6N/B9yj3TAi7bolvWbah
         KZAmsQwl0rMlsJiXe9eblQ8bo1NAfBoNgLB0cxO59qf25IlLuEbZZ07cacL/8UQkmiXd
         LQmR+thP83Ht0eQx4qukvLXwPzbxt/dpcpUvncWt/waxzj7h6ZKQRWXLYHt03aBXVQjO
         KXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755191681; x=1755796481;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9LiRAP/IeV1+5CCXmKG62aTOggnNr9ZR0FCNQ0w9Ks=;
        b=kvfBTHxNfJg/jRq97Vmxymh9Ve6G/+cj6uIZHPrR8QX/EkQLjMJs4EoLhph6U0ZEGb
         CpEsc+rRe53usk8t9LGc1DM6wMbsUiq/nHWV8QZiTz0aD0RQF8igfLnlS/RsiEpCuXs8
         xEpmfc4ldDqKlrF5earjsQ6VKFdCGNMvz6jtBmYHmltAlY/5IlMSXX/Ab8cwNM7Hpz2Y
         q2OPWpbojuwjMjrMBji9luSNxGSLTtHKktPsqGbOLW3filN8D5J9TzqzEN8JvwDrYKhZ
         frRtuZxNFf0joMkQPwU5YTbs9j07qYdarbcn/CS7i/3d1d5bJVIG0/DO+g918Uue9mE7
         sCTw==
X-Forwarded-Encrypted: i=1; AJvYcCVw2Uel7pOqYLoA1PcXTIa9P07ldZ6Hx4rpg1DODPc/QGrT9Ka8VoA+Y8MCGCFGwUwVqFp4dLqxQqgzxaIXpg3IYyw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzxvAyzYBygS4WAwQs2hsgoBSZJf5TTcIBWR8s4kn364N5NT+zk
	ITOSKHzfK7/2XFgNxDUXYng0uU8ou2WIebgGrWWTvX9bIW5Ii8ULKO0G
X-Gm-Gg: ASbGnctkfKTiaoxbBhYpNpKbGICOHS80OtJzyZA8vfMzTbE5vmV+YnD1OLsaXXHLEBn
	G1HHusmZhUPFFF5yZMQSBiiofaFeMRujEmtDg0Fn2TEdL7RDb4FQapFJFTmdvb1xFroexdfRqfs
	Ok1vQAzlSm0M5zFrQCXm1FVN7T77DLP1RqI5NrpLpaVS94tWa32IlMWw7R+NrZ33L8gZevn9oxq
	LRfk6q+OSOb2RSmGMRecQIKJxB1nTrih/vSoXSSLdvtnsx1m+GfHsc+UjVFJ5oiVR4BoSRmMcdu
	TZeAITg8txomwEieymGcBQH2jWb4TIldwmviZmP3enJwdQMubRPEmkLqTFVfrjuPmIzPH5ucjDN
	Yz0mEOaMBPYCtXIA9VMSV5GDKomINpwdPnN9k2epdiXcdO5y1p3UJK9mMTFkAli9rye4Fj6IUgQ
	==
X-Google-Smtp-Source: AGHT+IFxAkZ/1J5oSmmmvhBjR23gq8m1tWndGlefCG5k9fuHJn/cXPtXpswbRsYEr9rDKLcZAm8trg==
X-Received: by 2002:a05:690c:6286:b0:71c:f09:e3f0 with SMTP id 00721157ae682-71d63d0843cmr49019567b3.20.1755191680650;
        Thu, 14 Aug 2025 10:14:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:e065:2785:fd37:d24a? ([2600:1700:45dd:7000:e065:2785:fd37:d24a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71d60d8ba48sm7276927b3.23.2025.08.14.10.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 10:14:40 -0700 (PDT)
Message-ID: <9e3f12ac-a97b-4592-ab0b-fe720a5692f2@gmail.com>
Date: Thu, 14 Aug 2025 13:14:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Scarthgap merge request: Aug 14th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 17:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118936

The following changes since commit e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943:

   xfce4 update HOMEPAGEs (2025-07-10 20:29:57 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 205638f9edf8e1aa1fbcf28555625fe56f2701a5:

   poco: patch CVE-2025-6375 (2025-08-02 13:37:04 -0400)

----------------------------------------------------------------
Guocai He (3):
       thrift: correct the SRC_URI
       softhsm: correct the SRC_URI
       mariadb: File conflicts for multilib

Guðni Már Gilbert (1):
       mbedtls: upgrade 3.6.3.1 -> 3.6.4

Hitendra Prajapati (3):
       redis: fix CVE-2025-32023
       libssh: fix CVE-2025-5351 & CVE-2025-5372
       open-vm-tools: fix CVE-2025-22247

Jinfeng Wang (1):
       postfix: fix rootfs file difference

Peter Marko (5):
       libcoap: patch CVE-2024-31031
       spdlog: patch CVE-2025-6140
       minifi-cpp: patch spdlog CVE-2025-6140
       poco: ignore additional failing tests
       poco: patch CVE-2025-6375

Swamil Jain (1):
       kmsxx: Revert to using original name for kmstest

Vijay Anusuri (2):
       proftpd: Fix CVE-2023-51713
       apache2: Upgrade 2.4.62 -> 2.4.64

Wang Mingyu (1):
       mbedtls: upgrade 3.6.3 -> 3.6.3.1

Yogita Urade (2):
       mariadb: upgrade 10.11.9 -> 10.11.12
       poppler: fix CVE-2025-52886

  .../mbedtls/{mbedtls_3.6.3.bb => mbedtls_3.6.4.bb} |    7 +-
  .../postfix/files/0006-postfix-add-preliminary-setting.patch    | 31 +
  meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb |    1 +
  .../recipes-daemons/proftpd/files/CVE-2023-51713.patch          | 278 ++
  meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb |    1 +
  .../recipes-devtools/libcoap/libcoap/CVE-2024-31031.patch       | 82 +
  meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb |    1 +
  .../open-vm-tools/open-vm-tools/CVE-2025-22247.patch            | 378 +++
  .../recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb |    1 +
  .../meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb |    7 -
  meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb |    2 +-
  .../{mariadb-native_10.11.9.bb => mariadb-native_10.11.12.bb} |    0
  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 11 +-
  .../mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch  | 43 +-
  meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch               | 13 -
  meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch    | 43 -
  .../mysql/{mariadb_10.11.9.bb => mariadb_10.11.12.bb} |    0
  meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch   | 35 +
  meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb |    1 +
  meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch | 218 ++
  meta-oe/recipes-extended/redis/redis_7.2.8.bb |    1 +
  meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb |    2 +-
  meta-oe/recipes-support/libssh/libssh/CVE-2025-5351.patch       | 38 +
  meta-oe/recipes-support/libssh/libssh/CVE-2025-5372.patch       | 150 +
  meta-oe/recipes-support/libssh/libssh_0.10.6.bb |    2 +
  .../0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch  | 21 +-
  meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch           | 34 +
  meta-oe/recipes-support/poco/poco_1.12.5p2.bb |    1 +
  .../recipes-support/poppler/poppler/CVE-2025-52886-0001.patch   | 4325 
+++++++++++++++++++++++++++
  .../recipes-support/poppler/poppler/CVE-2025-52886-0002.patch   | 58 +
  meta-oe/recipes-support/poppler/poppler_23.04.0.bb |    2 +
  meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch       | 35 +
  meta-oe/recipes-support/spdlog/spdlog_1.13.0.bb |    4 +-
  .../apache2/{apache2_2.4.62.bb => apache2_2.4.64.bb} |    2 +-
  34 files changed, 5722 insertions(+), 106 deletions(-)
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.3.bb 
=> mbedtls_3.6.4.bb} (94%)
  create mode 100644 
meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
  create mode 100644 
meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
  create mode 100644 
meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-31031.patch
  create mode 100644 
meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-22247.patch
  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.9.bb => 
mariadb-native_10.11.12.bb} (100%)
  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
  delete mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
  rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.9.bb => 
mariadb_10.11.12.bb} (100%)
  create mode 100644 
meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/CVE-2025-5351.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/CVE-2025-5372.patch
  create mode 100644 meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2025-52886-0001.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2025-52886-0002.patch
  create mode 100644 
meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.62.bb => 
apache2_2.4.64.bb} (99%)


