Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A348CAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 03:05:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.5208.1758164701921046912
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 20:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PkAI36xc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HG4W6p021427
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nhtyDLuPzds
	Gsy2E3tN9bzZU+TKBvbVuYRVxfHooHnA=; b=PkAI36xcEmZ3w+wUrOCMpf1sZbp
	P/B7ZfIcJs1ZtYPwfTckaNhkt0MPi5EMiEx2Px8yG6oV4RGr0p6UFnjVlrSue0bd
	0+9Y+ZbArdmHbU1TQt/W4RZD3B17u/mQ7KPhW+yW5FqOGzdA3TgbJAZXCGYBdd7A
	tty8tbX+rdzJABaZ3l3CNHq62dnvuRuLDKjMHoz+pKwJ1XEN36/VmPiEx7fx5rCl
	eHWB3U1zXvQH8+6lyCUkSrvD5unw9xitOK2yvDT58tLxOI65nDPyIOO17GSyx0ji
	aNBVz+7OGgiSsIl/EmMhaWcxNJwtPXWLiygCLQwUIVUPazsB2QeiGare9QQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5cq0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:05:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78eb8a9d229so8107216d6.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 20:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164700; x=1758769500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhtyDLuPzdsGsy2E3tN9bzZU+TKBvbVuYRVxfHooHnA=;
        b=gg8fNXQd6NoVWwonvijsZYGPlu1SyYaDojWARPqE94LAt1g61PJRcUJ+bdm98Bnwgk
         Up2pZ7VuFBcGT0RanDl9Q329WtipL6regTyFSRSmMqbQyxfy4UCF6uTSE6yZzlCmzxD4
         UJS3GlMixkuZxvE8y1tzZ4j034jfcE4g8BhjIQKZSFu8yDyMFFmvLwULnk3CY6A9V2+9
         Jo+/05o9+QaslfsmaLlkC5AFcs84QL38vGn7cqpTFONu6RTvCUDXnzLjD3BjIwwfgYZn
         TuyHPOzchrRTRExof7ANUEh9oIar6CFcTFzr0UQy/3Q/1GMfjUo+GbWWZ7wiSXc+mzqm
         ynRA==
X-Gm-Message-State: AOJu0YzjrpVAzIX1OVz3a2o9IMBlqyE9AieBNLjrzBFPZII1tUPLraLR
	qXN92BUGy967ADoUY9ulIoet7QypPhduUtZeW7UHc3wPHEvqW6Q1hK3Ew23HUMEHqSmd4AkP5eU
	mWpBNtWLSKAp4IhQlktlwcLORiZ5MIlDz3sAcCkbiVIKXn0y/b+CuukVSN7GL3InyMXHjVRom0u
	bAjiaiL6sZ9d5Caukc
X-Gm-Gg: ASbGnctllSPdZpEy4wNYXnxLaoyCay8lmv6zFW94JYRyUgprQyyS9OkGtr7drDvRQ0R
	QIcBqGVOk/V5E75bxRS+3ZRLEJE/ip6PLvm4joNWMo6+TR+1P/G5odxAstoPbCRwnooeQ19XNhO
	U8mLMhvVkAdA+5E+Y7lws0W4vzSRMilX48D8xfEe5J6N/srEv6cUtIlUEPxaPI0y4kcygwcTFQZ
	b03nZ3iPVwXHqs8nUVOiHUD+nm6iN7H6xwGSjJGdnxvfmWkplsrX7wfdBYtQUBuovSp0NcEGbKe
	T/ydBU7E2K0cTIGdl5STbvt8PKgYPUk/I5YEMbsccmGbMeA6p8hxf+6mSjwHF6n80ilWvguBX5P
	aqqkXibKfbquue9PIbobofBRhfcz6xYg+Y1B2bdV96yTmlbaRmrPi
X-Received: by 2002:a05:6214:2425:b0:721:f7b4:25c8 with SMTP id 6a1803df08f44-78ecef1bf3fmr44085426d6.52.1758164699680;
        Wed, 17 Sep 2025 20:04:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOYy4QtWJk7liJF9RbZBJDm58AVh+8WdOm26LnR89bEYJflhxB8UW9EJ+K6uFsmMTyOJ3KaQ==
X-Received: by 2002:a05:6214:2425:b0:721:f7b4:25c8 with SMTP id 6a1803df08f44-78ecef1bf3fmr44085266d6.52.1758164699090;
        Wed, 17 Sep 2025 20:04:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9f13d3asm315572e87.141.2025.09.17.20.04.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:04:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 5/6] opencl-icd-loader: pull in ICD packages
Date: Thu, 18 Sep 2025 06:04:49 +0300
Message-ID: <20250918030450.1507801-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918030450.1507801-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250918030450.1507801-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vP49QgrmIYpDG7VRpxTLuuEgE1mNC2WO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7ca40vq6TcgB
 z5psxo68keL4SzvfTfWuKGbGF2ktK+qnPGPr3u7bxuw7rdootDf3kHrmEGTEJBo1j2hXPGPCavO
 Af1GXLli1XFExyGpLPJmDPYqxM8dCAMjCtP6CVwW5rH+4GNQRpf3ejtjzG29dXxHVAhsdCzxteJ
 i2aztO0Xzn7z55w7U6sgERLhKDo56mbQgqO6nl+EPfKLWLUAJFzoGfJj30u4+jjBNmVnQVnOblc
 eIZdlNfnf66zkk4CM2fCc1UFMhbiI8J/S9RuL5Zb3w0DNYfyyEsuralGu0Fa74nCte83XSsD9vK
 tk74YqdzrB5jVzWLdBBQm6yw1CA42rye3MX7vWXbmAlHoh39JfB7YPx8P0S1cs9Mv+DWv3jhjnS
 YA2+YeVd
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cb76dc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=rhoC4Ms2pzRqzdZEwOwA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: vP49QgrmIYpDG7VRpxTLuuEgE1mNC2WO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119511

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


