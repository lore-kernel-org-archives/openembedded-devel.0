Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623D4C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 19:15:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.1156.1708024529128183410
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Feb 2024 11:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jVpvvYR0;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-410c804e933so8910825e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 11:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708024527; x=1708629327; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNQyUn/7u/mjXQjaNFMjW0N3PZlXu2drYDVCgd5g4SQ=;
        b=jVpvvYR0g+S3xWD1drnTjaMYI1ZjuOW5iAL5lbOM3XnYWiI+eoPjfojoZEXzfjhb/f
         16URGP1tFSSiEUEjbk9BcfPplpLhkPaiukeUplRd3JbYUjm/q2k6ZC0CrRgVBwDQrqb3
         ae9/Md4LbFAx4vvuGrmXbmAu7GXaWU7dtNiku8RjNkAcGl6LaP7yE0fMrwoCsqZB2Tnu
         69xDtayxsjMJel4P5QvoBpJonWnOy5wae6gU7krdA0gq8nrihY7kIaXdCwGpsHi1iMSM
         ZR1Rw6lhsrEx5ek/kFKnWxSHvv6zCGd7lFFFb+/Viorzj6iXHgTnPGUZLcA7IfMJBTQY
         y1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708024527; x=1708629327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNQyUn/7u/mjXQjaNFMjW0N3PZlXu2drYDVCgd5g4SQ=;
        b=WlyOiltJ+QFSFenCYbd1jEjDXIs/zqA/EAiFevC05xIqhBcQ2FynV+4fZMdTXveCtD
         mJve8CCt4nAoWS1ImODNL7IAa5BprBdFIqjDxqBt5RWagZL3gWmHzaBmEaekaUEH57Ff
         2e06ART81fR7EB1xonR2ju2dIyZYK5acMjy4CE8hhZpSLSaUpctzxW6IIQ7WAQdeGVLs
         xr36vGUgo+WFiIhx4xiZlTrX6aI/31tOYrfWaAklmdBAxZdnt8/oN3wgrZYAPIiUBmdU
         pbvaGICeQrURPRzLvvt+3hLybmHxiS/N+jVYZVPDAON+RIimR6dIrNK5Ndlthcz05iMV
         SGPg==
X-Gm-Message-State: AOJu0YxQnqcyn6DiVhvLXAYGTosT99AC+z9cvBthFKzGMKoeH0OPbcFF
	fjJeokHaf5jb637ahLCQW4Mlxb/lDSBBX07yAFymr5Y0c/UdYsBrsaXu5QCbT83PqJz2UYG94EB
	g9NO/RC67e4O5rWGQi1bfst9iELQ=
X-Google-Smtp-Source: AGHT+IF2KYOWfK03cXfaxUkiLAXn1dvGqr2TYqEesV9SvATFsCQXdx7sA9DbPfZNyhZZTWMOWhIHtkAOgkZsVeb0BAU=
X-Received: by 2002:a05:600c:5189:b0:412:33e5:73ec with SMTP id
 fa9-20020a05600c518900b0041233e573ecmr566318wmb.22.1708024527287; Thu, 15 Feb
 2024 11:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20240215141708.2108422-1-max.oss.09@gmail.com>
 <20240215141708.2108422-2-max.oss.09@gmail.com> <CAMKF1sp-rDK-TOixzqMTBqqHwPNzacJdPwPM1AKQDg0+Nors2g@mail.gmail.com>
In-Reply-To: <CAMKF1sp-rDK-TOixzqMTBqqHwPNzacJdPwPM1AKQDg0+Nors2g@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Thu, 15 Feb 2024 20:15:16 +0100
Message-ID: <CAEHkU3WoObnUNpvoc6WqQM3AN+4dktOuAHCdh+-dCn+d5YRKSg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] libusbgx: uprev to the latest commit
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 19:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108757

On Thu, Feb 15, 2024 at 5:50=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Thu, Feb 15, 2024 at 6:17=E2=80=AFAM Max Krummenacher <max.oss.09@gmai=
l.com> wrote:
> >
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > Uprev libusbgx to ec0b01c to get following fixes:
> > ```
> > ec0b01c Merge pull request #83 from mgrzeschik/uac2-controls
> > cbf1750 uac2: add additional configuration controls
> > 81d7c05 load libcomposite kernel module
> > caad244 Fix: Memory leak config label
> > 51abbfd Automake: fix distclean of tests
> > 3cc5af7 Added printer function header to installed headers
> > adc45af Added missing extern C closing brace
> > ```
> >
> > Refresh 0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch=
.
> >
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >  meta-oe/recipes-support/libusbgx/libusbgx_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > V2:
> > - added the changed patch file to commit
> >
>
> Hmm I do not see this modified patchfile in patch. Did you miss it a
> second time?

It's definitely not my day.
Sorry.
>
> > diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe=
/recipes-support/libusbgx/libusbgx_git.bb
> > index 484110561..a20ff4eea 100644
> > --- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> > +++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
> >  inherit autotools pkgconfig systemd update-rc.d update-alternatives
> >
> >  PV =3D "0.2.0+git"
> > -SRCREV =3D "721e3a1cbd7e2b6361bb439d3959e7403e4f0092"
> > +SRCREV =3D "ec0b01c03fdc7893997b7b32ec1c12c6103f62f3"
> >  SRCBRANCH =3D "master"
> >  SRC_URI =3D " \
> >      git://github.com/libusbgx/libusbgx.git;branch=3D${SRCBRANCH};proto=
col=3Dhttps \
> > --
> > 2.42.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108755): https://lists.openembedded.org/g/openembed=
ded-devel/message/108755
> > Mute This Topic: https://lists.openembedded.org/mt/104373086/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

