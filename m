Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0044.outbound.protection.outlook.com [104.47.2.44])
	by mail.openembedded.org (Postfix) with ESMTP id A7D5A6079E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=uxgCBCWJdmvkN/8DE8jssYId8uESxx1SV17U9nZV+UQ=;
	b=u4KjftU0RwLc/JLpWbDl1nqM9H4j0pO8P1gZWDt4fcb2gTGlG9EDRKANSlf6R2VaMi+R4tPnIbeNFiYyn0Xply3i2jt/dVpPYEWzFopmAsUCh2BjkrcqOmRNEbuOwQ9v8LyYdgNMFPiVbK5LoYQGf5ymy/hRr4OOxzu6rQLrzxI=
Received: from AM5PR0402MB2817.eurprd04.prod.outlook.com (10.175.41.136) by
	AM5PR0402MB2819.eurprd04.prod.outlook.com (10.175.41.138) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.888.16; Thu, 9 Feb 2017 15:03:34 +0000
Received: from AM5PR0402MB2817.eurprd04.prod.outlook.com ([10.175.41.136]) by
	AM5PR0402MB2817.eurprd04.prod.outlook.com ([10.175.41.136]) with
	mapi id 15.01.0888.026; Thu, 9 Feb 2017 15:03:34 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt5][PATCH v2] qt3d: Add assimp dependency
Thread-Index: AQHSePE4udh2CHVaXk+7UrmdTc4SRKFdgbAAgAHsOjCAACdZgIAA2MSAgABqZ8A=
Date: Thu, 9 Feb 2017 15:03:34 +0000
Message-ID: <AM5PR0402MB28177494309F8D92F2474558E2450@AM5PR0402MB2817.eurprd04.prod.outlook.com>
References: <1485557640-10259-1-git-send-email-tom.hochstein@nxp.com>
	<20170207120034.GC3276@jama>
	<AM5PR0402MB281713F0BB2D14E79F61E00DE2420@AM5PR0402MB2817.eurprd04.prod.outlook.com>
	<CA+chaQc9+Pxi5LDw1cBf2CFmYwTrNwkumuyobMO2A_TMdgW0FQ@mail.gmail.com>
	<9bcacfd6-2dcf-9c71-7a40-468a76f66efd@gmail.com>
In-Reply-To: <9bcacfd6-2dcf-9c71-7a40-468a76f66efd@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [192.88.168.50]
x-ms-office365-filtering-correlation-id: 115b5c5e-7458-44ef-ace0-08d450fcd1e0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(48565401081);
	SRVR:AM5PR0402MB2819; 
x-microsoft-exchange-diagnostics: 1; AM5PR0402MB2819;
	7:iIDJVqFm2vYOZWI6s7EZxSDv5hFxIuJEGWkVkWijACmfYp79ZnP6NTsm+L4p8tkrDpwA1iERbMA/v0HUNIWmjk1dDIu0e/HPdj2J3ZWhJHyTRAIcei//9X+I7k8aEaT745iKERamk+lrSYG4PNYMbp/LQcMNiX9m2qoMGTpvojnBOkRyKlOUoNbU9kI3PqPaAZCxCvs5Uav5jhq7m6Qhdm+Bjsylv1vxKMtTB6R1opHXRcnzBrXEe9cbPsVTjnPNNgyjjBeDLs856La6/LeskMXou/6k1LzyHT9aEO/tpliQQMSwU8k2jnQ1EQPv8TFil/5p2WBYm+/A6C8r3KGPSymMkX6qrMSDpcfpj75HJvjaqxDJ4+Y/E6do/CrbNs5YnTpXsO9C1UEp+FVxEoX7hkrgcVj9KtlqwiMKeJ+F1/w0JwbzMwDG1MPTmCxZIrmWSeFgpBin9IwyAI/4fRzIkxUj/JSwgb3NVXVPsC72fyr/qkaGlLimt4Ovb5bZfmyVtkGXUaPsZE//W0vOgJySFA==
x-microsoft-antispam-prvs: <AM5PR0402MB2819C0FC9EF636C6B6E309A2E2450@AM5PR0402MB2819.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(189930954265078)(185117386973197)(264703809997249)(45079756050767);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026)(6041248)(20161123555025)(20161123564025)(20161123558025)(20161123562025)(20161123560025)(6072148);
	SRVR:AM5PR0402MB2819; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2819; 
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39860400002)(39410400002)(39840400002)(39450400003)(39850400002)(24454002)(13464003)(377454003)(199003)(189002)(93886004)(122556002)(81166006)(2900100001)(9686003)(229853002)(6306002)(7696004)(53546003)(450100001)(6246003)(38730400002)(5660300001)(33656002)(6116002)(110136004)(3846002)(3660700001)(6916009)(2950100002)(2351001)(66066001)(102836003)(8936002)(97736004)(105586002)(106116001)(106356001)(25786008)(5640700003)(8676002)(81156014)(55016002)(53936002)(68736007)(6506006)(101416001)(2501003)(77096006)(92566002)(6436002)(76176999)(54356999)(50986999)(575784001)(3280700002)(74316002)(99286003)(86362001)(2906002)(189998001)(7736002)(305945005)(32563001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2819;
	H:AM5PR0402MB2817.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2017 15:03:34.7013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2819
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
X-List-Received-Date: Thu, 09 Feb 2017 15:17:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On
> Behalf Of Samuli Piippo
> Sent: Thursday, February 09, 2017 2:39 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-qt5][PATCH v2] qt3d: Add assimp dependency
>=20
> In 5.8 (master), there is now a "system-assimp" PACKAGECONFIG option
> that correctly enables/disables assimp dependency.
>=20
> >>>> fatal error: assimp/Importer.hpp: No such file or directory
>=20
> Is this really a fatal build error or a config test error?
> In case qt3d doesn't find system assimp, it will use its internal copy
> of it.

As I remember it was a build error, but unfortunately I don't have the surr=
ounding error text to confirm this and cannot reproduce the error.

>=20
>=20
> On 02/08/2017 09:43 PM, Martin Jansa wrote:
> > RSS:
> > https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgit=
.openembedded.org%2Fopenembedded-
> core%2Fcommit%2F%3Fid%3D809746f56df4b91af014bf6a3f28997d6698ac78&data=3D0=
1%7C01%7Ctom.hochstein%40nxp.com%7Ca8f9c04
> 444d8432f897808d450c73559%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdata=3D=
slwG0AloaQo4oRoDA3GHD6BmPdQ7bzw02GkRJHlp
> aWQ%3D&reserved=3D0
> > https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flis=
ts.openembedded.org%2Fpipermail%2Fopenembedded-
> architecture%2F2017-
> January%2F000384.html&data=3D01%7C01%7Ctom.hochstein%40nxp.com%7Ca8f9c044=
44d8432f897808d450c73559%7C686ea1d3bc2b4c6f
> a92cd99c5c301635%7C0&sdata=3DNL7A%2B0Dj6Mgt4osVT10RGZM3Iz0jpLzTwQemNqD%2B=
YgA%3D&reserved=3D0
> > and following threads
> >
> > For morty and older releases you need to disable autodetection in qt3d
> > sources when the assimp PACKAGECONFIG is not enabled (see PACKAGECONFIG=
 in
> > other recipes for some examples how to do it - but for qt5 it's often
> > tricky as it rarely has enable/disable options usable in configure and =
has
> > to be patched).
> >
> > Otherwise assimp can still be detected when it's built as a dependency =
of
> > some other recipe and might be removed from sysroot while qt3d build is
> > already running and causing the issues you were trying to fix.
> >
> > On Wed, Feb 8, 2017 at 6:42 PM, Tom Hochstein <tom.hochstein@nxp.com> w=
rote:
> >
> >>
> >>
> >>> -----Original Message-----
> >>> From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> >> openembedded-devel-bounces@lists.openembedded.org] On
> >>> Behalf Of Martin Jansa
> >>> Sent: Tuesday, February 07, 2017 6:01 AM
> >>> To: openembedded-devel@lists.openembedded.org
> >>> Subject: Re: [oe] [meta-qt5][PATCH v2] qt3d: Add assimp dependency
> >>>
> >>> On Fri, Jan 27, 2017 at 04:54:00PM -0600, Tom Hochstein wrote:
> >>>> Fix build error:
> >>>>
> >>>> fatal error: assimp/Importer.hpp: No such file or directory
> >>>
> >>> I'm was able to build qt3d without this dependency, is there somethin=
g
> >>> in your config which enabled it? Or is it autodetected from sysroot
> >>> which wont be an issue anymore with master and RSS, but your change
> >>> doesn't fix the autodetection for older branches.
> >>
> >> We do enable assimp from another recipe.
> >>
> >> I am unable to reproduce the original problem either.
> >>
> >> Without the explicit dependency, it would seem that the build would at
> >> best be non-deterministic, enabling or disabling assimp support based
> >> solely on the timing of the Yocto tasks. I'm not aware of the technolo=
gies
> >> you allude to. Do they provide some determinism for this case?
> >>
> >>>
> >>>> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> >>>> ---
> >>>>  recipes-qt/qt5/qt3d_git.bb | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> >>>> index 2276c36..7c31213 100644
> >>>> --- a/recipes-qt/qt5/qt3d_git.bb
> >>>> +++ b/recipes-qt/qt5/qt3d_git.bb
> >>>> @@ -19,6 +19,7 @@ PACKAGECONFIG ??=3D ""
> >>>>  PACKAGECONFIG_class-native ??=3D "tools-only"
> >>>>  PACKAGECONFIG_class-nativesdk ??=3D "tools-only"
> >>>>  PACKAGECONFIG[tools-only] =3D "CONFIG+=3Dtools-only"
> >>>> +PACKAGECONFIG[assimp] =3D ",,assimp"
> >>>>
> >>>>  EXTRA_QMAKEVARS_PRE +=3D "${PACKAGECONFIG_CONFARGS}"
> >>>>
> >>>> --
> >>>> 1.9.1
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>>
> >>> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fl=
ists.
> >> openembedded.org%2Fmailman%2Flistinfo%2Fopenembedde
> >>> d-
> >>> devel&data=3D01%7C01%7Ctom.hochstein%40nxp.com%
> >> 7Cfa462298ac744a52797808d44f50f020%7C686ea1d3bc2b4c6fa92cd99c5c301635
> >>> %7C0&sdata=3DmLf9Lt9hQ5Rn8Ygbq7PczLY4Ix%2BscnMCbhC%2BDyUwLLM%3D&reser=
ved=3D0
> >>>
> >>> --
> >>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >>
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists=
.openembedded.org%2Fmailman%2Flistinfo%2Fopenembedde
> d-
> devel&data=3D01%7C01%7Ctom.hochstein%40nxp.com%7Ca8f9c04444d8432f897808d4=
50c73559%7C686ea1d3bc2b4c6fa92cd99c5c301635
> %7C0&sdata=3Dgs5n%2FZqFAO8HLTQOrOi4nql3wTRykYUUhM9BCGb9sRY%3D&reserved=3D=
0
> >>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists=
.openembedded.org%2Fmailman%2Flistinfo%2Fopenembedde
> d-
> devel&data=3D01%7C01%7Ctom.hochstein%40nxp.com%7Ca8f9c04444d8432f897808d4=
50c73559%7C686ea1d3bc2b4c6fa92cd99c5c301635
> %7C0&sdata=3Dgs5n%2FZqFAO8HLTQOrOi4nql3wTRykYUUhM9BCGb9sRY%3D&reserved=3D=
0

