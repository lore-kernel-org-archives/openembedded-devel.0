Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92904107BCEC
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 23:24:13 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.453.1773444248207795179
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 16:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=qb3oZdfG;
 spf=pass (domain: axis.com, ip: 40.107.159.17, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOHyXW/j+6bDAR7Cwo7mvlDhdveuwH8uh1x6NjRLFnm7P+fkWynjeGr1LWv/r3pAryfP5Y2i4SRwz7n6pnQXvN+jy4RRvs1tC3x1uN/2NNNnhikyQK9Us9TLI8op3vjljFLwUe1N7o+8giuwyHUunTt99GttBEJwou52YpkKo6NAPRSkNCQfG2b/1BOw0wnQQZ41Dn3MtlcLlnsJAVMwlBnTvdVP2609xiEggQb1bO9L7ej/THO0fxrmKz4NAO8rkRry2ej2N8b9+gk1hmVgnL4rgpgPjRfYN1C/wsF6W1jWhguHBW1tUdFjVjtuLU4g2difRmB/h0JcQa0hW5lESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7mBDCzsfgzH4UIUrqIPoA6ia3WvJ0M4cF6zjTjG2NM=;
 b=w7jTitfKGOkv7MxqO1ULfh+miZz5gy97dSQfK6+IIXD0MNNZ4j6NpeQrbAgK2+EMvgkOie2tWxOyIKoILGCcvP8JEVoaPdbubU5iiugjq54OkLcHO2qHefV0tZbHeGuZIEEDpstfEsIEXF2x/fP8lGRxdG/OaFbaDILTo+WNWXalqUsBTVZxPrYPI20NqMzIFoB9F6zVwtHwG1JiZgOJrpl2D/q1U+XJVS8SMrLEYjTAbf2GnQtbd6ks9t6qkeQie9VlPrnVgueeiOwvSqEMDON3hfj1/avucsahzqmdlbAnddApjjHsj8WlNCuKGy94KXXGPSz73MAumdetUCXyKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7mBDCzsfgzH4UIUrqIPoA6ia3WvJ0M4cF6zjTjG2NM=;
 b=qb3oZdfG26E3U2IZdHaapDMoFZMP6kUFgcIhpelSuDYyfhVfR8M+HEjv0KWnLKAKT10GI0ZvuUtz6E2xAy2W3gQuk0NY34X4bZdRWeFDVGjdNpEX9DaSb891mZGYemzPWU173toLy/HjV1QKu9uouHwdnc36MDr+dVFM9uKKreY=
Received: from AM5PR0601CA0070.eurprd06.prod.outlook.com (2603:10a6:206::35)
 by VI1PR02MB6109.eurprd02.prod.outlook.com (2603:10a6:800:18c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 23:24:02 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:206:0:cafe::91) by AM5PR0601CA0070.outlook.office365.com
 (2603:10a6:206::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Fri,
 13 Mar 2026 23:24:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 23:24:01 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Sat, 14 Mar
 2026 00:24:01 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 14 Mar
 2026 00:24:01 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sat, 14 Mar 2026 00:24:01 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 0CFFE18BA
	for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 00:24:01 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 07D59120310; Sat, 14 Mar 2026 00:24:01 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] jq: Use Git to fetch the code
Date: Sat, 14 Mar 2026 00:23:57 +0100
Message-ID: <20260313232357.1729272-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|VI1PR02MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca631cf-cce2-44ea-318b-08de81579c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	We3TkWKfPRrKJuCTi33buZD90JrJDjmF+Y2vA2BURBLkpOztpvflLT9UD2/dKn1K0GRk93ahLDjCBqFWeC3qeeu+zFPx0XkmfY8meN6rJ4dzqREq9D6o8eJ6aPG5rT2MF7Mg8zrMCdCwhOajF9Rtx2I0FbaW5BPPGgAo3mXEWqgDD+M2m7LGFPF+P+RkxHBOHdtfIDI5zJv3cvsJBWJOxovwIer7QRHz5LdXEh5stit36NpW1Cj0rAvXBO9QNtur491804ulOFbSEsc3XwzQHfbXy3ABYm5cMiL3uq8g+QhKDZflgJQZGtKr4/aA5AuLUfQ+ZGxFUp1CzqOcNNj28FLrYyHlkbP9/J5J15YvQarnNZWnLOyr6QFnXZ/c57NCMA0D0KEFVh0xlkxYxYzha6LhNYDF8Zp44XcamO8YpEtPLQ6q9W7u8An068T5P7rkHQv7jExpRoJpNPGOtQwFv66oVSOOQ18EqvSJ8G52IFIHsm+/IKlwg/GIf6i79cfA0RwQ/HdEnsErcWJ6xC88O5i2bGqIywgmAdcLN5cKkD+CiY56MyvV50/2BbjZu3nQzbtZK9Fjxu/25nDu+fIxaGF8LQLmayHL58yU2QKTH9tmqnDMHL3+CzbE5VMetf7vK4iWOVZt5z5aROlH3Xx8Vorzk1ez9fJIX8tqyOThzRvRqXxFW8RFDYM7/ephLVbKi3DLSW1gQjq99nxl2RM66aWkv//DqN2GPjpxb7PXKeU=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5KxjBHscyTvSC/6Xphc4Jrv1R/d8gnlDN8EzqKyc7QGeVcyTrj1BKACLv5oZ+4iBI0fmTgtkc/CY0nOahwM8+N+DsX50Af0xnczdhSF6wur6w2xqXflm299mr7bX3yrsZUsEDMuILVqiy070e4FrBh6cF+xt50gj1yvffXvpYm+CUVfy1Xc/dXZvfZVE7n434vNGG7mo+GIdwYkMqf/UY+Lc/niDXapfw3lF8X+fZqOzTTB1TwgRElNr20gU1lYC0b7qMbTNHurFAkhi/xhChD7IA0Q5roIveQO1Mm7Oz6lR3+MSSHDhmL7YbmkMLeYgC/cXvSSfX/ZMy9javAL2kF9gs7x8/KCyEQF7AdbbR/M5V21SbC1lKSGKDD65yvxwPh3mrvbl2TP7iEpRAlerTugE9KFg5H0Ilt+V8QcS4GUTeJnPnb+U3ESivR0gNBkk
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 23:24:01.5739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca631cf-cce2-44ea-318b-08de81579c36
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6109
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 23:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125193

There is a bug (see https://github.com/jqlang/jq/issues/434), which
results in an empty version being used if autoreconf is run on the jq
sources when using a release tar ball. The incorrect assumption is that
autoreconf is only used when fetching the code using Git.

The empty version results in an incorrect libjq.pc file being created
where the version is not set, which results in, e.g.,
`pkgconf --libs 'libjq > 1.6'` failing even if version 1.8.1 of jq is
actually installed.

Switch to fetching the code using Git to workaround the bug.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index b9383c76f7..f2e90f72f5 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -8,15 +8,16 @@ SECTION =3D "utils"
 LICENSE =3D "MIT & BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcf7fcb0a1def4a7ad62c028f7d0dca4=
7"
=20
-GITHUB_BASE_URI =3D "https://github.com/jqlang/${BPN}/releases/"
-SRC_URI =3D "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz =
\
+SRCREV =3D "4467af7068b1bcd7f882defff6e7ea674c5357f4"
+
+SRC_URI =3D " \
+    git://github.com/jqlang/jq.git;protocol=3Dhttps;branch=3Dmaster;tag=3D=
jq-${PV} \
     file://run-ptest \
-    "
-SRC_URI[sha256sum] =3D "2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a3=
11dc33ca837eb0"
+"
=20
-inherit autotools github-releases ptest
+inherit autotools ptest
=20
-UPSTREAM_CHECK_REGEX =3D "releases/tag/${BPN}-(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_GITTAGREGEX =3D "${BPN}-(?P<pver>\d+(\.\d+)+)"
=20
 PACKAGECONFIG ?=3D "oniguruma"
=20

