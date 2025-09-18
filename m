Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C53CAC5A8
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 01:44:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.3792.1758159893967567658
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 18:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HzY8d4UU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HG25T8019524
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AxyxUcwEX1x
	rdDxQqGhOB007NGQNl8259WyfkZut8rQ=; b=HzY8d4UUgZpZsN8ycPPrynGnwSZ
	LR/1X9uxiq9RxW77YDXCFdwCuVkrTBN54Xz1Vx+P1vTF7RikDqB+hkIKCRThQfsU
	V2ut4D3wex3M4HmQaySnqM5E+k+BSI5gwxdrhRe+dc7RZr2rB9Icz/SFa7sAa/MG
	2xKWJdVUQRFjUhN5MyWb/b9BMWvZJ/N5ATmag2B2/HE3I847UsHEyN2HDust/zQI
	GUBoKOtnJIK7QfeiNlgRwUVR3FV+jOo5or6qzEapstudEPZInAFXqdle/9xv2Xn1
	U7Vcltz0w7UYO2E/FkPcHr43Z0TbcYI9+oQoXmlZ2E1C9c3EgqXQUcTyWIA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1vk40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:44:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78e5b6f1296so12686826d6.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 18:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758159892; x=1758764692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxyxUcwEX1xrdDxQqGhOB007NGQNl8259WyfkZut8rQ=;
        b=I3V3M0C1f/g5KxgQ/ZnGNP9URfxRc4vLmt2n6nj5KBLqW6eWIgRedVpvO1rQuyMO/0
         o83i6ZiL+H+KjeF21Iqeas+CjIECstTRGR0bC+5MNlqw/oz/U5HdxYocD3AnCnA+SRW4
         XR6zgPgy6R+kNulCo1BRdU0HmzNF0sxXZL9kMRPFqP3GegvTaGUJ1mtYDJ8f9SiH4XX1
         WspNgj7NMynbxaq//UXXMkB6t73eFDIM3JGGeEprcc1oIrMGPvwUNnICe7G6jDqyQh9E
         7DttjGVzANraY5FdxGIeoDoLekPBtXsEMSllX7gQtVti7RFVERqNVVsmPbDTjNwx8Ls0
         KFTQ==
X-Gm-Message-State: AOJu0Ywy5kRVlBqbLLGPT2jyY5W7k4QZPh9Fp9vRuxE/Tm3xHCYw68S2
	yelpO5SOnf4NJljPxz95fcTmwPlhmOvlC0EN+fkEetYkXx0p4KIT1G87xsOmStmF7tJ/KeXv/Fu
	VCI/2Qo4wcyt05kw8E2Cu5CQIn7Fm75UeB7Ja1AiDNe26imS81Zm7IpkNqWhf+Ta/c8UyUu0vz3
	KGOZClt6XdgIXs5M+C
X-Gm-Gg: ASbGncvUiMaD+Ta8tJZbk8ys0FloZHvshuH05ALmjsjjxMM+gbv+6ty/dMrgZf2/U5A
	5rUx0UdRz8835E7+/nUlnc9lKf1KTtmYkm3ykYe6MVG7Bixv1zEEfH5gIzaZaEzHcJLa/JGnItI
	yGp10juTak2SkJUCEdmy36nDpA61AsahjFU70U8kxsGbctSSPqmsxTlcUiYfbRbzsHy92ztsR/a
	IHPCv3aJL/TQOKQ5fRsC7+tVwRrZzhWAj5GT2CJqVGtioOpLAOoAiJfdBVnWRHTizr3gB78TTqe
	0/aVl848riJssu3jueyxRWnVf7FPJw1PIR71In8SxOPTw8OtC8z3z8dXM6IZbYIyEfXjoyxiDvZ
	CQXmW1uyRKJ5LXvHGATFITCzjuN2SOKVdJ3RsUY+LYASgxmY0wwdh
X-Received: by 2002:a05:6214:2683:b0:78d:b474:8e3d with SMTP id 6a1803df08f44-78eccef2413mr54331866d6.16.1758159891906;
        Wed, 17 Sep 2025 18:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6FcZejvLizjesPJMNQQjUDHDmpzGjdRnV7AzwMpVtIh5i0+I7uJY+DcFZSpY9Kp6fAfomHA==
X-Received: by 2002:a05:6214:2683:b0:78d:b474:8e3d with SMTP id 6a1803df08f44-78eccef2413mr54331666d6.16.1758159891339;
        Wed, 17 Sep 2025 18:44:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa577704sm2283341fa.70.2025.09.17.18.44.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 18:44:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 3/6] opencl-cts: depend on virtual/libopencl1 instead of opencl-icd-loader
Date: Thu, 18 Sep 2025 04:44:39 +0300
Message-ID: <20250918014442.1436475-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kr1jhA7jqHrHa6JYmPp-5iMPrWu37WO2
X-Proofpoint-ORIG-GUID: kr1jhA7jqHrHa6JYmPp-5iMPrWu37WO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+trgfAjSrhID
 Yum9Nqnlp8H52a60j3aDhxJ5nUceLzMsHczMOKty1W0q1rNdVzhh2b5siet+qBbhKzPsCj1UamP
 D8OuQ3IxLemCD13fT9oUXldB/mEXyPTelle7prGoX0DgVG7K9ESBQ5mmFLRNo2LcECOvJW+3O6p
 NVKSZ/vvrOxPxviR5klHUZHNvC3Bx8ORsRLEHG5NAFqLOe7cgrGCMgZbpavwxsLZyRDV2HzhcYa
 dvU9ZXGo3c+cwhfxnL+Np7Bsk7c3irHFemiyQdcmI635n/rnXSLSE8GUgl7tGbLHHzV0UwZNWu9
 Aux1baVNFZoBqYLTokjnZsnl/LVk7eFhkEHbywGZL/IR2l16lqaXR9h32k7+Zy0jfBqSwCr++Mt
 W1ymyUUx
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cb6415 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=_kBkQeCUpgm54xzEBvIA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
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
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119493

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


