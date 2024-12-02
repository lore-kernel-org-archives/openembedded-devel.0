Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5092CD78323
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 13:48:59 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.79])
 by mx.groups.io with SMTP id smtpd.web11.174134.1733147331784759858
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 05:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=srrHXqZQ;
 spf=pass (domain: siemens.com, ip: 40.107.103.79, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHiRde1W3157i8TD+XSPa41DlAqlZN99m0DZidQkvzPsHI0WYp8WWgKYQhrPdfDqeIL3fpW38uUWTuTDLTzSryVqNGA3hwt7rdQQ2hhWDE1VEES+R07AbmtN/amJC3Wf6xZrX88JIUvDm+o2g2Y69Iby5iIbUjcKDxYdFyVgh0YH3EnzEoZIkqQQ4/38XPPioJQ4Le3bj1ko6f/2b9acj6maREvHPSbjC236qvR/jT0OlBN7DkfZyqpqdjN3O7oK/6W4a8hRUXezpf+f+aTjNSMoSzj+tE5/TdRmezt2I/2GeltiE6Ivk+WCUCWTkj49dQBXAHmfGn3UPxaMg1G+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNO+q+5/GQeE7v4ZEHReHUE7uSZd0vUcJQVEfx984sY=;
 b=UAZtiIvln4Ijwqd2M8O3hqRn5BVNQwaAmjTdelmobyH8kvh/cguc9vb2S/rtfBxAH9ALlLimQtSjvau1Ww79ZsuxP3s6rY4KSvwEvl41GJFgxJ5jy/gdtzMvVodCT8gcAWe03o3fmXSD67YryphhZ/rEzHyhCCnKS9tgsBk3/8K25mQyqLvqCVRRxcTbwCnLn02U84KULKKv3clPI7NFpd1GQ5TDrKQCTdaHRKJBZAIuHqMx3oTTpZXQy+kWRCoVstnvT+GS/rga6krozwrRRjRAH0Z9rTKJh8nEYcrepaBrgRBHl1uaEpbz3kOWQeizaRlPdYAfaUUiG65lgzoq5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNO+q+5/GQeE7v4ZEHReHUE7uSZd0vUcJQVEfx984sY=;
 b=srrHXqZQXwFE67skXQRsMtc0Z+DvUiGZ0M3DGgctjLYXGeQxzzeAC9K/Bqz2oBbfH/At/H2YeTAJbSTJpwKbUXnNLBsT6HOGVrBXQc6YDnQpj0NFGybX+H5NGbFKFgJZmhwBkEyCdVaC54P9hrN0UVMOfh4QF/6QZaCLUxdhw/ypUNxiloNMb+iXcyFJS20VibO0ri4vNVrU6ufCV2Xdhoh9HesCFm4/Cr7pcasQSu8wzDwLkaHZunDKv2rISIeWHRm6X3FnuC+6eifIoVKg3NBKfaWnn0ILbCTpEUGXptBWJ0UDGA8INRPARRI4yc6ybq9RekBr5Yt8urvA4nSdDw==
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::11)
 by GV1PR10MB6370.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.7; Mon, 2 Dec
 2024 13:48:44 +0000
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d]) by PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d%3]) with mapi id 15.20.8182.018; Mon, 2 Dec 2024
 13:48:44 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Christian Eggers <ceggers@arri.de>, "peter.kjellerstedt@axis.com"
	<peter.kjellerstedt@axis.com>, Yi Zhao <yi.zhao@windriver.com>, Yi Zhao
	<yi.zhao@eng.windriver.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Qi.Chen@windriver.com"
	<Qi.Chen@windriver.com>
Subject: RE: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Thread-Topic: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Thread-Index: 
 AQHbDMIt3bntBRVM80a3hbvtyvq5VrJlvNcAgAILqACAChDZAIAACeFQgGD7WmKAAIcJgIAAASPA
Date: Mon, 2 Dec 2024 13:48:43 +0000
Message-ID: 
 <PA4PR10MB5707F3BA475C5BF809C08D34FD352@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
 <180D44A5BB7DBFF8.7301@lists.openembedded.org>
 <abaf94d8-0f87-4011-81fa-e2aa688e011d@windriver.com>
 <2746495.vuYhMxLoTh@n9w6sw14>
In-Reply-To: <2746495.vuYhMxLoTh@n9w6sw14>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=5c94875b-ea4b-4dfa-96ca-77d9d838f8a1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-02T13:43:13Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB5707:EE_|GV1PR10MB6370:EE_
x-ms-office365-filtering-correlation-id: b24b3cab-93da-4472-1354-08dd12d8099c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Fxi7mM3xUnEvcy3E+Y362Ym/iU0bwkYZcvdJ9wPgiUWOvPWERb1Ab4As3Fi2?=
 =?us-ascii?Q?7iDu6DQ+Q1jl/P0SITGUkDpKiUEyqmLQ6WiK9FLWuNlXg9mm4CC57HsA54p4?=
 =?us-ascii?Q?UNrZY/CuQQV6NBBuPt/1lpqjIVZ/FsOko+ud8/Ex0szpDfC8MOZrVgxfZ3hs?=
 =?us-ascii?Q?Iw10jQSiQs0R2PLfMvKoucQM0bTJtF72kGEsO+GPycgEIwe86cZh6wlODP8P?=
 =?us-ascii?Q?vDPt/lt38VDIO37l9PDKYsCWFlALI27PxO57Hpvoo4mNPyMKCb9Pw18EVyU0?=
 =?us-ascii?Q?IPZEOvxwLc4EcFBi5ahPuzGQGtRb5JccAJ8dWqvq/2HR+w8tMHaNZHvw81G9?=
 =?us-ascii?Q?ZbJUEQ5abf2lldIFkRYmVkVVw1Mys9TTBD9GCZ4merZqT3Ay2/gweDU2R5KX?=
 =?us-ascii?Q?1lLB2CElPLHSZbrDbY++g9faJ3S0mEBivFuqH+J+9i5gmgKfkl28Ql9/H+QJ?=
 =?us-ascii?Q?hFKqJ0S3oWwOUVV8R7nVZOcDn/GbgY8upgv9dffcWqQEE6JICJDLBjnVzytm?=
 =?us-ascii?Q?cwGxgg3t39DPe0k0zpRlgdi8+XZzaqztfMaXD/yrGs+axYfyMeg2BG9N0Bln?=
 =?us-ascii?Q?2pPsLldeQW/YzCzb6Pp57GRNB4I7Ciee0rpSLNZzvwytV0jVTZfvA902dWW1?=
 =?us-ascii?Q?fcdI5MdKZc9qCPrcTH8/YQLspGNdTiroJnt8nxpMGDExj98qIX8AJFz1TmSg?=
 =?us-ascii?Q?bmUw2IP0MmsyVdDp1EYoU+Y/v+bsM8kd0t7lYAZoNpic5Flvq44Gx7zLaXBC?=
 =?us-ascii?Q?LSFimr1j3loFY1creUqT9txjc3o0xMqe9cuhJh1okVhxxntEjfGlpcfxrV/z?=
 =?us-ascii?Q?Kqu5MqMQ57M56YFGQdW7rHlASGmg9VBkAXKbFo8NYNmSX437auzHmralQRZN?=
 =?us-ascii?Q?lQsfsP5AAXs8ZUHenm5BWrXszm7s8CtPm8vkZCktGttS5b80zc8heAT/kCuO?=
 =?us-ascii?Q?EsjZLckh2Kge7dqhOdTFngw0QBEYEPsH72QAEhfCGfzwdA24gJMQlDHqZek+?=
 =?us-ascii?Q?2yjMHmd3zyG4qfMgrR8WwzHPZHicfB0KrQ3YE2Sz1so9bTsWZw0E6Ykz5K8y?=
 =?us-ascii?Q?Matdzk6b3naTOGxO6kv5eY5vSmExe6F+6QPSdZ+v0+anXww9ZWNGYkUOfgbX?=
 =?us-ascii?Q?ndc/MczrRhX2Wq+bRtjO3Awe+acsfhoswIpiVctgEyiIQRxm5h+K8NuknshD?=
 =?us-ascii?Q?EiyYzVPPhZwBRM8fCbfNcuDxQL5+5p9r4aWNKknT27bHFg5/bfWrRhBpj4E9?=
 =?us-ascii?Q?HoGLljWVWBi5TQBA1+RYode3dIkdJECYkZPzZOxDgq4Y5tazmfcsQb1ErFrZ?=
 =?us-ascii?Q?G1kOxoY3OSplu3HCVeIEYz4AivuZvP/pJCusO4dyECVFcz1oHHpJtdw2S+bA?=
 =?us-ascii?Q?NCCqKGg=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?fbU+nJB923bC1/H5ww4hw+Q1P1dN2Sr9L21sztYQuLWeGUcRN2g61Ee1beJP?=
 =?us-ascii?Q?OP//NlmF3k5pL75EV6+h6iYOa2P/niCJoUXGyYg7qxHQJ192KKBDTmp6kreP?=
 =?us-ascii?Q?4aH8iwlOgV371ZWoH9TQsOdxi4LGpBwLMl2a8A3iZPps9Hqnjypi8L+WJmNP?=
 =?us-ascii?Q?BGWm141G27CBY8E8OQ/2lbxAHKQMr5MLuqGRWZCM02KiStVKU7fDDKewP084?=
 =?us-ascii?Q?0Yg5R5EfO9yX3gBh7u8996MVR9NiMKJm09/XIgvO38UEZTSUkxvcV9u+oSRw?=
 =?us-ascii?Q?CGoQTDP7OqFT4NTg0WwZEdRfRfClhCuetOOe3f6d7rWRfZ7qbBgX1hoB2grU?=
 =?us-ascii?Q?ia4hX/dMx9wvoFgSvXM0oFn5ykqZhhugGrJ8FLro01GWsboXDySwBPw557St?=
 =?us-ascii?Q?dpohvoQ9BDM/xs4tg+/Ykww7x2DnfyyCtC1+8OJz/75iXfJzp5s8vKyzTCfr?=
 =?us-ascii?Q?RQwvTFrBEBL5QZ1rzo4MukJS+2WuN8x09QROqiDCXBwYuNIKc/lSKldn16gI?=
 =?us-ascii?Q?erUCc243MH164cuaj31ntQ8ezsW+teq9f8eq1mP08U7qg17TGNx16jq41nIW?=
 =?us-ascii?Q?qyf0LiWekOVA63km8d7P/hpxaHLns8zGVggGdbGAr/RNHeHQloKq9UXBUIzQ?=
 =?us-ascii?Q?Cl/BrScGnJVx7oPYKxAVCMg1gsbR1TcCOpJDh3a17fbB4Ykg8HSy+ClhPUMC?=
 =?us-ascii?Q?sDk4CWwjnGw7+1iSmR/QTNVmZKgISLlyAFm56NGdnuic2l6SPuCNhx0Nqid+?=
 =?us-ascii?Q?oIblILct+obWWRiLLE9C/Ga0VJfMfQRA7dxB5tbAZ01pQUTfBvsv+FG5Vg+h?=
 =?us-ascii?Q?ETlnhowgMcCXNeEE9DUwEBM0Yoo3zL01P3viFArb+Z6I7P3IIbSjKXd0Psjk?=
 =?us-ascii?Q?2NQbCOFro9UUH/SaZ4IHbP6TIML/hxgxkngvBk9QroQnk8MZTuvvuSQPeJyP?=
 =?us-ascii?Q?bMYY7Q1FvIaj6sEUKirA72VF/xyIsjiGfpz7URAwX/YFNo30PuGbXrq/tJ8O?=
 =?us-ascii?Q?El2ukluvTvsYLZN6+9hbgLFubVOJHg5+YjbIrciAtQoR+bBRNxdjRmit940y?=
 =?us-ascii?Q?tk6aspL0zFN3Bnv7m1xF8vEHZT23mzrOEPJUbBwejybB+lm1QDfjqszdVL/o?=
 =?us-ascii?Q?eaE9W03rQ8Vo2h68oKUycRqdETbciHrzKEwBmN4iS8N4JdYg/MNMLzSTZdcH?=
 =?us-ascii?Q?JE6i6RczciQrPiTlMppTeH/XFap+4qUEaHPXKJfjqq7D07MDEEAiakweZw0W?=
 =?us-ascii?Q?8+Mg61Pr9PLhDXrnmuI1cddyAEmHuA0s8DHLOqR7nf/uckbqtwpzLMB5xK2x?=
 =?us-ascii?Q?MYjdLKmVHSOcmPNiDOiif338usuHXp4Y0DjLwviZKI1SbNAghaMX3gnT233a?=
 =?us-ascii?Q?ATBExJ/bTVu+KaRQKsEJrq7c+3eB76iEGwc42FOoUYvzG6HvjCCfybVJ06DM?=
 =?us-ascii?Q?HkAfMB1Dlj4aZ62rd5xUv7XDqEri86OMvfDSf2KkYVale6nBDPBCnsIaUJvS?=
 =?us-ascii?Q?Cm15UmMjLtIqRLHrTskCtnGp0uDCdCk/THTZH3M8t1fYirpZ+JZ3KUKNj7a1?=
 =?us-ascii?Q?V19AB8BI/pDE8jVmjvuqwZ3+pDuAuZruqyYcmTj9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b24b3cab-93da-4472-1354-08dd12d8099c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 13:48:43.9896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2SIkeZA2OJS/fCPPeKNek8sl3Vixv8Ku71+yiZr05pu5AdwqM2OHtv8WDbdBfApeR1iT/odHenv9SGYgxN3cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6370
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 13:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114140

Hello,

> -----Original Message-----
> From: Christian Eggers <ceggers@arri.de>
> Sent: Monday, December 2, 2024 14:39
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> peter.kjellerstedt@axis.com; Yi Zhao <yi.zhao@windriver.com>; Yi Zhao
> <yi.zhao@eng.windriver.com>; openembedded-
> devel@lists.openembedded.org
> Cc: openembedded-devel@lists.openembedded.org; Qi.Chen@windriver.com
> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
> RDEPENDS
>=20
> Hi Qi,
>=20
> On Monday, 2 December 2024, 06:35:22 CET, Chen Qi via
> lists.openembedded.org wrote:
> > Before we rework the abseil-cpp and protobuf recipes, a possible
> > improvement for this patch is that we list the needed libraries in
> > RDEPENDS manually.
>=20
> my main concern was (as you already may have guessed) not having the full
> set of
> absl libraries in my rootfs, as only some of them are required.  But I ca=
nnot tell
> which is the best option to achieve this.

If you want full abseil-cpp in your rootfs, please use IMAGE_INSTALL for th=
at.
Packages should pull only their real dependencies, not something you need f=
or other reasons.
You use-case seems to be to develop application with abseil-cpp library but=
 not installing it explicitly.
SDK images need to install (or depend on) additional packages compared to r=
elease images.

Peter

>=20
> regards,
> Christian
>=20
> >
> > Regards,
> > Qi
> >
> > On 12/2/24 13:21, Chen Qi via lists.openembedded.org wrote:
> > > I'll explain in more details what the problem is and why this patch i=
s
> > > correct, given the current status of abseil-cpp recipe.
> > >
> > > In protobuf's abseil-cpp.cmake file, there's a hardcoded list of absl
> > > targets used by protobuf:
> > > https://github.com/protocolbuffers/protobuf/blob/main/cmake/abseil-
> cpp.cmake#L56
> > >
> > >
> > > This value in turn is parsed and used to replace the
> > > @_protobuf_PC_REQUIRES@ in protobuf.pc.cmake.
> > >
> > > Here's the generated probobuf.pc file's contents:
> > > """
> > > $ cat  ../build/protobuf.pc
> > > prefix=3D/usr
> > > exec_prefix=3D/usr
> > > libdir=3D/usr/lib64
> > > includedir=3D/usr/include
> > >
> > > Name: Protocol Buffers
> > > Description: Google's Data Interchange Format
> > > Version: 25.3.0
> > > Requires: absl_absl_check absl_absl_log absl_algorithm absl_base
> > > absl_bind_front absl_bits absl_btree absl_cleanup absl_cord
> > > absl_core_headers absl_debugging absl_die_if_null
> > > absl_dynamic_annotations absl_flags absl_flat_hash_map
> > > absl_flat_hash_set absl_function_ref absl_hash absl_layout
> > > absl_log_initialize absl_log_severity absl_memory absl_node_hash_map
> > > absl_node_hash_set absl_optional absl_span absl_status absl_statusor
> > > absl_strings absl_synchronization absl_time absl_type_traits
> > > absl_utility absl_variant utf8_range
> > > Libs: -L${libdir} -lprotobuf
> > > Cflags: -I${includedir} -DPROTOBUF_USE_DLLS
> > > Conflicts: protobuf-lite
> > > """
> > >
> > > Let me use "absl_hash" and "absl_absl_log" in the above list as examp=
les.
> > >
> > > """
> > > $ find ../../../abseil-cpp/20240116.2/packa
> > > ges-split/ -name "libabsl_hash.so.*"
> > > ../../../abseil-cpp/20240116.2/packages-split/libabsl-
> hash/usr/lib64/libabsl_hash.so.2401.0.0
> > >
> > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> dbg/usr/lib64/.debug/libabsl_hash.so.2401.0.0
> > >
> > > $ find ../../../abseil-cpp/20240116.2/packa
> > > ges-split/ -name "libabsl_absl_log.so.*"
> > > $
> > > """
> > >
> > > See? The current package splitting of abseil-cpp does not match what
> > > protobuf assumes. And I thinks protobuf's assumption is correct,
> > > because there's really a absl_absl_log.pc file generated by abseil-cp=
p.
> > >
> > > And there's the contents and location of absl_absl_log.pc:
> > > """
> > > $ cat
> > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> dev/usr/lib64/pkgconfig/absl_absl_log.pc
> > > prefix=3D/usr
> > > exec_prefix=3D${prefix}
> > > libdir=3D/usr/lib64
> > > includedir=3D/usr/include
> > >
> > > Name: absl_absl_log
> > > Description: Abseil absl_log library
> > > URL: https://abseil.io/
> > > Version: 20240116
> > > Requires: absl_log_internal_log_impl =3D 20240116
> > > Libs: -L${libdir}
> > > Cflags: -I${includedir} -DNOMINMAX
> > > """
> > >
> > > And there's the contents for the absl_log_internal_log_impl:
> > > """
> > > $ cat ../../../abseil-cpp/20240116.2/packag
> > > es-split/abseil-cpp-dev/usr/lib64/pkgconfig/absl_log_internal_log_imp=
l.pc
> > > prefix=3D/usr
> > > exec_prefix=3D${prefix}
> > > libdir=3D/usr/lib64
> > > includedir=3D/usr/include
> > >
> > > Name: absl_log_internal_log_impl
> > > Description: Abseil log_internal_log_impl library
> > > URL: https://abseil.io/
> > > Version: 20240116
> > > Requires: absl_log_internal_conditions =3D 20240116,
> > > absl_log_internal_message =3D 20240116, absl_log_internal_strip =3D
> > > 20240116, absl_absl_vlog_is_on =3D 20240116
> > > Libs: -L${libdir}
> > > Cflags: -I${includedir} -DNOMINMAX
> > > """
> > >
> > > We can then find the absl_log_internal_conditions library:
> > > """
> > > $ find ../../../abseil-cpp/20240116.2/packages-split/ -name
> > > "*absl_log_internal_message*"
> > > ../../../abseil-cpp/20240116.2/packages-split/libabsl-log-internal-
> message/usr/lib64/libabsl_log_internal_message.so.2401.0.0
> > >
> > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> dev/usr/lib64/libabsl_log_internal_message.so
> > >
> > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> dev/usr/lib64/pkgconfig/absl_log_internal_message.pc
> > >
> > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> dbg/usr/lib64/.debug/libabsl_log_internal_message.so.2401.0.0
> > >
> > > """
> > >
> > > What does all above mean? It means that abseil-cpp is not splitted
> > > reasonably. This could be proven by the absl_absl_log.pc file as
> > > described above.
> > >
> > > So, given the current situation of abseil-cpp, Yi's solution is
> > > correct. Before abseil-cpp is re-splitted according to its pc files,
> > > which then could possibly lead to automatic parsing of the protobuf.p=
c
> > > file to add extra RDEPENDS automatically in protobuf recipe, we need
> > > to have Yi's solution. And we need to use RDEEPNDS instead of
> > > RRECOMMENDS (see the 'Requires' directive in corresponding .pc files)=
.
> > >
> > > Regards,
> > > Qi
> > >
> > > On 10/1/24 20:42, Peter Marko via lists.openembedded.org wrote:
> > >>> -----Original Message-----
> > >>> From: openembedded-devel@lists.openembedded.org
> <openembedded-
> > >>> devel@lists.openembedded.org> On Behalf Of Peter Kjellerstedt via
> > >>> lists.openembedded.org
> > >>> Sent: Tuesday, October 1, 2024 14:00
> > >>> To: Yi Zhao <yi.zhao@windriver.com>; Yi Zhao
> > >>> <yi.zhao@eng.windriver.com>
> > >>> Cc: openembedded-devel@lists.openembedded.org
> > >>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
> > >>> RDEPENDS
> > >>>
> > >>>> -----Original Message-----
> > >>>> From: Yi Zhao <yi.zhao@windriver.com>
> > >>>> Sent: den 25 september 2024 04:17
> > >>>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Yi Zhao
> > >>> <yi.zhao@eng.windriver.com>
> > >>>> Cc: openembedded-devel@lists.openembedded.org
> > >>>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
> > >>> RDEPENDS
> > >>>>
> > >>>> On 9/24/24 03:02, Peter Kjellerstedt wrote:
> > >>>>>> -----Original Message-----
> > >>>>>> From: openembedded-devel@lists.openembedded.org
> <openembedded-
> > >>> devel@lists.openembedded.org> On Behalf Of Yi Zhao
> > >>>>>> Sent: den 22 september 2024 09:36
> > >>>>>> To: openembedded-devel@lists.openembedded.org
> > >>>>>> Subject: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
> > >>> RDEPENDS
> > >>>>>> Since commit[1], the libraries of abseil-cpp have been splitted =
into
> > >>>>>> separate packages. When protobuf is installed into the image,
> > >>>>>> only 48
> > >>>>>> abseil libraries are installed as runtime dependencies. But the
> > >>>>>> output
> > >>>>>> of 'pkg-config --libs protobuf' lists 66 abseil-cpp libraries ar=
e
> > >>>>>> required. Add abseil-cpp to RDEPENDS to ensure that all required
> > >>>>>> abseil-cpp libraries are installed.
> > >>>>>>
> > >>>>>> [1] https://git.openembedded.org/meta-
> > >>>
> openembedded/commit/?id=3Ddd6421e65eb75c35a904f4b487ba022075035
> > >>> ecc
> > >>>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > >>>>>> ---
> > >>>>>>    meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb | 2 ++
> > >>>>>>    1 file changed, 2 insertions(+)
> > >>>>>>
> > >>>>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.b=
b
> > >>> b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > >>>>>> index cc5204de4..354b3213a 100644
> > >>>>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > >>>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > >>>>>> @@ -106,6 +106,8 @@ FILES:${PN}-lite =3D "${libdir}/libprotobuf-
> > >>> lite${SOLIBS}"
> > >>>>>>    # CMake requires protoc binary to exist in sysroot, even if i=
t
> > >>>>>> has wrong
> > >>> architecture.
> > >>>>>>    SYSROOT_DIRS +=3D "${bindir}"
> > >>>>>>
> > >>>>>> +RDEPENDS:${PN} =3D "abseil-cpp"
> > >>>>>> +RDEPENDS:${PN}-lite =3D "abseil-cpp"
> > >>>>> This defeats the whole purpose of splitting up the abseil
> > >>>>> libraries. What triggered this change? Was it an actual
> > >>>>> runtime error, or were you only looking at the output
> > >>>>> from pkg-config --libs protobuf?
> > >>>>>
> > >>>>> Since the .pc files are in the protobuf-dev package, which
> > >>>>> depends on the abseil-cpp-dev package, all abseil libraries
> > >>>>> should be available if you are actually building on target
> > >>>>> or with an SDK.
> > >>>> Our customer reported this issue. Here is his description:
> > >>>> The abseil libraries will be included in the SDK, but not on the
> > >>>> target.
> > >>>> The application is building with SDK. The yocto build is adding
> > >>>> protobuf
> > >>>> to the image (no explicit abseil libraries are added). If an
> > >>>> application
> > >>>> then are built using the SDK it can not be executed on target as
> > >>>> libraries are missing.
> > >>> Can we at least change the dependency to a recommendation so
> > >>> that it can be avoided via BAD_RECOMMENDATIONS? Because as it
> > >>> is, it penalizes everyone that use protobuf for the case where
> > >>> one provides an SDK with protobuf.
> > >>>
> > >>> My suggestion would be to change it to:
> > >>>
> > >>> # Recommend abseil-cpp so that all its libraries are installed in c=
ase
> > >>> # protobuf is provided as part of an SDK. Everyone else should add
> > >>> # BAD_RECOMMENDATIONS +=3D "abseil-cpp" to their configuration.
> > >>> RRECOMMENDS:${PN} =3D "abseil-cpp"
> > >>> RRECOMMENDS:${PN}-lite =3D "abseil-cpp"
> > >>>
> > >> I think that's also not the right way to do this.
> > >> Adding unnecessary stuff to release images to satisfy SDK needs is
> > >> wrong.
> > >>
> > >> I also wonder if the problem is not at the SDK level.
> > >> If you build an sdk, there is explicitly installed package base and
> > >> additional required dependencies of those packages.
> > >> The dependencies may not be complete and fully usable, only their
> > >> parts sufficient for the explicitly installed stuff is present.
> > >> Are the sdk users assuming that full abseil-cpp is installed and thu=
s
> > >> using also parts not needed for protobuf?
> > >> The proper solution would be probably to include abseil-cpp
> > >> explicitly in SDK used in that way.
> > >>
> > >> Peter
> > >>
> > >>>> //Yi
> > >>>>
> > >>>>>>    RDEPENDS:${PN}-compiler =3D "${PN}"
> > >>>>>>    RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
> > >>>>>>    RDEPENDS:${PN}-ptest =3D "bash
> > >>> ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf',
> > >>> '', d)}"
> > >>>>> //Peter
> > >>> //Peter
> > >>
> > >>
> > >>
> > >
> > >
> > >
> > >
> >
> >
>=20
>=20
>=20


