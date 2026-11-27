Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10261.1795753004977324443
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=E9itdiZ1;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b563e32936so3514671c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753004; x=1796357804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rAag3CxhpaHEfCKV9wKL0yaUdP9h0iO/EUwcmtOYAc=;
        b=E9itdiZ108cfQZQenM3tg0bw0vs9xLNV1ntBPSN4U+wkT8Ba3Pyk2sgF0a81fj8mi4
         JIotlecoQKiS3rxhgmSDurjqG7GgmBjG8XTQOtwQMKKERi/FBzgF5+PDfnUi4OskDbHI
         hWKjPSbyT6FbZIhiWo+9jl8i9wFarC7ymR01hqWP8VyeiJPxtPlLCIn/BgqOPRz5SNwW
         FnF/tLUN7DIg5SG4bjNP9fDK1TJLrjKharYpV5GQt/hQ7WXMps0Is2jlH3RVOepv3ViC
         CNjEtlOdIcKfrCLWyTsVGQNzAf+bLzT7RSHUozlkfQaczz71Nl1GnHPiKHjww+lARqKu
         UyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753004; x=1796357804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1rAag3CxhpaHEfCKV9wKL0yaUdP9h0iO/EUwcmtOYAc=;
        b=rjdBm0+fRwGFRO0HPjAB5z5e/uqcef9aVbvQ5BqLsjVC5Rg/NxVsdlWlUGcIlq7WT/
         qu4SpBrBIJ5cr1ch+rDPrGN59kqdZtWNywdTptWQfj2dD7wFp4+j5bZunmCSWNFCHFHy
         Oc7EPhvtTQczBUpZpDV91LV61FEPNBtGdIOgGC13I4851Q9GcuF6x8nkwrImTA/Hg3XX
         yeYeFz9d3iJiargbMXmVAjXwwCH+9BQZEbqYp2nBm3V/iyRmWV9Veo8ZCXTM4EFJjkZl
         678Fq/Oum9OrJ7Pwf0aLLr112FRh58GAVe4aN+Lw+uHc8snl7ALvykOtVcrY6fj+UuAk
         PWDQ==
X-Gm-Message-State: APuU4Z/12pnPD1WLdXuPnCoRSBaarofDqdrMjYyyM2eYuCPWqeDIANMv
	moPe/H2fJhvVVLNAJ52KOiY/ONiAS2uc1UZ0mL445URytSM/nhm/7xnuWpphJVuo
X-Gm-Gg: AZFdTZdLyyQPZfASeRaNY4ldh9xrsAOLLqPY5ev03ZXCbdjU2cI5h8Ovxc3lwktJERo
	Xgt3kCjyMzC/QsUxjZsD4VnXLHf8b+yB3fOw0qVBOMlvqXdMst0xzGDz3RlrPGZwkm4lK+HlzvF
	Ybi7wVG58E6T41LubRo0ObwAP7d8oIOSbddtgVmLBJj3MFei+roYS7iWJFpEyPcRShMJ2iz+Ec3
	0VQksogfQvnsmfpPAv4vRJW3/gv+yGxunZVCdgPQ/AcbnN4ryY37YYKAo4Ohq/QGj0s2LF8oPyu
	116QzqE2mREuCA3kQL3n2QMlwWb7AG3vDyYm4m1QC2cA+jn8zMfGs9aWfxE6A5vFYM0ub9+nSLA
	IpoEcy7/DVOhS+B7hmAeVYZGv8o0yXwlG82H6dFkpSj5Q3kCVc2H/tn1HqFhecqJpX4vthLBt06
	0skQcv3ttgg7jbrxsTPK+42vwXG3oSICk+WnsOQ5c8Q6HC1LUq+2FEa4K6A54DpNGA6vkT2QVpA
	pI55hFXXnxw4fMf0pl/HpB8bxKP6/KN/4NY4MGCHZ/mFfDbPswM+6RVmpoFpTlYj07e3yRVIdkL
	QXgrwWONvq5168FdTeKdFtkld59vI6KBwHxnpznsm5G6/l6JWgCZJwXKTM3ff3OjhUnvov/tl4r
	YhPfGt18n290kkZWBltv+fAfU176uqTWkBpeTQsenF8DFFnpCC2OV21aNnSKA6fqnWo9QuZZyOB
	tuBE+L0XFoUwjWxUY4RTDvrybGqtnwDj3C2vypPZXp9xx4poLacna4p0tYDyW/p7v9L3fn3Cuf4
	hAY7clr1iK6MvHr3q32p0ZseomBHwAAf3FplmeCw4CTm/vEC/MfiY6G3rvSD/Vgu5AUTjet5RgT
	DscK
X-Received: by 2002:a05:701a:844d:10b0:181:5cac:8f27 with SMTP id a92af1059eb24-1b5824b61d9mr9348352c88.35.1795753004270;
        Thu, 26 Nov 2026 20:16:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 25/32] python3-pyproject-api: upgrade 1.12.5 -> 1.12.6
Date: Thu, 26 Nov 2026 20:16:07 -0800
Message-ID: <20261127041614.1775064-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133244
Content-Type: text/plain; charset="utf-8"

- Keep the caller's PYTHONPATH importable when SubprocessFrontend
  starts a backend that sets build-system.backend-path.
- Restore plain tuple results and public annotations for frontend
  creation and built metadata.
- Wheels now carry a PEP 770 SBOM written at build time by python-sbom.

The build now requires python-sbom[hatch] with the python-sbom hatch
build hook, so add python3-python-sbom-native to DEPENDS.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...pyproject-api_1.12.5.bb => python3-pyproject-api_1.12.6.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.12.5.bb => python3-pyproject-api_1.12.6.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.12.5.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.12.6.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pyproject-api_1.12.5.bb
rename to meta-python/recipes-devtools/python/python3-pyproject-api_1.12.6.bb
index 9646ff651c..557f634a66 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.12.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.12.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pyproject-api.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "0795693708f631af4c665ab02a315edc0fb97471f1d52e4a6179ed60504e96bb"
+SRC_URI[sha256sum] = "422f037b711cebc650241102a83496aeee6eba088597ce84b58b473760740ad7"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
@@ -14,6 +14,7 @@ inherit pypi python_hatchling
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
     python3-hatch-vcs-native \
+    python3-python-sbom-native \
 "
 
 RDEPENDS:${PN} += "\
