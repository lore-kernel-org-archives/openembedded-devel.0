Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE752D6D255
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 03:15:44 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.87265.1732763735415161945
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 19:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HCKh8QzA;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: schonm@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-296539a58b4so276152fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 19:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732763734; x=1733368534; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajYmSb8jAPHexdMvzyby/+Y8bVLX9/PBWFY3sPT2Dgw=;
        b=HCKh8QzAASXgEf76PRiKVfwhfC/lyyOC/wppKksgQXuMzgSsjMMSVJ9EDuVmOqXpvk
         fSw1HdppkFQnblZptUQRr462cPUSK5JPLhL8CLT8oH1xl5+55ejXSxjw2SFdFbbdN704
         DzV1gF/H564S7GN9Z7+MtyRVRuGkmxvzzLbvGIaDdn1O619tVZVfPgOP77KgHDeye6/M
         IM5TQkdwJ0OJbFobUQ/yTBvDjTw5ffKECaGN9rhCCVwgRJjmHEeJrBNENLNEJn8bBKlE
         zIngZZJNpkzOmX+9sYUkikGqZXhMzZjN0+ubNFn2gvRTJrKcKWMacoLGVHXk73bQkdY8
         Bc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732763734; x=1733368534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajYmSb8jAPHexdMvzyby/+Y8bVLX9/PBWFY3sPT2Dgw=;
        b=asKqNSm808h7AUaU69kyqWqgpAcWZrKZLQKESDF+Pqto4Pae1uoJ8jZHRLvqiganup
         uxAXqcfrmrNovMKTk+WvRz8fuWDDxb8ZNKerwBPafuVDUI+UF63O93qExFnvOh+HEhY9
         y+5tP1J+mTfBtTHfrAzlE8dUbapqV3gMZLrH6vRGQlb/hBguOkMNZe+6tlaiv/gA/xEN
         mHihcSiYoOrmz1w5qy/LG+AZSzVhPjdGxsyIAeb9UuWUTxOa/WtocgnTRP+ulNULrJov
         graLMRRzC9LhTYKsloFR4Gps/jFSBgSbUDv7hA3yCcpl1pFuCDiTMn6tp88A/yht4vWe
         3+yA==
X-Gm-Message-State: AOJu0Yz9zzVF+Y8rtJgo5iG3y8eBdJVhSb0rMXjNASanZfzdHGqiDs2C
	ltNGr5X50PG7N8e8gQPFoLCRJk+9AA46dcFL5uC9yFdUE32TIKxdgzmBxoYak9H4L80cnig0pVD
	681akhG3kAuj+NRnZ+lDvfFhh/5g=
X-Gm-Gg: ASbGncuBM99QTSeJRG0yFuSRXCe7WuKzNZ3K44mWAjCYiSiQA6eRmaQriwIL1h2QLmx
	MTtwUyO15isx84sN+C+yu/hyCUAvkPw==
X-Google-Smtp-Source: AGHT+IE7b6X5qRDWQCGWcYlr7hsBQdG1NmuWQEVLSRqf3t6KWO4IWxJ6gk73X8OmTuDVttFV/x7+JNz+k3UkYBK2/rg=
X-Received: by 2002:a05:6871:e7c4:b0:29d:c8fd:cccd with SMTP id
 586e51a60fabf-29dc8fdf378mr4792195fac.2.1732763734195; Wed, 27 Nov 2024
 19:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20241126064854.1685359-1-schonm@gmail.com> <20241126064854.1685359-2-schonm@gmail.com>
 <CAMKF1srK0ZGNLYOk=Syc=ucNjbRC=0_Dq4stC-vWkUxomVGbjw@mail.gmail.com>
In-Reply-To: <CAMKF1srK0ZGNLYOk=Syc=ucNjbRC=0_Dq4stC-vWkUxomVGbjw@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Wed, 27 Nov 2024 22:15:22 -0500
Message-ID: <CABTo8gDUPOseb9=PQbuYUfp6ZOtAeTf+er4XE1S2weZ_M7MD6w@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 2/2] xfce4-settings: ignore some warnings.
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 03:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114100

Agreed.

https://patchwork.yoctoproject.org/project/oe/patch/20241127005545.86128-1-=
schonm@gmail.com/

On Tue, Nov 26, 2024 at 10:23=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> On Mon, Nov 25, 2024 at 10:49=E2=80=AFPM J. S. via lists.openembedded.org
> <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > ---
> >  meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.=
3.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
> > index 7bfcb492f..f9620d85d 100644
> > --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
> > +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
> > @@ -11,6 +11,7 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
> >  SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch"
> >  SRC_URI[sha256sum] =3D "2db9e99be503280739a08779503bdf11db8b9db9851c3a=
981deb449002f3f1a1"
> >
> > +CFLAGS +=3D " -Wno-deprecated-declarations -Wno-implicit-function-decl=
aration"
>
> Some context around build failure would be good to document either as
> comment or commit msg, that will help in removing
> these options in future when code is fixed.
>
> >  EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
> >
> >  PACKAGECONFIG ??=3D " \
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#114059): https://lists.openembedded.org/g/openembed=
ded-devel/message/114059
> > Mute This Topic: https://lists.openembedded.org/mt/109786213/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

