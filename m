Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9784AD3C537
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:04:52 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13855.1765368283599917565
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JBdu1Q1n;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-343684a06b2so7122421a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765368283; x=1765973083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMVDhvxA3gZQvGSbtke0FOiLO7BZSFXJTrXRujPTKa0=;
        b=JBdu1Q1nCuFriok+fPmb/ypkQvHQUxPT2BQ65c8mWUb1vuG10HpcWjwtSBijgd7LWc
         jBzlQMRUz3pZNw0NIgC3nQfZsr2ALPMjkscB5iR7t/rdR8rO6qtJ9q6Csjjy+z01ytiX
         XkEgqgoMXMiq2vP3oLXUlf3TiAadtGn9MMLX9Hh79DbreajjMNC1WmSthZhnq9OscmyG
         YttMr5PVJWsVhelWlW8lR9N4gpZm2pFPsKRqwLzvu7stBWIFQzjELOKGni2AOd7OkywN
         nqS3xtiQWZO3M+DCB9HsC6EwEjjckVAmF0IY3Wz738Wrcyhd4o1R0Hfj/m5WCXXPNMIx
         scQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765368283; x=1765973083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aMVDhvxA3gZQvGSbtke0FOiLO7BZSFXJTrXRujPTKa0=;
        b=gOEwzM88/fXxLpwSnou5Ph8eNnGx3btRNVNFkaDrcaLgJFZ8RM8nE0YjilCCsW61yY
         ow7GSUW/jTsBDlPGT5uGH+0Zbmr1D6MFSzoaqMbAeqWp5VO/67RNFKxy4Tk85ciiIAFA
         C3Q5Q6malKkZYhGDI7lX3UYMm9vdaJElsoNufHShdNXi6WxU5QG1wnJRJSXHOW2HcRv1
         xh8AX6TRgx1T5CaXzFw8kkRSPdtOysOVFCH+dGZIWQGLM6uVKm31Ns0pikebCrdnUHrG
         TS435eEkaO2PjSbTPkzJa53i2Ggt+hvTKaqng0T2KiLdN8zsI4uHk+gsb4FD7ij6l2CF
         saMA==
X-Gm-Message-State: AOJu0YwPMjirbqK+pfp7kFmXsFZHuy/lvoy109yUentpTogM7FDQbMOx
	BckYVwZPHwZL4Zn1ZQHwZQiy6iHykRrlkED0IjifIHe7vpempweRp4/s/Cjk6Q==
X-Gm-Gg: AY/fxX5IbjdOpFCbGO0p5i6hWnRmRATzfRnDh6AQbWmOwlZp3qPBaKyRaG6ZjfGI0LZ
	2vo0v0tP/nvd+WMyXfgCJyXWy+Vq4HfttpzReL+J7lIcEdEjk2XWnrVvhdfXscFgg+dNyLBVCSL
	Yw3IQ1g72T063KJOy+tljOurum0qx+1nOnBQR0nqIpkTPgB3CnDmwe+ddfp+eWsoThOjW8xSxgO
	WrAM37DE7rHi/5dWg+3GXuOMshOuxOGfbocejJZtufHwlkLpWeNiYDbyrNK/SDd10P9K6BdRxoD
	Nld8r2Q+Fw10UAYLpxaLJ585JQJZRFogajH0ReNN7jWAcHuQtAaMCCCeBBURKdMUijiWeiSdvuu
	HSAq4TkirF0jKW9qE7yhpEj3t9jpa/i9yQsIkue5Dg9/YNnhb4loJMgZ1KuA/hQUpsJ94R9ANV/
	YZdv0cSHQne+7lECzbZ5ziBA==
X-Google-Smtp-Source: AGHT+IG7kZ2JcOPNw+OjpAD2BUeDkzt+dy8keBkKgNrRAk0gIS+DB1/noPiJNqzU2nwZRlFpMEylSA==
X-Received: by 2002:a17:90b:2251:b0:32e:9f1e:4ee4 with SMTP id 98e67ed59e1d1-34a7287a3b8mr2287016a91.17.1765368282690;
        Wed, 10 Dec 2025 04:04:42 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf686b3bad4sm17767759a12.10.2025.12.10.04.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:04:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 06/43] lcms: upgrade 2.16 -> 2.17
Date: Thu, 11 Dec 2025 01:03:20 +1300
Message-ID: <20251210120402.4179289-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210120402.4179289-1-ankur.tyagi85@gmail.com>
References: <20251210120402.4179289-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122510

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add fuzzers foundation. Many thanks to Amir Montazery and Open Source Technology Improvement Fund (ostif.org), Google, for funding that.
- Add ability to disable building tests in meson
- Fixed gamut warning not working on certain conditions
- Mac sequoia added to test beds
- Add the possibility of duplicating a NULL context for cloning defaults.
- Small cleanup of CGATS parser
- Change computation of profile ID to follow actual ICC spec (yes, they changed the spec!)
- Allow to apply color management on memory blocks > 4Gb
- Get rid of samples on meson compilation
- Increase coverage of premultiplied alpha.
- Bug fixing and cosmetical work on sources.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 70fe5394f9327b1158eeb4f2ac7384a076ef2300)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.16.bb => lcms_2.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.16.bb => lcms_2.17.bb} (82%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.16.bb b/meta-oe/recipes-support/lcms/lcms_2.17.bb
similarity index 82%
rename from meta-oe/recipes-support/lcms/lcms_2.16.bb
rename to meta-oe/recipes-support/lcms/lcms_2.17.bb
index 9422c7330b..616bb323c0 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.16.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.17.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e9ce323c4b71c943a785db90142b228a"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d873d34ad8b9b4cea010631f1a6228d2087475e4dc5e763eb81acc23d9d45a51"
+SRC_URI[sha256sum] = "d11af569e42a1baa1650d20ad61d12e41af4fead4aa7964a01f93b08b53ab074"
 
 DEPENDS = "tiff"
 

