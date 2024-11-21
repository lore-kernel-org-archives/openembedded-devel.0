Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6601D75BD8
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 08:42:21 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.53])
 by mx.groups.io with SMTP id smtpd.web10.6517.1732178533512536520
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 00:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=AdNn5oMK;
 spf=pass (domain: siemens.com, ip: 40.107.20.53, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNdCofjUi21Fo11aas0X/NQzyMMrDfaeQKiTQrVBQqc3kkna4ml8Dt9wT9g84bhJO/3Kfnllj8lI8DQ+9YmOhsYeNtwXLqCo9UbSl/xMayqWsLGhLv4XrQTq3xttRsQ53OEszSw9d3Cl7ebFILjOW4397YLjrQwh96Yowu0zRCAVpxd3MQYu9PNZK/2e05U6KqV2NLbC5BGZ5waw54wvpAyP/Jbd9KwIq6HURYXSveNsT3wVq/3uPsUVLNp6e87xWFAsEsZm9Trgm24qJfMyKPtVFFVs5oRv1pK7/iVETteEAE22MW0ftrMbFxRcPf6+5ziP75kbjCHGGdoXhkv6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPPra7oZz946ld0CLAfF0eP8Y+zec3k5Bx0W2jygOYc=;
 b=I9VNH+T/wD3p6hXH5yCOcVVMy+PiSpjf6Vvq+B4eN04Uk5s2dHfPnEBJP3FQxX3Bq2PH/h+g4BsECiKvRpRqGighJLSqaP00gp3R5Ac6bieYT0vL3+U9x1etvoxbE0La9eE79imydhVf6J34tw6i+Jnk9ukFrgJpqn/W1z1/OcoBtbJZu9aNZDHOMjiGcxp+KVgezFeI7A06PaNc8rkCJFCdqNgcQQ+fWWevL8jUZQwso4BwHBarrHN3cB3PuIdLHG0bp867FFYLCfRxF+2giKrzeYXZXGvXBTw8FEFldGgqmlh8kDANjDH0guvnC0WNlfO6ekqYrhkp0Ncpltzacw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPPra7oZz946ld0CLAfF0eP8Y+zec3k5Bx0W2jygOYc=;
 b=AdNn5oMK+jKPULB8taU/RT8ksVhIHanEdbn7ViAIS4HwUKaPz4eA7hQyK+HBX/sfWrBdi2OpK/kGyFRZpAoUNUbU+Wv5A86sCX4gBWe9vYYS2Imn/8BD/Vv/prui6gxP7u6YB+94rhIi1Xfg1nscIDpc0iPG+RPQ2mX0H/g1Gxp564CpQoRVIk2w+Y1wuGeJYp+tT7IJgSo4hQL4JIfw+D0d7fz++bZSrIzca1ZkqgqOsGUQiwhiPrBdcCoIBUOCL5g7UKAV4LPNtLfUPwoDM6hq2BuA+eC/6PbSWhb1kArROdH1l6p5L2p9JDPIJM0IjJ0xQQRmMAny6VtDKt6RbQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB5917.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:518::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.13; Thu, 21 Nov
 2024 08:42:09 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8182.004; Thu, 21 Nov 2024
 08:42:09 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "benjamin.bouvier@ekinops.com" <benjamin.bouvier@ekinops.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][PATCH 2/3] bridge-utils: add CVE_PRODUCT
Thread-Topic: [oe] [meta-networking][PATCH 2/3] bridge-utils: add CVE_PRODUCT
Thread-Index: AQHbO++PIF5mcvcGREKxWAmpQX2TzLLBaRXQ
Date: Thu, 21 Nov 2024 08:42:09 +0000
Message-ID: 
 <AS1PR10MB5697EA4EDECB7A2FE01A9C2AFD222@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241121082901.2747720-1-benjamin.bouvier@ekinops.com>
 <20241121082901.2747720-3-benjamin.bouvier@ekinops.com>
In-Reply-To: <20241121082901.2747720-3-benjamin.bouvier@ekinops.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7f211c7f-338e-4748-bb42-3b780f9df151;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-11-21T08:36:37Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB5917:EE_
x-ms-office365-filtering-correlation-id: f74d94f5-3bdd-4e10-c300-08dd0a08630d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?jzzc8N1CDk/yEs58FuAVOoVRex2gFjRGhKlvc1tUva8rreoaFv3dZ1VlzTZ6?=
 =?us-ascii?Q?X8ov877bOG8XbZBe30OrKsMBCUg5F9RNL09lts2JRu5ubFWPYS56gqizJ+xi?=
 =?us-ascii?Q?F0+IxHksIo+TOVwWzTwtVxrnummcx99MSEsyvX/xJLn6gxhO/rFEeBzAS4ua?=
 =?us-ascii?Q?eXmfcANV18uiEMk5m5A4iN+SmPomzkLujb7Zxs6Uv5D2n66EM0hnHtl5xDcE?=
 =?us-ascii?Q?g/cZL4ZFFXcaDkhKsfxC8HfQUYJ+u5E5amvuKeCpMQVbdvmOdd6PFpIiTrGr?=
 =?us-ascii?Q?CMfpdZ4u3yf1MgKQNCkOvPMKFAKeQOfYN34JgVFyqtG4HaiX4bGKZMlQKwPc?=
 =?us-ascii?Q?WKWRE66W4M74chzIWf0JYBbqez0GI8RgM4AUL4uIkP2hrCuZ2MxFMU9RLjKy?=
 =?us-ascii?Q?+1qxQgFgIwjCZ52Or6nZ10pHLZQBlRnTrd5H5l8TYx7GwGvwdwAoYhpbrFV0?=
 =?us-ascii?Q?qChkpxMx2Z9JhM9Yw2ox8ERO5uH5KNAOECfGvwv/YYbuGMm7D1wMcbT2MUoO?=
 =?us-ascii?Q?vk6t4tiM1y5EizLDayvnQsxpJKUxgSJ4KuYxY9IFpro0RncVpC5Pqqk4yCni?=
 =?us-ascii?Q?//LoS4RsMNjKAtw/mZEPWx+R52ZJlqUtFYSu2rktJaQctNw8MvXBqf1Ysqe2?=
 =?us-ascii?Q?r1aLR2v66DyGNMgiKmXzxw28AjndI5YcQH2h3LhuxTynkuKEzydfpMhH2Vql?=
 =?us-ascii?Q?7T0/3GqlpeTRgEDF9rFayzRy8gnm2RaEpg0E1fFYBatJK9Vyu3kR2hXl3V1U?=
 =?us-ascii?Q?hZOzU74YWgQK0cOK1SFNPRORnoTV/I9qIgGs0nm4XA/bSaUnQghrPwd2VT8V?=
 =?us-ascii?Q?lTeRlxi5DMto6DgOAHtIDhwIhukLhKx41Aq5oo9uvLrmw3/ejnn79LgA3asS?=
 =?us-ascii?Q?f3YDiBIY92adUJkTIUcG4cA9sR+C2hC/zkhXtScFzVnv3Ns228H39d/9/FxM?=
 =?us-ascii?Q?3QPhh/KpnWyEdRytRamqQw3Kof2OY3z5UPjzHJb+aaxnC3MCZ7KGlxB6uHL6?=
 =?us-ascii?Q?ApvPmidSf8Daic0finMo4HYyr9hZF4HRZoLndJ/Tl/NtFP6IIjVelnOesZDF?=
 =?us-ascii?Q?HZxGKRI3vZ7gd6lDM8J6jxopNoZswcV/QeRKTrcZnptdHcyH2OHevGYpcy8X?=
 =?us-ascii?Q?Z93Fx8Ll0vJGTZIAjPTtkn2/pk2j2Ce+zIKIYh3C7ZEB0imRJHS0E/46dAfC?=
 =?us-ascii?Q?6+3nzUMKJDrCRipxhUacttmkYSlLRAf3cJ8Ia2IFZkqXTBANn3h0DsrGSO4A?=
 =?us-ascii?Q?6UkmnjfWnv1GqXs//ppUz1Y70mHA4jPf+avci9g9/KYOJmGXNZVC8vrlh8Zv?=
 =?us-ascii?Q?ue41L3Od1Dog2k4cJMeR9peXhHEUYSPfiBUGG5nb3CfJRlbEmGrPLJbf4xdT?=
 =?us-ascii?Q?ZIs7+O4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aaX22SQfay+evDBW9WZZMZjJGHcTbMW22q4edvSivTk/EzGPplR1HcGc+RvC?=
 =?us-ascii?Q?PvfatN9FvrVogeGz56x8b7gERB64gzxjOa6PF4i8ss5RQoIABxACxTEI7GpA?=
 =?us-ascii?Q?3iZ3JN7gReZI9VQ3Uf8bQLzj1E3IvRLZNImZU5YgySlAab34Y6Zh5QBb/kAp?=
 =?us-ascii?Q?Ul5D3Z2vZfMB/vlgFUnSs6CBDMyJ8TdUjZxwaEcvVeVxlNRXHcdgYO6NH8QO?=
 =?us-ascii?Q?kYBZ2ZroxKoz2UOTr+MIbfUakhgnITCN9DvUFXx67KnB+SSnoQe+GR8wo6WM?=
 =?us-ascii?Q?XVBhANH+aDTapvdxdCdK3CF+RfJZASIwBRB4r8RXXBnxT31OnwMsogEamvik?=
 =?us-ascii?Q?zhhJy6Dr9LjgEmiZbTR+tey6rw1tKIxTEks5RUSUu07lbNDmO/+CFXzN4TA4?=
 =?us-ascii?Q?0cgfYPLWZvsGI5McIF0Hk+VPqUlYKgZe5P7uRYS5HGPCcrbKCR8m2c1oM3Wk?=
 =?us-ascii?Q?i5IXbASiPjs86A3OKpaIARtO93eeem4a24Hu21I5sIPx+pk/YshJY9FystQs?=
 =?us-ascii?Q?Ps77UdRxRgHMW+Vnf9usIDekNk5vBNUuyz13/YWH/KIiGYlcvsXIveTS3e49?=
 =?us-ascii?Q?Kcb2Tqcxf7zS1vMti9lECcraIN0K13Ce+Ex5urYjgujLlFzg0aYnjIMXTF+v?=
 =?us-ascii?Q?Qfwyv5D8jeXbn1m7snfkIUAMb4HPaRHHgLgppaHGWRbGL/GtFEzwsleBPim+?=
 =?us-ascii?Q?97Tx3PPQqGBQJTjfod/Hp7Af6Jsae0YEWaf/boEJkLbHdapLHi2OiN+lJ4d8?=
 =?us-ascii?Q?Jg9eTFmDesXC5dxHaIr9bIubNxrj7w9YU+RbTZa/j9Bkp3swlgmHGoAE83/r?=
 =?us-ascii?Q?wu1GyaQfFMob5fo3dWXt7p7ogjXvrNURWt7PQK6zlHEdsyoT5VlRobl5wMzY?=
 =?us-ascii?Q?PctizNR4QBU0eBZ2RW+q0TPPSlS7+cIqbzmbBPbjD15IuUwpBoPFIaTn55VW?=
 =?us-ascii?Q?YXptTmwR3bO2er12n0OywzHZpph3qkSXX2DZps3sLGSkcywRhfhi77gsymY9?=
 =?us-ascii?Q?JlooDo+Gp/pyjDM9vHL0HjU2n4nwIPBhvAM1YzmesBD5SVf5EJl2S2y3rXdI?=
 =?us-ascii?Q?OV1dPHpMaj78yqITFAEeEBu0acno/oVcs0Q12RA3eIF0dFJ6ThHxmxtjKglp?=
 =?us-ascii?Q?v2C3BXGOIHnAYhq4qXZQ4OftSIL4FptzZUdhpBvH+TZCoyGTL4WiLzYk7X2z?=
 =?us-ascii?Q?Nj8tz5kwG5/EJQE4yOqj7+77wioTW+Nr1X5O9jCbUgwpsWv44Vr8tuW2fLAw?=
 =?us-ascii?Q?+D5bSWz+M/yHi2k5b5kuINEOVL7pq6BmfYd92uvqY5Wjve1baQ8Tk5gc9CP6?=
 =?us-ascii?Q?NkUyvaM6EZVJwGng/kAW9h8fFj+HIK1ir1u+P7zboksYszzi5uLQ2kaaPXAM?=
 =?us-ascii?Q?eTAbMa6BARTJt19rdQttuLJoiFmJklHFzVqdPmDgA/oOshHSz13ndkpLJN0p?=
 =?us-ascii?Q?zdhFRQlwrFNMCkSyT3HzA0n6Vh2BzA3hWHfHeEKRkdlq77T44Kr6lh+jDPNJ?=
 =?us-ascii?Q?CIQTXrgVUn82pm/G0bPSOhw6cnKy269dw60S3LeBHDgEUTQsTifIMTtPm3ch?=
 =?us-ascii?Q?/AipeP8D8bnIPorAtYSw2kcdQVSV4D58vFIaJIgb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f74d94f5-3bdd-4e10-c300-08dd0a08630d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 08:42:09.4034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qV+Hpfr6bb2jwwEbYFqeTm71kAJeSuNwZjzl3HBHm7df0/K30CrZ7SvD7R920nyieBKjd7pSIxkahu5JnQuVbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5917
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 08:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113962

I did not find any CVE for bridge-utils in our nvdcve_2-2.db.
Based on what did you choose the vendor?

I think that until there is a CVE where we can the base data from
and also a conflicting CVE which would show this need,
we should not limit the vendor string.

And regarding the other patches, it would be great if the commit message
Would contain description why it is needed (e.g. which vendor in existing
CVEs you want to filter out).

Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Benjamin Bouvier via
> lists.openembedded.org
> Sent: Thursday, November 21, 2024 9:29
> To: openembedded-devel@lists.openembedded.org
> Cc: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
> Subject: [oe] [meta-networking][PATCH 2/3] bridge-utils: add CVE_PRODUCT
>=20
> Add exact CPE name in CVE_PRODUCT.
>=20
> Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
> ---
>  .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb          | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-networking/recipes-support/bridge-utils/bridge-
> utils_1.7.1.bb b/meta-networking/recipes-support/bridge-utils/bridge-
> utils_1.7.1.bb
> index cf0fc1c33..66c8f2d05 100644
> --- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
> +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
> @@ -19,6 +19,8 @@ S =3D "${WORKDIR}/git"
>=20
>  DEPENDS =3D "sysfsutils"
>=20
> +CVE_PRODUCT =3D "kernel:bridge-utils"
> +
>  inherit autotools-brokensep update-alternatives
>=20
>  ALTERNATIVE:${PN} =3D "brctl"
> --
> 2.34.1


