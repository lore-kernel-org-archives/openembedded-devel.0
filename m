Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C854FECE581
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.123])
 by mx.groups.io with SMTP id smtpd.web11.34076.1725815542816309636
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=I6J0sUgx;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.123, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDFuAS8sJbjX2WAd9MXbIrjPF16MuLGPfMbOv+uao7ZifXpMXP3jj1SU2GAcuxwYwvsMJ+JrPIMa4uU1pvjr3Jzd0oYNM1zqLGgZxrkcpcN6ORFaVXZlMRTttusWmj11L0W0DqoEAedh+zPS3ZQEqaQnSmmaacJPlfHMMdGAvu3/9Kux49wu8KnmlisQrER06IUbkHaorlHYpjVz5vc/+esJEClHgcTadnhKONCOe4qZgsR8/n6XdHWXVUejM0rJuvOraS+vgcaIcMNoyktg55EZ2pSLUsLslkZI/s7N8QMQZcdjjY2KXytSkNwA5vz7341HQNd2SPUD8tcI2OESPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+hykT086/KEJmKuF7LjgmgEx62U4mWSxBH0PvE8Ipo=;
 b=MGWV6lIBBWUsjN4ICydfutUxW2KBCEgFrv3Oz6ahd5pbOxrnNw7cFcS6kiqLyyYxEaCVO4XaxZV9hnvOcbjVYMJxLSMoRQal6o/RaNWnOOB0Q4fiKvXK56JHKa/FtYd171lGSXgkPTPTi5irKZTK7MrORqyGCkOSk+caRYHWV5sBEA7Y7l7BD/S96CTBmIGXDHDCmdW/bb8qfPxGA6gsD2/ZM2NH05iFwptr1qe9OJHA+24ksV13GzfYtiflYFUg2xbtPLxkoq3zzhrclPSOHsm63F8I8UuW8ihP0tg2zav4gm/yL3ugtJUAn3JC3nr5/pMWiz9EP4rZMiBLCZJUSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+hykT086/KEJmKuF7LjgmgEx62U4mWSxBH0PvE8Ipo=;
 b=I6J0sUgx33xUEmHV3o46IU0N2RoV3/5UD0t18utV7Zifi8U0tARaHoPlVx5UyrwzZXuAJYHzgzYcybvU0L3xXXdeGw+nekxSi/D3UupE7pIzpg1Zx90xizSUuH/obr3ldRK/92/GAp913ZlXTtCgS3zLmPnfkPh9kAbtmfxk2JT0adDVnVHytLbuYZsjOigfnbiun+vUsEPRGh1MpPYjHIqH2kdmvhiKDYhKiImIsinhMkQWRzIJbcFZgjUvdW97Jv9CEUd0J/0e3GukcNsJiICISao7MN5HUqiod58VsZYA3Y8s4eBmc7oAMedzxE6sB1pTPUc5D9vKm+TXlC18eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9098.eurprd06.prod.outlook.com (2603:10a6:150:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Sun, 8 Sep
 2024 17:12:22 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 17:12:22 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH 10/13] python3-pycurl: Fix LICENSE
Date: Sun,  8 Sep 2024 17:11:38 +0000
Message-ID: <20240908171141.99382-10-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908171141.99382-1-niko.mauno@vaisala.com>
References: <20240908171141.99382-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BA4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be1f8a1-721f-4f65-013e-08dcd02966c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GwDApvnEAoUZ2TZTRjDkfXzcpTKa1uHFJKcwKvfFGCMdN5+Kp89fhfwavJ9v?=
 =?us-ascii?Q?FbCvyL9sWKcaA/Afl8f820d1H67cIkYoweMOjiUSr7KAxmdhGslwWHLE59VW?=
 =?us-ascii?Q?s1ETtNB3olToGQNo5g/8dRYhDrwp+34bxLGdF+hKNlVHYG/AXJ1ClzTAQz53?=
 =?us-ascii?Q?1M2q8TQ9FIz4++PQpxFyTlXesr02tlhMuM/a730cs/wb29ENEs35oZBz5SIy?=
 =?us-ascii?Q?O7KDFL2prhoTkjdeWFn7IhbrCr7LWhKQRSrmus4Bly+aYu/mku7uzgpa6FPt?=
 =?us-ascii?Q?S2mgcM5aAEj05sGSbn5UBdVkRNaWLBEQACJxIX5E/ik3u+0KjtOvDkPMD1wF?=
 =?us-ascii?Q?LkGukSmOEDgBOed56z5j7UrUbwj4J4is2mbIX/eQ1X/Vd0Vw691TmnecHhW0?=
 =?us-ascii?Q?KTzIPAJM6UlhgL6BUR3hxjV0H8LcI6UbCb0IoUK//90wn9qBwe82J3sxTeEf?=
 =?us-ascii?Q?WNXGOspMx5xdSf83AIF5X5Eb8+uwWSviZPhCrh4v3e9U1eso0UUcdn3ksZDr?=
 =?us-ascii?Q?Y8VBlUAUNpj8m6VZnypKGaK0nidX8wQPeaW2f47aIR3+ptJKFYa8QDq2KVHe?=
 =?us-ascii?Q?XvNDH9P+/RBz6hXxv842JeUgvl25LfulW8rg7XHEbPDddKzWueL+5EWHUXLc?=
 =?us-ascii?Q?b9lX18QPmma1at+LlAFyarmOCCLAFcbQA5WYCaeshlGvbmHRSOFqm+qwKH24?=
 =?us-ascii?Q?f6+WfLEhIutp8WLL7+ECQ6mJ4DwBvDlhKtj14fSB4dPjHP0y+mO1g+COk7pn?=
 =?us-ascii?Q?UHBC0+IZOm2K/5neb+6Lfpij4zCx8j8mZHMfI2PAacYECGsGkxjjolZeHvUH?=
 =?us-ascii?Q?HJQ3xGYMvUwc1+uiGTH8y+aTVGpziasOgWBe/CoFN+xqnwpArK5KhD6FOXtH?=
 =?us-ascii?Q?7y6Jc1QjBLgn2RlYoMCKRXpQ/NaUi1GBMF2sXmn/y7ZCIXVSaRgvd3fcu7kM?=
 =?us-ascii?Q?kDGW7jHYfHnoElwmsbAn/mTlBvlqXbm9/ZNrJCoKURmrb8+/XqfBUt00GLp2?=
 =?us-ascii?Q?2jWylEaGyAwb11UT5Pj57p9nmjYOvM7z7X+L8+T63vuxE6pLocj7wil4LoqD?=
 =?us-ascii?Q?6pwiXwwuXmGK4VhzjbpODVRcB/6PRUfwtQrRAZZpN3lxuOK8nwB4TPTyDag9?=
 =?us-ascii?Q?raG5N+5pdvtz+YzDHr+hPDjZkvxlpDbF52CY0oQsPOa3fZewourkZgZmKfUz?=
 =?us-ascii?Q?LNrMZA8+Hzl1hSIdkBkEK+7a1f/Zg1lca0BV6micIaYjEb5qRpaQ6Pfsm3m7?=
 =?us-ascii?Q?BYjmlCZwzcjIt3sTqFttMoVWLOLX1XcAVVFAbOYj0Z2AnZmtb5oNmTSdfqWl?=
 =?us-ascii?Q?HrLTqgVhx2ZLQ99ZKUfy6ECNDqm06vwsFbsDEB0B60VB18hWGb5p0zUtmD6o?=
 =?us-ascii?Q?aMzAVWg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?awSGNecJXSJHt5vg/nFFzMuiTbH28DgFqknSPoAE1mJFamsb9C6TqKJYjnHJ?=
 =?us-ascii?Q?0jqYUBRM2jYwnt9NrbtvH4x6ssDrDFAHek4yhjAhHKAiYfvox8j0ZI8yWmuF?=
 =?us-ascii?Q?+H917q7xTpLFXS5ZOe6D0ERh00ShVNMyWfKq8ZPycQR+3mCBN2Bo8/hjqEt7?=
 =?us-ascii?Q?5QI64umYMnhYn69Dfk5ubAtNPaB0AqPRp6ZuXvrnk0jJrLnRgLcjfSJnuH0l?=
 =?us-ascii?Q?xq/FkBJPqfAAZmMugImg0N6iXS3dE+SV4uIC+ofQXaH6/xSuN/Jbt2kE8RvD?=
 =?us-ascii?Q?pw/ZOOcIrCoofeEuYYUSO1DAfSHcxdjZEKZisbdoCaDxJgthlzBmy+cRRhVL?=
 =?us-ascii?Q?FWx5KJyLiEgt2mTgoHdx8ZXj04K1D+LlzHkuCyeQG0qxNdWbkNzry7nGU4hZ?=
 =?us-ascii?Q?kC2zQonmesgkqWmhD+qkHAWR9XWnG4K2I5ERdJDd9R7NyIdXBgq1HOXSoVXP?=
 =?us-ascii?Q?YkdueeMCLAFE4xBtMGZKWG8PoEdOzdlWFVZHQ7xkLC7xgqM4pVfP2MmDy0ya?=
 =?us-ascii?Q?l0Lb5s9DvvWBfbm9dvyecLtn/GTrCvjRmu0CRlNC8pW33C9ULWnJ8wvXiJaT?=
 =?us-ascii?Q?L7umy4EeZVydiE/vyidWd9l7faMwL85ZRSpCiaOu/uX2Z+Actg4apstRgkbi?=
 =?us-ascii?Q?Z1pUMabwwZ1GnII0+p5+MzztsDDjbAkHWL3Q7SeJBj26n1Xh6ruQ8/YYsz7R?=
 =?us-ascii?Q?6PAZK+upZ/8fLKy/+R/ZGTKS3NqW/7tD2LB535sI3IbYLl4WbH2CX4sCGYmX?=
 =?us-ascii?Q?8HvQww5A4ROdJFB9dq0dAMo3MD1kbnpOjp1U/m+C9VIBLtcEAlJ6lUfRIgXT?=
 =?us-ascii?Q?B3Umrff4JfCYhlJg4zS3b3+3WaZmBO1Cw8fLn47OqPuzkp0LlG4qJ+QcDdTl?=
 =?us-ascii?Q?2jjeNc8C0Xv0BwmErxBKmtMnfhZkrGk6D+S7uWCzy82K05P6yhsTKVommiKY?=
 =?us-ascii?Q?4wNXKOey4k1IxDgGbX/qWV5jmbFSnrdBV8OYLRvNbRCQHThk3oyeFjS9hVtw?=
 =?us-ascii?Q?ia9GR0b6JF5qrXPL+yqB478lODtywMwVt+sd4lbEVOJyM9zd1xpFOSruUudB?=
 =?us-ascii?Q?jOvBnEztpxXOnxqTF9GG6cfSgouUiBTXqVx3fDtVJBosUw8ChzagKyRgdLN0?=
 =?us-ascii?Q?zwjlvBlvIOF0cu4WBdXQTa4NJfgjx/+G7nNjc06C61omoDHbggyyAu8RLmZE?=
 =?us-ascii?Q?b02i/sR5h3W1Qc1nEHtWsAGAyi5jXsBffLdK89vvxDMGsXpgszgG86FO6psm?=
 =?us-ascii?Q?OaEZrgOsaFsQkLzt+NvLZqbEHyW61eEa/it/DhcGNxICB9vnzoJg/Co19hT+?=
 =?us-ascii?Q?wDSSLdkQbnNtgierrXadeFXqugMNFJd7/ijioemWTOuxDBdYiR8FgXfG4GSR?=
 =?us-ascii?Q?duLfsHT+3jirfsPLS9tfWRmG8BBWdLZC7zA8nkPdtYLqznLRJUgi5VIsXIq3?=
 =?us-ascii?Q?tmy0T5uie7ailkApTpiC2OsDYRCOM1DwFt+fez46GecdflvAUaOeO3FweDk7?=
 =?us-ascii?Q?xCQdlz9t5u3tNrZtbKHzUZblgohaSen/2+HTdNbwHBZfjMwDco2eT2H6D9Tu?=
 =?us-ascii?Q?pKOBq/NMMwF8FgZy0Oc8e1g4OTv0FLXNWxhnD1WAU6C+erPK/EZIqq22B7K3?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be1f8a1-721f-4f65-013e-08dcd02966c9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:21.7849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFtjzHMPsv5HNu6UpLwXGOVwyPIdZL35gt0cV2PGyBr0X/8mG3/IxTm94o7zb0cNthytRmPoBKlXpQTpnvuMWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112171

Contents of
https://github.com/pycurl/pycurl/blob/REL_7_45_1/COPYING-LGPL
correspond to version 2.1 of the license rather than 2.0.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb b=
/meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb
index 407c26484..fab160ac1 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb
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


