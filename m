Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CD8EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 14:06:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13104.1686751574202505478
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jun 2023 07:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZF4TmgDg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=552986e421=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35EDKjtn013771;
	Wed, 14 Jun 2023 14:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=wjUQ68PcrPu8F249uUxRjCDxLTRyqSeHGpfQ+UDJ6hA=;
 b=ZF4TmgDgXuFsMtpI72BczDO+Ju36VTfToP5z1zaWWa/OYs1z6p9lwp2drnG92YVuJ06T
 gwSD/3h5QHQgxEQGnEqKRAZnBPBgPxDiOqvs4ubIvmrLvrGrfvS1VyiqrbnfAeXkrp5l
 gWSity+kkkd967RBJmAbYy+sGL44LOKJXgcTrZWCJ9eyO06dZERGkEIunU848tK5JXNw
 NIwhunApE+RLcIPErOcTRWGUTdPJQU3uZJR/UvOCNXMusgF1WaZcZkz4t1gt3hrWysqT
 lfQn0nGwhFNbqFk+uq+hRZSLjadgCT/752OM1TlRhxc8Rs4XC5ik275WfWwytHj6CW88 Zg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4ed0409w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 14 Jun 2023 14:06:12 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 07:06:11 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 07:06:11 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>, <brgl@bgdev.pl>
Subject: [v3][meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: toggle (continuous)'
Date: Wed, 14 Jun 2023 07:06:11 -0700
Message-ID: <20230614140611.2415960-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: oAoh26Ljhc0JNJkRitZuTDxIHlb9HnvZ
X-Proofpoint-ORIG-GUID: oAoh26Ljhc0JNJkRitZuTDxIHlb9HnvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_10,2023-06-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=748
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140122
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 14:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103284

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
index 0000000000..4d49467968
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch
@@ -0,0 +1,67 @@
+From 53f9670d6af1bd0745c1df9c469b269c72607b23 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Tue, 6 Jun 2023 08:04:27 -0700
+Subject: [PATCH] tools: tests: modify delays in toggle test
+
+The test "gpioset: toggle (continuous)" uses fixed delays to test
+toggling values. This is not reliable, so we switch to looking
+for transitions from one value to another.
+
+We wait for a transition up to 1.5 seconds.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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


