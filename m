Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4DBC77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 18:11:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1272.1684951894296186125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 11:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gAA8Jptj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=45086c3b54=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OH8loK001211
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 18:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=sjLD9ohcYrSpxWeXNAptI6nbyXOtCVSgpYWorZPOwKQ=;
 b=gAA8Jptj1CX/dzAjRiG+wgXWGzrHwECRNfmvWsRH7rXP7TQc8abe13GYmByNwl9CsRUI
 1IFVbVJvmJ2GCoe5IFYywBdwumXjRYH1bbFl5Rw6EZbi/xcorkev6hTxajU/KxEMusbU
 vQ4kV0QxT5tvOfFjZmZWt7ikhM3dEbjyN9oSmjgTzlL7/W7d9a+K/8uvhP1l4j/j9kcM
 d6cTjaS0FhrMkFprONKq6eR+fBLtXMfqYMJGu6uDgFQ4lRLgGz0oIXlPO+Ud2LNDQRrx
 vrIPVLbD2JpIDvp0rCwOvFrplaW36TvksVJ7m5oQw4GFCyhujZQGGZb8Gp3r8jBiy985 Sw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpn67m8uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 18:11:33 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 11:11:31 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 11:11:31 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: toggle (continuous)'
Date: Wed, 24 May 2023 11:11:31 -0700
Message-ID: <20230524181131.3890392-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: WdV4qd835F5XmHd4I69VUjQbmkTyWv6e
X-Proofpoint-ORIG-GUID: WdV4qd835F5XmHd4I69VUjQbmkTyWv6e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_11,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxlogscore=765 phishscore=0 clxscore=1015 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240150
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 18:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102792

From: Joe Slater <joe.slater@windriver.com>

Look for level transitions when testing toggling
values because using fixed delays to assume value
changes is not reliable.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...-ptest-modify-delays-in-toggle-tests.patch | 60 +++++++++++++++++++
 .../libgpiod/libgpiod_2.0.1.bb                |  2 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch
new file mode 100644
index 0000000000..11f2d5c4a9
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-delays-in-toggle-tests.patch
@@ -0,0 +1,60 @@
+From b73a79245ac0fa36b15bf3308e4ed008793ff15c Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Fri, 19 May 2023 08:46:47 -0700
+Subject: [PATCH] ptest: modify delays in toggle test
+
+The test "gpioset: toggle (continuous)" uses fixed delays to test
+toggling values.  This is not reliable, so we switch to looking
+for transitions from one value to another.
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
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
index 337554cd89..91c4d27692 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = " \
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
 
+SRC_URI += "file://0001-ptest-modify-delays-in-toggle-tests.patch"
+
 SRC_URI[sha256sum] = "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b0c1d05ec57a38392"
 
 # Enable all project features for ptest
-- 
2.25.1


