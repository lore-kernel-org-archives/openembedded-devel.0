Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 30CB876104
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 17:17:20 +0000 (UTC)
Received: by wmec201 with SMTP id c201so23805883wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 09:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XjuA7bG4Put/U4ufhFSlVjZabe65kqJ1zqgI2kSDS8Q=;
	b=YnmmO6ME1Oh7EGTbOGWgV8JhHbs5UwfMOBa+760X/X+tDndGm+ole56M0jTRhRztn0
	DWmwOVaUl476NLrWcANEqUChscRuUGE5GZvIiWqEEfM+TSX5xC+fPZFJpn/VTWlrAmiR
	j6veAjtumJAMo2LHCj+2DvFAAgvJos4cPOBl4XP/LfBU156sPdC1kEJM5+cn1ja7uKn5
	PDoJOVHOLh/oXVxOVOcwjpER7Fzd8AygLEFDNkpMXKd46ZWp0PISycQ/xKU6pMSpcRkO
	aWIBuNzFt3OJq0TmtwNdwOQmEd+kBfncXDTggx1ZpHa2cu2OpX8nnYFYzfiZr/TdU71U
	EyIA==
X-Received: by 10.28.130.12 with SMTP id e12mr11929447wmd.76.1446830240788;
	Fri, 06 Nov 2015 09:17:20 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 5sm3966026wmg.14.2015.11.06.09.17.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 09:17:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Nov 2015 18:17:38 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151106171738.GF2550@jama>
References: <1446673803-2310-1-git-send-email-max.oss.09@gmail.com>
	<1E07998C-81FF-476F-A066-63266FFDDC1B@gmail.com>
	<CAAzKXnh3cJ7cLT4a48NUs7L0B-dYAfav3ckvwMds8aT=3PN+Gw@mail.gmail.com>
	<CAEHkU3WR6yyGb80CGF9vFBVaYnzOJy8fih6zU5zf755pL7bvNg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEHkU3WR6yyGb80CGF9vFBVaYnzOJy8fih6zU5zf755pL7bvNg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-browser][PATCH] chromium: fix gcc5 compile issues
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
X-List-Received-Date: Fri, 06 Nov 2015 17:17:26 -0000
X-Groupsio-MsgNum: 58387
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7cm2iqirTL37Ot+N"
Content-Disposition: inline

--7cm2iqirTL37Ot+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2015 at 02:14:37PM +0100, Max Krummenacher wrote:
> Hi Zoltan, Khem
>=20
> 2015-11-05 7:31 GMT+01:00 Zoltan Kuscsik <zoltan.kuscsik@linaro.org>:
> > Why not using pragma in both cases?
>=20
> Because I started bignum.cc and found a quick fix without the pragma.
> And in the second case I did not.
>=20
> I will rework the patch to silence the warning with a pragma in both
> cases without touching the code.
>=20
> > See the discussion on the issue in Chromium upstream:
> >
> > https://groups.google.com/a/chromium.org/forum/#!topic/chromium-dev/3uw=
BwunIa7g
>=20
> I looked at the upstream git repo and googled but did not find the
> discussion already going on.
>=20
> I'll will rework the upstream status to point to this URL also.

After long time first successful chromium build in bitbake world..
Thanks!

Can you apply the same fix for cef3 recipes?
http://errors.yoctoproject.org/Errors/Details/21442/

cef3 for qemux86-64 doesn't even configure:
http://errors.yoctoproject.org/Errors/Details/21501/

> > On 5 November 2015 at 02:10, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >>
> >> > On Nov 4, 2015, at 1:50 PM, Max Krummenacher <max.oss.09@gmail.com>
> >> wrote:
> >> >
> >> > A chromium build with gcc5 fails with warnings treated as errors.
> >> >
> >> > bignum.cc, image_util.cc: strict-overflow warning
> >> >
> >> > Compiles and runs on qemux86-64 with gcc 5.2.0 and still compiles on
> >> > armv7a with gcc linaro-4.9.4.
> >> >
> >>
> >> this is ok
>=20
> Thanks.
>=20
> >>
> >> > Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> >> > ---
> >> > .../0001-bignum.cc-fix-warning-from-gcc-5.patch    | 56
> >> ++++++++++++++++++++++
> >> > ...-image_util.cc-disable-warning-from-gcc-5.patch | 37 ++++++++++++=
++
> >> > recipes-browser/chromium/chromium_40.0.2214.91.bb  |  3 ++
> >> > 3 files changed, 96 insertions(+)
> >> > create mode 100644
> >> recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warni=
ng-from-gcc-5.patch
> >> > create mode 100644
> >> recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disab=
le-warning-from-gcc-5.patch
> >> >
> >> > diff --git
> >> a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-war=
ning-from-gcc-5.patch
> >> b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-war=
ning-from-gcc-5.patch
> >> > new file mode 100644
> >> > index 0000000..f3d7f77
> >> > --- /dev/null
> >> > +++
> >> b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-war=
ning-from-gcc-5.patch
> >> > @@ -0,0 +1,56 @@
> >> > +From 689576b2f5c6398f6ef5203fe52edcf86b452790 Mon Sep 17 00:00:00 2=
001
> >> > +From: Max Krummenacher <max.oss.09@gmail.com>
> >> > +Date: Tue, 3 Nov 2015 20:51:04 +0100
> >> > +Subject: [PATCH 1/2] bignum.cc: fix warning from gcc 5
> >> > +
> >> > +Refactoring the source seems to workaround the compiler warning.
> >> > +
> >> > +addresses:
> >> > +  ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:105:10: error:
> >> assuming
> >> > +  signed overflow does not occur when assuming that (X + c) < X is
> >> always
> >> > +  false [-Werror=3Dstrict-overflow]
> >> > +      void Bignum::AssignDecimalString(Vector<const char> value) {
> >> > +           ^
> >> > +
> >> > +Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> >> > +Upstream-Status: Pending
> >> > +
> >> > +---
> >> > + third_party/WebKit/Source/wtf/dtoa/bignum.cc | 15 +++++++--------
> >> > + 1 file changed, 7 insertions(+), 8 deletions(-)
> >> > +
> >> > +diff --git a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> >> b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> >> > +index a000b46..e5426dd 100644
> >> > +--- a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> >> > ++++ b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> >> > +@@ -105,20 +105,19 @@ namespace double_conversion {
> >> > +     void Bignum::AssignDecimalString(Vector<const char> value) {
> >> > +         // 2^64 =3D 18446744073709551616 > 10^19
> >> > +         const int kMaxUint64DecimalDigits =3D 19;
> >> > ++        int currentLen;
> >> > +         Zero();
> >> > +         int length =3D value.length();
> >> > +         int pos =3D 0;
> >> > +         // Let's just say that each digit needs 4 bits.
> >> > +-        while (length >=3D kMaxUint64DecimalDigits) {
> >> > +-            uint64_t digits =3D ReadUInt64(value, pos,
> >> kMaxUint64DecimalDigits);
> >> > +-            pos +=3D kMaxUint64DecimalDigits;
> >> > +-            length -=3D kMaxUint64DecimalDigits;
> >> > +-            MultiplyByPowerOfTen(kMaxUint64DecimalDigits);
> >> > ++        while (length > 0) {
> >> > ++            currentLen =3D length > kMaxUint64DecimalDigits ?
> >> kMaxUint64DecimalDigits : length;
> >> > ++            uint64_t digits =3D ReadUInt64(value, pos, currentLen);
> >> > ++            MultiplyByPowerOfTen(currentLen);
> >> > +             AddUInt64(digits);
> >> > ++            pos +=3D currentLen;
> >> > ++            length -=3D currentLen;
> >> > +         }
> >> > +-        uint64_t digits =3D ReadUInt64(value, pos, length);
> >> > +-        MultiplyByPowerOfTen(length);
> >> > +-        AddUInt64(digits);
> >> > +         Clamp();
> >> > +     }
> >> > +
> >> > +--
> >> > +1.8.4.5
> >> > +
> >> > diff --git
> >> a/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-dis=
able-warning-from-gcc-5.patch
> >> b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-dis=
able-warning-from-gcc-5.patch
> >> > new file mode 100644
> >> > index 0000000..d62645b
> >> > --- /dev/null
> >> > +++
> >> b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-dis=
able-warning-from-gcc-5.patch
> >> > @@ -0,0 +1,37 @@
> >> > +From 2f674d980a116075dc7123a3e243b1451e4a732d Mon Sep 17 00:00:00 2=
001
> >> > +From: Max Krummenacher <max.oss.09@gmail.com>
> >> > +Date: Tue, 3 Nov 2015 22:13:40 +0100
> >> > +Subject: [PATCH 2/2] image_util.cc: disable warning from gcc 5
> >> > +
> >> > +addresses:
> >> > +  ../../ui/gfx/image/image_util.cc:50:6: error: assuming signed
> >> overflow does
> >> > +  not occur when assuming that (X - c) <=3D X is always true
> >> > +  [-Werror=3Dstrict-overflow]
> >> > +  bool VisibleMargins(const ImageSkia& image, int* leading, int*
> >> trailing) {
> >> > +       ^
> >> > +
> >> > +Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> >> > +Upstream-Status: Pending
> >> > +
> >> > +---
> >> > + ui/gfx/image/image_util.cc | 3 +++
> >> > + 1 file changed, 3 insertions(+)
> >> > +
> >> > +diff --git a/ui/gfx/image/image_util.cc b/ui/gfx/image/image_util.cc
> >> > +index 89a3f8c..d595da3 100644
> >> > +--- a/ui/gfx/image/image_util.cc
> >> > ++++ b/ui/gfx/image/image_util.cc
> >> > +@@ -68,7 +68,10 @@ bool VisibleMargins(const ImageSkia& image, int*
> >> leading, int* trailing) {
> >> > +   int inner_min =3D bitmap.width();
> >> > +   for (int x =3D 0; x < bitmap.width(); ++x) {
> >> > +     for (int y =3D 0; y < bitmap.height(); ++y) {
> >> > ++#pragma GCC diagnostic push
> >> > ++#pragma GCC diagnostic warning "-Wstrict-overflow"
> >> > +       if (SkColorGetA(bitmap.getColor(x, y)) > kMinimumVisibleOpac=
ity)
> >> {
> >> > ++#pragma GCC diagnostic pop
> >> > +         inner_min =3D x;
> >> > +         break;
> >> > +       }
> >> > +--
> >> > +1.8.4.5
> >> > +
> >> > diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb
> >> b/recipes-browser/chromium/chromium_40.0.2214.91.bb
> >> > index 8bc05ee..3e00b8d 100644
> >> > --- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
> >> > +++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
> >> > @@ -28,7 +28,10 @@ SRC_URI =3D "\
> >> >         file://google-chrome.desktop \
> >> >         file://chromium-40/fix-build-error-with-GCC-in-Debug-mode.pa=
tch \
> >> >         file://chromium-40/add_missing_stat_h_include.patch \
> >> > +        file://chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.pa=
tch \
> >> > +
> >> file://chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch=
 \
> >> > "
> >> > +
> >> > #
> >> > # * use-egl : Without this packageconfig, the Chromium build will use
> >> GLX for creating an OpenGL context in X11,
> >> > #             and regular OpenGL for painting operations. Neither are
> >> desirable on embedded platforms. With this
> >> > --
> >> > 1.8.4.5
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> >
> >
> > --
> > Zoltan Kuscsik
> >
> > Senior Software Developer, Linaro Digital Home Group
> > email: zoltan.kuscsik@linaro.org
> > IRC: zoli_ on irc.linaro.org
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> Regards
> Max
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7cm2iqirTL37Ot+N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY84LEACgkQN1Ujt2V2gBySBgCfU57EB7LezUh9UCmnLrTNEOuU
5cYAoIYaZZCwgi2OoioV0zUxObjN8iZp
=HnFV
-----END PGP SIGNATURE-----

--7cm2iqirTL37Ot+N--
