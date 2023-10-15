Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117EBCDB48F
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.52])
 by mx.groups.io with SMTP id smtpd.web10.89880.1697367079777818269
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 03:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=tOf4LH1V;
 spf=pass (domain: welotec.com, ip: 40.107.7.52, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dk1GCrLgogN3X0SahQI9nNOvcnuRcCyw17BSLrKWyr+Ee3OL+wICxYalKpkSTxeopp2vkGtxJyXxXi3DTKARu4dSCwdm7YR3UfD02Cwt4ovD74FOgRTZnZuuIwi1HA7wV2ngUMPIDxZOVljRDkkZUbqNe75VzaBD1ONXOGuPNhg/fiau60RoilsY7jl0I6260u1g9ix9B1Pt3Gj+2Fa+PVcZAi7TA72l+3nP7GkG8boZ3rB9mcjFy9iA1UH2zl8wGeRzg75vNAszxvvhECikiN1GNzHYkXtcgUoN68kedpsSlvSzEWJRiiHRo0Bi4P+20pCV+pIYWs8JVSHwoyLQpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AONqEpsjzkHLtlO0IyMbeBemSbONL8PFfff+5FD+yYo=;
 b=Y5iiL7l3mqOUP9McvW3TDrWY+3ZkdITZoIcdNveZZwMetue/J3xwDkvvo9yG+5SsPi+pcjOIXFSS+qc36yjgVtC+dCzHbhCkJ5KCfIbGDvKTf7CL4HW5GUoXLjCyS/5YvXaxUxaOY/COh0q4U3qyJWduyaYunF2MQFNqrjRT6pzkvAXTfCiwMRc8R7HBvKVvDzdcZu5/gHx9LPbBIcZ7VUxdTkJG+mOCebtu4RxnwfFbXI792XdjWN3b6oITcYTI+bEVBHnxQumbqvRcO/HX50Daomy24daus3fCuxm+E5H1NF+cnAElc4/qkJg3Z373peQ9nfKPC1wvrp54yzE3uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AONqEpsjzkHLtlO0IyMbeBemSbONL8PFfff+5FD+yYo=;
 b=tOf4LH1VnBvCyLk/hA/u3Eo81WWP+KAa5c25pXuvTzYJXO58x2I7sYKaxeIIKvmrU48UEOif8C1dkBxiDRYo8LuW1sLPMihn6HnGj/nZMrwvXYYIdIyFGz0pyEH1POhT/ZJgr+27CZrPYXKvxwnwVZmDrjswZN3vQSPQJymM8afau6SDXRw7AWCN2z1Iu08LZx2CjMsYgX/iRv2TWzxV9dCm87WmQZF+m0/wHrEQWjn92zXCp/+3qkVpiEkLKbzaScS1vU/LGPqK9qLJCI7GFMDbKKOMsiDnTAErKr5hnBA0kLuyQ86iNv1t//nvMOmibCYoKKMSctbXXcPxzT9iVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 10:51:13 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 10:51:13 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 05/11] package_ipk.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 12:50:49 +0200
Message-ID: <20231015105055.52510-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015105055.52510-1-p.lobacz@welotec.com>
References: <20231015105055.52510-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0037e5-d44c-45dd-82fd-08dbcd6ca689
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6E6xNZpq2YakEliRNZgDXmMqVwx++wQNStzE/hAAKw/591iJLE36BVjB2SLDF17x38PToc77xVLKqKFVg32rV5oo//M3LbC77rTO3KNHvrH1FOblplJtrWnWu4/tBAdc2+iUEeTBiMz8Xiu4/jFUf6J5Ut96NQmw25WfcrGTXrumCaizG9B+3kP6ZMk0xln9/zk5ng4EDPzN/mEbzN++4VkGuJvbxOxoSz1Jw1E/D+gvdqwHmlOvWL1gGiLT1eC5QYTieBlYKRDLmwb0jjvX9VX6+DG6nLsD6Y4uz3FEghoIZyNXuXmp64vvhEmtpbmg492Ys0xr1f5SolfZokvasqzH9v3ctal3HbzX/OczJS1nlluqGmMgx+wj8Us5j68frHMQO790ayl+Ab7RluuK5+YAQjb5+E9RrH/HmSxI6MG9XTG3IvjSsWzDKRjAsfoV/nRCL2e1E2qZNFtBITK2l01Eb+XvNJ2/6yu9eLbJYdRJr993HxBgCfPgnujs5PuagztXk4BewuIe0y85qOV2dWXEUPKlhJAQwjdrYn7eipVV1iIMTn2B2qWKwtkA6XeDzpJtsJoVvyowhS5trkTe3uHkV0keq5BgTFNpnDqg908=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(966005)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uJxjAVyvxpGYq1nQF/g6lcgC8AUuv+MKsEI66NeiuyHWINO/kOen5zWPLFV2?=
 =?us-ascii?Q?UubWlse5M2CRDQ1RH0wl2NjZOQbpdU23x5HJg34KHkT6KlWfYDaVzDHAIsIh?=
 =?us-ascii?Q?CXv4owhE+hB3K0Wo+p1VrTwvD+sFHo0iETEjq25+tN3cfuurQlNxWKdWROFO?=
 =?us-ascii?Q?R6tNi7flbEmU+XdLpm1lGnWOtDiDhXJQy7jErwkSyYrtjfGSRwnsgm60iqep?=
 =?us-ascii?Q?g6qCRo5SlHalyQTIwKiq1FDsyDGLU52+KrgfQimtg4AFJTvzp/OU/fQjOrzX?=
 =?us-ascii?Q?1uPuCprZ0yand9sfCyMDtyDuqDcjIkAVoL2FtO2hQ1dL5bYVbOxkdCOvOifp?=
 =?us-ascii?Q?+JhYDv6A3w9nsVgKLET1HssCM8Ykbnm0ZfhLKKXDwAz6C5AGoWKAAuZLD1wv?=
 =?us-ascii?Q?UpKS0CSfjPawDi5s4K6Vyye58KpBW+BG01MQdvVWwHKI8mfk79ck04YbrXKn?=
 =?us-ascii?Q?Gdtx4CaoRSdKfHv/RLb4glH96UDM9fljIBIoVJBB8uB4s7lXI4ZUBN9PwU67?=
 =?us-ascii?Q?Oomvr/cU5ez0cYDfjOUIZeEcE/pPjg7QqDmxOcR5/KBUoian0pFl3D9hfIFw?=
 =?us-ascii?Q?PzkT6Q/w3S95Nt7+IabprYX/P2o+1oW0+n6Ao8l+xeoB6+qc0Vo+0xejMsgd?=
 =?us-ascii?Q?MO5QHpxH0EWstszSLSeKLH7SoObcAxiUBmKEngD4dKkGF6Hz8Cz5Uu4408C2?=
 =?us-ascii?Q?mCSNRM9BlWQVBEZM6cUrE5rQPn3fEkSCctt4C9Q8jj06J7e0nY0qcAbY1T20?=
 =?us-ascii?Q?wcznm79R7lJnV8HFgW+CcigWtzJYhf87YGEPa/TLvvjW6KeNU4r9sU9LvDv5?=
 =?us-ascii?Q?fC0eFQFVPYmzk7/s3PhFYKbKpMTqyVbXJmsZ1C4FT42yp+RidbwJauGpwb7Y?=
 =?us-ascii?Q?/Q+SvSzodQPgFn5eiKly9BtM0NPII1L7QjGlfnnnJTDiCmHiCO2CwHroP4Kr?=
 =?us-ascii?Q?VmacrvM/x/g0CV2jpyppBy6Qt2uW0A1E9Qo1O+5HRUooFSYd9L6xBY37tXAf?=
 =?us-ascii?Q?ifLDpTHKgzhSH6hHl6G/eV5L88666+Blw56b7/37scwBRE3W9aipS0/s7y+2?=
 =?us-ascii?Q?ikq6GlRiaXYWSHa3mOdE8IeGqzpdcvtHqFg8nqZRsiEUoB2pC+H39l9s3Rjq?=
 =?us-ascii?Q?Zld5qJ39kjkbiwuQHaC6CVyayuXpG+0F5e2AA2fF6CuL8MP4Sx3LfjyAfcaK?=
 =?us-ascii?Q?qYnGUWOYPTGG/8zRRcWDkWxzxovXF/ye/UQ5tK7WXdB/7g1ZpMPbOA3XRfZj?=
 =?us-ascii?Q?MC0rURkluU9/px39N8hLnkMZvHX1vuvXJnD80miTVtk+0Qh51kUIJuurahaX?=
 =?us-ascii?Q?dnkv4Y44gSfeaNFUEEvfra5RYU43JdsfGmMkCqAH76kekx3p1On1A1Ocf34x?=
 =?us-ascii?Q?YIHyT9w4wMYjivZwMde7vzCdD3tt/CLKlcXMZY4kUQXaLpgFj4QBOVi5ktcg?=
 =?us-ascii?Q?Y1hp/4gg8+sOGgBVHDuc2bjNd2nehEDFhFe8cWyYERWxlrrq5XmQa6VFF3T4?=
 =?us-ascii?Q?hcFPuqU4WLfRbGVLl+QOkiRHSlGJqcfWSWS223ifebGH7TAeHr2k9PzwLpT/?=
 =?us-ascii?Q?N3ODHGAAo4PajdIuGtdPEd2Qdbf+dZuilk/wwy8w?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0037e5-d44c-45dd-82fd-08dbcd6ca689
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 10:51:13.8743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzJx4tY3xAr9qze+1IvkdVIhejO/uT0vtetg64uaohubaUm29UaD8outmDATB8lG1HZ/tNPU6muekcml0ju/6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105498

Extend OPKGBUILDCMD variable, with additional parameters, depending
on target distro features, in order to support ACLs and xattr.

With fix pushed to the opkg-devel:
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
opkg-build is able to create tar archives with ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass
index b4b7bc9ac2..a0f106e4ad 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
=20
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FE=
ATURES', 'xattr', '-X', '', d)}'
=20
 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--=20
2.42.0


