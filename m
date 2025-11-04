Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179F6CCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 19:47:34 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4876.1762285645097976837
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 11:47:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bGnADivx;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63f97c4eccaso4222611d50.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 11:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762285644; x=1762890444; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcXKKR0HuGwF6/Qa2VKoLZiNzv3f81q7+e79nQitfyE=;
        b=bGnADivxlzDxkUoolywB6XC1jISKxCWIvfOQ2CsfnJ6qVyWjP106LArx2c5LUFFXM0
         muugCyyIyvcY2NwQOxHArS+nxx0EI6C7rWecx/61Y2s8HkZJbk2MYZ+86ZY0A0ChgoCs
         PtbLvhP0KgU/2a+Y73s74+V5w2bwX8e9G/4VAmtuhrPsxcRnkbfowyuJHEJhZRpy1n/Q
         wfPMHF58n+iuY6Zp1/x/1f6DYOCGd40wWO7ptZHsLdRMuLwVBpt9xMcfWmOWUITZ7661
         UhxtBeMui9s8/zM4q7bS1MlIAfq/RUOuCRNrU8o4Qf9XCTtoThJWUBK1EnjehDFbrhmp
         kdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762285644; x=1762890444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcXKKR0HuGwF6/Qa2VKoLZiNzv3f81q7+e79nQitfyE=;
        b=S6npw0hf4zwLqIAhHTiP5AQLS0kX0SBlszaUoHPI50jyL8mzjvHTq9ykU7/3liLKWN
         f/iBxoQDSmuFnLSRjzK3S2xqR47elFDEFxBt2VZ7f/o3GqfDx06ZqJrOJO6hyCIzK7ky
         PiHKB4sMBdboxKtg/5LYQCx4cvylq2EM2MvRco8t28ryRGzv+mTst3bupNzBPKkrxrVF
         MeGjIeUtyf0y8fq35NzSa+mf4l/tI3zWuLjlTa3R3WBC3ayf/yagoyl4NK7wxJSZHnYF
         cccpKUmSXPZGh96H8eZVcV5Fyk9cQArq0hNykJ1k85CQ1joC2SrVPCjtys+TxwzrfDAt
         DN/A==
X-Gm-Message-State: AOJu0YxVsL9d6burHfP0Ri11GqiiF2L5jJa8DC6StKvAC6URR2aQxqhN
	eiWritadv57zf2L4mGi1Kp69S4ngsQAUJU8/vNKmhoa/sQFizuBOev9OZHuL+FrWX6GghPRFsph
	0K5akeiOizVRYD43XzBnvSRlAYc1hYUdCIZXdCSo=
X-Gm-Gg: ASbGnct8RfetNLhukW85Y/yqD0vx6K4FHIJXBbkveGmlgmdRhjzOjNTWODO4+dgl7lX
	8/eTcTVurq7GZxwNS0e6PTMuJhBFlScn9LIjKvV335+7mxHZCW5Nox5i2LAyHNTY2ZLtUrCPvCO
	WWQ2Dt7ZlRZdk649olKv3hrNqfmdoc7tAU6/0lcrX8tu25UgPj8ABOuLBL3yJSfx18lAVablfOW
	U8Nxdfp17ckCatDaxDmRprCoStz+Sa5KwWjQiIh6FZDXkNtEBshVgLwtjac+EU0TmA0i2P+gK6D
	A+YBJIuoS1jCboaeDQfROE6GR4lG19uS6yOvgjZKIsJrQuYVCD0zj5VRKTNaZV4GATSmR95L8O7
	t
X-Google-Smtp-Source: AGHT+IE4cFe3NitWbGRABxW7Wto6emxxfh0Fpe2QtNGPl6SFgmIwYrFQytf0zejhoV0MM20L2jPNrqIE75Llor202s0=
X-Received: by 2002:a05:690e:4250:b0:63e:231a:cb5a with SMTP id
 956f58d0204a3-63fd356f8c1mr491755d50.48.1762285643994; Tue, 04 Nov 2025
 11:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20251104151124.2391-1-yi.zhao@windriver.com> <CAMKF1sq=E=vj_7kZMOyzyPhb0zKJSXWbMCHHV+6A97X_TWCDUQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq=E=vj_7kZMOyzyPhb0zKJSXWbMCHHV+6A97X_TWCDUQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Nov 2025 11:46:56 -0800
X-Gm-Features: AWmQ_bmfnv5vqoPlncEci5tYgeRA8tVKdrAI0RibRHHNix5zmvj8CdM3pPEHBjM
Message-ID: <CAMKF1sq58EgZzAMdHtix-_9=8v7EO+f965g4zba68aG8_=4pig@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] vsomeip: upgrade 3.5.3 -> 3.5.9
To: yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 19:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121305

fails with clang on arm/x86

https://errors.yoctoproject.org/Errors/Details/886517/
https://errors.yoctoproject.org/Errors/Details/886516/

On Tue, Nov 4, 2025 at 8:13=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Nov 4, 2025 at 7:11=E2=80=AFAM Yi Zhao via lists.openembedded.org
> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
> >
> > ChangeLog:
> > https://github.com/COVESA/vsomeip/releases/tag/3.5.4
> > https://github.com/COVESA/vsomeip/releases/tag/3.5.5
> > https://github.com/COVESA/vsomeip/releases/tag/3.5.6
> > https://github.com/COVESA/vsomeip/releases/tag/3.5.7
> > https://github.com/COVESA/vsomeip/releases/tag/3.5.8
> > https://github.com/COVESA/vsomeip/releases/tag/3.5.9
> >
> > * Fix build with boost 1.89
> > * Fix build on 32-bit host
> >
> > Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > ---
> >  .../0001-Fix-pkgconfig-dir-for-multilib.patch |   8 +-
> >  ...e-configuration-files-to-etc-vsomeip.patch |   8 +-
> >  ...-Do-not-specify-PIE-flag-explicitly.patch} |  21 +--
> >  .../0004-Fix-build-with-boost-1.89.patch      |  42 ++++++
> >  ...ddress-from_string-with-make_address.patch |  47 +++++++
> >  ...eLists.txt-add-missing-link-with-dlt.patch |  41 ------
> >  ...06-Fix-scanning-64-bit-integer-types.patch | 128 ++++++++++++++++++
> >  .../{vsomeip_3.5.3.bb =3D> vsomeip_3.5.9.bb}    |  31 +++--
> >  8 files changed, 257 insertions(+), 69 deletions(-)
> >  rename meta-networking/recipes-protocols/vsomeip/vsomeip/{0004-Do-not-=
specify-PIE-flag-explicitly.patch =3D> 0003-Do-not-specify-PIE-flag-explici=
tly.patch} (82%)
> >  create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0=
004-Fix-build-with-boost-1.89.patch
> >  create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0=
005-Replace-address-from_string-with-make_address.patch
> >  delete mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0=
005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch
> >  create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0=
006-Fix-scanning-64-bit-integer-types.patch
>
> several of these patches have upstream status pending, whats are plan the=
re ?
>
> >  rename meta-networking/recipes-protocols/vsomeip/{vsomeip_3.5.3.bb =3D=
> vsomeip_3.5.9.bb} (67%)
> >
> > diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix=
-pkgconfig-dir-for-multilib.patch b/meta-networking/recipes-protocols/vsome=
ip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
> > index 0ddcb642bc..9595241c41 100644
> > --- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgcon=
fig-dir-for-multilib.patch
> > +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgcon=
fig-dir-for-multilib.patch
> > @@ -1,4 +1,4 @@
> > -From 2f931baf290477b586309189445bf87e3bc5d5ba Mon Sep 17 00:00:00 2001
> > +From 73773d45230a3c9d73ed3c1aa26f0d5c87d29037 Mon Sep 17 00:00:00 2001
> >  From: Yi Zhao <yi.zhao@windriver.com>
> >  Date: Wed, 2 Mar 2022 14:51:13 +0800
> >  Subject: [PATCH] Fix pkgconfig dir for multilib
> > @@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/CMakeLists.txt b/CMakeLists.txt
> > -index ab399a69..beae6eaf 100644
> > +index 899f54f0..7f38ecd0 100644
> >  --- a/CMakeLists.txt
> >  +++ b/CMakeLists.txt
> > -@@ -637,7 +637,7 @@ endif()
> > +@@ -661,7 +661,7 @@ endif()
> >   # create pkg-config file
> >   if(NOT WIN32)
> >           configure_file(${VSOMEIP_NAME}.pc.in ${PROJECT_BINARY_DIR}/${=
VSOMEIP_NAME}.pc @ONLY)
> > @@ -24,5 +24,5 @@ index ab399a69..beae6eaf 100644
> >
> >   #####################################################################=
#########
> >  --
> > -2.25.1
> > +2.34.1
> >
> > diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Ins=
tall-example-configuration-files-to-etc-vsomeip.patch b/meta-networking/rec=
ipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-=
etc-vsomeip.patch
> > index bdaf343606..b1146783d9 100644
> > --- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-ex=
ample-configuration-files-to-etc-vsomeip.patch
> > +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-ex=
ample-configuration-files-to-etc-vsomeip.patch
> > @@ -1,4 +1,4 @@
> > -From ebaa3206ee125741314272cddafa04fa71bd2d1e Mon Sep 17 00:00:00 2001
> > +From b79c6368d29746fd8c1917ea9c9a36aaf58bb352 Mon Sep 17 00:00:00 2001
> >  From: Yi Zhao <yi.zhao@windriver.com>
> >  Date: Wed, 9 Mar 2022 11:48:44 +0800
> >  Subject: [PATCH] Install example configuration files to /etc/vsomeip
> > @@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/CMakeLists.txt b/CMakeLists.txt
> > -index beae6eaf..d791c12e 100644
> > +index 7f38ecd0..28919e09 100644
> >  --- a/CMakeLists.txt
> >  +++ b/CMakeLists.txt
> > -@@ -536,7 +536,7 @@ install(FILES ${PROJECT_BINARY_DIR}/vsomeip.pc DES=
TINATION lib/pkgconfig)
> > +@@ -578,7 +578,7 @@ install(FILES ${PROJECT_BINARY_DIR}/vsomeip.pc DES=
TINATION lib/pkgconfig)
> >   endif ()
> >
> >   install (
> > @@ -24,5 +24,5 @@ index beae6eaf..d791c12e 100644
> >
> >   # Add all targets to the build-tree export set
> >  --
> > -2.25.1
> > +2.34.1
> >
> > diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-=
not-specify-PIE-flag-explicitly.patch b/meta-networking/recipes-protocols/v=
someip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
> > similarity index 82%
> > rename from meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-n=
ot-specify-PIE-flag-explicitly.patch
> > rename to meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not=
-specify-PIE-flag-explicitly.patch
> > index 2d789627a3..824ac99b24 100644
> > --- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-spe=
cify-PIE-flag-explicitly.patch
> > +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-spe=
cify-PIE-flag-explicitly.patch
> > @@ -1,4 +1,4 @@
> > -From ec2d36466c9050ee282ea1c3bb1b5f1f61c96ecb Mon Sep 17 00:00:00 2001
> > +From 1b6f73f7b36e38dd29d867ef6601df54b64ca85d Mon Sep 17 00:00:00 2001
> >  From: Yi Zhao <yi.zhao@windriver.com>
> >  Date: Mon, 17 Jul 2023 14:33:32 +0800
> >  Subject: [PATCH] Do not specify PIE flag explicitly
> > @@ -23,9 +23,11 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >   CMakeLists.txt | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 28919e09..1c192fc5 100644
> >  --- a/CMakeLists.txt
> >  +++ b/CMakeLists.txt
> > -@@ -70,7 +70,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux"
> > +@@ -73,7 +73,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
> >   if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
> >       # This is only relevant for GCC and causes warnings on Clang
> >       set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=3D${C=
MAKE_CURRENT_SOURCE_DIR}/exportmap.gcc")
> > @@ -34,12 +36,15 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >   endif()
> >
> >       set(NO_DEPRECATED "")
> > -@@ -78,7 +78,7 @@ endif()
> > -   if(NOT DEFINED _FORTIFY_SOURCE)
> > -       set(_FORTIFY_SOURCE 2)
> > -   endif()
> > --    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthre=
ad -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -f=
strict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-=
omit-frame-pointer -D_FORTIFY_SOURCE=3D${_FORTIFY_SOURCE} -Wformat -Wformat=
-security -Wpedantic -Werror -fPIE")
> > -+    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthre=
ad -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -f=
strict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-=
omit-frame-pointer -D_FORTIFY_SOURCE=3D${_FORTIFY_SOURCE} -Wformat -Wformat=
-security -Wpedantic")
> > +@@ -82,7 +82,7 @@ endif()
> > +     if(NOT DEFINED _FORTIFY_SOURCE)
> > +         set(_FORTIFY_SOURCE 2)
> > +     endif()
> > +-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthre=
ad -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -f=
strict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-=
omit-frame-pointer -D_FORTIFY_SOURCE=3D${_FORTIFY_SOURCE} -Wformat -Wformat=
-security -Wpedantic -Werror -fPIE -Wno-inconsistent-missing-override")
> > ++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthre=
ad -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -f=
strict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-=
omit-frame-pointer -D_FORTIFY_SOURCE=3D${_FORTIFY_SOURCE} -Wformat -Wformat=
-security -Wpedantic -Werror -Wno-inconsistent-missing-override")
> >
> >       # force all use of std::mutex and std::recursive_mutex to use run=
time init
> >       # instead of static initialization so mutexes can be hooked to en=
able PI as needed
> > +--
> > +2.34.1
> > +
> > diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix=
-build-with-boost-1.89.patch b/meta-networking/recipes-protocols/vsomeip/vs=
omeip/0004-Fix-build-with-boost-1.89.patch
> > new file mode 100644
> > index 0000000000..b3caded33c
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-=
with-boost-1.89.patch
> > @@ -0,0 +1,42 @@
> > +From 22af350ba78b5d2f8c6537ff867c3dd5eba05850 Mon Sep 17 00:00:00 2001
> > +From: Yi Zhao <yi.zhao@windriver.com>
> > +Date: Mon, 3 Nov 2025 23:06:35 +0800
> > +Subject: [PATCH] Fix build with boost 1.89
> > +
> > +The Boost.System stub library has been removed in Boost 1.89.0[1], whi=
ch
> > +causes a CMake error:
> > +
> > +CMake Error at Boost-1.89.0/BoostConfig.cmake:141 (find_package):
> > +  Could not find a package configuration file provided by "boost_syste=
m"
> > +  (requested version 1.89.0) with any of the following names:
> > +    boost_systemConfig.cmake
> > +    boost_system-config.cmake
> > +
> > +Drop 'system' from the COMPONENTS in find_package to fix this issue[2]=
.
> > +
> > +[1] https://github.com/boostorg/system/commit/7a495bb46d7ccd808e4be2a6=
589260839b0fd3a3
> > +[2] https://github.com/boostorg/system/issues/132
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > +---
> > + CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 1c192fc5..e6b54bc5 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -189,7 +189,7 @@ add_definitions(-DVSOMEIP_INTERNAL_SUPPRESS_DEPREC=
ATED)
> > + find_package(Threads REQUIRED)
> > +
> > + # Boost
> > +-find_package( Boost 1.66 COMPONENTS system thread filesystem REQUIRED=
 )
> > ++find_package( Boost 1.66 COMPONENTS thread filesystem REQUIRED )
> > + if(${CMAKE_SYSTEM_NAME} MATCHES "QNX")
> > +     include_directories(${Boost_INCLUDE_DIR} )
> > + else()
> > +--
> > +2.34.1
> > +
> > diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Rep=
lace-address-from_string-with-make_address.patch b/meta-networking/recipes-=
protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_addres=
s.patch
> > new file mode 100644
> > index 0000000000..0e8ff6e2ca
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-ad=
dress-from_string-with-make_address.patch
> > @@ -0,0 +1,47 @@
> > +From 83fdae064c4bd5d38f23679fc8793e44e563c046 Mon Sep 17 00:00:00 2001
> > +From: Yi Zhao <yi.zhao@windriver.com>
> > +Date: Tue, 4 Nov 2025 22:10:33 +0800
> > +Subject: [PATCH] Replace address::from_string with make_address
> > +
> > +boost::asio::ip::address::from_string is deprecated since boost 1.87[1=
].
> > +Replace it with make_address.
> > +
> > +Fix:
> > +implementation/routing/src/routing_manager_impl.cpp:1406:98: error: 'f=
rom_string' is not a member of 'boost::asio::ip::address_v4'
> > + 1406 |  _remote_address.is_v4() ?  _remote_address.to_v4() : boost::a=
sio::ip::address_v4::from_string("6.6.6.6");
> > +      |                                                               =
                     ^~~~~~~~~~~
> > +
> > +[1] https://github.com/boostorg/asio/commit/c0d1cfce7767599c4cf00df36f=
8017a1073339ae
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > +---
> > + implementation/routing/src/routing_manager_impl.cpp | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/implementation/routing/src/routing_manager_impl.cpp b/imp=
lementation/routing/src/routing_manager_impl.cpp
> > +index ad587c5e..73aeb334 100644
> > +--- a/implementation/routing/src/routing_manager_impl.cpp
> > ++++ b/implementation/routing/src/routing_manager_impl.cpp
> > +@@ -1403,7 +1403,7 @@ void routing_manager_impl::on_message(const byte=
_t* _data, length_t _size, endpo
> > +     if (is_forwarded) {
> > +         trace::header its_header;
> > +         const boost::asio::ip::address_v4 its_remote_address =3D
> > +-                _remote_address.is_v4() ? _remote_address.to_v4() : b=
oost::asio::ip::address_v4::from_string("6.6.6.6");
> > ++                _remote_address.is_v4() ? _remote_address.to_v4() : b=
oost::asio::ip::make_address_v4("6.6.6.6");
> > +         trace::protocol_e its_protocol =3D _receiver->is_local() ? tr=
ace::protocol_e::local
> > +                 : _receiver->is_reliable()                     ? trac=
e::protocol_e::tcp
> > +                                                                : trac=
e::protocol_e::udp;
> > +@@ -1441,7 +1441,7 @@ bool routing_manager_impl::on_message(service_t =
_service, instance_t _instance,
> > +         std::shared_ptr<endpoint> _receiver =3D its_info->get_endpoin=
t(_reliable);
> > +         if (_receiver && _receiver.get()) {
> > +             if(!is_acl_message_allowed(_receiver.get(), _service, _in=
stance,
> > +-                    boost::asio::ip::address_v4::from_string("127.0.0=
.1"))) {
> > ++                    boost::asio::ip::make_address_v4("127.0.0.1"))) {
> > +                 return false;
> > +             }
> > +         }
> > +--
> > +2.34.1
> > +
> > diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-tes=
t-common-CMakeLists.txt-add-missing-link-with-dlt.patch b/meta-networking/r=
ecipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missin=
g-link-with-dlt.patch
> > deleted file mode 100644
> > index 25d66514f8..0000000000
> > --- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-commo=
n-CMakeLists.txt-add-missing-link-with-dlt.patch
> > +++ /dev/null
> > @@ -1,41 +0,0 @@
> > -From 8676ef287bb25b49668be4336387bdf83a0cae5c Mon Sep 17 00:00:00 2001
> > -From: Yi Zhao <yi.zhao@windriver.com>
> > -Date: Mon, 1 Jan 2024 17:02:41 +0800
> > -Subject: [PATCH] test/common/CMakeLists.txt: add missing link with dlt
> > -
> > -The libvsomeip_utilities library uses functions e.g.
> > -dlt_check_library_version/dlt_register_app/dlt_unregister_app which ar=
e
> > -provided by dlt therefore add it to linker flags.
> > -
> > -Fixes:
> > -x86_64-poky-linux-ld.lld: error: undefined reference due to --no-allow=
-shlib-undefined: dlt_check_library_version
> > ->>> referenced by test/common/libvsomeip_utilities.so
> > -
> > -x86_64-poky-linux-ld.lld: error: undefined reference due to --no-allow=
-shlib-undefined: dlt_register_app
> > ->>> referenced by test/common/libvsomeip_utilities.so
> > -
> > -x86_64-poky-linux-ld.lld: error: undefined reference due to --no-allow=
-shlib-undefined: dlt_unregister_app
> > ->>> referenced by test/common/libvsomeip_utilities.so
> > -
> > -Upstream-Status: Submitted [https://github.com/COVESA/vsomeip/pull/602=
]
> > -
> > -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > ----
> > - test/common/CMakeLists.txt | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/test/common/CMakeLists.txt b/test/common/CMakeLists.txt
> > -index d4d14534..afc8c2d6 100644
> > ---- a/test/common/CMakeLists.txt
> > -+++ b/test/common/CMakeLists.txt
> > -@@ -27,6 +27,7 @@ TARGET_LINK_LIBRARIES (
> > -         ${Boost_LIBRARIES}
> > -         ${DL_LIBRARY}
> > -         ${TEST_LINK_LIBRARIES}
> > -+        ${DLT_LIBRARIES}
> > - )
> > -
> > - # -------------------------------------------------------------------=
---------
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix=
-scanning-64-bit-integer-types.patch b/meta-networking/recipes-protocols/vs=
omeip/vsomeip/0006-Fix-scanning-64-bit-integer-types.patch
> > new file mode 100644
> > index 0000000000..f7aca8333d
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix-scanni=
ng-64-bit-integer-types.patch
> > @@ -0,0 +1,128 @@
> > +From 2cdb9e4d2fc7ac11a886b7b524b6b9b5173b5667 Mon Sep 17 00:00:00 2001
> > +From: Yi Zhao <yi.zhao@windriver.com>
> > +Date: Tue, 4 Nov 2025 12:50:51 +0800
> > +Subject: [PATCH] Fix scanning 64-bit integer types
> > +
> > +Fix build error on 32-bit host:
> > +test/network_tests/cpu_load_tests/cpu_load_measurer.cpp:89:24: error: =
format '%lu' expects argument of type 'long unsigned int*',
> > +but argument 3 has type 'uint64_t*' {aka 'long long unsigned int*'} [-=
Werror=3Dformat=3D]
> > +   89 |   "%lu %lu %ld %ld", // utime, stime, cutime, cstime
> > +      |    ~~^
> > +      |      |
> > +      |      long unsigned int*
> > +      |    %llu
> > +   90 |   &utime, &stime, &cutime, &cstime)
> > +      |   ~~~~~~
> > +      |   |
> > +      |   uint64_t* {aka long long unsigned int*}
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > +---
> > + implementation/routing/src/routing_manager_impl.cpp     | 4 +++-
> > + test/network_tests/cpu_load_tests/cpu_load_measurer.cpp | 6 ++++--
> > + test/network_tests/memory_tests/memory_test_client.cpp  | 4 +++-
> > + test/network_tests/memory_tests/memory_test_service.cpp | 4 +++-
> > + 4 files changed, 13 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/implementation/routing/src/routing_manager_impl.cpp b/imp=
lementation/routing/src/routing_manager_impl.cpp
> > +index 73aeb334..0d729714 100644
> > +--- a/implementation/routing/src/routing_manager_impl.cpp
> > ++++ b/implementation/routing/src/routing_manager_impl.cpp
> > +@@ -9,6 +9,7 @@
> > + #include <sstream>
> > + #include <forward_list>
> > + #include <thread>
> > ++#include <cinttypes>
> > +
> > + #if defined(__linux__) || defined(__QNX__)
> > + #include <unistd.h>
> > +@@ -3828,7 +3829,8 @@ void routing_manager_impl::memory_log_timer_cbk(=
boost::system::error_code const&
> > +     std::uint64_t its_dirtypages(0);
> > +
> > +     if (EOF
> > +-        =3D=3D std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu", &=
its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib, &its_data,
> > ++        =3D=3D std::fscanf(its_file, "%" SCNu64 " %" SCNu64 " %" SCNu=
64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
> > ++                    &its_size, &its_rsssize, &its_sharedpages, &its_t=
ext, &its_lib, &its_data,
> > +                     &its_dirtypages)) {
> > +         VSOMEIP_ERROR << "memory_log_timer_cbk: error reading: errno =
" << errno;
> > +     }
> > +diff --git a/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp b=
/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
> > +index aaf91174..dfe27e8c 100644
> > +--- a/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
> > ++++ b/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
> > +@@ -12,6 +12,7 @@
> > + #include <vector>
> > + #include <stdexcept>
> > + #include <cstdio>
> > ++#include <cinttypes>
> > +
> > + #include <sys/types.h>
> > + #include <unistd.h>
> > +@@ -86,7 +87,7 @@ std::uint64_t cpu_load_measurer::read_proc_pid_stat(=
) {
> > +     std::int64_t cstime(0);
> > +     if (std::fscanf(f,
> > +                     "%*d %*s %*c %*d %*d %*d %*d %*d %*u %*u %*u %*u =
%*u "
> > +-                    "%lu %lu %ld %ld", // utime, stime, cutime, cstim=
e
> > ++                    "%" SCNu64 " %" SCNu64 " %" SCNi64 " %" SCNi64, /=
/ utime, stime, cutime, cstime
> > +                     &utime, &stime, &cutime, &cstime)
> > +         =3D=3D EOF) {
> > +         std::cerr << "Failed to read " + path << std::endl;
> > +@@ -116,7 +117,8 @@ std::uint64_t cpu_load_measurer::read_proc_stat(st=
d::uint64_t* _idle) {
> > +     std::uint64_t steal(0);
> > +     std::uint64_t guest(0);
> > +     std::uint64_t guest_nice(0);
> > +-    if (std::fscanf(f, "%*s %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu",=
 &user, &nice, &system, &idle, &iowait, &irq, &softirq, &steal, &guest,
> > ++    if (std::fscanf(f, "%*s %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SC=
Nu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu6=
4,
> > ++                    &user, &nice, &system, &idle, &iowait, &irq, &sof=
tirq, &steal, &guest,
> > +                     &guest_nice)
> > +         =3D=3D EOF) {
> > +         std::cerr << "Failed to read /proc/stat" << std::endl;
> > +diff --git a/test/network_tests/memory_tests/memory_test_client.cpp b/=
test/network_tests/memory_tests/memory_test_client.cpp
> > +index 102c8218..d922ad81 100644
> > +--- a/test/network_tests/memory_tests/memory_test_client.cpp
> > ++++ b/test/network_tests/memory_tests/memory_test_client.cpp
> > +@@ -6,6 +6,7 @@
> > + #include <chrono>
> > + #include <iomanip>
> > + #include <cstring>
> > ++#include <cinttypes>
> > +
> > + #include <vsomeip/internal/logger.hpp>
> > + #include "memory_test_client.hpp"
> > +@@ -30,7 +31,8 @@ void check_memory(std::vector<std::uint64_t>& test_m=
emory_, std::atomic<bool>& s
> > +         std::uint64_t its_dirtypages(0);
> > +
> > +         if (EOF
> > +-            =3D=3D std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu=
", &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
> > ++            =3D=3D std::fscanf(its_file, "%" SCNu64 " %" SCNu64 " %" =
SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
> > ++                           &its_size, &its_rsssize, &its_sharedpages,=
 &its_text, &its_lib,
> > +                            &its_data, &its_dirtypages)) {
> > +             VSOMEIP_ERROR << "check_memory: error reading: errno " <<=
 errno;
> > +         }
> > +diff --git a/test/network_tests/memory_tests/memory_test_service.cpp b=
/test/network_tests/memory_tests/memory_test_service.cpp
> > +index a8547395..751c6f9e 100644
> > +--- a/test/network_tests/memory_tests/memory_test_service.cpp
> > ++++ b/test/network_tests/memory_tests/memory_test_service.cpp
> > +@@ -5,6 +5,7 @@
> > +
> > + #include <vsomeip/internal/logger.hpp>
> > + #include <cstring>
> > ++#include <cinttypes>
> > +
> > + #include "memory_test_service.hpp"
> > +
> > +@@ -28,7 +29,8 @@ void check_memory(std::vector<std::uint64_t>& test_m=
emory_, std::atomic<bool>& s
> > +         std::uint64_t its_dirtypages(0);
> > +
> > +         if (EOF
> > +-            =3D=3D std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu=
", &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
> > ++            =3D=3D std::fscanf(its_file, "%" SCNu64 " %" SCNu64 " %" =
SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
> > ++                           &its_size, &its_rsssize, &its_sharedpages,=
 &its_text, &its_lib,
> > +                            &its_data, &its_dirtypages)) {
> > +             VSOMEIP_ERROR << "check_memory: error reading: errno " <<=
 errno;
> > +         }
> > +--
> > +2.34.1
> > +
> > diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb=
 b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.9.bb
> > similarity index 67%
> > rename from meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
> > rename to meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.9.bb
> > index f854078004..2ef1682daa 100644
> > --- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
> > +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.9.bb
> > @@ -7,25 +7,26 @@ SECTION =3D "net"
> >  LICENSE =3D "MPL-2.0"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9741c346eef56131163e13b9db1=
241b3"
> >
> > -GTEST_VER =3D "1.15.2"
> > +GTEST_VER =3D "1.17.0"
> >  SRC_URI =3D "git://github.com/GENIVI/${BPN}.git;branch=3Dmaster;protoc=
ol=3Dhttps;name=3Dvsomeip \
> >             https://github.com/google/googletest/releases/download/v${G=
TEST_VER}/googletest-${GTEST_VER}.tar.gz;name=3Dgtest;subdir=3D${BB_GIT_DEF=
AULT_DESTSUFFIX}/ \
> >             file://0001-Fix-pkgconfig-dir-for-multilib.patch \
> >             file://0002-Install-example-configuration-files-to-etc-vsom=
eip.patch \
> > -           file://0004-Do-not-specify-PIE-flag-explicitly.patch \
> > -           file://0005-test-common-CMakeLists.txt-add-missing-link-wit=
h-dlt.patch \
> > +           file://0003-Do-not-specify-PIE-flag-explicitly.patch \
> > +           file://0004-Fix-build-with-boost-1.89.patch \
> > +           file://0005-Replace-address-from_string-with-make_address.p=
atch \
> > +           file://0006-Fix-scanning-64-bit-integer-types.patch \
> >            "
> >
> > -SRCREV =3D "6461369b3874c844642c9adaac9d1b7406794ab8"
> > -SRC_URI[gtest.sha256sum] =3D "7b42b4d6ed48810c5362c265a17faebe90dc2373=
c885e5216439d37927f02926"
> > +SRCREV =3D "bb35c97194d6a5f228d68d2b7dabbce67b28af1e"
> > +SRC_URI[gtest.sha256sum] =3D "65fab701d9829d38cb77c14acdc431d2108bfdbf=
8979e40eb8ae567edf10b27c"
> >
> >  COMPATIBLE_HOST:mips =3D "null"
> >  COMPATIBLE_HOST:mips64 =3D "null"
> >  COMPATIBLE_HOST:powerpc =3D "null"
> >  COMPATIBLE_HOST:libc-musl =3D 'null'
> >
> > -DEPENDS =3D "boost dlt-daemon googletest"
> > -
> > +DEPENDS =3D "boost dlt-daemon"
> >
> >  inherit cmake pkgconfig
> >
> > @@ -43,9 +44,10 @@ EXTRA_OECMAKE +=3D "-DTEST_IP_MASTER=3D10.0.3.1 \
> >
> >  RDEPENDS:${PN}-test =3D "bash lsof"
> >
> > -do_compile:append() {
> > -    cmake_runcmake_build --target examples
> > -    cmake_runcmake_build --target build_tests
> > +OECMAKE_TARGET_COMPILE +=3D "vsomeip_ctrl examples build_tests"
> > +
> > +do_compile:prepend() {
> > +    sed -i -e 's#${S}/build#/opt/${PN}-test#g' ${S}/test/unit_tests/se=
curity_policy_manager_impl_tests/policy_manager_impl_unit_test_macro.hpp
> >  }
> >
> >  do_install:append() {
> > @@ -58,13 +60,17 @@ do_install:append() {
> >      install -d ${D}/opt/${PN}-test/test/test/common
> >      cp -rf ${S}/test/common/examples_policies \
> >          ${D}/opt/${PN}-test/test/test/common/
> > +
> > +    install -d ${D}/opt/${PN}-test/test/common
> >      install -m 0755 ${B}/test/common/libvsomeip_utilities.so \
> > -        ${D}/opt/${PN}-test/test/test/common/
> > +        ${D}/opt/${PN}-test/test/common/
> >
> >      for d in unit_tests network_tests; do
> >          install -d ${D}/opt/${PN}-test/test/$d
> >          cp -rf ${B}/test/$d/*_tests ${D}/opt/${PN}-test/test/$d
> > +        find ${D}/opt/${PN}-test/test/$d -maxdepth 2 \( -name "*.cmake=
" -o -name "CMakeFiles" \) -exec rm -rf {} \;
> >      done
> > +    sed -i -e 's#../..${B}#/opt/${PN}-test#g' ${D}/opt/${PN}-test/test=
/network_tests/lazy_load_tests/vsomeip/vsomeip_policy_extensions.json
> >  }
> >
> >  PACKAGES +=3D "${PN}-test"
> > @@ -75,4 +81,5 @@ FILES:${PN}-dbg +=3D " \
> >  FILES:${PN}-test =3D " \
> >     /opt/${PN}-test \
> >     "
> > -SKIP_RECIPE[vsomeip] ?=3D "Does not work with boost >=3D 1.87"
> > +
> > +INSANE_SKIP +=3D "32bit-time"
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#121298): https://lists.openembedded.org/g/openembed=
ded-devel/message/121298
> > Mute This Topic: https://lists.openembedded.org/mt/116118192/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

