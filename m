Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B16BC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 18:47:29 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.43.1647542848282268852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 11:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q4s7upf0;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id i8so5131501qtx.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 11:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/HvleqS4GuHFqyc3BczkDzzrX1Io3ypojSsHMs2x4H8=;
        b=q4s7upf0rIvMktZZNU9lE4l7Q5ouJCqrrIGaBcSgX2JCIPiMDKISrYMGCJ14a3TE8y
         p5WbI3ORMD7ef5QwB/TPPe3yB2qYeL9M/ciP04Ni9t2dSQzEnQb5g1hR36InICZS5Jta
         lTk7AzOs8HmqJiY4KiP8Ptlp5kYTUdOjhIAfCvh9EJz1bliQYQH5UljoiwlLDi/HV1kw
         L8cY92Eqrm3vTh0C64xl7sR/q5Tmtu1hxFL+XX6kkJEupo8uRIdqSSCEW+Vgke/Ii+rD
         RA5lWc6D9dsvt4M3IrYt4JaJm37NWHkaZFKylb5jhcq6nU3Cp/StToddoJ0UnopMYR4j
         KctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/HvleqS4GuHFqyc3BczkDzzrX1Io3ypojSsHMs2x4H8=;
        b=5M4wSj2OEBZf5B/62EmdZw0yRYkKoHR742LhCzUWp9jDrrWLY66OwJyuVmRLSKpqDS
         Z0TCime4H8bVZKnaUB3dMDaIpLj1hD6U5bbQjpiuzQbb6nJ/YW5pRb9yyH+cyI9QvjgA
         MHN9nMpSIoh5QV/+rmN/LNTuYCiVNGI0Pxt294RfJtQxI/f2sFzBaKAblIvfL2G21PoY
         4ySUev1a2VQEgoGv6zSwp/iot26mo41w3LUjQGvyjBzFePfOWJebTHJQogrhEpML8vaT
         cAe/yRao1O3hz7o9R9lEtvPNI8KoEUFtOfjgcoxxh2H8CKsgpvWYZdc72vlv8FlkS8ZI
         awtA==
X-Gm-Message-State: AOAM531oEbmAEd3uQMi/d2Db3/li94mvhmYsghZIuAm7EGJ66/H+a33e
	AElcWDmmpLHCg+PTJ1uuZRua/etcf7QObP/Hrzo=
X-Google-Smtp-Source: 
 ABdhPJxpm1lwkkAJ95TojJfeSjiQpKAhI4rdQKRnECCOPB022UJQI3c1e/nNkTQi9ezdqsBje0kV8fQ/Y+HZxfgYYOQ=
X-Received: by 2002:ac8:7dd1:0:b0:2e1:c708:12fa with SMTP id
 c17-20020ac87dd1000000b002e1c70812famr4874311qte.532.1647542847236; Thu, 17
 Mar 2022 11:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220317165929.527418-1-f_l_k@t-online.de>
 <CAMKF1srPvMpDwWHBNOEW51_myVD_9VmYHFR_vQ2mjrU34_eJqQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srPvMpDwWHBNOEW51_myVD_9VmYHFR_vQ2mjrU34_eJqQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Mar 2022 11:47:01 -0700
Message-ID: 
 <CAMKF1spxY-T6k+MSh7+LpLSh7dcGqPz6usEDBJS4piYVNc2kxg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] perfetto: initial add commit
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 18:47:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96042

this fails for mips

https://errors.yoctoproject.org/Errors/Details/652008/

I think we need to link in libatomic here

LDFLAGS:append:mips = " -latomic"

or somesuch might be helpful.

On Thu, Mar 17, 2022 at 10:36 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Mar 17, 2022 at 10:01 AM Markus Volk <f_l_k@t-online.de> wrote:
> >
> > mesa 22.0.0 supports profiling GPU acceleration using google perfetto
> >
> > This adds a recipe for it
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  ...meson.build-add-pc-file-build-shared.patch | 45 +++++++++++++++++
> >  .../perfetto/libperfetto_24.2.bb              | 28 +++++++++++
> >  .../perfetto/perfetto_24.2.bb                 | 48 +++++++++++++++++++
> >  3 files changed, 121 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson.build-add-pc-file-build-shared.patch
> >  create mode 100644 meta-oe/recipes-devtools/perfetto/libperfetto_24.2.bb
> >  create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto_24.2.bb
> >
> > diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson.build-add-pc-file-build-shared.patch b/meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson.build-add-pc-file-build-shared.patch
> > new file mode 100644
> > index 000000000..46e3ec9ec
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson.build-add-pc-file-build-shared.patch
> > @@ -0,0 +1,45 @@
> > +From f70ed62ce4a42525c9738455966bec2ed9647568 Mon Sep 17 00:00:00 2001
> > +From: Markus Volk <f_l_k@t-online.de>
> > +Date: Thu, 17 Mar 2022 15:44:23 +0100
> > +Subject: [PATCH] meson.build: add pc file; build shared
> > +
> > +---
> > + meson.build | 11 ++++++++++-
> > + 1 file changed, 10 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 06015141c..74fe2348f 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -19,6 +19,7 @@
> > + project(
> > +     'perfetto',
> > +     ['c','cpp'],
> > ++    version : '24.2',
> > +     default_options: ['c_std=c99', 'cpp_std=c++11']
> > + )
> > +
> > +@@ -30,7 +31,7 @@ endif
> > +
> > + dep_threads = dependency('threads')
> > +
> > +-lib_perfetto = static_library(
> > ++lib_perfetto = shared_library(
> > +     'perfetto',
> > +     sources: 'sdk/perfetto.cc',
> > +     dependencies: dep_threads,
> > +@@ -43,3 +44,11 @@ dep_perfetto = declare_dependency(
> > +     link_with: lib_perfetto,
> > +     include_directories: inc_perfetto,
> > + )
> > ++
> > ++pkgconfig = import('pkgconfig')
> > ++pkgconfig.generate(
> > ++    libraries:    lib_perfetto,
> > ++    version:      meson.project_version(),
> > ++    filebase:     meson.project_name(),
> > ++    name:         meson.project_name(),
> > ++    description: 'Perfetto Tracing Tool')
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto_24.2.bb b/meta-oe/recipes-devtools/perfetto/libperfetto_24.2.bb
> > new file mode 100644
> > index 000000000..07b1a0b4b
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/perfetto/libperfetto_24.2.bb
> > @@ -0,0 +1,28 @@
> > +SUMMARY = "Perfetto - System profiling, app tracing and trace analysis"
> > +HOMEPAGE = "https://github.com/google/perfetto"
> > +BUGTRACKER = "https://github.com/google/perfetto/issues"
> > +LICENSE = "Apache-2.0"
> > +
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=f87516e0b698007e9e75a1fe1012b390"
> > +
> > +SRC_URI = " \
> > +       git://github.com/google/perfetto.git;protocol=https;branch=releases/v24.x \
> > +       file://0001-meson.build-add-pc-file-build-shared.patch \
> > +"
> > +
> > +S = "${WORKDIR}/git"
> > +PV = "24.2"
> > +SRCREV = "7cb228c16d69aee297a106ad3ccc7461fa0b8045"
> > +
> > +inherit meson
> > +
> > +do_install:append() {
> > +       install -d ${D}${includedir}
> > +       install -m 0664 ${S}/sdk/perfetto.h ${D}${includedir}
> > +}
> > +
> > +FILES:${PN} = "${includedir} ${libdir}"
> > +FILES:${PN}-dev = ""
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > +
> > diff --git a/meta-oe/recipes-devtools/perfetto/perfetto_24.2.bb b/meta-oe/recipes-devtools/perfetto/perfetto_24.2.bb
> > new file mode 100644
> > index 000000000..8b056df6b
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/perfetto/perfetto_24.2.bb
> > @@ -0,0 +1,48 @@
> > +SUMMARY = "Perfetto - System profiling, app tracing and trace analysis"
> > +HOMEPAGE = "https://github.com/google/perfetto"
> > +BUGTRACKER = "https://github.com/google/perfetto/issues"
> > +LICENSE = "Apache-2.0"
> > +
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=f87516e0b698007e9e75a1fe1012b390"
> > +
> > +SRC_URI = "git://github.com/google/perfetto.git;protocol=https;branch=releases/v24.x"
> > +
> > +DEPENDS = "gn-native ninja-native git-native curl-native"
> > +
> > +S = "${WORKDIR}/git"
> > +PV = "24.2"
> > +SRCREV = "7cb228c16d69aee297a106ad3ccc7461fa0b8045"
> > +
> > +inherit pkgconfig
> > +
> > +GN_ARGS = " \
> > +    build_with_chromium = false \
> > +    is_perfetto_build_generator = true \
> > +    perfetto_build_standalone = false \
> > +    perfetto_build_with_android = false \
> > +    perfetto_build_with_embedder = true \
> > +"
> > +
> > +
> > +OUTPUT_DIR = "out/Release"
> > +B = "${S}/${OUTPUT_DIR}"
> > +
> > +do_configure() {
> > +       cd ${S}
> > +       ./tools/install-build-deps
> > +       gn gen --args='${GN_ARGS}' "${OUTPUT_DIR}"
> > +}
> > +
> > +do_compile() {
> > +       ninja perfetto
> > +}
> > +
> > +do_install() {
> > +       install -d ${D}${bindir}
> > +       for bin in protoc perfetto ipc_plugin cppgen_plugin protozero_plugin; do
> > +               install -m 0755 ${B}/"$bin" ${D}${bindir}
> > +       done
> > +}
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > +do_configure[network] = "1"
>
> why is this needed ?
>
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#96040): https://lists.openembedded.org/g/openembedded-devel/message/96040
> > Mute This Topic: https://lists.openembedded.org/mt/89850216/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

