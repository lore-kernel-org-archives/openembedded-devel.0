Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA65DC4345F
	for <webhook@archiver.kernel.org>; Sun, 28 Apr 2024 17:14:22 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.1249.1714324461155609759
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Apr 2024 10:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O3kYJh4Z;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-de5b1e6beceso2393747276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Apr 2024 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714324460; x=1714929260; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prbUE1F26l36heqC97EEmUVdy7yqJSzKYFpUAbdMhyg=;
        b=O3kYJh4ZKWU2VVHJEebVQyiNYKiyqy6WJKpKEZQX8NL8Y4oS9uVNCncjzfyqK3SO2/
         05L6f5UmIBTPaj6wGcdCOcyHZmJB1xcKeA7kqAoX2WmH6EhWBHcRlvcVWXgHFVz+o0rq
         JcEbRqxywMAp01BJyqir7e+fTJMZRoQb136tSx2TI5zm1wJ9b2noZNu9IpgQKxJI1LEl
         CJP8+z2k51SQq1hCAI+SKhFEu5eDyWesAYAl2bpnC7qXBLj+9ziOHX9PU3eE40drSoeK
         1ahRoksjk2OvWMW4KnHjbsR2X/SWlf/Nt3uS7EQpR0AvyiA2pHtQKeZljdM4WA7ZLD53
         tAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714324460; x=1714929260;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=prbUE1F26l36heqC97EEmUVdy7yqJSzKYFpUAbdMhyg=;
        b=e2a3RP2hkY5i+fdMiiBAONcVY8AMUGcO0U6Sl2hyTBUKvjdebHhs9FlpcxACidAZNl
         KFzZBAPyZMeDnsglJuko1w8jIuw89SOTEkk+tbw3d8WQxL1AFTqxnAaXfxrp8smvr8W4
         5W6gcxnsQu6DCT4vtItuXBas/jah5Szwmb8p2wgrUe00kE3/YEzpQeRdIYYDLYcoKkgQ
         g8+T53UegNr/AWlmCyCtkNlndieb2KUzK9cFnki1rvc3/3BK4lwAIj3Q3me0pY71OF2F
         k61C7I1yzuTrPPNGB9zejSs2nrI81mTEuEs+C9Asr9NXQzEAQ9AOmztjZKkgnI4fv6Ed
         I1uA==
X-Forwarded-Encrypted: i=1; AJvYcCXBDpqKnR3Ns8tUlzyOPS/38E2QZOYqKJIpW/l/nZRDq9IGPVUZpxLkjzaHdOfsWCThzHbHApIdwKmLIdsBaV5QpixuAOdCO0y7/tc/y7/x7cKkrxDA5YlkVQ==
X-Gm-Message-State: AOJu0YxPgwl3dlRG3DGLHU3xB/XeXav+Ge84wIfZJL8SZhoPRsg7Qwtu
	NiO9bgBIeX0CmwDALip3lsbd2gfxds/mrlo6rz59L2XzhQbye5SI
X-Google-Smtp-Source: AGHT+IFxRs/38slJQ0wdV+oFYBK4/7K/xZNdDn8gaqhuFAsKTfsU8tDk+wzPwfB3HvANMoZLjlZGtg==
X-Received: by 2002:a05:6902:240a:b0:dc7:4859:6f1 with SMTP id dr10-20020a056902240a00b00dc7485906f1mr9561148ybb.33.1714324459164;
        Sun, 28 Apr 2024 10:14:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:7153:1ec7:a008:5b50? ([2600:1700:45dd:7000:7153:1ec7:a008:5b50])
        by smtp.gmail.com with ESMTPSA id e5-20020a258745000000b00de11e553df7sm5078325ybn.60.2024.04.28.10.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Apr 2024 10:14:18 -0700 (PDT)
Message-ID: <8848eecd-9588-40ab-8806-0cafc2cf7554@gmail.com>
Date: Sun, 28 Apr 2024 13:14:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: April 28th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Apr 2024 17:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110162

The following changes since commit 8bb16533532b6abc2eded7d9961ab2a108fd7a5b:

   dnsmasq: Upgrade 2.87 -> 2.90 (2024-03-25 07:11:05 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 5a6f7925bd2b885955c942573f70a5594f231563:

   python3-twisted: Add python3-typing-extensions to RDEPENDS 
(2024-04-28 13:10:23 -0400)

----------------------------------------------------------------
Ashish Sharma (1):
       wireshark: Backport fix for CVE-2024-2955

Derek Straka (1):
       python3-pyyaml-include: add initial recipe for version 1.3.2

Hains van den Bosch (2):
       python3-twisted: Add python3-asyncio to RDEPENDS
       python3-twisted: Add python3-typing-extensions to RDEPENDS

Hitendra Prajapati (1):
       wireshark: fix CVE-2023-6175

Mingli Yu (1):
       python3-pyyaml-include: Upgrade 1.3.2 -> 1.4.1

Rahul Janani Pandi (3):
       python3-pillow: Fix CVE-2023-50447
       python3-django: fix CVE-2024-24680
       python3-aiohttp: Fix CVE-2024-23334

Rohini Sangam (1):
       xterm: Security fix for CVE-2023-40359

Soumya Sambu (2):
       iniparser: Fix CVE-2023-33461
       apache2: Upgrade v2.4.58 -> v2.4.59

Tim Orling (1):
       python3-pyyaml-include: switch to pytest --automake

Xiangyu Chen (1):
       bats: fix bats-format-pretty report error when multilib enabled

nikhil (1):
       giflib: Fix CVE CVE-2022-28506

  .../recipes-support/wireshark/files/CVE-2023-6175.patch         | 246 
++++++++++++++++++
  .../recipes-support/wireshark/files/CVE-2024-2955.patch         | 52 ++++
  meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 2 +
  meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch      | 40 +++
  meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb                 | 4 +-
  meta-oe/recipes-graphics/xorg-app/xterm/CVE-2023-40359.patch    | 388 
++++++++++++++++++++++++++++
  meta-oe/recipes-graphics/xorg-app/xterm_372.bb                  | 1 +
  .../recipes-support/iniparser/iniparser/CVE-2023-33461.patch    | 51 ++++
  meta-oe/recipes-support/iniparser/iniparser_4.1.bb              | 4 +-
  meta-oe/recipes-test/bats/bats_1.6.1.bb                         | 1 +
  .../python/python3-aiohttp/CVE-2024-23334.patch                 | 222 
++++++++++++++++
  meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb    | 3 +
  .../recipes-devtools/python/python3-django/CVE-2024-24680.patch | 48 ++++
  meta-python/recipes-devtools/python/python3-django_2.2.28.bb    | 1 +
  .../python/python3-pillow/CVE-2023-50447-1.patch                | 29 +++
  .../python/python3-pillow/CVE-2023-50447-2.patch                | 31 +++
  .../python/python3-pillow/CVE-2023-50447-3.patch                | 56 ++++
  .../python/python3-pillow/CVE-2023-50447-4.patch                | 66 +++++
  meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb     | 4 +
  .../recipes-devtools/python/python3-pyyaml-include/run-ptest    | 3 +
  .../recipes-devtools/python/python3-pyyaml-include_1.4.1.bb     | 29 +++
  meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb   | 2 +
  .../0004-apache2-log-the-SELinux-context-at-startup.patch       | 16 +-
  .../apache2/0007-apache2-allow-to-disable-selinux-support.patch | 10 +-
  .../apache2/{apache2_2.4.58.bb => apache2_2.4.59.bb} |   2 +-
  25 files changed, 1295 insertions(+), 16 deletions(-)
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-6175.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2024-2955.patch
  create mode 100644 
meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch
  create mode 100644 
meta-oe/recipes-graphics/xorg-app/xterm/CVE-2023-40359.patch
  create mode 100644 
meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-23334.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-24680.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-4.patch
  create mode 100755 
meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
  create mode 100644 
meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.58.bb => 
apache2_2.4.59.bb} (99%)


