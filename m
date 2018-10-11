Return-Path: <brgl@bgdev.pl>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1295D79B0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 13:02:34 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id k206-v6so7184443ite.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 06:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jv4a9y4V5z1Ru0AjhjBXCtzKlRI2QJoEd+IzToqnS5Y=;
	b=oeCkQv5qMzibllcGBT2ZPVwc2R/mc3TJfS+I11kO6KRwtFhIlgHCrD5CrDOjlzgHsh
	Mf1J5ZCey2EjO3yoTtUf3N4S2M/2D4b5qjMroTcZdptCHFahwBGmxp3LPBRI141m4Bbw
	pJ/l/85/jLl/QCb/anW48NGgsLC2vA+VlpqYVDha5b0lwFeNaEJyF4LWxGU8yhvMOF0T
	t1amd6n+Ol7AVDm4PEsEOhHpjAPnLs6+4ZPR7c4SAJYzAaO2eezbmYhuON/stjKKotcc
	fp3RrghI0dm73Z2RaH4GUFEvCMc+HPIs0Peqf1JSathpP9M/3aNurJjPo/2HuHjoyZq+
	2NSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jv4a9y4V5z1Ru0AjhjBXCtzKlRI2QJoEd+IzToqnS5Y=;
	b=MJh8Kui1SutZkJYQ4/nUwTdFv6ppQbThY09mdRB1KumKfGL58sWkehSF69SPaVtKes
	0nr+G/MUw2sqJdiczplQ2NA1OI2FB10K0E2nWAowfbGl9bihN5+C5PO63dl2TeFrs6fJ
	8iaZ/eTBnmNS6NUuqOZUtxKcHT/QKt8EivZaLKw5hGSp09KFPP+gWK5ubZS0ekhzZO8o
	g8jk/2vNigQ6Qw9ck2xEixsUxn97Xd39cE9e6EbvcCx2SfI9LTvmCXRhM4Ki6QyLS9C5
	qZ5/HSJroLLOUj9KTsgVOSLmVWygBUm25M0DpkulBCzCrL0BkTkYQrqRowVaG3yISO8u
	kzrg==
X-Gm-Message-State: ABuFfoh5ydnK+ysEtFewszt8tFkb0Fs5rIoO+PIe1KuNRiXQDz2W24Nk
	KAITZMi1CrN+WL9CiF203y5yP0LbiG0+tqU+gXGEIQ==
X-Google-Smtp-Source: ACcGV627Dc45IpPt/JHj7DVbkRMJat2HAqha1Y9Vsu3/+bqrqx5NCsGydTg/Ey9blgRA3iIS9u/CEnD4y2SmAsbS21E=
X-Received: by 2002:a02:98db:: with SMTP id
	c27-v6mr1132790jak.24.1539262955315; 
	Thu, 11 Oct 2018 06:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20181011090824.21591-1-brgl@bgdev.pl>
	<CAKHfEahAUCUK5A1gZmou8arwovBgg0xbtipOmngcEV8wjgB-bA@mail.gmail.com>
In-Reply-To: <CAKHfEahAUCUK5A1gZmou8arwovBgg0xbtipOmngcEV8wjgB-bA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Oct 2018 15:02:24 +0200
Message-ID: <CAMRc=MeWce1mn-Zzm8sqJEff2pdKesXR23sCyKHRMQbicRxFLg@mail.gmail.com>
To: uvv.mail@gmail.com
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
X-List-Received-Date: Thu, 11 Oct 2018 13:02:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

czw., 11 pa=C5=BA 2018 o 11:35 Vyacheslav Yurkov <uvv.mail@gmail.com> napis=
a=C5=82(a):
>
> Hi Bartosz,
> As I learned quite recently, you have to do the following for header-only=
 libraries:
> RDEPENDS_${PN}-dev =3D ""
> RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
>

Any hint on what it does exactly and why it's needed?

Bart

> Regards,
> Vyacheslav
>
> On Thu, Oct 11, 2018 at 11:08 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
>>
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> Add a recipe for the catch2 testing framework. There's a bug upstream
>> which makes it impossible to build with gcc7 so include a patch.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>  .../0001-internal-fix-build-in-GCC-7.patch    | 35 +++++++++++++++++++
>>  meta-oe/recipes-test/catch2/catch2_2.4.1.bb   | 25 +++++++++++++
>>  2 files changed, 60 insertions(+)
>>  create mode 100644 meta-oe/recipes-test/catch2/catch2/0001-internal-fix=
-build-in-GCC-7.patch
>>  create mode 100644 meta-oe/recipes-test/catch2/catch2_2.4.1.bb
>>
>> diff --git a/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-=
in-GCC-7.patch b/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build=
-in-GCC-7.patch
>> new file mode 100644
>> index 000000000..606398afa
>> --- /dev/null
>> +++ b/meta-oe/recipes-test/catch2/catch2/0001-internal-fix-build-in-GCC-=
7.patch
>> @@ -0,0 +1,35 @@
>> +From 857bf7e83db330682a4c722d0b57be1e4481f4e2 Mon Sep 17 00:00:00 2001
>> +From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> +Date: Thu, 11 Oct 2018 09:44:24 +0200
>> +Subject: [PATCH] internal: fix build in GCC 7
>> +
>> +The following error is emitted by gcc 7:
>> +
>> +include/internal/catch_tostring.cpp:217:21: error: comparison is always=
 true due to limited range of data type [-Werror=3Dtype-limits]
>> +|      } else if ('\0' <=3D value && value < ' ') {
>> +|                 ~~~~~^~~~~~~~
>> +| cc1plus: all warnings being treated as errors
>> +
>> +We can drop the first part of the if.
>> +
>> +Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> +---
>> + include/internal/catch_tostring.cpp | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/include/internal/catch_tostring.cpp b/include/internal/cat=
ch_tostring.cpp
>> +index 4e0c027d..59cc8dec 100644
>> +--- a/include/internal/catch_tostring.cpp
>> ++++ b/include/internal/catch_tostring.cpp
>> +@@ -214,7 +214,7 @@ std::string StringMaker<char>::convert(char value) =
{
>> +         return "'\\n'";
>> +     } else if (value =3D=3D '\t') {
>> +         return "'\\t'";
>> +-    } else if ('\0' <=3D value && value < ' ') {
>> ++    } else if (value < ' ') {
>> +         return ::Catch::Detail::stringify(static_cast<unsigned int>(va=
lue));
>> +     } else {
>> +         char chstr[] =3D "' '";
>> +--
>> +2.19.1
>> +
>> diff --git a/meta-oe/recipes-test/catch2/catch2_2.4.1.bb b/meta-oe/recip=
es-test/catch2/catch2_2.4.1.bb
>> new file mode 100644
>> index 000000000..ba14a362c
>> --- /dev/null
>> +++ b/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
>> @@ -0,0 +1,25 @@
>> +DESCRIPTION =3D "A modern, C++-native, header-only, test framework for =
unit-tests, \
>> +TDD and BDD - using C++11, C++14, C++17 and later."
>> +AUTHOR =3D "Phil Nash, Martin Horenovsky and others"
>> +HOMEPAGE =3D "https://github.com/catchorg/Catch2"
>> +LICENSE =3D "BSL-1.0"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaecb14d942c71d31b=
ef20d78c"
>> +
>> +SRC_URI =3D "git://github.com/catchorg/Catch2.git \
>> +           file://0001-internal-fix-build-in-GCC-7.patch"
>> +SRCREV =3D "9e1bdca4667295fcb16265eae00efa8423f07007"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +DEPENDS =3D "python-native"
>> +
>> +inherit cmake python3native
>> +
>> +# Header-only library
>> +ALLOW_EMPTY_${PN} =3D "1"
>> +
>> +do_install_append() {
>> +    rm ${D}/usr/share/Catch2/lldbinit
>> +    rm ${D}/usr/share/Catch2/gdbinit
>> +    rmdir ${D}/usr/share/Catch2/
>> +}
>> --
>> 2.19.1
>>
>> --

