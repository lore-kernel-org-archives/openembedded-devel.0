Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811CCC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 13:15:37 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.17353.1707398128836954344
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 05:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jd7ZZuS8;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60403c28ff6so20486267b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 05:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707398128; x=1708002928; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MrskOvEWSrJx7y+2CTa3KRvjenR6CfRyS94mGFHYs4=;
        b=jd7ZZuS8Gljco/kZ1ApAb/TdV1rMg6Eh16Y2pOnmUacdWXkXfPTYcoOFS+pQwuwgyU
         GSUTHjtNK3PjwVB9viMJVXHR2R/ZVAD7QAMqhS7xA3Ixv01Rjtokhi7ZP5G0bplHbXdT
         niMRtp1ijvn2coWXiRgFDjcU3/oZzGj3ocpnB6RhBvGxspEh8mVBvgljoFhkHivt5sQf
         VRPxrlRHzOPZ4ogoyCOyBiWjagJxW0q/s98xZ2SA0SfqvA9zJ2nXo6/zH+Oz5dHWFfS6
         RHKsXDJLTWhh/N+mFZ5TghUMvVgyM44kFc9rBsOwQclgfjM3f103GhvAHyC4PDVzeHv4
         GL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707398128; x=1708002928;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MrskOvEWSrJx7y+2CTa3KRvjenR6CfRyS94mGFHYs4=;
        b=FyCoRhxQSAu9furz64f/r16Op0HZcZQcVUrhEB72h+sZEDsPEscxKyXZWYWst92YTn
         vSkmgE4xuCSHEyo3iKbk6WIL3E01ceI66rROYwj2U6GVKARD/p5UkmhjEiS8wLXio3CB
         Wma4mP5nCgDAMrgzIUwO538mxWvSvHOupGmK82WQDsdn3L5sKGjK/Aaogss3hVKKZZu1
         BH5XCcix3Q7eRs/wHU2YogqMk4hv3SExZDemvb513crl33gPBdwv53aMMWWY1+w72JJN
         96ACFEYjTxoLSqa0dFnYU06dvxZLceoHH3JYY9GF0FjBDmVSjm//NeO507kqWqrPkPwA
         GJog==
X-Forwarded-Encrypted: i=1; AJvYcCUPW2jEpwAL0V3aRFUfGZIWt3c+KkwiR2qjoda3rp6x55rzaMdFqFmxKeeAVlOU+0pBoZsshOakRiM6mHYe6Gq3DbGFc/0ZIabcFzmTZIEx80iZH2xVPVolXg==
X-Gm-Message-State: AOJu0YzaJJ8JA/NmHb4yIlrNy/+cqHv+qcN/e3SImWFAYvIAYJQipuSA
	tuLTbghSRy1gzeao4urNKWAm+YRoNJwX74hHmV3twDkuk87auiR0EXF87UmS
X-Google-Smtp-Source: AGHT+IFH7VjfqwNw+smyV1O1tRzurV4Fk7w9IYWSFNBNwasay6CXC/LqASQGBRsxQqaBmnVOlU+pRw==
X-Received: by 2002:a81:ce06:0:b0:5ff:9f15:48fa with SMTP id t6-20020a81ce06000000b005ff9f1548famr6716765ywi.51.1707398127841;
        Thu, 08 Feb 2024 05:15:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpdV4zabGmt+G37ECgdRUNqxwdGkQnrdM0rhxlix8FGo+ND6ralMLFq7vD8B1iE8hbm0Lh/ekbqBZWfNjEv5sX8GUIUdj8ChinvyuwJvm0+wbzDNOrPU72YA==
Received: from [192.168.18.247] (108-243-27-252.lightspeed.tukrga.sbcglobal.net. [108.243.27.252])
        by smtp.gmail.com with ESMTPSA id cd8-20020a05690c088800b005ff8c88bea0sm684488ywb.14.2024.02.08.05.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 05:15:27 -0800 (PST)
Message-ID: <b22274d1-47d1-483f-8c4b-76dd9e5354ad@gmail.com>
Date: Thu, 8 Feb 2024 08:15:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Feb 8th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 13:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108666

Changes missed on mailing list.

The following changes since commit ce9c0d76171ce9d07e4bcb702b750416b265562a:

   strongswan: upgrade 5.9.12 -> 5.9.13 (2024-02-05 07:37:06 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 8609de00952d65bb813a48c535c937324efeb18a:

   Revert "libcroco: Add fix for CVE-2020-12825" (2024-02-07 18:41:41 -0500)

----------------------------------------------------------------
Archana Polampalli (2):
       samba: fix CVE-2018-14628
       samba: fix CVE-2023-0922

Ashish Sharma (1):
       postfix: Backport fix for CVE-2023-51764

Changqing Li (1):
       linuxptp: fix do_compile error

Hitendra Prajapati (1):
       wireshark: fix CVE-2024-0208 GVCP dissector crash

Joao Marcos Costa (1):
       xscreensaver: Add osuosl backup MIRROR

Jose Quaresma (1):
       layer.conf: Add libdevmapper-native PREFERRED_RPROVIDER

Li Wang (1):
       radvd: add '--shell /sbin/nologin' to /etc/passwd

Martin Jansa (1):
       Revert "libcroco: Add fix for CVE-2020-12825"

Narpat Mali (1):
       python3-aiohttp: upgrade 3.8.5 -> 3.8.6

Vijay Anusuri (3):
       libssh: Backport fix for CVE-2023-48795
       wireshark: Fix for CVE-2023-4511
       squid: backport Debian patch for CVE-2023-46728 and CVE-2023-46846

Vivek Kumbhar (1):
       squid: Backport fix for CVE-2023-49285

Yogita Urade (1):
       zabbix: fix CVE-2023-32726 and CVE-2023-32727

Zahir Hussain (1):
       p7zip: fix CVE-2018-5996 & CVE-2016-9296

virendra thakur (2):
       opensc: Fix CVE-2023-40660
       opensc: Fix CVE-2023-40661

  .../recipes-connectivity/samba/samba/CVE-2018-14628-0001.patch  | 147 ++++
  .../recipes-connectivity/samba/samba/CVE-2018-14628-0002.patch  | 72 ++
  .../recipes-connectivity/samba/samba/CVE-2018-14628-0003.patch  | 106 +++
  .../recipes-connectivity/samba/samba/CVE-2018-14628-0004.patch  | 64 ++
  .../recipes-connectivity/samba/samba/CVE-2018-14628-0005.patch  | 98 +++
  .../recipes-connectivity/samba/samba/CVE-2018-14628-0006.patch  | 51 ++
  .../recipes-connectivity/samba/samba/CVE-2023-0922.patch        | 111 +++
  meta-networking/recipes-connectivity/samba/samba_4.14.14.bb |    7 +
  .../recipes-daemons/postfix/files/CVE-2023-51764-1.patch        | 377 
+++++++++
  .../recipes-daemons/postfix/files/CVE-2023-51764-2.patch        | 978 
+++++++++++++++++++++++
  meta-networking/recipes-daemons/postfix/postfix_3.6.7.bb |    2 +
  meta-networking/recipes-daemons/radvd/radvd.inc |    2 +-
  .../recipes-daemons/squid/files/CVE-2023-46728.patch            | 608 
++++++++++++++
  .../recipes-daemons/squid/files/CVE-2023-46846-pre1.patch       | 1154 
+++++++++++++++++++++++++++
  .../recipes-daemons/squid/files/CVE-2023-46846.patch            | 169 ++++
  .../recipes-daemons/squid/files/CVE-2023-49285.patch            | 37 +
  meta-networking/recipes-daemons/squid/squid_4.15.bb |    4 +
  .../recipes-support/wireshark/files/CVE-2023-4511.patch         | 81 ++
  .../recipes-support/wireshark/files/CVE-2024-0208.patch         | 42 +
  meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb |    2 +
  meta-oe/conf/layer.conf |    1 +
  ...1-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch | 42 +
  meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb |    1 +
  meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32726.patch | 160 ++++
  .../zabbix/zabbix/CVE-2023-32727_0001.patch                     | 193 
+++++
  .../zabbix/zabbix/CVE-2023-32727_0002.patch                     | 49 ++
  meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb |    3 +
  meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch        | 30 +
  meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch        | 228 
++++++
  meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |    2 +
  meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb |    2 +
  meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-1.patch    | 385 
+++++++++
  meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-2.patch    | 126 +++
  meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-3.patch    | 47 ++
  meta-oe/recipes-support/libssh/libssh_0.8.9.bb |    3 +
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch      | 55 ++
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-1.patch    | 47 ++
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-2.patch    | 32 +
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-3.patch    | 31 +
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-4.patch    | 28 +
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-5.patch    | 30 +
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-6.patch    | 30 +
  meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-7.patch    | 40 +
  meta-oe/recipes-support/opensc/opensc_0.22.0.bb |    8 +
  .../{python3-aiohttp_3.8.5.bb => python3-aiohttp_3.8.6.bb} |    2 +-
  meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch     | 190 
-----
  meta/recipes-support/libcroco/libcroco_0.6.13.bb                | 22 -
  47 files changed, 5685 insertions(+), 214 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0001.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0002.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0003.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0004.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0005.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2018-14628-0006.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-0922.patch
  create mode 100644 
meta-networking/recipes-daemons/postfix/files/CVE-2023-51764-1.patch
  create mode 100644 
meta-networking/recipes-daemons/postfix/files/CVE-2023-51764-2.patch
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-46728.patch
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-46846-pre1.patch
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-46846.patch
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch
  create mode 100644 
meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.patch
  create mode 100644 
meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32726.patch
  create mode 100644 
meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32727_0001.patch
  create mode 100644 
meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-32727_0002.patch
  create mode 100644 
meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
  create mode 100644 
meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-1.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-2.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-3.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-1.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-2.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-3.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-4.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-5.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-6.patch
  create mode 100644 
meta-oe/recipes-support/opensc/opensc/CVE-2023-40661-7.patch
  rename meta-python/recipes-devtools/python/{python3-aiohttp_3.8.5.bb 
=> python3-aiohttp_3.8.6.bb} (89%)
  delete mode 100644 
meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
  delete mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb


