Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A4DCD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 07:13:02 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148004.1781591289880416164
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=WlYOxMaM;
 spf=pass (domain: axis.com, ip: 40.107.159.41, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAJCHLGjywJlt+BpAj/FVq88Wxz5Et+ben5V4uuCXpogXYs9TG4U6B24IktB6Mazva4bGIXBPv7bszTWAfBP6cKs9lx0Xkeavwb/vqProBahQtItrqBsBhuAC95ObykfAzeDrN+XQjC1tSWycdJI8+xv7bXVibzK0yJ6EByMuXxExhHHk1iJUkaUJd8LPQEJB2XrtIn9nqJj2dfhb3orbqJ9DxpETvAu7pTYpzjbkbgW+We3NRfQxiupsBM7nQsiny8JmKAdX4zW1GltzCnmqKyTYybuqZqK+6Ti04RQ0SiHoK1RQ+vUBeYJH26mTdnhvRRNZAcVNziyeFn095AwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHQF6r2ngJr8+W/ZByGxljkW8qZ7xgt1ddZrSWF/k04=;
 b=CMIL/jE4YJ6snfZcBLaql3bS3Kesh3gmfTVmMTSeTVwqLvY2PUGnDUfHnffqJS84l7m2qrb9wxcoM+zMRNInBEfdtLV57+hJnr5RdoVjMwW0X4oYqxMmErvf2QtSnESDlkopxEHCYI/+fziMfIPWSLctb9OmIzyrgKUFynVwqmrmumR4d0mRJyaCceMu4snL5DgKVKW2mLgM984gpIRdSZRIy/tkAkxFkUqfl34U0X26kJl0yFiQ4DV382yGq5blDYqn26iKc7fAfSPW/3qfC4L0RkBQx4LbnHVnYUv/pXTVeZghA9QFCBX3C5rC6xU+lfiCumeoMNSmZZ6K6hL24g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHQF6r2ngJr8+W/ZByGxljkW8qZ7xgt1ddZrSWF/k04=;
 b=WlYOxMaMu3V9X6gLV9HHTX7azJ154zHlAziSmRObnk3Lqk+q1sQ9h04HoIz3wb8XDfbetLRmkJrDCRkeBCauRzoB1S8K2GjoOXiWN43HE5Gx8/uJ5oo+LelEqBmKOydgHyXunfNwt4f5myDlF0QLVrs3zGqilEgKjLrg8KDdTlM=
Received: from CWLP265CA0431.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::7)
 by AS8PR02MB9529.eurprd02.prod.outlook.com (2603:10a6:20b:5a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:28:03 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::63) by CWLP265CA0431.outlook.office365.com
 (2603:10a6:400:1d7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 06:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 06:28:02 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 16 Jun
 2026 08:28:01 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 16 Jun 2026 08:28:01 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id C2B572480;
	Tue, 16 Jun 2026 08:28:01 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id BF1AD8461E6; Tue, 16 Jun 2026 08:28:01 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [PATCH 7/8] jq: patch CVE-2026-43894
Date: Tue, 16 Jun 2026 08:27:53 +0200
Message-ID: <20260616062754.748436-7-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616062754.748436-1-antonsk@axis.com>
References: <20260616062754.748436-1-antonsk@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C715:EE_|AS8PR02MB9529:EE_
X-MS-Office365-Filtering-Correlation-Id: d7528e62-4b80-4bde-8bb9-08decb706b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|13003099007|22082099003|18002099003|3023799007|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	jIQcjS6UriyuD32WopOmXT5w61UzjcFUrPApw/zzNp+g6kcdnJWCSUWq36+BefWcG0vapfr0ai7qG7yj83Jz6bErrwca+oDOUo52kmFSq+G4gngTH3SkfUZR+EdhQw3ZOMSm+2Drvb9X+mHa6flvqVXV6sSro9S0ktOEcW6gQtdr+E6bJXQTINr5SrDznfe9EtthwTWSnOlB5WsHLE71J9wJTUvwEZ0q15GvpgPYMBzI5nmxOuVlal92vHoOD0rHtmvJ4WZQ+/OWPYzgNy/uhAasB2qf2njQqX6CqWFAcT9qKXOAe+lg0yqgNo0xRIXXt/JCmSWxdU+bKCCJ75MREWjEjhAuoaXKoMKtAYDSguk/c4JqEXvhbqnhQpk0SH4Kg/9u+wkUgX2Ld95dQvFg+dTnPXUgadMpwLy0EBSa6RO6hdHWA9jmVi5+jQ5Wbh2X337/uIwJZJTxWyuWJpbatF3ygeQ3OQHeEaowYa/o+WCp8ombbHMsjaFLimEdAbmKBSyq/+/FiBZZz7QIgsteDHTrvYg5uqqPyUSdQSur36T7aauPeizWpmw3eRkH22qJeNjlbod8HiBKm4Td0EremYlRBUJtigywFzSPKKLHV9oBOPfQIGtlE/QIetzgxHM79WwYNkfuCMfoBQLF2pBv8fyb9EKDDkrNuQUtN79C/qCdbcNgo0EgzNCW82pv4THpFj9LeS5gdjyh0qhVWWMamXCXXR8ZHjZ1/k8IkgJ1Ep0=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(13003099007)(22082099003)(18002099003)(3023799007)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kVn5he7/v7TB4iTS6IH+aTYXCNWHswTRP08M3ETYSRKGLMG6/G5SNoZ1pdNsNLl/IReiNih5simWoJ71h2B4fryOoHmFs9QJHmChpO2cfJBiEdJiNPVEPx8SR6tMicRADjTyhPDNKV/vh3o/6ruqNNJssZ5LLWzIHXNJ2JECLaDgAPwuuMI8+okKN+0YeXafj1S3rqqYxH3iLf5fwFQroc13ewgYwLXZg3vXlSLuQh5zbgyDZF4u7rUbYVgz76nPt9siaBo9n7bjNcv85Xkmqx4v5Ya279hGRHCMpu0hVPyB54Ym6XVAF/V9i5TcDvqWpqbChPwuGuwB1gOpay/8Ao91A2xTSdSrUXNXUg9MavvOoYqXZJGRDK+2Gx7KNrsinx0Bxlg/DgGwdZE65+lPm5SxdIixxJJXuI5U/ZxV6AWDe53HFam0s0R4myWfrBuc
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:28:02.6521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7528e62-4b80-4bde-8bb9-08decb706b19
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9529
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 07:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127612

From: Anton Skorup <anton@skorup.se>

CVE details: https://www.cve.org/CVERecord?id=3DCVE-2026-43894

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
 .../jq/jq/CVE-2026-43894.patch                | 52 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-43894.patch
new file mode 100644
index 0000000000..3b73647de0
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch
@@ -0,0 +1,52 @@
+From 9761ceb7d6cc48c16b25f0ab1baaef0e701927e4 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Wed, 6 May 2026 19:45:24 +0900
+Subject: [PATCH] Reject numeric literals longer than DEC_MAX_DIGITS
+ (999999999)
+
+A signed-int overflow in decNumber's D2U macro lets huge literals
+write attacker-controlled bytes past a stack buffer. Cap the length
+before calling decNumberFromString, and pre-slice long strings in
+jv_dump_string_trunc so the resulting error message doesn't itself
+allocate a multi-GiB buffer.
+
+Fixes CVE-2026-43894.
+
+Signed-off-by: Anton Skorup
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/9761ceb7d6c=
c48c16b25f0ab1baaef0e701927e4]
+---
+ src/jv.c       | 5 ++++-
+ src/jv_print.c | 4 ++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index 84fafef666..074ee310c5 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -570,7 +570,10 @@ static jvp_literal_number* jvp_literal_number_alloc(u=
nsigned literal_length) {
+ }
+=20
+ static jv jvp_literal_number_new(const char * literal) {
+-  jvp_literal_number* n =3D jvp_literal_number_alloc(strlen(literal));
++  size_t len =3D strlen(literal);
++  if (len > DEC_MAX_DIGITS)
++    return JV_INVALID;
++  jvp_literal_number* n =3D jvp_literal_number_alloc(len);
+=20
+   decContext *ctx =3D DEC_CONTEXT();
+   decContextClearStatus(ctx, DEC_Conversion_syntax);
+diff --git a/src/jv_print.c b/src/jv_print.c
+index 5c86c5d97c..bc251070f7 100644
+--- a/src/jv_print.c
++++ b/src/jv_print.c
+@@ -410,6 +410,10 @@ jv jv_dump_string(jv x, int flags) {
+=20
+ char *jv_dump_string_trunc(jv x, char *outbuf, size_t bufsize) {
+   assert(bufsize > 0);
++  if (jv_get_kind(x) =3D=3D JV_KIND_STRING &&
++      (size_t)jv_string_length_bytes(jv_copy(x)) > bufsize) {
++    x =3D jv_string_slice(x, 0, bufsize);
++  }
+   x =3D jv_dump_string(x, 0);
+   const char *str =3D jv_string_value(x);
+   const size_t len =3D strlen(str);
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index 0653dcd1f1..0e3e22c65b 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-40612.patch \
            file://CVE-2026-41256.patch \
            file://CVE-2026-41257.patch \
+           file://CVE-2026-43894.patch \
            file://CVE-2026-43896.patch \
            file://CVE-2026-44777.patch \
            file://CVE-2026-49389.patch \
--=20
2.43.0


