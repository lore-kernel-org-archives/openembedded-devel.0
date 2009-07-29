Received: from [209.85.216.171] (helo=mail-px0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MW139-0000fa-0T
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jul 2009 06:45:59 +0200
Received: by pxi1 with SMTP id 1so366662pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2009 21:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=mWnJSKCb8bGAed9ZD5CL7ADV34McPSz6YsR3pvEJedE=;
	b=jDXoH8n3nzf2o32qG+BJ43jR4ZrbQ/v0pVskuZ8ILgmjCbtC9rHkM4TJylFRTAQG8J
	Ti9zRilU6WFuDLzeaWPh7QtP7dOa3WnymH8XF+h+IG74+B68xrXLpgYHN9q7MxQDYLcG
	CtwN+C5ENGro4StGnkAnMBhXkiAbhQYWFIjgw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=caQ8XGUmQYDEVcaPd0/mIDhmcKdJJEWgCC3bHs4T9PmIlHNtsUDiT3UaAVZQObb81k
	vHtGTvf3fSdDiyAT8svzWSfmZgd7zVTjsagDAJCEo+iA5DJVV9Rk+lYf0ELLhyWrNTTb
	/4bS6aFYWcbExWwBx0PoVh+RzwkIpR44VQiho=
Received: by 10.114.204.6 with SMTP id b6mr12976403wag.93.1248841865098;
	Tue, 28 Jul 2009 21:31:05 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 41sm1097185pzk.23.2009.07.28.21.31.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Jul 2009 21:31:03 -0700 (PDT)
Message-ID: <4A6FD077.1060001@gmail.com>
Date: Wed, 29 Jul 2009 14:00:47 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Wed, 29 Jul 2009 04:45:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

The contents of the do_compile_append() function below can also be found in 
kernel.bbclass: do_deploy().

I've removed it from linux.inc because I want to dynamically set
UBOOT_ENTRYPOINT in my linux-blah.bb based upon the resultant kernel binary
and this makes it easier.

-Graham

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


