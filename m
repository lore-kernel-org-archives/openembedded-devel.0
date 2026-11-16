Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34308.1794851684291579462
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pZT+4RVp;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so9837837eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851684; x=1795456484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asQ3dcjy/uLx+H4zkZ+uLKq+E3ytWmI8E5crJqO/Zng=;
        b=pZT+4RVppNxCP0n3W+KTMF0e3FxzQnk8JEJDCVRSfupbyAaz/7FMbHR78UUlPWmLRY
         dNjzRnmdrspz28GbNTJ3GZMJnY+Ba+LPXQxHqKIvz5FibT1pgApMCn5fxH61zi/7CEax
         Eq329pKR3B7l77AodpYKc8Kz6E8Y+LKVGh08Ltcvbue/pby0t+px1Hn1QqsNg8SBhbzf
         sp45gtE9ehMdg5S8ETt2qMXYx7tPoVa57Stkg1aF+Vj8OzDnI4IA1S6L4OHm+7HWcWR/
         eJyY4DTRQu0UXvnHnNsgpkEvmwqVeczJxDZdxj0wGzZIiSDAU5qkKT/wSy2uEQYVY1ID
         g9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851684; x=1795456484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=asQ3dcjy/uLx+H4zkZ+uLKq+E3ytWmI8E5crJqO/Zng=;
        b=foaH2yP3fouGV+K4v6ABFlOn/LBd/43eyAqr8diRkxhZ3EEuhEhwB3KPj3LTqTqif5
         q6jjPtrKeTb+sobpbpBCYtcpy4cmRglQHI5HOb11xDLy/DvfElHHeTLIQQ6xZuHGRNZV
         /7h3RaL7MPzYbitmpEBiITwlyUIrN+qZtfzGYhpZuju6rhKjQi3P1ssFNOjTYl/xTUpp
         8RGzFofrpxLV6FyR8ncDrghNZ5zFDGQ9tzRrGCCKx7ESJjmOsocDl+K6wSlYL7R78b7a
         0HMbiG1cW9KUugcRWA2CJRqNhF+dVq2iSB9W6XQ97PEqWg6G5nX2pp4dhdJPXY0rIifD
         LsyQ==
X-Gm-Message-State: APuU4Z/VjgtJnfmktGjeL/f6WnegHQWoMwEK1c62jLvcZIv/vdcmgU7z
	C2zxO4EKYTSE/fwKvwqIL+qNnD7pGZ9nvAZvTEoX9BbusSq90s9Bw6+8+chPotPb
X-Gm-Gg: AZFdTZeD7FY2V0r7ip3JP1DsVY5MDSyXm85DMCPe2ft7e+zvuEpvF+vgjLKTnzyN5mJ
	NE6GtDEqcfgduJNdE+8eSPOZBtdGD9fugwVBg3PNmbobcnQ8Qtd6U8p6ef9GA7RmjgKPd6J1MmL
	2PHqvEZsWQz/d8H2iIegIvnpGCNKul5WJK9QkEFIfKsLBPo0YJcMBnUUW7JHyzIMjln9itWDwUY
	4S8L32izsLp6Kvo6i6rhW35405vTao6m9pzZPKfl1EQZB4Ozg2B4Dna4ZSmzTLRj9BvdUAOlAaw
	gnTk7F8Nggc2Yw0VFoZxhL4bieUHqvCw2cNKYR2xfZDQutSrptm1URoAeVeyrLpjL9foLSesunm
	VrZQcf4xQSkgRBXL3+fCzKZBoKDTR3nL8uWfJYRTSpPi4Jw5CUrLMrLH9t9mitUFxvqRy03nWqs
	XowORRyDLKoCTQIxOv/AfdMl4L70oCx8AXhyNTgAlEnYYiiz8lV+WmbXGamwFbBpVRvRC6bIykn
	6p+trJ4NymKm41lplsVO+Iwf2dxmsigIm8ISxGiVnZzS/akqAjUQEOq87JcBVgGijWaa99fPcMm
	XmvNppRirNXA+PT4neqGABMljlzMP3D8gBQLND8mXMjB0VVEUPmDZv0cIjRpH+BHYclzj0T1XUo
	Sk6s/u4Vjr6fuMmhIBvIsdwC42TtnbDtF2a9HgPA+iXbm9Hz482pWFxlX/X+FLu8TeDMkalBDuS
	8SEsd5YMXxLNv7iAMWduZR0z5m9t5GOJmPhCLWuCV4i84xkgqw52DCgTe5h/Jwe4y2SmB0lrVqk
	ycbJF9K/4IBQICDKZtv1CTw4sOJQL+12vpkxAJI6HHWrhzjlue9aAzIrLyUPmk/ujuLT1z3YCz9
	Ar4AAyHxCia4ulataAiKQHaaEBk=
X-Received: by 2002:a05:7301:1506:b0:372:eab:d700 with SMTP id 5a478bee46e88-37963953befmr11292556eec.1.1794851683575;
        Mon, 16 Nov 2026 09:54:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 028/105] python3-eth-rlp: upgrade 2.1.0 -> 3.0.0
Date: Mon, 16 Nov 2026 09:52:40 -0800
Message-ID: <20261116175359.342679-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132484
Content-Type: text/plain; charset="utf-8"

Upstream dropped setup.py; build with python_setuptools_build_meta,
setuptools-scm and wheel.

License-Update: Copyright year bump.

Changes:
- 3.0.0: drops Python < 3.10 (breaking); supports up to 3.14.
- Dependency floor raised: rlp>=3.0.0 (was >=0.6.0), hexbytes>=1.2.0;
  typing_extensions needed only before Python 3.11.
- 2.2.0: template upgrade; tooling moved to prek and ruff.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...python3-eth-rlp_2.1.0.bb => python3-eth-rlp_3.0.0.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-rlp_2.1.0.bb => python3-eth-rlp_3.0.0.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb b/meta-python/recipes-devtools/python/python3-eth-rlp_3.0.0.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-rlp_3.0.0.bb
index ac70d14439..c086930b78 100644
--- a/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-rlp_3.0.0.bb
@@ -2,13 +2,14 @@ SUMMARY = "RLP definitions for common Ethereum objects in Python"
 HOMEPAGE = "https://github.com/ethereum/eth-rlp"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3ef06eb4d4373222e59a338e2eb9a795"
 
-SRC_URI[sha256sum] = "d5b408a8cd20ed496e8e66d0559560d29bc21cee482f893936a1f05d0dddc4a0"
+SRC_URI[sha256sum] = "9663e54a4a1c1c847d2d328c1d07e4174ec1c082953fbb42b60e61c501c4931c"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
 
-PYPI_PACKAGE_SDIST = "eth-rlp"
 
 RDEPENDS:${PN} = " \
     python3-eth-utils \
