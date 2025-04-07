Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A605C369A3
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 12:16:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45314.1744028153892472629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 05:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61924415ef=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537Aax3f004956
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Apr 2025 12:15:53 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8j8ya-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 12:15:52 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 7 Apr 2025 05:15:50 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 7 Apr 2025 05:15:49 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: upgrade 11.4.4 -> 11.4.5
Date: Mon, 7 Apr 2025 20:15:47 +0800
Message-ID: <20250407121547.2516285-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407121547.2516285-1-changqing.li@windriver.com>
References: <20250407121547.2516285-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -q2Yt4barX0WU9IwWML9LCcUjURsy-uj
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f3c1f8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=hkEv4HZQAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=N5_ppcHcDyRgGlnZ7zMA:9 a=NA03pvyaApPJG5valX87:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -q2Yt4barX0WU9IwWML9LCcUjURsy-uj
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=885 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 12:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116666

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{mariadb-native_11.4.4.bb => mariadb-native_11.4.5.bb}      | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
 .../recipes-dbs/mysql/{mariadb_11.4.4.bb => mariadb_11.4.5.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.4.bb => mariadb-native_11.4.5.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.4.bb => mariadb_11.4.5.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.5.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.5.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 66b46d2afd..f704ff6dec 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
           "
-SRC_URI[sha256sum] = "96fbd2e6e93fb7e8b373eea75d85b6fea57c0e111a02090cbbefed52599dc77b"
+SRC_URI[sha256sum] = "ff6595f8c482f9921e39b97fa1122377a69f0dcbd92553c6b9032cbf0e9b5354"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.5.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.5.bb
-- 
2.34.1


