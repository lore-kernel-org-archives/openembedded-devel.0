Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CEBCCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 21:19:37 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.907.1760476775804309138
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 14:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kiJXbVn2;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-650304a822aso712715eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 14:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760476775; x=1761081575; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UC8rG7O/lZ5MtkZjwvJJE3I6Op0vBWzNndNOLBxL3iQ=;
        b=kiJXbVn2oR3uyWz9pYFvH9N8fCURoowK21A6sopbCvELgAkP1ApmSa4BLqNGiIfyAP
         jYRihvaNe+8Vld/fKLeE1yaq9E7rKNOlRqarh+ShXhNtYBwsvRgmhtODl5fzD6WaHOE3
         E0CNgS75keLfmY0I/YpACenGxVaejpkQjcBWsylEwvE3SNYhXIvTlzfL61LA3EogBLm7
         qOfk1x2gUHNjUWJnODqW18+Go/1/N4ty+eot1T1ZpfcF8CpnOrDa3cPbu6kj5KNDBYkd
         qsMtZfQhi6z7DQZ6N7jpfc88knd5409TGi9sb5p273qEeu2FGiDyxmf7tg5lSsWh0ieV
         UpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476775; x=1761081575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UC8rG7O/lZ5MtkZjwvJJE3I6Op0vBWzNndNOLBxL3iQ=;
        b=F9hNE9GOQo3L2m9GAef3k8dHiz4rfJfjteHwqde55Rcy209/MDyU7TlwJtPXOrpuXM
         IRjRdPKNRKIBbHTYZ5NipE++iqw2zmU7QMfntqxk+owyaCLScfUVK+eLsmQWm4nCbJOJ
         K1ZLL3i6ZHMY/lEyDuIwR8EYsNYWQMA5pbXhR+bJA3nTA7qRVLxfPKqp6A2qpXHh9DxZ
         aN181V59LxP+ZOZytfYDwbj6w0AvEWo0+jMK1pGA3yUzx3Lrl0iHAw28+YMKGsrzQhgG
         pv5bktQcAqYOziGKf0LTvTeNc58bA00Vato4EYm6IIixMNx5pmGNpdZCc0pRjxxureGd
         yZ8w==
X-Gm-Message-State: AOJu0YyRsbfrTK4ONAz+z5HWOmJgeGKadiBoGETtaJ8ceLO12Zld3zpy
	16LrdrMqhKK9oIQeBe5xf4/+Fa47GsOUSAJiuf8rQH87inZ6E1+rdhPA0JPNKc4LMc9evGlcS/B
	GdI7bytF7FVEeiQP0kKqPE5qG4hCxolDGDw==
X-Gm-Gg: ASbGncu5sXwi4afyrRT2gzOo/gyScvMz2GCCSjqDVVtPU/LSRBFAOLmxoQi1qg3IDe8
	swicyquCrtrsZt7i+EZtU142v3ZeHWoSBLSoC33uXMiyKPFDf0NbehhaUCNQmw9doE9oiOcLUDN
	j02QYB69nafoQgJ33RdFCsUcXyAjfbmwcZcMnO8wXLpdpQAYrZ+eC4Dn4ptFG5VJ6Nj6bxfSAPJ
	MfVra3etXeJ2VBXEqZTnGs05m+qA6AYzb0JqSE=
X-Google-Smtp-Source: AGHT+IF/pNrCaCnEIEQoHk15TQzKmVNQnpdkcSrM+hkkEjMN6EY0lbBe4Qm8cryNymRLNm8DSaxNttdDmjOKXjoPSwQ=
X-Received: by 2002:a05:6870:c18f:b0:369:c7ae:6425 with SMTP id
 586e51a60fabf-3c0f81e5e7amr12513476fac.28.1760476775018; Tue, 14 Oct 2025
 14:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
 <20251014205402.1487867-18-ankur.tyagi85@gmail.com> <aaad9854-c024-40ec-a8d6-c69fc2f90b7b@gmail.com>
In-Reply-To: <aaad9854-c024-40ec-a8d6-c69fc2f90b7b@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 15 Oct 2025 10:19:24 +1300
X-Gm-Features: AS18NWCa647IBPqBaHb06o07Gn1uVy6hbHwX_-Qy2unt2LunGWlR94NWtZ21kj0
Message-ID: <CADySD0GWCL7wMAUHcwUe0gUrcmHd9g1TWJFDXUPVn=0203kXDA@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 18/18] jasper: upgrade to 4.1.2 release
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 21:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120658

On Wed, Oct 15, 2025 at 10:13=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> On 10/14/25 22:54, Ankur Tyagi via lists.openembedded.org wrote:
> > Bugfixes including CVE-2023-51257
> > https://github.com/jasper-software/jasper/compare/version-4.1.1...versi=
on-4.1.2
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../recipes-graphics/jasper/jasper_4.1.1.bb   |  2 +-
> >  .../recipes-graphics/jasper/jasper_4.1.2.bb   | 35 +++++++++++++++++++
>
> It looks like the original recipe (v4.1.1) wasn't deleted

Thanks, please drop this patch from the series and I'll send another
one fixing it.
>
> >  2 files changed, 36 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
> >
> > diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb b/meta-oe/=
recipes-graphics/jasper/jasper_4.1.1.bb
> > index 5281980ecb..d6d5b5de32 100644
> > --- a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
> > +++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
> > @@ -4,7 +4,7 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da80440d1d8f17d041c71c72=
71d6e06eb"
> >
> >  SRC_URI =3D "git://github.com/jasper-software/jasper.git;protocol=3Dht=
tps;branch=3Dmaster"
> > -SRCREV =3D "917f7708b755d8434f70618108c1a76f1b6a0a82"
> > +SRCREV =3D "ff633699cb785967a2cb0084d89d56e53c46e416"
> >
> >  CVE_STATUS[CVE-2015-8751] =3D "fixed-version: The CPE in the NVD datab=
ase doesn't reflect correctly the vulnerable versions."
> >
> > diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb b/meta-oe/=
recipes-graphics/jasper/jasper_4.1.2.bb
> > new file mode 100644
> > index 0000000000..d4dae1f22a
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
> > @@ -0,0 +1,35 @@
> > +SUMMARY =3D "Jpeg 2000 implementation"
> > +HOMEPAGE =3D "https://jasper-software.github.io/jasper/"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da80440d1d8f17d041c71c72=
71d6e06eb"
> > +
> > +SRC_URI =3D "git://github.com/jasper-software/jasper.git;protocol=3Dht=
tps;branch=3Dmaster"
> > +SRCREV =3D "ff633699cb785967a2cb0084d89d56e53c46e416"
> > +
> > +CVE_STATUS[CVE-2015-8751] =3D "fixed-version: The CPE in the NVD datab=
ase doesn't reflect correctly the vulnerable versions."
> > +CVE_STATUS[CVE-2023-51257] =3D "fixed-version: patch is already includ=
ed in sources"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake multilib_header
> > +
> > +do_configure:prepend() {
> > +     JAS_STDC_VERSION=3D"$(echo __STDC_VERSION__ | ${CPP} -E -P -)"
> > +}
> > +
> > +EXTRA_OECMAKE:append =3D " -DJAS_STDC_VERSION=3D${JAS_STDC_VERSION}"
> > +
> > +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl x=
11', 'opengl', '', d)} \
> > +                jpeg"
> > +
> > +PACKAGECONFIG[jpeg] =3D "-DJAS_ENABLE_LIBJPEG=3DON,-DJAS_ENABLE_LIBJPE=
G=3DOFF,jpeg,"
> > +PACKAGECONFIG[opengl] =3D "-DJAS_ENABLE_OPENGL=3DON,-DJAS_ENABLE_OPENG=
L=3DOFF,freeglut,"
> > +
> > +do_install:append() {
> > +    chrpath -d ${D}${bindir}/jasper
> > +    chrpath -d ${D}${bindir}/imginfo
> > +    chrpath -d ${D}${bindir}/imgcmp
> > +    chrpath -d ${D}${libdir}/libjasper.so.*
> > +    oe_multilib_header jasper/jas_config.h
> > +}
> > +
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#120651): https://lists.openembedded.org/g/openembed=
ded-devel/message/120651
> > Mute This Topic: https://lists.openembedded.org/mt/115760534/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

