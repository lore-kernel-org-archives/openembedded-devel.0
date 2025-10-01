Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B930ECAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:42:37 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.17133.1759323902784802810
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dAfcm3HY;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso5052014f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759323901; x=1759928701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJYiOskZ3zxlBjkyE4n5bVT1kjaFpfwlR+D9zMqMFms=;
        b=dAfcm3HYSUzz9LmDWNMkzCT0LdfoX9nxFV52O2f7tTypyyyN/wBe+xGLKRf6+WKQTC
         GNfcYpOxp4a2uQBCilQxd34j8lBBRgz8B0ksZsnCF+M1YGQsZW1mJRRxzMSwsy6FpMms
         ElwHl9EPctUvLt7wNWM89W5AiwsmH3HJboFMmay42Zdm77bYbgfmEveA1Rbgi9+7J7oN
         z5LpjaQl8ITyX7XqUlcTFp6JUwvgjoGIthxEIAb8BKxp5+OWy+po9l9aMogc4parP5y6
         0HLZLeGc/Ub14a1wYhEvXTfiLmJOUuEyHLBxE7+ka7DCennA260IQWteYhzoxQu0dAgv
         TO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759323901; x=1759928701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJYiOskZ3zxlBjkyE4n5bVT1kjaFpfwlR+D9zMqMFms=;
        b=bXXva7PX8V9LIiq2QbrxKwwWkRVCt8YG69BJp1Jsh8sCB75YFUlHud3qioD0VKK4yg
         NXBuOmztaMvlivcQbJNR2T1pbnVgxHNpPGWZKpKiQlkjpAQwvPii1JzTPQCTxtaCRgxs
         hKoPzdcn/t6c1JZE/9zy0ItuwHAcftcO+J4hJaamKu/d9TKvNwSWiNJM3x90DuCFOLkP
         f1Q9+ye7yKpS2GIu53pYnHTS9N7tnx0sy2i6fONx8oYBJyYEYf9pMuLYo8awgsuOPTU8
         GMcIIos+RnivAS13wvFBM6lK1m8qorj1wmyiFLZRcAYyxb7kOCQNMtBJoNxbh2kc+GTF
         zleg==
X-Gm-Message-State: AOJu0YwPenCJObUmSHND1JQnpb7oZfuz5xmlCnX9EKZn012Ifa7USkdJ
	/oKryHk5i3m7tF14+8xhqoa2U8997jnVUM120LS0jhKg9RkoTsYbYy8Pe/5uM/1q
X-Gm-Gg: ASbGncszYf7Ap1QRaN5LvqC/2r+eN6m+3KET7rHZbecBuhRgbp2bmfOeqZACIOVxuee
	mNFK5hOu+w6rFKF8ofyDrZONubwP9zy4OgaW10V67enWejxKTIha0yr0ew4HEq4I0jnFwT20Hhs
	8Yu9rghIB4l2qGE5FgNK69ZqtQCA3R6KK8N/SZ3WAum8OiDaJzx15WMkJ6t2Ou3JkCrLCx9rHrE
	2wn9WP1freUU9w2SNx3lV/+Jva2ExJKgvFMF1fKTjIHNhEMvaHTII7S/zP1Lp0tdOnDVYh3LI7h
	vwu93AAG7ardlJ5cqQ/tSCHE8TSvYuMRGLdsN7+NUBgYoDZROJR1unc+DTJ3q1GP0DRVnG6HC3+
	fwbYZMC0wBFXzzHNyLlHd/yOM8L/9KCS8ChxsJ61Fg1i1MaYBjo8lNIWCt19yVSz4vbbvAD6c8C
	X+8ayret9uzEcZGlMZ635FhuDpTLTr/4vEvAMTfWnTWcorcw==
X-Google-Smtp-Source: AGHT+IE9o6vihTPEAhIvfOAZap8sJzcd6F1yVY/rukoly/lfuyNB5tWK2SWBQ0iEU0zYbH6PUHtBxw==
X-Received: by 2002:a05:6000:2408:b0:414:6fe6:8f97 with SMTP id ffacd0b85a97d-42557824f29mr2663069f8f.38.1759323900660;
        Wed, 01 Oct 2025 06:05:00 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb9e1b665sm26971703f8f.27.2025.10.01.06.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:05:00 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	joao.lima@hbkworld.com
Subject: [meta-oe][PATCH 0/3] openocd: Add dmem support and update dependencies
Date: Wed,  1 Oct 2025 14:04:52 +0100
Message-ID: <20251001130452.542-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120109

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


