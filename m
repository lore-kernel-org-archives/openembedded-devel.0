Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2298DC3DA7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 17:37:41 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.44])
 by mx.groups.io with SMTP id smtpd.web11.129562.1723743458745053563
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 10:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=MhaOZhUr;
 spf=pass (domain: siemens.com, ip: 40.107.247.44, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfPBbB1tru+QtA4c7/V8nJStjlj+5iG5T4vdnqeJnoRwdbn5cW+XAgeNSzExh2LkcTUOvGqyNwL6jzG1SEGBiNSPk2K1IAbOInWLW3P8pSv2U1VLwDgfY9+gqX7qTWlOXZLzhF393pk3si7JeVRqSSebXW9k/9ZvuJAr62Tdo7Fm4D2K30pSnmH77Bkhp08YM1/ac6bzaslJQQq5a8EV+SV9NkM83DvZRJtyQ3PiBSdrjRbn5znNipqKlEYOmthb1l3TZW1fx6oznerYmIRYqnjV26VyfN0s26/uM82W6FgcTbXS0k3c0k0cLeq/2mDYEejTirBkOpU2tt/ULGK4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pr6hkBmhxLRVkDOtg60rx4Xi1n0iFzMxEe05MfgYCak=;
 b=V6p0YglL5VRJeRXJd9UB209mOHRO8flQCUoYeGz+n5dUK+M1ityXFWfzCl6eK5o9Rt+JchFP/VsuBl8JcHiHVbRji93k7pXMwove9hK94ttxbmqJNz/B8fsBo/7kErEF0z3LL+Z2vwOnOn+V6fx+QL7ivks94ER1YzixTHGkMqzJjTAFkht18QILN6za3KqTUCf1D4sa7SN3Hcc5/S/koiMhUdvCyHzF87iXF3KdGjtiqs21GapvjHLuF8lp0x+G69B1PmOf7c4Q+pgOTw9l1ujRF+wMK09fmYY08cA1J2KLhN9ibEFfwMTV9Dqom7Ltgg8+Z7j3psTz2+ADrGDaTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pr6hkBmhxLRVkDOtg60rx4Xi1n0iFzMxEe05MfgYCak=;
 b=MhaOZhUr+JUwCzZTyPKFRLpqvRXBeic1E3YgXIUHI1vMWQ6LpLdvJ0/dr0parYhA92DQ7+kfdXL47BkHkEXz4qElZ9BcjIwVMqVK4yJsO98FpRu76uKUFzPgc+grPYwnzx/vzJ0nijm7s5TBAegOkZXnDAWotB216xpSZUiWuZdpH1JBvm1IpOWDR/jj1M/iW2aIWFGJ/J3naYAOnuJog+FhT49PL1NUmCL7rouadgN7HxY3Ot72WcbXB8Puw9aBSQznUUPoGyoY1fI8mOspzzq9QAXxWQwiMRJ3UzABiS468ehO7kTaMQaUQQKksfP1ggAtNSjRDwbS6iuK2YJA2Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB7030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 17:37:35 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7849.021; Thu, 15 Aug 2024
 17:37:35 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [meta-networking][scarthgap][PATCH] squid: patch CVE-2024-37894
Thread-Topic: [meta-networking][scarthgap][PATCH] squid: patch CVE-2024-37894
Thread-Index: AQHa5rHsW5XXTLnmTkCJmDTxqUC+1rIopiUQ
Date: Thu, 15 Aug 2024 17:37:35 +0000
Message-ID: 
 <AS1PR10MB569757B41BE5691319715CE0FD802@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240804210351.1650471-1-peter.marko@siemens.com>
In-Reply-To: <20240804210351.1650471-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=043ef7f5-ef53-44b2-88da-d045b62e1810;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-15T17:37:15Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB7030:EE_
x-ms-office365-filtering-correlation-id: 75582dd9-f57c-4dfe-f6f9-08dcbd50f305
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?INq5+/qSidz3cta1j03q7BWF7j0/qaDzRcZM/tsAtIntlSaWmgNpDafF4Mn3?=
 =?us-ascii?Q?qhe7MCpIarCb16k6/Vve/Zs7OQ1SzuVGBkq8R6PERQN6FjE0pQemUIwCE7LP?=
 =?us-ascii?Q?vkB8kqM2meyNoWTXRu5FkcYFZ7zutECSLw2O+6QXhxVI58SNJmhs2CWH5xAn?=
 =?us-ascii?Q?sR3df5I3oMGPbYBXxZtlcLTlJcITljpuPRQphQf/Glv/3yKIZgF2xT2/Yv9Z?=
 =?us-ascii?Q?jR+Jv2SpFQEx/GumVf+As24Wuvhz7eTlWLEsxKc8+4I5fa1E5RInXdNWIYsU?=
 =?us-ascii?Q?ZiS7zrj8LatLyd1g+nsONRcv8mStwIhkF+cQxP1JtCCTpgYTg3ZLNQjaYSWC?=
 =?us-ascii?Q?peYPdAgIQhFRAAFECeAdMoiOVeLZb82+T27Z7yN3b/YV/MA3cBhmIzluZ6aD?=
 =?us-ascii?Q?QyB8oMlD318UtFU7SsUcnQLGqmHpFw9HUOjXYPAktCycJBszVa8oWIbwvU2i?=
 =?us-ascii?Q?9ZtBsGs7II4ZaAJJtk2oqP6lxld8vMSXbn//Ka8TxZjdij4VVn8Y10aSJ0V7?=
 =?us-ascii?Q?cMghzzPEpoDhgY1VXdp7YHlO/f4E3nKSvQJBCQki6B1avDqyXRThZQtRfB+Q?=
 =?us-ascii?Q?SoQ33MM8Celcf/wzwjGdeZpAGwJhv2D+Aisu8cmvnvHLpFusWCyvn0z0M2qk?=
 =?us-ascii?Q?mBvCsgzv0EYbOomNFcbZGzU29Ln72xNDFvIOWp2+pnoMcg91Sq6YheNf16/o?=
 =?us-ascii?Q?ODthHWoSlGsCv1egvASYYMQeQDPhMmt7aVshm7tLX2pf0Qo7k5V7ui0wNH1f?=
 =?us-ascii?Q?+hgGvdgmriVzdYWrtN3NoMSThtSEI+P969Jc7InnL0DwaCLceIKrpphEVCBu?=
 =?us-ascii?Q?2ldQa67Rw6yVLhpsN7X82tnsrpQJ3mEvdcaBi2UN5254OfmwoaZDI2LpHnZE?=
 =?us-ascii?Q?C/MtHEtVUXpxjF7LRVRUYdg1geN7v///742B3+8qhX7NYZ8gO0gVJu7ekzmm?=
 =?us-ascii?Q?FKpo5leBJS11dZ+4Y20IHBLcuhRBiQz//I6U//uI0287gS9KkXNiQQ06FnX+?=
 =?us-ascii?Q?+nPc3NE9c1RYo0neNx+ypMk6y4HHyGE9JxUVglht20MTM6zcJhvxcnR43XDS?=
 =?us-ascii?Q?9GVeGKooLPognqqhC3GBPaoGYrfW8vTxepzD2gcgCe63HXlHaSQ4/qOq7EbS?=
 =?us-ascii?Q?2ACRgyaTLxLxwd7vXXXs4q9A/DWMz/0BHL6r2H/BFcV+4TS+1JdE5l7lVLWU?=
 =?us-ascii?Q?Q3dDts+93xyJWY1GJ/QOOPBwndkRaDNSrMF41wCY0Yu+3B2/6AYi79Bq/OR/?=
 =?us-ascii?Q?D3h1XXUWRK+oHY6IdKI6maYFvJIOCSQfBWRzJjKuFtrsmrVzU/YjzgyJ97EZ?=
 =?us-ascii?Q?qDxxvZFD5oPdjZYSDV+uqTsFwzuze75jkktDi2z4u5Hkn76NFyN2OF5GGP+s?=
 =?us-ascii?Q?GNq2mck=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6MNgJ5yzaXpCNmINK3bFB0+0c+JrarGof4l6LdviWEYz30GfDiXm35wVNKFQ?=
 =?us-ascii?Q?qq+2qekq5yrvRQIMNrjm3T78PRBh76sNEPw7LU6iNwiUhuLVBdNcG0FaUlNw?=
 =?us-ascii?Q?y35ThykLrUWzItitZYjg+YGqGVfh926sT9/N6V3BvNhu0c3XARBWAusmE+fP?=
 =?us-ascii?Q?okw6IpC7veCU34zcf27NQF4LipIQZpXo0ddDCBOQHD7DM8C5zQFkqv9bOJ0K?=
 =?us-ascii?Q?H4B9R+zcRLqmP74AIfeVmckBCx1roASBY+3iH4AnX2jIA/ffwxzyVStVLISc?=
 =?us-ascii?Q?bDprseZ5VMQpSL5LWsDuBHP4XYIgqrOV3dvnmgtgorYJRueIGP5czO4OkXcE?=
 =?us-ascii?Q?WEu5Xesqifj7AGLJzhzHkjb9KGcvPtGIkLOc86niqU7HwiI41G0GoW+AHRKP?=
 =?us-ascii?Q?d+EXwD0pawgYSkiuWc1aiLr1LKHY6dGtqqTHeEmWDTKkJnicWfJ1gahYhpL8?=
 =?us-ascii?Q?2muQITQatzq+0jExSzUPGo98waavU73AMictzEGVpUCG4dlZcNx+8mnrThNW?=
 =?us-ascii?Q?Rl1Q1d2r27I5gTvkZwrbPxKmWTBbpl+63NGFuFb6KCphg3OTKw6TGPBlEQ3T?=
 =?us-ascii?Q?ki9K0KGd9ZkyQd8MuEQwYvjCS75FsAM3BT+F/WlXLLyTz0gVXenzmkvIkgB4?=
 =?us-ascii?Q?cYIW7zevj8i0bS25MOVEYgfMQjHlv5W6jQAqVwM2CjHEyYDjFVBnWp5qSTgC?=
 =?us-ascii?Q?o0rf+61rzbOu0unb9kP53XvvDFD6q/Yhhj/P9GyfP97z6veNwl13WFQ2quPp?=
 =?us-ascii?Q?d+tMxJegfj8AcmtUeVqRIhWig0S1cAJwMVdf/OcT0ETWJIsOiFFe/xGhKuRC?=
 =?us-ascii?Q?P4G+2D5Wb7fUxwg1DH2QPJfQS9q92zZfj9ntcm2X/C62igNOee0+/GUnRIzk?=
 =?us-ascii?Q?0YzzxTYClxi1k02vB+8p8XLAw3BicsCcuJW62/liDqerQL9JP8QZ/FnutFCY?=
 =?us-ascii?Q?EdZt+Uf2+UFNy4UnE8Y8EMnhXwhuuvakndQXD/YsWH3kqFCSKI/ms3ilzagZ?=
 =?us-ascii?Q?/oYKIzn83sG/Ae7untIac5iqVavYnph31LYl0qX5w02F9fmFJ0Oryj/8tL+m?=
 =?us-ascii?Q?b6ZJfKdiEDGxH9+Of4pACD/lLIwkPv+Q1D9/0BB1uCaOePaleaRuyEgUK8GZ?=
 =?us-ascii?Q?Yshpj8Avs9PzyKsBmSD0u/ZM8zTt5KkytSfSCtfz5sI9SBH1z8lcrnbcHXqZ?=
 =?us-ascii?Q?wuYop4B0/jCBFMj9G/vsPMjGlWEaA9llh99bj8nIpn33/ldDWBsqvZe1K6FR?=
 =?us-ascii?Q?GisJkJ+xqxKqu1jqsVfQ+VEexPMEJgR9o2dxjbAOTGLVHXyYBso+XTOYGaPs?=
 =?us-ascii?Q?Fjs/6gGO3iV5SDl3aXSKJWj3KU5XhC1byxHOEenIxA2fzTPDIePQVkZ7WnSk?=
 =?us-ascii?Q?dyajw50ZiserW7P7hwJmf6NnCXgX0FeeoiKfNYm0C/0m9cbJTojKfRRXiJ7v?=
 =?us-ascii?Q?UBDw5mgWM4wl/p49S/Ia1LegLcjr5h8svkElR6psNRUansSzLfAxhTfI4xuU?=
 =?us-ascii?Q?84RGZA7/zYDG1qPyVpo0q0ckpCVtdSG9rSze8bXFgYEAa8Jieou9o7BdraDe?=
 =?us-ascii?Q?TJw1+WZjfiIpcnFE0B+WWQyU1vfibrbWTX/nXYyD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 75582dd9-f57c-4dfe-f6f9-08dcbd50f305
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 17:37:35.1783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aZvsffUysMlv/JMjihY7vSwuCq2GBQ9qMoeDyKf30z8oJ5Yhzoh6BLqdj+JH1C8LTe5KY6M/2QZolRNx3SjuDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 17:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111826

Gentle ping.

> -----Original Message-----
> From: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Sunday, August 4, 2024 23:04
> To: openembedded-devel@lists.openembedded.org
> Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [meta-networking][scarthgap][PATCH] squid: patch CVE-2024-37894
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Reference: https://github.com/squid-cache/squid/security/advisories/GHSA-
> wgvf-q977-9xjg
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../squid/files/CVE-2024-37894.patch          | 36 +++++++++++++++++++
>  .../recipes-daemons/squid/squid_6.9.bb        |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2024-
> 37894.patch
>=20
> diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2024-
> 37894.patch b/meta-networking/recipes-daemons/squid/files/CVE-2024-
> 37894.patch
> new file mode 100644
> index 0000000000..ba12b71d6f
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/squid/files/CVE-2024-37894.patch
> @@ -0,0 +1,36 @@
> +From 920563e7a080155fae3ced73d6198781e8b0ff04 Mon Sep 17 00:00:00
> 2001
> +From: Francesco Chemolli <5175948+kinkie@users.noreply.github.com>
> +Date: Sun, 2 Jun 2024 14:41:16 +0000
> +Subject: [PATCH] Bug 5378: type mismatch in libTrie (#1830)
> +
> +TrieNode::add() incorrectly computed an offset of an internal data
> +structure, resulting in out-of-bounds memory accesses that could cause
> +corruption or crashes.
> +
> +This bug was discovered and detailed by Joshua Rogers at
> +https://megamansec.github.io/Squid-Security-Audit/esi-underflow.html
> +where it was filed as "Buffer Underflow in ESI".
> +
> +CVE: CVE-2024-37894
> +Upstream-Status: Backport [https://github.com/squid-
> cache/squid/commit/920563e7a080155fae3ced73d6198781e8b0ff04]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + lib/libTrie/TrieNode.cc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/libTrie/TrieNode.cc b/lib/libTrie/TrieNode.cc
> +index 0f991a06d..d417e0f54 100644
> +--- a/lib/libTrie/TrieNode.cc
> ++++ b/lib/libTrie/TrieNode.cc
> +@@ -32,7 +32,7 @@ TrieNode::add(char const *aString, size_t theLength, v=
oid
> *privatedata, TrieChar
> +     /* We trust that privatedata and existent keys have already been ch=
ecked */
> +
> +     if (theLength) {
> +-        int index =3D transform ? (*transform)(*aString): *aString;
> ++        const unsigned char index =3D transform ? (*transform)(*aString=
): *aString;
> +
> +         if (!internal[index])
> +             internal[index] =3D new TrieNode;
> +--
> +2.30.2
> +
> diff --git a/meta-networking/recipes-daemons/squid/squid_6.9.bb b/meta-
> networking/recipes-daemons/squid/squid_6.9.bb
> index 33d286e122..61fc6027b3 100644
> --- a/meta-networking/recipes-daemons/squid/squid_6.9.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_6.9.bb
> @@ -20,6 +20,7 @@ SRC_URI =3D "http://www.squid-
> cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
>             file://volatiles.03_squid \
>             file://0002-squid-make-squid-conf-tests-run-on-target-device.=
patch \
>             file://squid.nm \
> +           file://CVE-2024-37894.patch \
>             "
>=20
>  SRC_URI[sha256sum] =3D
> "1ad72d46e1cb556e9561214f0fb181adb87c7c47927ef69bc8acd68a03f61882"
> --
> 2.30.2


