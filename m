Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF28CC5473A
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.116])
 by mx.groups.io with SMTP id smtpd.web11.48814.1724665264692466530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=F3pw11sM;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.249.116, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q26qXY2zM0rM2GL5rEzt5Ot8WsjULGQlsvHEgpmC8BGmpKK7kVOZG5Bop2Vhcwxf+PK55oBwBTfa8l0MshTz5KNO/A0gsxcK77LVDA2DfV7DbN7hADbPe3hW5R6osq5nuk/1Bw2EmkOfj14UFH/r1ZkaETNhchHuPIIbAaUzzQbowbiHy/CJDaeIes8PIve3k8kF8oo3toCQ4KIn23gDSXZ5WSoNVvhjAJ2q2HVosuhdKC19T0oE2UM8KSkOGcraqM6RKI/GW8Emq8SY2J6LI1DZOzngY8ZRWFp6rXpfQ6Hd6H5335U3G3H4mmC9iRqAjtonEVk+TQrAWdCd11JGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZfN7cYF0WWH0+JA5KBzHem2BHFSvKIATRWGC4yNw40=;
 b=xLT29gP6UTkbDDeEwdSLSUtotM18jRZjssLp/WRtAjHngc7b2931vVWopSV+tar6bFuYo/x/3VPI5e/9dn2ye29QQOYQ84JTJqfyTOyRZSDDd9YArx7CPzavACZHJXvqO+vZ2Vv/vrG0pvvLVty+K2OsF2z6bpWRiNR95/HR/3s+T0DjUQoA2E2oKpeonj6vEvwf5pRv4EIYeLZhHNL9+cUk/kmn3Ysf9X/+L60uLEWT8XoxRZTkPIyPMmK0is58tebHneiI6/PGreckk6Ndb7JiluW3TKXlLUplgArWeEkCBplHvw8iQSvzLVSsTOxktEYx4rx0VKLnVnVQbee/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZfN7cYF0WWH0+JA5KBzHem2BHFSvKIATRWGC4yNw40=;
 b=F3pw11sMUYnD/Nglho30BT/jLq7+0fNkHYXdUQ7pkC+PplSeG4z4NG4jCPgTP2MG9PCJI8H4V28Eq2utN+EtmPNzXcoX2MjNIsuIRx98C2JpfdFHLLc4oSy/zWVKC3k4RS0/SueNjLwkibBjbe1bzwIrGkb1Kd51rKwUhIf0l+Uql/JBs/Lfim9+PkYeA7vFjbxf+2+KqOs/PGUQ6B8ysMLexpONIu+PDP6djZkt57u4IwjoJf10Waj1syqOQs5gV2DGySoFiraFHkXD7QdLmnEzu8X8ZCmhDS556q9KkOcsIIIK9owt43FENlq89C6EjhqwiJ/duOzbheA7XRW8HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GV1PR06MB8418.eurprd06.prod.outlook.com (2603:10a6:150:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:40:59 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:40:59 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 02/21] python3-ansi2html: Fix HOMEPAGE and LICENSE
Date: Mon, 26 Aug 2024 09:40:02 +0000
Message-ID: <20240826094021.2744296-2-niko.mauno@vaisala.com>
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
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GV1PR06MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: be44e293-57a0-4e1f-8cec-08dcc5b32deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uqChUCGKv4nz0OQlMoUB27etlMz2fN4BKncrTGyvQauCmgc1axrU+UBAVuV8?=
 =?us-ascii?Q?5diMX1uTV/137il1jlBsgjuCwOlpPIa8sSAEYV3yyndU5+bXtwjgbsHGMKWv?=
 =?us-ascii?Q?70Ak2kjFpF/r7qstPubpb8raj5rLbOwkyWuLP0SA9fANWoxNdGHu1nSMz/dD?=
 =?us-ascii?Q?d6FOIilO/19eUM7FIvhclz6kj+llXRfHOe3RQ7U9Y4xGbz1ZWyUPnlkHnS2Q?=
 =?us-ascii?Q?W0JLe6wU0PQShFWqAQ1sLZ0Wg0BaHTsRM3NF7xozbnuXBiah7Od3jREQF5o0?=
 =?us-ascii?Q?dLa5RvoXeHKv+0RfN95MSxFyIaC9ZZIMFMa1LqLpnMR4e+MrORgnkRWlnInV?=
 =?us-ascii?Q?vw/WSvBOxzyEyJ08EfknvGNdht0favYBJheL4If1+ADtRvyCEwAf8oInELJu?=
 =?us-ascii?Q?YaWO/X5XVLDe8XPu+WTFRpLGpuaMwHq/in5s0BkJqA7rybmD0B737CUdEQNf?=
 =?us-ascii?Q?nHPi4B0vjfEs+itI/Yq+GR5dMpxIC0/TSSXSkKA9l82XRjB0XiscavEskFc/?=
 =?us-ascii?Q?kNcYQOhmZH9XrKwHKffAqZ/wqmVI0Biem8vEuNdPivocrqttjaaRPvlXqkBL?=
 =?us-ascii?Q?0MjDduukhI+Fh8CPSvwPI/AjIs61GLg9iIoUmyDpceKAfmhXkYPdWHIPhdoJ?=
 =?us-ascii?Q?pvbQ8Y1dPP9NMKVafj/leoDHYxXYUiX6Nx0d5ehbs/3x/6Kow4wKFk3gXuR7?=
 =?us-ascii?Q?cm+KLvlwcBewwIBZ0VyakfiEvQQle66qv/jCLENKDpRjFzNil0cEAjSFxRyy?=
 =?us-ascii?Q?dGAW8SCSO6NAny8F8drZUmaBTuP9i2J4nv59PQABc8wsOuXariuIrq2v82ds?=
 =?us-ascii?Q?UdAAJoED2Ne7TM4xTSGUlaIAs2spSOjAfhOnKp5PX1bnuUDbS2q1XqgElOI+?=
 =?us-ascii?Q?NU4I9JnOJR6YP/+RHxZEJu3skuSGMWdEZJRA4tIEz8bdWiK0etsBf+U5ESCI?=
 =?us-ascii?Q?185kibY/+bllTS67lB3y456OSEZtFT6JKDdHJm10hzxkXb5MW7V/7L7eYWwd?=
 =?us-ascii?Q?aNf70jC3rvUw01ExwhB0U6rttMa/VNiIiXtgZo7n+oiSecuGsRo9G4fYw0++?=
 =?us-ascii?Q?rD+UQJwRL8O1A9D3gVJmu8HWPVxTQpyqWtSig4J19FYaScwfnjZtQzNGFHYT?=
 =?us-ascii?Q?D3EmPo1Gw/AIZPBu5cpcKuL3nKWitU40izSyrdEKBECGX/lYBZDlH6WfnQ+N?=
 =?us-ascii?Q?MsJ/yR0XVj5y86jPwzMi0Zhr4F2NIeXNTHDiFinx/b6ol730khnG3oLrrt7H?=
 =?us-ascii?Q?jOKZ6OtFynpm30XyA/CeI2uHW+shO0E8lsfo6CXOuDopEquqW9clrjWiGVrk?=
 =?us-ascii?Q?sXXUVYdZ+61ni/KDweBi3Hyjh9JSPqw/iBF8pvRXTr0XtGoOhq06Zp41niQg?=
 =?us-ascii?Q?tP9vi+o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K4kPOYXFxfMqSelwNxiqGP3T9BNYi/RScBpF6cTyNOsctrXFceWdkIBnYNla?=
 =?us-ascii?Q?ugWdVIMcyGLmw4V4Zp8bbn3KtNF3clH/GrjeLUMcKWslNYpl7HHpisFIBZEb?=
 =?us-ascii?Q?3z9ncU2SsLXTflkQB46qT/xNCL9SyycQwDuwIQ6HkgmKRnv3ODclMIH4l3+3?=
 =?us-ascii?Q?eLm/t/Zd0nxaZw8ja6Ezt+FIjd4jRzUmpriUpSPw9KTFoKEG0s8V70sIrNo1?=
 =?us-ascii?Q?FTDSBTi6J8wy2KN7bCg9cPmwfSiYZWZTzIUTlGczpcZdOIK49VG1qPDC+nZr?=
 =?us-ascii?Q?e6BgL9WaSI8O+XVSvojv4dzF02S5CXcqlUhBff0t3Drv1wWV09BpTXvQywsX?=
 =?us-ascii?Q?HZuS/b7DwD8mZYESuA/8fl4VkXd6AsEq9sqT53X5BLJZDqr6twOzWOzTpBha?=
 =?us-ascii?Q?MaiY8Vo+R9josZGQgF0FUIZr4qRrLYnKsvlUpHqxHohq6isF/AKy9rnyeLSN?=
 =?us-ascii?Q?knx1MjewfWcUCss7BCQDKtjyATEGY8E8LyD3tUmMQZTWTXpLVwV7itDO4Oxs?=
 =?us-ascii?Q?bAq/Skti9jXvhd3NANOZFgEV3akex3mVZ6m4UsnCOLPm4Q+dDhnREOVVm31S?=
 =?us-ascii?Q?AA4wBlLvVygKjzkm2isn4isvOJGm7apwLHbLREutCJHIRj7FYHeBjveAg+gf?=
 =?us-ascii?Q?/mnLrETFaO3NUIqFD84eXFqC+0WY3VhZBLpy5J3peAo2cFaKjj4EmgrU89wD?=
 =?us-ascii?Q?LVUESnY8TsHrPZdPIk9sxUYFHQz5+4YijrrxTgH2PEXJsKchwXtl5S0sJUYm?=
 =?us-ascii?Q?IuvObDqFlVJj5u1mrlKGDh347fkukhZuviI8ydUdyeLcjysy87et3XJ2NPfE?=
 =?us-ascii?Q?lMr8Gjm2vLoVeh7t5plenbCpe5EodqXg0BQiK5i/XeVVd/GmlCMBvRQQTpWn?=
 =?us-ascii?Q?MWHHd/vuzB3JSNO9FrG6NkHkuY1iJGsfEQeQvwqYCxzH+VkYdzHI9Jv5ipsc?=
 =?us-ascii?Q?6g0lpBgjIB7CZiFTm7tNEHm+Jv4cFsmqeiT/nSGP8RrmeGVcI5W+rGCskrGY?=
 =?us-ascii?Q?W61t07ZGYQQSdt4eXMaQTf8oumsTxxbmUkoI92r3d336mCmS2DBYYOAUaPDV?=
 =?us-ascii?Q?6kojafF8EPDG6tlL3pA4M+oOyH3zskZkPSPdXnGhLt3xTprfVMgZqheNiUgU?=
 =?us-ascii?Q?KTH8hL+VwsL0cUJxH6k+ZOkkhg27EasD3JHKKZyCEVX9lW2WxguIdIKgSUl/?=
 =?us-ascii?Q?cifb/RpeQD5Pe5gtYLL5hQ9y3DYzVlXcwNwTP3zJmHQSTOTy35hNO9AzIZ0e?=
 =?us-ascii?Q?wJd8rTZa0kUWELJ8QU0XWnW1b8P2VpgQZzKtFjNCDG3P0H8aZJj6pJMfpd3/?=
 =?us-ascii?Q?abCyBTQthTBaDTL4ASFCuaOh/pxjgGzcydTt2lmpUyj6HdtVb2lan6sh7a6c?=
 =?us-ascii?Q?/9iUdSkRIguQYte9Rur/klM3oCRc1lOOk+vJLno3OFZSOhwOFRFw2zvCdCCN?=
 =?us-ascii?Q?UbUSIlQoN/iTX++URb9fk4pFNVDvhFMCA5mGUSpLWrWV/dARtdimwN8zYJkY?=
 =?us-ascii?Q?Y3gZ+wz+/6XflEPYG3mmchhYBwpjftugMcE5Gok28a39pvLP2f9imVgvERl/?=
 =?us-ascii?Q?xsfXeU70+APfIN90B3EtiHNwS0Vjx6U5QlTF/EWXS+uOA3T2Qmn71v6X6m+g?=
 =?us-ascii?Q?Bw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be44e293-57a0-4e1f-8cec-08dcc5b32deb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:54.1375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8G0Y7kle91w08JBTBnYwrCYX7WmsfBbfhP9xl/Pa7i4UqNmivDPgd29Ruq2RGKN05QoNYbmydDIeXB0z55FtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB8418
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111947

Update HOMEPAGE to the url which old homepage address redirects to, and
change LICENSE value to match what is stated in the README file:
https://github.com/pycontribs/ansi2html?tab=3Dreadme-ov-file#license
as well as source code comment:
https://github.com/pycontribs/ansi2html/blob/v1.9.2/src/ansi2html/converter=
.py#L9-L12
also LICENSE file is 'LESSER' variant:
https://github.com/pycontribs/ansi2html/blob/v1.9.2/LICENSE#L1

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../recipes-devtools/python/python3-ansi2html_1.9.2.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb=
 b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
index 9942288c0..d817d8ee5 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
@@ -1,7 +1,7 @@
 DESCRPTION =3D "ansi2html - Convert text with ANSI color codes to HTML or =
to LaTeX"
-HOMEPAGE =3D "https://github.com/ralphbean/ansi2html"
+HOMEPAGE =3D "https://github.com/pycontribs/ansi2html"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3000208d539ec061b899bce1d9ce940=
4"
-LICENSE =3D "GPL-3.0-only"
+LICENSE =3D "LGPL-3.0-or-later"
=20
 PYPI_PACKAGE =3D "ansi2html"
=20
--=20
2.39.2


