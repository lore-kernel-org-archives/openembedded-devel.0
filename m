Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1F55C7F0BD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 16:41:04 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id a15so8701750qtn.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 09:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FWwv0L61Y8ilJPhjlpOBshuQg1I3V1AOSFxT8oktxv8=;
	b=uNXHOHPTeqxpH8GoqfqDX0U+63IdEYI9+4nPY7Shxv8RyZxC2QysyVPoA9EuwFHo8a
	FwwvlHIuD0Cy8soeOQNOxBZjXFujKMw0Q6qfYo2c2agMTX2fJBsDTvgUBB3F4uYOvVys
	dDBV3Yi4NiX9tLbfGeRLeXCeDN3P+0lf+YKCHxBHn672j9jamdXU/OH+RCEhvttm0NWm
	mO0GuCoXLZ+qyb7jUv14goKUCYaa09k13X93sIn7BEQ2yxi1kDN1ufhSCYZQG2NnSMfX
	oPDvkBlZEyQUoFqTPyY/qC0KO/j7Ynw8x40Ui0hgni33j6uObEjGfWOS/5l0jsVZ6w4V
	Mqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FWwv0L61Y8ilJPhjlpOBshuQg1I3V1AOSFxT8oktxv8=;
	b=oQJoiMoRLJYawWy0UugSk9TtkvnfORDJcd6SDa/VMW6ql5sz5H3TP4gRYaw+4cgLMU
	/4V2yAPOR1lTKxoB9gJMJfbkyDglFc5eHQXvFzRveQjbDMFfqM2qkQXhx3CUhVP8Acbl
	o1EgL9rZThyPVihIl7NSvtD+S9NTXZf6JJ6EpakcBQFAr1MPRUAZVBmgoBu2kGBZB6SN
	xV91peuU6GoMolHTrupIG+n5xuIJ9WgVeaG0PA1DaG7HDZ2N5UjnUzi5NAMb3B+YZbJ0
	3tNtRfPO1tR1kQG2skvlD60vzg9/DbsrX9u5bedgn53E6DCOQB2LvnXGfrN9QpHWoS7A
	x/3Q==
X-Gm-Message-State: APjAAAWyylDmrVG6Rw1CAtQo3Aui+TxgKT/B4YpWMOG9ZcMMmDHkC5AX
	/Lereqwi8LGSI2FQhhybnYq3gKrls/I8+3Vuf2Y=
X-Google-Smtp-Source: APXvYqzR4GLRI1xfbJL/sbRwWW9P3ru23s+c8znfoMTh3X33Os7oaDRP6Tl0Fe8Yc1foTY/R6a0O6m3AIA9apMAEhOA=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr7111854qtr.194.1562949665832; 
	Fri, 12 Jul 2019 09:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <1562930807-28919-1-git-send-email-mikko.rapeli@bmw.de>
	<CA+chaQe9QVLqAos53+svN0-V-9+hF=xgWEvyhR8bLGP-gL-Dow@mail.gmail.com>
In-Reply-To: <CA+chaQe9QVLqAos53+svN0-V-9+hF=xgWEvyhR8bLGP-gL-Dow@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Jul 2019 09:40:39 -0700
Message-ID: <CAMKF1so5c5hSWn3CbxSp_U22-u5N+rp=E0MDLs3aZoUE2wesqw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf: fix ptest compilation with hardening flags
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
X-List-Received-Date: Fri, 12 Jul 2019 16:41:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 12, 2019 at 5:15 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Doesn't
> http://git.openembedded.org/meta-openembedded/commit/?id=a2fac5a0a4848c2486cb3982f930f45f04469860
> resolve
> the same?

actually I see they regressed see
https://errors.yoctoproject.org/Errors/Details/251505/

>
> Your change might be better (then we should partially revert mine), because
> I'm still seeing some recipes which depend on protobuf failing with similar
> errors like protobuf itself did.

and the above commit is applied, so this change should be made on top
of that if not done already

>
> On Fri, Jul 12, 2019 at 1:58 PM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>
> > Build fails when conf/local.conf has both hardening and ptests enabled:
> >
> > require conf/distro/include/security_flags.inc
> >
> > DISTRO_FEATURES_append = " ptest"
> >
> > Use CXXFLAGS for examples too to avoid hardening warnings
> > about using O0 optimization.
> >
> > Then change linking order to avoid linker failures:
> >
> > aarch64-poky-linux-g++  -fstack-protector-strong  -D_FORTIFY_SOURCE=2
> > -Wformat -Wformat-security -Werror=form
> > at-security -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat
> > -Wformat-security -Werror=format-security
> >
> > --sysroot=/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysroot
> >  -O2 -pipe -g -feliminate-unused-debug-types
> > -fmacro-prefix-map=/home/builder/src/base/build/tmp/work/aar
> > ch64-poky-linux/protobuf/3.8.0-r0=/usr/src/debug/protobuf/3.8.0-r0
> >               -fdebug-pre
> >
> > fix-map=/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0=/usr/src/debug/pr
> > otobuf/3.8.0-r0
> > -fdebug-prefix-map=/home/builder/src/base/build/tmp/work/aarch6
> > 4-poky-linux/protobuf/3.8.0-r0/recipe-sysroot=
> > -fdebug-prefix-map=/home/builder/src
> > /base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysroot-native=
> > -fvisibility-inlin
> > es-hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> > -fstack-protector-strong -Wl,-z,relro,-z,now -fstack-p
> > rotector-strong -Wl,-z,relro,-z,now -pthread
> > -I/home/builder/src/base/build/tmp/work/aarch64-poky-linux/p
> > rotobuf/3.8.0-r0/git/src
> > -L/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r
> > 0/git/src/.libs
> > -L/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/re
> > cipe-sysroot/usr/lib -lprotobuf
> > ../src/google/protobuf/.libs/timestamp.pb.o add_person.cc
> > addressbook.pb.cc -
> > o add_person_cpp
> >
> > /home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysroot-native/usr
> > /bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/9.1.0/ld:
> > ../src/google/protobuf/.libs/timestamp.pb.o: in function
> > `google::protobuf::Timestamp::SerializeWithCachedSizes(google::protobuf::io::CodedOutputStream*)
> > const':
> > /usr/src/debug/protobuf/3.8.0-r0/git/src/google/protobuf/
> > timestamp.pb.cc:279: undefined reference to
> > `google::protobuf::internal::WireFormat::SerializeUnknownFields(google::protobuf::UnknownFieldSet
> > const&, google::protobuf::io::CodedOutputStream*)'
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  .../0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch   | 4
> > ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git
> > a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> > b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> > index 029abfd..0a2e5e2 100644
> > ---
> > a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> > +++
> > b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> > @@ -45,12 +45,12 @@ index 4ad605641..31d887639 100644
> >   add_person_cpp: add_person.cc protoc_middleman
> >         pkg-config --cflags protobuf  # fails if protobuf is not installed
> >  -      c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config
> > --cflags --libs protobuf`
> > -+      $(CXX) $(LDFLAGS) $(PROTOBUF)
> > ../src/google/protobuf/.libs/timestamp.pb.o add_person.cc
> > addressbook.pb.cc -o add_person_cpp
> > ++      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> > ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc
> > addressbook.pb.cc -o add_person_cpp
> >
> >   list_people_cpp: list_people.cc protoc_middleman
> >         pkg-config --cflags protobuf  # fails if protobuf is not installed
> >  -      c++ list_people.cc addressbook.pb.cc -o list_people_cpp
> > `pkg-config --cflags --libs protobuf`
> > -+      $(CXX) $(LDFLAGS) $(PROTOBUF)
> > ../src/google/protobuf/.libs/timestamp.pb.o list_people.cc
> > addressbook.pb.cc -o list_people_cpp
> > ++      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> > ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc
> > addressbook.pb.cc -o list_people_cpp
> >
> >   add_person_dart: add_person.dart protoc_middleman_dart
> >
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

