Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E3BC0218D
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 12:27:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.16260.1738067262173951289
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jan 2025 04:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=VJI58nl1;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385deda28b3so3852157f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 04:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738067260; x=1738672060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NOj35AJIZ9B3PY28m9m2RB6eHXN3S7XAK03ns9cDLCA=;
        b=VJI58nl1b9sAr+0kVVdPL3soUDsZczO0FMQKo9xlIXpQJsU5YdBQw21CNe/9jjdQy6
         hQ4uIpuuHPS7AvMy2RLQzv6boDWpTre6fBJLCOQ43YkEcKBC42CQpBO1Ab+3z0WfBzxz
         Ye2sUZm8XHcVUFGJifQ4Ye/292KqIgUX5pjsOomyIRL4XPJdvlWF+0aLMr0QFWZIST/N
         Ij/KZrDoOmx89a+XmyThCFukbHs5X8AACGD2QfZ21/YLxgAvsJZwdZSrQPRVGWBr8gTM
         JPzT61j2Hk/X12nW2SDR9lIF+9tL/MfA4fQKPPVa0OqwkyHsv9hXm6ryygM9YD83QDN2
         3lnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738067260; x=1738672060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOj35AJIZ9B3PY28m9m2RB6eHXN3S7XAK03ns9cDLCA=;
        b=mNRwLIY0DmQHv//nHpFNngDmOaYhaLlvEVF6A9IQ0ofR4kQUzUum8dDdWWlkiGNYFc
         wd84V2an7wAs9eys7cR0Nl2Y3s7WvMsxZsr0wgH2WuBM7yow8jBN54EITWNNihj0rpHo
         y8M6yynXLmgJK2MR+CRKXsvRgfPR/97mFZwKMCRwU/E/0D/WBwgr/xo+buOuMuV0cJ1G
         LtBKhRKVfI6NUfw1u1SzqiJ53uYo6G/PfgOQzQLbw3TCDDNlbPGgsfjhWrZWw84PfDV3
         scSXogNWeHCtHPqkC5SyaK/Kd8qRNgT2FH5b4jjj6+6IWyQXSMJyB2PVAQWWinRVpSQ5
         asRg==
X-Forwarded-Encrypted: i=1; AJvYcCW5eZhMeDhzlQWX19dqy6+zIdbNk91vjAuKM0jNRyvu3dMvaLyNLplHq5oOTpYFd/T80odgH7egfvLB1AifRX2FVDU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+K+N1BB8oAX7sBSKX6RYvZR1ZmzhxiLqSgFtLS7ltu/wIebrN
	qVyt/BK2LBbTR3wB+0ZHDJ0lhksVNMA7n/r5T9wYBNely3HMdX2+dc30FJTZ3DU=
X-Gm-Gg: ASbGncsJvfSmmaSxbAyoVdgDMTzXmpVhifDejxkO+Tb3rzWoz0FMmXiiG7lrtsZAsHd
	TSP76FS6FJ9YLAcAMUQv0jSFoHaHiyUPcFjTA6MvpOIRSyrROStXqJPF1c0yTSbSeG5Z4KG2gDz
	x4CTVdtVOaPCwkk0aJC/xfJCfAAQ2MDa5NppxLCkmTsYqbbOGV7iRob9LbJe3zEwmPoG7ZoD133
	vcVVk94AGaJjMzVdPwDC9MztWk8ym64/7qfwkaR1PXg2WJNViIeJL388Lnh7o1hL8+dXEkqDnXp
	5zHOLcteZcEoB28=
X-Google-Smtp-Source: AGHT+IFeArFPC80V/blj86oBhk946qGQtpL1KapGz1LvrUgCS1M2igy4eIPu8BTe9lh80bKiZFJcmg==
X-Received: by 2002:a05:6000:1788:b0:385:ea2b:12cc with SMTP id ffacd0b85a97d-38bf56628e4mr41069639f8f.13.1738067260429;
        Tue, 28 Jan 2025 04:27:40 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9138:73f8:bd73:cdf9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188a61sm14198547f8f.52.2025.01.28.04.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 04:27:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] libgpiod: unduplicate the EXTRA_OECONF assignment
Date: Tue, 28 Jan 2025 13:27:35 +0100
Message-ID: <20250128122735.55051-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 12:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115117

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We already set EXTRA_OECONF in libgpiod.inc, drop the second assignment.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
index dac7dd36fc..009cf9897a 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
@@ -14,10 +14,6 @@ inherit python3native
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev glib-2.0 catch2"
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 
-# Always build tools - they don't have any additional
-# requirements over the library.
-EXTRA_OECONF = "--enable-tools"
-
 PACKAGES =+ "${PN}-python"
 FILES:${PN}-tools += "${bindir}/gpiofind"
 FILES:${PN}-ptest += " \
-- 
2.45.2


