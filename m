Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960C0C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 05:01:57 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.27991.1679893315283455067
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 22:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m3dgm1Wz;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-17ab3a48158so8034665fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Mar 2023 22:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679893314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RA2Q0bvGljBtFOHJ6WDf1yPd8yXci5yuG29LuBQt/G4=;
        b=m3dgm1WzHqw1jGURjv8RPZ5Dbh38hGQA6/2rOVSdvMeL3ksiDp1MjsGXNU1+sSvhUl
         2ixDM1UGVJMRs0AROksOYIYHayL+stGGULNW6FBc09sR5UPElJtirwbRlQXVUOcpVI5r
         ugnQENQvzWEfQPKKAjrhTaGak9xnDpRBnlW190jaErAFhr2eYBRnnCXDvyNdMqhN6f/i
         GVYdTvvWs/JLel/Ucfp+B/Ry7uXZfWoy7n8gCjsKtKybux/WEltnRMCz16E8pGngo6ln
         WFgmS52N9DF15w4zNUeN7ZAfvKds6Sx/z+qPSqv288Z3u4PIMVbb1Rregx9z1LJ2zsss
         sN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679893314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RA2Q0bvGljBtFOHJ6WDf1yPd8yXci5yuG29LuBQt/G4=;
        b=4JJKjxd+oy9NHRdrzmaRaIRuOiKuO0yzCMFLemU13usU5gz/4onT2w4By+mFgCHefN
         7ZMyB0v3uE9UGPihIreJ6+s2YpmbQTTLBa5p1SCCuvkQ8eiU3vFleXj3gkC3q1hp6uZV
         pYA85OBjH4HO4xvHb3qIiPjQGCFOvMoSY/ZgxIiChKsoqQQ1f/IVstt/dt5gTYDHPJG5
         xy3zxGqzOmYd8zQs9fS4Qyi5FDanp66hLki7ceCIl7gq/luDIjY6WBojXo3Y7oMhWQ5F
         SFi6dc9/PlEAMV8kUnBgsN5om7Y7M67+Rmb/PE5OD49bSeMIrQy6Lz7F5UfifO8xjkUz
         Hl8g==
X-Gm-Message-State: AAQBX9dymZ6ZChcnbcVzrsyKBtqCmoknPNazFtsxmwGPP8zEgFerEUyS
	KzJ7nbEAJXv0mD4RAIrBXQ0nBkhCYrZtEgQFhtXOoJztsHk=
X-Google-Smtp-Source: AK7set94nW5u2uDW2xYBM2sG9tgsqhC4iVq2BJhSh5cyKTq7ya4CNTB0arbO7CicqMFlmjGpaNs4w5iD+t0hXYsnktQ=
X-Received: by 2002:a05:6871:e09:b0:17a:b713:63e9 with SMTP id
 vj9-20020a0568710e0900b0017ab71363e9mr3462357oab.4.1679893314525; Sun, 26 Mar
 2023 22:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230325080256.923752-1-f_l_k@t-online.de> <20230325080256.923752-4-f_l_k@t-online.de>
 <CAMKF1sq-Htok=oYiDU6xJjoXze5yY9akJVXzMaGOwFi_dpGd=g@mail.gmail.com>
In-Reply-To: <CAMKF1sq-Htok=oYiDU6xJjoXze5yY9akJVXzMaGOwFi_dpGd=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Mar 2023 22:01:28 -0700
Message-ID: <CAMKF1spQx1EgWi+3y_TO8e=BbwHpOCXDwcfj51tgTDT=7R1Q6w@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 04/32] evolution-data-server: update
 3.46.3 -> 3.48.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 05:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101773

something like below make it run further in build

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-=
server.bb
b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
index d6f6d7c231..ad91dffb74 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.=
bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.=
bb
@@ -37,7 +37,7 @@ EXTRA_OECMAKE:append:class-target =3D "
-DG_IR_SCANNER=3D${STAGING_BINDIR}/g-ir-scan
 PACKAGECONFIG ?=3D "oauth"

 PACKAGECONFIG[canberra] =3D
"-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3DOFF,libcanberra"
-PACKAGECONFIG[oauth]    =3D
"-DENABLE_OAUTH2_WEBKITGTK4=3DON,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF,webkitgtk
json-glib"
+PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK4=3DON
-DENABLE_OAUTH2_WEBKITGTK=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF,webkitgtk
json-glib"
 PACKAGECONFIG[goa]    =3D
"-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-online-accounts"
 PACKAGECONFIG[kerberos]    =3D "-DWITH_KRB5=3DON,-DWITH_KRB5=3DOFF,krb5"
 # BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs wh=
en

On Sun, Mar 26, 2023 at 9:59=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> It fails to build
>
> | -- Checking for module 'webkit2gtk-4.1>=3D2.34.0'
> | --   No package 'webkit2gtk-4.1' found
> | CMake Error at cmake/modules/PkgConfigEx.cmake:32 (message):
> |   Necessary libraries not found or not enough version.  If you want to
> |   disable WebKitGTK gtk3 for built-in OAuth2 authentications, please us=
e
> |   -DENABLE_OAUTH2_WEBKITGTK=3DOFF argument to cmake command.
> | Call Stack (most recent call first):
> |   CMakeLists.txt:418 (pkg_check_modules_for_option)
> |
>
> On Sat, Mar 25, 2023 at 1:03=E2=80=AFAM Markus Volk <f_l_k@t-online.de> w=
rote:
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  .../evolution-data-server/evolution-data-server.bb            | 3 +--
> >  .../evolution-data-server/evolution-data-server.inc           | 4 ++--
> >  2 files changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
> > index a27115267..d6f6d7c23 100644
> > --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-ser=
ver.bb
> > +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-ser=
ver.bb
> > @@ -37,8 +37,7 @@ EXTRA_OECMAKE:append:class-target =3D " -DG_IR_SCANNE=
R=3D${STAGING_BINDIR}/g-ir-scan
> >  PACKAGECONFIG ?=3D "oauth"
> >
> >  PACKAGECONFIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=
=3DOFF,libcanberra"
> > -# ENABLE_OAUTH2_WEBKITGTK4 would require webkit to be built with gtk4
> > -PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK=3DON -DENABLE_O=
AUTH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK=3DOFF,webkitgtk json-glib"
> > +PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK4=3DON,-DENABLE_=
OAUTH2_WEBKITGTK4=3DOFF,webkitgtk json-glib"
> >  PACKAGECONFIG[goa]    =3D "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-=
online-accounts"
> >  PACKAGECONFIG[kerberos]    =3D "-DWITH_KRB5=3DON,-DWITH_KRB5=3DOFF,krb=
5"
> >  # BROKEN: due missing pkg-config in openldap eds' cmake finds host-lib=
s when
> > diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.inc
> > index 2b74b2e60..9db5e9011 100644
> > --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-ser=
ver.inc
> > +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-ser=
ver.inc
> > @@ -9,5 +9,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d1925=
5cf0557f3fe7d7068212 \
> >
> >  inherit gnomebase upstream-version-is-even
> >
> > -SRC_URI[archive.sha256sum] =3D "0938e2279e5cfbc2204766ca9d3fea57091169=
9b07c10cbe01aca62a7e8b2bee"
> > -PV =3D "3.46.3"
> > +SRC_URI[archive.sha256sum] =3D "0f25f73331edf53909be40f412b2a869392703=
27517616303f322de157083c35"
> > +PV =3D "3.48.0"
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#101717): https://lists.openembedded.org/g/openembed=
ded-devel/message/101717
> > Mute This Topic: https://lists.openembedded.org/mt/97840027/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

