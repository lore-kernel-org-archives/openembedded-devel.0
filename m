Return-Path: <uvv.mail@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id C698679B13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 13:23:14 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id q41-v6so9734591qtq.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zetxuTh41gCbq7/2U5bIsLyOPHenyjKtBEk758enEzs=;
	b=bVUO3fjYyTmDIrL1js0uzSYy1XEJTvZL4hqKgY1Pd+7LTAdENXJs6P5jmHXaOm1rI+
	A9lVvIvTm2iv+msXAwjO0uXhMnV7rp7+pp05vyBbT4Npex6boFxjawxcgqnlOY0dcfxg
	ZD5TGJsvf4NGodwNMPz9le73snMV+yQagiIyxGQDAFa5KqHHc/gO/zkUC9M2d2zeP1pi
	lR6pcC4KR7NffN3I6SUCdIPICbUUwgfVRhTJgaUPHuTcPyYFO82zVbXsov0lj7DJugeF
	nMFUJuJsYJakfaZ0vWHJci64ZllpWyWX6xottpcTchTj7jfEdgE2ghDeDtgrxHMyT2yV
	mQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zetxuTh41gCbq7/2U5bIsLyOPHenyjKtBEk758enEzs=;
	b=QHy2A8f+KX3GafO/21uHIIe1vnCoR7egqlb5CDO9Z1AptAkynQR0KLNd0Ghbld2OCs
	7BMB4pN0h5g1BxqMY0TC40YfcjtwQHlXqlFFemcZ5jOVI1/yWp7kfmUAKwaTAlaRCpJG
	SgL+P/ojtAzXwqesFSWx1JK2Lezznd97ZTXF2DxeubL5y2dsi+PEmbevocv4VC9bbhlf
	fvXy2v3xh/S3lee/fJA/oRFkMmybU91hLQwODTTnlRPeKzQbhLDfTmGa4mZlhGmL5gMs
	IhTdq4AvwjK3MMErzdG2pVdREqVAOKMKRCvnWB3oBEKXblEeqwtkib0ckxZA2PUmnZNw
	52/A==
X-Gm-Message-State: ABuFfoivDIxV4V3jgzDB3LKeogc/8AzBEedFj9yqw46jUa9Gi3kRcs3k
	s20ot4Klt765HlaYW1pkQnxbgIj1ji+B2+gTmms=
X-Google-Smtp-Source: ACcGV60Ix0N5z/1v/ZKGiTEifdQyXtxy8JPSlrYy4ss8O4ZiP+T/49+C7Ii1Ldfi4pfDQOEWnQaOzTNBh/xMxndmvRA=
X-Received: by 2002:aed:3882:: with SMTP id
	k2-v6mr1405926qte.345.1539264195625; 
	Thu, 11 Oct 2018 06:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20181011090824.21591-1-brgl@bgdev.pl>
	<CAKHfEahAUCUK5A1gZmou8arwovBgg0xbtipOmngcEV8wjgB-bA@mail.gmail.com>
	<CAMRc=MeWce1mn-Zzm8sqJEff2pdKesXR23sCyKHRMQbicRxFLg@mail.gmail.com>
In-Reply-To: <CAMRc=MeWce1mn-Zzm8sqJEff2pdKesXR23sCyKHRMQbicRxFLg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Thu, 11 Oct 2018 15:23:09 +0200
Message-ID: <CAKHfEaiT-hLxfPrNtOYpMe_MEV-uX+QDT9mhtJUiFqbDRrCxQQ@mail.gmail.com>
To: brgl@bgdev.pl
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: lew@avast.com, bgolaszewski@baylibre.com,
	openembedded-devel@lists.openembedded.org,
	jan.kaisrlik@avast.com, karas@avast.com
Subject: Re: [meta-oe][PATCH] catch2: new package
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
X-List-Received-Date: Thu, 11 Oct 2018 13:23:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You should use it instead
ALLOW_EMPTY_${PN} =3D "1"

The header-only package is required during the build (for dependent
recipes) and for SDK, this is where -dev package would be used. But if you
create main empty package, it would be installed in the image, which is
basically useless.

Vyacheslav

On Thu, Oct 11, 2018 at 3:02 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> czw., 11 pa=C5=BA 2018 o 11:35 Vyacheslav Yurkov <uvv.mail@gmail.com>
> napisa=C5=82(a):
> >
> > Hi Bartosz,
> > As I learned quite recently, you have to do the following for
> header-only libraries:
> > RDEPENDS_${PN}-dev =3D ""
> > RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> >
>
> Any hint on what it does exactly and why it's needed?
>
> Bart
>
> > Regards,
> > Vyacheslav
> >
> > On Thu, Oct 11, 2018 at 11:08 AM Bartosz Golaszewski <brgl@bgdev.pl>
> wrote:
> >>
> >> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>
> >> Add a recipe for the catch2 testing framework. There's a bug upstream
> >> which makes it impossible to build with gcc7 so include a patch.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >> ---
> >>  .../0001-internal-fix-build-in-GCC-7.patch    | 35 ++++++++++++++++++=
+
> >>  meta-oe/recipes-test/catch2/catch2_2.4.1.bb   | 25 +++++++++++++
> >>  2 files changed, 60 insertions(+)
> >>  create mode 100644
> meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.patch
> >>  create mode 100644 meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> >>
> >> diff --git
> a/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.pat=
ch
> b/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.pat=
ch
> >> new file mode 100644
> >> index 000000000..606398afa
> >> --- /dev/null
> >> +++
> b/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-7.pat=
ch
> >> @@ -0,0 +1,35 @@
> >> +From 857bf7e83db330682a4c722d0b57be1e4481f4e2 Mon Sep 17 00:00:00 200=
1
> >> +From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >> +Date: Thu, 11 Oct 2018 09:44:24 +0200
> >> +Subject: [PATCH] internal: fix build in GCC 7
> >> +
> >> +The following error is emitted by gcc 7:
> >> +
> >> +include/internal/catch_tostring.cpp:217:21: error: comparison is
> always true due to limited range of data type [-Werror=3Dtype-limits]
> >> +|      } else if ('\0' <=3D value && value < ' ') {
> >> +|                 ~~~~~^~~~~~~~
> >> +| cc1plus: all warnings being treated as errors
> >> +
> >> +We can drop the first part of the if.
> >> +
> >> +Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >> +---
> >> + include/internal/catch_tostring.cpp | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/include/internal/catch_tostring.cpp
> b/include/internal/catch_tostring.cpp
> >> +index 4e0c027d..59cc8dec 100644
> >> +--- a/include/internal/catch_tostring.cpp
> >> ++++ b/include/internal/catch_tostring.cpp
> >> +@@ -214,7 +214,7 @@ std::string StringMaker<char>::convert(char value=
)
> {
> >> +         return "'\\n'";
> >> +     } else if (value =3D=3D '\t') {
> >> +         return "'\\t'";
> >> +-    } else if ('\0' <=3D value && value < ' ') {
> >> ++    } else if (value < ' ') {
> >> +         return ::Catch::Detail::stringify(static_cast<unsigned
> int>(value));
> >> +     } else {
> >> +         char chstr[] =3D "' '";
> >> +--
> >> +2.19.1
> >> +
> >> diff --git a/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> >> new file mode 100644
> >> index 000000000..ba14a362c
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> >> @@ -0,0 +1,25 @@
> >> +DESCRIPTION =3D "A modern, C++-native, header-only, test framework fo=
r
> unit-tests, \
> >> +TDD and BDD - using C++11, C++14, C++17 and later."
> >> +AUTHOR =3D "Phil Nash, Martin Horenovsky and others"
> >> +HOMEPAGE =3D "https://github.com/catchorg/Catch2"
> >> +LICENSE =3D "BSL-1.0"
> >> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3De4224ccaecb14d942c71d31bef20d78c"
> >> +
> >> +SRC_URI =3D "git://github.com/catchorg/Catch2.git \
> >> +           file://0001-internal-fix-build-in-GCC-7.patch"
> >> +SRCREV =3D "9e1bdca4667295fcb16265eae00efa8423f07007"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +DEPENDS =3D "python-native"
> >> +
> >> +inherit cmake python3native
> >> +
> >> +# Header-only library
> >> +ALLOW_EMPTY_${PN} =3D "1"
> >> +
> >> +do_install_append() {
> >> +    rm ${D}/usr/share/Catch2/lldbinit
> >> +    rm ${D}/usr/share/Catch2/gdbinit
> >> +    rmdir ${D}/usr/share/Catch2/
> >> +}
> >> --
> >> 2.19.1
> >>
> >> --
>

