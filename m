Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B547CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 03:05:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.5090.1758164698832337515
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 20:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EB1zUaNG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I2kZDL019607
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AxyxUcwEX1x
	rdDxQqGhOB007NGQNl8259WyfkZut8rQ=; b=EB1zUaNGYHPsmAI3tibK8hWAtHo
	M6XsGXrK3It5/+eTeNZ79PHjcUiO9l1vjhY6P92r+ebJyL+MZh4KzpNdX3D2ttZs
	72O0aw6dbym7l/jLr90VbS+SocdmtL8YkLLag9QQNfnqGNqLAF6IyNBv0DQLS/a/
	9OhKVRRhDAZoheuW5Dpn2tI4ezZAfnml01RdAdDPKIDmaStpl4Jg2snaRhBbDz7g
	pH2uAzwyxs+QNxqQcxPaQ+TceAIQoL3lCGp8EOA7gA/Y3uHxKGHUsNVSbvJBL0Hf
	DzhYngiPO0NTmjBraPaTbMlrw/tEgoC7OZe/mcjUiZjgHXrXnLJ4JGXnBMA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1vsk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:04:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-770c2440225so15300156d6.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 20:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164697; x=1758769497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxyxUcwEX1xrdDxQqGhOB007NGQNl8259WyfkZut8rQ=;
        b=er1JuxRKvEmho5SBP6pJg8qCPsQxxe657Q9Y9g/weUrGnfqdcPqRHnN/432d89eF7s
         LVNnUPD+lj0wHuApEjIKtY3WRnJQ05ufkIJiLp6tVKBC2XafjYL70qY1pO7r4mlrGWZQ
         3pTmzphx6sF9H+oDCVeTYrNZ6w50nNG/dpyLuztQ3fkwt00msjuhQqmTbrITOVKmtYxh
         p5+4TILcw7h0Ph3Xv0LhtLS1lg7or26sfnkwAcyKIFztauJFbholVMlOLRjxzQ6blDzt
         cTg/98enWmo+rodHhysjxTTyHyTSAg0neZLBQa706Lx1kXATJgZZzjrJcuPvMu77ZQqb
         rxIw==
X-Gm-Message-State: AOJu0YwUDfpeZMGxKd7JeuIZpxjPhWz8guQzGKnEHs9Xh+1vYSf7KAxU
	t+ThYiSiJtx6EhLRSnE1RVWgYnhgxNSJp+BTKCcZAYAlMWzAP/mYgJ6bSOD9X7QlqKTMHA3j/Jr
	z1QlFlR9Stk5NndJG2nfJZhhrc64kMfwqQibDOcFtvNa3crs1sw1B4ycCTwJTCeZ6bNGfRNr+t+
	lGPEZyx2XnLYPIUI4U
X-Gm-Gg: ASbGncvoE2KwZNZK/tLPxclcr706e9CG4NW7faqxV/FJWsBzcW/CK2gXrQy50jCBb4D
	Qt4LSRSOlAo8ZtpVNiqjlKBaym7nTIj2FMc1UKuSWQOUtSUbMKfjUEEEx3fat4qDiwfumVBAkk7
	4M5T78rSySeHWNyLJP5VR/I9IvfYpwSE3VLroRK5BWFFJL3fXZzmulkMi+SwRersGSUXtGuz9zU
	wMxYp2G8I0BtO5DFRempJYXviawKw9B9aKydBnvGLcZ2Ar/eDZpSX9kpZiWfKSDinC5I+pSWFNg
	c890ZSE87pFjkRbyDtUQ/kCKe8raDHZra3NJwX2jMP7EmWnOigHfoENnZNjdCcVqAInnwznh1tR
	nTvOnc/IZgwrwrt4OzDiUuvKYXooNjuK1XH/D6aFdLio2x8DT4xJP
X-Received: by 2002:a05:6214:29ef:b0:78d:af64:ed68 with SMTP id 6a1803df08f44-78ecd0f6a72mr43814016d6.20.1758164696498;
        Wed, 17 Sep 2025 20:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFajInGaRvT6zO/Nme1bV0QxMEPtOtFBgJX/1ihOT6N/sn+iP1TWlOI37vGOA5fTd1NjtPcuw==
X-Received: by 2002:a05:6214:29ef:b0:78d:af64:ed68 with SMTP id 6a1803df08f44-78ecd0f6a72mr43813836d6.20.1758164695996;
        Wed, 17 Sep 2025 20:04:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9f13d3asm315572e87.141.2025.09.17.20.04.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:04:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 3/6] opencl-cts: depend on virtual/libopencl1 instead of opencl-icd-loader
Date: Thu, 18 Sep 2025 06:04:47 +0300
Message-ID: <20250918030450.1507801-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918030450.1507801-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250918030450.1507801-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CvTJsE-9uL3xAq-B5XSFhjPLUi5Ji4cT
X-Proofpoint-ORIG-GUID: CvTJsE-9uL3xAq-B5XSFhjPLUi5Ji4cT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXxk3iVsxOlmS1
 to+eSBTyyEvjj+vvjcyH5ojBdDOIIk9nGoxAGnoC/s/Xfv3fPRl4N7z2U8GzUmT1KK9EsITZzNV
 3g495BT//fu/P6opDsviBcj8A9FH5o/98e6TLsdXpLYYexQ6bwloGnEpdmaIVSWCtSOAQNU64ni
 Xdi6egIypHrab+D3VtBSnZzO7on3FPkICswy6T28M9vOQTdzCGg1kG5T+4j1BaZ9nh4/8mg//We
 cwjAUBmbVxG9C5pgP70KrPqqzm3jXgewxs+JhvAcvojvRQYGSwe+UknsiYRM67ky7exnbVZ7NsA
 MDbMlExhUumTb8m1n4dK5EEd+pQRUi1ldhGGtm8l1yprOCcgMaWf0cBHMTg+HhemTiGxhv5whsp
 gvWFEVQV
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cb76d9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=_kBkQeCUpgm54xzEBvIA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119509

Make OpenCL CTS package depend on the OpenCL virtual package rather than
the exact implementation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
index 9c6a55691fe2..b0f6575e717c 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pkgconfig cmake
 
-DEPENDS += "opencl-headers opencl-icd-loader"
+DEPENDS += "opencl-headers virtual/libopencl1"
 RDEPENDS:${PN} += "python3-core python3-io"
 
 
-- 
2.47.3


