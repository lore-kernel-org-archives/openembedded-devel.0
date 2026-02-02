Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984F0E7DF0C
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 16:37:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57086.1770050242117849550
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 08:37:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l2Fnu+0s;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801bc32725so35355915e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 08:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050240; x=1770655040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpCQzsd3KFNCqdZeXsYOV9DDhxK9ncFX+nAHDb22RPQ=;
        b=l2Fnu+0sMm4CjgjCh8Vk+kA2GKCAgqHLQ7X4iNodlRhVz3UUo0JaQzxSPiH+M+EGYx
         kBZFdsSSo2pYcO3A5Urj37hOmUvRi4XWDXt1ZQ87Pz95u7Ou4IZEWWQ5jHusU3hrBDxU
         N8YtEKcOxHwZ9SJjk5Vp5Bn3yw2CF3GhZLhItEI5xHp4DxC+b+sSS4p3l2fWtd+JekKc
         ZgDQoYH8VtydCx/PXXk5rLFx2Rbd+MHJD4G5CqCBIediHcS8fK6JxBJ9vocZ6Gjc4Kgm
         NDtsUyLY9VsA7WM8S01Mwtc/zjmY4WUWfSzk51jSAUHdxTuuJzd1NlgAe2ojthuEwUpE
         sd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050240; x=1770655040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UpCQzsd3KFNCqdZeXsYOV9DDhxK9ncFX+nAHDb22RPQ=;
        b=mQ3PN6tdHbxMyqtcNKMpBs5dKMgUa1W3GlGzIEIRguTHIWU2a8k3nP+VLcwzHf+5vV
         DhG4gKD2VY3JWNwM9mikxrSERmnlULerdaY22Pzd0LzHu9gkeWTHSL/lkR0dAGKvjQ2+
         APTkiqwSqw0qMsYPxvZoJiBXVur/o+ryZUiC0A1eYeLR9JLfPVP2cfU75NM+QyUQ9BtY
         tQLS3zubId4WA0ezrzjkh+jJQyQMnPrcnMvlzs2lNSS0LLlalqv3m1x40XxO1leWN/gx
         LDCwWB5Dvw7MmR05laYGULnYCNHQYI+AjYB2KNpOU8gFMqWpEs47u//0qKvOmLl3DWSF
         4ruw==
X-Gm-Message-State: AOJu0Yw9v/poEdbAFwDtcIGL4JC/y6J6UmGBICEbmdctGpdbNhXtYfjq
	u2tMrCMeSJqvc8zT9AcCELXgzq898szk7EajZs4UqyCqeg85+zQZN6xql7DEOg==
X-Gm-Gg: AZuq6aJCVqlQJUDVgzHFhN1A2oNExX9GrGLi2LJLNuHq73cLX+QzI+dOO4x+HuLrdTM
	NTHdJ/VJ0RiRvOI3GJi5ECZyRTCaNck9/nv4xGduj8hDmiJR/Y4C0iZlRr167nMAGWBIX6uJpOb
	M/K6POees+f+6HSxf81MKV1rgLIZJsIKwyYLvGtksy44tC0RNgN9nO6ztodBxJ2BH9aTM1eMOcA
	vDGY6B689GBiMwX/w3s1SUVp3DPQwLMfRwyubHi7mmQUNcZlZgc9Lx5WMxqpC3o2CjXfJV0WU5k
	JYQfJQdzJbqV/yMe5yfaPyLe8nWA7odV9VHJx3o4WUlQbqy4ej2mFVLvnLQOVcmxh2sn225tAiY
	unCtLMpo/PJmz8pHdY3WsfKN4w4CS8TWLQHjMarrs/zy1DADmREuPJhN0zd3gnCaQvNFlupg90N
	WqwJUe1XFZ
X-Received: by 2002:a05:600c:4ec7:b0:47d:586e:2fea with SMTP id 5b1f17b1804b1-482db46b38dmr163285955e9.15.1770050240423;
        Mon, 02 Feb 2026 08:37:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051372cdsm451395e9.13.2026.02.02.08.37.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:37:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 8/9] python3-pyjwt: upgrade 2.10.1 -> 2.11.0
Date: Mon,  2 Feb 2026 17:37:13 +0100
Message-ID: <20260202163714.2359370-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202163714.2359370-1-skandigraun@gmail.com>
References: <20260202163714.2359370-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 16:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124069

Changelog: https://github.com/jpadilla/pyjwt/releases/tag/2.11.0
- Fixed type error in comment
- Make note of use of leeway with nbf
- Validate key against allowed types for Algorithm family
- Add iterator for PyJWKSet
- Add iss, issuer type checks
- Improve typing/logic for options in decode, decode_complete; Improve docs
- Map algorithm=None to "none"
- Correct PyJWKClient.get_signing_key_from_jwt annotation
- Fixed doc string typo in _validate_jti() function
- Update SECURITY.md
- Typing fix: use float instead of int for lifespan and timeout
- Fix TYP header documentation
- doc: Document claims sub and jti
- Resolve package build warnings
- Support Python 3.14, and test against PyPy 3.10+
- Fix a SyntaxWarning caused by invalid escape sequences
- Standardize CHANGELOG links to PRs
- Migrate from pep517, which is deprecated, to build
- Fix incorrectly-named test suite function
- Fix Read the Docs builds
- Escalate test suite warnings to errors
- Add pyupgrade as a pre-commit hook
- Simplify the test suite decorators
- Improve coverage config and eliminate unused test suite code
- Build a shared wheel once in the test suite
- Thoroughly test type annotations, and resolve errors
- Fix leeway value in usage documentation

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/{python3-pyjwt_2.10.1.bb => python3-pyjwt_2.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.10.1.bb => python3-pyjwt_2.11.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.11.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.11.0.bb
index 0a928dc2fa..4e81efe45f 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.11.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9381953"
+SRC_URI[sha256sum] = "35f95c1f0fbe5d5ba6e43f00271c275f7a1a4db1dab27bf708073b75318ea623"
 
 PYPI_PACKAGE = "pyjwt"
 CVE_PRODUCT = "pyjwt"

