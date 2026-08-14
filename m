Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70880C5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:42 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24554.1786747654496194624
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rMXbcGph;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc73e322dbso23239965ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747654; x=1787352454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skeeJCzz5ZRI9FvbXYEzAWPSmo0pcy0rE1sWxvHFTZo=;
        b=rMXbcGphXNZfh5wFxnjUz85u8NEcSgRpdiOswGrsNhHXiyry7bcxZLnpkHt10hzaEc
         6kujNwTUunrIVZJPswosuZ5pdk3kMK79MXFC8QwwCaX0anTNaivPPefiEzgFNoB372ER
         0fjsNaBkhbt9N5x+EF0np4IE+Zf5IpdLI5l6apwNhvPaEKB/5x974CPQ95kwG3eBD5dH
         HDpiBNfTVeaRgzTmcPJ0EFinUQqddX0vRVD/XO7WjM75kHQHH/faSW3f5PgNE4dZcDbr
         AIpXT1L5hQ4md8zEWriSkdE0+mp+QY9ov+93WAmxgmjOCHEUaOTMeNGfztzC14QT/xwo
         y5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747654; x=1787352454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=skeeJCzz5ZRI9FvbXYEzAWPSmo0pcy0rE1sWxvHFTZo=;
        b=ATwwLnOn5TRwHA/6gUmsn6lhnD5TpbHoXhB01WdUYKNtnv8ym4KmUW7/9dQ+b9eT++
         UtrbSiXlGswUA3V/Eo6AeHrUlRl7EFLW6cBJ3G0zZr3LzR6ZehF6eKfQM+lssg4SnmIm
         oLCObHiHJLnVvyUN9K/xxfs7Vi2OU8lqHqUZAQHvL7Q8B3Xq1Gg9b/85oIZh21SqyKfD
         8p3Qlf0twaT3WlcP7RTfmJ5O7sF+K0q9Uf1z/kRrdAcwm5eA81S8K0ILAfQHwHkX8YP8
         NqNwBcs3JINW0M3HzeFZGGAm2euqe1LtOSaW8+j0fHASljN7k0cLyXcdGGXK0JSOw59V
         AHOA==
X-Gm-Message-State: AOJu0Yz/22r/ltU/kUGep+gm4iWcBlpF10NE2OgH09Ib6cFHaDK2AJyh
	mdt6cyX4lGh1eshDhfp6x8a/sGDqzRhsWVQilCJFXu4Fnbnv2g6Vf7Y6OGG0eSIV
X-Gm-Gg: AR+sD11CNIYIad3VFdDkEo87G+lh73Ih1tm4uQqRnZ/Xu2grp1BA7ROTFbm3QMKqtwW
	6FGvJpTdqqLHYN87VMyreBFpMdrDPLTWzs+uP9Sq6VmS6fn6iqdILCH3NWmuHU3e3xzFkVWv1TA
	6UmVx0xpQKvAl0LCLrZl+Ov/4avQi2EOl9BWhMJJWL50X9bItQzxOEj+tmyhLA02LSgVWQUnv6U
	EZRn76IpYtG8CmKQzQ/dM53EBXZka+xU6qJpjXss58dZIRnl7mrakR4rM6+6//u89T83wMADcRT
	XEPbBY6hLK+ZzgUZfr2depqNx97jKlVic/Jloz/9b7kVy+VcjgVbsVvAnNDLRvy9nT9fsEd5SDQ
	DiK6ALEC0aFExUGKfG5KURHgn2kqjWr6VHwgzMy4P5yJecFhMwWnqqrR3xhLf/6bWnGIVle65o1
	hA4NdUaiqdlV2gf3wbH2SImaBt14/GjFME1cO0NvwM3NlszCFjvikBJUmhfim7ekBkXvlHHffcE
	xrMNo57j9QNWZdoTl4GOlxMHi2lecJdIdQ3xdRQ2YtF1x+QaDcM76FR8l6djypj0ljRHoFqdcNi
	WNZRGBIvo/VfGwip7dG56tS/BhtlEsYEDMWg4vjgbPleRq6z/AHCHuB6Dr0n2Us2tZPz7Ek0GRQ
	CJjDJ/t3NuiwavC/oUxLJbtuD2RvuRITWK2ZQ/NNGaUBOpQ==
X-Received: by 2002:a05:6a21:7a9b:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3cc71d533f1mr10580369637.3.1786747653793;
        Fri, 14 Aug 2026 15:47:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 094/109] stunnel: upgrade 5.79 -> 5.80
Date: Fri, 14 Aug 2026 15:45:20 -0700
Message-ID: <20260814224539.1523174-94-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129158

fix-openssl-no-des.patch still applies cleanly (with line-offset shifts)
and is still needed: upstream 5.80's src/common.h and src/protocol.c do
not yet guard the DES includes/NTLM code with OPENSSL_NO_DES, so the
patch is retained unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../stunnel/{stunnel_5.79.bb => stunnel_5.80.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.79.bb => stunnel_5.80.bb} (92%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.79.bb b/meta-networking/recipes-support/stunnel/stunnel_5.80.bb
similarity index 92%
rename from meta-networking/recipes-support/stunnel/stunnel_5.79.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.80.bb
index 3435f8cd3c..9f14f0fd85 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.79.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.80.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "8ea0de6e5ea76f38ea987fa831c7fd47f7a1f1e7dd465fd6fa8622edf30d3a45"
+SRC_URI[sha256sum] = "6d0841d48de07cbbaf4a055919065bf7bb5ebc63cc15c97a2c76caa2bf285513"
 
 inherit autotools bash-completion pkgconfig
 

