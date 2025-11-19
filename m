Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFB4CF6484
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 21:58:11 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18969.1763589488076788032
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 13:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nFLU5xmD;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bc59a785697so180867a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 13:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763589487; x=1764194287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bE62dDW/pPZ0j49TnvqD2bY86uGQY2ytDO4TV2x5nI=;
        b=nFLU5xmDL97zwOBfcOgrnvN0MkH9ES0I7L73pDb2yDFkwwgVrqrwRMdOwml8BbpRpZ
         tuiIxSniWLrXj5Gtyr2BEhLS8SxjY1QO9LBtEMIjXcnjl+IsRMzjGWdPobbc+N1BSyeH
         qjtUUp5EnxIUy7GlZvus09H52Ut9jRJRKQ2pOD5bTvH9zEOU3QaFSsRGoiLiQF8qcsZ5
         DlumDPF57dvvZxRIIPxyDQJmI2bQkB9lf5jyRe22kr/B1NF0bVDshHWZFEe4iIUvJvio
         FEEsSoqjhRsmNOXvGlohO2/OvIMuMHbWryeFq9lPh36Rh4QldBjtUdjnXUjLjC7JH3Td
         XBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763589487; x=1764194287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bE62dDW/pPZ0j49TnvqD2bY86uGQY2ytDO4TV2x5nI=;
        b=g3ZCBBIpXj4rdTzAehAcvo4af6jtjLL4M0xm0eBpLrXT4FImVHma5klhjMgslQtXmO
         +/kHb96foA6Rb27LIkoQspEPO1Omt+q+prDT6s6cNulhc9xzcCDnrpAeXBc9KMLSUDPX
         pkc0/JH2WKYuIsJAP6xTgpPQwDRh/lkuHx8gupODUmPkUN0IXC3silah8p/9Qu9XJwOr
         P5DmP8bMRPAlDT1i7ODhyrTAKyH7Z9lz0+D+UFcoVBO7ncWcqYoPK9JIiTz3zhar66/T
         QOOugJq8uunlV5Q1cQdV0gcl6D34sNfwW61hJXUURKajMNf0ZZJBvj7napH0G5heA+ex
         gnyg==
X-Gm-Message-State: AOJu0YwJvK1Tz9yqE6S24OmNWpxxOFLSMyIKCB9AsH2AYw8zfwBtITpz
	58Znaso4hwVkSOobKZ1vJbzKEz0illpZw8zIVH+AijBt+8ihEBL0p6xgHyN+E0GfFGA=
X-Gm-Gg: ASbGncvSbfU2IW61Knyv7DDn0XacKU8DsYlggZ/ZXiDMTSTTWK9/p6serZRT/VZ5/tP
	eOhEz9wRIj/g93mQHPvqdhDQ5Q9/T+BqnewKRtx6iJYFDtICLfvkXAeULKkfhGje86lSBBNhoPE
	zAmnSQfAxUJj0jkFoJi5C6jViddOJj0peOFupg7mTFDkk9knaair77k/qs1DyvW7jrME65I9F+E
	4VqWUwW3QkOlP9vpWRi3U66qCOTT/v+8JjvjX0fTp/VGPbFPtXlSMT5isIFMBDZJUOv7rAg3GfX
	xyXevKHucGKCoYGzlIIHPz3A+//HIOzi8xHlJc+faS/Yd+mngJxpbkRJxo6SSA51PflmbtfJR4z
	CxTV0M3p4nIbl+qEGrZRb5leZRY6llBVFCnGbU6yq2lb7IWYhxSJL4BklDUajz22N8vrSaeU8oU
	+HePz5+s9k9yIjIg9dxOymSS8tR5jHPd0vVAvgE30imd+2TPEy4US11WyUAfWcNAIItzbGSFTXn
	UnXIabSQMubcJgVjbpcwk57mTPajf5GMLW8Gol/LII=
X-Google-Smtp-Source: AGHT+IGaKFH00iwwVPqx4NI6EgEI5t1YbvZD2qrs19sgME1IBbzAs7k2DnBgZ4d3MWobFeo8Q3mebw==
X-Received: by 2002:a05:7301:1930:b0:2a4:3593:9698 with SMTP id 5a478bee46e88-2a6fee50a74mr144744eec.21.1763589486788;
        Wed, 19 Nov 2025 13:58:06 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc4f6671sm2759109eec.3.2025.11.19.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 13:58:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-parsimonious: Switch to PEP-517 build backend
Date: Wed, 19 Nov 2025 13:58:03 -0800
Message-ID: <20251119215804.256151-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 21:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121916

It has pyproject.toml asking for setuptools.build.meta backend

Fixes
QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-parsimonious_0.11.0.bb    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-parsimonious_0.11.0.bb b/meta-python/recipes-devtools/python/python3-parsimonious_0.11.0.bb
index a637c7305c..e9da557967 100644
--- a/meta-python/recipes-devtools/python/python3-parsimonious_0.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parsimonious_0.11.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"

 SRC_URI[sha256sum] = "e080377d98957beec053580d38ae54fcdf7c470fb78670ba4bf8b5f9d5cad2a9"

-inherit pypi setuptools3
+DEPENDS += "python3-setuptools-scm-native"
+
+inherit pypi python_setuptools_build_meta

 RDEPENDS:${PN} += "python3-regex"

