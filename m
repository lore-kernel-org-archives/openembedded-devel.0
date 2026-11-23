Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48545.1795411888642564482
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ovwxjt2P;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-385d8a00598so3934848eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411888; x=1796016688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8YHFmf4kxMuIAX/88f1gnO1+lrIEvXMm0mou2jUOlc=;
        b=Ovwxjt2PaAmiDDBTvcDH98S8vF7xgpVS0uuMBS6WHM0OEhD0acFWQccZzos2KNTjLg
         BapwyPQbhG0tgg+nlXRfHlhbdS67wfQ1iwYEL/ViDllLNv+EfB9EVMO9BfpvtNYR0JvC
         euGhveJALdX5S/gy9OT8quFFAiX+RhoKg3lpke2IwA1IFTS51kP85NwyCyNjKApUkuV6
         RJ61Gtz3tVHIHjHX3Xqz8nIqBfvFTO1FmlIQbYvMobcopXv63Sx55T4YpC8+HOl3K68R
         r3DqDk4qOULdztlVx4rxlkOr/ZcW4kcN10F7OiEiQDgEl1QYKidLB3F2h8qp00fwA7hZ
         vvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411888; x=1796016688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8YHFmf4kxMuIAX/88f1gnO1+lrIEvXMm0mou2jUOlc=;
        b=PSYTIeHWf0rAsheLdhHHRHTpVSi+i6UgtRmKpMvZCu9DH36BRSVo0Fd3XOxXw0vr04
         3t2N5+orhSz7pjcVi5uUWFpJlpAIWnRaZIkFExhtUc7PuXKV5XxRjE4WihbFrpMYBLP+
         5EykpqJy6QGvIGKL5x+RCyGv3BShOqIg2QZ5KAttLY3RmQZmrxWN6it4+WpvZqQGPUCX
         eDL0n4YM5r55Fcuv8Eb/G5nHLMTajw1oIaCoMkn16ribVqzGgv/MwrbfspA57Tm8fIKW
         e9oK/ryq5Hl5Yk6we/An9T2JQSsYOVCJB8Qp7uPU+1L9WwVVXGU/df3RtCUnEnyRktYD
         yMwQ==
X-Gm-Message-State: APuU4Z/Ky0ckpuDA/+qGikW5ACJwQwEdlwO+5kuhhEX/+9wEwuKH46kU
	ypfhFGml8jEggP8T3APTibaxc2oarNVWFRJjQyOLeJx8lFsFtXiE+nWY7YhlCTNCJlg=
X-Gm-Gg: AZFdTZchIAJv937Ng2sfD0SL5cAlMrEqE7LjSELBtnC5ZrTofUhLpOXLfPXQXmVU+Dy
	tcvEJQdj3zuil71SEHOlKXgiXHWXI7EEbbvZYp80jigtZzG5I2K9cb8S1ZMnWPnSD41o/aKofsc
	BlTJ2BlS0RY6s01tfHjfDWuMW0oWyescEBInrCfZk5GTCINykddk7ikqS539C9gD5qpGi6Pmt1w
	LfaSJ97/gA77UfsMXrurTsSXsmR8ZuG4zEkjVh+sGtM3RO+o5MZQdV4MLRiGG4h+UmThWArZYAY
	R62AtJTPHrTyZGnV4+XaqGye5l6JkkFJ+BHeidUbSqzE3aD5E0dgFc/6EHQWiXEKji2r/CF0pa8
	lwDvU1MVrDkQjIyn93qzW7F6OMzt8Dypi5M7einLXszQWkJHDkWK8t5xcemqxw/KOc4rk34QXqt
	wkJx+dxL+MFCVdp4g6Uk7vnYCwhNapFSiVxw3FE8uzz+/AcpEtC6bL2CBMSRlUlj6GPs8g5LBCB
	5V/X4rPQl/rdPclzqa8WO9NlvE8MVixn7JWN0p/ONPLoDcChG9DPZbF/PBx8Z1nlS2MTcW9vif0
	vyf1YuPk/3spoyHfeol5a+jso6rdeVosWVqvGcf4IF+KZzDLbCdIw4JcB5mwHEz3EfZZVf3+9T4
	J3MtznfiEd2x8UtedUXuE041qNo+pxtBaw8FVuW5QQz89G5r76SJda1De79tyhlD/NKJHPVLXMx
	Nn87LDM8x0l8fi9ALNcoiWnFtjeMCGc91fsVPiFxBJ2FcjuW/naqu5uGyug+xFzNlPzqutmX/Da
	Lp9YVvG1DNiy0abZlIRG4xH+h8V5DwQrXJGmZ8zZxvnY92hkS/qQ+wduZpSrinjQ+pSS2VOuYRo
	UQYr
X-Received: by 2002:a05:7300:d941:b0:385:4b9:18e9 with SMTP id 5a478bee46e88-3856f94f874mr11673233eec.18.1795411887927;
        Sun, 22 Nov 2026 21:31:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 01/16] python3-coverage: upgrade 7.17.3 -> 7.17.4
Date: Sun, 22 Nov 2026 21:29:31 -0800
Message-ID: <20261123052953.3658549-75-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132862
Content-Type: text/plain; charset="utf-8"

Bug fix release:
- Fix parallel data files named with the hash of different data,
  which could make combine skip them as duplicates and lose data
- Fix lines/arcs from other threads lost while data was flushed
- Fix a TypeError on Python 3.14 with pytrace after except* handlers
- JSON report show_contexts now limits contexts to each function's
  and class's own lines
- Wildcards in the first [paths] entry are a configuration error
- Config files with a UTF-8 BOM can be read

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-coverage_7.17.3.bb => python3-coverage_7.17.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.17.3.bb => python3-coverage_7.17.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.17.3.bb b/meta-python/recipes-devtools/python/python3-coverage_7.17.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.17.3.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.17.4.bb
index 6582369ca5..1120b003a1 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.17.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "6695d1bb2a9a2fbd7806d69d78cf30f35eb0f65045da0ec5b5045242fadd6a78"
+SRC_URI[sha256sum] = "25ed180a4fb75b487509a4568acead1de41aefab8bedb06ac1ed5c14223fef97"
 
 inherit pypi python_setuptools_build_meta
 
