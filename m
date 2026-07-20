Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B345C4452F
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:38:41 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11392.1784590721331391902
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nDNRBKEC;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e7109321dso1222249a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590721; x=1785195521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UOKm6A4h75N0vbPZsWAlz63WwlgdZ6z6b9wJGNtHNs=;
        b=nDNRBKECM9vHH6D0ujPxonV2X8JwPeIQySyE8zRj0vtlcDwyw7AqbP9fi/huVjV0ba
         oY7PDjrA+r/JTN8rRW3Hh6rygsKgSrk8GmyEToqLygP07Q/fX1EMY1E/FVfMJ9IOpXE5
         UL1r0mNCjqhXOyUw/9Nj8faHS21CZ1GFasL33AFyKp9yjqJQLsS1/Ir5d8CfcHSj2UL5
         AXVel8NI4do6GA5YAfzxrTDF4+HDpemNd/yb6VbNuAbvitHOwkeNQmNVdvN1NRqPms0j
         m5iGn6Hzs1W0ocOkpmszQTvMKDq7Nv4iINRGg0lm0mHruD/AD4TlngabzMUarcoSzGAC
         6iXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590721; x=1785195521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4UOKm6A4h75N0vbPZsWAlz63WwlgdZ6z6b9wJGNtHNs=;
        b=HYSJstWGFMi2y9nfmwR9oR6ZGKCbMxE1t7x8ZKMB8ASS2Qz0bE53f/25GWDPo9bRkQ
         yMoj1Fbm0pyPodlX2z9oO45rBCueCSc8JxVa9M6IfPjXacNSomlNDiamMuNUw0d5amQn
         VWlvaKbuIl8gvhsKq7r0TlQBlSMBhvSZ1/2wMe2zP2WXs48JjmZyl/n2H2qLbZm+DPb2
         fLNE2N2ih4sllNVjM7qJWHqv5NoFSfNwcKer9jq4eMhDMRfnLmD+tV7HkijxzXh6tFNP
         IQKl1OgwA6elHUSfVD9XV20MOstXxKspgjpH+DWY0lDY2svxG4+xn7KnwhsRm2mD5Ju8
         vuDA==
X-Gm-Message-State: AOJu0Yyb+gtIU5yHZn84EyBH+hRcwdSV2a00CEjUUo+gBpmSZznTOmiG
	EU1pYkl1WcDwnqqIGQ6GeaBRHt9V6CIJOJT0wzwk4dr8vjkjbJ+VjT7g+bDDTg==
X-Gm-Gg: AR+sD11es8s5bwUJR6mmEr2KN29Xr+nAseJhX9V/VGtLaBnFT5nfmXXAHafLkZhcWuN
	kb9hWxOteV8XEngVm1GJP8UJ4B0i05O4JSXasgPofZ+HZVCbsRmAXJqfpkwg4+0IND3TxNeV/j7
	GE/dVWlFnMoCMhxNqfTAT32QAg8PHta/omOaVdGl/pYBd0e8buaqP96vwF48JA3yXs1sLTYUhKk
	Skm7nIF/YafDTJvG9F+9vbapqECz7LY97r/Q7XbMpVZwENdiMr+7fDyg/ua4voS7zoMRjDN82Z+
	ATxv+P2Vk/X3EIkxTpuvCFS1txZ8Etq3RriS86qYI1A61r/z/GJSIdX4n0/YDIhjHE/Fn2XfZ5d
	PdquvPrGnvaQVxPY2PtK1/pG4mf5QPWtMc7vu6yAxxC9nPM2AcEkZ16lxKS3EP7yhXRYAFd1NOm
	iUsuDl79/MNtSVbSr1X6iGb6npdr67Bd9P15qa
X-Received: by 2002:a17:90b:3904:b0:387:e0db:bc34 with SMTP id 98e67ed59e1d1-38e4b5793d2mr16235428a91.42.1784590720706;
        Mon, 20 Jul 2026 16:38:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 7/30] python3-elementpath: upgrade 5.1.1 -> 5.1.2
Date: Tue, 21 Jul 2026 11:37:48 +1200
Message-ID: <20260720233811.2324493-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128308

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 4cb8410f9bbcd6e18d5bb90af538c5cf09312cac)

Changelog:
https://github.com/sissaschool/elementpath/releases/tag/v5.1.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ython3-elementpath_5.1.1.bb => python3-elementpath_5.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.1.1.bb => python3-elementpath_5.1.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.1.1.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.1.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_5.1.1.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.1.2.bb
index d89a012f9a..466b97ec92 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c04ab6ce886cc843af8941bb199406ba"
 
-SRC_URI[sha256sum] = "c4d1bd6aed987258354d0ea004d965eb0a6818213326bd4fd9bde5dacdb20277"
+SRC_URI[sha256sum] = "43d67a38700153eb45349c6e14a4d4b3a06e390c31df06539f730a96baf9a7fc"
 
 PYPI_PACKAGE = "elementpath"
 

