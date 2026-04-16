Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03170F433E3
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:29:29 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.97])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6804.1776317366841667378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=NBKAtOcK;
 spf=pass (domain: navimatix.de, ip: 52.101.70.97, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnZyVc3m2NbR2N2KJQoRY4aYGMNggfMt/aIvwvhq2Pjfes4SIu1i2Eg9K/k0ew4oOVbVTAC8tEIBA8cy1UdZdyBak3vPV516YpD2rYeQOax6rNYp8UnPLV5eg+UMrOFxiY26XYNgNHiYSACVlXkCpPiP45RawbDcHehDkZUgXT0NlaTAD0HEwjRu/q66tRsMKOnAbTN6kcakbHuhNYkBdVSxM09SaioLEgwZRSl5ZFF5SnN8RVAUANySeGLx2i0NNV834KY2T3O8Su6NS8UhFH6svwqMui/pTNcPzjcMO5dsA4CT8mMl1/v82JOE54YqxVpBM2bLVvqBMsSBkjLCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSlWYwSQh6G7Uw104EvWXgeZh2enIhzD+rllgvNYTGs=;
 b=H4bXGlgRHSYBH/5tIkK1d5cXCy6IthO4qoU+4AI4+xfLbNKdH+S0Jml2Mv5MYBfFeP8IlqBM9Lc3PGzf9CvYjfVNnMfcL6tjZP1oXKOqxeH3bKoxxRWYVNnsuO40mHkB/d81fAHbXh6KQql4GNM8znkioFTnc1FMsf4AcSvm8z3mvnmIJ6E9zNgLiWVos5QEYhjvHcFXsBMOHcmaoyO1UHLrrC603Jzo01yveFDIcq+zh73E+n0Vm8Y3SBojtoNAZdw3WjG2+CD/+JIga2VLFhh/hlBej7WKOMfpMeVzuBosTLdw4upcQq75qA/+JYY1fJZPbGNLVzdvBeOme1TrEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSlWYwSQh6G7Uw104EvWXgeZh2enIhzD+rllgvNYTGs=;
 b=NBKAtOcKV8E0XJtgTBgjBkBx1W3pbzk9uJUWdGNVYtCNx/cxoNTX+6/Mzvk+N/vz66C/EBqCSqXho/JnpjIooQ/cXV3Y/zu48lDSEgS9ztxgCWig4TZfR5uG1dMVpHib05T+V04NNruIN+CpSt1l4ZCoTcID+vdX6TyMhUroxOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI2PR01MB11455.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:275::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 05:29:21 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9818.023; Thu, 16 Apr 2026 05:29:21 +0000
Date: Thu, 16 Apr 2026 07:29:20 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, rs@ti.com, 
	joerg.sommer@navimatix.de
CC: rs@ti.com, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] lshw: Fix binmerge
Message-ID: <b5efd9a162f11bc1c149e05b9d03f26ca62ba6b0.1776317359.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::9) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI2PR01MB11455:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d96b4b-b976-4e57-f49d-08de9b791d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ORHAtEOccUPB0gNvWSRcUYqtbWAEzfCdDDRiI2A4tVaN6c49lp6qCrawSG8Ih/88ykYe6HN1tq+0Lg1inM498YiE9HOuf6OBmlf3yfXj/yEnCWXHVjybv+Guwptb8GJY4tIythXGqWy+uw670caCCq2veZ20rH9a7osHjYXL1Y1o/iqcMiM8oUNPVvbbnxvsau9KLCcqgz5ov66g+vTcv1Bc4Z0ghjpGRfO8zxaN/6kmddPn2+CcV6A6DE7wmZE3E6e2bT8SBnwkWFu6lFvXCUX2uR4SzBYv3Anf8bnQzwaKS9D0aSzj9YDSt+f3ka/Tk4Xu35s5OLaLoriEL0kgMzNI0foLBBtzlZv9UNUpiIsndEEK7+Jioz2cRaAwLxHyBcb7LgZKOJ7CSPD1oF+n/AbNgbySe+MsFXaN+pDfL+m86MmghW+OGWfHt9UuNrTb+kLnv77fWHcA0INfPFdacEP5LkCdohQSL/fvfWocvKQBj26ZFJkm1C1sgR7iz+CpX4CFCmjAP2KC/XCpIfqjkW2WFEiEsu+yBLLk078dTA6IJ9rjbjbvuR65jHiOOj6EVQ8V+mLN17EQQmqoSiD49GjYzEvov/ubazQ4P/zGpOmdyZzktzEAOrjA4lI/ay19droEqeihud2BvM27o/xtVcXkv16NH6X6DZPaAn/lFLor+dpNY7i61rI2aNpGM9yjaI3o9DJzP88mGiOduokHCOWewS9Tv7jWr7WKQlI0F7k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9gGi2u/TU5Vbardx0GesZ/tlDuC8BqDBB+xgQ0uQB8HSUwqjmfh5SoqvV7UC?=
 =?us-ascii?Q?jUaBGQN0lW9b5OVpCJJ5nE58Mq/YUa1D5xZ4L5SkDVTJp5qSX2z/iMQkOg7X?=
 =?us-ascii?Q?c5NzUKZWbLKlXmv73mgkwfuQfJKkewsyb63AkyTGRd4XSEx5UYye/G3/wN3b?=
 =?us-ascii?Q?jnW+YkazwncJF5ki5NpvmrS5KKHav/O2O9mn62MeX4xolvHoLsXkQNcFV0uX?=
 =?us-ascii?Q?4KsmiuZxhstXocSJaLAttaWOAxNZYkmqQzPFm97lZIDbntlrEvsAk0YsBe0T?=
 =?us-ascii?Q?9q4OrbKyLtrHlnbIVKoWFJ4FZvk2FWHNwRq+TRGL3l1KYXmsDsbBtjEuGamo?=
 =?us-ascii?Q?q8RYU3p/1Iy+Cvb3V+H15DKkdH+duBpTOZlR6aXiRT6XTS6ymzZMr5l/03zO?=
 =?us-ascii?Q?2z5IfaDP0GDRy3WWK9qmZDLJj0tMp/6P+zQcjQ++x6+1w5btGZQoYQawC65F?=
 =?us-ascii?Q?CckFC24zeBRJ7RT4iAiFyqGKWyKTNZaJ89Wv0mzNtN6Y4+YBDrdNNTjOg1iR?=
 =?us-ascii?Q?oCymaPAx7PMUL8opcTubTGpl2R09wgksdL1cn8445lT0cvEH8LL2P9a1UdUj?=
 =?us-ascii?Q?eYuICX23Z2E2IR2Fx8hlJNlSWhFTBhzWum3/S4ckBJilLjnCBZwBVV6DWMp7?=
 =?us-ascii?Q?1kFYuyVDpGwN+EUisLV+n4bozPQKH9mOcIEBDt1ZcPyFjCziM6YlTGn5Oc+b?=
 =?us-ascii?Q?vQEMuHMBLji5iDe2bG2yQ8a/WBVjqA4AcIcf08/X+Tv13Y3UzjOUEvs5RU7m?=
 =?us-ascii?Q?PgSWWPVtQqS/DTQ5J3kl6uOvmvW1z4eo58RJWeTLaB37HOo+lPxDKjZL0NON?=
 =?us-ascii?Q?T8Y65trBdUvQVkDkUZt+x0mHoRWcaTVn0YTQLLhPVMNrZE9PUVPRtwa73tYy?=
 =?us-ascii?Q?3Gm2z4TYQzPM6nVDHMgEFyAzoWvpjwpxO0sYuQSNT4dDP1LplZ88VGeOOL78?=
 =?us-ascii?Q?K/4HTtqaBDEfO3GW5Vje07XY+i/TyZHC5enJn3szUdqQQQ3wdcO2LiB64Pod?=
 =?us-ascii?Q?urxIZrKoAlT/Ok2vKs2Z+AmoDOaONzkca1rcDbbI/1YkNAmTSOJf/zFUQE7a?=
 =?us-ascii?Q?qiao93tPv96a+UXdQMnkgeFY41kNb1mzcuhgaXTRgn4TPnI+GRRJO4IpM3lv?=
 =?us-ascii?Q?Z9IkLhTTnMw4/8gi0ux8CIbBpHiNLlb43FuH8cWHRde2aqqERUtyruNEMwQq?=
 =?us-ascii?Q?ZVO1Yy8mV2WSYvvnsZe+8hHpcnV+7k57y2IRs+ky3ruiiptTPkDT8lu4XgGl?=
 =?us-ascii?Q?kX2z6/JQaEjyQ/VcibsxV11Pm3piU3Jik9neAwo/gTrv1GW5LtcuBYr/m3fe?=
 =?us-ascii?Q?u9cTuPUH3MHOhAK8ElZDG85htecHA2q8RMJ6oj9WVv7ooSOYzMnxN6PgBOXn?=
 =?us-ascii?Q?d+ZK8ad+QhS5TqgjaaSi/esyX76pghz5VevloDF65imMX1Hu4bsDSJhzgg1W?=
 =?us-ascii?Q?hyAojkWwqy+S/+8qguI4gvOZ7REir8CjJnr4aS7RnywIJYKB94bVc8fsmf3t?=
 =?us-ascii?Q?znDqAAulgh9mTPmghYpPEDsGZe19UfkvCWrJAAYFrroQLpRS22Jk6b4HXuDd?=
 =?us-ascii?Q?aNYe+Da9AZ5ZoZAwU6alFmVz3u9EMvRaJ9Ozskg48qk/E+AQ81rQjDhNciWa?=
 =?us-ascii?Q?GHUkdBsOGzBSmRCHl8IPDkgn0BwUYY/waSnlFD7atGiWlXCepT+qqoAIbA2n?=
 =?us-ascii?Q?SU8KsIbf/1WGZ5YH9r2i5Qo9U63yXrXVMlbMTdEOJChgK/nLu8TYMH2njvDc?=
 =?us-ascii?Q?2JjiHbEi9dPc+ChMDZ9QVTIt8pcfKho=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d96b4b-b976-4e57-f49d-08de9b791d0f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 05:29:21.5868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpDkC6Q5Ojbv78eLSVWrocPmjb8YSCmlJib+X0rRqdYRiVNUlsR4RF/Z415mKcgZBLFXlWZhbtG1SxusYrIH0+sgJ//DOwiDk+KfqPiKvSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR01MB11455
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126377

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

In case $sbindir =3D $bindir we have to pass this setting to make.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-devtools/lshw/lshw_02.20.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb b/meta-oe/recipes-=
devtools/lshw/lshw_02.20.bb
index 95e2084255..2f1367341a 100644
--- a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
+++ b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
@@ -32,11 +32,11 @@ EXTRA_OEMAKE =3D "${PACKAGECONFIG_CONFARGS} RPM_OPT_FLA=
GS=3D'${CFLAGS}'"
=20
 do_compile() {
     # build core only - don't ship gui
-    oe_runmake -C src core
+    oe_runmake -C src SBINDIR=3D${sbindir} core
 }
=20
 do_install() {
-    oe_runmake install DESTDIR=3D${D}
+    oe_runmake install DESTDIR=3D${D} SBINDIR=3D${sbindir}
 }
=20
 BBCLASSEXTEND =3D "native"
--=20
2.53.0


