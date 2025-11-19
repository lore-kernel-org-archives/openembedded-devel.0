Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B56CF31BA
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 12:34:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5830.1763555687323037376
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 04:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=afE7tiTK;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=MRHslABk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ9Jqaq3412690
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/4dDBbRIJny
	SIfW6vUpxsi5cAK6fYQMygfERxxhbVu4=; b=afE7tiTKmDgcI99/4sSBEyUSnEm
	2YIwUmX3PaK2zcSUNlkS8/E5HVKfp+CBOgehAocLl1MahmSPe5xfJ8NX4U6MGaGG
	g5NMmnIThmwvf3J7T/thVEZcAOKgjPeFHChJMD2amZvjQncCWG+J7KdEllpZU8Sg
	SGQud8iNJ6wAr6K+HVXszx3c38yzQc6igYDU76TOBTIJtqYjguBMGHiH3Y2M2b7g
	5QlIvsU5Ye6GNijy7EqfP5kprlzrCvtG4GfRsPmpKa3twbR9EDBtmNJTny5DQuPx
	ufpRir/nlQAm39yFgaIAnXftIX+bSBSVnEcdeG8LQDZPWIqg1R00BWwuAhQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv0v39a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:34:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2982dec5ccbso122255355ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763555685; x=1764160485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4dDBbRIJnySIfW6vUpxsi5cAK6fYQMygfERxxhbVu4=;
        b=MRHslABkjhgzZxkqx9r9mHDkEQuf4zqb6+F0DFgfPROn2dMDyfGHOvRm8NhuVzTB71
         vt7u7PIDU+dcRljOnKUO48Bxc6tIuTbLjHHpAI8pi1ECE4wFMmaCWJ3bizNnSAYzmPcn
         sfxE5u5OpBxQVKwMBZE5YLZZvK//DUGnGHymQcsXu7WY15AnUsTR8thXT7pGDBS1XKKV
         ZIO0du6yUuHtIzngiXXMx6fTbuAvqf7zS3nSinj/qomAfqMuDCByYxVph1p1gTl2p5sZ
         aUhxLYWmip96nqxR6CWS4wCl9QiduvMHhyjB353/1vQ6bmtO8c0MMiBxh0WfwFKNPCOL
         vPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555685; x=1764160485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/4dDBbRIJnySIfW6vUpxsi5cAK6fYQMygfERxxhbVu4=;
        b=JdZVWPLFYyi3JIcOtn5owrTmVVz/hUakvQ1rBbvl2O1wEt0SLD9dTHYj8skM0H7ozV
         AYHPfnvL9rqYoF1dynDGKGk5eWAjxpIK10gV+VsMa6LDvKua9BDbxUmlmHfKBytO27/h
         fZm2N1Xdp3qbUBi+17i8JmaL3e/Pqs9Q2j8TETiJsc2xZn1E5+BxPNPZxuv5E1ngs8uD
         zOH3gOR6vOkT+cPYsicY2Sf3cZfvCZgx3Lk5qFgAsr5M9plBCzGJwpW379jR4dhwMWrg
         lZdxEumOdi8Dy7LCm/OATudlbDiJQ+afs05yqWnJkdTZicEb+PESxQYHp773p6BERrih
         WZ+Q==
X-Gm-Message-State: AOJu0YzQGoW08R/OJUaORTKinndDywGg8ArVVfYnF0bB0deCe2Bj2aR8
	hJM4/9NdsCoYvlt59FkOc2OlbvzRdtVdb9nPi/28S+T80O4aa3eiHf61E0Jithl/HFpqFrVo+4y
	L7uoK8jUDrmdD/H05MMDPIxnyNqLPufX9E/KlNoiOqngta49zIXvtNMSuz70veENMBznxkee5FQ
	RFtXqJqorLAKz8indwEy4=
X-Gm-Gg: ASbGnctnIAPGLd2wS7pl6ulZA5Yb9SS9vZ9lDA2BCSHRBYpl6HFoYviBlRUV+1BkUoX
	goEI8ymD46kI+ftv6AIFj3xoe40h5tnkx/ChblpVLO5n5U5qP40qaIvVnYyRE/nKd8i5TvNTsj+
	01vy1pI5+5ZMSkbGuGroEprqgQFb7eTktPqns/ozHcy47mw6K/w6wsUs6ituaqo4Zp+Gu0yOPDb
	WjtgTeB6i3KWJtvEC9NmiRz45IrSc92oQLJEOy7kYIKFLWx5nnEc/unOpSQgq9yHrmRp2Hbldjq
	bIKEA8ZYYRh4J8TdKvvIBYAtdBqcYbnGEnVvOntuCmDxN1ISoSgbc5oux2cgKE0QrmCpY2SZ6eW
	A7R1a7RbeTFZBwwG17MvnWJtC7PBMkV8rUHpDf99d
X-Received: by 2002:a17:902:e884:b0:295:4d50:aaab with SMTP id d9443c01a7336-2986a6d6818mr251418895ad.20.1763555685061;
        Wed, 19 Nov 2025 04:34:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElQmR+vb3BIy+IdxRUeM8t8JHQTMta5lruKfz0wozs4IIqK61qS4jRjDzA3wJPfwuvuutMIA==
X-Received: by 2002:a17:902:e884:b0:295:4d50:aaab with SMTP id d9443c01a7336-2986a6d6818mr251418615ad.20.1763555684539;
        Wed, 19 Nov 2025 04:34:44 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf158sm207999915ad.91.2025.11.19.04.34.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:34:44 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-oe][PATCH 2/4] fvwm: Fix buildpaths QA Errors
Date: Wed, 19 Nov 2025 18:04:35 +0530
Message-ID: <20251119123437.2192091-2-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251119123437.2192091-1-anuj.mittal@oss.qualcomm.com>
References: <20251119123437.2192091-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEwMCBTYWx0ZWRfX2tG1pxO0aVn5
 +j2isOWq25jQTBaIfn4y9dqz/BfkRzV5q6HRegiYRYM3tHhhgulv0sXjGGNvd/CK9KlXyiw9vyg
 yw6ZJiso78zOSfaXPTLiuZ3McX0OM5Rxm65gEUW6u1JsdGgAuedOXsdlikFtTqQNMNpQILuIN7n
 vUiOdXGfFrcKV7/YPtt98i0F95zdjqtwfOC1dUD21i+4TkKY3yT9zY+eT1HRSg7IuPdnw4ncMdT
 zx2SbyfAGelyeZkNqg2UCjdbAGzOf29YuCuEq2lGfDv3Hz/gRXNfKkFJ5p5INHXmDBZzccLhzuz
 pLYGCe1/X4pGU9uZPl5HM1vxIPYkBUXdrW10U6NdB5gK2wgy9do01QOqlVwR6mWE7OY0Zy6L7bR
 RrnNW9tkTt1xMxMOGTmVqllLoxVdCw==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=691db966 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZkvEkkkm1gKiDClHXsAA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: E6dTnDkdTUUWCSmiXZrXuSOn3P0ulsK3
X-Proofpoint-GUID: E6dTnDkdTUUWCSmiXZrXuSOn3P0ulsK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121900

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 228c3483e28ad72d1961aba1585fd6b575362ec8)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
index 8daf38a0ba..38e22253d9 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb
@@ -69,6 +69,8 @@ EXTRA_OECONF = " \
     --without-xpm-library \
     ac_cv_func_mkstemp=no \
     has_safety_mkstemp=yes \
+    ac_cv_path_FVWM_CPP=cpp \
+    ac_cv_path_PERL=perl \
 "
 
 # show the exact commands in the log file
@@ -87,6 +89,7 @@ do_install:append() {
     sed -i -e 's:${STAGING_BINDIR_NATIVE}/perl-native/perl:${USRBINPATH}/env perl:g' ${D}${bindir}/fvwm-*
     sed -i -e 's:${STAGING_BINDIR_NATIVE}/perl-native/perl:${USRBINPATH}/env perl:g' ${D}${libexecdir}/fvwm/*/Fvwm*
     sed -i -e 's:${STAGING_BINDIR_NATIVE}/python3-native/python3:${USRBINPATH}/env python3:g' ${D}${bindir}/fvwm-menu-desktop
+    sed -i -e 's:${WORKDIR}::g' ${D}${bindir}/fvwm-bug
 }
 
 # the only needed packages (note: locale packages are automatically generated
-- 
2.51.2


