Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0AAC56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:37:55 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16747.1786014256228019652
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Fy7t7VjD;
 spf=pass (domain: est.tech, ip: 52.101.72.28, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cd2yVU6o0ZiZw9ieGwrfs/ZRw53uvYaKA0I/TET8KR4eO8vg1un5h3D22BxCW4VxilFQp8eNTwfxE4gEkWiNw1AMVmchLccbkAhoGs/tOU49NZgC+9G97eX+nX3Un0tr/KLUEyhgi3eoaG9f/zrkDkQRG7baDXykV+5u81WyeeQU+DmsSbUn/6yBfA5Cf1eELhiaUJlXc94TZNrpo1ghWo/X9AdblfGZeiALdgfgIeuPiebpkvz84+bNZSlgptlgoFUpKrEwJHHDxtrP4nsTcb0kYnmQSUyYvPX+SsPnineBAb63cxaxGtA6/LzfQRg7XPtnrJvqFLCw2EZiSX8kCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lq9QxkMX/POnGFWGm58i8Wbe1KUKf3+Yquj2AAjGPI=;
 b=QNvU78Ctt/XGniR28cwldF/FI6ZP7frCFypgaOk4GAWFNwcGMIvtUWEx55nHwHPSoRVEa/8haaREB9XGeJBBiwsaiv0qTFBIN30MduZrl/4S0i98DlBAcnWqiJ+s6VL11BCbuAa4ZoE7fJMcTVLb8YxB1fif6b1dZsUuKuzw0YFowy2/dA6soXl1SW/uMqCVl/67nBl8xhMhMM8uKj3ROvjkb89Jmxdm0ZChlU+OpwczefPwjPBjr7m1ch81RzxCXenNa8EhiIw909HSe3HokgvDPStthad/yNCGLp28vmOHYI0SInAfVbwhNO9jlJ46PP2N1OxvnkImdTquwJ7LoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lq9QxkMX/POnGFWGm58i8Wbe1KUKf3+Yquj2AAjGPI=;
 b=Fy7t7VjDq/TMgC7lXtNEA/7VC29i/Lvwn4WLEyP4eHugSuy34yB1UyRgidD0rWG9eXl6v5iTlYOqNTd4/nfQSi6NyV+pQfgbuShi+wuM/9jPZqQZij2KMuMp8d2iYtvrQ9ur4guXAmAOdRQnDOnx5eeO1GIb70ZAjqTIGPm25O6v2OxmUZtVdEkIQpDYEwvX+ad3/ax6Z+dLCeUHIE9Znt/ZyYgnb3FRt3JiO9sg3eGmWFMdomWARl0MySm7LvHIxlcbDQMBZJUSIzknSAN1bUstodagascZGU3/B5fVVfj1kM42OaBKtunRJSu9Aci5ArzRYE9brokrPfcLWbamUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB3P189MB2378.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:437::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.6; Thu, 6 Aug 2026
 11:04:10 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0315.006; Thu, 6 Aug 2026
 11:04:10 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: elin-upstream@mailman.lmera.ericsson.se,
	openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] thrift: fix CVE-2026-55969
Date: Thu,  6 Aug 2026 13:04:03 +0200
Message-ID: <20260806110406.1153318-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::6) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB3P189MB2378:EE_
X-MS-Office365-Filtering-Correlation-Id: 861e789b-6f8c-4885-c411-08def3aa712a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|12006099003|18002099003|20052099010|11063799006|56012099006|3023799007|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	ZCo2R/hrRPtkF+Zxo9a9ski66Ico+tmkXSKsfScojmk4LiyzJ2rsO4cr6rAMotjezK2dpxUAKGbj+2yz1UxTRqAn/Fw+YORAnZRbSapzCsaD/QSXSZKOEHN3NsBILZyyxTI7NBylcFib4LByEuefndlSORWA7rxiecF7gaH7/afVoPc8TVyEu0Jv/56C6ucBoWl+8u/M89S+/25g4d+zdjdv9cavDO9dv8oW+hfoQfp59r+P9CUx06jSfakQXJm8B1TPSbObhHpER0svljVFYm7IN6h18jzD2QpLw91ycmn8Z9EJQ8f3AGClmnyuRPoaXqV+8yeHDP/dsf33g+27WRqoYrOqDRAGuzu2qjG0/Dkau+jIBJGmSMDN0MzeYa0eTAbItE26LQOtWQo4dabN1wb2Vpf9lhJGqS0eJY1QTVxZDPn0SISWZU9hmahdzcaX46Bro6kYr/41+r/1UYe3iQmfzx/UobjX30G8b4XSotQjk6SFN38TjO4xB8koxP6E2g5b62+VE67zUwc2o5iIksgKei+bF1w/Z9AhCkPXY7UBL3gbv0eUfWZAzDg5BTYYB213g9/Cv5iNkP2AD9SdTS9czBYt7d25FZyCp5EfJh4EZOBt8nLzCB3ptXqoW28q562qWOhnSfwyxbi94lbnKXbomykJznKcGtK8vmwFBiM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(12006099003)(18002099003)(20052099010)(11063799006)(56012099006)(3023799007)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EtS2JHx9/RvxbUz8H1+TIrposm90vO+xAVEF1SSDHHAzsO+vE3GG0oigZLEe?=
 =?us-ascii?Q?n2v7PPXJx8bDtRk5m73A3FAxVyETWFk6zZzAOzq/KO+UoeRw0v6/HgA9mcoT?=
 =?us-ascii?Q?ROjw+p7crtnzZUICLQhdHJ3D4Wbjbz+N4Na2CnprTfNZfQP4uBfRsysl2cc5?=
 =?us-ascii?Q?wG38JyeAcBXw5m8nWtBz8byzjSoU8nv08D4CAXtM/LE19Wl3DAzI1B3WdSG/?=
 =?us-ascii?Q?n1zEWzYMW+EIQ67pHlZu3+/0lzsyGvtaWe/vEpG6q9CGZI1QlEGSOKpkR70T?=
 =?us-ascii?Q?3TBDsrhpF/a6Vb7vE9FODbcUyjUnyYrEQc/fDaGf0gxH1TYg8wLjRl8iq3QV?=
 =?us-ascii?Q?PYsjLEqAGZVqVsKyLgX8V/RoM8KBxtag7lFQtxlizof474ULA+OCr3x4FyZ3?=
 =?us-ascii?Q?JQSbVEmamidZgD4tXCslsc7Vk+uKkD/Pt2DeHZV4Ebsm+yAf3jZnJkEPR3zF?=
 =?us-ascii?Q?M+G6tdhaH7RcID6s6M4VpQE4G2/Y/KbUJ0xFGfUuxf4jeEKed7CZv89bZJQ8?=
 =?us-ascii?Q?u8V8v8J4rSlFNYGibStWPBXLw2MXR1k69gNY4pe0ZIrrBvHSfaBIlggvipty?=
 =?us-ascii?Q?pE87jPi7w5PI4esI6kAonclQNButW+fw4CSCFn+nDSgea8lWyWmmal4xQ/sv?=
 =?us-ascii?Q?vSF9h93jP6lC6dbkNolGIjOgQy2bKT6sWdGv3wbeBWWI7p8tAGTSdetciDgs?=
 =?us-ascii?Q?oRMdeJYMwuZ8/iVF7x6LT7+4m5k+yaN/FkfTdtV/c6BBwgYqduYjIHwo5g7O?=
 =?us-ascii?Q?5undFIVCw1jL3tIoQMHhk31way/4JjgXPrYOqN9yw9r0B8dOikuu9L6WiCGU?=
 =?us-ascii?Q?IYWqmMPmoUSwfwwYZ503oOIa/xVBgg5EcskEhMzDdKinrJ/fwj1MK0jEafAf?=
 =?us-ascii?Q?RZbhqPimsVPLiA5SyqD5Rq+AOIIbS8/e3DEHL4gozhz/KKnNcKAqvCAYK9sX?=
 =?us-ascii?Q?t5Py3HqKGvNAZ+W7emrMZD/TIg0Lf1EG2/7ZZo055iJzd1EZgbTnE5Zr3RHE?=
 =?us-ascii?Q?Ur6aH/q9+5VHzAWYUN9pT6cf5BFsTFxaC/rwguw77a49dg2hdETrLm6hIrJw?=
 =?us-ascii?Q?vLbCPzgG3995BEQh84JmO8LvrB+kznGA/YJfMoYNIBnxliGflXJzykIPfvXa?=
 =?us-ascii?Q?1ayjL2FSiUHpwvqW+lV9Q9wqCGKYfY2kapxKrgk1IyxSI60e/12OrdZzvmSj?=
 =?us-ascii?Q?dowph6AFVJ1fQZSQ2jxwXRbflTFAg/Ust/DixMDfXH/wOCMJDoeK7O5R5MGN?=
 =?us-ascii?Q?0i9+VlVPyhfOSDWRD2Y7V6mpXnTEAEgP3d2DOKfuKbDV2FGXasXrNy4Xq9Qd?=
 =?us-ascii?Q?OIIFsv0V05Um01tiBThc4EnFT9VW8fITfAURbCo+cDWpr60UDhedtL3d1LEO?=
 =?us-ascii?Q?cDKuOVQAV+HOL23YcnvkmVgXvVveVezDFcPV/l7+1LB6/wwVRNr1GBYjVyvo?=
 =?us-ascii?Q?RVsmCqLy9WTn08Fbb8driOd12zl5CQLJfePRbKdExy31hdP8KY4cNTg/RtUc?=
 =?us-ascii?Q?GBM8ypyNKltpzuyvknYiiIIlSOFdc12qJuZj5ryW6i0O9WBe3kvWeCse8syA?=
 =?us-ascii?Q?YENlbP8yTQF2oYMnx+GDME1K0pg6kvvbaRQFAF8PUSoDyOzxw1WUaJTY4WSO?=
 =?us-ascii?Q?kFuyuCUB7PVIjGNkmsGnSAxt6WfCHVbBLlUP6aVTvAYROL+qNxXcc6q96M3j?=
 =?us-ascii?Q?aJMHITFpagr4vDiVFjQ+uExTI0WBOviUA0vm878k6NJ18J+47oP4ooqT/0yD?=
 =?us-ascii?Q?zO5Y8pXfYr3ZUlIpUflXb+xYDpjFotA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 861e789b-6f8c-4885-c411-08def3aa712a
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:04:10.3833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21HFQLmXizwA/EkPjsNvjPCWgJmwIqcaE/4DOMBQmnfgK6JHIFUbgHe6Rd1whBO+LMkhFjXpHUNWyR4TrDVsRyvD2EwP6FtQXgx5/yorxKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P189MB2378
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 11:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128847

Backport patch to fix CVE-2026-55969.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-55969

Upstream fix:
  https://github.com/apache/thrift/commit/983c813c9a1a2302d9a3ae23d7368bece=
aac2d0a

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
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
+Changes from upstream commit 983c813c9a1a:
+  - lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c: adapte=
d from upstream
+  - lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c: adapt=
ed from upstream
+  - lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c: adapted fro=
m upstream
+  - lib/cpp/src/thrift/protocol/TProtocol.h: adapted from upstream
+  - lib/cpp/src/thrift/transport/TTransport.h: adapted from upstream
+  - lib/cpp/test/ThrifttReadCheckTests.cpp: adapted from upstream
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

