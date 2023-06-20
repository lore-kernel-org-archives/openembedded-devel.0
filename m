Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A729EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 15:39:35 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.72])
 by mx.groups.io with SMTP id smtpd.web10.699.1687275564910401644
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=FkV9U4Wf;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.212.72, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fN1HlbizkKgz/lIsblZohlIVgTSypgac2Zq6cf1bJNlzCs+/oDhfw8I8Bk9X13U8Dodywo0dudm+KVUhewqHgMG8jQM7hLgESI9RqSCQ9BIAYiz/MgBASI2wKjlArSzBVPGOUzXWXu7DgKTjBIUYyeGDrH0xx7VDr0EoWzC2F3wdYtMEn8RzUQbStTCNvTo+aDxF6KKPg0bJiOUmAWTGhI5pvlRyrqHaTFYguAHtKaJiNWmgH3Kbz+54uCT6pHqfSRTg3mUtTPQ5iPFqc4hqnCi5Jp2+CPyVE3q+13LSMr0Zt9ZiBHpo9VQGNJAsB0PWTCC83tQXINoJYi8IGggVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2ayIP6QZKKfiynJJWLp/k4chg9aDPWplQajPd7pIhY=;
 b=S5QIDdfDDn6ACfCYLwxqwtVhozsW7ClY60Org8MauBb9UOsKTXd/bVBjpgD2UbwT4mkVqn4+Tt5JECdwwsOZfGvVnNXD4JI9AVhwriYhst6NAEXfgI0uVuKKuEl6yVNUN4smU3oRPllGra/SEIgOGwEqJxVHA8Ejh+Wz98GUpv3Zhq4ZBa20WGaVeY3xyzAAy5aBatCfp6X+R7zP9nnygVfHB1iG8KWRcW4eEe9C8S5W9eLSM0hagzOdB6ND0bgfRn1R1VT/RFCbM10PYM1Al2A7fgXW0nf9ny5eWEl2+zdpxP7MFq0ksxxjSnOvCpDP4aOue3TEb4gm+BWC/VRKHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2ayIP6QZKKfiynJJWLp/k4chg9aDPWplQajPd7pIhY=;
 b=FkV9U4WfcLVbWp+pK07KsgRVEShiJ7/PtA2Vjh7YxKMeEuZIgapfCZj9nhIaDFcTL1xC8x1lii3Cs00Uofb6ZIDsBdppRrnJ0X+CqmbSHiPeoe9Z0wkzfBnfJkmNMLbKiR03sbuZEMMSwJKuBHOh+kaSZUcd5E3sn3dlGw7OadM=
Received: from DS7PR03CA0072.namprd03.prod.outlook.com (2603:10b6:5:3bb::17)
 by SJ0PR12MB6992.namprd12.prod.outlook.com (2603:10b6:a03:483::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 15:39:22 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::5a) by DS7PR03CA0072.outlook.office365.com
 (2603:10b6:5:3bb::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 15:39:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.37 via Frontend Transport; Tue, 20 Jun 2023 15:39:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 10:39:20 -0500
Received: from xcosandeepg41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 20 Jun 2023 10:39:19 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, <twoerner@gmail.com>, "Sandeep Gundlupet
 Raju" <sandeep.gundlupet-raju@amd.com>
Subject: [meta-oe][mickledore][PATCH] opencv: Revert fix runtime dependencies
Date: Tue, 20 Jun 2023 09:39:17 -0600
Message-ID: <20230620153917.1749409-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT029:EE_|SJ0PR12MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f4f5f1-4da4-47e0-dc74-08db71a48436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3IYdfIxpgcTKr1CgI7UU8tSWk0XY7uR0kUUL6cWXH18Y7EDcztvqlO6xRrjsEiO167YW59T3X46tvIfbQlG4UKGWxY2WmCwUqdHF7iCxNseS5uqPt62mmk/0dUWqotCJG7JUcZFqhfd+x0ThS3IzBYvCUbpn+aIpLsb7ZNP4jUCf++BGgOaJpcqPubBYpDeEMV/0Ga5ahSG2ku6S1DcCnoBzYj4If5nlraZwUweKfaIcRxWsYl/+Njlg9GdZo+CiL9qZberuS6IrkH0T9LjAykztqk66ke2zNIjranxF4ILjqLsXQ+G4LOou3yMeurZJQsRx1chDyI4lJRypb1k42aaRm8Myfk7oZqCIunsmuDErCJthPkaR8uEE94FrRggxLTIsveFHYr4VlYKseongfZqfs78pnCA/aFCGH3mmBh9omBmesMCKEJIlp/a7JAPDtO4UTrkwXZfU2qKxeeuiu6q1CZrfO1akEBOBFg/BPoFQme9gH7VDVfeqGJWAcQzGg23Gxb7udg2El2kIggzEp7nxWyJ70f0N1eOJ9J/A4zV5gtyfDr8PRANK83wLakn4I9BFOxtbevqPX/wTY/dNcmNWtkGzn4vrJcx0rDn+wS7neHZxHoaQCype521jgC3rUFsMbMsgpwaftd8mkXdDW0ZjmPQL+PD/LD3P1qEuzJKKFPndiioKfknt7z7uaNHaOGs+3WAzXB3T0kDPUYb/5hMY5rAFTDTTHnwX9Ldk3pgGXAYCXbCYnoqXGvqLsCt5TOYYwOAscwPVtscZCmASYw==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(36840700001)(46966006)(40470700004)(83380400001)(478600001)(426003)(336012)(47076005)(86362001)(356005)(54906003)(70586007)(82740400003)(81166007)(316002)(110136005)(26005)(1076003)(4326008)(70206006)(186003)(2616005)(8676002)(8936002)(5660300002)(2906002)(40460700003)(41300700001)(40480700001)(36756003)(36860700001)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 15:39:20.9039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f4f5f1-4da4-47e0-dc74-08db71a48436
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6992
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 15:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103458

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
index 361b00430..bad6f1508 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
@@ -162,7 +162,7 @@ python populate_packages:prepend () {
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


