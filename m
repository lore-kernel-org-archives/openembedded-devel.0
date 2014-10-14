Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0103.outbound.protection.outlook.com [157.56.110.103])
	by mail.openembedded.org (Postfix) with ESMTP id 8B4AA6ACB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 08:09:23 +0000 (UTC)
Received: from BN1PR03MB156.namprd03.prod.outlook.com (10.255.201.28) by
	BN1PR03MB154.namprd03.prod.outlook.com (10.255.201.18) with Microsoft
	SMTP Server (TLS) id 15.0.1049.19; Tue, 14 Oct 2014 07:37:47 +0000
Received: from BN1PR03MB156.namprd03.prod.outlook.com ([169.254.14.49]) by
	BN1PR03MB156.namprd03.prod.outlook.com ([169.254.14.49]) with mapi id
	15.00.1049.012; Tue, 14 Oct 2014 07:37:47 +0000
From: "ting.liu@freescale.com" <ting.liu@freescale.com>
To: Robert Yang <liezhi.yang@windriver.com>
Thread-Topic: [oe] [meta-oe][PATCH] libunwind: Fix test case link failure on
	PowerPC systems with Altivec
Thread-Index: AQHP5H+lvi+0CMmpcUGW6HJWL7sz4pwvOiYQ
Date: Tue, 14 Oct 2014 07:37:46 +0000
Message-ID: <e96e07922dc7420781f535727beb36d5@BN1PR03MB156.namprd03.prod.outlook.com>
References: <1411455848-21704-1-git-send-email-ting.liu@freescale.com>
	<5437C6BD.7080308@windriver.com>
In-Reply-To: <5437C6BD.7080308@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [123.151.195.49]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1PR03MB154;
x-exchange-antispam-report-test: UriScan:;
x-forefront-prvs: 03648EFF89
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(479174003)(189002)(377454003)(13464003)(24454002)(51704005)(19580395003)(19580405001)(99286002)(92566001)(122556002)(108616004)(106116001)(50986999)(86362001)(575784001)(105586002)(46102003)(76576001)(110136001)(76176999)(107046002)(33646002)(77096002)(101416001)(106356001)(4396001)(95666004)(80022003)(54356999)(66066001)(99396003)(2656002)(21056001)(97736003)(85852003)(87936001)(31966008)(120916001)(64706001)(20776003)(76482002)(85306004)(74316001)(40100003)(211663006)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR03MB154;
	H:BN1PR03MB156.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libunwind: Fix test case link failure on PowerPC systems with Altivec
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Oct 2014 08:09:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Robert Yang [mailto:liezhi.yang@windriver.com]
> Sent: Friday, October 10, 2014 7:45 PM
> To: openembedded-devel@lists.openembedded.org; Liu Ting-B28495
> Subject: Re: [oe] [meta-oe][PATCH] libunwind: Fix test case link failure =
on
> PowerPC systems with Altivec
>=20
>=20
> Hi Ting,
>=20
> Would you please send it to oe-core, or I can help ? It had conficts, I
> updated it:

Please do it. Thanks.

>=20
>  From 719aa29b604df59538eea6e9b9a8595389dc79f3 Mon Sep 17 00:00:00 2001
> From: Ting Liu <ting.liu@freescale.com>
> Date: Tue, 23 Sep 2014 15:04:08 +0800
> Subject: [PATCH] libunwind: Fix test case link failure on PowerPC systems
>   with Altivec
>=20
> Fixed:
> ppc64-test-altivec.o: In function `vec_stack':
> tests/ppc64-test-altivec.c:54: undefined reference to `_Uppc64_init_local=
'
> tests/ppc64-test-altivec.c:67: undefined reference to `_Uppc64_get_reg'
> tests/ppc64-test-altivec.c:72: undefined reference to `_Uppc64_get_fpreg'
> tests/ppc64-test-altivec.c:82: undefined reference to `_Uppc64_regname'
> tests/ppc64-test-altivec.c:94: undefined reference to `_Uppc64_get_proc_n=
ame'
> tests/ppc64-test-altivec.c:109: undefined reference to `_Uppc64_step'
> tests/ppc64-test-altivec.c:62: undefined reference to `_Uppc64_get_reg'
> tests/ppc64-test-altivec.c:112: undefined reference to `_Uppc64_get_reg'
>=20
> Signed-off-by: Ting Liu <ting.liu@freescale.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   ...k-failure-on-PowerPC-systems-with-Altivec.patch |   31
> ++++++++++++++++++++
>   meta/recipes-support/libunwind/libunwind_1.1.bb    |    1 +
>   2 files changed, 32 insertions(+)
>   create mode 100644
> meta/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-
> PowerPC-systems-with-Altivec.patch
>=20
> diff --git
> a/meta/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-
> PowerPC-systems-with-Altivec.patch
> b/meta/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-
> PowerPC-systems-with-Altivec.patch
> new file mode 100644
> index 0000000..e8f4382
> --- /dev/null
> +++
> b/meta/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-
> PowerPC-systems-with-Altivec.patch
> @@ -0,0 +1,31 @@
> +From 4c62c4a9556f92495d93eddc7641497e1ce1e35c Mon Sep 17 00:00:00 2001
> +From: Ulrich Weigand <uweigand@de.ibm.com>
> +Date: Tue, 17 Dec 2013 15:00:54 +0100
> +Subject: [PATCH] Fix test case link failure on PowerPC systems with
> +Altivec
> +
> +Upstream-Status:backport
> +
> +On systems where the system compiler supports Altivec by default, the
> +libunwind Makefile will attempt to build an extra test case
> +ppc64-test-altivec.  Unfortunately, the link step will fail since the
> +Makefile does not actually link against the libunwind library.
> +
> +Fixed by adding the appropriate LDADD macro.
> +
> +Signed-off-by: Ulrich Weigand <uweigand@de.ibm.com>
> +---
> + tests/Makefile.am |    1 +
> + 1 files changed, 1 insertions(+), 0 deletions(-)
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am index
> +0e30536..9c76628 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -201,3 +201,4 @@ Lia64_test_rbs_LDADD =3D $(LIBUNWIND_local)
> +Lia64_test_readonly_LDADD =3D $(LIBUNWIND_local)  ia64_test_dyn1_LDADD =
=3D
> +$(LIBUNWIND)  ia64_test_sig_LDADD =3D $(LIBUNWIND)
> ++ppc64_test_altivec_LDADD =3D $(LIBUNWIND)
> +--
> +1.7.2.5
> +
> diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb
> b/meta/recipes-support/libunwind/libunwind_1.1.bb
> index 2e52430..5b54dcb 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.1.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
> @@ -3,6 +3,7 @@ require libunwind.inc
>   SRC_URI +=3D "\
>       file://Support-building-with-older-compilers.patch \
>       file://AArch64-port.patch \
> +
> + file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patc
> + h \
>   "
>=20
>   SRC_URI[md5sum] =3D "fb4ea2f6fbbe45bf032cd36e586883ce"
> --
> 1.7.9.5
>=20
>=20
> // Robert
>=20
> On 09/23/2014 03:04 PM, ting.liu@freescale.com wrote:
> > From: Ting Liu <ting.liu@freescale.com>
> >
> > Signed-off-by: Ting Liu <ting.liu@freescale.com>
> > ---
> >   ...k-failure-on-PowerPC-systems-with-Altivec.patch | 31
> ++++++++++++++++++++++
> >   meta-oe/recipes-support/libunwind/libunwind_1.1.bb |  1 +
> >   2 files changed, 32 insertions(+)
> >   create mode 100644 meta-oe/recipes-support/libunwind/libunwind/Fix-te=
st-
> case-link-failure-on-PowerPC-systems-with-Altivec.patch
> >
> > diff --git a/meta-oe/recipes-support/libunwind/libunwind/Fix-test-case-=
link-
> failure-on-PowerPC-systems-with-Altivec.patch b/meta-oe/recipes-
> support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems=
-
> with-Altivec.patch
> > new file mode 100644
> > index 0000000..e8f4382
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libunwind/libunwind/Fix-test-case-link-
> failure-on-PowerPC-systems-with-Altivec.patch
> > @@ -0,0 +1,31 @@
> > +From 4c62c4a9556f92495d93eddc7641497e1ce1e35c Mon Sep 17 00:00:00 2001
> > +From: Ulrich Weigand <uweigand@de.ibm.com>
> > +Date: Tue, 17 Dec 2013 15:00:54 +0100
> > +Subject: [PATCH] Fix test case link failure on PowerPC systems with Al=
tivec
> > +
> > +Upstream-Status:backport
> > +
> > +On systems where the system compiler supports Altivec by default,
> > +the libunwind Makefile will attempt to build an extra test case
> > +ppc64-test-altivec.  Unfortunately, the link step will fail since
> > +the Makefile does not actually link against the libunwind library.
> > +
> > +Fixed by adding the appropriate LDADD macro.
> > +
> > +Signed-off-by: Ulrich Weigand <uweigand@de.ibm.com>
> > +---
> > + tests/Makefile.am |    1 +
> > + 1 files changed, 1 insertions(+), 0 deletions(-)
> > +
> > +diff --git a/tests/Makefile.am b/tests/Makefile.am
> > +index 0e30536..9c76628 100644
> > +--- a/tests/Makefile.am
> > ++++ b/tests/Makefile.am
> > +@@ -201,3 +201,4 @@ Lia64_test_rbs_LDADD =3D $(LIBUNWIND_local)
> > + Lia64_test_readonly_LDADD =3D $(LIBUNWIND_local)
> > + ia64_test_dyn1_LDADD =3D $(LIBUNWIND)
> > + ia64_test_sig_LDADD =3D $(LIBUNWIND)
> > ++ppc64_test_altivec_LDADD =3D $(LIBUNWIND)
> > +--
> > +1.7.2.5
> > +
> > diff --git a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb b/meta-
> oe/recipes-support/libunwind/libunwind_1.1.bb
> > index bc38e36..18bca0e 100644
> > --- a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
> > +++ b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
> > @@ -1,4 +1,5 @@
> >   require libunwind.inc
> >
> > +SRC_URI +=3D "file://Fix-test-case-link-failure-on-PowerPC-systems-wit=
h-
> Altivec.patch"
> >   SRC_URI[md5sum] =3D "fb4ea2f6fbbe45bf032cd36e586883ce"
> >   SRC_URI[sha256sum] =3D
> "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
> >

