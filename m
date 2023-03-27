Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4455DC76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 14:50:20 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.36941.1679928613907475229
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 07:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XvnUZVk4;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id k14-20020a9d700e000000b0069faa923e7eso4661817otj.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679928613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/PnM4lVpMBHfUU3yx34fkq+cfcZQQsX14f/zh4kXuA=;
        b=XvnUZVk4YB1NzuufH//t521vMNUFUryt5AVmr8SGNZK/PFAriupue2fk9zIesUJW3Z
         6P8vlvm6gZ3WBLcBpw9jpKEvYZ+rHVCytxFlGEs5E5Gti/JLppLZCFq0ZLxOmLpfUb9x
         caWnACvt45gVEtkweGLaM6/ZM7eKMZVAPi3NQsvreg2zm1Dhv7Kk9kYcuTjwCU6QJB5A
         DcTuS+tcvWN58nIOZHjJC+wjZ/BpOsILthCOvIspzjMz+Ha42FIXPLqY1G0HrnT+0jW4
         HbKVIBirGVL1T2GPFiZ8KpplDVf5EPvd5wYtuP6RZ+613LZEmABOuhvM1VJgx0wkWcTH
         yhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679928613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/PnM4lVpMBHfUU3yx34fkq+cfcZQQsX14f/zh4kXuA=;
        b=4q6R5AwwmT6D0Z9gxk4IZycD7NjAgEw7DTup4GOm8YPQidGVcf+EPb9zZkkb4Cx3Fj
         1uNq4VR3U7rQ7EqApGHzqOFZjL2++ft1xwH2UqSW6ViHU3PchCT2eEyAaLwm6Bu7swrp
         yZmUhuljq5uC271wN6QGMxM0IqO0q7nxCr8o9C94J01yIAnCo+w59b7j4h10Su+VjbC2
         cit6/354AeI+USx3QkBFOY2LmxVHAJzCBSJ5WXodDQMi/0I5bp1l7l+kpjdDxGNRsUAM
         V9cj97EMqNeM0/GmEHsR9Na+WXUliuljz1FEiR+eq6TKLV0AzE8yVa/kCMYTH/NzHoP8
         Hjqw==
X-Gm-Message-State: AO0yUKU1p/yyzDMLFpEUJtmEG5rZ3Z8wzx9lBlvNA6BOKV0lcLBzbMMX
	Mx7jQz+ga0y+wt+vnRFy/47HDAD4CNzw4XJfJCUfGxstzr4=
X-Google-Smtp-Source: AK7set+q0UahPeuiumY3qn2/D/i7/5aIt13Xwq44G4FEpcpFPqVkvpzwt8Je12O1U/3BRrYQk9ezFGMgv91PV6aJK0g=
X-Received: by 2002:a9d:6a5a:0:b0:69f:8fa8:1a4f with SMTP id
 h26-20020a9d6a5a000000b0069f8fa81a4fmr4002155otn.2.1679928612749; Mon, 27 Mar
 2023 07:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230327023728.2125172-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230327023728.2125172-1-xiangyu.chen@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Mar 2023 07:49:46 -0700
Message-ID: <CAMKF1srLT64C4SzAH4KYD3L6K7c3kW=-42NGOPe7QrdV6xttHw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] protobuf: upgrade 3.21.12 -> 4.22.2
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 14:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101784

I am seeing

checking for google/protobuf/compiler/command_line_interface.h... no
configure: error: required protobuf header file not found
NOTE: The following config.log files may provide further information.
NOTE: TOPDIR/build/tmp/work/cortexa72-yoe-linux/protobuf-c/1.4.1-r0/build/c=
onfig.log
ERROR: configure failed

For details see https://errors.yoctoproject.org/Errors/Details/698756/

On Sun, Mar 26, 2023 at 7:37=E2=80=AFPM Xiangyu Chen
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
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101753): https://lists.openembedded.org/g/openembedde=
d-devel/message/101753
> Mute This Topic: https://lists.openembedded.org/mt/97874410/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

