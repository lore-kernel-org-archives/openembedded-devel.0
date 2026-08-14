Return-Path: <james@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9322DC5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 04:15:05 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6207.1786680897832230062
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 21:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=JsQBYrRe;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: james@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1786680894;
	bh=w/43dI9bf4BFzYqxjzSXxrJu0kLqm2zk2hERFbEE7WY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JsQBYrReUd1xIVw2tPiFpsSEnA7VV/Jo2GbsbeCa+6fSt5h2KmsNDUu71tDObzhRw
	 MokLox7sOLlWN4OFUBZgD+TC9G9aC4uqjwsWSqLl34i+gjAJ4qW232WhxZ7ECRoaid
	 uICpAzJVMRLXmtAszRsNc93Vt3A/fVT6TilR5Lpn7u5Zfqme9Spf9o69FGvZSQDncq
	 3O2RDv2Lv0GiptEhoJDLl4sYuBNODLryUbm/WMne74D81Gzf13nT1GeBZR3mFH9mn/
	 sp63aFwZCO7u+sAdg9i1f60R2Jw3ig5LCIxT8zEkrCi632MSwhZCLOy2AL8UKMax9g
	 dbcBtY77BfpXg==
Received: from [192.168.72.170] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2DB0066FAE;
	Fri, 14 Aug 2026 12:14:54 +0800 (AWST)
Message-ID: <b921cfd80b988672d5f0b03731e19a8f12f8acba.camel@codeconstruct.com.au>
Subject: Re: [oe] [meta-networking] [PATCH v2 1/2] mctp: split mctp tools
 and mctpd into separate recipes
From: James Lee <james@codeconstruct.com.au>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, andrew@codeconstruct.com.au, 
	jk@codeconstruct.com.au
Date: Fri, 14 Aug 2026 12:14:53 +0800
In-Reply-To: <CAMKF1srwt1jwqqCsvqOuO+2BpZsADa7N0R7Sz10HOctHaiCsUg@mail.gmail.com>
References: <20260811072523.3463118-1-james@codeconstruct.com.au>
	 <CAMKF1srwt1jwqqCsvqOuO+2BpZsADa7N0R7Sz10HOctHaiCsUg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 04:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129031

I believe that would work, but think it's important to have a clear
split at this point.

The mctp utilities and mctpd daemon have different use-cases and
dependencies, and do not depend on each other. The split allows users
to install the mctp utilities on systemd distros without automatically
adding the daemon. It also makes it clear that the mctp package does
not depend on systemd or useradd.

On Thu, 2026-08-13 at 06:53 -0700, Khem Raj wrote:
> Can we do something like=C2=A0
> inherit_defer ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> 'useradd', '', d)}
>=20
> On Tue, Aug 11, 2026 at 12:25=E2=80=AFAM James Lee via lists.openembedded=
.org
> <james=3Dcodeconstruct.com.au@lists.openembedded.org> wrote:
> > The current mctp recipe relies on the upstream's conditional build
> > and
> > install of the mctpd binary if systemd is present, only building
> > the
> > mctp utility otherwise. Future upstream changes allowing running as
> > non-root require more control over the build process. We will need
> > to
> > add a new system user when mctpd is built.
> >=20
> > Adding a user requires inheriting useradd, which assumes at least
> > one
> > user will be created, failing the recipe otherwise. Building
> > without
> > mctpd would then cause the recipe to fail as conditionally
> > inheriting
> > useradd seems infeasible.
> >=20
> > To make useradd available for the new upstream release, split the
> > recipe
> > into "mctp" for the utilities and "mctpd" for the daemon, isolating
> > the
> > systemd dependency to "mctpd".
> >=20
> > This makes the two parts of the source explicitly selectable from
> > user
> > choice, rather than auto-detecting based on the presence of
> > systemd. It
> > will also let us express the useradd rules only when they're needed
> > for
> > the mctpd installation in the upcoming version bump.
> >=20
> > Signed-off-by: James Lee james@codeconstruct.com.au
> > ---
> > =C2=A0meta-networking/recipes-support/mctp/mctp.inc | 11 +++++
> > =C2=A0.../recipes-support/mctp/mctp_2.5.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 46 ++-------------
> > ----
> > =C2=A0.../recipes-support/mctp/mctpd_2.5.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 28 +++++++++++
> > =C2=A03 files changed, 42 insertions(+), 43 deletions(-)
> > =C2=A0create mode 100644 meta-networking/recipes-support/mctp/mctp.inc
> > =C2=A0create mode 100644 meta-networking/recipes-
> > support/mctp/mctpd_2.5.bb
> >=20
> > diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-
> > networking/recipes-support/mctp/mctp.inc
> > new file mode 100644
> > index 0000000000..98225cffea
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/mctp/mctp.inc
> > @@ -0,0 +1,11 @@
> > +HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
> > +SECTION =3D "net"
> > +LICENSE =3D "GPL-2.0-only"
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
> > +
> > +SRC_URI =3D
> > "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag
> > =3Dv${PV}"
> > +SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
> > +
> > +inherit meson pkgconfig
> > +
> > +EXTRA_OEMESON =3D "-Dtests=3Dfalse"
> > diff --git a/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > b/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > index a8787d3f2b..5811495c66 100644
> > --- a/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > +++ b/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > @@ -1,45 +1,5 @@
> > -SUMMARY =3D "Management Component Control Protocol utilities"
> > -HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
> > -SECTION =3D "net"
> > -LICENSE =3D "GPL-2.0-only"
> > +require mctp.inc
> >=20
> > -LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
> > +SUMMARY =3D "Management Component Transport Protocol (MCTP)
> > utilities"
> >=20
> > -SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
> > -
> > -SRC_URI =3D
> > "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag
> > =3Dv${PV}"
> > -
> > -
> > -inherit meson pkgconfig systemd
> > -
> > -EXTRA_OEMESON =3D " \
> > -=C2=A0 =C2=A0 -Dtests=3Dfalse \
> > -"
> > -
> > -PACKAGECONFIG ??=3D " \
> > -=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > -"
> > -
> > -# mctpd will only be built if pkg-config detects libsystemd; in
> > which case
> > -# we'll want to declare the dep and install the service.
> > -PACKAGECONFIG[systemd] =3D ",,systemd,libsystemd"
> > -SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-
> > local.target"
> > -SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
> > -
> > -do_install:append () {
> > -=C2=A0 =C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'tru=
e',
> > 'false', d)}; then
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_system_unitdir}
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd.service \
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${systemd_=
system_unitdir}/mctpd.service
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/conf/*.target \
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${systemd_=
system_unitdir}/
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${datadir}/dbus-1/system.d
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd-dbus.conf =
\
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${datadir}=
/dbus-1/system.d/mctpd.conf
> > -=C2=A0 =C2=A0 fi
> > -}
> > -
> > -FILES:${PN} +=3D " \
> > -=C2=A0 =C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 '${datadir}/dbus-1/system.d/=
mctpd.conf', '', d)} \
> > -"
> > +MESON_TARGET =3D "mctp mctp-client"
> > diff --git a/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> > b/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> > new file mode 100644
> > index 0000000000..f049be646b
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> > @@ -0,0 +1,28 @@
> > +require mctp.inc
> > +
> > +SUMMARY =3D "Management Component Transport Protocol (MCTP) control
> > protocol daemon"
> > +
> > +inherit systemd
> > +
> > +do_install:append () {
> > +=C2=A0 =C2=A0 install -d ${D}${systemd_system_unitdir}
> > +=C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd.service \
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${systemd_system_unitdir=
}/mctpd.service
> > +=C2=A0 =C2=A0 install -m 0644 ${S}/conf/*.target \
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${systemd_system_unitdir=
}/
> > +=C2=A0 =C2=A0 install -d ${D}${datadir}/dbus-1/system.d
> > +=C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd-dbus.conf \
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${datadir}/dbus-1/system=
.d/mctpd.conf
> > +}
> > +
> > +SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-
> > local.target"
> > +
> > +DEPENDS +=3D "systemd"
> > +
> > +# Meson adds mctp utility binaries to FILES and do_install(),
> > which cannot be
> > +# overriden by MESON_TARGET. Override FILES and remove binaries to
> > correct.
> > +FILES:${PN} =3D "${datadir}/dbus-1/system.d/mctpd.conf
> > ${sbindir}/mctpd"
> > +
> > +do_install:append () {
> > +=C2=A0 =C2=A0 rm -r ${D}${bindir}
> > +}

