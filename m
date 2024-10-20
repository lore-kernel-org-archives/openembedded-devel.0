Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263A4D3C931
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 01:41:27 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.17400.1729388482947244236
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Oct 2024 18:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q8ykFsIW;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5eb5ea185daso1598728eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Oct 2024 18:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729388482; x=1729993282; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNL/sfLDupE7kge3q1LE4vBUgTHeUQK84ex+KzM2xXE=;
        b=Q8ykFsIWR1OKaRxxdnBuLNdp9w9PftNfRbVgAxx1WCwO5MH9EuhqSPqWKN7lQW6D+i
         GN1kzz3Nec25lGYvdFaEz17iIVKK9M0jjyg6Nwsht4guxVBllNyAUjhY0dubKK9bDPvG
         g2w/FCzHsLOW2unbOQrD58cLcnbPJNGdB2G/7bJbSv2x7b3ERRqkZ7+iX8LStL3kYp2O
         6wg+evCGXQ6i7+5PvOAZkMqnQVPVKiT8wVk+5cUsrWrmfwWe7+EWg2PkIsNlDV7n9y1t
         SPBvhdZXLs5nSl7iCMctaEs4jB6O9HJ+7ph0kEqcALDGaSkFl8sCCdJQYiwkHRua1VZz
         A8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729388482; x=1729993282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNL/sfLDupE7kge3q1LE4vBUgTHeUQK84ex+KzM2xXE=;
        b=rDPpjBuOWxYf5GR7OaTWf9XwGZMBBS2Gl46yE/u1/l1hBemDqztuvLpXWT9DCZVX7Z
         LQfHdsXeSLI3gm0vgmcpwySpZITAeux4gmM6zlR4O6RJP51XsNNQGF7aAN6/l2dGQhAm
         Eggdb9M0vn+bbZJcfThV87nW3dGcOwtf3vLO3ViR/xn/aO0Sl54fkr4NXwQgBUyBZVY2
         x+bX+I6py7BP7Wptvi4+uNaTdPT3I+k2G2Lmvd6/1lnEUHRZJWpLEcq2RypWfgFqOELr
         xh7EXnZg/TwNblJKtm5FXj3jRces6PbuDqWUaLduOZn885I9eaKFT+49LRmleAkjPM74
         D9Iw==
X-Gm-Message-State: AOJu0YzCWrLIxK/u3srLTvtlfvdismj/caMdCvOjbzj8feou4O1yBsOB
	3Dj6LD7agvOJ8+Y3CVxCk74NV2WZcRj94J/D+UtjaWjxi1MJK3qlcyPHJklWYRYvniJObSMxMYQ
	Jwx/SO3P28H3QkquFqamC7h01E2s=
X-Google-Smtp-Source: AGHT+IF4OtOYoSypFcSEzTSWXBS/bslKn7XT7cnx79feQNJxMmnigNGh04z52DCv2i2v8GJ8sW3Lrhu2rceHbD92GsE=
X-Received: by 2002:a05:6820:151a:b0:5eb:827b:9bbb with SMTP id
 006d021491bc7-5eb8b68d1e0mr5720114eaf.5.1729388482023; Sat, 19 Oct 2024
 18:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20241018131724.3051-1-f_l_k@t-online.de> <CAMKF1srcCF_yCHMuqaeCT2UxC_ZgKN=S_bVzCsQMmHQRidt+sw@mail.gmail.com>
In-Reply-To: <CAMKF1srcCF_yCHMuqaeCT2UxC_ZgKN=S_bVzCsQMmHQRidt+sw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Oct 2024 18:40:56 -0700
Message-ID: <CAMKF1sopLEXWs+9GuF5rE=o+cThN01X0-0xkiAafVsXNWnb2Ng@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] snapper: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 01:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113064

On Fri, Oct 18, 2024 at 9:23=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Fri, Oct 18, 2024 at 6:15=E2=80=AFAM Markus Volk via lists.openembedde=
d.org
> <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
> >
> > Snapper is a tool for Linux file system snapshot management. Apart from
> > the obvious creation and deletion of snapshots it can compare snapshots
> > and revert differences between them. In simple terms, this allows root
> > and non-root users to view older versions of files and revert changes.
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  .../recipes-support/snapper/snapper_0.11.2.bb | 35 +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> >
> > diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-o=
e/recipes-support/snapper/snapper_0.11.2.bb
> > new file mode 100644
> > index 000000000..2759cdafb
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> > @@ -0,0 +1,35 @@
> > +SUMMARY =3D "Snapper is a tool for Linux file system snapshot manageme=
nt"
> > +HOMEPAGE =3D "https://github.com/openSUSE/snapper"
> > +LICENSE =3D "GPL-2.0-only"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe"
> > +
> > +DEPENDS =3D "acl boost btrfs-tools dbus json-c libxml2 lvm2 zlib"
> > +
> > +# Build separation is slightly broken
> > +inherit autotools-brokensep pkgconfig gettext
> > +
> > +SRC_URI =3D "git://github.com/openSUSE/snapper.git;protocol=3Dhttps;br=
anch=3Dmaster"
> > +SRCREV =3D "6c603565f36e9996d85045c8012cd04aba5f3708"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'api-documen=
tation systemd pam', d)}"
> > +PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
> > +PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd"
> > +PACKAGECONFIG[api-documentation] =3D "--enable-doc,--disable-doc,libxs=
lt-native docbook-xsl-stylesheets-native"
> > +
> > +# Avoid HOSTTOOLS path in binaries
> > +export DIFFBIN=3D"${bindir}/diff"
> > +export RMBIN =3D "${bindir}/rm"
> > +export TOUCHBIN =3D "${bindir}/touch"
> > +export CPBIN =3D "${bindir}/cp"
> > +
> > +
> > +do_install:append() {
> > +       install -d ${D}${sysconfdir}/sysconfig
> > +       install -m0644 ${S}/data/default-config ${D}${sysconfdir}/sysco=
nfig/snapper
> > +}
> > +
> > +FILES:${PN} +=3D "${libdir}/pam_snapper ${libdir}/systemd ${libdir}/zy=
pp ${libdir}/security ${datadir}"
> > +# bash is needed for the testsuite
> > +RDEPENDS:${PN} =3D "bash diffutils util-linux"
>
> It would be good to package test binary and resources into ${PN}-ptest pa=
ckage
> and then attach the needed rdeps to ${PN}-ptest package also look into
> inheriting
> ptest class which should provide a basic build block for adding ptests.
>

it fails to build with musl see
https://errors.yoctoproject.org/Errors/Details/809996/

stavfs64 is not needed if we are already using LFS64, we can just use
statvfs even on glibc
otherwise add -D_LARGEFILE64_SOURCE with musl builds to cflags

> > --
> > 2.47.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#112978): https://lists.openembedded.org/g/openembed=
ded-devel/message/112978
> > Mute This Topic: https://lists.openembedded.org/mt/109081580/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

