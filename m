Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF82C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 12:15:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45313.1744028150730542910
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 05:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61924415ef=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5376JYkW010552
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Apr 2025 12:15:50 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8j8y9-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 12:15:49 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 7 Apr 2025 05:15:48 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 7 Apr 2025 05:15:47 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libnvme: upgrade 1.11.1 -> 1.12
Date: Mon, 7 Apr 2025 20:15:45 +0800
Message-ID: <20250407121547.2516285-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: L9MAmJCgQHMQ6RvYFw01LoRmmk2r_tJQ
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f3c1f5 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=6N5vWBxBcUgGCSi74I0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: L9MAmJCgQHMQ6RvYFw01LoRmmk2r_tJQ
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 12:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116664

From: Changqing Li <changqing.li@windriver.com>

Changelog:
https://github.com/linux-nvme/libnvme/releases/tag/v1.12

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...k.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch | 41 +++++++++++++++++++
 .../{libnvme_1.11.1.bb => libnvme_1.12.bb}    |  5 ++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/libnvme/files/0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch
 rename meta-oe/recipes-support/libnvme/{libnvme_1.11.1.bb => libnvme_1.12.bb} (86%)

diff --git a/meta-oe/recipes-support/libnvme/files/0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch b/meta-oe/recipes-support/libnvme/files/0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch
new file mode 100644
index 0000000000..8734d443bb
--- /dev/null
+++ b/meta-oe/recipes-support/libnvme/files/0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch
@@ -0,0 +1,41 @@
+From 14328a9a429fd84ddd1a3ed4fb0eb9643c61fa58 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 7 Apr 2025 13:23:57 +0800
+Subject: [PATCH] mock.c: fix checking of HAVE_GLIBC_IOCTL
+
+Commit [ 0d8d0a55 build: do not include config.h globally ]
+changed to always pass -DHAVE_GLIBC_IOCTL=[0|1], and this causes
+a regression, for system without glibc ioctl, -DHAVE_GLIBC_IOCTL=0
+is passed, and causes error:
+../git/test/ioctl/mock.c:123:5: error: conflicting types for 'ioctl'; have 'int(int,  long unsigned int, ...)'
+  123 | int ioctl(int fd, unsigned long request, ...)
+      |     ^~~~~
+In file included from ../git/test/ioctl/mock.c:9:
+pathto/usr/include/sys/ioctl.h:115:5: note: previous declaration of 'ioctl' with type 'int(int,  int, ...)'
+  115 | int ioctl (int, int, ...);
+
+Fixed by checking value of HAVE_GLIBC_IOCTL in mock.c
+
+Upstream-Status: Submitted [https://github.com/linux-nvme/libnvme/pull/985]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ test/ioctl/mock.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/ioctl/mock.c b/test/ioctl/mock.c
+index 7402b45c..da3caba8 100644
+--- a/test/ioctl/mock.c
++++ b/test/ioctl/mock.c
+@@ -118,7 +118,7 @@ void end_mock_cmds(void)
+ 	} \
+ })
+ 
+-#ifdef HAVE_GLIBC_IOCTL
++#if defined(HAVE_GLIBC_IOCTL) && HAVE_GLIBC_IOCTL == 1
+ typedef int (*ioctl_func_t)(int, unsigned long, void *);
+ int ioctl(int fd, unsigned long request, ...)
+ #else
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.11.1.bb b/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
similarity index 86%
rename from meta-oe/recipes-support/libnvme/libnvme_1.11.1.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.12.bb
index bf66099ddf..a80d34277f 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.11.1.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
@@ -11,9 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "cec9feaeb03da8046d14bb395f592c601cf2ae5f"
+SRCREV = "5ec1f5284ecb0eda481f3d2d61236fbc5b46164f"
 
-SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
+SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master \
+           file://0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


