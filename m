Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FA3EB64DA
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 22:04:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.31179.1686866651999382739
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 15:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kGRNoX7b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5530a2c30d=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FKVHC3023827
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:04:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=nJ4/Qixb71BRQXeOBFTKTt6ITyo/h9/uZuZ0Dh9Ua5I=;
 b=kGRNoX7bCbEFIoV5GQzmwArwr1kQDAEtywY6yjey2z/EkkE4R9AQ9IPph3CjiZAkPD+i
 dKJ+xnkBi8mscU+sb+gTv7EtMZS7JTdoCZbvoyta9UQdLh+g3ClvdeWe4fW7+aH1pxw6
 g1FGG0MdyHXDq98S639af7a6Jt3mja1MiFoowpa8mevapg63Te/uwmSlhMqUgy5Ro/IU
 4E19F+dUTH4tzfl8Oykjz8atIabxgReGeBG5b0oZbkNWu77IhurhT3+oeHdibE5Srva1
 d5Rrq6rMNfZ4+UfQZOYihPRDPw1/MqIZrkuPykwgpgEBKFRwZvgxfqPMpe0FTRyNKz3R WQ== 
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4rphn5qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:04:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 15:04:10 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 15:04:10 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [mickledore][meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: toggle (continuous)'
Date: Thu, 15 Jun 2023 15:04:10 -0700
Message-ID: <20230615220410.741458-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6-oyFaKoIlQRZXIpO0f5DtVx5Uz4aCJx
X-Proofpoint-GUID: 6-oyFaKoIlQRZXIpO0f5DtVx5Uz4aCJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=595
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150189
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 22:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103331

From: Joe Slater <joe.slater@windriver.com>

Look for level transitions when testing toggling
values because using fixed delays to assume value
changes is not reliable.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

cherry-pick from meta-oe/master 45a8bb2620...

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../gpio-tools-test-bats-modify.patch         | 67 +++++++++++++++++++
 .../recipes-support/libgpiod/libgpiod_2.0.bb  |  2 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.0/gpio-tools-test-bats-modify.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.0/gpio-tools-test-bats-modify.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.0/gpio-tools-test-bats-modify.patch
new file mode 100644
index 0000000000..4d49467968
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.0/gpio-tools-test-bats-modify.patch
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
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
index 179fe170e2..ee20aaf792 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] = "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9889b9268cc
 
 S = "${WORKDIR}/libgpiod-2.0"
 
+SRC_URI += "file://gpio-tools-test-bats-modify.patch"
+
 # We must enable gpioset-interactive for all gpio-tools tests to pass
 PACKAGECONFIG[tests] = "--enable-tests --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
 PACKAGECONFIG[gpioset-interactive] = "--enable-gpioset-interactive,--disable-gpioset-interactive,libedit"
-- 
2.25.1


