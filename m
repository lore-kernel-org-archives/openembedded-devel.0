Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.1109.1590011102567753343
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 14:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=lhxWHsFw;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=11157; q=dns/txt; s=axis-central1;
  t=1590011103; x=1621547103;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=75lokNcK4oUBksasbsx3ihlFtBicsuBrdII6tXnFrJ0=;
  b=lhxWHsFwJ6U6MO9cHJQ2Rx4+vrhiscS4JA0s7A3DOYETMDiSRv8UyTey
   V5VBq8Yh4OjuDyvdV11J/EaQPld/vHNAj0gU5LyI7qNUeG4KPacD58f87
   74GhB7bOLxLhTEgnmczp8dgUR2F8ipLKwsdgf2UbCKZ9bOe5WNuIaSVmE
   DelNP8W3nMC7jHFI3MXFL1FZBZphOsnXHjbOQqHgDE1RitVidreYhukz0
   YCEZYI/rS++P3wqcXCL8xDHd/J8pG+mNaR+vRBmiQcL8lQa9NSVgRqF34
   f0FnHtHCdzRxFhr5X61eoEmDhJJcX/KVFbmyT9XUozNIvCRsffCFw0Grh
   A==;
IronPort-SDR: trbQ+WNbEhShGhLyH+ScDHbJVGHG78U0CZ6FHzw1OyzV6znXjNIGutR4dXx/1UQMrg2LVY/TnW
 u9lFOTaHZT2zhpR0OdMJAKAU87XpEqyxPAv3XF6a8wc1ovkR5QOs+G1C4KPPuApbu0G7f2pP5m
 9Fy0+6ppnY9mX9QS4Zb2vV2zX6p288iUPV4Plhfba+eb4Lsb/UqVpULY+zLjet7HLsmYd7ZBm1
 be5GSKdNfBNqiyITZ3KG4EY2ru2Zvkp5sv82r9tBQABu8rIYnvlbZAOCtsofl0kfrcEBSFkwUM
 eZk=
X-IronPort-AV: E=Sophos;i="5.73,415,1583190000"; 
   d="scan'208";a="8694336"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Adam Miartus <adam.miartus@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] toybox: bump version to 0.8.2
Thread-Topic: [oe] [meta-oe][PATCH 2/2] toybox: bump version to 0.8.2
Thread-Index: AQHWLu5tKLaJKKjPckevxoZz/Z8v9qixgN0g
Date: Wed, 20 May 2020 21:44:58 +0000
Message-ID: <27b3ee25ff574ba3ac887dbc68602e28@XBOX03.axis.com>
References: <20200520213408.140096-1-raj.khem@gmail.com>
 <20200520213408.140096-2-raj.khem@gmail.com>
In-Reply-To: <20200520213408.140096-2-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Why is the update for toybox 0.8.2 made as two commits? It does=20
not make any sense at all. After the first commit, the recipe will=20
be broken since PV has been updated but the checksums have not,=20
not to mention all the other changes that seem to be needed to=20
build 0.8.2.

//Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 20 maj 2020 23:34
> To: openembedded-devel@lists.openembedded.org
> Cc: Adam Miartus <adam.miartus@gmail.com>; Khem Raj <raj.khem@gmail.com>
> Subject: [oe] [meta-oe][PATCH 2/2] toybox: bump version to 0.8.2
>=20
> From: Adam Miartus <adam.miartus@gmail.com>
>=20
> remove OE-path-changes.patch as already applied to upstream
>=20
> fix CC, CFLAGS and CROSS_COMPILE variables as toybox is strict
> on what is expected to be filled in these variables:
> CC =3D should contain compiler name
> CROSS_COMPILE =3D should contain compiler prefix
> CFLAGS =3D should contain only compiler flags
>=20
> License wording changed due to commits:
>  8014d31278411e22655aeae47338e95f209e2907
>  b31192fd73b382358b1deb33dc6c4cf4ce9c613f
> in toybox repository, type of license remains the same
>=20
> Signed-off-by: Adam Miartus <adam.miartus@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../toybox/toybox/OE-path-changes.patch       | 195 ------------------
>  meta-oe/recipes-core/toybox/toybox_0.8.2.bb   |  23 ++-
>  2 files changed, 18 insertions(+), 200 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/toybox/toybox/OE-path-
> changes.patch
>=20
> diff --git a/meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch
> b/meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch
> deleted file mode 100644
> index e42c22ebd4..0000000000
> --- a/meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch
> +++ /dev/null
> @@ -1,195 +0,0 @@
> -diff --git a/toys/net/microcom.c b/toys/net/microcom.c
> -index d34e1fe..a369e6c 100644
> ---- a/toys/net/microcom.c
> -+++ b/toys/net/microcom.c
> -@@ -2,7 +2,7 @@
> -  *
> -  * Copyright 2017 The Android Open Source Project.
> -
> --USE_MICROCOM(NEWTOY(microcom, "<1>1s:X", TOYFLAG_BIN))
> -+USE_MICROCOM(NEWTOY(microcom, "<1>1s:X", TOYFLAG_USR|TOYFLAG_BIN))
> -
> - config MICROCOM
> -   bool "microcom"
> -diff --git a/toys/other/blockdev.c b/toys/other/blockdev.c
> -index 38e0993..c5d9fcd 100644
> ---- a/toys/other/blockdev.c
> -+++ b/toys/other/blockdev.c
> -@@ -4,7 +4,7 @@
> -  *
> -  * No Standard.
> -
> --USE_BLOCKDEV(NEWTOY(blockdev,
> "<1>1(setro)(setrw)(getro)(getss)(getbsz)(setbsz)#<0(getsz)(getsize)(gets
> ize64)(flushbufs)(rereadpt)",TOYFLAG_USR|TOYFLAG_BIN))
> -+USE_BLOCKDEV(NEWTOY(blockdev,
> "<1>1(setro)(setrw)(getro)(getss)(getbsz)(setbsz)#<0(getsz)(getsize)(gets
> ize64)(flushbufs)(rereadpt)",TOYFLAG_SBIN))
> -
> - config BLOCKDEV
> -   bool "blockdev"
> -diff --git a/toys/other/chrt.c b/toys/other/chrt.c
> -index a1c37a0..d6db3a5 100644
> ---- a/toys/other/chrt.c
> -+++ b/toys/other/chrt.c
> -@@ -4,7 +4,7 @@
> -  *
> -  * Note: -ibrfo flags sorted to match SCHED positions for highest_bit()
> -
> --USE_CHRT(NEWTOY(chrt, "^mp#<0iRbrfo[!ibrfo]",
> TOYFLAG_USR|TOYFLAG_SBIN))
> -+USE_CHRT(NEWTOY(chrt, "^mp#<0iRbrfo[!ibrfo]", TOYFLAG_USR|TOYFLAG_BIN))
> -
> - config CHRT
> -   bool "chrt"
> -diff --git a/toys/other/hwclock.c b/toys/other/hwclock.c
> -index 1d313e3..412582d 100644
> ---- a/toys/other/hwclock.c
> -+++ b/toys/other/hwclock.c
> -@@ -4,7 +4,7 @@
> -  *
> -  * No standard, but see Documentation/rtc.txt in the linux kernel
> source..
> -  *
> --USE_HWCLOCK(NEWTOY(hwclock,
> ">0(fast)f(rtc):u(utc)l(localtime)t(systz)s(hctosys)r(show)w(systohc)[-
> ul][!rtsw]", TOYFLAG_USR|TOYFLAG_BIN))
> -+USE_HWCLOCK(NEWTOY(hwclock,
> ">0(fast)f(rtc):u(utc)l(localtime)t(systz)s(hctosys)r(show)w(systohc)[-
> ul][!rtsw]", TOYFLAG_SBIN))
> -
> - config HWCLOCK
> -   bool "hwclock"
> -diff --git a/toys/other/modinfo.c b/toys/other/modinfo.c
> -index 1178d67..966a9de 100644
> ---- a/toys/other/modinfo.c
> -+++ b/toys/other/modinfo.c
> -@@ -4,7 +4,7 @@
> -  *
> -  * TODO: cleanup
> -
> --USE_MODINFO(NEWTOY(modinfo, "<1b:k:F:0", TOYFLAG_BIN))
> -+USE_MODINFO(NEWTOY(modinfo, "<1b:k:F:0", TOYFLAG_SBIN))
> -
> - config MODINFO
> -   bool "modinfo"
> -diff --git a/toys/other/pmap.c b/toys/other/pmap.c
> -index abb0a33..2acef02 100644
> ---- a/toys/other/pmap.c
> -+++ b/toys/other/pmap.c
> -@@ -5,7 +5,7 @@
> -  *
> -  * No Standard.
> -
> --USE_PMAP(NEWTOY(pmap, "<1xq", TOYFLAG_BIN))
> -+USE_PMAP(NEWTOY(pmap, "<1xq", TOYFLAG_USR|TOYFLAG_BIN))
> -
> - config PMAP
> -   bool "pmap"
> -diff --git a/toys/other/printenv.c b/toys/other/printenv.c
> -index e8bcf29..65f62ed 100644
> ---- a/toys/other/printenv.c
> -+++ b/toys/other/printenv.c
> -@@ -2,7 +2,7 @@
> -  *
> -  * Copyright 2012 Georgi Chorbadzhiyski <georgi@unixsol.org>
> -
> --USE_PRINTENV(NEWTOY(printenv, "0(null)", TOYFLAG_USR|TOYFLAG_BIN))
> -+USE_PRINTENV(NEWTOY(printenv, "0(null)", TOYFLAG_BIN))
> -
> - config PRINTENV
> -   bool "printenv"
> -diff --git a/toys/other/taskset.c b/toys/other/taskset.c
> -index 8ffdab7..89fd528 100644
> ---- a/toys/other/taskset.c
> -+++ b/toys/other/taskset.c
> -@@ -2,7 +2,7 @@
> -  *
> -  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
> -
> --USE_TASKSET(NEWTOY(taskset, "<1^pa", TOYFLAG_BIN|TOYFLAG_STAYROOT))
> -+USE_TASKSET(NEWTOY(taskset, "<1^pa",
> TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_STAYROOT))
> - USE_NPROC(NEWTOY(nproc, "(all)", TOYFLAG_USR|TOYFLAG_BIN))
> -
> - config NPROC
> -diff --git a/toys/other/timeout.c b/toys/other/timeout.c
> -index 9b93466..e1d0f4d 100644
> ---- a/toys/other/timeout.c
> -+++ b/toys/other/timeout.c
> -@@ -4,7 +4,7 @@
> -  *
> -  * No standard
> -
> --USE_TIMEOUT(NEWTOY(timeout, "<2^vk:s: ", TOYFLAG_BIN))
> -+USE_TIMEOUT(NEWTOY(timeout, "<2^vk:s: ", TOYFLAG_USR|TOYFLAG_BIN))
> -
> - config TIMEOUT
> -   bool "timeout"
> -diff --git a/toys/other/truncate.c b/toys/other/truncate.c
> -index 142d3c7..40eb1e5 100644
> ---- a/toys/other/truncate.c
> -+++ b/toys/other/truncate.c
> -@@ -2,7 +2,7 @@
> -  *
> -  * Copyright 2011 Rob Landley <rob@landley.net>
> -
> --USE_TRUNCATE(NEWTOY(truncate, "<1s:|c", TOYFLAG_BIN))
> -+USE_TRUNCATE(NEWTOY(truncate, "<1s:|c", TOYFLAG_USR|TOYFLAG_BIN))
> -
> - config TRUNCATE
> -   bool "truncate"
> -diff --git a/toys/posix/nice.c b/toys/posix/nice.c
> -index 4b587ee..9f7b119 100644
> ---- a/toys/posix/nice.c
> -+++ b/toys/posix/nice.c
> -@@ -4,7 +4,7 @@
> -  *
> -  * See http://opengroup.org/onlinepubs/9699919799/utilities/nice.html
> -
> --USE_NICE(NEWTOY(nice, "^<1n#", TOYFLAG_USR|TOYFLAG_BIN))
> -+USE_NICE(NEWTOY(nice, "^<1n#", TOYFLAG_BIN))
> -
> - config NICE
> -   bool "nice"
> -diff --git a/toys/posix/nl.c b/toys/posix/nl.c
> -index 9b02bfa..41e1b89 100644
> ---- a/toys/posix/nl.c
> -+++ b/toys/posix/nl.c
> -@@ -7,7 +7,7 @@
> -  * This implements a subset: only one logical page (-ip), no sections
> (-dfh).
> -  * todo: -lv
> -
> --USE_NL(NEWTOY(nl, "v#<1=3D1l#b:n:s:w#<0=3D6E", TOYFLAG_BIN))
> -+USE_NL(NEWTOY(nl, "v#<1=3D1l#b:n:s:w#<0=3D6E", TOYFLAG_USR|TOYFLAG_BIN)=
)
> -
> - config NL
> -   bool "nl"
> -diff --git a/toys/posix/paste.c b/toys/posix/paste.c
> -index ea04f02..8972f71 100644
> ---- a/toys/posix/paste.c
> -+++ b/toys/posix/paste.c
> -@@ -6,7 +6,7 @@
> -  *
> -  * Deviations from posix: the FILE argument isn't mandatory, none =3D=
=3D '-
> '
> -
> --USE_PASTE(NEWTOY(paste, "d:s", TOYFLAG_BIN|TOYFLAG_LOCALE))
> -+USE_PASTE(NEWTOY(paste, "d:s", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE))
> -
> - config PASTE
> -   bool "paste"
> -diff --git a/toys/posix/ps.c b/toys/posix/ps.c
> -index aef2a7f..b559e09 100644
> ---- a/toys/posix/ps.c
> -+++ b/toys/posix/ps.c
> -@@ -44,7 +44,7 @@
> -  * TODO: top: thread support and SMP
> -  * TODO: pgrep -f only searches the amount of cmdline that fits in
> toybuf.
> -
> --USE_PS(NEWTOY(ps,
> "k(sort)*P(ppid)*aAdeflMno*O*p(pid)*s*t*Tu*U*g*G*wZ[!ol][+Ae][!oO]",
> TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE))
> -+USE_PS(NEWTOY(ps,
> "k(sort)*P(ppid)*aAdeflMno*O*p(pid)*s*t*Tu*U*g*G*wZ[!ol][+Ae][!oO]",
> TOYFLAG_BIN|TOYFLAG_LOCALE))
> - // stayroot because iotop needs root to read other process' proc/$$/io
> - USE_TOP(NEWTOY(top, ">0m" "O*Hk*o*p*u*s#<1d#=3D3<1n#<1bq[!oO]",
> TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE))
> - USE_IOTOP(NEWTOY(iotop, ">0AaKO" "k*o*p*u*s#<1=3D7d#=3D3<1n#<1bq",
> TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_STAYROOT|TOYFLAG_LOCALE))
> -diff --git a/toys/posix/sed.c b/toys/posix/sed.c
> -index cf7d15e..130ac08 100644
> ---- a/toys/posix/sed.c
> -+++ b/toys/posix/sed.c
> -@@ -10,7 +10,7 @@
> -  * TODO: handle error return from emit(), error_msg/exit consistently
> -  *       What's the right thing to do for -i when write fails? Skip to
> next?
> -
> --USE_SED(NEWTOY(sed, "(help)(version)e*f*inEr[+Er]",
> TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE|TOYFLAG_NOHELP))
> -+USE_SED(NEWTOY(sed, "(help)(version)e*f*inEr[+Er]",
> TOYFLAG_BIN|TOYFLAG_LOCALE|TOYFLAG_NOHELP))
> -
> - config SED
> -   bool "sed"
> diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.2.bb b/meta-
> oe/recipes-core/toybox/toybox_0.8.2.bb
> index 2f82978334..89c154db2b 100644
> --- a/meta-oe/recipes-core/toybox/toybox_0.8.2.bb
> +++ b/meta-oe/recipes-core/toybox/toybox_0.8.2.bb
> @@ -3,21 +3,34 @@ HOMEPAGE =3D "http://www.landley.net/toybox/"
>  DEPENDS =3D "attr virtual/crypt"
>=20
>  LICENSE =3D "BSD-0-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df0b8b3dd6431bcaa245da0a08bd0d=
511"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D78659a599b9325da368f2f1eb88f1=
9c7"
>=20
>  inherit cml1 update-alternatives
>=20
>  SRC_URI =3D "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz=
 \
> -           file://OE-path-changes.patch \
>             "
> -SRC_URI[md5sum] =3D "a8bb502a1be941f06dd2644fff25f547"
> -SRC_URI[sha256sum] =3D
> "3ada450ac1eab1dfc352fee915ea6129b9a4349c1885f1394b61bd2d89a46c04"
> +SRC_URI[md5sum] =3D "f5cec2e37842ef552753b8b698c69690"
> +SRC_URI[sha256sum] =3D
> "9a2760fa442e9baf1be6064ab5ba8b90f2098e1d4bc33c788960b8d73f52fed5"
>=20
>  SECTION =3D "base"
>=20
>  TOYBOX_BIN =3D "generated/unstripped/toybox"
>=20
> -EXTRA_OEMAKE =3D 'HOSTCC=3D"${BUILD_CC}" CPUS=3D${@oe.utils.cpu_count()}=
'
> +# Toybox is strict on what CC, CFLAGS and CROSS_COMPILE variables should
> contain.
> +# Fix CC, CFLAGS, CROSS_COMPILE to match expectations.
> +# CC =3D compiler name
> +# CFLAGS =3D only compiler flags
> +# CROSS_COMPILE =3D compiler prefix
> +CFLAGS +=3D "${TOOLCHAIN_OPTIONS} ${TUNE_CCARGS}"
> +
> +COMPILER_toolchain-clang =3D "clang"
> +COMPILER  ?=3D "gcc"
> +
> +EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D"${HOST_PREFIX}" \
> +                CC=3D"${COMPILER}" \
> +                STRIP=3D"strip" \
> +                CFLAGS=3D"${CFLAGS}" \
> +                HOSTCC=3D"${BUILD_CC}" CPUS=3D${@oe.utils.cpu_count()} V=
=3D1'
>=20
>  do_configure() {
>      # allow user to define their own defconfig in bbappend, taken from
> kernel.bbclass
> --
> 2.26.2

