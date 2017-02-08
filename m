Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0061.outbound.protection.outlook.com [104.47.2.61])
	by mail.openembedded.org (Postfix) with ESMTP id 1B09D71CCB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UNGV9rFyhQRYybkg6225PUXCZsH8k1dpXzYztoE74gg=;
	b=XI/DHfUH8p7QO7CDwtjmTZOADvB1qo8RUpLoYM+4ZJWTbDDX1784AxQdmvLCJVl30DVOft0Ooo+JqABo6Q0SNoRUXAq24LShx2is5en2FPN290haX+2Vdix7uqd5z4CmxiOo7DEjb8npDB8i2wQ3bd8JeXbgTGevFAn8G/Tf/OE=
Received: from AM5PR0402MB2817.eurprd04.prod.outlook.com (10.175.41.136) by
	AM5PR0402MB2818.eurprd04.prod.outlook.com (10.175.41.137) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.888.16; Wed, 8 Feb 2017 17:42:50 +0000
Received: from AM5PR0402MB2817.eurprd04.prod.outlook.com ([10.175.41.136]) by
	AM5PR0402MB2817.eurprd04.prod.outlook.com ([10.175.41.136]) with
	mapi id 15.01.0888.026; Wed, 8 Feb 2017 17:42:50 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt5][PATCH v2] qt3d: Add assimp dependency
Thread-Index: AQHSePE4udh2CHVaXk+7UrmdTc4SRKFdgbAAgAHsOjA=
Date: Wed, 8 Feb 2017 17:42:50 +0000
Message-ID: <AM5PR0402MB281713F0BB2D14E79F61E00DE2420@AM5PR0402MB2817.eurprd04.prod.outlook.com>
References: <1485557640-10259-1-git-send-email-tom.hochstein@nxp.com>
	<20170207120034.GC3276@jama>
In-Reply-To: <20170207120034.GC3276@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [192.88.168.50]
x-ms-office365-filtering-correlation-id: 1d5f4e63-15fc-46bf-d771-08d45049e745
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(48565401081);
	SRVR:AM5PR0402MB2818; 
x-microsoft-exchange-diagnostics: 1; AM5PR0402MB2818;
	7:dZsejXN8kQS+z+dbYJo0edEU/lwZTTRBhALTW3M9E8nr4PChXQPJ1GKd1iEdeTdI3700CAuuqHEjzfUwPkwCyuEMCXKj5FhAO9VxvZpeV8foU+GLUbEOlDaVDDOblaBRvHMIczkPpzevYtiJ0OydJr3mLMhtlq/IM9KJS7Do0jW1I1fKmmG5z0mE4xWFA8hkY8DFJw5zFE0qAM5iJjcFptL5cErfzgSb+Ujsn9trkRNvcvzz0uP+ULR0AVH3RMFqxtc1UGdIwtZ1gaKiYeEZRJ6YhBL1Mz9r0xc6jA+IckWQ+gKs9O81jILrUWYE7hYmIeXlj5FxEaF5b+q/7bBv2BUJ1AjgYVFw28JHRQU36Z4UMUMmR0HzpIBCqRk7sELE7bset8o3q9I4Bm9Pw2RS5hEVpGng8K261h/omM+F7gLk5NkiKbGptwlQfvRQP4vTu+kkAFIX7BbnJq8xx2TRp1oZ1Hc+EfvdAhA4gFKrSzou6Xgz5vJrpPUdFDpLIHymMC4tAcikxmlydPxcSRo75Q==
x-microsoft-antispam-prvs: <AM5PR0402MB281803178033BD0433577798E2420@AM5PR0402MB2818.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(189930954265078)(185117386973197)(264703809997249)(45079756050767);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(2017020702029)(5005006)(8121501046)(20170203043)(10201501046)(3002001)(6055026)(6041248)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(20161123558025)(6072148);
	SRVR:AM5PR0402MB2818; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2818; 
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39840400002)(39410400002)(39850400002)(39860400002)(39450400003)(13464003)(199003)(377454003)(24454002)(189002)(97736004)(5660300001)(122556002)(25786008)(99286003)(2950100002)(106116001)(5640700003)(105586002)(55016002)(6306002)(450100001)(229853002)(2501003)(7736002)(38730400002)(6916009)(33656002)(305945005)(110136004)(86362001)(189998001)(106356001)(2351001)(68736007)(101416001)(2906002)(50986999)(53936002)(74316002)(81156014)(8676002)(8936002)(2900100001)(76176999)(54356999)(77096006)(3280700002)(81166006)(6246003)(3846002)(6116002)(92566002)(6436002)(7696004)(102836003)(3660700001)(6506006)(9686003)(66066001)(32563001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2818;
	H:AM5PR0402MB2817.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2017 17:42:50.7509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2818
Subject: Re: [meta-qt5][PATCH v2] qt3d: Add assimp dependency
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
X-List-Received-Date: Wed, 08 Feb 2017 19:16:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On
> Behalf Of Martin Jansa
> Sent: Tuesday, February 07, 2017 6:01 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-qt5][PATCH v2] qt3d: Add assimp dependency
>=20
> On Fri, Jan 27, 2017 at 04:54:00PM -0600, Tom Hochstein wrote:
> > Fix build error:
> >
> > fatal error: assimp/Importer.hpp: No such file or directory
>=20
> I'm was able to build qt3d without this dependency, is there something
> in your config which enabled it? Or is it autodetected from sysroot
> which wont be an issue anymore with master and RSS, but your change
> doesn't fix the autodetection for older branches.

We do enable assimp from another recipe.

I am unable to reproduce the original problem either.

Without the explicit dependency, it would seem that the build would at best=
 be non-deterministic, enabling or disabling assimp support based solely on=
 the timing of the Yocto tasks. I'm not aware of the technologies you allud=
e to. Do they provide some determinism for this case?

>=20
> > Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> > ---
> >  recipes-qt/qt5/qt3d_git.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> > index 2276c36..7c31213 100644
> > --- a/recipes-qt/qt5/qt3d_git.bb
> > +++ b/recipes-qt/qt5/qt3d_git.bb
> > @@ -19,6 +19,7 @@ PACKAGECONFIG ??=3D ""
> >  PACKAGECONFIG_class-native ??=3D "tools-only"
> >  PACKAGECONFIG_class-nativesdk ??=3D "tools-only"
> >  PACKAGECONFIG[tools-only] =3D "CONFIG+=3Dtools-only"
> > +PACKAGECONFIG[assimp] =3D ",,assimp"
> >
> >  EXTRA_QMAKEVARS_PRE +=3D "${PACKAGECONFIG_CONFARGS}"
> >
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> >
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists=
.openembedded.org%2Fmailman%2Flistinfo%2Fopenembedde
> d-
> devel&data=3D01%7C01%7Ctom.hochstein%40nxp.com%7Cfa462298ac744a52797808d4=
4f50f020%7C686ea1d3bc2b4c6fa92cd99c5c301635
> %7C0&sdata=3DmLf9Lt9hQ5Rn8Ygbq7PczLY4Ix%2BscnMCbhC%2BDyUwLLM%3D&reserved=
=3D0
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

