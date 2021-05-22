Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.6265.1621687500992225939
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 05:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DrLUx9zt;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id v4so17335775qtp.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 05:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jN4vc6SpF6nADuYYDRk716dxxpxwzp/OzakdZm5A/7A=;
        b=DrLUx9ztVpyhsKj99uW3Uyc/5NwdHHNIwYx2githEuYFm1A/NFGrh/NFqzsIoFPmqH
         hZrITWjpV08LTmvTfkxXP9EWQFNyAqhtajiDnMHC5CvSBVJcJHkU2gVpdzoNX7egfVjB
         P1EbNTnSX+uM/iCl8t2h9Xa/uImUo/uGvI8pQx4Lk4PsRLwLbx6NrI2I8W4iLKVH3Kw9
         11ju8MRhJLnkj+/+W3lLyXalb6rOj2/eNGEXqHUv4kybFQGlU26Vm0Ej8/0TCqSpoJHR
         GBaRF8CkQnjEvweIHcFxuFDzsp6IhgvASmubb0NmYcdc+r8r6HEKxbTJRHvglTkO6dzh
         0BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jN4vc6SpF6nADuYYDRk716dxxpxwzp/OzakdZm5A/7A=;
        b=tzj4ycw3utCzp1RmD8mLzC2KgsSjGp+7Jrqc6ZOVTgfufy1gaGg2a1uNgpqcIAANbK
         HDT1QqO6pA+f4sl1pZD0KJzadYs1nZtmsRD8MDoASXCu3uEHZOSiylZwekBByPqaEqnc
         HbgnJXB/L+xvq5e+6TsbCD5HCuMusbw55yaMTqjRCuUee+X0dVtn+4NccrpZgriWo5CR
         iaEG/WxPu+qOaBwnLsBWY7wpomTH6lGNbYciSNDZmsVYYCfPs/bzh7aplg5AWbiSz3Dx
         PMKgdtDHZS5RUVRthTlARz7M8IADn+Xs5Hu/w29lD+BR3oCYNIOEX31nz+90l++Mi/x3
         6iDQ==
X-Gm-Message-State: AOAM530X1hjph09M5MhSDYLgRKaUeln5cQIULhLpw1+07fXyda9QjZcX
	L4C9I7kq/z6tVG7JKVfPRI42lIElrIemZ29Io5M=
X-Google-Smtp-Source: ABdhPJwYrUYYsJMIFM3vHunQXu+ePduOeU2bl6Snf0eIoolCZpDPAHI9LmCPmmbC01uSD2UO7g9N1gD8Pi8oQDDOm5A=
X-Received: by 2002:ac8:4252:: with SMTP id r18mr13956750qtm.82.1621687500128;
 Sat, 22 May 2021 05:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210522013521.588774-1-schnitzeltony@gmail.com> <20210522013521.588774-13-schnitzeltony@gmail.com>
In-Reply-To: <20210522013521.588774-13-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 22 May 2021 05:44:34 -0700
Message-ID: <CAMKF1srHF+Wj8EzoqjQ9AfmoPVvnp-GH_49fMYHod0DZ7WN3rA@mail.gmail.com>
Subject: Re: [oe] [PATCH 13/17] protobuf-c: upgrade 1.3.3 -> 1.4.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

seeing errors

https://errors.yoctoproject.org/Errors/Details/585453/
https://errors.yoctoproject.org/Errors/Details/585452/

On Fri, May 21, 2021 at 6:35 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../protobuf-c/0001-avoid-race-condition.patch         | 10 +++++-----
>  .../{protobuf-c_1.3.3.bb =3D> protobuf-c_1.4.0.bb}       |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.3.3.bb =3D> prot=
obuf-c_1.4.0.bb} (96%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-rac=
e-condition.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid=
-race-condition.patch
> index 4fc7703d8..17fa14092 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condi=
tion.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condi=
tion.patch
> @@ -20,17 +20,17 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index b0cb065..1608ae0 100644
> +index c7339ef..882756d 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -156,6 +156,7 @@ noinst_PROGRAMS +=3D \
> - t_generated_code2_cxx_generate_packed_data_SOURCES =3D \
> +@@ -166,6 +166,7 @@ t_generated_code2_cxx_generate_packed_data_SOURCES =
=
=3D \
>         t/generated-code2/cxx-generate-packed-data.cc \
> -       t/test-full.pb.cc
> +       t/test-full.pb.cc \
> +       protobuf-c/protobuf-c.pb.cc
>  +t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
>   $(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb.=
h
>   t_generated_code2_cxx_generate_packed_data_CXXFLAGS =3D \
>         $(AM_CXXFLAGS) \
>  --
> -2.17.1
> +2.31.1
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb b/met=
a-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> similarity index 96%
> rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> index 6fef0bed2..85172047a 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcb901168715=
f4782a2b06c3ddaefa558"
>
>  DEPENDS =3D "protobuf-native protobuf"
>
> -SRCREV =3D "f20a3fa131c275a0e795d99a28f94b4dbbb5af26"
> +SRCREV =3D "f224ab2eeb648a818eb20687d7150a285442c907"
>
>  SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git \
>             file://0001-avoid-race-condition.patch \
> --
> 2.31.1
>
>
>=20
>
