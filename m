Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169FBC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 18:51:03 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.35697.1719427854243478907
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 11:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f3bl2UXP;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso7452832276.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 11:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719427853; x=1720032653; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Jh4bcpS77AWAHiSliwXpwuq8gigaNNvgRjWM8Bn7p8=;
        b=f3bl2UXPtMIp/E8Ytc0G868qmcZtsxeD8N9zmO40eplkv30hdrJJYKzIKM/JFAY5dB
         3epx9ZoDjG95B3m56y7JfLGTdCLQC/BhSLqkS3ms797KBrsO29uqwcTAOz4kLZ9e2baC
         grLteQtaSSnEjyPafWYBM+ESDRvC/hIQN80uO5Ex1+Xy8TlhYcX6NldfyxXcy8o+jgtL
         BuVXqb+oSREoDfmcXrpTliuKslfp4VpyDA4mTsJ/JGVTVF4/ZL0CJdJPzqCc88xeYffw
         3js1NKuwV7L4XuGvS9exKhDgxPZwWmWeFt1OpaYIZn7zYEj44JvS7RY9/Ck3KNB+K5jg
         qpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719427853; x=1720032653;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Jh4bcpS77AWAHiSliwXpwuq8gigaNNvgRjWM8Bn7p8=;
        b=X+nutg224Pd4bhqA0ttmIAX/QsmIFFMw8OD2ZSZRcZ9vf+3kWBSK6dz9XC+dBnlT2+
         bMQny7rXixqf+WNtMhrnLFvg06tYJ77/XQGaDNJSP6AuEKB1/FRXyrBxAZDKuLahKGDJ
         BbzyZ66vti617vYSDrv89WiNfHEILz12YH5FD64B33BS9L/TsEXP8zOj8Z9WyFxWQvTK
         foXabjgrwOue1zM2A2LH23wLF0ccq2V3Oq0oF9VS/quJOnUF6YXXeyxj9eT6nHLE80QJ
         6C8pQYVuqGYfmrs6f5hDV6LaQvmX+gPR8tG9tm1KFKib+eN+DLLSPSh5MO+7sBnR6eDn
         NU/g==
X-Forwarded-Encrypted: i=1; AJvYcCXA39rzy86/hpdAODB6N5Bkga6RmV2oGCVWQrkXw4C1AAc9adY1bHac0DZVVM7KIPh8B+D6eo53kNuB4MdQK30VUUGB7QoRp7zahoBgfhC8FFOwqepDePBBtA==
X-Gm-Message-State: AOJu0YyDXWxrE2O4fLxrhR9bDibsp0uppkeFfkpT0JWkJO5B6R/Z6bd+
	3y+lm8vfLAKPxT7ZPN4VLX6HLjL+MkcJ3rNaV+txiExatN1a4nkV
X-Google-Smtp-Source: AGHT+IFZnZs4v5kOQMDHVsCWqpi37yf3C7whRb1zvJpaR0CBMf92d7ICGnAwmp0ELnp4YIODbgZUVw==
X-Received: by 2002:a25:68c3:0:b0:dfe:9f5:a9c3 with SMTP id 3f1490d57ef6-e02fc29caabmr12556838276.20.1719427853308;
        Wed, 26 Jun 2024 11:50:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:7288:8bce:1517:8909? ([2600:1700:45dd:7000:7288:8bce:1517:8909])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e623d1c0sm4524925276.20.2024.06.26.11.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 11:50:53 -0700 (PDT)
Message-ID: <7037c6fb-85d8-4fe9-b0b7-20568872c3ac@gmail.com>
Date: Wed, 26 Jun 2024 14:50:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: June 26th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 18:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111114

The following changes since commit 4a7bb77f7ebe0ac8be5bab5103d8bd993e17e18d:

   pcapplusplus: Fix build with gcc14 (2024-06-02 14:57:06 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 78a14731cf0cf38a19ff8bd0e9255b319afaf3a7:

   php: Upgrade to 8.2.20 (2024-06-26 07:33:55 -0400)

----------------------------------------------------------------
Bartosz Golaszewski (1):
       libgpiod: update to v2.1.2

Changqing Li (1):
       python3-grpcio: fix do_compile failure for qemuppc64/qemuppc

Gerard Salvatella (1):
       libwebsockets: fix buildpath warnings

Guðni Már Gilbert (2):
       python3-twisted: prepend split PACKAGES
       python3-twisted: remove obsolete python3-twisted-flow

Hitendra Prajapati (1):
       tcpdump: fix CVE-2024-2397

Kai Kang (1):
       daq: fix incompatible pointer type error

Martin Jansa (1):
       libwebsockets: remove STAGING_LIBDIR with /

Peter Marko (4):
       re2: remove dev dependencies from main package
       re2: rework solibs handling
       jemalloc: add +git to version
       cjson: fix buildpath warnings

Randolph Sapp (1):
       vulkan-cts: add workaround for createMeshShaderMiscTestsEXT

Scott Murray (1):
       abseil-cpp: backport RISC-V fix

Siddharth Doshi (1):
       nano: Security fix for CVE-2024-5742

Soumya Sambu (2):
       unixodbc: Fix CVE-2024-1013
       php: Upgrade to 8.2.20

Vijay Anusuri (2):
       c-ares: Update SRC tarball path
       tipcutils: Add systemd support

Wang Mingyu (1):
       uriparser: upgrade 0.9.7 -> 0.9.8

Yoann Congal (1):
       libfido2: remove non-functional native and nativesdk BBCLASSEXTEND

Zhang Peng (1):
       hiredis: change ptest output format

gr embeter (1):
       python3-pytest-html: add missing runtime dependencies

nikhil (1):
       giflib: upgrade to version 5.2.2

  meta-networking/recipes-connectivity/daq/daq_2.0.7.bb           | 1 +
  .../daq/files/daq-fix-incompatible-pointer-type-error.patch     | 31 
+++++++
  .../recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch         | 129 
++++++++++++++++++++++++++++
  meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb       | 1 +
  .../recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb   | 2 +
  .../0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch | 82 
++++++++++++++++++
  meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb    | 1 +
  meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb                  | 5 ++
  .../files/add_suffix_to_convert_binary_used_in_Makefile.patch   | 42 
+++++++++
  .../giflib/{giflib_5.2.1.bb => giflib_5.2.2.bb} |   9 +-
  meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb             | 4 +-
  meta-oe/recipes-devtools/php/{php_8.2.18.bb => php_8.2.20.bb} |   2 +-
  meta-oe/recipes-extended/hiredis/hiredis/run-ptest              | 17 +++-
  meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf     | 1 +
  meta-oe/recipes-extended/tipcutils/tipcutils_git.bb             | 11 ++-
  meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb        | 3 +
  meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb                 | 2 +-
  meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb             | 2 -
  .../libgpiod/{libgpiod_2.1.1.bb => libgpiod_2.1.2.bb} |   2 +-
  meta-oe/recipes-support/nano/files/CVE-2024-5742.patch          | 101 
++++++++++++++++++++++
  meta-oe/recipes-support/nano/nano_7.2.bb                        | 4 +-
  meta-oe/recipes-support/re2/re2_2024.03.01.bb                   | 8 +-
  meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch      | 53 
++++++++++++
  meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb             | 1 +
  .../uriparser/{uriparser_0.9.7.bb => uriparser_0.9.8.bb} |   2 +-
  .../0001-target.h-define-proper-macro-for-ppc-ppc64.patch       | 37 
++++++++
  meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb    | 1 +
  .../recipes-devtools/python/python3-pytest-html_4.1.1.bb        | 2 +
  meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb   | 20 +----
  29 files changed, 539 insertions(+), 37 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible-pointer-type-error.patch
  create mode 100644 
meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
  create mode 100644 
meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
  create mode 100644 
meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
  rename meta-oe/recipes-devtools/giflib/{giflib_5.2.1.bb => 
giflib_5.2.2.bb} (65%)
  rename meta-oe/recipes-devtools/php/{php_8.2.18.bb => php_8.2.20.bb} (99%)
  create mode 100644 
meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf
  rename meta-oe/recipes-support/libgpiod/{libgpiod_2.1.1.bb => 
libgpiod_2.1.2.bb} (93%)
  create mode 100644 meta-oe/recipes-support/nano/files/CVE-2024-5742.patch
  create mode 100644 
meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch
  rename meta-oe/recipes-support/uriparser/{uriparser_0.9.7.bb => 
uriparser_0.9.8.bb} (84%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch 


