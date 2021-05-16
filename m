Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.883.1621123877580733353
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 17:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HhApcPJ/;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id c20so2581157qkm.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 17:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0bb3zTV88j/ryv0LvFOVevhJoBq0z8i6rJksYvrSAB0=;
        b=HhApcPJ/7tqFoS/k6wYtHobrTKVTxntF5V8HSAUzKvgvIMNdXOPvCPJTke03ZO9Z1A
         jWVf/iVdReXIyWptkCyZP8OyFr2YxfPDx9DgskaeF+whpexzjWIt2beqW1pIFRpqgYRm
         +jVm3s4nQvboHurYbTGY6+0V/Gijoy4JGwWdtgM74xtxzT6CRqxfiWyJu77NTaVSQkw4
         N0sn0TBdukDvqpyli54wxkBpOQCay3ZPZd4pA5APxDpRn3UKiz7ADVt8KNda2iExvl+W
         ac7pU/t4zm3yGBeGP5Rj4KLzUdrKE6Tkj+MrUuftjwZ+UWcM2SmJNEhqnf2Lw1364NU5
         2h3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0bb3zTV88j/ryv0LvFOVevhJoBq0z8i6rJksYvrSAB0=;
        b=sqmY2eRhTWqqDfREAq2qye3IHWj6PgVGfknvOEXQUDZRX3CYs7D4YjcgqU+lpm4dS5
         pOiiBOLhDc4oyne9DwSoFK4pc7TYCRusENfwh84ugZcfnofFRVdZYlkQq1nAcUKLQ9uL
         kGfK0LinNGrmp/iXiTb4qWA6TwMx3CXFBq52E4ARaBUphb2UiosBTP6ClKmsS0rPpLIk
         C2/n/m2HbG1I5K3IvuYmnbjYTOP2MWJDkNNeXeHbH0H4VFR47gN5sQ6wQPK55N0g4Cuu
         3pW0/tTIQZ9LU2yymMOtruaqWvhHs4vTpaRqYfNtUn184ahQPyGV5ZhiXXGG33aP69vQ
         xxcw==
X-Gm-Message-State: AOAM531Tn9ND12yYSTJaDu/5w8sC+3dF0ULUVINrXud7sBDDyn/vrjQb
	v+diw5PJmr7lPZee8YenAjQOAvhGo4qHrcnzy40=
X-Google-Smtp-Source: ABdhPJw+xou/7PezUAQGL2NFxBz32moa1FXwUk0jk4IznY8I2IKiHRZ6rC5BAXfmNwWS/8BrvKAjgkk1J+qskOQ+DFk=
X-Received: by 2002:a37:444a:: with SMTP id r71mr12510440qka.381.1621123876619;
 Sat, 15 May 2021 17:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210515233853.583490-1-schnitzeltony@gmail.com> <20210515233853.583490-17-schnitzeltony@gmail.com>
In-Reply-To: <20210515233853.583490-17-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 15 May 2021 17:10:50 -0700
Message-ID: <CAMKF1sq89Sg8RQTU6nY-gP-7pmi=_pCPt5VCfQRZ=Dz4O=1Fjg@mail.gmail.com>
Subject: Re: [oe] [PATCH 17/20] Revert "gimp: Disable svg icons on arm"
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 15, 2021 at 4:39 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> gimp builds without issues on armv7 / gcc 11.1.0
>
> This reverts commit 57a7c1ed7d45b28cadd70d8fabda42fe906ddff7.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb b/meta-gnome/r=
ecipes-gimp/gimp/gimp_2.10.24.bb
> index 237d08a09..e729d9deb 100644
> --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
> @@ -54,7 +54,7 @@ EXTRA_OECONF =3D "--disable-python \
>  EXTRA_OECONF_append_mipsarch =3D " --disable-vector-icons"
>  EXTRA_OECONF_append_libc-musl_riscv32 =3D " --disable-vector-icons"
>  EXTRA_OECONF_append_libc-musl_x86 =3D " --disable-vector-icons"
> -EXTRA_OECONF_append_arm =3D " --disable-vector-icons"
> +EXTRA_OECONF_append_toolchain-clang_arm =3D " --disable-vector-icons"

thanks. I will verify it on gcc/musl and clang/musl scenarios and
perhaps its really the musl piece which is problematic
issue is qemu segfaults :(, qemu is also upgraded in master-next so
maybe even musl will start to work.

>
>  do_configure_append() {
>      find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
> --
> 2.31.1
>
>
>=20
>
