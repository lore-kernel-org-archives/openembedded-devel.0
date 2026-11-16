Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34310.1794851686800162176
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=h3KOeM3X;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6020829eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851686; x=1795456486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCxzDrdmlEKtqwdPqkRF5Zu9rSL344oEtJPOwJ9qLVs=;
        b=h3KOeM3XFCzhEreUU1KopMEOlrQvlNBrDazbu/nbNuZNYaCawLZyguyrwElmyfvL/A
         BDfOiw3IlDhUUQTTo+LvFpF3WrS7r7JvVbWlYeB+/qW09uNQKsr8znl0+Hv2RFOvrTKo
         fTTrnrBvPhct9cbEUZ8PeDFE4Q7/XIsLQcCllVdzZrdQj1GmQfVYYUZGhd4SV/Je+Npl
         mFZ6DYNzdR++YrXZeWgRLQGskhNKlfYcb1IRxlC8AlNYb2XZGeEun3L1tMrZ5kgx0PtZ
         nRGDSjI2X6Nc66tME2oPdyfnz4Kt1cEGcIWqhnTALdHxEmSmHnAWFqlh7ZC9BSnw3/Cu
         LvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851686; x=1795456486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KCxzDrdmlEKtqwdPqkRF5Zu9rSL344oEtJPOwJ9qLVs=;
        b=w679eq4I5PqlACCWP8cYcR1O8rwKR/lyBkyj3SbUbm4svRYXHx/LLkAd+GQzPCIrkO
         R/jKE2mlZFLamWkDkMS/I1FpyU09aZzlv2n8yMv871AoOTPOikun30Bwxg7dC2LN+mAY
         ZDyJb8wybgXqIUPUjYS3i6w4j6NjQNO8hLjs1m30QUIJHuHO37nlKXob0+syPPNG2vEy
         GoA5iywgcDQNrHbkwHYoxIsNPJXCcRVhqEmxP5/PwUICb5NNaMxhTHvNqgkMh5JdB6JP
         dCfAF0puQjGigHrTcj5T9XpVG07WB0wLu0IOANFivgm1ajk7FRTKe0Kx8bicgSbpRiqf
         bR1g==
X-Gm-Message-State: APuU4Z+i9bWKBFxmwgS1RqIy4eKajJGpYiWlnWbD+Xb4wVg46pg2gll7
	3MZBY/71gVQuWwtRgR9kE2iqRZ5j3M1xgriZCg7sI6324Wvgg0uX07eHTHmpy3ek
X-Gm-Gg: AZFdTZcyrILZkfFFRweVTa6zbFuS5BeeykvprqpIeJd9wBBgUdScBI468apOfcgM0tw
	VycdguuydSNGpOb5RwtFLwJKn+3UfDGi7K67km5p/FEl+kq2jjr3godMT5W/gnS5R/cBgkl0ShN
	TmlEqyp5yw4DWDUfrBm2dlP4zqSJBbEAbeUB/YhkmpDCWPlh6ciQeOZPEghjbs3NAsa1eZrqktM
	jjn6CW6+ImbupSEaT+cD7fJmeHpWBsw/RosOwO3k9pBCfox39EomJmC27NfEPy5cnQ5dNDy9+qR
	HzP5FNGI9B16kMkDtA73Zk3G4KAezWk+bI21Qj+sfuty0OPmfGbIL6WG3NKK8BgTLU+kHBl8FB3
	fvJLKJjC0npGo9Sb9KZ6nsDiRvOhMblfWK1VfVj2+dYooAufJngHCpR44B5IXcERnhBdTqpQb5h
	ip4sbpt0bAAUdHoIq3wavMLlSw95vr1W0rDHIK97nHNmnAZgOsafYgUgA/rFoqxyYM+ZnVZBPcv
	GP/C+T/lydmeYCr4r9en7OmaEL7AwzwxmsF65whV5k6MEPgDW70k2EHD8o/xEOAzYrIP3uC9Yh0
	c1H/V1+nuA8YEIga75tcyODrwkkICdIsRIs2568pahYbC4ADLWI74aNbMwZl9aIEGKDcgTQyh8N
	DIUg8PqubBx3lFZNGLyMRmAQzcEwWhwy3GRSOtN9J2x2VPoUJYsabSuSiSmdhXvEYZmKLBR48ex
	2jcdYcLpAUC3Myi+vvhK0A0N+YSpGlGYaGQ0Z6kihWbt1f6RtfD6j4s9LNTn250FLAWbeK4/Zyr
	uaR2/V/RsHcPLuqMgNzHtEgPQVtJ5xOvEcQHPOvtVSglnqmjmA7POiyyx1qkYugJREHODEs9AFq
	mrPO
X-Received: by 2002:a05:693c:6293:b0:378:314:4033 with SMTP id 5a478bee46e88-379679e29f2mr11482919eec.32.1794851686130;
        Mon, 16 Nov 2026 09:54:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 030/105] python3-fastapi-cli: upgrade 0.0.33 -> 0.0.34
Date: Mon, 16 Nov 2026 09:52:42 -0800
Message-ID: <20261116175359.342679-30-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132486
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...hon3-fastapi-cli_0.0.33.bb => python3-fastapi-cli_0.0.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi-cli_0.0.33.bb => python3-fastapi-cli_0.0.34.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.33.bb b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.34.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.33.bb
rename to meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.34.bb
index 106f4d8534..56283d5f40 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.33.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.34.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e0cf8d811ea2046529403707b266fb5a"
 
-SRC_URI[sha256sum] = "94f19bcde4bd6ae26328292ac864082543262b7ee9f5d11bd7224614c22fb958"
+SRC_URI[sha256sum] = "7eeb74cf83edd75d22a9289713db03d8a0be3ed7a8daa48a3703a12d4f2a4615"
 
 inherit pypi python_pdm
 
