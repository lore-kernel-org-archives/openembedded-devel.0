Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34303.1794851677914407241
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lwlH0bPZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a315ed211so104285eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851677; x=1795456477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHbx+DyqbGjxgXLIJIKSe0Eb4ZTPczbfMUMMHLe+XEg=;
        b=lwlH0bPZJZ+A+MhipMW/ZIcPGAIwdMck0IJgnxgXFUAez36bt8RPsccvQOUQcAGBF6
         QgVI5nGpBCTU18CDepvhQZ30XYBZ8gRxHjvN/EcCxCmv1RHjVM2B6WR8kCu/FTG+e0Kg
         R8uRMnii1fVAKVs1LUFCPOqI761aHAyiXGfQ0uNwDxwtbavAEwE1WvCQH7K25uasawEf
         ndA9aDHG5JeH2btQKZcpLRkRIs2Xkb0ewffSxC734ehl1ModUHWZItndVQAyqtgoePW1
         0LH7h8Q5+qVARwbEDWXM0tYAGInfury76TzjkneRRvkTpcMlaSqiasOc8MqbbpSFMSkT
         GY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851677; x=1795456477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHbx+DyqbGjxgXLIJIKSe0Eb4ZTPczbfMUMMHLe+XEg=;
        b=OWW7IX5NU702M5w27L56nZAkEeqjJtSyQ1T4SRw/FpMea0hdDkMQvW0XscKiMlJNDa
         J3iR2eaxG3YtrWJyPKxLyoAW4FxV732KBBnBeEyHfZxpzjsum9l16704nh2+qmzwwmyY
         Uq7T+gPTS7ZmAAiOsatJyCPrbc8qpfGm26iDD13nV9Mz/mKSXRrQ+CgmM10tqOSGGTkN
         XL3k1n4wRsObcK7vgcoFlyEQM7MhVR0dOSwA4FPcsQG25NGeWdQ/L6VbA7QfqpWrthd3
         Zxk8ArXsCnoVYjKIcPzRSqh8pBpj/H0lTuA8ZG/6GGqXG+WjDG9wi7gHhYBBpfqGn7YF
         u1/Q==
X-Gm-Message-State: APuU4Z93SGWoilcIADF9Gf0MRavSNxbpkvUZnHWYgFus1vgitPa5wmZJ
	dL3ABXVIw8RApIbirO/HsWfuA6QKuSyil7/2sEKnX28Z/Hv5+3nC5RWWQEZpQpCi
X-Gm-Gg: AZFdTZfroogjkC1uTUk8NbUpR0rFw8RWV3p+4v48/dLE1zBCp32g43HxxmU9LqfIY6g
	ZwcSYXffeBZjpLxy9EmX5q492sMpLnOTe/fao1MPBw8B8CdKACyyKAXPIx9lbSs/uUVsrI9WJla
	5X0ixhbzZ2nLBsBSmsXPJb/mUCQ0lqu8uBJkp3uEfR7m/E8y5cVAkJbS2KRTz739ODS8pSLKXIx
	IM049ZzH0F05ht8t/djk/Deum/4dMlhMYoNFKdhQOkwiqyBCNdZ01eoHt6LLjAoJ4OkRYp46Yjs
	XpEafNL7ZYtwzqLB3sM77nwy4jP76GXuwyZVVqymL1dCfAWodFKlldkAZM/Ef3nKUuHiJ3btTmM
	yByZkBvagwk0LGFVRuEEeCwEX7D3uxODysyHmcHWt48E9iHfQ/jpf093o4IjGAFyFiex9YEaXxP
	rscRx7Wao8XASktjdX7j2A9xcb0shEyq+9XWu/yDgijx38j/IBm2+JCdQJkKM+GriuBgsNk1aUa
	w3lf+um3FRDEpjHWXidOiQU7eJ/hfTqkqQZQ3KCITi+TaL15tzgpT9XYQfoJjla9nryrnBX1oua
	Aqfw6ifav87/s1Bv//f0SocXQCBrjeeNHM1Pcv7bsM5AexcRhYTp1tmEiHee72pr7S6J8kmtUqJ
	xgVUMQFiFlansa01vlIxXdFdZI77Unp55IpKbY8KOCBmHmGc8MXK8ve+40Teb3kmFFqr9npx895
	0vefTsq2TVMetfJX3H2osoLq4Doh/fNV8jjJ+lZdI73nJsDYHywKWWbHa7fg2i0WKFZPapw5lnS
	H/i9w7LNw3UNM0boJe/mbi4tQuaDmUiA1S+0iM8FsoKqgbw0CmpEz//Dw3dR7D4/R2dRRMRMEHJ
	tcK1/o3A+SgtAia9d7ONj7MxAA==
X-Received: by 2002:a05:693c:62c1:b0:36c:a1bc:6102 with SMTP id 5a478bee46e88-381088a9f05mr217507eec.0.1794851677178;
        Mon, 16 Nov 2026 09:54:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 022/105] python3-discovery: upgrade 1.6.4 -> 1.9.5
Date: Mon, 16 Nov 2026 09:52:34 -0800
Message-ID: <20261116175359.342679-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132478
Content-Type: text/plain; charset="utf-8"

Add hatch-fancy-pypi-readme to DEPENDS, now required by the build.

Changes:
- 1.7.0: version specifiers accept free-threaded/debug/arch suffixes
  (">=3.13t"); unparseable operator specs raise ValueError.
- 1.8.0/1.9.0: expose PythonInfo.marker_environment and
  MarkerEnvironment typing.
- 1.9.2-1.9.5: many fixes: PATH matching, uv-managed patch releases,
  caps on candidate output size, retry without cache on cache errors.
- 1.9.2 security hardening (no CVE IDs): skip relative PATH entries,
  validate pyenv/mise/asdf version names, private temp dir for the
  probe, untrusted disk cache dirs skipped, no Tk startup files run.
- Bare interpreter names no longer probe a file in the working dir.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-discovery_1.6.4.bb => python3-discovery_1.9.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-discovery_1.6.4.bb => python3-discovery_1.9.5.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-discovery_1.6.4.bb b/meta-python/recipes-devtools/python/python3-discovery_1.9.5.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-discovery_1.6.4.bb
rename to meta-python/recipes-devtools/python/python3-discovery_1.9.5.bb
index d503ea988f..f638ba765c 100644
--- a/meta-python/recipes-devtools/python/python3-discovery_1.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-discovery_1.9.5.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
 PYPI_PACKAGE = "python-discovery"
 
-SRC_URI[sha256sum] = "bc70d31f0ec5de11eda13d4d64c16e24b3506a65984684f2b6c98cb83b2ea9df"
+SRC_URI[sha256sum] = "86279f5d2728bc067de28b7ddc571be2eacc2ae0e7048f8629d2481a0f8848a2"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-DEPENDS += "python3-hatch-vcs-native"
+DEPENDS += "python3-hatch-fancy-pypi-readme-native python3-hatch-vcs-native"
 
 RDEPENDS:${PN} += "\
     python3-core \
