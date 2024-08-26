Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B76C54732
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.132])
 by mx.groups.io with SMTP id smtpd.web11.48815.1724665267299741598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=kEoJFzbJ;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnMigy5OzjdqQ4ZinoycqrnpZTHKRV+KVl4lD5nsiOH4/xOspEHT7rzY3H2HaECq0Iv+UO6LbNjHqfwO0t1yah5j+AP3FwhNRvBhVYB4BNG+T5esnA2keNQOUEXMaZ2j4xWANjBpqV0RN2JF9RV7UJyTWgRgsFPNg6vL6njeFeZzcURSZzWjojjv0Axn6QQkl50GldFHEME0DaGLnDH8x8v+PaBbsmskahEeL3ubx5u6FIlXKoQr3B6744teCCm43fwnytgU4+wsRJScdifuTXSFAz3ERbVzCLRFTo3DHy/pzKoagnzFl3Q5VVWBvakhJqkbsJuBAjJKo4PBil+a4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0p7pu2I1mllIwIxExryZKc4o+llF1jx/cJ7GP0BAdc=;
 b=wEmJ92FzEqxtDVnK4BOUbW3HsDIeNde4K0C6IQamCiGaZOnlYYJp4DPZavBz1vq6WQpSTnk8CV0fa5ui2qarlV7ZxiFsVdKUvdD2cPwHPmeZZjutyQ5DGtmatuX7vt0tJRKCVdHVwjf765IurwwfEpwgIW+ItCKnoMJCyPZrPsluaoSESfVANHLBE7ixscGlg4FrZzLFj90PXceUdoYRkPCkXkHzjFD/97Fo0Zj3SSzc5150BihyMku3bjFvxY22b4jlN3jznOeUEwv/7fUN6a7t/5zGEPmPnxK8Oo04+/f3EfDnCqNRD34XdMlXbrrHtFdJAU5x9KTcAgvtCsRzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0p7pu2I1mllIwIxExryZKc4o+llF1jx/cJ7GP0BAdc=;
 b=kEoJFzbJmj0RbkpOf3/sAA/hTJl/4T+KNiPxHja6Uc36LVzk588TLbz82uBBX2mDbtMnXp5Wc9fOmSw/25ow9psZaKg8b1NHSODRXfvvuA6uJ8VehuoToKJAiNLjqYPMEwkgxn7IfmRZIFLEj2QeDs3gna6IQEciL+CzFmamY8W/WpfJTwyCf9tg17lu6KsWM2BEEIsaLvCAiA6d/OEtQrpGlT6rqhI9TB39D2b1hLhm1+rTuj6jUwR1xB8Qka8aG04t5Bgg5AvS4M07xDuXbxLmD6gFHfwLgI4feXcmTbd3rkXW3GgWazXf2ALXlyRFjDCchv+YGrz96q6Lp0OYUQ==
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
Subject: [meta-python][PATCH 15/21] python3-nmap: Fix LICENSE and LIC_FILES_CHKSUM
Date: Mon, 26 Aug 2024 09:40:15 +0000
Message-ID: <20240826094021.2744296-15-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6183140d-700c-46e0-39a9-08dcc5b33100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2UmAdEESKKQkoaC9C5DTLGEDDZxwngNi31dd01AgkX1s9oOtVJqvpLdvQ8ed?=
 =?us-ascii?Q?aNI6p12MfRngaFuzHaSN3ESwBzn4sUfUPJmzu40SaE9FiaVum0U9D2KV3X5n?=
 =?us-ascii?Q?MaqbuTJ4dgbNWX7saHi5t+5EWm/gwxAoSxKO14q2y7Pwsv3o+H1DVdqdAWqj?=
 =?us-ascii?Q?Qc87C8S5V5T1O5COOUwbjhDzELdO9RJNVRbepEPv5q96W2Yc+hSkYdTPAY71?=
 =?us-ascii?Q?TLYlCMd2hpIAeqW4Hx7x+1wXu+fl47X1MjX8LoLJ1oIvQXHNNMnkQkmWXAcb?=
 =?us-ascii?Q?f+QCJT1YXBKKPSyn9cCQMRsj6H0uugVIRpoQGz8t0v05/E7ueeFalEGJ+Hlt?=
 =?us-ascii?Q?+R4PRnIb7fMmpdrlyiUeOrH6W+9kDAyV34T9tWqcDIXlWAdmIIQ5knip11hn?=
 =?us-ascii?Q?uvfJQnGa68EBp0KRaNtAzV/4E0R405Biol4AVZPjoTLEsxbieJ5qVKSZ4CF5?=
 =?us-ascii?Q?JBVvKhoy3jNfiGIt56ghkMqaJHTEZIyvFdhhQ7UWSgZUOkdXZ3/Ijr1vR9s/?=
 =?us-ascii?Q?wFbCL+c5BOPI41azIn9Ri/vmTQwCI9G0AKnbTtpeqbVz6yQ1evYQTCv25cWD?=
 =?us-ascii?Q?cAzl4ErAmCiYxarXEEsLLJYsZPzGXaTEt1gc6AphKueVgGJ7YxvKkqDJX2T+?=
 =?us-ascii?Q?daEcCCBQPrC8DHXrPtIsni/UfT26fYJNHsuaWboBPLN4dFuayTbbH6M7SqCY?=
 =?us-ascii?Q?nKdn/GasIlVNXCRXKpbo/QNU0mgeHnNz0dS2vgaZ5OleRE27OU7/sJIAkzmM?=
 =?us-ascii?Q?uGW7uIe7emciYE8pi8uRUdc9OW32ysFmIDShXWBzDAJXHkgSV31F6M/FuBg5?=
 =?us-ascii?Q?73AVsnVZy8PsiwOasXuf2qSob902PiApwftWSxIxGnIIPgmlTX7cll4c5gDL?=
 =?us-ascii?Q?FAe/1xggTJP98rEHSuSSEyWz/aAG7xyCRlEGjq/dHki6D4vZHeicqybEw7BK?=
 =?us-ascii?Q?ay/sBUYkkR+io/7ffdlo5ugR6lMaLSbG5/cj6dPksboxUNqSsJ2KaBT3Ts7+?=
 =?us-ascii?Q?nMgU/Sjr8NrOLNbI934JrObaz0Jpfjpm8MeLWjPxaDWADAoNt+3aGdxrfWB0?=
 =?us-ascii?Q?LEqTVFIVhsKquWRbLuM5EWfoqp7LWynxz7LW5v2PmzpDUpLb6ldsofyLK+JH?=
 =?us-ascii?Q?TrVtVXqHczCbGOqpMkHtmNK4E8i5PoDyQlrwaR6aTbKblFRVNqzbggOlLXdG?=
 =?us-ascii?Q?/DN4RssJ3ADCONAr4XUQC7iA5PsBNE45QhYDoNRptn4AhvrkMdJ1WvFEGIQT?=
 =?us-ascii?Q?dj24BbDXg5xe54yIHuT6e6SNVwpBChd4HUYUwnJFZ3BxfquwymUyAdwSB3Hn?=
 =?us-ascii?Q?aIXwVrTSx1axYtkvFUvUMI/SUp07Y6wUyHKjHw3jj1fg2bdXzq35/7NvJeHM?=
 =?us-ascii?Q?jrvCZG8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AY58rFPxLj1znYjt1U389N8wc2WVvfTl4H12pe0GbcZU1jFAnFPGERhN9nMA?=
 =?us-ascii?Q?1Evxmep1Rw3G/IFSYaJziUKGM7F2vgxl/zrfDLvdhATkTuyY4Yi9i1E3PncP?=
 =?us-ascii?Q?bNu7aOGjA8ctjjHmIBC7TxCH+ICrPqUnN2kWvGfjK5iMeG0bLXA7wBfhCVBt?=
 =?us-ascii?Q?bvV1YaKUVVE+4KXvx8Vc59p0FiI11pS3p5BnwKM4KEqbKBF0K8hyyz2oyfgm?=
 =?us-ascii?Q?aEQ+LPGrm9HYcxwsluaP57tc2EMMK2Y6OPOm0tvI/utns3C5jhVkJh1oLH1Q?=
 =?us-ascii?Q?bGZc6ElLhLZ1P68pCbScXFZCmRsjf5LGo6/KDP9jv19MSWDX5PBCv4k3fWi5?=
 =?us-ascii?Q?S5qQrktRLo3HEk5bdgTNlXqBb3muXvcc2oFrqTTjFclH27/vUD1nFJ7nqSLx?=
 =?us-ascii?Q?gEO8rX9SL0Sx+B0lJX57X3I6Kkbd7vvrwZNzjyQPw0kCJ24EWoX9Hbm+vwqp?=
 =?us-ascii?Q?qNTobcGzM8efw/UBHbjvcIPhXlUe3zwY+Vu6DxBEyj+DZ6xEXQtoK+94W8Rp?=
 =?us-ascii?Q?G68UywpgroRY6Ar1z0PxySL5BfvRh/5S1s0nmSuBzkX8somv8yJMk4q46c9m?=
 =?us-ascii?Q?JB1JXJTTIq9e7i5Nu1jWFGwY4k69reU393kn+xXWKgullQCLiUMHX7IJ+XJY?=
 =?us-ascii?Q?3KctIy1btPqd8vXgUoJYul8x0jH2eXjPBo8WAektkYX31G5rU9clo9ak46ma?=
 =?us-ascii?Q?X3Jo8Me7hbjB4b0C+GnWMPxxP7ZKff5IcAxv7oJIY97VGqxm/15r991z5i7p?=
 =?us-ascii?Q?Y5lSASLriZvQ03jOXTWAhskhRo34L4oyIAirhQO3FxNqKra+7Ka/KMqQinhH?=
 =?us-ascii?Q?ZaFMo3cfSyELhgm1vjorAHMY0bFp2wJbq2LsFWPAwXHPzN24GrImBaruef+f?=
 =?us-ascii?Q?lP8dZg2J15GMmab25r1lyQMDi/Lz1n0BbysgjEa+SwyYZqpTFSTbWYl54Bta?=
 =?us-ascii?Q?462OSsR3xkXtPel4tNSTrJxTtHcodHjdgOeq1TU+RVYUZWx5rcgSQBQAifV1?=
 =?us-ascii?Q?tWkRAb98wjxn/vpobS4FcxUZAALzxkCcEsiYtoNwDSOBeq+VWiPNrV5Obm78?=
 =?us-ascii?Q?s8uIPeWwJQlJ/bVOAFZoI4sQEnM4EoFtorQ/XoKLgyxA5WSIibdAJUsCOGzX?=
 =?us-ascii?Q?bgiNOutemU+fe9QA6XF38vYLcmDXE+m4Okfb9f2ELYaSSJCekD3gtOq6BQ7X?=
 =?us-ascii?Q?9HLpvzkzcdyz72ABnsx3foKUWsAG806TIgi/sHJ2ntCP5OOjjzSTug68sxHZ?=
 =?us-ascii?Q?3uvzqCgDQIppX9qprZGo1k6+cet+s0xibab+npFFzqofikbx3BRpiRBRVPGE?=
 =?us-ascii?Q?JAvxmjQqhP/bF0h6ehd9ENQdX6Yu2RiaQpLoSuG6/xSnY+dmgics2r+dqJ1O?=
 =?us-ascii?Q?JUOag/4BhC0AtbedITTEmAbKhCqIwKDU2d9dKTSpsJ0krEDRNKMhno2rSsDn?=
 =?us-ascii?Q?iACGxANzTaVwmmneAIGXchBqYtuYOjOKJzE4E2Ij+OsL+iYKNj2Rug2uj8M/?=
 =?us-ascii?Q?fJvZPJvPHemOXAQM642rcC4cwdMZVd2us37f9977EiH8dZtIeeB2gC9o1UHx?=
 =?us-ascii?Q?SDPHlxprB+C+hyW0pYVJ8hpOPee2vNZjThwOHHR6xqePU34mf/801YyidFEG?=
 =?us-ascii?Q?5g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6183140d-700c-46e0-39a9-08dcc5b33100
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:59.2957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwMK3pe5wRmr3a1pn68CVfG8ZwrtfIwk5CoMrSCXg1sphM0kRHJWmhArggEwur/Fo/AAaaWYx3Y3NJMsH3eVSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111954

In the source code repository the LICENSE file is GPL-3.0-only:
https://github.com/nmmapper/python3-nmap/blob/1.5.2/LICENSE
https://github.com/nmmapper/python3-nmap/blob/1.7.0/LICENSE

Also change the LIC_FILES_CHKSUM reference to the GPLv3.0 license
containing LICENSE file in the downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb b/me=
ta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
index 5fe9ab4e3..2293e3ddf 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
@@ -1,8 +1,8 @@
 DESCRIPTION =3D "python-nmap is a python library which helps in using nmap=
 port scanner"
 HOMEPAGE =3D "https://www.nmmapper.com/"
 SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ebbd3e34237af26da5dc08a4e44046=
4"
=20
 DEPENDS +=3D "python3-wheel-native"
=20
--=20
2.39.2


