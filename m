Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487D7C021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 02:48:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6401.1739328505205421961
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 18:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41388b9df6=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C0jil2028769
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 02:48:24 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwx1h8jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 02:48:24 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Feb 2025 18:48:22 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Feb 2025 18:48:22 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [meta-python][kirkstone][PATCH] python3-future: upgrade 0.18.2 -> 0.18.3
Date: Wed, 12 Feb 2025 10:48:21 +0800
Message-ID: <20250212024821.1375248-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VPo6tRiplMpRIlS-SB4zj1epBZvkdA8_
X-Authority-Analysis: v=2.4 cv=BvNnwZX5 c=1 sm=1 tr=0 ts=67ac0bf8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=VZ_QafluAAAA:8 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=izldAn20l6x6l0RTt2oA:9 a=s0axNcikRprfSCK_H-oi:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: VPo6tRiplMpRIlS-SB4zj1epBZvkdA8_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_10,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502120020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 02:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115434

From: Wang Mingyu <wangmy@fujitsu.com>

Full changelog:
https://github.com/PythonCharmers/python-future/releases

(cherry-picked from a10bda8c873e66f0d895cf8065cbc076b2055655)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../{python3-future_0.18.2.bb => python3-future_0.18.3.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-future_0.18.2.bb => python3-future_0.18.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-future_0.18.2.bb b/meta-python/recipes-devtools/python/python3-future_0.18.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-future_0.18.2.bb
rename to meta-python/recipes-devtools/python/python3-future_0.18.3.bb
index 90d1661d40..e4a4b5c197 100644
--- a/meta-python/recipes-devtools/python/python3-future_0.18.2.bb
+++ b/meta-python/recipes-devtools/python/python3-future_0.18.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://python-future.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a253924061f8ecc41ad7a2ba1560e8e7"
 
-SRC_URI[md5sum] = "e4579c836b9c025872efe230f6270349"
-SRC_URI[sha256sum] = "b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d"
+SRC_URI[sha256sum] = "34a17436ed1e96697a86f9de3d15a3b0be01d8bc8de9c1dffd59fb8234ed5307"
 
 PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d"
 
-- 
2.34.1


