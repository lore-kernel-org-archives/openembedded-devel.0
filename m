Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB47C3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:54:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.43437.1744019640465492113
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=awrXACok;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378drdS016213
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Apr 2025 09:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+dsaEnUZKdq70c6yWum5FAybVW0RmpjlBe4
	J2mkUVi8=; b=awrXACokbXDwP8r2Z0D+UjJlzHlfijx6vrDm7pdP5Hp5NgyNLxK
	/CXd9sDc1B7nVr5ocX6AlXvUiDgVi9+NsWog47jl/xu6QHC1YXF7jxFCYawUTw4n
	X3yVu33YHOnNzjlaYh4SrORU3sll2wUGMkFLvkql1ChqZGDGrtcIHouZOBehrXGj
	iJ0y9WCHX33VU1G+G5xG7q2rqbEjH5pzUNWBuAqDhW0tomwNCeWIJ0ZVpEIZvUKc
	dZhFrdWGAf9hSph2EskCZy/XpB/pfbIg54/l6P+0Ju8rM/Uly2054afxFTCuE170
	e5ieyKVvEpkJdSw2ymB8UwMdLC83fUb5pKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgbu8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:53:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5b9333642so424923185a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 02:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019638; x=1744624438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dsaEnUZKdq70c6yWum5FAybVW0RmpjlBe4J2mkUVi8=;
        b=if9h3tbG4n/oW7wEn8RUZ2T+IyykT6IYtUqu4Rs8DHvJK4sz8Ukk94fslG9oSlXNxW
         EEOs5bCA6OLhm2EOM4DyBg9IELI0jgJ+JxcnIpXgzTLw0JE9AHVFWIZucUEyn1ioxKJd
         POK0Vli52fo0RAjPI/wOeuJqIPs6Fesu8gPgqsd9AG5UZ8jGoxZxHSpJlGW6nt+kETEZ
         r+ANMqLm9GymqoKgVOIFwEVyj85Yg8B6Twrq8xH5wuKFK2ofC2EXM6vw53OolBwS/qWM
         Uiz/urasTYs6R76c11qznc7kfy2pTq6tiTNTDXdoYEBdiNxX4krryM3LRUewaL0NM8td
         3/FQ==
X-Gm-Message-State: AOJu0YyIzv7VgXhXpis1Eag39YbGzxaM5vQkTnrT6/sFUDIVoJmAGE26
	XaLQHalb2bfFIAyGpggEEmrql+OIUlQUyRPlXfPBRtS6yckhbG0YV9dAGAYCZslX1oj3eamCD+4
	UnHNv5Z4n2na95DihJXMDUyma2dlR5qlB/6oEv4fKUO9En4PCZQ2avqAfpaHtIdFyprsBt4OxGg
	MSQr8iS6fQDNY2
X-Gm-Gg: ASbGncuqlaah7Zz1IVJzrKWdcIGPjG4eZZCKrya5zsrhw1FuKzyUdb+JCNb19McUDlZ
	9vrT71SL9dQ7QjRa6/rO9clCuVTLf5Yjf1aZL1HFJOjt3YN8nhPfnEvvCDRB4oXefXDshvhw9aL
	VEMe+hPqzPwQEeseVn8qILyiPg9DaI0ufTfOja7rT9VprwQImcWP5x2DHVfJPkNsmSoq72y3sxA
	XocEGhhVVA+YxpXlmPSDomp5jbaQRgSG/ztr+Ck7XYIti4w6CgDK6YhprI4RcWQk1uLX0SBEh/R
	IrfMKZ4/WKZDEejFx/maUdRHc2jvP1hcsRpfxnjUNohOqh69aiBDinGLDyQbg4nRtGMbDZKKxWS
	Ti2j7YXwZR+0Bowkf8YE+TLbHk6ME
X-Received: by 2002:a05:620a:280a:b0:7c5:4b37:ae49 with SMTP id af79cd13be357-7c775aebcf0mr1598880885a.48.1744019638404;
        Mon, 07 Apr 2025 02:53:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrh4j6ml6UnckewsDXH6ssd5LZK3laUebx658p4bMeDxEwlr47SF2b/kdL8bZ7nPAP6/R6jg==
X-Received: by 2002:a05:620a:280a:b0:7c5:4b37:ae49 with SMTP id af79cd13be357-7c775aebcf0mr1598878685a.48.1744019637995;
        Mon, 07 Apr 2025 02:53:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65cc2bsm1196659e87.167.2025.04.07.02.53.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:53:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/5] opencl-headers: upgrade to 2024.10.24
Date: Mon,  7 Apr 2025 12:53:51 +0300
Message-Id: <20250407095355.3461559-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f3a0b7 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=wgk5rNEgtLHrZiSfB0gA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: rUzzKNkxvwOZCcoz1uWdFGru_crQM1qz
X-Proofpoint-GUID: rUzzKNkxvwOZCcoz1uWdFGru_crQM1qz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116657

Upgrade OpenCL-Headers to the latest release.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...pencl-headers_2024.05.08.bb => opencl-headers_2024.10.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{opencl-headers_2024.05.08.bb => opencl-headers_2024.10.24.bb} (89%)

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


