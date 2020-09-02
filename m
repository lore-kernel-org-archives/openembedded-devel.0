Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.15297.1599071836649389701
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 11:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KLw9JtaJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id z2so4359448qtv.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 11:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tyoZKkmRo+B14eu3vvzVyLsEREQWqaLFMLjWBeev+Tw=;
        b=KLw9JtaJkTEic4BC1ZgGUUO+8DITPfa4JACLxzuMupAcGps1izh/Py1WRDhDE0Cx/A
         r1FuFNCsNeI3zYhKLDOktemif0p+rbrwT/ZILvdYpnGvnrPUqDzZiS8RXkb76Trp/SgY
         O2cNIG+6Dvrl73h9Ke5a+iJIvd6vzqwuFnJx93RWursiEKMVRsRgSeoaXvsvE/Oywurq
         EkK6VKaY21rZVzERMmh4HJ4kBQmIEx64rwYfZEAlOXerkumpRwQHeq6oUrQW9y0/V2/6
         jgsMwr2rPNc/Ich4SZ7gWw7u5zo44IqaVRbzh4EWzO6qdAui0Jrcqf31bgLao0/1el9T
         VaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tyoZKkmRo+B14eu3vvzVyLsEREQWqaLFMLjWBeev+Tw=;
        b=Ye4pLIqIELplVcdoUEVwq69CYbSYX5xkoGNn2dNigMTrc2e9RNOOxuIaor1h8B8u6X
         yjMJORq8W1tTDGa9FcJbtlLu/V2lnYxMLCYYfTt3qMk071WVV+uDnWdQzATTe/lhwVEn
         ahXfven3se1yhIvTjJLrZ1ypQ9RD04wPQqOlizzOI+T66vbT2pUkWTm1w5pxnjVkLsgx
         2tMie3COJ4pfe1xsLaJeCB/JnIwZeKKWUfhPXFrvI/b3kPrzuiXdmmcn/5eRLvSfEYTS
         ZZgNoE0ru4LfZHbKMNxnAGjxYmTYGL0IRqBdpHv1RQP0rtxWx4RyBPnfBkmLzPEV0611
         88XQ==
X-Gm-Message-State: AOAM533ItomCnL/EYkoc3if7kQLbLzH8uoXliiNgKSpJk0qkCZEqvz71
	B5rY+9CYzid3lxqa4Ty13SxfXafyDgI/py0veh4=
X-Google-Smtp-Source: ABdhPJz2HGlFQbbyujD17BbTkgdySGSBqIZjpbcEYpoT2VBG6vvwdeDOYjtk9Ys3dM0u7yB+1wIpjyuYTcrJ0pW90W0=
X-Received: by 2002:ac8:72d6:: with SMTP id o22mr8173408qtp.53.1599071835646;
 Wed, 02 Sep 2020 11:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200902174600.675971-1-yann@blade-group.com>
In-Reply-To: <20200902174600.675971-1-yann@blade-group.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 2 Sep 2020 11:36:49 -0700
Message-ID: <CAMKF1soBvXpbfFL-dDSkKNftcvMjp0bmVjw1zHGB9SzL7JUjAQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][patch] New terminal emulator: st 0.8.4
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 2, 2020 at 10:46 AM Yann Dirson <yann.dirson@blade-group.com> wrote:
>
> From: Yann Dirson <yann@blade-group.com>
>
> Can be used as a replacement for matchbox-terminal, with much less
> dependencies (does not need gtk and vte), and supports "-e" flag.
>

can you add it to
meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb as well
and see if you can build meta-oe-ptest-image

> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  meta-oe/recipes-graphics/suckless/st_0.8.4.bb | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/suckless/st_0.8.4.bb
>
> diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
> new file mode 100644
> index 000000000..7d7c20e46
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
> @@ -0,0 +1,28 @@
> +SECTION = "shadow"
> +LICENSE = "MIT-X"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=04c3ca13a702147c62db90f556c5b3ca"
> +SRC_URI = " \
> + http://dl.suckless.org/${BPN}/${BPN}-${PV}.tar.gz \
> +"
> +
> +inherit pkgconfig
> +
> +SRC_URI[sha256sum] = "d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6"
> +
> +DEPENDS += "libx11 libxft fontconfig"
> +
> +RDEPENDS_${PN} += "libx11-locale"
> +
> +do_compile() {
> +    make INCS='-I. `pkg-config --cflags x11 fontconfig xft`' LIBS='-lm -lutil `pkg-config --libs x11 fontconfig xft`'
> +}
> +
> +# don't use "make install" which builds terminfo, already in
> +# ncurses-terminfo (and requires ncurses-native for "tic")
> +
> +do_install() {
> +    mkdir -p ${D}${bindir}
> +    install -m755 ${B}/st ${D}${bindir}/
> +}
> +
> +RRECOMMENDS_${PN} += "ncurses-terminfo"
> --
> 2.28.0
>
> 
