Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C26CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:39:51 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25195.1781109585738220732
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2026 09:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=kGBMzwxo;
 spf=pass (domain: navimatix.de, ip: 40.107.162.141, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSZNqN6uk4V5ED+BgZt4crvsxzMyZ3RyRe6YVCutr5UM/tqGAmLcZAxMeRQJcM2jNeCQBEGwlwHdJRjptRgeJeuBBCZgjcOTZIYr00hpOjsirpaF+gTwvQBLaP5FXIkdJwEejEZLGVbouYCD3jgBxMQFrXzEqLlrLPwXAsLpwfmTC68/wURDXzubj/+q+rMxCEdRz3BaRKPf2OACFuhs33JgRv2il9Nwc13iI8R4aKIsloNAxQUAHiD3TJ/Ka8nNEI1z9PfVAK99wLOK1iTaBKuaSDouqn6H0c43CpDWMHaR65G6STMOqwtYm17Q9cQmKLgwinEolFvAmmk6SjoKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8nb27oT8RWyg04d02176VCRCGpnb0pZgpEn3YQeSjU=;
 b=xFpvtKjsyEptQVtb1W0dFysnpLrHrhvemmpneQRKsQPw5GuxEjhRdy3Av3PXbixNzW9g3DZW+IIeWfqxGzKml85/NQodcOgq+3O4jFY3O3FeWrdF+0YCKTPIoAyThZPmGN4sx1/hNRDj41+XHrYYyCv6vMLX7FBGYxRsRaySjq7A2hfmLpEb6pIjjcQcx7rcOW+/bNCQZEqZh/Olq/Ok4vutl4/2CUE4Rbp+0KuAmmnkSny9+mYif8xV409jT90yst+mR9Qy1BohQK7yUPS9pBUmT6xhGNDUaF8cIn5kxI03mssHhyv7J117DEH/t8NPCHOTqADG4uDLEzzKVgqbag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8nb27oT8RWyg04d02176VCRCGpnb0pZgpEn3YQeSjU=;
 b=kGBMzwxo9m/FX+bFgDODSGeeRgCymrPNOXfyTx005Uv/rQHmUnu2ud6dOWpSxLrU0883t/r7xUZL5+vaiD2KpEoQxZ25ubUscSObAb9Qad8d/RCvk4ySAz9/9ROzlq2aFL6jmgYv1E3LIPfwTBA+4dz4BquQIi0n+sOviLmHfRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI1PR01MB6573.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:18e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Wed, 10 Jun
 2026 16:39:40 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0092.011; Wed, 10 Jun 2026 16:39:40 +0000
Date: Wed, 10 Jun 2026 18:39:38 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] gpsd: Add ncurses-terminfo to RRECOMMENDS
Message-ID: <84becb55475e223301ddb0caea959e007c09944d.1781109577.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0301.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::10) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI1PR01MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: b10c03e8-03ca-494a-9dd0-08dec70ede05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	uMcV/x2PThSarxmIstLRBuwLefznKth0XPYy6Mhw/xUurXU+vBZGBgboLF1qOySWDY/5OrN0J6CFh9O3ZzCaFTT/0gBesc3lon5ok8R0Zr8RJFCOta7BausBR2HsW3hK2N1WXMslmuGsD9A072p8+TJ7QQ8X1HLyL4pr9xGfUG5xMHuKYYw6VpP1Z21kz+nelfjPGA976cArzB4Hty5PApZpEjHZRCANdXYAnalSCSIN8hufFkiqgIXjJ/NN9Z87IB6SyS11oqSmZ5YzU5KdQFGxXCKR9hZ8K077fwahohQ1586JGz+Cj+Y/1z1T7HVUlpX3kO36XlmmuOLneZLa34Lyq5B992Jnsr3FYDTTnh5OZbwmbywlJnR/0+5Uj35rNrtiLfh7DPBBSNy7E2daMboM2XTRWNeTyzA69sYSlP5nZrmUM7hGdijs+br59T04GiyguiUkLVtU4zCsMZowRRwGdvX5aODRmnDvCzLlabM2akEhaARBJghlUS2Dc8SjKojEooFsuKsOXc/VjxK29AjWrX7B24OC+/xR48nkhNNqZ3TreWdGueAlT5zObmSvQohw8fWJE7BuKrzSm+SsC12b8I93PtIBoKqRTLjSCjYtLZUhjKqpmiiJ6cfoaKbv+LxeJGC0xGBvsScr+3T5TibUbcEbZd/iaa6GvQDx30Vd510q0WDIQZ2WW63+jm9c
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KfkgoLcStYlv9OJcvHCtDuOSqSiNkwLIr+usptHFzngWFz6+BZybHL3QDbXu?=
 =?us-ascii?Q?/wkAb/+QH9PZZxBfmxVezpJKRQp6CzGjfDP0KO8/tg1HmupEcmCpm/ASuFxY?=
 =?us-ascii?Q?Kqa7P+JK8ATnEOn4G4T4ClGtIovqnSqUsrwBzgMVloRPVPiy0oCbWr5OKYL0?=
 =?us-ascii?Q?XoVZRrSOl8kqVszHB5oGI84nftvfvpekwaGxFizAOA0EdfoJoYU9QhCpBlwm?=
 =?us-ascii?Q?D5nsXj+ZRDQaN1QUSkpVnHF2BMmO6CSDYyOoZpr5usZ+QeXCGtqIymer9PIf?=
 =?us-ascii?Q?t1D5eF80MWQYRPFzI1TpUg6288l0VfMn91gurDXr6LV5Fyu0zVGknqQ9Ijln?=
 =?us-ascii?Q?fJUnm3/xOou2WyAOGulqkyTV8QU2Uyyo+9ou9qzBelG/I9pwuym7hU0B3rjf?=
 =?us-ascii?Q?N+o42OYCcVg6dsc9VtKKHVfbsp7hmNaYtafyNALNbCGRb1oJx2hGhk9IF+1w?=
 =?us-ascii?Q?RXJyVzZI11WGDqghwk7DcMnb/UQfqm4T5dcK0Q+q2IWqKGy6nSUmSDFseGCv?=
 =?us-ascii?Q?aVCS1fWbb8Vqw+HGZo9/o/3w8A6gYWPnTtB4hXfa8TlbhsuLUjlg0TnUjIVV?=
 =?us-ascii?Q?J9wpEk7K0OpC12C7M4bA6IHmxfOD8+LSuGYmVKrcVSXhPOPyf55oprDgRCpa?=
 =?us-ascii?Q?NNJjQulFuBRpZhqT7mtquHI+hYuRawEdIadtTPoZzX8I4PAXMbj6GGEdvsnZ?=
 =?us-ascii?Q?MTXEJLbYj98VG2C41PCwdOgb7QZPgSNsRvllLkZCY2xGlMg3c2QkvIeqOjh+?=
 =?us-ascii?Q?yrjMlhVKdGwHhvbi2WWBAGZQn5+yQlFpePjRqPYRIuLb0ffpBxDGxOS39TH5?=
 =?us-ascii?Q?A8Oj8eYCfmKxAedggS6rIJKKdwmiLdRUxQ/EZ217ZhSukKZE46TOy7OtnTKZ?=
 =?us-ascii?Q?70hsmihYolYMM102Nr5WUvxbnrIgb8R6pstTbn29H00QqIJNCUe2R2Qd1MWG?=
 =?us-ascii?Q?CK3h9t7mjnHztCOO2lB+bCpnlLIoVYZTCf6KkRJ7Q2YCleRISLJannr+nRZe?=
 =?us-ascii?Q?lDFwGPjbfDNpWrS5meiXWRTqzipLwQOw7okCWcuqwRfHInTZCZXbvdb8qoAz?=
 =?us-ascii?Q?hB8r7MPAw4BH3+JRLhfqOOBIyd+xfZ5GV44pFsZV+386c+C07yrWpOTaigdT?=
 =?us-ascii?Q?+ASRx6NAuDkFuo6WPlqfuAVhpoREGlfwWt6ntx//FjNWGjkDigukoVJR7CMu?=
 =?us-ascii?Q?LTa5RTZk9z8pGzXT/g/xyj0felfOuBO4AKPNj4qoBCKwdbAWp3fL5yvfo4Mh?=
 =?us-ascii?Q?aksxaDBtMnN6OBU4+XGv69Zpjr1b91fwNggYlYSvvrd61ySDq7dBUHNUZ3mI?=
 =?us-ascii?Q?uFmnvihMsKbbeeCGOLzWABdp1hz5zTNtVWhs32QSEJB2CXfXLXnifwtYFXwk?=
 =?us-ascii?Q?6G2SiTGYmJCrXI+POXVw0p8Q49uCebln+Be4Ic3YYMsPXrKVj1DXOP3LlGWc?=
 =?us-ascii?Q?rOzn0QkVDoTe4mtFxp2rUVjn+0lwy0dpTybjtISFl6pOf7ihYvVtW19fbi1I?=
 =?us-ascii?Q?NGMF0qGy2TNsS11r1Yo1GbsVOgveHplJ1tiVq+8DF7g+g8YFrTLE4FzAV98g?=
 =?us-ascii?Q?umO9ZicHfzQSzHutnzFdfFqFIlkItWsaACI8SqB9XWgdSUs4N8uX3HsRX+Kl?=
 =?us-ascii?Q?5xqqVs39B4gyBxWpNavCiXQiC5pj5Gaq3HPk0hyZfL+066HJktUGOLrXWRzy?=
 =?us-ascii?Q?HYBfcYQHfrE6L/AZeDFdswYnIAiMjCvUvsAnkqvS082d/Dez7HO3hoPZFDAZ?=
 =?us-ascii?Q?2d/Fdgp8RNOjMP6DSi8A986An3AR7Ug=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b10c03e8-03ca-494a-9dd0-08dec70ede05
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 16:39:40.3451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6gClYwTgA+jATwQgF0iXycAtaM/rgzrhFNXZ4IVhem61CKsxP/fyvd92EzMJwFypgQn7XK0A/jTdp3AKUAZL9UyRwyWJIuwedX9AQ8mO4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6573
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 16:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127516

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

At least cgps needs the terminfo files to start. But other tools like
gpspipe work without it. Hence, only recommend it, but do not depend on it.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb b/meta-oe/recip=
es-navigation/gpsd/gpsd_3.27.5.bb
index f7ca367fa4..fa3df89b27 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
@@ -126,7 +126,7 @@ FILES:gps-utils =3D "\
     ${bindir}/ntpshmmon    \
     ${bindir}/ppscheck     \
 "
-RRECOMMENDS:gps-utils =3D "gps-utils-python"
+RRECOMMENDS:gps-utils =3D "gps-utils-python ncurses-terminfo"
=20
 SUMMARY:gps-utils-python =3D "Python utils used for simulating, monitoring=
,... a GPS"
 FILES:gps-utils-python =3D "\
--=20
2.53.0


