Received: from [128.2.201.16] (helo=jackfruit.srv.cs.cmu.edu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhuggins@cs.cmu.edu>) id 1LrD5Q-0000zw-EU
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 17:20:05 +0200
Received: from localhost.localdomain (LIMA-2.SPEECH.CS.CMU.EDU [128.2.222.132])
	by jackfruit.srv.cs.cmu.edu (8.13.6/8.13.6) with ESMTP id
	n37FGgSn013462; Tue, 7 Apr 2009 11:16:42 -0400 (EDT)
From: David Huggins-Daines <dhuggins@cs.cmu.edu>
To: openembedded-devel@openembedded.org
Date: Tue,  7 Apr 2009 11:16:44 -0400
Message-Id: <1239117404-2263-1-git-send-email-dhuggins@cs.cmu.edu>
X-Mailer: git-send-email 1.5.6.3
X-Scanned-By: mimedefang-cmuscs on 128.2.201.16
X-SA-Exim-Connect-IP: 128.2.201.16
X-SA-Exim-Mail-From: dhuggins@cs.cmu.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	RDNS_NONE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: David Huggins-Daines <dhuggins@cs.cmu.edu>
Subject: [PATCH] fix GCC 4.3.3 sources in stable/2009 branch
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
X-List-Received-Date: Tue, 07 Apr 2009 15:20:23 -0000

Currently it's not possible to build the stable/2009 branch with GCC 4.3.3,
because it hardcodes a download location for the sources which is not
resolvable (at least from where I am...).  It was suggested to change the
recipe to use GNU_MIRROR.

Unfortunately, bitbake.conf and checksums.ini have a different idea of what
the URI for the main GNU download site is.  This patch fixes these problems.
---
 conf/bitbake.conf         |    2 +-
 recipes/gcc/gcc-4.3.3.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 7c159af..34b0ba9 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -495,7 +495,7 @@ FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
 GENTOO_MIRROR = "http://distro.ibiblio.org/pub/linux/distributions/gentoo/distfiles"
 GNOME_GIT = "git://git.gnome.org"
 GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
-GNU_MIRROR = "ftp://ftp.gnu.org/gnu"
+GNU_MIRROR = "ftp://ftp.gnu.org/pub/gnu"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
 GPE_EXTRA_SVN = "svn://projects.linuxtogo.org/svn/gpe/trunk/extra;module=${PN}"
 GPE_SVN = "svn://projects.linuxtogo.org/svn/gpe/trunk/base;module=${PN}"
diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index 4bed0e4..860c96c 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -6,7 +6,7 @@ require gcc-common.inc
 
 DEPENDS = "mpfr gmp"
 
-SRC_URI = "http://gcc.releasenotes.org/releases/gcc-${PV}/gcc-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
 	file://fedora/gcc43-ia64-libunwind.patch;patch=1;pnum=0 \
 	file://fedora/gcc43-java-nomulti.patch;patch=1;pnum=0 \
-- 
1.5.6.3



