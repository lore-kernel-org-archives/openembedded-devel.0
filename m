Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D773EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 17:08:48 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.86])
 by mx.groups.io with SMTP id smtpd.web11.124.1687274152609462601
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=orAcU+JU;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.93.86, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UB+JDpU2V3/+1RaKaRfqWIQgef3dp6nsIEKV3I5FM9spdYJtcyJFtB7fvOljnGqsQ1uha71zIh0QQ1UvvyFFuhH7E6K8cxwktR+4k6eGZJMcTTvOcUFKQ+YEdQPc9lpjt7W7psqFo1rAYkwQKSxSlaHw2DckIrZV/KM4H3Snv29a1vkWY++g9Z3+WMR1XvjtprpiDS0nI9qC7n/2TMyNThfXZAyDCwvyY/G7M0QwJ+a2OfM3yYU3Jih9MI3miXwepA6k9Gu9yey98o2c4q7uurwfOVsPEsDgchu/jDjkVUy19V8GL6qwMnEeLlMSSi8iv1F6fZ4Z1s+j5NMD7tYXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlFHoi7FqarkaMHayBd+4sUNDvTUbajpvqucvMoF/B4=;
 b=HlcQgNLHDWX7de30KZxIcUSxRYD2ss6YGofRRG0X4jaOvuH61aOCglu5ygH2/ajA7Oed6Q05KQEZzRlUaMlVwvbCzumu6BXJB3mN+AtzZt3wh1r32ePzhmNsZcqKXQzR60qfZ0JEsyKEj8LuYZnecCQYAGLPzHbJsTBe/2bpqtxtzL9gkE+LivfJtuK2EMV3abMCYKpBsiTCIr2IOI861WzbBCoYKtuhzFgG6IxptgAQpvWZv01ii/EKLjnRsYTjvrzxqdATMD2ekAuzJ2Quw2gI7tVnJnLPPTOVQEMOwJRuq35hfiLRYAARW6tN9mdhOx/aUi9xq9Nt7mPMIhLyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlFHoi7FqarkaMHayBd+4sUNDvTUbajpvqucvMoF/B4=;
 b=orAcU+JU0HBItS0BC5dl8aZyQ2R2ShTPNeehvBYjdmlx8Ic/dtRF0RAV6U7ZL2xY7TorB8BzUp+x4qUotr8TKD9WQEhkLsfUYpB8YzKF/RhWJIoxaD60+0SEN34Fz/VStOr1KOtEYx3nJZ3SixZ42QSbdYWZkYoZXOdsjH4c7d4=
Received: from DS7PR03CA0132.namprd03.prod.outlook.com (2603:10b6:5:3b4::17)
 by IA1PR12MB6555.namprd12.prod.outlook.com (2603:10b6:208:3a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 15:15:50 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:5:3b4:cafe::d2) by DS7PR03CA0132.outlook.office365.com
 (2603:10b6:5:3b4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 15:15:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.27 via Frontend Transport; Tue, 20 Jun 2023 15:15:49 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 10:15:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 08:15:49 -0700
Received: from xcosandeepg41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 20 Jun 2023 10:15:48 -0500
From: "Sandeep Gundlupet Raju" <sandeep.gundlupet-raju@amd.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, <twoerner@gmail.com>, "Sandeep Gundlupet
 Raju" <sandeep.gundlupet-raju@amd.com>
Subject: [meta-oe][PATCH] opencv: Revert fix runtime dependencies
Date: Tue, 20 Jun 2023 09:15:45 -0600
Message-ID: <20230620151545.1740610-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|IA1PR12MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: ea439ece-ee31-4833-2c8b-08db71a13b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0FWAoCwvH76vsVfLQQFnxS52lzcp17lC+KKSSYhwIsk533ne/V/FDunA7eIrazOnnFS7uknBSSKNBPD/v3HCAQBWT/i3L+vemaVe9KeiB+PuumZ3+gpP9uppCOcKaRTUFRuimdglzBwiP6VCV94NEvarxGLm/BgusDKZ5EGmX9Xtz4d2mXLqT+5MRVOIOB5QOkTZUiSDSfgbQ3B12vjvZwJkwmh0KlFqzKJilaWkNQt5OA7mCZNqeA4IZRqAS24z4bTwFqmdFRPZTc0653UbzOo9OyXhuJ93dy8RAAyQgAGjnOuJmtVFaESDQuZJ+j+0RXG1CA3OTrk7q33MJbiuRLfxaGSXvActznq1MWqo7WSVOySq8CvSivXd7a+fnfIbqrhCLHgohT3hpR2NehZAaJDVIFRsU6Yxx9DuxW/UUdI9r1dGws0QSmaorpL0nMy9VVr6oiSdBQNnlZeVvxY5mDpyAP9ev7KSEkExMqAvY0rA3ut1yQw9ce04B0/pZfy2IgukuC9qvbyoI9J+LUljNzq+7MjYAwTtO9srCjmxYvBp3K/vIhoO67G1BaN0TPPC5y7dO8144eZ9ymITOaZ6Ee1lJfbRvxQBgEQjJ3q7wHquAgtbo+8vdg8AtagL/c2JLKimpjF2Jsgi6eZ6pmlguGWiGC/x3nMHfS3n0ZLJiN5TrmdjkDb8toWpM2WKctOhjivYGZASF4PRocbRSp+sm9dGcFGZSpM+j6hrDDF1h0ZP2psmfdo+eAxQWEdhiLQx/AnqeRl+623OIUhZ1mzKdQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(46966006)(36840700001)(40470700004)(478600001)(6666004)(70586007)(70206006)(36756003)(8676002)(4326008)(41300700001)(81166007)(356005)(2616005)(47076005)(40480700001)(83380400001)(426003)(336012)(82310400005)(86362001)(2906002)(5660300002)(110136005)(54906003)(8936002)(316002)(40460700003)(1076003)(26005)(186003)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 15:15:49.8790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea439ece-ee31-4833-2c8b-08db71a13b2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6555
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 17:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103465

This reverts commit 0abf5af3ffd3d13c009a8ffcd5a6f045c36be837

libopencv-ts package is not empty and libopencv_ts libraries are
not all installed in the -dev package, these libraries are needed
for sdk development listed in opencv4.pc file.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 meta-oe/recipes-support/opencv/opencv_4.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb b/meta-oe/recip=
es-support/opencv/opencv_4.7.0.bb
index d02fd34ae..a1fbaaa09 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
@@ -163,7 +163,7 @@ python populate_packages:prepend () {
=20
     metapkg =3D  pn
     d.setVar('ALLOW_EMPTY:' + metapkg, "1")
-    blacklist =3D [ metapkg, "libopencv-ts" ]
+    blacklist =3D [ metapkg ]
     metapkg_rdepends =3D [ ]
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pk=
g.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc'=
) and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):
--=20
2.34.1


