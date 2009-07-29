Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MW3vC-0000F9-A3
	for openembedded-devel@openembedded.org; Wed, 29 Jul 2009 09:49:58 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MW3gl-0002DB-2O
	for openembedded-devel@openembedded.org; Wed, 29 Jul 2009 07:35:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 29 Jul 2009 07:35:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 29 Jul 2009 07:35:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 29 Jul 2009 09:34:05 +0200
Message-ID: <h4ou1e$s42$1@ger.gmane.org>
References: <4A6FD077.1060001@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090716 Shredder/3.0b4pre
In-Reply-To: <4A6FD077.1060001@gmail.com>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Wed, 29 Jul 2009 07:49:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

NAK, this breaks the resulting kernel-image ipk

On 29-07-09 06:30, Graham Gower wrote:

> The contents of the do_compile_append() function below can also be found
> in kernel.bbclass: do_deploy().
>
> I've removed it from linux.inc because I want to dynamically set
> UBOOT_ENTRYPOINT in my linux-blah.bb based upon the resultant kernel binary
> and this makes it easier.
>
> -Graham
>
> diff --git a/recipes/linux/linux.inc b/recipes/linux/linux.inc
> index 96feba6..3dbb1ec 100644
> --- a/recipes/linux/linux.inc
> +++ b/recipes/linux/linux.inc
> @@ -158,22 +158,6 @@ do_configure_append() {
> fi
> }
>
> -do_compile_append() {
> - if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then - if test -e
> arch/${ARCH}/boot/compressed/vmlinux ; then
> - ${OBJCOPY} -O binary -R .note -R .comment -S
> arch/${ARCH}/boot/compressed/vmlinux linux.bin
> - uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a
> ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n
> "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
> - rm -f linux.bin
> - else
> - ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
> - rm -f linux.bin.gz
> - gzip -9 linux.bin
> - uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a
> ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n
> "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
> - rm -f linux.bin.gz
> - fi
> - fi
> -}
> -
> do_devicetree_image() {
> if test -n "${KERNEL_DEVICETREE}" ; then
> dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree
> ${KERNEL_DEVICETREE}




