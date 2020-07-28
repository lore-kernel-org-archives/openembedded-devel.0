Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.15108.1595950516204177192
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 08:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Eecnl8yk;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id b14so17331710qkn.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2020 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WJ6E9bWJ0LZbibINgw1UAuR03rtALqYyuTsjG1A67gQ=;
        b=Eecnl8ykVKhn7De/WjRPb+TZ8tZfE/n5JeybSSZ3CqSPaVGcXiKWCD7eTkpudqgoD5
         aqMOwE7VOZ7W0VZac9VGvJiDyu48CZ6SHpdm1dwWo0klhnTbM6scfjQYycQMfkgb9k+V
         fLHYdSHefioc9AKAADIvQOyCMCc21NbnSwefZdFGrmirFZqoTaZ8dbncyp+MwvL6HJpz
         byYjrPKjlWLZhPrraHHH8HO74GmTrv8qnpPFPVYDwHpR4HoGOgnO0SnXnYAiY28qlrKb
         ibm07an1L4UUPhnspJZKMAOBKRPwuq3OMuWvvFTE/IlrkLQFt2R5mxR7GZs8hu7PcgYF
         wZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WJ6E9bWJ0LZbibINgw1UAuR03rtALqYyuTsjG1A67gQ=;
        b=Gncp2ha2NQ3sm0n5Su1/3bZ/4Va91XFH37Wws8R80V/M4ByfUAQuJLISDj5c0AvW4S
         C08ILdtc3jVO/UR1IfzSTEMtDbPBU6mMfqZMxwYjWKGZxNzaYwXW7sGOf3pvK7GlWTba
         AyqpDXxTsmDHyILpAsuhZkq0DL6Jpg3R4A8O/v3jSFZ68vJkbJ6ZV+/uwxydCmwRBzOi
         gu7iax7TH82mixVUdLW7BAoJRpzz0C9qWb2p+OCrx8C4OAf5/KwaEWg8xVyp3BcoKXeo
         DtSub4aPML4Lz4XuetTWjovYIsmH4CL4PSiB7CWSsfUqgNFxKlDh2ILOsmkF6rL+p+de
         lc4w==
X-Gm-Message-State: AOAM531L4LeqWUDSc13Re0tiDHqAMSEdy4wMRU/k5cvtA3kTLjI1Sjyq
	ztugp3GRkFOkO22R3+7iTeM+v6xVMLOGMtRFHSQ=
X-Google-Smtp-Source: ABdhPJzOKNc47NRQRFdaHjaqWFokJ8+KJcxZnIWEIe+Eh9tnPxelOb/hK6KoMuzWlNft+nfgatlR9bASFQDzRzJrSro=
X-Received: by 2002:a05:620a:209b:: with SMTP id e27mr27936978qka.431.1595950515226;
 Tue, 28 Jul 2020 08:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200727080116.1984-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20200727080116.1984-1-costamagnagianfranco@yahoo.it>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 28 Jul 2020 08:34:49 -0700
Message-ID: <CAMKF1spYrGh7QWc+=tBZKegu7AY8UJFdLedphuxyf4zGcy9yNA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.6 -> 6.1.12
To: Gianfranco <costamagna.gianfranco@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"

Hi Gianfranco

Please separate this into two different patches and fix websocketpp as
it fails also remove the old version when you upgrade

https://errors.yoctoproject.org/Errors/Details/425408/

On Mon, Jul 27, 2020 at 1:01 AM Gianfranco
<costamagna.gianfranco@gmail.com> wrote:
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  ...rs_6.1.6.bb => vboxguestdrivers_6.1.12.bb} |  4 +-
>  .../websocketpp/websocketpp_0.8.3.bb          | 38 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.6.bb => vboxguestdrivers_6.1.12.bb} (95%)
>  create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp_0.8.3.bb
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
> similarity index 95%
> rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb
> rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
> index 89b1ee11e..dfa15da2d 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
> @@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
>  SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
>      file://Makefile.utils \
>  "
> -SRC_URI[md5sum] = "fe6328d22dfb20ea372daa4b58b12374"
> -SRC_URI[sha256sum] = "b031c30d770f28c5f884071ad933e8c1f83e65b93aaba03a4012077c1d90a54f"
> +SRC_URI[md5sum] = "3c351f7fd6376e0bb3c8489505a9450c"
> +SRC_URI[sha256sum] = "05eff0321daa72f6d00fb121a6b4211f39964778823806fa0b7b751667dec362"
>
>  S = "${WORKDIR}/vbox_module"
>
> diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.3.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.3.bb
> new file mode 100644
> index 000000000..79a5ac5c4
> --- /dev/null
> +++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.3.bb
> @@ -0,0 +1,38 @@
> +SUMMARY = "C++/Boost Asio based websocket client/server library."
> +SECTION = "libs/network"
> +HOMEPAGE = "https://github.com/zaphoyd/websocketpp"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=4d168d763c111f4ffc62249870e4e0ea"
> +
> +DEPENDS = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'openssl boost zlib', '', d)} "
> +
> +SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https \
> +           file://0001-cmake-Use-GNUInstallDirs.patch \
> +           file://855.patch \
> +           file://857.patch \
> +           file://0001-Correct-clang-compiler-flags.patch \
> +          "
> +
> +EXTRA_OECMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-DBUILD_EXAMPLES=ON -DBUILD_TESTS=ON', '', d)} "
> +
> +# this is an header only library, do not depend on the main package
> +RDEPENDS_${PN}-dev = ""
> +
> +# to add this package to an SDK, since it isn't a reverse-dependency of anything, just use something like this:
> +# TOOLCHAIN_TARGET_TASK_append = " websocketpp-dev"
> +
> +# tag 0.8.2
> +SRCREV= "56123c87598f8b1dd471be83ca841ceae07f95ba"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +PACKAGES =+ "${PN}-examples"
> +
> +FILES_${PN}-examples = "${docdir}"
> +
> +do_install_append() {
> +       install -d ${D}${docdir}/${BPN}
> +       cp -R ${S}/examples ${D}${docdir}/${BPN}
> +}
> --
> 2.17.1
>
> 
