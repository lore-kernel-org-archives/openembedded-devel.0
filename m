Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4F3C7115D
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:35:23 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.52])
 by mx.groups.io with SMTP id smtpd.web10.356.1750257314749972093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=GQovfcV2;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.69.52, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDPSIA30nNioU13tX1EsU3A5YwJ+diug1qPYuonra2hUPKh4ebXX8t21jikn4OJkSqFAScXYbIj8TQBnw2BGRt1drrZXQiuWsvrJ52W539ekxpAyvXjm0XNx34ZmFAS7JzZLYt8+ancYM1W/6khwuaDMoUgJik1VdmzlKzfW4Iqws4T3bS4od1lhMLrxJpNmsss+24aBZ+23rT+lWHn0a2yT+ApsyZAwm998i7iK9iqNjJ2hu+GjebqlDEOO9gErjRvxCB5IHnLu4rWoSe1LyOJjz2AJ/hObdZ1DfCJtz8utjKCP/fY0hGLsqIvi7NhhjmVkz+e9AG6TFy8hqLMVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KcaYK+5nYPQt/GKQh2LBqVelypDtCfhFVvtUbPe4ok=;
 b=NNMlqzLs5cSoOMph+TjTqFIotF+PHPTWombdx1/cPcYN9a1OFHtyFHJgiwGasjiv1BZXF5JP4/umeLXc7M+f7ypUtoox39L+sqEHSOLDBYlpk50+7PVox1atCJXeYoD9puZDKb0Ji4RyoRZ01U+50sdtQwg+5EhPDi5MwfAfACwHLPHMBGWZP1kFDtl0/CqWgSmPgIk3O0OBOnH8p4bsEv1apV6l0gzJyIHlHSL/QASsfjMc/ZPLJNE1x86r9+8jCOyIQODMU/877pEYKLsjrUqDzwPpGKPseIjbItKpMUzUrquv1+auwPXcTka1YdwxVqiqZnrIPdN+nsCFbqn1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KcaYK+5nYPQt/GKQh2LBqVelypDtCfhFVvtUbPe4ok=;
 b=GQovfcV2SXDAn+Bcs0WtlJaY7LO7UmhujTLPUjWdr6BVxHYevptwNQDMAl4zAFb76OGKy6b7JCQnK3NqsnRirPunOuNnyeokpRki+oKN7YIb+eHuSiDn9DbBx2sN3rWZiXZ8ZlRWGY+44agN1pQG1buVuMHlys8+eDp6X+EPdWM=
Received: from DBBPR09CA0011.eurprd09.prod.outlook.com (2603:10a6:10:c0::23)
 by VE1PR06MB6848.eurprd06.prod.outlook.com (2603:10a6:800:1b1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 14:35:11 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::da) by DBBPR09CA0011.outlook.office365.com
 (2603:10a6:10:c0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.33 via Frontend Transport; Wed,
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
Date: Wed, 18 Jun 2025 16:35:07 +0200
Subject: [PATCH meta-oe v3 4/6] signing.bbclass: add
 signing_get_intermediate_certs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-signing-set-ca-v3-4-4ba014735f0e@leica-geosystems.com>
References: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
In-Reply-To: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 18 Jun 2025 14:35:07.0544 (UTC) FILETIME=[300FA180:01DBE05E]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|VE1PR06MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 05eb98a4-8f60-4388-ff7b-08ddae7554f9
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UUhxbnNQc3U2alhSWVB2SE5QVm5meFR0d1FiVzNvYStHaUxaeGI2ZWRNNnpn?=
 =?utf-8?B?eU1zbng4ai96dWtNTUhGVHdjQlMxZy8ySEJ5czErVTdZSGM3aEJQVHRmYlll?=
 =?utf-8?B?bmpKS0xoY0hzR2R1NXBrTFdZbHlDU3MyZUZRQzdpM21oYjZlYVArVzFaQ1BY?=
 =?utf-8?B?YThmTG4vVXhUUzJWNkxXcFB5cjlMQ1E1emE0WHNldTFyMnRZaXNrZ2RWcTIy?=
 =?utf-8?B?bTc1UlZiYk1xK2VISkNiVi90ei9HU1E3a1pKSUVxZ09XTERFaDU5QkNGMU50?=
 =?utf-8?B?aXlmK0t2RFFPTWhJWjdGSmE4czhqS05BYmlPQk1UWDlFVUtSUkJMN3FwVDJI?=
 =?utf-8?B?Uy9lWjl5SnU3QXZwSzQ5Y2MxbEt5VWJrcjNCYVhKZVNubllOZ2RIaldQV1JH?=
 =?utf-8?B?M0dYbGJSaVQxeVg0cTVYMjVWV084S2w2cWt4Q2VlNFl2d1VCUXRHYlVEUjRx?=
 =?utf-8?B?MmZsVStjQzNjOGp0cDBWbXFQMDNrOUExYU1COVJDYm1qLzVtVE1mMS9LdWNq?=
 =?utf-8?B?bGFGcWJFd3YxSGhyS3ZhYWFhRE51TkZRRTB0MDg2WnN1NFptcVRjUHJIdEVE?=
 =?utf-8?B?cWw0cGNtaXhsdk03UmZudVRmdEJZUU5aMHhoUGs1U1I3OStMaHkwK2hFbGdm?=
 =?utf-8?B?b2FDR25IM1JRdTJZYm4yUHFnSklleVQwNmRta3hlMEUvU2tvK08wbFR3Y3FG?=
 =?utf-8?B?K08zT2hSZkNpc1BOWi9WbW1TZHFaOWorT213WFhjU0VuRTQ2SzNDWU1lN0RI?=
 =?utf-8?B?eHR2c1M5OElROWcwQTRCU2ExcTVOTmloR1A2QU1uV0JtcXBhOXBzU21FZncz?=
 =?utf-8?B?N0paUk1ibHpmaGo0a1NWc2ZLRWZHVXFyQVo0eEJyM1haY0Y1YnNJWGs4QnpZ?=
 =?utf-8?B?Zlk2MVFqZ2tsUWJPV09uMVNubzFBRmJrc0hRVlVVVERCNWtwaXRrQ1IvaFZ4?=
 =?utf-8?B?QVBpOWcwTldKVGxsbXhNaVRLbmQ4ZHRlbko3TmdxbXRDT3RMYjJ6cDBBMmpq?=
 =?utf-8?B?UGNBdG1jcTZVWjFwSmRkcVlMeFlBNzlIWk9oS293aSttTXBnTjVERHY5T2NN?=
 =?utf-8?B?YWE3ZWxsejlCTVBTem1aY0EycHljTmNwek0xdThMSHk5b0x2UWRmQS95YVJJ?=
 =?utf-8?B?cDA4a3dIaSszSTVQOW9SZ0taRVUxci9sYVhHMGVsM2tyZFNKa1N2WUJzNm5m?=
 =?utf-8?B?VEl6eEZ5aExKMUdPd3lhaSs2bmFqU1J0S283NHlCdlEyNkk5MWpSd0dkTkJU?=
 =?utf-8?B?anZXT1NVc2NocjkreEJHWVVPQnZGMnNQUzl5Y21Ybml3MWdSUXZRMkVhSlRa?=
 =?utf-8?B?bDZGNHNMcVNWR2F6TlB6cVZJVlQrSU0yN2pzVXVMU3ozNk5aMGIzemJja2hR?=
 =?utf-8?B?STVYUUkySDNXNU9OYlNWc2ZzTmRLN2lOaEtjbElxekI1NDV5Slh5U0FOZStO?=
 =?utf-8?B?cGhmbHh3a0cxOW1zeXZyZlViTkRzb0VzZ2xYU2JYTGNZbUROQWpkajB6YXls?=
 =?utf-8?B?Yy96NmFiTlVxeGxvYUl0TGNzQWhheG51NHlxZHFWQjJrcjBLQXhyaUI1MGRM?=
 =?utf-8?B?N0VjYW5OaWU0UVFvaEthMzR3UW9IL0l2Y3gxMVFmZFg1S2tEdXRTNWY1Ync2?=
 =?utf-8?B?T0hYWFQ4MEEyMDY1ZGQ4V01MVm93R0VTY1pYUXl6MFZXaWpPcFZaWEhWdmhh?=
 =?utf-8?B?eDVMd203bFJJbW9rcFVxcFltQXVkWTE0ejB5VzN0Y0VtVUxXNXRNVW5OQUFj?=
 =?utf-8?B?NTJmR3lYNGdRclk5TDJKTUx5NzliR0FKVDNKVnFNbElVcUEvcmpzUXN6bVFR?=
 =?utf-8?B?NGYwTU0wb2xuQVp4YisyM20zWFcrblY5aDlDZU5ma1I5WVFOUFBjMDkvZmxH?=
 =?utf-8?B?ZXNWM0VxbmVUR2lCZDdEbGxwcDJoQS9aMTI1aVNBQWJsTE9DVU1VUW90aXVu?=
 =?utf-8?B?T2pQUnU5T1NrWkc3aUtLbzk0MlJ6eXZyUUNRSFh0SERsQTVHSkgyUWVIWDB0?=
 =?utf-8?B?NHJuUWxTcDBVbWkwcVlFdU5seHYrNnBZZ2hUb2kwMGxXck9vVnV0cHE2dnYz?=
 =?utf-8?Q?61lXfM?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:35:11.5919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05eb98a4-8f60-4388-ff7b-08ddae7554f9
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6848
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 14:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117939

Add a method that returns a list of intermediary CA roles.

When using a complex PKI structure with for example "openssl cms",
these roles can then be iterated over adding in turn a '-certificate'.
Pseudo-code example:
  for intermediate in $(signing_get_intermediate_certs 'FooBaa'); do
     signing_extract_cert_pem $intermediate $intermediate.pem
     CMD+=" --certificate=$intermediate.pem"
  done

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index 2a94f5f5b376f99f521494239f7158662df4a3c6..248c6400ed720e7131e618322314be9bb24a760e 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -194,6 +194,27 @@ signing_has_ca() {
     return $?
 }
 
+# signing_get_intermediate_certs <cert_name>
+#
+# return a list of role/name intermediary CA certificates for a given
+# <cert_name> by walking the chain setup with signing_import_set_ca.
+#
+# The returned list will not include the the root CA, and can
+# potentially be empty.
+#
+# To be used with SoftHSM.
+signing_get_intermediate_certs() {
+    local cert_name="${1}"
+    local intermediary=""
+    while signing_has_ca "${cert_name}"; do
+        cert_name="$(signing_get_ca ${cert_name})"
+        if signing_has_ca "${cert_name}"; then
+            intermediary="${intermediary} ${cert_name}"
+        fi
+    done
+    echo "${intermediary}"
+}
+
 # signing_get_root_cert <cert_name>
 #
 # return the role/name of the CA root certificate for a given

-- 
2.34.1


