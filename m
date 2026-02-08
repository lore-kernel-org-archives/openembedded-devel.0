Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F34EF06EE
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 21:17:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34141.1770585452226288980
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 13:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Bj1I3flj;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=UfQJPVFo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618L08JF1494003
	for <openembedded-devel@lists.openembedded.org>; Sun, 8 Feb 2026 21:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x/3tT+/Aa9R7mU5TcM2KsIclNtha+vNSX0X
	25ov/tqw=; b=Bj1I3flj+CnVfM92i55zTc2yEC07AC8MoZ7LQZ2HRLGqaNKvMh0
	7bn/SesAJ+E6NPzwUw4RaCw7R9s01yEBzMWzSugiy/B3lR0vKK5t8FZkSXEFInpD
	SjeEJFtiCgTatuhMYqj0lMXdnjEmLzcfh1YWbI9h9+RnrZI6oEF1Fm4ZIu6z6A6C
	wBSDr006X41kjUTLCxxhc0scsTGdMS5zJroK7RaPsZTAz21xRqRJwS7/2KpWYnuC
	oqS1WdsBlmBbQXLpwOyYlfj8CgOIVdl2g6wti4OK9Atn4o8MQyUNQAbtuOeCtHQD
	0Z+M5+KKtnJnMDyaiyuOyFQcF8HN+SlLZBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xcctxmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 21:17:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ab7f67fso1084915285a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 13:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770585450; x=1771190250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x/3tT+/Aa9R7mU5TcM2KsIclNtha+vNSX0X25ov/tqw=;
        b=UfQJPVFok7qGwZSxEtvKO6JIj26lQOfizmyP9GJRKTjFBT2xPYhvAbE/CRHRSDvk6b
         Iwdv8tdNu+xEWpCqoOWgdRC1BhzxVSwtGVQKGSYn41cp3a9JGukuatYfHv998lUprpMZ
         CYdwbZ/cvkphf9Y3M3sGN6ZOTEr0CX/tTD076GEl7ED7u/3NpY3fJZtA1iLu5vOYjHWR
         8NBqOrTG+xCcuiIHAlqlwlSdsumnM/2RlrbtzIaaxKxS2DT56lerBxqNBhcWEb4Q1yQF
         3kA+GE6EucWnjsaGXaWxvbastScKuRgYvZbfoQPx7nZFjdzTBbyfUCn8zcRYY8KyWGgZ
         ldaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770585450; x=1771190250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/3tT+/Aa9R7mU5TcM2KsIclNtha+vNSX0X25ov/tqw=;
        b=eHnyHiHdCgK9sEKE4uZhpGyTCQ/Ybw8ora3vqHgf6sPMmfiXkKop72EJEFZYiBiAqJ
         Gep5HBTG7L1LGBQwVKbah2rJ2VLDkx4906znBXHncJM7A5xFbJDPkV/yrXRJxfCdJS68
         hKee5jiDSqK97XqKuvVXdXdNia/BtYTfbknLm/m40htCd0op1ouSNVGB1zDr8vK9aGFr
         8Jx+4Fmz8y0++GqobFXVVNAyQZkL3DQHZPkn0FbdatMseQ+TfWJ+DL/ZQsf6HvfWjZcf
         rrpAD0A8LURC3rLW6oXFknVYsLJPhuKWGOk9OZZLTtn59AUjy1yXE93puLfFtMOFbPRB
         BDzg==
X-Gm-Message-State: AOJu0YyEYSKk9uA9TllqmYM+3db4JApdYzSeZ+GKjnEPyIyDF4zJZbL3
	rfUHutZBLAH+vri9hyrxKAps9tqbjHdVkhzmHiw23TwksqtN9TGZw7Ej2/SYjVcf7zBCYvZtaTP
	uICKIWzw2kIqsncLtBbYX2pW4RtwsxBg8XRZ0mdsnSI5sPQ6zebhGV0zaUIbY2tcjBRjR1ivbPk
	c68wT7mQAvHYk12jUY
X-Gm-Gg: AZuq6aJgNpv05nq/LS4WLpgSAsakca6WrRXyUGzndFuPzoER3jx4B+nPN/IdB2Iqkhd
	TnhWvwi2ghZYOJZvzwc8A7nMNnasRXXvZ3teBvkNKCfuCrVZF5EcAS6EjWIMBOfs/frkEelAJLh
	izwdwH/YMFIgwErWfoqTrYigVeoqof1VZQKpf2mrP/0qFm2nlxvuuf8kUgBsDfJ6kqjD2Yxp7SR
	TbkYpffRWNPZKlhQq7WehAjizvOhAi9B6iCoczmUca9y0YAX3KATv/BjYT2tdaS9zpGvhDFHvrZ
	kUNT+qqXoB3IxcFRKDpO75qh3Ptm2SAREjHHo41husewdZFfCHSRIf4vPUiB7YdYVJsAFLeBBaj
	PwwAvGsxfBFGuyjhH/mFKkDBu78284phZ+Hx8F5ejEuN1CDQq7eyuizimH55Kf+hto1ZqLskRuP
	cXIhFDgssKkfEaJKPjJNy2m64=
X-Received: by 2002:a05:620a:1910:b0:8c7:1427:491e with SMTP id af79cd13be357-8caf1bc2e22mr1245998385a.78.1770585450313;
        Sun, 08 Feb 2026 13:17:30 -0800 (PST)
X-Received: by 2002:a05:620a:1910:b0:8c7:1427:491e with SMTP id af79cd13be357-8caf1bc2e22mr1245995385a.78.1770585449597;
        Sun, 08 Feb 2026 13:17:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44d00adcsm2168453e87.40.2026.02.08.13.17.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 13:17:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] opencv: correct FastCV dependencies
Date: Sun,  8 Feb 2026 23:17:26 +0200
Message-ID: <20260208211726.2971560-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDE4NCBTYWx0ZWRfX9U8hwt7SWEyM
 C6EuwmQ0ciaxogy65p6+j1t2+Fdb7QI4c/KUhdMUHB4Rg30cezQ6egawQgnKYqJTgG9uqPHSVl/
 Mk3K2hqrKiL82/7aG/zzfxfxzsXcuLANZpabyPE0SOTRnGsmZYFB4cjVKj0gZbtyrVhdh8KEb/n
 qtLq8eAaD4v8TpYR58NMAfZRBSLMRzAf1K+YJLil+NtALXewCquIfMCjTCNx67yGVBcEBBneh4/
 z1oMhDt30j9VZzXGxcwN6NAIMAsnFROJFk5P4xIfW0V5hQVbNkM+UsPNdz6LyorGe8tC+8x/PnU
 oZCxGZUjuVQ1PToLtKfuBy6Usr39p9W7j/v746v681f6s0OO8ShvMA90m06ITVMG8T1djpxkyzb
 vHsEu9gE11H0eRJn+Kdry0RYLVUnH3T5pz1rXYjxxPusCSMqXEWKpqbr/4uenwIQo6H4hTHc9Fr
 t2MYoCu+GpYHg9jelkw==
X-Proofpoint-GUID: StXCDAT2GbdW6ccgmQ_98XB08EZz-Z1_
X-Authority-Analysis: v=2.4 cv=ft/RpV4f c=1 sm=1 tr=0 ts=6988fd6b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=vU8FM-GEKBDGuenybAQA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: StXCDAT2GbdW6ccgmQ_98XB08EZz-Z1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602080184
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 21:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124287

The FastCV stub dlopen()'s libfastcvopt.so.1, but if it is not present,
it is not a fatal error for the rest of the plugins. Downgrate RDEPENDS
to RRECOMMENDS. While we are at it, drop the dependency from the
PACKAGECONFIG, it is handled in the python code.

Fixes: b77403017b5e ("opencv: fill in missing FastCV gaps")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-support/opencv/opencv_4.13.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.13.0.bb b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
index 3f4dc23da24d..981b06e33b4a 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
@@ -124,7 +124,7 @@ PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON -DINSTALL_TESTS=ON,-DBUILD_TESTS=OFF,,"
 PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
-PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON ,-DWITH_FASTCV=OFF,qcom-fastcv-binaries,"
+PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON ,-DWITH_FASTCV=OFF,"
 
 inherit pkgconfig cmake setuptools3-base python3native
 
@@ -171,7 +171,7 @@ python populate_packages:prepend () {
     fastcv_pkgs = ["libopencv-core", "libopencv-fastcv", "libopencv-imgproc"]
     if bb.utils.contains('PACKAGECONFIG', 'fastcv', True, False, d):
         for pkg in fastcv_pkgs:
-            d.appendVar('RDEPENDS:' + pkg, " qcom-fastcv-binaries")
+            d.appendVar('RRECOMMENDS:' + pkg, " qcom-fastcv-binaries")
 }
 
 PACKAGES_DYNAMIC += "^libopencv-.*"
-- 
2.47.3


