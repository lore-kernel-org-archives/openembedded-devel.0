Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 326746BC7A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 09:07:13 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id c21so8008300qtj.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 02:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q4yFeU7Y2FsJgzRa/qPEtDEn8gQLCWCFAyaWntuC83g=;
	b=thZzpd3khMd+OVXKbd5C6hjVy2bxZ/XTDpcNpFu4Jb1M9EtTvXyYknIYrGg4KvTwgr
	NtYjfzvqce2HOnJO5gsV9sfPuNqOEJu4gZ2HnDYD6iBI7IWu8m+yyGLCl7jxsPsYYxYG
	reHo3LeaO2UZ8Aid9nDSxDTUMc6wg6WVNonA8//RzdOVxTxSirI+p7mfAvJWkeRNNhiQ
	E6sygCtBc4Wni7q8TyfLXZE9cUIUhCTtWOg2+jejg7ZXUqGRywVIH0LfAdo1h8CrBm06
	FXc4LqHRm5uPyBVKtSpEQ0QjZAogz8k5WCeW3LOaIngQitWaKt4VoyQc7UfmDuWlQtup
	fsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q4yFeU7Y2FsJgzRa/qPEtDEn8gQLCWCFAyaWntuC83g=;
	b=X5dKC0x/i4jAgvj/kLUSwfVJIUTkczXn2J6j2+9XHcqhZK0LQ3DKV9SmFibW/w0mUY
	YBh+ZP9NISVinZ3mOt+wxrwtgaNvJmR3Rqe0b4GjJkoebNl1cG2ZxWdpdbiawPlwto6d
	70xF3jsRxbs5w2d/12eGn5+RI42rDcfQAEkSGEakjI4mGe8XXpm9pZ4pVRHVc0Tq2r18
	H2tC0kvbFv7RftVacXWnVDJThqQ2DV7hrEI61g0ZVf7yUh4Lu6gwCRk5SMz8zAAkTKvs
	IhlwcXbs8aCZK1UNC+wr7y+D+FfmzXUcsxobKPYMfge09xp/xz+a7DbTnOh8x3xnBxkf
	R4AQ==
X-Gm-Message-State: APjAAAXn8J+oDC4Cq1l4XeciZTf8xselfYfd42D3YwyuT+0PbAkZ1l2n
	YNdE7IxvnWCysLoPMbYPGPdmDhXbZBnt8LRvVwk=
X-Google-Smtp-Source: APXvYqwp3I1ICyfmiaC3Pn7TLsO0Q6059sdVcdVQGniDKOnu5xA+fiAWfxC3UmlG250zrbDl8+rajXZ9cRCknqzm8XA=
X-Received: by 2002:ac8:3021:: with SMTP id f30mr8606996qte.80.1571389633701; 
	Fri, 18 Oct 2019 02:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190929092956.13147-1-Qi.Chen@windriver.com>
	<20191017204414.GB1499@jama>
	<CA+chaQcpMndabwwuv+c8203ATbcwNEMJ8zjLDnqTkzkqyw4OrQ@mail.gmail.com>
In-Reply-To: <CA+chaQcpMndabwwuv+c8203ATbcwNEMJ8zjLDnqTkzkqyw4OrQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Oct 2019 14:37:02 +0530
Message-ID: <CAMKF1sq30Y4p=7ckBc+2cQmg2-bTs9p4KG4ddOqrZibQHTCexQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 18 Oct 2019 09:07:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes I have seen same build failures on master even after this fix on
machine with more cpus so the fix while seems to address the problem is not
fixing is completely when I get a chance I will look into the logic myself
too but I think we have to delve into it a bit More

On Fri, Oct 18, 2019 at 3:41 AM Martin Jansa <martin.jansa@gmail.com> wrote=
:

> Hmm I spoke too soon, at least rebuilding protobuf-c-native with this
> change backported to thud still failed once with:
>
> ../git/t/generated-code2/cxx-generate-packed-data.cc:28:17: error: =E2=80=
=98foo=E2=80=99 is
> not a namespace-name
>  using namespace foo;
>                  ^~~
> ../git/t/generated-code2/cxx-generate-packed-data.cc:28:20: error: expect=
ed
> namespace-name before =E2=80=98;=E2=80=99 token
>  using namespace foo;
>                     ^
> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
> =E2=80=98TestEnumSmall=E2=80=99 does not name a type
>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
>                                     ^
> ../git/t/generated-code2/common-test-arrays.h:44:1: note: in expansion of
> macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
>  TEST_ENUM_SMALL_TYPE_NAME enum_small_0[] =3D { TEST_ENUM_SMALL(VALUE) };
>  ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
> =E2=80=98TestEnumSmall=E2=80=99 does not name a type
>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
>                                     ^
> ../git/t/generated-code2/common-test-arrays.h:45:1: note: in expansion of
> macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
>  TEST_ENUM_SMALL_TYPE_NAME enum_small_1[] =3D { TEST_ENUM_SMALL(OTHER_VAL=
UE)
> };
>  ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
> =E2=80=98TestEnumSmall=E2=80=99 does not name a type
>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
>                                     ^
> ../git/t/generated-code2/common-test-arrays.h:47:1: note: in expansion of
> macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
>  TEST_ENUM_SMALL_TYPE_NAME enum_small_random[] =3D
>
> {T(0),T(1),T(1),T(0),T(0),T(1),T(1),T(1),T(0),T(0),T(0),T(0),T(0),T(1),T(=
1),T(1),T(1),T(1),T(1),T(0),T(1),T(1),T(0),T(1),T(1),T(0)
> };
>  ^~~~~~~~~~~~~~~~~~~~~~~~~
> ...
> so it probably doesn't fix the issue completely.
>
>
> On Thu, Oct 17, 2019 at 10:44 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
> > On Sun, Sep 29, 2019 at 05:29:56PM +0800, Chen Qi wrote:
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >  .../0001-avoid-race-condition.patch           | 36 +++++++++++++++++=
++
> > >  .../protobuf/protobuf-c_1.3.2.bb              |  1 +
> > >  2 files changed, 37 insertions(+)
> > >  create mode 100644
> >
> meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.pa=
tch
> > >
> > > diff --git
> >
> a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.=
patch
> >
> b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.=
patch
> > > new file mode 100644
> > > index 000000000..4fc7703d8
> > > --- /dev/null
> > > +++
> >
> b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.=
patch
> > > @@ -0,0 +1,36 @@
> > > +From 216e31260b618ec73862f9f5336597f391444dac Mon Sep 17 00:00:00 20=
01
> > > +From: Chen Qi <Qi.Chen@windriver.com>
> > > +Date: Sun, 29 Sep 2019 17:20:42 +0800
> > > +Subject: [PATCH] avoid race condition
> > > +
> > > +It's possible that the cxx-generate-packed-data.cc is compiled
> > > +while the t/test-full.pb.h is being generated. This will result
> > > +the following error.
> > > +
> > > +  DEBUG:     ./t/test-full.pb.h:4:0: error: unterminated #ifndef
> > > +  ./t/test-full.pb.h:4:0: error: unterminated #ifndef
> > > +
> > > +Add a dependency to avoid such problem.
> > > +
> > > +Upstream-Status: Pending
> >
> > Thanks for this patch, it seems to indeed fix this issue, I've reported
> > a while ago:
> >
> >
> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/ms=
g64363.html
> >
> > I think the upstream would be interested in this fix as well, see:
> >
> >
> https://github.com/protobuf-c/protobuf-c/commit/b0bb56303366e2c072ee38eb5=
f1f11251b07239c
> >
> > Cheers,
> >
> > > +
> > > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > +---
> > > + Makefile.am | 1 +
> > > + 1 file changed, 1 insertion(+)
> > > +
> > > +diff --git a/Makefile.am b/Makefile.am
> > > +index b0cb065..1608ae0 100644
> > > +--- a/Makefile.am
> > > ++++ b/Makefile.am
> > > +@@ -156,6 +156,7 @@ noinst_PROGRAMS +=3D \
> > > + t_generated_code2_cxx_generate_packed_data_SOURCES =3D \
> > > +     t/generated-code2/cxx-generate-packed-data.cc \
> > > +     t/test-full.pb.cc
> > > ++t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
> > > + $(t_generated_code2_cxx_generate_packed_data_OBJECTS):
> t/test-full.pb.h
> > > + t_generated_code2_cxx_generate_packed_data_CXXFLAGS =3D \
> > > +     $(AM_CXXFLAGS) \
> > > +--
> > > +2.17.1
> > > +
> > > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> > b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> > > index 6d1ffc3f4..b92f82dec 100644
> > > --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> > > +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> > > @@ -15,6 +15,7 @@ DEPENDS =3D "protobuf-native protobuf"
> > >  SRCREV =3D "1390409f4ee4e26d0635310995b516eb702c3f9e"
> > >
> > >  SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git \
> > > +           file://0001-avoid-race-condition.patch \
> > >            "
> > >
> > >  S =3D "${WORKDIR}/git"
> > > --
> > > 2.17.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

