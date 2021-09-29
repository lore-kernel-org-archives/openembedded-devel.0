Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9286C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 13:27:00 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.8716.1632922019590718194
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 06:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=awpdUzpA;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 om12-20020a17090b3a8c00b0019eff43daf5so1960820pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 06:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u9xPdxlVeaFGf4yvU7FcFmIxVVaY0ib5i1AusqEmwps=;
        b=awpdUzpAm2j8ObnOfkbLLW+A8I3SgAOg+gD5Etv+4MLDFVnnO3c1iv/6cv3pQf9RB9
         tOdCG98o5sEzP+vhw4v0uqscMrD1tpXD70jfb0Fbx42XCX1dlRzs6bxEBc8zJHgmB+7S
         RHMuaqnj1IUcOM5AnOD4wktp31CSJPqGBX/4qYfz4RzxTTZ/6PT4ticVHMVJpH9GAt/s
         rtiqBwFpzPt+cE25te2tZMPkDA6NncRBiWjJK+wX0TJa02mEdfZK/4COkUIQTb1iD2W0
         aoaiT31IQFIwlrIGj2GNL+fC+336ulhO4opudUZWIg1h0w6v2RJc0pGrms5p8dESqLUt
         Fq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u9xPdxlVeaFGf4yvU7FcFmIxVVaY0ib5i1AusqEmwps=;
        b=vgBiHepPNgn17RX4Iye+pbMZ0yrkzSJf5rympN5GqAiI07ID9/44L4MzyhALIs2PAa
         EKYjxf9DsDFNCJK6r/FYAibxo7hGpMRQAZ9qwlT/S2shpNYeT/D7xVAfsCmjv5BU+pww
         saPHRAl1V0exQSvx2I0EoyPBLoKkPJ//y4s9IZJ1zQpOGHwtV0kq/JxwW2PXJ3GmbbOi
         3cqmdHQtiyBDD65fb+NdylD2da0QD5cMuiSQG4Ew4yW8rxOeGQcp8Z997gMTqICs6Ore
         XwD3c63RcCgyi2FFuZZYK5pbiPGQsxf6ri8wcxHNp1XuLe+zA6H6exGJGVqZztYNFLAP
         PKQQ==
X-Gm-Message-State: AOAM532DuZJhNXxoSiU7msnRaIDMKNYvzBm6oR+Z8ZEUmWeNSAgH9N8w
	3PbWEyhm4NUDFlsHz+IGcbv6f6tnd+r3hqMm+hU=
X-Google-Smtp-Source: 
 ABdhPJyiR5qQ1YBZOFAO2+go0C50ykhiavTaaYA6jsNrQDbhXl5VOe1yO6FPl72Np9yTDMDFqXj0Dncxbe3tKG3VYI0=
X-Received: by 2002:a17:90a:c695:: with SMTP id
 n21mr5417142pjt.183.1632922018975;
 Wed, 29 Sep 2021 06:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <1632407510-15664-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1632407510-15664-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Sep 2021 15:26:48 +0200
Message-ID: 
 <CA+chaQd=SMxM__MgS2fSEHo4-QHLo5ECikYuc1srRzbT4_hTxg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] protobuf: upgrade 3.17.3 -> 3.18.0
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e3120205cd224839"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Sep 2021 13:27:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93169

--000000000000e3120205cd224839
Content-Type: text/plain; charset="UTF-8"

FYI: this breaks opencv build, I'll send fix shortly.


On Thu, Sep 23, 2021 at 7:32 AM zhengruoqin <zhengrq.fnst@fujitsu.com>
wrote:

> C++
> Fix warnings raised by clang 11 (#8664)
> Make StringPiece constructible from std::string_view (#8707)
> Add missing capability attributes for LLVM 12 (#8714)
> Stop using std::iterator (deprecated in C++17). (#8741)
> Move field_access_listener from libprotobuf-lite to libprotobuf (#8775)
> Fix #7047 Safely handle setlocale (#8735)
> Remove deprecated version of SetTotalBytesLimit() (#8794)
> Support arena allocation of google::protobuf::AnyMetadata (#8758)
> Fix undefined symbol error around SharedCtor() (#8827)
> Fix default value of enum(int) in json_util with proto2 (#8835)
> Better Smaller ByteSizeLong
> Introduce event filters for inject_field_listener_events
> Reduce memory usage of DescriptorPool
> For lazy fields copy serialized form when allowed.
> Re-introduce the InlinedStringField class
> v2 access listener
> Reduce padding in the proto's ExtensionRegistry map.
> GetExtension performance optimizations
> Make tracker a static variable rather than call static functions
> Support extensions in field access listener
> Annotate MergeFrom for field access listener
> Fix incomplete types for field access listener
> Add map_entry/new_map_entry to SpecificField in MessageDifferencer. They
> record the map items which are different in MessageDifferencer's reporter.
> Reduce binary size due to fieldless proto messages
> TextFormat: ParseInfoTree supports getting field end location in addition
> to
> start.
> Fix repeated enum extension size in field listener
> Enable Any Text Expansion for Descriptors::DebugString()
> Switch from int{8,16,32,64} to int{8,16,32,64}_t
> Java
> Fix errorprone conflict (#8723)
> Removing deprecated TimeUtil class. (#8749)
> Optimized FieldDescriptor.valueOf() to avoid array copying.
> Removing deprecated TimeUtil class.
> Add Durations.parseUnchecked(String) and Timestamps.parseUnchecked(String)
> FieldMaskUtil: Add convenience method to mask the fields out of a given
> proto.
> JavaScript
> Optimize binary parsing of repeated float64
> Fix for optimization when reading doubles from binary wire format
> Replace toArray implementation with toJSON.
> PHP
> Migrate PHP & Ruby to ABSL wyhash (#8854)
> Added support for PHP 8.1 (currently in RC1) to the C extension (#8964)
> Fixed PHP SEGV when constructing messages from a destructor. (#8969)
> Ruby
> Move DSL implementation from C to pure Ruby (#8850)
> Fixed a memory bug with RepeatedField#+. (#8970)
> Python
> Drops support for 2.7 and 3.5.
> Other
> [csharp] ByteString.CreateCodedInput should use ArraySegment offset and
> count (#8740)
> [ObjC] Add support for using the proto package to prefix symbols. (#8760)
> field_presence.md: fix Go example (#8788)
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  ...am-include-descriptor.cc-when-building-libp.patch | 12 +++++++-----
>  .../{protobuf_3.17.3.bb => protobuf_3.18.0.bb}       |  6 +++---
>  2 files changed, 10 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.17.3.bb =>
> protobuf_3.18.0.bb} (95%)
>
> diff --git
> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
> index fc7286122c..bd3a277a3d 100644
> ---
> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
> +++
> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
> @@ -1,7 +1,8 @@
> -From 321709837f412e2f590e36e3fe33571bb40036a7 Mon Sep 17 00:00:00 2001
> +From 8515ceec5ba3e2fcdbc819b5bf10fe742d7c9d5d Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Thu, 27 Jun 2019 13:27:18 +0000
> -Subject: [PATCH] Makefile.am: include descriptor.pb.cc when building
> libprotoc.so
> +Subject: [PATCH] Makefile.am: include descriptor.pb.cc when building
> + libprotoc.so
>
>  * otherwise plugin.pb.o has undefined symbol
> scc_info_FileDescriptorProto_google_2fprotobuf_2fdescriptor_2eproto
>    and build with gold fails with:
> @@ -10,19 +11,20 @@ Subject: [PATCH] Makefile.am: include descriptor.pb.cc
> when building libprotoc.s
>
>  Upstream-Status: Pending
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
>  ---
>   src/Makefile.am | 1 +
>   1 file changed, 1 insertion(+)
>
>  diff --git a/src/Makefile.am b/src/Makefile.am
> -index be18ba761..57e3daec1 100644
> +index d4f11ce79..96d911746 100644
>  --- a/src/Makefile.am
>  +++ b/src/Makefile.am
> -@@ -313,6 +313,7 @@ libprotoc_la_LDFLAGS +=
> -Wl,--version-script=$(srcdir)/libprotoc.map
> +@@ -323,6 +323,7 @@ libprotoc_la_LDFLAGS +=
> -Wl,--version-script=$(srcdir)/libprotoc.map
>   EXTRA_libprotoc_la_DEPENDENCIES = libprotoc.map
>   endif
>   libprotoc_la_SOURCES =                                         \
>  +  google/protobuf/descriptor.pb.cc                             \
>     google/protobuf/compiler/code_generator.cc                   \
>     google/protobuf/compiler/command_line_interface.cc           \
> -   google/protobuf/compiler/plugin.cc                           \
> +   google/protobuf/compiler/cpp/cpp_enum.cc                     \
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.17.3.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
> similarity index 95%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.17.3.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
> index 4de2c93d40..9f501124a0 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.17.3.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
> @@ -10,14 +10,14 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
>  DEPENDS = "zlib"
>  DEPENDS:append:class-target = " protobuf-native"
>
> -SRCREV = "909a0f36a10075c4b4bc70fdee2c7e32dd612a72"
> +SRCREV = "89b14b1d16eba4d44af43256fc45b24a6a348557"
>
> -SRC_URI = "git://github.com/protocolbuffers/protobuf.git \
> +SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.18.x \
>             file://run-ptest \
>             file://0001-protobuf-fix-configure-error.patch \
>
> file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
>
> file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
> -"
> +           "
>  S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep pkgconfig ptest
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93100):
> https://lists.openembedded.org/g/openembedded-devel/message/93100
> Mute This Topic: https://lists.openembedded.org/mt/85807992/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e3120205cd224839
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FYI: this breaks opencv build, I&#39;ll send fix shortly.<=
div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Sep 23, 2021 at 7:32 AM zhengruoqin &lt;<a href=3D"=
mailto:zhengrq.fnst@fujitsu.com">zhengrq.fnst@fujitsu.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">C++<br>
Fix warnings raised by clang 11 (#8664)<br>
Make StringPiece constructible from std::string_view (#8707)<br>
Add missing capability attributes for LLVM 12 (#8714)<br>
Stop using std::iterator (deprecated in C++17). (#8741)<br>
Move field_access_listener from libprotobuf-lite to libprotobuf (#8775)<br>
Fix #7047 Safely handle setlocale (#8735)<br>
Remove deprecated version of SetTotalBytesLimit() (#8794)<br>
Support arena allocation of google::protobuf::AnyMetadata (#8758)<br>
Fix undefined symbol error around SharedCtor() (#8827)<br>
Fix default value of enum(int) in json_util with proto2 (#8835)<br>
Better Smaller ByteSizeLong<br>
Introduce event filters for inject_field_listener_events<br>
Reduce memory usage of DescriptorPool<br>
For lazy fields copy serialized form when allowed.<br>
Re-introduce the InlinedStringField class<br>
v2 access listener<br>
Reduce padding in the proto&#39;s ExtensionRegistry map.<br>
GetExtension performance optimizations<br>
Make tracker a static variable rather than call static functions<br>
Support extensions in field access listener<br>
Annotate MergeFrom for field access listener<br>
Fix incomplete types for field access listener<br>
Add map_entry/new_map_entry to SpecificField in MessageDifferencer. They<br=
>
record the map items which are different in MessageDifferencer&#39;s report=
er.<br>
Reduce binary size due to fieldless proto messages<br>
TextFormat: ParseInfoTree supports getting field end location in addition t=
o<br>
start.<br>
Fix repeated enum extension size in field listener<br>
Enable Any Text Expansion for Descriptors::DebugString()<br>
Switch from int{8,16,32,64} to int{8,16,32,64}_t<br>
Java<br>
Fix errorprone conflict (#8723)<br>
Removing deprecated TimeUtil class. (#8749)<br>
Optimized FieldDescriptor.valueOf() to avoid array copying.<br>
Removing deprecated TimeUtil class.<br>
Add Durations.parseUnchecked(String) and Timestamps.parseUnchecked(String)<=
br>
FieldMaskUtil: Add convenience method to mask the fields out of a given pro=
to.<br>
JavaScript<br>
Optimize binary parsing of repeated float64<br>
Fix for optimization when reading doubles from binary wire format<br>
Replace toArray implementation with toJSON.<br>
PHP<br>
Migrate PHP &amp; Ruby to ABSL wyhash (#8854)<br>
Added support for PHP 8.1 (currently in RC1) to the C extension (#8964)<br>
Fixed PHP SEGV when constructing messages from a destructor. (#8969)<br>
Ruby<br>
Move DSL implementation from C to pure Ruby (#8850)<br>
Fixed a memory bug with RepeatedField#+. (#8970)<br>
Python<br>
Drops support for 2.7 and 3.5.<br>
Other<br>
[csharp] ByteString.CreateCodedInput should use ArraySegment offset and cou=
nt (#8740)<br>
[ObjC] Add support for using the proto package to prefix symbols. (#8760)<b=
r>
field_presence.md: fix Go example (#8788)<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.com"=
 target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...am-include-descriptor.cc-when-building-libp.patch | 12 +++++++----=
-<br>
=C2=A0.../{<a href=3D"http://protobuf_3.17.3.bb" rel=3D"noreferrer" target=
=3D"_blank">protobuf_3.17.3.bb</a> =3D&gt; <a href=3D"http://protobuf_3.18.=
0.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.18.0.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
=C2=A02 files changed, 10 insertions(+), 8 deletions(-)<br>
=C2=A0rename meta-oe/recipes-devtools/protobuf/{<a href=3D"http://protobuf_=
3.17.3.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.17.3.bb</a> =3D&=
gt; <a href=3D"http://protobuf_3.18.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">protobuf_3.18.0.bb</a>} (95%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-in=
clude-descriptor.cc-when-building-libp.patch b/meta-oe/recipes-devtools/pro=
tobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.pa=
tch<br>
index fc7286122c..bd3a277a3d 100644<br>
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-d=
escriptor.cc-when-building-libp.patch<br>
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-d=
escriptor.cc-when-building-libp.patch<br>
@@ -1,7 +1,8 @@<br>
-From 321709837f412e2f590e36e3fe33571bb40036a7 Mon Sep 17 00:00:00 2001<br>
+From 8515ceec5ba3e2fcdbc819b5bf10fe742d7c9d5d Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 27 Jun 2019 13:27:18 +0000<br>
-Subject: [PATCH] Makefile.am: include <a href=3D"http://descriptor.pb.cc" =
rel=3D"noreferrer" target=3D"_blank">descriptor.pb.cc</a> when building lib=
protoc.so<br>
+Subject: [PATCH] Makefile.am: include <a href=3D"http://descriptor.pb.cc" =
rel=3D"noreferrer" target=3D"_blank">descriptor.pb.cc</a> when building<br>
+ libprotoc.so<br>
<br>
=C2=A0* otherwise plugin.pb.o has undefined symbol scc_info_FileDescriptorP=
roto_google_2fprotobuf_2fdescriptor_2eproto<br>
=C2=A0 =C2=A0and build with gold fails with:<br>
@@ -10,19 +11,20 @@ Subject: [PATCH] Makefile.am: include <a href=3D"http:/=
/descriptor.pb.cc" rel=3D"noreferrer" target=3D"_blank">descriptor.pb.cc</a=
> when building libprotoc.s<br>
<br>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 src/Makefile.am | 1 +<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
=C2=A0diff --git a/src/Makefile.am b/src/Makefile.am<br>
-index be18ba761..57e3daec1 100644<br>
+index d4f11ce79..96d911746 100644<br>
=C2=A0--- a/src/Makefile.am<br>
=C2=A0+++ b/src/Makefile.am<br>
-@@ -313,6 +313,7 @@ libprotoc_la_LDFLAGS +=3D -Wl,--version-script=3D$(src=
dir)/libprotoc.map<br>
+@@ -323,6 +323,7 @@ libprotoc_la_LDFLAGS +=3D -Wl,--version-script=3D$(src=
dir)/libprotoc.map<br>
=C2=A0 EXTRA_libprotoc_la_DEPENDENCIES =3D libprotoc.map<br>
=C2=A0 endif<br>
=C2=A0 libprotoc_la_SOURCES =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0+=C2=A0 google/protobuf/<a href=3D"http://descriptor.pb.cc" rel=3D"no=
referrer" target=3D"_blank">descriptor.pb.cc</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
=C2=A0 =C2=A0 google/protobuf/compiler/code_generator.cc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 google/protobuf/compiler/command_line_interface.cc=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0google/protobuf/compiler/plugin.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0google/protobuf/compiler/cpp/cpp_enum.cc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
diff --git a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3=
.17.3.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.17.3.bb</a> b/met=
a-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.18.0.bb" rel=3D=
"noreferrer" target=3D"_blank">protobuf_3.18.0.bb</a><br>
similarity index 95%<br>
rename from meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.=
17.3.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.17.3.bb</a><br>
rename to meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.18=
.0.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.18.0.bb</a><br>
index 4de2c93d40..9f501124a0 100644<br>
--- a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.17.3.b=
b" rel=3D"noreferrer" target=3D"_blank">protobuf_3.17.3.bb</a><br>
+++ b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.18.0.b=
b" rel=3D"noreferrer" target=3D"_blank">protobuf_3.18.0.bb</a><br>
@@ -10,14 +10,14 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D37b5762=
e07f0af8c74ce80a8bda4266b&quot;<br>
=C2=A0DEPENDS =3D &quot;zlib&quot;<br>
=C2=A0DEPENDS:append:class-target =3D &quot; protobuf-native&quot;<br>
<br>
-SRCREV =3D &quot;909a0f36a10075c4b4bc70fdee2c7e32dd612a72&quot;<br>
+SRCREV =3D &quot;89b14b1d16eba4d44af43256fc45b24a6a348557&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/protocolbuffers/proto=
buf.git" rel=3D"noreferrer" target=3D"_blank">github.com/protocolbuffers/pr=
otobuf.git</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/protocolbuffers/proto=
buf.git;branch=3D3.18.x" rel=3D"noreferrer" target=3D"_blank">github.com/pr=
otocolbuffers/protobuf.git;branch=3D3.18.x</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-protobuf-fix-configur=
e-error.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile.am-include-d=
escriptor.cc-when-building-libp.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-examples-Makefile-res=
pect-CXX-LDFLAGS-variables-fix-.patch \<br>
-&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit autotools-brokensep pkgconfig ptest<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93100): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93100" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93100</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85807992/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85807992/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e3120205cd224839--

