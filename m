Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E23EF99E2
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 23:15:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1953.1771024553091313096
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 15:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=D7sLBCTx;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Vh5IEmW9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DFLqW33893153
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 23:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HFnul7zPJhFY+an2pGqyoa7WHeSMgkHeO/K
	NU95/1F4=; b=D7sLBCTxDuq+AE9dKB7Zbt5d5SlfiM9niXunCtQOuc7YV4MhK6R
	guQIBxrIktJOtNpG08n4d2eqJPj6UN9W0BBv7Vn+GI1YNGVt1D6dxGY7gcI3SOn2
	JJNIx9rVEQihdIEB0oeuBXYvdOVHjYAE9XLm9HWkssxWgzVYOsbiNxwmznzb0ZfH
	tWfxt0bXIC2yDDz/k1xDA52SXsksqXg9AHx3zc5n8m3WXAJkgujjQZ8mdF/VWMLk
	vPj3NDN/4Ti6ukhSzg2R8st4wksAeBsbj76TWf+2Qo5js8w1frsfYrGGIGwN0DaG
	AkDdkL4NDUj4dnXykwF8tpqWgMbX6wzz3vg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca6h7sj5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 23:15:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so464230785a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 15:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771024551; x=1771629351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFnul7zPJhFY+an2pGqyoa7WHeSMgkHeO/KNU95/1F4=;
        b=Vh5IEmW91w8DenxDLljITiAPmZ0PGdjNrxls5m5OqQSKBZ8gqO4bbzpY9Ou2R67DCO
         zXZUUjLkhnbFtkz1hPgtf3XTeazEFtaMDsyUbLnU3vVOEduW2JVl0+Cw5QmtdpY+JWN8
         manettGiEXQywwXBEV0QININYR7vzslgAk9nSsEhPi5bL20Gj4mgFfNTc1KaQrKc4JrF
         2OPFeDIO41Zz5lEMNa0GZkLWG85uBHWyqRz9AnfIHcPAuGV6cJNsyODbRPbe4hDejBrM
         3sLvbAnAqGMrJN5y2fW8NhK6zDybApliLaQIV09cUVmiFJJ8kZxlgp4EvbYCrO4njtpV
         8toQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771024551; x=1771629351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFnul7zPJhFY+an2pGqyoa7WHeSMgkHeO/KNU95/1F4=;
        b=pGLA1WyGA5D7CK4v9MIIFbFr+Zeu+QAQNxmb1SJk9HTLdObklcJVfXUHvSOEd58Pwa
         iNGfT8HOULj8X9Fl2hP2HUVijpuov5blzOy0V17iy4mIS3T5J21QEggjG3rQNetMi8wO
         XJi08GHdXjtAwvsN9mblGbCVkUFqqlOfOdULad8nwOU/QjG+IdkpQZOVNG0Rw6D3DXez
         drs7n5OU/KiOsRjb7RIPZbtlf0OIf7f8yHobTBHEKHq+jG8HyWn1I+otVmvd4qZbab4i
         0um782xkypios7HnfF2wd9GESJIj1lvrm5o1bXPFGA+JkUOnNFyExw/dRBsGWAyimb1M
         HGuQ==
X-Gm-Message-State: AOJu0YyjnCrDcpekCvG717y/oQygMMd8nVRzK9KzLuginLK8lUPN756h
	sV1BDeMpmcTwD4loABs+wfCczdcBO7fLlbErLAR05p1IwK26ohCU6tQMz5AYXHFM4/4kA5BN3ar
	Hco9u4Nq+7TLP+IL8LyCXqK2MZC1GKZRaGEotmMVu6kzNDdxC+bFtUFhFmkWHTNKA+HtLrs2ObU
	ktvTtN332oE/ccm9hH
X-Gm-Gg: AZuq6aIi/O06C3KOwdHitrFY4FEuQd21y8gqhZCURKjNZ9M82YjXDf0IzrRQL9SpaFI
	nKGzJbt4kUA/c/GczPRaBSyfbUoz9LKKNujRLMKLCkc42kXbHkPdZ+7pVCi2hxuVJ/TIpImQtzG
	QAlMtAujm3axV8WF7DuE0UGS6RsjVq3IgDCVgxU+lgL6QDVBbo17VCzBzYktE2fA1GL/EoCMRAB
	5nURIW1yeG/xx8CwXV1+Y9stDQjBCZB2NqACyPCcd42RBSW9He9odPJbt4wrW7ADzOuAKjcREST
	kfPocvmtDOOHND/N5Be5xe5Qm7Z7JREDmFmebSLwFPDLt2RRYa0gymWFgCWpy4zsg2nPIowei4l
	e/I/kHSaTjSWd3wfbC3SL8T8GN1nehfV4i7L9ZHObKGmpyB0IHRGa9Ac084eDoslrbNFJZtY1HH
	OnmR/bN7/JqiLOpohCF9TPWPHRZLGuMMpa8q0=
X-Received: by 2002:a05:620a:1926:b0:8c6:dacf:5dbd with SMTP id af79cd13be357-8cb4ac0e7ebmr252945585a.18.1771024550811;
        Fri, 13 Feb 2026 15:15:50 -0800 (PST)
X-Received: by 2002:a05:620a:1926:b0:8c6:dacf:5dbd with SMTP id af79cd13be357-8cb4ac0e7ebmr252942185a.18.1771024550158;
        Fri, 13 Feb 2026 15:15:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b90adsm1823918e87.88.2026.02.13.15.15.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 15:15:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/2] vk-gl-cts: ensure that the SRCREV is correct
Date: Sat, 14 Feb 2026 01:15:47 +0200
Message-ID: <20260213231548.543485-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE4MCBTYWx0ZWRfX4DSGJvuf8vyO
 hQfTOsptw5EH1M9wbQBDq5Mspl/oCleL+CgOerQCoMuDhkS+xzOsmbOrkk3a8faGLB/ddjhZBXP
 45R+TpXvu7Zr0UWblwbOc34MMs1QBOAngAPCv/OBRDjav8If3gBRun0z1o7WsF0rbqWuQBoNQBg
 iIUhZ1gGxzF/b0jul7xEOJPdYmaikuZ2k30wrIw0ey1Tx0C63N9atpkJaTc61VVE8ZrD6++aHh0
 YtBm1GBeamWNBuFZjMbslFnLwLh6W0WziHB7QK4rtOfnp3mkjdvg+q0/DVlwovZ8M49FgMoY2G5
 O3Fp6C3sJTtNE67RSoDVcKhThgMTcV4E/S+TVbxIS6gzdBlDHwRKt2+aVI+V3O9Wqvab5OTWYMa
 gKsa4Ss+an4XZ9zz7+Y/Jzcrao6vycWyo+Q1a54pyaB5Te9rdf989gyAVL1iAWjvS1Gt7i/0oa1
 zW30/ok92OQJWUusO5w==
X-Authority-Analysis: v=2.4 cv=IaKKmGqa c=1 sm=1 tr=0 ts=698fb0a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=vJFsDkwi2ydU_hCt76AA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BkHdfrcWErSzq1G58ic0rRu0DwIfwoaZ
X-Proofpoint-ORIG-GUID: BkHdfrcWErSzq1G58ic0rRu0DwIfwoaZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_05,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 23:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124397

Use tag=${BP} in SRC_URI in order to ensure that the SRCREV is correctly
updated together with the package version.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 67a0dc564c22..02f777926eea 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -1,7 +1,7 @@
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl-cts;nobranch=1 \
+SRC_URI = "git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl-cts;nobranch=1;tag=${BP} \
            file://0001-use-library-sonames-for-linking.patch \
            file://generate-srcuri.py \
            "
-- 
2.47.3


