Return-Path: <JAEWON@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770055.outbound.protection.outlook.com [40.107.77.55])
	by mail.openembedded.org (Postfix) with ESMTP id 9C35A61311
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 23:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CioxaBXDey4VyIZp66434QWkZWBHyrV4lvLToRx9LByt025+yl1L/AzJRHdLzV72wpGVxVsLkE4SJoKzlJK2ZdbV6rbf7ME1PEkJh3KKVf5M61AdD7G4ln31gkJd+NhZq0mchWj3eEPMbedhAyMLOWOyCrmy7nM9Rv0Ok51oSymIKlt6w8cnpHaaPycYTAcu3uG8g+6OEmVmgUTt/gnq9fmAecSrqLgKW9p8fd62NBFMscvKoQKfzMFoXxiru97lbLYfXloabZiQ6xI17nL6tSS+o1SpYSgCCc3fJX1DOAG8vgylJuAw5+s4B2B7QzXfof7S0WXt9byettFKK1NzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=k1pbVaqYIMS96QzTqnLghZAt6NoSoj5jOWdt2Rc/dds=;
	b=P6vsJN2xNlmKpwGoqVWcz0cgv8C+IZL6meANt2nXOwdAclJWvYezRm+XWZZJL2tlyAADjtcDhfgVNSpi+t7vumEqq0Rn0gXMweUls7vOkKIvJ3zUNBDnUp/lQkJddA2Vs7y9W/57aTijMo7a4lzfIuPOrY4gB1Ciaavzkw+reXTzfUwF0ays6z+9jvw0xlGRJQtSAVrok9jnNlqN7v+ekPp6IAt066Uhv0OzThv0wsP3oxLRkm6hRrt4SLm5xPYrzRqPT7sNU1JhQw5ao8+6mSdIGT/zyWQyWPpjID3OCd4wCRysJCALmV6Da/aR1e3Udp3WhB0cl5+w/t3v2C2rtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
	dmarc=bestguesspass action=none header.from=xilinx.com;
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=k1pbVaqYIMS96QzTqnLghZAt6NoSoj5jOWdt2Rc/dds=;
	b=BN2MM747kxngw3Apqt4X4e4hw5otqNMmgpmSneSF7fAw5Kj5PyP8bOUSqO8iLN+a95MxXj6qq7Aiq950IkxMGpg3BkFwBQXa9DtqSeMovH+ZyCWa1YbbhLSEDf5jvt0tB6uP6ILhdgmQCAQrWYulJ6ikaxKpVnqOoMGleDvGHrI=
Received: from DM6PR02CA0119.namprd02.prod.outlook.com (2603:10b6:5:1b4::21)
	by BYAPR02MB5464.namprd02.prod.outlook.com (2603:10b6:a03:95::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23;
	Thu, 20 Feb 2020 23:15:31 +0000
Received: from CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by DM6PR02CA0119.outlook.office365.com
	(2603:10b6:5:1b4::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via
	Frontend Transport; Thu, 20 Feb 2020 23:15:31 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT023.mail.protection.outlook.com (10.152.74.237) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2750.18
	via Frontend Transport; Thu, 20 Feb 2020 23:15:30 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1j4v2Y-0003EA-Iz; Thu, 20 Feb 2020 15:15:30 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1j4v2T-0005dw-Fq; Thu, 20 Feb 2020 15:15:25 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	01KNFHQw016303; Thu, 20 Feb 2020 15:15:17 -0800
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1j4v2L-0005d4-Ek; Thu, 20 Feb 2020 15:15:17 -0800
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: git_plnxyocto@xilinx.com
Date: Thu, 20 Feb 2020 15:15:16 -0800
Message-Id: <20200220231516.23639-1-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(189003)(199004)(478600001)(9786002)(1076003)(70206006)(356004)(4326008)(44832011)(70586007)(54906003)(2906002)(7696005)(34206002)(5660300002)(336012)(316002)(8936002)(36756003)(26005)(81166006)(2616005)(107886003)(186003)(966005)(8676002)(81156014)(426003)(6636002)(37006003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5464; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 478b6ec5-daca-4b64-9d88-08d7b65ac7cc
X-MS-TrafficTypeDiagnostic: BYAPR02MB5464:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5464705B3DCAFC730AE2991FAF130@BYAPR02MB5464.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 031996B7EF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ztjMGGpKQb/Ax7tD+5QS1izKwYMT34paDxF9QKbtDnqle90V845HuET5JXTRK2HVbfNIRJyCLTiUgqlTK9ODrS/27ROgvsmCHnRc/MkUkABNzRIASnzWnWlXyKY+WjB/rt+DjZKnrf0bMVhH1Yw/Rf/fNRzBSfWmPdGP3g8JnrxgoNr++vrT18sg9qnG1CHTto3zw8WjX2TvMyaNvYweQRvucu/61cofnFP/HVSnS9/ZGl6d68THhYn5/+0tzoN5u5SgYBegAcQ8fY5YiZEc1KpfoKItGpTMRHKQFTgdMzFf3HlSCKrOrO++jW2dIy3bGgWvYN97atKnh4eBCc9zId66WtlEBbZ1jb4E/JPLJhQSd1g4V4w8FD9K/Ci3CtiiY5GbZKYNdxJzbOdszV6QLrLWsqbuuk8pmogmxaS5FAYqT45dc/TyJbqxI0Y7ObAIn1vU8+4+D+yfHaT59ASvYSbbGhIBYMlEbY82R0/hbErY3+aMnhqz7m0zSfwd2DsSDI6TWdu4xYAWlKPOGDfSdQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2020 23:15:30.9880 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 478b6ec5-daca-4b64-9d88-08d7b65ac7cc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5464
Cc: "William A. Kennington III via Openembedded-devel"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-openembedded][rel-v2020.1][PATCH] can-utils: bump to revision 665d869
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Feb 2020 23:15:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: "William A. Kennington III via Openembedded-devel" <openembedded-devel@lists.openembedded.org>

Also:
 - remove patch applied upstream
 - update the hash of the license because the file
 now contains a SPDX license identifier

BACKPORT from openembedded master

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
---
 ...o-find-SIOCGSTAMP-with-latest-kernel.patch | 106 ------------------
 .../socketcan/can-utils_git.bb                |   9 +-
 2 files changed, 4 insertions(+), 111 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch

diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch b/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
deleted file mode 100644
index cbf3aee10..000000000
--- a/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 20981c8a328747f823b7eef68d0c2812b3eaed30 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Jul 2019 21:50:43 +0200
-Subject: [PATCH] fix include to find SIOCGSTAMP with latest kernel
-
-In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
-the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
-Instead it provides only SIOCGSTAMP_OLD.
-
-The linux/sockios.h header now defines SIOCGSTAMP using either
-SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. This linux only
-header file is not pulled so we get a build failure.
-
-canlogserver.c: In function 'main':
-canlogserver.c:404:21: error: 'SIOCGSTAMP' undeclared (first use in this function); did you mean 'SIOCGRARP'?
-     if (ioctl(s[i], SIOCGSTAMP, &tv) < 0)
-                     ^~~~~~~~~~
-                     SIOCGRARP
-canlogserver.c:404:21: note: each undeclared identifier is reported only once for each function it appears in
-
-Fixes:
- - http://autobuild.buildroot.org/results/363de7d9bf433be8bc47ba4ee52ae0bb80fa9021
-
-Upstream-Status: Backport [https://github.com/linux-can/can-utils/commit/e9590b1ca75d360eaf3211bebd86058214d48064]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- canlogserver.c | 1 +
- cansniffer.c   | 1 +
- isotpdump.c    | 1 +
- isotpperf.c    | 1 +
- isotpsniffer.c | 1 +
- slcanpty.c     | 1 +
- 6 files changed, 6 insertions(+)
-
-diff --git a/canlogserver.c b/canlogserver.c
-index e3350b7..f53165c 100644
---- a/canlogserver.c
-+++ b/canlogserver.c
-@@ -61,6 +61,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- #include <signal.h>
- #include <errno.h>
- 
-diff --git a/cansniffer.c b/cansniffer.c
-index 7b0a3fa..bf7d72e 100644
---- a/cansniffer.c
-+++ b/cansniffer.c
-@@ -61,6 +61,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/bcm.h>
-+#include <linux/sockios.h>
- 
- #include "terminal.h"
- 
-diff --git a/isotpdump.c b/isotpdump.c
-index b2b650a..36d8af3 100644
---- a/isotpdump.c
-+++ b/isotpdump.c
-@@ -55,6 +55,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- #include "terminal.h"
- 
- #define NO_CAN_ID 0xFFFFFFFFU
-diff --git a/isotpperf.c b/isotpperf.c
-index db3a2b7..5852a57 100644
---- a/isotpperf.c
-+++ b/isotpperf.c
-@@ -56,6 +56,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- 
- #define NO_CAN_ID 0xFFFFFFFFU
- #define PERCENTRES 2 /* resolution in percent for bargraph */
-diff --git a/isotpsniffer.c b/isotpsniffer.c
-index f42e18b..d7a4c66 100644
---- a/isotpsniffer.c
-+++ b/isotpsniffer.c
-@@ -55,6 +55,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/isotp.h>
-+#include <linux/sockios.h>
- #include "terminal.h"
- 
- #define NO_CAN_ID 0xFFFFFFFFU
-diff --git a/slcanpty.c b/slcanpty.c
-index 431ca68..7dfaf5c 100644
---- a/slcanpty.c
-+++ b/slcanpty.c
-@@ -40,6 +40,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- 
- /* maximum rx buffer len: extended CAN frame with timestamp */
- #define SLC_MTU (sizeof("T1111222281122334455667788EA5F\r")+1)
diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index db5055fed..e2609d411 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -1,14 +1,13 @@
 SUMMARY = "Linux CAN network development utilities"
 DESCRIPTION = "Linux CAN network development"
 LICENSE = "GPLv2 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=43;md5=390a2c9a3c5e3595a069ac1436553ee7"
+LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"
 
 DEPENDS = "libsocketcan"
 
-SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master \
-           file://0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch \
-           "
-SRCREV = "4c8fb05cb4d6ddcd67299008db54af423f86fd05"
+SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master"
+
+SRCREV = "665d8699ebe728bf48e63e8ae58d2482db72f954"
 
 PV = "0.0+gitr${SRCPV}"
 
-- 
2.25.0


