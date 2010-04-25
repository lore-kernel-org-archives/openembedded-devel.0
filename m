Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O67Ph-0006ew-5O
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 21:22:46 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 4CA4C4B00B3;
	Sun, 25 Apr 2010 21:19:04 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 4F96C4B0076;
	Sun, 25 Apr 2010 21:19:02 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Apr 2010 21:20:14 +0200
Message-Id: <1272223214-23542-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1272114888-16964-4-git-send-email-eric@eukrea.com>
References: <1272114888-16964-4-git-send-email-eric@eukrea.com>
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] kernel.class : fix for recent kernel on x86
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
X-List-Received-Date: Sun, 25 Apr 2010 19:22:46 -0000

- bitbake linux for a x86 machine fails with the following message :
cp: target `.../image/kernel//include/asm-x86/' is not a directory

so create $kerneldir/include/asm-x86 before trying to copy something in
this directory.

- make headers_install fails because of missing directories in include
(tested with linux 2.6.32 and 2.6.33 on x86) and missing Kbuild

Signed-off-by: Eric Benard <eric@eukrea.com>
---
change since v1 : also install include/Kbuild as it's necessary for make headers_install

 classes/kernel.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 7504c11..f27b24e 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -142,6 +142,7 @@ kernel_do_install() {
 
 	# Check for arch/x86 on i386
 	elif [ -d arch/x86/include/asm/ ]; then
+		mkdir -p $kerneldir/include/asm-x86/
 		cp -fR arch/x86/include/asm/* $kerneldir/include/asm-x86/
 		install -d $kerneldir/arch/x86/include
 		cp -fR arch/x86/* $kerneldir/arch/x86/
@@ -155,12 +156,15 @@ kernel_do_install() {
 	mkdir -p $kerneldir/include/asm-generic
 	cp -fR include/asm-generic/* $kerneldir/include/asm-generic/
 
-	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace; do
+	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace include/mtd include/rdma include/drm include/xen; do
 		if [ -d $entry ]; then
 			mkdir -p $kerneldir/$entry
 			cp -fR $entry/* $kerneldir/$entry/
 		fi
 	done
+	if [ -f include/Kbuild ]; then
+		cp -fR include/Kbuild $kerneldir/include
+	fi
 
 	if [ -d drivers/sound ]; then
 		# 2.4 alsa needs some headers from this directory
-- 
1.6.3.3



