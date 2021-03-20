Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web12.243.1616283015408721671
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Mar 2021 16:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VY/L966C;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id o19so6987439qvu.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Mar 2021 16:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tOSoh6mLxxZpnmQpgW1mORLRtaFEDmebXWEAI2gjptw=;
        b=VY/L966CDF0XCDs8TyxsoyzeKSWjoBQ+EBNR5uXGj1CSKVGKo035u4dyLI2KGcU/Oj
         +YVnHeG8L5vCLrGoYJFxvQFSMTJ/qI7CMX7a2Q/d3vmVcUtqh9ggT6KuRIKQvuyPdYzi
         8g0R2VJxN5sy0+3O9FqtVyt0N3916fzblxyQDJlNGEWnv4jJT/PSIB1we+ihYLrpWrqS
         d9YNjz3/7mQkN/hiRBSOgc66N4Vf9lnMiDs459cvzyVaHAcpa7REv8/rAk0gZAI0QIOx
         PSpkEohOHrHChD5vonFiQAix2YxjLWTmWopQ0eBDuhj5J0hAUpY713Mpw6BJWW3PEVuF
         OiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tOSoh6mLxxZpnmQpgW1mORLRtaFEDmebXWEAI2gjptw=;
        b=MGIsopMCspRkh6vVgKjwyRxI0XPMQX9x7ppOY9paa5N2WlbNil6t2ejgt6afGhb/rg
         bqMCQ8b4VJiaGM3KLmKuPpp5856iwR5+bh8HQKXNM6XjksSrUJMkhI40wNCF/o0A6IL9
         DEiAud9OfeVcyr50BTxjvLRbuDTu2JJsQIFohzf+5/xqAClZBQ8eT9Ko2gQ/WYOcSiix
         kPMqDoxOeV7fh3ydVTv3Ms28Cgw9xz8pru17r8lKnF3GKvTYXs0Do7lr9V2NNe6VgRq8
         HT2h95BPjIfPT+86499Pf0LvOWlx2zTRpcgoQMup/jCJpV3EUlK/nuu7S2Gwnfp9QrCM
         I5jQ==
X-Gm-Message-State: AOAM531M+NcljHrFdhUA12cRt95FSE+1WBY3XRi6OGXelEN0ulCulzWG
	anXQ8BS1mJmmmdxZ2Wj3hVLTZnKWOci+ZXc8lYU=
X-Google-Smtp-Source: ABdhPJwe3Ty5oYy5Uo1DhkC7cI31Ycra9INdQHdc4h8Vr6zjbbqjiI3Ifw0+DyLvhKaRABJJ0KeU3m7WQYAzIqOikMo=
X-Received: by 2002:a05:6214:f27:: with SMTP id iw7mr3367915qvb.50.1616283014365;
 Sat, 20 Mar 2021 16:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210320223945.40947-1-quaresma.jose@gmail.com>
In-Reply-To: <20210320223945.40947-1-quaresma.jose@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 20 Mar 2021 16:29:48 -0700
Message-ID: <CAMKF1spmjY4uh5RzFtyHa9n93q=CziERFVV0z_JP9zyiR32o-A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] usrsctp: drop receipe
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 20, 2021 at 3:39 PM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> The only receipe that depends on this lib are the gstreamer1.0-plugins-bad.
> An internal copy of the usrsctp lib is provided in gstreamer1.0-plugins-bad-1.18.
> So it is not used by anyone in OE-core as well as in meta-openembedded.
>
> No sane distro would package libusrsctp and Debian definitely does not.
> Also e.g. Firefox and Chrome are bundling the code too. There's probably also no
> API stability guarantee at all for it, and by bundling the code we would also get
> around some of the problems with the library: global state shared between different users of the library
> https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues/870
>

while I would like to remove recipes from meta-openembeded repo. this
is a library which might be used by some internal products
by some users.

> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../packagegroup-meta-networking.bb           |  1 -
>  .../recipes-protocols/usrsctp/usrsctp_git.bb  | 25 -------------------
>  2 files changed, 26 deletions(-)
>  delete mode 100644 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
>
> diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
> index 231d8d4da..1979d32cb 100644
> --- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
> +++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
> @@ -166,7 +166,6 @@ RDEPENDS_packagegroup-meta-networking-protocols = "\
>      zeroconf \
>      pptp-linux \
>      rp-pppoe \
> -    usrsctp \
>      xl2tpd \
>  "
>
> diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> deleted file mode 100644
> index 4f8e4d428..000000000
> --- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION = "This is a userland SCTP stack supporting FreeBSD, Linux, Mac OS X and Windows."
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ffcf846341f3856d79a483eafa18e2a5"
> -
> -SRCREV = "a10cd498d964508c0e6ec6bd2be9dd4afcbb4d86"
> -SRC_URI = "git://github.com/sctplab/usrsctp;protocol=https;branch=master \
> -          "
> -
> -S = "${WORKDIR}/git"
> -
> -UPSTREAM_CHECK_COMMITS = "1"
> -
> -inherit autotools pkgconfig
> -
> -DEPENDS += "openssl"
> -
> -CFLAGS  += "-DSCTP_USE_OPENSSL_SHA1 -fPIC"
> -LDFLAGS += "-lssl -lcrypto"
> -
> -PACKAGECONFIG ?= "disablewarnings inet inet6"
> -PACKAGECONFIG[disablewarnings] = "--disable-warnings-as-errors,,"
> -PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,"
> -PACKAGECONFIG[inet6] = "--enable-inet6,--disable-inet6,"
> -
> -EXTRA_OECONF += "--disable-debug"
> --
> 2.30.2
>
>
> 
>
