Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LuKDZ-0000N8-OA
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 07:33:38 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LuK9o-00059v-0Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 09:29:04 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2009 09:28:57 +0400
User-Agent: KMail/1.9.9
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
	<20090415192512.GC29623@gmail.com>
In-Reply-To: <20090415192512.GC29623@gmail.com>
MIME-Version: 1.0
Message-Id: <200904160928.57879.khimov@altell.ru>
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=AWL,BAYES_20,
	RCVD_IN_BL_SPAMCOP_NET, RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 02/11] binutils: add	binutils-x86_64_i386_biarch.patch
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
X-List-Received-Date: Thu, 16 Apr 2009 05:33:40 -0000
X-Groupsio-MsgNum: 9419
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_ZIs5Jyx838d2gh3"

--Boundary-00=_ZIs5Jyx838d2gh3
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 April 2009 23:25:12 Khem Raj wrote:
> On (15/04/09 16:35), Roman I Khimov wrote:
> > ---
> >  .../binutils-x86_64_i386_biarch.patch              |   25
> > ++++++++++++++++++++ recipes/binutils/binutils_2.18.bb                  |
> >    2 +-
> >  2 files changed, 26 insertions(+), 1 deletions(-)
> >  create mode 100644
> > recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch
>
> Looks ok. Could you also make this on later versions of toolchains.
> I am not worried about the older ones.

Works good with 2.19 and 2.19.1, but not 2.18.50.0.7. Not sure it makes sense 
to adapt it there and add more patch versions to tree. See attached.

--Boundary-00=_ZIs5Jyx838d2gh3
Content-Type: text/x-diff;
  charset="iso 8859-1";
  name="0002-binutils-add-binutils-x86_64_i386_biarch.patch.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0002-binutils-add-binutils-x86_64_i386_biarch.patch.patch"

=46rom 9aec05acf54fede5890297665bf98995f04eba2d Mon Sep 17 00:00:00 2001
=46rom: Roman I Khimov <khimov@altell.ru>
Date: Wed, 15 Apr 2009 15:48:22 +0400
Subject: [PATCH 02/11] binutils: add binutils-x86_64_i386_biarch.patch

Adds 'lib32' directories to binutils search paths on x86_64.
=2D--
 recipes/binutils/binutils_2.18.bb                  |    2 +-
 recipes/binutils/binutils_2.19.1.bb                |    1 +
 recipes/binutils/binutils_2.19.bb                  |    1 +
 .../files/binutils-x86_64_i386_biarch.patch        |   25 ++++++++++++++++=
++++
 4 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 recipes/binutils/files/binutils-x86_64_i386_biarch.patch

diff --git a/recipes/binutils/binutils_2.18.bb b/recipes/binutils/binutils_=
2.18.bb
index 9367196..562c8ba 100644
=2D-- a/recipes/binutils/binutils_2.18.bb
+++ b/recipes/binutils/binutils_2.18.bb
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
index c399ab8..1802dfb 100644
=2D-- a/recipes/binutils/binutils_2.19.1.bb
+++ b/recipes/binutils/binutils_2.19.1.bb
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
index aee5840..782d5c7 100644
=2D-- a/recipes/binutils/binutils_2.19.bb
+++ b/recipes/binutils/binutils_2.19.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "\
      file://binutils-uclibc-300-012_check_ldrunpath_length.patch;patch=3D1=
 \
      file://binutils-uclibc-gas-needs-libm.patch;patch=3D1 \
      file://binutils-arm-pr7093.patch;patch=3D1 \
+     file://binutils-x86_64_i386_biarch.patch;patch=3D1 \
      "
=20
 # powerpc patches
diff --git a/recipes/binutils/files/binutils-x86_64_i386_biarch.patch b/rec=
ipes/binutils/files/binutils-x86_64_i386_biarch.patch
new file mode 100644
index 0000000..b79a76a
=2D-- /dev/null
+++ b/recipes/binutils/files/binutils-x86_64_i386_biarch.patch
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
=2D-=20
1.6.2.1


--Boundary-00=_ZIs5Jyx838d2gh3--
