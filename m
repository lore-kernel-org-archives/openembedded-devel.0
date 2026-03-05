Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E9EF3D337
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:04:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49216.1772730259850009087
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 09:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=W3MOYzXO;
 spf=pass (domain: axis.com, ip: 52.101.65.69, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdqARiuZ6F+DWG8uoH8+kHekPqXg/NKPFqz3jmiEn0A78FsDaLhRwi4hIVOslmK7JT6pzqoHoRmUQv2Ua3zAIVD2UL3aE7k3QGjyil7Eq6qAVyOcYySlKZhqWZ5E26WCsxjOIzJwj6jONRmFboJO1aBsiYOiEet0xe6VJwbEsQwzW0xYRAkTFhMdhDFpfU5RBAsDnAuehmj4zrj5H2HhCoOHhadA/gLhsF36sIFV8JuJtTYN6MqCmmBwXFPZTjK6oXlCG47eSrMp/bL+msioetGz1y6jQjcVAZRdaHbjvb0fllbR5pI4wh/n07u9X8Wmb4KkzoNQTwforz4OhTGQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahYtWRxPtH05ldHb2oKzTJFoueVNAAexSF9rRLCIPtk=;
 b=fM8ufOzbXdYVwSgNC7fPTg27+o1Pp1O/fj9MrkSECmh9D4fRnWJFH6EfnfBVXCr/W46kj/WEkBB6ScIGyWKW+Cny5Smty++QspApsvWLROBDX4kVGsU+qIqIvAwdlHxWcJWrEDwU9qpsA31l7svNQSOSPPD+rTBbHWl8sp05Gtc8Niarc86/14YPzj2i5lO1ncchCdIOXdXnqjKBUJ+KfB5jVIElmAptdDk5sXdgF5YS0lpGGENlHxH4l19VVhIPzMt+dnkMWy5lS3MciN3ngdkfr2ljfrf82vH44kWcpzISNwbYadccrrO4uOhOuOY21pyqSVyHmeqcKaZWN5QSQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahYtWRxPtH05ldHb2oKzTJFoueVNAAexSF9rRLCIPtk=;
 b=W3MOYzXOU5V96t16tUS+t/r7w5+SS8fiURAkPcTc6lrus79uU41aok8IsSwdIUvmSoLIXRs0Ju/rsF5tg9yOyFPAfS2QJtu34uhx+UdMDV10FfVNCTltWFI+bUJNSQCCbzTIaMVCkHc/3XH9XT2NVULude++XwqOvCTPuJEeAAo=
Received: from AS4PR09CA0025.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::15)
 by AS4PR02MB7927.eurprd02.prod.outlook.com (2603:10a6:20b:4b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 17:04:14 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::51) by AS4PR09CA0025.outlook.office365.com
 (2603:10a6:20b:5d4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 17:04:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 17:04:14 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Thu, 5 Mar
 2026 18:04:14 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Thu, 5 Mar
 2026 18:04:14 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 5 Mar 2026 18:04:14 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 3D16C7D9
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Mar 2026 18:04:14 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 337D81204CF; Thu,  5 Mar 2026 18:04:14 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][whinlatter][PATCH] ceres-solver: Don't fail if .git/hooks/commit-msg can't be touched
Date: Thu, 5 Mar 2026 18:04:11 +0100
Message-ID: <20260305170411.3040762-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A792:EE_|AS4PR02MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a425ae-8d79-445a-3893-08de7ad93ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	6kAMNS6iC45312zzzZoApNp2ywiI4ShBTnJINdfHy7T+QKExHV6mA9EOlMTzy2zH7or+L/sXzsZxwx9aYb6PsvwguPmw1I7hAcyTGGU5nUeFPOqXz/Y69g5TalDk0JfT3Vw7hEJFifjDp8AkfpBoNbDmwJpNwybzFog+FnKQsf9onfsajVXULcdqLUj6yT4zJvlL8hA2QfvXslijUgkSugSDjBqdCOX5Ie6dLZKlr+FeiC5C7/8QnKGHOGWh8A+vUxglP1QDFt85IJzlHmmget5P9aBH7gPbLqY2xRosAXkr2TnJtP8CSwGIf93GPqDvvMjU3UqNGuKZolfYClnTsBHd8aPsm1kS7CVXwl3cMWCZzJ7bS07p3/rdDOMS/MLoYUNdZL4OqK+fJgwRsfJgbQ/DI4F79Y2ITHmt4iFP6u2N3TZJO32KHp3ZrBjEAFYmz4ognCa3/QblcEViVsBm/FhtJYLv5nl0GZq4alTwDwo/z4iKwTBc3XUjVztbGzqE7B47ih040zqyDlYsctNQts5ptbxPxvwCZQ7Hlr5Orcxv2owVO9GiYQCfYBf1/VFluF95Ik4TPD5M/Bui6UjfoSqyk2qJCOBS7LoZbuLpltY7pXl1j6cmA7L7V5s2DfgJBOViz/MCsh1nKzNqjSs/0Hmnd5Y9n3IQ+ZOMDSw4HmN2OaOfHg9s8Va05m2vKVjGIS+E/R94fB401CllStIv9A==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yGUi6YCLG+K+D+g1d7q4Ozpu5y8/dINd3SWCIVPYaF6Ft0z7FEHRK7OqKXbRsv5xHgMM2OKagAr1xRKLfjRU6pm374hf9JbR6LaIgCsv1hXBpvkLpGI0uyRiP9rkstEevmaKfixb2/TFZDAoQ1XhheIwCqWdt3mbWYoiVHbQh3g0EjzYozjW0GZkqMJPybb+vCVhONfgkGjnblScqK/j98eLv9AT50BEeKbYfWkU6VsnQ1JQaA2lYIp4U9AW6JR7ITrmW28YGCbsnB5TE5pPF8Y5nRN+mrpRW8mtnofFA9SNZ9fS+DeuYCNfBq9+w7nkkndLUuxzuTjyfisKIudnMsZ0mnaHg8sLVtkCGSW4Dce2x7afjDBY++k0FIu/b1DvmvuSdXWmeyzoZyCJ3tHv17tt8kkhe6dnxKWbXmEovIs9jO8cIuX5Jxxo2Nmok9zH
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:04:14.7324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a425ae-8d79-445a-3893-08de7ad93ae4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB7927
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 17:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124891

The .git/hooks/commit-msg Git hook may already exist and not be
writable. E.g., in our environment it is a symbolic link to a script in
/usr/share.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb b/m=
eta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
index 63500def05..0a8f237180 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
@@ -16,7 +16,7 @@ do_configure:prepend() {
     # will try to fetch https://ceres-solver-review.googlesource.com/tools=
/hooks/commit-msg durind do_configure
     # which sometimes gets stuck (as there is no TIMEOUT set in DOWNLOAD)
     # and we really don't need Gerrit's Change-Id tags when just building =
this
-    touch ${S}/.git/hooks/commit-msg
+    touch ${S}/.git/hooks/commit-msg 2>/dev/null || :
 }
=20
 # We don't want path to eigen3 in ceres-solver RSS to be

