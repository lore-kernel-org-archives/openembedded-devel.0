Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C0DC77B70
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 05:57:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2632.1681451876102099077
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Apr 2023 22:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=X5Yca97w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3468de62af=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33E4wLNN020441
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 05:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=30oMo01j6PIXkX32SmzzHbF7XWDg24iUW5YEt3Dhe2Q=;
 b=X5Yca97wwVWaVpSjs20nPCvkGPlTWH7bg/vzj2gwCtcb5Uzyr4mtS2zLaubG5GTWYc+c
 LtQ8xwx4qVjB9I74Xc6pU3YHvixRAvrUPB2zJOxGTPQOgcIGl2lMBVEsVs6rnqQFjhQI
 8wRlEkuzRF4xMyNvlOK0qucm7a5ImEI97Io1rtTdGrqJs+BAwL6ggzAai57hg3zGzojX
 4/ndk8ytD5rVjEsLztWEEmQFGlln/FJ/g0zgwu4RreHlrxFky4O3b6wfaERvdCne9JKj
 CEWHqvy4ZKIJQ1SFBJ2sho8xhyuP1Kzja6p5g+1zrVPRBsRU/DVfWHILDaiwJ9Wyzp2V ZQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7kfhdkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 05:57:55 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 22:57:52 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>, <yogita.urade@windriver.com>
Subject: [oe][meta-oe][PATCH 1/1] dlt-daemon: fix CVE-2023-26257
Date: Fri, 14 Apr 2023 05:57:35 +0000
Message-ID: <20230414055735.2891145-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: mYhdEydeCKaPVGjxLeA1Any4W9zw0eZQ
X-Proofpoint-GUID: mYhdEydeCKaPVGjxLeA1Any4W9zw0eZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_02,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 05:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102085

An issue was discovered in the Connected Vehicle Systems Alliance (COVESA; formerly GENIVI)
dlt-daemon through 2.18.8. Dynamic memory is not released after
it is allocated in dlt-control-common.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-26257
https://github.com/COVESA/dlt-daemon/issues/440

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../dlt-daemon/0001-Fix-memory-leak.patch     | 34 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.8.bb           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memory-leak.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memory-leak.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memory-leak.patch
new file mode 100644
index 000000000..72e3b9802
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memory-leak.patch
@@ -0,0 +1,34 @@
+From b6149e203f919c899fefc702a17fbb78bdec3700 Mon Sep 17 00:00:00 2001
+From: Le Van Khanh <Khanh.LeVan@vn.bosch.com>
+Date: Thu, 9 Feb 2023 03:17:13 -0500
+Subject: [PATCH] Fix memory leak
+
+Free the ecuid_conf in case of memory alllocated
+
+CVE: CVE-2023-26257
+
+Upstream-Status: Backport
+[https://github.com/COVESA/dlt-daemon/pull/441/commits/b6149e203f919c899fefc702a17fbb78bdec3700]
+
+Signed-off-by: Le Van Khanh <Khanh.LeVan@vn.bosch.com>
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/console/dlt-control-common.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/console/dlt-control-common.c b/src/console/dlt-control-common.c
+index abcaf92..64951c1 100644
+--- a/src/console/dlt-control-common.c
++++ b/src/console/dlt-control-common.c
+@@ -124,6 +124,8 @@ void set_ecuid(char *ecuid)
+             if (dlt_parse_config_param("ECUId", &ecuid_conf) == 0) {
+                 memset(local_ecuid, 0, DLT_CTRL_ECUID_LEN);
+                 strncpy(local_ecuid, ecuid_conf, DLT_CTRL_ECUID_LEN);
++                if (ecuid_conf !=NULL)
++                    free(ecuid_conf);
+                 local_ecuid[DLT_CTRL_ECUID_LEN - 1] = '\0';
+             }
+             else {
+--
+2.34.1
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
index aa5ef46a9..cfbe0ff60 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https;branch=master \
            file://0004-Modify-systemd-config-directory.patch \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            file://0001-dlt-system-Fix-buffer-overflow-detection-on-32bit-ta.patch \
+           file://0001-Fix-memory-leak.patch \
            "
 SRCREV = "6a3bd901d825c7206797e36ea98e10a218f5aad2"
 
-- 
2.34.1


