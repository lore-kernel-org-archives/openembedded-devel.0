Received: from [131.111.8.135] (helo=ppsw-5.csi.cam.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>)
	id 1MczHF-0002gx-38; Mon, 17 Aug 2009 12:17:21 +0200
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:45054)
	by ppsw-5.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.155]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1Mcz0q-0003Ym-If (Exim 4.70)
	(return-path <jic23@cam.ac.uk>); Mon, 17 Aug 2009 11:00:24 +0100
Message-ID: <4A892A41.6070702@cam.ac.uk>
Date: Mon, 17 Aug 2009 11:00:33 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Thunderbird 2.0.0.22 (X11/20090803)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH] glibc 2.9: Remove unnecessary asm/page.h include, not present in recent headers
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
X-List-Received-Date: Mon, 17 Aug 2009 10:17:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Only applies to arm.  The bug may also exist for alpha.
The include doesn't appear to be necessary anyway.

Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
---
First oe patch. Please tell me if I got any of the patch formatting
wrong etc. Lots more to follow ;)

Initial copy seems to have bounced due to my first subscription
attempt going wrong. Sorry Koen if you get this twice.

 recipes/glibc/glibc-2.9/remove_page_header.patch |   10 ++++++++++
 recipes/glibc/glibc_2.9.bb                       |    3 ++-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/recipes/glibc/glibc-2.9/remove_page_header.patch b/recipes/glibc/glibc-2.9/remove_page_header.patch
new file mode 100644
index 0000000..0c446bc
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/remove_page_header.patch
@@ -0,0 +1,10 @@
+--- glibc-2.9-old/ports/sysdeps/unix/sysv/linux/arm/ioperm.c	2009-08-13 17:00:08.000000000 +0100
++++ glibc-2.9/ports/sysdeps/unix/sysv/linux/arm/ioperm.c	2009-08-13 17:01:02.000000000 +0100
+@@ -45,7 +45,6 @@
+ #include <sys/mman.h>
+ 
+ #include <linux/version.h>
+-#include <asm/page.h>
+ #include <sys/sysctl.h>
+ 
+ #define PATH_ARM_SYSTYPE	"/etc/arm_systype"
diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index 6e323aa..f3592dc 100644
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
+	   file://remove_page_header.patch;patch=1 \
            "
 
 
-- 
1.6.3.3




