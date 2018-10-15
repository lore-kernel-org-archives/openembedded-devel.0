Return-Path: <brgl@bgdev.pl>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6E8796E4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 18:29:16 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id l191-v6so29970025ita.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 11:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7XJ/v6afyFp9eGdIBnNF/NhHJosr/MqZDc0XEnuYWtM=;
	b=mjyrmarm++fZnIrMP3BeINhXRB8o2SyEk2XjKubbzwKk6GX9bwWwHeStGF/CRe/Mrm
	bGlDsGrJ2y6oogWhyrdRsemwasYot0rHFSuIscBPvezVho0ClB4FzAo7kS76nKeaFhxu
	Aj7Ki71WAj12aVHdZtQBOjkmsW1RdREaNyXhwQ1CHzhzN1kYI7e6tVKDfowz0cv5DYwS
	+FkwuXr7d5FQdOtFRh1BYlpXeZk7pOhw/akq6AjMviqITkDcgYATfw8F8ZqztBBc7Aip
	Br1SOudFQKPC+J9Lh41ca8DQLjUg9SyShp1TEiJfhmQf/KErbhv3FfA1sSmIRHJVd+RD
	AHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7XJ/v6afyFp9eGdIBnNF/NhHJosr/MqZDc0XEnuYWtM=;
	b=DyfLjcjvpsiBbOWF0yk2OFRs4bqnS4uz6J90Lpd1JCJ2JW3jfiaxh15mqsQcTP4G8C
	e943Hon1cKBjJi+Cr1l6GeFOMuPLwe93Ugc5ymcZlTdB7x0i9W5YAH1vBV5oUyz4Lt3e
	M42OsmWN19afF1fmfxEQdbFqt+WtBmKOcqofJfoTikJe60pzVPLfLOjbZW0nBsQB3Dcs
	SpFp0OC4Os9/WB6YXLfDgPS7tb58DtAL1kkpbn7PwQQuXaQcntDiuHHhp901oQJNhoHP
	BxwjvYw4jFSVOvBNY3cq1sJ9dLwv1rtdZyPRBeCFDnYlD+n5PdM9cV3ln9XZvEW5/ogu
	oXfw==
X-Gm-Message-State: ABuFfoiyS0D1lkJWDV9I6om94yDHnCvv3xItL88Wt1rxyJHDQ7kG+7tS
	0aVQFgNwPH6RIljrzdg06/XQwKmd8JUQWjYzxv7fFA==
X-Google-Smtp-Source: ACcGV62t25UxofBhSmENpLxxbTd18GNwXkroldO7D1ZilrPurGcNrGFHc4WnetCEhBSN4o2/elHjkamCJHJ0mbAs48U=
X-Received: by 2002:a05:660c:8c3:: with SMTP id
	g3mr14800710itl.53.1539628157358; 
	Mon, 15 Oct 2018 11:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20181015155444.7275-1-brgl@bgdev.pl>
	<CAMKF1spH_HPGvbsgjTmw4Qhf4PpWk1-grZABNtVrHo9miY8BnA@mail.gmail.com>
	<CAMRc=Mdm-qVK3a5=BtVNEHGbGwExh0GiVz0oPqB8-hFc=_tBqA@mail.gmail.com>
	<CAMKF1sqqWJt-bF0rMoLa-zJJFPS1mSAU-Maq6FC34YUZRmuW-A@mail.gmail.com>
In-Reply-To: <CAMKF1sqqWJt-bF0rMoLa-zJJFPS1mSAU-Maq6FC34YUZRmuW-A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Oct 2018 20:29:06 +0200
Message-ID: <CAMRc=MfEuTJj1x0wfrSxX3vQFZTDxN6A+h3EALjmj72wv9YHnA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Hiram Lew <lew@avast.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Jan Kaisrlik <jan.kaisrlik@avast.com>, Lukas Karas <karas@avast.com>
Subject: Re: [meta-oe][PATCH v2] catch2: new package
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
X-List-Received-Date: Mon, 15 Oct 2018 18:29:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 15 pa=C5=BA 2018 o 20:16 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a=
):
>
> On Mon, Oct 15, 2018 at 11:11 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> >
> > pon., 15 pa=C5=BA 2018 o 20:04 Khem Raj <raj.khem@gmail.com> napisa=C5=
=82(a):
> > >
> > > On Mon, Oct 15, 2018 at 8:54 AM Bartosz Golaszewski <brgl@bgdev.pl> w=
rote:
> > > >
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > Add a recipe for the catch2 testing framework. There's a bug upstre=
am
> > > > which makes it impossible to build with gcc7 so include a patch.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > ---
> > > > v1 -> v2:
> > > > - upstream merged a different solution for the build error: backpor=
t
> > > >   the relevant patch, include Upstream-Status tag
> > > > - use ${datadir} instead of hardcoded paths
> > > > - depend on python3-native, not python-native
> > > > - replace ALLOW_EMPTY_${PN} =3D "1" with RDEPENDS/RRECOMMENDS
> > > >
> > > >  ...1-Fix-convert-from-char-on-ARM-build.patch | 46 +++++++++++++++=
++++
> > > >  meta-oe/recipes-test/catch2/catch2_2.4.1.bb   | 26 +++++++++++
> > > >  2 files changed, 72 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-test/catch2/catch2/0001-Fix-con=
vert-from-char-on-ARM-build.patch
> > > >  create mode 100644 meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> > > >
> > > > diff --git a/meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-fr=
om-char-on-ARM-build.patch b/meta-oe/recipes-test/catch2/catch2/0001-Fix-co=
nvert-from-char-opython3nativen-ARM-build.patch
> > > > new file mode 100644
> > > > index 000000000..307377563
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char=
-on-ARM-build.patch
> > > > @@ -0,0 +1,46 @@
> > > > +From 5729874fa5059c39aa97cfa08fddf107b7a65c9e Mon Sep 17 00:00:00 =
2001
> > > > +From: Miguel Gaio <mgaio35@gmail.com>
> > > > +Date: Wed, 3 Oct 2018 10:22:16 +0200
> > > > +Subject: [PATCH] Fix convert from char on ARM build
> > > > +
> > > > +Some platforms set the signedness of char to unsigned (eg. ARM).
> > > > +Convert from char should not assume the signedness of char.
> > > > +
> > > > +Fix build issue with -Werror,-Wtautological-unsigned-zero-compare =
flags.
> > > > +
> > > > +Signed-off-by: Miguel Gaio <mgaio35@gmail.com>
> > > > +
> > > > +Upstream-Status: Accepted [Commit f1faaa9c107113692301ad8bb5608446=
0ef1a2ff]
> > > > +
> > > > +Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > +---
> > > > + include/internal/catch_tostring.cpp | 6 +++---
> > > > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > > > +
> > > > +diff --git a/include/internal/catch_tostring.cpp b/include/interna=
l/catch_tostring.cpp
> > > > +index 4e0c027d..8cbabbf2 100644
> > > > +--- a/include/internal/catch_tostring.cpp
> > > > ++++ b/include/internal/catch_tostring.cpp
> > > > +@@ -205,7 +205,7 @@ std::string StringMaker<bool>::convert(bool b)=
 {
> > > > +     return b ? "true" : "false";
> > > > + }
> > > > +
> > > > +-std::string StringMaker<char>::convert(char value) {
> > > > ++std::string StringMaker<signed char>::convert(signed char value) =
{
> > > > +     if (value =3D=3D '\r') {
> > > > +         return "'\\r'";
> > > > +     } else if (value =3D=3D '\f') {
> > > > +@@ -222,8 +222,8 @@ std::string StringMaker<char>::convert(char va=
lue) {
> > > > +         return chstr;
> > > > +     }
> > > > + }
> > > > +-std::string StringMaker<signed char>::convert(signed char c) {
> > > > +-    return ::Catch::Detail::stringify(static_cast<char>(c));
> > > > ++std::string StringMaker<char>::convert(char c) {
> > > > ++    return ::Catch::Detail::stringify(static_cast<signed char>(c)=
);
> > > > + }
> > > > + std::string StringMaker<unsigned char>::convert(unsigned char c) =
{
> > > > +     return ::Catch::Detail::stringify(static_cast<char>(c));
> > > > +--
> > > > +2.19.1
> > > > +
> > > > diff --git a/meta-oe/recipes-test/catch2/catch2_2.4.1.bb b/meta-oe/=
recipes-test/catch2/catch2_2.4.1.bb
> > > > new file mode 100644
> > > > index 000000000..370ade150
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> > > > @@ -0,0 +1,26 @@
> > > > +DESCRIPTION =3D "A modern, C++-native, header-only, test framework=
 for unit-tests, \
> > > > +TDD and BDD - using C++11, C++14, C++17 and later."
> > > > +AUTHOR =3D "Phil Nash, Martin Horenovsky and others"
> > > > +HOMEPAGE =3D "https://github.com/catchorg/Catch2"
> > > > +LICENSE =3D "BSL-1.0"
> > > > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaecb14d942c7=
1d31bef20d78c"
> > > > +
> > > > +SRC_URI =3D "git://github.com/catchorg/Catch2.git \
> > > > +           file://0001-Fix-convert-from-char-on-ARM-build.patch"
> > > > +SRCREV =3D "9e1bdca4667295fcb16265eae00efa8423f07007"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +DEPENDS =3D "python3-native"
> > >
> > > this is redundant since python3native is being inherited.
> > >
> >
> > But if I don't do it, cmake fails:
> >
> > | -- Detecting CXX compiler ABI info
> > | -- Detecting CXX compiler ABI info - done
> > | -- Detecting CXX compile features
> > | -- Detecting CXX compile features - done
> > | -- Could NOT find PythonInterp (missing: PYTHON_EXECUTABLE)
> > | CMake Error at CMakeLists.txt:43 (message):
> > |   Python not found, but required for tests
> > |
> > |
> > | -- Configuring incomplete, errors occurred!
> >
> > Specifically this macro: find_package(PythonInterp)
> >
>
> thats strange, since build dep should be added and be ready to use
> before do_configure of this package begins. Please dig into the root
> cause.
>

How about doing what other packages seem to be doing in this case -
dropping python3-native from DEPENDS and only inheriting
python3native?

I don't really have the time to dig into it now, I can either do this
or keep this package downstream for now.

Bart

> > Bart
> >
> > > > +
> > > > +inherit cmake python3native
> > > > +
> > > > +# Header-only library
> > > > +RDEPENDS_${PN}-dev =3D ""
> > > > +RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> > > > +
> > > > +do_install_append() {
> > > > +    rm ${D}/${datadir}/Catch2/lldbinit
> > > > +    rm ${D}/${datadir}/Catch2/gdbinit
> > > > +    rmdir ${D}/${datadir}/Catch2/
> > >
> > > why not just delete whole dir in one go ?
> > >
> > > > +}
> > > > --
> > > > 2.19.1
> > > >

