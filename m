Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69BFC7115F
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:35:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.26])
 by mx.groups.io with SMTP id smtpd.web11.338.1750257316205101331
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=EMwEB7qS;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.65.26, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvQ+WAAzsEm6F47z/5ETbsWcsqUjqtYJ0s1VKyxGbBhsioYXuqaG0A0NoPTDYdfitLmPoW9V6fwyw5CpHS6Dm6uSMVLLRXX9al0aOAOnAtzCjuJIilP+ru6obLYQpRFNbk/wsW56jcFpxO8UKEjvEPVU+tV7QKnX/OLn2NoD3yvuRANTeFYbS4UfNM+KoctNG54n3gS/C7V/wjX9eMpiphzn3ZugGyK5GDkUrbxJFhpojd9UnMMpzx1tByKIVnGAWUIe97vqxpjrlnzNKZIM//KjnLb+/oCf1HuT1ElUT3+93HasuFoa/QlFy+hdJxSgD8SXcNRLeiTkWvQuhKHmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AAPL/Flr7AP83QOEtreHvKyrOM8SY1rjGOOe033gIc=;
 b=TXrqNRJz+zc/X9+6rlPgYudGfQBIwEBClDfAGm09dDb4zo/G8mAutp+MrHwCVnnFvwj7453kOiPU9E7iLRwQ1vAFKR3gFg5M12K4xbbgU5dTezM9P1+V5ZLKjDOzyR5slwt1AsqPTyIQAiwx0+RHGfISl2Y/U9pWgXacoSpY9o9h8WUr5J343kTdYAbUT1lM07gYFbYBNVm+tS7RaY+XY+DG4sdi3+ICFOrDcSCtZWVUbHqRIuDFhyUQQqo5KJn5yKm2Q+29rEGfP0I4Ehk+NQSGZ6vTy/IMmWCNoiANSrGDifNQM1POQKFOXA1Lep4tVy2FSxM6FGqs4ERQR3ppwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AAPL/Flr7AP83QOEtreHvKyrOM8SY1rjGOOe033gIc=;
 b=EMwEB7qS7bVLsE8ettzoxqXaHvSYz/+faVfhGGFjITn73kMO5sZ78REo+Bjm3Zf/UtEgAnV1VCBOJzcIHl+5Ma/SBY5CWj4++R12kpKGmhY+xOYF+uVGkLSGkOf4oqIdI796gRtdrH2MfCKOnAWleZlL+3iFrpMlKAixskmQ9dw=
Received: from DBBPR09CA0007.eurprd09.prod.outlook.com (2603:10a6:10:c0::19)
 by AM8PR06MB7634.eurprd06.prod.outlook.com (2603:10a6:20b:317::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 14:35:11 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::a0) by DBBPR09CA0007.outlook.office365.com
 (2603:10a6:10:c0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Wed,
 18 Jun 2025 14:35:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 14:35:11 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 18 Jun 2025 16:35:07 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Wed, 18 Jun 2025 16:35:06 +0200
Subject: [PATCH meta-oe v3 3/6] signing.bbclass: add get_root_cert
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-signing-set-ca-v3-3-4ba014735f0e@leica-geosystems.com>
References: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
In-Reply-To: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 18 Jun 2025 14:35:07.0529 (UTC) FILETIME=[300D5790:01DBE05E]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|AM8PR06MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: f1535934-d23f-4cd6-f6ad-08ddae7554bb
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1FWNnBZTGhsRHY2VzJFaGFJRWxITU5YZUtPaHdTam0wWG5NSStIWEtMN1Np?=
 =?utf-8?B?Y1I3ODZrY2wvVTVkSWcrei9tZGVuTGFoMHNKKzN1OFdwS1d3YkNqTzFBTm5T?=
 =?utf-8?B?dE9lNWYxSXF1R01ERUpBNTNKajRxK2N1UDVqY04rVFMvSDZkQisxRXY4MGxB?=
 =?utf-8?B?blNVWlNhNGxNSUhjMGtwZ2Rod0JFY29BZnJGV0dXU0xUcUluY21nYWtZQlo4?=
 =?utf-8?B?bFE1Ym8vSFF0OXl6YTZTdUlNRmJxY1h3Z2lsM1FKRitneFVXcTJzK2w0K29r?=
 =?utf-8?B?WU0zRG00dWRiT0JCOVRtUUR5bnRiLzFiZlVoRms4MWNHcHJka2VGUUhSakta?=
 =?utf-8?B?SC96VjRLWndYdWsrM3ZXVTVDVVJ5TE1KemNjWnlEMUxJOHBzUzFyY0poSVg2?=
 =?utf-8?B?RHZhbkxnZllhV3pnMDNUWXdOQWc2Rk9ORjZpNjc5LzEvUFFqdjl1R1V1QVhu?=
 =?utf-8?B?VUJDZWtZTitwSW0xd0hqRHBtVUZVMCtQQ2tCWDNxMWZXSXpxcmY2bURiSjZm?=
 =?utf-8?B?YXdvUFdsRUFlRmg5Rm9HSWVlUytTblZ4ekxNSGRtZERPem4wNXNJT3RjY0l0?=
 =?utf-8?B?Q1FiWnRZclVMVGNvajVINld1QXoybmNOWjdTUU5HajFXbjlNTyszbVJ6U1ZK?=
 =?utf-8?B?S0h0dUJiU0psN09aMndiblJkd1VubzZsRlZRcXdFMVpxd3NnWmlsYjBrWjRu?=
 =?utf-8?B?dEt0bTg1MGxVdDlOTG84akxlcEt2cGlJNGlQT3VadVFzc2VCbC85QTNsZlBM?=
 =?utf-8?B?TlR6aWc4NFNpd2EwTXd4M0tmUnJrMk5Ed1pxekswaHA4Unk4TGFLczliVFdK?=
 =?utf-8?B?TWtyYzRFRzhoWmduUWF5MnJ1eEZUaG5CNEFZdEZBYTc2YmJoUU1YVjB4Z0oy?=
 =?utf-8?B?UmdjbWszcE5DRXRmTWNQTEFycUZMRTh1K0QrU0JLcCtva0NHMzh1ejZibUhF?=
 =?utf-8?B?TDROZzJJRXYwdHV6OXhaZ2Z2Z05pL25nWjU5ZGZlV3dzUGJqT05QRFB0MjNX?=
 =?utf-8?B?M0p6aTJXdi92V051VWoxMTFaKy9PM2plV2Fqb0JrK2g1R1pWQ2RIR0NTMzEy?=
 =?utf-8?B?NEhCS3huS1FVTUJ0YXFqZjdIY3diQkVDRU43SlFwL3I0WFk4ZWdBTVZkS29P?=
 =?utf-8?B?TmJZUi9sc2l1Yy9ZUGM0V04yRVowTTdVWCsvVmN5UW45bGVlTFdIOFNOSGNS?=
 =?utf-8?B?cFJLeE5OcStwT2xpeVBQd05GVU5uUmZwY29TVmdUMkJPSU1jTTYyNjlhYVNC?=
 =?utf-8?B?V3h2akJjKzdhaFBSVXlZQU1oZkZJd1lmT1MxQkhmUnJENTk1VkJPS3RNY2hX?=
 =?utf-8?B?Qk4vYXNzdzd5TkcwQjFjVWcxYXdmVlZ4LzltWXNCL0JoVE1pM0VsM05Bc2hx?=
 =?utf-8?B?SlBWMnFUR0cwOXlxUStsK2twSTA3VUhlTjVkMWQ2RVpNMEtrNVF6NkUrdDNN?=
 =?utf-8?B?Ni81bUxSUUJibjFCa3BCWlQ5OWw5Y2hDa0dta2dWTEF1eEFiTjgzdW5yUEpU?=
 =?utf-8?B?ZEp3Wm5nelVnL2ROMlYxTm9CSVVqVmRvN25TRkZydkc0MFJBeElwSXN5RTR5?=
 =?utf-8?B?eVZQUmZUMWxnQ3FRK2xabjhLM09TUEJLUStyTnRQZk1wM2krR3NBM0xIeWJJ?=
 =?utf-8?B?VkZDNkNEZmJVemd3T2pJMFo3TWQzMy8yM0RZcGVoN3QrcURhakNtYk5ManJm?=
 =?utf-8?B?YnFjUWhiR2lld2xqL2NJWTJtZW90M3lLQjk0cTNzVHZtbE9VWkt0Skw5NVhj?=
 =?utf-8?B?aFlsdEcyQXJvWVhXSVJDL3VTL0N0QVQrUVM2clZTS2x3MmI5aERDS2lpTmtz?=
 =?utf-8?B?YVFsbS9kYzlNZnBtSlBoRWZuZE5rT2FaQjdZcldrS1NoZVZJRmN0WDQzTTYr?=
 =?utf-8?B?WUtpcWViUGNIWEc3RHk5VEwwdTF0eE9CQUExZ0ZSMUw5WVVJeVlNV3BOcDV2?=
 =?utf-8?B?aWpqMDhMV0UrSUxNTlAybkZDM2tqSk1iT0YzUkJIS0pIT1Rqd0d4aXVnSDBC?=
 =?utf-8?B?Q21PeitXQ0NhdDZORUNwR0RxMlJrMHpXaXU2bG92SWJsLytsOVAwZDJheXJW?=
 =?utf-8?Q?Pm5nFX?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:35:11.1855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1535934-d23f-4cd6-f6ad-08ddae7554bb
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7634
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 14:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117940

Add a helper method to retrieve the root CA certificate for a given
role, by walking the chain that has been setup with
signing_import_set_ca up to the last element - which is the root.

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index 04bd92bc033e8854eac245e399126554dbaa2fea..2a94f5f5b376f99f521494239f7158662df4a3c6 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -194,6 +194,22 @@ signing_has_ca() {
     return $?
 }
 
+# signing_get_root_cert <cert_name>
+#
+# return the role/name of the CA root certificate for a given
+# <cert_name>, by walking the chain setup with signing_import_set_ca
+# all the way to the last in line that doesn't have a CA set - which
+# would be the root.
+#
+# To be used with SoftHSM.
+signing_get_root_cert() {
+    local cert_name="${1}"
+    while signing_has_ca "${cert_name}"; do
+        cert_name="$(signing_get_ca ${cert_name})"
+    done
+    echo "${cert_name}"
+}
+
 # signing_import_cert_chain_from_pem <role> <pem>
 #
 # Import a certificate *chain* from a PEM file to a role.

-- 
2.34.1


