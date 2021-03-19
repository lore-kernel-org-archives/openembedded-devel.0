Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web09.119.1616115740240285213
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 18:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TGr1E7pn;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id x16so4248579qvk.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 18:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2dLua1vG12V9LoErGHi8gAgnKRbXRjM60fdYskPb3sc=;
        b=TGr1E7pn4K8XFO91O5ouBaRm0wgGhaKK2z6QnaxFwFI+U6gNbv9kOd+gEJfnLubMm9
         SQBJhGdMc7plYelHybI9xLsZDHSm7VLVTJthe/AXtr76Tc4edoNyPU4f9lw08xTn9EAO
         SVSx/R81Dy9371rq/ltzsI0rchom0qZGBo3dZYKQwiS5sOu4OUoaiIuM99vi5qKudOD2
         GPWlcH0bMEMu3Ug36+j0+jrwEtyWsrsYOAa67J3ZFNsG/qD/zcR60kRCZo/rWssJ4pCx
         8i6icUfUdfZ5ZK2CLH/rtZmlP+ZpVQr0Kz3Fw+cW71zONq0Q3tt0DNBabDKn3aoZ0ehJ
         WWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2dLua1vG12V9LoErGHi8gAgnKRbXRjM60fdYskPb3sc=;
        b=egFYHhyPd3UQwgReAcnqnFV/9J3iu1WyU/iy0t+xuHrCk2JBFHtAvienXNy/rGHTG+
         ZvxfzdvzyGUg8iDo8grdtRINLXfE/XY9SOS42xPSS/cHdvlX5WsUZxN6+gDwSqMPagny
         IJKo96A4Zc74BD7otZX8BotseD429Nu8kYhlerMB06/xhG8TEXQQcS/fMXknSQiXP7b2
         /md/O11sU5/O+dx5e9MySYBvJsKSZla0rFEnXg9icgcm/syrOpo9CHF/oXekdup9edaX
         4MG1ZqXMlOXRMbwRrVu/WQqmakn+oqO5su/XRcaQOfgNgBgv4R8qeikH/jPN5raPVolf
         Xcfg==
X-Gm-Message-State: AOAM530OongpGQ+3jTP72Ym6T2Sn6mIYCBvwPfTISAu7j5pb+dw/tCLp
	rkgObJstTdWvYvjRmxgwT+zWnLpf5n0rdnbM56A=
X-Google-Smtp-Source: ABdhPJxDWB3Kl0+yEnOwQjkpkmOuIP89L99WID6hZBWw/r85uTydJFt6Hs9PHvRCSogPya7Ui+q4gYfkSzWAL/UxgJo=
X-Received: by 2002:a0c:fe0c:: with SMTP id x12mr6893719qvr.16.1616115739223;
 Thu, 18 Mar 2021 18:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAKx8PBi4bXBoV_rfXfEPGwa4k52rONdG=s1kBat23+EH47aXXw@mail.gmail.com>
In-Reply-To: <CAKx8PBi4bXBoV_rfXfEPGwa4k52rONdG=s1kBat23+EH47aXXw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 18 Mar 2021 18:01:53 -0700
Message-ID: <CAMKF1soa2R_5NnvP1KJm3bTVuaJK9dHNdmvmCg=M4=-ECA72CA@mail.gmail.com>
Subject: Re: [oe] Backport openocd changes to dunfell
To: Ben Magistro <koncept1@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

please send a patch for dunfell backport as needed and CC Armin

On Thu, Mar 18, 2021 at 5:35 PM Ben Magistro <koncept1@gmail.com> wrote:
>
> While porting another project to Dunfell, I found it necessary to update openocd.  The changes have already been applied to master.
>
>
> See:
>  * https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg70813.html
>  * http://git.openembedded.org/meta-openembedded/commit/?id=0a27b0840f57d64cab091c9a0681582832d72c2d
>  * http://git.openembedded.org/meta-openembedded/commit/?id=64bc3a36e4a36f16596c2f6e83998c8dccd717a6
>
>
> I believe the patch below incorporates all of the relevant changes from the above commits to a single patch:
> ```
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
> index e95f1cfa5..05e06a25d 100644
> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> @@ -9,14 +9,13 @@ SRC_URI = " \
>      git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl \
>      git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
>      git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
> -    file://0001-Do-not-include-syscrtl.h-with-glibc.patch \
>  "
>
>  SRCREV_FORMAT = "openocd"
> -SRCREV_openocd = "ded67990255cc1e63c77832ffd6e6bef9120873d"
> +SRCREV_openocd = "d46f28c2ea2611f5fbbc679a5eed253d3dcd2fe3"
>  SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
> -SRCREV_jimtcl = "dc4ba7770d580800634f90b67a24e077b4a26d98"
> -SRCREV_libjaylink = "cfccbc9d6763733f1d14dff3c2dc5b75aaef136b"
> +SRCREV_jimtcl = "0aa0fb4e3a38d38a49de9eb585d93d63a370dcf6"
> +SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
>
>  PV = "0.10+gitr${SRCPV}"
>  S = "${WORKDIR}/git"
> @@ -55,3 +54,6 @@ FILES_${PN} = " \
>  PACKAGECONFIG[sysfsgpio] = "--enable-sysfsgpio,--disable-sysfsgpio"
>  PACKAGECONFIG[remote-bitbang] = "--enable-remote-bitbang,--disable-remote-bitbang"
>  PACKAGECONFIG ??= "sysfsgpio remote-bitbang"
> +
> +# Can't be built with ccache
> +CCACHE_DISABLE = "1"
> ```
>
>
> 
>
