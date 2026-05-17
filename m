Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DA9CD4F4A
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20212.1779006259875663998
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SP0diynv;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=BEYqUE4B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H4lrFk3246442
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=caTVrYzVxCc
	P9Nv3uqz1FbL6kMNO3Y3rZdo2on6P0YA=; b=SP0diynv2AMv9c+F9RcVrBi+nbU
	QfdGDbRFaH/ShlrKnxCVATh8cs1JyVUFbSGjRhBnR9isvPsaw0K3TbWHUBg/+7Cu
	r/F1cMrNIkXEczP+uKNEaRwqDBTEGFEqK8PcQDbAg1x9mqoViFlS40mMemzhD8co
	1nX/i5gLEXd+WfgR6IBqH1n5P45J8nK70NkAJv9donLxd++cNKeBVuKT5rZPSbyk
	mFrYqBQf2wLQ3V4H7+JDyJs6ZnpHDo8t0hq3q8LrtcLx5u6FbnFqUiHD3wn2Ein0
	Fz81Uig5AAWeJA0J142X7A3AQNbegj/h5NGrVqHcxmdej3AxBim8MyBYYPA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqtg43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36865d109dcso914434a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006258; x=1779611058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caTVrYzVxCcP9Nv3uqz1FbL6kMNO3Y3rZdo2on6P0YA=;
        b=BEYqUE4B/QI00CqKPlT/vUfY/nI/Va4KkMZpwg4oTBcsJRPnjEAAr/ytbWfR4NwIt6
         lAN9PfJUiiq3NTy4/yLAPtBR8oY/GMVA1lAx3dbVkcA5wq7yrLMDcOTzb90bvj++nR/e
         AqGj6NDN1uTxspzSgHs8c/7fE/DwHNpFn8ZSAXSVsO6vLXSCsO794GXIWT63NB8xSExA
         S3yItDc02i7ZaJCjN8i3zbnDttVAimAAvngulgQDUQVwInmzJ58gIqG+jXT9pBB44bNG
         hRLSFHBFDAduNgxNMA0TzAGoV8qjp5VQ4NUYGaHbWUHjA+zPx4XB6Cz5TRQtwma3PD3Y
         7APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006258; x=1779611058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=caTVrYzVxCcP9Nv3uqz1FbL6kMNO3Y3rZdo2on6P0YA=;
        b=jFpLmPJfrx7hjYQ5DZuPH86NDmsbhmhAfrrwg5HKamr+gMAwogSoVKaXUPr7cu+S1b
         scLHhivII3Th+Gjt/lr+3+yIXLLWLusMCuOyfCf3EArt9UUgdtfWEDbS5ZkCTu6i/Tc7
         NxiF8Vf5PIAKw9wS7t0oswRkhwo+3wT9Cha1UnZCI4OS3uW/t3Ftcisoy05chmI1iT9V
         /qjw1nufXA2ebtIRLp9u8MTEt6INZmQ+jDBxJJ5F2gbTlD0gdR3Tx4uIU0H5s8F7bgod
         rh7tkXIj8VPFFa2WHnEwYV1sq65yAtEcLAk8/+mBn/WeYVTbFsh4aYNHzqp2EQkQOqGt
         wBlw==
X-Gm-Message-State: AOJu0YxcpsNFPu5bX8bOGojvYDYfzvo8/XdsroavYq1PXCTFPHdgHJn0
	AU+G7lVGgBxUULcsgJ/e1io45sKG9rKXNju1R2d0QR5Ci0xY2ww7gqEAfPRYuRaHi+l9zTvXyGQ
	wKz2egfUK1940nBTjClfWEO4aoK3IfCNwG/mH1odA+rlWT5vo/uM0xJA934tj/Wr3fj1EDbVupH
	dmiuJxmVIKC0nTOgMnpqSgHA==
X-Gm-Gg: Acq92OFJ9N0iZuM2aO9EPb+Pd/d/QkpJwvx5ku2QI8saiS7NS0tOaoCPj7O/atleMEk
	pLadxM1en/rutVGiZAxDZEL6iaJweXmFSdV136bwrr9E4Hv10R+pswKXACxFPyDek4+lXNlW5Iq
	GYuGyp+DPbIbNZJwTu9JkN1+UQreTluISo9pHIhyMDaHyZ4xq0blnXV2nvGpFAc/ITIZ2ZbhlKW
	gAMndnyQgBMECp0tqYCiUO1y0SRPtTK9T6sh3ANJGT2sHfXzdqt49V0+I65BHYrJfbW74vP72N3
	oEjjJLvR7JJXrCkJPYKqe1cj7l9MPDRQwqB3/gq8UOJ79EBkgJhPjWShGqYWRJs8a6JPK9dhw6+
	c2QrlJ1KK9do6YzVR9t1YMczl6ZPTlMJ/Vf8f56SiYc6a1FvQXX64mJR6Qf2DQY0=
X-Received: by 2002:a17:90b:2e0b:b0:35f:c46f:2b0 with SMTP id 98e67ed59e1d1-36951a6ce4emr10467302a91.14.1779006257902;
        Sun, 17 May 2026 01:24:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0b:b0:35f:c46f:2b0 with SMTP id 98e67ed59e1d1-36951a6ce4emr10467294a91.14.1779006257395;
        Sun, 17 May 2026 01:24:17 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:17 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-webserver][PATCH 12/29] apache2: upgrade 2.4.66 -> 2.4.67
Date: Sun, 17 May 2026 13:49:40 +0530
Message-ID: <33ecdd2e8102634ded0c2e2aca57eed126ab26da.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NK1ccIfg3uNQvjS78RuhjoCafy60MkL2
X-Proofpoint-ORIG-GUID: NK1ccIfg3uNQvjS78RuhjoCafy60MkL2
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a097b32 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=mV9VRH-2AAAA:8
 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=6PmuYHjm9Mjsl3llDxUA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX+3E+0qqxdM51
 AoaqRLwMA8KS6vaJJ77svpy9tEeuIlZerP+9EnhUp4XUfxU8/sqaAFoxiqb73Hkv/34Hab57cRb
 +WiTXwuLyMTL44sneLoKSSqqgqkYog3DsYSyxFFQtITBHgmlGRmwz0gc2tau3Hb0CSP+gJKDYur
 HX481XXBNLuNwlCPFDtcUgvtCcFIeBDEa/y7fjO16GdSXQ4pj3+DltEyD+Y3y/TzUL9FLRV2/wV
 g5xyM6HB8la7DyMMPK1VXXMJtnvqCNEZIsaCfHXBUqiMQCHdkAMS2IJoo38QT2uhMIZUp23xLxX
 zs0A18ImSs6fF01bhY0cBG4wIz4YGSM0qFdMopuyfFmzc7kVektJ4jcKQODNfWYj65cWfoJJaQl
 NFd49qZdPbOkOwjepd6pRwdSMPQxP3qDVfAzYc9jGn7O4LXUFwCDnYdriMqb9oaWxQl27f5oe4a
 8McaGPtUkNehSSZwoxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127025

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

Security fixes:
- CVE-2026-34059
- CVE-2026-34032
- CVE-2026-33857
- CVE-2026-33523
- CVE-2026-33007
- CVE-2026-33006
- CVE-2026-29169
- CVE-2026-29168
- CVE-2026-28780
- CVE-2026-24072
- CVE-2026-23918

See: https://archive.apache.org/dist/httpd/CHANGES_2.4.67

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 3ec333fc064b0088649a3dbfb69e3f3dd06e93bd)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../apache2/{apache2_2.4.66.bb => apache2_2.4.67.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.66.bb => apache2_2.4.67.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
index 630c6f3b1b..082f533c85 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a"
+SRC_URI[sha256sum] = "66cd206637b0d5c446fa7dabe75fe03525da8fb55855876c46288cd88b136aa4"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 
-- 
2.53.0


