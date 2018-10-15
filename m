Return-Path: <brgl@bgdev.pl>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id AB4BF745BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 14:50:14 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id i191-v6so28057947iti.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NjWO6ulbSeYclI5qJoz716cEipxNnKBiqdcgujtS+iM=;
	b=aMPL4SUKWv09//jfwyy3PHSBmTKU0fRbP1mcuP49K4SMWTSDi6rFqO7yG5cL49Dc1f
	HpThMCsp9JYAPha9quNR4yaEF/mrkpKC5dcXXoi72DnX4t9+cpTPmhajY6rfYMbzZrtr
	cUcLr1+uTM+f7jbJ04fKBDz81LfHPPnTzQy7mABSK1wjI3HNeHg6q6qlSc2MrpBSBTbo
	ozeq5iiOlNloVgsSf7Xbd3AiLeIBywbyFfxeG7Bh3/oHgzLJ5uUqTqsN+WweVL5AZ4Ko
	sjZKr+sh4Tl4SJTSDO8cvlmdaUTFRIOjUtd9Roao35DdepXfRALpufG8nJZ9eZru+VAC
	E3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NjWO6ulbSeYclI5qJoz716cEipxNnKBiqdcgujtS+iM=;
	b=dLzbfpcLprKb0OYkS9+wX7DP1rGQ/pT8w1+4mZ/0sCcjC0gTY750YErLgLZJ4XBABt
	cu2J4KuhubS270b6htPEfzg/AsvRHKI8COtkMNBjAzuV9M2B0POCTGA0xUXqj1oZ1m9u
	bO6h5rzLjFGsTpTPxwhFbTMmZcYxova7jxHsuyYdsKoI7lTZbF7UFzE7Tm9GWPhf0gEc
	DHt1yVzxBtEMKB1Pn1/cH1tfCHIZSIZdiZopG6+cEAPpZxOwQv1x6JtMFMKNhVrZla3V
	YFwOUp16YeRcPKexWSX9wdH1QiSQ4CxPLHlbO65hMy/PTpWvbJC1+oEkCLvZUkuRnJsB
	x5pw==
X-Gm-Message-State: ABuFfoj8EhnsETTL0zhTK2i2ZD9xp4PaeWxjvNUQwiJSNLj6tAdcSSiT
	ncAX5O8mNM/vcRFgBFqC2gUMD0JcVKZrCU5irf4xpQ==
X-Google-Smtp-Source: ACcGV61uDpF3cLks7p3yJAWaO7i79sZgD38SixxnNmUp4ZnnnUw4UrQzQsFUSMxM7lvESgIo4TFTbH4SIWGLt7NzIX0=
X-Received: by 2002:a05:660c:8c3:: with SMTP id
	g3mr14081750itl.53.1539615015463; 
	Mon, 15 Oct 2018 07:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20181011090824.21591-1-brgl@bgdev.pl>
	<5e1ac02a-64a1-5bec-b120-f286bc53545e@gmail.com>
In-Reply-To: <5e1ac02a-64a1-5bec-b120-f286bc53545e@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Oct 2018 16:50:03 +0200
Message-ID: <CAMRc=MeyfTiKh0vWF1j6yV2_TwED85TPcCWiRY3+GzBr3gkjaA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Hiram Lew <lew@avast.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Jan Kaisrlik <jan.kaisrlik@avast.com>, Lukas Karas <karas@avast.com>
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
X-List-Received-Date: Mon, 15 Oct 2018 14:50:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

czw., 11 pa=C5=BA 2018 o 16:32 akuster808 <akuster808@gmail.com> napisa=C5=
=82(a):
>
>
>
> On 10/11/2018 02:08 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Add a recipe for the catch2 testing framework. There's a bug upstream
> > which makes it impossible to build with gcc7 so include a patch.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  .../0001-internal-fix-build-in-GCC-7.patch    | 35 +++++++++++++++++++
> >  meta-oe/recipes-test/catch2/catch2_2.4.1.bb   | 25 +++++++++++++
> >  2 files changed, 60 insertions(+)
> >  create mode 100644 meta-oe/recipes-test/catch2/catch2/0001-internal-fi=
x-build-in-GCC-7.patch
> >  create mode 100644 meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> >
> > diff --git a/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build=
-in-GCC-7.patch b/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-buil=
d-in-GCC-7.patch
> > new file mode 100644
> > index 000000000..606398afa
> > --- /dev/null
> > +++ b/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC=
-7.patch
> > @@ -0,0 +1,35 @@
> > +From 857bf7e83db330682a4c722d0b57be1e4481f4e2 Mon Sep 17 00:00:00 2001
> > +From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > +Date: Thu, 11 Oct 2018 09:44:24 +0200
> > +Subject: [PATCH] internal: fix build in GCC 7
> > +
> > +The following error is emitted by gcc 7:
> > +
> > +include/internal/catch_tostring.cpp:217:21: error: comparison is alway=
s true due to limited range of data type [-Werror=3Dtype-limits]
> > +|      } else if ('\0' <=3D value && value < ' ') {
> > +|                 ~~~~~^~~~~~~~
> > +| cc1plus: all warnings being treated as errors
> > +
> > +We can drop the first part of the if.
>
> Please add the "Upstream-Status:" bits
>
> please review
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > +
> > +Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > +---
> > + include/internal/catch_tostring.cpp | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/include/internal/catch_tostring.cpp b/include/internal/ca=
tch_tostring.cpp
> > +index 4e0c027d..59cc8dec 100644
> > +--- a/include/internal/catch_tostring.cpp
> > ++++ b/include/internal/catch_tostring.cpp
> > +@@ -214,7 +214,7 @@ std::string StringMaker<char>::convert(char value)=
 {
> > +         return "'\\n'";
> > +     } else if (value =3D=3D '\t') {
> > +         return "'\\t'";
> > +-    } else if ('\0' <=3D value && value < ' ') {
> > ++    } else if (value < ' ') {
> > +         return ::Catch::Detail::stringify(static_cast<unsigned int>(v=
alue));
> > +     } else {
> > +         char chstr[] =3D "' '";
> > +--
> > +2.19.1
> > +
> > diff --git a/meta-oe/recipes-test/catch2/catch2_2.4.1.bb b/meta-oe/reci=
pes-test/catch2/catch2_2.4.1.bb
> > new file mode 100644
> > index 000000000..ba14a362c
> > --- /dev/null
> > +++ b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
> > @@ -0,0 +1,25 @@
> > +DESCRIPTION =3D "A modern, C++-native, header-only, test framework for=
 unit-tests, \
> > +TDD and BDD - using C++11, C++14, C++17 and later."
> > +AUTHOR =3D "Phil Nash, Martin Horenovsky and others"
> > +HOMEPAGE =3D "https://github.com/catchorg/Catch2"
> > +LICENSE =3D "BSL-1.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaecb14d942c71d31=
bef20d78c"
> > +
> > +SRC_URI =3D "git://github.com/catchorg/Catch2.git \
> > +           file://0001-internal-fix-build-in-GCC-7.patch"
> > +SRCREV =3D "9e1bdca4667295fcb16265eae00efa8423f07007"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +DEPENDS =3D "python-native"
> Don't need this if you inherit python3native

If I don't do it, cmake fails with the following message:

| DEBUG: Executing shell function do_configure
| -- The CXX compiler identification is GNU 8.2.0
| -- Check for working CXX compiler:
/<snip!>/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/catch2/2.4.1-r0/=
recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi=
-g++
| -- Check for working CXX compiler:
/<snip!>/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/catch2/2.4.1-r0/=
recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi=
-g++
-- works
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Could NOT find PythonInterp (missing: PYTHON_EXECUTABLE)
| CMake Error at CMakeLists.txt:43 (message):
|   Python not found, but required for tests
|
|
| -- Configuring incomplete, errors occurred!

Seems that other cmake based projects do the same in their recipes.

Bart

> > +
> > +inherit cmake python3native
> > +
> > +# Header-only library
> > +ALLOW_EMPTY_${PN} =3D "1"
> > +
> > +do_install_append() {
> > +    rm ${D}/usr/share/Catch2/lldbinit
> > +    rm ${D}/usr/share/Catch2/gdbinit
> > +    rmdir ${D}/usr/share/Catch2/
>
> Please use the variable "datadir" instead of hard coding.
>
> - armin
> > +}
>

