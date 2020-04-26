Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.42])
 by mx.groups.io with SMTP id smtpd.web10.5326.1587869754610350395
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 19:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=NXZMXMbg;
 spf=pass (domain: nxp.com, ip: 40.107.7.42, mailfrom: ting.liu@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVrrEf1Up/ip3jM3r/Ok4blVyS5BJXRBy2kiyxd+iwvVcQh2dtcQYzjeb9nZQItX7k7aTFZuwowXgOYRxH54kegDGu39a7XSpNkDvomAbjGBEPFWzfnzdQkoNquj1iAjN5GbGV8klSA/4v5j0l5sCcC+pugMHpYAmaAZfUjsY8T2gJRI9gCZQYSpwc8oZjQwko/grTsFkFQ2cGdeqCLVO9/D+n2p4LGBZRq12g0DfDcMz71qiRNdxY0TyP4OWHYI4/AZRYZBi5p8A3rxVh9ru/XAvFDWR1wsgpIyCzv2RIta5Ow+sWlSNpHmFl1Z8yEcupL//iX2c0N4vSpt91GvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez4w4JoKRT3M6YdKHgiDSggkMqCAR7W9UnAhsy3s2M4=;
 b=NbIRYArBHqz3MVvW8hE+d6P8HaLwzl/htf+awBZWTQnLJVQhyjecxY+nWetNBqzOo2MoC+zf7RAszlh0u9GIAtkqTf44g6YRBDO0GfrhYPamlUyvsH3f65Q88p/VRHKzHuPjcdgD5/a0eV69lt31N1BycqtEp9K+3zuv8llUcEPCbsKTZUTqeJSyBZkOrMlhf24IB1gcTVkURe8a1bXhY9yxVAJTj+bcow29Dg4xKoZN0Njnbmfu5hTRxw45Nt+7MjCWLS0pf+iG1WYseU1qaWZrhcY14F3dQWzlsStzGY9u6AqJNMsQ4lJufPrjLJKCNx5CqzbkW+wKbDag/fBGyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez4w4JoKRT3M6YdKHgiDSggkMqCAR7W9UnAhsy3s2M4=;
 b=NXZMXMbgqeBLhRGEVld0T44telZ95X0iPwHDN0lWsNzAQ/43y3n91EYYDcVTvZFA7R/zMSsdP9HkvbUJNBIZ+mhqVgdI06DRJ/SINY5UathLejRXkcJLOV5z7B/TH45emZ25tOyNGDflM0BNoubC0aS3+qvgqPLWmDcS7sgH+Ds=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=ting.liu@nxp.com; 
Received: from VI1PR0402MB3341.eurprd04.prod.outlook.com (2603:10a6:803:f::11)
 by VI1PR0402MB3805.eurprd04.prod.outlook.com (2603:10a6:803:20::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Sun, 26 Apr
 2020 02:55:52 +0000
Received: from VI1PR0402MB3341.eurprd04.prod.outlook.com
 ([fe80::3832:d1ae:f6d6:aa1a]) by VI1PR0402MB3341.eurprd04.prod.outlook.com
 ([fe80::3832:d1ae:f6d6:aa1a%4]) with mapi id 15.20.2937.020; Sun, 26 Apr 2020
 02:55:52 +0000
From: "Ting Liu" <ting.liu@nxp.com>
To: openembedded-devel@lists.openembedded.org
CC: Ting Liu <ting.liu@nxp.com>
Subject: [oe] [meta-oe][PATCH v2] cjson: add recipe for v1.7.13
Date: Sun, 26 Apr 2020 10:55:27 +0800
Message-ID: <20200426025527.25995-1-ting.liu@nxp.com>
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR03CA0094.apcprd03.prod.outlook.com
 (2603:1096:4:7c::22) To VI1PR0402MB3341.eurprd04.prod.outlook.com
 (2603:10a6:803:f::11)
Return-Path: ting.liu@nxp.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 33b53c2f-b0d5-479b-e5ea-08d7e98d5404
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3805:|VI1PR0402MB3805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0402MB3805623FA4ECDC9ACB4AEB7499AE0@VI1PR0402MB3805.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 03853D523D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(66556008)(5660300002)(66946007)(66476007)(478600001)(2616005)(2906002)(81156014)(36756003)(6916009)(8676002)(6512007)(4326008)(966005)(1076003)(26005)(6486002)(316002)(6506007)(86362001)(52116002)(186003)(6666004)(8936002)(9686003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KihMhZ9GfFpvUoeGqho5WcOBt55mnYONCgPvsDn0fkJctW/gLOs39WqwTf8PSHK6mOdHJdIuBYwUiR6FSVF0rHLV3SZ2HLaC+w6m8cKFQ6mRDiVsbHP4h/z3KXNZq+ZEMMOU7kLlO2g9BJn+Jsl8RgMQN/WfotmfzwCT6Wm9zrriccwA6fCkY3hMAxxp4P68X8FIqQ5qbUOI653x00fUkytZhIQB7bYt6i9ce+ypj88fEN+S3LQNoTJvwhR9gBoWH5jNAVihpb5A2EnuzJjRojjMI1nW7cdG+Rv+9LN/BDrbb+bTdf/x07alCdgdrF2/xR3yKihazCH0qrcZWIhFu2k28ZjtaTjWyyi4MDY/mH+1DZvpz4WWsA2ZJ/lAj23mNuRxaIsdg/58Lin6eIJBrj0qHu/6CCqG4uj8C5zL9+s9sm/W16C89lNqqOHXUMUyt9KlUSxYGp89ILTPkxZZqionvq7z+9zbFcTOAwS3IVacjKPgT6H96zJTYGoD6Zi52AtxeURciJMaP+QGCRIpXA==
X-MS-Exchange-AntiSpam-MessageData: 
	3HVKVszX9fCHGgIednYtnK+WXA/DhlE4oL9tUHexJ6MhyzdAsPSV+fSJo9f6XlAF+aFfYBVSNC8ygLUHg3BI1bHvTZjrDzoVsu+URWLpppY0J42tCfivx61pp9kG0xSWyg2G+lnhMMUYbhGC+q9OdEW+UF1FSR8j+FVNwyaTyyy683JFKryektUmtzZrUfWAboB8PEql/VhI2YTUNWkAknmpNnqq6mQx74wcTbZDdfk2g0TZxmfSQRXeF6iEMGBlFVd/mO7f/Q0857dMgZ3c8cqwemgrbnBnGfwpMghLwpEQG1xASdfgQX9oUoPJu7JRwM+HW2e/d5w8wcZuSApgUw7zbZMMkaxC9EUzIocbEPwxwF/NcVbhdyuL+W5oCvYJtBaSreDAm1lxTvw7uJomVR1NHttDVVlKvHP5bOd1oYIf96jdg/BMLJhzb1qkM1MEqxJlbbV1NJ4BYVHJcMAKSrrSjs+goa9EQrUjs4SnOLOUckjHCQSxZoJK55fbe5956wWwC+8MSXzvBRMpLM0rs/ISpt+BNNTeBFnG6CgdHjshNKY4S8pYot4lq5CdYiqjpNIatRAHS3096R+6KG6iqtUpJdH1IPtHRG3r6Db/JyfxOuhX4qM7cOSvnsR86kxvm4B51cQ+2q+w3Vo33/3+d+FyCxtmVKb3mJFF+uQZJ4dqdTCUaVex9bIix1mMYP6A4bO8Imy55o6Hz/Ua7XVNSB64uCP8hI07fFZe0SRYCx1YVpswSrddNyG8JBc/WZnAunHqfGpkGOZ8hRKs/dQvrbg/BosIMX7LpRhW1qujc58=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b53c2f-b0d5-479b-e5ea-08d7e98d5404
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2020 02:55:51.9823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3Dn/xDyhq/6cMjuQ/CD6i+6D437QFraJdS/pLeMmtc3SlsO3pveZ4MMDuyEIP1swdVtJlSJBrHMBmaodJ35Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3805
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Ting Liu <ting.liu@nxp.com>

cJSON aims to be the dumbest possible parser that you can get your
job done with. It's a single file of C, and a single header file.

Homepage: https://github.com/DaveGamble/cJSON

Signed-off-by: Ting Liu <ting.liu@nxp.com>
---
Changes from v1:
rename recipe from cjson_git.bb to cjson_1.7.13.bb
add SECTION
enable building cJSON_Utils
not append ${libdir}/cmake to FILES_${PN}-dev as it is default

 .../recipes-devtools/cjson/cjson_1.7.13.bb    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson_1.7.13.bb

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.13.bb b/meta-oe/recip=
es-devtools/cjson/cjson_1.7.13.bb
new file mode 100644
index 000000000..e6174821f
--- /dev/null
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.13.bb
@@ -0,0 +1,21 @@
+DESCRIPTION =3D "Ultralightweight JSON parser in ANSI C"
+AUTHOR =3D "Dave Gamble"
+HOMEPAGE =3D "https://github.com/DaveGamble/cJSON"
+SECTION =3D "libs"
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
+    -DENABLE_CJSON_UTILS=3DOn \
+    -DENABLE_CUSTOM_COMPILER_FLAGS=3DOFF \
+    -DBUILD_SHARED_AND_STATIC_LIBS=3DOn \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.0

