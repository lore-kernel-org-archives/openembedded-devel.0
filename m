Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1844.1794212297967440257
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 00:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=lUmW2N4W;
 spf=pass (domain: topic.nl, ip: 52.101.65.91, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5XXVMp4JmATWQdf+FWuri23E5TlytoObNgNWkAThET8wgAwetNg65PKunN0rFobRrD4IB3MJYj1DDo1liO10OVJiKCGqRJjgBVin44zh26OL4wEc3AF3wbc8Yp9bOJkjUGq95CIK6VWoOMe8cDa7WqTcv0F+0lsSAUT4uWgU4VAt3rJV+enAfKQz8eWSB5Ez93kMlahuKIpze2eYxjCupl4+M+57alv28xOvLK7dlkMbsz05ou8waPqJMgnMaGt9TCQHK64728YSJy9SPUXJC+5JBYL7lFLP5UwFzn0xGPphvhFVBBqwMwSYK73DxfuwJYL/nBGXAThWcqDWBp2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zsib07flwGSaCctTsvXBv39juGdwCj5177A73pUv7NY=;
 b=MKqiIRQCxajc9mzdsyIAFMrNGGKv3V0nSdQb6Qa8wIN7Fh3vKvLYCRZT5NZ98JdNBEO5uCyfHw/MHiFUO+kCKX+PuiC94wEkDV+6VfuGjMKLyJWO/otss7qC6/2aTr4/rDQpU+GRg16Lg6WPqwIVylqpWZn304Yt7lbix36gpE+1vB7IXK+ABnZy3h3Mz2hSj0R1xt3q5+RgXmRY08l56CJlGZmgJqm4gr5Cw5GkGz4OfNKdFcXGxEzDEPrflLnhQFxus3CIsJMcDSyBl2ebX/UHGbDFt8Od4ktGArkKUlcYDLZp+ToJdCdH1X9OLkk6DwbCdkZDRiZ9FBfCHfA9sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zsib07flwGSaCctTsvXBv39juGdwCj5177A73pUv7NY=;
 b=lUmW2N4W2LZWNi7l6ugMePIy2mP/Ke1TiDkoK4sPvgPde/tVhnvzabcdA8JZTaBtdLJ1m1vL8bqsqzFTMpBHOVt1Z/iqzqblxf0N9YB0V71voT5AY2m9JLdOxieTlCIa0JGLUwwF/pOuY4ZDjfEcucYcNVRIauRdYNHtSxOfqkiuNiqwZPO7smCs9MKeuJT7OM7YNoRmBQtQ/Z9mK4Q7X9zs1NP9nw6UGimm23bjWzyPb/UWsFxfFCyqc0gUpe56jqxcvaUiHyJTM+WLITXpnVnfQE75ajLjBKh4YxLni0rPPEkwSChGBh5sSW34RIfDTE6C2BzI8FEu4V0TKSSs6A==
Received: from LO4P123CA0449.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a9::22)
 by DU7PR04MB11233.eurprd04.prod.outlook.com (2603:10a6:10:5b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 08:18:12 +0000
Received: from MAD0EPF000008C4.eurprd05.prod.outlook.com
 (2603:10a6:600:1a9:cafe::3a) by LO4P123CA0449.outlook.office365.com
 (2603:10a6:600:1a9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 08:18:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 MAD0EPF000008C4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 08:18:11 +0000
Received: from DB6PR07CU003.outbound.protection.outlook.com (40.93.64.94) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 09 Nov 2026 08:18:10 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by DB9PR04MB11658.eurprd04.prod.outlook.com
 (2603:10a6:10:608::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 08:18:08 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 08:18:08 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
CC: Awais Belal <awais.belal@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 2/4] mongodb: update to 4.4.29
Date: Mon, 9 Nov 2026 09:17:51 +0100
Message-ID: <20261109081800.69803-3-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109081800.69803-1-mike.looijmans@topic.nl>
References: <20261109081800.69803-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.78567cfe-6977-4e72-ab22-bda8523a4190@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4PR10CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::6) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
Return-Path: mike.looijmans@topic.nl
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR04MB12030:EE_|DB9PR04MB11658:EE_|MAD0EPF000008C4:EE_|DU7PR04MB11233:EE_
X-MS-Office365-Filtering-Correlation-Id: 34abbe54-08b9-4cf3-1ae5-08df3e39fe6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|260925021311599003|260925022911599003|260925021911599003|10067099003|56012099006|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261022115727099003|261026130827099003|261009223027099003|261026140227099003|261026135527099003|261026121527099003|261028144727099003|261102123227099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original: 3O4jDiD51+yR9dixRLiBUeINIU4c+S1hKvaa6Dv5ERjbD2hGOpZ6/ErbzcLyzIVWdCgRVqF9KvfafE+792vgm+8klOJadEC8fUSwj/Mos133PYAIcGz5gMKxkhSr487ni41vzkH5xytJY2mbEVyFay4E8wrKCsZm6J4J+9UD0YviGDYsMaASQfHvWvql+flOhVXX4qnCr1w1kfie4t84KdlE1p8DWl5+Fg20qubxvB6Qo5rp4jbWz3km/ZlcNDiqVFJkqx+yjZHf/c+3AG+pXar/3muYZgeYcVTmpfKbqeuvGAqDJI7nX6JksTKtZ2Z1AAW6eEoaxqsC2DOgofgMBkb5Cjj72zFPJJQXKnuOSKSYeTjCbjS6vhZMMMyIcseBXEoX4XEwLQxGOxD1mfNFm4Oa1+M4O2xJQroG4WJBrsAZkERD68wa8nF6HE1uhLYQlrwcnShZNL+dCCt0H1PAOETljy00nzr1085QNPSR4DEvwd7AuTCt9+t0dJENxUQDXGkCYFmRVMHdvKx4OT3afkG54DnVhvKcEOi/QGtwaztylq8vP7iDPCZt5kLRrNCHTSSIOH4YfgVnMQKxS+K2if+UK2bJT20IDIFyAN9ErbIpZSaB9TSYMXnzoL3YHcziDcbvKvYPUkTE9qFXVNWFVDHhM7Ve/T6rFV8eZniJ+RTFs2dWNB3NH+N5hUlEgL9QOtVw4Z/xdawbxzN5Si5wEv2LVcKNS2y4kExV9N6RV8g=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(56012099006)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261022115727099003)(261026130827099003)(261009223027099003)(261026140227099003)(261026135527099003)(261026121527099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: qyDlIdH2WOiCy5vU7YLXfoy4LZe4A/SJ5zzJy3/QjzL2V3lauZyP/r5wG5gesAlx3g0JanASXye7h39g+czX7sJqSfqMRhk18htch7uONkCO1gE/dbIT3rEJ2CI2LALnrm9PMbQRlTcFC01VKWxpjD7gWfM2+/aiahMtRAEdY6uDBcsVEtGUNmiJucS9wlee2qHNDdWNsRQHTEcblRU+SHwcTOZodEKJfqrHjUSVqsEAlpkbrj2Pb2dIImQTAUnLhQpjOs6bC1K+I3QUoEpBhfRTCylm6wZLVlVZ8O6vbjzcXO8hVDu4dlbB+Nf6NxJU9vkYBJokx8n7ovN+fuBP5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11658
X-CodeTwo-MessageID: 2ae98902-b1b0-4c2d-838a-fd02924061b3.20261109081810@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MAD0EPF000008C4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d2743fe7-1dca-48e2-34f7-08df3e39fc56
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|35042699022|14060799003|1800799024|82310400026|36860700016|260925022911599003|260925021911599003|260925021311599003|4143699003|56012099006|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261022115727099003|261026130827099003|261009223027099003|261026140227099003|261026135527099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: zys/C3xMEk6gHz3ryO1GVGW/ihphD8U/6nDZtCRbUMse/O/adkkkR05s/SLOycsYbpH4ghxBiwlCBGJtbi9i/+M5ur5kXG0sHqW01QnHf8YbYuerSJTVOgzhVwBgRr76aREzW0gGN9n3y1cdlzdYZ8J5auFs36zfM/wVslrHZOJQKyPy+DWM6cWI1uJ0vTLrl8mpwp3/guoylhyuB9FsGQlhIXkON9aG8MAwSypc5YfE2xldzm/ZdU7ngUr0+zlHMDbmMusD2vwwdepWWXIvWiN2rdcFH6LairS7cO58vf+HmWtMknkfiXxYfEcKpX5WAeSj7JYXWXRJs6oYb4vL8RlDVkR16nQfNX9As3U/WkYHI0cVMs8qfMy5uIKI3S/7Pe4GH6QdKdWiAHxkKCIKNeNOf/LUOQpNcWqWpBPonrfV5FsRd0cAek4ob6usgPBDIMyBjcU2Plb3R3IR7HvR0fcseyIUySDTQrgt5MboAEno6x1AjstT36l/VQMz066XHv9Hb+lH+0/IZQ9kmB/TofJvMJwNDMVtvXMwfMVf2KUt6HgxSEUiF1m4ltmpLrL3Y3fEkQD+nHhMtguuABLfma2ZgVCCifFx2rG9VIJ5w7lW6lYS2nAGHNJn6h/eaS67Odek8QgAoRBzKa6lprZ24w==
X-Forefront-Antispam-Report: CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(35042699022)(14060799003)(1800799024)(82310400026)(36860700016)(260925022911599003)(260925021911599003)(260925021311599003)(4143699003)(56012099006)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261022115727099003)(261026130827099003)(261009223027099003)(261026140227099003)(261026135527099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pEnvPP/od4OV/mEAB77wD0i12FmgPNRMUtcrZyOhU1ky5eOnU+uqsRHzwTIFNfI2dIxmgbWGURqRiT4oeChfWabDC64hy0bqHCqjWcU3UPC8OhytRXa1jLSWu5FE2OUGfCIp4lNAl9xNNgVZ7IBP4jCNvDCwzWGkO/gV77LLFWjSjPCABZhnlbVxnYlXOffy9yxVdcMZsUdkr2umnW0AkUYMIJArepDYIJVIfEDE7pYlgPivXoK8ZolvXd2zCgTYhGPoXzv4Q5XVvGJNP2KNGBesgrbRpT6eMupRlAQiuN+jcuYORsRUH3beAER5PvixxYORnJJ8nF6z1sEfDXLWF8o+CRIwLjMv+eDokl7s875umWv7gVDQmibfMONiupVa4gCwsYXo6t8Q5+moDrLnJuLjdxUL5PPA19ybcohPuvR+xHxqnfsJH/FvMirr76Ke
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 08:18:11.1506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34abbe54-08b9-4cf3-1ae5-08df3e39fe6e
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008C4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11233
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 08:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132049
Content-Type: text/plain; charset="utf-8"

From: Awais Belal <awais.belal@gmail.com>

Move on to 4.4.29 and drop a patch that is not applicable anymore.

Signed-off-by: Awais Belal <awais.belal@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 ...001-free_mon-Include-missing-cstdint.patch | 28 -------------------
 .../recipes-dbs/mongodb/mongodb_git.bb        |  7 ++---
 2 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/=
mongodb/0001-free_mon-Include-missing-cstdint.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb=
/0001-free_mon-Include-missing-cstdint.patch b/meta-oe/dynamic-layers/meta-=
python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.pa=
tch
deleted file mode 100644
index 8cee14889f..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-f=
ree_mon-Include-missing-cstdint.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5d8218b8a1b5bc71e2a0cf543a000e194daba599 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 29 Jan 2023 17:15:30 -0800
-Subject: [PATCH] free_mon: Include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no
-longer transitively included [1]. Explicitly include it
-for uintXX_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- src/mongo/db/free_mon/free_mon_options.h | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/src/mongo/db/free_mon/free_mon_options.h
-+++ b/src/mongo/db/free_mon/free_mon_options.h
-@@ -29,6 +29,7 @@
-=20
- #pragma once
-=20
-+#include <cstdint>
- #include <string>
- #include <vector>
-=20
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb=
_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_gi=
t.bb
index 0f4a5c4423..339bb38a2b 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS =3D "openssl libpcap zlib boost curl python3 \
=20
 inherit scons dos2unix siteinfo python3native systemd useradd
=20
-PV =3D "4.4.24"
-#v4.4.24
-SRCREV =3D "0b86b9b7b42ad9970c5f818c527dd86c0634243a"
+PV =3D "4.4.29"
+#v4.4.29
+SRCREV =3D "89d6ffe6fc67b36fd47aff6425087003966588e3"
 SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3Dv4.4;protocol=3Dh=
ttps \
            file://0001-Tell-scons-to-use-build-settings-from-environment-v=
a.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
@@ -32,7 +32,6 @@ SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3D=
v4.4;protocol=3Dhttps \
            file://0001-add-explict-static_cast-size_t-to-maxMemoryUsageByt=
e.patch \
            file://0001-server-Adjust-the-cache-alignment-assumptions.patch=
 \
            file://0001-The-std-lib-unary-binary_function-base-classes-are-=
d.patch \
-           file://0001-free_mon-Include-missing-cstdint.patch \
            file://0001-apply-msvc-workaround-for-clang-16.patch \
            file://0001-Fix-type-mismatch-on-32bit-arches.patch \
            file://0001-Fix-build-on-32bit.patch \
--=20
2.43.0


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
