Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A621C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:12:28 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11582.1784131797271284074
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=A23ZfZDi;
 spf=pass (domain: est.tech, ip: 52.101.84.71, mailfrom: yunseong.kim@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txubh9vSmIOTvPDJJAiART6kLBsjTOT1HF7ap8igL7+jh73r6+sMUFDHdZk76CkIHTy0F7rOhkOBXTD7S/Qc8C2fZNnG5MJRJGWX4pcBvEGBhS8Ue5kWvp+d7llkMNck8FHSunCLnmiMw3iE1gExPi6z+aXxS7Tf9u9/4/MR11uaa9RQjwn3EJ4KSEvEnRjZyUbMCDClWIHuXMzmJEUnadXi+URpf/3baHZB0Ja/LPRcE04lGkskBhvFBeLRA9tN9kJW/qRhPlkHNJvcHaeAwK7M8Lbh6rvyQdq8h6LEZ6qEQx4Wbsw8rakRWL6x8ynFmIBIISSxyd+7rBmknBaMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/0AxxQsMYzCNrkHyfDGAz6gSWGd34bNKYr/a6i0lwA=;
 b=ZgDJ5SV9rpvEFwrNoyUKkjARSf1UjsFlmXNf3aZ/2F36HuBE23dXBTYgJqUJnPtKo1INsyJQnFv18YjPIplLlSG+dOY0C8F4roQ9ygBtogQpmMyDKZd2+roP1DdInWiIWrRiLPI0scVOrjo/5vyjF6GT8uFXEeS7tCoKKh998jKr8qXhK8cK+1p4zAuQl0Msn7tz9Rm/xvDYL7Zj3Qm4BDQlzg7j6VLZkiAHSupCf/HbqaxiQwAODBsBIGxBpSXWJLxQW4C8vd9LghkQi1afa/A+3qpI3Zh7obAzNEbY+LhhiPOZ2vlqlPLL/OmR3d+PHXT9hLW0zvz+0G6Co0gRug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/0AxxQsMYzCNrkHyfDGAz6gSWGd34bNKYr/a6i0lwA=;
 b=A23ZfZDifRRzG3jN/26R0dnUJbbCVE8gEAqvTtOmGrboDEopglAUNnS/QmEMIgHiJr1uX+s09lgKI6cH54HmYSKmp85c0f+CHTBJXKp87mLCHrXTGBpDrk3SA2ToR+2MQ0cX9mcPAlVHDGt3cxH9H4BxzMX7Nzo/044QhLmclS9wlAQBuq0Pyfz9AAosyUTDIiVu1b3qqdIvPoJFj5OUEfpeA6ih41agDchOjofNFyUt8cYov+CVwxIpzcW3gWKnxGxfWwDdmunJJZbf2fduBIdSH7StILkLWX/O+1bShN9aI1u3UL5h5ZYAvd1jfbRoW2GDFVs+q8Q3sERVxRBhHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by VI0P189MB3517.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 05:23:56 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 05:23:56 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
	yi.zhao@windriver.com,
	wangmy@fujitsu.com,
	Martin.Jansa@gmail.com,
	Yunseong Kim <yunseong.kim@est.tech>
Subject: [meta-oe][scarthgap][PATCH] libyang: Fix CVE-2026-41401 and CVE-2026-44673
Date: Wed, 15 Jul 2026 07:20:56 +0200
Message-ID: <20260715052055.2318825-2-yunseong.kim@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: GVYP280CA0007.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::27) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|VI0P189MB3517:EE_
X-MS-Office365-Filtering-Correlation-Id: 22132cac-0ed5-4d79-6ede-08dee2314487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|18002099003|56012099006|6133799003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Xf+1dfer22X5xXdZzIsSRyGee1GaVJ/0G+FabYtf0vKdQ68IiSpyKXtH0bP8zICGNFPojizv0E4gM8aR2Eh7sBRLD7EZOfvAVKt3SSwG28jSH7wD83YG+QQkSLesSdofz0Mcwxuyuw57gFeqxxmwsRkMttvH5qgcOlbG5nvyDvOsa8rdoW2ft9xr44uOhUUAFDFJxag4yj3BaN1h0LQxe5CEmB/on0oViExvFNJfbQAV9xFFV8UhQrpBKPKKC+VZ1u7+1gMSOowunIcvSw8UaEE0yPOMhWkJnrXIKVQEJnO/AWFdAmM4q12AQh7RabIQz7E8y3wFIjyMpzelHd78jL514CUMAEkOzC/no4bxnAH6h1gb8Z0p5Hzt63DZawtfAeodG/WPDCLTHM6wy3zMYOx/9kDkYlWyY8+oG/zEse7jWW6y/cEyyYyMTI9/Y9zfULkU2dfHMRoGsxtc9MES66zoeJxKu/hCCvyZ7drbqOB0e9Ec5/KoyE/kfxcncmciHVkeIRsfpmV0SEzkkp8r+p+z9wM/D+Mvm0lgSP/h7/HApjpJCBxF8GzxkDWiqCUP5D7J2tT9zaeQnbf6Nd6CJbHqrgw4m5zYjw+TM6Uec4rT3h+oGMxBakhxgW7hRjMsWGnSdGWZ29iGAEZl1199L8XypzQdrvjNdl/NkAc29U0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(18002099003)(56012099006)(6133799003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?k5nBVc1xwx76boVtWJ4d6DkPGFahqMWulbs3FyVW5eQ6iQyjk7tTpEY6y67Q?=
 =?us-ascii?Q?TfFBOOUBwCo3EU85Q9/ceetKWGIajmjGBI9OdQXPUkG9ehalPpkEUGJZL/yD?=
 =?us-ascii?Q?QyyRFw+fLEVtS+I951wxUrkaxacd6O3np2gI7np4CwqJvw08eGitEqzd0pEE?=
 =?us-ascii?Q?ADy0jie4uv4I3iEeN2XXugBV/sgxJ2VHV7A/mzWlECFo9+VvtlkGey28Yro7?=
 =?us-ascii?Q?aR8RPCEaS1C77jpwvi2voNuf7ravb4NjSO71x+I+iMlQserr270VVPygcjVx?=
 =?us-ascii?Q?n/l6O3OMCLF+2l+OMXifsHhW+QRl5n0+9rwDg8Y9v3+2+Eq6BVJF8+W5t4vc?=
 =?us-ascii?Q?LKejZ3YJdiEB70wr5GEA44vShoDaI0MBuT39l/qQfime6ulmUobK+6UXVt9L?=
 =?us-ascii?Q?Ao0aejKKHEiPAlXxKDWzUgj7YYZ3SPiB8HyDmcJcSDlcXkJyhuw+wehWRjKX?=
 =?us-ascii?Q?r3Os6zATZ3vHhefTeFJ5Hl4QJL4lYqI4V3EP/+GZfb3/CBWqHDJd/leRdXC/?=
 =?us-ascii?Q?PFkncd0SxOaENk8VZrLDG7CulbN6gbxZ/JwuicKQ/TLSkUNZ5UK1VrKtp1G8?=
 =?us-ascii?Q?9RkRs7nZ3RcL6uEtFlctDSH8+9xkd39SOJqFk2iEFECGA28JNSqg9qGJ/CQ9?=
 =?us-ascii?Q?m+dmXcMdEP1nRV+N6ng/fLOguefPZBS6YvGqbJ13lrlDl5AG6wIyLCme/VC1?=
 =?us-ascii?Q?77YPzZ6jykRR4NuU9Dk4UqXjta6of5uG+Mh3JvoE1RXQHPIx0BnNX3CBDWKv?=
 =?us-ascii?Q?dPtThpQ0O8Oiqu0qG2O94AGQdWP4xZaimOpga3rq0XAYYV4cQoNmlKedqxGO?=
 =?us-ascii?Q?+blPevKJwD8nzrmGLjFlYAaxTYUskznmPSxluytr/SWdBrlqEujTW6pUmdzy?=
 =?us-ascii?Q?9C+F63kDw/pHYy8W3kO7kAc1hwhRC1tMJjhn53+VyDBU82ivQmNyHmNW7oXP?=
 =?us-ascii?Q?q/5rzcQoqU7Rd8ii8XYq0R6yiCZjHJjNWpsWER5x1qmrkE/reOKS56b7fe2l?=
 =?us-ascii?Q?3iaimOBZmCClpygJmhlRFh5FAYXn2Lf52VacpNNmD3DTkUmr92PLi3wbIYyE?=
 =?us-ascii?Q?FGyJT03gcTmV2e5tl4boHQomwYp6WstCVHx3NvLUXAo5XoCwXYaiiIdpdZy0?=
 =?us-ascii?Q?AwX00ny32W3n2G10ah7pXfU2gw9JQjXlx/GdIbMjHY1mxHo1M0lFFLJ+rTbV?=
 =?us-ascii?Q?3YRUYScf7mb3WaGdhZpm7zxdlJ//6xldljxGXeGB+4auPv0mq3ICghIFt9s6?=
 =?us-ascii?Q?ALfhiq51JRYyz60R/GZXNR9sbkL2t9NbzLaHmOS4wwB2BfqrQP4geIE4pXL7?=
 =?us-ascii?Q?IMLuNn8jWmDcx6soEjP/GaoyOfI1Z9ZZZk8Q5ySN4xvXYGcMnD+cXlshrp8M?=
 =?us-ascii?Q?wN0ieR2EjOKPsgXCHK8NulQ+Vb506+c4rUW7Ks8rxjI11Kolzv0yi5/EP6I0?=
 =?us-ascii?Q?xu7DXkMs0HsmD939YLCia+ENtadzJ+NSR6oHZHTYPqTpcFY7UGXEBYDcn7xE?=
 =?us-ascii?Q?u6/CHXyhNIpCUALaP0vckWaRDa/lGyan2oN+PQkjwqESt6M6PMmhfhhLZ37c?=
 =?us-ascii?Q?EQFdOetuKJyxksk00LKVo5jDdKi5IyBLXsGV9RE+RLb/afHRXV/kZfgggZK5?=
 =?us-ascii?Q?LbFpEM/M4Wznv4misTAr/Gsm563hVscGoAMU6WRLs8akLk1oH+kQVdWPIzFf?=
 =?us-ascii?Q?2ih+And8HBYWhjGezzVWdC4sfF+EzC6/A3Zq8s1pR8FHHRzJB6cwIHe7j3dh?=
 =?us-ascii?Q?L6rBtW17QRBLIlAynEl+yBBHEVoHusm/coKKFzZr3tOOScgL8EOPy9vM0HQx?=
X-MS-Exchange-AntiSpam-MessageData-1: BEGbF34PfqWchg==
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 22132cac-0ed5-4d79-6ede-08dee2314487
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 05:23:56.5703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yv9gcXcr6CILFMY/caBKe1eBY7zdYkk6WN3HFPUzbUUioANpyKVZRAXH81653KBVkcS9p+/bA+j6NAMN03Zepw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3517
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 16:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128222

CVE-2026-41401:

  Fix incorrect metadata list pointer update in lyd_parse_set_data_flags()
  when freeing the head metadata entry. Without this fix, crafted YANG XML
  documents with specific metadata ordering can trigger invalid pointer
  states in the metadata linked list.

CVE-2026-44673:

  Fix integer overflow and OOM in the LYB binary parser. lyb_read_string()
  wraps len + 1 to 0 when len =3D=3D UINT64_MAX, and lyb_read_term_value()
  truncates uint64_t to uint32_t causing undersized allocation. Both paths
  are reachable via malformed LYB input with crafted length fields.

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---

CVE-2026-44673 patch follows the upstream fix style using LOGERR()/LY_EINVA=
L
with a descriptive error message, since this is an input validation error
rather than an out-of-memory condition. An additional len >=3D SIZE_MAX gua=
rd
is added for 32-bit platform safety, as v2.1.148 uses uint64_t len whereas
upstream uses uint32_t str_len.

I tested this patch set with libyang ptest and found no regression failures=
.

 .../libyang/libyang/CVE-2026-41401.patch      | 49 ++++++++++++++
 .../libyang/libyang/CVE-2026-44673.patch      | 66 +++++++++++++++++++
 .../libyang/libyang_2.1.148.bb                |  2 +
 3 files changed, 117 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401=
.patch
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-44673=
.patch

diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch =
b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
new file mode 100644
index 0000000000..9c0044e623
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
@@ -0,0 +1,49 @@
+From 54c3276d871023da266d4ed3ceaee7e8d71d0b04 Mon Sep 17 00:00:00 2001
+From: Michal Vasko <mvasko@cesnet.cz>
+Date: Thu, 26 Mar 2026 08:33:44 +0100
+Subject: [PATCH] parser common BUGFIX invalid metadata removal
+
+Fix incorrect metadata list pointer update in lyd_parse_set_data_flags()
+when freeing the head metadata entry via a separate meta pointer. The
+condition must verify that meta2 is actually the head of *meta before
+updating the list head pointer, and must use meta2->next (which is
+saved before the free) rather than (*meta)->next.
+
+Without this fix, crafted YANG XML documents with specific metadata
+ordering (e.g., operation + default metadata) can trigger invalid
+pointer states in the metadata linked list.
+
+CVE: CVE-2026-41401
+Upstream-Status: Backport [https://github.com/CESNET/libyang/commit/54c327=
6d871023da266d4ed3ceaee7e8d71d0b04]
+
+Backport Changes:
+- Adapted for v2.1.148 where the function is named
+  lyd_parse_set_data_flags (renamed to lyd_parser_set_data_flags in
+  newer versions).
+- The fix logic is identical: change the else-if condition to also
+  check (meta2 =3D=3D *meta) and use meta2->next instead of (*meta)->next.
+
+(cherry picked from commit 54c3276d871023da266d4ed3ceaee7e8d71d0b04)
+Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
+---
+ src/parser_common.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/parser_common.c b/src/parser_common.c
+index 32152759e..f8a3b1c01 100644
+--- a/src/parser_common.c
++++ b/src/parser_common.c
+@@ -394,8 +394,8 @@ lyd_parse_set_data_flags(struct lyd_node *node, struct=
 lyd_meta **meta, struct l
+             /* delete the metadata */
+             if (prev_meta) {
+                 prev_meta->next =3D meta2->next;
+-            } else if (meta !=3D &node->meta) {
+-                *meta =3D (*meta)->next;
++            } else if ((meta !=3D &node->meta) && (meta2 =3D=3D *meta)) {
++                *meta =3D meta2->next;
+             }
+             lyd_free_meta_single(meta2);
+=20
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2026-44673.patch =
b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-44673.patch
new file mode 100644
index 0000000000..dcbf204f17
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-44673.patch
@@ -0,0 +1,66 @@
+From 48672b289e2e4c6773712c3ee0abae6b7fffe1f3 Mon Sep 17 00:00:00 2001
+From: dominik blain <dominik@qreativelab.io>
+Date: Wed, 6 May 2026 03:03:14 -0400
+Subject: [PATCH] parser lyb BUGFIX integer overflow and OOM (#2513)
+
+lyb_read_string: when len =3D=3D UINT64_MAX, (len + 1) wraps to 0,
+malloc(0) returns non-NULL, and the subsequent write to (*str)[len]
+causes a WRITE SEGV (memory corruption).
+
+lyb_read_term_value: when term_value_len is large, truncation from
+uint64_t to uint32_t allocated_size causes undersized allocation
+followed by out-of-bounds write.
+
+Both paths are reachable by supplying a malformed LYB input with
+crafted length fields.
+
+Reported-by: Dominik Blain <dominik@qreativelab.io>, Cobalt AI
+
+CVE: CVE-2026-44673
+Upstream-Status: Backport [https://github.com/CESNET/libyang/commit/48672b=
289e2e4c6773712c3ee0abae6b7fffe1f3]
+
+Backport Changes:
+- Adapted for v2.1.148 code structure where lyb_read_string uses
+  uint64_t len (not uint32_t str_len) and lyb_read_term_value uses
+  uint32_t allocated_size with uint64_t term_value_len (not
+  lyb_read_value with val_size_bits).
+- Added overflow check for len in lyb_read_string to prevent wrap to 0.
+- Added overflow check for term_value_len in lyb_read_term_value to
+  prevent uint32_t truncation in allocated_size.
+
+(cherry picked from commit 48672b289e2e4c6773712c3ee0abae6b7fffe1f3)
+Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
+---
+ src/parser_lyb.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/parser_lyb.c b/src/parser_lyb.c
+index 788be9499..c1cbfc805 100644
+--- a/src/parser_lyb.c
++++ b/src/parser_lyb.c
+@@ -217,6 +217,12 @@ lyb_read_string(char **str, uint8_t len_size, struct =
lylyb_ctx *lybctx)
+=20
+     lyb_read_number(&len, sizeof len, len_size, lybctx);
+=20
++    /* len + 1 wraps to 0 when len =3D=3D UINT64_MAX, causing malloc(0) f=
ollowed by an out-of-bounds write */
++    LY_CHECK_ERR_RET(len =3D=3D UINT64_MAX,
++            LOGERR(lybctx->ctx, LY_EINVAL, "LYB string length overflow.")=
, LY_EINVAL);
++    LY_CHECK_ERR_RET(len >=3D SIZE_MAX,
++            LOGERR(lybctx->ctx, LY_EINVAL, "LYB string length overflow.")=
, LY_EINVAL);
++
+     *str =3D malloc((len + 1) * sizeof **str);
+     LY_CHECK_ERR_RET(!*str, LOGMEM(lybctx->ctx), LY_EMEM);
+=20
+@@ -281,6 +287,10 @@ lyb_read_term_value(const struct lysc_node_leaf *term=
, uint8_t **term_value, uin
+         *term_value_len =3D lyb_data_len;
+     }
+=20
++    /* Prevent uint32_t truncation: if term_value_len exceeds UINT32_MAX =
- 1, allocated_size overflows */
++    LY_CHECK_ERR_RET(*term_value_len >=3D UINT32_MAX,
++            LOGERR(lybctx->ctx, LY_EINVAL, "LYB value size overflow."), L=
Y_EINVAL);
++
+     /* Allocate memory. */
+     allocated_size =3D *term_value_len + 1;
+     *term_value =3D malloc(allocated_size * sizeof **term_value);
+--=20
+2.43.0
diff --git a/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb b/meta-oe/=
recipes-extended/libyang/libyang_2.1.148.bb
index 0eff3247c6..fa96ddf92a 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
@@ -10,6 +10,8 @@ SRCREV =3D "fc4dbd923e044006c93df020590a1e5a8656c09e"
=20
 SRC_URI =3D "git://github.com/CESNET/libyang.git;branch=3Dmaster;protocol=
=3Dhttps \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
+           file://CVE-2026-41401.patch \
+           file://CVE-2026-44673.patch \
            file://run-ptest \
            "
=20
--=20
2.43.0


