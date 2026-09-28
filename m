Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CC7C9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:36 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46617.1790553810080000000
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P6J3iNcG;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6188so10557785ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553809; x=1791158609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6Xo6cZ18gHuK97LaV9oWWhvjbCvRde2xvzAf1tEZ0U=;
        b=P6J3iNcGNywKvTR8fWjsE6NXEULQbPbw4fiEDtCSKxh44qpRny2RFTQlSEixzJqL3K
         naha1mViTeftox8lkyqwL8iOaWHjIVhUE4ZeP++pR/uMuHQqkKbwK1iNaSnMk62KNma0
         YgXQTDv71dcUCDsWeOVJlSDNVix6d0FeMm3o4kOcEAJ9u8FpHFKqTG9bdtaI4SLyxNGb
         yfj6S0tTIxk/6dGdwo9YwsmBdmF42HI8fcLp5R+z1sZcyaIkCU9v3YzyDQdPgLRVrw5Q
         PuUhH7Whon1L4EHDc3q7n2JDedmmP3aqn3yYaDTMNYOBt+DThe27QTwLfNs4Q7qucP2+
         b2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553809; x=1791158609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6Xo6cZ18gHuK97LaV9oWWhvjbCvRde2xvzAf1tEZ0U=;
        b=iLQYsrKqcmDRsvPM8BE5qMMOYSEPP2ZLCSC3K0SDzVPJIdX8AldQDVCU7SjkxVJg2a
         pwueaLRiewP0e6d2FaWxB2kp6oa7demvfLv1XhZAPQjkIe5ZqPtFhK6MYrSswq9pb1kf
         jLyS/KpNzmed+S7EjNPHr5Qlc0g4LBjAkRTKmST+2iz7n4SDCiX1h7yJ1i3bMcbhGjor
         W3MLu4ZnU1j1ceJ+jEXUKqWMu/3n+/HQHVS2XFr1WyW3XEFTm/RZDTwi4VeHB6pjyvk8
         pPbjYWrhVw+SvpfcgxW8Dz2/8SXIzn4Eg4Kr284mMQBrBxoqcbM8bzAkK/uIlDwg5pvO
         uU9w==
X-Gm-Message-State: AFq9FYKGww19cNrZTvW5SnwXiRfkBgLO4UAKT4djr7tRQ/h5Bj++/u4k
	g/rxAXEdlr4lLhQ/BkYMWX/YvR3tO35Q5iKWGE80J/vS8B4Oxvi4rXehaR0VHA==
X-Gm-Gg: AYBFou3cQHhO+2aLqgbYzJ5jF5hyQ4q/9Pmgm8NgEqQSfWv67fmLZZxlIpFz6rvDgOJ
	pYuYRf76s/BuzxH4jef7nlWZYbO2xmoGIYc4SUEgHp0gsZakvvKN9yBYzPACI0kie2Dfls6gPXx
	lKEfRI5SL5ifjqyTdv7/dJ+dwHC7qatvlWkLGtkztEDp9JzyRTD9HHQhUMjRgR629MeDJvdxjKM
	JVm0Hju92ZKy4YfvOhYc5o8/CvYc0aEacMMkMMgpmk5E5U/6RKdEhL4YKrEdT2v8qBkNvH0tVbr
	JwSxEpFDtunz1Kx05dHlSPMmt8MoA19W+Y1tDVEOSTEVnlBAdZOxWLAXwV1FK9z6wIgWdBA7KZ/
	aD2nNETRGU2cHSKruDDX+has5g+LgbzOeva1F95xBPIYnEujLUhNCJ14TrcGUU33BzuCZ38hF+Q
	pEXz8zoWF7EsZySAedFQw8Ew5Czt++uHgS01Ds5LuPaJCpyTMzZmNhOnqsY2WFl2ZY03awq6UrC
	VDu5EixqBWpVl7Boa/lPGPQLSvXp9YEuK4t
X-Received: by 2002:a17:902:e745:b0:2e1:35f0:6837 with SMTP id d9443c01a7336-2e135f06a54mr10373245ad.50.1790553809376;
        Sun, 27 Sep 2026 17:03:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 10/30] python3-bumble: upgrade 0.0.233 -> 0.0.235
Date: Mon, 28 Sep 2026 13:02:42 +1300
Message-ID: <20260928000302.2528437-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130397

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/google/bumble/releases/tag/v0.0.234
https://github.com/google/bumble/releases/tag/v0.0.235

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-bumble_0.0.233.bb => python3-bumble_0.0.235.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bumble_0.0.233.bb => python3-bumble_0.0.235.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.235.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb
rename to meta-python/recipes-devtools/python/python3-bumble_0.0.235.bb
index 32a1a15986..abc77317b4 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.233.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.235.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/bumble"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a775f1b11285b6abedd76748d176125"
 
-SRC_URI[sha256sum] = "0883e2dc744f0b8228f5095f54bdf8df7f74e47d92bc5fd97ebfc2ee48630f54"
+SRC_URI[sha256sum] = "f6b55ae688806c7ac41e8c0f63df912e106f49050c9250c226a95ccea69d79ec"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

