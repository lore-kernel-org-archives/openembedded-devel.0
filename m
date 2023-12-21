Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E269EC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 16:45:30 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.55172.1703177130330640189
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 08:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QrJ+zZax;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bb69bfdd96so873779b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 08:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703177129; x=1703781929; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDfCatXkJsKzVi5KS6ycyiVBfAi1zn53Jouy0ap108Y=;
        b=QrJ+zZaxpRdzwtMEnQ1LwWrLupheJWUfrpAczMBE6coLxXBxrKYEGRn9y90AJNVg5p
         kEkP9r+5Ol9g38mgt/3YB1zCYHtIizId1N/GHxlFemKvBTVe5RGvchbYRLHSVHCgP1Kq
         Tg/FzzQZRysGqW+i6W5FprOLGHZ6OySWuardVqc0vLh4NROWeH7EFZTpIPefvBQ52G99
         X8fVQjW/nwIWrnGCNWssaRpLROqJHLO2cgr/jkDY6kMhEaAmZNf7tp+2BNrXorEaXHXv
         0UArwSm7A0gE0Ob44uCF8b8DFRT+FDnTPPrOwZDKauswaGAJfuPlT/bqEsJEhr3kFH28
         p2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703177129; x=1703781929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDfCatXkJsKzVi5KS6ycyiVBfAi1zn53Jouy0ap108Y=;
        b=WC1ch8mXof8pCc+74nX+3o3wIgLruyN9Jye+Zo+FrOjP0vyeKOcFOn4PNNYrpB5d/+
         uPaoC2pQE1fUAin08/0PK/wXFlzG7iHVcFqwqTQURR1Gqry2SiOIYe30VnlTInrzo0id
         4bWcLTIesRquPkedT8J4p0CNyFrYkDjngrlqDH/L/4OG10xZpWEyv/WLD1Yd5YUuocIx
         9eQDcNEtztV6jKPtxv25ctgyu1H6Vx6qD+AoCjOayJqZcsdgK5NSX4h2pFxo4fV+Ukun
         d5F9BtPDLZEwV7q6aC7VouEU0i+Y4+4nWiYU8tWMdT/yEJIiVyG8iGdbH8mJMrpc4zTn
         9hoA==
X-Gm-Message-State: AOJu0YzJADYF+Ut075XZ/o1sfxcko6vQo2SBBKGNysupaoj4JzW2iZHq
	qZk0AcNxyDK7rkL1XeOpOVT4pLBtON5YBcQ3Meg=
X-Google-Smtp-Source: AGHT+IFRqVLOPPLDPp6V9jy9gMZd6BUzfoNaTXFK3X+cuAjyNENPmLSOyf4wdNZFEZPJ0ztbFfNWdMNG2DpQ+YroILw=
X-Received: by 2002:a05:6808:189e:b0:3b9:d916:2161 with SMTP id
 bi30-20020a056808189e00b003b9d9162161mr449441oib.57.1703177129435; Thu, 21
 Dec 2023 08:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20231221102015.1080653-1-ross.burton@arm.com>
In-Reply-To: <20231221102015.1080653-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Dec 2023 08:45:03 -0800
Message-ID: <CAMKF1soPu-zJxHDpTpzGusSZoc-qf_gT0F5HdwYxGPd+duFyNg@mail.gmail.com>
Subject: Re: [oe] [PATCH] renderdoc: no need to depend on vim-native
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 16:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107722

On Thu, Dec 21, 2023 at 2:20=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> Remove the patch to bring back the user of xxd from vim-native, the
> patch claimed that the cross-compiling rules were broken. However they
> work just fine if you tell it what compiler to use, as the default is
> "c++" and that isn't in HOSTTOOLS.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...d-instead-of-cross-compiling-shim-bi.patch | 57 -------------------
>  .../renderdoc/renderdoc_1.27.bb               |  2 +-
>  2 files changed, 1 insertion(+), 58 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/0001-ren=
derdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch
>
> diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-renderdoc-=
use-xxd-instead-of-cross-compiling-shim-bi.patch b/meta-oe/recipes-graphics=
/renderdoc/renderdoc/0001-renderdoc-use-xxd-instead-of-cross-compiling-shim=
-bi.patch
> deleted file mode 100644
> index e96dedfc39..0000000000
> --- a/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-renderdoc-use-xxd=
-instead-of-cross-compiling-shim-bi.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From 41a8c9b5ac13066770baee476ebf9828371f4dad Mon Sep 17 00:00:00 2001
> -From: Adrian Ratiu <adrian.ratiu@collabora.com>
> -Date: Tue, 24 Sep 2019 16:07:18 +0300
> -Subject: [PATCH] renderdoc: use xxd instead of cross-compiling shim bina=
ry
> -
> -Renderdoc's attempt to cross compile an xxd replacement by directly
> -calling a host cross-compiler breaks under OE's recipe specific
> -sysroots protection because this is not a native recipe, so we just
> -use xxd-native instead.
> -
> -Upstream-Status: Inappropriate [embedded-specific]

This is nice to remove such patches which are pure technical debt with
no upstream path. Thanks.

> -
> ----
> - renderdoc/CMakeLists.txt | 23 +----------------------
> - 1 file changed, 1 insertion(+), 22 deletions(-)
> -
> -diff --git a/renderdoc/CMakeLists.txt b/renderdoc/CMakeLists.txt
> -index 5cb7440a4..453a034ba 100644
> ---- a/renderdoc/CMakeLists.txt
> -+++ b/renderdoc/CMakeLists.txt
> -@@ -370,26 +370,6 @@ set(data
> - set(data_objects)
> -
> - if(UNIX)
> --    # If we're cross-compiling, include-bin will get built for the targ=
et and we
> --    # then can't execute it. Instead, we force calling c++ (which we ca=
n safely
> --    # assume is present) directly to build the binary
> --
> --    if(CMAKE_CROSSCOMPILING)
> --        set(HOST_NATIVE_CPP_COMPILER c++ CACHE STRING "Command to run t=
o compile a .cpp into an executable. Default is just c++")
> --
> --        add_custom_command(OUTPUT ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/inc=
lude-bin
> --            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
> --            COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_RUNTIME_=
OUTPUT_DIRECTORY}
> --            COMMAND ${HOST_NATIVE_CPP_COMPILER} 3rdparty/include-bin/ma=
in.cpp -o ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-bin
> --            DEPENDS 3rdparty/include-bin/main.cpp)
> --        set(INCLUDE_BIN_EXE "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-=
bin")
> --        set(INCLUDE_BIN_DEP "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-=
bin")
> --    else()
> --        add_executable(include-bin 3rdparty/include-bin/main.cpp)
> --        set(INCLUDE_BIN_EXE $<TARGET_FILE:include-bin>)
> --        set(INCLUDE_BIN_DEP include-bin)
> --    endif()
> --
> -     foreach(res ${data})
> -         set(in ${res})
> -         set(working_dir ${CMAKE_CURRENT_SOURCE_DIR})
> -@@ -399,8 +379,7 @@ if(UNIX)
> -         add_custom_command(OUTPUT ${out_src}
> -             WORKING_DIRECTORY ${working_dir}
> -             COMMAND ${CMAKE_COMMAND} -E make_directory ${out_src_dir}
> --            COMMAND ${INCLUDE_BIN_EXE} ${in} ${out_src}
> --            DEPENDS ${INCLUDE_BIN_DEP}
> -+            COMMAND xxd -i ${in} ${out_src}
> -             DEPENDS ${res})
> -
> -         list(APPEND data_objects ${out_src})
> diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb b/meta-=
oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
> index 112f0ddcbe..58f2275736 100644
> --- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
> +++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D36d34a46cb7=
1546195d2b0c626a52e5d"
>  SRCREV =3D "35b13a8e8fd2a331854dba6da81a20452e142d6f"
>  SRC_URI =3D " \
>      git://github.com/baldurk/${BPN}.git;protocol=3Dhttps;branch=3Dv1.x \
> -    file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.pat=
ch \
>  "
>  S =3D "${WORKDIR}/git"
>
> @@ -32,6 +31,7 @@ EXTRA_OECMAKE +=3D "\
>      -DENABLE_PYRENDERDOC=3DOFF \
>      -DENABLE_RENDERDOCCMD=3DON \
>      -DCMAKE_BUILD_TYPE=3DRelease \
> +    -DHOST_NATIVE_CPP_COMPILER=3D"${BUILD_CXX}" \

Just double checking here
Does it need to be host toolchain provided cpp or cross cpp ?

>  "
>
>  FILES:${PN} +=3D "${libdir}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107705): https://lists.openembedded.org/g/openembedde=
d-devel/message/107705
> Mute This Topic: https://lists.openembedded.org/mt/103298090/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

