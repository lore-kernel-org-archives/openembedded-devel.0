Return-Path: <joe.macdonald@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 810B079246
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 02:42:05 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id b66-v6so2362812qkj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2018 19:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=H1yT2FOPmxBTx0Nhp4XzkvL7G+BMNLrWVhTTGtJGFow=;
	b=NlAVR6aEttuaZX3Nq2Sle9fGt/sFe8hvxR3oGNbT7OfoaFhmFsc2G7BTYqTGIuGeM+
	yOU+bAGOjJg9yWKIUsuAawDdtLTQ+A/BsHt2g/GSM2OBR4xytvu2DMjUTfTD6r5L8Fjg
	+ANy+zDo3d770LpQcPqZpoKjKrXtiGklIFcuuJh/yDX/vvzdApPkYHNXdxZpkuSAV0wp
	Zq7GOJL6T6BAlbK9TiK+/tCitpJgoBNaPhXVAORVRxRePPLL9fDc80Zzp88E8V8S40lp
	AEJip7KxHNgK3NvGrWCe3qQ+4upK8FQ6Ax5ubViHxApK/755yPZadDaFUKVciDwdHP1n
	lDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=H1yT2FOPmxBTx0Nhp4XzkvL7G+BMNLrWVhTTGtJGFow=;
	b=P2o2LWYZMTurQEvFgNuP8zRuXVOHOd5POMm76QFGiJ2iKa4irRunI5A/of0tlGl6Jn
	UID3s6XHTlhytNBf+GevUtY1w3RfIkk4lBftByjlzsgyIGZomJpHjo1y02Q0miDUxMxi
	vgyZh2shIadQb7JFXBJXQ9lDPuZ+C2NyHJOKXuGMS/OuQZSe+zrhz1pyqXs7RDdna9oP
	ja/KRyESyzSFgwFfGnUUHSnNzOeThxOq4xJB0AvzruRl2UoPReY8quYCw5JjUuymfvOL
	HKnps1S4HyzDCKjS0bVqgDuy6vm78i+/vVNw2QReUT8jzVJDYYc4Y4qrdgBZ8YBAOVUJ
	2X3w==
X-Gm-Message-State: AOUpUlEtA8HZR7fngUP37yPMTv6thDUNogo2R0hUddaWUp8NkURNpDJX
	6O+nZsjl8XTC9x9KsWUmbR+MUmk9
X-Google-Smtp-Source: AA+uWPwm2a61xNQaqMKUxvdMV6L1ssccLKZjcsmIg1VylFY7FuLE/TjTQeIrMhZiKPyH+uepDtwlQQ==
X-Received: by 2002:a37:a704:: with SMTP id
	q4-v6mr26652866qke.325.1534387324290; 
	Wed, 15 Aug 2018 19:42:04 -0700 (PDT)
Received: from burninator2.world.mentorg.com
	(fctnnbsc38w-47-55-77-12.dhcp-dynamic.fibreop.nb.bellaliant.net.
	[47.55.77.12]) by smtp.gmail.com with ESMTPSA id
	z123-v6sm15246435qke.68.2018.08.15.19.42.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 19:42:02 -0700 (PDT)
Sender: Joe MacDonald <joe.macdonald@gmail.com>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Aug 2018 22:42:00 -0400
Message-Id: <20180816024200.6394-1-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.17.1
Cc: stefan.bosak@gmail.com
Subject: [meta-networking][PATCH] bird: initial import
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
X-List-Received-Date: Thu, 16 Aug 2018 02:42:06 -0000

Initial integration of the two stable BIRD releases, 1.6.4 and 2.0.2.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

This set of recipes came my way quite a while back from Stefan Bosak.  I've
updated the recipes a bit, made them compile with MUSL and verified basic
functionality on x86_64 and qemuarm.

 .../recipes-protocols/bird/bird.inc           |   32 +
 .../recipes-protocols/bird/bird_1.6.4.bb      |    9 +
 .../recipes-protocols/bird/bird_2.0.2.bb      |    9 +
 ...-extend-config.sub-to-recognize-musl.patch | 4428 +++++++++++++++++
 .../recipes-protocols/bird/files/bird.init    |    2 +
 5 files changed, 4480 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/bird/bird.inc
 create mode 100644 meta-networking/recipes-protocols/bird/bird_1.6.4.bb
 create mode 100644 meta-networking/recipes-protocols/bird/bird_2.0.2.bb
 create mode 100644 meta-networking/recipes-protocols/bird/files/0001-musl-extend-config.sub-to-recognize-musl.patch
 create mode 100755 meta-networking/recipes-protocols/bird/files/bird.init

diff --git a/meta-networking/recipes-protocols/bird/bird.inc b/meta-networking/recipes-protocols/bird/bird.inc
new file mode 100644
index 000000000..33d17dcb7
--- /dev/null
+++ b/meta-networking/recipes-protocols/bird/bird.inc
@@ -0,0 +1,32 @@
+SUMMARY = "BIRD Internet Routing Daemon"
+DESCRIPTION = "\
+BIRD is dynamic routing daemon supporting IPv4 and IPv6 versions of routing \
+protocols BGP, RIP and OSPF."
+HOMEPAGE = "http://bird.network.cz"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README;beginline=87;endline=103;md5=0efecc23f039022580d0bac9a52f6117"
+DEPENDS = "flex bison ncurses readline"
+
+inherit autotools
+
+EXTRA_OECONF  += "\
+--enable-pthreads \
+"
+
+do_configure() {
+    oe_runconf ${EXTRA_OECONF}
+}
+
+do_install_append() {
+    install -m 0755 -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/bird.init ${D}${sysconfdir}/init.d/bird
+    rm -rf ${D}/run ${D}/var/run 
+}
+
+PACKAGES += " bird-client"
+
+FILES_${PN} += "/run /var/run"
+FILES_${PN}-client = "/usr/sbin/birdc*"
+
+RUNIT_SERVICES = "bird"
diff --git a/meta-networking/recipes-protocols/bird/bird_1.6.4.bb b/meta-networking/recipes-protocols/bird/bird_1.6.4.bb
new file mode 100644
index 000000000..27c62aeee
--- /dev/null
+++ b/meta-networking/recipes-protocols/bird/bird_1.6.4.bb
@@ -0,0 +1,9 @@
+require bird.inc
+
+SRC_URI = "\
+    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}.tar.gz \
+    file://bird.init \
+    file://0001-musl-extend-config.sub-to-recognize-musl.patch \
+    "
+SRC_URI[md5sum] = "d62ec2547338e8d3dfb934b4c7b2faa4"
+SRC_URI[sha256sum] = "c26b8caae988dba81a9dbbee93502463d4326d1b749d728d62aa5529c605afc0"
diff --git a/meta-networking/recipes-protocols/bird/bird_2.0.2.bb b/meta-networking/recipes-protocols/bird/bird_2.0.2.bb
new file mode 100644
index 000000000..92d858869
--- /dev/null
+++ b/meta-networking/recipes-protocols/bird/bird_2.0.2.bb
@@ -0,0 +1,9 @@
+require bird.inc
+
+SRC_URI = "\
+    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}.tar.gz \
+    file://bird.init \
+    file://0001-musl-extend-config.sub-to-recognize-musl.patch \
+    "
+SRC_URI[md5sum] = "de17645b045fa13912409aea59420132"
+SRC_URI[sha256sum] = "035f91d6f568f8ed438a0814235ac4c5c79147cd2acf201322c307732883480f"
diff --git a/meta-networking/recipes-protocols/bird/files/0001-musl-extend-config.sub-to-recognize-musl.patch b/meta-networking/recipes-protocols/bird/files/0001-musl-extend-config.sub-to-recognize-musl.patch
new file mode 100644
index 000000000..4feb7f786
--- /dev/null
+++ b/meta-networking/recipes-protocols/bird/files/0001-musl-extend-config.sub-to-recognize-musl.patch
@@ -0,0 +1,4428 @@
+From 21baaa6870edb68f0a417ea3b4de5c75e5cf5a0d Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Thu, 16 Aug 2018 01:56:05 +0000
+Subject: [PATCH] musl: update config.guess and config.sub
+
+Just bringing config.guess and config.sub up to date is enough to enable
+musl to build BIRD.
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+---
+ tools/config.guess | 1193 ++++++++++++++---------------
+ tools/config.sub   | 1810 +++++++++++++++++++++++---------------------
+ 2 files changed, 1520 insertions(+), 1483 deletions(-)
+
+diff --git a/tools/config.guess b/tools/config.guess
+index da83314..445c406 100755
+--- a/tools/config.guess
++++ b/tools/config.guess
+@@ -1,14 +1,12 @@
+ #! /bin/sh
+ # Attempt to guess a canonical system name.
+-#   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
+-#   2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008
+-#   Free Software Foundation, Inc.
++#   Copyright 1992-2018 Free Software Foundation, Inc.
+ 
+-timestamp='2009-04-27'
++timestamp='2018-06-26'
+ 
+ # This file is free software; you can redistribute it and/or modify it
+ # under the terms of the GNU General Public License as published by
+-# the Free Software Foundation; either version 2 of the License, or
++# the Free Software Foundation; either version 3 of the License, or
+ # (at your option) any later version.
+ #
+ # This program is distributed in the hope that it will be useful, but
+@@ -17,26 +15,22 @@ timestamp='2009-04-27'
+ # General Public License for more details.
+ #
+ # You should have received a copy of the GNU General Public License
+-# along with this program; if not, write to the Free Software
+-# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA
+-# 02110-1301, USA.
++# along with this program; if not, see <https://www.gnu.org/licenses/>.
+ #
+ # As a special exception to the GNU General Public License, if you
+ # distribute this file as part of a program that contains a
+ # configuration script generated by Autoconf, you may include it under
+-# the same distribution terms that you use for the rest of that program.
+-
+-
+-# Originally written by Per Bothner <per@bothner.com>.
+-# Please send patches to <config-patches@gnu.org>.  Submit a context
+-# diff and a properly formatted ChangeLog entry.
++# the same distribution terms that you use for the rest of that
++# program.  This Exception is an additional permission under section 7
++# of the GNU General Public License, version 3 ("GPLv3").
+ #
+-# This script attempts to guess a canonical system name similar to
+-# config.sub.  If it succeeds, it prints the system name on stdout, and
+-# exits with 0.  Otherwise, it exits with 1.
++# Originally written by Per Bothner; maintained since 2000 by Ben Elliston.
+ #
+-# The plan is that this can be called by configure scripts if you
+-# don't specify an explicit build system type.
++# You can get the latest version of this script from:
++# https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess
++#
++# Please send patches to <config-patches@gnu.org>.
++
+ 
+ me=`echo "$0" | sed -e 's,.*/,,'`
+ 
+@@ -45,7 +39,7 @@ Usage: $0 [OPTION]
+ 
+ Output the configuration name of the system \`$me' is run on.
+ 
+-Operation modes:
++Options:
+   -h, --help         print this help, then exit
+   -t, --time-stamp   print date of last modification, then exit
+   -v, --version      print version number, then exit
+@@ -56,8 +50,7 @@ version="\
+ GNU config.guess ($timestamp)
+ 
+ Originally written by Per Bothner.
+-Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
+-2002, 2003, 2004, 2005, 2006, 2007, 2008 Free Software Foundation, Inc.
++Copyright 1992-2018 Free Software Foundation, Inc.
+ 
+ This is free software; see the source for copying conditions.  There is NO
+ warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
+@@ -113,10 +106,10 @@ trap "rm -f \$tmpfiles 2>/dev/null; rmdir \$tmp 2>/dev/null; exit 1" 1 2 13 15 ;
+  { echo "$me: cannot create a temporary directory in $TMPDIR" >&2 ; exit 1 ; } ;
+ dummy=$tmp/dummy ;
+ tmpfiles="$dummy.c $dummy.o $dummy.rel $dummy" ;
+-case $CC_FOR_BUILD,$HOST_CC,$CC in
+- ,,)    echo "int x;" > $dummy.c ;
++case ${CC_FOR_BUILD-},${HOST_CC-},${CC-} in
++ ,,)    echo "int x;" > "$dummy.c" ;
+ 	for c in cc gcc c89 c99 ; do
+-	  if ($c -c -o $dummy.o $dummy.c) >/dev/null 2>&1 ; then
++	  if ($c -c -o "$dummy.o" "$dummy.c") >/dev/null 2>&1 ; then
+ 	     CC_FOR_BUILD="$c"; break ;
+ 	  fi ;
+ 	done ;
+@@ -139,12 +132,40 @@ UNAME_RELEASE=`(uname -r) 2>/dev/null` || UNAME_RELEASE=unknown
+ UNAME_SYSTEM=`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=unknown
+ UNAME_VERSION=`(uname -v) 2>/dev/null` || UNAME_VERSION=unknown
+ 
++case "$UNAME_SYSTEM" in
++Linux|GNU|GNU/*)
++	# If the system lacks a compiler, then just pick glibc.
++	# We could probably try harder.
++	LIBC=gnu
++
++	eval "$set_cc_for_build"
++	cat <<-EOF > "$dummy.c"
++	#include <features.h>
++	#if defined(__UCLIBC__)
++	LIBC=uclibc
++	#elif defined(__dietlibc__)
++	LIBC=dietlibc
++	#else
++	LIBC=gnu
++	#endif
++	EOF
++	eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^LIBC' | sed 's, ,,g'`"
++
++	# If ldd exists, use it to detect musl libc.
++	if command -v ldd >/dev/null && \
++		ldd --version 2>&1 | grep -q ^musl
++	then
++	    LIBC=musl
++	fi
++	;;
++esac
++
+ # Note: order is significant - the case branches are not exclusive.
+ 
+-case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
++case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
+     *:NetBSD:*:*)
+ 	# NetBSD (nbsd) targets should (where applicable) match one or
+-	# more of the tupples: *-*-netbsdelf*, *-*-netbsdaout*,
++	# more of the tuples: *-*-netbsdelf*, *-*-netbsdaout*,
+ 	# *-*-netbsdecoff* and *-*-netbsd*.  For targets that recently
+ 	# switched to ELF, *-*-netbsd* would select the old
+ 	# object file format.  This provides both forward
+@@ -154,23 +175,33 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
+ 	# Note: NetBSD doesn't particularly care about the vendor
+ 	# portion of the name.  We always set it to "unknown".
+ 	sysctl="sysctl -n hw.machine_arch"
+-	UNAME_MACHINE_ARCH=`(/sbin/$sysctl 2>/dev/null || \
+-	    /usr/sbin/$sysctl 2>/dev/null || echo unknown)`
+-	case "${UNAME_MACHINE_ARCH}" in
++	UNAME_MACHINE_ARCH=`(uname -p 2>/dev/null || \
++	    "/sbin/$sysctl" 2>/dev/null || \
++	    "/usr/sbin/$sysctl" 2>/dev/null || \
++	    echo unknown)`
++	case "$UNAME_MACHINE_ARCH" in
+ 	    armeb) machine=armeb-unknown ;;
+ 	    arm*) machine=arm-unknown ;;
+ 	    sh3el) machine=shl-unknown ;;
+ 	    sh3eb) machine=sh-unknown ;;
+ 	    sh5el) machine=sh5le-unknown ;;
+-	    *) machine=${UNAME_MACHINE_ARCH}-unknown ;;
++	    earmv*)
++		arch=`echo "$UNAME_MACHINE_ARCH" | sed -e 's,^e\(armv[0-9]\).*$,\1,'`
++		endian=`echo "$UNAME_MACHINE_ARCH" | sed -ne 's,^.*\(eb\)$,\1,p'`
++		machine="${arch}${endian}"-unknown
++		;;
++	    *) machine="$UNAME_MACHINE_ARCH"-unknown ;;
+ 	esac
+ 	# The Operating System including object format, if it has switched
+-	# to ELF recently, or will in the future.
+-	case "${UNAME_MACHINE_ARCH}" in
++	# to ELF recently (or will in the future) and ABI.
++	case "$UNAME_MACHINE_ARCH" in
++	    earm*)
++		os=netbsdelf
++		;;
+ 	    arm*|i386|m68k|ns32k|sh3*|sparc|vax)
+-		eval $set_cc_for_build
++		eval "$set_cc_for_build"
+ 		if echo __ELF__ | $CC_FOR_BUILD -E - 2>/dev/null \
+-			| grep __ELF__ >/dev/null
++			| grep -q __ELF__
+ 		then
+ 		    # Once all utilities can be ECOFF (netbsdecoff) or a.out (netbsdaout).
+ 		    # Return netbsd for either.  FIX?
+@@ -180,7 +211,14 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
+ 		fi
+ 		;;
+ 	    *)
+-	        os=netbsd
++		os=netbsd
++		;;
++	esac
++	# Determine ABI tags.
++	case "$UNAME_MACHINE_ARCH" in
++	    earm*)
++		expr='s/^earmv[0-9]/-eabi/;s/eb$//'
++		abi=`echo "$UNAME_MACHINE_ARCH" | sed -e "$expr"`
+ 		;;
+ 	esac
+ 	# The OS release
+@@ -188,42 +226,62 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
+ 	# thus, need a distinct triplet. However, they do not need
+ 	# kernel version information, so it can be replaced with a
+ 	# suitable tag, in the style of linux-gnu.
+-	case "${UNAME_VERSION}" in
++	case "$UNAME_VERSION" in
+ 	    Debian*)
+ 		release='-gnu'
+ 		;;
+ 	    *)
+-		release=`echo ${UNAME_RELEASE}|sed -e 's/[-_].*/\./'`
++		release=`echo "$UNAME_RELEASE" | sed -e 's/[-_].*//' | cut -d. -f1,2`
+ 		;;
+ 	esac
+ 	# Since CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM:
+ 	# contains redundant information, the shorter form:
+ 	# CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM is used.
+-	echo "${machine}-${os}${release}"
++	echo "$machine-${os}${release}${abi-}"
++	exit ;;
++    *:Bitrig:*:*)
++	UNAME_MACHINE_ARCH=`arch | sed 's/Bitrig.//'`
++	echo "$UNAME_MACHINE_ARCH"-unknown-bitrig"$UNAME_RELEASE"
+ 	exit ;;
+     *:OpenBSD:*:*)
+ 	UNAME_MACHINE_ARCH=`arch | sed 's/OpenBSD.//'`
+-	echo ${UNAME_MACHINE_ARCH}-unknown-openbsd${UNAME_RELEASE}
++	echo "$UNAME_MACHINE_ARCH"-unknown-openbsd"$UNAME_RELEASE"
++	exit ;;
++    *:LibertyBSD:*:*)
++	UNAME_MACHINE_ARCH=`arch | sed 's/^.*BSD\.//'`
++	echo "$UNAME_MACHINE_ARCH"-unknown-libertybsd"$UNAME_RELEASE"
++	exit ;;
++    *:MidnightBSD:*:*)
++	echo "$UNAME_MACHINE"-unknown-midnightbsd"$UNAME_RELEASE"
+ 	exit ;;
+     *:ekkoBSD:*:*)
+-	echo ${UNAME_MACHINE}-unknown-ekkobsd${UNAME_RELEASE}
++	echo "$UNAME_MACHINE"-unknown-ekkobsd"$UNAME_RELEASE"
+ 	exit ;;
+     *:SolidBSD:*:*)
+-	echo ${UNAME_MACHINE}-unknown-solidbsd${UNAME_RELEASE}
++	echo "$UNAME_MACHINE"-unknown-solidbsd"$UNAME_RELEASE"
+ 	exit ;;
+     macppc:MirBSD:*:*)
+-	echo powerpc-unknown-mirbsd${UNAME_RELEASE}
++	echo powerpc-unknown-mirbsd"$UNAME_RELEASE"
+ 	exit ;;
+     *:MirBSD:*:*)
+-	echo ${UNAME_MACHINE}-unknown-mirbsd${UNAME_RELEASE}
++	echo "$UNAME_MACHINE"-unknown-mirbsd"$UNAME_RELEASE"
+ 	exit ;;
++    *:Sortix:*:*)
++	echo "$UNAME_MACHINE"-unknown-sortix
++	exit ;;
++    *:Redox:*:*)
++	echo "$UNAME_MACHINE"-unknown-redox
++	exit ;;
++    mips:OSF1:*.*)
++        echo mips-dec-osf1
++        exit ;;
+     alpha:OSF1:*:*)
+ 	case $UNAME_RELEASE in
+ 	*4.0)
+ 		UNAME_RELEASE=`/usr/sbin/sizer -v | awk '{print $3}'`
+ 		;;
+ 	*5.*)
+-	        UNAME_RELEASE=`/usr/sbin/sizer -v | awk '{print $4}'`
++		UNAME_RELEASE=`/usr/sbin/sizer -v | awk '{print $4}'`
+ 		;;
+ 	esac
+ 	# According to Compaq, /usr/sbin/psrinfo has been available on
+@@ -233,60 +291,54 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
+ 	ALPHA_CPU_TYPE=`/usr/sbin/psrinfo -v | sed -n -e 's/^  The alpha \(.*\) processor.*$/\1/p' | head -n 1`
+ 	case "$ALPHA_CPU_TYPE" in
+ 	    "EV4 (21064)")
+-		UNAME_MACHINE="alpha" ;;
++		UNAME_MACHINE=alpha ;;
+ 	    "EV4.5 (21064)")
+-		UNAME_MACHINE="alpha" ;;
++		UNAME_MACHINE=alpha ;;
+ 	    "LCA4 (21066/21068)")
+-		UNAME_MACHINE="alpha" ;;
++		UNAME_MACHINE=alpha ;;
+ 	    "EV5 (21164)")
+-		UNAME_MACHINE="alphaev5" ;;
++		UNAME_MACHINE=alphaev5 ;;
+ 	    "EV5.6 (21164A)")
+-		UNAME_MACHINE="alphaev56" ;;
++		UNAME_MACHINE=alphaev56 ;;
+ 	    "EV5.6 (21164PC)")
+-		UNAME_MACHINE="alphapca56" ;;
++		UNAME_MACHINE=alphapca56 ;;
+ 	    "EV5.7 (21164PC)")
+-		UNAME_MACHINE="alphapca57" ;;
++		UNAME_MACHINE=alphapca57 ;;
+ 	    "EV6 (21264)")
+-		UNAME_MACHINE="alphaev6" ;;
++		UNAME_MACHINE=alphaev6 ;;
+ 	    "EV6.7 (21264A)")
+-		UNAME_MACHINE="alphaev67" ;;
++		UNAME_MACHINE=alphaev67 ;;
+ 	    "EV6.8CB (21264C)")
+-		UNAME_MACHINE="alphaev68" ;;
++		UNAME_MACHINE=alphaev68 ;;
+ 	    "EV6.8AL (21264B)")
+-		UNAME_MACHINE="alphaev68" ;;
++		UNAME_MACHINE=alphaev68 ;;
+ 	    "EV6.8CX (21264D)")
+-		UNAME_MACHINE="alphaev68" ;;
++		UNAME_MACHINE=alphaev68 ;;
+ 	    "EV6.9A (21264/EV69A)")
+-		UNAME_MACHINE="alphaev69" ;;
++		UNAME_MACHINE=alphaev69 ;;
+ 	    "EV7 (21364)")
+-		UNAME_MACHINE="alphaev7" ;;
++		UNAME_MACHINE=alphaev7 ;;
+ 	    "EV7.9 (21364A)")
+-		UNAME_MACHINE="alphaev79" ;;
++		UNAME_MACHINE=alphaev79 ;;
+ 	esac
+ 	# A Pn.n version is a patched version.
+ 	# A Vn.n version is a released version.
+ 	# A Tn.n version is a released field test version.
+ 	# A Xn.n version is an unreleased experimental baselevel.
+ 	# 1.2 uses "1.2" for uname -r.
+-	echo ${UNAME_MACHINE}-dec-osf`echo ${UNAME_RELEASE} | sed -e 's/^[PVTX]//' | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'`
+-	exit ;;
+-    Alpha\ *:Windows_NT*:*)
+-	# How do we know it's Interix rather than the generic POSIX subsystem?
+-	# Should we change UNAME_MACHINE based on the output of uname instead
+-	# of the specific Alpha model?
+-	echo alpha-pc-interix
+-	exit ;;
+-    21064:Windows_NT:50:3)
+-	echo alpha-dec-winnt3.5
+-	exit ;;
++	echo "$UNAME_MACHINE"-dec-osf"`echo "$UNAME_RELEASE" | sed -e 's/^[PVTX]//' | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz`"
++	# Reset EXIT trap before exiting to avoid spurious non-zero exit code.
++	exitcode=$?
++	trap '' 0
++	exit $exitcode ;;
+     Amiga*:UNIX_System_V:4.0:*)
+ 	echo m68k-unknown-sysv4
+ 	exit ;;
+     *:[Aa]miga[Oo][Ss]:*:*)
+-	echo ${UNAME_MACHINE}-unknown-amigaos
++	echo "$UNAME_MACHINE"-unknown-amigaos
+ 	exit ;;
+     *:[Mm]orph[Oo][Ss]:*:*)
+-	echo ${UNAME_MACHINE}-unknown-morphos
++	echo "$UNAME_MACHINE"-unknown-morphos
+ 	exit ;;
+     *:OS/390:*:*)
+ 	echo i370-ibm-openedition
+@@ -295,12 +347,12 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
+ 	echo s390-ibm-zvmoe
+ 	exit ;;
+     *:OS400:*:*)
+-        echo powerpc-ibm-os400
++	echo powerpc-ibm-os400
+ 	exit ;;
+     arm:RISC*:1.[012]*:*|arm:riscix:1.[012]*:*)
+-	echo arm-acorn-riscix${UNAME_RELEASE}
++	echo arm-acorn-riscix"$UNAME_RELEASE"
+ 	exit ;;
+-    arm:riscos:*:*|arm:RISCOS:*:*)
++    arm*:riscos:*:*|arm*:RISCOS:*:*)
+ 	echo arm-unknown-riscos
+ 	exit ;;
+     SR2?01:HI-UX/MPP:*:* | SR8000:HI-UX/MPP:*:*)
+@@ -325,35 +377,38 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
+ 	    sparc) echo sparc-icl-nx7; exit ;;
+ 	esac ;;
+     s390x:SunOS:*:*)
+-	echo ${UNAME_MACHINE}-ibm-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
++	echo "$UNAME_MACHINE"-ibm-solaris2"`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`"
+ 	exit ;;
+     sun4H:SunOS:5.*:*)
+-	echo sparc-hal-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
++	echo sparc-hal-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
+ 	exit ;;
+     sun4*:SunOS:5.*:* | tadpole*:SunOS:5.*:*)
+-	echo sparc-sun-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
++	echo sparc-sun-solaris2"`echo "$UNAME_RELEASE" | sed -e 's/[^.]*//'`"
++	exit ;;
++    i86pc:AuroraUX:5.*:* | i86xen:AuroraUX:5.*:*)
++	echo i386-pc-auroraux"$UNAME_RELEASE"
+ 	exit ;;
+     i86pc:SunOS:5.*:* | i86xen:SunOS:5.*:*)
+-	eval $set_cc_for_build
+-	SUN_ARCH="i386"
++	eval "$set_cc_for_build"
++	SUN_ARCH=i386
+ 	# If there is a compiler, see if it is configured for 64-bit objects.
+ 	# Note that the Sun cc does not turn __LP64__ into 1 like gcc does.
+ 	# This test works for both compilers.
+-	if [ "$CC_FOR_BUILD" != 'no_compiler_found' ]; then
++	if [ "$CC_FOR_BUILD" != no_compiler_found ]; then
+ 	    if (echo '#ifdef __amd64'; echo IS_64BIT_ARCH; echo '#endif') | \
+-		(CCOPTS= $CC_FOR_BUILD -E - 2>/dev/null) | \
++		(CCOPTS="" $CC_FOR_BUILD -E - 2>/dev/null) | \
+ 		grep IS_64BIT_ARCH >/dev/null
+ 	    then
+-		SUN_ARCH="x86_64"
++		SUN_ARCH=x86_64
+ 	    fi
+ 	fi
+-	echo ${SUN_ARCH}-pc-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
++	echo "$SUN_ARCH"-pc-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
+ 	exit ;;
+     sun4*:SunOS:6*:*)
+ 	# According to config.sub, this is the proper way to canonicalize
+ 	# SunOS6.  Hard to guess exactly what SunOS6 will be like, but
+ 	# it's likely to be more like Solaris than SunOS4.
+-	echo sparc-sun-solaris3`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
++	echo sparc-sun-solaris3"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
+ 	exit ;;
+     sun4*:SunOS:*:*)
+ 	case "`/usr/bin/arch -k`" in
+@@ -362,25 +417,25 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
+ 		;;
+ 	esac
+ 	# Japanese Language versions have a version number like `4.1.3-JL'.
+-	echo sparc-sun-sunos`echo ${UNAME_RELEASE}|sed -e 's/-/_/'`
++	echo sparc-sun-sunos"`echo "$UNAME_RELEASE"|sed -e 's/-/_/'`"
+ 	exit ;;
+     sun3*:SunOS:*:*)
+-	echo m68k-sun-sunos${UNAME_RELEASE}
++	echo m68k-sun-sunos"$UNAME_RELEASE"
+ 	exit ;;
+     sun*:*:4.2BSD:*)
+ 	UNAME_RELEASE=`(sed 1q /etc/motd | awk '{print substr($5,1,3)}') 2>/dev/null`
+-	test "x${UNAME_RELEASE}" = "x" && UNAME_RELEASE=3
++	test "x$UNAME_RELEASE" = x && UNAME_RELEASE=3
+ 	case "`/bin/arch`" in
+ 	    sun3)
+-		echo m68k-sun-sunos${UNAME_RELEASE}
++		echo m68k-sun-sunos"$UNAME_RELEASE"
+ 		;;
+ 	    sun4)
+-		echo sparc-sun-sunos${UNAME_RELEASE}
++		echo sparc-sun-sunos"$UNAME_RELEASE"
+ 		;;
+ 	esac
+ 	exit ;;
+     aushp:SunOS:*:*)
+-	echo sparc-auspex-sunos${UNAME_RELEASE}
++	echo sparc-auspex-sunos"$UNAME_RELEASE"
+ 	exit ;;
+     # The situation for MiNT is a little confusing.  The machine name
+     # can be virtually everything (everything which is not
+@@ -391,44 +446,44 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
+     # MiNT.  But MiNT is downward compatible to TOS, so this should
+     # be no problem.
+     atarist[e]:*MiNT:*:* | atarist[e]:*mint:*:* | atarist[e]:*TOS:*:*)
+-        echo m68k-atari-mint${UNAME_RELEASE}
++	echo m68k-atari-mint"$UNAME_RELEASE"
+ 	exit ;;
+     atari*:*MiNT:*:* | atari*:*mint:*:* | atarist[e]:*TOS:*:*)
+-	echo m68k-atari-mint${UNAME_RELEASE}
+-        exit ;;
++	echo m68k-atari-mint"$UNAME_RELEASE"
++	exit ;;
+     *falcon*:*MiNT:*:* | *falcon*:*mint:*:* | *falcon*:*TOS:*:*)
+-        echo m68k-atari-mint${UNAME_RELEASE}
++	echo m68k-atari-mint"$UNAME_RELEASE"
+ 	exit ;;
+     milan*:*MiNT:*:* | milan*:*mint:*:* | *milan*:*TOS:*:*)
+-        echo m68k-milan-mint${UNAME_RELEASE}
+-        exit ;;
++	echo m68k-milan-mint"$UNAME_RELEASE"
++	exit ;;
+     hades*:*MiNT:*:* | hades*:*mint:*:* | *hades*:*TOS:*:*)
+-        echo m68k-hades-mint${UNAME_RELEASE}
+-        exit ;;
++	echo m68k-hades-mint"$UNAME_RELEASE"
++	exit ;;
+     *:*MiNT:*:* | *:*mint:*:* | *:*TOS:*:*)
+-        echo m68k-unknown-mint${UNAME_RELEASE}
+-        exit ;;
++	echo m68k-unknown-mint"$UNAME_RELEASE"
++	exit ;;
+     m68k:machten:*:*)
+-	echo m68k-apple-machten${UNAME_RELEASE}
++	echo m68k-apple-machten"$UNAME_RELEASE"
+ 	exit ;;
+     powerpc:machten:*:*)
+-	echo powerpc-apple-machten${UNAME_RELEASE}
++	echo powerpc-apple-machten"$UNAME_RELEASE"
+ 	exit ;;
+     RISC*:Mach:*:*)
+ 	echo mips-dec-mach_bsd4.3
+ 	exit ;;
+     RISC*:ULTRIX:*:*)
+-	echo mips-dec-ultrix${UNAME_RELEASE}
++	echo mips-dec-ultrix"$UNAME_RELEASE"
+ 	exit ;;
+     VAX*:ULTRIX*:*:*)
+-	echo vax-dec-ultrix${UNAME_RELEASE}
++	echo vax-dec-ultrix"$UNAME_RELEASE"
+ 	exit ;;
+     2020:CLIX:*:* | 2430:CLIX:*:*)
+-	echo clipper-intergraph-clix${UNAME_RELEASE}
++	echo clipper-intergraph-clix"$UNAME_RELEASE"
+ 	exit ;;
+     mips:*:*:UMIPS | mips:*:*:RISCos)
+-	eval $set_cc_for_build
+-	sed 's/^	//' << EOF >$dummy.c
++	eval "$set_cc_for_build"
++	sed 's/^	//' << EOF > "$dummy.c"
+ #ifdef __cplusplus
+ #include <stdio.h>  /* for printf() prototype */
+ 	int main (int argc, char *argv[]) {
+@@ -437,23 +492,23 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
+ #endif
+ 	#if defined (host_mips) && defined (MIPSEB)
+ 	#if defined (SYSTYPE_SYSV)
+-	  printf ("mips-mips-riscos%ssysv\n", argv[1]); exit (0);
++	  printf ("mips-mips-riscos%ssysv\\n", argv[1]); exit (0);
+ 	#endif
+ 	#if defined (SYSTYPE_SVR4)
+-	  printf ("mips-mips-riscos%ssvr4\n", argv[1]); exit (0);
++	  printf ("mips-mips-riscos%ssvr4\\n", argv[1]); exit (0);
+ 	#endif
+ 	#if defined (SYSTYPE_BSD43) || defined(SYSTYPE_BSD)
+-	  printf ("mips-mips-riscos%sbsd\n", argv[1]); exit (0);
++	  printf ("mips-mips-riscos%sbsd\\n", argv[1]); exit (0);
+ 	#endif
+ 	#endif
+ 	  exit (-1);
+ 	}
+ EOF
+-	$CC_FOR_BUILD -o $dummy $dummy.c &&
+-	  dummyarg=`echo "${UNAME_RELEASE}" | sed -n 's/\([0-9]*\).*/\1/p'` &&
+-	  SYSTEM_NAME=`$dummy $dummyarg` &&
++	$CC_FOR_BUILD -o "$dummy" "$dummy.c" &&
++	  dummyarg=`echo "$UNAME_RELEASE" | sed -n 's/\([0-9]*\).*/\1/p'` &&
++	  SYSTEM_NAME=`"$dummy" "$dummyarg"` &&
+ 	    { echo "$SYSTEM_NAME"; exit; }
+-	echo mips-mips-riscos${UNAME_RELEASE}
++	echo mips-mips-riscos"$UNAME_RELEASE"
+ 	exit ;;
+     Motorola:PowerMAX_OS:*:*)
+ 	echo powerpc-motorola-powermax
+@@ -477,21 +532,21 @@ EOF
+ 	echo m88k-motorola-sysv3
+ 	exit ;;
+     AViiON:dgux:*:*)
+-        # DG/UX returns AViiON for all architectures
+-        UNAME_PROCESSOR=`/usr/bin/uname -p`
+-	if [ $UNAME_PROCESSOR = mc88100 ] || [ $UNAME_PROCESSOR = mc88110 ]
++	# DG/UX returns AViiON for all architectures
++	UNAME_PROCESSOR=`/usr/bin/uname -p`
++	if [ "$UNAME_PROCESSOR" = mc88100 ] || [ "$UNAME_PROCESSOR" = mc88110 ]
+ 	then
+-	    if [ ${TARGET_BINARY_INTERFACE}x = m88kdguxelfx ] || \
+-	       [ ${TARGET_BINARY_INTERFACE}x = x ]
++	    if [ "$TARGET_BINARY_INTERFACE"x = m88kdguxelfx ] || \
++	       [ "$TARGET_BINARY_INTERFACE"x = x ]
+ 	    then
+-		echo m88k-dg-dgux${UNAME_RELEASE}
++		echo m88k-dg-dgux"$UNAME_RELEASE"
+ 	    else
+-		echo m88k-dg-dguxbcs${UNAME_RELEASE}
++		echo m88k-dg-dguxbcs"$UNAME_RELEASE"
+ 	    fi
+ 	else
+-	    echo i586-dg-dgux${UNAME_RELEASE}
++	    echo i586-dg-dgux"$UNAME_RELEASE"
+ 	fi
+- 	exit ;;
++	exit ;;
+     M88*:DolphinOS:*:*)	# DolphinOS (SVR3)
+ 	echo m88k-dolphin-sysv3
+ 	exit ;;
+@@ -506,7 +561,7 @@ EOF
+ 	echo m68k-tektronix-bsd
+ 	exit ;;
+     *:IRIX*:*:*)
+-	echo mips-sgi-irix`echo ${UNAME_RELEASE}|sed -e 's/-/_/g'`
++	echo mips-sgi-irix"`echo "$UNAME_RELEASE"|sed -e 's/-/_/g'`"
+ 	exit ;;
+     ????????:AIX?:[12].1:2)   # AIX 2.2.1 or AIX 2.1.1 is RT/PC AIX.
+ 	echo romp-ibm-aix     # uname -m gives an 8 hex-code CPU id
+@@ -518,14 +573,14 @@ EOF
+ 	if [ -x /usr/bin/oslevel ] ; then
+ 		IBM_REV=`/usr/bin/oslevel`
+ 	else
+-		IBM_REV=${UNAME_VERSION}.${UNAME_RELEASE}
++		IBM_REV="$UNAME_VERSION.$UNAME_RELEASE"
+ 	fi
+-	echo ${UNAME_MACHINE}-ibm-aix${IBM_REV}
++	echo "$UNAME_MACHINE"-ibm-aix"$IBM_REV"
+ 	exit ;;
+     *:AIX:2:3)
+ 	if grep bos325 /usr/include/stdio.h >/dev/null 2>&1; then
+-		eval $set_cc_for_build
+-		sed 's/^		//' << EOF >$dummy.c
++		eval "$set_cc_for_build"
++		sed 's/^		//' << EOF > "$dummy.c"
+ 		#include <sys/systemcfg.h>
+ 
+ 		main()
+@@ -536,7 +591,7 @@ EOF
+ 			exit(0);
+ 			}
+ EOF
+-		if $CC_FOR_BUILD -o $dummy $dummy.c && SYSTEM_NAME=`$dummy`
++		if $CC_FOR_BUILD -o "$dummy" "$dummy.c" && SYSTEM_NAME=`"$dummy"`
+ 		then
+ 			echo "$SYSTEM_NAME"
+ 		else
+@@ -548,28 +603,29 @@ EOF
+ 		echo rs6000-ibm-aix3.2
+ 	fi
+ 	exit ;;
+-    *:AIX:*:[456])
++    *:AIX:*:[4567])
+ 	IBM_CPU_ID=`/usr/sbin/lsdev -C -c processor -S available | sed 1q | awk '{ print $1 }'`
+-	if /usr/sbin/lsattr -El ${IBM_CPU_ID} | grep ' POWER' >/dev/null 2>&1; then
++	if /usr/sbin/lsattr -El "$IBM_CPU_ID" | grep ' POWER' >/dev/null 2>&1; then
+ 		IBM_ARCH=rs6000
+ 	else
+ 		IBM_ARCH=powerpc
+ 	fi
+-	if [ -x /usr/bin/oslevel ] ; then
+-		IBM_REV=`/usr/bin/oslevel`
++	if [ -x /usr/bin/lslpp ] ; then
++		IBM_REV=`/usr/bin/lslpp -Lqc bos.rte.libc |
++			   awk -F: '{ print $3 }' | sed s/[0-9]*$/0/`
+ 	else
+-		IBM_REV=${UNAME_VERSION}.${UNAME_RELEASE}
++		IBM_REV="$UNAME_VERSION.$UNAME_RELEASE"
+ 	fi
+-	echo ${IBM_ARCH}-ibm-aix${IBM_REV}
++	echo "$IBM_ARCH"-ibm-aix"$IBM_REV"
+ 	exit ;;
+     *:AIX:*:*)
+ 	echo rs6000-ibm-aix
+ 	exit ;;
+-    ibmrt:4.4BSD:*|romp-ibm:BSD:*)
++    ibmrt:4.4BSD:*|romp-ibm:4.4BSD:*)
+ 	echo romp-ibm-bsd4.4
+ 	exit ;;
+     ibmrt:*BSD:*|romp-ibm:BSD:*)            # covers RT/PC BSD and
+-	echo romp-ibm-bsd${UNAME_RELEASE}   # 4.3 with uname added to
++	echo romp-ibm-bsd"$UNAME_RELEASE"   # 4.3 with uname added to
+ 	exit ;;                             # report: romp-ibm BSD 4.3
+     *:BOSX:*:*)
+ 	echo rs6000-bull-bosx
+@@ -584,67 +640,67 @@ EOF
+ 	echo m68k-hp-bsd4.4
+ 	exit ;;
+     9000/[34678]??:HP-UX:*:*)
+-	HPUX_REV=`echo ${UNAME_RELEASE}|sed -e 's/[^.]*.[0B]*//'`
+-	case "${UNAME_MACHINE}" in
+-	    9000/31? )            HP_ARCH=m68000 ;;
+-	    9000/[34]?? )         HP_ARCH=m68k ;;
++	HPUX_REV=`echo "$UNAME_RELEASE"|sed -e 's/[^.]*.[0B]*//'`
++	case "$UNAME_MACHINE" in
++	    9000/31?)            HP_ARCH=m68000 ;;
++	    9000/[34]??)         HP_ARCH=m68k ;;
+ 	    9000/[678][0-9][0-9])
+ 		if [ -x /usr/bin/getconf ]; then
+ 		    sc_cpu_version=`/usr/bin/getconf SC_CPU_VERSION 2>/dev/null`
+-                    sc_kernel_bits=`/usr/bin/getconf SC_KERNEL_BITS 2>/dev/null`
+-                    case "${sc_cpu_version}" in
+-                      523) HP_ARCH="hppa1.0" ;; # CPU_PA_RISC1_0
+-                      528) HP_ARCH="hppa1.1" ;; # CPU_PA_RISC1_1
+-                      532)                      # CPU_PA_RISC2_0
+-                        case "${sc_kernel_bits}" in
+-                          32) HP_ARCH="hppa2.0n" ;;
+-                          64) HP_ARCH="hppa2.0w" ;;
+-			  '') HP_ARCH="hppa2.0" ;;   # HP-UX 10.20
+-                        esac ;;
+-                    esac
++		    sc_kernel_bits=`/usr/bin/getconf SC_KERNEL_BITS 2>/dev/null`
++		    case "$sc_cpu_version" in
++		      523) HP_ARCH=hppa1.0 ;; # CPU_PA_RISC1_0
++		      528) HP_ARCH=hppa1.1 ;; # CPU_PA_RISC1_1
++		      532)                      # CPU_PA_RISC2_0
++			case "$sc_kernel_bits" in
++			  32) HP_ARCH=hppa2.0n ;;
++			  64) HP_ARCH=hppa2.0w ;;
++			  '') HP_ARCH=hppa2.0 ;;   # HP-UX 10.20
++			esac ;;
++		    esac
+ 		fi
+-		if [ "${HP_ARCH}" = "" ]; then
+-		    eval $set_cc_for_build
+-		    sed 's/^              //' << EOF >$dummy.c
++		if [ "$HP_ARCH" = "" ]; then
++		    eval "$set_cc_for_build"
++		    sed 's/^		//' << EOF > "$dummy.c"
+ 
+-              #define _HPUX_SOURCE
+-              #include <stdlib.h>
+-              #include <unistd.h>
++		#define _HPUX_SOURCE
++		#include <stdlib.h>
++		#include <unistd.h>
+ 
+-              int main ()
+-              {
+-              #if defined(_SC_KERNEL_BITS)
+-                  long bits = sysconf(_SC_KERNEL_BITS);
+-              #endif
+-                  long cpu  = sysconf (_SC_CPU_VERSION);
++		int main ()
++		{
++		#if defined(_SC_KERNEL_BITS)
++		    long bits = sysconf(_SC_KERNEL_BITS);
++		#endif
++		    long cpu  = sysconf (_SC_CPU_VERSION);
+ 
+-                  switch (cpu)
+-              	{
+-              	case CPU_PA_RISC1_0: puts ("hppa1.0"); break;
+-              	case CPU_PA_RISC1_1: puts ("hppa1.1"); break;
+-              	case CPU_PA_RISC2_0:
+-              #if defined(_SC_KERNEL_BITS)
+-              	    switch (bits)
+-              		{
+-              		case 64: puts ("hppa2.0w"); break;
+-              		case 32: puts ("hppa2.0n"); break;
+-              		default: puts ("hppa2.0"); break;
+-              		} break;
+-              #else  /* !defined(_SC_KERNEL_BITS) */
+-              	    puts ("hppa2.0"); break;
+-              #endif
+-              	default: puts ("hppa1.0"); break;
+-              	}
+-                  exit (0);
+-              }
++		    switch (cpu)
++			{
++			case CPU_PA_RISC1_0: puts ("hppa1.0"); break;
++			case CPU_PA_RISC1_1: puts ("hppa1.1"); break;
++			case CPU_PA_RISC2_0:
++		#if defined(_SC_KERNEL_BITS)
++			    switch (bits)
++				{
++				case 64: puts ("hppa2.0w"); break;
++				case 32: puts ("hppa2.0n"); break;
++				default: puts ("hppa2.0"); break;
++				} break;
++		#else  /* !defined(_SC_KERNEL_BITS) */
++			    puts ("hppa2.0"); break;
++		#endif
++			default: puts ("hppa1.0"); break;
++			}
++		    exit (0);
++		}
+ EOF
+-		    (CCOPTS= $CC_FOR_BUILD -o $dummy $dummy.c 2>/dev/null) && HP_ARCH=`$dummy`
++		    (CCOPTS="" $CC_FOR_BUILD -o "$dummy" "$dummy.c" 2>/dev/null) && HP_ARCH=`"$dummy"`
+ 		    test -z "$HP_ARCH" && HP_ARCH=hppa
+ 		fi ;;
+ 	esac
+-	if [ ${HP_ARCH} = "hppa2.0w" ]
++	if [ "$HP_ARCH" = hppa2.0w ]
+ 	then
+-	    eval $set_cc_for_build
++	    eval "$set_cc_for_build"
+ 
+ 	    # hppa2.0w-hp-hpux* has a 64-bit kernel and a compiler generating
+ 	    # 32-bit code.  hppa64-hp-hpux* has the same kernel and a compiler
+@@ -655,23 +711,23 @@ EOF
+ 	    # $ CC_FOR_BUILD="cc +DA2.0w" ./config.guess
+ 	    # => hppa64-hp-hpux11.23
+ 
+-	    if echo __LP64__ | (CCOPTS= $CC_FOR_BUILD -E - 2>/dev/null) |
+-		grep __LP64__ >/dev/null
++	    if echo __LP64__ | (CCOPTS="" $CC_FOR_BUILD -E - 2>/dev/null) |
++		grep -q __LP64__
+ 	    then
+-		HP_ARCH="hppa2.0w"
++		HP_ARCH=hppa2.0w
+ 	    else
+-		HP_ARCH="hppa64"
++		HP_ARCH=hppa64
+ 	    fi
+ 	fi
+-	echo ${HP_ARCH}-hp-hpux${HPUX_REV}
++	echo "$HP_ARCH"-hp-hpux"$HPUX_REV"
+ 	exit ;;
+     ia64:HP-UX:*:*)
+-	HPUX_REV=`echo ${UNAME_RELEASE}|sed -e 's/[^.]*.[0B]*//'`
+-	echo ia64-hp-hpux${HPUX_REV}
++	HPUX_REV=`echo "$UNAME_RELEASE"|sed -e 's/[^.]*.[0B]*//'`
++	echo ia64-hp-hpux"$HPUX_REV"
+ 	exit ;;
+     3050*:HI-UX:*:*)
+-	eval $set_cc_for_build
+-	sed 's/^	//' << EOF >$dummy.c
++	eval "$set_cc_for_build"
++	sed 's/^	//' << EOF > "$dummy.c"
+ 	#include <unistd.h>
+ 	int
+ 	main ()
+@@ -696,11 +752,11 @@ EOF
+ 	  exit (0);
+ 	}
+ EOF
+-	$CC_FOR_BUILD -o $dummy $dummy.c && SYSTEM_NAME=`$dummy` &&
++	$CC_FOR_BUILD -o "$dummy" "$dummy.c" && SYSTEM_NAME=`"$dummy"` &&
+ 		{ echo "$SYSTEM_NAME"; exit; }
+ 	echo unknown-hitachi-hiuxwe2
+ 	exit ;;
+-    9000/7??:4.3bsd:*:* | 9000/8?[79]:4.3bsd:*:* )
++    9000/7??:4.3bsd:*:* | 9000/8?[79]:4.3bsd:*:*)
+ 	echo hppa1.1-hp-bsd
+ 	exit ;;
+     9000/8??:4.3bsd:*:*)
+@@ -709,7 +765,7 @@ EOF
+     *9??*:MPE/iX:*:* | *3000*:MPE/iX:*:*)
+ 	echo hppa1.0-hp-mpeix
+ 	exit ;;
+-    hp7??:OSF1:*:* | hp8?[79]:OSF1:*:* )
++    hp7??:OSF1:*:* | hp8?[79]:OSF1:*:*)
+ 	echo hppa1.1-hp-osf
+ 	exit ;;
+     hp8??:OSF1:*:*)
+@@ -717,9 +773,9 @@ EOF
+ 	exit ;;
+     i*86:OSF1:*:*)
+ 	if [ -x /usr/sbin/sysversion ] ; then
+-	    echo ${UNAME_MACHINE}-unknown-osf1mk
++	    echo "$UNAME_MACHINE"-unknown-osf1mk
+ 	else
+-	    echo ${UNAME_MACHINE}-unknown-osf1
++	    echo "$UNAME_MACHINE"-unknown-osf1
+ 	fi
+ 	exit ;;
+     parisc*:Lites*:*:*)
+@@ -727,325 +783,274 @@ EOF
+ 	exit ;;
+     C1*:ConvexOS:*:* | convex:ConvexOS:C1*:*)
+ 	echo c1-convex-bsd
+-        exit ;;
++	exit ;;
+     C2*:ConvexOS:*:* | convex:ConvexOS:C2*:*)
+ 	if getsysinfo -f scalar_acc
+ 	then echo c32-convex-bsd
+ 	else echo c2-convex-bsd
+ 	fi
+-        exit ;;
++	exit ;;
+     C34*:ConvexOS:*:* | convex:ConvexOS:C34*:*)
+ 	echo c34-convex-bsd
+-        exit ;;
++	exit ;;
+     C38*:ConvexOS:*:* | convex:ConvexOS:C38*:*)
+ 	echo c38-convex-bsd
+-        exit ;;
++	exit ;;
+     C4*:ConvexOS:*:* | convex:ConvexOS:C4*:*)
+ 	echo c4-convex-bsd
+-        exit ;;
++	exit ;;
+     CRAY*Y-MP:*:*:*)
+-	echo ymp-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
++	echo ymp-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
+ 	exit ;;
+     CRAY*[A-Z]90:*:*:*)
+-	echo ${UNAME_MACHINE}-cray-unicos${UNAME_RELEASE} \
++	echo "$UNAME_MACHINE"-cray-unicos"$UNAME_RELEASE" \
+ 	| sed -e 's/CRAY.*\([A-Z]90\)/\1/' \
+ 	      -e y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/ \
+ 	      -e 's/\.[^.]*$/.X/'
+ 	exit ;;
+     CRAY*TS:*:*:*)
+-	echo t90-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
++	echo t90-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
+ 	exit ;;
+     CRAY*T3E:*:*:*)
+-	echo alphaev5-cray-unicosmk${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
++	echo alphaev5-cray-unicosmk"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
+ 	exit ;;
+     CRAY*SV1:*:*:*)
+-	echo sv1-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
++	echo sv1-cray-unicos"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
+ 	exit ;;
+     *:UNICOS/mp:*:*)
+-	echo craynv-cray-unicosmp${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
++	echo craynv-cray-unicosmp"$UNAME_RELEASE" | sed -e 's/\.[^.]*$/.X/'
+ 	exit ;;
+     F30[01]:UNIX_System_V:*:* | F700:UNIX_System_V:*:*)
+-	FUJITSU_PROC=`uname -m | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'`
+-        FUJITSU_SYS=`uname -p | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz' | sed -e 's/\///'`
+-        FUJITSU_REL=`echo ${UNAME_RELEASE} | sed -e 's/ /_/'`
+-        echo "${FUJITSU_PROC}-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
+-        exit ;;
++	FUJITSU_PROC=`uname -m | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz`
++	FUJITSU_SYS=`uname -p | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz | sed -e 's/\///'`
++	FUJITSU_REL=`echo "$UNAME_RELEASE" | sed -e 's/ /_/'`
++	echo "${FUJITSU_PROC}-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
++	exit ;;
+     5000:UNIX_System_V:4.*:*)
+-        FUJITSU_SYS=`uname -p | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz' | sed -e 's/\///'`
+-        FUJITSU_REL=`echo ${UNAME_RELEASE} | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz' | sed -e 's/ /_/'`
+-        echo "sparc-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
++	FUJITSU_SYS=`uname -p | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz | sed -e 's/\///'`
++	FUJITSU_REL=`echo "$UNAME_RELEASE" | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz | sed -e 's/ /_/'`
++	echo "sparc-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
+ 	exit ;;
+     i*86:BSD/386:*:* | i*86:BSD/OS:*:* | *:Ascend\ Embedded/OS:*:*)
+-	echo ${UNAME_MACHINE}-pc-bsdi${UNAME_RELEASE}
++	echo "$UNAME_MACHINE"-pc-bsdi"$UNAME_RELEASE"
+ 	exit ;;
+     sparc*:BSD/OS:*:*)
+-	echo sparc-unknown-bsdi${UNAME_RELEASE}
++	echo sparc-unknown-bsdi"$UNAME_RELEASE"
+ 	exit ;;
+     *:BSD/OS:*:*)
+-	echo ${UNAME_MACHINE}-unknown-bsdi${UNAME_RELEASE}
++	echo "$UNAME_MACHINE"-unknown-bsdi"$UNAME_RELEASE"
+ 	exit ;;
+     *:FreeBSD:*:*)
+-	case ${UNAME_MACHINE} in
+-	    pc98)
+-		echo i386-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
++	UNAME_PROCESSOR=`/usr/bin/uname -p`
++	case "$UNAME_PROCESSOR" in
+ 	    amd64)
+-		echo x86_64-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
+-	    *)
+-		echo ${UNAME_MACHINE}-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
++		UNAME_PROCESSOR=x86_64 ;;
++	    i386)
++		UNAME_PROCESSOR=i586 ;;
+ 	esac
++	echo "$UNAME_PROCESSOR"-unknown-freebsd"`echo "$UNAME_RELEASE"|sed -e 's/[-(].*//'`"
+ 	exit ;;
+     i*:CYGWIN*:*)
+-	echo ${UNAME_MACHINE}-pc-cygwin
++	echo "$UNAME_MACHINE"-pc-cygwin
++	exit ;;
++    *:MINGW64*:*)
++	echo "$UNAME_MACHINE"-pc-mingw64
+ 	exit ;;
+     *:MINGW*:*)
+-	echo ${UNAME_MACHINE}-pc-mingw32
++	echo "$UNAME_MACHINE"-pc-mingw32
+ 	exit ;;
+-    i*:windows32*:*)
+-    	# uname -m includes "-pc" on this system.
+-    	echo ${UNAME_MACHINE}-mingw32
++    *:MSYS*:*)
++	echo "$UNAME_MACHINE"-pc-msys
+ 	exit ;;
+     i*:PW*:*)
+-	echo ${UNAME_MACHINE}-pc-pw32
++	echo "$UNAME_MACHINE"-pc-pw32
+ 	exit ;;
+-    *:Interix*:[3456]*)
+-    	case ${UNAME_MACHINE} in
++    *:Interix*:*)
++	case "$UNAME_MACHINE" in
+ 	    x86)
+-		echo i586-pc-interix${UNAME_RELEASE}
++		echo i586-pc-interix"$UNAME_RELEASE"
+ 		exit ;;
+-	    EM64T | authenticamd | genuineintel)
+-		echo x86_64-unknown-interix${UNAME_RELEASE}
++	    authenticamd | genuineintel | EM64T)
++		echo x86_64-unknown-interix"$UNAME_RELEASE"
+ 		exit ;;
+ 	    IA64)
+-		echo ia64-unknown-interix${UNAME_RELEASE}
++		echo ia64-unknown-interix"$UNAME_RELEASE"
+ 		exit ;;
+ 	esac ;;
+-    [345]86:Windows_95:* | [345]86:Windows_98:* | [345]86:Windows_NT:*)
+-	echo i${UNAME_MACHINE}-pc-mks
+-	exit ;;
+-    i*:Windows_NT*:* | Pentium*:Windows_NT*:*)
+-	# How do we know it's Interix rather than the generic POSIX subsystem?
+-	# It also conflicts with pre-2.0 versions of AT&T UWIN. Should we
+-	# UNAME_MACHINE based on the output of uname instead of i386?
+-	echo i586-pc-interix
+-	exit ;;
+     i*:UWIN*:*)
+-	echo ${UNAME_MACHINE}-pc-uwin
++	echo "$UNAME_MACHINE"-pc-uwin
+ 	exit ;;
+     amd64:CYGWIN*:*:* | x86_64:CYGWIN*:*:*)
+ 	echo x86_64-unknown-cygwin
+ 	exit ;;
+-    p*:CYGWIN*:*)
+-	echo powerpcle-unknown-cygwin
+-	exit ;;
+     prep*:SunOS:5.*:*)
+-	echo powerpcle-unknown-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
++	echo powerpcle-unknown-solaris2"`echo "$UNAME_RELEASE"|sed -e 's/[^.]*//'`"
+ 	exit ;;
+     *:GNU:*:*)
+ 	# the GNU system
+-	echo `echo ${UNAME_MACHINE}|sed -e 's,[-/].*$,,'`-unknown-gnu`echo ${UNAME_RELEASE}|sed -e 's,/.*$,,'`
++	echo "`echo "$UNAME_MACHINE"|sed -e 's,[-/].*$,,'`-unknown-$LIBC`echo "$UNAME_RELEASE"|sed -e 's,/.*$,,'`"
+ 	exit ;;
+     *:GNU/*:*:*)
+ 	# other systems with GNU libc and userland
+-	echo ${UNAME_MACHINE}-unknown-`echo ${UNAME_SYSTEM} | sed 's,^[^/]*/,,' | tr '[A-Z]' '[a-z]'``echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'`-gnu
++	echo "$UNAME_MACHINE-unknown-`echo "$UNAME_SYSTEM" | sed 's,^[^/]*/,,' | tr "[:upper:]" "[:lower:]"``echo "$UNAME_RELEASE"|sed -e 's/[-(].*//'`-$LIBC"
++	exit ;;
++    *:Minix:*:*)
++	echo "$UNAME_MACHINE"-unknown-minix
+ 	exit ;;
+-    i*86:Minix:*:*)
+-	echo ${UNAME_MACHINE}-pc-minix
++    aarch64:Linux:*:*)
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
++	exit ;;
++    aarch64_be:Linux:*:*)
++	UNAME_MACHINE=aarch64_be
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
++	exit ;;
++    alpha:Linux:*:*)
++	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
++	  EV5)   UNAME_MACHINE=alphaev5 ;;
++	  EV56)  UNAME_MACHINE=alphaev56 ;;
++	  PCA56) UNAME_MACHINE=alphapca56 ;;
++	  PCA57) UNAME_MACHINE=alphapca56 ;;
++	  EV6)   UNAME_MACHINE=alphaev6 ;;
++	  EV67)  UNAME_MACHINE=alphaev67 ;;
++	  EV68*) UNAME_MACHINE=alphaev68 ;;
++	esac
++	objdump --private-headers /bin/sh | grep -q ld.so.1
++	if test "$?" = 0 ; then LIBC=gnulibc1 ; fi
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
++	exit ;;
++    arc:Linux:*:* | arceb:Linux:*:*)
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+     arm*:Linux:*:*)
+-	eval $set_cc_for_build
++	eval "$set_cc_for_build"
+ 	if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
+ 	    | grep -q __ARM_EABI__
+ 	then
+-	    echo ${UNAME_MACHINE}-unknown-linux-gnu
++	    echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	else
+-	    echo ${UNAME_MACHINE}-unknown-linux-gnueabi
++	    if echo __ARM_PCS_VFP | $CC_FOR_BUILD -E - 2>/dev/null \
++		| grep -q __ARM_PCS_VFP
++	    then
++		echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"eabi
++	    else
++		echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"eabihf
++	    fi
+ 	fi
+ 	exit ;;
+     avr32*:Linux:*:*)
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+     cris:Linux:*:*)
+-	echo cris-axis-linux-gnu
++	echo "$UNAME_MACHINE"-axis-linux-"$LIBC"
+ 	exit ;;
+     crisv32:Linux:*:*)
+-	echo crisv32-axis-linux-gnu
++	echo "$UNAME_MACHINE"-axis-linux-"$LIBC"
++	exit ;;
++    e2k:Linux:*:*)
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+     frv:Linux:*:*)
+-    	echo frv-unknown-linux-gnu
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
++	exit ;;
++    hexagon:Linux:*:*)
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
++	exit ;;
++    i*86:Linux:*:*)
++	echo "$UNAME_MACHINE"-pc-linux-"$LIBC"
+ 	exit ;;
+     ia64:Linux:*:*)
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
++	exit ;;
++    k1om:Linux:*:*)
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+     m32r*:Linux:*:*)
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+     m68*:Linux:*:*)
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+-    mips:Linux:*:*)
+-	eval $set_cc_for_build
+-	sed 's/^	//' << EOF >$dummy.c
+-	#undef CPU
+-	#undef mips
+-	#undef mipsel
+-	#if defined(__MIPSEL__) || defined(__MIPSEL) || defined(_MIPSEL) || defined(MIPSEL)
+-	CPU=mipsel
+-	#else
+-	#if defined(__MIPSEB__) || defined(__MIPSEB) || defined(_MIPSEB) || defined(MIPSEB)
+-	CPU=mips
+-	#else
+-	CPU=
+-	#endif
+-	#endif
+-EOF
+-	eval "`$CC_FOR_BUILD -E $dummy.c 2>/dev/null | sed -n '
+-	    /^CPU/{
+-		s: ::g
+-		p
+-	    }'`"
+-	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-gnu"; exit; }
+-	;;
+-    mips64:Linux:*:*)
+-	eval $set_cc_for_build
+-	sed 's/^	//' << EOF >$dummy.c
++    mips:Linux:*:* | mips64:Linux:*:*)
++	eval "$set_cc_for_build"
++	sed 's/^	//' << EOF > "$dummy.c"
+ 	#undef CPU
+-	#undef mips64
+-	#undef mips64el
++	#undef ${UNAME_MACHINE}
++	#undef ${UNAME_MACHINE}el
+ 	#if defined(__MIPSEL__) || defined(__MIPSEL) || defined(_MIPSEL) || defined(MIPSEL)
+-	CPU=mips64el
++	CPU=${UNAME_MACHINE}el
+ 	#else
+ 	#if defined(__MIPSEB__) || defined(__MIPSEB) || defined(_MIPSEB) || defined(MIPSEB)
+-	CPU=mips64
++	CPU=${UNAME_MACHINE}
+ 	#else
+ 	CPU=
+ 	#endif
+ 	#endif
+ EOF
+-	eval "`$CC_FOR_BUILD -E $dummy.c 2>/dev/null | sed -n '
+-	    /^CPU/{
+-		s: ::g
+-		p
+-	    }'`"
+-	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-gnu"; exit; }
++	eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^CPU'`"
++	test "x$CPU" != x && { echo "$CPU-unknown-linux-$LIBC"; exit; }
+ 	;;
+-    or32:Linux:*:*)
+-	echo or32-unknown-linux-gnu
++    mips64el:Linux:*:*)
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+-    ppc:Linux:*:*)
+-	echo powerpc-unknown-linux-gnu
++    openrisc*:Linux:*:*)
++	echo or1k-unknown-linux-"$LIBC"
+ 	exit ;;
+-    ppc64:Linux:*:*)
+-	echo powerpc64-unknown-linux-gnu
+-	exit ;;
+-    alpha:Linux:*:*)
+-	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
+-	  EV5)   UNAME_MACHINE=alphaev5 ;;
+-	  EV56)  UNAME_MACHINE=alphaev56 ;;
+-	  PCA56) UNAME_MACHINE=alphapca56 ;;
+-	  PCA57) UNAME_MACHINE=alphapca56 ;;
+-	  EV6)   UNAME_MACHINE=alphaev6 ;;
+-	  EV67)  UNAME_MACHINE=alphaev67 ;;
+-	  EV68*) UNAME_MACHINE=alphaev68 ;;
+-        esac
+-	objdump --private-headers /bin/sh | grep ld.so.1 >/dev/null
+-	if test "$?" = 0 ; then LIBC="libc1" ; else LIBC="" ; fi
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu${LIBC}
++    or32:Linux:*:* | or1k*:Linux:*:*)
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+     padre:Linux:*:*)
+-	echo sparc-unknown-linux-gnu
++	echo sparc-unknown-linux-"$LIBC"
++	exit ;;
++    parisc64:Linux:*:* | hppa64:Linux:*:*)
++	echo hppa64-unknown-linux-"$LIBC"
+ 	exit ;;
+     parisc:Linux:*:* | hppa:Linux:*:*)
+ 	# Look for CPU level
+ 	case `grep '^cpu[^a-z]*:' /proc/cpuinfo 2>/dev/null | cut -d' ' -f2` in
+-	  PA7*) echo hppa1.1-unknown-linux-gnu ;;
+-	  PA8*) echo hppa2.0-unknown-linux-gnu ;;
+-	  *)    echo hppa-unknown-linux-gnu ;;
++	  PA7*) echo hppa1.1-unknown-linux-"$LIBC" ;;
++	  PA8*) echo hppa2.0-unknown-linux-"$LIBC" ;;
++	  *)    echo hppa-unknown-linux-"$LIBC" ;;
+ 	esac
+ 	exit ;;
+-    parisc64:Linux:*:* | hppa64:Linux:*:*)
+-	echo hppa64-unknown-linux-gnu
++    ppc64:Linux:*:*)
++	echo powerpc64-unknown-linux-"$LIBC"
++	exit ;;
++    ppc:Linux:*:*)
++	echo powerpc-unknown-linux-"$LIBC"
++	exit ;;
++    ppc64le:Linux:*:*)
++	echo powerpc64le-unknown-linux-"$LIBC"
++	exit ;;
++    ppcle:Linux:*:*)
++	echo powerpcle-unknown-linux-"$LIBC"
++	exit ;;
++    riscv32:Linux:*:* | riscv64:Linux:*:*)
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+     s390:Linux:*:* | s390x:Linux:*:*)
+-	echo ${UNAME_MACHINE}-ibm-linux
++	echo "$UNAME_MACHINE"-ibm-linux-"$LIBC"
+ 	exit ;;
+     sh64*:Linux:*:*)
+-    	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+     sh*:Linux:*:*)
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+     sparc:Linux:*:* | sparc64:Linux:*:*)
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
++	exit ;;
++    tile*:Linux:*:*)
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+     vax:Linux:*:*)
+-	echo ${UNAME_MACHINE}-dec-linux-gnu
++	echo "$UNAME_MACHINE"-dec-linux-"$LIBC"
+ 	exit ;;
+     x86_64:Linux:*:*)
+-	echo x86_64-unknown-linux-gnu
++	echo "$UNAME_MACHINE"-pc-linux-"$LIBC"
+ 	exit ;;
+     xtensa*:Linux:*:*)
+-    	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
+ 	exit ;;
+-    i*86:Linux:*:*)
+-	# The BFD linker knows what the default object file format is, so
+-	# first see if it will tell us. cd to the root directory to prevent
+-	# problems with other programs or directories called `ld' in the path.
+-	# Set LC_ALL=C to ensure ld outputs messages in English.
+-	ld_supported_targets=`cd /; LC_ALL=C ld --help 2>&1 \
+-			 | sed -ne '/supported targets:/!d
+-				    s/[ 	][ 	]*/ /g
+-				    s/.*supported targets: *//
+-				    s/ .*//
+-				    p'`
+-        case "$ld_supported_targets" in
+-	  elf32-i386)
+-		TENTATIVE="${UNAME_MACHINE}-pc-linux-gnu"
+-		;;
+-	  a.out-i386-linux)
+-		echo "${UNAME_MACHINE}-pc-linux-gnuaout"
+-		exit ;;
+-	  "")
+-		# Either a pre-BFD a.out linker (linux-gnuoldld) or
+-		# one that does not give us useful --help.
+-		echo "${UNAME_MACHINE}-pc-linux-gnuoldld"
+-		exit ;;
+-	esac
+-	# Determine whether the default compiler is a.out or elf
+-	eval $set_cc_for_build
+-	sed 's/^	//' << EOF >$dummy.c
+-	#include <features.h>
+-	#ifdef __ELF__
+-	# ifdef __GLIBC__
+-	#  if __GLIBC__ >= 2
+-	LIBC=gnu
+-	#  else
+-	LIBC=gnulibc1
+-	#  endif
+-	# else
+-	LIBC=gnulibc1
+-	# endif
+-	#else
+-	#if defined(__INTEL_COMPILER) || defined(__PGI) || defined(__SUNPRO_C) || defined(__SUNPRO_CC)
+-	LIBC=gnu
+-	#else
+-	LIBC=gnuaout
+-	#endif
+-	#endif
+-	#ifdef __dietlibc__
+-	LIBC=dietlibc
+-	#endif
+-EOF
+-	eval "`$CC_FOR_BUILD -E $dummy.c 2>/dev/null | sed -n '
+-	    /^LIBC/{
+-		s: ::g
+-		p
+-	    }'`"
+-	test x"${LIBC}" != x && {
+-		echo "${UNAME_MACHINE}-pc-linux-${LIBC}"
+-		exit
+-	}
+-	test x"${TENTATIVE}" != x && { echo "${TENTATIVE}"; exit; }
+-	;;
+     i*86:DYNIX/ptx:4*:*)
+ 	# ptx 4.0 does uname -s correctly, with DYNIX/ptx in there.
+ 	# earlier versions are messed up and put the nodename in both
+@@ -1053,54 +1058,54 @@ EOF
+ 	echo i386-sequent-sysv4
+ 	exit ;;
+     i*86:UNIX_SV:4.2MP:2.*)
+-        # Unixware is an offshoot of SVR4, but it has its own version
+-        # number series starting with 2...
+-        # I am not positive that other SVR4 systems won't match this,
++	# Unixware is an offshoot of SVR4, but it has its own version
++	# number series starting with 2...
++	# I am not positive that other SVR4 systems won't match this,
+ 	# I just have to hope.  -- rms.
+-        # Use sysv4.2uw... so that sysv4* matches it.
+-	echo ${UNAME_MACHINE}-pc-sysv4.2uw${UNAME_VERSION}
++	# Use sysv4.2uw... so that sysv4* matches it.
++	echo "$UNAME_MACHINE"-pc-sysv4.2uw"$UNAME_VERSION"
+ 	exit ;;
+     i*86:OS/2:*:*)
+ 	# If we were able to find `uname', then EMX Unix compatibility
+ 	# is probably installed.
+-	echo ${UNAME_MACHINE}-pc-os2-emx
++	echo "$UNAME_MACHINE"-pc-os2-emx
+ 	exit ;;
+     i*86:XTS-300:*:STOP)
+-	echo ${UNAME_MACHINE}-unknown-stop
++	echo "$UNAME_MACHINE"-unknown-stop
+ 	exit ;;
+     i*86:atheos:*:*)
+-	echo ${UNAME_MACHINE}-unknown-atheos
++	echo "$UNAME_MACHINE"-unknown-atheos
+ 	exit ;;
+     i*86:syllable:*:*)
+-	echo ${UNAME_MACHINE}-pc-syllable
++	echo "$UNAME_MACHINE"-pc-syllable
+ 	exit ;;
+-    i*86:LynxOS:2.*:* | i*86:LynxOS:3.[01]*:* | i*86:LynxOS:4.0*:*)
+-	echo i386-unknown-lynxos${UNAME_RELEASE}
++    i*86:LynxOS:2.*:* | i*86:LynxOS:3.[01]*:* | i*86:LynxOS:4.[02]*:*)
++	echo i386-unknown-lynxos"$UNAME_RELEASE"
+ 	exit ;;
+     i*86:*DOS:*:*)
+-	echo ${UNAME_MACHINE}-pc-msdosdjgpp
++	echo "$UNAME_MACHINE"-pc-msdosdjgpp
+ 	exit ;;
+-    i*86:*:4.*:* | i*86:SYSTEM_V:4.*:*)
+-	UNAME_REL=`echo ${UNAME_RELEASE} | sed 's/\/MP$//'`
++    i*86:*:4.*:*)
++	UNAME_REL=`echo "$UNAME_RELEASE" | sed 's/\/MP$//'`
+ 	if grep Novell /usr/include/link.h >/dev/null 2>/dev/null; then
+-		echo ${UNAME_MACHINE}-univel-sysv${UNAME_REL}
++		echo "$UNAME_MACHINE"-univel-sysv"$UNAME_REL"
+ 	else
+-		echo ${UNAME_MACHINE}-pc-sysv${UNAME_REL}
++		echo "$UNAME_MACHINE"-pc-sysv"$UNAME_REL"
+ 	fi
+ 	exit ;;
+     i*86:*:5:[678]*)
+-    	# UnixWare 7.x, OpenUNIX and OpenServer 6.
++	# UnixWare 7.x, OpenUNIX and OpenServer 6.
+ 	case `/bin/uname -X | grep "^Machine"` in
+ 	    *486*)	     UNAME_MACHINE=i486 ;;
+ 	    *Pentium)	     UNAME_MACHINE=i586 ;;
+ 	    *Pent*|*Celeron) UNAME_MACHINE=i686 ;;
+ 	esac
+-	echo ${UNAME_MACHINE}-unknown-sysv${UNAME_RELEASE}${UNAME_SYSTEM}${UNAME_VERSION}
++	echo "$UNAME_MACHINE-unknown-sysv${UNAME_RELEASE}${UNAME_SYSTEM}{$UNAME_VERSION}"
+ 	exit ;;
+     i*86:*:3.2:*)
+ 	if test -f /usr/options/cb.name; then
+ 		UNAME_REL=`sed -n 's/.*Version //p' </usr/options/cb.name`
+-		echo ${UNAME_MACHINE}-pc-isc$UNAME_REL
++		echo "$UNAME_MACHINE"-pc-isc"$UNAME_REL"
+ 	elif /bin/uname -X 2>/dev/null >/dev/null ; then
+ 		UNAME_REL=`(/bin/uname -X|grep Release|sed -e 's/.*= //')`
+ 		(/bin/uname -X|grep i80486 >/dev/null) && UNAME_MACHINE=i486
+@@ -1110,20 +1115,20 @@ EOF
+ 			&& UNAME_MACHINE=i686
+ 		(/bin/uname -X|grep '^Machine.*Pentium Pro' >/dev/null) \
+ 			&& UNAME_MACHINE=i686
+-		echo ${UNAME_MACHINE}-pc-sco$UNAME_REL
++		echo "$UNAME_MACHINE"-pc-sco"$UNAME_REL"
+ 	else
+-		echo ${UNAME_MACHINE}-pc-sysv32
++		echo "$UNAME_MACHINE"-pc-sysv32
+ 	fi
+ 	exit ;;
+     pc:*:*:*)
+ 	# Left here for compatibility:
+-        # uname -m prints for DJGPP always 'pc', but it prints nothing about
+-        # the processor, so we play safe by assuming i586.
++	# uname -m prints for DJGPP always 'pc', but it prints nothing about
++	# the processor, so we play safe by assuming i586.
+ 	# Note: whatever this is, it MUST be the same as what config.sub
+-	# prints for the "djgpp" host, or else GDB configury will decide that
++	# prints for the "djgpp" host, or else GDB configure will decide that
+ 	# this is a cross-build.
+ 	echo i586-pc-msdosdjgpp
+-        exit ;;
++	exit ;;
+     Intel:Mach:3*:*)
+ 	echo i386-pc-mach3
+ 	exit ;;
+@@ -1132,9 +1137,9 @@ EOF
+ 	exit ;;
+     i860:*:4.*:*) # i860-SVR4
+ 	if grep Stardent /usr/include/sys/uadmin.h >/dev/null 2>&1 ; then
+-	  echo i860-stardent-sysv${UNAME_RELEASE} # Stardent Vistra i860-SVR4
++	  echo i860-stardent-sysv"$UNAME_RELEASE" # Stardent Vistra i860-SVR4
+ 	else # Add other i860-SVR4 vendors below as they are discovered.
+-	  echo i860-unknown-sysv${UNAME_RELEASE}  # Unknown i860-SVR4
++	  echo i860-unknown-sysv"$UNAME_RELEASE"  # Unknown i860-SVR4
+ 	fi
+ 	exit ;;
+     mini*:CTIX:SYS*5:*)
+@@ -1154,39 +1159,39 @@ EOF
+ 	test -r /etc/.relid \
+ 	&& OS_REL=.`sed -n 's/[^ ]* [^ ]* \([0-9][0-9]\).*/\1/p' < /etc/.relid`
+ 	/bin/uname -p 2>/dev/null | grep 86 >/dev/null \
+-	  && { echo i486-ncr-sysv4.3${OS_REL}; exit; }
++	  && { echo i486-ncr-sysv4.3"$OS_REL"; exit; }
+ 	/bin/uname -p 2>/dev/null | /bin/grep entium >/dev/null \
+-	  && { echo i586-ncr-sysv4.3${OS_REL}; exit; } ;;
++	  && { echo i586-ncr-sysv4.3"$OS_REL"; exit; } ;;
+     3[34]??:*:4.0:* | 3[34]??,*:*:4.0:*)
+-        /bin/uname -p 2>/dev/null | grep 86 >/dev/null \
+-          && { echo i486-ncr-sysv4; exit; } ;;
++	/bin/uname -p 2>/dev/null | grep 86 >/dev/null \
++	  && { echo i486-ncr-sysv4; exit; } ;;
+     NCR*:*:4.2:* | MPRAS*:*:4.2:*)
+ 	OS_REL='.3'
+ 	test -r /etc/.relid \
+ 	    && OS_REL=.`sed -n 's/[^ ]* [^ ]* \([0-9][0-9]\).*/\1/p' < /etc/.relid`
+ 	/bin/uname -p 2>/dev/null | grep 86 >/dev/null \
+-	    && { echo i486-ncr-sysv4.3${OS_REL}; exit; }
++	    && { echo i486-ncr-sysv4.3"$OS_REL"; exit; }
+ 	/bin/uname -p 2>/dev/null | /bin/grep entium >/dev/null \
+-	    && { echo i586-ncr-sysv4.3${OS_REL}; exit; }
++	    && { echo i586-ncr-sysv4.3"$OS_REL"; exit; }
+ 	/bin/uname -p 2>/dev/null | /bin/grep pteron >/dev/null \
+-	    && { echo i586-ncr-sysv4.3${OS_REL}; exit; } ;;
++	    && { echo i586-ncr-sysv4.3"$OS_REL"; exit; } ;;
+     m68*:LynxOS:2.*:* | m68*:LynxOS:3.0*:*)
+-	echo m68k-unknown-lynxos${UNAME_RELEASE}
++	echo m68k-unknown-lynxos"$UNAME_RELEASE"
+ 	exit ;;
+     mc68030:UNIX_System_V:4.*:*)
+ 	echo m68k-atari-sysv4
+ 	exit ;;
+     TSUNAMI:LynxOS:2.*:*)
+-	echo sparc-unknown-lynxos${UNAME_RELEASE}
++	echo sparc-unknown-lynxos"$UNAME_RELEASE"
+ 	exit ;;
+     rs6000:LynxOS:2.*:*)
+-	echo rs6000-unknown-lynxos${UNAME_RELEASE}
++	echo rs6000-unknown-lynxos"$UNAME_RELEASE"
+ 	exit ;;
+-    PowerPC:LynxOS:2.*:* | PowerPC:LynxOS:3.[01]*:* | PowerPC:LynxOS:4.0*:*)
+-	echo powerpc-unknown-lynxos${UNAME_RELEASE}
++    PowerPC:LynxOS:2.*:* | PowerPC:LynxOS:3.[01]*:* | PowerPC:LynxOS:4.[02]*:*)
++	echo powerpc-unknown-lynxos"$UNAME_RELEASE"
+ 	exit ;;
+     SM[BE]S:UNIX_SV:*:*)
+-	echo mips-dde-sysv${UNAME_RELEASE}
++	echo mips-dde-sysv"$UNAME_RELEASE"
+ 	exit ;;
+     RM*:ReliantUNIX-*:*:*)
+ 	echo mips-sni-sysv4
+@@ -1197,15 +1202,15 @@ EOF
+     *:SINIX-*:*:*)
+ 	if uname -p 2>/dev/null >/dev/null ; then
+ 		UNAME_MACHINE=`(uname -p) 2>/dev/null`
+-		echo ${UNAME_MACHINE}-sni-sysv4
++		echo "$UNAME_MACHINE"-sni-sysv4
+ 	else
+ 		echo ns32k-sni-sysv
+ 	fi
+ 	exit ;;
+-    PENTIUM:*:4.0*:*) # Unisys `ClearPath HMP IX 4000' SVR4/MP effort
+-                      # says <Richard.M.Bartel@ccMail.Census.GOV>
+-        echo i586-unisys-sysv4
+-        exit ;;
++    PENTIUM:*:4.0*:*)	# Unisys `ClearPath HMP IX 4000' SVR4/MP effort
++			# says <Richard.M.Bartel@ccMail.Census.GOV>
++	echo i586-unisys-sysv4
++	exit ;;
+     *:UNIX_System_V:4*:FTX*)
+ 	# From Gerald Hewes <hewes@openmarket.com>.
+ 	# How about differentiating between stratus architectures? -djm
+@@ -1217,25 +1222,25 @@ EOF
+ 	exit ;;
+     i*86:VOS:*:*)
+ 	# From Paul.Green@stratus.com.
+-	echo ${UNAME_MACHINE}-stratus-vos
++	echo "$UNAME_MACHINE"-stratus-vos
+ 	exit ;;
+     *:VOS:*:*)
+ 	# From Paul.Green@stratus.com.
+ 	echo hppa1.1-stratus-vos
+ 	exit ;;
+     mc68*:A/UX:*:*)
+-	echo m68k-apple-aux${UNAME_RELEASE}
++	echo m68k-apple-aux"$UNAME_RELEASE"
+ 	exit ;;
+     news*:NEWS-OS:6*:*)
+ 	echo mips-sony-newsos6
+ 	exit ;;
+     R[34]000:*System_V*:*:* | R4000:UNIX_SYSV:*:* | R*000:UNIX_SV:*:*)
+ 	if [ -d /usr/nec ]; then
+-	        echo mips-nec-sysv${UNAME_RELEASE}
++		echo mips-nec-sysv"$UNAME_RELEASE"
+ 	else
+-	        echo mips-unknown-sysv${UNAME_RELEASE}
++		echo mips-unknown-sysv"$UNAME_RELEASE"
+ 	fi
+-        exit ;;
++	exit ;;
+     BeBox:BeOS:*:*)	# BeOS running on hardware made by Be, PPC only.
+ 	echo powerpc-be-beos
+ 	exit ;;
+@@ -1248,53 +1253,97 @@ EOF
+     BePC:Haiku:*:*)	# Haiku running on Intel PC compatible.
+ 	echo i586-pc-haiku
+ 	exit ;;
++    x86_64:Haiku:*:*)
++	echo x86_64-unknown-haiku
++	exit ;;
+     SX-4:SUPER-UX:*:*)
+-	echo sx4-nec-superux${UNAME_RELEASE}
++	echo sx4-nec-superux"$UNAME_RELEASE"
+ 	exit ;;
+     SX-5:SUPER-UX:*:*)
+-	echo sx5-nec-superux${UNAME_RELEASE}
++	echo sx5-nec-superux"$UNAME_RELEASE"
+ 	exit ;;
+     SX-6:SUPER-UX:*:*)
+-	echo sx6-nec-superux${UNAME_RELEASE}
++	echo sx6-nec-superux"$UNAME_RELEASE"
+ 	exit ;;
+     SX-7:SUPER-UX:*:*)
+-	echo sx7-nec-superux${UNAME_RELEASE}
++	echo sx7-nec-superux"$UNAME_RELEASE"
+ 	exit ;;
+     SX-8:SUPER-UX:*:*)
+-	echo sx8-nec-superux${UNAME_RELEASE}
++	echo sx8-nec-superux"$UNAME_RELEASE"
+ 	exit ;;
+     SX-8R:SUPER-UX:*:*)
+-	echo sx8r-nec-superux${UNAME_RELEASE}
++	echo sx8r-nec-superux"$UNAME_RELEASE"
++	exit ;;
++    SX-ACE:SUPER-UX:*:*)
++	echo sxace-nec-superux"$UNAME_RELEASE"
+ 	exit ;;
+     Power*:Rhapsody:*:*)
+-	echo powerpc-apple-rhapsody${UNAME_RELEASE}
++	echo powerpc-apple-rhapsody"$UNAME_RELEASE"
+ 	exit ;;
+     *:Rhapsody:*:*)
+-	echo ${UNAME_MACHINE}-apple-rhapsody${UNAME_RELEASE}
++	echo "$UNAME_MACHINE"-apple-rhapsody"$UNAME_RELEASE"
+ 	exit ;;
+     *:Darwin:*:*)
+ 	UNAME_PROCESSOR=`uname -p` || UNAME_PROCESSOR=unknown
+-	case $UNAME_PROCESSOR in
+-	    unknown) UNAME_PROCESSOR=powerpc ;;
+-	esac
+-	echo ${UNAME_PROCESSOR}-apple-darwin${UNAME_RELEASE}
++	eval "$set_cc_for_build"
++	if test "$UNAME_PROCESSOR" = unknown ; then
++	    UNAME_PROCESSOR=powerpc
++	fi
++	if test "`echo "$UNAME_RELEASE" | sed -e 's/\..*//'`" -le 10 ; then
++	    if [ "$CC_FOR_BUILD" != no_compiler_found ]; then
++		if (echo '#ifdef __LP64__'; echo IS_64BIT_ARCH; echo '#endif') | \
++		       (CCOPTS="" $CC_FOR_BUILD -E - 2>/dev/null) | \
++		       grep IS_64BIT_ARCH >/dev/null
++		then
++		    case $UNAME_PROCESSOR in
++			i386) UNAME_PROCESSOR=x86_64 ;;
++			powerpc) UNAME_PROCESSOR=powerpc64 ;;
++		    esac
++		fi
++		# On 10.4-10.6 one might compile for PowerPC via gcc -arch ppc
++		if (echo '#ifdef __POWERPC__'; echo IS_PPC; echo '#endif') | \
++		       (CCOPTS="" $CC_FOR_BUILD -E - 2>/dev/null) | \
++		       grep IS_PPC >/dev/null
++		then
++		    UNAME_PROCESSOR=powerpc
++		fi
++	    fi
++	elif test "$UNAME_PROCESSOR" = i386 ; then
++	    # Avoid executing cc on OS X 10.9, as it ships with a stub
++	    # that puts up a graphical alert prompting to install
++	    # developer tools.  Any system running Mac OS X 10.7 or
++	    # later (Darwin 11 and later) is required to have a 64-bit
++	    # processor. This is not true of the ARM version of Darwin
++	    # that Apple uses in portable devices.
++	    UNAME_PROCESSOR=x86_64
++	fi
++	echo "$UNAME_PROCESSOR"-apple-darwin"$UNAME_RELEASE"
+ 	exit ;;
+     *:procnto*:*:* | *:QNX:[0123456789]*:*)
+ 	UNAME_PROCESSOR=`uname -p`
+-	if test "$UNAME_PROCESSOR" = "x86"; then
++	if test "$UNAME_PROCESSOR" = x86; then
+ 		UNAME_PROCESSOR=i386
+ 		UNAME_MACHINE=pc
+ 	fi
+-	echo ${UNAME_PROCESSOR}-${UNAME_MACHINE}-nto-qnx${UNAME_RELEASE}
++	echo "$UNAME_PROCESSOR"-"$UNAME_MACHINE"-nto-qnx"$UNAME_RELEASE"
+ 	exit ;;
+     *:QNX:*:4*)
+ 	echo i386-pc-qnx
+ 	exit ;;
+-    NSE-?:NONSTOP_KERNEL:*:*)
+-	echo nse-tandem-nsk${UNAME_RELEASE}
++    NEO-*:NONSTOP_KERNEL:*:*)
++	echo neo-tandem-nsk"$UNAME_RELEASE"
++	exit ;;
++    NSE-*:NONSTOP_KERNEL:*:*)
++	echo nse-tandem-nsk"$UNAME_RELEASE"
++	exit ;;
++    NSR-*:NONSTOP_KERNEL:*:*)
++	echo nsr-tandem-nsk"$UNAME_RELEASE"
+ 	exit ;;
+-    NSR-?:NONSTOP_KERNEL:*:*)
+-	echo nsr-tandem-nsk${UNAME_RELEASE}
++    NSV-*:NONSTOP_KERNEL:*:*)
++	echo nsv-tandem-nsk"$UNAME_RELEASE"
++	exit ;;
++    NSX-*:NONSTOP_KERNEL:*:*)
++	echo nsx-tandem-nsk"$UNAME_RELEASE"
+ 	exit ;;
+     *:NonStop-UX:*:*)
+ 	echo mips-compaq-nonstopux
+@@ -1303,18 +1352,18 @@ EOF
+ 	echo bs2000-siemens-sysv
+ 	exit ;;
+     DS/*:UNIX_System_V:*:*)
+-	echo ${UNAME_MACHINE}-${UNAME_SYSTEM}-${UNAME_RELEASE}
++	echo "$UNAME_MACHINE"-"$UNAME_SYSTEM"-"$UNAME_RELEASE"
+ 	exit ;;
+     *:Plan9:*:*)
+ 	# "uname -m" is not consistent, so use $cputype instead. 386
+ 	# is converted to i386 for consistency with other x86
+ 	# operating systems.
+-	if test "$cputype" = "386"; then
++	if test "$cputype" = 386; then
+ 	    UNAME_MACHINE=i386
+ 	else
+ 	    UNAME_MACHINE="$cputype"
+ 	fi
+-	echo ${UNAME_MACHINE}-unknown-plan9
++	echo "$UNAME_MACHINE"-unknown-plan9
+ 	exit ;;
+     *:TOPS-10:*:*)
+ 	echo pdp10-unknown-tops10
+@@ -1335,14 +1384,14 @@ EOF
+ 	echo pdp10-unknown-its
+ 	exit ;;
+     SEI:*:*:SEIUX)
+-        echo mips-sei-seiux${UNAME_RELEASE}
++	echo mips-sei-seiux"$UNAME_RELEASE"
+ 	exit ;;
+     *:DragonFly:*:*)
+-	echo ${UNAME_MACHINE}-unknown-dragonfly`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'`
++	echo "$UNAME_MACHINE"-unknown-dragonfly"`echo "$UNAME_RELEASE"|sed -e 's/[-(].*//'`"
+ 	exit ;;
+     *:*VMS:*:*)
+-    	UNAME_MACHINE=`(uname -p) 2>/dev/null`
+-	case "${UNAME_MACHINE}" in
++	UNAME_MACHINE=`(uname -p) 2>/dev/null`
++	case "$UNAME_MACHINE" in
+ 	    A*) echo alpha-dec-vms ; exit ;;
+ 	    I*) echo ia64-dec-vms ; exit ;;
+ 	    V*) echo vax-dec-vms ; exit ;;
+@@ -1351,182 +1400,48 @@ EOF
+ 	echo i386-pc-xenix
+ 	exit ;;
+     i*86:skyos:*:*)
+-	echo ${UNAME_MACHINE}-pc-skyos`echo ${UNAME_RELEASE}` | sed -e 's/ .*$//'
++	echo "$UNAME_MACHINE"-pc-skyos"`echo "$UNAME_RELEASE" | sed -e 's/ .*$//'`"
+ 	exit ;;
+     i*86:rdos:*:*)
+-	echo ${UNAME_MACHINE}-pc-rdos
++	echo "$UNAME_MACHINE"-pc-rdos
+ 	exit ;;
+     i*86:AROS:*:*)
+-	echo ${UNAME_MACHINE}-pc-aros
++	echo "$UNAME_MACHINE"-pc-aros
++	exit ;;
++    x86_64:VMkernel:*:*)
++	echo "$UNAME_MACHINE"-unknown-esx
++	exit ;;
++    amd64:Isilon\ OneFS:*:*)
++	echo x86_64-unknown-onefs
+ 	exit ;;
+ esac
+ 
+-#echo '(No uname command or uname output not recognized.)' 1>&2
+-#echo "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" 1>&2
++echo "$0: unable to guess system type" >&2
+ 
+-eval $set_cc_for_build
+-cat >$dummy.c <<EOF
+-#ifdef _SEQUENT_
+-# include <sys/types.h>
+-# include <sys/utsname.h>
+-#endif
+-main ()
+-{
+-#if defined (sony)
+-#if defined (MIPSEB)
+-  /* BFD wants "bsd" instead of "newsos".  Perhaps BFD should be changed,
+-     I don't know....  */
+-  printf ("mips-sony-bsd\n"); exit (0);
+-#else
+-#include <sys/param.h>
+-  printf ("m68k-sony-newsos%s\n",
+-#ifdef NEWSOS4
+-          "4"
+-#else
+-	  ""
+-#endif
+-         ); exit (0);
+-#endif
+-#endif
+-
+-#if defined (__arm) && defined (__acorn) && defined (__unix)
+-  printf ("arm-acorn-riscix\n"); exit (0);
+-#endif
+-
+-#if defined (hp300) && !defined (hpux)
+-  printf ("m68k-hp-bsd\n"); exit (0);
+-#endif
+-
+-#if defined (NeXT)
+-#if !defined (__ARCHITECTURE__)
+-#define __ARCHITECTURE__ "m68k"
+-#endif
+-  int version;
+-  version=`(hostinfo | sed -n 's/.*NeXT Mach \([0-9]*\).*/\1/p') 2>/dev/null`;
+-  if (version < 4)
+-    printf ("%s-next-nextstep%d\n", __ARCHITECTURE__, version);
+-  else
+-    printf ("%s-next-openstep%d\n", __ARCHITECTURE__, version);
+-  exit (0);
+-#endif
+-
+-#if defined (MULTIMAX) || defined (n16)
+-#if defined (UMAXV)
+-  printf ("ns32k-encore-sysv\n"); exit (0);
+-#else
+-#if defined (CMU)
+-  printf ("ns32k-encore-mach\n"); exit (0);
+-#else
+-  printf ("ns32k-encore-bsd\n"); exit (0);
+-#endif
+-#endif
+-#endif
+-
+-#if defined (__386BSD__)
+-  printf ("i386-pc-bsd\n"); exit (0);
+-#endif
+-
+-#if defined (sequent)
+-#if defined (i386)
+-  printf ("i386-sequent-dynix\n"); exit (0);
+-#endif
+-#if defined (ns32000)
+-  printf ("ns32k-sequent-dynix\n"); exit (0);
+-#endif
+-#endif
+-
+-#if defined (_SEQUENT_)
+-    struct utsname un;
+-
+-    uname(&un);
+-
+-    if (strncmp(un.version, "V2", 2) == 0) {
+-	printf ("i386-sequent-ptx2\n"); exit (0);
+-    }
+-    if (strncmp(un.version, "V1", 2) == 0) { /* XXX is V1 correct? */
+-	printf ("i386-sequent-ptx1\n"); exit (0);
+-    }
+-    printf ("i386-sequent-ptx\n"); exit (0);
+-
+-#endif
+-
+-#if defined (vax)
+-# if !defined (ultrix)
+-#  include <sys/param.h>
+-#  if defined (BSD)
+-#   if BSD == 43
+-      printf ("vax-dec-bsd4.3\n"); exit (0);
+-#   else
+-#    if BSD == 199006
+-      printf ("vax-dec-bsd4.3reno\n"); exit (0);
+-#    else
+-      printf ("vax-dec-bsd\n"); exit (0);
+-#    endif
+-#   endif
+-#  else
+-    printf ("vax-dec-bsd\n"); exit (0);
+-#  endif
+-# else
+-    printf ("vax-dec-ultrix\n"); exit (0);
+-# endif
+-#endif
++case "$UNAME_MACHINE:$UNAME_SYSTEM" in
++    mips:Linux | mips64:Linux)
++	# If we got here on MIPS GNU/Linux, output extra information.
++	cat >&2 <<EOF
+ 
+-#if defined (alliant) && defined (i860)
+-  printf ("i860-alliant-bsd\n"); exit (0);
+-#endif
+-
+-  exit (1);
+-}
++NOTE: MIPS GNU/Linux systems require a C compiler to fully recognize
++the system type. Please install a C compiler and try again.
+ EOF
+-
+-$CC_FOR_BUILD -o $dummy $dummy.c 2>/dev/null && SYSTEM_NAME=`$dummy` &&
+-	{ echo "$SYSTEM_NAME"; exit; }
+-
+-# Apollos put the system type in the environment.
+-
+-test -d /usr/apollo && { echo ${ISP}-apollo-${SYSTYPE}; exit; }
+-
+-# Convex versions that predate uname can use getsysinfo(1)
+-
+-if [ -x /usr/convex/getsysinfo ]
+-then
+-    case `getsysinfo -f cpu_type` in
+-    c1*)
+-	echo c1-convex-bsd
+-	exit ;;
+-    c2*)
+-	if getsysinfo -f scalar_acc
+-	then echo c32-convex-bsd
+-	else echo c2-convex-bsd
+-	fi
+-	exit ;;
+-    c34*)
+-	echo c34-convex-bsd
+-	exit ;;
+-    c38*)
+-	echo c38-convex-bsd
+-	exit ;;
+-    c4*)
+-	echo c4-convex-bsd
+-	exit ;;
+-    esac
+-fi
++	;;
++esac
+ 
+ cat >&2 <<EOF
+-$0: unable to guess system type
+ 
+-This script, last modified $timestamp, has failed to recognize
+-the operating system you are using. It is advised that you
+-download the most up to date version of the config scripts from
++This script (version $timestamp), has failed to recognize the
++operating system you are using. If your script is old, overwrite *all*
++copies of config.guess and config.sub with the latest versions from:
+ 
+-  http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD
++  https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess
+ and
+-  http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD
++  https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub
+ 
+-If the version you run ($0) is already up to date, please
+-send the following data and any information you think might be
+-pertinent to <config-patches@gnu.org> in order to provide the needed
+-information to handle your system.
++If $0 has already been updated, send the following data and any
++information you think might be pertinent to config-patches@gnu.org to
++provide the necessary information to handle your system.
+ 
+ config.guess timestamp = $timestamp
+ 
+@@ -1545,16 +1460,16 @@ hostinfo               = `(hostinfo) 2>/dev/null`
+ /usr/bin/oslevel       = `(/usr/bin/oslevel) 2>/dev/null`
+ /usr/convex/getsysinfo = `(/usr/convex/getsysinfo) 2>/dev/null`
+ 
+-UNAME_MACHINE = ${UNAME_MACHINE}
+-UNAME_RELEASE = ${UNAME_RELEASE}
+-UNAME_SYSTEM  = ${UNAME_SYSTEM}
+-UNAME_VERSION = ${UNAME_VERSION}
++UNAME_MACHINE = "$UNAME_MACHINE"
++UNAME_RELEASE = "$UNAME_RELEASE"
++UNAME_SYSTEM  = "$UNAME_SYSTEM"
++UNAME_VERSION = "$UNAME_VERSION"
+ EOF
+ 
+ exit 1
+ 
+ # Local variables:
+-# eval: (add-hook 'write-file-hooks 'time-stamp)
++# eval: (add-hook 'before-save-hook 'time-stamp)
+ # time-stamp-start: "timestamp='"
+ # time-stamp-format: "%:y-%02m-%02d"
+ # time-stamp-end: "'"
+diff --git a/tools/config.sub b/tools/config.sub
+index a39437d..c95acc6 100755
+--- a/tools/config.sub
++++ b/tools/config.sub
+@@ -1,44 +1,40 @@
+ #! /bin/sh
+ # Configuration validation subroutine script.
+-#   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
+-#   2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008
+-#   Free Software Foundation, Inc.
++#   Copyright 1992-2018 Free Software Foundation, Inc.
+ 
+-timestamp='2009-04-17'
++timestamp='2018-07-03'
+ 
+-# This file is (in principle) common to ALL GNU software.
+-# The presence of a machine in this file suggests that SOME GNU software
+-# can handle that machine.  It does not imply ALL GNU software can.
+-#
+-# This file is free software; you can redistribute it and/or modify
+-# it under the terms of the GNU General Public License as published by
+-# the Free Software Foundation; either version 2 of the License, or
++# This file is free software; you can redistribute it and/or modify it
++# under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3 of the License, or
+ # (at your option) any later version.
+ #
+-# This program is distributed in the hope that it will be useful,
+-# but WITHOUT ANY WARRANTY; without even the implied warranty of
+-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-# GNU General Public License for more details.
++# This program is distributed in the hope that it will be useful, but
++# WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# General Public License for more details.
+ #
+ # You should have received a copy of the GNU General Public License
+-# along with this program; if not, write to the Free Software
+-# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA
+-# 02110-1301, USA.
++# along with this program; if not, see <https://www.gnu.org/licenses/>.
+ #
+ # As a special exception to the GNU General Public License, if you
+ # distribute this file as part of a program that contains a
+ # configuration script generated by Autoconf, you may include it under
+-# the same distribution terms that you use for the rest of that program.
++# the same distribution terms that you use for the rest of that
++# program.  This Exception is an additional permission under section 7
++# of the GNU General Public License, version 3 ("GPLv3").
+ 
+ 
+-# Please send patches to <config-patches@gnu.org>.  Submit a context
+-# diff and a properly formatted ChangeLog entry.
++# Please send patches to <config-patches@gnu.org>.
+ #
+ # Configuration subroutine to validate and canonicalize a configuration type.
+ # Supply the specified configuration type as an argument.
+ # If it is invalid, we print an error message on stderr and exit with code 1.
+ # Otherwise, we print the canonical config type on stdout and succeed.
+ 
++# You can get the latest version of this script from:
++# https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub
++
+ # This file is supposed to be the same for all GNU packages
+ # and recognize all the CPU types, system types and aliases
+ # that are meaningful with *any* GNU software.
+@@ -57,12 +53,11 @@ timestamp='2009-04-17'
+ me=`echo "$0" | sed -e 's,.*/,,'`
+ 
+ usage="\
+-Usage: $0 [OPTION] CPU-MFR-OPSYS
+-       $0 [OPTION] ALIAS
++Usage: $0 [OPTION] CPU-MFR-OPSYS or ALIAS
+ 
+ Canonicalize a configuration name.
+ 
+-Operation modes:
++Options:
+   -h, --help         print this help, then exit
+   -t, --time-stamp   print date of last modification, then exit
+   -v, --version      print version number, then exit
+@@ -72,8 +67,7 @@ Report bugs and patches to <config-patches@gnu.org>."
+ version="\
+ GNU config.sub ($timestamp)
+ 
+-Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
+-2002, 2003, 2004, 2005, 2006, 2007, 2008 Free Software Foundation, Inc.
++Copyright 1992-2018 Free Software Foundation, Inc.
+ 
+ This is free software; see the source for copying conditions.  There is NO
+ warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
+@@ -100,7 +94,7 @@ while test $# -gt 0 ; do
+ 
+     *local*)
+        # First pass through any local machine types.
+-       echo $1
++       echo "$1"
+        exit ;;
+ 
+     * )
+@@ -116,120 +110,455 @@ case $# in
+     exit 1;;
+ esac
+ 
+-# Separate what the user gave into CPU-COMPANY and OS or KERNEL-OS (if any).
+-# Here we must recognize all the valid KERNEL-OS combinations.
+-maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
+-case $maybe_os in
+-  nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-uclibc* | \
+-  uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | netbsd*-gnu* | \
+-  kopensolaris*-gnu* | \
+-  storm-chaos* | os2-emx* | rtmk-nova*)
+-    os=-$maybe_os
+-    basic_machine=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\1/'`
+-    ;;
+-  *)
+-    basic_machine=`echo $1 | sed 's/-[^-]*$//'`
+-    if [ $basic_machine != $1 ]
+-    then os=`echo $1 | sed 's/.*-/-/'`
+-    else os=; fi
+-    ;;
+-esac
++# Split fields of configuration type
++IFS="-" read -r field1 field2 field3 field4 <<EOF
++$1
++EOF
+ 
+-### Let's recognize common machines as not being operating systems so
+-### that things like config.sub decstation-3100 work.  We also
+-### recognize some manufacturers as not being operating systems, so we
+-### can provide default operating systems below.
+-case $os in
+-	-sun*os*)
+-		# Prevent following clause from handling this invalid input.
+-		;;
+-	-dec* | -mips* | -sequent* | -encore* | -pc532* | -sgi* | -sony* | \
+-	-att* | -7300* | -3300* | -delta* | -motorola* | -sun[234]* | \
+-	-unicom* | -ibm* | -next | -hp | -isi* | -apollo | -altos* | \
+-	-convergent* | -ncr* | -news | -32* | -3600* | -3100* | -hitachi* |\
+-	-c[123]* | -convex* | -sun | -crds | -omron* | -dg | -ultra | -tti* | \
+-	-harris | -dolphin | -highlevel | -gould | -cbm | -ns | -masscomp | \
+-	-apple | -axis | -knuth | -cray)
+-		os=
+-		basic_machine=$1
+-		;;
+-	-sim | -cisco | -oki | -wec | -winbond)
+-		os=
+-		basic_machine=$1
+-		;;
+-	-scout)
+-		;;
+-	-wrs)
+-		os=-vxworks
+-		basic_machine=$1
+-		;;
+-	-chorusos*)
+-		os=-chorusos
+-		basic_machine=$1
+-		;;
+- 	-chorusrdb)
+- 		os=-chorusrdb
+-		basic_machine=$1
+- 		;;
+-	-hiux*)
+-		os=-hiuxwe2
+-		;;
+-	-sco6)
+-		os=-sco5v6
+-		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+-		;;
+-	-sco5)
+-		os=-sco3.2v5
+-		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+-		;;
+-	-sco4)
+-		os=-sco3.2v4
+-		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+-		;;
+-	-sco3.2.[4-9]*)
+-		os=`echo $os | sed -e 's/sco3.2./sco3.2v/'`
+-		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+-		;;
+-	-sco3.2v[4-9]*)
+-		# Don't forget version if it is 3.2v4 or newer.
+-		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+-		;;
+-	-sco5v6*)
+-		# Don't forget version if it is 3.2v4 or newer.
+-		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+-		;;
+-	-sco*)
+-		os=-sco3.2v2
+-		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+-		;;
+-	-udk*)
+-		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+-		;;
+-	-isc)
+-		os=-isc2.2
+-		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+-		;;
+-	-clix*)
+-		basic_machine=clipper-intergraph
+-		;;
+-	-isc*)
+-		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+-		;;
+-	-lynx*)
+-		os=-lynxos
++# Separate into logical components for further validation
++case $1 in
++	*-*-*-*-*)
++		echo Invalid configuration \`"$1"\': more than four components >&2
++		exit 1
+ 		;;
+-	-ptx*)
+-		basic_machine=`echo $1 | sed -e 's/86-.*/86-sequent/'`
++	*-*-*-*)
++		basic_machine=$field1-$field2
++		os=$field3-$field4
+ 		;;
+-	-windowsnt*)
+-		os=`echo $os | sed -e 's/windowsnt/winnt/'`
++	*-*-*)
++		# Ambiguous whether COMPANY is present, or skipped and KERNEL-OS is two
++		# parts
++		maybe_os=$field2-$field3
++		case $maybe_os in
++			nto-qnx* | linux-gnu* | linux-android* | linux-dietlibc \
++			| linux-newlib* | linux-musl* | linux-uclibc* | uclinux-uclibc* \
++			| uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | netbsd*-gnu* \
++			| netbsd*-eabi* | kopensolaris*-gnu* | cloudabi*-eabi* \
++			| storm-chaos* | os2-emx* | rtmk-nova*)
++				basic_machine=$field1
++				os=$maybe_os
++				;;
++			android-linux)
++				basic_machine=$field1-unknown
++				os=linux-android
++				;;
++			*)
++				basic_machine=$field1-$field2
++				os=$field3
++				;;
++		esac
+ 		;;
+-	-psos*)
+-		os=-psos
++	*-*)
++		# Second component is usually, but not always the OS
++		case $field2 in
++			# Prevent following clause from handling this valid os
++			sun*os*)
++				basic_machine=$field1
++				os=$field2
++				;;
++			# Manufacturers
++			dec* | mips* | sequent* | encore* | pc532* | sgi* | sony* \
++			| att* | 7300* | 3300* | delta* | motorola* | sun[234]* \
++			| unicom* | ibm* | next | hp | isi* | apollo | altos* \
++			| convergent* | ncr* | news | 32* | 3600* | 3100* | hitachi* \
++			| c[123]* | convex* | sun | crds | omron* | dg | ultra | tti* \
++			| harris | dolphin | highlevel | gould | cbm | ns | masscomp \
++			| apple | axis | knuth | cray | microblaze* \
++			| sim | cisco | oki | wec | wrs | winbond)
++				basic_machine=$field1-$field2
++				os=
++				;;
++			*)
++				basic_machine=$field1
++				os=$field2
++				;;
++		esac
+ 		;;
+-	-mint | -mint[0-9]*)
+-		basic_machine=m68k-atari
+-		os=-mint
++	*)
++		# Convert single-component short-hands not valid as part of
++		# multi-component configurations.
++		case $field1 in
++			386bsd)
++				basic_machine=i386-pc
++				os=bsd
++				;;
++			a29khif)
++				basic_machine=a29k-amd
++				os=udi
++				;;
++			adobe68k)
++				basic_machine=m68010-adobe
++				os=scout
++				;;
++			am29k)
++				basic_machine=a29k-none
++				os=bsd
++				;;
++			amdahl)
++				basic_machine=580-amdahl
++				os=sysv
++				;;
++			amigaos | amigados)
++				basic_machine=m68k-unknown
++				os=amigaos
++				;;
++			amigaunix | amix)
++				basic_machine=m68k-unknown
++				os=sysv4
++				;;
++			apollo68)
++				basic_machine=m68k-apollo
++				os=sysv
++				;;
++			apollo68bsd)
++				basic_machine=m68k-apollo
++				os=bsd
++				;;
++			aros)
++				basic_machine=i386-pc
++				os=aros
++				;;
++			aux)
++				basic_machine=m68k-apple
++				os=aux
++				;;
++			balance)
++				basic_machine=ns32k-sequent
++				os=dynix
++				;;
++			blackfin)
++				basic_machine=bfin-unknown
++				os=linux
++				;;
++			cegcc)
++				basic_machine=arm-unknown
++				os=cegcc
++				;;
++			cray)
++				basic_machine=j90-cray
++				os=unicos
++				;;
++			craynv)
++				basic_machine=craynv-cray
++				os=unicosmp
++				;;
++			delta88)
++				basic_machine=m88k-motorola
++				os=sysv3
++				;;
++			dicos)
++				basic_machine=i686-pc
++				os=dicos
++				;;
++			djgpp)
++				basic_machine=i586-pc
++				os=msdosdjgpp
++				;;
++			ebmon29k)
++				basic_machine=a29k-amd
++				os=ebmon
++				;;
++			es1800 | OSE68k | ose68k | ose | OSE)
++				basic_machine=m68k-ericsson
++				os=ose
++				;;
++			gmicro)
++				basic_machine=tron-gmicro
++				os=sysv
++				;;
++			go32)
++				basic_machine=i386-pc
++				os=go32
++				;;
++			h8300hms)
++				basic_machine=h8300-hitachi
++				os=hms
++				;;
++			h8300xray)
++				basic_machine=h8300-hitachi
++				os=xray
++				;;
++			h8500hms)
++				basic_machine=h8500-hitachi
++				os=hms
++				;;
++			harris)
++				basic_machine=m88k-harris
++				os=sysv3
++				;;
++			hp300bsd)
++				basic_machine=m68k-hp
++				os=bsd
++				;;
++			hp300hpux)
++				basic_machine=m68k-hp
++				os=hpux
++				;;
++			hppaosf)
++				basic_machine=hppa1.1-hp
++				os=osf
++				;;
++			hppro)
++				basic_machine=hppa1.1-hp
++				os=proelf
++				;;
++			i386mach)
++				basic_machine=i386-mach
++				os=mach
++				;;
++			vsta)
++				basic_machine=i386-unknown
++				os=vsta
++				;;
++			isi68 | isi)
++				basic_machine=m68k-isi
++				os=sysv
++				;;
++			m68knommu)
++				basic_machine=m68k-unknown
++				os=linux
++				;;
++			magnum | m3230)
++				basic_machine=mips-mips
++				os=sysv
++				;;
++			merlin)
++				basic_machine=ns32k-utek
++				os=sysv
++				;;
++			mingw64)
++				basic_machine=x86_64-pc
++				os=mingw64
++				;;
++			mingw32)
++				basic_machine=i686-pc
++				os=mingw32
++				;;
++			mingw32ce)
++				basic_machine=arm-unknown
++				os=mingw32ce
++				;;
++			monitor)
++				basic_machine=m68k-rom68k
++				os=coff
++				;;
++			morphos)
++				basic_machine=powerpc-unknown
++				os=morphos
++				;;
++			moxiebox)
++				basic_machine=moxie-unknown
++				os=moxiebox
++				;;
++			msdos)
++				basic_machine=i386-pc
++				os=msdos
++				;;
++			msys)
++				basic_machine=i686-pc
++				os=msys
++				;;
++			mvs)
++				basic_machine=i370-ibm
++				os=mvs
++				;;
++			nacl)
++				basic_machine=le32-unknown
++				os=nacl
++				;;
++			ncr3000)
++				basic_machine=i486-ncr
++				os=sysv4
++				;;
++			netbsd386)
++				basic_machine=i386-unknown
++				os=netbsd
++				;;
++			netwinder)
++				basic_machine=armv4l-rebel
++				os=linux
++				;;
++			news | news700 | news800 | news900)
++				basic_machine=m68k-sony
++				os=newsos
++				;;
++			news1000)
++				basic_machine=m68030-sony
++				os=newsos
++				;;
++			necv70)
++				basic_machine=v70-nec
++				os=sysv
++				;;
++			nh3000)
++				basic_machine=m68k-harris
++				os=cxux
++				;;
++			nh[45]000)
++				basic_machine=m88k-harris
++				os=cxux
++				;;
++			nindy960)
++				basic_machine=i960-intel
++				os=nindy
++				;;
++			mon960)
++				basic_machine=i960-intel
++				os=mon960
++				;;
++			nonstopux)
++				basic_machine=mips-compaq
++				os=nonstopux
++				;;
++			os400)
++				basic_machine=powerpc-ibm
++				os=os400
++				;;
++			OSE68000 | ose68000)
++				basic_machine=m68000-ericsson
++				os=ose
++				;;
++			os68k)
++				basic_machine=m68k-none
++				os=os68k
++				;;
++			paragon)
++				basic_machine=i860-intel
++				os=osf
++				;;
++			parisc)
++				basic_machine=hppa-unknown
++				os=linux
++				;;
++			pw32)
++				basic_machine=i586-unknown
++				os=pw32
++				;;
++			rdos | rdos64)
++				basic_machine=x86_64-pc
++				os=rdos
++				;;
++			rdos32)
++				basic_machine=i386-pc
++				os=rdos
++				;;
++			rom68k)
++				basic_machine=m68k-rom68k
++				os=coff
++				;;
++			sa29200)
++				basic_machine=a29k-amd
++				os=udi
++				;;
++			sei)
++				basic_machine=mips-sei
++				os=seiux
++				;;
++			sps7)
++				basic_machine=m68k-bull
++				os=sysv2
++				;;
++			stratus)
++				basic_machine=i860-stratus
++				os=sysv4
++				;;
++			sun2os3)
++				basic_machine=m68000-sun
++				os=sunos3
++				;;
++			sun2os4)
++				basic_machine=m68000-sun
++				os=sunos4
++				;;
++			sun3os3)
++				basic_machine=m68k-sun
++				os=sunos3
++				;;
++			sun3os4)
++				basic_machine=m68k-sun
++				os=sunos4
++				;;
++			sun4os3)
++				basic_machine=sparc-sun
++				os=sunos3
++				;;
++			sun4os4)
++				basic_machine=sparc-sun
++				os=sunos4
++				;;
++			sun4sol2)
++				basic_machine=sparc-sun
++				os=solaris2
++				;;
++			sv1)
++				basic_machine=sv1-cray
++				os=unicos
++				;;
++			symmetry)
++				basic_machine=i386-sequent
++				os=dynix
++				;;
++			t3e)
++				basic_machine=alphaev5-cray
++				os=unicos
++				;;
++			t90)
++				basic_machine=t90-cray
++				os=unicos
++				;;
++			toad1)
++				basic_machine=pdp10-xkl
++				os=tops20
++				;;
++			tpf)
++				basic_machine=s390x-ibm
++				os=tpf
++				;;
++			udi29k)
++				basic_machine=a29k-amd
++				os=udi
++				;;
++			ultra3)
++				basic_machine=a29k-nyu
++				os=sym1
++				;;
++			v810 | necv810)
++				basic_machine=v810-nec
++				os=none
++				;;
++			vaxv)
++				basic_machine=vax-dec
++				os=sysv
++				;;
++			vms)
++				basic_machine=vax-dec
++				os=vms
++				;;
++			vxworks960)
++				basic_machine=i960-wrs
++				os=vxworks
++				;;
++			vxworks68)
++				basic_machine=m68k-wrs
++				os=vxworks
++				;;
++			vxworks29k)
++				basic_machine=a29k-wrs
++				os=vxworks
++				;;
++			xbox)
++				basic_machine=i686-pc
++				os=mingw32
++				;;
++			ymp)
++				basic_machine=ymp-cray
++				os=unicos
++				;;
++			*)
++				basic_machine=$1
++				os=
++				;;
++		esac
+ 		;;
+ esac
+ 
+@@ -239,20 +568,29 @@ case $basic_machine in
+ 	# Some are omitted here because they have special meanings below.
+ 	1750a | 580 \
+ 	| a29k \
++	| aarch64 | aarch64_be \
+ 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
+ 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[67] \
+ 	| am33_2.0 \
+-	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr | avr32 \
++	| arc | arceb \
++	| arm | arm[bl]e | arme[lb] | armv[2-8] | armv[3-8][lb] | armv6m | armv[78][arm] \
++	| avr | avr32 \
++	| ba \
++	| be32 | be64 \
+ 	| bfin \
+-	| c4x | clipper \
++	| c4x | c8051 | clipper | csky \
+ 	| d10v | d30v | dlx | dsp16xx \
+-	| fido | fr30 | frv \
++	| e2k | epiphany \
++	| fido | fr30 | frv | ft32 \
+ 	| h8300 | h8500 | hppa | hppa1.[01] | hppa2.0 | hppa2.0[nw] | hppa64 \
+-	| i370 | i860 | i960 | ia64 \
++	| hexagon \
++	| i370 | i860 | i960 | ia16 | ia64 \
+ 	| ip2k | iq2000 \
++	| k1om \
++	| le32 | le64 \
+ 	| lm32 \
+ 	| m32c | m32r | m32rle | m68000 | m68k | m88k \
+-	| maxq | mb | microblaze | mcore | mep | metag \
++	| maxq | mb | microblaze | microblazeel | mcore | mep | metag \
+ 	| mips | mipsbe | mipseb | mipsel | mipsle \
+ 	| mips16 \
+ 	| mips64 | mips64el \
+@@ -266,44 +604,83 @@ case $basic_machine in
+ 	| mips64vr5900 | mips64vr5900el \
+ 	| mipsisa32 | mipsisa32el \
+ 	| mipsisa32r2 | mipsisa32r2el \
++	| mipsisa32r6 | mipsisa32r6el \
+ 	| mipsisa64 | mipsisa64el \
+ 	| mipsisa64r2 | mipsisa64r2el \
++	| mipsisa64r6 | mipsisa64r6el \
+ 	| mipsisa64sb1 | mipsisa64sb1el \
+ 	| mipsisa64sr71k | mipsisa64sr71kel \
++	| mipsr5900 | mipsr5900el \
+ 	| mipstx39 | mipstx39el \
+ 	| mn10200 | mn10300 \
+ 	| moxie \
+ 	| mt \
+ 	| msp430 \
+-	| nios | nios2 \
++	| nds32 | nds32le | nds32be \
++	| nfp \
++	| nios | nios2 | nios2eb | nios2el \
+ 	| ns16k | ns32k \
+-	| or32 \
+-	| pdp10 | pdp11 | pj | pjl \
+-	| powerpc | powerpc64 | powerpc64le | powerpcle | ppcbe \
++	| open8 | or1k | or1knd | or32 \
++	| pdp10 | pj | pjl \
++	| powerpc | powerpc64 | powerpc64le | powerpcle \
++	| pru \
+ 	| pyramid \
++	| riscv | riscv32 | riscv64 \
++	| rl78 | rx \
+ 	| score \
+-	| sh | sh[1234] | sh[24]a | sh[24]aeb | sh[23]e | sh[34]eb | sheb | shbe | shle | sh[1234]le | sh3ele \
++	| sh | sh[1234] | sh[24]a | sh[24]aeb | sh[23]e | sh[234]eb | sheb | shbe | shle | sh[1234]le | sh3ele \
+ 	| sh64 | sh64le \
+ 	| sparc | sparc64 | sparc64b | sparc64v | sparc86x | sparclet | sparclite \
+ 	| sparcv8 | sparcv9 | sparcv9b | sparcv9v \
+-	| spu | strongarm \
+-	| tahoe | thumb | tic4x | tic80 | tron \
+-	| v850 | v850e \
+-	| we32k \
+-	| x86 | xc16x | xscale | xscalee[bl] | xstormy16 | xtensa \
++	| spu \
++	| tahoe | tic4x | tic54x | tic55x | tic6x | tic80 | tron \
++	| ubicom32 \
++	| v850 | v850e | v850e1 | v850e2 | v850es | v850e2v3 \
++	| visium \
++	| wasm32 \
++	| x86 | xc16x | xstormy16 | xtensa \
+ 	| z8k | z80)
+ 		basic_machine=$basic_machine-unknown
+ 		;;
+-	m6811 | m68hc11 | m6812 | m68hc12)
+-		# Motorola 68HC11/12.
++	c54x)
++		basic_machine=tic54x-unknown
++		;;
++	c55x)
++		basic_machine=tic55x-unknown
++		;;
++	c6x)
++		basic_machine=tic6x-unknown
++		;;
++	leon|leon[3-9])
++		basic_machine=sparc-$basic_machine
++		;;
++	m6811 | m68hc11 | m6812 | m68hc12 | m68hcs12x | nvptx | picochip)
+ 		basic_machine=$basic_machine-unknown
+-		os=-none
++		os=${os:-none}
+ 		;;
+-	m88110 | m680[12346]0 | m683?2 | m68360 | m5200 | v70 | w65 | z8k)
++	m88110 | m680[12346]0 | m683?2 | m68360 | m5200 | v70 | w65)
++		;;
++	m9s12z | m68hcs12z | hcs12z | s12z)
++		basic_machine=s12z-unknown
++		os=${os:-none}
+ 		;;
+ 	ms1)
+ 		basic_machine=mt-unknown
+ 		;;
++	strongarm | thumb | xscale)
++		basic_machine=arm-unknown
++		;;
++	xgate)
++		basic_machine=$basic_machine-unknown
++		os=${os:-none}
++		;;
++	xscaleeb)
++		basic_machine=armeb-unknown
++		;;
++
++	xscaleel)
++		basic_machine=armel-unknown
++		;;
+ 
+ 	# We use `pc' rather than `unknown'
+ 	# because (1) that's what they normally are, and
+@@ -311,33 +688,35 @@ case $basic_machine in
+ 	i*86 | x86_64)
+ 	  basic_machine=$basic_machine-pc
+ 	  ;;
+-	# Object if more than one company name word.
+-	*-*-*)
+-		echo Invalid configuration \`$1\': machine \`$basic_machine\' not recognized 1>&2
+-		exit 1
+-		;;
+ 	# Recognize the basic CPU types with company name.
+ 	580-* \
+ 	| a29k-* \
++	| aarch64-* | aarch64_be-* \
+ 	| alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
+ 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
+-	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
++	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* | arceb-* \
+ 	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
+ 	| avr-* | avr32-* \
++	| ba-* \
++	| be32-* | be64-* \
+ 	| bfin-* | bs2000-* \
+-	| c[123]* | c30-* | [cjt]90-* | c4x-* | c54x-* | c55x-* | c6x-* \
+-	| clipper-* | craynv-* | cydra-* \
++	| c[123]* | c30-* | [cjt]90-* | c4x-* \
++	| c8051-* | clipper-* | craynv-* | csky-* | cydra-* \
+ 	| d10v-* | d30v-* | dlx-* \
+-	| elxsi-* \
++	| e2k-* | elxsi-* \
+ 	| f30[01]-* | f700-* | fido-* | fr30-* | frv-* | fx80-* \
+ 	| h8300-* | h8500-* \
+ 	| hppa-* | hppa1.[01]-* | hppa2.0-* | hppa2.0[nw]-* | hppa64-* \
+-	| i*86-* | i860-* | i960-* | ia64-* \
++	| hexagon-* \
++	| i*86-* | i860-* | i960-* | ia16-* | ia64-* \
+ 	| ip2k-* | iq2000-* \
++	| k1om-* \
++	| le32-* | le64-* \
+ 	| lm32-* \
+ 	| m32c-* | m32r-* | m32rle-* \
+ 	| m68000-* | m680[012346]0-* | m68360-* | m683?2-* | m68k-* \
+ 	| m88110-* | m88k-* | maxq-* | mcore-* | metag-* \
++	| microblaze-* | microblazeel-* \
+ 	| mips-* | mipsbe-* | mipseb-* | mipsel-* | mipsle-* \
+ 	| mips16-* \
+ 	| mips64-* | mips64el-* \
+@@ -351,32 +730,46 @@ case $basic_machine in
+ 	| mips64vr5900-* | mips64vr5900el-* \
+ 	| mipsisa32-* | mipsisa32el-* \
+ 	| mipsisa32r2-* | mipsisa32r2el-* \
++	| mipsisa32r6-* | mipsisa32r6el-* \
+ 	| mipsisa64-* | mipsisa64el-* \
+ 	| mipsisa64r2-* | mipsisa64r2el-* \
++	| mipsisa64r6-* | mipsisa64r6el-* \
+ 	| mipsisa64sb1-* | mipsisa64sb1el-* \
+ 	| mipsisa64sr71k-* | mipsisa64sr71kel-* \
++	| mipsr5900-* | mipsr5900el-* \
+ 	| mipstx39-* | mipstx39el-* \
+ 	| mmix-* \
+ 	| mt-* \
+ 	| msp430-* \
+-	| nios-* | nios2-* \
++	| nds32-* | nds32le-* | nds32be-* \
++	| nfp-* \
++	| nios-* | nios2-* | nios2eb-* | nios2el-* \
+ 	| none-* | np1-* | ns16k-* | ns32k-* \
++	| open8-* \
++	| or1k*-* \
+ 	| orion-* \
+ 	| pdp10-* | pdp11-* | pj-* | pjl-* | pn-* | power-* \
+-	| powerpc-* | powerpc64-* | powerpc64le-* | powerpcle-* | ppcbe-* \
++	| powerpc-* | powerpc64-* | powerpc64le-* | powerpcle-* \
++	| pru-* \
+ 	| pyramid-* \
+-	| romp-* | rs6000-* \
++	| riscv-* | riscv32-* | riscv64-* \
++	| rl78-* | romp-* | rs6000-* | rx-* \
+ 	| sh-* | sh[1234]-* | sh[24]a-* | sh[24]aeb-* | sh[23]e-* | sh[34]eb-* | sheb-* | shbe-* \
+ 	| shle-* | sh[1234]le-* | sh3ele-* | sh64-* | sh64le-* \
+ 	| sparc-* | sparc64-* | sparc64b-* | sparc64v-* | sparc86x-* | sparclet-* \
+ 	| sparclite-* \
+-	| sparcv8-* | sparcv9-* | sparcv9b-* | sparcv9v-* | strongarm-* | sv1-* | sx?-* \
+-	| tahoe-* | thumb-* \
+-	| tic30-* | tic4x-* | tic54x-* | tic55x-* | tic6x-* | tic80-* | tile-* \
++	| sparcv8-* | sparcv9-* | sparcv9b-* | sparcv9v-* | sv1-* | sx*-* \
++	| tahoe-* \
++	| tic30-* | tic4x-* | tic54x-* | tic55x-* | tic6x-* | tic80-* \
++	| tile*-* \
+ 	| tron-* \
+-	| v850-* | v850e-* | vax-* \
++	| ubicom32-* \
++	| v850-* | v850e-* | v850e1-* | v850es-* | v850e2-* | v850e2v3-* \
++	| vax-* \
++	| visium-* \
++	| wasm32-* \
+ 	| we32k-* \
+-	| x86-* | x86_64-* | xc16x-* | xps100-* | xscale-* | xscalee[bl]-* \
++	| x86-* | x86_64-* | xc16x-* | xps100-* \
+ 	| xstormy16-* | xtensa*-* \
+ 	| ymp-* \
+ 	| z8k-* | z80-*)
+@@ -387,125 +780,77 @@ case $basic_machine in
+ 		;;
+ 	# Recognize the various machine names and aliases which stand
+ 	# for a CPU type and a company and sometimes even an OS.
+-	386bsd)
+-		basic_machine=i386-unknown
+-		os=-bsd
+-		;;
+ 	3b1 | 7300 | 7300-att | att-7300 | pc7300 | safari | unixpc)
+ 		basic_machine=m68000-att
+ 		;;
+ 	3b*)
+ 		basic_machine=we32k-att
+ 		;;
+-	a29khif)
+-		basic_machine=a29k-amd
+-		os=-udi
+-		;;
+-    	abacus)
++	abacus)
+ 		basic_machine=abacus-unknown
+ 		;;
+-	adobe68k)
+-		basic_machine=m68010-adobe
+-		os=-scout
+-		;;
+ 	alliant | fx80)
+ 		basic_machine=fx80-alliant
+ 		;;
+ 	altos | altos3068)
+ 		basic_machine=m68k-altos
+ 		;;
+-	am29k)
+-		basic_machine=a29k-none
+-		os=-bsd
+-		;;
+ 	amd64)
+ 		basic_machine=x86_64-pc
+ 		;;
+ 	amd64-*)
+-		basic_machine=x86_64-`echo $basic_machine | sed 's/^[^-]*-//'`
+-		;;
+-	amdahl)
+-		basic_machine=580-amdahl
+-		os=-sysv
++		basic_machine=x86_64-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+ 	amiga | amiga-*)
+ 		basic_machine=m68k-unknown
+ 		;;
+-	amigaos | amigados)
+-		basic_machine=m68k-unknown
+-		os=-amigaos
+-		;;
+-	amigaunix | amix)
+-		basic_machine=m68k-unknown
+-		os=-sysv4
+-		;;
+-	apollo68)
+-		basic_machine=m68k-apollo
+-		os=-sysv
+-		;;
+-	apollo68bsd)
+-		basic_machine=m68k-apollo
+-		os=-bsd
++	asmjs)
++		basic_machine=asmjs-unknown
+ 		;;
+-	aros)
+-		basic_machine=i386-pc
+-		os=-aros
++	blackfin-*)
++		basic_machine=bfin-`echo "$basic_machine" | sed 's/^[^-]*-//'`
++		os=linux
+ 		;;
+-	aux)
+-		basic_machine=m68k-apple
+-		os=-aux
++	bluegene*)
++		basic_machine=powerpc-ibm
++		os=cnk
+ 		;;
+-	balance)
+-		basic_machine=ns32k-sequent
+-		os=-dynix
++	c54x-*)
++		basic_machine=tic54x-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+-	blackfin)
+-		basic_machine=bfin-unknown
+-		os=-linux
++	c55x-*)
++		basic_machine=tic55x-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+-	blackfin-*)
+-		basic_machine=bfin-`echo $basic_machine | sed 's/^[^-]*-//'`
+-		os=-linux
++	c6x-*)
++		basic_machine=tic6x-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+ 	c90)
+ 		basic_machine=c90-cray
+-		os=-unicos
+-		;;
+-        cegcc)
+-		basic_machine=arm-unknown
+-		os=-cegcc
++		os=${os:-unicos}
+ 		;;
+ 	convex-c1)
+ 		basic_machine=c1-convex
+-		os=-bsd
++		os=bsd
+ 		;;
+ 	convex-c2)
+ 		basic_machine=c2-convex
+-		os=-bsd
++		os=bsd
+ 		;;
+ 	convex-c32)
+ 		basic_machine=c32-convex
+-		os=-bsd
++		os=bsd
+ 		;;
+ 	convex-c34)
+ 		basic_machine=c34-convex
+-		os=-bsd
++		os=bsd
+ 		;;
+ 	convex-c38)
+ 		basic_machine=c38-convex
+-		os=-bsd
+-		;;
+-	cray | j90)
+-		basic_machine=j90-cray
+-		os=-unicos
+-		;;
+-	craynv)
+-		basic_machine=craynv-cray
+-		os=-unicosmp
++		os=bsd
+ 		;;
+-	cr16)
++	cr16 | cr16-*)
+ 		basic_machine=cr16-unknown
+-		os=-elf
++		os=${os:-elf}
+ 		;;
+ 	crds | unos)
+ 		basic_machine=m68k-crds
+@@ -518,7 +863,7 @@ case $basic_machine in
+ 		;;
+ 	crx)
+ 		basic_machine=crx-unknown
+-		os=-elf
++		os=${os:-elf}
+ 		;;
+ 	da30 | da30-*)
+ 		basic_machine=m68k-da30
+@@ -528,50 +873,38 @@ case $basic_machine in
+ 		;;
+ 	decsystem10* | dec10*)
+ 		basic_machine=pdp10-dec
+-		os=-tops10
++		os=tops10
+ 		;;
+ 	decsystem20* | dec20*)
+ 		basic_machine=pdp10-dec
+-		os=-tops20
++		os=tops20
+ 		;;
+ 	delta | 3300 | motorola-3300 | motorola-delta \
+ 	      | 3300-motorola | delta-motorola)
+ 		basic_machine=m68k-motorola
+ 		;;
+-	delta88)
+-		basic_machine=m88k-motorola
+-		os=-sysv3
+-		;;
+-	dicos)
+-		basic_machine=i686-pc
+-		os=-dicos
+-		;;
+-	djgpp)
+-		basic_machine=i586-pc
+-		os=-msdosdjgpp
+-		;;
+ 	dpx20 | dpx20-*)
+ 		basic_machine=rs6000-bull
+-		os=-bosx
++		os=${os:-bosx}
+ 		;;
+-	dpx2* | dpx2*-bull)
++	dpx2*)
+ 		basic_machine=m68k-bull
+-		os=-sysv3
++		os=sysv3
+ 		;;
+-	ebmon29k)
+-		basic_machine=a29k-amd
+-		os=-ebmon
++	e500v[12])
++		basic_machine=powerpc-unknown
++		os=$os"spe"
+ 		;;
+-	elxsi)
+-		basic_machine=elxsi-elxsi
+-		os=-bsd
++	e500v[12]-*)
++		basic_machine=powerpc-`echo "$basic_machine" | sed 's/^[^-]*-//'`
++		os=$os"spe"
+ 		;;
+ 	encore | umax | mmax)
+ 		basic_machine=ns32k-encore
+ 		;;
+-	es1800 | OSE68k | ose68k | ose | OSE)
+-		basic_machine=m68k-ericsson
+-		os=-ose
++	elxsi)
++		basic_machine=elxsi-elxsi
++		os=${os:-bsd}
+ 		;;
+ 	fx2800)
+ 		basic_machine=i860-alliant
+@@ -579,45 +912,13 @@ case $basic_machine in
+ 	genix)
+ 		basic_machine=ns32k-ns
+ 		;;
+-	gmicro)
+-		basic_machine=tron-gmicro
+-		os=-sysv
+-		;;
+-	go32)
+-		basic_machine=i386-pc
+-		os=-go32
+-		;;
+ 	h3050r* | hiux*)
+ 		basic_machine=hppa1.1-hitachi
+-		os=-hiuxwe2
+-		;;
+-	h8300hms)
+-		basic_machine=h8300-hitachi
+-		os=-hms
+-		;;
+-	h8300xray)
+-		basic_machine=h8300-hitachi
+-		os=-xray
+-		;;
+-	h8500hms)
+-		basic_machine=h8500-hitachi
+-		os=-hms
+-		;;
+-	harris)
+-		basic_machine=m88k-harris
+-		os=-sysv3
++		os=hiuxwe2
+ 		;;
+ 	hp300-*)
+ 		basic_machine=m68k-hp
+ 		;;
+-	hp300bsd)
+-		basic_machine=m68k-hp
+-		os=-bsd
+-		;;
+-	hp300hpux)
+-		basic_machine=m68k-hp
+-		os=-hpux
+-		;;
+ 	hp3k9[0-9][0-9] | hp9[0-9][0-9])
+ 		basic_machine=hppa1.0-hp
+ 		;;
+@@ -647,219 +948,114 @@ case $basic_machine in
+ 	hp9k8[0-9][0-9] | hp8[0-9][0-9])
+ 		basic_machine=hppa1.0-hp
+ 		;;
+-	hppa-next)
+-		os=-nextstep3
+-		;;
+-	hppaosf)
+-		basic_machine=hppa1.1-hp
+-		os=-osf
+-		;;
+-	hppro)
+-		basic_machine=hppa1.1-hp
+-		os=-proelf
+-		;;
+ 	i370-ibm* | ibm*)
+ 		basic_machine=i370-ibm
+ 		;;
+-# I'm not sure what "Sysv32" means.  Should this be sysv3.2?
+ 	i*86v32)
+-		basic_machine=`echo $1 | sed -e 's/86.*/86-pc/'`
+-		os=-sysv32
++		basic_machine=`echo "$1" | sed -e 's/86.*/86-pc/'`
++		os=sysv32
+ 		;;
+ 	i*86v4*)
+-		basic_machine=`echo $1 | sed -e 's/86.*/86-pc/'`
+-		os=-sysv4
++		basic_machine=`echo "$1" | sed -e 's/86.*/86-pc/'`
++		os=sysv4
+ 		;;
+ 	i*86v)
+-		basic_machine=`echo $1 | sed -e 's/86.*/86-pc/'`
+-		os=-sysv
++		basic_machine=`echo "$1" | sed -e 's/86.*/86-pc/'`
++		os=sysv
+ 		;;
+ 	i*86sol2)
+-		basic_machine=`echo $1 | sed -e 's/86.*/86-pc/'`
+-		os=-solaris2
++		basic_machine=`echo "$1" | sed -e 's/86.*/86-pc/'`
++		os=solaris2
+ 		;;
+-	i386mach)
+-		basic_machine=i386-mach
+-		os=-mach
+-		;;
+-	i386-vsta | vsta)
+-		basic_machine=i386-unknown
+-		os=-vsta
++	j90 | j90-cray)
++		basic_machine=j90-cray
++		os=${os:-unicos}
+ 		;;
+ 	iris | iris4d)
+ 		basic_machine=mips-sgi
+ 		case $os in
+-		    -irix*)
++		    irix*)
+ 			;;
+ 		    *)
+-			os=-irix4
++			os=irix4
+ 			;;
+ 		esac
+ 		;;
+-	isi68 | isi)
+-		basic_machine=m68k-isi
+-		os=-sysv
+-		;;
+-	m68knommu)
+-		basic_machine=m68k-unknown
+-		os=-linux
++	leon-*|leon[3-9]-*)
++		basic_machine=sparc-`echo "$basic_machine" | sed 's/-.*//'`
+ 		;;
+ 	m68knommu-*)
+-		basic_machine=m68k-`echo $basic_machine | sed 's/^[^-]*-//'`
+-		os=-linux
+-		;;
+-	m88k-omron*)
+-		basic_machine=m88k-omron
+-		;;
+-	magnum | m3230)
+-		basic_machine=mips-mips
+-		os=-sysv
+-		;;
+-	merlin)
+-		basic_machine=ns32k-utek
+-		os=-sysv
+-		;;
+-	mingw32)
+-		basic_machine=i386-pc
+-		os=-mingw32
++		basic_machine=m68k-`echo "$basic_machine" | sed 's/^[^-]*-//'`
++		os=linux
+ 		;;
+-	mingw32ce)
+-		basic_machine=arm-unknown
+-		os=-mingw32ce
++	microblaze*)
++		basic_machine=microblaze-xilinx
+ 		;;
+ 	miniframe)
+ 		basic_machine=m68000-convergent
+ 		;;
+-	*mint | -mint[0-9]* | *MiNT | *MiNT[0-9]*)
++	*mint | mint[0-9]* | *MiNT | *MiNT[0-9]*)
+ 		basic_machine=m68k-atari
+-		os=-mint
++		os=mint
+ 		;;
+ 	mips3*-*)
+-		basic_machine=`echo $basic_machine | sed -e 's/mips3/mips64/'`
++		basic_machine=`echo "$basic_machine" | sed -e 's/mips3/mips64/'`
+ 		;;
+ 	mips3*)
+-		basic_machine=`echo $basic_machine | sed -e 's/mips3/mips64/'`-unknown
+-		;;
+-	monitor)
+-		basic_machine=m68k-rom68k
+-		os=-coff
+-		;;
+-	morphos)
+-		basic_machine=powerpc-unknown
+-		os=-morphos
+-		;;
+-	msdos)
+-		basic_machine=i386-pc
+-		os=-msdos
++		basic_machine=`echo "$basic_machine" | sed -e 's/mips3/mips64/'`-unknown
+ 		;;
+ 	ms1-*)
+-		basic_machine=`echo $basic_machine | sed -e 's/ms1-/mt-/'`
+-		;;
+-	mvs)
+-		basic_machine=i370-ibm
+-		os=-mvs
+-		;;
+-	ncr3000)
+-		basic_machine=i486-ncr
+-		os=-sysv4
+-		;;
+-	netbsd386)
+-		basic_machine=i386-unknown
+-		os=-netbsd
+-		;;
+-	netwinder)
+-		basic_machine=armv4l-rebel
+-		os=-linux
+-		;;
+-	news | news700 | news800 | news900)
+-		basic_machine=m68k-sony
+-		os=-newsos
+-		;;
+-	news1000)
+-		basic_machine=m68030-sony
+-		os=-newsos
++		basic_machine=`echo "$basic_machine" | sed -e 's/ms1-/mt-/'`
+ 		;;
+ 	news-3600 | risc-news)
+ 		basic_machine=mips-sony
+-		os=-newsos
++		os=newsos
+ 		;;
+-	necv70)
+-		basic_machine=v70-nec
+-		os=-sysv
+-		;;
+-	next | m*-next )
++	next | m*-next)
+ 		basic_machine=m68k-next
+ 		case $os in
+-		    -nextstep* )
++		    nextstep* )
+ 			;;
+-		    -ns2*)
+-		      os=-nextstep2
++		    ns2*)
++		      os=nextstep2
+ 			;;
+ 		    *)
+-		      os=-nextstep3
++		      os=nextstep3
+ 			;;
+ 		esac
+ 		;;
+-	nh3000)
+-		basic_machine=m68k-harris
+-		os=-cxux
+-		;;
+-	nh[45]000)
+-		basic_machine=m88k-harris
+-		os=-cxux
+-		;;
+-	nindy960)
+-		basic_machine=i960-intel
+-		os=-nindy
+-		;;
+-	mon960)
+-		basic_machine=i960-intel
+-		os=-mon960
+-		;;
+-	nonstopux)
+-		basic_machine=mips-compaq
+-		os=-nonstopux
+-		;;
+ 	np1)
+ 		basic_machine=np1-gould
+ 		;;
++	neo-tandem)
++		basic_machine=neo-tandem
++		;;
++	nse-tandem)
++		basic_machine=nse-tandem
++		;;
+ 	nsr-tandem)
+ 		basic_machine=nsr-tandem
+ 		;;
++	nsv-tandem)
++		basic_machine=nsv-tandem
++		;;
++	nsx-tandem)
++		basic_machine=nsx-tandem
++		;;
+ 	op50n-* | op60c-*)
+ 		basic_machine=hppa1.1-oki
+-		os=-proelf
++		os=proelf
+ 		;;
+ 	openrisc | openrisc-*)
+ 		basic_machine=or32-unknown
+ 		;;
+-	os400)
+-		basic_machine=powerpc-ibm
+-		os=-os400
+-		;;
+-	OSE68000 | ose68000)
+-		basic_machine=m68000-ericsson
+-		os=-ose
+-		;;
+-	os68k)
+-		basic_machine=m68k-none
+-		os=-os68k
+-		;;
+ 	pa-hitachi)
+ 		basic_machine=hppa1.1-hitachi
+-		os=-hiuxwe2
+-		;;
+-	paragon)
+-		basic_machine=i860-intel
+-		os=-osf
+-		;;
+-	parisc)
+-		basic_machine=hppa-unknown
+-		os=-linux
++		os=hiuxwe2
+ 		;;
+ 	parisc-*)
+-		basic_machine=hppa-`echo $basic_machine | sed 's/^[^-]*-//'`
+-		os=-linux
++		basic_machine=hppa-`echo "$basic_machine" | sed 's/^[^-]*-//'`
++		os=linux
+ 		;;
+ 	pbd)
+ 		basic_machine=sparc-tti
+@@ -874,7 +1070,7 @@ case $basic_machine in
+ 		basic_machine=i386-pc
+ 		;;
+ 	pc98-*)
+-		basic_machine=i386-`echo $basic_machine | sed 's/^[^-]*-//'`
++		basic_machine=i386-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+ 	pentium | p5 | k5 | k6 | nexgen | viac3)
+ 		basic_machine=i586-pc
+@@ -889,57 +1085,46 @@ case $basic_machine in
+ 		basic_machine=i786-pc
+ 		;;
+ 	pentium-* | p5-* | k5-* | k6-* | nexgen-* | viac3-*)
+-		basic_machine=i586-`echo $basic_machine | sed 's/^[^-]*-//'`
++		basic_machine=i586-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+ 	pentiumpro-* | p6-* | 6x86-* | athlon-*)
+-		basic_machine=i686-`echo $basic_machine | sed 's/^[^-]*-//'`
++		basic_machine=i686-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+ 	pentiumii-* | pentium2-* | pentiumiii-* | pentium3-*)
+-		basic_machine=i686-`echo $basic_machine | sed 's/^[^-]*-//'`
++		basic_machine=i686-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+ 	pentium4-*)
+-		basic_machine=i786-`echo $basic_machine | sed 's/^[^-]*-//'`
++		basic_machine=i786-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+ 	pn)
+ 		basic_machine=pn-gould
+ 		;;
+ 	power)	basic_machine=power-ibm
+ 		;;
+-	ppc)	basic_machine=powerpc-unknown
++	ppc | ppcbe)	basic_machine=powerpc-unknown
+ 		;;
+-	ppc-*)	basic_machine=powerpc-`echo $basic_machine | sed 's/^[^-]*-//'`
++	ppc-* | ppcbe-*)
++		basic_machine=powerpc-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+-	ppcle | powerpclittle | ppc-le | powerpc-little)
++	ppcle | powerpclittle)
+ 		basic_machine=powerpcle-unknown
+ 		;;
+ 	ppcle-* | powerpclittle-*)
+-		basic_machine=powerpcle-`echo $basic_machine | sed 's/^[^-]*-//'`
++		basic_machine=powerpcle-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+ 	ppc64)	basic_machine=powerpc64-unknown
+ 		;;
+-	ppc64-*) basic_machine=powerpc64-`echo $basic_machine | sed 's/^[^-]*-//'`
++	ppc64-*) basic_machine=powerpc64-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+-	ppc64le | powerpc64little | ppc64-le | powerpc64-little)
++	ppc64le | powerpc64little)
+ 		basic_machine=powerpc64le-unknown
+ 		;;
+ 	ppc64le-* | powerpc64little-*)
+-		basic_machine=powerpc64le-`echo $basic_machine | sed 's/^[^-]*-//'`
++		basic_machine=powerpc64le-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+ 	ps2)
+ 		basic_machine=i386-ibm
+ 		;;
+-	pw32)
+-		basic_machine=i586-unknown
+-		os=-pw32
+-		;;
+-	rdos)
+-		basic_machine=i386-pc
+-		os=-rdos
+-		;;
+-	rom68k)
+-		basic_machine=m68k-rom68k
+-		os=-coff
+-		;;
+ 	rm[46]00)
+ 		basic_machine=mips-siemens
+ 		;;
+@@ -952,10 +1137,6 @@ case $basic_machine in
+ 	s390x | s390x-*)
+ 		basic_machine=s390x-ibm
+ 		;;
+-	sa29200)
+-		basic_machine=a29k-amd
+-		os=-udi
+-		;;
+ 	sb1)
+ 		basic_machine=mipsisa64sb1-unknown
+ 		;;
+@@ -964,32 +1145,17 @@ case $basic_machine in
+ 		;;
+ 	sde)
+ 		basic_machine=mipsisa32-sde
+-		os=-elf
+-		;;
+-	sei)
+-		basic_machine=mips-sei
+-		os=-seiux
++		os=${os:-elf}
+ 		;;
+ 	sequent)
+ 		basic_machine=i386-sequent
+ 		;;
+-	sh)
+-		basic_machine=sh-hitachi
+-		os=-hms
+-		;;
+ 	sh5el)
+ 		basic_machine=sh5le-unknown
+ 		;;
+-	sh64)
+-		basic_machine=sh64-unknown
+-		;;
+-	sparclite-wrs | simso-wrs)
++	simso-wrs)
+ 		basic_machine=sparclite-wrs
+-		os=-vxworks
+-		;;
+-	sps7)
+-		basic_machine=m68k-bull
+-		os=-sysv2
++		os=vxworks
+ 		;;
+ 	spur)
+ 		basic_machine=spur-unknown
+@@ -997,41 +1163,12 @@ case $basic_machine in
+ 	st2000)
+ 		basic_machine=m68k-tandem
+ 		;;
+-	stratus)
+-		basic_machine=i860-stratus
+-		os=-sysv4
++	strongarm-* | thumb-*)
++		basic_machine=arm-`echo "$basic_machine" | sed 's/^[^-]*-//'`
+ 		;;
+ 	sun2)
+ 		basic_machine=m68000-sun
+ 		;;
+-	sun2os3)
+-		basic_machine=m68000-sun
+-		os=-sunos3
+-		;;
+-	sun2os4)
+-		basic_machine=m68000-sun
+-		os=-sunos4
+-		;;
+-	sun3os3)
+-		basic_machine=m68k-sun
+-		os=-sunos3
+-		;;
+-	sun3os4)
+-		basic_machine=m68k-sun
+-		os=-sunos4
+-		;;
+-	sun4os3)
+-		basic_machine=sparc-sun
+-		os=-sunos3
+-		;;
+-	sun4os4)
+-		basic_machine=sparc-sun
+-		os=-sunos4
+-		;;
+-	sun4sol2)
+-		basic_machine=sparc-sun
+-		os=-solaris2
+-		;;
+ 	sun3 | sun3-*)
+ 		basic_machine=m68k-sun
+ 		;;
+@@ -1041,37 +1178,9 @@ case $basic_machine in
+ 	sun386 | sun386i | roadrunner)
+ 		basic_machine=i386-sun
+ 		;;
+-	sv1)
+-		basic_machine=sv1-cray
+-		os=-unicos
+-		;;
+-	symmetry)
+-		basic_machine=i386-sequent
+-		os=-dynix
+-		;;
+-	t3e)
+-		basic_machine=alphaev5-cray
+-		os=-unicos
+-		;;
+-	t90)
+-		basic_machine=t90-cray
+-		os=-unicos
+-		;;
+-	tic54x | c54x*)
+-		basic_machine=tic54x-unknown
+-		os=-coff
+-		;;
+-	tic55x | c55x*)
+-		basic_machine=tic55x-unknown
+-		os=-coff
+-		;;
+-	tic6x | c6x*)
+-		basic_machine=tic6x-unknown
+-		os=-coff
+-		;;
+ 	tile*)
+-		basic_machine=tile-unknown
+-		os=-linux-gnu
++		basic_machine=$basic_machine-unknown
++		os=linux-gnu
+ 		;;
+ 	tx39)
+ 		basic_machine=mipstx39-unknown
+@@ -1079,82 +1188,32 @@ case $basic_machine in
+ 	tx39el)
+ 		basic_machine=mipstx39el-unknown
+ 		;;
+-	toad1)
+-		basic_machine=pdp10-xkl
+-		os=-tops20
+-		;;
+ 	tower | tower-32)
+ 		basic_machine=m68k-ncr
+ 		;;
+-	tpf)
+-		basic_machine=s390x-ibm
+-		os=-tpf
+-		;;
+-	udi29k)
+-		basic_machine=a29k-amd
+-		os=-udi
+-		;;
+-	ultra3)
+-		basic_machine=a29k-nyu
+-		os=-sym1
+-		;;
+-	v810 | necv810)
+-		basic_machine=v810-nec
+-		os=-none
+-		;;
+-	vaxv)
+-		basic_machine=vax-dec
+-		os=-sysv
+-		;;
+-	vms)
+-		basic_machine=vax-dec
+-		os=-vms
+-		;;
+ 	vpp*|vx|vx-*)
+ 		basic_machine=f301-fujitsu
+ 		;;
+-	vxworks960)
+-		basic_machine=i960-wrs
+-		os=-vxworks
+-		;;
+-	vxworks68)
+-		basic_machine=m68k-wrs
+-		os=-vxworks
+-		;;
+-	vxworks29k)
+-		basic_machine=a29k-wrs
+-		os=-vxworks
+-		;;
+ 	w65*)
+ 		basic_machine=w65-wdc
+-		os=-none
++		os=none
+ 		;;
+ 	w89k-*)
+ 		basic_machine=hppa1.1-winbond
+-		os=-proelf
++		os=proelf
+ 		;;
+-	xbox)
+-		basic_machine=i686-pc
+-		os=-mingw32
++	x64)
++		basic_machine=x86_64-pc
+ 		;;
+ 	xps | xps100)
+ 		basic_machine=xps100-honeywell
+ 		;;
+-	ymp)
+-		basic_machine=ymp-cray
+-		os=-unicos
+-		;;
+-	z8k-*-coff)
+-		basic_machine=z8k-unknown
+-		os=-sim
+-		;;
+-	z80-*-coff)
+-		basic_machine=z80-unknown
+-		os=-sim
++	xscale-* | xscalee[bl]-*)
++		basic_machine=`echo "$basic_machine" | sed 's/^xscale/arm/'`
+ 		;;
+ 	none)
+ 		basic_machine=none-none
+-		os=-none
++		os=${os:-none}
+ 		;;
+ 
+ # Here we handle the default manufacturer of certain CPU types.  It is in
+@@ -1180,10 +1239,6 @@ case $basic_machine in
+ 	vax)
+ 		basic_machine=vax-dec
+ 		;;
+-	pdp10)
+-		# there are many clones, so DEC is not a safe bet
+-		basic_machine=pdp10-unknown
+-		;;
+ 	pdp11)
+ 		basic_machine=pdp11-dec
+ 		;;
+@@ -1193,9 +1248,6 @@ case $basic_machine in
+ 	sh[1234] | sh[24]a | sh[24]aeb | sh[34]eb | sh[1234]le | sh[23]ele)
+ 		basic_machine=sh-unknown
+ 		;;
+-	sparc | sparcv8 | sparcv9 | sparcv9b | sparcv9v)
+-		basic_machine=sparc-sun
+-		;;
+ 	cydra)
+ 		basic_machine=cydra-cydrome
+ 		;;
+@@ -1215,7 +1267,7 @@ case $basic_machine in
+ 		# Make sure to match an already-canonicalized machine name.
+ 		;;
+ 	*)
+-		echo Invalid configuration \`$1\': machine \`$basic_machine\' not recognized 1>&2
++		echo Invalid configuration \`"$1"\': machine \`"$basic_machine"\' not recognized 1>&2
+ 		exit 1
+ 		;;
+ esac
+@@ -1223,10 +1275,10 @@ esac
+ # Here we canonicalize certain aliases for manufacturers.
+ case $basic_machine in
+ 	*-digital*)
+-		basic_machine=`echo $basic_machine | sed 's/digital.*/dec/'`
++		basic_machine=`echo "$basic_machine" | sed 's/digital.*/dec/'`
+ 		;;
+ 	*-commodore*)
+-		basic_machine=`echo $basic_machine | sed 's/commodore.*/cbm/'`
++		basic_machine=`echo "$basic_machine" | sed 's/commodore.*/cbm/'`
+ 		;;
+ 	*)
+ 		;;
+@@ -1234,194 +1286,246 @@ esac
+ 
+ # Decode manufacturer-specific aliases for certain operating systems.
+ 
+-if [ x"$os" != x"" ]
++if [ x$os != x ]
+ then
+ case $os in
+-        # First match some system type aliases
+-        # that might get confused with valid system types.
+-	# -solaris* is a basic system type, with this one exception.
+-	-solaris1 | -solaris1.*)
+-		os=`echo $os | sed -e 's|solaris1|sunos4|'`
++	# First match some system type aliases that might get confused
++	# with valid system types.
++	# solaris* is a basic system type, with this one exception.
++	auroraux)
++		os=auroraux
++		;;
++	bluegene*)
++		os=cnk
+ 		;;
+-	-solaris)
+-		os=-solaris2
++	solaris1 | solaris1.*)
++		os=`echo $os | sed -e 's|solaris1|sunos4|'`
+ 		;;
+-	-svr4*)
+-		os=-sysv4
++	solaris)
++		os=solaris2
+ 		;;
+-	-unixware*)
+-		os=-sysv4.2uw
++	unixware*)
++		os=sysv4.2uw
+ 		;;
+-	-gnu/linux*)
++	gnu/linux*)
+ 		os=`echo $os | sed -e 's|gnu/linux|linux-gnu|'`
+ 		;;
+-	# First accept the basic system types.
++	# es1800 is here to avoid being matched by es* (a different OS)
++	es1800*)
++		os=ose
++		;;
++	# Some version numbers need modification
++	chorusos*)
++		os=chorusos
++		;;
++	isc)
++		os=isc2.2
++		;;
++	sco6)
++		os=sco5v6
++		;;
++	sco5)
++		os=sco3.2v5
++		;;
++	sco4)
++		os=sco3.2v4
++		;;
++	sco3.2.[4-9]*)
++		os=`echo $os | sed -e 's/sco3.2./sco3.2v/'`
++		;;
++	sco3.2v[4-9]* | sco5v6*)
++		# Don't forget version if it is 3.2v4 or newer.
++		;;
++	scout)
++		# Don't match below
++		;;
++	sco*)
++		os=sco3.2v2
++		;;
++	psos*)
++		os=psos
++		;;
++	# Now accept the basic system types.
+ 	# The portable systems comes first.
+-	# Each alternative MUST END IN A *, to match a version number.
+-	# -sysv* is not here because it comes later, after sysvr4.
+-	-gnu* | -bsd* | -mach* | -minix* | -genix* | -ultrix* | -irix* \
+-	      | -*vms* | -sco* | -esix* | -isc* | -aix* | -sunos | -sunos[34]*\
+-	      | -hpux* | -unos* | -osf* | -luna* | -dgux* | -solaris* | -sym* \
+-	      | -kopensolaris* \
+-	      | -amigaos* | -amigados* | -msdos* | -newsos* | -unicos* | -aof* \
+-	      | -aos* | -aros* \
+-	      | -nindy* | -vxsim* | -vxworks* | -ebmon* | -hms* | -mvs* \
+-	      | -clix* | -riscos* | -uniplus* | -iris* | -rtu* | -xenix* \
+-	      | -hiux* | -386bsd* | -knetbsd* | -mirbsd* | -netbsd* \
+-	      | -openbsd* | -solidbsd* \
+-	      | -ekkobsd* | -kfreebsd* | -freebsd* | -riscix* | -lynxos* \
+-	      | -bosx* | -nextstep* | -cxux* | -aout* | -elf* | -oabi* \
+-	      | -ptx* | -coff* | -ecoff* | -winnt* | -domain* | -vsta* \
+-	      | -udi* | -eabi* | -lites* | -ieee* | -go32* | -aux* \
+-	      | -chorusos* | -chorusrdb* | -cegcc* \
+-	      | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
+-	      | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc* \
+-	      | -uxpv* | -beos* | -mpeix* | -udk* \
+-	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
+-	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
+-	      | -storm-chaos* | -tops10* | -tenex* | -tops20* | -its* \
+-	      | -os2* | -vos* | -palmos* | -uclinux* | -nucleus* \
+-	      | -morphos* | -superux* | -rtmk* | -rtmk-nova* | -windiss* \
+-	      | -powermax* | -dnix* | -nx6 | -nx7 | -sei* | -dragonfly* \
+-	      | -skyos* | -haiku* | -rdos* | -toppers* | -drops*)
++	# Each alternative MUST end in a * to match a version number.
++	# sysv* is not here because it comes later, after sysvr4.
++	gnu* | bsd* | mach* | minix* | genix* | ultrix* | irix* \
++	     | *vms* | esix* | aix* | cnk* | sunos | sunos[34]*\
++	     | hpux* | unos* | osf* | luna* | dgux* | auroraux* | solaris* \
++	     | sym* | kopensolaris* | plan9* \
++	     | amigaos* | amigados* | msdos* | newsos* | unicos* | aof* \
++	     | aos* | aros* | cloudabi* | sortix* \
++	     | nindy* | vxsim* | vxworks* | ebmon* | hms* | mvs* \
++	     | clix* | riscos* | uniplus* | iris* | rtu* | xenix* \
++	     | knetbsd* | mirbsd* | netbsd* \
++	     | bitrig* | openbsd* | solidbsd* | libertybsd* \
++	     | ekkobsd* | kfreebsd* | freebsd* | riscix* | lynxos* \
++	     | bosx* | nextstep* | cxux* | aout* | elf* | oabi* \
++	     | ptx* | coff* | ecoff* | winnt* | domain* | vsta* \
++	     | udi* | eabi* | lites* | ieee* | go32* | aux* | hcos* \
++	     | chorusrdb* | cegcc* | glidix* \
++	     | cygwin* | msys* | pe* | moss* | proelf* | rtems* \
++	     | midipix* | mingw32* | mingw64* | linux-gnu* | linux-android* \
++	     | linux-newlib* | linux-musl* | linux-uclibc* \
++	     | uxpv* | beos* | mpeix* | udk* | moxiebox* \
++	     | interix* | uwin* | mks* | rhapsody* | darwin* \
++	     | openstep* | oskit* | conix* | pw32* | nonstopux* \
++	     | storm-chaos* | tops10* | tenex* | tops20* | its* \
++	     | os2* | vos* | palmos* | uclinux* | nucleus* \
++	     | morphos* | superux* | rtmk* | windiss* \
++	     | powermax* | dnix* | nx6 | nx7 | sei* | dragonfly* \
++	     | skyos* | haiku* | rdos* | toppers* | drops* | es* \
++	     | onefs* | tirtos* | phoenix* | fuchsia* | redox* | bme* \
++	     | midnightbsd*)
+ 	# Remember, each alternative MUST END IN *, to match a version number.
+ 		;;
+-	-qnx*)
++	qnx*)
+ 		case $basic_machine in
+ 		    x86-* | i*86-*)
+ 			;;
+ 		    *)
+-			os=-nto$os
++			os=nto-$os
+ 			;;
+ 		esac
+ 		;;
+-	-nto-qnx*)
++	hiux*)
++		os=hiuxwe2
+ 		;;
+-	-nto*)
+-		os=`echo $os | sed -e 's|nto|nto-qnx|'`
++	nto-qnx*)
+ 		;;
+-	-sim | -es1800* | -hms* | -xray | -os68k* | -none* | -v88r* \
+-	      | -windows* | -osx | -abug | -netware* | -os9* | -beos* | -haiku* \
+-	      | -macos* | -mpw* | -magic* | -mmixware* | -mon960* | -lnews*)
++	nto*)
++		os=`echo $os | sed -e 's|nto|nto-qnx|'`
+ 		;;
+-	-mac*)
+-		os=`echo $os | sed -e 's|mac|macos|'`
++	sim | xray | os68k* | v88r* \
++	    | windows* | osx | abug | netware* | os9* \
++	    | macos* | mpw* | magic* | mmixware* | mon960* | lnews*)
+ 		;;
+-	-linux-dietlibc)
+-		os=-linux-dietlibc
++	linux-dietlibc)
++		os=linux-dietlibc
+ 		;;
+-	-linux*)
++	linux*)
+ 		os=`echo $os | sed -e 's|linux|linux-gnu|'`
+ 		;;
+-	-sunos5*)
+-		os=`echo $os | sed -e 's|sunos5|solaris2|'`
++	lynx*178)
++		os=lynxos178
++		;;
++	lynx*5)
++		os=lynxos5
++		;;
++	lynx*)
++		os=lynxos
+ 		;;
+-	-sunos6*)
+-		os=`echo $os | sed -e 's|sunos6|solaris3|'`
++	mac*)
++		os=`echo "$os" | sed -e 's|mac|macos|'`
+ 		;;
+-	-opened*)
+-		os=-openedition
++	opened*)
++		os=openedition
+ 		;;
+-        -os400*)
+-		os=-os400
++	os400*)
++		os=os400
+ 		;;
+-	-wince*)
+-		os=-wince
++	sunos5*)
++		os=`echo "$os" | sed -e 's|sunos5|solaris2|'`
+ 		;;
+-	-osfrose*)
+-		os=-osfrose
++	sunos6*)
++		os=`echo "$os" | sed -e 's|sunos6|solaris3|'`
+ 		;;
+-	-osf*)
+-		os=-osf
++	wince*)
++		os=wince
+ 		;;
+-	-utek*)
+-		os=-bsd
++	utek*)
++		os=bsd
+ 		;;
+-	-dynix*)
+-		os=-bsd
++	dynix*)
++		os=bsd
+ 		;;
+-	-acis*)
+-		os=-aos
++	acis*)
++		os=aos
+ 		;;
+-	-atheos*)
+-		os=-atheos
++	atheos*)
++		os=atheos
+ 		;;
+-	-syllable*)
+-		os=-syllable
++	syllable*)
++		os=syllable
+ 		;;
+-	-386bsd)
+-		os=-bsd
++	386bsd)
++		os=bsd
+ 		;;
+-	-ctix* | -uts*)
+-		os=-sysv
++	ctix* | uts*)
++		os=sysv
+ 		;;
+-	-nova*)
+-		os=-rtmk-nova
++	nova*)
++		os=rtmk-nova
+ 		;;
+-	-ns2 )
+-		os=-nextstep2
++	ns2)
++		os=nextstep2
+ 		;;
+-	-nsk*)
+-		os=-nsk
++	nsk*)
++		os=nsk
+ 		;;
+ 	# Preserve the version number of sinix5.
+-	-sinix5.*)
++	sinix5.*)
+ 		os=`echo $os | sed -e 's|sinix|sysv|'`
+ 		;;
+-	-sinix*)
+-		os=-sysv4
++	sinix*)
++		os=sysv4
+ 		;;
+-        -tpf*)
+-		os=-tpf
++	tpf*)
++		os=tpf
+ 		;;
+-	-triton*)
+-		os=-sysv3
++	triton*)
++		os=sysv3
+ 		;;
+-	-oss*)
+-		os=-sysv3
++	oss*)
++		os=sysv3
+ 		;;
+-	-svr4)
+-		os=-sysv4
++	svr4*)
++		os=sysv4
+ 		;;
+-	-svr3)
+-		os=-sysv3
++	svr3)
++		os=sysv3
+ 		;;
+-	-sysvr4)
+-		os=-sysv4
++	sysvr4)
++		os=sysv4
+ 		;;
+-	# This must come after -sysvr4.
+-	-sysv*)
++	# This must come after sysvr4.
++	sysv*)
+ 		;;
+-	-ose*)
+-		os=-ose
++	ose*)
++		os=ose
+ 		;;
+-	-es1800*)
+-		os=-ose
++	*mint | mint[0-9]* | *MiNT | MiNT[0-9]*)
++		os=mint
+ 		;;
+-	-xenix)
+-		os=-xenix
++	zvmoe)
++		os=zvmoe
+ 		;;
+-	-*mint | -mint[0-9]* | -*MiNT | -MiNT[0-9]*)
+-		os=-mint
++	dicos*)
++		os=dicos
+ 		;;
+-	-aros*)
+-		os=-aros
++	pikeos*)
++		# Until real need of OS specific support for
++		# particular features comes up, bare metal
++		# configurations are quite functional.
++		case $basic_machine in
++		    arm*)
++			os=eabi
++			;;
++		    *)
++			os=elf
++			;;
++		esac
+ 		;;
+-	-kaos*)
+-		os=-kaos
++	nacl*)
+ 		;;
+-	-zvmoe)
+-		os=-zvmoe
++	ios)
+ 		;;
+-	-dicos*)
+-		os=-dicos
++	none)
+ 		;;
+-	-none)
++	*-eabi)
+ 		;;
+ 	*)
+-		# Get rid of the `-' at the beginning of $os.
+-		os=`echo $os | sed 's/[^-]*-//'`
+-		echo Invalid configuration \`$1\': system \`$os\' not recognized 1>&2
++		echo Invalid configuration \`"$1"\': system \`"$os"\' not recognized 1>&2
+ 		exit 1
+ 		;;
+ esac
+@@ -1438,165 +1542,180 @@ else
+ # system, and we'll never get to this point.
+ 
+ case $basic_machine in
+-        score-*)
+-		os=-elf
++	score-*)
++		os=elf
+ 		;;
+-        spu-*)
+-		os=-elf
++	spu-*)
++		os=elf
+ 		;;
+ 	*-acorn)
+-		os=-riscix1.2
++		os=riscix1.2
+ 		;;
+ 	arm*-rebel)
+-		os=-linux
++		os=linux
+ 		;;
+ 	arm*-semi)
+-		os=-aout
++		os=aout
++		;;
++	c4x-* | tic4x-*)
++		os=coff
++		;;
++	c8051-*)
++		os=elf
++		;;
++	clipper-intergraph)
++		os=clix
+ 		;;
+-        c4x-* | tic4x-*)
+-        	os=-coff
++	hexagon-*)
++		os=elf
++		;;
++	tic54x-*)
++		os=coff
++		;;
++	tic55x-*)
++		os=coff
++		;;
++	tic6x-*)
++		os=coff
+ 		;;
+ 	# This must come before the *-dec entry.
+ 	pdp10-*)
+-		os=-tops20
++		os=tops20
+ 		;;
+ 	pdp11-*)
+-		os=-none
++		os=none
+ 		;;
+ 	*-dec | vax-*)
+-		os=-ultrix4.2
++		os=ultrix4.2
+ 		;;
+ 	m68*-apollo)
+-		os=-domain
++		os=domain
+ 		;;
+ 	i386-sun)
+-		os=-sunos4.0.2
++		os=sunos4.0.2
+ 		;;
+ 	m68000-sun)
+-		os=-sunos3
+-		# This also exists in the configure program, but was not the
+-		# default.
+-		# os=-sunos4
++		os=sunos3
+ 		;;
+ 	m68*-cisco)
+-		os=-aout
++		os=aout
+ 		;;
+-        mep-*)
+-		os=-elf
++	mep-*)
++		os=elf
+ 		;;
+ 	mips*-cisco)
+-		os=-elf
++		os=elf
+ 		;;
+ 	mips*-*)
+-		os=-elf
++		os=elf
+ 		;;
+ 	or32-*)
+-		os=-coff
++		os=coff
+ 		;;
+ 	*-tti)	# must be before sparc entry or we get the wrong os.
+-		os=-sysv3
++		os=sysv3
+ 		;;
+ 	sparc-* | *-sun)
+-		os=-sunos4.1.1
++		os=sunos4.1.1
+ 		;;
+-	*-be)
+-		os=-beos
++	pru-*)
++		os=elf
+ 		;;
+-	*-haiku)
+-		os=-haiku
++	*-be)
++		os=beos
+ 		;;
+ 	*-ibm)
+-		os=-aix
++		os=aix
+ 		;;
+-    	*-knuth)
+-		os=-mmixware
++	*-knuth)
++		os=mmixware
+ 		;;
+ 	*-wec)
+-		os=-proelf
++		os=proelf
+ 		;;
+ 	*-winbond)
+-		os=-proelf
++		os=proelf
+ 		;;
+ 	*-oki)
+-		os=-proelf
++		os=proelf
+ 		;;
+ 	*-hp)
+-		os=-hpux
++		os=hpux
+ 		;;
+ 	*-hitachi)
+-		os=-hiux
++		os=hiux
+ 		;;
+ 	i860-* | *-att | *-ncr | *-altos | *-motorola | *-convergent)
+-		os=-sysv
++		os=sysv
+ 		;;
+ 	*-cbm)
+-		os=-amigaos
++		os=amigaos
+ 		;;
+ 	*-dg)
+-		os=-dgux
++		os=dgux
+ 		;;
+ 	*-dolphin)
+-		os=-sysv3
++		os=sysv3
+ 		;;
+ 	m68k-ccur)
+-		os=-rtu
++		os=rtu
+ 		;;
+ 	m88k-omron*)
+-		os=-luna
++		os=luna
+ 		;;
+-	*-next )
+-		os=-nextstep
++	*-next)
++		os=nextstep
+ 		;;
+ 	*-sequent)
+-		os=-ptx
++		os=ptx
+ 		;;
+ 	*-crds)
+-		os=-unos
++		os=unos
+ 		;;
+ 	*-ns)
+-		os=-genix
++		os=genix
+ 		;;
+ 	i370-*)
+-		os=-mvs
+-		;;
+-	*-next)
+-		os=-nextstep3
++		os=mvs
+ 		;;
+ 	*-gould)
+-		os=-sysv
++		os=sysv
+ 		;;
+ 	*-highlevel)
+-		os=-bsd
++		os=bsd
+ 		;;
+ 	*-encore)
+-		os=-bsd
++		os=bsd
+ 		;;
+ 	*-sgi)
+-		os=-irix
++		os=irix
+ 		;;
+ 	*-siemens)
+-		os=-sysv4
++		os=sysv4
+ 		;;
+ 	*-masscomp)
+-		os=-rtu
++		os=rtu
+ 		;;
+ 	f30[01]-fujitsu | f700-fujitsu)
+-		os=-uxpv
++		os=uxpv
+ 		;;
+ 	*-rom68k)
+-		os=-coff
++		os=coff
+ 		;;
+ 	*-*bug)
+-		os=-coff
++		os=coff
+ 		;;
+ 	*-apple)
+-		os=-macos
++		os=macos
+ 		;;
+ 	*-atari*)
+-		os=-mint
++		os=mint
++		;;
++	*-wrs)
++		os=vxworks
+ 		;;
+ 	*)
+-		os=-none
++		os=none
+ 		;;
+ esac
+ fi
+@@ -1607,79 +1726,82 @@ vendor=unknown
+ case $basic_machine in
+ 	*-unknown)
+ 		case $os in
+-			-riscix*)
++			riscix*)
+ 				vendor=acorn
+ 				;;
+-			-sunos*)
++			sunos*)
+ 				vendor=sun
+ 				;;
+-			-aix*)
++			cnk*|-aix*)
+ 				vendor=ibm
+ 				;;
+-			-beos*)
++			beos*)
+ 				vendor=be
+ 				;;
+-			-hpux*)
++			hpux*)
+ 				vendor=hp
+ 				;;
+-			-mpeix*)
++			mpeix*)
+ 				vendor=hp
+ 				;;
+-			-hiux*)
++			hiux*)
+ 				vendor=hitachi
+ 				;;
+-			-unos*)
++			unos*)
+ 				vendor=crds
+ 				;;
+-			-dgux*)
++			dgux*)
+ 				vendor=dg
+ 				;;
+-			-luna*)
++			luna*)
+ 				vendor=omron
+ 				;;
+-			-genix*)
++			genix*)
+ 				vendor=ns
+ 				;;
+-			-mvs* | -opened*)
++			clix*)
++				vendor=intergraph
++				;;
++			mvs* | opened*)
+ 				vendor=ibm
+ 				;;
+-			-os400*)
++			os400*)
+ 				vendor=ibm
+ 				;;
+-			-ptx*)
++			ptx*)
+ 				vendor=sequent
+ 				;;
+-			-tpf*)
++			tpf*)
+ 				vendor=ibm
+ 				;;
+-			-vxsim* | -vxworks* | -windiss*)
++			vxsim* | vxworks* | windiss*)
+ 				vendor=wrs
+ 				;;
+-			-aux*)
++			aux*)
+ 				vendor=apple
+ 				;;
+-			-hms*)
++			hms*)
+ 				vendor=hitachi
+ 				;;
+-			-mpw* | -macos*)
++			mpw* | macos*)
+ 				vendor=apple
+ 				;;
+-			-*mint | -mint[0-9]* | -*MiNT | -MiNT[0-9]*)
++			*mint | mint[0-9]* | *MiNT | MiNT[0-9]*)
+ 				vendor=atari
+ 				;;
+-			-vos*)
++			vos*)
+ 				vendor=stratus
+ 				;;
+ 		esac
+-		basic_machine=`echo $basic_machine | sed "s/unknown/$vendor/"`
++		basic_machine=`echo "$basic_machine" | sed "s/unknown/$vendor/"`
+ 		;;
+ esac
+ 
+-echo $basic_machine$os
++echo "$basic_machine-$os"
+ exit
+ 
+ # Local variables:
+-# eval: (add-hook 'write-file-hooks 'time-stamp)
++# eval: (add-hook 'before-save-hook 'time-stamp)
+ # time-stamp-start: "timestamp='"
+ # time-stamp-format: "%:y-%02m-%02d"
+ # time-stamp-end: "'"
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-protocols/bird/files/bird.init b/meta-networking/recipes-protocols/bird/files/bird.init
new file mode 100755
index 000000000..ebef0f448
--- /dev/null
+++ b/meta-networking/recipes-protocols/bird/files/bird.init
@@ -0,0 +1,2 @@
+#!/bin/sh
+exec /usr/sbin/bird -d -c /etc/bird.conf -s /var/run/bird.ctl
-- 
2.17.1


