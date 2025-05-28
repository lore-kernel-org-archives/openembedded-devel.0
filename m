Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD8AC3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 06:23:35 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.32])
 by mx.groups.io with SMTP id smtpd.web10.9716.1748413405999602809
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 May 2025 23:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=v/6Z9VNf;
 spf=pass (domain: siemens.com, ip: 40.107.162.32, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9LtkN+pJ4l5bMzeAgRdUPWWQ/Ec2ZKp0XdY4KubKbAqe1fSVHVnlkfHp3Hg9GmTowEpX47XlDJ6mDrrYy3UEkFmynh/JVC3XAo3yWsTTndEZtNy8Wt4eTzbKjcHPivfFXCrDJU8fmapE6LSapgkICgMl+SIq8Vdx6eBIt9ZJm1AFQMSXJt5FyGBd/fQAWQNQVZXZKxSIb3ugzwbvrVn3f9qJclH3BtwFBE7T5wfZ0h2tJdhwchZnOnzciU/9X9JOwnZHGAn8llAYDi/+yA4UG97pSwdk2s0lr6REGk4aywkS3b2DyiYpYs0FNqhlXWJAbc2Smqs191GAYYK7XfFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKVRTWW2uvJrQ89UknLRhsshzCoIjOFpFWIBnQfn1H8=;
 b=e5sUDs+48luHPlDZVawz0gf2lxyLErhK+frTLf8XQQ8ArRjrvTyN48szhXpKwTPa6sghT8QByrN4ZMaS59X0QoRysH+QqTH/4J5J8FtyhLHxGzkd1yKDMak3k5hEQCWz2L5HKCQk6cRgBOo3DsDoVD0FCZTnZG/LdrTSFZh0/ccw9cBTLj6rpNH2Hpd/QFUaKgQUQkjUe3SrPiGsowX40N9Ru1v4x4TpdQe8yaR+80emEOvTigv5LPIfaIzGzsJC48Ju5SRy6FN1TApQ8lH2sO2p/jk+LhzTlgiXqaM7AaYjVNjswpnwBL+xCdz30Os6AxRCJ1vAQplKyR0X7f7+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKVRTWW2uvJrQ89UknLRhsshzCoIjOFpFWIBnQfn1H8=;
 b=v/6Z9VNfT+gQiGzAx2lUr9/OTjWHqNwSUVLGx1JAuNgIfaekCEuAH5ie8Wl5Vjll3flON3rjk7Cs+ZoKxoY6WVS4XXa6rT4X7pOOvLrRdU3dgLpwKFSCVw8J5KaivVOBtJyvp7SkkNNRbPqa/y0+V14DSfGKoIt0Yi1CzgsjJMiGSlLPQIej8BTLDofWlbgiafQrxwvAkZVduzSVzvNCJJCEF2lgbWbgPVF51FIw5NDgTpK6Mme+o58QPqhj1edZeLePB5eDUas4bFajh+aQt8cjbW2AIbnnrPB+3Vml1eXgZo+affftg8loms48Fs+u5ZmCphpUDjLEFWq4vrbJsw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB6808.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:338::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 06:23:22 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8769.019; Wed, 28 May 2025
 06:23:22 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][PATCH] networkmanager: update 1.50.0 ->
 1-52-0
Thread-Topic: [oe] [meta-networking][PATCH] networkmanager: update 1.50.0 ->
 1-52-0
Thread-Index: AQHbz5fmim8yPSw8eEizP3hhvRWsZ7PnkesQ
Date: Wed, 28 May 2025 06:23:22 +0000
Message-ID: 
 <AS1PR10MB5697A6F60CA36CB6B273568DFD67A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250528061506.466361-1-f_l_k@t-online.de>
In-Reply-To: <20250528061506.466361-1-f_l_k@t-online.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=068c2ee3-4099-4642-a12c-96ea4083399b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-28T06:20:05Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB6808:EE_
x-ms-office365-filtering-correlation-id: 51e71027-35ba-4ab5-06dd-08dd9db02556
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Mug1jaIWUFuNC9vBJDIZ9pgRyft9gJxmM36GtcxQt2adNQ8HfDeo062Tw9c/?=
 =?us-ascii?Q?vgCCcWZ63jR9mC45IeOP3BUaJoQgfwLtzV/i0QTDznCnODLhKBn/vGq0kUuG?=
 =?us-ascii?Q?HYN/c9Yo5fM/FpO79tMlAr7ed0+T9rvb/4cv4MzzSjiDSMW4XmzATz2tohUE?=
 =?us-ascii?Q?jGkmYM+MJ751ojRJZhJ/aU53I6xp53p1Z5GE+w5Yv7I4IrrrWSeNOsn9aggZ?=
 =?us-ascii?Q?RAy1YGtvwM35hDXnpQBe/N3zUkx9jjkwhomz/AmULElyVLWN8ROMsU2fMcrs?=
 =?us-ascii?Q?DBBPOpGT+eSRiOC3qLqNHvdtynmYDeCTA1FhK3nfmFETXV0Y4n0GddoJqL6D?=
 =?us-ascii?Q?wRqhPuuYwyjWmakHSErfoU4Pl+20Huey7vizz1cOUb2Yfu1gTLO+AnXwAgXI?=
 =?us-ascii?Q?9uwBGM0nFkBeMGU9OsZXrd4Qm4xGysKZ6B6w/iJQAlEMlRlWmdxXtXVT+v7P?=
 =?us-ascii?Q?VYLNBQMOqsnJgKKSFVpnpIccuEMNWjMPz/ExbC6228ooUDQqGpP/+SUHcTnQ?=
 =?us-ascii?Q?iwjhJAa61C2VodBiZoPg/rxrJVCFaAViDSctAcyFl/9+9v0xz9biyhodkfkO?=
 =?us-ascii?Q?LSmK+pA2DxGePqF/h0wJyUQcER2m1BjP8CVVnPTpMAuusGCU287UNm3EuPw1?=
 =?us-ascii?Q?U1RkMF1Z07HEG7WGDYplpDUNQ5p4xmLn2EJndYXUXTYnLDSP0pD8EKPm2suK?=
 =?us-ascii?Q?lBI0vkkM5mO+dhvej3HZRSVbUl1r/VHGmXa4Y2WTz1GVxz8+eUmTDdV2EKot?=
 =?us-ascii?Q?ZtPSwjOEO9x4KEmMq3cj/NxaBvE3dOijtNu3LBdRX4wU1ncFB2mK0yx4iAiD?=
 =?us-ascii?Q?+yCDGHs0TyC2CUlEyhrkqKpgep5kIsr7u+9m7DdHW4mHWZ50o3mmibZUj5ym?=
 =?us-ascii?Q?KfTVwMss7TasdjdrmjFDQpdYB1ZmPTZQKhhkxdh/nRH7K47zmwxphLgsd+i5?=
 =?us-ascii?Q?ruWWFUheYi72TJUdWoQNGQCvWILH5N0cmVCJHS3utDNw+hEQHYx+DgMCVIBj?=
 =?us-ascii?Q?TVxOnb37Ry5e2BWWZqpSW+qq3lizGObWy5vTFOSOnXDfZrOQk13Qhq6Fa4EB?=
 =?us-ascii?Q?Mu660VzsRKYjWCvnGk+xEyEnpZgd/StOHZHxIRH2ZVwL4eP/E2HFESjgK7yH?=
 =?us-ascii?Q?DmHcLTKh06UIbSUclvm9KUOFD71lKQXbQYD3tGiFPuUHBROiT+i+l/oWC8dl?=
 =?us-ascii?Q?Xl1/+oIkcvmyj85vTV3BZw1hyRUY6NnYcwDT5wyXG4rABX8jlRJeulHouk+R?=
 =?us-ascii?Q?YBkVbXffoa2u3wX6SRW16xUuEeokVNWoHIzWEjcdNKqRIB4shbA/WG6pjEiL?=
 =?us-ascii?Q?73bB51mE1fLx2oDcB4leXz4gkchUWmHXDaXiGkJocQX7UyyHWWOz+25bpTyO?=
 =?us-ascii?Q?Z04AXZtZvER/iK9WLovr3iJ7X0vfhBqrmurD3RRoeJALgZYnQVrdSlq1ZJ4u?=
 =?us-ascii?Q?+KwA3fvl5GGUGhEieXWVgWml7R0z9IpC3bCKyYs9/VMKZxiHu2leNo4kmc1F?=
 =?us-ascii?Q?l+bxVyskMqLULaM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GydYMOM2YzxQjaSAzElcppxFTGnKwxmMq73LkMwgqEnBSyfRNRoqKRWSqDZT?=
 =?us-ascii?Q?Xva6h3IPEAbsYyn693/BwXRoCgtliGXOAD8njDkFrOPcArcK1d8A/gMoKI6A?=
 =?us-ascii?Q?Mj6/ksgs87N54LCr5kBRPYWopf3FSchETVzcA0WR6auFgmBGJHUlvzStz+C3?=
 =?us-ascii?Q?6781rAy51/BJ1Hdz12wsD0aWahupWoIpB8oqDbE1feiTcpxiMJToBM5QfQyM?=
 =?us-ascii?Q?UG0p9LFFQ9al3LqRuPycxOnujq14TPJqxfHlJjJwj79Lo5+6H0Bn6zrUPsOK?=
 =?us-ascii?Q?1YBeVDaukSeHapjFTAlLtYepvhE7grEt47+/1ZRm2IcmdAc/oDBZYqFuDHPd?=
 =?us-ascii?Q?X3UP7VQHGgD5tQwBG9ceKDAKEpqyrrLbhURsCjMQCOgarlpn0e+cBf/K5cUj?=
 =?us-ascii?Q?ywSdNhNsWR3XSxAlOLQK1AhLuDEsEUy1a0CkTUvdIA+K//8DoVE8XHGavlme?=
 =?us-ascii?Q?ObXOSSVTKrXpgwIVRBktOMbo3Y30nnGZZEaXYnPGbWZhzBPgr+BurYxnTTzb?=
 =?us-ascii?Q?+9Y9lxAiifsTutmY9M+b2QW4T/H0/DvAGi+erLWIFNoLlA+uE8otHwJS0SHb?=
 =?us-ascii?Q?sYgaEMgGeANTsXFz+rZbyvIN0Bd3hcO8mdSogRlr7H8Sn60v73CdHpu41XUw?=
 =?us-ascii?Q?4yhn0r8TNxRSi5NkZ1ivxslhUE6sy6cPDGjz/g9qf8bkI0HIkq+/HG+g2l3u?=
 =?us-ascii?Q?vayyjP13Q12V3aVad7SWwIHa+NQZ8XaCZV7FMsbW604q+DZFBNG9Y6snv6pB?=
 =?us-ascii?Q?imR26wTJkVROiP9Z0oUbH4d1cl39SezW/5KBa8mrcEgOkGZIAEooO5/qNvTL?=
 =?us-ascii?Q?HDEHhg541Ean8NqEpb16g0zfiNoimzC9YpDM+Ri49cqHQhXx2GGeXF2V5vo7?=
 =?us-ascii?Q?g1q1PRzLdHQef+RW4t3edMlH3/YmvTVd+rxr0Yq+HJ9eKG4pvxkJteUCRolo?=
 =?us-ascii?Q?QbqWHCgl/eRVk5pHUb8qm7iwl/4BQcmGjEsLF7CmFlEZvlcPej5issUN0oIl?=
 =?us-ascii?Q?rnjrYFo5qohr2GNFLXBCU4ZZdq+3XTYQPMVRRG9GgSeR/2ESeyBnd/rsXOgj?=
 =?us-ascii?Q?TYJMMABFoKPTIeZf1OLPUdi5i+JkORkcOw1TeuNHdJKTP2GGe7enqCCRYP5K?=
 =?us-ascii?Q?TzamE1s7RaEkVB2piLCUlNLuwKzHRbgblx8TdQJU8MypvZYpvhXOWm6zQNoA?=
 =?us-ascii?Q?2Fjh70eMYSmFieswpw7/lNFYDLMZBYNi/gfJH3hcWgn0BLL5kJEK3X1WEjmu?=
 =?us-ascii?Q?3QhuhGaIamNkCKqL8kGuXCYghvcovCN0y81QyDPBxB96wH/4gI2UFR2+I1BB?=
 =?us-ascii?Q?/mWh/Kr8qxGYJGq0CU/MeNTNv7kFmXbbgQ4OdjGyMsjgxTV/wYID+oNLd0Of?=
 =?us-ascii?Q?ivHGOR+vz+ZugWCwHxo1IMnCHG3Rh5PWDkthdEX76rxAblvKJRNhuBjDLEbC?=
 =?us-ascii?Q?IwFzo7wFWlottrWXrcCSfwgwVC0POpEUrn9mq758hgd+C3lOoJ8Q0/8t110a?=
 =?us-ascii?Q?r+CCDFNOb7TjU4JguWKCxX2XL1r5syQwHkehPPszeSGtuJ8UdvoHM53QANFb?=
 =?us-ascii?Q?vOrTfRvNAvgxSQT7JjZsklcnWuYJpo8c/U0HhFjz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e71027-35ba-4ab5-06dd-08dd9db02556
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 06:23:22.2620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IDXBAWZAAKvxfVl6hFLqs61l3ZxkwddXLKG/TJB9Jvi3sS2TfyOoZRZHeHQdONDdSCmUs44jUfdX+kv6J0C7sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6808
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 06:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117643



> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Markus Volk via
> lists.openembedded.org
> Sent: Wednesday, May 28, 2025 8:15
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-networking][PATCH] networkmanager: update 1.50.0 -> 1=
-52-0
>=20
> - there is no tarball hosted at gnome anymore -> switch from
>   gnomebase class to meson + git
> - add missing dependencies for uuid and nvme, add pkgconfig class
> - dhcpcanon option was removed upstream
> - gtkdoc is broken. Disable to unbreak builds if api-documentation
>   is enabled
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...rkmanager_1.50.0.bb =3D> networkmanager_1.52.0.bb} | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>  rename meta-networking/recipes-
> connectivity/networkmanager/{networkmanager_1.50.0.bb =3D>
> networkmanager_1.52.0.bb} (96%)
>=20
> diff --git a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.50.0.bb b/meta-
> networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
> similarity index 96%
> rename from meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.50.0.bb
> rename to meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.52.0.bb
> index 702b80ac68..cc37bd05d7 100644
> --- a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.50.0.bb
> +++ b/meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.52.0.bb
> @@ -25,32 +25,34 @@ DEPENDS =3D " \
>      intltool-native \
>      libxslt-native \
>      libnl \
> +    libnvme \
>      udev \
>      util-linux \
> +    util-linux-libuuid \
>      libndp \
>      curl \
>      dbus \
>  "
>  DEPENDS:append:class-target =3D " bash-completion"
>=20
> -inherit gnomebase gettext update-rc.d systemd gobject-introspection gtk-=
doc
> update-alternatives upstream-version-is-even
> +inherit meson gettext update-rc.d systemd gobject-introspection update-
> alternatives upstream-version-is-even pkgconfig
>=20
>  SRC_URI =3D " \
> -
> ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager
> -${PV}.tar.xz \
> +
> git://github.com/NetworkManager/NetworkManager.git;protocol=3Dhttps;branc=
h=3Dmain
> \
>      file://${BPN}.initd \
>      file://enable-dhcpcd.conf \
>      file://enable-iwd.conf \
>  "
>  SRC_URI:append:libc-musl =3D "${@bb.utils.contains('DISTRO_FEATURES', 'l=
d-is-
> lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '=
', d)}"
>=20
> -SRC_URI[sha256sum] =3D
> "fc03e7388a656cebc454c5d89481626122b1975d7c26babc64dc7e488faa66e3"
> +SRCREV =3D "7ee8d84a1ea030f5a4dd867702ed2992f192c5c8"

This is tip of current main branch (1.53.4-dev-23-g7ee8d84a1e), not 1.52.0
Ideally this should be hash of 1.52.0 (or even better 1.53.4) and SRC_URI s=
hould contain ";tag=3D${PV}"

Peter

>=20
> -S =3D "${WORKDIR}/NetworkManager-${PV}"
> +S =3D "${WORKDIR}/git"
>=20
>  # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
>  NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??=3D "auto"
>=20
> -# ['dhcpcanon', 'dhclient', 'dhcpcd', 'internal', 'nettools']
> +# ['dhclient', 'dhcpcd', 'internal', 'nettools']
>  NETWORKMANAGER_DHCP_DEFAULT ??=3D "internal"
>=20
>  # The default gets detected based on whether /usr/sbin/nft or /usr/sbin/=
iptables is
> installed, with nftables preferred.
> @@ -65,7 +67,6 @@ EXTRA_OEMESON =3D "\
>      -Dqt=3Dfalse \
>      -
> Dconfig_dns_rc_manager_default=3D${NETWORKMANAGER_DNS_RC_MANAGER_
> DEFAULT} \
>      -Dconfig_dhcp_default=3D${NETWORKMANAGER_DHCP_DEFAULT} \
> -    -Ddhcpcanon=3Dfalse \
>      -Diptables=3D${sbindir}/iptables \
>      -Dnft=3D${sbindir}/nft \
>  "
> --
> 2.49.0


