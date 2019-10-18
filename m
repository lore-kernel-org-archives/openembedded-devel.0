Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D7047C86A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 19:07:05 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id r18so5362924eds.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 12:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UVWmcG3w5XQX31fEOw8LAs1D2fsgXgad2hL7FDhj1o4=;
	b=ZZ1KOVRAbw5kOxtRJBaonhVhKburfuPW6xndpDI1LA/Q5eocCXBJwoeAczZxptpbiM
	ZHrBIJbwbJgZ4gCb+p40ON6QdOtpYIiTl+wuZZDt4nWpjByATlgpFdaYMqYdJtOJ6NCi
	ocopeztBSmgbP4czikCPlRVeCFfeSF0Me8tRt8mU5rCiyHTLRjib2zCuxC1KuMx5L+7K
	h9dez22a73dVHdxLuLo/XPFJqeafY7fR3e2ZEjDH/iqxMPiubeXphI5vwbJDo2DLXDs1
	4SGNIYi3ikJ7+s9NJolsz8P+8T+mzmab2UqjHLQEMvAlLwuP0Uu1Hwr4Y4w0KGcpQr/v
	QfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UVWmcG3w5XQX31fEOw8LAs1D2fsgXgad2hL7FDhj1o4=;
	b=Ucn0VwKFKb6/LpxD+TATZw49e7RdYd83EtletKul0uY6StFf23EptiRKw65HmRItDv
	hPUlKJXZfHd0Ej0svx/mEeC04eAdnyXWQIn/RPACgFrLG5T5tqUiOzs99NW2nfpf9Kd/
	LXl7OfWn30/T+RAsO50HRbHkmtZVifMADWtgUojpIhg9Zi2pvFfksyjcfdvF3r7lMRa5
	E7mo41D22PjAjDtgGFM8qfppTbROfajpYjwQhph/MiDgfxPjX/UE3G/HLuNooKDicQLk
	RAEbojL9p1U4C4dst2TXnohDApJKUVTXZxDSDO1wJwIBPj4Va4zomwQSUIJ0yXzXm/kS
	eQIA==
X-Gm-Message-State: APjAAAVAybKhH00BMBHWf5ZIYs0gHlpwjBkI901Yf+XFqILNOEpZMSj0
	DaOOLVRQAl/2m7nq0fXW1TuR8JJxYXdYAp0XKxg=
X-Google-Smtp-Source: APXvYqyiwfqfRzlCqbzvJAmSBb7IK059vchRFWJoURZ3sIZAL49duOXMZ2IP1tjXAhgZdcul23HYNp1wZE0QuOn0T/E=
X-Received: by 2002:aa7:da4a:: with SMTP id w10mr11174868eds.209.1571425625962;
	Fri, 18 Oct 2019 12:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190929092956.13147-1-Qi.Chen@windriver.com>
	<20191017204414.GB1499@jama>
	<CA+chaQcpMndabwwuv+c8203ATbcwNEMJ8zjLDnqTkzkqyw4OrQ@mail.gmail.com>
	<CAMKF1sq30Y4p=7ckBc+2cQmg2-bTs9p4KG4ddOqrZibQHTCexQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq30Y4p=7ckBc+2cQmg2-bTs9p4KG4ddOqrZibQHTCexQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 18 Oct 2019 21:06:54 +0200
Message-ID: <CA+chaQfNsqJJAkCXV_ZuO17mtNh4CDm7YjeuFQvh9bTTs4ad2w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf-c: fix race condition
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
X-List-Received-Date: Fri, 18 Oct 2019 19:07:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One more data point is that it might be fixed completely with 1.3.2 version
used in zeus/master and failing less often then without this patch in 1.3.1
used in thud/warrior.

I was rebuilding it 300 times in thud/warrior/zeus and got 5-6 failures in
thud/warrior but none in zeus.

I've started another for loop to rebuilt it 1000 time with zeus and if it
works then I'll retest warrior and thud with 1.3.2 upgrade backported to
them - if it works then we can either backport whole upgrade or check the
1.3.1 1.3.2 diff to find out what else we need to backport from there.

On Fri, Oct 18, 2019 at 11:07 AM Khem Raj <raj.khem@gmail.com> wrote:

> Yes I have seen same build failures on master even after this fix on
> machine with more cpus so the fix while seems to address the problem is n=
ot
> fixing is completely when I get a chance I will look into the logic mysel=
f
> too but I think we have to delve into it a bit More
>
> On Fri, Oct 18, 2019 at 3:41 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Hmm I spoke too soon, at least rebuilding protobuf-c-native with this
>> change backported to thud still failed once with:
>>
>> ../git/t/generated-code2/cxx-generate-packed-data.cc:28:17: error: =E2=
=80=98foo=E2=80=99
>> is
>> not a namespace-name
>>  using namespace foo;
>>                  ^~~
>> ../git/t/generated-code2/cxx-generate-packed-data.cc:28:20: error:
>> expected
>> namespace-name before =E2=80=98;=E2=80=99 token
>>  using namespace foo;
>>                     ^
>> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
>> =E2=80=98TestEnumSmall=E2=80=99 does not name a type
>>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
>>                                     ^
>> ../git/t/generated-code2/common-test-arrays.h:44:1: note: in expansion o=
f
>> macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
>>  TEST_ENUM_SMALL_TYPE_NAME enum_small_0[] =3D { TEST_ENUM_SMALL(VALUE) }=
;
>>  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
>> =E2=80=98TestEnumSmall=E2=80=99 does not name a type
>>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
>>                                     ^
>> ../git/t/generated-code2/common-test-arrays.h:45:1: note: in expansion o=
f
>> macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
>>  TEST_ENUM_SMALL_TYPE_NAME enum_small_1[] =3D { TEST_ENUM_SMALL(OTHER_VA=
LUE)
>> };
>>  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
>> =E2=80=98TestEnumSmall=E2=80=99 does not name a type
>>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
>>                                     ^
>> ../git/t/generated-code2/common-test-arrays.h:47:1: note: in expansion o=
f
>> macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
>>  TEST_ENUM_SMALL_TYPE_NAME enum_small_random[] =3D
>>
>> {T(0),T(1),T(1),T(0),T(0),T(1),T(1),T(1),T(0),T(0),T(0),T(0),T(0),T(1),T=
(1),T(1),T(1),T(1),T(1),T(0),T(1),T(1),T(0),T(1),T(1),T(0)
>> };
>>  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> ...
>> so it probably doesn't fix the issue completely.
>>
>>
>> On Thu, Oct 17, 2019 at 10:44 PM Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>> > On Sun, Sep 29, 2019 at 05:29:56PM +0800, Chen Qi wrote:
>> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> > > ---
>> > >  .../0001-avoid-race-condition.patch           | 36
>> +++++++++++++++++++
>> > >  .../protobuf/protobuf-c_1.3.2.bb              |  1 +
>> > >  2 files changed, 37 insertions(+)
>> > >  create mode 100644
>> >
>> meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.p=
atch
>> > >
>> > > diff --git
>> >
>> a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition=
.patch
>> >
>> b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition=
.patch
>> > > new file mode 100644
>> > > index 000000000..4fc7703d8
>> > > --- /dev/null
>> > > +++
>> >
>> b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition=
.patch
>> > > @@ -0,0 +1,36 @@
>> > > +From 216e31260b618ec73862f9f5336597f391444dac Mon Sep 17 00:00:00
>> 2001
>> > > +From: Chen Qi <Qi.Chen@windriver.com>
>> > > +Date: Sun, 29 Sep 2019 17:20:42 +0800
>> > > +Subject: [PATCH] avoid race condition
>> > > +
>> > > +It's possible that the cxx-generate-packed-data.cc is compiled
>> > > +while the t/test-full.pb.h is being generated. This will result
>> > > +the following error.
>> > > +
>> > > +  DEBUG:     ./t/test-full.pb.h:4:0: error: unterminated #ifndef
>> > > +  ./t/test-full.pb.h:4:0: error: unterminated #ifndef
>> > > +
>> > > +Add a dependency to avoid such problem.
>> > > +
>> > > +Upstream-Status: Pending
>> >
>> > Thanks for this patch, it seems to indeed fix this issue, I've reporte=
d
>> > a while ago:
>> >
>> >
>> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/m=
sg64363.html
>> >
>> > I think the upstream would be interested in this fix as well, see:
>> >
>> >
>> https://github.com/protobuf-c/protobuf-c/commit/b0bb56303366e2c072ee38eb=
5f1f11251b07239c
>> >
>> > Cheers,
>> >
>> > > +
>> > > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> > > +---
>> > > + Makefile.am | 1 +
>> > > + 1 file changed, 1 insertion(+)
>> > > +
>> > > +diff --git a/Makefile.am b/Makefile.am
>> > > +index b0cb065..1608ae0 100644
>> > > +--- a/Makefile.am
>> > > ++++ b/Makefile.am
>> > > +@@ -156,6 +156,7 @@ noinst_PROGRAMS +=3D \
>> > > + t_generated_code2_cxx_generate_packed_data_SOURCES =3D \
>> > > +     t/generated-code2/cxx-generate-packed-data.cc \
>> > > +     t/test-full.pb.cc
>> > > ++t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
>> > > + $(t_generated_code2_cxx_generate_packed_data_OBJECTS):
>> t/test-full.pb.h
>> > > + t_generated_code2_cxx_generate_packed_data_CXXFLAGS =3D \
>> > > +     $(AM_CXXFLAGS) \
>> > > +--
>> > > +2.17.1
>> > > +
>> > > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
>> > b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
>> > > index 6d1ffc3f4..b92f82dec 100644
>> > > --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
>> > > +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
>> > > @@ -15,6 +15,7 @@ DEPENDS =3D "protobuf-native protobuf"
>> > >  SRCREV =3D "1390409f4ee4e26d0635310995b516eb702c3f9e"
>> > >
>> > >  SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git \
>> > > +           file://0001-avoid-race-condition.patch \
>> > >            "
>> > >
>> > >  S =3D "${WORKDIR}/git"
>> > > --
>> > > 2.17.1
>> > >
>> > > --
>> > > _______________________________________________
>> > > Openembedded-devel mailing list
>> > > Openembedded-devel@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

