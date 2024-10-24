Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43886D0BB4D
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 01:47:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4911.1729734469011120372
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 18:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0027dd2be4=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O1aKhl009926
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 01:47:48 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42f2g40pd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 01:47:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 18:47:46 -0700
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 18:47:46 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] postgresql.inc: fix do_package_qa error
Date: Thu, 24 Oct 2024 09:47:45 +0800
Message-ID: <20241024014745.1793132-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: KVaKS5qSu5DzDwaexeWnKebFdhQ9pV3S
X-Proofpoint-GUID: KVaKS5qSu5DzDwaexeWnKebFdhQ9pV3S
X-Authority-Analysis: v=2.4 cv=eoKNzZpX c=1 sm=1 tr=0 ts=6719a744 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=UMVHE7PydMsLi04fNgEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_01,2024-10-23_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 mlxscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410240010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 01:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113156

From: Changqing Li <changqing.li@windriver.com>

Replacing P with BP to fix following do_package_qa error for lib32-postgresql:
ERROR: QA Issue: File /usr/src/debug/lib32-postgresql/16.4/src/pl/plperl/SPI.c in package lib32-postgresql-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 4fc2e47b3..fb3bca272 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -242,7 +242,7 @@ postgresql_fix_sources () {
 	for f in ${PKGD}${TARGET_DBGSRC_DIR}/src/pl/plperl/Util.c \
 			${PKGD}${TARGET_DBGSRC_DIR}/src/pl/plperl/SPI.c; do
 		if [ -e $f ]; then
-			sed -i -e 's#${B}/../${P}#${TARGET_DBGSRC_DIR}#g' $f
+			sed -i -e 's#${B}/../${BP}#${TARGET_DBGSRC_DIR}#g' $f
 		fi
 	done
 }
-- 
2.25.1


