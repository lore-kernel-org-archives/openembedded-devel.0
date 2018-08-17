Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 18FB779364
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 18:25:34 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id z8-v6so9736193qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 11:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OG1rb5BfUmqsPGNq1YHhY0S+Y1uhLhqIMgRRzNifocI=;
	b=Bqr5RxdvLBwzEZ+2o+Nj09Qrwz+MPIkzTuD/2RSuTULb8asl73aSAw04rP5k/y7Ch2
	GuUAK0GGsOx3NAV6IOtgKzAl5qMgHTx4gFF9C1Kgo3W6JuY06upb7k/N8Eemrg1cJUEa
	x59WTtTEqob7DOb2XHRoP9CMrcvjqC04APd8BC2Eqo1gijmvxvVT9F74Ab7c9wQE7wS/
	TzjLu3oym66nt6LOUlWzcN5pTGVWbKUXdto6N8nzb0hschwgCoBVLf1+t7y+21VlcPfg
	xkk82NyCj1h86LKxFZtVfn2CSZ3rTFcpoG6BYkOPCnz8eBOtijcaLgg6Q+olfpujtmJN
	DrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OG1rb5BfUmqsPGNq1YHhY0S+Y1uhLhqIMgRRzNifocI=;
	b=GV9eOXBrlwtPmVV6uGM8aIMRYkrog0sIRC4HA89buTrCLWCcenwkRQOAsAbaHZxxoe
	GSHuCgTVZ4WsTwV80LktPD37Hx4ipuZ4yF7bKNLmkGdaeGSxfVDrC1Zfc+JGUbvtrKSC
	db+NK1GP8U45ysR6pTRVhcZ2NHfNOWC8/Sg9mjStpcLlYO4vzDNNfcYFvRFzrpVUTACu
	mNx9e2F+KKfyze9zFXh5/9SjYn1+RcZMaFgbhyLGky5LkT5nvhW70DX9FsnDLQ6rBTZy
	umsNXpXwqrUXghVa0cCKiTU36/t9S75v8Jb/udxv3rZ+YuWTzExkdbXCw2+/lwRUN5C7
	byUQ==
X-Gm-Message-State: AOUpUlFNOJqfU79whhElpRidyuRNp32dM9T/JtjTLay0tVr0JMl6PRIU
	3a3LMkJUAKsjNLMyAs9zPmGIdEFIcP1IA83y2BM=
X-Google-Smtp-Source: AA+uWPw5EHJ9d09EEjXtnskMjjjurEI+PHJAaxz3iTu107xgl29XmGW7F4tNJV2Uwt8VgcxzFNEhk8xP/16lljleEk8=
X-Received: by 2002:ac8:25f1:: with SMTP id
	f46-v6mr36471268qtf.20.1534530335420; 
	Fri, 17 Aug 2018 11:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180817175227.16888-1-joe_macdonald@mentor.com>
In-Reply-To: <20180817175227.16888-1-joe_macdonald@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Aug 2018 11:25:08 -0700
Message-ID: <CAMKF1soe5FGEq6Y0J8D5qW2=8A+dZ0NV4AgtXG3D1=+=16DZ2Q@mail.gmail.com>
To: Joe MacDonald <joe_macdonald@mentor.com>
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
X-List-Received-Date: Fri, 17 Aug 2018 18:25:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 17, 2018 at 10:52 AM Joe MacDonald <joe_macdonald@mentor.com> wrote:
>
> Initial integration of the two stable BIRD releases, 1.6.4 and 2.0.2.
>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>
> v3:
>    - Dropped the v2.0.x series recipe due to issues building IPv6 client and
>      server
>
>    - Reworked v1.6.4 to remove the now-unnecessary .inc file
>
>    - Added support for building ipv4 and ipv6 clients and servers in a single
>      package
>
>    - Cleaned up variable usage in the recipe
>
>    - Included full-featured init script
>

perhaps it will be good to have a systemd script too while you are here.


>  .../recipes-protocols/bird/bird_1.6.4.bb      |   70 +
>  ...-extend-config.sub-to-recognize-musl.patch | 4430 +++++++++++++++++
>  .../recipes-protocols/bird/files/bird.init    |   97 +
>  3 files changed, 4597 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/bird/bird_1.6.4.bb
>  create mode 100644 meta-networking/recipes-protocols/bird/files/0001-musl-extend-config.sub-to-recognize-musl.patch
>  create mode 100644 meta-networking/recipes-protocols/bird/files/bird.init
>
> diff --git a/meta-networking/recipes-protocols/bird/bird_1.6.4.bb b/meta-networking/recipes-protocols/bird/bird_1.6.4.bb
> new file mode 100644
> index 000000000..90c4e02ae
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/bird/bird_1.6.4.bb
> @@ -0,0 +1,70 @@
> +SUMMARY = "BIRD Internet Routing Daemon"
> +DESCRIPTION = "\
> +BIRD is dynamic routing daemon supporting IPv4 and IPv6 versions of routing \
> +protocols BGP, RIP and OSPF."
> +HOMEPAGE = "http://bird.network.cz"
> +SECTION = "console/network"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://README;beginline=87;endline=103;md5=0efecc23f039022580d0bac9a52f6117"
> +DEPENDS = "flex-native bison-native ncurses readline"
> +
> +inherit autotools
> +
> +SRC_URI = "\
> +    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}.tar.gz \
> +    file://bird.init \
> +    file://0001-musl-extend-config.sub-to-recognize-musl.patch \
> +    "
> +SRC_URI[md5sum] = "d62ec2547338e8d3dfb934b4c7b2faa4"
> +SRC_URI[sha256sum] = "c26b8caae988dba81a9dbbee93502463d4326d1b749d728d62aa5529c605afc0"
> +
> +EXTRA_OECONF  += "\
> +    --enable-pthreads \
> +"
> +
> +do_configure() {
> +
> +    # IPv4 build
> +    rm -fr  ${WORKDIR}/build-ipv4
> +    mkdir -p ${B}
> +    cd ${B}
> +    oe_runconf ${EXTRA_OECONF}
> +    mv ${B} ${WORKDIR}/build-ipv4
> +
> +    # IPv6 build
> +    rm -fr  ${WORKDIR}/build-ipv6
> +    mkdir -p ${B}
> +    cd ${B}
> +    oe_runconf ${EXTRA_OECONF} --enable-ipv6

ipv6 is a distro feature as well. probably make it conditional upon
that would be nice.
and this recipe tells me that ipv6 version probably should be an
separate recipe.

> +    mv ${B} ${WORKDIR}/build-ipv6
> +
> +}
> +
> +do_compile() {
> +
> +    for ver in ipv4 ipv6; do
> +        cd ${WORKDIR}/build-$ver
> +        oe_runmake
> +    done
> +
> +}
> +
> +do_install() {
> +    for ver in ipv4 ipv6; do
> +        cd ${WORKDIR}/build-$ver
> +        oe_runmake 'DESTDIR=${D}' install
> +    done
> +    install -d ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/bird.init ${D}${sysconfdir}/init.d/bird
> +    if [ -d ${D}/run ]; then
> +        rmdir ${D}/run
> +    fi
> +    if [ -d ${D}${localstatedir}/run ]; then
> +        rmdir ${D}${localstatedir}/run
> +    fi
> +}
> +
> +PACKAGES =+ "bird-client"
> +FILES_bird-client = "${sbindir}/birdc*"
> +
> +RUNIT_SERVICES = "bird"

I guess this is not needed we dont have runit support

> diff --git a/meta-networking/recipes-protocols/bird/files/0001-musl-extend-config.sub-to-recognize-musl.patch b/meta-networking/recipes-protocols/bird/files/0001-musl-extend-config.sub-to-recognize-musl.patch
> new file mode 100644
> index 000000000..578f9b6f0
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/bird/files/0001-musl-extend-config.sub-to-recognize-musl.patch
> @@ -0,0 +1,4430 @@
> +From 21baaa6870edb68f0a417ea3b4de5c75e5cf5a0d Mon Sep 17 00:00:00 2001
> +From: Joe MacDonald <joe_macdonald@mentor.com>
> +Date: Thu, 16 Aug 2018 01:56:05 +0000
> +Subject: [PATCH] musl: update config.guess and config.sub
> +
> +Just bringing config.guess and config.sub up to date is enough to enable
> +musl to build BIRD.
> +
> +Upstream-Status: Backport [https://gitlab.labs.nic.cz/labs/bird/commit/822a7ee6d5cd9bf38548026e0dd52fbc4634030d]
> +
> +Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> +---
> + tools/config.guess | 1193 ++++++++++++++---------------
> + tools/config.sub   | 1810 +++++++++++++++++++++++---------------------
> + 2 files changed, 1520 insertions(+), 1483 deletions(-)
> +
> +diff --git a/tools/config.guess b/tools/config.guess
> +index da83314..445c406 100755
> +--- a/tools/config.guess
> ++++ b/tools/config.guess
> +@@ -1,14 +1,12 @@
> + #! /bin/sh
> + # Attempt to guess a canonical system name.
> +-#   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
> +-#   2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008
> +-#   Free Software Foundation, Inc.
> ++#   Copyright 1992-2018 Free Software Foundation, Inc.
> +
> +-timestamp='2009-04-27'
> ++timestamp='2018-06-26'
> +
> + # This file is free software; you can redistribute it and/or modify it
> + # under the terms of the GNU General Public License as published by
> +-# the Free Software Foundation; either version 2 of the License, or
> ++# the Free Software Foundation; either version 3 of the License, or
> + # (at your option) any later version.
> + #
> + # This program is distributed in the hope that it will be useful, but
> +@@ -17,26 +15,22 @@ timestamp='2009-04-27'
> + # General Public License for more details.
> + #
> + # You should have received a copy of the GNU General Public License
> +-# along with this program; if not, write to the Free Software
> +-# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA
> +-# 02110-1301, USA.
> ++# along with this program; if not, see <https://www.gnu.org/licenses/>.
> + #
> + # As a special exception to the GNU General Public License, if you
> + # distribute this file as part of a program that contains a
> + # configuration script generated by Autoconf, you may include it under
> +-# the same distribution terms that you use for the rest of that program.
> +-
> +-
> +-# Originally written by Per Bothner <per@bothner.com>.
> +-# Please send patches to <config-patches@gnu.org>.  Submit a context
> +-# diff and a properly formatted ChangeLog entry.
> ++# the same distribution terms that you use for the rest of that
> ++# program.  This Exception is an additional permission under section 7
> ++# of the GNU General Public License, version 3 ("GPLv3").
> + #
> +-# This script attempts to guess a canonical system name similar to
> +-# config.sub.  If it succeeds, it prints the system name on stdout, and
> +-# exits with 0.  Otherwise, it exits with 1.
> ++# Originally written by Per Bothner; maintained since 2000 by Ben Elliston.
> + #
> +-# The plan is that this can be called by configure scripts if you
> +-# don't specify an explicit build system type.
> ++# You can get the latest version of this script from:
> ++# https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess
> ++#
> ++# Please send patches to <config-patches@gnu.org>.
> ++
> +
> + me=`echo "$0" | sed -e 's,.*/,,'`
> +
> +@@ -45,7 +39,7 @@ Usage: $0 [OPTION]
> +
> + Output the configuration name of the system \`$me' is run on.
> +
> +-Operation modes:
> ++Options:
> +   -h, --help         print this help, then exit
> +   -t, --time-stamp   print date of last modification, then exit
> +   -v, --version      print version number, then exit
> +@@ -56,8 +50,7 @@ version="\
> + GNU config.guess ($timestamp)
> +
> + Originally written by Per Bothner.
> +-Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
> +-2002, 2003, 2004, 2005, 2006, 2007, 2008 Free Software Foundation, Inc.
> ++Copyright 1992-2018 Free Software Foundation, Inc.
> +
> + This is free software; see the source for copying conditions.  There is NO
> + warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
> +@@ -113,10 +106,10 @@ trap "rm -f \$tmpfiles 2>/dev/null; rmdir \$tmp 2>/dev/null; exit 1" 1 2 13 15 ;
> +  { echo "$me: cannot create a temporary directory in $TMPDIR" >&2 ; exit 1 ; } ;
> + dummy=$tmp/dummy ;
> + tmpfiles="$dummy.c $dummy.o $dummy.rel $dummy" ;
> +-case $CC_FOR_BUILD,$HOST_CC,$CC in
> +- ,,)    echo "int x;" > $dummy.c ;
> ++case ${CC_FOR_BUILD-},${HOST_CC-},${CC-} in
> ++ ,,)    echo "int x;" > "$dummy.c" ;
> +       for c in cc gcc c89 c99 ; do
> +-        if ($c -c -o $dummy.o $dummy.c) >/dev/null 2>&1 ; then
> ++        if ($c -c -o "$dummy.o" "$dummy.c") >/dev/null 2>&1 ; then
> +            CC_FOR_BUILD="$c"; break ;
> +         fi ;
> +       done ;
> +@@ -139,12 +132,40 @@ UNAME_RELEASE=`(uname -r) 2>/dev/null` || UNAME_RELEASE=unknown
> + UNAME_SYSTEM=`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=unknown
> + UNAME_VERSION=`(uname -v) 2>/dev/null` || UNAME_VERSION=unknown
> +
> ++case "$UNAME_SYSTEM" in
> ++Linux|GNU|GNU/*)
> ++      # If the system lacks a compiler, then just pick glibc.
> ++      # We could probably try harder.
> ++      LIBC=gnu
> ++
> ++      eval "$set_cc_for_build"
> ++      cat <<-EOF > "$dummy.c"
> ++      #include <features.h>
> ++      #if defined(__UCLIBC__)
> ++      LIBC=uclibc
> ++      #elif defined(__dietlibc__)
> ++      LIBC=dietlibc
> ++      #else
> ++      LIBC=gnu
> ++      #endif
> ++      EOF
> ++      eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^LIBC' | sed 's, ,,g'`"
> ++
> ++      # If ldd exists, use it to detect musl libc.
> ++      if command -v ldd >/dev/null && \
> ++              ldd --version 2>&1 | grep -q ^musl
> ++      then
> ++          LIBC=musl
> ++      fi
> ++      ;;
> ++esac
> ++
> + # Note: order is significant - the case branches are not exclusive.
> +
> +-case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
> ++case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
> +     *:NetBSD:*:*)
> +       # NetBSD (nbsd) targets should (where applicable) match one or
> +-      # more of the tupples: *-*-netbsdelf*, *-*-netbsdaout*,
> ++      # more of the tuples: *-*-netbsdelf*, *-*-netbsdaout*,
> +       # *-*-netbsdecoff* and *-*-netbsd*.  For targets that recently
> +       # switched to ELF, *-*-netbsd* would select the old
> +       # object file format.  This provides both forward
> +@@ -154,23 +175,33 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
> +       # Note: NetBSD doesn't particularly care about the vendor
> +       # portion of the name.  We always set it to "unknown".
> +       sysctl="sysctl -n hw.machine_arch"
> +-      UNAME_MACHINE_ARCH=`(/sbin/$sysctl 2>/dev/null || \
> +-          /usr/sbin/$sysctl 2>/dev/null || echo unknown)`
> +-      case "${UNAME_MACHINE_ARCH}" in
> ++      UNAME_MACHINE_ARCH=`(uname -p 2>/dev/null || \
> ++          "/sbin/$sysctl" 2>/dev/null || \
> ++          "/usr/sbin/$sysctl" 2>/dev/null || \
> ++          echo unknown)`
> ++      case "$UNAME_MACHINE_ARCH" in
> +           armeb) machine=armeb-unknown ;;
> +           arm*) machine=arm-unknown ;;
> +           sh3el) machine=shl-unknown ;;
> +           sh3eb) machine=sh-unknown ;;
> +           sh5el) machine=sh5le-unknown ;;
> +-          *) machine=${UNAME_MACHINE_ARCH}-unknown ;;
> ++          earmv*)
> ++              arch=`echo "$UNAME_MACHINE_ARCH" | sed -e 's,^e\(armv[0-9]\).*$,\1,'`
> ++              endian=`echo "$UNAME_MACHINE_ARCH" | sed -ne 's,^.*\(eb\)$,\1,p'`
> ++              machine="${arch}${endian}"-unknown
> ++              ;;
> ++          *) machine="$UNAME_MACHINE_ARCH"-unknown ;;
> +       esac
> +       # The Operating System including object format, if it has switched
> +-      # to ELF recently, or will in the future.
> +-      case "${UNAME_MACHINE_ARCH}" in
> ++      # to ELF recently (or will in the future) and ABI.
> ++      case "$UNAME_MACHINE_ARCH" in
> ++          earm*)
> ++              os=netbsdelf
> ++              ;;
> +           arm*|i386|m68k|ns32k|sh3*|sparc|vax)
> +-              eval $set_cc_for_build
> ++              eval "$set_cc_for_build"
> +               if echo __ELF__ | $CC_FOR_BUILD -E - 2>/dev/null \
> +-                      | grep __ELF__ >/dev/null
> ++                      | grep -q __ELF__
> +               then
> +                   # Once all utilities can be ECOFF (netbsdecoff) or a.out (netbsdaout).
> +                   # Return netbsd for either.  FIX?
> +@@ -180,7 +211,14 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
> +               fi
> +               ;;
> +           *)
> +-              os=netbsd
> ++              os=netbsd
> ++              ;;
> ++      esac
> ++      # Determine ABI tags.
> ++      case "$UNAME_MACHINE_ARCH" in
> ++          earm*)
> ++              expr='s/^earmv[0-9]/-eabi/;s/eb$//'
> ++              abi=`echo "$UNAME_MACHINE_ARCH" | sed -e "$expr"`
> +               ;;
> +       esac
> +       # The OS release
> +@@ -188,42 +226,62 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
> +       # thus, need a distinct triplet. However, they do not need
> +       # kernel version information, so it can be replaced with a
> +       # suitable tag, in the style of linux-gnu.
> +-      case "${UNAME_VERSION}" in
> ++      case "$UNAME_VERSION" in
> +           Debian*)
> +               release='-gnu'
> +               ;;
> +           *)
> +-              release=`echo ${UNAME_RELEASE}|sed -e 's/[-_].*/\./'`
> ++              release=`echo "$UNAME_RELEASE" | sed -e 's/[-_].*//' | cut -d. -f1,2`
> +               ;;
> +       esac
> +       # Since CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM:
> +       # contains redundant information, the shorter form:
> +       # CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM is used.
> +-      echo "${machine}-${os}${release}"
> ++      echo "$machine-${os}${release}${abi-}"
> ++      exit ;;
> ++    *:Bitrig:*:*)
> ++      UNAME_MACHINE_ARCH=`arch | sed 's/Bitrig.//'`
> ++      echo "$UNAME_MACHINE_ARCH"-unknown-bitrig"$UNAME_RELEASE"
> +       exit ;;
> +     *:OpenBSD:*:*)
> +       UNAME_MACHINE_ARCH=`arch | sed 's/OpenBSD.//'`
> +-      echo ${UNAME_MACHINE_ARCH}-unknown-openbsd${UNAME_RELEASE}
> ++      echo "$UNAME_MACHINE_ARCH"-unknown-openbsd"$UNAME_RELEASE"
> ++      exit ;;
> ++    *:LibertyBSD:*:*)
> ++      UNAME_MACHINE_ARCH=`arch | sed 's/^.*BSD\.//'`
> ++      echo "$UNAME_MACHINE_ARCH"-unknown-libertybsd"$UNAME_RELEASE"
> ++      exit ;;
> ++    *:MidnightBSD:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-midnightbsd"$UNAME_RELEASE"
> +       exit ;;
> +     *:ekkoBSD:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-ekkobsd${UNAME_RELEASE}
> ++      echo "$UNAME_MACHINE"-unknown-ekkobsd"$UNAME_RELEASE"
> +       exit ;;
> +     *:SolidBSD:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-solidbsd${UNAME_RELEASE}
> ++      echo "$UNAME_MACHINE"-unknown-solidbsd"$UNAME_RELEASE"
> +       exit ;;
> +     macppc:MirBSD:*:*)
> +-      echo powerpc-unknown-mirbsd${UNAME_RELEASE}
> ++      echo powerpc-unknown-mirbsd"$UNAME_RELEASE"
> +       exit ;;
> +     *:MirBSD:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-mirbsd${UNAME_RELEASE}
> ++      echo "$UNAME_MACHINE"-unknown-mirbsd"$UNAME_RELEASE"
> +       exit ;;
> ++    *:Sortix:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-sortix
> ++      exit ;;
> ++    *:Redox:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-redox
> ++      exit ;;
> ++    mips:OSF1:*.*)
> ++        echo mips-dec-osf1
> ++        exit ;;
> +     alpha:OSF1:*:*)
> +       case $UNAME_RELEASE in
> +       *4.0)
> +               UNAME_RELEASE=`/usr/sbin/sizer -v | awk '{print $3}'`
> +               ;;
> +       *5.*)
> +-              UNAME_RELEASE=`/usr/sbin/sizer -v | awk '{print $4}'`
> ++              UNAME_RELEASE=`/usr/sbin/sizer -v | awk '{print $4}'`
> +               ;;
> +       esac
> +       # According to Compaq, /usr/sbin/psrinfo has been available on
> +@@ -233,60 +291,54 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
> +       ALPHA_CPU_TYPE=`/usr/sbin/psrinfo -v | sed -n -e 's/^  The alpha \(.*\) processor.*$/\1/p' | head -n 1`
> +       case "$ALPHA_CPU_TYPE" in
> +           "EV4 (21064)")
> +-              UNAME_MACHINE="alpha" ;;
> ++              UNAME_MACHINE=alpha ;;
> +           "EV4.5 (21064)")
> +-              UNAME_MACHINE="alpha" ;;
> ++              UNAME_MACHINE=alpha ;;
> +           "LCA4 (21066/21068)")
> +-              UNAME_MACHINE="alpha" ;;
> ++              UNAME_MACHINE=alpha ;;
> +           "EV5 (21164)")
> +-              UNAME_MACHINE="alphaev5" ;;
> ++              UNAME_MACHINE=alphaev5 ;;
> +           "EV5.6 (21164A)")
> +-              UNAME_MACHINE="alphaev56" ;;
> ++              UNAME_MACHINE=alphaev56 ;;
> +           "EV5.6 (21164PC)")
> +-              UNAME_MACHINE="alphapca56" ;;
> ++              UNAME_MACHINE=alphapca56 ;;
> +           "EV5.7 (21164PC)")
> +-              UNAME_MACHINE="alphapca57" ;;
> ++              UNAME_MACHINE=alphapca57 ;;
> +           "EV6 (21264)")
> +-              UNAME_MACHINE="alphaev6" ;;
> ++              UNAME_MACHINE=alphaev6 ;;
> +           "EV6.7 (21264A)")
> +-              UNAME_MACHINE="alphaev67" ;;
> ++              UNAME_MACHINE=alphaev67 ;;
> +           "EV6.8CB (21264C)")
> +-              UNAME_MACHINE="alphaev68" ;;
> ++              UNAME_MACHINE=alphaev68 ;;
> +           "EV6.8AL (21264B)")
> +-              UNAME_MACHINE="alphaev68" ;;
> ++              UNAME_MACHINE=alphaev68 ;;
> +           "EV6.8CX (21264D)")
> +-              UNAME_MACHINE="alphaev68" ;;
> ++              UNAME_MACHINE=alphaev68 ;;
> +           "EV6.9A (21264/EV69A)")
> +-              UNAME_MACHINE="alphaev69" ;;
> ++              UNAME_MACHINE=alphaev69 ;;
> +           "EV7 (21364)")
> +-              UNAME_MACHINE="alphaev7" ;;
> ++              UNAME_MACHINE=alphaev7 ;;
> +           "EV7.9 (21364A)")
> +-              UNAME_MACHINE="alphaev79" ;;
> ++              UNAME_MACHINE=alphaev79 ;;
> +       esac
> +       # A Pn.n version is a patched version.
> +       # A Vn.n version is a released version.
> +       # A Tn.n version is a released field test version.
> +       # A Xn.n version is an unreleased experimental baselevel.
> +       # 1.2 uses "1.2" for uname -r.
> +-      echo ${UNAME_MACHINE}-dec-osf`echo ${UNAME_RELEASE} | sed -e 's/^[PVTX]//' | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'`
> +-      exit ;;
> +-    Alpha\ *:Windows_NT*:*)
> +-      # How do we know it's Interix rather than the generic POSIX subsystem?
> +-      # Should we change UNAME_MACHINE based on the output of uname instead
> +-      # of the specific Alpha model?
> +-      echo alpha-pc-interix
> +-      exit ;;
> +-    21064:Windows_NT:50:3)
> +-      echo alpha-dec-winnt3.5
> +-      exit ;;
> ++      echo "$UNAME_MACHINE"-dec-osf"`echo "$UNAME_RELEASE" | sed -e 's/^[PVTX]//' | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz`"
> ++      # Reset EXIT trap before exiting to avoid spurious non-zero exit code.
> ++      exitcode=$?
> ++      trap '' 0
> ++      exit $exitcode ;;
> +     Amiga*:UNIX_System_V:4.0:*)
> +       echo m68k-unknown-sysv4
> +       exit ;;
> +     *:[Aa]miga[Oo][Ss]:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-amigaos
> ++      echo "$UNAME_MACHINE"-unknown-amigaos
> +       exit ;;
> +     *:[Mm]orph[Oo][Ss]:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-morphos
> ++      echo "$UNAME_MACHINE"-unknown-morphos
> +       exit ;;
> +     *:OS/390:*:*)
> +       echo i370-ibm-openedition
> +@@ -295,12 +347,12 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
> +       echo s390-ibm-zvmoe
> +       exit ;;
> +     *:OS400:*:*)
> +-        echo powerpc-ibm-os400
> ++      echo powerpc-ibm-os400
> +       exit ;;
> +     arm:RISC*:1.[012]*:*|arm:riscix:1.[012]*:*)
> +-      echo arm-acorn-riscix${UNAME_RELEASE}
> ++      echo arm-acorn-riscix"$UNAME_RELEASE"
> +       exit ;;
> +-    arm:riscos:*:*|arm:RISCOS:*:*)
> ++    arm*:riscos:*:*|arm*:RISCOS:*:*)
> +       echo arm-unknown-riscos
> +       exit ;;
> +     SR2?01:HI-UX/MPP:*:* | SR8000:HI-UX/MPP:*:*)
> +@@ -325,35 +377,38 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
> +           sparc) echo sparc-icl-nx7; exit ;;
> +       esac ;;
> +     s390x:SunOS:*:*)
> +-      echo ${UNAME_MACHINE}-ibm-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
> ++      echo "$UNAME_MACHINE"-ibm-solaris2"`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`"
> +       exit ;;
> +     sun4H:SunOS:5.*:*)
> +-      echo sparc-hal-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
> ++      echo sparc-hal-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
> +       exit ;;
> +     sun4*:SunOS:5.*:* | tadpole*:SunOS:5.*:*)
> +-      echo sparc-sun-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
> ++      echo sparc-sun-solaris2"`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`"
> ++      exit ;;
> ++    i86pc:AuroraUX:5.*:* | i86xen:AuroraUX:5.*:*)
> ++      echo i386-pc-auroraux"$UNAME_RELEASE"
> +       exit ;;
> +     i86pc:SunOS:5.*:* | i86xen:SunOS:5.*:*)
> +-      eval $set_cc_for_build
> +-      SUN_ARCH="i386"
> ++      eval "$set_cc_for_build"
> ++      SUN_ARCH=i386
> +       # If there is a compiler, see if it is configured for 64-bit objects.
> +       # Note that the Sun cc does not turn __LP64__ into 1 like gcc does.
> +       # This test works for both compilers.
> +-      if [ "$CC_FOR_BUILD" != 'no_compiler_found' ]; then
> ++      if [ "$CC_FOR_BUILD" != no_compiler_found ]; then
> +           if (echo '#ifdef __amd64'; echo IS_64BIT_ARCH; echo '#endif') | \
> +-              (CCOPTS= $CC_FOR_BUILD -E - 2>/dev/null) | \
> ++              (CCOPTS="" $CC_FOR_BUILD -E - 2>/dev/null) | \
> +               grep IS_64BIT_ARCH >/dev/null
> +           then
> +-              SUN_ARCH="x86_64"
> ++              SUN_ARCH=x86_64
> +           fi
> +       fi
> +-      echo ${SUN_ARCH}-pc-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
> ++      echo "$SUN_ARCH"-pc-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
> +       exit ;;
> +     sun4*:SunOS:6*:*)
> +       # According to config.sub, this is the proper way to canonicalize
> +       # SunOS6.  Hard to guess exactly what SunOS6 will be like, but
> +       # it's likely to be more like Solaris than SunOS4.
> +-      echo sparc-sun-solaris3`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
> ++      echo sparc-sun-solaris3"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
> +       exit ;;
> +     sun4*:SunOS:*:*)
> +       case "`/usr/bin/arch -k`" in
> +@@ -362,25 +417,25 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
> +               ;;
> +       esac
> +       # Japanese Language versions have a version number like `4.1.3-JL'.
> +-      echo sparc-sun-sunos`echo ${UNAME_RELEASE}|sed -e 's/-/_/'`
> ++      echo sparc-sun-sunos"`echo "$UNAME_RELEASE"|sed -e 's/-/_/'`"
> +       exit ;;
> +     sun3*:SunOS:*:*)
> +-      echo m68k-sun-sunos${UNAME_RELEASE}
> ++      echo m68k-sun-sunos"$UNAME_RELEASE"
> +       exit ;;
> +     sun*:*:4.2BSD:*)
> +       UNAME_RELEASE=`(sed 1q /etc/motd | awk '{print substr($5,1,3)}') 2>/dev/null`
> +-      test "x${UNAME_RELEASE}" = "x" && UNAME_RELEASE=3
> ++      test "x$UNAME_RELEASE" = x && UNAME_RELEASE=3
> +       case "`/bin/arch`" in
> +           sun3)
> +-              echo m68k-sun-sunos${UNAME_RELEASE}
> ++              echo m68k-sun-sunos"$UNAME_RELEASE"
> +               ;;
> +           sun4)
> +-              echo sparc-sun-sunos${UNAME_RELEASE}
> ++              echo sparc-sun-sunos"$UNAME_RELEASE"
> +               ;;
> +       esac
> +       exit ;;
> +     aushp:SunOS:*:*)
> +-      echo sparc-auspex-sunos${UNAME_RELEASE}
> ++      echo sparc-auspex-sunos"$UNAME_RELEASE"
> +       exit ;;
> +     # The situation for MiNT is a little confusing.  The machine name
> +     # can be virtually everything (everything which is not
> +@@ -391,44 +446,44 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
> +     # MiNT.  But MiNT is downward compatible to TOS, so this should
> +     # be no problem.
> +     atarist[e]:*MiNT:*:* | atarist[e]:*mint:*:* | atarist[e]:*TOS:*:*)
> +-        echo m68k-atari-mint${UNAME_RELEASE}
> ++      echo m68k-atari-mint"$UNAME_RELEASE"
> +       exit ;;
> +     atari*:*MiNT:*:* | atari*:*mint:*:* | atarist[e]:*TOS:*:*)
> +-      echo m68k-atari-mint${UNAME_RELEASE}
> +-        exit ;;
> ++      echo m68k-atari-mint"$UNAME_RELEASE"
> ++      exit ;;
> +     *falcon*:*MiNT:*:* | *falcon*:*mint:*:* | *falcon*:*TOS:*:*)
> +-        echo m68k-atari-mint${UNAME_RELEASE}
> ++      echo m68k-atari-mint"$UNAME_RELEASE"
> +       exit ;;
> +     milan*:*MiNT:*:* | milan*:*mint:*:* | *milan*:*TOS:*:*)
> +-        echo m68k-milan-mint${UNAME_RELEASE}
> +-        exit ;;
> ++      echo m68k-milan-mint"$UNAME_RELEASE"
> ++      exit ;;
> +     hades*:*MiNT:*:* | hades*:*mint:*:* | *hades*:*TOS:*:*)
> +-        echo m68k-hades-mint${UNAME_RELEASE}
> +-        exit ;;
> ++      echo m68k-hades-mint"$UNAME_RELEASE"
> ++      exit ;;
> +     *:*MiNT:*:* | *:*mint:*:* | *:*TOS:*:*)
> +-        echo m68k-unknown-mint${UNAME_RELEASE}
> +-        exit ;;
> ++      echo m68k-unknown-mint"$UNAME_RELEASE"
> ++      exit ;;
> +     m68k:machten:*:*)
> +-      echo m68k-apple-machten${UNAME_RELEASE}
> ++      echo m68k-apple-machten"$UNAME_RELEASE"
> +       exit ;;
> +     powerpc:machten:*:*)
> +-      echo powerpc-apple-machten${UNAME_RELEASE}
> ++      echo powerpc-apple-machten"$UNAME_RELEASE"
> +       exit ;;
> +     RISC*:Mach:*:*)
> +       echo mips-dec-mach_bsd4.3
> +       exit ;;
> +     RISC*:ULTRIX:*:*)
> +-      echo mips-dec-ultrix${UNAME_RELEASE}
> ++      echo mips-dec-ultrix"$UNAME_RELEASE"
> +       exit ;;
> +     VAX*:ULTRIX*:*:*)
> +-      echo vax-dec-ultrix${UNAME_RELEASE}
> ++      echo vax-dec-ultrix"$UNAME_RELEASE"
> +       exit ;;
> +     2020:CLIX:*:* | 2430:CLIX:*:*)
> +-      echo clipper-intergraph-clix${UNAME_RELEASE}
> ++      echo clipper-intergraph-clix"$UNAME_RELEASE"
> +       exit ;;
> +     mips:*:*:UMIPS | mips:*:*:RISCos)
> +-      eval $set_cc_for_build
> +-      sed 's/^        //' << EOF >$dummy.c
> ++      eval "$set_cc_for_build"
> ++      sed 's/^        //' << EOF > "$dummy.c"
> + #ifdef __cplusplus
> + #include <stdio.h>  /* for printf() prototype */
> +       int main (int argc, char *argv[]) {
> +@@ -437,23 +492,23 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
> + #endif
> +       #if defined (host_mips) && defined (MIPSEB)
> +       #if defined (SYSTYPE_SYSV)
> +-        printf ("mips-mips-riscos%ssysv\n", argv[1]); exit (0);
> ++        printf ("mips-mips-riscos%ssysv\\n", argv[1]); exit (0);
> +       #endif
> +       #if defined (SYSTYPE_SVR4)
> +-        printf ("mips-mips-riscos%ssvr4\n", argv[1]); exit (0);
> ++        printf ("mips-mips-riscos%ssvr4\\n", argv[1]); exit (0);
> +       #endif
> +       #if defined (SYSTYPE_BSD43) || defined(SYSTYPE_BSD)
> +-        printf ("mips-mips-riscos%sbsd\n", argv[1]); exit (0);
> ++        printf ("mips-mips-riscos%sbsd\\n", argv[1]); exit (0);
> +       #endif
> +       #endif
> +         exit (-1);
> +       }
> + EOF
> +-      $CC_FOR_BUILD -o $dummy $dummy.c &&
> +-        dummyarg=`echo "${UNAME_RELEASE}" | sed -n 's/\([0-9]*\).*/\1/p'` &&
> +-        SYSTEM_NAME=`$dummy $dummyarg` &&
> ++      $CC_FOR_BUILD -o "$dummy" "$dummy.c" &&
> ++        dummyarg=`echo "$UNAME_RELEASE" | sed -n 's/\([0-9]*\).*/\1/p'` &&
> ++        SYSTEM_NAME=`"$dummy" "$dummyarg"` &&
> +           { echo "$SYSTEM_NAME"; exit; }
> +-      echo mips-mips-riscos${UNAME_RELEASE}
> ++      echo mips-mips-riscos"$UNAME_RELEASE"
> +       exit ;;
> +     Motorola:PowerMAX_OS:*:*)
> +       echo powerpc-motorola-powermax
> +@@ -477,21 +532,21 @@ EOF
> +       echo m88k-motorola-sysv3
> +       exit ;;
> +     AViiON:dgux:*:*)
> +-        # DG/UX returns AViiON for all architectures
> +-        UNAME_PROCESSOR=`/usr/bin/uname -p`
> +-      if [ $UNAME_PROCESSOR = mc88100 ] || [ $UNAME_PROCESSOR = mc88110 ]
> ++      # DG/UX returns AViiON for all architectures
> ++      UNAME_PROCESSOR=`/usr/bin/uname -p`
> ++      if [ "$UNAME_PROCESSOR" = mc88100 ] || [ "$UNAME_PROCESSOR" = mc88110 ]
> +       then
> +-          if [ ${TARGET_BINARY_INTERFACE}x = m88kdguxelfx ] || \
> +-             [ ${TARGET_BINARY_INTERFACE}x = x ]
> ++          if [ "$TARGET_BINARY_INTERFACE"x = m88kdguxelfx ] || \
> ++             [ "$TARGET_BINARY_INTERFACE"x = x ]
> +           then
> +-              echo m88k-dg-dgux${UNAME_RELEASE}
> ++              echo m88k-dg-dgux"$UNAME_RELEASE"
> +           else
> +-              echo m88k-dg-dguxbcs${UNAME_RELEASE}
> ++              echo m88k-dg-dguxbcs"$UNAME_RELEASE"
> +           fi
> +       else
> +-          echo i586-dg-dgux${UNAME_RELEASE}
> ++          echo i586-dg-dgux"$UNAME_RELEASE"
> +       fi
> +-      exit ;;
> ++      exit ;;
> +     M88*:DolphinOS:*:*)       # DolphinOS (SVR3)
> +       echo m88k-dolphin-sysv3
> +       exit ;;
> +@@ -506,7 +561,7 @@ EOF
> +       echo m68k-tektronix-bsd
> +       exit ;;
> +     *:IRIX*:*:*)
> +-      echo mips-sgi-irix`echo ${UNAME_RELEASE}|sed -e 's/-/_/g'`
> ++      echo mips-sgi-irix"`echo "$UNAME_RELEASE"|sed -e 's/-/_/g'`"
> +       exit ;;
> +     ????????:AIX?:[12].1:2)   # AIX 2.2.1 or AIX 2.1.1 is RT/PC AIX.
> +       echo romp-ibm-aix     # uname -m gives an 8 hex-code CPU id
> +@@ -518,14 +573,14 @@ EOF
> +       if [ -x /usr/bin/oslevel ] ; then
> +               IBM_REV=`/usr/bin/oslevel`
> +       else
> +-              IBM_REV=${UNAME_VERSION}.${UNAME_RELEASE}
> ++              IBM_REV="$UNAME_VERSION.$UNAME_RELEASE"
> +       fi
> +-      echo ${UNAME_MACHINE}-ibm-aix${IBM_REV}
> ++      echo "$UNAME_MACHINE"-ibm-aix"$IBM_REV"
> +       exit ;;
> +     *:AIX:2:3)
> +       if grep bos325 /usr/include/stdio.h >/dev/null 2>&1; then
> +-              eval $set_cc_for_build
> +-              sed 's/^                //' << EOF >$dummy.c
> ++              eval "$set_cc_for_build"
> ++              sed 's/^                //' << EOF > "$dummy.c"
> +               #include <sys/systemcfg.h>
> +
> +               main()
> +@@ -536,7 +591,7 @@ EOF
> +                       exit(0);
> +                       }
> + EOF
> +-              if $CC_FOR_BUILD -o $dummy $dummy.c && SYSTEM_NAME=`$dummy`
> ++              if $CC_FOR_BUILD -o "$dummy" "$dummy.c" && SYSTEM_NAME=`"$dummy"`
> +               then
> +                       echo "$SYSTEM_NAME"
> +               else
> +@@ -548,28 +603,29 @@ EOF
> +               echo rs6000-ibm-aix3.2
> +       fi
> +       exit ;;
> +-    *:AIX:*:[456])
> ++    *:AIX:*:[4567])
> +       IBM_CPU_ID=`/usr/sbin/lsdev -C -c processor -S available | sed 1q | awk '{ print $1 }'`
> +-      if /usr/sbin/lsattr -El ${IBM_CPU_ID} | grep ' POWER' >/dev/null 2>&1; then
> ++      if /usr/sbin/lsattr -El "$IBM_CPU_ID" | grep ' POWER' >/dev/null 2>&1; then
> +               IBM_ARCH=rs6000
> +       else
> +               IBM_ARCH=powerpc
> +       fi
> +-      if [ -x /usr/bin/oslevel ] ; then
> +-              IBM_REV=`/usr/bin/oslevel`
> ++      if [ -x /usr/bin/lslpp ] ; then
> ++              IBM_REV=`/usr/bin/lslpp -Lqc bos.rte.libc |
> ++                         awk -F: '{ print $3 }' | sed s/[0-9]*$/0/`
> +       else
> +-              IBM_REV=${UNAME_VERSION}.${UNAME_RELEASE}
> ++              IBM_REV="$UNAME_VERSION.$UNAME_RELEASE"
> +       fi
> +-      echo ${IBM_ARCH}-ibm-aix${IBM_REV}
> ++      echo "$IBM_ARCH"-ibm-aix"$IBM_REV"
> +       exit ;;
> +     *:AIX:*:*)
> +       echo rs6000-ibm-aix
> +       exit ;;
> +-    ibmrt:4.4BSD:*|romp-ibm:BSD:*)
> ++    ibmrt:4.4BSD:*|romp-ibm:4.4BSD:*)
> +       echo romp-ibm-bsd4.4
> +       exit ;;
> +     ibmrt:*BSD:*|romp-ibm:BSD:*)            # covers RT/PC BSD and
> +-      echo romp-ibm-bsd${UNAME_RELEASE}   # 4.3 with uname added to
> ++      echo romp-ibm-bsd"$UNAME_RELEASE"   # 4.3 with uname added to
> +       exit ;;                             # report: romp-ibm BSD 4.3
> +     *:BOSX:*:*)
> +       echo rs6000-bull-bosx
> +@@ -584,67 +640,67 @@ EOF
> +       echo m68k-hp-bsd4.4
> +       exit ;;
> +     9000/[34678]??:HP-UX:*:*)
> +-      HPUX_REV=`echo ${UNAME_RELEASE}|sed -e 's/[^.]*.[0B]*//'`
> +-      case "${UNAME_MACHINE}" in
> +-          9000/31? )            HP_ARCH=m68000 ;;
> +-          9000/[34]?? )         HP_ARCH=m68k ;;
> ++      HPUX_REV=`echo "$UNAME_RELEASE"|sed -e 's/[^.]*.[0B]*//'`
> ++      case "$UNAME_MACHINE" in
> ++          9000/31?)            HP_ARCH=m68000 ;;
> ++          9000/[34]??)         HP_ARCH=m68k ;;
> +           9000/[678][0-9][0-9])
> +               if [ -x /usr/bin/getconf ]; then
> +                   sc_cpu_version=`/usr/bin/getconf SC_CPU_VERSION 2>/dev/null`
> +-                    sc_kernel_bits=`/usr/bin/getconf SC_KERNEL_BITS 2>/dev/null`
> +-                    case "${sc_cpu_version}" in
> +-                      523) HP_ARCH="hppa1.0" ;; # CPU_PA_RISC1_0
> +-                      528) HP_ARCH="hppa1.1" ;; # CPU_PA_RISC1_1
> +-                      532)                      # CPU_PA_RISC2_0
> +-                        case "${sc_kernel_bits}" in
> +-                          32) HP_ARCH="hppa2.0n" ;;
> +-                          64) HP_ARCH="hppa2.0w" ;;
> +-                        '') HP_ARCH="hppa2.0" ;;   # HP-UX 10.20
> +-                        esac ;;
> +-                    esac
> ++                  sc_kernel_bits=`/usr/bin/getconf SC_KERNEL_BITS 2>/dev/null`
> ++                  case "$sc_cpu_version" in
> ++                    523) HP_ARCH=hppa1.0 ;; # CPU_PA_RISC1_0
> ++                    528) HP_ARCH=hppa1.1 ;; # CPU_PA_RISC1_1
> ++                    532)                      # CPU_PA_RISC2_0
> ++                      case "$sc_kernel_bits" in
> ++                        32) HP_ARCH=hppa2.0n ;;
> ++                        64) HP_ARCH=hppa2.0w ;;
> ++                        '') HP_ARCH=hppa2.0 ;;   # HP-UX 10.20
> ++                      esac ;;
> ++                  esac
> +               fi
> +-              if [ "${HP_ARCH}" = "" ]; then
> +-                  eval $set_cc_for_build
> +-                  sed 's/^              //' << EOF >$dummy.c
> ++              if [ "$HP_ARCH" = "" ]; then
> ++                  eval "$set_cc_for_build"
> ++                  sed 's/^            //' << EOF > "$dummy.c"
> +
> +-              #define _HPUX_SOURCE
> +-              #include <stdlib.h>
> +-              #include <unistd.h>
> ++              #define _HPUX_SOURCE
> ++              #include <stdlib.h>
> ++              #include <unistd.h>
> +
> +-              int main ()
> +-              {
> +-              #if defined(_SC_KERNEL_BITS)
> +-                  long bits = sysconf(_SC_KERNEL_BITS);
> +-              #endif
> +-                  long cpu  = sysconf (_SC_CPU_VERSION);
> ++              int main ()
> ++              {
> ++              #if defined(_SC_KERNEL_BITS)
> ++                  long bits = sysconf(_SC_KERNEL_BITS);
> ++              #endif
> ++                  long cpu  = sysconf (_SC_CPU_VERSION);
> +
> +-                  switch (cpu)
> +-                      {
> +-                      case CPU_PA_RISC1_0: puts ("hppa1.0"); break;
> +-                      case CPU_PA_RISC1_1: puts ("hppa1.1"); break;
> +-                      case CPU_PA_RISC2_0:
> +-              #if defined(_SC_KERNEL_BITS)
> +-                          switch (bits)
> +-                              {
> +-                              case 64: puts ("hppa2.0w"); break;
> +-                              case 32: puts ("hppa2.0n"); break;
> +-                              default: puts ("hppa2.0"); break;
> +-                              } break;
> +-              #else  /* !defined(_SC_KERNEL_BITS) */
> +-                          puts ("hppa2.0"); break;
> +-              #endif
> +-                      default: puts ("hppa1.0"); break;
> +-                      }
> +-                  exit (0);
> +-              }
> ++                  switch (cpu)
> ++                      {
> ++                      case CPU_PA_RISC1_0: puts ("hppa1.0"); break;
> ++                      case CPU_PA_RISC1_1: puts ("hppa1.1"); break;
> ++                      case CPU_PA_RISC2_0:
> ++              #if defined(_SC_KERNEL_BITS)
> ++                          switch (bits)
> ++                              {
> ++                              case 64: puts ("hppa2.0w"); break;
> ++                              case 32: puts ("hppa2.0n"); break;
> ++                              default: puts ("hppa2.0"); break;
> ++                              } break;
> ++              #else  /* !defined(_SC_KERNEL_BITS) */
> ++                          puts ("hppa2.0"); break;
> ++              #endif
> ++                      default: puts ("hppa1.0"); break;
> ++                      }
> ++                  exit (0);
> ++              }
> + EOF
> +-                  (CCOPTS= $CC_FOR_BUILD -o $dummy $dummy.c 2>/dev/null) && HP_ARCH=`$dummy`
> ++                  (CCOPTS="" $CC_FOR_BUILD -o "$dummy" "$dummy.c" 2>/dev/null) && HP_ARCH=`"$dummy"`
> +                   test -z "$HP_ARCH" && HP_ARCH=hppa
> +               fi ;;
> +       esac
> +-      if [ ${HP_ARCH} = "hppa2.0w" ]
> ++      if [ "$HP_ARCH" = hppa2.0w ]
> +       then
> +-          eval $set_cc_for_build
> ++          eval "$set_cc_for_build"
> +
> +           # hppa2.0w-hp-hpux* has a 64-bit kernel and a compiler generating
> +           # 32-bit code.  hppa64-hp-hpux* has the same kernel and a compiler
> +@@ -655,23 +711,23 @@ EOF
> +           # $ CC_FOR_BUILD="cc +DA2.0w" ./config.guess
> +           # => hppa64-hp-hpux11.23
> +
> +-          if echo __LP64__ | (CCOPTS= $CC_FOR_BUILD -E - 2>/dev/null) |
> +-              grep __LP64__ >/dev/null
> ++          if echo __LP64__ | (CCOPTS="" $CC_FOR_BUILD -E - 2>/dev/null) |
> ++              grep -q __LP64__
> +           then
> +-              HP_ARCH="hppa2.0w"
> ++              HP_ARCH=hppa2.0w
> +           else
> +-              HP_ARCH="hppa64"
> ++              HP_ARCH=hppa64
> +           fi
> +       fi
> +-      echo ${HP_ARCH}-hp-hpux${HPUX_REV}
> ++      echo "$HP_ARCH"-hp-hpux"$HPUX_REV"
> +       exit ;;
> +     ia64:HP-UX:*:*)
> +-      HPUX_REV=`echo ${UNAME_RELEASE}|sed -e 's/[^.]*.[0B]*//'`
> +-      echo ia64-hp-hpux${HPUX_REV}
> ++      HPUX_REV=`echo "$UNAME_RELEASE"|sed -e 's/[^.]*.[0B]*//'`
> ++      echo ia64-hp-hpux"$HPUX_REV"
> +       exit ;;
> +     3050*:HI-UX:*:*)
> +-      eval $set_cc_for_build
> +-      sed 's/^        //' << EOF >$dummy.c
> ++      eval "$set_cc_for_build"
> ++      sed 's/^        //' << EOF > "$dummy.c"
> +       #include <unistd.h>
> +       int
> +       main ()
> +@@ -696,11 +752,11 @@ EOF
> +         exit (0);
> +       }
> + EOF
> +-      $CC_FOR_BUILD -o $dummy $dummy.c && SYSTEM_NAME=`$dummy` &&
> ++      $CC_FOR_BUILD -o "$dummy" "$dummy.c" && SYSTEM_NAME=`"$dummy"` &&
> +               { echo "$SYSTEM_NAME"; exit; }
> +       echo unknown-hitachi-hiuxwe2
> +       exit ;;
> +-    9000/7??:4.3bsd:*:* | 9000/8?[79]:4.3bsd:*:* )
> ++    9000/7??:4.3bsd:*:* | 9000/8?[79]:4.3bsd:*:*)
> +       echo hppa1.1-hp-bsd
> +       exit ;;
> +     9000/8??:4.3bsd:*:*)
> +@@ -709,7 +765,7 @@ EOF
> +     *9??*:MPE/iX:*:* | *3000*:MPE/iX:*:*)
> +       echo hppa1.0-hp-mpeix
> +       exit ;;
> +-    hp7??:OSF1:*:* | hp8?[79]:OSF1:*:* )
> ++    hp7??:OSF1:*:* | hp8?[79]:OSF1:*:*)
> +       echo hppa1.1-hp-osf
> +       exit ;;
> +     hp8??:OSF1:*:*)
> +@@ -717,9 +773,9 @@ EOF
> +       exit ;;
> +     i*86:OSF1:*:*)
> +       if [ -x /usr/sbin/sysversion ] ; then
> +-          echo ${UNAME_MACHINE}-unknown-osf1mk
> ++          echo "$UNAME_MACHINE"-unknown-osf1mk
> +       else
> +-          echo ${UNAME_MACHINE}-unknown-osf1
> ++          echo "$UNAME_MACHINE"-unknown-osf1
> +       fi
> +       exit ;;
> +     parisc*:Lites*:*:*)
> +@@ -727,325 +783,274 @@ EOF
> +       exit ;;
> +     C1*:ConvexOS:*:* | convex:ConvexOS:C1*:*)
> +       echo c1-convex-bsd
> +-        exit ;;
> ++      exit ;;
> +     C2*:ConvexOS:*:* | convex:ConvexOS:C2*:*)
> +       if getsysinfo -f scalar_acc
> +       then echo c32-convex-bsd
> +       else echo c2-convex-bsd
> +       fi
> +-        exit ;;
> ++      exit ;;
> +     C34*:ConvexOS:*:* | convex:ConvexOS:C34*:*)
> +       echo c34-convex-bsd
> +-        exit ;;
> ++      exit ;;
> +     C38*:ConvexOS:*:* | convex:ConvexOS:C38*:*)
> +       echo c38-convex-bsd
> +-        exit ;;
> ++      exit ;;
> +     C4*:ConvexOS:*:* | convex:ConvexOS:C4*:*)
> +       echo c4-convex-bsd
> +-        exit ;;
> ++      exit ;;
> +     CRAY*Y-MP:*:*:*)
> +-      echo ymp-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
> ++      echo ymp-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
> +       exit ;;
> +     CRAY*[A-Z]90:*:*:*)
> +-      echo ${UNAME_MACHINE}-cray-unicos${UNAME_RELEASE} \
> ++      echo "$UNAME_MACHINE"-cray-unicos"$UNAME_RELEASE" \
> +       | sed -e 's/CRAY.*\([A-Z]90\)/\1/' \
> +             -e y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/ \
> +             -e 's/\.[^.]*$/.X/'
> +       exit ;;
> +     CRAY*TS:*:*:*)
> +-      echo t90-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
> ++      echo t90-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
> +       exit ;;
> +     CRAY*T3E:*:*:*)
> +-      echo alphaev5-cray-unicosmk${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
> ++      echo alphaev5-cray-unicosmk"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
> +       exit ;;
> +     CRAY*SV1:*:*:*)
> +-      echo sv1-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
> ++      echo sv1-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
> +       exit ;;
> +     *:UNICOS/mp:*:*)
> +-      echo craynv-cray-unicosmp${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
> ++      echo craynv-cray-unicosmp"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
> +       exit ;;
> +     F30[01]:UNIX_System_V:*:* | F700:UNIX_System_V:*:*)
> +-      FUJITSU_PROC=`uname -m | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'`
> +-        FUJITSU_SYS=`uname -p | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz' | sed -e 's/\///'`
> +-        FUJITSU_REL=`echo ${UNAME_RELEASE} | sed -e 's/ /_/'`
> +-        echo "${FUJITSU_PROC}-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
> +-        exit ;;
> ++      FUJITSU_PROC=`uname -m | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz`
> ++      FUJITSU_SYS=`uname -p | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz | sed -e 's/\///'`
> ++      FUJITSU_REL=`echo "$UNAME_RELEASE" | sed -e 's/ /_/'`
> ++      echo "${FUJITSU_PROC}-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
> ++      exit ;;
> +     5000:UNIX_System_V:4.*:*)
> +-        FUJITSU_SYS=`uname -p | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz' | sed -e 's/\///'`
> +-        FUJITSU_REL=`echo ${UNAME_RELEASE} | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz' | sed -e 's/ /_/'`
> +-        echo "sparc-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
> ++      FUJITSU_SYS=`uname -p | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz | sed -e 's/\///'`
> ++      FUJITSU_REL=`echo "$UNAME_RELEASE" | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz | sed -e 's/ /_/'`
> ++      echo "sparc-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
> +       exit ;;
> +     i*86:BSD/386:*:* | i*86:BSD/OS:*:* | *:Ascend\ Embedded/OS:*:*)
> +-      echo ${UNAME_MACHINE}-pc-bsdi${UNAME_RELEASE}
> ++      echo "$UNAME_MACHINE"-pc-bsdi"$UNAME_RELEASE"
> +       exit ;;
> +     sparc*:BSD/OS:*:*)
> +-      echo sparc-unknown-bsdi${UNAME_RELEASE}
> ++      echo sparc-unknown-bsdi"$UNAME_RELEASE"
> +       exit ;;
> +     *:BSD/OS:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-bsdi${UNAME_RELEASE}
> ++      echo "$UNAME_MACHINE"-unknown-bsdi"$UNAME_RELEASE"
> +       exit ;;
> +     *:FreeBSD:*:*)
> +-      case ${UNAME_MACHINE} in
> +-          pc98)
> +-              echo i386-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
> ++      UNAME_PROCESSOR=`/usr/bin/uname -p`
> ++      case "$UNAME_PROCESSOR" in
> +           amd64)
> +-              echo x86_64-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
> +-          *)
> +-              echo ${UNAME_MACHINE}-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
> ++              UNAME_PROCESSOR=x86_64 ;;
> ++          i386)
> ++              UNAME_PROCESSOR=i586 ;;
> +       esac
> ++      echo "$UNAME_PROCESSOR"-unknown-freebsd"`echo "$UNAME_RELEASE"|sed -e 's/[-(].*//'`"
> +       exit ;;
> +     i*:CYGWIN*:*)
> +-      echo ${UNAME_MACHINE}-pc-cygwin
> ++      echo "$UNAME_MACHINE"-pc-cygwin
> ++      exit ;;
> ++    *:MINGW64*:*)
> ++      echo "$UNAME_MACHINE"-pc-mingw64
> +       exit ;;
> +     *:MINGW*:*)
> +-      echo ${UNAME_MACHINE}-pc-mingw32
> ++      echo "$UNAME_MACHINE"-pc-mingw32
> +       exit ;;
> +-    i*:windows32*:*)
> +-      # uname -m includes "-pc" on this system.
> +-      echo ${UNAME_MACHINE}-mingw32
> ++    *:MSYS*:*)
> ++      echo "$UNAME_MACHINE"-pc-msys
> +       exit ;;
> +     i*:PW*:*)
> +-      echo ${UNAME_MACHINE}-pc-pw32
> ++      echo "$UNAME_MACHINE"-pc-pw32
> +       exit ;;
> +-    *:Interix*:[3456]*)
> +-      case ${UNAME_MACHINE} in
> ++    *:Interix*:*)
> ++      case "$UNAME_MACHINE" in
> +           x86)
> +-              echo i586-pc-interix${UNAME_RELEASE}
> ++              echo i586-pc-interix"$UNAME_RELEASE"
> +               exit ;;
> +-          EM64T | authenticamd | genuineintel)
> +-              echo x86_64-unknown-interix${UNAME_RELEASE}
> ++          authenticamd | genuineintel | EM64T)
> ++              echo x86_64-unknown-interix"$UNAME_RELEASE"
> +               exit ;;
> +           IA64)
> +-              echo ia64-unknown-interix${UNAME_RELEASE}
> ++              echo ia64-unknown-interix"$UNAME_RELEASE"
> +               exit ;;
> +       esac ;;
> +-    [345]86:Windows_95:* | [345]86:Windows_98:* | [345]86:Windows_NT:*)
> +-      echo i${UNAME_MACHINE}-pc-mks
> +-      exit ;;
> +-    i*:Windows_NT*:* | Pentium*:Windows_NT*:*)
> +-      # How do we know it's Interix rather than the generic POSIX subsystem?
> +-      # It also conflicts with pre-2.0 versions of AT&T UWIN. Should we
> +-      # UNAME_MACHINE based on the output of uname instead of i386?
> +-      echo i586-pc-interix
> +-      exit ;;
> +     i*:UWIN*:*)
> +-      echo ${UNAME_MACHINE}-pc-uwin
> ++      echo "$UNAME_MACHINE"-pc-uwin
> +       exit ;;
> +     amd64:CYGWIN*:*:* | x86_64:CYGWIN*:*:*)
> +       echo x86_64-unknown-cygwin
> +       exit ;;
> +-    p*:CYGWIN*:*)
> +-      echo powerpcle-unknown-cygwin
> +-      exit ;;
> +     prep*:SunOS:5.*:*)
> +-      echo powerpcle-unknown-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
> ++      echo powerpcle-unknown-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
> +       exit ;;
> +     *:GNU:*:*)
> +       # the GNU system
> +-      echo `echo ${UNAME_MACHINE}|sed -e 's,[-/].*$,,'`-unknown-gnu`echo ${UNAME_RELEASE}|sed -e 's,/.*$,,'`
> ++      echo "`echo "$UNAME_MACHINE"|sed -e 's,[-/].*$,,'`-unknown-$LIBC`echo "$UNAME_RELEASE"|sed -e 's,/.*$,,'`"
> +       exit ;;
> +     *:GNU/*:*:*)
> +       # other systems with GNU libc and userland
> +-      echo ${UNAME_MACHINE}-unknown-`echo ${UNAME_SYSTEM} | sed 's,^[^/]*/,,' | tr '[A-Z]' '[a-z]'``echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'`-gnu
> ++      echo "$UNAME_MACHINE-unknown-`echo "$UNAME_SYSTEM" | sed 's,^[^/]*/,,' | tr "[:upper:]" "[:lower:]"``echo "$UNAME_RELEASE"|sed -e 's/[-(].*//'`-$LIBC"
> ++      exit ;;
> ++    *:Minix:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-minix
> +       exit ;;
> +-    i*86:Minix:*:*)
> +-      echo ${UNAME_MACHINE}-pc-minix
> ++    aarch64:Linux:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++      exit ;;
> ++    aarch64_be:Linux:*:*)
> ++      UNAME_MACHINE=aarch64_be
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++      exit ;;
> ++    alpha:Linux:*:*)
> ++      case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
> ++        EV5)   UNAME_MACHINE=alphaev5 ;;
> ++        EV56)  UNAME_MACHINE=alphaev56 ;;
> ++        PCA56) UNAME_MACHINE=alphapca56 ;;
> ++        PCA57) UNAME_MACHINE=alphapca56 ;;
> ++        EV6)   UNAME_MACHINE=alphaev6 ;;
> ++        EV67)  UNAME_MACHINE=alphaev67 ;;
> ++        EV68*) UNAME_MACHINE=alphaev68 ;;
> ++      esac
> ++      objdump --private-headers /bin/sh | grep -q ld.so.1
> ++      if test "$?" = 0 ; then LIBC=gnulibc1 ; fi
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++      exit ;;
> ++    arc:Linux:*:* | arceb:Linux:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +     arm*:Linux:*:*)
> +-      eval $set_cc_for_build
> ++      eval "$set_cc_for_build"
> +       if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
> +           | grep -q __ARM_EABI__
> +       then
> +-          echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++          echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       else
> +-          echo ${UNAME_MACHINE}-unknown-linux-gnueabi
> ++          if echo __ARM_PCS_VFP | $CC_FOR_BUILD -E - 2>/dev/null \
> ++              | grep -q __ARM_PCS_VFP
> ++          then
> ++              echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"eabi
> ++          else
> ++              echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"eabihf
> ++          fi
> +       fi
> +       exit ;;
> +     avr32*:Linux:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +     cris:Linux:*:*)
> +-      echo cris-axis-linux-gnu
> ++      echo "$UNAME_MACHINE"-axis-linux-"$LIBC"
> +       exit ;;
> +     crisv32:Linux:*:*)
> +-      echo crisv32-axis-linux-gnu
> ++      echo "$UNAME_MACHINE"-axis-linux-"$LIBC"
> ++      exit ;;
> ++    e2k:Linux:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +     frv:Linux:*:*)
> +-      echo frv-unknown-linux-gnu
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++      exit ;;
> ++    hexagon:Linux:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++      exit ;;
> ++    i*86:Linux:*:*)
> ++      echo "$UNAME_MACHINE"-pc-linux-"$LIBC"
> +       exit ;;
> +     ia64:Linux:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++      exit ;;
> ++    k1om:Linux:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +     m32r*:Linux:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +     m68*:Linux:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +-    mips:Linux:*:*)
> +-      eval $set_cc_for_build
> +-      sed 's/^        //' << EOF >$dummy.c
> +-      #undef CPU
> +-      #undef mips
> +-      #undef mipsel
> +-      #if defined(__MIPSEL__) || defined(__MIPSEL) || defined(_MIPSEL) || defined(MIPSEL)
> +-      CPU=mipsel
> +-      #else
> +-      #if defined(__MIPSEB__) || defined(__MIPSEB) || defined(_MIPSEB) || defined(MIPSEB)
> +-      CPU=mips
> +-      #else
> +-      CPU=
> +-      #endif
> +-      #endif
> +-EOF
> +-      eval "`$CC_FOR_BUILD -E $dummy.c 2>/dev/null | sed -n '
> +-          /^CPU/{
> +-              s: ::g
> +-              p
> +-          }'`"
> +-      test x"${CPU}" != x && { echo "${CPU}-unknown-linux-gnu"; exit; }
> +-      ;;
> +-    mips64:Linux:*:*)
> +-      eval $set_cc_for_build
> +-      sed 's/^        //' << EOF >$dummy.c
> ++    mips:Linux:*:* | mips64:Linux:*:*)
> ++      eval "$set_cc_for_build"
> ++      sed 's/^        //' << EOF > "$dummy.c"
> +       #undef CPU
> +-      #undef mips64
> +-      #undef mips64el
> ++      #undef ${UNAME_MACHINE}
> ++      #undef ${UNAME_MACHINE}el
> +       #if defined(__MIPSEL__) || defined(__MIPSEL) || defined(_MIPSEL) || defined(MIPSEL)
> +-      CPU=mips64el
> ++      CPU=${UNAME_MACHINE}el
> +       #else
> +       #if defined(__MIPSEB__) || defined(__MIPSEB) || defined(_MIPSEB) || defined(MIPSEB)
> +-      CPU=mips64
> ++      CPU=${UNAME_MACHINE}
> +       #else
> +       CPU=
> +       #endif
> +       #endif
> + EOF
> +-      eval "`$CC_FOR_BUILD -E $dummy.c 2>/dev/null | sed -n '
> +-          /^CPU/{
> +-              s: ::g
> +-              p
> +-          }'`"
> +-      test x"${CPU}" != x && { echo "${CPU}-unknown-linux-gnu"; exit; }
> ++      eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^CPU'`"
> ++      test "x$CPU" != x && { echo "$CPU-unknown-linux-$LIBC"; exit; }
> +       ;;
> +-    or32:Linux:*:*)
> +-      echo or32-unknown-linux-gnu
> ++    mips64el:Linux:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +-    ppc:Linux:*:*)
> +-      echo powerpc-unknown-linux-gnu
> ++    openrisc*:Linux:*:*)
> ++      echo or1k-unknown-linux-"$LIBC"
> +       exit ;;
> +-    ppc64:Linux:*:*)
> +-      echo powerpc64-unknown-linux-gnu
> +-      exit ;;
> +-    alpha:Linux:*:*)
> +-      case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
> +-        EV5)   UNAME_MACHINE=alphaev5 ;;
> +-        EV56)  UNAME_MACHINE=alphaev56 ;;
> +-        PCA56) UNAME_MACHINE=alphapca56 ;;
> +-        PCA57) UNAME_MACHINE=alphapca56 ;;
> +-        EV6)   UNAME_MACHINE=alphaev6 ;;
> +-        EV67)  UNAME_MACHINE=alphaev67 ;;
> +-        EV68*) UNAME_MACHINE=alphaev68 ;;
> +-        esac
> +-      objdump --private-headers /bin/sh | grep ld.so.1 >/dev/null
> +-      if test "$?" = 0 ; then LIBC="libc1" ; else LIBC="" ; fi
> +-      echo ${UNAME_MACHINE}-unknown-linux-gnu${LIBC}
> ++    or32:Linux:*:* | or1k*:Linux:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +     padre:Linux:*:*)
> +-      echo sparc-unknown-linux-gnu
> ++      echo sparc-unknown-linux-"$LIBC"
> ++      exit ;;
> ++    parisc64:Linux:*:* | hppa64:Linux:*:*)
> ++      echo hppa64-unknown-linux-"$LIBC"
> +       exit ;;
> +     parisc:Linux:*:* | hppa:Linux:*:*)
> +       # Look for CPU level
> +       case `grep '^cpu[^a-z]*:' /proc/cpuinfo 2>/dev/null | cut -d' ' -f2` in
> +-        PA7*) echo hppa1.1-unknown-linux-gnu ;;
> +-        PA8*) echo hppa2.0-unknown-linux-gnu ;;
> +-        *)    echo hppa-unknown-linux-gnu ;;
> ++        PA7*) echo hppa1.1-unknown-linux-"$LIBC" ;;
> ++        PA8*) echo hppa2.0-unknown-linux-"$LIBC" ;;
> ++        *)    echo hppa-unknown-linux-"$LIBC" ;;
> +       esac
> +       exit ;;
> +-    parisc64:Linux:*:* | hppa64:Linux:*:*)
> +-      echo hppa64-unknown-linux-gnu
> ++    ppc64:Linux:*:*)
> ++      echo powerpc64-unknown-linux-"$LIBC"
> ++      exit ;;
> ++    ppc:Linux:*:*)
> ++      echo powerpc-unknown-linux-"$LIBC"
> ++      exit ;;
> ++    ppc64le:Linux:*:*)
> ++      echo powerpc64le-unknown-linux-"$LIBC"
> ++      exit ;;
> ++    ppcle:Linux:*:*)
> ++      echo powerpcle-unknown-linux-"$LIBC"
> ++      exit ;;
> ++    riscv32:Linux:*:* | riscv64:Linux:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +     s390:Linux:*:* | s390x:Linux:*:*)
> +-      echo ${UNAME_MACHINE}-ibm-linux
> ++      echo "$UNAME_MACHINE"-ibm-linux-"$LIBC"
> +       exit ;;
> +     sh64*:Linux:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +     sh*:Linux:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +     sparc:Linux:*:* | sparc64:Linux:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> ++      exit ;;
> ++    tile*:Linux:*:*)
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +     vax:Linux:*:*)
> +-      echo ${UNAME_MACHINE}-dec-linux-gnu
> ++      echo "$UNAME_MACHINE"-dec-linux-"$LIBC"
> +       exit ;;
> +     x86_64:Linux:*:*)
> +-      echo x86_64-unknown-linux-gnu
> ++      echo "$UNAME_MACHINE"-pc-linux-"$LIBC"
> +       exit ;;
> +     xtensa*:Linux:*:*)
> +-      echo ${UNAME_MACHINE}-unknown-linux-gnu
> ++      echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
> +       exit ;;
> +-    i*86:Linux:*:*)
> +-      # The BFD linker knows what the default object file format is, so
> +-      # first see if it will tell us. cd to the root directory to prevent
> +-      # problems with other programs or directories called `ld' in the path.
> +-      # Set LC_ALL=C to ensure ld outputs messages in English.
> +-      ld_supported_targets=`cd /; LC_ALL=C ld --help 2>&1 \
> +-                       | sed -ne '/supported targets:/!d
> +-                                  s/[         ][      ]*/ /g
> +-                                  s/.*supported targets: *//
> +-                                  s/ .*//
> +-                                  p'`
> +-        case "$ld_supported_targets" in
> +-        elf32-i386)
> +-              TENTATIVE="${UNAME_MACHINE}-pc-linux-gnu"
> +-              ;;
> +-        a.out-i386-linux)
> +-              echo "${UNAME_MACHINE}-pc-linux-gnuaout"
> +-              exit ;;
> +-        "")
> +-              # Either a pre-BFD a.out linker (linux-gnuoldld) or
> +-              # one that does not give us useful --help.
> +-              echo "${UNAME_MACHINE}-pc-linux-gnuoldld"
> +-              exit ;;
> +-      esac
> +-      # Determine whether the default compiler is a.out or elf
> +-      eval $set_cc_for_build
> +-      sed 's/^        //' << EOF >$dummy.c
> +-      #include <features.h>
> +-      #ifdef __ELF__
> +-      # ifdef __GLIBC__
> +-      #  if __GLIBC__ >= 2
> +-      LIBC=gnu
> +-      #  else
> +-      LIBC=gnulibc1
> +-      #  endif
> +-      # else
> +-      LIBC=gnulibc1
> +-      # endif
> +-      #else
> +-      #if defined(__INTEL_COMPILER) || defined(__PGI) || defined(__SUNPRO_C) || defined(__SUNPRO_CC)
> +-      LIBC=gnu
> +-      #else
> +-      LIBC=gnuaout
> +-      #endif
> +-      #endif
> +-      #ifdef __dietlibc__
> +-      LIBC=dietlibc
> +-      #endif
> +-EOF
> +-      eval "`$CC_FOR_BUILD -E $dummy.c 2>/dev/null | sed -n '
> +-          /^LIBC/{
> +-              s: ::g
> +-              p
> +-          }'`"
> +-      test x"${LIBC}" != x && {
> +-              echo "${UNAME_MACHINE}-pc-linux-${LIBC}"
> +-              exit
> +-      }
> +-      test x"${TENTATIVE}" != x && { echo "${TENTATIVE}"; exit; }
> +-      ;;
> +     i*86:DYNIX/ptx:4*:*)
> +       # ptx 4.0 does uname -s correctly, with DYNIX/ptx in there.
> +       # earlier versions are messed up and put the nodename in both
> +@@ -1053,54 +1058,54 @@ EOF
> +       echo i386-sequent-sysv4
> +       exit ;;
> +     i*86:UNIX_SV:4.2MP:2.*)
> +-        # Unixware is an offshoot of SVR4, but it has its own version
> +-        # number series starting with 2...
> +-        # I am not positive that other SVR4 systems won't match this,
> ++      # Unixware is an offshoot of SVR4, but it has its own version
> ++      # number series starting with 2...
> ++      # I am not positive that other SVR4 systems won't match this,
> +       # I just have to hope.  -- rms.
> +-        # Use sysv4.2uw... so that sysv4* matches it.
> +-      echo ${UNAME_MACHINE}-pc-sysv4.2uw${UNAME_VERSION}
> ++      # Use sysv4.2uw... so that sysv4* matches it.
> ++      echo "$UNAME_MACHINE"-pc-sysv4.2uw"$UNAME_VERSION"
> +       exit ;;
> +     i*86:OS/2:*:*)
> +       # If we were able to find `uname', then EMX Unix compatibility
> +       # is probably installed.
> +-      echo ${UNAME_MACHINE}-pc-os2-emx
> ++      echo "$UNAME_MACHINE

