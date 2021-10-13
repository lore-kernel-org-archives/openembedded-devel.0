Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0092BC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 05:40:11 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.4102.1634103610268468057
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 22:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dRlok04b;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id z3so1021124qvl.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 22:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zGtnx1PaN2ffNFomiqt7WJg8ziD02UxonZ8l2gLwf4A=;
        b=dRlok04bRU5LWcKC/LUZa60jTfUqNY7ru/W2BmQkul5bRtHS6GKG5/y3JYk5HiTGU5
         u2nezFCMbvScRpBhMx/eAaRRFB6jhyZSjpzOcHoDOP9ofV8iVWKdR538DMGZKE0HsZ0E
         zFqsvKghPPfGvvjnIA0h8A6GyzqcpRtS7IFN3twUupNQxuPFEMS0YVS8snlagyuQR0Z7
         Y1rDL1De/8Uq1DHb2VxX7t+M45Gc108+Md/iuG95Gu53vsWdoRbCp/NP6k1fVFEAMBPB
         i9v45DpRQoukH5R1eyPSNxnYpjjjaheAow6W3DcmBy3evIVqkgD9aDxC1ddkYoHpP6uv
         fMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zGtnx1PaN2ffNFomiqt7WJg8ziD02UxonZ8l2gLwf4A=;
        b=xrHt6oahL+g8KpPu1Jwk922vY7LZq+tn12KgbCPYvOyqfX5nE75/t4x+8c3tgIW6C5
         6TsmtDNoVEqYAHhGF/g5iCdRz+bNrHId/8TDKou6i2nlhRzfhXBcxWgV7kh6ZRBS30yo
         GE78U0S4h9zff7oQzKGxHBdTcy9abBVLmwoDW9SiCThjlY3q3A0Uti5XXLl+5Bgcq9+c
         pQccYZS28FWU/lTJxQNqS/NU0QvrRZ1AUEg0/80S/1VxedNmag60lj+zaRM4dPDcl6vI
         54ikEpyNxgzESjf206msMf7g8LCJiVfv6Cqk91sJA1EOopUAL4z4eFJuGEiB0DLQnAZa
         rJrw==
X-Gm-Message-State: AOAM532PGHFYZWQIvXlU/nY6ENEcF3Mh9siDcMczMezvgG6QQjZxA/DJ
	l0R0oQVnhPzCzzseifOZjKMvpdui5ThUq2k7Mh8=
X-Google-Smtp-Source: 
 ABdhPJwX7QZEL3wvDq5eszm12+Hks0GTrGZMqwFNzxK5lJF2wGHWGuAnEi0AR1Gj2NwHLW9ckcgy6m1OBxaZKq106Bs=
X-Received: by 2002:a05:6214:188:: with SMTP id
 q8mr13019450qvr.5.1634103609287;
 Tue, 12 Oct 2021 22:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211013053419.2871191-1-nandor.han@vaisala.com>
In-Reply-To: <20211013053419.2871191-1-nandor.han@vaisala.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Oct 2021 22:39:43 -0700
Message-ID: 
 <CAMKF1spg-TsiB4LjN-WP5MEhBOqjQcGdMGbVX6F_Xc=tCkc6Tg@mail.gmail.com>
Subject: Re: [meta-oe][RFC PATCH] libiio: depend on avahi only when network
 backed is used
To: Nandor Han <nandor.han@vaisala.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 sam.van.den.berge@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 05:40:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93270

this is already applied with
https://git.openembedded.org/meta-openembedded/commit/?id=e078ffd4ce
if we missed anything please send a rebased patch.

On Tue, Oct 12, 2021 at 10:34 PM Nandor Han <nandor.han@vaisala.com> wrote:
>
> The `avahi` dependency is needed only when network backend is used.
> The current dependency configuration will add the `avahi` dependency
> regardless if network backend is used or not.
>
> Move the `avahi` dependency to be part of `PACKAGECONFIG` configuration
> which will insert the dependency only when needed.
>
> Signed-off-by: Nandor Han <nandor.han@vaisala.com>
> ---
>
> Notes:
>     Testing
>     -------
>     1. Verify that `libiio` recipe builds successfully with or
>     without the network backend configured: PASS
>
>  meta-oe/recipes-support/libiio/libiio_git.bb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
> index 6ac534a28..488d4e3b0 100644
> --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> @@ -18,7 +18,6 @@ DISTUTILS_SETUP_PATH ?= "${B}/bindings/python/"
>
>  DEPENDS = " \
>      flex-native bison-native libaio \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
>  "
>
>  inherit cmake python3native systemd setuptools3
> @@ -31,8 +30,13 @@ EXTRA_OECMAKE = " \
>
>  PACKAGECONFIG ??= "usb_backend network_backend serial_backend"
>
> +NETWORK_BACKEND_DEPENDENCIES = "\
> +    libxml2 \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
> +"
> +
>  PACKAGECONFIG[usb_backend] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1 libxml2"
> -PACKAGECONFIG[network_backend] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
> +PACKAGECONFIG[network_backend] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF, ${NETWORK_BACKEND_DEPENDENCIES}"
>  PACKAGECONFIG[serial_backend] = "-DWITH_SERIAL_BACKEND=ON,-DWITH_SERIAL_BACKEND=off,libserialport libxml2"
>  PACKAGECONFIG[libiio-python3] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"
>
> --
> 2.26.3
>

