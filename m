Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8D7CDB495
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.48])
 by mx.groups.io with SMTP id smtpd.web11.89878.1697367950849094118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=ASfAleBm;
 spf=pass (domain: welotec.com, ip: 40.107.104.48, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuOV4jZClrnL0Dv6BN6nh5gfD+Wy0sAC9OgFfYbhQo+JJYRdRloBg6xnx83ILOn52MVLLYT57CxOTi8GWiqBbNkSQ1aSDlf2d/wxrh/6YkqUe7sp1iZPdrSA7Y47Y+yxEZUs15cMHydFs/OHxuhWr1hU1klpgLB67k+WlU/SiRusqNVmBA2LA8h02hsRMQD09htF8dUVScnmBwZY6mjDhi/3C4ULde+4wj+6lixD6t2hWZhvHCnUHklxbwasn3QN5ezakeq43ff+3OIIPjl9MWlL9XrTQBPf4qSuIWc1vmjjcbZspCbFwX5yN+hJsoGhFt0Mpvxbe1QvYSH1iVe7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AONqEpsjzkHLtlO0IyMbeBemSbONL8PFfff+5FD+yYo=;
 b=L4iLs+mvNXbXL7EqBVs2RMkfDZ4JbrcCLOqWXXf7za9dB3qs8sIF0EwxGpSgIjHwmScMWyMXH3DUd/e0s28ABGy9hZeBRTzW2ncCB0PRO8/Pu27Wktv8vIyGvgUsWxcUK0XxHjORK+iQVJrvY+KhKaJKw+P/9zAIxo2Z70RjoIPMcVnITvDVpQqdDupxBpey234RTf41MSbpEIbGilXNYdK68zBO+Nd+DPC8aJpr0OWHJsZ3Gv9CZ1c5r2BLCUSM1pvTTtHCl/yR79npR+583N2oWnanYpUPgPUVIDkBdua3elYJ9Z19eHWXVs6fDMTsfihimmssBinJ5Y2YN5ikYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AONqEpsjzkHLtlO0IyMbeBemSbONL8PFfff+5FD+yYo=;
 b=ASfAleBm9s3pMtOBA1L5+Sb/CSCLrO+gswr/4+8WkcYuJJzMTkgYFY5djpZsMYM6DP0F5YS0IA13FjuJ9qw7uT3WRO7T+0skJ2xxIrVvBy39BvYjSjemfup6l7ns17hmVRMZTwgJaFcxDkyudpC8w83qhMG99vnoYXqjSf5eEXubqVUBDs9WPY+IocKmYmj+qo6K2/aJT7/jL/Y9uduC2N/AnjOhoGRVA2lud1ko5VKvY+CnrAOEe96LVu0KoqQoX5lr+6QqtFmLWddSdE6zqbN2aYB3PHlTwTjUUWe4dduLRYGssnS6ZhuHoiov5KRLrk+Qvw++niwaTvdpI1RAiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:05:50 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:05:50 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 05/11] package_ipk.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 13:05:20 +0200
Message-ID: <20231015110526.53738-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110526.53738-1-p.lobacz@welotec.com>
References: <20231015110526.53738-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: c132ea09-c541-4b13-991a-08dbcd6eb0e0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WHk2nQQ4EPfICLaOg4V59Ilp2NdVuoSiikMfZPlCZGg3yd3yHlsZ2v0sl5p7acDDtLeX8PNNfFEWtn0DKZISoHnXntnb84gxktXawLwwjBPglZYe57EuXQtJFnhoB+s3tx9YinsZanu/nvIjDwPdeNh/vMCeGnM8fvkVs62nme1Vb5TB8JHDGB9nbEnWCBXUOxJOQf0SWyXK9y0l3jyFv1qiMv8mIB2ciRQ/2AmTCsnH64yjEyRoUWZkbChQvh5M+bG2WEimSZ9XZ8hwzYWWQ5yCxOLtipyJF3+Q919JiyThfkjybCu75h5/Gau0e18QjEmRr43Wxo9z7US0jjUbvl2mB0xips+4uYOYqJc+8JvTg7GYjJSEzITRYAD5rLQT4g6IUWZMN1kYzegLjfcwojJgoK/VSPkVjxo7EtP1RrNpBcimsVczNzW1wWHOOStdDd6dnEf23u8CzE+7FVN9LxpmE4OKwdlBeEA0KycXJSfkhSdbQ75zR6VCWSetnSf+ylXmTQrhoreYdXCKq+licOA1MqiouWx62pD1C3MZ+8vhTN5RAz8Vgl+Jehn57PdHIys0FQtQPM/V2nYd2qDwLuKb6RbG/lcXZdQCpoIsiUQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4zGu2UfFkyUQzmC6sNhvnAwIKjf9CQLzNYfimUeR1FGiKS7tYBnlXdvG1VjV?=
 =?us-ascii?Q?KCcXf9rEK2hqlQFPyFjNUuiqr7xOvLKIN7fLxu8QhqUN79t0zw9dR+WEhCiO?=
 =?us-ascii?Q?w3dCK0JvqT9Fy1OL5PWf7P690/xUjNtpQFV3fv5Xp9eX+lSYV03sHT4heVHu?=
 =?us-ascii?Q?kE6R1iw0jnVN+3dk9bNXvf0pWBsxYp+8bt9HZs6qNwjwwBdP57ntgbPJ9jha?=
 =?us-ascii?Q?mSeJFZoKrbrk3vhaQR8zuBzNnaVEnmDlcRbw7ytnB2SHbidrLk3PlXyZym0m?=
 =?us-ascii?Q?T3Vz/xM4vUpioX+8b0VePHH5YisgJDhyWSqJbXdFCAkh8gMO9gInZcj0kODu?=
 =?us-ascii?Q?U3qsT7g/VjbmX6vM6QA485QlPFCxuLgRH7u3R9/WI14G2ijzEshS7yL6qaWi?=
 =?us-ascii?Q?ibQyxqpEk6ryCV8g09MClDDjAX2MGIhkq5i6QeCcrVcWviKRaV/CLfdo8Daq?=
 =?us-ascii?Q?a5DUVTuPVNasG7pxGO3rmUvjmcrOBXShF6NVjWt5LCB4tQT32tyBxh1B+j82?=
 =?us-ascii?Q?Yx8EZjOzExvWtZxFptWjoVgxSfVuugsowAZvs2BRQ3JbIyoodT2yaP5CbRda?=
 =?us-ascii?Q?oHzB7Bs39rWLKfdl4Mf/VERL6S+vKBcKV0TbzmT7N0m1CHDzY8/hGqZrsR3C?=
 =?us-ascii?Q?c40FR+gtnrD8JtF77wIBPxSCC92jxvBgXajB4SN3UgezTmrrpBoeheYWbibj?=
 =?us-ascii?Q?NaQDN2+LmINX03KjwfcLxFq2ojULeamRluEAI097SRPtcXpPTj/WLiU93iCD?=
 =?us-ascii?Q?6Sqs67GFk/MQ6a/0hxyyFckdmd0qUbawsKS6fdSFZXS9LZNtXTsv7qZZpuuI?=
 =?us-ascii?Q?0KNThV2K2jpmasT3TZfNt1ezEPKKZdiecZPicP/DTzO7VfEa8SKkjT4wk+0D?=
 =?us-ascii?Q?H71X1YlEaSTATNIMdfPBcLeAsI7uLV/73oSIw7ShxU1iNNQHuySwhT8tToVE?=
 =?us-ascii?Q?UZm49UOetCxSmK6Vvsr8It+FO9zUtcJJfOJP8Ac2y7nbgDgQDjPHsecoa3La?=
 =?us-ascii?Q?pA74S22lWcdexs2VWhY8lIETAV92zLJuM/6jqH/46tB91MdxNVMww6WH7sxJ?=
 =?us-ascii?Q?04R0xNlMY315QBTIe0UgnFYqfr/OAi/ajkMAPMAoRcwfEljMpWsuvTSE0Mml?=
 =?us-ascii?Q?48R41zxFXf5Qsiq7YTeEbqwO150HetG59Ww1ojgrt2xN00DsR1E5Bxyx/kka?=
 =?us-ascii?Q?w56Bf6ZkBVHkYGPhFzYcH9ZUI5SOHfsGrVBKL3TeY0ath2/lpSFxW+j/dCLf?=
 =?us-ascii?Q?VhlAdxdrRqwaxgdVmLOCCjqgV4d9xYJc66AkHqergeBAUS7VlNCnKiQf2She?=
 =?us-ascii?Q?NHb3mZAQqd67lF1ocACEUy+ott40nuCZI7Jsj25m04PwFffGXuaAK4HnS06e?=
 =?us-ascii?Q?2aVX/naYSHC+fjn9+30ds89WE+isjnnTFBtDBcT5l5f5o0sab8u/IuCf3saZ?=
 =?us-ascii?Q?sBkR6p8RLiRghFCLNELNA1g0a59lSExI551gbhueUfltOmTy9m6tm5AsLvSj?=
 =?us-ascii?Q?sV83KTFBnekAtDuhDqqutKdz7H1VsiUAb8rHCJO0Bf3+KK739W0aeSHP/O/Y?=
 =?us-ascii?Q?Jgx/wE16KI9HxwSZPIEznyby3i5TOcNL5ocFT6Oo?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c132ea09-c541-4b13-991a-08dbcd6eb0e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:05:50.2250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwQiIHhXFo3h0s4N4mD4pL4vmv8rX9Dgx7g/KX7L2H5v9E6srBUmYGxyIAKph5F5UXzdC3WXklZO4WMoYjQvxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105522

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


