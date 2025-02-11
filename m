Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD565C021A2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 00:10:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.56])
 by mx.groups.io with SMTP id smtpd.web11.308.1739232612449833169
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 16:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=VCQD6RCg;
 spf=pass (domain: axis.com, ip: 52.101.65.56, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZq9YwzxlrUY9daFded88kcZgBVYFWEJxFff85Iq1g1lED1AOKNNdL97UctZ+NhDx7Y/A48kPH48f8vr7xUVXye8tKV3tb52mBPgg9WKPMnBQrNbhIojUdP5Yv8juUGvZtL1yqjshz6zHy1hWzIM8i+UYdhD8c5Mj4F0Tktka5o+J3B6P3/z+X8LOMLFjvcifAnOY7zRpLJxijSGDz0gmTojzKEdvOgrogUlIjXVX9EdrwKbEczGyXie6R5XbEDVFGZWUBKAEsEK+yWzBmzaAGdedpdqNjgdYdpsFJ4aNNwJkiF8R3lok6wSQGadr1GM/9ew3xGsnseVmYBvIpDUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wAKmz5pbpRydG290udMQ6GWMiRdRDtJcESuFr8Pp2U=;
 b=WzDpL45xP6rywm7m30Y3R+RmOHtW5wn7TkHmHAD0RFjnmE/w2c4BUrDhN4JZw4uGXN82TueDT5lKXrjVPaXzYUVhqOQ3rwkK70SXOcli9PPHXfXKhriagbe4aMlpm+GvnZrVe5fvXTgE/6vuT25MlDfq3XdbJ6WvhvRqwkzVNVtvUwBL6stJ8Vmz1/WGhQW2Xbay4oYCqme7x94f2h9lVsj4tx5p8GtRg923ltkLWuFJ2BSbt3cvMlKtYXPvD84Dj6kaGlqVsyDjEGa7nJtZXBJWKPJHGxjo5gN9qqlLTz1L9L1ZR7trSGyhKjf0zvoWfNzJpQPn0Iz4k5mnx6hViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wAKmz5pbpRydG290udMQ6GWMiRdRDtJcESuFr8Pp2U=;
 b=VCQD6RCgOtl7LsXT9rwSwRgEMD7ZhRdGuyDw9V7DH8XaCZIPjrYNBCQ82c2O7RW3j0VEZfFOkOCeC/4uQIl41x23vXQGKob22HGSFILlCXJi440NJnqv1TY7Uhma7UACux7VSlYea0g9LXBQl+o5R4u37/uDbm+YnlJWvb4NlQQ=
Received: from AS9PR06CA0459.eurprd06.prod.outlook.com (2603:10a6:20b:49a::8)
 by DU0PR02MB8241.eurprd02.prod.outlook.com (2603:10a6:10:316::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 00:10:08 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:49a:cafe::9c) by AS9PR06CA0459.outlook.office365.com
 (2603:10a6:20b:49a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Tue,
 11 Feb 2025 00:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 00:10:08 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 11 Feb
 2025 01:10:06 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 11 Feb
 2025 01:10:06 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 11 Feb 2025 01:10:06 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id A8B9B1CA
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:10:06 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 51B0A6IV4178985
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:10:06 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 51B0A6fd4178984
	for openembedded-devel@lists.openembedded.org; Tue, 11 Feb 2025 01:10:06 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [styhead][meta-networking][PATCH 1/5] ebtables: Remove the dependecy on bash
Date: Tue, 11 Feb 2025 01:09:54 +0100
Message-ID: <20250211000958.4178887-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250211000958.4178887-1-pkj@axis.com>
References: <20250211000958.4178887-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|DU0PR02MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 8879b060-d87e-4e39-9420-08dd4a307196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3WrCOwS7GbqzPVVf6GdiKFe+nuB5U4GwSi/sCIBaUcNFwLr4hhBYkXMuKPKB?=
 =?us-ascii?Q?Q9WjusiQ8I9E4ClPlXaRgPinLo8S1jTQmp4AZoAW19sDliqxzF5muUNHt4Ua?=
 =?us-ascii?Q?gLyzIHbKogMl6ndCSh0AXMIqS6g6eOgQEzLgTutsAO/GcqHmD9jmfsaCwiXu?=
 =?us-ascii?Q?ArvkJHCd//rmG2uG2rh16c/M4WsJ7BBZjtS9Nir9sQkC7R7m10Y2PnwKSKKt?=
 =?us-ascii?Q?SEizcqrgQ4d9mcZFWYXq9Jb452hYLWCZ3AMNcT1xDe6oG7bWW/F97LfJPrnb?=
 =?us-ascii?Q?492jcNxyt0f4wjB26aoRM6PaWMcvlk7DFFt/KVf5QpVPd4i8XdmTxzD/HAZW?=
 =?us-ascii?Q?pfPSCcLyHdqUX/kVzmDMu1R+7OvfkTxTwLOC3D2+phdFkgQz/sBLQ56sBBtF?=
 =?us-ascii?Q?D/BHtGAW0BGnOz8w6RvrlUfDxgNqm0z+U9+lJvMztumpxiKnpno/naUV9Hxc?=
 =?us-ascii?Q?pntVrzPhQXN6vowQ17jC2+Qhe3KTSmm806ulyTscRQ9qP9fkpmSRbyor5T3y?=
 =?us-ascii?Q?Qu1Vy6TFiz7w9EHwWdznzzdspZ58/MDVht4fw6uqS0ZxqHtYi78FyXXpjjBX?=
 =?us-ascii?Q?Hw3Cm5svXuyhgFVrwAETqX1eipnj1/Hmbk04v3BAkXpbH2WApWG6tyPqgeby?=
 =?us-ascii?Q?agwKnQzMy1jGqY/mESGX4Ipftykvibm+3uSX49qgAynqq2dOyz6bdjms2MvP?=
 =?us-ascii?Q?M3FFT+kGBRhir98tAmZg4EVBv9jifg4LmbQ3q164wsYgOSJ/PQTNXV4ftZ0o?=
 =?us-ascii?Q?tFSycPK952rCda3HVwZijSVUJiXtlcks0tu5W93ucTyZPI2hjo/h3FqTgstW?=
 =?us-ascii?Q?mjE20dbW9jq3SMIFyzw87TgFlZdKBQAhr+QKLRLIbK4EybHeS1sI54dVuKlK?=
 =?us-ascii?Q?OnBGtvX20HClma+ttUniLYsIbnpFbssNPcHB4mznRVjIMq42o/DSYnUdJtba?=
 =?us-ascii?Q?aRNDRSp/fgkxLczTMcY+PqQVKaKTNlZT8f/px0pszGW+1zS3AOVZT2Rdb34k?=
 =?us-ascii?Q?UZ6SSeZRSg3CLAE1nTIzJrbNjyZ6ubdyYkKTdoU/cYyjeoKmEANJPJLfebdf?=
 =?us-ascii?Q?Zf7gEciSmF+50UnqoHXXcXqp3FakTVYmZVJU70QkNiyD7vfjXChSqf78/gGw?=
 =?us-ascii?Q?SFS+XxeTgy+RKUtvNWh8ZwelwjuxkdGIo4b5yAOqVaNarm//vvTDKC0R4Qec?=
 =?us-ascii?Q?XVOgZo+EhfHzOtfL/iGcU9B2BJs1GMn+Wm7Fsh/wdcrAK4w4/Q4X4QS5DRNa?=
 =?us-ascii?Q?gDOI4kSBtzc8j8yrcNNQwAyzXRDhCZxe8U96+shm9pQd7JAmtkg9GG/dRot6?=
 =?us-ascii?Q?YDXE1LM8qPQ47MLatJqYesruZj1vKYW4T8TkTVo777hPNWVHm2bZWU7HAuzH?=
 =?us-ascii?Q?cK9SCs4neyDxc0n3k2eZRoEz+XcJkftuYWLeItwnL1cERb4ov0/XadRLhtIP?=
 =?us-ascii?Q?diX872DRNpbXm/tDdysMOiiIa1A054jVqH9udCWivAs0MGJQM8savJMjPqcm?=
 =?us-ascii?Q?Erzdnkr3e8aRHU4=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 00:10:08.0589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8879b060-d87e-4e39-9420-08dd4a307196
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8241
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 00:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115412

Rewrite ebtables-legacy-save to avoid using bashisms.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../ebtables-2.0.11/ebtables-legacy-save      | 19 +++++++++----------
 .../ebtables/ebtables_2.0.11.bb               |  2 --
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtabl=
es-legacy-save b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/eb=
tables-legacy-save
index 2133600f77..0b39c23deb 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-lega=
cy-save
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-lega=
cy-save
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
=20
 EBTABLES=3D"/usr/sbin/ebtables-legacy"
=20
@@ -11,7 +11,7 @@ cnt=3D""
=20
 for table_name in $(grep -E '^ebtable_' /proc/modules | cut -f1 -d' ' | se=
d s/ebtable_//); do
     table=3D$($EBTABLES -t $table_name -L $cnt)
-    [ $? -eq 0 ] || { echo "$table"; exit -1; }
+    [ $? -eq 0 ] || { echo "$table"; exit 1; }
=20
     chain=3D""
     rules=3D""
@@ -20,24 +20,23 @@ for table_name in $(grep -E '^ebtable_' /proc/modules |=
 cut -f1 -d' ' | sed s/eb
=20
 	case "$line" in=20
 	    Bridge\ table:\ *)
-		echo "*${line:14}"
+		echo "*${line#Bridge table: }"
 		;;
 	    Bridge\ chain:\ *)
-		chain=3D"${line:14}"
+		chain=3D"${line#Bridge chain: }"
 		chain=3D"${chain%%,*}"
 		policy=3D"${line##*policy: }"
 		echo ":$chain $policy"
 		;;
 	    *)
-		if [ "$cnt" =3D "--Lc" ]; then
-		    line=3D${line/, pcnt \=3D/ -c}
-		    line=3D${line/-- bcnt \=3D/}
-		fi
-		rules=3D"$rules-A $chain $line\n"
+		[ "$cnt" !=3D "--Lc" ] ||
+                    line=3D$(echo "$line" | sed -e 's/, pcnt =3D/-c/' -e '=
s/ -- bcnt =3D//')
+		rules=3D"$rules-A $chain $line
+"
 		;;
 	esac
     done <<EOF
 $table
 EOF
-    echo -e $rules
+    echo "$rules"
 done
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/m=
eta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
index 8918936e14..be8c49854e 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -6,8 +6,6 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D53b4a999993871a28ab1488fdbd2e73=
e"
 SECTION =3D "net"
=20
-RDEPENDS:${PN} +=3D "bash"
-
 RRECOMMENDS:${PN} +=3D "kernel-module-ebtables \
     "
=20

