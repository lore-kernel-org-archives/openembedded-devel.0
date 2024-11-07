Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEE2D42BAA
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 16:28:59 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.87])
 by mx.groups.io with SMTP id smtpd.web11.91090.1731428935670660372
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Nov 2024 08:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=G7K9r2bs;
 spf=pass (domain: axis.com, ip: 40.107.241.87, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWfiQSsbXGK9TyfXNr0uY0VmPNEvarKKxVY5S0uM1S6OvXRwltKSKge6VxarWpklgYRW7hL7XeUD2F8RCL4YWD98F6Bc3RHjyYHEWI9Etp0YgqSDKgG7RMppXGTDajLkm8m6lHd45v3CRxxxDw5AzZib2EboMGNH1ajheLIQCUpIC4iaw7bxoB3l8IOOqvNqdE9B0nNnxdLbJwZkpOyCzIKvn4o3GEaLbT32SzJgsiWbH5sSCvU97wc3P6yeBwUQBfALup4nHHExms4DMmxZq57FHWS02MjofCw9Fe+GRZ0LSNUmifRM2o3rPeN/6+r3VVnWjKxjC84zcL2jw43m1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wAKmz5pbpRydG290udMQ6GWMiRdRDtJcESuFr8Pp2U=;
 b=dBqsfdE4FwjtJuV2L3ZnzABaAZPm5ivNL29YqdRa4s3mfiavNvMP+wMpIwMr5X/52uIcC9qUzWzZAIw7gXPVqGsSxqC/AMGVucENw+L0y0C6jBHYy5H0fyVDu6ywByx1C0aykybqbAhrYGvIo6os8OZoqf3/aeGUau7XiPcSVMkTVOR398AvjcuGJBmfKvjPIL1T57vnG/70jqmAFsTAhZEy0sWOA9an0pDUPudrhfZ7UJKtXDMUAtooeVoVXH7zwS2rxZijjQgI1DoQYSpZL81U1Gtva7zGlVtV9mJxj9RFxKe4mg/0ApDrqIxVhtSYpGXOjdjLm/QyxgI8Oumfkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wAKmz5pbpRydG290udMQ6GWMiRdRDtJcESuFr8Pp2U=;
 b=G7K9r2bsTzljgNxyr4J2vwBoR3VPdf6GkqiIrsO6XKOwg1MdCBgmJmeIIYCPvH+U0oiI/cOYkqu2fm9Ot/gxy9bHQRrA7o1jJfSCzqJT0ZnsZuCc9+aoPkz833tcctHFOIgybPWolzKs1PaQhU5iDWiwgas7hllDMfRaW3anMt8=
Received: from DUZPR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::6) by DU0PR02MB8853.eurprd02.prod.outlook.com
 (2603:10a6:10:40f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 16:28:50 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::94) by DUZPR01CA0018.outlook.office365.com
 (2603:10a6:10:46b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Tue, 12 Nov 2024 16:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 16:28:50 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 17:28:49 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Nov 2024 17:28:49 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id BE329887
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 17:28:49 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 4ACGSnWn3121018
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 17:28:49 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 4A7914iT2029579
	for openembedded-devel@lists.openembedded.org; Thu, 7 Nov 2024 10:01:04 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] ebtables: Remove the dependecy on bash
Date: Thu, 7 Nov 2024 10:01:00 +0100
Message-ID: <20241107090100.2029544-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|DU0PR02MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d31bd3-4ca0-496a-6eb0-08dd0337174b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?muN1CKpK99BozZNAvSo/2tXaY/TmWcKaj0UXW+CqELZYfsCyQqxoV8yILh9w?=
 =?us-ascii?Q?+zHzedAee0hyoLgciYr/USpInsSd7u8gRLQUp6epJHVNcC7ynhQkHd7r3Iep?=
 =?us-ascii?Q?RMj5HRapvpNisX93QAxTEenb1DaVWF2EQ0CUoVDScg9SbJ7EubDSURIROoJ+?=
 =?us-ascii?Q?uhMVeJMRfjBy9ngNjauEH8/x8XM/lx8mpejlaE5RPYJHRQ05ROZfh6QaZ7D4?=
 =?us-ascii?Q?ZwynrWjBEe3ljrGQKd3fRo1ENXI05coT3Bn/K3ZmeJpyDLW654g0JYCYJTJU?=
 =?us-ascii?Q?pPcDVQq5KJHDYjZs6Q6YqQoQ377F0i4dvOfdbwLGylsGQ4EoNS3FbLqFcUey?=
 =?us-ascii?Q?5gehZpVZmbG7erAZZyHSUabX+AwZTsdbU9cyb9TvYmEkS+IcAZF5Hmw2unJd?=
 =?us-ascii?Q?s0ynLlmwEML6Dcc4Ntxi1T73jMi2p88XR/mvyzgcqoG+Pw+ktB7DlfaUiuSp?=
 =?us-ascii?Q?tt6X67i8VxFhDed8Ba+W5J4I1h3P8OraW2Ck9AzmDAIvAWB1td/Tc1sfmb8c?=
 =?us-ascii?Q?s4rFgB/bcOLKkKE5fLYtRp0JEEGe42dd1OJGjK12hyoXUXYYN4YaJPDwKFM9?=
 =?us-ascii?Q?vTjUVBxbSLeRaADE43WzGxDVkUl0oiY4PCHiCGnIqxB5juicoNCQxKNa0cRQ?=
 =?us-ascii?Q?AoOX6/8laLAzCfkYxC/Lgvo1/wZriSzPMhzpT3O7Vza5ov8IbpSzmx6NzT8J?=
 =?us-ascii?Q?8gB73ad+DHGWcCGLu3D5g+6rCgRSwQJcU55IFttnXNKEaEhNk4f1lS92Y3ht?=
 =?us-ascii?Q?m+dANqhat6idOWxwJnjTUwjWrLO7UxnQHUErX/m27FGjiS+d7jqc/ApncrhN?=
 =?us-ascii?Q?KSs5N8sog3gMYZhjmW5b5w3L+zQQjy21criqexUlTPTxGBPvCof5vzU/oJQv?=
 =?us-ascii?Q?IP6UYqusHT0JWvgL7LGqR1U3lF+7DP4s8q6ivwkaFHg8vQVk+aipR2KBRaR2?=
 =?us-ascii?Q?d3Tom8LCApnK1VZdTOdhw81hElDfg8w4f02plIbDtHM6GbTebUpYor8UZQz3?=
 =?us-ascii?Q?H2hjNXqbgDUQvABtgQjh7JdKoQIPJ9dyKhz+idLlOdKDS+kvO8dg7Ta7fhll?=
 =?us-ascii?Q?Oz51ShTUB0ep5bBQwnZRBw/v8WlRd0A1EVozFBIm5cviM/vWJGUDWcVBPitA?=
 =?us-ascii?Q?8NJ/lQVg4zPEiiqKCKaqShCGdfM/IzdV+nPwxR/s/cUAJg/q2YodnDCrkiVe?=
 =?us-ascii?Q?FHGhdOJh8JHnQW+z+qc5mFyXspjadlZYL5YBnvkcy27wCzVsFA60XcDkbAro?=
 =?us-ascii?Q?9xw3geMiK/UFwBwaY/dcudF6Igy50qF7xSjGbI03bh4nT4Qkal34W9wUDF3c?=
 =?us-ascii?Q?ti3GvESTSDhCXgbjQNlxm2JY6TqsoKLSFMo3tHLvRu5tdOjotPVK8t0W2o6e?=
 =?us-ascii?Q?du/CY2ORW52WnL/iHApnFhPrPRF1214m01kxFD99AeetYxUV2g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 16:28:50.4757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d31bd3-4ca0-496a-6eb0-08dd0337174b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8853
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 16:28:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113792

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

