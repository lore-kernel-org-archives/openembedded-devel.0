Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id A610675E2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 01:10:55 +0000 (UTC)
Received: by pasz6 with SMTP id z6so71484172pas.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 17:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=sE0a6lLY12sVD8LZPBeHmQeITNptREmfD9NIj3v72Us=;
	b=c0sm6/A9DCkj/vU00H1YcRAQT5FiNfAmhkaR4T4C2vpUZBLMvZ6hYEsnQImALQUeGw
	d1caxLfxemi0Esw8I9e9hL4kPFvXMSbYJajJXgtB4vlLKsNXb8lPAsECiVPHpCvS34oQ
	dxBrYRsr+eGE/7X1TuO2Y0Lr9CqRLu5ZOgXSxu7hMsabmtfOPVJZwZgUM8IFM7e9rbjM
	XHH75USLowiQcnKrbtTSHaB9w2pDTdwB56jQs4XfGZwPBfSBUpVTX0j1K/Mps2ZEaqh0
	TcQ4Z3Q4IImFsSaRqQ6jaazTbOUNYm01ZMJAT4LFw4nXGT1ZYREd+bFxhABWc+2jxyax
	5XHA==
X-Received: by 10.68.229.200 with SMTP id ss8mr6026001pbc.38.1446685855219;
	Wed, 04 Nov 2015 17:10:55 -0800 (PST)
Received: from [192.168.0.4] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	xu5sm4354670pab.12.2015.11.04.17.10.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Nov 2015 17:10:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1446673803-2310-1-git-send-email-max.oss.09@gmail.com>
Date: Wed, 4 Nov 2015 17:10:49 -0800
Message-Id: <1E07998C-81FF-476F-A066-63266FFDDC1B@gmail.com>
References: <1446673803-2310-1-git-send-email-max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3106)
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
X-List-Received-Date: Thu, 05 Nov 2015 01:10:55 -0000
X-Groupsio-MsgNum: 58321
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E9AEBD08-B5F9-48E4-B1C1-27D10A18CB9F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E9AEBD08-B5F9-48E4-B1C1-27D10A18CB9F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 4, 2015, at 1:50 PM, Max Krummenacher <max.oss.09@gmail.com> =
wrote:
>=20
> A chromium build with gcc5 fails with warnings treated as errors.
>=20
> bignum.cc, image_util.cc: strict-overflow warning
>=20
> Compiles and runs on qemux86-64 with gcc 5.2.0 and still compiles on
> armv7a with gcc linaro-4.9.4.
>=20

this is ok

> Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> ---
> .../0001-bignum.cc-fix-warning-from-gcc-5.patch    | 56 =
++++++++++++++++++++++
> ...-image_util.cc-disable-warning-from-gcc-5.patch | 37 ++++++++++++++
> recipes-browser/chromium/chromium_40.0.2214.91.bb  |  3 ++
> 3 files changed, 96 insertions(+)
> create mode 100644 =
recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning-f=
rom-gcc-5.patch
> create mode 100644 =
recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-w=
arning-from-gcc-5.patch
>=20
> diff --git =
a/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning=
-from-gcc-5.patch =
b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning=
-from-gcc-5.patch
> new file mode 100644
> index 0000000..f3d7f77
> --- /dev/null
> +++ =
b/recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-fix-warning=
-from-gcc-5.patch
> @@ -0,0 +1,56 @@
> +=46rom 689576b2f5c6398f6ef5203fe52edcf86b452790 Mon Sep 17 00:00:00 =
2001
> +From: Max Krummenacher <max.oss.09@gmail.com>
> +Date: Tue, 3 Nov 2015 20:51:04 +0100
> +Subject: [PATCH 1/2] bignum.cc: fix warning from gcc 5
> +
> +Refactoring the source seems to workaround the compiler warning.
> +
> +addresses:
> +  ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:105:10: error: =
assuming
> +  signed overflow does not occur when assuming that (X + c) < X is =
always
> +  false [-Werror=3Dstrict-overflow]
> +      void Bignum::AssignDecimalString(Vector<const char> value) {
> +           ^
> +
> +Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> +Upstream-Status: Pending
> +
> +---
> + third_party/WebKit/Source/wtf/dtoa/bignum.cc | 15 +++++++--------
> + 1 file changed, 7 insertions(+), 8 deletions(-)
> +
> +diff --git a/third_party/WebKit/Source/wtf/dtoa/bignum.cc =
b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> +index a000b46..e5426dd 100644
> +--- a/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> ++++ b/third_party/WebKit/Source/wtf/dtoa/bignum.cc
> +@@ -105,20 +105,19 @@ namespace double_conversion {
> +     void Bignum::AssignDecimalString(Vector<const char> value) {
> +         // 2^64 =3D 18446744073709551616 > 10^19
> +         const int kMaxUint64DecimalDigits =3D 19;
> ++        int currentLen;
> +         Zero();
> +         int length =3D value.length();
> +         int pos =3D 0;
> +         // Let's just say that each digit needs 4 bits.
> +-        while (length >=3D kMaxUint64DecimalDigits) {
> +-            uint64_t digits =3D ReadUInt64(value, pos, =
kMaxUint64DecimalDigits);
> +-            pos +=3D kMaxUint64DecimalDigits;
> +-            length -=3D kMaxUint64DecimalDigits;
> +-            MultiplyByPowerOfTen(kMaxUint64DecimalDigits);
> ++        while (length > 0) {
> ++            currentLen =3D length > kMaxUint64DecimalDigits ? =
kMaxUint64DecimalDigits : length;
> ++            uint64_t digits =3D ReadUInt64(value, pos, currentLen);
> ++            MultiplyByPowerOfTen(currentLen);
> +             AddUInt64(digits);
> ++            pos +=3D currentLen;
> ++            length -=3D currentLen;
> +         }
> +-        uint64_t digits =3D ReadUInt64(value, pos, length);
> +-        MultiplyByPowerOfTen(length);
> +-        AddUInt64(digits);
> +         Clamp();
> +     }
> +
> +--
> +1.8.4.5
> +
> diff --git =
a/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable=
-warning-from-gcc-5.patch =
b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable=
-warning-from-gcc-5.patch
> new file mode 100644
> index 0000000..d62645b
> --- /dev/null
> +++ =
b/recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable=
-warning-from-gcc-5.patch
> @@ -0,0 +1,37 @@
> +=46rom 2f674d980a116075dc7123a3e243b1451e4a732d Mon Sep 17 00:00:00 =
2001
> +From: Max Krummenacher <max.oss.09@gmail.com>
> +Date: Tue, 3 Nov 2015 22:13:40 +0100
> +Subject: [PATCH 2/2] image_util.cc: disable warning from gcc 5
> +
> +addresses:
> +  ../../ui/gfx/image/image_util.cc:50:6: error: assuming signed =
overflow does
> +  not occur when assuming that (X - c) <=3D X is always true
> +  [-Werror=3Dstrict-overflow]
> +  bool VisibleMargins(const ImageSkia& image, int* leading, int* =
trailing) {
> +       ^
> +
> +Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> +Upstream-Status: Pending
> +
> +---
> + ui/gfx/image/image_util.cc | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/ui/gfx/image/image_util.cc b/ui/gfx/image/image_util.cc
> +index 89a3f8c..d595da3 100644
> +--- a/ui/gfx/image/image_util.cc
> ++++ b/ui/gfx/image/image_util.cc
> +@@ -68,7 +68,10 @@ bool VisibleMargins(const ImageSkia& image, int* =
leading, int* trailing) {
> +   int inner_min =3D bitmap.width();
> +   for (int x =3D 0; x < bitmap.width(); ++x) {
> +     for (int y =3D 0; y < bitmap.height(); ++y) {
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic warning "-Wstrict-overflow"
> +       if (SkColorGetA(bitmap.getColor(x, y)) > =
kMinimumVisibleOpacity) {
> ++#pragma GCC diagnostic pop
> +         inner_min =3D x;
> +         break;
> +       }
> +--
> +1.8.4.5
> +
> diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb =
b/recipes-browser/chromium/chromium_40.0.2214.91.bb
> index 8bc05ee..3e00b8d 100644
> --- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
> +++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
> @@ -28,7 +28,10 @@ SRC_URI =3D "\
>         file://google-chrome.desktop \
>         =
file://chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch \
>         file://chromium-40/add_missing_stat_h_include.patch \
> +        =
file://chromium-40/0001-bignum.cc-fix-warning-from-gcc-5.patch \
> +        =
file://chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch \
> "
> +
> #
> # * use-egl : Without this packageconfig, the Chromium build will use =
GLX for creating an OpenGL context in X11,
> #             and regular OpenGL for painting operations. Neither are =
desirable on embedded platforms. With this
> --
> 1.8.4.5
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_E9AEBD08-B5F9-48E4-B1C1-27D10A18CB9F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY6rJ0ACgkQuwUzVZGdMxQFgACZAS4oKY20Sh/fY5rXT4Mm1XsK
Fn4An0Lo3fStL4S0BKt0AB/fO1Vf/5Yj
=wS8O
-----END PGP SIGNATURE-----

--Apple-Mail=_E9AEBD08-B5F9-48E4-B1C1-27D10A18CB9F--
