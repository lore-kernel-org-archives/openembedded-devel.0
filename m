Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E22CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 06:12:08 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.52])
 by mx.groups.io with SMTP id smtpd.web11.5968.1755238326864632083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 23:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=TVADSL6Z;
 spf=pass (domain: siemens.com, ip: 52.101.70.52, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BC576l8J6YYlfcngFupFi66CMFSqVgfUGFNbk9g5LqjBZXQeTMASX7tUpp1YYAD+k/fpzWPtG6P4I4BBj3ibUJz4C2cLBv/MrDvEk1kk4Ba7Z+5G7O1OR+0pzS9A8yi/f+/VbaEuTaevS2HUkfxmg0sQmYMTUZo0/9pAJIK+GfIzawgh1ks/JrAUDWBAYFg5wLTkerB6sIzS1pRmgj+RKATwWvrUvoQ3BvFjpwosPKk4i6d8lk7EwLkmiU2OfH5TLsGV8+hofEMvMZ920X0eFdojWZyYDMKtb47iMI22l0znM56L9GemzzJZk4fWAC1fiVFaM7FuMQZ0Ko4WD9Uyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnudRLoidzCToIlh8d99ipzCodUJtLigOgV0rkTMNnU=;
 b=SuOReCyZsiTGDoptvalSIQyzlStBDVoh0mt5ij3ib44Nk9nyv6kuuSX+DFEKgwJFkCqbPjcucYzUUKxiEFDo/30OaE4vxd8xTnooU1pxN+tbwvIRFjrpzRsPNelnAek4lVlRZPGX6SEC//YvBz1+OB1Exodt0jM1vXBwF7dZkkT4lFEBaBiV6r+2EIM2zC9DsqS6ugNto18WjcF6/Xnzl6ziuZWMuwQPHBlCv0EeLTITu+UMQdnjt/fCQcWyVbDqpmRK/dWxCH4/OjgMsfQW6IFhHH+G2cKBIsMwbeT07FY4lTPd78LOVgoD/FZaNcQkBCGjSKP+tHaJuRkFlrObWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnudRLoidzCToIlh8d99ipzCodUJtLigOgV0rkTMNnU=;
 b=TVADSL6ZbqxqC6DJEuYOwZmsfqxwydM8kRs6pSXFyHFLzhLjFnN87HspsaltocfGfeZefe0YDlhoI81pwz2K8qwMU82PCX2Bew4LxdJUpHyq7b7GVuXo4V5VgMT8IHG0IkSC9/JQVXZmLkUmKPfMMGETTGJ5ESSNxfzBcEnSVJ6AVoRVbJU83qL3eXRTevKCHVkZvQTGCRcSOtOiHtIj4fM34hblxLcXclncgWMR65S9qHY9TpcMFqJG+uy/1GN68QjLAJxwnUSRxpfAE17Jvfd9sLcrxkJkHxTz/zC0KPyDSeEDS3NgdXB7P8RyqlYzzr7uXgpNgk4x8A1GURYAwg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA2PR10MB8749.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 06:12:03 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9009.018; Fri, 15 Aug 2025
 06:12:03 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Lau, Karn Jye" <karn.jye.lau@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
 conflict by using SRC_URI.
Thread-Topic: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git
 fetcher conflict by using SRC_URI.
Thread-Index: AQHcDZsLPP8TZUoOrk+X1krjohD77LRjNfGAgAAEpGCAAACpEA==
Date: Fri, 15 Aug 2025 06:12:03 +0000
Message-ID: 
 <AS1PR10MB5697355DC7874A906AB2E20EFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
 <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CH3PR11MB870248A4F751C67B94D9E7D0D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
In-Reply-To: 
 <CH3PR11MB870248A4F751C67B94D9E7D0D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=79510229-3cbf-47e6-bd6e-de6256f29579;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-15T05:51:00Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA2PR10MB8749:EE_
x-ms-office365-filtering-correlation-id: 74575ada-3339-41fb-aee7-08dddbc2a775
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?2qIPR5KM8CVIQuRqCLOf0NB8HO4uiiKtf/XBjMV+wP67mgJFC/t2s8VSxsKo?=
 =?us-ascii?Q?HNR5UNMoOPyovMBhB0esPMHalW+Pq6dFW/YRHycJRZ4zi0pvb1dtAnJcLvMR?=
 =?us-ascii?Q?NAzSacWU1W9gYZR2V0jSEJAGpuAqw4VCcKLXxEEL04sdhwmCThBlUdVnDAOl?=
 =?us-ascii?Q?g3/gVroFFGU37CvrJHBKcfuRC9J6l7yjqL0g1OaCAWYVCBNiHj7c4s9Se35v?=
 =?us-ascii?Q?psXk4NMekpkna0VuqlarQnbXuxoIj5nRXX70G9NpArfdvtoO92hylFKfQM4J?=
 =?us-ascii?Q?Ov40JRnqM8EwAR2dreW6fI7TwWlGjEp51SpI74HKnQFcXctdpxmD2VnN3zHV?=
 =?us-ascii?Q?LevG08/JzVt9o9/oytvDToFYG3cGPGlkPMNhjI7ulzp2Rcv1tiUL7GX8nDSg?=
 =?us-ascii?Q?9lN8qM8nqMlhdoTkvo522oXZQdt/x52+nNR8BY20B3CKXFq3Uo0TLBZnqjWV?=
 =?us-ascii?Q?Co7zWfbIjzLR5wuA0FaY6BrM85hXtLfS9S2KElRBz4hhgBeF85Mj4CMwxuAB?=
 =?us-ascii?Q?x/OToPXkEpKyqwEZJICx76lGHCzbsiKrDqA5dsruXxun4blxTzDY5w3+3fk/?=
 =?us-ascii?Q?Te96KbqYLXnx6TYWqIQvvTjeqUfv7ELhKgMurlEcrbT7pu6JwASAnPCw+Y65?=
 =?us-ascii?Q?/futzeObV+v+eq+dGHovqSAvPwSx3u3PLrUirR+AS6Bo11roNVXVz+5aQAtj?=
 =?us-ascii?Q?DBpOoDQqXR2OZamPPSJsdtSYnMC+CC3JVrb7GTW2ziZnc7ynaVPb0Yqu+sbc?=
 =?us-ascii?Q?dz8+sbLgUNUwT7SrV5D4GSndvXHwjYX5AUtXbVdRtRC2hZA3s/cw7ghUQ9V7?=
 =?us-ascii?Q?QS+MOz0xB4iKASFaWgrWGYFcDWmf1W+wjf9ztRTBUe65PhMMPXJ4ukHYOPUx?=
 =?us-ascii?Q?AUzJyhYwpnAOgwOOo7nXRH5olNtEmbNRiZK1LdiTeTS6ti8BSnGoPNblC23+?=
 =?us-ascii?Q?wpQYYuYzEqxv4qrYTLlV4Ib1qSpQeoDxk7gSLRtiqkWaWIUzuftqUuoMsBru?=
 =?us-ascii?Q?tsA4uRUETMjnEAGIQ9huyRny6ZZssTmTNAUNAXLJvxzJ85a8TcTe0VAEWoou?=
 =?us-ascii?Q?iEmoR+ng/jvWcXqEFWeOOjPJxUdLdQpWKSUGF4NdZLaeNNMv2E3wpdTREGYk?=
 =?us-ascii?Q?XMU1v3OldGcEy35fpv1X/XZBEPNkwjSLT7LHV2wycJzKQkGzZKspeLad+vpP?=
 =?us-ascii?Q?WIDjumLEYiCnLJU1Hy/E3mBm+8VlR2cp3exhvplS4iFXMTrUsOgMs3FYDfB8?=
 =?us-ascii?Q?E8VuIQoXPfGGj7sVpalKYKjrQoUn4tN2kxkgRtx6SG17K/GzDktYu2br8Be9?=
 =?us-ascii?Q?fEvIOFbK1j+YOxv4T996d4vxfuV6vFFOwQ63LPcgjSoRTU60rulRrSzN79vg?=
 =?us-ascii?Q?o52uGWDJAuxwbCD0YgM/+dTRDesmURBTXiAkbPsG3GM4/3FoJ3kbft12F0jJ?=
 =?us-ascii?Q?5Z/mKP5GflZJ7RyOKWPQa8ZvchIY2c6xpJRa0jy6fGFIpdpbgwIClA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?i4ZuDqcW7HzKI4cPTUyHG6p2cWEPy5rcLjcADoSDcvRmZE9/Ob9msM2DE2fe?=
 =?us-ascii?Q?tufNx5NLjg6p8p0Kr7Ud8QizUjockolYL7qIdDBNo9RZp6hA47TsZbQy5iiZ?=
 =?us-ascii?Q?c07Kvjr1s1ds9s+8DMu/NVZt7EKpKhiR7yiWr0Wy9xC590HWPOdrkqM5s9aB?=
 =?us-ascii?Q?WtkRnWkfMytq77j4vZ/tNjfCjrw4ViMz8fqTDVzu9feK3XcJ+uUYFJ9K3E93?=
 =?us-ascii?Q?QD9vQfG/dAUmeBV8FlVf2b8AhuMkgr+bcGqryv2eziztu/GWp0259IHtPbcG?=
 =?us-ascii?Q?JLqJZu7o9093Uqp44he/T9nUF6N9j0XC2DyImHZOed9KEaCUcb53vwfFp+1/?=
 =?us-ascii?Q?vJzWZahXYMx6zjSyqmpPzI41JlVv+M6ng09Q/9qEgrK+N1tLcmm+KInQQpLB?=
 =?us-ascii?Q?s9p+7UpyIjG6h0mF3O8aUWLLK3IMFG8kg1XC9kIFZ+/aVRg4aq6ckimFPB4Z?=
 =?us-ascii?Q?xhVE52iH7TQgYlVs2ZVhZvEn3Y2GD4zGmKouIV4m/NaXy5liuInmGeYyZcQR?=
 =?us-ascii?Q?F2bI5qpAA3dt8qfMlEHYLQrGD43tgPT7kH6zAecBw0VX7+27hIK06DB+HvIj?=
 =?us-ascii?Q?H5/VgifHE+sk7SW7MXMYMcMk5jJuSJtyJdknIXfj4yd08Jo5PgWdCSb/xK7/?=
 =?us-ascii?Q?zptw07PkXUdlrxjyMMW27TYpvJPuhagID5jcAzGUNUbJaokHqH7xL9LaPi1v?=
 =?us-ascii?Q?+atZgCpu1q23W65j9ZgbIfJiNubI4luc1YvzqxsbgF2Jm0OmOQEMCg3rZjGU?=
 =?us-ascii?Q?1/mKoWSqMdwAT+xUnRmO9OPileiXpSopcVpwxqTs+T6HulZ5Lz1qwP7CS87C?=
 =?us-ascii?Q?cPq13dpvZ4TYFFbpH/vTaoGW9vX/WS/ZdtC5f9NjZtNipQRLgYXqLYBbS8M0?=
 =?us-ascii?Q?Mr/M6guRGyZU6CVAhqjT5I5X8L8aXZgqARKbvaupadUH7KpWONjbN58bhdP9?=
 =?us-ascii?Q?CtG0uyQTfaDO8+hUMKXkIC+WghYTY+t+0lgBWm/8bz6MSfiYnKUzyIE2Zf3g?=
 =?us-ascii?Q?q0OA+N/vwZOc5+wNcHKBFTjxLI1ETJKaaQFcH0fHCJioaav9AFlV5ZuWuhEz?=
 =?us-ascii?Q?2x39IprcGUWFlIuAsxgwmBoJT0NBzbK6LcYKZkSk3OUWFUcKMBgmb1gPxENo?=
 =?us-ascii?Q?9N+sInBLeNZHq/d7+erPQxqQgeHcNKgxLc+cjOMwD+LjwBSC1yJVOvzdRRO4?=
 =?us-ascii?Q?fvETdeN9K1BxlAtQglJKOJE5ZPteIAiPlXpdtjATB9RzXE/lhvxH1P1pzk4T?=
 =?us-ascii?Q?BAhXYM606KRB8sZVACsC3LdNppk/mAfdBGyTPkZOsWWU/2QUHtSLaJ6E0ca5?=
 =?us-ascii?Q?RdKazUpJdOrrZKo+7X7azlA0aHim79/OovLQvLBx6vefNRomlF+9GoESq9rw?=
 =?us-ascii?Q?KCJzxbC0oXf8ItluJ2ix/5c/wtAjNl8GBdxZpMZHSPdRkSQos7hBdZ6sDkuV?=
 =?us-ascii?Q?0a6HC04ISaEA//Pwsi++4jE0xQGtdrMkKkFTOYf3NN0X7czh91LiQP0A6cBK?=
 =?us-ascii?Q?Y/XvSDswLSaPLyGMhTSJbqUEcEQ3rWEYjZPd5Nmv9PnMatxINyqpAz+/wAkG?=
 =?us-ascii?Q?DXMzB7uYNqkgJ2Elgqy8E0VA+kTTpJPvV0xMO/hg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 74575ada-3339-41fb-aee7-08dddbc2a775
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 06:12:03.6013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tx8ahQznrbNmoZ9GFHyoYzBBCQAvHNt1U8QxTR0N4w4RlV3LCrwJesp4xZINQfMDvYEbruX0VUQgjmcVfoPXdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8749
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 06:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118960

Oops, sorry for missing the scarthgap tag.
This is good patch, I wonder how this got through the testing.

Unfortunately, meta-openembedded LTS branches get updates only once a month=
 so this will be broken trough then next release.

Peter

> -----Original Message-----
> From: Lau, Karn Jye <karn.jye.lau@intel.com>
> Sent: Friday, August 15, 2025 8:09
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> openembedded-devel@lists.openembedded.org
> Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fe=
tcher
> conflict by using SRC_URI.
>=20
> Hi Peter, it may working fine in master branch
> but it not working at all at LTS branch for example yocto 5.0 scargapth, =
I observing
> our daily build hit into this issue.
> Thus submitting this patch
>=20
> KJ
> -----Original Message-----
> From: Marko, Peter <Peter.Marko@siemens.com>
> Sent: Friday, August 15, 2025 1:53 PM
> To: Lau, Karn Jye <karn.jye.lau@intel.com>; openembedded-
> devel@lists.openembedded.org
> Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fe=
tcher
> conflict by using SRC_URI.
>=20
> Both tag and SRVREV works with latest oe-core/poky master.
> And is actually encouraged to be used so that hash is verified against th=
e tag.
>=20
> I wonder what could be wrong since this is a second patch for this recipe
> complaining about errors.
>=20
> Peter
>=20
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Lau, Karn Jye via
> > lists.openembedded.org
> > Sent: Friday, August 15, 2025 6:11
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git
> > fetcher conflict by using SRC_URI.
> >
> > From: kjlau0112 <karn.jye.lau@intel.com>
> >
> > if both SRC_URI & SRCREV specify particular source revision will lead
> > to "Fix Fetcher failure: Conflicting revisions error"
> >
> > Fix by removing SRCREV and specify expected source revision in SRC_URI
> > by adding revision parmater.
> >
> > Signed-off-by: kjlau0112 <karn.jye.lau@intel.com>
> > ---
> >  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 4
> > +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git
> > a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> > b/meta- networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> > index 88b50a406..2591e2cde 100644
> > --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> > +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> > @@ -23,12 +23,10 @@ LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D379d5819937a6c2f1ef1630d341e026d"
> >  SECTION =3D "libs"
> >
> >  S =3D "${WORKDIR}/git"
> > -SRC_URI =3D "gitsm://github.com/Mbed-
> > TLS/mbedtls.git;protocol=3Dhttps;branch=3Dmbedtls-3.6;tag=3Dv${PV} \
> > +SRC_URI =3D "gitsm://github.com/Mbed-
> > TLS/mbedtls.git;protocol=3Dhttps;branch=3Dmbedtls-
> > 3.6;rev=3Dc765c831e5c2a0971410692f92f7a81d6ec65ec2\
> >             file://run-ptest \
> >             "
> >
> > -SRCREV =3D "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
> > -
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> >
> >  inherit cmake update-alternatives ptest
> > --
> > 2.34.1


