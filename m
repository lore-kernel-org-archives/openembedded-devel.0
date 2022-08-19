Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE73C32772
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 09:58:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.1258.1660903093863521734
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 02:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mgSn/DVZ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5230971fa8=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27J9Txdu004950
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 09:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=z98Rd1bNXb+CeAhiiyBN5uj3OWKJJI/59xYiJYypWrQ=;
 b=mgSn/DVZWrZjEGSgYHjXGfABMB/52t4xOotISiqZJlrJllPlS7wkXd/c0NysD53UDRaq
 OhRnXENps9KkUN59l51CXNJCK15RtS2yVKy2pThXmn5o72tZuaXnn4BLw3lAuP5BdOMd
 7d8hbdyCVof2Z2SOawa8EAhpBrZRfZwk5FqZpaY+sOfP4p0iVLlgt1Jh2ANis1tcasTZ
 sFBiw0k4UtSo9L4Ej5cNXgSk+VXkBF9vGD6fd1OqrbZK3rSoSrn003g4eR6Z2qBP7R7K
 1nhnh1ZmRZhhZX2wQwIS6/+O4FydWfkURXT4vfi14fx1NS6IsHlDiHClxVGqS5NYg7Aj Uw==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160w925-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 09:58:12 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 19 Aug 2022 02:58:05 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 19 Aug 2022 02:58:05 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 19 Aug 2022 02:58:04 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirtstone][master][meta-oe][PATCH] dlt-daemon: fix
 dlt-system.service failed since buffer overflow
Date: Fri, 19 Aug 2022 17:58:04 +0800
Message-ID: <20220819095804.1716036-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: AtWMeISQgxfu_Ol8kN7GS79o4nZPxDms
X-Proofpoint-GUID: AtWMeISQgxfu_Ol8kN7GS79o4nZPxDms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_05,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190039
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Aug 2022 09:58:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98325

From: Changqing Li <changqing.li@windriver.com>

dlt-system.service start failed with error:
dlt-system[367]: *** buffer overflow detected ***: terminated
dlt-system.service: Failed with result 'watchdog'.
dlt-system.service: Main process exited, code=dumped, status=6/ABRT                                                                                        dlt-system.service: Watchdog timeout (limit 2s)!

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...uffer-overflow-detection-on-32bit-ta.patch | 40 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.8.bb           |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt-system-Fix-buffer-overflow-detection-on-32bit-ta.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt-system-Fix-buffer-overflow-detection-on-32bit-ta.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt-system-Fix-buffer-overflow-detection-on-32bit-ta.patch
new file mode 100644
index 0000000000..e7e6cb3b1a
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt-system-Fix-buffer-overflow-detection-on-32bit-ta.patch
@@ -0,0 +1,40 @@
+From 94378458d653b1edca86435026909592cbe5e793 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 19 Aug 2022 11:12:17 +0800
+Subject: [PATCH] dlt-system: Fix buffer overflow detection on 32bit targets
+
+On 32bit target, dlt-system will termiated with error:
+dlt-system: *** buffer overflow detected ***: terminated
+
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/398]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/system/dlt-system-watchdog.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/system/dlt-system-watchdog.c b/src/system/dlt-system-watchdog.c
+index a2b01de..c0eaa12 100644
+--- a/src/system/dlt-system-watchdog.c
++++ b/src/system/dlt-system-watchdog.c
+@@ -109,8 +109,8 @@ int register_watchdog_fd(struct pollfd *pollfd, int fdcnt)
+ 
+ void watchdog_fd_handler(int fd)
+ {
+-    long int timersElapsed = 0;
+-    int r = read(fd, &timersElapsed, 8);    // only needed to reset fd event
++    uint64_t timersElapsed = 0ULL;
++    int r = read(fd, &timersElapsed, 8U);    // only needed to reset fd event
+     if(r < 0)
+         DLT_LOG(watchdogContext, DLT_LOG_ERROR, DLT_STRING("Could not reset systemd watchdog. Exit with: "), 
+             DLT_STRING(strerror(r)));
+@@ -120,4 +120,4 @@ void watchdog_fd_handler(int fd)
+ 
+     DLT_LOG(watchdogContext, DLT_LOG_DEBUG, DLT_STRING("systemd watchdog waited periodic\n"));
+ }
+-#endif
+\ No newline at end of file
++#endif
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
index 7a613bcc93..aa5ef46a9d 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https;branch=master \
            file://0002-Don-t-execute-processes-as-a-specific-user.patch \
            file://0004-Modify-systemd-config-directory.patch \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
+           file://0001-dlt-system-Fix-buffer-overflow-detection-on-32bit-ta.patch \
            "
 SRCREV = "6a3bd901d825c7206797e36ea98e10a218f5aad2"
 
-- 
2.25.1


