Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D291EC54E41
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 02:42:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14363.1709779362178942805
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 18:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HbXYLhvj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3796958646=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42720Z8s028441
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Mar 2024 02:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=4UQBa
	u+xE8FRdQ/IVetV7eprD5ODVHLyb/b28x3LeRs=; b=HbXYLhvj+3gUr2pi/F5p1
	e43aQpb4MO3RcB5OQU+cITYxQLUOPh3vLRppsiu8cVQw8QulaiBBmHiAsvW7qBas
	3ws+2vhge5DC8ShgF6HODtZXIpaoGb06t19C+x6AeC6i7uvKz89KGNRIvoW8DnOH
	PQWsQjXmXnafn8t43RN9ZHaMF+w26JF7tGM2yeC0u+UyGdDr0Z1if5IhmMtvesDW
	TJCJDrZ+tWEAez6H9Y8SWtX8rSK0ywKnqPUJG38gk0vAkHvVH3eBlTir3iM2fNrX
	CgL6KvbK7NiXCCoKIf/NQVRQ4Jnm+kpzCAjWGM7bvzZtP053wI6ZueLZl5fJqhjJ
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36cmpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 02:42:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 18:42:40 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 18:42:39 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gosu: Upgrade to 1.17
Date: Thu, 7 Mar 2024 10:42:38 +0800
Message-ID: <20240307024238.1467314-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: t0PgEhVfdyoZiJ5KdmWjGHfPyYEGZZFT
X-Proofpoint-GUID: t0PgEhVfdyoZiJ5KdmWjGHfPyYEGZZFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_14,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 02:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109186

From: Mingli Yu <mingli.yu@windriver.com>

The new version is built on github.com/moby/sys/user 0.1.0 [1].

[1] https://github.com/tianon/gosu/releases/tag/1.17

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../gosu/{gosu_1.16.bb => gosu_1.17.bb}             | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/gosu/{gosu_1.16.bb => gosu_1.17.bb} (59%)

diff --git a/meta-oe/recipes-support/gosu/gosu_1.16.bb b/meta-oe/recipes-support/gosu/gosu_1.17.bb
similarity index 59%
rename from meta-oe/recipes-support/gosu/gosu_1.16.bb
rename to meta-oe/recipes-support/gosu/gosu_1.17.bb
index 70c7275bc..a29d6bce4 100644
--- a/meta-oe/recipes-support/gosu/gosu_1.16.bb
+++ b/meta-oe/recipes-support/gosu/gosu_1.17.bb
@@ -6,13 +6,16 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=3b83ef96387f14655fc854dd
 
 GO_IMPORT = "github.com/tianon/gosu"
 SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https \
-           git://github.com/opencontainers/runc;name=runc;destsuffix=${S}/src/github.com/opencontainers/runc;branch=main;protocol=https \
+           git://github.com/moby/sys;name=user;destsuffix=${S}/src/github.com/moby/sys;branch=main;protocol=https \
+           git://github.com/golang/sys;name=sys;destsuffix=${S}/src/golang.org/x/sys;branch=master;protocol=https \
 "
-SRCREV = "0e7347714352cd7f2e5edc9d2cf838d9934e6036"
-#v1.1.0
-SRCREV_runc = "067aaf8548d78269dcb2c13b856775e27c410f9c"
+SRCREV = "0d1847490b448a17eb347e5e357f2c0478df87ad"
+#v0.1.0
+SRCREV_user = "c0711cde08c8fa33857a2c28721659267f49b5e2"
+#v0.1.0
+SRCREV_sys = "95e765b1cc43ac521bd4fd501e00774e34401449"
 
-SRCREV_FORMAT .= "_runc"
+SRCREV_FORMAT .= "_user_sys"
 
 inherit go
 
-- 
2.25.1


