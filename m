Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QAWXN-0004YM-6a
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 02:05:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 19BAF3150234
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 02:03:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id D9I8bjSYTwOC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 02:03:05 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id E75683150231
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 02:03:03 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 15 Apr 2011 00:03:03 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Apr 2011 00:03:02 +0000
Message-Id: <1302825782-17120-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1302825782-17120-1-git-send-email-obi@opendreambox.org>
References: <1302825782-17120-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/2] kernel.bbclass: pass AR, NM and OBJCOPY to make
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
X-List-Received-Date: Fri, 15 Apr 2011 00:05:25 -0000

- Fixes build with certain vendor-supplied Montavista kernels.
- Pass the same set of variables to every invocation of make.
- Create KERNEL_*SUFFIX, TARGET_*_KERNEL_ARCH and HOST_*_KERNEL_ARCH
  for the three variables, analogue to LD.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 classes/kernel.bbclass |   28 ++++++++++++++++++++++++----
 1 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index bded15d..b97b725 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -41,19 +41,39 @@ KERNEL_PRIORITY = "${@bb.data.getVar('PV',d,1).split('-')[0].split('.')[-1]}"
 
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
+KERNEL_ARSUFFIX ?= ""
 KERNEL_CCSUFFIX ?= ""
 KERNEL_LDSUFFIX ?= ""
+KERNEL_NMSUFFIX ?= ""
+KERNEL_OBJCOPYSUFFIX ?= ""
 
 # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
 # specific options necessary for building the kernel and modules.
 #FIXME: should be this: TARGET_CC_KERNEL_ARCH ?= "${TARGET_CC_ARCH}"
+TARGET_AR_KERNEL_ARCH ?= ""
+HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 TARGET_CC_KERNEL_ARCH ?= ""
 HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
 TARGET_LD_KERNEL_ARCH ?= ""
 HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
+TARGET_NM_KERNEL_ARCH ?= ""
+HOST_NM_KERNEL_ARCH ?= "${TARGET_NM_KERNEL_ARCH}"
+TARGET_OBJCOPY_KERNEL_ARCH ?= ""
+HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
+KERNEL_AR = "${AR}${KERNEL_ARSUFFIX} ${HOST_AR_KERNEL_ARCH}"
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}"
 KERNEL_LD = "${LD}${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
+KERNEL_NM = "${NM}${KERNEL_NMSUFFIX} ${HOST_NM_KERNEL_ARCH}"
+KERNEL_OBJCOPY = "${OBJCOPY}${KERNEL_OBJCOPYSUFFIX} ${HOST_OBJCOPY_KERNEL_ARCH}"
+
+KERNEL_EXTRA_OEMAKE = " \
+	AR='${KERNEL_AR}' \
+	CC='${KERNEL_CC}' \
+	LD='${KERNEL_LD}' \
+	NM='${KERNEL_NM}' \
+	OBJCOPY='${KERNEL_OBJCOPY}' \
+"
 
 # Where built kernel lies in the kernel tree
 KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
@@ -82,17 +102,17 @@ EXTRA_OEMAKE = ""
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+	oe_runmake include/linux/version.h ${KERNEL_EXTRA_OEMAKE}
 	if [ "${KERNEL_MAJOR_VERSION}" != "2.6" ]; then
-		oe_runmake dep CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+		oe_runmake dep ${KERNEL_EXTRA_OEMAKE}
 	fi
-	oe_runmake ${KERNEL_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+	oe_runmake ${KERNEL_IMAGETYPE} ${KERNEL_EXTRA_OEMAKE}
 }
 
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+		oe_runmake modules ${KERNEL_EXTRA_OEMAKE}
 	else
 		oenote "no modules to compile"
 	fi
-- 
1.7.2.5



