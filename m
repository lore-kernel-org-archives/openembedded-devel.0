Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 73EED79291
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 01:31:39 +0000 (UTC)
Received: from svr-orw-mbx-03.mgc.mentorg.com ([147.34.90.203])
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1fqTc3-0006q1-VW from Joe_MacDonald@mentor.com ;
	Thu, 16 Aug 2018 18:31:40 -0700
Received: from svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) by
	svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Thu, 16 Aug 2018 18:31:37 -0700
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) with Microsoft SMTP
	Server id
	15.0.1320.4 via Frontend Transport; Thu, 16 Aug 2018 18:31:36 -0700
Received: by burninator.cal.mentorg.com (Postfix, from userid 5844)
	id 77C6A28A2431; Thu, 16 Aug 2018 21:31:35 -0400 (EDT)
Date: Thu, 16 Aug 2018 21:31:34 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Stefan BOSAK <stefan.bosak@gmail.com>
Message-ID: <20180817013133.GA19232@mentor.com>
References: <20180816024200.6394-1-joe_macdonald@mentor.com>
	<CAPr_pvtpVGhG-9N3miYOG9ZWhY=LzQWmp4Ewmj9RXh8s-_59Wg@mail.gmail.com>
	<20180816161901.GB9441@mentor.com>
	<CAPr_pvvoqkqNsZ+-eSBMa11_GKJPdPCPZjnOug=81W+vV7gLRA@mail.gmail.com>
	<20180816194526.GC13296@mentor.com>
	<CAPr_pvtGjZyVrKR7Ex8U7eSYHApncXDq2p_9HAoS+0EcEE7NKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPr_pvtGjZyVrKR7Ex8U7eSYHApncXDq2p_9HAoS+0EcEE7NKg@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] bird: initial import
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2018 01:31:39 -0000
X-Groupsio-MsgNum: 74012
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Based on the information you've share here, then, I have some additional
questions about this, because I'm now not confident I can correlate what
you've said with what I'm seeing.

[Re: [meta-networking][PATCH] bird: initial import] On 18.08.16 (Thu 22:56)=
 Stefan BOSAK wrote:

> Hi Joe,
>=20
> this ipv6 compilation option is still relevant for versions 1.6.x (this is
> production ready line).
> For versions 2.0.x (would go to production ready mode later), you are rig=
ht, it
> has been changed longer time ago
> (given option will be configured internally, no external configuration is
> supported in this scope).
> Within Yocto recipe rules/procedures/processes only bird_1.6.x has to app=
ly
> above mentioned
> compilation configuration attribute to be able to support dual-stack mode=
 (IPv4
> & IPv6).

This much makes sense.  So the obvious approach, then, would be to
add --enable-ipv6 to the 1.6.4 recipe's EXTRA_OECONF options and leave
--enable-pthreads in the bird.inc file.

When I do, though, the result is not what I would expect based on what
you're saying below.

First, the output of each of these are:

   bird-2.0.2-r0.core2_64
   =E2=94=9C=E2=94=80=E2=94=80 etc
   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bird.conf
   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 init.d
   =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 bird
   =E2=94=9C=E2=94=80=E2=94=80 usr
   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 sbin
   =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 bird
   =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 birdc
   =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 birdcl
   =E2=94=94=E2=94=80=E2=94=80 var

and

   bird-1.6.4-r0.core2_64
   =E2=94=9C=E2=94=80=E2=94=80 etc
   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bird6.conf
   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 init.d
   =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 bird
   =E2=94=9C=E2=94=80=E2=94=80 usr
   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 sbin
   =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 bird6
   =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 birdc6
   =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 birdcl6
   =E2=94=94=E2=94=80=E2=94=80 var

and if I remove the --enable-ipv6 option from the 1.6.4 recipe I see:

   bird-1.6.4-r0.core2_64
   =E2=94=9C=E2=94=80=E2=94=80 etc
   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bird.conf
   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 init.d
   =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 bird
   =E2=94=9C=E2=94=80=E2=94=80 usr
   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 sbin
   =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 bird
   =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 birdc
   =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 birdcl
   =E2=94=94=E2=94=80=E2=94=80 var

> There is also one reminder from my side that there are to be several
> applications and two independent
> init scripts needed at least for versions 1.6.x (the same should be for 2=
=2E0.x):
> /usr/sbin/{bird,birdc}, /usr/sbin/{birdc,birdc6}; /etc/init.d/{bird, bird=
6}.

So then it almost looks like the --enable-ipv6 option for the 1.6.4
recipe will only build one of the two versions at a time whereas (maybe)
the single binary (client or daemon) will provide both ipv4 and v6
functionality.  Can you help we understand what's happening here?  Do we
potentially need two different recipes for each of the v4 and v6
versions of the 1.6.4 recipe?

Thanks,
-Joe.

> As I wrote in my first message I am not Yocto recipe expert (still in kin=
d of
> learning phase), potentially some additional alignment would be needed.
> Bird is one of the best BGP daemon available worldwide and would be really
> great to have this tool within native Yocto ecosystem.
> Again let me say thank you to all contributors and supporters in this sco=
pe.
>=20
> Have a nice day.
>=20
> Ing. Stefan Bosak
>=20
> M +421 948 852 092
> E stefan.bosak@gmail.com
>=20
>=20
> On Thu, Aug 16, 2018 at 9:45 PM Joe MacDonald <Joe_MacDonald@mentor.com> =
wrote:
>=20
>     Hi Stefan,
>=20
>     [Re: [meta-networking][PATCH] bird: initial import] On 18.08.16 (Thu =
19:59)
>     Stefan BOSAK wrote:
>=20
>     > Hi Joe and other contributors/supporters,
>     >
>     > i got through changes prepared by Joe, one important configuration
>     attribute is
>     > missing (--enable-ipv6):
>     > meta-networking/recipes-protocols/bird/bird.inc:
>     > EXTRA_OECONF  +=3D "\
>     > --enable-pthreads \
>     > --enable-ipv6 \
>     > "
>     > May I kindly ask you to add above mentioned within changes coming i=
nto
>     official
>     > branches please ?
>=20
>     I had a quick look at the configure options for bird 2.0.2 and I don't
>     see --enable-ipv6 listed:
>=20
>        /build/jjm/misc/buildx $ ../bird-2.0.2/configure --enable-ipv6
>        configure: WARNING: unrecognized options: --enable-ipv6
>=20
>     It looks like it might have been removed last December maybe from the
>     changelog:
>=20
>        commit b5257bea853850809be7f03eb0e1dbb398c56c34
>        Author: Ondrej Filip <feela@network.cz>
>        Date:   Tue Dec 12 10:43:56 2017 +0100
>=20
>            Removed '--enable-ipv6' reference.
>=20
>=20
>     Are you sure it's still required?
>=20
>     -J.
>=20
>     >
>     > Huge thank you for the support to all of you.
>     >
>     > Have a nice day.
>     >
>     > Ing. Stefan Bosak
>     >
>     > M +421 948 852 092
>     > E stefan.bosak@gmail.com
>     >
>     >
>     > On Thu, Aug 16, 2018 at 6:19 PM Joe MacDonald <Joe_MacDonald@mentor=
=2Ecom>
>     wrote:
>     >
>     >     [Re: [meta-networking][PATCH] bird: initial import] On 18.08.16=
 (Thu
>     07:06)
>     >     Stefan BOSAK wrote:
>     >
>     >     > Hi Joe and other contributors,
>     >     >
>     >     > thank you very much for your kind support in the term of addi=
ng of
>     >     > bird (BGP daemon) recipe into meta-networking layer.
>     >     > I would like to ask you about expected merge/commit time line=
 into
>     >     > official branch(es).
>     >
>     >     Generally something like this won't take long to make it into t=
he
>     master
>     >     branch.  Already released branches are rarely (as a rule never,=
 I
>     would
>     >     say) updated with new content.
>     >
>     >     -J.
>     >
>     >     >
>     >     > Thanks.
>     >     >
>     >     > Have a nice day.
>     >     >
>     >     > Ing. Stefan Bosak
>     >     >
>     >     > M +421 948 852 092
>     >     > E stefan.bosak@gmail.com
>     >     >
>     >     >
>     >     > On Thu, Aug 16, 2018 at 4:42 AM Joe MacDonald <
>     joe_macdonald@mentor.com>
>     >     wrote:
>     >     >
>     >     >     Initial integration of the two stable BIRD releases, 1.6.=
4 and
>     2.0.2.
>     >     >
>     >     >     Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>     >     >     ---
>     >     >
>     >     >     This set of recipes came my way quite a while back from S=
tefan
>     >     Bosak.  I've
>     >     >     updated the recipes a bit, made them compile with MUSL and
>     verified
>     >     basic
>     >     >     functionality on x86_64 and qemuarm.
>     >     >
>     >     >      .../recipes-protocols/bird/bird.inc           |   32 +
>     >     >      .../recipes-protocols/bird/bird_1.6.4.bb      |    9 +
>     >     >      .../recipes-protocols/bird/bird_2.0.2.bb      |    9 +
>     >     >      ...-extend-config.sub-to-recognize-musl.patch | 4428
>     >     +++++++++++++++++
>     >     >      .../recipes-protocols/bird/files/bird.init    |    2 +
>     >     >      5 files changed, 4480 insertions(+)
>     >     >      create mode 100644 meta-networking/recipes-protocols/bir=
d/
>     bird.inc
>     >     >      create mode 100644 meta-networking/recipes-protocols/bir=
d/
>     >     bird_1.6.4.bb
>     >     >      create mode 100644 meta-networking/recipes-protocols/bir=
d/
>     >     bird_2.0.2.bb
>     >     >      create mode 100644 meta-networking/recipes-protocols/bir=
d/
>     files/
>     >     >     0001-musl-extend-config.sub-to-recognize-musl.patch
>     >     >      create mode 100755 meta-networking/recipes-protocols/bir=
d/
>     files/
>     >     bird.init
>     >     >
>     >     >     diff --git a/meta-networking/recipes-protocols/bird/bird.=
inc b/
>     >     >     meta-networking/recipes-protocols/bird/bird.inc
>     >     >     new file mode 100644
>     >     >     index 000000000..33d17dcb7
>     >     >     --- /dev/null
>     >     >     +++ b/meta-networking/recipes-protocols/bird/bird.inc
>     >     >     @@ -0,0 +1,32 @@
>     >     >     +SUMMARY =3D "BIRD Internet Routing Daemon"
>     >     >     +DESCRIPTION =3D "\
>     >     >     +BIRD is dynamic routing daemon supporting IPv4 and IPv6
>     versions of
>     >     >     routing \
>     >     >     +protocols BGP, RIP and OSPF."
>     >     >     +HOMEPAGE =3D "http://bird.network.cz"
>     >     >     +SECTION =3D "console/network"
>     >     >     +LICENSE =3D "GPLv2"
>     >     >     +LIC_FILES_CHKSUM =3D "file://README;beginline=3D87;endli=
ne=3D103;md5
>     =3D
>     >     >     0efecc23f039022580d0bac9a52f6117"
>     >     >     +DEPENDS =3D "flex bison ncurses readline"
>     >     >     +
>     >     >     +inherit autotools
>     >     >     +
>     >     >     +EXTRA_OECONF  +=3D "\
>     >     >     +--enable-pthreads \
>     >     >     +"
>     >     >     +
>     >     >     +do_configure() {
>     >     >     +    oe_runconf ${EXTRA_OECONF}
>     >     >     +}
>     >     >     +
>     >     >     +do_install_append() {
>     >     >     +    install -m 0755 -d ${D}${sysconfdir}/init.d
>     >     >     +    install -m 0755 ${WORKDIR}/bird.init ${D}${sysconfdi=
r}/
>     init.d/
>     >     bird
>     >     >     +    rm -rf ${D}/run ${D}/var/run
>     >     >     +}
>     >     >     +
>     >     >     +PACKAGES +=3D " bird-client"
>     >     >     +
>     >     >     +FILES_${PN} +=3D "/run /var/run"
>     >     >     +FILES_${PN}-client =3D "/usr/sbin/birdc*"
>     >     >     +
>     >     >     +RUNIT_SERVICES =3D "bird"
>     >     >     diff --git a/meta-networking/recipes-protocols/bird/
>     bird_1.6.4.bb b/
>     >     >     meta-networking/recipes-protocols/bird/bird_1.6.4.bb
>     >     >     new file mode 100644
>     >     >     index 000000000..27c62aeee
>     >     >     --- /dev/null
>     >     >     +++ b/meta-networking/recipes-protocols/bird/bird_1.6.4.bb
>     >     >     @@ -0,0 +1,9 @@
>     >     >     +require bird.inc
>     >     >     +
>     >     >     +SRC_URI =3D "\
>     >     >     +    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}.tar.gz \
>     >     >     +    file://bird.init \
>     >     >     +    file://0001-musl-extend-config.sub-to-recognize-musl=
=2Epatch
>     \
>     >     >     +    "
>     >     >     +SRC_URI[md5sum] =3D "d62ec2547338e8d3dfb934b4c7b2faa4"
>     >     >     +SRC_URI[sha256sum] =3D
>     >     >  =20
>      "c26b8caae988dba81a9dbbee93502463d4326d1b749d728d62aa5529c605afc0"
>     >     >     diff --git a/meta-networking/recipes-protocols/bird/
>     bird_2.0.2.bb b/
>     >     >     meta-networking/recipes-protocols/bird/bird_2.0.2.bb
>     >     >     new file mode 100644
>     >     >     index 000000000..92d858869
>     >     >     --- /dev/null
>     >     >     +++ b/meta-networking/recipes-protocols/bird/bird_2.0.2.bb
>     >     >     @@ -0,0 +1,9 @@
>     >     >     +require bird.inc
>     >     >     +
>     >     >     +SRC_URI =3D "\
>     >     >     +    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}.tar.gz \
>     >     >     +    file://bird.init \
>     >     >     +    file://0001-musl-extend-config.sub-to-recognize-musl=
=2Epatch
>     \
>     >     >     +    "
>     >     >     +SRC_URI[md5sum] =3D "de17645b045fa13912409aea59420132"
>     >     >     +SRC_URI[sha256sum] =3D
>     >     >  =20
>      "035f91d6f568f8ed438a0814235ac4c5c79147cd2acf201322c307732883480f"
>     >     >     diff --git a/meta-networking/recipes-protocols/bird/files/
>     >     >     0001-musl-extend-config.sub-to-recognize-musl.patch b/
>     meta-networking
>     >     /
>     >     >     recipes-protocols/bird/files/
>     >     >     0001-musl-extend-config.sub-to-recognize-musl.patch
>     >     >     new file mode 100644
>     >     >     index 000000000..4feb7f786
>     >     >     --- /dev/null
>     >     >     +++ b/meta-networking/recipes-protocols/bird/files/
>     >     >     0001-musl-extend-config.sub-to-recognize-musl.patch
>     >     >     @@ -0,0 +1,4428 @@
>     >     >     +From 21baaa6870edb68f0a417ea3b4de5c75e5cf5a0d Mon Sep 17
>     00:00:00
>     >     2001
>     >     >     +From: Joe MacDonald <joe_macdonald@mentor.com>
>     >     >     +Date: Thu, 16 Aug 2018 01:56:05 +0000
>     >     >     +Subject: [PATCH] musl: update config.guess and config.sub
>     >     >     +
>     >     >     +Just bringing config.guess and config.sub up to date is =
enough
>     to
>     >     enable
>     >     >     +musl to build BIRD.
>     >     >     +
>     >     >     +Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>     >     >     +---
>     >     >     + tools/config.guess | 1193 ++++++++++++++---------------
>     >     >     + tools/config.sub   | 1810
>     >     +++++++++++++++++++++++---------------------
>     >     >     + 2 files changed, 1520 insertions(+), 1483 deletions(-)
>     >     >     +
>     >     >     +diff --git a/tools/config.guess b/tools/config.guess
>     >     >     +index da83314..445c406 100755
>     >     >     +--- a/tools/config.guess
>     >     >     ++++ b/tools/config.guess
>     >     >     +@@ -1,14 +1,12 @@
>     >     >     + #! /bin/sh
>     >     >     + # Attempt to guess a canonical system name.
>     >     >     +-#   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1=
998,
>     1999,
>     >     >     +-#   2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008
>     >     >     +-#   Free Software Foundation, Inc.
>     >     >     ++#   Copyright 1992-2018 Free Software Foundation, Inc.
>     >     >     +
>     >     >     +-timestamp=3D'2009-04-27'
>     >     >     ++timestamp=3D'2018-06-26'
>     >     >     +
>     >     >     + # This file is free software; you can redistribute it a=
nd/or
>     modify
>     >     it
>     >     >     + # under the terms of the GNU General Public License as
>     published by
>     >     >     +-# the Free Software Foundation; either version 2 of the
>     License, or
>     >     >     ++# the Free Software Foundation; either version 3 of the
>     License, or
>     >     >     + # (at your option) any later version.
>     >     >     + #
>     >     >     + # This program is distributed in the hope that it will =
be
>     useful,
>     >     but
>     >     >     +@@ -17,26 +15,22 @@ timestamp=3D'2009-04-27'
>     >     >     + # General Public License for more details.
>     >     >     + #
>     >     >     + # You should have received a copy of the GNU General Pu=
blic
>     License
>     >     >     +-# along with this program; if not, write to the Free So=
ftware
>     >     >     +-# Foundation, Inc., 51 Franklin Street - Fifth Floor, B=
oston,
>     MA
>     >     >     +-# 02110-1301, USA.
>     >     >     ++# along with this program; if not, see <https://www.gnu=
=2Eorg/
>     >     licenses/>.
>     >     >     + #
>     >     >     + # As a special exception to the GNU General Public Lice=
nse,
>     if you
>     >     >     + # distribute this file as part of a program that contai=
ns a
>     >     >     + # configuration script generated by Autoconf, you may i=
nclude
>     it
>     >     under
>     >     >     +-# the same distribution terms that you use for the rest=
 of
>     that
>     >     program.
>     >     >     +-
>     >     >     +-
>     >     >     +-# Originally written by Per Bothner <per@bothner.com>.
>     >     >     +-# Please send patches to <config-patches@gnu.org>.  Sub=
mit a
>     >     context
>     >     >     +-# diff and a properly formatted ChangeLog entry.
>     >     >     ++# the same distribution terms that you use for the rest=
 of
>     that
>     >     >     ++# program.  This Exception is an additional permission =
under
>     >     section 7
>     >     >     ++# of the GNU General Public License, version 3 ("GPLv3"=
).
>     >     >     + #
>     >     >     +-# This script attempts to guess a canonical system name
>     similar to
>     >     >     +-# config.sub.  If it succeeds, it prints the system nam=
e on
>     stdout,
>     >     and
>     >     >     +-# exits with 0.  Otherwise, it exits with 1.
>     >     >     ++# Originally written by Per Bothner; maintained since 2=
000 by
>     Ben
>     >     >     Elliston.
>     >     >     + #
>     >     >     +-# The plan is that this can be called by configure scri=
pts if
>     you
>     >     >     +-# don't specify an explicit build system type.
>     >     >     ++# You can get the latest version of this script from:
>     >     >     ++# https://git.savannah.gnu.org/gitweb/?p=3Dconfig.git;a=
=3D
>     blob_plain;f=3D
>     >     >     config.guess
>     >     >     ++#
>     >     >     ++# Please send patches to <config-patches@gnu.org>.
>     >     >     ++
>     >     >     +
>     >     >     + me=3D`echo "$0" | sed -e 's,.*/,,'`
>     >     >     +
>     >     >     +@@ -45,7 +39,7 @@ Usage: $0 [OPTION]
>     >     >     +
>     >     >     + Output the configuration name of the system \`$me' is r=
un on.
>     >     >     +
>     >     >     +-Operation modes:
>     >     >     ++Options:
>     >     >     +   -h, --help         print this help, then exit
>     >     >     +   -t, --time-stamp   print date of last modification, t=
hen
>     exit
>     >     >     +   -v, --version      print version number, then exit
>     >     >     +@@ -56,8 +50,7 @@ version=3D"\
>     >     >     + GNU config.guess ($timestamp)
>     >     >     +
>     >     >     + Originally written by Per Bothner.
>     >     >     +-Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998,=
 1999,
>     2000,
>     >     2001,
>     >     >     +-2002, 2003, 2004, 2005, 2006, 2007, 2008 Free Software
>     Foundation,
>     >     Inc.
>     >     >     ++Copyright 1992-2018 Free Software Foundation, Inc.
>     >     >     +
>     >     >     + This is free software; see the source for copying condi=
tions.
>     >     There is
>     >     >     NO
>     >     >     + warranty; not even for MERCHANTABILITY or FITNESS FOR A
>     PARTICULAR
>     >     >     PURPOSE."
>     >     >     +@@ -113,10 +106,10 @@ trap "rm -f \$tmpfiles 2>/dev/null;
>     rmdir \
>     >     $tmp 2>/
>     >     >     dev/null; exit 1" 1 2 13 15 ;
>     >     >     +  { echo "$me: cannot create a temporary directory in $T=
MPDIR"
>     >&2 ;
>     >     exit
>     >     >     1 ; } ;
>     >     >     + dummy=3D$tmp/dummy ;
>     >     >     + tmpfiles=3D"$dummy.c $dummy.o $dummy.rel $dummy" ;
>     >     >     +-case $CC_FOR_BUILD,$HOST_CC,$CC in
>     >     >     +- ,,)    echo "int x;" > $dummy.c ;
>     >     >     ++case ${CC_FOR_BUILD-},${HOST_CC-},${CC-} in
>     >     >     ++ ,,)    echo "int x;" > "$dummy.c" ;
>     >     >     +       for c in cc gcc c89 c99 ; do
>     >     >     +-        if ($c -c -o $dummy.o $dummy.c) >/dev/null 2>&1=
 ;
>     then
>     >     >     ++        if ($c -c -o "$dummy.o" "$dummy.c") >/dev/null =
2>&1 ;
>     then
>     >     >     +            CC_FOR_BUILD=3D"$c"; break ;
>     >     >     +         fi ;
>     >     >     +       done ;
>     >     >     +@@ -139,12 +132,40 @@ UNAME_RELEASE=3D`(uname -r) 2>/dev=
/null` |
>     |
>     >     >     UNAME_RELEASE=3Dunknown
>     >     >     + UNAME_SYSTEM=3D`(uname -s) 2>/dev/null`  || UNAME_SYSTE=
M=3D
>     unknown
>     >     >     + UNAME_VERSION=3D`(uname -v) 2>/dev/null` || UNAME_VERSI=
ON=3D
>     unknown
>     >     >     +
>     >     >     ++case "$UNAME_SYSTEM" in
>     >     >     ++Linux|GNU|GNU/*)
>     >     >     ++      # If the system lacks a compiler, then just pick =
glibc.
>     >     >     ++      # We could probably try harder.
>     >     >     ++      LIBC=3Dgnu
>     >     >     ++
>     >     >     ++      eval "$set_cc_for_build"
>     >     >     ++      cat <<-EOF > "$dummy.c"
>     >     >     ++      #include <features.h>
>     >     >     ++      #if defined(__UCLIBC__)
>     >     >     ++      LIBC=3Duclibc
>     >     >     ++      #elif defined(__dietlibc__)
>     >     >     ++      LIBC=3Ddietlibc
>     >     >     ++      #else
>     >     >     ++      LIBC=3Dgnu
>     >     >     ++      #endif
>     >     >     ++      EOF
>     >     >     ++      eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | =
grep '
>     ^LIBC'
>     >     | sed
>     >     >     's, ,,g'`"
>     >     >     ++
>     >     >     ++      # If ldd exists, use it to detect musl libc.
>     >     >     ++      if command -v ldd >/dev/null && \
>     >     >     ++              ldd --version 2>&1 | grep -q ^musl
>     >     >     ++      then
>     >     >     ++          LIBC=3Dmusl
>     >     >     ++      fi
>     >     >     ++      ;;
>     >     >     ++esac
>     >     >     ++
>     >     >     + # Note: order is significant - the case branches are not
>     exclusive.
>     >     >     +
>     >     >     +-case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}=
:$
>     >     {UNAME_VERSION}"
>     >     >     in
>     >     >     ++case
>     "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION"
>     >     in
>     >     >     +     *:NetBSD:*:*)
>     >     >     +       # NetBSD (nbsd) targets should (where applicable)=
 match
>     one
>     >     or
>     >     >     +-      # more of the tupples: *-*-netbsdelf*, *-*-netbsd=
aout*,
>     >     >     ++      # more of the tuples: *-*-netbsdelf*, *-*-netbsda=
out*,
>     >     >     +       # *-*-netbsdecoff* and *-*-netbsd*.  For targets =
that
>     >     recently
>     >     >     +       # switched to ELF, *-*-netbsd* would select the o=
ld
>     >     >     +       # object file format.  This provides both forward
>     >     >     +@@ -154,23 +175,33 @@ case "${UNAME_MACHINE}:${UNAME_SYS=
TEM}:$
>     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     +       # Note: NetBSD doesn't particularly care about the
>     vendor
>     >     >     +       # portion of the name.  We always set it to "unkn=
own".
>     >     >     +       sysctl=3D"sysctl -n hw.machine_arch"
>     >     >     +-      UNAME_MACHINE_ARCH=3D`(/sbin/$sysctl 2>/dev/null =
|| \
>     >     >     +-          /usr/sbin/$sysctl 2>/dev/null || echo unknown=
)`
>     >     >     +-      case "${UNAME_MACHINE_ARCH}" in
>     >     >     ++      UNAME_MACHINE_ARCH=3D`(uname -p 2>/dev/null || \
>     >     >     ++          "/sbin/$sysctl" 2>/dev/null || \
>     >     >     ++          "/usr/sbin/$sysctl" 2>/dev/null || \
>     >     >     ++          echo unknown)`
>     >     >     ++      case "$UNAME_MACHINE_ARCH" in
>     >     >     +           armeb) machine=3Darmeb-unknown ;;
>     >     >     +           arm*) machine=3Darm-unknown ;;
>     >     >     +           sh3el) machine=3Dshl-unknown ;;
>     >     >     +           sh3eb) machine=3Dsh-unknown ;;
>     >     >     +           sh5el) machine=3Dsh5le-unknown ;;
>     >     >     +-          *) machine=3D${UNAME_MACHINE_ARCH}-unknown ;;
>     >     >     ++          earmv*)
>     >     >     ++              arch=3D`echo "$UNAME_MACHINE_ARCH" | sed =
-e 's,^e
>     \(armv
>     >     [0-9]
>     >     >     \).*$,\1,'`
>     >     >     ++              endian=3D`echo "$UNAME_MACHINE_ARCH" | se=
d -ne
>     's,^.*\
>     >     (eb\)$,
>     >     >     \1,p'`
>     >     >     ++              machine=3D"${arch}${endian}"-unknown
>     >     >     ++              ;;
>     >     >     ++          *) machine=3D"$UNAME_MACHINE_ARCH"-unknown ;;
>     >     >     +       esac
>     >     >     +       # The Operating System including object format, i=
f it
>     has
>     >     switched
>     >     >     +-      # to ELF recently, or will in the future.
>     >     >     +-      case "${UNAME_MACHINE_ARCH}" in
>     >     >     ++      # to ELF recently (or will in the future) and ABI.
>     >     >     ++      case "$UNAME_MACHINE_ARCH" in
>     >     >     ++          earm*)
>     >     >     ++              os=3Dnetbsdelf
>     >     >     ++              ;;
>     >     >     +           arm*|i386|m68k|ns32k|sh3*|sparc|vax)
>     >     >     +-              eval $set_cc_for_build
>     >     >     ++              eval "$set_cc_for_build"
>     >     >     +               if echo __ELF__ | $CC_FOR_BUILD -E - 2>/d=
ev/
>     null \
>     >     >     +-                      | grep __ELF__ >/dev/null
>     >     >     ++                      | grep -q __ELF__
>     >     >     +               then
>     >     >     +                   # Once all utilities can be ECOFF
>     (netbsdecoff)
>     >     or
>     >     >     a.out (netbsdaout).
>     >     >     +                   # Return netbsd for either.  FIX?
>     >     >     +@@ -180,7 +211,14 @@ case "${UNAME_MACHINE}:${UNAME_SYST=
EM}:$
>     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     +               fi
>     >     >     +               ;;
>     >     >     +           *)
>     >     >     +-              os=3Dnetbsd
>     >     >     ++              os=3Dnetbsd
>     >     >     ++              ;;
>     >     >     ++      esac
>     >     >     ++      # Determine ABI tags.
>     >     >     ++      case "$UNAME_MACHINE_ARCH" in
>     >     >     ++          earm*)
>     >     >     ++              expr=3D's/^earmv[0-9]/-eabi/;s/eb$//'
>     >     >     ++              abi=3D`echo "$UNAME_MACHINE_ARCH" | sed -e
>     "$expr"`
>     >     >     +               ;;
>     >     >     +       esac
>     >     >     +       # The OS release
>     >     >     +@@ -188,42 +226,62 @@ case "${UNAME_MACHINE}:${UNAME_SYS=
TEM}:$
>     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     +       # thus, need a distinct triplet. However, they do=
 not
>     need
>     >     >     +       # kernel version information, so it can be replac=
ed
>     with a
>     >     >     +       # suitable tag, in the style of linux-gnu.
>     >     >     +-      case "${UNAME_VERSION}" in
>     >     >     ++      case "$UNAME_VERSION" in
>     >     >     +           Debian*)
>     >     >     +               release=3D'-gnu'
>     >     >     +               ;;
>     >     >     +           *)
>     >     >     +-              release=3D`echo ${UNAME_RELEASE}|sed -e '=
s/[-_].*
>     /\./'`
>     >     >     ++              release=3D`echo "$UNAME_RELEASE" | sed -e=
 's/
>     [-_].*//'
>     >     | cut
>     >     >     -d. -f1,2`
>     >     >     +               ;;
>     >     >     +       esac
>     >     >     +       # Since CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SY=
STEM:
>     >     >     +       # contains redundant information, the shorter for=
m:
>     >     >     +       # CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM is used.
>     >     >     +-      echo "${machine}-${os}${release}"
>     >     >     ++      echo "$machine-${os}${release}${abi-}"
>     >     >     ++      exit ;;
>     >     >     ++    *:Bitrig:*:*)
>     >     >     ++      UNAME_MACHINE_ARCH=3D`arch | sed 's/Bitrig.//'`
>     >     >     ++      echo
>     "$UNAME_MACHINE_ARCH"-unknown-bitrig"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     *:OpenBSD:*:*)
>     >     >     +       UNAME_MACHINE_ARCH=3D`arch | sed 's/OpenBSD.//'`
>     >     >     +-      echo ${UNAME_MACHINE_ARCH}-unknown-openbsd$
>     {UNAME_RELEASE}
>     >     >     ++      echo
>     "$UNAME_MACHINE_ARCH"-unknown-openbsd"$UNAME_RELEASE"
>     >     >     ++      exit ;;
>     >     >     ++    *:LibertyBSD:*:*)
>     >     >     ++      UNAME_MACHINE_ARCH=3D`arch | sed 's/^.*BSD\.//'`
>     >     >     ++      echo
>     "$UNAME_MACHINE_ARCH"-unknown-libertybsd"$UNAME_RELEASE"
>     >     >     ++      exit ;;
>     >     >     ++    *:MidnightBSD:*:*)
>     >     >     ++      echo
>     "$UNAME_MACHINE"-unknown-midnightbsd"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     *:ekkoBSD:*:*)
>     >     >     +-      echo ${UNAME_MACHINE}-unknown-ekkobsd${UNAME_RELE=
ASE}
>     >     >     ++      echo "$UNAME_MACHINE"-unknown-ekkobsd"$UNAME_RELE=
ASE"
>     >     >     +       exit ;;
>     >     >     +     *:SolidBSD:*:*)
>     >     >     +-      echo ${UNAME_MACHINE}-unknown-solidbsd${UNAME_REL=
EASE}
>     >     >     ++      echo "$UNAME_MACHINE"-unknown-solidbsd"$UNAME_REL=
EASE"
>     >     >     +       exit ;;
>     >     >     +     macppc:MirBSD:*:*)
>     >     >     +-      echo powerpc-unknown-mirbsd${UNAME_RELEASE}
>     >     >     ++      echo powerpc-unknown-mirbsd"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     *:MirBSD:*:*)
>     >     >     +-      echo ${UNAME_MACHINE}-unknown-mirbsd${UNAME_RELEA=
SE}
>     >     >     ++      echo "$UNAME_MACHINE"-unknown-mirbsd"$UNAME_RELEA=
SE"
>     >     >     +       exit ;;
>     >     >     ++    *:Sortix:*:*)
>     >     >     ++      echo "$UNAME_MACHINE"-unknown-sortix
>     >     >     ++      exit ;;
>     >     >     ++    *:Redox:*:*)
>     >     >     ++      echo "$UNAME_MACHINE"-unknown-redox
>     >     >     ++      exit ;;
>     >     >     ++    mips:OSF1:*.*)
>     >     >     ++        echo mips-dec-osf1
>     >     >     ++        exit ;;
>     >     >     +     alpha:OSF1:*:*)
>     >     >     +       case $UNAME_RELEASE in
>     >     >     +       *4.0)
>     >     >     +               UNAME_RELEASE=3D`/usr/sbin/sizer -v | awk=
 '{print
>     $3}'`
>     >     >     +               ;;
>     >     >     +       *5.*)
>     >     >     +-              UNAME_RELEASE=3D`/usr/sbin/sizer -v | awk=
 '{print
>     $4}'`
>     >     >     ++              UNAME_RELEASE=3D`/usr/sbin/sizer -v | awk=
 '{print
>     $4}'`
>     >     >     +               ;;
>     >     >     +       esac
>     >     >     +       # According to Compaq, /usr/sbin/psrinfo has been
>     available
>     >     on
>     >     >     +@@ -233,60 +291,54 @@ case "${UNAME_MACHINE}:${UNAME_SYS=
TEM}:$
>     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     +       ALPHA_CPU_TYPE=3D`/usr/sbin/psrinfo -v | sed -n -=
e 's/^=20
>     The
>     >     alpha \
>     >     >     (.*\) processor.*$/\1/p' | head -n 1`
>     >     >     +       case "$ALPHA_CPU_TYPE" in
>     >     >     +           "EV4 (21064)")
>     >     >     +-              UNAME_MACHINE=3D"alpha" ;;
>     >     >     ++              UNAME_MACHINE=3Dalpha ;;
>     >     >     +           "EV4.5 (21064)")
>     >     >     +-              UNAME_MACHINE=3D"alpha" ;;
>     >     >     ++              UNAME_MACHINE=3Dalpha ;;
>     >     >     +           "LCA4 (21066/21068)")
>     >     >     +-              UNAME_MACHINE=3D"alpha" ;;
>     >     >     ++              UNAME_MACHINE=3Dalpha ;;
>     >     >     +           "EV5 (21164)")
>     >     >     +-              UNAME_MACHINE=3D"alphaev5" ;;
>     >     >     ++              UNAME_MACHINE=3Dalphaev5 ;;
>     >     >     +           "EV5.6 (21164A)")
>     >     >     +-              UNAME_MACHINE=3D"alphaev56" ;;
>     >     >     ++              UNAME_MACHINE=3Dalphaev56 ;;
>     >     >     +           "EV5.6 (21164PC)")
>     >     >     +-              UNAME_MACHINE=3D"alphapca56" ;;
>     >     >     ++              UNAME_MACHINE=3Dalphapca56 ;;
>     >     >     +           "EV5.7 (21164PC)")
>     >     >     +-              UNAME_MACHINE=3D"alphapca57" ;;
>     >     >     ++              UNAME_MACHINE=3Dalphapca57 ;;
>     >     >     +           "EV6 (21264)")
>     >     >     +-              UNAME_MACHINE=3D"alphaev6" ;;
>     >     >     ++              UNAME_MACHINE=3Dalphaev6 ;;
>     >     >     +           "EV6.7 (21264A)")
>     >     >     +-              UNAME_MACHINE=3D"alphaev67" ;;
>     >     >     ++              UNAME_MACHINE=3Dalphaev67 ;;
>     >     >     +           "EV6.8CB (21264C)")
>     >     >     +-              UNAME_MACHINE=3D"alphaev68" ;;
>     >     >     ++              UNAME_MACHINE=3Dalphaev68 ;;
>     >     >     +           "EV6.8AL (21264B)")
>     >     >     +-              UNAME_MACHINE=3D"alphaev68" ;;
>     >     >     ++              UNAME_MACHINE=3Dalphaev68 ;;
>     >     >     +           "EV6.8CX (21264D)")
>     >     >     +-              UNAME_MACHINE=3D"alphaev68" ;;
>     >     >     ++              UNAME_MACHINE=3Dalphaev68 ;;
>     >     >     +           "EV6.9A (21264/EV69A)")
>     >     >     +-              UNAME_MACHINE=3D"alphaev69" ;;
>     >     >     ++              UNAME_MACHINE=3Dalphaev69 ;;
>     >     >     +           "EV7 (21364)")
>     >     >     +-              UNAME_MACHINE=3D"alphaev7" ;;
>     >     >     ++              UNAME_MACHINE=3Dalphaev7 ;;
>     >     >     +           "EV7.9 (21364A)")
>     >     >     +-              UNAME_MACHINE=3D"alphaev79" ;;
>     >     >     ++              UNAME_MACHINE=3Dalphaev79 ;;
>     >     >     +       esac
>     >     >     +       # A Pn.n version is a patched version.
>     >     >     +       # A Vn.n version is a released version.
>     >     >     +       # A Tn.n version is a released field test version.
>     >     >     +       # A Xn.n version is an unreleased experimental
>     baselevel.
>     >     >     +       # 1.2 uses "1.2" for uname -r.
>     >     >     +-      echo ${UNAME_MACHINE}-dec-osf`echo ${UNAME_RELEAS=
E} |
>     sed -e
>     >     's/^
>     >     >     [PVTX]//' | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
>     >     'abcdefghijklmnopqrstuvwxyz'`
>     >     >     +-      exit ;;
>     >     >     +-    Alpha\ *:Windows_NT*:*)
>     >     >     +-      # How do we know it's Interix rather than the gen=
eric
>     POSIX
>     >     >     subsystem?
>     >     >     +-      # Should we change UNAME_MACHINE based on the out=
put of
>     uname
>     >     >     instead
>     >     >     +-      # of the specific Alpha model?
>     >     >     +-      echo alpha-pc-interix
>     >     >     +-      exit ;;
>     >     >     +-    21064:Windows_NT:50:3)
>     >     >     +-      echo alpha-dec-winnt3.5
>     >     >     +-      exit ;;
>     >     >     ++      echo "$UNAME_MACHINE"-dec-osf"`echo "$UNAME_RELEA=
SE" |
>     sed -e
>     >     's/^
>     >     >     [PVTX]//' | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ
>     abcdefghijklmnopqrstuvwxyz
>     >     `"
>     >     >     ++      # Reset EXIT trap before exiting to avoid spurious
>     non-zero
>     >     exit
>     >     >     code.
>     >     >     ++      exitcode=3D$?
>     >     >     ++      trap '' 0
>     >     >     ++      exit $exitcode ;;
>     >     >     +     Amiga*:UNIX_System_V:4.0:*)
>     >     >     +       echo m68k-unknown-sysv4
>     >     >     +       exit ;;
>     >     >     +     *:[Aa]miga[Oo][Ss]:*:*)
>     >     >     +-      echo ${UNAME_MACHINE}-unknown-amigaos
>     >     >     ++      echo "$UNAME_MACHINE"-unknown-amigaos
>     >     >     +       exit ;;
>     >     >     +     *:[Mm]orph[Oo][Ss]:*:*)
>     >     >     +-      echo ${UNAME_MACHINE}-unknown-morphos
>     >     >     ++      echo "$UNAME_MACHINE"-unknown-morphos
>     >     >     +       exit ;;
>     >     >     +     *:OS/390:*:*)
>     >     >     +       echo i370-ibm-openedition
>     >     >     +@@ -295,12 +347,12 @@ case "${UNAME_MACHINE}:${UNAME_SYS=
TEM}:$
>     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     +       echo s390-ibm-zvmoe
>     >     >     +       exit ;;
>     >     >     +     *:OS400:*:*)
>     >     >     +-        echo powerpc-ibm-os400
>     >     >     ++      echo powerpc-ibm-os400
>     >     >     +       exit ;;
>     >     >     +     arm:RISC*:1.[012]*:*|arm:riscix:1.[012]*:*)
>     >     >     +-      echo arm-acorn-riscix${UNAME_RELEASE}
>     >     >     ++      echo arm-acorn-riscix"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +-    arm:riscos:*:*|arm:RISCOS:*:*)
>     >     >     ++    arm*:riscos:*:*|arm*:RISCOS:*:*)
>     >     >     +       echo arm-unknown-riscos
>     >     >     +       exit ;;
>     >     >     +     SR2?01:HI-UX/MPP:*:* | SR8000:HI-UX/MPP:*:*)
>     >     >     +@@ -325,35 +377,38 @@ case "${UNAME_MACHINE}:${UNAME_SYS=
TEM}:$
>     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     +           sparc) echo sparc-icl-nx7; exit ;;
>     >     >     +       esac ;;
>     >     >     +     s390x:SunOS:*:*)
>     >     >     +-      echo ${UNAME_MACHINE}-ibm-solaris2`echo $
>     {UNAME_RELEASE}|sed
>     >     -e 's/
>     >     >     [^.]*//'`
>     >     >     ++      echo "$UNAME_MACHINE"-ibm-solaris2"`echo
>     "$UNAME_RELEASE" |
>     >     sed -e
>     >     >     's/[^.]*//'`"
>     >     >     +       exit ;;
>     >     >     +     sun4H:SunOS:5.*:*)
>     >     >     +-      echo sparc-hal-solaris2`echo ${UNAME_RELEASE}|sed=
 -e 's
>     /[^.]*
>     >     //'`
>     >     >     ++      echo sparc-hal-solaris2"`echo "$UNAME_RELEASE"|se=
d -e
>     's/[^.]
>     >     *//'`"
>     >     >     +       exit ;;
>     >     >     +     sun4*:SunOS:5.*:* | tadpole*:SunOS:5.*:*)
>     >     >     +-      echo sparc-sun-solaris2`echo ${UNAME_RELEASE}|sed=
 -e 's
>     /[^.]*
>     >     //'`
>     >     >     ++      echo sparc-sun-solaris2"`echo "$UNAME_RELEASE" | =
sed -e
>     's/
>     >     [^.]*//'
>     >     >     `"
>     >     >     ++      exit ;;
>     >     >     ++    i86pc:AuroraUX:5.*:* | i86xen:AuroraUX:5.*:*)
>     >     >     ++      echo i386-pc-auroraux"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     i86pc:SunOS:5.*:* | i86xen:SunOS:5.*:*)
>     >     >     +-      eval $set_cc_for_build
>     >     >     +-      SUN_ARCH=3D"i386"
>     >     >     ++      eval "$set_cc_for_build"
>     >     >     ++      SUN_ARCH=3Di386
>     >     >     +       # If there is a compiler, see if it is configured=
 for
>     64-bit
>     >     >     objects.
>     >     >     +       # Note that the Sun cc does not turn __LP64__ int=
o 1
>     like gcc
>     >     does.
>     >     >     +       # This test works for both compilers.
>     >     >     +-      if [ "$CC_FOR_BUILD" !=3D 'no_compiler_found' ]; =
then
>     >     >     ++      if [ "$CC_FOR_BUILD" !=3D no_compiler_found ]; th=
en
>     >     >     +           if (echo '#ifdef __amd64'; echo IS_64BIT_ARCH=
; echo
>     '#
>     >     endif') |
>     >     >     \
>     >     >     +-              (CCOPTS=3D $CC_FOR_BUILD -E - 2>/dev/null=
) | \
>     >     >     ++              (CCOPTS=3D"" $CC_FOR_BUILD -E - 2>/dev/nu=
ll) | \
>     >     >     +               grep IS_64BIT_ARCH >/dev/null
>     >     >     +           then
>     >     >     +-              SUN_ARCH=3D"x86_64"
>     >     >     ++              SUN_ARCH=3Dx86_64
>     >     >     +           fi
>     >     >     +       fi
>     >     >     +-      echo ${SUN_ARCH}-pc-solaris2`echo ${UNAME_RELEASE=
}|sed
>     -e 's/
>     >     [^.]*/
>     >     >     /'`
>     >     >     ++      echo "$SUN_ARCH"-pc-solaris2"`echo "$UNAME_RELEAS=
E"|sed
>     -e 's
>     >     /[^.]*
>     >     >     //'`"
>     >     >     +       exit ;;
>     >     >     +     sun4*:SunOS:6*:*)
>     >     >     +       # According to config.sub, this is the proper way=
 to
>     >     canonicalize
>     >     >     +       # SunOS6.  Hard to guess exactly what SunOS6 will=
 be
>     like,
>     >     but
>     >     >     +       # it's likely to be more like Solaris than SunOS4.
>     >     >     +-      echo sparc-sun-solaris3`echo ${UNAME_RELEASE}|sed=
 -e 's
>     /[^.]*
>     >     //'`
>     >     >     ++      echo sparc-sun-solaris3"`echo "$UNAME_RELEASE"|se=
d -e
>     's/[^.]
>     >     *//'`"
>     >     >     +       exit ;;
>     >     >     +     sun4*:SunOS:*:*)
>     >     >     +       case "`/usr/bin/arch -k`" in
>     >     >     +@@ -362,25 +417,25 @@ case "${UNAME_MACHINE}:${UNAME_SYS=
TEM}:$
>     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     +               ;;
>     >     >     +       esac
>     >     >     +       # Japanese Language versions have a version numbe=
r like
>     >     `4.1.3-JL'.
>     >     >     +-      echo sparc-sun-sunos`echo ${UNAME_RELEASE}|sed -e=
 's/-/
>     _/'`
>     >     >     ++      echo sparc-sun-sunos"`echo "$UNAME_RELEASE"|sed -=
e 's/-
>     /_/'`"
>     >     >     +       exit ;;
>     >     >     +     sun3*:SunOS:*:*)
>     >     >     +-      echo m68k-sun-sunos${UNAME_RELEASE}
>     >     >     ++      echo m68k-sun-sunos"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     sun*:*:4.2BSD:*)
>     >     >     +       UNAME_RELEASE=3D`(sed 1q /etc/motd | awk '{print =
substr
>     >     ($5,1,3)}') 2>
>     >     >     /dev/null`
>     >     >     +-      test "x${UNAME_RELEASE}" =3D "x" && UNAME_RELEASE=
=3D3
>     >     >     ++      test "x$UNAME_RELEASE" =3D x && UNAME_RELEASE=3D3
>     >     >     +       case "`/bin/arch`" in
>     >     >     +           sun3)
>     >     >     +-              echo m68k-sun-sunos${UNAME_RELEASE}
>     >     >     ++              echo m68k-sun-sunos"$UNAME_RELEASE"
>     >     >     +               ;;
>     >     >     +           sun4)
>     >     >     +-              echo sparc-sun-sunos${UNAME_RELEASE}
>     >     >     ++              echo sparc-sun-sunos"$UNAME_RELEASE"
>     >     >     +               ;;
>     >     >     +       esac
>     >     >     +       exit ;;
>     >     >     +     aushp:SunOS:*:*)
>     >     >     +-      echo sparc-auspex-sunos${UNAME_RELEASE}
>     >     >     ++      echo sparc-auspex-sunos"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     # The situation for MiNT is a little confusing.  The
>     machine
>     >     name
>     >     >     +     # can be virtually everything (everything which is =
not
>     >     >     +@@ -391,44 +446,44 @@ case "${UNAME_MACHINE}:${UNAME_SYS=
TEM}:$
>     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     +     # MiNT.  But MiNT is downward compatible to TOS, so=
 this
>     should
>     >     >     +     # be no problem.
>     >     >     +     atarist[e]:*MiNT:*:* | atarist[e]:*mint:*:* | atari=
st
>     >     [e]:*TOS:*:*)
>     >     >     +-        echo m68k-atari-mint${UNAME_RELEASE}
>     >     >     ++      echo m68k-atari-mint"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     atari*:*MiNT:*:* | atari*:*mint:*:* | atarist
>     [e]:*TOS:*:*)
>     >     >     +-      echo m68k-atari-mint${UNAME_RELEASE}
>     >     >     +-        exit ;;
>     >     >     ++      echo m68k-atari-mint"$UNAME_RELEASE"
>     >     >     ++      exit ;;
>     >     >     +     *falcon*:*MiNT:*:* | *falcon*:*mint:*:* |
>     *falcon*:*TOS:*:*)
>     >     >     +-        echo m68k-atari-mint${UNAME_RELEASE}
>     >     >     ++      echo m68k-atari-mint"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     milan*:*MiNT:*:* | milan*:*mint:*:* | *milan*:*TOS:=
*:*)
>     >     >     +-        echo m68k-milan-mint${UNAME_RELEASE}
>     >     >     +-        exit ;;
>     >     >     ++      echo m68k-milan-mint"$UNAME_RELEASE"
>     >     >     ++      exit ;;
>     >     >     +     hades*:*MiNT:*:* | hades*:*mint:*:* | *hades*:*TOS:=
*:*)
>     >     >     +-        echo m68k-hades-mint${UNAME_RELEASE}
>     >     >     +-        exit ;;
>     >     >     ++      echo m68k-hades-mint"$UNAME_RELEASE"
>     >     >     ++      exit ;;
>     >     >     +     *:*MiNT:*:* | *:*mint:*:* | *:*TOS:*:*)
>     >     >     +-        echo m68k-unknown-mint${UNAME_RELEASE}
>     >     >     +-        exit ;;
>     >     >     ++      echo m68k-unknown-mint"$UNAME_RELEASE"
>     >     >     ++      exit ;;
>     >     >     +     m68k:machten:*:*)
>     >     >     +-      echo m68k-apple-machten${UNAME_RELEASE}
>     >     >     ++      echo m68k-apple-machten"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     powerpc:machten:*:*)
>     >     >     +-      echo powerpc-apple-machten${UNAME_RELEASE}
>     >     >     ++      echo powerpc-apple-machten"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     RISC*:Mach:*:*)
>     >     >     +       echo mips-dec-mach_bsd4.3
>     >     >     +       exit ;;
>     >     >     +     RISC*:ULTRIX:*:*)
>     >     >     +-      echo mips-dec-ultrix${UNAME_RELEASE}
>     >     >     ++      echo mips-dec-ultrix"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     VAX*:ULTRIX*:*:*)
>     >     >     +-      echo vax-dec-ultrix${UNAME_RELEASE}
>     >     >     ++      echo vax-dec-ultrix"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     2020:CLIX:*:* | 2430:CLIX:*:*)
>     >     >     +-      echo clipper-intergraph-clix${UNAME_RELEASE}
>     >     >     ++      echo clipper-intergraph-clix"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     mips:*:*:UMIPS | mips:*:*:RISCos)
>     >     >     +-      eval $set_cc_for_build
>     >     >     +-      sed 's/^        //' << EOF >$dummy.c
>     >     >     ++      eval "$set_cc_for_build"
>     >     >     ++      sed 's/^        //' << EOF > "$dummy.c"
>     >     >     + #ifdef __cplusplus
>     >     >     + #include <stdio.h>  /* for printf() prototype */
>     >     >     +       int main (int argc, char *argv[]) {
>     >     >     +@@ -437,23 +492,23 @@ case "${UNAME_MACHINE}:${UNAME_SYS=
TEM}:$
>     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>     >     >     + #endif
>     >     >     +       #if defined (host_mips) && defined (MIPSEB)
>     >     >     +       #if defined (SYSTYPE_SYSV)
>     >     >     +-        printf ("mips-mips-riscos%ssysv\n", argv[1]); e=
xit
>     (0);
>     >     >     ++        printf ("mips-mips-riscos%ssysv\\n", argv[1]); =
exit
>     (0);
>     >     >     +       #endif
>     >     >     +       #if defined (SYSTYPE_SVR4)
>     >     >     +-        printf ("mips-mips-riscos%ssvr4\n", argv[1]); e=
xit
>     (0);
>     >     >     ++        printf ("mips-mips-riscos%ssvr4\\n", argv[1]); =
exit
>     (0);
>     >     >     +       #endif
>     >     >     +       #if defined (SYSTYPE_BSD43) || defined(SYSTYPE_BS=
D)
>     >     >     +-        printf ("mips-mips-riscos%sbsd\n", argv[1]); ex=
it
>     (0);
>     >     >     ++        printf ("mips-mips-riscos%sbsd\\n", argv[1]); e=
xit
>     (0);
>     >     >     +       #endif
>     >     >     +       #endif
>     >     >     +         exit (-1);
>     >     >     +       }
>     >     >     + EOF
>     >     >     +-      $CC_FOR_BUILD -o $dummy $dummy.c &&
>     >     >     +-        dummyarg=3D`echo "${UNAME_RELEASE}" | sed -n 's=
/\([0-9]
>     *\).*/
>     >     \1/p'`
>     >     >     &&
>     >     >     +-        SYSTEM_NAME=3D`$dummy $dummyarg` &&
>     >     >     ++      $CC_FOR_BUILD -o "$dummy" "$dummy.c" &&
>     >     >     ++        dummyarg=3D`echo "$UNAME_RELEASE" | sed -n 's/\=
([0-9]*
>     \).*/\1
>     >     /p'` &
>     >     >     &
>     >     >     ++        SYSTEM_NAME=3D`"$dummy" "$dummyarg"` &&
>     >     >     +           { echo "$SYSTEM_NAME"; exit; }
>     >     >     +-      echo mips-mips-riscos${UNAME_RELEASE}
>     >     >     ++      echo mips-mips-riscos"$UNAME_RELEASE"
>     >     >     +       exit ;;
>     >     >     +     Motorola:PowerMAX_OS:*:*)
>     >     >     +       echo powerpc-motorola-powermax
>     >     >     +@@ -477,21 +532,21 @@ EOF
>     >     >     +       echo m88k-motorola-sysv3
>     >     >     +       exit ;;
>     >     >     +     AViiON:dgux:*:*)
>     >     >     +-        # DG/UX returns AViiON for all architectures
>     >     >     +-        UNAME_PROCESSOR=3D`/usr/bin/uname -p`
>     >     >     +-      if [ $UNAME_PROCESSOR =3D mc88100 ] || [ $UNAME_P=
ROCESSOR
>     =3D
>     >     mc88110 ]
>     >     >     ++      # DG/UX returns AViiON for all architectures
>     >     >     ++      UNAME_PROCESSOR=3D`/usr/bin/uname -p`
>     >     >     ++      if [ "$UNAME_PROCESSOR" =3D mc88100 ] || [
>     "$UNAME_PROCESSOR" =3D
>     >     >     mc88110 ]
>     >     >     +       then
>     >     >     +-          if [ ${TARGET_BINARY_INTERFACE}x =3D m88kdgux=
elfx ] |
>     | \
>     >     >     +-             [ ${TARGET_BINARY_INTERFACE}x =3D x ]
>     >     >     ++          if [ "$TARGET_BINARY_INTERFACE"x =3D m88kdgux=
elfx ] |
>     | \
>     >     >     ++             [ "$TARGET_BINARY_INTERFACE"x =3D x ]
>     >     >     +           then
>     >     >     +-              echo m88k-dg-dgux${UNAME_RELEASE}
>     >     >     ++              echo m88k-dg-dgux"$UNAME_RELEASE"
>     >     >     +           else
>     >     >     +-              echo m88k-dg-dguxbcs${UNAME_RELEASE}
>     >     >     ++              echo m88k-dg-dguxbcs"$UNAME_RELEASE"
>     >     >     +           fi
>     >     >     +       else
>     >     >     +-          echo i586-dg-dgux${UNAME_RELEASE}
>     >     >     ++          echo i586-dg-dgux"$UNAME_RELEASE"
>     >     >     +       fi
>     >     >     +-      exit ;;
>     >     >     ++      exit ;;
>     >     >     +     M88*:DolphinOS:*:*)       # DolphinOS (SVR3)
>     >     >     +       echo m88k-dolphin-sysv3
>     >     >     +       exit ;;
>     >     >     +@@ -506,7 +561,7 @@ EOF
>     >     >     +       echo m68k-tektronix-bsd
>     >     >     +       exit ;;
>     >     >     +     *:IRIX*:*:*)
>     >     >     +-      echo mips-sgi-irix`echo ${UNAME_RELEASE}|sed -e '=
s/-/_/
>     g'`
>     >     >     ++      echo mips-sgi-irix"`echo "$UNAME_RELEASE"|sed -e =
's/-/_
>     /g'`"
>     >     >     +       exit ;;
>     >     >     +     ????????:AIX?:[12].1:2)   # AIX 2.2.1 or AIX 2.1.1 =
is RT/
>     PC
>     >     AIX.
>     >     >     +       echo romp-ibm-aix     # uname -m gives an 8 hex-c=
ode
>     CPU id
>     >     >     +@@ -518,14 +573,14 @@ EOF
>     >     >     +       if [ -x /usr/bin/oslevel ] ; then
>     >     >     +               IBM_REV=3D`/usr/bin/oslevel`
>     >     >     +       else
>     >     >     +-              IBM_REV=3D${UNAME_VERSION}.${UNAME_RELEAS=
E}
>     >     >     ++              IBM_REV=3D"$UNAME_VERSION.$UNAME_RELEASE"
>     >     >     +       fi
>     >     >     +-      echo ${UNAME_MACHINE}-ibm-aix${IBM_REV}
>     >     >     ++      echo "$UNAME_MACHINE"-ibm-aix"$IBM_REV"
>     >     >     +       exit ;;
>     >     >     +     *:AIX:2:3)
>     >     >     +       if grep bos325 /usr/include/stdio.h >/dev/null 2>=
&1;
>     then
>     >     >     +-              eval $set_cc_for_build
>     >     >     +-              sed 's/^                //' << EOF >$dumm=
y.c
>     >     >     ++              eval "$set_cc_for_build"
>     >     >     ++              sed 's/^                //' << EOF > "$du=
mmy.c"
>     >     >     +               #include <sys/systemcfg.h>
>     >     >     +
>     >     >     +               main()
>     >     >     +@@ -536,7 +591,7 @@ EOF
>     >     >     +                       exit(0);
>     >     >     +                       }
>     >     >     + EOF
>     >     >     +-              if $CC_FOR_BUILD -o $dummy $dummy.c &&
>     SYSTEM_NAME=3D
>     >     `$dummy`
>     >     >     ++              if $CC_FOR_BUILD -o "$dummy" "$dummy.c" &&
>     >     SYSTEM_NAME=3D
>     >     >     `"$dummy"`
>     >     >     +               then
>     >     >     +                       echo "$SYSTEM_NAME"
>     >     >     +               else
>     >     >     +@@ -548,28 +603,29 @@ EOF
>     >     >     +               echo rs6000-ibm-aix3.2
>     >     >     +       fi
>     >     >     +       exit ;;
>     >     >     +-    *:AIX:*:[456])
>     >     >     ++    *:AIX:*:[4567])
>     >     >     +       IBM_CPU_ID=3D`/usr/sbin/lsdev -C -c processor -S
>     available |
>     >     sed 1q |
>     >     >     awk '{ print $1 }'`
>     >     >     +-      if /usr/sbin/lsattr -El ${IBM_CPU_ID} | grep ' PO=
WER' >
>     /dev/
>     >     null 2>
>     >     >     &1; then
>     >     >     ++      if /usr/sbin/lsattr -El "$IBM_CPU_ID" | grep ' PO=
WER' >
>     /dev/
>     >     null 2>
>     >     >     &1; then
>     >     >     +               IBM_ARCH=3Drs6000
>     >     >     +       else
>     >     >     +               IBM_ARCH=3Dpowerpc
>     >     >     +       fi
>     >     >     +-      if [ -x /usr/bin/oslevel ] ; then
>     >     >     +-              IBM_REV=3D`/usr/bin/oslevel`
>     >     >     ++      if [ -x /usr/bin/lslpp ] ; then
>     >     >     ++              IBM_REV=3D`/usr/bin/lslpp -Lqc bos.rte.li=
bc |
>     >     >     ++                         awk -F: '{ print $3 }' | sed s=
/[0-9]
>     *$/0/`
>     >     >     +       else
>     >     >     +-              IBM_REV=3D${UNAME_VERSION}.${UNAME_RELEAS=
E}
>     >     >     ++              IBM_REV=3D"$UNAME_VERSION.$UNAME_RELEASE"
>     >     >     +       fi
>     >     >     +-      echo ${IBM_ARCH}-ibm-aix${IBM_REV}
>     >     >     ++      echo "$IBM_ARCH"-ibm-aix"$IBM_REV"
>     >     >     +       exit ;;
>     >     >     +     *:AIX:*:*)
>     >     >     +       echo rs6000-ibm-aix
>     >     >     +       exit ;;
>     >     >     +-    ibmrt:4.4BSD:*|romp-ibm:BSD:*)
>     >     >     ++    ibmrt:4.4BSD:*|romp-ibm:4.4BSD:*)
>     >     >     +       echo romp-ibm-bsd4.4
>     >     >     +       exit ;;
>     >     >     +     ibmrt:*BSD:*|romp-ibm:BSD:*)            # covers RT=
/PC
>     BSD and
>     >     >     +-      echo romp-ibm-bsd${UNAME_RELEASE}   # 4.3 with un=
ame
>     added to
>     >     >     ++      echo romp-ibm-bsd"$UNAME_RELEASE"   # 4.3 with un=
ame
>     added to
>     >     >     +       exit ;;                             # report: rom=
p-ibm
>     BSD
>     >     4.3
>     >     >     +     *:BOSX:*:*)
>     >     >     +       echo rs6000-bull-bosx
>     >     >     +@@ -584,67 +640,67 @@ EOF
>     >     >     +       echo m68k-hp-bsd4.4
>     >     >     +       exit ;;
>     >     >     +     9000/[34678]??:HP-UX:*:*)
>     >     >     +-      HPUX_REV=3D`echo ${UNAME_RELEASE}|sed -e 's/[^.]*=
=2E[0B]*//
>     '`
>     >     >     +-      case "${UNAME_MACHINE}" in
>     >     >     +-          9000/31? )            HP_ARCH=3Dm68000 ;;
>     >     >     +-          9000/[34]?? )         HP_ARCH=3Dm68k ;;
>     >     >     ++      HPUX_REV=3D`echo "$UNAME_RELEASE"|sed -e 's/[^.]*=
=2E[0B]*//
>     '`
>     >     >     ++      case "$UNAME_MACHINE" in
>     >     >     ++          9000/31?)            HP_ARCH=3Dm68000 ;;
>     >     >     ++          9000/[34]??)         HP_ARCH=3Dm68k ;;
>     >     >     +           9000/[678][0-9][0-9])
>     >     >     +               if [ -x /usr/bin/getconf ]; then
>     >     >     +                   sc_cpu_version=3D`/usr/bin/getconf
>     SC_CPU_VERSION
>     >     2>/dev/
>     >     >     null`
>     >     >     +-                    sc_kernel_bits=3D`/usr/bin/getconf
>     SC_KERNEL_BITS
>     >     2>/
>     >     >     dev/null`
>     >     >     +-                    case "${sc_cpu_version}" in
>     >     >     +-                      523) HP_ARCH=3D"hppa1.0" ;; #
>     CPU_PA_RISC1_0
>     >     >     +-                      528) HP_ARCH=3D"hppa1.1" ;; #
>     CPU_PA_RISC1_1
>     >     >     +-                      532)                      #
>     CPU_PA_RISC2_0
>     >     >     +-                        case "${sc_kernel_bits}" in
>     >     >     +-                          32) HP_ARCH=3D"hppa2.0n" ;;
>     >     >     +-                          64) HP_ARCH=3D"hppa2.0w" ;;
>     >     >     +-                        '') HP_ARCH=3D"hppa2.0" ;;   # =
HP-UX
>     10.20
>     >     >     +-                        esac ;;
>     >     >     +-                    esac
>     >     >     ++                  sc_kernel_bits=3D`/usr/bin/getconf
>     SC_KERNEL_BITS
>     >     2>/dev/
>     >     >     null`
>     >     >     ++                  case "$sc_cpu_version" in
>     >     >     ++                    523) HP_ARCH=3Dhppa1.0 ;; # CPU_PA_=
RISC1_0
>     >     >  =20
>=20

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlt2JXUACgkQSfx99yw5
9pbR3wf/Q+B25sAkjFYxj78bixDNt9qbGR7q0kPf9DnfYScOXWgH5SFdSMU7ldRH
RLt9eNwO7jZgT3+x1dzLgqG/9/6pOEAvzI3zQZ+CEKwQTHRt8vH4rZjacWEj5mdE
rjg3a+snk4W+OVpUpqZTCFnmVAYXTDV/w9hQTm9QQiXycN+CyvpREAedpmAgr8+k
974sl1oXc+HX6mELrKrIzwB6BiHglJLDmQEQVGHrt0pRixNs8A6VUYXIZbEu4TGS
vV0OWcjLwk3JSmJX4LTnP/v731TArJWNe1B2YOQhbkwr8yAA1h85eUHxpWmKbh+r
3lGPysv6SH3DfsYvpKcodxMZIufscQ==
=UWrc
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
