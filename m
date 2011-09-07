Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R1EX4-0002a9-LO
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 11:34:58 +0200
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 34C48CA8B75
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2011 11:22:03 +0200 (CEST)
Received: from e6520eb.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 871714B01A6;
	Wed,  7 Sep 2011 11:21:57 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 11:21:51 +0200
Message-Id: <1315387311-20180-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <CA+chaQdYjN2tEhr6NXa0Qvix-1MoRPrG3iVMnD6ueLsSvXL+9g@mail.gmail.com>
References: <CA+chaQdYjN2tEhr6NXa0Qvix-1MoRPrG3iVMnD6ueLsSvXL+9g@mail.gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe v2] binutils-2.20.1: fix checksums as 2.20.1 is now 2.20.1a
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
X-List-Received-Date: Wed, 07 Sep 2011 09:34:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2.20.1 is now 2.20.1a (but when extracting the 2.20.1a sources, the
directory name is still 2.20.1)

$ LANG=3DC diff -rq binutils-2.20.1 binutils-2.20.1a
Only in binutils-2.20.1a: cgen
Files binutils-2.20.1/md5.sum and binutils-2.20.1a/md5.sum differ
Files binutils-2.20.1/opcodes/m32c-desc.c and binutils-2.20.1a/opcodes/m3=
2c-desc.c differ
Files binutils-2.20.1/opcodes/mep-asm.c and binutils-2.20.1a/opcodes/mep-=
asm.c differ
Files binutils-2.20.1/opcodes/mep-opc.c and binutils-2.20.1a/opcodes/mep-=
opc.c differ

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../recipes-devtools/binutils/binutils_2.20.1.bb   |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb b/meta-=
oe/recipes-devtools/binutils/binutils_2.20.1.bb
index 2558bda..d4eb516 100644
--- a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
+++ b/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
@@ -1,6 +1,6 @@
 require binutils.inc
=20
-PR =3D "r6"
+PR =3D "r7"
=20
 LIC_FILES_CHKSUM=3D"\
     file://src-release;endline=3D17;md5=3D4830a9ef968f3b18dd5e9f2c00db2d=
35\
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM=3D"\
     "
=20
 SRC_URI =3D "\
-     ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
+     ${GNU_MIRROR}/binutils/binutils-${PV}a.tar.bz2 \
      file://binutils-uclibc-100-uclibc-conf.patch \
      file://110-arm-eabi-conf.patch \
      file://binutils-uclibc-300-001_ld_makefile_patch.patch \
@@ -36,7 +36,7 @@ SRC_URI =3D "\
      file://202_elflink_noaddneeded_vs_weak.patch \
      "
=20
-SRC_URI[md5sum] =3D "9cdfb9d6ec0578c166d3beae5e15c4e5"
-SRC_URI[sha256sum] =3D "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53=
df906498afe6f6f8"
+SRC_URI[md5sum] =3D "2b9dc8f2b7dbd5ec5992c6e29de0b764"
+SRC_URI[sha256sum] =3D "71d37c96451333c5c0b84b170169fdcb138bbb27397dc062=
81905d9717c8ed64"
=20
 BBCLASSEXTEND =3D "native"
--=20
1.7.6



