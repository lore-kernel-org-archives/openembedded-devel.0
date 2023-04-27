Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897C9C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 08:27:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15429.1682584023197622372
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 01:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SI7mIgHB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3481d59eab=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33R7SA22015054
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 08:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=Kqk+vFrxOi9PYixIxYyAO3bCeFWfDBZljNU8GQWct+o=;
 b=SI7mIgHBlIKG7UHmaAKRXBLgC6oOIUOZ3mApVPgY0Q4L+AmTXq9tbQGOXSa04iaO/GDI
 1Flx/oGsijh4XDdl0/1D31mwyHhJB9r6L+s5P3nn4a2/IkXKTHW4Ir64ixA00fKYVdca
 Djr+qDmiYvc2lHd2CXKAuMhixjvQJI9lyhKlNlv/kXGLYfuRkaI9PLiM0KfEiFrJ6h7b
 /qUfU3cvTcANh4+4jgUAnjJ8rt9vUXxXzRUVM4N9yfRl51itYPjOYEWuaS7Lf2s/IBpe
 +MrxNml6GvWurvuYYe3UTooNWylC4Iwd06J/kRONURD+GC1A7WxfiKh/xQWo3pOPXJJP sQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q44t3wfxa-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 08:27:02 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 01:26:58 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>, <yogita.urade@windriver.com>
Subject: [oe][meta-oe][mickledore][PATCH 1/1] dlt-daemon: fix CVE-2023-26257
Date: Thu, 27 Apr 2023 08:26:40 +0000
Message-ID: <20230427082640.3130633-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 6Ijt8JqgxNJT11wvG0BmSZ3m77u7_1UH
X-Proofpoint-ORIG-GUID: 6Ijt8JqgxNJT11wvG0BmSZ3m77u7_1UH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_05,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 08:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102207

An issue was discovered in the Connected Vehicle Systems Alliance (COVESA; formerly GENIVI)
dlt-daemon through 2.18.8. Dynamic memory is not released after
it is allocated in dlt-control-common.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-26257
https://github.com/COVESA/dlt-daemon/issues/440

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../dlt-daemon/0001-Fix-memory-leak.patch     | 35 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.8.bb           |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memory-leak.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memory-leak.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memory-leak.patch
new file mode 100644
index 0000000000..b0eb460031
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memory-leak.patch
@@ -0,0 +1,35 @@
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
+2.40.0
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
index aa5ef46a9d..cfbe0ff60d 100644
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
2.35.5


