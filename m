Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B04C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:00 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.17432.1635592559539610138
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CyGi26s1;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id p18so5230277plf.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tJWnr9tze+JnhOeHjXms/vezeQzcoE0F4k+wJwJ/nt8=;
        b=CyGi26s1uqugZ/qiF6KgsLRmvcIKptOe7SHerqvzDyCk21yVFoVN1mTmHcCLo6sDAY
         Y2dU+L7Jh2J4+CXaUke8CKgNKGQs+LhGVXHzFvqEi/9oI7tY+qx0oFMnN5YQNhck7LhQ
         By9SmnjjcjjSIuRCK7Iwy+8e0MPnEHVqSar1sHhBaIZbWHlcUhs3FdpvAofsdEe3/uNE
         M9lMz3b+3bHIyFVeT4RAMLwJYw7B2wBiWofpPnJXRcAlIduprNUHU9eeSmSXxo9tVmkK
         uGXrWE8w4amgJ6+HL73tXw4RJeHPvKvTQESd4QxF06XXqEOKd8pR9EuQ4Z1qWG0+KZRt
         ZLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tJWnr9tze+JnhOeHjXms/vezeQzcoE0F4k+wJwJ/nt8=;
        b=h21CF3wfo5TCv92FvrnDULhik/EyakS/uT8vgrfaEaykkJOMQhkHNYJlPKZwApSsQX
         VX7opVJeCvBMwAiN57jvT9LzOZ1gaCxVApHfu/ckIpDK4wK5BTqeDaKfdofpN4ZfTuCS
         ZJRox+rgq+BHAsgqx2eH41C3/O6gyVfwmGQBqyT6t+6HmBLRyCL0PhK8uQw11CKZ3Qgc
         82xjIhi83c+K+CnhE2nzsksxoayqn4Y+WrvP0sSpYUtkysCDGNB7Vp2K/SyPYZGwHDwt
         ARGwG098J5I+jUTgw3X978ER1Wke5awwwjFAi68Q0509mEwKLz8Q4iz+poE9LVIX9Kmi
         RkKg==
X-Gm-Message-State: AOAM531XKw0/1sOK8Z2meX1S6REg9d5cuUJEl6/bBCyNudL3YkiTQBQX
	KQhqPDFvu9uTjCTA5IrqEGeWZU1x2vY=
X-Google-Smtp-Source: 
 ABdhPJyeyQ8A5xxpSLCMJ0TTO35RmjXSa2LfXL1/gJbmPeQ+0LEbu/fPlN5xvsJsbHJzm+D0tzpVwg==
X-Received: by 2002:a17:902:bb96:b0:13f:b181:58ef with SMTP id
 m22-20020a170902bb9600b0013fb18158efmr14816894pls.2.1635592558779;
        Sat, 30 Oct 2021 04:15:58 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.15.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:15:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 00/14] Patch review
Date: Sat, 30 Oct 2021 04:15:37 -0700
Message-Id: <cover.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93657

Please review and have comments back by Monday

The following changes since commit 33c00e34fc2b085ea538445bbd1ba339024d4d8a:

  pahole: use MACHINE_ARCH (2021-10-12 09:45:25 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/honister-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/honister-nut

Alexander Thoma (1):
  keyutils: fix install path

Armin Kuster (1):
  Apache: Several CVE fixes

Khem Raj (1):
  python3-behave: Switch to using github src_uri

Matthias Schiffer (1):
  byacc: switch to official HTTPS mirror

Yi Zhao (1):
  strongswan: upgrade 5.9.3 -> 5.9.4

wangmy (3):
  openvpn: upgrade 2.5.3 -> 2.5.4
  redis: upgrade 6.2.5 -> 6.2.6
  span-lite: upgrade 0.10.1 -> 0.10.3

zangrc (6):
  python3-ipython: upgrade 7.27.0 -> 7.28.0
  python3-jdatetime: upgrade 3.6.2 -> 3.6.4
  python3-openpyxl: upgrade 3.0.8 -> 3.0.9
  python3-transitions: upgrade 0.8.9 -> 0.8.10
  networkmanager-openvpn: upgrade 1.8.14 -> 1.8.16
  ser2net: upgrade 4.3.3 -> 4.3.4

 ...1.8.14.bb => networkmanager-openvpn_1.8.16.bb} |  3 +--
 .../{openvpn_2.5.3.bb => openvpn_2.5.4.bb}        |  3 +--
 .../{strongswan_5.9.3.bb => strongswan_5.9.4.bb}  |  2 +-
 .../{ser2net_4.3.3.bb => ser2net_4.3.4.bb}        |  2 +-
 meta-oe/recipes-extended/byacc/byacc.inc          |  2 +-
 .../redis/{redis_6.2.5.bb => redis_6.2.6.bb}      |  2 +-
 .../recipes-security/keyutils/keyutils_1.6.1.bb   | 15 +++------------
 .../{span-lite_0.10.1.bb => span-lite_0.10.3.bb}  |  2 +-
 .../python/python3-behave_1.2.6.bb                |  9 ++++++---
 ...python_7.27.0.bb => python3-ipython_7.28.0.bb} |  2 +-
 ...tetime_3.6.2.bb => python3-jdatetime_3.6.4.bb} |  5 ++---
 ...penpyxl_3.0.8.bb => python3-openpyxl_3.0.9.bb} |  2 +-
 ...ons_0.8.9.bb => python3-transitions_0.8.10.bb} |  2 +-
 .../{apache2_2.4.49.bb => apache2_2.4.51.bb}      |  2 +-
 14 files changed, 22 insertions(+), 31 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.8.14.bb => networkmanager-openvpn_1.8.16.bb} (91%)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.3.bb => openvpn_2.5.4.bb} (95%)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.3.bb => strongswan_5.9.4.bb} (98%)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.3.bb => ser2net_4.3.4.bb} (84%)
 rename meta-oe/recipes-extended/redis/{redis_6.2.5.bb => redis_6.2.6.bb} (96%)
 rename meta-oe/recipes-support/span-lite/{span-lite_0.10.1.bb => span-lite_0.10.3.bb} (86%)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.27.0.bb => python3-ipython_7.28.0.bb} (89%)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_3.6.2.bb => python3-jdatetime_3.6.4.bb} (56%)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.8.bb => python3-openpyxl_3.0.9.bb} (88%)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.9.bb => python3-transitions_0.8.10.bb} (75%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.49.bb => apache2_2.4.51.bb} (99%)

-- 
2.25.1


