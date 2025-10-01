Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE4DCCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 23:32:08 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.353.1759361523988928533
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 16:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DxIBoPZB;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d5fe46572so5303027b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 16:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759361523; x=1759966323; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFzYy6BtS+jiY0jGycJ88NyrYneWe0hr7BZNwsT4brk=;
        b=DxIBoPZBsxSUyiLa+p6qz8gmhAosAi7CPqsJ+edEdd+rSF9tXqCAh7kpdk0nh6XbAF
         KmL0f1FVW2JkFlFaofkhUezzqIAgrpXGdDXDiGxd5HVkkfVlNxaM6bd5eeQmnjmI+qDo
         LsgtVnlw8NGXrpAegtkoFQPOPuvEMR4VV4GMNxCSiPqXd+QhhfhKXRm3hi7dqBcwtZc3
         pSI3CdSqMeJ3n84TjWJ/WSnwp5GETdQPB16asdw9hxkxrk2pglZtgRjCW2OYqsSAI/6H
         hJ/F70F20CO7U4meczpehoMXJ9oauwoOIfqCb3DvpUfoTpiH8anCQREBVYcQeUHQ56XS
         Z6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759361523; x=1759966323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFzYy6BtS+jiY0jGycJ88NyrYneWe0hr7BZNwsT4brk=;
        b=fcAhDBrMuxQQmrRfAASsigbILDrh1mRgNNjyVKCoMg7dP/oiUkD6RT+v0ndvM2XJVR
         CPpJHv8VjSZQmoCmGPwU9JsFkSGAbuoVejo+Dh/TZJ+iXOVvqLEYEDn0kHt68hQ0dwEG
         QWGXBx4eVxM+//gIdKK7sXn50rzWBu+O50FTSN77t7dq4ZmN8KKSYJFG0JjK81qygy9D
         5zjvYRJsTVANjpGhYhblLAPqAu/+bMaUFkuFEeBYeG3PWPWGH6FF+QcMRNL7TnW88cj6
         6ivJFE1a5/44VLV5dvImTkKUN9D4W5hC6PzIWUPeXH/HOON8i+MiHMgqP1PgmlgOa6mT
         UmMw==
X-Gm-Message-State: AOJu0YyTV2RgbrDWLP0+Y7v5W5DEfM7DAx8QP/95N9eA2UfooyV2osEa
	ALPmmfKQm8V1wrW4liJZVBQWhss351O/p02HD/vQ/2mClJiJ1E2tP0Jq2R+rQfWCD9x1xhWwlAd
	ohYRR4Eo3e66SC9vECithj2QUnfAGZbtPBSZ0JJ8=
X-Gm-Gg: ASbGnctL+Zzz0CZrYop6rxPqlhJpNsNvS1j3KSbqvBci7CgJYvhijJYcsTgbtsYFOus
	x5BFEPykfKuOyfYsnLLzUdfqSqXuw6DDY1b7VdiAjp1mUEnT3Tax5fjH0++6KUvGhX4E/9FwP5W
	pbZTuFSubOr8LThqD6XCMxM6mxyK1d9TfPZVSpMLJJ8k5bN2zpGc96vK3Gn/Lxrf1ftXwsi37Ox
	O3qUwf1awtCtVlAnNqAA3kR4y3juOkaQNFx90vP3cdpPiAxzH+SP4LN5KxFZyboiLSWMkKiSNHb
	+ECdohNoi8bVsaa5+mSgz6aOgdQD7dYBg4BqH88+YVy/nGf+a0Us82Sh0tZA/rzuu0Ozh8WRaUe
	4aX8Li4YPoB97f8eT
X-Google-Smtp-Source: AGHT+IH1Z+GxWoYSwTt19ctK6zNr4UDERX8SzLeO7Sb2+0jsdWgn5VAHsf57H72iMTPOW1rsAb48Z3R8IkHjNRVV4Zo=
X-Received: by 2002:a53:be4a:0:b0:637:c06f:b754 with SMTP id
 956f58d0204a3-63b83add68amr1315877d50.18.1759361523023; Wed, 01 Oct 2025
 16:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251001062339.74011-1-f_l_k@t-online.de> <CAMKF1sr2ks3j3RzogOdsYOS6Dk6wyaNqcCqsfhOG0DYAgOFoLQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr2ks3j3RzogOdsYOS6Dk6wyaNqcCqsfhOG0DYAgOFoLQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Oct 2025 16:31:36 -0700
X-Gm-Features: AS18NWAdgJwyLqW2o19rJ3PQ1Hq4QMT5cgSzBqNoRw9DeMG7aT0sqBSEDgLlsF0
Message-ID: <CAMKF1sp6Bw7x09eSCAL4UrUtDaExLUBe9yjGNO=qG-H=D1Etug@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] telepathy-mission-control: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 23:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120146

there is also a build error

https://errors.yoctoproject.org/Errors/Details/884278/

On Wed, Oct 1, 2025 at 4:24=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Sep 30, 2025 at 11:23=E2=80=AFPM Markus Volk via
> lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
> wrote:
> >
> > 'telepathy-mission-control' is an account manager as requested by the '=
folks' telepathy
> > backend at runtime.
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  .../telepathy/telepathy-mission-control_5.16.6.bb  | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >  create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-mi=
ssion-control_5.16.6.bb
>
> Its being added to meta-oe but it needs networkmanager and
> networkmanager is in meta-networking. So layer compat check fails
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/963/st=
eps/12/logs/stdio
>
> perhaps put it in a dynamic layer in
> meta-oe/dynamic-layers/networking-layer or just directly in
> meta-networking.
> >
> > diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-c=
ontrol_5.16.6.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-mission=
-control_5.16.6.bb
> > new file mode 100644
> > index 0000000000..c6ff3abe9f
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_=
5.16.6.bb
> > @@ -0,0 +1,14 @@
> > +SUMMARY =3D "Telepathy Mission Control 5 is an account manager and cha=
nnel dispatcher for the Telepathy framework"
> > +HOMEPAGE =3D "http://telepathy.freedesktop.org/wiki/"
> > +LICENSE =3D "LGPL-2.1-only"
> > +
> > +DEPENDS =3D "telepathy-glib dbus networkmanager dbus-native dbus-glib"
> > +
> > +SRC_URI =3D "http://telepathy.freedesktop.org/releases/telepathy-missi=
on-control/${BP}.tar.gz"
> > +SRC_URI[sha256sum] =3D "2df8ae3995e919a7670e01aa3568215ef0777e34961ace=
1cac1c6477cb297a45"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd73=
7b499"
> > +
> > +inherit autotools pkgconfig gtk-doc
> > +
> > +FILES:${PN} +=3D "${datadir}/dbus-1 ${datadir}/glib-2.0"
> > --
> > 2.51.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#120087): https://lists.openembedded.org/g/openembed=
ded-devel/message/120087
> > Mute This Topic: https://lists.openembedded.org/mt/115528296/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

