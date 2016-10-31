Return-Path: <ting.liu@nxp.com>
X-Greylist: delayed 3575 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 31 Oct 2016 08:49:23 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0067.outbound.protection.outlook.com [104.47.2.67])
	by mail.openembedded.org (Postfix) with ESMTP id 63D5571A15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 08:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=kVvxlIbYoDtjwfB/9R/HX5k2E2zkj+oEhmznqeM794Y=;
	b=pCpEdsh4OtpSDMTJhMEdb1MgstzEYXmryvfQCMXbXTiGI24YB5PQTvTyAzKojJvIIV6vdgI4l4HEagZsk+QxMvoE8xwi0rQBXg6vx6R5kNJSYum315rqbMdVUnbCO/Kl6InRA1USZuA4BxdbGWcz4ZI9G9wyGeTX6EB6DrNCEH8=
Received: from HE1PR0401MB2601.eurprd04.prod.outlook.com (10.168.148.19) by
	HE1PR0401MB2602.eurprd04.prod.outlook.com (10.168.148.20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.693.12; Mon, 31 Oct 2016 04:15:27 +0000
Received: from HE1PR0401MB2601.eurprd04.prod.outlook.com ([10.168.148.19]) by
	HE1PR0401MB2601.eurprd04.prod.outlook.com ([10.168.148.19]) with
	mapi id 15.01.0679.020; Mon, 31 Oct 2016 04:15:27 +0000
From: Ting Liu <ting.liu@nxp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] xterm: use ${libdir} to avoid
	installed-vs-shipped error on ppc64
Thread-Index: AQHSMS5yqg3IZ9YaUEeeyF094mV8xqDB9/wQ
Date: Mon, 31 Oct 2016 04:15:27 +0000
Message-ID: <HE1PR0401MB2601BE9CFC9847715376A0F499AE0@HE1PR0401MB2601.eurprd04.prod.outlook.com>
References: <1477649243-26613-1-git-send-email-ting.liu@nxp.com>
	<CABcZANnSmHOMkrKJ3M6CQN62+JHXCbRzXKZ3Ucx8PQ2_9cfmhQ@mail.gmail.com>
In-Reply-To: <CABcZANnSmHOMkrKJ3M6CQN62+JHXCbRzXKZ3Ucx8PQ2_9cfmhQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ting.liu@nxp.com; 
x-originating-ip: [192.158.241.86]
x-ms-office365-filtering-correlation-id: 57d7b120-9d14-475e-4e26-08d401448b5e
x-microsoft-exchange-diagnostics: 1; HE1PR0401MB2602;
	7:qwu687LAOLJDe9Kyq8PLjqu1DTFZceub2+r/JPXKkPWGSjvjy/u6VzDogop8Afb6rleCcobqrdKqamJjc+L4Jg98zLAtM3eYOOJ0X4QsntRh0fGv9C5YV8E6UfGlnI47+fl8YT+fpbnsApjxr7iQCCuYumf97AlVorNNPnqssdD2+7zznrvch0X+9UEjtYuwfg+/8vSwI39RT++EBv3P9yosWtoNA9yRJrrlWSmx/P3eK8FSagwz3nis3rQvMfsw2vW8xYjqRQbxEBalIvIFenY3PdX/N6AyFk5MZSJOlR4+2wKw43dJ+wmrQHjbtLhkO4WiAk8Jmzw1z4yYXcxwV6Rzqmhu+QiLhBHPGdh18hg=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR0401MB2602;
x-microsoft-antispam-prvs: <HE1PR0401MB2602040F39AAA9E800696A7E99AE0@HE1PR0401MB2602.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249)(166494164430575); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(6045074)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026)(6046074)(6072074);
	SRVR:HE1PR0401MB2602; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0401MB2602; 
x-forefront-prvs: 01128BA907
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(189002)(199003)(377454003)(24454002)(13464003)(2906002)(66066001)(107886002)(76176999)(54356999)(50986999)(6116002)(102836003)(2351001)(3846002)(101416001)(586003)(5660300001)(10400500002)(105586002)(106116001)(106356001)(97736004)(122556002)(189998001)(2501003)(8936002)(81166006)(19580405001)(450100001)(11100500001)(19580395003)(230783001)(9686002)(5002640100001)(8676002)(68736007)(1720100001)(7736002)(81156014)(74316002)(7846002)(305945005)(92566002)(2900100001)(76576001)(15975445007)(87936001)(3660700001)(3280700002)(575784001)(7696004)(110136003)(86362001)(33656002)(6916009)(2950100002)(77096005)(228453006)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0401MB2602;
	H:HE1PR0401MB2601.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2016 04:15:27.0347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2602
Subject: Re: [meta-oe][PATCH] xterm: use ${libdir} to avoid installed-vs-shipped error on ppc64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Oct 2016 08:49:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Christopher Larson
> Sent: Friday, October 28, 2016 11:07 PM
> To: Openembedded Discussion <openembedded-
> devel@lists.openembedded.org>
> Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
> Subject: Re: [oe] [meta-oe][PATCH] xterm: use ${libdir} to avoid installe=
d-vs-
> shipped error on ppc64
>=20
> On Fri, Oct 28, 2016 at 3:07 AM, <ting.liu@nxp.com> wrote:
>=20
> > xterm installs files into PREFIX/lib/X11/app-defaults by default.
> > This leads to QA issue on ppc64 which defines libdir as /usr/lib64:
> > ERROR: QA Issue: xterm: Files/directories were installed but not
> > shipped in any package:
> >   /usr/lib
> >   /usr/lib/X11
> >   /usr/lib/X11/app-defaults
> >   /usr/lib/X11/app-defaults/UXTerm
> >   /usr/lib/X11/app-defaults/KOI8RXTerm-color
> >   /usr/lib/X11/app-defaults/XTerm-color
> >   /usr/lib/X11/app-defaults/UXTerm-color
> >   /usr/lib/X11/app-defaults/KOI8RXTerm
> >   /usr/lib/X11/app-defaults/XTerm
> >
> > Fix it by passing --with-app-defaults=3D${libdir}/X11/app-defaults to
> > configure.
> >
> > Signed-off-by: Ting Liu <ting.liu@nxp.com>
> > ---
> >  meta-oe/recipes-graphics/xorg-app/xterm_325.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> > b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> > index e0baf3c..48556c7 100644
> > --- a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> > +++ b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> > @@ -14,6 +14,7 @@ PACKAGECONFIG[xft] =3D
> > "--enable-freetype,--disable-freetype,libxft
> > fontconfig fre
> >
> >  EXTRA_OECONF =3D " --x-includes=3D${STAGING_INCDIR} \
> >                   --x-libraries=3D${STAGING_LIBDIR} \
> > +                 --with-app-defaults=3D${libdir}/X11/app-defaults \
> >
> > FREETYPE_CONFIG=3D${STAGING_BINDIR_CROSS}/freetype-config
> > \
> >                   --disable-imake \
> >                   --disable-rpath-hack \
> >
>=20
> Are you sure this is correct? I highly doubt those files are actually mul=
tilib
> specific. Would it not be better to just package these files in their cur=
rent
> location?
[Liu Ting-B28495] I have sent another patch to package these files in their=
 current location. Thanks.

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus Maintainer - Tslib Senior
> Software Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

