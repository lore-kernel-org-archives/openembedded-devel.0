Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TeZXy-000244-R9
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 23:59:02 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so379413eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 14:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=rllG6HhrPqQHqLFPpkw7bo8k3kTlut3kW1cwCQz6drc=;
	b=uh9TVGfi4g3y3KaD18jFGfBblfXziq5bWD+ZqffvdOtubQ3Z+33msGhzRZYC5L2vDQ
	dgPw0QQAqekHEG7bSDVVzLNKXEXF4Ort/g8Fy4Xxyr6E/iDDZyrem64lJGmEfFkAMAlB
	9SPpI/uOxy5tciWVXufp8QcaSI1/XC6XsZeNZ68G0sfCI+Jc548ZTzOnKiOBDSLVhVLY
	r1y3zpHGJTsFNLRwpN0LkHa9ZrNQqGaLmIJ6MPAiUg+fbuIBa20CXu3XJfRA3cSvq68q
	L8I2+f5pUd+EjwGM1cJYl2SSn0yyYISUUOO+TenS/SiNIRncdvVlpd3DN2cWxqigDsEa
	ujCA==
Received: by 10.14.225.194 with SMTP id z42mr2272340eep.22.1354315485436;
	Fri, 30 Nov 2012 14:44:45 -0800 (PST)
Received: from mizar.localdomain
	(host217-253-dynamic.8-87-r.retail.telecomitalia.it. [87.8.253.217])
	by mx.google.com with ESMTPS id q2sm13357404eem.13.2012.11.30.14.44.43
	(version=SSLv3 cipher=OTHER); Fri, 30 Nov 2012 14:44:44 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Nov 2012 23:44:35 +0100
Message-Id: <1354315475-22978-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: add version 3.4
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
X-List-Received-Date: Fri, 30 Nov 2012 22:59:03 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-tiny-kexecboot_3.4.bb        |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb
new file mode 100644
index 0000000..47215b5
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb
@@ -0,0 +1,17 @@
+require recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+
+PACKAGES = ""
+PROVIDES = ""
+
+KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${PR}-${MACHINE}"
+KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}"
+
+INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
+
+do_populate_sysroot() {
+        :
+}
+
+do_install() {
+        :
+}
-- 
1.7.8.6



