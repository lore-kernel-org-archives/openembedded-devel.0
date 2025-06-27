Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F72C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 05:40:34 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.62])
 by mx.groups.io with SMTP id smtpd.web11.6721.1751002829133965053
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 22:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=SeBMHjeU;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.162.62, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZwe6KkEFOleg5VILPl0SmSkrTCIXGHutNJMqRPwn3c6XFZ0TJXPvteF2/MwadInXltYflG9mNhl7+64WiHDmBSH1VT5qtRFy38N6L7l/GsNvFY61T7VlmTh5f+99b/GfJAvmXDPOsRhMzX5CPL3fLAh0zWlcuHBPj7dvzegyi62UCwxw2Sn4XGNghF4uJfcuoq1gRKM4Pf8iLsPPKWHA4/iv4JuuRMruIkc1/l1JrskAk5Qd522N8FcRowYSxW94H2imt/0WTVLmV/AZb9oEIAsb4M7r5wtdhIlMAxRdD3G10OuAJue8TL35Lca+t/wB61GOu9t89wHr9Xf49KoXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBBUI3xJQGpOGlhig8qCUo0IIL52X7R1MSFGQEudruY=;
 b=J6prx5u4vv6lhbXfuD8QqH5M9NlxwxYOMaHRtsQX9aEVl00zfpgc2ynbbV5svXg/PkRN2Q34b2VSpoRyfzGaL/4QWQQ4/zicA5mR8PHfsam/83cmnOTkSMde1wQLDLIylx1dPTDsMHFx7TqSV9n154tRm1x/6R5tpx+XbUGZvnhe7nL/GhqzQi92YA9hpGjn2VBkGwAfQliLCS8DYi6PPJuk9ShRbdoCHCaOkEogs6zc9xUGROlJywnKeyxmVwM0tWTL0dnNDJ+XR+lK1TI1gdIkNMOujzvdgCDZksvl8s3ZDVCd1dNQLWdGrECaMXxtv8+BW7ffoVUAlaCVubS4xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBBUI3xJQGpOGlhig8qCUo0IIL52X7R1MSFGQEudruY=;
 b=SeBMHjeUMsopsXwrVn5EteT4/TqAQxSkcYxliS/Kb9TvejOXeNTeRfBxtfcUmELvBJLtPCtyGbmMlL7XiJC9AXVS+FS65NZ9iy2TXBdd1FZCIRAIcw5rlS/HfaY1wRqV1IO1xA2+ffPRlizpFOxS1j23OZnaNswElmsSnNKlo94=
Received: from PR1P264CA0103.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cf::10)
 by AS5PR06MB8625.eurprd06.prod.outlook.com (2603:10a6:20b:672::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 27 Jun
 2025 05:40:20 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:2cf:cafe::61) by PR1P264CA0103.outlook.office365.com
 (2603:10a6:102:2cf::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 05:40:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.1 via Frontend Transport; Fri, 27 Jun 2025 05:40:19 +0000
Received: from [127.0.1.1] ([10.60.34.121]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 27 Jun 2025 07:40:17 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Fri, 27 Jun 2025 07:40:17 +0200
Subject: [PATCH meta-oe v3 3/6] signing.bbclass: add get_root_cert
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-signing-set-ca-v3-3-030812797c6a@leica-geosystems.com>
References: <20250627-signing-set-ca-v3-0-030812797c6a@leica-geosystems.com>
In-Reply-To: <20250627-signing-set-ca-v3-0-030812797c6a@leica-geosystems.com>
To: jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-OriginalArrivalTime: 27 Jun 2025 05:40:17.0578 (UTC) FILETIME=[F6AB28A0:01DBE725]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|AS5PR06MB8625:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de88151-be29-4b9d-c762-08ddb53d1a98
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R0Vpc2hDd2xPaW8ySExabE9KMFR6K014dE1FUTE0UEY5S3ZUcVIxSTZyTWtJ?=
 =?utf-8?B?a3EzdGZSUkE0b3NObktnaEFTeUVGWnlSTFBPbncxTTRWNkJ5QWlWUWNnaGRY?=
 =?utf-8?B?WnVqd2FObGtzdEV3M05nZW5iaWMydVZERDkwQ1gwTVJKVjNqUDNJNWZTQXBi?=
 =?utf-8?B?eVRBc0dRWVdYbWRrWSt5RCtKb0R3OFNvMGFBN3R4ckQvdEZ2eGtOZVRMdEdk?=
 =?utf-8?B?RUFmckk5MkVEMkw0aitReTREN2h5Q2h0YVZHWWpGNDM0K0pCK3ozVU5Jb0JO?=
 =?utf-8?B?OXIyY3pKcCtZZzAvam5MTllTT0UyMk5yUnBFcnFwU2k2WndFNE16bUxVVEkv?=
 =?utf-8?B?K2lTeERVUUlSc3hzOGtxaHZZRUwrSU5heHg3bm95dlNqelJmemIrOWoxTmN5?=
 =?utf-8?B?TGFiMWdxL3p6WWUxWmIrb2xKaDR0NHZGUVFCd0c1SVZWbk95UHQrTGtSRC9X?=
 =?utf-8?B?bEx3M09sTUE0QmF0RklPbkVKMFZmZUZ1cGtWYnBBc3RlODZrVEJmN1RZTGVv?=
 =?utf-8?B?bGZwM2piV21NSTZkYlBnYWU0c3VPYWVYaU5xWkJ2cG9UR3cvVUhySXNQZE85?=
 =?utf-8?B?K1JsV1lQaVRDV2xGUVFqZjdXbUpQOWNVNzczZnlQbjNpQ2lXeFdaRFYvTnMy?=
 =?utf-8?B?ZENld2dzL2JFdW5OdDZEd3IxTGdXM3pLTGlabnZxZG1SOXY1MHpSNnd1R2tL?=
 =?utf-8?B?UnRyTFplSitLRmM0YldMWDZXY3lvcFVQVHVHOFN0U2xwbWFGSHNZZFBLUnBq?=
 =?utf-8?B?OXFLSjhyTU0yRjhvdVdSdmw1SVY5aEZhMTRzdmRZd2lyTG1EWDBTSEp6UXlh?=
 =?utf-8?B?RlVxZlZYVmNNTGpuT0FRc25YeHRDQ2dvWE13cVlLcEFxTXhwQXVLR1VFdjlw?=
 =?utf-8?B?Ukh4QkdZR2NKVUlqYm1QL29DaC8vcmorSGNGMWdINmMvQSt4MVEzS2gvc0hy?=
 =?utf-8?B?VUdUY3oxK3djUDhueWF2eTVyaUpGaXdKN2lybFRscTBvZU43S2tyOEpvZ0NG?=
 =?utf-8?B?Zk1BdnFqM0lSQjNPeU0vSDBtOGpCUGR3MTc0VVh1cW1JdU44RkZZWnEvVkpD?=
 =?utf-8?B?cllnQ1NSb0dyaDBtSUZ4bnFubjNBUmtNSHJDL1VmcVQ2Z1JZVXJZWXUyUGx3?=
 =?utf-8?B?cFE5dUZ0MjJ5Y0VML0ZZS2QzbFZuK25sMEdtQnRqamp5ZmlzNUZhcFl1Zmh6?=
 =?utf-8?B?dVh5RmhUcUs4VkxFS1NSSTNNVzRjdjEyYVpMdGJMcFFJNXA3RWJyTE1XbUly?=
 =?utf-8?B?ZWNvWEpab1Nwc1B3MnRPZWVvVFBFWlpPZm5Dcit5TW5BdlFvdVZycFlURGVP?=
 =?utf-8?B?cE5tbi9Mei9udWJwUnJaR05KQmtDYnVwWkMyUllBMjZwa1B1QlU1MEw3WUdY?=
 =?utf-8?B?TXNqSjFEdEJkTkd5ZjV4QUNtVlg0L2dCNElhdWsxNWR3Ti9CK3F2WG10N3A3?=
 =?utf-8?B?TDFhNWcrY1NOWkE5NC9JUlNYRTE4Y1hJZEg1NTFoWjUxZVU4ZHAxdkF1TTJr?=
 =?utf-8?B?SDZ3c3A3U1JtdlJBZ0N3RGhnQ1FwSmNwUkUxaExiV2NXTjJTM0RuZi83RWdF?=
 =?utf-8?B?Z1dCcmxodDNZODljUDR1dlBOait2S3d0Z2Uvd3huck93THB3MlExY3NLNTNw?=
 =?utf-8?B?bisyOXJiOFcvZVVMbFhNWGdYd3hpU0o1QkRBK0s3ekhucE5rb28xZzVSell2?=
 =?utf-8?B?Zy9JN1VWd0JKajdsdE80K0VnNCtCai9CNXJpSnhQUTVRWTYxYXA3eEhXTk80?=
 =?utf-8?B?MWNsY1B2QmtUTGJLTjlJWHAreFRYVm9jREhOVGtHZnJYb1pMYWNyRVZtdU5L?=
 =?utf-8?B?ZitweVBVRlJrdXduc0p6RU5qczZMUVRweDMwSDFiamg1b1owWUd2WHpvR1N1?=
 =?utf-8?B?Z3lyZHoycktlZlNHRWY4R2RPbzBOYUlJM0tHOFVOOC91bE91SXVvaTdkaGpy?=
 =?utf-8?B?SHh5UnVsaWJZSXNnUkJsL1FRME13eTg5Z0o5aDFtRFNlcU41TkRIdkU2OXhD?=
 =?utf-8?B?d2VIZHVpVHo3T0k5bmwvdDEyOTRpbGR4ZHIxRHdjeHlhRVNPNTRlUDNFZjli?=
 =?utf-8?Q?CdOcRc?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 05:40:19.9987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de88151-be29-4b9d-c762-08ddb53d1a98
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8625
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 05:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118138

Add a helper method to retrieve the root CA certificate for a given
role, by walking the chain that has been setup with
signing_import_set_ca up to the last element - which is the root.

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git meta-oe/classes/signing.bbclass meta-oe/classes/signing.bbclass
index 04bd92bc03..2a94f5f5b3 100644
--- meta-oe/classes/signing.bbclass
+++ meta-oe/classes/signing.bbclass
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
2.43.0


