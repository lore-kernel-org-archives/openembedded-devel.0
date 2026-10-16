Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DDBCC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 04:08:05 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14395.1792123675613940934
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sj0ymIVW;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e5fb79ce82so34566165ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 21:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123675; x=1792728475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTxwvwgYicezQKXLF9HFpuz4TS75r3z2vexE/cGAyDQ=;
        b=sj0ymIVW3TE6Oc8Srvrp2kqoL9Iav6340YSxMBj5Z6j+ZyJrSZgwBp3RXNFJ+rd2wh
         qlWzISLuwLOVSwMwR8xdZ7fxVSnvcO5+D5kpoCnZIGQrbj81e5fpNyAHyy4TqoUZzL5X
         LSQF6CpJhc/tqt1QYLvAEYayELC9reKduqKvqRPNUXpy+HBZi5EjUT5vlTKwGp0MB3T+
         CjHbmCEspZ+4BvKH5dj9VUrw2J7m0wh9H+p9ZeCuQw4bgh0rVaG7o1m0u839tteLIpVJ
         HY29dmF1+KiGWeY0zHfxtJLI/h/+oYqGWRhEdOxozC37YxLCDtgZ4guu89VL3o3er3D/
         8nCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123675; x=1792728475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTxwvwgYicezQKXLF9HFpuz4TS75r3z2vexE/cGAyDQ=;
        b=rPs65JxMNoI5TbKz+6CG/5HmLDUU+mTyiEVcIlIUdEHAOxpWVbmfK3ItcWLCNFGoRj
         /ZXyHLsg6kTLYkHH8EXe8XgPCgqhGcwmzCl7OxHyBdtflQ+VVFPKR7veo/nRQVGjwtk9
         HNB552jiowY7q46xkhERcUJ5qUMeiLmrp5u9KrqzwEha+6U1+s778eYuzfpPrhRtz30E
         tA+Hbeh16c3A8qHUN7XLNa9eTjpn7pbosUuh8KtqBBaI8AAmGWvtMlJRdvWokAAKIuht
         2kx0+7S/QWZaSkBROhaLr5lHYM9/ntDGh0zQchNCRBqEXNo+XgKoigkuFyKGkAoFTkbW
         PfMA==
X-Gm-Message-State: AFq9FYKZyBWbb5GEFlO9q1Z6kNYJgegj+kgq4n9CKCnrm0WJux6x2dyZ
	owV+QIE0bu2vLeVvNb0WrICTFifBiBZbMHG8md5sBnQ9LySoxbw1JF/5urNxpA==
X-Gm-Gg: AYBFou2v0V+d0qwD1bbQX42kQPJ8Vn9Uu+SH8VUA6eGjAH9HUGafoAAn74Pkmsmc6su
	GhzChpPSeQFe6qI9wjBtcxjQxpY1W2+qtKe4Mrcm1kNZnHsBSsHUAOXBKjGvlQ/muc/lVZtnKsR
	X/R22wudndsoisxUtqg03lZrCinSkWs65//B6aRbjd8v1sYo8ovxZau9DH3rSICs27hTe0W331c
	pU+iPhIvtOeeKmuj18EJ9sHFD66EAbwgzCUXc/ZaqE2tgeoagI1yXsyfMzyYibIQsc4QieRfSYO
	hEvg85wiT5wgADYFp2E8Ur6bVl1cDiD76DXRPUR6FGdI/yU9o5Zb6O+sHAdTXlS4fuS+xb0hVIi
	p0bqoas3ul5fmXRVWLyprUZ7TBz8EP4RNX2WeypwjSWdcOfaPq4lJcrnZz+Cy9k4/9sEiImSUYV
	HIHoWqbPrldByaSxYfrhqPXQkEDUtjP7x93G7gXSRuNxxsohs5MM2bCYuRX6riNb4urwk/9AIzc
	StDDEkO4k3AoVHW8k3QmDW4DcOV+4tsP6RpTYI=
X-Received: by 2002:a17:903:8c3:b0:2e9:460e:ca49 with SMTP id d9443c01a7336-2e9460eec39mr65763725ad.18.1792123674809;
        Thu, 15 Oct 2026 21:07:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83498csm3796335ad.35.2026.10.15.21.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:07:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 6/10] python3-configargparse: upgrade 1.7.7 -> 1.8.0
Date: Fri, 16 Oct 2026 17:07:30 +1300
Message-ID: <20261016040734.1499287-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
References: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 04:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131042

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/bw2/ConfigArgParse/releases/tag/v1.8.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-configargparse_1.7.7.bb => python3-configargparse_1.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.7.7.bb => python3-configargparse_1.8.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.7.7.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.8.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.7.7.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.8.0.bb
index a6205be59c..f44247383f 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.7.7.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "607bea276a219912158afa1e5a716c3f8f88d542f9997dfd43bbd0b492a9f5a6"
+SRC_URI[sha256sum] = "22a417f4d7b00149f0af82ef7c491f8ecc4b1d5454633fd319b386f5eb806f92"
 
 
 inherit pypi python_setuptools_build_meta

