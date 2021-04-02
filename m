Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.13747.1617354191774558271
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Apr 2021 02:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XyaZa7Ct;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id l6so3376640qtq.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Apr 2021 02:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5AbZF5tPzohdKkwK4P0VSKjzqcrw4NvYgWYo5AVQpbk=;
        b=XyaZa7Ct91kKxs1k9dY/WCNhzejGNnDJ73/TZh/K2suy7zuKIH0nv3lROlRPrhzxNE
         svfo7t2C5g2EUkrc7wJVLGeTHW36F/X6Mho/4cpuWEODEIn2EG+TBO5IdIvqUaoDLL0B
         uA9TcVEZyRY1fx0UgiDOLDHetO0NQ/cWMbkpxiAqC4N0uQdomBLmainu1VcwsihLX3oB
         t8H/wiEfUCCxuVygKoAoADgTNd6mFYdmwVSby+30+2RWzrRGvbpqIJRDazT7Cgf4XF2g
         CIPMG6kdHkKuA1FdnOonTprB6iUvaQHJ+bzjiv+vHbVV6fD6Qh6aKqqH2GhABdU9De8t
         wjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5AbZF5tPzohdKkwK4P0VSKjzqcrw4NvYgWYo5AVQpbk=;
        b=IPwTXO8T0zS5gwJfY97h9h2eFzAC1X1xBLUkTSRESV4HW+dNm4tHu7YBPAyjLVL+ob
         xyWl1Lo/nMOuttWo1cbTR3GMXM1ekdDlioq+y+pG462iGw9thASa82iNGHAZxXmtASq0
         oXtRsTE/Q4+L2qQ2UW8T+v6IRgSHGdUTqsJzjrJK3z9kQ8bYLDf0OjbeqO6tQ5E47Se1
         Lnul+iY4o3LUR01Z0Mt7Xq0m0X/o393M40pNXWFnVRApDa40g6nk7JiPmZx+PY2AUlOS
         Kf+nIMjY0jrNpmi72HL5W/C6lVQJT5p+Ydfo6JRBBnyz2SnsyZG6hTM8HD0zNfEcnS2b
         c99A==
X-Gm-Message-State: AOAM531S2Q/5RdwYe66i+WUDS2SU/yEgJ7hD+DxWHPobvJFxzDFvTF14
	aVGX98s/PvXQ/wwKFCLUaXueA2SBhv+shJp1YZc=
X-Google-Smtp-Source: ABdhPJzdy05L+qduxxL9CVoeX5YHInRvQorjHh/ej+TQP4banX2qM/tmRYTSE3ymlq1LvACGFtfiqbaA0rTpdRsRNAE=
X-Received: by 2002:ac8:7dce:: with SMTP id c14mr10699722qte.82.1617354190805;
 Fri, 02 Apr 2021 02:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <1617299739-4528-1-git-send-email-zangrc.fnst@fujitsu.com>
In-Reply-To: <1617299739-4528-1-git-send-email-zangrc.fnst@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 2 Apr 2021 02:02:44 -0700
Message-ID: <CAMKF1spEAY_Tev+NagyU4AZnhO+a=fu1hGk4-omaBykSigH+tQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v2] xterm: upgrade 366 -> 367
To: zangrc <zangrc.fnst@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

patch needs to be refreshed

i see

ERROR: xterm-367-r0 do_patch: Fuzz detected:

Applying patch 0001-Add-configure-time-check-for-setsid.patch
patching file configure
Hunk #1 succeeded at 5605 (offset 194 lines).
patching file configure.in
patching file main.c
Hunk #1 succeeded at 2903 (offset 35 lines).
Hunk #2 succeeded at 4074 (offset 34 lines).
patching file xtermcfg.hin
Hunk #1 succeeded at 95 with fuzz 1 (offset -1 lines).


The context lines in the patches can be updated with devtool:

    devtool modify xterm
    devtool finish --force-patch-refresh xterm <layer_path>

Don't forget to review changes done by devtool!

ERROR: xterm-367-r0 do_patch: QA Issue: Patch log indicates that
patches do not apply cleanly. [patch-fuzz]

On Wed, Mar 31, 2021 at 10:55 PM zangrc <zangrc.fnst@fujitsu.com> wrote:
>
> -License-Update: Copyright year updated to 2021.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>  .../recipes-graphics/xorg-app/{xterm_366.bb => xterm_367.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-graphics/xorg-app/{xterm_366.bb => xterm_367.bb} (89%)
>
> diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_366.bb b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
> similarity index 89%
> rename from meta-oe/recipes-graphics/xorg-app/xterm_366.bb
> rename to meta-oe/recipes-graphics/xorg-app/xterm_367.bb
> index 969159bc5..e0d3dcec1 100644
> --- a/meta-oe/recipes-graphics/xorg-app/xterm_366.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
> @@ -2,13 +2,13 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
>  SUMMARY = "xterm is the standard terminal emulator for the X Window System"
>  DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
>
> -LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=996b1ce0584c0747b17b57654cc81e8e"
> +LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=987de9787175385203a1ea2482246a17"
>
>  SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
>             file://0001-Add-configure-time-check-for-setsid.patch \
>            "
>
> -SRC_URI[sha256sum] = "858b2885963fe97e712739066aadc1baeba2b33a0016303a7fec7d38bc73bf6e"
> +SRC_URI[sha256sum] = "27f1a8b1c756e269fd5684e60802b545f0be9b36b8b5d6bdbc840c6b000dc51f"
>
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
> --
> 2.25.1
>
>
> 
>
