Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5627.1793252785078277203
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=py2Um9nr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NZZat58U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H1x13829043
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=csz+m/fc0j6
	8W4LVpcwec6zS4im/XmvUQrfFYpA6vLw=; b=py2Um9nrobmkRZ2Kc9aL2JhuyrK
	pRu9hie9rzxeeWpW+uzOTTwZfY2t/CMbpy+JTfGJrMIrD+Q8/zzNWmEySYXl4xFY
	8tyjUDRSXjC0gAOKmOo6hvEAWGQ/N3PMYakYA8pcQsGlqDFlrfmIn7rlLAnI/p3G
	P/z2JJwjNLlI0ReTs6rIA+BgYeHHJRpAiKbAmOG2aQ6G3nwl6ABNZeB++PKrXIJU
	aFAIuaoxn5g5QsYabAohqoNv6+PC8E+YBlB3b+aLVYC5Mvt1BGk8HRDb2TI2W0Ce
	TLUQo9jXpo9xgXHOHrCWpkF3NFQz2jpmqxMK5/33nWSjHp1Gf7zIkfRVoiw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp945f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2855749eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 22:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793252783; x=1793857583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=csz+m/fc0j68W4LVpcwec6zS4im/XmvUQrfFYpA6vLw=;
        b=NZZat58UekgsE1d6dPgrDMbS0BU49vHiWsSvX5m7vzZhCiAUx2LdcAOcOzVgEXT2Ky
         vzWUDMr6uuXr7MP4zPfhVbhH07JHV5Ovt8Am6P20nE5NBJFOMVUIxy87Vubcxhwe4OlR
         AlijNlJwHTHDQZUNm6CIoQlVwzqwM3VfXYzXGmxi9y/9FbfPdJSNtlODi6fnfJ5rd7M0
         s1SP3SkgkGQGE+tyr5QtuVjWAUgcie1LGD/Bx0cNlj2iXeO/EqCCwfZpqtZ/e7ZnjB7B
         pgl2FSSq1TIq9qEWkzf2eWXRdlTUx0Lz2oKEdBjXPa+17d0SSSyPX4h5TgfDRAiRdnpd
         55OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252783; x=1793857583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=csz+m/fc0j68W4LVpcwec6zS4im/XmvUQrfFYpA6vLw=;
        b=qiLNEbrUGlGFrdNkFEfU9nQizYNT2y86bLgap3fGORb0QtwqDOmIvYotTSufiVwspM
         B4lnMXAFJaWWDCTdpqkZw8/bP/6HT6jT9Rwa50WneAxsx60nSrYygnEIm50nTwwl49xL
         kUsxZ241t8Kh6kRlElF0j25wmXWx4KKEHTtzN4ZCU8yLzv1/TvhzHKR2pHKAa+88CcRu
         Qfu6Z1YVGhRn4SoDD6cyg3/HjJexl2NZcdAq22IvBDPawpDyjLjEf3U3uWqvndo5XDvH
         lOxfvfOGfCKwUYbT3t8yL4V7tgKImp0FbruUqvqWt2VYgEcCG9sELy85XUGFDL8KQQDQ
         2pYQ==
X-Gm-Message-State: AFq9FYIKaXm3RHx4MXf3fERSR0RE6IlKwhfSdmhHfQDH87/7vn18n8Ps
	QC5pbRm+OY0qZ3eyuZeqVdFNOE+P3iH7p0jeOzIXoNQs3feAU7WwwdaRb7EWl01h0xFPI2jnHcx
	bgQHF4mEC/Vl00nywH3h1ePAsx5jK1TExcDct3FZXfaL0MCR+Zv4bzV/SToyZnYMmovUjfcB1mj
	kD3CQwwl3E1AOqF9ghXOZM0w==
X-Gm-Gg: AYBFou3ppRuA4Sls73xORszQ6JY2v9dJPrp7eviQBRaSecPGdSQJsRpoS2xsbh0xpWM
	bpfan9fOqsFIbSIzLHOK4GcSuYDF5u2XfuUX+lUScDhGM1z/EXOOhOv6//pS6LJ+tYU6MWKHDbT
	0z5Zry/30FVfTQ5OYYYM3pTAbjbmSnbylJPfRh3oXjqzzefdPn+u4FI/MtJiba5RXwrWZbkQGiW
	O/yTkrnbHQGG7lDqZEKE0BbxPe6XLuSj3sUpU1CWowmTmEnlre/MWqjl8wa5VV2yPgu5BKufsAd
	bAEHXEUi6ctL0pbKvolKqOpMR4xcX9xscyQnyDbnH0kb4IfQXWhqYW2L409ZTVujsz91e6P4YNu
	cgg2LmhDTntDMHbRAgaaX+bdcKvT6vSy7+i6YD1GiztWA2lnKofB43p7arEx3URaXzs3GU2qkk2
	kDQLQx
X-Received: by 2002:a05:693c:860a:20b0:36a:2289:c599 with SMTP id 5a478bee46e88-36a2289c638mr6618507eec.29.1793252782577;
        Wed, 28 Oct 2026 22:46:22 -0700 (PDT)
X-Received: by 2002:a05:693c:860a:20b0:36a:2289:c599 with SMTP id 5a478bee46e88-36a2289c638mr6618465eec.29.1793252782076;
        Wed, 28 Oct 2026 22:46:22 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239d3073sm15670298eec.29.2026.10.28.22.46.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:46:21 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-python][PATCH 4/6] python3-brotli: Upgrade 1.2.0 -> 1.2.1
Date: Thu, 29 Oct 2026 11:16:10 +0530
Message-ID: <20261029054612.2642345-4-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029054612.2642345-1-anuj.mittal@oss.qualcomm.com>
References: <20261029054612.2642345-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX3wh0bGj6BoFh
 128+AK7pcADax6zQGfPFsbuZCDhnMKAQ5XXC46SGVE6PcMReK3VZnG+M8mDPNW/j5hYet8iOEdH
 6r2TqN6DKcESneBy/dbfn0DPLQ/WiFqkMCWPywZxvl8cRLOPeyqr9ggsEDTRDJs+D4OXUvDMiX1
 R2hrORs5bI8dnm3WFOrFm4EgWi6YuWpiSnakcZWoK/d4Ik+UjY6JWU9B7XVUwSrBImp/8pY8+h8
 YdDMuPrpsvrKE20A73n4MmH3461cvq8JIwghzZ60LHqspRhWRM4X/oy2LL+0R+NzrVenB1MavLj
 P+mAsk2iTEVhaC4m0gb5FS1MNRbOiO7RM28kV33esarPQhgIXlIeGHxryk0ZkLG+mhk+FbyKpn/
 H+LwA9EXekbyZKw7FBepKiFI/K6/Elx5eMy824hNJOwfjkdnrHKmFVYRPyj23emnaUdYbnIaTCw
 1XMKaS4jhCbD5JezMpg==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae2ddaf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=k-42gJp3AAAA:8
 a=EUspDBNiAAAA:8 a=Qs3lcTOfiu_M5rj6SRMA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX21Qhqwmyayu7
 oBWenZFbYVISqunUlW7zhs7i1mLkCj6jPiHkNjnac4npHnMVxHhhwKliuTYZM1HAsckE9kdbLdp
 hDNaPawZUv+fvEkvGYol+Y723WPGP0A=
X-Proofpoint-GUID: K_yd4MSyZkVG1chn9b7pSbH9ZLnvtW_O
X-Proofpoint-ORIG-GUID: K_yd4MSyZkVG1chn9b7pSbH9ZLnvtW_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131635
Content-Type: text/plain; charset="utf-8"

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.2.1:

- CVE-2026-111497: out-of-bounds write permits remote code execution

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 6a79ef1cfe1ab5018e017696e9ac3ca4bf053600)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../python/{python3-brotli_1.2.0.bb => python3-brotli_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-brotli_1.2.0.bb => python3-brotli_1.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb b/meta-python/recipes-devtools/python/python3-brotli_1.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-brotli_1.2.1.bb
index f4cdab65b6..b2cf801aa4 100644
--- a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.2.1.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 CVE_PRODUCT = "brotli"
 
-SRC_URI[sha256sum] = "e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a"
+SRC_URI[sha256sum] = "02b2f7b5a83485efe448a44ddf7983def05c3bb1dcf917d4f7154070260e13de"
 
 inherit pypi pkgconfig python_setuptools_build_meta
 
-- 
2.55.0

