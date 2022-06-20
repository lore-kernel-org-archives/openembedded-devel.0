Return-Path: <dai-de.li@leica-geosystems.com.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29200C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 08:28:16 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.109])
 by mx.groups.io with SMTP id smtpd.web10.27641.1655713685235695672
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jun 2022 01:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com.cn header.s=selector1
 header.b=Vu08QYf3;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com.cn, ip: 40.107.7.109,
 mailfrom: dai-de.li@leica-geosystems.com.cn)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGCGa6mxevcq5Y+2dyvqKDCPXHD7GWPSqHE4kwlzjpidvydgfYUQI+bkrJbZL8CSF+maRBnmBgJ29qr1wndo7rFLr+bzUzwYCuFV9aN86dVQBk6SJ/efGkv1w9u9z7UaD7LE4KrCe7Z3awjaSrVofwvGwA9xbT/wEz43iJ7t4ygZhy/pW+Z2aoOgIBGi1/KeCMzE0MW9TdzN0sHLBnoT+eri8C9e2D5pUId1VNw8UIS+JO6sbx3XyXTkZJQbcZOShEewGvfX8hW3iprA1HHaWu7xnZYOYA+zwtTAZZhtER8b69FJhszdUDtR7ucNMbutps32J7M8rbi/rdoxDk6e4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tNZlwf6DSTZAqhdZ9jcUy2lOvGsUw+9rAqubgaAjG4=;
 b=dc3zs3b2PeQBjme3LjBOgZwzBe6APZbbOYT+L99k3uGwXKXiKuQvWGSMxe1alNu+wIYv6gARGvNt9EQk6p+bkGU9ezCAXFz+x82t/axXYiCP/D3GLMoVyqJ4pTbWkY2ZXtMxCEstynET/D5n9pg5hEtIOSTCpub8/bTH8JF6VKWa2tD4aiXiZW7ip+jJPXYdG78eOr4vqy9xnGeQ7Jxu0j2tQCxj2ehEvOm18axn1MwyQNTJY0AcVs3wffQ51Wbs5FfYvhZQ30nMznuWG4PklhNilK2O47B+XAvMuqHT8JF1xvxFRtqoLwteneLl/55AHpImpeUhdZshMl4dfOELAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass action=none
 header.from=leica-geosystems.com.cn; dkim=pass
 header.d=leica-geosystems.com.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tNZlwf6DSTZAqhdZ9jcUy2lOvGsUw+9rAqubgaAjG4=;
 b=Vu08QYf3AS+I4u9l88VYorFiDriXCYhDTKzvSaPfTeWAAz9VGft1GAE9RHyY0fqWof/zVd6V2aOlETK/P6/sCG1gQ9LilZFOWzLNInKqhD3MQVbUmooE1Q6Q5efr7X3NuJiyzPq95G9PPpYKNh3bSeWLl2CYOLosMK68IzgMDNQ=
Received: from DB9PR06MB7371.eurprd06.prod.outlook.com (2603:10a6:10:257::23)
 by DB9PR06MB8464.eurprd06.prod.outlook.com (2603:10a6:10:36f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Mon, 20 Jun
 2022 08:27:58 +0000
Received: from DB9PR06MB7371.eurprd06.prod.outlook.com
 ([fe80::7dca:ef83:7b5f:8039]) by DB9PR06MB7371.eurprd06.prod.outlook.com
 ([fe80::7dca:ef83:7b5f:8039%9]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 08:27:58 +0000
From: LI Daide <dai-de.li@leica-geosystems.com.cn>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "ldd428@126.com" <ldd428@126.com>
Subject: RE: [oe] [meta-python][kirkstone][PATCH V1] python3-iperf: initial
 add 0.1.11
Thread-Topic: [oe] [meta-python][kirkstone][PATCH V1] python3-iperf: initial
 add 0.1.11
Thread-Index: AQHYgfJXA6IEEcRZzU2tpB+l20PJgK1UODUAgAPCcLA=
Date: Mon, 20 Jun 2022 08:27:57 +0000
Message-ID: 
 <DB9PR06MB73716C7EA89B3FB41A59B303A9B09@DB9PR06MB7371.eurprd06.prod.outlook.com>
References: <20220617023121.1403528-1-dai-de.li@leica-geosystems.com.cn>
 <b45a0f26-e5c6-b562-96e9-eb2fff5e79dd@gmail.com>
In-Reply-To: <b45a0f26-e5c6-b562-96e9-eb2fff5e79dd@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com.cn;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 392757f6-97ac-450b-01df-08da5296c7fe
x-ms-traffictypediagnostic: DB9PR06MB8464:EE_
x-microsoft-antispam-prvs: 
 <DB9PR06MB8464F73BE5986C868CD1216BA9B09@DB9PR06MB8464.eurprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Of9R2HchIzYSJ6IJDJPfNAVWZTorLFRzojhMGsiW3KMjD5NSJIU5VgwWlRHIysIQtEeRodyNaQWS7QpQRg8EfyAWkjUWRkHxN2K/JtbSWGAmeXJ64W195ZIy2IiI7g6OsdbDd9E+vansdrDHKOaIWusBdA0sgE6STcKntw27h3BNnaqTYObJPF+Vb6ZiCAlfMY1xhDyyKaxR/kd+1sRjTf7Ff0GPEo9RwPbFAXODJGyUVxhq1Mwe2D8sjGpOyO7k7TD5hjf7h9TM4b1szyzIeCw5vYL/wsnFEVOJGr/LX6w9tgC8Gymvg8YDB6s5SZtdztcq86m7scOJysi8UK0RQ4hsoEpQco/S1Ydw3i9JZj2GO+T0J0VSexygBGl/4Krtf/vbLWzkTqDxfGTmX0nfd5TRS9JR0saw593DDnmsz/Qp/0H/7Rr19T3vA9CuzFS2g9E0zYOVzuDUFN/1NGZkl8y6M5n6Heln/EUuLm7AmQYX9sL0elNpVURD8gyicAZW7HHnpRiROa6IXm9552zYI9PZUIj+fiRXNJaTnYfa9TvtyL/cgAM9TbumLIH6CZIausepK8smbbejSxVcUBgGJm9hmqtKOlr9zFE9RS0v/P5CGlcLAkNYbcM38vgxRZJ89GzapXz2ipv1Emer33bBNurMqQhdSPEfgjZ5krNqV34Q+spABM4RLaLoi5lWMTYJxlSsFVZVir1loQDQHIpQ76Ow/xNMdELLfecbKtOsoPPZsJmlBVBlPXdFSLoLCZ89vWyrjNV0Yx6vUYyN0LfLexzoNUmfqaiiDcXW8vyTlVc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7371.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(9686003)(7696005)(110136005)(316002)(38100700002)(186003)(966005)(66946007)(64756008)(55016003)(66446008)(52536014)(38070700005)(122000001)(45080400002)(478600001)(26005)(41300700001)(53546011)(33656002)(5660300002)(86362001)(8936002)(76116006)(66476007)(66556008)(71200400001)(83380400001)(2906002)(8676002)(4326008)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xvMU3IkRBriiGP2V/pkC8T3bD8FPp+S8UOGknhuje+LcpJuhRJqua6lZZYh5?=
 =?us-ascii?Q?jHLh3SzZIcg9daBA6+CJzVW1QMG75SVwCr17XfsMdOeF/h7qoDU/EOfQzwBd?=
 =?us-ascii?Q?zHH8r3yPT3YkYRePdaYj9fz56Cw49WpSamTAMmSH8tRK6yuP9fp6Rozoz7Dw?=
 =?us-ascii?Q?cR6PDk9O1SY6kPkaMKT2EBzVEXgJPAqUN3555afHnLasbO4O+gNgBpCbD1ad?=
 =?us-ascii?Q?m7n+hhDV9pOZex6j2S+zzdmozFz8YeL9DeM711zyUs1e7EJ7SHi9XB1vEWXG?=
 =?us-ascii?Q?dHU327jOrTAuyM+Erjr0XNeA28NQGkDr1ffuNf+Triz4A5cZtQnHIR3oWszL?=
 =?us-ascii?Q?edp6oSv2/4rhB+BxSYWxeK4i1M5u2dXiDmvULR5VbH70urKkUkLoV7NtpJ4P?=
 =?us-ascii?Q?+oTxKDggwtVmd02uGRONMNy7m6JRKeJpijBTLfxbjSLMp1aCAiXsBCbwc23K?=
 =?us-ascii?Q?nYSJv3HAVJMKhZU2T+568LeH1yGQoKAfywcRLXCbgVh506SwpuGzSiVYnevS?=
 =?us-ascii?Q?gyIRyFSX4p3rH6qi9UjAts74NCJaQJUwesbwF196B78+EG8Ksi0/Pa6i5lNC?=
 =?us-ascii?Q?ucfF3OG7ARMVp7ZfBv8IcN3Boua7/Q3s5ruBgt+wJz+z8xuP+mGExXiSbksn?=
 =?us-ascii?Q?hXDrZGdt03xTUdwWe0ciVSI4Cwac0j3fSmdzxsm/5x5wa2F//TkZj1EGIB+6?=
 =?us-ascii?Q?W3HAKLWUc095AxaNzg4p0lQF/rId3UtZYWws1nb5czDgdI62AIy4tLUyLbso?=
 =?us-ascii?Q?DSQGnPLmKpCqtBSsC16syyCVpqLgPRrX+bEVpInsYp/htqpDT3kwxaOd7QcB?=
 =?us-ascii?Q?pA4B0gct43De5gELWXH2Q8qievCUmDOOyrPObfMZetj0zQsJ67KS2qsf9lNj?=
 =?us-ascii?Q?gyb2igObxb9Ox3UuW6f6STiMzMSmfOn0ullKNsV21eGR1vwIYg/A4cUTsA1u?=
 =?us-ascii?Q?UGRYzgOjbJXpLEGHtIexo0BaqYOsZOFaMefDrF8cpLvuQWDl/lI7GQFtYxAE?=
 =?us-ascii?Q?SpIesYzM/XoQRzTkqwdHObzuK2pF0iSUnfdtFwssPVuvO9IHL3FUh5dRpVKo?=
 =?us-ascii?Q?huQ5Q6k40HTUhJ+rZLIflaNunHa2Gin/g9R6vqMdBVtXvschA1agWGvyjDCN?=
 =?us-ascii?Q?cwBN69l1kNMiVWTF74+qNOUtpr24K390+/NU394y1acMYRa1NRx3xC+nWPvE?=
 =?us-ascii?Q?R5BNiF2B3p+cZzECau4MCHKz4SrpUJeCqTMjvzjLfnRRNcr7ulplCEbMiRDh?=
 =?us-ascii?Q?F/C/HbYsidGZEpdlFuozJ+jZS82b2cfnQljkYCEVQpwEprzUZ+MHXVGvYOZB?=
 =?us-ascii?Q?Z8dFFasR90tpb/+iQoQgIHnJ9f92nnlCwKAI/JnsiJnFCbCT2q1ALwTmVfyN?=
 =?us-ascii?Q?AUFevgMCTm2h1VtlvyHMCj9al0cBxLhplFbIGzwKOsruCft3RMPKyl2Mb89I?=
 =?us-ascii?Q?IzytYQM4Xg+FPGa0XyojYY62ss424WR2rDtCNTEkmr6Lvyl+Z1YiKjwsH+qf?=
 =?us-ascii?Q?2nLuUBU8zG7Mp4SyMdkkTBK1vHFre/g1iyidSdqDV3JNw7N2tMxVf2bPHIx3?=
 =?us-ascii?Q?hJeg+NdcWwyFa06khp01jGhLWjFKpqxu29I6aaMOsIPpWENscene79V0eg/p?=
 =?us-ascii?Q?iwAxOaxMBOF7OeXeN2k3eMqh2nOVw2xS2BWBFsfoOjCgQyyiQQvQBSUuascJ?=
 =?us-ascii?Q?BoInE+uLJU3ks8G40KXqdDhV8XC2SNGTGMRNP9M34/mjN5/GbuqeO4mUwF6E?=
 =?us-ascii?Q?Tlz1WMCyxAZqRGO+pNJ7JbzGMpS2EEstu08eELE3zaLNKkequFLF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7371.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 392757f6-97ac-450b-01df-08da5296c7fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 08:27:58.0074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 hqcv453EOOr2piyg47AsQkko835v81FLQM+eanxvfrGVtY0PDoZ9uIsG7qej/ga2kEIfi52HpAGKxuZ01rtEeFYA/WMgkiJnvlIJgaR+GLs4BIwfFDK6nycWlUf2x14A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8464
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jun 2022 08:28:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97546



> -----Original Message-----
> From: akuster808 <akuster808@gmail.com>
> Sent: Saturday, June 18, 2022 7:01 AM
> To: LI Daide <dai-de.li@leica-geosystems.com.cn>; openembedded-
> devel@lists.openembedded.org
> Cc: ldd428@126.com
> Subject: Re: [oe] [meta-python][kirkstone][PATCH V1] python3-iperf: initi=
al
> add 0.1.11
>=20
> [You don't often get email from akuster808@gmail.com. Learn why this is
> important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> This email is not from Hexagon's Office 365 instance. Please be careful w=
hile
> clicking links, opening attachments, or replying to this email.
>=20
>=20
> Stable branches don't get new packages added as per current process.
>=20
> Why does this need to be added?  This needs to be in master regardless.
I've done that and for the moment `kirkstone` patch shall be dropped

Frank Li
>=20
> -Armin
>=20
> On 6/16/22 19:31, Daide Li via lists.openembedded.org wrote:
> > Signed-off-by: Daide Li <dai-de.li@leica-geosystems.com.cn>
> > ---
> >   .../recipes-devtools/python/python3-iperf_0.1.11.bb   | 11 ++++++++++=
+
> >   1 file changed, 11 insertions(+)
> >   create mode 100644
> > meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb
> >
> > diff --git
> > a/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb
> > b/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb
> > new file mode 100644
> > index 000000000..36d646305
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb
> > @@ -0,0 +1,11 @@
> > +SUMMARY =3D "Python wrapper around iperf3"
> > +HOMEPAGE =3D
> "https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2Fthiezn%2Fiperf3-
> python&amp;data=3D05%7C01%7C%7Cd1860f0b89c24a822b9c08da50b53295%7
> C1b16ab3eb8f64fe39f3e2db7fe549f6a%7C0%7C0%7C637911036416155089%7
> CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ
> BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dbn2wd99
> dMeE2IB7MUw%2FObUVvfDA2dO2RWPouL95%2FdS0%3D&amp;reserved=3D0
> "
> > +AUTHOR =3D "Mathijs Mortimer <mathijs@mortimer.nl>"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Df7d0900b3d30647cdda002c9549ca40f"
> > +
> > +PYPI_PACKAGE =3D "iperf3"
> > +
> > +SRC_URI[sha256sum] =3D
> "d50eebbf2dcf445a173f98a82f9c433e0302d3dfb7987e1f21b86b35ef63ce26"
> > +
> > +inherit setuptools3 pypi
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#97532):
> > https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
t
> > s.openembedded.org%2Fg%2Fopenembedded-
> devel%2Fmessage%2F97532&amp;data
> >
> =3D05%7C01%7C%7Cd1860f0b89c24a822b9c08da50b53295%7C1b16ab3eb8f64f
> e39f3e2
> >
> db7fe549f6a%7C0%7C0%7C637911036416155089%7CUnknown%7CTWFpbGZ
> sb3d8eyJWI
> >
> joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
> 000%7
> >
> C%7C%7C&amp;sdata=3Ds2yaq0Rcae%2BWcUUuvLjKm3kJkMw3%2BbBGZHD6
> VkEiCQQ%3D&a
> > mp;reserved=3D0 Mute This Topic:
> > https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
t
> >
> s.openembedded.org%2Fmt%2F91814270%2F3616698&amp;data=3D05%7C01
> %7C%7Cd18
> >
> 60f0b89c24a822b9c08da50b53295%7C1b16ab3eb8f64fe39f3e2db7fe549f6a%7
> C0%7
> >
> C0%7C637911036416155089%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
> LjAwMDAiLC
> >
> JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am
> p;sdata
> > =3D9Xo0zAhnasMElNnsT8QCTP3Ylp6T71I2ael6dOZ9o1E%3D&amp;reserved=3D0
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> > https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
t
> > s.openembedded.org%2Fg%2Fopenembedded-
> devel%2Funsub&amp;data=3D05%7C01%7
> >
> C%7Cd1860f0b89c24a822b9c08da50b53295%7C1b16ab3eb8f64fe39f3e2db7fe
> 549f6
> >
> a%7C0%7C0%7C637911036416155089%7CUnknown%7CTWFpbGZsb3d8eyJWI
> joiMC4wLjA
> >
> wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C
> %7C&am
> >
> p;sdata=3DW%2Fgr7EfJiR5dtEaEj9TuWlp4ThWMtcVWqD5k2HDkQoQ%3D&amp;
> reserved=3D
> > 0 [akuster808@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >


