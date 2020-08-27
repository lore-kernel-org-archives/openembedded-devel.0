Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.13581.1598511835839876891
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 00:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c1TCna7R;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id p4so5048668qkf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2020 00:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SAx8yYZMzLGWAuZ8inpBavB7V7T9UH9R4qhaFLZ5gig=;
        b=c1TCna7Rw4ZkVphH2DsIYXOqsPJdLXXBaiDZXfzi09+Xj1Mm9XuMpt0WFiDtL64iXV
         BHag+7l48v1wfVLnmZrj5bMBHWkOsdTuEIvTdqf/gtL1aDFJr7M0aLEvUtYjTbJnbKX7
         1XksEex4rSYT/s9a5CUCrKWb0dr8qQ6JzpqFFBQR7vreoOysE/oQNrnUWGSC4+hKxeNO
         xu7L+uqvDBqt1PKecL4r386AjKeWyA4QgmLclEUrJKE3iIq4qABOw0DGCkaylYfjV9tE
         F8VefxN24JHMRy39kbiYv3fQxj9a23/PTVzpWq2GFUFGpB4f5Evn6SFmML2BB6x+pJBT
         DY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SAx8yYZMzLGWAuZ8inpBavB7V7T9UH9R4qhaFLZ5gig=;
        b=WnV/2uaf0k45J/MV8Fe2tycCoCuRKPbDnCz7thERz1maJw6Spm994eq10VIltR6Ikk
         fFBvgRhg59E5lAfa34VT0Rzvy45F0asZtKPXDv5Hds4WYtcU6+sWEVMxebbJsrvjGQ6l
         KGyl9whJjEidwYq+jVKvq74o3rM6rCMQ5adbGRe8QkaKPy51kyFyeENius66Twh4fSRa
         qzj34SRmx6hhyOrxLhaq+oGuobX046qIIdd3MNiFEau+aDfW2RaR1Oqiq2OMcd010SH9
         rDGK3GWO1/DJ0ONale9VOyAfl14Z2pyb7NfqDS5hmEB5kjrHvo54PYOztLgUu7aodr30
         Je2g==
X-Gm-Message-State: AOAM533yr8N9hHklVgZEA8QcyM9Udb36G+1UI3vHoWXmOznDAzfev6TI
	507FQGuUgEGgFMXKjqln5cgOTvKPAn1uQdzXlZgQalWOICKb/w==
X-Google-Smtp-Source: ABdhPJw5sBtefpDUxsOkcxVLGg0L0XKF4+W8icqjZgFuz6WllAYnLwcDD8EFwAtDAnsudF77bu+3nItsrf4WoFpbwJI=
X-Received: by 2002:a05:620a:48:: with SMTP id t8mr17679502qkt.474.1598511834816;
 Thu, 27 Aug 2020 00:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200827011803.26737-1-marc@cpdesign.com.au>
In-Reply-To: <20200827011803.26737-1-marc@cpdesign.com.au>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 27 Aug 2020 00:03:28 -0700
Message-ID: <CAMKF1srsA3njBCb0eBsZWn-YAk=v4q=nBfpL3dh6OTNwnUTqBQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][patch v2] openocd: Update to latest git version
To: Marc <marc@cpdesign.com.au>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This fails to apply patch during build see

https://errors.yoctoproject.org/Errors/Details/496922/

I would prefer a patch is tested before sending to ml otherwise mark
it untested so folks know.

On Wed, Aug 26, 2020 at 6:19 PM Marc <marc@cpdesign.com.au> wrote:
>
> The 0001-Do-not-include-sysctrl.h-with-glibc.patch is no longer needed,
> and is thus removed.
>
> Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
>
> # Conflicts:
> #       meta-oe/recipes-devtools/openocd/openocd_git.bb
> ---
>  ...-Do-not-include-syscrtl.h-with-glibc.patch | 33 -------------------
>  .../recipes-devtools/openocd/openocd_git.bb   |  7 ++--
>  2 files changed, 3 insertions(+), 37 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch
>
> diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch
> deleted file mode 100644
> index 618ce2689..000000000
> --- a/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From a763610719e7d7f6cdc45569b6fbfdb91bb7c87b Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 27 Jul 2019 14:30:08 -0700
> -Subject: [PATCH] Do not include syscrtl.h with glibc
> -
> -glibc 2.30 has deprecated it see [1]
> -Fixes
> -sys/sysctl.h:21:2: error: "The <sys/sysctl.h> header is deprecated and will be removed." [-Werror,-W#warnings]
> -
> -[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=744e829637162bb7d5029632aacf341c64b86990
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/helper/options.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/helper/options.c b/src/helper/options.c
> -index 12755e010..4007e37f6 100644
> ---- a/src/helper/options.c
> -+++ b/src/helper/options.c
> -@@ -34,7 +34,7 @@
> - #if IS_DARWIN
> - #include <libproc.h>
> - #endif
> --#ifdef HAVE_SYS_SYSCTL_H
> -+#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
> - #include <sys/sysctl.h>
> - #endif
> - #if IS_WIN32 && !IS_CYGWIN
> ---
> -2.22.0
> -
> diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> index c7d754fdb..b2a4033b4 100644
> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> @@ -9,15 +9,14 @@ SRC_URI = " \
>      git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl \
>      git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
>      git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
> -    file://0001-Do-not-include-syscrtl.h-with-glibc.patch \
>      file://0001-bitbang-Make-bitbang_swd-extern-definition.patch \
>  "
>
>  SRCREV_FORMAT = "openocd"
> -SRCREV_openocd = "ded67990255cc1e63c77832ffd6e6bef9120873d"
> +SRCREV_openocd = "d46f28c2ea2611f5fbbc679a5eed253d3dcd2fe3"
>  SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
> -SRCREV_jimtcl = "dc4ba7770d580800634f90b67a24e077b4a26d98"
> -SRCREV_libjaylink = "3322dfa5e7aa56f5b12b7f2197e3e6b850b7b66e"
> +SRCREV_jimtcl = "0aa0fb4e3a38d38a49de9eb585d93d63a370dcf6"
> +SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
>
>  PV = "0.10+gitr${SRCPV}"
>  S = "${WORKDIR}/git"
> --
> 2.26.2
>
> 
