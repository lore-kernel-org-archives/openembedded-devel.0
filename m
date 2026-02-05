Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C15DECD99F
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 20:03:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30241.1770321784334248834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 12:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QU09hgE3;
 spf=pass (domain: axis.com, ip: 52.101.65.21, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAW0Uzur7fHn6vAujYP+EAtUkI30QgxcCM7ATlZ7Ga+1KCs5BgIUo9Dz2laN7/NbGBlHITKegUD4uaHl5iD3nYJbgenWACOXLyw3zAJ9c0UTPIoObsZ6fyySbJKPUw0Lx06e0/CZKm0AQWMr7nIhgT+5MztPmSK5GByVuHyRS/557equ7iKUTlKw6XBRyhXeV9FlMQ3FLFNNF4qtq6YjpAUwBmm2kMZWkAU+l6wgmD1jw+o7zkJldEKnlA/k/kpVPEVCc6XOcsr6iAJkak7SHMy8HS003P+6fAddZt9KboRx+hec17K9SIAwrs4/ot8AS8YUPgaGLAlpL2ij5LISAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LW2ltwmvXXlhSUFNFwQH2LYTcPjutSi/PqCD8JPgjTY=;
 b=eUQfA1122GgsgkgOHQnNCNAXaeN+hmxGSILaCw1bc301HYpXmoVCwIroUM62ef7Y5CMBvteI84syFSlYXo9Ug7w3xdtyuEZL6fKCLmHQpeNSG5a/0ImMelNpNaep9bu1wCeKall3tc/gmJ6HNHB6ONdJJxb8ipESqYeyf598trRuhMImFRwZFTAD+nQfWaTdoumvW3bOMs7aS1N8Jo37M9FSeegRw3Jl52wJamkeuKTr4bDmipoWRmowIHaNAjzyqbSkhnwxl5UKQw4NyVsEVyoMxsJQVou0HnkayhY47FLVM4f8+DJCv9RgSRdO9ZDVD3fAVXTp8Y1hoSfMo8VrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LW2ltwmvXXlhSUFNFwQH2LYTcPjutSi/PqCD8JPgjTY=;
 b=QU09hgE3LeRkKTXDTZDM8tyb9XvGpoCpbaF5yvHyC1kLsVr6aTWsZXLoegSAa2hm2AKaJ5tlY1FNClIL4qDM26DsrCFBkU827ARsnXFVcWZeaV2mFxOxK459QqHEeVWUIt65InM7pNvfTNzj2agi2VV2ZireyCxHlZljyFi6qb8=
Received: from CWLP265CA0415.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::10)
 by PA4PR02MB7006.eurprd02.prod.outlook.com (2603:10a6:102:be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 20:02:59 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:400:1b6:cafe::f2) by CWLP265CA0415.outlook.office365.com
 (2603:10a6:400:1b6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 20:02:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 20:02:59 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Thu, 5 Feb
 2026 21:02:59 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Thu, 5 Feb
 2026 21:02:59 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Thu, 5 Feb 2026 21:02:59 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id F0C5318AD
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 21:02:58 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id E51C6120274; Thu,  5 Feb 2026 21:02:58 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] glaze: Update to 7.0.2
Date: Thu, 5 Feb 2026 21:02:54 +0100
Message-ID: <20260205200254.785471-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79C:EE_|PA4PR02MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: b0738b5f-9d07-4ad8-489e-08de64f18fc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W27hjVdMSeUNfiGnwo0wEnrkuUsgPCOf23n7ajX/lePRsREDlqHrVfRxaLBc?=
 =?us-ascii?Q?6R0+ye3Wp7lW1fSG7fiqKxOQ+fPQgBpgBOdhSjFg5U9BWjhrpp6EUMiPKCKN?=
 =?us-ascii?Q?GwJwdWZux0G45QWh0GK3H0Tkuhucs/gXNkuVh5K/OB+0f2SZfL+gJOlsdegb?=
 =?us-ascii?Q?EDCEqdgOp2X+NV8MLaVK6HD7/HTv3aoWYHjBCLaS9pzjparh8XvdPUkENg0F?=
 =?us-ascii?Q?Pj49zSOEnVS0aHZB8Eylt6WZUd6rem6KSh2DaStGEdqMd/ccW/j7Cu4Dr/fM?=
 =?us-ascii?Q?zS1+r6Xg1jDnsEtOh86H3vWCD3lauo33Jt0NBVlA9WxvxcdvCcDUFuUn6zaA?=
 =?us-ascii?Q?vT/Jn1gYvAFhhab2PvESbNx9UdrJzFZa9zwuR3fwa6cjKVI50OqkZIUK7Umj?=
 =?us-ascii?Q?WXyqlbUbLqAFt/paE/723ue08CZqnsbNuN2exdu1HyjQ4gffdVyLTsbvE4P7?=
 =?us-ascii?Q?Vn4ewfd0E6hYgyOMmZ0vE2lRhbv+6wFAhkw7sNKTtOCCTE8t03zmdO8ynTyI?=
 =?us-ascii?Q?7YTwlpGM8tvef0T1IEqTkH2gQ7rwLMHZee1sc0tmoiGup/NQ+NHPCI2mV9dr?=
 =?us-ascii?Q?iaxp68Hyfuww1ccnnWlGqyC1D7mvAtuoRkIG+BfmQnI22y5tRXDX1L1fEDn1?=
 =?us-ascii?Q?Qv4RkT5Gh5NPAB4x3jFVKG2g2Ndb2SFwbteg59hmJHfI0SR1o0poKyOguyrW?=
 =?us-ascii?Q?NM86typwUVEKhSGGD4H22Yih7zDqWzZaA7fGPto9juIBqi7J7rKQdYrUvfYd?=
 =?us-ascii?Q?A7Q5QEDZfBcnFC5WkvPSzG1ulKj2L+tlTkdHIU479S4p4IU7ljqLawqyDeox?=
 =?us-ascii?Q?CrRSaFLkDTOVVEI6jMP6IBA5kyzsAXfBoCKgPQBbr29DhCmnbfLn02aGMdYY?=
 =?us-ascii?Q?nvB/7k8TjwiXVhDtzmORrr5wmS2HbW7Wz/bGOt+/AzdRa2PGEDJyns3qcUV7?=
 =?us-ascii?Q?TgYuzIPngGEaFU1WPAx1tFZtQXYx56cURptqmFxo5PpNSuSvUuu6IcZxx41F?=
 =?us-ascii?Q?KQR00BtWdco4F6tt3Vpd606gYiRx7zyyg80V2Op57K1JtuQTkJyLyt8RLEnm?=
 =?us-ascii?Q?c1wAqh4x2KO8d5HnG3EgRwJB7JRjToTzurjU2IkTxPYdsdgEf4suceeXLQsJ?=
 =?us-ascii?Q?HwfDLQy/YgRA8NAub1eT6YvDVycu5A7C54KkWyIGKLP5O01jt1nHdNDARQT7?=
 =?us-ascii?Q?4P7KRGfMfhc/3vq82oAvMlZYjW9oDAHi+ol23xpxnhGEyRs1rZRyX3DnGTem?=
 =?us-ascii?Q?DRJUdwdQy7RKpNro4qDH3wTusYXJzId2ddp0xgxgXbqKILf+wgL0NwLWuxNW?=
 =?us-ascii?Q?uykgB6YcG44sPrkmLl82FvQYlF1JUwcCgZvhWRtwMstT25vDkXV9RdQChP9n?=
 =?us-ascii?Q?+Wj7iZoau5kL43vUQIo/CyGnaOAFUdaTrVCQmkFT1wZesVtT3Y6k+Y3Vg3iC?=
 =?us-ascii?Q?n7bCcb5LHRGv15mFcN5Is7mj90m7QfRnJSxNXOxGmtQZQjtKly5Tbr1G7i1l?=
 =?us-ascii?Q?bRBvtmIpCFVVvw7pkcY4d3JqCCuC9Rc4gJEOliWV8BAReZv+tzcgjmccChaw?=
 =?us-ascii?Q?uW6mqVi2TO9I2Uk855NWwaIYyU0gBXaaZDPb1D3BvvwcMjpc6OVJ/QRaJ4si?=
 =?us-ascii?Q?Nr+ELcBViRbR5aSc9MAlUHnBnG3h0J4c/fImXEt0xuV0rMnClLntw2GJ37Ev?=
 =?us-ascii?Q?NBwtQw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9ELk7wTE0t/Z86xJzT38J0o2ez18nOZM+usrYKiuLEycAgwGcvY3PEgx+awBcl/WbsHTjMRUfXPIbyhEuUKGvTqPRq1czPMa5ZDsWSonHhGHrB1O6do5WRfqu6NEKVEQPp4sA98KD51TRl6jzL1cwLUtZpUx6BjNOW33JZ6HwbQGcZOfMWzvwgTFUnJtIfzPTgdNx7iKWL0eeWIQXfOA+RZsbl2cfKukmnSuSNPqHswyLpFVp7InKUoAktcDs/3rwhfpj0GFhZa9jvFZkH2SWoZVDGB2b4o+5DdFjyE9ExRXzi4W/AD83FcDci2JNEYWngIXeLHVdAwlm4MBBTIRClQeD58scG+U7wyG8mYk9LwQJ1cmINPO+GXQErdkqZotuuJd21NovKJFcT3KyBKO11wQN6b+yX6cuLm5Md/OBmelYDmHgviLir3U/Ouv2zGh
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 20:02:59.4975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0738b5f-9d07-4ad8-489e-08de64f18fc8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7006
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 20:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124221

Changes since 7.0.1:

459946d3 version 7.0.2 bump
8879dd5e two element id optimization (#2264)
ecfc63b4 Committing clang-format changes
e0d153e9 Enum search for when hashing fails (#2263)
fc169a51 enum reflection documentation
3d8354a6 Committing clang-format changes
f3fc73cc Allow to construct a glz::http_server instance using an
         asio::io_executor (#2258)
625b6ddd Update README.md
56d20086 Update README.md
d3b51565 Update glaze_DISABLE_SIMD_WHEN_SUPPORTED documentation
77fb1384 Update README.md
f17d17ca Committing clang-format changes
69eed8c2 YAML support (#2243)
5d652476 Update json-schema.md (#2254)
04883eb1 BEVE and CBOR std::expected support (#2253)
8555337e FEATURE: [json] Add special handling for std::expected<void,E>
         (#2251)
ddea99c5 Simple float (#2248)

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-support/glaze/{glaze_7.0.1.bb =3D> glaze_7.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_7.0.1.bb =3D> glaze_7.0.2.bb} =
(93%)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/recipes=
-support/glaze/glaze_7.0.2.bb
similarity index 93%
rename from meta-oe/recipes-support/glaze/glaze_7.0.1.bb
rename to meta-oe/recipes-support/glaze/glaze_7.0.2.bb
index e481290b9c..d8df1c1d58 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4d29875d83fbbf=
50485c846dbbbed8"
=20
 SRC_URI =3D "git://github.com/stephenberry/glaze;protocol=3Dhttps;branch=
=3Dmain;tag=3Dv${PV}"
=20
-SRCREV =3D "a4af950700b8af2659f0d4a37a18a1b9c5300593"
+SRCREV =3D "459946d325c497c274fa59d666bd7cb6e2dd7ad0"
=20
 inherit cmake
=20

