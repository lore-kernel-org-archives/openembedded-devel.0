Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M3xpA-0007xO-FW
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 21:39:36 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=localhost.localdomain)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M3xig-0007MQ-So; Tue, 12 May 2009 23:32:55 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 May 2009 23:32:53 +0400
Message-Id: <1242156773-26205-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.4
Subject: [PATCH] glibc 2.7/2.9: add march-i686.patch
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
X-List-Received-Date: Tue, 12 May 2009 19:39:36 -0000

This patch is there for 2.6.1, but for some reason was not carried on to
2.7 and 2.9. Without it build for i686 machine fails.
---
 recipes/glibc/glibc_2.7.bb |    3 ++-
 recipes/glibc/glibc_2.9.bb |    3 +++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/glibc/glibc_2.7.bb b/recipes/glibc/glibc_2.7.bb
index ec4b347..8ae84c1 100644
--- a/recipes/glibc/glibc_2.7.bb
+++ b/recipes/glibc/glibc_2.7.bb
@@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
 PACKAGES_DYNAMIC = "libc6*"
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 
-PR = "r9"
+PR = "r10"
 
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
@@ -67,6 +67,7 @@ SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
 	   file://generic-bits_time.h \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
+           file://march-i686.patch;patch=1;pnum=0 \
            "
 
 
diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index 0af9f26..7859876 100644
--- a/recipes/glibc/glibc_2.9.bb
+++ b/recipes/glibc/glibc_2.9.bb
@@ -5,6 +5,8 @@ ARM_INSTRUCTION_SET = "arm"
 PACKAGES_DYNAMIC = "libc6*"
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 
+PR = "r1"
+
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
@@ -58,6 +60,7 @@ SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
 	   file://generic-bits_time.h \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
+           file://march-i686.patch;patch=1;pnum=0 \
            "
 
 
-- 
1.6.2.4



