Return-Path: <ckalluri@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760049.outbound.protection.outlook.com [40.107.76.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9AEE1600E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 03:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=IZbBhh8k+HbZbg4ro/PS2U7HhNBhZFJpFhmmgaHOV1E=;
	b=zxoI1yrE2+t7vpXH6nd7pyccqJPLaAkJN5Giuph27cEAxbr8RsICEM/w4RAD+eq5vxeWll1gMX6RuL6Jc8wu4yNsGCkPwFxTiGCm20ci7Wo6Oe9MROFj7H7BwqlwOYIdE2TNcnrHZ3wVcJrh7YPtrWK36a1Zvv+Di4QJhz3hkCM=
Received: from CY4PR02CA0005.namprd02.prod.outlook.com (2603:10b6:903:18::15)
	by DM6PR02MB5019.namprd02.prod.outlook.com (2603:10b6:5:52::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1601.19;
	Fri, 15 Feb 2019 03:16:30 +0000
Received: from SN1NAM02FT044.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::204) by CY4PR02CA0005.outlook.office365.com
	(2603:10b6:903:18::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1622.16 via
	Frontend Transport; Fri, 15 Feb 2019 03:16:30 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT044.mail.protection.outlook.com (10.152.72.173) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Fri, 15 Feb 2019 03:16:29 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:44492
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1guTzJ-00011e-Ev
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2019 19:16:29 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1guTzE-0003uO-Ac
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2019 19:16:24 -0800
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x1F3GJNc007416; Thu, 14 Feb 2019 19:16:19 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1guTz9-0003tv-MU; Thu, 14 Feb 2019 19:16:19 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Feb 2019 19:16:14 -0800
Message-ID: <1550200574-9614-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(39850400004)(136003)(376002)(2980300002)(189003)(199004)(50466002)(186003)(2906002)(356004)(6666004)(47776003)(8936002)(16586007)(6916009)(4326008)(426003)(478600001)(106002)(316002)(336012)(476003)(2616005)(51416003)(63266004)(126002)(9786002)(2351001)(48376002)(26005)(36386004)(486006)(305945005)(8676002)(107886003)(81156014)(106466001)(14444005)(50226002)(7696005)(36756003)(77096007)(81166006)(42866002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB5019; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT044;
	1:FaAAPTZqjQaJ4jhcThWRm0oHY6bJbrmSATiDp3O/bYo3gjemGxHGuNEyicoXL6qVhBBhjY237MolP1MOiDWB1cFtEPmG8ByCjiDJMW/da9wkwNTPNXEs2qJTeSWeJAivKHXCG8Pd2a7D6lT4/0BN1A==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20031c60-ceff-4085-d5ca-08d692f3fab0
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:DM6PR02MB5019; 
X-MS-TrafficTypeDiagnostic: DM6PR02MB5019:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB5019;
	20:iEorzqJ96nN9KgcNMJbuH2vzzDNoZUZGeR7taxEzhzWTzglQsBw6NK/CD8xdmJmbe0WyKP2D+Zrr1k76dotXP+EDDfK4jvWgBreY5q6hJUDOIZTfsgj64ljJ6wJUCDCB03FzZu+X8Tul7eWsUc/3sroKIOhEKHwWtRnKwomjY8sJYppecpkGCCaHGb9DDFEEwJqy0oE5POgJZMez96WGidVJX8m8c9JG/kzSbOsBcG+0qjyNaEOYGJ4shgPAgxcmMR6fk57hyeeRG4c5OHVxCOU0Gapr3p99JHF86KcXENj7WO1tfc89IpX2nRH/1R2SZr4DhJzuErW6+7tmp66amfPm5i7FwlYP5IijNVE7ODf+LsO03oj91nXg+gKq9Aoz22Rs6R0plnO8AKHKpH3k9SH0WWAFC/ZxbiagYq/iJPs8d43u7ypxNnXXS3QwmNTe0z3Xoq4cnie1sLLNtBfczE2oCUgAt7aJrchg9bcBxZJ9oUr80UENUVWXtTL8/GU3
X-Microsoft-Antispam-PRVS: <DM6PR02MB5019F6557FE56FED406B7DDBB0600@DM6PR02MB5019.namprd02.prod.outlook.com>
X-Forefront-PRVS: 09497C15EB
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB5019;
	23:ZQwPuZW/0EY90DHYgBRkOzPjfnIDR9aqpNzqLxpkR?=
	=?us-ascii?Q?B0Ns5pkJhyzZXLpOwbtF4OHojtLrq+koXYU1DR2nWSH8AI1laX42h67O4ANR?=
	=?us-ascii?Q?CULvuxW/eDfI+0NbyEed3vgfiZMN+Qwca+VPS4Bo1FlXf52Ez9Ahs5IUV3je?=
	=?us-ascii?Q?gofq8P0VpSOhjhnKy92Xd7VkRZtTmjGOttMRwSCYF318/xIKGWLrIeaIidtH?=
	=?us-ascii?Q?HKhAnUItaIIBdaCsOc0UCfgb7IwlrEQ0jFzYVL0hkBDesS3osK6SyArJqa7X?=
	=?us-ascii?Q?6gVps1FTEa5dqtyp/4HhMN6jPMnXoSa2seqaj8RFyjRVeVtK4qCfXvf433bq?=
	=?us-ascii?Q?rdQ9Mhy8vBAr6pnz6D/a4Kf50jMe2G8eidW4PP/dFrkrzerbXu1obYxTbBgM?=
	=?us-ascii?Q?n7Vezlg3+WIN+FN2h0+RlqFmv1IlXZfNy3t6X+4xJHhBW1hRVKnpFWqMNUTg?=
	=?us-ascii?Q?MoooOwazJnXS+flSs1UdCnzmgZHuysa64PH+FK1qEU8Fgwo6GYhJ05haE/uI?=
	=?us-ascii?Q?bzE791fkE8oY6KycQOPWcFATrObmbrpaP3yg9InHMKJaPYgAssB144N/auQj?=
	=?us-ascii?Q?ztszhILpzGeh3J8MvOKArl1ldd8LtOenbPyIQ+3C3GN4UdJbnpIG99WXDpmk?=
	=?us-ascii?Q?/DiFahskhAZMaVWDF98IUagXx0848F1DIdV0Wb8srAfpGEhyMsCFHU7ty0qT?=
	=?us-ascii?Q?NN+KgSJi6G/U0zAF0FMCV3UvXfxrS9N71sDCzpp7obO2RiBUqYFkmUwvMVgi?=
	=?us-ascii?Q?fvEz7ux0p5UclO1ZAkRNkejk4XPPrYb9839GpG5h6RMLRFjB0HIFron+EttG?=
	=?us-ascii?Q?FFMckzE6eaDzElpjiFfLVmiiEpzUgwPl2NbNvOEjnc+T0FdfBG4k7IAsHcVm?=
	=?us-ascii?Q?Bue5o93n6cbEV5wEkYtEjPlQo1rSRSiSxYmP2K2lFLd5zBm87e7xB3NOiq/X?=
	=?us-ascii?Q?QqE1NgBXaBkLkkeXG0Se5wAyJ13n5+X8ZJIu+lDmUIznoBny0YwzEYpuwcTq?=
	=?us-ascii?Q?5avei0xjww6cIF1UU9Z3mj3v138bESQIjMrfYgHGZytDYxvwxpN3V8B3VMxC?=
	=?us-ascii?Q?+KOU23N693VGSSfoDteyPqDm7py?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: dsoVNxwej+u//lvD22NUHS+wJ4f6EUr0mwY9RadGyX92w1raUVtBiB27Ue/hgXIuVppclhg+0Rf+LHanBH4BUEmM81z2uVgB/+irLuMM8IzI7mrDYT89FQoS4cSjj/nuVQ4n3b6IGMuaEGfgOcV1njjJsvdR/siHwJ5glnsJhYbaKAz2k5ixCdn7VzR+lWGsemrnFwNyJLvchGQ2BAD5oVrtMvecPMlTCUpiDAYV7fo4KzhdWb/NTsqzN6unOq8QIgkoB/2QXuSqA+cm6/ngJR0tTU/FrinGyEVXZWJrHLkT3WuP8aolYbhuitgl0lfcDpg5HcwrUb4BlfTgpN3ETqLquECk1wxSR83pjB8kIVPIMEEuXZ+toCDlJP5dMrJBSpPOF505gCGeZrB0YdnXfoIJiQs00Z3UgS3TjRPTxQQ=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2019 03:16:29.8884 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20031c60-ceff-4085-d5ca-08d692f3fab0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5019
Subject: [meta-oe][master][PATCH] ace-cloud-editor: move ace-cloud-editor recipe to meta-oe/recipes-support
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
X-List-Received-Date: Fri, 15 Feb 2019 03:31:18 -0000
Content-Type: text/plain

This commit c245374fafbc4769e0c98ae18ac9ff71f9f14169 places
ace-cloud-editor recipe in an incorrect location. This commit moves the
recipe to the right location.
---
 .../ace-cloud-editor/ace-cloud-editor_git.bb       | 22 ++++++++++++++++++++++
 .../ace-cloud-editor/ace-cloud-editor_git.bb       | 22 ----------------------
 2 files changed, 22 insertions(+), 22 deletions(-)
 create mode 100644 meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
 delete mode 100644 recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb

diff --git a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
new file mode 100644
index 0000000..4ea6c8a
--- /dev/null
+++ b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Ace is a code editor written in JavaScript."
+SUMMARY = "Ace is a code editor written in JavaScript. This repository has only generated files"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=794d11c5219c59c9efa2487c2b4066b2"
+
+SRC_URI = "git://github.com/ajaxorg/ace-builds.git;protocol=https"
+
+PV = "02.07.17+git${SRCPV}"
+SRCREV = "812e2c56aed246931a667f16c28b096e34597016"
+
+FILES_${PN} = "${datadir}/ace-builds"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "rsync-native"
+
+do_install () {
+    install -d ${D}/${datadir}/ace-builds/src-noconflict
+    rsync -r --exclude=".*" ${S}/src-noconflict/* ${D}/${datadir}/ace-builds/src-noconflict
+}
+
diff --git a/recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb b/recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb
deleted file mode 100644
index 4ea6c8a..0000000
--- a/recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Ace is a code editor written in JavaScript."
-SUMMARY = "Ace is a code editor written in JavaScript. This repository has only generated files"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=794d11c5219c59c9efa2487c2b4066b2"
-
-SRC_URI = "git://github.com/ajaxorg/ace-builds.git;protocol=https"
-
-PV = "02.07.17+git${SRCPV}"
-SRCREV = "812e2c56aed246931a667f16c28b096e34597016"
-
-FILES_${PN} = "${datadir}/ace-builds"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += "rsync-native"
-
-do_install () {
-    install -d ${D}/${datadir}/ace-builds/src-noconflict
-    rsync -r --exclude=".*" ${S}/src-noconflict/* ${D}/${datadir}/ace-builds/src-noconflict
-}
-
-- 
2.7.4


