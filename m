Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DFBC3DA42
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 19:06:21 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.21875.1720983975411984455
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jul 2024 12:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LCw3VjNP;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5c66909738fso2041249eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Jul 2024 12:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720983974; x=1721588774; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGyZjIeujQuya6gpNN380neOi/sDhgxp/OAbRs8kfnE=;
        b=LCw3VjNPpb6ZDdlrQyMEJOtXaMejZ+mmoSfCRLI28vfH2GDujp6jZU2pBVul11zsxK
         cPZAxHj+AyBMNrgPovNQY669zyb23y7h7X0cA8E0bbmwiJ1lXQBB1WIIi7aKPG3xe3WS
         xIy1/g3AUYRuDtRdeecEala6tnwTCYsW7VID5u/0PmavKR7y210xKzmGb9OizFFo3BgL
         a3KpmWb1XWbG7TnXfBH+VlcxaSf9gsFrkbY6Yemq5cDjqLxitFiutoDEzvMaGZQSiJy4
         DcNiUU9EBaP8BC8ZoaEflt2ULWemC9kHUBSzO1CPzA7/sqXRXcPKdBPCA4R7hsuN+dNZ
         ebvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720983974; x=1721588774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGyZjIeujQuya6gpNN380neOi/sDhgxp/OAbRs8kfnE=;
        b=VY/1a8EbHrh3sVG6Q0T3j1wl5QjIaEHYG3gg84fI1N8tnDsqDdXwoiXXdLUGPII9Jy
         w/QlT1JMfEGjoDfsn+OYAN/ZWnb08h7IRvac8g0jbtS5od6WJp/171YHv7h2FZBb0eAv
         FGQYVCY420W3Gw/6kjUaeG1z4+CAqjhv3RoPWKQ8xZIkdivBR8KIyi2aURa/iLBF3dnQ
         xiAFEs1WVt0sviWJ+o3I/CdJxigScvQt9NI6SsK1v8dPJ6Em17ZntzKtw6SHDGcjXzGA
         jIBIptUlPK8lTVZ2VQa73kK28RHvefu+mfuyZ+t9lyzU7yUkyxv/Rgrbho+tNGpkFOTR
         aiFw==
X-Gm-Message-State: AOJu0YzHi4U7QJbuEDZ7Vjl9Cx8wfFbGFTnLaSi4U81OWNSRptCIBto+
	AfxXJ9ZN3F+CaV7UmPl0ToQpxx5ArpZ44uJKnQGxtILEBak7AGsz1VYTmjSyBffWe8C8eV2VbIA
	NmWK/D6pcCbkZuXqZ+itNRmaO1nySySdudxQ=
X-Google-Smtp-Source: AGHT+IEGIDMeI6247VE+fdC1BHmMlqZBk8st+zxgyCD/8rGHj1VjFyWTyMVtuItTcqPu+ehPUVfIN2h00Xlk3WAiZ+k=
X-Received: by 2002:a05:687c:2bd0:b0:259:8371:513f with SMTP id
 586e51a60fabf-26052960675mr3768632fac.21.1720983974427; Sun, 14 Jul 2024
 12:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <fac02277-c377-4377-974b-0ec817b108f9@3mdeb.com> <CAMKF1srQFVzXoRQw4AGfAproReiJb2M_qASoaEFxkr6a8VBPZw@mail.gmail.com>
In-Reply-To: <CAMKF1srQFVzXoRQw4AGfAproReiJb2M_qASoaEFxkr6a8VBPZw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Jul 2024 12:05:48 -0700
Message-ID: <CAMKF1srk4Rh28F9SatDbuEhQNOkOZH7nmu=SyzdywW3Hz1feyw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] meta-networking:
 recipes-support: miniocli: add
To: daniil.klimuk@3mdeb.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Jul 2024 19:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111320

I applied it manually and it has further build issues.

https://errors.yoctoproject.org/Errors/Details/790778/

On Wed, Jul 10, 2024 at 7:47=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> still the patch is corrupted.
>
> On Wed, Jul 10, 2024 at 7:32=E2=80=AFAM Danik via lists.openembedded.org
> <daniil.klimuk=3D3mdeb.com@lists.openembedded.org> wrote:
> >
> > meta-networking: recipes-support: miniocli: add
> >
> > Adds CLI tool to manage MinIO S3 deployments.
> >
> > Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com>
> >
> > diff --git a/meta-networking/recipes-support/miniocli/miniocli_git.bb
> > b/meta-networking/recipes-support/miniocli/miniocli_git.bb
> > new file mode 100644
> > index 000000000000..5207acf9891c
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/miniocli/miniocli_git.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY =3D "Simple and fast CLI tool to manage MinIO deployments."
> > +HOMEPAGE =3D "https://min.io/docs/minio/linux/reference/minio-mc.html"
> > +SECTION =3D "net"
> > +
> > +GO_IMPORT =3D "github.com/minio/mc"
> > +
> > +inherit go-mod
> > +
> > +LICENSE =3D "AGPL-3.0"
> > +LIC_FILES_CHKSUM =3D
> > "file://src/${GO_IMPORT}/LICENSE;md5=3Deb1e647870add0502f8f010b19de32af=
"
> > +
> > +SRC_URI =3D "git://${GO_IMPORT};protocol=3Dhttps;branch=3Dmaster"
> > +SRCREV =3D "e7c9a733c680fe62066d24e8718f81938b4f6606"
> > +
> > +FILES:${PN} +=3D "${bindir}/mc"
> > +
> > +# MinIO CLI depends on getent which is a part of glibc-utils.
> > +RDEPENDS:${PN} =3D "glibc-utils"
> > +# github.com/minio/mc has some Bash scripts.
> > +RDEPENDS:${PN}-dev =3D "bash"
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111300): https://lists.openembedded.org/g/openembed=
ded-devel/message/111300
> > Mute This Topic: https://lists.openembedded.org/mt/107143600/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

