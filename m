Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DE1D6CFB7
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 03:07:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59953.1769137625226043836
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 19:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FbEd1YJV;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=FBO7wJIk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK8Cug3679383
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jpmgnve2bXB
	lyQF3z4EqlXPwHM3/7X6fGT/FThTVkRs=; b=FbEd1YJVMMpM8Qb9prUmdXLijkj
	WNzZhrIdWkKypDLDtOdnCPRDw2Ti5v6RiqaIqpGZqJoSlU6u3Rl6p42d12c1umkK
	+p3YSeArfe/GL1ZWlmYCJ8n40pjLYCbSYYua8mnaxlJeEIUr8jx981pledxUg6iz
	UYwCAXEoU3PSixaBOtHObEpuKvrq+8jrJ5FGHpjLlDkTCP0knh87wo2cFcElA8Kc
	WF2hgcyP7a/AoZyXefdRPkTZVlx+FfGVyAhUh2WEGxCXwP+mJDQCKzX62Uuc05dG
	gIvQ53RhBACCOc0qXXGFMS0s9KY48+XTJkYuLaL7uEDE/wp+sxXtmZezuGA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp1n79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:07:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7701b6328so14317045ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 19:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769137623; x=1769742423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpmgnve2bXBlyQF3z4EqlXPwHM3/7X6fGT/FThTVkRs=;
        b=FBO7wJIknPHqNYZv9WUM4Vx1J/vRJlATypboAKNt8eqO1HWWRVYSrjYVfV+siaGM5/
         aRiVuVyntoCwcI6Gw6mi4cE7aeZXyhhwbhHzOlSXTPw1txKwDJifXX2StIxl1p9LKwaY
         vyOdENgQJzv8i4VcGM7GN8rYcLaw2vl7MxQl2lINE8dZSToeHrrILhCGvj7mdJcrm0K8
         XoU8xjGqaHSpwSBkfxel2N7UjCLoHBXEg/s8haz7hpChX5uw/iQexo1qynTRbupDSXLH
         DIprk9rrRk3vUjhGte3jc9aqsGtBODm+sJ/gCSSJZTsnGLohMmANnyzJo/OalABFVtZS
         ka8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769137623; x=1769742423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jpmgnve2bXBlyQF3z4EqlXPwHM3/7X6fGT/FThTVkRs=;
        b=O17EXpFZblNxUJLyoS0uuOk55xV4J5irRI7EsuKMngJROhxRDLpLLx89SqRTpGVxfe
         7ADfnB+e2oG0WosF9l8oY8zORFwAezTl9ljHY2/Zw1/Exbub+ft0Bu8POffC/LyYKwhJ
         7zlF0YkYZiyIpgPp81K8tQ9rIf4cuTPunZxUYZbtS3wU2FYTMXgMCo6BZa4fAURP3Lme
         169ltg6N/qqxuYo3lqvZI2iW7kyVMLX7NrHLeG5R+dXIrFqZBjdpc/kfKXeJdV3dqueA
         rhztMt8TdnJnpYh4j7LWoe0L4mdkEe5cQtIKFfIyBTHyptOR6yL0UR/kKpwO9o5DOJ8b
         e0Qg==
X-Gm-Message-State: AOJu0YyXMvAIMPGAx1f+8Rng8ldWcSAs84r3zZyJ3GRk9FCbLVDQzR8l
	nxmiOSjveyWSvh59phIw/A5kq5N07eWweYfEJDoaWxS+mMWAJWeE3tjgF+qZ/MW5KCcZxxb+nPL
	woBSU/TAawNXNWQSiAaNnYnkQkFHGA2thgxwUgcu2VIvbG8LtJVxcAP8UtR92HKCrdKC/WfwHYI
	y0wuK5zx2xfUy2H0ytPqc=
X-Gm-Gg: AZuq6aIxjrTNzFPuazEreMt/AZ0JN33sk0f54MURTLqPaGAhYJZTV8ZlTIZwSOSl0Ht
	Iy8asjD8YjC75K45hGxlv106O5ac0F995cPLpbgrnv+7aG7rs1PhVk5ailOGitS2Af333ePdTiZ
	AIQcRrZNI5U4g62L8WcE37MM3b6VtbivTdXL1Cl1OV7waj2qL5otMqgCn1tLhSdAp/JRhivAzKt
	W5khjCrLCsFMuAs3Q0Wq3vZWRYAzkikcHeoBnjVkWHX0peYJoUCeNGmZoXkndSLnmYoLyTOpbgr
	uOXsTic5GQmcy61/9zC2rq3NNYOexx6AZA2+yeLCO57tppfKpLLPjN+jhQMWv1zb/XyAWlSuWIf
	+f7u6EpkeUuY8AY/TJRxzofVkySAuNeaTGfF1+5W+
X-Received: by 2002:a17:903:41d0:b0:297:e59c:63cc with SMTP id d9443c01a7336-2a7fe6250b0mr14487045ad.35.1769137622964;
        Thu, 22 Jan 2026 19:07:02 -0800 (PST)
X-Received: by 2002:a17:903:41d0:b0:297:e59c:63cc with SMTP id d9443c01a7336-2a7fe6250b0mr14486775ad.35.1769137622443;
        Thu, 22 Jan 2026 19:07:02 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa62fsm5664945ad.18.2026.01.22.19.07.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 19:07:02 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [whinlatter][meta-networking][PATCH 4/4] libowfat: update SRC_URI
Date: Fri, 23 Jan 2026 08:36:53 +0530
Message-ID: <20260123030653.3331549-4-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123030653.3331549-1-anuj.mittal@oss.qualcomm.com>
References: <20260123030653.3331549-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=6972e5d7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Aziwk6T4AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ku3q8isARWErNSvugaQA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=mtcElmGe8wx6H7Xd9tIj:22
X-Proofpoint-ORIG-GUID: CGFG4cIMwUt7YdPsp2Q3FaAVylwYNApM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAxOSBTYWx0ZWRfX0LkSvoPIuHsK
 IyGD2lKor0XOhsbJin5dnZ7qVXBc5DF3fJ80KZ5StbUMoObPTUsZskIfmUW7qgkZnC7a1Y8BDdH
 2Y4bWhgEHnRWB/hg6AaGrzcw1GS1BQ/BKyhgdKdmMnnBw7N7e3EdLUPMC3eIpabriwdq+MywhXI
 qrVhjtqXzhQUbBuLLH7pD3UUJmyu9DZZzIWlZAtjjpR7XJ5cQScdIaUB9t99n8ERj61m+5XTDHH
 xv3fuwsRkAvNqr4GHmtM5lAcu7T3G3IWsH3GF0VVnTLkYaPhKJG5OLp3mquniKwzKjgbyhFmOE6
 ISG7vyTn8T56Nyb38u0eBHIl9WoNtTWPBvM9QYpwR6djIZd1A1NDk7UEv/8fFFenl9XHFD/LtaM
 I9/pcJHG5z7yrf2/6dOEIeTyZFYQZmPyVvmZQwQr0lyTcHtP8vEpiPgncYf7tuQwbMuuLRtl17J
 /6AAtZNzVPwEkTUPqvA==
X-Proofpoint-GUID: CGFG4cIMwUt7YdPsp2Q3FaAVylwYNApM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123759

From: Gyorgy Sarvari <skandigraun@gmail.com>

The https link does not work anymore, it just refuses the connection.
http still works though.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8cab2b2977f7cfbbf7bf1aa617070163e2eaf002)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-networking/recipes-support/ncp/libowfat_0.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ncp/libowfat_0.32.bb b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
index cc67d9aefa..2f00da34c5 100644
--- a/meta-networking/recipes-support/ncp/libowfat_0.32.bb
+++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.fefe.de/libowfat"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz \
+SRC_URI = "http://www.fefe.de/${BPN}/${BP}.tar.xz \
            file://0001-Depend-on-haveuint128.h-for-umult64.c.patch \
            file://0001-replace-__pure__-with-compiler-attribute-pure.patch \
            file://0001-fix-incompatible-type-error-with-gcc-15.patch \
-- 
2.52.0


