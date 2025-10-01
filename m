Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF38CCD183
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 09:36:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.12437.1759309033670688067
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 01:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VsnDqIcU;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-414f48bd785so3882900f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 01:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759309032; x=1759913832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJYiOskZ3zxlBjkyE4n5bVT1kjaFpfwlR+D9zMqMFms=;
        b=VsnDqIcUVOTB4CFVCMbUrwp944kkDpMen9pDspmRVoEf8QjLSLEmH9sOk2A0wAEm1I
         FuC2Xp+seNp7QgIOhwzqYvNtO5toXSfgZB7H1HVTde5QhMwZtocb2aWb6T+DURB34o+E
         SFn5Z5V1uEnet9dmhXFRBgit2Tb4Fkhhke3Z3gNDEeRclWhq8gysIZKKpkXoYs1ifL4y
         Mpgz5Z7TQ5MCCLtTQqU/4D61FUf5BGU6QpUE3yXNDgrjou26pT/uka5wEJj41CCJYYYC
         7peDD1Pde2ibyM+mwwWW1UK11jrkV4zjSF4FWQIgoBZFASv2WAnLST2GijM7tH/ZjbTM
         4/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309032; x=1759913832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJYiOskZ3zxlBjkyE4n5bVT1kjaFpfwlR+D9zMqMFms=;
        b=e2QnQwPWfgYRDCXsRuHEqhT2p30KksfFhf2OWDmerDy2k1h0AV1m4a46lXgE42sLUq
         ga72jzmoghgq47vMDNOdirnVO72qyYwr/kC2tAgKPJE1qTvRHelVpCuroB3x91xW38KW
         teG0rb1UG8zwwL5RIj6NCI2FtPDcXpP3BG4z5S3UQhZ+movK4iyn8SbkCnE6p2K7wwqr
         Ewrnq9gq7j7vgQe3dNdeqzHNniySNxR3qz0eL+ECj8LcFG0yHJZmwf1viGJSbyRD/RvK
         LNRaokeGwuFlYvy4gHY+inCW/ljG+d16OFNhvzcr0c9TNTJuZ0srKESamKQ5FK8pXSNX
         Gx0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFa3ZReDq3CHPTnZKw2fBkclX7Exr4ZzE/cRQXu+d5gaBbgr2Aek4ew5om0pUciwOqAuLomDa7v5irifHei/nSNdg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxXbC6EWzsnvBQxy5qNqkrvUA3u9YTS/MkxrlBnJMtNBhhnCGwk
	M5BLqRTgOMT+gAMCWXs330LfMW+r/E/ehOkoz9hW39q4nkme8F77eXWd7WJsRhF3
X-Gm-Gg: ASbGncs7PL/QR+z+pdoiBwSiJmKrYFfpY+C9hj8K4HZAxUHOHZx9ODvjHwqcjaMVSpZ
	3m50Yaf+4SW7mVrdolWWmwtLGeMDfEHCo1bme7FXY1qh/47ClLBr4jHLPS/jsxBeZJZRMkzfK5W
	5wboOeRcYFTnGkEkwywCIPWyFzSH8YmseAbv/CgkJScuTJucpKfaWfQ+vlYfIzkqzmQwPhnRDTA
	UImpheRqaGVtKus7WdjZZk32UKwpBsTiUq2M34QRqDf1H8PqOM3iGNYkpcpIL0nMDb1TLKAAAZY
	kGjrJQaLdoR450rFhJ9rUaoNGMY+CQsfG3CQZg3j5jfwrp+gU90P2XcdYAgylLHOWwCzPwb9bVa
	+PRw0DL18xQWYTiJY46NuuxTAQtfWyD/cyXpQjBM1SqaxJdgurAiYeGp6mxKRg0tlrAH83Ho+SK
	5dM4Wno772/4nWntYq8G2tFudKxNt25U4L6L4uvjD8TtZbsA==
X-Google-Smtp-Source: AGHT+IG6bhxQP/VzWHMR5TePQ+IZZVnjx0vHD5yuyFssMqnFHtO5mcKlEq22ZUgPEroCGEJ55SuzTw==
X-Received: by 2002:a5d:5f50:0:b0:3d4:15a2:11e9 with SMTP id ffacd0b85a97d-42557820d36mr1996904f8f.61.1759309031779;
        Wed, 01 Oct 2025 01:57:11 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6199fb54sm29410885e9.9.2025.10.01.01.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:57:11 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: ivitro@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: Joao Lima <joao.lima@hbkworld.com>,
	raj.khem@gmail.com
Subject: [meta-oe][PATCH 0/3] openocd: Add dmem support and update dependencies
Date: Wed,  1 Oct 2025 09:57:06 +0100
Message-ID: <20251001085707.1746-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120097

From: Joao Lima <joao.lima@hbkworld.com>

This patch series updates OpenOCD to support direct memory access (dmem)
via SWD emulation for Texas Instruments AM64x and J784s4 platforms.

Changes include:
1. Version bumps:
   - openocd: 91bd431 -> 66ea461
   - jimtcl: fcbb449 -> f160866
   - libjaylink: 9aa7a59 -> 0d23921

2. Platform support patches:
   - Add SWD native configuration files for AM64x and J784s4 boards
   - Configure DMEM access parameters in ti_k3.cfg for direct memory operations
   - Set up DAPBUS debugger and emulated AP descriptions

3. Build configuration:
   - Enable dmem adapter driver (--enable-dmem)
   - Enable internal jimtcl (--enable-internal-jimtcl)
   - Add both features to default PACKAGECONFIG

This enables self-hosted debug configurations where OpenOCD runs on one of
the CPUs inside the SoC.

Upstream-Status: Submitted
- http://openocd.zylin.com/#/c/9020/
- http://openocd.zylin.com/#/c/9021/

Joao Lima (3):
  openocd: bump the openocd, jimtcl versions
  openocd: add dmem support to am64xx and j784s4 platforms
  openocd: enable dmem and jimtcl

 ...wd_native.cfg-Add-support-for-direct.patch | 77 +++++++++++++++++++
 ....cfg-Add-support-for-direct-memory-a.patch | 65 ++++++++++++++++
 .../recipes-devtools/openocd/openocd_git.bb   | 13 +++-
 3 files changed, 151 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch


