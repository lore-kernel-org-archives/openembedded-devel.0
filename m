Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14D2C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 05:24:07 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.68108.1744089838464618743
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 22:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LMXLpJjX;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-603be85490bso2851690eaf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 22:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744089837; x=1744694637; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQtpfrM6J1Yn55GvrX4mA2+yC0zEMT19SleL4udbhYo=;
        b=LMXLpJjX2+7XpUB18uUdkZa0dFNiX5ZjVJyOzlm2Tw1aggJsiodKNH77Px0qW8+2xA
         ov29O+slP+0JHqUGYOOvINXbcven6ewoDdsejbSmwqmqpG7sq0MtgOJvNE8MOb0a57Ws
         0ledHxFDcn1qnlwjw6RKIfZ8eu9m3r7EynyqkkGPkvVZ4BlUmcgDTVV+FOWQywdZ95KS
         6r5FjfAQtTdj1HMxT0BUiaQ5pvKT9BdIZws5yyNVMRGypahCspicesFtW9xYck/pqFhU
         pzX6Dn2moUuZar5vARlAvxX0krcvSkOTE+jDdAdEnkAs2KeNSnNwPjOapDH73ctveSpI
         WAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744089837; x=1744694637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQtpfrM6J1Yn55GvrX4mA2+yC0zEMT19SleL4udbhYo=;
        b=nvMHDnF5rQmwM1t660jK7XnWatl2XcYpD2q0SKraGE1aCT+Cx2MmuprriPcHEUFoKQ
         mm05/6m86eCtzNEelw9HJ28qMKBWTOdvkHzw8MI+Ew7gDCRKeyFla+NAfyYjVFO2GXOb
         iLu9bGg4C5AJB5zs0Z/nG5465gc1F9D0tN3X8jr0vjeT301RMvg2OtlygWufIsZerWOe
         gDcDWAo0M0NTBSlE1LGWPd7zTwrintqeQWYTrgcfotJAmU+YjFDM0LdbvAfwBZtnwkCb
         bGnFLtvGHh7+RfTn0KH8fiWxQJroNG9drnUmQKgEcw04QMefeHarGQ59n8JREVU6W7pj
         kljA==
X-Gm-Message-State: AOJu0Yzu92wmeB7Aan0sSAN1PNpfpwiL7oBxGXog+b0vk0r8MDUgXTdu
	jpdazaYNRwR/RZf2mEkA+vIeex8eZUipWHtiiVfpdIKHSAkkQHFqY6xp6gVB6jPAjnfCvuQBIVs
	GzIhlQZt0OzCE8Syv5nnB7J+tmSs=
X-Gm-Gg: ASbGncsRX3Y5gAf0MaGOcO/bXPM8tmilUqwqWAa/ybz8cosrTVC2YtqDNq9/7pu1lpi
	f1V2FQFYDF+Av2be0Fv7CX9aSa/lXdtdbEEvKNEReXA8xJ7+UJ0C/lu7Nqv/4RHxJ/iyWVZN+4j
	wW1amuLWIuiQA9Pq8Vscvl68a1vZ+A9XB+EP8=
X-Google-Smtp-Source: AGHT+IFFjh7u59jrbEmhI4yD5RPMQmuRXwIokRUbpwU5OAAMKHIqc9Qbq+Q9XehKTElvDH5x8Ja9AYl2yomowIEanXk=
X-Received: by 2002:a05:6820:507:b0:600:29ec:7619 with SMTP id
 006d021491bc7-604164da5e5mr8197312eaf.2.1744089837606; Mon, 07 Apr 2025
 22:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250408040304.4005939-1-alistair.francis@wdc.com>
In-Reply-To: <20250408040304.4005939-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Apr 2025 22:23:31 -0700
X-Gm-Features: ATxdqUHI_Eak9RBfhUwUYzRNT9LHoT0QJHzAL7RTh5KGS_kPrGnrBsKXWWE4P_4
Message-ID: <CAMKF1sp9dNztH_Wy3AMKGymWdMm4ybUzosAWnHSXhJqpz6zJAg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ktls-utils: Initial commit
To: alistair23@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 05:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116689

On Mon, Apr 7, 2025 at 9:03=E2=80=AFPM Alistair Francis via
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
>  .../ktls-utils/ktls-utils_0.11.bb               | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
>
> diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb b/meta-=
oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
> new file mode 100644
> index 0000000000..e85dc4ac72
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
> @@ -0,0 +1,17 @@
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
> +inherit autotools pkgconfig systemd
> +
> +PACKAGECONFIG[systemd] =3D "--with-systemd,,systemd"

I think it should inherit systemd and then conditionally enable this
packageconfig if systemd is in DISTRO_FEATURES

> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116685): https://lists.openembedded.org/g/openembedde=
d-devel/message/116685
> Mute This Topic: https://lists.openembedded.org/mt/112147500/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

