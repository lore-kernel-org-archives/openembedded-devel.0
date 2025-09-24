Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9777CAC5BA
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 20:26:40 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.11])
 by mx.groups.io with SMTP id smtpd.web10.24483.1758745592239616650
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 13:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=S4m19UUE;
 spf=pass (domain: axis.com, ip: 40.107.159.11, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INHlVLXWuSdeRWG7EPIGcx+AvJihofQlPFz024xyDGtWmUWw1sLYfq5HVbCIWEeR0/9inOlWxfFOpzJNr+ZXdBoFt2YtrzvT1ETDCfBeuSLUTbGFciuGpIgb9kasNHjkVeAu4BWHG7bIfuQBKufbRd5K/4I7ETKtb51mfU27xb0GL8LHl/Wkey1XG6AQ5cim4pn4E4Kfe8DhydGGJs+rgphPYrAjzzzg3sMnlYuanrmxsTGRDuMJUH4jRMhnYIDws9ZBwlSsxd8mkqx02bgMtwiV9Uy64XMT4ydygUMo+AkF/t6LG8IDsZvLEOWEayCPzCkJyzisK1bwYwf535DzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54HNf+gsv5GfpujLKSNiQEkkAw6uJo9tGmHIhFu1QZw=;
 b=BWbqID/yrJuBTjCgJtBkMo6iFZK4DT9zUQUuBvV5PUvy6yBWcBW8ZSJwAxqD9cG8Y6aKO0mitb6Tsr4Gx7hzZHQsw3ArC/n973bTGxs6mwaT5bP8b/iFY6Bhyn5BhLuYIOlfYMAo/SL5voX/qN3nESQztM3fxP2retFtevUdTheYOWh0k3a4ywhEEnZlstboLMxJfkk0M9au9d7AQwdRtSHzOCL4Y6RQwrRqCD5agZKC4AGse9NmHa+rdNjp56g1jUMHmA5/RDcs0KsK3MYLPKmbE1285xrOdepjak8k60kTgPCmlgpemJzvUmHHwulQCgxA3JZq6L/ngsqoh/zaKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54HNf+gsv5GfpujLKSNiQEkkAw6uJo9tGmHIhFu1QZw=;
 b=S4m19UUEHh86A2rfnJsBPufKgSNR3moS+UlujSKwgKQLYf9uh9aB/VIwpNsVxC5zzPpkZilpA4ybAxxU1uKjRSMsfjJE7t3xnNy2TP60jY8zqKag/trxypAB0u+/AKdQ5FXQIDOipLXOyfugQZ259EqHH6FtMp5VWdTqNsIHerA=
Received: from DUZP191CA0051.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::28)
 by AM9PR02MB6977.eurprd02.prod.outlook.com (2603:10a6:20b:26c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 20:26:28 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::d7) by DUZP191CA0051.outlook.office365.com
 (2603:10a6:10:4fa::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Wed,
 24 Sep 2025 20:26:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9160.9 via Frontend Transport; Wed, 24 Sep 2025 20:26:28 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 24 Sep
 2025 22:26:28 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 24 Sep
 2025 22:26:28 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 24 Sep 2025 22:26:28 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 06F712E45
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 22:26:28 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 292C51202B4; Wed, 24 Sep 2025 22:26:27 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] dbus-broker: Add a runtime dependency on dbus-tools
Date: Wed, 24 Sep 2025 22:26:22 +0200
Message-ID: <20250924202622.612504-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D04:EE_|AM9PR02MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f699352-21fb-4ad1-4ee3-08ddfba8a44f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BX/+H6md5w3n8MV5FCFJC9Pd2rHlpA2VUsz8fr76ih8gdBboz3eJGzbghoSe?=
 =?us-ascii?Q?kRIXvKQ6rTnHyYLv+5dAO3jsT8LxSciUNfqlC2OS7TuyJ1c7ZH5QUKoBRVYO?=
 =?us-ascii?Q?5s8p1/e0pcSaiy7BEt5vtOVGKp8HfXSHm/ZLovnQgWZBimCqIAusoDKYRZj3?=
 =?us-ascii?Q?HXs7Gh7Y5mw/kwL0Wiofu0jMXnTM3NEX+bXB9STM/tDLkSsWkx2LbGPkxMdW?=
 =?us-ascii?Q?WuG/W30+FsUb9Xx919qH9cOmmj78FDz7fnAB3zUZd4MnWn9+cO3hFkf4rEqi?=
 =?us-ascii?Q?5+NYWOMDzixdg9FUJKLxvPM3F6UmgMk5RaPgXoczYnukdG1k3lbv6wqgxNr0?=
 =?us-ascii?Q?eK31+vGpbFft47r9Y3BB8jtuzfTVTx+CCc813hNvKSefk1KOd3mWeLxgNDKD?=
 =?us-ascii?Q?N3KGe2bMUaqxmZzp66L44Jv34gl4lHeKXhQA4EgfkBnZqoaj7T5WNToPOtEQ?=
 =?us-ascii?Q?nOt+0Des9fDKR3j5OddHjbc6MwRtvitgE3dm2GHpoSWfBx1EjUeo+f4O3XTy?=
 =?us-ascii?Q?KC1ZES5Joa3T9ifQI+FZdLlUeV6EePFXSvFrje3TsUwf4jZpmMh/hTVjCsHF?=
 =?us-ascii?Q?RsuSSR8AnGUTa9seGSDj0m1tOKiILPOkZw2QhS8u8EB0wKCxp9fOTFyp6oFw?=
 =?us-ascii?Q?oUMoAMhkr7dt0frk6jaZYrgAHy+KU/fNsyMw9yPnQd0IAAGEO63SJxReuAiX?=
 =?us-ascii?Q?iD5TfjFpQleAUiewzhkpxEbtr8ajqh1GvqURX0/x/TZxSvgJTU0cOqlwGMhd?=
 =?us-ascii?Q?hfOm/LtPSlJeYK4Cdnt5ADINwkRUMyxRfCZawcD2lNSVKf/aeuqCK16vNXsX?=
 =?us-ascii?Q?DkJdyCB43CSEZHNskQeFzMehf4NL36ufGEacHk6kEU8zeq+zrAj4J68OZ++X?=
 =?us-ascii?Q?2cRLbxtF3cjptjbvJqxc4frBgK5g3oPpA5QpMwO/tq7wD0JusIhNAvd+3rxx?=
 =?us-ascii?Q?YTrf0pYN8XArbzMqyzL9bR6LYupwXS0y03+CJmil5tj7KXAkEYZ3vHeL+bPe?=
 =?us-ascii?Q?jSrhQZnqOlthOm3jpddPNi9N56VHmgATHhCU21mM/sSl7vaqnaYUB36UYdah?=
 =?us-ascii?Q?aEkteJcLbe+piN2Y/6fE1KeAldrLweM4JA6aQs7PnGM0piQ5ybbwTzpnlhuQ?=
 =?us-ascii?Q?zg8JhiwJn7tC4Lixsb2WOZRvOm+xh3OuoSswG4XZJei9oFwIbG807MFO1IpY?=
 =?us-ascii?Q?/q4VGkcwORUPlLANJB+iab/HGFbGEeYqHXahJEPhSjiG46xtLo6/fT+FuW2C?=
 =?us-ascii?Q?jShZXuS0+8Du5iSFXflMlFwtM6n6qgj3OHdHnV/hw3YxiF9ANv3xXFR3yMcK?=
 =?us-ascii?Q?oTijGId4/rUmuOaNi9K0GgBVzrDWUCBJc3WYBUIp4uRJ2SSo4iyxFW1xuEan?=
 =?us-ascii?Q?NkpFzpHJ3KJtOvuIKkXg4HH9/vdT7cgMkTE783vZzwE3bO7xjP8Tir5CxxpK?=
 =?us-ascii?Q?T1wdhosjk0+Tde/lvnR8DITzVUWSuyRlZayvTmOaWS/NjpPmw7TL1L4I+ECU?=
 =?us-ascii?Q?K2dWsE0nFBuKWLAd7fp/BarKP81MAfik7BCj?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:26:28.5672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f699352-21fb-4ad1-4ee3-08ddfba8a44f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6977
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 20:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119842

This matches dbus' runtime dependencies and is needed for the
dbus-broker package to be a drop-in replacement for the dbus package.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_36.bb b/meta-oe/recipes-=
core/dbus/dbus-broker_36.bb
index 8c8f2d2469..8959927a92 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_36.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_36.bb
@@ -31,7 +31,7 @@ do_install:append() {
 }
=20
 RCONFLICTS:${PN} =3D "dbus"
-RDEPENDS:${PN} +=3D "dbus-common"
+RDEPENDS:${PN} +=3D "dbus-common dbus-tools"
=20
 FILES:${PN} +=3D "${nonarch_libdir}/systemd/catalog"
 FILES:${PN} +=3D "${systemd_system_unitdir}"

