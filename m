Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09FEC79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 07:49:00 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29640.1788766964563572350
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 00:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=t/CMV1dH;
 spf=pass (domain: est.tech, ip: 52.101.69.65, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F48paw3iIm1EkDWzlv9h6cJsYlHomlOqSvDGmBeSTZ6cOcqbrMXz+beUP9Abc2vmxiLNxIPq/yfAxo6LEeOK7bybnbiMwcDKBuVcZTLOZYEeVNooC3y0SdGVHgJfV/bXVzbqcq4pG8uCDkb7dRT3M8n6Otb/HHoGZzMtUImIlFijvIE9paQRKmk7Z0SJcgpewZIMbpRBiYIVUIZCKjzx4UtlRmh5l8vrZ5BnroGrjYOAqAOYMqceZrrOuqNukUSeqxCgaADcv+Wua4d0hMyEj0Rs4tbOVnp0++Nd0CJkg3VdE9B59sri3TdtV3YtqtGaik+F0eviNE0SOV+q5CdeDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq1W99mQHTlBo04kEeG5sLwpXGnhd/jtdQqF+dNnnSM=;
 b=mVX9fg63vH/AmWK0NKH7XdbYChxz/gYrS8Rw8OQtYGzXu1DzHSixxdRNPOgzw32LV+4KjHOORh/HUtrZdbycMDqgi+FfHnxwNpWawMCoRqO581UfxYertyHkdAmqCzm58gxUMQoPzy18SxBlcAbEJE8DE0QJN8c/TS26dP7YnBZ0kru2lCYaY6kWwMbVcvwr9g5KR45RtwQL63G37Otz7crBYhTFvV517A0qAKRc61hRkT3G2X6kqIS8uDzB9mNvS+sJmNTiR3Bfe9FFe90a+cKoDDNcQwYBMun/dqzfKs1jAmXS0eUvJacPtZbboB9M8u357pm8WclxGJN78ftFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zq1W99mQHTlBo04kEeG5sLwpXGnhd/jtdQqF+dNnnSM=;
 b=t/CMV1dHkSUs/xZFiTouoe9uCiwPF7jbIm/KUxuujpYp5zwbKLT5jL1KzoReGNEN6lnYyr/7qv5+ZKKghDW9wFLdcK3BgSSMIZ60+7o9LKjoynqAohhAhNh9K3OWb7/uhUMsyHrJ/XhiKJkNBmZ/8NXl90cI/lTQ4wdNdlJa+KVlg5BIT0w2gZzt1T8pH0eImCBFZ01u5Zp0SMrCr9e5ECk3iExD2qlYkMShCzRW7d9YEbUui+QDooc+p4HI5ENT9HDYxaXdzTn9Rd1sSjZlF8MiMtGBdfcNhMHH+L0RG1IEADxEDyIw8l80LktfkZ238ZjdjjOldcAEyR6P6PM4TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV4P189MB3558.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 07:42:39 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 07:42:39 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH 3/4] thrift: fix CVE-2026-55969
Date: Mon,  7 Sep 2026 09:42:19 +0200
Message-ID: <20260907074231.388316-3-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907074231.388316-1-adarsh.jagadish.kamini@est.tech>
References: <20260907074231.388316-1-adarsh.jagadish.kamini@est.tech>
X-ClientProxiedBy: LO6P123CA0037.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::9) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV4P189MB3558:EE_
X-MS-Office365-Filtering-Correlation-Id: e9623256-13b4-426a-c192-08df0cb39792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|10067099003|6133799003|3023799007|22082099003|20052099010|18002099003|12006099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	nCpaa81JZaFkoyrRRh+wKUaVSd+N8EJRBlVxiMUkycW/TMRbAi3CjSD7g9DPTXStLu1Ozg31IuA1udrHs8yzim5H6nOf3irqYIshiedQb1M2b70moD0GrCp5vZI5n3ojbKW6FX3J4YTSGKWfInuCyBQcLXhXf84EhkBiT6L6OUQNW/yPwueTE22oHAlMXZ4+wBy9ih+egE/7NamLmV7dBWSeSgUvKYaVh3RaVi2eCI/+JPd3fZhtAHHeavZtqwZFMgR0gMooMXHwFe2XUN0YhP7CF+lVtPFyX+wYbqpnDBhx3ckIPNf2KMNM+kRs/wR7LswtvhceZiMeG6DAWSctRNHl6aiH2PbekIb6ZNxlaX8+8byvOzUIegs6vkPq+TwBpztH6D2jsh66ejs3y+Mc14IrGfDjmtTGl6tFIQtXRPWXpVAp3ZsgwafOVUuz2aWfwqzCYJYaRanJg1BkB6vJsZ/gV/ywhutF/SCkfSdsJ9Ym2nTKQPLhgMI+kcVYQnuMDWIyngi+eCFjKICt/neRjSvz+nfpACj/nXFVvJJCTXxwUCKAsuZXIQDn2Zmgg97r9SU2zoNq5RPqABAsSeazyxSNK+CENuL6AeyWNKN2d5ReI1uzq/ZiuOHEf95UAFi7/gsU3CBqXXWTpTp7dIMGlviXAklXLgmTJw7wgwjghcc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(20052099010)(18002099003)(12006099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wr/60WG4jBIgpcihfGFKyJe38I1pk/RQjMZ7RBJhKTGfKoMehiDjbxTxw6VQ?=
 =?us-ascii?Q?rKZBmpunDPap9nnsgTEPtU4hobcQDDgACHtRYf/Kh4D3S7bu5nn+sRFtYSQI?=
 =?us-ascii?Q?2GvPA0UE2trcgweklE6HcjzehEx+VBpuGsrMq0780EJG+WlqWBMcd/ZXF5ns?=
 =?us-ascii?Q?b0W7pOGbXiXjCV2WGwU9j96TnSTJko3Dz+5/MPUiZiTF+DJ9N/xuS1Pl+nW/?=
 =?us-ascii?Q?0/4NXJFceVG09U+TFHMZ/Ninv9cjzo6aJFQDxTZK89x5dNcx38OXi7J9Z/kc?=
 =?us-ascii?Q?TVFnwr264y1VnqrXNT6dLkcMI3pqLP1muJJ4Ri6SusS3b91YMHjF/eHcx2ks?=
 =?us-ascii?Q?xe7VKhJtGwdVz9iTjtm9+fb+hDslHRO0jSxXVStpDVJhqEQ87XlGZ6pWX/Gg?=
 =?us-ascii?Q?2Rxg0H7cjVNEl8NlZw3Kly4DxATyQas6Fo6DPDbhenB6nfRU8YXQwgUlq+cE?=
 =?us-ascii?Q?G6jYdUl5HoOH/zjBi0kM2M9g7LGplBE0vGyzPXi8Sri4JrgpUeyP3ATfF694?=
 =?us-ascii?Q?NOHi9wt89dNva8GTSviQFGUvsWWBGsV5jaCprSNClKddJWvW78Mk9yYt31RC?=
 =?us-ascii?Q?lcIZfCRladwFAvhHGLagsKZ9pLKv5G8RP7Jn1livaBVTjAZMHPEEeDRxk/ic?=
 =?us-ascii?Q?ErADDbyXZo65Ux5Ee7fD/UQgVTFMWeShdXekfx7tJ+yvEeVN0fH2AKnN+kgu?=
 =?us-ascii?Q?LxTGPbsUi3i53xpzOozZPEKat5bgf9tqQXl7yLhPWOgPvE0fVUjYOmnkBYcp?=
 =?us-ascii?Q?T1O3XzaGbPJVED+NmiynNq9+OJGRos+e5j7Uy3ISBRKqJhOnqtICIb9BYWk6?=
 =?us-ascii?Q?HEGNSdoZ9Z522l8Wn2cR5VcwqMN6RBaqr/gUoRT31dpaWwyS1QIF9nODQp3B?=
 =?us-ascii?Q?Fa4srE01jzcNK+Pkuf6kdR9KlfKvTFdirnpB2eD5Ch4ReS26GDYegGhmUEki?=
 =?us-ascii?Q?SVyL8uwENDIB9GUBtqM1cu6PUwf6m0OjBy0YJKyRuB2EzpZ573atgcB6zmuJ?=
 =?us-ascii?Q?FeZBM54OpgB3FwN7CO04PqG0YpriORS2ARr0Nbjq8dbp0U4y8FYFOM+NOn3o?=
 =?us-ascii?Q?ypasjAnatP9ESsNjaBdSrGIJhD21Gf4LDeMl57+mRjdkw+hNAvZ4Qhjf58eX?=
 =?us-ascii?Q?i68F0jMUzk6LPW6MaH3SusjSNXBBaRCKwx/IJXf5HtNF9pbZ08stwe+vpDJ+?=
 =?us-ascii?Q?m4sjVibC1vCJxNvq3q6M/c1FpeOX3RRmJPfhodFidYZv8x28WiYpP/X9mo4K?=
 =?us-ascii?Q?5iN2yVshB649MntCnj07Yk47aY8YkEYlmxretPCFtd3gl3/gZT2QtxrrJtyE?=
 =?us-ascii?Q?tSVpl30YCbQAzJH3DuYbXBUcJwyR/uG6bq8w43H+OEKAWSURp3JrqoNKeyNK?=
 =?us-ascii?Q?hMSkbpk4ZZUnjbRshx9iXS1w1YVKk0tBCca1uc6J9ep/FVO8m1cRntvqDKSH?=
 =?us-ascii?Q?jKNoz3HXGCtCdwnIuQ0dMhETvuROY/l3EMwTZ9mgLtYUzB99PELSZ6I+rZWR?=
 =?us-ascii?Q?xuBKoXyauw1wgBCMvydk3xIN/EtPRrHur65cReBodKrIm2DY43cGK1e24WOz?=
 =?us-ascii?Q?jOybf213bZxV0UY7aWQ8YrkwMKKLeO6LxZxXxtna9lgxdbppKwMx02024CIC?=
 =?us-ascii?Q?qNum0pPp4BOE78vk7vQoToxvHwOnDls+YyoLraguopyaonhiRZ6Nw/ujSAW0?=
 =?us-ascii?Q?GZr2E1yqsGzZdc0Mz+E2KMXq53PgRCn/GF+6Ugs0pKNqBvrUNcv12b3WWMIG?=
 =?us-ascii?Q?osOyG4+6NdkVCR1U+gGZdLqyCNHWyvAoGwPL31E/jLS3HJC0JPkKvdIBR2Sm?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	qYXdei9jHcXp2QDdj9keNbCt5qUO7LyMsb+0jXFRyRHCxHOT0QHAbBwK
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e9623256-13b4-426a-c192-08df0cb39792
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 07:42:39.2703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkFTCgbqXzbKYIkhlXMSEusv/tuvGS6OBZwYv9U/O8c86XxcPRc+RsRIqmCBWcTfl+ulyFt/LU7X8nittnKqUujjmNxQ+juE60qP2QIXfSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3558
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 07:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129807

Backport patch to fix CVE-2026-55969.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-55969

Upstream fix:
  https://github.com/apache/thrift/commit/983c813c9a1a2302d9a3ae23d7368bece=
aac2d0a

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../thrift/thrift/CVE-2026-55969.patch        | 295 ++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |   1 +
 2 files changed, 296 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-559=
69.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch
new file mode 100644
index 0000000000..9a3e2af92a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch
@@ -0,0 +1,295 @@
+From f288d1a7bdd994872d6ac1e7f2d7eb60b5beb1e5 Mon Sep 17 00:00:00 2001
+From: dxbjavid <dxbjavid@gmail.com>
+Date: Tue, 9 Jun 2026 16:35:58 +0530
+Subject: [PATCH] Widen multiplication operands in container size prechecks=
 to
+ prevent arithmetic overflow on LLP64 platforms Client: cpp,c_glib Patch:
+ Javid Khan
+
+This closes #3590
+
+Backport note: in thrift_binary_protocol.c the 0.22.0 tree lacks the
+container_limit property infrastructure present upstream (unrelated to thi=
s
+CVE), so only the intended change was applied: widening the sizei/msize
+multiplication operands to gint64 in the checkReadBytesAvailable calls.
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-55969
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/983c813=
c9a1a2302d9a3ae23d7368beceaac2d0a]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ .../c_glib/protocol/thrift_binary_protocol.c  |  6 +--
+ .../c_glib/protocol/thrift_compact_protocol.c | 10 ++--
+ .../c_glib/transport/thrift_transport.c       |  2 +-
+ .../c_glib/transport/thrift_transport.h       |  2 +-
+ lib/cpp/src/thrift/protocol/TBinaryProtocol.h |  6 +--
+ .../src/thrift/protocol/TCompactProtocol.h    |  6 +--
+ lib/cpp/src/thrift/protocol/TJSONProtocol.h   |  6 +--
+ lib/cpp/src/thrift/protocol/TProtocol.h       |  6 +--
+ lib/cpp/src/thrift/transport/TTransport.h     |  3 +-
+ lib/cpp/test/ThrifttReadCheckTests.cpp        | 48 +++++++++++++++++++
+ 10 files changed, 72 insertions(+), 23 deletions(-)
+
+diff --git a/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.=
c b/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c
+index 9e80e107c..3bad603c3 100644
+--- a/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c
++++ b/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c
+@@ -562,8 +562,8 @@ thrift_binary_protocol_read_map_begin (ThriftProtocol =
*protocol,
+   }
+=20
+   if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport),=20
+-                                    sizei * thrift_binary_protocol_get_mi=
n_serialized_size(protocol, k, error) +=20
+-                                    sizei * thrift_binary_protocol_get_mi=
n_serialized_size(protocol, v, error),
++                                    (gint64) sizei * thrift_binary_protoc=
ol_get_min_serialized_size(protocol, k, error) +=20
++                                    (gint64) sizei * thrift_binary_protoc=
ol_get_min_serialized_size(protocol, v, error),
+                                     error))
+   {
+     return -1;
+@@ -619,7 +619,7 @@ thrift_binary_protocol_read_list_begin (ThriftProtocol=
 *protocol,
+   }
+=20
+   if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport),=20
+-                                    (sizei * thrift_binary_protocol_get_m=
in_serialized_size(protocol, e, error)),
++                                    ((gint64) sizei * thrift_binary_proto=
col_get_min_serialized_size(protocol, e, error)),
+                                     error))
+   {
+     return -1;
+diff --git a/lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol=
.c b/lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c
+index 0aa9a6fe6..f6ad36b36 100644
+--- a/lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c
++++ b/lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c
+@@ -1108,9 +1108,9 @@ thrift_compact_protocol_read_map_begin (ThriftProtoc=
ol *protocol,
+     return -1;
+   }
+=20
+-  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT (tp->transport),=20
+-                                    msize * thrift_protocol_get_min_seria=
lized_size (protocol, *key_type, error) +=20
+-                                    msize * thrift_protocol_get_min_seria=
lized_size (protocol, *value_type, error),
++  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT (tp->transport),
++                                    (gint64) msize * thrift_protocol_get_=
min_serialized_size (protocol, *key_type, error) +
++                                    (gint64) msize * thrift_protocol_get_=
min_serialized_size (protocol, *value_type, error),
+                                     error))
+   {
+     return -1;
+@@ -1183,8 +1183,8 @@ thrift_compact_protocol_read_list_begin (ThriftProto=
col *protocol,
+   *element_type =3D ret;
+   *size =3D (guint32) lsize;
+=20
+-  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT (tp->transport),=20
+-                                    (lsize * thrift_protocol_get_min_seri=
alized_size (protocol, *element_type, error)),
++  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT (tp->transport),
++                                    ((gint64) lsize * thrift_protocol_get=
_min_serialized_size (protocol, *element_type, error)),
+                                     error))
+   {
+     return -1;
+diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c b/l=
ib/c_glib/src/thrift/c_glib/transport/thrift_transport.c
+index 9d3f25e75..7e18f712a 100644
+--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c
++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c
+@@ -160,7 +160,7 @@ thrift_transport_updateKnownMessageSize(ThriftTranspor=
t *transport, glong size,
+ }
+=20
+ gboolean
+-thrift_transport_checkReadBytesAvailable(ThriftTransport *transport, glon=
g numBytes, GError **error)
++thrift_transport_checkReadBytesAvailable(ThriftTransport *transport, gint=
64 numBytes, GError **error)
+ {
+   gboolean boolean =3D TRUE;
+   ThriftTransport *tt =3D THRIFT_TRANSPORT (transport);
+diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.h b/l=
ib/c_glib/src/thrift/c_glib/transport/thrift_transport.h
+index 83fb5da19..01365ba7f 100644
+--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.h
++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.h
+@@ -83,7 +83,7 @@ struct _ThriftTransportClass
+   gint32 (*read_all) (ThriftTransport *transport, gpointer buf,
+                       guint32 len, GError **error);
+   gboolean (*updateKnownMessageSize) (ThriftTransport *transport, glong s=
ize, GError **error);
+-  gboolean (*checkReadBytesAvailable) (ThriftTransport *transport, glong =
numBytes, GError **error);
++  gboolean (*checkReadBytesAvailable) (ThriftTransport *transport, gint64=
 numBytes, GError **error);
+   gboolean (*resetConsumedMessageSize) (ThriftTransport *transport, glong=
 newSize, GError **error);
+   gboolean (*countConsumedMessageBytes) (ThriftTransport *transport, glon=
g numBytes, GError **error);
+ };
+diff --git a/lib/cpp/src/thrift/protocol/TBinaryProtocol.h b/lib/cpp/src/t=
hrift/protocol/TBinaryProtocol.h
+index cba6e6948..1a7410c86 100644
+--- a/lib/cpp/src/thrift/protocol/TBinaryProtocol.h
++++ b/lib/cpp/src/thrift/protocol/TBinaryProtocol.h
+@@ -174,18 +174,18 @@ public:
+=20
+   void checkReadBytesAvailable(TSet& set) override
+   {
+-      trans_->checkReadBytesAvailable(set.size_ * getMinSerializedSize(se=
t.elemType_));
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(set.size_) * g=
etMinSerializedSize(set.elemType_));
+   }
+=20
+   void checkReadBytesAvailable(TList& list) override
+   {
+-      trans_->checkReadBytesAvailable(list.size_ * getMinSerializedSize(l=
ist.elemType_));
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(list.size_) * =
getMinSerializedSize(list.elemType_));
+   }
+=20
+   void checkReadBytesAvailable(TMap& map) override
+   {
+       int elmSize =3D getMinSerializedSize(map.keyType_) + getMinSerializ=
edSize(map.valueType_);
+-      trans_->checkReadBytesAvailable(map.size_ * elmSize);
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(map.size_) * e=
lmSize);
+   }
+=20
+ protected:
+diff --git a/lib/cpp/src/thrift/protocol/TCompactProtocol.h b/lib/cpp/src/=
thrift/protocol/TCompactProtocol.h
+index c7d81eea6..97ca460a7 100644
+--- a/lib/cpp/src/thrift/protocol/TCompactProtocol.h
++++ b/lib/cpp/src/thrift/protocol/TCompactProtocol.h
+@@ -146,18 +146,18 @@ public:
+=20
+   void checkReadBytesAvailable(TSet& set) override
+   {
+-      trans_->checkReadBytesAvailable(set.size_ * getMinSerializedSize(se=
t.elemType_));
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(set.size_) * g=
etMinSerializedSize(set.elemType_));
+   }
+=20
+   void checkReadBytesAvailable(TList& list) override
+   {
+-      trans_->checkReadBytesAvailable(list.size_ * getMinSerializedSize(l=
ist.elemType_));
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(list.size_) * =
getMinSerializedSize(list.elemType_));
+   }
+=20
+   void checkReadBytesAvailable(TMap& map) override
+   {
+       int elmSize =3D getMinSerializedSize(map.keyType_) + getMinSerializ=
edSize(map.valueType_);
+-      trans_->checkReadBytesAvailable(map.size_ * elmSize);
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(map.size_) * e=
lmSize);
+   }
+=20
+   /**
+diff --git a/lib/cpp/src/thrift/protocol/TJSONProtocol.h b/lib/cpp/src/thr=
ift/protocol/TJSONProtocol.h
+index 09eb6eab1..265b33922 100644
+--- a/lib/cpp/src/thrift/protocol/TJSONProtocol.h
++++ b/lib/cpp/src/thrift/protocol/TJSONProtocol.h
+@@ -253,18 +253,18 @@ public:
+=20
+   void checkReadBytesAvailable(TSet& set) override
+   {
+-      trans_->checkReadBytesAvailable(set.size_ * getMinSerializedSize(se=
t.elemType_));
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(set.size_) * g=
etMinSerializedSize(set.elemType_));
+   }
+=20
+   void checkReadBytesAvailable(TList& list) override
+   {
+-      trans_->checkReadBytesAvailable(list.size_ * getMinSerializedSize(l=
ist.elemType_));
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(list.size_) * =
getMinSerializedSize(list.elemType_));
+   }
+=20
+   void checkReadBytesAvailable(TMap& map) override
+   {
+       int elmSize =3D getMinSerializedSize(map.keyType_) + getMinSerializ=
edSize(map.valueType_);
+-      trans_->checkReadBytesAvailable(map.size_ * elmSize);
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(map.size_) * e=
lmSize);
+   }
+=20
+   class LookaheadReader {
+diff --git a/lib/cpp/src/thrift/protocol/TProtocol.h b/lib/cpp/src/thrift/=
protocol/TProtocol.h
+index 37b0db711..4eedc5e82 100644
+--- a/lib/cpp/src/thrift/protocol/TProtocol.h
++++ b/lib/cpp/src/thrift/protocol/TProtocol.h
+@@ -604,18 +604,18 @@ protected:
+=20
+   virtual void checkReadBytesAvailable(TSet& set)
+   {
+-      ptrans_->checkReadBytesAvailable(set.size_ * getMinSerializedSize(s=
et.elemType_));
++      ptrans_->checkReadBytesAvailable(static_cast<int64_t>(set.size_) * =
getMinSerializedSize(set.elemType_));
+   }
+=20
+   virtual void checkReadBytesAvailable(TList& list)
+   {
+-      ptrans_->checkReadBytesAvailable(list.size_ * getMinSerializedSize(=
list.elemType_));
++      ptrans_->checkReadBytesAvailable(static_cast<int64_t>(list.size_) *=
 getMinSerializedSize(list.elemType_));
+   }
+=20
+   virtual void checkReadBytesAvailable(TMap& map)
+   {
+       int elmSize =3D getMinSerializedSize(map.keyType_) + getMinSerializ=
edSize(map.valueType_);
+-      ptrans_->checkReadBytesAvailable(map.size_ * elmSize);
++      ptrans_->checkReadBytesAvailable(static_cast<int64_t>(map.size_) * =
elmSize);
+   }
+=20
+   std::shared_ptr<TTransport> ptrans_;
+diff --git a/lib/cpp/src/thrift/transport/TTransport.h b/lib/cpp/src/thrif=
t/transport/TTransport.h
+index 52b3a0a4d..1269593ac 100644
+--- a/lib/cpp/src/thrift/transport/TTransport.h
++++ b/lib/cpp/src/thrift/transport/TTransport.h
+@@ -23,6 +23,7 @@
+ #include <thrift/Thrift.h>
+ #include <thrift/TConfiguration.h>
+ #include <thrift/transport/TTransportException.h>
++#include <cstdint>
+ #include <memory>
+ #include <string>
+=20
+@@ -272,7 +273,7 @@ public:
+    *
+    * @param numBytes  numBytes bytes of data
+    */
+-  void checkReadBytesAvailable(long int numBytes)
++  void checkReadBytesAvailable(int64_t numBytes)
+   {
+     if (remainingMessageSize_ < numBytes)
+       throw TTransportException(TTransportException::END_OF_FILE, "MaxMes=
sageSize reached");
+diff --git a/lib/cpp/test/ThrifttReadCheckTests.cpp b/lib/cpp/test/Thriftt=
ReadCheckTests.cpp
+index 963286100..72e798bc1 100644
+--- a/lib/cpp/test/ThrifttReadCheckTests.cpp
++++ b/lib/cpp/test/ThrifttReadCheckTests.cpp
+@@ -243,6 +243,54 @@ BOOST_AUTO_TEST_CASE(test_tthriftcompactprotocol_read=
_check_pass) {
+   BOOST_CHECK_NO_THROW(protocol->readString(eleven));
+ }
+=20
++BOOST_AUTO_TEST_CASE(test_tthriftbinaryprotocol_container_size_overflow) =
{
++  std::shared_ptr<TConfiguration> config (new TConfiguration(1024));
++  std::shared_ptr<TMemoryBuffer> transport(new TMemoryBuffer(config));
++  std::shared_ptr<TBinaryProtocol> protocol(new TBinaryProtocol(transport=
));
++
++  uint32_t val =3D 0;
++  TType elemType =3D apache::thrift::protocol::T_STOP;
++  // 0x40000000 elements of min size 4 require 4 GiB; the product wraps t=
o 0 in
++  // 32-bit math and used to slip past the MaxMessageSize check.
++  TList list(T_I32, 0x40000000);
++  protocol->writeListBegin(list.elemType_, list.size_);
++  protocol->writeListEnd();
++  BOOST_CHECK_THROW(protocol->readListBegin(elemType, val), TTransportExc=
eption);
++  protocol->readListEnd();
++}
++
++BOOST_AUTO_TEST_CASE(test_tthriftcompactprotocol_container_size_overflow)=
 {
++  std::shared_ptr<TConfiguration> config (new TConfiguration(1024));
++  std::shared_ptr<TMemoryBuffer> transport(new TMemoryBuffer(config));
++  std::shared_ptr<TCompactProtocol> protocol(new TCompactProtocol(transpo=
rt));
++
++  uint32_t val =3D 0;
++  TType elemType =3D apache::thrift::protocol::T_STOP;
++  // 0x10000000 elements of min size 16 (UUID) require 4 GiB; the product=
 wraps
++  // to 0 in 32-bit math and used to slip past the MaxMessageSize check.
++  TList list(T_UUID, 0x10000000);
++  protocol->writeListBegin(list.elemType_, list.size_);
++  protocol->writeListEnd();
++  BOOST_CHECK_THROW(protocol->readListBegin(elemType, val), TTransportExc=
eption);
++  protocol->readListEnd();
++}
++
++BOOST_AUTO_TEST_CASE(test_tthriftjsonprotocol_container_size_overflow) {
++  std::shared_ptr<TConfiguration> config (new TConfiguration(1024));
++  std::shared_ptr<TMemoryBuffer> transport(new TMemoryBuffer(config));
++  std::shared_ptr<TJSONProtocol> protocol(new TJSONProtocol(transport));
++
++  uint32_t val =3D 0;
++  TType elemType =3D apache::thrift::protocol::T_STOP;
++  // 0x10000000 elements of min size 16 (UUID) require 4 GiB; the product=
 wraps
++  // to 0 in 32-bit math and used to slip past the MaxMessageSize check.
++  TList list(T_UUID, 0x10000000);
++  protocol->writeListBegin(list.elemType_, list.size_);
++  protocol->writeListEnd();
++  BOOST_CHECK_THROW(protocol->readListBegin(elemType, val), TTransportExc=
eption);
++  protocol->readListEnd();
++}
++
+ BOOST_AUTO_TEST_CASE(test_tthriftjsonprotocol_read_check_exception) {
+   std::shared_ptr<TConfiguration> config (new TConfiguration(MAX_MESSAGE_=
SIZE));
+   std::shared_ptr<TMemoryBuffer> transport(new TMemoryBuffer(config));
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.22.0.bb
index ad4e841d7b..d548288458 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "https://downloads.apache.org/${BPN}/${PV}/${=
BP}.tar.gz \
            file://CVE-2026-58389.patch \
            file://CVE-2026-41608.patch \
            file://CVE-2026-45112.patch \
+           file://CVE-2026-55969.patch \
            "
 SRC_URI[sha256sum] =3D "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59=
dc64a00df8a1e5"
=20

