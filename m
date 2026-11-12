Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8020.1794465925145210887
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PXQWQeEf;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso5939235eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465924; x=1795070724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2uEK9tXCTkRXl/vnhnV6CHikWwgS0ta7DRX4Lx5Eyk=;
        b=PXQWQeEf8lx48/MawY3n6x6CSF55qDM/j3M3GojWc5Xccqbxe9VKr4cd4AufD6DRBJ
         UTPuJYxqJ1qb4Ka9unHIk8PrL/7qPYbGujBVa7wsqVuIrtpVu1pl/7pUUmHkOp45uJBU
         6el/k66qCPdPkf2ITndWadfkxprJWsb6VDgvyfasqorRs+zaMY2EiS/QcBnoyQMD7P05
         DajhErp/Fz5+qq2ZadXb7s/mkPegAj0aPv8Xfha852UTUTfyUeDMamv+YpuKLT1xTA0C
         /iGb/T3Ggte9tYg1FmQNgby2lTy4RbUj6wHGPXnDiHT0DY8H0QIQMbTAQrmYhLjbgA8t
         ujHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465924; x=1795070724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2uEK9tXCTkRXl/vnhnV6CHikWwgS0ta7DRX4Lx5Eyk=;
        b=vcc8MWmuzntaHcmdizxWjEM+C3w3a4uoSE+vB+iGz3GjYh01eM1iqTbguuZ/slEMfb
         P2VeiehNhJi2bNEp0nI4iCVKzw+gky9yoFg6ajo1QATUKoWRwkPakwmtuGzD6UnwZev8
         ZagNGwYSl16vEGW8Xp0q9EhBM731T7tJUGQr8Ov1DnqM2C76+SN7xfLG8pUFg8UKdV/X
         YqUBced+h2l3MeM0RMlnX6TUmT/mlpF66Ffs6M4wZH8WGozdib/TJ7AnL5t+li/qJET6
         py6U2XLnPB5L5VVbIZS0Xhogr1FAqoPsE+dCqCUcGkKVsu5AFhKtl89XX+33IVdrqwwG
         ngVA==
X-Gm-Message-State: APuU4Z9jb8AQxp6O8tu4Ol530gkns0+D4Y/5j4KzTrbtdI6TLmt8lRe/
	yaIQiuw9k9+12+aDV1dEwOV6t4iIQUJNKNnWlXuviY5q4SzMDbEMKFxRmgqoR4e7VxA=
X-Gm-Gg: AYBFou1zgYg/L1q+dmLfWCZpGPnJpn44oMLjreP1HDDHZTWTTnJOYVexRg8NGCGRd3B
	LX1p7QiDH4NOapz15dY2QxudMCObvmJxQcTZz4rlTJ/TTj93uH14ZMMaOCFUEOGlnHiWKo0E1nz
	75PSHWsqX7D0iZj0aNClI7oT0ASrAQalajILn8aLBh8yb02y5bA+GPfbG7VwawsG/TUeNJURvPp
	iHWL1AhlIaDrMbTQGdqth2CTUE67sPD3Qp547Kf04h0zuiVH+81ng3fmrz5x+9oM9MFGmrxK6Oe
	/UpQECmYS32LyNH5tIcDdCfmCDq152CyRD54Tb9UI9mpNvo0fmopJfZak0UUkaNdm7CY//oFPOY
	3KoeMmEYg9xb4ERzEEw/yHpihBzUsF+iPMwN8UeO3QuMuGXV1xHaOGRkgP4PGaHTU2l3P3fBNkB
	ykwKuQSal2weHMFPjsd05nzQJWKgTiNRg67C/rTygyqdtA3m5oL1veE24V8JctB+V6y+dDA3LC9
	JkJ7uxJCikMtI3cxZ5SwUe9C2kZi6z+7oRGlfylnok4zH8QtpB1QiuEAeBp39BAzGiH3AWiSJo2
	hJWVD/m/XMuDmKkyS1wgTfhHhnDvw7rUmUDZm3+roUfbjUXj0YgfyJ+IpAtIFOyN8CdLfaGnkLV
	k7QpM/Zn8t/t7lzQH5+Lbylll/dJyw6cICmd3edZ2cTybgoBcCTUWh4HXLHNoKGpZUd4SXNJGpV
	bSbWQTr+oYLcVMNDYEg/9KK13+/hDqahP3jAGTsvvftRBQvNerk12uhiM/cdu/CSUT+Vnn7WsSQ
	JCCIgK/o0wwwBxarUQ/o5jGFm3vtc3zeOHY7P0C1XVN9lLMf9BG8An5I0E6Gn6/1T5TZP91tQbj
	iXXS
X-Received: by 2002:a05:7301:8607:b0:376:f1f1:bfaf with SMTP id 5a478bee46e88-376f1f1c1e7mr3756382eec.11.1794465924377;
        Wed, 11 Nov 2026 22:45:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm21055001eec.3.2026.11.11.22.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:45:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/5] sysdig: Remove unused patches
Date: Wed, 11 Nov 2026 22:45:13 -0800
Message-ID: <20261112064515.2411568-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064515.2411568-1-khem.raj@oss.qualcomm.com>
References: <20261112064515.2411568-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132196
Content-Type: text/plain; charset="utf-8"

These were dropped from SRC_URI in 0fa0257275 (sysdig: upgrade 0.28.0 -> 0.39.0) but the files were left behind:

  0001-update-cmake-Only-add-dependencies-when-we-bundle.patch

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...Only-add-dependencies-when-we-bundle.patch | 35 -------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-update-cmake-Only-add-dependencies-when-we-bundle.patch

diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-update-cmake-Only-add-dependencies-when-we-bundle.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-update-cmake-Only-add-dependencies-when-we-bundle.patch
deleted file mode 100644
index 93593b6269..0000000000
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-update-cmake-Only-add-dependencies-when-we-bundle.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ed35037e3ba575d9b0d1ef4cd5b6ab9111136922 Mon Sep 17 00:00:00 2001
-From: Moritz Haase <Moritz.Haase@bmw.de>
-Date: Mon, 14 Jul 2025 13:57:30 +0200
-Subject: [PATCH] update(cmake): Only add dependencies when we bundle
-
-Only add dependencies for valijson when we're using the bundled version.
-
-Fixes
-
-| CMake Error at falcosecurity-libs/userspace/libsinsp/CMakeLists.txt:184 (add_dependencies):
-|   The dependency target "valijson" of target "sinsp" does not exist.
-
-when building with CMake 4.
-
-Upstream-Status: Backport [7d850bad002b56ca5e85fffb1f69b4b1cfeddd91]
-Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
----
- userspace/libsinsp/CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/userspace/libsinsp/CMakeLists.txt b/userspace/libsinsp/CMakeLists.txt
-index 9794a697c..a82f8c0c1 100644
---- a/userspace/libsinsp/CMakeLists.txt
-+++ b/userspace/libsinsp/CMakeLists.txt
-@@ -181,7 +181,9 @@ set(SINSP_LIBRARIES
- 	"${JSONCPP_LIB}"
- 	"${CARES_LIB}")
-
--add_dependencies(sinsp valijson)
-+if(USE_BUNDLED_VALIJSON)
-+	add_dependencies(sinsp valijson)
-+endif()
-
- if(WITH_CHISEL AND USE_BUNDLED_LUAJIT)
- 	add_dependencies(sinsp luajit)
