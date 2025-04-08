Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D500C369A5
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:21:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.71827.1744107662817398659
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KKUx7xHM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GPlI010533
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Apr 2025 10:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xMJqeIFrrc5xejqhfX0BSPBcpHSgboDFJEh
	YysNkx6w=; b=KKUx7xHMlNG8m01G7Mw1+3mSAD8Pzhgx7KJob/Qz6bjUyNynA45
	ds7FmDztvzgv7Bjs/3XjHQokmqq/tQ0KwGKSs7jHBYWZ4QC1OYTZn1YoEet7eyvv
	WYYKfw4tBP/TTjGKFM1SnCCGidQn2hc+N3J4M8TNKdHQCkxoHdXEv+ir5VzuHnQw
	/1aslSMvlcJ1jB3eYdeqOFcvVd0yZgmNPNKXGsG8zqhcpr/K2QNzmhWd/6IOqWEa
	fKAkX0VFmGocWs6KzD7BMa6XCKVkzhpDHHnM7HeCi1VIlaiHKOZvG3qz9wU3HVqL
	6tJnfCubJhTv6IYrDt+NhA1ri0kmLbs3LcQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1fa78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:21:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c548e16909so489802485a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 03:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107660; x=1744712460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMJqeIFrrc5xejqhfX0BSPBcpHSgboDFJEhYysNkx6w=;
        b=vRZzJwh6ytoMp7cJAtVxfT3jyWow1o5SMjFTF4H7St7ObUXBO2ukrjH2ltxiZochfK
         O9+XakB/WDEnCMiXxX04v49d7/ob44NXJNQ6mp+WPi0esI4era+ACR0uqjDXzrk14tR0
         4/NjdVEC926hEYk7GVQVU1V3vkg8L6E0j2eE2gL2ntTBiGPFrmmrw/Cu0CC2Z91WL7IF
         GO1osrUXNIdJGeO3T9A0d68T4wkBIUE3iM5MC7DanuUYWAUBlQGlNVy8sQuPGW4OrbtW
         wrBJjnWDR2WHzj1reCbkQSA0z1UTTH8/57M2G02ljcMEfgUMy7VaYC7+ETauhGsCTZir
         12+g==
X-Gm-Message-State: AOJu0Yyioi0zLg9obVUqfVQ3Fs6XZzwN2sQll5JG6k9RLEqwF/lHkpSB
	WfafjJT48JzCx4cBWj6FkkdRXlcYRjHliDLaTpnRNB5DHaETgBFWxFS5MnX6Iujehnf1Hb7Nog9
	QYsDboMgVcQLFd2fMVfqvi2mMJxX4R9p4RFX/ro/dn+9dSQQ6FzW27st29cjUypM4JwnB+NpPcp
	2DSVCOM8H3h7q2
X-Gm-Gg: ASbGncu+uatzjDy62k0a5n/NrzYb+XgMcdD5zSlD9NFffELQi69BEKOGNr3EZUWwL+j
	hjwZ1O/RoqWLtEmRdhlhBfb1VN3iRJNR2VXPK1aJZ/2ByWd8lrZ6U/4PFgYA6PiJ1F/4cXlBfvG
	6BS6eS9Y7lYknMpHs6x9gew5D6ecmuWFCOiUt1fR8kDbChOExVO0WUG0WD/rs5LBt1tcZ6VbaJX
	0fxJmMJidet3HQxBO9E+8baPxF0LGJm7ogysbiYRVQ1spGVOnKoAN8lrXYwmb9nkPB071iYESQ5
	vgRcuitutqg5UsitNNesCprO7to4HuS16sTGciFP4E8GFLRcVExk1uIXbyiPtGzPEFzZFBKZSW0
	33J0TxrBjERkZd8+YC294pLE5Yfti
X-Received: by 2002:a05:620a:3950:b0:7c5:48bc:8c84 with SMTP id af79cd13be357-7c775a0f7c5mr2002312485a.15.1744107660446;
        Tue, 08 Apr 2025 03:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfrmCGMo7fFkI5kl9QLwvd4clXBKTgEq7lh3WNPcNvp1w6mo5s2Cuhju2SFWqy39PU3VAZIw==
X-Received: by 2002:a05:620a:3950:b0:7c5:48bc:8c84 with SMTP id af79cd13be357-7c775a0f7c5mr2002308685a.15.1744107659577;
        Tue, 08 Apr 2025 03:20:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65cc20sm1482588e87.165.2025.04.08.03.20.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:20:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/5] opencl-headers: upgrade to 2024.10.24
Date: Tue,  8 Apr 2025 13:20:54 +0300
Message-Id: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SdOSuQLcM_PJGJQjeYImPV-zFm0ItnVd
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f4f88d cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=ah-JWN_I9DHScTD2bpcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: SdOSuQLcM_PJGJQjeYImPV-zFm0ItnVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116698

Upgrade OpenCL-Headers to the latest release. Upgrade opencl-clhpp with
the same commit so that they stay in sync, otherwise projects using
clhpp might fail to build.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../{opencl-clhpp_2024.05.08.bb => opencl-clhpp_2024.10.24.bb}  | 2 +-
 ...pencl-headers_2024.05.08.bb => opencl-headers_2024.10.24.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/opencl/{opencl-clhpp_2024.05.08.bb => opencl-clhpp_2024.10.24.bb} (91%)
 rename meta-oe/recipes-core/opencl/{opencl-headers_2024.05.08.bb => opencl-headers_2024.10.24.bb} (89%)

diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.05.08.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
similarity index 91%
rename from meta-oe/recipes-core/opencl/opencl-clhpp_2024.05.08.bb
rename to meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
index 25e7fd633fbd..b815c22eeca7 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "opencl-headers"
 
-SRCREV = "0bdbbfe5ecda42cff50c96cc5e33527f42fcbd45"
+SRCREV = "c7b4aded1cab9560b226041dd962f63375a9a384"
 
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=main"
 
diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb b/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
similarity index 89%
rename from meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb
rename to meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
index 8663b818e3cb..b47d3f9711a1 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
 S = "${WORKDIR}/git"
-SRCREV = "8275634cf9ec31b6484c2e6be756237cb583999d"
+SRCREV = "4ea6df132107e3b4b9407f903204b5522fdffcd6"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"
 
 inherit cmake
-- 
2.39.5


