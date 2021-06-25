Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com [216.71.156.121])
 by mx.groups.io with SMTP id smtpd.web08.3305.1624595989108088196
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jun 2021 21:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=sVDrHEZF;
 spf=neutral (domain: fujitsu.com, ip: 216.71.156.121, mailfrom: chikazawa.akifu@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1624595989; x=1656131989;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=VxPOyxpDwCm5WjwWYaVCWNVbX3M0hm6uD+1xbxEDYv0=;
  b=sVDrHEZFJ2t/5pkvTZ7PmelTDy6idOxDR6XIYlpiFAi6ObtjQSw3kgua
   RYdgPTrTEJmHlCKoSDFitVaNeZE5OAvDvHjhJEE8VdBPouBYKwASE3Yxg
   LHhA4RtEOmoe6v+vm83Ha2LM1XBUyUEUwN7QZpN680d1+vlDoWduhP6l+
   eAAFQ+AwmKZWp7JYN3hQ6qXniNAloykY9gabseWssTSpz0Bpzk87YMNe1
   4Um6/T+tukCl4gjw+VWpc3sk8ZOPOQkM2d3dlxpwnEfPb9WHu+MD6YSfZ
   iur+mhyyqvnqcOqbsTc4nsePVp1pr81ypWc802ZLxCP5L77gbuKfXSrb9
   Q==;
IronPort-SDR: 7ctDNr+O4AHkNl1RgJVwAvbBcciuc8B0DTYxcfQbl/tNwbS5zMrj8lbzUXYplX3/renM+RoHir
 28uxF6trXQtfjnq9p+2sIoQzUqLyBxPt8Iotxst4HWu0AVSXC/mrgs6srnN8cgX3teYTj5tF7g
 jTCEEXuoHJOkQGhAiqeNOGMwtR9JGCABRi78Bjaui+mYFYq2gfu0qD4VnzgtGWp5Zj8+PcO0mD
 BcYUrnAWQhlnZZFNkmZ5iessVGcu/kum3N6u46+y26OyLUJCBIDP9FE9r+lyMQ9vpta15k39e/
 VfI=
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="33884667"
X-IronPort-AV: E=Sophos;i="5.83,298,1616425200"; 
   d="scan'208";a="33884667"
Received: from mail-os2jpn01lp2056.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.56])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2021 13:39:46 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPhfTjW7bQAKA9HB79HpUrcE+hMRPQ9uKCrgyXcvE9aCC0ife/hf71zV8W0BuIKeELe+FXVpvHwfKZmkv3tx3xK+PhT0Jh/ZMvIYD7A5MuFpDEuAeqRH0aYt4l0ERiVO3BjxuuxFnxswpImUOK03ZE2TJTFXnUIlMMb2Lyq8HKVt27Qrn1CGjl3jPXibcVihSdH+95Gfjr41jjFqoiAwiPiMlCca3/IgVupxZVmkWr8sQSeSN5WgftQ+cOLwHi4mIm7L0lHGVK+5aVErJSJcbhntGdWzwjLbuMN0niwP3qcwGX555qceUKILy+XWehuQBbAbuI98ortzxRJV0rt7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TX9VY4xpC040dPZfpG66yg4d0bGajtcI2u6Gf+3Fus8=;
 b=k/f7HDsSxcaskNWVZXnyeCfp5ilAg4a57AHeWLCsE/p9sG8vckWKD/r/EVgkWgtXYtDWVAY4xSMju8jSG2DKQch2HURc/F0miGK+23B8D3Ibw89qrvDFbXoT8AOPRUDb0kuziZ/c8Vw9FBu1IhC/8WScYJbSaCf+XQI7zKPIFDxU0WFUSZWjUOUt+cnNyOJdBpNmCLqt/E3V0LN2YQSk8W3xKz8wn6HZEe5h7/q0vRmloGdlItWmiUqYzAi9ongFRGVgcfMxNtyvzdMJjnSnwRzzfUgYXgC0/PTeENaeMYwR8nNbP7jWHX2UYt4jeswp8e6igk1WBj88K4rPeNgPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TX9VY4xpC040dPZfpG66yg4d0bGajtcI2u6Gf+3Fus8=;
 b=exOecFdOPJ2x+Jw6SIr/MZaGvidFn7JrIZYY7XrJTyXKtkOfK+n4nMJnLs2VYeAF0riNjuM15WDzoCvgIxiksxJz/NgaBhEmL/69FqEdHPDrZp93dTjf2d5GXxCRkzIvWzmGnn9GVnVLsHbKvVI8Zj3hqiTfnE9RhVnIPU9UsRg=
Received: from TY2PR01MB3514.jpnprd01.prod.outlook.com (2603:1096:404:e0::13)
 by TYCPR01MB6143.jpnprd01.prod.outlook.com (2603:1096:400:4b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 04:39:43 +0000
Received: from TY2PR01MB3514.jpnprd01.prod.outlook.com
 ([fe80::9108:3961:ffd1:fd89]) by TY2PR01MB3514.jpnprd01.prod.outlook.com
 ([fe80::9108:3961:ffd1:fd89%7]) with mapi id 15.20.4264.019; Fri, 25 Jun 2021
 04:39:43 +0000
From: "Akifumi Chikazawa" <chikazawa.akifu@fujitsu.com>
To: 'Khem Raj' <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] openvpn: add CVE-2020-7224 and CVE-2020-27569 to allowlist
Thread-Topic: [oe] [PATCH] openvpn: add CVE-2020-7224 and CVE-2020-27569 to
 allowlist
Thread-Index: AQHXaR3kkGcIVXqovEuka1CiBbMCwqskJVFw
Date: Fri, 25 Jun 2021 04:39:43 +0000
Message-ID: 
 <TY2PR01MB3514C245C852527369A03628EC069@TY2PR01MB3514.jpnprd01.prod.outlook.com>
References: <20210624072457.674372-1-chikazawa.akifu@fujitsu.com>
 <5b38d255-32d0-9932-e04b-3c5b3c23bdc0@gmail.com>
In-Reply-To: <5b38d255-32d0-9932-e04b-3c5b3c23bdc0@gmail.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
x-shieldmailcheckermailid: f8d1f372277d41ecb155c622b3859bc5
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2021-06-25T04:37:19Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=fe5bd1e5-84fd-4e0e-b99c-31f979642969;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.176]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5ab86d5-552b-4d11-af1b-08d9379340e7
x-ms-traffictypediagnostic: TYCPR01MB6143:
x-microsoft-antispam-prvs: 
 <TYCPR01MB61430C35ACC4A3EA6D389531EC069@TYCPR01MB6143.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QEJ6082wCESiW/HmMx0jjKM76B81JPlhTjCSrgGDOPLdDR3Mfjbw9Y8dYDElscBOz/aHrPJnVvXiEKYRk5vvMq2L6XVB7wAnfzIAuolwjKdVAnhpHgMWijVkYKGJFaWgOsGKDsJ2uJjt3s+OFaCyEsJdba2CJVemt/oyQHthuuS18VtZZyFjPvwNEy2hcuuV9o1ebRuOjc9jxhCCBs4aOSdlx+7eSFNb6hE18EfjW9t18RVfzSjaSNJ+QdwDkgFySs6WcyDQsXNgquK7q3yiyzdXt6fi4yLjBDysjJ5KCfuMQHkgw6BWI2Eyqa8LRGG5hzkxI2V4pxAprNrMpThFPuz4gmX8fI/AfDTdYFbpIDOkJBs0iXaiBbF/6tk8hbAmVmsjfW1O0+6Vhdr1dZn9wQduH65v/E+gJUwUchsokSgoziqmgj614Yhir1yKfjDqO3DwzZu7FqqhpZJa5Ee46Mk+w3mCGOSGiLQfaExFr9XcseU7MUXCtorWZaPqw7Su0yRac6Qyml0NHXz5lcjCuD1SLWLUsdpoZu91MclhL7AchnM0zlTHEv7CuPl0vVYGPMQeqYVGG1tsJm8CBHHWMfSUvpIBxS5mNgWbx7Jj5d9x3vMyLpVysrbettB232jPKs+AM1g6mwyFm/Ue9I2KVTBsuiLNZV88l73RKPiNDJPkuQLZcP3AfVE7Ah8tzi100y4WqveMpDucfVrIQ5YTvk9iF4s1jkHwmfY5yLfVV9snpTGQ0vjGHG/piM6yf/9wpymN7Pd/KtcTv0KU8fZsQQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3514.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(52536014)(71200400001)(186003)(26005)(85182001)(33656002)(38100700002)(122000001)(8676002)(83380400001)(6506007)(7696005)(66476007)(9686003)(8936002)(66556008)(478600001)(966005)(110136005)(53546011)(86362001)(76116006)(2906002)(66946007)(316002)(64756008)(66446008)(5660300002)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?dE1vU3NWQWFvdU9tY1VJZWlnQlIwUkZFVDlDTTVsVlBGdThjL0xjcnRw?=
 =?iso-2022-jp?B?aTEzM3FmT0dFRkgvR0w5UkpPSnJ6Nmh5THBPajdFVlk2ZkZybUJEWEdj?=
 =?iso-2022-jp?B?VWtsc212NitGaVNQL09UNTZhNng5aEZlbU02OEFzbS90Y1FHUVFKWHZV?=
 =?iso-2022-jp?B?V016d3g1aUVjK2hXdTg0azR0eE15UEN1NDdYZ3ZWNndIVk51UHhkb1VN?=
 =?iso-2022-jp?B?TkRYZ1kxTFFEZUtLT1l6MXE1bnlsSnVLdThyaWhEdnpMT3Y2VGhDbjA4?=
 =?iso-2022-jp?B?QlpEY2tkdmVDdXo0ck5RaW9IeFpyU2hjbzJwWnYwMGdBQUk4TC9XUEVN?=
 =?iso-2022-jp?B?U3NmWVZ4QTFNOEh4WUoxOGMrMVlObk9MZmhla3lKLytFNGFRNjE2K2Y5?=
 =?iso-2022-jp?B?dUhGeTgzbExrN1lYOE5PSDg4dHcrQTFDRGJ0T3JQUXpnVjZYeC9SRW1v?=
 =?iso-2022-jp?B?eXhBQWU3SjdVNzFUanY0RlpZbXNjR1lmTEluSmJlSXlaclk5OG9FSldw?=
 =?iso-2022-jp?B?bkhpclQ3N3kyRksvZlorUzNKRVErdzM1ZDNNZE9sMUxFYXZTblVCTUQr?=
 =?iso-2022-jp?B?VVlWWG1UYUJDRFUzaFE0ajFaa1FVc3RmTk1VWkp6K1ExOUdaZ25zczJu?=
 =?iso-2022-jp?B?Qjl6cnJHTWtRSmVQS1d1dmxVK3JNZzJHTGdkZE54Ykc4My81emR6bzRn?=
 =?iso-2022-jp?B?SnM2VjJzTXUrWXU4OVpDTGlLQkI2UGR5SGl0VFM4L3UzQTJIRzhuZ1Zk?=
 =?iso-2022-jp?B?d2VMRlRCVmhYSTBHV3R0amdZVUtYYmNEcTB6ZGNaZU5TYzc3ZklRbUlU?=
 =?iso-2022-jp?B?RjdMczRYTHgwUGJMaUdER3dFY1VOYlNTSVBjSk9RQXVoall1S1JYZ0ZJ?=
 =?iso-2022-jp?B?dThxMitiYVhwTy84SWxVanVScEl6L2k2M1NrK3c0aWZ3czNyb1RrbG1h?=
 =?iso-2022-jp?B?TlBHTlRkUHFZR3Iwb2N2Zi9xbFNvYUloZWFhN3JPZnJRVDZVMnB0cWMx?=
 =?iso-2022-jp?B?NHRYdkswbDJaUGtPMG5xNjZ2Rk9jaDhWcHh4eFF6aEpxTXRnSzBKZHdo?=
 =?iso-2022-jp?B?Yi96Q1RaNXdJb00wQ0VZeFlLQ21Ld3dFZW95YUVhWlluVjlMbWdjZ2dZ?=
 =?iso-2022-jp?B?SEtGV1VZMGpIY3g2NXRUTGdEem5kOFdpTlRaMmJ6U2NDdnA0STlDMTlM?=
 =?iso-2022-jp?B?eTVOcUtDdHd4dUhIZGl0U29KdVcrek0zMzZlS0dldEcvaXQ5TXBuWXA3?=
 =?iso-2022-jp?B?MTc5eTAyb1NBcXNjamlVcVphUm5aSy94WUx5c2ZuckFOclVKaVlCQUdU?=
 =?iso-2022-jp?B?RWc2MDZjT1YxZDA0cXN6R3crZDZkRFVvMTlMdU9uS1dpOFMzVCtGaGdC?=
 =?iso-2022-jp?B?QTBWOGVCNEJxbjBZZEJTTlNNaThqQnlnRFVrWURKL1NIRnBQLzZKVUxT?=
 =?iso-2022-jp?B?bjhnK1FhTmd4Wm91WFQ4cWp2a3dtQmVPUXlDcWUzOEg4RmcrY1dDSDZr?=
 =?iso-2022-jp?B?UjlTVmUvb05yTTJrV0RjdGhlWjhVUjBFM1Jpd3VXZWtXektNZlZtWHF1?=
 =?iso-2022-jp?B?ZURObklIem9tVGwrTlpKRTJ1Q3hpeFB6MUFqK3krUEtTQlVxWlNKU1lk?=
 =?iso-2022-jp?B?QmZkVERxMm5kM1lhcjZiV1R5U2xsdW1WUmNIQjM0T0dIM0Y1eXAvTkg5?=
 =?iso-2022-jp?B?VDdaU2Z0a1dqMFFjQlFpQnFRSEhRaXoyVHBaTlV2M3lWU3BJekl4VzFj?=
 =?iso-2022-jp?B?dmtPZUV3ZTNRakZYM1JpS1lUSzcvNGxQYTdOYTZOWWZXaTYxMXlZOGd5?=
 =?iso-2022-jp?B?Rk1TNDk3b0FKbExKWXVQTzkvK3dGdkw2a0FPak1FcFBlK3ZTNXlUVGc2?=
 =?iso-2022-jp?B?RndhUXhBbzRJNWp0LzhXcGhlMmx4eENjd3N5RjlIU3Y2alowdG8xcmx6?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3514.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ab86d5-552b-4d11-af1b-08d9379340e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 04:39:43.7182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UYx3qybgqMcymUoN70TH9mhS7aHwj3AmgZ3CjcDy+jR3m/D0KFpXGWcQSCTwDTS0iyVxM44TZZtKsh4UST2xIVnK+YMeShY/kaj5Q599RxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6143
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Khem Raj.

Thanks for reply.

This patch this meant for master.
I will rebase it on latest master/master-next and resend.

-----Original Message-----
From: Khem Raj <raj.khem@gmail.com>=20
Sent: Friday, June 25, 2021 2:25 AM
To: Chikazawa, Akifumi/=1B$B6aBt=1B(B =1B$BE/;K=1B(B <chikazawa.akifu@fuji=
tsu.com>; openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] openvpn: add CVE-2020-7224 and CVE-2020-27569 to=
 allowlist

Thanks for the patch

On 6/24/21 12:24 AM, Akifumi Chikazawa wrote:
> CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not=20
> for openvpn.
>=20
> Signed-off-by: Akifumi Chikazawa <chikazawa.akifu@fujitsu.com>
> ---
>   meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb | 3 +++
>   1 file changed, 3 insertions(+)
>=20


we are on 2.5.3 on master, is this meant for master ? if so , please rebas=
e it on latest master/master-next and resend, if its meant for a release br=
anch then prefix the subject line with [release-name] so release maintainer=
 gets notified too.

> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb=20
> b/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
> index f82107dbe..646f0387a 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
> @@ -17,6 +17,9 @@ UPSTREAM_CHECK_URI =3D "https://openvpn.net/community-=
downloads"
>   SRC_URI[md5sum] =3D "7643f135b49aee49df7d83c1f434dc4e"
>   SRC_URI[sha256sum] =3D "b9d295988b34e39964ac475b619c3585d667b36c350cf1=
adec19e5e3c843ba11"
>  =20
> +# CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not=
 for openvpn.
> +CVE_CHECK_WHITELIST +=3D "CVE-2020-7224 CVE-2020-27569"
> +
>   SYSTEMD_SERVICE_${PN} +=3D "openvpn@loopback-server.service openvpn@lo=
opback-client.service"
>   SYSTEMD_AUTO_ENABLE =3D "disable"
>  =20
>=20
>=20
>=20
>=20
>=20
