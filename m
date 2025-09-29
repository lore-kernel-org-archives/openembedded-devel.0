Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47A7CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 15:42:22 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.1257.1759160540070425031
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 08:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DWJIgdZ9;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: schonm@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-30cce50dfb4so4039692fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759160539; x=1759765339; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/D4BYMUMDdIJQchMGg/mE2AlRNRF3xHL5RZp+k0UNtI=;
        b=DWJIgdZ947luVk85OD8HCykrWqfLgbPotHF3sdkCEKyDLKHjYynwhWKt9J1AfX3Axh
         /nt2R34SBqjxfbUTpmroIUXghlH73uceuj8IWtFe2Q4aJDH4zDftyCV1pDxXtvP8Vjjx
         RW75bxKDavW57LvUqXy+20Ncdxm40rgnsCPcu/22UR8f6lfvZVv+4dutUI5TYzwpdcD9
         Ws9MrBSwazZVAZ1fsgyhoMyZQrrkm6OEBE77KkpmDKG86IGViPigt32kTAEbaFciLktA
         uW+capNmzloZE5OUh/BiCROoNizwM4lWw82yPH7EQ1aCpZssIYx+7dNSPoeIwWFf9icy
         dtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759160539; x=1759765339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/D4BYMUMDdIJQchMGg/mE2AlRNRF3xHL5RZp+k0UNtI=;
        b=cQnoiAA0NVZefutA8vD4pl+ISdiLrqKKOZj8C1JgapAg1Gk/he0TFAp7noVgvb6Mhu
         YGHlOqFzOqJxXBlHodtxiM/fhXr33dU1VCqv6ARYuYw/yjkNoIrmeV9FVD43yhQDe88W
         dsHJtvI0QOr9tzx8TeyVzhDqhZqwXRoBPB4a7qI+b/P7LB5p+q1kU/hCCWIkb1O+VbST
         ubHBLk/L2d3Qd77wO4XIOtN2sd7cwTgFdot2mnj4AVP+BIO8lmCSgcLuhd/ox203MJoa
         w4gUD3bnXnenVRerZPouH5qxWiFctcENWJnwLtyNcNgrjJuCH0c9EMwZqplmDOUgeaNZ
         jKtQ==
X-Gm-Message-State: AOJu0Yyh76xcnLGkItQ5uqlRvh/PEfipv/fejKSESganfMFkrTO/3IT9
	GCfu4IrhLOgns4N5oQ3Id/v7gxDfMDtPvVOqptwkaqKLk+8lDeXR3ybmo5PkVXKHTbZCx1T1yZm
	AQ0C6MduWCXlwgsKTuxQaN0iA8fiua59N2F4A
X-Gm-Gg: ASbGncug121rhN1PtCNNONPYoA5MafbepIkeaXcFNJtCW3LpfbDj8L7qtoPLruEBdU/
	1wJIVk5zEhaQ5zk2qkn+kcRXxEGoX3XMPGBTKNVdEnc+PtW2q1Ob7dxeWPEkFMc26M7VJsq+0y1
	3mU72xvGYegA/PNLbUdf2CEkE0lSZ3sVyDeOAWFIxAeU07Ux4WyqPDOQuN0apT8MueWGEGUWzUa
	l9JdukuI1FMBnHl9AE4NXrUNKQ=
X-Google-Smtp-Source: AGHT+IEvRGyN9Ld5aPwAPHdk2fkzKa0ipi//zoGHhsSR79a7SCpZwFTmfaqEp4RtT/B9pUYABxi81ja11AUSEle0tH4=
X-Received: by 2002:a05:6871:7d86:b0:367:c392:9f2c with SMTP id
 586e51a60fabf-367c3df376amr7088174fac.16.1759160538819; Mon, 29 Sep 2025
 08:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250928165143.16664-1-schonm@gmail.com> <CAMKF1srBOn17=ac=nH4HxKGwyRhSE+VJ2N7Q4HuyQVO5K25syA@mail.gmail.com>
In-Reply-To: <CAMKF1srBOn17=ac=nH4HxKGwyRhSE+VJ2N7Q4HuyQVO5K25syA@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Mon, 29 Sep 2025 11:42:06 -0400
X-Gm-Features: AS18NWAZ3j_EtykiAbEznKNPhdLrM-Q0Wh1ZBcuVu9oPTHQmrYTfAVmeFgaIShI
Message-ID: <CABTo8gCdEaEOVped1DPBtYo=eZ0TGyf2EugsQ1uokVu_9F_rJQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] webkitgtk3: upgrade 2.48.3 -> 2.48.7
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 15:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120037

When I was building this, I was building for raspberry PI 5 (ARM64).
I will try to reproduce the problem locally by building for qemuarm.

Thanks,
Jason Schonberg

On Mon, Sep 29, 2025 at 11:31=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> its fails on qemuarm
>
> https://errors.yoctoproject.org/Errors/Details/884060/
>
> On Sun, Sep 28, 2025 at 9:52=E2=80=AFAM J. S. via lists.openembedded.org
> <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > WebKitGTK 2.48.7 release:
> >
> >     Fix a number of GStreamer memory leaks.
> >     Fix several crashes and rendering issues.
> >
> > WebKitGTK 2.48.6 release:
> >
> >     Fix emojis incorrectly rendered in their text variant.
> >     Add support for font collection / fragment identifiers.
> >     Fix web process deadlock on exit.
> >     Fix stuttering when playing WebP animations.
> >     Fix CSS animations with cubic-bezier timing function.
> >     Do not start the MemoryPressureMonitor if it=E2=80=99s disabled.
> >     Fix several crashes and rendering issues.
> >
> > WebKitGTK 2.48.5 release:
> >
> >     Fix several crashes.
> >
> > WebKitGTK 2.48.4 release:
> >
> >     Improve emoji font selection with USE_SKIA=3DON.
> >     Improve playback of multimedia streams from blob URLs.
> >     Fix the build with USE_SKIA_OPENTYPE_SVG=3DON and USE_SYSPROF_CAPTU=
RE=3DON.
> >     Fix the build on LoongArch with USE_SKIA=3DON.
> >     Fix crash when using a WebKitWebView widget in an offscreen window.
> >     Fix several crashes and rendering issues.
> >
> > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > ---
> >  .../webkitgtk/{webkitgtk3_2.48.3.bb =3D> webkitgtk3_2.48.7.bb}    | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.48.3.bb =3D> we=
bkitgtk3_2.48.7.bb} (98%)
> >
> > diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb b/m=
eta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
> > similarity index 98%
> > rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
> > rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
> > index b848008910..6c105e7bb1 100644
> > --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
> > +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
> > @@ -22,7 +22,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/webki=
tgtk-${PV}.tar.xz \
> >             file://fix-ftbfs-riscv64.patch \
> >             file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALW=
AYS_I.patch \
> >             "
> > -SRC_URI[sha256sum] =3D "d4dc5970f0fc6a529ff7fd67bcbfab2bbb5e91be789b2e=
9279640b3217a782c3"
> > +SRC_URI[sha256sum] =3D "2c62aebb608e09f930a539f3623a5cc8023b5068029f42=
a208f45f9124da6e30"
> >
> >  inherit cmake pkgconfig gobject-introspection perlnative features_chec=
k upstream-version-is-even gi-docgen
> >
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#119999): https://lists.openembedded.org/g/openembed=
ded-devel/message/119999
> > Mute This Topic: https://lists.openembedded.org/mt/115481606/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

