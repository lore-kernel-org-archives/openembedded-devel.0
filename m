Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A123CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 01:45:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.3936.1758159901054137917
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 18:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dVX1t8U9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I0E6h0003351
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nhtyDLuPzds
	Gsy2E3tN9bzZU+TKBvbVuYRVxfHooHnA=; b=dVX1t8U9fMCtMYl4ge7nSEoaNJ6
	BmyZlghIjjMRwUGJ19UrpL3d1vz9+ZFtYSU+HsSKaUxq2zGGqwpozpbaOtjVM4TL
	6g1YbfvnXQ3soeb5Yp3LMEgJXq1+/vttVyRiTiFjmaNMl6Zy8FjbvljePRRLMrfV
	Oiiik4qjKsvxHWRdFWb427VWs0b4t7eftZQ1tamKGR9IV151sf1aAhZt2rJoglA0
	LWOAG2RK6tqYPOrm7lxvILuP0rcWhxH58xS10Sze3EaCdoXaff0dqqLcuXC0Gr/B
	iOXffeS/0rzhwZxobSR2YDXf8tR+L9fDCes+OKCmcu+WNbP0eKyMA7jza0w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqgt233-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:45:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b4980c96c3so10821001cf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 18:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758159899; x=1758764699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhtyDLuPzdsGsy2E3tN9bzZU+TKBvbVuYRVxfHooHnA=;
        b=VbcP8ejdFbRlMfbrNEcaq1UHRFkkBP/iABzdazNO7wsd5OOMJKouYgkWFh7My7TzLg
         5UbVLdfzeJklJCeJG2Pxc3I9MYul/ettgYZf05xKd7go4p39nuXNGEOkJEaTEe8sGAQq
         IlFQUhGbEZf4sOustWLjyQOEAYeZ4/098uyi85tONmxU8lD7SxJIAGIdoC9UdkLlZKb6
         OFnV3YmoPM28TVSxTEU7msjDETtsucbWudlibVquWrVh4DePmoz5pxu4Mq3IxUOQoF3R
         TVP6ctXyB31IUc5uRzoYDuPntGWyIbCam6XB0V3lddB48qlRX90D2cc0x2aDwrPBJ7ZT
         HQVA==
X-Gm-Message-State: AOJu0Yycu7KRPbMiC82cDu6Vkw4k/5A4xdfK6lE4/mB2iYap745dHTfd
	J4OskIH76/uohO+o7wDFljAy95y8ENim8m329O57+GfwPxtooQNcdRBAti6MCiGYRh/ibWQ6Drh
	Mgn/V6jhtukRQ5QD4p+LEhpSBB9WEERaFGPsRfdAPHNXa0nGy7+iuPQaNraqEGaC9qNteVsOfgx
	RL5EO0bAsNBm3oBIwc
X-Gm-Gg: ASbGncsJyK/G1HCsZr/r9EfXm+tZbScw5HPfvetDvbUJ/HWJSS7Jfc3MhlVqoKFz3G9
	86n3OBY1HhNrB/oq+faEe84fH9CeW9uIEEQheZ6OdSqyyCOtQJvvwp2AjwkQ+Is2Kf9wADCfQfF
	Q8Tq8A/4rJFE/av+VoQEvSAccFM+jRnyy8Yx39/livJV6szS2yeEcLLHhWVks4uE8cYxVkhln3+
	vgp1998C2OjPEORxi/Pp1RMZYvc3LuUkRRkB+Zo8g55lZVZ5vXgIPnU0z8wVy1gUGeW4ZgT5rOe
	2IetJ1MjNa4jL1T64wnOMGdzNzJlXznaTufWwkHoVfD2Xe3chwtQo4RscCKQXbMnsiganB58/2L
	iYqzn539gaNtUzTWPjIFtr8YS1KiGl3Cw9KHT+rGTg7ykNSbPtRCl
X-Received: by 2002:a05:622a:8cc:b0:4b7:8d26:5092 with SMTP id d75a77b69052e-4ba69d350f7mr53565021cf.44.1758159898856;
        Wed, 17 Sep 2025 18:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1KOaFsJEquOZj2b2wXgNxQWOg2MJKJjGQJ9bVRbyZUM9cvSVC2GHWrsBX0fBWN3qrKc027A==
X-Received: by 2002:a05:622a:8cc:b0:4b7:8d26:5092 with SMTP id d75a77b69052e-4ba69d350f7mr53564911cf.44.1758159898420;
        Wed, 17 Sep 2025 18:44:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa577704sm2283341fa.70.2025.09.17.18.44.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 18:44:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 5/6] opencl-icd-loader: pull in ICD packages
Date: Thu, 18 Sep 2025 04:44:41 +0300
Message-ID: <20250918014442.1436475-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1RVOsUpscATi6RgkWjMSI7Ne-7NtOKKE
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cb641c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=rhoC4Ms2pzRqzdZEwOwA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 1RVOsUpscATi6RgkWjMSI7Ne-7NtOKKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfX+pX1ranG+1qH
 xTFe9PMSinDKISb1aTvMdtGckq4zH9V/zHztttTxG4iwkPVyjSbzKU8tH/FGieU/7DbkQyuAW7g
 EmsSQw3UztIxnfWa/eQK07ipbiRwPAwViPT0IR6HCP146BDSGjKQHtTJJLnz4ItNeqhwjM+QT7E
 0ioQ4TaJ05KZ7D1qSrvfp909XEWngsxIu+9I3pkSn/8yaiQTD5YTK/7911Q4lKvLuZ2stk4e8AS
 Kvaayde53If5GICi+zdoelEf18YY3xr8jXntVGX+209Ko6z82lpBMQk5Hrr4dGUjnL5IvUkJeT6
 sBw0w9CR7wt/0AqEMYZ6/5YR3Tph1TgVulE2XGx6kvHUAT2Jf3Boxlnkc7pYazaOCwTlG1ARbUB
 FKrltWhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119495

Make the OpenCL ICD loader RRECOMMEND the virtual ICD (Installable
Client Driver) package, making sure that the BSP can define the most
suitable OpenCL driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
index f847c3eae40e..3fb08efaf4d8 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
@@ -50,3 +50,4 @@ FILES:libicdlog = "${libdir}/libIcdLog.so"
 FILES:libicdlog-dbg = "${libdir}/.debug/libIcdLog.so"
 
 RDEPENDS:${PN} = "libicdlog"
+RRECOMMENDS:${PN} = "virtual-opencl-icd"
-- 
2.47.3


