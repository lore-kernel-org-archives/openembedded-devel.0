Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480B9EB64DB
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 15:40:05 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.76])
 by mx.groups.io with SMTP id smtpd.web10.712.1687275599368515951
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=n5tV8nhI;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.76, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSXAPJEWyPu/hnMh0LSKXm4aJCVxikvaAqIyG/ODxnnn6fUgkusQbU8QmUzOqB1LBt+6pGu4WamTjSIjxQ5X8rk6v03uZnfTWYJdrHa0ztZMhSX6Wc4Agei4ticiu8mtDzZ3u4l2Y7BJ17UF4wzAIsh7qu0tHc7ZO8X11aMXh8m4etjbZT2RUF0JExOsc9GXQrD51q05pv4mdujQsnrH1g3fm3gY5wnxegCiWTth4rUHugpEW2oTxbuJAdFdS9dnwZMvuD3iFiUvywDwkZVWjbAHvu8Qill0qaj5BG50rSnfnEY2Lh88SrlPaXI3nLbYUb5gCCdPRcQ+gp/52mBgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlFHoi7FqarkaMHayBd+4sUNDvTUbajpvqucvMoF/B4=;
 b=EHXmRMpYGb+Iki6UXTY1Ti9Xtopz9LEABEebAT9kfWB89BsBCsDWRjBrPqrxJnN+dnX532VwJFrhCwQv5lyQ909eOnwNI2mm9EWjovtvCs3P/KONRXCDWTAU1e2dhkf4DXZG18frprRBI8Axcm9NdTVSro6GmJmAM2O2qe89JbG3UNUG2Xg+vytWdIrPA9/L9Z8pmLt3sJd/nBJCorUQ+7TG717QOmH+YG6hBOQajeflrXZhHdyYxZSquyf4sPJyeVKWB8LiPtDzf8N1Hwh1z9UFnvbUiw0zV12asU76poFSypgdtWAVjkEjp38ZXU9l9wppdsPor15SjWt5TjW+iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlFHoi7FqarkaMHayBd+4sUNDvTUbajpvqucvMoF/B4=;
 b=n5tV8nhIHPJM0TRYyh7+TVDMVKTfNbq6Mkse4wL/DPP6kI8SihjIps83sHhL0cbfhPl2KKlGv/wZn8jrNFAtWptOgAxid4hwMuxqLig843Bx1awI12rkw/DBLjZR5fa228SoQXLM4l4aMZekZbyIqi1FgWHjTfceNccKaYvc7xc=
Received: from DS7PR03CA0091.namprd03.prod.outlook.com (2603:10b6:5:3b7::6) by
 SA1PR12MB6969.namprd12.prod.outlook.com (2603:10b6:806:24c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Tue, 20 Jun
 2023 15:39:56 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::15) by DS7PR03CA0091.outlook.office365.com
 (2603:10b6:5:3b7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21 via Frontend
 Transport; Tue, 20 Jun 2023 15:39:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.37 via Frontend Transport; Tue, 20 Jun 2023 15:39:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 10:39:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 10:39:54 -0500
Received: from xcosandeepg41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 20 Jun 2023 10:39:54 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, <twoerner@gmail.com>, "Sandeep Gundlupet
 Raju" <sandeep.gundlupet-raju@amd.com>
Subject: [meta-oe][PATCH] opencv: Revert fix runtime dependencies
Date: Tue, 20 Jun 2023 09:39:49 -0600
Message-ID: <20230620153949.1749591-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT057:EE_|SA1PR12MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b21de5-66e6-4bc3-ced6-08db71a498fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZmA1JBAd6t24RjO4zmnTE9bXgPzz5Jc6z4QoQ8ecxN7XBNdx6DLj53fg0ERU4Fx5HVEImuqFBBuEj3RYIkAutoYnNmjQ2akVB/TH4M+pVsLoxntBJ+prJ5gYeJ1PtUg7FYwmfdY3Qjgl4F+yOiOw6jJps9UhGlWFts7WERCeG8rrdnTUlKsTsP6LvF0H9kENAWZIQ8ChyH+AuGCdLmwoW3THXGq7KbQ9Xg+EjDanjOeBI9ST7806eBEUrnVWPuT2nZpIkY7GFg4Br/8pNfxg8YbNTK9ByYW4cRzAN4IKlX4cx7YICwEBgGZDfKkdUx+4NZCCq8uJwV0lt9Fai7CD+ToIyPt9ba24xVZDVHQmBr/PYUKnfYOTN92u5sDPCgunOTfVzahdC6BnBiFptpQTn1wRlEjZ4SZRGwb5eUgz+Kh8/ffYBL3F8oB+rnGFsjPlcstI0xlGh+JmV6udtsEZpf2gZk3RX9rfMjTRLAdGeEASvgrVEIbupVoBZHsLS3jbBOcbsTw7668ufObhDNE3HsQruhjabd3Qd1lh65GjZ62CgNc8HWo8VSp9KnyJEb2ycfXiIzCaWg5pd486hBLheVLNV8v7A82KXSUssvSYYF9wVK1gc3O2nrxox4knkdWBCy5dYRoEauH1dGfeCsMZ4CDtE76HUb0ug7JTQbmHpoOpItvmOwnP7rQOOHwYQaJc7BxvMhhvPMNEuwlSvJ2sfGEK92cAgx54ASmD/ybTBEHlVPwK7thshSJ5gN179jKN7o+5+voapcd/Zpx2fyddcA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(70206006)(70586007)(40460700003)(316002)(4326008)(186003)(356005)(81166007)(2616005)(82310400005)(86362001)(26005)(82740400003)(36860700001)(47076005)(1076003)(83380400001)(336012)(426003)(478600001)(110136005)(54906003)(40480700001)(36756003)(2906002)(5660300002)(8936002)(6666004)(8676002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 15:39:55.7687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b21de5-66e6-4bc3-ced6-08db71a498fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6969
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 15:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103459

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


