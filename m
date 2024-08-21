Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35788C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 15:30:25 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.120])
 by mx.groups.io with SMTP id smtpd.web10.22798.1724254217582104618
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 08:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=YqoSWnuk;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.120, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4lXD8npXgbIP0yCWHL0LJvY6npHMaMrUr4fx03OCz0ZyXWIaEyhCLl4pewl9vEJcEpqTH5VaaQ+KxwyYILGTczTt2N+h+2N9LHy6cKQn6jmZrTtm8f3ZFmgjWq6HoTvjmxka6s7cGz3AD3KjXkxIoAq6Cmm+3+nWJtFlxdK976WV0KnuMeu4Ohu0SsQUJ52C8o253gpuzogAtI9t8TgjBklUFmeqiLFYAMXtMEpTZa7L4bORr0ca3WF+EwyKG97YkeJ21duJjoK/C5Zpg8yYk0sDj+4rSw3lbhDiCVCc/XgwbPq5IMO4XYmz88EpJe0RkFLrP0GJs2pSaFEPyPvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1DhDF7sPnQGpumlkZCcQpqcwXq3Ee9EBvsuj2IeIaY=;
 b=zG9VOdgCzgfTUHQIwNS3RZBThMmbBwLUcVEev/7zygqtvNFXtK5lFbv/5CAOgrP5JdmRa2p4B0fL8m6+BrsQkPtEm+72v+eyUmiaZiUeMOIhB2ILfUVhjOQUCycKAq/ZTyoCibmnPpBftOFBXQiCSy8xRp9EEbmC1pmyr9rxaODwzgUgP8/GGRg3cG8dHNSx2FtHOkMPef3HdzE48jDCGLWQPjjJx9lMox4V4k+A/bEFYm/D1fPou1GrEJ6FpB00/H5Ebkwijlk/in32qswhQTO+hQi6eFZIdT2Hnm1yu/F3k+nXB7cLhV5MG7LGw1iQOkbQvoMbpHVlsLckO04cyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1DhDF7sPnQGpumlkZCcQpqcwXq3Ee9EBvsuj2IeIaY=;
 b=YqoSWnukxj60214y5dGdh3BSS1/IyS5h3at6i1NUryCxeK1T7pMphLoqd8T023MGYfT33SD3irfboqnDx3t0NHltXYPNWj6W4Eob6MveBDFXFnZbHW0kFWbkxAU9HxLEQ4hhLCUhibqJlHOnnAsvUDIOc2rCfObGL2+CC16oy6mZi0PPwIzwKQMTMaKEZHT844fqIcBdmzamAu9tDU12pNlzq5qvbket+5POcwrLOWv2LvygnwLEuQ/wv1ssO6bBBTwPwbrBGi2gP67DkiHZcKNUmDUIAZ370T93cT2IXoi/MgPcgTAJWu/TjA/5V0WuMHzSnCFwxK9WP6263zFdtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8140.eurprd06.prod.outlook.com (2603:10a6:10:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 15:30:15 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 15:30:15 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 3/5] opensc: Drop virtual/libiconv from DEPENDS
Date: Wed, 21 Aug 2024 15:29:44 +0000
Message-ID: <20240821152946.650107-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240821152946.650107-1-niko.mauno@vaisala.com>
References: <20240821152946.650107-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00011B55.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:19) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: b060043f-8b33-4561-5522-08dcc1f6278b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?e3vj+rfum0zFnMPhaOC9McFoAtgz0X+QruIJn16ZYGBQbQr0jJP/AVyWvaoY?=
 =?us-ascii?Q?OGwtljCNgAQADDgd8iA51/AgBPWYlw1BPYikVNnij/GwNdFLkBHuRjUOrGT1?=
 =?us-ascii?Q?iiGXo34hwuY5aYZIbfPWVm3ITmy3gt7vT3pXp7Volz5FxbgHjvUqMN0tPqiq?=
 =?us-ascii?Q?xMYudxbuFxuWhXqnFSAMW63pCr7IxGlDUAdsbv0mAuVyIrsl6/bxREuNGVE0?=
 =?us-ascii?Q?MWqsvdJ6OnwXumnh5nRJyX4STN6a3UEcg01AzPbYo032zi2gXDM7mH8cax+u?=
 =?us-ascii?Q?HLC3Wc4YJhZCfPcEhnImOGklt0UldrEINj3tcewDGKRDfwLd+GMaC8/2CRXF?=
 =?us-ascii?Q?ig+sYn+nYLDQF57N13RrfTN9mDr4ZCMjt50tHazEQjqxVJOQEe7RO1cKWHim?=
 =?us-ascii?Q?wX/XRZjj1MS9+uTNV74bNtk1JVclO77OGaqKuQQvnA8bHH2172iV+uGhk6mx?=
 =?us-ascii?Q?cyyqjC1fKL9Mj9CQXiOcAkcW184CA4Uj9KfplDe3Ud/w4BwawWYfMWhSRi9E?=
 =?us-ascii?Q?mszY/dSHF3MhDX/WmhIBUqcZqdjSa5gabfA4gBKx1i3yM3nyEKJyhq+ToDR/?=
 =?us-ascii?Q?/sINcBtST+yQGgnKcA5pPXupn4EieWtYtPSQObyAP9n1IIFBDpowCjmlhAen?=
 =?us-ascii?Q?fCANP9dahcvbPr4EpWP5LPQOEpNGXlHMz1vEeaK/xluEbu+wzRMYMMrPZTPy?=
 =?us-ascii?Q?qj9o9zBuzuV8G37UcgwNHJkaqFysHqcvaU/SgpfIVhxLhgkGJ1f4XznlLiPa?=
 =?us-ascii?Q?bJdUodCY/ZywhGTU1R40B42VZ2TOEFWuIxTSpxAaLZbtaXiviftEso66DtT+?=
 =?us-ascii?Q?QUqJB7LFZ5v2G7OSEBQc0n3nItjuIGoYjLbElwdG/Rne7AK9iPJMaXFfDr8H?=
 =?us-ascii?Q?P+Ubw32cVC8U2+RLW5EACwbsa009HXfMNC7eg0+pHhC5Pg2yq4NJyOMJ+xgr?=
 =?us-ascii?Q?dN+Z4hJwjVyy28b97oHA4FzqgZ8ehqnr40XDF73TvaAMjilxqxhDOIEhaBqA?=
 =?us-ascii?Q?zp01+UJYpm2e7W0UkgjcbOsyYMU5pKNdSpSujWw+y1FzmJrTZOvq0c9uaXLz?=
 =?us-ascii?Q?sYV2I4YBRpEATlosD2Mrrvrxt2yb1ug7w8iaOoFBh1zatpz+g3VEywPUg4OE?=
 =?us-ascii?Q?92FNLg2+Dy/qyMYgteuKIzsrueWFmBk/P/JPa+MJ84iQ16nYa18uHnP4hgUa?=
 =?us-ascii?Q?8ShY+GpQPnLRJGGFWZh8fhfPwfZv6uFXzuuXFWlJp0lS4X3wwl0induNDLR0?=
 =?us-ascii?Q?rKg66rasn3CLBTsg2+xmiVPQZM/YM06NlC3ddPf68LigYq81HE2oMLXLPLrP?=
 =?us-ascii?Q?a96bpUUxjFDxxAKKiWXJ9c3pTMMex9y6v3c6HOEoVBqkpmOy6ofboWYFaEgb?=
 =?us-ascii?Q?XrDxi8o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TNZEP1xJ8GojVTZ4m3xvQT3ZPvL8MHGCjhErgMV2fS3G3x3HJG1/RXticbx+?=
 =?us-ascii?Q?GEddlScpgJ1DfEkqeB4z5RGrYbgO8dK12Ny3ZZi0FDWe6pNZa2pCW3PVgWBM?=
 =?us-ascii?Q?5HrSTYIZwCmBd2kZofxufMAqt0UKPHx5Pq7bb6s03yGkkkhpY9TkGI2ar/V/?=
 =?us-ascii?Q?gKrdQ9tJvh9cLTwsJlvUxFgNrftp9J3P/dfD67wwQGuvmiZmgrR6wHzENLPc?=
 =?us-ascii?Q?iRDX7zuCcoN/ketWNLMiRZDkHT4KJi4MxJUCt3xrFLkya5be820tYsB66yCs?=
 =?us-ascii?Q?3p9afjn+FNKhvI/YunYvt0uJ+N5B0tLdu9/xZ9jAsKC941fvQNVuu8ZTU3Ec?=
 =?us-ascii?Q?nQ78bA/4MiSMDSjLAEXjhOmD7UjPTOzrvKOdraXUoEJEzMcniWCcdoZaGBPe?=
 =?us-ascii?Q?YpRbxmot1UzpqV1jragXrynLZy1FOR8MPChj2YetA4rjP8sQ7qYB30UX1ZrO?=
 =?us-ascii?Q?nResrF+or7qk1JaV0+zZzDmaeF/pdtY8LdGAzMB7+faHLvOmxXd8O5XJD+2i?=
 =?us-ascii?Q?RThtPw2UOCsrcOYeju/th5mDGyGuM1QYaNYxKNNkkgIihangh/S+EibZnLgQ?=
 =?us-ascii?Q?Jrv57ewdXIN19wB2zfiHP4w2TFAnuTvnKMn5pS2wMaCBzpNt7OWI2p0qg3bC?=
 =?us-ascii?Q?y+XahWp9w/XhTzuDgCCAj7Dtq9S1xVB7RRh00GDnNFEgWQXPj+Tju1hYFzyq?=
 =?us-ascii?Q?j7N1CwaT9PXG9oA9sCv77Da6oTNmIaEYI/Yz8Wyf4V0WUuSeWfKybm3BFhIo?=
 =?us-ascii?Q?XMZV5BsElYrTkvtaFVN1IGQPvJVVcrKyCOyk2qH6TFu1DSbBVudsG2Ot4Q8m?=
 =?us-ascii?Q?arTfIMFQzOyjgwaAycugYST5cOSjDq00kqmCM80JrZZ8O+QdMUS2jDZ3pZzP?=
 =?us-ascii?Q?X36Ui9aX69kvFdN4M27i+vBiXJtmaXKUX6OEfwdKkXODDxkj53LGw6/2IBkV?=
 =?us-ascii?Q?Hxve1t8KQ5MQtDkR9YmzHGzkg1BKtin2PrLSGmni2gG2pGhu3G+70B/PlLqT?=
 =?us-ascii?Q?nDmxKh+Bvn7CheyHmJjCQwZHwNsPAkvlzDBcznVGxAEhVXcAkH9NztIOVWyH?=
 =?us-ascii?Q?/HG/rgklzXV99phrSXpbsnlaN36Pa3SiiQp1bprhJlMVwT0c7zG5wnJA9q+V?=
 =?us-ascii?Q?zFGZAMdphi6tk1z2qy3KBNwZ714sfrTtdN8rXxZWVBUpM5n4v8/ZZ9Gk/lac?=
 =?us-ascii?Q?Vm25Ussg/ibCg+Jjbtl1FuqnzUVSN+5zTzMJa1eVLu4uG38j1yWfxXp1dGO7?=
 =?us-ascii?Q?QqYqxvTQXNFE+NyidZ0QKqiKaZAdGhLQU7DMftuwidB5Nl2ivK1ilSACncpM?=
 =?us-ascii?Q?+Xt5ELHAyzGZxLrvphB81blrs2b3NUbKhUTd9x53epEtIfZ8PwTcuNaqzc6N?=
 =?us-ascii?Q?Ta1MmrP5vxksPgljfYb1znHQ2US8O++1Bym+Cv/8jJmhNbUnxPV+pTW5HxNa?=
 =?us-ascii?Q?AzuJMseTJ6yfRKk7+R/S5UEQ2ncYAxKi/3gh/qaTUPp/Inf//MkQLbIIwQuZ?=
 =?us-ascii?Q?c9j4kQqJBP6l0NtMfSVtvgTOr2D+ugaDOoJ7F2sApROSHtZMN9sCsThyE83R?=
 =?us-ascii?Q?Iwx00bLB/zqbxT87pfLKweW2uHnXgvKy8R+G5uJgH8qeX8zrb68RY2TelL0U?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b060043f-8b33-4561-5522-08dcc1f6278b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:30:15.1860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QL1KdYwm2PxCyU9p+aZvSdlNpUE8w6Mb8u1kU6SJMns0VrArrB0uy9Iv6fPrTDWW/IQaUHZRn45GNYnENLkHNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8140
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 15:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111887

According to
https://github.com/OpenSC/OpenSC/blob/0.25.1/NEWS#L1124-L1125
since version 0.12.0 the iconv dependency has been removed.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/opensc/opensc_0.25.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.25.1.bb
index 17dc62e19..40a8dc320 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb8aedd3bced19=
bd8026d96a8b6876d7"
 #v0.21.0
 SRCREV =3D "0a4b772d6fdab9bfaaa3123775a48a7cb6c5e7c6"
 SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3Dstable-0.25;protocol=
=3Dhttps"
-DEPENDS =3D "virtual/libiconv openssl"
+DEPENDS =3D "openssl"
=20
 S =3D "${WORKDIR}/git"
 inherit autotools pkgconfig bash-completion
--=20
2.39.2


