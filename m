Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC560C7EE2E
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 20:01:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12846.1684872107368408660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 13:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s5z4/2Rv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=45071d87e4=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34NDlFKM014586
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 20:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=u3DEVv7pU8oIU7HOyojWWCvnc7uyAmXD5eMmOwa9ymw=;
 b=s5z4/2RvJHZ7pt+jWr1QLTL3o5mZ5yQzwJ30MY7ocrgMR0t4hjUN635TIfSwJ1eow6/b
 C7+aNW5oFGlvEecZP72xDmkPARpt+frgf7VyPy4FO/sbAyZEPxG1LVnMcuHBT1lJR1xQ
 T4DepuovMFJ5GF58WIt9j+AwRxu7SDrnIFZmn++KGQFojV55Sy/YzKLsFxmz+NuKQx/g
 5FBq5gP6BXVmE8fpzM5k+GnwKoLOX2Q900XcAP0MZiB+piqMdjt5SQbHqDdhKqj8cene
 V89sY6b7F2I9JNKGmuaYiP0TomsFeYvFADqTw1cqxe/mfgWxdDKb2qJB8TuyC8FBlqUy Wg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpkn1k817-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 20:01:46 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 13:01:45 -0700
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 13:01:45 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [mickledore][meta-oe][PATCH 1/1] libgpiod: modify ptest value toggle test
Date: Tue, 23 May 2023 13:01:44 -0700
Message-ID: <20230523200144.560946-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LmS4IgVLyJa9lAq1T8pJ__J-PfptbYj3
X-Proofpoint-GUID: LmS4IgVLyJa9lAq1T8pJ__J-PfptbYj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_12,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=812 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305230161
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 20:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102742

From: Joe Slater <joe.slater@windriver.com>

The test "gpioset: toggle (continuous)" is modified to
sync with toggles instead of assuming a delay.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...-ptest-modify-delays-in-toggle-tests.patch | 58 +++++++++++++++++++
 .../recipes-support/libgpiod/libgpiod_2.0.bb  |  2 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.0/0001-ptest-modify-delays-in-toggle-tests.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.0/0001-ptest-modify-delays-in-toggle-tests.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.0/0001-ptest-modify-delays-in-toggle-tests.patch
new file mode 100644
index 0000000000..359b4a2afa
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.0/0001-ptest-modify-delays-in-toggle-tests.patch
@@ -0,0 +1,58 @@
+From b73a79245ac0fa36b15bf3308e4ed008793ff15c Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Fri, 19 May 2023 08:46:47 -0700
+Subject: [PATCH] ptest: modify delays in toggle tests
+
+Try to test toggling values at their midpoints.
+
+Upstream-Status: pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ tools/gpio-tools-test.bats | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- libgpiod-2.0.orig/tools/gpio-tools-test.bats
++++ libgpiod-2.0/tools/gpio-tools-test.bats
+@@ -141,6 +141,20 @@ gpiosim_check_value() {
+ 	[ "$VAL" = "$EXPECTED" ]
+ }
+ 
++gpiosim_wait_value() {
++	local OFFSET=$2
++	local EXPECTED=$3
++	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
++	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
++
++	for i in {1..10} ; do
++		VAL=$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
++		[ "$VAL" = "$EXPECTED" ] && return
++		sleep 0.1
++	done
++	return 1
++}
++
+ gpiosim_cleanup() {
+ 	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
+ 	do
+@@ -1567,15 +1581,15 @@ request_release_line() {
+ 	gpiosim_check_value sim0 4 0
+ 	gpiosim_check_value sim0 7 0
+ 
+-	sleep 1
+-
+-	gpiosim_check_value sim0 1 0
++	# sleeping fixed amounts can be unreliable, so we
++	# sync to the toggles
++	#
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
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
index 179fe170e2..25463e9a87 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = " \
     file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
 "
 
+SRC_URI += "file://0001-ptest-modify-delays-in-toggle-tests.patch"
+
 SRC_URI[sha256sum] = "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9889b9268cce2dd07"
 
 S = "${WORKDIR}/libgpiod-2.0"
-- 
2.25.1


