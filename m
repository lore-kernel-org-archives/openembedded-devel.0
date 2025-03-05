Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE216C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:52:34 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.16519.1741189948733402882
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CqXOexNl;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e5dc299dee9so6476116276.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 07:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741189948; x=1741794748; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0w9WPwuGvWbHhawquJW/7BnBfWYnzFvj6b5FFXKKB6g=;
        b=CqXOexNlVT078Gde8CVxwebRNzBa53eCmPZ2zK1GknYdhkcyF8bu6UXlpYRbrbwTCT
         JVJ3nEdLN+8sAiewpRw4vCVMXRBeMSiCdKv8FaFCelDB8rKFSIjEUZyVwsUcxrtIK/ov
         GSt+wV/07vosXYcN+Ccpm8MmTc8zwdmeq5UNI7plTwjQ2oJUTnT8YLc2Jq2SkKYeXs6S
         Nlrkv6H3NTliBcaEEBjO2nB04lgOTcJ/1Kj8CS8MzFlAaDSyjWNt1bHt2305z7JTCZpr
         2mWYyz/uyHdwnhNck+ZHEHhuBTmRBD8kCWtGzx9bm/UsxuZQPhkV4r5c38ByFZ5bry77
         YPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741189948; x=1741794748;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0w9WPwuGvWbHhawquJW/7BnBfWYnzFvj6b5FFXKKB6g=;
        b=WwDNJwEpfwgjwKWXQQMxsiNNTGK/Pk+FgW5H9qxdJGws+vbjbu2sNW3/OgX2t1QLg7
         wOlHn+MRYAEUIwmF7gZd36Qg+zKBrwrge0jUaqHPalgvOdWMkJvzhevK4j853g9cDGfo
         af989P8aWzfc8n26TmsdpZ03kR4efwrYwTpzP0J9EjuxOViOoh/6Uc50ZHfrwFAxAzBa
         +E0Sq5nEVwzOk+m0ofZtfHgJDst9jXkznLT/gKs84jY4V4yLuqZNqIMyX4Ql/mtvfuSH
         +gqMi8YnAV+XfzVZBdJlluBW8AzE4MyvtwWy0/UTaadPfB3+imcrYJ67/Gp/glQVscAM
         aDxA==
X-Forwarded-Encrypted: i=1; AJvYcCXNwT5W3tqRC9+n7c3dpHVMGQ69Y4ltGZ9B3aYui/ijC3kw4EQNMe893pQz8xaQRti2DWyb3JAaxk+WvLSQjf64hw0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxFVh+481VO9rptj9wwQdqIaPg3FtKc/+rCL1LLyVWuRzfBBvaA
	ZbzFWhlGtTnyTtq/tDNfDOpeVvrKSOza0CZyOhMI41VbpuKTBEEdXQOY6eGf
X-Gm-Gg: ASbGncv1Xsv6hw/zuhyqS3ABTyv2ndm1q0Xm3HIcEHn3+JhQQJSM/CQChMAis3dPcK5
	XraQRncbE77SHwz3+f+zZaCgMJ1OHev3bYmOjPxsT6bFsPNvafZvIp9yrYHtVwqXL7xnNDtT/76
	x/vWx/dcf5c6HON3iR/pYfs9v5Gm/Ycdz1AG9yALBk3EVJg9VT16UI2tgMG4I5u71ifZAjjogOR
	rdkyduHJCHy8XCYACM4sYbLK2t39YLCDtsKuwnGWC5WXk+R2vFJMYU/7/qUj0eWfblvLM9D8a8j
	A21aTvCDazaWt2ni28JLdaexgwwR8ldaLIdjR56yLP/hZbcoRMy37fO8xeH2PO7Je7Saj6FmDVd
	cjHlkO/xOE4qdKzI87Yyu
X-Google-Smtp-Source: AGHT+IFdYZRFD78fBIQvKd736r+E2iT5PAn27lu2rLhH9GLH9ZYk2O8+zjKxIMuc6wl5XLo7+Pntlg==
X-Received: by 2002:a05:6902:918:b0:e5d:de0e:57f5 with SMTP id 3f1490d57ef6-e611e1dc5d2mr5640894276.28.1741189947798;
        Wed, 05 Mar 2025 07:52:27 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:17d1:9b04:7e9e:50d7? ([2600:1700:45dd:7000:17d1:9b04:7e9e:50d7])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e60a3a335a8sm4303290276.22.2025.03.05.07.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 07:52:27 -0800 (PST)
Message-ID: <6096f37f-7ec2-4816-baf0-97973927b279@gmail.com>
Date: Wed, 5 Mar 2025 10:52:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: March 5th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 15:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115759

The following changes since commit 4f11a12b2352bbdfafb6b7d956bf424af4992977:

   modejs: upgrade 20.18.0 -> 20.18.2 (2025-02-04 15:04:57 -0800)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 6c9f1f8d4538119803bf793747b65e4d23c33544:

   nginx: fix CVE-2025-23419 (2025-03-03 08:09:03 -0500)

----------------------------------------------------------------
Alexandre Truong (1):
       source-han-sans-*-fonts: Switch away from SVN fetcher in SRC_URI

Changqing Li (3):
       dlt-daemon: make DLT_WatchdogSec configurable
       abseil-cpp: upgrade 20240116.2 -> 20240116.3
       nginx: fix CVE-2025-23419

Chris Laplante (1):
       poco: fix branch: master => poco-1.12.5

Etienne Cordonnier (1):
       uutils-coreutils: fix compilation with selinux

Leon Anavi (1):
       sip: Fix homepage and license

Peter Kjellerstedt (2):
       ebtables: Remove the dependecy on bash
       libeigen: Remove LGPL code

Peter Marko (1):
       python3-grpcio(-tools): fix build concurrency issue

Soumya Sambu (2):
       python3-django: upgrade 5.0.10 -> 5.0.11
       python3-django: upgrade 4.2.17 -> 4.2.18

Trevor Woerner (1):
       iperf3: throughput fix

Vijay Anusuri (1):
       openjpeg: upgrade 2.5.0 -> 2.5.3

  .../ebtables/ebtables-2.0.11/ebtables-legacy-save               | 19 +-
  meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb |    2 -
  .../iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch  | 30 +
  meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb |    1 +
  ...1-Cargo.lock-revert-to-selinux-sys-0.6.9-and-fts-sys-0.patch | 178 
+++++
  .../recipes-core/uutils-coreutils/uutils-coreutils-crates.inc   | 20 +-
  .../recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb |    3 +-
  .../{abseil-cpp_20240116.2.bb => abseil-cpp_20240116.3.bb} |    2 +-
  meta-oe/recipes-devtools/sip/sip_6.8.6.bb |    4 +-
  ...CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch | 40 ++
  meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb |    1 +
  ...-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch} | 10 +-
  .../openjpeg/{openjpeg_2.5.0.bb => openjpeg_2.5.3.bb} |    4 +-
  .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb |    7 +-
  .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb |    7 +-
  .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb |    7 +-
  .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb |    7 +-
  .../libeigen/0002-Remove-LGPL-Code-and-references.patch         | 1040 
+++++++++++++++++++++++++++
  meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb |    9 +-
  meta-oe/recipes-support/poco/poco_1.12.5p2.bb |    2 +-
  .../{python3-django_4.2.17.bb => python3-django_4.2.18.bb} |    4 +-
  .../{python3-django_5.0.10.bb => python3-django_5.0.11.bb} |    2 +-
  .../recipes-devtools/python/python3-grpcio-tools_1.62.2.bb |    4 +
  meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb |    4 +
  meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch   | 87 +++
  meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb |    3 +-
  26 files changed, 1441 insertions(+), 56 deletions(-)
  create mode 100644 
meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch
  create mode 100644 
meta-oe/recipes-core/uutils-coreutils/files/0001-Cargo.lock-revert-to-selinux-sys-0.6.9-and-fts-sys-0.patch
  rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb 
=> abseil-cpp_20240116.3.bb} (97%)
  create mode 100644 
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
  rename 
meta-oe/recipes-graphics/openjpeg/openjpeg/{0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch 
=> 0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch} (75%)
  rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.5.0.bb => 
openjpeg_2.5.3.bb} (82%)
  create mode 100644 
meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LGPL-Code-and-references.patch
  rename meta-python/recipes-devtools/python/{python3-django_4.2.17.bb 
=> python3-django_4.2.18.bb} (63%)
  rename meta-python/recipes-devtools/python/{python3-django_5.0.10.bb 
=> python3-django_5.0.11.bb} (56%)
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch


