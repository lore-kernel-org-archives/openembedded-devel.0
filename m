Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LStBn-0005VW-Cb
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jan 2009 14:13:43 +0100
Received: by an-out-0708.google.com with SMTP id d40so216440and.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 05:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=RbNd2T/WeIdqkB3x5mwoLRVsURtvRf3XPkVJ4oBYAOQ=;
	b=dkgJ+zjNVeNKoSeYt5k04xUI9q5OIzUhziuOzhGEPGrJTlqmInkyheRslMPS/ofqLV
	+qUu1NONc4Zx/PAoZ6rjAnT0lvc1obVZQqlwsyWL+XSD/UZPmpa9RJrGNwUUEpCdQb2m
	a8T0IXRvXdnyxT2Dezduh8bW8M0qigYotIsB0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=d9h01DeUhVQ5DjNrXFi5ogZSa91midWEi5QqNbgHUqfFpdq4xto6JqOY9/EkwEij2B
	uDhfuLiQmmRS8r8+FVvwiP03Avo788tkQln0s4En8TOHfkSeecwoqoSahLoXufeuDunr
	KqtHX5/C53xPgeW0qR7+B59qhaxIN3udTQFJ0=
Received: by 10.100.168.18 with SMTP id q18mr368705ane.7.1233320757780;
	Fri, 30 Jan 2009 05:05:57 -0800 (PST)
Received: from ?10.6.9.10? (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id b7sm892338ana.19.2009.01.30.05.05.55
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jan 2009 05:05:57 -0800 (PST)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jan 2009 15:05:53 +0200
Message-Id: <1233320753.14101.1.camel@EPBYMINW0568>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: [PATCH] Reworked stb225 machine configuration file; build uImage for stb225.
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
X-List-Received-Date: Fri, 30 Jan 2009 13:13:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Reworked stb225 machine configuration file; build uImage for stb225.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 conf/machine/include/tune-mips32.inc            |    1 +
 conf/machine/stb225.conf                        |   16 +++++++++++-----
 packages/linux/linux-2.6.28/stb225/uImage.patch |   23 +++++++++++++++++++++++
 packages/linux/linux_2.6.28.bb                  |    3 ++-
 4 files changed, 37 insertions(+), 6 deletions(-)
 create mode 100644 conf/machine/include/tune-mips32.inc
 create mode 100644 packages/linux/linux-2.6.28/stb225/uImage.patch

diff --git a/conf/machine/include/tune-mips32.inc b/conf/machine/include/tune-mips32.inc
new file mode 100644
index 0000000..93da66b
--- /dev/null
+++ b/conf/machine/include/tune-mips32.inc
@@ -0,0 +1 @@
+TARGET_CC_ARCH = "-march=mips32"
diff --git a/conf/machine/stb225.conf b/conf/machine/stb225.conf
index 97370e1..c57adb0 100644
--- a/conf/machine/stb225.conf
+++ b/conf/machine/stb225.conf
@@ -1,8 +1,14 @@
 # PNX8335 STB225 board
+
 TARGET_ARCH = "mipsel"
-TARGET_CC_ARCH="-march=mips32"
+
 MACHINE_FEATURES = "kernel26"
-IMAGE_FSTYPES="tar.gz"
-PREFERRED_PROVIDER_virtual/kernel="linux"
-KERNEL_IMAGETYPE="vmlinux"
-KERNEL_OUTPUT="${KERNEL_IMAGETYPE}"
+
+IMAGE_FSTYPES += "tar.gz"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+KERNEL_IMAGETYPE = "uImage"
+
+SERIAL_CONSOLE ?= "115200 ttySA0"
+
+require conf/machine/include/tune-mips32.inc
diff --git a/packages/linux/linux-2.6.28/stb225/uImage.patch b/packages/linux/linux-2.6.28/stb225/uImage.patch
new file mode 100644
index 0000000..f43a221
--- /dev/null
+++ b/packages/linux/linux-2.6.28/stb225/uImage.patch
@@ -0,0 +1,23 @@
+diff -urN linux-2.6.28.orig/arch/mips/Makefile linux-2.6.28/arch/mips/Makefile
+--- linux-2.6.28.orig/arch/mips/Makefile	2009-01-28 16:12:23.000000000 +0200
++++ linux-2.6.28/arch/mips/Makefile	2009-01-28 16:13:54.000000000 +0200
+@@ -682,6 +682,19 @@
+ 
+ all:	$(all-y)
+ 
++# Support for U-Boot image creation (from U-Boot README)
++uImage: vmlinux
++	$(OBJCOPY) -O binary -R .note -R .comment -S vmlinux vmlinux.bin
++	rm -f vmlinux.bin.gz
++	gzip -9 vmlinux.bin
++	LA=`$(OBJDUMP) -p vmlinux | sed -n 's/LOAD.*vaddr \([^ ]*\).*/\1/p'`; \
++	EN=`$(OBJDUMP) -f vmlinux | sed -n 's/.*start address \([^ ]*\).*/\1/p'`; \
++	echo $$LA; \
++	echo $$EN; \
++	mkimage -A mips -O linux -T kernel -C gzip \
++		-a $$LA -e $$EN -n "Linux Kernel Image" \
++		-d vmlinux.bin.gz uImage
++
+ vmlinux.bin: $(vmlinux-32)
+ 	+@$(call makeboot,$@)
+ 
diff --git a/packages/linux/linux_2.6.28.bb b/packages/linux/linux_2.6.28.bb
index b042a45..ea88f71 100644
--- a/packages/linux/linux_2.6.28.bb
+++ b/packages/linux/linux_2.6.28.bb
@@ -16,6 +16,7 @@ SRC_URI_append_at91sam9263ek = " \
 	   file://linux-2.6.28-exp.patch.bz2;patch=1 "
 
 SRC_URI_append_stb225 = " \
+           file://uImage.patch;patch=1 \
            file://ebase-fix.patch;patch=1 \
            file://enable-uart.patch;patch=1 \
-	   file://ip3902.patch;patch=1 "
+           file://ip3902.patch;patch=1"
-- 
1.5.6.3




