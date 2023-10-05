Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934DEE9370D
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 13:01:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.14598.1696510902944382406
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Oct 2023 06:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kb4QDblP;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32329d935d4so883890f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 06:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696510901; x=1697115701; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYc8MBsgj2CsQFEtoro6vcOolltoNaOXrPX19rrlGDA=;
        b=kb4QDblPhol3QWRMdyxh+5pBzGSuhTDKa3qzpL1mpZ1MIY2Jaozr/E1fofV34ukvwO
         gqGY8rkl5s/lhujZhXZhpL97oDgvWnO+yZj5FDjbA/TfWHwh7jrXTdbXsGtr9Y3w2leG
         TqX0/NwVGZySaN1ZO2ZcpqF5ocx/Vy6CSUl/BNEHk7b+St+vMZKgzjueTk60foZP1M00
         TG6uzWauoz5u5C3vuZtGXIDuZ3sRLoL5k6ITh8KeFgjDjqUYNKEpx/FECPkQNgQyt5Yc
         mJB/19tWgkKr8te1xb/QclMfvf/e1+owsk/tdm/uAmq7FNZx/leTnxZ5BvbF/wTQeRoQ
         QjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696510901; x=1697115701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYc8MBsgj2CsQFEtoro6vcOolltoNaOXrPX19rrlGDA=;
        b=GZYAonzpRC0Svh/x4ro7Ai5PufmaUpNGkP/pu0uYF5YCFt9ik0UZ/OPjBvD/her3Q2
         A3UMqYKtcHO2YJgIlXeaMcdtbGeCuIMwdrpajM1X2a3czQL3F3BFgVQnoD0QpUNON46+
         cQchUzzAU7QZW0Ji1JXoKhaWqo6VYJwGYG54ROSw+N0dP9up2QYTH1j+lSxImcW2GSzS
         tDrS4HvIlRl4JsHoiSGgmBgRtdWAqi5L31wPeBmd+Khy2Cuai13nZrMU2W/P2J36dxel
         mvyCk37K+BfLSmEDXOPhii9xxDw1hN6eC5fvhoB7uKizS5eiSWIvGF+tANo1PKRborpd
         GieA==
X-Gm-Message-State: AOJu0YzjFPGs+9CbR4oWuZVahEMFuFBLfiQwUtEFObkqRWhvi6xkUNBX
	CnaMiLiloqnhtCg/UzA1wgZVhQ3jc41ikZjGIfY=
X-Google-Smtp-Source: AGHT+IGWbH1WHu8RbCwZF/OdaxjG0n7T/jLwQp4fXm69RFA/gXMfxaxef+pfXRzl2ERdfTfH4Zm53okHpc1z1Y4V2u0=
X-Received: by 2002:adf:ed10:0:b0:323:33b1:dc44 with SMTP id
 a16-20020adfed10000000b0032333b1dc44mr4710364wro.0.1696510900913; Thu, 05 Oct
 2023 06:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230927084242.1195772-1-peron.clem@gmail.com> <20230927084242.1195772-2-peron.clem@gmail.com>
In-Reply-To: <20230927084242.1195772-2-peron.clem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 5 Oct 2023 15:01:27 +0200
Message-ID: <CA+chaQdCcx34vW+iWEYQ_X1Ad+5yYyK9btW6G4gZ77f+aBeLog@mail.gmail.com>
Subject: Re: [oe] [PATCH v3 1/9] protobuf: upgrade 3.21.12 -> 4.22.2
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Xiangyu Chen <xiangyu.chen@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000009b4d600606f7b945"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 13:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105355

--0000000000009b4d600606f7b945
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This breaks opencv builds with dnn PACKAGECONFIG is enabled.

opencv is using -std=3Dc++11 and now
recipe-sysroot/usr/include/google/protobuf/stubs/common.h
includes absl/strings/string_view.h which fails with
opencv/4.8.0/recipe-sysroot/usr/include/absl/base/policy_checks.h:79:2:
error: #error "C++ versions less than C++14 are not supported."
   79 | #error "C++ versions less than C++14 are not supported."
      |  ^~~~~

as shown in http://errors.yoctoproject.org/Errors/Details/739306/

Passing
-DOPENCV_SKIP_CMAKE_CXX_STANDARD=3DOFF -DCMAKE_CXX_STANDARD=3D14
in dnn PACKAGECONFIG:
PACKAGECONFIG[dnn] =3D "-DBUILD_opencv_dnn=3DON -DPROTOBUF_UPDATE_FILES=3DO=
N
-DBUILD_PROTOBUF=3DOFF -DOPENCV_SKIP_CMAKE_CXX_STANDARD=3DOFF
-DCMAKE_CXX_STANDARD=3D14,-DBUILD_opencv_dnn=3DOFF,protobuf protobuf-native=
,"

helps with this first part, but then it fails to link with absl:
http://errors.yoctoproject.org/Errors/Details/739308/

At least protobuf isn't upgraded in nanbield branch yet, so it still builds
there.

On Wed, Sep 27, 2023 at 10:42=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.cle=
m@gmail.com> wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  ...efile-respect-CXX-LDFLAGS-variables-fix-.patch | 15 +++++++++------
>  .../{protobuf_3.21.12.bb =3D> protobuf_4.22.2.bb}   | 11 ++++++++---
>  2 files changed, 17 insertions(+), 9 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb =3D>
> protobuf_4.22.2.bb} (86%)
>
> diff --git
> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respe=
ct-CXX-LDFLAGS-variables-fix-.patch
> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respe=
ct-CXX-LDFLAGS-variables-fix-.patch
> index 36c3c597a..7c4bf260e 100644
> ---
> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respe=
ct-CXX-LDFLAGS-variables-fix-.patch
> +++
> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respe=
ct-CXX-LDFLAGS-variables-fix-.patch
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
p
> `pkg-config --cflags --libs protobuf`
> -+      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc
> addressbook.pb.cc -o add_person_cpp
> +-      c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o add_person_cp=
p
> `pkg-config --cflags --libs protobuf`
> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc
> addressbook.pb.cc -o add_person_cpp #$(CXX) -std=3Dc++17 $(PROTOBUF)
> add_person.cc addressbook.pb.cc -o add_person_cpp
>
>   list_people_cpp: list_people.cc protoc_middleman
>         pkg-config --cflags protobuf  # fails if protobuf is not installe=
d
> --      c++ -std=3Dc++11 list_people.cc addressbook.pb.cc -o
> list_people_cpp `pkg-config --cflags --libs protobuf`
> -+      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc
> addressbook.pb.cc -o list_people_cpp
> +-      c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o
> list_people_cpp `pkg-config --cflags --libs protobuf`
> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc
> addressbook.pb.cc -o list_people_cpp #$(CXX) -std=3Dc++17 $(PROTOBUF)
> list_people.cc addressbook.pb.cc -o list_people_cpp
>
>   add_person_dart: add_person.dart protoc_middleman_dart
>
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
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
> -SRC_URI =3D "git://
> github.com/protocolbuffers/protobuf.git;branch=3D21.x;protocol=3Dhttps \
> +SRC_URI =3D "gitsm://
> github.com/protocolbuffers/protobuf.git;branch=3D22.x;protocol=3Dhttps \
>             file://run-ptest \
>
> file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
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
>         sed -e 's|libdir=3D|libdir=3D${PKG_CONFIG_SYSROOT_DIR}|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
>         sed -e 's|Cflags:|Cflags: -I${S}/src|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +       sed -e 's|Cflags:|Cflags: -I${WORKDIR}/recipe-sysroot{includedir}
> |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
>         sed -e 's|Libs:|Libs: -L${B}|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +       sed -e 's|Libs:|Libs: -L${WORKDIR}/recipe-sysroot/usr/lib|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +       sed -e 's|Libs:|Libs: -labsl_log_internal_check_op |' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +       sed -e 's|Libs:|Libs: -labsl_log_internal_message |' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
>         # Until out-of-tree build of examples is supported, we have to us=
e
> this approach
>         sed -e
> 's|../src/google/protobuf/.libs/timestamp.pb.o|${B}/CMakeFiles/libprotobu=
f.dir/src/google/protobuf/timestamp.pb.cc.o|'
> -i "${B}/${TEST_SRC_DIR}/Makefile"
>         export PKG_CONFIG_PATH=3D"${B}/${TEST_SRC_DIR}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105176):
> https://lists.openembedded.org/g/openembedded-devel/message/105176
> Mute This Topic: https://lists.openembedded.org/mt/101613793/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009b4d600606f7b945
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This breaks opencv builds with dnn PACKAGECONFIG is e=
nabled.</div><div><br></div><div>opencv is using=C2=A0-std=3Dc++11 and now<=
/div><div>recipe-sysroot/usr/include/google/protobuf/stubs/common.h<br></di=
v><div>includes=C2=A0absl/strings/string_view.h which fails with<br>opencv/=
4.8.0/recipe-sysroot/usr/include/absl/base/policy_checks.h:79:2: error: #er=
ror &quot;C++ versions less than C++14 are not supported.&quot;<br>=C2=A0 =
=C2=A079 | #error &quot;C++ versions less than C++14 are not supported.&quo=
t;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0^~~~~<br></div><div><br></div><div>as sh=
own in=C2=A0<a href=3D"http://errors.yoctoproject.org/Errors/Details/739306=
/">http://errors.yoctoproject.org/Errors/Details/739306/</a></div><div><br>=
</div><div>Passing</div><div>-DOPENCV_SKIP_CMAKE_CXX_STANDARD=3DOFF -DCMAKE=
_CXX_STANDARD=3D14<br></div><div>in dnn PACKAGECONFIG:</div><div>PACKAGECON=
FIG[dnn] =3D &quot;-DBUILD_opencv_dnn=3DON -DPROTOBUF_UPDATE_FILES=3DON -DB=
UILD_PROTOBUF=3DOFF -DOPENCV_SKIP_CMAKE_CXX_STANDARD=3DOFF -DCMAKE_CXX_STAN=
DARD=3D14,-DBUILD_opencv_dnn=3DOFF,protobuf protobuf-native,&quot;<br></div=
><div><br></div><div>helps with this first part, but then it fails to link =
with absl:</div><div><a href=3D"http://errors.yoctoproject.org/Errors/Detai=
ls/739308/">http://errors.yoctoproject.org/Errors/Details/739308/</a><br></=
div><div><br></div><div>At least protobuf isn&#39;t upgraded in nanbield br=
anch yet, so it still builds there.</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 27, 2023 at 10:42=E2=80=AFAM=
 Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gmail.com">peron.=
clem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">From: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriv=
er.com" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
<br>
Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.co=
m" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gma=
il.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...efile-respect-CXX-LDFLAGS-variables-fix-.patch | 15 +++++++++-----=
-<br>
=C2=A0.../{<a href=3D"http://protobuf_3.21.12.bb" rel=3D"noreferrer" target=
=3D"_blank">protobuf_3.21.12.bb</a> =3D&gt; <a href=3D"http://protobuf_4.22=
.2.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_4.22.2.bb</a>}=C2=A0 =
=C2=A0| 11 ++++++++---<br>
=C2=A02 files changed, 17 insertions(+), 9 deletions(-)<br>
=C2=A0rename meta-oe/recipes-devtools/protobuf/{<a href=3D"http://protobuf_=
3.21.12.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.21.12.bb</a> =
=3D&gt; <a href=3D"http://protobuf_4.22.2.bb" rel=3D"noreferrer" target=3D"=
_blank">protobuf_4.22.2.bb</a>} (86%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makef=
ile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/pro=
tobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.pa=
tch<br>
index 36c3c597a..7c4bf260e 100644<br>
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-res=
pect-CXX-LDFLAGS-variables-fix-.patch<br>
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-res=
pect-CXX-LDFLAGS-variables-fix-.patch<br>
@@ -30,7 +30,7 @@ Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anav=
i@konsulko.com" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/examples/Makefile b/examples/Makefile<br>
-index 1c7ec8d63..85f591231 100644<br>
+index ef7a4ef58..7206e14e1 100644<br>
=C2=A0--- a/examples/Makefile<br>
=C2=A0+++ b/examples/Makefile<br>
=C2=A0@@ -2,6 +2,8 @@<br>
@@ -42,17 +42,20 @@ index 1c7ec8d63..85f591231 100644<br>
=C2=A0 all: cpp java python<br>
<br>
=C2=A0 cpp:=C2=A0 =C2=A0 add_person_cpp=C2=A0 =C2=A0 list_people_cpp<br>
-@@ -40,11 +42,11 @@ protoc_middleman_dart: addressbook.proto<br>
+@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto<br>
<br>
=C2=A0 add_person_cpp: add_person.cc protoc_middleman<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg-config --cflags protobuf=C2=A0 # fails if p=
rotobuf is not installed<br>
--=C2=A0 =C2=A0 =C2=A0 c++ -std=3Dc++11 add_person.cc <a href=3D"http://add=
ressbook.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a> =
-o add_person_cpp `pkg-config --cflags --libs protobuf`<br>
-+=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf=
/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc <a href=3D"http://addressbo=
ok.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a> -o add=
_person_cpp<br>
+-=C2=A0 =C2=A0 =C2=A0 c++ -std=3Dc++14 add_person.cc <a href=3D"http://add=
ressbook.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a> =
-o add_person_cpp `pkg-config --cflags --libs protobuf`<br>
++=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf=
/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc <a href=3D"http://addressbo=
ok.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a> -o add=
_person_cpp #$(CXX) -std=3Dc++17 $(PROTOBUF) add_person.cc <a href=3D"http:=
//addressbook.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc=
</a> -o add_person_cpp<br>
<br>
=C2=A0 list_people_cpp: list_people.cc protoc_middleman<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg-config --cflags protobuf=C2=A0 # fails if p=
rotobuf is not installed<br>
--=C2=A0 =C2=A0 =C2=A0 c++ -std=3Dc++11 list_people.cc <a href=3D"http://ad=
dressbook.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a>=
 -o list_people_cpp `pkg-config --cflags --libs protobuf`<br>
-+=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf=
/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc <a href=3D"http://addressb=
ook.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a> -o li=
st_people_cpp<br>
+-=C2=A0 =C2=A0 =C2=A0 c++ -std=3Dc++14 list_people.cc <a href=3D"http://ad=
dressbook.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a>=
 -o list_people_cpp `pkg-config --cflags --libs protobuf`<br>
++=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf=
/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc <a href=3D"http://addressb=
ook.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a> -o li=
st_people_cpp #$(CXX) -std=3Dc++17 $(PROTOBUF) list_people.cc <a href=3D"ht=
tp://addressbook.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb=
.cc</a> -o list_people_cpp<br>
<br>
=C2=A0 add_person_dart: add_person.dart protoc_middleman_dart<br>
<br>
+--<br>
+2.34.1<br>
+<br>
diff --git a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3=
.21.12.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.21.12.bb</a> b/m=
eta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4.22.2.bb" rel=
=3D"noreferrer" target=3D"_blank">protobuf_4.22.2.bb</a><br>
similarity index 86%<br>
rename from meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.=
21.12.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.21.12.bb</a><br>
rename to meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4.22=
.2.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_4.22.2.bb</a><br>
index d95e1c20f..b97da6ea6 100644<br>
--- a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.21.12.=
bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.21.12.bb</a><br>
+++ b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4.22.2.b=
b" rel=3D"noreferrer" target=3D"_blank">protobuf_4.22.2.bb</a><br>
@@ -7,12 +7,12 @@ SECTION =3D &quot;console/tools&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D37b5762e07f0af8c74ce8=
0a8bda4266b&quot;<br>
<br>
-DEPENDS =3D &quot;zlib&quot;<br>
+DEPENDS =3D &quot;zlib abseil-cpp&quot;<br>
=C2=A0DEPENDS:append:class-target =3D &quot; protobuf-native&quot;<br>
<br>
-SRCREV =3D &quot;f0dc78d7e6e331b8c6bb2d5283e06aa26883ca7c&quot;<br>
+SRCREV =3D &quot;81f89d509d6771dcccb619cbe26ac86cec472582&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/protocolbuffers/proto=
buf.git;branch=3D21.x;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank=
">github.com/protocolbuffers/protobuf.git;branch=3D21.x;protocol=3Dhttps</a=
> \<br>
+SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/protocolbuffers/pro=
tobuf.git;branch=3D22.x;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/protocolbuffers/protobuf.git;branch=3D22.x;protocol=3Dhttps<=
/a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-examples-Makefile-res=
pect-CXX-LDFLAGS-variables-fix-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-linking-error-wit=
h-ld-gold.patch \<br>
@@ -35,6 +35,7 @@ EXTRA_OECMAKE +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0-Dprotobuf_BUILD_LIBPROTOC=3DON \<br>
=C2=A0 =C2=A0 =C2=A0-Dprotobuf_BUILD_TESTS=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-Dprotobuf_BUILD_EXAMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 -Dprotobuf_ABSL_PROVIDER=3D&quot;package&quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0TEST_SRC_DIR =3D &quot;examples&quot;<br>
@@ -52,7 +53,11 @@ do_compile_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${S}/${TEST_SRC_DIR}/Makefile &quot;${B}/${T=
EST_SRC_DIR}/&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s|libdir=3D|libdir=3D${PKG_CONFIG_S=
YSROOT_DIR}|&#39; -i &quot;${B}/${TEST_SRC_DIR}/protobuf.pc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s|Cflags:|Cflags: -I${S}/src|&#39; =
-i &quot;${B}/${TEST_SRC_DIR}/protobuf.pc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s|Cflags:|Cflags: -I${WORKDIR}/reci=
pe-sysroot{includedir} |&#39; -i &quot;${B}/${TEST_SRC_DIR}/protobuf.pc&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s|Libs:|Libs: -L${B}|&#39; -i &quot=
;${B}/${TEST_SRC_DIR}/protobuf.pc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s|Libs:|Libs: -L${WORKDIR}/recipe-s=
ysroot/usr/lib|&#39; -i &quot;${B}/${TEST_SRC_DIR}/protobuf.pc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s|Libs:|Libs: -labsl_log_internal_c=
heck_op |&#39; -i &quot;${B}/${TEST_SRC_DIR}/protobuf.pc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s|Libs:|Libs: -labsl_log_internal_m=
essage |&#39; -i &quot;${B}/${TEST_SRC_DIR}/protobuf.pc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Until out-of-tree build of examples is suppor=
ted, we have to use this approach<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s|../src/google/protobuf/.libs/time=
stamp.pb.o|${B}/CMakeFiles/libprotobuf.dir/src/google/protobuf/timestamp.pb=
.cc.o|&#39; -i &quot;${B}/${TEST_SRC_DIR}/Makefile&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export PKG_CONFIG_PATH=3D&quot;${B}/${TEST_SRC_=
DIR}&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105176): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105176" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105176</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101613793/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101613793/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000009b4d600606f7b945--

