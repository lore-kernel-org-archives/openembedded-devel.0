Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lv4tP-0005Dv-FV
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Apr 2009 09:23:15 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id B66B9189358; Sat, 18 Apr 2009 09:22:46 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Apr 2009 09:22:46 +0200
Message-Id: <1240039366-5095-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] libelf: fix another GNU_HASH issues while building libelf
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
X-List-Received-Date: Sat, 18 Apr 2009 07:23:17 -0000

From: Carsten Haitzler (Rasterman <raster@rasterman.com>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/libelf/libelf_0.8.6.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/libelf/libelf_0.8.6.bb b/recipes/libelf/libelf_0.8.6.bb
index 4bd548e..f0903d7 100644
--- a/recipes/libelf/libelf_0.8.6.bb
+++ b/recipes/libelf/libelf_0.8.6.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "libelf is an ELF object file access library. \
 The elf library provides routines to access, and manipulate, Elf object files."
 LICENSE = "LGPL"
 SECTION = "libs"
+PR = "r1"
 
 SRC_URI = "http://www.mr511.de/software/libelf-${PV}.tar.gz \
            http://www.stud.uni-hannover.de/~michael/software/libelf-${PV}.tar.gz"
@@ -10,6 +11,8 @@ inherit autotools
 
 PARALLEL_MAKE = ""
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_configure_prepend () {
 	if test ! -e acinclude.m4; then
 		cp aclocal.m4 acinclude.m4
-- 
1.5.6.5



