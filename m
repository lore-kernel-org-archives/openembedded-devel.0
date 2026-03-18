Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE04FCD0BA
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:56:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7702.1773813391371501924
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jTbZUXN7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7537d179d4=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I4QQ0N2901035;
	Wed, 18 Mar 2026 05:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=M0pXIFBSc
	MLBojxRoN/arkepSVlXg2cfFADMNdhGpgs=; b=jTbZUXN7LEybpvJLCcUzheZMm
	SKUWeUuAJRGamAYM8MGhvzCTa5M9pZf+BMC/vj1Mz4J9QMOzxzQoyhIn4k47lMXG
	A/xa/hItJTKPKmPY3O0WXW4HzCgdFk++/ujGEG7ajQWeWi/TO0vQ+oNbDRvzak0z
	gg8bSoza54i1OvupnuarxK8JIvGZl3FS++wkHuvGGwccRtgNVfdSQKENjaGb8OkP
	5EPrQO5cH1ygoAGL6dEJke1MKGCMwCZ2QVt5BCdFZg70BL004HYCFa04yE2OyfJu
	JMGxPB13GI045k55XvNr7JVa5J5v7meaZOzBD6sVqiKaF9jsjT6nwsP2wkBdQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cy9anrwb2-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Mar 2026 05:56:30 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 17 Mar 2026 22:56:29 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 17 Mar 2026 22:56:28 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-redis: upgrade 5.3.1->7.3.0
Date: Wed, 18 Mar 2026 13:56:27 +0800
Message-ID: <20260318055627.729328-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IrMTsb/g c=1 sm=1 tr=0 ts=69ba3e8e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=kw_7P3TwAAAA:20 a=t7CeM3EgAAAA:8
 a=6Pd0Uv8he5BPI44TX3sA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: lxIDc4kRR34_V09-Tc6k59m3FCCWurYj
X-Proofpoint-GUID: lxIDc4kRR34_V09-Tc6k59m3FCCWurYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA0OCBTYWx0ZWRfX9Oju2rOY/CC7
 8vvbo20nAvgCYph9R4xvvsvAbrn3quVxtGXUSzwGh0a/QJ3RE34k9qHz5WwTn54GxNLz+YMoMBO
 H7kftFraZNKgO8aa8NUzT3BOKS7bSG3RHl+X5YOWmv4GpO2P5Be5ip/S8W2LQzGuYoHPyGgObJh
 h+fdIyScS9t4cF93Fd9NdkDdl7xWzk9AG1I+nF8M+pIw/+/4y2Y1Hm7AHBF0ewJcDd9t/G3GbDg
 4TutZ1qmTS5SkI9BBhwSiTXA+ozfBr52Khh7X0zrhcVJaRhsVyk9E8MK5moVzczJTNNW4JKucom
 VRethpZdHF1sEiDvSV9ALHE6WYiNIxhbH2DzVVzrYXTrg8YyGT9jy7IUowKcj5/koehlyNj98LB
 0kJM6sLT/7/Hjh3fLnSFJg54Z+Qtz9qXJWiQioexb6szzPSacHmVEQhN6h14uhdpXVVrqv+brgy
 wc0Kznfm/ky4hnmQjrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125348

From: Jiaying Song <jiaying.song.cn@windriver.com>

Switch build system from setuptools3 to python_hatchling

Changelog:
https://github.com/redis/redis-py/releases

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../python/{python3-redis_5.3.1.bb => python3-redis_7.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-redis_5.3.1.bb => python3-redis_7.3.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.3.1.bb b/meta-python/recipes-devtools/python/python3-redis_7.3.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-redis_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-redis_7.3.0.bb
index d9ec47c0c7..861221d3ee 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_7.3.0.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 # Prefix archive to avoid clashing with the main redis archives
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
-SRC_URI[sha256sum] = "ca49577a531ea64039b5a36db3d6cd1a0c7a60c34124d46924a45b956e8cf14c"
+SRC_URI[sha256sum] = "4d1b768aafcf41b01022410b3cc4f15a07d9b3d6fe0c66fc967da2c88e551034"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.34.1


