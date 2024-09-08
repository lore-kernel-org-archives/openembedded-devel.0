Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2212ECE57E
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.123])
 by mx.groups.io with SMTP id smtpd.web11.34076.1725815542816309636
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=uL483sN8;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.123, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IArpDn/N6rzFd5ezgX7Uvs1fiPHHTlCMw3gXJ6vbfU4vk0mq/ohuDy6MQTk/Iz3PTJi3KhgDnU/r+kX42zfvtuAh4tEkpPv1YObLpfK0Z9AFZ1yxGx1NzhhT3NxET/DbqRFGqECysTR2FkXAakxeAFzNhTPD7Xsr3ZuHUdrdmI5+KSlfzLnULvpBGt5cug1WvV/nLp3cZzzUylv1K8phVp5tMYrfTouful8JhSP3gZYEvQe9lNhEzboEdvSg4O7t5+ZI74Zpv6Df+CPfQEm7g2dmkaSSk3lYMg4SNXRaOEMPuS2mT5nIREhVnbMG0Zg8wOjkktlCCr23FNE8/O0o6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZJoloApv4PoBLvfUY5fjEnDnq7Tf4Z78+fNb/96eaw=;
 b=Fv8qJe4+bMt/8g35pqA+z705Y1suy4lAZZj50BjCR8rwoVZr4hiz7iuxz16l6R8yJI/3ggvGN059JOuBFjyEkau75+f3iq0JbycuYur8aC6NtDfOmHyQWQNY8EFLv+e4xzQ3i5bI6mWWkaf15q0VmKqTf0Ef3L6D8JPDSEpenRY8rDXNJmqJsVJg9s0GC0AgpxvtrSBH3x9n1Fw+DP95J+QgR3Gw23YAqKsz+jfJUHDOVjM3WlFzcniF9lKuXOcso+KqQ++8i3S0nIKIT5tkc3wdqxfbSJzTbp0fK8qejMQu2MO4wzchyTZ6FtXmOc5Ew63NH+ANNOqEin2vE6QtKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZJoloApv4PoBLvfUY5fjEnDnq7Tf4Z78+fNb/96eaw=;
 b=uL483sN84NkYXn05UewjSduwAq6LvFozVqgq9N4Coe5RclcEdjFROvd9HNXUomz+ZtuzSD2fHyJJpNX3ix1A/MPktRoZnFzQE3U5o0Yk4f2KnTa4SX4Wutpd8anjqQd5rUTTFPAdCR164yw0RKM/wwL3kLeKLcv857EShXd5cidl04TpQ6mrIO4dMKQefFTvLEgG2KEu1zHTnm12+uzwUOWU9pTF+jnHj/U4cSpdnjcQHkr06u2JE9LDuByYj9IRxmtlkpaPxp+k2B3dXI+ES/oBAiLnZp1BLZBboxo3W75qX78mIjB+Xglq9Om7Nf5cmNUSXwgDiQ+aHq1+FspFdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9098.eurprd06.prod.outlook.com (2603:10a6:150:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Sun, 8 Sep
 2024 17:12:20 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 17:12:20 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH 05/13] python3-mock: Fix LICENSE
Date: Sun,  8 Sep 2024 17:11:33 +0000
Message-ID: <20240908171141.99382-5-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9aac4959-a5f6-4692-b022-08dcd0296583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PHl5esEj9cJMK7R74WShN24OMx/8vEPc/1H3qRXprwzkEy6tBbo/aOgZlHVC?=
 =?us-ascii?Q?iNOAjgCm3VNFZyASphza2KMhfP5g3hIa9bc8NSCJzI7e5X2l9OPu8zZ3g0wc?=
 =?us-ascii?Q?DYrZY5P+TOiWwco8rPc1R8BsXaRTkFmk23QzIQh4P/QCCv7t19XDRtO7bGW9?=
 =?us-ascii?Q?0jWmeFvf1yTakUQlFcUBvE1iCHfA05dmsDEEG/y6Z1wgc51T3w2QMJ9l17Uz?=
 =?us-ascii?Q?9qjNnSO4JhA2wOc0T+Q7JYc0HSLkOh9t+l11mqlfdsO8cisxjZ+pUndjpomf?=
 =?us-ascii?Q?mvdFBIolYKUFrgHbi7sSu2U+f35c0N0oqIUSrLUQEWlIk2fN+L60iWGckN1+?=
 =?us-ascii?Q?HHEDyhoVJLpiX36ry6okvgLvA1rT/cJXbap0Jw9YLhG8ZRn9n7tTouxvqeSx?=
 =?us-ascii?Q?i7KOJxHzngUOqwFTf9OSXVN/3k+fvUYrBC4Bl5b6kC1bLwOGL7KU7TR7M95T?=
 =?us-ascii?Q?+ZlUHVO3hhMkrfR7E+anLE5cMg2S7oZvpIggYUKc5gScpkhe5dgPqZ5dNRYG?=
 =?us-ascii?Q?DX8E234vpfNmINImVk50CzeXzWqmTrXlzIkikapr+BMAdRAxFI0iLIE+BNx8?=
 =?us-ascii?Q?n0FUMhsmuT+Lv/FlETta+q/i5s3E7iNGECFXz2kjypMPRijaUKaKQRYBWlTT?=
 =?us-ascii?Q?eUd0jKXC3N7AqufEXZZbVTaCkH+gwnN88HgvOMDic/gX3GtyZHF1smkE965D?=
 =?us-ascii?Q?nHNAA6EYWK8LLiMCjcdQjsoU7aBcG+762+kLa3Dk2FeRD8QzQYj6rBcIdunF?=
 =?us-ascii?Q?2wG0Xi992DnHTQh1LmHBlIsl4ZC1Oy1cDc+i5oQJG+4y4zNXt5iSbBWbJOhX?=
 =?us-ascii?Q?2tlGOu5iDJOiFU3AKiIaMu2wfn87jw6lQlsiwthAW5nRS/EUEw1f/PdKmUEG?=
 =?us-ascii?Q?KBhDgveBKMNzlfPfoP9pKrWgiwv9R7ydMNu+W4cZJg3z0gr4RM2a/Y2wT0wY?=
 =?us-ascii?Q?glP11ZKDMJ49u4Dl69ugn1ODYCUURvGl6JPp6YrheH56mkoO+UdE2OFWIZjn?=
 =?us-ascii?Q?At2a3wvYqBX5frm3d+mCScRprFIVW/qXZ7sYirAYmF9oYumHSS1hqrrYZNmL?=
 =?us-ascii?Q?MImEzhK/xl5stBz9XzxnSWE2gE743ai9bGtp64+J4Ev7wwaACj2bFv77RDzD?=
 =?us-ascii?Q?4MzYFI19V55g6MUaf9Nbpn3y7OhWfpJ6GRYVR0LUGK03l1sUeVNfr1wJDkTN?=
 =?us-ascii?Q?VkE+ko8RxFunfF/h0Va2h3raN9gdfFOTm5KHxyLavaPpHz8S3OyVB4iBO1mj?=
 =?us-ascii?Q?6YT+sYGd5VFhvgGCkmdnNlPRaKlDvElf7Lmkxhtz7tzuVqJmU5jdnGb5JvVo?=
 =?us-ascii?Q?vPUPWEN5dpxiuAaq3vAZS1ar9CPEtcVXp+DT50OB0ia431IFoyQdptqjIZiF?=
 =?us-ascii?Q?P1zmqxk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mvx8fF0l3c92spQrbiozaXBZ/2Uo7eIRko9pJQa8AjsEvtBAQZeO2SApmoNr?=
 =?us-ascii?Q?42zV3DB/TMrKQ2OEErhX/Bk9XL6/HohXCWQuMExVWO5h00uXCPU07+bKaTwi?=
 =?us-ascii?Q?+C6tiAN9LyQeegZ/BiyDiSBInB/WfdtWKUtUVlfl2WPrPZIwxq7ZXMTey6BI?=
 =?us-ascii?Q?zbh2G7lqordL7bXFffAArx5nMI1gc2iVekLfR7b4S1Wsx3WpuJToGt+3vYLZ?=
 =?us-ascii?Q?dYF0Ug50Gx7pHpoOhJkWIGLSxYdecF/EHldFxezTQpS4gxY2lPaGeq9zGwJU?=
 =?us-ascii?Q?TjAOOkjPqgFxkPKp1AaxJuafzG8JswWG9niqW63AvIy32BRyb9a0V+sHRgG+?=
 =?us-ascii?Q?V/x6xrnChlv83JIfAWH4L2afSA4wPBeSQnLB5tm9P3hJtclCyTSrxqJoJQfJ?=
 =?us-ascii?Q?mQaIumI31uZiHct6qVQUBgCXU+yjSnd6gAcGn9ZoONtk/DxpSoWlfQtD19sz?=
 =?us-ascii?Q?p/mQodtQ1du0ojI/nfZaD//qMYJ0XDmNtDmD1r+sZakD9aJTTyBG8kEn+KhH?=
 =?us-ascii?Q?90R4wXR4U1pRq/3fwyGQXdmMTdCRFYwoIZbb7Bhor63HjEfIVl/j4//59ig3?=
 =?us-ascii?Q?pn4HrLGXf8hkbhmYmlLFw6UqlJcDwewk6PeC3YgbQWWGyqfrLlgoZ2BSepHZ?=
 =?us-ascii?Q?Jlx3jWQYFXBQralhs73+lQuc7UuU6jISrddad65aWvKa7I+L7434Q/65So9z?=
 =?us-ascii?Q?ZJ7nzkdOOlJOdNmvzQDWQuiLtLisAH0AMB+UPPm2k2T1gTaQx70XWo7/6RTX?=
 =?us-ascii?Q?6OGrA+GoSOqyLKLUlckTMmip8QF3cNzPNP2M+Cfx+ks3ClVthLIO2+q4NV9f?=
 =?us-ascii?Q?Usz3Y0FiGM010KAXcFDHFoxq0i80sRk1A29lTeqN1lF9TyqY3KIeR9WBV+Sx?=
 =?us-ascii?Q?vRgv+/73QdghBZn2NUIVOpdA3HSj2/OJqzEpj1PojRifuaU3Kr2tLAZmIqBd?=
 =?us-ascii?Q?GVX4BozDqBcapozgU+OpNXBcNF9g2gljIQgvHqh8troAgXAUMidbDnMlIA7t?=
 =?us-ascii?Q?g2uURD2G/xTQD8yOSTOxfB5kUVONjXuBagOE/5YCinZ50tNBKvnkiKSH55Iy?=
 =?us-ascii?Q?WWv2eEvXJnwA7cbQJy4h7/Jt3PYI2RR7U+nIbEYA6roLDbQ43eToiCv4d/b0?=
 =?us-ascii?Q?07HwIWRPmo5jul4CALMF1GImqztU4y3CkEB+25cB7OsHVeXVaBrDFh5c+e5H?=
 =?us-ascii?Q?aS4QfdSEGv0x+kVDgUK2vn8rDDtm2PqdIRTOEty7RNEn9VZl8h925VNQG8Eb?=
 =?us-ascii?Q?v+ui0Ajj3tUoiw/z1jbZqgjIqJCovrNdRxpYq3lX3va7FBD43ZX9gRviKP1y?=
 =?us-ascii?Q?8st1sc/quVrRWMvPaqF6T/h/gRlmXyu87RuHDdrM09XH71oW74gGln38OxYp?=
 =?us-ascii?Q?ZNdsj71H5wJdsYoHMQ00UE426N/NiD35U4t9LLyR6mf4pGs+vuguXxKDlw46?=
 =?us-ascii?Q?08njVO3tDuLlZVnT34cw4wPPZRXHxYZ8koM+3PZCU5ECwC+8p4KDnFXerAM4?=
 =?us-ascii?Q?5PLH3BjOKAvSLJd1wqz/hRXAaHl1oLotwJy2+8RcM1aUbmOf9TpQWJma4fg/?=
 =?us-ascii?Q?FYSnh6iS6cAgbc4d8IioQgj48dlYdH55I4fKwB9BX1sjUcTdtHOe0TbNwBvQ?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aac4959-a5f6-4692-b022-08dcd0296583
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:19.6336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65jww9Tx2Xgq4T2hy7/lBEbpT7L0kCRyTjhDh04bGy6zWwbmrW6CBctR3WiJhkUCf33vRS4+5g48wg8UVuuUgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112165

According to
https://github.com/testing-cabal/mock/blob/4.0.3/LICENSE.txt the
project is subject to BSD-2-Clause license. (Also
https://pypi.org/project/mock/ states 'BSD License'.)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-mock_4.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.3.bb b/me=
ta-python/recipes-devtools/python/python3-mock_4.0.3.bb
index 8f2305b50..9330e8bce 100644
--- a/meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "A Python Mocking and Patching Library for Testing"
 HOMEPAGE =3D "https://pypi.python.org/pypi/mock"
 SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dde9dfbf780446b18aab11f00baa=
f5b7e"
=20
 inherit pypi setuptools3
--=20
2.39.2


