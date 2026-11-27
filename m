Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10258.1795753003114352994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vWl+a7f9;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8649352c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753002; x=1796357802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtuLsmF4P2gUl3Fa70ULcd6mjccN5fKyZ0VhAq2jfAs=;
        b=vWl+a7f9olgwrCMXfHaO+B0CIj1uCRn6bLIBoXA668y6gwKBzDXYXLiqm8UV0r9rDr
         Ywd0iajnkZgezekaAYIRGBaGhdJyb1LewkGlW03AxBBbycDNwKRloDw+g8PM6Nbx6klQ
         cwwF+FihQEHIdP8Uulg0OWA0KEE4FHeCMluFShGA/o0CeJnyfRkUv+RzLytqq/N2TSKp
         6MNfx17Opvg24aV6R5HT0UEWv6TVEsXuzYI/Pk0qDpT66rSQ7owMYy0q4In+jiNKIVGq
         FKld7+KlqWr8DPdAqgS4IawhmtAl1w/z7lgP76+kYHRzV1HVPjQXDeW38LkfBca1BgAa
         aVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753002; x=1796357802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QtuLsmF4P2gUl3Fa70ULcd6mjccN5fKyZ0VhAq2jfAs=;
        b=MxSMbw/10GxqEbdRfORmSkAjU+v9YGLfd1BE+agSbi8rDSI06wqS2HkwyX6ix/YII3
         rL7yCxlPt/lucfCjVmkWC89//CEN9KjQoK3FhgCsJuaXBGmO4CEWszUBHNxdrv0Gp13u
         t4BeK1iGROUh9UgD9gCMXZq0ZpWfPcf6+HgtQx8Yvk2VenFLbmOiwIaJfX6v2qkvwqLj
         dVjbx7EiGxaFzmL/FWsnt6h/GonEmswAQbhBu92rlXor76uN7voBQ372cA3vIH3ZlHDl
         lNq+dOGD/gI079+4J32oHXbCKFSMD4BmmkpjU2EHqw2AQTRWwTOXCQBGzElkED4/fCY6
         6YIQ==
X-Gm-Message-State: APuU4Z/saejH90DXXkuy0nwHJQbj0j4XrWAJEKkBc3j9bOQRTD+P4ygS
	Obv4SLqzcBVJFN9N1mrmjYqergf3LPKvUj7RlXE8yuXtADeaskRcyly/ht2izl30
X-Gm-Gg: AZFdTZfmcK8ToQ7Ajv1tIWg9AAvT3yVcUcDsYUSncN06FrOgA6VVy2Olb47QY0fnvog
	wX/oXEh8X3s897drp9uPd4ChC21yBb5jijlSZinTZjmqWXlHSO55rneBsVKpwSlo4Qi1qOEa5UQ
	p3tkwcfCg7CakX+qQi2kR2AvgkBZqgNaDUGdEGHQXrKi5tvVkY5EjrtK4GcHsBPdZ/sLvTf6/6D
	2vV0f392bgh3lPFaS1kBp2HeUEhBTazLX6JiNLjNJT7r6qTCEEyoNEu1Hf12Z75Ss8HjYLAxdZN
	0PPQY3tByT51B+d2yvkvKVKbBrDqMblgs9+bKS4nseHnRgW2K7du/eMdDEQeI1JMUpm1fj3Q3Qe
	YH/EnDVAJDvXNExvUJ9FzBs4g3K94Bp7I6A8xluZqnBCNf9Z9Q8kjDcAGVnZ4ZTBCFx6wB7Ny04
	cOQceUULdW/0Myb7j1z8vKRRZK6Qm0LrZRtQLa3oibOLasjRMgn/6XuAMz/nQl2r/0ZFSgfyPpF
	pcWNkJu8SQ1F4/YL2PLjPShzYAJFz26lw+4h9JIjFLKrqRTJ3C/B6skvyEbcVjn8gJpJmEGzKoI
	r5g7o1PFk2ZrjrQzaSMs8JsTCyB/2mPlvPO0MZOXKkAPRs4bnqnC0dZruOHqIZ+ZoYsHrL4cbBW
	S0/GY37hjXDyEzN1stPi3cmzvq2mGspVmICkSnN3CDbX/qt1/6qtud4Exc8IYAwK/dSRJc1aVPp
	7jvK03k80Eji/dU5Lm0CN08FBuKlGmZ9xbS9h1/O75T9QtV6olvtBbDR5BnSO89EDBgqW3NicoF
	++WIo5XQvSL4xRCB/PcUuw+c4hT3pqu8SQx7QiydHxzoJNsCUUS3K/xOit8rBzmxeH8lo3m0H1P
	VReZ
X-Received: by 2002:a05:701b:4182:20b0:151:2e62:fe6d with SMTP id a92af1059eb24-1b5568a2ef4mr23405268c88.22.1795753002370;
        Thu, 26 Nov 2026 20:16:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 23/32] python3-discovery: upgrade 1.9.5 -> 1.9.7
Date: Thu, 26 Nov 2026 20:16:05 -0800
Message-ID: <20261127041614.1775064-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133242
Content-Type: text/plain; charset="utf-8"

- PythonSpec raises ValueError for wildcards on operators other than
  == or != (such as >=3.12.*) and after pre-release suffixes.
- Restore MarkerEnvironment as a package-root export; fix pyenv shim
  resolution when the working directory was removed, relative
  interpreter paths, and case-insensitive py/python/graalvm prefixes.
- Defer imports on Python 3.15 to reduce import time.
- Wheels now carry a PEP 770 SBOM written at build time by python-sbom.

Since 1.9.6 the build requires python-sbom[hatch] (hatch_build.py
imports python_sbom.hatch), so add python3-python-sbom-native to
DEPENDS.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-discovery_1.9.5.bb => python3-discovery_1.9.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-discovery_1.9.5.bb => python3-discovery_1.9.7.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-discovery_1.9.5.bb b/meta-python/recipes-devtools/python/python3-discovery_1.9.7.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-discovery_1.9.5.bb
rename to meta-python/recipes-devtools/python/python3-discovery_1.9.7.bb
index f638ba765c..98b3c43fad 100644
--- a/meta-python/recipes-devtools/python/python3-discovery_1.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-discovery_1.9.7.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
 PYPI_PACKAGE = "python-discovery"
 
-SRC_URI[sha256sum] = "86279f5d2728bc067de28b7ddc571be2eacc2ae0e7048f8629d2481a0f8848a2"
+SRC_URI[sha256sum] = "cea89e8a8b86e19731c67f8393f34eb1a2f96c9f97f3e406929a99c646a2358d"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-DEPENDS += "python3-hatch-fancy-pypi-readme-native python3-hatch-vcs-native"
+DEPENDS += "python3-hatch-fancy-pypi-readme-native python3-hatch-vcs-native python3-python-sbom-native"
 
 RDEPENDS:${PN} += "\
     python3-core \
