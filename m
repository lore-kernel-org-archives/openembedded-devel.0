Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F855C3DA7F
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 22:57:22 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.15076.1723330633437124773
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 15:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NjQ8DPSf;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-709340bd54dso1429499a34.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723330633; x=1723935433; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrdixN9WQxHJU2WwVgwCMcS/Jc4b+l0gRggz4Tt/cSM=;
        b=NjQ8DPSfZvvXV80ADCdRWV0NFQCmP41NMkqYEjPhOko8ZXb1a7TZszYrQcfshTFVLP
         yRr2lHR4OhxQeqt6ixOz2G1LhU1cvM54PtFvFBz1Qq1/1c/I63EwWylraCbLBRAsHN/r
         atMeZirKvP+x0mVaD0W29uaFu9YgPJVewNM782ynjms78toMM/UJZGagn8eLzGaOJUDX
         PON6DCmA+SQWtjicrGRDd9NlnRDS+wY4XNX3hQJlhYtQ8Dx8YDH1R9hPK5LzftLzIU0q
         wzx6doJF9sqATkopjxl4BUpo/RvWej5iLYVhLbNis4v9olbBXgjtfKmI6Vvl7zhV3so2
         07sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723330633; x=1723935433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrdixN9WQxHJU2WwVgwCMcS/Jc4b+l0gRggz4Tt/cSM=;
        b=fY7fSfGJx/o5fS1w1aZfHqjBWXfHzvGFv81dH188Avl7HRvkAi/CwYgvUvmyC7dFTL
         0jlVQg0wT06Q4jB8TE+TVpu/xpApRH/ogGwyCMIRC5ovvvYlazGvnwy317zAZUtuG7Pg
         1zHpVMaTLCW8NJM0yUeVl3un80pO0LBBPpR4plzPGy6Qkv0VFubV6nkdokcG61WM2mLo
         7a6NowynoYtRlyp0qRs6nd3/Im+6lol8V+yRsP29TUUzRGptpWhgLix6GgLvTYYAtFD9
         lII9q5kp2BsHRuX/GQJMY0xA9obt59HRIPJijxcZKhfRKIUpmRutpZ60l0QkttmH1H2E
         0rsg==
X-Gm-Message-State: AOJu0YzdW4hHaqMaUdYGaeu6l+lvZ9rrNsyQlY1OtA2tdvUhEfoZhtJJ
	QdHmYPiuvTm5xNII/O8F0l/c5KReIsdCqybwRIP5kaeXt4eG+7V26c3vxDC1N9i9UsYEu4QW9Aa
	aeVxPI2b8P1MGwGBBp3X53S+YXyU=
X-Google-Smtp-Source: AGHT+IHOaCxRHhBfoK+IB0crP5UjQCzX1eDVBu7KJlZIRnNm6mymEd/nKKdcJRAl4PMA6zoI9DNfdinE3txCBDlWGik=
X-Received: by 2002:a05:6830:710d:b0:70b:3ee2:b55e with SMTP id
 46e09a7af769-70b50a9803dmr4109052a34.3.1723330632535; Sat, 10 Aug 2024
 15:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240809110247.24607-1-nikhil.r@kpit.com>
In-Reply-To: <20240809110247.24607-1-nikhil.r@kpit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Aug 2024 15:56:46 -0700
Message-ID: <CAMKF1soP5c3fNd2QHsJFcojhs0AEjyW1-HqjjXMgL-rU2nMSOw@mail.gmail.com>
Subject: Re: [oe][kirkstone][PATCH] rocksdb: Add an option to set static library
To: nikhil.r@kpit.com
Cc: openembedded-devel@lists.openembedded.org, bindu.bhabu@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 22:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111752

On Fri, Aug 9, 2024 at 4:03=E2=80=AFAM Nikhil via lists.openembedded.org
<nikhil.r=3Dkpit.com@lists.openembedded.org> wrote:
>
> Modify the CMakeLists.txt to add an Option for
> STATIC target, as available for shared library.
>
> Link: https://github.com/facebook/rocksdb/pull/12890
>
> Configure static library default to switched off
> as shared libraries are sufficient in most cases.
>
> Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
> ---
>  .../files/static_library_as_option.patch      | 68 +++++++++++++++++++
>  meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  2 +
>  2 files changed, 70 insertions(+)
>  create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_as_o=
ption.patch
>
> diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.p=
atch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
> new file mode 100644
> index 000000000..4162d1154
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
> @@ -0,0 +1,68 @@
> +From 285d306494bde3e9c24c8cd6fea1eb380a304d03 Mon Sep 17 00:00:00 2001
> +From: Bindu-Bhabu <bindudaniel1996@gmail.com>
> +Date: Fri, 26 Jul 2024 15:14:45 +0530
> +Subject: Add option to CMake for building static libraries
> +
> +ROCKSDB creates a STATIC library target reference by default.
> +Modify the cmake so that the STATIC library is also an option
> +just like creating a SHARED library.
> +
> +Upstream-Status:Accepted
> +Link: https://github.com/facebook/rocksdb/pull/12890

This is wrongly formatted, it should be something like
Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/12890]

for more info on patch status spec -
https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#pat=
ch-upstream-status

always test your patches with the branch they are intended for before sendi=
ng.

> +
> +Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
> +Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
> +---
> + CMakeLists.txt | 29 +++++++++++++++++------------
> + 1 file changed, 17 insertions(+), 12 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 93b884dd9c1..2ca925d505c 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -919,6 +919,7 @@ set(ROCKSDB_STATIC_LIB rocksdb${ARTIFACT
> + set(ROCKSDB_SHARED_LIB rocksdb-shared${ARTIFACT_SUFFIX})
> +
> + option(ROCKSDB_BUILD_SHARED "Build shared versions of the RocksDB libra=
ries" ON)
> ++option(ROCKSDB_BUILD_STATIC "Build static versions of the RocksDB libra=
ries" ON)
> +
> + option(WITH_LIBRADOS "Build with librados" OFF)
> + if(WITH_LIBRADOS)
> +@@ -938,9 +939,11 @@ else()
> +   endif()
> + endif()
> +
> +-add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC}=
)
> +-target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
> +-  ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
> ++if(ROCKSDB_BUILD_STATIC)
> ++  add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_C=
C})
> ++  target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
> ++    ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
> ++endif()
> +
> + if(ROCKSDB_BUILD_SHARED)
> +   add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES} ${BUILD_VERSION_C=
C})
> +@@ -1238,13 +1241,15 @@ if(NOT WIN32 OR ROCKSDB_INSTALL_ON_WINDOWS)
> +
> +   install(DIRECTORY "${PROJECT_SOURCE_DIR}/cmake/modules" COMPONENT dev=
el DESTINATION ${package_config_destination})
> +
> +-  install(
> +-    TARGETS ${ROCKSDB_STATIC_LIB}
> +-    EXPORT RocksDBTargets
> +-    COMPONENT devel
> +-    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
> +-    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
> +-  )
> ++  if(ROCKSDB_BUILD_STATIC)
> ++    install(
> ++      TARGETS ${ROCKSDB_STATIC_LIB}
> ++      EXPORT RocksDBTargets
> ++      COMPONENT devel
> ++      ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
> ++      INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
> ++    )
> ++  endif()
> +
> +   if(ROCKSDB_BUILD_SHARED)
> +     install(
> diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/reci=
pes-dbs/rocksdb/rocksdb_6.20.3.bb
> index 2ad2d38a5..4acf93439 100644
> --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
> +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D "git://github.com/facebook/${BPN}.git;branc=
h=3D${SRCBRANCH};protocol=3Dhtt
>             file://ppc64.patch \
>             file://mips.patch \
>             file://arm.patch \
> +           file://static_library_as_option.patch \
>            "
>
>  SRC_URI:append:riscv32 =3D " file://0001-replace-old-sync-with-new-atomi=
c-builtin-equivalents.patch"
> @@ -44,6 +45,7 @@ EXTRA_OECMAKE =3D "\
>      -DWITH_BENCHMARK_TOOLS=3DOFF \
>      -DWITH_TOOLS=3DOFF \
>      -DFAIL_ON_WARNINGS=3DOFF \
> +    -DROCKSDB_BUILD_STATIC=3DOFF \
>  "
>
>  do_install:append() {
> --
> 2.25.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111691): https://lists.openembedded.org/g/openembedde=
d-devel/message/111691
> Mute This Topic: https://lists.openembedded.org/mt/107805957/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

