Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7335CE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 06:31:11 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.98])
 by mx.groups.io with SMTP id smtpd.web11.124558.1734589865252563198
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Dec 2024 22:31:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=oCB/Mx73;
 spf=pass (domain: gomspace.com, ip: 40.107.247.98, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOEiB/EhDRllPJFi7CXljCEge58A6mJmjWDJmBguGH617/TcoJmZoWn8hMxa1lHDjLwcz5oobJXBw3Y6oSns3VbjV2C+2EAR+8v/D2/4ev7RsxWV5UGTO3PZclRF3bcwXJHZ62pIUgiUj7+BJpZ0BmRFymec6uBvXW/dOpRnYzcBElMpPukmL1jkuqLBZdsS9V8R538Q21tW5PhU91lnYm7fVoJWizfhCsvko9jnmUG1UXKztkJjcLy6qYl/zo3sLkT2hg/1pUlRPYpHevQjHSAxyvhOnzctST3X671yW/t3+bYBwFu/paSH3nmHZwhHOhtdQPP7+hZc7M/MHllkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atgsiy/mjtIfN2PcG2+5aavu0d1UfXOUFa6oqyPFbEo=;
 b=epszXPhwCj3as/0Aqiw9d/NRurhjRiyP9pWAQvz1YnWj4caXD7uw5P4LapnSPP0v2Rxz/Vmy7cj4ZIzvJy93U/6R86xYBuwPrxSfCMQ3Dbf72A5wJO/YapBR0Sqb6rd6YjiT1jkDOmjARyBYapviMECCeZxr+xJhfVbq6WqpX4MBm6zzzk2yQD4ijwUQFx5IK1byEu2UQrQvDCxVf9OyS8Qbg1azuCNKqJDnzdv0rA59qI+tn7wZ78pcexhtFrn1QmMbtqCdTI4QNfdH/dX3Dks9SvZQ7UtKXvZ02bshKqD0UvcQfHf5FYLxPag9McWPXYLb48C10CA6qe+RdFXbCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 79.171.149.170) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=gomspace.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atgsiy/mjtIfN2PcG2+5aavu0d1UfXOUFa6oqyPFbEo=;
 b=oCB/Mx73EH6mbwk9q8BzEinCRiXdDU+3L4cj6aksq3wPlqYFRU9mPzUHeGqJT5fCwHqGGYI/P1meaf7WtE8/mt8Dl4knGmgGSpir3DzmOAjbY3ggVJ3RZlxuON+Y5WBvb6wgWtygQcZ/hPvdpgxh07rUBFKZn8XVzZmitV3TLgo=
Received: from PA7P264CA0171.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36f::20)
 by AS4PR08MB7656.eurprd08.prod.outlook.com (2603:10a6:20b:4f2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 06:31:01 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:102:36f:cafe::d8) by PA7P264CA0171.outlook.office365.com
 (2603:10a6:102:36f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 06:31:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 79.171.149.170)
 smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 79.171.149.170 as permitted sender) receiver=protection.outlook.com;
 client-ip=79.171.149.170; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (79.171.149.170) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 06:30:59 +0000
Received: from DK-AAL-EX02.gomspace.lan (10.0.1.86) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 19 Dec 2024 07:30:59 +0100
Received: from mns-T460s.gomspace.lan (10.0.8.155) by DK-AAL-EX02.gomspace.lan
 (10.0.1.86) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 19 Dec 2024 07:30:59 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][styhead][PATCH] pps-tools: backport a patch to fix prints
Date: Thu, 19 Dec 2024 07:30:56 +0100
Message-ID: <20241219063056.1902050-1-mns@gomspace.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EndpointSecurity-0xde81-EV: v:7.9.18.468, d:out, a:y, w:t, t:8, sv:1734573576, ts:1734589859
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|AS4PR08MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb6213c-2d35-43d9-d601-08dd1ff6b411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eQT9UP8Ak9YihiLKuVOZPMXdPnNTyIL1gtBi+uTCvntpxos2FLQlfEqyg26N?=
 =?us-ascii?Q?9RlmpeO99I4t9aEvRzZzmQmfGW6Jt+AkNMJcAFxySbz7QwVBImN6Ur4F/pi2?=
 =?us-ascii?Q?IxAepqQ7ijez/NNG2kUnt96XiWHnIDoTaokd5DYKLT1WvTyGMrmyP1NTL824?=
 =?us-ascii?Q?/62Fg5qpahXczrPHDA/uqboLkHeT602ddZ9LvZmYc7aQH6yiiF1qxXi69ukY?=
 =?us-ascii?Q?BCwbbOna3n/LpasO0nDfEyRN2WQpcbc5HNDxWEan7VcmSWYv0suy6ylB3UMl?=
 =?us-ascii?Q?xrPHLxV2rt2fQVGPbX1YWzA7nSs2zep9yzdJ6y6XJL4VjDeXphC2Lz4dBB30?=
 =?us-ascii?Q?TWDo+5KoQBV6CXUKjFFsY432cZVfKBPrw1QjBB7TRO1P2ERvypvtYu+F5i6O?=
 =?us-ascii?Q?5nXPtOMuaOeaUJ5/JViZV+N2hKGFgME2nhSSYmhHY05bdgA+cB9/FpLZWSyv?=
 =?us-ascii?Q?TfcrAE50v7zGXzTPP8oFpcBp28XeaOL6Vb2uEiHSpZGMjB7YAnPUNceRfsnc?=
 =?us-ascii?Q?xj4kGsaqyMrLKXYcMebc32BQdrYnxkIGVqNairK6YtoHlfAwV06H78elKLJc?=
 =?us-ascii?Q?6Tmb9Fqo7KKfkc8E1SlSK04PbBgpSuEtNlDOea6FvTML7nJDLdxchtw/Qs7D?=
 =?us-ascii?Q?j1kDdPhND6y2uTH6OQZfioqhQwv8Ov3d0bQJ1sKBsRG/xo0iiJJw2kFyRo/d?=
 =?us-ascii?Q?zWa5EGEqyAfsZ2KBAsTjpI0kHJ9zukj/cOMp7aCQY2LX5golIdnMci8TgFcU?=
 =?us-ascii?Q?KPJw+SUvv+oKXTmPKlxqb2S+xOtDMAIm2l10OIpksIOEjcdRcLfUawbyx+pl?=
 =?us-ascii?Q?SPVNWmJrTYjrg/dimD/g0RXnq8OOqWFX/2aiL1NwNOXa5ZUifvsboZMPeDyH?=
 =?us-ascii?Q?ONePLCsdQombA6kGvxuG6sX8gtKhNcmUtwrSBVSEKyEWzfExmpGbG/M+DMxl?=
 =?us-ascii?Q?QgvWQXqHT50e9sTka/0T7DgKt4xXxar5c/Uhgx9dbdTaY3nTzGf+Np1AVFSk?=
 =?us-ascii?Q?HZImO5QUn8RPaXlNS7SRnfXbMowETDMXHgB1yMXgePNyD7jlUU/RXVyaHgJd?=
 =?us-ascii?Q?HRDQPihQGvJdXIZUbD1m0qLo4YRmWqhdBzGGVbQMp7brOln/LBf0QvG9bEEX?=
 =?us-ascii?Q?h1kRk897UGXT1rwwBiGwFfN82JI+XhQiI3OsNQjgOry5rXjemgszjQvI915o?=
 =?us-ascii?Q?iJTwWuWJ8VW+FFhmLopohLchbvIr3B4JnhADUx/+ti4DQHnuXUHL8rt2oixm?=
 =?us-ascii?Q?ZluEkTcGZRu61tWBzeWjVZuz+BxHhhWX+CACn51epwJvpm6GUJvdDjGC4UEz?=
 =?us-ascii?Q?gLCstNisETGUIZNctpqAnfuQqkXAg9npdGYfZEsRyCnVpN7aYAl/culC9SxR?=
 =?us-ascii?Q?U61tD1ZOCamVpUkiAXL6UrtpIZxqSGgbEB3qlb0DXKMvChorjRdrrgg5G3NL?=
 =?us-ascii?Q?8KT2jAdWa5IduiRMvJJ3PvvlV7A+cd2w8g2b9tD0LUOiRZW9kXXzLVas4r+z?=
 =?us-ascii?Q?EjDBFq7+U3Ux0MU=3D?=
X-Forefront-Antispam-Report: 
	CIP:79.171.149.170;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:webmail.gomspace.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 06:30:59.9493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb6213c-2d35-43d9-d601-08dd1ff6b411
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[79.171.149.170];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7656
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 06:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114379

Patch reported issue observed on ARM32 based HW during bump
from Langdale to Scarthgap

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 ...-Use-lld-in-printf-for-64-bit-time_t.patch | 59 +++++++++++++++++++
 .../pps-tools/pps-tools_1.0.3.bb              |  4 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/pps-tools/pps-tools/0001-Use-ll=
d-in-printf-for-64-bit-time_t.patch

diff --git a/meta-oe/recipes-support/pps-tools/pps-tools/0001-Use-lld-in-pr=
intf-for-64-bit-time_t.patch b/meta-oe/recipes-support/pps-tools/pps-tools/=
0001-Use-lld-in-printf-for-64-bit-time_t.patch
new file mode 100644
index 000000000..058217d68
--- /dev/null
+++ b/meta-oe/recipes-support/pps-tools/pps-tools/0001-Use-lld-in-printf-fo=
r-64-bit-time_t.patch
@@ -0,0 +1,59 @@
+From 6faed0a3b41fba4619fe4598a2834dfb4d2be7e4 Mon Sep 17 00:00:00 2001
+From: Matt Merhar <mattmerhar@protonmail.com>
+Date: Fri, 10 Nov 2023 17:21:51 -0500
+Subject: [PATCH] Use %lld in printf for 64-bit time_t
+
+musl 1.2.0 switched to use 64-bit time_t everywhere, including 32-bit
+architectures, causing garbage values to be printed from ppswatch and
+ppstest.
+
+Use the correct format string for the affected printf statements and
+explicitly cast to long long to avoid potential compatibility issues
+with 32-bit glibc.
+
+Upstream-Status: Backport [https://github.com/redlab-i/pps-tools/commit/6f=
aed0a3b41fba4619fe4598a2834dfb4d2be7e4]
+
+Signed-off-by: Matt Merhar <mattmerhar@protonmail.com>
+---
+ ppstest.c  | 8 ++++----
+ ppswatch.c | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/ppstest.c b/ppstest.c
+index 0370794..c375a09 100644
+--- a/ppstest.c
++++ b/ppstest.c
+@@ -110,13 +110,13 @@ retry:
+ 	}
+=20
+ 	printf("source %d - "
+-	       "assert %ld.%09ld, sequence: %ld - "
+-	       "clear  %ld.%09ld, sequence: %ld\n",
++	       "assert %lld.%09ld, sequence: %ld - "
++	       "clear  %lld.%09ld, sequence: %ld\n",
+ 	       i,
+-	       infobuf.assert_timestamp.tv_sec,
++	       (long long)infobuf.assert_timestamp.tv_sec,
+ 	       infobuf.assert_timestamp.tv_nsec,
+ 	       infobuf.assert_sequence,
+-	       infobuf.clear_timestamp.tv_sec,
++	       (long long)infobuf.clear_timestamp.tv_sec,
+ 	       infobuf.clear_timestamp.tv_nsec, infobuf.clear_sequence);
+ 	fflush(stdout);
+=20
+diff --git a/ppswatch.c b/ppswatch.c
+index 5c6202b..15d7a77 100644
+--- a/ppswatch.c
++++ b/ppswatch.c
+@@ -148,7 +148,7 @@ int fetch_source(pps_handle_t handle, int avail_mode)
+ 	if (max_divergence < div)
+ 		max_divergence =3D div;
+ 	if (div >=3D margin) {
+-		printf("timestamp: %ld, sequence: %ld, offset: % 6ld\n", ts.tv_sec, seq=
, ts.tv_nsec);
++		printf("timestamp: %lld, sequence: %ld, offset: % 6ld\n", (long long)ts=
.tv_sec, seq, ts.tv_nsec);
+ 		fflush(stdout);
+ 		overflows++;
+ 		curr_unsync++;
+--=20
+2.47.1
+
diff --git a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb b/meta-oe=
/recipes-support/pps-tools/pps-tools_1.0.3.bb
index 65c06c1bd..34b4bbf75 100644
--- a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
+++ b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
@@ -5,7 +5,9 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882bb=
e"
=20
 SRCREV =3D "c50cb7183e252b47308fa22f420e0a877277aa29"
-SRC_URI =3D "git://github.com/ago/pps-tools.git;branch=3Dmaster;protocol=
=3Dhttps"
+SRC_URI =3D "git://github.com/ago/pps-tools.git;branch=3Dmaster;protocol=
=3Dhttps \
+           file://0001-Use-lld-in-printf-for-64-bit-time_t.patch \
+           "
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.43.2


________________________
This email was scanned by Bitdefender

