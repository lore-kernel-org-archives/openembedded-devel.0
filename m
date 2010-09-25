Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzdvT-0006vg-M8
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:13:07 +0200
Received: by pxi11 with SMTP id 11so1118066pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=wQhIsT+48hukiwMbxVWOT7cBWkd9LwlrlPjBAbwQ6yI=;
	b=i8O+vZqTI8norcc4vkdqYvueqvhdUl0Qjzw+7JgLfx7mcRg2fCRMcupW0fmiVrJNl5
	8sgQ+eGj4SmfgBFTsJw3ZCaxQlINK6/BivqcAHfLvngB0pN8nzP23ACFBzv60dWI2vsM
	8s29VyDA+0Hd8oadgSNoVLDsgY7ea6sy8KO+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=oqOSg8dv5D86+w+cTRJC1TKX6G6YbtzcPgAkzsaA6uCsZnBxIm7uYECxX9HeuILwsu
	P8UUkqg7EnsvudhMGiMlfceNeDNvkfX2u09O9dXYhqpr4TPpv3+FAbERcZiz23k8ZpVk
	qV6mxEG2vo7uleGbFfqP7sAZ+5MJ2eOqvxU5U=
Received: by 10.114.39.18 with SMTP id m18mr5898367wam.196.1285456374463;
	Sat, 25 Sep 2010 16:12:54 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm6791851wak.23.2010.09.25.16.12.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:12:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:12:27 -0700
Message-Id: <1285456353-27457-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 06/12] conf/machine: Add qemumips64 machine configuration and tune file.
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
X-List-Received-Date: Sat, 25 Sep 2010 23:13:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/machine/include/tune-mips64.inc |    2 ++
 conf/machine/qemumips64.conf         |   15 +++++++++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/include/tune-mips64.inc
 create mode 100644 conf/machine/qemumips64.conf

diff --git a/conf/machine/include/tune-mips64.inc b/conf/machine/include/tune-mips64.inc
new file mode 100644
index 0000000..8fddf89
--- /dev/null
+++ b/conf/machine/include/tune-mips64.inc
@@ -0,0 +1,2 @@
+# eglibc needs this flag to default to 64bit otherwise it chooses N32 ABI
+TARGET_CC_ARCH = "-mabi=64"
diff --git a/conf/machine/qemumips64.conf b/conf/machine/qemumips64.conf
new file mode 100644
index 0000000..3327b01
--- /dev/null
+++ b/conf/machine/qemumips64.conf
@@ -0,0 +1,15 @@
+#@TYPE: Machine
+#@NAME: qemu MIPS (big-endian) Emulator setup
+#@DESCRIPTION: Machine configuration for running an MIPS64 platform system under qemu emulation 
+
+TARGET_ARCH = "mips64"
+FEED_ARCH = "${TARGET_ARCH}"
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-mips64.inc
+
+KERNEL_IMAGETYPE = "vmlinux"
+KERNEL_OUTPUT = "vmlinux"
+SERIAL_CONSOLE = "115200 ttyS0"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
-- 
1.7.0.4



