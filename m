Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10252.1795752995170332762
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hTQjc8+Q;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b563e5cbc3so650760c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752994; x=1796357794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJMBbCYerRDhSdbHkJyiVyvoEGTCjIW9mVEXCDhRqX4=;
        b=hTQjc8+QSc4K90HC7lpYPY/dDIMooqPqR0cnUJqCw3KW7599MwvDBb4e+WtpIz/nRJ
         G9yyMAPaluMfOmn4BNhEqBhQgXNLXkZwRYzvG4WciSJMXYyaHesYX4smD6av9TD5PS2m
         BHOmzTk7CTxVvi/iuO91OtzhVF6c8C4DzIK3/mFwUhopwbJgwNkkhY42D3oFR5948okO
         ZmhyS1dGEwuhyqcBo9TLG260NllKdl1lYBZbDP9sTtnRXYzA6sPPO2+qvOnd3ZYJzvqr
         wiriErCDc6jOQhHpbZhN13I8uMfxTtXbyZY5XyjBbWFQqMVRFO8FpoBoLwU+ZxSLNJLU
         f5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752994; x=1796357794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJMBbCYerRDhSdbHkJyiVyvoEGTCjIW9mVEXCDhRqX4=;
        b=k2sRWBBvXe3cb5XbBIF3Mm9BXX4M/YsohnojIiUWGqCi5xQFcO0cpsDqfgxvrYBqS9
         eQOywYrnAdv7BwbHvCBM/o7PObTmnyqB2aD60xAl0zS0xr3JKDkhKZMhYrb0LWnYfYM7
         2U3yjUw0ZDZLUpGEqMj9TGUo7z5fMPCwgL9/o5tX+7+UNz6UdMoBRVb0Um6zDTeJseAT
         jSdIDhu3nShWOMmDNexqu2ZQRAPB7kX3bX1ZrIA9U0W4wFemthdwMKTFSkpudxEX8ULo
         fFkRfpg/G+uPBsxRqxqReIkXriQFpDF7fb8K0VfybNe3ONX1FwoiwZYmjXkHpNmIqXrI
         UiTg==
X-Gm-Message-State: APuU4Z+XolsLEHzTbN2U1ls4/9t4Pjb1S4QdtWRlG0zZA0e0uR+VtrcJ
	bDFuSMNCO1P2ekKPD2pyT0Ih+8k3RtpxS037QYCMPea2IS4ujkeb19wupiiahFnD
X-Gm-Gg: AZFdTZf5OwJRRM61PwslrQCzVq+TL0Q/rkiCz7g6EpX61cxNf6/1DDbQZEBUYT09mD2
	/GRDuotKCwajA/pZxW/hxIJ+oI7KxNJ/F8KATnWCEKq+mFcQ2jC6Qn3bSigYSZ4tcUwv2P7P5Wz
	EWmqygxa3fL2SihvaexkuCho1YdH59a3d+GZC03ZOP9DAN2rmPfFn3iLr6y5n5RKt0ILo898SrD
	f8nIP+d4/j34k55S6XYhDOM3Odh6u7kjsJ7lVMj7kfUAzC4TuAVLXuNfgpC4APQ9KRbd15FiX7q
	wfPszDnIroc4gfTM/WV2UZQDHrSW5XplVD0KhwZ95VRuMKi3WF2SrF0itFCxxjbMYGpHmeBpKyc
	1NM0SmVoVwaXZrxFAhNI1RPS4Fd5Ojo1ZMgQi72vIwVgMaVM6fJoxy7ryvsz92nzH1UulVGi/cQ
	AdwOj6h0MOX7omRc2P7zoOS8G/eG7S06PqLu0QORcLRngpHgbBdTkEnxCzOp0d4mlE/RpgQ/eoT
	MpI55nPHIqXhPn//b1fCGXfCif4Bx7/GxnvdtLwLrFEGkQbzxI1czDV7Rc4LUQrK3FujB/3N34T
	RdzlRSq7OZZQ8I+xKmfnw/3xEISMZO8DO+NaHJUkuuSZjLJvfYMGUEHLQndvWPyWmal4Uj3jTzi
	1H+SvkwR6Bj5fiYcBwUmNL6iMHcCdKhZb1OhzvXiC6VcDvAVY968AIUYIsGghxrW4d8JWuqtenc
	oncrG73Upu2PdI/HkYouLkySx2efp97GGKENKisYPm7gfjsxVjT3G4uaolqgAQ0e8P0+vLmfat2
	UHFQvdb4zwNDoPw1JtBcNhNNNsFC4V2cD8qI+ztbargpvF9bEZzu0maaVg/c56nSI//y7YaTVoF
	KyUz
X-Received: by 2002:a05:7022:1504:b0:1b5:6e28:a2a6 with SMTP id a92af1059eb24-1b56e28a3ccmr16132704c88.9.1795752994466;
        Thu, 26 Nov 2026 20:16:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 15/32] python3-fonttools: upgrade 4.68.0 -> 4.69.1
Date: Thu, 26 Nov 2026 20:15:57 -0800
Message-ID: <20261127041614.1775064-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133234
Content-Type: text/plain; charset="utf-8"

- 4.69.1 is a re-release of 4.69.0 with complete PyPI provenance.
- svgPathPen: add opt-in precision parameter; subset: add
  --retain-all-variation-sequences and preserve standard name IDs by
  default; varLib.avar: add reverse coordinate mapping and
  analyze/reachability/plot APIs (new optional "avar" extra needing
  scipy and contourpy).
- Fix 4.68.0 regressions in CFF2ToCFF and CFFToCFF2, and many
  cmap/glyf/otlLib/varLib/cffLib/subset fixes.
- setup.py forces Cython regeneration on free-threaded builds.

The new avar dependencies are optional extras and are not added to
RDEPENDS.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-fonttools_4.68.0.bb => python3-fonttools_4.69.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fonttools_4.68.0.bb => python3-fonttools_4.69.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-fonttools_4.68.0.bb b/meta-python/recipes-devtools/python/python3-fonttools_4.69.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-fonttools_4.68.0.bb
rename to meta-python/recipes-devtools/python/python3-fonttools_4.69.1.bb
index f7175993de..eb547dd868 100644
--- a/meta-python/recipes-devtools/python/python3-fonttools_4.68.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fonttools_4.69.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/fonttools/fonttools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=211c9e4671bde3881351f22a2901f692"
 
-SRC_URI[sha256sum] = "73294e233070f71e2b3653b6bd8564af676d57f26d075761fb06d1ab2e4a7a5d"
+SRC_URI[sha256sum] = "d09a2ea8ed4c71ac52e789ba9313da3e26cee3f812400d7e8a8b3a38d0f98dfe"
 
 inherit pypi setuptools3
 
