Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAE6C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 14:57:51 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.61])
 by mx.groups.io with SMTP id smtpd.web11.1713.1750345066741729354
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 07:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=BE0b42A/;
 spf=pass (domain: axis.com, ip: 40.107.162.61, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmPP7XUEc1IILEDvpt5NofmQhodBKCDr/CfSUxMWuDhO+w2T9o3WSlZz0Zabm6mwsEnNn/BTXRRXQ0m+r2O/HmCqigX2eA5EO7z0AJZHjH/0+zDSIvNaH3U/qW6+PLSUJcc2b0h6A8ggjYah1c9wbIMyZOLBtJKR8ysiIThX6EcGxJY6dfd84eYlBoNNB+faTH7PZM/DiXsLLX74CDIPirPxS0nwyHApWwgEp48INE4/yGWkjpVZROSbatySCWLc0GdHLhMmLNQFlPOLgliQTOQOEkCpjL999zsn20JUxbzb6egegDd02Du8b9+HT5s1eJjFwgB82D5IfjQEp5/rLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhfIF6SbgFAyCJHhFh0oE9WgnuN3g4RPlWrmwfJ/+LM=;
 b=p2IuxUAr92pHWCFAvnijTYWkXb1+u27op3RNtYQn0MYdaM5hotnSBKh0yJx9GyLprREK3ulAb579PyKavXApXJ1P6H4q7LoC6rEt5YD50w7uivDDB3VtXfR4hI7awpR5/7wPucQECbHs5EEcpbrAE29kYbTFXKTc3jaSHYl97tOwJg9gqoyHCNRk5ymqEPR1gat3QVhN9JK5hbjLNHhoZXVwSW3Sm7YP/Ip3p2Ep9BbzHJsvzRPmLMwHAg9Qlv3Q2I0gR+mkGYMCY/bjAphtRL6mpWVSEhN4N1o3erzkWXG+AmHS01a4y5qps/Rh+otO/5ZXGGw7ZjWeeJ/cHHbIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhfIF6SbgFAyCJHhFh0oE9WgnuN3g4RPlWrmwfJ/+LM=;
 b=BE0b42A/mWY6OAosnvmnOWx2Fz28KJTRb3KxOjgyEsSfChQPMQfaTOLZZPWHTLkpH4ZwucJWuUyOG6PCqXi9xoD1tCBJxRqpVuRGpm3I6oP1GgorLlLmqPSvf1in9qenRNpZJMv8nnQEAqXKc81nCAAdHSmauW8OT7ErdOClb/E=
Received: from AS4P190CA0051.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::25)
 by VI1PR02MB10099.eurprd02.prod.outlook.com (2603:10a6:800:1c8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Thu, 19 Jun
 2025 14:57:39 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:656:cafe::71) by AS4P190CA0051.outlook.office365.com
 (2603:10a6:20b:656::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.35 via Frontend Transport; Thu,
 19 Jun 2025 14:57:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 14:57:39 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 19 Jun
 2025 16:57:38 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 19 Jun
 2025 16:57:38 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 19 Jun 2025 16:57:38 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id B5DD4247E
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 16:57:38 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id A80B824CD44B; Thu, 19 Jun 2025 16:57:38 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] influxdb: Use go module fetcher
Date: Thu, 19 Jun 2025 16:57:38 +0200
Message-ID: <20250619145738.3562283-1-christli@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|VI1PR02MB10099:EE_
X-MS-Office365-Filtering-Correlation-Id: 1145f0e0-965e-4254-f6a8-08ddaf41a2a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?T1BrfMF9ziUxIooLlF5fSBcLGtEBM/Bes2OCRuM1TSMO9QLlN/qyJrt1KeKT?=
 =?us-ascii?Q?RTnkBF8hQDbhs0uIZ8gUK47KjDXggOgkJ+4zFyHH+SvCZGcKkGD0VDCxtIhu?=
 =?us-ascii?Q?tV4J+hGiokm6QpC8+wX7PyOj/9qgaQNp3q8aB96CEwcg/WktpPooLAbT/97Q?=
 =?us-ascii?Q?0Vfrhz1dHpgjTs/8DNEFVFsiA4cmUQjN3WDkxwbgV/U2mOvdpmPr6+1x9uL6?=
 =?us-ascii?Q?EDRBTbXw/9RvaAeATbDqwJPYkdgi4P4gwmcTm34GWwSV3u1hgDMrikG7kAdb?=
 =?us-ascii?Q?R4ea7+uPyxczB7sXCwWNlD7nLUyjSAsviYHWjwhbVy6jbRgj+VigF73Zlpmo?=
 =?us-ascii?Q?hn5jzgUM3P1fiRfEbuPrChiBRd2zIk+aQr5/zVa9tcRuYy5CFkPTOqsuyvGg?=
 =?us-ascii?Q?u11p6FWB7BNkUxsD3MuGRsR/B/u90UKCoFrIFnU//+t57wZtXgP+K5pbaO4t?=
 =?us-ascii?Q?DG2bd/ku7owJZD8ZT39KkwLcIsA+24/WFW+4w41/HKnRsNvdsP7Vj5uEu+jS?=
 =?us-ascii?Q?8FVVAUuQBow8dhKLJXdbN6FfE8R6psRzSNXYT15imkSlC/Uf+WuG97QlGaA8?=
 =?us-ascii?Q?WxuUfkI0EuiyOCy1SM5TKIndrr7lkpfLxRBw9pXu+/Jv1R8uJOQjJe71weVQ?=
 =?us-ascii?Q?EH/xVFs/rcZJpiKtQaT8QsBlULXQKAwGUea732yzWS9KfPN3104wYXZWXobs?=
 =?us-ascii?Q?yekhm6Y+CNOuMe168ND5WBpp4K+59lqgJQWzPDhyM/bS2eaHNtXxOK6x9BmP?=
 =?us-ascii?Q?jqOO2vyMasQtychJFDMn4nPG8sQpMR2BD9oucu/yH/QwUSxGT4qS+jNMt7XU?=
 =?us-ascii?Q?Q46mpgipKV1p57CSayTETt/x5jn2SY19/8Msr5DpCNjYxAs5c+S3C1EKRNru?=
 =?us-ascii?Q?FFg6tnDnUP5fo4EJev80l8lfe137kOkrNeyEmJwJ3Ized9JdAdeW7jnnjeWa?=
 =?us-ascii?Q?+AdKgexz7KaNhdD1oZ+eiymbZ01V4oW29P0+EVV96D+t/Rs4pvucGLbJivc4?=
 =?us-ascii?Q?aN53tsEJSoMv2JaAiVJrLH3GxPbDWIFRoIwbXIjyYRe9o0C1ETsRj1RGfW3T?=
 =?us-ascii?Q?H+FJc1UZfVn/2D0Y3DnCNts0lzzkk6fMAPXEXeZp6Y3kKP0TvZe4gB4I0kbs?=
 =?us-ascii?Q?2QesMoN2OBVLM7f+K6Mlo0aW3r4bj6DlmfrHMGrX8N1H6X2l1L796fUswFA7?=
 =?us-ascii?Q?JVPw10rV57NuFPAzI+YtgZKbhbWQ+YkO0V5O/9WciUgHhgbzNJ89kZNVnBzu?=
 =?us-ascii?Q?UZq8tsH9RJHHf8Ha6LE6IjhtN0sVM4HpUxP3aEXXB/VHH4SRR3mx2VkwuYLm?=
 =?us-ascii?Q?8sfyQpRwKorTyQ8ynVNunsSySp/Lemgz96CgCJCcJcT73Jz1x/hTZ8jm0nTr?=
 =?us-ascii?Q?ouwhUQDaKOdGCKJ3EzG8Agf8tjVhbfx46uVSQnS8XGk2pci1l9KTyTd8HaEE?=
 =?us-ascii?Q?PYpwb1LBR5CF5NmPnByu1xqXt0hqyLoAwoMRvdXTlxl5hSBZ5pntjA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 14:57:39.2688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1145f0e0-965e-4254-f6a8-08ddaf41a2a7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB10099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 14:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117947

From: Christian Lindeberg <christian.lindeberg@axis.com>

Use the go module fetcher instead of allowing network access during the
compile task.
Apply patch to replace github.com/pkg/term with github.com/kraj/term
unconditionally to avoid conditional module dependencies.
Reorder variables according to the recipe style guide.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 .../recipes-dbs/influxdb/influxdb-go-mods.inc | 371 ++++++++++++++++++
 .../influxdb/influxdb-licenses.inc            |  68 ++++
 .../recipes-dbs/influxdb/influxdb_1.8.10.bb   |  43 +-
 3 files changed, 458 insertions(+), 24 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
 create mode 100644 meta-oe/recipes-dbs/influxdb/influxdb-licenses.inc

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc b/meta-oe/re=
cipes-dbs/influxdb/influxdb-go-mods.inc
new file mode 100644
index 0000000000..e191426431
--- /dev/null
+++ b/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
@@ -0,0 +1,371 @@
+SRC_URI +=3D "\
+    gomod://cloud.google.com/go;version=3Dv0.26.0;mod=3D1;sha256sum=3D2218=
a34f20b971bc195216d4195f57520a2acbd85de7fc31acfc440266704c11 \
+    gomod://cloud.google.com/go;version=3Dv0.34.0;mod=3D1;sha256sum=3D2218=
a34f20b971bc195216d4195f57520a2acbd85de7fc31acfc440266704c11 \
+    gomod://cloud.google.com/go;version=3Dv0.38.0;mod=3D1;sha256sum=3D2115=
5eedc3e4c7a09c719ce23c703fbf14c34aca42ed00dc08774de6ebbe8007 \
+    gomod://cloud.google.com/go;version=3Dv0.43.0;mod=3D1;sha256sum=3D6abe=
a609f5ac18e68754798d3426a46960768b2a7dd8c693ffaf991aed8e4077 \
+    gomod://cloud.google.com/go;version=3Dv0.44.1;mod=3D1;sha256sum=3Dd251=
697dcfa85e71af9f8ef4c66f9eb94f664c30b3e964ba132a17397b6b9975 \
+    gomod://cloud.google.com/go;version=3Dv0.44.2;mod=3D1;sha256sum=3D9ab8=
18e5b1998a25fad3b61bc2f23613f856cc85e717c49abeef35444a75ebab \
+    gomod://cloud.google.com/go;version=3Dv0.45.1;mod=3D1;sha256sum=3Df28e=
a146073455ff066562f179cb4c72b25af2184426ddcf3bfb1af124776ddc \
+    gomod://cloud.google.com/go;version=3Dv0.46.3;mod=3D1;sha256sum=3D64f2=
031d564d3d50eb8773e3866b24e0a091a786e23896e39478ce707d2548e0 \
+    gomod://cloud.google.com/go;version=3Dv0.50.0;mod=3D1;sha256sum=3Df710=
997b557b3134858e81f67e2e35f1b2e0778bcad832e91e6bd42c04a7f5b7 \
+    gomod://cloud.google.com/go;version=3Dv0.51.0;sha256sum=3Dba38c6913a7e=
daa1fec645b89eb8a6d14e16b15ff7429baf75b58cd748daee11 \
+    gomod://cloud.google.com/go/bigquery;version=3Dv1.0.1;mod=3D1;sha256su=
m=3D9922124dda0e269efc15364ea263bf99a420b1a7363871007eb1cbc2d1b1dc7c \
+    gomod://cloud.google.com/go/bigquery;version=3Dv1.3.0;mod=3D1;sha256su=
m=3Df92395d952ec23b089398afb97a3d46faed20ed75ba34541884371487b8cb221 \
+    gomod://cloud.google.com/go/bigtable;version=3Dv1.2.0;sha256sum=3D90b6=
5a7512757a564edeb57cfb52cb827ee95ff5d372eeeee57cbb89c4e7231e \
+    gomod://cloud.google.com/go/datastore;version=3Dv1.0.0;mod=3D1;sha256s=
um=3D034c52fb5392837f8db275485fb0e95d10e6cd2530dd3cb673d7d3509e16b2e6 \
+    gomod://cloud.google.com/go/pubsub;version=3Dv1.0.1;mod=3D1;sha256sum=
=3D481fb7960d80b38b317af6c8ad838987218a7f2980d91b42f6c7e1668860cc49 \
+    gomod://cloud.google.com/go/pubsub;version=3Dv1.1.0;mod=3D1;sha256sum=
=3Dad12956be8e71bfd2c5d98f9fd01350078663af746037c931189817a14aee368 \
+    gomod://cloud.google.com/go/storage;version=3Dv1.0.0;mod=3D1;sha256sum=
=3Da34b5cd9695eab34b01f87f2d9de3a05d0f47dfb2bc123092dd4510c9ec71215 \
+    gomod://cloud.google.com/go/storage;version=3Dv1.5.0;mod=3D1;sha256sum=
=3Dd7a134aaa1077c33a4bbd57a912e50e148e4d00029668c096aef4664e801f25b \
+    gomod://collectd.org;version=3Dv0.3.0;sha256sum=3D18974a8911a7e89cdeb3=
5f25daddf37eb5026fd42a54a4116fa0fd5af457ae4c \
+    gomod://dmitri.shuralyov.com/gpu/mtl;version=3Dv0.0.0-20190408044501-6=
66a987793e9;mod=3D1;sha256sum=3Dfac4c5d8f682f9ec97721b2fc9fd53062ab170b2d2b=
7fab8ffc10ae183a1951e \
+    gomod://github.com/BurntSushi/toml;version=3Dv0.3.1;sha256sum=3D815c6e=
594745f2d8842ff9a4b0569c6695e6cdfd5e07e5b3d98d06b72ca41e3c \
+    gomod://github.com/BurntSushi/xgb;version=3Dv0.0.0-20160522181843-27f1=
22750802;mod=3D1;sha256sum=3D96ebde202b092f6f4d1f3930bc07cf18a5699998ddea51=
b94fe858113b29a8d8 \
+    gomod://github.com/DATA-DOG/go-sqlmock;version=3Dv1.3.3;mod=3D1;sha256=
sum=3D00e8125ff56d73bc6bf8e38cda57c149409941b2241d5062c9a381aab7831169 \
+    gomod://github.com/Masterminds/goutils;version=3Dv1.1.1;mod=3D1;sha256=
sum=3D4efa82512d1b88c438c122671324c4b968b5a55af04388c7bcf100a6c4b1974d \
+    gomod://github.com/Masterminds/semver;version=3Dv1.4.2;mod=3D1;sha256s=
um=3D605d713a315efd052466e8bd9da87300a99467ca3dd100ff1420d1b11ef9cb2e \
+    gomod://github.com/Masterminds/semver;version=3Dv1.5.0;mod=3D1;sha256s=
um=3D605d713a315efd052466e8bd9da87300a99467ca3dd100ff1420d1b11ef9cb2e \
+    gomod://github.com/Masterminds/sprig;version=3Dv2.22.0+incompatible;mo=
d=3D1;sha256sum=3D017f8af3e32471252c43d9b9059d7167c08359a550f167843ff26b2dc=
15d8df4 \
+    gomod://github.com/OneOfOne/xxhash;version=3Dv1.2.2;mod=3D1;sha256sum=
=3D97b65e32b325125aebe8c37c28709e308c5a1c664e1a77ddf7c4b1b0b96d773b \
+    gomod://github.com/ajstarks/svgo;version=3Dv0.0.0-20180226025133-644b8=
db467af;mod=3D1;sha256sum=3Db1bd5b7c4211b630297aa62c55249c9ddd3b68e0c7b4a2c=
ce2d13cf79e4bcaa6 \
+    gomod://github.com/alecthomas/template;version=3Dv0.0.0-20160405071501=
-a0175ee3bccc;mod=3D1;sha256sum=3Dc02193cdaff23f70224597390832f568250af384f=
98dc4378aeb5bf8fec690fc \
+    gomod://github.com/alecthomas/units;version=3Dv0.0.0-20151022065526-2e=
fee857e7cf;mod=3D1;sha256sum=3D3827e93d732af56cc9c1a033f29599c1397330de452b=
b51663d9891c79982f50 \
+    gomod://github.com/andreyvit/diff;version=3Dv0.0.0-20170406064948-c7f1=
8ee00883;mod=3D1;sha256sum=3D879be5498c39a57e4e344d3975351d8f859383f4b6c93e=
aa4c4e91bdd75ee3f5 \
+    gomod://github.com/apache/arrow/go/arrow;version=3Dv0.0.0-201910241318=
54-af6fa24be0db;sha256sum=3D4bd8443c24bc06843c0270df4f08f98b3eee6116604ff16=
d14dce34b242783cf \
+    gomod://github.com/benbjohnson/tmpl;version=3Dv1.1.0;mod=3D1;sha256sum=
=3De888691d1675c709727ca17989a8f99a72f60d3aa65c8b0843ecf032d76537d2 \
+    gomod://github.com/beorn7/perks;version=3Dv0.0.0-20180321164747-3a771d=
992973;mod=3D1;sha256sum=3Dcc4d1faad75965fa69eb13120bf956827719005ff3ecdc70=
4b36fb58fb1fd16e \
+    gomod://github.com/beorn7/perks;version=3Dv1.0.0;sha256sum=3Da7ec6164e=
31ea8e10c601abb9793753ec43cb218283b226800c134fb23cea409 \
+    gomod://github.com/bmizerany/pat;version=3Dv0.0.0-20170815010413-6226e=
a591a40;sha256sum=3Ded04bed4d193e25371ebc6524984da4af9ece5c107fcc82d5aa4914=
b726706d2 \
+    gomod://github.com/c-bata/go-prompt;version=3Dv0.2.2;sha256sum=3Dffe76=
5d86d90afdf8519def13cb027c94a1fbafea7a18e9625210786663436c4 \
+    gomod://github.com/census-instrumentation/opencensus-proto;version=3Dv=
0.2.1;mod=3D1;sha256sum=3Ddae64639296402235b55587d14d2640615eb3736fa840e432=
7d3c15db63cc345 \
+    gomod://github.com/chzyer/logex;version=3Dv1.1.10;mod=3D1;sha256sum=3D=
f7d3104eac4c5674dc4847cf5b1193c2e03bd24fe521243a34d72c709ad83a3a \
+    gomod://github.com/chzyer/readline;version=3Dv0.0.0-20180603132655-297=
2be24d48e;mod=3D1;sha256sum=3D900b797c531f2df182e431a895ecd3109aacfedfdddab=
23a48f7c0a9d5a75659 \
+    gomod://github.com/chzyer/test;version=3Dv0.0.0-20180213035817-a1ea475=
d72b1;mod=3D1;sha256sum=3Dd075c4e4b6624ea6f8031883c8d66ff430abc2ffe1fb4e89c=
3b9115699f29c3b \
+    gomod://github.com/client9/misspell;version=3Dv0.3.4;mod=3D1;sha256sum=
=3Dd1bc362dddd96fb3a43ed4b92aaab70aa6c7ef5a500d7f09564e3eb24abcf0b8 \
+    gomod://github.com/dave/jennifer;version=3Dv1.2.0;mod=3D1;sha256sum=3D=
1180e88419e32eb9371b0cbf45dbe58f511d50b3ce55465ee067fb29e2287325 \
+    gomod://github.com/davecgh/go-spew;version=3Dv1.1.0;mod=3D1;sha256sum=
=3Dbcb29393251237b79a17b6c19bf29134f43e8f438c3198988fcd461a1cdf05cc \
+    gomod://github.com/davecgh/go-spew;version=3Dv1.1.1;mod=3D1;sha256sum=
=3Dbcb29393251237b79a17b6c19bf29134f43e8f438c3198988fcd461a1cdf05cc \
+    gomod://github.com/dgrijalva/jwt-go/v4;version=3Dv4.0.0-preview1;sha25=
6sum=3D9453f2b0484885c192b0c777195f911b599d1a424def0eb9387ef619d5bd7f4a \
+    gomod://github.com/dgryski/go-bitstream;version=3Dv0.0.0-2018041303501=
1-3522498ce2c8;sha256sum=3D52765898078b5dca28ebced04b05cff943a3b3538a371c16=
568c97f05d669f23 \
+    gomod://github.com/dustin/go-humanize;version=3Dv1.0.0;mod=3D1;sha256s=
um=3D149e3cc4c5086fe06604be0bf16260f3881bd7af82b41e48d9291ebb5a0cd83b \
+    gomod://github.com/eclipse/paho.mqtt.golang;version=3Dv1.2.0;sha256sum=
=3Dd36337c4b5a2752b91bcd437bd74e0907bf6c9e6c611dab88407bcca8462e918 \
+    gomod://github.com/envoyproxy/go-control-plane;version=3Dv0.9.1-0.2019=
1026205805-5f8ba28d4473;mod=3D1;sha256sum=3D2e0f3c5940c6930bce03f0c8cd1724d=
d93d4d30c6b1c5ae2ee4e3039f0215c07 \
+    gomod://github.com/envoyproxy/protoc-gen-validate;version=3Dv0.1.0;mod=
=3D1;sha256sum=3Dc8e2e1bf931ad31ab4a5a32673eff764398fbf9cbc6c31bbf005c7c904=
fc69aa \
+    gomod://github.com/fogleman/gg;version=3Dv1.2.1-0.20190220221249-04036=
32d5b90;mod=3D1;sha256sum=3D4bad40c896fc9d7d557ba4f711d8c3b7312a6c9ad57ff5b=
f1116a70d427b68dd \
+    gomod://github.com/glycerine/go-unsnap-stream;version=3Dv0.0.0-2018032=
3001048-9f0cb55181dd;sha256sum=3D9a66d6f9bb1a268f4b824d6fe7adcd55dc17ed5046=
83bdf2dbf67b32028d9b88 \
+    gomod://github.com/glycerine/goconvey;version=3Dv0.0.0-20190410193231-=
58a59202ab31;mod=3D1;sha256sum=3D82d583d3550eed8a512f18072e007031eb8f52eb20=
29a159d6779025abf08467 \
+    gomod://github.com/go-gl/glfw;version=3Dv0.0.0-20190409004039-e6da0acd=
62b1;mod=3D1;sha256sum=3D510b2d54bf2c8b48ef87c5d05576f8771224c7e7ee2a85a5a9=
7ea01925603eb7 \
+    gomod://github.com/go-gl/glfw/v3.3/glfw;version=3Dv0.0.0-2019112521170=
4-12ad95a8df72;mod=3D1;sha256sum=3Dd5636e44afa30d498cbad7330102f0cec8de5db5=
c6a70376e69c6cfe3e1435ca \
+    gomod://github.com/go-kit/kit;version=3Dv0.8.0;mod=3D1;sha256sum=3D807=
c52d36bed2dbf7c6dc993567a386e6bd1307396a335ef2ef9ec8ce7b5c2db \
+    gomod://github.com/go-logfmt/logfmt;version=3Dv0.3.0;mod=3D1;sha256sum=
=3D79398bccbcbc130ad00f98a99ce69ffe5cacc3458bf4d332f1589bf99babd948 \
+    gomod://github.com/go-logfmt/logfmt;version=3Dv0.4.0;mod=3D1;sha256sum=
=3D496161c9b253bfd71dfdb40233c322786d55e9e42953785c3be4838983fe7e79 \
+    gomod://github.com/go-sql-driver/mysql;version=3Dv1.4.1;sha256sum=3Df1=
28045df19d340743a155ef282116130d27e27cbc62de160b6072c751b435ba \
+    gomod://github.com/go-stack/stack;version=3Dv1.8.0;mod=3D1;sha256sum=
=3D591552a7ca5f4351d9bef6b868f2d85a61ea028271442581f5f487dced196129 \
+    gomod://github.com/gofrs/uuid;version=3Dv3.3.0+incompatible;sha256sum=
=3D1c6827005e335329e68a0d7617fb6f0bd4fbc6c627ff8d09fd254034e5afb9a8 \
+    gomod://github.com/gogo/protobuf;version=3Dv1.1.1;mod=3D1;sha256sum=3D=
ffc140935ea14be7245f05cc8206e4933a4620965a7ee1108d253564f984026a \
+    gomod://github.com/gogo/protobuf;version=3Dv1.3.1;mod=3D1;sha256sum=3D=
6db00ac93377da6c673476512fbb2139e21a07d71bc0cf654413c351c04ae5a1 \
+    gomod://github.com/gogo/protobuf;version=3Dv1.3.2;sha256sum=3Ddd2b73f1=
63c8183941626360196c8f844addd95423d341a0412e1b22d0104ff7 \
+    gomod://github.com/golang/freetype;version=3Dv0.0.0-20170609003504-e23=
65dfdc4a0;mod=3D1;sha256sum=3D26d471ad5950334d990718ffb46734113226ef134f19f=
bb87354e3d87dd34853 \
+    gomod://github.com/golang/geo;version=3Dv0.0.0-20190916061304-5b978397=
cfec;sha256sum=3D6f930b5f27f80c4eb143ef6896930f049529b5d3e7e61cbdb24e03651f=
e2ae29 \
+    gomod://github.com/golang/glog;version=3Dv0.0.0-20160126235308-23def4e=
6c14b;mod=3D1;sha256sum=3D9c9bafc0f52905afaa7164858b3a01a0cc3dc07da23030177=
ce487f727438958 \
+    gomod://github.com/golang/groupcache;version=3Dv0.0.0-20190702054246-8=
69f871628b6;mod=3D1;sha256sum=3D5117e2bb86f1cc7cc7489f9f2580fa17b2ef1e3a0a3=
46bf64ed8063ca7b87663 \
+    gomod://github.com/golang/groupcache;version=3Dv0.0.0-20191227052852-2=
15e87163ea7;sha256sum=3De31120f82457b2c521be634d14905105d26f2b42206c7ce188c=
3eaacdd95cf6a \
+    gomod://github.com/golang/mock;version=3Dv1.1.1;mod=3D1;sha256sum=3D5c=
47c4f981ac63d37f1308647a20d75a148eb2a8f9cc0e7531f030afd0b229e0 \
+    gomod://github.com/golang/mock;version=3Dv1.2.0;mod=3D1;sha256sum=3D5c=
47c4f981ac63d37f1308647a20d75a148eb2a8f9cc0e7531f030afd0b229e0 \
+    gomod://github.com/golang/mock;version=3Dv1.3.1;mod=3D1;sha256sum=3D96=
20c644035ddf27c5d9dd4450fe51656b173c00d806ebe24a8a59914677b594 \
+    gomod://github.com/golang/protobuf;version=3Dv1.2.0;mod=3D1;sha256sum=
=3Dc0a2031bf277087749d8ccc432449f6b1375787eac8641dd2f930074231aafb4 \
+    gomod://github.com/golang/protobuf;version=3Dv1.3.1;mod=3D1;sha256sum=
=3Dc0a2031bf277087749d8ccc432449f6b1375787eac8641dd2f930074231aafb4 \
+    gomod://github.com/golang/protobuf;version=3Dv1.3.2;sha256sum=3Da004ba=
3acb85e012cb9e468e1d445a81cfeeb4b4db7e9802f30aa500a8341851 \
+    gomod://github.com/golang/snappy;version=3Dv0.0.0-20180518054509-2e65f=
85255db;sha256sum=3Dd6de03a940151782d5161eb89c17c818b02ab18c771dd69c36fdc86=
2c13a4910 \
+    gomod://github.com/google/btree;version=3Dv0.0.0-20180813153112-4030bb=
1f1f0c;mod=3D1;sha256sum=3Dcf12f487b0c289aca69d62b38fb224ec7ace357f1273da1f=
5fa578e991aa09a2 \
+    gomod://github.com/google/btree;version=3Dv1.0.0;mod=3D1;sha256sum=3Dc=
f12f487b0c289aca69d62b38fb224ec7ace357f1273da1f5fa578e991aa09a2 \
+    gomod://github.com/google/flatbuffers;version=3Dv1.11.0;sha256sum=3Dff=
61e5077ecc7d46a2020c1b42e0a6405b50271f396d4dcc50c683345059af76 \
+    gomod://github.com/google/go-cmp;version=3Dv0.2.0;mod=3D1;sha256sum=3D=
9c2736ea2c03fb1d94b2a1d496aa1a51726c764f158b9f6cde1d7465fc90f412 \
+    gomod://github.com/google/go-cmp;version=3Dv0.3.0;mod=3D1;sha256sum=3D=
81df7917c225a9da7604b230d952fa278c60a8832c10d799385d134b05d5b087 \
+    gomod://github.com/google/go-cmp;version=3Dv0.3.1;mod=3D1;sha256sum=3D=
81df7917c225a9da7604b230d952fa278c60a8832c10d799385d134b05d5b087 \
+    gomod://github.com/google/go-cmp;version=3Dv0.4.0;sha256sum=3D01fa1bb1=
f0e3e27d3685cb0aab442873dbc2abd9ed77ccb99279a3aaf3a09e04 \
+    gomod://github.com/google/martian;version=3Dv2.1.0+incompatible;mod=3D=
1;sha256sum=3D1db357f56865909a6e939b240d8db1920df6000f610f90b0c3af3a093de60=
7e7 \
+    gomod://github.com/google/pprof;version=3Dv0.0.0-20181206194817-3ea856=
7a2e57;mod=3D1;sha256sum=3Dd9b661202fb2d2f0206ad6a8ac63beca5d5335f2b1ce48dd=
b399472df47c56cc \
+    gomod://github.com/google/pprof;version=3Dv0.0.0-20190515194954-54271f=
7e092f;mod=3D1;sha256sum=3Dd9b661202fb2d2f0206ad6a8ac63beca5d5335f2b1ce48dd=
b399472df47c56cc \
+    gomod://github.com/google/pprof;version=3Dv0.0.0-20191218002539-d4f498=
aebedc;mod=3D1;sha256sum=3Dd5a5ad370ea0eb6892c9d448b5ad031cadc1600f76000a37=
9ff18752a4124356 \
+    gomod://github.com/google/renameio;version=3Dv0.1.0;mod=3D1;sha256sum=
=3Dba9b5eb0878008a891e16b08c17922b03f92c76a03e7bfe1832635eada1c1a35 \
+    gomod://github.com/google/uuid;version=3Dv1.2.0;mod=3D1;sha256sum=3D73=
da47b6338b00a082fd451aa35a3273d3adc09b8e9bba98dab01091e402af6e \
+    gomod://github.com/googleapis/gax-go/v2;version=3Dv2.0.4;mod=3D1;sha25=
6sum=3Da6540a244d01675556a1aa92431df81c0096f90877157fb399c51eb2fc9a696b \
+    gomod://github.com/googleapis/gax-go/v2;version=3Dv2.0.5;sha256sum=3D8=
46b017e21fc01f408774051d4a10bfccd7c294e10a1ad5d725278889d5f1d42 \
+    gomod://github.com/gopherjs/gopherjs;version=3Dv0.0.0-20181017120253-0=
766667cb4d1;mod=3D1;sha256sum=3D944fb138bc57ae4e8ca52c34753248fdd2efbe060ed=
1e09862c59d59fb0b4feb \
+    gomod://github.com/hashicorp/golang-lru;version=3Dv0.5.0;mod=3D1;sha25=
6sum=3Decc563d3f4cecb531a6f029401d45ba6c1d04330e104bc4535d84a5187249ab0 \
+    gomod://github.com/hashicorp/golang-lru;version=3Dv0.5.1;mod=3D1;sha25=
6sum=3Decc563d3f4cecb531a6f029401d45ba6c1d04330e104bc4535d84a5187249ab0 \
+    gomod://github.com/huandu/xstrings;version=3Dv1.3.2;mod=3D1;sha256sum=
=3D33c7a6cfa483a6d2c3da52bf870469c716fe5948bbc3177868c726e7d73bba00 \
+    gomod://github.com/ianlancetaylor/demangle;version=3Dv0.0.0-2018110203=
2728-5e5cf60278f6;mod=3D1;sha256sum=3D1d0a9d9779b87484af4fdb9b596e6632989c8=
28a027a16cebaa4d21c9bdb3dea \
+    gomod://github.com/imdario/mergo;version=3Dv0.3.12;mod=3D1;sha256sum=
=3D31bbd3c9d8b390093bf1f10994207cbf5c158797283911af5dad728a344e3af9 \
+    gomod://github.com/inconshreveable/mousetrap;version=3Dv1.0.0;mod=3D1;=
sha256sum=3D391daebc93b0df9bb89a89b14bfa60268d9eb9e27623ec415041abababdd005=
c \
+    gomod://github.com/influxdata/flux;version=3Dv0.65.1;sha256sum=3D4e852=
d323259da1c3f3a947e2c81460e922323b67345539f63e5f37f3f51a25c \
+    gomod://github.com/influxdata/influxql;version=3Dv1.1.1-0.202008281444=
57-65d3ef77d385;sha256sum=3D9808223fcf16ac4f384dc1a4c74f97460541d03a3078f21=
cb4c7004275f5f94d \
+    gomod://github.com/influxdata/line-protocol;version=3Dv0.0.0-201805221=
52040-32c6aa80de5e;sha256sum=3D6111b5e459106f7003477186aa2e34423dbe0c539839=
44a07d8b835ff8c7757c \
+    gomod://github.com/influxdata/pkg-config;version=3Dv0.2.8;mod=3D1;sha2=
56sum=3Dcb101f1b8f52a9d96c246dd29d91110d4fe712b2ad9e15bcbe127af5ba64c63f \
+    gomod://github.com/influxdata/promql/v2;version=3Dv2.12.0;mod=3D1;sha2=
56sum=3D2fb1192f95246742bc82ae5736910e4ad6b791d8e4616b998f126ac2dbe7f0b6 \
+    gomod://github.com/influxdata/roaring;version=3Dv0.4.13-0.201808091811=
01-fc520f41fab6;sha256sum=3D7b38a79854fee9589bd94c707a3a93697660ad831642d30=
729a2dfbecd57beeb \
+    gomod://github.com/influxdata/tdigest;version=3Dv0.0.0-20181121200506-=
bf2b5ad3c0a9;sha256sum=3D5d6b056d98d1e7e9cd884aea4e73934cc8ea89218eb43ee1d5=
140d3ccb34ed52 \
+    gomod://github.com/influxdata/usage-client;version=3Dv0.0.0-2016082918=
0054-6d3895376368;sha256sum=3D6a33ba80b3d59a7aeaba3d32a71033f729b6de8e746ab=
6133f97fba9810532df \
+    gomod://github.com/json-iterator/go;version=3Dv1.1.6;mod=3D1;sha256sum=
=3Db19a228769664c12bf25dd18d51c5c53fdaf45c22971a973545f0b0213504e4f \
+    gomod://github.com/jstemmer/go-junit-report;version=3Dv0.0.0-201901061=
44839-af01ea7f8024;mod=3D1;sha256sum=3Df84f3cead6a10518963553122db9fe2fd32f=
21a8b2ee21037f03c5d3e793ecb6 \
+    gomod://github.com/jstemmer/go-junit-report;version=3Dv0.9.1;mod=3D1;s=
ha256sum=3Da95b0023e341a69205d350697ee18cb5118f968199d2cb06af5c83ed73f97bd4=
 \
+    gomod://github.com/jsternberg/zap-logfmt;version=3Dv1.0.0;sha256sum=3D=
dd33549ed83a5bb7c491b201ac1a615795395ba4234546f20187158734e605ea \
+    gomod://github.com/jtolds/gls;version=3Dv4.20.0+incompatible;mod=3D1;s=
ha256sum=3D36d5a8f7e885fc4a9afc85264f4601186c26ba2396777d523524457ace9f0936=
 \
+    gomod://github.com/julienschmidt/httprouter;version=3Dv1.2.0;mod=3D1;s=
ha256sum=3D91419d7ed83ae8ed754f26db1570f05b97ff6a615fbc91cb7fe8148af567fb25=
 \
+    gomod://github.com/jung-kurt/gofpdf;version=3Dv1.0.3-0.20190309125859-=
24315acbbda5;mod=3D1;sha256sum=3D423bc5735a6cad4fed7132fba639997aa739b90f89=
f4f71f93b297335fbc80d9 \
+    gomod://github.com/jwilder/encoding;version=3Dv0.0.0-20170811194829-b4=
e1701a28ef;sha256sum=3D91ab650780db18684a70137cbb34189c171c29a23aab48816c8b=
ca74dbb012e9 \
+    gomod://github.com/kisielk/errcheck;version=3Dv1.2.0;mod=3D1;sha256sum=
=3Dba40b7ac886ff2430eee507f0b6cc9c109d9e56ce91ffe527fdde56a9ef5e569 \
+    gomod://github.com/kisielk/errcheck;version=3Dv1.5.0;mod=3D1;sha256sum=
=3D107d26460d41b5322b6911c9b5eb233117421943b3a1453ba99f01c4fdf2f8e8 \
+    gomod://github.com/kisielk/gotool;version=3Dv1.0.0;mod=3D1;sha256sum=
=3D77aca7bffc0ec29fc9f088d5962ab3128f405d7b10c7ceb9693ff7a08958955d \
+    gomod://github.com/klauspost/compress;version=3Dv1.4.0;sha256sum=3D4af=
2ed530c00d9d09a72af0b4188dac27a38548ebbd953db7f3fb22a7f671a49 \
+    gomod://github.com/klauspost/cpuid;version=3Dv0.0.0-20170728055534-ae7=
887de9fa5;sha256sum=3D7073c12479a7d29db4ddaa4250a029b165fcc43c25987f43525ae=
9ea3e7ab102 \
+    gomod://github.com/klauspost/crc32;version=3Dv0.0.0-20161016154125-cb6=
bfca970f6;sha256sum=3D6b632853a19f039138f251f94dbbdfdb72809adc3a02da08e4301=
d3d48275b06 \
+    gomod://github.com/klauspost/pgzip;version=3Dv1.0.2-0.20170402124221-0=
bf5dcad4ada;sha256sum=3Ded381fd7fbfbdb0379158426552b772bbaca91d9fee1a112a84=
d4500da072dd5 \
+    gomod://github.com/konsorten/go-windows-terminal-sequences;version=3Dv=
1.0.1;mod=3D1;sha256sum=3D6b69dafd3cf64d7b57e978848a7e271a2be0a04d9a2564dd2=
556491d27d0a034 \
+    gomod://github.com/kr/logfmt;version=3Dv0.0.0-20140226030751-b84e30acd=
515;mod=3D1;sha256sum=3Deea467153d80336f6174d40d1ca022618c4f3b93610fd620409=
29ffe009ba9a6 \
+    gomod://github.com/kr/pretty;version=3Dv0.1.0;mod=3D1;sha256sum=3De3d5=
d46d2f6ac94a666a54b5e867ec16bf199d9f4b700827cd731607efdd109a \
+    gomod://github.com/kr/pty;version=3Dv1.1.1;mod=3D1;sha256sum=3D6da4c9c=
7364446894e5ef877e19f985cd51d671ce6e8f4ca87862b449f6dd7f6 \
+    gomod://github.com/kr/text;version=3Dv0.1.0;mod=3D1;sha256sum=3D2fba95=
29e5c13dde62f371ef7383baf04d7132501dac6aa08e910f9ec0bf85c5 \
+    gomod://github.com/kraj/term;version=3Dv0.0.0-20210111231523-7c42fcb0e=
627;sha256sum=3D2844f2df80326fc92738f066fd345085b0cbeee25b57164bd47d53d3818=
87585 \
+    gomod://github.com/kraj/xxhash;version=3Dv1.1.1-0.20211201014032-8254a=
11eab56;sha256sum=3D92170ae7fb1fce0b6a2226b024e94da6b033bac6a57b4d7e14e5318=
6c35336d8 \
+    gomod://github.com/lib/pq;version=3Dv1.0.0;sha256sum=3D8aa4a8870dbd30c=
8b143fe70f121c3ea917b6483251d1384da1b01fc6c6f6c30 \
+    gomod://github.com/mattn/go-colorable;version=3Dv0.0.9;mod=3D1;sha256s=
um=3D42e24895f7279f25a71f4301827c952047b1d779a6c8d0cc602f6f9a8dfd990a \
+    gomod://github.com/mattn/go-isatty;version=3Dv0.0.4;sha256sum=3D867a0f=
2496147b51a633de2ccda78fe1de790c1a6d00b9eb6d70bcc392426201 \
+    gomod://github.com/mattn/go-runewidth;version=3Dv0.0.3;sha256sum=3D485=
68ed111397ccf7442430dedeb8ccee14c5d7e9060341b5224384c775324dd \
+    gomod://github.com/mattn/go-sqlite3;version=3Dv1.11.0;mod=3D1;sha256su=
m=3D366d4add68d5899014331ab335e46fad7eff728126b2a57caf4111e736b16053 \
+    gomod://github.com/mattn/go-tty;version=3Dv0.0.0-20180907095812-13ff12=
04f104;mod=3D1;sha256sum=3Dc2b1007330609a2de88ca462a8a5c6b00355d1e59fb00462=
e763d3be1ce7a195 \
+    gomod://github.com/matttproud/golang_protobuf_extensions;version=3Dv1.=
0.1;sha256sum=3De64dc58023f4b8c4472d05a44f2719b84d6c2cc364cc682820c9f72b233=
c9cdc \
+    gomod://github.com/mitchellh/copystructure;version=3Dv1.1.1;mod=3D1;sh=
a256sum=3D0da554e99b552c9645f14a92155e643fef1774c03d224290c1a318113173c675 =
\
+    gomod://github.com/mitchellh/reflectwalk;version=3Dv1.0.1;mod=3D1;sha2=
56sum=3D7a5fefd3afb6a309c9c38b51a5448e01cdc9cff07be066e29d53609f3290f2bb \
+    gomod://github.com/modern-go/concurrent;version=3Dv0.0.0-2018030601264=
4-bacd9c7ef1dd;mod=3D1;sha256sum=3D27a5e9f05c71089b6fd5e119fc1c8ce81f0c16da=
4ec3357157b1d85e2ba85ae2 \
+    gomod://github.com/modern-go/reflect2;version=3Dv1.0.1;mod=3D1;sha256s=
um=3Db455521ad42d16fab08ef1d7488c22ef240c94a86847360ad3a16719a087132b \
+    gomod://github.com/mschoch/smat;version=3Dv0.0.0-20160514031455-90eade=
e771ae;mod=3D1;sha256sum=3D5e5d258752b478283e0150c10e037de69333a12cc5277ecb=
26337bd9cd98b7d2 \
+    gomod://github.com/mwitkow/go-conntrack;version=3Dv0.0.0-2016112909585=
7-cc309e4a2223;mod=3D1;sha256sum=3D3f15a518f37228f2d08c6b43762d43869a5ab8ae=
7ba3b5124bf961035e71cc18 \
+    gomod://github.com/opentracing/opentracing-go;version=3Dv1.0.2;mod=3D1=
;sha256sum=3D5b59c67ddd6e8f240a0008f739d14875c1af800b8e1b23d95c10c8bea49655=
d7 \
+    gomod://github.com/opentracing/opentracing-go;version=3Dv1.0.3-0.20180=
606204148-bd9c31933947;sha256sum=3D9f713f45fe865453738633a69f35c8279ecb88f1=
30ca2a140a7b44385656f776 \
+    gomod://github.com/paulbellamy/ratecounter;version=3Dv0.2.0;sha256sum=
=3Dfb012856582335cdac02ee17c08692d75d539158a82eda3a26fb8a51d4ef27e6 \
+    gomod://github.com/peterh/liner;version=3Dv1.0.1-0.20180619022028-8c12=
71fcf47f;sha256sum=3D0d96c450f9c55a8102f4ae7fd8a583ebfaeba23e3939d6b6284306=
a82a21430f \
+    gomod://github.com/philhofer/fwd;version=3Dv1.0.0;sha256sum=3Db4e79b1f=
5fdfe8c44bf6dae3dd593c62862930114411a30968f304084de1d0b3 \
+    gomod://github.com/pierrec/lz4;version=3Dv2.0.5+incompatible;mod=3D1;s=
ha256sum=3D2a50cf1993308244414372349e500770dde0671ee259159cf305f4b1f84ebae9=
 \
+    gomod://github.com/pkg/errors;version=3Dv0.8.0;mod=3D1;sha256sum=3Ddf2=
8c6a823f181d76179697177c0c5943c6ffb38f3c10b2dc53be360ee7d4589 \
+    gomod://github.com/pkg/errors;version=3Dv0.8.1;mod=3D1;sha256sum=3Ddf2=
8c6a823f181d76179697177c0c5943c6ffb38f3c10b2dc53be360ee7d4589 \
+    gomod://github.com/pkg/errors;version=3Dv0.9.1;sha256sum=3Dd4c36b8bcd0=
616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07 \
+    gomod://github.com/pmezard/go-difflib;version=3Dv1.0.0;mod=3D1;sha256s=
um=3D74b2e766eb215377864d587badf57e95521f692d2a7860b3c7759093f9c9bec2 \
+    gomod://github.com/prometheus/client_golang;version=3Dv0.9.1;mod=3D1;s=
ha256sum=3Daa78fc9a1301ae94f44703846ddddf254defec30356e3f1300bbb4db0eb3db65=
 \
+    gomod://github.com/prometheus/client_golang;version=3Dv1.0.0;sha256sum=
=3Df6f37b8178ced8795d16d9a1f8291f36485edbc5baf89d9e457aa21708893b09 \
+    gomod://github.com/prometheus/client_model;version=3Dv0.0.0-2018071210=
5110-5c3871d89910;mod=3D1;sha256sum=3D9ecd481d10e3f3b86ba0755986a85852028b8=
6f2ba597965d3d3672b2f2fb738 \
+    gomod://github.com/prometheus/client_model;version=3Dv0.0.0-2019012923=
3127-fd36f4220a90;mod=3D1;sha256sum=3D8ae247f8b1ced742fbc4aa7ebc6b6c935172e=
aafa61a2be52ba0bd41286db031 \
+    gomod://github.com/prometheus/client_model;version=3Dv0.0.0-2019081215=
4241-14fe0d1b01d4;sha256sum=3D5d4719be47f4f69ab5bf36a04c75eb078a0f69b43a335=
f400c2d688ac9e61795 \
+    gomod://github.com/prometheus/common;version=3Dv0.4.1;mod=3D1;sha256su=
m=3Daad8503b85be2616008ba40f3e63277fc9653bd9c148c3d510000f173a16bdba \
+    gomod://github.com/prometheus/common;version=3Dv0.6.0;sha256sum=3D6fb7=
4cce1a5bd84cf36954493d6157b1bd2231b20ba2587c224df9737b579314 \
+    gomod://github.com/prometheus/procfs;version=3Dv0.0.0-20181005140218-1=
85b4288413d;mod=3D1;sha256sum=3D52ded709607588200eff4bcfbd61fce32bb0c3f0efd=
d32d846e3ea150b196352 \
+    gomod://github.com/prometheus/procfs;version=3Dv0.0.2;sha256sum=3Dd5e9=
430b0a3209ccd75569f7c6f9c9fcfc48f554557f44562352adab9c617464 \
+    gomod://github.com/retailnext/hllpp;version=3Dv1.0.1-0.20180308014038-=
101a6d2f8b52;sha256sum=3D7863938cb01dfe9d4495df3c6608bedceec2d1195da05612f3=
c1b0e27d37729d \
+    gomod://github.com/rogpeppe/go-internal;version=3Dv1.3.0;mod=3D1;sha25=
6sum=3D33b55e839b0754283c3eeec1f33e16cc66432dffb8b8a96d24f536d01e51495b \
+    gomod://github.com/segmentio/kafka-go;version=3Dv0.1.0;mod=3D1;sha256s=
um=3D02ca00937516b509446c5eb0bd0a4e613b76388af2a65e58f9669434ca0668b6 \
+    gomod://github.com/segmentio/kafka-go;version=3Dv0.2.0;sha256sum=3Db2a=
88eb5b65fbb75dac0ba5e721cd2cb8e39275d1702a0f97e3c4807d78e8b48 \
+    gomod://github.com/sergi/go-diff;version=3Dv1.0.0;mod=3D1;sha256sum=3D=
3c33ca6c34b55597876e1b3ec55b717f899d94d66ad78d6f084b48e6e19b406e \
+    gomod://github.com/sirupsen/logrus;version=3Dv1.2.0;mod=3D1;sha256sum=
=3Dd67049652749abc6560f22dee3a27aab795a32ee2c7e078a54615a61b7abb99b \
+    gomod://github.com/smartystreets/assertions;version=3Dv0.0.0-201809271=
80507-b2de0cb4f26d;mod=3D1;sha256sum=3D75ccd8771f23a04379e7631044c4fb70b49b=
27a09650299752ee712f08a6add7 \
+    gomod://github.com/smartystreets/goconvey;version=3Dv1.6.4;mod=3D1;sha=
256sum=3D37e964c8dc1be33116055227dc75838037c5b5cbbe1b7923d6c6270d0eeafd05 \
+    gomod://github.com/spaolacci/murmur3;version=3Dv0.0.0-20180118202830-f=
09979ecbc72;mod=3D1;sha256sum=3D55565ffdc59d315a952774815afa98668ab9011e8cc=
11e35be5243e63a23260d \
+    gomod://github.com/spf13/cast;version=3Dv1.3.0;sha256sum=3D001ed519a3e=
c007e76e639f72bd9560be70497d499acbf1a32ccf32dc4647d91 \
+    gomod://github.com/spf13/cobra;version=3Dv0.0.3;mod=3D1;sha256sum=3D41=
ec7f1a12f7934ac349ac6b87d99bc43a8ec4405ef968f3bf0bd0a32625d76a \
+    gomod://github.com/spf13/pflag;version=3Dv1.0.3;mod=3D1;sha256sum=3Dc0=
119b5dfbbf3c0cb02b168ce0fcc19e7edefa73c9844c4609ebcb57f4394d14 \
+    gomod://github.com/stretchr/objx;version=3Dv0.1.0;mod=3D1;sha256sum=3D=
1350354d52d2287a62336ecc0d56232d4c47699af9bba49c67c2b48254da98f1 \
+    gomod://github.com/stretchr/objx;version=3Dv0.1.1;mod=3D1;sha256sum=3D=
1350354d52d2287a62336ecc0d56232d4c47699af9bba49c67c2b48254da98f1 \
+    gomod://github.com/stretchr/testify;version=3Dv1.2.0;mod=3D1;sha256sum=
=3D4ab463f68c370041f950c10cab5104903d4598c50cf824f9aad1b7b7f69255af \
+    gomod://github.com/stretchr/testify;version=3Dv1.2.2;mod=3D1;sha256sum=
=3D4ab463f68c370041f950c10cab5104903d4598c50cf824f9aad1b7b7f69255af \
+    gomod://github.com/stretchr/testify;version=3Dv1.3.0;mod=3D1;sha256sum=
=3Dab063d5154a8e8730bced4c52698e5770eb50bfae347bebc35eca488b8e3f6e3 \
+    gomod://github.com/stretchr/testify;version=3Dv1.4.0;mod=3D1;sha256sum=
=3D6b0c7b71030d4fc55d4e6e6e24c0bfc025621341f76141e3aec0044c4ce89950 \
+    gomod://github.com/stretchr/testify;version=3Dv1.7.0;mod=3D1;sha256sum=
=3Dfff8168d98e6a07156c454a1b6e925509f3177e96c155516d7f96b4079cca3bf \
+    gomod://github.com/tinylib/msgp;version=3Dv1.0.2;sha256sum=3D5450d0cd1=
2c3718b80d4106c7245597fca21c291cb90c025456f91595bd73717 \
+    gomod://github.com/willf/bitset;version=3Dv1.1.3;mod=3D1;sha256sum=3Dc=
81e024c074979c357c2e44138e3636bdfbc3f3b904ad6296711835f79510b15 \
+    gomod://github.com/xlab/treeprint;version=3Dv0.0.0-20180616005107-d6fb=
6747feb6;sha256sum=3D68f7825262c0b29754dfc7723cb2dfa22a9587d420057c4efe68ec=
b5e8e00370 \
+    gomod://github.com/yuin/goldmark;version=3Dv1.1.27;mod=3D1;sha256sum=
=3De2c763f861ada05c6150c32f804bca31c96a18b944320e0ee9bbf0d6c6075ad7 \
+    gomod://github.com/yuin/goldmark;version=3Dv1.2.1;mod=3D1;sha256sum=3D=
e2c763f861ada05c6150c32f804bca31c96a18b944320e0ee9bbf0d6c6075ad7 \
+    gomod://go.opencensus.io;version=3Dv0.21.0;mod=3D1;sha256sum=3D89e0925=
da03a5af98879b3cfb5d969b3764554b29edcb43844ecbf12d615c542 \
+    gomod://go.opencensus.io;version=3Dv0.22.0;mod=3D1;sha256sum=3D9380576=
a0acb3b28afa896d2cc44cbdbcf5667f9bdcd8d59edfcbb651a713e0f \
+    gomod://go.opencensus.io;version=3Dv0.22.2;sha256sum=3D484089733701e0d=
2ec3a9da762c25d2d5b499195d210d4d9745a9017727a1334 \
+    gomod://go.uber.org/atomic;version=3Dv1.3.2;mod=3D1;sha256sum=3Ddcff30=
98f14452022e7a84a52624be8082b87728f8ccf0baad7e06a3a285f3b7 \
+    gomod://go.uber.org/atomic;version=3Dv1.5.0;mod=3D1;sha256sum=3D782efe=
5cb1f88f104ab69bb7b2c099dc5ea88e64dec62a6fbe03dba7f53f1733 \
+    gomod://go.uber.org/atomic;version=3Dv1.5.1;sha256sum=3D2fc25453731e5b=
eabdb52d1f5de6efe388cc110069e4e4e136e7c5f412b81335 \
+    gomod://go.uber.org/multierr;version=3Dv1.1.0;mod=3D1;sha256sum=3Dff6c=
97e57138fc150113ae9431c1dbb64827186cb6af4a78dba70d369d081aac \
+    gomod://go.uber.org/multierr;version=3Dv1.4.0;sha256sum=3D9c5d3ad17e1b=
e690008a26be25a39f07264d917b4ff7273b4795584aaa1894a3 \
+    gomod://go.uber.org/tools;version=3Dv0.0.0-20190618225709-2cfd321de3ee=
;mod=3D1;sha256sum=3Db30974af981689ea010e489f2fd046fe75a46f109951cb879525f6=
e710849812 \
+    gomod://go.uber.org/zap;version=3Dv1.9.1;sha256sum=3D4123895f26d6efdf3=
fd20524dd24724ae137cc96d83fe094267406df11837c52 \
+    gomod://golang.org/x/crypto;version=3Dv0.0.0-20180904163835-0709b304e7=
93;mod=3D1;sha256sum=3D5d01144d948412591d8f11d49f7a74fadace58e12d7366cf0af9=
92147e52486d \
+    gomod://golang.org/x/crypto;version=3Dv0.0.0-20190308221718-c2843e01d9=
a2;mod=3D1;sha256sum=3D33ed070a5a66e0960685ac5386440e1b59899e74d8a38a118068=
5e72a2195ded \
+    gomod://golang.org/x/crypto;version=3Dv0.0.0-20190510104115-cbcb750295=
29;mod=3D1;sha256sum=3D3ab9f01f4610fe7b39bd85d68e8d97825351e7e282c39cda4145=
7c2a276f3be3 \
+    gomod://golang.org/x/crypto;version=3Dv0.0.0-20190605123033-f99c8df09e=
b5;mod=3D1;sha256sum=3D3ab9f01f4610fe7b39bd85d68e8d97825351e7e282c39cda4145=
7c2a276f3be3 \
+    gomod://golang.org/x/crypto;version=3Dv0.0.0-20191011191535-87dc89f015=
50;mod=3D1;sha256sum=3D3ab9f01f4610fe7b39bd85d68e8d97825351e7e282c39cda4145=
7c2a276f3be3 \
+    gomod://golang.org/x/crypto;version=3Dv0.0.0-20200622213623-75b288015a=
c9;mod=3D1;sha256sum=3Db2b12d09f81915fbcf4226009e50f9efda8bd3757d2055d8ec07=
977e65bc6618 \
+    gomod://golang.org/x/crypto;version=3Dv0.0.0-20210322153248-0c34fe9e7d=
c2;sha256sum=3D2d8c67019031583297a020f2fea24f726808f6bbf9374fcc4ec609c47b6c=
a2e7 \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20180321215751-8460e604b9de;=
mod=3D1;sha256sum=3D9ff1d07ca8c09458450eb5f4076aa0390ef5c7db0c7a942150e8825=
8a78b5383 \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20180807140117-3d87b88a115f;=
mod=3D1;sha256sum=3D9ff1d07ca8c09458450eb5f4076aa0390ef5c7db0c7a942150e8825=
8a78b5383 \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20190121172915-509febef88a4;=
mod=3D1;sha256sum=3D9ff1d07ca8c09458450eb5f4076aa0390ef5c7db0c7a942150e8825=
8a78b5383 \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20190125153040-c74c464bbbf2;=
mod=3D1;sha256sum=3D9ff1d07ca8c09458450eb5f4076aa0390ef5c7db0c7a942150e8825=
8a78b5383 \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20190306152737-a1d7652674e8;=
mod=3D1;sha256sum=3D9ff1d07ca8c09458450eb5f4076aa0390ef5c7db0c7a942150e8825=
8a78b5383 \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20190510132918-efd6b22b2522;=
mod=3D1;sha256sum=3D7a4e599afab4210da7c43e6634411f2e3b3458f909869076d3510a8=
e44ba247c \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20190829153037-c13cbed26979;=
mod=3D1;sha256sum=3Da4455956bbb8767350d2d12b8d80bdc45651618f3ec753869385e35=
166fdd211 \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20191030013958-a1ab85dbe136;=
mod=3D1;sha256sum=3D216515d46656a348a831b48d80b07b77e8a1bc8d0efea2b80a1a16f=
fb4397821 \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20191129062945-2f5052295587;=
mod=3D1;sha256sum=3D3c05e70b6cad2b075bcb9b525e665a28b0b4f7419c50d0acc8d8cdb=
7213d3caa \
+    gomod://golang.org/x/exp;version=3Dv0.0.0-20191227195350-da58074b4299;=
mod=3D1;sha256sum=3D3c05e70b6cad2b075bcb9b525e665a28b0b4f7419c50d0acc8d8cdb=
7213d3caa \
+    gomod://golang.org/x/image;version=3Dv0.0.0-20180708004352-c73c2afc3b8=
1;mod=3D1;sha256sum=3D750f3c9741e41fe464879a60b1df257f3a311aff01d19f43f4987=
dba30007098 \
+    gomod://golang.org/x/image;version=3Dv0.0.0-20190227222117-0694c2d4d06=
7;mod=3D1;sha256sum=3D9b905a7a8c84ce9e164760c09071b95301e8d3d402ed962173f12=
f92b8ad62fc \
+    gomod://golang.org/x/image;version=3Dv0.0.0-20190802002840-cff245a6509=
b;mod=3D1;sha256sum=3D4fa94ad41d9c4b097044b0b7fc21ca03d78e070e9ec10a6c9c311=
f05d0d51d00 \
+    gomod://golang.org/x/lint;version=3Dv0.0.0-20181026193005-c67002cb31c3=
;mod=3D1;sha256sum=3D169b05225c8e2729727e0679ae3911918dfe1c4b18bed5ee0fae29=
f9ed77b207 \
+    gomod://golang.org/x/lint;version=3Dv0.0.0-20190227174305-5b3e6a55c961=
;mod=3D1;sha256sum=3D8e86b5869db58a7659e485b07dbce3beb1170a153631579e50f4cb=
f544bb1342 \
+    gomod://golang.org/x/lint;version=3Dv0.0.0-20190301231843-5614ed5bae6f=
;mod=3D1;sha256sum=3D169b05225c8e2729727e0679ae3911918dfe1c4b18bed5ee0fae29=
f9ed77b207 \
+    gomod://golang.org/x/lint;version=3Dv0.0.0-20190313153728-d0100b6bd8b3=
;mod=3D1;sha256sum=3D79df4350b922a8d193782e5600f88280a2b9d41781bfb3760c09bf=
52ad3023bf \
+    gomod://golang.org/x/lint;version=3Dv0.0.0-20190409202823-959b441ac422=
;mod=3D1;sha256sum=3D79df4350b922a8d193782e5600f88280a2b9d41781bfb3760c09bf=
52ad3023bf \
+    gomod://golang.org/x/lint;version=3Dv0.0.0-20190909230951-414d861bb4ac=
;mod=3D1;sha256sum=3D79df4350b922a8d193782e5600f88280a2b9d41781bfb3760c09bf=
52ad3023bf \
+    gomod://golang.org/x/lint;version=3Dv0.0.0-20190930215403-16217165b5de=
;mod=3D1;sha256sum=3D79df4350b922a8d193782e5600f88280a2b9d41781bfb3760c09bf=
52ad3023bf \
+    gomod://golang.org/x/lint;version=3Dv0.0.0-20191125180803-fdd1cda4f05f=
;mod=3D1;sha256sum=3Deb2c1c22b22583cbdd897a8b5ac9f9bf4888cd7ac3fa0008102221=
e128c0e679 \
+    gomod://golang.org/x/mobile;version=3Dv0.0.0-20190312151609-d3739f865f=
a6;mod=3D1;sha256sum=3Db29b62b9fccb08272a7a27ba8cb6c4c8eba7e6d060ee7ab33722=
677902f22c18 \
+    gomod://golang.org/x/mobile;version=3Dv0.0.0-20190719004257-d2bd2a29d0=
28;mod=3D1;sha256sum=3D6bb86972375503a74822f0750f14d8e60e82ed73bf079522b8f5=
64ad2077eaed \
+    gomod://golang.org/x/mod;version=3Dv0.0.0-20190513183733-4bf6d317e70e;=
mod=3D1;sha256sum=3Dac221647647b0b59618b2e312ba252fc36d6e5cf33d0f2ca64f1fac=
65a1d6034 \
+    gomod://golang.org/x/mod;version=3Dv0.1.0;mod=3D1;sha256sum=3D14244b61=
ad6d46ffffc42b90a2b570c49d99aa3db1753062284d7dcf7d4d3e4a \
+    gomod://golang.org/x/mod;version=3Dv0.1.1-0.20191105210325-c90efee705e=
e;mod=3D1;sha256sum=3Dd76bbdea81d196d09858967a67ac805dacecdd1fb30c5001a187d=
24c129b1597 \
+    gomod://golang.org/x/mod;version=3Dv0.2.0;mod=3D1;sha256sum=3Db288f088=
fd851885a6d348339e2f588e58a94e6c76e5e634ae1d67c2749eb413 \
+    gomod://golang.org/x/mod;version=3Dv0.3.0;mod=3D1;sha256sum=3Db288f088=
fd851885a6d348339e2f588e58a94e6c76e5e634ae1d67c2749eb413 \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20180724234803-3673e40ba225;=
mod=3D1;sha256sum=3D3e08f487ddda1851b891df5b1d04bb1a01b84d6d702aa82d9efbccd=
e0aa7df81 \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20180826012351-8a410e7b638d;=
mod=3D1;sha256sum=3D3e08f487ddda1851b891df5b1d04bb1a01b84d6d702aa82d9efbccd=
e0aa7df81 \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20181114220301-adae6a3d119a;=
mod=3D1;sha256sum=3D3e08f487ddda1851b891df5b1d04bb1a01b84d6d702aa82d9efbccd=
e0aa7df81 \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20190108225652-1e06a53dbb7e;=
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
+    gomod://golang.org/x/net;version=3Dv0.0.0-20190501004415-9ce7a6920f09;=
mod=3D1;sha256sum=3Df7046769daac02beb57cbcc481280df59fb403c96fe8262282aba85=
8c7f7fa4d \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20190503192946-f4e77d36d62c;=
mod=3D1;sha256sum=3Df7046769daac02beb57cbcc481280df59fb403c96fe8262282aba85=
8c7f7fa4d \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20190603091049-60506f45cf65;=
mod=3D1;sha256sum=3D6ebeb3fafb09612d3ef1ff0413dfaac05bbaf8f229abde0ae0e0122=
98dfe6702 \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20190613194153-d28f0bde5980;=
mod=3D1;sha256sum=3De6efdaf78a29503f080cf6d2615e289cfb1d9e3ab7d570f53668eca=
2b4ab41da \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20190620200207-3b0461eec859;=
mod=3D1;sha256sum=3De6efdaf78a29503f080cf6d2615e289cfb1d9e3ab7d570f53668eca=
2b4ab41da \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20190724013045-ca1201d0de80;=
mod=3D1;sha256sum=3De6efdaf78a29503f080cf6d2615e289cfb1d9e3ab7d570f53668eca=
2b4ab41da \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20191209160850-c0dbc17a3553;=
mod=3D1;sha256sum=3De6efdaf78a29503f080cf6d2615e289cfb1d9e3ab7d570f53668eca=
2b4ab41da \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20200226121028-0de0cce0169b;=
mod=3D1;sha256sum=3De6efdaf78a29503f080cf6d2615e289cfb1d9e3ab7d570f53668eca=
2b4ab41da \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20201021035429-f5854403a974;=
mod=3D1;sha256sum=3D66fc44a0644a506da780f7a22a5d73dd025d44a6e58740b62d27f74=
d7c3a4948 \
+    gomod://golang.org/x/net;version=3Dv0.0.0-20210226172049-e18ecbb05110;=
sha256sum=3D17ae555c0bec70b583d84ec7a099db3fdc5b3b688cb2814f8c388d174e7ada1=
5 \
+    gomod://golang.org/x/oauth2;version=3Dv0.0.0-20180821212333-d2e6202438=
be;mod=3D1;sha256sum=3Dcbbb618da87d4f943b54bfd4f4d3a2fff3610298f04fbeeb3db3=
88cb075f351a \
+    gomod://golang.org/x/oauth2;version=3Dv0.0.0-20190226205417-e64efc72b4=
21;mod=3D1;sha256sum=3D869f44e4ecd5cda53165510a308515670dd7edc92005e8079ca0=
a5c864529b2b \
+    gomod://golang.org/x/oauth2;version=3Dv0.0.0-20190604053449-0f29369cfe=
45;mod=3D1;sha256sum=3D869f44e4ecd5cda53165510a308515670dd7edc92005e8079ca0=
a5c864529b2b \
+    gomod://golang.org/x/oauth2;version=3Dv0.0.0-20191202225959-858c2ad4c8=
b6;mod=3D1;sha256sum=3D869f44e4ecd5cda53165510a308515670dd7edc92005e8079ca0=
a5c864529b2b \
+    gomod://golang.org/x/oauth2;version=3Dv0.0.0-20200107190931-bf48bf16ab=
8d;sha256sum=3D661e4c30b15e488b434b19085567e581eb7bde892f04a0a3ab7ef94c0028=
f133 \
+    gomod://golang.org/x/sync;version=3Dv0.0.0-20180314180146-1d60e4601c6f=
;mod=3D1;sha256sum=3D421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52=
686794161c \
+    gomod://golang.org/x/sync;version=3Dv0.0.0-20181108010431-42b317875d0f=
;mod=3D1;sha256sum=3D421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52=
686794161c \
+    gomod://golang.org/x/sync;version=3Dv0.0.0-20181221193216-37e7f081c4d4=
;mod=3D1;sha256sum=3D421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52=
686794161c \
+    gomod://golang.org/x/sync;version=3Dv0.0.0-20190227155943-e225da77a7e6=
;mod=3D1;sha256sum=3D421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52=
686794161c \
+    gomod://golang.org/x/sync;version=3Dv0.0.0-20190423024810-112230192c58=
;mod=3D1;sha256sum=3D421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52=
686794161c \
+    gomod://golang.org/x/sync;version=3Dv0.0.0-20190911185100-cd5d95a43a6e=
;mod=3D1;sha256sum=3D421f6139686d5891f3dc5a563d0995780d3279f65cad4d225cea52=
686794161c \
+    gomod://golang.org/x/sync;version=3Dv0.0.0-20201020160332-67f06af15bc9=
;sha256sum=3Da62c30f9e46c28636239041d7bfa1583a24378bc408554ec0670196cbac985=
8e \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20180830151530-49385e6e1522;=
mod=3D1;sha256sum=3D8969115e4a39108848324e79a1bd8a8445230e6e3aaccbe9f8057fb=
50fffc8c1 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20180905080454-ebe1bf3edb33;=
mod=3D1;sha256sum=3D8969115e4a39108848324e79a1bd8a8445230e6e3aaccbe9f8057fb=
50fffc8c1 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20181116152217-5ac8a444bdc5;=
mod=3D1;sha256sum=3D8969115e4a39108848324e79a1bd8a8445230e6e3aaccbe9f8057fb=
50fffc8c1 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20190215142949-d0b11bdaac8a;=
mod=3D1;sha256sum=3D8969115e4a39108848324e79a1bd8a8445230e6e3aaccbe9f8057fb=
50fffc8c1 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20190312061237-fead79001313;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20190412213103-97732733099d;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20190502145724-3ef323f4f1fd;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20190507160741-ecd444e8653b;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20190606165138-5da285871e9c;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20190624142023-c5567b49c5d0;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20190726091711-fc99dfbffb4e;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20191204072324-ce4227a45e2e;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20191228213918-04cbcbbfeed8;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20200107162124-548cf772de50;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20200930185726-fdedc70b468f;=
mod=3D1;sha256sum=3D181979e8bd57d2d9e064182da86c9a6111aa69755e888f08431ece4=
742aec343 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20201119102817-f84b799fce68;=
sha256sum=3D2681eb52677683be3760258aafe13c91c1c83888442e9c6545334ae97a02b38=
6 \
+    gomod://golang.org/x/term;version=3Dv0.0.0-20201126162022-7de9c90e9dd1=
;sha256sum=3D475a86f11dd148b474ce405c5dbdd5f6bcae056c3e44e52445a45926dd69a5=
52 \
+    gomod://golang.org/x/text;version=3Dv0.3.0;mod=3D1;sha256sum=3D36879d5=
86fd8001e84da8787190a11e4f78749e2a81dfe8b9b6931899fff31cf \
+    gomod://golang.org/x/text;version=3Dv0.3.1-0.20180807135948-17ff2d5776=
d2;mod=3D1;sha256sum=3D36879d586fd8001e84da8787190a11e4f78749e2a81dfe8b9b69=
31899fff31cf \
+    gomod://golang.org/x/text;version=3Dv0.3.2;mod=3D1;sha256sum=3D6c3c7ad=
f2b0ad7143d913f4698d1908422369a5e6f198620f97f3e52f9a1b8dd \
+    gomod://golang.org/x/text;version=3Dv0.3.3;sha256sum=3D8a896da346baf94=
ab4f24b0e396df0b79393c93aa05c50ef07cddd561a1ff8d7 \
+    gomod://golang.org/x/time;version=3Dv0.0.0-20181108054448-85acf8d2951c=
;mod=3D1;sha256sum=3D38e2bcf9a8f563a15c2fba57e4c22a5963a38a95766521ad2b6f3c=
9cf8718fcc \
+    gomod://golang.org/x/time;version=3Dv0.0.0-20190308202827-9d24e82272b4=
;sha256sum=3D6b30eea8bfe0e7fed30cb4ac1e5a683c10b34942c9bedaf01b5a7643ca9fce=
9f \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20180525024113-a5b4c53f6e8=
b;mod=3D1;sha256sum=3Da0e02f0678fe62dc3c4b4bc77fa912c9b70de10fa9f7cf2f7aad0=
337392b52af \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20180917221912-90fa682c2a6=
e;mod=3D1;sha256sum=3Da0e02f0678fe62dc3c4b4bc77fa912c9b70de10fa9f7cf2f7aad0=
337392b52af \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20181030221726-6c7e314b656=
3;mod=3D1;sha256sum=3Da0e02f0678fe62dc3c4b4bc77fa912c9b70de10fa9f7cf2f7aad0=
337392b52af \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190114222345-bf090417da8=
b;mod=3D1;sha256sum=3Da0e02f0678fe62dc3c4b4bc77fa912c9b70de10fa9f7cf2f7aad0=
337392b52af \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190206041539-40960b6deb8=
e;mod=3D1;sha256sum=3Da0e02f0678fe62dc3c4b4bc77fa912c9b70de10fa9f7cf2f7aad0=
337392b52af \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190226205152-f727befe758=
c;mod=3D1;sha256sum=3D2503823869125550d3f88bdef72820024fe27b141f44b81fc3b4f=
59ef78370eb \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190311212946-11955173bdd=
d;mod=3D1;sha256sum=3D029638674bdf4fce7437ebc25cda0c8172674ec534b1d2edeb0b4=
74c7d618f00 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190312151545-0bb0c0a6e84=
6;mod=3D1;sha256sum=3D029638674bdf4fce7437ebc25cda0c8172674ec534b1d2edeb0b4=
74c7d618f00 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190312170243-e65039ee413=
8;mod=3D1;sha256sum=3D029638674bdf4fce7437ebc25cda0c8172674ec534b1d2edeb0b4=
74c7d618f00 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190328211700-ab21143f238=
4;mod=3D1;sha256sum=3D029638674bdf4fce7437ebc25cda0c8172674ec534b1d2edeb0b4=
74c7d618f00 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190425150028-36563e24a26=
2;mod=3D1;sha256sum=3D135189df02315d75d62e27551d1accad1db5bd3c1a2a8756f63a6=
9f73b1b5217 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190506145303-2d16b83fe98=
c;mod=3D1;sha256sum=3D135189df02315d75d62e27551d1accad1db5bd3c1a2a8756f63a6=
9f73b1b5217 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190524140312-2c0ae700613=
5;mod=3D1;sha256sum=3D135189df02315d75d62e27551d1accad1db5bd3c1a2a8756f63a6=
9f73b1b5217 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190606124116-d0a3d012864=
b;mod=3D1;sha256sum=3D7eeccd01252b0a8983093e5b905aac5a041528477e1348f54b8aa=
35b6bb3406f \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190621195816-6e04913cbba=
c;mod=3D1;sha256sum=3D7eeccd01252b0a8983093e5b905aac5a041528477e1348f54b8aa=
35b6bb3406f \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190628153133-6cdbf07be9d=
0;mod=3D1;sha256sum=3D7eeccd01252b0a8983093e5b905aac5a041528477e1348f54b8aa=
35b6bb3406f \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190816200558-6889da9d547=
9;mod=3D1;sha256sum=3D88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5a=
b0b3501aca1 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20190911174233-4f2ddba30af=
f;mod=3D1;sha256sum=3D88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5a=
b0b3501aca1 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20191012152004-8de300cfc20=
a;mod=3D1;sha256sum=3D88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5a=
b0b3501aca1 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20191029041327-9cc4af7d6b2=
c;mod=3D1;sha256sum=3D88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5a=
b0b3501aca1 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20191029190741-b9c20aec41a=
5;mod=3D1;sha256sum=3D88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5a=
b0b3501aca1 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20191113191852-77e3bb0ad9e=
7;mod=3D1;sha256sum=3D88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5a=
b0b3501aca1 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20191115202509-3a792d9c32b=
2;mod=3D1;sha256sum=3D88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5a=
b0b3501aca1 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20191119224855-298f0cb1881=
e;mod=3D1;sha256sum=3D88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5a=
b0b3501aca1 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20191125144606-a911d9008d1=
f;mod=3D1;sha256sum=3D88d479265f886f5e598d76c003d0f257b42dbf1b895d820a12b5a=
b0b3501aca1 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20191216173652-a0e659d5136=
1;mod=3D1;sha256sum=3D5ea469c803b6ef8d41d1561b9e301a003fdd93976468bda5574b2=
6b056ea7f49 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20191227053925-7b8e75db28f=
4;mod=3D1;sha256sum=3D5ea469c803b6ef8d41d1561b9e301a003fdd93976468bda5574b2=
6b056ea7f49 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20200108203644-89082a38417=
8;mod=3D1;sha256sum=3D5ea469c803b6ef8d41d1561b9e301a003fdd93976468bda5574b2=
6b056ea7f49 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20200619180055-7c47624df98=
f;mod=3D1;sha256sum=3Def6e2f94244214971780f9ba31d90806928ad410c82b04d8888f8=
15341f7a667 \
+    gomod://golang.org/x/tools;version=3Dv0.0.0-20210106214847-113979e3529=
a;mod=3D1;sha256sum=3D25d72c03e7aa571136087ebafc9e83d004d0bd8cd3864d78c2f58=
13e122aba81 \
+    gomod://golang.org/x/xerrors;version=3Dv0.0.0-20190717185122-a985d3407=
aa7;mod=3D1;sha256sum=3Daa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27=
e78882db3d7f5 \
+    gomod://golang.org/x/xerrors;version=3Dv0.0.0-20191011141410-1b5146add=
898;mod=3D1;sha256sum=3Daa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27=
e78882db3d7f5 \
+    gomod://golang.org/x/xerrors;version=3Dv0.0.0-20191204190536-9bdfabe68=
543;mod=3D1;sha256sum=3Daa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27=
e78882db3d7f5 \
+    gomod://golang.org/x/xerrors;version=3Dv0.0.0-20200804184101-5ec99f83a=
ff1;mod=3D1;sha256sum=3Daa5e3ec9bb7b9f681609efac019d9de1a7ba7719248ff1eaa27=
e78882db3d7f5 \
+    gomod://gonum.org/v1/gonum;version=3Dv0.0.0-20180816165407-929014505bf=
4;mod=3D1;sha256sum=3Dac99c793cbdcb073b40b2c2a0c3d1fa41a369cb0c90641129f7ff=
288caa8734e \
+    gomod://gonum.org/v1/gonum;version=3Dv0.0.0-20181121035319-3f7ecaa7e8c=
a;mod=3D1;sha256sum=3Dac99c793cbdcb073b40b2c2a0c3d1fa41a369cb0c90641129f7ff=
288caa8734e \
+    gomod://gonum.org/v1/gonum;version=3Dv0.6.0;mod=3D1;sha256sum=3Dc2bee7=
8bf072ce54e4b4c640d1954546f7fcaefdb3bad41e58d78c3454297f14 \
+    gomod://gonum.org/v1/netlib;version=3Dv0.0.0-20181029234149-ec6d1f5cef=
e6;mod=3D1;sha256sum=3Dc73aaea6dda7a0b162895d58892cd128b8b2c99ef46bfd3d6f2d=
1e4f360bed26 \
+    gomod://gonum.org/v1/netlib;version=3Dv0.0.0-20190313105609-8cb42192e0=
e0;mod=3D1;sha256sum=3Dc73aaea6dda7a0b162895d58892cd128b8b2c99ef46bfd3d6f2d=
1e4f360bed26 \
+    gomod://gonum.org/v1/plot;version=3Dv0.0.0-20190515093506-e2840ee46a6b=
;mod=3D1;sha256sum=3D4a2de528e2eebbc818e5ce5a3161e48d20c06ee67896e852a8d039=
9a56e1bec6 \
+    gomod://google.golang.org/api;version=3Dv0.13.0;mod=3D1;sha256sum=3D97=
3cc763222678ba1dc9cb995f8878452ea2d6f23b3fa9321f9eae965d7e0be3 \
+    gomod://google.golang.org/api;version=3Dv0.14.0;mod=3D1;sha256sum=3D97=
3cc763222678ba1dc9cb995f8878452ea2d6f23b3fa9321f9eae965d7e0be3 \
+    gomod://google.golang.org/api;version=3Dv0.15.0;sha256sum=3De6a7a980ad=
1161a3db060cbeff23ec339d6db40a8c8b619b1aa47cee6662b5da \
+    gomod://google.golang.org/api;version=3Dv0.4.0;mod=3D1;sha256sum=3D00b=
c4a4f32637440ecbcef4fe7f6350a6b22427f0e5b295a4a0fdf31b4733a16 \
+    gomod://google.golang.org/api;version=3Dv0.7.0;mod=3D1;sha256sum=3D387=
1181ef7ba28d0215e5a9d73759d5de9925d92a7f5af9049c06f0bc1869d19 \
+    gomod://google.golang.org/api;version=3Dv0.8.0;mod=3D1;sha256sum=3De14=
497a566705dd0f1e18f83b743528a1012ec04b13dafa442d2a22534c82007 \
+    gomod://google.golang.org/api;version=3Dv0.9.0;mod=3D1;sha256sum=3De14=
497a566705dd0f1e18f83b743528a1012ec04b13dafa442d2a22534c82007 \
+    gomod://google.golang.org/appengine;version=3Dv1.1.0;mod=3D1;sha256sum=
=3Dd0fb3f328a95259ddeeb7ef934f2abae0327c6a052ff1ab05a2b882178a953b8 \
+    gomod://google.golang.org/appengine;version=3Dv1.4.0;mod=3D1;sha256sum=
=3Df95b808fed2c6febb23a8d11e92743583b37861584d302349ada5ae02a3874dd \
+    gomod://google.golang.org/appengine;version=3Dv1.5.0;mod=3D1;sha256sum=
=3Df95b808fed2c6febb23a8d11e92743583b37861584d302349ada5ae02a3874dd \
+    gomod://google.golang.org/appengine;version=3Dv1.6.1;mod=3D1;sha256sum=
=3Deb12ff9c7531b7cdcf71f61de880814bd84f022f57426eb12cea040eb0ccf116 \
+    gomod://google.golang.org/appengine;version=3Dv1.6.5;mod=3D1;sha256sum=
=3D476fc776d2906c32b6d6f30691df098cd4a70ad57967b3818faa444319cd9294 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20180817151627-c66=
870c02cf8;mod=3D1;sha256sum=3D4379a64312660353b2dadb20fd55d9968674bbc2bbcf0=
9d50c0aba80111a64b2 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20190307195333-5fe=
7a883aa19;mod=3D1;sha256sum=3D02391a258568bcc52b07763ac46781b1495255f2edaa5=
f28be1e432da0326b47 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20190418145605-e7d=
98fc518a7;mod=3D1;sha256sum=3D02391a258568bcc52b07763ac46781b1495255f2edaa5=
f28be1e432da0326b47 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20190425155659-357=
c62f0e4bb;mod=3D1;sha256sum=3D02391a258568bcc52b07763ac46781b1495255f2edaa5=
f28be1e432da0326b47 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20190502173448-54a=
fdca5d873;mod=3D1;sha256sum=3D02391a258568bcc52b07763ac46781b1495255f2edaa5=
f28be1e432da0326b47 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20190716160619-c50=
6a9f90610;mod=3D1;sha256sum=3D4b8edb9554439c665a29e584eda81870cbb699092227d=
97ba8fa9641538d541d \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20190801165951-fa6=
94d86fc64;mod=3D1;sha256sum=3D4b8edb9554439c665a29e584eda81870cbb699092227d=
97ba8fa9641538d541d \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20190819201941-24f=
a4b261c55;mod=3D1;sha256sum=3D4b8edb9554439c665a29e584eda81870cbb699092227d=
97ba8fa9641538d541d \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20190911173649-177=
4047e7e51;mod=3D1;sha256sum=3D88d410dc5fd1d1839fc54601883e42324966cb8719aae=
ecdf15aae04f4adba21 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20191108220845-16a=
3f7862a1a;mod=3D1;sha256sum=3D1b3643365a3c9de351b9ee9f6e02c2f39bcaef56e2bc2=
f52bda0369e34400821 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20191115194625-c23=
dd37a84c9;mod=3D1;sha256sum=3D1b3643365a3c9de351b9ee9f6e02c2f39bcaef56e2bc2=
f52bda0369e34400821 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20191216164720-4f7=
9533eabd1;mod=3D1;sha256sum=3D1b3643365a3c9de351b9ee9f6e02c2f39bcaef56e2bc2=
f52bda0369e34400821 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20191230161307-f3c=
370f40bfb;mod=3D1;sha256sum=3D1b3643365a3c9de351b9ee9f6e02c2f39bcaef56e2bc2=
f52bda0369e34400821 \
+    gomod://google.golang.org/genproto;version=3Dv0.0.0-20200108215221-bd8=
f9a0ef82f;sha256sum=3Defe927990fde064df1467d68121b817cf438679dd50ab84a84ccb=
cda1f9a64b2 \
+    gomod://google.golang.org/grpc;version=3Dv1.19.0;mod=3D1;sha256sum=3D7=
1de2597fd082e882ef08965ba0c3ee19d38f2df25920733cd434cf80a27ac35 \
+    gomod://google.golang.org/grpc;version=3Dv1.20.1;mod=3D1;sha256sum=3D5=
ed0b35e304a3f2b0a763cc23f30d5f750bcf33da9a33aa7959a4829adfa886d \
+    gomod://google.golang.org/grpc;version=3Dv1.21.1;mod=3D1;sha256sum=3D5=
65328b92f572d2c91063ffbd2f0d80630779b69b0a1da2a934319459797e3fe \
+    gomod://google.golang.org/grpc;version=3Dv1.23.0;mod=3D1;sha256sum=3D5=
87c9b854d7f5f0181487c854a24fc4c01982e5641d302ce1d0f3d041951cb8b \
+    gomod://google.golang.org/grpc;version=3Dv1.26.0;sha256sum=3D997df5096=
971bc48741f86a33ede95f47a13a5bce4f649103b0b5cf2cd0447ca \
+    gomod://gopkg.in/alecthomas/kingpin.v2;version=3Dv2.2.6;mod=3D1;sha256=
sum=3D6f22dc94266475313a2c8a75850cea41345aa5e338119302fca5768b4198b3ec \
+    gomod://gopkg.in/check.v1;version=3Dv0.0.0-20161208181325-20d25e280405=
;mod=3D1;sha256sum=3D5c306e0d633cd66a11b40e2e5fbbc6da42110db7d72ea3c1524ceb=
45ee40c33f \
+    gomod://gopkg.in/check.v1;version=3Dv1.0.0-20180628173108-788fd7840127=
;mod=3D1;sha256sum=3D5c306e0d633cd66a11b40e2e5fbbc6da42110db7d72ea3c1524ceb=
45ee40c33f \
+    gomod://gopkg.in/errgo.v2;version=3Dv2.1.0;mod=3D1;sha256sum=3De305204=
248256627966ff85c7dc591cf2d0e7de2094d0f465849f1b62a102748 \
+    gomod://gopkg.in/yaml.v2;version=3Dv2.2.1;mod=3D1;sha256sum=3D88d979d2=
f093d2397f756bc86efa2ca03f73a60d668ceb391b3510029f3f7cfc \
+    gomod://gopkg.in/yaml.v2;version=3Dv2.2.2;mod=3D1;sha256sum=3D88d979d2=
f093d2397f756bc86efa2ca03f73a60d668ceb391b3510029f3f7cfc \
+    gomod://gopkg.in/yaml.v2;version=3Dv2.3.0;mod=3D1;sha256sum=3D88d979d2=
f093d2397f756bc86efa2ca03f73a60d668ceb391b3510029f3f7cfc \
+    gomod://gopkg.in/yaml.v3;version=3Dv3.0.0-20200313102051-9f266ea9e77c;=
mod=3D1;sha256sum=3D21579860a20306fcf43b1bd234d1fba319499c77611b71c05f9bf3b=
a90dab939 \
+    gomod://honnef.co/go/tools;version=3Dv0.0.0-20190102054323-c2f93a96b09=
9;mod=3D1;sha256sum=3Db1c60837ea61335f14df64f3194c3cd92e0f628f6064806718950=
f0d7a1dbe9e \
+    gomod://honnef.co/go/tools;version=3Dv0.0.0-20190106161140-3f1c8253044=
a;mod=3D1;sha256sum=3Db1c60837ea61335f14df64f3194c3cd92e0f628f6064806718950=
f0d7a1dbe9e \
+    gomod://honnef.co/go/tools;version=3Dv0.0.0-20190418001031-e561f6794a2=
a;mod=3D1;sha256sum=3Db1c60837ea61335f14df64f3194c3cd92e0f628f6064806718950=
f0d7a1dbe9e \
+    gomod://honnef.co/go/tools;version=3Dv0.0.0-20190523083050-ea95bdfd59f=
c;mod=3D1;sha256sum=3Db1c60837ea61335f14df64f3194c3cd92e0f628f6064806718950=
f0d7a1dbe9e \
+    gomod://honnef.co/go/tools;version=3Dv0.0.1-2019.2.3;mod=3D1;sha256sum=
=3D592e9c55bb272525a46900c55469feb97adae507e7649beab4dc1350d735f64f \
+    gomod://rsc.io/binaryregexp;version=3Dv0.2.0;mod=3D1;sha256sum=3D03247=
3bbe554a54a445fa855bbb2bfa6234d786f61f1926de96b5aa85e91f13d \
+    gomod://rsc.io/pdf;version=3Dv0.1.1;mod=3D1;sha256sum=3Dfe87d9102096c8=
7900d1b4a106d9bd58f60c06809a4ef79d804bff0684f5cbe7 \
+"
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb-licenses.inc b/meta-oe/r=
ecipes-dbs/influxdb/influxdb-licenses.inc
new file mode 100644
index 0000000000..1454f05de5
--- /dev/null
+++ b/meta-oe/recipes-dbs/influxdb/influxdb-licenses.inc
@@ -0,0 +1,68 @@
+GO_MOD_LICENSES =3D "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & EPL-1.0 & =
ISC & MIT & MPL-2.0"
+
+LIC_FILES_CHKSUM +=3D "\
+    file://pkg/mod/cloud.google.com/go/bigtable@v1.2.0/LICENSE;md5=3D3b83e=
f96387f14655fc854ddc3c6bd57 \
+    file://pkg/mod/cloud.google.com/go@v0.51.0/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57 \
+    file://pkg/mod/collectd.org@v0.3.0/LICENSE;md5=3D51e2bb425ba79cdbe9788=
9a28f47eea8 \
+    file://pkg/mod/github.com/!burnt!sushi/toml@v0.3.1/COPYING;md5=3D9e24c=
0e2a784c1d1fcabb279f4f107e0 \
+    file://pkg/mod/github.com/beorn7/perks@v1.0.0/LICENSE;md5=3D0d0738f37e=
e8dc0b5f88a32e83c60198 \
+    file://pkg/mod/github.com/bmizerany/pat@v0.0.0-20170815010413-6226ea59=
1a40/README.md;md5=3D3b558b273cee6c2b170793783b3d2e13 \
+    file://pkg/mod/github.com/c-bata/go-prompt@v0.2.2/LICENSE;md5=3Df234b2=
c6d7f152e88593827000a76ee1 \
+    file://pkg/mod/github.com/dgrijalva/jwt-go/v4@v4.0.0-preview1/LICENSE;=
md5=3D276f2f3ba3749d25f6a6f5fb852d462e \
+    file://pkg/mod/github.com/dgryski/go-bitstream@v0.0.0-20180413035011-3=
522498ce2c8/LICENSE;md5=3D94d87602d16546d50e0b7e0930c3dae5 \
+    file://pkg/mod/github.com/eclipse/paho.mqtt.golang@v1.2.0/LICENSE;md5=
=3D3e75bb9ec12a51993bd30e51011b4229 \
+    file://pkg/mod/github.com/go-sql-driver/mysql@v1.4.1/LICENSE;md5=3D815=
ca599c9df247a0c7f619bab123dad \
+    file://pkg/mod/github.com/gofrs/uuid@v3.3.0+incompatible/LICENSE;md5=
=3Dae4ba217c6e20c2d8f48f69966b9121b \
+    file://pkg/mod/github.com/gogo/protobuf@v1.3.2/LICENSE;md5=3D38be95f95=
200434dc208e2ee3dab5081 \
+    file://pkg/mod/github.com/golang/geo@v0.0.0-20190916061304-5b978397cfe=
c/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
+    file://pkg/mod/github.com/golang/groupcache@v0.0.0-20191227052852-215e=
87163ea7/LICENSE;md5=3D19cbd64715b51267a47bf3750cc6a8a5 \
+    file://pkg/mod/github.com/golang/protobuf@v1.3.2/LICENSE;md5=3D939cce1=
ec101726fa754e698ac871622 \
+    file://pkg/mod/github.com/golang/snappy@v0.0.0-20180518054509-2e65f852=
55db/LICENSE;md5=3Db8b79c7d4cda128290b98c6a21f9aac6 \
+    file://pkg/mod/github.com/google/flatbuffers@v1.11.0/LICENSE.txt;md5=
=3Da873c5645c184d51e0f9b34e1d7cf559 \
+    file://pkg/mod/github.com/google/go-cmp@v0.4.0/LICENSE;md5=3D4ac66f7de=
a41d8d116cb7fb28aeff2ab \
+    file://pkg/mod/github.com/googleapis/gax-go/v2@v2.0.5/LICENSE;md5=3D0d=
d48ae8103725bd7b401261520cdfbb \
+    file://pkg/mod/github.com/influxdata/flux@v0.65.1/LICENSE;md5=3Df39a8d=
10930fb37bd59adabb3b9d0bd6 \
+    file://pkg/mod/github.com/influxdata/influxql@v1.1.1-0.20200828144457-=
65d3ef77d385/LICENSE;md5=3Dba8146ad9cc2a128209983265136e06a \
+    file://pkg/mod/github.com/influxdata/roaring@v0.4.13-0.20180809181101-=
fc520f41fab6/LICENSE;md5=3Db13d5600b5dc9e6cfb93ac14d7d6cfbf \
+    file://pkg/mod/github.com/influxdata/tdigest@v0.0.0-20181121200506-bf2=
b5ad3c0a9/LICENSE;md5=3Dfd9c5bdb98de5b3e7b20f14b1cf17e32 \
+    file://pkg/mod/github.com/influxdata/usage-client@v0.0.0-2016082918005=
4-6d3895376368/LICENSE.txt;md5=3D17cff8e5ad17d1d8c2ac21440e86d366 \
+    file://pkg/mod/github.com/jsternberg/zap-logfmt@v1.0.0/LICENSE;md5=3D8=
60d1817101f99a56b547104ebfd4801 \
+    file://pkg/mod/github.com/jwilder/encoding@v0.0.0-20170811194829-b4e17=
01a28ef/LICENSE;md5=3De75d4fbdba08ce3a518e7aab13042096 \
+    file://pkg/mod/github.com/klauspost/compress@v1.4.0/LICENSE;md5=3D5917=
78525c869cdde0ab5a1bf283cd81 \
+    file://pkg/mod/github.com/klauspost/crc32@v0.0.0-20161016154125-cb6bfc=
a970f6/LICENSE;md5=3D0f63a5a579a75ddec9f3464b085818a4 \
+    file://pkg/mod/github.com/klauspost/pgzip@v1.0.2-0.20170402124221-0bf5=
dcad4ada/LICENSE;md5=3D9ea3772c7ca56b5e8cbd5caf795588b5 \
+    file://pkg/mod/github.com/kraj/term@v0.0.0-20210111231523-7c42fcb0e627=
/LICENSE;md5=3Dc11f50de045e1f8eb4502b2f50550720 \
+    file://pkg/mod/github.com/kraj/xxhash@v1.1.1-0.20211201014032-8254a11e=
ab56/LICENSE.txt;md5=3D802da049c92a99b4387d3f3d91b00fa9 \
+    file://pkg/mod/github.com/lib/pq@v1.0.0/LICENSE.md;md5=3D0eab29964025b=
358179aa6d8f7db14bf \
+    file://pkg/mod/github.com/mattn/go-isatty@v0.0.4/LICENSE;md5=3Df509bea=
dd5a11227c27b5d2ad6c9f2c6 \
+    file://pkg/mod/github.com/mattn/go-runewidth@v0.0.3/LICENSE;md5=3D24ce=
168f90aec2456a73de1839037245 \
+    file://pkg/mod/github.com/matttproud/golang_protobuf_extensions@v1.0.1=
/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e \
+    file://pkg/mod/github.com/opentracing/opentracing-go@v1.0.3-0.20180606=
204148-bd9c31933947/LICENSE;md5=3Df4e91fcd9abdeb3c904b834127d5cb20 \
+    file://pkg/mod/github.com/peterh/liner@v1.0.1-0.20180619022028-8c1271f=
cf47f/COPYING;md5=3D7316a33df6826d7cc2854e686cb9279f \
+    file://pkg/mod/github.com/philhofer/fwd@v1.0.0/LICENSE.md;md5=3Dcfd452=
e4c91aa5191e3af8f3e4b67a9a \
+    file://pkg/mod/github.com/pkg/errors@v0.9.1/LICENSE;md5=3D6fe682a02df5=
2c6653f33bd0f7126b5a \
+    file://pkg/mod/github.com/prometheus/client_golang@v1.0.0/LICENSE;md5=
=3D86d3f3a95c324c9479bd8986968f4327 \
+    file://pkg/mod/github.com/prometheus/client_model@v0.0.0-2019081215424=
1-14fe0d1b01d4/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \
+    file://pkg/mod/github.com/prometheus/common@v0.6.0/LICENSE;md5=3D86d3f=
3a95c324c9479bd8986968f4327 \
+    file://pkg/mod/github.com/prometheus/common@v0.6.0/internal/bitbucket.=
org/ww/goautoneg/README.txt;md5=3Da33eda65f1bc658f358e1d690c6a93d4 \
+    file://pkg/mod/github.com/prometheus/procfs@v0.0.2/LICENSE;md5=3D86d3f=
3a95c324c9479bd8986968f4327 \
+    file://pkg/mod/github.com/segmentio/kafka-go@v0.2.0/LICENSE;md5=3D2451=
77e51c68aa2071d537392357ab87 \
+    file://pkg/mod/github.com/tinylib/msgp@v1.0.2/LICENSE;md5=3D37acb030ba=
070680be4a9fcb57f2735a \
+    file://pkg/mod/github.com/xlab/treeprint@v0.0.0-20180616005107-d6fb674=
7feb6/LICENSE;md5=3D41d2819776299442cbac81ad74bfc094 \
+    file://pkg/mod/go.opencensus.io@v0.22.2/LICENSE;md5=3D175792518e4ac015=
ab6696d16c4f607e \
+    file://pkg/mod/go.uber.org/atomic@v1.5.1/LICENSE.txt;md5=3D1caee865194=
56feda989f8a838102b50 \
+    file://pkg/mod/go.uber.org/multierr@v1.4.0/LICENSE.txt;md5=3Df65b21a54=
7112d1bc7b11b90f9b31997 \
+    file://pkg/mod/go.uber.org/zap@v1.9.1/LICENSE.txt;md5=3D5e8153e456a825=
29ea845e0d511abb69 \
+    file://pkg/mod/golang.org/x/crypto@v0.0.0-20210322153248-0c34fe9e7dc2/=
LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/net@v0.0.0-20210226172049-e18ecbb05110/LIC=
ENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/oauth2@v0.0.0-20200107190931-bf48bf16ab8d/=
LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/sync@v0.0.0-20201020160332-67f06af15bc9/LI=
CENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/LIC=
ENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/term@v0.0.0-20201126162022-7de9c90e9dd1/LI=
CENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/text@v0.3.3/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707 \
+    file://pkg/mod/golang.org/x/time@v0.0.0-20190308202827-9d24e82272b4/LI=
CENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+    file://pkg/mod/google.golang.org/api@v0.15.0/LICENSE;md5=3Da651bb3d8b1=
c412632e28823bb432b40 \
+    file://pkg/mod/google.golang.org/api@v0.15.0/internal/third_party/urit=
emplates/LICENSE;md5=3D4ee4feb2b545c2231749e5c54ace343e \
+    file://pkg/mod/google.golang.org/genproto@v0.0.0-20200108215221-bd8f9a=
0ef82f/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
+    file://pkg/mod/google.golang.org/grpc@v1.26.0/LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57 \
+"
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/reci=
pes-dbs/influxdb/influxdb_1.8.10.bb
index 580b92b3b3..7502681fe2 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -1,38 +1,36 @@
 DESCRIPTION =3D "InfluxDB is a time series database designed to handle hig=
h write and query loads."
 HOMEPAGE =3D "https://www.influxdata.com/products/influxdb-overview/"
=20
-LICENSE =3D "MIT"
+LICENSE =3D "MIT & ${GO_MOD_LICENSES}"
 LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Df39a8d10930fb3=
7bd59adabb3b9d0bd6"
-
-RDEPENDS:${PN} =3D "bash"
-RDEPENDS:${PN}-dev =3D "bash"
-
-GO_IMPORT =3D "github.com/influxdata/influxdb"
-
-GO_INSTALL =3D "\
-    ${GO_IMPORT}/cmd/influx \
-    ${GO_IMPORT}/cmd/influxd \
-"
+require ${BPN}-licenses.inc
=20
 SRC_URI =3D "\
-    git://${GO_IMPORT};protocol=3Dhttps;branch=3D1.8;destsuffix=3D${BPN}-$=
{PV}/src/${GO_IMPORT} \
+    git://${GO_IMPORT};protocol=3Dhttps;branch=3D1.8;destsuffix=3Dgit/src/=
${GO_IMPORT} \
     file://0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch;patchdir=
=3Dsrc/${GO_IMPORT} \
+    file://0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch=
;patchdir=3Dsrc/${GO_IMPORT} \
     file://influxdb \
     file://influxdb.conf \
 "
-
-SRC_URI:append:mipsarch =3D " file://0001-patch-term-module-for-mips-ispee=
d-ospeed-termios-abs.patch;patchdir=3Dsrc/${GO_IMPORT}"
+require ${BPN}-go-mods.inc
=20
 SRCREV =3D "688e697c51fd5353725da078555adbeff0363d01"
=20
+S =3D "${WORKDIR}/git"
+
+GO_IMPORT =3D "github.com/influxdata/influxdb"
+GO_INSTALL =3D "\
+    ${GO_IMPORT}/cmd/influx \
+    ${GO_IMPORT}/cmd/influxd \
+"
+
 inherit go-mod pkgconfig systemd update-rc.d useradd
=20
-export GOPROXY =3D "https://proxy.golang.org,direct"
+INITSCRIPT_PACKAGES =3D "${PN}"
+INITSCRIPT_NAME =3D "influxdb"
+INITSCRIPT_PARAMS =3D "defaults"
=20
-# Workaround for network access issue during compile step
-# this needs to be fixed in the recipes buildsystem to move
-# this such that it can be accomplished during do_fetch task
-do_compile[network] =3D "1"
+SYSTEMD_SERVICE:${PN} =3D "influxdb.service"
=20
 USERADD_PACKAGES =3D "${PN}"
 USERADD_PARAM:${PN} =3D "--system -d /var/lib/influxdb -m -s /bin/nologin =
influxdb"
@@ -70,11 +68,8 @@ do_install:append() {
=20
 FILES:${PN} +=3D "${libdir}/influxdb/scripts/influxd-systemd-start.sh"
=20
-INITSCRIPT_PACKAGES =3D "${PN}"
-INITSCRIPT_NAME =3D "influxdb"
-INITSCRIPT_PARAMS =3D "defaults"
-
-SYSTEMD_SERVICE:${PN} =3D "influxdb.service"
+RDEPENDS:${PN} =3D "bash"
+RDEPENDS:${PN}-dev =3D "bash"
=20
 CVE_STATUS[CVE-2019-10329] =3D "cpe-incorrect: Version does not match and =
only the Jenkins plugin is affected."
 SKIP_RECIPE[influxdb] ?=3D "QA Issue: task do_compile has network enabled"
--=20
2.39.5


