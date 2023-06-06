Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089DCC77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 17:47:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3405.1686073626194980251
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 10:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ghJu64tF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55212fcb5a=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356Ea39m008684
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Jun 2023 17:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=4iG7LwMnuCliulyvJLXJrLvzD4Me0EzFhcN98UltAP0=;
 b=ghJu64tFxwkLVrmo6ChrmGoKXJoJ3N2G78shsu7ddWorCEDi1gIm83cXagnO9wo5TA+m
 kGy71G13f2d8CCAnWMtEVUJR8LPE1RUCZWVFqvMUiMzlRadadlPu/j8uUbFZ910mgLVU
 3HUN5djyr40yZyvKfxdQU4YRJRXhlfthgsus3DQbXGUQ9pzA20DitlaeSAgCJHHGYkCT
 NFhaSNTY6LLy/52qbUhBdWFp2I+G2FWOPvu0SIKZ0c54ycuoKrYU4xzk00iFKHgdltKc
 d/EPc+rQphteWuXFXkHEsWQJHkAbaW6lWF2h7z4t/5Ehm2b6D6O45OpsTOLQsoUhAEse cA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qytr0tsp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 17:47:05 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 10:47:03 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 10:47:03 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [V2][meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: toggle (continuous)'
Date: Tue, 6 Jun 2023 10:47:03 -0700
Message-ID: <20230606174703.1061623-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: V3VmFZLt0bBxbs_VBJPQvgD20_NSN73A
X-Proofpoint-ORIG-GUID: V3VmFZLt0bBxbs_VBJPQvgD20_NSN73A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_12,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=687
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060153
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 17:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103152

From: Joe Slater <joe.slater@windriver.com>

Look for level transitions when testing toggling
values because using fixed delays to assume value
changes is not reliable.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../gpio-tools-test-bats-modify.patch         | 67 +++++++++++++++++++
 .../libgpiod/libgpiod_2.0.1.bb                |  2 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch
new file mode 100644
index 0000000000..6ad43aa041
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch
@@ -0,0 +1,67 @@
+From 4fc48e743de52562cd61de6cd74181392e4e75b7 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Fri, 19 May 2023 08:46:47 -0700
+Subject: [libgpiod][PATCH v4] gpio-tools-test.bats: modify delays in
+ toggle test
+
+The test "gpioset: toggle (continuous)" uses fixed delays to test
+toggling values.  This is not reliable, so we switch to looking
+for transitions from one value to another.
+
+We wait for a transition up to 1.5 seconds.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+Upstream-status: accepted
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ tools/gpio-tools-test.bats | 21 ++++++++++++++++-----
+ 1 file changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
+index c83ca7d..929c35a 100755
+--- a/tools/gpio-tools-test.bats
++++ b/tools/gpio-tools-test.bats
+@@ -141,6 +141,20 @@ gpiosim_check_value() {
+ 	[ "$VAL" = "$EXPECTED" ]
+ }
+ 
++gpiosim_wait_value() {
++	local OFFSET=$2
++	local EXPECTED=$3
++	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
++	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
++	local PORT=$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
++
++	for i in {1..15}; do
++		[ "$(<$PORT)" = "$EXPECTED" ] && return
++		sleep 0.1
++	done
++	return 1
++}
++
+ gpiosim_cleanup() {
+ 	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
+ 	do
+@@ -1567,15 +1581,12 @@ request_release_line() {
+ 	gpiosim_check_value sim0 4 0
+ 	gpiosim_check_value sim0 7 0
+ 
+-	sleep 1
+-
+-	gpiosim_check_value sim0 1 0
++	gpiosim_wait_value sim0 1 0
+ 	gpiosim_check_value sim0 4 1
+ 	gpiosim_check_value sim0 7 1
+ 
+-	sleep 1
+ 
+-	gpiosim_check_value sim0 1 1
++	gpiosim_wait_value sim0 1 1
+ 	gpiosim_check_value sim0 4 0
+ 	gpiosim_check_value sim0 7 0
+ }
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
index 337554cd89..6958f2d841 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = " \
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
 
+SRC_URI += "file://gpio-tools-test-bats-modify.patch"
+
 SRC_URI[sha256sum] = "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b0c1d05ec57a38392"
 
 # Enable all project features for ptest
-- 
2.25.1


