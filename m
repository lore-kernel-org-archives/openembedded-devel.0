Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A339AF419A4
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 12:28:43 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17670.1776256119143107042
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 05:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Cpri2g9L;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so58841365e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1776256117; x=1776860917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHAFeqdcVO8sXPi0IgjQwbdsy13/xfrq/v3E6uDgj5E=;
        b=Cpri2g9LyIa2JqtlbgTtIe5AZIdysvIbyoZYywpQZypdfWWy3uyeDVMppg4KqYXW2t
         nSBkhf6ZvlH2SoRpXeH1hPAeLOPQ/+bsHg0xpWeKfObEWPaSCNOmosIjCV5l0RPx/dst
         Dgl+f2kvNuELNGDM3jKE6LadLY+wFpojrwWv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256117; x=1776860917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bHAFeqdcVO8sXPi0IgjQwbdsy13/xfrq/v3E6uDgj5E=;
        b=kkSPaKmWETjnMTX6MOYUzvHTQ+4WoYagedWW9B0XRD7v2Fu8sF8DVsJeUGcwYtoWwt
         KQ0TGyAzC74fKZv76LvusYC2q5w+jkOhILqrwR3f0ofdZ9+AJYJ164xCtotJma8fsP9h
         3XWAPRwULtUp37cHBzfXqR6PKG3rInVbxxwR4YtdDTFN0UHmAwAH2va2EbRccuHmctH/
         kxSlMEoEu8nb3TrQWTMtxw+n0J2LNjEhK5Y+UvD/L7fRSOaiCd8sayPSrUJl/S/2HqKz
         mPt6uBdkb4Pq1fnqAlrvVjGhKo6cLy5jZIgvoSHNV5miuLeKrX68CevfhMRfUOcEVbfX
         nJlw==
X-Gm-Message-State: AOJu0YybeoGAJufJ6DqIB9lU15nIhmypWmX60zfa5FhENsvfsXLTycLM
	d081tFBvb32wY1kE/ASP8eNYtEIchP7nOLLY8lXK1p9eiketH7S8Jc7QkAGPx4xqL74Gy+RWrm+
	qXTHB
X-Gm-Gg: AeBDieuEUlMWO/wtBYVJlw38hPcqJ7SHha4E0ffYio3qdAVuxaHbuAzVB3O5W3avwvL
	Ww2OL1r4Q/DJ3zjqDi02OIvkiZv53x+hM9YjywLhYTusBBplUVWx5NvwAfwm/LYcYFBGRMdcpwL
	V6BoG6wPoKo+EAM0PK6c83jf26tCaPwkFuXGTZsXu6c3OgVE4FSVrzUp9LAq+QRA0fk+VTHTChv
	pMedkaVE6+oSUfsbXLqeR+Z2okxkfuC+J6q9fhaxxHCWRSzcGgTk9/eYkoqtXBrZx7sk3J4FXcs
	0ORBUuKguQaFED4oVAqZWLhmYAkUYg0rfu3FcOIk1gd5Ne4pAZqQ+DhOqGvmCAgZlehIasjjBVa
	nKQtmNo7Q7p0Nk6ibSLEiDtIDWwyWWcgnZ+TlZJ/yCGf/GGpBEOE9y9kxEgwkdIdtqUsq0pMWpY
	MKmvi45Qu31BW3MxITYWNpwxFhea99NuKRWK3N
X-Received: by 2002:a05:6000:2010:b0:43c:fde7:f1 with SMTP id ffacd0b85a97d-43d6429b884mr32253215f8f.18.1776256117077;
        Wed, 15 Apr 2026 05:28:37 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5c8fsm5135031f8f.19.2026.04.15.05.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:28:36 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-moteus: Upgrade 0.3.99 -> 0.3.100
Date: Wed, 15 Apr 2026 15:28:31 +0300
Message-ID: <20260415122831.955529-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415122831.955529-1-leon.anavi@konsulko.com>
References: <20260415122831.955529-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 12:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126358

Upgrade to release 0.3.100:

- python: Fix compatibility with older python versions
- Add configurable faults for position or velocity tracking error
- Work around a linker warning with newer gcc
- tview: Suppress warnings about importing Axes3D
- moteus_gui: Include registernoop.py in our generated wheel
- Replace setup.py with pyproject.toml for Python package builds
- Use ::isfinite for Arduino compatibility
- Implement support for the RLS Orbis encoder over SPI

Fixes:

WARNING: python3-moteus-0.3.100-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with setuptools.build_meta,
use the correct class [pep517-backend]

License-Update: Use PKG-INFO

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-moteus_0.3.99.bb => python3-moteus_0.3.100.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.99.bb => python3-moteus_0.3.100.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.99.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.100.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.99.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.100.bb
index 3de7f6a0ec..fe12809d78 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.99.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.100.bb
@@ -1,11 +1,11 @@
 SUMMARY = "moteus brushless controller library and tools"
 HOMEPAGE = "https://github.com/mjbots/moteus"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a83f0e709a45e76"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462545aeb1356ad23"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "30d3cafa6b23692536102f52d9a7d919f2775fa75bdee087f98782c7e3c88805"
+SRC_URI[sha256sum] = "cab1bdcffc18b83ebb52066b1bffe6de7c1354b163b3bd63e430b4fa04fbc6b9"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.47.3


