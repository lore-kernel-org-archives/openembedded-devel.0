Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340E8C369A4
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:54:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.43440.1744019644097266021
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ARA8KQHZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dkIh022325
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Apr 2025 09:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tzsplyx0pC/
	1gZ+cE6t3zJERtKbbjiScikUbLjoyves=; b=ARA8KQHZFma4K7f0qcCzx+n0W5Q
	Eh/voAZ4iUoqEdFnplEBMligRd1d43oyEp840VZy6TL5PuN/QQ+iSXOhz5JXiXZ/
	YX408yiq/pnZSJZmPrR793LINa37iu6vGT7J+tKWZ7LkyoMo/ToZaSQGCwf0/O2X
	m1HbFPUg/VEc50H6u99UssEcWlTi5Hx703Qw2kUrkwqH69VEIS0reP+DpNZgOoiV
	J53e/zV/h43JjG3XJLmn8KwEyLOUXpycjR4FYgDXfid1jMikXYMmWRkPzPIS9JeI
	JGNwHJiuvar1K0M38uBeij7RGAAxtKICoa8z+YVuw42ZdGSE98CEYOMQNoQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrbu13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:54:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c548e16909so374374485a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 02:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019642; x=1744624442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzsplyx0pC/1gZ+cE6t3zJERtKbbjiScikUbLjoyves=;
        b=bPVEIXYD+c8wBRIvkI4T0s1WHHtheo6UyB3GV/KBgh2gTekMfmZpIbLDEtLeoEzhMg
         /mhmUimEc7nzdwiFCF86dNQF0LTnhwXQxPyJ2EFXDr9YPFxqMhnPrIEEfwaLANcyoA2E
         35tcNWwrf1Ha4xGGPdkB+CTQs6kFWEYkjLBUFmdTRsFS/8XndRXC7mJoPHRaadasOjWL
         VsikK1Gour/VUuFeIAqmKGA4xmBe17Zj1gj/8MVI+5O4B8CX9jIoCsQqzJsyzEy3LBW4
         4y+QRSjpI2LBag64IlLHKDTAQth/QIEOjD/Y66o88QPEdURkBAIT9SdAcYLMOoR31GaY
         R8IA==
X-Gm-Message-State: AOJu0YzJFFt7hHNo4zmIYUr8/qZW32jIJyLVL6uNwjhqdDx8OXgC0GHV
	sypPT4GkoLMAmKQaZ0zX1LXM7GoAZjjgcQ0y7YG+jcnUr0saFQi53RLwGF0UPsWsFe+LN9xOUIB
	kQNUREYLzo1UOoRKQMtmUuIdCU6I1zSUAVbCKgAqpXp4hKud4RWV9Kvpda/vCpjjNX2pTjj67FX
	htYiG6ZFp4FY0d
X-Gm-Gg: ASbGncvavb37sWT5mLsdaDWqkpCQ2iacZiHW4/o11O0UZ/OnH5gR6QLlt0Km9haTlOG
	luNnLwDJ3GTXNUaFFhEwFr3USvhFBJxgptxpRXqKibjw/15p5UXNSPSNbznthixywwsC1L5mHbr
	CvrTqyII1Px5GLJSvQrXZfwD4Fc/3W2mr2SDYo5lnA4n9XwzpBPrAqCWsVjtSORgAlWYOIhevQK
	QQJ8lWnWHjxTphdWralBGdv5js+LeALLxwILEc7YS17aa3pSyoGOb0i4Py7zwFOg7ZsX0ZKyMvZ
	3T8S2K21s84ciLTUWbBiHNgsuDV4HtWJ9dSSQPj3a0rll7OdFllC4R79Ky7Rn3Jg++wV01Di/4e
	gmiqNl4UatthD4olHK1dMlv2XqhQC
X-Received: by 2002:a05:620a:2a06:b0:7c5:60c7:346 with SMTP id af79cd13be357-7c7759eae68mr1575307285a.10.1744019642220;
        Mon, 07 Apr 2025 02:54:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiICV2VJNFyO29SxWme5+SOSzro+VauoWoSe+7sqDzDOXqPH0ya7Mgy82oWkTXOqumK4oO6A==
X-Received: by 2002:a05:620a:2a06:b0:7c5:60c7:346 with SMTP id af79cd13be357-7c7759eae68mr1575305385a.10.1744019641767;
        Mon, 07 Apr 2025 02:54:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65cc2bsm1196659e87.167.2025.04.07.02.53.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:53:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/5] opencl-cts: upgrade to 2025.01.22
Date: Mon,  7 Apr 2025 12:53:53 +0300
Message-Id: <20250407095355.3461559-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407095355.3461559-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250407095355.3461559-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kloRISHCcv_NqVi2dn2zAeXCKnseuCD3
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f3a0bb cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=ds6tjL1FQIGj9_isU1gA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kloRISHCcv_NqVi2dn2zAeXCKnseuCD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116659

Upgrade OpenCL CTS to the latest release.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../{opencl-cts_2024.08.08.bb => opencl-cts_2025.01.22.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{opencl-cts_2024.08.08.bb => opencl-cts_2025.01.22.bb} (95%)

diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
similarity index 95%
rename from meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
rename to meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
index a65c3da7fc4a..e374ef186329 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
 	   file://0001-Ignore-Compiler-Warnings.patch"
 
-SRCREV = "a406b340913f622da089b00f284a597656c10239"
+SRCREV = "5b3518096ca7b82854daadb2b2fae704fe2d9cb5"
 
 EXTRA_OECMAKE:append = " -DENABLE_WERROR=OFF -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
 
-- 
2.39.5


