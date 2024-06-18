Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCBDC27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 07:43:41 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.89])
 by mx.groups.io with SMTP id smtpd.web11.80655.1718696614705093018
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jun 2024 00:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=XOoMNhMS;
 spf=pass (domain: siemens.com, ip: 40.107.20.89, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJg+vaNUvgdw8sy65K0/fgZO9plWT1KtCZWsAC9MquOGN+sMHBPtRaByJrB7Y179M2+DtB/Xna385/KxGU6gagJgWYZBx5Ska3IutkPhToygPB/bU3kxoS7614lae06Pke6fLh43EnrJsZJtcCVvMkxWsT682/wrUxd9rFkUi4GWKAV1qnglAlsv5J2TjSAzFKv80NCTLNI2pLM93ktw81JJXj0vB5yA/2GzZizKjntV2oS5zbDIg2RCmM7EZXaLfpdv0x9nbCleW8sYC2u/35D4nK/ch8UuUusfUGgVHT9gGdNZMmjl/3fqZ1HpSx9d7MD0F1+9kwqB975AT893Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DbzKgbX+Mnh3iirm95Uto3ZRfel6te7/+zOnRlsDc4=;
 b=mugK8zWMkKc7DweEu86nvU29B6yjAWKEUiRmGzeqMWng7DwB5vdHaf41DOKpsGyt1Hc1o4meOcgPhjkWEJ/Vbs6r/UKgEU0h17bcN89xiBC6G6LOo9mIRtqkPXSF+7UI9K+1HT9QHQ35xFD9c8nGg0eB9shMugfX+QCbOEe2P6EWUZc8ujnMEX8bEiQ0qEWtu5sstlYjSophNVDEXtnyW8CkXqKuEcmFkDUgVyNg8yNR4+atmnhwl/oxrCbUzuw0/Y8eW4ffR64xWkoDFw8O8Uvj/9sEzZdfGLiuakYTbIL7RGSwJhhRg/B/SOo8KYzvAfQcUtm3HQzR1JiSX/gFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DbzKgbX+Mnh3iirm95Uto3ZRfel6te7/+zOnRlsDc4=;
 b=XOoMNhMSAxo/qlsC0aIRS0h48E6Ao/z5HcRBlG1rWttd5aes3aHBYF9AE39VDiXz9YKc1scV3V7Yu6vJSvbxyQwjwJUxGFhAstxSwpOI76mCHDoF974etoQmlSU5Dc7DRLSxgaE4CmEHpYSBCEEi0J381ORjuW9gOunW2qalvqwxsLCx1WU9K0VfoJjjnMlTTN+miiHww17ZONvtg4vJfDWW3Jcj45yjDlCPYKmmenplon8cDNucXZOXXmionEBxi0lONHp6533xReQ3T2PZc1xEeoRjrz0rIDVgyeJJuePmYxbLYB+siHb/RvUqKebyCT9xvDRqr9EVzm9/JDd9hA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA2PR10MB8961.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:415::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 07:43:31 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 07:43:31 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [meta-oe][master][scarthgap][PATCH v2] jemalloc: add +git to
 version
Thread-Topic: [meta-oe][master][scarthgap][PATCH v2] jemalloc: add +git to
 version
Thread-Index: AQHarIDLpnQupRxLsUW7AZqtYIu7U7HNTUTA
Date: Tue, 18 Jun 2024 07:43:31 +0000
Message-ID: 
 <AS1PR10MB569738F5BF3E29ED7D8AAC92FDCE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240522194603.26231-1-peter.marko@siemens.com>
In-Reply-To: <20240522194603.26231-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=764299db-2a7c-4acb-94fa-1c88bed365f5;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-06-18T07:42:57Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA2PR10MB8961:EE_
x-ms-office365-filtering-correlation-id: 3f40be4f-a9b6-473f-c3a3-08dc8f6a59eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?tBGjVgUDSob7r7tvOMnshCa2ij5c51ZB7D+JZ3X4J8q9kXiOa8hzPrgeh2+g?=
 =?us-ascii?Q?mq5Da1K8fdxKz2IrlBPsku6SdQ2b/w9NB/JhKFc6ePjFQhWRwPd7UYvN1KWs?=
 =?us-ascii?Q?xwzpE32QolZFVuNVw5NVCaD5u1OH5YTPjc49mpSURs4SeO9I2M0eTrdfcxq2?=
 =?us-ascii?Q?LQmwJUsmZzfwin+rHUcWaYxwLPwpQ8inGLY/YE/5qr8ShHiX8Wfv0r5X4Dwn?=
 =?us-ascii?Q?2BeYNiffzA45Y5VomsncBYEZ9SmxBHXGdUp6pnGQmybBabDazUvE/WQo8PHM?=
 =?us-ascii?Q?W5WLvky+fd/GSI4/jkTV9k65rE+uUlis7TyGRHDCl8UVBz+eiuziWHlU006n?=
 =?us-ascii?Q?kcn4zo/QLgfkSGvozQSkGJCuhYjzBoWfmXNfg1rKTtG4SDgPmh7zehpCskyW?=
 =?us-ascii?Q?NNxWdY6f/OXtrSxQr1tiG9evkoXrZXgyKjlrg/7R1+LjeMBnIspx7MgucObB?=
 =?us-ascii?Q?hv45WBGmu0QPMMLXbITzyfY6tDvaygg9fTZ0y5swHx/2KxrusCpucfs99lWq?=
 =?us-ascii?Q?3fWNwZnjyhdYW10O16xPPO4pX7GmglkE8viO2oDen+UhxttvwXAVeL2RJaPY?=
 =?us-ascii?Q?RVRgjPOuyCgMj2hIGi9vQqEQ7/kXJiZ2dsmphwemXHJmvUFP1/2yM8mRLo7A?=
 =?us-ascii?Q?0wRZKweArTQkxaVkPy3/Ud/hWcP8bdPy8neku4secIf4AE3CmB9Vg4tjr2qq?=
 =?us-ascii?Q?aAe2iCA3k1iARY//KcFDK3NloUFZXpxkMkVkQVXAGkc03lXBabR1Jtwkkv80?=
 =?us-ascii?Q?fgfDznUBYPStNjAkzX6ule9mclHM9ZI65KR+EJYwNvqB5nxnZL0StcT5bHYx?=
 =?us-ascii?Q?iQeVzrV7RM3XI4fk6Vn9QH2WUKsRV1mg6QBtJa2ub1/XZq8zCVkz/TVQcTYM?=
 =?us-ascii?Q?hmYh14OABPv0h7+9yXRPBgQmtOvSJcG97VCzGltvEdXU6JuOkc/ZYyYAQdmO?=
 =?us-ascii?Q?zLs4kZbSa0KGSnRA3/yKI4FMrhyYpf4AC0r+BYvtyKz/AvnmbcGLfVwRyAvG?=
 =?us-ascii?Q?Uewdh+SThNB1za2UjxBbXbSKsElP/alIfbjLhwE1yk7khBZAMsWPm70O2wTO?=
 =?us-ascii?Q?vGXZewzzAksG4CuntY/9+PZwIJwsgso25odQS/sievP1tmBBT+hs3iTjlcsI?=
 =?us-ascii?Q?WpnvT+oYHsEJcLJ7sKySaxXxq1eaSATqR8jXf3IBGZRsb2Ss6vxWdRKf4b0Q?=
 =?us-ascii?Q?Jqlp2Gaq3vIALjPs6NC61o2oTmTYxCUhgn/yLNz8XaDJtG/HaOB0hkZYiEDF?=
 =?us-ascii?Q?GpGxTgMPqQXsi0+kY+pr2UJm3UL8eIikGyINVk9nxj5VTM3bdn8XI9XMNuca?=
 =?us-ascii?Q?TMGe5T/H8ccTkbGxB7nF8jprspar6ZZnxHZfrBMm1TLqtzXhDk7bqUA2w3Iq?=
 =?us-ascii?Q?N1T+z9Q=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wGJN+9lIq1lNyGRyGFMsZnNKHuQJXlbfglWTx6RGxznm0clupIsn9L00tnV3?=
 =?us-ascii?Q?pJ0pZrrKjrKun2o3SkBeGRLDfxWWosoZzJ94CWP5OWnofS6Rbj1GFosXjmTT?=
 =?us-ascii?Q?UORtTrW2MgCKPBAcpxkCimauS99mcuilzV5NcjoITONWRit5/A0mlx0vOKDy?=
 =?us-ascii?Q?/1IpHl4K0+O3ZYtDpyrfpzJZXE7bUGHBJSgVpEJRqmea1uAJ1I3McCyMrGRR?=
 =?us-ascii?Q?xCZFVsHuICA/KXFY6RB1h1/GzYpOeat5oihRlr9MADMYb6fSTSGdTGljeoqO?=
 =?us-ascii?Q?Opcc9d7EGo37sz2IiqjXvIPMIYlgJqB1LY1RnYOltGG3fpIoC6it+xetPMFy?=
 =?us-ascii?Q?BYwBJP599SMSoyiSvtcAABjU9mhsp9z9RtUmTRcokSTW0btsBkEbf4c5WbyT?=
 =?us-ascii?Q?X2KTEjtOs8U0Rp1w2ieX8VVttnaqLxX5HEnob04l1aGrzMMIuh7dmrZY8ilG?=
 =?us-ascii?Q?dXs9MTIAyBmXKRwR2OSv3HXEE/gi/SJAEpb84DezZehf8y+pm65yrTJuaWYd?=
 =?us-ascii?Q?0F9V0a4FiqLkqw8ieSv3I4R3/QPHQjFwQ0nJrIZ8FTbffZjnRHNNRU/qXyEv?=
 =?us-ascii?Q?OcXO/tPWTRHsPi8iD7yibP/RjY0WJtX1WIaJVtyHFnDH3mMZPSpd+l253v0q?=
 =?us-ascii?Q?/akqXPhcb7zDzDkGu66eS734RiZV82mjZtALsI0g7845igjaUp2qUD0M/VdJ?=
 =?us-ascii?Q?/MuM4asaOGZQiCjNLG8QBmiiW/ZyjLXZ77w5hmClonz93Fm5UFPvKHK8pdWN?=
 =?us-ascii?Q?c3piW3t/ySal3CMV0w9Aw6L2zqVPXB4aGEPN3We5uuUgRPXqxONGUG71DvFq?=
 =?us-ascii?Q?vJ3yJwzj8385ejOpDLTEisjYEyhn9RgO1oMexd5hGz5yhZ/6F7kVfsigsFPc?=
 =?us-ascii?Q?2wVHAtbHoBYie6BvAzFMppKpYwc7Kzy33B3kp3Uc1psVlhej3Si3nSNKpBgT?=
 =?us-ascii?Q?nplm/RhoRcMkHbA5qyyNzxEQYSNFP4LgaoWcITgAFI0TzR3ZAjDjatIt5d3A?=
 =?us-ascii?Q?pCKf601BgHNqDSeXqeBY8u5eGbyRX9BdDIgjc7PWhiejezbakAhb1neoHbdK?=
 =?us-ascii?Q?VmJ0XEpOqcDOfWpJCv86wa2KqAgf0UDecjy0v4+sJ3i1nn50ddfb3B0HpF65?=
 =?us-ascii?Q?rfzgiVEk8BxLBMrf9Gc+k1bCQY5UAInG6p8c07iFiWPbHgN7zEsfaeMONc29?=
 =?us-ascii?Q?4WSs/mfz+JYxkhQ7ElVq4oyIYzS0c7rWRQkWvb3WhtGu0/Uv9DfVZHrnPWGs?=
 =?us-ascii?Q?bJIrMs2r+kcdeuklCD0UsnondWd/DXT749OatElgShE/Z+S6iRNoojzC+DSE?=
 =?us-ascii?Q?G4o5BOC4X0l93vSO3uIsk9aV8rbrcvUOIviAfuAlYmEdsRU5v/+s+AbawIJF?=
 =?us-ascii?Q?JUzeULf3XIUbIINQSotxdztv7X1686rsBa7ZxhqxlNo/DTaXUq653jYVFH4R?=
 =?us-ascii?Q?8ccmp1EXflOo4+34/CMxqkHSREIo5tYLbCZ95iAIjsoYTaiXNg/gz2gRlyh+?=
 =?us-ascii?Q?f391nydiAt81423otcxpA5uEFV2o1xlxnUa719+9gK2FiteSJ2RWJnC4iOSR?=
 =?us-ascii?Q?VPS1CRUCxsv5kxEXJ1wFChmkTD3b9RGoSs3Vp38D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f40be4f-a9b6-473f-c3a3-08dc8f6a59eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 07:43:31.7271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r7S7cDZoj/gL4DVhH43LGne7y8Pia6t/5y6zcBncCKIrYCPVUGrUnjAvS+eS7czI5r8LGVAVyPmmRbaaZlCtbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8961
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 07:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110950

Gentle ping for scarthgap

-----Original Message-----
From: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>=20
Sent: Wednesday, May 22, 2024 21:46
To: openembedded-devel@lists.openembedded.org
Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [meta-oe][master][scarthgap][PATCH v2] jemalloc: add +git to versi=
on

> From: Peter Marko <peter.marko@siemens.com>
>
> jemalloc was switched from tag to development branch
> 171 commit ahead.
> Adapt PV accordingly.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-o=
e/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> index 7e0272f89..cc21c8bea 100644
> --- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> +++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> @@ -17,6 +17,8 @@ SRC_URI =3D "git://github.com/jemalloc/jemalloc.git;bra=
nch=3Ddev;protocol=3Dhttps \
>             file://run-ptest \
>             "
>  SRCREV =3D "630434bb0ac619f7beec927569782d924c459385"
> +PV_LONG :=3D "${PV}-171-g${SRCREV}"
> +PV .=3D "+git"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> @@ -27,7 +29,7 @@ EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
>  EXTRA_OECONF:append:libc-musl =3D " --with-jemalloc-prefix=3Dje_"
>  # For some reason VERSION file populated only in tarball distribution.
>  # Adding jemalloc version since this recipe is using source code from gi=
t tag
> -EXTRA_OECONF:append =3D " --with-version=3D${PV}-0-g${SRCREV} --enable-x=
malloc"
> +EXTRA_OECONF:append =3D " --with-version=3D${PV_LONG} --enable-xmalloc"
> =20
>  do_install:append() {
>  	sed -i -e 's@${STAGING_DIR_HOST}@@g' \
> --=20
> 2.30.2


