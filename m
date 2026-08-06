Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D324C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:37:05 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17069.1786015506883330098
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SC9ohf+V;
 spf=pass (domain: est.tech, ip: 52.101.84.3, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsXV82uXS6M1vp9BXibloOwUinZC1LIXnG0DtuYWY+hdDlxHmLy2Obi6s6P0P+FG/IZaXLBgVS6AmUQ6zbGyc0rhQQ5J2oanBtXHArLtOhmVfnG+BD59Q+sCg1JnTK68PbF8miD20dX7frDHtBhIsLaQ6zzgGCQwCLKI6Cfy56SAdGs2hc6oXHfS4zchtJVHZ5jyy52QKmyTGxEUUytmPv5PCiUnZWl1psGDqdidUodW5xN8RdL/h9r91dfgHZ9USZfZ58xBY5YnlWpLFQ6ZHW+kuD1bDZvPQn5ey7IO5dhUDyZGmcOwuifutIhO44ASPiM8AKTJuValhwVskjY5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bnlq1u90Y0gGFR+pTgQx3WjM7wfVqYEpCFTwHRqIQEg=;
 b=BlOHqmixqcGR0FT1BjpNUDXQ4YSIb/5qopFUL41e35nNhmn/tYwx60OGA3sfC4ecTJjGfQ5RWxayrlMAGNRID0HydXoW/1G6hqTamHsYztQNbQ2zHx5E6M11Rjo4iUs5ZS5SgSlkdX4vJ8+KYh1j3wAkYn8qV+XtLjI9tPQUDg5uHFjXSoi3RsN1wUBkKBxRHH5tG3I0AHWyrxRoOuRmDTlThHaSjcPiCV/pYGYkawDeNLrJKFNBdRIX3YBes7Vd8Ga2mEB9YZqL24GG1U358yfr8WZXr2jio0eU8gJCP8qYmoNKr+XDuqmGlzayzG+IrjquUZDU+3muKGgDuzQwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bnlq1u90Y0gGFR+pTgQx3WjM7wfVqYEpCFTwHRqIQEg=;
 b=SC9ohf+VwP4IcuOghBMA9Gz2dI7z3pZKOC161S0urhhcvZIpSpMBt5wgsKukfujL/WrzV0JrwSlrGMI0RNqHn3Z+yVc1KGNfS6S/NdlGFhfNo/PTwYgV25sB1H5bXJ3ukdTuaiasP/qqQqGUkOkpLvdE1QmVTbhj2AXwZvninJx2CDtSJ5xabsu2TQVGGFzNooikJKSQ/6vMlmGCY2fN6hTcxCquIzQ1Dg1r63GJR+WzYmfqGN61avY7Gg9i6WdN2PVrXxrttS6HucManmyhe6+HCCfaLw+creRbOyXiqYFNttKl9qGloGIfteC5n/TNxm0WrbyjNbcyVCkPXoD6aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AM8P189MB1219.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:240::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.5; Thu, 6 Aug 2026
 11:25:02 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0315.006; Thu, 6 Aug 2026
 11:25:02 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: elin-upstream@mailman.lmera.ericsson.se,
	openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH v2] thrift: fix CVE-2026-55969
Date: Thu,  6 Aug 2026 13:24:55 +0200
Message-ID: <20260806112458.1159145-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P265CA0245.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::17) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AM8P189MB1219:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d8a384-e290-48b7-81f8-08def3ad5b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|10067099003|6133799003|12006099003|20052099010|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	qtB3egvg41mlsUZ+HVZJFPrxIJy2KyDNNslh+SnvfA1bSu7M8zcF+u8W4scOYS0gp+efpF1gprvLy628vMjXIfKmj3X1RWCUKsDO7PTqF/3GsNQr1m06yhQKhJx5B+bMEJZAEooTXbdxaziQXF6wPf6sBxbvSpqdQvMdamL1LCzRkmhW/i6dN5f8gAVliD7fQ2HPG8t30+Hc+5nwKJaNxLk6lgv8UbDI4lubyyhkEvR7wq7wJMA5BtBIrrQkCxGqzEph+zJykGRLz/DmO1TOwzoszu8I1LPcrwcgNsGgh+YtMvmeM851jF+eNTIS4+A8Nza4Bb5CM8o4ggbspUHWau8pR82bqA9rMPZVlugqaKffOISgP705MPEqAAgEXjVfNvJZpMFmhEm1n8f0XdYeNETAkU0CkT3EzZ/CTeMUBZI9h+Qq4Xc8MzOuogx9Kq2KpGhZp3MwNCqX1v2azabJ+RhbhuXtICxGpwCXwIGt4Pa/rim6lQ4eIRNfBDNfPUdchOqKnUq/GDf2FaPIVYHyrVTOtNxqpcFMmh7UN/H9f0HTDNwdFv+Gnd9VrTod0y55GVtQn6V2v5hlvdMv3iMUlYdVs/k5qO8Aa86UemesVHUcnQxyLg9reRu3O7WPXCJMTEQ0Q2DwmI7d2//lo5WEI0Rm5FbGFISpGHs0zb2wVvc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(12006099003)(20052099010)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TepJuKYSI0DOiNDncI1+G88cqr2Tkmg0Q7DNPyoncD6TCtUZhEdVf/4cAEgq?=
 =?us-ascii?Q?pB6qHjb+CRVURmC75UgBQFdBQ5EGzsq66dWW29CAObDZh0EawNgZjjMhs8dI?=
 =?us-ascii?Q?HQMkLijH5FM/yVjpNytryHxuQ5INxzN0+U9PlIfWO/p32iFjnPvvjnMtlaO5?=
 =?us-ascii?Q?oGYz/DRX1HpJY8V2Mnmlmw0jAEyWmh5gHUKzAcJo2udeMrGwPDGbie/CY0da?=
 =?us-ascii?Q?SQYJIjfe4jrCmAj3EzeKVc1EB69jxrY9O1P7hValjV94W2lcYf+gONVbBTyl?=
 =?us-ascii?Q?9fS1JOhVZVn/F8syvC34uO64pt0FvPctkegLlPWZYTVdzOGFJ6TxJLpwKrBY?=
 =?us-ascii?Q?B0a2xiwpmlbZCmUuK0R+nrygfZu6RHWMO3KEmDX4rPqZ1ovFg2SRSV3p/nMQ?=
 =?us-ascii?Q?6D/3SJGiaNTRmIMZtPWVkYSIJOQKn3ZbXMnIzxFJ+pnHuL18P9Z14uVgYsa/?=
 =?us-ascii?Q?iiqpjvOWiRAEs2Iv3IpOM6kpDWn8GCWZekjHb/mtSN6u85g9eQcLPQaClqQo?=
 =?us-ascii?Q?y11YzpnTUBL0gO+Yma4N3qMtRJekZIwYkFvZiiVYRr+n/H/z9aQKn+kymWYn?=
 =?us-ascii?Q?hyBok5ycecIEfWw6QtJrVbJ8qRRElWT0E6BPrKXpkYRjGjsGrJmd/RE3NlIi?=
 =?us-ascii?Q?u3fj6FpZkS6i0qaNUyhrji5zrfiDkgC5max/dLSTKkw9Y9opBfbZMpivm0KZ?=
 =?us-ascii?Q?Y+MERssWwQ/HoSsu2mOPJkBTFNwks+If3wRXAkPW7FaQSDDw67GPXcd1EYBy?=
 =?us-ascii?Q?grJ5FoEa7ouiTxs1CU6VejtsAWxMuKY4dYzNjAeMM7vzRsVhb3nHeGcsB7pW?=
 =?us-ascii?Q?bpYyDKjU6IeT/iAec3VAcGhJzBVSzGnokE8SNClOBZhNF+qIvzmTFXqp2pj4?=
 =?us-ascii?Q?CEMmO8O+6K0zOtvkMeIwcPfLzEcYY42zZ0CBctN4X+BZtszd1fCcwyvskhnD?=
 =?us-ascii?Q?sZOSXvrt8pCZkdauQwx73Phm8soBb/RzhXsFBAvrK3FDgVAi3vSqSOUmcAFt?=
 =?us-ascii?Q?csXYGZwmZuVP8KToKa3UgBJg93sNGJ03CwcqbtjZFc0HtNaE/dVFCM4+d0n0?=
 =?us-ascii?Q?kFDo4DOVtILdVOUSlLDB56WrJQuLLMheaAoghg0O2Yb0zcc8uZzh/xq+BLP6?=
 =?us-ascii?Q?KVS9ORJjp2bLDmkYLyW/hSKzTgXTtFv2BP8+ZueKe2ao33LKLYWC4vwRnuAG?=
 =?us-ascii?Q?1Wi9g8TCb52UM0MoLYTpnUdmCClbtnKF75y6hdp3SF8goEBcnqLncy77qKFy?=
 =?us-ascii?Q?e3v0UKylewsjtZk1csYibctUUsseHEZ3GRNiAA9y0UHRursTa317lJ8ODDqO?=
 =?us-ascii?Q?buaMeY07b3CGIBW7Quny/m8fmVvf16tFy6oPAGLW/Ih4Eh0l9/HUm9SvIB7f?=
 =?us-ascii?Q?wpTEl/n8ApoMIM2tfvFX4iPq7pKaJi7w+ZPYodB77rxDLuf42MrTM915+lw7?=
 =?us-ascii?Q?VoD49A+OaJRSSWqmZN6CpkhN1UajJ8dwGpCrfCNgzmIMCe9sjswzChvb95mb?=
 =?us-ascii?Q?VjA+BBSZJIFbCzzv8cBf2tWzXCnA83TdNChVL8wJh0/yvrTOipktUM+plQeO?=
 =?us-ascii?Q?HAOy3pWVhyEFz+/cBMp8XhsWxT1JOBE3YMcfvcATgZs0i5P6hfpB9za+d9rw?=
 =?us-ascii?Q?xS7yhBSKSsiAIqen0o00pvvl/iS8swjqrT6lgyZ0Rh2ar87qJRhRlEvcIlIk?=
 =?us-ascii?Q?mhlAZnh8XVfHswqOMh2W2zQzc6JG+aZlqPyPI1vm8MKj4XBRufIopQdG1MHt?=
 =?us-ascii?Q?QjKCZfqdunqWBTVPtWW4Senls8MUpGQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d8a384-e290-48b7-81f8-08def3ad5b64
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:25:02.7167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZBfoZZgMYehwCLJP7E8LxWJlhJcYESxHgR90sP4v0Lu+9egtM1WtPsHHogh4cP2bKXMYbCSsz5FM9ml1/04x9Wav5pJcTxZwsnp6ODFE1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1219
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 11:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128845

Backport patch to fix CVE-2026-55969.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-55969

Upstream fix:
  https://github.com/apache/thrift/commit/983c813c9a1a2302d9a3ae23d7368bece=
aac2d0a

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
v2->v3:
- removed the bloated adaptation notes.
---
 .../thrift/thrift/CVE-2026-55969.patch        | 307 ++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |   1 +
 2 files changed, 308 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-559=
69.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch
new file mode 100644
index 0000000000..736984d077
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch
@@ -0,0 +1,307 @@
+From 09f72e9ba64c551602f69abb6ea161b7020948be Mon Sep 17 00:00:00 2001
+From: dxbjavid <dxbjavid@gmail.com>
+Date: Tue, 9 Jun 2026 16:35:58 +0530
+Subject: [PATCH] Widen multiplication operands in container size prechecks=
 to
+ prevent arithmetic overflow on LLP64 platforms Client: cpp,c_glib Patch:
+ Javid Khan
+
+This closes #3590
+
+Backport notes: applied only the container-size widening (gint64/int64_t
+casts on the multiplication operands) onto thrift 0.22.0. Dropped the
+unrelated string_limit/container_limit changes from thrift_binary_protocol=
.c,
+which depend on infrastructure not present in 0.22.0.
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-55969
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/983c813=
c9a1a2302d9a3ae23d7368beceaac2d0a]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ .../c_glib/protocol/thrift_binary_protocol.c  | 10 ++--
+ .../c_glib/protocol/thrift_compact_protocol.c | 10 ++--
+ .../c_glib/transport/thrift_transport.c       |  2 +-
+ .../c_glib/transport/thrift_transport.h       |  2 +-
+ lib/cpp/src/thrift/protocol/TBinaryProtocol.h |  6 +--
+ .../src/thrift/protocol/TCompactProtocol.h    |  6 +--
+ lib/cpp/src/thrift/protocol/TJSONProtocol.h   |  6 +--
+ lib/cpp/src/thrift/protocol/TProtocol.h       |  6 +--
+ lib/cpp/src/thrift/transport/TTransport.h     |  3 +-
+ lib/cpp/test/ThrifttReadCheckTests.cpp        | 48 +++++++++++++++++++
+ 10 files changed, 74 insertions(+), 25 deletions(-)
+
+diff --git a/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.=
c b/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c
+index 9e80e107c..c3b00b028 100644
+--- a/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c
++++ b/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c
+@@ -561,9 +561,9 @@ thrift_binary_protocol_read_map_begin (ThriftProtocol =
*protocol,
+     return -1;
+   }
+=20
+-  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport),=20
+-                                    sizei * thrift_binary_protocol_get_mi=
n_serialized_size(protocol, k, error) +=20
+-                                    sizei * thrift_binary_protocol_get_mi=
n_serialized_size(protocol, v, error),
++  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport),
++                                    (gint64) sizei * thrift_binary_protoc=
ol_get_min_serialized_size(protocol, k, error) +
++                                    (gint64) sizei * thrift_binary_protoc=
ol_get_min_serialized_size(protocol, v, error),
+                                     error))
+   {
+     return -1;
+@@ -618,8 +618,8 @@ thrift_binary_protocol_read_list_begin (ThriftProtocol=
 *protocol,
+     return -1;
+   }
+=20
+-  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport),=20
+-                                    (sizei * thrift_binary_protocol_get_m=
in_serialized_size(protocol, e, error)),
++  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport),
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
index 0128de8519..3717302086 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "https://downloads.apache.org/${BPN}/${PV}/${=
BP}.tar.gz \
            file://CVE-2026-58023.patch \
            file://CVE-2026-48144.patch \
            file://CVE-2026-58389.patch \
+           file://CVE-2026-55969.patch \
            "
 SRC_URI[sha256sum] =3D "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59=
dc64a00df8a1e5"
=20

