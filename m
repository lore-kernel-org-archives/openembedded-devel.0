Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CF1C38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 14:19:10 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.58])
 by mx.groups.io with SMTP id smtpd.web11.102955.1674829143182195946
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jan 2023 06:19:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=tAmK41H0;
 spf=pass (domain: siemens.com, ip: 40.107.241.58, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkIRRooL46kdtNWENOXsr/hFdqH9Y4mVbbaCgIUjYGo8BVqOGRu+7q83m1lE7nz5p7TW6f8jyBvDpGGUFMCMlmTodDlF+LCUALLgOGiLtQrPS4J5XmQpbP8AW0I10R1AVo7iCeAuPAjmkz/V2/ZkiIyPzmmWZ1AIL7Yt/W2TUTsLvCvhAJ58LPU5jYwHp+mbWPiFpzBh+bnGtAkzjgFttQzahAuijxtbDccBGIptj5CKBNUMjAJsWg/QLeEHP1QYNIadmO3kHfkLTl8GPImlgjuvfJ+CnO7zNwIeipprIPswrdFg5zs7QliA1a9pq3BDou4lDGWTy+N1lD91vesgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wz9rOouUTuJ+q7h8LdgKF7Ipiw/b0WQSJEK5e2ybfKg=;
 b=Bxpf7TI9HSmdCBHwJaxdSRs6ITJb9D5GZbd+DIFq19Z3fDUteb2L9EGhHXlnxrQFOMAM9I8P3tZM/7qO5DOPu1VU7I1HaIV7f6k64PBtWxhRthcsEDFQXVxJP8SQZDmLgXZceUVapE8riJFHhldE6pyTteKM9kfOVP8X6RtAnQ+BjK3yMWCmSOSb5mxNYmAjo+Jv9W96+WSb9Iy3PHZO8BK8G7+7G8cdClx7totoi/eZe9u1oqaxZ2QKoYck9LwZO7RabRI6imyZpWbcYIxxDf/mAHaPgpsYaGt7RQUSl6DCN82vS2MAHPuqJGiVGKJ3ivJWAmekPvMH2r9/BtP+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz9rOouUTuJ+q7h8LdgKF7Ipiw/b0WQSJEK5e2ybfKg=;
 b=tAmK41H022c9wsNqMF/UVWkzPtfQH/o91BnvTI9yS+DpnFEVgU7dYaGLiIcLGvycIHB23OgMsdNYwbX0rgX4Qbawi2E0HG3pPyWAVKgAowsDpoGsGw7noeiAhHo1ZPJSI31XE6XZ0dgzxwwfoFYzbq+MkHNRrbSBJmMyPfreRTERPMkqbd+S+eTt2doVtmU5GuOXKGgr7H8ClEs+uBcP5EuDfPylvP0JguCHTRifwEFBxbvgKtqPMQziCaj2YMp8wUys9ZbtLVIV/5cOhjjiUdqL711MJ/Qwvq/fuRfnjFFMjARxgo+Mdku3Ey1ICI5oxVOkDwyVgmycfljs+6sMOQ==
Received: from DB6PR1001CA0047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::33)
 by PAVPR10MB7235.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Fri, 27 Jan
 2023 14:19:00 +0000
Received: from DB5EUR01FT102.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::c3) by DB6PR1001CA0047.outlook.office365.com
 (2603:10a6:4:55::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Fri, 27 Jan 2023 14:19:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 DB5EUR01FT102.mail.protection.outlook.com (10.152.5.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.23 via Frontend Transport; Fri, 27 Jan 2023 14:18:59 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Fri, 27 Jan 2023 15:18:59 +0100
Received: from md3hr6tc.ad001.siemens.net (167.87.25.158) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Fri, 27 Jan 2023 15:18:59 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <akuster808@gmail.com>, <randy.macleod@windriver.com>, Andrej Valek
	<andrej.valek@siemens.com>
Subject: [meta-oe][kirkstone][PATCH] grpc: upgrade 1.45.2 -> 1.46.6
Date: Fri, 27 Jan 2023 15:13:19 +0100
Message-ID: <20230127141319.102287-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.25.158]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT102:EE_|PAVPR10MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab577cb-9206-4147-c522-08db00716f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2M/FztmlN7O+qOTD0O6lqU+FWchj4syXDfY97b1y0++v8T3X1mGyMw7ksCKqLQLEr1EFmwAXyYJlw0x/4Kex983Pa3UaWtNRlvCC7pUqOzz0WKIcqxesaKqPkWhiLm4CfbMd00EOo4GcxWU/HW45PaEQr2093fXImjRvNulFmEDnJvWzGP0ID3JpuJetaCGf7vMdI/Eav2U9p0psW0qig7z2yhw/HWTKPY3FP0H8rAPMGq7PB7oCHthY10MfZc4/kJHBQN+ThMweAjH1XlmbatgDhb3msa6asmC22H/lOu/Rw2/OhhsyBDmn7C2cYpyCN0Ys6NTyKRGctaiyu48W3G6XVE5WDOe334gtOvcVV8LgFbLegXRornXrTLn1RtkZ/FKuD6wy8tR0l2mUhzwaDTALH/kmEmE8/E3UZyJTdrP84LLMITBWbc/Xm09YUziheXO4mZZ73Z0i1IhEOkxI8kpTsKi//O+Ne8aNuYLJw1f+XHzMLpz5uFhflck0y0GsPJtFPDcHVac4VtdqBVEozw3KPsXoO3t41/IJbmGqxVwf+JIDM/FN7s6hRRRa/NIqjJvPZTy8YqDCsWbI4XrnUPdZGSMptB1up2ExFJMYamrZBXfAssvaGQUx8cuyDiH9LBkylRpdELIwZgBP6sr9F5OgPaMRr34Txxr3G3Oqso+4P2TqdTKzuLhMbE/jJ8gcxLWZ6KTtG9v7v7UMdStw3zzKA6+AKi1Xcka8m0DLIjY=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199018)(46966006)(36840700001)(40470700004)(5660300002)(16526019)(4326008)(2906002)(70586007)(6916009)(186003)(8676002)(70206006)(8936002)(41300700001)(83380400001)(107886003)(478600001)(336012)(6666004)(1076003)(956004)(2616005)(26005)(316002)(44832011)(82310400005)(47076005)(82960400001)(82740400003)(54906003)(81166007)(356005)(86362001)(40460700003)(40480700001)(36860700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 14:18:59.8258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab577cb-9206-4147-c522-08db00716f23
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT102.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7235
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 14:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100822

Backporting the version from master (1.50.1) would a big risk. So use the
version 1.46.6 which also includes fixes of bundled z-lib library.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../recipes-devtools/grpc/{grpc_1.45.2.bb =3D> grpc_1.46.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.45.2.bb =3D> grpc_1.46.6.bb} =
(97%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb b/meta-oe/recipes=
-devtools/grpc/grpc_1.46.6.bb
similarity index 97%
rename from meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.46.6.bb
index c2f952fc6..7cf27d1e0 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.46.6.bb
@@ -20,8 +20,8 @@ RDEPENDS:${PN}-dev:append:class-native =3D " ${PN}-compil=
er"
 # RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
=20
 S =3D "${WORKDIR}/git"
-SRCREV_grpc =3D "b39ffcc425ea990a537f98ec6fe6a1dcb90470d7"
-BRANCH =3D "v1.45.x"
+SRCREV_grpc =3D "af855eb64eea02d2f7b68d49c3d4d7a263649104"
+BRANCH =3D "v1.46.x"
 SRC_URI =3D "git://github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgrpc;b=
ranch=3D${BRANCH} \
            file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYN=
C.patch \
            file://0001-cmake-add-separate-export-for-plugin-targets.patch =
\
--=20
2.34.3


