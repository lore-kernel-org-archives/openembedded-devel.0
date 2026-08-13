Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57525C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:59 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27798.1786651789639929644
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qM5TEoz+;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so185951a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651789; x=1787256589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZnPBXnrVoGy1AE4VzJJLqqcOYs1RGT11UGhMEdmTmY=;
        b=qM5TEoz+PrmpT4wzfK754Erf03JaAMl4/vKU0BQ4mHWeV/wW4XF7Eqa0OBpdkLXXMt
         lmV1nIp3wSfliWvxnEvWhwYSRuHSQ6z9wA1fpkXgL36P5jR4gu6gnUM+wbtGL3W1ydhE
         STJdIv1IN/du8Xnhvr/YJNvbUJeEvmmr2jvp1U2soLJarW2qtTrfXVWMlGY/lzbAwnWJ
         vOaI+ZxUkrVlgLqxtnztJ9CkY28XXJmcu5mw9CfouilgROE3CKhThbsrG4YtahXc8MYe
         iV27Dr7BEOi0zONZqrJPv/cDS9nlgdmJ9+Ecx3zGI683FdkSc91QdT2g3gq3+rfED5mH
         Nxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651789; x=1787256589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZnPBXnrVoGy1AE4VzJJLqqcOYs1RGT11UGhMEdmTmY=;
        b=aszk6++38X4WqRGHTNB3yQDGirrt50cjOKcq+uV2nSxlbF4WasVpLdYF1Q2Vpmejqi
         eswFJAiLJIIgKhjCqe6RY9FI9RFrKUMZ7y6ggZ74QXBGx8AMeuJLQdHCLVkS8+ideEFA
         H20KMV6dNH3evTZqLT14Fz5xHyo64iGmKy311dXbh6We38T/NivLgmqo0rCdpkD4nQl3
         +y88Pe2ZZ8HCq+8LRSdmGKhYo5jmbfnbF9U1c0Inkbh1qvkwqT7RTwqFN3qICyPa1RpG
         0oBFB//EsetYR+UNOj+xGe1aUC73aO5mHHLWaWcAyvccAC98JyTQEHKs6bQAxAQdLZXN
         Al0g==
X-Gm-Message-State: AOJu0YwTDSCPphGDN5/xaKyCtWRC6/q+zBDhuvPNRIEChnMuxC33SjQR
	VhfwhX2LGpTRFHbq906XMOeXOvJtViHx4tw5jeNEg7ABGlAGlNWQ4Dpqjmh5hg==
X-Gm-Gg: AR+sD100eobgXYRxNu8yIlFAa9VdVR/8hIsX9jZOs/jrKixlAGtdWm+3Ktc3iuN36Cd
	8VA07n8snAWRl7BVO0qei1zv1fQ8457+mD0htTXNg8kundDYn2u3fxnomjSrOTsGGrtwGrGdCPb
	ebj5Ybjqo4gWqe/MsJj/ETdbA3iyIxkU1gn68FL25L+Y0kMGJqNkuSqRjfGbBuUSkgueyNABopW
	KkKBg/9y2QfKv7wqYybPv7RlFnFpabhWt16MD2CZsMZux7iRyPeoE8wCtiq0zq3r1fRkuUKhnZR
	+ZIVuDzHdkkAcpu89/rwss9//17WCVUo38NIWoh2Z5QS9CS5aAZGhP+kzvKrntl0/Br5CdIO8bI
	AA92OLYE7EV3i0ezg5/mvfnyg0yY4jsH+kJyhQQBTBZVUSL2eU8c8DtwKNixOgRH+UXx7oLT6cn
	0WGCMP1IPjzKxO8aoajsdcS+e1LGLnnMTL8aMWVwv+nOqV37kO9oICvbeH210jflsnNBVFMJ7UY
	+S7uxVDgDpXCyQTpNX2QeRjLVmd+ySQH77dqyM0XRe+iDzy9Kcv8gD6h4l+GNIPqkudJ7tz7lY6
	9LFfyQT4uXHiwySGmt1lMzWN1YqMnqw7ck7ZX/7KbBD6gO2udJOAZYtaJ82Zng009vy5BcbRjT1
	sIE8ocQfGQ9GTmhaZT8SOSCjPKApyt+U6jmvURmdAbRWgQw==
X-Received: by 2002:a17:90b:3c02:b0:380:f389:447b with SMTP id 98e67ed59e1d1-3933b8938f9mr593680a91.11.1786651788969;
        Thu, 13 Aug 2026 13:09:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 39/80] python3-luma-oled: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:53 -0700
Message-ID: <20260813200834.1302829-39-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128983

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
 meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
index 1182ad1de3..df30667775 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ddfca5d3a55dc20707b094137c913c4c"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "16925fe668f484803df0683add800b19e5dd7316a1d64eb06ec2ae817473901e"
 
 PYPI_PACKAGE = "luma_oled"

