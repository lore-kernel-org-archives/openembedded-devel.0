Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59CED6CFB7
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 03:07:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59459.1769137622550025320
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 19:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Dys2Od0Y;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=W7gisg7e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MMW50s2915972
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=odwiVr3N4yp
	Lneo7BRoydN5bvJuJrGYahzRDX0YwZUg=; b=Dys2Od0YbnQ2HHq2o9M21uE0LeB
	gdP7FHh3QuvQr5M76HJPBrLPEZ9r3YyGJmZtWYbZ7BB1tR0lKXethjI6EK1KQj3P
	bat0TkhH5TDR3WsMyEwoiPrxOxhAdUVSeianYZjIe0M8A8WrUw6lI0We+THfQA+J
	z3mL6XlecTREe2DfYjcri1UrFZBFwfHmm/rVJNJyw5W04obCyxaJJFwg3PaPnpto
	9rsM7MidxUX3mklHAr85uLPkggLHAxNZRIs+g+tXtOPEErqPGFEjAxGHne0SMw1y
	InXy4jRPdtOWmz2ck5TqsEA7XDw7xi6VKZLV7VCVm8CQqNyiqrKIyuG0XtQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1rrqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:07:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so1411936a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 19:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769137620; x=1769742420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odwiVr3N4ypLneo7BRoydN5bvJuJrGYahzRDX0YwZUg=;
        b=W7gisg7eWcqiz7QkmOYeKrlND+AFdzRLviVJ1pPkinDOmVtGzLvwQpRPViOYsbrvFX
         ZsSQdo2V8k+rFPIWLzq0AAAJ8cInBaD5EavQymkJZ7SBb2DR+nN3dTPXeHofBIhrREoZ
         RtktXRw1HX8CIQrXMPRyHEbt82ZjvYf+S45n8mYoziEdTA/rK5FnW2+yWfl4Fltg83N6
         8+t7QYQjXJ+wvsASj3GjnGbbCz6uv0j8sPIWbdF9/i9240CBIsm27OrkiH+QG6ZR0FuY
         RzshDWz8ymNVCKo7vtD3OuTrdXLkzYdQpSpLEA6XcIfEN61gWEs0SO5Hs4sqAWKJ5jz/
         rNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769137620; x=1769742420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=odwiVr3N4ypLneo7BRoydN5bvJuJrGYahzRDX0YwZUg=;
        b=E3BpIwS4wLnt2qu9zQph7g3OB31Z+N+Txql98xNJMcQsByTKvCrqRKjDEBAv7wsiQp
         ordCeJj+qrabSbxiQQKjPxs1/1PQWHp63bkfbwwEKqz7e80k3dsg5dlXIu8ITvLcBI40
         SZzF69Wvn0BFMrm0Pe574PQyZwwiDhpkaweVDZxy+ZRr22DyZ4vbbqHCKYt3yBAkeExE
         3LDEwDSe6E2klV9CAuNur8YanuHq6hUU0Dlxa/W126NUX9BeixAroFUuWWATLGkanQWb
         MJSzpYNE7Cmn8oY1PyZhUztfZYsESdZ4qNAF0w2GqMZJZAjt/msMoPJEQhnnrmeNgXNf
         APkQ==
X-Gm-Message-State: AOJu0YyJ2zAoUdHHfGDDHF2vC4GmRxGwDf/5nN9dzOc/B35bjzhQc03I
	NYQCeChntZFMKK8PksXcjo3XdbOoHQbiGJJ7Gs1iFd3H2TsHgJzvI9rs4IZh/XSIcCNTeVAiZyn
	sVPZpTpqz+OAjJa4CesAIkCPU1L1sbsA8vUOGh8lC/nV1qk1hTL6jV5l1SImqrJmP49hFWbA+IH
	gZ/U58SSeYCr55OwyKsSA=
X-Gm-Gg: AZuq6aKrE1RsMeXFWolMoUntRyYLBfH8vdVzEJdv4SxN97BHsGhWeQLDdoxMXbFVdON
	yLW3o0A5IEdYM0QBXhC/faUJju+8/cBQ7B/8Mg/w76s8D1mVDDkiS4he2N+zvlcYkFlwo1NmW/q
	HHXbX/QhMZ4ydb6FXdLw3Y9QfpxZ/Wa3G2RPBn8NafPzdxVz2uqLvKcLao8CjPxjPtPGTK2nBYg
	mt41tCs0GSBOiYqGgQZ2BrGTPLxWfYtEIrZNtzSIM9BBuNWEbH+tisa99cmoCcxeKSut+Q26ZwU
	De+wwJelBWPcF+Fp3Ds1qdkvpMBd4Cqa06cX8lV/LkqySaDcOhCa1Cb/7l1iawOKHwW0C1CFH4/
	D0mv4QAms4ZA0gy6kHXPn/rIfZDCWfnF+n1K6+YQh
X-Received: by 2002:a17:903:4b46:b0:2a7:9ded:9b43 with SMTP id d9443c01a7336-2a7fe59ac54mr14601295ad.26.1769137620523;
        Thu, 22 Jan 2026 19:07:00 -0800 (PST)
X-Received: by 2002:a17:903:4b46:b0:2a7:9ded:9b43 with SMTP id d9443c01a7336-2a7fe59ac54mr14601005ad.26.1769137619842;
        Thu, 22 Jan 2026 19:06:59 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa62fsm5664945ad.18.2026.01.22.19.06.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 19:06:59 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [whinlatter][meta-oe][PATCH 2/4] softhsm: fix SRC_URI branch
Date: Fri, 23 Jan 2026 08:36:51 +0530
Message-ID: <20260123030653.3331549-2-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123030653.3331549-1-anuj.mittal@oss.qualcomm.com>
References: <20260123030653.3331549-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YAnqdVeDiz7gtO0llB6JmRn2IcFLc8MS
X-Proofpoint-ORIG-GUID: YAnqdVeDiz7gtO0llB6JmRn2IcFLc8MS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAxOSBTYWx0ZWRfX/iy6cmJ3ucB5
 tZY7AVF/O0ujF21AGxL1VgRUfOcDDXmLr96m0vUBJCeRmqwqn/OQm6qhjyX15pNgVUekEnn9zCw
 2ji/GpMeiu00zL5JMTTo6c5xd37xVPDcBwnrQY8uEkNIE+5PnR0i/xT7gVBOx6LOcsYCGSvGqm/
 yEAU5UcbbtlU0LOMtC9aHvpRybIy0YHJLrA3KXjqUIVjqNQ5Ut5qu6X6/7ighqu9ayfRWLgmEoo
 I9Z5n5pV/f0WOv3TdENwsaSi977YdBpOTmzoZJ0gUoaK45hq2HD5ZkuQtSzy/jHIvz0RANKUF56
 jrCbDQOwE1o+Hixnz3aZI/FT4U5PvcUZrphVdJvIzeSGWHYupJb/OrIUFyYUcE2D1MNhj692HTO
 LLY7nEKnTvXg4WWPI/G28Ux2PzljZQI+gXNsPudredQMwxQhzYuiozrCQzZJG3pB2gdFI3jiSAK
 yVPgFCXIAmQhM+xXCtw==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=6972e5d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=viCFZy_D5tj5DF3BWFkA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123757

From: Gyorgy Sarvari <skandigraun@gmail.com>

The "develop" branch doesn't exist anymore, the used revision can be
found on the "main" branch.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 21df5861c7e03af154b18573939649ae65dcaa92)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
index 78766e0fe9..30b4fc71d8 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
 
 DEPENDS = "sqlite3"
 
-SRC_URI = "git://github.com/softhsm/SoftHSMv2.git;protocol=https;branch=develop;tag=${PV} \
+SRC_URI = "git://github.com/softhsm/SoftHSMv2.git;protocol=https;branch=main;tag=${PV} \
            file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch \
            file://0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch \
 "
-- 
2.52.0


