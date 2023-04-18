Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F25C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 19:22:35 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.19003.1681845747941596477
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Apr 2023 12:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=dI3jHbDE;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1681845748;
  x=1713381748;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lGrXMF1DayaDVj5RUGHPscFrFgNJ6yFKtCGgtuqT/+Y=;
  b=dI3jHbDEkhuhDsb8/dFCNr4+qDV42Q5L5GV5tvRSOJSyiRNBQIvH2BV9
   z/R5/k0hzPNhWL4ZI1oxejCQbnUD0P7kDP6iIjwmwWNa4VN/dbHLxXXTr
   bhTzRtUco8j4lIesA8DO1cgXFP3FHPfGLlJ8lyFrn3pk4CpEfG9nY3jog
   sWcuw86T/qaVA2P4flOEdxzKJLD6IW6uQoTF0a0VC4Dy9DiyVkJHEbWjz
   25TYMol/BGCewbiMaUuyv+nQzz+lqHXaxG+Dg1lXI0OE2k1snps3PFyAf
   iyhGN33UwwCSpaqxTyabx4wZnaZOXSncvYsYtu7Th6Jg2RIwQdbIiR8hQ
   g==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XClQYGrZdqUGVHNpbV8LD1YvWxucYAanG38Ltbk4ilYDT27ycKO1f37Q6BE2N8DGrZvVUUhEo+5ZgweZL+clm6FAmazsJM/SsfRll/TjhY/1nVbUPcCyryMaeNPFRe81KzExRVtsrXPpQ32E1P+mwJ1u6ye9cQx4MKjBH0YNcuCq09doFD3Niu0Q5ipK2jF/QaS6T4uc+Vba5XP0ENFiZOrBsz0pvO+6s47Q5h6Xv5JF+rSI8NChBTOpXsSiPvnOhP0nFZ1qifQvR+P4why3e/GIyAZe41eFIZLp2YcVyh1y3v6Ff7VgXtBz6t/PrOxVglKoejeK1vYvJ/iXDr6sqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGrXMF1DayaDVj5RUGHPscFrFgNJ6yFKtCGgtuqT/+Y=;
 b=LQIgvtpiX+gLqRJuSEA+z03PJfxXKEr8NDhFcAaDBhJ2Cw7FR43fiH7LWHdnq8di8jgunwyW6NUfyvW03mL1sGeiC9dKIEqOm5joHPl1FKmNBp57k71B1dQ8RHVBRkG75sJpKaqizD8vmM0yC7o4CiPdsPnmAdJ6wszaOxECcPHvVIQohhaQO0p7Zi82vfBZzzsgqJK7oKyC0Ba8oWybEHwZhqFvTTQzvgvbJYgW1Ysvc+/L+tx5L1OFnB0YQFLJrlmXj/QJXoOSXlXkeV3Lb1u0xRxspdfvuEOOiYbQ4k/r8scP/3rUZ5VBn1B8xRZHPV2IVSqZAODGrdcuIDJxHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGrXMF1DayaDVj5RUGHPscFrFgNJ6yFKtCGgtuqT/+Y=;
 b=rj+xeOuvxgZstMcx3fvjXbnLUD82jANE4R9Nup4IHOsBC53qUxesocOYSHsgeyXjssL5GUhpJ36PoMAk/b8ozn1l8TqgH/tEZqv/np3D7QxwScHVPKOClF3rHVbMQvX9MlLn5wisWdWBH8/6rLZVq2oRZHYy0OpilSyYAXBHnpQ=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>
CC: Linus Jacobson <Linus.Jacobson@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] khronos-cts: Replace wayland feature
 dependancy with vulkan
Thread-Topic: [oe] [meta-oe][PATCH] khronos-cts: Replace wayland feature
 dependancy with vulkan
Thread-Index: AQHZbptYWOEJ9I/J40OW8VwNcKKdB68xeENA
Date: Tue, 18 Apr 2023 19:22:24 +0000
Message-ID: <DB5PR02MB102130909233BFF3E6FB1CA5BEF9D9@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230414063533.11913-1-linusja@axis.com>
In-Reply-To: <20230414063533.11913-1-linusja@axis.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAWPR02MB9782:EE_
x-ms-office365-filtering-correlation-id: f466da1f-f38d-4972-1e0e-08db40423d48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DluDzIaqsoEREoGrCsFGJg4Nta5L4WlT9RRJ1E25nrgZlvxY/2VXM/fyXYSV/jidNjvhLH1N6TBNJFMmkHLpgFHHeIETlKvqe40tYiU/aKKydPyGhxoIJ/ReoNovPouWppIoEqkbeVz5aEwGOVHb/QktOOk1Rps/tUHsFJtBn+YRY1ismUdQXX9GzAYquJ93ixVvgv/Q750PdDni4Xm1eYgPOw7Jtp1sht2/iSbODp5JvYlj054NSxjUNKZJu/JA8FqYIW2nu2d1gEABdokkwYfKMzNjliRzH7Uek5w/p0RocQIEIIUaCOVDRbR68JWJJXJvp89gjXUx+VI8NePaQMGfRZ1ALKEIyal3JxfvAxTAHc4oaNRXR+piGDcaalyilL5pM7FlKalmJkW34seu/CGtib3aYpF6yNXG07kS29Tw9rb3dsku0m2HlXM8MCw8xwoEYgavi3cvm1jzHTPxJJlgb52Rhtc4eLpiktOzO78zxBEfOOA2AvBJ33iWDnIMCttIDY8KcAuDnpWFa6t02p07WlcNMAV+C2pNRodb5Xi6sFGhlmlmjhVM5h6zH6LmR+rc22pcCPyry1tbwAgA2lWHm4zWtkv/HUJJ6psWqBUzrE9IK8wl4wiuKNkvfeR7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(9686003)(6506007)(86362001)(64756008)(83380400001)(53546011)(38070700005)(26005)(33656002)(186003)(2906002)(44832011)(5660300002)(7696005)(52536014)(38100700002)(71200400001)(8676002)(8936002)(66476007)(478600001)(54906003)(122000001)(41300700001)(316002)(66446008)(66556008)(66946007)(76116006)(6916009)(4326008)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FMsD0hh3660zZ/P/3dmKZLKMW5iYN4vFOuN1trmwq4Za2nsiKPD+vcoMHSB7?=
 =?us-ascii?Q?nP8VnNYlKPdni5CLfH4YBs3A+SSyI5zy5mkS/2FINCM4SJ/pQE3BUwaG0EZG?=
 =?us-ascii?Q?cE0OliaY9QGsVsLjL/0//PkVzPw9PSrqeKhLyTmVeH6Jv3Zn9blmpb+Tvw77?=
 =?us-ascii?Q?oIf1UtEdvXsF68MkR+d0PQH8sq76lKGnmZXg58WNclAC3x7NyJ3Bp3c8363H?=
 =?us-ascii?Q?eJew4+JAd2aWGjbecfIg/3cZdeAbJOR8dn5BmYuatBmmY2L7RnwhVhWoHKr0?=
 =?us-ascii?Q?BC8c1pgoIE5D/qQLTYuSJl5Il+psZJzZgOdIBKznG24rE2oQkpVMj8dNw3+C?=
 =?us-ascii?Q?BXDcPo/0MFYNH6t1fUwKS/cNslOtDDj4Uc4+g80PceIOEBvl8pUQvK8P1X+x?=
 =?us-ascii?Q?j3CcIi6skjrTXyjjGRQGsfLuF3T4uVF8hx6mhCCJ7nkEcF/aFE1De4BVk/Dz?=
 =?us-ascii?Q?GZ6VmPaMILe5gMNTmfpzDsvJs9NNtkcQLTxd+AlSjGqAsgj3dGwD60fpMb/q?=
 =?us-ascii?Q?udgpWMKsRSEHvoWWAXhHSUEiX14pSCzx2kaTUKjW3x1aVTP6RlehhDVeggIn?=
 =?us-ascii?Q?Bh3h6OXeOqx/aNmpPVSWjZRp4fd803qKQ1bVLyM8hmTVLGW0CNWChJEcNbdp?=
 =?us-ascii?Q?D1/h2izK9JgQLZTfsRPpheEsYCP/N/jAYM3nLJy0ghiWu/TaToDQKOk2xaiD?=
 =?us-ascii?Q?UCCIbdcJZZJiXuDICoYkb0MoT328pe35zY8OrKF7pxOOvrS8IDfnaBWiXuXb?=
 =?us-ascii?Q?Lo0j7v2P1DKgMx2vkYH0jUKCW0b8cddpKSaxIOO59iIjt/Rg9VcCGJGYFBK1?=
 =?us-ascii?Q?3bcs4aMp9304miJpgmK1g6LmbYCMufVZ6+AsQZf2er3Gp4LGb+mcp2ABFgAp?=
 =?us-ascii?Q?Qkrlt09GA8B4BeIs5e81FjMvKfgQDzLOWXGXVJ1ukEMb8fo8Fo2YH9qMziE0?=
 =?us-ascii?Q?wAeWJypwfRw0cB10C1P0MiIJWwfbtojhlyj6XDY0B9tjrmzgRBCd62uKc05r?=
 =?us-ascii?Q?40HyQH4eDaIDGKsivv8qo4Mb7m/0Edyi//JeWzLx4BMIpb/xohkyEVKynUAG?=
 =?us-ascii?Q?GMdmxFgRfnQCSJchg0UVWIQrV7IL5QhKVwWn4nF58XwWywknn7uz3D10yltX?=
 =?us-ascii?Q?7p11EesxU6qfnpEvIOSnI7GUR/UWt6I3hWSZlbsDpRg44kCbjjokzsKRjrmk?=
 =?us-ascii?Q?c3QXPGsgubnG76A5PsESycxA8i8rOuVGev4yJqYgh76Eo2rVInqiB+rQlgjT?=
 =?us-ascii?Q?XE/MkflIIJCq9863h2EeW/QWu2lOUXnW6aOIBuCAhTLCJj2M+l7VfPmFazWE?=
 =?us-ascii?Q?eNOynKyIw6hFQs+waiR7wAHwDvQonfNorIkjlhvIWQGDcyXQduetfupLLy8k?=
 =?us-ascii?Q?1hOffwgHJU+MhMq2e8was8wKEaaraDIpWyQGtn/FjmLtJL2JN3m+DRgdSU6J?=
 =?us-ascii?Q?+ziw7IYUJ/I5DHJl056cVIvydZkLZmk24WRt2crMI2PUZK4IVMCUfQqitWAy?=
 =?us-ascii?Q?gvniYstYnmfC+L1XfQKJyhXGSMgj73wWau7gFTeeZ/1/dvWIfOlJ4eODtXiA?=
 =?us-ascii?Q?SYk9GhiPy432KExux+Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f466da1f-f38d-4972-1e0e-08db40423d48
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 19:22:24.2801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPvwrLsIdoeaO4nPhNz032DitBQWhuce1qpLJhg8lAdnslx9YNpZQhdQF646x8SN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9782
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Apr 2023 19:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102134

Can this be backported to Mickledore?

//Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Linus Jacobson
> Sent: den 14 april 2023 08:36
> To: openembedded-devel@lists.openembedded.org
> Cc: Linus Jacobson <Linus.Jacobson@axis.com>
> Subject: [oe] [meta-oe][PATCH] khronos-cts: Replace wayland feature depen=
dancy with vulkan
>=20
> Khronos-cts.inc is used for building vulkan-cts or opengl-es-cts. Even
> though vulkan-cts depends on vulkan-loader, which automatically
> requires vulkan distro feature, it is more explicitly stated if written
> here next to opengl.
>=20
> Some systems do not support a windowing service (like wayland) but still
> might use standard khronos GPU libraries. For these cases, wayland
> dependancy is invalid.
>=20
> Patch replaces the invalid wayland distro feature dependancy with
> vulkan for clarity.
> ---
>  meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe=
/recipes-graphics/vk-gl-cts/khronos-cts.inc
> index f9074556f..1fda43521 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> @@ -20,7 +20,7 @@ S =3D "${WORKDIR}/git"
>=20
>  inherit pkgconfig cmake features_check python3native qemu
>=20
> -ANY_OF_DISTRO_FEATURES +=3D "opengl wayland"
> +ANY_OF_DISTRO_FEATURES +=3D "opengl vulkan"
>=20
>  DEPENDS +=3D "python3-lxml-native libpng zlib virtual/libgles2 qemu-nati=
ve"
>=20
> --
> 2.20.1


