Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qudtu-0004dh-Eq
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Aug 2011 07:15:18 +0200
Received: by yia28 with SMTP id 28so2547544yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 22:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=aknWwdoRtDv9eOwSEJOACGc4JMsObHDn7HQy4vE1r+Q=;
	b=FVrcoiASfyOktV3RXDTk2Txt7A9HugqbFa3gHpSROJDBV+7nXTLEv/nRZi4QRqxnEl
	BwKle9gdIBcQVXmHQGqW562QtA4DAs6fdrKt70/KWu4uSjvFevqRZ50CU5cflpzkWMw1
	CByRMIEMs7HyVvvhFu5egflWtUGWceuM0dVSk=
Received: by 10.151.8.17 with SMTP id l17mr194271ybi.16.1313817036802;
	Fri, 19 Aug 2011 22:10:36 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k17sm772692yba.29.2011.08.19.22.10.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 22:10:36 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Aug 2011 05:10:20 +0000
Message-Id: <286345e7b08a0a73ad6363bfcc17e422bc35f4d1.1313816970.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1313816970.git.otavio@ossystems.com.br>
References: <cover.1313816970.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1313816970.git.otavio@ossystems.com.br>
References: <cover.1313816970.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/3] kernel.bbclass: fix spacing to reduce delta between oe-core and meta-oe
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
X-List-Received-Date: Sat, 20 Aug 2011 05:15:18 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/kernel.bbclass |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 8629133..f67503a 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -19,12 +19,12 @@ python __anonymous () {
 
     image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
     if image:
-        bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
+    	bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
 
     machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
 
     if machine_kernel_pr:
-       bb.data.setVar('PR', machine_kernel_pr, d)
+    	bb.data.setVar('PR', machine_kernel_pr, d)
 }
 
 inherit kernel-arch deploy
@@ -189,11 +189,10 @@ kernel_do_configure() {
 	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
 		cp "${WORKDIR}/defconfig" "${B}/.config"
 	fi
-
-	yes '' | oe_runmake oldconfig
+        yes '' | oe_runmake oldconfig
 
 	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
-		for img in cpio.gz cpio.lzo cpio.lzma cpio.xz ; do
+		for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
 		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
 			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$img
 		fi
-- 
1.7.2.5



