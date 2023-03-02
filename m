Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136E8C678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 06:56:38 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.64])
 by mx.groups.io with SMTP id smtpd.web10.9174.1677740195317119252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 22:56:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=UCFNw3Rs;
 spf=pass (domain: siemens.com, ip: 40.107.6.64, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmuvdceBe4k6Vg1mPIKL8acAzvVj1d9KadB2H8/NFRcWTFbhCsuYDJcXibqppbcw/o8kKOoZZTbmPjW6H0YuWqoySBAqsM0zk4F37he7o+zGnnKbjy8fE8HOszuMGwh6CteQg9bQ+wS3mPsnbdSeQXAybrI4VqLm8rf316N9htCtUVQJB6gQQwgQHvgmnSqR9L8q3KtvKJka1uJMOBodCEjg1afqDyTuQBYNSks0USVprUNFIESsEAdCpoDo21Ud9XRkBLUO9QT60jJ3BfdeEmOyGVF/ECHA/jIhx6sazcib3O7CjmX3Tnz4R39hF7v3elUXvKIlhVt3HhFeCKHeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaQujgOY30Y2Y/qzxfg3DcM4dpYH20wnRsFjkdIQM90=;
 b=EjXcZKSveomgHG3y0YrehwfKLo2WM0WPZBJst+tCvAWxLVle2feCzRB9Fj84D0DToFZIcdZ6nx0HxlT/h1Z35ZisXdlZTXAh3bGpLuhV8MWuBHqo3HUXW4mf3u9ekpGXMNdEEJRJKFrNgNMRoGiypgCdM5Nw4KXlgfzbgApap+fJw5MZt68i6dglQ46zTdNSTecr0964hCWbbsYKEfXSnZGs6qX24T8x685kRfEjGwnQWyGXJ+Y895w69X/eRzRFna6ZDPLg/C0s91fSJ+IIgRtvk5Wq/bia/ZtDk0LLI9IIpJI2IGJcUHmufJYr5TmUcmeZyW8Bje4zxwl2MVnw1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaQujgOY30Y2Y/qzxfg3DcM4dpYH20wnRsFjkdIQM90=;
 b=UCFNw3RsImnzDr9148hkbhumAyR3t34UxzwFMwSTIYON/pgR+6C5uwtUySb7kOugJL4VcpjmuvgcDlXRezOWVqWjlp1kd+ueTtE7v8EYdS2MaomAcTCsA4/NxiPVvmZ+sXXQ8DyYHNH0O2QkUBNHanx5QZOxIbyik9LEzyktAxpjYQmThjnNH/EJT+Bheok0l9gOWE/kTGNI/cOa9u8iqCqV/arshzw68P6uFEzrq3ltO7P59NpjhrQKX1h5/2tWdgGapQzdLVaP4/mzCp2jHSf9AAd10WIYJConlxpKNjXmp5gEcwUmN/zeEZJzI3O75NWmDVLwLXmghanR0okjHg==
Received: from OS6P279CA0143.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3a::14)
 by DB5PR10MB7796.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Thu, 2 Mar
 2023 06:56:32 +0000
Received: from HE1EUR01FT087.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:3a:cafe::b1) by OS6P279CA0143.outlook.office365.com
 (2603:10a6:e10:3a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Thu, 2 Mar 2023 06:56:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT087.mail.protection.outlook.com (10.152.1.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.19 via Frontend Transport; Thu, 2 Mar 2023 06:56:32 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 2 Mar 2023 07:56:31 +0100
Received: from md3hr6tc.ad001.siemens.net (139.22.132.89) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.21; Thu, 2 Mar 2023 07:56:31 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <akuster808@gmail.com>, Andrej Valek <andrej.valek@siemens.com>
Subject: [meta-oe][kirkstone][PATCH] grpc: upgrade 1.46.6 -> 1.46.7
Date: Thu, 2 Mar 2023 07:56:16 +0100
Message-ID: <20230302065616.25612-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.132.89]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT087:EE_|DB5PR10MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: efe952c3-90dc-4df9-9b90-08db1aeb4193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+pVLcPsb/cjCz/2uUSIthDpV1gYqGjcMxR1NTCtIsWRxOFzbEhcFE1PZ19gmFAj2HcX0t4EgEspaPQ7pZyShGwpXccTWrE9pTXCXEUk67duvcizD9R+KdhSjWR3UCmf5ppRRYep1ujhQlXFO+lZDlhG7gQa0MUjNlk6LrXCdo4V/0oxYRZ9Q9UEu7pgO/LggffyoRDrVB79ey9nEFWmUJPKc82X3TRHIKlTxnvnTR8Ppk27ro5utJLfmrsM4on+5FZhlS7HWE9yUwFXGmhLVXXZ+0f586vL0FjUdvV7uOGSt+iiQeZ1CnhTA5WTVkUcwja0S0udVzkKrneGpk9F4CKBHcsbyHm93XS1Q85j901h8aND2XvDbkIpF2hdLb92MXANDbwGx0pNIIxsgKK9zgQSMQkqiXspGtMZ0r3POKcnbrsUxF2JBC1siEn/7uF07B6CjoxntdLDCLq5BhH8DjK3ExdIA5v3FabN4DN9oudm3loHThpzHHIlFAyUyweCJ6Iej4KJmRaAD/yrQM1aHE+UOrYos/PpDx+caaZnRFzYtEVCELMxYaXXQfHTHxPONB6nNsiUcVxanS4h71MY4tKk94dpA5ZPkKGxBg6vhfmTndJM9G5k2sZoOQmOfJ4cpbuihivzbO3KyFVwUL+SP0p61TGjhiGMVVTS3YdbbpWzzQE4jUhLNmeoshPLgqDJ58EPeXrRxjnukY7cSVN+wBij2pmwZamxkzJy+52Ne51g=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199018)(36840700001)(46966006)(40470700004)(26005)(356005)(2616005)(956004)(316002)(40480700001)(86362001)(186003)(36860700001)(478600001)(36756003)(16526019)(54906003)(70206006)(70586007)(6666004)(6916009)(40460700003)(107886003)(8676002)(1076003)(41300700001)(4326008)(336012)(81166007)(2906002)(82960400001)(82740400003)(8936002)(47076005)(44832011)(83380400001)(5660300002)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 06:56:32.1792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efe952c3-90dc-4df9-9b90-08db1aeb4193
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT087.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7796
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 06:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101326

Includes fix for CVE-2023-0286

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../recipes-devtools/grpc/{grpc_1.46.6.bb =3D> grpc_1.46.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.46.6.bb =3D> grpc_1.46.7.bb} =
(98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.46.6.bb b/meta-oe/recipes=
-devtools/grpc/grpc_1.46.7.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.46.6.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.46.7.bb
index 7cf27d1e0..15bf05919 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.46.6.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.46.7.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN}-dev:append:class-native =3D " ${PN}-compil=
er"
 # RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
=20
 S =3D "${WORKDIR}/git"
-SRCREV_grpc =3D "af855eb64eea02d2f7b68d49c3d4d7a263649104"
+SRCREV_grpc =3D "02384e39185f109bd299eb8482306229967dc970"
 BRANCH =3D "v1.46.x"
 SRC_URI =3D "git://github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgrpc;b=
ranch=3D${BRANCH} \
            file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYN=
C.patch \
--=20
2.39.2


