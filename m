Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F3CC48BEB
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 20:34:33 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.1796.1708547669367794751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 12:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g9nODdeM;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: jan.vermaete@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-59ffbff2841so1052919eaf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 12:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708547668; x=1709152468; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9T8hA/cZy/Cqb1NkgBYUU3yjszeC6JfWiEWkLQQvH+E=;
        b=g9nODdeMPjHq1LQ2Jh56k4cWcaF53RoIgCLdhjR5OKfaxL9gw+x1+C33pgq3OcbUeg
         DF1ob3nwS1P+m1VLOJgKsJGccq1yuSZIraqJh5P050ieP3RGevk4CVSMGD6V/J9RwWUZ
         sjs4uty/fd+lBnzzrzdIIt/HDZrKskcdogM9NliR36tFoa1TtG8QaMZyGon/AonuHYe3
         VDqAucRhQ6g6PDRVvAZIRC22vvLYlacuG0GxYoiDkO449XQfKxtKpBRMIQt+RqpG1QjW
         6m33ojT+SKo5GmJQnJSPTtm9FBIaHwQlfjG12IujovYYN1dZpKXqQlaI+LiP6vaQZb/I
         N3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708547668; x=1709152468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9T8hA/cZy/Cqb1NkgBYUU3yjszeC6JfWiEWkLQQvH+E=;
        b=g9WZ8vrpbaz3SbNaaLe1lQpEQ/9xdk4qoD4ZnM1vPWzPcht5I/NPvBi6BiYKM5cIRQ
         CxcqF4zuJbN8gXBTIzce7zWlPqmQxYl8y4cd6pg3SzKrHs+ZxAoEBbS8b9OlfR0ljh8V
         RegCyr4/J3/ocWlzLedWVRHORWr7yItIydWnmIUL0ru4Gr2kiX3NrjxHIz4W8j0MblH4
         ymXPfsrYU+0IHVmf9yVtsa4/QRNqoYi42FgDWIFuHTtcZOAMTbWMraC6kEM9dTOnHjg3
         S7ZWoupcStbNF1wUBzFchUpdSLCGYYxXrvTNNplbMxjCFP2G/IMmbUDfAQsO55gIuoHj
         OZzQ==
X-Gm-Message-State: AOJu0Yw1lO2jqGmf9pS24shToP+BTfON9EBDAqf5is/d5xsd3YbXDpUd
	hHq1GGhb93RcMKPAvMnBLqIut/KCkEtHnYKAT1c4ynnue/Sd6rBsEA9CnP2vqTrcuPwbnWDJpAW
	1VyNZPLwIbVla8RMuelpGFFISBFM=
X-Google-Smtp-Source: AGHT+IEtM6gWtcrNFquKxMfsbnLoK9y4+ETjjrhYoX88G0MULOKv79PkG+YC7qqKCkMp4gdP0OvrU2bXwpkTv6iIAJY=
X-Received: by 2002:a05:6871:e027:b0:21e:8797:95ca with SMTP id
 by39-20020a056871e02700b0021e879795camr14213508oac.23.1708547668536; Wed, 21
 Feb 2024 12:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20240221184624.3000696-1-jan.vermaete@gmail.com> <CAMKF1soThiXQmUDvfQhti=NXDvFEUQ_i126TyEZ1oyxZzeuJrw@mail.gmail.com>
In-Reply-To: <CAMKF1soThiXQmUDvfQhti=NXDvFEUQ_i126TyEZ1oyxZzeuJrw@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Wed, 21 Feb 2024 21:34:17 +0100
Message-ID: <CABF_=yi+=U+Q1kduwrwUt32Rt+5S3vZ76DyH65pqjug-32h_tQ@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] netdata: version bump 1.43.2 -> 1.44.3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 20:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108970

Hi Khem,

I was using the latest version of oelint-adv to check the recipe.
I had this warnings:
   netdata_1.43.2.bb:15:error:oelint.vars.srcuriappend:Use
SRC_URI:append otherwise this will override weak defaults by inherit
   netdata_1.43.2.bb:18:error:oelint.vars.srcuriappend:Use
SRC_URI:append otherwise this will override weak defaults by inherit

If you prefer I can make a v2 of the patch without it.

On Wed, Feb 21, 2024 at 8:47=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Wed, Feb 21, 2024 at 10:46=E2=80=AFAM Jan Vermaete <jan.vermaete@gmail=
.com> wrote:
> >
> > And fixed a few minor oelint-adv warnings in the recipe.
> >
> > Tested on Raspberry PI 4
> >
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > ---
> >  .../netdata/{netdata_1.43.2.bb =3D> netdata_1.44.3.bb} | 12 ++++++----=
--
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >  rename meta-webserver/recipes-webadmin/netdata/{netdata_1.43.2.bb =3D>=
 netdata_1.44.3.bb} (92%)
> >
> > diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb =
b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
> > similarity index 92%
> > rename from meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
> > rename to meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
> > index 28e82dac3..8eeb61f66 100644
> > --- a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
> > +++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
> > @@ -5,17 +5,17 @@ HOMEPAGE =3D "https://github.com/netdata/netdata/"
> >  LICENSE =3D "GPL-3.0-only"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc9b848046ef54b5eaee6071947=
abd24"
> >
> > -DEPENDS +=3D "libuv util-linux zlib libyaml json-c"
> > +DEPENDS +=3D "json-c libuv libyaml util-linux zlib "
> >
> > -SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}=
/${BPN}-v${PV}.tar.gz \
> > -"
> > -SRC_URI[sha256sum] =3D "d4a7ea2717ac7c8f04865f18e13aeaa0a36784156059f1=
b5ced75a44f74afc4d"
> > +SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}=
/${BPN}-v${PV}.tar.gz"
> > +
> > +SRC_URI[sha256sum] =3D "50df30a9aaf60d550eb8e607230d982827e04194f7df3e=
ba0e83ff7919270ad2"
> >
> >  # default netdata.conf for netdata configuration
> > -SRC_URI +=3D "file://netdata.conf"
> > +SRC_URI:append =3D " file://netdata.conf"
> >
> >  # file for providing systemd service support
> > -SRC_URI +=3D "file://netdata.service"
> > +SRC_URI:append =3D " file://netdata.service"
>
> why do we need to change +=3D to append here ?
>
> >
> >  UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/tags"
> >  UPSTREAM_CHECK_REGEX =3D "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)=
"
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108968): https://lists.openembedded.org/g/openembed=
ded-devel/message/108968
> > Mute This Topic: https://lists.openembedded.org/mt/104494299/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

