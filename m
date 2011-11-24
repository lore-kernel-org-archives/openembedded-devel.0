Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RTWUz-0003Sg-Gx
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 11:25:45 +0100
Received: by wwo1 with SMTP id 1so2941500wwo.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 02:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WSNz6U0b1TPd4JtaGjT31+bducq9bLzdDUXssKOzL0A=;
	b=Ne+UW8o5ZEvVV/6cq0tjKxchxvI65KSj0BIxP0l85VUdTfCg1VOodlNivnGEh7o3xo
	x6ftZqGFhHlScsd1YdQVBuoHdbrK6+NCx/vkWeJtblR8CWsGzu2ItzPLDeMkceYtkmYi
	VWKhje/fBeJbKr449E2/cyDYRLe3pVRAIi8Gk=
Received: by 10.227.16.166 with SMTP id o38mr2998159wba.13.1322129952827;
	Thu, 24 Nov 2011 02:19:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gf10sm9256919wib.2.2011.11.24.02.19.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 02:19:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Nov 2011 11:18:42 +0100
Message-Id: <4fb71f23ca156720be745d2a86828f5f6d0081a7.1322129758.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <0004016e514fbb3f18793561ebf85766344ae499.1322129758.git.Martin.Jansa@gmail.com>
References: <0004016e514fbb3f18793561ebf85766344ae499.1322129758.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322129758.git.Martin.Jansa@gmail.com>
References: <cover.1322129758.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld 3/6] linux-kexecboot: use kernel_conf_variable like linux.inc does and respect CMDLINE_DEBUG
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
X-List-Received-Date: Thu, 24 Nov 2011 10:25:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot.inc |  103 ++++++++++++++---------------
 1 files changed, 50 insertions(+), 53 deletions(-)

diff --git a/recipes-kernel/linux/linux-kexecboot.inc b/recipes-kernel/linux/linux-kexecboot.inc
index 31ae5b5..83b7018 100644
--- a/recipes-kernel/linux/linux-kexecboot.inc
+++ b/recipes-kernel/linux/linux-kexecboot.inc
@@ -20,13 +20,17 @@ LOGO_SIZE ?= "."
 # to your kernel recipe, and then structure your logos for each resolution
 # accordingly.
 
+# Set the verbosity of kernel messages during runtime
+# You can define CMDLINE_DEBUG in your local.conf or distro.conf to override this behaviour
+CMDLINE_DEBUG ?= '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "loglevel=3", d)}'
+
 # Note how we set loglevel=3 and master console on serial to protect bootlogo.
-CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8 loglevel=3"
-CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8 loglevel=3"
-CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
-CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
-CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M loglevel=3"
-CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
+CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8"
+CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8"
+CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
+CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
 
 PACKAGES = ""
 PROVIDES = ""
@@ -47,28 +51,39 @@ LOCALVERSION ?= ""
 # we want the smallest size
 INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
 
+kernel_conf_variable() {
+        CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[ =]/d;"
+        if test "$2" = "n"
+        then
+                echo "# CONFIG_$1 is not set" >> ${S}/.config
+        else
+                echo "CONFIG_$1=$2" >> ${S}/.config
+        fi
+}
+
 do_configure_prepend() {
 
         echo "" > ${S}/.config
+        CONF_SED_SCRIPT=""
 
         #
         # CONFIG_CMDLINE mangling
         #
-        echo "CONFIG_CMDLINE_BOOL=y" >> ${S}/.config
-        echo "CONFIG_CMDLINE=\"${CMDLINE}\"" >> ${S}/.config
+        kernel_conf_variable CMDLINE_BOOL y
+        kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
 
         # mips and x86
-        echo "CONFIG_CMDLINE_OVERRIDE=y" >> ${S}/.config
+        kernel_conf_variable CMDLINE_OVERRIDE y
 
         # sh only
-        echo "CONFIG_CMDLINE_OVERWRITE=y" >> ${S}/.config
-        echo "# CONFIG_CMDLINE_EXTEND is not set" >> ${S}/.config
+        kernel_conf_variable CMDLINE_OVERWRITE y
+        kernel_conf_variable CMDLINE_EXTEND n
 
         #
         # endian support
         #
         if [ "${SITEINFO_ENDIANNESS}" = "be" ]; then
-                echo "CONFIG_CPU_BIG_ENDIAN=y"          >> ${S}/.config
+                kernel_conf_variable CPU_BIG_ENDIAN y
         fi
 
         #
@@ -76,60 +91,42 @@ do_configure_prepend() {
         #
         if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
                 install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
-                echo "CONFIG_LOGO=y"                    >> ${S}/.config
-                echo "CONFIG_LOGO_LINUX_CLUT224=y"      >> ${S}/.config
+                kernel_conf_variable LOGO y
+                kernel_conf_variable LOGO_LINUX_CLUT224 y
         fi
 
         # When enabling thumb for userspace we also need thumb support in the kernel
         if [ "${ARM_INSTRUCTION_SET}" = "thumb" ] ; then
-            sed -i -e /CONFIG_ARM_THUMB/d ${WORKDIR}/defconfig 
-            echo "CONFIG_ARM_THUMB=y" >> ${S}/.config
+                kernel_conf_variable ARM_THUMB y
         fi
 
-        sed -e '/CONFIG_CMDLINE=/d' \
-            -e '/CONFIG_CMDLINE_BOOL/d' \
-            -e '/CONFIG_CMDLINE_OVERRIDE/d' \
-            -e '/CONFIG_CMDLINE_OVERWRITE/d' \
-            -e '/CONFIG_CMDLINE_EXTEND/d' \
-            -e '/CONFIG_CPU_BIG_ENDIAN/d' \
-            -e '/CONFIG_LOGO=/d' \
-            -e '/CONFIG_LOGO_LINUX_CLUT224=/d' \
-            -e '/CONFIG_LOCALVERSION/d' \
-            -e '/CONFIG_LOCALVERSION_AUTO/d' \
-            < '${WORKDIR}/defconfig' >>'${S}/.config'
-
-        echo 'CONFIG_LOCALVERSION="${LOCALVERSION}"' >>${S}/.config
-        echo '# CONFIG_LOCALVERSION_AUTO is not set' >>${S}/.config
+        kernel_conf_variable LOCALVERSION "\"${LOCALVERSION}\""
+        kernel_conf_variable LOCALVERSION_AUTO n
 
         # Force sane defaults for kexec-enabled kernels and keep size small
-        sed -i -e /CONFIG_BLK_DEV_INITRD/d \
-               -e /CONFIG_KEXEC/d \
-               -e /=m/d \
-               -e /CONFIG_MODULES/d \
-               -e /CONFIG_DEBUG_ERRORS/d \
-               -e /CONFIG_DEBUG_BUGVERBOSE/d \
-               -e /CONFIG_DEBUG_KERNEL/d \
-               ${S}/.config
-
-               echo 'CONFIG_BLK_DEV_INITRD=y' >>${S}/.config
-               echo 'CONFIG_KEXEC=y' >>${S}/.config
-               echo '# CONFIG_MODULES is not set' >> ${S}/.config
+        kernel_conf_variable BLK_DEV_INITRD y
+        kernel_conf_variable KEXEC y
+        CONF_SED_SCRIPT="$CONF_SED_SCRIPT /=m/d;"
+        kernel_conf_variable MODULES n
+        kernel_conf_variable DEBUG_ERRORS n
+        kernel_conf_variable DEBUG_BUGVERBOSE n
+        kernel_conf_variable DEBUG_KERNEL n
 
         # Force lzma for arm kernels only
         if [ "${ARCH}" = "arm" ] ; then
-
-            sed -i -e /CONFIG_KERNEL/d \
-               -e /CONFIG_INITRAMFS_COMPRESSION/d \
-               -e /CONFIG_INITRAMFS_SOURCE/d \
-               -e /CONFIG_RD/d \
-               ${S}/.config
-
-               echo 'CONFIG_KERNEL_LZMA=y' >>${S}/.config
-               echo 'CONFIG_INITRAMFS_COMPRESSION_LZMA=y' >>${S}/.config
-               echo 'CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"' >>${S}/.config
-               echo 'CONFIG_RD_LZMA=y' >>${S}/.config
+                CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_KERNEL/d;"
+                CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_RD/d;"
+                CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_INITRAMFS_COMPRESSION/d;"
+                CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_INITRAMFS_SOURCE/d;"
+                kernel_conf_variable KERNEL_LZMA y
+                kernel_conf_variable RD_LZMA y
+                kernel_conf_variable INITRAMFS_COMPRESSION_LZMA y
+                kernel_conf_variable INITRAMFS_SOURCE "\"initramfs.cpio.lzma\""
         fi
 
+        sed -e "${CONF_SED_SCRIPT}" \
+                        < '${WORKDIR}/defconfig' >>'${S}/.config'
+
         yes '' | oe_runmake oldconfig
 }
 
-- 
1.7.8.rc3



