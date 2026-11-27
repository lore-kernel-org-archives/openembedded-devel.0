Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8196.1795739684777221118
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jrdD6cVQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso10174138c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739684; x=1796344484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSD11hYbBkrio6jbZvQQ7NLimCXRuDxdhERq2Fh4ko8=;
        b=jrdD6cVQ34fhmZolMPZiAXZSeFMMQCKpr7Ub464nbAZhsyOpfi4awEH5K/tT2xyHlV
         WgXiFU/WTbTvaOHXPMBqZgyP2uPEV420zzFoOd4lf49LI6OaK1kx+VcLbKut1sq0c4IU
         H3qP17mYhKDGtcUZVTdt2zxPRVqUmHvDLI+chmAEb1o3hyOyXAWTzHZlhQJjPfl8nZql
         qXRqdyP5IPhGSNLdElhb4+ai4HXO5FFdYdgUFlbBDmwMxDEo1wLzVeutR49GquyPVNN7
         r8ECkAl68gFo00XGi3BWPwXLFH66MQvRC3OSWnFiN91vQoLzRQ57WBVdhJCdFKF2qfYh
         MlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739684; x=1796344484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSD11hYbBkrio6jbZvQQ7NLimCXRuDxdhERq2Fh4ko8=;
        b=cXRHEAILYYKgeYez3eEjuhhuterkEI2xznDvhJgooWsVopJWxUkDuU/OGhgkgUegCo
         Mn5tlMxCGciNLFliYr+LLAcgfPJuoQIcDRRgSwAm8LISOwvU/q2l/yNmZngU0kSSQKds
         RlUctGPfODXKdbSfii7FT1HrefQNsxd/xza87BGNte7fgBYwqd/1ehDYlOpBDCUlL1ta
         ETJ3JrGER4X0C1U5V2ftHlhu+KTdrueDt9MkCMTOZfD9orTJaKojG0n3TSEKMmbrJ1jI
         2x1yfX1C+l/kacktxDYx5z2Cd+wA5DIZ2xCLVFB9ijbk0y1V3GE03M1e8HgHtJb23kaj
         dmiw==
X-Gm-Message-State: APuU4Z/gagVwt+enSq/iGh4492SzFG6cHePZa+is3RxK7KbhLzJ4iSUO
	+kk4mBoLln0SWUHkvJ6oY5TAStmaB7AWN7Hy6GsTVtnaCFDS0Isqm6bEQXiZ6cdW
X-Gm-Gg: AZFdTZc7RI0ix31diGYE7aFrqxoqnHzRM5ZuFy68vt3Iitz4AQYaQKSJNZuid9gmbH1
	rRGzPk8OPi4oPjg+E4qkx3md5IflA7X2SkXdMVWimOhT3N9Skqmi/HIS/GxgoVkX1HQuldoCtWC
	Ez6XOTwF41FoHRI7bvajxZmoIYVFWI27f2y1mzH9Fo0CLlZlbYDx34LsbpsI23jQa4NbUXegdt9
	1x2sPb2ZsvgVtoqvLaFNcwufcW6gf9uo6k+6bS7wDOvKLhelTazC/TAnhtydJYw0fFwwBw3yGAh
	5rEMqFB5L6J0WqmxXtOHnf2yEAIDDtY+VqYeAKetGqB840/mSpZ3Vuq8Tm+5Ja0XXhlcqgcu45F
	L18/FmGZ1lPjPEClLbmV8ZXdxAhjgbz7rYeWBkpOEzYT5oQDTYc0vw6rcuPXo3i8/sOrrWXlJ/1
	9GjUCeIlvBk4MFnAgsx2gfiCT4/2UqVDfS+lnRsw4pPuP2khpK0PTuc9jCKaORxiZhFznx1AghY
	+t9a33rHktkCPER+Z9eq78FhXR0ENKhkJq9QHXpYoN2V/OtGN9vWBVgBFAHoHYygzmS8I9n4Bfh
	j+twSY0Q+F/qmO9vNX0ohIrWN2/deTpv6LPSwxu+P3+xZXiyUJ8u9atUI7u4/0JvLRBQcGLYmaW
	aJulfa3pKJvW9eWBe+e/dl+a2dfxaOdIc0hk1bRr9S25aZfJE2xqOETYg3hNrV5NYUyuWhJBx5i
	XNIYBxsiHsMMOIeXJdHEfFHPI3dUaIiNxzcgIDBw6Qb8+UCbgEfPU+Ni/dbqZFDxtnZEHf1O900
	pJYE/Nu0EyXJJ72qftrEzh3TlBPutqf/+iZ/qICmbo7zAJGy/7evyEIFuZTFc2hofGxm0xGoInj
	7vh1
X-Received: by 2002:a05:7300:6da7:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-3856c9a302amr6608292eec.2.1795739684088;
        Thu, 26 Nov 2026 16:34:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 13/69] safec: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:29 -0800
Message-ID: <20261127003425.2166632-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133113
Content-Type: text/plain; charset="utf-8"

The default tag regex picked the old date tags (v31082020). Only
match vX.Y[.Z] release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-core/safec/safec_3.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/safec/safec_3.9.1.bb b/meta-oe/recipes-core/safec/safec_3.9.1.bb
index 72e13efa8e..1e14875e48 100644
--- a/meta-oe/recipes-core/safec/safec_3.9.1.bb
+++ b/meta-oe/recipes-core/safec/safec_3.9.1.bb
@@ -10,6 +10,8 @@ SRCREV = "39a0a819f80853498e48a6e601a446a122b64aaa"
 SRC_URI = "git://github.com/rurban/safeclib.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch \
 		  "
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+\.\d+(\.\d+)?)$"
+
 # arm-yoe-linux-gnueabi-clang: error: argument unused during compilation: '-mretpoline' [-Werror,-Wunused-command-line-argument]
 # arm-yoe-linux-gnueabi-clang: error: argument unused during compilation: '-fstack-clash-protection' [-Werror,-Wunused-command-line-argument]
 TUNE_CCARGS:append:toolchain-clang = " -Qunused-arguments"
