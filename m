Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68904C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 13:39:58 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.38199.1656682794271555352
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eAjIo48S;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id u7so4126749qvm.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AcZ4CH0t+RtLKKZLT6WmNrEr1ophhRphKkUBDquljjM=;
        b=eAjIo48SMJT2Yep+JgFeI/lnJIMc8sPZ9RZxXig6cjL56e/DhlhiO6zeLUAf24QSOs
         2DlURYjT4gW+tuHWG35ukd9zSG1/dEQW1QFteb2laQsxC+QarJo6vHpA6wOCM/HkR7YY
         Km7yb/W5fuZqxaEPTyLGBBbYLnbvdwOcSb7A9GDsi9szlRLCRkqtLJLKe6nXxugWTv2W
         k2JQDUY8DcgL+haFWWYtL2fCDUb87gWvh+ZO1dXCyczlB7UhV/AeZmGu9wYrLICeEv8E
         RFITfVN53/3Xwk6ihYeG/nqXDnUZ6JwgpqfV5es7GX40bbGACoWh4E1Ao+Zd4jk25cIQ
         KU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AcZ4CH0t+RtLKKZLT6WmNrEr1ophhRphKkUBDquljjM=;
        b=sGbSnk8Lcq/VWNIy1brWIs+gkSb8Pwg20K9m1LAtudwYNOdGQVySsZV+QMkajZCJiH
         QTTODNORvWtRqRg426NdnmDYWf4rdtYttiPwF7BGUQl1p+lZWbJRBtWMRBvhKfPNpo2s
         FHqu6qC1TGoHaEVEuGgAC2a3rpZDf1jouynXQJF06hiinkEDgmvd+oy/KrcIgcd6HmEI
         PrbF8fjnGaNP1Sne1ZIu54F3I2ycs7phROfTBkPBgPI71QE+2dvvOMDZ+EP0tHJEybgt
         Dmildg63y4xX5zKhzWjgYhxpR/6oIDlhMITqTsy39tGfh8f6ilGusSqDTXmIfqJVOifQ
         +XEg==
X-Gm-Message-State: AJIora/sLjnZzQ3rgpMEaK6yoSssmf9SDjzbrI6qWMNcpPUPhr+uDKU8
	3TeEFIpMrQZVTtbvFCg702mbd0ll/+DAJzdBpE4=
X-Google-Smtp-Source: 
 AGRyM1sdNW2jl/XmT3rLCyvrRwHP2kMo7Y5Egp17vtU+SJJqJf1EzPrEsy3d/FUPGmQtvLQ6+sibPpM/UvI46NgJago=
X-Received: by 2002:a05:6214:509a:b0:470:4c7f:99d with SMTP id
 kk26-20020a056214509a00b004704c7f099dmr17140301qvb.36.1656682793191; Fri, 01
 Jul 2022 06:39:53 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20220630151556.165249-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
In-Reply-To: 
 <20220630151556.165249-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2022 09:39:26 -0400
Message-ID: 
 <CAMKF1soaMn9esK2gUao96i4Ghnsxp9_hQ-Dru-e85FOpOABKtA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-debugpy: add recipe
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Tim Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 13:39:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97670

fails in QA checks

https://errors.yoctoproject.org/Errors/Details/659231/

On Thu, Jun 30, 2022 at 11:16 AM Enguerrand de Ribaucourt
<enguerrand.de-ribaucourt@savoirfairelinux.com> wrote:
>
> debugpy provides an implementation of the Debug Adapter Protocol for
> Python 3.
>
> It is for instance compatible with the VSCode Python remote debugger
> extension.
>
> Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
> ---
>  ...se-generic-yocto-architecture-suffix.patch | 64 +++++++++++++++++++
>  .../python/python3-debugpy_1.6.0.bb           | 40 ++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-debugpy/0001-arch-use-generic-yocto-architecture-suffix.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-debugpy_1.6.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-debugpy/0001-arch-use-generic-yocto-architecture-suffix.patch b/meta-python/recipes-devtools/python/python3-debugpy/0001-arch-use-generic-yocto-architecture-suffix.patch
> new file mode 100644
> index 000000000..0a58b39fa
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-debugpy/0001-arch-use-generic-yocto-architecture-suffix.patch
> @@ -0,0 +1,64 @@
> +From f6552b6d3cef48401188fcacd8718f9268493608 Mon Sep 17 00:00:00 2001
> +From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
> +Date: Thu, 30 Jun 2022 14:51:36 +0200
> +Subject: [PATCH] arch: use generic yocto architecture suffix
> +
> +A precompiled attach_linux_<arch>.so library comes for only a limited
> +number of architectures in debugpy. We have to compile it for the
> +others.
> +
> +Yocto may use the TARGET_ARCH suffix but it will be different than what is
> +returned at runtime by Python's platform.machine(). Ex: core2-64/amd64.
> +This makes it hard to match the names used to generate and load the
> +library.
> +
> +We ease the process of matching both by using a generating "yocto"
> +suffix.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
> +---
> + .../pydevd_attach_to_process/add_code_to_python_process.py   | 5 ++---
> + src/debugpy/_vendored/pydevd/pydevd_tracing.py               | 5 ++---
> + 2 files changed, 4 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/debugpy/_vendored/pydevd/pydevd_attach_to_process/add_code_to_python_process.py b/src/debugpy/_vendored/pydevd/pydevd_attach_to_process/add_code_to_python_process.py
> +index 3c0e1b94..4c7d4b46 100644
> +--- a/src/debugpy/_vendored/pydevd/pydevd_attach_to_process/add_code_to_python_process.py
> ++++ b/src/debugpy/_vendored/pydevd/pydevd_attach_to_process/add_code_to_python_process.py
> +@@ -171,8 +171,8 @@ def get_target_filename(is_target_process_64=None, prefix=None, extension=None):
> +     elif IS_LINUX:
> +         if not extension:
> +             extension = '.so'
> +-        suffix_64 = 'amd64'
> +-        suffix_32 = 'x86'
> ++        suffix_64 = 'yocto'
> ++        suffix_32 = 'yocto'
> +
> +     elif IS_MAC:
> +         if not extension:
> +@@ -577,4 +577,3 @@ if __name__ == '__main__':
> +             test()
> +         else:
> +             main(args)
> +-
> +diff --git a/src/debugpy/_vendored/pydevd/pydevd_tracing.py b/src/debugpy/_vendored/pydevd/pydevd_tracing.py
> +index 561d7f71..7acbf3e1 100644
> +--- a/src/debugpy/_vendored/pydevd/pydevd_tracing.py
> ++++ b/src/debugpy/_vendored/pydevd/pydevd_tracing.py
> +@@ -157,8 +157,8 @@ def get_python_helper_lib_filename():
> +
> +     elif IS_LINUX:
> +         extension = '.so'
> +-        suffix_64 = 'amd64'
> +-        suffix_32 = 'x86'
> ++        suffix_64 = 'yocto'
> ++        suffix_32 = 'yocto'
> +
> +     elif IS_MAC:
> +         extension = '.dylib'
> +@@ -372,4 +372,3 @@ def set_trace_to_threads(tracing_func, thread_idents=None, create_dummy_thread=T
> +                     ret = result
> +
> +     return ret
> +-
> diff --git a/meta-python/recipes-devtools/python/python3-debugpy_1.6.0.bb b/meta-python/recipes-devtools/python/python3-debugpy_1.6.0.bb
> new file mode 100644
> index 000000000..1fe238169
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-debugpy_1.6.0.bb
> @@ -0,0 +1,40 @@
> +SUMMARY = "An implementation of the Debug Adapter Protocol for Python 3"
> +LICENSE = "MIT & EPL-1.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=18496e0e5a38c5caaade8503120ef9ea \
> +                    file://src/debugpy/_vendored/pydevd/LICENSE;md5=30b3836521b3d65bef598bbc358a3afa \
> +                    file://src/debugpy/_vendored/pydevd/_pydevd_frame_eval/vendored/bytecode-0.13.0.dev0.dist-info/COPYING;md5=0b470642172a83f6cf504fba28bac72f"
> +SRCREV = "2ac9538dd5d59d0bb582d445e4a6b87663cfbab4"
> +
> +SRC_URI = "git://git@github.com/microsoft/debugpy.git;protocol=ssh;branch=main \
> +           file://0001-arch-use-generic-yocto-architecture-suffix.patch \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +EXTRA_CXXFLAGS += "-fPIC -nostartfiles"
> +
> +do_compile:append() {
> +    ${CC} -o ${S}/src/debugpy/_vendored/pydevd/attach_linux_yocto.so ${S}/src/debugpy/_vendored/pydevd/pydevd_attach_to_process/linux_and_mac/attach.cpp ${CXXFLAGS} ${EXTRA_CXXFLAGS} ${LDFLAGS} -shared
> +}
> +do_install:append() {
> +    install -m 0755 ${S}/src/debugpy/_vendored/pydevd/attach_linux_yocto.so ${D}${libdir}/${PYTHON_DIR}/site-packages/debugpy/_vendored/pydevd/pydevd_attach_to_process/
> +}
> +
> +RDEPENDS:${PN}:append = " \
> +    gdb \
> +    python3-core \
> +    python3-ctypes \
> +    python3-distutils \
> +    python3-io \
> +    python3-json \
> +    python3-math \
> +    python3-misc \
> +    python3-multiprocessing \
> +    python3-numbers \
> +    python3-pickle \
> +    python3-setuptools \
> +    python3-unixadmin \
> +    python3-xmlrpc \
> +"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97640): https://lists.openembedded.org/g/openembedded-devel/message/97640
> Mute This Topic: https://lists.openembedded.org/mt/92088550/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

