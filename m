Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.2008.1620070144087994359
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=d1At6JIU;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKKbT6ZrxrWem2Ruehw8Iu5mceqPK3hnikl/PSmb7UxLXwAHzXquDU4te7GbMhpqpTAvTlFmj4GF2iYbLMZuudwMR215E+9JpPincyFIT0GradCz6jOS3NE57950/6H8Xui+zLQFSt2kAcuqK1tvFItQOabFgkmSCGLvcjHesyRPB7JJRfwk9ddMoEQKxn0LmpfxNevIUi+IBUxwB+QIHuZliZJEZm3j4SY5gOuDLodWYxHTXBvl8BZEdK0bxwUmaefKb3U/t3OZ8GAFOro6BJrg4aPlgjqkQ5gz0DdxX9YbgDy0tUrzJ6paXrRIEircxjaGcrDDptgxicDhXmXkJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOXwQpc0jCWLDLo8d7I7nEzPKlwysqXi5b1HNm13hAU=;
 b=WoOAeLNifr0SyTTaiqUcj8tWmU/aF1JC0E4+Kg08gLM/+pXaZtQ6BD+j/JGYC2Q6MKfCBRJn6hMlR2Q7hqJ9AMR5xI9+p5iK50zXzfMEoKx9a5H9p+4DX/xxzACODadsh4yQDdIP1UL3u6NjPdVmao6VieK/Usy10oHOqJLww5j9TbBaeeGynBLEFUHh1SO11RghfQQNTJy42kY1qvm9RfaGV568XAfnV5/XVnqzX2/qJUKVNiMxL+IJ9E8r0XClzkbrMMZjNqLUgm8FhBMDXqIhEQjGOnvT2A7S/ZZmpLrqU5AhBSfIIrgnpumYR0/pbNGVfYXbdUtN61UrmEiFHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOXwQpc0jCWLDLo8d7I7nEzPKlwysqXi5b1HNm13hAU=;
 b=d1At6JIUyxh8OhQb9+DM0zX1hAXmO9k8pQ4XJrrp1/lKonU92nQrZRzc/DyxRcj4GYxMwfFBW5AXpHHw8Gr0ASuNCmOUxPD8hJylJrYHaTtFOVAc0BoJ+YQnMiK9GSlZuqwRMe2lQFO1KheMDObMoyHZDZgQfA1tfWuR7goliA4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Mon, 3 May
 2021 19:29:03 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.039; Mon, 3 May 2021
 19:29:03 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Subject: [PATCH] packagegroup-meta-oe: conditional remove tbb for powerpc
Date: Mon,  3 May 2021 12:28:47 -0700
Message-ID: <20210503192847.2387489-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503192847.2387489-1-saul.wold@windriver.com>
References: <20210503192847.2387489-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR03CA0052.namprd03.prod.outlook.com (2603:10b6:303:8e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 19:29:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3212f7fb-03e0-4dfc-384f-08d90e69b569
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB507332689560089B95EA307FEE5B9@CO1PR11MB5073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9yXadc6ZE16eKImfLpO0D91a/5GqC4LNH5S2BvEt4bbTonO154Fbxd8l5xxkSkZav2PT0yODBtDXFeu3kxOn7Mty0GePXNLrZO4RKfo4xnNf2auHbA+6ZXrYqz19Lz9syrjKDdF4HDqC/koW/94mivsPTC1HNm7WEmBu28QA24DdSq5Ci2m7wFZqEEuBdpGwFla3C2aQeSzJKSjSpmIC/d2uTB6HD2NPIdx1HZLxfT7z04A2BG+kWb8qSDMLPNcbXg2GWQmIFtolEEVRhW0hbsL8uO6QQm4D93M6cohWaBi3vQWGGQ5WO5R0dPwsKp0lPiV377JTpn8Ond5NN9xN03kukh+U3OhW6wndKGYfXZEnmD8qasIZVl4zvR40u0I5DkIUDmchEbOOM6OiwnEuxFIIUX42/MMOPuLQyZpep1sSf2HGIa9303wPFJBjbnXdZcRRyLWFmg/Vma4JftVDrHErk/Xt8qfzrjaYYdLSpfmlNjBXISkg1pQAR+o6JGGz+LbtJqD0nO0G91Fmu0Ij9Lvm6bnOVY6ghgW5etpWKrnzBUzDBzqRwq2WemLvP8Z/OjyCQmkT10mrJlR+O04b2rLblpENVYto9VJ8oLTDESuEvd1exxIC4Ek48RrJl89HKaRrQjA8hks39/aJDFeToA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(136003)(346002)(366004)(5660300002)(36756003)(1076003)(2616005)(6666004)(66556008)(478600001)(16526019)(44832011)(6486002)(26005)(6512007)(2906002)(83380400001)(38350700002)(6506007)(186003)(8936002)(8676002)(52116002)(38100700002)(66476007)(66946007)(956004)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?+0adgDLcfzpvz8BXWg10WfyHVUqkN+XWDwkxl70ak3CLDjai4USV2ozQO5iD?=
 =?us-ascii?Q?OdzUohpo5bJUIso8GIdWBTIRhHiTXltAdAbjls4gSZAj0HNb/wGsfYlChz8g?=
 =?us-ascii?Q?MCz+9+Q5UYV2MqFIHlENXI+3Din0b6m/QTomYNqAmQKdX0A/zfvsh+2Sp+qt?=
 =?us-ascii?Q?hF/aNvpGXJ7vm3JfYOoSSoGtBpvB9GUDV8jdhAWz/aRy1/6qBv3jjTMJUkUM?=
 =?us-ascii?Q?OeRVcUhDs+n/deEJy+tyapaX5pOh5rIVU/f4pamyu6oCFpCs1+VqO81mYoDC?=
 =?us-ascii?Q?PcySRvI8KmTGUCEbdKF0CqHl3TFbjF+AgwZrr44MUItdW4vbGg1rCIO696Mu?=
 =?us-ascii?Q?Yp6s4UunvXeT4p85EcUnGuibf0MvTb986T1n4ua/flJ9TIzpFc6aH67AXXXn?=
 =?us-ascii?Q?PukicVSasZ74xrbQakEWRE1p05/+JeUU9S92orxgG0S3OFPCnal8m0eWh+Bl?=
 =?us-ascii?Q?+YVbozwNMGt38iFZ8ddG6BTlr0LwH1OzCIko6QMU30SUO6rlp9iOkruxVM0l?=
 =?us-ascii?Q?kla1F383JbK+WmuDz9di7BhmjqMLAxK3/xuOPh6O7uHyQSmheCf/AQeKNGx+?=
 =?us-ascii?Q?X00Ciw2d1C6hLIavX0HpxSNdSbJQZpJjuWLXt6tumVlhDzCGz7iaPAG4Ohm8?=
 =?us-ascii?Q?j9u2wB5zZogiM0tocL+pc4gFDQQF4bkopcxYzdcwv/cAAplxlh0UywY1Clho?=
 =?us-ascii?Q?c/tV96V/HOY2QhAvgIuOd/q10mL8Kuo8SbsXTFp/auyofpg/zdY+Cd2pbht8?=
 =?us-ascii?Q?5+mIPA/8XhfxT8i4K47cEqx4yq2nbxZBYrZz+hH92rUQ6msHkAGKlhFmpxD1?=
 =?us-ascii?Q?D8FQsItsCXFg3ITVCrecaJCNYaHtAxqThLPibz8UjZcQ6/4qt+zoewNdndst?=
 =?us-ascii?Q?U7ZZt4rDsClgC0N6JOO8kyaMfUZMKNtn/WTXfJRK2aR93PFGPQOvcE0eNlze?=
 =?us-ascii?Q?8Pl0cVBJzCADtKj5o67mc9dLJyZLAfy28xaoVndhxDwEwFY7diZwONO++9Qj?=
 =?us-ascii?Q?qtwd5kLrXhPjUKW9yWS2gn8GLw4bHKK2LIjEEzxaJy6ywvb3+hbD10VUKFgX?=
 =?us-ascii?Q?RFvRCK4lMSaduARra74Vj7otVhq2RVbC9wWlCeh1H32TfLpJw1rxZCIHlyTl?=
 =?us-ascii?Q?WiaFQ2qtOUvP4e5Wh+9yY6lCGO/DZcQmxyaT55XnYIXSgMTaAqJzaCAac/5d?=
 =?us-ascii?Q?htDCdegadKHy+UBlsXtxnlaF83NQKOuHsPzwDBwEYBSyAr+OL0Wc+tEGOreA?=
 =?us-ascii?Q?rq1AbMoq8z1lk7WbqHh74jPrJ6J7NCcxnZXONnhjGU8ft5/TmD+Saz3eba6A?=
 =?us-ascii?Q?n53OGzTOU+BqjiPjbYbQUbHY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3212f7fb-03e0-4dfc-384f-08d90e69b569
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 19:29:02.9075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2wcRXYUCx0F+oNzXqBKAM79uilMLVvrfGpVcHIlvIAnNcrRW5c26jAjg/eNfk4agVJTEkjmLSG+DXD2FJiJFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Since tbb has a COMPATIBLE_MACHINE entry to prevent it from building
for powerpcc, let's also remove it from the meta-oe-support package
group.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 59908e2c0..eb095a237 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -921,7 +921,7 @@ RDEPENDS_packagegroup-meta-oe-support_remove_arm =3D"nu=
mactl"
 RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch =3D "gperftools"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv64 =3D "gperftools uim"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv32 =3D "gperftools uim"
-RDEPENDS_packagegroup-meta-oe-support_remove_powerpc =3D "ssiapi"
+RDEPENDS_packagegroup-meta-oe-support_remove_powerpc =3D "ssiapi tbb"
 RDEPENDS_packagegroup-meta-oe-support_remove_powerpc64le =3D "ssiapi"
=20
 RDEPENDS_packagegroup-meta-oe-test =3D"\
--=20
2.25.1

