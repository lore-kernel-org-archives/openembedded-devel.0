Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C805E77199
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 07:27:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web10.42390.1736407618140008389
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jan 2025 23:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=K6EBpo5v;
 spf=pass (domain: axis.com, ip: 40.107.21.80, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftdLGp1Ah1Zrmexktm9hvmwTnLT3bUYeHov4zbGhwxCbLnXhbNf1Bhv0QjKTw6Yk7bYjIVDmV7iqlAn2418qw1U4RF2gGMPJmHZBYNDo8ZhcQdcSCOIhjynZV1utyBzIxBgGxtWpAVZmYIaBbJX619IUMb2pDgR/EEwn84aQOdjONWEdmQkWMHtlgH7jPOKV27BpJWbTezecVVAJEMOYZOby/uBAgfYZzuk5pH4zr8lrB5/buhw8VMd6OFEBcue4dkTpuKUfZ17XSK+YZgtNLXWsqDmjFos0ZGTYGn6XezXW1xUai2JRgA9W5oRiAAWkJV6P/LoCbGa96P6/BPuK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHerbrA/vV5qHF4vNaRX/N1DdyG1oyBuLJDA2KKRrQo=;
 b=qFJ6W9tK5F04V0gcTD0HE+XPrhzmCHZc3riiaCn3l4vh15KIr/cxZBC/C2Ns908QTULnqC0hC4cjJyQjJfSeSUCEX+PpabUtbTbv2VqemIacpLXOFkZUKvuonPc6rch7ndK1aV1adn9syr0bo6HwnN0jLfGkjx6hpTRAYz4AVPX9oRaUEfkXkn4RHX8olSRIgB0s21KouyKy/juIxagP2ztp6oeYqgYtf5yhPUc63/fkmEpZH5IRwT8dbXg28UeiwAEuhTXoG5oTIl4HF0HltsvXPoFPEgdUEOvE9MsTfEOqOvF+uj+zZy6KvD81VOag1qhQ6GGNigZa/fsp30yMLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHerbrA/vV5qHF4vNaRX/N1DdyG1oyBuLJDA2KKRrQo=;
 b=K6EBpo5vsgbYNGSUA47gsfzovIWU7YmFdXEUToqYPyInaBXkILAcZzC2Z8DNiNXfBeeNTDgDuR81ydwWsyIZPe8M7YurcUCm8QUdARMuKD2zYtEleLTqvYa2XdFbJNmrXcoZNmJvUGEDwhHlQahsCqIlgH9u5h7frzk20R4AXDg=
Received: from DUZPR01CA0108.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::23) by VI0PR02MB10681.eurprd02.prod.outlook.com
 (2603:10a6:800:20c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 07:26:52 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::54) by DUZPR01CA0108.outlook.office365.com
 (2603:10a6:10:4bb::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Thu,
 9 Jan 2025 07:26:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 07:26:51 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 9 Jan
 2025 08:26:51 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 9 Jan 2025 08:26:51 +0100
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 235B3106
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Jan 2025 08:26:51 +0100 (CET)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 1F24726B95C2; Thu,  9 Jan 2025 08:26:51 +0100 (CET)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] crucible: Use go module fetcher
Date: Thu, 9 Jan 2025 08:26:51 +0100
Message-ID: <20250109072651.3792235-1-christli@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|VI0PR02MB10681:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b26317c-9a71-4384-7e10-08dd307efc84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bfwPm6QskxjR2meSX9rUBHUl/0u1jtijkLEjXE7i6HNciDUa1hUIBLKfV9VX?=
 =?us-ascii?Q?JNWegAEQlrolSBh1k3uSohQDqoowQARF+EJjzbDgq1yOBwhcjx+/zXsfVoRi?=
 =?us-ascii?Q?lmOvFxwuoqmGmZQnME6/l0noPL1wJO0J+p6zBIKDeMDvMl2KTMqKsiTKVWmz?=
 =?us-ascii?Q?Su5JPjHvySpyFIHP79PROmNZuzHwugeufgRhocRjtokjgQBpOrU7Re5wwc2V?=
 =?us-ascii?Q?xcEJq1b1TI8pLvtk+vWNm5yl/Zs0C26R6gvMkYV6gGs+oll3p/fVAmHbdDjK?=
 =?us-ascii?Q?F2sdUMNh5qh5SEnq4iE0OXzIJxW9fi0DQANGOntFg+PE0YwFnjf9BSc0tnNY?=
 =?us-ascii?Q?qfbgL5XUB27RxmgdU1ah1tjfQNiNy3Y3nMrWuq4R1ZwObu+rFmfXzF2YPHt1?=
 =?us-ascii?Q?ARr4hVNJxc6fttQrmlOglln/2oIWXroL4NeQMZEWMS6jTFjXJsWSjKdtTNP3?=
 =?us-ascii?Q?WaMnzrE3A8lxOrcMW3ZBO3mIqJNbc53gKdw8OzjRn67rbH+eMSkTOjbFOVf4?=
 =?us-ascii?Q?8FgA1dUqWXCkAEbITNC7GKcw8bLYQmf/mOeCwm6u8Q+9lwPKn2E2hTIYq8nd?=
 =?us-ascii?Q?/BXkt8pnA5zJ72EFpez0VG8jezePu0RMtZqFNKqdCCgihcDyz2w1qr/B2QqY?=
 =?us-ascii?Q?hzwwaH0wzWX3pZ5JBcwWWsMAQJy/BPdoTR35ljwY22jHgzBUdvGRmT7ls3aW?=
 =?us-ascii?Q?QgK2Z8Yxe62ybEGKMXUkj7NLAtbfcG9SVv9hk6pb0aJ4BJVbYHlXdo/5Ossf?=
 =?us-ascii?Q?P00fS0nt2bc/479+SSwxk+XDsyent1x7wUyJ7JwqdX2UPb6ASHMCSsFgy7yK?=
 =?us-ascii?Q?ntbzOGmo8/5aaLSS6/COHyZnSNj4cfNljE/Rxhg5cfZ4KpJfC9Yh/vklaMtW?=
 =?us-ascii?Q?QJuJqGn7iGuFtofuqG+uXq6PsjqA224kIBeJ3ihzYdSwOdoOBOHXzcFZP1q5?=
 =?us-ascii?Q?JnU+jUDrsmiShLdKFXI7KjfwjrdYE/vFdb/OpJxy9AuyrlfZXVYYt9O6wWDA?=
 =?us-ascii?Q?my1CZ4E6rQviMaINb/kiaA1Cf8czntHkBYJnHk/jV6PBQ/eaaQYVN1bI1hTO?=
 =?us-ascii?Q?JCfuBEWhvDZnQ5ka9r5j25BAaDaAccECQ9n/+OjjqOq8p7h+QiMZTaecFQXN?=
 =?us-ascii?Q?nHBHZJY1Kvf8v2u3tobKM3YGUvdn9+h9c1gj87lcEEy0ZrFVfSVbj2zn2Ctu?=
 =?us-ascii?Q?3pZ27Vr3aw37LvG2OlfcNMp9/szfnVTS4B4luzUW0HvtTasfN/pA0wsOsfCM?=
 =?us-ascii?Q?NXWXNNwSBEl9XoXZE/TF9hJfTnSFy/bV2qxtRqdrVkuzxjngw6pLenKXpLfn?=
 =?us-ascii?Q?baB4yKP0qAP9q9lIdaBgDE+qDt9Wjx/gUGH91zx1v+jRNTn9pZ8/fE/Dm2g6?=
 =?us-ascii?Q?kt6Cateez6+x2ujolhT44igPMsGxgJpTP3duMgBLYckafF+Km+xNk5flgaE9?=
 =?us-ascii?Q?TgIbLD5pr9A=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 07:26:51.6407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b26317c-9a71-4384-7e10-08dd307efc84
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10681
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 07:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114748

From: Christian Lindeberg <christian.lindeberg@axis.com>

Use the go module fetcher instead of allowing network access during the
compile task.
Reorder variables according to the recipe style guide.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 .../crucible/crucible-go-mods.inc             | 155 ++++++++++++++++++
 .../crucible/crucible-licenses.inc            |  40 +++++
 .../crucible/crucible_2023.11.02.bb           |  18 +-
 3 files changed, 204 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-support/crucible/crucible-go-mods.inc
 create mode 100644 meta-oe/recipes-support/crucible/crucible-licenses.inc

diff --git a/meta-oe/recipes-support/crucible/crucible-go-mods.inc b/meta-o=
e/recipes-support/crucible/crucible-go-mods.inc
new file mode 100644
index 000000000..0123d8c96
--- /dev/null
+++ b/meta-oe/recipes-support/crucible/crucible-go-mods.inc
@@ -0,0 +1,155 @@
+SRC_URI +=3D "\
+    gomod://cloud.google.com/go;version=3Dv0.111.0;sha256sum=3Df17610c7b09=
a9582375daa59ec73761b0bd7ad313075710ebfb1c8f4fd63776a \
+    gomod://cloud.google.com/go;version=3Dv0.26.0;mod=3D1;sha256sum=3D2218=
a34f20b971bc195216d4195f57520a2acbd85de7fc31acfc440266704c11 \
+    gomod://cloud.google.com/go/compute;version=3Dv1.23.3;sha256sum=3D9214=
cf85837ea8b96bd61e56e297f06d3008b9d1fc81841e79aaad2940f3ed56 \
+    gomod://cloud.google.com/go/compute/metadata;version=3Dv0.2.3;sha256su=
m=3D292864dbd0b1de37a968e285e949885e573384837d81cd3695be5ce2e2391887 \
+    gomod://cloud.google.com/go/iam;version=3Dv1.1.5;sha256sum=3D7d218318e=
ef5255587d6db35f2aa9952125881c640f6e04fe76d521c14d5d7f3 \
+    gomod://cloud.google.com/go/kms;version=3Dv1.15.6;sha256sum=3D75e7a21b=
453cad66aae756e3d0c42a7550c299d62832a0361d6ea6396b4074a9 \
+    gomod://cloud.google.com/go/longrunning;version=3Dv0.5.4;sha256sum=3Da=
3eb14ee47bfdbca7df05c0011bcd9a86997ae8ef0a12c3a44a340c7e9ce2c0f \
+    gomod://cloud.google.com/go/security;version=3Dv1.15.5;sha256sum=3Df4d=
d23e113cad47462715d654c95de55c1c890b37cca8c79b47bb5a7c0ec9417 \
+    gomod://github.com/BurntSushi/toml;version=3Dv0.3.1;mod=3D1;sha256sum=
=3D28021b4180a59c3993607a95b18e230dd0bc6bea5242ffe8ea8bbfb4f4f7b4d7 \
+    gomod://github.com/census-instrumentation/opencensus-proto;version=3Dv=
0.2.1;mod=3D1;sha256sum=3Ddae64639296402235b55587d14d2640615eb3736fa840e432=
7d3c15db63cc345 \
+    gomod://github.com/client9/misspell;version=3Dv0.3.4;mod=3D1;sha256sum=
=3Dd1bc362dddd96fb3a43ed4b92aaab70aa6c7ef5a500d7f09564e3eb24abcf0b8 \
+    gomod://github.com/cncf/udpa/go;version=3Dv0.0.0-20191209042840-269d4d=
468f6f;mod=3D1;sha256sum=3D05f5d4a77a84be45dedc80ebac5a38ef2fd1c6ff3faedad9=
c00eb31231181218 \
+    gomod://github.com/davecgh/go-spew;version=3Dv1.1.0;mod=3D1;sha256sum=
=3Dbcb29393251237b79a17b6c19bf29134f43e8f438c3198988fcd461a1cdf05cc \
+    gomod://github.com/davecgh/go-spew;version=3Dv1.1.1;mod=3D1;sha256sum=
=3Dbcb29393251237b79a17b6c19bf29134f43e8f438c3198988fcd461a1cdf05cc \
+    gomod://github.com/envoyproxy/go-control-plane;version=3Dv0.9.0;mod=3D=
1;sha256sum=3D2e0f3c5940c6930bce03f0c8cd1724dd93d4d30c6b1c5ae2ee4e3039f0215=
c07 \
+    gomod://github.com/envoyproxy/go-control-plane;version=3Dv0.9.1-0.2019=
1026205805-5f8ba28d4473;mod=3D1;sha256sum=3D2e0f3c5940c6930bce03f0c8cd1724d=
d93d4d30c6b1c5ae2ee4e3039f0215c07 \
+    gomod://github.com/envoyproxy/go-control-plane;version=3Dv0.9.4;mod=3D=
1;sha256sum=3D6309f752f7d45b74c97e3f8e0e54fc47e604d965b528e60fa68a46317ecb4=
4dc \
+    gomod://github.com/envoyproxy/protoc-gen-validate;version=3Dv0.1.0;mod=
=3D1;sha256sum=3Dc8e2e1bf931ad31ab4a5a32673eff764398fbf9cbc6c31bbf005c7c904=
fc69aa \
+    gomod://github.com/felixge/httpsnoop;version=3Dv1.0.4;sha256sum=3D75aa=
471311265e9860df0e523400b4650ed0c1a33262786a421f07226792e494 \
+    gomod://github.com/ghodss/yaml;version=3Dv1.0.0;sha256sum=3Dc3f295d23c=
02c0b35e4d3b29053586e737cf9642df9615da99c0bda9bbacc624 \
+    gomod://github.com/go-logr/logr;version=3Dv1.2.2;mod=3D1;sha256sum=3D5=
19b1d6da5eeef675b4a1857d628f05f110a2b8cb3c423b715fea80d0975a518 \
+    gomod://github.com/go-logr/logr;version=3Dv1.4.1;sha256sum=3D27d1c8d41=
1fd8e42dc6202991d70afa630089700f1d002de5454d6c26f93674c \
+    gomod://github.com/go-logr/stdr;version=3Dv1.2.2;sha256sum=3D9dd6893bf=
700198485ae699640b49bc1efbc6c73b37cb5792a0476e1fd8f7fef \
+    gomod://github.com/golang/glog;version=3Dv0.0.0-20160126235308-23def4e=
6c14b;mod=3D1;sha256sum=3D9c9bafc0f52905afaa7164858b3a01a0cc3dc07da23030177=
ce487f727438958 \
+    gomod://github.com/golang/groupcache;version=3Dv0.0.0-20200121045136-8=
c9f03a8e57e;mod=3D1;sha256sum=3D5117e2bb86f1cc7cc7489f9f2580fa17b2ef1e3a0a3=
46bf64ed8063ca7b87663 \
+    gomod://github.com/golang/groupcache;version=3Dv0.0.0-20210331224755-4=
1bb18bfe9da;sha256sum=3Db27034e8fc013627543e1ad098cfc65329f2896df3da5cf3266=
cc9166f93f3a5 \
+    gomod://github.com/golang/mock;version=3Dv1.1.1;mod=3D1;sha256sum=3D5c=
47c4f981ac63d37f1308647a20d75a148eb2a8f9cc0e7531f030afd0b229e0 \
+    gomod://github.com/golang/protobuf;version=3Dv1.2.0;mod=3D1;sha256sum=
=3Dc0a2031bf277087749d8ccc432449f6b1375787eac8641dd2f930074231aafb4 \
+    gomod://github.com/golang/protobuf;version=3Dv1.3.2;mod=3D1;sha256sum=
=3Dc0a2031bf277087749d8ccc432449f6b1375787eac8641dd2f930074231aafb4 \
+    gomod://github.com/golang/protobuf;version=3Dv1.4.0;mod=3D1;sha256sum=
=3D0d092f7aa2877feb9e55aee2668286ebbf7e3d0711b1702d84c9225e4cca73f8 \
+    gomod://github.com/golang/protobuf;version=3Dv1.4.0-rc.1;mod=3D1;sha25=
6sum=3Deb386ed18bb8d6092974524bd0cda610ad87bee1a4485c9f01bccb713e7dab1e \
+    gomod://github.com/golang/protobuf;version=3Dv1.4.0-rc.1.0.20200221234=
624-67d41d38c208;mod=3D1;sha256sum=3D78c95913aee9dfebd1e84f8b862e98bb1848d1=
d3e9f22aaf909c4ef4f7e7293d \
+    gomod://github.com/golang/protobuf;version=3Dv1.4.0-rc.2;mod=3D1;sha25=
6sum=3De2622048b96cd87173bd9aeb801a1010807a412e89529509e9a5099f1fc69ab4 \
+    gomod://github.com/golang/protobuf;version=3Dv1.4.0-rc.4.0.20200313231=
945-b860323f09d0;mod=3D1;sha256sum=3D1edf9512236391b88764083bde0391fc498647=
38432acfdcdd3229572dc71be1 \
+    gomod://github.com/golang/protobuf;version=3Dv1.4.1;mod=3D1;sha256sum=
=3Db7ebbef0f2166a73c7ab79ec37a01b25206b6327e684e3898ba7cb75ecd6ec00 \
+    gomod://github.com/golang/protobuf;version=3Dv1.4.3;mod=3D1;sha256sum=
=3D4bf5885d1ebdc6d270958379a741cd3b4f7aca016e874d8e8b1059110dfe9e15 \
+    gomod://github.com/golang/protobuf;version=3Dv1.5.0;mod=3D1;sha256sum=
=3D738cbb1de96b67a6238ac3b8081cd8b1bfb0daebcf6c9bbe8cbdb6d73baecd19 \
+    gomod://github.com/golang/protobuf;version=3Dv1.5.2;mod=3D1;sha256sum=
=3D7c8e7610527afd7724c7e8b7e843f132b0db61e8c9dd49dc589d430e8929bcc4 \
+    gomod://github.com/golang/protobuf;version=3Dv1.5.3;sha256sum=3D93bda6=
e88d4a0a493a98b481de67a10000a755d15f16a800b49a6b96d1bd6f81 \
+    gomod://github.com/google/go-cmp;version=3Dv0.2.0;mod=3D1;sha256sum=3D=
9c2736ea2c03fb1d94b2a1d496aa1a51726c764f158b9f6cde1d7465fc90f412 \
+    gomod://github.com/google/go-cmp;version=3Dv0.3.0;mod=3D1;sha256sum=3D=
81df7917c225a9da7604b230d952fa278c60a8832c10d799385d134b05d5b087 \
+    gomod://github.com/google/go-cmp;version=3Dv0.3.1;mod=3D1;sha256sum=3D=
81df7917c225a9da7604b230d952fa278c60a8832c10d799385d134b05d5b087 \
+    gomod://github.com/google/go-cmp;version=3Dv0.4.0;mod=3D1;sha256sum=3D=
4036ab5636aa42bd313296cd3bfcb4c88912760c56a9e6655ae422d8767c80da \
+    gomod://github.com/google/go-cmp;version=3Dv0.5.0;mod=3D1;sha256sum=3D=
4036ab5636aa42bd313296cd3bfcb4c88912760c56a9e6655ae422d8767c80da \
+    gomod://github.com/google/go-cmp;version=3Dv0.5.3;mod=3D1;sha256sum=3D=
4036ab5636aa42bd313296cd3bfcb4c88912760c56a9e6655ae422d8767c80da \
+    gomod://github.com/google/go-cmp;version=3Dv0.5.5;mod=3D1;sha256sum=3D=
4036ab5636aa42bd313296cd3bfcb4c88912760c56a9e6655ae422d8767c80da \
+    gomod://github.com/google/s2a-go;version=3Dv0.1.7;sha256sum=3D4392e675=
b6f0ff0b90f970c0280d63e34b32d077e1f8c0abd1006ad0dbeb2f2e \
+    gomod://github.com/google/uuid;version=3Dv1.1.2;mod=3D1;sha256sum=3D73=
da47b6338b00a082fd451aa35a3273d3adc09b8e9bba98dab01091e402af6e \
+    gomod://github.com/googleapis/enterprise-certificate-proxy;version=3Dv=
0.3.2;sha256sum=3D56127cb8bea94f438c4e867f9217bdfc55865282953e54c74eee01957=
5c1020e \
+    gomod://github.com/googleapis/gax-go/v2;version=3Dv2.12.0;sha256sum=3D=
10ad5944b8bcce3f2cb9a215a0dda163de5b1f092e61b74a4e162d1eb8f7f7a2 \
+    gomod://github.com/pmezard/go-difflib;version=3Dv1.0.0;mod=3D1;sha256s=
um=3D74b2e766eb215377864d587badf57e95521f692d2a7860b3c7759093f9c9bec2 \
+    gomod://github.com/prometheus/client_model;version=3Dv0.0.0-2019081215=
4241-14fe0d1b01d4;mod=3D1;sha256sum=3D8ae247f8b1ced742fbc4aa7ebc6b6c935172e=
aafa61a2be52ba0bd41286db031 \
+    gomod://github.com/smallstep/pkcs7;version=3Dv0.0.0-20231107075624-be1=
870d87d13;sha256sum=3D7f8ed17d46a7dbc883d64b95718a1f6b7ec3bac4b598474152370=
1d20723ad14 \
+    gomod://github.com/stretchr/objx;version=3Dv0.1.0;mod=3D1;sha256sum=3D=
1350354d52d2287a62336ecc0d56232d4c47699af9bba49c67c2b48254da98f1 \
+    gomod://github.com/stretchr/objx;version=3Dv0.4.0;mod=3D1;sha256sum=3D=
31b2fdcdee870f0f61bffafafb96220967e5bca08a76a920d574216fc1f91355 \
+    gomod://github.com/stretchr/objx;version=3Dv0.5.0;mod=3D1;sha256sum=3D=
cb326540efcb1274a6e4e970d7fc9de2e8062f08a058fc296d859025e62e807a \
+    gomod://github.com/stretchr/testify;version=3Dv1.7.1;mod=3D1;sha256sum=
=3Dfff8168d98e6a07156c454a1b6e925509f3177e96c155516d7f96b4079cca3bf \
+    gomod://github.com/stretchr/testify;version=3Dv1.8.0;mod=3D1;sha256sum=
=3De076074c1560ad1dda98b8b00fea6308c4b6ccd06ddd088d22db4626ed68f738 \
+    gomod://github.com/stretchr/testify;version=3Dv1.8.1;mod=3D1;sha256sum=
=3Daf1a5dcb331ace7a3f9fc1b5d7eee9c0bc82b4a2a182fe4cec2add217e2853d6 \
+    gomod://github.com/usbarmory/tamago;version=3Dv0.0.0-20221201111136-9b=
b9b42304fa;mod=3D1;sha256sum=3D3735262e8a80c900b992a499da1076db95d5ecab3fd5=
237152e4e78fb28db944 \
+    gomod://github.com/yuin/goldmark;version=3Dv1.4.13;mod=3D1;sha256sum=
=3Dee7fe4466203a01d3ac19adc134cdec99bc6de71992c28f3dd9a74480bff0603 \
+    gomod://go.opencensus.io;version=3Dv0.24.0;sha256sum=3D203a767d7f8e7c1=
ebe5588220ad168d1e15b14ae70a636de7ca9a4a88a7e0d0c \
+    gomod://go.opentelemetry.io/contrib/instrumentation/google.golang.org/=
grpc/otelgrpc;version=3Dv0.47.0;sha256sum=3Defb13c3eb89199b0f677057a238017b=
06ffceb868ac55f4f649a31309ec0321d \
+    gomod://go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp;=
version=3Dv0.47.0;sha256sum=3D476b9113a426e31a3802d8371c348ae3334c56acba9fc=
7228b886096c64647a1 \
+    gomod://go.opentelemetry.io/otel;version=3Dv1.22.0;sha256sum=3D6c02668=
caef05c8221cf2fb43f4f2943de701f3c4fb69096f2f7da523f1c80d2 \
+    gomod://go.opentelemetry.io/otel/metric;version=3Dv1.22.0;sha256sum=3D=
deb750b41631365dbda60fb872dc6901f16817e0b2646307fbfeb4eeb391e02f \
+    gomod://go.opentelemetry.io/otel/trace;version=3Dv1.22.0;sha256sum=3Dd=
63e40f32d614b00bedfa945eae95e2bc5fe867e167cd7dbfe7f90d96fa599d7 \
+    gomod://golang.org/x/crypto;version=3Dv0.0.0-20190308221718-c2843e01d9=
a2;mod=3D1;sha256sum=3D33ed070a5a66e0960685ac5386440e1b59899e74d8a38a118068=
5e72a2195ded \
+    gomod://golang.org/x/crypto;version=3Dv0.0.0-20200622213623-75b288015a=
c9;mod=3D1;sha256sum=3Db2b12d09f81915fbcf4226009e50f9efda8bd3757d2055d8ec07=
977e65bc6618 \
+    gomod://golang.org/x/crypto;version=3Dv0.0.0-20210921155107-089bfa5675=
19;mod=3D1;sha256sum=3Dcd6311612a2aa4d0d7e03c41b3aa1fbc2d5f895ab3f61089fab8=
0bfe9f8f5485 \
+    gomod://golang.org/x/crypto;version=3Dv0.18.0;sha256sum=3D5413479720bb=
f5183144652805203a3df74800d2f281f611e82d3a7ec15f4325 \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20190121172915-509febef88a4;=
mod=3D1;sha256sum=3D9ff1d07ca8c09458450eb5f4076aa0390ef5c7db0c7a942150e8825=
8a78b5383 \
+    gomod://golang.org/x/lint;version=3Dv0.0.0-20181026193005-c67002cb31c3=
;mod=3D1;sha256sum=3D169b05225c8e2729727e0679ae3911918dfe1c4b18bed5ee0fae29=
f9ed77b207 \
+    gomod://golang.org/x/lint;version=3Dv0.0.0-20190227174305-5b3e6a55c961=
;mod=3D1;sha256sum=3D8e86b5869db58a7659e485b07dbce3beb1170a153631579e50f4cb=
f544bb1342 \
+    gomod://golang.org/x/lint;version=3Dv0.0.0-20190313153728-d0100b6bd8b3=
;mod=3D1;sha256sum=3D79df4350b922a8d193782e5600f88280a2b9d41781bfb3760c09bf=
52ad3023bf \
+    gomod://golang.org/x/mod;version=3Dv0.6.0-dev.0.20220419223038-86c51ed=
26bb4;mod=3D1;sha256sum=3D42d19023ff8f2eae700bc5495f371ecd998a22d19ba985d0a=
f5f69900b254083 \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20180724234803-3673e40ba225;=
mod=3D1;sha256sum=3D3e08f487ddda1851b891df5b1d04bb1a01b84d6d702aa82d9efbccd=
e0aa7df81 \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20180826012351-8a410e7b638d;=
mod=3D1;sha256sum=3D3e08f487ddda1851b891df5b1d04bb1a01b84d6d702aa82d9efbccd=
e0aa7df81 \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20190213061140-3a22650c66bd;=
mod=3D1;sha256sum=3D3e08f487ddda1851b891df5b1d04bb1a01b84d6d702aa82d9efbccd=
e0aa7df81 \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20190311183353-d8887717615a;=
mod=3D1;sha256sum=3Df7046769daac02beb57cbcc481280df59fb403c96fe8262282aba85=
8c7f7fa4d \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20190404232315-eb5bcb51f2a3;=
mod=3D1;sha256sum=3Df7046769daac02beb57cbcc481280df59fb403c96fe8262282aba85=
8c7f7fa4d \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20190620200207-3b0461eec859;=
mod=3D1;sha256sum=3De6efdaf78a29503f080cf6d2615e289cfb1d9e3ab7d570f53668eca=
2b4ab41da \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20201110031124-69a78807bb2b;=
mod=3D1;sha256sum=3D66fc44a0644a506da780f7a22a5d73dd025d44a6e58740b62d27f74=
d7c3a4948 \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20210226172049-e18ecbb05110;=
mod=3D1;sha256sum=3Dfef5896d103a0bce5055fdb5e96e830944334792437865347718edc=
eb633348a \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20220722155237-a158d28d115b;=
mod=3D1;sha256sum=3Db315c52647d2da2f76e5cdb9d367e1d6727784236a9bffb612192b1=
9b10a128d \
+    gomod://golang.org/x/net;version=3Dv0.20.0;sha256sum=3D00adca2fa3315d3=
97ecb886989998f03fefda7b81a0b5ebb3586acef273e0f29 \
+    gomod://golang.org/x/oauth2;version=3Dv0.0.0-20180821212333-d2e6202438=
be;mod=3D1;sha256sum=3Dcbbb618da87d4f943b54bfd4f4d3a2fff3610298f04fbeeb3db3=
88cb075f351a \
+    gomod://golang.org/x/oauth2;version=3Dv0.16.0;sha256sum=3Da6597a80e046=
1877b21bf5bda71423bfdc9e8701128e39c71ec3aa7e190c7ac3 \
+    gomod://golang.org/x/sync;version=3Dv0.0.0-20180314180146-1d60e4601c6f=
;mod=3D1;sha256sum=3D421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52=
686794161c \
+    gomod://golang.org/x/sync;version=3Dv0.0.0-20181108010431-42b317875d0f=
;mod=3D1;sha256sum=3D421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52=
686794161c \
+    gomod://golang.org/x/sync;version=3Dv0.0.0-20190423024810-112230192c58=
;mod=3D1;sha256sum=3D421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52=
686794161c \
+    gomod://golang.org/x/sync;version=3Dv0.0.0-20220722155255-886fb9371eb4=
;mod=3D1;sha256sum=3D421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52=
686794161c \
+    gomod://golang.org/x/sync;version=3Dv0.6.0;sha256sum=3D7c75175297a3b36=
8b806bd24c7401629df11dcc655e3c14470058282f101ca6a \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20180830151530-49385e6e1522;=
mod=3D1;sha256sum=3D8969115e4a39108848324e79a1bd8a8445230e6e3aaccbe9f8057fb=
50fffc8c1 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20190215142949-d0b11bdaac8a;=
mod=3D1;sha256sum=3D8969115e4a39108848324e79a1bd8a8445230e6e3aaccbe9f8057fb=
50fffc8c1 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20190412213103-97732733099d;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20200930185726-fdedc70b468f;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20201119102817-f84b799fce68;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20210615035016-665e8c7367d1;=
mod=3D1;sha256sum=3Df033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b=
7ce4a5024 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20220520151302-bc2c85ada10a;=
mod=3D1;sha256sum=3Df033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b=
7ce4a5024 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20220722155257-8c9f86f7a55f;=
mod=3D1;sha256sum=3Df033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b=
7ce4a5024 \
+    gomod://golang.org/x/sys;version=3Dv0.16.0;sha256sum=3D0175809134fc12e=
040ea427e927036692127f2891b72e224e5153da543af604a \
+    gomod://golang.org/x/term;version=3Dv0.0.0-20201126162022-7de9c90e9dd1=
;mod=3D1;sha256sum=3D4cbab14f7706771b271d995a1b3cc131fe5a246aadc7ee6d1ba6f0=
bd894781fa \
+    gomod://golang.org/x/term;version=3Dv0.0.0-20210927222741-03fcf44c2211=
;mod=3D1;sha256sum=3D740794e2914f5cc87e25656c5843222b2c65665821205f45632a04=
77c8d3f79b \
+    gomod://golang.org/x/text;version=3Dv0.14.0;sha256sum=3Db9814897e0e09c=
d576a7a013f066c7db537a3d538d2e0f60f0caee9bc1b3f4af \
+    gomod://golang.org/x/text;version=3Dv0.3.0;mod=3D1;sha256sum=3D36879d5=
86fd8001e84da8787190a11e4f78749e2a81dfe8b9b6931899fff31cf \
+    gomod://golang.org/x/text;version=3Dv0.3.3;mod=3D1;sha256sum=3Dfbb7a88=
ed140515e790eca7a10ffd319c9786b11c6a6c7e59f80f7fb37bb4542 \
+    gomod://golang.org/x/text;version=3Dv0.3.7;mod=3D1;sha256sum=3Dc45d669=
089427bc4635d07b185f9b9680332d1c48c75b3c49cb715b81a04a5b0 \
+    gomod://golang.org/x/text;version=3Dv0.3.8;mod=3D1;sha256sum=3D0c06e8d=
4bc0c4eddce0f9ca01ad87dd9ff74cad7fa8ba166fe97d97d1deb27ae \
+    gomod://golang.org/x/time;version=3Dv0.5.0;sha256sum=3De0e5812d19aed36=
7f79ac0ae0ce4770b6602c85f5cfb8d59f3f573c7487ea516 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20180917221912-90fa682c2a6=
e;mod=3D1;sha256sum=3Da0e02f0678fe62dc3c4b4bc77fa912c9b70de10fa9f7cf2f7aad0=
337392b52af \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190114222345-bf090417da8=
b;mod=3D1;sha256sum=3Da0e02f0678fe62dc3c4b4bc77fa912c9b70de10fa9f7cf2f7aad0=
337392b52af \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190226205152-f727befe758=
c;mod=3D1;sha256sum=3D2503823869125550d3f88bdef72820024fe27b141f44b81fc3b4f=
59ef78370eb \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190311212946-11955173bdd=
d;mod=3D1;sha256sum=3D029638674bdf4fce7437ebc25cda0c8172674ec534b1d2edeb0b4=
74c7d618f00 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190524140312-2c0ae700613=
5;mod=3D1;sha256sum=3D135189df02315d75d62e27551d1accad1db5bd3c1a2a8756f63a6=
9f73b1b5217 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20191119224855-298f0cb1881=
e;mod=3D1;sha256sum=3D88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5a=
b0b3501aca1 \
+    gomod://golang.org/x/tools;version=3Dv0.1.12;mod=3D1;sha256sum=3D2a8b9=
365898f0822face65ba089a1353e68a65d342f300ca317cceccde6421f3 \
+    gomod://golang.org/x/xerrors;version=3Dv0.0.0-20190717185122-a985d3407=
aa7;mod=3D1;sha256sum=3Daa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27=
e78882db3d7f5 \
+    gomod://golang.org/x/xerrors;version=3Dv0.0.0-20191204190536-9bdfabe68=
543;mod=3D1;sha256sum=3Daa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27=
e78882db3d7f5 \
+    gomod://google.golang.org/api;version=3Dv0.160.0;sha256sum=3D3130cdcb9=
e9ab27b9ee8d2b0b3427b25e948ca2eb5000ab6c8ecea6411396b5c \
+    gomod://google.golang.org/appengine;version=3Dv1.1.0;mod=3D1;sha256sum=
=3Dd0fb3f328a95259ddeeb7ef934f2abae0327c6a052ff1ab05a2b882178a953b8 \
+    gomod://google.golang.org/appengine;version=3Dv1.4.0;mod=3D1;sha256sum=
=3Df95b808fed2c6febb23a8d11e92743583b37861584d302349ada5ae02a3874dd \
+    gomod://google.golang.org/appengine;version=3Dv1.6.8;mod=3D1;sha256sum=
=3Def17709123a95906e09d1318b71489fd455bd6efbf6d404083b3137256df2423 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20180817151627-c66=
870c02cf8;mod=3D1;sha256sum=3D4379a64312660353b2dadb20fd55d9968674bbc2bbcf0=
9d50c0aba80111a64b2 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20190819201941-24f=
a4b261c55;mod=3D1;sha256sum=3D4b8edb9554439c665a29e584eda81870cbb699092227d=
97ba8fa9641538d541d \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20200526211855-cb2=
7e3aa2013;mod=3D1;sha256sum=3D4ec394d3eca73687d111a3e0e88808b100687302b463b=
17869bcd026016748bd \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20240116215550-a9f=
a1716bcac;sha256sum=3De65fb3abc11c20b0910c40a3b269b79b06c2cdd6e7efab29a5ea5=
0f18a62b7f9 \
+    gomod://google.golang.org/genproto/googleapis/api;version=3Dv0.0.0-202=
40125205218-1f4bbc51befe;sha256sum=3D742068cead896163dbe16785d7e56c45d31335=
d478ea6d10f9188507531bcb52 \
+    gomod://google.golang.org/genproto/googleapis/rpc;version=3Dv0.0.0-202=
40116215550-a9fa1716bcac;sha256sum=3D6a1f0ec363ac60b2c41801d1f303306f7a6768=
ec0ba8efe5b4e9257ff4a91ad5 \
+    gomod://google.golang.org/grpc;version=3Dv1.19.0;mod=3D1;sha256sum=3D7=
1de2597fd082e882ef08965ba0c3ee19d38f2df25920733cd434cf80a27ac35 \
+    gomod://google.golang.org/grpc;version=3Dv1.23.0;mod=3D1;sha256sum=3D5=
87c9b854d7f5f0181487c854a24fc4c01982e5641d302ce1d0f3d041951cb8b \
+    gomod://google.golang.org/grpc;version=3Dv1.25.1;mod=3D1;sha256sum=3D3=
c4690179945744ec5b01279df99be86153fd386d6fa6b8ef9888ace428cb182 \
+    gomod://google.golang.org/grpc;version=3Dv1.27.0;mod=3D1;sha256sum=3D8=
ad8b97a2a43c2c76572c43a01c469a6e8ec3b049e739a8d3353c9c2ee4cd3d6 \
+    gomod://google.golang.org/grpc;version=3Dv1.33.2;mod=3D1;sha256sum=3D7=
4c09c930b5587527ec7bedb25986cce9589e76f0676096abad1a03565b3cff2 \
+    gomod://google.golang.org/grpc;version=3Dv1.61.0;sha256sum=3D6971b322a=
68f83ae2055391e5bd57dfb359e67509961a75229b825d2bd15564d \
+    gomod://google.golang.org/protobuf;version=3Dv0.0.0-20200109180630-ec0=
0e32a8dfd;mod=3D1;sha256sum=3Da23990efb67ee10bb16d1d1936109cefa4e4262ae3da8=
d0748efb691614dbb78 \
+    gomod://google.golang.org/protobuf;version=3Dv0.0.0-20200221191635-4d8=
936d0db64;mod=3D1;sha256sum=3Da6d950dd2a7eb82e51cf459d3f61f614b09d730adb9e8=
094d5bf96b043f38174 \
+    gomod://google.golang.org/protobuf;version=3Dv0.0.0-20200228230310-ab0=
ca4ff8a60;mod=3D1;sha256sum=3D3b808d19947fb29e4db24ed5cb88941afc1927f538d80=
ad6f880ae4664a5d016 \
+    gomod://google.golang.org/protobuf;version=3Dv1.20.1-0.20200309200217-=
e05f789c0967;mod=3D1;sha256sum=3D420ec9fba7793b96dff1c5ae9983656e72e1c0bd1d=
14dda2398aec1b294780ff \
+    gomod://google.golang.org/protobuf;version=3Dv1.21.0;mod=3D1;sha256sum=
=3Da532d488ff1097b330ff2e2929f39ecff8c2fa09dc7650b66ca5430c2d8303fb \
+    gomod://google.golang.org/protobuf;version=3Dv1.22.0;mod=3D1;sha256sum=
=3D394a49462cbf6dca4dd86f3cf0e8ddcbb9adc9397f73e82fecae54c79e9e4d53 \
+    gomod://google.golang.org/protobuf;version=3Dv1.23.0;mod=3D1;sha256sum=
=3D394a49462cbf6dca4dd86f3cf0e8ddcbb9adc9397f73e82fecae54c79e9e4d53 \
+    gomod://google.golang.org/protobuf;version=3Dv1.23.1-0.20200526195155-=
81db48ad09cc;mod=3D1;sha256sum=3D394a49462cbf6dca4dd86f3cf0e8ddcbb9adc9397f=
73e82fecae54c79e9e4d53 \
+    gomod://google.golang.org/protobuf;version=3Dv1.25.0;mod=3D1;sha256sum=
=3D6dea80873d2758a81de6d16bcf6a7f45a27f2ad4c047b7b4da1e88481a974903 \
+    gomod://google.golang.org/protobuf;version=3Dv1.26.0;mod=3D1;sha256sum=
=3D08ec2e20f38efcb651462800069ece4891e252a261007fa9d5a1b157f516ee5f \
+    gomod://google.golang.org/protobuf;version=3Dv1.26.0-rc.1;mod=3D1;sha2=
56sum=3Db2c4fe1a66ff5be6eb7c0c5388f080d08821c327ac5cf975dee51d8b0fb49e9f \
+    gomod://google.golang.org/protobuf;version=3Dv1.32.0;sha256sum=3Dc2c11=
7cf29abee8697dabdc69662accf66171bea0efa2749988867ae8ef2362d \
+    gomod://gopkg.in/check.v1;version=3Dv0.0.0-20161208181325-20d25e280405=
;mod=3D1;sha256sum=3D5c306e0d633cd66a11b40e2e5fbbc6da42110db7d72ea3c1524ceb=
45ee40c33f \
+    gomod://gopkg.in/yaml.v2;version=3Dv2.4.0;sha256sum=3Dede49e27c4cca6cd=
d2ec719aed8ea4d363710cceb3d411e7a786fbdec0d391fd \
+    gomod://gopkg.in/yaml.v3;version=3Dv3.0.0-20200313102051-9f266ea9e77c;=
mod=3D1;sha256sum=3D21579860a20306fcf43b1bd234d1fba319499c77611b71c05f9bf3b=
a90dab939 \
+    gomod://gopkg.in/yaml.v3;version=3Dv3.0.1;mod=3D1;sha256sum=3D21579860=
a20306fcf43b1bd234d1fba319499c77611b71c05f9bf3ba90dab939 \
+    gomod://honnef.co/go/tools;version=3Dv0.0.0-20190102054323-c2f93a96b09=
9;mod=3D1;sha256sum=3Db1c60837ea61335f14df64f3194c3cd92e0f628f6064806718950=
f0d7a1dbe9e \
+    gomod://honnef.co/go/tools;version=3Dv0.0.0-20190523083050-ea95bdfd59f=
c;mod=3D1;sha256sum=3Db1c60837ea61335f14df64f3194c3cd92e0f628f6064806718950=
f0d7a1dbe9e \
+"
diff --git a/meta-oe/recipes-support/crucible/crucible-licenses.inc b/meta-=
oe/recipes-support/crucible/crucible-licenses.inc
new file mode 100644
index 000000000..bba9dbfc8
--- /dev/null
+++ b/meta-oe/recipes-support/crucible/crucible-licenses.inc
@@ -0,0 +1,40 @@
+GO_MOD_LICENSES =3D "Apache-2.0 & BSD-3-Clause & MIT"
+
+LIC_FILES_CHKSUM +=3D "\
+    file://pkg/mod/cloud.google.com/go/compute/metadata@v0.2.3/LICENSE;md5=
=3D3b83ef96387f14655fc854ddc3c6bd57 \
+    file://pkg/mod/cloud.google.com/go/iam@v1.1.5/LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57 \
+    file://pkg/mod/cloud.google.com/go/kms@v1.15.6/LICENSE;md5=3D3b83ef963=
87f14655fc854ddc3c6bd57 \
+    file://pkg/mod/cloud.google.com/go/longrunning@v0.5.4/LICENSE;md5=3D3b=
83ef96387f14655fc854ddc3c6bd57 \
+    file://pkg/mod/cloud.google.com/go/security@v1.15.5/LICENSE;md5=3D3b83=
ef96387f14655fc854ddc3c6bd57 \
+    file://pkg/mod/github.com/felixge/httpsnoop@v1.0.4/LICENSE.txt;md5=3D6=
84da2bf3eed8fc8860e75ad84638225 \
+    file://pkg/mod/github.com/ghodss/yaml@v1.0.0/LICENSE;md5=3D0ceb9ff3b27=
d3a8cf451ca3785d73c71 \
+    file://pkg/mod/github.com/go-logr/logr@v1.4.1/LICENSE;md5=3De3fc50a88d=
0a364313df4b21ef20c29e \
+    file://pkg/mod/github.com/go-logr/stdr@v1.2.2/LICENSE;md5=3D86d3f3a95c=
324c9479bd8986968f4327 \
+    file://pkg/mod/github.com/golang/groupcache@v0.0.0-20210331224755-41bb=
18bfe9da/LICENSE;md5=3D19cbd64715b51267a47bf3750cc6a8a5 \
+    file://pkg/mod/github.com/golang/protobuf@v1.5.3/LICENSE;md5=3D939cce1=
ec101726fa754e698ac871622 \
+    file://pkg/mod/github.com/google/s2a-go@v0.1.7/LICENSE.md;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57 \
+    file://pkg/mod/github.com/googleapis/enterprise-certificate-proxy@v0.3=
.2/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
+    file://pkg/mod/github.com/googleapis/gax-go/v2@v2.12.0/LICENSE;md5=3D0=
dd48ae8103725bd7b401261520cdfbb \
+    file://pkg/mod/github.com/smallstep/pkcs7@v0.0.0-20231107075624-be1870=
d87d13/LICENSE;md5=3Da9b2952d51b44eae97b6090117f60792 \
+    file://pkg/mod/go.opencensus.io@v0.24.0/LICENSE;md5=3D175792518e4ac015=
ab6696d16c4f607e \
+    file://pkg/mod/go.opentelemetry.io/contrib/instrumentation/google.gola=
ng.org/grpc/otelgrpc@v0.47.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327=
 \
+    file://pkg/mod/go.opentelemetry.io/contrib/instrumentation/net/http/ot=
elhttp@v0.47.0/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \
+    file://pkg/mod/go.opentelemetry.io/otel/metric@v1.22.0/LICENSE;md5=3D8=
6d3f3a95c324c9479bd8986968f4327 \
+    file://pkg/mod/go.opentelemetry.io/otel/trace@v1.22.0/LICENSE;md5=3D86=
d3f3a95c324c9479bd8986968f4327 \
+    file://pkg/mod/go.opentelemetry.io/otel@v1.22.0/LICENSE;md5=3D86d3f3a9=
5c324c9479bd8986968f4327 \
+    file://pkg/mod/golang.org/x/crypto@v0.18.0/LICENSE;md5=3D5d4950ecb7b26=
d2c5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/net@v0.20.0/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/oauth2@v0.16.0/LICENSE;md5=3D5d4950ecb7b26=
d2c5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/sync@v0.6.0/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/sys@v0.16.0/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/text@v0.14.0/LICENSE;md5=3D5d4950ecb7b26d2=
c5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/time@v0.5.0/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707 \
+    file://pkg/mod/google.golang.org/api@v0.160.0/LICENSE;md5=3Da651bb3d8b=
1c412632e28823bb432b40 \
+    file://pkg/mod/google.golang.org/api@v0.160.0/internal/third_party/uri=
templates/LICENSE;md5=3D4ee4feb2b545c2231749e5c54ace343e \
+    file://pkg/mod/google.golang.org/genproto/googleapis/api@v0.0.0-202401=
25205218-1f4bbc51befe/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
+    file://pkg/mod/google.golang.org/genproto/googleapis/rpc@v0.0.0-202401=
16215550-a9fa1716bcac/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
+    file://pkg/mod/google.golang.org/genproto@v0.0.0-20240116215550-a9fa17=
16bcac/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
+    file://pkg/mod/google.golang.org/grpc@v1.61.0/LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57 \
+    file://pkg/mod/google.golang.org/protobuf@v1.32.0/LICENSE;md5=3D02d400=
2e9171d41a8fad93aa7faf3956 \
+    file://pkg/mod/gopkg.in/yaml.v2@v2.4.0/LICENSE;md5=3De3fc50a88d0a36431=
3df4b21ef20c29e \
+"
diff --git a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb b/meta=
-oe/recipes-support/crucible/crucible_2023.11.02.bb
index 4247263b5..896619470 100644
--- a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
+++ b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
@@ -1,20 +1,20 @@
 SUMMARY =3D "Utility that provides userspace support for reading and writi=
ng to the i.MX fuses"
-LICENSE =3D "BSD-3-Clause"
+
+LICENSE =3D "BSD-3-Clause & ${GO_MOD_LICENSES}"
 LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3D201414b6610203=
caed355323b1ab3116"
+require ${BPN}-licenses.inc
=20
-GO_IMPORT =3D "github.com/usbarmory/crucible"
 SRC_URI =3D "git://${GO_IMPORT}.git;protocol=3Dhttps;branch=3Dmaster;dests=
uffix=3D${GO_SRCURI_DESTSUFFIX}"
+require ${BPN}-go-mods.inc
+
+SRCREV =3D "dec27cd4e0e0db106c0a21d429c04ca8d36bbdd5"
=20
+S =3D "${WORKDIR}/git"
+
+GO_IMPORT =3D "github.com/usbarmory/crucible"
 GO_INSTALL =3D "\
     ${GO_IMPORT}/cmd/crucible \
     ${GO_IMPORT}/cmd/habtool \
 "
-SRCREV =3D "dec27cd4e0e0db106c0a21d429c04ca8d36bbdd5"
-
-export GOPROXY =3D "https://proxy.golang.org,direct"
-# Workaround for network access issue during compile step.
-# This needs to be fixed in the recipes buildsystem so that
-# it can be accomplished during do_fetch task.
-do_compile[network] =3D "1"
=20
 inherit go-mod
--=20
2.39.5


