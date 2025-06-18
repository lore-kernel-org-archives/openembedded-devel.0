Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD87C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:35:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.24])
 by mx.groups.io with SMTP id smtpd.web10.354.1750257312688874940
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=cFJNE7W5;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.65.24, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9Nb+endg2qfXbc1oUauOVLOW/a8hqHGpTyt8wmfP2KCtBdFbX5qzTgT/CT8Ns5BXtjFTfbHhIk1TJGtRRJgivA9aQnYAT8Y6qWo+B6yfOkMxoHVNIyuZdP+v+oveJVy62M4+fbaaZml003jVsLRR85r4goE4SH4LmWDO83Cy51l7UH+aNJmZGVlETIzsXIjqOGLYVG+viPiaUnyzR1ZWE9hkY8FhHcnvXGyjZBexsXEDvXviKDA8t1o0S3vQ/ovrEK3wYvl7Yb1zzxVZ+jEMg3PQnHdUlZ1t6WKi61Xf/Jop+RA1V4enfmsCx9rABTM8L3JlWHG9Emt+p7DJJD8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Nnc1nKz8Uj3UTsRFvcHjUxRrQW5+tQV6lH3Y+Vp0x0=;
 b=QLSle+RfaqPXG2bmvDEXpPyQO10T5wTsUxto4XJ6ez4XHwQEDpZy1biv58LZ2lo1rbqROIYeHzuVuNT3rc+K6T+tClI61JqVqfQaUnjC+2abQ/qhrkz02nXb8HC6ZSeFgC/G+f4Z4tXMSYNK4NEIqzTkPzbGaArsUpS0kyQ0rG3h8j0wm3G/fF8093Gn0RehBPLqzX0jYbo3lRi4UEqGUkAtpdwUAIFryWUD1RUwzOSymKLiM8azqxt1T85Mf072oQRzoCJwlIfnk4WNUW6n7C7fLNx7fdmVuKwhe2s7EVucK2yTy/ApGHvXSOcTzIw4swVP40YRUdVG07hbinqV7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Nnc1nKz8Uj3UTsRFvcHjUxRrQW5+tQV6lH3Y+Vp0x0=;
 b=cFJNE7W5vgfl2x7pDv606yNdYR8cdFQV/jNPfIEhbREHty+/34VG35/CsN7B9RFcxfxQty//OpmPKb1YPcIzTVXWF/A9BciFxG7zU5QnMDHkChZIFN63Gp63sWSnT2lnBlJRtnI0JK7Gf7Wkg9M6V5Flyy7+aZEsYTMeKtwyi98=
Received: from DBBPR09CA0019.eurprd09.prod.outlook.com (2603:10a6:10:c0::31)
 by AS8PR06MB7896.eurprd06.prod.outlook.com (2603:10a6:20b:3d1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 14:35:08 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::11) by DBBPR09CA0019.outlook.office365.com
 (2603:10a6:10:c0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Wed,
 18 Jun 2025 14:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 14:35:07 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 18 Jun 2025 16:35:07 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH meta-oe v3 0/6] signing.bbclass: add certificate chain
 handling
Date: Wed, 18 Jun 2025 16:35:03 +0200
Message-Id: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJfOUmgC/0WNQQrCMBBFryKzdkqTEEldeQ9xEdJJOmITyQRRS
 u9ucOPy8fnvbSBUmQTOhw0qvVi45A7meICw+JwIee4MetR2PCmHwilzTijUMHiMZnLaTlrraKG
 fnpUiv3/CK6zUPBaCWx9iLSu2pZL/+6xRShlt9WCcmyarUOG99GwmGSQsmXimenkQ91KiIh9pt
 MoQygr7/gXiNMvTvAAAAA==
X-Change-ID: 20250618-signing-set-ca-f398259222f5
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 18 Jun 2025 14:35:07.0497 (UTC) FILETIME=[30087590:01DBE05E]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|AS8PR06MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f76be03-bf3a-43cf-9f33-08ddae7552b4
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VklETjY0MXoyRnNFdkxLYURwcTd3YWZZSTVaWmRkcEtTbWZsbHF1SXg3RFd2?=
 =?utf-8?B?SkN2ckhiakxTbDl5MXIwclgzTjBteEJvTXNhczNNT2tWQnZDUFJRMzcwaFIw?=
 =?utf-8?B?K1d5NG1WYjdEVEJKNytOUnl6S0gvTmZpZk51Uy9YdzZtSUlmNWxLV214aGJq?=
 =?utf-8?B?NWJKOEwwYVA2N2VZSEd0MjRObUxKUzlWdjVHRzBrL2ZUWjlhWEpJblkwYitH?=
 =?utf-8?B?ME1JTk5yYWtpK3Vrbkc5ekxkRVVYckMyMEF0d0NwTU9DU0hpc2l4N1BCL0Jw?=
 =?utf-8?B?UHNsc2U5SlFSQ01kVFB4dnNWNWs5akszMnY4dzVuc2k3YmR4azFWQVdBYW5G?=
 =?utf-8?B?NnJqNW1FZ2JOeitwRGR4V1AyMVFaejA3Tlo1SGxGdUwyV1hCZ1VtQlg2R3R5?=
 =?utf-8?B?dmx5Mkd1Yi81UFNBRGhnVGl6cnhaRzVpUDlOOFZQS1RKa0QwT2s5SXo1Q0Rq?=
 =?utf-8?B?d1ZVeWxnNXMvUWM4citMS0syZFI2SWgvN3IxM2pHUVB1ZzEwcm53V2lZOUJN?=
 =?utf-8?B?cDdjNGFiU0Mxa1lnYlVHUnVubVVpY1dWdzRqOHJlb1c5T0VSTTcva3BOVys2?=
 =?utf-8?B?UlAvLzdJSHFiRmdvSEV4NU9wb3lmbHFzOW0vdkd3ZUZ3M1g1RlFiQlkxdDNX?=
 =?utf-8?B?eDBLeFY0MWpVZGZYelhGUXhBVlpzOWNQbW9iNW16eDcyTU03eG5DOXc4QWlx?=
 =?utf-8?B?Q0VJZ3M1NmtmcHRzNzMzbDB1V0VvOThtcGhsNzNtY0Q4OHdiT1RtVWFraWpO?=
 =?utf-8?B?ZGxtcmo3MDVOaE9DSDNITkowYmZQTGgrMGRjSDNheElPcVpTU1Fzam43TzYy?=
 =?utf-8?B?U0llcGxxbWhFZ0dJS1lmM0VPY0pGTUxYam1ITUlzSTVVRDZlRzBwMk1MeGE4?=
 =?utf-8?B?WEZ6UnZNZndzQXlmcklUbVhiYUFLU3dPZTVqRGtPUzdKMnhvNjNIaVNXMU5Z?=
 =?utf-8?B?YW1ITHYycnJIckFDaUJ4MFYxeWNNSjVybWUyS0lyd3VMQU5ZanE5bDhQUnVR?=
 =?utf-8?B?Z2ZsVGNZTWpUS1NaVjVHUE0vcjRGQWJDOE12cmdOS1ROYkhzdkFiRWdCdlhi?=
 =?utf-8?B?UWdTOW1oanZTdm82T2ZXUXJCWFZDUDNZRGdjbEgzV1pYenNjWEZtOUs1Yi8r?=
 =?utf-8?B?Rmp5WUZoNDdWUjNCUUpSbFhqQmkvZHlnbjJiaURWcStuR1ZPRy8zTWNVN29F?=
 =?utf-8?B?elpaTW9UNE8yNU5PV2pLMTUzN01jTG5FclNJNWErS2xNYXdLWHdzR0tObjR2?=
 =?utf-8?B?bk8zSEpYYzBXSUlNUWVyeUphRVc4RXRqeHJ3dG5VMVdrOS9Mdm1JRGtoY0dJ?=
 =?utf-8?B?eDZ1YUQ4Y3huZ1pmRkRqZE5oU2pXQkd1cHltOHlSaFBmSFF1dWhCdU5KQVl4?=
 =?utf-8?B?NzhXMWNGc2kwUFNQcWFTUVFqclNGNVFTY3RKRUl2bk4va21uMU9rNFlxdEFM?=
 =?utf-8?B?SHRDdkJSRDYwUzdQZUpZWFRmZ1FRSzR1cGFOa2ZZdittWjBMSFRiVHNSRlpx?=
 =?utf-8?B?OFA3TTZKcjRxTnBIMUNVbFY3ZjdYaWlmSU9ubUFPTXpJVERNMGFrbFRyUEx2?=
 =?utf-8?B?UGZQL3ViRGkwcCs2V2tybUcxZGJqNFlSOHAybnVVK280eDdGT1pMb2s1eGU1?=
 =?utf-8?B?T1V6aVF6NnpJeXV4ZEFSck54cURWNHc1b0RkUTRIdTBlUVlIK2tRVlVmeTVs?=
 =?utf-8?B?YkNCaWZ2aUlndUhBM0tkaUMvVVRLOXdLWmJHbzNrT2JLL3RrUE9lQURqOG53?=
 =?utf-8?B?blFPTEdnYXNrQ1lRM09xWHhyT1Fwb3Z0d0ordjRDRXdlWU80NnFDSVk1cVdU?=
 =?utf-8?B?UkgwYkw1OVB1a2tkbnpWSHZuQTVHRG0rR2tmZ1JpUWo4ekNCZyt0UUhlb2h0?=
 =?utf-8?B?Kzg0U3dCWFlweWJLTCsxVml5RU1hcVJaZXYyaXF4ZTE1NnpobGRGZzdFbGpV?=
 =?utf-8?B?RG5JRjNlR3F3dEloaGM5bnhwY2d1ZElZQitUSGh4VnhQNCtDY093UWtLeldF?=
 =?utf-8?B?eHNxMnFJQ0Y3SFdLV2gyOS9Ta1lsQkZhTG1Odm5ZanNhUUZZdVRGcHVQSDVz?=
 =?utf-8?Q?xR0YoB?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:35:07.7801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f76be03-bf3a-43cf-9f33-08ddae7552b4
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7896
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 14:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117936

Adding support for handling a complex PKI setup to the signing.bbclass

Since a (soft)HSM can only store a single certificate in one slot, the
relation between a leaf certificate, and it's signing intermediary (or
root) certificate has to be stored outside of the HSM, in the form of
some additional metadata.  This additional data is stored in an
environment variable, which is setup and manipulated by a set of
helper functions: signing_{get,set,has}_ca.

This patch-stack also does some cleanup of now superfluous code parts.

---
V3:
- reword commit message and comments following review suggestions
- forsee local.conf overrides for the CA

---
Johannes Schneider (6):
      signing.bbclass: refactor signing_import_cert_from_*
      signing.bbclass: add set|get|has_ca functions
      signing.bbclass: add get_root_cert
      signing.bbclass: add signing_get_intermediate_certs
      signing.bbclass: add signing_extract_cert helpers
      signing.bbclass: remove signing_import_cert_chain_from_pem

 meta-oe/classes/signing.bbclass | 172 ++++++++++++++++++++++++++++++++--------
 1 file changed, 137 insertions(+), 35 deletions(-)
---
base-commit: 3f77bb395c332b12135889bb6b57caee0801b43e
change-id: 20250618-signing-set-ca-f398259222f5

Best regards,
-- 
Johannes Schneider <johannes.schneider@leica-geosystems.com>


