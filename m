Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14018C52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 17:53:09 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.217222.1724089978762265471
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 10:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OmhNgnv5;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f035ae0fd1so51564681fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 10:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724089977; x=1724694777; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQnkSSvr+2W4ZGc59yVtxf3MsqbA4S6vbE9RJoWsdRY=;
        b=OmhNgnv5ScIn3g3TUBb1pAQcpHyvohUi1Lgl7wc1Ak5Df3xhfWrYs9+GPNwEFvrG50
         +w3N3gODiI09B1flnTI7CF3z6gv0fBADVeA1ktEnIpbMmAJ2h32RX2rl0M1M3lQGtl0U
         u2DxdIBiVQvhYMY3ZH5dEKBVizsoIm6/jZLFqyYn/O83oaajOtZpaSSKuudV2p0nfMHf
         IpcSrk2N3bpUq6ZJOg6w2QCs424hCQdVX4GYkq2a9S4Uw6RL/4HUi4dBhYBFptGbmlIg
         DJS+oMYJ4aheE15AtBOR6HEucNrB2m1t0e8W7c/GvXFjpiUD7XDMyg1cipxvBhCVUjAq
         DhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724089977; x=1724694777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQnkSSvr+2W4ZGc59yVtxf3MsqbA4S6vbE9RJoWsdRY=;
        b=uMyO8S8ANZ3MxLDFUVWP+m3MJKzoUdnlXtdQeO4g3PkiyA50ORXGUbPBnfY0wKcmo5
         7GY8H0kaIwhZJX0cTYdqn8U8GF4/FcbIOckrFttuXdStXqM6X0kKQNMtwDMoMM+1hBXq
         npJVn45YAhKa5qZ1xB7xazJIn+XrXewoxZhzidxDgRH9ubIhtJGS3EYinPIFikhB0qC2
         4G86tL26OYWTTLeOfpo7mZ5i7A1Im0agljqF0b16OZ8x0Cxl6T8IVphXs9kCCDxZ8tQ0
         IQ5IDh0m04rjhAnIz4OFsFgd26gNlI5/JFpeXo9U3KYLxsHABtRRzT0aptRhDC4RwyCv
         871A==
X-Forwarded-Encrypted: i=1; AJvYcCV4GJBRJ9XPGx7ek3AKcEGTrSL+o2r987S8vDqdapyAxB83OvJG3lHktjLfxz7ua+hIrU/z667NQa4LWYl0o1ajmY3WJ9VRvaB1HBc9bjc3rhQJKoxCDnUxrQ==
X-Gm-Message-State: AOJu0YznEFFL4szyv/uuKqhj8XFL+r5JE3fzEQiCuZqBVKPZGQKb/IqA
	Yh9ZMVNLokXyYzaoAkEKGJYLIz6p1eAQ18Vgi5Ump0d/i6Pfwtoq0iVDhKSFRCf60V6IqQ+4Xa0
	/ZlRIac9+17UTeLVkJ3DzRPY77t4=
X-Google-Smtp-Source: AGHT+IHTyhFwhLAnGv/aL2rol+YE6sckp3B7nRWPyoL7p1j2/AgUEL+q6GOfnTRi6DkZAOuR7qnRJ8vjv0T6nr2XUdc=
X-Received: by 2002:a2e:6a19:0:b0:2ef:2883:2746 with SMTP id
 38308e7fff4ca-2f3be6172f8mr74204531fa.48.1724089976223; Mon, 19 Aug 2024
 10:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240808191119.158166-1-alperyasinak1@gmail.com>
 <CA+chaQcJnco=qYqvhyrVHJ_5O99rJbM8NuqkvvAAWca5Rjx+ow@mail.gmail.com> <CAMKF1soCdbuW7YfT_Aq26N=jNc08BtgefLD+OAWdC9P=d8sT7A@mail.gmail.com>
In-Reply-To: <CAMKF1soCdbuW7YfT_Aq26N=jNc08BtgefLD+OAWdC9P=d8sT7A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 19 Aug 2024 19:52:36 +0200
Message-ID: <CA+chaQcTTubR=DfjaS-vsvbcLx-z7Djj28e_FyeQ1kTEy6MRLw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] blueman: Fix do_package QA issue
To: Khem Raj <raj.khem@gmail.com>
Cc: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 17:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111857

I've sent fix for that earlier today.

Cheers,

On Mon, Aug 19, 2024 at 7:52=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Mon, Aug 19, 2024 at 4:14=E2=80=AFAM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Doesn't this just hide the issue that the systemd service file is
> > installed in wrong directory?
> >
>
> yes infact it does sadly.
>
> > with current master I'm seeing:
> > ERROR: Didn't find service unit 'blueman-mechanism.service', specified
> > in SYSTEMD_SERVICE:blueman.
> >
> > On Thu, Aug 8, 2024 at 9:11=E2=80=AFPM Alper Ak via lists.openembedded.=
org
> > <alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > ERROR: blueman-2.4.3-r0 do_package: QA Issue: blueman: Files/director=
ies were installed but not shipped in any package:
> > >   /usr/lib/systemd/system
> > >   /usr/lib/systemd/system/blueman-mechanism.service
> > > Please set FILES such that these items are packaged. Alternatively if=
 they are unneeded, avoid installing them or delete them within do_install.
> > > blueman: 2 installed and not shipped files. [installed-vs-shipped]
> > > ERROR: blueman-2.4.3-r0 do_package: Fatal QA errors were found, faili=
ng task.
> > >
> > > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > > ---
> > >  meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4=
.3.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> > > index 5aa3b2bd5..df2a226f0 100644
> > > --- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> > > +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> > > @@ -40,6 +40,7 @@ FILES:${PN} +=3D " \
> > >      ${datadir} \
> > >      ${systemd_user_unitdir} \
> > >      ${PYTHON_SITEPACKAGES_DIR} \
> > > +    ${prefix}${systemd_system_unitdir} \
> > >  "
> > >
> > >  # In code, path to python is a variable that is replaced with path t=
o native version of it
> > > --
> > > 2.25.1
> > >
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111848): https://lists.openembedded.org/g/openembed=
ded-devel/message/111848
> > Mute This Topic: https://lists.openembedded.org/mt/107795994/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

