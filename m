Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1O2MTp-0003od-BO
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 12:39:32 +0200
Received: by bwz26 with SMTP id 26so1160032bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 03:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=xKwOxYE3jqHbR00LUxXtKRW8KFzVy8rkA8f60yDphMc=;
	b=sWznWRxRaILwoAdu+MWqKjrJETDL8xDYXvXk/s1MWLNIPUgvAjKkHyqX2TXLWIRK9t
	9l8lL50q8w2arrM+Ho2oibkYJwzj1lA9ofJZBFlnXUcd6AbKVjoWKLv4b01EQ7c0/GSP
	rCMMiGdhUbLnBerbvl0JgQLZqg3qlkYevOkA8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=itWU7wi73KCA4SxThZDzOKygy6U3RzhdcVplF24ZQHkMuJh9pd3t5nP7tSGSu3+Hb4
	Aa+YA+yusB1az79G15CnI7KjZrsZ/8OoV9vJAOL0qf69QAopRHnPAArRi1fGzpZ6LLGA
	oXR+8aCYwXfajGbdATcSmU0HtEshx7p8wjXpg=
Received: by 10.204.138.219 with SMTP id b27mr678861bku.139.1271327759309;
	Thu, 15 Apr 2010 03:35:59 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 24sm916358bkr.18.2010.04.15.03.35.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Apr 2010 03:35:58 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Apr 2010 12:35:49 +0200
Message-Id: <1271327750-29247-2-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1271327750-29247-1-git-send-email-koen@openembedded.org>
References: <1271327750-29247-1-git-send-email-koen@openembedded.org>
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH 2/2] recipes/linux: convert users of do_stage_append to new style staging
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
X-List-Received-Date: Thu, 15 Apr 2010 10:39:32 -0000

---
 recipes/linux/linux-bug_2.6.27.2.bb           |   10 ++--
 recipes/linux/linux-dht-walnut_2.6.20.bb      |   12 ++--
 recipes/linux/linux-dht-walnut_2.6.23.bb      |   12 ++--
 recipes/linux/linux-efika_2.6.20.20.bb        |   14 +++---
 recipes/linux/linux-efika_2.6.20.bb           |   14 +++---
 recipes/linux/linux-efika_2.6.21+git.bb       |   14 +++---
 recipes/linux/linux-magicbox_2.6.18.6.bb      |   12 ++--
 recipes/linux/linux-magicbox_2.6.19.2.bb      |   12 ++--
 recipes/linux/linux-ml403-mvista-2.6.x_git.bb |   14 +++---
 recipes/linux/linux-nokia800_2.6.21-osso71.bb |    6 +-
 recipes/linux/linux-sequoia_2.6.21.bb         |   14 +++---
 recipes/linux/linux_2.6.20.bb                 |   70 ++++++++++++------------
 recipes/linux/linux_2.6.26.bb                 |    6 +-
 recipes/linux/linux_2.6.27.bb                 |    6 +-
 14 files changed, 108 insertions(+), 108 deletions(-)

diff --git a/recipes/linux/linux-bug_2.6.27.2.bb b/recipes/linux/linux-bug_2.6.27.2.bb
index 74d74be..469a6e3 100644
--- a/recipes/linux/linux-bug_2.6.27.2.bb
+++ b/recipes/linux/linux-bug_2.6.27.2.bb
@@ -24,12 +24,12 @@ do_install_append() {
         cd ${D}/${KERNEL_IMAGEDEST} && ln -sf uImage-${KERNEL_VERSION} uImage
 }
 
-do_stage_append() {
-	cp -fR arch/arm/include/asm/* ${STAGING_KERNEL_DIR}/include/asm/
-	if [ ! -e ${STAGING_KERNEL_DIR}/include/mach ]; then
-		mkdir ${STAGING_KERNEL_DIR}/include/mach
+do_install_append() {
+	cp -fR arch/arm/include/asm/* $kerneldir/include/asm/
+	if [ ! -e $kerneldir/include/mach ]; then
+		mkdir $kerneldir/include/mach
 	fi
-	cp -fR arch/arm/plat-mxc/include/mach/* ${STAGING_KERNEL_DIR}/include/mach/
+	cp -fR arch/arm/plat-mxc/include/mach/* $kerneldir/include/mach/
 }
 
 FILESDIR = "${WORKDIR}"
diff --git a/recipes/linux/linux-dht-walnut_2.6.20.bb b/recipes/linux/linux-dht-walnut_2.6.20.bb
index 49e8d69..4d0059a 100644
--- a/recipes/linux/linux-dht-walnut_2.6.20.bb
+++ b/recipes/linux/linux-dht-walnut_2.6.20.bb
@@ -19,15 +19,15 @@ FILES_kernel-image = "/boot/zImage.elf"
 export OS = "Linux"
 ARCH = "ppc"
 
-do_stage_append () {
+do_install_append () {
 #need ppc platforms includes + friends in order for external kernel modules to compile as headers as still split
 
-       install -d ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/ppc ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/powerpc ${STAGING_KERNEL_DIR}/arch/
+       install -d $kerneldir/arch/
+       cp -pPR arch/ppc $kerneldir/arch/
+       cp -pPR arch/powerpc $kerneldir/arch/
 
-       cp -pPR include/asm-powerpc ${STAGING_KERNEL_DIR}/include/
-       cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
+       cp -pPR include/asm-powerpc $kerneldir/include/
+       cp -pPR include/asm-ppc $kerneldir/include/
 }
 
 do_install_append () {
diff --git a/recipes/linux/linux-dht-walnut_2.6.23.bb b/recipes/linux/linux-dht-walnut_2.6.23.bb
index 3153d1d..fee1ff9 100644
--- a/recipes/linux/linux-dht-walnut_2.6.23.bb
+++ b/recipes/linux/linux-dht-walnut_2.6.23.bb
@@ -21,15 +21,15 @@ FILES_kernel-image = "/boot/zImage.elf"
 export OS = "Linux"
 ARCH = "ppc"
 
-do_stage_append () {
+do_install_append () {
 #need ppc platforms includes + friends in order for external kernel modules to compile as headers as still split
 
-       install -d ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/ppc ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/powerpc ${STAGING_KERNEL_DIR}/arch/
+       install -d $kerneldir/arch/
+       cp -pPR arch/ppc $kerneldir/arch/
+       cp -pPR arch/powerpc $kerneldir/arch/
 
-       cp -pPR include/asm-powerpc ${STAGING_KERNEL_DIR}/include/
-       cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
+       cp -pPR include/asm-powerpc $kerneldir/include/
+       cp -pPR include/asm-ppc $kerneldir/include/
 }
 
 do_install_append () {
diff --git a/recipes/linux/linux-efika_2.6.20.20.bb b/recipes/linux/linux-efika_2.6.20.20.bb
index be88b19..972677b 100644
--- a/recipes/linux/linux-efika_2.6.20.20.bb
+++ b/recipes/linux/linux-efika_2.6.20.20.bb
@@ -59,16 +59,16 @@ do_configure() {
 		make ARCH=${ARCH} oldconfig
 }
 
-do_stage_append () {
+do_install_append () {
 #need ppc platforms includes + friends in order for external kernel modules to compile as headers as still split
 
-       install -d ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/ppc ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/powerpc ${STAGING_KERNEL_DIR}/arch/
+       install -d $kerneldir/arch/
+       cp -pPR arch/ppc $kerneldir/arch/
+       cp -pPR arch/powerpc $kerneldir/arch/
 
-       install -d ${STAGING_KERNEL_DIR}/include/asm
-       cp -pPR include/asm-powerpc ${STAGING_KERNEL_DIR}/include/
-       cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
+       install -d $kerneldir/include/asm
+       cp -pPR include/asm-powerpc $kerneldir/include/
+       cp -pPR include/asm-ppc $kerneldir/include/
 }
 
 SRC_URI[kernel.md5sum] = "34b0f354819217e6a345f48ebbd8f13e"
diff --git a/recipes/linux/linux-efika_2.6.20.bb b/recipes/linux/linux-efika_2.6.20.bb
index b451a8d..2ef13fd 100644
--- a/recipes/linux/linux-efika_2.6.20.bb
+++ b/recipes/linux/linux-efika_2.6.20.bb
@@ -56,16 +56,16 @@ do_configure() {
 		make ARCH=${ARCH} oldconfig
 }
 
-do_stage_append () {
+do_install_append () {
 #need ppc platforms includes + friends in order for external kernel modules to compile as headers as still split
 
-       install -d ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/ppc ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/powerpc ${STAGING_KERNEL_DIR}/arch/
+       install -d $kerneldir/arch/
+       cp -pPR arch/ppc $kerneldir/arch/
+       cp -pPR arch/powerpc $kerneldir/arch/
 
-       install -d ${STAGING_KERNEL_DIR}/include/asm
-       cp -pPR include/asm-powerpc ${STAGING_KERNEL_DIR}/include/
-       cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
+       install -d $kerneldir/include/asm
+       cp -pPR include/asm-powerpc $kerneldir/include/
+       cp -pPR include/asm-ppc $kerneldir/include/
 }
 
 SRC_URI[md5sum] = "34b0f354819217e6a345f48ebbd8f13e"
diff --git a/recipes/linux/linux-efika_2.6.21+git.bb b/recipes/linux/linux-efika_2.6.21+git.bb
index e4f92c6..b1552c2 100644
--- a/recipes/linux/linux-efika_2.6.21+git.bb
+++ b/recipes/linux/linux-efika_2.6.21+git.bb
@@ -43,14 +43,14 @@ do_configure() {
 		make ARCH=${ARCH} oldconfig
 }
 
-do_stage_append () {
+do_install_append () {
 #need ppc platforms includes + friends in order for external kernel modules to compile as headers as still split
 
-       install -d ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/ppc ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/powerpc ${STAGING_KERNEL_DIR}/arch/
+       install -d $kerneldir/arch/
+       cp -pPR arch/ppc $kerneldir/arch/
+       cp -pPR arch/powerpc $kerneldir/arch/
 
-       install -d ${STAGING_KERNEL_DIR}/include/asm
-       cp -pPR include/asm-powerpc ${STAGING_KERNEL_DIR}/include/
-       cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
+       install -d $kerneldir/include/asm
+       cp -pPR include/asm-powerpc $kerneldir/include/
+       cp -pPR include/asm-ppc $kerneldir/include/
 }
diff --git a/recipes/linux/linux-magicbox_2.6.18.6.bb b/recipes/linux/linux-magicbox_2.6.18.6.bb
index 89f1c14..248f502 100644
--- a/recipes/linux/linux-magicbox_2.6.18.6.bb
+++ b/recipes/linux/linux-magicbox_2.6.18.6.bb
@@ -40,15 +40,15 @@ do_configure_prepend() {
 }
 
 
-do_stage_append () {
+do_install_append () {
 #need ppc platforms includes + friends in order for external kernel modules to compile as headers as still split
 
-       install -d ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/ppc ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/powerpc ${STAGING_KERNEL_DIR}/arch/
+       install -d $kerneldir/arch/
+       cp -pPR arch/ppc $kerneldir/arch/
+       cp -pPR arch/powerpc $kerneldir/arch/
 
-       cp -pPR include/asm-powerpc ${STAGING_KERNEL_DIR}/include/
-       cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
+       cp -pPR include/asm-powerpc $kerneldir/include/
+       cp -pPR include/asm-ppc $kerneldir/include/
 }
 
 
diff --git a/recipes/linux/linux-magicbox_2.6.19.2.bb b/recipes/linux/linux-magicbox_2.6.19.2.bb
index a0bae17..5647dbd 100644
--- a/recipes/linux/linux-magicbox_2.6.19.2.bb
+++ b/recipes/linux/linux-magicbox_2.6.19.2.bb
@@ -73,15 +73,15 @@ do_configure_prepend() {
 }
 
 
-do_stage_append () {
+do_install_append () {
 #need ppc platforms includes + friends in order for external kernel modules to compile as headers as still split
 
-       install -d ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/ppc ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/powerpc ${STAGING_KERNEL_DIR}/arch/
+       install -d $kerneldir/arch/
+       cp -pPR arch/ppc $kerneldir/arch/
+       cp -pPR arch/powerpc $kerneldir/arch/
 
-       cp -pPR include/asm-powerpc ${STAGING_KERNEL_DIR}/include/
-       cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
+       cp -pPR include/asm-powerpc $kerneldir/include/
+       cp -pPR include/asm-ppc $kerneldir/include/
 }
 
 
diff --git a/recipes/linux/linux-ml403-mvista-2.6.x_git.bb b/recipes/linux/linux-ml403-mvista-2.6.x_git.bb
index 28b6708..d600945 100644
--- a/recipes/linux/linux-ml403-mvista-2.6.x_git.bb
+++ b/recipes/linux/linux-ml403-mvista-2.6.x_git.bb
@@ -29,16 +29,16 @@ do_configure() {
                 make ARCH=${ARCH} oldconfig
 }
 
-do_stage_append () {
+do_install_append () {
 #need ppc platforms includes + friends in order for external kernel modules to compile as headers a$
 
-       install -d ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/ppc ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/powerpc ${STAGING_KERNEL_DIR}/arch/
+       install -d $kerneldir/arch/
+       cp -pPR arch/ppc $kerneldir/arch/
+       cp -pPR arch/powerpc $kerneldir/arch/
 
-       install -d ${STAGING_KERNEL_DIR}/include/asm
-       cp -pPR include/asm-powerpc ${STAGING_KERNEL_DIR}/include/
-       cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
+       install -d $kerneldir/include/asm
+       cp -pPR include/asm-powerpc $kerneldir/include/
+       cp -pPR include/asm-ppc $kerneldir/include/
 }
 
 
diff --git a/recipes/linux/linux-nokia800_2.6.21-osso71.bb b/recipes/linux/linux-nokia800_2.6.21-osso71.bb
index 9e72d95..da167c3 100644
--- a/recipes/linux/linux-nokia800_2.6.21-osso71.bb
+++ b/recipes/linux/linux-nokia800_2.6.21-osso71.bb
@@ -13,9 +13,9 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.21.tar.bz2;name=k
 
 S = "${WORKDIR}/linux-2.6.21"
 
-do_stage_append () {
-	mkdir -p ${STAGING_KERNEL_DIR}/drivers/media/video/omap/
-	cp -f drivers/media/video/omap/tcm825x.h ${STAGING_KERNEL_DIR}/drivers/media/video/omap/
+do_install_append () {
+	mkdir -p $kerneldir/drivers/media/video/omap/
+	cp -f drivers/media/video/omap/tcm825x.h $kerneldir/drivers/media/video/omap/
 }
 
 SRC_URI[kernel.md5sum] = "1b515f588078dfa7f4bab2634bd17e80"
diff --git a/recipes/linux/linux-sequoia_2.6.21.bb b/recipes/linux/linux-sequoia_2.6.21.bb
index 121d530..35b74fa 100644
--- a/recipes/linux/linux-sequoia_2.6.21.bb
+++ b/recipes/linux/linux-sequoia_2.6.21.bb
@@ -27,16 +27,16 @@ do_configure() {
                 make ARCH=${ARCH} oldconfig
 }
 
-do_stage_append () {
+do_install_append () {
 #need ppc platforms includes + friends in order for external kernel modules to compile as headers a$
 
-       install -d ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/ppc ${STAGING_KERNEL_DIR}/arch/
-       cp -pPR arch/powerpc ${STAGING_KERNEL_DIR}/arch/
+       install -d $kerneldir/arch/
+       cp -pPR arch/ppc $kerneldir/arch/
+       cp -pPR arch/powerpc $kerneldir/arch/
 
-       install -d ${STAGING_KERNEL_DIR}/include/asm
-       cp -pPR include/asm-powerpc ${STAGING_KERNEL_DIR}/include/
-       cp -pPR include/asm-ppc ${STAGING_KERNEL_DIR}/include/
+       install -d $kerneldir/include/asm
+       cp -pPR include/asm-powerpc $kerneldir/include/
+       cp -pPR include/asm-ppc $kerneldir/include/
 }
 
 #seems like 2.6.21 kernel images have moved (or is this only for the Denx kernel ?)
diff --git a/recipes/linux/linux_2.6.20.bb b/recipes/linux/linux_2.6.20.bb
index 6ac225d..9452aac 100644
--- a/recipes/linux/linux_2.6.20.bb
+++ b/recipes/linux/linux_2.6.20.bb
@@ -41,45 +41,45 @@ SRC_URI_append_nhk15 = " \
 		file://hrw-make-create-kconfig-executable.patch;patch=1 \
 "
 
-do_stage_append_nhk15 () {
-    install -D -m 666 ${S}/drivers/video/nomadik/sga_interface.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/sga_interface.h
-    install -D -m 666 ${S}/drivers/video/nomadik/sga_defs.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/sga_defs.h
-    install -D -m 666 ${S}/drivers/video/nomadik/sga_err.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/sga_err.h
-    install -D -m 666 ${S}/drivers/video/nomadik/sga_interface.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/sga_interface.h
-    install -D -m 666 ${S}/drivers/video/nomadik/sga_ioctlfns.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/sga_ioctlfns.h
-    install -D -m 666 ${S}/drivers/video/nomadik/sga_main.h  ${STAGING_KERNEL_DIR}/drivers/video/nomadik/sga_main.h
-    install -D -m 666 ${S}/drivers/video/nomadik/sga_typs.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/sga_typs.h
+do_install_append_nhk15 () {
+    install -D -m 666 ${S}/drivers/video/nomadik/sga_interface.h $kerneldir/drivers/video/nomadik/sga_interface.h
+    install -D -m 666 ${S}/drivers/video/nomadik/sga_defs.h $kerneldir/drivers/video/nomadik/sga_defs.h
+    install -D -m 666 ${S}/drivers/video/nomadik/sga_err.h $kerneldir/drivers/video/nomadik/sga_err.h
+    install -D -m 666 ${S}/drivers/video/nomadik/sga_interface.h $kerneldir/drivers/video/nomadik/sga_interface.h
+    install -D -m 666 ${S}/drivers/video/nomadik/sga_ioctlfns.h $kerneldir/drivers/video/nomadik/sga_ioctlfns.h
+    install -D -m 666 ${S}/drivers/video/nomadik/sga_main.h  $kerneldir/drivers/video/nomadik/sga_main.h
+    install -D -m 666 ${S}/drivers/video/nomadik/sga_typs.h $kerneldir/drivers/video/nomadik/sga_typs.h
 
-    install -D -m 666 ${S}/drivers/video/nomadik/hcl/debug.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/hcl/debug.h
-    install -D -m 666 ${S}/drivers/video/nomadik/hcl/hcl_defs.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/hcl/hcl_defs.h
-    install -D -m 666 ${S}/drivers/video/nomadik/hcl/platform_os.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/hcl/platform_os.h
-    install -D -m 666 ${S}/drivers/video/nomadik/hcl/sga.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/hcl/sga.h
-    install -D -m 666 ${S}/drivers/video/nomadik/hcl/sga_irq.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/hcl/sga_irq.h
-    install -D -m 666 ${S}/drivers/video/nomadik/hcl/sga_irqp.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/hcl/sga_irqp.h
-    install -D -m 666 ${S}/drivers/video/nomadik/hcl/sga_p.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/hcl/sga_p.h
+    install -D -m 666 ${S}/drivers/video/nomadik/hcl/debug.h $kerneldir/drivers/video/nomadik/hcl/debug.h
+    install -D -m 666 ${S}/drivers/video/nomadik/hcl/hcl_defs.h $kerneldir/drivers/video/nomadik/hcl/hcl_defs.h
+    install -D -m 666 ${S}/drivers/video/nomadik/hcl/platform_os.h $kerneldir/drivers/video/nomadik/hcl/platform_os.h
+    install -D -m 666 ${S}/drivers/video/nomadik/hcl/sga.h $kerneldir/drivers/video/nomadik/hcl/sga.h
+    install -D -m 666 ${S}/drivers/video/nomadik/hcl/sga_irq.h $kerneldir/drivers/video/nomadik/hcl/sga_irq.h
+    install -D -m 666 ${S}/drivers/video/nomadik/hcl/sga_irqp.h $kerneldir/drivers/video/nomadik/hcl/sga_irqp.h
+    install -D -m 666 ${S}/drivers/video/nomadik/hcl/sga_p.h $kerneldir/drivers/video/nomadik/hcl/sga_p.h
 
-    install -D -m 666 ${S}/drivers/media/video/hcl_defs.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/hcl_defs.h
-    install -D -m 666 ${S}/drivers/media/video/nomadik_camera.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/nomadik_camera.h
-    install -D -m 666 ${S}/drivers/media/video/nomadik_defs.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/nomadik_defs.h
-    install -D -m 666 ${S}/drivers/media/video/nomadik_sva.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/nomadik_sva.h
-    install -D -m 666 ${S}/drivers/media/video/nomadik_sva_services.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/nomadik_sva_services.h
-    install -D -m 666 ${S}/drivers/media/video/nomadik_sva_utils.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/nomadik_sva_utils.h
-    install -D -m 666 ${S}/drivers/media/video/platform_os.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/platform_os.h
-    install -D -m 666 ${S}/drivers/media/video/sva.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/sva.h
-    install -D -m 666 ${S}/drivers/media/video/v4l2-nomadik.h ${STAGING_KERNEL_DIR}/drivers/video/nomadik/v4l2-nomadik.h
+    install -D -m 666 ${S}/drivers/media/video/hcl_defs.h $kerneldir/drivers/video/nomadik/hcl_defs.h
+    install -D -m 666 ${S}/drivers/media/video/nomadik_camera.h $kerneldir/drivers/video/nomadik/nomadik_camera.h
+    install -D -m 666 ${S}/drivers/media/video/nomadik_defs.h $kerneldir/drivers/video/nomadik/nomadik_defs.h
+    install -D -m 666 ${S}/drivers/media/video/nomadik_sva.h $kerneldir/drivers/video/nomadik/nomadik_sva.h
+    install -D -m 666 ${S}/drivers/media/video/nomadik_sva_services.h $kerneldir/drivers/video/nomadik/nomadik_sva_services.h
+    install -D -m 666 ${S}/drivers/media/video/nomadik_sva_utils.h $kerneldir/drivers/video/nomadik/nomadik_sva_utils.h
+    install -D -m 666 ${S}/drivers/media/video/platform_os.h $kerneldir/drivers/video/nomadik/platform_os.h
+    install -D -m 666 ${S}/drivers/media/video/sva.h $kerneldir/drivers/video/nomadik/sva.h
+    install -D -m 666 ${S}/drivers/media/video/v4l2-nomadik.h $kerneldir/drivers/video/nomadik/v4l2-nomadik.h
 
-    install -D -m 666 ${S}/drivers/media/nomadik_mm/saa/saaioctl.h ${STAGING_KERNEL_DIR}/include/saaioctl.h
-    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/saa.h ${STAGING_KERNEL_DIR}/../multimedia/include/saa.h
-    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/include/hcl_defs.h ${STAGING_KERNEL_DIR}/../multimedia/include/hcl_defs.h
-    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/include/platform_os.h ${STAGING_KERNEL_DIR}/../multimedia/include/platform_os.h
-    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/include/debug.h ${STAGING_KERNEL_DIR}/../multimedia/include/debug.h
+    install -D -m 666 ${S}/drivers/media/nomadik_mm/saa/saaioctl.h $kerneldir/include/saaioctl.h
+    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/saa.h $kerneldir/../multimedia/include/saa.h
+    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/include/hcl_defs.h $kerneldir/../multimedia/include/hcl_defs.h
+    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/include/platform_os.h $kerneldir/../multimedia/include/platform_os.h
+    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/include/debug.h $kerneldir/../multimedia/include/debug.h
 
-    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/ha_hcl_fw_interface.h ${STAGING_KERNEL_DIR}/../multimedia/include/ha_hcl_fw_interface.h
-    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/ha_api_params.h ${STAGING_KERNEL_DIR}/../multimedia/include/ha_api_params.h
-    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/ha_codec_params.h ${STAGING_KERNEL_DIR}/../multimedia/include/ha_codec_params.h
-    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/ha_effect_params.h ${STAGING_KERNEL_DIR}/../multimedia/include/ha_effect_params.h
-    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/ha_effect_info.h ${STAGING_KERNEL_DIR}/../multimedia/include/ha_effect_info.h
-    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/ha_codec_info.h ${STAGING_KERNEL_DIR}/../multimedia/include/ha_codec_info.h
+    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/ha_hcl_fw_interface.h $kerneldir/../multimedia/include/ha_hcl_fw_interface.h
+    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/ha_api_params.h $kerneldir/../multimedia/include/ha_api_params.h
+    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/ha_codec_params.h $kerneldir/../multimedia/include/ha_codec_params.h
+    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/ha_effect_params.h $kerneldir/../multimedia/include/ha_effect_params.h
+    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/ha_effect_info.h $kerneldir/../multimedia/include/ha_effect_info.h
+    install -D -m 666 ${S}/drivers/media/nomadik_mm/hcl/saa/ha_codec_info.h $kerneldir/../multimedia/include/ha_codec_info.h
 
 }
 
diff --git a/recipes/linux/linux_2.6.26.bb b/recipes/linux/linux_2.6.26.bb
index 933664e..6089f47 100644
--- a/recipes/linux/linux_2.6.26.bb
+++ b/recipes/linux/linux_2.6.26.bb
@@ -40,10 +40,10 @@ SRC_URI_append_mpc8313e-rdb = "\
 SRC_URI_append_topas910 = "http://www.bplan-gmbh.org/data/toshiba/topas/linux/2.6.26.5/patch_2.6.26.5_topas910.bz2;patch=1;name=topaspatch"
 
 # see http://bugzilla.kernel.org/show_bug.cgi?id=11143
-do_stage_append() {
+do_install_append() {
 	if [ -f arch/${ARCH}/lib/crtsavres.o ]; then
-		mkdir -p ${STAGING_KERNEL_DIR}/arch/${ARCH}/lib
-		cp -a arch/${ARCH}/lib/crtsavres.o ${STAGING_KERNEL_DIR}/arch/${ARCH}/lib/
+		mkdir -p $kerneldir/arch/${ARCH}/lib
+		cp -a arch/${ARCH}/lib/crtsavres.o $kerneldir/arch/${ARCH}/lib/
 	fi
 }
 
diff --git a/recipes/linux/linux_2.6.27.bb b/recipes/linux/linux_2.6.27.bb
index 5ce50c9..b5c67e2 100644
--- a/recipes/linux/linux_2.6.27.bb
+++ b/recipes/linux/linux_2.6.27.bb
@@ -77,10 +77,10 @@ SRC_URI_append_ts72xx = "\
            "
 
 # see http://bugzilla.kernel.org/show_bug.cgi?id=11143
-do_stage_append() {
+do_install_append() {
 	if [ -f arch/${ARCH}/lib/crtsavres.o ]; then
-		mkdir -p ${STAGING_KERNEL_DIR}/arch/${ARCH}/lib
-		cp -a arch/${ARCH}/lib/crtsavres.o ${STAGING_KERNEL_DIR}/arch/${ARCH}/lib/
+		mkdir -p $kerneldir/arch/${ARCH}/lib
+		cp -a arch/${ARCH}/lib/crtsavres.o $kerneldir/arch/${ARCH}/lib/
 	fi
 }
 
-- 
1.7.0



