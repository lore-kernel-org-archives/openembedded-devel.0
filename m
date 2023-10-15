Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81A9C46CA1
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web11.89849.1697367728016861852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=Nknc4Ipr;
 spf=pass (domain: welotec.com, ip: 40.107.21.80, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyKRQWA/RY9bZnAwsnQWjVB4JXa4zecGo7nXwyr5QOsxS1Fgpj7Yy3qryQ3MXt4mgXNs3YalEw7BnGyqKeo+ysZehFkZWVThJy/7w2T4UQbaga9TNOgC8kPqV63gYiifIz9wTBeKeOmt/U9sP+SBuRDuWGQKGMSfpJLzJmgfzW9hcaT03asFeeZWH98/z334m4pad3LKJvyKnMI+eUQfw7uCpc45jadTnyrjdd+y9tQfs/B7N/etY5rEpI8Dfj+Bmccw8MeoIW5ys0uoUJRXgqd3ACf4d4bXoXL58yTcj7JYwxFT1nRVlF+xCFzYsE/Ngdo+SjH7Tm0F8MH17RN+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AONqEpsjzkHLtlO0IyMbeBemSbONL8PFfff+5FD+yYo=;
 b=Xw/tdt675x8XZi5w5W6IBOVgDdRKlnHd7k4w1G9WnifABiwyQhCjR4c+en9Fu6HmGxu+spcS2PRcreDQVzrFD/aVxxtx9u9RTIrgjhnuOOZQsE8sAKzz+LLsm8ZPmPzFa0fLh4LGB4Wv9L46cPvKDhUk78xgPxZQv1zEAnSmcGoNsLfDoGw5XNDfz1I4r9DbaOA6IlDX0KwZQ1IbeIu2Kuejks8e+cUZvzZNgtv1HZbjUJ+pvTwiSg+gpxaefo7lcwUCUebawc5skvBFI8Xlv6xvk7t97obWzVRXfIQY5IPdM+3EUewOTIn8ssDffLdOEf2whIsbjtRnReAc1kiWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AONqEpsjzkHLtlO0IyMbeBemSbONL8PFfff+5FD+yYo=;
 b=Nknc4Iprv/02DyiWiKQx/8CO3MWxlvNVEjDXxqOX/azTeBV4Dzw9ycjlTGv53vgZ3sEea7GH6GBkVmZIq9jXgg5FHO8KTdbo64vBSg4dNmstpgCJyFtk3Cbl3FM2Aty1ou5pacAlFJk2GcGm30tWw+M1O6XLA37q3/OZl0FJAedOrV4S4cOxX3JF8PY34drvvdCdu2j9/MvznfKk6aO5INUAQPa3C14BTwMO21TkqqkLlSnSUtz4eCjKUa51TBTCZWQnn38PBmkNYNy1phrYFGTnCBLYYV7pykNOdEkWCB8qmKUOAVxHVgSfAXIQ5J80AufVIiIN63oGoqSdEvmvgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:02:06 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:02:06 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 05/11] package_ipk.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 13:01:48 +0200
Message-ID: <20231015110154.53364-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110154.53364-1-p.lobacz@welotec.com>
References: <20231015110154.53364-1-p.lobacz@welotec.com>
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 25596f93-22a0-43ea-c6b8-08dbcd6e2b42
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OElYmrFt0OjhDa7Vkes+Yth4bsIHva+gEfNYdcs3fQF70GlQxDS8dZhVPJ4jMr8z2goIMjDAWqipFiTimF8I+T9pdS5LnguJOG+OrcYwMS9/F/mLh8i1R9+FagK0dkc3BmIX5NfwtiNoTB3B32UdtgnpV8hDNHGxET2igxGZeTnXSOTT5ux9F5oexVyxN7wEoTHWLoTjHJ+n7JvRNZmzjR3ZN2gpVMrU8oyXj4271ScyDvo8hxJDdz90fCs6H33Hmwfp+hiTNHjStrZMdSF9YkSTEA9EUu+hdXKXGS8GEld6JA9yh6mVPy1Q7PpttQHoNpeDAL8nWA2ajwzudnB1FNa5DG1hsu1K5KI/BWDZDF9ajY8ANnsdwE7JBd3KtvFTwS4qfHgvE4gFMdcxCrEONTxGNfM0Q7aqYU95MQXqE6exxTi0IHNuficRjHdS3VfWfuxF6lU0jTuxtOF9bCh0rJKx1tNgTCsTIIQMooWDu/c7HZ2T/Xdotk+Knt+zfceR7EDqVG8CHtcFPMXh9fdfCjEI4QgdZn8VhvA5F0YRWF27gwYWD3N9Lh3V5cS4Q1cEjwyqSr9hNunDWHy3iaUjnFvoPSI4HeALHuM1llHJD7E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/QNzORZr6+5F3sESWOnakFoME17nGoKQDtUsAjIeFO5u0m89ve3QOnc8k9o6?=
 =?us-ascii?Q?dwe3enyGeX/x5RtDoHY+Hui2GOR5o3/buhLtypZIVe+oBbppsv26Mhj0N6st?=
 =?us-ascii?Q?ilbA3UhgyPhYhTAdhmhFNrQPNfBpUscSUuDGqIbn9Bhl7KmJW4bs/bcGJ5HP?=
 =?us-ascii?Q?yYqOGB+X4a156bJOHNLpj7qsDITfMQD44VXbuS+lMYtu1Q2OKMsD9llpms1h?=
 =?us-ascii?Q?FkUKWsmtXvTyMlplXHyU01lP8+KTKDUzbnTNsg2j0DwVul6Py2f+dRWD7YBi?=
 =?us-ascii?Q?KPxo+G+PBWYE+DqG4Dt3BOO3d+be0kD8lJm1cicfEfggVxow3zJk2iaZhcQ3?=
 =?us-ascii?Q?Y5xcSps0QpfK8HwzcyPnzahyeFXma3p1/H6IUmiHtS44x3yN74UQ3spoAIKl?=
 =?us-ascii?Q?fGERdjgU9L8F3PloZk7q+7MoJW2WuRxi23/gGYKZiPtg7cDIMXzo3lMaskXw?=
 =?us-ascii?Q?yBUKW87YTrDWv6OW70T+hOouRvhyHLcn2U82eJhpJJiRHo6m6Ny22F+/RmQG?=
 =?us-ascii?Q?Gy+7C6ZXw3qZnmb0GsVuo4O7l6i44/Slh5nPjaYS6WM4IdAMRHUqd9NNadAZ?=
 =?us-ascii?Q?I/J048LCxI1kbpPLPM2TE71hllp3AqebKw8AxQc7R+wj/zSgdwa0RT+VK98u?=
 =?us-ascii?Q?+gJhhtxTHnZ7ZaesMjPsNIeZ07mCqmNo1xxsyR8szjxrmV+zs0vUfGaOSEbf?=
 =?us-ascii?Q?6avhDupy17vKRsImB9HEUH6QDZLD3beHFT5RtnTejXlZRjuzwzwwnIGu+j+V?=
 =?us-ascii?Q?vElqByRVkJbvmbpd9x1SHQ2jNSFINQpP0u1JHfaUr6IFcjQQt/9bWjpKBL9i?=
 =?us-ascii?Q?lgPONLvLnnyjqZzXpQgKAFMR429Wmby0/wqXP1bSjvahTH6Y/lm/qdoomluM?=
 =?us-ascii?Q?lo3dmyzmKqhFIpfrRNaUiEAIoNZRicijrjVCNtgSD38w8bWiRbe5VYU81t7e?=
 =?us-ascii?Q?PQuia150SPKgOoAEeYnDEAGUPGR8GJLxXjGBHfyQJeZzEr+uUrRE8jC9pPoW?=
 =?us-ascii?Q?rNt537oK0hxyNzELUoGFDnSqTMSzyYFH5RJtGLF6UyUD/UBFi3Mm3/7qGnfU?=
 =?us-ascii?Q?AmaX75S2uHElJmwYnPaXuNdlmSmH0wbI+ziLVIFqhp8QdaAONbkb2rlYpnA6?=
 =?us-ascii?Q?WSU2KsXFF2EtoWQTXnEdk6+2BLxke8BXVPq2tQL5Odkyz7nLr3UfmW31KbZt?=
 =?us-ascii?Q?pRwXFpeWTrsbN6udhlracQKQb1AwLnXkhceYEifLs67X48/Zy7OvwQ/ANUAm?=
 =?us-ascii?Q?K2F+/O5SyM3TLyw/vY0yceMaOpNhjm/SyD33PQyPP66ghrVzUTn+NrUzj6l9?=
 =?us-ascii?Q?4IUI3OuiYgk3G5hVxrPZLj3V9IghxiedAGkBMl4ApNZGy+kwDVp5E41IUqhA?=
 =?us-ascii?Q?XpgtFhVpGVCl4Q1faOpvelNbTGvXcDVQv7Vvp/+FV8P/396FBuGwuEcRFYC+?=
 =?us-ascii?Q?5iWURtMMyqEUZ78KRI+27dzpNVffpTePLYMXRUaptmMfN+4bLyrko/Pwjx2X?=
 =?us-ascii?Q?ierWNINVVz6B2lE8zlizAKC7AMW92Vhi2tG4diADVWx8Z3SfSCdT53YNVjB0?=
 =?us-ascii?Q?h9CKxqtpH/ZFdwNNLSRt7WKqPj1/JOn6pI1tmSxd?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25596f93-22a0-43ea-c6b8-08dbcd6e2b42
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:02:06.0449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwRuBFnJdHPADQHiYnLnCRwAxHhmloT6f7uikxbT4O8fn77xPsTtKm/kQkOsyc3F17+v0uGyTZYlXEKtOH6QRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105510

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


