Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LUJdG-00004u-Fl
	for openembedded-devel@openembedded.org; Tue, 03 Feb 2009 12:39:58 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LUJVR-0004L8-IN
	for openembedded-devel@openembedded.org; Tue, 03 Feb 2009 11:31:53 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 03 Feb 2009 11:31:53 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 03 Feb 2009 11:31:53 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 03 Feb 2009 12:31:44 +0100
Message-ID: <gm99v0$ier$1@ger.gmane.org>
References: <1233319034.13141.2.camel@EPBYMINW0568>
	<fce2a370902030302m1054bfc5wc5589ed60418c959@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090123 Shredder/3.0b2pre
In-Reply-To: <fce2a370902030302m1054bfc5wc5589ed60418c959@mail.gmail.com>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Tue, 03 Feb 2009 11:39:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-02-09 12:02, Ihar Hrachyshka wrote:
> Any chances for inclusion?

It looks pretty good to me, but I'd like to hear from people that tested 
it :)

regards,

Koen


> On Fri, Jan 30, 2009 at 2:37 PM, Ihar Hrachyshka
> <ihar.hrachyshka@gmail.com>  wrote:
>> Automated UBOOT_LOADADDRESS and UBOOT_ENTRYPOINT variables detection (no
>> need to specify them for every machine and/or kernel now).
>>
>> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
>> ---
>>   classes/kernel.bbclass |    8 ++++----
>>   1 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
>> index d1f59e5..f7a7014 100644
>> --- a/classes/kernel.bbclass
>> +++ b/classes/kernel.bbclass
>> @@ -69,10 +69,6 @@ KERNEL_LOCALVERSION ?= ""
>>   # kernels are generally machine specific
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>
>> -# U-Boot support
>> -UBOOT_ENTRYPOINT ?= "20008000"
>> -UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
>> -
>>   kernel_do_compile() {
>>         if [ ! -z "${INITRAMFS_IMAGE}" ]; then
>>                 cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" initramfs.cpio.gz
>> @@ -489,12 +485,16 @@ do_deploy() {
>>         if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
>>                 if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
>>                         ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
>> +                       UBOOT_LOADADDRESS=`${OBJDUMP} -p arch/${ARCH}/boot/compressed/vmlinux | sed -n 's/LOAD.*vaddr \([^ ]*\).*/\1/p'`; \
>> +                       UBOOT_ENTRYPOINT=`${OBJDUMP} -f arch/${ARCH}/boot/compressed/vmlinux | sed -n 's/.*start address \([^ ]*\).*/\1/p'`; \
>>                         uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
>>                         rm -f linux.bin
>>                 else
>>                         ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
>>                         rm -f linux.bin.gz
>>                         gzip -9 linux.bin
>> +                       UBOOT_LOADADDRESS=`${OBJDUMP} -p vmlinux | sed -n 's/LOAD.*vaddr \([^ ]*\).*/\1/p'`; \
>> +                       UBOOT_ENTRYPOINT=`${OBJDUMP} -f vmlinux | sed -n 's/.*start address \([^ ]*\).*/\1/p'`; \
>>                         uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
>>                         rm -f linux.bin.gz
>>                 fi
>> --
>> 1.5.6.3
>>
>>
>>




