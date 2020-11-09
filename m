Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.79])
 by mx.groups.io with SMTP id smtpd.web08.11349.1604928516836332681
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 05:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@skidata.onmicrosoft.com header.s=selector2-skidata-onmicrosoft-com header.b=xqO6Tk38;
 spf=pass (domain: skidata.com, ip: 40.107.8.79, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAO1LgO0RbTpedMuX8U7/f+YyeEZII37nFgKP+dtnZz2zMnBiqDo0NupsZznat3MKMMgfIOXz7AReCNBmrC7LwactMv4fLS9L3HlvmoJyrgYWRSIoz9wil5B5ap68ogGlO6eY2E6pm24F5wgP/Q/m6CwKULcxToi86nSVIfzI4ojFHHQtiNzO/nm4gTjS0Pi1Gd2KvfeKbEN6/QmEDZfSKjnrgPkwWKKg7VPT/5bMiB2mUD5344b/EtQA7xPkfOCzr2fNjYFjqY3pJou69/0jXc67rbEhvUs+jUyFI/iNJFeD+Prbw2/AxOsNGeQndwA/ZsXfwjnqgiYDS7qa9uRAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iaujAAb8K/rMfOEDO71g2gzP14Wvo7t8dI38hNzTjY=;
 b=UgtjXIirW9ir9fT7WySwDrVDZEPntB8HlOaOg/tZXbbGlcxzLjdRPTW6OPEX7ElMDdxb92fmiOSgv4N21Ys51uiG+U4JDPC4l2ihkJuQDOvDuiyq8dt7JzD9XArBlgLPGpl/Yj/ADo2mvmpGw/HzyT+tlMmQTAuVdCQ9lrzn33zP8sMo+adWMpp3sDnnMTzm4kwLnlWn8oCSlHrn9/kkMognn9lo/V3GI/0MAOZIm+dvtlfx2f6ZAC4m2FHUWmnu7NCZkidWc9BL+6ELk23fffJ0bGRyg7232UWhRp/OESiwKsNq4w2e8y2G345egA1qiP3BZLlwlCnHxL8QxgRbzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skidata.onmicrosoft.com; s=selector2-skidata-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iaujAAb8K/rMfOEDO71g2gzP14Wvo7t8dI38hNzTjY=;
 b=xqO6Tk380P3aI0NYkxZKUhFs/iU5ltElhoDgBlajB14wOQ1w5UMNEdiSY8R1hQ5pP2LrM6RIF7z3g7CwKMoLCvMVlXsYGQGPTtHbHHKJ0Uo+gZ5Pu3A8Fz71MI0JuPuWZ/rZz3eq6cCq/frkbVaXvJlmnYUBUViRERtt0339mmA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=skidata.com;
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19) by VI1PR0102MB2704.eurprd01.prod.exchangelabs.com
 (2603:10a6:802:8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 9 Nov
 2020 13:28:34 +0000
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::59c1:ae16:40e0:7c6]) by VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::59c1:ae16:40e0:7c6%4]) with mapi id 15.20.3541.024; Mon, 9 Nov 2020
 13:28:33 +0000
From: "Richard Leitner" <richard.leitner@skidata.com>
To: openembedded-devel@lists.openembedded.org
CC: Richard Leitner <richard.leitner@skidata.com>,
	Chencheng Zhang <chencheng@wittra.se>
Subject: [meta-java][PATCH] openjdk-8: fix changed upstream checksums
Date: Mon,  9 Nov 2020 14:28:15 +0100
Message-ID: <20201109132815.12924-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [83.215.125.121]
X-ClientProxiedBy: AM0PR10CA0044.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::24) To VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19)
Return-Path: richard.leitner@skidata.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brokenbit.skidata.net (83.215.125.121) by AM0PR10CA0044.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 13:28:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 364fa959-bcd8-4977-f47f-08d884b35b2d
X-MS-TrafficTypeDiagnostic: VI1PR0102MB2704:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0102MB270475237F8A87B5A2F9868EF0EA0@VI1PR0102MB2704.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DyrLFScZWwLuPZ03MLHZULBs2ibW08GWAhTVWtnk8ewl+4bHDnmC0eaL+E2JMGeWQuNAMqKv8hCbQZkMUjLDZv5H73i3H8Sxl44Yt1p54O7ZgS64rRhRMO9L/ktbm15d08BN1aFpewF8zB0MIO+Km4D8//YLVNJuHVQWdgAd9E5LJfOqUp1uIn6+1YFDgHzOtXW0ZD0ghDNOeLU+mJT420pPXT4b62fkUcHrPombosdIXNkMRwfJeQYbf5NWn6stPDwFk+IAkIgV3MXtacI9Y02Wm6erZYrT7vor4yXsoXKkmMVngTHAZgIgvGmMbCxxxs6Gw/wtVK5eNqUT7zjC3Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR01MB5007.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(396003)(376002)(366004)(136003)(346002)(39850400004)(66946007)(66556008)(6916009)(66476007)(8936002)(83380400001)(6512007)(2906002)(6486002)(1076003)(6506007)(16526019)(26005)(478600001)(186003)(52116002)(956004)(44832011)(2616005)(86362001)(8676002)(36756003)(54906003)(4326008)(5660300002)(6666004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YekGsDvMxHbu+J2aCswiwHu5sBPkHC5u8HHTrWKb28iOIPZpVOma6h1OMuXHAtXtn9kN5G4ciT8bHWPiiZz1WeTu3LsJT1lGEtcpUpGQTo8niqp8zIE8aAXoyCVNBzRoBvvzSubOQ6CfC4gE41jumKnsRhMdcb0ANxx4AVuka82Y9teLfxqnIGzMjJggFHqlmJIDZJvEWy1vxDdT5nQwNhUZfgdzQusTVxa53ZKE16OI94656qJGozeEpc31T9QTosb1myMlmkKzHTRloy0GsAh6/3+JqbCLr8iujr+RvdumNQ88swp9f9b9owFyFLOaEqOMAHGSUcn+Xv3aNbfeTVsFwJVcYk4dgtlnLlFoIxhnYt6J0ibLstDr5yKU57R3H1Nz8Y6s2yzejuBgGeIvTtJj1dp/JuAfg2ImkgPxXOaISByzLPCwxLC7NA65U9CWMwwDBQUAdHE8oWVhqbULi3FYDsjdOOM8CkvD1MeevgK8IieyD64wkrIHzYbUwyP02ZL1QoUdKMXTRDjN8x5H4LfUrAsFwwAIB5AP3BVJcJjYpuSJAjQ/jBafjx6biKXplvaalvOxRet+7PagXLkkrJ0K3fWnGQenVPbpXUk0dnFYarariTpg4Tq5xEla7P2LQrA/p1r/zDXbq2PnYbpwEeP+d+0N6OBXdRYkOIulXYpGIOGCy6l7KJSX4BFAnUdV6COgo+V8ySmV9gpUwlFtLHDIi5HhLZ6oQ6hjQ0lJOSXlRCSob2Vt5wPHo55iPIFCmvMlHRbX7v4DsrFsxodb+ETy0YipZ0B1Gbj9jp/HBd8/cMpRHP7q7uKkhUFMj9aQHMCQOBaJ/eoS12NT6HEVHOjK6222zD9BblchmAmnRZcogbpM7ga8o6lUfHAmlOZ2mON8aFdPIjMl8L5IRAqfhw==
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364fa959-bcd8-4977-f47f-08d884b35b2d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB5007.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 13:28:33.8464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uoHjnKz92B51cM8gxnHVbH9TN/IohAXrBOdRy0gRZINZ6fE0Zhi9Z0WRmtO/dZlHvzJQ7+bSCNAiOR3mhp/Pm4UoLmRn6ZsaeiehvHVZ1MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0102MB2704
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The upstream archives and therefore their checksums for 8u272 have
changed. This is caused by a new "jdk8u275-b00" tag which was added on
the same revision as our "jdk8u272-ga" tag. Therefore the
.hg_archival.txt file changed.

This patch adds the new upstream checksums.

Reported-by: Chencheng Zhang <chencheng@wittra.se>
Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-8-release.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-release.inc b/recipes-core/open=
jdk/openjdk-8-release.inc
index 2694077..28429f8 100644
--- a/recipes-core/openjdk/openjdk-8-release.inc
+++ b/recipes-core/openjdk/openjdk-8-release.inc
@@ -7,25 +7,25 @@ COMPATIBLE_HOST_armv7a =3D "^$"
 COMPATIBLE_HOST_armv7ve =3D "^$"
=20
 CORBA_CHANGESET =3D "jdk8u${PV}-ga"
-SRC_URI[corba.sha256sum] =3D "51212e37b6c6e120901e61b830f110bbd121e9c4611a=
ec9ff4e3f404a667855f"
+SRC_URI[corba.sha256sum] =3D "28c487a49546ab1a592eaf229c13e1896b390958ac4e=
6fa19bf5da34a1977138"
=20
 HOTSPOT_CHANGESET =3D "jdk8u${PV}-ga"
-SRC_URI[hotspot.sha256sum] =3D "a8c83dcd272dc29c538291f24d1b28b7069e048398=
681b6db082cdaa8f3a6b07"
+SRC_URI[hotspot.sha256sum] =3D "55db6eb423445978e5a9a285c5adea238dec3d3998=
dc5f1216f8f5c7a8d7c5ea"
=20
 JAXP_CHANGESET =3D "jdk8u${PV}-ga"
-SRC_URI[jaxp.sha256sum] =3D "3f8b02337f4cd96e9180aa118705f48c39562f66287b4=
6dd69554221fa196084"
+SRC_URI[jaxp.sha256sum] =3D "778d3946b9cf84c9b7fd937dc91d0e919ba7616cc4e3d=
b44b9d0347ecdad308a"
=20
 JAXWS_CHANGESET =3D "jdk8u${PV}-ga"
-SRC_URI[jaxws.sha256sum] =3D "ed276f9a70bf2582183838ad8b1874c0993b4a28741c=
69f095669667b12cd3d4"
+SRC_URI[jaxws.sha256sum] =3D "a46eabbed4fedcdbd26510fc1ccf40aaa337e44542f1=
12d4dba3e93f2bb7e492"
=20
 JDK_CHANGESET =3D "jdk8u${PV}-ga"
-SRC_URI[jdk.sha256sum] =3D "a3deeab4ac721d1ce9d8a2fb1917ba9e2afc6041f03ad4=
a342e9a5441cce621d"
+SRC_URI[jdk.sha256sum] =3D "9913adf85d3c5b039a5dfeb0962613d92c6f454d0bbbbe=
3e5341e221021e908e"
=20
 LANGTOOLS_CHANGESET =3D "jdk8u${PV}-ga"
-SRC_URI[langtools.sha256sum] =3D "ed59eabe4eb3fcf9af592d1af2d052c5053da9d8=
68542fc47a0bddcb91e69c60"
+SRC_URI[langtools.sha256sum] =3D "9189920ae3858c9a680912c54504302e0553cf25=
d892c8a03fe954859f587066"
=20
 NASHORN_CHANGESET =3D "jdk8u${PV}-ga"
-SRC_URI[nashorn.sha256sum] =3D "a5b8c478cd7695bf83210b8e97be3bfc8248c22916=
cec3b8b869586c3d7f0007"
+SRC_URI[nashorn.sha256sum] =3D "b42bed287349ecc702f874867a60c3e3664a799d69=
004e46260db5ff9a7df772"
=20
 OPENJDK_CHANGESET =3D "jdk8u${PV}-ga"
-SRC_URI[openjdk.sha256sum] =3D "a80476dfe32c12882fe2d87bdb0dd37fc4a0dae8dd=
95f0c22c7c2445fc08ff7e"
+SRC_URI[openjdk.sha256sum] =3D "3b335df278915237986ccdfc40e262d5b6a711072b=
2a0b99bf2b197dc9ff0cff"
--=20
2.28.0

