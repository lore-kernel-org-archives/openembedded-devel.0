Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.75])
 by mx.groups.io with SMTP id smtpd.web12.1089.1587711370682902602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2020 23:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=iCrddwEZ;
 spf=pass (domain: nxp.com, ip: 40.107.0.75, mailfrom: ting.liu@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2xQoLOdiR/3BD5RFxRwtCXMjhbj7qgAigx9jctb4KndBI4+2Ifp54/ToWFvQfyYNiJgoXm7P39bFMavOld1LpEqt3sOTc+SzPvXtqjsnYIC59vAwtcntgK9RupVZn4kPJUBBMTbz/zJxYho37ci18rvsDJqlSomw6jwCuZ9BafLgPmgoLJT4fHxc3wG0m7g8Up98YJkaDTDCvjgChFtJNa+yIeGU+R8KQlpbmG8SiOUfOg0ZFwwcTP7G+PMY58qIcm9U4hXrsIsgMFEepIR26HVDXRE5layQ3Ec4mH+ZWRKbk7Ntg8TNBxkbe4sHexvOQ6MyiDPy26lucfEK/Kjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+3D0wUafnQEXzfmXt8MK9XYGXUWj+O4I3GV8CqOWyc=;
 b=T0cvzkG2qfF1nrUOTVVB8447i3MNqsDQnKysDekAZ/vBaWK2smOLRn/DJKpkRgv3EEef9Iz/auF8ytRYlhFg0R4rcN8aL3nAaYcyHbwMBUIOxk01twEQw+keAUnmfXR08ZZ3xKmEBkNGLa61IQxM26wVoVVNrkxKONR3ip9a+uzosrv8XMvL6vmu6Qj2y4cIbcIBMj7inJShKYYCANxMCdRy7BoHNNoip2EPyvLTFGIpHBfP1eIJQ0b5ISEyhtDj3uquLZEZzlO7Pv6O57MwSH6pseH2boeO0SKTQ49DdvyLKNlpYI57Ajldg1jCFDvMBW4iN5haWEeuaWis4vzElg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+3D0wUafnQEXzfmXt8MK9XYGXUWj+O4I3GV8CqOWyc=;
 b=iCrddwEZzX+BIjh79T9tKNr5tHikbZHHgvuqdFBM009KV1xRFthOVD5pqOVDQfozZrVzdULnQQX9ydm8NA1zx8SICqzI2jkVEUZUlw5NY303/ATtg79ECL4M0FYR4OwX5pqsHKpuLk5pIgJQ6SDcO2IRMLn2KsiBJ0YFp9NeqDg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=ting.liu@nxp.com; 
Received: from VI1PR0402MB3341.eurprd04.prod.outlook.com (2603:10a6:803:f::11)
 by VI1PR0402MB3712.eurprd04.prod.outlook.com (2603:10a6:803:1c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 06:56:08 +0000
Received: from VI1PR0402MB3341.eurprd04.prod.outlook.com
 ([fe80::3832:d1ae:f6d6:aa1a]) by VI1PR0402MB3341.eurprd04.prod.outlook.com
 ([fe80::3832:d1ae:f6d6:aa1a%4]) with mapi id 15.20.2937.020; Fri, 24 Apr 2020
 06:56:08 +0000
From: "Ting Liu" <ting.liu@nxp.com>
To: openembedded-devel@lists.openembedded.org
CC: Ting Liu <ting.liu@nxp.com>
Subject: [oe] [meta-oe][PATCH] cjson: add recipe for v1.7.13
Date: Fri, 24 Apr 2020 14:55:45 +0800
Message-ID: <20200424065545.28012-1-ting.liu@nxp.com>
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR0401CA0016.apcprd04.prod.outlook.com
 (2603:1096:3:1::26) To VI1PR0402MB3341.eurprd04.prod.outlook.com
 (2603:10a6:803:f::11)
Return-Path: ting.liu@nxp.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8e5254c4-58cf-4449-0570-08d7e81c905e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3712:|VI1PR0402MB3712:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0402MB37120D3F49B5D68D0A53C2BD99D00@VI1PR0402MB3712.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(66476007)(8676002)(316002)(6916009)(8936002)(81156014)(52116002)(36756003)(6666004)(5660300002)(6506007)(6486002)(66946007)(478600001)(4326008)(966005)(86362001)(66556008)(2616005)(1076003)(9686003)(2906002)(6512007)(186003)(26005);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ydYp/aJm3O/DHVeHqzHGfvtHvd/0s86Yu8eT2BOGfbjKUT6InNTD+zzcYSiTgxbqIjx0UzBuTLh3byOBdmfkTmjNTl5rWrprIgtMxNtKmn5A7bah+VtbpWq7lKUquR3QMw6gRDayrsLkaLfzp0NTxaWFWiokdp5SLOd6ZsdND6sETLeOFrwfCLNa9WfdptdU5/F76omTKJLUI3l5CbWU+el63G2F+6cEY9uvysFq26JNK1x8u6ISZm17NnZdQcck/rWtBzOrRhYL94e/tDfq3GDWYmbSCva82+3co1ySMZILcJyF98NSqI6Urh2k0ElbR4Qdmf244QfVJC53YHv8CS9e0Ljb9te4uYSKPtVLUOhaQPzTMvpGt52+2+xNgJdbMmurRU/lCHOK0f6LRxvFKKBpLaI4/Mis4X6IWN4BHonl/mcTPZBp7bW0n2B5FeOc6bjurb5wYrfB2BmpOtESfKYdhfLKcFpt4WSo6sGMOvgjFLZ0V0nE7xPZC4wkSXOrETpr0EXiNyIHjSm1HMuucg==
X-MS-Exchange-AntiSpam-MessageData: 
	NhRi4K0+7jzo+rRYRGufy7zoCWQD5obyoHHMeeUUHrR4MQvL3xUQpTcTKsFkdAxGQ2rty34h2v1oyU9vxIeDFZ8tCkUiWdI9Zpg0mFnpDvET7ElhdQ2DBiUe3FNlxQT7qChlRnG1A+Rxn8LkG6dr2g==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5254c4-58cf-4449-0570-08d7e81c905e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 06:56:07.8641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: az7nfLDGu6ggee+XIDa4M/xyP7v8idPi8ydawYaPA7TTnXcalD1MYgkC8vOSzkW6qzzTQ4KqzBWsM8CxXZ2CDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3712
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Ting Liu <ting.liu@nxp.com>

cJSON aims to be the dumbest possible parser that you can get your
job done with. It's a single file of C, and a single header file.

Homepage: https://github.com/DaveGamble/cJSON

Signed-off-by: Ting Liu <ting.liu@nxp.com>
---
 meta-oe/recipes-devtools/cjson/cjson_git.bb | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson_git.bb

diff --git a/meta-oe/recipes-devtools/cjson/cjson_git.bb b/meta-oe/recipes-=
devtools/cjson/cjson_git.bb
new file mode 100644
index 000000000..7a9ebf07b
--- /dev/null
+++ b/meta-oe/recipes-devtools/cjson/cjson_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION =3D "Ultralightweight JSON parser in ANSI C"
+AUTHOR =3D "Dave Gamble"
+HOMEPAGE =3D "https://github.com/DaveGamble/cJSON"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D218947f77e8cb8e2fa02918dc41c50d=
0"
+
+SRC_URI =3D "git://github.com/DaveGamble/cJSON.git"
+SRCREV =3D "39853e5148dad8dc5d32ea2b00943cf4a0c6f120"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE +=3D "\
+    -DENABLE_CUSTOM_COMPILER_FLAGS=3DOFF \
+    -DBUILD_SHARED_AND_STATIC_LIBS=3DOn \
+"
+
+FILES_${PN}-dev +=3D "\
+    ${libdir}/cmake \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.0

