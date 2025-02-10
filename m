Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0FAC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 03:30:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.42895.1739158252029680322
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Feb 2025 19:30:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4136494cdd=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A2v3uB021565
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 03:30:51 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44nx88sfhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 03:30:51 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 9 Feb 2025 19:30:49 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 9 Feb 2025 19:30:49 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][PATCH] dlt-daemon: make DLT_WatchdogSec configurable
Date: Mon, 10 Feb 2025 11:30:48 +0800
Message-ID: <20250210033048.4186564-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5ORD9qW9tKiNJdhxQaV2KZ7jwNAxiAbj
X-Authority-Analysis: v=2.4 cv=VZANPEp9 c=1 sm=1 tr=0 ts=67a972eb cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Qc0wC0M0WH6gsc5hBfAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5ORD9qW9tKiNJdhxQaV2KZ7jwNAxiAbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_02,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 03:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115325

From: Changqing Li <changqing.li@windriver.com>

On slow system, dlt service may fail since watchdog timeout, backport a
patch to make DLT_WatchdogSec configurable, so that this service can
start successfully during boot.

(cherry-picked from 1cf77003036049533fbda22b96c7fbad1cc693f9)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-DLT_WatchdogSec-can-be-set-by-user.patch | 40 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.10.bb          |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
new file mode 100644
index 0000000000..335872c40f
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
@@ -0,0 +1,40 @@
+From bc03f142507da92add8ba325fdf8187d47a7d719 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 13 Dec 2024 16:37:24 +0800
+Subject: [PATCH] CMakeLists.txt: make DLT_WatchdogSec can be set by user
+
+In my test env, WatchdogSec default value 2 is not enough, manually
+changed to 3 is ok. This makes dlt.service/dlt-system.service start
+failed during boot time. So, make DLT_WatchdogSec can be set by user, so
+user can set them to proper value at build time, then service can start
+successfully in boot time.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Upstream-Status: Backport [https://github.com/COVESA/dlt-daemon/pull/720/commits/bc03f142507da92add8ba325fdf8187d47a7d719]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ systemd/CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/systemd/CMakeLists.txt b/systemd/CMakeLists.txt
+index 16cbe86b5..659378d16 100644
+--- a/systemd/CMakeLists.txt
++++ b/systemd/CMakeLists.txt
+@@ -18,10 +18,14 @@ if(WITH_SYSTEMD)
+     set(SYSTEMD_CONFIGURATIONS_FILES_DIR ${SYSTEMD_UNITDIR} )
+ 
+     if(WITH_SYSTEMD_WATCHDOG)
+-        set( DLT_WatchdogSec 2 )
++        if(NOT DEFINED DLT_WatchdogSec)
++            set(DLT_WatchdogSec 2 CACHE STRING "Watchdog timeout in seconds")
++        endif()
+         message( STATUS "The systemd watchdog is enabled - timeout is set to ${DLT_WatchdogSec} seconds")
+     else(WITH_SYSTEMD_WATCHDOG)
+-        set( DLT_WatchdogSec 0 )
++        if(NOT DEFINED DLT_WatchdogSec)
++             set(DLT_WatchdogSec 0 CACHE STRING "Watchdog timeout in seconds")
++        endif()
+         message( STATUS "The systemd watchdog is disabled")
+     endif(WITH_SYSTEMD_WATCHDOG)
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index 3d2e4a73f1..888289b357 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
            file://0004-Modify-systemd-config-directory.patch \
            file://544.patch \
            file://567.patch \
+           file://0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch \
            "
 SRCREV = "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
 
-- 
2.34.1


