Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326FCC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 05:40:34 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.34])
 by mx.groups.io with SMTP id smtpd.web11.6719.1751002823855822355
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 22:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=HHCmkM/T;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.70.34, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktDf9DpBcNjmTvV8iWRHnAnTjhFBDEtIRRD38RzlaS7UzE0jU+fqb4rqXEcbj9NUNnbB+VEJesoQP+1HOL6NjDgbeKCU7sU+h77KzUN24wZGjc3lsdOC+cCuaBZE+X+2jClz160UbjGaCvx5fqVJ9zT1UkV2vCLgaiTaeq1O8vbsFHKw77TP3D+hOy3p80EIWX0Dk/0t0UbJumFdGezgHf4Kgr8YsAhojfA1bzpy5etXH2I0kMni7W1cBH83HScDxtvB+Q8q9c1w/lzc9rpjRmnbN9BIfqYhmBcW8sO0Kpxv/cgjIYjWhRZn+XhEcWA4cZawMNCKxPAv+pRKXeHC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmo+m9sRFwlBh4kBQAQXHFJK3MgfTx+0VcmzOsNSRCY=;
 b=lVHjDYzqBULcUf/yr6XaHmsJY4skx2i/bI/eed8uzV3EywHYxLDpY5OIqIHgBklqcfNNUiMZ9uBJUP9kyPHhdH3ntCbRWlBmprT6E6CskhnGQ1qYMVN3p5rdEWOuPH3KrxOHbCuLoIrPzOK7ZTFdsLLBa3jglAlT2T/v2X0N5DU1AcQHulGgSSks1XeCA97oSd3ip29WQ26Ru8GmyyLQYAeGgS96FIfOIoylHFpll7XiO+KdAHgtlcXsu++xqd2SyN94i6ueN4Y3YDjhhfTPMIQq6RzWyvhapsEYhtJ0uVt8dbxgjeCvfIr8xAWACWlUs2WS6tMlTqPgFs3sabeSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmo+m9sRFwlBh4kBQAQXHFJK3MgfTx+0VcmzOsNSRCY=;
 b=HHCmkM/TOn5eZIqPBcdf4dkHoZODHGfnZtnYerbSxJSN3R5UEzVn1f9ic7+QqeU5evuJdSrpTbto6vkFXrOtWHYfCvWXmh77WSZdWRsTmRLFwxPn98Sw2JLhTl0yS+OJNeCJoSDSasPilGHIrTOM6Edn3bTq/WS1V9465M26kV4=
Received: from PR1P264CA0107.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cf::20)
 by DB9PR06MB8218.eurprd06.prod.outlook.com (2603:10a6:10:29f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 05:40:18 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:2cf:cafe::86) by PR1P264CA0107.outlook.office365.com
 (2603:10a6:102:2cf::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 05:40:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.1 via Frontend Transport; Fri, 27 Jun 2025 05:40:17 +0000
Received: from [127.0.1.1] ([10.60.34.121]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 27 Jun 2025 07:40:17 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH meta-oe v3 0/6] signing.bbclass: add certificate chain
 handling
Date: Fri, 27 Jun 2025 07:40:14 +0200
Message-Id: <20250627-signing-set-ca-v3-0-030812797c6a@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL4uXmgC/0WNQQrCMBBFryKzdkqTEEldeQ9xEdJJOmITyQRRS
 u9ucOPy8fnvbSBUmQTOhw0qvVi45A7meICw+JwIee4MetR2PCmHwilzTijUMHiMZnLaTlrraKG
 fnpUiv3/CK6zUPBaCWx9iLSu2pZL/+6xRShlt9WCcmyarUOG99GwmGSQsmXimenkQ91KiIh9pt
 MoQygr7/gXiNMvTvAAAAA==
To: jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-OriginalArrivalTime: 27 Jun 2025 05:40:17.0547 (UTC) FILETIME=[F6A66DB0:01DBE725]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|DB9PR06MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: a4847e89-ce49-4222-5c4e-08ddb53d1941
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHF6d0R5bzBDNG9ZTHp1cU44QXhtU0Uzc3JvWEZEQWthUmxnMWEvOTNZUndB?=
 =?utf-8?B?b3BOcyt1UFh6Vy9aZGVhQ0tva1ZUajJidHNSbGkvSGI2V2hGdEFXeEFTd2FD?=
 =?utf-8?B?bmxJdXdVZjVoSTJ0QWVDa1UxdjdJVGZQZkJxcVBSN0w1SkhNU296emJ1RnFM?=
 =?utf-8?B?ZFd6UnJBYXF0dmF0V3J0RzB6NlRsR05oc0lBTFc1K3FJcHFPUDJmKzkySlJS?=
 =?utf-8?B?TjUyY2R5R05GWVJpVVRub3dVRmZmdmFBRzVKVWE1K3VlcVNsdUhyQThIQjAw?=
 =?utf-8?B?MTdaZTh0RitLaDJCb1ZYdE1xOTdaZkFkWVIyL1R1Vk1mNVFGTXJMdXF3NjRD?=
 =?utf-8?B?dENUWk54QUhhbnlzcU81RXFtVHRaTGhkYkcrMTBQUHM4Y2tLRmxsanoyNWNM?=
 =?utf-8?B?R3FtME51WlVqdlRGbFJCMjRERmVJcUk2Y1ViRW9EVGRrUTRvSUNHZlgvNSti?=
 =?utf-8?B?UE1laXNabEFBYlFCOTFmTkpDMU5zaS9HM2IvdTVFN2tqZC9ueXdBclZWUHlF?=
 =?utf-8?B?TExqM2dYZUM5a2QrbnBUR3pTMmQ1SmZYcDZnbWI0VityZzgzTlFjZnlhNjEv?=
 =?utf-8?B?UHdqVjVOTlg1K2pPUUdINVgrSHh0cC91cmRIQUNPUDVTbkdXbUpDcldDNnEy?=
 =?utf-8?B?a283eUV6ZUkwNFdvT2ROeWxPdVdRN0l3aFRRUVdvbldvRmNUUUFwV1lmWUZq?=
 =?utf-8?B?Z3JqWmtZSnBCOW55MFFjemM4ZGxpOTNRdWJnZkU5UkFCZ2ZXSVRwdjJpaldN?=
 =?utf-8?B?L04zd05XcnVvcE82QVBGL0QyS250Z3JzdnlBZWNrT25WWXExYkdqYTcxLzR3?=
 =?utf-8?B?TlBaSHlEazJ2ekU1UGdFbFh5bFJEZXJMczFLZ2xwYXVzajhsV1NBaHUxTldT?=
 =?utf-8?B?Z1Fubm85Q2dTaS9WR0hOb2NIUGh1YTg1Q2t5eVdSam9vbWhJUGR6ak0rNnBG?=
 =?utf-8?B?UXk2a1dFYWJ4UjlMZGpnTGJDTVBwUk9YQlo5alVZRW9nT3J4OTh3UVhGNXdO?=
 =?utf-8?B?REVnUloyQ0d2QmFTTzQrZ3Z3UUxWN2doYmJkd3dSK1dPaFB5WlY1QmgrSWFW?=
 =?utf-8?B?dXJIZ1ZHYmd1UFVsMElQdG1GTlpzb0lKU0hxV3YwT2dwdHRqNGVodWdPeGNr?=
 =?utf-8?B?UzFxUysyTHhpTzFyVjhGb0RRSmE1cll5a29hQ2locDZWVlpzeU5tOENKVTls?=
 =?utf-8?B?V21zR2pBdnJrWkkvOVZUbTFRazlUQU9zQ0JiQWlhTmhVeTBXc2UxemJhREsy?=
 =?utf-8?B?OFRKQVhNR2M2dWR2R2k0aG90T3p2YmxXT3NwMXRrMVVEYlhPb3VKOWVRbyt1?=
 =?utf-8?B?OUFGTlFlTUE1dnA5ZVZHWVZMM1FVNGtFZjhEOUJWbEloV2JoYzVKSmNSTlh2?=
 =?utf-8?B?UmhnTDAvMHNZTDFaUXVjbHA0a1V5QWlnK0orb0xINUo5UjU1RUNIcGtYQlgx?=
 =?utf-8?B?MFNpd2pJa05sSXByQmJnTEwvMUFaN2FjWUJpbXQzS0w3ckcvNjFNY3dlRXVS?=
 =?utf-8?B?RXh2VUFXUDlqNVlJd0lBN1MyOTFkSjBMTWpLU3BkSHFvU1BLQkgrTVQyU0U1?=
 =?utf-8?B?QW9EK2FlZG91dThIdHg5Tm9qYkxxclVBK0ZHbW5GZ3JaMEQzZk53UVkwNlpi?=
 =?utf-8?B?M1dPU1lyUFArSlpkU3lLMzAzcTQ4ejh1T1ZpL21mNU03dUd6ZmVKZGtKSHhp?=
 =?utf-8?B?OHduM0l1dTFxNmJYcUtlRHRUZ1psbGdCdWJJM2lVdU1JRmhTdmg2Y01PZDZE?=
 =?utf-8?B?YjNJc0VaNDNYUmtZUmJxSHFDVXBaUFUxUGhzTGF3R0pxalh0clhZQmUyczd0?=
 =?utf-8?B?RmxyNWNta2hVNENsNVZNdEZkVUlLNzdQSkVwTU1BOTF3RHQzbVZCd29ueVJ1?=
 =?utf-8?B?c3Nzb1ZnRHBwd2RPYzlkSTlBU1JkM3ZjZC9TN0MyUGg1ZE1CUEZtVkpWY09N?=
 =?utf-8?B?NTlrMnU5L0dqa3lUWEVVVzhjSVVhUzFjK2krbDVxMXJNQVRTdVV4V3NrWXBq?=
 =?utf-8?B?a0Y2Vzl5UjBETUhCRlVnME1sZFVteTRtYklzeU9leTdNakEvdUF2TFVWcnF4?=
 =?utf-8?Q?k+jIlc?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 05:40:17.7463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4847e89-ce49-4222-5c4e-08ddb53d1941
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8218
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 05:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118133

Adding support for handling a complex PKI setup to the signing.bbclass

Since a (soft)HSM can only store a single certificate in one slot, the
relation between a leaf certificate, and it's signing intermediary (or
root) certificate has to be stored outside of the HSM, in the form of
some additional metadata.  This additional data is stored in an
environment variable, which is setup and manipulated by a set of
helper functions: signing_{get,set,has}_ca.

This patch-stack also does some cleanup of now superfluous code parts.

---
v4: added use-case to commit message of "signing.bbclass: add signing_get_intermediate_certs"

V3:
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
base-commit: 820047afe48a0d48056f4752defc3d2803c9d906
change-id: 20250618-signing-set-ca-f398259222f5

Best regards,
-- 
Johannes Schneider <johannes.schneider@leica-geosystems.com>


