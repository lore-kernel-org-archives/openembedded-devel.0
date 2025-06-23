Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78740C77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 09:12:58 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.13])
 by mx.groups.io with SMTP id smtpd.web11.15593.1750669968824307684
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 02:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=jl/Ewr7e;
 spf=pass (domain: axis.com, ip: 52.101.70.13, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0+wCvqlyVdgYkExqbEW/I/EjetExq+7V/xixGA2s5AOFO6Cv6Tq4QiQtbV9svM+0i5Xxd1aQqyjL/aSFgfeHUlqs65Q52HzqQ2avHFrWtSEpohZ0GLdTuoKKXm1OUXkIVpoMhjqAWDP5opgTUnn4cxR1nhiqReNkV0XVuIl8iNaRByvF6vseLHZJbrY4CxDw40daAWYo5QvNYn7T3Jt6A6rj5MjT2LkLQqRColw3OIStCEPKnTVTUhXkjbB8ijE9rJm17zmQkiAWz03HBz55Dr36OwdRuuSbXgVD+MXTRx4MfU8EBXvwuh/D5oVcfwub48sTl7XlVGPl0qsqYNt0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjzkyxYsK2O5aQgnzH5LWB6aYGyq/4K6D/l5+7gGLdQ=;
 b=FI6GBPCqZWCWYWQE10qivvX6dee7rxz6htQLYnXFX2Pea7g9CFn+o6unj6ZwM4JMlu3+pkrORLDdhqkGh8LvXRXvZzV06YOE0INeNVPqrwpFl36AQRNU/8KmKge+ard5zabXlBhPqos2D0aoPEM12SbQ1JqV0dVb3v7qDsH4KTUbcLBSao5H2CzeBYZxIqqieuQoB8sky8h+w2Sz6v8NxaKHhoKA6y5/w+8edLaAhrY8EZAbY+CCg27pLmtDGWEhiS74p+ykXWT3qZw/3fBLkG7SrJR84/hKmFhyO/5eW7q6xfgJ9t4Up2q8pWRTYfqCoFH4ZMzs9M5IBuChPjkewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjzkyxYsK2O5aQgnzH5LWB6aYGyq/4K6D/l5+7gGLdQ=;
 b=jl/Ewr7e3FfK3ntZJiVfQAcmnYxW6oYkfuizWacmenqbc7WZvRL3Tl4XMpW+ZkRwOFvMpMrQH4tKxU1h+IF5euO7shjGem5UZxGJm6fdUsZXdrV8RtzCMPhtjyg4QAIN7vpU14U5aOVMeDu3BFClsSemFpYv6pdeQMgaqrlExXc=
Received: from PAZP264CA0168.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:236::22)
 by PA4PR02MB7040.eurprd02.prod.outlook.com (2603:10a6:102:106::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 09:12:43 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:236:cafe::f5) by PAZP264CA0168.outlook.office365.com
 (2603:10a6:102:236::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 09:12:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.1 via Frontend Transport; Mon, 23 Jun 2025 09:12:43 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 23 Jun
 2025 11:12:43 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 23 Jun 2025 11:12:43 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 780192954
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 11:12:42 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 13E4D2597689; Mon, 23 Jun 2025 11:12:43 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] influxdb: Use GO_SRCURI_DESTSUFFIX in SRC_URI
Date: Mon, 23 Jun 2025 11:12:43 +0200
Message-ID: <20250623091243.2256836-1-christli@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|PA4PR02MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa464cd-9334-4b5f-05cc-08ddb2361ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hMedkX8DZpG4sQVZAs7mnovfmyNzunH5Tvku0dghn5kO7RJdSVUO7XZVZ1Mj?=
 =?us-ascii?Q?Rf051Y//mOC7kwQLMLkGdpFIzxIz3O4cXmO9mlwkwcHfTXgUprI6fyrayHxk?=
 =?us-ascii?Q?XwKs7qEV+cp9od/6YRa95cTxgjv1+8z+Pn2oidzw07HKA7NH6wRSMh2gSZOc?=
 =?us-ascii?Q?JEgDAvTZ8Ad0szPV9qOdS8soJihlM/H8M7VgIu/V10SLtFHV7uptL8veM/3D?=
 =?us-ascii?Q?2qRc7+0iEsojM6tVXXI6iBEd18f/16Br49dKTOVsNzqnX6t/2VcqXl6cMqcQ?=
 =?us-ascii?Q?gFcsI5JZijE9xyLhpb/yqNLkTVvKIwlJEVflTyVyUo3bgiurjo/7Ud8tEdBv?=
 =?us-ascii?Q?E4o5jTNFsG31GBnG50fKINVUcoqxsP/v9/fuP98wduRjfNos1l8KUwJsytFV?=
 =?us-ascii?Q?vJnXp7n/NZDCkeZ9FKBZiDx1CVn7eNW6qrZ9SLgXTvqxRBe/TCMjP8eK0bX9?=
 =?us-ascii?Q?KrTlP6irK71k7ga2O/kcmsNWjZp6+FRWndGgDa/q10QV24SLrWOdFtHkkY+u?=
 =?us-ascii?Q?SZByHKmzs9MNAW7sd2wKp5FtSiUmYmfP15x7tIlIkL1wyu4WdgVgcjYQT0vF?=
 =?us-ascii?Q?k0p6cFkBILPJlo9EM4QG8nr2kJi21C3EGkIwZ7/AF//fVS0//67WVbzHxgv1?=
 =?us-ascii?Q?aL+ZF0VZDwKbgzQzdj4PVHejKiSUmVXCyeEiAu7fEmICNJdx+Tj/igqgnQcU?=
 =?us-ascii?Q?aBg8PgrX5jjSXkGil7hDYtYKbUciADhAlcpen8VJs9Q6nLhu973o8JKCGbxX?=
 =?us-ascii?Q?F2W7k2Dy6HKe0QGiCcR0OuT2zi5HC01EmkOq+WbaIOKwHVkKoQc8mIJy8PQR?=
 =?us-ascii?Q?5dWV0e5KLLXiPbcFf81VwZ3AH5mw74hTUPCT9cp6g3bAJxyDC3styoH6ygvG?=
 =?us-ascii?Q?r1ylzilrqdvhhuUVd8eye6m9x8aBf04vwJ+UxAyqDPlg9pVBa1FSiMoznuAF?=
 =?us-ascii?Q?MN5rmSMxy4N4EKkxOd8KnLha+oXRIgU63bxd7rXK2yciFyDMrs2krFhIgY4B?=
 =?us-ascii?Q?ntQCZet+OUfoHnXTy0L/fIHNYGduBi/3a9WwejlzN0GIyCReTDUaClII5mVV?=
 =?us-ascii?Q?FR1LSoGAqtQgWeqOHRqhOVjlTVx9T5PDetRyUSvQQWXNGFa9+cB/kGgfbi4I?=
 =?us-ascii?Q?q+S+d90WtqA+itIS4+J+oFHBuhJQch++zxiBsj7LIfeP6HEqRcy66aYJ9lWV?=
 =?us-ascii?Q?zm45VwcHTQE/SZAxakArfMjauzXYqsYDoSs05202cEMs2CtgpxwP8Pl9pwxG?=
 =?us-ascii?Q?BkxjTzq6tbDT4dvBrBfbEbB6eOFxaxMHYKc53BtUJFQZ+SWtl/geAezUyufM?=
 =?us-ascii?Q?rYcmKK9LQJlTFV7e/HfOj9lkF+H0cBgW6GESFP2AW1Fzz2pY6PN+xF3BHK/P?=
 =?us-ascii?Q?pEUhwP4y13LzJDaymFGDHF1lkFYTnlpSoPGgcO/uiH8bPjALhFOc3yWnkXM/?=
 =?us-ascii?Q?kLI0WtLum15X/UgKCvm9ry5Itu7KlBwhRZ1yLClrzIoO6VR5vz3vVv0mXIwB?=
 =?us-ascii?Q?d3pbxdBiPE8Nf5y3Br+e4vxJuKV8LkUCXoLN?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:12:43.4607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa464cd-9334-4b5f-05cc-08ddb2361ca5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7040
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 09:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118066

Use the GO_SRCURI_DESTSUFFIX convenience variable for the Go main module
in the SRC_URI variable.

Change-Id: Id7a1f476c880b92b6e1eab057a9fc22875f0114c
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/reci=
pes-dbs/influxdb/influxdb_1.8.10.bb
index cc305f6e8d..5dd5644c4c 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=
=3Df39a8d10930fb37bd59adabb
 require ${BPN}-licenses.inc
=20
 SRC_URI =3D "\
-    git://${GO_IMPORT};protocol=3Dhttps;branch=3D1.8;destsuffix=3D${BB_GIT=
_DEFAULT_DESTSUFFIX}/src/${GO_IMPORT} \
+    git://${GO_IMPORT};protocol=3Dhttps;branch=3D1.8;destsuffix=3D${GO_SRC=
URI_DESTSUFFIX} \
     file://0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch;patchdir=
=3Dsrc/${GO_IMPORT} \
     file://0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch=
;patchdir=3Dsrc/${GO_IMPORT} \
     file://influxdb \
--=20
2.39.5


