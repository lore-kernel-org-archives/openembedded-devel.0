Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1210DC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 11:00:25 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.16779.1719831619415319162
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 04:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TQ2IyrEk;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e02b79c6f21so2901339276.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719831618; x=1720436418; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RlKpEOUE6RHitFsymELp0KOD4gQMNvRB57OFY16hNg=;
        b=TQ2IyrEk6zygkIQe6mIZjJ7CeIRaSHpWMwU3av/E/uX1adFIjGcF0C5YjCJdqUW3EQ
         t+DYB66zL7nLcQfHpSEzj4JjphwEVJg+kLy0VSncLII66CF+RWmRlRcoe8CPVRUac4JT
         r8zOfdvV1kQnzCVLBOn0qeDElWLRJv8KwQ0cKouS1MRSv7wGTLaTkWYMW6F2N4GfNESL
         fwOF9bCwH8SJki65hrNqNAgJnMpiJYQl7ZTB9oGPwB4ifFKMPvsZeexxSSAW4sAd6JJg
         GDn2y51NK45yoSGmkJH2EpsKk3wKzMC3ezsoPUl21uaONAZL6qya5oeI1GSRIORZweIB
         o7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831618; x=1720436418;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RlKpEOUE6RHitFsymELp0KOD4gQMNvRB57OFY16hNg=;
        b=Oxz997PD5voQwaMG4enWl/jvxO2k/lncQ/kILP0yV6jfeCp5WuBE75YQfGu1jEJeMw
         vQf+8MV3uu3BMRL3FWuVJ+1HKgxzX31eXMiS3NviFXAxZNi56Fyntr+N0t6vBd/y++kq
         Mc3J5XToxQFUxpcwrLevJE68hQFU8a7ar3ilpAncY2frsa0EYJfu3JE3qMSu0K8EpCLg
         S0DG0cWixI4XnTLLvI9RHAj6bnlQ9S27fSOikfGFwZ6gwUgR/H3RGVA4o5iSMjrCE5cw
         acanvQbv74M0z/sHt2vaTbSJTR6HCMd0rnjZM9/H5BpFnFq6SuhHxFHTTi3oRuEiDGID
         DwJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRZj0XlIVeBN5N24KAeAFYxy2mSOP4WVvmCnp9NRlUaQnp7m2zjRE2t/f+kHa6kYODMSMFItaXQoD6KykUYyc0DOAs4B9d0st1iNUOHOP91ZSeT0WQuyMJzw==
X-Gm-Message-State: AOJu0YzN/Q7fJ/TK/25y2c1abGqVNi6HmaGdrqdYxgMdUT8Det3NLTRm
	f8Ahd1wNJZtxAYzer481CIIflE1xgT9I+S7iQXPXYhbdTTG0ScX70KoGLg==
X-Google-Smtp-Source: AGHT+IGw8kdDkwx5LA58XqNYII5lAi+MEnYV8IaDeMjGwPjxDqDFvfMqhMiXxaZ0Pvs4QkOAJsHphQ==
X-Received: by 2002:a25:6f45:0:b0:e03:53a1:ecd7 with SMTP id 3f1490d57ef6-e036eb628edmr5067464276.22.1719831618270;
        Mon, 01 Jul 2024 04:00:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:978e:d840:6c32:150a? ([2600:1700:45dd:7000:978e:d840:6c32:150a])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0353f5f30esm1286988276.57.2024.07.01.04.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 04:00:17 -0700 (PDT)
Message-ID: <3aa77b79-b7e9-4cc0-9e7b-592d48720614@gmail.com>
Date: Mon, 1 Jul 2024 07:00:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: July 1st
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 11:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111196

The following changes since commit 8e297cdc841c6cad34097f00a6903ba25edfc153:

   nginx: Remove obsolete patch (2024-06-02 15:16:32 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 6ff0748a4741517519a281985fc3cd95dadb633e:

   php: Upgrade to 8.1.29 (2024-06-27 11:32:38 -0400)

----------------------------------------------------------------
Jiaqing Zhao (1):
       rdfind: fix build with gcc-13

Meenali Gupta (1):
       openvpn: fix multiple CVEs

Niko Mauno (1):
       nginx-1.21.1: Drop reference to removed patch

Peter Marko (1):
       gnome-shell: correct regression with glib-2.0 fix for CVE-2024-34397

Randy MacLeod (1):
       python3-pyyaml-include: support native and nativesdk build

Rob Woolley (1):
       sip3: Fix segmentation fault

Siddharth Doshi (1):
       nano: Security fix for CVE-2024-5742

Soumya Sambu (1):
       php: Upgrade to 8.1.29

Vijay Anusuri (1):
       yajl: backport Debian patch for CVE-2022-24795

nikhil (1):
       giflib: upgrade to version 5.2.2

  .../0002-screencast-Correct-expected-bus-name-for-streams.patch |    38 +
  meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.0.bb |     1 +
  .../recipes-support/openvpn/openvpn/CVE-2024-24974.patch |    49 +
  .../recipes-support/openvpn/openvpn/CVE-2024-27459.patch |    99 +
  .../recipes-support/openvpn/openvpn/CVE-2024-27903.patch        | 119 +
  meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb |     6 +-
  meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch |    40 -
  .../files/add_suffix_to_convert_binary_used_in_Makefile.patch |    42 +
  .../giflib/{giflib_5.2.1.bb => giflib_5.2.2.bb} |     7 +-
  meta-oe/recipes-devtools/php/{php_8.1.28.bb => php_8.1.29.bb} |     2 +-
  ...-the-py_ssize_t_clean-argument-to-the-module-directive.patch | 
17433 +-------------------------
  meta-oe/recipes-devtools/sip/sip3_4.19.23.bb |     7 +-
  meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch |    61 +
  meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb |     1 +
  meta-oe/recipes-support/nano/files/CVE-2024-5742.patch          | 100 +
  meta-oe/recipes-support/nano/nano_6.2.bb |     4 +-
  .../rdfind/rdfind/0001-include-standard-header-cstdint.patch |    41 +
  meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb |     1 +
  .../recipes-devtools/python/python3-pyyaml-include_1.4.1.bb |     2 +-
  meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb |     2 -
  20 files changed, 594 insertions(+), 17461 deletions(-)
  create mode 100644 
meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-screencast-Correct-expected-bus-name-for-streams.patch
  create mode 100644 
meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patch
  create mode 100644 
meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patch
  create mode 100644 
meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patch
  delete mode 100644 
meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch
  create mode 100644 
meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
  rename meta-oe/recipes-devtools/giflib/{giflib_5.2.1.bb => 
giflib_5.2.2.bb} (72%)
  rename meta-oe/recipes-devtools/php/{php_8.1.28.bb => php_8.1.29.bb} (99%)
  create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
  create mode 100644 meta-oe/recipes-support/nano/files/CVE-2024-5742.patch
  create mode 100644 
meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-header-cstdint.patch


