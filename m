Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1642C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 02:12:42 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.14982.1680055959596245029
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Mar 2023 19:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eki7q2ab;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id h22-20020a4ad756000000b0053e4ab58fb5so1167366oot.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 19:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680055959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Umlc5qv/qLXT8zcij4lHlZyw+6tQVVCWRbfRQZBIl04=;
        b=eki7q2abS8uibOfNMJF9QG1EOtH9kxojFE9mY91OAvjS6ewm4pFIL/1kloNP4OjL4L
         FBTwKsMY89xhN2LJHN/keUDOMb/GIaJ2wS6LmmrMt+QFzJMf0KiJ5WqjOwCrQaLRmErs
         FApYmL+1aNG4bWHde3r5tHrZ7dd5Auib+6LgOUmi8S36mVb8U82pXAd7xyO8BQHS+0/H
         hFjN4O+TcQR5VaXo7g/tQxnmsMxR4/x/jX1FxFt5OVCZrxGaSq2cd+T/MdRgtw56uiHb
         pu+4nO3JM7AxiwBkzi9bg29a2ebD0fICb0e+MzozjenkENwDowUwfPiNpzMV7q7YoIkR
         ICKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680055959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Umlc5qv/qLXT8zcij4lHlZyw+6tQVVCWRbfRQZBIl04=;
        b=LirUA1Tvba2kCeGO9nn3QEEoAUhlKxXO8ZqppGZbOUxsKSi5ANWYpLFvgzrvgmVr8Z
         a2ClI9EZGHatmaY5XzgjwrQzwMoKO13hfHbOnc2B58ulj1LyRqaghE0IQzA3rTmSqKiW
         RcoSWH0UTsGwaoCuM4gK3Qn31nVygXQ+vWHB7XRijqacdLOo+7wTOTQ76AJ+Aryra7R5
         lYAZ5BVhZMq5Z2nvpeto1BC91sq64bSzk0R/Gl7DnH48tjAtsG5rNYzz63hekIHynNGD
         jZFZ+nbkDU85U8NLIC4mHKRGddhBAxc3uP9Xb1zcBfo0pTsrL6O3C8NHqhThW/Ox3Wfi
         LFuA==
X-Gm-Message-State: AO0yUKVrL9uFKz7QBa4QB6ZQpOUjoA6RrsKlDEP1WWXZpdEsZ6IPZ+aM
	kT8MWvSWf1cY3jAf/4kERIEyYE+Zcn0b9muxLtK7gt4N
X-Google-Smtp-Source: AK7set83l5tr1dabdVaazuvY4fVgB3R+6Pe5rcNe0ERFJsmG++ybHxwmrdm83PvA6IL55pKHg8fgTLU5XC+yhSIBoRA=
X-Received: by 2002:a4a:d197:0:b0:53b:d027:81a with SMTP id
 j23-20020a4ad197000000b0053bd027081amr5903274oor.0.1680055958506; Tue, 28 Mar
 2023 19:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230328064248.4049456-1-xiangyu.chen@eng.windriver.com>
 <20230328064248.4049456-2-xiangyu.chen@eng.windriver.com> <CAMKF1spGf+sSjwSoHRYr6c1XGEsWAHkww+Ew9G87iPu8+NyP7A@mail.gmail.com>
 <175085C237DCAF2E.28404@lists.openembedded.org> <1346bc03-e810-9a2d-95fe-360ccdb2d10b@windriver.com>
In-Reply-To: <1346bc03-e810-9a2d-95fe-360ccdb2d10b@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Mar 2023 19:12:12 -0700
Message-ID: <CAMKF1soXibfCmBqCQTNi2ypereVYSdaMnXUdh9SiU4L4Xw+ndg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v2 1/2] protobuf: upgrade 3.21.12 -> 4.22.2
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 02:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101811

On Tue, Mar 28, 2023 at 6:57=E2=80=AFPM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> Hi,
>
>
> On 3/28/23 15:48, Xiangyu Chen wrote:
> > Hello,
> >
> >
> > On 3/28/23 15:22, Khem Raj wrote:
> >> CAUTION: This email comes from a non Wind River email account!
> >> Do not click links or open attachments unless you recognize the
> >> sender and know the content is safe.
> >>
> >> it stil fails
> >>
> >> Summary: 2 tasks failed:
> >> virtual:native:/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/rec=
ipes-devtools/protobuf/protobuf-c_1.4.1.bb:do_compile
> >> /mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-connectivi=
ty/mosh/mosh_1.4.0.bb:do_configure
> >> Summary: There were 4 ERROR messages, returning a non-zero exit code.
> >
> > Could you please help to share the error log with me? thanks.
> >
> > I applied the protobuf-c related patch cannot reproduce in my local
> > setup with "bitbake protobuf-c -c cleanall;bitbake protobuf-c" .
> >
> Upgrading protobuf caused the mosh compile error has already fixed and
> sent a patch to mosh upstream[1], this commit will contain in V3 patch,
>
> but regarding protobuf-c, after applying the patch that was sent to
> oe-dev list[2] yesterday is building normal in my local setup. could you
> help to
>
> share the error log which happens on build server? thanks!

Try building with clang perhaps thats is whats failing.

>
>
> [1] https://github.com/mobile-shell/mosh/pull/1266
>
> [2] https://lists.openembedded.org/g/openembedded-devel/message/101797
>
>
> Thanks!
>
>
> >
> > Br,
> >
> > Xiangyu
> >
> >>
> >> On Mon, Mar 27, 2023 at 11:43=E2=80=AFPM Xiangyu Chen
> >> <xiangyu.chen@eng.windriver.com> wrote:
> >>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>>
> >>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>> ---
> >>>   ...efile-respect-CXX-LDFLAGS-variables-fix-.patch | 15
> >>> +++++++++------
> >>>   .../{protobuf_3.21.12.bb =3D> protobuf_4.22.2.bb}   | 11 ++++++++--=
-
> >>>   2 files changed, 17 insertions(+), 9 deletions(-)
> >>>   rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb =3D>
> >>> protobuf_4.22.2.bb} (86%)
> >>>
> >>> diff --git
> >>> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
> >>> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
> >>>
> >>> index 36c3c597a..7c4bf260e 100644
> >>> ---
> >>> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
> >>> +++
> >>> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
> >>> @@ -30,7 +30,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> >>>    1 file changed, 4 insertions(+), 2 deletions(-)
> >>>
> >>>   diff --git a/examples/Makefile b/examples/Makefile
> >>> -index 1c7ec8d63..85f591231 100644
> >>> +index ef7a4ef58..7206e14e1 100644
> >>>   --- a/examples/Makefile
> >>>   +++ b/examples/Makefile
> >>>   @@ -2,6 +2,8 @@
> >>> @@ -42,17 +42,20 @@ index 1c7ec8d63..85f591231 100644
> >>>    all: cpp java python
> >>>
> >>>    cpp:    add_person_cpp    list_people_cpp
> >>> -@@ -40,11 +42,11 @@ protoc_middleman_dart: addressbook.proto
> >>> +@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
> >>>
> >>>    add_person_cpp: add_person.cc protoc_middleman
> >>>          pkg-config --cflags protobuf  # fails if protobuf is not
> >>> installed
> >>> --      c++ -std=3Dc++11 add_person.cc addressbook.pb.cc -o
> >>> add_person_cpp `pkg-config --cflags --libs protobuf`
> >>> -+      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> >>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF)
> >>> add_person.cc addressbook.pb.cc -o add_person_cpp
> >>> +-      c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o
> >>> add_person_cpp `pkg-config --cflags --libs protobuf`
> >>> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> >>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF)
> >>> add_person.cc addressbook.pb.cc -o add_person_cpp #$(CXX) -std=3Dc++1=
7
> >>> $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
> >>>
> >>>    list_people_cpp: list_people.cc protoc_middleman
> >>>          pkg-config --cflags protobuf  # fails if protobuf is not
> >>> installed
> >>> --      c++ -std=3Dc++11 list_people.cc addressbook.pb.cc -o
> >>> list_people_cpp `pkg-config --cflags --libs protobuf`
> >>> -+      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> >>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF)
> >>> list_people.cc addressbook.pb.cc -o list_people_cpp
> >>> +-      c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o
> >>> list_people_cpp `pkg-config --cflags --libs protobuf`
> >>> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> >>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF)
> >>> list_people.cc addressbook.pb.cc -o list_people_cpp #$(CXX)
> >>> -std=3Dc++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o
> >>> list_people_cpp
> >>>
> >>>    add_person_dart: add_person.dart protoc_middleman_dart
> >>>
> >>> +--
> >>> +2.34.1
> >>> +
> >>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> >>> b/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
> >>> similarity index 86%
> >>> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> >>> rename to meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
> >>> index 343933033..0c6b446dc 100644
> >>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> >>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
> >>> @@ -7,12 +7,12 @@ SECTION =3D "console/tools"
> >>>   LICENSE =3D "BSD-3-Clause"
> >>>   LIC_FILES_CHKSUM =3D
> >>> "file://LICENSE;md5=3D37b5762e07f0af8c74ce80a8bda4266b"
> >>>
> >>> -DEPENDS =3D "zlib"
> >>> +DEPENDS =3D "zlib abseil-cpp"
> >>>   DEPENDS:append:class-target =3D " protobuf-native"
> >>>
> >>> -SRCREV =3D "f0dc78d7e6e331b8c6bb2d5283e06aa26883ca7c"
> >>> +SRCREV =3D "81f89d509d6771dcccb619cbe26ac86cec472582"
> >>>
> >>> -SRC_URI =3D
> >>> "git://github.com/protocolbuffers/protobuf.git;branch=3D21.x;protocol=
=3Dhttps
> >>> \
> >>> +SRC_URI =3D
> >>> "gitsm://github.com/protocolbuffers/protobuf.git;branch=3D22.x;protoc=
ol=3Dhttps
> >>> \
> >>>              file://run-ptest \
> >>> file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patc=
h
> >>> \
> >>>              file://0001-Fix-linking-error-with-ld-gold.patch \
> >>> @@ -35,6 +35,7 @@ EXTRA_OECMAKE +=3D "\
> >>>       -Dprotobuf_BUILD_LIBPROTOC=3DON \
> >>>       -Dprotobuf_BUILD_TESTS=3DOFF \
> >>>       -Dprotobuf_BUILD_EXAMPLES=3DOFF \
> >>> +    -Dprotobuf_ABSL_PROVIDER=3D"package" \
> >>>   "
> >>>
> >>>   TEST_SRC_DIR =3D "examples"
> >>> @@ -52,7 +53,11 @@ do_compile_ptest() {
> >>>          cp ${S}/${TEST_SRC_DIR}/Makefile "${B}/${TEST_SRC_DIR}/"
> >>>          sed -e 's|libdir=3D|libdir=3D${PKG_CONFIG_SYSROOT_DIR}|' -i
> >>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> >>>          sed -e 's|Cflags:|Cflags: -I${S}/src|' -i
> >>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> >>> +       sed -e 's|Cflags:|Cflags:
> >>> -I${WORKDIR}/recipe-sysroot-native${includedir} |' -i
> >>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> >>>          sed -e 's|Libs:|Libs: -L${B}|' -i
> >>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> >>> +       sed -e 's|Libs:|Libs:
> >>> -L${WORKDIR}/recipe-sysroot-native/usr/lib|' -i
> >>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> >>> +       sed -e 's|Libs:|Libs: -labsl_log_internal_check_op |' -i
> >>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> >>> +       sed -e 's|Libs:|Libs: -labsl_log_internal_message |' -i
> >>> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> >>>          # Until out-of-tree build of examples is supported, we have
> >>> to use this approach
> >>>          sed -e
> >>> 's|../src/google/protobuf/.libs/timestamp.pb.o|${B}/CMakeFiles/libpro=
tobuf.dir/src/google/protobuf/timestamp.pb.cc.o|'
> >>> -i "${B}/${TEST_SRC_DIR}/Makefile"
> >>>          export PKG_CONFIG_PATH=3D"${B}/${TEST_SRC_DIR}"
> >>> --
> >>> 2.34.1
> >>>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#101802): https://lists.openembedded.org/g/openembed=
ded-devel/message/101802
> > Mute This Topic: https://lists.openembedded.org/mt/97900181/7175143
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[xiangyu.chen@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

