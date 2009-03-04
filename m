Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTl-0005OW-OT
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:58:09 +0100
Received: (qmail 26553 invoked by uid 813007); 4 Mar 2009 15:53:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:41 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPZ-0001D5-Ne; Wed, 04 Mar 2009 16:53:33 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:26 +0100
Message-Id: <1236182004-4523-12-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 11/70] beecrypt: get patch from Poky to fix building on 64bit machines
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:54 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5068 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/beecrypt/beecrypt_3.1.0.bb  |   16 ++++------------
 packages/beecrypt/files/x64fix.patch |   20 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 12 deletions(-)
 create mode 100644 packages/beecrypt/files/x64fix.patch

diff --git a/packages/beecrypt/beecrypt_3.1.0.bb b/packages/beecrypt/beecrypt_3.1.0.bb
index f9a45e7..720d99a 100644
--- a/packages/beecrypt/beecrypt_3.1.0.bb
+++ b/packages/beecrypt/beecrypt_3.1.0.bb
@@ -4,9 +4,10 @@
 
 DESCRIPTION="Beecrypt is a general-purpose cryptography library."
 HOMEPAGE="http://sourceforge.net/projects/beecrypt"
-SRC_URI="${SOURCEFORGE_MIRROR}/beecrypt/beecrypt-${PV}.tar.gz"
+SRC_URI="${SOURCEFORGE_MIRROR}/beecrypt/beecrypt-${PV}.tar.gz \
+         file://x64fix.patch;patch=1"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools
 acpaths=""
@@ -14,15 +15,6 @@ acpaths=""
 EXTRA_OECONF="--with-arch=${TARGET_ARCH} --enable-shared --enable-static"
 
 do_stage() {
-
-#	oe_libinstall  -a  -C .libs libbeecrypt  ${STAGING_LIBDIR}
-	cp .libs/libbeecrypt.a ${STAGING_LIBDIR}/
-	install -d ${STAGING_INCDIR}/
-	install -d ${STAGING_INCDIR}/beecrypt
-	for X in beecrypt.h beecrypt.api.h memchunk.h mpnumber.h beecrypt.gnu.h mp.h mpopt.h blockmode.h endianness.h
-	do
-		install -m 0644 ${X} ${STAGING_INCDIR}/beecrypt/${X}
-	done
-
+    autotools_stage_all
 }
 
diff --git a/packages/beecrypt/files/x64fix.patch b/packages/beecrypt/files/x64fix.patch
new file mode 100644
index 0000000..9ee75c1
--- /dev/null
+++ b/packages/beecrypt/files/x64fix.patch
@@ -0,0 +1,20 @@
+Index: beecrypt-3.1.0/configure.ac
+===================================================================
+--- beecrypt-3.1.0.orig/configure.ac	2008-08-16 12:08:02.000000000 +0100
++++ beecrypt-3.1.0/configure.ac	2008-08-16 12:08:26.000000000 +0100
+@@ -754,15 +754,6 @@
+ 
+ # Check where to install the libraries
+ bc_libalt=
+-case $target_os in
+-linux*)
+-  case $bc_target_arch in
+-  alpha* | powerpc64 | s390x | x86_64)
+-    bc_libalt="64"
+-    ;;
+-  esac
+-  ;;
+-esac
+ AC_SUBST(LIBALT,$bc_libalt)
+ 
+ # Generate output files.
-- 
1.6.1.3





