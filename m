Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B32CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 11:10:23 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.15755.1759834923115757842
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 04:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L/xJQhB3;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: joao.raul.434@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-36a6a397477so61050261fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759834921; x=1760439721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rUqbX1t0RiWtFd2YdHObtfov6jfWzhkqAKzR1JFdN8I=;
        b=L/xJQhB3XhgsU2ZYeevoNL4uhk5u2EMKtzGLMYd4XpRiXo47pxHQ/j8AUN++bkr/y8
         BF5XpR+U47bnX/wSen54//2Apr8Y2i8sCM0PSW/BZsGSpvClD4SF1D/ZEfOKU599d+eP
         qpP0jbqtp6dRhmb6/RofbuR8osCY7YP4iJprRZYOoQSRyfysrVltRyM4EH6Kx4JM9LMM
         dBLQXrGjcvQHM+KLv3Axdig0KDSnEgby1e9Em1Hg9OP3wAFK6oYNSBS7w/kp1gY2c9zY
         TInd9xt6JM3jPmL9VVRELoQPmcU9RMZUzG53YcVV1a8VOafaIkLQ3GCVOpD2896IYjEL
         vyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759834921; x=1760439721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUqbX1t0RiWtFd2YdHObtfov6jfWzhkqAKzR1JFdN8I=;
        b=rNJNF57Xn4tp3IKnkNuFwENTebfZj6O/Nqu6I6mVkxr+piC3sy+CGtHWLw9gz7IED1
         vF1qWQQDt7H/LGtTWoZKLX9aURY08rXtbq9/DTF8XUEME9DNXIay4OuwQs4TNs8Kxc2s
         LARWQpppnAO3xJcVZ0oUYVQzTFJOklKwfopNRc97o9/bJHkv8t6TH2Q+KfQSr6mzHjib
         zR4f49dTW50n4eZk0p5ytnZKyJGbsxQc+JMNCsNAQppYuGLPSKR+N/6ADxmRDAoAmF6j
         VY07S+QbfNoWtEx/v1KjZ5+hMg7p+Vvhr+fUXdrG/LfRHF0kZ0HVZrc3wTeFF+pvesx3
         huOg==
X-Gm-Message-State: AOJu0YzcMfg61alooRS0/fx0OL8Fjs+KpyAOku/RmQANusks/XeaoQ2y
	2NaefaP3GTIM+SwfDE9lk7CEYEX15pjTL7fH9nrQXfTZBzVERW4/BMOsRhuhnCMQZmE=
X-Gm-Gg: ASbGncsUDpqI5SYU4SsJIRAng/vYpi3IIl+utija6B1JMFb+e+BG6kEkZMVsKf6bFxg
	qCSEjwBAFmDkgkhF+bOIiXdo+J8gsrKvw6S+hkYDIacOsCEGjd4qsqN7oRkYfUtE6OwdbJ/pKty
	3L6r8f3JNFhh1X7CMNQsBHlQMrqoHNrajvAyQppxJV9vb8cR/eoD6z/yAJCLmxSNu6cBjGrxKCX
	RFQtTA9ahyXdkrWLW8DbIq6F8H3tTuRZSrTR/TCWaHIPG/m0OkZtWmpA7vp7UyZABu1W93i2ME7
	0GWuM5Yegg8ET7u3B1HWn0ITuOAIK+gZwxrZEyoRBZdl1CqDPc71sj2/x5iSKkMbjO/hJgwgPau
	OJ+x4NMfP7j59eODnZm8h31hPNfCoa4Wh7JrM3rcrzhkAokLluw86p0wnODNsYf0ww7OIJFa9ns
	sd0kI1P1m2YDkN0gxL452Z1eGH4VD4nDpdGBZ/O7DJ2yoe3g==
X-Google-Smtp-Source: AGHT+IEvSRpzmShuFsYUYujfD3jY1HBGhA8ZJtaW0gaHhbyNJUxI3LaPRNwzH7tOqpwuiDqBM4Pprw==
X-Received: by 2002:a05:600c:4ec6:b0:46e:1a14:a81b with SMTP id 5b1f17b1804b1-46e7115b667mr110900345e9.36.1759834441489;
        Tue, 07 Oct 2025 03:54:01 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723593d8sm225159795e9.11.2025.10.07.03.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 03:54:01 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: joao.lima@hbkworld.com,
	ivitro@gmail.com,
	joao.raul.434@gmail.com
Subject: [meta-oe][PATCH v2 0/3] Add SWD and dmem support for AM64x and J784s4 in OpenOCD
Date: Tue,  7 Oct 2025 11:53:46 +0100
Message-ID: <20251007105350.1237-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 11:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120335

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

Joao Lima (3):
  openocd: bump the openocd, jimtcl versions
  openocd: add dmem support to am64xx and j784s4 platforms
  openocd: add fallback repository mirror

 ...wd_native.cfg-Add-support-for-direct.patch | 77 +++++++++++++++++++
 ....cfg-Add-support-for-direct-memory-a.patch | 65 ++++++++++++++++
 .../recipes-devtools/openocd/openocd_git.bb   | 12 ++-
 3 files changed, 151 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch


