Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E87CA6007
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:23 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6894.1791371299103201120
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S927d6aT;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a813079a55so883329a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371298; x=1791976098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+W/iWpR4cV4XGuhPKcAX4nR5kKCFAxB+0BACS7e66nQ=;
        b=S927d6aT491N8rSDKYC63nWtbDT2P7BWv7FUetakiXiXPe1v9IAAp/zt4OGTMPQD+5
         6Kp7cLFgosbUkDala3NpDjQ+BYmuQbFA86KMyUsjxhAqqTu0qIPU4adNe2U6NaJRbptO
         Qc1MLvfKDTLJ3UTYl/rBrOeMdBDdPP8GPTTK2UolZqsZlqUPsllS+yTFOP0yA+KNGMUP
         Rs/Zl0jQ1JafGXE2UHIwAWZ1+LwXvofkzItA+nJBm+HVcuE2RWLXdOWXRPlUvDJkqc4F
         uR1xx0nC5qXxuylLjHTsEzX4gMxi4+tKEUwmBJ1vkK0OtnoP6jIIQtNVO0CgYU/wck4P
         k4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371298; x=1791976098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+W/iWpR4cV4XGuhPKcAX4nR5kKCFAxB+0BACS7e66nQ=;
        b=HwXhZMxn87RARGtKNeCI2gSPDIjoAf+l5LCrL490E6h7Cp21/7737tsdG82x5SNpId
         XvscyRUdoxa35sNWyJOSSflixgn5yHrSfBW2eA2RBgrQebXQf+pULWLhUweZg0YYSkEw
         1qC85gzg/YVGxTAGcWHSTkyBZVngrp24HmwZqHxQhcmaXrY25m45zPeW067ZwU92sNJX
         cZw9TVMU72v0MfElN14/YyuY2PjjxsjjAS1sY+kfilxbSoI5rouZ40UyzwLj4VkhWApK
         g6PFcP3nC08fgRgcB6GZfw5Nx9n/LxwmtorPu+69S45SV4tO75asu+7Dmw9GR83xr40u
         vjaw==
X-Gm-Message-State: AFq9FYLfeU4OLOUSTkxRUMo++f/rGYhFB4wcYeO8c2Svm0U6dxlsVeW3
	/SSYaKDWpdjAlti6Qlu8TpsiqIZDoe9ARfeszXvE/62+UBd0El9v5BSF545Hxg==
X-Gm-Gg: AYBFou07ddCm1nU9+RtMrPvyE1UBlK72rcwrRFi+Le/xnsVVAAX5fhk95jC2CA58QEF
	artrvk4Wl9edmdr1yxRXyX8f4ZT1zZZG6qrzbIaYQ5ajqZdt/SCkm4YPgffIisXRmsv0eqn/+c9
	PqmP4U+Kj76djUSpCXWpaV/tt4Rd5XrLFCYGuiFSzQc6y9cQ0x6anT0PsaGz+3Gb0oP027+cYhD
	HVwf5Nd2G1ohk30qJ4TZu2G9zBDa9cw4CXuJzOru/c1IoDZhBBCUOUZkYrbgabKTFecucO/bULa
	GqF9awTsCjpJ/n4bx3yH5d7Qpvwp30L4D5R2H9W95tIkiDqiUcGAW9I6VogIRGFVaiJYIQEckvB
	t6qlEa8O775CJzQ+3TXlPr0ZyPccIZt1C75B1/hFas4t/uTu+v/avBU117V6Ri6MbYO/1ugHwlX
	9CdOkPoWnDVq1ow5G7+C486H6dF4z9+f2b9r+xUn9lKPfK9weNPAnXFi/DAETPgpfx7BK3Yieiu
	A7eS1BK+k6HqwWLhJjQpCXKaAimGOnjIQ==
X-Received: by 2002:a17:90b:4f87:b0:3a0:e985:9ca2 with SMTP id 98e67ed59e1d1-3a8a13bdd81mr908372a91.31.1791371298492;
        Wed, 07 Oct 2026 04:08:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:08:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 10/15] python3-cmake: upgrade 4.4.3 -> 4.4.4
Date: Thu,  8 Oct 2026 00:07:35 +1300
Message-ID: <20261007110740.3179543-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130652

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/scikit-build/cmake-python-distributions/releases/tag/4.4.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-cmake_4.4.3.bb => python3-cmake_4.4.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.4.3.bb => python3-cmake_4.4.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.4.3.bb b/meta-python/recipes-devtools/python/python3-cmake_4.4.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_4.4.3.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.4.4.bb
index 54abefa8ed..4aa0b8b208 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.4.4.bb
@@ -10,7 +10,7 @@ DEPENDS = "ninja-native cmake-native python3-scikit-build-native python3-scikit-
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "b0c2703ec0a624649dd184c0ac5ee4c7f5fe5ef35eb82f9da44f5a0903adb2b6"
+SRC_URI[sha256sum] = "f337d18e33b116cabae9a7a8ff423fc0bc3f389da0acefeb724e1397128dcc34"
 
 SRC_URI += " \
 	file://CMakeLists.txt \

