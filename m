Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4904CF256F
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 03:26:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6482.1763522784918117705
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 19:26:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CTHA3Ybh;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=R15RIAhg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ1tLIO3165137
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 03:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=A9z9gis/pAQtdLc5JGZBoYDPj0bEyxwWH9l
	8VFs63yA=; b=CTHA3Ybhe3pNy3AYxIdLz0NjJG7MgJ22mCKv/SCLMlUq44/b1Lw
	10qocAySQz/YCoqY6iWpKwLIF1kqHpBUb/jDEKbpr4pewbs0TwXTFbUNeU7lofkM
	SN5CYPLpSzIi+KJm+gRMGiZ2KOtP85/p3leDCVT0jCUlhnQqGgfrhmvWJE0TXVz8
	v3XwsFF2FwQrXI9ayWa0Uxw0mhpC//L/XBNIDvMuii7ZNykdGDUSUiNswv8jmF9h
	JzVFgw3TX+lwf3Zc1KlCwlEQIL+HwM9bmiysVU4DPBKnAbmrYvFA2xRe4K96kB1d
	r1JQz2qjLlsEUJGHbXJYzXwAQHhSBuKdF6Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agvqgskqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 03:26:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f587dc2eso115671755ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 19:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763522784; x=1764127584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9z9gis/pAQtdLc5JGZBoYDPj0bEyxwWH9l8VFs63yA=;
        b=R15RIAhgq7FzxU1wsuEC70a+uJySBxaOImXIo+GC34g2QyxCNwzspbkkx63m2AR+Ml
         0apN+DnQd59pDvxSzvfFzZ7cnU6DTOg86smgueFofT1N4JD/nQuJMg1rNBVFEXOvhVHD
         RHrOSLxztshMssAb/7TX0K8bjCVkiwYR8vewsPZe4r3FHdvjDQTNwQhZCiKvhyQZVgU8
         wqKcWfSL1bAoj66HbRYdrdjTf/ayEvxfr88Kb1ekv7kyGyl3Wo35agnJTJnHU1kZ76fO
         mYWePnRrv5FPiXjQpFuiUA/phtft/xhe352p1qcwyIrJsMwa89Tci/UN3aZsUagi9/NA
         wZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763522784; x=1764127584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9z9gis/pAQtdLc5JGZBoYDPj0bEyxwWH9l8VFs63yA=;
        b=LRaKR1C2BMhExwy0VFctp4dvqd6W3bYfQ+gGrk84Cs6vEcoZ7Ig564nGRHbHh1kqx+
         bnQNCnWKIShm2UTGQobkNR9uXT7aHG95vUuKoh+CqKsDHj8E/3eSqro9ZpUqFkYJ1n2P
         G7oKA27WXYlfv7hcVz9PwOCHrRMIdPFcJU5uizTXycBpOtKI5GyskTEeVye+/F2gVUzv
         asQw/9N/Sw5n6F7w52SGwChNWZpzMGcSfBG1PMjUUBPDN2lkdTFJ8WL3sp7+e8w7Biex
         zu5h7kofgjE2lNL44idaziBwP5upUSyrYXMpiiYSn0Ktl+jEs1REV2A6SCi1/p3lR1Ko
         Y/rg==
X-Gm-Message-State: AOJu0YzKWLS2TJ0rlB1yTPLMBKgEieLfT929dmG1r0guRCSS9K4c1TLA
	kGHo1PVf+npUjRUNt3v8gJBw+Zf4BjiTtzRNUhaqvXPpZK7/HIKUVqcPx7sj2VGtonc0iI9ZoSp
	yhcpdCYTqs1UPCqTn/56rj56RTAmfQHjU4dQCsCYivMMXm7g9rmyWaVHFIA+StBR8XaDoy3KOOa
	s7RwJROVpHsagqcln6xxY=
X-Gm-Gg: ASbGncudNBvPhxvOZG/alCHN8U1XP/5Fo00CpEjjV2voBI1etMw3H9GRL3FqC/eMGIJ
	Dz2nYLQoLBC3XhOoga5YzlrV3s8F880A8SWBBPEwXYfj33eXIKWdOCVa0+b0fYuEXAWwE68+8yS
	kP3pF2A9JuJG8d9/m6bWEaKEVMkxFwzxfvhM0UcbGskGqb/Ii2jyODGiqezTTyBgZ1IFmfDCI4Y
	UkmA5fs/dKtDbID22IsZ129gBft9UBYUGJ2SuVQrrB1jrlmQ2HPQwzUokNkrT+HXvyNqOe+Jqcw
	D9QNqGK+pR+4WylkOSARQtOtEtOHA05k3mlfwk+ACqLIt4ETbd6pXSkZtwtiysO68LkRqlDtqdq
	LLlOg16zm9DKy1nEXpc8gaWkF5liJnTX7Cb/sNg1C
X-Received: by 2002:a17:903:120b:b0:298:60d5:d27a with SMTP id d9443c01a7336-2986a73b975mr233761145ad.28.1763522783746;
        Tue, 18 Nov 2025 19:26:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAB7eIJ77KPfVGeJSo28fjOCjkt02+hfzrUvNVaLtCuvG9rbqAL3mHD1pGjgcMVECcFTu47Q==
X-Received: by 2002:a17:903:120b:b0:298:60d5:d27a with SMTP id d9443c01a7336-2986a73b975mr233760755ad.28.1763522783190;
        Tue, 18 Nov 2025 19:26:23 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-299daf12fe9sm94755705ad.74.2025.11.18.19.26.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 19:26:22 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] libwmf: Fix buildpaths QA Errors in libwmf-config
Date: Wed, 19 Nov 2025 08:56:16 +0530
Message-ID: <20251119032616.3986904-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yvjVX15grpgYxCHdlwqsGigFP_zoTYg0
X-Proofpoint-GUID: yvjVX15grpgYxCHdlwqsGigFP_zoTYg0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAyNCBTYWx0ZWRfX0pHwyA7QHfVS
 5LbcvfeChfp+nyz7M+QUdnxfC3hF2fcnlSHKK5RHn691392XJq/hgoB8l19KtcBye5XMPhdkIex
 Y0W0yLKMYoPybUF2uvLh69SHGE9GcbXN1HsVGi4lhIb0Za3MuleItePupLH17ou/zu5K8Fw9Nx4
 4eF8eMe9AgIdNwIYXoGcd3LdZOMhqvEyqd2em3y0tBryLxELgHxnj15kqTh54+JN9ZKjHMxfgAM
 MthtQEMuOciul9L1nrwuzacD8cGFq/7OTxXDY5s6yx7gn6DW1XM2PNcVxp5NqKPpUHkMyBWv4Z/
 8fiOOTwPBQb5qq2DwJreUBESV4JNhWc0mUHP7k+ma+bIR8lKJ00yw6oNTiJAAEkQuZsvM8xVOPD
 SaNm0TdkEAdvg0kTwbJJqOYNLqBsSQ==
X-Authority-Analysis: v=2.4 cv=LMJrgZW9 c=1 sm=1 tr=0 ts=691d38e0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=j0oV6tLkrIxA-sdDyawA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 03:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121873

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6fc95d7a747f0e2c444b265a067d2ee2faa894f0)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index 381833b812..cc26073775 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -28,6 +28,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=ta
 SRC_URI[tarball.md5sum] = "d1177739bf1ceb07f57421f0cee191e0"
 SRC_URI[tarball.sha256sum] = "5b345c69220545d003ad52bfd035d5d6f4f075e65204114a9e875e84895a7cf8"
 
+do_install:append() {
+    sed -i -e 's@${RECIPE_SYSROOT}@@g' ${D}${bindir}/libwmf-config
+}
+
 FILES:${PN}-dbg += "${libdir}/gtk-2.0/2.10.0/loaders/.debug"
 FILES:${PN}-dev += "${libdir}/gtk-2.0/2.10.0/loaders/*.la"
 FILES:${PN}-staticdev += "${libdir}/gtk-2.0/2.10.0/loaders/*.a"
-- 
2.51.2


