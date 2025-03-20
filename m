Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89CAC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 10:34:07 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.4219.1742466842514777469
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 03:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bVe8FHGM;
 spf=pass (domain: konsulko.com, ip: 209.85.208.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so1122613a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 03:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1742466840; x=1743071640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SOnGWRLy0cbjsoEJIpJurwCi8HbVtizf0rMdarW1bPE=;
        b=bVe8FHGMwbSKJW3Z8UGb4c68L9h5pqwzgZn1nJiT8GZWmhFtmN13TpePfQRPKtf2UQ
         uQVOGq/iFJNhvQJ4Ns9MdfeA3GIA749FmbYWwHjhNugR4xZpSPBK1NDcwF/Yf4N8msUc
         OJeujKCZo0mVvuC8P763ZmNl3zwjAc3aYuKLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742466840; x=1743071640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOnGWRLy0cbjsoEJIpJurwCi8HbVtizf0rMdarW1bPE=;
        b=U+Ek0kKQiZxhI/yTyCZxwFjc4c0vOL4S5Yvo0ksooSQ9Lc9yOLDo753bwQGPlBDmxM
         koTx6sWiMDoDFjcpfGVkksKyYWZPjDqebrKZOtqxKFMl/FWWyYHlys/ZYN4b6QZJT8aw
         3k/l46gfeYXmYjr6A6mj88cn3J2EKgUNVXh+hBb+p0ig9slT2eObMRKRNTYFafO6bXYT
         eRkwDfWkHNF0Mr0+JyebUdvxjKYyUszU+YDVKp3lhscHYZYO4FdCw9HAohoYoZu2pMZF
         urknsYU8CX33tPOfQrMCT1OF3ULziDchPJ3NuWZ2XIVQ57XsQHwqtlPAGS8LLCLyWzPb
         y+8A==
X-Gm-Message-State: AOJu0YxqYM+6ap6mA+JtnvMYFcALbNfC+maimSneGJT+3CcrRMGaS05z
	Z/CK0KfrWzMXSG7Q+EdpI8sebWDI6Z9YTazSwfPfPTaSUcLgHoJpWQC3C84BbjpZKJEqUMVCAKb
	C
X-Gm-Gg: ASbGncsFBlJpzd+Pz3iGx5PlWrQYy0Fp6v6r0O42Dw5gxO6F1sTo97+EY8H+JYIPrwZ
	RKyEdmJD5Lfc0zX/LF0qODRXHzooCf0jmfBgLRWgT7OSuVplJiA9ldgN1UMdQk/jaHnGAyDrPt3
	NoYxZpdZHPDKaqn8cUdEzEM8cv5nnIS17pYmcxLmcuOz6Pc8+DYTWEJlLDmqqPrQHTSrzMKdB02
	CwWQVIuvLCeYje+4PtVYiCdPEa8WXC4OAkXAYyGAstgk7iVhibgygYivushJrYDdDEyo2HrCrP7
	+yryqZY8leEXWnIv9qDcGbVkCzfVBHkCb1s7W7jwFSIUgaBlcRcdVEr0rpMSteIrQpGyuw==
X-Google-Smtp-Source: AGHT+IGM7io9DCjNV09jgBMj3ZRhGUO8Tlp+MgO7KUOF6uTp5KY/Zl07FvPPVUAJIyspK79C8thy6A==
X-Received: by 2002:a05:6402:270c:b0:5dc:7f96:6263 with SMTP id 4fb4d7f45d1cf-5eb80d02ae5mr5133481a12.15.1742466840359;
        Thu, 20 Mar 2025 03:34:00 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816968aefsm10723148a12.20.2025.03.20.03.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 03:34:00 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-pytest-codspeed: Update RDEPENDS
Date: Thu, 20 Mar 2025 12:33:57 +0200
Message-Id: <20250320103357.1763652-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 10:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116129

Add python3-rich to the runtime dependencies. This fix is required
for ptest-runner python3-multidict.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pytest-codspeed_3.0.0.bb                | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
index dd08c0fbfe..317b9d6f94 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
@@ -11,4 +11,9 @@ inherit pypi python_hatchling
 PYPI_PACKAGE = "pytest_codspeed"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-RDEPENDS:${PN} = "python3-cffi python3-filelock python3-pytest"
+RDEPENDS:${PN} = " \
+    python3-cffi \
+    python3-filelock \
+    python3-pytest \
+    python3-rich \
+"
-- 
2.39.5


