Return-Path: <Angelo.Ribeiro@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCE4C35FFC
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 08:57:47 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.65])
 by mx.groups.io with SMTP id smtpd.web10.16684.1726563467047442940
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 01:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=QH2rkcjU;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.105.65, mailfrom: angelo.ribeiro@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9DCyU8RDSSvUGh9gEXMv7b03o51PEJBc0z0fon3VxIowqw1nL3KzrCQH4nyfeD86RDCw7SPj7pqd1tInpwkW143lijNfcYjvQbHgtq2q8n6YYJU1l02SYdjqLK4h2+eCRAVsibmF0FW8TbS5hTixeRXlql3vQHr1xWwrIuM5V/2GYmJDkgtGGDacUcz/sExx3T1Q3iEA+855J7SnHcTfR1yIQ1moOpsq9iKkxomY3+LH/koqOcyt33gaADdSIWRKxHw6E6feAuSaha3Klb3l7GUQRJoBW/bCMiT9ayWghwzV+zLh1keDBWPDhOKp4M6osESbDSRPG6899LJJpqxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIB4Ne1cw6oAqESzPQJTO/zp2NQLsyMwoaWtp0M8mds=;
 b=PaOsiEkF4ASzOTVtl8M7vr/Iur9NT+eAHOqSzJ/wqK/mHHEu+Lm+qPwVV6VX2uwQApOcC9n3Nq5f1ADzge2dWo3a97xonZvEdRCs1EmDfetm/K2HsRdrnPWSkb6pBqQjBrFysyhjhuMzHvZMz+jQkDqpz/ph9ry4S6B7XLUi5HXZLKvak7Egv//YU8GvNAExXIKh6EmkxoylJappJEu1L/0B2sFKgfBWpD9Rhlv7sIgAwTHNyFNVxFK+Sv3lXbUemh6rYLOc9P1EQttZomUnDDD/URMIFnkDGgsdXVc8bNh1rwxQ+MAD/BoJ2VtKLWF/eDRdyFKabHCe8q9hkSjLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIB4Ne1cw6oAqESzPQJTO/zp2NQLsyMwoaWtp0M8mds=;
 b=QH2rkcjU3cT06lB5ql3w+d7QmC8sh6a73IJ2KsTV/PJoeUn4W0m8wfMN1hDObz8M7T6FgBm4pQN/W0dTJEnW5DhhSGhy+X5PnTl3A7LHdbuUkfuqrrxigLmBZWONxAnGELW4Y4B5UKMrv/laZDnc6ddC8I8oD+gjfC2tUWv+ja8B1MZdz5mnaLmQ46NpGfkECg30fFz4esgnEaaE+eU8SsM/510VGvXBttU93zgkDedPML+/COl5SLl9MheH0ycB8Fmd6SSi6FNtM5sOi2JmZwscxG03cQzZYMVhKssgGPcbqXruE551t0V0+IrFFpuxW7009VEZRtBs1poLu0lfrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3e0::20)
 by AM8P193MB0897.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1cb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 08:57:39 +0000
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::6030:cbfc:2907:451f]) by AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::6030:cbfc:2907:451f%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 08:57:39 +0000
From: "Angelo.Ribeiro" <Angelo.Ribeiro@criticaltechworks.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <pkj@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [kirkstone][PATCH] libdevmapper: Inherit nopackages
Date: Tue, 17 Sep 2024 09:56:50 +0100
Message-Id: <20240917085650.5433-1-Angelo.Ribeiro@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:206:1::42) To AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3e0::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1651:EE_|AM8P193MB0897:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0532f8-c98e-42a4-9462-08dcd6f6c85c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LnV61EojxpqQ2yuonbqrO12FbAFczNcGfrchUSN/97XUON/OzM4ODw+YoXnK?=
 =?us-ascii?Q?PGiiA8oNsphoqOsBVw03imRusc1QFWcGa1jrTCvgoDg74rYpkmovBlH1mavd?=
 =?us-ascii?Q?NPwNgxA9us1JaIHrFRF9DneebS+d4ZLo3FM3g7zqDqRR+bFwd9z+ckTQeZFe?=
 =?us-ascii?Q?yY5yp+VKXN9IcCK/zKYXjUbnOouNW4ia7QPjZuGez65NU1nKx6+M+jLIlDIX?=
 =?us-ascii?Q?igCuH216ZeDNyYfmiY55Uw0Al3B8UVnT6U62fRjRCric1AO2HBWLwzV11LSy?=
 =?us-ascii?Q?X8iOIVuVEJ/2UsHpaEu+MRdGYRn6bhrDHSl6tt2oBKI4Q0jGwxFl0Xqek1Py?=
 =?us-ascii?Q?xlSLmyExOBIyXDS9ImZIt4s95hR32W/f/EizGtLBXcEpnrI0YurJqQ7OrT4p?=
 =?us-ascii?Q?KCN/8QoWajMetoxnT2P45d0RCB2oz7rEo4kJGlRLQjOPey7kHpFIREMer5Mn?=
 =?us-ascii?Q?I/FCZJea1HAjAGadApOwWUpteW3dxaJExRokZqZGqIJLewHDf+fnkl6JL1bu?=
 =?us-ascii?Q?qS1l4kO21bVvzwqw/obOqeKdX/ZcJUpXhascFVWy1fTmngeZsVNBHBYbsRks?=
 =?us-ascii?Q?FGuctymtSzDJ7VRwyVz8UcYdPRV7cnza0TPcymzZbL6n88xkJ2h4h+Mks8+r?=
 =?us-ascii?Q?30GB9wQ6Hq81DfgRnQ1viSnzzmmOlu1+cVFmjYDpHmgAgW3U9gUmFx4trxti?=
 =?us-ascii?Q?Pka4BGj7rrRGHqjO77D+m/Grx+kiKjoP+59z9os3uMH1lOErKaZEzhy6gdQU?=
 =?us-ascii?Q?AEX8ZlwjHQsWW4KPCmYxuzJ5o2Y4A0rA20pJz7L8WJqOBQmG+gR6lbGcbpn6?=
 =?us-ascii?Q?/iCnQEtLCVIqCl5FqFNIB5EwhBCrRJiExG64aJlG9oUWg4FakYwAoRbN16Lu?=
 =?us-ascii?Q?zFZuDx1QdYR7RV4vwyFtIqbJgXSIKl0xZ5oakIL9Ht8cvXUoCCdXCHVQBMaE?=
 =?us-ascii?Q?FVrE2xZ6qw4Q5DjtO0pd+P/sAOgc4omJ2t1LJBrGjnFS6xnql12Q6+3w73+v?=
 =?us-ascii?Q?ngDdSD4nqJmwWDQaua8bJF0Mnms9TMm798Rl5OE+hAW6b+JwCx60IFoB520n?=
 =?us-ascii?Q?nCsOSG1GdvYwLFBGhoS2cDkK+e1JVI+bMhNPPjiChU9jj4KYx+2di9KQB9bV?=
 =?us-ascii?Q?utmqgqF73AxE/3zIzuSBl8Okd9nyNRThHwmrLSXhq3vPxCpC3xaqycpN5clL?=
 =?us-ascii?Q?3UeR+Ng3cfneKPdX33SqM8fKx2VurKVMyvEZiV2AQl9G+PYfzwwLaGzwnAS+?=
 =?us-ascii?Q?6pamEwRwXEX5PQoHZmprYo+DOI03GFp0KgcHM3Gc56J7aUlf6a77o0983aFN?=
 =?us-ascii?Q?FIUVq+pSu0B7hyq345ZR0i2aD0VI5654p8rzBpvHIQsLjz+dg1IOk/anQLtw?=
 =?us-ascii?Q?zjmbkXM68M+FcyWLUZqfZlrwT8LxD78vIXkf03RQiRT0NYGnMg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1651.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p3BUsMCFCdNS/S2r9bBJchnzQQNqDPIKBREStrbxNxTKG+SoUxJjILp2IXzQ?=
 =?us-ascii?Q?wGyFTm2fLDnAI1dLdmlx4vhXDhZAG+8gA0Kb89Pjvgsfq7wjlDAUmYDHrPNi?=
 =?us-ascii?Q?DmGf0tNe+razVPKu9cGOYlK0NwKYlpV5tiInEYV9S91+vARiQS5lUjjjBb1e?=
 =?us-ascii?Q?TUHfGLOc33P6vHKGWE7ICErslYIQ+9G2ngy5W9ygPmLtn/n9AdgzB8y1Y9Gq?=
 =?us-ascii?Q?sqG9kHNIKlPni4KXap2Vo4yZr8ON7Fa/5XlXxd2wz6RTA8NtL9H7mnEUK3Xq?=
 =?us-ascii?Q?B5S0WCIAnuFvCOtrlL40KtrJYlKN52H5fAVgfV1IXoAzA2tumtgHAGW2UTZq?=
 =?us-ascii?Q?1cORF0FxGfTGj18qvrBiEoGhpy9Zlvooc30Vw3dL8HbTGKxsQ1YCRxy5yE5G?=
 =?us-ascii?Q?ERLWOA9ejqPv1d3QPjQggwSyDWK/tzA/gs7CJyRZEjwTPra+g0oIP9wWCZ5f?=
 =?us-ascii?Q?YtcNOvj7/mUqeNxB/4a2/gToLfHhPVB2iJMfP7/u9jp/Nm8fD+YSX0CcZx/d?=
 =?us-ascii?Q?ihHxRQDc3Bet0NsrQZaf1IVS0sOd3PbeyX0jm79eMN224L+sRoWAyqOG6+Fa?=
 =?us-ascii?Q?4hIGKTY89c8xhQH60I0rywHgFqHyh6sbqONjbe6bODZ7Jly8DVlb/W8xuDF1?=
 =?us-ascii?Q?40XSnHx4iw1yitndgRttSQYdlczRvTTTUyzxwGXzXMMKaMGmSIo+jcMC8r/o?=
 =?us-ascii?Q?DovRGn+8gtHEJLYhjU2wRC330M0qRQBHM1aDFphjSfZ9hPo1zIFRo/ykdbSz?=
 =?us-ascii?Q?LiZZIS/EWoRS5GS44C8hrUEM0zv//lA0uyhD7+sZPQ2Tm3wOf8WNRwE5coBq?=
 =?us-ascii?Q?zSdSWH+P5LGaxVBWRhm92Kyic40pAuHfGHD1QeSm8WcJtQTf93jFhrR4NgfJ?=
 =?us-ascii?Q?a8g5gp5MuVh9fPqsQquCxXSCJS4Y+MclY0TZa6WSPagakJiTXKt/80sT3dEH?=
 =?us-ascii?Q?2bV1a2QSBlYpwBke9lSOY45jBQSjM9HVh4HJPQrsUXrhFfBno3PlEqZGgTx5?=
 =?us-ascii?Q?t+x8KGGU36BB8BnAzAMmzSeG9MrjbCzFKgKhge9VJfg6cogesye73mZ4g0bx?=
 =?us-ascii?Q?TiWJ/nHNQY24I9xjlffe/HEE6mF7V+bcJ7us0ly0nVGnxiTw1mKPy/5nlGOA?=
 =?us-ascii?Q?eqGcRVpCCxTa3Sq9+gN8uYnh+FqNxP1sN6TkawX4hvGXYmKjrLTmJVGkHVJ2?=
 =?us-ascii?Q?VYRLU8/MdFwX2RH+ggCHScKbFvblk2dqk+HcwcDuupt286BHLYB9NbqxI1iv?=
 =?us-ascii?Q?eoMCvwWr1B/d6olbp73MJkrLigr0cSP97dQTL47I/QOZ+tpcB2vgOHDkM/sO?=
 =?us-ascii?Q?Efp4dWSfv0o9VRxcUh2ulPi0vSBgQzaVeFNKvR9oXcR4t5mReWvXgKYUJ6cm?=
 =?us-ascii?Q?Sf48Kjc5TSlNWZFgEKZbwJ51G6wsDR/jgcM5MfrCOK7X3/HhOJLpr4WrS11v?=
 =?us-ascii?Q?mld+qgt3siUfFS3O3acTc2sTe7DTPTQVFlm/1gVtBAnw4mf4MqLnMsD/LpMO?=
 =?us-ascii?Q?Pce3rOHa6FL5UZqxEU0tMlyJxyNmLf89DW8br+Aq6ZO2u8lFnnbeiz07OMj8?=
 =?us-ascii?Q?GGLAZWuNVIX8guJccaE4dE/B4izUKvK0/L21e52+CA68a2SpwX+uztEF0ph6?=
 =?us-ascii?Q?bCBHtDpRa/uai6RCzKVPvrs=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0532f8-c98e-42a4-9462-08dcd6f6c85c
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 08:57:39.2643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Dg9jNk2xmOjZ7KNbWWgB0pPR/EGr8j5OGYDT4oTaJAxiKqaNQ7Rp7D8V5eH6FbJzmmTFTmTW+DzzkvfMOpDvfigEriO5QbxAL3hAgqG8DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB0897
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 08:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112340

From: Peter Kjellerstedt <pkj@axis.com>

This fixes errors from buildhistory changes where packages-split would
be empty.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 90f96e053ad3eefa7693d9748efdfbfa72d7dcfd)
---
 meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb b/meta-oe=
/recipes-support/lvm2/libdevmapper_2.03.11.bb
index be558ce1d..3b4439c3a 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
@@ -5,6 +5,8 @@ require lvm2.inc

 DEPENDS +=3D "autoconf-archive-native"

+inherit nopackages
+
 TARGET_CC_ARCH +=3D "${LDFLAGS}"

 do_install() {
--
2.34.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

