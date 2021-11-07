Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2660C433F5
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 07:26:42 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.28655.1636270001824178825
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Nov 2021 00:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y6J/lCcZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id br39so12765669qkb.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Nov 2021 00:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CF2guCb9av49TAdpPje1gsvXlsag0auoceWauv+PyVE=;
        b=Y6J/lCcZHGQY9T35bK88HnIUEiEL9F9YVbH31rTWF1CFqA/cGh3lO2C+7VEtgetMWL
         n7DYCakvkPwIKcCsYKn7VRcNNM/H4Xuv0SmpJCXgThf0GptqhpLJQ00wXP0JKf3W4+0C
         fYOywEVzXEw0YdXijhkBPxvPaG88/FN2WHwJFKwlOP+cQDJlODS8RUYdpuaFL3kmc9dj
         eKU1TmzSNAWm+aEnakTSgIiAW4f0IGM4tgod2+Sg2SkaW7DKV+oXEmY/n0ZwjczRzVv1
         Dj19KI7txC0/4H9jjwhZLDZDYLvHrEBr5Va0zZ5SsImcxn8RWXU13tZ09kcMcktqQum1
         c6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CF2guCb9av49TAdpPje1gsvXlsag0auoceWauv+PyVE=;
        b=iqbJdU9qEa0KS62elzwRCKMjwHChk/pfzh6bE3M91nl8ucm1OkWPAKZLXm9JUi0ojG
         6VGpRpobLYjmS00K+gIAE+zNI4Pyn4cIR37w8t7aW95gnKB6k+7BSmH0QA6FJlSvjw7i
         9xudwnivFx9yH/E5DQsLdA7+mVnJxyMykIl3yedxxlDsCdyO9gVIwx3frQH5L8LRSFpd
         DUqLGkLiNuoAShqOFV2e1mFCut2hgQuFMPbZsQ6n4GkER3QhNlU458ztJ6cb8S4e+/KR
         2Egl5XexHUozcF4vqrci7hl/eHFtYJ3hU9TgmsUYhXYexWW0oeWClPQ8R6oF053TscnI
         6Adg==
X-Gm-Message-State: AOAM531W2hD2+Son42FoxD91nosh/etPSerpn+lpXh+XTXt6l5GsoubX
	h/6yE0VYWUWW3weadXF4FgEGHbjFWECgrtTnQHVlYvUppLQ=
X-Google-Smtp-Source: 
 ABdhPJxOXCXLRXsWsXs7n4dTHNuLVtHMPMHi1Qwv/m8facY+mH3kHGrB8Fd5JyjAFYrKdO8RstDztR20grhqjEnhGu4=
X-Received: by 2002:a05:620a:200f:: with SMTP id
 c15mr16657667qka.231.1636270000394;
 Sun, 07 Nov 2021 00:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211105143346.3561300-1-ross.burton@arm.com>
In-Reply-To: <20211105143346.3561300-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Nov 2021 00:26:14 -0700
Message-ID: 
 <CAMKF1srV4wLNXzWDkXY3d3gD2jo9xYCORYqQPFNNztZsQoNW2g@mail.gmail.com>
Subject: Re: [oe] [PATCH] fwupd-efi: add new recipe
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Nov 2021 07:26:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93863

it fails with clang/x86 see

https://errors.yoctoproject.org/Errors/Details/616512/

On Fri, Nov 5, 2021 at 7:33 AM Ross Burton <ross@burtonini.com> wrote:
>
> This is the EFI executable that is used by fwupd when building EFI
> capsules.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch | 53 ++++++++++++++++++++
>  meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb   | 31 ++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
>  create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb
>
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch b/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
> new file mode 100644
> index 0000000000..ac345f2752
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
> @@ -0,0 +1,53 @@
> +Change the efi-cc argument to take an array, so that we can pass compiler flags
> +such as --sysroot.
> +
> +In the long term changing the fwupd-efi build to use the standard Meson
> +CC/LD/etc would be the preferred fix.
> +
> +Upstream-Status: Inappropriate [better fix in progress]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/efi/generate_sbat.py b/efi/generate_sbat.py
> +index e42b365..4831a48 100755
> +--- a/efi/generate_sbat.py
> ++++ b/efi/generate_sbat.py
> +@@ -7,6 +7,7 @@
> + #
> + # pylint: disable=missing-docstring, invalid-name
> +
> ++import shlex
> + import subprocess
> + import sys
> + import argparse
> +@@ -19,7 +20,7 @@ def _generate_sbat(args):
> +     FWUPD_URL = "https://github.com/fwupd/fwupd"
> +
> +     subprocess.run(
> +-        [args.cc, "-x", "c", "-c", "-o", args.outfile, "/dev/null"], check=True
> ++        shlex.split(args.cc) + ["-x", "c", "-c", "-o", args.outfile, "/dev/null"], check=True
> +     )
> +
> +     # not specified
> +diff --git a/efi/meson.build b/efi/meson.build
> +index 68ea4aa..dcf0d43 100644
> +--- a/efi/meson.build
> ++++ b/efi/meson.build
> +@@ -184,7 +184,7 @@ o_file5 = custom_target('fwup-sbat.o',
> +                         command : [
> +                           join_paths(meson.current_source_dir(), 'generate_sbat.py'),
> +                           '@OUTPUT@',
> +-                          '--cc', efi_cc,
> ++                          '--cc', ' '.join(efi_cc),
> +                           '--objcopy', efi_objcopy,
> +                           '--project-name', meson.project_name(),
> +                           '--project-version', meson.project_version(),
> +diff --git a/meson_options.txt b/meson_options.txt
> +index d869cd2..17ef7fb 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -1,4 +1,4 @@
> +-option('efi-cc', type : 'string', value : 'gcc', description : 'the compiler to use for EFI modules')
> ++option('efi-cc', type : 'array', value : ['gcc'], description : 'the compiler to use for EFI modules')
> + option('efi-ld', type : 'string', value : 'ld', description : 'the linker to use for EFI modules')
> + option('efi-objcopy', type : 'string', value : 'objcopy', description : 'the objcopy utility to use for EFI modules')
> + option('efi-libdir', type : 'string', description : 'path to the EFI lib directory')
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb
> new file mode 100644
> index 0000000000..f3c4a7a3b7
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "EFI executable for fwupd"
> +LICENSE = "LGPL-2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main \
> +           file://cc.patch"
> +SRCREV = "fee1b8f6473cb403b8ae7a56961ba0557e3f3efa"
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "gnu-efi"
> +
> +COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
> +
> +inherit meson
> +
> +# These should be configured as needed
> +SBAT_DISTRO_ID ?= "${DISTRO}"
> +SBAT_DISTRO_SUMMARY ?= "${DISTRO_NAME}"
> +SBAT_DISTRO_URL ?= ""
> +
> +EXTRA_OEMESON += "-Defi-cc="${@meson_array('CC', d)}" \
> +                  -Defi-ld='${HOST_PREFIX}ld' \
> +                  -Defi-objcopy='${OBJCOPY}' \
> +                  -Defi-includedir=${STAGING_INCDIR}/efi \
> +                  -Defi-libdir=${STAGING_LIBDIR} \
> +                  -Defi_sbat_distro_id='${SBAT_DISTRO_ID}' \
> +                  -Defi_sbat_distro_summary='${SBAT_DISTRO_SUMMARY}' \
> +                  -Defi_sbat_distro_url='${SBAT_DISTRO_URL}' \
> +                  -Defi_sbat_distro_pkgname='${PN}' \
> +                  -Defi_sbat_distro_version='${PV}'\
> +                  "
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93844): https://lists.openembedded.org/g/openembedded-devel/message/93844
> Mute This Topic: https://lists.openembedded.org/mt/86841724/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

