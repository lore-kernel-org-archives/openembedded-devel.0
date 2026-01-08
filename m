Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340DAD185CB
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:53:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3997.1767869615672413675
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YVz+8fBz;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47796a837c7so22583145e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869614; x=1768474414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xip1kEeWciGe5mcJKLrn2Rz/alQldRjYaMMqO8Sc2o=;
        b=YVz+8fBz/wINYxF0TtF8gT+71Rw64AlJDa+4KgSLBjsf68KIWHpc1Hd6KufqhZJtyp
         FdBaf8F9RhkwoTg5CKW570oY5ctgd4MumMKBZvgkLXyn+sh2RH61DydrdymV0p1MVRWj
         yRPqd1j2cGx8eX13871HsSHwAjDqnCPc/vYWED3+J0lVmv4eGCD3Ag+Ap2w/eR3Xsy04
         qPtw0oxbID5vtIh3OqH4Cy/XnEnyXCXs4rQkAWIC7pWSGeGIxYaOeprkDiypqsHG43Mu
         i8VFMF2m9BZyKCNwbk0plwl1Wwz0BxvMNyINeMwknC7Yxfk1EeA1n/Gr763zdMtNskce
         ZZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869614; x=1768474414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7xip1kEeWciGe5mcJKLrn2Rz/alQldRjYaMMqO8Sc2o=;
        b=Em3lUWE6feJMMi8Dc9GVL+9rS9mmiW1fum4mv5uPOq06oB0JL3P6CUY1ooXGb00bmg
         499KLb762u2OlxXavVUGpE8uimwstx930NEZUJX390zy2JsRYTplZ0vOaDtM/Sha7L5f
         Ak/CKOTZhRDD5oRjFHIl+qXwfsfg45XLx7Aed0P2LI2VktVFovCo49GSc1GsqidzdThU
         7BR+8//RLrr3kFM8nqSUv/Az+C2HHsbV81xMDvMoWFXxw658VpoCnivoB56kpQWsGmIE
         3Md++hHarbeLFNEPt9PXg/xldTs4OnM6Fv8BiCgFHGs5V+vIJAbNVanJyYaoshmN02Pz
         MVgw==
X-Gm-Message-State: AOJu0YwCsfkkCrpuIbK2O9h3053bK3DAWMoFZPVqvFGC/gLpyCQnh7qP
	X6BF5OdrrnatlNW546CDolto+5qliECIUos04uEK2Q/A2qFKp8uq72vsQFLYBA==
X-Gm-Gg: AY/fxX4oZGBEENqMZ7bDUgFQxFSgL8IsMLiatRHPSLMoiH4e0ALv01VcVJnm4opM7dB
	XuX8oqxtuons0O4zhm2SQa/Prmdw6VNcCusHa2d69soR0DqVfz21IpxgFZBE0iqZVQ/nHN8c3yY
	uovYDbJfkJxpy+59dCNKU9n2Yc/09WnoIYcVEALAaZ2Bk4KP0SUJ7FDFiyB3g6Jrvq/eLWDKEHJ
	GJUw/ATzCk4Q72sUtYYm+kjruevnFvuLuRq1k9ycz0G0vsoORNJ0LNua9XaES9XhRCXPxNruWcL
	nt+240Y5FQcoZ4dopr3KwjMxx+fLNe7s29t3uF5sjJa/+osvNgKKB2Pm8YvMhrJjR0zdOrEKUeA
	NV8Uf64fCg8u1JLkyoucyL3YfFdM/wR/o2O4T61S57oOO5eFXjidt3DcQ2I8a7UVd+g1oQtUc52
	Sa1z9rHgoM
X-Google-Smtp-Source: AGHT+IHZK0SA9dzjXnR54SkbVERl/Pw3urGPPMzdz+wvecovI8s/DbRUcot9KaYNmv+znHLU95FgtA==
X-Received: by 2002:a05:600c:8217:b0:477:55ce:f3c3 with SMTP id 5b1f17b1804b1-47d84b26cfdmr67194795e9.5.1767869613971;
        Thu, 08 Jan 2026 02:53:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.53.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:53:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 02/15] imagemagick: mark CVE-2023-5341 as patched
Date: Thu,  8 Jan 2026 11:53:04 +0100
Message-ID: <20260108105317.460246-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123256

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-5341

The fix[1] mentioned in the NVD report has been part of the recipe since
7.1.1-19.

[1]: https://github.com/ImageMagick/ImageMagick/commit/aa673b2e4defc7cad5bec16c4fc8324f71e531f1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index a8029426da..f947b8e9c6 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -180,3 +180,4 @@ CVE_STATUS[CVE-2017-5506] = "cpe-incorrect: The current version (7.1.1) is not a
 CVE_STATUS[CVE-2017-5509] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
 CVE_STATUS[CVE-2017-5510] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
 CVE_STATUS[CVE-2017-5511] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-3"
+CVE_STATUS[CVE-2023-5341] = "fixed-version: Fix is included since 7.1.1-19"

