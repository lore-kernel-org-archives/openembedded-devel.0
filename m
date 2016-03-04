Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 43AB86011C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2016 13:34:27 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l68so35138436wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2016 05:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YMa+MLNy/shVVQY7I3/l1p5F/qprOZRBaCz/ZNbb0lw=;
	b=wC8oIM8CZhAhWgVIL1TSAuTEYAH7qChLenm/7fM4Fy58Tnu3TqExAqHdmHnOGmP2FO
	O5clo2VkYvRvlPz+QcJQG1g1+qO8KnplgjxTtIrFKr//5foxhPkLE+hIzgGPbMcqk2Y6
	vKtgr1j3TIM5cLVGOSEQ6PkUL/TdwkHgD9hFuGLursvzC9gZZQkYK/ZsXa4uTli7sdhD
	NkBvmPh2NHUrQovaMivoJ9VsejPdhYKr3WbEvBNaW2x8ktbyx5s9UUMzGJO6t0rcvzjj
	rUt/nwGvzP9OgN75hwLAfU09iwLhfpycQLYYKI+zLmkRE+njguiVFNDjU6roluXruX35
	nEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YMa+MLNy/shVVQY7I3/l1p5F/qprOZRBaCz/ZNbb0lw=;
	b=cjtwKlSFPndHdP7otMCeJMmudRa6buvuzlFVsxnoMzLRDnqi74Q3aX/8AU9ucHot37
	tbXX9d7aHuDyURweIOJy7GTaFSu3OGmlXUlOvYnkxkIzazaiBWLlP1X8xH2EIoKm1i7W
	mjt1/BInAAXh6IMzv+fW8rmcEBTkso/XjnIjurFcih7PPF1EmPH1y4ifYSE4JKHa6LEE
	FaHySfuCaFQZP0ffcQr0UjRXD1vpc5KFiI+nnIJh0EQ80VOLOyxvlnenw8HQXfGAWrww
	RZd0RmwtT/iQfZgOdzJ1DzEEiNT+6mS8O04evIVtYDrh39XkXC5l3nepuG0zPcnTvOFJ
	8yuA==
X-Gm-Message-State: AD7BkJKGe0MQUFWsaOyW/XaiOulEisspLJ7gCJsnxievWs4wvob+pdaEIlixwe7/PGMt3Q==
X-Received: by 10.28.65.5 with SMTP id o5mr5423835wma.75.1457098467840;
	Fri, 04 Mar 2016 05:34:27 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hx10sm3381044wjb.25.2016.03.04.05.34.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Mar 2016 05:34:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 4 Mar 2016 14:36:39 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160304133639.GC2557@jama>
References: <1454465517-24926-1-git-send-email-alejandro.joya.cruz@intel.com>
	<20160215092100.GF3028@jama>
MIME-Version: 1.0
In-Reply-To: <20160215092100.GF3028@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] toybox: upgrade to 0.7.0
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
X-List-Received-Date: Fri, 04 Mar 2016 13:34:30 -0000
X-Groupsio-MsgNum: 60338
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Content-Disposition: inline

--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2016 at 10:21:00AM +0100, Martin Jansa wrote:
> On Tue, Feb 02, 2016 at 06:11:57PM -0800, Alejandro Joya wrote:
> > Change SRC_URI to latest version and update the checksum for package.
> > remove old patch not longer need it to build it and add depedency found=
 for builiding
> > on temporary enviroment like yocto.
>=20
> Please fix following QA and Khem's comments and send v2.
>=20
> toybox-0.7.0: toybox rdepends on libattr, but it isn't a build
> dependency? [build-deps]

I've already merged this in good mood expecting follow-up fix soon, but
now I regret that and will revert this soon.

It also fails when hardfloat is used:
usr/include/gnu/stubs.h:7:29: fatal error: gnu/stubs-soft.h: No such
file or directory
|  # include <gnu/stubs-soft.h>
|                              ^
| compilation terminated.
| make: *** [generated/instlist] Error 1

>=20
> >=20
> > Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
> > ---
> >  .../toybox/0001-Match-paths-with-busybox.patch     | 388 -------------=
--------
> >  .../toybox/toybox_build-add-Missing-CFLAGS.patch   |  28 ++
> >  .../toybox/{toybox_0.6.0.bb =3D> toybox_0.7.0.bb}    |  10 +-
> >  3 files changed, 34 insertions(+), 392 deletions(-)
> >  delete mode 100644 meta-oe/recipes-core/toybox/toybox/0001-Match-paths=
-with-busybox.patch
> >  create mode 100644 meta-oe/recipes-core/toybox/toybox/toybox_build-add=
-Missing-CFLAGS.patch
> >  rename meta-oe/recipes-core/toybox/{toybox_0.6.0.bb =3D> toybox_0.7.0.=
bb} (87%)
> >=20
> > diff --git a/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-b=
usybox.patch b/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-bus=
ybox.patch
> > deleted file mode 100644
> > index 9eb965d..0000000
> > --- a/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.=
patch
> > +++ /dev/null
> > @@ -1,388 +0,0 @@
> > -From 9b37b45067677563dc8daa73d73a015c20ad6222 Mon Sep 17 00:00:00 2001
> > -From: Paul Barker <paul@paulbarker.me.uk>
> > -Date: Mon, 18 Aug 2014 12:18:16 +0000
> > -Subject: [PATCH] Match paths with busybox
> > -
> > -To ensure that toybox can be installed alongside busybox without confu=
sing
> > -update-alternatives, the paths of the links installed by toybox should=
 match
> > -those installed by busybox. This is accomplished by changing the flags=
 of a few
> > -tools within toybox.
> > -
> > -v3:
> > -    - Forward ported from v0.5.0 to v0.5.2
> > -
> > -v2:
> > -    - Forward ported from v0.4.9 to v0.5.0
> > -    - Move new 'mount' command
> > -
> > -Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> > -
> > -Upstream-status: Inappropriate
> > -    (specific to update-alternatives use in OpenEmbedded)
> > -
> > -Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> > ----
> > - toys/lsb/mount.c        | 2 +-
> > - toys/lsb/pidof.c        | 2 +-
> > - toys/other/chvt.c       | 2 +-
> > - toys/other/ifconfig.c   | 2 +-
> > - toys/other/insmod.c     | 2 +-
> > - toys/other/lsmod.c      | 2 +-
> > - toys/other/netcat.c     | 2 +-
> > - toys/other/pivot_root.c | 2 +-
> > - toys/other/readlink.c   | 2 +-
> > - toys/other/reboot.c     | 6 +++---
> > - toys/other/rfkill.c     | 2 +-
> > - toys/other/rmmod.c      | 2 +-
> > - toys/other/swapoff.c    | 2 +-
> > - toys/other/swapon.c     | 2 +-
> > - toys/other/sysctl.c     | 2 +-
> > - toys/posix/cut.c        | 2 +-
> > - toys/posix/df.c         | 2 +-
> > - toys/posix/head.c       | 2 +-
> > - toys/posix/id.c         | 6 +++---
> > - toys/posix/mkfifo.c     | 2 +-
> > - toys/posix/renice.c     | 2 +-
> > - toys/posix/tail.c       | 2 +-
> > - toys/posix/tee.c        | 2 +-
> > - toys/posix/uniq.c       | 2 +-
> > - toys/posix/who.c        | 2 +-
> > - 25 files changed, 29 insertions(+), 29 deletions(-)
> > -
> > -diff --git a/toys/lsb/mount.c b/toys/lsb/mount.c
> > -index c334681..b076ca1 100644
> > ---- a/toys/lsb/mount.c
> > -+++ b/toys/lsb/mount.c
> > -@@ -6,7 +6,7 @@
> > -  * Note: -hV is bad spec, haven't implemented -FsLU yet
> > -  * no mtab (/proc/mounts does it) so -n is NOP.
> > -=20
> > --USE_MOUNT(NEWTOY(mount, "?O:afnrvwt:o*[-rw]", TOYFLAG_USR|TOYFLAG_BIN=
|TOYFLAG_STAYROOT))
> > -+USE_MOUNT(NEWTOY(mount, "?O:afnrvwt:o*[-rw]", TOYFLAG_BIN|TOYFLAG_STA=
YROOT))
> > - //USE_NFSMOUNT(NEWTOY(nfsmount, "?<2>2", TOYFLAG_USR|TOYFLAG_BIN|TOYF=
LAG_STAYROOT))
> > -=20
> > - config MOUNT
> > -diff --git a/toys/lsb/pidof.c b/toys/lsb/pidof.c
> > -index 51b742f..a8fc8ef 100644
> > ---- a/toys/lsb/pidof.c
> > -+++ b/toys/lsb/pidof.c
> > -@@ -5,7 +5,7 @@
> > -  *
> > -  * http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB=
-Core-generic/pidof.html
> > -=20
> > --USE_PIDOF(NEWTOY(pidof, "<1so:", TOYFLAG_USR|TOYFLAG_BIN))
> > -+USE_PIDOF(NEWTOY(pidof, "<1so:", TOYFLAG_BIN))
> > -=20
> > - config PIDOF
> > -   bool "pidof"
> > -diff --git a/toys/other/chvt.c b/toys/other/chvt.c
> > -index 6544265..a93327f 100644
> > ---- a/toys/other/chvt.c
> > -+++ b/toys/other/chvt.c
> > -@@ -2,7 +2,7 @@
> > -  *
> > -  * Copyright (C) 2008 David Anders <danders@amltd.com>
> > -=20
> > --USE_CHVT(NEWTOY(chvt, "<1", TOYFLAG_USR|TOYFLAG_SBIN))
> > -+USE_CHVT(NEWTOY(chvt, "<1", TOYFLAG_USR|TOYFLAG_BIN))
> > -=20
> > - config CHVT
> > -   bool "chvt"
> > -diff --git a/toys/other/ifconfig.c b/toys/other/ifconfig.c
> > -index 8db3ff0..445799d 100644
> > ---- a/toys/other/ifconfig.c
> > -+++ b/toys/other/ifconfig.c
> > -@@ -6,7 +6,7 @@
> > -  *
> > -  * Not in SUSv4.
> > -=20
> > --USE_IFCONFIG(NEWTOY(ifconfig, "^?a", TOYFLAG_BIN))
> > -+USE_IFCONFIG(NEWTOY(ifconfig, "^?a", TOYFLAG_SBIN))
> > -=20
> > - config IFCONFIG
> > -   bool "ifconfig"
> > -diff --git a/toys/other/insmod.c b/toys/other/insmod.c
> > -index 81721a3..cb222a5 100644
> > ---- a/toys/other/insmod.c
> > -+++ b/toys/other/insmod.c
> > -@@ -2,7 +2,7 @@
> > -  *
> > -  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
> > -=20
> > --USE_INSMOD(NEWTOY(insmod, "<1", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
> > -+USE_INSMOD(NEWTOY(insmod, "<1", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
> > -=20
> > - config INSMOD
> > -   bool "insmod"
> > -diff --git a/toys/other/lsmod.c b/toys/other/lsmod.c
> > -index b8f5d82..4d16048 100644
> > ---- a/toys/other/lsmod.c
> > -+++ b/toys/other/lsmod.c
> > -@@ -2,7 +2,7 @@
> > -  *
> > -  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
> > -=20
> > --USE_LSMOD(NEWTOY(lsmod, NULL, TOYFLAG_BIN))
> > -+USE_LSMOD(NEWTOY(lsmod, NULL, TOYFLAG_SBIN))
> > -=20
> > - config LSMOD
> > -   bool "lsmod"
> > -diff --git a/toys/other/netcat.c b/toys/other/netcat.c
> > -index d27aa88..0fd26f7 100644
> > ---- a/toys/other/netcat.c
> > -+++ b/toys/other/netcat.c
> > -@@ -4,7 +4,7 @@
> > -  *
> > -  * TODO: udp, ipv6, genericize for telnet/microcom/tail-f
> > -=20
> > --USE_NETCAT(OLDTOY(nc, netcat, TOYFLAG_BIN))
> > -+USE_NETCAT(OLDTOY(nc, netcat, TOYFLAG_USR|TOYFLAG_BIN))
> > - USE_NETCAT(NEWTOY(netcat, USE_NETCAT_LISTEN("^tlL")"w#p#s:q#f:", TOYF=
LAG_BIN))
> > -=20
> > - config NETCAT
> > -diff --git a/toys/other/pivot_root.c b/toys/other/pivot_root.c
> > -index 9a1f56c..7748032 100644
> > ---- a/toys/other/pivot_root.c
> > -+++ b/toys/other/pivot_root.c
> > -@@ -2,7 +2,7 @@
> > -  *
> > -  * Copyright 2012 Rob Landley <rob@landley.net>
> > -=20
> > --USE_PIVOT_ROOT(NEWTOY(pivot_root, "<2>2", TOYFLAG_USR|TOYFLAG_BIN))
> > -+USE_PIVOT_ROOT(NEWTOY(pivot_root, "<2>2", TOYFLAG_SBIN))
> > -=20
> > - config PIVOT_ROOT
> > -   bool "pivot_root"
> > -diff --git a/toys/other/readlink.c b/toys/other/readlink.c
> > -index 1c33362..fecd1ef 100644
> > ---- a/toys/other/readlink.c
> > -+++ b/toys/other/readlink.c
> > -@@ -2,7 +2,7 @@
> > -  *
> > -  * Copyright 2007 Rob Landley <rob@landley.net>
> > -=20
> > --USE_READLINK(NEWTOY(readlink, "<1>1fenq[-fe]", TOYFLAG_BIN))
> > -+USE_READLINK(NEWTOY(readlink, "<1>1fenq[-fe]", TOYFLAG_USR|TOYFLAG_BI=
N))
> > -=20
> > - config READLINK
> > -   bool "readlink"
> > -diff --git a/toys/other/reboot.c b/toys/other/reboot.c
> > -index 8baa4d8..a135888 100644
> > ---- a/toys/other/reboot.c
> > -+++ b/toys/other/reboot.c
> > -@@ -2,9 +2,9 @@
> > -  *
> > -  * Copyright 2013 Elie De Brauwer <eliedebrauwer@gmail.com>
> > -=20
> > --USE_REBOOT(NEWTOY(reboot, "n", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
> > --USE_REBOOT(OLDTOY(halt, reboot, TOYFLAG_BIN|TOYFLAG_NEEDROOT))
> > --USE_REBOOT(OLDTOY(poweroff, reboot, TOYFLAG_BIN|TOYFLAG_NEEDROOT))
> > -+USE_REBOOT(NEWTOY(reboot, "n", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
> > -+USE_REBOOT(OLDTOY(halt, reboot, TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
> > -+USE_REBOOT(OLDTOY(poweroff, reboot, TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
> > -=20
> > - config REBOOT
> > -   bool "reboot"
> > -diff --git a/toys/other/rfkill.c b/toys/other/rfkill.c
> > -index af3efe1..7527ec7 100644
> > ---- a/toys/other/rfkill.c
> > -+++ b/toys/other/rfkill.c
> > -@@ -5,7 +5,7 @@
> > -  *
> > -  * No Standard
> > -=20
> > --USE_RFKILL(NEWTOY(rfkill, "<1>2", TOYFLAG_SBIN))
> > -+USE_RFKILL(NEWTOY(rfkill, "<1>2", TOYFLAG_USR|TOYFLAG_SBIN))
> > -=20
> > - config RFKILL
> > -   bool "rfkill"
> > -diff --git a/toys/other/rmmod.c b/toys/other/rmmod.c
> > -index b789acc..10c134c 100644
> > ---- a/toys/other/rmmod.c
> > -+++ b/toys/other/rmmod.c
> > -@@ -2,7 +2,7 @@
> > -  *
> > -  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
> > -=20
> > --USE_RMMOD(NEWTOY(rmmod, "<1wf", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
> > -+USE_RMMOD(NEWTOY(rmmod, "<1wf", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
> > -=20
> > - config RMMOD
> > -   bool "rmmod"
> > -diff --git a/toys/other/swapoff.c b/toys/other/swapoff.c
> > -index b89e915..fb17130 100644
> > ---- a/toys/other/swapoff.c
> > -+++ b/toys/other/swapoff.c
> > -@@ -2,7 +2,7 @@
> > -  *
> > -  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
> > -=20
> > --USE_SWAPOFF(NEWTOY(swapoff, "<1>1", TOYFLAG_BIN|TOYFLAG_NEEDROOT))
> > -+USE_SWAPOFF(NEWTOY(swapoff, "<1>1", TOYFLAG_SBIN|TOYFLAG_NEEDROOT))
> > -=20
> > - config SWAPOFF
> > -   bool "swapoff"
> > -diff --git a/toys/other/swapon.c b/toys/other/swapon.c
> > -index 49f1249..838d382 100644
> > ---- a/toys/other/swapon.c
> > -+++ b/toys/other/swapon.c
> > -@@ -2,7 +2,7 @@
> > -  *
> > -  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
> > -=20
> > --USE_SWAPON(NEWTOY(swapon, "<1>1p#<0>32767", TOYFLAG_BIN|TOYFLAG_NEEDR=
OOT))
> > -+USE_SWAPON(NEWTOY(swapon, "<1>1p#<0>32767", TOYFLAG_SBIN|TOYFLAG_NEED=
ROOT))
> > -=20
> > - config SWAPON
> > -   bool "swapon"
> > -diff --git a/toys/other/sysctl.c b/toys/other/sysctl.c
> > -index 8e57ca1..0c6c640 100644
> > ---- a/toys/other/sysctl.c
> > -+++ b/toys/other/sysctl.c
> > -@@ -5,7 +5,7 @@
> > -  *
> > -  * No Standard
> > - =20
> > --USE_SYSCTL(NEWTOY(sysctl, "^neNqwpaA[!ap][!aq][!aw][+aA]", TOYFLAG_US=
R|TOYFLAG_BIN))
> > -+USE_SYSCTL(NEWTOY(sysctl, "^neNqwpaA[!ap][!aq][!aw][+aA]", TOYFLAG_SB=
IN))
> > -=20
> > - config SYSCTL
> > -   bool "sysctl"
> > -diff --git a/toys/posix/cut.c b/toys/posix/cut.c
> > -index 7f10c5e..1ab3ce8 100644
> > ---- a/toys/posix/cut.c
> > -+++ b/toys/posix/cut.c
> > -@@ -5,7 +5,7 @@
> > -  *
> > -  * http://pubs.opengroup.org/onlinepubs/9699919799/utilities/cut.html=
=20
> > -=20
> > --USE_CUT(NEWTOY(cut, "b:|c:|f:|d:sn[!cbf]", TOYFLAG_BIN))
> > -+USE_CUT(NEWTOY(cut, "b:|c:|f:|d:sn[!cbf]", TOYFLAG_USR|TOYFLAG_BIN))
> > -=20
> > - config CUT
> > -   bool "cut"
> > -diff --git a/toys/posix/df.c b/toys/posix/df.c
> > -index 141e8e5..5d37b45 100644
> > ---- a/toys/posix/df.c
> > -+++ b/toys/posix/df.c
> > -@@ -4,7 +4,7 @@
> > -  *
> > -  * See http://opengroup.org/onlinepubs/9699919799/utilities/df.html
> > -=20
> > --USE_DF(NEWTOY(df, "Pkt*a[-Pk]", TOYFLAG_USR|TOYFLAG_SBIN))
> > -+USE_DF(NEWTOY(df, "Pkt*a[-Pk]", TOYFLAG_BIN))
> > -=20
> > - config DF
> > -   bool "df"
> > -diff --git a/toys/posix/head.c b/toys/posix/head.c
> > -index e8517d4..3ac4373 100644
> > ---- a/toys/posix/head.c
> > -+++ b/toys/posix/head.c
> > -@@ -4,7 +4,7 @@
> > -  *
> > -  * See http://opengroup.org/onlinepubs/9699919799/utilities/head.html
> > -=20
> > --USE_HEAD(NEWTOY(head, "n#<0=3D10", TOYFLAG_BIN))
> > -+USE_HEAD(NEWTOY(head, "n#<0=3D10", TOYFLAG_USR|TOYFLAG_BIN))
> > -=20
> > - config HEAD
> > -   bool "head"
> > -diff --git a/toys/posix/id.c b/toys/posix/id.c
> > -index 353aa04..7ab489e 100644
> > ---- a/toys/posix/id.c
> > -+++ b/toys/posix/id.c
> > -@@ -6,10 +6,10 @@
> > -  *
> > -  * See http://opengroup.org/onlinepubs/9699919799/utilities/id.html
> > -=20
> > --USE_ID(NEWTOY(id, ">1"USE_ID_SELINUX("Z")"nGgru[!"USE_ID_SELINUX("Z")=
"Ggu]", TOYFLAG_BIN))
> > -+USE_ID(NEWTOY(id, ">1"USE_ID_SELINUX("Z")"nGgru[!"USE_ID_SELINUX("Z")=
"Ggu]", TOYFLAG_USR|TOYFLAG_BIN))
> > - USE_GROUPS(NEWTOY(groups, NULL, TOYFLAG_USR|TOYFLAG_BIN))
> > --USE_LOGNAME(NEWTOY(logname, ">0", TOYFLAG_BIN))
> > --USE_WHOAMI(OLDTOY(whoami, logname, TOYFLAG_BIN))
> > -+USE_LOGNAME(NEWTOY(logname, ">0", TOYFLAG_USR|TOYFLAG_BIN))
> > -+USE_WHOAMI(OLDTOY(whoami, logname, TOYFLAG_USR|TOYFLAG_BIN))
> > -=20
> > - config ID
> > -   bool "id"
> > -diff --git a/toys/posix/mkfifo.c b/toys/posix/mkfifo.c
> > -index 15fab70..4e0fca3 100644
> > ---- a/toys/posix/mkfifo.c
> > -+++ b/toys/posix/mkfifo.c
> > -@@ -4,7 +4,7 @@
> > -  *
> > -  * See http://opengroup.org/onlinepubs/9699919799/utilities/mkfifo.ht=
ml
> > -=20
> > --USE_MKFIFO(NEWTOY(mkfifo, "<1m:", TOYFLAG_BIN))
> > -+USE_MKFIFO(NEWTOY(mkfifo, "<1m:", TOYFLAG_USR|TOYFLAG_BIN))
> > -=20
> > - config MKFIFO
> > -   bool "mkfifo"
> > -diff --git a/toys/posix/renice.c b/toys/posix/renice.c
> > -index 8c20644..489eb13 100644
> > ---- a/toys/posix/renice.c
> > -+++ b/toys/posix/renice.c
> > -@@ -4,7 +4,7 @@
> > -  *
> > -  * See http://pubs.opengroup.org/onlinepubs/9699919799/utilities/reni=
ce.html
> > -=20
> > --USE_RENICE(NEWTOY(renice, "<1gpun#|", TOYFLAG_BIN))
> > -+USE_RENICE(NEWTOY(renice, "<1gpun#|", TOYFLAG_USR|TOYFLAG_BIN))
> > -=20
> > - config RENICE
> > -   bool "renice"
> > -diff --git a/toys/posix/tail.c b/toys/posix/tail.c
> > -index e92c044..ba1d311 100644
> > ---- a/toys/posix/tail.c
> > -+++ b/toys/posix/tail.c
> > -@@ -4,7 +4,7 @@
> > -  *
> > -  * See http://opengroup.org/onlinepubs/9699919799/utilities/tail.html
> > -=20
> > --USE_TAIL(NEWTOY(tail, "fc-n-[-cn]", TOYFLAG_BIN))
> > -+USE_TAIL(NEWTOY(tail, "fc-n-[-cn]", TOYFLAG_USR|TOYFLAG_BIN))
> > -=20
> > - config TAIL
> > -   bool "tail"
> > -diff --git a/toys/posix/tee.c b/toys/posix/tee.c
> > -index 0388510..5574088 100644
> > ---- a/toys/posix/tee.c
> > -+++ b/toys/posix/tee.c
> > -@@ -4,7 +4,7 @@
> > -  *
> > -  * See http://opengroup.org/onlinepubs/9699919799/utilities/tee.html
> > -=20
> > --USE_TEE(NEWTOY(tee, "ia", TOYFLAG_BIN))
> > -+USE_TEE(NEWTOY(tee, "ia", TOYFLAG_USR|TOYFLAG_BIN))
> > -=20
> > - config TEE
> > -   bool "tee"
> > -diff --git a/toys/posix/uniq.c b/toys/posix/uniq.c
> > -index 3cfdb94..c127cfe 100644
> > ---- a/toys/posix/uniq.c
> > -+++ b/toys/posix/uniq.c
> > -@@ -4,7 +4,7 @@
> > -  *
> > -  * See http://opengroup.org/onlinepubs/9699919799/utilities/uniq.html
> > -=20
> > --USE_UNIQ(NEWTOY(uniq, "f#s#w#zicdu", TOYFLAG_BIN))
> > -+USE_UNIQ(NEWTOY(uniq, "f#s#w#zicdu", TOYFLAG_USR|TOYFLAG_BIN))
> > -=20
> > - config UNIQ
> > -   bool "uniq"
> > -diff --git a/toys/posix/who.c b/toys/posix/who.c
> > -index 876a562..414cdfc 100644
> > ---- a/toys/posix/who.c
> > -+++ b/toys/posix/who.c
> > -@@ -9,7 +9,7 @@
> > -  * Posix says to support many options (-abdHlmpqrstTu) but this
> > -  * isn't aimed at minicomputers with modem pools.
> > -=20
> > --USE_WHO(NEWTOY(who, "a", TOYFLAG_BIN))
> > -+USE_WHO(NEWTOY(who, "a", TOYFLAG_USR|TOYFLAG_BIN))
> > -=20
> > - config WHO
> > -   bool "who"
> > ---=20
> > -1.8.1.2
> > -
> > diff --git a/meta-oe/recipes-core/toybox/toybox/toybox_build-add-Missin=
g-CFLAGS.patch b/meta-oe/recipes-core/toybox/toybox/toybox_build-add-Missin=
g-CFLAGS.patch
> > new file mode 100644
> > index 0000000..80d6b2a
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/toybox/toybox/toybox_build-add-Missing-CFLAG=
S.patch
> > @@ -0,0 +1,28 @@
> > +From 686492e6b0aa582b42bf95cfc9a31324204d8f79 Mon Sep 17 00:00:00 2001
> > +From: Alejandro Joya <alejandro.joya.cruz@intel.com>
> > +Date: Tue, 2 Feb 2016 17:47:50 -0800
> > +Subject: [PATCH] toybox_build: add Missing CFLAGS
> > +
> > +add CFLAGS to multiple builds to forward libraries location in Yocto.
> > +
> > +Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
> > +---
> > + Makefile | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 5422efe..2dca3ae 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -37,7 +37,7 @@ bloatcheck: toybox_old toybox_unstripped
> > +=20
> > + generated/instlist: toybox_stuff
> > + 	NOBUILD=3D1 scripts/make.sh
> > +-	$(HOSTCC) -I . scripts/install.c -o generated/instlist
> > ++	$(HOSTCC) -I . $(CFLAGS) scripts/install.c -o generated/instlist
> > +=20
> > + install_flat: generated/instlist
> > + 	scripts/install.sh --symlink --force
> > +--=20
> > +1.9.1
> > +
> > diff --git a/meta-oe/recipes-core/toybox/toybox_0.6.0.bb b/meta-oe/reci=
pes-core/toybox/toybox_0.7.0.bb
> > similarity index 87%
> > rename from meta-oe/recipes-core/toybox/toybox_0.6.0.bb
> > rename to meta-oe/recipes-core/toybox/toybox_0.7.0.bb
> > index da03200..a1fa8a9 100644
> > --- a/meta-oe/recipes-core/toybox/toybox_0.6.0.bb
> > +++ b/meta-oe/recipes-core/toybox/toybox_0.7.0.bb
> > @@ -1,10 +1,11 @@
> >  SUMMARY =3D "Toybox combines common utilities together into a single e=
xecutable."
> >  HOMEPAGE =3D "http://www.landley.net/toybox/"
> > =20
> > -SRC_URI =3D "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.=
gz"
> > +SRC_URI =3D "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.=
gz \
> > +           file://toybox_build-add-Missing-CFLAGS.patch"
> > =20
> > -SRC_URI[md5sum] =3D "7f4a6c89e56c48e3350e611f5b36c2cf"
> > -SRC_URI[sha256sum] =3D "b6e2694d19ac08f1c3416d5b2a02a31d445db2ed98dec8=
9761430cdff2c9710d"
> > +SRC_URI[md5sum] =3D "d86c78624b47625c2f0fc64eda599443"
> > +SRC_URI[sha256sum] =3D "65428816f88ad3fe92b67df86dc05427c8078fe03843b8=
b9715fdfa6d29c0f97"
> > =20
> > =20
> >  LICENSE =3D "BSD-0-Clause"
> > @@ -12,9 +13,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df0b8b3dd6=
431bcaa245da0a08bd0d511"
> > =20
> >  SECTION =3D "base"
> > =20
> > +CFLAGS_prepend =3D "-I ${STAGING_DIR_HOST}${includedir_native}"
> > +
> >  do_configure() {
> >      oe_runmake defconfig
> > -
> >      # Disable killall5 as it isn't managed by update-alternatives
> >      sed -e 's/CONFIG_KILLALL5=3Dy/# CONFIG_KILLALL5 is not set/' -i .c=
onfig
> >  }
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbZj2YACgkQN1Ujt2V2gBwXQQCgqadowQcSbhqboGERVWJCtRCg
QOEAn2Jz3JlctZESgsIJP35rwoPYGQtm
=03SX
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--
