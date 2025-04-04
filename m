Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03497C369A4
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:54:43 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.76])
 by mx.groups.io with SMTP id smtpd.web10.8468.1743764081901910353
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ppnnR2P2;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.162.76, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcLxKnrBXDLkJ1oNxT7DikLP6VTZvDciySvNfkeOfbsvXtrDtulFgHnk+SrrIfIlrrAH4o7D6VNfq0JwTKwliJhM1mzMjn1bW5t5w9gVBWxKn0uVerqy+D6fzgJ5tCPIDccg+oCFDXGdYmUjykbNptRmt9t3nQqlHtLp1NsV/ZUuK52AbU2BVkYv4Z8sWgqekrKdbVxZCWHTVVA+zIgT3NBGMWoeH7Vw/HLiynf10ml7Fguny91r/jd67Bd+qlozs+IkJtxVcfB4W1KHFqR1TMEZ+LD8m1386JIA/96zeYZ2S2Z0ychjunJ9vLzhNO+9iFE1BPCbl95de8w6obyPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAAsSKHiz8Gmj9dgHokZVz+9fpGzYjjCvc5Qrlu5sZE=;
 b=WNfzTJPu/OOApE1Y8t7bafrzfE4Guxr6fDjlXOn2TzCkyqRqOXO8/e1Gpvmee+Fhftzu7OZ31oRuNsvj/g256RRSA0plkMmec1NLE57LXw14zn+Ye5SQn5oy4L6aP9/JH17Axzrcqg3AmRaDYu1AqH6SEA7yBa1MnLiVCKfnkgCxjw4tvvW6cETLR1WIpYGjpsV0g03rsBnbeqbjHFVcxaqq1JZIs1GuZfhJ2IWeXC+ujo0nCao9ywnw7K5EJliH7xpBJvSXbx2crCMrRQI3DoyfdG/Khrv64gvn8ioy7bk9/nO0h4FewhyURGShidCZJMWrvKkxGzD346SA3dC22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAAsSKHiz8Gmj9dgHokZVz+9fpGzYjjCvc5Qrlu5sZE=;
 b=ppnnR2P2g1mHjum9G/uQbTR2tn8O6yDwNasVdEl994eK7TMirzFlb+myl7md7FONMiOLTk5hsmTho/dYJzvWdah1IR8sSBgQFYW/UdT+yWXrum7JaJXlLimr16Rd9bN1xrO9AiECava1aaV2I951AefGpeIphwCFWD78MNQd/5zIzlFsoiUmDmyFmQU3WAoXp8IyqGidS+RVyPYq6VlOS6iIRbW2Q3guPjkkeCVlID+50RJ2lfGe2XceTe0mVBloiDhZrBzmLKEg0RfXPxTI/LUcHVVceHSqFs3bGduKkyB8WBssuUMq2NqhEipnWJ1TTQ8GU8+ubZgr17Kw858lbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8167.eurprd06.prod.outlook.com (2603:10a6:20b:3c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 10:54:34 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 10:54:34 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 05/11] sdbus-c++: Support using alternative runtime D-Bus
Date: Fri,  4 Apr 2025 10:51:44 +0000
Message-ID: <20250404105150.870898-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404105150.870898-1-niko.mauno@vaisala.com>
References: <20250404105150.870898-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0133.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::38) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: e39c6a01-8244-4abb-ff7a-08dd7367160d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t7ZtFQFJJSllgEg8Rk5u/p/p8jo3Peu/lQ90St2ll1vEREuuDCIiZoW5MRlN?=
 =?us-ascii?Q?snhnGyC6jB1uHCc7VOS2i3WDxfpgbl4yqFgCLQ/Sjl6McItqXI2XuUc4IcYt?=
 =?us-ascii?Q?eSukWcpEgaiS0vBhn8T3XoM8CkjrBgAcB3W5l2k+y1avz2ZfZkyvUU1od4W8?=
 =?us-ascii?Q?DqZ5Xf3SzpxDMVibm+okEowr261GqTUuodMXoP8NlU8Qb03s2WvjjeYllGjS?=
 =?us-ascii?Q?IrEElQY1EmI+o9xo+n9RwMwEi0ImYvHjDqB863MIMAGkBFvL7uHlZ9WOXaR/?=
 =?us-ascii?Q?cGwNaRYLQNcX1PojEcFOubjOw3XYH/MRZ/boO2cjfkDPBCZUsZjNlrma5KVV?=
 =?us-ascii?Q?1o4GNHKHb6EpauGZ0HhKHrtPLnenWycpz+b00Y+8TYlnr8/7SkTUWCDyFT5E?=
 =?us-ascii?Q?LSb/3sxex3YvAJyjhHHNlaOKRBgswk5lLjAkznyLV+iiyqXzwyQbPBMYTi95?=
 =?us-ascii?Q?aannCi7HtxKASyecuEYy13DI0ZemaKdNEMyWbqYeM6lvMjBSShC2B1V6SFtH?=
 =?us-ascii?Q?CgPpzKIPpAjfohDxUU6BNMUBinfQlJ1eX8/JgflwtjIKtwWhmAb4tNIWbRIL?=
 =?us-ascii?Q?qvxIwFH8gcEt0i67dtRN0bxJqvWq+/C6CQn+nOYnmeDKDk3OQXPRXLj9PJnN?=
 =?us-ascii?Q?vc1L9C2Qkz8fwPsiuRVE9SqSS0hOHTPWqslYnafjPKOAAGV2NuKuxGIPsAZ6?=
 =?us-ascii?Q?A9UlBFm++pAU7e+ycF/lFGAPkujGYJLeeduhVoJsKFbpUMN7rJuhsDv8xWL/?=
 =?us-ascii?Q?WE8LTm6SThQpqrF998NzBYwotj9kgKpTAS+FSy/z3gYsIZssZaRSAozPUriO?=
 =?us-ascii?Q?+BtTyRTcInE14+MqI2KXVHbRzZ6sXLq7E0GVX4h/um8jR6RyTuBISHlnUaHX?=
 =?us-ascii?Q?HukAfa2sNwPvPxeR4JosqYTIJ91ww8moXsuXY7KY6thvm70Fxabb+AJRvu35?=
 =?us-ascii?Q?az2LTBOl4udn/Qvu6jEi5CRk+XHoNtVT20e8nYu0JRV2SphxnfUR0RElw1Vy?=
 =?us-ascii?Q?KCdAIfCcUiMDTPaPVfCeJwCzV51rDJssjXq2glzN/gLUSgoTnnc2+/x9i5Jn?=
 =?us-ascii?Q?2NV1PSkw9oj4VPm4Sh7ru5wrpfXW0vINMdNtvk1N5Fa5Rd5mRJo8Gb9v3pQf?=
 =?us-ascii?Q?zKv8wnpfa2u3NmbixasUDNLqo8Qil67gLJ3CBfg46eSZam82D2AOxKcACl3p?=
 =?us-ascii?Q?7im4Y1A0jZgqrYeNfEFjQZKZUYpC4kA89YM9GQWBFOovoQuH9CuV2Lzk8sTE?=
 =?us-ascii?Q?M1lOfRnLL0XlWpeIs3zN3MDdSQLbQc9Z5ZJKZcCtaEfneYMubzBr6+1FYzg/?=
 =?us-ascii?Q?+DezWp9N+oYNwxrdWH4WnY4wp5QD29RptWYL0uzVWHm/b9k6PZMHl59TZRLF?=
 =?us-ascii?Q?ycOHnl5hIBPFvoxAaNHn1V9mP8HB7b0LFyH19Qkp9bkaV8iB0zyPPOJy0SjW?=
 =?us-ascii?Q?47biCaTVtHopvH2tPZPe31P+WSrvDNEF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RqDfq8Ns1IOhOaiAlepsxejj4cJwAl0FlGGhvBy2E8BX6w5/9kDNymNWgNx0?=
 =?us-ascii?Q?0LqPd/axSxCv9+AFukOY8SJbH1s9e8fP5vQV/HZ3xl7xcUrCQUDMGFkoiGMk?=
 =?us-ascii?Q?b9wntCaqiL9nBm6nfsTIgeeK5NbqFXiuchGfMFSBJObeytvbqb2QaO7gd43n?=
 =?us-ascii?Q?E5HfBxQHtxdOjC3VyDFQhqzOs88FXg1+lXg3cICCLFASlDHQlliV/FkMyMLM?=
 =?us-ascii?Q?jrVgKe/uGsRMdpB9v8vUY+aEAHwEhZub6/EF0VpJM1GsCpRy00psvGapzWtQ?=
 =?us-ascii?Q?k2f2KmjKcCmvwCICteP1mQ7o3vijkljPD9q13iqf1vVyQbTTyaEvgHOGTrhQ?=
 =?us-ascii?Q?vSUdIQFQdCY4NuA8MIqC5dDmsBCjZ2TyTZTn2uD6iFa8/xDBdM8LO4HXuFnC?=
 =?us-ascii?Q?oRcg5Z3gZbX4lCpl6uRFQC/DVuVeF2QnwoowCQ+5kBFw9paaRaxehMeNgTI4?=
 =?us-ascii?Q?8wPqv2l/Qw9DQM3BWSfbdlxp9bw14ynwdfpB7Mtkz4YPcbSHCnsTWXr4X+9E?=
 =?us-ascii?Q?P0hNLZCEWxitbU9MtnuoQwNRoOMpcDyXPD80QVP6zoi3oBpNr41GE4Tf54Tp?=
 =?us-ascii?Q?W7xL151Td+Vc3HEZirf+fHI5Nu5WUdlSCzDKxHUHtcptLbcAgCr8Dn8ALIJS?=
 =?us-ascii?Q?Dhc7SANeb72gtkXbnVxZboaTSO6usN1toWrUuW6RseTevtHlXnbYGlFb/egg?=
 =?us-ascii?Q?oDEFLeOmJmi2w6qJ0MsmH7R6583SW3vwQr3yTmJm19dWqolKTO0JT8G7Edjx?=
 =?us-ascii?Q?JmINB+XVcDFXwSpMNmF1abBTAeHvK4dOJpHP7Q5/O/sBSQKpL2pCuamOpwuS?=
 =?us-ascii?Q?iHwRz7D3PZyH3THt48p3syLuGJCiPcQsRu5fji0UXYda7eeEfLZD3kTcYK+t?=
 =?us-ascii?Q?MOOQ8h56d8lScWdN+Aqwp9kpAqiXL22nFpdUpQ6avQ1mcyxoytkG96SDPkwv?=
 =?us-ascii?Q?g0UAcr8dTvGJCk7OXecc3WfemLsoicrHjaPBk5Z7RrB/VG17SoFuIlf7mzKl?=
 =?us-ascii?Q?8C/DtIY40K2+eNh016vNiIrX6FcKYBtCDV9qT9QW1HD4XxbeA+yk3woWIP8e?=
 =?us-ascii?Q?KO9lIF2y2WcJ7CX37iSlJ+VI9kAezsWLlRzAq6r3n+x7u6n5p093q8VqXmle?=
 =?us-ascii?Q?EKYRlPA+qqi0TFnpT1S4zZnYmQ50TV7HsAyKUecasJygTsxqho2ZFXzo07WO?=
 =?us-ascii?Q?N6lxfA1+uon+A2IiLnyKC+Gkgu28UHGY7os1pogm8r+FPLXwurGRgnawVrlp?=
 =?us-ascii?Q?4DSEBbmCx19PT/IWmOj9tCjOI/Z6J+NWpcRHCOYk7BKIU2XqDBABP3eBduvV?=
 =?us-ascii?Q?wq19sdfswn3qjSRimPh/9KrQRgKxLzz4lCiBqDht0XBYjP/LhLo4ES7X6u1z?=
 =?us-ascii?Q?tg7Ajt438DYoOEHSL1+sz/98gNily3CCwuMzTPTmD4m7llrA2Iyw/M2w/iqP?=
 =?us-ascii?Q?ZPb6Hp1ApzUgz067FG96p2gFbymiqilfHonmskvQ4KdgXRQGA22GVY28dsE2?=
 =?us-ascii?Q?TpUX0Zz596CDPda+7cBtst4f8q/zw6vqKPDYOLtqbOMSdcQknLNfgtftWVzN?=
 =?us-ascii?Q?6vyN0gWVO2EjbML+IowpCqH12X5IAvN4uygkEthfw6qnoV2BG03xsaakPBQg?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e39c6a01-8244-4abb-ff7a-08dd7367160d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:54:34.6329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Usgwd9KakaWHTyoz9M41iV3jMw74obbj6EY9dZB8LhOajFyH2VFNk2XVTa2B5Ftog1Het1KMjYpj+QQ5UMTifA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8167
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 10:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116576

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency declaration to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb b/meta-oe/re=
cipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
index 2b6bb1011a..a3e7c9ab54 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
@@ -46,6 +46,6 @@ do_install_ptest() {
 FILES:${PN}-ptest =3D+ "${sysconfdir}/dbus-1/system.d/"
 FILES:${PN}-dev +=3D "${bindir}/sdbus-c++-xml2cpp"
=20
-RDEPENDS:${PN}-ptest +=3D "dbus"
+RDEPENDS:${PN}-ptest +=3D "${VIRTUAL-RUNTIME_dbus}"
 # It adds -isystem which is spurious, no idea where it gets it from
 CCACHE_DISABLE =3D "1"
--=20
2.39.5


