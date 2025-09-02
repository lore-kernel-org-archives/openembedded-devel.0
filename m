Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD369CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 14:30:48 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.22])
 by mx.groups.io with SMTP id smtpd.web10.78942.1756823438585184804
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 07:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=pF5jTIL9;
 spf=pass (domain: axis.com, ip: 52.101.70.22, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBjmNlFnvx4ASW9h0A3cydZwL7SArqokC/x5O+xNz6HChMlkUB/clolzbbXFArmr0veOfzsloUk3L6vgJfm1gVCIqnJS2oR3FOd7T6uKJvZXvvbFco4ZYTfxjZZYkqEWG/NWXIa1pNYvF9hDDlzOPce39jlk26T3QDhujXtRP0R+CX6aQdC3346ZeUo60dXWX60O/YmCiK407CQPsVs2XQ9tI1ur1gNBBMSp2NHJwAqEq6xE1qFNs66OBCHwSPIlWZfj+zBCa88FhXue50ZoVyvYChMugMRMzMW+2ztMPsb2oN9T5AVY3NjMTh0nejhnT//hGez0ac9Bqri+prRttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CqS3TfP4x73HVQvSWQ11beqVBkQdGNUwhoJTARkw0U=;
 b=YjIq+J730NQGKFgRUlrj2+btK5zkKz+jeBDTSr8oqNRBxp2xDP+L4cHLqqoVggBYbWBNPr0AII97YM3PX1BZkEp5EDDng4J1rbqmhCUvKd51N7xnNdd7D4u9DkU6wSyWov+txY4New/mFGzpOrYWcUPtnOgXwDbH8eSrA8nGRtdB/6xh1mQ2YXpUJsEVpomdHpJrcD9sNd2W+mTKOMZf6WiEYd/gRw0tKOpHWQiHtDIiw3oGuSj4rvalFHlUD80hfUPsiCRsurld06Qk1akxSqL3qDBK47Pc9tc5ANlzA/diX9jYZWRLCpZi/iomGKsAHDVL7a3z9UIs6uudq/ztBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CqS3TfP4x73HVQvSWQ11beqVBkQdGNUwhoJTARkw0U=;
 b=pF5jTIL9jpA/KXiy5D/akybMOGLthXzcoXWkW/ylEk/cocug9hb+dpWx7kpF5pvHDfzoIw0B1jX659NkuYA1CKwX6J3Mu0kb3nXvQl598NzIpm06M0ET67T08jDPllLET42HGV9iY5AB5wY3KM7+wByYmT3aZd2Gs7QHNUzc0u0=
Received: from DU7P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::26)
 by AS8PR02MB9209.eurprd02.prod.outlook.com (2603:10a6:20b:5b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 14:30:32 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::49) by DU7P191CA0016.outlook.office365.com
 (2603:10a6:10:54e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 14:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 14:30:31 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 2 Sep
 2025 16:30:30 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Sep 2025 16:30:30 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 8A7AE2D5A
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Sep 2025 16:30:30 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 875722426D0C; Tue,  2 Sep 2025 16:30:30 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 4/4] influxdb: Update module cache content
Date: Tue, 2 Sep 2025 16:30:30 +0200
Message-ID: <20250902143030.139421-5-christli@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250902143030.139421-1-christli@axis.com>
References: <20250902143030.139421-1-christli@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B88:EE_|AS8PR02MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: d10aafce-3a31-4e31-a98b-08ddea2d45b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F5R8ix9O8hjBkLUyJAOGaRLuaJunNfakQ4023RYpCHDflNncFmgXPj8Qg5Wf?=
 =?us-ascii?Q?SCI9noYSJxlYGcICogJaqo93kCOO5Yx39ivAhfl0N00sB00+5Ln8pWhi65YP?=
 =?us-ascii?Q?ObVe8tOBQLKO26c6CM+wNIFJdUmSMrm94rwUs50ToKmqBXOP9giJxl/W0ZNn?=
 =?us-ascii?Q?yeXbAWLOdhs34rgOH16NAnzuDGuIXhmSZ2QAH4J6fwCBYVH5B6H2FvRtFUbE?=
 =?us-ascii?Q?6nwq6QD5rCeE3rjyu6b3uQAyHeRw8QgDhrWqaa4U9xpFi0j1dpr54VWh5BMf?=
 =?us-ascii?Q?4ln9G2gASDju/ADFx9iiUMUD5sjxg5EeqUbmxP6855P0K4KZxZciLhA6wgSr?=
 =?us-ascii?Q?APmEMuOflT7KX8iwtUm2yGTGVPhTG0t3wEU7ceGzHSVKWSa3IoRMFvxUA/NR?=
 =?us-ascii?Q?pcZn85TWeAF6urUl0APO/GIebdjfONco215s8NDIITJ/z31lOc9UPjLQlh2b?=
 =?us-ascii?Q?vhuxVNOrXR9AKLdGJKHcetRLc3tRkRYp+aSfZykNfzUloLNX/M+oJPiHXs7Q?=
 =?us-ascii?Q?EaBwdp3QziRdPdOtdXrt09wdD5JMiDcesNStlBT8yGZMgzi/o3iVQomFAhk8?=
 =?us-ascii?Q?fUFP2Pm+fVmXaYCjCgLdgiVO4RDkLGb0UdaMha+kPrpjz/p/ryAE0DUtO5ie?=
 =?us-ascii?Q?fekjggkcw7H+ojRd9hiCJYr//F2Q/Bq2TgQfsp2CpRmqZNc3YeNvtad3kqHM?=
 =?us-ascii?Q?bRonGMKxj4Hsg7Zg/fx2KW3xt3CYbcbgQbOvr05vOvAxOn7wDMWzU3ESn3r6?=
 =?us-ascii?Q?QGXuUDiJODu4Y5JUgZXGe33WyPq0PtLspSwOL+Ta2lw9icdGVHNWLt4fWiOw?=
 =?us-ascii?Q?xbPSxPjLFrt4LlTfikMYuOXsWxv5sqbwbLmmeOKz+DTxJd7HYOX8m1SRZitR?=
 =?us-ascii?Q?nlacoYY3quCVbcTyx2lIgLPcWBjR1zhAJ746PIjbsiG9nyy/aYEpUxCwoX62?=
 =?us-ascii?Q?PQNFXbsIE60rbfpG2n9dHPgvTArdzsjQR9APQgyUc8kg59nd0z2THsyISsvR?=
 =?us-ascii?Q?xdB738rhpu0DSc6BfQ1SXrq9fJQ1TWMOcNm4K6IEOddHV2NxQ+Xx2flfD6W6?=
 =?us-ascii?Q?ziZ/8v8WTX73O/7OxjjrUCw3JIjCxmJcaz6PouDemTYeSQDIRYTrNpXCbJN1?=
 =?us-ascii?Q?tVpY+QZvTr5XeUzY3t6z4nvSZceQeBrYX8z5C1m2rXN25IloiBe1W/+qrSc8?=
 =?us-ascii?Q?EJ/m510FurknoW62veiRSizxigsfe048YqBV2wmUCckD5uj5EYKIhtbthfbw?=
 =?us-ascii?Q?RdrEjX5SLCXN7UfSy/mTb/4zC5ZTd0kAPOW2JSp3DitdHAp+94Gw22Qys8Qq?=
 =?us-ascii?Q?0hElDzOgOo7I3EJNkyarwAyypegL177QQTicQyRtlmYXg31EbgpgUDfXOfUv?=
 =?us-ascii?Q?RPHFhujgSuifiX3GBTpgD+HAf4wUbYMxnXYkOckPR5Ie9WRHt69JzsTE5lVT?=
 =?us-ascii?Q?hnND6DKqTaPpMzTjVHjbKspyImBtii8Ka6KWJK8U4HMflwUhhht/K0B4EbaO?=
 =?us-ascii?Q?nmFdUrTWtx9Z+nJtlYNzM8L37YXmunjDWo+C?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:30:31.9984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d10aafce-3a31-4e31-a98b-08ddea2d45b6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9209
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 14:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119182

From: Christian Lindeberg <christian.lindeberg@axis.com>

The Go module cache content URIs has been regenerated by listing
dependencies with "${GO_INSTALL}" instead of "${GO_IMPORT}/..." as the
package patterns.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc b/meta-oe/re=
cipes-dbs/influxdb/influxdb-go-mods.inc
index e191426431..28927580f4 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
+++ b/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
@@ -119,7 +119,7 @@ SRC_URI +=3D "\
     gomod://github.com/kisielk/errcheck;version=3Dv1.5.0;mod=3D1;sha256sum=
=3D107d26460d41b5322b6911c9b5eb233117421943b3a1453ba99f01c4fdf2f8e8 \
     gomod://github.com/kisielk/gotool;version=3Dv1.0.0;mod=3D1;sha256sum=
=3D77aca7bffc0ec29fc9f088d5962ab3128f405d7b10c7ceb9693ff7a08958955d \
     gomod://github.com/klauspost/compress;version=3Dv1.4.0;sha256sum=3D4af=
2ed530c00d9d09a72af0b4188dac27a38548ebbd953db7f3fb22a7f671a49 \
-    gomod://github.com/klauspost/cpuid;version=3Dv0.0.0-20170728055534-ae7=
887de9fa5;sha256sum=3D7073c12479a7d29db4ddaa4250a029b165fcc43c25987f43525ae=
9ea3e7ab102 \
+    gomod://github.com/klauspost/cpuid;version=3Dv0.0.0-20170728055534-ae7=
887de9fa5;mod=3D1;sha256sum=3D9b443b5b06355eca91f4e773a4df7d8a3bf0c9abad5ff=
472d6973e688e6a9392 \
     gomod://github.com/klauspost/crc32;version=3Dv0.0.0-20161016154125-cb6=
bfca970f6;sha256sum=3D6b632853a19f039138f251f94dbbdfdb72809adc3a02da08e4301=
d3d48275b06 \
     gomod://github.com/klauspost/pgzip;version=3Dv1.0.2-0.20170402124221-0=
bf5dcad4ada;sha256sum=3Ded381fd7fbfbdb0379158426552b772bbaca91d9fee1a112a84=
d4500da072dd5 \
     gomod://github.com/konsorten/go-windows-terminal-sequences;version=3Dv=
1.0.1;mod=3D1;sha256sum=3D6b69dafd3cf64d7b57e978848a7e271a2be0a04d9a2564dd2=
556491d27d0a034 \
@@ -144,7 +144,7 @@ SRC_URI +=3D "\
     gomod://github.com/mwitkow/go-conntrack;version=3Dv0.0.0-2016112909585=
7-cc309e4a2223;mod=3D1;sha256sum=3D3f15a518f37228f2d08c6b43762d43869a5ab8ae=
7ba3b5124bf961035e71cc18 \
     gomod://github.com/opentracing/opentracing-go;version=3Dv1.0.2;mod=3D1=
;sha256sum=3D5b59c67ddd6e8f240a0008f739d14875c1af800b8e1b23d95c10c8bea49655=
d7 \
     gomod://github.com/opentracing/opentracing-go;version=3Dv1.0.3-0.20180=
606204148-bd9c31933947;sha256sum=3D9f713f45fe865453738633a69f35c8279ecb88f1=
30ca2a140a7b44385656f776 \
-    gomod://github.com/paulbellamy/ratecounter;version=3Dv0.2.0;sha256sum=
=3Dfb012856582335cdac02ee17c08692d75d539158a82eda3a26fb8a51d4ef27e6 \
+    gomod://github.com/paulbellamy/ratecounter;version=3Dv0.2.0;mod=3D1;sh=
a256sum=3D775c317e0e805101aacf9509f43a700e945f81a5348fd963b4db1a47d7c1b3bd =
\
     gomod://github.com/peterh/liner;version=3Dv1.0.1-0.20180619022028-8c12=
71fcf47f;sha256sum=3D0d96c450f9c55a8102f4ae7fd8a583ebfaeba23e3939d6b6284306=
a82a21430f \
     gomod://github.com/philhofer/fwd;version=3Dv1.0.0;sha256sum=3Db4e79b1f=
5fdfe8c44bf6dae3dd593c62862930114411a30968f304084de1d0b3 \
     gomod://github.com/pierrec/lz4;version=3Dv2.0.5+incompatible;mod=3D1;s=
ha256sum=3D2a50cf1993308244414372349e500770dde0671ee259159cf305f4b1f84ebae9=
 \
@@ -161,7 +161,7 @@ SRC_URI +=3D "\
     gomod://github.com/prometheus/common;version=3Dv0.6.0;sha256sum=3D6fb7=
4cce1a5bd84cf36954493d6157b1bd2231b20ba2587c224df9737b579314 \
     gomod://github.com/prometheus/procfs;version=3Dv0.0.0-20181005140218-1=
85b4288413d;mod=3D1;sha256sum=3D52ded709607588200eff4bcfbd61fce32bb0c3f0efd=
d32d846e3ea150b196352 \
     gomod://github.com/prometheus/procfs;version=3Dv0.0.2;sha256sum=3Dd5e9=
430b0a3209ccd75569f7c6f9c9fcfc48f554557f44562352adab9c617464 \
-    gomod://github.com/retailnext/hllpp;version=3Dv1.0.1-0.20180308014038-=
101a6d2f8b52;sha256sum=3D7863938cb01dfe9d4495df3c6608bedceec2d1195da05612f3=
c1b0e27d37729d \
+    gomod://github.com/retailnext/hllpp;version=3Dv1.0.1-0.20180308014038-=
101a6d2f8b52;mod=3D1;sha256sum=3D57ec187307e4b0d0457a8a28a6a32f683e4cfa374d=
2449fa72838a18b1230e2e \
     gomod://github.com/rogpeppe/go-internal;version=3Dv1.3.0;mod=3D1;sha25=
6sum=3D33b55e839b0754283c3eeec1f33e16cc66432dffb8b8a96d24f536d01e51495b \
     gomod://github.com/segmentio/kafka-go;version=3Dv0.1.0;mod=3D1;sha256s=
um=3D02ca00937516b509446c5eb0bd0a4e613b76388af2a65e58f9669434ca0668b6 \
     gomod://github.com/segmentio/kafka-go;version=3Dv0.2.0;sha256sum=3Db2a=
88eb5b65fbb75dac0ba5e721cd2cb8e39275d1702a0f97e3c4807d78e8b48 \
@@ -170,7 +170,7 @@ SRC_URI +=3D "\
     gomod://github.com/smartystreets/assertions;version=3Dv0.0.0-201809271=
80507-b2de0cb4f26d;mod=3D1;sha256sum=3D75ccd8771f23a04379e7631044c4fb70b49b=
27a09650299752ee712f08a6add7 \
     gomod://github.com/smartystreets/goconvey;version=3Dv1.6.4;mod=3D1;sha=
256sum=3D37e964c8dc1be33116055227dc75838037c5b5cbbe1b7923d6c6270d0eeafd05 \
     gomod://github.com/spaolacci/murmur3;version=3Dv0.0.0-20180118202830-f=
09979ecbc72;mod=3D1;sha256sum=3D55565ffdc59d315a952774815afa98668ab9011e8cc=
11e35be5243e63a23260d \
-    gomod://github.com/spf13/cast;version=3Dv1.3.0;sha256sum=3D001ed519a3e=
c007e76e639f72bd9560be70497d499acbf1a32ccf32dc4647d91 \
+    gomod://github.com/spf13/cast;version=3Dv1.3.0;mod=3D1;sha256sum=3Db98=
f2c1774e0b7c0c5747531a6a0c6c8c25a37cf397ff05f1971bbdd97d52fae \
     gomod://github.com/spf13/cobra;version=3Dv0.0.3;mod=3D1;sha256sum=3D41=
ec7f1a12f7934ac349ac6b87d99bc43a8ec4405ef968f3bf0bd0a32625d76a \
     gomod://github.com/spf13/pflag;version=3Dv1.0.3;mod=3D1;sha256sum=3Dc0=
119b5dfbbf3c0cb02b168ce0fcc19e7edefa73c9844c4609ebcb57f4394d14 \
     gomod://github.com/stretchr/objx;version=3Dv0.1.0;mod=3D1;sha256sum=3D=
1350354d52d2287a62336ecc0d56232d4c47699af9bba49c67c2b48254da98f1 \
--=20
2.39.5


