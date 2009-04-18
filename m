Received: from [83.222.23.62] (helo=relay2.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LvCmI-0002BT-Mb
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Apr 2009 17:48:26 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay2.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LvCiH-000B0d-DA
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Apr 2009 19:44:17 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Apr 2009 19:44:13 +0400
User-Agent: KMail/1.9.9
References: <200904151633.49146.khimov@altell.ru>
	<200904161247.17071.khimov@altell.ru>
	<20090417223735.GB15643@gmail.com>
In-Reply-To: <20090417223735.GB15643@gmail.com>
MIME-Version: 1.0
Message-Id: <200904181944.13663.khimov@altell.ru>
Subject: Re: [PATCH 02/11] binutils:	add?binutils-x86_64_i386_biarch.patch
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
X-List-Received-Date: Sat, 18 Apr 2009 15:48:26 -0000
X-Groupsio-MsgNum: 9509
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_NVf6JOshUhpob33"

--Boundary-00=_NVf6JOshUhpob33
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 18 April 2009 02:37:35 Khem Raj wrote:
> On (16/04/09 12:47), Roman I Khimov wrote:
> > On Thursday 16 April 2009 11:14:29 Khem Raj wrote:
> > > On Wednesday 15 April 2009 10:28:57 pm Roman I Khimov wrote:
> > > > On Wednesday 15 April 2009 23:25:12 Khem Raj wrote:
> > > > > On (15/04/09 16:35), Roman I Khimov wrote:
> > > > > > ---
> > > > > >  .../binutils-x86_64_i386_biarch.patch              |   25
> > > > > > ++++++++++++++++++++ recipes/binutils/binutils_2.18.bb
> > > > > >
> > > > > >   | 2 +-
> > > > > >
> > > > > >  2 files changed, 26 insertions(+), 1 deletions(-)
> > > > > >  create mode 100644
> > > > > > recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch
> > > > >
> > > > > Looks ok. Could you also make this on later versions of toolchains.
> > > > > I am not worried about the older ones.
> > > >
> > > > Works good with 2.19 and 2.19.1, but not 2.18.50.0.7.
> > >
> > > FWIW 2.18.50.0.7 is default binutils for some distros (angstrom)
> >
> > True, didn't check initially its usage, so it's going to be something
> > like attached.
> >
> > Do I need to bump PR's for all binutils touched?
>
> yes.

OK, attached.

--Boundary-00=_NVf6JOshUhpob33
Content-Type: text/x-diff;
  charset="iso 8859-1";
  name="0002-binutils-add-binutils-x86_64_i386_biarch.patch.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0002-binutils-add-binutils-x86_64_i386_biarch.patch.patch"

=46rom 660fc9691349ec5cbae42e06b6f9cc9d7b3c947a Mon Sep 17 00:00:00 2001
=46rom: Roman I Khimov <khimov@altell.ru>
Date: Wed, 15 Apr 2009 15:48:22 +0400
Subject: [PATCH 02/11] binutils: add binutils-x86_64_i386_biarch.patch

Adds 'lib32' directories to binutils search paths on x86_64.
=2D--
 .../binutils-x86_64_i386_biarch.patch              |   26 ++++++++++++++++=
++++
 .../binutils-x86_64_i386_biarch.patch              |   25 ++++++++++++++++=
+++
 .../binutils-x86_64_i386_biarch.patch              |   25 ++++++++++++++++=
+++
 .../binutils-x86_64_i386_biarch.patch              |   25 ++++++++++++++++=
+++
 recipes/binutils/binutils_2.18.50.0.7.bb           |    3 +-
 recipes/binutils/binutils_2.18.bb                  |    4 +-
 recipes/binutils/binutils_2.19.1.bb                |    3 +-
 recipes/binutils/binutils_2.19.bb                  |    3 +-
 8 files changed, 109 insertions(+), 5 deletions(-)
 create mode 100644 recipes/binutils/binutils-2.18.50.0.7/binutils-x86_64_i=
386_biarch.patch
 create mode 100644 recipes/binutils/binutils-2.18/binutils-x86_64_i386_bia=
rch.patch
 create mode 100644 recipes/binutils/binutils-2.19.1/binutils-x86_64_i386_b=
iarch.patch
 create mode 100644 recipes/binutils/binutils-2.19/binutils-x86_64_i386_bia=
rch.patch

diff --git a/recipes/binutils/binutils-2.18.50.0.7/binutils-x86_64_i386_bia=
rch.patch b/recipes/binutils/binutils-2.18.50.0.7/binutils-x86_64_i386_biar=
ch.patch
new file mode 100644
index 0000000..6054434
=2D-- /dev/null
+++ b/recipes/binutils/binutils-2.18.50.0.7/binutils-x86_64_i386_biarch.pat=
ch
@@ -0,0 +1,26 @@
+#!/bin/sh -e
+## 127_x86_64_i386_biarch.dpatch
+##
+## DP: Description: Add (/usr)/lib32 to the search paths on x86_64.
+## DP: Author: Aurelien Jarno <aurel32.debian.org>
+## DP: Upstream status: Debian specific
+#
+# Hacked to apply with quilt
+# Adapted to binutils 2.18.50.0.7
+
+--- binutils/ld/emulparams/elf_i386.sh
++++ binutils/ld/emulparams/elf_i386.sh
+@@ -12,3 +12,13 @@
+ NO_SMALL_DATA=3Dyes
+ SEPARATE_GOTPLT=3D12
+ SHARABLE_SECTIONS=3Dyes
++
++# Linux modify the default library search path to first include
++# a 32-bit specific directory.
++case "$target" in
++  x86_64*-linux* | i[3-7]86*-linux* | x86_64*-kfreebsd*-gnu | i[3-7]86*-k=
freebsd*-gnu)
++    case "$EMULATION_NAME" in
++      *i386*) LIBPATH_SUFFIX=3D32 ;;
++    esac
++    ;;
++esac
diff --git a/recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.pat=
ch b/recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch
new file mode 100644
index 0000000..b79a76a
=2D-- /dev/null
+++ b/recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch
@@ -0,0 +1,25 @@
+#!/bin/sh -e
+## 127_x86_64_i386_biarch.dpatch
+##
+## DP: Description: Add (/usr)/lib32 to the search paths on x86_64.
+## DP: Author: Aurelien Jarno <aurel32.debian.org>
+## DP: Upstream status: Debian specific
+#
+# Hacked to apply with quilt
+
+--- binutils/ld/emulparams/elf_i386.sh
++++ binutils/ld/emulparams/elf_i386.sh
+@@ -12,3 +12,13 @@
+ GENERATE_PIE_SCRIPT=3Dyes
+ NO_SMALL_DATA=3Dyes
+ SEPARATE_GOTPLT=3D12
++
++# Linux modify the default library search path to first include
++# a 32-bit specific directory.
++case "$target" in
++  x86_64*-linux* | i[3-7]86*-linux* | x86_64*-kfreebsd*-gnu | i[3-7]86*-k=
freebsd*-gnu)
++    case "$EMULATION_NAME" in
++      *i386*) LIBPATH_SUFFIX=3D32 ;;
++    esac
++    ;;
++esac
diff --git a/recipes/binutils/binutils-2.19.1/binutils-x86_64_i386_biarch.p=
atch b/recipes/binutils/binutils-2.19.1/binutils-x86_64_i386_biarch.patch
new file mode 100644
index 0000000..b79a76a
=2D-- /dev/null
+++ b/recipes/binutils/binutils-2.19.1/binutils-x86_64_i386_biarch.patch
@@ -0,0 +1,25 @@
+#!/bin/sh -e
+## 127_x86_64_i386_biarch.dpatch
+##
+## DP: Description: Add (/usr)/lib32 to the search paths on x86_64.
+## DP: Author: Aurelien Jarno <aurel32.debian.org>
+## DP: Upstream status: Debian specific
+#
+# Hacked to apply with quilt
+
+--- binutils/ld/emulparams/elf_i386.sh
++++ binutils/ld/emulparams/elf_i386.sh
+@@ -12,3 +12,13 @@
+ GENERATE_PIE_SCRIPT=3Dyes
+ NO_SMALL_DATA=3Dyes
+ SEPARATE_GOTPLT=3D12
++
++# Linux modify the default library search path to first include
++# a 32-bit specific directory.
++case "$target" in
++  x86_64*-linux* | i[3-7]86*-linux* | x86_64*-kfreebsd*-gnu | i[3-7]86*-k=
freebsd*-gnu)
++    case "$EMULATION_NAME" in
++      *i386*) LIBPATH_SUFFIX=3D32 ;;
++    esac
++    ;;
++esac
diff --git a/recipes/binutils/binutils-2.19/binutils-x86_64_i386_biarch.pat=
ch b/recipes/binutils/binutils-2.19/binutils-x86_64_i386_biarch.patch
new file mode 100644
index 0000000..b79a76a
=2D-- /dev/null
+++ b/recipes/binutils/binutils-2.19/binutils-x86_64_i386_biarch.patch
@@ -0,0 +1,25 @@
+#!/bin/sh -e
+## 127_x86_64_i386_biarch.dpatch
+##
+## DP: Description: Add (/usr)/lib32 to the search paths on x86_64.
+## DP: Author: Aurelien Jarno <aurel32.debian.org>
+## DP: Upstream status: Debian specific
+#
+# Hacked to apply with quilt
+
+--- binutils/ld/emulparams/elf_i386.sh
++++ binutils/ld/emulparams/elf_i386.sh
+@@ -12,3 +12,13 @@
+ GENERATE_PIE_SCRIPT=3Dyes
+ NO_SMALL_DATA=3Dyes
+ SEPARATE_GOTPLT=3D12
++
++# Linux modify the default library search path to first include
++# a 32-bit specific directory.
++case "$target" in
++  x86_64*-linux* | i[3-7]86*-linux* | x86_64*-kfreebsd*-gnu | i[3-7]86*-k=
freebsd*-gnu)
++    case "$EMULATION_NAME" in
++      *i386*) LIBPATH_SUFFIX=3D32 ;;
++    esac
++    ;;
++esac
diff --git a/recipes/binutils/binutils_2.18.50.0.7.bb b/recipes/binutils/bi=
nutils_2.18.50.0.7.bb
index a89431e..eb00a2d 100644
=2D-- a/recipes/binutils/binutils_2.18.50.0.7.bb
+++ b/recipes/binutils/binutils_2.18.50.0.7.bb
@@ -1,4 +1,4 @@
=2DPR =3D "r6"
+PR =3D "r7"
=20
 require binutils.inc
=20
@@ -12,6 +12,7 @@ SRC_URI =3D "\
      file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=3D1=
 \
      file://binutils-uclibc-gas-needs-libm.patch;patch=3D1 \
      file://binutils-arm-pr7093.patch;patch=3D1 \
+     file://binutils-x86_64_i386_biarch.patch;patch=3D1 \
      "
=20
 # powerpc patches
diff --git a/recipes/binutils/binutils_2.18.bb b/recipes/binutils/binutils_=
2.18.bb
index 9367196..8370538 100644
=2D-- a/recipes/binutils/binutils_2.18.bb
+++ b/recipes/binutils/binutils_2.18.bb
@@ -1,4 +1,4 @@
=2DPR =3D "r4"
+PR =3D "r5"
=20
 require binutils.inc
=20
@@ -12,8 +12,8 @@ SRC_URI =3D "\
      file://binutils-uclibc-300-006_better_file_error.patch;patch=3D1 \
      file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=3D1=
 \
      file://binutils-uclibc-gas-needs-libm.patch;patch=3D1 \
+     file://binutils-x86_64_i386_biarch.patch;patch=3D1 \
      "
=20
 # powerpc patches
 SRC_URI +=3D "file://binutils-2.16.1-e300c2c3.patch;patch=3D1"
=2D
diff --git a/recipes/binutils/binutils_2.19.1.bb b/recipes/binutils/binutil=
s_2.19.1.bb
index c399ab8..782d5c7 100644
=2D-- a/recipes/binutils/binutils_2.19.1.bb
+++ b/recipes/binutils/binutils_2.19.1.bb
@@ -1,4 +1,4 @@
=2DPR =3D "r0"
+PR =3D "r1"
=20
 require binutils.inc
=20
@@ -12,6 +12,7 @@ SRC_URI =3D "\
      file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=3D1=
 \
      file://binutils-uclibc-gas-needs-libm.patch;patch=3D1 \
      file://binutils-arm-pr7093.patch;patch=3D1 \
+     file://binutils-x86_64_i386_biarch.patch;patch=3D1 \
      "
=20
 # powerpc patches
diff --git a/recipes/binutils/binutils_2.19.bb b/recipes/binutils/binutils_=
2.19.bb
index aee5840..072ac56 100644
=2D-- a/recipes/binutils/binutils_2.19.bb
+++ b/recipes/binutils/binutils_2.19.bb
@@ -1,4 +1,4 @@
=2DPR =3D "r1"
+PR =3D "r2"
=20
 require binutils.inc
=20
@@ -12,6 +12,7 @@ SRC_URI =3D "\
      file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=3D1=
 \
      file://binutils-uclibc-gas-needs-libm.patch;patch=3D1 \
      file://binutils-arm-pr7093.patch;patch=3D1 \
+     file://binutils-x86_64_i386_biarch.patch;patch=3D1 \
      "
=20
 # powerpc patches
=2D-=20
1.6.2.1


--Boundary-00=_NVf6JOshUhpob33--
