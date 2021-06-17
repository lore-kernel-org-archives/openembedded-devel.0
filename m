Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com [68.232.159.83])
 by mx.groups.io with SMTP id smtpd.web09.3266.1623903012116753751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 21:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=lKtPMbEd;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.83, mailfrom: ito-yuichi@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1623903013; x=1655439013;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=5MZkOKzgXNkJm2dMc8mRmHHFqcSrEupqE5ReZbhmUwQ=;
  b=lKtPMbEdbiWog/GIHzIxSdbXC6nCXL/FMZTF/Tzz9DaH9D/a0d4DBP38
   Ec6ZcPDV7tTNGa5UgyZTgmzTdBb+4jiKWkOyeXSlD0EyUVfgcji/W4rYu
   O1NuM64xzVS9RuE9x8JoKeGjrxmpi9eobf3RfLZTnykcdF27Mh9HwgNGi
   hzPo4G/zIIpGugmR6ac0xjp27Gtl+jz1O/4S0wgz44bOEc6cj6SJ5WmIN
   ncu+ATRh/VPiEzwv/XgWZYN/2HsZgk2AUBkEJT2c7JYylTMdrWkPzP4Tg
   cd3qML1znsu/Ca8T4FxkZslg6Cbdl6919iDW813mzFQr8M59V9r/NShPY
   Q==;
IronPort-SDR: tEfzgSsZO0kE2BTBpBWI5Qj9eiVHd0wnci/lve8w6JETOpZCL4SjMvrcQM8bI6w0dEQ0dtrdMd
 5DxOsnqFxc3vyqEZvqlNSpnOaQVsgu+CLuRYeDfMEXp/g2Skv0xZH0dfkLNHTewDyobZ3PyRSx
 xVMxJDkVNA/9dPM/gUQ49YWMPRZ9u/GqIKEVXbo3NbfZXoZHS9KYZs3NctSlSf5iStYH1vI420
 gSGNeRlA9To6hD0PZ7YQP5YhQyr8OnmEi0Q/vEoK1sqdjJ77GlCCbl5ekcwgZWCnK6FoehFFOm
 yy8=
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="33384430"
X-IronPort-AV: E=Sophos;i="5.83,278,1616425200"; 
   d="scan'208";a="33384430"
Received: from mail-os2jpn01lp2053.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.53])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 13:10:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHPz58lddGVX827vwRwFtCB7bcPvgwo1VopSNLe6D8+qltXV92W9MXF+8/dPcW3pI6Gp1ncmhJk/XMAbwtVluqquMZzGvfMHwgIlJUvVsehrkGdFxtDmZORdzNQZ8PWmnGDrs4pCiJ4Tw6Gi+lvihaeTftvBzfwAkyBe24uKvLcIPoD5JnnHtyehkO8P1EW3PKNPslkoxQ+nZ06/wLNecAKoLqnNChrdhdr8xkVjnDOR0TFPjGCNKkAeFqRCDmfbTDvt+ggtbLLdqhtms6S/xDUI0wxWTzUFzf/80fcStCkdPQdUBpPTc/+d3Vwr2WsQ/cFRig+UhnQ1cvXami2gFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/lVZM5xLt2BQ+lFXS2Z8d5q58qRzsZcBMFa3d+zSPw=;
 b=B+wRBhMgCIY42vw0S7DFi0fqyBwNMX0YaC3SznhmjXXwbn8orYZUVPBKGZ95qOurRzx464mH3As5ykiDp+eQnA7b1oOozf/y+rjh/CJ5Vx6Bqr6/pKYiEXFat9is0gzd+m6OklWyi3+nw1a3eo1bdlIhLLtHA+p74inSE9Vj91JV1hxpY9PiEZ6XJtSUOIaMZOYPEUvSzKM1XLyBhrtCe+gKUFDguASZLtooBVTIvzLyZ5pzcu63bFc8iym3j/h75uPOrDu2eONYOkKU0RFcQrwOy1jeyQ9JCQk2ogTRU3Zxv5Yhmtmsk6r4Q9AaZSkOsD1xz2vanPyhdtcFJENHKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/lVZM5xLt2BQ+lFXS2Z8d5q58qRzsZcBMFa3d+zSPw=;
 b=S6uDoCnjNfIKyS+E0ZCoyJwSpU6l1/eMOs0c8G2l0qJx0+QRKRKmu8UzE2lCpOkITK88z4ZCX+g42M25jGOxw1qKrGRJaibw11m6vlrsYw+5UUeP8+lNC35KAcquHAeeupQ2Wop4XJuJI8LUYDsrrknxXa7jmPVVCIjPONYtzqo=
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com (2603:1096:400:41::9)
 by TYXPR01MB1598.jpnprd01.prod.outlook.com (2603:1096:403:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 04:10:06 +0000
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::446a:7e01:7ec1:953b]) by TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::446a:7e01:7ec1:953b%4]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 04:10:06 +0000
From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] cyrus-sasl: add CVE-2020-8032 to allowlist
Thread-Topic: [oe] [PATCH] cyrus-sasl: add CVE-2020-8032 to allowlist
Thread-Index: AQHXXpxlzUXvtjFK40O/cXqyEbtRJKsXn+NA
Date: Thu, 17 Jun 2021 04:10:06 +0000
Message-ID: 
 <TYCPR01MB5599FD7F21812AFB694953FF8F0E9@TYCPR01MB5599.jpnprd01.prod.outlook.com>
References: <16877A0991CEE112.8333@lists.openembedded.org>
In-Reply-To: <16877A0991CEE112.8333@lists.openembedded.org>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2021-06-17T04:10:04Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=5ced15fd-4326-464d-af9b-f4def3bb0dff;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=fujitsu.com;
x-originating-ip: [210.162.30.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ee0e909-3f37-47b9-aa4e-08d93145ca0d
x-ms-traffictypediagnostic: TYXPR01MB1598:
x-microsoft-antispam-prvs: 
 <TYXPR01MB1598536A24B966A6D695A8F28F0E9@TYXPR01MB1598.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pdU1UMMd0yLHURlRZ7ZZlcszU6NnAkTBxC5J2A5U9a185xMgCa6cxoGhxg67zEyPN2j4jVp8tvpRKEA6Qkndm+LAs7ysCARgzxwOZccYTo+UdaJOpGs6a/SHdJCYusQMdnz5OBc0H/dnrF47VeeNpL/JYrCBCUkEBiiTYs6YR91sY0NrZ4kZoDm1onUHhX9XIwRAJ0Fr7a7IOxQfWyIWSwrZ9S58ud07KJQ46CE40avgrmfnlXlzjeXdjnvgFZPop37NH9DL5lQk22G5Ru3gm50HmnYicDpvR5Oe0X8IQq6GJXnisQsWrIQL62Y6w/yY5YOnOfVG6aGkengnQMzP5v03MmODPkybyzOTEA8RzqTeLiAW2sik27l9jf9+6eNni/RdClt2XuHN06dJzITWgKE9j2Dxy9uiF8il/bHthmXdntULLcHbnRgbb8zW31K0f5dPT1Lbeyp7zALKz5iW98aUevlgCKrfkjoXL2giucBy2Yo4lx0gbz20kYTfkpaghDJ83+hrwkYkoMpHQoUxEPa/SOSZpVDAKh/0fnUo+07iHr2la3gPM14V33XU6njJIPnlA9WFt8RZDoZruwgm7OdC75m+nTA7+zYJZgncTb8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5599.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(8676002)(86362001)(71200400001)(66946007)(83380400001)(2906002)(38100700002)(55016002)(33656002)(76116006)(122000001)(9686003)(6916009)(8936002)(53546011)(478600001)(186003)(64756008)(66446008)(66556008)(5660300002)(6506007)(316002)(52536014)(7696005)(26005)(85182001)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?Y2VXbVFuZVNxakc3Z1M5d2pBbjlCNEdCTlF2Q3RGQzR0VnFQZm5LNW1B?=
 =?iso-2022-jp?B?OHVKKzBzTjc4SFpOS1FyUHpueFRxVHRsQXBnTWltNElHQnpRby9HODdY?=
 =?iso-2022-jp?B?WmcwOVdaaUF5aXg5Um5Vd3hieVROUnl2aitKaTBseGZHMGl5aEt5dy93?=
 =?iso-2022-jp?B?N2dBRVBRWEg3WTM3V2VpdDBUaFVQYlc5OC8zK3M4SGM1RlNKNjNNY3lu?=
 =?iso-2022-jp?B?ZS8rVW4rUXNzMlVBWDFWWUhrY25scWp3R3c4UXNYWU5aTW45MGRyTE5K?=
 =?iso-2022-jp?B?M3JUdTV4THJOcFNTRkdaSTdML3BUaDZDMkM3WnIwcHBiMmFxN01MUmxt?=
 =?iso-2022-jp?B?djU3NERaWlpHNDJJWkRNU3M2ZS9tWEk0Z2RqZGgxUkorMjdZdHBRenNN?=
 =?iso-2022-jp?B?ZW85ZjB6VGgvdDJBVkNyclUvYmpjY1pXUERwMUZRT09RVitQWE5qeXBH?=
 =?iso-2022-jp?B?VHcvNi9qbHBEVUNyWVNWSkFjSE4rRjdlY3pUWCtOczRhMTZzWEFnL1pU?=
 =?iso-2022-jp?B?ODNVd1BoaUw2L25tWnBoWGJLV1gzOWY5MnlpN0dENFlKNEM5U21Jd3hM?=
 =?iso-2022-jp?B?bjA3T0k1dTc0dExSQW9wZ1RIT1Q1MU80Y09vK3hwOUoreXNwTjF4Y1dw?=
 =?iso-2022-jp?B?dG8vK08rREY5WHFHdEFuNEVvRHhoQ0VaZmdrYmo0aVlmdlEyRXJFdGh0?=
 =?iso-2022-jp?B?SDV5ZVFzOXlKK2ExZmgrUzFjdlUvOExhdUxuZHNXZjVpeEZSYzlHWUZK?=
 =?iso-2022-jp?B?WEV4bUZodkdCUWhXT0tXNVp5ZlJLVEhoanR5UDRiZkhuQ1hSZldPb3dn?=
 =?iso-2022-jp?B?dnpHSDJaU0QreW1rZTJkUGZvd3ArdVZFUjN3NGhlOGcyMkJRejZ6MXVl?=
 =?iso-2022-jp?B?OHNqZCs5R2tiSlBiSWtKRGdlZFlaWTMyU211am1PbjVtRnhseFd3STA0?=
 =?iso-2022-jp?B?RDE1QnBlU3Z2MjNNNHNMSTA0bXdKdWMzY1M2NHVienFJanUrdXJ2Ylp0?=
 =?iso-2022-jp?B?dEk5b1lzNm1HOUQyKzhqd1dTUU9UM0dFMUpoRHVQN3pEa2IvalN2eTFE?=
 =?iso-2022-jp?B?NklKWnBFTWxtOHBYamNrU09FSmFFTHYrZVVWaHpoNndwQUZpWTBZMWxy?=
 =?iso-2022-jp?B?MlgvalJBWDNwdGdLWDh1SUpWZzhiRDgyVUdEWkpOb0M1S1Y2VU1BdjNl?=
 =?iso-2022-jp?B?QmtvV2hZNWF4Z216dDV1ZlBlQTBjWWRmZnFtbmxVYkJMeTU2aElkczZU?=
 =?iso-2022-jp?B?cVlraHZqNUhrbGd1R3BKK2pvVjYrSmYwWDE3NGM2Qy9tOW56WXdrMTV0?=
 =?iso-2022-jp?B?RHF4OGVsMDVhTU5kb3FqZXpwRGladDZuQW1VQlZnTlFwVDd0UlVtVnEw?=
 =?iso-2022-jp?B?QjQxQXdHbnl2ckVqR2ZHYzg3TGJqcFZqZ012U3lZWlZzdi9WMzNidENR?=
 =?iso-2022-jp?B?MXhLT29ZaFdSUzBkV0tpdHdKeGMxNHlqUDFoSzFxa0VpZ256bTNmcWk5?=
 =?iso-2022-jp?B?TXlsTXdLamp1bC9PbWUvcUgvTFdOdTZVenR3Ujhheko4MGhIZFZTdGhw?=
 =?iso-2022-jp?B?TCtDN0lGVkd0bzArZUYzY0tFdnVRQzJsZFhRbFVENjVIUGYzQUx1Tytw?=
 =?iso-2022-jp?B?ZTQ5UGNidFhueW5TR2szcUZnUFNLV3ZzL0NKUldTM3pxRUJORUZ2b1Zy?=
 =?iso-2022-jp?B?Mk9UYUxKaWJwT2NlLzEraHgrcWFtNDNwN0xXL243RmNnL1cwY3I1TVlr?=
 =?iso-2022-jp?B?THBWSU4rY3AzS0QxNVRmTm8xcUdITFB3RjZEdHk3WVVTZVpLblg4ei9p?=
 =?iso-2022-jp?B?NG5PaVNKOGN6WWVQYnBSVmRJZnZsUTNsRkZlc3pIM0JSRGYzM1dzNE1R?=
 =?iso-2022-jp?B?dzI5ZkhDMlJhUVV4THBpV3o1NHNZPQ==?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5599.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee0e909-3f37-47b9-aa4e-08d93145ca0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 04:10:06.1256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tE5SsGqEIhVKbamCrLBctvE+MmOVmCxnvF6ZS0FLVEznyLF6CPFOq94T3zKdZRiDvWvG/jJQEGUUhwvQ/F0ph2I8aRcWmu7X4Jwe1Tg2BYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1598
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi,

I would appreciate if you have any advice on this patch.

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org
> <openembedded-devel@lists.openembedded.org> On Behalf Of
> ito-yuichi@fujitsu.com
> Sent: Friday, June 11, 2021 5:33 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH] cyrus-sasl: add CVE-2020-8032 to allowlist
>=20
> This affects only openSUSE, so add it to allowlist.
>=20
> Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
> ---
>  .../recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb            | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git
> a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> index 33de8ca7e..c4b41ace8 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> @@ -96,3 +96,6 @@ FILES_${PN}-dbg       +=3D "${libdir}/sasl2/.debug"
>  FILES_${PN}-staticdev +=3D "${libdir}/sasl2/*.a"
>=20
>  INSANE_SKIP_${PN} +=3D "dev-so"
> +
> +# CVE-2020-8032 affects only openSUSE
> +CVE_CHECK_WHITELIST +=3D "CVE-2020-8032"
> --
> 2.25.1

