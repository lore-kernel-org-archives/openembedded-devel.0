Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7F1E909D1
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:41:57 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15052.1771342914114855704
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=fdesB6Oo;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.215.182, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c6e18da0f82so220390a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 07:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771342913; x=1771947713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/g9NfYUx73bsM9yWlxHIOJiDn0IoW3iGAhLJaz7350=;
        b=fdesB6OoINFd+jcnq1TPQtSvM+Es1IJqa15u2W24DMQ/igS6zEHKiqLmaBJjGCN9Eg
         KUNnoxX2SkY6SDfypHC0b9wX6hojOCgrv1ikJCblry56zpHjzeoGb3tMwiezwGh4kKVV
         cszwKfSWB2uVWWF9rgopdzJZvNBVUKsRWtL4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342913; x=1771947713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t/g9NfYUx73bsM9yWlxHIOJiDn0IoW3iGAhLJaz7350=;
        b=iLvTkJrWaFbp5qbe4G9W7yzgMGzryhjytqrMxp+dClx7McqY5CVgHlBWpZ9BtOh8lc
         ELVEviidPmznDvuydJGteCkHCQ7U0EnWSVSYZFJGl/LJVMxKa0V8pFOkkrXq2ZPgcvR/
         gARK+IpdlkMdnEUuYDkrswgasuZ/LTIDxTnIcyB/c8w6woaOQn2Du3CNH6GUlrqiWUpQ
         KIgrDMDkGZsVRx5M/ZaLOxFAt+nrMcgyR/xFmRRMyxv9jGxLqxV8y77JnvI7EQn2dI+v
         CoynyB1Fl9eeMyhSB86f6oMRaVnTvUwYdShy63FFtAUFvOSmRrvONPjQOci2LhqABzwg
         BIXQ==
X-Gm-Message-State: AOJu0YyQlsXKSqL9exoEylExiHVTo25aE5nPmd8tOcQYn+ji1yAtCrLC
	yZlmmdIR4StGBjVp0C8fuN4ptrlAWDv9hdP/LpruetLplstEKc4naLtiL1sz+nTchH2DIjuodJU
	1iLEe
X-Gm-Gg: AZuq6aIqsOu+VjSqpmTtS2E0yMsjxgl9UOOssjIAXZO3PcFHBvYDPt0GqUZxj8wLLny
	kjS6hxmInaERrhRZ6AcDWDtjhfUBuJonVZP7pTjFtQIuoQslKvq/xnmNOPZA55rANY9JqMoprfp
	H4s3zhZVCGOmQyC3KVNBK7SO7PK434LiR4BjOOt6+k0KowtDViCEIni3acQi1VDXPhcoCbgPRnK
	RWR9iXlVeVxbt/UCdNc/yE0ZYn0awBvjoxqNGu92NE3aMW8wchgryWBsPYdUwW6JnJJoeoiML1e
	D2bevvFxJoQ8Yw9GHHNW3HAPK9xr3xbdDMJeQaimqfsKAoXwWJkQ/iVOAE3F00Mq5VZWsDv3J2g
	j1EPmW8rUWDeChe9fTQCEVvhY3VzjDJ94kU7Nb6Ibx3C3q0VukpL+ycLWX0Uo3DzNiVi2efvwyC
	xtqV2K0ttJKm1c5Tix8sAUDK8rDsINdMGqsb2DvixK2QHsxkUgdu0=
X-Received: by 2002:a05:6a21:6d94:b0:343:c095:c4d6 with SMTP id adf61e73a8af0-394672532d2mr11566325637.3.1771342913544;
        Tue, 17 Feb 2026 07:41:53 -0800 (PST)
Received: from adam.ht.home ([66.164.55.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fcff01sm10415519a12.2.2026.02.17.07.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:41:52 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 5/8] libtoml11: Add a bugtracker url
Date: Tue, 17 Feb 2026 16:41:41 +0100
Message-ID: <20260217154144.713423-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
References: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124465

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index 4b9eccf88d..60c97b1c2c 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -3,6 +3,7 @@ DESCRIPTION = "toml11 is a feature-rich TOML language library for \
                C++11/14/17/20."
 
 HOMEPAGE = "https://github.com/ToruNiina/toml11"
+BUGTRACKER = "https://github.com/ToruNiina/toml11/issues"
 
 SECTION = "libs"
 
-- 
2.53.0


