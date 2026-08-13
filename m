Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE6EC5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:20 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28149.1786651816973402956
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UhFe5y5k;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8485ef63b68so241417b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651816; x=1787256616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkZgSK6OCbVzdgMDG8QktOsQAe5nDvdSomaWotBmx6Q=;
        b=UhFe5y5kok3SxCNi1KOcO5YjWOXRWEzAkf7Q3EBNDUut5AGvvuk+jkfksdVGLCnxBF
         qsyd7RAsMcHVGu2ZPOugfAfEQ0VD0Vc9QGXNQw4l5F7eSYzPxm8XTNFBaPFB1mZ57Jdn
         QWPdk2CtaJD70JDknKaL63ju5J/Xp4ENVHJQxtwP9cKPkGN4Zfcyru/5BExxrdJbFlFB
         PFhDhpIBdnIPiU0Nml/wFWvIDRtNJRaOOnXADwB+ExUgDhaDVgHj07qDxA+A9Qp+yE/x
         LICvKtwtoofl4DltsNi88pFXnWxIUwB+iFqxxMo1pCBWMf5hl8pHZDxieQAipaS+IGQ/
         gyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651816; x=1787256616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkZgSK6OCbVzdgMDG8QktOsQAe5nDvdSomaWotBmx6Q=;
        b=GTgDXCX6rdACXRK6cnOIC/W57ctmgKeS7soJgB7izrao7XnOV3IasGNXvPgrh6VCNG
         d57tlIrGynms2i3RPrQqTwCpVGeO+0OTOIDgWwBB+6x+ZpDyhw/nQ6bztjs8qh8r/5dU
         wg7CmQKYJ52+C40/DpLnc44rKtf2t01X/Xs9LbKefxRKsVoE7v8uQMOwdvRn8rGEU9Py
         f1rD0hy32zlr0d7XRETy1HH9nos+jx/pzF8UypkwKleFwCbqe5kUYJXXdxwZkE77rDFX
         ccYtizL9CzQLycFCbLVhj+cStd53xn9v28lZeBxANoIa2rlD0KoHIiIjr4DvqS0kSWlK
         EDvw==
X-Gm-Message-State: AOJu0YzJhrIAxpQUdmA0fWivRyWHayZyIE//ySvSesh1To+2zoMfWDcu
	jILt4UG/3BgSW0fTVFfrFz/S6R4pkFJjZz1fwse9cic6venktQtL+W2L/0bYSdmw
X-Gm-Gg: AR+sD12KpaNCyhgygqMAp7k6c6XWNOOjYeSGX8o1P+ChFmh8kHyY2Jn/zexL9rHzfGz
	uLUCu7ljnk8fSNyDmoGVF4tS5hKHZoaVi6apO/8VYhqLSzKquhahDkGYUyhWhejKAgt4XfM5abM
	T3r9AvSOetQArRnOAVOMtwq5WWXC/gXFAsn+sTg/4DmWFrxs4qBO1T+7sKOCWDx3RVGB3LsDXeJ
	zLmv58ITH1tKNJDeOSZSf5z2u/mWSKCInIFmIFAj0t1ZLUXvQqyiBSHmO9mkjsjUWxwNIMQkqE0
	Y9Rt6KvC7DhJTfDwEyKYc8Eq5QVa1n42Wuqg0QO0UrqzELReLwpHq1PK+ndd5ISqyxj1jHpHw2P
	a1cMpz3ln78xxKfREu9JR96PVvGgwDl4E3ZnnPSWPNg/C+jb9xT9VkwjRVDCqFx39iLolovJtQB
	kY4GXnHxNM7rdQKgK7nu48voekJklXHUkErfRflccHcmysAv2cLsPBWATV0K1/flgkePgMWLMc9
	pUMUOyHYGjPFRZFravMr66c/MGSm0xW0AUr9GQYqHUUfib/M81iCync3gLjRdR/zYuvJNnoWr4f
	sdh+QG62gHjcH9DC1mZ97KB+92lKn7yRcBTKUAFuBniwwf1t5Nx2FFgehijA+hBTDpyi8IL+lAR
	VJXwQdDG/6bWuuT553WPBJcB7u508Fc+tJJmoSEk1VtB2le2Hfa3GvEI8Lg==
X-Received: by 2002:a05:6a20:7343:b0:3c3:a722:59cc with SMTP id adf61e73a8af0-3cc71cc65camr321086637.22.1786651816118;
        Thu, 13 Aug 2026 13:10:16 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 54/80] python3-pyee: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:08 -0700
Message-ID: <20260813200834.1302829-54-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128998

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pyee_13.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyee_13.0.1.bb b/meta-python/recipes-devtools/python/python3-pyee_13.0.1.bb
index a5a9822cd3..917e414742 100644
--- a/meta-python/recipes-devtools/python/python3-pyee_13.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyee_13.0.1.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "0b931f7c14535667ed4c7e0d531716368715e860b988770fc7eb8578d1
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += "python3-typing-extensions"
 
 PYPI_PACKAGE = "pyee"

