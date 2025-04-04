Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E538DC369A1
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 08:18:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.122])
 by mx.groups.io with SMTP id smtpd.web10.6510.1743754714572896958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 01:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Gua+l2rp;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.130.122, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXMg9J71H2FiLxtHMF+Ss0SQbylG5o7G6mHPHJZwbvtCs5k2crf8G3yelsFYFdMlY10JFYxwnR8I36aXPMlEtZsy9Tk2qLaduhwsrXwEWxzM0WwI8eE3GusFcDZhgLVDMnEtkpFkF6Jmn1Knsacza7OFotNCAD655tzfAhLEl5Z4tlubSW5KuCOr5YLMhRR7x7+JOJprMAdEa2j2KEQIXJDgz2JHxzXP/ojmsGI0QsHgVVIYekLB5bEACtIJCUZoR9NnAUasUaEZRc7Qzry15HJ58sn0H60hDrbMpOjtPJQHq4RoydCc81w3Lw/6wEFqDNmoSU/DvmJHHzW2wdDTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lDV2gMxWCHiAHmEpUdyowdYaKuuUvwUekL7d1TckzE=;
 b=Mi3ZhH3MozxagHgAiEBVOtSY1KmcZnDnHFn3A9GVr34BNdAIjIVCmxpFagUjr+K9LbqHkRqWYufi4y7wU+nNPIZgGzeFm3ryRj6SqPkBjVY5o0IKpQ+/QJ3qHGYtcM0+V0iDPz4kK7mVVfyKjvEk/dFBJLgRkmdWClww8q50SEOQ7ihdjDclCvtn+qhq+996CR/TMLxWQxei1lYW1pTavPHWrfETJUWGp06eauORZHLrJWSyt8iR2XlmOo3ecoJTMblAh/qwOsl0xJi6IWWW5GJhdtDpPFlqO3cC5Xosuupt3kDvzimtMC2zIUMLyF2P7DhX6D6laH7Bi6H92RRj2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lDV2gMxWCHiAHmEpUdyowdYaKuuUvwUekL7d1TckzE=;
 b=Gua+l2rpabmzW60wbQyZScBvRkfGdeJ26HjlGT15vlx9sKFS0/EQcZsyxW4jFk+pr6T67TQQfHbQunHwqH0KMps/oE5RdORoTodiugt2wv+BB59MOqMjUmLUMZhs7ridLAqZV8yuU3EBIZ5B1voWj1ddpQSn11FmU5MwiGsyRroH2pmh/2Zk/VkPHG4/R3fAZNBuYvvd+wxpOteIfzFlVasYXaVup2KTzp+vFMKoQZQvtp3+14MLfi4X69VA2pmhxnY6OnkH3GaNFvWwFQS58SwWCfq7tyARGcivhdOmJQS6zvfiwPs38NAJmTI1zyYSqEnoa2Sisfv7rBP9FMQgtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7471.eurprd06.prod.outlook.com (2603:10a6:102:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 08:18:30 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 08:18:30 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH v2 2/9] dbus-cxx: Drop libsigc++-3 from RDEPENDS
Date: Fri,  4 Apr 2025 08:17:58 +0000
Message-ID: <20250404081805.663425-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404081805.663425-1-niko.mauno@vaisala.com>
References: <20250404081805.663425-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::9) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 895d342b-dfdb-4b0d-e033-08dd73514872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ItsbWu2Rp8EyGhs/ME7M9PKWjuJ1pYQpucYl3uAw94nHi1V1FJqtvTGsvjfq?=
 =?us-ascii?Q?ExiVguNSHEvjuTaznSgVTVNQq81yX7w6JouI3S0zbzkYcL+sRxGbj8eMs9sv?=
 =?us-ascii?Q?TXky/VtQaVCiM+XfiLukOmJgNTStAQfvLryQT8FYCcJpKIvHg+WQVqbtzRPo?=
 =?us-ascii?Q?Ll/jthMQ0Mce/gSHg2/3TOcw2WRqG5WDZC2N0fbCogturPbhB3Dk6AKyHfL4?=
 =?us-ascii?Q?z5oRyiwBfuT6QnmTLMbvIGtzql2mUhEnvwGuWpf6UdcSoyzyjz6H3f1TXgYa?=
 =?us-ascii?Q?mB9WtUt/j/C3XrQGImuJPCcCKtQ8i+RowPvSr0JPtWUnHVcx3zgFIeqy66BE?=
 =?us-ascii?Q?S72bIlaADWl1FAUsnvZ70mfLfJzi/WSbRVvrG6/eSdn8XjBLWG6qRHvMEL4Z?=
 =?us-ascii?Q?TZS4bf5qBlth56ImAvAeZ4PyKwpmagibJLc2EBkuZMJ5GR4hditGuzExzvhv?=
 =?us-ascii?Q?kzNABJyDK8f2HsvaIm+JkHYzYcCeZYjW4bllDsWcDjkIr0kAONQjvfi2L4dB?=
 =?us-ascii?Q?k6DnPkBqxRKdcQVadBOcBYJbA54rSQ1d0M+1MP3fGx5uqGd1lPtdk+hwR7bt?=
 =?us-ascii?Q?p6QYqyUvQNWrau8o5N7XT3Vt8ZwLEq8tRRLYGGorakSSZ9t2jtKFPczggMpx?=
 =?us-ascii?Q?EusnSe5BIbruETgoIEGHBMDoMQ8MVNDGJAw9OA6wpFlzsrxeGBQEsbJiGDpV?=
 =?us-ascii?Q?JWbiiLjIve8PdAefgH7PFZ/gXIel6zyTuRwHPrwymFaoEDPzbPBmqVp4ylOO?=
 =?us-ascii?Q?pTG3OK/dq9W/M91rSsRG+TLhvlm/ErQ/KtSfacqNGpc74BY2DIuSsbEoSawG?=
 =?us-ascii?Q?jr2KJx0qfcVc9+dwBj2lKPRj2d8SvV+1kdjPFKaAoOdV9IZQMdrEiIQ2o8DI?=
 =?us-ascii?Q?TdkG16XKsQo5m31Cyh25KLhnauJd6qL4bIWV0ChEau15MmzbkdW2HcOIMmc7?=
 =?us-ascii?Q?IRx0uaxHH2wu66MwaBXYEtAirKEe2v7x1C4P0OSCWOt+IHXhQgRGQsLqZBZD?=
 =?us-ascii?Q?WExuWn1l6IrGVJzLOqYCPj2K67ilkOGVPx/tYxErbDONxhAi6xVKTJqcarBO?=
 =?us-ascii?Q?JxkUW1QdaIq4xFu4MlNCu7mY8ikiSes5xkvsPO/kCr12bteXksQZ5/5DupqN?=
 =?us-ascii?Q?Cu2ps/XcytVrcDKdXQWLTZj/Qnx7CAUcm8atabHxast6H+Uu1+Q1TScAx+pZ?=
 =?us-ascii?Q?+oixiQl5DxslakHqWXlHuyolA80Xwx1SsBkF4yzZDuyBOCnSCG7XWDIM9H31?=
 =?us-ascii?Q?zG4FLo7c/zoAao+waEGt2JTJEinnbnvHifZiTFpsGdBUofk7oMTykdqnjk9c?=
 =?us-ascii?Q?xOei0svHY6kgeCIPwy70pITFB5NIAuy7yF8EE9z0LJAmtp1m7pOLENp4wfVm?=
 =?us-ascii?Q?mOeHCabcMK0XghyDMr80Fh6+ed88NpXGywLpeRv8RM7auIhTAWxAC8pht0DJ?=
 =?us-ascii?Q?ac64opw0F0ETz4+Mu98HMquSicPkLxFJY2Vg8wg/nWtYgbZqOMrh0A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?70/B4dKN0bVXDyV+UBm2MqC7LLV9KvWC590fwvGASQs2nJkmRGGNtmlkysw3?=
 =?us-ascii?Q?d8crV+QZcHxNz2EQ9ZVPrpyBuHgYy7+d18i/uYy4fa5DdlMyznfFLphoEMn6?=
 =?us-ascii?Q?TSUIGePI3hRYTIfAWzYQJkath0YyKLpuHle3gLnk6/m7QXQsqYvRxkFuwY/E?=
 =?us-ascii?Q?UtrTgV9ayswr6YZtNArIUkuJHxE+oiBa0YsLRvFfdJ9MasXHtO1gD3n4Rg9E?=
 =?us-ascii?Q?nncWtPVm9SuSzrEtfqv5VcqjnXhRZ3X/TQ4n2D+85LxlsughHn5todBoGjPS?=
 =?us-ascii?Q?B92yr4qBo/8RvIANy90fKv8e1KmpVHF71IHmPBAMyXrf9yNhiI+Tc1VmJAny?=
 =?us-ascii?Q?wtlzLLRYpvoC0HKdBA7gjJ97KQj0hm7oiA/HXCSp/Mawn3hlxzZlpTHc3ARd?=
 =?us-ascii?Q?MnsY9hS2fcxkGQhSgarbWzpX13/q4s7VyhFQKG4zgvpT8IQpPkGSFLw5GNU8?=
 =?us-ascii?Q?KWXSSkT03RjsUhkeHi2ki4EAfw6LJBMIFI5H0NqS2Bl7+NM0dbdE5PTsugB1?=
 =?us-ascii?Q?Dd8LGEPxzYk960dHmZMXadYXCDeB56l6c1Ykp67S6b6UuzgD1EKBcM0qkJCp?=
 =?us-ascii?Q?+2ohreeDawyM/ap9SJNrr/jnDDbv5Vo5L9zccwHiGVMtHwmwlV2EegtC9iKT?=
 =?us-ascii?Q?fduMzj3u+NhlVaVKrh5a+T76rvT9Y/T9Lragc2xM84o1YbwmNS5c+UNpqeat?=
 =?us-ascii?Q?cNLGDSEG3XSTVaaWIHC47LuDkJk4IexR+c0zfCF0rwhG6RXwHUqBmLJ9axTv?=
 =?us-ascii?Q?ozrU9GOFDmR5+HifKWxIcbPo28M/qE7zhZpBW+1pYmzvxUAZaQTc90EWwA/w?=
 =?us-ascii?Q?0wmHFfmR2TAKQq18+dIL6l76OhKL5+LRnOE3IBSi6YYNE74kHUdwVHrJgUMo?=
 =?us-ascii?Q?87v9+6YkKxc9uVBASgwKSM2f5VGeuwtO1sDFl3cEOSvJqRCNvu4UdPPh+Nro?=
 =?us-ascii?Q?rphBPQeaWBNwInk4qE1iqjLUlzfN/2/HF2JXOIeQYVowaoI6d91N8XoT0Mcx?=
 =?us-ascii?Q?TROXYbiUIWFPoGILqgDokY+1Ky9yvPE96VYwk+zf9DmCmXtZtzc+rtJ0CXwx?=
 =?us-ascii?Q?KLuzyJ2RsyfoUluf8btM+GhxPgS4XIEh/AxsG0SJfzOfIBBClaW9kavN5GUn?=
 =?us-ascii?Q?3M7o5Xq0TOo9Hoknbr0lDTA0jCo/oSmHn6q0pr5zq9H3rCFlCVLz08Gk3YcP?=
 =?us-ascii?Q?fEarneBc6LkzoliCDVQqrpoYTqYG9xa9LgagAgkYd7y/1vn4pEq2w+fNMDWn?=
 =?us-ascii?Q?h754uIO9UOZx2Be6HZxmNVPO0LEOgzMPVjoLTeAF/5+x1oNAOvdkrCFxysYm?=
 =?us-ascii?Q?VXANtmsTU84epdphCtS07WvFWtvS203OBUdLVEbNLKHNJlAVczzZqzi/7buA?=
 =?us-ascii?Q?Tem37s/9WZPAiGoGUBj20ZrzaD3jg+38GBrfXrBoAD9xmPlaaBYG12XnT++1?=
 =?us-ascii?Q?RDgpPR+S8jmwS5r1ALe4lCMqPN0FQTrOJXM6wuuqJGnmx3WU4pgx4eRHdVB5?=
 =?us-ascii?Q?tm6tPG9i+GGbKe9BMBRl3e61MVOw65QDHwCAQxIx0Jn4b8L9S5KUWjsxQ4Dz?=
 =?us-ascii?Q?yV/vwWGlGomLZcu2K7ZnOJ3OxuHQQ+0ldNqgkUr3Vl6WNhl3X8MFI2OyVq7u?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895d342b-dfdb-4b0d-e033-08dd73514872
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:18:30.2929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtrKDITH7HAVo05lTvzlxv3k2PnDH7QMEcOrzUW8zXkR0eN8L/2U8qBi460BkWfqfI4Q9RPaQibzanfXGRHHlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7471
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116563

Since it is already declared in DEPENDS the build system will add the
libsigc++-3 runtime dependency automatically, therefore we can leave
out the redundant declaration.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/reci=
pes-core/dbus-cxx/dbus-cxx_2.5.2.bb
index 3282e4dcf2..a10f7f22dd 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
@@ -10,10 +10,7 @@ SRCREV =3D "f2637e726207ecfbdaaf02744e1b36e54f929c9d"
=20
 DEPENDS =3D "libsigc++-3"
=20
-RDEPENDS:${PN} =3D "\
-	dbus \
-	libsigc++-3 \
-"
+RDEPENDS:${PN} =3D "dbus"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.5


