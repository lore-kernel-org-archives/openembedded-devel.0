Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E4AC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 14:26:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17894.1749047171114738192
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 07:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=825020491d=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554BFuox004226
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Jun 2025 14:26:10 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t2neb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 14:26:10 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 07:26:06 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/2] c-ares: upgrade 1.34.3 -> 1.34.4
Date: Wed, 4 Jun 2025 19:55:40 +0530
Message-ID: <20250604142541.1251029-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: bPBkOmFiiD-1uNyicu55d7UwZpcMjd2D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMCBTYWx0ZWRfX2xC+/m8zJcJQ UoBn1vHba76D6Vzo8lkrZdx0im/vLVb+fcm4m9OP5wnEXVFv562lwo3wNUZ8qAHacBO3dZ/378k +GtFMoiCf/ZV6yULe0vnYHpS6YrbyL/ON95sD6ElWmB0iFQ5xxkxCIJZBBSOalH/w6fspG13Sev
 9IXRQiCP0Af7lnklAVJPm4InpUzRxrog3Ypi3OCmS41OBaAxCi8ICq7b4elty7PpCIr7TwgTetW ljU/9n7bNCW2NwankYCfvmaSHYKlKpDwoD7Hw/NcGMX9rMZqLj+zFfN5Bc+D7pq4lhhtDJVuCMH xD18cZKflbi2VQv0AZHnIhRtgWwRqL5kjum4FmWn05kpslyLMJHJEXG0YsvSuZYKx6b8Chv9EWL
 yL9OJenCKYBwupG7xRBewWssjnPhIrLOSfYimNLuEfM7iEMC/6XjcBNsSdRr1MLKfHrB201a
X-Proofpoint-GUID: bPBkOmFiiD-1uNyicu55d7UwZpcMjd2D
X-Authority-Analysis: v=2.4 cv=Q4DS452a c=1 sm=1 tr=0 ts=68405782 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=d6DZ1Rd_tSB6Bevis2gA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 14:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117740

From: Jason Schonberg <schonm@gmail.com>

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.4

Changes:

    QNX Port: Port to QNX 8, add primary config reading support, add CI build. PR #934, PR #937, PR #938

Bugfixes:

    Empty TXT records were not being preserved. PR #922
    docs: update deprecation notices for ares_create_query() and ares_mkquery(). PR #910
    license: some files weren't properly updated. PR #920
    Fix bind local device regression from 1.34.0. PR #929, PR #931, PR #935
    CMake: set policy version to prevent deprecation warnings. PR #932
    CMake: shared and static library names should be the same on unix platforms like autotools uses. PR #933
    Update to latest autoconf archive macros for enhanced system compatibility. PR #936

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../c-ares/{c-ares_1.34.3.bb => c-ares_1.34.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.3.bb => c-ares_1.34.4.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.3.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.4.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.3.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.4.bb
index c02bdbcc5c..1fee769f25 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.3.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "26e1f7771da23e42a18fdf1e58912a396629e53a2ac71b130af93bbcfb90adbe"
+SRC_URI[sha256sum] = "fa38dbed659ee4cc5a32df5e27deda575fa6852c79a72ba1af85de35a6ae222f"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.40.0


