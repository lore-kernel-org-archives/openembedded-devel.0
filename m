Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.6135.1595281241981655745
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 14:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MPXtKoXm;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id m8so8350545qvk.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2020 14:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/3kgehz+jlJJEuxr2TdoocQ/9x3ZRW5cI6/OGrq/V1U=;
        b=MPXtKoXmFvMsDZDTFkoqXIL5ulxPSWcmS0jFIkcHVT1hQKJ26d+fQk9y2/IpuZdcH1
         kv1ay1CWu+pcxnCuYoi1bkozKsKKglzv7XWP1rzqCBsVHHosKLJ+M5bzeQJtuHNsvF+Q
         GJfrTUjwZhDwj2E/qJlE0OjmP8+6adq8dv90VEf6a9dHHN86uO/0tYxdYVTEjCWAqltd
         JcU9Mw2/K7lNW0mHWYVWjzvjBnN0yf80PLr0Fv3N+pMDgYY3PFfcvlTMKXWBs2r75u84
         rqBVJpcY4yAbFFmgRQLfLViO3Ow57uR7iXZ7C5cqlqk0QgCm8y6Ez8PXhAC1X3LM5uVk
         +3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/3kgehz+jlJJEuxr2TdoocQ/9x3ZRW5cI6/OGrq/V1U=;
        b=pujOSBpFmN/2uRs2BoQakg17tdNPBcD+0IAI7VGNDYM/JLpDEyLFIiaPzZ983NbUSm
         bk1DykYb9vFCEEZ1OwdOJSZVQAyiQwmR56Ne4h5hFR0Ps3o0HCcSqLJlXjU+SFO+q+DT
         C/evmAxBGtxt30t3OwSFbRH0jVmXzC82jKeXmXMBUuH2Dy2RudaFY+R7b6lz1/U9450r
         snBvwwMeOy7CLDMBsOxKOzAGd+pATzkzBgqzOZJQ36WSA0xzeD0quFWbW+JmIVDy41vO
         ya1W28iqjBJQRoanI+k/4FWR+rz7lrcPatVca0t5yO8vMyO78Aacvvnm7cjdIghqrPRP
         iLkA==
X-Gm-Message-State: AOAM530++1PJALarzT6hi8hlH0bZrLviuIibbZphjlY3VAXxWB99NhkQ
	nS5117Yr38lv9zVoS/v1B4hwlpwCy92WEMY1OW8=
X-Google-Smtp-Source: ABdhPJzGfiPx9GNAtkPwFbeIw17ZuuIQViBzHGY2luG5HPNB1EZzj3ECC1CLWPybUzCYqMAn9m+faTxtZKQFyyufM/k=
X-Received: by 2002:a0c:f385:: with SMTP id i5mr24233347qvk.4.1595281241036;
 Mon, 20 Jul 2020 14:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200717205956.131825-1-joe.slater@windriver.com>
In-Reply-To: <20200717205956.131825-1-joe.slater@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Jul 2020 14:40:15 -0700
Message-ID: <CAMKF1so2eu6NJA3nfX6=96dF5NX7orT-wmdHEn5HJCGoMtwPrg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] lvm2: reproducible binaries
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 17, 2020 at 2:00 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> For reproducible binaries, create a static CONFIGURE_LINE
> during configuration rather than reporting the command line
> invoking configure.
>

is there any downside of applying this patch without conditional
dependency on reproducible builds ?
what do we lose ?

> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../lvm2/files/reproducible-build.patch            | 24 ++++++++++++++++++++++
>  meta-oe/recipes-support/lvm2/lvm2.inc              |  2 ++
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-support/lvm2/files/reproducible-build.patch
>
> diff --git a/meta-oe/recipes-support/lvm2/files/reproducible-build.patch b/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
> new file mode 100644
> index 0000000..db598a8
> --- /dev/null
> +++ b/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
> @@ -0,0 +1,24 @@
> +configure.ac:  override CONFIGURE_LINE
> +
> +For reproducible binaries, we need to report a constant CONFIGURE_LINE.
> +This patched is only applied for such builds.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +
> +--- git.orig/configure.ac
> ++++ git/configure.ac
> +@@ -15,7 +15,10 @@ AC_PREREQ(2.69)
> + ################################################################################
> + dnl -- Process this file with autoconf to produce a configure script.
> + AC_INIT
> +-CONFIGURE_LINE="$0 $@"
> ++dnl The default CONFIGURE_LINE has been overridden for reproducible binaries
> ++dnl CONFIGURE_LINE="$0 $@"
> ++CONFIGURE_LINE="configure parameters are not available for reproducible builds"
> ++
> + AC_CONFIG_SRCDIR([lib/device/dev-cache.h])
> + AC_CONFIG_HEADERS([include/configure.h])
> +
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
> index 01c9df4..ab618b4 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -15,7 +15,9 @@ SRC_URI = "git://sourceware.org/git/lvm2.git \
>             file://0001-Avoid-bashisms-in-init-scripts.patch \
>             file://0005-do-not-build-manual.patch \
>             file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
> +           ${@bb.utils.contains('BUILD_REPRODUCIBLE_BINARIES','1','file://reproducible-build.patch','', d)} \
>             "
> +
>  SRCREV = "b9391b1b9f0b73303fa21f8f92574d17ce4c2b02"
>  S = "${WORKDIR}/git"
>
> --
> 2.7.4
>
> 
