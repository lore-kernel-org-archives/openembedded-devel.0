Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C740FCCD18C
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 17:43:18 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.6496.1760031141050455594
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 10:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fZZQmhmt;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: joao.raul.434@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-36453927ffaso10034331fa.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 10:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760031139; x=1760635939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SlviUnSO2pTx7FFEhjoX5NYLn4uHoKQGJuJYkp8OyKA=;
        b=fZZQmhmt+jvAwbAJ+N2ToAtf3VlPynSeNOpRNRZWk0DD315fYgd2Q04N9oSxXbHMmK
         ZVVrFQhLXSuASK1CwFblhsU1gtEa7WXOBMQPXfzDen+/R++DFEcLWvjKfdKtPxPPnNgc
         d9RE8y4hffJF+Tr/ws43ip6PS5OFCkr2UwiA/tRmC6UTIIsDqlngidfmJ79r6XhWPhE5
         VGvEfl9fAUpsK4s+V5hL5VxvbKhYidr1amNGVIjhxsKPRX8JL4thoq6xQC9t/+L4Ki0T
         p5Cr3oTBG1vdzE9hXgccjDU06jLegrHqzxpXymu0+7pjhIY0wzEpWOYvOqNzB6VQInM2
         I/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760031139; x=1760635939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlviUnSO2pTx7FFEhjoX5NYLn4uHoKQGJuJYkp8OyKA=;
        b=fsnuYcL4SNCePfuvi+VrC0f+QrQMyhErjYDPNfs0djAs27iZ03Fxy/qZVYaj53i2uh
         cS+uGdY58t5MQhBOeWebSuXMwIsQ+mDBO8Jn0rQkzO07crlivdgLPdy0NhECaOzK12iz
         jlk4CqumGrvwekIwi4bC+EZ0R7j/bLxs2kXHEbP/NCAjtoRqHYGLJC5sjmXIKNW9pYiv
         tJQroDXHhPNWk2F9nvRYPl+fiOu+s7ol10GWGbHgL5cAPNNZlL0YoABDFaFhDMtoBhdj
         2qKWCEku9enIhdzQraHHeE9di8CWCis2vTP9csPLhIuRdQMkjN/wFF0lx7O+lQYJQXUk
         l5zQ==
X-Gm-Message-State: AOJu0YzN6FZm9G1wGsNILwP2HGD75kTPGZ6Oy6/QYsGMzaQStTVnHcLp
	4WZSc0UWZBeReHwR1jvudtJUM05gKVUPoTVMZnjkZx62j/eWrBo/3yXXlMvR+w==
X-Gm-Gg: ASbGncvSCDUUMWob/lBtjzn4VKVcLh5hq+TKW+LQZuEqZmLBfpnEeFaZAHhG+9m89wP
	PVPGtTpKzcbER1Wk34KafJ4S7PLofQdMg4ij4vnvk+e/shoiKVzh1Js6m4HVw33eQb2CqzeYGVv
	TBnS4CphAms2T5zmvyBVpDxh0BEaCFL16eEqV/fxuLik8p9OFdQrsxSocnseCJgtsUu9tdcqAWK
	FxpFjkmrMt/IVItm1ZDje87rCXcSvcyZf2J0AAEP5RtLZLoDL4lc28iU0zm57dXYpz0Rc8IGtkD
	0PMoGjtBmDA1w2ezF3eLs5ukCvD1WFFRescMXtNv3yHc1deRa8zYFoYUSmL+/xomkC+FDy37oP7
	rf8v7HakNoAFQdwboyvuYWcGldQVU2fUMh6qDifJyut1F7nF9DqypiwqxYjTzSVsReZRdUpg+Wm
	gzIBdRuKcQcA3xCAvsrwJ57zhc9TaeuLL54qbLI+9b+HBjXg==
X-Google-Smtp-Source: AGHT+IH527wQ1nQ9x5DDqx58EuIzgSYnewtE8jE36H/tVXtf0NdO9FDJTHvDDLq1qPfVnmtsOEyEAQ==
X-Received: by 2002:a05:6000:2905:b0:3d1:8d1e:8e9 with SMTP id ffacd0b85a97d-4266e8d8ce2mr5396864f8f.32.1760030676624;
        Thu, 09 Oct 2025 10:24:36 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582581sm51681f8f.13.2025.10.09.10.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 10:24:36 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: joao.lima@hbkworld.com,
	joao.raul.434@gmail.com
Subject: [meta-oe][PATCH v3 0/3] Add SWD and dmem support for AM64x and J784s4 in OpenOCD
Date: Thu,  9 Oct 2025 18:23:42 +0100
Message-ID: <20251009172345.1026-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 17:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120439

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

3. Add fallback mirror for repository:
   - Append MIRRORS with reference to github mirror

v1 -> v2
   - Add a fallback repository mirror

v2 -> v3
   - Fix Version bumps patch
   - Add extra configuration option to enable jimtcl

Joao Lima (3):
  openocd: bump the openocd, jimtcl versions
  openocd: add dmem support to am64xx and j784s4 platforms
  openocd: add fallback repository mirror

 ...wd_native.cfg-Add-support-for-direct.patch | 77 +++++++++++++++++++
 ....cfg-Add-support-for-direct-memory-a.patch | 65 ++++++++++++++++
 .../recipes-devtools/openocd/openocd_git.bb   | 15 ++--
 3 files changed, 152 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch


