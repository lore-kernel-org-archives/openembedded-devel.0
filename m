Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.95])
 by mx.groups.io with SMTP id smtpd.web10.3924.1632204217956217715
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 23:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=eGbm/0Cs;
 spf=pass (domain: skidata.com, ip: 40.107.7.95, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNodHTjRDZcRFCsGB3/7BnENfAixryEF7RS3TYl89lb25kCldkiW7Q7x9CvDBqwdb3WW2uAattP56C3ROV00h81UjZ6OUTLA6N7nKntmq9xyppIiBxfnqCnme9p3ryAxz3Z+Vmea6OEqtRtOG19z+OZknYXN6GChYYv2MWRNctiwxUTgWoFqOilPV/HcCG51HQc2ff+zcY3tDYp3l8rygbgZZJhjKzw4o+VFZAjmSj0NarTJNfgVE1f0bv7CpVpJh2+4jEjZM8pY38zdXqSxSPsQxgP9FP32ZeNqkhqk5Sgt030WCQMe03Lxc5+ASUmZAh09P/BtrAJQKhBeRdvF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Nq0XvAZEMesbOju3hG9A8eiRJG0TOsoh2eY2Srr9nRY=;
 b=oVLty4xEVV8XIZtd5rGzd67cg4gO4KP/4zw37KcB6fQ4euzFMt3/ouZGhiEaPFe4B87R88HhiSckDeXV4kLy1EcZTRmo9dH85dPgdRxWa838CnIGK6mqZLE3D7sJVfk7j4wbDALLaDx3zRb2B3xpLL+5DbYjeIAS0HtLb5MA+3Y8bZ1XW/VBZSbiYDNqItRZW/dkYkAorsk4DJpE4KxfjDkayXCxXYftX1RPsCthb6HvDZc8rMgOpED30YitwHXCCF4RAWvb1bhoc4+lKz2aQ4blpRcvFmM9ScX1g7/vDdMd8EROBe7jjD44yzLjzxE1MkNLH9mevV3EgQxjEdX0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nq0XvAZEMesbOju3hG9A8eiRJG0TOsoh2eY2Srr9nRY=;
 b=eGbm/0CsX30dLe5I4Oz1ulmWKk2/MOQUxlsxeJDoeG4y9P1a3vo4g5scyxFQptpIskhRnWLlHpfNfFvMpr8TG+dkwqLvYt8s4DtC0QjPn1Wx88LgkpUTZmOQAjPJA5LdgH6tN36Cfz27sY+J1L3KVQz0iq2LoBG4izSBxfnLld6mkrRa1nz9131SpKTPpp+8LGt3fxHXgQxZjlUc/x/2TZWUfuytUyJp74Mw4OXw7nvLX9nGY5Atu4HncDtKj64ChVWqeugNPaODQdACPrnAaolLNYn5KHZltEvNk9VIZmNH+oGxbpTl3MdXvHa5f9pV7reZQaXiGSXDaC3LpPdY5g==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by VI1PR05MB4560.eurprd05.prod.outlook.com (2603:10a6:802:62::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Tue, 21 Sep
 2021 06:03:34 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::dc9b:c50d:7c4d:fae7]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::dc9b:c50d:7c4d:fae7%3]) with mapi id 15.20.4523.019; Tue, 21 Sep 2021
 06:03:34 +0000
From: "Richard Leitner" <richard.leitner@skidata.com>
To: "geoffhp@gmail.com" <geoffhp@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Geoff Parker
	<geoffrey.parker@arthrex.com>
Subject: Re: [oe] [meta=java][PATCH] layer.conf: Mark as compatible with honister
Thread-Topic: [oe] [meta=java][PATCH] layer.conf: Mark as compatible with
 honister
Thread-Index: AQHXrlsD2RoiqNf7F0OkZfnyrOGRSauuABqA
Date: Tue, 21 Sep 2021 06:03:34 +0000
Message-ID: <YUl1tUiZI31wm/vc@ltleri2>
References: <20210920200607.929739-1-geoffhp@gmail.com>
In-Reply-To: <20210920200607.929739-1-geoffhp@gmail.com>
Accept-Language: en-AT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7abb138d-17d6-4a65-1a5e-08d97cc58b92
x-ms-traffictypediagnostic: VI1PR05MB4560:
x-microsoft-antispam-prvs: 
 <VI1PR05MB45607B0535E39FAA79A9ACD9F0A19@VI1PR05MB4560.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1JDwYbe2jgnHcGlEJf7mD3u0pOIOGAQTBvu/PugEdqJRgVinklrAHFFKC2pARq03sHwwUoyGbYkWcSLNycd5jm1nUvZebRoP55CFGZ9hL6BR1riQj2XUFz86so78YcsK+SC9ZbdCRTbBx9gNJPS0OljqeKWKrbIz18Pm5mFkCfbztfwdd8ucAc+UFYa0t/RM7m4ai8H8FYAj/rHenvHPTikX2quoP7il+vm+O0NCwfNAPCOK3UyyRhlvDyjWvFu4JFTzbkDFXYYVpk0mAodC5qCcEizS2Fc8D/cMp5POvx4i0UpX5rXUMYHVXHVgvvfYbw+DrQWtCiI/5k58JqkqHdLm13XzVi2Y5Zo0bLVOlvNo8sN1SYv62N+fC7ts2tZKA1149cnBCcw1U4M0Ce88nWe0r42cK4DvG2d6szQBFvVwWYjHcyIE0loN98oXMxMrefrqw+Ny73OR0RByF5BaWfrhhEtkL4aPFEHoJ8KnJKiox+pHrKXpQ4b4OAfsViWDGp/FP824g5y7jmz1npSTdyQMKhN0mZdHmFAyFlqfMhsDTMRaxk2p0eo89FSR4jv+N2ljD5rkpEgtPEZzF3gnsZ4NqUUc8qR78TwIkZdDhB9fk0/BJ5iotksDoe+NyGZJoHH4XxCr/LKjTlcrl8mVXu8o19n55PR2PP+DrFTS8C3SMpmEsePrMuTIPpeMCsLFWhrp/kfKSzbjBBAxeqFT99Bxj57BPLiSBeO/cmiBlkSIB4BmH1m45RPwXoqKJ7mOWUVomG8q0dcCYurWD4IN7UIlSGoEkYu5wW4tzS7N08A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(38100700002)(966005)(26005)(6916009)(2906002)(122000001)(508600001)(4326008)(186003)(8936002)(38070700005)(9686003)(5660300002)(6512007)(83380400001)(86362001)(8676002)(66476007)(76116006)(6486002)(66946007)(71200400001)(54906003)(66556008)(316002)(66446008)(6506007)(64756008)(33716001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?EOiMAj5KNXZKbzjZ/AF4jty5qxBKAhqZcQNK/kzi59NpMd8Xzol4RahcHlyt?=
 =?us-ascii?Q?lT1RA3sG0pUZhqY6FnlsdYMVbyZbH8ExXNUG50kOa22yD8yEohgb9sB/xgiT?=
 =?us-ascii?Q?PgdFtyMCHcgjWBk5KHI558BjkWBCah7SuKnvj3xWU87LQhFvXQZza2kzbAZ+?=
 =?us-ascii?Q?jMq8bcdAJycL9g9mKv96P+oPmk8niyp9CNBFliu8Td1K1Wd15srC/h2bxvXR?=
 =?us-ascii?Q?UB7ZrbbB91m96ALZ+tGAYvHwDD2TkNGOSKZN3U5dLE2hjgo42ue+CmKMk/Z5?=
 =?us-ascii?Q?5PvB6ZpNTgzv4SRnrtTFG84570KufcjpnedI61lXZMeIW4pMBlVBHEjM/87C?=
 =?us-ascii?Q?hbJhtqLLL1bbofNPBiVAI/sZ514nurTP8BO+hLEoPDrIbCtI864naoy/qRyD?=
 =?us-ascii?Q?4HUxcb35RnH/rR9r0IiNbCmAGhKNH6PYtNzYILKLcnhONOBSTtKthxoLBPPb?=
 =?us-ascii?Q?5vcsUIlPpjdFMTiJyD82EQSd5SlG9b6VpJ8eLkUiwHYnrxHWZXJWf6IRT3Bu?=
 =?us-ascii?Q?9OF7IXh68uJiSAlJpZW7WotQTciRoP2AICvYG1fEBZZk5Vxrx1GjHh6vwpF1?=
 =?us-ascii?Q?tOc99x0VjaeA7jmWKrIsKCaUeSc3YM7VJr/XvY4wddfa/43LgREJWqcYTnU/?=
 =?us-ascii?Q?LTvQeiZu1JqOprlcI1OArDEtE7rIp+9u7H0HNahctA+sdZ1gNkrUzNtizIoE?=
 =?us-ascii?Q?mHkTsX2m3DRyzFpeE3Rlw8OqG04RB94hQB7WV1kKdNYO0TKrZKE78dFoG33h?=
 =?us-ascii?Q?hm7VbJWSaf6xAn+UYBdy59ZDem95JQJ/dxDwnkA6Wy1hNLJtxSzUJm2W+88T?=
 =?us-ascii?Q?3i/LHRSLMCn8bQebdGSGaS89vttUFuhWOMjmViz+iTPX4lG3orBphlkmvokD?=
 =?us-ascii?Q?4shTZ2zvABxSOoYS1yBE/oHyQ145oyYBW/ffBSP+B9XoQdk2X5FzUWMOhyUL?=
 =?us-ascii?Q?/yCC2922zZSiT7wPddK2qpJh11FjrCIiwyZH0tLef6NoQHmI4Vb+a4SoStJu?=
 =?us-ascii?Q?s5b1pCDyTEPe1ebuLTy4/4j9KR0rjADBKr/5YdHcZcFg+nwtwt3/T2JT8fxw?=
 =?us-ascii?Q?Bg9Ypd5NVnkmuylT2o/JpC2/1XoX/jztLFeoseS2KjTmxzcmZ+s1GthNed+y?=
 =?us-ascii?Q?NxdZN+AeaGypv342HVLbVbkjZnrPoMlA2V6HevH4BumDGqer2fk7XmEay5+1?=
 =?us-ascii?Q?szTkGLIiGsuWzfXJrHbvxscUHQ37tQChcJbzewYNvewZNO0xf2UCYwmW4S8Y?=
 =?us-ascii?Q?STZYAoMe1AZhjYmxko7Vq3W05ZvmtkbfokVfv6N4MSbKEbKFhfziR9h/f/ad?=
 =?us-ascii?Q?Xp2ocfBd3nd2us1wX7Ks4Tqi3dzRz4MnlP/roe+We+OI0Q=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abb138d-17d6-4a65-1a5e-08d97cc58b92
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 06:03:34.0361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vnDFokn9e9JTlei/wP6W4fABSQSvsxxiYQ6LNPR2YhJZQ05H6/8FKxCmf05gqy9o0W8uZsKVAhjehWhx39C4LrKBhCoC8ycyVEvx37a9ppM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4560
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4F5C30FFA76E384BB26412E89D5AC68F@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Geoff,

On Mon, Sep 20, 2021 at 01:06:07PM -0700, Geoff Parker via lists.openembedd=
ed.org wrote:
> From: Geoff Parker <geoffrey.parker@arthrex.com>

Thanks for the patch, but we have the same already in master-next! I'll
try to finish the tests and merge master-next into master today.

regards;rl

> Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 7ef116d..7791178 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/rec=
ipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "meta-java"
>  BBFILE_PATTERN_meta-java :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-java =3D "10"
> -LAYERSERIES_COMPAT_meta-java =3D "dunfell gatesgarth hardknott"
> +LAYERSERIES_COMPAT_meta-java =3D "dunfell gatesgarth hardknott honister"
>  LAYERDEPENDS_meta-java +=3D "openembedded-layer"
> =20
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> --=20
> 2.30.2
>=20

>=20
>=20
>=20
