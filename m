Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BB5C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 07:50:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3550.1677052199215330036
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 23:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14178debc1=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M70JkB021544
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 23:49:58 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6ueeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 23:49:58 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Tue, 21 Feb 2023 23:49:57 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 21 Feb 2023 23:49:57 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: Upgrade to 10.11.2
Date: Wed, 22 Feb 2023 15:49:56 +0800
Message-ID: <20230222074956.1594928-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: w_fiuou7jloCV3-O1LpGQJBOEYUL1rjI
X-Proofpoint-GUID: w_fiuou7jloCV3-O1LpGQJBOEYUL1rjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_04,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=975 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302220066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 07:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101200

From: Mingli Yu <mingli.yu@windriver.com>

Upgrade mariadb to 10.11.2 [1].

[1] https://mariadb.com/kb/en/mariadb-10-11-2-release-notes

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../{mariadb-native_10.11.1.bb => mariadb-native_10.11.2.bb}    | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
 .../mysql/{mariadb_10.11.1.bb => mariadb_10.11.2.bb}            | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.1.bb => mariadb-native_10.11.2.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.1.bb => mariadb_10.11.2.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.1.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.2.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.1.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.2.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 1a47d9110..57930dae3 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
-SRC_URI[sha256sum] = "ffacf84e74daf249ad64b9573d79a4e882f66b004614f8b33bfcb14a8e25da1d"
+SRC_URI[sha256sum] = "1c89dee0caed0f68bc2a1d203eb98a123150e6a179f6ee0f1fc0ba3f08dc71dc"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.1.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.2.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.1.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.2.bb
-- 
2.25.1


