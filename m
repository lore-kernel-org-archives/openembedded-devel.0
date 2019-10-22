Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C0EA57F76B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 21:37:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p4so19701744wrm.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=a8Uk7++vyotoEvOXAib2EeJ3moiiBq+Pr1y4d+NUcJo=;
	b=u6Lk/BE9dlETL4FVVdqccnLxoOs2JJc/SInHxuat+A80+E5yPDszHbj3HJOAeBlNec
	p/ZU8eOBMR6HIsRekrkOkNhZon9R99WD+ZS+cugPukyZrNuVcRrLwdT7j+Sr1Utw12Ba
	lEEFSqCTlTn/OXu5uxEFOMJ5Q06JpAHs2XFrMd8E2Na1BcTTB++39DbyIikMFp8BB3+d
	DtGStHkeHmgK3N3m7tkI/VGeabiS719xoMNvQ+DTkx1X2lSJN9oCuKGux+va6LOvMo1P
	yJdLIvmnirEwRsg6/NsBTpuL/NV+Hkuel31W9QihDYxxJ7cUozrqTyL3TWxjcJUeWphY
	DpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=a8Uk7++vyotoEvOXAib2EeJ3moiiBq+Pr1y4d+NUcJo=;
	b=iuHm6ilNc5rsmVze2PQwhrvcBUVhF7fzcKk88fTOircIMDsEmO+MwFIj08DbE2hfua
	HEhZbMRGzs6HitvUgwFf350hjxu24FbXxZhf/zJVHHpKqpk3+AUDASDJCOCLwb8HiImO
	XpHZAOI7prdA6xIxQ89811lgUvOpjeGTX8Bvlw/B3neC1Q9kWUt7oakANPMLZnWQ1vll
	cq6wFYsJhTsNbeQ9ClH+mLmZ4xcTu1HRrdzpgbbeUbmfAG/Y6TEzdfXkgZ8Orf4ac2bp
	Vf2/4itICeCTU6pxWJTKJiPtdfdVVGieawEyMQJHAomdjQTGHrfGMw4VRB02D9ayspPc
	4dEw==
X-Gm-Message-State: APjAAAVdZu3EIO8Mvd6dEEyCQyu+KNRZSRIz5K0AcHAFMi4CS9Q7cr1t
	kW3rU1kOlvaPBXoUywzq2Po=
X-Google-Smtp-Source: APXvYqxqSN3oxgJQKyOC62Y9/RMCE2C938GxFp655i6H9pDQ26OTXU8/xATQvnJrSdg8LdulsYTRZg==
X-Received: by 2002:a05:6000:18d:: with SMTP id
	p13mr5157895wrx.396.1571780233926; 
	Tue, 22 Oct 2019 14:37:13 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	c14sm13375925wru.24.2019.10.22.14.37.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Oct 2019 14:37:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Oct 2019 23:37:18 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191022213718.GA2607@jama>
References: <20190929092956.13147-1-Qi.Chen@windriver.com>
	<20191017204414.GB1499@jama>
	<CA+chaQcpMndabwwuv+c8203ATbcwNEMJ8zjLDnqTkzkqyw4OrQ@mail.gmail.com>
	<CAMKF1sq30Y4p=7ckBc+2cQmg2-bTs9p4KG4ddOqrZibQHTCexQ@mail.gmail.com>
	<CA+chaQfNsqJJAkCXV_ZuO17mtNh4CDm7YjeuFQvh9bTTs4ad2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfNsqJJAkCXV_ZuO17mtNh4CDm7YjeuFQvh9bTTs4ad2w@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
X-List-Received-Date: Tue, 22 Oct 2019 21:37:14 -0000
X-Groupsio-MsgNum: 80272
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 09:06:54PM +0200, Martin Jansa wrote:
> One more data point is that it might be fixed completely with 1.3.2 versi=
on
> used in zeus/master and failing less often then without this patch in 1.3=
=2E1
> used in thud/warrior.
>=20
> I was rebuilding it 300 times in thud/warrior/zeus and got 5-6 failures in
> thud/warrior but none in zeus.
>=20
> I've started another for loop to rebuilt it 1000 time with zeus and if it
> works then I'll retest warrior and thud with 1.3.2 upgrade backported to
> them - if it works then we can either backport whole upgrade or check the
> 1.3.1 1.3.2 diff to find out what else we need to backport from there.

1000 times in zeus =3D 0 failures
100 times in thud with 1.3.2 backported ~ 10 failures
1000 times in thud with 1.3.2 as well as protobuf-native 3.9.2 =3D 0 failur=
es

The protobuf-c upgrade isn't need to be backported to thud, there aren't
many changes:
https://github.com/protobuf-c/protobuf-c/compare/269771b4b45d3aba04e59569f5=
3600003db8d9ff...1390409f4ee4e26d0635310995b516eb702c3f9e

protobuf on the other hand was upgraded from 3.6.1 to 3.9.2 in zeus and
the diff is big (1028 commits):
https://github.com/protocolbuffers/protobuf/compare/48cb18e5c419ddd23d9badc=
fe4e9df7bde1979b2...52b2447247f535663ac1c292e088b4b27d2910ef

quick grep in git log didn't reveal what might be causing the race
condition, upgrading whole protobuf in warrior and thud isn't an option
as well.

Anyone interested in digging a bit deeper?

I don't want to block this change, because it seems to completely fix it
for zeus/master and partially improve it also for warrior and thud.

We don't use protobuf much, so for our builds I think I'll just backport
whole protobuf upgrade to thud once protobuf-c fix is in thud.

Regards,

> On Fri, Oct 18, 2019 at 11:07 AM Khem Raj <raj.khem@gmail.com> wrote:
>=20
> > Yes I have seen same build failures on master even after this fix on
> > machine with more cpus so the fix while seems to address the problem is=
 not
> > fixing is completely when I get a chance I will look into the logic mys=
elf
> > too but I think we have to delve into it a bit More
> >
> > On Fri, Oct 18, 2019 at 3:41 AM Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> >> Hmm I spoke too soon, at least rebuilding protobuf-c-native with this
> >> change backported to thud still failed once with:
> >>
> >> ../git/t/generated-code2/cxx-generate-packed-data.cc:28:17: error: =E2=
=80=98foo=E2=80=99
> >> is
> >> not a namespace-name
> >>  using namespace foo;
> >>                  ^~~
> >> ../git/t/generated-code2/cxx-generate-packed-data.cc:28:20: error:
> >> expected
> >> namespace-name before =E2=80=98;=E2=80=99 token
> >>  using namespace foo;
> >>                     ^
> >> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
> >> =E2=80=98TestEnumSmall=E2=80=99 does not name a type
> >>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
> >>                                     ^
> >> ../git/t/generated-code2/common-test-arrays.h:44:1: note: in expansion=
 of
> >> macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
> >>  TEST_ENUM_SMALL_TYPE_NAME enum_small_0[] =3D { TEST_ENUM_SMALL(VALUE)=
 };
> >>  ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
> >> =E2=80=98TestEnumSmall=E2=80=99 does not name a type
> >>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
> >>                                     ^
> >> ../git/t/generated-code2/common-test-arrays.h:45:1: note: in expansion=
 of
> >> macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
> >>  TEST_ENUM_SMALL_TYPE_NAME enum_small_1[] =3D { TEST_ENUM_SMALL(OTHER_=
VALUE)
> >> };
> >>  ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
> >> =E2=80=98TestEnumSmall=E2=80=99 does not name a type
> >>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
> >>                                     ^
> >> ../git/t/generated-code2/common-test-arrays.h:47:1: note: in expansion=
 of
> >> macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
> >>  TEST_ENUM_SMALL_TYPE_NAME enum_small_random[] =3D
> >>
> >> {T(0),T(1),T(1),T(0),T(0),T(1),T(1),T(1),T(0),T(0),T(0),T(0),T(0),T(1)=
,T(1),T(1),T(1),T(1),T(1),T(0),T(1),T(1),T(0),T(1),T(1),T(0)
> >> };
> >>  ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> ...
> >> so it probably doesn't fix the issue completely.
> >>
> >>
> >> On Thu, Oct 17, 2019 at 10:44 PM Martin Jansa <martin.jansa@gmail.com>
> >> wrote:
> >>
> >> > On Sun, Sep 29, 2019 at 05:29:56PM +0800, Chen Qi wrote:
> >> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> > > ---
> >> > >  .../0001-avoid-race-condition.patch           | 36
> >> +++++++++++++++++++
> >> > >  .../protobuf/protobuf-c_1.3.2.bb              |  1 +
> >> > >  2 files changed, 37 insertions(+)
> >> > >  create mode 100644
> >> >
> >> meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition=
=2Epatch
> >> > >
> >> > > diff --git
> >> >
> >> a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-conditi=
on.patch
> >> >
> >> b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-conditi=
on.patch
> >> > > new file mode 100644
> >> > > index 000000000..4fc7703d8
> >> > > --- /dev/null
> >> > > +++
> >> >
> >> b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-conditi=
on.patch
> >> > > @@ -0,0 +1,36 @@
> >> > > +From 216e31260b618ec73862f9f5336597f391444dac Mon Sep 17 00:00:00
> >> 2001
> >> > > +From: Chen Qi <Qi.Chen@windriver.com>
> >> > > +Date: Sun, 29 Sep 2019 17:20:42 +0800
> >> > > +Subject: [PATCH] avoid race condition
> >> > > +
> >> > > +It's possible that the cxx-generate-packed-data.cc is compiled
> >> > > +while the t/test-full.pb.h is being generated. This will result
> >> > > +the following error.
> >> > > +
> >> > > +  DEBUG:     ./t/test-full.pb.h:4:0: error: unterminated #ifndef
> >> > > +  ./t/test-full.pb.h:4:0: error: unterminated #ifndef
> >> > > +
> >> > > +Add a dependency to avoid such problem.
> >> > > +
> >> > > +Upstream-Status: Pending
> >> >
> >> > Thanks for this patch, it seems to indeed fix this issue, I've repor=
ted
> >> > a while ago:
> >> >
> >> >
> >> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org=
/msg64363.html
> >> >
> >> > I think the upstream would be interested in this fix as well, see:
> >> >
> >> >
> >> https://github.com/protobuf-c/protobuf-c/commit/b0bb56303366e2c072ee38=
eb5f1f11251b07239c
> >> >
> >> > Cheers,
> >> >
> >> > > +
> >> > > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> > > +---
> >> > > + Makefile.am | 1 +
> >> > > + 1 file changed, 1 insertion(+)
> >> > > +
> >> > > +diff --git a/Makefile.am b/Makefile.am
> >> > > +index b0cb065..1608ae0 100644
> >> > > +--- a/Makefile.am
> >> > > ++++ b/Makefile.am
> >> > > +@@ -156,6 +156,7 @@ noinst_PROGRAMS +=3D \
> >> > > + t_generated_code2_cxx_generate_packed_data_SOURCES =3D \
> >> > > +     t/generated-code2/cxx-generate-packed-data.cc \
> >> > > +     t/test-full.pb.cc
> >> > > ++t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
> >> > > + $(t_generated_code2_cxx_generate_packed_data_OBJECTS):
> >> t/test-full.pb.h
> >> > > + t_generated_code2_cxx_generate_packed_data_CXXFLAGS =3D \
> >> > > +     $(AM_CXXFLAGS) \
> >> > > +--
> >> > > +2.17.1
> >> > > +
> >> > > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> >> > b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> >> > > index 6d1ffc3f4..b92f82dec 100644
> >> > > --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> >> > > +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> >> > > @@ -15,6 +15,7 @@ DEPENDS =3D "protobuf-native protobuf"
> >> > >  SRCREV =3D "1390409f4ee4e26d0635310995b516eb702c3f9e"
> >> > >
> >> > >  SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git \
> >> > > +           file://0001-avoid-race-condition.patch \
> >> > >            "
> >> > >
> >> > >  S =3D "${WORKDIR}/git"
> >> > > --
> >> > > 2.17.1
> >> > >
> >> > > --
> >> > > _______________________________________________
> >> > > Openembedded-devel mailing list
> >> > > Openembedded-devel@lists.openembedded.org
> >> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> >
> >> > --
> >> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >> >
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXa92jQAKCRA3VSO3ZXaA
HP6VAKCPnPhBIGqsy5vcw1JEgg+gAJyoigCeJU3CJHKzsVED1INpYqRntinG7GM=
=gdZu
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
