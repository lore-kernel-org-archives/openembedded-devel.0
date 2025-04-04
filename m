Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E394FC369A2
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 08:18:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.122])
 by mx.groups.io with SMTP id smtpd.web10.6510.1743754714572896958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 01:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=AF1RH20C;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.130.122, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQMiYZazc6VUmtndZ2nFf5UgXIZXnxjty7hw7WCbrNCO0l1cycZ5lS6BKTHvo3DqX/OwlUfW+OKkkSqP0vRV8k/9/YSxRVSBT+c8yZ+O927iDTSf/tlNwQARnqf7iNmo04fEojQuAZgUQx1tMuKmo5GRlJ6ebdX26N9uw1/9YiyDY/nzdJTR+EMT2jhiYa/xM8mr1LA0KrzbgQXQjMG4FCK+hMmWfpCjiW7+3E+x0S7XhtsuOW937VElsFBBT0hOX4Oht1jReSUPnhUdZfZSm8oGOkwC+7Hph71WCLwYrHB16U1Bl2FdbUp6M3Q72o2p3nXj183WNk/43YfFmxz/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gq2LcczDs6o1NS1a6z5f636L4rQouzzGAWUeO7QDKZ4=;
 b=KstopwO9ryapLgNap/F6+MC5WHSWaZCRNyIIN7DbZiENmcxz2U9yjbvoTe+fN5GYNY1xrFXVH+16E71M7zG/PsStkp+/2TVpafl5HWeIE3PqUPLvtXbISGHTkiPuTWripA6D5w6n7wIvmrLI2p5J1Uyq/azMP1ev+oqIk+mDe7y5y1u1ZqNt1KQTNb7xXgouUOfPo7GEwvSmtSgXCdG7UT1GlSfQk5hdvgTNyqXpns7IS5tTQu6nUXur8w4UCXRBVxHirh5TjknKG3nOJidAwNrXcA0tTqFKwV4ByTrOCyGLVq0AyDjuZzhiCeV+VEoJXQmjF2PFQ79QexYG/Q97hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq2LcczDs6o1NS1a6z5f636L4rQouzzGAWUeO7QDKZ4=;
 b=AF1RH20CR08kx6fme3va0qBQ7hbSIZiO4Xy9/5EgXXZJYEc2hiT8K/s2qpg+cFITbywp7VcoQXuSWSb7a0MTDTCvwpxnZLdaM20axrLXmNzLOBpxhMupNF9N94+rajHAtGaLu1jC9DrG6FFBYVtisPKKXY1trTA8ib0edcBSBZQ/gLkAk6l8mYyXflkJpw3oxlUed4q6e6kyYIJ737TnMKdJ9/rEFNnarPpr1dxsgLVznIcSm3iLLPS+2/ThK3eHA7U3Xlvxw447Pli16wij7+UIExkbBve05B0CswIrrr6qLpMEBMboees0ba2Tx6IhmLoIgY+c/PN59vepP+U8hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7471.eurprd06.prod.outlook.com (2603:10a6:102:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 08:18:31 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 08:18:31 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH v2 3/9] dbus-cxx: Support using alternative runtime D-Bus
Date: Fri,  4 Apr 2025 08:17:59 +0000
Message-ID: <20250404081805.663425-3-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 54d09a32-7998-45a8-3e09-08dd735148d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dulAinCPv9ifKU3atP76WZGvdB0fEU5TtezkiI7DAY5uNiffODWU0waKxKhH?=
 =?us-ascii?Q?HiyWmBo+5lVoch8gFPWPsMst2y5b54/2OxWbZr3RNcaQnmrOQXS60eKPKkB0?=
 =?us-ascii?Q?377KF4gD9qm0n0xsHCYTRIWts3jxmtN2qFfo5zsMcPSPsXl38WdukJV1+WQF?=
 =?us-ascii?Q?jAv+7iXql+DzQyh58vJloUY3nVaqvb+8a+LR4yF4UfzM9TsiR0rq7gjKDdjv?=
 =?us-ascii?Q?iJJtyYWkROnPS9Ih6BzklKLV3HCD0kfqPo4Dq1/fh1rQk+YyJW/WupEvOvJI?=
 =?us-ascii?Q?OpzwT60v1v5r8jBA9esofHM8GsgWGUycVlOx+8FpqOHYjH/Qk1xgHtAUwoYD?=
 =?us-ascii?Q?JJsitCxbXg5dpX1xG9hlVwMbv7TFog2sMqjUCjsodvDWN0pBCH+cO1+7Dogc?=
 =?us-ascii?Q?/0mYuWk00XhYEzyvbKWlYVkzaNj+cRtqKzIz1FfNoKFY6+NU2RPk/y7W1k5t?=
 =?us-ascii?Q?ypXN9Fq77vD+XS2quVNZNmcOxyafgshjnySmVSCMTFbb7YxktmSo9Jvvvniw?=
 =?us-ascii?Q?/u/BU5rIaKKFnQhJk4xAPLkTj0ejgFC4YrIeV0mhdUZ2ByPLyNbdOQGQr1v/?=
 =?us-ascii?Q?k7YtC0bcfUsW+2nBQ02O1OE3CVBl1FhbLAQgz2vRmXzIU9IW8aWYKm4LByq2?=
 =?us-ascii?Q?cneW5IbAKwrojdUL1DDXDVtRXYmAazB5hVyElUbYwT2wGxkn3wG1T+tsJ0Sh?=
 =?us-ascii?Q?mF4vE3y6hEtP516xD8lOncai3B280rcECmQFSu3mPxlgRtazEkxTqEU9r5Du?=
 =?us-ascii?Q?/+0JCIFsLZ/hfomL5UkL4EXqIxjVk0W/kygmgzY8GC2ad+Aty/nlzBjcY9KU?=
 =?us-ascii?Q?SNlUAK/ZCjkX0NLrlcqI3/KxXLutvel8OaM0ZmQgH2mfdWnvxpWODhWrPZA3?=
 =?us-ascii?Q?bNxd2g6cThcmMecKOaxsMc3lXABBSiU31VtrEEn6w0nt28ajNT0RMmoMqSzE?=
 =?us-ascii?Q?z6YFu/ooWQJaNFMdzrZU0DsIbGcedf8E5Y2Z7YTkIAa1i4UwNwGF4uze5+rs?=
 =?us-ascii?Q?aWCjDBGK5FUgzgMO3s2fS6tYmWASQ2yc7RvY9cWxhrPFAxz131UN+8hzxdQs?=
 =?us-ascii?Q?w7OigTxyPWbFiNlNgSJ6NhE3d655jXZyNeJsohXDhpY17CjQm1SO7RrG40xO?=
 =?us-ascii?Q?rgaqfNr8PRd72iDn+1tuhmVb6Y1KpzaPyz9hoyoOPNHw/0rVjYOfcMh5Q1L4?=
 =?us-ascii?Q?G4JzHY8PH7RscUhiH1BZGfzdOhxv2xfsD3mqlG3Jo7s9qWVgc2nbwv6JKKaH?=
 =?us-ascii?Q?c/jMqkYYFa8gaBH+9CEsg1aAsQE8LdEyhCJmIe/olLwGyLLJvr5NEFpVV4c9?=
 =?us-ascii?Q?iqdSSeCnRolBXx8msnVM75Jq2ody9qJoTwXADwN3EC5WdkIECcTOF79QvNci?=
 =?us-ascii?Q?VHbQew0W/SMoshuXfi4K2ti+rQKKF6kRg/SHuf1J24zID9uVlQSfZwg/bz8z?=
 =?us-ascii?Q?RkH8a3iiXSU/kujf16KgrDLWf6wKUAXFnibRBPm64om3aiZr6mRvzg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KkmihBGUPEc/Ly7kOLjxb8ttT5JhT41r4R656iEaiOjasyWQP7pD0P+pqEYj?=
 =?us-ascii?Q?ZVhDz8q+TIgqy9+sR9iKPjFjeOVUIPZUHD5BVpsnhKl65FWhEEYEdxS512tJ?=
 =?us-ascii?Q?A3CygGdACZ66tbA1rfR6VR87vP4ec60vf4iOliUfqs5VudbH6f19ZK4WtPgz?=
 =?us-ascii?Q?Koa63b+V5ZJplTs0m4dQdcuzNDagT2zVl2Y5BgApz/DgB61FEXtkWVoCCYCw?=
 =?us-ascii?Q?UHYTijfzfm9eFLanxPhznb9SVYBbYZMoZQy3FmbXxm8WyPKM8X/shKD+8vnn?=
 =?us-ascii?Q?ldh4QafuLa8kUc9LCSMV6B6rI2l0bgeRMKHEZMatNHx1POqmpMGbjLRH/zwQ?=
 =?us-ascii?Q?bb2/TI/XeYPj8Oy8SPbxTUWnz4rG751bXSicKpH0ukI1JoXglAYnclJb4h8m?=
 =?us-ascii?Q?K4LsqFavDnUTTScQPz5B2kB4yWsyinkZ4YMIRUP1FMkxPHS5aVdbv3dqL9lO?=
 =?us-ascii?Q?CfnVXvulMDjbK8vFtVkRANFl5wXvKSFENsd7AZjOOQ1Q/AHCJKnX7x88nkID?=
 =?us-ascii?Q?RagT8wpAIpeK1UL3gkwJZ69i+IV/0vm1w5xXhgA3KJCoLOt/vBRnqtd0Dhyj?=
 =?us-ascii?Q?ObdSYGX6/MPTyNcf/kePeMgB9mjt2Vtp24DZv4PevDdizkExNWsOPgNJEJ//?=
 =?us-ascii?Q?7zKvRZHZXUXUk6H/jNkTzQgzyprjAo/0eOQq/uzfumaCzAgLY3WCMeOlBPXG?=
 =?us-ascii?Q?d+KdWMAamQzYG6I2UoUrjuwufzqogPVvalovjKMt8NRb4qyVzNC0x1kUgmLl?=
 =?us-ascii?Q?0E/hACO2IKS5ogpfZ4QwQsdlg8WWQQU+SW5m12cxzZc23b8gjCg8d6q6ciM+?=
 =?us-ascii?Q?bKCdcKiMnGxQO1R8x4qDvnayCnY4zRyhkc7XBmih+5/F2Jb0KMoqqWmpgu1w?=
 =?us-ascii?Q?NXqQPLv2mv6FDEbUVMdXzMX12pO0mcA6qU5M2DT7cnPqPl2mjvqIxq9gZDfs?=
 =?us-ascii?Q?FwchrH2JF5IfY98jF57Uqz6eqhssrG+E9KcGtwT/49Jc8VWku6+06aYKvlE6?=
 =?us-ascii?Q?Ml7JhYnpgHLrQ1A+bN4emGNRgkH1LJwh7g9nbomijacfT3CiwbWZ3GcqHJ8g?=
 =?us-ascii?Q?rl1pSl+m1SKYKIwQSSTF+zeDGLDmeKFuWMByxncJuyEpFBxoUoIvjWua5fqc?=
 =?us-ascii?Q?VpXPdkUQeMeU7jV+YCE7JOmCG7ksejNayC8Cz+4ZOz+3/HBird2QKO0KxV76?=
 =?us-ascii?Q?AFtafCuGb236u8ZVNZ0feAfIR5j1F4fBgHXaBEVAyYbD2Nc2Up7kn8zfDp73?=
 =?us-ascii?Q?nWl7UCFOlZPeEWRK28HebrRtNq/yZgWrMBISrXY90MxMe22QAlkn56sapacs?=
 =?us-ascii?Q?TCfY/T1Ov+EkPay/9OkMXD5NqivT/6CZhhRYIQ9JKLQKIGjOlYb6osmYnlmb?=
 =?us-ascii?Q?GO8cYqfM0ogNUQXFO8qlqhYIH9oyeMnAhX2j7g/MwEPQu80aFA6p10LLBVG5?=
 =?us-ascii?Q?0qgrMDnjn8BJ1UHxne0BA2byUzbL0A/Z3QtFy0N9siUkhc3EqQnTWl0k254T?=
 =?us-ascii?Q?mprk18/wqTJXeq0CFIRUg1/i8UvqkBh9YepJ4o9Gv3Fq/tRhsDBe2+GxSdg5?=
 =?us-ascii?Q?h8+GlvKa4wK2ZeAbAm3pkA6Hv62aWfW4MOtfyCb4jUdyWjIfx+rgZ9NDmrpn?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d09a32-7998-45a8-3e09-08dd735148d1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:18:30.9230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EApNKmOFkOaQ6WSJCAXtK3mPuvCMRyRVZ1cnXqX9J+hpzkXplG/Zilf2q2/PQ9l1jHKQzCA7MufWngnuQ1Nug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7471
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116564

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency to honor oe-core's new VIRTUAL-RUNTIME_dbus variable.

Furthermore mark the runtime dependency as target specific, which
avoids unbuildable dependency chain issue when bitbaking native or
nativesdk variant of the recipe, when dbus-broker is preferred.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/reci=
pes-core/dbus-cxx/dbus-cxx_2.5.2.bb
index a10f7f22dd..992a414009 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
@@ -10,7 +10,7 @@ SRCREV =3D "f2637e726207ecfbdaaf02744e1b36e54f929c9d"
=20
 DEPENDS =3D "libsigc++-3"
=20
-RDEPENDS:${PN} =3D "dbus"
+RDEPENDS:${PN}:class-target =3D "${VIRTUAL-RUNTIME_dbus}"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.5


