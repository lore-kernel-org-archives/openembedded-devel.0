Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29A9C76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 07:22:44 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.60538.1679988154941413805
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Mar 2023 00:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eyeiBCbw;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-17ac5ee3f9cso11788414fac.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 00:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679988154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1XnSrHN0Z3qGiZtS05M8xj8S1cItDYoPqKeoc3Vxnk=;
        b=eyeiBCbwlaMI7YayJm2U1eIgBfP7dMa4z4Zdu7ezP/BE7CAdre+d597lAjfcaP13gS
         Cxgs05v4oaEeNvva+7PWlBoNIbvdycmrRDa76F723T7Ng37oGE0aMNeJSaJwOGC2Co1i
         dnTN8a5pU5XtSMELiG3fX9fp4dgesFXc+H0UxOntsyjwrha06fiiYFkYEFRuZxJqVOWT
         g4BCg3puc1ffuH47eUluhVOlttkZyu38KlqmNsabuAWqs0SM3aALHYFQyDi9+jmJMIKu
         S5zXGNxMDaYunvULQNPkx1v2ds7LGp9PkScLiN+eruzfsND2GBzaugYC4jQjICwzgxxd
         2T6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679988154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1XnSrHN0Z3qGiZtS05M8xj8S1cItDYoPqKeoc3Vxnk=;
        b=OwmQXQKt3g88bM+uHP0NIVjT6q2ZQ5DBtB4Kdid4PmBKYvzMbcTgEdEP5CjP44p+hW
         trwdKcXgcugJ/V8yd1DNBd803X9oLWoWkHqFF3a2iDZarS8LwuLHtoXYIliyKqDkLJbk
         LUJRgFGeEwu7wlttP29n6smpSFVekmuoE+aqNLADLiItCKy3V+LwWafDkgns73cxbZmV
         kB2S3p0lCDAu3gEhV5D76YMB3Mdz9xjS11ryf+xsFlGnoMYtfyQ/T44tOTLv+aD9Ogtc
         lRw+2bgNgIQ0y31xzMYvzQ5tQ4psfgCT3UteWCCSmBhSb5MyPXyInQ72arQqrSXdI0K+
         dB/A==
X-Gm-Message-State: AAQBX9eZr8VF6SCHKDV1uPPz3gHiOdOCjK1R3tYD48dqUl/3x+EB709G
	rud+ZsJ3LFKLs4XHe3kTn8u4+qjtk0KtyTW7tS8iCJ7RkHM=
X-Google-Smtp-Source: AKy350Y5maXEcdCHTP7gAGNKQsamvdsICAASSBlzFi8qmpqvGVTHVS/eJLQvWAwL5NJqxmTWX6lo73e6HT8/NKjktSo=
X-Received: by 2002:a05:6870:1215:b0:17e:915c:84a2 with SMTP id
 21-20020a056870121500b0017e915c84a2mr4884318oan.4.1679988153893; Tue, 28 Mar
 2023 00:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230328064248.4049456-1-xiangyu.chen@eng.windriver.com> <20230328064248.4049456-2-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230328064248.4049456-2-xiangyu.chen@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Mar 2023 00:22:07 -0700
Message-ID: <CAMKF1spGf+sSjwSoHRYr6c1XGEsWAHkww+Ew9G87iPu8+NyP7A@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v2 1/2] protobuf: upgrade 3.21.12 -> 4.22.2
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 07:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101801

it stil fails

Summary: 2 tasks failed:
  virtual:native:/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipe=
s-devtools/protobuf/protobuf-c_1.4.1.bb:do_compile
  /mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-connectivity/=
mosh/mosh_1.4.0.bb:do_configure
Summary: There were 4 ERROR messages, returning a non-zero exit code.

On Mon, Mar 27, 2023 at 11:43=E2=80=AFPM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
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
> index 343933033..0c6b446dc 100644
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
> +       sed -e 's|Cflags:|Cflags: -I${WORKDIR}/recipe-sysroot-native${inc=
ludedir} |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
>         sed -e 's|Libs:|Libs: -L${B}|' -i "${B}/${TEST_SRC_DIR}/protobuf.=
pc"
> +       sed -e 's|Libs:|Libs: -L${WORKDIR}/recipe-sysroot-native/usr/lib|=
' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
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

