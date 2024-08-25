Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8451C5321E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 15:20:53 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.33291.1724599252093706227
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 08:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pe5LAG3/;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7093d565310so3519111a34.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 08:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724599251; x=1725204051; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZjLrXXEoMtKbkQHtHOyNxg8pXYzCJBtILzV5WESQ7c=;
        b=Pe5LAG3/vlRWrV70dA+OyLcKtOc4XFkolMz9trlGe5EkjmilBi8gm4ndg930b19T5z
         7N7T9pbYRbTUOGkAuQ5eKeFo93c+Fnw0BDexZm3g/GvgxRCiP3jq7PahRHm6K/FCNfMm
         Yn4SGSUxCqrr/Vid65aPjD7QXKQ4qoInFiy6oTk3iJTmVXFdQYqTdoDXWcW+LKp5lEmq
         v36pX06Autw0T4NmK3YACHCTHU/H/s5S6QEpngh+/EqRTmwqtKH7OtbZZ2E6AasLeOl9
         3D+9BBUMoEZflBwciBKAY5m6zpAWSIGjGSGD+2QaZ32Qkyxj0IEuCIh7al1uTDxXh8VH
         4M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724599251; x=1725204051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZjLrXXEoMtKbkQHtHOyNxg8pXYzCJBtILzV5WESQ7c=;
        b=RGopvUFdE7dNOD5ks7Mtt2s50yNs1Hyl4/oTz/D1GD+lvtoJgiPpdVp+HTtV/YN+Qj
         rRaDcEbhuZqv0vMOWoezEcX1DLFT+4asKybiURDBj9YEueg3HLFYCR+XrC9ci/4iAfkn
         lpM5IA06cZvIuGXSsk8268NX8lTniEGjpxyuTB4OS5m2tsnEt3gO5tRX1OWomNJq1Us8
         LX355UmCoOxOH0yG+21keqXfXmkta0RF5fWow4SQpHZ2bQjTt2QipLiRf5hyGGsdoIcO
         i8VF1qhRpmZhNAbExldoSCC1lBGGYSsI4Ql/C/3rRlFjq+8CEn1s1I2hGnFGxE3zwPaC
         B1nw==
X-Gm-Message-State: AOJu0YzTUCsVOFWVbIJ9o4cr7gvhomej7OAYQjYjKEUzaxFiStqaKkrX
	znNSQHYA8ghGSczT4bTHBNLgOhTFhSpgQHTcoDbozZHfBp1xQGXfyFjIUlI2RJR4LwqqhfRPGbU
	moPpBSe84LmiiSKHHfdVGzTKWHAE=
X-Google-Smtp-Source: AGHT+IGYxN8kp1Cenehqr8J7ht8VSiSvPxTHM83frY2S4WmyN+rYxBemAKYLljICA6GsBkK7lkQZydOzuFG9md8XLPc=
X-Received: by 2002:a05:6808:1929:b0:3dc:2878:c42 with SMTP id
 5614622812f47-3de2a88f6a1mr8258325b6e.26.1724599251237; Sun, 25 Aug 2024
 08:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240825084947.1032325-1-michael@amarulasolutions.com>
 <CAMKF1srbO=Us8xZHek=G_xC=KHwukNVC-vhDkh7Jz8oPmtavrQ@mail.gmail.com> <CAOf5uwkujw2tR1JDK9q_U6bM+BOkoH22Oeg99dPOvu4X0q-74w@mail.gmail.com>
In-Reply-To: <CAOf5uwkujw2tR1JDK9q_U6bM+BOkoH22Oeg99dPOvu4X0q-74w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Aug 2024 08:20:25 -0700
Message-ID: <CAMKF1sqArs6XFxoLtJwsDr9C5nPsuK3-g20d=mcVUJ0s38cEfw@mail.gmail.com>
Subject: Re: [oe] [PATCH] cpuset: Add recipe for cpuset tool 1.6.2
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 15:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111930

On Sun, Aug 25, 2024 at 8:17=E2=80=AFAM Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Hi
>
> On Sun, Aug 25, 2024 at 4:56=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > meta/ layer is part of oe-core, this patch if intended for
> > meta-openembedded should be part of meta-oe layer.
> >
>
> I have created the patch on top of
> https://git.openembedded.org/openembedded-core
> Is the right one?

that means this is meant for core layer, there is a separate layer for
sending patches to core
and there has to be strong reason to include something in core layer,
I would suggest that you
propose this patch for meta-oe layer under meta-openembedded repo that
is perhaps a better
location for this now. The mailing list to send patch for
meta-openembedded is this one.

>
> Michael
>
>
> > On Sun, Aug 25, 2024 at 1:49=E2=80=AFAM Michael Nazzareno Trimarchi via
> > lists.openembedded.org
> > <michael=3Damarulasolutions.com@lists.openembedded.org> wrote:
> > >
> > > Cpuset is a Python application that forms a wrapper around the
> > > standard Linux filesystem calls to make using the cpusets facilities
> > > in the Linux kernel easier. This can be used on linux realtime or
> > > standard linux
> > >
> > > Example
> > >
> > > cset shield --cpu 2-3
> > > echo c > /proc/irq/287/smp_affinity
> > > irq=3D`ps | grep -m 1 "irq/287"  | awk '{ print $1 }'`
> > > cset shield -s -p $irq --force
> > > chrt -f -p 75 $irq
> > >
> > > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > > ---
> > >  meta/conf/distro/include/maintainers.inc     |  1 +
> > >  meta/recipes-devtools/cpuset/cpuset_1.6.2.bb | 13 +++++++++++++
> > >  2 files changed, 14 insertions(+)
> > >  create mode 100644 meta/recipes-devtools/cpuset/cpuset_1.6.2.bb
> > >
> > > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dis=
tro/include/maintainers.inc
> > > index 60f36a9449..fe3d9c83d8 100644
> > > --- a/meta/conf/distro/include/maintainers.inc
> > > +++ b/meta/conf/distro/include/maintainers.inc
> > > @@ -121,6 +121,7 @@ RECIPE_MAINTAINER:pn-core-image-x11 =3D "Richard =
Purdie <richard.purdie@linuxfound
> > >  RECIPE_MAINTAINER:pn-core-image-sato-dev =3D "Richard Purdie <richar=
d.purdie@linuxfoundation.org>"
> > >  RECIPE_MAINTAINER:pn-coreutils =3D "Chen Qi <Qi.Chen@windriver.com>"
> > >  RECIPE_MAINTAINER:pn-cpio =3D "Denys Dmytriyenko <denis@denix.org>"
> > > +RECIPE_MAINTAINER:pn-cpuset =3D "Michael Trimarchi <michael@amarulas=
olutions.com>"
> > >  RECIPE_MAINTAINER:pn-cracklib =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
> > >  RECIPE_MAINTAINER:pn-createrepo-c =3D "Alexander Kanavin <alex.kanav=
in@gmail.com>"
> > >  RECIPE_MAINTAINER:pn-cronie =3D "Anuj Mittal <anuj.mittal@intel.com>=
"
> > > diff --git a/meta/recipes-devtools/cpuset/cpuset_1.6.2.bb b/meta/reci=
pes-devtools/cpuset/cpuset_1.6.2.bb
> > > new file mode 100644
> > > index 0000000000..b404d4131e
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/cpuset/cpuset_1.6.2.bb
> > > @@ -0,0 +1,13 @@
> > > +SUMMARY =3D "Cpuset manipulation tool"
> > > +HOMEPAGE =3D "https://github.com/SUSE/cpuset"
> > > +LICENSE =3D "GPL-2.0-only"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df07=
9bae19f"
> > > +
> > > +SRC_URI =3D "git://github.com/SUSE/cpuset.git;protocol=3Dhttps;branc=
h=3Dmaster"
> > > +
> > > +SRCREV =3D "4f80263208935f0df4f616cf9d8cb7285599a670"
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit setuptools3
> > > +
> > > +RDEPENDS:${PN} +=3D "python3-core python3-logging python3-pydoc"
> > > --
> > > 2.43.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#111927): https://lists.openembedded.org/g/openemb=
edded-devel/message/111927
> > > Mute This Topic: https://lists.openembedded.org/mt/108084672/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>
>
>
> --
> Michael Nazzareno Trimarchi
> Co-Founder & Chief Executive Officer
> M. +39 347 913 2170
> michael@amarulasolutions.com
> __________________________________
>
> Amarula Solutions BV
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> T. +31 (0)85 111 9172
> info@amarulasolutions.com
> www.amarulasolutions.com

