Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8220BC35FF2
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 01:00:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.26666.1741741201116643010
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 18:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5166cf4169=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BKg1rO029022
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:59:59 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45au8yg9dc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:59:58 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Mar 2025 17:59:58 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Mar 2025 17:59:57 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 6/9] rocksdb: upgrade 9.0.0 -> 9.10.0
Date: Wed, 12 Mar 2025 08:59:49 +0800
Message-ID: <20250312005952.1469547-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312005952.1469547-1-changqing.li@windriver.com>
References: <20250312005952.1469547-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=TsPmhCXh c=1 sm=1 tr=0 ts=67d0dc8e cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=avgCGIjf26VDCFP7Ij8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: qphQcq2DWqLv_MPaofUBkd9y3roly61-
X-Proofpoint-ORIG-GUID: qphQcq2DWqLv_MPaofUBkd9y3roly61-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503120005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 01:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115902

From: Changqing Li <changqing.li@windriver.com>

Upgrade to the latest version, refer:
https://github.com/facebook/rocksdb/releases

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../rocksdb/{rocksdb_9.0.0.bb => rocksdb_9.10.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/rocksdb/{rocksdb_9.0.0.bb => rocksdb_9.10.0.bb} (97%)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
similarity index 97%
rename from meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
rename to meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
index 57d163bfc7..1e36d1fc4f 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "f4441966592636253fd5ab0bb9ed44fc2697fc53"
-SRCBRANCH = "9.0.fb"
+SRCREV = "ae8fb3e5000e46d8d4c9dbf3a36019c0aaceebff"
+SRCBRANCH = "9.10.fb"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=https \
            file://0001-cmake-Add-check-for-atomic-support.patch \
-- 
2.34.1


