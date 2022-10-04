Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FB2C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 07:56:46 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web12.8160.1664870203094521311
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Oct 2022 00:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O6pnK1Xt;
 spf=pass (domain: gmail.com, ip: 209.85.166.172,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id u2so1858528ilv.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Oct 2022 00:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vc+BRWU6SOl5xsOqVSktrt/aP7sa9xP1B02QJJBxMYI=;
        b=O6pnK1XtzHgz6hc/oGXN7pE9xicPjSMIurwV70X320VQ0AgnSF1wXjrS1GJwrPT+od
         HBwhTXI8Wy0i0YoyQ4Mi8GFfMuacSB/aH0Ij2UCWJNRvnAmhDx4QrVFi4pHgZaudNWX8
         0DjeP5FUTCLVddfb50Z1yHcrtp1t9lHO3XtsK2uuMlsT86pHyA2L9JlY9T8Nii4p/a2a
         bNsyK8VDUKouONROsW+aSwfEo/jYfcB14LDK1gO/HueTrLkqe8/cj43jhCXg1dxXdKiw
         cYapqdajaumfaJPt19xSlPxLCa9BsoDIiUUyLxWaJMvHiClQ9k19KaXBL32Rb5H+NCMb
         Sa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vc+BRWU6SOl5xsOqVSktrt/aP7sa9xP1B02QJJBxMYI=;
        b=F6goir/j/JpRyekQAdsDyVMW9G20wvv5H+h+7K6NaVudljO+xWvDESsUtm6gJ+x+/B
         UUEMYOVRkm0USIxONAEmUQ/vB3aIl4kl/bmPt+90Kzb0qwnHj1PGpLWS/7tAJP1XVJU6
         SRu4bH2mKGX4zWpl6+ocZ8Y3P5OIvQ3p/8qGduEcCtfv2BOIGtb20UdTUUaQyEMGJOMC
         oNt01nVGllGQgHd53MuzpWo1kqLy2NC9Q3JSGDw7cC8uxnPWueaJ6gVAYlpQRhpyP75R
         5mdmobEu5GQMl9O6lA6SMCvc4Q/L3hcnPpgPGk3XrmoyTktZRouK1f/F+K2tByqu5Gc7
         W4Tw==
X-Gm-Message-State: ACrzQf1knoGTSzvJoVu5ArVoqqrLkQDVcNAjQXY/R/36YL6f8L7ycKos
	fXactEXm1sGdvr7B+VcSwXQIGowAq9Psx1RyuVI=
X-Google-Smtp-Source: 
 AMsMyM79RAyLLbAPMKOy6Iysu3oorTfSqHzs7gobk4sN5HLbm2AT7BnmHWlA7WAE3rMFK4DDFikUZz6iVLydmnTaeyc=
X-Received: by 2002:a05:6e02:168c:b0:2f9:bae6:a4bf with SMTP id
 f12-20020a056e02168c00b002f9bae6a4bfmr4358928ila.241.1664870202330; Tue, 04
 Oct 2022 00:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221003170623.26207-1-alex.kiernan@gmail.com>
 <CAMKF1sqHAaDkmf1BqvXPNgwHzuW3_tt5hJg7WLt6gOgefOj7gg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqHAaDkmf1BqvXPNgwHzuW3_tt5hJg7WLt6gOgefOj7gg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 4 Oct 2022 08:56:31 +0100
Message-ID: 
 <CAO5Uq5QNeFZ1URNavPkZLcfnV2yutg=KorBHPnE4AvrUOv0hmA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] jansson: Honour multilib paths
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 07:56:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99057

Probably, only cmake scares me every time I have to touch it :) When I
was digging through all of this, I wondered if going back to autotools
would be preferable and fixing up the lld case (the --default-symver
test exists in CMakeLists.txt, but not configure.ac).

On Mon, Oct 3, 2022 at 10:37 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Should it be using GNUInstallDirs cmake module I wonder
>
> On Mon, Oct 3, 2022 at 10:06 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > When multilib is enabled, builds fail during package_qa:
> >
> > ERROR: jansson-2.14-r0 do_package: QA Issue: jansson: Files/directories were installed but not shipped in any package:
> >   /usr/lib
> >   /usr/lib/libjansson.a
> >   /usr/lib/pkgconfig
> >   /usr/lib/cmake
> >   /usr/lib/pkgconfig/jansson.pc
> >   /usr/lib/cmake/jansson
> >   /usr/lib/cmake/jansson/janssonTargets-noconfig.cmake
> >   /usr/lib/cmake/jansson/janssonConfig.cmake
> >   /usr/lib/cmake/jansson/janssonConfigVersion.cmake
> >   /usr/lib/cmake/jansson/janssonTargets.cmake
> > Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> > jansson: 10 installed and not shipped files. [installed-vs-shipped]
> > ERROR: jansson-2.14-r0 do_package: Fatal QA errors were found, failing task.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >  .../jansson/0001-Honour-multilib-paths.patch  | 63 +++++++++++++++++++
> >  .../recipes-extended/jansson/jansson_2.14.bb  |  4 +-
> >  2 files changed, 66 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch
> >
> > diff --git a/meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch b/meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch
> > new file mode 100644
> > index 000000000000..513d1094593a
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch
> > @@ -0,0 +1,63 @@
> > +From e66885e66a2ce7fd916933b12d1ba523a25141e4 Mon Sep 17 00:00:00 2001
> > +From: Alex Kiernan <alex.kiernan@gmail.com>
> > +Date: Mon, 3 Oct 2022 13:25:05 +0100
> > +Subject: [PATCH] Honour multilib paths
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > +---
> > + CMakeLists.txt | 14 +++++++-------
> > + 1 file changed, 7 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 39b9ad365f78..bf297e936a72 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -20,8 +20,8 @@ endif ()
> > +
> > + # Set some nicer output dirs.
> > + set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
> > +-set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
> > +-set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
> > ++set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
> > ++set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
> > + set(JANSSON_TEMP_DIR ${CMAKE_CURRENT_BINARY_DIR}/tmp)
> > +
> > + # Give the debug version a different postfix for windows,
> > +@@ -573,14 +573,14 @@ endif ()
> > + #
> > +
> > + # Allow the user to override installation directories.
> > +-set(JANSSON_INSTALL_LIB_DIR       lib CACHE PATH "Installation directory for libraries")
> > ++set(JANSSON_INSTALL_LIB_DIR       ${CMAKE_INSTALL_LIBDIR} CACHE PATH "Installation directory for libraries")
> > + set(JANSSON_INSTALL_BIN_DIR       bin CACHE PATH "Installation directory for executables")
> > + set(JANSSON_INSTALL_INCLUDE_DIR   include CACHE PATH "Installation directory for header files")
> > +
> > + if(WIN32 AND NOT CYGWIN)
> > +   set(DEF_INSTALL_CMAKE_DIR cmake)
> > + else()
> > +-  set(DEF_INSTALL_CMAKE_DIR lib/cmake/jansson)
> > ++  set(DEF_INSTALL_CMAKE_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/jansson)
> > + endif()
> > +
> > + set(JANSSON_INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation directory for CMake files")
> > +@@ -633,8 +633,8 @@ option(JANSSON_INSTALL "Generate installation target" ON)
> > + if (JANSSON_INSTALL)
> > +   install(TARGETS jansson
> > +           EXPORT janssonTargets
> > +-          LIBRARY DESTINATION "lib"
> > +-          ARCHIVE DESTINATION "lib"
> > ++          LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
> > ++          ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
> > +           RUNTIME DESTINATION "bin"
> > +           INCLUDES DESTINATION "include")
> > +
> > +@@ -644,7 +644,7 @@ if (JANSSON_INSTALL)
> > +   # Install the pkg-config.
> > +   install(FILES
> > +           ${CMAKE_CURRENT_BINARY_DIR}/jansson.pc
> > +-          DESTINATION lib/pkgconfig)
> > ++          DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
> > +
> > +   # Install the configs.
> > +   install(FILES
> > diff --git a/meta-oe/recipes-extended/jansson/jansson_2.14.bb b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
> > index 94bb99ab71a9..68e24c890726 100644
> > --- a/meta-oe/recipes-extended/jansson/jansson_2.14.bb
> > +++ b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
> > @@ -4,7 +4,9 @@ BUGTRACKER = "https://github.com/akheron/jansson/issues"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=afd92c4cfc08f4896003251b878cc0bf"
> >
> > -SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2"
> > +SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
> > +           file://0001-Honour-multilib-paths.patch \
> > +           "
> >  SRC_URI[sha256sum] = "fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9"
> >
> >  UPSTREAM_CHECK_URI = "https://github.com/akheron/${BPN}/releases"
> > --
> > 2.35.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#99040): https://lists.openembedded.org/g/openembedded-devel/message/99040
> > Mute This Topic: https://lists.openembedded.org/mt/94095620/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
Alex Kiernan

