Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B96C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 17:15:16 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.582.1741799707782219544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 10:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jps3DeEa;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7272f3477e9so16346a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 10:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741799707; x=1742404507; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phPxC3xSS3s6cqscyw8uBqIAMB4CmUpDAilSp9Cs330=;
        b=Jps3DeEaqa8+MFFxFmQdwszbeb6MxogPQvnBWUbg3WtBLMd5Spol+kuMFxnZ7C5cGC
         rTNl9tjOmZo5hvXGJgdOj/uk8o9HiB0All6F+qwfBGi7atxrfCuRPaPOylQXEjfZ7XgI
         ldbc95p2PARPyb88yEtLobWkKNqmRiB/nkf6r5jQbNiIzShCpJTj5gkbQ1xJbkpMOZPk
         mBZSnQOffTrQJtfwU9C7/JX+W5MSmA6uqG4jf3XXRjez3Nz+4G4Ud6uMoRoASP1g8cRB
         Yz5qXR8HSeD4e8Eq+sf37Yv2m+jLWZmziv54GMrtVl8G6pVQTdNqniCOaCi5dAd8Sc7h
         Pc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741799707; x=1742404507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phPxC3xSS3s6cqscyw8uBqIAMB4CmUpDAilSp9Cs330=;
        b=sfbg4Z2c6nvZdgfFUZ7xj++6TJN8rcNvxIBv9xsrd/nj7rtPHdfzy0YXIew+KYcQzx
         W2/w+Fie7tTlwBydsD+KmQC7o1zRElyCCChRlcGQLSui3dImrOBjzuwqp99BLDN5TXCc
         PicDgSkRclhaWSQFO3dmW7loHvYtvG7d16P5iqDn09RGMjrtY0AJrKoVV2ONBSIPB8hl
         Hr1a9CcSryYRBoJ0JvYhml1VJDjPcuZIqLzFSnqb6oSv/T03qETNtYCw7yz0wOaGy4di
         JumSisyMikDG7VF/w/xBay7lxTA/cVKVYOpmSp+2lEoY5sqtg84q8gcZxy1x+QJhj6/2
         fBmA==
X-Gm-Message-State: AOJu0YykdiP268YSl55p3cnxodSszHxhjOPetUsNvJDZaGhFoskbum/g
	YL9RRZL15Q867pvGxV2hrKIQSl7lGyHZJK3mxyKL8QFbr03cf564/jqlUDAO94GZ3GEs0x4ONJS
	YVblX8LMRt4RwH1B5r3MSaa7beQA=
X-Gm-Gg: ASbGnctEw9TyqyuICQ3l+LYu5XXTXfKf3RnOWGs5XShuztgALLOWOlmznYHOamkg6UB
	j1gRzGClzDYyoJM+8o3Ds8n4xHTdPWatKqadT/rP75SXGczqyHH/8gzOhwjgEHEr0LErIp9tKj3
	Yvt6BC5zIus4YAb0fSjwdNkPUHjA==
X-Google-Smtp-Source: AGHT+IHo5rC6IJw0hICR8Y5BelFcdM+psEnfjUZfCVOoEAbd7j/Q7bBS49JQecOoemQaXmxlvBIy70iQ7oPEhcWpvPk=
X-Received: by 2002:a05:6808:118e:b0:3fa:25c8:a037 with SMTP id
 5614622812f47-3fa25c8aae2mr4612029b6e.29.1741799706794; Wed, 12 Mar 2025
 10:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250311084128.2366058-1-hongxu.jia@windriver.com> <CAMKF1srsD=LQz0XT_awW74PN-pyf9ZgbgV2V1=Z+xemkdpNtcg@mail.gmail.com>
In-Reply-To: <CAMKF1srsD=LQz0XT_awW74PN-pyf9ZgbgV2V1=Z+xemkdpNtcg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Mar 2025 10:14:40 -0700
X-Gm-Features: AQ5f1Jpx8_gUz5sqjj-Tukr8vGUHvrLwxX50cEFRMCdEd16-aHiZqix9GtdGgvw
Message-ID: <CAMKF1so2Zi6xorwFRrVTbjnBBbKifH72tT-JRfX-PNY1V-TCHg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] protobuf: 4.25.5 -> 4.30.0
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 17:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115937

ptest build fails see -
https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/448/step=
s/14/logs/stdio

On Tue, Mar 11, 2025 at 4:31=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> This causes protobuf-c to not build see
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/446/st=
eps/14/logs/stdio
>
> On Tue, Mar 11, 2025 at 1:41=E2=80=AFAM hongxu via lists.openembedded.org
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
> >
> > Refresh local patches
> > - 0001-Fix-build-on-mips-clang.patch
> > - 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> >
> > Drop the fix for gold linker build
> >
> > Changelog:
> > https://github.com/protocolbuffers/protobuf/releases/tag/v30.0
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >  .../0001-Fix-build-on-mips-clang.patch        | 26 ++++++++-----
> >  ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 37 ++++++-------------
> >  ...{protobuf_4.25.5.bb =3D> protobuf_4.30.0.bb} |  4 +-
> >  3 files changed, 31 insertions(+), 36 deletions(-)
> >  rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.5.bb =3D> prot=
obuf_4.30.0.bb} (98%)
> >
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-=
on-mips-clang.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-b=
uild-on-mips-clang.patch
> > index 9f6116c4c4..6db22c26d3 100644
> > --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips=
-clang.patch
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips=
-clang.patch
> > @@ -1,6 +1,6 @@
> > -From 08e46feb6553af670754e65d94c3bb6fcd4e0cf9 Mon Sep 17 00:00:00 2001
> > +From fd5a966a6385165506a1b84298465cbb9f44222d Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sun, 31 Oct 2021 23:39:44 -0700
> > +Date: Mon, 10 Mar 2025 19:59:19 -0700
> >  Subject: [PATCH] Fix build on mips/clang
> >
> >  clang13 crashes on mips, until its fixed upstream disable tailcall on
> > @@ -10,17 +10,25 @@ https://bugs.llvm.org/show_bug.cgi?id=3D52367
> >
> >  Upstream-Status: Inappropriate [Clang workaround]
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Rebase to v4.30.0
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >  ---
> > - src/google/protobuf/port_def.inc | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > + src/google/protobuf/port_def.inc | 1 +
> > + 1 file changed, 1 insertion(+)
> >
> > +diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/po=
rt_def.inc
> > +index 35f49afb4..e9597af0d 100644
> >  --- a/src/google/protobuf/port_def.inc
> >  +++ b/src/google/protobuf/port_def.inc
> > -@@ -255,6 +255,7 @@
> > +@@ -222,6 +222,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
> >   #error PROTOBUF_TAILCALL was previously defined
> >   #endif
> > - #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) && \
> > + #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) && =
 \
> >  +    !defined(__mips__) && \
> > -     !defined(_ARCH_PPC) && !defined(__wasm__) &&                 \
> > -     !(defined(_MSC_VER) && defined(_M_IX86)) &&                  \
> > -     !(defined(__NDK_MAJOR__) && __NDK_MAJOR <=3D 24)
> > +     !defined(_ARCH_PPC) && !defined(__wasm__) &&                     =
 \
> > +     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__)
> > + // Compilation fails on ARM32: b/195943306
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-M=
akefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools=
/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix=
-.patch
> > index 7c4bf260eb..5457d0d6bc 100644
> > --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile=
-respect-CXX-LDFLAGS-variables-fix-.patch
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile=
-respect-CXX-LDFLAGS-variables-fix-.patch
> > @@ -1,36 +1,23 @@
> > -From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2001
> > +From 88d4e5afb2c3b56933c529216cd8b733e10a5b7b Mon Sep 17 00:00:00 2001
> >  From: Martin Jansa <Martin.Jansa@gmail.com>
> > -Date: Fri, 28 Jun 2019 13:50:52 +0000
> > -Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix=
 build
> > - with gold
> > +Date: Tue, 11 Mar 2025 16:35:39 +0800
> > +Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables
> >
> >  * move pkg-config call to separate variable, so that the final version
> >    of the whole command so it's shown in log.do_compile_ptest_base
> > -* add ../src/google/protobuf/.libs/timestamp.pb.o when linking
> > -  add_person_cpp otherwise it fails to link with gold:
> > -  i686-oe-linux-g++  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmat=
h=3Dsse --sysroot=3Dcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,=
-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed add_person.cc addressbook.pb.cc =
-o add_person_cpp `pkg-config --cflags --libs protobuf`
> > -  /tmp/cccjSJQs.o:addressbook.pb.cc:scc_info_Person_addressbook_2eprot=
o: error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2fti=
mestamp_2eproto'
> > -  /tmp/cccjSJQs.o:addressbook.pb.cc:descriptor_table_addressbook_2epro=
to_deps: error: undefined reference to 'descriptor_table_google_2fprotobuf_=
2ftimestamp_2eproto'
> > -  collect2: error: ld returned 1 exit status
> > -  Makefile:43: recipe for target 'add_person_cpp' failed
> > -
> > -* and the same with list_people_cpp this time with pkg-config already =
through the variable:
> > -  i686-oe-linux-g++  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmat=
h=3Dsse --sysroot=3Dcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,=
-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -pthread -Icore2-32-oe-linux/pro=
tobuf/3.8.0-r0/git/src -Lcore2-32-oe-linux/protobuf/3.8.0-r0/git/src/.libs =
-Lcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot/usr/lib -lprotobuf lis=
t_people.cc addressbook.pb.cc -o list_people_cpp
> > -  /tmp/ccpaI5Su.o:addressbook.pb.cc:scc_info_Person_addressbook_2eprot=
o: error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2fti=
mestamp_2eproto'
> > -  /tmp/ccpaI5Su.o:addressbook.pb.cc:descriptor_table_addressbook_2epro=
to_deps: error: undefined reference to 'descriptor_table_google_2fprotobuf_=
2ftimestamp_2eproto'
> > -  collect2: error: ld returned 1 exit status
> > -  Makefile:49: recipe for target 'list_people_cpp' failed
> >
> >  Upstream-Status: Pending
> >  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >  Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> >
> > +Rebase to v4.30.0
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >  ---
> >   examples/Makefile | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> >  diff --git a/examples/Makefile b/examples/Makefile
> > -index ef7a4ef58..7206e14e1 100644
> > +index 5290fdb03f..b695b03707 100644
> >  --- a/examples/Makefile
> >  +++ b/examples/Makefile
> >  @@ -2,6 +2,8 @@
> > @@ -42,20 +29,20 @@ index ef7a4ef58..7206e14e1 100644
> >   all: cpp java python
> >
> >   cpp:    add_person_cpp    list_people_cpp
> > -@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
> > +@@ -46,11 +48,11 @@ protoc_middleman_ruby: addressbook.proto
> >
> >   add_person_cpp: add_person.cc protoc_middleman
> >         pkg-config --cflags protobuf  # fails if protobuf is not instal=
led
> > --      c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o add_person_=
cpp `pkg-config --cflags --libs protobuf`
> > -+      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/time=
stamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$=
(CXX) -std=3Dc++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_perso=
n_cpp
> > +-      c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-conf=
ig --cflags --libs protobuf`
> > ++      $(CXX) $(CXXFLAGS) $(LDFLAGS) $(PROTOBUF) add_person.cc address=
book.pb.cc -o add_person_cpp
> >
> >   list_people_cpp: list_people.cc protoc_middleman
> >         pkg-config --cflags protobuf  # fails if protobuf is not instal=
led
> > --      c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o list_peopl=
e_cpp `pkg-config --cflags --libs protobuf`
> > -+      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/time=
stamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp =
#$(CXX) -std=3Dc++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_p=
eople_cpp
> > +-      c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-co=
nfig --cflags --libs protobuf`
> > ++      $(CXX) $(CXXFLAGS) $(LDFLAGS) $(PROTOBUF) list_people.cc addres=
sbook.pb.cc -o list_people_cpp
> >
> >   add_person_dart: add_person.dart protoc_middleman_dart
> >
> > ---
> > +--
> >  2.34.1
> >
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/met=
a-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> > similarity index 98%
> > rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> > rename to meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> > index a470a7c643..f899a1dc07 100644
> > --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> > @@ -14,9 +14,9 @@ LIC_FILES_CHKSUM =3D " \
> >  DEPENDS =3D "zlib abseil-cpp jsoncpp"
> >  DEPENDS:append:class-target =3D " protobuf-native"
> >
> > -SRCREV =3D "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
> > +SRCREV =3D "d295af5c3002c08e1bfd9d7f9e175d0a4d015f1e"
> >
> > -SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D25=
.x;protocol=3Dhttps \
> > +SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D30=
.x;protocol=3Dhttps \
> >             file://run-ptest \
> >             file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables=
-fix-.patch \
> >             "
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#115849): https://lists.openembedded.org/g/openembed=
ded-devel/message/115849
> > Mute This Topic: https://lists.openembedded.org/mt/111636359/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

