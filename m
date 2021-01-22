Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.85])
 by mx.groups.io with SMTP id smtpd.web08.7179.1611310630935105958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 02:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B3dqiqVw;
 spf=pass (domain: windriver.com, ip: 40.107.75.85, mailfrom: zhe.he@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6I8AAGEudZ9ZGZUcQbCwcWpikvxPlVvVyvTyQaFMt0ZcW8O5T7wgNZNC2g88QXO4gUp8BBTcmihtmEg0dpBTRIX1qqSAU3i9t2peZXr5dMKcbYZKkYue1b7F+gWGcGumqc1+zT0FW7Pe7jLoBAu9nU79eWzdVWNOUQk/9HoP3K+TFAySBV0vjC5+tOdwTOg0YBSU7vNrp+4ltMQdHyiiIvUHma82Z8F0PMH14WonoCiSuLh401Djl7buecVZBicQy5PVpTdCSpoDIEqloGlJrM5m2n9cEO++g+NFb5ru0JKf8s94FbZLVbkpFdSQYT++jTrjCtunPWImiCCzKBDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0MbjEUW+rK/FSjwnOoLJCGMADbKulM+aLUphRe2MNY=;
 b=Z73yvQlPH/S6N41UVwc5x3WBRtw3hHTmTQWo6MKptdZmvHw9LFkl9say/18sthNxJxZbR5J/bj3/cZufAKhX19qV517AfeuNJgseizpsuSp6SjBaW0nBg2UeiPcsr0YCDHYq4aVZ52o+VonqCTb5F2mfPV+NuQBzMSNPjYgXktssHfDH8rWlfu8Vx8ZKVmy76HnSP3c8RS8iAmYlbxsuksfH0/goVDSVswoOBgg8X3QLTkQIGtcyaSys3CVTDZ2l2kXQc1VtomCI0mcJInY47bL14iXDrzyblNlZ5W5uwuujM53TK2oLBuNBXxYP+hTwg4nW+nziVx6pHt+aYWd5LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0MbjEUW+rK/FSjwnOoLJCGMADbKulM+aLUphRe2MNY=;
 b=B3dqiqVwo+pzfJ5rwKOiQAXHZzEaKXO8yOl18Y5RgSVyfktkrPJQqEhYsKNl3zrbFkMS3jbkKMeNxd0xjuCVDyhsX7+9UZT/ONCEpW32aeL8w978cjBuCykVnI4BB5ogM+uLGyaIBTAVLvFf71KZ3rypc2Wzk0jsBhfaT2vl/po=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3360.namprd11.prod.outlook.com (2603:10b6:805:c8::30)
 by SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 22 Jan
 2021 10:17:09 +0000
Received: from SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::f013:6c05:9f97:ca7c]) by SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::f013:6c05:9f97:ca7c%7]) with mapi id 15.20.3763.015; Fri, 22 Jan 2021
 10:17:09 +0000
From: "He Zhe" <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] lmbench: lat_fifo: Fix cleanup sequence
Date: Fri, 22 Jan 2021 18:16:52 +0800
Message-Id: <20210122101652.46438-2-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122101652.46438-1-zhe.he@windriver.com>
References: <20210122101652.46438-1-zhe.he@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0055.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::19) To SN6PR11MB3360.namprd11.prod.outlook.com
 (2603:10b6:805:c8::30)
Return-Path: zhe.he@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK0PR01CA0055.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 10:17:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5ea1a14-24fc-4ad0-42ad-08d8bebee088
X-MS-TrafficTypeDiagnostic: SA2PR11MB4858:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB485809351D09429163783DEE8FA09@SA2PR11MB4858.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:152;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kC+O5JXh9nP3EeoXH+XHaotYGZqfBTcVCa2YsdmMQFjY6LMIXsNly+jlBCY+ZrNMaMFCcojOiUzWEMK13gTxtJYTfNZPsFZWdEO3zcn1Hj8MfbnWI9hHBGwl5V8Td0TZczMqJkZZT4/uImpbYKLPDRbUZX5J8+vddxzasgzN6QzM+0YwrbX3hOxbgaVxq1gCqpzOguTDL1xDXfAF2U5R8AMyVTmnsHkdD7QTd4nOKJdf5zjDVaKG3L8kag25oYpmSmZfYUJeZXNIQtBMj1m67m3jtfXwySrh74XG268FCVQR6sZMmo3xEAWV2VGIoBksathx+1MNpTD9mnWvRbh/R8kr8xXrR04ZOqVqcbgpqvqWW7p6E4WZYZUit4vfpMLj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3360.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(1076003)(6486002)(83380400001)(6506007)(2906002)(478600001)(8936002)(66476007)(66946007)(26005)(52116002)(6512007)(8676002)(66556008)(6666004)(956004)(316002)(36756003)(2616005)(186003)(86362001)(6916009)(16526019)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Zgu/vxtGqeZyGH8HaBLIi/WxXn4IKto1+ZZdRHqqseFPdlwxp1qCxPQ9FJ6s?=
 =?us-ascii?Q?zaKLii7dYTWloBWxgXG2cgp6zLQcPq4jNwoJ3R3JDe+Sc18Htci0sO/z+QHa?=
 =?us-ascii?Q?EceVHsCsdukDUIvHnvNTQ9pi4mAIhy9g12ED4mbpyxzu+rIHK0AdEHGWM8Xr?=
 =?us-ascii?Q?z5IOZnEUGVmvcSMiMxwnJJYfaOj/q1wSOv0glEvNJWKgpdfloS9VqI5Ucwid?=
 =?us-ascii?Q?ASK/tQXLDYP0buhibwJY9yKfg42bZLWtZ4zcBJGtWBHpX3luIYAY8Nh+h/J3?=
 =?us-ascii?Q?obcGCR+5IncyMTAuPn9SvgkksZI5Y3hVPgULPg7GV6Qocuh0nFUWTqIR9fYZ?=
 =?us-ascii?Q?9GcK3u1y1TSFocr+f9gXza8Fo3IFmuCNiZOgJhnfH6VbSKfmlVjVBSphRg3F?=
 =?us-ascii?Q?RrdcYwOZxQnBI/w7/98tWATPUAEEhmp43jcZuRqUx/Wcj+uinAGaxEjHSB7V?=
 =?us-ascii?Q?Q/JsizoL26QqPTh27+jUEPTfX9UVVDnwnzFbmRbW9u2CyA6W3SE3WanIPjGo?=
 =?us-ascii?Q?W/e85tBzrxoqIMnPIb19houcuH3mlKfL2sOqeRPZ6V6nHQ1WOtmeqTahqdyb?=
 =?us-ascii?Q?djPmY/BVmO0+1qDFDoDtzRugG4/iY2ACGA0qflhZ15jjOFbNduNJH9HwTho6?=
 =?us-ascii?Q?JNjuRpZo9zR3jxBI9R0GzfGIQOK5V4RPg2g4sMN4FQLKJp4vAEL8mcusNxWw?=
 =?us-ascii?Q?L8hWhHAeYtlZ4biSZsY/72hh1xbWj1AjfpxEFBcu4bYnxjm8QRk1h4eVzF0j?=
 =?us-ascii?Q?0l4yYXE2BPdIp5wOMYUD3dzinchDCAYFoh7jNRetnbT7hrZd+2Jhc3H3o8im?=
 =?us-ascii?Q?m37DFH3vLW/9ir5W/FXhHjE0yOOhBl6t1mp+B784IBFSLqIikaSkUyeRzWHm?=
 =?us-ascii?Q?cSQejYVKLoD8HikDovXM9uqLxENW5HkrnYJxpqqqSMgsuO2wqrcLNHa83PDB?=
 =?us-ascii?Q?SOpx+EI/aucRcecZWG+8JBmLYQouEuh7zAOQOsbIlt+Hf40Tb+kvPdtm0Woj?=
 =?us-ascii?Q?/Ll2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ea1a14-24fc-4ad0-42ad-08d8bebee088
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 10:17:09.5134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqGm1bo1bAByksp5/T6wyIwnAq0+/EQjZqo3rTUpx7Fkfpe5gCEZ1zSFioJ1edvAHqoLNBUXC3gRbjdXesAqyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4858
Content-Type: text/plain

Files should be unlinked after all users exit. Otherwise we might experience
(w) read/write on pipe: No such file or directory

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../0001-lat_fifo-Fix-cleanup-sequence.patch  | 42 +++++++++++++++++++
 .../lmbench/lmbench_3.0-a9.bb                 |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch
new file mode 100644
index 000000000..42b14cece
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_fifo-Fix-cleanup-sequence.patch
@@ -0,0 +1,42 @@
+From 78912c0ac5e090095a2f2bd6226e02cce949e72e Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Fri, 22 Jan 2021 10:03:38 +0000
+Subject: [PATCH] lat_fifo: Fix cleanup sequence
+
+Files should be unlinked after all users exit.
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ src/lat_fifo.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lat_fifo.c b/src/lat_fifo.c
+index c625161..85bb9d1 100644
+--- a/src/lat_fifo.c
++++ b/src/lat_fifo.c
+@@ -120,16 +120,16 @@ cleanup(iter_t iterations, void * cookie)
+ 
+ 	if (iterations) return;
+ 
+-	unlink(state->filename1);
+-	unlink(state->filename2);
+-	close(state->wr);
+-	close(state->rd);
+-
+ 	if (state->pid > 0) {
+-		kill(state->pid, 15);
++		kill(state->pid, SIGKILL);
+ 		waitpid(state->pid, NULL, 0);
+ 		state->pid = 0;
+ 	}
++
++	unlink(state->filename1);
++	unlink(state->filename2);
++	close(state->wr);
++	close(state->rd);
+ }
+ 
+ void 
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 68c7e7b4f..21e81ecf2 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -28,6 +28,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch \
            file://0001-lmbench-Point-webpage-lm-to-target-directory.patch \
            file://0001-doc-Fix-typos-in-manual-pages.patch \
+           file://0001-lat_fifo-Fix-cleanup-sequence.patch \
            "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
-- 
2.17.1

