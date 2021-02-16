Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.2367.1613440704116588736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 17:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bdtTZahk;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id t26so5295231pgv.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 17:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=J0/rNG37m5evjKsc+J6/yUWNjrkhFYbTfVgzLp1GY2w=;
        b=bdtTZahklt/1o2MofL9+ZeamgjRypFzHE4x26nlykkZJlqjWqm4bShO3Kp20CU2xmq
         gk+p79Cg0P8zMqLq/GzVoquZUVzeaWa05NLSQsa6F8G9xmx+TXUfazovzZYHLKBle1Nv
         IyevTCf7Y6L2NaVlfXpL52vi73DJ0dddrQPxudU2/DtbhOJeJ306Az3diiKgpufCP7Pq
         vvDhkbac/VQVImlKF0BF03gJDf1q0NyoxyfnXhCiHvjhvxzijCdMdjDGwhCbLtOVVkXP
         fg0e4XQtRcM0ZJXU9GwPhDrUFoOlNx1ayLAfJMaoKWAQk7evu7Eu1wIzXUYOLZ+Fbpyz
         MV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=J0/rNG37m5evjKsc+J6/yUWNjrkhFYbTfVgzLp1GY2w=;
        b=EX4yhgBL+ziOrLUkdKVLTSql4P4BY5iNOELAN8WjSAqLEmECtFD4KF+x64d1igkZlH
         rpfCj3fx6WfRRvQzAK+yA+K5whoiA8VFYQBYkxtAlnIQeQxUAIQ9dv7/jWAnb1L6cfs4
         deuTCb2tQBKSRYMZ2eevAJJAJUdZZtWjDo1TpcOXz0BSjxMqG/clrKdqoYn63ToA/3CE
         4JFxPXRhuS5NOvBCdWq3NW6FQ96qs8twmDXC64wYwv2vh6TC5QItCCk9CREwEg4zXEmc
         sNtTubeVydM2f2tg7y5ilWtcJeO3cZ7lPsiT3IjwBf8huLi5ldZBuR2Ov6XS++uMDXia
         f0uQ==
X-Gm-Message-State: AOAM530FBwuwN31/3gHoKjky8StYF0KeITtDWdmHnQ8OZ9dG7CXRu/V6
	k1giLlxjQzZ3LCrgiLQp45yyxIVdSJIy0w==
X-Google-Smtp-Source: ABdhPJyj0uNNOjBbCMbZlqKUsGkfMlstqwUkoLOcTQWxMGyvkqMrbQdlBFq/ePPtEMKjIjTWjdp5oA==
X-Received: by 2002:a63:1d4d:: with SMTP id d13mr16869550pgm.103.1613440703344;
        Mon, 15 Feb 2021 17:58:23 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id c24sm19756159pfo.209.2021.02.15.17.58.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 17:58:23 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/11] Patch review Feb 15th
Date: Mon, 15 Feb 2021 17:58:08 -0800
Message-Id: <cover.1613440394.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Here is the next set for review.
Please have reviews back by Wednesday

The following changes since commit de37512b25c1f8c6bb6ab2b3782ac0fe01443483:

  gpsd: mark CLEANBROKEN (2021-01-31 09:42:35 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Andrej Kozemcak (1):
  libuv: fix CVE-2020-8252

Haiqing Bai (1):
  python-urllib3/python3-urllib3: fix CVE-2020-7212

Khem Raj (1):
  python-grpcio-tools: Add missing space for append

Mario Schuknecht (1):
  dnsmasq: Fix systemd service

Martin Jansa (1):
  wireguard-module: remove PKG assignment

Zang Ruochen (1):
  openldap: upgrade 2.4.50 -> 2.4.51

akuster (2):
  enca: Fix SRC_URI
  meta-oe/README: add Ubuntu prerequisite information

changqing.li@windriver.com (1):
  celt051: update SRC_URI

zangrc (1):
  openldap: upgrade 2.4.51 -> 2.4.56

zhengruoqin (1):
  openldap: upgrade 2.4.56 -> 2.4.57

 .../wireguard-module_1.0.20200401.bb          |  7 ---
 .../recipes-support/celt051/celt051_git.bb    |  2 +-
 .../dnsmasq/files/dnsmasq-resolvconf.service  |  2 +-
 meta-oe/README                                |  3 +
 .../libuv/libuv/CVE-2020-8252.patch           | 41 ++++++++++++++
 .../libuv/libuv_1.36.0.bb                     |  3 +-
 meta-oe/recipes-support/enca/enca_1.9.bb      |  7 +--
 ...{openldap_2.4.50.bb => openldap_2.4.57.bb} |  6 +-
 .../python/python-grpcio-tools.inc            |  2 +-
 .../python3-urllib3/CVE-2020-7212.patch       | 55 +++++++++++++++++++
 .../python/python3-urllib3_1.25.7.bb          |  2 +
 11 files changed, 112 insertions(+), 18 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libuv/libuv/CVE-2020-8252.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.50.bb => openldap_2.4.57.bb} (97%)
 create mode 100644 meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch

-- 
2.17.1

