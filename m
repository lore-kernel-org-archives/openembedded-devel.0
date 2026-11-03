Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8032.1793701453564267736
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=l+84Xw2K;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so35435555e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701452; x=1794306252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOzonca+wKdpEye+ezABGToDSwRPVrp16AY3+xnQLMc=;
        b=l+84Xw2KxIH8d+moSCELjccu8nuypvKI1zUU2G+UijB7Re1y7Oa2fIVEvif10MFrNX
         Hh99W3U3RDKzIT+P6xIox834Q8bRD03+oKytIO91I3P41al4k841shp47ol172rRtuuh
         1eAFbeG12a8fyzOVWgX2Ov+zpfGF62fSDPyZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701452; x=1794306252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOzonca+wKdpEye+ezABGToDSwRPVrp16AY3+xnQLMc=;
        b=b0Hy0rffRoFC/7avWflJl2bqSMI4GcLxZGcdT15Z/+mkCu4YSirvmfqsFCEay7mEnv
         5TMUNjHr3sW9OAs54z6zPKhH19VGKBRSBBB87W09XJ/U7f3X9zfHyYNGELyXWKaiTgQw
         RMzvzUaSaL7ye/ZdFtQkiclhtJUNhoXgu3uxSC/V4Z5BAOvJkpZ3Y+rXDC2Vi0op9Pcy
         lB9v+RB+35R1q3KuTQ1zYmtSyurVODHLawIeh5SWC/Os1v20tyuZZCNJbD3DdfT31hT0
         VRAd0K5fpBzYRkC6X3UT6gjY2QAfhqyOxI+Tc+Zs4Lr+aR333SZHsxgHSIYAp4QsWriF
         cpzA==
X-Gm-Message-State: APuU4Z9vxzneMXiSqQLNDAAYCy3msQO0miDH3Z6ysnUNRUrx2XYIEHtK
	1G/oc+QSAQGTcbcJDH2sMqCOotPk+3n6US+p4KBcI5bjca1NtLavXKqBcHUap9HYlPaZQs/N1xQ
	69DEF
X-Gm-Gg: AYBFou03RKYhwad0doJQcY8BeLTqR3diZIRz6kBeybimFhRzCZpTMN2RfIqTzjiCVEb
	5bkgskEdN6EpbA9C2GksGv197dEHXta1GznQq+zXNwOGbFvJ4fCNaMNl16mCUvHTaTjPU/Ohhzo
	VGP5JYrfzb2VLiY/yznq/Eyq30LcDUFVdjp94+/W1Ck8ragJofbbkVEWRRtwW1ORiGD8sFVbPwB
	CmLOfX4z9ho4Z5fOq57K+NNIPuqSP5/1SJpBCr+f2/ZFwhjjTKmF4Nyki5+iRy8Bcrgxg2MuVCj
	NuL6eDn6QsMP4zFVFpGX4cklHSk/wh1zjBaEBbw5Vlsqr8ybblTM1E14xHsTIPIgwlicIk7o/PL
	dHCOQBC+kzYcJpK5+8Nwp5Af7Qn48AWT+tbAn4BanatwQbvbmhnhvl60Z0qsodVGOB5f2XE2W7f
	NhWC39mkiuxF34+TxQsbV++ATs8YLtemDPBk+ze9bOnuu2R4C853GyxlHB6TfrXig02lqvX/hAL
	D2/WOf1+4rX+ZDH9dY5vdOvnyt4C19QjfnD8LPzPSYWrki6OsPdp9hdPJI90GOVcdXHlTtIvKe0
	x+te+HHcFqEuMA90jTNqp+mALJcdLtpPIcX/aPgJoL97wut0uiAPi03p7OgqWClJ73w3gqELGsY
	cKpk9o/G1DFVg8BZMAi+zBs2kyZc60zJ4PaxqtzfAOI7kF61vGQYgvw==
X-Received: by 2002:a05:600c:8581:b0:4af:29b9:32d0 with SMTP id 5b1f17b1804b1-4af29b933ddmr152430995e9.32.1793701451910;
        Tue, 03 Nov 2026 02:24:11 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:11 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/22] python3-grpcio-reflection: Upgrade 1.85.0 -> 1.85.1
Date: Tue,  3 Nov 2026 12:23:36 +0200
Message-ID: <20261103102350.1952237-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131771
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.85.1:

- Fixes Denial of service in Health Watch RPC
- Fixes Memory leak in AsyncIO client-streaming calls with
  interceptors

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...reflection_1.85.0.bb => python3-grpcio-reflection_1.85.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.85.0.bb => python3-grpcio-reflection_1.85.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.1.bb
index 2a2452a6a7..2ddfdca5d4 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "b50383d750c2bbddb9c2b163b41de2219550e4393e1f1e0fb0080b8e1284fdd2"
+SRC_URI[sha256sum] = "a3257f35cc817e372cfe330ba3411fc0c61f23b09a94dd2d8f91185955c5533c"
 
 DEPENDS += "python3-grpcio python3-wheel-native"
 
-- 
2.47.3

