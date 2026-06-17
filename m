Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5FECD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:13:58 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9047.1781674248677337308
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QAVqCUBa;
 spf=pass (domain: axis.com, ip: 52.101.84.35, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXO6i61nbsqcUe7r6js6F3p0agmqLQzw4g+I7kemyBwVxsfm44Z4zEQfFxwCUu3nxTaZrbeAcnKOZzbPGQEM+nX/yPmtHYDxmo1csf27peehu+Ul+DozRJrug8Bu0dLip6wIieXJdBqWPvUp0qg5/bBI/AW9oqMUE+4GprTWEo4l4d6gjqhrXsWDtLnGxK160tbJJTOrOs+VVzmq0ABGW3g3l1odM5S6Z9feh2w1D8uhmgflmb+B/9MkEltVxncmoSXlLR8J8BSHZj+lV5elxpL3rbyszxxRxccRtHJ8vC/WpRix8QZZ7tiAzpNjJN53vZUonpoEQTmCu80PQnWafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwW6LlWS9zAY6wuYcPVO5x4FRKY666HslkNctaeC2dA=;
 b=Pxf7EOEj7ESJk/P+qRpQRTgRS9zRyv2nDuDAcJSV1HjpdvobhtDH1EpmIRTC6OA+u8h3VOCD8W7csDVo91pwUDCiOocm4fRESBzMEOP9scdCg0uE8nzkFO0lp9blw/HKrZ/Edsa5bm2IFrktY/dKasqXJq5lZYAGFSbkoPteSFwdmc2t91ZKkCWiWaea03OTdWlbCOIuZLi+m9d98uTEQ10usb1XLEHmQGpW9sY3XqW+SW4Jdxv2lO2v8qQoo0pxUuoPCNUkI2v7HlX890VIGGquk/uRetjGrXOIWt114RdUQsjwuVO/L9lemEvtrZot2dI2qwMAgbUflb4G+wv+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwW6LlWS9zAY6wuYcPVO5x4FRKY666HslkNctaeC2dA=;
 b=QAVqCUBaH1g5mhvNVRdxrupFXd4z1dS+k6gPZ00m4l7yiuN/5133Nt7qzi79+EY3sqkS9DfBOq9Vlr4/5Qsx1dpTkuLN5+VdvDH/TSJWWnfyTBVuo6l1hLOQrft92uzu47/5Lp5QgoW7K9JKsYM88yOn37BZ6HgZE7oDiGEzjgQ=
Received: from CWLP265CA0493.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::20)
 by DU0PR02MB9824.eurprd02.prod.outlook.com (2603:10a6:10:44b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 05:30:43 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::bb) by CWLP265CA0493.outlook.office365.com
 (2603:10a6:400:18b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 05:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 05:30:42 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 17 Jun
 2026 07:30:42 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 17 Jun 2026 07:30:42 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8325A2ACF;
	Wed, 17 Jun 2026 07:30:42 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id 7C75C8461E6; Wed, 17 Jun 2026 07:30:42 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [meta-oe][PATCHv3 1/8] jq: patch CVE-2026-49839
Date: Wed, 17 Jun 2026 07:30:33 +0200
Message-ID: <20260617053040.990143-1-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|DU0PR02MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a1d930b-586c-4f9a-eac8-08decc31934a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|18002099003|3023799007|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	bPISt3k0iUOsHqdYxr2Z/CSYryGZBexqxXEfYf6v2a7plUVqgfhClFf6TXh+Ub22let3jWhIjhutEA+UrRwAQxBdTZMWhQlHcGmDLQ+ptR2+bFKtbtKOhiQ42Lpkb6U4QyUnkEjT9WUfo8ZGJELj39AQ7gEqi52AJMVkTM81d0/SaDB2g494BT8892vUG2+lZw92oIBZcFhjLc0kLbg4NqmCgqwNlaEg6/dJIqSJMExyfxYAPi1sSgD72zNN4cf0N5tWJ3Q2bz/pSQpKzb1XY69EUv1x/0W7BXp1c+s+bkr6uMRJMctjfm8f8OXAMrnrZ9mcuOIvkclyI4v52Zm6OcOkpXGLsCaxPwPXhrUNM8jdW8uF6ztZovkqMJfW+AcyO4E2Xbn1gFy6b56aNjlB8ky2S5fFqv7gtGT/KZRr8dW+dgbi/5U3VtbRN1+ZPVhNnFv/nlwCHqgiSi0BxHCMUshB7g3pGdvCTaMnJac1Mkics/WmJcuGnW1X7e6UgXAuuxdRsILnGZfmmPiNCb0Q+Wvm9so4KP2KiMJ9vD2Tx78cH2iBTOBaHGYDEvBg+Z+pl7Rf4TWbbMPOJVRqRCcJeh4O5K71RZi+FRmCJmgiFUOVQNprK9zEO2l2O8absSS8HXmln4La0RfY428uV4pmJC9CKRMYAv6Mks8MwiKhAlvmW6dxE9XPECzMl/o1JtxQdbD2cpd+jEEWsqJrhGtZ859yV1pk2gNtO577G19RaGQ=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(18002099003)(3023799007)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KFXQ9+SBfslxpkGWCDTN937LrNThGq+mnCBbh9auDLHb92ZMt2aJUCZ/Y/MYkNbhBmdT/30xmRCTOT55aazD3irxfQ5bQdkPaNL74LdnKV49Qqo3zlWdyNR6cYX7ZPxsYW+drbCoW2HEB3vcTIC5QCa+w2x233sPOQgENPezfuQ/QTysTR9+zto0oNZqJ9Y6FeIGDaiydezVM62mm3J3pAwQduhzIUc3NqD05nGgMp15h7+kBGBOxnlgBPDIJVcwvOJAfIKEg39tSLciTgmvsoZcGZx3dtwJiAip+jWY5vAn1gP1zzlLwzoy1/1fkfkZ4gtIHhC2X5NL2Mfv6QiOs60kwJ4pPuQn3emXUs6pCcB2Bn7WdrrLSZDBRQy6Aa/r1zCSPedDExCe8PdI368cslalGhSgZoUVIWii1asIfSuRnNGiD81UZTD+ER6JdUvs
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:30:42.9316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1d930b-586c-4f9a-eac8-08decc31934a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9824
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 06:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127628

From: Anton Skorup <anton@skorup.se>

CVE details: https://vulert.com/vuln-db/--4743

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
v3
 * Rebased to master-next
v2
 * Added patch to stack of jq CVEs
---
 .../jq/jq/CVE-2026-49389.patch                | 31 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-49389.patch
new file mode 100644
index 0000000000..3189158b4a
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patch
@@ -0,0 +1,31 @@
+From e987df0d463d85fd70825e042a082427e8275b86 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 8 Jun 2026 22:14:48 +0900
+Subject: [PATCH] Fix heap-buffer-overflow in raw file loading
+
+When `jv_string_append_buf` overflows the string length limit,
+it returns an invalid `jv`; `jv_load_file` then re-entered it
+on the invalid value and overran the heap. Break out of the loop
+once the value is invalid.
+
+Fixes CVE-2026-49839.
+
+Signed-off-by: Anton Skorup <anton.skorup@axis.com>
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/e987df0d463=
d85fd70825e042a082427e8275b86]
+---
+ src/jv_file.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/jv_file.c b/src/jv_file.c
+index 7706b0e06e..fbc1e4d653 100644
+--- a/src/jv_file.c
++++ b/src/jv_file.c
+@@ -57,6 +57,8 @@ jv jv_load_file(const char* filename, int raw) {
+=20
+     if (raw) {
+       data =3D jv_string_append_buf(data, buf, n);
++      if (!jv_is_valid(data))
++        break;
+     } else {
+       jv_parser_set_buf(parser, buf, n, !feof(file));
+       jv value;
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index 14e77c1bc6..e1791ad099 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-33948.patch \
            file://CVE-2026-39979.patch \
            file://CVE-2026-47770.patch \
+           file://CVE-2026-49389.patch \
            file://CVE-2026-49839.patch \
            "
=20
--=20
2.43.0


