Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEF7C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 05:04:57 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.28031.1679893495488251547
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 22:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ngn9FdqY;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id f4-20020a9d0384000000b0069fab3f4cafso3906319otf.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Mar 2023 22:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679893494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUn2BuaS/UvHMvJ8I1JIbivCbXwd4C1jS9xBMQ2Oe8k=;
        b=ngn9FdqYH53JfuFDSpVvBKNTNbQODAG72Pys49hLE0Ve4QhsAUEFZxwJROJ5/C/Cc4
         HjQE6EI/mPZvAjAcUZ0NP0GdlJbRsm8LCYuiJsojZZjr0DRYK8S8whqPTYGb+ZCgZily
         0rFE8KTqEfjzdJv6HeO4iNYrsPeDHX0E39S3+4p4XLkkRZQTr2ejPN8FHt6QL5nrCHbC
         yUtNvGruk5cGXlYFEPhei6htGGHFT9/MGBbzIFz9jUdPdg07uDwC5BHvfeUPUq75O4Dd
         2d2bwWdolP5tlU373l0zK9jd2By3OdZslJzf+8daoRMuxOE1IyXjupUEzyt1E0qaek6m
         2SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679893494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUn2BuaS/UvHMvJ8I1JIbivCbXwd4C1jS9xBMQ2Oe8k=;
        b=Q4OgbT3WcpRICag5260g/RRTKn+re8iswoQ0qGA3iXi1oKLgVcFmWbr9jYAAWaLZGh
         ZKry7qZZLpD6shTGpVJ71+1foOkipwzuAYkgguE/D1s18DX8JgcpDnRBP3+z+YiFS7eo
         qCPllTvKuiCw+sr/EJztLA/Ffa514qDmECVHerSvZnqwNJ762c9aG1SGVVjh7eL5RNu9
         7iVAvP6Hte/cJcLbM3zHtf1Ep6pPUUppghYsyx8ZxLPCTXWshhkbuev3QK3OQSv0lPsx
         KQ433tUF0Idjr8+euw1oKXM8TeEaeoRt9nAXR81I5/ceGOkITr3kaWSlCdb0jK5aqziD
         NxTA==
X-Gm-Message-State: AO0yUKUlaz371zpO41qqtpaHHApdfBk1sS6PjFmcsipz1tuCDkoabMmU
	7CHmRehNkOfaOH77BVB8Q9p+rxg7ZqRB+ar+3w0=
X-Google-Smtp-Source: AK7set8F72+F8DAvBKV0uot5kxy0/8QKuqdGvV5o44RpSLzUx6z3/3jUkrT9mljgGpodIN8VdY8J+caZXu8XfPtDHeg=
X-Received: by 2002:a05:6830:190:b0:69d:4900:69fa with SMTP id
 q16-20020a056830019000b0069d490069famr3534810ota.2.1679893494700; Sun, 26 Mar
 2023 22:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230325080256.923752-1-f_l_k@t-online.de> <20230325080256.923752-21-f_l_k@t-online.de>
 <CAMKF1sr9-1O5dykVWq_iXdKF0eNZbrXz-ftWMv7+9yejkX7tGw@mail.gmail.com>
In-Reply-To: <CAMKF1sr9-1O5dykVWq_iXdKF0eNZbrXz-ftWMv7+9yejkX7tGw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Mar 2023 22:04:28 -0700
Message-ID: <CAMKF1soLh_HUhFts+y2-A=-=o+KFcTSWMbRp_7CDE1JJPMhEdw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 21/32] gnome-terminal: update 3.46.7 -> 3.48.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 05:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101774

it needs latest vte 0.72.0+ I sent a recipe upgrade for oe-core for that

On Sun, Mar 26, 2023 at 8:59=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Fails to build like
>
> | ../git/meson.build:348:0: ERROR: Dependency lookup for vte-2.91 with
> method 'pkgconfig' failed: Invalid version, need 'vte-2.91'
> ['>=3D0.71.92'] found '0.70.3'.
>
> On Sat, Mar 25, 2023 at 1:03=E2=80=AFAM Markus Volk <f_l_k@t-online.de> w=
rote:
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  .../{gnome-terminal_3.46.7.bb =3D> gnome-terminal_3.48.0.bb}      | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.46.7.=
bb =3D> gnome-terminal_3.48.0.bb} (95%)
> >
> > diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.4=
6.7.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.0.bb
> > similarity index 95%
> > rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46=
.7.bb
> > rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.0=
.bb
> > index d9afeec46..75e609d15 100644
> > --- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb
> > +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.0.bb
> > @@ -22,7 +22,7 @@ DEPENDS =3D " \
> >
> >  SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=
=3Dhttps;nobranch=3D1"
> >  SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.p=
atch"
> > -SRCREV =3D "816edf80cd7bf7f253366099ea9fcaf361676139"
> > +SRCREV =3D "a85ecc959344ee2e0d345f7dd081dc781d95d364"
> >  S =3D "${WORKDIR}/git"
> >
> >  PACKAGECONFIG ?=3D ""
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#101733): https://lists.openembedded.org/g/openembed=
ded-devel/message/101733
> > Mute This Topic: https://lists.openembedded.org/mt/97840043/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

