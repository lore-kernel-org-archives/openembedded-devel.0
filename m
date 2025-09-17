Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C38CAC5A0
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:02:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.23822.1758117732846388483
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 07:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ev/OKqIw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XXxC026796
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 14:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tnDZR5QhNRHSUBUJ5Od7dxJkZk3nDVGJ79o
	axVePE3I=; b=Ev/OKqIwlB4JTNpSh7SrjiI/jloxc7JyfadVeoACkjgVW4DF+g0
	zAGbRXLfpYCjQlsCq/QGScjpgrFAy5a1a7gbB5cwqBySQeLV9qab6YQ3U80j+vpu
	bUEqx665BrNG41HMWrv/b27vscTFv321ZmQUdYXpRgCC0nagelKdwsm/q9e6pF6U
	mG1Af0TI+i1+mYFrz4PuiLRoZXq4XbmSKP5UpvrR+PzL0vaT4wK/GYf62i+oK4cB
	1fK0aZVt4uuNCwLdCXUFpieMbQreQzADHq+WjaZTKmkNCbsDU6ABlnR+vj2gEH0J
	ap56yQz/scG/XdeRpuDybPjG/LQaxS8Fyiw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt2krx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 14:02:10 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5448b533d2dso2231384e0c.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 07:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117728; x=1758722528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnDZR5QhNRHSUBUJ5Od7dxJkZk3nDVGJ79oaxVePE3I=;
        b=vyglOfpSUuAmdPzESGfDStvkMidPTjekbFcS0ve8kr91b4vM9nek0/GrerwwF+4UYc
         9jwbRgK81DdXYxyTNoJV35dy+rh0aE1W4uCseQsXVQKOfIGfvy27RmIUeB7PngHRKjYL
         GTZo4U/mLjevRoJTsMw1I0deYAAwdaDOlc29k7kTwNmnKykjLSj/Qjz2LnML3qT8gOzw
         eZvnUjKo+5EsbKuwBwsg3yJVtHrROjki5JtG5OukRGL34SOjoZxeIA9Q69/Dghi6fZYK
         teDAWVnxdkRDAGVFx/ZMRsbvWDuuJpPo4lmCgladqVi/MxhmJW0I68Ogqh7Qovhu3ImQ
         vNWA==
X-Gm-Message-State: AOJu0YzKqvVK5BYZt5CH0MubUDAamdE4LDdqwGxYwR6ZCrCrHEIJLVN4
	vVHJV5pOaxUjDVFPovRhPHxZ2q16WglILBMmww+o5gCGDGb0lVLR5Z4ylBMG65Z3cQX33cABVZD
	4lWOwJ/Lf39UYlkfcDTyQMy6g5v8nEVODyyT9dC0bFFk4MdaduBSaqfPDwkHHxKyuXM4uM73hRU
	w1dxbP71LxDea34zUy
X-Gm-Gg: ASbGncv4NJ7Wfvr2q6W5LHss4I4OXzSZ0BCXLBeQlW1QBUAHmmfX7JcOvqEY+XLCvrt
	t4fwjf6+YxfcKjrtrBfRDqVtRB8V+pPgsHXIUXYAsxRUwfj0WahPHqpHkEyAdOczFo8TJwR/DQt
	T1fXStDWP9VDHeaCvy4jzRkjjqDva4v6RifGZ/UxvsHp+XuDcNHZ0egbrxi02D6Yl4cm56V5R9n
	RBzZvG3VXnR+miAWGaYwc6bKQq2yBoHGtAuWABlWsTiTTXBqYzoq7HlutuEzlpwY/mYRjmBACpv
	Hm5qHjoMpkbq9gLr1qL7vi7julwTImtC15M68gpkKgBRYYGNtDSse23lzxo18I//o7Jzlgr/4NR
	U0wSQPHP14Rmt35m4FhbOhGogiwgfxSkdMxQtA54nqrwNf41SUnZi
X-Received: by 2002:a05:6122:508:b0:539:1154:d149 with SMTP id 71dfb90a1353d-54a611319b2mr676523e0c.9.1758117727998;
        Wed, 17 Sep 2025 07:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvOk0N3TIRxFaMMX55VjjPPSGyUXHhCUIx/tWGblPiISq3BGiuCuSqaW/XujTekOCF2MNM1A==
X-Received: by 2002:a05:6122:508:b0:539:1154:d149 with SMTP id 71dfb90a1353d-54a611319b2mr676111e0c.9.1758117724839;
        Wed, 17 Sep 2025 07:02:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5730a572b8csm3152302e87.133.2025.09.17.07.02.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:02:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] opencl-icd-loader: pull in ICD packages
Date: Wed, 17 Sep 2025 17:02:02 +0300
Message-ID: <20250917140203.895760-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JWWfzNuWuIQbjBOsfwEnEi_QsKZUVKSw
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cabf62 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=rhoC4Ms2pzRqzdZEwOwA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8WQ29eL9YxcL
 k0f/pS9wosZCT1Pjyj/0dZODvAi9A0JJR6Qsf7KglngselRU4eHi5O3weRzV3t8K2ypzkwGX6A3
 AH6BszByYoSrzUmff1Ojnh/+779TO3GVtjwC++uDu+i1o9GnhG8d4ETQpOiDyjU0lVfQ39fG0XR
 tI5+4hA5r73MVtYgZUXlQsGmpDU+MQBAvwv5PwXvhibe49rZrwUwYeSZrXIklCgG423Yx2qUPqx
 kx55DW2+ZB/WPBrxCfmNPvf1F5eVPo7crONA2rA9/AlzaM/JGEgpxwei/5Bj6N9hz66+MvHbJzY
 5x5KGe2MlmekS3WjKar7s+u1EiM+5NASWHiiNTuGQ4U4NI85sBcHqdsmCKF8TETuVWyhWcbqlut
 yS7jPQAu
X-Proofpoint-ORIG-GUID: JWWfzNuWuIQbjBOsfwEnEi_QsKZUVKSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 14:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119483

Make the OpenCL ICD loader RRECOMMEND the virtual ICD (Installable
Client Driver) package, making sure that the BSP can define the most
suitable OpenCL driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
index 2ff9a6ae7ea5..16c070e4b538 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
@@ -52,3 +52,4 @@ FILES:libicdlog = "${libdir}/libIcdLog.so"
 FILES:libicdlog-dbg = "${libdir}/.debug/libIcdLog.so"
 
 RDEPENDS:${PN} = "libicdlog"
+RRECOMMENDS:${PN} = "virtual-opencl-icd"
-- 
2.47.3


