Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LwvRL-00008H-22
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 11:41:55 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LwvMq-0009xb-88
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 13:37:16 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2009 13:37:06 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <200904151633.49146.khimov@altell.ru>
	<200904220022.27769.khimov@altell.ru>
	<20090423044201.GA22270@gmail.com>
In-Reply-To: <20090423044201.GA22270@gmail.com>
MIME-Version: 1.0
Message-Id: <200904231337.07189.khimov@altell.ru>
Subject: Re: [PATCH 02/11]	binutils:?add?binutils-x86_64_i386_biarch.patch
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
X-List-Received-Date: Thu, 23 Apr 2009 09:41:55 -0000
X-Groupsio-MsgNum: 9672
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_DbD8JSwa6GFf/g5"

--Boundary-00=_DbD8JSwa6GFf/g5
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 23 April 2009 08:42:01 Khem Raj wrote:
> On (22/04/09 00:22), Roman I Khimov wrote:
> > On Saturday 18 April 2009 19:44:13 Roman I Khimov wrote:
> > > OK, attached.
>
> ok
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

New binutils were introduced recently, so I've upgraded patch to handle those 
as well, please ACK new version and I'll commit it then.

--Boundary-00=_DbD8JSwa6GFf/g5
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0002-binutils-add-binutils-x86_64_i386_biarch.patch.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0002-binutils-add-binutils-x86_64_i386_biarch.patch.patch"

From 97b047e692baba9896bd555a72654bd3e9ca6289 Mon Sep 17 00:00:00 2001
From: Roman I Khimov <khimov@altell.ru>
Date: Wed, 15 Apr 2009 15:48:22 +0400
Subject: [PATCH 02/13] binutils: add binutils-x86_64_i386_biarch.patch

Adds 'lib32' directories to binutils search paths on x86_64.
---
 .../binutils-x86_64_i386_biarch.patch              |   26 ++++++++++++++++=
++++
 .../binutils-x86_64_i386_biarch.patch              |   25 ++++++++++++++++=
+++
 .../binutils-x86_64_i386_biarch.patch              |   25 ++++++++++++++++=
+++
 .../binutils-x86_64_i386_biarch.patch              |   26 ++++++++++++++++=
++++
 .../binutils-x86_64_i386_biarch.patch              |   25 ++++++++++++++++=
+++
 recipes/binutils/binutils_2.18.50.0.7.bb           |    3 +-
 recipes/binutils/binutils_2.18.bb                  |    4 +-
 recipes/binutils/binutils_2.19.1.bb                |    3 +-
 recipes/binutils/binutils_2.19.51.0.3.bb           |    3 +-
 recipes/binutils/binutils_2.19.bb                  |    3 +-
 10 files changed, 137 insertions(+), 6 deletions(-)
 create mode 100644 recipes/binutils/binutils-2.18.50.0.7/binutils-x86_64_i=
386_biarch.patch
 create mode 100644 recipes/binutils/binutils-2.18/binutils-x86_64_i386_bia=
rch.patch
 create mode 100644 recipes/binutils/binutils-2.19.1/binutils-x86_64_i386_b=
iarch.patch
 create mode 100644 recipes/binutils/binutils-2.19.51.0.3/binutils-x86_64_i=
386_biarch.patch
 create mode 100644 recipes/binutils/binutils-2.19/binutils-x86_64_i386_bia=
rch.patch

diff --git a/recipes/binutils/binutils-2.18.50.0.7/binutils-x86_64_i386_bia=
rch.patch b/recipes/binutils/binutils-2.18.50.0.7/binutils-x86_64_i386_biar=
ch.patch
new file mode 100644
index 0000000..6054434
--- /dev/null
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
--- /dev/null
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
--- /dev/null
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
diff --git a/recipes/binutils/binutils-2.19.51.0.3/binutils-x86_64_i386_bia=
rch.patch b/recipes/binutils/binutils-2.19.51.0.3/binutils-x86_64_i386_biar=
ch.patch
new file mode 100644
index 0000000..6054434
--- /dev/null
+++ b/recipes/binutils/binutils-2.19.51.0.3/binutils-x86_64_i386_biarch.pat=
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
diff --git a/recipes/binutils/binutils-2.19/binutils-x86_64_i386_biarch.pat=
ch b/recipes/binutils/binutils-2.19/binutils-x86_64_i386_biarch.patch
new file mode 100644
index 0000000..b79a76a
--- /dev/null
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
--- a/recipes/binutils/binutils_2.18.50.0.7.bb
+++ b/recipes/binutils/binutils_2.18.50.0.7.bb
@@ -1,4 +1,4 @@
-PR =3D "r6"
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
--- a/recipes/binutils/binutils_2.18.bb
+++ b/recipes/binutils/binutils_2.18.bb
@@ -1,4 +1,4 @@
-PR =3D "r4"
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
-
diff --git a/recipes/binutils/binutils_2.19.1.bb b/recipes/binutils/binutil=
s_2.19.1.bb
index c399ab8..782d5c7 100644
--- a/recipes/binutils/binutils_2.19.1.bb
+++ b/recipes/binutils/binutils_2.19.1.bb
@@ -1,4 +1,4 @@
-PR =3D "r0"
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
diff --git a/recipes/binutils/binutils_2.19.51.0.3.bb b/recipes/binutils/bi=
nutils_2.19.51.0.3.bb
index 7808d3b..a4ed077 100644
--- a/recipes/binutils/binutils_2.19.51.0.3.bb
+++ b/recipes/binutils/binutils_2.19.51.0.3.bb
@@ -1,4 +1,4 @@
-PR =3D "r0"
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
--- a/recipes/binutils/binutils_2.19.bb
+++ b/recipes/binutils/binutils_2.19.bb
@@ -1,4 +1,4 @@
-PR =3D "r1"
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
--=20
1.6.2.3


--Boundary-00=_DbD8JSwa6GFf/g5--
