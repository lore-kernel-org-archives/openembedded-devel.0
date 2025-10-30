Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4F7CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 08:33:35 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web01.18850.1761813214434589617
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 01:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hrmv3Lw7;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-44db3c8ff14so469993b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761813213; x=1762418013; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gxCDhLGNrAXWVnz/seC1DxpF0AwIexIjPbgssErbHw=;
        b=Hrmv3Lw7wYn0arWKAsS8furyxg5J816yvzCZFakbD6fl18rqN3K4BpDUZisASveryG
         vj4Mbr4PADsi88u33QNdK3YCyweKI7ARqKKxxfIpnB5G1maOZECk+zHfpeLfcIkTW41K
         B9neYz1QLi40E2DN3Ew+nLA0jQaxYfpFy2JzIcs6E2Bx7Qd2vuniZjf3rGa/pYWUmJkI
         BJwruECMZozfxDrosvPS1hQkHfeQZqGrv+1B7ctxE/yDQQVSkS4jWTUDNqszXiiWjoxd
         WKhX7A8ytrQXDERaHLHTP/4BclBKkioXL4Ddov28lqbmKstPuz2DBAtGElv2W8ARbYob
         HQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813213; x=1762418013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gxCDhLGNrAXWVnz/seC1DxpF0AwIexIjPbgssErbHw=;
        b=E3pMv9aei0Y9s9jfwri2HRRq+AZR6yxaYXUki4w7lu9pTz5sn/23K2VaGETMsgVp6O
         LNUkaeiRkahdAn2HEgZmV/I614yK3xb9TA1VjYDu4IWhaezTOZ1g+sv6Nrmh9ppCUr7X
         X3Lz5uKatbPtODHj3iIBfH3dZpOS3W4Y+/5pM/dDsnC23hZow1Yxa8NfOO16l5UFo0Q9
         fL/iXiCwALyw3zagaL5CC+yOzmFXiV1cTK2KvGRInmvVmW03CYLh+ZN/UNd8utXqMUKs
         c/1PwAdGsAoA3o3zwmX6Rd5y+JvaNsVWDPZ51I/24bHi7utvJxL5dOTx7Hx6qkL6TAkO
         AqeQ==
X-Gm-Message-State: AOJu0YypDVq0yzjhI4jGD52COnWeVAgVRvCui3z1h2LBynUS5g0+5VxE
	Dv0ckBqnV/75CYJKtr4/foR7JEk6Y9MsBJlgQ4f0ShsGhZ3zZy/NPwphE5ywCZ2AUr244R7vaYy
	NztjChmW+KpA0AaFppfYpk0klLtvEQWUC6Q==
X-Gm-Gg: ASbGncsrGQOQfAwfqkU8QPgfqBcnZNNYEEjAGIf6mHLzNwXFRNrgsmu9pJCfgVyxD2F
	cmSdffbaavd0D4Sj8a9Q3cPti/num+BpZfC20U89++N5JQ02RLm8VQ5v5TsV0sF3qI4VjOJQEpV
	4SKEtgqWfzZlhVzelSF4x3Tdh58RlQ/oibLhXsuAW3mENYQbbVoWNUim6tkz139irNn3xCIPtfv
	0ONZsTj1SZxK+zSyX/r/OwXoUt5SZLpTCTHteaWJkgb70OvMB2F0YkvqR2swgvk1LyWM3rVrw==
X-Google-Smtp-Source: AGHT+IFK89dGVv0GmaYOy5mwCu9OX+KPbD+AFylqwz2aqVzq+uuMaBrCYhcZup7Cj0OefSIY+aovaNqy+ERkkpeeREk=
X-Received: by 2002:a05:6808:6d84:b0:44d:a6a8:1b70 with SMTP id
 5614622812f47-44f89edc9e9mr1074515b6e.62.1761813213413; Thu, 30 Oct 2025
 01:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
 <20251015063531.1573191-3-ankur.tyagi85@gmail.com> <7f5241e9b478670a94d9b021f3b359f2d7d185d1.camel@intel.com>
In-Reply-To: <7f5241e9b478670a94d9b021f3b359f2d7d185d1.camel@intel.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 30 Oct 2025 21:33:21 +1300
X-Gm-Features: AWmQ_bmE3qU3bdNPiNDphBKNJX5_NkbDRQbyFv0mwPwOjZADHz2dyJo09tXovwg
Message-ID: <CADySD0Fqrw4biWJA3Bba2-sd878OKP7jjhtOYiVBwP=k0LEJ2g@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 3/4] neatvnc: upgrade to 0.8.1 release
To: anuj.mittal@intel.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 08:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121200

On Thu, Oct 30, 2025 at 7:30=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Dintel.com@lists.openembedded.org> wrote:
>
> On Wed, 2025-10-15 at 19:35 +1300, Ankur Tyagi via
> lists.openembedded.org wrote:
> > This release fixes CVE-2024-42458
> > https://github.com/any1/neatvnc/compare/v0.8.0...v0.8.1
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../neatvnc/{neatvnc_0.8.0.bb =3D> neatvnc_0.8.1.bb}          | 6
> > ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >  rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.8.0.bb =3D>
> > neatvnc_0.8.1.bb} (81%)
> >
> > diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
> > b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
> > similarity index 81%
> > rename from meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
> > rename to meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
> > index c9c4a6c27a..572134b47c 100644
> > --- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
> > +++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.1.bb
> > @@ -4,9 +4,9 @@ HOMEPAGE =3D "https://github.com/any1/neatvnc"
> >  LICENSE =3D "ISC"
> >  LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D94fc374e7174f41e3afe0f027ee59ff7"
> >
> > -SRC_URI =3D
> > "git://github.com/any1/neatvnc;branch=3Dmaster;protocol=3Dhttps"
> > +SRC_URI =3D "git://github.com/any1/neatvnc;branch=3Dv0.8;protocol=3Dht=
tps"
> >
> > -SRCREV =3D "46432ce8cade0b54a38d4bb42eb07f96c8ff49fd"
> > +SRCREV =3D "07081567ab21a2b099ceb41ae8cab872a31cbb9a"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > @@ -36,3 +36,5 @@ do_install:append () {
> >  }
> >
> >  BBCLASSEXTEND =3D "native"
> > +
> > +CVE_STATUS[CVE-2024-42458] =3D "fixed-version: No action required. The
> > current version (0.8.1) is not affected by the CVE."
>
> Why is this required? The data shows versions till 0.8.1 (excluding) to
> be vulnerable so this shouldn't be required? Am I misinterpreting
> something?

No, you are not.
Please drop this patch and I'll re-send it separately

>
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121194): https://lists.openembedded.org/g/openembedde=
d-devel/message/121194
> Mute This Topic: https://lists.openembedded.org/mt/115766813/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

