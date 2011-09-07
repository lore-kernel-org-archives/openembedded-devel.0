Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R1Ini-0004t3-Ge
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 16:08:26 +0200
Received: by ewy5 with SMTP id 5so116906ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 07:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=du6GgyQmeQr5+eFF06ZE8SPsfXX6xw+RIWidmYI7+q4=;
	b=fwWOmkIdg6UpmWDfN6Y7DvUi2e+gL2dN0pFkjMIl8i6CUaKX1SdJkt8ST5T9syXkxX
	X7Y2tYJ/pkeOZGCPpYs6jtlN/phMg07QJCvE41cFmGVyh8fwj6NsF6OdkTd2vLbqCbY7
	9wyz6BhJFIBrdTcDldIagixxKEPv/+qte0YDs=
Received: by 10.204.129.194 with SMTP id p2mr3745999bks.233.1315404204239;
	Wed, 07 Sep 2011 07:03:24 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l11sm440069bkb.1.2011.09.07.07.03.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 07:03:23 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 18:03:01 +0400
Message-Id: <1315404187-18176-7-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
References: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld 06/12] linux.inc: devicetree is used on hh boxes, drop dt handling
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
X-List-Received-Date: Wed, 07 Sep 2011 14:08:26 -0000

If later required, we should add an extra kernel-dtb.bbclass for generic
handling of dt.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-kernel/linux/linux.inc |   43 ----------------------------------------
 1 files changed, 0 insertions(+), 43 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index ad4510b..e81d0ca 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -23,27 +23,9 @@ LOGO_SIZE ?= "."
 # to your kernel recipe, and then structure your logos for each resolution
 # accordingly.
 
-# Support for binary device tree generation
-
-FILES_kernel-devicetree = "/boot/devicetree*"
-
-KERNEL_DEVICETREE_FLAGS = "-R 8 -S 0x3000"
-
 CORTEXA8FIXUP ?= "yes"
 LOCALVERSION ?= ""
 
-python __anonymous () {
-
-    import bb
-    
-    devicetree = bb.data.getVar('KERNEL_DEVICETREE', d, 1) or ''
-    if devicetree:
-    	depends = bb.data.getVar("DEPENDS", d, 1)
-    	bb.data.setVar("DEPENDS", "%s dtc-native" % depends, d)
-    	packages = bb.data.getVar("PACKAGES", d, 1)
-    	bb.data.setVar("PACKAGES", "%s kernel-devicetree" % packages, d)
-}
-
 do_configure_prepend() {
         echo "" > ${S}/.config
 
@@ -198,34 +180,9 @@ do_install_append() {
 PACKAGES =+ "kernel-headers"
 FILES_kernel-headers = "${exec_prefix}/src/linux*"
 
-do_devicetree_image() {
-    if test -n "${KERNEL_DEVICETREE}" ; then
-        dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree ${KERNEL_DEVICETREE}
-        install -d ${D}/boot
-        install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERSION}
-        install -d ${DEPLOY_DIR_IMAGE}
-        install -m 0644 devicetree ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb
-        package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb
-        cd ${DEPLOY_DIR_IMAGE}
-        rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
-        ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
-        package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_SYMLINK_NAME}.dtb
-    fi
-}
-
-addtask devicetree_image after do_install before do_package do_deploy
-
 do_savedefconfig() {
        oe_runmake savedefconfig
 }
 
 addtask savedefconfig after do_configure
 
-pkg_postinst_kernel-devicetree () {
-	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/devicetree devicetree devicetree-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
-}
-
-pkg_postrm_kernel-devicetree () {
-	cd /${KERNEL_IMAGEDEST}; update-alternatives --remove devicetree devicetree-${KERNEL_VERSION} || true
-}
-
-- 
1.7.2.5



