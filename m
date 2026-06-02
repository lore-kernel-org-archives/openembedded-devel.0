Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FE0CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 18:48:20 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2479.1780426092288167553
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 11:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=GYaOSgF4;
 spf=pass (domain: axis.com, ip: 52.101.70.68, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6MlyBZONq4IBcMzZ5AYUFuZo9t4sPr5wPmPxQUeh+8/KM5nL2Pb9J30SO8YS9arrUKlcTz0zq3QZIKeEk0LQhiYAV7TbZhhFSh5LmeFqEhegIEAxw/6ubsYj9uXwv6P0SNhVFqeFGZtSuiFf7K4UlUfQSgXRlcCmfOAIv2EIQkohhQUtcQVBgXT2jchFqYn4Tn8hBEifpQ/dIlLzrIGQnsJTW8rKlDCvCzXHs6KjgIYBTxRTTkGlNRklDIbF7wYn6RFhH2mlqJseNEnKeclLsFZXZZxDvjieQNPwV5MQ6ceqzteRKV2P9TRetzAWdrc6U6DwrclqoAGDdnQWHSW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6te3QYLK2xvTfdfeDNZ+kby+qkXuKLk03SWEQ4DI45M=;
 b=F46bDuCvqrQThLuAv1pH9sFsRQ1lpSS+wuVONlBkBK1FCnuSUYP2NtDrp5ffSQ0uEcef/7Cot8g7zEGQ1KkQsBrVwQHy/p9O1kNknT7rS1bCPJhPpjCfuKSVcq6NWRSulTj0YkabPeNrbhysHvAZaVjryMRJOLqvtGHMdTAw2GUFyt0Joddnt8xKQ77V7TMwFabO7Da0HDp5cSsAig+o1vXmuuweYKqMvVQeTiqF1lJJD0LtHmmk+Gd8hWP8jti5xvfOAbK2FXGVmTkHtq1dIZxryfM/xLJxWRWBPofEA/z3I0CtpP1+NQhTTlCG+Ot+dmQ12EII/pGpnfmBba7JiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6te3QYLK2xvTfdfeDNZ+kby+qkXuKLk03SWEQ4DI45M=;
 b=GYaOSgF41vahJJrRlQBfsT+K1gqin5efbv5cnuAsLk95hd1ill3Lh7E4TNQJ6ooT2d+/2ph9z1BC7+/Bmy1yh44vGmV9RYon2kS+arZLBhWysaHiohY57aecy7kshkWLNM3+3DM/P5j1M7PeAboF3HDXvyaBVKDRIz40tEO3z0I=
Received: from CWLP265CA0528.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::17)
 by PA1PR02MB10981.eurprd02.prod.outlook.com (2603:10a6:102:48d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 18:48:07 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:400:18c:cafe::6f) by CWLP265CA0528.outlook.office365.com
 (2603:10a6:400:18c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 18:48:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 18:48:07 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 2 Jun
 2026 20:48:06 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 2 Jun
 2026 20:48:06 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 2 Jun 2026 20:48:06 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 8613D1486
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 20:48:06 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 8005C12959C; Tue,  2 Jun 2026 20:48:06 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/1] php: Correct the license to PHP-3.01
Date: Tue, 2 Jun 2026 20:48:00 +0200
Message-ID: <20260602184800.2914800-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019D:EE_|PA1PR02MB10981:EE_
X-MS-Office365-Filtering-Correlation-Id: cf91ad87-1f21-4bb9-1bfe-08dec0d77c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	BfWUCx4owsrDdLnGCjpAwVypnNpuBG3HvgTT7DIXuFA6C7GqVrALjI0X/5sv6PtG8Tj4n8fHLPGr8gfqJ9bTx3a0Rg6nsnNl6hd+9mLEYFipU/+JO58QEcgk9PmkUdtI8GPb0a5OnRfuTSnwdi8V860v/vKDnZ15SKxYff5bn24lsJhkJ+r7q/cYu8lhMaUhQ6UPbApoDuQ8lBIt4x8UqNKPWiH8pDToMD8Scssfy9VkaSNn0kaac5A9zzlac/hBD7yu3PeJaeXu7+tL61XNGvJkM1deFLcLUnN1QhO71InQpr6eFzM/P2KtOfA7YZysrJxRs6aEDQidwx4u0Z1snNcXJuQbES3aaDUtyEqNsQnVbSYZRO9zQex6EbmtswotBBN2nUsdbzZQ6oXf58hppGhuuEOjllQDoUMU3clTcer4G37pXB0R+5HwsL2G4q41vgOeure2MbEkjIHZ9DZ5zC8Fw09cd9nqgPseXcVVkhUOwopc20YZAotciTvKXxIV30PZ+YbQJZGi/ZIF0N8zot9Y/b8DN27bB9kTawQMyd1OLg1X9zD/5mf6GzX0ll8rfseZ9edjoTEss8bPVA9iynkrFmvQNfywmRuoFuzl929CjjHh5pi3/FARiaKAo+5BEghgWp0Aj7soa5E3HjC/0W9+45lAixPIV8UWup5jyOaBclYG5JPSBUvsWWJDO74S
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(18002099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Xo5SLzC301JixZd27pn6KgVlHuNP6Icp7WD6HhUrLMCVacrxsvAO/ucKnzYCSQpX5Q1nm4Q/xCLW04zJnfnlkHDPZi9rEYMVPLyZgfI55UB9ijCMxq1Flu+xvWaECfSUCxML/WqyxlnEg1pNpCBMInwZuGL9JptVuO3h5Hv49XzNboY0FohV/pVxyG/GKZ0vP8f1qd/IIQfk52oxzUwU0czWpwg/1cQkLrJ2jT4LpHTW/Z31x9xweQJrbz8zXuly9lUZRT94auiwDMoR0vydZqhPNxPnO3h8Axwz27xZEaiBkY3KC+5tymUurVU0HPt7LmkhXNCCqUNDIM8GSoyp+4rNTDpEJGHZ/TVuxqJrG7IyGN7k97ViEfRM4xcNyUIfakJzFwc+7f44GDZribLuC8fw1UCiH7C4JKe3MksEIeyhlUfCQkLz7fXFRwNFsCO1
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 18:48:07.0346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf91ad87-1f21-4bb9-1bfe-08dec0d77c66
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB10981
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 18:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127369

The license used by PHP is actually PHP-3.01, not PHP-3.0.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-devtools/php/php_8.5.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.6.bb b/meta-oe/recipes-de=
vtools/php/php_8.5.6.bb
index db5bba9ccc..a78b6baafa 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.6.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "A server-side, HTML-embedded scripting languag=
e"
 HOMEPAGE =3D "https://www.php.net"
 SECTION =3D "console/network"
=20
-LICENSE =3D "PHP-3.0"
+LICENSE =3D "PHP-3.01"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfd469cce1a919f0cc95bab7afb28d19=
d"
=20
 BBCLASSEXTEND =3D "native"

