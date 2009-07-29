Received: from [209.85.219.228] (helo=mail-ew0-f228.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MW4uT-0007tj-5s
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jul 2009 10:53:17 +0200
Received: by ewy28 with SMTP id 28so533105ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2009 01:38:22 -0700 (PDT)
Received: by 10.210.137.18 with SMTP id k18mr8050778ebd.47.1248856700066;
	Wed, 29 Jul 2009 01:38:20 -0700 (PDT)
Received: from ?192.168.1.64? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 7sm1698565eyb.52.2009.07.29.01.38.18
	(version=SSLv3 cipher=RC4-MD5); Wed, 29 Jul 2009 01:38:18 -0700 (PDT)
Message-ID: <4A700A74.7040507@xora.org.uk>
Date: Wed, 29 Jul 2009 09:38:12 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A6FD077.1060001@gmail.com> <h4ou1e$s42$1@ger.gmane.org>
In-Reply-To: <h4ou1e$s42$1@ger.gmane.org>
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
X-List-Received-Date: Wed, 29 Jul 2009 08:53:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> NAK, this breaks the resulting kernel-image ipk
>
Double NAK, read the git log, I put this there to specifically make 
stuff work, I thought I had removed it from kernel.bbclass but I 
obviously forgot to push that patch. Doing it in do_deploy is just 
totally wrong.

Graeme

> On 29-07-09 06:30, Graham Gower wrote:
>
>> The contents of the do_compile_append() function below can also be found
>> in kernel.bbclass: do_deploy().
>>
>> I've removed it from linux.inc because I want to dynamically set
>> UBOOT_ENTRYPOINT in my linux-blah.bb based upon the resultant kernel 
>> binary
>> and this makes it easier.
>>
>> -Graham
>>
>> diff --git a/recipes/linux/linux.inc b/recipes/linux/linux.inc
>> index 96feba6..3dbb1ec 100644
>> --- a/recipes/linux/linux.inc
>> +++ b/recipes/linux/linux.inc
>> @@ -158,22 +158,6 @@ do_configure_append() {
>> fi
>> }
>>
>> -do_compile_append() {
>> - if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then - if test -e
>> arch/${ARCH}/boot/compressed/vmlinux ; then
>> - ${OBJCOPY} -O binary -R .note -R .comment -S
>> arch/${ARCH}/boot/compressed/vmlinux linux.bin
>> - uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a
>> ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n
>> "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
>> - rm -f linux.bin
>> - else
>> - ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
>> - rm -f linux.bin.gz
>> - gzip -9 linux.bin
>> - uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a
>> ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n
>> "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz 
>> arch/${ARCH}/boot/uImage
>> - rm -f linux.bin.gz
>> - fi
>> - fi
>> -}
>> -
>> do_devicetree_image() {
>> if test -n "${KERNEL_DEVICETREE}" ; then
>> dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree
>> ${KERNEL_DEVICETREE}
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



