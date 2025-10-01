Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECD5CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 09:36:11 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.12460.1759309299722804098
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 02:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZMMCPFE/;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: joao.raul.434@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so6127746a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 02:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759309298; x=1759914098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJYiOskZ3zxlBjkyE4n5bVT1kjaFpfwlR+D9zMqMFms=;
        b=ZMMCPFE/8vvEjUSvqXujlRBwn+nh1Z0A5cNa637pNjip+BOgsDX4YUFnUVmy87K+gj
         LFK7kMNQ57S5mwjSDaA4JQsuVxD0hEqVh/AbmUjbnr1+3x6HJZ8DoHVJiWdKQFDV1PRO
         HBHqei+cSV1+ZgcRNIx0jngaGeuXtm2IDZbGWknOWgukvAXMZjkx3qg4zfSnqvgAjLUi
         PHG+2ty6hC6iU+oOYIV1OJj9pdRZGrfOzhzxPhjHYKS2ZD8NcKFmDggI60dEs7rpBD5b
         NpFMX/0Bz10b6awokmeIssCmuqFZa7AUXopIAX3VL72d6MmByOAuQzycdFMKQG9pbnvV
         VEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309298; x=1759914098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJYiOskZ3zxlBjkyE4n5bVT1kjaFpfwlR+D9zMqMFms=;
        b=WvD31Mkw2fmx7FSzzA8krspu+C2cq1O4eTvU+JHAMh7grU+jjfUdy+aEvxeBeFESc3
         +VLCOVE2AHT03Z3fKOKwaCvDE0vSTfR8aXBjfON7lgpzw91Fh7NOkEjB/bpaUGT0YNhw
         jYtLqgBtaVlu5A8CfARTFNi63qRz/cZ52UuOh10DsyEo1+W4dXgSx+qcotzyobkUfIiY
         dO6wQ4Z4azvc8HSW766dCqnolE7Z6fxT+B2jfswJ8c8Qi+V9m/uL1Y4tFsSV0IV1DvoR
         fWaxNijZqXNYUywYcOF4Vfe4ZqJwZ9wbl7yD6XxOeZwU3eu+lNGCwFTefse9nWgjcrvk
         pc5w==
X-Forwarded-Encrypted: i=1; AJvYcCW9YXFqL4gZeez1vYXPrflrJ3WCGVm0hgtOeg1nL0gWFnkboJvAweUKJ+/tmmvPMUBKLXAX9Ok0FdUQTlT8vvpJhDk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQwdWL3oIBfEHqbCCBubDENUBUONnKT9t9TiVN4dA/xUPt65Gh
	ytYS/rzEjQD8xIyncvF7cN1gv2aGMpGKGm4wDlQe9NQtPuW78kBst2pd9R8/lG/0
X-Gm-Gg: ASbGncspbjO6JW+wa9haRG6zzb4uWr3ZxRBemnUJe6lPv+OQYGNviStlmA8AnTuEyko
	R+jbOTuD8pmZqBKzzp7G7C8R7LzT4N/GYgGn+CIfawRIwYePXYdfSGJW4RtDsqXrT4hXRh5bXuV
	L0k+EH3/XqkRPRKuTh/PNMBvkdk8cCVgIemR3zH3bX+Usf2ir9kesKe/gaW864SI8XgwFpgxitX
	dsx6t2aA4bkDoo3a+DQnyK7FosUDyKrvCg3BqK36jhnz4aKUqs4YvE0qZOdexwwW3aL+oDjXOdA
	iYUMGIoMlrjDN9XvUIkPVafDu4lRpawnaATS4XQcf5iojX+yH4GX5a/RcnPxKeu/HjGx+qkz23a
	tYL66HIuV/J+zlsDAafMAE0rvW/sj+YVbxFoE2DWUujOY4ZouKP6I8kW4uaTscHt/P57HBL1dok
	rpTl4+wr6eOIaF486DjIRJJkwfYy5kGediT8KP662y5U6rT59x/uuTbchl
X-Google-Smtp-Source: AGHT+IHCl7+YX4gfrtOxxn5XUrU92udpCv/bIB1ayndAHg3i7fN965I7C8x+nlIYJkLgxmL+Qz2EJg==
X-Received: by 2002:a05:600c:45d0:b0:46e:456e:ada5 with SMTP id 5b1f17b1804b1-46e612d3ec2mr22003945e9.28.1759308858819;
        Wed, 01 Oct 2025 01:54:18 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc72b0aeesm26722995f8f.49.2025.10.01.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:54:18 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: randy.macleod@windriver.com,
	tgamblin@baylibre.com,
	joao.lima@hbkworld.com,
	openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][PATCH 0/3] openocd: Add dmem support and update dependencies
Date: Wed,  1 Oct 2025 09:54:10 +0100
Message-ID: <20251001085411.320-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120099

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


