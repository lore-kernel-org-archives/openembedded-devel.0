Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0064.outbound.protection.outlook.com [157.55.234.64])
	by mail.openembedded.org (Postfix) with ESMTP id 0CCD1731B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 21:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Ywk6+vZGzsxS5Y1pYLfszkxHKo2sGRijIDcNGN98JPo=;
	b=AgCgGFBzH+OvsGSkzr0NxtiQdDQEphOb9kPuwsqaxklxBV6njvIanP8I2zZjq98nfnkdtaWq49CNtu1Fz9ONTV7iDnchfM48zltq4SwEj58afz+y4iNqf0ESJwq33Ejocp8wXQcLlTSC+ywTenfyEIP/OXZtN4x5gsH43NDGi40=
Received: from VI1PR04MB1583.eurprd04.prod.outlook.com (10.164.84.141) by
	VI1PR04MB1581.eurprd04.prod.outlook.com (10.164.84.139) with Microsoft
	SMTP Server (TLS) id 15.1.497.12; Wed, 18 May 2016 21:11:39 +0000
Received: from VI1PR04MB1583.eurprd04.prod.outlook.com ([10.164.84.141]) by
	VI1PR04MB1583.eurprd04.prod.outlook.com ([10.164.84.141]) with mapi id
	15.01.0497.019; Wed, 18 May 2016 21:11:39 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 2/2] freeglut: Add a recipe freeglut to
	replace mesa-glut
Thread-Index: AQHRq71y5vElS8gG6kaEI7SOkSeR35+/H0aAgAAcd2A=
Date: Wed, 18 May 2016 21:11:39 +0000
Message-ID: <VI1PR04MB1583B1C90AD7E88F9D5B2A4091490@VI1PR04MB1583.eurprd04.prod.outlook.com>
References: <1462995709-6171-1-git-send-email-neenareddy.busireddy@nxp.com>
	<1462995709-6171-2-git-send-email-neenareddy.busireddy@nxp.com>
	<20160518192755.GF2579@jama>
In-Reply-To: <20160518192755.GF2579@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.168.49]
x-ms-office365-filtering-correlation-id: b0c079e2-c4b4-46d3-47c9-08d37f61014c
x-microsoft-exchange-diagnostics: 1; VI1PR04MB1581;
	5:5FPs69sa7myqBrDnIlk5N6RfWsBcaTQxzCctJ1wX1bM3DlCtbxDpUG/nSg49hs/JltCB31rB3IZBN7nIdsMh0Q7WElvBk+v8dGLC4NRBHGACJ11Mo/dGJ68RTx95lfUw8v0Q7ze+v2NLM1O7DfTjyQ==;
	24:5yBEGsphwEvNzsZU820d5dmTu3SyAnDQLpp96Ni0mjIABr1a7APViSYW01fLBTKW3PDA/8AQnqyVnclQn0grX9jA4LuvVSid28BeWlgyJSg=;
	7:DT329bsAEtNOU0JD05uvB+kF/WZyBjZX3knUpdJT2XMape1pbO9FBumOq48xManRnekgvOzArABI3aXIrB1isoOm1hrQKnqrdM1RqXspiKNWvviX2UagLvXz0lDoOoET+OPSmHdmwlJDlXkAjm53buIWa02cGTF9+dCk5iU9fljgtPUIHSXxdD0Uo08mHQEZ
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB1581;
x-microsoft-antispam-prvs: <VI1PR04MB1581D7123B8FD20C139D7FB391490@VI1PR04MB1581.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:VI1PR04MB1581; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB1581; 
x-forefront-prvs: 0946DC87A1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(24454002)(586003)(10400500002)(92566002)(50986999)(3846002)(1720100001)(54356999)(76176999)(6116002)(102836003)(106116001)(81166006)(1220700001)(8936002)(110136002)(9686002)(5004730100002)(2351001)(8676002)(66066001)(3660700001)(2501003)(2906002)(3280700002)(5008740100001)(450100001)(74316001)(2900100001)(19580405001)(122556002)(87936001)(107886002)(33656002)(575784001)(15975445007)(11100500001)(189998001)(86362001)(5003600100002)(5002640100001)(2950100001)(19580395003)(77096005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB1581;
	H:VI1PR04MB1583.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2016 21:11:39.8609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB1581
Subject: Re: [meta-oe][PATCH 2/2] freeglut: Add a recipe freeglut to replace mesa-glut
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
X-List-Received-Date: Wed, 18 May 2016 21:11:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Wed, May 11, 2016 at 02:41:49PM -0500, Neena Busireddy wrote:
> FreeGLUT is a free-software/open-source alternative to the OpenGL=20
> Utility Toolkit (GLUT) library.
> More information about this library can be found in=20
> http://freeglut.sourceforge.net/
>=20
> Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
> ---
>  meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb | 17=20
> +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644=20
> meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
>=20
> diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb=20
> b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> new file mode 100644
> index 0000000..7671e75
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "FreeGLUT is a free-software/open-source alternative to =
the OpenGL \
> +               Utility Toolkit (GLUT) library"
> +LICENSE =3D "X-Consortium"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D89c0b58a3e01ce3d8254c9f59e78a=
dfb"
> +
> +SRC_URI =3D "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/=
${BPN}-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "90c3ca4dd9d51cf32276bc5344ec9754"
> +SRC_URI[sha256sum] =3D "2a43be8515b01ea82bcfa17d29ae0d40bd128342f0930cd1=
f375f1ff999f76a2"
> +
> +inherit cmake

you're missing distro_features_check here, so the check bellow doesn't work

[Neena Busireddy]  Oops..Thanks for catching it. I will send another versio=
n.

> +
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +PROVIDES +=3D "mesa-glut"
> +
> +DEPENDS =3D "virtual/libx11 libxmu libxi virtual/libgl libglu libxrandr"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


