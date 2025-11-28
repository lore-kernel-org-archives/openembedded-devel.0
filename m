Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50F1CFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 08:50:39 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11852.1764319830688027851
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 00:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=M2vUw3jo;
 spf=pass (domain: siemens.com, ip: 52.101.83.48, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a67gp3UGywNiG5g+81Uk5EBWy7Ku5RTucTPZe5boVTmQFWEDrda6quJes6UJlI9akKYu03gNOoEbMVZ5FU0LlBToldGR7cACLK1L9Svr+delpMp72MEOdYr9+ET3SpbOr9/6bb/3o05zT5i8ntXmvWcIeIIs5d7wfApSxAbhuWudMGiPqWKE+7ZlvmODjBml0xKuvF09bf1f9WkU9mLTSiqy5zHxIFiQ+New0b6+Pz2kS2Zxj7SPEEaHG+c7QcwtlblBKAWgh4WxiCsyUwKl7LO0pU0eYFBkg+/rzXDFT6C04s0zIMvToMwSk6Vvmg03OddZAo64aG3gzvZR6YdwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv3tzmjpPBi2Prp2gltN4XCK8wBKhqLvXIcPTf1MxPk=;
 b=tIYjoxdIwp8n8T/3EHvFlQPjQchGNxQYbArcd6Z22vXIf2dt44CIb9DadJZZldfDST3JiOPiBy+Eyx/azmIOn//dBUzyoDXHG/9DgJzJkLRUUf1GB2xoGGK+psLewrXUvpisvRNWgTrD6LdpouLrXab+tyf10Mq0FgqqDYID1THxE+1r6w2m3vAGjdgNtk9KbMnS8KWjoqG6uyfzWcAmP1NlIJNLVYiiCbPTjfbl6PWimIR2PUJjQ/QECl623dPTCBfJGqPSn4J/Dl/MrD8Q/3Yf9ugFWi/Nm4U66B4OmSrQdczekBmuq5qyVES+2Tv9qw5dfdAGVfZgj18vQDdCVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mv3tzmjpPBi2Prp2gltN4XCK8wBKhqLvXIcPTf1MxPk=;
 b=M2vUw3jogBp1djmK+4JCMZElgTybAh5Q93V8SasUL/iKqjeA2ZIUgEituciEeXnres8YDQCvtEB+TKgWzOaY9XCS0BxWKHTTVjGqAmaaMl0jC56FcoOJPZSCpcNuuN0Ru+C5QEYadcDuEW7lT0x8jMLlmBtEhdQ2M6v9H+WSgzYAHWv71h6IkyZaERRi9KkhFZY9WPuACf9S8smKWIt2P5x1bQn2bycjf4RzCNvE8kLJ0l2ohQr9rx/1p0Ovlk0b4iVwdi4oZL953W95L21c0IytW56Q+JXBD096xTkh1TSSLIVYfUOWUrZMHzjAqk3ArHoUA9jPRYjwmD85CdjCMg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU2PR10MB7766.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:49c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 08:50:25 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9343.016; Fri, 28 Nov 2025
 08:50:25 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "leon.anavi@konsulko.com" <leon.anavi@konsulko.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] colortail: Add recipe
Thread-Topic: [oe] [meta-oe][PATCH] colortail: Add recipe
Thread-Index: AQHcYEIvP4RIs1jOkkGJB6tmXVNm67UHxw6w
Date: Fri, 28 Nov 2025 08:50:25 +0000
Message-ID: 
 <AS1PR10MB569777F76474C5BDAB080439FDDCA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251128083658.1285605-1-leon.anavi@konsulko.com>
In-Reply-To: <20251128083658.1285605-1-leon.anavi@konsulko.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=30f240c0-9832-491f-ad6f-a680ad196f1f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-28T08:48:37Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU2PR10MB7766:EE_
x-ms-office365-filtering-correlation-id: 1565932d-b6bc-4feb-d356-08de2e5b2c98
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?koNjwLFuBSsh8F+G9f23+VZVMG1zafKC9b1ehfGAzcQg1ZlsJEg8YAgAimbs?=
 =?us-ascii?Q?72h+a9ZcD0+ckoCTQEWoizCSkghf1b8chliH2KVQcFUG5FCjD790sxDFpzfg?=
 =?us-ascii?Q?uj+38RcnwDUikXeyXrJ/JHOyHMalU/faLyGnX134GTXFRTMMfTWURD+juE61?=
 =?us-ascii?Q?iunLemsJBHwjNYgJHoBU99V8L+MqHi1bmh/V7z6Jq/ni1fz88CCCLIzMmK8m?=
 =?us-ascii?Q?x0zArwvKrENZGapvZ1oK2cxPOYT4NRgp+b7UQE1WinErYvXcjWqTL098Uh9y?=
 =?us-ascii?Q?LZwItCGAi67895dSKYzxRGM0RHEXaJJUJMvkrgU+tz4zF7YhRW+RtfsDDYYS?=
 =?us-ascii?Q?+TcwUWtb4PeJVpMtJkkQp1aXEuMJ/xa+wHK/ilHC2zRLRY/JiEUNd+YljRb5?=
 =?us-ascii?Q?nam6NYocadIr5afrVq7/5fY0E5PWuvQ81gn6CNHjEzYlGPEyL4a8nh1W7Kln?=
 =?us-ascii?Q?hB80wEOH0H115PHdvNjyhdBT8xD7HaX7f7RaxwibI6yrC5prWAMAdkfWdXf+?=
 =?us-ascii?Q?ocvaBeStMatN0OrUcfeM/BBizUWW/5btiTDt4lK92cXcPFovQtKdqsT27HUX?=
 =?us-ascii?Q?6fz+Yo2vk02ITbT4rVtej+DbhgqQztpUWZkQOuzs0p94g038ONhAwXKJGzfY?=
 =?us-ascii?Q?95EtVey22buSwL+L6LShMp8Ez5u+PeglooCON50arXgXO3LrcnBZ6FjJmIfI?=
 =?us-ascii?Q?X6LKn5q2FuG5awVrrzSrPppTw/UyYY6Qk/zaF5C5xRUPJLfhfUYhFwr1PFxW?=
 =?us-ascii?Q?8nETkLYpIdyPFyFahqizMKqbfA1cFoMkt06Hw/uCCy1xObzruk6R5ArNTR5F?=
 =?us-ascii?Q?j5n7tpe8WSjw+ufOoT2HldMVm2J/Jgb6uA6zGfqyS+6sjUsx7ERylaQPw8RP?=
 =?us-ascii?Q?bdbp2M7rGoScZfO+UpSSRtbr121Gr12Yx17bEq1pKM7k0XL6Idz7QDrIdg0N?=
 =?us-ascii?Q?454ZnKEHpA7jYfMzgEWe0kgcJxYVIPuq0BuehMAOuffYIspFh5wAHeQCJltl?=
 =?us-ascii?Q?H4XP96oL1g7dU00aY2DUe7HOTO8k4iayT3xYuO3cj605+y/Qpd09hEB4vg8q?=
 =?us-ascii?Q?cXrqwNkq8H6dEjy0BwGuncLi3BoEDVsiMV7nov1S+XkgjCRF0IBssH5fAIEY?=
 =?us-ascii?Q?vWL4eujKsKDH62K3TrYgfNqtQ7Hz/FIs3K8kYd02XCqmiyPLAW+7prHY9SWv?=
 =?us-ascii?Q?qLlCBk7DfTTV09OoYN/hfBffTLLVfI573nQG0nW5ADLmYo/hYrD4CcFYJef9?=
 =?us-ascii?Q?DHLXKAQNZIRH/RofCHuv/5Xnlx6It0/w09G5Ss6d9is5yl8vWZm3Uf2sryCr?=
 =?us-ascii?Q?vZATBSa/afEyTvdxEpdA8tx79inAMrNXJG7tvVB7DEJd7+LeqZEQAus2z2SP?=
 =?us-ascii?Q?Fba2oH7dOE5UHfX7Z25sUQbfBEf3Jsn3HcilvVYtM3NST76PbkHxZPcvmq7q?=
 =?us-ascii?Q?LM28GsYOyF0P4Strlln4+Hisu3SFoHCzrE/KZpBC6v9B0M0K5MaCyvBnz1xC?=
 =?us-ascii?Q?SyPikJVNeO4dghZvNsgPms4KfaFYnQ0K9Zwe?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DZiN4XPtp0UiANEPk5267vqnO5t6fA6oy0lteJh8IvPNIOH50Abe+5SsVmS9?=
 =?us-ascii?Q?6bSCIsvlDKpDqipQYYSFTSypnjQ4yeFOn967iV4LrxsJQ5y7vAJtVNO0K5d9?=
 =?us-ascii?Q?m0viFcOYJHY2HcD3Ch53DF7LeElxF7Z2pHzU0BsHK/DgyWSn3PIMtUzHgnBw?=
 =?us-ascii?Q?2SWhePsFyt0m3hZstOg8XZkKj3m8DaCkhZPwyEHc4DxIVKuU8/fusF8Yg9Ox?=
 =?us-ascii?Q?/RB85NK+f5oz3mYZxBKwg8Imbeme6rlJGkQxu4KuYKOO05bHEHoQRTP8RvLU?=
 =?us-ascii?Q?esxHqv/APdP00oWFrOkKRRjEbQU6DO3Ckp1mwoTfH3C9MllDwKSAgGgHkcZc?=
 =?us-ascii?Q?bmzXhcZA+Y5U1XwBnPPMQ1Z0A9KS01wT/XltsU1pkB8aP3P+l4nJr7GhSScH?=
 =?us-ascii?Q?H3PlNOWDo/xeUT2odks3ZN+nUYIICE/IiK2W/JsD5V/7UjE8zH+VzyqjPLac?=
 =?us-ascii?Q?JacmBg331t9HpOBDDYQaEsNVmBHDdcbvAehs2urx6PrBOi/pTzd0xvNY9uv5?=
 =?us-ascii?Q?t7mYr7PeegaGlkHAQ6dRfm3+tl6WiQJA8pog9Ph5lG1hPViNqQA66JvUw5zS?=
 =?us-ascii?Q?TVG6R0z63Szu2qiqRzYDRranrCy4WY9mGOiwkYjj10QokcT8so4fZ2HbkHJB?=
 =?us-ascii?Q?dsdxJpIn0yAVoZzXtxJozbi6y4mtJaHt1Ai48YkVnaQAZ33FXzptNWMKXMxP?=
 =?us-ascii?Q?6bNJskA3YyR90nDViZEEvqDsbOMlWgPMd1ONrmzBYAS08oFhbc3Sp8+heHnI?=
 =?us-ascii?Q?nxThZuoyp654106GC8C1p8AZUqAmdJbag2DVRBHE7GMOhddy+eeIqY+kzkTV?=
 =?us-ascii?Q?8Ier1dPFmCwt1JH+KOdMSawcj6Ety+4tvWbtJbL1OtfawCW4fKH5ESTOzGeX?=
 =?us-ascii?Q?Vu272tznWXWyht02W1gXH6CRfiDob3A1ca1ngsiVnSNfsR3MxLQWcbAXFp2b?=
 =?us-ascii?Q?dVJsIGmmC0omVXxQT28ASPVrSCJK1rmbzOvebgEImT3JDmkdh+DuCb4N5VMU?=
 =?us-ascii?Q?Hc/4e3dTJ+0LVIJScJjdzryQv1mR4c9XvIrEOfPadLzw5g9jXcV8wcxQbT9s?=
 =?us-ascii?Q?ogj3PAzGjvxCckD+bPH+v7ts/nExlTF1YDwHBEM8lwoao9i3e5ZFICH7wVM5?=
 =?us-ascii?Q?IlI9SvXTyoUZHm4p7BvrKjljQl/YHNpAmk/vEr+p/K/6VW2oT9BH/rrl8cVl?=
 =?us-ascii?Q?EVXfhZS4q1LXJ7aHq+aojnQsvI9Fr16Bs99Rf1VFl1rXc48cxDZAYSFlosDi?=
 =?us-ascii?Q?xKb9I5swXy7PVc0HUdkw49thgvrQFHPMchQ6Jz341gIWWuTGw0Ow74i6TkMH?=
 =?us-ascii?Q?WcWaK0S3i7V5+H/dqHvKdIBn6CzD/0UpYZTpnwZcZrPEO8uTRV05BfgC/Qvs?=
 =?us-ascii?Q?YUDXyfmtpelqMsaKeeJpsgvVhcke9g/zpG9sjb99k+vD7oBOWOxhJ+kxQbJY?=
 =?us-ascii?Q?r3/IRQVCUjT2mmQ4HubffFzvin+bUGzaxat/67POp884dIzt0qj8EX8xe8h1?=
 =?us-ascii?Q?JWx5H0x8rM8kUtuvBNx+GW7AxLT+Z6WRJkA9OkyqvXMR2r1Pp19s9JdDmkV0?=
 =?us-ascii?Q?VISUrTwrLXKIyTk8XJMgEJwaqTIGtk25jrgZ5lwR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1565932d-b6bc-4feb-d356-08de2e5b2c98
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 08:50:25.7723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1bQvuAWluAxVvIFndIunt9ebMgZdwz2je6igk7uvx2CQMRDbbqZDj+ODCjg4sJfZlxxpCEpzZXYhQgH5q/2/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7766
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 08:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122119



> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Leon Anavi via
> lists.openembedded.org
> Sent: Friday, November 28, 2025 9:37
> To: openembedded-devel@lists.openembedded.org
> Cc: Leon Anavi <leon.anavi@konsulko.com>
> Subject: [oe] [meta-oe][PATCH] colortail: Add recipe
>=20
> Colortails is like the tail command line utility but with colors.
> Add recipe for the latest release 0.3.5:
>=20
> - Print error messages to stderr
> - Fix memory leaks and Valgrind warnings
> - Improve detection of file truncation due to log rotation
> - Fix ./autogen.sh on macOS
> - Avoid emitting excessive color sequences
> - Output ansi reset code when the program is interrupted
>=20
> This work was sponsored by GOVCERT.LU.
>=20
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  meta-oe/recipes-extended/colortail/colortail_0.3.5.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/colortail/colortail_0.3.5.bb
>=20
> diff --git a/meta-oe/recipes-extended/colortail/colortail_0.3.5.bb b/meta=
-oe/recipes-
> extended/colortail/colortail_0.3.5.bb
> new file mode 100644
> index 0000000000..bf31ee9882
> --- /dev/null
> +++ b/meta-oe/recipes-extended/colortail/colortail_0.3.5.bb
> @@ -0,0 +1,10 @@
> +SUMMARY =3D "Like the tail command line utility but with colors"
> +DESCRIPTION =3D "Colortail - like tail but with color highlighting confi=
gured via
> patterns"
> +HOMEPAGE =3D "https://github.com/joakim666/colortail"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> +
> +SRC_URI =3D
> "git://github.com/joakim666/colortail.git;branch=3Dmaster;protocol=3Dhttp=
s"

Please add ";tag=3D${PV}" to the SRC_URI.

> +SRCREV =3D "653bbbe3292759f5fb5ae9f769f131c1a320965d"
> +
> +inherit autotools pkgconfig
> --
> 2.47.3


