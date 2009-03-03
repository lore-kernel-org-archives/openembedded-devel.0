Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LeX1w-000740-Bp
	for openembedded-devel@openembedded.org; Tue, 03 Mar 2009 16:59:40 +0100
Received: by bwz9 with SMTP id 9so2455177bwz.12
	for <openembedded-devel@openembedded.org>;
	Tue, 03 Mar 2009 07:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=P9Q30jvPinTKqqTtSRbTP+/HoQbX7GEii4tQ57bRW8A=;
	b=MyDm/OEKp9+2o2pyPEB82/BhveCdXP51h+c3HhSSGY79c15mAqQn/XdaerkdXpB/6l
	2T2TEqjpFa2npFJSVGaEYzbX/6y2QThLAgBcyp/PcqUjS646XD+ZychxO6+/pi0axQ4e
	L93uMCU+akSKv5soxFvzmymhLYns/sYC27l/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=jgKgoclr9yudLsPtJob+Hl53EkFBYZpi/sOoqS3ckc4kS80E0MOqWjWLKUfTA7u6uj
	OwkeB9cYhM23DKHpl5ZhT9XnECIfPTgs1Ac+rbNV/RHnt1OoRiAynurzcs3i8PZt6cjt
	8958z9SZ2TvqvMfDT7Z/mYE6p7gAPTlQxFJX0=
MIME-Version: 1.0
Received: by 10.181.139.10 with SMTP id r10mr2583526bkn.64.1236095735110; Tue, 
	03 Mar 2009 07:55:35 -0800 (PST)
In-Reply-To: <gm99v0$ier$1@ger.gmane.org>
References: <1233319034.13141.2.camel@EPBYMINW0568>
	<fce2a370902030302m1054bfc5wc5589ed60418c959@mail.gmail.com>
	<gm99v0$ier$1@ger.gmane.org>
Date: Tue, 3 Mar 2009 17:55:35 +0200
Message-ID: <fce2a370903030755n133906a3i32a25df5390d537@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Tue, 03 Mar 2009 15:59:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Bumping the thread after a month of no activity...

On Tue, Feb 3, 2009 at 1:31 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote=
:
> On 03-02-09 12:02, Ihar Hrachyshka wrote:
>>
>> Any chances for inclusion?
>
> It looks pretty good to me, but I'd like to hear from people that tested =
it
> :)
>
> regards,
>
> Koen
>
>
>> On Fri, Jan 30, 2009 at 2:37 PM, Ihar Hrachyshka
>> <ihar.hrachyshka@gmail.com> =C2=A0wrote:
>>>
>>> Automated UBOOT_LOADADDRESS and UBOOT_ENTRYPOINT variables detection (n=
o
>>> need to specify them for every machine and/or kernel now).
>>>
>>> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
>>> ---
>>> =C2=A0classes/kernel.bbclass | =C2=A0 =C2=A08 ++++----
>>> =C2=A01 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
>>> index d1f59e5..f7a7014 100644
>>> --- a/classes/kernel.bbclass
>>> +++ b/classes/kernel.bbclass
>>> @@ -69,10 +69,6 @@ KERNEL_LOCALVERSION ?=3D ""
>>> =C2=A0# kernels are generally machine specific
>>> =C2=A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>
>>> -# U-Boot support
>>> -UBOOT_ENTRYPOINT ?=3D "20008000"
>>> -UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
>>> -
>>> =C2=A0kernel_do_compile() {
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z "${INITRAMFS_IMAGE}" ]; then
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp
>>> "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz"
>>> initramfs.cpio.gz
>>> @@ -489,12 +485,16 @@ do_deploy() {
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if test "x${KERNEL_IMAGETYPE}" =3D "xuImage"=
 ; then
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -e arch/=
${ARCH}/boot/compressed/vmlinux ; then
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0${OBJCOPY} -O binary -R .note -R .comment -S
>>> arch/${ARCH}/boot/compressed/vmlinux linux.bin
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 UBOOT_LOADADDRESS=3D`${OBJDUMP} -p
>>> arch/${ARCH}/boot/compressed/vmlinux | sed -n 's/LOAD.*vaddr \([^
>>> ]*\).*/\1/p'`; \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 UBOOT_ENTRYPOINT=3D`${OBJDUMP} -f
>>> arch/${ARCH}/boot/compressed/vmlinux | sed -n 's/.*start address \([^
>>> ]*\).*/\1/p'`; \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel
>>> -C none -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n
>>> "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin
>>> ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0rm -f linux.bin
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0${OBJCOPY} -O binary -R .note -R .comment -S
>>> vmlinux linux.bin
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0rm -f linux.bin.gz
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0gzip -9 linux.bin
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 UBOOT_LOADADDRESS=3D`${OBJDUMP} -p vmlinux | sed -n
>>> 's/LOAD.*vaddr \([^ ]*\).*/\1/p'`; \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 UBOOT_ENTRYPOINT=3D`${OBJDUMP} -f vmlinux | sed -n
>>> 's/.*start address \([^ ]*\).*/\1/p'`; \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel
>>> -C gzip -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n
>>> "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz
>>> ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0rm -f linux.bin.gz
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>>> --
>>> 1.5.6.3
>>>
>>>
>>>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


