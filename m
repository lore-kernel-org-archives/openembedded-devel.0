Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27.1794851781334384689
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jFVW24DI;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37071c0f42aso5535668eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851781; x=1795456581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdDg4rgt4TutKYFmSrcKWSxQt4DMKFKvqPBsV4VPR9g=;
        b=jFVW24DI/B9BSQUn9D1RJR7c2VogZxHo6FoniePrpbmCPyGnkmGUYK4AIJnT2RHldt
         OPxZcctCbqhg4+c6D6ca61Qceg8y8+7K+ab2MFouDplHNcfP6nH4xKPfJbFEPU+506R+
         ZF6Mm3aYLC3UZNC3wflQ18PMFja7OdAQ6O2i8MECR4mpHVRdo8JFVbStDDbE5LmFLZd+
         2bAOPi/YojCLsXQVGgv+e6JYq7k2+aSDrPX8jCnQzvB+Oqe5MyEIc/WGm0rwdjaSRJvS
         IwAeY6ZukTJ/KDsNKhOzmGJN+XuYB86ME3zoKzMoPOVRvyICLc5NP1Rf8fiijAh+r8qk
         cTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851781; x=1795456581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdDg4rgt4TutKYFmSrcKWSxQt4DMKFKvqPBsV4VPR9g=;
        b=vUY8KUMD1dJ4XYXNiU0qK0B5RL/iNQQPPNN9HxJTSFwsHoaZzb0CJuhQczfYBqebTz
         lYzRmcFoZEjF3ozu8Y3u2hN/X7nADUDNMq10B2jUF6Dn27PpofLXHnQuW6NBXlkj8njO
         AKY+EGHbz+vOv5ANvmGS5aiy6GwpQv4Yg58AB4Xcd15H47xzmeLrpSW27WdBym2hIXN/
         49V+XzT9gYt6UUC25XMpNpZYIWY8YjvpefnunOzpgKsxIY58TCc3alMFDvniZKxg5VBh
         gEjr1EI5N/lkjYAu1R5186OLWZeVu8ZXYkhGy9/KEgajLIlNTYlcPcZtI01ye55y9wxs
         rJvQ==
X-Gm-Message-State: APuU4Z+wge47+IMz21lqzdx+GcNgc7ZAqQQEDiDUjnftdIk2DxZ4U6NR
	iQA3kITs1KY7WsCZL3yfjZbZ3yV1F+BGZPakPIVBIL/VVIlp3x/Hp+lJ3oFkvQxr
X-Gm-Gg: AZFdTZdLyq0KGNz8LIklqi0z9wZNx60GwtqbmbKaPjTEHC8TXBlAH8aOwQY5bOZujpt
	0Dr2RM95sAhrO5sUualqAZKm71iofuuyMx1EFkVeGqkUiS3TKqv/Tmm7HPq93di0iJCHjCzSVbg
	hC4/A/GGhrcy3muqpYxN5xvFWMICVjpidX9meTOe1LH0+pyd3Sl1YRkpWNv4ptJHdGcfrkwo7SJ
	1LP4EdZ50CcEZ5xh8QfuXyqkXcODcZvFOxL1F0bxq9bX8XLdv7QS+79l9z/nxbm7sFTCb+dzT96
	9Kzv9trFs4qZ+VHYtfYLfryiJSppzTAI18QQZn685lVGF82Hqge//D9ttTCULJuh4ikMt7FtV+s
	LMzkdTMQlAV2r+z0sNObNbmzi9zpkLa2rVTKmu9EL11HvPk6nVBOwdm7z+K7oBlV+czjV7i9DDw
	dJBBeiMXmPrKLAFTFpJCNJmrmtV6PgM+Z5ySANgPzx0e9No6UgF7UBcoIqdGQucpRspBwbz7+1m
	ugOVAFAdal7Fy40m/6CrfZyb+il4NyUMyilQHt++tyoPKPL8sK43qrXfd9/oRkGWTmdvGRLXGgz
	vzETch5mlpOc2Yb1dzum8D5X5hPz9c/NJdA8pzsBuEgffH2Ryf2PBiV9QPrLjM/jLC4ipOyBRY2
	2IaThC0e4qJEqMd6tGcD9aWg8Aef9MPOt+/anZGOLYVMNJJBHb2uZm1gqsMFc+qRYaQE1PvGcXP
	99f3djOAy/sHLmu4qVwKN43N8dArigGHr5vuKZerK1dht3D6n3SovXsS+a3Zd2npkZXfOcvPeNX
	UyCjyeRR/C/aYEUVmQIXQNKAuw1R6Y1DBmQxc2jy11LcdCSi1jYMMmAPJwNXdVcC16KISmfb2Fr
	r7W4SNEiD/Rr7pxMILRoqQRqKg==
X-Received: by 2002:a05:7300:c8c8:b0:381:17f:2735 with SMTP id 5a478bee46e88-381017f37a2mr263130eec.27.1794851780563;
        Mon, 16 Nov 2026 09:56:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 103/105] python3-web3: upgrade 7.16.0 -> 8.0.0
Date: Mon, 16 Nov 2026 09:53:55 -0800
Message-ID: <20261116175359.342679-103-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132558
Content-Type: text/plain; charset="utf-8"

Upstream dropped setup.py; build with python_setuptools_build_meta,
setuptools-scm and wheel.

Changes:
- BREAKING: dropped Python 3.8 and 3.9 (now >=3.10); removed the
  deprecated LegacyWebSocketProvider and the deprecated get_uncle_*
  methods; AsyncWeb3 is now generic; TypedDict field names use
  camelCase for JSON-RPC consistency.
- Dependency floors raised: eth-abi>=6, eth-account>=0.14, eth-utils
  >=5.3.0, hexbytes>=2, websockets>=14 (was <16), pyunormalize>=15;
  types-requests dependency removed.
- ENS resolution now uses the Universal Resolver; CCIP read config
  updated.
- Fixes: logs subscription topics, EIP-7702 auth signature field
  types, AsyncBeacon timeout AttributeError, utcnow() deprecation.
- Added Python 3.14 support.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-web3_7.16.0.bb => python3-web3_8.0.0.bb}       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-web3_7.16.0.bb => python3-web3_8.0.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_7.16.0.bb b/meta-python/recipes-devtools/python/python3-web3_8.0.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-web3_7.16.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_8.0.0.bb
index 88e224f834..c221f604bf 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_8.0.0.bb
@@ -4,11 +4,13 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d34d9701a1461e4bd71a904ac4cf7be"
 
-SRC_URI[sha256sum] = "b4a75a3fa94fef4d23d502eb3c2244146ef9a1ee0082cf1cb0a91586ba0510c3"
+SRC_URI[sha256sum] = "8d898fe1909037d6269c998d27c1806ce201cf6d7e49514ad6f3e4dcc64e6e9a"
 
 CVE_PRODUCT = "ethereum:web3.py apeworx:web3.py"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
 
 RDEPENDS:${PN} += " \
     python3-aiohttp \
