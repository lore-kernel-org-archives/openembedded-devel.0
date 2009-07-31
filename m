Received: from [209.85.222.193] (helo=mail-pz0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MWi2C-0008DV-4w
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Jul 2009 04:39:52 +0200
Received: by pzk31 with SMTP id 31so2205127pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2009 19:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=ANGCWh3zACZVcZ8J9JJXd4m7qT+7UPxZmvvLPY01DpU=;
	b=CykU4EnP/CN6adBVAtIbGSBgOQxzPbRB2zwDI5u17vyN+EJ1a1WxHq/2XWmvGcrkcj
	9xp/i2AFlZ7gNly11f4MOQoAN4RyrJ0HAwoXdkbNT2Y20toALmeI2s/by7pDHmfnJRn3
	/+orYmzZC8L1G/twB7XNZ0TnuOa5exoiOXe4s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=bSHO/RSkwH+qmMC1b1aqtXD+N833tnRiaxq1JFAK4peZ24QJfOtxeD3X4mO/hNhBJL
	FQ6ch18p2o1L8iqtwRwI5iucwvbefC3LKVC9od/JFQUrPS0f0TvEgf4e/ABVXdj2eznS
	2Ienk/cjcU6HSZG5WuHUbyHhGToFOUgyUHuI4=
Received: by 10.114.76.1 with SMTP id y1mr1475886waa.58.1249007076508;
	Thu, 30 Jul 2009 19:24:36 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	g25sm4100232wag.43.2009.07.30.19.24.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 30 Jul 2009 19:24:34 -0700 (PDT)
Message-ID: <4A7255D3.9020703@gmail.com>
Date: Fri, 31 Jul 2009 11:54:19 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A6FD077.1060001@gmail.com>	<h4ou1e$s42$1@ger.gmane.org>	<4A700A74.7040507@xora.org.uk>	<200907291131.04967.marcin@juszkiewicz.com.pl>	<6ec4247d0907292211w6afc1f60s9fcf21bc7b2d56d3@mail.gmail.com>	<20090730053353.GF25691@smtp.west.cox.net>	<6ec4247d0907292249k42c582ddid3d53e847c5f835d@mail.gmail.com>
	<4A7160F2.8030000@xora.org.uk>
In-Reply-To: <4A7160F2.8030000@xora.org.uk>
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
X-List-Received-Date: Fri, 31 Jul 2009 02:39:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> Why dont you prepend it to the current uImage creation code running only 
> conditionally on UBOOT_ENTRYSYMBOL being set? As its in the same bit of 
> shell code your resetting of UBOOT_ENTRYPOINT will take precedence! Also 
> means other machines can use it.

Once I realised that ${FOO} is replaced before the shell function is run,
while $FOO is not, things made a lot more sense.

Allow a dynamic entry point via UBOOT_ENTRYSYMBOL and remove redundant
uboot-mkimage code in kernel.bbclass.

-Graham

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index ef16669..94c73a5 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -497,21 +497,6 @@ do_deploy() {
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
index 96feba6..02243ca 100644
--- a/recipes/linux/linux.inc
+++ b/recipes/linux/linux.inc
@@ -159,16 +159,21 @@ do_configure_append() {
 }
 
 do_compile_append() {
+    ENTRYPOINT=${UBOOT_ENTRYPOINT}
+    if test -n "${UBOOT_ENTRYSYMBOL}"; then
+        ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+               awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+    fi
     if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
         if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
             ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
-            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
+            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
             rm -f linux.bin
         else
             ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
             rm -f linux.bin.gz
             gzip -9 linux.bin
-            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
+            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
             rm -f linux.bin.gz
         fi
     fi


