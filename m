Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD37D42BAB
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 16:28:59 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.61])
 by mx.groups.io with SMTP id smtpd.web10.90663.1731428936423898543
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Nov 2024 08:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=k4mEvwBr;
 spf=pass (domain: axis.com, ip: 52.101.65.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I14RySNXqeYNC204OaTe0e/F62BIjPNzTlVNJwFptXElqAG+Vc1LfrWsM7PWymMoByzu3+PDo9v6hCcUW8I2SLsGr0gnKMcPXyCarYSiaeiIkkGp+iteXeRTlBz8EZ4SpyEVONNR3lDYo2PNNFlg/kcXA4mFkWxXXuTCriK8/xNhze0rFVEFOAuIgJ+MMjEqYiG9dS9Qbocb1Sb4RIoErRDqAbDuBNbj3qkSEkTDFFjEu0uvLqO13iJxpti9HTBkA39E9/cDCVdjw8WHWdHumSFz/YVS9VtGJCQ75NiqEWGFMP4s1feyUY5Gdip95uSX4ptHe3xhJEozxMlDt6V3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wAKmz5pbpRydG290udMQ6GWMiRdRDtJcESuFr8Pp2U=;
 b=XxskG5szz1X8FQ+x7Wvf4osjL8nnBq2NV/Ubk1IltbmFtTXKKkoerDowsizaXHwm/BqyKfiAZUCyKm8O1b8qFevsQ/BXRyO9BdV7Rt/0vpHVXT+OqXsZP068zoJJIZJqaRgRsJdFFCMAaY56i8dPZZeU6HC6oXAHRKXlxguyJ2uws9UxxpROo+4ugYcGQQ1uqRKnuBZkStaAb5TpRG4N/a3A5a0zYJapa0Hvj1FVyFgpdB8weJK4lHyb0Os1lgR0Rr0Q/6vMBr4XUdvsz5CTxKNspqfLWPvIXRnzOFsByoMuVtJTy8BKZhSttZjFGUgU+hj+FzKgZTTrQcS9fPmqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wAKmz5pbpRydG290udMQ6GWMiRdRDtJcESuFr8Pp2U=;
 b=k4mEvwBrPyP4ZvLSapglYAZwXQfaa8MS0V5fB0nDe9rT2ZF1jEyifCqlnTGeqrnzI7Mg9Bt0Qg4L0eLp7RUonz8xzDZJbxsZkJOxsAmxxIs8ZyPDntgSaAHeGQW2GEi9MqZlJiJCrGTlVR2zKlUInI8EUD7swPjf+Jkn8mk8oXM=
Received: from DU2PR04CA0238.eurprd04.prod.outlook.com (2603:10a6:10:2b1::33)
 by GV1PR02MB10599.eurprd02.prod.outlook.com (2603:10a6:150:16a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Tue, 12 Nov
 2024 16:28:52 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::51) by DU2PR04CA0238.outlook.office365.com
 (2603:10a6:10:2b1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Tue, 12 Nov 2024 16:28:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 16:28:51 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 17:28:49 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 17:28:49 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Nov 2024 17:28:49 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id AF70C7BD
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 17:28:49 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 4ACGSnWl3121018
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 17:28:49 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 4ACGCidD3120302
	for openembedded-devel@lists.openembedded.org; Tue, 12 Nov 2024 17:12:44 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] ebtables: Remove the dependecy on bash
Date: Tue, 12 Nov 2024 17:12:39 +0100
Message-ID: <20241112161239.3120281-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|GV1PR02MB10599:EE_
X-MS-Office365-Filtering-Correlation-Id: 8647ca26-5e9a-4e67-bd75-08dd0337182b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pt1KZv3bUVbtb7z9w5+B9+V1QhR1fQbvEpGQ8wxlU+LBe7fbA1CoHO6ZtjIm?=
 =?us-ascii?Q?dTnsno2KFLU2GIgoqE5+wPzopJT2N+fEypkLvAVJPqHtN9wiSxF4uCXRdoUS?=
 =?us-ascii?Q?StqYyKkcqwspJ8naKo3TSsKwmVLcI5kU0kTZsZqcT1UPRkCnfl3lu8m1kTG6?=
 =?us-ascii?Q?poImWlmXD8iv4M9k8w5yynNsYv79ukAwYa5E+/lwslp3J3g/k3yCIpPKL2w7?=
 =?us-ascii?Q?5Um+QqHqekmMriXA6rTKroHxXHUK77N9DX/vBoaagngS2wYiPXtKl0+WEYUa?=
 =?us-ascii?Q?3JNT+GcyXjw0f7wmgH1RpGD1iCZucazRsY3pmR7W+6kMcNdXrhSCIZ2yztCi?=
 =?us-ascii?Q?SbfS2n0XiSx2yZyi55CzSdWmmoV4vS4WF0dfpMZbgidu54zSRKbctIsQb5yO?=
 =?us-ascii?Q?H4elcjuqHX6dMlqH4IGIEPHxCviNHyKC/JBkdRRmQ2/315Qq12pX96Hr3MOQ?=
 =?us-ascii?Q?LlOH9ECs03E9SWaLIN1qE8mWWA2xot4htKkb2LSvWXMI7RCj1KGyIapG6y9S?=
 =?us-ascii?Q?CJGnobQdSvsV4BpOlhpPW3aSbzWDU3amM2+Su8ISn6JRFftrQmLw5LHHBm+s?=
 =?us-ascii?Q?5BydCLCi8rRWSNYpjFR7JsqpzYa4PKY1Mq9dW/bYNB+mw4IYotNH0gPrDpFy?=
 =?us-ascii?Q?wBInCCm2ZgtMJIrGiRWQ4Uif9EnFkPY4J1q8aZ3gC2WnTHgcHY/J5szVxb+8?=
 =?us-ascii?Q?pezan5HrDFyk8cuqPcXMY2gMNCyHBzm+4HcD//uO7O5ti0CWyEZTMOjd90sH?=
 =?us-ascii?Q?K40dPG1m+4PpjgabSPRjiAdbKSPiu8vvy7B92JEpQzhb0ViqerT66mTUoSDf?=
 =?us-ascii?Q?Pf25Uj6x49OuQ/GjlARjvJtkAYW3gpI3EIvCN1GdUDdtrzZRmVaxPJ60zuc9?=
 =?us-ascii?Q?/nMSOr9WGfz4hDbjNZJziRz6LeSUJPHrsqHbFqw6zJXaNamR1DjzztM/z6f3?=
 =?us-ascii?Q?17/OBUiXceiEbIYSG4PmpQFUxVJ/rMg7GDsQkppt0Q0AhI6AgjMwOJa2iAcj?=
 =?us-ascii?Q?PsOQyfTxnyksTH5ZL6FeS+UA/mXXm56OIYvxL0qs1Cd3+N1J+4u2WSlIwhvL?=
 =?us-ascii?Q?zdcfzWMqzw/gnjaKi0wUf3/oVp0Nn3YcabkUTN3P5S3w2gAZ7DtROBaSAR4m?=
 =?us-ascii?Q?mAssm5zKFvT4Klyjhx5QooUM3vdNGMii1zfEQN1OZdBfYMHYLV0bVHLMXLno?=
 =?us-ascii?Q?fP7iqPdh2Ni9L9Qxbp9YwEeq6E+trKmgH3OQMrGsvhWTLldpsOWKZVip0T23?=
 =?us-ascii?Q?kUVDKCzxqw+WXvrmIQlmB5lNSXygBj9Fad+AXDKEg7gkgKg7vggqhYbrkzGB?=
 =?us-ascii?Q?J/I5CDG0vP4+XvpuwqRS1INIDAfOISZMpEyD6sZxf6eaXgKryo5r8Tc9iDCN?=
 =?us-ascii?Q?iCoy1/Rh9Wp4BC7nxhMd6i4mr5eOgczBIbmSA7un+99/Pv/J2A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 16:28:51.9457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8647ca26-5e9a-4e67-bd75-08dd0337182b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10599
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 16:28:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113793

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

