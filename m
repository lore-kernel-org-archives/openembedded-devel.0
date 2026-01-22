Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11B2C44500
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 08:43:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33275.1769071409456786175
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 00:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Katg5842;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso5267065e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 00:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769071407; x=1769676207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6sC4wr/4BEjys0IRZlyaODZ0m8A3CnaPTvAIRtojXo=;
        b=Katg5842uoJcGQFqviU5hnmmFTBViLzLdEGnNVrU6hVvhokNyyh44eADKmYEh0dgR3
         NnfTt5JGVikJ7vw/v8mwYzfDpvE6kEMdsiMMKct5GBB6xBKyzsdBY4G7oFf1UtJFrizS
         mEUAJFlkIa0oYmuN3GsSrANOw/KA55RF5pYio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769071407; x=1769676207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6sC4wr/4BEjys0IRZlyaODZ0m8A3CnaPTvAIRtojXo=;
        b=bT+tsIc2m/EF/4B0dZB050P11CxQmlLEjvZGLNNeu5tctyX029z8skLc8Qhr/dQ69p
         zEBXk99qZ5K3gSakfPj8+090sXsDXsCadhFoMBDtYh7LMjy+xK9D5EFGEOcxa62eSPMI
         11TTZTUPGf/Avp5xyxuw3O6WnF67o0z14sSEv0wkaWAPlO8KdNDLH5I5O2pSeYuRuLZL
         +Hw3e7rdVA4+AlJoZldRS2hdOhumKVnD03E96hCFf49kODTUWUS0IAD2IRTeN3GQJwcq
         m+aPBDgP5CJNng2uAOPXZkj96XCtoAfLxLjlC2auqIyxilrhZWtUm4DXLewyO3J0iXSz
         bT3Q==
X-Gm-Message-State: AOJu0YxRibYlNPiA+a51LTRpA6bhRdsFssxVIl3T6AJKKN70KuAvb6dl
	683ZHnSpHO5T7KFxBZ4DjWNROkUNLCpV2INhIVHJrW7d18ITlgu9jm0SanlxHQq4MmNQn35a275
	mTdFx
X-Gm-Gg: AZuq6aINXFip888bVqpYHRGUi7ewPiSgXKWgrvnlnLDAkjYcfjsq9GIrdsbwq+gdDlH
	Yby2Th3zy0r5wcKEBm2lyQZay9VOVNubQBSb+lC9clytfLVgmb8Xo4QgG+0u7fxs8G3mAEEFxYE
	6r5D7+oOFQtlorMZcwt9CeZy1a+5YVsaeE7S/BA5PEe1IvA8Recw+cnvPfPj0Ezj+w7NlyKjwVx
	dItVDBPL7E8ex4i21QtRMUD4WcE6v4DPLkc5IWXMY3VDPCMQ9/b4pRKT39FFuAQrqRVF3XepmBx
	Ob/jlp4u/OsyZpPSsgAl7gAK73voEmOFKPc1npz2pwozPlHIl8l4GIKq9zAtQoZwhSqqsexCmnq
	EBBPubAzamgFrOVYFjN0pp73niIDD72fvKxmlH6LvJjt2owTUMHwwkIFNiIwtWzPBjBv2+9Parb
	rLZ8yOcTlHjgv7dTu7KRQh2m8S
X-Received: by 2002:a05:600c:42c2:b0:477:3fcf:368c with SMTP id 5b1f17b1804b1-480470b7d37mr21857955e9.9.1769071407352;
        Thu, 22 Jan 2026 00:43:27 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804252b02dsm47163605e9.5.2026.01.22.00.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 00:43:26 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-sqlparse: Upgrade 0.5.4 -> 0.5.5
Date: Thu, 22 Jan 2026 10:43:22 +0200
Message-ID: <20260122084323.1892117-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260122084323.1892117-1-leon.anavi@konsulko.com>
References: <20260122084323.1892117-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 08:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123731

Upgrade to release 0.5.5:

- Fix DoS protection to raise SQLParseError instead of silently
  returning None when grouping limits are exceeded.
- Fix splitting of BEGIN TRANSACTION statements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-sqlparse_0.5.4.bb => python3-sqlparse_0.5.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.5.4.bb => python3-sqlparse_0.5.5.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
index 9f358d40f1..03c032c49e 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
-SRC_URI[sha256sum] = "4396a7d3cf1cd679c1be976cf3dc6e0a51d0111e87787e7a8d780e7d5a998f9e"
+SRC_URI[sha256sum] = "e20d4a9b0b8585fdf63b10d30066c7c94c5d7a7ec47c889a2d83a3caa93ff28e"
 
 CVE_PRODUCT = "sqlparse"
 
-- 
2.47.3


