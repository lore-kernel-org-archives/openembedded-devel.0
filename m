Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F9BC35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 06:54:18 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web11.15362.1742540046758895708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 23:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=SHEab943;
 spf=pass (domain: siemens.com, ip: 40.107.22.61, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKz1fri3T7Zq0WkHT5uFHFraMYT3ypa4nO41legUVPkHWDN+qyGi8j/bS7JRWkOu7/uMjPPLAfuUuktLA8v69YDQmTLdu5LLP/sRyQHlMAnsDTpPISG37tTb3TVC5mjlUNDPQ1aLpWaYbzWSPfy/H5mkIa5F+VnLdmHJTfjH3GPvFnHV+KurlwyJ6PmEDRMkcWT33l4TpKhQyF8pTytwCedCdN7T7amYjbhJzgMUc3TuQTOF+kRD+5Kc61GFlrKz5c/KTyJVkC69qFMTPheNBwMqACCk+fTUZaKjdJ9Q7xMrm7IIjW0WCNgFLoBAsbzvVrP7KE2WcdjFfZ/DOjYrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxuKKV18exwErOZlED67UNGVhrZF0yAv4sj8x00f7wA=;
 b=TcAz+XXynqcOqymhc16xhRZH7OLYNkmIk/kaCOU1IP0gpRDyKlujcSYbC9sBH9SGAzZT1WhbMc7FFBjNP62YmfUeuhKnNip1l6FTYPzdc49rYoynbKKjJUCDL7TBb5o2YAjGx1cFj/Kz4dPO7fxJ7LeakwHF71o4TKWqbKsUfQHT5fLFy7A4nz3w1rDpsKgM/fx3HsgtPqHzXB7cgtN1nbOw1BdK5j40vYd4K63Wq3hJtDn8AlvqdK6ktm5uYh4c9tvEhEgjVdmRdW59/epXav4VYCbDgagK2ud4vvFqdgIZlJ1xjGBx3f5Chs+ozRgWZS+KVR0qQ7OMXsrwvzvJDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxuKKV18exwErOZlED67UNGVhrZF0yAv4sj8x00f7wA=;
 b=SHEab943q3L4BlQxynAJK2USaYx0Ycrv1nZD3KO509mbGR+dJSyOdTzpXKen+tuOjkaqoTdq9wxopNKA/ovjqz+5IgD7r0JKBIkyzTmbAJH/BkF29sLtw/mkzHssartVxZ5pchpaG6BJmmtXfO5ggPOyXwYQ7ilNhmZ2/EgeMPrDKwFxQ89lRFYd6cq7UMcAzmRPIIgbfr/SrvI5eNuN7ULy6Ccl4MeKODLlaCaPRVjirF1dO7qXAbm5Gf82uqOPIlaiIP5HXnp+7wrR+CqIh3QVTqw7AL5TdWUD8kyG5p/sQWMeEmz7zP1SB8eHkBLkk5my+8mysKtaOIk6PYNACw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6456.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.37; Fri, 21 Mar
 2025 06:54:01 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 06:54:01 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [meta-oe][PATCH 4/4] libmad: patch CVE-2017-8372 and
 CVE-2017-8373
Thread-Topic: [meta-oe][PATCH 4/4] libmad: patch CVE-2017-8372 and
 CVE-2017-8373
Thread-Index: AQHbme3t47SU8Fhq1EmuX6lUjMtBu7N9KChg
Date: Fri, 21 Mar 2025 06:54:01 +0000
Message-ID: 
 <AS1PR10MB5697E8D08AFBFE8073F7F154FDDB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250320231405.1693060-1-peter.marko@siemens.com>
 <20250320231405.1693060-4-peter.marko@siemens.com>
In-Reply-To: <20250320231405.1693060-4-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=663c232c-1d2a-48a5-a74a-0c65850807f8;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-21T06:53:53Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6456:EE_
x-ms-office365-filtering-correlation-id: fbee20ad-1898-4d41-6792-08dd6845297f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?23CBJW/kOF9/wsI4mt+qNUJwFVz09lPGGZoa+VoJ5Wu+y2VGZZToP1h33fNz?=
 =?us-ascii?Q?dAvRowE9rEXgPR3XrGA9JlaH9lhyNOkYOh/ax1S0QOEjasU4Pw4vWY9jIp5D?=
 =?us-ascii?Q?OXMsU/f+9k/jrwLYZOus60jUMWiAl8TenI6uX5TAkv22kouHei1IOsS6DFiV?=
 =?us-ascii?Q?qTW0vUTrZTYxH1WJ5zO+7PhXp4hjmlFc4nkciuceWokv5k8gunXUaMpnaoHM?=
 =?us-ascii?Q?0PdU6qmdYVLGrtL2xA++Pn0R6dPWqtzD8+r2tOHtgdRGp/245V6RDjoYKFj+?=
 =?us-ascii?Q?3kF+ofysUovgECKmI0nR6zAPsyBSzAs6DwezsWoM9aHPCKIZeIYLA5U87CoQ?=
 =?us-ascii?Q?9WoVExUquAo9L4UBVYsOVpCWdalB1HYG0v2clJAvjT295HgQAgzQ72UbsnvM?=
 =?us-ascii?Q?cJ0ptvlpWc33TMn+eb1WWH4QTV+ivodG2fmXvifQv4IBOrNwIxEsFS9T9ivT?=
 =?us-ascii?Q?XAyE/dWVA0q5ZrxcAlcftBhX5768mg8PHoGzmgBi8h6ycJ0yJNsetGYuPwDj?=
 =?us-ascii?Q?fGDTQgIlY+D2tURcWyE8lKGaOsW7BqT6j4VVyeDtLggfgYDi4zZx4ec5KTuW?=
 =?us-ascii?Q?nTCUfXy91BsKJX2JL/BS4CnC9gzWJhlkz16W12aWD9x2ds1cUD+cGQglFjpm?=
 =?us-ascii?Q?s2nr7b+6kWqLMGxpyfwzVYlOS8MLmrtzkcUKNqZYTqh+Y4vAFGP+aFX+sAoJ?=
 =?us-ascii?Q?PYoUxcSX9t12Uu27VwEOegzKk7xUj1MmDO9iVZr28zXnrL2wzf/Wc5fg1+7b?=
 =?us-ascii?Q?5DjeOgekrTRQWiU3u0S+PEqAhbsNSF3uvaVrb6Hl25MmwXR/wpQ8udpDa9c/?=
 =?us-ascii?Q?6MSBoquAFe/uYmiWCiMH7kPe41YWNSltjqb91hS/32wTKqrVmyzFZx4qe8Ku?=
 =?us-ascii?Q?HDWzFjftKPx+DXj5W7w9z5bEabtAvEaVoAMvuvCNHwcjf/9LVfwX63RRssSZ?=
 =?us-ascii?Q?ltxOYkCT2sXVb1ivvz34nDhWj1KQnCeTuOKqL/8T9A3l8vW7cGUYg6IV2JyI?=
 =?us-ascii?Q?LD0RqJdy5axIIeSGgwwM1nvucjftlNTalClF+YlFsC3I01vPf7oYfsDKGn05?=
 =?us-ascii?Q?RsSFBJDgqarOPR0ef1FEnfHLMDCJBeum3iO9OlvBYFiPiadrkkXMmGY54s/B?=
 =?us-ascii?Q?nzeJrwRBrBw0CGQt6B3747dd8p06dmbjQxQRZKyk8tFOUjwwRVCrir7Ge01X?=
 =?us-ascii?Q?dvKIUVTU9AEj4i9XciVvzmjHZK7PZ4VxSqO5Y7+MAofsjRPHtopSoIFzvS9c?=
 =?us-ascii?Q?PK3vJU5Li33Ba45+OsS+9uJtgb5vj1Rswg+3p6cHCUKKzDBgMkb//wtAIadM?=
 =?us-ascii?Q?r3Z41o8VXTe1iYue3h2p/n9Sw/wiUOim9grp/uqeAEpFtS9iQa/SBNDTQOeX?=
 =?us-ascii?Q?V+CsJR93rOToGUaC6DYbuhwTWNPmQypEqclr1E3zgUUuwG+nJGoDXCVNnoMA?=
 =?us-ascii?Q?siVdmaswTRpgfunlGGHN+zzmrfD8LDdx?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?19GokkXKMEBuW9ed5Eb8aimRQz5HxGNgmF0McZQznIzPwr+j57sDqpU6Jn3E?=
 =?us-ascii?Q?r5QJxty+ffHcpG2ZTagypgObf58M6gLR1qkkZMn7sr8yVtp777Ih8hX3EFyy?=
 =?us-ascii?Q?fwA2kxMxoOwYjbbFhEhP4NGhpE9zpUbp99iT1bgqayhowdPLG95QXAvAn3D1?=
 =?us-ascii?Q?wvirfOTv3zPfsPKOTEtF+fkB5AaZ55pnE7z0Ee3aJSeF9eIT0J9Olj6f8I6R?=
 =?us-ascii?Q?nWM+tu34dj2eIgz9NpDqPdzDXD+8NI9rnVo7j9Umt8HyRKeivMp6x9psYdJy?=
 =?us-ascii?Q?3SDXLbtlr8O6cpsPwXEl6ZnAgobbreiMjtf0c8so5dvEdrM723oF/q2rpjiE?=
 =?us-ascii?Q?qQHFfIR5/CT7/TAz2NdmWonBYYQF3IXNE4OGHIrRLt+RzgloUAN6/dfCwj4o?=
 =?us-ascii?Q?z7B8Z8OCJF3obmqN4ixDwU76LwqCJh5ongBMqwKWAOApbCYsLbtQrpmjZGAK?=
 =?us-ascii?Q?4/9aK8tow+EL/iRuL3HCi8hT6bCB7m/qJxUp8T/m71A2/TwMYJPeVqpwntmM?=
 =?us-ascii?Q?zDzpgllDcpsCVeUeZiqYA1FDV2EjGeZ47P57eLr6BA6u9C+UcsavZ18DlL+B?=
 =?us-ascii?Q?rFh4dQA59V1XJh8g1/pkgnBl/BRiXU4qRl9LJD5Uyv2yJF+ewFwZ5J98QRO3?=
 =?us-ascii?Q?YwdlqWLhjP0z+PnEiDXBtfX9poMnOXpxX5iuvL5sZKD38fbA7ra7d4XcqX+V?=
 =?us-ascii?Q?Q8fpsG/GYvTVJgNQVP5binVMG1/G77+7Y9bZ+KTGw4jlnPg67717mClRKyMk?=
 =?us-ascii?Q?3ZdXQpNSghPpkSRdmMCxqyEBJ1E1Ty9055fZIRYXe5Zy97hL42uSQZHp163e?=
 =?us-ascii?Q?es07e34pFVlTrb4Od43HmQmy7u2e4YLI1nye0tgCXzmPB/Qy/nFJLsvUGTNE?=
 =?us-ascii?Q?W8DK8W6mCHfD33JYSRwt6ySh8X5Zhl1ldOZ1/icWnrN76ZLnLRD+sSatsUxT?=
 =?us-ascii?Q?VnzMEKmv0vDZBIfLGvnt33GXpxAFChA/XcLgoC1RN+8VW90DqXQIFnvZ5ela?=
 =?us-ascii?Q?h5Bo+94Lx+tYzOuPQEhaM+s8gxIKXzVdpsWISOoEglVY2Q5dont8MOAX1lZZ?=
 =?us-ascii?Q?kMhV44BjsfyZs2gnnJJes8mKaGFRRgClnmBAxB040D5Phcx6D3zgKWaLwVTc?=
 =?us-ascii?Q?kQmugZVtIeDl1C2/aAC+92hjjWxqK9BdmdbH/Y1+ko8BEJ2Wkotczs+SIDFs?=
 =?us-ascii?Q?Q19J2sVmYmrijYVpJGmxcPpKb3H+OTVJC00k5ll6sI08xmgQg0CNw/8BHJl7?=
 =?us-ascii?Q?QFOrUZ8kJhBLNC7C4+3Wy6u6W0QYrVGwMeC9qVKhkgd21sTyzpk1nsB//GcE?=
 =?us-ascii?Q?QuFUOx3rQLa1NqBq68W/Jh5scrwtDy9tbvayqol3Vbq3xtu6MCzw2/ccc3Eu?=
 =?us-ascii?Q?4VUvUs3h7fngkoKExrfkQVCrnb1X2oRKyS4LVIMbqeZvHILBAv8cqwMyiDtU?=
 =?us-ascii?Q?486W9jRwqC1NDfbvKyzyblef0bLbSEXXF1Fw7I0OrDppGn0cV+LcsFF2HhIo?=
 =?us-ascii?Q?7KH7fTjwblxFclWmnysZvtzYXZiLUk5zu1PieUCTsxg6hIjU40BbGFEIDEdU?=
 =?us-ascii?Q?hxHCqE14WXqUHSvs220DtoXQ5dNfkqyJflh4aaaF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fbee20ad-1898-4d41-6792-08dd6845297f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 06:54:01.4508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DIat5AzbPdu9tNGkjwqfVRMluAwES9PkkpB7v1A2jkZFVu4q/sw1CgPa0K8OYyXd/hgGcJKAYk0dGdRNZ6fBlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6456
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 06:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116168

This patch has wrong commit message title, will send a v2 for it.
Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Friday, March 21, 2025 0:14
> To: openembedded-devel@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [meta-oe][PATCH 4/4] libmad: patch CVE-2017-8372 and CVE-2017-83=
73
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Pick patch [1] from Debian based on [2].
>=20
> [1] https://salsa.debian.org/multimedia-team/libmad/-/raw/debian/0.15.1b-
> 11/debian/patches/length-check.patch?ref_type=3Dtags
> [2] https://security-tracker.debian.org/tracker/CVE-2017-8374
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../libmad/libmad/CVE-2017-8374.patch         | 830 ++++++++++++++++++
>  .../libmad/libmad_0.15.1b.bb                  |   1 +
>  2 files changed, 831 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-
> 8374.patch
>=20
> diff --git a/meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8374.patch
> b/meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8374.patch
> new file mode 100644
> index 0000000000..69a7153f07
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8374.patch
> @@ -0,0 +1,830 @@
> +From 05de6e0ddc2c911b725955d2af331ffd76aa8186 Mon Sep 17 00:00:00 2001
> +From: Kurt Roeckx <kurt@roeckx.be>
> +Date: Sun, 28 Jan 2018 19:26:36 +0100
> +Subject: [PATCH] Check the size before reading with mad_bit_read
> +
> +There are various cases where it attemps to read past the end of the buf=
fer
> +using mad_bit_read(). Most functions didn't even know the size of the bu=
ffer
> +they were reading from.
> +
> +Source: https://salsa.debian.org/multimedia-team/libmad/-/raw/debian/0.1=
5.1b-
> 11/debian/patches/length-check.patch?ref_type=3Dtags
> +
> +CVE: CVE-2017-8374
> +Upstream-Status: Inactive-Upstream [lastrelease: 2018]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + bit.c     |   3 +
> + frame.c   |  20 +++++-
> + layer12.c | 112 +++++++++++++++++++++++++++---
> + layer3.c  | 198 ++++++++++++++++++++++++++++++++++++++----------------
> + 4 files changed, 262 insertions(+), 71 deletions(-)
> +
> +diff --git a/bit.c b/bit.c
> +index c2bfb24..39ef50b 100644
> +--- a/bit.c
> ++++ b/bit.c
> +@@ -138,6 +138,9 @@ unsigned long mad_bit_read(struct mad_bitptr *bitptr=
,
> unsigned int len)
> + {
> +   register unsigned long value;
> +
> ++  if (len =3D=3D 0)
> ++    return 0;
> ++
> +   if (bitptr->left =3D=3D CHAR_BIT)
> +     bitptr->cache =3D *bitptr->byte;
> +
> +diff --git a/frame.c b/frame.c
> +index 0cb3d0f..4b3aea8 100644
> +--- a/frame.c
> ++++ b/frame.c
> +@@ -120,11 +120,18 @@ static
> + int decode_header(struct mad_header *header, struct mad_stream *stream)
> + {
> +   unsigned int index;
> ++  struct mad_bitptr bufend_ptr;
> +
> +   header->flags        =3D 0;
> +   header->private_bits =3D 0;
> +
> ++  mad_bit_init(&bufend_ptr, stream->bufend);
> ++
> +   /* header() */
> ++  if (mad_bit_length(&stream->ptr, &bufend_ptr) < 32) {
> ++    stream->error =3D MAD_ERROR_BUFLEN;
> ++    return -1;
> ++  }
> +
> +   /* syncword */
> +   mad_bit_skip(&stream->ptr, 11);
> +@@ -225,8 +232,13 @@ int decode_header(struct mad_header *header, struct
> mad_stream *stream)
> +   /* error_check() */
> +
> +   /* crc_check */
> +-  if (header->flags & MAD_FLAG_PROTECTION)
> ++  if (header->flags & MAD_FLAG_PROTECTION) {
> ++    if (mad_bit_length(&stream->ptr, &bufend_ptr) < 16) {
> ++      stream->error =3D MAD_ERROR_BUFLEN;
> ++      return -1;
> ++    }
> +     header->crc_target =3D mad_bit_read(&stream->ptr, 16);
> ++  }
> +
> +   return 0;
> + }
> +@@ -338,7 +350,7 @@ int mad_header_decode(struct mad_header *header,
> struct mad_stream *stream)
> +       stream->error =3D MAD_ERROR_BUFLEN;
> +       goto fail;
> +     }
> +-    else if (!(ptr[0] =3D=3D 0xff && (ptr[1] & 0xe0) =3D=3D 0xe0)) {
> ++    else if ((end - ptr >=3D 2) && !(ptr[0] =3D=3D 0xff && (ptr[1] & 0x=
e0) =3D=3D 0xe0)) {
> +       /* mark point where frame sync word was expected */
> +       stream->this_frame =3D ptr;
> +       stream->next_frame =3D ptr + 1;
> +@@ -361,6 +373,8 @@ int mad_header_decode(struct mad_header *header,
> struct mad_stream *stream)
> +     ptr =3D mad_bit_nextbyte(&stream->ptr);
> +   }
> +
> ++  stream->error =3D MAD_ERROR_NONE;
> ++
> +   /* begin processing */
> +   stream->this_frame =3D ptr;
> +   stream->next_frame =3D ptr + 1;  /* possibly bogus sync word */
> +@@ -413,7 +427,7 @@ int mad_header_decode(struct mad_header *header,
> struct mad_stream *stream)
> +     /* check that a valid frame header follows this frame */
> +
> +     ptr =3D stream->next_frame;
> +-    if (!(ptr[0] =3D=3D 0xff && (ptr[1] & 0xe0) =3D=3D 0xe0)) {
> ++    if ((end - ptr >=3D 2) && !(ptr[0] =3D=3D 0xff && (ptr[1] & 0xe0) =
=3D=3D 0xe0)) {
> +       ptr =3D stream->next_frame =3D stream->this_frame + 1;
> +       goto sync;
> +     }
> +diff --git a/layer12.c b/layer12.c
> +index 6981f9c..b6f4a2f 100644
> +--- a/layer12.c
> ++++ b/layer12.c
> +@@ -72,10 +72,18 @@ mad_fixed_t const linear_table[14] =3D {
> +  * DESCRIPTION:	decode one requantized Layer I sample from a bitstream
> +  */
> + static
> +-mad_fixed_t I_sample(struct mad_bitptr *ptr, unsigned int nb)
> ++mad_fixed_t I_sample(struct mad_bitptr *ptr, unsigned int nb, struct
> mad_stream *stream)
> + {
> +   mad_fixed_t sample;
> ++  struct mad_bitptr frameend_ptr;
> +
> ++  mad_bit_init(&frameend_ptr, stream->next_frame);
> ++
> ++  if (mad_bit_length(ptr, &frameend_ptr) < nb) {
> ++    stream->error =3D MAD_ERROR_LOSTSYNC;
> ++    stream->sync =3D 0;
> ++    return 0;
> ++  }
> +   sample =3D mad_bit_read(ptr, nb);
> +
> +   /* invert most significant bit, extend sign, then scale to fixed form=
at */
> +@@ -106,6 +114,10 @@ int mad_layer_I(struct mad_stream *stream, struct
> mad_frame *frame)
> +   struct mad_header *header =3D &frame->header;
> +   unsigned int nch, bound, ch, s, sb, nb;
> +   unsigned char allocation[2][32], scalefactor[2][32];
> ++  struct mad_bitptr bufend_ptr, frameend_ptr;
> ++
> ++  mad_bit_init(&bufend_ptr, stream->bufend);
> ++  mad_bit_init(&frameend_ptr, stream->next_frame);
> +
> +   nch =3D MAD_NCHANNELS(header);
> +
> +@@ -118,6 +130,11 @@ int mad_layer_I(struct mad_stream *stream, struct
> mad_frame *frame)
> +   /* check CRC word */
> +
> +   if (header->flags & MAD_FLAG_PROTECTION) {
> ++    if (mad_bit_length(&stream->ptr, &bufend_ptr)
> ++		< 4 * (bound * nch + (32 - bound))) {
> ++      stream->error =3D MAD_ERROR_BADCRC;
> ++      return -1;
> ++    }
> +     header->crc_check =3D
> +       mad_bit_crc(stream->ptr, 4 * (bound * nch + (32 - bound)),
> + 		  header->crc_check);
> +@@ -133,6 +150,11 @@ int mad_layer_I(struct mad_stream *stream, struct
> mad_frame *frame)
> +
> +   for (sb =3D 0; sb < bound; ++sb) {
> +     for (ch =3D 0; ch < nch; ++ch) {
> ++      if (mad_bit_length(&stream->ptr, &frameend_ptr) < 4) {
> ++	stream->error =3D MAD_ERROR_LOSTSYNC;
> ++	stream->sync =3D 0;
> ++	return -1;
> ++      }
> +       nb =3D mad_bit_read(&stream->ptr, 4);
> +
> +       if (nb =3D=3D 15) {
> +@@ -145,6 +167,11 @@ int mad_layer_I(struct mad_stream *stream, struct
> mad_frame *frame)
> +   }
> +
> +   for (sb =3D bound; sb < 32; ++sb) {
> ++    if (mad_bit_length(&stream->ptr, &frameend_ptr) < 4) {
> ++      stream->error =3D MAD_ERROR_LOSTSYNC;
> ++      stream->sync =3D 0;
> ++      return -1;
> ++    }
> +     nb =3D mad_bit_read(&stream->ptr, 4);
> +
> +     if (nb =3D=3D 15) {
> +@@ -161,6 +188,11 @@ int mad_layer_I(struct mad_stream *stream, struct
> mad_frame *frame)
> +   for (sb =3D 0; sb < 32; ++sb) {
> +     for (ch =3D 0; ch < nch; ++ch) {
> +       if (allocation[ch][sb]) {
> ++        if (mad_bit_length(&stream->ptr, &frameend_ptr) < 6) {
> ++	  stream->error =3D MAD_ERROR_LOSTSYNC;
> ++	  stream->sync =3D 0;
> ++	  return -1;
> ++	}
> + 	scalefactor[ch][sb] =3D mad_bit_read(&stream->ptr, 6);
> +
> + # if defined(OPT_STRICT)
> +@@ -185,8 +217,10 @@ int mad_layer_I(struct mad_stream *stream, struct
> mad_frame *frame)
> +       for (ch =3D 0; ch < nch; ++ch) {
> + 	nb =3D allocation[ch][sb];
> + 	frame->sbsample[ch][s][sb] =3D nb ?
> +-	  mad_f_mul(I_sample(&stream->ptr, nb),
> ++	  mad_f_mul(I_sample(&stream->ptr, nb, stream),
> + 		    sf_table[scalefactor[ch][sb]]) : 0;
> ++	if (stream->error !=3D 0)
> ++	  return -1;
> +       }
> +     }
> +
> +@@ -194,7 +228,14 @@ int mad_layer_I(struct mad_stream *stream, struct
> mad_frame *frame)
> +       if ((nb =3D allocation[0][sb])) {
> + 	mad_fixed_t sample;
> +
> +-	sample =3D I_sample(&stream->ptr, nb);
> ++	if (mad_bit_length(&stream->ptr, &frameend_ptr) < nb) {
> ++	  stream->error =3D MAD_ERROR_LOSTSYNC;
> ++	  stream->sync =3D 0;
> ++          return -1;
> ++	}
> ++	sample =3D I_sample(&stream->ptr, nb, stream);
> ++        if (stream->error !=3D 0)
> ++	  return -1;
> +
> + 	for (ch =3D 0; ch < nch; ++ch) {
> + 	  frame->sbsample[ch][s][sb] =3D
> +@@ -280,13 +321,21 @@ struct quantclass {
> + static
> + void II_samples(struct mad_bitptr *ptr,
> + 		struct quantclass const *quantclass,
> +-		mad_fixed_t output[3])
> ++		mad_fixed_t output[3], struct mad_stream *stream)
> + {
> +   unsigned int nb, s, sample[3];
> ++  struct mad_bitptr frameend_ptr;
> ++
> ++  mad_bit_init(&frameend_ptr, stream->next_frame);
> +
> +   if ((nb =3D quantclass->group)) {
> +     unsigned int c, nlevels;
> +
> ++    if (mad_bit_length(ptr, &frameend_ptr) < quantclass->bits) {
> ++      stream->error =3D MAD_ERROR_LOSTSYNC;
> ++      stream->sync =3D 0;
> ++      return;
> ++    }
> +     /* degrouping */
> +     c =3D mad_bit_read(ptr, quantclass->bits);
> +     nlevels =3D quantclass->nlevels;
> +@@ -299,8 +348,14 @@ void II_samples(struct mad_bitptr *ptr,
> +   else {
> +     nb =3D quantclass->bits;
> +
> +-    for (s =3D 0; s < 3; ++s)
> ++    for (s =3D 0; s < 3; ++s) {
> ++      if (mad_bit_length(ptr, &frameend_ptr) < nb) {
> ++	stream->error =3D MAD_ERROR_LOSTSYNC;
> ++	stream->sync =3D 0;
> ++	return;
> ++      }
> +       sample[s] =3D mad_bit_read(ptr, nb);
> ++    }
> +   }
> +
> +   for (s =3D 0; s < 3; ++s) {
> +@@ -336,6 +391,9 @@ int mad_layer_II(struct mad_stream *stream, struct
> mad_frame *frame)
> +   unsigned char const *offsets;
> +   unsigned char allocation[2][32], scfsi[2][32], scalefactor[2][32][3];
> +   mad_fixed_t samples[3];
> ++  struct mad_bitptr frameend_ptr;
> ++
> ++  mad_bit_init(&frameend_ptr, stream->next_frame);
> +
> +   nch =3D MAD_NCHANNELS(header);
> +
> +@@ -402,13 +460,24 @@ int mad_layer_II(struct mad_stream *stream, struct
> mad_frame *frame)
> +   for (sb =3D 0; sb < bound; ++sb) {
> +     nbal =3D bitalloc_table[offsets[sb]].nbal;
> +
> +-    for (ch =3D 0; ch < nch; ++ch)
> ++    for (ch =3D 0; ch < nch; ++ch) {
> ++      if (mad_bit_length(&stream->ptr, &frameend_ptr) < nbal) {
> ++	stream->error =3D MAD_ERROR_LOSTSYNC;
> ++	stream->sync =3D 0;
> ++	return -1;
> ++      }
> +       allocation[ch][sb] =3D mad_bit_read(&stream->ptr, nbal);
> ++    }
> +   }
> +
> +   for (sb =3D bound; sb < sblimit; ++sb) {
> +     nbal =3D bitalloc_table[offsets[sb]].nbal;
> +
> ++    if (mad_bit_length(&stream->ptr, &frameend_ptr) < nbal) {
> ++      stream->error =3D MAD_ERROR_LOSTSYNC;
> ++      stream->sync =3D 0;
> ++      return -1;
> ++    }
> +     allocation[0][sb] =3D
> +     allocation[1][sb] =3D mad_bit_read(&stream->ptr, nbal);
> +   }
> +@@ -417,8 +486,14 @@ int mad_layer_II(struct mad_stream *stream, struct
> mad_frame *frame)
> +
> +   for (sb =3D 0; sb < sblimit; ++sb) {
> +     for (ch =3D 0; ch < nch; ++ch) {
> +-      if (allocation[ch][sb])
> ++      if (allocation[ch][sb]) {
> ++	if (mad_bit_length(&stream->ptr, &frameend_ptr) < 2) {
> ++	  stream->error =3D MAD_ERROR_LOSTSYNC;
> ++	  stream->sync =3D 0;
> ++	  return -1;
> ++	}
> + 	scfsi[ch][sb] =3D mad_bit_read(&stream->ptr, 2);
> ++      }
> +     }
> +   }
> +
> +@@ -441,6 +516,11 @@ int mad_layer_II(struct mad_stream *stream, struct
> mad_frame *frame)
> +   for (sb =3D 0; sb < sblimit; ++sb) {
> +     for (ch =3D 0; ch < nch; ++ch) {
> +       if (allocation[ch][sb]) {
> ++	if (mad_bit_length(&stream->ptr, &frameend_ptr) < 6) {
> ++	  stream->error =3D MAD_ERROR_LOSTSYNC;
> ++	  stream->sync =3D 0;
> ++	  return -1;
> ++	}
> + 	scalefactor[ch][sb][0] =3D mad_bit_read(&stream->ptr, 6);
> +
> + 	switch (scfsi[ch][sb]) {
> +@@ -451,11 +531,21 @@ int mad_layer_II(struct mad_stream *stream, struct
> mad_frame *frame)
> + 	  break;
> +
> + 	case 0:
> ++	  if (mad_bit_length(&stream->ptr, &frameend_ptr) < 6) {
> ++	    stream->error =3D MAD_ERROR_LOSTSYNC;
> ++	    stream->sync =3D 0;
> ++	    return -1;
> ++	  }
> + 	  scalefactor[ch][sb][1] =3D mad_bit_read(&stream->ptr, 6);
> + 	  /* fall through */
> +
> + 	case 1:
> + 	case 3:
> ++	  if (mad_bit_length(&stream->ptr, &frameend_ptr) < 6) {
> ++	    stream->error =3D MAD_ERROR_LOSTSYNC;
> ++	    stream->sync =3D 0;
> ++	    return -1;
> ++	  }
> + 	  scalefactor[ch][sb][2] =3D mad_bit_read(&stream->ptr, 6);
> + 	}
> +
> +@@ -487,7 +577,9 @@ int mad_layer_II(struct mad_stream *stream, struct
> mad_frame *frame)
> + 	if ((index =3D allocation[ch][sb])) {
> + 	  index =3D offset_table[bitalloc_table[offsets[sb]].offset][index - 1=
];
> +
> +-	  II_samples(&stream->ptr, &qc_table[index], samples);
> ++	  II_samples(&stream->ptr, &qc_table[index], samples, stream);
> ++	  if (stream->error !=3D 0)
> ++            return -1;
> +
> + 	  for (s =3D 0; s < 3; ++s) {
> + 	    frame->sbsample[ch][3 * gr + s][sb] =3D
> +@@ -505,7 +597,9 @@ int mad_layer_II(struct mad_stream *stream, struct
> mad_frame *frame)
> +       if ((index =3D allocation[0][sb])) {
> + 	index =3D offset_table[bitalloc_table[offsets[sb]].offset][index - 1];
> +
> +-	II_samples(&stream->ptr, &qc_table[index], samples);
> ++	II_samples(&stream->ptr, &qc_table[index], samples, stream);
> ++	if (stream->error !=3D 0)
> ++          return -1;
> +
> + 	for (ch =3D 0; ch < nch; ++ch) {
> + 	  for (s =3D 0; s < 3; ++s) {
> +diff --git a/layer3.c b/layer3.c
> +index 7dc4ca6..59a81ed 100644
> +--- a/layer3.c
> ++++ b/layer3.c
> +@@ -598,7 +598,8 @@ enum mad_error III_sideinfo(struct mad_bitptr *ptr,
> unsigned int nch,
> + static
> + unsigned int III_scalefactors_lsf(struct mad_bitptr *ptr,
> + 				  struct channel *channel,
> +-				  struct channel *gr1ch, int mode_extension)
> ++				  struct channel *gr1ch, int mode_extension,
> ++				  unsigned int bits_left, unsigned int *part2_length)
> + {
> +   struct mad_bitptr start;
> +   unsigned int scalefac_compress, index, slen[4], part, n, i;
> +@@ -644,8 +645,12 @@ unsigned int III_scalefactors_lsf(struct mad_bitptr=
 *ptr,
> +
> +     n =3D 0;
> +     for (part =3D 0; part < 4; ++part) {
> +-      for (i =3D 0; i < nsfb[part]; ++i)
> ++      for (i =3D 0; i < nsfb[part]; ++i) {
> ++	if (bits_left < slen[part])
> ++	  return MAD_ERROR_BADSCFSI;
> + 	channel->scalefac[n++] =3D mad_bit_read(ptr, slen[part]);
> ++	bits_left -=3D slen[part];
> ++      }
> +     }
> +
> +     while (n < 39)
> +@@ -690,7 +695,10 @@ unsigned int III_scalefactors_lsf(struct mad_bitptr=
 *ptr,
> +       max =3D (1 << slen[part]) - 1;
> +
> +       for (i =3D 0; i < nsfb[part]; ++i) {
> ++	if (bits_left < slen[part])
> ++	  return MAD_ERROR_BADSCFSI;
> + 	is_pos =3D mad_bit_read(ptr, slen[part]);
> ++	bits_left -=3D slen[part];
> +
> + 	channel->scalefac[n] =3D is_pos;
> + 	gr1ch->scalefac[n++] =3D (is_pos =3D=3D max);
> +@@ -703,7 +711,8 @@ unsigned int III_scalefactors_lsf(struct mad_bitptr =
*ptr,
> +     }
> +   }
> +
> +-  return mad_bit_length(&start, ptr);
> ++  *part2_length =3D mad_bit_length(&start, ptr);
> ++  return MAD_ERROR_NONE;
> + }
> +
> + /*
> +@@ -712,7 +721,8 @@ unsigned int III_scalefactors_lsf(struct mad_bitptr =
*ptr,
> +  */
> + static
> + unsigned int III_scalefactors(struct mad_bitptr *ptr, struct channel *c=
hannel,
> +-			      struct channel const *gr0ch, unsigned int scfsi)
> ++			      struct channel const *gr0ch, unsigned int scfsi,
> ++			      unsigned int bits_left, unsigned int *part2_length)
> + {
> +   struct mad_bitptr start;
> +   unsigned int slen1, slen2, sfbi;
> +@@ -728,12 +738,20 @@ unsigned int III_scalefactors(struct mad_bitptr *p=
tr,
> struct channel *channel,
> +     sfbi =3D 0;
> +
> +     nsfb =3D (channel->flags & mixed_block_flag) ? 8 + 3 * 3 : 6 * 3;
> +-    while (nsfb--)
> ++    while (nsfb--) {
> ++      if (bits_left < slen1)
> ++	return MAD_ERROR_BADSCFSI;
> +       channel->scalefac[sfbi++] =3D mad_bit_read(ptr, slen1);
> ++      bits_left -=3D slen1;
> ++    }
> +
> +     nsfb =3D 6 * 3;
> +-    while (nsfb--)
> ++    while (nsfb--) {
> ++      if (bits_left < slen2)
> ++	return MAD_ERROR_BADSCFSI;
> +       channel->scalefac[sfbi++] =3D mad_bit_read(ptr, slen2);
> ++      bits_left -=3D slen2;
> ++    }
> +
> +     nsfb =3D 1 * 3;
> +     while (nsfb--)
> +@@ -745,8 +763,12 @@ unsigned int III_scalefactors(struct mad_bitptr *pt=
r,
> struct channel *channel,
> + 	channel->scalefac[sfbi] =3D gr0ch->scalefac[sfbi];
> +     }
> +     else {
> +-      for (sfbi =3D 0; sfbi < 6; ++sfbi)
> ++      for (sfbi =3D 0; sfbi < 6; ++sfbi) {
> ++	if (bits_left < slen1)
> ++	  return MAD_ERROR_BADSCFSI;
> + 	channel->scalefac[sfbi] =3D mad_bit_read(ptr, slen1);
> ++	bits_left -=3D slen1;
> ++      }
> +     }
> +
> +     if (scfsi & 0x4) {
> +@@ -754,8 +776,12 @@ unsigned int III_scalefactors(struct mad_bitptr *pt=
r,
> struct channel *channel,
> + 	channel->scalefac[sfbi] =3D gr0ch->scalefac[sfbi];
> +     }
> +     else {
> +-      for (sfbi =3D 6; sfbi < 11; ++sfbi)
> ++      for (sfbi =3D 6; sfbi < 11; ++sfbi) {
> ++	if (bits_left < slen1)
> ++	  return MAD_ERROR_BADSCFSI;
> + 	channel->scalefac[sfbi] =3D mad_bit_read(ptr, slen1);
> ++	bits_left -=3D slen1;
> ++      }
> +     }
> +
> +     if (scfsi & 0x2) {
> +@@ -763,8 +789,12 @@ unsigned int III_scalefactors(struct mad_bitptr *pt=
r,
> struct channel *channel,
> + 	channel->scalefac[sfbi] =3D gr0ch->scalefac[sfbi];
> +     }
> +     else {
> +-      for (sfbi =3D 11; sfbi < 16; ++sfbi)
> ++      for (sfbi =3D 11; sfbi < 16; ++sfbi) {
> ++	if (bits_left < slen2)
> ++	  return MAD_ERROR_BADSCFSI;
> + 	channel->scalefac[sfbi] =3D mad_bit_read(ptr, slen2);
> ++	bits_left -=3D slen2;
> ++      }
> +     }
> +
> +     if (scfsi & 0x1) {
> +@@ -772,14 +802,19 @@ unsigned int III_scalefactors(struct mad_bitptr *p=
tr,
> struct channel *channel,
> + 	channel->scalefac[sfbi] =3D gr0ch->scalefac[sfbi];
> +     }
> +     else {
> +-      for (sfbi =3D 16; sfbi < 21; ++sfbi)
> ++      for (sfbi =3D 16; sfbi < 21; ++sfbi) {
> ++	if (bits_left < slen2)
> ++	  return MAD_ERROR_BADSCFSI;
> + 	channel->scalefac[sfbi] =3D mad_bit_read(ptr, slen2);
> ++	bits_left -=3D slen2;
> ++      }
> +     }
> +
> +     channel->scalefac[21] =3D 0;
> +   }
> +
> +-  return mad_bit_length(&start, ptr);
> ++  *part2_length =3D mad_bit_length(&start, ptr);
> ++  return MAD_ERROR_NONE;
> + }
> +
> + /*
> +@@ -933,19 +968,17 @@ static
> + enum mad_error III_huffdecode(struct mad_bitptr *ptr, mad_fixed_t xr[57=
6],
> + 			      struct channel *channel,
> + 			      unsigned char const *sfbwidth,
> +-			      unsigned int part2_length)
> ++			      signed int part3_length)
> + {
> +   signed int exponents[39], exp;
> +   signed int const *expptr;
> +   struct mad_bitptr peek;
> +-  signed int bits_left, cachesz;
> ++  signed int bits_left, cachesz, fakebits;
> +   register mad_fixed_t *xrptr;
> +   mad_fixed_t const *sfbound;
> +   register unsigned long bitcache;
> +
> +-  bits_left =3D (signed) channel->part2_3_length - (signed) part2_lengt=
h;
> +-  if (bits_left < 0)
> +-    return MAD_ERROR_BADPART3LEN;
> ++  bits_left =3D part3_length;
> +
> +   III_exponents(channel, sfbwidth, exponents);
> +
> +@@ -956,8 +989,12 @@ enum mad_error III_huffdecode(struct mad_bitptr *pt=
r,
> mad_fixed_t xr[576],
> +   cachesz  =3D mad_bit_bitsleft(&peek);
> +   cachesz +=3D ((32 - 1 - 24) + (24 - cachesz)) & ~7;
> +
> ++  if (bits_left < cachesz) {
> ++    cachesz =3D bits_left;
> ++  }
> +   bitcache   =3D mad_bit_read(&peek, cachesz);
> +   bits_left -=3D cachesz;
> ++  fakebits =3D 0;
> +
> +   xrptr =3D &xr[0];
> +
> +@@ -986,7 +1023,7 @@ enum mad_error III_huffdecode(struct mad_bitptr *pt=
r,
> mad_fixed_t xr[576],
> +
> +     big_values =3D channel->big_values;
> +
> +-    while (big_values-- && cachesz + bits_left > 0) {
> ++    while (big_values-- && cachesz + bits_left - fakebits > 0) {
> +       union huffpair const *pair;
> +       unsigned int clumpsz, value;
> +       register mad_fixed_t requantized;
> +@@ -1023,10 +1060,19 @@ enum mad_error III_huffdecode(struct mad_bitptr
> *ptr, mad_fixed_t xr[576],
> + 	unsigned int bits;
> +
> + 	bits       =3D ((32 - 1 - 21) + (21 - cachesz)) & ~7;
> ++	if (bits_left < bits) {
> ++	  bits =3D bits_left;
> ++	}
> + 	bitcache   =3D (bitcache << bits) | mad_bit_read(&peek, bits);
> + 	cachesz   +=3D bits;
> + 	bits_left -=3D bits;
> +       }
> ++      if (cachesz < 21) {
> ++	unsigned int bits =3D 21 - cachesz;
> ++	bitcache <<=3D bits;
> ++	cachesz +=3D bits;
> ++	fakebits +=3D bits;
> ++      }
> +
> +       /* hcod (0..19) */
> +
> +@@ -1041,6 +1087,8 @@ enum mad_error III_huffdecode(struct mad_bitptr *p=
tr,
> mad_fixed_t xr[576],
> +       }
> +
> +       cachesz -=3D pair->value.hlen;
> ++      if (cachesz < fakebits)
> ++	return MAD_ERROR_BADHUFFDATA;
> +
> +       if (linbits) {
> + 	/* x (0..14) */
> +@@ -1054,10 +1102,15 @@ enum mad_error III_huffdecode(struct mad_bitptr
> *ptr, mad_fixed_t xr[576],
> +
> + 	case 15:
> + 	  if (cachesz < linbits + 2) {
> +-	    bitcache   =3D (bitcache << 16) | mad_bit_read(&peek, 16);
> +-	    cachesz   +=3D 16;
> +-	    bits_left -=3D 16;
> ++	    unsigned int bits =3D 16;
> ++	    if (bits_left < 16)
> ++	      bits =3D bits_left;
> ++	    bitcache   =3D (bitcache << bits) | mad_bit_read(&peek, bits);
> ++	    cachesz   +=3D bits;
> ++	    bits_left -=3D bits;
> + 	  }
> ++	  if (cachesz - fakebits < linbits)
> ++	    return MAD_ERROR_BADHUFFDATA;
> +
> + 	  value +=3D MASK(bitcache, cachesz, linbits);
> + 	  cachesz -=3D linbits;
> +@@ -1074,6 +1127,8 @@ enum mad_error III_huffdecode(struct mad_bitptr *p=
tr,
> mad_fixed_t xr[576],
> + 	  }
> +
> + 	x_final:
> ++	  if (cachesz - fakebits < 1)
> ++	    return MAD_ERROR_BADHUFFDATA;
> + 	  xrptr[0] =3D MASK1BIT(bitcache, cachesz--) ?
> + 	    -requantized : requantized;
> + 	}
> +@@ -1089,10 +1144,15 @@ enum mad_error III_huffdecode(struct mad_bitptr
> *ptr, mad_fixed_t xr[576],
> +
> + 	case 15:
> + 	  if (cachesz < linbits + 1) {
> +-	    bitcache   =3D (bitcache << 16) | mad_bit_read(&peek, 16);
> +-	    cachesz   +=3D 16;
> +-	    bits_left -=3D 16;
> ++	    unsigned int bits =3D 16;
> ++	    if (bits_left < 16)
> ++	      bits =3D bits_left;
> ++	    bitcache   =3D (bitcache << bits) | mad_bit_read(&peek, bits);
> ++	    cachesz   +=3D bits;
> ++	    bits_left -=3D bits;
> + 	  }
> ++	  if (cachesz - fakebits < linbits)
> ++	    return MAD_ERROR_BADHUFFDATA;
> +
> + 	  value +=3D MASK(bitcache, cachesz, linbits);
> + 	  cachesz -=3D linbits;
> +@@ -1109,6 +1169,8 @@ enum mad_error III_huffdecode(struct mad_bitptr *p=
tr,
> mad_fixed_t xr[576],
> + 	  }
> +
> + 	y_final:
> ++	  if (cachesz - fakebits < 1)
> ++	    return MAD_ERROR_BADHUFFDATA;
> + 	  xrptr[1] =3D MASK1BIT(bitcache, cachesz--) ?
> + 	    -requantized : requantized;
> + 	}
> +@@ -1128,6 +1190,8 @@ enum mad_error III_huffdecode(struct mad_bitptr *p=
tr,
> mad_fixed_t xr[576],
> + 	    requantized =3D reqcache[value] =3D III_requantize(value, exp);
> + 	  }
> +
> ++	  if (cachesz - fakebits < 1)
> ++	    return MAD_ERROR_BADHUFFDATA;
> + 	  xrptr[0] =3D MASK1BIT(bitcache, cachesz--) ?
> + 	    -requantized : requantized;
> + 	}
> +@@ -1146,6 +1210,8 @@ enum mad_error III_huffdecode(struct mad_bitptr *p=
tr,
> mad_fixed_t xr[576],
> + 	    requantized =3D reqcache[value] =3D III_requantize(value, exp);
> + 	  }
> +
> ++	  if (cachesz - fakebits < 1)
> ++	    return MAD_ERROR_BADHUFFDATA;
> + 	  xrptr[1] =3D MASK1BIT(bitcache, cachesz--) ?
> + 	    -requantized : requantized;
> + 	}
> +@@ -1155,9 +1221,6 @@ enum mad_error III_huffdecode(struct mad_bitptr *p=
tr,
> mad_fixed_t xr[576],
> +     }
> +   }
> +
> +-  if (cachesz + bits_left < 0)
> +-    return MAD_ERROR_BADHUFFDATA;  /* big_values overrun */
> +-
> +   /* count1 */
> +   {
> +     union huffquad const *table;
> +@@ -1167,15 +1230,24 @@ enum mad_error III_huffdecode(struct mad_bitptr
> *ptr, mad_fixed_t xr[576],
> +
> +     requantized =3D III_requantize(1, exp);
> +
> +-    while (cachesz + bits_left > 0 && xrptr <=3D &xr[572]) {
> ++    while (cachesz + bits_left - fakebits > 0 && xrptr <=3D &xr[572]) {
> +       union huffquad const *quad;
> +
> +       /* hcod (1..6) */
> +
> +       if (cachesz < 10) {
> +-	bitcache   =3D (bitcache << 16) | mad_bit_read(&peek, 16);
> +-	cachesz   +=3D 16;
> +-	bits_left -=3D 16;
> ++	unsigned int bits =3D 16;
> ++	if (bits_left < 16)
> ++	  bits =3D bits_left;
> ++	bitcache   =3D (bitcache << bits) | mad_bit_read(&peek, bits);
> ++	cachesz   +=3D bits;
> ++	bits_left -=3D bits;
> ++      }
> ++      if (cachesz < 10) {
> ++	unsigned int bits =3D 10 - cachesz;
> ++	bitcache <<=3D bits;
> ++	cachesz +=3D bits;
> ++	fakebits +=3D bits;
> +       }
> +
> +       quad =3D &table[MASK(bitcache, cachesz, 4)];
> +@@ -1188,6 +1260,11 @@ enum mad_error III_huffdecode(struct mad_bitptr *=
ptr,
> mad_fixed_t xr[576],
> + 		      MASK(bitcache, cachesz, quad->ptr.bits)];
> +       }
> +
> ++      if (cachesz - fakebits < quad->value.hlen + quad->value.v
> ++        + quad->value.w + quad->value.x + quad->value.y)
> ++	/* We don't have enough bits to read one more entry, consider them
> ++	 * stuffing bits. */
> ++	break;
> +       cachesz -=3D quad->value.hlen;
> +
> +       if (xrptr =3D=3D sfbound) {
> +@@ -1236,22 +1313,8 @@ enum mad_error III_huffdecode(struct mad_bitptr *=
ptr,
> mad_fixed_t xr[576],
> +
> +       xrptr +=3D 2;
> +     }
> +-
> +-    if (cachesz + bits_left < 0) {
> +-# if 0 && defined(DEBUG)
> +-      fprintf(stderr, "huffman count1 overrun (%d bits)\n",
> +-	      -(cachesz + bits_left));
> +-# endif
> +-
> +-      /* technically the bitstream is misformatted, but apparently
> +-	 some encoders are just a bit sloppy with stuffing bits */
> +-
> +-      xrptr -=3D 4;
> +-    }
> +   }
> +
> +-  assert(-bits_left <=3D MAD_BUFFER_GUARD * CHAR_BIT);
> +-
> + # if 0 && defined(DEBUG)
> +   if (bits_left < 0)
> +     fprintf(stderr, "read %d bits too many\n", -bits_left);
> +@@ -2348,10 +2411,11 @@ void III_freqinver(mad_fixed_t sample[18][32],
> unsigned int sb)
> +  */
> + static
> + enum mad_error III_decode(struct mad_bitptr *ptr, struct mad_frame *fra=
me,
> +-			  struct sideinfo *si, unsigned int nch)
> ++			  struct sideinfo *si, unsigned int nch, unsigned int md_len)
> + {
> +   struct mad_header *header =3D &frame->header;
> +   unsigned int sfreqi, ngr, gr;
> ++  int bits_left =3D md_len * CHAR_BIT;
> +
> +   {
> +     unsigned int sfreq;
> +@@ -2383,6 +2447,7 @@ enum mad_error III_decode(struct mad_bitptr *ptr,
> struct mad_frame *frame,
> +     for (ch =3D 0; ch < nch; ++ch) {
> +       struct channel *channel =3D &granule->ch[ch];
> +       unsigned int part2_length;
> ++      unsigned int part3_length;
> +
> +       sfbwidth[ch] =3D sfbwidth_table[sfreqi].l;
> +       if (channel->block_type =3D=3D 2) {
> +@@ -2391,18 +2456,30 @@ enum mad_error III_decode(struct mad_bitptr *ptr=
,
> struct mad_frame *frame,
> +       }
> +
> +       if (header->flags & MAD_FLAG_LSF_EXT) {
> +-	part2_length =3D III_scalefactors_lsf(ptr, channel,
> ++	error =3D III_scalefactors_lsf(ptr, channel,
> + 					    ch =3D=3D 0 ? 0 : &si->gr[1].ch[1],
> +-					    header->mode_extension);
> ++					    header->mode_extension, bits_left,
> &part2_length);
> +       }
> +       else {
> +-	part2_length =3D III_scalefactors(ptr, channel, &si->gr[0].ch[ch],
> +-					gr =3D=3D 0 ? 0 : si->scfsi[ch]);
> ++	error =3D III_scalefactors(ptr, channel, &si->gr[0].ch[ch],
> ++					gr =3D=3D 0 ? 0 : si->scfsi[ch], bits_left,
> &part2_length);
> +       }
> ++      if (error)
> ++        return error;
> +
> +-      error =3D III_huffdecode(ptr, xr[ch], channel, sfbwidth[ch], part=
2_length);
> ++      bits_left -=3D part2_length;
> ++
> ++      if (part2_length > channel->part2_3_length)
> ++        return MAD_ERROR_BADPART3LEN;
> ++
> ++      part3_length =3D channel->part2_3_length - part2_length;
> ++      if (part3_length > bits_left)
> ++        return MAD_ERROR_BADPART3LEN;
> ++
> ++      error =3D III_huffdecode(ptr, xr[ch], channel, sfbwidth[ch], part=
3_length);
> +       if (error)
> + 	return error;
> ++      bits_left -=3D part3_length;
> +     }
> +
> +     /* joint stereo processing */
> +@@ -2519,11 +2596,13 @@ int mad_layer_III(struct mad_stream *stream, str=
uct
> mad_frame *frame)
> +   unsigned int nch, priv_bitlen, next_md_begin =3D 0;
> +   unsigned int si_len, data_bitlen, md_len;
> +   unsigned int frame_space, frame_used, frame_free;
> +-  struct mad_bitptr ptr;
> ++  struct mad_bitptr ptr, bufend_ptr;
> +   struct sideinfo si;
> +   enum mad_error error;
> +   int result =3D 0;
> +
> ++  mad_bit_init(&bufend_ptr, stream->bufend);
> ++
> +   /* allocate Layer III dynamic structures */
> +
> +   if (stream->main_data =3D=3D 0) {
> +@@ -2587,14 +2666,15 @@ int mad_layer_III(struct mad_stream *stream, str=
uct
> mad_frame *frame)
> +     unsigned long header;
> +
> +     mad_bit_init(&peek, stream->next_frame);
> ++    if (mad_bit_length(&peek, &bufend_ptr) >=3D 57) {
> ++      header =3D mad_bit_read(&peek, 32);
> ++      if ((header & 0xffe60000L) /* syncword | layer */ =3D=3D 0xffe200=
00L) {
> ++        if (!(header & 0x00010000L))  /* protection_bit */
> ++	  mad_bit_skip(&peek, 16);  /* crc_check */
> +
> +-    header =3D mad_bit_read(&peek, 32);
> +-    if ((header & 0xffe60000L) /* syncword | layer */ =3D=3D 0xffe20000=
L) {
> +-      if (!(header & 0x00010000L))  /* protection_bit */
> +-	mad_bit_skip(&peek, 16);  /* crc_check */
> +-
> +-      next_md_begin =3D
> +-	mad_bit_read(&peek, (header & 0x00080000L) /* ID */ ? 9 : 8);
> ++        next_md_begin =3D
> ++	  mad_bit_read(&peek, (header & 0x00080000L) /* ID */ ? 9 : 8);
> ++      }
> +     }
> +
> +     mad_bit_finish(&peek);
> +@@ -2653,7 +2733,7 @@ int mad_layer_III(struct mad_stream *stream, struc=
t
> mad_frame *frame)
> +   /* decode main_data */
> +
> +   if (result =3D=3D 0) {
> +-    error =3D III_decode(&ptr, frame, &si, nch);
> ++    error =3D III_decode(&ptr, frame, &si, nch, md_len);
> +     if (error) {
> +       stream->error =3D error;
> +       result =3D -1;
> diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-
> oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
> index b6668980da..3f5a052906 100644
> --- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
> +++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "https://downloads.sourceforge.net/mad/libm=
ad-
> ${PV}.tar.gz \
>      file://automake-foreign.patch \
>      file://0001-configure-Respect-the-cflags-from-environment.patch \
>      file://CVE-2017-8372_CVE-2017-8373.patch \
> +    file://CVE-2017-8374.patch \
>  "
>  SRC_URI:append:toolchain-clang =3D " file://0004-Remove-clang-unsupporte=
d-
> compiler-flags.patch "
>=20

