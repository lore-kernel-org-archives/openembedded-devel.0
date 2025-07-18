Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5F2C83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 14:00:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.21748.1752847202258340921
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jul 2025 07:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kW94SjaC;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45629702e52so9221945e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752847200; x=1753452000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IUwfeTFlUe+iBAGxJJnoBHoc2nkktL71+zYCsH2Csc0=;
        b=kW94SjaCeTaCggdqsmFl44MLENn/R89lZLwIHGhUowEngWFahxs4DiNbAdrNJaIWwB
         Tu6n6s/GR+ZPeHf34iWIGjRqRPR9z7fIDARJ3RrJqEdMBK3mBrHecM8G4vkWZV8SrO4P
         4sJqgzOPrHE0ciISzi7o1QR3lWiR4mllUFmfvZJY0LKfM1BiuSuayYuk7teHN5Otiwaw
         /wTR7ElKYRileImVcQhF0tUgnH6WZdlhlauuSCj4fDKETfkuw5H1MhMvWWbruAJnh8Gn
         JtOm1mvs89Eenj6vhLKfrSm6GwnU2bFwbcHxxaYS2SvRoAfpaxEbG6Xk6MAbFxx4mlVH
         Zfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752847200; x=1753452000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUwfeTFlUe+iBAGxJJnoBHoc2nkktL71+zYCsH2Csc0=;
        b=Rb02N8K5vHVHJhLUxavxaWSEEiJLYLqVODne8f4cKZlZ75qfvI4hu6sRVwufjI9v8D
         CLiNH6VaKADHej5GPKOu22rIX11PaV5qtCuGhMZvFWdGPIGoxmBaCqKBnJqJQYEbW4vc
         nHV2GKSlyR/zCEftmhGeyGJMzB+YfUORWNtS/ggWnqboE+HQcC8/7jpzq+CCr9t2BzFm
         gAsQ4zc/5iDBotZVrLTgRnDeE2MtVGh+XAhoZEi5qJDg3qOlcLe0pnptbMGUWNRy0Wn2
         8j96+T3VMkv9JkTCJlUCn4+maWAJyBOc8iN39qTj/M6+MJjY/OAETYBrlO7VAsLO7fMh
         6tkQ==
X-Gm-Message-State: AOJu0YyQ68GDHfTxs6iWrDfiAG6tpAqmiv+2BYcWx7xAVQMADxGk2Ape
	WJk35ZAWHULn9Qpdkcb2hkbrlhRuz/HwLIxSOlcCngpmLQQdTWPUGasi5qUyCA==
X-Gm-Gg: ASbGncvfG/B9AR90KKbDlT+yscEScJFyR2tmqQ23kDcKP2bYQ7bsddkvefmDjV95GuB
	4hZVPwwYoGqghixUWupDxJL5F4291DLRbWjOM5O5Gf4uv7iTKpiD2zBmTtJ262QmTwqh3FjSuX7
	gX/7v8nHtDVjh2a8q8R/sdio3PViwexqLEW5qDvjQIkRAqGWCPTMzoI3PbOxeBm+7k/FhccNG4N
	tkR3WCP2YSNtUc4gD7E1viOjcTCpxHNADiqUIFADfNClwiW2p7jPzkrYlZSKj/9uktoJlrlt4kD
	uwUlPg9R9249v4s3W3lkUFgUatyhtq8v9KEUZ0criSGLNQEvP9PkCMWq3cy/7PHGp3fpGStVVtp
	uGMNz27JyubZh9w12gQcCRbyvL9MFyfi0ZDS+XSygfFXF+Mc=
X-Google-Smtp-Source: AGHT+IEwRZxET3UWPwqV4GKemVw4GCh4Knyxxq2p/aAjatoAGYDfokIVRkCn00NJhficI+kmHyzgfg==
X-Received: by 2002:a05:600c:4e12:b0:456:1bca:7faf with SMTP id 5b1f17b1804b1-4562e36c73fmr124862595e9.16.1752847199870;
        Fri, 18 Jul 2025 06:59:59 -0700 (PDT)
Received: from Unimatrix04-Noble.. ([2a02:b021:13:4f8f:f2b7:ff12:51c1:8a80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562eb63551sm79122835e9.24.2025.07.18.06.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 06:59:59 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: Upgrade to 7.1.12
Date: Fri, 18 Jul 2025 15:59:53 +0200
Message-ID: <20250718135953.180593-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 14:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118626

From: Gianfranco Costamagna <locutusofborg@debian.org>

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_7.1.8.bb => vboxguestdrivers_7.1.12.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.1.8.bb => vboxguestdrivers_7.1.12.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.8.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.12.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.8.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.12.bb
index dbfa454f13..e80f44833b 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.8.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.12.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://0001-fix-bool-reserved-word-error-in-gcc-15.patch \
 "
 
-SRC_URI[sha256sum] = "3f7132c55ac6c5f50585bfaa115d29e30b47ccf535cb0a12ff50214ddae2f63d"
+SRC_URI[sha256sum] = "6f9618f39168898134975f51df7c2d6d5129c0aa82b6ae11cf47f920c70df276"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-- 
2.43.0


