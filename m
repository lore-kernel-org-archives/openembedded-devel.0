Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9CFC5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 17:27:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.66120.1749490048571780790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 10:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Tv7spo7X;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450dd065828so31006105e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 10:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1749490047; x=1750094847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BStO5SrG+cv8pgDtWEMcWcs+o4MHyhwEquUKFoDv22k=;
        b=Tv7spo7XYf5zcaMo+zgd1TasKK32e0w2k3sk5e1WYCqDO6UKLdnu8gn6TOzMT5MRLG
         X71VOO8iXmyWmb29viFVr4E+53SmTihRY16W/K7S2bvmDUiVc/0RU6otMQwUPjsNaCF0
         YOfjGvcL2n9XmUorRt/GAu9Yvm5s/binw/RQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749490047; x=1750094847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BStO5SrG+cv8pgDtWEMcWcs+o4MHyhwEquUKFoDv22k=;
        b=hiYzWP4B8tP1zp/cgdsltHy1oz494TG98Pc/ksy8RJa66UrFVc3Z/ouHax+87mbu+k
         yorPdr9cLUaPEJbT6TxSZDdeiUiomUqbA26f0IRJ16bkD+pA7A11Dry0uSYeLl2W4zjG
         Nqi4rRo+fqtA7rUGA0lVRevxg3jn5qspjpOR1h3ZeY+dFN6B9N6qxCAjYq0AmH0FFLSj
         LBbtooGL/8tsV/LXwpikWyK4vhvMZ6DFzVEo31LfGFTDBJfuD1daAwCdtxZG/GHhwtkx
         0fZl2Zp5Lk8DeikuZQbjxZ8kl1d9h2BdLxSSySTsElu44a7ACZ6FGcncJBnTd+79ITnV
         SZVg==
X-Gm-Message-State: AOJu0YzGFKArnqu1f62ECT/sxVgpqyQhRgHl4C2UgyQyzdsHfjmuqot4
	//dAIYX1OLV5UDhj3gCs3k4K5fBTgMm8KryQuWn31jumogNyp/L4N+SyYPFThkVGF+3ijUzLdf1
	sFZxW
X-Gm-Gg: ASbGncuToCMBYW2e3R8s3vFuYC2lH+3k1X1qsruG5UDWp2N7iZLfMHwLhxohNZvMvSk
	sDLyCwpr0p/lQmLkbWN38SfvldFqIYR5LKhG3CUtdwgLaG1BV1kVuWbuOavNBgJhYwb19B40RIc
	lpBY27EFvpXFeFGuD6v+d7F9dgHMr+wR1uWSWMDmfrv4O1SKxcQBeOPT51xaRZM5KiHIN8EDfxH
	RdyimqsjB/9RhAdRIEWPACbtoQqIXoKdwCPyeAHu7unjt0pehbrN7Kcjj7MhGpmTvGEif5DESW5
	CrBbjHAd7QjwAuR8UX9eoP7tXIWOL4k7OyF2aeU8r+qSdU3wy2SIliBBfi/CDzHUEQ==
X-Google-Smtp-Source: AGHT+IE+JeH+CNZu7q8P57ryz8K6dTHTYuA7Ux1/6OCCM8D0O1tAvzEsRoqmXv+ahdlqXD9OmMmhjg==
X-Received: by 2002:a05:600c:8b8b:b0:450:d00d:588b with SMTP id 5b1f17b1804b1-45201414a42mr145157445e9.9.1749490046569;
        Mon, 09 Jun 2025 10:27:26 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307678020sm68014835e9.15.2025.06.09.10.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 10:27:25 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-cmd2: Upgrade 2.6.0 -> 2.6.1
Date: Mon,  9 Jun 2025 20:27:20 +0300
Message-Id: <20250609172722.2923788-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 17:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117788

Upgrade to release 2.6.1:

- Fixed bug that prevented cmd2 from working with from
  __future__ import annotations

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_2.6.0.bb => python3-cmd2_2.6.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.6.0.bb => python3-cmd2_2.6.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.6.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.6.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.6.1.bb
index b5dc97fb02..4cb8305fb5 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d2b71040983a2abc614fc4d0284771"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "8cffaba7810526421cab3bfa0101b4907e1298ff2bcd8119615965a2eae5d95f"
+SRC_URI[sha256sum] = "650a5892bf29b233d3d6775b5e3cc813648cff0d79134f707981f66baaed9f42"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.39.5


