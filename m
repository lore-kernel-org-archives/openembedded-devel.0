Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C010C8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 17:44:08 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.1725.1751651041234413629
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jul 2025 10:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y+zWXYMi;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70e3980757bso10237867b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 10:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751651040; x=1752255840; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zzhvwZ274kCWqevzAJl0rmZ6e13LsudJFxJcLHZcAI=;
        b=Y+zWXYMi0brhxaHQpRaEOsrR+Tbsh3UxcWmgGDm7cUkb155nZpqcetOU7gp/La5pWw
         UdZU+mA+QKMXikX4qY6dGFhDNOLbYhcMvSt4/177a0C3MF+D4XwBK6TdZLSL4ZrJnvDs
         eg47MsgLxl3HsFM7b45qJy1HjIiKxVW195Jf+0Q7Qn7xpYPk6BaexFcuU/wmqCUir/Tk
         /BfRpQ0FhVj1MpNwcZjhE7TXLLIieOvJgmlOrXS23ViFhvJR8Ga2DT8waU4+3N9S1HAn
         P+Y68CWtioYvAo3C/WHtagQuo+vCF/5XM4rGoychEgQoYuoBzzK3JsQh6qkAdhrPNz1/
         dVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751651040; x=1752255840;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zzhvwZ274kCWqevzAJl0rmZ6e13LsudJFxJcLHZcAI=;
        b=wn6QtlO8++s23mWznAMRG3QTFY5v58LzPIZ40gfmyMravXfl1RMyjg+44XM8KB7fIG
         4ofgXcB9q2XKFbvYYbRBLt1zIEhuhmE/jH4aMNzJYqA8rAoocF1Cv31msQ2mKTJMpwmk
         2OU4OJWcNhvmJockr9o0kqAgUf3Dz2zb1SV57qXg6d8VWJZ/Cm5gOvlJowIYCg6gm6c0
         sq0R3zX21xPk4f02LEsl7hMaOBFDl8FydKKVNSHD1b9dIi5UVYfcWR8ahwdfMU11SGZU
         zyRYzxvfD6cAGwnOEFLGJX09QxJyf7gsEke5NHGfz9FJjy3S32BmBcXgEkbLh9WkXJAx
         gllA==
X-Forwarded-Encrypted: i=1; AJvYcCVaHIeVWKIXcU9NBinoDukoXjJqo4dK7zZvlFm4NAUfU5v1Y2HC446Ly7x0+JiE55NvKgbOCU6DrHTkF1sZ4eIWww4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzdQvF5mQOfZOnlOONLcmO5gOLRoswTDn6niEtuO1mTqbaGep5j
	KynYq5sCUHndq1ZhWRMEge+MZliF1I0GpQizumEQFQfGZsbPHU8W7lze
X-Gm-Gg: ASbGnctkRqID0dw3CpQvQLJViHuqtO5Aji5Xi2SA/CFs+Nu1yzAzYwrTKdToQ95aGaA
	dod8UEmxyI2JCawpyYO6nW5d7MJLfYad0N1OwYUjyMtXtdVxSWWUonko63iZBdXsYgvPlttBnhF
	rLABSXg0DtumBW+P5fD7ZmKFobFd7+6YDmM5rWTUxTZfz/A9y8XsLLN73gLJzElSXyWbq3XQazF
	PRvagSUoRoW3odgoAiHkHwJzX2xkLFUwe9VEdQhJZ36pzo/zIYqON0Hj9lPHkS8mITjUI6bdgUu
	4FypmRfQQe+cqIe1bhJEWelB7RB9m6HnNnHuQmSERsKBa5N+hph7fFopBkPMuvRWfiSUPU9LZMv
	WLfUEry4vnoSk9vKRUL9X47GhcAuI8Ji2YPICkn7m5o5Ztw==
X-Google-Smtp-Source: AGHT+IFxGXh+t7ivsX0CvP6kwLKfrAvoCcA+D61L27l+z/0GKfz/DPwoDH2yz5vepJNmiAcJG6Llpw==
X-Received: by 2002:a05:690c:74ca:b0:713:fed3:70a5 with SMTP id 00721157ae682-71667eac034mr52223257b3.9.1751651040038;
        Fri, 04 Jul 2025 10:44:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:ea50:7f8:a5f2:dc08? ([2600:1700:45dd:7000:ea50:7f8:a5f2:dc08])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71665b1260fsm4869867b3.91.2025.07.04.10.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 10:43:59 -0700 (PDT)
Message-ID: <42452556-8e91-4aef-96ad-38e340e13ace@gmail.com>
Date: Fri, 4 Jul 2025 13:43:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: July 4th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 17:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118238

The following changes since commit 45bddd258a3d1ded925faf8389e01bb948dc7f5b:

   poppler: fix CVE-2025-43903 (2025-05-25 14:48:44 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 058249f9a836e3aa866436aa6e37d6d48ff768fd:

   libssh: fix CVE-2025-5318 (2025-07-02 20:42:48 -0400)

----------------------------------------------------------------
Ashish Sharma (1):
       tcpdump: patch CVE-2024-2397

Bastian Krause (2):
       libsocketcan: use https instead of git protocol
       canutils: use https instead of git protocol

Chen Qi (3):
       protobuf: fix ptest with python PACKAGECONFIG enabled
       python3-protobuf: fix RDEPENDS
       protobuf: fix CVE-2025-4565

Hitendra Prajapati (1):
       libssh: fix CVE-2025-5318

Jason Schonberg (1):
       xfce4 update HOMEPAGEs

Jiaying Song (1):
       python3-aiohttp: fix CVE-2024-42367

Leonard Anderweit (1):
       lmsensors: Fix build without sensord

Sana Kazi (1):
       imagemagick: Fix CVE vulnerablities

Vijay Anusuri (2):
       proftpd: Fix CVE-2024-57392
       redis: Fix CVE-2025-21605

Yogita Urade (5):
       syslog-ng: fix CVE-2024-47619
       postgresql: upgrade 14.17 -> 14.18
       mariadb: fix CVE-2023-52968
       mariadb: fix CVE-2023-52969 and CVE-2023-52970
       mariadb: fix CVE-2024-21096

  .../recipes-daemons/proftpd/files/CVE-2024-57392.patch          | 42 +
  meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb |    1 +
  .../recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch         | 126 +
  meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb |    1 +
  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb |    5 +-
  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 12 +-
  meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-52968.patch          | 106 +
  .../mysql/mariadb/CVE-2023-52969-CVE-20230-52970-0001.patch     | 502 ++
  .../mysql/mariadb/CVE-2023-52969-CVE-20230-52970-0002.patch     | 168 +
  .../mysql/mariadb/CVE-2023-52969-CVE-20230-52970-0003.patch     | 470 ++
  .../mysql/mariadb/CVE-2023-52969-CVE-20230-52970-0004.patch     | 1785 
+++++++
  meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0001.patch     | 1392 
+++++
  meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0002.patch     | 38 +
  meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0003.patch     | 138 +
  meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0004.patch     | 7729 
+++++++++++++++++++++++++++
  meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0005.patch     | 1431 
+++++
  .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch |    4 +-
  .../postgresql/{postgresql_14.17.bb => postgresql_14.18.bb} |    2 +-
  meta-oe/recipes-devtools/protobuf/protobuf/CVE-2025-4565.patch  | 376 ++
  meta-oe/recipes-devtools/protobuf/protobuf/run-ptest |    2 +-
  meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb |    4 +-
  .../recipes-extended/redis/redis-7.0.13/CVE-2025-21605.patch    | 62 +
  meta-oe/recipes-extended/redis/redis_7.0.13.bb |    1 +
  meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb |    2 +-
  meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb |    2 +-
  meta-oe/recipes-support/imagemagick/files/CVE-2021-20309.patch  | 25 +
  meta-oe/recipes-support/imagemagick/files/CVE-2021-20310.patch  | 31 +
  meta-oe/recipes-support/imagemagick/files/CVE-2021-3610.patch   | 26 +
  meta-oe/recipes-support/imagemagick/files/CVE-2022-0284.patch   | 34 +
  meta-oe/recipes-support/imagemagick/files/CVE-2022-2719.patch   | 136 +
  meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch | 178 +
  meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb       | 19 +-
  meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch       | 31 +
  meta-oe/recipes-support/libssh/libssh_0.8.9.bb |    1 +
  meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch    | 286 +
  meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb |    1 +
  .../python/python3-aiohttp/CVE-2024-42367.patch                 | 65 +
  meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb |    1 +
  meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb |    1 +
  meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb |    2 +-
  .../xfce4-screenshooter/xfce4-screenshooter_1.9.10.bb |    2 +-
  .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb |    2 +-
  .../recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb |    2 +-
  .../calculator/xfce4-calculator-plugin_0.7.1.bb |    2 +-
  .../recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb |    2 +-
  .../recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.7.bb |    2 +-
  .../cpugraph/xfce4-cpugraph-plugin_1.2.6.bb |    2 +-
  .../datetime/xfce4-datetime-plugin_0.8.1.bb |    2 +-
  .../diskperf/xfce4-diskperf-plugin_2.7.0.bb |    2 +-
  meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb |    2 +-
  .../recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb |    2 +-
  .../recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb |    2 +-
  .../mailwatch/xfce4-mailwatch-plugin_1.3.0.bb |    2 +-
  .../recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb |    2 +-
  .../recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb |    2 +-
  .../recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb |    2 +-
  .../recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb |    2 +-
  .../recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb |    2 +-
  .../smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb |    2 +-
  .../systemload/xfce4-systemload-plugin_1.3.1.bb |    2 +-
  .../time-out/xfce4-time-out-plugin_1.1.2.bb |    2 +-
  .../recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb |    2 +-
  .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb |    2 +-
  .../recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb |    2 +-
  .../weather/xfce4-weather-plugin_0.11.0.bb |    2 +-
  meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb |    2 +-
  .../archive/thunar-archive-plugin_0.4.0.bb |    2 +-
  .../xfce4-power-manager/xfce4-power-manager_4.16.0.bb |    2 +-
  68 files changed, 15254 insertions(+), 40 deletions(-)
  create mode 100644 
meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch
  create mode 100644 
meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-52968.patch
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-52969-CVE-20230-52970-0001.patch
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-52969-CVE-20230-52970-0002.patch
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-52969-CVE-20230-52970-0003.patch
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-52969-CVE-20230-52970-0004.patch
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0001.patch
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0002.patch
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0003.patch
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0004.patch
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/CVE-2024-21096-0005.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_14.17.bb => 
postgresql_14.18.bb} (84%)
  create mode 100644 
meta-oe/recipes-devtools/protobuf/protobuf/CVE-2025-4565.patch
  create mode 100644 
meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-21605.patch
  create mode 100644 
meta-oe/recipes-support/imagemagick/files/CVE-2021-20309.patch
  create mode 100644 
meta-oe/recipes-support/imagemagick/files/CVE-2021-20310.patch
  create mode 100644 
meta-oe/recipes-support/imagemagick/files/CVE-2021-3610.patch
  create mode 100644 
meta-oe/recipes-support/imagemagick/files/CVE-2022-0284.patch
  create mode 100644 
meta-oe/recipes-support/imagemagick/files/CVE-2022-2719.patch
  create mode 100644 
meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
  create mode 100644 
meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch
  create mode 100644 
meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-42367.patch

