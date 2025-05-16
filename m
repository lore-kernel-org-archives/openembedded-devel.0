Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC387C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 11:45:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web11.10928.1747395896060635735
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 04:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=cY2Oi56L;
 spf=pass (domain: axis.com, ip: 40.107.22.84, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUxhip5GZeV6aF5qCjNldA8TsKB561gKtn0VL+NAeHXg3D+jiKCb4Kf1/8mTasNhov5P9xjnf5G7rLv/7lRjtn8XY9amkVizIc1dstD5BAfPTX3UIKmWqW5xdd4vKk16WOhDaBLsFzqsa921QxhsBv8T/jto2EB46KfTEehglJOJXcwTJiMnoRNjQC++mEdJJpRKzmSDkX3qk5A9VQ+30J3UrWzs0zSZqgL+ozbRacduGtuA1G/NJFgPgx5wax8NwOQOOUxEPrHI2rjJSxTt601f/Uu5YsjFZ/Uzmu9zIXGumZdjxdCiB9F9CVNK4dQk5Zd6OcyS1sVS5jbj3xMOMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5EM/28mkP9SxYR2E8a7lYMnyihgPmtMgxBWXbAwWdA=;
 b=Q/i8W9pjR02xZAeEKzjoDLXkXbgcwduMsKpvo+mRF1Y9vrt2LInHUbdNRheP3bA4/1u879DM/EvWwA1a0d19qZ2VRB0L3mo7LGLAFrXtIwVKeNbW0/AE4qbe4KfRMPSxZzoFQUUSgmFpxxgamOETeQWQIjIHp69PecbMYyBOzCqa8PgJWWCTWM7GQq+PdPX7BcPUZzWwpH2srLzYpfFudMEMzghFhZpK5SnKoU571+0y4y0YZASyxMrQfd67PqfM+rvmRxvMNupDiymZFiKT8AcmBlilGiGRqWJeCEq4Uy5393nbcSwpZPNcTMp16SaL6Ua/a2ViavhgTpthDRud1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5EM/28mkP9SxYR2E8a7lYMnyihgPmtMgxBWXbAwWdA=;
 b=cY2Oi56Lhr79gfOoHIjulsCwZePlEQcxq5AKoCw9O2iNZqXwejqNkFvTwW3kBdEeA2Pe/bQxRcqEofswIp0kbbumvTpx8XPPnykMwSoLu5asNonKiUohg9taNWgcpN6GPNIRiiywb/IkFY+nt6Yb4v9kRSThicXmA8/4oIbwz5Y=
Received: from DU2P250CA0004.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::9) by
 DBBPR02MB10769.eurprd02.prod.outlook.com (2603:10a6:10:539::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Fri, 16 May
 2025 11:44:47 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::f3) by DU2P250CA0004.outlook.office365.com
 (2603:10a6:10:231::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Fri,
 16 May 2025 11:44:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 16 May 2025 11:44:45 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 16 May
 2025 13:44:45 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 16 May 2025 13:44:45 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 361602061
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 13:44:45 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 313431204B4; Fri, 16 May 2025 13:44:45 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libsoup-2.4: Add recipe
Date: Fri, 16 May 2025 13:44:35 +0200
Message-ID: <20250516114435.1936780-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61B:EE_|DBBPR02MB10769:EE_
X-MS-Office365-Filtering-Correlation-Id: f3148551-44af-4ccf-ca65-08dd946f0e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AUijTYxr2BjF9Rr2jXBZPE8ASAKIx4ldIiOW6QaGdT2GU0sv4ZZnHhkWexcp?=
 =?us-ascii?Q?A6mnX+qG/QQnves+l7XAS75fRNV7ctIF9qdwq+IaNAzSsGKJ0Wq5XGoGPKWg?=
 =?us-ascii?Q?tT5ztEYGazegRx+NGNiuoMja7FeCd/pUi2FUFrW8HAFb7exmjrnIQNdJe1ac?=
 =?us-ascii?Q?/Vsd1o7CSiijOFDZVr/VT60WwHRLaXSyxKPf29Jr+It796TCGgObdmt6T2im?=
 =?us-ascii?Q?NyAZ+RayedXmTau7XzLEMnDhsBMAa2/0+Jcqv0glqWD//aiaykRUR7pZZzGz?=
 =?us-ascii?Q?hDyKbzA0kFeGZhwqncbHISY13hDEEOMiQaqVk50In9+lJ63heF2OqB02T/F6?=
 =?us-ascii?Q?RhJSCOPLJVxlRPmgB/j7MD2+trBAz2YTg3XUbVM+dlo3+d1jiwGq0914SL/J?=
 =?us-ascii?Q?FoTHUHd/nUi8xt+2Oa44NfvspnvgwDT++nv13xzKB8qIR+DxhlPxCeBSAHoq?=
 =?us-ascii?Q?ZqUa4JTXMnb8trJxKsmLz+pHJjAGv7zfGvCbFEYiwTh4WDJlL1A3tgMBwbb0?=
 =?us-ascii?Q?lQqiIbVygL/DboXwxv5M108ihtQopIscAESgfQXM6HDhiqAIxqNmQrnPTAg3?=
 =?us-ascii?Q?XBAlmXxIH/gxhU6dk7oHtObkfT78mSX72RZnTZmAHuie1Zl7RYje+NkCNxbp?=
 =?us-ascii?Q?IqEpwKiYYmxilPVDeglmBiNyuCEowArFeoN9ngUQdOFLaKfjFU4dO1l3AfqW?=
 =?us-ascii?Q?in/L31sMQUiD3qEX7zYIdJW7wTAg4XbkZev49GY3pVRI5mDhdEaJ5b455aiU?=
 =?us-ascii?Q?h2EC9nkk7CD1AYsr25tyYTrANV34+fuo3mbYHmCkLWqk+Mmzq1wAjkymh9sK?=
 =?us-ascii?Q?T7ejPsBXYSd/SqoAc1NeHVdM1pxAAfJfNXcKXQrxxFEsHGZ/ECGFEBUNkyIj?=
 =?us-ascii?Q?XGWZ0PLrxYBC7xEHpxa+fJQExFfcB2n+0MoMD8nsVhfJ2D/bjW5w57qtx9fo?=
 =?us-ascii?Q?6tD5ZPq7ygQl1PNMGZUCPfGZACyGntnxMNq9v89ziUBVcFMW9M4q8QGaTt7Y?=
 =?us-ascii?Q?0iwSMRJ631AqFUcreNt8hLGjEqWBYa7Y5JG7Vax4J24fHVKJl1SBCYFOZa2a?=
 =?us-ascii?Q?tvpv24huM1GwoQVokA4/y85AVUH2yS5LZiieGEtZUHAs05F3Tnyp0DPNciz6?=
 =?us-ascii?Q?rLt+EvFt13bg0/RsUNShRY4M91yKhMwN6U0W98B+1itR1gsVA1vmgqNZs/NU?=
 =?us-ascii?Q?Bv8MT9NRbOdsyINcWy57AYqSWej9A8w5FO3RbmeZtwYfGHBc3Khy4yjVklBl?=
 =?us-ascii?Q?wI2ZIdaRVDN/jvPM/LyUjbcOphJ6pMUcXqD1dPi2VsTN1svEdDHhmlY5VC89?=
 =?us-ascii?Q?pJzQE2o4FilkbMIFeVPI0yFwm/7M7UMe5FPiQHS1topwmIJYVueLa5N1ui/J?=
 =?us-ascii?Q?0HZyj5xQ66OhZEXbWz5EfYzcu+EfiOATalHn22K7k5tKov5DafmZlFS8PW/b?=
 =?us-ascii?Q?ynJUIAdYyjI73q4gA1rUdeeYyowar9rjSO+ufaS6+KatNQVy2ciuzQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 11:44:45.7953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3148551-44af-4ccf-ca65-08dd946f0e49
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10769
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 11:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117428

The libsoup-2.4 recipe has been removed from OE-Core, but there are
still a number of recipes in meta-openembedded that depend on it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../libsoup-2.4/0001-CVE-2025-32911.patch     |  74 +++++++++
 ...ild-with-libxml2-2.12.0-and-clang-17.patch |  44 ++++++
 ...-Fix-possibly-uninitialized-warnings.patch |  43 ++++++
 ...-http-and-https-aliases-support-test.patch | 145 ++++++++++++++++++
 .../libsoup-2.4/CVE-2024-52532-1.patch        |  37 +++++
 .../libsoup-2.4/CVE-2024-52532-2.patch        |  43 ++++++
 .../libsoup-2.4/CVE-2024-52532-3.patch        |  48 ++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  66 ++++++++
 8 files changed, 500 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-20=
25-32911.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-bu=
ild-with-libxml2-2.12.0-and-clang-17.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-po=
ssibly-uninitialized-warnings.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove=
-http-and-https-aliases-support-test.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52=
532-1.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52=
532-2.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52=
532-3.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb

diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-3291=
1.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.p=
atch
new file mode 100644
index 0000000000..9ef0643837
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
@@ -0,0 +1,74 @@
+From 52c5859b82fe79f2c32d883e048d218e0d7f2182 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 30 Apr 2025 14:59:55 +0800
+Subject: [PATCH] CVE-2025-32911
+
+CVE: CVE-2025-32911
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_=
requests/422/commits]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-message-headers.c | 13 +++++++++----
+ tests/header-parsing-test.c    | 15 +++++++++++++++
+ 2 files changed, 24 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers=
.c
+index 39ad14a..78b2455 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -1454,10 +1454,15 @@ soup_message_headers_get_content_disposition (Soup=
MessageHeaders  *hdrs,
+ 	 */
+ 	if (params && g_hash_table_lookup_extended (*params, "filename",
+ 						    &orig_key, &orig_value)) {
+-		char *filename =3D strrchr (orig_value, '/');
+-
+-		if (filename)
+-			g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);
++                if (orig_value) {
++                        char *filename =3D strrchr (orig_value, '/');
++
++                        if (filename)
++                                g_hash_table_insert (*params, g_strdup (o=
rig_key), g_strdup(filename + 1));
++                } else {
++                        /* filename with no value isn't valid. */
++                        g_hash_table_remove (*params, "filename");
++                }
+ 	}
+ 	return TRUE;
+ }
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index 946f118..752196e 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -1034,6 +1034,7 @@ do_param_list_tests (void)
+ #define RFC5987_TEST_HEADER_FALLBACK "attachment; filename*=3DUnknown''t%=
FF%FF%FFst.txt; filename=3D\"test.txt\""
+ #define RFC5987_TEST_HEADER_NO_TYPE  "filename=3D\"test.txt\""
+ #define RFC5987_TEST_HEADER_NO_TYPE_2  "filename=3D\"test.txt\"; foo=3Dba=
r"
++#define RFC5987_TEST_HEADER_EMPTY_FILENAME ";filename"
+=20
+ static void
+ do_content_disposition_tests (void)
+@@ -1133,6 +1134,20 @@ do_content_disposition_tests (void)
+ 	g_assert_cmpstr (filename, =3D=3D, RFC5987_TEST_FALLBACK_FILENAME);
+         parameter2 =3D g_hash_table_lookup (params, "foo");
+         g_assert_cmpstr (parameter2, =3D=3D, "bar");
++	g_hash_table_destroy (params);
++
++	 /* Empty filename */
++	soup_message_headers_clear (hdrs);
++	soup_message_headers_append (hdrs, "Content-Disposition",
++								 RFC5987_TEST_HEADER_EMPTY_FILENAME);
++	if (!soup_message_headers_get_content_disposition (hdrs,
++													   &disposition,
++													   &params)) {
++			soup_test_assert (FALSE, "empty filename decoding FAILED");
++			return;
++	}
++	g_free (disposition);
++	g_assert_false (g_hash_table_contains (params, "filename"));
+ 	g_hash_table_destroy (params);
+=20
+ 	soup_message_headers_free (hdrs);
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-wit=
h-libxml2-2.12.0-and-clang-17.patch b/meta-oe/recipes-support/libsoup/libso=
up-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
new file mode 100644
index 0000000000..d867e5bc17
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxm=
l2-2.12.0-and-clang-17.patch
@@ -0,0 +1,44 @@
+From ced3c5d8cad0177b297666343f1561799dfefb0d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Nov 2023 18:49:10 -0800
+Subject: [PATCH] Fix build with libxml2-2.12.0 and clang-17
+
+Fixes build errors about missing function prototypes with clang-17
+
+Fixes
+| ../libsoup-2.74.3/libsoup/soup-xmlrpc-old.c:512:8: error: call to undecl=
ared function 'xmlParseMemory'; ISO C99 and later do not support implicit f=
unction declarations
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsoup/-/merge=
_requests/385]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libsoup/soup-xmlrpc-old.c | 1 +
+ libsoup/soup-xmlrpc.c     | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libsoup/soup-xmlrpc-old.c b/libsoup/soup-xmlrpc-old.c
+index c57086b6..527e3b23 100644
+--- a/libsoup/soup-xmlrpc-old.c
++++ b/libsoup/soup-xmlrpc-old.c
+@@ -11,6 +11,7 @@
+=20
+ #include <string.h>
+=20
++#include <libxml/parser.h>
+ #include <libxml/tree.h>
+=20
+ #include "soup-xmlrpc-old.h"
+diff --git a/libsoup/soup-xmlrpc.c b/libsoup/soup-xmlrpc.c
+index 42dcda9c..e991cbf0 100644
+--- a/libsoup/soup-xmlrpc.c
++++ b/libsoup/soup-xmlrpc.c
+@@ -17,6 +17,7 @@
+=20
+ #include <string.h>
+ #include <errno.h>
++#include <libxml/parser.h>
+ #include <libxml/tree.h>
+ #include "soup-xmlrpc.h"
+ #include "soup.h"
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-=
uninitialized-warnings.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/=
0001-Fix-possibly-uninitialized-warnings.patch
new file mode 100644
index 0000000000..fcd442c13a
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uniniti=
alized-warnings.patch
@@ -0,0 +1,43 @@
+From 1159686379184a1c899eabb2174258aba5e0fd79 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 20 Sep 2021 15:41:31 -0500
+Subject: [PATCH] Fix possibly uninitialized warnings
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/fb98e9a8c3062c75357b961543af091de2dd5459]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-websocket-connection.c | 2 +-
+ tests/samesite-test.c               | 3 +++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-=
connection.c
+index 65c1492..585d45c 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -471,7 +471,7 @@ send_message (SoupWebsocketConnection *self,
+ 	GByteArray *bytes;
+ 	gsize frame_len;
+ 	guint8 *outer;
+-	guint8 mask_offset;
++	guint8 mask_offset =3D 0;
+ 	GBytes *filtered_bytes;
+ 	GList *l;
+ 	GError *error =3D NULL;
+diff --git a/tests/samesite-test.c b/tests/samesite-test.c
+index 0b081b2..60c9b8e 100644
+--- a/tests/samesite-test.c
++++ b/tests/samesite-test.c
+@@ -60,6 +60,9 @@ assert_highest_policy_visible (GSList *cookies, SoupSame=
SitePolicy policy)
+ 	case SOUP_SAME_SITE_POLICY_NONE:
+ 		expected_count =3D 1;
+ 		break;
++	default:
++		g_assert_not_reached ();
++		break;
+ 	}
+=20
+ 	g_assert_cmpuint (size, =3D=3D, expected_count);
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-a=
nd-https-aliases-support-test.patch b/meta-oe/recipes-support/libsoup/libso=
up-2.4/0001-Remove-http-and-https-aliases-support-test.patch
new file mode 100644
index 0000000000..0d4139ec08
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-http=
s-aliases-support-test.patch
@@ -0,0 +1,145 @@
+From 0e3bfa22b23451531caf8cc30b1771ac6a41fcad Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Thu, 11 Feb 2021 10:47:09 +0100
+Subject: [PATCH] Remove http and https aliases support test
+
+Upstream has removed the whole function of http and https aliases
+support, this commit partially cherry pick it, only remove the test to
+mute the warning:
+| ../libsoup-2.74.3/tests/server-test.c: In function 'do_one_server_aliase=
s_test':
+| ../libsoup-2.74.3/tests/server-test.c:180:17: warning: 'g_socket_client_=
set_tls_validation_flags' is deprecated [-Wdeprecated-declarations]
+|   180 |                 g_socket_client_set_tls_validation_flags (client=
, 0);
+|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/111ae4ebe7cc2e389573cff5b9ac76509d6cbac0]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/server-test.c | 104 --------------------------------------------
+ 1 file changed, 104 deletions(-)
+
+diff --git a/tests/server-test.c b/tests/server-test.c
+index 8976103..cb7e815 100644
+--- a/tests/server-test.c
++++ b/tests/server-test.c
+@@ -154,108 +154,6 @@ do_star_test (ServerData *sd, gconstpointer test_dat=
a)
+ 	soup_uri_free (star_uri);
+ }
+=20
+-static void
+-do_one_server_aliases_test (SoupURI    *uri,
+-			    const char *alias,
+-			    gboolean    succeed)
+-{
+-	GSocketClient *client;
+-	GSocketConnectable *addr;
+-	GSocketConnection *conn;
+-	GInputStream *in;
+-	GOutputStream *out;
+-	GError *error =3D NULL;
+-	GString *req;
+-	static char buf[1024];
+-
+-	debug_printf (1, "  %s via %s\n", alias, uri->scheme);
+-
+-	/* There's no way to make libsoup's client side send an absolute
+-	 * URI (to a non-proxy server), so we have to fake this.
+-	 */
+-
+-	client =3D g_socket_client_new ();
+-	if (uri->scheme =3D=3D SOUP_URI_SCHEME_HTTPS) {
+-		g_socket_client_set_tls (client, TRUE);
+-		g_socket_client_set_tls_validation_flags (client, 0);
+-	}
+-	addr =3D g_network_address_new (uri->host, uri->port);
+-
+-	conn =3D g_socket_client_connect (client, addr, NULL, &error);
+-	g_object_unref (addr);
+-	g_object_unref (client);
+-	if (!conn) {
+-		g_assert_no_error (error);
+-		g_error_free (error);
+-		return;
+-	}
+-
+-	in =3D g_io_stream_get_input_stream (G_IO_STREAM (conn));
+-	out =3D g_io_stream_get_output_stream (G_IO_STREAM (conn));
+-
+-	req =3D g_string_new (NULL);
+-	g_string_append_printf (req, "GET %s://%s:%d HTTP/1.1\r\n",
+-				alias, uri->host, uri->port);
+-	g_string_append_printf (req, "Host: %s:%d\r\n",
+-				uri->host, uri->port);
+-	g_string_append (req, "Connection: close\r\n\r\n");
+-
+-	if (!g_output_stream_write_all (out, req->str, req->len, NULL, NULL, &er=
ror)) {
+-		g_assert_no_error (error);
+-		g_error_free (error);
+-		g_object_unref (conn);
+-		g_string_free (req, TRUE);
+-		return;
+-	}
+-	g_string_free (req, TRUE);
+-
+-	if (!g_input_stream_read_all (in, buf, sizeof (buf), NULL, NULL, &error)=
) {
+-		g_assert_no_error (error);
+-		g_error_free (error);
+-		g_object_unref (conn);
+-		return;
+-	}
+-
+-	if (succeed)
+-		g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 200 "));
+-	else
+-		g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 400 "));
+-
+-	g_io_stream_close (G_IO_STREAM (conn), NULL, NULL);
+-	g_object_unref (conn);
+-}
+-
+-static void
+-do_server_aliases_test (ServerData *sd, gconstpointer test_data)
+-{
+-	char *http_aliases[] =3D { "dav", NULL };
+-	char *https_aliases[] =3D { "davs", NULL };
+-	char *http_good[] =3D { "http", "dav", NULL };
+-	char *http_bad[] =3D { "https", "davs", "fred", NULL };
+-	char *https_good[] =3D { "https", "davs", NULL };
+-	char *https_bad[] =3D { "http", "dav", "fred", NULL };
+-	int i;
+-
+-	g_test_bug ("703694");
+-
+-	g_object_set (G_OBJECT (sd->server),
+-		      SOUP_SERVER_HTTP_ALIASES, http_aliases,
+-		      SOUP_SERVER_HTTPS_ALIASES, https_aliases,
+-		      NULL);
+-
+-	for (i =3D 0; http_good[i]; i++)
+-		do_one_server_aliases_test (sd->base_uri, http_good[i], TRUE);
+-	for (i =3D 0; http_bad[i]; i++)
+-		do_one_server_aliases_test (sd->base_uri, http_bad[i], FALSE);
+-
+-	if (tls_available) {
+-		for (i =3D 0; https_good[i]; i++)
+-			do_one_server_aliases_test (sd->ssl_base_uri, https_good[i], TRUE);
+-		for (i =3D 0; https_bad[i]; i++)
+-			do_one_server_aliases_test (sd->ssl_base_uri, https_bad[i], FALSE);
+-	}
+-}
+-
+ static void
+ do_dot_dot_test (ServerData *sd, gconstpointer test_data)
+ {
+@@ -1382,8 +1280,6 @@ main (int argc, char **argv)
+=20
+ 	g_test_add ("/server/OPTIONS *", ServerData, NULL,
+ 		    server_setup, do_star_test, server_teardown);
+-	g_test_add ("/server/aliases", ServerData, NULL,
+-		    server_setup, do_server_aliases_test, server_teardown);
+ 	g_test_add ("/server/..-in-path", ServerData, NULL,
+ 		    server_setup, do_dot_dot_test, server_teardown);
+ 	g_test_add ("/server/ipv6", ServerData, NULL,
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.p=
atch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
new file mode 100644
index 0000000000..cb1f096110
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
@@ -0,0 +1,37 @@
+From a693d49bff058fc20a448dc4e7d324ff0dc6597e Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 11 Sep 2024 11:52:11 +0200
+Subject: [PATCH 1/3] websocket: process the frame as soon as we read data
+
+Otherwise we can enter in a read loop because we were not
+validating the data until the all the data was read.
+
+Fixes #391
+
+CVE: CVE-2024-52532
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be#f1d67ca0386b145ea201cf88d27f72724=
d7c6715]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-websocket-connection.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-=
connection.c
+index a4095e1..65c1492 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -1140,9 +1140,8 @@ soup_websocket_connection_read (SoupWebsocketConnect=
ion *self)
+ 		}
+=20
+ 		pv->incoming->len =3D len + count;
+-	} while (count > 0);
+-
+-	process_incoming (self);
++		process_incoming (self);
++	} while (count > 0 && !pv->close_sent && !pv->io_closing);
+=20
+ 	if (end) {
+ 		if (!pv->close_sent || !pv->close_received) {
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.p=
atch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
new file mode 100644
index 0000000000..dcadafe944
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
@@ -0,0 +1,43 @@
+From f5b76410de1318f49844dacf6e68692522b6c856 Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 2 Oct 2024 11:17:19 +0200
+Subject: [PATCH] websocket-test: disconnect error copy after the test ends
+
+Otherwise the server will have already sent a few more wrong
+bytes and the client will continue getting errors to copy
+but the error is already !=3D NULL and it will assert
+
+CVE: CVE-2024-52532
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit=
/29b96fab2512666d7241e46c98cc45b60b795c0c]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 5e40cf3..1ec9ff6 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -1331,8 +1331,9 @@ test_receive_invalid_encode_length_64 (Test *test,
+ 	GError *error =3D NULL;
+ 	InvalidEncodeLengthTest context =3D { test, NULL };
+ 	guint i;
++	guint error_id;
+=20
+-	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &er=
ror);
++	error_id =3D g_signal_connect (test->client, "error", G_CALLBACK (on_err=
or_copy), &error);
+ 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message=
), &received);
+=20
+ 	/* We use 127(\x7f) as payload length with 65535 extended length */
+@@ -1345,6 +1346,7 @@ test_receive_invalid_encode_length_64 (Test *test,
+ 	WAIT_UNTIL (error !=3D NULL || received !=3D NULL);
+ 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOC=
OL_ERROR);
+ 	g_clear_error (&error);
++	g_signal_handler_disconnect (test->client, error_id);
+ 	g_assert_null (received);
+=20
+         g_thread_join (thread);
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.p=
atch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
new file mode 100644
index 0000000000..ab6af72291
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
@@ -0,0 +1,48 @@
+From d97bb2e340f5a6d7e56a7738403f9d18bc406b70 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Wed, 13 Nov 2024 14:14:23 +0000
+Subject: [PATCH 3/3] websocket-test: Disconnect error signal in another pl=
ace
+
+This is the same change as commit 29b96fab "websocket-test: disconnect
+error copy after the test ends", and is done for the same reason, but
+replicating it into a different function.
+
+Fixes: 6adc0e3e "websocket: process the frame as soon as we read data"
+Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+CVE: CVE-2024-52532
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c33=
2e568e1a3f530ff]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 2b19a7b..0699a06 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -1300,8 +1300,9 @@ test_receive_invalid_encode_length_16 (Test *test,
+ 	GError *error =3D NULL;
+ 	InvalidEncodeLengthTest context =3D { test, NULL };
+ 	guint i;
++	guint error_id;
+=20
+-	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &er=
ror);
++	error_id =3D g_signal_connect (test->client, "error", G_CALLBACK (on_err=
or_copy), &error);
+ 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message=
), &received);
+=20
+ 	/* We use 126(~) as payload length with 125 extended length */
+@@ -1314,6 +1315,7 @@ test_receive_invalid_encode_length_16 (Test *test,
+ 	WAIT_UNTIL (error !=3D NULL || received !=3D NULL);
+ 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOC=
OL_ERROR);
+ 	g_clear_error (&error);
++        g_signal_handler_disconnect (test->client, error_id);
+ 	g_assert_null (received);
+=20
+ 	g_thread_join (thread);
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta-o=
e/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
new file mode 100644
index 0000000000..7e275a48f4
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -0,0 +1,66 @@
+SUMMARY =3D "An HTTP library implementation in C"
+DESCRIPTION =3D "libsoup is an HTTP client/server library for GNOME. It us=
es GObjects \
+and the glib main loop, to integrate well with GNOME applications."
+HOMEPAGE =3D "https://wiki.gnome.org/Projects/libsoup"
+BUGTRACKER =3D "https://bugzilla.gnome.org/"
+SECTION =3D "x11/gnome/libs"
+LICENSE =3D "LGPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec=
2"
+
+DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
+
+SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.'=
)[1]}"
+
+SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
+           file://0001-CVE-2025-32911.patch \
+           file://0001-Fix-possibly-uninitialized-warnings.patch \
+           file://0001-Remove-http-and-https-aliases-support-test.patch \
+           file://CVE-2024-52532-1.patch \
+           file://CVE-2024-52532-2.patch \
+           file://CVE-2024-52532-3.patch"
+
+SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153d=
f1413fa1d92f13"
+
+CVE_PRODUCT =3D "libsoup"
+
+S =3D "${WORKDIR}/libsoup-${PV}"
+
+inherit meson gettext pkgconfig upstream-version-is-even gobject-introspec=
tion gtk-doc
+
+UPSTREAM_CHECK_REGEX =3D "libsoup-(?P<pver>2(\.(?!99)\d+)+)\.tar"
+
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisabled,brotli"
+# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards
+PACKAGECONFIG[gnome] =3D "-Dgnome=3Dtrue,-Dgnome=3Dfalse"
+PACKAGECONFIG[gssapi] =3D "-Dgssapi=3Denabled,-Dgssapi=3Ddisabled,krb5"
+PACKAGECONFIG[ntlm] =3D "-Dntlm=3Denabled,-Dntlm=3Ddisabled"
+PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Denabled,-Dsysprof=3Ddisabled,syspr=
of"
+
+# Tell libsoup where the target ntlm_auth is installed
+do_write_config:append:class-target() {
+    cat >${WORKDIR}/soup.cross <<EOF
+[binaries]
+ntlm_auth =3D '${bindir}/ntlm_auth'
+EOF
+}
+EXTRA_OEMESON:append:class-target =3D " --cross-file ${WORKDIR}/soup.cross=
"
+
+EXTRA_OEMESON +=3D "-Dvapi=3Ddisabled -Dtls_check=3Dfalse"
+
+GTKDOC_MESON_OPTION =3D "gtk_doc"
+
+# When built without gnome support, libsoup-2.4 will contain only one shar=
ed lib
+# and will therefore become subject to renaming by debian.bbclass. Prevent
+# renaming in order to keep the package name consistent regardless of whet=
her
+# gnome support is enabled or disabled.
+DEBIAN_NOAUTONAME:${PN} =3D "1"
+
+# glib-networking is needed for SSL, proxies, etc.
+RRECOMMENDS:${PN} =3D "glib-networking"
+
+BBCLASSEXTEND =3D "native nativesdk"

