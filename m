Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD01C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.132])
 by mx.groups.io with SMTP id smtpd.web11.48815.1724665267299741598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=IBGC8p3d;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWbpajNJifTW2SQZD2mc4/olJOOY41IJzRbHqdnO0s2dAL4jKxtQ7mERL/at9wZu912o5LFPW833Qc9eP54EitJ3O765osXHYaT29t678uvKlQH1+6SoKkxP/YDrQ98MuL+QArNJ2i25Rfo7Hm4YoYMMeN4FMnEwpGcNvVyYz7ek/0DyjgnP5AEwX339nm1qAXT0jN4XCG6cwoWyajLpEQ5XVzf7mMHOYHhlRxOOdJ+5THOIinsWAAz0s27xmeJz12ezcsU/D1epuBj4Ux4nU4f2wtQoYRlYU+/I2Zb2pIgLtEwsoJFmWtiHZUUWRzkbu4V8IJUrUP871oG3L3zXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fShn1o5rJXWmcr8aDH6S2UZe3RxzvzlJa0zI6d+Evk=;
 b=BKPou9n8Zk3vGvtQIxOQGn8308FOMR5OGM0XoiMkzoud8RCBQ7skh2B9BF8A164ptlb4buIToU0r0S4Knm4FpG0fLq/oItV5s4aLI2MOIZt5cQD84YJYm1VwOTCW7RofNDE93JdkM4vnO4iQSG09sti78zy9+ZWh4SNqAoMYOTC/wPz2BEPUq1UEW5XI6eaHUWnTpp69I/pYRxf6cUhORdYWilH7b9Wf+N906Iq5RjUrT2ygZgJgMmA+NhwfmTkXkYwaNYFJRXRGfea1MzNbMYx7FJy/rBH+qaFEYdwmoZ0Qpm0PLVYiMAkH6qjI/Sdf+n5ym/8sM/xUCeJ7P4posg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fShn1o5rJXWmcr8aDH6S2UZe3RxzvzlJa0zI6d+Evk=;
 b=IBGC8p3dc7acl5FYFRSoaF3taI96BCUN/hpbpnERtqvO9Ix5kzrQrcGQOcNXCPO1PITXedehE3teyFDAb2lxPj7B6NExEPCs4mYd+0K5Jzck0mC10RCczWmTH6z4yeRK6cSKlAgZxl9HNxYkXMvqxEa4jZ3E/KAtuQ76HPUFxBJQZYfoQ+VX68f/+jnJKTb/bBDCBLxubzxqO9/KsprxxS51Gp3z+EFnWkQytNJ6CR+naYrN4uU7OlxqAU6E9zjh2gnyVu/QgjEdd3YS4cBQoadLq9PnqD7FijO5RM73eSDcnStsbKtGlOpGQ/lGX9HRpV/Bz+zjHBGF3w1BTLYKxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 16/21] python3-pycurl: Fix LICENSE
Date: Mon, 26 Aug 2024 09:40:16 +0000
Message-ID: <20240826094021.2744296-16-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826094021.2744296-1-niko.mauno@vaisala.com>
References: <20240826094021.2744296-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00003668.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::384) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a2bd06-92b5-43cc-3c88-08dcc5b3313a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2M4vXErsvuB9V6YRZ/LeHZ1yMR0V9r3REu7mXKxhtQigDWvuY1lNWDM2j4UD?=
 =?us-ascii?Q?E/8eAZg2ZvBsecJ3kEhyksuw93cWpWDRSpuCWG4PcwBAeGwTswoe8mU6bLw2?=
 =?us-ascii?Q?zghfIPXeKnybyHuKPKvtzG+gCw4wls8S9nWH5AuUkR1zCFrtJoHQ/OoBxyHy?=
 =?us-ascii?Q?MEkZKO6MWjgkWs5S66PTprU0bq3AykkD5THIJmTunAOUW1feXnrtCMwARe4N?=
 =?us-ascii?Q?uyU4WJhkkbZdJ/ok6hRTsaxdKYxtwmeubDZG23Sbq3s1kmvLvthdV6/HsNvH?=
 =?us-ascii?Q?xAMcuDRxEW2p5/ElZ0Ck6PDFJmdnKpo9rGQoARbuFKaD232lgwbimQ8Wz8sE?=
 =?us-ascii?Q?aYlfzLVAVNho+WR5Z2+95vXt7SCry81Efhx/IgwgPQ5nW4thbCnEN3nWRu/R?=
 =?us-ascii?Q?+Hu2Tb8gkjGxIZ3Fj6m9CTV+fgO1LikcsuNAoWXPVkaBY+HyXICiswTHAOes?=
 =?us-ascii?Q?75CVmbjd8rbnQoktVQ0dab+R1HbCL49/CHNtC1dNrch0zaQSITXYNy7FttLS?=
 =?us-ascii?Q?YikeiW9BDUUsjO5PMjQBadkKLAyyhHxCPwC5JcrNa8EW+yW6eJwzhJ1wnJzT?=
 =?us-ascii?Q?2NXDJrDRBo+Fbmpdl6kMjNMIeHFxNfxDEOV6EEnNsr46irUthiDrP8jXJ98x?=
 =?us-ascii?Q?sa9xhk1Kv51ZqO52XsDcdynWnfZmxhY2ZqVVa0hLvxENk6dWeBgTfeYYmQsx?=
 =?us-ascii?Q?QzvZHF8YXzpTCjk0qt/cxOzaw1a9JZ2RsNauxj/cmpIYRZWrMV0DMyUhiPM9?=
 =?us-ascii?Q?7RjtCs5uk06pJYtPA3ycytOEBe/6ufAditQbMF+ZS+hmyVcqDxqZtwPUDVPO?=
 =?us-ascii?Q?wpeXyaU12bbQIOLVweOcGMTFLD3beoGAfDdefRT59FUBzlL7n7Ljg5mTbI5/?=
 =?us-ascii?Q?j9VIq4Vd+hnqCcZMYBoYejEtYrpLa3Tj/Z30wc+30o36nMQoh2dX7LSa/qtP?=
 =?us-ascii?Q?uJnwurgADgluFU32hLZWctwZCwaBVWEqZvt8qRXRAaVZ4oNGyvYBG+u6ZwNQ?=
 =?us-ascii?Q?as9VX2OEzYLqEK8MzPd9zHgHdFFgvZDNScK+tUHESUYQ2lElvBaWUSblJWNN?=
 =?us-ascii?Q?cxx+GjKUbedxYhGPT09dGWOoZv6wPHm+sk8Sn75rRVy2NXX2C217tf5VwBJo?=
 =?us-ascii?Q?sWA47Xk15g8+lcW3XFbmVAYS7/jnvEIOeQeqUeJSvj2jlkU44GvozNFtqTC4?=
 =?us-ascii?Q?kEctmpupzVis0Lzy2wEKno/V9ggeyw6UYdR2OoWUxIkvxwwR76W2sHhcJ+Ks?=
 =?us-ascii?Q?IY8nrnumt1NuwfTYnOqIAyVyNVoElqPW6mGP/4sEk95pJeTrqW/8c7xukPI3?=
 =?us-ascii?Q?SFPbHlkfgZOaX/e9+B9D2zGPDLSDT2jPF5j6ttvHGvCa0A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dWY9emtuwtl3KFw1MwWI2uAEUqnVeXy77SXkRK+ZiLi2G1FipChWsgHXCgjw?=
 =?us-ascii?Q?5F8/K0c283qt5ZTIVASNuGqwu4XMxyoXUh8NOEbcNcVQUlAM0LiX3dBt+X1G?=
 =?us-ascii?Q?9eg5GFeJHLuf4eddQU/mgaVsgmLGSit0GnwfKw83SjPz5jzE38HZz4Ht7ntp?=
 =?us-ascii?Q?MMk56IQ82aNuPNHcagO1yRZP/u2QY5fjb6UKE5wucK+LIX/9Wu/oRnjqomO0?=
 =?us-ascii?Q?aCHYS8rEGfF/TKrHXwtIj13gb4dgkaqBXob59GoDr//vjAw5xoNVPo/BhzkA?=
 =?us-ascii?Q?F442q6iidoQiD8mT0UKZAUz//+4pKlQtxeshd0ykqicRp4732JVKx8JfQdLF?=
 =?us-ascii?Q?FWksgRsJ7t5itgHzZ7i1GDQpKFk/zZaGa87l/xOGZSgUjWWdwnchmZxKIEfv?=
 =?us-ascii?Q?+mRfKMnbJspOCb15WtAx8slRgRG/ifIlSr4PByxCQbbYbzNlDnltrU8YHvnM?=
 =?us-ascii?Q?AXzbVYq6/j+djp+2NF3+Kj2cv/w18GLW5C8WoHVPQpEzknIi//4ROJlocP4f?=
 =?us-ascii?Q?dkDIGaktahOtxiaIoLi34IJQ1O7XOeOg9CvRbbQ5iE1Y+1uABK/lQ+xF3R8y?=
 =?us-ascii?Q?gXegpJdKStK2Z3gXvbmN1jtYnxl8dSDgzcjtjyFli4evRy9A1J9/mllVmHmC?=
 =?us-ascii?Q?pRjmOBoR4+5BcQSYl0KuS4yqG+tLgtm7+vOiF6n4XNhUBnjV+RXPKJafneNc?=
 =?us-ascii?Q?Ch6XG4pe1xFRUtmU6SEMokLDeA91m2Z6fkR0A06DHlp7M91Bj7jVzn0OAqKw?=
 =?us-ascii?Q?VLjtu5YtWSLq4jhRrC9hkVlJ/ga/WVk+8F4rC+I3iGlq3k9i/zap404vVf/+?=
 =?us-ascii?Q?jdeyoG4j1E9WVDTv1jzJL0Tb0n9AWFHCB8yzhyag9EQ2p54S5VOyyp4ypTiA?=
 =?us-ascii?Q?0B2v6zhHH/kRayzcMxSvh4ePyZFOe8XTpyabOIMP6anm70mGzVj8UefFReh4?=
 =?us-ascii?Q?2djSd7t682oIJDGXJZ9KY207Gg4YBOZZ8SIb20eDK8Pz+g3qPo7r9yz3HsJn?=
 =?us-ascii?Q?au3fLNe32wEJGAGUGtw7XCquRjfpKELLlyLpGmbyRgEgX9m3k+hPUDEnSLms?=
 =?us-ascii?Q?j7Q7Mud3j3nWbit/Xpiid0APMNPAY5hdxYReuAcMgvvg8sOFAh5MeJiUfBZS?=
 =?us-ascii?Q?vbrFs/fvKTBH/vyCfZ4EuZacqqJ+9DCrLWfJjaTD1C7fsDEMZmnwXGvRl2QO?=
 =?us-ascii?Q?4YvGrMhZN3Sq8PP4P+Xvz4eVQ8G9cotC7QkDrBHt4sACQVKPjKZ26RtlG2pA?=
 =?us-ascii?Q?YDNBhnaQxdjDX2ircNf82L1A5tyJEfBIFTi8pqKE7ScjL+coW+Sq996o3LdB?=
 =?us-ascii?Q?qKln+eTb0xoCRGS5fTpI+ykS+mDS9G9sk8jIIKuUbM99YRb4tH48VLdPnPkK?=
 =?us-ascii?Q?6CVwSRnCnYbc8fyvfuFvj3p5xhJq/OGNvNfUDjHz3IzSbqibh6z7at1VMS46?=
 =?us-ascii?Q?iT9L5e9FlfLFmHsB3Ieh0PQuBHyP1XK1RMnHpwjIQK7i3mN8j9vvM5xsxXwJ?=
 =?us-ascii?Q?W1VJir6m3l5phZxSV6O4u5RzN4UmA99gqyYOLFwP4lEaEulZkgGBRpHO10sI?=
 =?us-ascii?Q?HmX/t79X+90FWAYLzbMqIuBhfn/DXqNZwn6vKRpIRSX7fGERekMS/dGy3w1f?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a2bd06-92b5-43cc-3c88-08dcc5b3313a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:59.7179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihdOeSKmWTk2uU0FDgidcwda+v5QqTdoGCAXO07vTXdZAuUiU2pJR+vTxwU00SxYdSVAdWi05hY4ABbaEnvu3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111955

Contents of
https://github.com/pycurl/pycurl/blob/REL_7_45_3/COPYING-LGPL
correspond to version 2.1 of the license rather than 2.0.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-pycurl_7.45.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.45.3.bb b=
/meta-python/recipes-devtools/python/python3-pycurl_7.45.3.bb
index 774c1343c..8dcc2dff1 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.45.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.3.bb
@@ -7,7 +7,7 @@ be used to fetch objects identified by a URL from a Python =
program \
 SECTION =3D "devel/python"
 HOMEPAGE =3D "http://pycurl.io/"
=20
-LICENSE =3D "LGPL-2.0-only | MIT"
+LICENSE =3D "LGPL-2.1-only | MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING-LGPL;md5=3D4fbd65380cdd255951079008b3=
64516c \
                     file://COPYING-MIT;md5=3Dbe42e1b1e58c8d59c2901fd747bfc=
55d \
                     "
--=20
2.39.2


