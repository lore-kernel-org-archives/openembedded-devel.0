Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U3ZSx-0007Mz-AB
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Feb 2013 22:57:21 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4300BD22EB;
	Thu,  7 Feb 2013 11:51:26 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2013 11:51:00 +0100
Message-Id: <1360234263-18278-6-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 5/8] libunwind: add 1.1 with preliminary aarch64 patch
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
X-List-Received-Date: Thu, 07 Feb 2013 21:57:26 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/libunwind/files/aarch64.patch | 19 +++++++++++++++++++
 meta-oe/recipes-support/libunwind/libunwind.inc       | 12 ++++++++++++
 meta-oe/recipes-support/libunwind/libunwind_1.1.bb    |  6 ++++++
 3 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/libunwind/files/aarch64.patch
 create mode 100644 meta-oe/recipes-support/libunwind/libunwind.inc
 create mode 100644 meta-oe/recipes-support/libunwind/libunwind_1.1.bb

diff --git a/meta-oe/recipes-support/libunwind/files/aarch64.patch b/meta-oe/recipes-support/libunwind/files/aarch64.patch
new file mode 100644
index 0000000..9ea8d83
--- /dev/null
+++ b/meta-oe/recipes-support/libunwind/files/aarch64.patch
@@ -0,0 +1,19 @@
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- libunwind-1.1.orig/configure.ac
++++ libunwind-1.1/configure.ac
+@@ -135,11 +135,11 @@ AM_CONDITIONAL(OS_HPUX, expr x$target_os
+ AM_CONDITIONAL(OS_FREEBSD, expr x$target_os : xfreebsd >/dev/null)
+ 
+ AC_MSG_CHECKING([for ELF helper width])
+ case "${target_arch}" in
+ (arm|hppa|ppc32|x86|sh) use_elf32=yes; AC_MSG_RESULT([32]);;
+-(ia64|ppc64|x86_64)    use_elf64=yes; AC_MSG_RESULT([64]);;
++(ia64|ppc64|x86_64|aarch64)    use_elf64=yes; AC_MSG_RESULT([64]);;
+ (mips)                 use_elfxx=yes; AC_MSG_RESULT([xx]);;
+ *)                     AC_MSG_ERROR([Unknown ELF target: ${target_arch}])
+ esac
+ AM_CONDITIONAL(USE_ELF32, [test x$use_elf32 = xyes])
+ AM_CONDITIONAL(USE_ELF64, [test x$use_elf64 = xyes])
diff --git a/meta-oe/recipes-support/libunwind/libunwind.inc b/meta-oe/recipes-support/libunwind/libunwind.inc
new file mode 100644
index 0000000..f028766
--- /dev/null
+++ b/meta-oe/recipes-support/libunwind/libunwind.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "a portable and efficient C programming interface (API) to determine the call-chain of a program"
+HOMEPAGE = "http://www.nongnu.org/libunwind"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
+
+SRC_URI = "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
+
+inherit autotools
+
+EXTRA_OECONF_arm = "--enable-debug-frame"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
new file mode 100644
index 0000000..dd6b63c
--- /dev/null
+++ b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
@@ -0,0 +1,6 @@
+require libunwind.inc
+
+SRC_URI += "file://aarch64.patch"
+
+SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
+SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
-- 
1.8.0



