Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LUJAw-0002Ox-7U
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Feb 2009 12:10:42 +0100
Received: by an-out-0708.google.com with SMTP id d40so986507and.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Feb 2009 03:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dN3SvKA1Hl2CafBCc74ZbD7hrL8ERXbT7fzUbivMjS0=;
	b=ImMzmDn7Nsk2Qk2VjH1bXmnuZ7yN0jM/1YcGxvTUBgLazXR8CcXr0GfsHHeVP0yg7I
	khGSYBN8Yc/iD669gB9YO4sqn4+mgb/2hQotPg9yyXbMEXPhTjZ5YhcSTJk1VeKccq09
	FDdT7c4FVvaqss1rHhi2iJ/OUq6zG9YIIzMOw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lBGjJLGtAbET//j3mt0Ps/hABWqDeiHeI6yZ5mbmkjw8rkuwaOiiaxG0RAnuxZDnwO
	GcdokxWEqlLlKi+VqNjjq/DeMlP6G5VludM9OT+n1I3ZvnkVn65j9lngFUEs9oRdWxtN
	SytYjonl3wtmAccKvSepiBVRiy4udi7RqvP9U=
MIME-Version: 1.0
Received: by 10.151.113.5 with SMTP id q5mr181315ybm.68.1233658959290; Tue, 03 
	Feb 2009 03:02:39 -0800 (PST)
In-Reply-To: <1233319034.13141.2.camel@EPBYMINW0568>
References: <1233319034.13141.2.camel@EPBYMINW0568>
Date: Tue, 3 Feb 2009 13:02:39 +0200
Message-ID: <fce2a370902030302m1054bfc5wc5589ed60418c959@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Automate uboot entry/load addresses detection.
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
X-List-Received-Date: Tue, 03 Feb 2009 11:10:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Any chances for inclusion?

On Fri, Jan 30, 2009 at 2:37 PM, Ihar Hrachyshka
<ihar.hrachyshka@gmail.com> wrote:
> Automated UBOOT_LOADADDRESS and UBOOT_ENTRYPOINT variables detection (no
> need to specify them for every machine and/or kernel now).
>
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
>  classes/kernel.bbclass |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index d1f59e5..f7a7014 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -69,10 +69,6 @@ KERNEL_LOCALVERSION ?= ""
>  # kernels are generally machine specific
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -# U-Boot support
> -UBOOT_ENTRYPOINT ?= "20008000"
> -UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
> -
>  kernel_do_compile() {
>        if [ ! -z "${INITRAMFS_IMAGE}" ]; then
>                cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" initramfs.cpio.gz
> @@ -489,12 +485,16 @@ do_deploy() {
>        if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
>                if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
>                        ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
> +                       UBOOT_LOADADDRESS=`${OBJDUMP} -p arch/${ARCH}/boot/compressed/vmlinux | sed -n 's/LOAD.*vaddr \([^ ]*\).*/\1/p'`; \
> +                       UBOOT_ENTRYPOINT=`${OBJDUMP} -f arch/${ARCH}/boot/compressed/vmlinux | sed -n 's/.*start address \([^ ]*\).*/\1/p'`; \
>                        uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
>                        rm -f linux.bin
>                else
>                        ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
>                        rm -f linux.bin.gz
>                        gzip -9 linux.bin
> +                       UBOOT_LOADADDRESS=`${OBJDUMP} -p vmlinux | sed -n 's/LOAD.*vaddr \([^ ]*\).*/\1/p'`; \
> +                       UBOOT_ENTRYPOINT=`${OBJDUMP} -f vmlinux | sed -n 's/.*start address \([^ ]*\).*/\1/p'`; \
>                        uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
>                        rm -f linux.bin.gz
>                fi
> --
> 1.5.6.3
>
>
>


