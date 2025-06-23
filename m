Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C275C7EE30
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 09:42:18 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.53])
 by mx.groups.io with SMTP id smtpd.web10.15877.1750671734740652030
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 02:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=rPw0aiM0;
 spf=pass (domain: axis.com, ip: 52.101.84.53, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUVy920W8vPGucRQfWDMvosKB2TJnT2UkkbQV29bdOsb8Qjyzarlpffyx5ZtbgZI+55prGN82AFYL5LeQHw3duIwOSHZvGe9UFvwaBK1+a1fwe+HKtWo6r3ozdgbWFk7+KrfqSyUybR43CvLgmPNLZ42C6YzYn3Zf/ePhRHLCRvMs94q7jnaKF4oM88f2F6cEL93AkZxKCJpBEXKZGWeKlmucnoXIA3qzAnPeMlYZt2Fg1fUetwI2AW3MrQtpUeIWUvcLb5tnoI0FRTOBzfF5wELKxqWN+vU4zC1RgjvK6jwr27a77o53JOmBqHxmAEyv0vip+bXxsl8fz0OD8HTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWeo3OmnZyQKwRGWwNDHIv4TbrlNoO5H1JHiMjSEuCc=;
 b=xdkWLdKAbzS879peDGppE00P0uhMrysfnPDwbGOphkn46bJKnQWnk/FYEQ7CqbRwgUQ+ISxJmUUpPufzRFHdrlp1W0/JCRgz7QdJZ74QsTIaLE8GxGk2d8IpXZeu6C3yoKrzY+j7otRyj0MA1cjZk/ZcPJwgae2+mIHJaOtlGmd02pZZNKYm0nrex4IOn37quuLNxKpB0vqhxmJycDEIxMSFvs7KWBgfZiknzRV4Tr7S9rKOraTVTAIODjGb6fpfIF7Kjks3GHf+8cY+4LoAu+p75ku6+/Oq5djeQvzLReUQCqcDOYVHvtcEzP/kp1J5jqi7SvE2+ZvdILVYFJ8J+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWeo3OmnZyQKwRGWwNDHIv4TbrlNoO5H1JHiMjSEuCc=;
 b=rPw0aiM0TeZrteWgnibd8vsiBdZgcDXEEk49sFXcxgtRCxfahj4smbmtPYCBt+FGc1t9/wePKv4lI9VDiX8+MrgV/7S+FK4pdRJTWd5BaU4BauGV9HnF8dn+cupO/2tK9xWU8a17MYxWnA7wv3YWV1ELUXFvoBJHw5fMCUZZ2a8=
Received: from DU2PR04CA0166.eurprd04.prod.outlook.com (2603:10a6:10:2b0::21)
 by AM7PR02MB6099.eurprd02.prod.outlook.com (2603:10a6:20b:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 09:42:09 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::de) by DU2PR04CA0166.outlook.office365.com
 (2603:10a6:10:2b0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 09:42:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 09:42:08 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 23 Jun
 2025 11:42:07 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 23 Jun
 2025 11:42:07 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 23 Jun 2025 11:42:07 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8E3FF31D6
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 11:42:07 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 8A31D24CDDD6; Mon, 23 Jun 2025 11:42:07 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] influxdb: Use GO_SRCURI_DESTSUFFIX in SRC_URI
Date: Mon, 23 Jun 2025 11:42:07 +0200
Message-ID: <20250623094207.2272732-1-christli@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61B:EE_|AM7PR02MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b973eb-7c87-41a4-7535-08ddb23a3880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fX0l0vpJz4I++0t1iqs5E+Uv4zebWxzKruKfK/X8Gx+uzqWwgPKBTRUoUC53?=
 =?us-ascii?Q?eFGhSghxeQxT8Fe4ahNYNOPPMImDjB6YyRAFDTK7eRH5WXUlE0TggtpumZ0m?=
 =?us-ascii?Q?PlnAl7ztlQOfqLuC9ARFI6WMS2xABpaQwzlAQeYszKjX9IBGELXGnN7+6rPI?=
 =?us-ascii?Q?t9cAyYFOJWEjfvbBXbvW2DAJmoqqxT1o2PnSqs0aY2LgVnDv5X2fpZ/NySVJ?=
 =?us-ascii?Q?+SXYmP6MzoIYsKW0mcnrZZEWTTmfCMUMZ29gfqGu0n+x+StWePF9b0GJ69Li?=
 =?us-ascii?Q?eVryUwucVPl/S2KZUlaMTfiEMyOB7jYNxjoZgRL3mACIaaxOH0JzetoZE4fz?=
 =?us-ascii?Q?0WdbiuqUUivihfpyBUDZAAD4CTnyTbNe/HbY/golEvS2mXz+rFVyawYZ79GL?=
 =?us-ascii?Q?bYxA/cME+g/TcIm0aLwJSZ1M19R/hjGfAywWp0QZtF+PQmHEy+8y/Z1qx5yz?=
 =?us-ascii?Q?S89xKTX0x3nIzTPk55lP+D6biGVKlavtC8Xsfo9VFS7xszWYk0TKKZg/YFmV?=
 =?us-ascii?Q?7oFmHOCLM6cv8YhUg/+yTYQid9kW4oSJQ2nINwhu3FZ3LpPPGTfvb/+HlnBX?=
 =?us-ascii?Q?qBMEDgPFUQ53KlBVd2+4ZK715x7UWH5e3Ji5Sp8FEx8xoqMoJkm+LgCJOG8f?=
 =?us-ascii?Q?A4KJkU/BoqSBJDdboLW6MnT4Cb5JWW0MZ6bKGqGtztMi/MEcf8y+SuANI391?=
 =?us-ascii?Q?HWhHfDvJXT46lHqaSAy6GdfDsVm3YDWEtMs31N3w0L7Fe3j/S7S82FUca9iE?=
 =?us-ascii?Q?Us9ed9W6Er3IuMHWNJ+YQwDMq2RLUoZmUHjcidaTmQNbM0yTh+l+CV88jQNo?=
 =?us-ascii?Q?fnF7nB9xqEk8J2MGhlGKd0YlEymHAqtOJMFgJrbO7T4ExFPVLcrUhtASb0+4?=
 =?us-ascii?Q?r/HA0kmrnD5gjF1yToEpUr5nLpTUMhfcM1vwqw6xGgq0uDF6wrYRtWUCpBfs?=
 =?us-ascii?Q?Du0J5oKMz0+a7+r9R6pM157uTOBWB+8AWOymumiP4+pJKqVLvpwOyrhL16Pv?=
 =?us-ascii?Q?+OqxTsPuFgp9q0t3JeQyt7eq6m8KjpMIuTNdc0v7sklFtkLk7rWD+sMmDASM?=
 =?us-ascii?Q?KqisIyxRsgfdQ53n4CK9hAoBV1cfTymcU3wQ/6h2Lk6DXJBh6C9ULqmwB5OZ?=
 =?us-ascii?Q?QjV9IZ6BuKBvs+6ZcCfLvKNy+eMd6MdmF/yo1MEKjzMd1E9zHOSN4anfAta/?=
 =?us-ascii?Q?1zlWIqNpZgwH+D3qpRNDmYG/l/jsXuOLHF7KITQr7hSTiGWiQ8iQ+Q3tP6b9?=
 =?us-ascii?Q?FIU1QD3MnJf374j9MBRHOPIdMN/viyN32suaLqZeWoHpdd5jYOMjxKNkmOgV?=
 =?us-ascii?Q?eMV3R5gBPYlkPHhg5kKTzae8eCCoFJqF+GJZmHbQjzY8J4igY46hbmKrpmd4?=
 =?us-ascii?Q?ZovZKvlK277huXHvPQNSeVx3lUYdjlD9+edy1yg7Et6CVX8qBo57t+hJA5iR?=
 =?us-ascii?Q?yFfUNF5QQHLYugtB/BT6wCsK/oi37WtQdA8yvfvY7jYglFKJM+/mfYkxWysR?=
 =?us-ascii?Q?2yAFdwCnVwUDifFMzqqI36BhWa4lKKoXrbPx?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:42:08.1735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b973eb-7c87-41a4-7535-08ddb23a3880
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 09:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118072

From: Christian Lindeberg <christian.lindeberg@axis.com>

Use the GO_SRCURI_DESTSUFFIX convenience variable for the Go main module
in the SRC_URI variable.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
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


