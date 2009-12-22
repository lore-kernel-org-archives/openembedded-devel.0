Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NNDoQ-0006CY-5E
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 00:06:45 +0100
Received: by fxm8 with SMTP id 8so6282409fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 15:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=WQzw3Py00BOpilD4It2koy5NgN1Tjo+61EH7gBos9Ck=;
	b=e5r4fJdRJc4SluxnfyB9mwgEjQVQR/xzUYZC7qDwL0pmfYHHMtAdfKFq8wcFnoaTz9
	uAsrFIzxipzDCzt/cRpLgMDsoXt/86KMRiRcJzpaOLNHOir3rVs9xEJ924EoeMFscuuL
	gEKKkeiyGXehhlI6sn0wsojZ2iKpzf0hAeTVs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=kW0w0XLXpjVFLFxEs+qpJFq9lOs9Kk00aTs1mElXx0PQzckSz70nUxnZH/tByOjFmq
	3N4oYEFbrl8+BGsUMrKGWRuef2PdIYvXGyCLRi3HrsUnoLOxjtiEuuKPpuB9FWAkjK6X
	CL8lPZ+O2JXTNSwM/tSPTK21d70xj5/FDhStI=
Received: by 10.223.95.76 with SMTP id c12mr6651458fan.41.1261523090016;
	Tue, 22 Dec 2009 15:04:50 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm2422960fxm.2.2009.12.22.15.04.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Dec 2009 15:04:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Dec 2009 00:04:16 +0100
Message-Id: <1261523056-27211-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] kernel, linux-kernel-base classes: update for 2.6.33-rc1 and newer
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
X-List-Received-Date: Tue, 22 Dec 2009 23:06:46 -0000

* include/asm link was killed in
  http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=f7f16b7799ed68654850ab340ef812895aebcf4c
* utsrelease.h was moved in
  http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=273b281fa22c293963ee3e6eec418f5dda2dbc83

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/kernel.bbclass            |   19 +++++++++++++------
 classes/linux-kernel-base.bbclass |    3 +++
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index edeaa66..069dceb 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -95,13 +95,18 @@ kernel_do_compile() {
 kernel_do_compile[depends] = "${INITRAMFS_TASK}"
 
 kernel_do_stage() {
-	ASMDIR=`readlink include/asm`
+	if [ -e include/asm ] ; then
+		# This link is generated only in kernel before 2.6.33-rc1, don't stage it for newer kernels
+		ASMDIR=`readlink include/asm`
 
-	mkdir -p ${STAGING_KERNEL_DIR}/include/$ASMDIR
-	cp -fR include/$ASMDIR/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
+		mkdir -p ${STAGING_KERNEL_DIR}/include/$ASMDIR
+		cp -fR include/$ASMDIR/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
+	fi
 	# Kernel 2.6.27 moved headers from includes/asm-${ARCH} to arch/${ARCH}/include/asm	
 	if [ -e arch/${ARCH}/include/asm/ ] ; then 
-		cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
+		if [ -e include/asm ] ; then
+			cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
+		fi
 		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
 		cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/	
 
@@ -112,8 +117,10 @@ kernel_do_stage() {
 		cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
 	fi
 
-	rm -f ${STAGING_KERNEL_DIR}/include/asm
-	ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
+	if [ -e include/asm ] ; then
+		rm -f ${STAGING_KERNEL_DIR}/include/asm
+		ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
+	fi
 
 	mkdir -p ${STAGING_KERNEL_DIR}/include/asm-generic
 	cp -fR include/asm-generic/* ${STAGING_KERNEL_DIR}/include/asm-generic/
diff --git a/classes/linux-kernel-base.bbclass b/classes/linux-kernel-base.bbclass
index b3e0fda..510951a 100644
--- a/classes/linux-kernel-base.bbclass
+++ b/classes/linux-kernel-base.bbclass
@@ -4,6 +4,9 @@ def get_kernelversion(p):
 
     fn = p + '/include/linux/utsrelease.h'
     if not os.path.isfile(fn):
+        # after 2.6.33-rc1
+        fn = p + '/include/generated/utsrelease.h'
+    if not os.path.isfile(fn):
         fn = p + '/include/linux/version.h'
 
     import re
-- 
1.6.0.4



