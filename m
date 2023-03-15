Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1063CC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 02:22:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2902.1678846968217576116
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Mar 2023 19:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2438fe3029=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32F2GSO1004939
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 02:22:47 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pb2as047j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 02:22:47 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 14 Mar 2023 19:22:46 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 14 Mar 2023 19:22:45 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][kirkstone][PATCH] mariadb: Upgrade to 10.7.8
Date: Wed, 15 Mar 2023 10:22:44 +0800
Message-ID: <20230315022244.2078648-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: i6TJID0wJGROAB2PtZD26uHYWV9bMlTp
X-Proofpoint-ORIG-GUID: i6TJID0wJGROAB2PtZD26uHYWV9bMlTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_16,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=907 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2302240000
 definitions=main-2303150019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 02:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101527

From: Mingli Yu <mingli.yu@windriver.com>

Upgrade mariadb to 10.7.8 [1].

[1] https://mariadb.com/kb/en/mariadb-10-7-8-release-notes

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../{mariadb-native_10.7.7.bb => mariadb-native_10.7.8.bb}      | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
 .../recipes-dbs/mysql/{mariadb_10.7.7.bb => mariadb_10.7.8.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.7.bb => mariadb-native_10.7.8.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.7.bb => mariadb_10.7.8.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.7.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.8.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.7.7.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.7.8.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 097766e79..83dfcf057 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -24,7 +24,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 
-SRC_URI[sha256sum] = "fd2f9fa3f135823c1626c9700e3bd736b829bfc09f61f5557d7313a7c9e02c29"
+SRC_URI[sha256sum] = "f8c69d9080d85eafb3e3a84837bfa566a7f5527a8af6f9a081429d4de0de4778"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.7.7.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.7.8.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.7.7.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.7.8.bb
-- 
2.25.1


