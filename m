Return-Path: <michael@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053E4C5321E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 15:23:24 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.33707.1724599402480840067
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 08:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=ZkuXTPLo;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.45, mailfrom: michael@amarulasolutions.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a86910caf9cso570948766b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724599401; x=1725204201; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pBoihKfp+Jnp/8Z3IR3OJTNlBamBoRnwjbC0qnoFSw=;
        b=ZkuXTPLogD4FaTtLS1gUhSi0MshDAdGg7ejdxuykOR+8HKrfFQ/xruT6QR7YY8Tv3M
         2ge0LQlqcSn0K6QQV8X0wYPJxbT1gkLznzFgfJzn/ItzochuaJHXSwtN6XEq+TT/KzCR
         pkdYjb73V9+6kYoPJivef2rdbeihCrfxrUXr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724599401; x=1725204201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pBoihKfp+Jnp/8Z3IR3OJTNlBamBoRnwjbC0qnoFSw=;
        b=Coiz0xZAU1pQjkZuXi8m+PmigxYp6FaLQc9ADRe1PWIeB+0wiV5f1Gb+jxnjmgFS3W
         Ou1YN6MeCXWTSYEn3m0MHJT+/9GkOQsCvsEEFouHzS/AqLYWoxH6TjBPrjUIrp8LOd5d
         ml6vqMuiE/ChMp+cXPIunKdLe7QArEav1/5B0OYRghD57Bua8Qy0ElvrdAwdHPXoIfnU
         6ocmNdggr79MatmXzGuccMxIyuV3dxR4KjQnmsUQbZjQ05mdHaHc8RF/GUDwjP8HLvB1
         ksLXsoitsFCt1wlzoNeCdI/sLZ2oRKaxVTvpHrKpbta78AdumLuYlpln9+dEluOcXg+l
         GZBA==
X-Gm-Message-State: AOJu0Yy94hD0CqV5TK+qMSQAUMDEoF/PfOQFESWYvAv+EcFkAJHcznwZ
	/jCAnDvzOFlpAf3uvNCkeNErRWOYYvzkbNncVaDCiin3DmM22Q6AGVugXFdsNQLurKa4BJkTQ6A
	6F+uj9H5go7m+96GlHM+zprD/jKXeAuGbre6fg86C9qy5EyeVw5w=
X-Google-Smtp-Source: AGHT+IEl801W0nV3iA3F+is/XD8W5opYwuiU+17cMIN+3Smnj+Zc2oGYru0Lr/8RB2D/2eY4AqlVo8pXRCN0t9cuCfs=
X-Received: by 2002:a17:907:7f1f:b0:a7d:89ac:9539 with SMTP id
 a640c23a62f3a-a868a5af23cmr1209363366b.7.1724599400302; Sun, 25 Aug 2024
 08:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240825084947.1032325-1-michael@amarulasolutions.com>
 <CAMKF1srbO=Us8xZHek=G_xC=KHwukNVC-vhDkh7Jz8oPmtavrQ@mail.gmail.com>
 <CAOf5uwkujw2tR1JDK9q_U6bM+BOkoH22Oeg99dPOvu4X0q-74w@mail.gmail.com> <CAMKF1sqArs6XFxoLtJwsDr9C5nPsuK3-g20d=mcVUJ0s38cEfw@mail.gmail.com>
In-Reply-To: <CAMKF1sqArs6XFxoLtJwsDr9C5nPsuK3-g20d=mcVUJ0s38cEfw@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sun, 25 Aug 2024 17:23:09 +0200
Message-ID: <CAOf5uwnnJBfHPSUsB_mAv=+9e0quiGRO4O0zxTe_Ge-EUG=fPA@mail.gmail.com>
Subject: Re: [oe] [PATCH] cpuset: Add recipe for cpuset tool 1.6.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 15:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111931

HI

On Sun, Aug 25, 2024 at 5:20=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Sun, Aug 25, 2024 at 8:17=E2=80=AFAM Michael Nazzareno Trimarchi
> <michael@amarulasolutions.com> wrote:
> >
> > Hi
> >
> > On Sun, Aug 25, 2024 at 4:56=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > meta/ layer is part of oe-core, this patch if intended for
> > > meta-openembedded should be part of meta-oe layer.
> > >
> >
> > I have created the patch on top of
> > https://git.openembedded.org/openembedded-core
> > Is the right one?
>
> that means this is meant for core layer, there is a separate layer for
> sending patches to core
> and there has to be strong reason to include something in core layer,
> I would suggest that you
> propose this patch for meta-oe layer under meta-openembedded repo that
> is perhaps a better
> location for this now. The mailing list to send patch for
> meta-openembedded is this one.
>

Agree I will resend on this mailing list connected to the right repository

michael

> >
> > Michael
> >
> >
> > > On Sun, Aug 25, 2024 at 1:49=E2=80=AFAM Michael Nazzareno Trimarchi v=
ia
> > > lists.openembedded.org
> > > <michael=3Damarulasolutions.com@lists.openembedded.org> wrote:
> > > >
> > > > Cpuset is a Python application that forms a wrapper around the
> > > > standard Linux filesystem calls to make using the cpusets facilitie=
s
> > > > in the Linux kernel easier. This can be used on linux realtime or
> > > > standard linux
> > > >
> > > > Example
> > > >
> > > > cset shield --cpu 2-3
> > > > echo c > /proc/irq/287/smp_affinity
> > > > irq=3D`ps | grep -m 1 "irq/287"  | awk '{ print $1 }'`
> > > > cset shield -s -p $irq --force
> > > > chrt -f -p 75 $irq
> > > >
> > > > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > > > ---
> > > >  meta/conf/distro/include/maintainers.inc     |  1 +
> > > >  meta/recipes-devtools/cpuset/cpuset_1.6.2.bb | 13 +++++++++++++
> > > >  2 files changed, 14 insertions(+)
> > > >  create mode 100644 meta/recipes-devtools/cpuset/cpuset_1.6.2.bb
> > > >
> > > > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/d=
istro/include/maintainers.inc
> > > > index 60f36a9449..fe3d9c83d8 100644
> > > > --- a/meta/conf/distro/include/maintainers.inc
> > > > +++ b/meta/conf/distro/include/maintainers.inc
> > > > @@ -121,6 +121,7 @@ RECIPE_MAINTAINER:pn-core-image-x11 =3D "Richar=
d Purdie <richard.purdie@linuxfound
> > > >  RECIPE_MAINTAINER:pn-core-image-sato-dev =3D "Richard Purdie <rich=
ard.purdie@linuxfoundation.org>"
> > > >  RECIPE_MAINTAINER:pn-coreutils =3D "Chen Qi <Qi.Chen@windriver.com=
>"
> > > >  RECIPE_MAINTAINER:pn-cpio =3D "Denys Dmytriyenko <denis@denix.org>=
"
> > > > +RECIPE_MAINTAINER:pn-cpuset =3D "Michael Trimarchi <michael@amarul=
asolutions.com>"
> > > >  RECIPE_MAINTAINER:pn-cracklib =3D "Unassigned <unassigned@yoctopro=
ject.org>"
> > > >  RECIPE_MAINTAINER:pn-createrepo-c =3D "Alexander Kanavin <alex.kan=
avin@gmail.com>"
> > > >  RECIPE_MAINTAINER:pn-cronie =3D "Anuj Mittal <anuj.mittal@intel.co=
m>"
> > > > diff --git a/meta/recipes-devtools/cpuset/cpuset_1.6.2.bb b/meta/re=
cipes-devtools/cpuset/cpuset_1.6.2.bb
> > > > new file mode 100644
> > > > index 0000000000..b404d4131e
> > > > --- /dev/null
> > > > +++ b/meta/recipes-devtools/cpuset/cpuset_1.6.2.bb
> > > > @@ -0,0 +1,13 @@
> > > > +SUMMARY =3D "Cpuset manipulation tool"
> > > > +HOMEPAGE =3D "https://github.com/SUSE/cpuset"
> > > > +LICENSE =3D "GPL-2.0-only"
> > > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df=
079bae19f"
> > > > +
> > > > +SRC_URI =3D "git://github.com/SUSE/cpuset.git;protocol=3Dhttps;bra=
nch=3Dmaster"
> > > > +
> > > > +SRCREV =3D "4f80263208935f0df4f616cf9d8cb7285599a670"
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +inherit setuptools3
> > > > +
> > > > +RDEPENDS:${PN} +=3D "python3-core python3-logging python3-pydoc"
> > > > --
> > > > 2.43.0
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#111927): https://lists.openembedded.org/g/opene=
mbedded-devel/message/111927
> > > > Mute This Topic: https://lists.openembedded.org/mt/108084672/199791=
4
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [raj.khem@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> >
> >
> >
> > --
> > Michael Nazzareno Trimarchi
> > Co-Founder & Chief Executive Officer
> > M. +39 347 913 2170
> > michael@amarulasolutions.com
> > __________________________________
> >
> > Amarula Solutions BV
> > Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> > T. +31 (0)85 111 9172
> > info@amarulasolutions.com
> > www.amarulasolutions.com



--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

