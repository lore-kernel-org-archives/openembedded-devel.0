Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A470EC83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 20:10:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.51447.1753128604471208658
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 13:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KmnD02m1;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso49830985e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 13:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753128603; x=1753733403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ATzejsxg8eUIlB6/anWm7kdf84tZ3CwGyQ0Iu7HZCc=;
        b=KmnD02m1XZ+xxR8T07gydlAg8wsCYMubyh8ANYhcnVa2xTPWiAb63viiJtNFLCtAcr
         3lAzGkow/1HL6FDDQ0G+ya19K9Gc5phVpkfJR+WeF+22ELReJD4QiefpDLyoU1m3Q+XO
         +NWPYCak/GwIaVnm5ZNC9LPanPapol7is6Xryh4x4HMlgcDo+K9rcsGYW/bmmp6ju+BJ
         WUdfixmmlA16A3GRMdfzB8KKVU/8WAIhtR3pAKWuXOgJT5KQ+p4059bGkSpkWsFGWk3K
         tCrUAyibb7hnyMnpGq+guIyAAWECnPiIvCb5BfeTgjURkFo6pdbOermu5rGfR3uaHUC7
         O/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753128603; x=1753733403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ATzejsxg8eUIlB6/anWm7kdf84tZ3CwGyQ0Iu7HZCc=;
        b=WLHTBviV1+6M8hoUKyqLC6aHpF2CGCi6tMM+1H71HRiV7Ag5Nw6Rkd9ues+rUwUdQW
         2ESNTmAzC6wHbf6FWAj2LJHPb5VPXZHIf6rDrA+Gm6O6trtWmAccWOU5J/4BBDwIiL64
         DqPOT8ktOjE/BVu87i4TSU0pkWO3KdBF8AwD/XOBMyL86AKVQxnqxZcIsEzDYhe8aom7
         Yq0aLS/IDPX33IvrYYFEKlA04WD9v3Ry37dSsJDyMZupj94Zv3ME2NW/RSil552cdLgI
         gPhu4zDS0zLS5CXrLXMy4T/q0FkQPyAMDvO7j4klikKyftCPaZc/VqozkYM7OIRPUTs/
         e8Iw==
X-Gm-Message-State: AOJu0Yx1ZZFT1RSysW9a4GMmWeAW559JLGTW1Al49oZplaEBGy0AQkvT
	2c0wf36c028Wm5vMZKGE+IVyQWnRo0dDWG3yRwsONZ8h47BWnywc/4J7aGdiYA==
X-Gm-Gg: ASbGncuPQxcGuW74MMD009828PmMBSXZKQNUJ+fQkFDcYYatBtLHIzgxvxdFWI2QrI2
	fC5Jh6FuzsrKtbDujz5dqpzIlSryQQxulkjWRp34w9brIDRZS6MC1X0DGJ/DaaUCg/gJgQxO3XM
	eZd7Ux30v6hEO8cTmBuvjx2KYKe6+FUMqgYdB7ZTJBYs7ff5xZUohbD+IYCy7qi5nKdztvfbiqE
	dfnvp3wqvVFVjAcGJzSsbu/6Jj9WBj9ddmg1zke7P7/nRZlvVWMiryF5HnB7oEKT1ur1SFAio1c
	lFYDlR+uwKWjF/vCUrAmqzQR0h6tAYfYxl9rcntXGpvWkfVEsjuPlqqlnsscypMKN7SzmXDuLcT
	tGUEQosfbpCu4jmtG+A+Fi6m6opLhB+lkvfeBZpUeFAAIwx4Xql8kJUnfoVazDKZJwj+ymU6QQ3
	QjJS+p0QtLcl2f72sY4ejYwY1Kg3L/d+WYyrlEX74=
X-Google-Smtp-Source: AGHT+IF7i24mdqC3GgkhY1SF0bPsdAP7Y2V27aVZWQUgVVMh7MTPBrJPECbi4MgXD6yzMt7SeIvbhg==
X-Received: by 2002:a05:600c:858c:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-4562eb80e1amr163227035e9.18.1753128602540;
        Mon, 21 Jul 2025 13:10:02 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxril34oe3x6dm.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b5a4055sm112802915e9.5.2025.07.21.13.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 13:10:02 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-exhale: add python3-beautifulsoup4 as RDEPENDS
Date: Mon, 21 Jul 2025 22:09:52 +0200
Message-Id: <20250721200952.17315-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 20:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118663

bs4 was missing when running Sphinx

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/recipes/devtool/python3-exhale_0.3.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes/devtool/python3-exhale_0.3.7.bb b/meta-python/recipes/devtool/python3-exhale_0.3.7.bb
index 6168c3d2b3..0e80df9cc1 100644
--- a/meta-python/recipes/devtool/python3-exhale_0.3.7.bb
+++ b/meta-python/recipes/devtool/python3-exhale_0.3.7.bb
@@ -13,4 +13,8 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "exhale"
 
+RDEPENDS:${PN} = "\
+    python3-beautifulsoup4 \
+    "
+
 BBCLASSEXTEND =+ "native"
-- 
2.39.5


