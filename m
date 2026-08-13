Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16716C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:20 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27815.1786651811866662260
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=br44LclP;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cfff5f88dbso4903235ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651811; x=1787256611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1kXUB1oYCgwsvuPCjkgYjA26ZySie3aklb0VgfuZI4=;
        b=br44LclPSvtWpb7u8k2dXb8qDjHMmPpncdvgU3v1rMvN6M4HnfqoeSujIJJx6gikip
         WeICG4PCHZPyrdRWxsFGK4ebAseEWz+CZ7pPlgjAEgOn2HNRsYUMnskU/+bmkVBYz43W
         HOZ0WXNV7mIeRVVFhDxRbhxiwtweD+41WPqbuuTXRBAkSHldolmmr75TSu/hawnDOhRA
         qymPzUsyHIDcCCDxZRWSqv5c8MI7Wuc+v6f5XS0FfFPVn5iVQXEZ5y4+QHPHuMtQGE0j
         EnV9SD8j0GC36EUC6g1LjFHGC6CMPkAtvcD1E9qsaHFDVKgkjeQnLHvvA7NgMYR4FVP9
         wcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651811; x=1787256611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v1kXUB1oYCgwsvuPCjkgYjA26ZySie3aklb0VgfuZI4=;
        b=kypmfNgk4FZ2CQj1R8PO2Jf2UWR9ui4crMHYfLWY3OPY+WvI1a6eLbF/xgiqNVpRbQ
         HurCUTffyjj6kTxX/lG0qXrG0n3CiDZB0fo0ItnmCBy+xxWRjxrTnUr8w+Cyph4T0OBv
         BJOkMxh97u3NmVKhOEq4yflr0Jj/wBXvIxYMZOWy49oy98gflSo7ZFI6B/cJNuj+O7Uh
         M+ILX2czptsJ8LfeZQ6GTLIGBd6H1dK1ipqGT021DyhIcsGuux8uJ/Gpu1Fb1Pe/oPx+
         Ihk5xBHGxG06bg53FydCWY4rZKSTe1njCjhxKlY/czV46NepusOn370wlURYUTqkzTW3
         nkDw==
X-Gm-Message-State: AOJu0YzBti+r04m5EtbljERECnH0nR4JbYlWg6eh5VCmYC8sLLKTd8bj
	/UhLa0M7skK+xX7br0jc390pCzDcMAaLLN0pmZlSLBICRGAOrZSQBYVLn/qsozMe
X-Gm-Gg: AR+sD13cjq5G/HBU9ED4F63cu6gaSlhVqwuQf0r5QLXLmAThFAJL091bz/lP9RatOdZ
	p8LDTqHbXVl//zB41gPLL+CSfSuXYrfN4jpIvcwImQu0MymCTPfe8aumdAAHnpaioXMIHfbk1ZB
	WCasBNPWipJvI5Gii9hP/RA6Jl4uXQ4gvg7NXwulnbs+psrQpaD0TOUFsq04azocn+fySHfOU+N
	GWCR2skl1f8BOXsStLcIrkqNdl63ClQlsyetaxKmcenKk6H3wbixmveLVI0VhAJU/P2FvP1eOxv
	U9n4j5GNowfnvicY4aNWeI11rrIR87iu3BUaZo71RSjkq51ioOjnFoNIVPponU269HyomkUxV4F
	xKLWowpptQ2eqoJg45LeWTSfk5eILr+AC889rDfGEYbmLh4naasT6NoNHNJaoVXnP1xEU4qxbJL
	JUO/e9ftqOlYewyw4YCd+C6pCDXT/OEALvci4jlYZWVtaGEDEult+02s47MW+ZZmNaA2QXw2VGb
	PEVYeQ1/FP6YECH1rqYXD/vitZNXOZZJESWaCQGbSmVgHqz7EDFAFXPYItX78SakgzQ9XD5nPsg
	slNoDiTWa44cscZZoovh5qnXU2wlYD2YA+KWw4nO2+KD8C7385gpCuenWEGoASaPeMt9bDfBR9i
	q2/zp4AJb0zKGOjhWunLRLYPEq0LR8Ef07HnBYYUNLmIMdw==
X-Received: by 2002:a05:6a20:3ca1:b0:398:8870:b58f with SMTP id adf61e73a8af0-3cc71b8a733mr382956637.14.1786651811061;
        Thu, 13 Aug 2026 13:10:11 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 51/80] python3-pychromecast: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:05 -0700
Message-ID: <20260813200834.1302829-51-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128995

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
 .../recipes-devtools/python/python3-pychromecast_14.0.10.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
index 1c607b9bb9..8bd4a4046e 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "f05a1c8d727d4f104c8c731688053033e05157f2ab81bc8eef50ec0c62
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += "\
     python3-zeroconf (>=0.131.0) \
     python3-protobuf (>=4.25.2) \

