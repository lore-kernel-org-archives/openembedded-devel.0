Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3641C28B30
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 05:16:25 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.15407.1742966179465988590
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 22:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M1o2otvC;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3f6a92f234dso3631662b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 22:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742966178; x=1743570978; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx8o0kW/yM0o7Iozpj55JHFFutyq49khsScdNemwYn0=;
        b=M1o2otvCgTEU9tpvH2XMbjW7s4SN3wcAeRW7cS3YeMbW4RF722Fw0ULIvCAJ46LUnE
         0tcK/pox/2LVERlXCAmJsB+bCrC5O5X+kcZ9tmTWXPR/wD2XtKtj8uJ6ipoxWpp76gem
         4d5BVz/ibo1G4WvcHXyZ8LX+jdK0AfisgtC7Oa6ywCSNNABih8IS2oV296oFUox2j5ZU
         wh8QzigxrPqkrQ9+WBWSs41iZvbMdxIJstZHOkSy7mhTaOpwJKGrcAMbM6GLsWERgkkV
         wFM8V0a2eZCAu6AtEbXCQXjj4sVG80tdoiMpBp+fmSrJ+78DVYRqBRZWAdG/G8O0VNJl
         Otyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742966178; x=1743570978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tx8o0kW/yM0o7Iozpj55JHFFutyq49khsScdNemwYn0=;
        b=bEffYESRhGsVqR0XXX0JPr811Y8FUMDWF1o+wTn6H/HgfY3LT3AtNuBdprddbaK7GN
         vJYj0QnXm+YXSqBjyFLW8ZgMmmly+yY/4JNVPYDVKslJpNLmBXSYQQ75IBLJMXav03MP
         TzBhctSuf3NCntFMzRtPL4lZeEA1DQnduCSYGMU8OE8OvRsu10S3VBs/N8rJZLm5A3js
         NPgtbF+qzTvx0TpRNh/1qazvwC97FABHxCUrsoXBazNGOY9k42Z4ybq/nvMY+K1ZB4zk
         lQvbHXNa73iNlF4o1u9jhYl9Cejjvi3bw/81s+X1pcmWIyGTfe2+WeXRUEXMj5yF6+Re
         SnrA==
X-Gm-Message-State: AOJu0YyvF9DM+UdMid7PBpupJ1uAV9UIcEqDqgh+vvxNOd5EbgoRhCL4
	hTrXlpHQrhVHm1jNaE4l0SIDwkzWOPFTiO1jf8a7BzAuxJGMDO0atpjSgCed0Z5EJZPEkSuQ+6D
	f2s+AYotmMtBg9cnYO27HJfVxUd8=
X-Gm-Gg: ASbGnct0eUrMgJncVFNQ/ZrxkCwZV+sovzh73wD7K/TQycMiDDMm10PGfepQe2fQA2j
	HGNSAoIl4PFUKnDs0hMLLSF9ihk+TqYusQre4CjrDBOn/58kEKBVoKTtf6sEL3pTrk2zaoUhSOg
	tdtg6NTTxd6fPzB2TSKm91iSrif4W58Rvz+3XsZS4EmC1HkKnxFcynwCCLGv0=
X-Google-Smtp-Source: AGHT+IGVjbyRV2eCQ0bKY4Y8j/S2fXYIQY8AUMIgLWxA6kqt0w4Ty3hV56vnHgrYwtJQZueqnBulj9RI4s/7lzyJtyI=
X-Received: by 2002:a05:6808:1241:b0:3fe:ab15:5ecb with SMTP id
 5614622812f47-3febf71fbd6mr13951444b6e.9.1742966178373; Tue, 25 Mar 2025
 22:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <1742964890-10872-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1742964890-10872-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Mar 2025 22:16:07 -0700
X-Gm-Features: AQ5f1Jpcll4E8N_Vn45K4OK_OpzQt9NCUnwfadu7K_Meq9RS6noG_L6D07FtT7g
Message-ID: <CAMKF1spYMv=Xx817cw8zHkTSAEGRmPaB2UNrGhJQBHoD=t7Sww@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] protobuf: upgrade 5.29.4 -> 6.30.1
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eaebd2063137efe1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 05:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116288

--000000000000eaebd2063137efe1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We have decided to stick to 5.29 series since it is LTS

On Tue, Mar 25, 2025 at 9:55=E2=80=AFPM wangmy via lists.openembedded.org <=
wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> refreshed for 6.30.1
>
> 0001-utf8_range-add-version-marker-to-library-19009.patch
> removed since it's included in 6.30.1
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  8 ++--
>  ...-add-version-marker-to-library-19009.patch | 43 -------------------
>  ...{protobuf_5.29.4.bb =3D> protobuf_6.30.1.bb} |  5 +--
>  3 files changed, 6 insertions(+), 50 deletions(-)
>  delete mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-ma=
rker-to-library-19009.patch
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_5.29.4.bb =3D>
> protobuf_6.30.1.bb} (97%)
>
> diff --git
> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respe=
ct-CXX-LDFLAGS-variables-fix-.patch
> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respe=
ct-CXX-LDFLAGS-variables-fix-.patch
> index 7a8906a9a4..77155af4ee 100644
> ---
> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respe=
ct-CXX-LDFLAGS-variables-fix-.patch
> +++
> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respe=
ct-CXX-LDFLAGS-variables-fix-.patch
> @@ -31,7 +31,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
>  diff --git a/examples/Makefile b/examples/Makefile
> -index f7ee9b116..8cd1359e2 100644
> +index 5290fdb..8cd1359 100644
>  --- a/examples/Makefile
>  +++ b/examples/Makefile
>  @@ -4,6 +4,8 @@
> @@ -47,16 +47,16 @@ index f7ee9b116..8cd1359e2 100644
>
>   add_person_cpp: add_person.cc protoc_middleman
>         pkg-config --cflags protobuf  # fails if protobuf is not installe=
d
> --      c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o add_person_cp=
p
> `pkg-config --cflags --libs protobuf`
> +-      c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config
> --cflags --libs protobuf`
>  +      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc
> addressbook.pb.cc -o add_person_cpp
>
>   list_people_cpp: list_people.cc protoc_middleman
>         pkg-config --cflags protobuf  # fails if protobuf is not installe=
d
> --      c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o
> list_people_cpp `pkg-config --cflags --libs protobuf`
> +-      c++ list_people.cc addressbook.pb.cc -o list_people_cpp
> `pkg-config --cflags --libs protobuf`
>  +      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc
> addressbook.pb.cc -o list_people_cpp
>
>   add_person_dart: add_person.dart protoc_middleman_dart
>
>  --
> -2.25.1
> +2.43.0
>
> diff --git
> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-=
marker-to-library-19009.patch
> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-=
marker-to-library-19009.patch
> deleted file mode 100644
> index e58fdc1d19..0000000000
> ---
> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-=
marker-to-library-19009.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From fd020ef700dbf2d324aecd087b8fcb6ff329feb6 Mon Sep 17 00:00:00 2001
> -From: Jan Engelhardt <jengelh@inai.de>
> -Date: Thu, 21 Nov 2024 11:30:17 -0800
> -Subject: [PATCH] utf8_range: add version marker to library (#19009)
> -
> -Unversioned libraries / libraries without due ABI indicators are not
> allowed in certain Linux distributions because it precludes the concurren=
t
> presence of multiple versions.
> -
> -If you have both /usr/lib/libprotobuf-lite.so.28.3.0 and
> /usr/lib/libprotobuf-lite.so.29.0.0, both of them want libutf8_validity.s=
o,
> but if the ABI is different between utf8_range 28 and utf8_range 29, that=
's
> a problem.
> -
> -Closes #19009
> -
> -COPYBARA_INTEGRATE_REVIEW=3D
> https://github.com/protocolbuffers/protobuf/pull/19009 from
> jengelh:master 1a5f8682be2f2b84da07fcdd32474baae8088959
> -PiperOrigin-RevId: 698855702
> -
> -Upstream-Status: Backport [
> https://github.com/protocolbuffers/protobuf/commit/ced605d0e6a7ad20985375=
b596b2ca6720e07737
> ]
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - third_party/utf8_range/CMakeLists.txt | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/third_party/utf8_range/CMakeLists.txt
> b/third_party/utf8_range/CMakeLists.txt
> -index 4276b97290..e054893c63 100644
> ---- a/third_party/utf8_range/CMakeLists.txt
> -+++ b/third_party/utf8_range/CMakeLists.txt
> -@@ -19,6 +19,15 @@ add_library (utf8_range
> - # A heavier-weight C++ wrapper that supports Abseil.
> - add_library (utf8_validity utf8_validity.cc utf8_range.c)
> -
> -+set_target_properties(utf8_range PROPERTIES
> -+  VERSION ${protobuf_VERSION}
> -+  OUTPUT_NAME ${LIB_PREFIX}utf8_range
> -+)
> -+set_target_properties(utf8_validity PROPERTIES
> -+  VERSION ${protobuf_VERSION}
> -+  OUTPUT_NAME ${LIB_PREFIX}utf8_validity
> -+)
> -+
> - # Load Abseil dependency.
> - if (NOT TARGET absl::strings)
> -   if (NOT ABSL_ROOT_DIR)
> ---
> -2.34.1
> -
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_6.30.1.bb
> similarity index 97%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_6.30.1.bb
> index 30b805e6b1..c3e701b5d3 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.30.1.bb
> @@ -14,13 +14,12 @@ LIC_FILES_CHKSUM =3D " \
>  DEPENDS =3D "zlib abseil-cpp jsoncpp"
>  DEPENDS:append:class-target =3D " protobuf-native"
>
> -SRCREV =3D "1be1c9d0ea6efa2a25bd7b76186844d1669be78a"
> +SRCREV =3D "0d815c5b74281f081c1ee4b431a4d5bbb1615c97"
>
> -SRC_URI =3D "git://
> github.com/protocolbuffers/protobuf.git;branch=3D29.x;protocol=3Dhttps \
> +SRC_URI =3D "git://
> github.com/protocolbuffers/protobuf.git;branch=3D30.x;protocol=3Dhttps \
>             file://run-ptest \
>
> file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
>
> file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch \
> -
>  file://0001-utf8_range-add-version-marker-to-library-19009.patch \
>             "
>  SRC_URI:append:mipsarcho32:toolchain-clang =3D "
> file://0001-Fix-build-on-mips-clang.patch "
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116286):
> https://lists.openembedded.org/g/openembedded-devel/message/116286
> Mute This Topic: https://lists.openembedded.org/mt/111911951/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000eaebd2063137efe1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">We have decided to stick to 5.29 series since it is LTS</=
div><div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Mar 25, 2025 at 9:55=E2=80=AFPM wangmy via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;w=
angmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Wang M=
ingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fu=
jitsu.com</a>&gt;<br>
<br>
0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch<br>
refreshed for 6.30.1<br>
<br>
0001-utf8_range-add-version-marker-to-library-19009.patch<br>
removed since it&#39;s included in 6.30.1<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...e-respect-CXX-LDFLAGS-variables-fix-.patch |=C2=A0 8 ++--<br>
=C2=A0...-add-version-marker-to-library-19009.patch | 43 ------------------=
-<br>
=C2=A0...{<a href=3D"http://protobuf_5.29.4.bb" rel=3D"noreferrer" target=
=3D"_blank">protobuf_5.29.4.bb</a> =3D&gt; <a href=3D"http://protobuf_6.30.=
1.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_6.30.1.bb</a>} |=C2=A0 =
5 +--<br>
=C2=A03 files changed, 6 insertions(+), 50 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-ut=
f8_range-add-version-marker-to-library-19009.patch<br>
=C2=A0rename meta-oe/recipes-devtools/protobuf/{<a href=3D"http://protobuf_=
5.29.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_5.29.4.bb</a> =3D&=
gt; <a href=3D"http://protobuf_6.30.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">protobuf_6.30.1.bb</a>} (97%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makef=
ile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/pro=
tobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.pa=
tch<br>
index 7a8906a9a4..77155af4ee 100644<br>
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-res=
pect-CXX-LDFLAGS-variables-fix-.patch<br>
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-res=
pect-CXX-LDFLAGS-variables-fix-.patch<br>
@@ -31,7 +31,7 @@ Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.ji=
a@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/examples/Makefile b/examples/Makefile<br>
-index f7ee9b116..8cd1359e2 100644<br>
+index 5290fdb..8cd1359 100644<br>
=C2=A0--- a/examples/Makefile<br>
=C2=A0+++ b/examples/Makefile<br>
=C2=A0@@ -4,6 +4,8 @@<br>
@@ -47,16 +47,16 @@ index f7ee9b116..8cd1359e2 100644<br>
<br>
=C2=A0 add_person_cpp: add_person.cc protoc_middleman<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg-config --cflags protobuf=C2=A0 # fails if p=
rotobuf is not installed<br>
--=C2=A0 =C2=A0 =C2=A0 c++ -std=3Dc++14 add_person.cc <a href=3D"http://add=
ressbook.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a> =
-o add_person_cpp `pkg-config --cflags --libs protobuf`<br>
+-=C2=A0 =C2=A0 =C2=A0 c++ add_person.cc <a href=3D"http://addressbook.pb.c=
c" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a> -o add_person=
_cpp `pkg-config --cflags --libs protobuf`<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/pro=
tobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc <a href=3D"http://addr=
essbook.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a> -=
o add_person_cpp<br>
<br>
=C2=A0 list_people_cpp: list_people.cc protoc_middleman<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg-config --cflags protobuf=C2=A0 # fails if p=
rotobuf is not installed<br>
--=C2=A0 =C2=A0 =C2=A0 c++ -std=3Dc++14 list_people.cc <a href=3D"http://ad=
dressbook.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a>=
 -o list_people_cpp `pkg-config --cflags --libs protobuf`<br>
+-=C2=A0 =C2=A0 =C2=A0 c++ list_people.cc <a href=3D"http://addressbook.pb.=
cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a> -o list_peop=
le_cpp `pkg-config --cflags --libs protobuf`<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/pro=
tobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc <a href=3D"http://add=
ressbook.pb.cc" rel=3D"noreferrer" target=3D"_blank">addressbook.pb.cc</a> =
-o list_people_cpp<br>
<br>
=C2=A0 add_person_dart: add_person.dart protoc_middleman_dart<br>
<br>
=C2=A0-- <br>
-2.25.1<br>
+2.43.0<br>
<br>
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add=
-version-marker-to-library-19009.patch b/meta-oe/recipes-devtools/protobuf/=
protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch<br>
deleted file mode 100644<br>
index e58fdc1d19..0000000000<br>
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-versio=
n-marker-to-library-19009.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-From fd020ef700dbf2d324aecd087b8fcb6ff329feb6 Mon Sep 17 00:00:00 2001<br>
-From: Jan Engelhardt &lt;<a href=3D"mailto:jengelh@inai.de" target=3D"_bla=
nk">jengelh@inai.de</a>&gt;<br>
-Date: Thu, 21 Nov 2024 11:30:17 -0800<br>
-Subject: [PATCH] utf8_range: add version marker to library (#19009)<br>
-<br>
-Unversioned libraries / libraries without due ABI indicators are not allow=
ed in certain Linux distributions because it precludes the concurrent prese=
nce of multiple versions.<br>
-<br>
-If you have both /usr/lib/libprotobuf-lite.so.28.3.0 and /usr/lib/libproto=
buf-lite.so.29.0.0, both of them want libutf8_validity.so, but if the ABI i=
s different between utf8_range 28 and utf8_range 29, that&#39;s a problem.<=
br>
-<br>
-Closes #19009<br>
-<br>
-COPYBARA_INTEGRATE_REVIEW=3D<a href=3D"https://github.com/protocolbuffers/=
protobuf/pull/19009" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/protocolbuffers/protobuf/pull/19009</a> from jengelh:master 1a5f8682be2f2=
b84da07fcdd32474baae8088959<br>
-PiperOrigin-RevId: 698855702<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/protocolbuffers/p=
rotobuf/commit/ced605d0e6a7ad20985375b596b2ca6720e07737" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/protocolbuffers/protobuf/commit/ced60=
5d0e6a7ad20985375b596b2ca6720e07737</a>]<br>
-Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
----<br>
- third_party/utf8_range/CMakeLists.txt | 9 +++++++++<br>
- 1 file changed, 9 insertions(+)<br>
-<br>
-diff --git a/third_party/utf8_range/CMakeLists.txt b/third_party/utf8_rang=
e/CMakeLists.txt<br>
-index 4276b97290..e054893c63 100644<br>
---- a/third_party/utf8_range/CMakeLists.txt<br>
-+++ b/third_party/utf8_range/CMakeLists.txt<br>
-@@ -19,6 +19,15 @@ add_library (utf8_range<br>
- # A heavier-weight C++ wrapper that supports Abseil.<br>
- add_library (utf8_validity utf8_validity.cc utf8_range.c)<br>
- <br>
-+set_target_properties(utf8_range PROPERTIES<br>
-+=C2=A0 VERSION ${protobuf_VERSION}<br>
-+=C2=A0 OUTPUT_NAME ${LIB_PREFIX}utf8_range<br>
-+)<br>
-+set_target_properties(utf8_validity PROPERTIES<br>
-+=C2=A0 VERSION ${protobuf_VERSION}<br>
-+=C2=A0 OUTPUT_NAME ${LIB_PREFIX}utf8_validity<br>
-+)<br>
-+<br>
- # Load Abseil dependency.<br>
- if (NOT TARGET absl::strings)<br>
-=C2=A0 =C2=A0if (NOT ABSL_ROOT_DIR)<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_5=
.29.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_5.29.4.bb</a> b/met=
a-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_6.30.1.bb" rel=3D=
"noreferrer" target=3D"_blank">protobuf_6.30.1.bb</a><br>
similarity index 97%<br>
rename from meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_5.=
29.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_5.29.4.bb</a><br>
rename to meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_6.30=
.1.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_6.30.1.bb</a><br>
index 30b805e6b1..c3e701b5d3 100644<br>
--- a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_5.29.4.b=
b" rel=3D"noreferrer" target=3D"_blank">protobuf_5.29.4.bb</a><br>
+++ b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_6.30.1.b=
b" rel=3D"noreferrer" target=3D"_blank">protobuf_6.30.1.bb</a><br>
@@ -14,13 +14,12 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
=C2=A0DEPENDS =3D &quot;zlib abseil-cpp jsoncpp&quot;<br>
=C2=A0DEPENDS:append:class-target =3D &quot; protobuf-native&quot;<br>
<br>
-SRCREV =3D &quot;1be1c9d0ea6efa2a25bd7b76186844d1669be78a&quot;<br>
+SRCREV =3D &quot;0d815c5b74281f081c1ee4b431a4d5bbb1615c97&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/protocolbuffers/proto=
buf.git;branch=3D29.x;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank=
">github.com/protocolbuffers/protobuf.git;branch=3D29.x;protocol=3Dhttps</a=
> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/protocolbuffers/proto=
buf.git;branch=3D30.x;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank=
">github.com/protocolbuffers/protobuf.git;branch=3D30.x;protocol=3Dhttps</a=
> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-examples-Makefile-res=
pect-CXX-LDFLAGS-variables-fix-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-fix-protobuf-native-b=
uild-failure-with-gcc-10.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-utf8_range-add-versio=
n-marker-to-library-19009.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:mipsarcho32:toolchain-clang =3D &quot; file://0001-Fix=
-build-on-mips-clang.patch &quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#116286): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/116286" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/116286</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111911951/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111911951/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000eaebd2063137efe1--

