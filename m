Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1U1EPZ-00084e-Hq
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2013 12:04:08 +0100
Received: from mail33-ch1-R.bigfish.com (10.43.68.233) by
	CH1EHSOBE012.bigfish.com (10.43.70.62) with Microsoft SMTP Server id
	14.1.225.23; Fri, 1 Feb 2013 10:03:03 +0000
Received: from mail33-ch1 (localhost [127.0.0.1])	by mail33-ch1-R.bigfish.com
	(Postfix) with ESMTP id 9B8F0C021E	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2013 10:03:03 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h1155h)
Received: from mail33-ch1 (localhost.localdomain [127.0.0.1]) by mail33-ch1
	(MessageSwitch) id 1359712981748455_4929;
	Fri,  1 Feb 2013 10:03:01 +0000 (UTC)
Received: from CH1EHSMHS028.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.242])	by mail33-ch1.bigfish.com (Postfix) with ESMTP id
	AE4121C0049 for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2013 10:03:01 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS028.bigfish.com
	(10.43.70.28) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 1 Feb 2013 10:03:01 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 1 Feb 2013 10:03:00 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r11A2o9b030747;	Fri, 1 Feb 2013 03:02:58 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Feb 2013 18:02:47 +0800
Message-ID: <1359712968-22554-4-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1359712968-22554-1-git-send-email-b28495@freescale.com>
References: <1359712968-22554-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: [meta-java][for denzil] 3/4] Revert "llvm: use spaces for python functions"
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
X-List-Received-Date: Fri, 01 Feb 2013 11:04:32 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

This reverts commit 8e11ccd8a46abcf46fe3854d40ead208b5605b53.

Conflicts:

	recipes-core/llvm/llvm.inc
---
 recipes-core/llvm/llvm.inc |   65 ++++++++++++++++++++++---------------------
 1 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
index 65d36c5..b71018e 100644
--- a/recipes-core/llvm/llvm.inc
+++ b/recipes-core/llvm/llvm.inc
@@ -86,8 +86,9 @@ PACKAGES_virtclass-native = ""
 PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
-    libllvm_libdir = bb.data.expand('${libdir}/llvm${LLVM_RELEASE}', d)
-    do_split_packages(d, libllvm_libdir, '^lib(.*)\.so$', 'libllvm-%s', 'Split package for %s', allow_dirs=True)
+        libllvm_libdir = bb.data.expand('${libdir}/llvm${LLVM_RELEASE}', d)
+
+        do_split_packages(d, libllvm_libdir, '^lib(.*)\.so$', 'libllvm-%s', 'Split package for %s', allow_dirs=True)
 }
 
 FILES_${PN} = ""
@@ -104,25 +105,25 @@ FILES_${PN}-dev = " \
                  "
 
 do_install() {
-    # Install into a private directory to be able to reorganize the files.
+	# Install into a private directory to be able to reorganize the files.
 
-    cd ${OECMAKE_BUILDPATH}
+        cd ${OECMAKE_BUILDPATH}
 
-    oe_runmake DESTDIR=${WORKDIR}/llvm-install install
+        oe_runmake DESTDIR=${WORKDIR}/llvm-install install
 
-    # Create our custom target directories
-    install -d ${D}${bindir}/llvm${LLVM_RELEASE}
-    install -d ${D}${includedir}/llvm${LLVM_RELEASE}
-    install -d ${D}${libdir}/llvm${LLVM_RELEASE}
+	# Create our custom target directories
+	install -d ${D}${bindir}/llvm${LLVM_RELEASE}
+	install -d ${D}${includedir}/llvm${LLVM_RELEASE}
+	install -d ${D}${libdir}/llvm${LLVM_RELEASE}
 
-    #	Move headers into their own directory
-    cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm \
-    ${D}${includedir}/llvm${LLVM_RELEASE}/
-    cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \
-    ${D}${includedir}/llvm${LLVM_RELEASE}/
+	#	Move headers into their own directory
+	cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm \
+	${D}${includedir}/llvm${LLVM_RELEASE}/
+	cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \
+	${D}${includedir}/llvm${LLVM_RELEASE}/
 
-    find ${WORKDIR}/llvm-install/${prefix}/lib -name "*" -maxdepth 1 -exec \
-    install {} ${D}${libdir}/llvm${LLVM_RELEASE} \;
+	find ${WORKDIR}/llvm-install/${prefix}/lib -name "*" -maxdepth 1 -exec \
+	install {} ${D}${libdir}/llvm${LLVM_RELEASE} \;
 
 	#	I dont know another way out. Binaries are installed into a special subdir
 	find ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1 -exec \
@@ -148,7 +149,7 @@ do_install() {
         install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
         install -m 0755 bin/llvm-config${LLVM_RELEASE} ${SYSROOT_DESTDIR}${bindir_crossscripts}
 }
-
+ 
 do_install_virtclass-native() {
 	# Install into a private directory to be able to reorganize the files.
 
@@ -194,21 +195,21 @@ do_install_virtclass-native() {
 # Retrieve the target in a way that is compatible to the arch
 # value in llvm (>= 2.5)
 def get_llvm_arch(d):
-    import bb;
-
-    arch = bb.data.getVar('TARGET_ARCH', d, 1)
-    if arch == "x86_64" or arch == "i486" or arch == "i586" or arch == "i686":
-        arch = "X86"
-    elif arch == "arm":
-        arch = "ARM"
-    elif arch == "mipsel" or arch == "mips":
-        arch = "mips"
-    elif arch == "powerpc" or arch == "powerpc64":
-        arch = "PowerPC"
-    else:
-        bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
-
-    return arch
+  import bb;
+
+  arch = bb.data.getVar('TARGET_ARCH', d, 1)
+  if arch == "x86_64" or arch == "i486" or arch == "i586" or arch == "i686":
+    arch = "X86"
+  elif arch == "arm":
+    arch = "ARM"
+  elif arch == "mipsel" or arch == "mips":
+    arch = "mips"
+  elif arch == "powerpc" or arch == "powerpc64":
+    arch = "PowerPC"
+  else:
+    bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
+
+  return arch
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.5.4




