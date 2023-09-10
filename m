Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9825BEC8748
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 06:28:05 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.31799.1694327279871882667
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Sep 2023 23:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RyDeNFUA;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1cca0a1b3c7so2442500fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 23:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694327279; x=1694932079; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E95HE+Tcdb37wx6b8tsXYUijF/yxwD5zp77RFJjzCCU=;
        b=RyDeNFUANFNjajgYpr3bna3FZd870XBpbY8wJw7hONJZaV3UY0jFfxbhRSuRtriCch
         OjiwaB1mE+yi+ObyBlX629P3m8dwD9nSTsnXeIHgxuXTqZ/pxhD78gX8hC6o1p+k94hJ
         FySTjflGB475xB8gkjuc6GsuvPqnEmypMtUtx5MdD2zomxGFAbKJRe1BBXHTmx3BYbxk
         bf/yXXXB2+UIyFlSOLAZ7ezXAIPaOJKZQKi2v8vmB1QgggwZNo1WugxRISfGU5FnvqqL
         oWuB/md6fYcdso/KMK3VoUdp7N426O4kV1/ekhvp0hE/buXHa7G+EgOfuWYcOTJsm5s5
         8qzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694327279; x=1694932079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E95HE+Tcdb37wx6b8tsXYUijF/yxwD5zp77RFJjzCCU=;
        b=YhdcHBv2i6obHMxIKQF7uLnauTKx74kFnjqVM4WbRliPy6CZ4JzGnsoOstdewOIThZ
         XutguKjVEgYraQHsV/2dVXSYUOy9kOInrUtuWJWscfDFtBr1CIxAy5NqiVhyX7ls1a87
         jFN9v/DUqrK57VMJl9uUrSxIKBI4/3LV0yfEwKzzC8svqkfM7FvsmQEWXRBr7LHPPlWq
         Ubwn6Zf8dwDJBDKWlOv7YI33Z1hg5wd/OhRtG/CBDdCS0l+mtG3WhOiZVdv9wEBAh89T
         QWrnhE4HcQQyw1NGhEFk7IZ8rUhixlE5D3WCUJEqIt1wrdTQMalyQ3V40o5sIZVPxEt4
         0HLg==
X-Gm-Message-State: AOJu0Yzv0IgChqed9otmSihyLVQp2qnl204/MSFA+r6Rpig6fPJxVZy/
	S76OFzKAueEacjPds8I5FhAJx8uXeeZUVlsQ26Z3nGwS3Nv8Mw==
X-Google-Smtp-Source: AGHT+IEBLNKTxDVSHRkNffnPEcSaD3jeAqKuwa728yvoJrApwY+IwpkEiI7ZdfCifpJbH6CpD7e6V7Z8+CaD8VIJgEM=
X-Received: by 2002:a05:6870:d98f:b0:1d5:9451:d4da with SMTP id
 gn15-20020a056870d98f00b001d59451d4damr3568249oab.17.1694327278916; Sat, 09
 Sep 2023 23:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230909093517.444924-1-peron.clem@gmail.com> <20230909093517.444924-2-peron.clem@gmail.com>
In-Reply-To: <20230909093517.444924-2-peron.clem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Sep 2023 23:27:32 -0700
Message-ID: <CAMKF1sryDUR4Hb8fZdY8HB+o50q4oWwKkWHJZF88rSpDHHAudQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/4] protobuf: upgrade 3.21.12 -> 4.22.2
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Xiangyu Chen <xiangyu.chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 06:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104820

this causes usbguard build failures -
https://errors.yoctoproject.org/Errors/Details/736325/

On Sat, Sep 9, 2023 at 2:35=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.clem@=
gmail.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  ...efile-respect-CXX-LDFLAGS-variables-fix-.patch | 15 +++++++++------
>  .../{protobuf_3.21.12.bb =3D> protobuf_4.22.2.bb}   | 11 ++++++++---
>  2 files changed, 17 insertions(+), 9 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb =3D> proto=
buf_4.22.2.bb} (86%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Mak=
efile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/p=
rotobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.=
patch
> index 36c3c597a..7c4bf260e 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
> @@ -30,7 +30,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
>  diff --git a/examples/Makefile b/examples/Makefile
> -index 1c7ec8d63..85f591231 100644
> +index ef7a4ef58..7206e14e1 100644
>  --- a/examples/Makefile
>  +++ b/examples/Makefile
>  @@ -2,6 +2,8 @@
> @@ -42,17 +42,20 @@ index 1c7ec8d63..85f591231 100644
>   all: cpp java python
>
>   cpp:    add_person_cpp    list_people_cpp
> -@@ -40,11 +42,11 @@ protoc_middleman_dart: addressbook.proto
> +@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
>
>   add_person_cpp: add_person.cc protoc_middleman
>         pkg-config --cflags protobuf  # fails if protobuf is not installe=
d
> --      c++ -std=3Dc++11 add_person.cc addressbook.pb.cc -o add_person_cp=
p `pkg-config --cflags --libs protobuf`
> -+      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timest=
amp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
> +-      c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o add_person_cp=
p `pkg-config --cflags --libs protobuf`
> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timest=
amp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(C=
XX) -std=3Dc++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_=
cpp
>
>   list_people_cpp: list_people.cc protoc_middleman
>         pkg-config --cflags protobuf  # fails if protobuf is not installe=
d
> --      c++ -std=3Dc++11 list_people.cc addressbook.pb.cc -o list_people_=
cpp `pkg-config --cflags --libs protobuf`
> -+      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timest=
amp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
> +-      c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o list_people_=
cpp `pkg-config --cflags --libs protobuf`
> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timest=
amp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$=
(CXX) -std=3Dc++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_peo=
ple_cpp
>
>   add_person_dart: add_person.dart protoc_middleman_dart
>
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb b/meta=
-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
> similarity index 86%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
> index d95e1c20f..b97da6ea6 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
> @@ -7,12 +7,12 @@ SECTION =3D "console/tools"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37b5762e07f0af8c74ce80a8bda42=
66b"
>
> -DEPENDS =3D "zlib"
> +DEPENDS =3D "zlib abseil-cpp"
>  DEPENDS:append:class-target =3D " protobuf-native"
>
> -SRCREV =3D "f0dc78d7e6e331b8c6bb2d5283e06aa26883ca7c"
> +SRCREV =3D "81f89d509d6771dcccb619cbe26ac86cec472582"
>
> -SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D21.x=
;protocol=3Dhttps \
> +SRC_URI =3D "gitsm://github.com/protocolbuffers/protobuf.git;branch=3D22=
.x;protocol=3Dhttps \
>             file://run-ptest \
>             file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch \
>             file://0001-Fix-linking-error-with-ld-gold.patch \
> @@ -35,6 +35,7 @@ EXTRA_OECMAKE +=3D "\
>      -Dprotobuf_BUILD_LIBPROTOC=3DON \
>      -Dprotobuf_BUILD_TESTS=3DOFF \
>      -Dprotobuf_BUILD_EXAMPLES=3DOFF \
> +    -Dprotobuf_ABSL_PROVIDER=3D"package" \
>  "
>
>  TEST_SRC_DIR =3D "examples"
> @@ -52,7 +53,11 @@ do_compile_ptest() {
>         cp ${S}/${TEST_SRC_DIR}/Makefile "${B}/${TEST_SRC_DIR}/"
>         sed -e 's|libdir=3D|libdir=3D${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}=
/${TEST_SRC_DIR}/protobuf.pc"
>         sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/p=
rotobuf.pc"
> +       sed -e 's|Cflags:|Cflags: -I${WORKDIR}/recipe-sysroot{includedir}=
 |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
>         sed -e 's|Libs:|Libs: -L${B}|' -i "${B}/${TEST_SRC_DIR}/protobuf.=
pc"
> +       sed -e 's|Libs:|Libs: -L${WORKDIR}/recipe-sysroot/usr/lib|' -i "$=
{B}/${TEST_SRC_DIR}/protobuf.pc"
> +       sed -e 's|Libs:|Libs: -labsl_log_internal_check_op |' -i "${B}/${=
TEST_SRC_DIR}/protobuf.pc"
> +       sed -e 's|Libs:|Libs: -labsl_log_internal_message |' -i "${B}/${T=
EST_SRC_DIR}/protobuf.pc"
>         # Until out-of-tree build of examples is supported, we have to us=
e this approach
>         sed -e 's|../src/google/protobuf/.libs/timestamp.pb.o|${B}/CMakeF=
iles/libprotobuf.dir/src/google/protobuf/timestamp.pb.cc.o|' -i "${B}/${TES=
T_SRC_DIR}/Makefile"
>         export PKG_CONFIG_PATH=3D"${B}/${TEST_SRC_DIR}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104810): https://lists.openembedded.org/g/openembedde=
d-devel/message/104810
> Mute This Topic: https://lists.openembedded.org/mt/101253578/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

