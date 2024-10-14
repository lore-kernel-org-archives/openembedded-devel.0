Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EB1D16279
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 14:43:27 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.56661.1728917005749024691
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 07:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mSU0i9yg;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb4ec17f5cso9068351fa.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 07:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728917004; x=1729521804; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gwQLgmUeUF03bVucNGkvNXX5W5sf5Vayok5cEZ35NY=;
        b=mSU0i9yg7w/BQtimJxrgpi4+8gWOEO38h8PxSTPNxCZpsnTAXaDI0Hq3X7IlZf6lSt
         zHzmXWF3srMfcIs9A/SR7NtMBPX4uSdDfFgG1BVON8ovB32F/wr0qlBwfw85nv9jRc/x
         +i8bw6PlYnrqz+iVz4G9mPhnwBeb7txZ6OphHgAoPt0k9PW6LX5r488jcOafptgx+stp
         ZrVowu2ohCiMjDbLPNl9m/Wj+xb1gpjENCGAgMu+9qhj5MvVYqPR/bhOHMGJ6h9uuIKc
         Eufx3SqP17aCOi6pB6bBZ/5A5amg+4VkdxG+FE7yQ7w9SU0xynzdVKxBiMOF6cpRZ6KR
         66oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728917004; x=1729521804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gwQLgmUeUF03bVucNGkvNXX5W5sf5Vayok5cEZ35NY=;
        b=lFpWLn4svnAoaxez5vcTphUQtHcv29zgA3q5SXXXfcvZjCswjlEXYIF/DZ5f/CeY8O
         MluvHRvaVAmK0GUsYtdpEjcZmCwRjfqndaLFot2QpiWU6WK1FTWdUEgwp6SIwJMcmuFI
         6fSlUD+DtLfl3vag0LdM7zHcgsu14246iPh/b9LJ4ZWHDSnpRxgfi3le36LMwjsv9ENz
         tOyJp7PQ72le8ERZEcs5JsfGyvKwGyYYlpkkQwXh6s3gRj0Nngihw0PpuSrWYPsQJq69
         E62KXF0cYEeGWAuhTyx3kjmzS2ohH7RByc5arrzGh0UHm3glYZqIztgMFCk86m8RhiuW
         KmbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0lMc37buYjYR8PydrwUnC6HOWPB0vnFoVxSEtB0A5yai1PbrGVhkOo9HoskQXK7b/LXtZ28SaGgKes/FLW8V/JY4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3KrxYSdi+xM3etDhvldzckQSgvbK1xxm2rHGqx1kdlfr8OW1U
	iDbRPOcZ1pYsxLnEKJ0xjnZ5O+mDkkFlek/lZ75dAvwdqOmVdlaUCU5TcEu8Namb+iIXo+LWZcf
	kUUrNEQrgnh/u2pJuacUHOef303A=
X-Google-Smtp-Source: AGHT+IFNuGul+3KcXGdSmrvsLAoUkAm2wT+mPpfyu5gGgRvGq18hTNSsBoaYnHXpWlDYzfzNoxkLjxy8nwQPRGQqiss=
X-Received: by 2002:a2e:bc19:0:b0:2fb:5a19:5b9b with SMTP id
 38308e7fff4ca-2fb5a196007mr2063181fa.8.1728917003233; Mon, 14 Oct 2024
 07:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20241009065729.4114713-1-guocai.he.cn@windriver.com> <CA+chaQfP+wSdV4=dptAsUxvdC-rVR-qTPDGPquShMaGTETKbCA@mail.gmail.com>
In-Reply-To: <CA+chaQfP+wSdV4=dptAsUxvdC-rVR-qTPDGPquShMaGTETKbCA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Oct 2024 16:43:11 +0200
Message-ID: <CA+chaQdv5hVWKMOLDn+pzkreru8+hUMx48uBmRESR2cY6t_XhQ@mail.gmail.com>
Subject: Re: [oe] [meta][kirkstone][PATCH] xmlrpc-c: fix do_fetch error
To: guocai.he.cn@windriver.com
Cc: kai.kang@windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 14:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112906

With old SRCREV from:
https://downloads.yoctoproject.org/mirror/sources/git2_github.com.mirror.xm=
lrpc-c.git.tar.gz

$ git diff 86405c7e1bd4f70287204a28d242a1054daab520
36b142d6179514989a44c1087f6c46182dafd21f
$

so at least the 1.54.02 content is the same, git history was rewritten
since the commit from 2018:
69ee98df Release 1.43.07

On Mon, Oct 14, 2024 at 8:43=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> I can confirm that the github repo was force pushed:
>
> From https://github.com/mirror/xmlrpc-c
>  + 46ac9180...f5b52c01 master     -> master  (forced update)
>
> but it should be double checked to see what changed between old and
> new SRCREV (you should be able to find old SRCREV still on some OE
> MIRROR).
>
> On Wed, Oct 9, 2024 at 8:57=E2=80=AFAM guocai he via lists.openembedded.o=
rg
> <guocai.he.cn=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Guocai He <guocai.he.cn@windriver.com>
> >
> > Fetcher failure:
> > Unable to find revision 86405c7e1bd4f70287204a28d242a1054daab520
> > in branch master
> >
> > Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> > ---
> >  meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/me=
ta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> > index 36205009a..991c4544b 100644
> > --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> > @@ -12,7 +12,7 @@ SRC_URI =3D "git://github.com/mirror/xmlrpc-c.git;bra=
nch=3Dmaster;protocol=3Dhttps \
> >             "
> >
> >  #Release 1.54.02
> > -SRCREV =3D "86405c7e1bd4f70287204a28d242a1054daab520"
> > +SRCREV =3D "36b142d6179514989a44c1087f6c46182dafd21f"
> >
> >  S =3D "${WORKDIR}/git/stable"
> >
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#112723): https://lists.openembedded.org/g/openembed=
ded-devel/message/112723
> > Mute This Topic: https://lists.openembedded.org/mt/108904710/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

