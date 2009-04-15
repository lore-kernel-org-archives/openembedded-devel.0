Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu4Pu-0008H6-N5
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 14:41:07 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 89C9D683CA;
	Wed, 15 Apr 2009 16:36:00 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Apr 2009 16:35:50 +0400
Message-Id: <1239798960-3586-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <200904151633.49146.khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 01/11] Add x86_64-generic machine
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
X-List-Received-Date: Wed, 15 Apr 2009 12:41:34 -0000

---
 conf/machine/include/tune-x86_64.conf |    7 +++++++
 conf/machine/x86_64-generic.conf      |   14 ++++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/include/tune-x86_64.conf
 create mode 100644 conf/machine/x86_64-generic.conf

diff --git a/conf/machine/include/tune-x86_64.conf b/conf/machine/include/tune-x86_64.conf
new file mode 100644
index 0000000..528d1b1
--- /dev/null
+++ b/conf/machine/include/tune-x86_64.conf
@@ -0,0 +1,7 @@
+ARCH_MULTILIB = "i686"
+LIB_MULTILIB = "lib32"
+CFLAGS_MULTILIB = "-march=i686 -m32"
+TARGET_SYS_MULTILIB = "${ARCH_MULTILIB}${TARGET_VENDOR}-${TARGET_OS}"
+
+base_multilibdir = "${layout_base_prefix}/${LIB_MULTILIB}"
+multilibdir = "${layout_exec_prefix}/${LIB_MULTILIB}"
diff --git a/conf/machine/x86_64-generic.conf b/conf/machine/x86_64-generic.conf
new file mode 100644
index 0000000..2e2bbf5
--- /dev/null
+++ b/conf/machine/x86_64-generic.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: x86_64-generic
+#@DESCRIPTION: Machine configuration for a Linux running on x86_64 compatible machines
+
+TARGET_ARCH = "x86_64"
+# reuse .bb for "normal" x86
+PREFERRED_PROVIDER_virtual/kernel = "linux-x86"
+
+udevdir = "/dev"
+OLDEST_KERNEL = "2.6.17"
+GLIBC_ADDONS = "nptl"
+GLIBC_EXTRA_OECONF = "--with-tls"
+MACHINE_FEATURES = "kernel26 screen keyboard pci usbhost acpi ext2 multilib"
+require conf/machine/include/tune-x86_64.conf
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



