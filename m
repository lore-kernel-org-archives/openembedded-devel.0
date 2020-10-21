Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.14610.1603298173038055026
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 09:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iDjVnAHL;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id h140so3090571qke.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 09:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aHDpWpL5GCfdfCGAhVRVq5g2ta0EBUFvgRBDJkrzGME=;
        b=iDjVnAHLcK3TbRx00OvD2ij9seQS4FrOg3gXE83cIpTCIsdR5H7lw/TaPtLI0jMr2a
         aA5zv98G8lM5AvexkcDGl3gX8N52w6+NA1msvuL3mp+lj4KFEct9ZGm3Rd5FZZqfzHsL
         iUmRm2x5CSJu5uLqyi35NUnaBmKWQOJHpG+fGuUUdQF8EnH60/lFKFigSuHqa/75PDj/
         DwwORoM9miaKBAAH1pH6DWNxsYHTBA6yu8+2FTEc4siMG2eWP7QlEjG3vUwsBz60oivb
         m0nrwo96uSPjGqy4zN7HG8TjeVfpw+T+6KNYm2UucApDzqhWV4yo1EmFhXmQKh5vLpFE
         CV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aHDpWpL5GCfdfCGAhVRVq5g2ta0EBUFvgRBDJkrzGME=;
        b=kfA9h+6i+nZKQCPrx079ZUHkEMvS7FUrutQLwMpiiiYTCIa2eY0s3+1wGggUvZ+16B
         DGtLX3a6r6yUShpJx+UksTJY8loAtLk8SaYry21GNs/6M4B0iIpV40H33OpqTgECUhAv
         5NXpSL4EH289H6ATKc3S4qxXrdUIk/vchH5tos8OuYMzCFPo+zW1h2sGTFwUsHhpsOz9
         0UjG/6oEe7PNsu/rA2Az1ohIupVQTciPCrsI9kFU7NRnJTVnAePtiTQQWQh+Kg0zdzxE
         PufmY9b5/WOB9bVfYlk3S/mEr9l8nRyfE7P9xonuGYUudggzv55pFSW25zqP10llOhDQ
         3GuA==
X-Gm-Message-State: AOAM533ZZNK9e74POcKEWrKLtvAiH2wTfX0uQ/DCt7aZ+lu8Tutuvk2s
	I2PULuvqT+mY9Q4KoQ9tDfZNgo3AKocYqZT+MguOrLCgAUTh3A==
X-Google-Smtp-Source: ABdhPJwEDW8j16w0jaTKVdZN31GrNuvL2RzPgO9AK6Z4AnC/Kj6uvI5wzfTfGN+BEtpDWPzxdLbRQFk78iynpcQGmIQ=
X-Received: by 2002:a05:620a:c07:: with SMTP id l7mr4177135qki.9.1603298172106;
 Wed, 21 Oct 2020 09:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201021155656.2841020-1-luca.boccassi@gmail.com>
In-Reply-To: <20201021155656.2841020-1-luca.boccassi@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 21 Oct 2020 09:35:46 -0700
Message-ID: <CAMKF1sqRMAYcA950Mtw1zbK1VvsRMjLaQXi2qns5PoWRW_hcJQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Add recipe for fsverity-utils
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 21, 2020 at 8:57 AM Luca Bocassi <luca.boccassi@gmail.com> wrote:
>
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> Library and command-line tool to manage the fs-verity
> feature, introduced in Linux 5.4 and supported in ext4
> and f2fs filesystems.
>
> https://www.kernel.org/doc/html/latest/filesystems/fsverity.html
>
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  .../fsverity-utils/fsverity-utils_git.bb      | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_git.bb
>
> diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_git.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_git.bb
> new file mode 100644
> index 000000000..c0b6fc657
> --- /dev/null
> +++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_git.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "Userspace utilities for fs-verity"
> +DESCRIPTION = "fs-verity is a Linux kernel feature that does transparent \
> +on-demand integrity/authenticity verification of the contents of read-only \
> +files, using a hidden Merkle tree (hash tree) associated with the file. The \
> +mechanism is similar to dm-verity, but implemented at the file level rather \
> +than at the block device level."
> +HOMEPAGE = "https://www.kernel.org/doc/html/latest/filesystems/fsverity.html"
> +SECTION = "console"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
> +
> +PV = "1.2"

since its at a release lets use the version scheme in recipe name. So
call it fsverity-utils_1.2.bb
and remove setting PV above

Secondly, add it to the appropriate packagegroup in
packagegroup-meta-oe.bb recipe as well since its a new recipe.

> +SRCREV = "406187bb3a885e083b448b2c2aa42c22957ae629"
> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "openssl"
> +
> +EXTRA_OEMAKE += "PREFIX=${prefix} USE_SHARED_LIB=1"
> +
> +do_install() {
> +        oe_runmake install DESTDIR=${D}
> +}
> +
> +PACKAGES =+ "libfsverity"
> +FILES_libfsverity = "${libdir}/libfsverity*${SOLIBS}"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.20.1
>
>
> 
>
