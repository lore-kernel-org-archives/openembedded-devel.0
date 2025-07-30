Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBF7C83F26
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 15:08:52 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.37912.1753888122261091088
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 08:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IVuPtj1m;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so943161966b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 08:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753888120; x=1754492920; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pusULjESod8vnildMRwRryOYILzQlpWNJIopb33c6M=;
        b=IVuPtj1mzsvDFcvoEplaY72bNlcC+aHIqTz9Aun7VaeVuQdiw9CY1QBafrSnXacIHQ
         10Yf5CTMydsm1jx3bI+9rNPp9uB5F91ppJRDUvdrupyR4vwMtcycUlTOhycDCgVmxmj0
         nvMISG+f6GCXAEV/hQDBkwMX6FJ3TvLo8lEY/SmMxyxPNJFz3mpmWcZV/TWgXbvkUcWN
         xHgT4Pn07kDcwMkcSfdpU1kA0sPwHybYaYZaIu5X57LyzZ/IJq2u4x3BxDiAvQuxxcAU
         /o+EuHaEZrgVwmwgraNY6hZdcxAkHF2x3OlFhPIfedflkuJQ07ndpv6/habyKzFEIVZ1
         1S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753888120; x=1754492920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pusULjESod8vnildMRwRryOYILzQlpWNJIopb33c6M=;
        b=gLlpYxNAlvECthvCzqxrw/WNbNot/oPwT0YrA7+yuSiJgiOppArk8NZY5slNkvS7D5
         KS8rSX2o1YRZtlD3L6xWRyOiOQPIGvDrSvFmZLAXLO9zxuFTo5KBse7MXkNxS1keeNPT
         i0PWVc2yrIT2tMoThIpf8dSM0//gdZqAmI/X3dVMewYYa4ng/bBjLS/RNhWDJN57jvLf
         3c5bWpKDWFvdqUkF/nkgixBahWVcI/VFgzE2t+fs4x26lj18fVtFJU98ysGiGKxmx4fK
         It6sQj/iv6hXnXYnENz08t75501kqucjqGc4CNp5EKLVnxCWzP2wHcYNgXrJ4ium7xDb
         VgLA==
X-Gm-Message-State: AOJu0YxVTdayTJbfHNxHX6xT79hR5n+t6upm7U6kWyoPQ8VP/PfWNGUm
	wpQxtUACHcKOWAngtYvYNS5KD6pTozogIBYrGsK+wl484HgEbcMmR9ic3RCMEeRwbzG3bGCVP8J
	L4Ro0QKQNo92RCWAi6n4E9Y6OC3EkapU=
X-Gm-Gg: ASbGncsbjRz9nl/zJIMwF4RpydddSbGkV63skakJlIbPd/7rgFtpxNH5xmM2EW6rOqR
	dx1xpXCZlxAjeIc8lmJDcB/K7xhIfPCUlkUyQ/EgM3C3KjWTPmMgsJRDNS/iCyx1YECedgUsKU5
	2C/n9KeGjy09oWxyroXcYTAgXPHtXKPGmN9R+WTk8vu6XoTA/Eb1wsdXaMlD7ugVeIO9/Rb5USN
	/kDEFlyGmpc1d/3r1ieYULAXnYZ4V56307aDOf5
X-Google-Smtp-Source: AGHT+IHSF0+xXxkR+Me/hdleJUO5IBACKIRgAR8nbxsyNtGf1nH5c8VG0Imua6ETmf3BPuaEEORohKA5NydOVgtyntU=
X-Received: by 2002:a17:907:3ea9:b0:ae3:a799:8e84 with SMTP id
 a640c23a62f3a-af8fd6912c2mr408135166b.8.1753888120197; Wed, 30 Jul 2025
 08:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250730081937.1572-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20250730081937.1572-1-liuyd.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jul 2025 08:07:47 -0700
X-Gm-Features: Ac12FXw15oiN7ilcwDjFmLebyQ629nh2meZejQKmo4w8X_HCd_SHusxR_u82E-Y
Message-ID: <CAMKF1sruaarbyZq_bbKgPO35sVQpKVyNLc3JjewiqVf_kcoYtQ@mail.gmail.com>
Subject: Re: [meta-oe] [PATCH] uftrace: fix issue that actually not install
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 15:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118798

On Wed, Jul 30, 2025 at 1:19=E2=80=AFAM Liu Yiding <liuyd.fnst@fujitsu.com>=
 wrote:
>
> 1. "oe_runmake DESTDIR=3D${D} install" will actually install to ${D},
> "oe_runmake DESTDIR=3D${D}" will skip install, ${D} is empty
>
> 2. fix issue that:
> | ERROR: uftrace-0.18-r0 do_package: QA Issue: File '/usr/lib/libelf.so' =
from
> | uftrace was already stripped, this will prevent future debugging! [alre=
ady-stripped]
>
> we have set to use sysroot libelf in do_configure with "--with-elfutils=
=3D${STAGING_EXECPREFIXDIR}",
> here remove uftrace build libelf
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb b/meta-oe/r=
ecipes-devtools/uftrace/uftrace_0.18.bb
> index 7ba2dcadc9..6764557f37 100644
> --- a/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
> +++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
> @@ -41,7 +41,8 @@ do_compile() {
>  }
>
>  do_install() {
> -    oe_runmake DESTDIR=3D${D}
> +    oe_runmake DESTDIR=3D${D} install
> +    rm -f ${D}/usr/lib/libelf.so*

Thanks, it should be using ${libdir} instead of /usr/lib here which I have =
fixed
locally.

>  }
>
>  FILES_SOLIBSDEV =3D ""
> --
> 2.43.0
>

