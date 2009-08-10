Received: from [209.85.219.212] (helo=mail-ew0-f212.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <methril@gmail.com>) id 1MaeDN-0006fi-7A
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 01:23:44 +0200
Received: by ewy8 with SMTP id 8so2735256ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 16:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=W377nj7V2DwVdH2t/ZhOlF+a7WezZQ7IIo8Y4GSne88=;
	b=UcgzlzQZhHCkjHwHnY3khtBU54BfQUUeF5LhtuglAhVYpgOjnXQ89NHSjhFoEdFzXf
	M+J12F5jwkcPqhR/o+c48awEWrZi4BwxIvJjtIOpBA6H4O5jVHEWpS8S8xIqdQPUvm8b
	xdKO+TV91Smy5I1RI5auJzQt9nfZzwGUV3zF4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=owEj/aRTGCAipsS3POQ3RljuUKKhHCPlqqU2Xh0paIqxWlUc88XsnneRNW4beyiiCF
	hDuTvWCwL1zp4AJ0i3aY8ipok6rq0LE/kuLHM4WxPi3zJGVbQy9Et90jlvJBTw8zt3KF
	xAUpPpyHb/Pebm6z7/JFZG2J8Zy+XDj9iRFMw=
Received: by 10.210.41.14 with SMTP id o14mr76155ebo.23.1249945644978;
	Mon, 10 Aug 2009 16:07:24 -0700 (PDT)
Received: from localhost.localdomain (36.73.220.87.dynamic.jazztel.es
	[87.220.73.36])
	by mx.google.com with ESMTPS id 5sm1779157eyf.38.2009.08.10.16.07.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 Aug 2009 16:07:24 -0700 (PDT)
From: Rafael Campos Las Heras <methril@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2009 01:07:01 +0200
Message-Id: <1249945621-6787-1-git-send-email-methril@gmail.com>
X-Mailer: git-send-email 1.6.0.4
Subject: [PATCH v2] Update the em-x270 machine to work with linux_2.6.23.
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
X-List-Received-Date: Mon, 10 Aug 2009 23:23:51 -0000

 * Use of generic linux_2.6.23 recipe
 * remove em-x270_2.6.23 recipe (ugly).
 * Add a patch that allows to compile with gcc 4.1 compiler.

Signed-off-by: Rafael Campos Las Heras <methril@gmail.com>
---
Changes since the first version:
 * Fix a typo 'prevent'.
 * Modify the commit coment in a proper way

 conf/machine/em-x270.conf                          |    4 +-
 recipes/linux/em-x270_2.6.23.bb                    |   29 --------------------
 .../em-x270/01-prevent_loop_timespec_add_ns.patch} |   12 +++++---
 .../em-x270}/defconfig                             |    0
 .../em-x270}/em-x270.patch                         |    0
 recipes/linux/linux_2.6.23.bb                      |    3 ++
 6 files changed, 13 insertions(+), 35 deletions(-)
 delete mode 100644 recipes/linux/em-x270_2.6.23.bb
 copy recipes/linux/{linux-rp-2.6.24/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch => linux-2.6.23/em-x270/01-prevent_loop_timespec_add_ns.patch} (55%)
 rename recipes/linux/{em-x270-2.6.23 => linux-2.6.23/em-x270}/defconfig (100%)
 rename recipes/linux/{em-x270-2.6.23 => linux-2.6.23/em-x270}/em-x270.patch (100%)

diff --git a/conf/machine/em-x270.conf b/conf/machine/em-x270.conf
index f8a5c95..efcf104 100644
--- a/conf/machine/em-x270.conf
+++ b/conf/machine/em-x270.conf
@@ -9,7 +9,7 @@ TARGET_ARCH = "arm"
 GUI_MACHINE_CLASS ?= "bigscreen"
 
 PACKAGE_EXTRA_ARCHS = "iwmmxt "
-PREFERRED_PROVIDER_virtual/kernel = "${MACHINE}"
+PREFERRED_PROVIDER_virtual/kernel = "linux"
 
 # Use tune-xscale per default. Machine independent feeds should be built with tune-strongarm.
 #require conf/machine/include/tune-xscale.inc
@@ -43,7 +43,7 @@ MACHINE_FEATURES = "kernel26 touchscreen apm alsa bluetooth wifi usbhost usbgadg
 #
 
 #PCMCIA_MANAGER = "pcmciautils"
-PREFERRED_VERSION_em-x270 = "2.6.23"
+PREFERRED_VERSION_linux = "2.6.23"
 MODUTILS = "26"	
 PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
diff --git a/recipes/linux/em-x270_2.6.23.bb b/recipes/linux/em-x270_2.6.23.bb
deleted file mode 100644
index fcef728..0000000
--- a/recipes/linux/em-x270_2.6.23.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require linux.inc
-
-SECTION = "kernel"
-DESCRIPTION = "Linux kernel for the Compulab EM-X270 system"
-LICENSE = "GPL"
-DEPENDS = "u-boot-utils-native"
-PR = "r1"
-
-KERNEL_IMAGETYPE = "uImage"
-
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
-	   file://em-x270.patch;patch=1 \
-           file://defconfig \
-	  "
-
-S = "${WORKDIR}/linux-${PV}"
-
-COMPATIBLE_HOST = 'arm.*-linux'
-COMPATIBLE_MACHINE = "em-x270"
-
-inherit kernel
-inherit package
-
-ARCH = "arm"
-
-FILES_kernel-image = ""
-
-S = "${WORKDIR}/linux-${PV}"
-
diff --git a/recipes/linux/linux-rp-2.6.24/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch b/recipes/linux/linux-2.6.23/em-x270/01-prevent_loop_timespec_add_ns.patch
similarity index 55%
copy from recipes/linux/linux-rp-2.6.24/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
copy to recipes/linux/linux-2.6.23/em-x270/01-prevent_loop_timespec_add_ns.patch
index 9d7020d..a2f6e17 100644
--- a/recipes/linux/linux-rp-2.6.24/0001-time-prevent-the-loop-in-timespec_add_ns-from-bei.patch
+++ b/recipes/linux/linux-2.6.23/em-x270/01-prevent_loop_timespec_add_ns.patch
@@ -1,15 +1,19 @@
-Index: linux-2.6.24/include/linux/time.h
-===================================================================
+---
+ include/linux/time.h |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+diff --git a/include/linux/time.h b/include/linux/time.h
+index 2091a19..d32ef0a 100644
 --- a/include/linux/time.h
 +++ b/include/linux/time.h
-@@ -172,6 +172,10 @@ static inline void timespec_add_ns(struct timespec *a, u64 ns)
+@@ -173,6 +173,10 @@ static inline void timespec_add_ns(struct timespec *a, u64 ns)
  {
 	ns += a->tv_nsec;
 	while(unlikely(ns >= NSEC_PER_SEC)) {
 +		/* The following asm() prevents the compiler from
 +		 * optimising this loop into a modulo operation.  */
 +		asm("" : "+r"(ns));
-+
++		
 		ns -= NSEC_PER_SEC;
 		a->tv_sec++;
 	}
+
diff --git a/recipes/linux/em-x270-2.6.23/defconfig b/recipes/linux/linux-2.6.23/em-x270/defconfig
similarity index 100%
rename from recipes/linux/em-x270-2.6.23/defconfig
rename to recipes/linux/linux-2.6.23/em-x270/defconfig
diff --git a/recipes/linux/em-x270-2.6.23/em-x270.patch b/recipes/linux/linux-2.6.23/em-x270/em-x270.patch
similarity index 100%
rename from recipes/linux/em-x270-2.6.23/em-x270.patch
rename to recipes/linux/linux-2.6.23/em-x270/em-x270.patch
diff --git a/recipes/linux/linux_2.6.23.bb b/recipes/linux/linux_2.6.23.bb
index 76ebbbe..0f62a1c 100644
--- a/recipes/linux/linux_2.6.23.bb
+++ b/recipes/linux/linux_2.6.23.bb
@@ -28,6 +28,9 @@ SRC_URI_avr32 = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.23.tar.bz2
                  file://defconfig \
                  http://avr32linux.org/twiki/pub/Main/LinuxPatches/linux-2.6.23.atmel.3.patch.bz2;patch=1 \
                 "
+SRC_URI_append_em-x270 = "\
+	file://em-x270.patch;patch=1 \
+	file://01-prevent_loop_timespec_add_ns.patch;patch=1"
 
 SRC_URI_append_cm-x270 = "\
 	file://0001-cm-x270-base2.patch;patch=1 \
-- 
1.6.0.4



