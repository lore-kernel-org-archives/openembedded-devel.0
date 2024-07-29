Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11221C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 18:03:21 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.62842.1722276195089796649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 11:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FNKIUN9S;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-260e3e295a7so2228424fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 11:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722276194; x=1722880994; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8Xz11RskQK8oOKn9Pa0MQUUcJxiSJDlM1qz6FZRGP0=;
        b=FNKIUN9SU3qmgmSuHD422zl5Shm7ZYafllqxbM9cxL7oVdkDUt1YajPUsY4XrWv42j
         c78Gsg/fipK0V9ckdo9Twry8fbIHSgBealE2vNGdyf0mTFZ/pmGA5wtBDSrD64u0Pfsr
         j/NVSY9iYdoZg1mb8zTmQv5IewRMj6zUjbU87VveB2oqW3b64d9v6a0KozbVWhMmFbnp
         hMu/loZnPrRJcxO0C3cwS1qfd9JzequsX3vAs9wszd+cJg1xXGbPDumqfST6YHOaLFMV
         DDeIEIEw9wpgCFqhiVDhaAq8qr0PqtaAO3Um6sRebBlsRQGzOIsxqnbXkVLLF4iPFvvi
         49XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722276194; x=1722880994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8Xz11RskQK8oOKn9Pa0MQUUcJxiSJDlM1qz6FZRGP0=;
        b=KIlK0OzAyOdFqfwApI8xKsaSLlId/ujAcbSv5mde0nI0YLwgV0tQAxpTHt1vQ1l9ts
         78jmT0jPehZql+1bhiaqe0gwMYyT+OcKoERLXnom3+rT1IwH4YrPUb3CbZyEoaXjNe8E
         v3KAcTX/ISLiK++lFTJWIxO9P+4atws7OgmHrB+xwfoUBNJpNMBYv/xvC7vpKPNMh4BN
         beqg09zSSMT6CBVqGjfgS2yVX0Cr/khdLDgkf2iyfGUgs2qyqfwtIq6nWNDTNvTPsIYn
         0Upk1PGQEcNO1I9gCeoZdok5CJ3NYAK8H3+FsJYwMIGTh+WBU+2bo29m1BtFc9R4J+vV
         lSBA==
X-Gm-Message-State: AOJu0YwJJQOzULZXI2gG4AKwMDYlWVPKAihaMCrb9QghhLvvzuaK7A8P
	1PugU0QIIrDSCDbqcuJC81YLiuW0wss9kEPvZS6lE5JjH1XVb9qURR1F2GHC1f+OSPhpvufNhRx
	JrstCbqDk1WLwJfEqAbFX7l7cEEU=
X-Google-Smtp-Source: AGHT+IEwfGDIkTO8RH+GH4eBVBhrsjAKKxVVw22FsW3L3pF+PZK3oScT8mxOKW60SGcK3oZuON0+nTwLRrDLD1ECDaU=
X-Received: by 2002:a05:6870:15c4:b0:261:2072:7b5d with SMTP id
 586e51a60fabf-267d4d951f2mr11441134fac.29.1722276194155; Mon, 29 Jul 2024
 11:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sruk+AgtzT65AubtCZ6EqmUnx9j-vXYsJqc6Hem_N_H8A@mail.gmail.com>
 <20240729172708.8968-1-tymoteusz.burak@3mdeb.com>
In-Reply-To: <20240729172708.8968-1-tymoteusz.burak@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jul 2024 11:02:46 -0700
Message-ID: <CAMKF1soHSZ=+qmB4cOaPmi79OQ1=5uivDg6pE-DawyCFFnSghw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] dediprog-flasher: Add recipe
To: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, piotr.krol@3mdeb.com, 
	maciej.pijanowski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 18:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111473

Can you rebase it on latest master branch and send the delta alone
since I accepted v2 already

On Mon, Jul 29, 2024 at 10:27=E2=80=AFAM Tymoteusz Burak
<tymoteusz.burak@3mdeb.com> wrote:
>
> This patch adds the dpcmd utility recipe. It provides software for
> Dediprog SF100 and SF600 SPI flash programmers.
>
> I've changed the PV to the tag from which the sources are fetched.
>
> Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> CC: Khem Raj <raj.khem@gmail.com>
> ---
>  ...01-add-support-for-cross-compilation.patch | 21 ++++++++++
>  ...2-Makefile-add-conditional-stripping.patch | 39 +++++++++++++++++++
>  .../dediprog-flasher_1.14.20.x.bb             | 27 +++++++++++++
>  3 files changed, 87 insertions(+)
>  create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher=
/0001-add-support-for-cross-compilation.patch
>  create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher=
/0002-Makefile-add-conditional-stripping.patch
>  create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher=
_1.14.20.x.bb
>
> diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-a=
dd-support-for-cross-compilation.patch b/meta-oe/recipes-bsp/dediprog-flash=
er/dediprog-flasher/0001-add-support-for-cross-compilation.patch
> new file mode 100644
> index 000000000000..b97ddacc3684
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-supp=
ort-for-cross-compilation.patch
> @@ -0,0 +1,21 @@
> +Author: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> +Date:   Fri Jul 5 16:39:13 2024 +0200
> +Upstream-Status: Backport [https://github.com/DediProgSW/SF100Linux/comm=
it/b1fbcbc1fbb2d0d71a20a2936c6eff0586422243]
> +
> +    Makefile: allow overriding CC
> +
> +    Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> +
> +diff --git a/Makefile b/Makefile
> +index 139e5c0c3c3c..226303a6921e 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -12,7 +12,7 @@ endif
> + endif
> +
> + PROGRAM =3D dpcmd
> +-CC      =3D gcc
> ++CC     ?=3D gcc
> + PREFIX ?=3D /usr/local
> +
> + PKG_CONFIG ?=3D pkg-config
> diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-M=
akefile-add-conditional-stripping.patch b/meta-oe/recipes-bsp/dediprog-flas=
her/dediprog-flasher/0002-Makefile-add-conditional-stripping.patch
> new file mode 100644
> index 000000000000..0654a0eb6f96
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile=
-add-conditional-stripping.patch
> @@ -0,0 +1,39 @@
> +From dac9d0ea5c419049c9ab0a5ba90d15d77a3271b0 Mon Sep 17 00:00:00 2001
> +From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> +Date: Mon, 22 Jul 2024 13:02:59 +0000
> +Subject: [PATCH] Makefile: add conditional stripping
> +Upstream-Status: Backport [https://github.com/DediProgSW/SF100Linux/comm=
it/91f990f5783e0aebe94999bb37d93836b7a5ca79]
> +
> +This patch introduces a `NOSTRIP` conditional flag to the `install`
> +target in the Makefile. The purpose of this flag is to allow the
> +disabling of binary stripping during installation. This is
> +particularly useful in development environments, such as BitBake,
> +which handle stripping internally.
> +
> +When `NOSTRIP` is set to `1`, the `strip` command will be skipped
> +during the installation process, preventing potential conflicts or
> +redundant operations.
> +
> +Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> +
> +---
> + Makefile | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Makefile b/Makefile
> +index 139e5c0..8b33320 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -58,7 +58,9 @@ install: $(PROGRAM)
> +       [ $(shell id -u) -eq 0 ] || (echo "Error: install needs root priv=
ileges" && false)
> +       install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREFIX)/bin $(DESTDIR)=
$(PREFIX)/share/DediProg
> +       echo -n "install: " && install -v -o 0 -g 0 -m 0755 $(PROGRAM) $(=
DESTDIR)$(PREFIX)/bin/$(PROGRAM)
> ++ifneq ($(NOSTRIP),1)
> +       strip $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)
> ++endif
> +       install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREFIX)/share/DediProg
> +       echo -n "install: " && install -v -o 0 -g 0 -m 0644 ChipInfoDb.de=
dicfg $(DESTDIR)$(PREFIX)/share/DediProg/ChipInfoDb.dedicfg
> +       install -v -o 0 -g 0 -m 755 -d $(DESTDIR)/etc/udev/rules.d
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.2=
0.x.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.x.bb
> new file mode 100644
> index 000000000000..913937a16506
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.x.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "Linux software for Dediprog SF100 and SF600 SPI flash p=
rogrammers"
> +SECTION =3D "devel"
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da23a74b3f4caf9616230789d94217=
acb"
> +
> +DEPENDS =3D "libusb"
> +
> +SRCREV =3D "e691f2d432144e3dbc82e9e0eea1ebaed4f3becf"
> +SRC_URI =3D " \
> +    git://github.com/DediProgSW/SF100Linux.git;protocol=3Dhttps;branch=
=3Dmaster \
> +    file://0001-add-support-for-cross-compilation.patch \
> +    file://0002-Makefile-add-conditional-stripping.patch \
> +    "
> +
> +EXTRA_OEMAKE =3D "NOSTRIP=3D1"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install () {
> +    oe_runmake DESTDIR=3D${D} PREFIX=3D${prefix} install
> +}
> +
> +FILES:${PN} +=3D " \
> +    ${datadir}/DediProg \
> +"
> +
> +inherit pkgconfig
> --
> 2.45.1
>

