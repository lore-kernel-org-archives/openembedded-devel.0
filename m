Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E84C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:18:36 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.32])
 by mx.groups.io with SMTP id smtpd.web11.12140.1751026716179386183
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=SNrW+tMo;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.65.32, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7h9ZsftJTqAV7xEy+O/FVohEndbvT924cRZ/dM6zJjR/a8WNUS2wHuoaP2d7lYDgfGtTxo69cxw3Is1L5wTZlTrAvKqgOw9CRXhledzGk9YiNoJ3skvYBEKv690bqBvpldG0wP/bOcIriDKGFinJCqYllwUkSkLFM+U5z75LZlsBDlUWeYQYQJHL7xJz6NaJrT/R7B95PJLLoZ2HlGIgfRHU0hXqpqth1ceioSoE145AofZUjresM8/4yvNS1UHFhl842m0HqeK6oVuVicUSQDq0+K/u5Kwav1YRw4B6sIb0vrT4eGX98gbHtSkqGUT5kjjkDttG+OIMlwpI7FYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcasEGRNSROktbFS29GY6YFq3Q08c9tA+9vGJIo4CQU=;
 b=RlaDovRiEdk3SX1Ozj+TBxnyg05JyvzZGG3lWuHJfzHcQtqJ9PIygKo9GLmIsfjaF/XbYCdCBAqcedbrS2rtLAe8HbPGAs482V790opFDqf2JvMMgEZPxFvl9bCjpYcS1as/MhC3sauXV0d7lW4ryHDdstV5+xgknnxn6ab0PrSBwoqDQ/wZOEye+xcpPnRWXFYCwpkxlSc003WMs0XSxjs5DErZYElZXGBj59366XcwuYby8j3MGtXUgZqzUPhH+hTHdgZcHILpmhvICBYK0VGHo5otIXbDgUFqNHe7ZCGf1a24M7idLnS/c2meBh1XWYsKYZyHP4J4d7u9um5Jsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcasEGRNSROktbFS29GY6YFq3Q08c9tA+9vGJIo4CQU=;
 b=SNrW+tMoJuOcpuM7Yn9FHn1ygyWOmPhQyEbpEmewBRFRQ8ohhq9E9HNNSOOnZACGOVLwEn506tiuxMuO26s7TG8Y9CLxqaMY375AzsIOF/C9XqVaEL8fjvL4YaUjrKkLHxlpRU0LWo5x/M9JQkFTHt5n4uO6hi4MpvxosV9HHVI=
Received: from ZR0P278CA0011.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::21)
 by PA1PR06MB10042.eurprd06.prod.outlook.com (2603:10a6:102:4ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 12:18:33 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:910:16:cafe::76) by ZR0P278CA0011.outlook.office365.com
 (2603:10a6:910:16::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.20 via Frontend Transport; Fri,
 27 Jun 2025 12:18:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 12:18:31 +0000
Received: from [127.0.1.1] ([10.60.34.121]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 27 Jun 2025 14:18:31 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH meta-oe v4 0/6] signing.bbclass: add certificate chain
 handling
Date: Fri, 27 Jun 2025 14:18:16 +0200
Message-Id: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAiMXmgC/22OQWrEMAxFrzJ4XQVbrid2V71HmYXxKIlKYw+WC
 R2G3L1uuiiULj9C772HEqpMol5OD1VpY+GS+3h+Oqm0xDwT8LVvhRqdPhsPwnPmPINQgxRhssG
 jC4g4OdWfbpUm/jyAb2qlFqGQuvTDVMsKbakUf3nOGmMsOhys9yE4AwbeS9dmkkHSkomvVF8/i
 LtppiJ3abTKkMr67VpYWqn3o32zh/EnE8e/mZsFDdpqb3AMYzrH/6GXfd+/AGc899kTAQAA
To: jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-OriginalArrivalTime: 27 Jun 2025 12:18:31.0365 (UTC) FILETIME=[9879B750:01DBE75D]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|PA1PR06MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3aae1a-ea75-4101-7d09-08ddb574bb2d
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bWhEOFJQdTJibmdmVm5TdXo0ZkpzODVvTDloVU55SjlUQVUzdEdMZ2dpbWxw?=
 =?utf-8?B?YWUrWXNMVkNzbUM5TE5xQ0xsWldJa2RqM3dSUGJDYlI3QzI5QnNxSFB1WUVP?=
 =?utf-8?B?T1p0ZjN5OG52VVN4RkdYQXZNdHBYWXN6TlZFZFRkaFFLYU5TRk9nWDRvby80?=
 =?utf-8?B?cTdrQTZ5K0NaN1RFdlV0TVl0RjFGaE5HTWM2WmRmNENFS1E1VXBGRkJucmdB?=
 =?utf-8?B?ZEhRbmVCOUZSS1VWdGhGVE9TMkZRVnhpWUEvdDhPVEFZaU92Snk4VWdjZW1P?=
 =?utf-8?B?bUdodWVQTmE4R0MxemtpLzVFWk9pb0VESVBmK1dpbUlPdzdWb0ZTVVFkMXJt?=
 =?utf-8?B?bWVzRGtEdTVkZHhFSGZMZUhISFFkOEQ5ckszUEdHcG9mYUR2cW01V3AxeVhY?=
 =?utf-8?B?OVF4OTh6RFBzcHFLVkVJL21OaWh5WHVYY2xVUEVRd0dzdnRWbHZnTnNVWUdM?=
 =?utf-8?B?Zm1HdHNQR0RoTUxJWkMrdE1MVitRY2tiSzlmT0wvZVhZU04yTWZ5QXBUV0w5?=
 =?utf-8?B?UUJQemxCaEU5bVdMa0cwZjRVbXRSYmlCRmpxelhGQ3hTcDFpWW0xQ0tEZWw2?=
 =?utf-8?B?NDhFM2hHNktYWTVuTTFMSjFiTkhYRXFGRnJVZk1PVXJuSG8rOHo0aS9seVk5?=
 =?utf-8?B?S2hGMUNGRTVWODhueXRTU0lCOVAxM3ZUUSt1RG14aWVubEs3ZGJudGovMHpJ?=
 =?utf-8?B?eGNlL09lMDRiY1FkU1RjTmEzUjFxVzJWR3BHM0ZrMmszYkZDUEkyK2VUQXNi?=
 =?utf-8?B?Nlp3ajZGMUtQSkFZeG42WWl5dEN0dGJTT0ltSldKZ1VoZjNMN2w0cnJOSVdJ?=
 =?utf-8?B?TnA0b3lHNTFZUStHcWUyNjA1ZUVxZVhXMVVQYnkzcy9WUyt6bG1FVTBRTFlJ?=
 =?utf-8?B?MTVSTks4WjVQVWRsWmNPMHRobGZZL3d4SkJWZ2kzb3Q5Znk0T2ZPUndoam9k?=
 =?utf-8?B?UjU2VXZSNjJNZFpoMTE5UEs3SDgxK2I4Z1BqNmVvYlNSYWFNM0o4VVBZRkFs?=
 =?utf-8?B?TnNjaktOYncrY081WFNsbWtvcnIwbkRra29kMlZ4V21wTXF0TEpmYXk0U2Fk?=
 =?utf-8?B?eWhIRkw4dnJKcDUxTmlhbml6bTQ1TldDUHl5RnJkdW9KcmtqY2RZMGtZT3I5?=
 =?utf-8?B?RWViVnJUa2dWbE9UNm56Z2FBRTFJaWhVeS8zVmlPakJsY1pNY21aUHZxWFNQ?=
 =?utf-8?B?Ym5EK1R1L05WSXBtRFRuZmc2aXYrMnVQRW41TkJ4L1o1b29aZjZFcGdzZXFK?=
 =?utf-8?B?Y0c5ejE5ZDBrOW9DRTdjRDR6MERmM0dpVCtjeTJoSGNSNmpWVWxjdHpjS1Q5?=
 =?utf-8?B?bEpydGRETWwvTEZONkdmR1FmekR0Q2tMbk8rR3Q5VHlxa3VieDFSZ00vWUt5?=
 =?utf-8?B?Si9YR29qRzFnTjl0VHp1aUhaWElGYk1JdVBocTlYUzdvOENlUWsvNkU0c3ND?=
 =?utf-8?B?NUhiZXUwU1greURRc0ZWcVVxbmV5QzZCcDFHTWpWcEJmZjd5ellXWnVjdE9j?=
 =?utf-8?B?Q1pLSFNLUkZ6ZFNhaUlxbmZHOWtDZzk2bDd2cWFBYTV4UW5CdTRJUFgzWlJw?=
 =?utf-8?B?Tlc3NkNpRzFzTFVmYXJmWjNyeFdFYlEyMUR3cnlUT1ZMeUEwT0UyUVpoM0tD?=
 =?utf-8?B?MC9YdnBtb056STR6QnZ0ZXRnTEQ1SFhXY2lhUUhNT25WMS9SY1ZCYWxKZS94?=
 =?utf-8?B?YmRmRUNZUGwrS3NjS1FXeVRjZUVrTEtsb0YxekRaU3pMUzRNSDdQcFFKY3FH?=
 =?utf-8?B?L3dBd3N0NzNHMzUzcnRlNHdrVDhKWEpOVlloNFcrMVZPOFFCcTY2NjJyS2Zh?=
 =?utf-8?B?QlFxMVE2YUtmZERKUnljZzJVSkFWbUZmekRPdHpvb2Rwdjg4MEsyZ3NPZnAw?=
 =?utf-8?B?RHBYTTJ1Z3IyVEhyWVNYVU1zQldJRTRhWWl5aWlBZE5mSVI3M3V5YTFyTjhU?=
 =?utf-8?B?ZEZ0clVkSFljQ3JyRXplWjBkK1BydWFHU0xJUVNTNXFJUkxtUFhVaTREbmJJ?=
 =?utf-8?B?ZTZTT3VUaEhMdnd0SjByR1pTN3FQUjdzV0pzWFNyN3dLajZ3bVBDNnVUZFYv?=
 =?utf-8?Q?/KBq9/?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:18:31.6976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3aae1a-ea75-4101-7d09-08ddb574bb2d
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB10042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 12:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118147

Adding support for handling a complex PKI setup to the signing.bbclass

Since a (soft)HSM can only store a single certificate in one slot, the
relation between a leaf certificate, and it's signing intermediary (or
root) certificate has to be stored outside of the HSM, in the form of
some additional metadata.  This additional data is stored in an
environment variable, which is setup and manipulated by a set of
helper functions: signing_{get,set,has}_ca.

This patch-stack also does some cleanup of now superfluous code parts.

---
V4:
- rebase onto meta-openembedded/master

v3: added use-case to commit message of "signing.bbclass: add signing_get_intermediate_certs"

v3:
- reword commit message and comments following review suggestions
- forsee local.conf overrides for the CA

---

To: jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com
Cc: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com

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
base-commit: 5b4e26adb80784be59e5b82c098ec050c93c1ca4
change-id: 20250618-signing-set-ca-f398259222f5

Best regards,
-- 
Johannes Schneider <johannes.schneider@leica-geosystems.com>


