Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LwYbL-0007O0-Ow
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 11:18:43 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LwYWx-0003Ar-Qw
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 13:14:11 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 13:13:33 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <1238399997-6016-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1238399997-6016-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <200904221313.34069.khimov@altell.ru>
Subject: Re: [PATCH] image.bbclass: reorder do_rootfs
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
X-List-Received-Date: Wed, 22 Apr 2009 09:18:44 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 30 March 2009 11:59:57 Roman I Khimov wrote:
> -addtask rootfs before do_build after do_install
> +addtask rootfs after do_compile before do_install

BTW, looking at kernel.bbclass again I think with this applied we can simplify
a bit INITRAMFS_IMAGE dependency with something like this (untested, not using
initramfs in this fashion, but would be interested to hear from someone using
it):

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 954c407..fecf90c 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -11,19 +11,19 @@ python __anonymous () {
 
     import bb
     
+    depends = bb.data.getVar("DEPENDS", d, 1)
     kerneltype = bb.data.getVar('KERNEL_IMAGETYPE', d, 1) or ''
     if kerneltype == 'uImage':
-    	depends = bb.data.getVar("DEPENDS", d, 1)
     	depends = "%s u-boot-mkimage-openmoko-native" % depends
-    	bb.data.setVar("DEPENDS", depends, d)
 
     image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
     if image != '' and image is not None:
-        bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
+    	depends = "%s %s" % (depends, image)
+
+    bb.data.setVar("DEPENDS", depends, d)
 }
 
 INITRAMFS_IMAGE ?= ""
-INITRAMFS_TASK ?= ""
 
 inherit kernel-arch
 
@@ -90,7 +90,6 @@ kernel_do_compile() {
 		oenote "no modules to compile"
 	fi
 }
-kernel_do_compile[depends] = "${INITRAMFS_TASK}"
 
 kernel_do_stage() {
 	ASMDIR=`readlink include/asm`



