Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67539CCF9E4
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:47:11 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.90])
 by mx.groups.io with SMTP id smtpd.web11.16444.1761212822370778109
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=TOaSZ226;
 spf=pass (domain: phytec.de, ip: 52.101.69.90, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8X7fhq8cjXgsY8mcSW58y8y3ne5M33UMrSbL24B2pO5DAHjOttASlE1dvAM2NulzPf7ifabXbHULtT1rXV0sdQuwP4Yx5dfAjgSzau+y0sex/WA4nwrpYRkmjKehsgYxEcH6ixz1MRfFiN5xxoWT8KAJZZxCZnj563O75xAHbpgqi5bQJTBdgN6WS/8Lll0uswKCVKYNyCy3gGVuDgMzM8sBEzuRz4QGCWg98XsZ8cCHkp3dwCZCkrGnXcPHrYqeHy7SeA+4jI8sGvgStZSfnU+diNdBCIzJqOn5BNb6LA6chewFlwiSNuKlcCRxOK+Sikd9T2CngpzDR8rPAHehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgNXT01JmJDLlj3RChIwMzFTrTquNUJqNGtQdt/mt40=;
 b=nbTi/GmcBjKTP5FIkmD768Rfpk93VR+pENCVNOIualsNkMqIXKSwhSGYBdJk5mmtvtnGAx7HYsVWAlpSAn18XPShiM5GHYC0bRb27lMTDSvNHtJ4/qL4YGkl7y00Ai0S+MI8diM2Di0EyV15Wgm7rIdXXLeSR35wlA3PNUvULbp8mx39YcPdZqd1tzU3TgQRJrj3dyLNLhOT0sc2hpQvnZ2eViu5ZVD7MPGpkIUFz9DqrOn4VXAFENzpfXev+LuHR3TdF9K2vpShR0YzfeevdDB/EVTTzM/eI9cxJK+cxZg5zOmELEyLwzqLDua/ey2zTY/8pIC3Pw2RpJS3RecEkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgNXT01JmJDLlj3RChIwMzFTrTquNUJqNGtQdt/mt40=;
 b=TOaSZ226mLjjj/i5MqsSpBGop1rlIMMIUUqt8L73Jk+BmutiR063UBNquiRtzyI8X05nXLWUPSlx7OPGZ5fdaXXn5oOFk+cxC7lh6SZ8BS9NyC0M/o0GJqBKOZdOj+JXpcmqqxMDvta5y01g4JK11OLhoX3cVx+W/E9UkCWDcs/luZ1Ym+R8PEV59zhfraQO9WauSgkcbmlwG+ltgR7g54rsvtD8FSnkVw+xdlpytWWJQUoJP5zpv0qvOPEEzcnxZOXj5AjeG1wjAlU93+qRYcnIkhFG6cQyE8jIpgQqPwyixsTWP5ZDa3IVBeEnHff836HUNt6zOTYQqDD+yhnjCg==
Received: from DUZPR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::16) by VI0P195MB2835.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:2bc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 09:46:57 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::c9) by DUZPR01CA0047.outlook.office365.com
 (2603:10a6:10:469::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 09:47:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 09:46:57 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 23 Oct
 2025 11:46:55 +0200
From: Martin Schwan <m.schwan@phytec.de>
Date: Thu, 23 Oct 2025 11:46:33 +0200
Subject: [PATCH 5/8] python3-questionary: Add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251023-wip-thingsboard-gateway-master-v1-5-570de0ecafb2@phytec.de>
References: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
In-Reply-To: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <raj.khem@gmail.com>,
	<upstream@lists.phytec.de>, Martin Schwan <m.schwan@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|VI0P195MB2835:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6e8b8d-ec17-4db9-f4aa-08de12191b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OG1PTXo4R0EreU5yRWV6ZWpkK1dTMTRNeStmc3JsVFJqUVViNWErRW12Znpa?=
 =?utf-8?B?OGNBSEVyNXhDL1hrclB0RXZDNm1qZVErTzBFZ3pFMTZSbzREdW5HYXUxUTVD?=
 =?utf-8?B?eUVXK0MxRGZPeGxrT3JuQXJDQncvdmxSbHc0VU5XeWhYY3lrTGN6WVo1YWhY?=
 =?utf-8?B?SlVuTGhDYW9MR01LdjgrT21xdnptTTFqWWdWdTVFOVROTWdHVTl3cTJDRUtu?=
 =?utf-8?B?czQxRTZRNFdBb2pXZllSU0N2Zm1OZHhUVjJwanl6elczdVVGM0pPTkYyODFr?=
 =?utf-8?B?elA4T2VtZUZERjFJekd6NXVyY1BUTHFjSGo1RWdrdXFNaFkrZGRBZDZaTDU4?=
 =?utf-8?B?dzRQZDM3TDV0Vmh6RDgvNTVweFprRFdRUm9nSjQvUFArVTYwS3BLNDdicnJD?=
 =?utf-8?B?K3JvNS9MYTlSV2tUZmQ4cVZLYkdwaUtqZEgzVzZmTVFNaFVCdGU3bGRWOGhi?=
 =?utf-8?B?SnFDWmxmcm4xbWdnNUxGWTdqUUpLdmFTeWNrKyt3UFl5VnBxRXdXeGRvcGRj?=
 =?utf-8?B?Z2gva3puTFo5VzlMTkIxRmtLd0JZazJMNVV3OE1DaXo1UytpTzVvSEk4RmY3?=
 =?utf-8?B?OHBDemsydG5Xb2E5VVV1NzZQSFlZblhaajE0R3hPVEJKZmxVaWV1aXJJam1K?=
 =?utf-8?B?d1NPajlCR0VkOUlSQUVUZDQ3WW5sVXlSa1hCMUdQaGRteUdvaStLaEI4QmtK?=
 =?utf-8?B?Mk1vRHVwZitsNFc4SE1kNGJvTTM2ZWNhRnIrY0pmekluL2laenhKL3N6RHpw?=
 =?utf-8?B?NHBWYkJQYis3MkZrb0ZtUW5SRUxibDhTczBzKzJVK21lNU5OWFFnZW1kMDRP?=
 =?utf-8?B?MktrUUlYVXo3alcwbHpCUFV0RXYzWElhNzJXZDE3MzNiMFJuSlRlR2h1NG04?=
 =?utf-8?B?VU92Wm9FWDRnaVVVbDVIdlNYZzZGclI0K2JSc2V0TEh3SjhOT0pBaS9weC9p?=
 =?utf-8?B?R29BZXBpY05VZWNsWGZTMkhra1J2SUZVTTNmdExOMFJOZU56Wm9WWjFvSnpI?=
 =?utf-8?B?QmV5NkI2VFA2YlhQalpES0gwczYzWkFZa2JMbkNFUkMvMVlseTl2YjQzbFlq?=
 =?utf-8?B?UmtxMUVWK0hOQzNhbmtqL1lYQmgvZkcyTVlNKzhIQ1lrQ254NXdHNWJoUE9P?=
 =?utf-8?B?SzdLeWo0bHNKYUJhZGtXNEJvZ2dPL3hSTE01cEtsN2U0Tko1dWEyd3RKdElS?=
 =?utf-8?B?OSt1U0lXTXZ1a0JRTzlneWhJY2R4d3k1cnRwK1dWamdMbXhVYTJLcEVXL01F?=
 =?utf-8?B?K2NBK0Q3Tk51cVBsYm8vMGdzNEZ4MndXOUdWYnJaR0VjZzh5eVkrRlcydlBv?=
 =?utf-8?B?NS93VW53b1lYbXZDeEd0ZFhhMlFHZUdoY2IrVUNYMHYvTUFSQ3p4MStrSUlO?=
 =?utf-8?B?cUhCYVA2N0ZvRStKaUdDeXJKaDlEc2c0M3hPa1I3NTQzNFZubWE1T0FFTnNo?=
 =?utf-8?B?cm8wd0Z1VXdXdUxjUUlaNWdIVTN6S0tYc083blNDSmpoaGNYKzVpRDkwVm43?=
 =?utf-8?B?UDdDckhwaUFZekMyQWxCODVmT05Qc1ZjVmNkSlF3bzlQWUpFN2poZXo3TVpV?=
 =?utf-8?B?dzJqZWIrZUtIK3hRK0twVDd4ck5UMnpGTlljVk1UQ2tNR20yL21QRkZLZDZy?=
 =?utf-8?B?a2hwYldxVElJMlpZUnNkb1dzNzNyRlBxaDE0TFVybTVXVHc3VCtCNWxlQWZj?=
 =?utf-8?B?RFV4S1QzVnQra1BvRm92cUpRZTVYWXJjdHVvR2QvRkpBeUZ2MkpPNWRMYUNs?=
 =?utf-8?B?VW9TODIxZ1VhcE5yOStGSENNNmZ2dUNSclB3NjkwdXlmNW55TnYzOVVqVlJa?=
 =?utf-8?B?dUd6aUJIQ0Rod0pvWlZGS0twTTBJbEo1TlRzeXJLNXZQR3YvRGc4Ky81Z00r?=
 =?utf-8?B?NVhpdWRkOFFwL1plMTZuUUJ4dVdUeXhEQjJ2Y2tseDFrcWo2YXdESFhuQmdO?=
 =?utf-8?B?Tk4rMU8vcmhiejhiNHB0VnYvbzJyeWJrT0NPanNTZDN2K2dYUTJyT0lZV2tz?=
 =?utf-8?B?UXV6bEFCb2k2SCtNZmc2N1I5Z1hvNEgzM3A1enZWR3N1bkY4R0tlNXRZOWVO?=
 =?utf-8?B?c2V1UHVYNzUwOWJ2SmNWZ3ZzOURXK3g0VDhGSFIyMEZsUm55MzcweXBYOVh6?=
 =?utf-8?Q?g/FU=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:46:57.4167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6e8b8d-ec17-4db9-f4aa-08de12191b4f
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB2835
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 09:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120925

Python library to build pretty command line user prompts. Easy to use
multi-select lists, confirmations, free text prompts.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 .../recipes-devtools/python/python3-questionary_2.1.1.bb      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-questionary_2.1.1.bb b/meta-python/recipes-devtools/python/python3-questionary_2.1.1.bb
new file mode 100644
index 0000000000000000000000000000000000000000..a7120dc619768944bf0d84644178f62784245f23
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-questionary_2.1.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Python library to build pretty command line user prompts. Easy to \
+           use multi-select lists, confirmations, free text prompts."
+HOMEPAGE = "https://github.com/tmbo/questionary"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=19f0688967ec2b2624ee04c0136daae7"
+
+inherit pypi python_poetry_core
+
+SRC_URI[sha256sum] = "3d7e980292bb0107abaa79c68dd3eee3c561b83a0f89ae482860b181c8bd412d"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.25.1


