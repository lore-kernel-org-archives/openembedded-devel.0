Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web12.23614.1621865436884740790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 07:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ScAiHIVu;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id m13so20648288qtk.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 07:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RwOnwAaKy9tQtlg8j75Moj22M3kp8lGLdbRsFqYs41Y=;
        b=ScAiHIVuiqCYW5wf0ohnNdQ183EFPsSvMkw9DqzNYvdycusIRBKkLQ/yL5sszBpwtJ
         y3SbLleGI+bQHdoU/Q9DDWUE0867jRdNzml19VmD4/x6gTt8no0FaI5AembwZuDjl38m
         g2noy36P467S+IA30tv6psPv+brUHRj3VvzgFsUcagdRnrrqd3M+MADrNHkZcWXcksPV
         qmVnwczHVZ7FZ+a+BcG4sPA4kOXviNSSVuGTSrGML4yapri0wW2vwauws/8fpNfhHG/5
         esp/D5a+VXQf5+nP5Vr5tePiIIkePVzqhre7Tk+Dp9fmRCYV/miY7NQqriQv08DAkcUN
         D95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RwOnwAaKy9tQtlg8j75Moj22M3kp8lGLdbRsFqYs41Y=;
        b=tZtgYLae1vrdLTipk44C53Z+KqJa3xSnYK+E2KF8y/m17jSpDfHaWYhS6hlnDmZi1a
         zipbjHsgRyJBZG8Arape5qsEV4VoK/kO8y3w3zEQGILFWeY55hVvgsq7bxb+CaKu1vMA
         IkL08AOJmSm2pgMA9urQxr1VQK6mBP/8iR4/CI/BBb15Wz0iPs3sPZz3Dx+H6RvDIX/r
         WW8bxyVjQdNP0u+bhUgnj1qRifuWWqepCqdJPWW9DUpYz6QKgQc1DgK4YT/k8sG9E8JM
         E89aH/4D1DWCRdXoxZyzEkIPRbxFMfENgZzt7/mtBAXpC8HWdA299Yd+R65x51XbPBl5
         w+GQ==
X-Gm-Message-State: AOAM532L+zYbVxRCD9YpSA5YGPfR5lYv4XiqNhkhNNilOQBM7LOIq7mW
	av6gWDgr8d1tGKNamrS4d8DA+kXahMhNdjf5lHI=
X-Google-Smtp-Source: ABdhPJzXqoG5Dit/Q5tQcOtTzV9jPsO4jHsFrByp+fWQlGW63DPXKO0Zjjs8SLJuQVzxWktHFxw9PwhUUU05kAFidfI=
X-Received: by 2002:ac8:544:: with SMTP id c4mr26507754qth.299.1621865435941;
 Mon, 24 May 2021 07:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210524085554.4128366-1-Martin.Jansa@gmail.com> <20210524085554.4128366-2-Martin.Jansa@gmail.com>
In-Reply-To: <20210524085554.4128366-2-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 24 May 2021 07:10:09 -0700
Message-ID: <CAMKF1sodVQXdbyEKcmfNb5cvhiqDhJTGsiCBdic6zBhD6yV+DQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] libtinyxml2: restore building shared library
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 1:56 AM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> * since the upgrade to 8.1.0 which includes:
>   https://github.com/leethomason/tinyxml2/commit/7df6b3ff4ab3e3cec7a242f=
a5f8749decd129e13
>   it no longer produces shared libraries by default and linking
>   with static one will often fail, e.g.:
>
>   rosbag2-storage/0.2.4-1-r0/recipe-sysroot/usr/lib/libtinyxml2.a(tinyxm=
l2.cpp.o): relocation R_ARM_THM_MOVW_ABS_NC against `_ZN8tinyxml210XMLPrint=
er11CompactModeERKNS_10XMLElementE' can not be used when making a shared ob=
ject; recompile with -fPIC
>   rosbag2-storage/0.2.4-1-r0/recipe-sysroot/usr/lib/libtinyxml2.a(tinyxm=
l2.cpp.o)(.text+0x162): unresolvable R_ARM_THM_CALL relocation against symb=
ol `vfprintf@@GLIBC_2.4'
>
>   fastrtps/1.9.3-2-r0/recipe-sysroot/usr/lib/libtinyxml2.a(tinyxml2.cpp.=
o): relocation R_ARM_THM_MOVW_ABS_NC against `_ZN8tinyxml210XMLPrinter11Com=
pactModeERKNS_10XMLElementE' can not be used when making a shared object; r=
ecompile with -fPIC
>   fastrtps/1.9.3-2-r0/recipe-sysroot/usr/lib/libtinyxml2.a(tinyxml2.cpp.=
o)(.text+0x162): unresolvable R_ARM_THM_CALL relocation against symbol `vfp=
rintf@@GLIBC_2.4'
>
>   fastrtps-native/1.9.3-2-r0/recipe-sysroot-native/usr/lib/libtinyxml2.a=
(tinyxml2.cpp.o): relocation R_X86_64_PC32 against symbol `_ZN8tinyxml27Str=
Pair5ResetEv' can not be used when making a shared object; recompile with -=
fPIC
>
> * restore building shared library as 8.0.0 did
>
> * it also fixes PN package being empty:
>
>     diff --git a/packages/core2-64-webos-linux/libtinyxml2/libtinyxml2/l=
atest b/packages/core2-64-webos-linux/libtinyxml2/libtinyxml2/latest
>     index 594585fe..496a109d 100644
>     --- a/packages/core2-64-webos-linux/libtinyxml2/libtinyxml2/latest
>     +++ b/packages/core2-64-webos-linux/libtinyxml2/libtinyxml2/latest
>     @@ -1,9 +1,8 @@
>     -PV =3D 8.0.0
>     +PV =3D 8.1.0
>      PR =3D r0
>     -PKG =3D libtinyxml2-8
>     -RPROVIDES =3D libtinyxml2 (=3D8.0.0)
>     -RDEPENDS =3D glibc (>=3D 2.33) libgcc (>=3D 11.1.0) libstdc++ (>=3D=
 11.1.0)
>     +RPROVIDES =3D
>     +RDEPENDS =3D
>      RRECOMMENDS =3D libtinyxml2-lic
>     -PKGSIZE =3D 90076
>     +PKGSIZE =3D 0
>      FILES =3D /usr/bin/* /usr/sbin/* /usr/libexec/* /usr/lib/lib*.so.* =
/etc /com /var /bin/* /sbin/* /lib/*.so.* /lib/udev /usr/lib/udev /lib/udev=
 /usr/lib/udev /usr/share/libtinyxml2 /usr/lib/libtinyxml2/* /usr/share/pix=
maps /usr/share/applications /usr/share/idl /usr/share/omf /usr/share/sound=
s /usr/lib/bonobo/servers
>     -FILELIST =3D /usr/lib/libtinyxml2.so.8 /usr/lib/libtinyxml2.so.8.0.=
0
>     +FILELIST =3D
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb b/=
meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb
> index fea5aeff17..5245059a89 100644
> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb
> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb
> @@ -13,3 +13,5 @@ S =3D "${WORKDIR}/git"
>  inherit cmake
>
>  BBCLASSEXTEND =3D "native"
> +
> +EXTRA_OECMAKE +=3D "-Dtinyxml2_SHARED_LIBS=3DYES"

This fix is in fact fine. However I was wondering why .a is not built
using -fPIC since we do enable PIE/PIC in default distro now a days

> --
> 2.30.2
>
>
>=20
>
