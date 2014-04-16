Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9FED665D2D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 02:29:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3G2TmiP006932
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 19:29:48 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.109]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0169.001;
	Tue, 15 Apr 2014 19:29:48 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 2/3] gd: add perl to RDEPENDS
Thread-Index: AQHPWIQqwwpWrFh4yECRNu68xrLRPpsTfVBg
Date: Wed, 16 Apr 2014 02:29:47 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAB5BE7C80@ALA-MBA.corp.ad.wrs.com>
References: <cover.1397545082.git.jackie.huang@windriver.com>
	<98585e4f0a807976da5b7fae817d2ed1bf5b012c.1397545082.git.jackie.huang@windriver.com>
	<liiqa4$7f4$1@ger.gmane.org>
In-Reply-To: <liiqa4$7f4$1@ger.gmane.org>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 2/3] gd: add perl to RDEPENDS
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
X-List-Received-Date: Wed, 16 Apr 2014 02:29:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Koen Kooi
> Sent: Tuesday, April 15, 2014 4:24 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 2/3] gd: add perl to RDEPENDS
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> jackie.huang@windriver.com schreef op 15-04-14 09:01:
> > From: Hongxu Jia <hongxu.jia@windriver.com>
> >
> > | Note: adding Smart RPM DB channel | | Note: to be installed:
> > | gd@x86_64
> > run-postinsts@x86_64 kernel-modules@qemux86_64
> > packagegroup-core-boot@qemux86_64 | Loading cache... | Updating cache..=
.
> > ######################################## [100%] | | Computing
> > transaction...error: Can't install gd-2.1.0-r0.0@x86_64: no package
> > provides /usr/bin/perl
>=20
> That's nice and all, but you don't seem to runtime test this. I'm pretty =
sure gd needs additional perl
> modules installed for its perl sections.

The tools provided by gd that needs perl is the "fstobdf" which is a simple=
 convertor from bdf to
gd font format, yes, it's using the 'strict' perl module, and I checked tha=
t ' perl-module-strict' is rprovided
by 'perl', so it would be fine to rdepends  on 'perl' only, and I did the r=
untime test and it works fine.

>=20
> And FWIW, the bits that need perl should be split out in gd-perl

En.., I didn't realize that. Currently the gd package is providing the the =
gd graphics library
and a bunch of converts between gd and other graphics formats, one of which=
 is perl script, and I see
that some Linux distribution (e.g. Ubuntu) usually split them into two pack=
age: 'libgd' for the library,
libgd-tools for the convert binaries/scripts, rather than splitting the per=
l script into gd-perl, I prefer
to split all the converts into gd-tools (or libgd-tools), what do you think=
?

>=20
> > | | Saving cache... | | WARNING: exit code 1 from a shell command. |
> > ERROR: Function failed: do_rootfs (log file is located at
> > tmp/work/qemux86_64-wrs-linux/wrlinux-image-glibc-small/1.0-r1/temp/do
> > _rootfs/log.do_rootfs.26487)
> >
> >  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com> Signed-off-by:
> > Jackie Huang <jackie.huang@windriver.com> ---
> > meta-oe/recipes-support/gd/gd_2.1.0.bb |    1 + 1 file changed, 1
> > insertion(+)
> >
> > diff --git a/meta-oe/recipes-support/gd/gd_2.1.0.bb
> > b/meta-oe/recipes-support/gd/gd_2.1.0.bb index 1b78b9b..3d41eec 100644
> > --- a/meta-oe/recipes-support/gd/gd_2.1.0.bb +++
> > b/meta-oe/recipes-support/gd/gd_2.1.0.bb @@ -11,6 +11,7 @@ SECTION =3D
> > "libs" LICENSE =3D "GD" LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Dc97638cafd3581eb87abd37332137669" DEPENDS =3D
> > "freetype libpng jpeg zlib" +RDEPENDS_${PN} =3D "perl"
>=20
> R* variables go below do_install

Yeah, thanks, I will re-send for the changes.

Thanks,
Jackie

>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFTTOyEMkyGM64RGpERAu1dAJ4xqraqlz5pEmf+uZnOcxSt0gc9HgCghTpX
> SWCuUnlnxjLDTnJSvlHHGqQ=3D
> =3DIivC
> -----END PGP SIGNATURE-----
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

