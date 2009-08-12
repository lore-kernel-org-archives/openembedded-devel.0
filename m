Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MbFyi-0006H4-91
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 17:43:04 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 4EFEC1B10C0D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 15:29:55 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Aug 2009 17:25:56 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A826FF3.9030501@gmail.com>
	<6ec4247d0908120316k595cf5eeobbe64aa31ab99f8@mail.gmail.com>
	<200908121450.59048.holger+oe@freyther.de>
In-Reply-To: <200908121450.59048.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <200908121725.57128.holger+oe@freyther.de>
Subject: Re: why does glibc_2.9.bb use glibc-ports-2.7?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Aug 2009 15:43:04 -0000
X-Groupsio-MsgNum: 12341
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_F8tgKpc4T8DbuzE"

--Boundary-00=_F8tgKpc4T8DbuzE
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 12 August 2009 14:50:58 Holger Hans Peter Freyther wrote:
> On Wednesday 12 August 2009 12:16:33 Graham Gower wrote:
> > I currently don't have resources to test arm builds (or other
> > architectures...). mipsel builds take 16hrs on my workstation as it
> > is.
>
> I'm doing an arm build now.

Here we go. Compile tested on ARM (mostly) and MIPS.

z.

--Boundary-00=_F8tgKpc4T8DbuzE
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-glibc-Build-glibc-2.9-with-glibc-ports-2.9.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-glibc-Build-glibc-2.9-with-glibc-ports-2.9.patch"

From d1f8845abdee9fe05c3863e1297c53b82ef04b84 Mon Sep 17 00:00:00 2001
From: Graham Gower <graham.gower@gmail.com>
Date: Tue, 11 Aug 2009 21:32:03 +0000
Subject: [PATCH] glibc: Build glibc 2.9 with glibc-ports 2.9

This combination of glibc-2.9 with glibc-ports-2.7 fails to build on mipsel=
.
The reason we have been using glibc-ports 2.7 was that glibc-ports 2.9 was
not tagged or we didn't see it for various reasons.

Build glibc 2.9 with glibc-port 2.9 and drop the three ARM patches as
they have been applied to the upstream glibc-ports tree:

http://sourceware.org/git/?p=3Dglibc-ports.git;a=3Dcommitdiff;h=3D7272ed4e4=
74a398b8ce1e7374cdaa8592b840e2a
http://sourceware.org/git/?p=3Dglibc-ports.git;a=3Dcommitdiff;h=3De6e41f0f4=
963bfb0c0e32f8263ae028b288b5453

Patchwork: http://patchwork.openembedded.org/patch/933/
Signed-off-By: Graham Gower <graham.gower@gmail.com>
Signed-off-By: Holger Hans Peter <zecke@selfish.org>
---
 conf/checksums.ini                                 |    4 +++
 recipes/glibc/glibc-2.9/glibc-2.9-use-_begin.patch |   28 ++++++++++++++++=
++++
 recipes/glibc/glibc_2.9.bb                         |   11 +++-----
 3 files changed, 36 insertions(+), 7 deletions(-)
 create mode 100644 recipes/glibc/glibc-2.9/glibc-2.9-use-_begin.patch

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 6769ad7..d4e38f7 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -8142,6 +8142,10 @@ sha256=3Dd094028bc6d6691f56b4efeff7cd7e1c7ca10733e0c=
b5efc36e8fb08d8324bf1
 md5=3Deaeb8527b8fa286c2d887157214f9998
 sha256=3D3e481996259af87c3581da23481970a27de679e3c87cfa9a5a59751cd20c7b44
=20
+[ftp://ftp.gnu.org/pub/gnu/glibc/glibc-ports-2.9.tar.bz2]
+md5=3D7d5d86031cb15403e4d246658209ee81
+sha256=3D824c97b83f1ec2894ee0e824db6d542c40b978d2f6c4364c7411777e44b15a64
+
 [ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/2.16/glibmm-2.16.2.tar.bz2]
 md5=3D408054366f0acc01014f4c4af2304da5
 sha256=3Df033f6f39c32fc17ecce63087e41408671a3a43d698c83de2528af3fc7276d28
diff --git a/recipes/glibc/glibc-2.9/glibc-2.9-use-_begin.patch b/recipes/g=
libc/glibc-2.9/glibc-2.9-use-_begin.patch
new file mode 100644
index 0000000..8d36a05
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/glibc-2.9-use-_begin.patch
@@ -0,0 +1,28 @@
+From 7c8a67320e26b8c11108bf0a3410d3aef9cf3486 Mon Sep 17 00:00:00 2001
+From: Ulrich Drepper <drepper@redhat.com>
+Date: Sat, 31 Jan 2009 00:21:15 +0000
+Subject: [PATCH] * elf/Makefile (ld.so): Adjust the sed script to insert _=
begin in to newer linker scripts.
+---
+diff --git a/elf/Makefile b/elf/Makefile
+index 8079fe9..e44ff1d 100644
+--- a/elf/Makefile
++++ b/elf/Makefile
+@@ -1,4 +1,4 @@
+-# Copyright (C) 1995-2007, 2008 Free Software Foundation, Inc.
++# Copyright (C) 1995-2007, 2008, 2009 Free Software Foundation, Inc.
+ # This file is part of the GNU C Library.
+=20
+ # The GNU C Library is free software; you can redistribute it and/or
+@@ -304,7 +304,7 @@ $(objpfx)ld.so: $(objpfx)librtld.os $(ld-map)
+ 		  $(LDFLAGS-rtld) -Wl,-z,defs -Wl,--verbose 2>&1 |	\
+ 		  LC_ALL=3DC \
+ 		  sed -e '/^=3D=3D=3D=3D=3D=3D=3D=3D=3D/,/^=3D=3D=3D=3D=3D=3D=3D=3D=3D/=
!d;/^=3D=3D=3D=3D=3D=3D=3D=3D=3D/d'	\
+-		      -e 's/\. =3D 0 + SIZEOF_HEADERS;/& _begin =3D . - SIZEOF_HEADERS;=
/' \
++		      -e 's/\. =3D .* + SIZEOF_HEADERS;/& _begin =3D . - SIZEOF_HEADERS=
;/' \
+ 		  > $@.lds
+ 	$(LINK.o) -nostdlib -nostartfiles -shared -o $@			\
+ 		  $(LDFLAGS-rtld) -Wl,-z,defs $(z-now-$(bind-now))	\
+--=20
+1.6.3.2
+
+
diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index 6e323aa..1bf5a3f 100644
--- a/recipes/glibc/glibc_2.9.bb
+++ b/recipes/glibc/glibc_2.9.bb
@@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET =3D "arm"
 PACKAGES_DYNAMIC =3D "libc6*"
 RPROVIDES_${PN}-dev =3D "libc6-dev virtual-libc-dev"
=20
-PR =3D "${INC_PR}.0"
+PR =3D "${INC_PR}.1"
=20
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS =3D "-I${STAGING_INCDIR_NATIVE}"
@@ -43,7 +43,7 @@ RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"
 #	   file://arm-ioperm.patch;patch=3D1;pnum=3D0 \
 #	   file://ldd.patch;patch=3D1;pnum=3D0 \
 SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
-	   ftp://ftp.gnu.org/pub/gnu/glibc/glibc-ports-2.7.tar.bz2 \
+	   ftp://ftp.gnu.org/pub/gnu/glibc/glibc-ports-${PV}.tar.bz2 \
 	   ftp://ftp.gnu.org/pub/gnu/glibc/glibc-libidn-${PV}.tar.bz2 \
            file://arm-memcpy.patch;patch=3D1 \
            file://arm-longlong.patch;patch=3D1 \
@@ -54,9 +54,6 @@ SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.=
tar.bz2 \
 	   file://glibc-check_pf.patch;patch=3D1;pnum=3D0 \
            file://ldd-unbash.patch;patch=3D1 \
 	   file://glibc-arm-IO-acquire-lock-fix.diff;patch=3D1 \
-	   file://local-args6.diff;patch=3D1 \
-	   file://arm-check-pf.patch;patch=3D1 \
-	   file://arm-lowlevellock-include-tls.patch;patch=3D1 \
 	   file://generic-bits_select.h \
 	   file://generic-bits_types.h \
 	   file://generic-bits_typesizes.h \
@@ -65,9 +62,9 @@ SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.=
tar.bz2 \
            file://generate-supported.mk \
            file://march-i686.patch;patch=3D1;pnum=3D0 \
 	   file://tls_i486.patch;patch=3D1 \
+	   file://glibc-2.9-use-_begin.patch;patch=3D1 \
            "
=20
-
 # Build fails on sh3 and sh4 without additional patches
 SRC_URI_append_sh3 =3D " file://no-z-defs.patch;patch=3D1"
 SRC_URI_append_sh4 =3D " file://no-z-defs.patch;patch=3D1"
@@ -90,7 +87,7 @@ EXTRA_OECONF +=3D "${@get_glibc_fpu_setting(bb, d)}"
=20
 do_munge() {
 	# Integrate ports and libidn into tree
-	mv ${WORKDIR}/glibc-ports-2.7 ${S}/ports
+	mv ${WORKDIR}/glibc-ports-${PV} ${S}/ports
 	mv ${WORKDIR}/glibc-libidn-${PV} ${S}/libidn
=20
 	# Ports isn't really working... Fix it
--=20
1.6.3.3


--Boundary-00=_F8tgKpc4T8DbuzE--
