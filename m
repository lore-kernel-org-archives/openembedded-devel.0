Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.189575.1598249201144023351
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2020 23:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ndNg2DrG;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id x69so6472646qkb.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2020 23:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cVPjGIY7hOwoiJxfhGysxdY4sXGOCrkxQehlXVs4ues=;
        b=ndNg2DrGXMvLN0jL36QQAHNRtft0P2bQ3/b85Xnp4Vz0CQt6d4ZuMuUqyqRSyud1JP
         FPC0T5yVJAKjdPU+St4Lgp87h8qIxXgi1SBYbR0JyMwiSmoetBnBkRnqH10+RJ9aLi+q
         2So5ltCySjw8Y9NISa4voFKauQMdIk3dxmFq50YB2T65/Rgbi0ofCHcYJ3DQ12mN3FDp
         ABpnT6tLPRM2kRjS/26+YxZgzQg0QhasAACMahBh0TZ2tVt8MgSJM4nN//e6FbOazTsW
         DBs24c2rzgdK0p6FZIsN+FuMvm1HoT4rQEp4vFWBZZeMlovmPL2XcIgUuNzovTsoc09e
         wVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cVPjGIY7hOwoiJxfhGysxdY4sXGOCrkxQehlXVs4ues=;
        b=LPEaOCg9a6lOeYQtHCNJIdFsXtXOdmdes9BQiRJFVq8smg22vGLMJppC5J0Og+rtAK
         L4KiIKPQsmlGGqnpNTz+es/KJ8NTSx6b6KRj6eJ1911e8t5XCgMAKg24fJAK8YK0bdGv
         ZLj5QBM7zgu5jXbpuHlXZpuXNy94o7FIILKHjJ2M58xeoEt9M2jOumgih2Z4OAhFVBg+
         Idls0dKZebmBFUJrI696z1tqoGkrP6Ywzj4mYK83sAqrDMp3mHWpggCP0x8Z05TxFf9u
         xqU15D2rHok2k//MqGlH1QsuhuuUDMlm8VQw9YYTFkT0AlsZQGPBEQpMvRUjbTvGsix2
         LTCQ==
X-Gm-Message-State: AOAM533e2jtRSEXhPZBzUaJBMJYm/I/f/XiH4KRDSp24TfGmqHlWPMwF
	R52QREr59pX3GQWaDl1fiYBMMGHhhe8E3f2UoHA=
X-Google-Smtp-Source: ABdhPJy4fIAnfNb14CqQuwZGtvffh5OzhEa0ZVSzJobsCVgnYHHJoI0dLsr/S4zUBnfzN4ADUdZ3vadLZAQIeQ20/pQ=
X-Received: by 2002:a05:620a:48:: with SMTP id t8mr3417702qkt.474.1598249200134;
 Sun, 23 Aug 2020 23:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200824060235.196568-1-richard.leitner@skidata.com>
In-Reply-To: <20200824060235.196568-1-richard.leitner@skidata.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 23 Aug 2020 23:06:14 -0700
Message-ID: <CAMKF1sr022VGqvOj1SjBUofe_PGiTBNScXxv6rbip1P8BZjgDg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] liburing: add v0.7
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 23, 2020 at 11:03 PM Richard Leitner
<richard.leitner@skidata.com> wrote:
>
> Add initial support for liburing v0.7.
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  .../recipes-support/liburing/liburing_git.bb  | 21 +++++++++++++++++++

better to embed the PV in recipe name, so call it liburing_0.7.bb

>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-support/liburing/liburing_git.bb
>
> diff --git a/meta-oe/recipes-support/liburing/liburing_git.bb b/meta-oe/recipes-support/liburing/liburing_git.bb
> new file mode 100644
> index 000000000..87c919e13
> --- /dev/null
> +++ b/meta-oe/recipes-support/liburing/liburing_git.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "This is the io_uring library, liburing."
> +DESCRIPTION = "liburing provides helpers to setup and teardown io_uring \
> +instances, and also a simplified interface for applications that don't need \
> +(or want) to deal with the full kernel side implementation."
> +HOMEPAGE = "https://github.com/axboe/liburing"
> +BUGTRACKER = "https://github.com/axboe/liburing/issues"
> +SECTION = "libs"
> +
> +LICENSE = "LGPLv2.1 | MIT"
> +LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=d51b5805e2a675685e6a66ca50904cf9"
> +
> +SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https;name=git"

No need of name=

> +PV = "0.7"
> +SRCREV_git = "45f0735219a615ae848033c47c7e2d85d101d43e"
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
> +
> +do_install () {
> +    oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
> +}
> --
> 2.28.0
>
