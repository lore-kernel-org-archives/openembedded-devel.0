Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQo27-00039A-57
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 00:00:27 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2550305fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 14:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=bIQyIHINhxaLsk3VQZT9uDiVZpryss20rHavnJ86zMs=;
	b=mx061hIdT73ulM1qRYPaQUOX3535mmZiNfeoekORxOKmlz+PBDo7D29ynRfeJyzn5X
	EruE9TOq/8zvoyUEen2hqtsv0mdtqy0J4sVrQdzt9yIuoFyeKff+DjNbrPt0Z8IJqrx+
	fc5EwQ3grLZBpgF3TM4Qv7qifKCuzt2xk9VRE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bJzxCuiIn3shH11DDPTNnd4BaFH6DxcNQJb6KiFSipE2dwbKROCHlvkIZ8EMLxcYKG
	VbYLsx8dOFao/Lgyl4f20rTjf2BQ7X+8yJuTBk1ybvoIfGeRjQPlA4p4s0jzFZx9ju7F
	hXOUjnhHjECYfsb0AYN9eGli0nX958mNNK/3s=
Received: by 10.223.40.85 with SMTP id j21mr4851713fae.22.1306706241967;
	Sun, 29 May 2011 14:57:21 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id l26sm526869fam.21.2011.05.29.14.57.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 14:57:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 23:56:34 +0200
Message-Id: <1323a6d7b580bb3a75ff14fd752fca88886323f7.1306706130.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306706130.git.Martin.Jansa@gmail.com>
References: <cover.1306706130.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/14] pxaregs: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 22:00:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/pxaregs/pxaregs-1.14/Makefile  |    3 ++
 .../recipes-support/pxaregs/pxaregs-1.14/i2c.patch |   15 ++++++++++++
 .../pxaregs/pxaregs-1.14/munmap.patch              |   22 +++++++++++++++++
 .../pxaregs/pxaregs-1.14/serial.patch              |   14 +++++++++++
 .../recipes-support/pxaregs/pxaregs-1.14/usb.patch |   17 +++++++++++++
 meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb    |   25 ++++++++++++++++++++
 6 files changed, 96 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/Makefile
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/i2c.patch
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/munmap.patch
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/serial.patch
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/usb.patch
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb

diff --git a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/Makefile b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/Makefile
new file mode 100644
index 0000000..00b7d52
--- /dev/null
+++ b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/Makefile
@@ -0,0 +1,3 @@
+
+
+all: pxaregs
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/i2c.patch b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/i2c.patch
new file mode 100644
index 0000000..36983ec
--- /dev/null
+++ b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/i2c.patch
@@ -0,0 +1,15 @@
+Index: pxaregs-1.14/pxaregs.c
+===================================================================
+--- pxaregs-1.14.orig/pxaregs.c
++++ pxaregs-1.14/pxaregs.c
+@@ -21,10 +21,6 @@
+ #include <fcntl.h>
+ #include <ctype.h>
+ 
+-#include <linux/i2c.h>
+-#include <linux/i2c-dev.h>
+-
+-
+ // fd for /dev/mem
+ static int fd = -1;
+ 
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/munmap.patch b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/munmap.patch
new file mode 100644
index 0000000..a9c4b95
--- /dev/null
+++ b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/munmap.patch
@@ -0,0 +1,22 @@
+Index: pxaregs-1.14/pxaregs.c
+===================================================================
+--- pxaregs-1.14.orig/pxaregs.c
++++ pxaregs-1.14/pxaregs.c
+@@ -1794,7 +1794,7 @@ static int getmem(u32 addr)
+    regaddr = map + (addr & MAP_MASK);
+ 
+    val = *(u32*) regaddr;
+-   munmap(0,MAP_SIZE);
++   munmap(map,MAP_SIZE);
+ 
+    return val;
+ }
+@@ -1829,7 +1829,7 @@ static void putmem(u32 addr, u32 val)
+    regaddr = map + (addr & MAP_MASK);
+ 
+    *(u32*) regaddr = val;
+-   munmap(0,MAP_SIZE);
++   munmap(map,MAP_SIZE);
+ }
+ 
+ static u32 lastaddr = 0;
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/serial.patch b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/serial.patch
new file mode 100644
index 0000000..0685385
--- /dev/null
+++ b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/serial.patch
@@ -0,0 +1,14 @@
+Index: pxaregs-1.14/pxaregs.c
+===================================================================
+--- pxaregs-1.14.orig/pxaregs.c
++++ pxaregs-1.14/pxaregs.c
+@@ -78,6 +78,9 @@ static struct reg_info regs[] = {
+ { "ISAR",      0x403016A0,  0, 0xffffffff, 'x', "I2C Slave Address Register" },
+ { "ISAR_SA",   0x403016A0,  0, 0x0000007f, 'x', "I2C Slave Address" },
+ 
++{ "HW_MCR",    0x41600010,  0, 0xffffffff, 'x', "HWUART Modem Control Register" },
++{ "HW_MSR",    0x41600018,  0, 0xffffffff, 'x', "HWUART Modem Status Register" },
++
+ { "PMCR",      0x40F00000,  0, 0xffffffff, 'x', "Power Manager Control Register (3-23)" },
+ { "PMCR_IDAE", 0x40F00000,  0, 0x00000001, 'd', "PM imprecise data abort abort signal" },
+ 
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/usb.patch b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/usb.patch
new file mode 100644
index 0000000..59f21fe
--- /dev/null
+++ b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/usb.patch
@@ -0,0 +1,17 @@
+Index: pxaregs-1.14/pxaregs.c
+===================================================================
+--- pxaregs-1.14.orig/pxaregs.c
++++ pxaregs-1.14/pxaregs.c
+@@ -78,6 +78,12 @@ static struct reg_info regs[] = {
+ { "ISAR",      0x403016A0,  0, 0xffffffff, 'x', "I2C Slave Address Register" },
+ { "ISAR_SA",   0x403016A0,  0, 0x0000007f, 'x', "I2C Slave Address" },
+ 
++{ "UP2OCR",    0x40600020,  0, 0xffffffff, 'x', "USB Port 2 Output Control Register" },
++{ "UP2OCR_SEOS", 0x40600020, 24, 7, 'x', "USB Port 2 Single-Ended Output Select" },
++{ "UP2OCR_HXOE", 0x40600020, 17, 1, 'x', "USB Port 2 Tranceiver OE" },
++{ "UP2OCR_HXS",  0x40600020, 16, 1, 'x', "USB Port 2 Tranceiver Output Select" },
++{ "UP2OCR_IDON", 0x40600020, 10, 1, 'x', "OTG ID Read Enable" },
++
+ { "HW_MCR",    0x41600010,  0, 0xffffffff, 'x', "HWUART Modem Control Register" },
+ { "HW_MSR",    0x41600018,  0, 0xffffffff, 'x', "HWUART Modem Status Register" },
+ 
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
new file mode 100644
index 0000000..d5a5b4b
--- /dev/null
+++ b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Tool to display and modify PXA registers at runtime"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://pxaregs.c;endline=12;md5=2cb6b33300eacdec4d7299bc42533740"
+AUTHOR = "Holger Schurig <hs4233@mail.mn-solutions.de>"
+HOMEPAGE = "http://www.mn-logistik.de/unsupported/pxa250/"
+
+SRC_URI = "http://www.mn-logistik.de/unsupported/pxa250/pxaregs.c \
+           file://i2c.patch \
+           file://munmap.patch \
+           file://serial.patch \
+           file://usb.patch "
+
+S = "${WORKDIR}"
+
+do_compile() {
+    ${CC} pxaregs.c -o pxaregs ${CFLAGS} ${LDFLAGS}
+}
+
+do_install() {
+	install -d ${D}${sbindir}/
+	install -m 0755 pxaregs ${D}${sbindir}/
+}
+
+SRC_URI[md5sum] = "a43baa88842cd5926dbffb6fb87624f6"
+SRC_URI[sha256sum] = "f339b91cd8ab348052c36b36d20033e4bffc3666bc836ff72d5704f025e1c057"
-- 
1.7.5.rc3



