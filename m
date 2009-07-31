Received: from [209.85.222.203] (helo=mail-pz0-f203.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MWmy7-0003gM-Hg
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Jul 2009 09:56:00 +0200
Received: by pzk41 with SMTP id 41so1415243pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2009 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=i0GSXt4ri8cV4QDW1RUOy9Wjheh2jXcfvgJ8Ux9mAvE=;
	b=JjrpdB1ckkUivlZZZDrnRqJMs2sdcNTiUovlXSKkCXmeOt+G8YXo9IIOBlJLtjFD0/
	2PikARnq08vkIamqm20G3gGHdfO7FELecOlQfHqd9G/NzzEsU1CTv5hMtblmcawqv3Ql
	OOBv9NM7vvH98WT2hBrfITT7X3KqhH4fstbh8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=RPDWQjH2WWgt/YtLoukMaiaOzAnumoeE94m/tkgXsEgGtWvKhkyVYfztIN/WaJND85
	OvqVopCr9B2kr7mNm1YlpWe3P5t6aZASGuNjSMMFb8YUh/YTY4UX0CZ7Pw4c+0pSoWIv
	F/Ukwdfx2JyseT7cpuCQBpo9NeQNoVvbFVOy8=
Received: by 10.114.159.9 with SMTP id h9mr1949582wae.98.1249026051622;
	Fri, 31 Jul 2009 00:40:51 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id m6sm4666764wag.68.2009.07.31.00.40.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 31 Jul 2009 00:40:50 -0700 (PDT)
Message-ID: <4A729FF4.3040600@gmail.com>
Date: Fri, 31 Jul 2009 17:10:36 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A6FD077.1060001@gmail.com>	<h4ou1e$s42$1@ger.gmane.org>	<4A700A74.7040507@xora.org.uk>	<200907291131.04967.marcin@juszkiewicz.com.pl>	<6ec4247d0907292211w6afc1f60s9fcf21bc7b2d56d3@mail.gmail.com>	<20090730053353.GF25691@smtp.west.cox.net>	<6ec4247d0907292249k42c582ddid3d53e847c5f835d@mail.gmail.com>	<4A7160F2.8030000@xora.org.uk>	<4A7255D3.9020703@gmail.com>
	<4A729943.4060200@xora.org.uk>
In-Reply-To: <4A729943.4060200@xora.org.uk>
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Fri, 31 Jul 2009 07:56:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> Looks good to me, do you fancy moving that do_compile_append into 
> kernel.bbclass? You can then have the added kudos of fixing OE core 
> files :-)

Kudos sound tasty.

-Graham

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index ef16669..b498760 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -485,6 +485,29 @@ do_sizecheck() {
 
 addtask sizecheck before do_install after do_compile
 
+do_uboot_mkimage() {
+    if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
+        ENTRYPOINT=${UBOOT_ENTRYPOINT}
+        if test -n "${UBOOT_ENTRYSYMBOL}"; then
+            ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+                   awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+        fi
+        if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+            ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
+            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
+            rm -f linux.bin
+        else
+            ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
+            rm -f linux.bin.gz
+            gzip -9 linux.bin
+            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
+            rm -f linux.bin.gz
+        fi
+    fi
+}
+
+addtask uboot_mkimage before do_install after do_compile
+
 KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
 
@@ -497,21 +520,6 @@ do_deploy() {
 	tar -cvzf ${DEPLOY_DIR_IMAGE}/modules-${PV}-${PR}-${MACHINE}.tgz -C ${D} lib
 	fi
 
-	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-		if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-			${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
-			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
-			rm -f linux.bin
-		else
-			${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
-			rm -f linux.bin.gz
-			gzip -9 linux.bin
-			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
-			rm -f linux.bin.gz
-		fi
-		package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
-	fi
-
 	cd ${DEPLOY_DIR_IMAGE}
 	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
diff --git a/recipes/linux/linux.inc b/recipes/linux/linux.inc
index 96feba6..3dbb1ec 100644
--- a/recipes/linux/linux.inc
+++ b/recipes/linux/linux.inc
@@ -158,22 +158,6 @@ do_configure_append() {
 	fi
 }
 
-do_compile_append() {
-    if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-        if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-            ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
-            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
-            rm -f linux.bin
-        else
-            ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
-            rm -f linux.bin.gz
-            gzip -9 linux.bin
-            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
-            rm -f linux.bin.gz
-        fi
-    fi
-}
-
 do_devicetree_image() {
     if test -n "${KERNEL_DEVICETREE}" ; then
         dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree ${KERNEL_DEVICETREE}


