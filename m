Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.25018.1601860568280431850
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 18:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZiX+zj7R;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id q63so10378135qkf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2020 18:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YTMAsfQP4c7yVG3/V2bYYlyas0ILt9JUns+58z8KJuk=;
        b=ZiX+zj7Rl8wkAXvgVIiWUcxnWzdO7tzI8VsgOPG802xZMDnIGXbaT4cxv9BFp+Om4B
         cfPT5oFWTFYicj6L+iLkYrryO5yG5Yt1j9T1lR/ZJed5qR80aJRf3Lz6vJ8yjDkH5UdW
         io2H2XEJsH2PoK3UzSbiuA7bm5UMYDHzbGSxIec9GtBCeAleVsQbijY3/qctsrGTrbSf
         +V4xTdiduk7gp5YK2URq2HcfWCz+ZwHW5yIpgvdzSkAJcEn266n2ou4awYblKT9hs6Qs
         q8TBpe4Kt/LpuDkY3MC4rXUv7BcTmGphAFK0RcsL3p6hO0atV8oxeaEcYXeK0Wh/yGiI
         ojtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YTMAsfQP4c7yVG3/V2bYYlyas0ILt9JUns+58z8KJuk=;
        b=rOjWRaP0pBaunLbcRrCXJwf2fPPFUBCWSjQloLw8lQQ5EZdkuEas/gohcwqpGNm7YZ
         mCmqzh5KkC7wj4qwKBleJ2s0yb/dPAhtg7S2bqY4UPwgoA4ZLy36PuM0wBqK2lzxnqZm
         KXpi2vBtTZiP5xpmrARCIXpnX9vAX/kn4pPVdbJ+sdfcvFL3zGWbfmS713onJa9/WQfR
         4xpkJwhWQ//8VadSpRdfoV9Oz5jOrM3+SxyFxDm7NvnFPQ8YjcZ7nDGplnhZESyz9ceF
         HACU3hiucqpEjV86a+Gqm9AmpBdxVamIvoz5ode6x6YBtbRyEySPqQj7xGKrbSiI3zrn
         ICDg==
X-Gm-Message-State: AOAM530g7o+xFpGoKiaNl2Z3/nr7cd7bvvYhqWXwfnEandilderPsnLW
	isiMDmIO8ZiCpkNhIdF6zHd9S57G7QbyqMcwi5bXmB0kwebP1Q==
X-Google-Smtp-Source: ABdhPJy09U26GtobeOZn45ehUMl3vPigQk+WvZs0KAVgDgWz5H56WSUlzWYNHfTy/C/4Ni1ssZqziDNxj6v1CwQcMdE=
X-Received: by 2002:a05:620a:7f6:: with SMTP id k22mr12145633qkk.337.1601860567154;
 Sun, 04 Oct 2020 18:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQcHN8fNEZCnTfyg6fYOe8JfAC=cbXGhi3P_LB8uZ8uryw@mail.gmail.com>
 <20201004080501.1662845-1-zig@zigsystem.com>
In-Reply-To: <20201004080501.1662845-1-zig@zigsystem.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 4 Oct 2020 18:15:41 -0700
Message-ID: <CAMKF1sqMTk3v-4oH0aMwcPkdW1aXLu4v2G8vwuFrJ6C-oq8wHg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libuvc: add recipe
To: Zig Globulin <zig@zigsystem.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 4, 2020 at 1:08 AM Zig Globulin <zig@zigsystem.com> wrote:
>
> Signed-off-by: Zig Globulin <zig@zigsystem.com>
> ---
>  .../recipes-multimedia/libuvc/libuvc.bb            | 14 ++++++++++++++
>  .../packagegroups/packagegroup-meta-multimedia.bb  |  1 +
>  2 files changed, 15 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
> new file mode 100644
> index 000000000..228db25d7
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "library for USB video devices built atop libusb"
> +HOMEPAGE = "https://github.com/libuvc/libuvc.git"
> +SECTION = "libs"
> +LICENSE = "BSD"

Use LICENSE = "BSD-3-Clause"
that's what https://github.com/libuvc/libuvc/blob/master/LICENSE.txt is stating.

> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2f1963e0bb88c93463af750daf9ba0c2"
> +DEPENDS = "libusb jpeg"
> +
> +SRC_URI = "git://github.com/libuvc/libuvc.git"
> +SRCREV = "ad6c72a4e390367f0d2be81aac00cfc0b6680d74"
> +PV = "v0.0.6+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> index 2bf8877bb..d174f3079 100644
> --- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> +++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> @@ -60,6 +60,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
>      vorbis-tools \
>      libdvbcsa \
>      libopenmpt \
> +    libuvc \
>      mimic \
>      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "minidlna", "", d)} \
>      mycroft \
> --
> 2.28.0
>
>
>
> 
>
