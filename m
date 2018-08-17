Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A5FBE7915E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 21:05:10 +0000 (UTC)
Received: from svr-orw-mbx-07.mgc.mentorg.com ([147.34.90.207])
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1fqlvj-0007PK-EG from Joe_MacDonald@mentor.com ;
	Fri, 17 Aug 2018 14:05:11 -0700
Received: from svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) by
	SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Fri, 17 Aug 2018 14:05:08 -0700
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) with Microsoft SMTP
	Server id
	15.0.1320.4 via Frontend Transport; Fri, 17 Aug 2018 14:05:07 -0700
Received: by burninator.cal.mentorg.com (Postfix, from userid 5844)
	id 7574E28A2431; Fri, 17 Aug 2018 17:05:06 -0400 (EDT)
Date: Fri, 17 Aug 2018 17:05:02 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180817210501.GA1452@mentor.com>
References: <20180817175227.16888-1-joe_macdonald@mentor.com>
	<CAMKF1soe5FGEq6Y0J8D5qW2=8A+dZ0NV4AgtXG3D1=+=16DZ2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soe5FGEq6Y0J8D5qW2=8A+dZ0NV4AgtXG3D1=+=16DZ2Q@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan BOSAK <stefan.bosak@gmail.com>
Subject: Re: [meta-networking][PATCH v3] bird: initial import
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
X-List-Received-Date: Fri, 17 Aug 2018 21:05:10 -0000
X-Groupsio-MsgNum: 74027
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH v3] bird: initial import] On 18.08.17 (Fr=
i 11:25) Khem Raj wrote:

> On Fri, Aug 17, 2018 at 10:52 AM Joe MacDonald <joe_macdonald@mentor.com>=
 wrote:
> >
> > Initial integration of the two stable BIRD releases, 1.6.4 and 2.0.2.
> >
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
> >
> > v3:
> >    - Dropped the v2.0.x series recipe due to issues building IPv6 clien=
t and
> >      server
> >
> >    - Reworked v1.6.4 to remove the now-unnecessary .inc file
> >
> >    - Added support for building ipv4 and ipv6 clients and servers in a =
single
> >      package
> >
> >    - Cleaned up variable usage in the recipe
> >
> >    - Included full-featured init script
> >
>=20
> perhaps it will be good to have a systemd script too while you are here.

I didn't want to do that since that'd be just further mixing the initial
recipe as submitted by Stefan with new development from me, though (I
hope) obviously that was the next step I'd planned for this.  At least
the sysvinit files are present in the original tree, a systemd unit file
is brand new.

> >  .../recipes-protocols/bird/bird_1.6.4.bb      |   70 +
> >  ...-extend-config.sub-to-recognize-musl.patch | 4430 +++++++++++++++++
> >  .../recipes-protocols/bird/files/bird.init    |   97 +
> >  3 files changed, 4597 insertions(+)
> >  create mode 100644 meta-networking/recipes-protocols/bird/bird_1.6.4.bb
> >  create mode 100644 meta-networking/recipes-protocols/bird/files/0001-m=
usl-extend-config.sub-to-recognize-musl.patch
> >  create mode 100644 meta-networking/recipes-protocols/bird/files/bird.i=
nit
> >
> > diff --git a/meta-networking/recipes-protocols/bird/bird_1.6.4.bb b/met=
a-networking/recipes-protocols/bird/bird_1.6.4.bb
> > new file mode 100644
> > index 000000000..90c4e02ae
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/bird/bird_1.6.4.bb
> > @@ -0,0 +1,70 @@
> > +SUMMARY =3D "BIRD Internet Routing Daemon"
> > +DESCRIPTION =3D "\
> > +BIRD is dynamic routing daemon supporting IPv4 and IPv6 versions of ro=
uting \
> > +protocols BGP, RIP and OSPF."
> > +HOMEPAGE =3D "http://bird.network.cz"
> > +SECTION =3D "console/network"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://README;beginline=3D87;endline=3D103;md5=
=3D0efecc23f039022580d0bac9a52f6117"
> > +DEPENDS =3D "flex-native bison-native ncurses readline"
> > +
> > +inherit autotools
> > +
> > +SRC_URI =3D "\
> > +    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}.tar.gz \
> > +    file://bird.init \
> > +    file://0001-musl-extend-config.sub-to-recognize-musl.patch \
> > +    "
> > +SRC_URI[md5sum] =3D "d62ec2547338e8d3dfb934b4c7b2faa4"
> > +SRC_URI[sha256sum] =3D "c26b8caae988dba81a9dbbee93502463d4326d1b749d72=
8d62aa5529c605afc0"
> > +
> > +EXTRA_OECONF  +=3D "\
> > +    --enable-pthreads \
> > +"
> > +
> > +do_configure() {
> > +
> > +    # IPv4 build
> > +    rm -fr  ${WORKDIR}/build-ipv4
> > +    mkdir -p ${B}
> > +    cd ${B}
> > +    oe_runconf ${EXTRA_OECONF}
> > +    mv ${B} ${WORKDIR}/build-ipv4
> > +
> > +    # IPv6 build
> > +    rm -fr  ${WORKDIR}/build-ipv6
> > +    mkdir -p ${B}
> > +    cd ${B}
> > +    oe_runconf ${EXTRA_OECONF} --enable-ipv6
>=20
> ipv6 is a distro feature as well. probably make it conditional upon
> that would be nice.

Yeah, that's doable.

> and this recipe tells me that ipv6 version probably should be an
> separate recipe.

Based on the comments from Stefan and from the content of the init
script, I don't think that makes sense in this case.

-J.

> > +    mv ${B} ${WORKDIR}/build-ipv6
> > +
> > +}
> > +
> > +do_compile() {
> > +
> > +    for ver in ipv4 ipv6; do
> > +        cd ${WORKDIR}/build-$ver
> > +        oe_runmake
> > +    done
> > +
> > +}
> > +
> > +do_install() {
> > +    for ver in ipv4 ipv6; do
> > +        cd ${WORKDIR}/build-$ver
> > +        oe_runmake 'DESTDIR=3D${D}' install
> > +    done
> > +    install -d ${D}${sysconfdir}/init.d
> > +    install -m 0755 ${WORKDIR}/bird.init ${D}${sysconfdir}/init.d/bird
> > +    if [ -d ${D}/run ]; then
> > +        rmdir ${D}/run
> > +    fi
> > +    if [ -d ${D}${localstatedir}/run ]; then
> > +        rmdir ${D}${localstatedir}/run
> > +    fi
> > +}
> > +
> > +PACKAGES =3D+ "bird-client"
> > +FILES_bird-client =3D "${sbindir}/birdc*"
> > +
> > +RUNIT_SERVICES =3D "bird"
>=20
> I guess this is not needed we dont have runit support
>=20
> > diff --git a/meta-networking/recipes-protocols/bird/files/0001-musl-ext=
end-config.sub-to-recognize-musl.patch b/meta-networking/recipes-protocols/=
bird/files/0001-musl-extend-config.sub-to-recognize-musl.patch
> > new file mode 100644
> > index 000000000..578f9b6f0
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/bird/files/0001-musl-extend-con=
fig.sub-to-recognize-musl.patch
> > @@ -0,0 +1,4430 @@
> > +From 21baaa6870edb68f0a417ea3b4de5c75e5cf5a0d Mon Sep 17 00:00:00 2001
> > +From: Joe MacDonald <joe_macdonald@mentor.com>
> > +Date: Thu, 16 Aug 2018 01:56:05 +0000
> > +Subject: [PATCH] musl: update config.guess and config.sub
> > +
> > +Just bringing config.guess and config.sub up to date is enough to enab=
le
> > +musl to build BIRD.
> > +
> > +Upstream-Status: Backport [https://gitlab.labs.nic.cz/labs/bird/commit=
/822a7ee6d5cd9bf38548026e0dd52fbc4634030d]
> > +
> > +Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > +---
> > + tools/config.guess | 1193 ++++++++++++++---------------
> > + tools/config.sub   | 1810 +++++++++++++++++++++++---------------------
> > + 2 files changed, 1520 insertions(+), 1483 deletions(-)
> > +
> > +diff --git a/tools/config.guess b/tools/config.guess
> > +index da83314..445c406 100755
> > +--- a/tools/config.guess
> > ++++ b/tools/config.guess
> > +@@ -1,14 +1,12 @@
> > + #! /bin/sh
> > + # Attempt to guess a canonical system name.
> > +-#   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
> > +-#   2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008
> > +-#   Free Software Foundation, Inc.
> > ++#   Copyright 1992-2018 Free Software Foundation, Inc.
> > +
> > +-timestamp=3D'2009-04-27'
> > ++timestamp=3D'2018-06-26'
> > +
> > + # This file is free software; you can redistribute it and/or modify it
> > + # under the terms of the GNU General Public License as published by
> > +-# the Free Software Foundation; either version 2 of the License, or
> > ++# the Free Software Foundation; either version 3 of the License, or
> > + # (at your option) any later version.
> > + #
> > + # This program is distributed in the hope that it will be useful, but
> > +@@ -17,26 +15,22 @@ timestamp=3D'2009-04-27'
> > + # General Public License for more details.
> > + #
> > + # You should have received a copy of the GNU General Public License
> > +-# along with this program; if not, write to the Free Software
> > +-# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA
> > +-# 02110-1301, USA.
> > ++# along with this program; if not, see <https://www.gnu.org/licenses/=
>.
> > + #
> > + # As a special exception to the GNU General Public License, if you
> > + # distribute this file as part of a program that contains a
> > + # configuration script generated by Autoconf, you may include it under
> > +-# the same distribution terms that you use for the rest of that progr=
am.
> > +-
> > +-
> > +-# Originally written by Per Bothner <per@bothner.com>.
> > +-# Please send patches to <config-patches@gnu.org>.  Submit a context
> > +-# diff and a properly formatted ChangeLog entry.
> > ++# the same distribution terms that you use for the rest of that
> > ++# program.  This Exception is an additional permission under section 7
> > ++# of the GNU General Public License, version 3 ("GPLv3").
> > + #
> > +-# This script attempts to guess a canonical system name similar to
> > +-# config.sub.  If it succeeds, it prints the system name on stdout, a=
nd
> > +-# exits with 0.  Otherwise, it exits with 1.
> > ++# Originally written by Per Bothner; maintained since 2000 by Ben Ell=
iston.
> > + #
> > +-# The plan is that this can be called by configure scripts if you
> > +-# don't specify an explicit build system type.
> > ++# You can get the latest version of this script from:
> > ++# https://git.savannah.gnu.org/gitweb/?p=3Dconfig.git;a=3Dblob_plain;=
f=3Dconfig.guess
> > ++#
> > ++# Please send patches to <config-patches@gnu.org>.
> > ++
> > +
> > + me=3D`echo "$0" | sed -e 's,.*/,,'`
> > +
> > +@@ -45,7 +39,7 @@ Usage: $0 [OPTION]
> > +
> > + Output the configuration name of the system \`$me' is run on.
> > +
> > +-Operation modes:
> > ++Options:
> > +   -h, --help         print this help, then exit
> > +   -t, --time-stamp   print date of last modification, then exit
> > +   -v, --version      print version number, then exit
> > +@@ -56,8 +50,7 @@ version=3D"\
> > + GNU config.guess ($timestamp)
> > +
> > + Originally written by Per Bothner.
> > +-Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2=
001,
> > +-2002, 2003, 2004, 2005, 2006, 2007, 2008 Free Software Foundation, In=
c.
> > ++Copyright 1992-2018 Free Software Foundation, Inc.
> > +
> > + This is free software; see the source for copying conditions.  There =
is NO
> > + warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PU=
RPOSE."
> > +@@ -113,10 +106,10 @@ trap "rm -f \$tmpfiles 2>/dev/null; rmdir \$tmp =
2>/dev/null; exit 1" 1 2 13 15 ;
> > +  { echo "$me: cannot create a temporary directory in $TMPDIR" >&2 ; e=
xit 1 ; } ;
> > + dummy=3D$tmp/dummy ;
> > + tmpfiles=3D"$dummy.c $dummy.o $dummy.rel $dummy" ;
> > +-case $CC_FOR_BUILD,$HOST_CC,$CC in
> > +- ,,)    echo "int x;" > $dummy.c ;
> > ++case ${CC_FOR_BUILD-},${HOST_CC-},${CC-} in
> > ++ ,,)    echo "int x;" > "$dummy.c" ;
> > +       for c in cc gcc c89 c99 ; do
> > +-        if ($c -c -o $dummy.o $dummy.c) >/dev/null 2>&1 ; then
> > ++        if ($c -c -o "$dummy.o" "$dummy.c") >/dev/null 2>&1 ; then
> > +            CC_FOR_BUILD=3D"$c"; break ;
> > +         fi ;
> > +       done ;
> > +@@ -139,12 +132,40 @@ UNAME_RELEASE=3D`(uname -r) 2>/dev/null` || UNAM=
E_RELEASE=3Dunknown
> > + UNAME_SYSTEM=3D`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=3Dunknown
> > + UNAME_VERSION=3D`(uname -v) 2>/dev/null` || UNAME_VERSION=3Dunknown
> > +
> > ++case "$UNAME_SYSTEM" in
> > ++Linux|GNU|GNU/*)
> > ++      # If the system lacks a compiler, then just pick glibc.
> > ++      # We could probably try harder.
> > ++      LIBC=3Dgnu
> > ++
> > ++      eval "$set_cc_for_build"
> > ++      cat <<-EOF > "$dummy.c"
> > ++      #include <features.h>
> > ++      #if defined(__UCLIBC__)
> > ++      LIBC=3Duclibc
> > ++      #elif defined(__dietlibc__)
> > ++      LIBC=3Ddietlibc
> > ++      #else
> > ++      LIBC=3Dgnu
> > ++      #endif
> > ++      EOF
> > ++      eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^LIBC' |=
 sed 's, ,,g'`"
> > ++
> > ++      # If ldd exists, use it to detect musl libc.
> > ++      if command -v ldd >/dev/null && \
> > ++              ldd --version 2>&1 | grep -q ^musl
> > ++      then
> > ++          LIBC=3Dmusl
> > ++      fi
> > ++      ;;
> > ++esac
> > ++
> > + # Note: order is significant - the case branches are not exclusive.
> > +
> > +-case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSI=
ON}" in
> > ++case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
> > +     *:NetBSD:*:*)
> > +       # NetBSD (nbsd) targets should (where applicable) match one or
> > +-      # more of the tupples: *-*-netbsdelf*, *-*-netbsdaout*,
> > ++      # more of the tuples: *-*-netbsdelf*, *-*-netbsdaout*,
> > +       # *-*-netbsdecoff* and *-*-netbsd*.  For targets that recently
> > +       # switched to ELF, *-*-netbsd* would select the old
> > +       # object file format.  This provides both forward
> > +@@ -154,23 +175,33 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> > +       # Note: NetBSD doesn't particularly care about the vendor
> > +       # portion of the name.  We always set it to "unknown".
> > +       sysctl=3D"sysctl -n hw.machine_arch"
> > +-      UNAME_MACHINE_ARCH=3D`(/sbin/$sysctl 2>/dev/null || \
> > +-          /usr/sbin/$sysctl 2>/dev/null || echo unknown)`
> > +-      case "${UNAME_MACHINE_ARCH}" in
> > ++      UNAME_MACHINE_ARCH=3D`(uname -p 2>/dev/null || \
> > ++          "/sbin/$sysctl" 2>/dev/null || \
> > ++          "/usr/sbin/$sysctl" 2>/dev/null || \
> > ++          echo unknown)`
> > ++      case "$UNAME_MACHINE_ARCH" in
> > +           armeb) machine=3Darmeb-unknown ;;
> > +           arm*) machine=3Darm-unknown ;;
> > +           sh3el) machine=3Dshl-unknown ;;
> > +           sh3eb) machine=3Dsh-unknown ;;
> > +           sh5el) machine=3Dsh5le-unknown ;;
> > +-          *) machine=3D${UNAME_MACHINE_ARCH}-unknown ;;
> > ++          earmv*)
> > ++              arch=3D`echo "$UNAME_MACHINE_ARCH" | sed -e 's,^e\(armv=
[0-9]\).*$,\1,'`
> > ++              endian=3D`echo "$UNAME_MACHINE_ARCH" | sed -ne 's,^.*\(=
eb\)$,\1,p'`
> > ++              machine=3D"${arch}${endian}"-unknown
> > ++              ;;
> > ++          *) machine=3D"$UNAME_MACHINE_ARCH"-unknown ;;
> > +       esac
> > +       # The Operating System including object format, if it has switc=
hed
> > +-      # to ELF recently, or will in the future.
> > +-      case "${UNAME_MACHINE_ARCH}" in
> > ++      # to ELF recently (or will in the future) and ABI.
> > ++      case "$UNAME_MACHINE_ARCH" in
> > ++          earm*)
> > ++              os=3Dnetbsdelf
> > ++              ;;
> > +           arm*|i386|m68k|ns32k|sh3*|sparc|vax)
> > +-              eval $set_cc_for_build
> > ++              eval "$set_cc_for_build"
> > +               if echo __ELF__ | $CC_FOR_BUILD -E - 2>/dev/null \
> > +-                      | grep __ELF__ >/dev/null
> > ++                      | grep -q __ELF__
> > +               then
> > +                   # Once all utilities can be ECOFF (netbsdecoff) or =
a.out (netbsdaout).
> > +                   # Return netbsd for either.  FIX?
> > +@@ -180,7 +211,14 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RE=
LEASE}:${UNAME_VERSION}" in
> > +               fi
> > +               ;;
> > +           *)
> > +-              os=3Dnetbsd
> > ++              os=3Dnetbsd
> > ++              ;;
> > ++      esac
> > ++      # Determine ABI tags.
> > ++      case "$UNAME_MACHINE_ARCH" in
> > ++          earm*)
> > ++              expr=3D's/^earmv[0-9]/-eabi/;s/eb$//'
> > ++              abi=3D`echo "$UNAME_MACHINE_ARCH" | sed -e "$expr"`
> > +               ;;
> > +       esac
> > +       # The OS release
> > +@@ -188,42 +226,62 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> > +       # thus, need a distinct triplet. However, they do not need
> > +       # kernel version information, so it can be replaced with a
> > +       # suitable tag, in the style of linux-gnu.
> > +-      case "${UNAME_VERSION}" in
> > ++      case "$UNAME_VERSION" in
> > +           Debian*)
> > +               release=3D'-gnu'
> > +               ;;
> > +           *)
> > +-              release=3D`echo ${UNAME_RELEASE}|sed -e 's/[-_].*/\./'`
> > ++              release=3D`echo "$UNAME_RELEASE" | sed -e 's/[-_].*//' =
| cut -d. -f1,2`
> > +               ;;
> > +       esac
> > +       # Since CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM:
> > +       # contains redundant information, the shorter form:
> > +       # CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM is used.
> > +-      echo "${machine}-${os}${release}"
> > ++      echo "$machine-${os}${release}${abi-}"
> > ++      exit ;;
> > ++    *:Bitrig:*:*)
> > ++      UNAME_MACHINE_ARCH=3D`arch | sed 's/Bitrig.//'`
> > ++      echo "$UNAME_MACHINE_ARCH"-unknown-bitrig"$UNAME_RELEASE"
> > +       exit ;;
> > +     *:OpenBSD:*:*)
> > +       UNAME_MACHINE_ARCH=3D`arch | sed 's/OpenBSD.//'`
> > +-      echo ${UNAME_MACHINE_ARCH}-unknown-openbsd${UNAME_RELEASE}
> > ++      echo "$UNAME_MACHINE_ARCH"-unknown-openbsd"$UNAME_RELEASE"
> > ++      exit ;;
> > ++    *:LibertyBSD:*:*)
> > ++      UNAME_MACHINE_ARCH=3D`arch | sed 's/^.*BSD\.//'`
> > ++      echo "$UNAME_MACHINE_ARCH"-unknown-libertybsd"$UNAME_RELEASE"
> > ++      exit ;;
> > ++    *:MidnightBSD:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-midnightbsd"$UNAME_RELEASE"
> > +       exit ;;
> > +     *:ekkoBSD:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-ekkobsd${UNAME_RELEASE}
> > ++      echo "$UNAME_MACHINE"-unknown-ekkobsd"$UNAME_RELEASE"
> > +       exit ;;
> > +     *:SolidBSD:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-solidbsd${UNAME_RELEASE}
> > ++      echo "$UNAME_MACHINE"-unknown-solidbsd"$UNAME_RELEASE"
> > +       exit ;;
> > +     macppc:MirBSD:*:*)
> > +-      echo powerpc-unknown-mirbsd${UNAME_RELEASE}
> > ++      echo powerpc-unknown-mirbsd"$UNAME_RELEASE"
> > +       exit ;;
> > +     *:MirBSD:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-mirbsd${UNAME_RELEASE}
> > ++      echo "$UNAME_MACHINE"-unknown-mirbsd"$UNAME_RELEASE"
> > +       exit ;;
> > ++    *:Sortix:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-sortix
> > ++      exit ;;
> > ++    *:Redox:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-redox
> > ++      exit ;;
> > ++    mips:OSF1:*.*)
> > ++        echo mips-dec-osf1
> > ++        exit ;;
> > +     alpha:OSF1:*:*)
> > +       case $UNAME_RELEASE in
> > +       *4.0)
> > +               UNAME_RELEASE=3D`/usr/sbin/sizer -v | awk '{print $3}'`
> > +               ;;
> > +       *5.*)
> > +-              UNAME_RELEASE=3D`/usr/sbin/sizer -v | awk '{print $4}'`
> > ++              UNAME_RELEASE=3D`/usr/sbin/sizer -v | awk '{print $4}'`
> > +               ;;
> > +       esac
> > +       # According to Compaq, /usr/sbin/psrinfo has been available on
> > +@@ -233,60 +291,54 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> > +       ALPHA_CPU_TYPE=3D`/usr/sbin/psrinfo -v | sed -n -e 's/^  The al=
pha \(.*\) processor.*$/\1/p' | head -n 1`
> > +       case "$ALPHA_CPU_TYPE" in
> > +           "EV4 (21064)")
> > +-              UNAME_MACHINE=3D"alpha" ;;
> > ++              UNAME_MACHINE=3Dalpha ;;
> > +           "EV4.5 (21064)")
> > +-              UNAME_MACHINE=3D"alpha" ;;
> > ++              UNAME_MACHINE=3Dalpha ;;
> > +           "LCA4 (21066/21068)")
> > +-              UNAME_MACHINE=3D"alpha" ;;
> > ++              UNAME_MACHINE=3Dalpha ;;
> > +           "EV5 (21164)")
> > +-              UNAME_MACHINE=3D"alphaev5" ;;
> > ++              UNAME_MACHINE=3Dalphaev5 ;;
> > +           "EV5.6 (21164A)")
> > +-              UNAME_MACHINE=3D"alphaev56" ;;
> > ++              UNAME_MACHINE=3Dalphaev56 ;;
> > +           "EV5.6 (21164PC)")
> > +-              UNAME_MACHINE=3D"alphapca56" ;;
> > ++              UNAME_MACHINE=3Dalphapca56 ;;
> > +           "EV5.7 (21164PC)")
> > +-              UNAME_MACHINE=3D"alphapca57" ;;
> > ++              UNAME_MACHINE=3Dalphapca57 ;;
> > +           "EV6 (21264)")
> > +-              UNAME_MACHINE=3D"alphaev6" ;;
> > ++              UNAME_MACHINE=3Dalphaev6 ;;
> > +           "EV6.7 (21264A)")
> > +-              UNAME_MACHINE=3D"alphaev67" ;;
> > ++              UNAME_MACHINE=3Dalphaev67 ;;
> > +           "EV6.8CB (21264C)")
> > +-              UNAME_MACHINE=3D"alphaev68" ;;
> > ++              UNAME_MACHINE=3Dalphaev68 ;;
> > +           "EV6.8AL (21264B)")
> > +-              UNAME_MACHINE=3D"alphaev68" ;;
> > ++              UNAME_MACHINE=3Dalphaev68 ;;
> > +           "EV6.8CX (21264D)")
> > +-              UNAME_MACHINE=3D"alphaev68" ;;
> > ++              UNAME_MACHINE=3Dalphaev68 ;;
> > +           "EV6.9A (21264/EV69A)")
> > +-              UNAME_MACHINE=3D"alphaev69" ;;
> > ++              UNAME_MACHINE=3Dalphaev69 ;;
> > +           "EV7 (21364)")
> > +-              UNAME_MACHINE=3D"alphaev7" ;;
> > ++              UNAME_MACHINE=3Dalphaev7 ;;
> > +           "EV7.9 (21364A)")
> > +-              UNAME_MACHINE=3D"alphaev79" ;;
> > ++              UNAME_MACHINE=3Dalphaev79 ;;
> > +       esac
> > +       # A Pn.n version is a patched version.
> > +       # A Vn.n version is a released version.
> > +       # A Tn.n version is a released field test version.
> > +       # A Xn.n version is an unreleased experimental baselevel.
> > +       # 1.2 uses "1.2" for uname -r.
> > +-      echo ${UNAME_MACHINE}-dec-osf`echo ${UNAME_RELEASE} | sed -e 's=
/^[PVTX]//' | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'`
> > +-      exit ;;
> > +-    Alpha\ *:Windows_NT*:*)
> > +-      # How do we know it's Interix rather than the generic POSIX sub=
system?
> > +-      # Should we change UNAME_MACHINE based on the output of uname i=
nstead
> > +-      # of the specific Alpha model?
> > +-      echo alpha-pc-interix
> > +-      exit ;;
> > +-    21064:Windows_NT:50:3)
> > +-      echo alpha-dec-winnt3.5
> > +-      exit ;;
> > ++      echo "$UNAME_MACHINE"-dec-osf"`echo "$UNAME_RELEASE" | sed -e '=
s/^[PVTX]//' | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz`"
> > ++      # Reset EXIT trap before exiting to avoid spurious non-zero exi=
t code.
> > ++      exitcode=3D$?
> > ++      trap '' 0
> > ++      exit $exitcode ;;
> > +     Amiga*:UNIX_System_V:4.0:*)
> > +       echo m68k-unknown-sysv4
> > +       exit ;;
> > +     *:[Aa]miga[Oo][Ss]:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-amigaos
> > ++      echo "$UNAME_MACHINE"-unknown-amigaos
> > +       exit ;;
> > +     *:[Mm]orph[Oo][Ss]:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-morphos
> > ++      echo "$UNAME_MACHINE"-unknown-morphos
> > +       exit ;;
> > +     *:OS/390:*:*)
> > +       echo i370-ibm-openedition
> > +@@ -295,12 +347,12 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> > +       echo s390-ibm-zvmoe
> > +       exit ;;
> > +     *:OS400:*:*)
> > +-        echo powerpc-ibm-os400
> > ++      echo powerpc-ibm-os400
> > +       exit ;;
> > +     arm:RISC*:1.[012]*:*|arm:riscix:1.[012]*:*)
> > +-      echo arm-acorn-riscix${UNAME_RELEASE}
> > ++      echo arm-acorn-riscix"$UNAME_RELEASE"
> > +       exit ;;
> > +-    arm:riscos:*:*|arm:RISCOS:*:*)
> > ++    arm*:riscos:*:*|arm*:RISCOS:*:*)
> > +       echo arm-unknown-riscos
> > +       exit ;;
> > +     SR2?01:HI-UX/MPP:*:* | SR8000:HI-UX/MPP:*:*)
> > +@@ -325,35 +377,38 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> > +           sparc) echo sparc-icl-nx7; exit ;;
> > +       esac ;;
> > +     s390x:SunOS:*:*)
> > +-      echo ${UNAME_MACHINE}-ibm-solaris2`echo ${UNAME_RELEASE}|sed -e=
 's/[^.]*//'`
> > ++      echo "$UNAME_MACHINE"-ibm-solaris2"`echo "$UNAME_RELEASE" | sed=
 -e 's/[^.]*//'`"
> > +       exit ;;
> > +     sun4H:SunOS:5.*:*)
> > +-      echo sparc-hal-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//=
'`
> > ++      echo sparc-hal-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*/=
/'`"
> > +       exit ;;
> > +     sun4*:SunOS:5.*:* | tadpole*:SunOS:5.*:*)
> > +-      echo sparc-sun-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//=
'`
> > ++      echo sparc-sun-solaris2"`echo "$UNAME_RELEASE" | sed -e 's/[^.]=
*//'`"
> > ++      exit ;;
> > ++    i86pc:AuroraUX:5.*:* | i86xen:AuroraUX:5.*:*)
> > ++      echo i386-pc-auroraux"$UNAME_RELEASE"
> > +       exit ;;
> > +     i86pc:SunOS:5.*:* | i86xen:SunOS:5.*:*)
> > +-      eval $set_cc_for_build
> > +-      SUN_ARCH=3D"i386"
> > ++      eval "$set_cc_for_build"
> > ++      SUN_ARCH=3Di386
> > +       # If there is a compiler, see if it is configured for 64-bit ob=
jects.
> > +       # Note that the Sun cc does not turn __LP64__ into 1 like gcc d=
oes.
> > +       # This test works for both compilers.
> > +-      if [ "$CC_FOR_BUILD" !=3D 'no_compiler_found' ]; then
> > ++      if [ "$CC_FOR_BUILD" !=3D no_compiler_found ]; then
> > +           if (echo '#ifdef __amd64'; echo IS_64BIT_ARCH; echo '#endif=
') | \
> > +-              (CCOPTS=3D $CC_FOR_BUILD -E - 2>/dev/null) | \
> > ++              (CCOPTS=3D"" $CC_FOR_BUILD -E - 2>/dev/null) | \
> > +               grep IS_64BIT_ARCH >/dev/null
> > +           then
> > +-              SUN_ARCH=3D"x86_64"
> > ++              SUN_ARCH=3Dx86_64
> > +           fi
> > +       fi
> > +-      echo ${SUN_ARCH}-pc-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^=
=2E]*//'`
> > ++      echo "$SUN_ARCH"-pc-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[=
^.]*//'`"
> > +       exit ;;
> > +     sun4*:SunOS:6*:*)
> > +       # According to config.sub, this is the proper way to canonicali=
ze
> > +       # SunOS6.  Hard to guess exactly what SunOS6 will be like, but
> > +       # it's likely to be more like Solaris than SunOS4.
> > +-      echo sparc-sun-solaris3`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//=
'`
> > ++      echo sparc-sun-solaris3"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*/=
/'`"
> > +       exit ;;
> > +     sun4*:SunOS:*:*)
> > +       case "`/usr/bin/arch -k`" in
> > +@@ -362,25 +417,25 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> > +               ;;
> > +       esac
> > +       # Japanese Language versions have a version number like `4.1.3-=
JL'.
> > +-      echo sparc-sun-sunos`echo ${UNAME_RELEASE}|sed -e 's/-/_/'`
> > ++      echo sparc-sun-sunos"`echo "$UNAME_RELEASE"|sed -e 's/-/_/'`"
> > +       exit ;;
> > +     sun3*:SunOS:*:*)
> > +-      echo m68k-sun-sunos${UNAME_RELEASE}
> > ++      echo m68k-sun-sunos"$UNAME_RELEASE"
> > +       exit ;;
> > +     sun*:*:4.2BSD:*)
> > +       UNAME_RELEASE=3D`(sed 1q /etc/motd | awk '{print substr($5,1,3)=
}') 2>/dev/null`
> > +-      test "x${UNAME_RELEASE}" =3D "x" && UNAME_RELEASE=3D3
> > ++      test "x$UNAME_RELEASE" =3D x && UNAME_RELEASE=3D3
> > +       case "`/bin/arch`" in
> > +           sun3)
> > +-              echo m68k-sun-sunos${UNAME_RELEASE}
> > ++              echo m68k-sun-sunos"$UNAME_RELEASE"
> > +               ;;
> > +           sun4)
> > +-              echo sparc-sun-sunos${UNAME_RELEASE}
> > ++              echo sparc-sun-sunos"$UNAME_RELEASE"
> > +               ;;
> > +       esac
> > +       exit ;;
> > +     aushp:SunOS:*:*)
> > +-      echo sparc-auspex-sunos${UNAME_RELEASE}
> > ++      echo sparc-auspex-sunos"$UNAME_RELEASE"
> > +       exit ;;
> > +     # The situation for MiNT is a little confusing.  The machine name
> > +     # can be virtually everything (everything which is not
> > +@@ -391,44 +446,44 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> > +     # MiNT.  But MiNT is downward compatible to TOS, so this should
> > +     # be no problem.
> > +     atarist[e]:*MiNT:*:* | atarist[e]:*mint:*:* | atarist[e]:*TOS:*:*)
> > +-        echo m68k-atari-mint${UNAME_RELEASE}
> > ++      echo m68k-atari-mint"$UNAME_RELEASE"
> > +       exit ;;
> > +     atari*:*MiNT:*:* | atari*:*mint:*:* | atarist[e]:*TOS:*:*)
> > +-      echo m68k-atari-mint${UNAME_RELEASE}
> > +-        exit ;;
> > ++      echo m68k-atari-mint"$UNAME_RELEASE"
> > ++      exit ;;
> > +     *falcon*:*MiNT:*:* | *falcon*:*mint:*:* | *falcon*:*TOS:*:*)
> > +-        echo m68k-atari-mint${UNAME_RELEASE}
> > ++      echo m68k-atari-mint"$UNAME_RELEASE"
> > +       exit ;;
> > +     milan*:*MiNT:*:* | milan*:*mint:*:* | *milan*:*TOS:*:*)
> > +-        echo m68k-milan-mint${UNAME_RELEASE}
> > +-        exit ;;
> > ++      echo m68k-milan-mint"$UNAME_RELEASE"
> > ++      exit ;;
> > +     hades*:*MiNT:*:* | hades*:*mint:*:* | *hades*:*TOS:*:*)
> > +-        echo m68k-hades-mint${UNAME_RELEASE}
> > +-        exit ;;
> > ++      echo m68k-hades-mint"$UNAME_RELEASE"
> > ++      exit ;;
> > +     *:*MiNT:*:* | *:*mint:*:* | *:*TOS:*:*)
> > +-        echo m68k-unknown-mint${UNAME_RELEASE}
> > +-        exit ;;
> > ++      echo m68k-unknown-mint"$UNAME_RELEASE"
> > ++      exit ;;
> > +     m68k:machten:*:*)
> > +-      echo m68k-apple-machten${UNAME_RELEASE}
> > ++      echo m68k-apple-machten"$UNAME_RELEASE"
> > +       exit ;;
> > +     powerpc:machten:*:*)
> > +-      echo powerpc-apple-machten${UNAME_RELEASE}
> > ++      echo powerpc-apple-machten"$UNAME_RELEASE"
> > +       exit ;;
> > +     RISC*:Mach:*:*)
> > +       echo mips-dec-mach_bsd4.3
> > +       exit ;;
> > +     RISC*:ULTRIX:*:*)
> > +-      echo mips-dec-ultrix${UNAME_RELEASE}
> > ++      echo mips-dec-ultrix"$UNAME_RELEASE"
> > +       exit ;;
> > +     VAX*:ULTRIX*:*:*)
> > +-      echo vax-dec-ultrix${UNAME_RELEASE}
> > ++      echo vax-dec-ultrix"$UNAME_RELEASE"
> > +       exit ;;
> > +     2020:CLIX:*:* | 2430:CLIX:*:*)
> > +-      echo clipper-intergraph-clix${UNAME_RELEASE}
> > ++      echo clipper-intergraph-clix"$UNAME_RELEASE"
> > +       exit ;;
> > +     mips:*:*:UMIPS | mips:*:*:RISCos)
> > +-      eval $set_cc_for_build
> > +-      sed 's/^        //' << EOF >$dummy.c
> > ++      eval "$set_cc_for_build"
> > ++      sed 's/^        //' << EOF > "$dummy.c"
> > + #ifdef __cplusplus
> > + #include <stdio.h>  /* for printf() prototype */
> > +       int main (int argc, char *argv[]) {
> > +@@ -437,23 +492,23 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_R=
ELEASE}:${UNAME_VERSION}" in
> > + #endif
> > +       #if defined (host_mips) && defined (MIPSEB)
> > +       #if defined (SYSTYPE_SYSV)
> > +-        printf ("mips-mips-riscos%ssysv\n", argv[1]); exit (0);
> > ++        printf ("mips-mips-riscos%ssysv\\n", argv[1]); exit (0);
> > +       #endif
> > +       #if defined (SYSTYPE_SVR4)
> > +-        printf ("mips-mips-riscos%ssvr4\n", argv[1]); exit (0);
> > ++        printf ("mips-mips-riscos%ssvr4\\n", argv[1]); exit (0);
> > +       #endif
> > +       #if defined (SYSTYPE_BSD43) || defined(SYSTYPE_BSD)
> > +-        printf ("mips-mips-riscos%sbsd\n", argv[1]); exit (0);
> > ++        printf ("mips-mips-riscos%sbsd\\n", argv[1]); exit (0);
> > +       #endif
> > +       #endif
> > +         exit (-1);
> > +       }
> > + EOF
> > +-      $CC_FOR_BUILD -o $dummy $dummy.c &&
> > +-        dummyarg=3D`echo "${UNAME_RELEASE}" | sed -n 's/\([0-9]*\).*/=
\1/p'` &&
> > +-        SYSTEM_NAME=3D`$dummy $dummyarg` &&
> > ++      $CC_FOR_BUILD -o "$dummy" "$dummy.c" &&
> > ++        dummyarg=3D`echo "$UNAME_RELEASE" | sed -n 's/\([0-9]*\).*/\1=
/p'` &&
> > ++        SYSTEM_NAME=3D`"$dummy" "$dummyarg"` &&
> > +           { echo "$SYSTEM_NAME"; exit; }
> > +-      echo mips-mips-riscos${UNAME_RELEASE}
> > ++      echo mips-mips-riscos"$UNAME_RELEASE"
> > +       exit ;;
> > +     Motorola:PowerMAX_OS:*:*)
> > +       echo powerpc-motorola-powermax
> > +@@ -477,21 +532,21 @@ EOF
> > +       echo m88k-motorola-sysv3
> > +       exit ;;
> > +     AViiON:dgux:*:*)
> > +-        # DG/UX returns AViiON for all architectures
> > +-        UNAME_PROCESSOR=3D`/usr/bin/uname -p`
> > +-      if [ $UNAME_PROCESSOR =3D mc88100 ] || [ $UNAME_PROCESSOR =3D m=
c88110 ]
> > ++      # DG/UX returns AViiON for all architectures
> > ++      UNAME_PROCESSOR=3D`/usr/bin/uname -p`
> > ++      if [ "$UNAME_PROCESSOR" =3D mc88100 ] || [ "$UNAME_PROCESSOR" =
=3D mc88110 ]
> > +       then
> > +-          if [ ${TARGET_BINARY_INTERFACE}x =3D m88kdguxelfx ] || \
> > +-             [ ${TARGET_BINARY_INTERFACE}x =3D x ]
> > ++          if [ "$TARGET_BINARY_INTERFACE"x =3D m88kdguxelfx ] || \
> > ++             [ "$TARGET_BINARY_INTERFACE"x =3D x ]
> > +           then
> > +-              echo m88k-dg-dgux${UNAME_RELEASE}
> > ++              echo m88k-dg-dgux"$UNAME_RELEASE"
> > +           else
> > +-              echo m88k-dg-dguxbcs${UNAME_RELEASE}
> > ++              echo m88k-dg-dguxbcs"$UNAME_RELEASE"
> > +           fi
> > +       else
> > +-          echo i586-dg-dgux${UNAME_RELEASE}
> > ++          echo i586-dg-dgux"$UNAME_RELEASE"
> > +       fi
> > +-      exit ;;
> > ++      exit ;;
> > +     M88*:DolphinOS:*:*)       # DolphinOS (SVR3)
> > +       echo m88k-dolphin-sysv3
> > +       exit ;;
> > +@@ -506,7 +561,7 @@ EOF
> > +       echo m68k-tektronix-bsd
> > +       exit ;;
> > +     *:IRIX*:*:*)
> > +-      echo mips-sgi-irix`echo ${UNAME_RELEASE}|sed -e 's/-/_/g'`
> > ++      echo mips-sgi-irix"`echo "$UNAME_RELEASE"|sed -e 's/-/_/g'`"
> > +       exit ;;
> > +     ????????:AIX?:[12].1:2)   # AIX 2.2.1 or AIX 2.1.1 is RT/PC AIX.
> > +       echo romp-ibm-aix     # uname -m gives an 8 hex-code CPU id
> > +@@ -518,14 +573,14 @@ EOF
> > +       if [ -x /usr/bin/oslevel ] ; then
> > +               IBM_REV=3D`/usr/bin/oslevel`
> > +       else
> > +-              IBM_REV=3D${UNAME_VERSION}.${UNAME_RELEASE}
> > ++              IBM_REV=3D"$UNAME_VERSION.$UNAME_RELEASE"
> > +       fi
> > +-      echo ${UNAME_MACHINE}-ibm-aix${IBM_REV}
> > ++      echo "$UNAME_MACHINE"-ibm-aix"$IBM_REV"
> > +       exit ;;
> > +     *:AIX:2:3)
> > +       if grep bos325 /usr/include/stdio.h >/dev/null 2>&1; then
> > +-              eval $set_cc_for_build
> > +-              sed 's/^                //' << EOF >$dummy.c
> > ++              eval "$set_cc_for_build"
> > ++              sed 's/^                //' << EOF > "$dummy.c"
> > +               #include <sys/systemcfg.h>
> > +
> > +               main()
> > +@@ -536,7 +591,7 @@ EOF
> > +                       exit(0);
> > +                       }
> > + EOF
> > +-              if $CC_FOR_BUILD -o $dummy $dummy.c && SYSTEM_NAME=3D`$=
dummy`
> > ++              if $CC_FOR_BUILD -o "$dummy" "$dummy.c" && SYSTEM_NAME=
=3D`"$dummy"`
> > +               then
> > +                       echo "$SYSTEM_NAME"
> > +               else
> > +@@ -548,28 +603,29 @@ EOF
> > +               echo rs6000-ibm-aix3.2
> > +       fi
> > +       exit ;;
> > +-    *:AIX:*:[456])
> > ++    *:AIX:*:[4567])
> > +       IBM_CPU_ID=3D`/usr/sbin/lsdev -C -c processor -S available | se=
d 1q | awk '{ print $1 }'`
> > +-      if /usr/sbin/lsattr -El ${IBM_CPU_ID} | grep ' POWER' >/dev/nul=
l 2>&1; then
> > ++      if /usr/sbin/lsattr -El "$IBM_CPU_ID" | grep ' POWER' >/dev/nul=
l 2>&1; then
> > +               IBM_ARCH=3Drs6000
> > +       else
> > +               IBM_ARCH=3Dpowerpc
> > +       fi
> > +-      if [ -x /usr/bin/oslevel ] ; then
> > +-              IBM_REV=3D`/usr/bin/oslevel`
> > ++      if [ -x /usr/bin/lslpp ] ; then
> > ++              IBM_REV=3D`/usr/bin/lslpp -Lqc bos.rte.libc |
> > ++                         awk -F: '{ print $3 }' | sed s/[0-9]*$/0/`
> > +       else
> > +-              IBM_REV=3D${UNAME_VERSION}.${UNAME_RELEASE}
> > ++              IBM_REV=3D"$UNAME_VERSION.$UNAME_RELEASE"
> > +       fi
> > +-      echo ${IBM_ARCH}-ibm-aix${IBM_REV}
> > ++      echo "$IBM_ARCH"-ibm-aix"$IBM_REV"
> > +       exit ;;
> > +     *:AIX:*:*)
> > +       echo rs6000-ibm-aix
> > +       exit ;;
> > +-    ibmrt:4.4BSD:*|romp-ibm:BSD:*)
> > ++    ibmrt:4.4BSD:*|romp-ibm:4.4BSD:*)
> > +       echo romp-ibm-bsd4.4
> > +       exit ;;
> > +     ibmrt:*BSD:*|romp-ibm:BSD:*)            # covers RT/PC BSD and
> > +-      echo romp-ibm-bsd${UNAME_RELEASE}   # 4.3 with uname added to
> > ++      echo romp-ibm-bsd"$UNAME_RELEASE"   # 4.3 with uname added to
> > +       exit ;;                             # report: romp-ibm BSD 4.3
> > +     *:BOSX:*:*)
> > +       echo rs6000-bull-bosx
> > +@@ -584,67 +640,67 @@ EOF
> > +       echo m68k-hp-bsd4.4
> > +       exit ;;
> > +     9000/[34678]??:HP-UX:*:*)
> > +-      HPUX_REV=3D`echo ${UNAME_RELEASE}|sed -e 's/[^.]*.[0B]*//'`
> > +-      case "${UNAME_MACHINE}" in
> > +-          9000/31? )            HP_ARCH=3Dm68000 ;;
> > +-          9000/[34]?? )         HP_ARCH=3Dm68k ;;
> > ++      HPUX_REV=3D`echo "$UNAME_RELEASE"|sed -e 's/[^.]*.[0B]*//'`
> > ++      case "$UNAME_MACHINE" in
> > ++          9000/31?)            HP_ARCH=3Dm68000 ;;
> > ++          9000/[34]??)         HP_ARCH=3Dm68k ;;
> > +           9000/[678][0-9][0-9])
> > +               if [ -x /usr/bin/getconf ]; then
> > +                   sc_cpu_version=3D`/usr/bin/getconf SC_CPU_VERSION 2=
>/dev/null`
> > +-                    sc_kernel_bits=3D`/usr/bin/getconf SC_KERNEL_BITS=
 2>/dev/null`
> > +-                    case "${sc_cpu_version}" in
> > +-                      523) HP_ARCH=3D"hppa1.0" ;; # CPU_PA_RISC1_0
> > +-                      528) HP_ARCH=3D"hppa1.1" ;; # CPU_PA_RISC1_1
> > +-                      532)                      # CPU_PA_RISC2_0
> > +-                        case "${sc_kernel_bits}" in
> > +-                          32) HP_ARCH=3D"hppa2.0n" ;;
> > +-                          64) HP_ARCH=3D"hppa2.0w" ;;
> > +-                        '') HP_ARCH=3D"hppa2.0" ;;   # HP-UX 10.20
> > +-                        esac ;;
> > +-                    esac
> > ++                  sc_kernel_bits=3D`/usr/bin/getconf SC_KERNEL_BITS 2=
>/dev/null`
> > ++                  case "$sc_cpu_version" in
> > ++                    523) HP_ARCH=3Dhppa1.0 ;; # CPU_PA_RISC1_0
> > ++                    528) HP_ARCH=3Dhppa1.1 ;; # CPU_PA_RISC1_1
> > ++                    532)                      # CPU_PA_RISC2_0
> > ++                      case "$sc_kernel_bits" in
> > ++                        32) HP_ARCH=3Dhppa2.0n ;;
> > ++                        64) HP_ARCH=3Dhppa2.0w ;;
> > ++                        '') HP_ARCH=3Dhppa2.0 ;;   # HP-UX 10.20
> > ++                      esac ;;
> > ++                  esac
> > +               fi
> > +-              if [ "${HP_ARCH}" =3D "" ]; then
> > +-                  eval $set_cc_for_build
> > +-                  sed 's/^              //' << EOF >$dummy.c
> > ++              if [ "$HP_ARCH" =3D "" ]; then
> > ++                  eval "$set_cc_for_build"
> > ++                  sed 's/^            //' << EOF > "$dummy.c"
> > +
> > +-              #define _HPUX_SOURCE
> > +-              #include <stdlib.h>
> > +-              #include <unistd.h>
> > ++              #define _HPUX_SOURCE
> > ++              #include <stdlib.h>
> > ++              #include <unistd.h>
> > +
> > +-              int main ()
> > +-              {
> > +-              #if defined(_SC_KERNEL_BITS)
> > +-                  long bits =3D sysconf(_SC_KERNEL_BITS);
> > +-              #endif
> > +-                  long cpu  =3D sysconf (_SC_CPU_VERSION);
> > ++              int main ()
> > ++              {
> > ++              #if defined(_SC_KERNEL_BITS)
> > ++                  long bits =3D sysconf(_SC_KERNEL_BITS);
> > ++              #endif
> > ++                  long cpu  =3D sysconf (_SC_CPU_VERSION);
> > +
> > +-                  switch (cpu)
> > +-                      {
> > +-                      case CPU_PA_RISC1_0: puts ("hppa1.0"); break;
> > +-                      case CPU_PA_RISC1_1: puts ("hppa1.1"); break;
> > +-                      case CPU_PA_RISC2_0:
> > +-              #if defined(_SC_KERNEL_BITS)
> > +-                          switch (bits)
> > +-                              {
> > +-                              case 64: puts ("hppa2.0w"); break;
> > +-                              case 32: puts ("hppa2.0n"); break;
> > +-                              default: puts ("hppa2.0"); break;
> > +-                              } break;
> > +-              #else  /* !defined(_SC_KERNEL_BITS) */
> > +-                          puts ("hppa2.0"); break;
> > +-              #endif
> > +-                      default: puts ("hppa1.0"); break;
> > +-                      }
> > +-                  exit (0);
> > +-              }
> > ++                  switch (cpu)
> > ++                      {
> > ++                      case CPU_PA_RISC1_0: puts ("hppa1.0"); break;
> > ++                      case CPU_PA_RISC1_1: puts ("hppa1.1"); break;
> > ++                      case CPU_PA_RISC2_0:
> > ++              #if defined(_SC_KERNEL_BITS)
> > ++                          switch (bits)
> > ++                              {
> > ++                              case 64: puts ("hppa2.0w"); break;
> > ++                              case 32: puts ("hppa2.0n"); break;
> > ++                              default: puts ("hppa2.0"); break;
> > ++                              } break;
> > ++              #else  /* !defined(_SC_KERNEL_BITS) */
> > ++                          puts ("hppa2.0"); break;
> > ++              #endif
> > ++                      default: puts ("hppa1.0"); break;
> > ++                      }
> > ++                  exit (0);
> > ++              }
> > + EOF
> > +-                  (CCOPTS=3D $CC_FOR_BUILD -o $dummy $dummy.c 2>/dev/=
null) && HP_ARCH=3D`$dummy`
> > ++                  (CCOPTS=3D"" $CC_FOR_BUILD -o "$dummy" "$dummy.c" 2=
>/dev/null) && HP_ARCH=3D`"$dummy"`
> > +                   test -z "$HP_ARCH" && HP_ARCH=3Dhppa
> > +               fi ;;
> > +       esac
> > +-      if [ ${HP_ARCH} =3D "hppa2.0w" ]
> > ++      if [ "$HP_ARCH" =3D hppa2.0w ]
> > +       then
> > +-          eval $set_cc_for_build
> > ++          eval "$set_cc_for_build"
> > +
> > +           # hppa2.0w-hp-hpux* has a 64-bit kernel and a compiler gene=
rating
> > +           # 32-bit code.  hppa64-hp-hpux* has the same kernel and a c=
ompiler
> > +@@ -655,23 +711,23 @@ EOF
> > +           # $ CC_FOR_BUILD=3D"cc +DA2.0w" ./config.guess
> > +           # =3D> hppa64-hp-hpux11.23
> > +
> > +-          if echo __LP64__ | (CCOPTS=3D $CC_FOR_BUILD -E - 2>/dev/nul=
l) |
> > +-              grep __LP64__ >/dev/null
> > ++          if echo __LP64__ | (CCOPTS=3D"" $CC_FOR_BUILD -E - 2>/dev/n=
ull) |
> > ++              grep -q __LP64__
> > +           then
> > +-              HP_ARCH=3D"hppa2.0w"
> > ++              HP_ARCH=3Dhppa2.0w
> > +           else
> > +-              HP_ARCH=3D"hppa64"
> > ++              HP_ARCH=3Dhppa64
> > +           fi
> > +       fi
> > +-      echo ${HP_ARCH}-hp-hpux${HPUX_REV}
> > ++      echo "$HP_ARCH"-hp-hpux"$HPUX_REV"
> > +       exit ;;
> > +     ia64:HP-UX:*:*)
> > +-      HPUX_REV=3D`echo ${UNAME_RELEASE}|sed -e 's/[^.]*.[0B]*//'`
> > +-      echo ia64-hp-hpux${HPUX_REV}
> > ++      HPUX_REV=3D`echo "$UNAME_RELEASE"|sed -e 's/[^.]*.[0B]*//'`
> > ++      echo ia64-hp-hpux"$HPUX_REV"
> > +       exit ;;
> > +     3050*:HI-UX:*:*)
> > +-      eval $set_cc_for_build
> > +-      sed 's/^        //' << EOF >$dummy.c
> > ++      eval "$set_cc_for_build"
> > ++      sed 's/^        //' << EOF > "$dummy.c"
> > +       #include <unistd.h>
> > +       int
> > +       main ()
> > +@@ -696,11 +752,11 @@ EOF
> > +         exit (0);
> > +       }
> > + EOF
> > +-      $CC_FOR_BUILD -o $dummy $dummy.c && SYSTEM_NAME=3D`$dummy` &&
> > ++      $CC_FOR_BUILD -o "$dummy" "$dummy.c" && SYSTEM_NAME=3D`"$dummy"=
` &&
> > +               { echo "$SYSTEM_NAME"; exit; }
> > +       echo unknown-hitachi-hiuxwe2
> > +       exit ;;
> > +-    9000/7??:4.3bsd:*:* | 9000/8?[79]:4.3bsd:*:* )
> > ++    9000/7??:4.3bsd:*:* | 9000/8?[79]:4.3bsd:*:*)
> > +       echo hppa1.1-hp-bsd
> > +       exit ;;
> > +     9000/8??:4.3bsd:*:*)
> > +@@ -709,7 +765,7 @@ EOF
> > +     *9??*:MPE/iX:*:* | *3000*:MPE/iX:*:*)
> > +       echo hppa1.0-hp-mpeix
> > +       exit ;;
> > +-    hp7??:OSF1:*:* | hp8?[79]:OSF1:*:* )
> > ++    hp7??:OSF1:*:* | hp8?[79]:OSF1:*:*)
> > +       echo hppa1.1-hp-osf
> > +       exit ;;
> > +     hp8??:OSF1:*:*)
> > +@@ -717,9 +773,9 @@ EOF
> > +       exit ;;
> > +     i*86:OSF1:*:*)
> > +       if [ -x /usr/sbin/sysversion ] ; then
> > +-          echo ${UNAME_MACHINE}-unknown-osf1mk
> > ++          echo "$UNAME_MACHINE"-unknown-osf1mk
> > +       else
> > +-          echo ${UNAME_MACHINE}-unknown-osf1
> > ++          echo "$UNAME_MACHINE"-unknown-osf1
> > +       fi
> > +       exit ;;
> > +     parisc*:Lites*:*:*)
> > +@@ -727,325 +783,274 @@ EOF
> > +       exit ;;
> > +     C1*:ConvexOS:*:* | convex:ConvexOS:C1*:*)
> > +       echo c1-convex-bsd
> > +-        exit ;;
> > ++      exit ;;
> > +     C2*:ConvexOS:*:* | convex:ConvexOS:C2*:*)
> > +       if getsysinfo -f scalar_acc
> > +       then echo c32-convex-bsd
> > +       else echo c2-convex-bsd
> > +       fi
> > +-        exit ;;
> > ++      exit ;;
> > +     C34*:ConvexOS:*:* | convex:ConvexOS:C34*:*)
> > +       echo c34-convex-bsd
> > +-        exit ;;
> > ++      exit ;;
> > +     C38*:ConvexOS:*:* | convex:ConvexOS:C38*:*)
> > +       echo c38-convex-bsd
> > +-        exit ;;
> > ++      exit ;;
> > +     C4*:ConvexOS:*:* | convex:ConvexOS:C4*:*)
> > +       echo c4-convex-bsd
> > +-        exit ;;
> > ++      exit ;;
> > +     CRAY*Y-MP:*:*:*)
> > +-      echo ymp-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
> > ++      echo ymp-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
> > +       exit ;;
> > +     CRAY*[A-Z]90:*:*:*)
> > +-      echo ${UNAME_MACHINE}-cray-unicos${UNAME_RELEASE} \
> > ++      echo "$UNAME_MACHINE"-cray-unicos"$UNAME_RELEASE" \
> > +       | sed -e 's/CRAY.*\([A-Z]90\)/\1/' \
> > +             -e y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxy=
z/ \
> > +             -e 's/\.[^.]*$/.X/'
> > +       exit ;;
> > +     CRAY*TS:*:*:*)
> > +-      echo t90-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
> > ++      echo t90-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
> > +       exit ;;
> > +     CRAY*T3E:*:*:*)
> > +-      echo alphaev5-cray-unicosmk${UNAME_RELEASE} | sed -e 's/\.[^.]*=
$/.X/'
> > ++      echo alphaev5-cray-unicosmk"$UNAME_RELEASE" | sed -e 's/\.[^.]*=
$/.X/'
> > +       exit ;;
> > +     CRAY*SV1:*:*:*)
> > +-      echo sv1-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
> > ++      echo sv1-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
> > +       exit ;;
> > +     *:UNICOS/mp:*:*)
> > +-      echo craynv-cray-unicosmp${UNAME_RELEASE} | sed -e 's/\.[^.]*$/=
=2EX/'
> > ++      echo craynv-cray-unicosmp"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/=
=2EX/'
> > +       exit ;;
> > +     F30[01]:UNIX_System_V:*:* | F700:UNIX_System_V:*:*)
> > +-      FUJITSU_PROC=3D`uname -m | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abc=
defghijklmnopqrstuvwxyz'`
> > +-        FUJITSU_SYS=3D`uname -p | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'ab=
cdefghijklmnopqrstuvwxyz' | sed -e 's/\///'`
> > +-        FUJITSU_REL=3D`echo ${UNAME_RELEASE} | sed -e 's/ /_/'`
> > +-        echo "${FUJITSU_PROC}-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
> > +-        exit ;;
> > ++      FUJITSU_PROC=3D`uname -m | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdef=
ghijklmnopqrstuvwxyz`
> > ++      FUJITSU_SYS=3D`uname -p | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefg=
hijklmnopqrstuvwxyz | sed -e 's/\///'`
> > ++      FUJITSU_REL=3D`echo "$UNAME_RELEASE" | sed -e 's/ /_/'`
> > ++      echo "${FUJITSU_PROC}-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
> > ++      exit ;;
> > +     5000:UNIX_System_V:4.*:*)
> > +-        FUJITSU_SYS=3D`uname -p | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'ab=
cdefghijklmnopqrstuvwxyz' | sed -e 's/\///'`
> > +-        FUJITSU_REL=3D`echo ${UNAME_RELEASE} | tr 'ABCDEFGHIJKLMNOPQR=
STUVWXYZ' 'abcdefghijklmnopqrstuvwxyz' | sed -e 's/ /_/'`
> > +-        echo "sparc-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
> > ++      FUJITSU_SYS=3D`uname -p | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefg=
hijklmnopqrstuvwxyz | sed -e 's/\///'`
> > ++      FUJITSU_REL=3D`echo "$UNAME_RELEASE" | tr ABCDEFGHIJKLMNOPQRSTU=
VWXYZ abcdefghijklmnopqrstuvwxyz | sed -e 's/ /_/'`
> > ++      echo "sparc-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
> > +       exit ;;
> > +     i*86:BSD/386:*:* | i*86:BSD/OS:*:* | *:Ascend\ Embedded/OS:*:*)
> > +-      echo ${UNAME_MACHINE}-pc-bsdi${UNAME_RELEASE}
> > ++      echo "$UNAME_MACHINE"-pc-bsdi"$UNAME_RELEASE"
> > +       exit ;;
> > +     sparc*:BSD/OS:*:*)
> > +-      echo sparc-unknown-bsdi${UNAME_RELEASE}
> > ++      echo sparc-unknown-bsdi"$UNAME_RELEASE"
> > +       exit ;;
> > +     *:BSD/OS:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-bsdi${UNAME_RELEASE}
> > ++      echo "$UNAME_MACHINE"-unknown-bsdi"$UNAME_RELEASE"
> > +       exit ;;
> > +     *:FreeBSD:*:*)
> > +-      case ${UNAME_MACHINE} in
> > +-          pc98)
> > +-              echo i386-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e =
's/[-(].*//'` ;;
> > ++      UNAME_PROCESSOR=3D`/usr/bin/uname -p`
> > ++      case "$UNAME_PROCESSOR" in
> > +           amd64)
> > +-              echo x86_64-unknown-freebsd`echo ${UNAME_RELEASE}|sed -=
e 's/[-(].*//'` ;;
> > +-          *)
> > +-              echo ${UNAME_MACHINE}-unknown-freebsd`echo ${UNAME_RELE=
ASE}|sed -e 's/[-(].*//'` ;;
> > ++              UNAME_PROCESSOR=3Dx86_64 ;;
> > ++          i386)
> > ++              UNAME_PROCESSOR=3Di586 ;;
> > +       esac
> > ++      echo "$UNAME_PROCESSOR"-unknown-freebsd"`echo "$UNAME_RELEASE"|=
sed -e 's/[-(].*//'`"
> > +       exit ;;
> > +     i*:CYGWIN*:*)
> > +-      echo ${UNAME_MACHINE}-pc-cygwin
> > ++      echo "$UNAME_MACHINE"-pc-cygwin
> > ++      exit ;;
> > ++    *:MINGW64*:*)
> > ++      echo "$UNAME_MACHINE"-pc-mingw64
> > +       exit ;;
> > +     *:MINGW*:*)
> > +-      echo ${UNAME_MACHINE}-pc-mingw32
> > ++      echo "$UNAME_MACHINE"-pc-mingw32
> > +       exit ;;
> > +-    i*:windows32*:*)
> > +-      # uname -m includes "-pc" on this system.
> > +-      echo ${UNAME_MACHINE}-mingw32
> > ++    *:MSYS*:*)
> > ++      echo "$UNAME_MACHINE"-pc-msys
> > +       exit ;;
> > +     i*:PW*:*)
> > +-      echo ${UNAME_MACHINE}-pc-pw32
> > ++      echo "$UNAME_MACHINE"-pc-pw32
> > +       exit ;;
> > +-    *:Interix*:[3456]*)
> > +-      case ${UNAME_MACHINE} in
> > ++    *:Interix*:*)
> > ++      case "$UNAME_MACHINE" in
> > +           x86)
> > +-              echo i586-pc-interix${UNAME_RELEASE}
> > ++              echo i586-pc-interix"$UNAME_RELEASE"
> > +               exit ;;
> > +-          EM64T | authenticamd | genuineintel)
> > +-              echo x86_64-unknown-interix${UNAME_RELEASE}
> > ++          authenticamd | genuineintel | EM64T)
> > ++              echo x86_64-unknown-interix"$UNAME_RELEASE"
> > +               exit ;;
> > +           IA64)
> > +-              echo ia64-unknown-interix${UNAME_RELEASE}
> > ++              echo ia64-unknown-interix"$UNAME_RELEASE"
> > +               exit ;;
> > +       esac ;;
> > +-    [345]86:Windows_95:* | [345]86:Windows_98:* | [345]86:Windows_NT:=
*)
> > +-      echo i${UNAME_MACHINE}-pc-mks
> > +-      exit ;;
> > +-    i*:Windows_NT*:* | Pentium*:Windows_NT*:*)
> > +-      # How do we know it's Interix rather than the generic POSIX sub=
system?
> > +-      # It also conflicts with pre-2.0 versions of AT&T UWIN. Should =
we
> > +-      # UNAME_MACHINE based on the output of uname instead of i386?
> > +-      echo i586-pc-interix
> > +-      exit ;;
> > +     i*:UWIN*:*)
> > +-      echo ${UNAME_MACHINE}-pc-uwin
> > ++      echo "$UNAME_MACHINE"-pc-uwin
> > +       exit ;;
> > +     amd64:CYGWIN*:*:* | x86_64:CYGWIN*:*:*)
> > +       echo x86_64-unknown-cygwin
> > +       exit ;;
> > +-    p*:CYGWIN*:*)
> > +-      echo powerpcle-unknown-cygwin
> > +-      exit ;;
> > +     prep*:SunOS:5.*:*)
> > +-      echo powerpcle-unknown-solaris2`echo ${UNAME_RELEASE}|sed -e 's=
/[^.]*//'`
> > ++      echo powerpcle-unknown-solaris2"`echo "$UNAME_RELEASE"|sed -e '=
s/[^.]*//'`"
> > +       exit ;;
> > +     *:GNU:*:*)
> > +       # the GNU system
> > +-      echo `echo ${UNAME_MACHINE}|sed -e 's,[-/].*$,,'`-unknown-gnu`e=
cho ${UNAME_RELEASE}|sed -e 's,/.*$,,'`
> > ++      echo "`echo "$UNAME_MACHINE"|sed -e 's,[-/].*$,,'`-unknown-$LIB=
C`echo "$UNAME_RELEASE"|sed -e 's,/.*$,,'`"
> > +       exit ;;
> > +     *:GNU/*:*:*)
> > +       # other systems with GNU libc and userland
> > +-      echo ${UNAME_MACHINE}-unknown-`echo ${UNAME_SYSTEM} | sed 's,^[=
^/]*/,,' | tr '[A-Z]' '[a-z]'``echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'`-g=
nu
> > ++      echo "$UNAME_MACHINE-unknown-`echo "$UNAME_SYSTEM" | sed 's,^[^=
/]*/,,' | tr "[:upper:]" "[:lower:]"``echo "$UNAME_RELEASE"|sed -e 's/[-(].=
*//'`-$LIBC"
> > ++      exit ;;
> > ++    *:Minix:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-minix
> > +       exit ;;
> > +-    i*86:Minix:*:*)
> > +-      echo ${UNAME_MACHINE}-pc-minix
> > ++    aarch64:Linux:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > ++      exit ;;
> > ++    aarch64_be:Linux:*:*)
> > ++      UNAME_MACHINE=3Daarch64_be
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > ++      exit ;;
> > ++    alpha:Linux:*:*)
> > ++      case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` =
in
> > ++        EV5)   UNAME_MACHINE=3Dalphaev5 ;;
> > ++        EV56)  UNAME_MACHINE=3Dalphaev56 ;;
> > ++        PCA56) UNAME_MACHINE=3Dalphapca56 ;;
> > ++        PCA57) UNAME_MACHINE=3Dalphapca56 ;;
> > ++        EV6)   UNAME_MACHINE=3Dalphaev6 ;;
> > ++        EV67)  UNAME_MACHINE=3Dalphaev67 ;;
> > ++        EV68*) UNAME_MACHINE=3Dalphaev68 ;;
> > ++      esac
> > ++      objdump --private-headers /bin/sh | grep -q ld.so.1
> > ++      if test "$?" =3D 0 ; then LIBC=3Dgnulibc1 ; fi
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > ++      exit ;;
> > ++    arc:Linux:*:* | arceb:Linux:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +     arm*:Linux:*:*)
> > +-      eval $set_cc_for_build
> > ++      eval "$set_cc_for_build"
> > +       if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
> > +           | grep -q __ARM_EABI__
> > +       then
> > +-          echo ${UNAME_MACHINE}-unknown-linux-gnu
> > ++          echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       else
> > +-          echo ${UNAME_MACHINE}-unknown-linux-gnueabi
> > ++          if echo __ARM_PCS_VFP | $CC_FOR_BUILD -E - 2>/dev/null \
> > ++              | grep -q __ARM_PCS_VFP
> > ++          then
> > ++              echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"eabi
> > ++          else
> > ++              echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"eabihf
> > ++          fi
> > +       fi
> > +       exit ;;
> > +     avr32*:Linux:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +     cris:Linux:*:*)
> > +-      echo cris-axis-linux-gnu
> > ++      echo "$UNAME_MACHINE"-axis-linux-"$LIBC"
> > +       exit ;;
> > +     crisv32:Linux:*:*)
> > +-      echo crisv32-axis-linux-gnu
> > ++      echo "$UNAME_MACHINE"-axis-linux-"$LIBC"
> > ++      exit ;;
> > ++    e2k:Linux:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +     frv:Linux:*:*)
> > +-      echo frv-unknown-linux-gnu
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > ++      exit ;;
> > ++    hexagon:Linux:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > ++      exit ;;
> > ++    i*86:Linux:*:*)
> > ++      echo "$UNAME_MACHINE"-pc-linux-"$LIBC"
> > +       exit ;;
> > +     ia64:Linux:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > ++      exit ;;
> > ++    k1om:Linux:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +     m32r*:Linux:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +     m68*:Linux:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +-    mips:Linux:*:*)
> > +-      eval $set_cc_for_build
> > +-      sed 's/^        //' << EOF >$dummy.c
> > +-      #undef CPU
> > +-      #undef mips
> > +-      #undef mipsel
> > +-      #if defined(__MIPSEL__) || defined(__MIPSEL) || defined(_MIPSEL=
) || defined(MIPSEL)
> > +-      CPU=3Dmipsel
> > +-      #else
> > +-      #if defined(__MIPSEB__) || defined(__MIPSEB) || defined(_MIPSEB=
) || defined(MIPSEB)
> > +-      CPU=3Dmips
> > +-      #else
> > +-      CPU=3D
> > +-      #endif
> > +-      #endif
> > +-EOF
> > +-      eval "`$CC_FOR_BUILD -E $dummy.c 2>/dev/null | sed -n '
> > +-          /^CPU/{
> > +-              s: ::g
> > +-              p
> > +-          }'`"
> > +-      test x"${CPU}" !=3D x && { echo "${CPU}-unknown-linux-gnu"; exi=
t; }
> > +-      ;;
> > +-    mips64:Linux:*:*)
> > +-      eval $set_cc_for_build
> > +-      sed 's/^        //' << EOF >$dummy.c
> > ++    mips:Linux:*:* | mips64:Linux:*:*)
> > ++      eval "$set_cc_for_build"
> > ++      sed 's/^        //' << EOF > "$dummy.c"
> > +       #undef CPU
> > +-      #undef mips64
> > +-      #undef mips64el
> > ++      #undef ${UNAME_MACHINE}
> > ++      #undef ${UNAME_MACHINE}el
> > +       #if defined(__MIPSEL__) || defined(__MIPSEL) || defined(_MIPSEL=
) || defined(MIPSEL)
> > +-      CPU=3Dmips64el
> > ++      CPU=3D${UNAME_MACHINE}el
> > +       #else
> > +       #if defined(__MIPSEB__) || defined(__MIPSEB) || defined(_MIPSEB=
) || defined(MIPSEB)
> > +-      CPU=3Dmips64
> > ++      CPU=3D${UNAME_MACHINE}
> > +       #else
> > +       CPU=3D
> > +       #endif
> > +       #endif
> > + EOF
> > +-      eval "`$CC_FOR_BUILD -E $dummy.c 2>/dev/null | sed -n '
> > +-          /^CPU/{
> > +-              s: ::g
> > +-              p
> > +-          }'`"
> > +-      test x"${CPU}" !=3D x && { echo "${CPU}-unknown-linux-gnu"; exi=
t; }
> > ++      eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^CPU'`"
> > ++      test "x$CPU" !=3D x && { echo "$CPU-unknown-linux-$LIBC"; exit;=
 }
> > +       ;;
> > +-    or32:Linux:*:*)
> > +-      echo or32-unknown-linux-gnu
> > ++    mips64el:Linux:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +-    ppc:Linux:*:*)
> > +-      echo powerpc-unknown-linux-gnu
> > ++    openrisc*:Linux:*:*)
> > ++      echo or1k-unknown-linux-"$LIBC"
> > +       exit ;;
> > +-    ppc64:Linux:*:*)
> > +-      echo powerpc64-unknown-linux-gnu
> > +-      exit ;;
> > +-    alpha:Linux:*:*)
> > +-      case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` =
in
> > +-        EV5)   UNAME_MACHINE=3Dalphaev5 ;;
> > +-        EV56)  UNAME_MACHINE=3Dalphaev56 ;;
> > +-        PCA56) UNAME_MACHINE=3Dalphapca56 ;;
> > +-        PCA57) UNAME_MACHINE=3Dalphapca56 ;;
> > +-        EV6)   UNAME_MACHINE=3Dalphaev6 ;;
> > +-        EV67)  UNAME_MACHINE=3Dalphaev67 ;;
> > +-        EV68*) UNAME_MACHINE=3Dalphaev68 ;;
> > +-        esac
> > +-      objdump --private-headers /bin/sh | grep ld.so.1 >/dev/null
> > +-      if test "$?" =3D 0 ; then LIBC=3D"libc1" ; else LIBC=3D"" ; fi
> > +-      echo ${UNAME_MACHINE}-unknown-linux-gnu${LIBC}
> > ++    or32:Linux:*:* | or1k*:Linux:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +     padre:Linux:*:*)
> > +-      echo sparc-unknown-linux-gnu
> > ++      echo sparc-unknown-linux-"$LIBC"
> > ++      exit ;;
> > ++    parisc64:Linux:*:* | hppa64:Linux:*:*)
> > ++      echo hppa64-unknown-linux-"$LIBC"
> > +       exit ;;
> > +     parisc:Linux:*:* | hppa:Linux:*:*)
> > +       # Look for CPU level
> > +       case `grep '^cpu[^a-z]*:' /proc/cpuinfo 2>/dev/null | cut -d' '=
 -f2` in
> > +-        PA7*) echo hppa1.1-unknown-linux-gnu ;;
> > +-        PA8*) echo hppa2.0-unknown-linux-gnu ;;
> > +-        *)    echo hppa-unknown-linux-gnu ;;
> > ++        PA7*) echo hppa1.1-unknown-linux-"$LIBC" ;;
> > ++        PA8*) echo hppa2.0-unknown-linux-"$LIBC" ;;
> > ++        *)    echo hppa-unknown-linux-"$LIBC" ;;
> > +       esac
> > +       exit ;;
> > +-    parisc64:Linux:*:* | hppa64:Linux:*:*)
> > +-      echo hppa64-unknown-linux-gnu
> > ++    ppc64:Linux:*:*)
> > ++      echo powerpc64-unknown-linux-"$LIBC"
> > ++      exit ;;
> > ++    ppc:Linux:*:*)
> > ++      echo powerpc-unknown-linux-"$LIBC"
> > ++      exit ;;
> > ++    ppc64le:Linux:*:*)
> > ++      echo powerpc64le-unknown-linux-"$LIBC"
> > ++      exit ;;
> > ++    ppcle:Linux:*:*)
> > ++      echo powerpcle-unknown-linux-"$LIBC"
> > ++      exit ;;
> > ++    riscv32:Linux:*:* | riscv64:Linux:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +     s390:Linux:*:* | s390x:Linux:*:*)
> > +-      echo ${UNAME_MACHINE}-ibm-linux
> > ++      echo "$UNAME_MACHINE"-ibm-linux-"$LIBC"
> > +       exit ;;
> > +     sh64*:Linux:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +     sh*:Linux:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +     sparc:Linux:*:* | sparc64:Linux:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > ++      exit ;;
> > ++    tile*:Linux:*:*)
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +     vax:Linux:*:*)
> > +-      echo ${UNAME_MACHINE}-dec-linux-gnu
> > ++      echo "$UNAME_MACHINE"-dec-linux-"$LIBC"
> > +       exit ;;
> > +     x86_64:Linux:*:*)
> > +-      echo x86_64-unknown-linux-gnu
> > ++      echo "$UNAME_MACHINE"-pc-linux-"$LIBC"
> > +       exit ;;
> > +     xtensa*:Linux:*:*)
> > +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> > ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> > +       exit ;;
> > +-    i*86:Linux:*:*)
> > +-      # The BFD linker knows what the default object file format is, =
so
> > +-      # first see if it will tell us. cd to the root directory to pre=
vent
> > +-      # problems with other programs or directories called `ld' in th=
e path.
> > +-      # Set LC_ALL=3DC to ensure ld outputs messages in English.
> > +-      ld_supported_targets=3D`cd /; LC_ALL=3DC ld --help 2>&1 \
> > +-                       | sed -ne '/supported targets:/!d
> > +-                                  s/[         ][      ]*/ /g
> > +-                                  s/.*supported targets: *//
> > +-                                  s/ .*//
> > +-                                  p'`
> > +-        case "$ld_supported_targets" in
> > +-        elf32-i386)
> > +-              TENTATIVE=3D"${UNAME_MACHINE}-pc-linux-gnu"
> > +-              ;;
> > +-        a.out-i386-linux)
> > +-              echo "${UNAME_MACHINE}-pc-linux-gnuaout"
> > +-              exit ;;
> > +-        "")
> > +-              # Either a pre-BFD a.out linker (linux-gnuoldld) or
> > +-              # one that does not give us useful --help.
> > +-              echo "${UNAME_MACHINE}-pc-linux-gnuoldld"
> > +-              exit ;;
> > +-      esac
> > +-      # Determine whether the default compiler is a.out or elf
> > +-      eval $set_cc_for_build
> > +-      sed 's/^        //' << EOF >$dummy.c
> > +-      #include <features.h>
> > +-      #ifdef __ELF__
> > +-      # ifdef __GLIBC__
> > +-      #  if __GLIBC__ >=3D 2
> > +-      LIBC=3Dgnu
> > +-      #  else
> > +-      LIBC=3Dgnulibc1
> > +-      #  endif
> > +-      # else
> > +-      LIBC=3Dgnulibc1
> > +-      # endif
> > +-      #else
> > +-      #if defined(__INTEL_COMPILER) || defined(__PGI) || defined(__SU=
NPRO_C) || defined(__SUNPRO_CC)
> > +-      LIBC=3Dgnu
> > +-      #else
> > +-      LIBC=3Dgnuaout
> > +-      #endif
> > +-      #endif
> > +-      #ifdef __dietlibc__
> > +-      LIBC=3Ddietlibc
> > +-      #endif
> > +-EOF
> > +-      eval "`$CC_FOR_BUILD -E $dummy.c 2>/dev/null | sed -n '
> > +-          /^LIBC/{
> > +-              s: ::g
> > +-              p
> > +-          }'`"
> > +-      test x"${LIBC}" !=3D x && {
> > +-              echo "${UNAME_MACHINE}-pc-linux-${LIBC}"
> > +-              exit
> > +-      }
> > +-      test x"${TENTATIVE}" !=3D x && { echo "${TENTATIVE}"; exit; }
> > +-      ;;
> > +     i*86:DYNIX/ptx:4*:*)
> > +       # ptx 4.0 does uname -s correctly, with DYNIX/ptx in there.
> > +       # earlier versions are messed up and put the nodename in both
> > +@@ -1053,54 +1058,54 @@ EOF
> > +       echo i386-sequent-sysv4
> > +       exit ;;
> > +     i*86:UNIX_SV:4.2MP:2.*)
> > +-        # Unixware is an offshoot of SVR4, but it has its own version
> > +-        # number series starting with 2...
> > +-        # I am not positive that other SVR4 systems won't match this,
> > ++      # Unixware is an offshoot of SVR4, but it has its own version
> > ++      # number series starting with 2...
> > ++      # I am not positive that other SVR4 systems won't match this,
> > +       # I just have to hope.  -- rms.
> > +-        # Use sysv4.2uw... so that sysv4* matches it.
> > +-      echo ${UNAME_MACHINE}-pc-sysv4.2uw${UNAME_VERSION}
> > ++      # Use sysv4.2uw... so that sysv4* matches it.
> > ++      echo "$UNAME_MACHINE"-pc-sysv4.2uw"$UNAME_VERSION"
> > +       exit ;;
> > +     i*86:OS/2:*:*)
> > +       # If we were able to find `uname', then EMX Unix compatibility
> > +       # is probably installed.
> > +-      echo ${UNAME_MACHINE}-pc-os2-emx
> > ++      echo "$UNAME_MACHINE

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlt3OH0ACgkQSfx99yw5
9pZyhwgAziZcmgy2yCQrfqFWDuuhEDX+qepVziQPTOARkxBW1mpcTaAdd/9BYGhd
zoDEX31c3rlNuaNKrucvOTwQWWkycVtB6V7Y62orfOSYNapWaIA6E3fGdVaAVHez
K4EE71aZ7FD5HW8k9w2hjEZwuWQv/WnMvIxv7gzcq8Ol4gy5Px32uQKXiU6ofSyO
TccMGyEczHeocHYqc0snU7gnV7VLYztf3WeRnzANziR1V3Uh2aMwV0cufRArxahA
6857DFGOswqETlHipR+g+Nljw8i6jp60Ur/hqIKRHe1zMnTFHFGC7ES4qR70PLIZ
YXX+I84lI7e4ZJK0o5aabVXFv8UFMg==
=r+rP
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
