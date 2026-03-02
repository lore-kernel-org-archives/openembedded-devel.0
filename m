Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0500EA4E0B
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 14:47:25 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.162189.1772462844278866466
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 06:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FeLqvOqr;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.67, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0eZ3BAsY17F2FWoQk4dweKudQ9Th6mH0R/v3L4A/U0kUff6YSzKr1IQEPV9r6IPLySujDtE/HYz5VihYKNFThe5TJH0EpHC75WiBj9bwtiNCnXjK/XOSqDgg0HTAeOPn8CE/e6E22X+jJis4TDMEZj64YnISFbnKn2gq+Swhvw5ARFTmlW74AA0ggxeGqTrU4igbh2NKvkhuJqAKZ7gBf7U73bZx/VT6Sl3VZGhZKQx9aQnMy8irg7B+yshdsPEvEH9vPTGR3eD+xXYQ/DLpb9g6Kk0dKQltwrGrWJm+rBBN0qlDZDd2qY12yBZLy7L2hY1c6e5Hd3MW9+3BzlnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIjiN6rFrllwm9jXMQbOLwuqmCxNQhR3zyaNrhwWPAw=;
 b=eIJafz+418dvc5TemAzQbXBuYiB08DTJpev7lZgEwIY/Rzbhc6Z3WKQb+k/bQpBlpi1aXXjNno+80NlbFoTXD2EZ4eFIm+uwaa2AnhbwrKKxo9JSxMqn0XvzQsVwL7bZVzKmGP5n1DT+9yo38b5CMsvcprhh73/NDD5Aoglsk4PpIYyq7sKGV7tw1A3ZRZqqvIUZCotcyaXDLT0+CvxHMO9M6jbnbx4At3gR7r8Us/YRFa1BCOll/zKlSy6Sy/fU58ngcUEMT1PLv0OqRnuyerwRfqA9oqQ0zTJazrXC9QFbe2IzV4oT6m+dSAZnHXkcxCfHRL+dwOPNlHG9ePcpJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIjiN6rFrllwm9jXMQbOLwuqmCxNQhR3zyaNrhwWPAw=;
 b=FeLqvOqrjYqeu6OCJxQWCtzDBwUR/nVYO6soFZFxAx6QRjQKalwEmcRyaH8wmw+B25IzeJJpe1feTdrh/vJM1ntGLpV2O7CWxBiJB5EsnVSvFNVzDJG7eIE1bb29RknkCmSrCaLiVnY5Pt1J+5YsWXaN4oDZtqyQZrGcaT5WcjQ=
Received: from BL1PR13CA0203.namprd13.prod.outlook.com (2603:10b6:208:2be::28)
 by MW5PR10MB5875.namprd10.prod.outlook.com (2603:10b6:303:191::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 14:47:19 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::70) by BL1PR13CA0203.outlook.office365.com
 (2603:10b6:208:2be::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 14:46:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 14:47:17 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:47:15 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:47:15 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 08:47:15 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622ElDRV454548;
	Mon, 2 Mar 2026 08:47:14 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
Subject: [meta-oe][PATCH] nodejs: fix NEON llhttp ctzll undefined behavior
Date: Mon, 2 Mar 2026 20:16:34 +0530
Message-ID: <20260302144634.835048-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|MW5PR10MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6ab80f-9d9d-4061-f35b-08de786a9a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|34020700016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	48EY+iiZP0vw3VTOOpqepIhQ5EPrYmo1rdzulzbZIr2ZhYyxVtZStV8pYxNUrNRrNDyCDWkipsJSK+rowZXyezLC1x7UgwIxbGxB0Q2I3a1anDdda1fYffR0C2uvs2sOFKhfGNPasQxqNRBL6Lq8f/NQ6xr1nkPuqHn9zZGtOnVUZPWakKb5/fVCXUdj2iOFh/YAkMIL0U1jEq+XsDkqHcPBfo5Vjr28GskuAYfW/3IOcjqCukKHPca2Ql3ivIWx0mxlKMPmqftgUqx296qkLkYkVU3oN2Dl0klQsPQ1Mhv2xurs7tSEusy9tlAIqzOVjvMKQ7t2ybJDvm0UQUsYK8xHC6hRY9HnDIZ8DhPQEyIuDCLxfvhKi5XWqjUe+dppPaqFjMP+sZtS+qBtx3Uo9pbf0Z96Zu9qUqjobftD7XXr8TctfaMaHRySrjvhYyoNkDQ1hf6jxCausd3jYFmE9nKA9N9F5UHoTOdYY9FsfH5zCkJ6rCsLmqeXhJEsOE4BI8ZINGanf3Mj87sAiO5NEWEVJEoR36o9VoK35BkHmzN0VijgHjudduE1LR4C/j6Fdlw3k5Pc+c4+yo1jwSqatybC5mkQ/akUP/QV9Mrxd7dpPPDsWJSrb+/uiyK63ulhay0YROhqWzUm0QbQII0G9z0b3aBwd9dq7FNGRC3UwLYPKB8ivkyzYMqIUCNZFqXgzXPtUl6vNTpg7cdwUODSCxs/H92U5Zm5yuR+iFG+eWwj0OwVn62UF7+gXIOTzQiIzCmtafCUpeWgMW45Ru2sHg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(34020700016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SAhtvWMfcpqgiBQGDwZYQse6HaVEYbARk5mvBnazdYNdwDUXDz3E/ZO6Lmm2qPYzewX8aOeHnqbPT5agTWwOidnieRJyGEMEBuaSdVxuScW2ZXDSqM7ftVxeyB1hjkKRyLQov1TCwkiEERTg7q4S4oJVnRMLVFgGQ53Dij2YO8/Sa2+sh4A2LWhWV1ehFBB6P7YkUnPxz1JvJIq5Yh3eULx03M7SGX/1HWIaAIs6qaP+PJaVL80usgr9kw9+OsjmcbcvZbuVVNQqQSxSEC8wenX0Mbwu0ZpYxvYKDof6nU/ek1gztNiAhb2akKT80EE+IG8v1QOBBwHnaBtq7J0NYgREHnCmhAAMojfc2bZLrnzjrOtUhjGamoxAstfv5voJM62s2YGaARx+4GP5H8pnBqSht9j9ipIM06RTuzWsJJUYtAKH+d44IFtXYThShTtM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:47:17.8862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6ab80f-9d9d-4061-f35b-08de786a9a12
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5875
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 14:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124806

The NEON SIMD fast path in the bundled llhttp calls
__builtin_ctzll(match_mask) without checking if match_mask is zero.
When all 16 bytes in a NEON register are valid header value characters,
match_mask is 0. Calling __builtin_ctzll(0) is undefined behavior.

GCC at -O2 exploits this by optimizing "if (match_len !=3D 16)" to
always-true, causing HTTP 400 Bad Request for any header value longer
than 16 characters on ARM targets with NEON enabled.

Fix by explicitly checking for match_mask =3D=3D 0 and setting
match_len =3D 16. This bug affects both aarch64 and armv7 NEON targets.

The code this patch modifies is generated, so the patch itself isn't
suitable for upstream submission, as the root cause of the error is
in the generator itself. The fix has been merged upstream[1] in
llparse 7.3.1 and is included in llhttp 9.3.1. This patch can be
dropped when nodejs updates its bundled llhttp to >=3D 9.3.1.

[1]: https://github.com/nodejs/llparse/pull/83

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 ...header-value-__builtin_ctzll-undefin.patch | 60 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_22.22.0.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-=
NEON-header-value-__builtin_ctzll-undefin.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-he=
ader-value-__builtin_ctzll-undefin.patch b/meta-oe/recipes-devtools/nodejs/=
nodejs/0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch
new file mode 100644
index 0000000000..683dddcf04
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-va=
lue-__builtin_ctzll-undefin.patch
@@ -0,0 +1,60 @@
+From a63a5faea54055973bf5f0a514444532563cc20d Mon Sep 17 00:00:00 2001
+From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
+Date: Fri, 27 Feb 2026 20:58:43 +0530
+Subject: [PATCH] llhttp: fix NEON header value __builtin_ctzll undefined
+ behavior
+
+When all 16 bytes match the allowed range, match_mask becomes 0 after
+the bitwise NOT. Calling __builtin_ctzll(0) is undefined behavior per
+the C standard.
+
+The code expects match_len =3D=3D 16 when all bytes match (so the branch
+is skipped and p +=3D 16 continues the loop), but this relied on
+ctzll(0) returning 64, which is not guaranteed.
+
+GCC at -O2 exploits this UB by deducing that __builtin_ctzll() result
+is always in range [0, 63], and after >> 2 always in [0, 15], which
+is never equal to 16. The compiler then optimizes
+"if (match_len !=3D 16)" to always-true, causing every valid 16-byte
+chunk to be falsely rejected as containing an invalid character.
+
+This manifests as HTTP 400 Bad Request (HPE_INVALID_HEADER_TOKEN) for
+any HTTP header value longer than 16 characters on ARM targets with
+NEON enabled.
+
+Fix by explicitly checking for match_mask =3D=3D 0 and setting
+match_len =3D 16, avoiding the undefined behavior entirely. This bug
+affects both aarch64 and armv7 NEON targets.
+
+The fix has been merged upstream in llparse 7.3.1 [1] and is included
+in llhttp 9.3.1. This patch can be dropped when nodejs updates its
+bundled llhttp to >=3D 9.3.1.
+
+[1]: https://github.com/nodejs/llparse/pull/83
+
+Upstream-Status: Inappropriate
+Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
+---
+ deps/llhttp/src/llhttp.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c
+index 14b731e..b0a46c6 100644
+--- a/deps/llhttp/src/llhttp.c
++++ b/deps/llhttp/src/llhttp.c
+@@ -2651,7 +2651,11 @@ static llparse_state_t llhttp__internal__run(
+         mask =3D vorrq_u8(mask, single);
+         narrow =3D vshrn_n_u16(vreinterpretq_u16_u8(mask), 4);
+         match_mask =3D ~vget_lane_u64(vreinterpret_u64_u8(narrow), 0);
+-        match_len =3D __builtin_ctzll(match_mask) >> 2;
++        if (match_mask =3D=3D 0) {
++          match_len =3D 16;
++        } else {
++          match_len =3D __builtin_ctzll(match_mask) >> 2;
++        }
+         if (match_len !=3D 16) {
+           p +=3D match_len;
+           goto s_n_llhttp__internal__n_header_value_otherwise;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_22.22.0.bb
index 05fa608047..d08c5d8318 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
@@ -33,6 +33,7 @@ SRC_URI =3D "https://nodejs.org/dist/v${PV}/node-v${PV}.t=
ar.xz \
            file://0001-build-remove-redundant-mXX-flags-for-V8.patch \
            file://0001-fix-arm-Neon-intrinsics-types.patch \
            file://0001-detect-aarch64-Neon-correctly.patch \
+           file://0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefi=
n.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target =3D " \
--=20
2.34.1


