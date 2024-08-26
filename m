Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827E3C54734
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.116])
 by mx.groups.io with SMTP id smtpd.web11.48814.1724665264692466530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=yZV90t/C;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.249.116, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekrYpH1XcfkbtD/BMEjzgMU7032bj7ZfFmwRdz2msqstmJ/z00xdG9YbpSYdQ8RXjS8ZTTCbCkb3dG5nzYuaY3Tqw+UK5nYJaSt9nu60GjT7I2KNFVbSRDDGvSlJ+jgCNxAz57+IB8yP19rXjd26Yp8qrpdp5yVsbToGu3f5zfvozMeRal5AgcubW2mtRz/GSiSzEnobBzCyBa7DSZ6N9Ije9eCDMNN1YCg1SuuOeNi/dik1WnnZMW6+6wouruqN2fH4+d+tLnB65I52SZIyYS86xLWt0ZNN/iBhYWz+QxGl6USB7HAxHUvT8omBkyVyBUjUkqnp7P1T9ISiillZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmEvmAwpiBFxeXDp52N0KXDmvKgSvwdKfgzaKPymPMk=;
 b=BVRxiaiSH96HuvTGgwOANaSEvut8FsBUygC5LyPIg3jwWzXBNy3j3F64KoTo20o7LFQ764MuIDryJzEV5EP/8Jj10/UeXkQpPZgEZLXLRoSbFFHozUgwAIFXzjKUZd7Q3tSG/IIvHTmOFotIOtLdw7BTX/bxeTC6wmPaqWwA8J7ub0D7KlL40wLKhNV1KQM/qLDW3cBtletCUhiil2rMNAdAydsxinOXgOdOgD7ijeZHd9S/HNlSm/zBRK79ItfreZ/uXF3HXfQiouj5n9kSIACUJZryEt4arQlors36XOsIRiyTkRidm4rGh9rKtBb3jB5r3/lHywqDvxkyinB7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmEvmAwpiBFxeXDp52N0KXDmvKgSvwdKfgzaKPymPMk=;
 b=yZV90t/CK9HQXwnkQjqq31D8aTOFZ3Rcu+EAuB9jc2IpifYk8a+3ViCkbE7BjD5d/EOJW0715GQyDfyTJj3mxgxsVeKGjagq3n2Vxfxu9x+16cOHtprpY24WYrXmECbMlLbGk1HESBdgEIQCLdSQ+tA+viabKz8PNrPJC8TVcXxqvFwRMcN/o8XJw+rPVVS5tcAAEeZqbnl0AMaUdkNBMqW8gCordFBHkwaESMWL3A9hv+tpsG5jNXzrdF0DGw68Hm+IpXFNiFIKlkbu8attAN0FSXND5238pEW6T+E+4Uz0Whv8mFVpO2Hwptw2G5R/my7HHWHWtWxroBjAEa/HbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GV1PR06MB8418.eurprd06.prod.outlook.com (2603:10a6:150:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:00 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:00 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 03/21] python3-cbor2: Fix LICENSE and LIC_FILES_CHKSUM
Date: Mon, 26 Aug 2024 09:40:03 +0000
Message-ID: <20240826094021.2744296-3-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: e443641d-9c44-4edc-406a-08dcc5b32e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2MgZsAQ4T6eNbzamgiRtnhTep7964HEiC+yRPz2oz7uhBb0JeoaZwquUZtBE?=
 =?us-ascii?Q?Ce3nHOcd4AmLevklJAA71qGz8QeGNjda/wU3biQjQStxRWvxzEezASvqj1Q9?=
 =?us-ascii?Q?jKt51WaRp7kj/WO+X3OtZjmUZpSMvBGWLg4VRc6YRN5/dniT7qwOUXUHwCZY?=
 =?us-ascii?Q?ysq3DfjgMwwBDRkeXSPT7EmG4qc4Mcb3et2mRRgN3VkMJZsDAqAGJKL9kSm/?=
 =?us-ascii?Q?1+45GAgRkiX+CzTQoAIOPlaR1Nf9KHnUvBarh3YerQ5Mj13RHCNqcsMWkuxl?=
 =?us-ascii?Q?b+RHi2fFoZGiUy0BLZTmw2Y9kfdQ0uNbYyanZf0Z1xQmUDTK6JuBGZjWpdPE?=
 =?us-ascii?Q?35YPJvhQMi9ZJY8fmnVw1WsjKqKwy/RZzvTx2TSawqdM5Wnz3ZrYifAT7XR9?=
 =?us-ascii?Q?o1AMkn/2kci8R+NqK7N9nl3+VTB7v1WvM0tfS+oQgDrmrRz94/gTb6GS2oFD?=
 =?us-ascii?Q?IxzOYgze9Q6Q29FNpwKWA1WjHKraIoMoTPMNo/4YsVx5Ku75HNZTZaaHjypw?=
 =?us-ascii?Q?IQh/ELMhHrcuX7H475AU01LR/zyK1cPXogR/K1zzZy2ygGi1ZnaL0qTBfVRR?=
 =?us-ascii?Q?TahYA7PZhip3cGp0hZKhSSXIydbOnsvRd97I+5SbIa3o0phBMHdsXyXctC/0?=
 =?us-ascii?Q?wEtX1tw/iLKslhOwFSZzOnNoaw8Z5paeOKFnpW47zCBcNxvjc3+EFClFHdG9?=
 =?us-ascii?Q?i+uEFQmDeiZrozNUuYB3aXZupuP0ONxF4Rf/C3Z85h8DnWYcmRYwQp7FfCDv?=
 =?us-ascii?Q?nAGr27oUgQwtYqac89ZCGQ4vQKwBdmSspGCHsQtreWsX5atMaJazLBD0QLGK?=
 =?us-ascii?Q?BLCKeqXW46A2tZmELAD8hdTuMqvtt8GEgNyfnXOj+AlOJ+Hx4S+FUJnYbaFS?=
 =?us-ascii?Q?Rr3BiFjZwV8ywaGhWCFlJAsvAA0PLxf9pzb8NwQk6XMIGurrWMGJ8A0INrst?=
 =?us-ascii?Q?FlKRHn84ZEgAaWAARt/pU51m+i6W87eDuE1YT8MfZVQBLrzUzWqfLEa2fQ95?=
 =?us-ascii?Q?Thzcpy4rUFSH42+LUT9oztzODw+c9DdqKPXKFYxLMNelJL8fUsi6jReGVdD/?=
 =?us-ascii?Q?UgMhXfc9uLtpZjDi6CRr1GH2t7amAFBwUa81brSG4TvrSunIv9E56F9i/PKg?=
 =?us-ascii?Q?2VyUHUf+ud2L85RT7L/s79efruqow71MwanG+uEFzCUbuNaqRlqb5NtvFEtd?=
 =?us-ascii?Q?Cob9agb/pO7qg08bYrmh0FeWGY3R8TxhDDUlHrqPBVo1YeR50IP+72xFZVde?=
 =?us-ascii?Q?BFeAC6FmIwS6myw6cec6YyTzx4RLFzIZiHwoyU4VbmXaiVQzsqRnxFHE024E?=
 =?us-ascii?Q?2hxwPwHRksjAea3uhTpCoxADgFDF6flG7lSvYlA0BKt4QI64mSGIWJUWXjhj?=
 =?us-ascii?Q?aI9Xk6o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mOGv76u5vwlDSU3zV2z1E7AyRm5t39KDTxD0LDpfY242CKkw/Ei7uylMHwcU?=
 =?us-ascii?Q?vZxyLiUtlTZnu0hlsmC4Q3gob2oqoyBvIePetpP43yR8B7m0hxPqrlUfdS54?=
 =?us-ascii?Q?HysXUPVyEqDGsyUzsINgArSEH/fJyJpDzlljRbN6Q7rQo3vvvz5ITdaoqx41?=
 =?us-ascii?Q?f46gIGkLTuVwEt2+HVf4QcnwAcJG7dDZEZ7eqznhTf67RlX2ArBvn+X9keZ8?=
 =?us-ascii?Q?CTXjgi1/TNwXBv00vO3lRy4LM800x+M1PAKOcJnUMODRsHPLxeRPdrJxBCA+?=
 =?us-ascii?Q?v62U5ZPRX9XSEf0tMqp+1RnFehrToS1/+sV2WFunjDtiZE+LgI9jRhjh+H1F?=
 =?us-ascii?Q?QvyQIufH/EWwfTVMRdw2Kpf+OpbTjwqtfJex3OHcmQOv4DayBNPzDX+fGK6j?=
 =?us-ascii?Q?elS+XJrLdunwx52K6glTO7+qGzEpoFHwwgw74/HhWqT5qnnWomJbQmC5KGMT?=
 =?us-ascii?Q?tDu2FXhqZWloCjUFcXk6i8qjNWqQCwI0ayvFINJi8sQM3YlR2YRqGW5x6cQq?=
 =?us-ascii?Q?jP35uXpf9zQ1aQySgfDDeBrqJd7THAA90jR6Ts4S37JHFE7Y8DtdLjixJqzB?=
 =?us-ascii?Q?ClAluyzRwtO17tHbFWcmWHhFkDtHcv1+XvHIGBkD2vpUIxsAeSmPnHhxl+9z?=
 =?us-ascii?Q?TYu38Qh94GMes+kfaoGo36ySbmgHOcIe098uuIGk1tRZhp/TK11VxNFiJZ4T?=
 =?us-ascii?Q?B52y+m4w9P6jgERBccDsRre1Gqc3QBSFI4fCMryK/dZh1BzLzgxwbIINHhzy?=
 =?us-ascii?Q?yIsMh4Io2SU5snk4KYdNnBcJ1dWYOlX1s6tjWdIo3a7KCyX11mgTDETtveRS?=
 =?us-ascii?Q?qbta+tQq17t4nZZaddgiT7ve9OX5cTqdAoB2oYhShLeK6YdL5Tuli+waNuQI?=
 =?us-ascii?Q?vgi77oP4WMPTA4w3+XYABa7AiNGMbgTT68Eia8W5KEgJAxonWyM5R7CTrbcq?=
 =?us-ascii?Q?FuNJX45TbA8n/b4uUwi4J3tmKCVBGFBNLJmoWR/PmW/O97jWoH4X8mbKMyL9?=
 =?us-ascii?Q?2hrIL5DqBUSNVBlc4lSPF4rcNptCHqDnehJzR52q8yDj3D43d3Ql/L4GAPTy?=
 =?us-ascii?Q?6uTWU5GBhPTT1yfw2Iqt2TH/u+BpdlIXGNMm1wEFhYQAiX4v7DI3yaPjxRpx?=
 =?us-ascii?Q?DznQIn+QzS4ZcNpU7rGU6v04rsCs4in7ecxmcK9jrGeJVFeo5afU0YMv1R92?=
 =?us-ascii?Q?kz9UeHb37akWBMmz1ZI4SMr5ORwUYG+bpQ/xFYBvYyvrxsTQ1Vftkwue5DMA?=
 =?us-ascii?Q?D6wLr2XbQaZaL0gdcmFB6ByndWvkx8Ax5xh6BrUDPrpy63ZnSFtNKwbLfsWQ?=
 =?us-ascii?Q?HUIrSE0bYmSmWLXzPuO5UVGti+lIsizSyNpV63628AfXtQtxOW2KdlByA2s5?=
 =?us-ascii?Q?KYmshVQ3s21QpNDLJimdTPvDQ5JqoKIIjd/CKqoyj73xn59DrvsHKlLFC9Hl?=
 =?us-ascii?Q?sDww+Pwdm9uQgnhImDY+Jgga+RAJ0IIKa4PwTg7UtuchboRfnbSYKHGK7Mpr?=
 =?us-ascii?Q?fGxAoqTFVWOgSSwzjZi/Q9p7qfOqe+70w3tpi4pLwZTCP5ERzHJbWyERdhnO?=
 =?us-ascii?Q?jIswGx0ZNdowNjw56M8Vj3urwo63FSztglbt04YBt1zJ2aBeFrPV4669uWLO?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e443641d-9c44-4edc-406a-08dcc5b32e27
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:54.6170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erp+o/ONXLcN96DdO/YHmNlufa5Jgki+KMguPokv9SHVEGV/LGRYDc7xpYhe8dpNMhm5Ogs5dFHhMvpNPJZwFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB8418
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111952

Both project pypi page: https://pypi.org/project/cbor2/ as well as
https://github.com/agronholm/cbor2/blob/5.6.4/LICENSE.txt state that it
is subject to MIT rather than Apache-2.0 license. Also update
LIC_FILES_CHKSUM value to reference the LICENSE.txt file from the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb b/m=
eta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
index 4033b985a..f0c2964f3 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
@@ -1,8 +1,8 @@
 DESCRIPTION =3D "An implementation of RFC 7049 - Concise Binary Object Rep=
resentation (CBOR)."
 DEPENDS +=3D"python3-setuptools-scm-native"
=20
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4=
e17d99a7cacdbeed46a0096b10"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da79e64179819c7ce293372c059f=
1dbd8"
=20
 SRC_URI[sha256sum] =3D "1c533c50dde86bef1c6950602054a0ffa3c376e8b0e20c7b8f=
5b108793f6983e"
=20
--=20
2.39.2


