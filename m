Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FF6C4167B
	for <webhook@archiver.kernel.org>; Sun, 26 Nov 2023 05:54:58 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.48])
 by mx.groups.io with SMTP id smtpd.web10.48699.1700978091547564632
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Nov 2023 21:54:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=kkf7OOI7;
 spf=pass (domain: axis.com, ip: 40.107.105.48, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBosBiAWtLBpuM7nOoVpdQpFAfy4xrsFqx5vShU6tUbkbUP8UumU3wFb8RpPseospU3pKkPYoXuIPVNnLaMDFcJQYUYnd0Mtz3nD3QRpN19gfE+G1/pMlOcmDGTny+Ce/GPl6Vwqshc/lxz7LK7XWxg4MJ7V5wK1vA9Tp1ClAeYWKHh7jDW6ARipZlo7puZdr59xOaFplneIkg0aFWpL5YDLMm8VmsbgKSAp9p0uTE85D/PBR5V7/bbtYIdhPKlizknA33bWX2p0Ewpw1CBf5dgFtAMCxFwXM5HTLnr/dG+Zsdocmr0+Ko2DKkQlZsUr9g5UDsdHlk4c3J7SWOQLKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSXbuvk/kN/ibyX4PZ8qmhAAwGfVfouDJn8F4um0EK4=;
 b=hoisAEOXMR622otVv5NScwzUtQn9USRHzC8udxNbgl9RynCDSDZ44vCMdSdRrtwMHyTaw3rxpaQ37NdpiyxtcdBXfmueKiLUdeTG4BTUl1HqOi1qGBkm4h5DC2hXrNd/h82aXC/mXGNaMlOKE2mp6C/ZObkUTNVLOfJRNIPO/icBDXr6LAokbwjkF0EkXjYJT9s0HODL5E5UBT3oiDOg5ankOLAU4wMchzhUtyHR5GinW7U3CJKCuQkqAoJqmCbSOV+QEZThBvCVQGw1Yq/rvUB3CzKESqg7jzR1e1ATAeEtA3IaBguPPF2prlLmL2VDNti+vQ75UV23snq8oS0tow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSXbuvk/kN/ibyX4PZ8qmhAAwGfVfouDJn8F4um0EK4=;
 b=kkf7OOI7jqwgA1nRzxL3RnoZRNq1joRM4sURSVE74jPCyecfBTTVycPAftGtaBSmKOqGbC3fBV0AhUB5WmDG2zwO8eP1LMNHl7oS3G1D+j9oogba/BcmGkzFg49Gg8LxJFjGoDALlPFCQCXUn+tw/fkIH9uSIWwMRtH349xe06Y=
Received: from DB8PR03CA0024.eurprd03.prod.outlook.com (2603:10a6:10:be::37)
 by PA4PR02MB6669.eurprd02.prod.outlook.com (2603:10a6:102:f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.25; Sun, 26 Nov
 2023 05:54:47 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::be) by DB8PR03CA0024.outlook.office365.com
 (2603:10a6:10:be::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.25 via Frontend
 Transport; Sun, 26 Nov 2023 05:54:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Sun, 26 Nov 2023 05:54:46 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 26 Nov
 2023 06:54:46 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 26 Nov 2023 06:54:46 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6A690EA99
	for <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 06:54:46 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3AQ5skrC2844081
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 06:54:46 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3AQ5sjLD2844078
	for openembedded-devel@lists.openembedded.org; Sun, 26 Nov 2023 06:54:45 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] redis: Inherit pkgconfig
Date: Sun, 26 Nov 2023 06:54:40 +0100
Message-ID: <20231126055440.2844048-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|PA4PR02MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 9325639e-01b1-4f26-d1fc-08dbee443232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p2462KXPJyoLoyyEUvEzSYVvSXJoww2SbkqS2PDtSV+L2jzxA5+hz180BloE8hPncdi6yYQdRyiHksVCCwbC2t9FKO0+DHcsO7hM+C8XV9ZK8mdtMJLm8MXKkXX7bMustxdkCoWkM0a4m9l7axXsC5CHJB9Xvuwk7/Jm7I3T334iTtVJJ8q6Fe0Hym6sRy0wKli6I/DQ795InIKQof6a16KMxqoJ4nZN3gbo8k60k5Lv+4hFmLmKAeTq+A6rdIS6iwfQBzw/uBmRDUoUDDc7lQUwiIdw4Vz9jVs1+oENxyV/a7/u9FVm3WLj7YFoN1AX98W7ps5sm02uSJZgEJotvw/3PUf5WPt7tOxYj1roDGPWPfmZxJquhaNVvt/+PUxdbe+y/1GT3HTDIZV1F9dkqZce2l0JvRsHG0i8tDMETvbQVc2/BHMJPNBHUZnR0mpk7U3RfBo4DJIzELn/QJxaRNf0zfJiWzssaMNhv5t/D6JgYl0rHcTwKocNtzaNkV+dGp+SS/LmXAliK+t8m2yn65P7SQlnlpvQqR+DIYmpY+7hoP6o4GcEQp0nLUXZhICUJta3hwBVyGu1mJiQ1OPHUkBne+6FF9Yk7jkhtGbS2pWSigIEaaBMzeSw7HJjrpK9FDd+yrMS+SCGyxnxhxCr6kWVbTtpiFNhROg2S+KhKtwgXOMSNKlpfUD8Uk+dx6n4AkosCO7YK65QE3zpQ1Nc5tfXadFKAIV6lOXPM7cmvk4=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39850400004)(230922051799003)(64100799003)(82310400011)(186009)(1800799012)(451199024)(46966006)(36840700001)(1076003)(336012)(426003)(2616005)(26005)(478600001)(6666004)(36860700001)(70206006)(47076005)(83380400001)(5660300002)(4744005)(2906002)(8676002)(8936002)(41300700001)(6916009)(42186006)(316002)(70586007)(356005)(81166007)(82740400003)(36756003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2023 05:54:46.9810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9325639e-01b1-4f26-d1fc-08dbee443232
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6669
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 05:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107050

The Makefile uses pkg-config if USE_SYSTEMD is "yes".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-extended/redis/redis_7.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.2.bb b/meta-oe/recipe=
s-extended/redis/redis_7.2.2.bb
index 44fb01bc8..759119a6d 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.2.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.tar.=
gz \
            "
 SRC_URI[sha256sum] =3D "ca999be08800edc6d265379c4c7aafad92f0ee400692e4e2d6=
9829ab4b4c3d08"
=20
-inherit autotools-brokensep update-rc.d systemd useradd
+inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
=20
 FINAL_LIBS:x86:toolchain-clang =3D "-latomic"
 FINAL_LIBS:riscv32:toolchain-clang =3D "-latomic"

