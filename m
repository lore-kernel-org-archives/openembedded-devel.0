Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCD0C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 15:49:44 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.102])
 by mx.groups.io with SMTP id smtpd.web08.8976.1648741778396103384
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 08:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=EsmuGJfe;
 spf=pass (domain: quantatw.com, ip: 40.107.215.102,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSi+9k5Uw+clZCLqJamBK+gGJnmTR/MxD0NFSoQEepTkCk7W38Qayi/zDhjq+GFWEK/x3zxWkH5BopstCWpc4VxBeHKtPlnAo4v5J9gF8ogJzgRfelx5ITBEGb7iTTf4EuLvc2ARxx+k4e+JMnLv/007fDYCByTCS+zuirfWdN/AsBFGtkBSh56koOmObaW6BQ1+ztxr8TSQXetyFs4TXls9HeQ08U/V+szPPoGZq+cJfsqECO0kuLnh0FDsTTMwNizXRsSqFIBTvPrgWPWyWQaC6BMMzQKKwsO3ArW2Z+EMijse1M0ahys7GqS+JKsv7uemHmPs35rq1PPP1GBj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2jsffPqxOw3PuNAC5YQSaDxzZra3EY47cSN1+KTtkQ=;
 b=c9GFoIDQ7/wFHeCgRmZl9JcTUCY94lQLb6S2Fb2B+AYcCyRebXra4t5u6jL9Ib03Kibeq/I446gNnkjO5ifXSvgtzBhSRBknocRfn0QHE99QfUTKmRgihTkiuVrMODvnWOeHs5Ou9upY8DHcHiRb5HvXNuBGYwY7SpUX2kUh8Dlamr5cd4I3smt5jbQQWAxSyRYzvu2jhVaZXZtiSR/nbdz8D08u4gcCneWsdqP1XJUimFG8Kh0bvTbi/iyBQ3LyjDSPw+TRp6qBcn2PBCgvo8xU8ZAayyjyiIJRccrR/dimQv2ks7ySsu4Wrm22U/r2GM4RZ2Ftlrsw5RvhyyCgeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2jsffPqxOw3PuNAC5YQSaDxzZra3EY47cSN1+KTtkQ=;
 b=EsmuGJfezaxzaLfpt/RqFEnjwe5byaLD48BdHt5oPKnLVmbn+YgQ3GnxswK6VI5UxcgWlyZI0N4V7gdg5NR8GRzOgwidWriM7WYns8s877xSORsLOPF7WxS9aMDdaHqI/xY9tH/+2wPSbE45FpQefBtBU875ELq3SsSYB0OgA6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB2785.apcprd04.prod.outlook.com (2603:1096:203:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.24; Thu, 31 Mar
 2022 15:49:33 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 15:49:33 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH v3 3/4] libirecovery: add recipe
Date: Thu, 31 Mar 2022 23:49:11 +0800
Message-Id: <20220331154912.1456-4-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331154912.1456-1-potin.lai@quantatw.com>
References: <20220331154912.1456-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0148.apcprd02.prod.outlook.com
 (2603:1096:202:16::32) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9bfcaee-90c4-4f6c-26c1-08da132e0ce1
X-MS-TrafficTypeDiagnostic: HK0PR04MB2785:EE_
X-Microsoft-Antispam-PRVS: 
	<HK0PR04MB278528F69E918E155C8B49D18EE19@HK0PR04MB2785.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	elM6ZAxT+U98ou/Om8YGAFZYYvtOY+Pe7Zp8DmV/AKUEN0v5JQCMf9GrX1jM1IdZp1+UMPmXaX9Oo3fsFFCiyJYyjkhCtiMgRXG6JQOj2Y7HMLOqNIgf2H9Abni/CT8hq8G903lLQDx8epBC03o/IbfIZtX8XXtTnx+CcnM7Jet31fHR6VrXva/rzxWWVaMysIu6Rw9dNkOx01OjvtmkWiG0uD0a9n9M1yYLH1JnpBg65KkVguqAzEnUV4vCGm6ofcySaI8lpNx0WQ+Jzrc0EYQ6f5KJlo7pn8mL3bcUNuw+RuLAAdKPpADhpbuE1XJTbfU7y6Xxs8vGaDlsUOJwHHubscOlvUaKutdhrOmlL+t9f1XpiwoNtWmQqo/vmovQCQEqUUmlioAyKiPH2qpyq32X/AOkfvy96ECHKO3PD40/QsSgPiMF4WH+QcK7D++uWqyUikgjeVxlGdTXDWJpa7/g0TIBV0AoHsNw6RpQhiOC/l0DhSK+P6LPttofcMwA8LPrUhM/e2zFPGiD+S68rTrrWpyfjIViYCJy9or40kjuO52dlwcJCOLFCCV5cD7CxOXT0gJHY9IaQqNd4fA+3NLjB8eYQUwPRKIKPRU3MyqKQamUUu/WyOR57QuRSTiyIWL8OWvvDrESQcaiZPghEu11mPheBcOi/oCpQVNKy9tBMtOYjOddpe9BDCuxDzablnRpt8dmXWCJA1eBQrcASEF1D1KxOtszLYGidhS6/4UNBXv7vNqUYWIKs4+2xFBiayKLQJSE4oMS6TTRCBGeilg4NPV9waNCVDFUuHaDOQg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6916009)(54906003)(186003)(2616005)(26005)(107886003)(1076003)(86362001)(508600001)(6666004)(6512007)(6506007)(52116002)(8936002)(36756003)(44832011)(4326008)(6486002)(8676002)(5660300002)(38100700002)(38350700002)(2906002)(66476007)(66556008)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qUAOZfXIm4JyE05eKhqKCd8AQJr0Dke+LkxEfI4h25IZRMJtJ6jJ61VAgogw?=
 =?us-ascii?Q?68lGejTGyUAov4ct6mX7l8kNs2dupo+46Dws1AOZQpvV6V0RcckOsSmwImXu?=
 =?us-ascii?Q?jSvQOgHVBbj4MoXJ9uVbqYzKMGMnZ/yCtnbk47zZM1HYPdDeJfkyqXP5D29Q?=
 =?us-ascii?Q?CZD/I+RzVbMPiaRvMuyxmdhkWgfHJDvSPhBOLdv+25kvDxq9bP0y4AmYokJU?=
 =?us-ascii?Q?7EnHIhtwdR9i8t3DLgMKHYYLj1eKN5tb/TxeLdGQ5uk83WtbsSCMSJvHMuIg?=
 =?us-ascii?Q?P5CEWaUGUM3o25KxUpbhdtnAB8A7HI+8DOrHifDFtTJQ/ufOJnue+9c1icrg?=
 =?us-ascii?Q?YXPC8yjKqQW58SSFBKvF75kq4I8J9VHgZZCUkZRo1kMMSGgnhlBloppM7XRQ?=
 =?us-ascii?Q?r9nDqcDmvhOn1WDjvLGkfxCkh2NFz009LzofdihZ8CFODEmAwLO6aeV3oAmd?=
 =?us-ascii?Q?tDgyf140xxgZ+MVJiEN0uvoOeX0ec40uXU2Lv31tdZoyLcTo6EQaxL0MWeFR?=
 =?us-ascii?Q?IjiljakHRwB8Sg0YhhBSr407hijKJtNDOOJ0NllT2P17RzFLIDa7jfJSWAA1?=
 =?us-ascii?Q?AUkknc8H2/+qWx7kLx84wdkOyKMWzNGiEzNvWYbU+wgRWICp5gS/kCKsKAF8?=
 =?us-ascii?Q?M0ldSGNwfPaW4oP58tw4XB6+RzUE0FhgWeV/w5i6usEfFUGfb7zQy3RQcQV3?=
 =?us-ascii?Q?l+gts02FCWJhf56BG1W1SfREWzIOfjNua5x/PS51cFOf/dKBQl5N1RqJvuZk?=
 =?us-ascii?Q?H9Uf28wvoXZyfF14Fd9A4bWNc4xA5WpGEleY9+uaZ+Z66K4JsSjXUUi3NOG2?=
 =?us-ascii?Q?FTNJInHK/ryu3HX5AueVvwp7F7PjP+OdYVbOxfQh+Bai7frHbMEsWAKxHg0w?=
 =?us-ascii?Q?2HQIUrCzQgdI5emCpKBqHYsMdrFTbOk2/yEPEBeMfjPluAlUSsjOCVIsj5SG?=
 =?us-ascii?Q?fzpwbcH7Kv1vXBrvJyci6u1mFLzaW6YSuVmnoTAS4tWSyns4ovYSJ5YLuoXL?=
 =?us-ascii?Q?X/an4pcPahBpFOpChmtULvverF4n5SLaPfV4s/CY9MwfpbbUOGRh6A0RRvuU?=
 =?us-ascii?Q?+fqwJgk8FGAJ9A06Xy/E56bOXd0ygFlsiGx44LJ0iCXge8N52mKtTSNUm8oX?=
 =?us-ascii?Q?Sm8XtIBxuJNnNHnS4Elssxv3lLyrX6FG2+colWbFpkfuwOFwCOM6vRqa13EQ?=
 =?us-ascii?Q?usRN0MGGb5HFYuh9yJUZkmV3sgYIbGHgyVlyYs4zJDA1bt/ZkcuzLxDGLaXS?=
 =?us-ascii?Q?+ThUGSosVeJ286tLtW9t7MPbHpl7nYMpk1L+s2+srRY+9xN12OwT5VT1JCbi?=
 =?us-ascii?Q?/SC7NY1aShI2OFWYMo0QJB9Ai3FwzBmPmanZDTsbCUJjBtZ+uGs6acARJDnD?=
 =?us-ascii?Q?5xgEmrynQOcou5SVO1OqV/QXWhZclVkaR7Zc1Mmy0ceA2Y1DGEDl2zAiEFAp?=
 =?us-ascii?Q?SW5bjkzaCT0KV7imGS2uS91Y5L26OiyJvilUkCuVODbQxN7b6xsasRwFdcPF?=
 =?us-ascii?Q?w2/QeA+F58xkHL99p5vn+v7Q8r4s4zRRcwpsugt0IdGfTNyqWehhvmUz6yHt?=
 =?us-ascii?Q?YmTYzTRxFMKhv166zJ9B9v6Ecx8LWuuoUdHLh7TWo9fKYWYMCTws3A+cHEEx?=
 =?us-ascii?Q?TuRSVNPSiuABhL5T3C9P4B/vkOX3nMFLU/AYx5IcSHh2fhaFXW0L7aPp8wjk?=
 =?us-ascii?Q?b1himzi/LFCQYijoq3FADCZ61/RHyhSBVw01ZHrHDOrfSKRFolRuAtvtDXL2?=
 =?us-ascii?Q?BzktDY+LkfKKZJz7uRrtTx395fXEBQ0=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a9bfcaee-90c4-4f6c-26c1-08da132e0ce1
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 15:49:33.2789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Rdz5dQxAvi6yeewnt5IB5UaXRyvltPxGVxoPPKfddTODIFMbRdsnmEs9T9BopxgZ/S2DMR1v26PydhggAwE4AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2785
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 15:49:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96295

libirecovery is a cross-platform library which implements communication
to iBoot/iBSS found on Apple's iOS devices via USB.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../libirecovery/libirecovery_git.bb            | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
new file mode 100644
index 000000000..c36837aca
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "The libirecovery library allows communication with iBoot/iBSS of iOS devices via USB"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6 \
+"
+
+HOMEPAGE = "http://www.libimobiledevice.org/"
+
+DEPENDS = "libimobiledevice-glue libusb1"
+
+PV = "1.0.1+git${SRCPV}"
+
+SRCREV = "e19094594552b7bed60418ffe6f46f455e6bb78f"
+SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+inherit autotools pkgconfig
-- 
2.17.1


