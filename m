Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75D6CD4F4A
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20207.1779006250251560147
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Td8vNAiH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=c+shszfi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H1CjeV1672239
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YG6zYfTx58s
	OgL5d2hQsIcF3SsaIrdup+x3Xpv+dqlU=; b=Td8vNAiH0fcXDaKcIDQINm/mF8C
	26G6PRcuG/z4b4BjCQSVUVUspY7tcxBKSGMobL33Ik6xHfdW2itcpJswX78S2DoN
	RwiQRA8Sj9wETufYRHnuTDrJAxfzGzU1h3tuSWwKmap0Sxb3ROvk4gBMR6kyTr4Q
	n9LhJm3Gr8b7hCZFm7+G2fphSaG3xLlZ8SsFLy9WMKSY8PUUHrtvG5vNA3Pw3vaJ
	kVd04c9UQ8OCFPcDrLx/KAstDOt+3jBm/BDg1AGAV7ILF7lxRNpdGosRrtEtQOa1
	TqOlgclRz6Ubl532hiA5lpl3cHnc3n+xWhUGhza2otEwk5P5+AwN2mAt0aw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g2f0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso2525797a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006249; x=1779611049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YG6zYfTx58sOgL5d2hQsIcF3SsaIrdup+x3Xpv+dqlU=;
        b=c+shszfiE4SqIS79n70vVWVo67jL1GUdOzB8GKlmVohnLOcgsGMneOYQNe9W8gCNEp
         MO9KfjlHce+JN2gm3MPzI/0WXcs+9RnoAPjgdoM/o3l8wNqi+LwjY3uPg+U59ii5o2YN
         /co+tFRD6tr24Ww4TG1sYfNKxS478pfB+1+U4tEpa0Sr815EQsgwP+eMjCn/rLe2o3Y8
         2Pa5fz2HmeN+38Lwn0Jt/vj6ZIkR+ajfV8jhBVOTgB1UV9BAJyYXDNtNl5LCJS77Sp/s
         Hkd3AH4SrDxzmALM09zG2cq0+cHpy+jB4um8g3nvO5ZzmWMAB052Omakmdh/UOXfmnrw
         Xx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006249; x=1779611049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YG6zYfTx58sOgL5d2hQsIcF3SsaIrdup+x3Xpv+dqlU=;
        b=lziLG4UwbvyuvWn1/tz2xyLpJkK3tUfKoXJt5XH00WCfEhoQ5pzPNpXdDGkfzgr48b
         iSHzdzqaoyVfKvBEXpEf4xLy4Vf0HWGyhlkkA0Krn0pMbvkIpgn6iBXiNrdugH6BqHi6
         krMDC6mUnC02RpC8H4pHMpo54IzTAcO1xkLv5sFdm7ofNKyPyr5T3LdXHuQ3JB8whxN4
         Qqa5vP6qyl6lxmsFXLS0Eq6Jt+phvxBwlBVHo50BkbvU1eRo+DWAubAKD4Ya8vd279FB
         LN1vqZhOsXEt/O8f0s1KKzG+mS4jxJqeCNDIWwD/FRewXCLFjFR+jcsZBfUYZX47SZ84
         OkIA==
X-Gm-Message-State: AOJu0YwdrF+Jfz7a4ldsqOFg0PeNKWiG8dUaA+EX9SYvKPa/vIVFBL3i
	oPTWsB5WHU2igzaWjHWpgaxzqG27w15avHhu6ZqDgStXGejO0sJySC1KadxeMujdItnUOHYFYlY
	+NpfVT6iYTxA/Y//OKPaGzsiHF159FOqtyaPxBi1R8RmbU6UNjHpf8a4WTLaw6HmLf2pfhl5Ex+
	a1VYJ49cR0Fp9ujlCoS093mQ==
X-Gm-Gg: Acq92OGc3J8SsBl4ieuoPIatLtfzIGI4TRXOxLwbt33OxWhilzA2GY+vDNJ8pZWi6QJ
	Brkhitla7bnivIkzNNmKMJDQgL3jv87Tu9T2et/Jyv1OrHD3kjCSeWeEWcTWgr7NCOWaqOXPWsQ
	NdstWtm4Pkrfie7pxsNlHa+BGKWpWQZEDwPITUVHH0b+BujsU8wdPl5UM2KevrPWR7p+GlbWzgQ
	bqsz053Z4vsIdF62xhoY2LawpOhPC06epmSiCZd/o2Vv6kWPzWFWVgUas3khSJJWPY1JVX2iY7I
	+MosrSGQ2QEUQoj21Anp9cL3yx16RFP8SCGfiL7zz9YevAk0voZMShVrIk4YNJ4l+0tCJEu+pU8
	SrjWihG3P1ammXAhRB+BgyqiHRDOyvUJC67pTlb2ETM68ZNYF4b7j
X-Received: by 2002:a17:90a:c2cf:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-369517517eamr12599433a91.0.1779006249102;
        Sun, 17 May 2026 01:24:09 -0700 (PDT)
X-Received: by 2002:a17:90a:c2cf:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-369517517eamr12599403a91.0.1779006248596;
        Sun, 17 May 2026 01:24:08 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:08 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 06/29] webkitgtk3: fix build on riscv64
Date: Sun, 17 May 2026 13:49:34 +0530
Message-ID: <f79e50c90830562c834fd99bf522b645ca9e6776.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX8y2Smwi4OT0y
 SOkgD+gzHV97SuKZVTHCOoQZpAM8g05AsoRXeWvdWpyzhF+7y7i2Qs6KXHh0dWRlTnjyYd6BbI9
 mOBkpB72gN9JOGpHMWEF59HdOXxZNSKhyldhrMbfGHmeQHlFCurTfcP2LzItMlAmV5nl+cu6mKF
 bLJjog5LnUEjq/iTlYVcYsV5MiF6DkbN5+Pgxc8UgW+RhLFvqHWKtuADII1ROwIJ1CxbFMVxMN2
 qVAeFmMjPWqUd8xdd7A7tdwQgYvB3P9WNG5AzVEhPgtbZTentden5yp/Xqvz7eTc4db7zT5sGG+
 pI85OCCXDbonAYlxmOQgJ8nWMl8pLrIRDvE1rAMqZUd8PFG/mI2HW0Ou0Rb5urM2rAP6u8WFyzF
 ytQ3hfd8jIFWvr9F2u8e0+rPL+ofAbSWNzueA+hyZzGFujiS5ZBmvtJL94RfhuLRXwlr34Rj8av
 pd6MIdPv+gCM0/xsiBQ==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a097b29 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=t7CeM3EgAAAA:8
 a=EUspDBNiAAAA:8 a=U9JEvYS8Al-HJj5tcPYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: V4x-hP3ieX_BEcekQai_qx5uLQLnKH0y
X-Proofpoint-ORIG-GUID: V4x-hP3ieX_BEcekQai_qx5uLQLnKH0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127019

From: Yi Zhao <yi.zhao@windriver.com>

Fix the following build failure:
Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:71:
error: cannot tail-call: tail call production failed
  810 |         DECLARE_STAGE(name, arg, [[clang::musttail]] return (*list.fn)(list, ctx, src, dst, \
      |                                                             ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
  811 |                                                                        r, g, b, a, i))
      |                                                                        ~~~~~~~~~~~~~~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit e2655772498b06bf3fbd56b365b347cb130bb843)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb
index c3f736568f..67f95620fd 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb
@@ -113,6 +113,10 @@ CXXFLAGS:append:arc = " -mlong-calls"
 # Needed for non-mesa graphics stacks when x11 is disabled
 CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
 
+# Fix Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:71:
+# error: cannot tail-call: tail call production failed
+CXXFLAGS:append:riscv64 = " -DSKCMS_HAS_MUSTTAIL=0"
+
 # Javascript JIT is not supported on powerpc
 EXTRA_OECMAKE:append:powerpc = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:powerpc64 = " -DENABLE_JIT=OFF "
-- 
2.53.0


