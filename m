Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46F6C369A4
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 15:16:20 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.78484.1744125376346345509
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 08:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jyuiYdwz;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3fa6c54cc1aso3719138b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744125375; x=1744730175; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OASSIQJ/UoRC1UP6nFOZe4cPeO64ctCckml5ZuC2Eg=;
        b=jyuiYdwzIe2c1rg11BpSlQaJRYK/mV4x3SVV1DtvUvEEV0Bt2u2bt0WC7fJqhj5UOH
         u4crZLYO0vT2K7DDFiO3P1kQdJMNE0kdAA0d6qDtkAqMnF/lX//aCjx2PKglfVOVFd8A
         xpcS+rLmybd0y78Ehp9L56goreZowr3soMuwUZhMFjJ7jQ2fkRlX6E6U7NQHNA8Ke/fB
         ZZpsCjq+Fv7s3T6CU9ig01lGhA07YBBcPURhc9o6n5roV/CtTYhzUPCMYbc1hmP5eRr7
         EqAWodQIz+IEsqHUeO15oYyMzyLlQU0Kf+Y7zotwRPoIWSn7j+5V4DgFq/01kkLYWQgY
         vUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125375; x=1744730175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OASSIQJ/UoRC1UP6nFOZe4cPeO64ctCckml5ZuC2Eg=;
        b=qicp2iGD6zgpkv8lkhA+0hOOxqTK0dHZGVlrQDyxoyr6LATPFHEbA3EGApFZrXK8xK
         FIyhldmaCt9mpZDC/hgR5AkTRIVEvhFRXERLAla1PjtBgNpq+1ZG0wFlzhABPzXNGQqo
         FSmYUYNhC84ZvWInpaD737F3nx1d7ru6/RyQv9aGZT6vnt6hDe1Q87FKIK1FqITB5KZh
         aDfQHpjkWtPqjpwaM3m6esE9FoBSJN0++J6pnYNLUvMU3FpsP2kGZkyKJ9DXgxvNajTi
         YVyWR534R1RJlEk0RzerT14v1Feez2HHogIhOCXs9L26/lrAiNn6yncbyDzsQAFh1CNm
         t4fA==
X-Gm-Message-State: AOJu0YyXUnmmt07yKp7B6hIM0olkYsADPVzX/232Cc9KvB7ya/NXBGxM
	JLDlFBqniXFZEaXoKsSGo5ftYBooLWATDu9Iqi4ZRrRkunC4VwsZyXyOJZyeqKP8bop/rceyKf8
	7VzS9ZKv1TBfhyrTteKQBpHT5M3Q=
X-Gm-Gg: ASbGncuuvEiY21d/Vm9gfctdk6f64jwZqAya+l8SXlt0s0/7QUn3AmUhkBNdUr3EIJM
	hdqnKyYSB2xnVAFqFtOSG2/OVPRCzdIqtUWMJ4e8d/csY3D2hnzONtdHgaZbJi7uohCWWFZsQrH
	fg1k6Qgdb5xzk9XNmSxIJ+bxED
X-Google-Smtp-Source: AGHT+IH4oXt/HkB134V+pTHsKhdXiY8hH6461K0C/ueoph+qilFvSolhBqNFfvcl6IiKNffz9GIjSoHBadCDCRFxxXQ=
X-Received: by 2002:a05:6808:bd0:b0:3fb:85cc:9f27 with SMTP id
 5614622812f47-4004d7bb26fmr7445390b6e.0.1744125375573; Tue, 08 Apr 2025
 08:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250408054724.173577-1-alistair.francis@wdc.com>
In-Reply-To: <20250408054724.173577-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Apr 2025 08:15:49 -0700
X-Gm-Features: ATxdqUG95kt4IDwLrTMZCkYJaoff4wVnIJhu6X_sjZbxSWxSP5sTf6yt8BWoraE
Message-ID: <CAMKF1soB2x0JgA+W7wJQRS-VnWgcYJ=SEgBX5QFwy2dk0snSpg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] ktls-utils: Initial commit
To: alistair23@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 15:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116709

fails to build on musl

   | config.c:145:25: error: use of undeclared identifier 'ALLPERMS'
   |   145 |         if ((statbuf.st_mode & ALLPERMS) !=3D mode)
   |       |                                ^
   | 1 error generated.
   | make[3]: *** [Makefile:481: tlshd-config.o] Error 1

On Mon, Apr 7, 2025 at 10:47=E2=80=AFPM Alistair Francis via
lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Package ktls-utils which includes tlsd.
>
> This is used when in-kernel TLS consumers need a mechanism to perform TLS
> handshakes on a connected socket to negotiate TLS session parameters that
> can then be programmed into the kernel's TLS record protocol engine.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../ktls-utils/ktls-utils_0.11.bb             | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
>
> diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb b/meta-=
oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
> new file mode 100644
> index 0000000000..b4905db640
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "TLS handshake utilities for in-kernel TLS consumers"
> +DESCRIPTION =3D "In-kernel TLS consumers need a mechanism to perform TLS=
 \
> +handshakes on a connected socket to negotiate TLS session parameters tha=
t \
> +can then be programmed into the kernel's TLS record protocol engine."
> +DEPENDS =3D "gnutls keyutils glib-2.0 libnl"
> +RDEPENDS:${PN} +=3D " gnutls"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd568123389d9a12625cca2b089b17=
28b"
> +
> +SRCREV =3D "5c3314b5728b272cbaf0d98f4d521cca9610b6bf"
> +SRC_URI =3D "git://github.com/oracle/ktls-utils.git;nobranch=3D1;protoco=
l=3Dhttps"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools-brokensep pkgconfig systemd
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', '', d)}"
> +
> +PACKAGECONFIG[systemd] =3D "--with-systemd,,systemd"
> +
> +SYSTEMD_SERVICE:${PN} =3D "tlshd.service"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116690): https://lists.openembedded.org/g/openembedde=
d-devel/message/116690
> Mute This Topic: https://lists.openembedded.org/mt/112148345/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

