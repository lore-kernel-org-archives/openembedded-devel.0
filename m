Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 882B57F882
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 16:23:44 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p4so22798383wrm.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1yQJuRmlGnRIqBiBZ35V9Ae3/go9dxRz7/SPZm45iiU=;
	b=KPL/60EzIHbyi/vVsOKglGvFw1tmMnev06qqHH0Qx0+9/yAh5PKypAjpYAp0+uF8Ef
	U+8VS0nlgLDOtyZ/fMe+CAD6hTYjuaZnLGSOMuyhr2fiG6iaB+4b7orw/2qXyhsfITqW
	cndkTjSvK2RSVqNON/gYNBB6mswUwGO1zxOFmUr088+LDxN4QVwhJV2VyG761mAJ/1MC
	9xs58CvCrMKG4FXgHCbRJO0jquPbKkHRQwTdQTFN7NJXkvupGHcXjEPPyp0Ogux/BG8T
	rwD/ASMvjI+0y2OJinmPSrbJdmFpbYYEQV86CPgXlmhgrsVSCZkIPusGJKp4DEal8Et6
	5ZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1yQJuRmlGnRIqBiBZ35V9Ae3/go9dxRz7/SPZm45iiU=;
	b=Fr2M+Mi3Do3E43+s6yzobT9K5qaQkK8yH1OqDsb0t0srhqGQaRCTuDv7uyBHKPftL/
	iWKJk5eKEJAsgeDyyf6dsDHWH+JFh0XqNj0NmjsWYEUchu2J4KJ7WgJ/KbUG5CoPiT5u
	akyZy0UD61eH4+F6/qFy3ODLuyptF1y7cdYbes8+MetR70KknOTThCVOVKkZ7MwHoVVS
	LQ2YU9HFfuYDHn9dmb+KWnVPxQm2H8q/QEKuC1fhl1ra6osgtU1FfSF2QnomnylCImCZ
	pQcgJQpiON5aRtaJno+aRx9E03H4BNyeheeQDStazC//NdfLDBBlVmhk0OZpISQrIvNC
	V1Cg==
X-Gm-Message-State: APjAAAXuEXxh0FGh+xG2hPFaS4Zwhul89IdUsdVuIe2EGUEr7z95t2QK
	gF35gmXbB/uI4mjX8mdXqckJgb9A
X-Google-Smtp-Source: APXvYqx1pXG8w7qCFwx8wQQfLd4kC5iZfn7B7O5xBs4K/o9HL5XDobCP8ZhwcPOn4/Kp/3hWE83D4Q==
X-Received: by 2002:a05:6000:1252:: with SMTP id
	j18mr9048462wrx.23.1571847825049; 
	Wed, 23 Oct 2019 09:23:45 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	w7sm17948368wmd.22.2019.10.23.09.23.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 09:23:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Oct 2019 18:23:52 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191023162352.GA1538@jama>
References: <20190929092956.13147-1-Qi.Chen@windriver.com>
	<20191017204414.GB1499@jama>
	<CA+chaQcpMndabwwuv+c8203ATbcwNEMJ8zjLDnqTkzkqyw4OrQ@mail.gmail.com>
	<CAMKF1sq30Y4p=7ckBc+2cQmg2-bTs9p4KG4ddOqrZibQHTCexQ@mail.gmail.com>
	<CA+chaQfNsqJJAkCXV_ZuO17mtNh4CDm7YjeuFQvh9bTTs4ad2w@mail.gmail.com>
	<20191022213718.GA2607@jama>
	<afac42ea-c54b-1fd2-5b38-fcde9bf67674@gmail.com>
MIME-Version: 1.0
In-Reply-To: <afac42ea-c54b-1fd2-5b38-fcde9bf67674@gmail.com>
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
X-List-Received-Date: Wed, 23 Oct 2019 16:23:44 -0000
X-Groupsio-MsgNum: 80314
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2019 at 08:50:10AM -0700, akuster808 wrote:
>=20
>=20
> On 10/22/19 2:37 PM, Martin Jansa wrote:
> > On Fri, Oct 18, 2019 at 09:06:54PM +0200, Martin Jansa wrote:
> >> One more data point is that it might be fixed completely with 1.3.2 ve=
rsion
> >> used in zeus/master and failing less often then without this patch in =
1.3.1
> >> used in thud/warrior.
> >>
> >> I was rebuilding it 300 times in thud/warrior/zeus and got 5-6 failure=
s in
> >> thud/warrior but none in zeus.
> >>
> >> I've started another for loop to rebuilt it 1000 time with zeus and if=
 it
> >> works then I'll retest warrior and thud with 1.3.2 upgrade backported =
to
> >> them - if it works then we can either backport whole upgrade or check =
the
> >> 1.3.1 1.3.2 diff to find out what else we need to backport from there.
> > 1000 times in zeus =3D 0 failures
> > 100 times in thud with 1.3.2 backported ~ 10 failures
> > 1000 times in thud with 1.3.2 as well as protobuf-native 3.9.2 =3D 0 fa=
ilures
> >
> > The protobuf-c upgrade isn't need to be backported to thud, there aren't
> > many changes:
> > https://github.com/protobuf-c/protobuf-c/compare/269771b4b45d3aba04e595=
69f53600003db8d9ff...1390409f4ee4e26d0635310995b516eb702c3f9e
> >
> > protobuf on the other hand was upgraded from 3.6.1 to 3.9.2 in zeus and
> > the diff is big (1028 commits):
> > https://github.com/protocolbuffers/protobuf/compare/48cb18e5c419ddd23d9=
badcfe4e9df7bde1979b2...52b2447247f535663ac1c292e088b4b27d2910ef
> >
> > quick grep in git log didn't reveal what might be causing the race
> > condition, upgrading whole protobuf in warrior and thud isn't an option
> > as well.
> >
> > Anyone interested in digging a bit deeper?
> >
> > I don't want to block this change, because it seems to completely fix it
> > for zeus/master and partially improve it also for warrior and thud.
> >
> > We don't use protobuf much, so for our builds I think I'll just backport
> > whole protobuf upgrade to thud once protobuf-c fix is in thud.
>=20
> So is https://patchwork.openembedded.org/patch/165905/ still a go for
> warrior?

I think it is and for thud as well. Once there is a fix for protobuf as
well, it should be in separate follow-up change anyway.

with protobuf-c fix included I got 28 failures in 1000 rebuilds
without protobuf-c fix I got 5 failures in 308 rebuilds (still running)

so the rate seems similar if not the same (but there might be other
aspects like load on the build machine from other builds), before I was
seeing lower frequency of failures with this included.

Cheers,

> >> On Fri, Oct 18, 2019 at 11:07 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>> Yes I have seen same build failures on master even after this fix on
> >>> machine with more cpus so the fix while seems to address the problem =
is not
> >>> fixing is completely when I get a chance I will look into the logic m=
yself
> >>> too but I think we have to delve into it a bit More
> >>>
> >>> On Fri, Oct 18, 2019 at 3:41 AM Martin Jansa <martin.jansa@gmail.com>
> >>> wrote:
> >>>
> >>>> Hmm I spoke too soon, at least rebuilding protobuf-c-native with this
> >>>> change backported to thud still failed once with:
> >>>>
> >>>> ../git/t/generated-code2/cxx-generate-packed-data.cc:28:17: error: =
=E2=80=98foo=E2=80=99
> >>>> is
> >>>> not a namespace-name
> >>>>  using namespace foo;
> >>>>                  ^~~
> >>>> ../git/t/generated-code2/cxx-generate-packed-data.cc:28:20: error:
> >>>> expected
> >>>> namespace-name before =E2=80=98;=E2=80=99 token
> >>>>  using namespace foo;
> >>>>                     ^
> >>>> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
> >>>> =E2=80=98TestEnumSmall=E2=80=99 does not name a type
> >>>>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
> >>>>                                     ^
> >>>> ../git/t/generated-code2/common-test-arrays.h:44:1: note: in expansi=
on of
> >>>> macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
> >>>>  TEST_ENUM_SMALL_TYPE_NAME enum_small_0[] =3D { TEST_ENUM_SMALL(VALU=
E) };
> >>>>  ^~~~~~~~~~~~~~~~~~~~~~~~~
> >>>> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
> >>>> =E2=80=98TestEnumSmall=E2=80=99 does not name a type
> >>>>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
> >>>>                                     ^
> >>>> ../git/t/generated-code2/common-test-arrays.h:45:1: note: in expansi=
on of
> >>>> macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
> >>>>  TEST_ENUM_SMALL_TYPE_NAME enum_small_1[] =3D { TEST_ENUM_SMALL(OTHE=
R_VALUE)
> >>>> };
> >>>>  ^~~~~~~~~~~~~~~~~~~~~~~~~
> >>>> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
> >>>> =E2=80=98TestEnumSmall=E2=80=99 does not name a type
> >>>>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
> >>>>                                     ^
> >>>> ../git/t/generated-code2/common-test-arrays.h:47:1: note: in expansi=
on of
> >>>> macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
> >>>>  TEST_ENUM_SMALL_TYPE_NAME enum_small_random[] =3D
> >>>>
> >>>> {T(0),T(1),T(1),T(0),T(0),T(1),T(1),T(1),T(0),T(0),T(0),T(0),T(0),T(=
1),T(1),T(1),T(1),T(1),T(1),T(0),T(1),T(1),T(0),T(1),T(1),T(0)
> >>>> };
> >>>>  ^~~~~~~~~~~~~~~~~~~~~~~~~
> >>>> ...
> >>>> so it probably doesn't fix the issue completely.
> >>>>
> >>>>
> >>>> On Thu, Oct 17, 2019 at 10:44 PM Martin Jansa <martin.jansa@gmail.co=
m>
> >>>> wrote:
> >>>>
> >>>>> On Sun, Sep 29, 2019 at 05:29:56PM +0800, Chen Qi wrote:
> >>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>>>>> ---
> >>>>>>  .../0001-avoid-race-condition.patch           | 36
> >>>> +++++++++++++++++++
> >>>>>>  .../protobuf/protobuf-c_1.3.2.bb              |  1 +
> >>>>>>  2 files changed, 37 insertions(+)
> >>>>>>  create mode 100644
> >>>> meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-conditi=
on.patch
> >>>>>> diff --git
> >>>> a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condi=
tion.patch
> >>>> b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condi=
tion.patch
> >>>>>> new file mode 100644
> >>>>>> index 000000000..4fc7703d8
> >>>>>> --- /dev/null
> >>>>>> +++
> >>>> b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condi=
tion.patch
> >>>>>> @@ -0,0 +1,36 @@
> >>>>>> +From 216e31260b618ec73862f9f5336597f391444dac Mon Sep 17 00:00:00
> >>>> 2001
> >>>>>> +From: Chen Qi <Qi.Chen@windriver.com>
> >>>>>> +Date: Sun, 29 Sep 2019 17:20:42 +0800
> >>>>>> +Subject: [PATCH] avoid race condition
> >>>>>> +
> >>>>>> +It's possible that the cxx-generate-packed-data.cc is compiled
> >>>>>> +while the t/test-full.pb.h is being generated. This will result
> >>>>>> +the following error.
> >>>>>> +
> >>>>>> +  DEBUG:     ./t/test-full.pb.h:4:0: error: unterminated #ifndef
> >>>>>> +  ./t/test-full.pb.h:4:0: error: unterminated #ifndef
> >>>>>> +
> >>>>>> +Add a dependency to avoid such problem.
> >>>>>> +
> >>>>>> +Upstream-Status: Pending
> >>>>> Thanks for this patch, it seems to indeed fix this issue, I've repo=
rted
> >>>>> a while ago:
> >>>>>
> >>>>>
> >>>> https://www.mail-archive.com/openembedded-devel@lists.openembedded.o=
rg/msg64363.html
> >>>>> I think the upstream would be interested in this fix as well, see:
> >>>>>
> >>>>>
> >>>> https://github.com/protobuf-c/protobuf-c/commit/b0bb56303366e2c072ee=
38eb5f1f11251b07239c
> >>>>> Cheers,
> >>>>>
> >>>>>> +
> >>>>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>>>>> +---
> >>>>>> + Makefile.am | 1 +
> >>>>>> + 1 file changed, 1 insertion(+)
> >>>>>> +
> >>>>>> +diff --git a/Makefile.am b/Makefile.am
> >>>>>> +index b0cb065..1608ae0 100644
> >>>>>> +--- a/Makefile.am
> >>>>>> ++++ b/Makefile.am
> >>>>>> +@@ -156,6 +156,7 @@ noinst_PROGRAMS +=3D \
> >>>>>> + t_generated_code2_cxx_generate_packed_data_SOURCES =3D \
> >>>>>> +     t/generated-code2/cxx-generate-packed-data.cc \
> >>>>>> +     t/test-full.pb.cc
> >>>>>> ++t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
> >>>>>> + $(t_generated_code2_cxx_generate_packed_data_OBJECTS):
> >>>> t/test-full.pb.h
> >>>>>> + t_generated_code2_cxx_generate_packed_data_CXXFLAGS =3D \
> >>>>>> +     $(AM_CXXFLAGS) \
> >>>>>> +--
> >>>>>> +2.17.1
> >>>>>> +
> >>>>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> >>>>> b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> >>>>>> index 6d1ffc3f4..b92f82dec 100644
> >>>>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> >>>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> >>>>>> @@ -15,6 +15,7 @@ DEPENDS =3D "protobuf-native protobuf"
> >>>>>>  SRCREV =3D "1390409f4ee4e26d0635310995b516eb702c3f9e"
> >>>>>>
> >>>>>>  SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git \
> >>>>>> +           file://0001-avoid-race-condition.patch \
> >>>>>>            "
> >>>>>>
> >>>>>>  S =3D "${WORKDIR}/git"
> >>>>>> --
> >>>>>> 2.17.1
> >>>>>>
> >>>>>> --
> >>>>>> _______________________________________________
> >>>>>> Openembedded-devel mailing list
> >>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>> --
> >>>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXbB+lwAKCRA3VSO3ZXaA
HOuEAJ9TuqO1LgC0DVi/ICyy3XrHJv2qPQCgtN0Dd8DOsDh97HPjed8lf7VHUso=
=B65o
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
