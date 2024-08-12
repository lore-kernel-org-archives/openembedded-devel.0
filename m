Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C80C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 02:42:31 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.37796.1723430544776118310
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Aug 2024 19:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KPbXERyN;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70d199fb3dfso3143809b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 19:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723430544; x=1724035344; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsWSrSSh5HXLjTtG5GZtG02gFOqzqRixTP7I4ChYvAU=;
        b=KPbXERyNHEhsZMms/1hCVeaLcyIcOTFfbWO9ixP8tLQUcRHsIUuH8mYqkBOxvxSBHC
         toDiEBNpyjDXRJlnssW7EXejzN6qfsW2ZRXe2/CHBeX4uDZ/oOnRMuxv0RHiSpVm/7PS
         r2+EN4lSehSLXs5BF2VFwsGKjci8I0tTA2Jhd5QI1hJqzvG8ULTnjPJlmZsS3Xgp9Ui0
         UJ4q5QPJIw3P/thcAyfro6YNKcB9I5M6Jo0ZN1V+owi786/HkMz16UxXrrb8RIkGhINo
         Qqoc3iBI9iCIJS6j/OTD/+VFlodXBC71H41+98v+CvUFIjSNvm+Uu02rzLqeTlvxIgJD
         hRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723430544; x=1724035344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsWSrSSh5HXLjTtG5GZtG02gFOqzqRixTP7I4ChYvAU=;
        b=rAYFmaZ0Xw4GmZUjXN9qcO/tNp7U1aKCtDXLWelCkxa03kEYfYFb2C+FUOnUHOA2z+
         6tijqJmtUJ6hlmjJHncEJ9zdSg2vMQIexj9wEVGkunE9QU4N0YN/mJ/zGgOSrIBaKzTx
         pepR/A/mCupmJ0QtbzMDAnJ506NC2kB7IuqnPJXGzyG5lZX7EAcSleM3bb7cEvX495M0
         eJsDMx0fpWHgxaAaXezR8Vh+Kb+982eYHSiIdhbibrhr/1Aq54CIQC/U2KI74hxaZcdl
         QWcQeUXi6lNP0bUWvPpKsZUeLJNhUP9ruTob6evfSAb+yws9aRakkL0Dsqe+ZNYDsLU5
         b3xQ==
X-Gm-Message-State: AOJu0YzCBpSaN7Lz0RT2g3JIFnRrqXh9/QrXGEBqGpmDxWhT/v67BUbm
	/KXN7Jwq8wbd1QgCJg5iSd/rRuDaHjqLixZ+UewZmn8haz19mQeH9kwoV6Wd2Q42WDW0mPRtvhj
	VY5uPYANTSoI7vcZ/OYKVIqf0pro=
X-Google-Smtp-Source: AGHT+IGPv+IndVbXGnoIAVBCelhjhk315361pDqF44OKGTGO4ub8kwEYDve3iRaJpV3lfgEReHJBAwYkVI1fyoo427Q=
X-Received: by 2002:a05:6a20:e608:b0:1c4:d05c:a967 with SMTP id
 adf61e73a8af0-1c8a013852fmr10991161637.51.1723430543893; Sun, 11 Aug 2024
 19:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240811171344.3511960-1-raj.khem@gmail.com>
In-Reply-To: <20240811171344.3511960-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 11 Aug 2024 22:42:13 -0400
Message-ID: <CADkTA4M_is1Q3Ef3p+xN=btb5rJ2PBrAj6XdyO=6P4Vwf+6RwA@mail.gmail.com>
Subject: Re: [meta-filesystems][PATCH] zfs: Upgrade to 2.2.5 release
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 02:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111757

On Sun, Aug 11, 2024 at 1:13=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Enable linux builtins to fix zfs build

Fantastic. I was going to check on this again on Monday and you beat me to =
it.

Bruce

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../recipes-filesystems/zfs/{zfs_2.2.2.bb =3D> zfs_2.2.5.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.2.2.bb =3D> zfs_2=
.2.5.bb} (96%)
>
> diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb b/meta=
-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
> similarity index 96%
> rename from meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb
> rename to meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
> index d3ea6797e7..504fe28923 100644
> --- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb
> +++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "CDDL-1.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7087caaf1dc8a2856585619f4a787=
faa"
>  HOMEPAGE =3D"https://github.com/openzfs/zfs"
>
> -SRCREV =3D "494aaaed89cb9fe9f2da3b6c6f465a4bc9f6a7e1"
> +SRCREV =3D "33174af15112ed5c53299da2d28e763b0163f428"
>  SRC_URI =3D "git://github.com/openzfs/zfs;protocol=3Dhttps;branch=3Dzfs-=
2.2-release \
>             file://0001-Define-strndupa-if-it-does-not-exist.patch \
>             file://aaf28a4630af60496c9d33db1d06a7d7d8983422.patch \
> @@ -35,7 +35,7 @@ EXTRA_OECONF:append =3D " \
>      --with-systemdgeneratordir=3D${nonarch_base_libdir}/systemd/system-g=
enerators \
>      --with-systemdpresetdir=3D${nonarch_base_libdir}/systemd/system-pres=
et \
>      --with-systemdmodulesloaddir=3D${sysconfdir}/module-load.d \
> -    --without-dracutdir \
> +    --without-dracutdir --enable-linux-builtin \
>  "
>
>  EXTRA_OEMAKE:append =3D " \



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

