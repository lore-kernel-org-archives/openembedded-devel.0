Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 23E307FCF5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 17:49:23 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 14so8744216qtf.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 09:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Bbp1ZbH1b903ILbwqQ57vQOZaTAjDXprvHKTTeWGaGY=;
	b=Wj1ar8jZKdfPM+oxqAwUY3ynDkDc0fBcm0hlYaMYfRctEN8u8es8Y6nsL62I3frVhU
	e4YssPBL4UlkzLUDTOiUCINwbinPwsewWfRq99LMMji+fYYM/i94pdMdqp/wEtB2rNb7
	Sdjqx0a9/bEe2QYXglEWowrl+Y5s9SmI6fomGRC8+5HyND5cBy4rHIFjWEi5PmYwxE6c
	k4/o4zvVAyJTAZG5ICzeBIzdC8YtaLUw/uHC9dqnFM+aPN6YRtCfy/KBPmfk3+9H/xHv
	QsuhXqIXR0bbzC6gxgpISCWNI5rTfr9EIwPxEEzkJkBbh4LzF10M17NUevjPNJo7ZCxt
	52mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Bbp1ZbH1b903ILbwqQ57vQOZaTAjDXprvHKTTeWGaGY=;
	b=fpoT9L4LCpA8AgfMA/3rlv7JDbubQaZjCwMxE6h1IP5yoqKV1H1xktUJslXmtjQyzB
	KLbt2KZyoWwDJ55Tv9V7bu0qWwqdwy6H8K1vibWiCbbnIwolFgfscVV4KlbMZdvp9XZF
	Y5peBFa7hU85uxirElBwoQNoOd9Awuo5JDHQHNqDopJmebAj5MvJL5w3YEdlAPQBmd6s
	vGPI/NwxItm2Ja4Rq0uukZvgFeeOzdLocO6l9dtY878cVEdpbO1Gif4OSpzfsV6R9mJN
	ry7xVyCPQjps+TErPmTeYMBPE1zpZBT+CPmdMxejGVDKnL6fETGnUhRehwbTJVXZ34RC
	+Atg==
X-Gm-Message-State: APjAAAWO0uLud8vVXMueNmDMpLg14/ziCk7ls+A2GF4tejnL2CCxSmrL
	iun+RskIPmDJ89RrUDWfT8Lt/ea7QvOO0T4p3odB+VCE
X-Google-Smtp-Source: APXvYqxnUahmC73HyXoQFSkfpij1WyeCYtjCamDkJJDiAeeiOkkuQQChGx/GreIXoez3qTDFsdFJ/i0Pdfa/P6d9xTY=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr5536716qtj.80.1574444964362; 
	Fri, 22 Nov 2019 09:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20191119011629.3835732-1-raj.khem@gmail.com>
	<20191119011629.3835732-2-raj.khem@gmail.com>
	<71efcebe3de17b855452a5e0082afe393bbebef8.camel@andred.net>
In-Reply-To: <71efcebe3de17b855452a5e0082afe393bbebef8.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Nov 2019 09:48:53 -0800
Message-ID: <CAMKF1srD0moTN8c5-KKhyhUjFJdZ35q4DiK42ujoADZtOxvUyA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] upm: Link with libatomic on clang/x86
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
X-List-Received-Date: Fri, 22 Nov 2019 17:49:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 11:06 PM Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> On Mon, 2019-11-18 at 17:16 -0800, Khem Raj wrote:
> > This is needed for atomic<double> which clang does not use intrinsic
> > function for on 32bit x86
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../upm/0001-nmea_gps-Link-with-latomic.patch | 27 +++++++++++++++++++
> >  meta-oe/recipes-extended/upm/upm_git.bb       |  2 ++
> >  2 files changed, 29 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/upm/upm/0001-nmea_gps-Link=
-with-latomic.patch
> >
> > diff --git a/meta-oe/recipes-extended/upm/upm/0001-nmea_gps-Link-with-l=
atomic.patch b/meta-oe/recipes-
> > extended/upm/upm/0001-nmea_gps-Link-with-latomic.patch
> > new file mode 100644
> > index 0000000000..c16b8dbc5a
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/upm/upm/0001-nmea_gps-Link-with-latomic.=
patch
> > @@ -0,0 +1,27 @@
> > +From 996d37fc0b7177ee57788399b9140032d5de2765 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 18 Nov 2019 15:50:02 -0800
> > +Subject: [PATCH] nmea_gps: Link with latomic
> > +
> > +clang/x86 ends up with missing symbols for atomics due to atomic<doubl=
e>
> > +with libstdc++, it works ok with libc++
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/nmea_gps/CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/nmea_gps/CMakeLists.txt b/src/nmea_gps/CMakeLists.txt
> > +index b3fb6591..5280bfed 100644
> > +--- a/src/nmea_gps/CMakeLists.txt
> > ++++ b/src/nmea_gps/CMakeLists.txt
> > +@@ -6,4 +6,4 @@ upm_mixed_module_init (NAME nmea_gps
> > +     CPP_SRC nmea_gps.cxx
> > +     FTI_SRC nmea_gps_fti.c
> > +     CPP_WRAPS_C
> > +-    REQUIRES mraa utilities-c ${CMAKE_THREAD_LIBS_INIT})
> > ++    REQUIRES mraa utilities-c atomic ${CMAKE_THREAD_LIBS_INIT})
> > +--
> > +2.24.0
> > +
> > diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-=
extended/upm/upm_git.bb
> > index fb22e83359..dbe97370d5 100644
> > --- a/meta-oe/recipes-extended/upm/upm_git.bb
> > +++ b/meta-oe/recipes-extended/upm/upm_git.bb
> > @@ -15,6 +15,8 @@ SRC_URI =3D "git://github.com/intel-iot-devkit/${BPN}=
.git;protocol=3Dhttp \
> >             file://0001-Use-stdint-types.patch \
> >             "
> >
> > +SRC_URI_append_toolchain-clang_x86 =3D " file://0001-nmea_gps-Link-wit=
h-latomic.patch "
> > +
> >  S =3D "${WORKDIR}/git"
> >
> >  # Depends on mraa which only supports x86 and ARM for now
> > --
> > 2.24.0
> >
>
> If you're planning to upstream this, I normally use something like this i=
n CMake:
>

this is certainly a better fix. I do not plan to work on upstreaming it.

> set(ATOMIC_TEST_C_SOURCE "
> #include <stdatomic.h>
> #include <stdint.h>
> atomic_uint_fast64_t x;
> atomic_uint_fast64_t y;

the real problem is double atomic types which gcc uses intrinsics on
x86/32bit but clang decides to defer it to libatomic
so something like this

atomic<double> x

would be needed as well check

> int main() {
>     return (int)(x + y);
> }")
>
>
>     # libatomic check - some arches need to link against libatomic.so, so=
me don't
>     include(CheckCSourceCompiles)
>     include(CMakePushCheckState)
>     include(CheckLibraryExists)
>     cmake_push_check_state()
>     check_c_source_compiles("${ATOMIC_TEST_C_SOURCE}" HAVE_ATOMICS_WITHOU=
T_LIBATOMIC)
>     if(NOT HAVE_ATOMICS_WITHOUT_LIBATOMIC)
>         check_library_exists(atomic __atomic_load_8 "" LIBATOMIC_EXISTS)
>         if(LIBATOMIC_EXISTS)
>             set(CMAKE_REQUIRED_LIBRARIES atomic)
>             check_c_source_compiles("${ATOMIC_TEST_C_SOURCE}" HAVE_ATOMIC=
S_WITH_LIBATOMIC)
>         endif()
>         if(HAVE_ATOMICS_WITH_LIBATOMIC)
>             list(APPEND EXTRA_LIBRARIES atomic)
>         else()
>             message(FATAL_ERROR "Could not determine support for atomic o=
perations.")
>         endif()
>     endif()
>     cmake_pop_check_state()
>
>
> Cheers,
> A.
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

