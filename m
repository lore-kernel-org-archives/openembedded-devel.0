Return-Path: <michael@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF875C5320E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 15:17:33 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.33245.1724599044792085158
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 08:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=pitv+gnL;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.41, mailfrom: michael@amarulasolutions.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a843bef98so344336766b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724599043; x=1725203843; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pd6HuzK/Sqms72tK2wzd7ZUQEVkHNs7zUOQ4wv73uwQ=;
        b=pitv+gnLxiMwU8+MDZb7PR81zKV0+TW4haekkpHbwT99fG+jxTATdG3I19M5Glsm7e
         Fnw1Lp1irDWdjEBbUYsCr5qzyL9NhePwN+IFy050/HpWam9+XhdcoJZbN5r/9QEvhxxR
         AHDa5iOHjPl6a7JHbOYeQdu5FsYoGetnjFJJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724599043; x=1725203843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pd6HuzK/Sqms72tK2wzd7ZUQEVkHNs7zUOQ4wv73uwQ=;
        b=Oe/J8EjL9r7AuDerxgf1f5feHnDmvrGcOneI5773hrdDwVLozlVmL9XOeHR2KPg8eV
         M0msm2TsgskH8cw9oNBibpgCkJ/C7L392On4ynVQdMmkwzriLMp9p4lQbyR9jW2XeLm7
         FSz7x+urK2sit6VTQ62vW16I4XeoiaqRRoasmXr+vqL3TU+lnlZsiSTsNjVryRREa/MP
         BH7hEsSG3q6RbmJvh1ElAFPr9uRneLvuNJlgYkc/gNBZabZ7csJIizXjg5D2SBoZkDBy
         y0rNMUbi3x0jI431ozPrbhv1Fke60qAn0+7OsPkMyDoQW/ufx4clomqCxy6/dEOS9ADN
         whVQ==
X-Gm-Message-State: AOJu0YzQKA1nb91KYm5G7A9OePIE38vNT4OqmQ+uAfaCXOp3imKvutpN
	2GXS7my7ziKoVTIW1d87PDb1Coly8ihhPganzFRwJDizV5Zxg+YBA/k1HcZmQG6X0VZvYhEzM0s
	zxD0Jer3FUjIbE+fzkGmw8+pUPYgGNe9OITiXeA==
X-Google-Smtp-Source: AGHT+IHG962l4XLobJQYLvZct+W1RJ8pdYjLQx7MmxsNT7Vstb9kwa4York8UxtnhAZLgf72Q4V+tswq42FazdZpa1I=
X-Received: by 2002:a17:907:2cc6:b0:a86:9adb:51ca with SMTP id
 a640c23a62f3a-a86a52b1e56mr535049466b.24.1724599042410; Sun, 25 Aug 2024
 08:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240825084947.1032325-1-michael@amarulasolutions.com> <CAMKF1srbO=Us8xZHek=G_xC=KHwukNVC-vhDkh7Jz8oPmtavrQ@mail.gmail.com>
In-Reply-To: <CAMKF1srbO=Us8xZHek=G_xC=KHwukNVC-vhDkh7Jz8oPmtavrQ@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sun, 25 Aug 2024 17:17:11 +0200
Message-ID: <CAOf5uwkujw2tR1JDK9q_U6bM+BOkoH22Oeg99dPOvu4X0q-74w@mail.gmail.com>
Subject: Re: [oe] [PATCH] cpuset: Add recipe for cpuset tool 1.6.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 15:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111929

Hi

On Sun, Aug 25, 2024 at 4:56=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> meta/ layer is part of oe-core, this patch if intended for
> meta-openembedded should be part of meta-oe layer.
>

I have created the patch on top of
https://git.openembedded.org/openembedded-core
Is the right one?

Michael


> On Sun, Aug 25, 2024 at 1:49=E2=80=AFAM Michael Nazzareno Trimarchi via
> lists.openembedded.org
> <michael=3Damarulasolutions.com@lists.openembedded.org> wrote:
> >
> > Cpuset is a Python application that forms a wrapper around the
> > standard Linux filesystem calls to make using the cpusets facilities
> > in the Linux kernel easier. This can be used on linux realtime or
> > standard linux
> >
> > Example
> >
> > cset shield --cpu 2-3
> > echo c > /proc/irq/287/smp_affinity
> > irq=3D`ps | grep -m 1 "irq/287"  | awk '{ print $1 }'`
> > cset shield -s -p $irq --force
> > chrt -f -p 75 $irq
> >
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc     |  1 +
> >  meta/recipes-devtools/cpuset/cpuset_1.6.2.bb | 13 +++++++++++++
> >  2 files changed, 14 insertions(+)
> >  create mode 100644 meta/recipes-devtools/cpuset/cpuset_1.6.2.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distr=
o/include/maintainers.inc
> > index 60f36a9449..fe3d9c83d8 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -121,6 +121,7 @@ RECIPE_MAINTAINER:pn-core-image-x11 =3D "Richard Pu=
rdie <richard.purdie@linuxfound
> >  RECIPE_MAINTAINER:pn-core-image-sato-dev =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
> >  RECIPE_MAINTAINER:pn-coreutils =3D "Chen Qi <Qi.Chen@windriver.com>"
> >  RECIPE_MAINTAINER:pn-cpio =3D "Denys Dmytriyenko <denis@denix.org>"
> > +RECIPE_MAINTAINER:pn-cpuset =3D "Michael Trimarchi <michael@amarulasol=
utions.com>"
> >  RECIPE_MAINTAINER:pn-cracklib =3D "Unassigned <unassigned@yoctoproject=
.org>"
> >  RECIPE_MAINTAINER:pn-createrepo-c =3D "Alexander Kanavin <alex.kanavin=
@gmail.com>"
> >  RECIPE_MAINTAINER:pn-cronie =3D "Anuj Mittal <anuj.mittal@intel.com>"
> > diff --git a/meta/recipes-devtools/cpuset/cpuset_1.6.2.bb b/meta/recipe=
s-devtools/cpuset/cpuset_1.6.2.bb
> > new file mode 100644
> > index 0000000000..b404d4131e
> > --- /dev/null
> > +++ b/meta/recipes-devtools/cpuset/cpuset_1.6.2.bb
> > @@ -0,0 +1,13 @@
> > +SUMMARY =3D "Cpuset manipulation tool"
> > +HOMEPAGE =3D "https://github.com/SUSE/cpuset"
> > +LICENSE =3D "GPL-2.0-only"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> > +
> > +SRC_URI =3D "git://github.com/SUSE/cpuset.git;protocol=3Dhttps;branch=
=3Dmaster"
> > +
> > +SRCREV =3D "4f80263208935f0df4f616cf9d8cb7285599a670"
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit setuptools3
> > +
> > +RDEPENDS:${PN} +=3D "python3-core python3-logging python3-pydoc"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111927): https://lists.openembedded.org/g/openembed=
ded-devel/message/111927
> > Mute This Topic: https://lists.openembedded.org/mt/108084672/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



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

