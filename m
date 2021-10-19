Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD810C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:17:49 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.11205.1634656668614677179
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wvc4T2tt;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so105328pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0T4JOxfWeWPmH6nMdk0tZE1BtS+21ysb/2XR7FNw00Q=;
        b=Wvc4T2ttrD9clQMaDLTR+SL6roJ//ngXT4cuOVXQ9rylcbbFtjBguhdFYdU6vKllTb
         z2JxBtW9duluLGF1kZj86VBTPIMCs5M/FF81lxLKbM9xQdX3P5lSd2WxiwBwE2Y8uNYp
         eKAEg/Yr0gTsqGpOhFyYdjvesCSRi2PF2wPUJpk+o+YbgjtwESiAfVB3KMNFTwAWJ0Xw
         zK4WPJriySPFIR9WOmq1x03E5WOQUHawfqEKwNUTqn7mFjkfwUcYmdbh7NOPe2lE4bgS
         g7OEokIPO4G49F1L3xlTdgF7bctmf1AurakaIVxDEyx8ZSbFTBM528TfEH/yQ8PiQhle
         1zeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0T4JOxfWeWPmH6nMdk0tZE1BtS+21ysb/2XR7FNw00Q=;
        b=gXDuPAJkicX7+FRmEPZnJp4FNPeMezDD55Cxwn0QzSPfHc2p0RlBnUMN2r6d9XThDe
         LslG8rUpbM+DPVYA5BgGBhoQru3ruynZ08rXvOxo+hamsWgPBdpD38y8p45RWACv1aIU
         KnD9ljSZEE635//JCkeM42D4NOCbi5gcoOTEkZUGrhpKlRpVU+G6Hmc0jhRIO9/kqMBr
         QjSfh+EI5jBv86Ip/ZpAesRpZGFadeRN+C0eFg6wqQp2YBVhh2OM92g9QldCS5wdVNn8
         aXw7XYu+UxBk3lFiScuB4dRkwax7oAzivLyJxyOjtrsMYNr7kR4fkaVuC4CLIZnkbNeo
         Rs4Q==
X-Gm-Message-State: AOAM533ARQhM5AuRPnVFX9pUqvcvTMzRXRRBxntUOEbtY6c6GnJI2EFR
	j8M9oGDx+VUwvKR4QKlOdLq1lzfU0wqCwXq01iE=
X-Google-Smtp-Source: 
 ABdhPJwjmRCADMTtv+uDtWHNdm68R/SGtKXxH8f0MmsKRobIRNJte0r3gbm1J0PxYVBXOd5q5YNqshYHFPxWnNQQ7xo=
X-Received: by 2002:a17:902:6808:b0:13e:a85b:52bd with SMTP id
 h8-20020a170902680800b0013ea85b52bdmr33351135plk.76.1634656667973; Tue, 19
 Oct 2021 08:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211012180342.108190-1-uvv.mail@gmail.com>
 <16AF744F6E9A19A7.27463@lists.openembedded.org>
In-Reply-To: <16AF744F6E9A19A7.27463@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Oct 2021 17:17:37 +0200
Message-ID: 
 <CA+chaQeZRLQc_ZbrS_A2Juy=GqRQ7BWWLjChUvxUaSaWF1wxGA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] grpc: upgrade 1.38.1 -> 1.41.0
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000063d5505ceb62a29"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 15:17:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93468

--000000000000063d5505ceb62a29
Content-Type: text/plain; charset="UTF-8"

Looks like the https://github.com/grpc/grpc/pull/25681 is the root cause,
it's also reproducible with sysdig recipe in meta-oe.

I'll send revert of this commit.

On Tue, Oct 19, 2021 at 4:17 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> With this upgrade I see 2 recipes failing with:
>
> /usr/include/grpcpp/impl/codegen/completion_queue.h:119: error: undefined
> reference to 'absl::lts_20210324::Mutex::~Mutex()'
> CMakeFiles/googleAssistant_sample.dir/src/googleAssistant.cpp.o:googleAssistant.cpp:function
> non-virtual thunk to
> grpc::ClientReaderWriter<google::assistant::embedded::v1alpha2::AssistRequest,
> google::assistant::embedded::v1alpha2::AssistResponse>::~ClientReaderWriter():
> error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> /usr/include/grpcpp/impl/codegen/completion_queue.h:119: error: undefined
> reference to 'absl::lts_20210324::Mutex::~Mutex()'
> /usr/include/grpcpp/impl/codegen/grpc_library.h:57: error: undefined
> reference to 'absl::lts_20210324::Mutex::~Mutex()'
> /usr/include/absl/synchronization/mutex.h:526: error: undefined reference
> to 'absl::lts_20210324::Mutex::Lock()'
> /usr/include/absl/synchronization/mutex.h:543: error: undefined reference
> to 'absl::lts_20210324::Mutex::Unlock()'
> /usr/include/absl/synchronization/mutex.h:543: error: undefined reference
> to 'absl::lts_20210324::Mutex::Unlock()'
> /usr/include/absl/synchronization/mutex.h:526: error: undefined reference
> to 'absl::lts_20210324::Mutex::Lock()'
> /usr/include/absl/synchronization/mutex.h:543: error: undefined reference
> to 'absl::lts_20210324::Mutex::Unlock()'
> /usr/include/absl/synchronization/mutex.h:543: error: undefined reference
> to 'absl::lts_20210324::Mutex::Unlock()'
> /usr/include/absl/synchronization/mutex.h:526: error: undefined reference
> to 'absl::lts_20210324::Mutex::Lock()'
> /usr/include/absl/synchronization/mutex.h:526: error: undefined reference
> to 'absl::lts_20210324::Mutex::Lock()'
> collect2: error: ld returned 1 exit status
>
> and other with:
>
> /usr/include/grpcpp/impl/codegen/completion_queue.h:119: error: undefined
> reference to 'absl::lts_20210324::Mutex::~Mutex()'
> /usr/include/grpcpp/impl/codegen/completion_queue.h:253: error: undefined
> reference to 'absl::lts_20210324::Mutex::~Mutex()'
> /usr/include/grpcpp/impl/codegen/completion_queue.h:119: error: undefined
> reference to 'absl::lts_20210324::Mutex::~Mutex()'
> /usr/include/grpcpp/impl/codegen/completion_queue.h:119: error: undefined
> reference to 'absl::lts_20210324::Mutex::~Mutex()'
> collect2: error: ld returned 1 exit status
>
> anyone else seeing this (before I start checking which grpc change caused
> this)? I'm also using gold instead of bfd
>
> On Tue, Oct 12, 2021 at 8:04 PM Vyacheslav Yurkov <uvv.mail@gmail.com>
> wrote:
>
>> Drop the patch that fixes cross compilation, because it's already in
>> 1.41.0. Add the patch for regression fix [1], which should be dropped on
>> the recipe upgrade.
>>
>> [1] https://github.com/grpc/grpc/issues/26857
>>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
>>  ...8fb0ee826e73323e06ac6166ac038ee71f6a.patch | 107 ++++++++++++++++++
>>  ...compilation-with-gRPC_BUILD_GRPC_CPP.patch |  55 ---------
>>  .../grpc/{grpc_1.38.1.bb => grpc_1.41.0.bb}   |   6 +-
>>  3 files changed, 110 insertions(+), 58 deletions(-)
>>  create mode 100644
>> meta-oe/recipes-devtools/grpc/grpc/0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch
>>  delete mode 100644
>> meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch
>>  rename meta-oe/recipes-devtools/grpc/{grpc_1.38.1.bb => grpc_1.41.0.bb}
>> (95%)
>>
>> diff --git
>> a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch
>> b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch
>> new file mode 100644
>> index 000000000..d9cfa009f
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch
>> @@ -0,0 +1,107 @@
>> +From 50d54458324c1a19eefb9968e4cb556dbd34b875 Mon Sep 17 00:00:00 2001
>> +From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> +Date: Tue, 12 Oct 2021 19:11:40 +0200
>> +Subject: [PATCH] cmake: revert db88fb0ee826e73323e06ac6166ac038ee71f6a
>> + (#27626)
>> +
>> +Fix regression introduced by previous commit. Original problem that
>> +commit was trying to fix was solved by modification of grpc recipe in
>> +meta-openembedded project repository
>> +
>> +Fixes #26857
>> +
>> +Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> +---
>> + CMakeLists.txt                    | 16 ++++++++--------
>> + templates/CMakeLists.txt.template |  2 --
>> + 2 files changed, 8 insertions(+), 10 deletions(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index 0e8fbdee8b..02cd48bee4 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -3828,7 +3828,7 @@ foreach(_hdr
>> + endforeach()
>> +
>> +
>> +-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
>> ++if(gRPC_INSTALL)
>> +   install(TARGETS grpc_plugin_support EXPORT gRPCTargets
>> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> +@@ -11679,7 +11679,7 @@ target_link_libraries(grpc_cpp_plugin
>> +
>> +
>> +
>> +-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
>> ++if(gRPC_INSTALL)
>> +   install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
>> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> +@@ -11718,7 +11718,7 @@ target_link_libraries(grpc_csharp_plugin
>> +
>> +
>> +
>> +-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
>> ++if(gRPC_INSTALL)
>> +   install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets
>> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> +@@ -11757,7 +11757,7 @@ target_link_libraries(grpc_node_plugin
>> +
>> +
>> +
>> +-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
>> ++if(gRPC_INSTALL)
>> +   install(TARGETS grpc_node_plugin EXPORT gRPCTargets
>> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> +@@ -11796,7 +11796,7 @@ target_link_libraries(grpc_objective_c_plugin
>> +
>> +
>> +
>> +-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
>> ++if(gRPC_INSTALL)
>> +   install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets
>> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> +@@ -11835,7 +11835,7 @@ target_link_libraries(grpc_php_plugin
>> +
>> +
>> +
>> +-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
>> ++if(gRPC_INSTALL)
>> +   install(TARGETS grpc_php_plugin EXPORT gRPCTargets
>> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> +@@ -11874,7 +11874,7 @@ target_link_libraries(grpc_python_plugin
>> +
>> +
>> +
>> +-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
>> ++if(gRPC_INSTALL)
>> +   install(TARGETS grpc_python_plugin EXPORT gRPCTargets
>> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> +@@ -11913,7 +11913,7 @@ target_link_libraries(grpc_ruby_plugin
>> +
>> +
>> +
>> +-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
>> ++if(gRPC_INSTALL)
>> +   install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets
>> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> +diff --git a/templates/CMakeLists.txt.template
>> b/templates/CMakeLists.txt.template
>> +index 0f0883e09c..b9a5bc4144 100644
>> +--- a/templates/CMakeLists.txt.template
>> ++++ b/templates/CMakeLists.txt.template
>> +@@ -695,8 +695,6 @@
>> +   # grpcpp_channelz doesn't build with protobuf-lite, so no install
>> required
>> +   # See https://github.com/grpc/grpc/issues/22826
>> +   if(gRPC_INSTALL AND NOT gRPC_USE_PROTO_LITE)
>> +-  % elif tgt.build == 'protoc':
>> +-  if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
>> +   % else:
>> +   if(gRPC_INSTALL)
>> +   % endif
>> diff --git
>> a/meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch
>> b/meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch
>> deleted file mode 100644
>> index ce660f5cc..000000000
>> ---
>> a/meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch
>> +++ /dev/null
>> @@ -1,55 +0,0 @@
>> -From 83a66aa45d63d79cbccc47a65998723a7d2d7637 Mon Sep 17 00:00:00 2001
>> -From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>> -Date: Wed, 23 Jun 2021 14:22:59 +0200
>> -Subject: [PATCH] cmake: fix cross-compilation with
>> - gRPC_BUILD_GRPC_CPP_PLUGIN=OFF (#26292)
>> -
>> -* cmake: fix cross-compilation with gRPC_BUILD_GRPC_CPP_PLUGIN=OFF
>> -
>> -When cross-compiling gRPC, a _native_ version of 'grpc_cpp_plugin' is
>> -searched in the environment. For most use cases, a _cross_ version of
>> this
>> -file is not needed and gRPC_BUILD_GRPC_CPP_PLUGIN can be set to OFF.
>> -
>> -However, when cross-building with -DgRPC_BUILD_GRPC_CPP_PLUGIN=OFF, there
>> -are some build errors, for example:
>> -
>> -make[3]: *** No rule to make target 'grpc_cpp_plugin', needed by
>> 'gens/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.cc'.  Stop.
>> -
>> -This is because there is still a hard dependency on 'grpc_cpp_plugin' for
>> -these targets, not taking into account the cross-compilation case.
>> -
>> -Fix by depending on the variable gRPC_CPP_PLUGIN, which is set correctly
>> for
>> -either cross or native case.
>> -
>> -* regenerate projects
>> ----
>> - CMakeLists.txt                    | 2 +-
>> - templates/CMakeLists.txt.template | 2 +-
>> - 2 files changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/CMakeLists.txt b/CMakeLists.txt
>> -index eeaf0b43c7..c60a64917a 100644
>> ---- a/CMakeLists.txt
>> -+++ b/CMakeLists.txt
>> -@@ -319,7 +319,7 @@ function(protobuf_generate_grpc_cpp)
>> -            --plugin=protoc-gen-grpc=${_gRPC_CPP_PLUGIN}
>> -            ${_protobuf_include_path}
>> -            ${REL_FIL}
>> --      DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
>> -+      DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} ${_gRPC_CPP_PLUGIN}
>> -       WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
>> -       COMMENT "Running gRPC C++ protocol buffer compiler on ${FIL}"
>> -       VERBATIM)
>> -diff --git a/templates/CMakeLists.txt.template
>> b/templates/CMakeLists.txt.template
>> -index cef2534cbd..f0afe5108e 100644
>> ---- a/templates/CMakeLists.txt.template
>> -+++ b/templates/CMakeLists.txt.template
>> -@@ -389,7 +389,7 @@
>> -              --plugin=protoc-gen-grpc=<%text>${_gRPC_CPP_PLUGIN}</%text>
>> -              <%text>${_protobuf_include_path}</%text>
>> -              <%text>${REL_FIL}</%text>
>> --        DEPENDS <%text>${ABS_FIL}</%text>
>> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> grpc_cpp_plugin
>> -+        DEPENDS <%text>${ABS_FIL}</%text>
>> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> <%text>${_gRPC_CPP_PLUGIN}</%text>
>> -         WORKING_DIRECTORY <%text>${CMAKE_CURRENT_SOURCE_DIR}</%text>
>> -         COMMENT "Running gRPC C++ protocol buffer compiler on
>> <%text>${FIL}</%text>"
>> -         VERBATIM)
>> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
>> b/meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb
>> similarity index 95%
>> rename from meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
>> rename to meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb
>> index dfb44b819..3385e2ada 100644
>> --- a/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
>> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb
>> @@ -20,10 +20,10 @@ RDEPENDS:${PN}-dev:class_native += "${PN}-compiler"
>>  # RDEPENDS:${PN}-dev += "${PN}-compiler"
>>
>>  S = "${WORKDIR}/git"
>> -SRCREV_grpc = "96b73272eadc01afb5fb45b92b408c47e4387274"
>> -BRANCH = "v1.38.x"
>> +SRCREV_grpc = "fc662b7964384b701af5bd3ce6994d2180080eb4"
>> +BRANCH = "v1.41.x"
>>  SRC_URI = "git://
>> github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH}
>> <http://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=$%7BBRANCH%7D>
>> \
>> -
>>  file://0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch \
>> +
>>  file://0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch \
>>             "
>>  # Fixes build with older compilers 4.8 especially on ubuntu 14.04
>>  CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
>> --
>> 2.28.0
>>
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93465):
> https://lists.openembedded.org/g/openembedded-devel/message/93465
> Mute This Topic: https://lists.openembedded.org/mt/86268966/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000063d5505ceb62a29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like the=C2=A0<a href=3D"https://github.com/grpc/grp=
c/pull/25681" target=3D"_blank">https://github.com/grpc/grpc/pull/25681</a>=
 is the root cause, it&#39;s also reproducible with sysdig recipe in meta-o=
e.<div><br></div><div>I&#39;ll send revert of this commit.</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct=
 19, 2021 at 4:17 PM Martin Jansa via <a href=3D"http://lists.openembedded.=
org" target=3D"_blank">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a hre=
f=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr">With this upgrade I see 2 recipes fai=
ling with:<div><br></div><div>/usr/include/grpcpp/impl/codegen/completion_q=
ueue.h:119: error: undefined reference to &#39;absl::lts_20210324::Mutex::~=
Mutex()&#39;<br>CMakeFiles/googleAssistant_sample.dir/src/googleAssistant.c=
pp.o:googleAssistant.cpp:function non-virtual thunk to grpc::ClientReaderWr=
iter&lt;google::assistant::embedded::v1alpha2::AssistRequest, google::assis=
tant::embedded::v1alpha2::AssistResponse&gt;::~ClientReaderWriter(): error:=
 undefined reference to &#39;absl::lts_20210324::Mutex::~Mutex()&#39;<br>/u=
sr/include/grpcpp/impl/codegen/completion_queue.h:119: error: undefined ref=
erence to &#39;absl::lts_20210324::Mutex::~Mutex()&#39;<br>/usr/include/grp=
cpp/impl/codegen/grpc_library.h:57: error: undefined reference to &#39;absl=
::lts_20210324::Mutex::~Mutex()&#39;<br>/usr/include/absl/synchronization/m=
utex.h:526: error: undefined reference to &#39;absl::lts_20210324::Mutex::L=
ock()&#39;<br>/usr/include/absl/synchronization/mutex.h:543: error: undefin=
ed reference to &#39;absl::lts_20210324::Mutex::Unlock()&#39;<br>/usr/inclu=
de/absl/synchronization/mutex.h:543: error: undefined reference to &#39;abs=
l::lts_20210324::Mutex::Unlock()&#39;<br>/usr/include/absl/synchronization/=
mutex.h:526: error: undefined reference to &#39;absl::lts_20210324::Mutex::=
Lock()&#39;<br>/usr/include/absl/synchronization/mutex.h:543: error: undefi=
ned reference to &#39;absl::lts_20210324::Mutex::Unlock()&#39;<br>/usr/incl=
ude/absl/synchronization/mutex.h:543: error: undefined reference to &#39;ab=
sl::lts_20210324::Mutex::Unlock()&#39;<br>/usr/include/absl/synchronization=
/mutex.h:526: error: undefined reference to &#39;absl::lts_20210324::Mutex:=
:Lock()&#39;<br>/usr/include/absl/synchronization/mutex.h:526: error: undef=
ined reference to &#39;absl::lts_20210324::Mutex::Lock()&#39;<br>collect2: =
error: ld returned 1 exit status<br></div><div><br></div><div>and other wit=
h:</div><div><br></div><div>/usr/include/grpcpp/impl/codegen/completion_que=
ue.h:119: error: undefined reference to &#39;absl::lts_20210324::Mutex::~Mu=
tex()&#39;<br>/usr/include/grpcpp/impl/codegen/completion_queue.h:253: erro=
r: undefined reference to &#39;absl::lts_20210324::Mutex::~Mutex()&#39;<br>=
/usr/include/grpcpp/impl/codegen/completion_queue.h:119: error: undefined r=
eference to &#39;absl::lts_20210324::Mutex::~Mutex()&#39;<br>/usr/include/g=
rpcpp/impl/codegen/completion_queue.h:119: error: undefined reference to &#=
39;absl::lts_20210324::Mutex::~Mutex()&#39;<br>collect2: error: ld returned=
 1 exit status<br></div><div><br></div><div>anyone else seeing this (before=
 I start checking which grpc change caused this)? I&#39;m also using gold i=
nstead of bfd</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Oct 12, 2021 at 8:04 PM Vyacheslav Yurkov &lt;<a=
 href=3D"mailto:uvv.mail@gmail.com" target=3D"_blank">uvv.mail@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Dro=
p the patch that fixes cross compilation, because it&#39;s already in<br>
1.41.0. Add the patch for regression fix [1], which should be dropped on<br=
>
the recipe upgrade.<br>
<br>
[1] <a href=3D"https://github.com/grpc/grpc/issues/26857" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/grpc/grpc/issues/26857</a><br>
<br>
Signed-off-by: Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com" =
target=3D"_blank">uvv.mail@gmail.com</a>&gt;<br>
---<br>
=C2=A0...8fb0ee826e73323e06ac6166ac038ee71f6a.patch | 107 +++++++++++++++++=
+<br>
=C2=A0...compilation-with-gRPC_BUILD_GRPC_CPP.patch |=C2=A0 55 ---------<br=
>
=C2=A0.../grpc/{<a href=3D"http://grpc_1.38.1.bb" rel=3D"noreferrer" target=
=3D"_blank">grpc_1.38.1.bb</a> =3D&gt; <a href=3D"http://grpc_1.41.0.bb" re=
l=3D"noreferrer" target=3D"_blank">grpc_1.41.0.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
=C2=A06 +-<br>
=C2=A03 files changed, 110 insertions(+), 58 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-reve=
rt-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-=
cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch<br>
=C2=A0rename meta-oe/recipes-devtools/grpc/{<a href=3D"http://grpc_1.38.1.b=
b" rel=3D"noreferrer" target=3D"_blank">grpc_1.38.1.bb</a> =3D&gt; <a href=
=3D"http://grpc_1.41.0.bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.41.0=
.bb</a>} (95%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-revert-db88fb0ee=
826e73323e06ac6166ac038ee71f6a.patch b/meta-oe/recipes-devtools/grpc/grpc/0=
001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch<br>
new file mode 100644<br>
index 000000000..d9cfa009f<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-revert-db88fb0ee826e733=
23e06ac6166ac038ee71f6a.patch<br>
@@ -0,0 +1,107 @@<br>
+From 50d54458324c1a19eefb9968e4cb556dbd34b875 Mon Sep 17 00:00:00 2001<br>
+From: Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com" target=
=3D"_blank">uvv.mail@gmail.com</a>&gt;<br>
+Date: Tue, 12 Oct 2021 19:11:40 +0200<br>
+Subject: [PATCH] cmake: revert db88fb0ee826e73323e06ac6166ac038ee71f6a<br>
+ (#27626)<br>
+<br>
+Fix regression introduced by previous commit. Original problem that<br>
+commit was trying to fix was solved by modification of grpc recipe in<br>
+meta-openembedded project repository<br>
+<br>
+Fixes #26857<br>
+<br>
+Signed-off-by: Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com"=
 target=3D"_blank">uvv.mail@gmail.com</a>&gt;<br>
+---<br>
+ CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 16 ++++++++--------<br>
+ templates/CMakeLists.txt.template |=C2=A0 2 --<br>
+ 2 files changed, 8 insertions(+), 10 deletions(-)<br>
+<br>
+diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
+index 0e8fbdee8b..02cd48bee4 100644<br>
+--- a/CMakeLists.txt<br>
++++ b/CMakeLists.txt<br>
+@@ -3828,7 +3828,7 @@ foreach(_hdr<br>
+ endforeach()<br>
+ <br>
+ <br>
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)<br>
++if(gRPC_INSTALL)<br>
+=C2=A0 =C2=A0install(TARGETS grpc_plugin_support EXPORT gRPCTargets<br>
+=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
+=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
+@@ -11679,7 +11679,7 @@ target_link_libraries(grpc_cpp_plugin<br>
+ <br>
+ <br>
+ <br>
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)<br>
++if(gRPC_INSTALL)<br>
+=C2=A0 =C2=A0install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets<br>
+=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
+=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
+@@ -11718,7 +11718,7 @@ target_link_libraries(grpc_csharp_plugin<br>
+ <br>
+ <br>
+ <br>
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)<br>
++if(gRPC_INSTALL)<br>
+=C2=A0 =C2=A0install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets<br>
+=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
+=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
+@@ -11757,7 +11757,7 @@ target_link_libraries(grpc_node_plugin<br>
+ <br>
+ <br>
+ <br>
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)<br>
++if(gRPC_INSTALL)<br>
+=C2=A0 =C2=A0install(TARGETS grpc_node_plugin EXPORT gRPCTargets<br>
+=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
+=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
+@@ -11796,7 +11796,7 @@ target_link_libraries(grpc_objective_c_plugin<br>
+ <br>
+ <br>
+ <br>
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)<br>
++if(gRPC_INSTALL)<br>
+=C2=A0 =C2=A0install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets<br=
>
+=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
+=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
+@@ -11835,7 +11835,7 @@ target_link_libraries(grpc_php_plugin<br>
+ <br>
+ <br>
+ <br>
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)<br>
++if(gRPC_INSTALL)<br>
+=C2=A0 =C2=A0install(TARGETS grpc_php_plugin EXPORT gRPCTargets<br>
+=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
+=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
+@@ -11874,7 +11874,7 @@ target_link_libraries(grpc_python_plugin<br>
+ <br>
+ <br>
+ <br>
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)<br>
++if(gRPC_INSTALL)<br>
+=C2=A0 =C2=A0install(TARGETS grpc_python_plugin EXPORT gRPCTargets<br>
+=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
+=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
+@@ -11913,7 +11913,7 @@ target_link_libraries(grpc_ruby_plugin<br>
+ <br>
+ <br>
+ <br>
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)<br>
++if(gRPC_INSTALL)<br>
+=C2=A0 =C2=A0install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets<br>
+=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
+=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
+diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.=
template<br>
+index 0f0883e09c..b9a5bc4144 100644<br>
+--- a/templates/CMakeLists.txt.template<br>
++++ b/templates/CMakeLists.txt.template<br>
+@@ -695,8 +695,6 @@<br>
+=C2=A0 =C2=A0# grpcpp_channelz doesn&#39;t build with protobuf-lite, so no=
 install required<br>
+=C2=A0 =C2=A0# See <a href=3D"https://github.com/grpc/grpc/issues/22826" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/grpc/grpc/issues/228=
26</a><br>
+=C2=A0 =C2=A0if(gRPC_INSTALL AND NOT gRPC_USE_PROTO_LITE)<br>
+-=C2=A0 % elif tgt.build =3D=3D &#39;protoc&#39;:<br>
+-=C2=A0 if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)<br>
+=C2=A0 =C2=A0% else:<br>
+=C2=A0 =C2=A0if(gRPC_INSTALL)<br>
+=C2=A0 =C2=A0% endif<br>
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compil=
ation-with-gRPC_BUILD_GRPC_CPP.patch b/meta-oe/recipes-devtools/grpc/grpc/0=
002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch<br>
deleted file mode 100644<br>
index ce660f5cc..000000000<br>
--- a/meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-w=
ith-gRPC_BUILD_GRPC_CPP.patch<br>
+++ /dev/null<br>
@@ -1,55 +0,0 @@<br>
-From 83a66aa45d63d79cbccc47a65998723a7d2d7637 Mon Sep 17 00:00:00 2001<br>
-From: Thomas De Schampheleire &lt;<a href=3D"mailto:patrickdepinguin@gmail=
.com" target=3D"_blank">patrickdepinguin@gmail.com</a>&gt;<br>
-Date: Wed, 23 Jun 2021 14:22:59 +0200<br>
-Subject: [PATCH] cmake: fix cross-compilation with<br>
- gRPC_BUILD_GRPC_CPP_PLUGIN=3DOFF (#26292)<br>
-<br>
-* cmake: fix cross-compilation with gRPC_BUILD_GRPC_CPP_PLUGIN=3DOFF<br>
-<br>
-When cross-compiling gRPC, a _native_ version of &#39;grpc_cpp_plugin&#39;=
 is<br>
-searched in the environment. For most use cases, a _cross_ version of this=
<br>
-file is not needed and gRPC_BUILD_GRPC_CPP_PLUGIN can be set to OFF.<br>
-<br>
-However, when cross-building with -DgRPC_BUILD_GRPC_CPP_PLUGIN=3DOFF, ther=
e<br>
-are some build errors, for example:<br>
-<br>
-make[3]: *** No rule to make target &#39;grpc_cpp_plugin&#39;, needed by &=
#39;gens/src/proto/grpc/reflection/v1alpha/<a href=3D"http://reflection.grp=
c.pb.cc" rel=3D"noreferrer" target=3D"_blank">reflection.grpc.pb.cc</a>&#39=
;.=C2=A0 Stop.<br>
-<br>
-This is because there is still a hard dependency on &#39;grpc_cpp_plugin&#=
39; for<br>
-these targets, not taking into account the cross-compilation case.<br>
-<br>
-Fix by depending on the variable gRPC_CPP_PLUGIN, which is set correctly f=
or<br>
-either cross or native case.<br>
-<br>
-* regenerate projects<br>
----<br>
- CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
- templates/CMakeLists.txt.template | 2 +-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index eeaf0b43c7..c60a64917a 100644<br>
---- a/CMakeLists.txt<br>
-+++ b/CMakeLists.txt<br>
-@@ -319,7 +319,7 @@ function(protobuf_generate_grpc_cpp)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --plugin=3Dprotoc-gen-grpc=3D${_=
gRPC_CPP_PLUGIN}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${_protobuf_include_path}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${REL_FIL}<br>
--=C2=A0 =C2=A0 =C2=A0 DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp=
_plugin<br>
-+=C2=A0 =C2=A0 =C2=A0 DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} ${_gRPC_=
CPP_PLUGIN}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0COMMENT &quot;Running gRPC C++ protocol buffer =
compiler on ${FIL}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0VERBATIM)<br>
-diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.=
template<br>
-index cef2534cbd..f0afe5108e 100644<br>
---- a/templates/CMakeLists.txt.template<br>
-+++ b/templates/CMakeLists.txt.template<br>
-@@ -389,7 +389,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --plugin=3Dprotoc-gen-grp=
c=3D&lt;%text&gt;${_gRPC_CPP_PLUGIN}&lt;/%text&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;%text&gt;${_protobuf_=
include_path}&lt;/%text&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;%text&gt;${REL_FIL}&l=
t;/%text&gt;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEPENDS &lt;%text&gt;${ABS_FIL}&lt;/%text&gt;=
 &lt;%text&gt;${_gRPC_PROTOBUF_PROTOC}&lt;/%text&gt; grpc_cpp_plugin<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEPENDS &lt;%text&gt;${ABS_FIL}&lt;/%text&gt;=
 &lt;%text&gt;${_gRPC_PROTOBUF_PROTOC}&lt;/%text&gt; &lt;%text&gt;${_gRPC_C=
PP_PLUGIN}&lt;/%text&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WORKING_DIRECTORY &lt;%text&gt;${CMAKE_C=
URRENT_SOURCE_DIR}&lt;/%text&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0COMMENT &quot;Running gRPC C++ protocol =
buffer compiler on &lt;%text&gt;${FIL}&lt;/%text&gt;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VERBATIM)<br>
diff --git a/meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.38.1.bb=
" rel=3D"noreferrer" target=3D"_blank">grpc_1.38.1.bb</a> b/meta-oe/recipes=
-devtools/grpc/<a href=3D"http://grpc_1.41.0.bb" rel=3D"noreferrer" target=
=3D"_blank">grpc_1.41.0.bb</a><br>
similarity index 95%<br>
rename from meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.38.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">grpc_1.38.1.bb</a><br>
rename to meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.41.0.bb" r=
el=3D"noreferrer" target=3D"_blank">grpc_1.41.0.bb</a><br>
index dfb44b819..3385e2ada 100644<br>
--- a/meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.38.1.bb" rel=
=3D"noreferrer" target=3D"_blank">grpc_1.38.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.41.0.bb" rel=
=3D"noreferrer" target=3D"_blank">grpc_1.41.0.bb</a><br>
@@ -20,10 +20,10 @@ RDEPENDS:${PN}-dev:class_native +=3D &quot;${PN}-compil=
er&quot;<br>
=C2=A0# RDEPENDS:${PN}-dev +=3D &quot;${PN}-compiler&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-SRCREV_grpc =3D &quot;96b73272eadc01afb5fb45b92b408c47e4387274&quot;<br>
-BRANCH =3D &quot;v1.38.x&quot;<br>
+SRCREV_grpc =3D &quot;fc662b7964384b701af5bd3ce6994d2180080eb4&quot;<br>
+BRANCH =3D &quot;v1.41.x&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/grpc/grpc.git;pr=
otocol=3Dhttps;name=3Dgrpc;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgrpc;branch=
=3D${BRANCH}</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-cmake-fix-cross-compi=
lation-with-gRPC_BUILD_GRPC_CPP.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cmake-revert-db88fb0e=
e826e73323e06ac6166ac038ee71f6a.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0# Fixes build with older compilers 4.8 especially on ubuntu 14.04<br>
=C2=A0CXXFLAGS:append:class-native =3D &quot; -Wl,--no-as-needed&quot;<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93465): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93465" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93465</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86268966/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86268966/3617156</a><br>
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

--000000000000063d5505ceb62a29--

