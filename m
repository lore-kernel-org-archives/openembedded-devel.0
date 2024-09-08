Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E456CD4F4C
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:36 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.100])
 by mx.groups.io with SMTP id smtpd.web11.32164.1725809673142184746
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=n0WmULml;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8k9KyRuw9mXkj7x74GOYPwMdPRIZJOwSTLlRKcA2O970/mfhM1pqw6bfeUKJ+R78Fjs1ZnyRWyWSECFjS1u34OlmAddDcpKPUKyiYG+aCJo4ui4W5+4oZwpLW0KVK8T1CfNBTe3Ui+YclUvIWR7YVjdsmNB+APQMZ8VIPB+Yr2fdwRwQcSPHtG5sdOQsAVgtud6jUdGDP658VnKUCOs0DqAR1m0FzvJ6PbEo171sukYGZKhHv8CWIXAM+R0yUhhaYZBP2eWT88gLa3hILAajUQ0o4OAzjs/t+UhjVChSAYJh2HbYGEWOH0ELH2mCm5j9EA5kyEznAJAud1Hc4TcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0obSQrxPyqNEh8LuSwvNFAgEU4wHhs7EE+rw4rNlLPk=;
 b=YQpVd8plINOUk5MddLQQuBm3F8FLK4QQTQF8fhWsxYj+vF7uGIWIAJ2p14nuScS7R+hxafYTqy1aNu24VotlY+e5eMgWejG4ig1ZnAE762ANxEd3uJpoenakc/IB/2pfaN8/XgKYlNgF1RFRcKuKbKw8nwaJde8K7hWZ/MilYaw5/mKfZKv+ZCQf96dw3182zkQBhGRCuwsAFrhHfmRulyq33FLG1+eCwh+rUUGkBZtBjTsaNUwcon88mHj9HlAz7K8F6nYxwEmsJ/4aE5DtCq3bWw2fz7l6aR8/MQKc5RJc1o9xtCyDa9QgCtS694UKUuPVthgter2oLxMx+NOESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0obSQrxPyqNEh8LuSwvNFAgEU4wHhs7EE+rw4rNlLPk=;
 b=n0WmULml1LlqIpEVxzj/VKfzoGdJXeP4ljB2toLBV+tsqiR2bWXTsBS14t3EM24eeLCWqwRBKaxRhRTDJHlMyu2ZkMu1GRXw3K0zQ2lBnPmnzFLWL5XfzJQ3pyU9x+1gl3zjSgPqjje1bZ9M0yKNUfWon7NRzhZy+9kTNrDaHtjV/L3qEuO/S1LuSkzVSKw6Qbs2WGSJiyk6A7WXtCMb12tRfuPIMkPG6kb8ryR6XHzS0p20TVcGPM2om6Sfed8G2peOr4ml5pKvm7rb3Jm/ZaKicxt87E2z+XYnRefxTXc2xc1DvlG3uYgRD4UZPfFKFyh7enc39o/Vbewc/lF1Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB7095.eurprd06.prod.outlook.com (2603:10a6:10:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:31 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:31 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 05/19] python3-email-validator: Fix LICENSE
Date: Sun,  8 Sep 2024 15:33:54 +0000
Message-ID: <20240908153408.4114753-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908153408.4114753-1-niko.mauno@vaisala.com>
References: <20240908153408.4114753-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DBAPR06MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe4a592-0419-4733-04b2-08dcd01bbbb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jmGT+C39fu09yy7ZLhPWD+FTYO+Ve1pWHteS8EDRzYn628zTv/GWnVuj5DMG?=
 =?us-ascii?Q?gb31Dub6x2hebbsRj2zf56ZT+5/tfpCXGp0VdtPQC5nNIr/fXxGFMzSP2fmp?=
 =?us-ascii?Q?5S9gslqsWx+TcbpxdGvXVloeLXaAFlKmars3EsGx2X81rpD5eR8Wur2aJHwO?=
 =?us-ascii?Q?WPCJWpKZTxr542i3ZJHMnl7EQvb3H6Z+5K2tCnWKX3pNBOHk+HuA1bEERMYp?=
 =?us-ascii?Q?pQEwTaQ/i882FpO5dQnd3TbJTIFpB9AsKG9dCIWXpgMqUZfGOjYHXYXwZQzo?=
 =?us-ascii?Q?4Ff61k5m/soQV7myAI4cnDETXgPkMYK0E0NtjrxRdefu5KKnsoHicOTeMkO0?=
 =?us-ascii?Q?e3iv6aYR0ig9EwOqmqlUR9YeOyhyXd9atyDN76UllFJ3X+iSkG9cYcdb3SbO?=
 =?us-ascii?Q?IgtB817FwhpGjN1sJnxCZF3tIwszGadU9weuXJPK6mQJNoykKRj5lbSOzbnm?=
 =?us-ascii?Q?AASTeV9j89memSJ5+XxUOn+LPEinQYstiy86E4GJ+dm2gjKX8u5Eu8JqCOWh?=
 =?us-ascii?Q?kipQdNoVbgq5e7BDDD1vj5HhlFSM4f2M14guGhXe9qCxxuNcDN3P8ov5VW01?=
 =?us-ascii?Q?aUK7zUR47ifIYNZyUoeXDyjuqoCyLbPCoOBYPXuMD9CNtCJYGR+qkC51tuxJ?=
 =?us-ascii?Q?MfistYWx51erujJLHzyqjdrwbe3lUyHr5T8Y/rxOrALPnY9RcX0rNeSWrGkm?=
 =?us-ascii?Q?VKZZBspb2iV4Ed7k25Z5cxGEyPU9LyZD8WKaw5hvhD1VRhYdoAxxRAZYYS3i?=
 =?us-ascii?Q?1dYZ/bqWY6TYr4V9I+KJSbNWoBdkze9+mBWze4Cw4esRgpoT0Zk6lNa9cEhm?=
 =?us-ascii?Q?NK2iNn6dVgHWlDRbEr+leSrHfjg1o/93Ojj9j3drjbMF6SqObJHFzQCNq92k?=
 =?us-ascii?Q?/S4rjr6grUxbIP6eCc2jQlh1vcUGXT8ymx+iZ9sbf3FcnKrmpl3mtZq65g2W?=
 =?us-ascii?Q?zhX46ui4iwTht+Snu6zDANDklF4w+10m6rNbkG38sDOCC5KOc3SkwvKsrt/6?=
 =?us-ascii?Q?FGsCmn5DKIzjpaL0MUuGvwflIufzpR6whBcpzNGl2JjLL//Ln39ykVV0kbbn?=
 =?us-ascii?Q?kn8vF4sDNxY/nKTEwblBNXFqS7XZTdcskxILwt+2+cUR8ZTTrD9qW575r9Yp?=
 =?us-ascii?Q?JYAlWxuvv9Npn/J8teQ+oq9hH+K2T7n4zchLf2E+qPun0jaF58llqwX244JD?=
 =?us-ascii?Q?6vOr7eWost+27LGWle6/Oo7Y/XEWT9EcdHxinWlkkN1vdwk7I1uJ/gEGwc+x?=
 =?us-ascii?Q?iP2xpRKYzPml5ZdrEJY7cEEX/QX1rdYtGUxP7GDaqXvEeosHpNWdBpAfXaCD?=
 =?us-ascii?Q?myBxGuqAXwjzbTYxb/FERCQGwggbVbUkvq51xbCcGDLBEgd1iiKLMUGjzYTU?=
 =?us-ascii?Q?g7vwNspeocCYMot8sX7Erg55FS1zPPHQ0od1GHHr57URVBrgkA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IN7YQ+e15BbP/dTxPdVmeavogdidcm4j3aFdYM/kzaAPA5gdoKcgNBciwqeS?=
 =?us-ascii?Q?UoK4HfFKl0oJO/oSJNIqfANPomxFkHonGjCl4qFrDxetVXAURUohN9U1Mrub?=
 =?us-ascii?Q?6uXsdNoDNy8oKCMiveW3jbpq7RBn3B+zWHhfAWT65iZDpgoOneF2k/lNIvAz?=
 =?us-ascii?Q?10AVoc87HQmVVER7j+sjSas26WSf1Pw4GUoA0RthWEWgXMjoQLwB6ITfdHgo?=
 =?us-ascii?Q?E9WSHD7M9XBmyRNf+T0/B8b+3XAw86Rp8BA82tOnMQ+kPj2khPiImYjxELYh?=
 =?us-ascii?Q?1B9MGzB0qXOV+uJygXXkPphLgzNTO1c/XZT5ggpPnN4g1AD1Ekx2f0AoLhQS?=
 =?us-ascii?Q?VBFLoe3MvfV9lRKR0CTtyYcxonhfww1O1IRgaBrCglLZmErNteCvGaTG7guN?=
 =?us-ascii?Q?+LT3jo/cG27lPT224gqVEc+9oheQSFypbTEy6T+tY108cwvodIxWP/2yEAy9?=
 =?us-ascii?Q?JBE2/BM2eaH1E4zSfNNT+iL3PliYSK9LDCFPPPoXVXfhpwFtB1WbhQ08TELF?=
 =?us-ascii?Q?3Cx2OtaECToRER70XGX9U4luItCy0nduSSL4xMGWNgZnSY152AaNMsxVd7A3?=
 =?us-ascii?Q?AazhAOLj4fFSiWHMR9hIgMWq8qixW2xoXr7yb2bY9V7PbRv+1WNpVTxjOQ+Z?=
 =?us-ascii?Q?hnctpNGS3t2PII0YOTJYDuEVwQLA8/2w2bIwRKeQeF7xHgXZzy4Ul3uT1gjB?=
 =?us-ascii?Q?qW6OoaAuB5bvsz99KsHf0m/mIwM0HI6l0V5bhQbIQvjZ0FPgiyezRoI6R/oG?=
 =?us-ascii?Q?79aZ4qErWe4gFWWC+OmjTc1eTVE91qXUaCCOvzWj4Vrl2d1TX/DIHdqb6ED3?=
 =?us-ascii?Q?7S+lSH+/H77rRG95P2r8QPxOFl6vKZQ+qcxYp+dNncnUWYM3DVlkdIDoKDHh?=
 =?us-ascii?Q?Ty3d3loweGcp6PjUV7uA3cOs2SE/x/F/WlbRRfu5kcQOIsD+Sb5ge9YoPBWF?=
 =?us-ascii?Q?OU8/Rab1opxWyWdQ60C13TT1aTibH76SvA4E7I0UfJ0LSeViQZLklHpTUnjP?=
 =?us-ascii?Q?vSiCtHdEB8UlgvbzmJda1CAQJ6IStwn/8p8UjLyX8yaO7X3arDL6gOzLIGJf?=
 =?us-ascii?Q?MbAhrDUVa/B3XA/t9Q5NMssTM+AGV15W6e3Vxy6eSOYisRM7StX3pUxG4RQ0?=
 =?us-ascii?Q?BTo51rmCTeN3YeUYwoJTfR6kfp4Ym/4gURfMkTxVvYbUomfx/ZNvg6LaoLW1?=
 =?us-ascii?Q?XPgUSPFFBIRnNLYiOHv3fCxH/LpzLA+mHHJtqocG/qg4WOcAKV3OtkPFnQV4?=
 =?us-ascii?Q?eFoeOoqRCFJF6dhDBueKP1ysj6e9u3cJzkkOdDuaM8xjW6tScCXd/CrbmnpL?=
 =?us-ascii?Q?zh+WV2CqDqUQ6BLmQIqEl4Td2vw/ktdRGJzOYREsNXJ0p6PGOFTbeaKP8ex9?=
 =?us-ascii?Q?l/I6+m2Oa5SivbNfP8jfQ+D5MRtseM4S8/swGtqvdu0Ym/mA3El9WsO/3PIn?=
 =?us-ascii?Q?cq2mkS+SI/fwv730QvwrasXjkCKJwhxAMIsE1bU3bT3mlnmI/1+Cz5U7Je6J?=
 =?us-ascii?Q?ITI+fMMfXbMS8hk/7SRb8ia+i7s0ViAxJMg7MUhKTy2SaKDLqBG+DAam+kJm?=
 =?us-ascii?Q?9fKQR+FDZs4Vn/9ptZ3eXlroEtUvubdppAg4Y8qOuOmfbb+cqdSCz8LH1WK4?=
 =?us-ascii?Q?qA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe4a592-0419-4733-04b2-08dcd01bbbb8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:31.3465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+hFVMjR4ABS5EUCnGR/Bgq98QUdYU7Y/kIZ+PwanPOgSVRPvgDamqXpDJJXNV74AFqZvwDMd6eySLQtyI8+dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112144

Both https://pypi.org/project/email-validator/ and
https://github.com/JoshData/python-email-validator/blob/v2.1.1/LICENSE
declare this project is subject to 'Unlicense'.

For additional reference, see upstream commit
https://github.com/JoshData/python-email-validator/commit/5d72f53412821189e=
bc826100fb2a673530c5ac6
("Relicense under the Unlicense (instead of CC0)")

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-email-validator_2.1.1.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_2.=
1.1.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.1.1.=
bb
index 90a22e5a0..746d56d18 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.1.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "A robust email address syntax and deliverability validation l=
ibrary."
 SECTION =3D "devel/python"
-LICENSE =3D "CC0-1.0"
+LICENSE =3D "Unlicense"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2890aee62bd2a4c3197e2059016a397=
e"
=20
 SRC_URI[sha256sum] =3D "200a70680ba08904be6d1eef729205cc0d687634399a5924d8=
42533efb824b84"
--=20
2.39.2


