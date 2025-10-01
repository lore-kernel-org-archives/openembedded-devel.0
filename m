Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580ADCCA472
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:03:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.16779.1759323385671241574
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 05:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L9ANzUPm;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e29d65728so49209235e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 05:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759323384; x=1759928184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJYiOskZ3zxlBjkyE4n5bVT1kjaFpfwlR+D9zMqMFms=;
        b=L9ANzUPmoUtOuNY/Z2L8qkbIKtw/1XMnIYMuAvBVMMfZQfnenfPmSxHZjl8yjBgS8a
         VQgMXKxuQvVdUMZH63B8dj8rVlStGfpKrCBNVrNjL2R82cv3K3BttNLi254R7Klcb3Y1
         m/PxoroZhm7kby/vzg6YzvnJ8W8FdydwXoJOEpqqbqRCZpFTqj49GBLH+EbEMhlgO7DF
         hfvVjP++72r24Dc+3RAjE9i4CVlkCJUyIiWt80SO9BskVoPzte211Z+lKlscEtk79L8f
         Iu6be99/SAtAJ8Dspxlx4iG8wXGocJYfd0Nx6ODx3gKwMRAUBw6HmhJtLWvcYjdo56iH
         0YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759323384; x=1759928184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJYiOskZ3zxlBjkyE4n5bVT1kjaFpfwlR+D9zMqMFms=;
        b=h6g4KWEt/ou+KNlYizPWZT/qHaN6nGspZYVFND8PDUhmR0ftbo/p81G/D4sZStNB1t
         9HPSgJk7JdlMARlSR/VFzaWQDHXAfUSAY2jwKL7t/+x+W65hSDR1ELkyWCXAm1UBw14d
         qLeuIZ6qllvq9snN3T5fc1kY4j0C2SLPTj3uj+TP4IvtoqWdBmLGjGgAt/PoJXzBavFa
         huwlGU7KLFKw/vXAi6UzMicCbucnLJY0WskHbCAdxBiIab1lKSYWFiUOQFzTISYtkCiI
         8bovuUkFrkPqueK+eBKVlSc0jTdknbgNIiY2jpitKdO8av+M7slbn5+0biiKGX3fllUy
         fztw==
X-Forwarded-Encrypted: i=1; AJvYcCXB1KrtSY2AAtehHNE/yD8Ua81Wl2GRR7n8vPQeVvuvguVQxtxji2eM+kUWvApnGjXPhBIGCHJHtQHDoMkuQqSjzRQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywnd7R4YDJVBu7PxaKsrSF0ZwW4Gt5G45pnak3nDM7fxgJdTHrd
	t+97Y/q3mYKpbh4V+xsS7hwdn+TGXJr7uKBZsx90XyWSKMgsv46nEJcQ
X-Gm-Gg: ASbGncsNZxtmc79Ix+5yRMVtZVuLxzF+HIdGRX6svr7Lz5lZlQkSfjUoNMVgEGivtm1
	sGrLqeiwBL8SmQHx/WZc+7vM9YuHbGmyXCKu+P9PrUwswZBI85V8aP6JVvmFsRDRppeCVvoVEn4
	eoxjXZ0VbZLBE7JhrGMs5nM8TKhRH1b76MLvVgvEGRpwYlgcu8CUOFeZCHuZeR+MAo4ebMrPr/m
	y+apMp5+tFnhGyPn0KTx7ZMtzKYpg+uX6piF8FVYrfyPzZusVfJ9thMUZkPrPhL5qBXVqoTepyN
	L/IaFJ6IU+zfimu3m5dE1R9pklndJTt6QzXhwcpLqK2SHXAlbAwfAA3dNnnJSVu8OpRIPPsc6Bq
	tkdOQVrHnGNjjCPiluI3TgzJ3CXwbLAA8m7e4PEbxldctJ6xoURI7W+Beoj1Ms9QmjxafftAjJM
	v84WsGkXnngm2ZUSEGUYVxrwfjFjVW8hUAe6pvpbGL1gDBqg==
X-Google-Smtp-Source: AGHT+IFKRRH8lQkZ1dgqXBmtNDHxDmq25FxzuHcLx6jGYFZd+m4sEHImUMbLS+yMknDVz759muLgfQ==
X-Received: by 2002:a05:600c:3b08:b0:46e:4704:b01e with SMTP id 5b1f17b1804b1-46e612652d1mr33783165e9.8.1759323383814;
        Wed, 01 Oct 2025 05:56:23 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a020a3sm38780345e9.10.2025.10.01.05.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 05:56:23 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: joao.lima@hbkworld.com,
	openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][PATCH 0/3] openocd: Add dmem support and update dependencies
Date: Wed,  1 Oct 2025 13:55:51 +0100
Message-ID: <20251001125551.998-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120103

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


