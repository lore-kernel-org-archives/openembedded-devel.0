Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23E9CD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:24:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10558.1781683185708415941
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gS6uIaOk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Ia6VuWui;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H7kij12170092
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 07:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IiqFH3ghZZp+NyF8kHjO+FDyRw3Fk/Fb6D/
	rWjXatmc=; b=gS6uIaOkuRopAM5INvNgRRnoKbjgXzhjJE2D7IfEcrTEz48w0Q7
	DGGX/o5gLgwiFn507A1rwtRVZe2+wsETOURqkVb7qHnYpvrHMnHYPjneW3ck7hZ4
	+SxlH+TPx49voegtgM/ZFupfVjipiAfw1vj0CyRkiBVURplxqdQbXWVYvPMHKQP2
	zlaFiQlINTc6r58fPdM01x3ez975GycJ0nDy8O9XwdPuNMqFqWGjIOYR8D9WWwKF
	eE7qZyIDnVnsxOOGqQcAn5lZ27VsMI0qrNSBbRnxyRXHcsR6gaz/8e0T/ARndO49
	/7pg0LoSJJ+c+ZcmkyxOvDCCCgCETJn2GTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef2a4pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 07:59:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91565f8c589so122989785a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781683184; x=1782287984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IiqFH3ghZZp+NyF8kHjO+FDyRw3Fk/Fb6D/rWjXatmc=;
        b=Ia6VuWuinDcAYuZ4EknsEJul65bIOS191vsvlO44/2mEbJ1HEa9g4i4EXk/iT7B6So
         iplGRc1PK0fkHTpQ8SBYsgGzY/maLNvRGuIe7AUbTcg7UY+1xzzkWgeAUroz6+JSWyr0
         Dg4LunrVT1SanD2mrjrQFTEj1WBeO22d43GY4j3JvqnEW0c1HDY8rDSaEvdnjSFgC+aR
         rPRzYGyd+3Pl9Ol9wrYlPNLwxioay71uBn/tapOatJTDf2rSnhHyA1AktLCFtccK6OwH
         hStXUKlbnRp1rnm5kBmhBEDoserbny61OyUm0L872KqNtTN4vE7ewtYdI2RoX4fdPzLK
         QUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683184; x=1782287984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiqFH3ghZZp+NyF8kHjO+FDyRw3Fk/Fb6D/rWjXatmc=;
        b=aYWTC+lbTJW3uudtnRnX0hHRstrCFz+h2eTiNbgDmZir2Hby8Uh/uQivMfwD77kE4Y
         bxjDBz3ArCkyuUtRBMdhFU6r9yztmZyOl5CJtDjyBm6pNSefFrQ5qcmxksI1RgvgTRhY
         /VY7jh3mjcUeoL+aNHNX2RfrgJrdHapVm0DSW5a+c9WPQr9a33mP6yX033wWueMQTvv9
         RGLWthSFzgqm/DweWZJ5IxG0qmCkrV/SDo0bm4B3LxWsGCSKaHLM9yoVQM0ughBpKc29
         5/xpjUQces9ceIU6d8i6Q955ugFrMhPto/ohJtzga1Byt6Z1eGfsarX83M5UWvPwbSxq
         sGmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VzcE6xQiM/7GJjQrBuz4B3FpUjw48jCJQh7V1L+5IQwVFU6HqRj6lLj7mbR6WXMxhHGkyLnr9IxvAGwj2ajgEnT4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCzZWXhMX2IV2/Mva/S/lSzmaeiC0C9vWgvCDhGgPBw9/VTkSF
	9kNs0U16hNJcMidjFbDQm6F52jPiqKCcmF+phYB+ztXX7a9Eptig8DZaRxX7AlqxlaMx/NfBWO1
	QKk1xSh4VsOILts8agF9e5rFb0f4YnI2qdqqP5zhxGzDuqBzrqGexk8E+QY4Ab4Pxsnud7UKly0
	J4eoEcXv1g
X-Gm-Gg: Acq92OEGyjjUhT0QcQ/xEQ/wkod78JjjHCqAeXpeMWm1iZ9bRlJI/Xte6Hd6OsfCja9
	S9+K3JoRSIzAx/RyBJYRam5KgVLdryTyg7/hHzhkRnadv6IO9Kz9yO9ibp9A5IprFkvMtcpeGUo
	SS1FzMJ6H0ybzaQuyg6yHuHvR434vAiG6Ew2ziI+xbLoCdp25FizGTWXUfCzxO1ZCdCkynJr0HF
	ANdJkEUAC1NCeQlc/pkEDDvFK/Jqf1IoTewmOxnIMsjlFuJtiAjdzJ/3Bi0tQSHe/SWhCl31lO9
	Th6fv1hBh8Y6j9QKHf5dVzcmVQP/W9soBzcKmFW4cP/U0KXpKR2Xln/JtvasSYCSEP9JemTMg2r
	5h+2tqQJUnZEY+EtkXQ4IG3ab1SQ8xQeJQ5+Ud8U=
X-Received: by 2002:a05:620a:4041:b0:915:29cd:3082 with SMTP id af79cd13be357-91dca2b4111mr286079885a.8.1781683183668;
        Wed, 17 Jun 2026 00:59:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:915:29cd:3082 with SMTP id af79cd13be357-91dca2b4111mr286077385a.8.1781683183220;
        Wed, 17 Jun 2026 00:59:43 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:c856:25e5:e249:5e0f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-461eaa0d1c7sm8430118f8f.7.2026.06.17.00.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:59:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-gpiod: update to v2.5.0
Date: Wed, 17 Jun 2026 09:59:33 +0200
Message-ID: <20260617075933.40644-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a3253f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=ceeCzAgHAv3Yi0J0w7IA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA3NCBTYWx0ZWRfX+ADXap9C145X
 ougY0zvv42/ZsdhJypl2a4Gey3K/aahejoF1muu0KTcG8c0FvPrXoDaNsHkevsgEr9OC2gMNEyz
 j1/lrey8n1AAUeUGKP4K2XRscnsIG6k=
X-Proofpoint-GUID: E4lUGShi96ZN9c3FuVi4Ta3MBGb07Bqj
X-Proofpoint-ORIG-GUID: E4lUGShi96ZN9c3FuVi4Ta3MBGb07Bqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA3NCBTYWx0ZWRfX8bif8ekRowdp
 6PIX2TsFySBcsa/cbg7V29DHySyjNr0MrHgqXxXTffjUhlHWYLL5/WzGS6+mPSMPY+AZRO7ACpz
 E+WBJB25GQViQh/DoHxV2c/NbuV63vy6riXn8Z00EPLsn0FbZyLR1y8h4p7iIgr5gFifWFDUwZt
 i2DIDdAdHCd+vgOo8OZdg53SjJ9y095neiEorumxGIokzAMA8CKKZjAwWIHse2rCkaF2y8daqQI
 ZqcPWYMbpWCUcAhF8Ks5ZQPgY1RWVF/SfQshxE5f1bOpZMYihD1zcTYgEZyz8ljCwiE9Exks4/l
 sty5Vm1i83mDpYFGFU/p2TDYNCGNiB0iXR+5aXjhk/g3N2+BcT+oHlhgFAabgJ2MqkXVzhfTuYW
 DoYMWiRW/CrT23U2ONAsMH/xhDcWZdblzPB4WA4Z+RGBDo9ph+IffY3OS51tgiVN+xeUPAQDCes
 J1lP214PlCPV1IWmP3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170074
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127637

Changelog:
- add support for free-threaded (no-GIL) CPython
- generate wheels for CPython 3.14t (free-threaded)
- drop support for Python 3.9
- migrate the C extension and test modules to multi-phase module
  initialization
- release the GIL in chip_get_info()
- fix heap-buffer overflow bugs when setting/getting line values
- check for errors after PyIter_Next() when setting output values
- check for errors after PyIter_Next() when reading request values
- fix reference count imbalances (missing Py_None and line-name
  increments, erroneous decref on PyList_SetItem() failure)
- allow closing a Chip multiple times without raising an error
- allow releasing a LineRequest multiple times without raising an error
- remove a duplicated edge-detection setting
- add a CHANGELOG.md to track changes between releases
- copy the license file into source and binary distributions
- require setuptools v77 or newer
- remove wheel from the build dependencies
- add multi-threaded tests
- add a dedicated lint dependency group and update linter configuration
- apply linter recommendations and add type annotations across examples,
  setup and helper scripts
- modernize the C extension using upgrade_pythoncapi.py suggestions
- minor internal cleanups and performance improvements

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../python/{python3-gpiod_2.4.2.bb => python3-gpiod_2.5.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.4.2.bb => python3-gpiod_2.5.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.4.2.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.5.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.5.0.bb
index 87765c2482..3cbeeb772d 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.5.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4b54a1fd55a448865a0b32d41598759d"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "602aae17ff365bb8e2a30ce65c6bbf2d8e7a7e64bf016e82e4fd4c730ef69ab7"
+SRC_URI[sha256sum] = "53ae5a1f14d6388c155b591ca0fc0cfa73b44d4f6d8d117e8a9e68f5902d187a"
 
 inherit python_setuptools_build_meta python_pep517 ptest pypi
 
-- 
2.47.3


