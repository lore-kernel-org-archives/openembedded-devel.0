Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsI-0000ZJ-Hj
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:45 +0100
Received: by ewy24 with SMTP id 24so4866242ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Whwywnv4SUyiGBuOL1B6ZlfegjrtciQeTBdcggUEFOQ=;
	b=uwVGZszfgnLzTFkQcwX61iQ4IDiB19sC9k1jLntiF4jk8SrQIFha5WvXyG6nbDSv83
	CsLDQH9Dm2aj1wZodkuZA/z1OaF3IqKb+9XxqDbyXX7R2IglUiJpD/fjzmZ+ZUgzjYvh
	f90uZO+1XDAoN6wzZa+Ni1qrr0gZTOZDo6D+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nMLnJwn8tfLzJB1WgexEhn9hbaFRXDtccpf4JJoVRrJvO+HfY8/9MIYvI5IWIPXkbe
	AbScqCmDfAiwSlyAV9mdfw3bTr5Com2SVg3MMJFj5ICJiqAbRJGrLy8/plqjdpN54Z6t
	Z3N6xnUkzBVZQ527d5y7QKdn4NO+mlDNM4CKA=
Received: by 10.213.23.201 with SMTP id s9mr6231344ebb.5.1260139503388;
	Sun, 06 Dec 2009 14:45:03 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:03 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:37 +0100
Message-Id: <1260139496-21442-2-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>,
	Walter Goossens <walter.goossens@axon.tv>
Subject: [PATCH] nios2.conf: New architecture nios2.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:46:45 -0000

From: Walter Goossens <walter.goossens@axon.tv>

These adds nios2 to the machine configuration includes.

Tested-by: Leon Woestenberg <leon@sidebranch.com>
Tested-by: Walter Goossens <walter.goossens@axon.tv>
Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 conf/machine/include/nios2.inc |   42 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/include/nios2.inc

diff --git a/conf/machine/include/nios2.inc b/conf/machine/include/nios2.inc
new file mode 100644
index 0000000..f5263a6
--- /dev/null
+++ b/conf/machine/include/nios2.inc
@@ -0,0 +1,42 @@
+#@TYPE: Machine configuration
+#@NAME: nios2
+#@DESCRIPTION: generic machine configuration for nios2 (non-mmu) platforms
+
+# Set default for common nios2-based machines
+MACHINE_FEATURES ?= "kernel26 usbhost pci"
+SHARED_LIBRARIES = "no"
+
+TARGET_LDFLAGS_append = " -Wl,-elf2flt"
+
+# Select an appropriate default kernel
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-nios2"
+PREFERRED_VERSION_linux-nios2 ?= "2.6.28"
+
+# Select the nios2-specific toolchain parts
+PREFERRED_VERSION_binutils = "nios2-2.15"
+PREFERRED_VERSION_binutils-cross = "nios2-2.15"
+PREFERRED_VERSION_linux-libc-headers = "nios2-2.6.28"
+PREFERRED_VERSION_elf2flt-cross = "nios2-git"
+PREFERRED_VERSION_gcc-cross = "nios2-3.4.6"
+PREFERRED_VERSION_gcc-cross-initial = "nios2-3.4.6"
+PREFERRED_VERSION_gcc-cross-intermediate = "nios2-3.4.6"
+PREFERRED_VERSION_uclibc = "nios2-0.9.29"
+PREFERRED_VERSION_uclibc-initial = "nios2-0.9.27"
+
+# Set default for 16MB machines - can be overridden for more or less flash.
+ROOT_FLASH_SIZE ?= "12"
+
+# Allow for rootfs loaded direct from internal hard disk
+IMAGE_FSTYPES ?= "jffs2 tar.gz"
+
+# Set default
+EXTRA_IMAGECMD_jffs2 = "--pad --eraseblock=0x20000 -n"
+
+#-------------------------------------------------------------------------------
+# Board defaults
+#-------------------------------------------------------------------------------
+# These values are board specific but they seem to be common to a large number
+# of boards so are reasonable defaults.
+SERIAL_CONSOLE = "115200 ttyS0"
+KERNEL_CONSOLE = "ttyS0,115200n8"
+USE_VT = "0"
-- 
1.6.0.4



