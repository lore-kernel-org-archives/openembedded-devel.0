Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA0AD462AC
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:25:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.71])
 by mx.groups.io with SMTP id smtpd.web11.12548.1731507931700594756
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 06:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=MTPoY8DT;
 spf=pass (domain: axis.com, ip: 40.107.21.71, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qa6VZ0fef8nBHZnmALCqebwb1gXYOFrisquk+dC9FUZmTr76mEESFGrx+x6rTGLiBBcwOXbLbczoSiWQV4mcJAWrUwzfItcsXfyBTEF8k2yJTVfQghEcBQgZKovB736dyeM8BswWWepqLl4pJwrQhouUc+gQhlnKHZXynAUOYC+BsfQphz5xPUDaCboSmF8Yl6Gc6H93LlrSB+6H/UfcMAdfV9pD2Cj9ejT5v9n9yC9bnKG+MiRw8Yh6jEWUiN+lTdBeYxVNniVAaCYBYhmw+uS1UpHSEW4UX6ztHzkxDTcquLZeBDg+FZ8T1UXIISSjZlNd9N4urDpA575Xy2Uvhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wohz3ln0n7QMKTjEVc6HiIMcTtbhwMDA8YjK+ARH07A=;
 b=oWnBvVenJG5Wd54Wozr4GvPjkD7zMc35KuDuYIZRo4Dbg/50HYj9geTdFRu4EZar0X4idizIDYJieHMsLCNsog7kevt/sgjtbhbG1GGlf+J8+Tk0npq/7mUkOLIhpAWDehAoW/R1IIO50b0M6weLYRxhVYLYy1SPr4qYT59Z3yUplQMyCSiXAnnGH96HS37U1hav8wjvgAUpBWIm37fEjNskOGgmzvuAhs2gyI8H7G6lzsSDy8MsKyp0QWsF8f9YOYX5wYq9PtJ/kDqGBmfgC3rixr+2oV7Ow+a8EV4u4XYg9I3wbT0bwwl0aICZ8yXvDLeXn0F/JxsGQnPyYqXH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wohz3ln0n7QMKTjEVc6HiIMcTtbhwMDA8YjK+ARH07A=;
 b=MTPoY8DT/OYHSf8QRa2jJRHoBA4KcSuu7BxtOMO/3bHcx3ov/NZSDF7fqKfgUMR7T3ie5gxpTVAnJ04Rb4J1+4Sg1kjoDty8v9Nu3VdBL/BjKkY2Nk2lRkxceBjT4UEkqg35BT1sIcB85JGT2sMDqt5QrgmRS3BVDvm2ZL1DaBg=
Received: from AS9PR06CA0415.eurprd06.prod.outlook.com (2603:10a6:20b:461::19)
 by AM7PR02MB6323.eurprd02.prod.outlook.com (2603:10a6:20b:1bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 14:25:27 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:461:cafe::b1) by AS9PR06CA0415.outlook.office365.com
 (2603:10a6:20b:461::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Wed, 13 Nov 2024 14:25:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 14:25:27 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:25:22 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:25:22 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 15:25:22 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8313C7AA
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 15:25:22 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] rsyslog: Fix the ptest path to test-driver
Date: Wed, 13 Nov 2024 15:25:22 +0100
Message-ID: <20241113142522.3113838-3-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241113142522.3113838-1-olani@axis.com>
References: <20241113142522.3113838-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|AM7PR02MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b14004-4c63-40a5-e6b0-08dd03ef0538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1N4WU4yd3rumuNK49ai6skrT6V2vSB6mHVV0k+IwLgtHsv+owaOV6nf81ezi?=
 =?us-ascii?Q?RfPA723fg4lfpKS0ja4/A+klbiMU+7NKNWgMuAiogI5ZLaRxhVNQhJzD/MuY?=
 =?us-ascii?Q?4hijrqEUfD7G2+aWveYay/oUGGPQXPYZOfPZpUj0psOR1GBpFDYdlMep9LaX?=
 =?us-ascii?Q?FrrmzKL5IdfwaPw/0C57CHhLZratrQ6ZSKYCUK+SJ3eDwYpB8hBQeBykrtfX?=
 =?us-ascii?Q?r4uDr0eg4WDCJuYfw0TiZYP/YVFKAklxnAtDhUQcRBWUXTZsy3bhl+qss9TY?=
 =?us-ascii?Q?S42Yc9YuQ8O06olU7RQTBcp5pAoY4ts2vEaxjl1U6dmM9+o/jIIlCn7Lhl0h?=
 =?us-ascii?Q?kecWbfTPqcMbPutJiIWJdoPQ7MOaJdlJ1RVs0uSpiAfNqBqGiwQIlNtHXhxG?=
 =?us-ascii?Q?tohQMu5vu+NFRG59xM3GLhRFvuwozuP+1acBpUcOSle6TwKgbwNQG+s8ko68?=
 =?us-ascii?Q?YVCff/Z56ifLYf1qnr44aJWB4eTJKFZuRHnM1S9UnM4Aeyiw8Hkpc7ePrFvW?=
 =?us-ascii?Q?v1yEPdb/zKN6uJOEDA5NgGAwgU/BKf8iVCJNWeNK2bt9TMK2bwAa6W2SQSkw?=
 =?us-ascii?Q?/5xKLSPhsDm4FNsdudR+8ksTHTWH33oqyo3TZdUpcr38meKBxwiwWkbquJSb?=
 =?us-ascii?Q?ImUWdpJKLTC4inJjHaqbahKkgXc8rvs0DOHRpcxifu9mUiV7M73QW1pwsnDk?=
 =?us-ascii?Q?0eXynOP/6VuloqR57MWlYJNaUs8n0KsNLJeLrE+3ZjrCInO3rB8MuUR5Kq1o?=
 =?us-ascii?Q?toqAXFnv0HRbQiJfIFU+IXYVlWD2SXwaZJ2v/fdenMkkfDyKimx/k4a4ebor?=
 =?us-ascii?Q?ysxVzCSJ7CJbKZ641gWaLIPkz6+a7axWow/LrZN+Y+P0A6vFXR5oxPdH/WlD?=
 =?us-ascii?Q?Jy0JZCpd2RQ1/gmySIUOTA+BJkcQo07Lj2XtAf3xJJK3Q5Mni5bZaW2Vsvd7?=
 =?us-ascii?Q?dwSMfFZLPFM0vd2vGmDf+8k41Av+vahS1egB863LQW5vYOnwvJUvDWsD/59o?=
 =?us-ascii?Q?4/+vakibCsNPUIDk2xwJQrqk5G5/1MvSRHf4XAhJSImDKz9Kn3E7wl+TKsjq?=
 =?us-ascii?Q?j5O2HHiA9cTk5jn4vyYVds2fLpgIBVtLHfRxPewH3BCva2pMzo9ltucMOXAu?=
 =?us-ascii?Q?wFD/nP0KlX6uefHE0S3sT65qVJRVFQsIVVtPYZRymSLqU1VJcTZafIMpng3F?=
 =?us-ascii?Q?TjqKQDHgHRX6+J9SL6bvVpom7jG0hxzczJUANIRblJFChrZ6UOdfIGuWByWz?=
 =?us-ascii?Q?mVWdj9kfqJ7xkTfb45DkU5cpCwMCd6uHIwe8huZq/52BbztwA2FfzmwO4Iij?=
 =?us-ascii?Q?DW1o2Bk+looc5DiO/3tprD3RzXaTRha9X7mw8l23PlezzT3/rlpgm6wXV/zR?=
 =?us-ascii?Q?I9/OfCALVb7tJdvfdPsJgNo6hayUtzYKkdeSNE3Sya8P+PmGjA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:25:27.5848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b14004-4c63-40a5-e6b0-08dd03ef0538
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6323
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113811

From: Ola x Nilsson <olani@axis.com>

Add a sed substitution for ${PTEST_PATH}/${TESTDIR}/Makefile that
transforms
 LOG_DRIVER =3D $(SHELL) $(top_srcdir)/test-driver
 SH_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/test-driver
to
 LOG_DRIVER =3D $(SHELL) $(top_builddir)/test-driver
 SH_LOG_DRIVER =3D $(SHELL) $(top_builddir)/test-driver
which is where the test-driver script can be found when installed.

The addition of this substition makes ptests work with or without an
automake patch in OE-Core that does the same thing.

Relates to [YOCTO #15635]

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 .../rsyslog/rsyslog_8.2408.0.bb               | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb b/meta-oe=
/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
index cf833de22..7d151bb9d 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
@@ -100,16 +100,18 @@ do_install_ptest() {
     # some tests need to write to this directory as user 'daemon'
     chmod 777 -R ${D}${PTEST_PATH}/tests
=20
-    # do NOT need to rebuild Makefile itself
-    sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makef=
ile
-    # do NOT need to rebuild $(check_PROGRAMS)
-    sed -i 's/^check-TESTS:.*$/check-TESTS:/' ${D}${PTEST_PATH}/${TESTDIR}=
/Makefile
-
-    # fix the srcdir, top_srcdir
-    sed -i 's,^\(srcdir =3D \).*,\1${PTEST_PATH}/tests,' ${D}${PTEST_PATH}=
/${TESTDIR}/Makefile
-    sed -i 's,^\(top_srcdir =3D \).*,\1${PTEST_PATH}/tests,' ${D}${PTEST_P=
ATH}/${TESTDIR}/Makefile
-    # fix the abs_top_builddir
-    sed -i 's,^\(abs_top_builddir =3D \).*,\1${PTEST_PATH}/,' ${D}${PTEST_=
PATH}/${TESTDIR}/Makefile
+	sed -e '# do NOT need to rebuild Makefile itself' \
+	    -e 's/^Makefile:.*$/Makefile:/' \
+	    -e '# do NOT need to rebuild $(check_PROGRAMS)' \
+	    -e 's/^check-TESTS:.*$/check-TESTS:/' \
+	    -e '# fix the srcdir, top_srcdir' \
+	    -e 's,^\(srcdir =3D \).*,\1${PTEST_PATH}/tests,' \
+	    -e 's,^\(top_srcdir =3D \).*,\1${PTEST_PATH}/tests,' \
+	    -e '# fix the abs_top_builddir' \
+	    -e 's,^\(abs_top_builddir =3D \).*,\1${PTEST_PATH}/,' \
+	    -e '# fix the path to test-driver' \
+	    -e '/^\(SH_\)\?LOG_DRIVER/s/(top_srcdir)/(top_builddir)/' \
+	    -i ${D}${PTEST_PATH}/${TESTDIR}/Makefile
=20
     # install test-driver
     install -m 644 ${S}/test-driver ${D}${PTEST_PATH}

