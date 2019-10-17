Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id A701F7F6AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 22:11:18 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id r9so3015262edl.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 15:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G8laASoa6O5k2cCzCNzms/eWMgSzHMve7G1aNGigW3E=;
	b=JqKmFiu4dpQ8kHvV5hHSCtT4qML2lAz1U2YUismkaxs4bGTStSrY1SuwdgONh8fIEI
	cwhUVARzZvTaPJ4kK0oiLloT61qG90w5vnaQgARs4pIh9e3Kkg4ezePM/4tLWxbof7ya
	BEzFNFdEJzKjOIbgR6zt18oLYLgBdbnZX0RuxcjetWRVG5WnAGaK9buGEMqESzSZWNMT
	GLT/cGPidtZU/2oXgfD1I+0CnpBn4qk5YwY3CnCw4uOIl0G4t63R4srR7P73V5xFdU0W
	GJenBZwgi4OHPbFUX8xGtPfO7AYxUU5B+3Uw/8FUAoTPJgB0iWSJ1v12QaRHwvrgKlyI
	k6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G8laASoa6O5k2cCzCNzms/eWMgSzHMve7G1aNGigW3E=;
	b=BFISa2EQMkPDdzJcil8lXzs81g2j54jCZY0NTaZoa/MSi8RYy+cFHmkJtyVqG/lZ8W
	/s4RxrqKuF55VyTB8MLV6qOjaA+7H+9rGXBGP+nMPMSzCvyfoyG9iAsr5V6QkIYeqPwy
	NaG0CCmL3bD97NNPyTgwVWkoynwzL6ABGo07dbAjYr+pKwrJGPdeMm9tRTE3I83y1imI
	j/u4LAIgBZzqha+m0T0x9PZLbRrIv0C6qMdU3S/GFSKFtJVZcfgblzCNS84XG2iF7Y7E
	CZElqHyUbwjaOSCaSsbEKBCuuszsE5sQtdYEW707u67g4JwkDCsfKMTMbopcwxAc1aEo
	XY8A==
X-Gm-Message-State: APjAAAUpyrYX/9Bcglz92c/jnOLmy1HE3jPk7IFBR7WPoSCGOY9sGR9m
	DQysQDKlMCFirh0MSJEHoi5oY8VWf9G//y5pjng=
X-Google-Smtp-Source: APXvYqwxWkR+wmxhs/+1EUWvbi/SH/TTokRvngZBx+TniI+QERI2uhPBG01m/DxQMBFlm3VwL54kvlSjs99qDV34B5s=
X-Received: by 2002:a17:906:66d2:: with SMTP id
	k18mr5903859ejp.100.1571350279202; 
	Thu, 17 Oct 2019 15:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190929092956.13147-1-Qi.Chen@windriver.com>
	<20191017204414.GB1499@jama>
In-Reply-To: <20191017204414.GB1499@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 18 Oct 2019 00:11:12 +0200
Message-ID: <CA+chaQcpMndabwwuv+c8203ATbcwNEMJ8zjLDnqTkzkqyw4OrQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
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
X-List-Received-Date: Thu, 17 Oct 2019 22:11:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm I spoke too soon, at least rebuilding protobuf-c-native with this
change backported to thud still failed once with:

../git/t/generated-code2/cxx-generate-packed-data.cc:28:17: error: =E2=80=
=98foo=E2=80=99 is
not a namespace-name
 using namespace foo;
                 ^~~
../git/t/generated-code2/cxx-generate-packed-data.cc:28:20: error: expected
namespace-name before =E2=80=98;=E2=80=99 token
 using namespace foo;
                    ^
../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
=E2=80=98TestEnumSmall=E2=80=99 does not name a type
 #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
                                    ^
../git/t/generated-code2/common-test-arrays.h:44:1: note: in expansion of
macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
 TEST_ENUM_SMALL_TYPE_NAME enum_small_0[] =3D { TEST_ENUM_SMALL(VALUE) };
 ^~~~~~~~~~~~~~~~~~~~~~~~~
../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
=E2=80=98TestEnumSmall=E2=80=99 does not name a type
 #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
                                    ^
../git/t/generated-code2/common-test-arrays.h:45:1: note: in expansion of
macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
 TEST_ENUM_SMALL_TYPE_NAME enum_small_1[] =3D { TEST_ENUM_SMALL(OTHER_VALUE=
)
};
 ^~~~~~~~~~~~~~~~~~~~~~~~~
../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
=E2=80=98TestEnumSmall=E2=80=99 does not name a type
 #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
                                    ^
../git/t/generated-code2/common-test-arrays.h:47:1: note: in expansion of
macro =E2=80=98TEST_ENUM_SMALL_TYPE_NAME=E2=80=99
 TEST_ENUM_SMALL_TYPE_NAME enum_small_random[] =3D
{T(0),T(1),T(1),T(0),T(0),T(1),T(1),T(1),T(0),T(0),T(0),T(0),T(0),T(1),T(1)=
,T(1),T(1),T(1),T(1),T(0),T(1),T(1),T(0),T(1),T(1),T(0)
};
 ^~~~~~~~~~~~~~~~~~~~~~~~~
...
so it probably doesn't fix the issue completely.


On Thu, Oct 17, 2019 at 10:44 PM Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Sun, Sep 29, 2019 at 05:29:56PM +0800, Chen Qi wrote:
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  .../0001-avoid-race-condition.patch           | 36 +++++++++++++++++++
> >  .../protobuf/protobuf-c_1.3.2.bb              |  1 +
> >  2 files changed, 37 insertions(+)
> >  create mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.pa=
tch
> >
> > diff --git
> a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.=
patch
> b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.=
patch
> > new file mode 100644
> > index 000000000..4fc7703d8
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.=
patch
> > @@ -0,0 +1,36 @@
> > +From 216e31260b618ec73862f9f5336597f391444dac Mon Sep 17 00:00:00 2001
> > +From: Chen Qi <Qi.Chen@windriver.com>
> > +Date: Sun, 29 Sep 2019 17:20:42 +0800
> > +Subject: [PATCH] avoid race condition
> > +
> > +It's possible that the cxx-generate-packed-data.cc is compiled
> > +while the t/test-full.pb.h is being generated. This will result
> > +the following error.
> > +
> > +  DEBUG:     ./t/test-full.pb.h:4:0: error: unterminated #ifndef
> > +  ./t/test-full.pb.h:4:0: error: unterminated #ifndef
> > +
> > +Add a dependency to avoid such problem.
> > +
> > +Upstream-Status: Pending
>
> Thanks for this patch, it seems to indeed fix this issue, I've reported
> a while ago:
>
> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/ms=
g64363.html
>
> I think the upstream would be interested in this fix as well, see:
>
> https://github.com/protobuf-c/protobuf-c/commit/b0bb56303366e2c072ee38eb5=
f1f11251b07239c
>
> Cheers,
>
> > +
> > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +---
> > + Makefile.am | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/Makefile.am b/Makefile.am
> > +index b0cb065..1608ae0 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -156,6 +156,7 @@ noinst_PROGRAMS +=3D \
> > + t_generated_code2_cxx_generate_packed_data_SOURCES =3D \
> > +     t/generated-code2/cxx-generate-packed-data.cc \
> > +     t/test-full.pb.cc
> > ++t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
> > + $(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb=
.h
> > + t_generated_code2_cxx_generate_packed_data_CXXFLAGS =3D \
> > +     $(AM_CXXFLAGS) \
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> > index 6d1ffc3f4..b92f82dec 100644
> > --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
> > @@ -15,6 +15,7 @@ DEPENDS =3D "protobuf-native protobuf"
> >  SRCREV =3D "1390409f4ee4e26d0635310995b516eb702c3f9e"
> >
> >  SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git \
> > +           file://0001-avoid-race-condition.patch \
> >            "
> >
> >  S =3D "${WORKDIR}/git"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

