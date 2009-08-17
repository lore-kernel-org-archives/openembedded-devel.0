Received: from [131.111.8.130] (helo=ppsw-0.csi.cam.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1Md2uD-0007GK-MF
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 16:09:51 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:51259)
	by ppsw-0.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.150]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1Md2do-0002Nw-1C (Exim 4.70)
	(return-path <jic23@cam.ac.uk>); Mon, 17 Aug 2009 14:52:52 +0100
Message-ID: <4A8960BC.4000603@cam.ac.uk>
Date: Mon, 17 Aug 2009 14:53:00 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Thunderbird 2.0.0.22 (X11/20090803)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
Subject: [PATCH] glibc 2.7 and 2.9 (arm): Remove unnecessary asm/page.h include
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
X-List-Received-Date: Mon, 17 Aug 2009 14:09:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Fix compile bug for arm with recent kernel headers
../ports/sysdeps/unix/sysv/linux/arm/ioperm.c:48:22: error: asm/page.h: No such file or directory

Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
---
Update to previous posting under 
[PATCH] glibc 2.9: Remove unnecessary asm/page.h include, not present in recent headers

This patch is already included by the 2.6.1 recipe (thanks Khem)
Prevents the following error with recent kernel headers
../ports/sysdeps/unix/sysv/linux/arm/ioperm.c:48:22: error: asm/page.h: No such file or directory

Fixes problem with 2.6.29 headers against both glibc 2.7 and 2.9

Related bug reports (with equivalent solutions)
http://www.mail-archive.com/debian-glibc@lists.debian.org/msg38393.html
http://sourceware.org/ml/crossgcc/2008-05/msg00014.html
http://sourceware.org/ml/libc-ports/2008-04/msg00005.html

Bug no longer exists at head of glibc ports tree. May effect other versions.

 recipes/glibc/glibc_2.7.bb |    3 ++-
 recipes/glibc/glibc_2.9.bb |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/glibc/glibc_2.7.bb b/recipes/glibc/glibc_2.7.bb
index f152756..dcea69c 100644
--- a/recipes/glibc/glibc_2.7.bb
+++ b/recipes/glibc/glibc_2.7.bb
@@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
 PACKAGES_DYNAMIC = "libc6*"
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
@@ -68,6 +68,7 @@ SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
            file://march-i686.patch;patch=1;pnum=0 \
+	   file://glibc-arm-no-asm-page.patch;patch=1 \
            "
 
 
diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index 6e323aa..9849c0a 100644
--- a/recipes/glibc/glibc_2.9.bb
+++ b/recipes/glibc/glibc_2.9.bb
@@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
 PACKAGES_DYNAMIC = "libc6*"
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
@@ -65,6 +65,7 @@ SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
            file://generate-supported.mk \
            file://march-i686.patch;patch=1;pnum=0 \
 	   file://tls_i486.patch;patch=1 \
+	   file://glibc-arm-no-asm-page.patch;patch=1 \
            "
 
 
-- 
1.6.3.3



