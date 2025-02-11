Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7C5C0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 00:30:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.78])
 by mx.groups.io with SMTP id smtpd.web10.725.1739233810447262908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 16:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=nSnqKA3c;
 spf=pass (domain: axis.com, ip: 40.107.22.78, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SR3sPNF69BaphFvrL4SzhVb0RiB/nTEAxzIOkR0cbmFghIsZgDQ9EkgNJW7D2c8ZOl1kNlRv/9oIb2FF634jU/iFJI73dGxbE83YV0wvWrUrkdyuNUWLycWwfNOh36qyPr8qulSLP+wn6NaK+vuaD3OMrl/0Tvtyop0o2soSXcK4audKLZcZmxIQ0SQZpEJOT/F9FzvHlZKMBPkgrYlRs/qvoKqe8RhJxdrZn544692KwYLN8VxWNSPiYsph7doatJUKuHCcKZA/HI3RP+PIF42aYxpz9NbM0iEA3jvZ7m0VHzPOB69YcZrmbwQlYTbOUceu9hfCVNlt6H9JSZhFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANDzq31nwmZNnvLAJ1ZyzqcjZb0AxJSJXb6QmCMO/qA=;
 b=JoKyRSUbHTjTZOjc3bjjF5IKAXs4meQweEyu0+9RaFQKuV5x9ItzfuuZOGrQ989K+EAK77L6IljK29fhuinoJWIpel0ywCrqQDe7wNIYbJvOy8QiIZvRv7+51YlOCtGfQbZHbgYoIu4M2B59DzZUteyft6khJAY3It5oVWxmXkTvntgNvXXNodXIBO5mXkWVtJgnGh30RQJp9oUfz/O8l84cosAguS4Z25TY+P3sxzWYVJLCUvtMoZDy0nbt86Kvu2qlzc7QiIvO1rEy/maRF2nzOXuD0j3DHHPMgV/51ccWFYpOvVQVbr9Z5Lk+759EhyMQR/LR40o4oALLVcQozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANDzq31nwmZNnvLAJ1ZyzqcjZb0AxJSJXb6QmCMO/qA=;
 b=nSnqKA3cuYihdXEfWml/CYvFAQeGcTWclJH27AtvnZ6DOcCBPxqf/sRcLuKcirQ1mFEj+2xCVsBPFWOCkQ3GOx1Y5TR3653d64gRYhha50vUs97rn2LGSJybvj4mW1dv5h8Nq1vxJ9TkZt81NGieLw3DJeXH23t/km8TNNYhSj0=
Received: from DUZPR01CA0243.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::11) by PA4PR02MB7987.eurprd02.prod.outlook.com
 (2603:10a6:102:2a2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 00:30:06 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::d9) by DUZPR01CA0243.outlook.office365.com
 (2603:10a6:10:4b5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Tue,
 11 Feb 2025 00:30:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 00:30:05 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 11 Feb
 2025 01:30:04 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 11 Feb 2025 01:30:04 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1C271282
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:30:04 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 51B0U38s4186209
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:30:04 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 51B0U3Vg4186208
	for openembedded-devel@lists.openembedded.org; Tue, 11 Feb 2025 01:30:03 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][meta-networking][PATCH 1/2] ebtables: Remove the dependecy on bash
Date: Tue, 11 Feb 2025 01:29:57 +0100
Message-ID: <20250211002958.4186149-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250211002958.4186149-1-pkj@axis.com>
References: <20250211002958.4186149-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|PA4PR02MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c52758-2c94-4bcd-11a1-08dd4a333b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AAEcyy7TKt/9PqE7gt9gAr0CRKJQHFtaA20yXGEb5hRrHhbwW+i6HUFgia7e?=
 =?us-ascii?Q?11O6LSGhWaRwillgPtYJdU6vgI81bknb2Hngu2nvgt0q0fAQzpSOEEgS71V9?=
 =?us-ascii?Q?MGkTj7kOZ5PFABGEFoC0AvusTnEmLD4Jvv1kjjwTn/Up/KUQ1Ti3sqSlrJIy?=
 =?us-ascii?Q?FLlNq8rE8GLy7Axsp5SbAeOpIAYYgFbKKJ6J0ABIPJCgNdmTMPwJ4d8lXfS3?=
 =?us-ascii?Q?PxWstZ4VWrdfHc4jbwfRNtwN3O0Zq+ddBWwB8k50o7uUZbDVOZ2wGdECTVsq?=
 =?us-ascii?Q?G6DeJvGSoJfjJCdH6Psf3yNW3Mqy60DUe8ba5QHnbiVkv3eIfSzW2jHmdeK7?=
 =?us-ascii?Q?Ky+CGaJPb++S/vQojQbQR6F9eDV/3dbNpiDuvVAjLQcm7TEiniyoz1YynTa6?=
 =?us-ascii?Q?6oE3ryA09/BSh+UEM1PiS2yB3MSbZo8uh0ao7JYJfR7RIAAvpUg6adxv7EWQ?=
 =?us-ascii?Q?O0p6PtLttp+82PrYFPS1l796Q0bmMaLKgEnaYWzlELUE0nihkKWcc/TFw2og?=
 =?us-ascii?Q?mt0CkuGUwzWudfurE5c/+joOWrwWkdTXjkxAtIIXZGa++LJwlJa/epWs03Pp?=
 =?us-ascii?Q?RIUGIJIILsGR0UgAN+vZehazZOcQ9LIsdnU7DqXl8efDfxE212mxig0STf+q?=
 =?us-ascii?Q?pYVGjBGbDW+kOJdCxqWCt99uerKqIDJMYlM8ui9WFITkOaMMEskU0myJd2zk?=
 =?us-ascii?Q?+uKfazKGCDrhogTDq2tu+ztmhF/DbvtwU+oJO4X7FKw19zCuT3YTsQEdSHgf?=
 =?us-ascii?Q?x4+kNx+3gFa8xy5LrANf3p0ndJB1d/jJHg6yDqY64xJTOfQmgMEIVQhXKhUJ?=
 =?us-ascii?Q?1JEYm+8glzGTktxReaxZVa9+ALu29AM27SZMR79A+W8k+DYVmrsAybkLEN8k?=
 =?us-ascii?Q?3wXe0K3WXpRrsKJOv4117gauEMGEo8OqZmLm3PSnUSh+XCMxkHHnYHTgRD4Q?=
 =?us-ascii?Q?bzkbN6ZIO8F/eBSToR/Q1q2yUO7fJczZHRnkE0bZZ2hJ8mwHnl4/iy0sC8P9?=
 =?us-ascii?Q?MyaUog0500rqaQQ/D6abyTR+sGA0vAMwjIV2SCY7M9bYcTcM2WASURYHGRwi?=
 =?us-ascii?Q?LFruM3kOCVr1OoWYmGK9LGayYKEzd+by+rchH3kZBBcZOk0lgPIEJ59+rVrf?=
 =?us-ascii?Q?2/Z5TbQxbxi5EaGAD6SBPo+I4lQAWSgKKIFejFjDrkE8ql345wMV11u9I/RJ?=
 =?us-ascii?Q?1sAVXFfN/8QMaJZBox8QnavS2MfOXjd0tkkWExdKRwYDloHKJo11IL80QS7E?=
 =?us-ascii?Q?JdIKyPDRddYuZavzt/7deWN1CFyDk9yimhMiyjE1XnUjcN6SClG+ZjQgTcXA?=
 =?us-ascii?Q?vnaSveW2L6+xGO6d3t16ms1/3F84ojpQnhRP+h7SE15eQzDtk5U3cToxenrA?=
 =?us-ascii?Q?kEWP7yvw42K+lJgd1kU61nWrLPin4YJDyMHq/WFjxl9yVRRR5qko0HINxCFK?=
 =?us-ascii?Q?oJfpbSVpMFl0fDTjy9GZepHG99xz2EDNwUzbH2T+X4FMRFVmqyfJBOEQ6EBE?=
 =?us-ascii?Q?61CaY2jOVoH/fAM=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 00:30:05.7889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c52758-2c94-4bcd-11a1-08dd4a333b80
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7987
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 00:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115418

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
index d522b514f6..30a4c79477 100644
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

