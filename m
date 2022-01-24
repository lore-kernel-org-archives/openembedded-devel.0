Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52F6C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 18:33:41 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.958.1643049220737036851
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TC7CN3Z1;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so21254314pjj.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0RkNO+l28cBLSW3r4t/vGK0o61bYujHTcWucqsLsLqQ=;
        b=TC7CN3Z1KnT0LwHtGPt/XegzQaSCeGyB7/LMAQZ3dyti9wBL59gY4sNJrKu30TeCkU
         7EM/HGDvWFyRIxUYxAE5eJzvfssufjH+O+iih2ZlUyLZmJSdmgS9omQTCxZ4fvQr5lZQ
         sBX1FLAnU3GBQpwP/3IgzBKkHE0ZPDPGOWEZq3/BU6Vt9pGkh5E8CD1Cfs/zeCzyQ+2C
         83r3SNJtHL+p9LYRxw6AKwek/2OTZtnh5jJ28xcxIwljWlaK4hrb5TMun/y/x4FqnS1j
         /26YO1oVEGSe7fgaXxLq+2zk/fB5MqPQgQH/w5DtMvP/8pqU46OMOsSVkDa4pxBzBE8U
         8tlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0RkNO+l28cBLSW3r4t/vGK0o61bYujHTcWucqsLsLqQ=;
        b=zUL7BqZz+dAuUZgy15cra8veDB52M+JUzOHuTcfnXp0ZDZHHN/f1AprrujQ5GlonCy
         I94jUcim6rdHjfBtjydL6+Xg5EQC9pbR9IX0Sp7PqU7nonTWfrdJZ5lNmDz00Z7xH/s+
         bBQHxv8R2RNj0HnCpgMHitPWwOFv4dQD26hN09Iade26KkNBdF6aiTz1Yb1yrVqxRlQc
         W+qVlCNCTJb9sufShAOtqJoG4oJuvqHGI+Yu031z3oeLnDSAhGkEwocP9oKqfELxUOLc
         49G5PN4yTuTP0JdjVcoyk5TRUJ6QkghLQpr5orZIyU61j24g1LwI02gxfz2MXxP6ec0o
         bmRw==
X-Gm-Message-State: AOAM532qtTz5ZmZOCMz0FqVra4IiHEFMhnHl1mCQWAq4XPw7A6EqCVL7
	uUqSb7l/GSofX9/j0LUzG9wJopa1viJoDg==
X-Google-Smtp-Source: 
 ABdhPJwHjiZYH4YsdqboUFkHoXTQG8EQ5tfj10bmR7I7Wc5Tc6LUq0ELwkVqK8qv20I1rcuiJlBdAw==
X-Received: by 2002:a17:902:9001:b0:149:f2ae:6491 with SMTP id
 a1-20020a170902900100b00149f2ae6491mr15649459plp.39.1643049219917;
        Mon, 24 Jan 2022 10:33:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 l23sm12960320pgj.20.2022.01.24.10.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 10:33:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] iotop: Disable LTO with clang/rv64
Date: Mon, 24 Jan 2022 10:33:37 -0800
Message-Id: <20220124183337.2773373-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 18:33:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95045

LTO with clang does not configure correctly yet with meta-clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/iotop/iotop_1.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/iotop/iotop_1.20.bb b/meta-oe/recipes-extended/iotop/iotop_1.20.bb
index b05c8cd35d..a044c9b248 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.20.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.20.bb
@@ -11,6 +11,8 @@ UPSTREAM_CHECK_URI = "https://github.com/Tomas-M/iotop/releases"
 inherit pkgconfig
 
 EXTRA_OEMAKE = "V=1 STRIP=true"
+# Fixes llvm-bc70b5.o: can't link soft-float modules with double-float modules
+EXTRA_OEMAKE:append:toolchain-clang:riscv64 = " NO_FLTO=1"
 
 # Workaround BFD linker crash with clang on arm
 # revisit when upgrading binutils and see if its fixed
-- 
2.34.1


