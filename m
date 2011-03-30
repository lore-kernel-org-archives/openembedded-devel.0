Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <v2g.udel@gmail.com>) id 1Q4w5d-0001ox-Lm
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 16:09:41 +0200
Received: by vws2 with SMTP id 2so1143433vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 07:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=6j8Quq9Aa60ZUvinB4GMn3h1vi7rykFJKtItYG4fBds=;
	b=AoIYeea+N80Zcvw5+TS++370p3ZZ+kr6ioTNXk96X6qs+Sknt97rAsHG9r0wDjfyed
	kUVPGJKCY7W/hx1GAmpp5TU7iWxw9erbl/BQxYXarenEskxQw+3xt8zINN96l09TQouE
	L/4c5fZ3FqwKX252gdvtbXS/30w6FbyEE/NnU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=a5pW1l4qHL/n4m6nX9vqYGkpyJ6IqXUyiD2/Af/L3T33FnHx25wd0uClFkeDE0/sQR
	BD9izGG+UsVO0p0ukO2Nq17pDAVDoAxFn3yU3fyorcROkUMkopFsn8hPjBeLPlA7+KIA
	G8/XOCWcVIYoZJgsOsFS4nreSsAwcYEOOdPRY=
Received: by 10.220.66.15 with SMTP id l15mr345385vci.33.1301494060636;
	Wed, 30 Mar 2011 07:07:40 -0700 (PDT)
Received: from localhost.localdomain (fundoo.ceoe.udel.edu [128.175.74.10])
	by mx.google.com with ESMTPS id h34sm26893vcr.18.2011.03.30.07.07.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2011 07:07:39 -0700 (PDT)
From: UDel V2G Team <v2g.udel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 10:07:05 -0400
Message-Id: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 1/6] Add support for the Technologic Systems TS7500 ARM SBCs
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
X-List-Received-Date: Wed, 30 Mar 2011 14:09:41 -0000

* Includes conf/machine/ts75xx.conf and conf/machine/include/tune-fa526.inc
  files needed for building OE packages w/ EABI and *NO* thumb support

Signed-off-by: UDel V2G Team <v2g.udel@gmail.com>
---
 conf/machine/include/tune-fa526.inc |   22 ++++++++++++++++++++++
 conf/machine/ts75xx.conf            |   22 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100755 conf/machine/include/tune-fa526.inc
 create mode 100755 conf/machine/ts75xx.conf

diff --git a/conf/machine/include/tune-fa526.inc b/conf/machine/include/tune-fa526.inc
new file mode 100755
index 0000000..a5c5008
--- /dev/null
+++ b/conf/machine/include/tune-fa526.inc
@@ -0,0 +1,22 @@
+# This tune file is for the Faraday FA526 core is used in 
+# ARM processors like the Semi STR8132/ Cavium CNS2132, which is 
+# in the Technologic Systems TS-7500 board in addition to some 
+# NAS boxes out there.
+#
+# This core basically resembles a ARM920T but has NO thumb interworking support
+# which makes it not fully EABI compliant
+#
+# Hence, we need to diable all thumb instructions here
+# Also be sure to disable all thumb flags/features/includes in the distros 
+
+FEED_ARCH = "armv4"
+BASE_PACKAGE_ARCH = "armv4" 
+
+# Ideally we want the following CFLAGS for our architecture.
+# Angstorm will automtically add the thumb flags, so don't include them here
+# TARGET_CC_ARCH += "-march=armv4 -mno-thumb-interwork -mno-thumb -mfloat-abi=soft"
+TARGET_CC_ARCH += "-march=armv4 -mfloat-abi=soft"
+
+PACKAGE_EXTRA_ARCHS += "armv4"
+LDFLAGS += "-Xlinker --fix-v4bx -Xassembler --fix-v4bx"
+THUMB_INTERWORK = "no"
diff --git a/conf/machine/ts75xx.conf b/conf/machine/ts75xx.conf
new file mode 100755
index 0000000..d76548d
--- /dev/null
+++ b/conf/machine/ts75xx.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@Name: Technologic Systems TS-75xx SBC
+#@DESCRIPTION: Machine configuration for Technologic Systems TS-75xx SBC
+
+TARGET_ARCH = "arm"
+
+MACHINE_FEATURES = "kernel26 ext2 usbhost"
+
+# This requires cavium fa526 patch set to function
+# See the linux-ts75xx directory for the patches
+PREFERRED_PROVIDER_virtual/kernel = "linux-ts75xx"
+PREFERRED_VERSION_linux = "2.6.35"
+
+SERIAL_CONSOLE = "115200 ttyS0"
+USE_VT = "0"
+
+# Uses the traditional TS-7500 bootloader process
+# See the ts75xx-initrd-image.bb recipe for building
+# an initrd script that only uses EABI userspace utilities
+CMDLINE = "root=/dev/ram0 init=/linuxrc console=/dev/ttyS0,115200 lpj=958464"
+
+require conf/machine/include/tune-fa526.inc
-- 
1.7.3.4



