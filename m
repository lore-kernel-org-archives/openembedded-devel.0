Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M6N2p-00041T-L6
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 12:59:39 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 3C12B68470;
	Tue, 19 May 2009 14:52:07 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 May 2009 14:52:07 +0400
Message-Id: <1242730327-13692-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <20090519034417.GM23842@smtp.west.cox.net>
References: <20090519034417.GM23842@smtp.west.cox.net>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH] (e)glibc.inc: add minimal sane kernel versions
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
X-List-Received-Date: Tue, 19 May 2009 10:59:39 -0000

(e)glibc is configured for OLDEST_KERNEL, certain target architectures have
specific requirements for kernel versions, if that are not satisfied (e)glibc
reconfigures itself with what it think more appropriate and warns user that
there is misconfiguration on his side.

Add minimal sane kernel versions for architectures requiring that.
---
 conf/distro/include/eglibc.inc |    9 +++++++++
 conf/distro/include/glibc.inc  |    9 +++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/eglibc.inc b/conf/distro/include/eglibc.inc
index 0d2087e..7901949 100644
--- a/conf/distro/include/eglibc.inc
+++ b/conf/distro/include/eglibc.inc
@@ -7,3 +7,12 @@ PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
 PREFERRED_PROVIDER_virtual/libc = "eglibc"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "eglibc-initial"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "eglibc"
+
+# These are minimal sane kernel versions for targets that woudln't work with
+# default 2.4.0
+
+# ARM OABI is fine with 2.4.0, EABI is not, so we override on "-gnueabi"
+# TARGET_OS here, not on architecture
+OLDEST_KERNEL_linux-gnueabi ?= "2.6.16"
+OLDEST_KERNEL_sparc64 ?= "2.4.21"
+OLDEST_KERNEL_ppc64 ?= "2.4.21"
diff --git a/conf/distro/include/glibc.inc b/conf/distro/include/glibc.inc
index f9140ff..25f98ce 100644
--- a/conf/distro/include/glibc.inc
+++ b/conf/distro/include/glibc.inc
@@ -7,3 +7,12 @@ PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
 PREFERRED_PROVIDER_virtual/libc = "glibc"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "glibc-initial"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
+
+# These are minimal sane kernel versions for targets that woudln't work with
+# default 2.4.0
+
+# ARM OABI is fine with 2.4.0, EABI is not, so we override on "-gnueabi"
+# TARGET_OS here, not on architecture
+OLDEST_KERNEL_linux-gnueabi ?= "2.6.14"
+OLDEST_KERNEL_sparc64 ?= "2.4.21"
+OLDEST_KERNEL_ppc64 ?= "2.4.21"
-- 
1.6.3.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



