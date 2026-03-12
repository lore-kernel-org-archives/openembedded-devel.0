Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCAE103E301
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:24:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18352.1773311055494047339
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oo3odBfF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7531ba8309=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C7XghB3253345
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=S7WqX4yIvAqyauQLCmqz
	jaleHpTOr8eqPqr3UVk47pE=; b=oo3odBfFt172e+Q9TcZzN3WUwOlbnziQn26L
	N71PylCDH59F7OnO4Baq/5rDyqkDs8jT3AG4WXVGy5YhirzAt/wsXoXMEqsXhqtj
	L6stP1Izqt2iM66fS9uqazPnlZarbObIU5fEbRAIhGHO2UEurq4IKB8bhYhd/I26
	oUGLs47jn8CKGzAJmkDbdZ7cbwDScATmThly7pf4/cxvsDswVViOkosmENv1E2PG
	KayzV5MUKE5EiYPCxHHNOdH0cS1+xai7N3ZQ3SfER0B+Kp+fqlwsZ33bHfzqW/ZN
	dS0TWzpbhGrdgCVnWAumIZj1Su5XUOV3Sr52VuJYnykpa9GDig==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh78gjxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:24:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 12 Mar 2026 03:24:12 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 12 Mar 2026 03:24:12 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-redis: Upgrade 5.2.1->7.3.0
Date: Thu, 12 Mar 2026 18:24:11 +0800
Message-ID: <20260312102411.128382-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ALvEU0hV c=1 sm=1 tr=0 ts=69b2944e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=kw_7P3TwAAAA:20 a=t7CeM3EgAAAA:8
 a=6Pd0Uv8he5BPI44TX3sA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA4MSBTYWx0ZWRfXzJGMFG8stIwr
 I9ZxVfj1GOZ7zr/psbIok8EqQ2Wy7BtCQIg9wAIOf8uebLcPs6I604jVBlmLazWvvDKHKAO1Kfp
 rcz3/xCC//n02hTQBpzzYhMJbAM5lnDtun0C+8NQ7u/+rHGAC1EnE5ckR3VP7gzVJNNZqwmA/um
 sRSr9d0DvgxwdwHUmBfw7rIFqjpnvOPhjsqS2DJ4lI7Zvz5PP3bqnqiqSpB85W2PN9wAy+6nvWn
 f8fsb2rkI1rvPNcK4D4Y01ueK8mg45XAnRXaqKgjXMt97jsWSMjEo1/wQGf2Ob8RBAsLJoAdxGk
 LGBXIWfI5Z1AZzSLtA572MTjjsBMeOhGg0PJvdX/eXtpwd3F5j4zBBDQCrJG5EaUZ2Ke+kmQhbx
 x3lYQk4u9Yz5/Wy4GzOcD4NWN/P+uoY2ipYH7groPtZUPs+VJ8YjJbxZfmeP4nisDoGzByHQk55
 yLD1U2GaQ8bAId6XwPA==
X-Proofpoint-ORIG-GUID: Jpk7gzlXpSJRSD-ADxwQ6WOGne7R_4D_
X-Proofpoint-GUID: Jpk7gzlXpSJRSD-ADxwQ6WOGne7R_4D_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1011 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125100

From: Jiaying Song <jiaying.song.cn@windriver.com>

Switch build system from setuptools3 to python_hatchling

Changelog:
https://github.com/redis/redis-py/releases

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../python/{python3-redis_5.2.1.bb => python3-redis_7.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-redis_5.2.1.bb => python3-redis_7.3.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb b/meta-python/recipes-devtools/python/python3-redis_7.3.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
rename to meta-python/recipes-devtools/python/python3-redis_7.3.0.bb
index ba214f5869..861221d3ee 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_7.3.0.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 # Prefix archive to avoid clashing with the main redis archives
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
-SRC_URI[sha256sum] = "16f2e22dff21d5125e8481515e386711a34cbec50f0e44413dd7d9c060a54e0f"
+SRC_URI[sha256sum] = "4d1b768aafcf41b01022410b3cc4f15a07d9b3d6fe0c66fc967da2c88e551034"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.34.1


