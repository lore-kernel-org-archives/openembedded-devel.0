Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5675BCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:03:12 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.17049.1759323678398628033
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m254p6dU;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so46322635e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759323677; x=1759928477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=COkvJxOZBBMleoDVDJEs4xIzoIx0N8zpbzaAIKB77fY=;
        b=m254p6dUbsXELQIdhVbAebeuxC1kZAptekZ5X0/P3hTCE8NJnK4in6irn6rJJm657/
         Zoej4CuIPrmLVeIN+XZ1qLY/rBCEcGYl/tcskgciNcMC3ML3JN4gwqBMdlWbgvpnM+2b
         qLEAQGVQD2XTtuRH7wlixaEFOmUeYIoIm2pOqYFYTdcwy1xyYWj+l5Tu6MI8EiU4lKuU
         xcsoJMseYanoAGmyY+MbP3UI0o43AEmhYSe8dabZ6hQdWC9eDJLLDL+aWucOyieqIOP2
         RVvrVT3BJ+s3b4oHRjSYzBXeF7uRGH7S0sC0fKWnM6lee27H2Qm80kKzELn2MulIdvgA
         +NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759323677; x=1759928477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COkvJxOZBBMleoDVDJEs4xIzoIx0N8zpbzaAIKB77fY=;
        b=WEGkKsx7bcAF7VgPTtsFMskcukvRpV0dyl8r3LxF730Edk0Y7179dKenn7Vs2kPQaL
         nBT+Ddl2QXSErFqXglZOjwGPEs1mqiBI8aMYS723G7Yk6qzOxV6doBKncdfYQ0E+e5dj
         8pR14amSGDtuZApaVxUOGaVZcoJmx+qlAtJhjlNy5d2RZcm7gGlMqsZqQ521YBFSy/ZS
         TCLvBzkPLzCuztrZSabx7nAriM+oXVwLaq5+CWoy532svUFXnhu84m8hwmQO/jwsEx4Y
         j8cxal3RNNMzpURHYovqHjoAeqAaoMGtA8w5wUty1KoAuENnw6GdJZjHScNcLvxZYUQr
         uWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7lPLKOXYMEeil1mOL0qbPmTGoJc9wYXyAf8+Oi7ucxk9eVEZSpp7rAz3+XTo9AlFZNOpprDDM1e4+rf5cJ5e46XQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyBVFgwmBDuId/3p3SKNve1zQ4RvrLhlN94NLZmTzE1LywXB8c2
	OaGZu3okVxZ4/cW2+0XUMZEYT4fAqbVEWjnU40x7LI6VeAcb3CMUJplt
X-Gm-Gg: ASbGnctRZJvyOWF6sUJvP2S4BrgpKcoh7E5WEHAuYA9XfVIQ+igVW9hBr64y5iChBpB
	A4uEhL3Po1KKZNCvI+z0/TUsyyfzRlTcwkRqf/N93WJGI30LNN1NIbbbjEh8RrMB2MQzntXD1QT
	NMPF2Sw8ni3mJjOmfMDznhNL71sUHso38RB1kovC7InI8R4EVYTRfBOCsltpkzngAJCr4WPOXRC
	dMyjtDZzx4kK+lTQSMHgFl7OosCzfI/h4V939fS/pzhY5I+8VFXSwdu6va9TZv2flxhOqMDhC0x
	CAliA7B7bgKtb93u4PS4YBuMc1oZe5a33z+FpeKNGzs0N2Kq1BHb/F8dUdiZCuJ7ccp4RxFqUIn
	PwUm4L1rLXd5vVN1zMMFQEY79XDL9jB/xcKLWGhcgs++Tn5lVtx+VupvQYFM3ON/jLtMX6lvmXi
	KCnQHHx1x9PxdKySwtG6iFxoZQ/B8haz9zl9D0xW/bN2qssg==
X-Google-Smtp-Source: AGHT+IEaVY/FvNv+gd/5MP9u36fHMTDt2JZ3Y65MQu78PG2ZcN9z3EkikNr6xI35dOIYbpiiGYicxg==
X-Received: by 2002:a05:6000:288d:b0:3e9:a1cb:ea93 with SMTP id ffacd0b85a97d-425577f35d2mr2538886f8f.21.1759323676334;
        Wed, 01 Oct 2025 06:01:16 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fbb27sm26660994f8f.4.2025.10.01.06.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:01:15 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: joao.lima@hbkworld.com,
	openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][PATCH 1/3] openocd: bump the openocd, jimtcl versions
Date: Wed,  1 Oct 2025 14:01:08 +0100
Message-ID: <20251001130108.78-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120104

From: Joao Lima <joao.lima@hbkworld.com>

Version bumps:
   - openocd: 91bd431 -> 66ea461
   - jimtcl: fcbb449 -> f160866
   - libjaylink: 9aa7a59 -> 0d23921

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 559fe29ff8..2c07273940 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -12,10 +12,10 @@ SRC_URI = " \
 "
 
 SRCREV_FORMAT = "openocd"
-SRCREV_openocd = "91bd4313444c5a949ce49d88ab487608df7d6c37"
+SRCREV_openocd = "66ea461846a3a4a96687c9287c3f61ae8ce0b775"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
-SRCREV_jimtcl = "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
-SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
+SRCREV_jimtcl = "f160866171457474f7c4d6ccda70f9b77524407e"
+SRCREV_libjaylink = "0d23921a05d5d427332a142d154c213d0c306eb1"
 
 PV = "0.12+git"
 S = "${WORKDIR}/git"

