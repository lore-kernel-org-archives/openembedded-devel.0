Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE9CCD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 08:33:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17042.1779179609150550506
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 01:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PCqqbNKK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=959923361d=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5CjHS3062208
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 01:33:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ntxbgkCT/KiIPl+ar0sO
	23+7pO+qnblRZVGgPolxqq4=; b=PCqqbNKKD0xRSL/0S/en6K0ONf4whQ2Y3BXx
	hN9Wd9yrYeTdHlrr1ojtW3QpAxNzliZmbjYH3HYShz2jmT6vQURPleoVXUcag/QU
	jz+A3Xl2czGDj3dAubDT9PfHB1YRuIW1SvBvCiWS5prus/CJU3OPdAWfhRhGlDaT
	eU3Gonfy5cvceIppFZMXPH14DKsbIeHeA4j7DMxmdf70znkli9fT10JbxgdjYl6y
	BBo7E6q8khIXknYIRGhsAUTZBOCra1rB1Vhm0ucK7ywZOAmLoPqqd/3W/5VccTGk
	L7NkN4+UpPtbjlQ8ZhAZ3hKsq6pPrMLsMgskUatTAqJ1608aFQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux35pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 01:33:28 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 19 May 2026 01:33:27 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 19 May 2026 01:33:27 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] layer.conf: remove dead BBFILES_DYNAMIC entry for clang-layer
Date: Tue, 19 May 2026 16:33:26 +0800
Message-ID: <20260519083326.658995-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IBBCGaP6ybUXMPaTV8ZCLbQAazb1S5pG
X-Proofpoint-ORIG-GUID: IBBCGaP6ybUXMPaTV8ZCLbQAazb1S5pG
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0c2058 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=czTBkVY6nj2HzPGu61EA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4MyBTYWx0ZWRfX/aVjbq9QAlkP
 b8OqNF5gXLCNUXrF5PkabuWxy5+w41r0SFhsc9Hfl7vCJAerR8HOC0fC9v1UA/JAaebTmT6gCLP
 IQ1DUR7Pw8qqkhM3iVerR1KJoMBuMZT65wzi9Qce4hoYHsozNYEXVc+BIdQMNpoeAPbbb6i0sX7
 EvPiFfJ2fisbaA6hoQLltVcnd3aEM5/O0HAfsgrqsO8t4ZvYLlc0VZ9ycQOvTzrHF4BCBBfNyuJ
 shtLi24ng/hD/pH74styYb31rN+rby9d7Hyme4zbT1+7PSTlU9cB1uFhgNQBnr0u3XitGOow7zU
 ywZibr6nl/hDZFItYemTqNJ2zbqouRoVHdZryKoVIxNgfjJ/KLjWUMK0thVBlQ9mVRaPKM6ZTTw
 tWPYDVaCEH+pc1JOnUknx5K4vb2sFRBAtwRuitZbY4Y2hY4UIHglYuMY2xQxbkhn6Btc6RVhoPa
 2xogykKzINvcUWDqyuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 08:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127060

From: Jiaying Song <jiaying.song.cn@windriver.com>

The dynamic-layers/clang-layer/ directory does not exist under meta-oe.
Remove the stale BBFILES_DYNAMIC references as they match nothing.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/conf/layer.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 78df6e3c03..357cca8cc6 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -26,8 +26,6 @@ BBFILE_PRIORITY_openembedded-layer = "5"
 # only activates content when identified layers are present,
 # to ensure yocto compatibility check pass
 BBFILES_DYNAMIC += " \
-    clang-layer:${LAYERDIR}/dynamic-layers/clang-layer/recipes-*/*/*.bb \
-    clang-layer:${LAYERDIR}/dynamic-layers/clang-layer/recipes-*/*/*.bbappend \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bbappend \
     multimedia-layer:${LAYERDIR}/dynamic-layers/multimedia-layer/recipes-*/*/*.bb \
-- 
2.34.1


