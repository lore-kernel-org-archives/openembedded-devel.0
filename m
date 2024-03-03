Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0886FC54E41
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 21:41:35 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.83843.1709502088403286629
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Mar 2024 13:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UEZx8gRq;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6e4de6fb7f9so933260a34.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 13:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709502087; x=1710106887; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/syUtq9LU/pfwbRaQnQ1tvQhQm0JmaqEGJPxAQV9IiQ=;
        b=UEZx8gRqGoPqSvkLTusR/hJW7wRBd5YwOLKRQ+p3/TIB67ByzSheDJN5OUyipppZlq
         //eqQrrPYelpxVaMSdj/aiFpY1P643JzDEGQPNxKu4dgusyrPJx3W2m8Q59QSQxQfr6M
         Pgxertbryo1jX0avLsUnjFSZ/56iE9lLI8ZQW8xhba5GtiFCWr9o4my0BVXL2mNG9/7b
         TjRkgwML/wOETvmz/yC8XEPoOKR2ZWUpFKDL4wNrTvDT+kltLsaZVrd2XJK2uspay0ir
         ujjBfZRAvnPnRcKYUxv12u1xIliANJ3/xAv3j2e12g9cY0FSNs2hik9JEX65f+Ti/iov
         VPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709502087; x=1710106887;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/syUtq9LU/pfwbRaQnQ1tvQhQm0JmaqEGJPxAQV9IiQ=;
        b=G447MMVgUVpXC/qabiaZYyET9eXwsNhbVlVziC9R4tAUBVh/XyVHTY3Fvk4MRlWYbo
         3HmWY9Qn6RhSdqep+KvnRM/1H79/xfzs43+WPdXZrW5m3VvsfEv48ysR2z6S+vC4eNvQ
         4sx+EFjfW58MzxhvOT+tJVrYRm7Fksa57ZrPiQhbT5pBQJ/k0HnT6bn1RmRBaurfnawG
         LSytgWITsxq5qkkYeGSsvRVslMBwY3e4fMFZ5G0WrWRUjsBZBns/rnKZrpwKBtFygEvy
         efyFZLyRT6W2P7jzWVl0Vq6UFxC210xOrfmTLyamhJpeRNJksKGw1rdTmg09NGT0TK4u
         oUzw==
X-Forwarded-Encrypted: i=1; AJvYcCVhPG7nyA+5Wkntr8NIYeNC61c8UCQ3+WqwbFRhqZEUA3vX4inaxWAt7ia0m0gLllpc11A4jCbjM9Ez6SpsQvLKrtJX8rpXJy9TUYcmg2IC74HBUrLOdgBiJQ==
X-Gm-Message-State: AOJu0YzoAt7HvmOemyib5eKZWUBZa0bRTu675KLMXQdrJ971aNB4/Nej
	1NxLthvMgpAkLIdkRJt9AYKhNvOMYMT4WAcza5gMpyjWyVV1Qin4
X-Google-Smtp-Source: AGHT+IE8n1GNzcCafx4OW2WP7E7KTdSNj6DujZSjAao3zOw3Ov+ManqVn/qSRKwgOfaJVDVN8ldFDg==
X-Received: by 2002:a05:6808:1521:b0:3c1:c06b:76c2 with SMTP id u33-20020a056808152100b003c1c06b76c2mr8763447oiw.21.1709502087398;
        Sun, 03 Mar 2024 13:41:27 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:cf4c:8faf:cac1:62f9? ([2600:1700:45dd:7000:cf4c:8faf:cac1:62f9])
        by smtp.gmail.com with ESMTPSA id t33-20020a25f621000000b00dcda90f43d7sm1934785ybd.59.2024.03.03.13.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Mar 2024 13:41:26 -0800 (PST)
Message-ID: <6155dc8a-5054-4273-84b8-9ac7c5604e8b@gmail.com>
Date: Sun, 3 Mar 2024 16:41:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: March 3rd
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 21:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109092

The following changes since commit daa4619fe3fbf8c28f342c4a7163a84a330f7653:

   postgresql: Update to 12.17 (2024-01-16 07:31:14 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to c74ebbddfd9dbe02d3f7422016324451eb218e1e:

   python3-pillow: Fix for CVE-2023-50447 (2024-03-03 16:38:27 -0500)

----------------------------------------------------------------
Ashish Sharma (1):
       wireshark: Backport fix for CVE-2023-1992

Changqing Li (1):
       linuxptp: fix do_compile error

Hitendra Prajapati (2):
       apache2: upgrade 2.4.57 -> 2.4.58
       wireshark: fix CVE-2024-0208 GVCP dissector crash

Hugo SIMELIERE (1):
       libuv: fix CVE-2024-24806

Khem Raj (1):
       gdm: Add polkit to required distro features

Vijay Anusuri (4):
       squid: backport Debian patch for CVE-2023-46728 and CVE-2023-46846
       squid: Fix for CVE-2023-49285 and CVE-2023-49286
       squid: Backport fix for CVE-2023-50269
       python3-pillow: Fix for CVE-2023-50447

Wang Mingyu (1):
       openwsman: Change download branch from master to main.

virendra thakur (1):
       nodejs: Set CVE_PRODUCT to "node.js"

  meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb |    2 +-
  meta-networking/recipes-daemons/squid/files/CVE-2023-46728.patch |  
608 ++++++++++++++++++++
  meta-networking/recipes-daemons/squid/files/CVE-2023-46846-pre1.patch 
| 1154 ++++++++++++++++++++++++++++++++++++++
  meta-networking/recipes-daemons/squid/files/CVE-2023-46846.patch |  
169 ++++++
  meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch |   35 ++
  meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch |   
87 +++
  meta-networking/recipes-daemons/squid/files/CVE-2023-50269.patch |   62 ++
  meta-networking/recipes-daemons/squid/squid_4.9.bb |    6 +
  meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch 
|   62 ++
  meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch 
|   42 ++
  meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb |    2 +
  meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch |   32 ++
  meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch |   30 +
  meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb |    4 +-
  .../linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch |   42 ++
  meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.1.bb |    1 +
  meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb |    2 +
  meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb |    2 +
  meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb |    2 +-
  meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch |   31 +
  meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch |   54 ++
  meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch |   44 ++
  meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb |    3 +
  .../apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch |   31 -
  meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch |  
141 -----
  meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb => 
apache2_2.4.58.bb}      |    4 +-
  26 files changed, 2474 insertions(+), 178 deletions(-)
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-46728.patch
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-46846-pre1.patch
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-46846.patch
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-50269.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch
  create mode 100644 
meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch
  create mode 100644 
meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch
  create mode 100644 
meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch
  delete mode 100644 
meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
  delete mode 100644 
meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb => 
apache2_2.4.58.bb} (97%)

