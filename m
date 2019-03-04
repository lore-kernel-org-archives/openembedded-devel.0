Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id B8C3560107
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Mar 2019 09:04:21 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1h0jWH-0004uC-P1; Mon, 04 Mar 2019 10:04:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TKClgbPmZrOkVbcit9S68QkVqWQGRrWtSr1ZlIA15I8=;
	b=CmB3qqHR5bvZZAajFnA2HeHak/
	IY663r2N/drWdwAbEeyh1jkTlddKod2GHeMwAYGv/8irKqyC4dKzlb4b4sd8F0rxdXqLvTUKXFCCj
	YNoUwfS0YBAMNXPtcq9qV2w74Y3HnOGzmksYYv0GzPQGz+uCHWK2Upi5GGnacd8znbdUTmHZ5iLXs
	ky/BW+tn8vsE0PBLbRaHuNfEIQOx3Viqu48RC5UbecQhTpGQ6C/cnd9vqsX32pcD2Bwn1sm4vqDAh
	kq1aA2yt+ag6A/x6VtcuytUWWbaZUszAUK47rrQZa9JkpR4ItsGXLyTo31UVGfesCZHiPBWfot1+8
	t2p14M9w==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1h0jWC-0008UF-Uz; Mon, 04 Mar 2019 10:04:19 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20190220043740.27952-1-zboszor@pr.hu>
	<20190226095502.5499-1-zboszor@pr.hu>
	<20190226095502.5499-4-zboszor@pr.hu>
	<CAMKF1sqkihWR1Ye=idgGM3m6fq59KtY1_BpAJPK3oKmUwbddrQ@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <4f84ab3c-0344-5060-2c77-6577d62e4570@pr.hu>
Date: Mon, 4 Mar 2019 10:04:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqkihWR1Ye=idgGM3m6fq59KtY1_BpAJPK3oKmUwbddrQ@mail.gmail.com>
X-Spam-Score: -1.4 (-)
X-Scan-Signature: b29d38d33be9dc2ab4a61579471bb751
X-Spam-Tracer: backend.mail.pr.hu -1.4 20190304090419Z
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 3/7 v2] dracut: Add execute_dracut opkg intercept script
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2019 09:04:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2019. 03. 03. 23:05 keltezéssel, Khem Raj írta:
> On Tue, Feb 26, 2019 at 1:55 AM Böszörményi Zoltán <zboszor@pr.hu> wrote:
>>
>> Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
>> ---
>> v2: The script name is execute_dracut, not execute-dracut
>>      so it is identical to the postinst-intercepts variant.
>>
>>   .../dracut/dracut/execute_dracut              | 21 +++++++++++++++++++
>>   .../recipes-devtools/dracut/dracut_git.bb     |  5 +++++
>>   2 files changed, 26 insertions(+)
>>   create mode 100755 meta-initramfs/recipes-devtools/dracut/dracut/execute_dracut
>>
>> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/execute_dracut b/meta-initramfs/recipes-devtools/dracut/dracut/execute_dracut
>> new file mode 100755
>> index 000000000..96bcc92ed
>> --- /dev/null
>> +++ b/meta-initramfs/recipes-devtools/dracut/dracut/execute_dracut
>> @@ -0,0 +1,21 @@
>> +#!/bin/sh
>> +
>> +if [ ! -f $OPKG_INTERCEPT_DIR/execute-dracut ]; then
>> +       KERNEL_VERSION=$1
>> +       shift
>> +       MY_KERNEL_VERSION=$(readlink /boot/bzimage | sed 's,^.*bzImage-,,')
> 
> this assumption breaks all image builds for qemux86 and qemux86_64
> unless that is fixed, it will be hard to accept this series. bzImage
> is not the kernel name always

I have read kernel.bbclass more closely and I can use ${KERNEL_IMAGETYPE}
and ${KERNEL_IMAGEDEST} to remove these assumptions.

> and may not be present in rootfs all the
> time.

Now, based on the code of kernel.bbclass, it's hard to believe that
the kernel image is not always present in rootfs.

According to the code in kernel.bbclass
${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} will always be
a symlink to ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} in the same
directory.

> 
> ERROR: yoe-simple-image-1.0-r0 do_rootfs: The postinstall intercept
> hook 'execute_dracut' failed, details in
> /mnt/a/yoe/build/tmp/work/qemux86-yoe-linux/yoe-s
> imple-image/1.0-r0/temp/log.do_rootfs
> ERROR: yoe-simple-image-1.0-r0 do_rootfs:
> ERROR: yoe-simple-image-1.0-r0 do_rootfs: Function failed: do_rootfs
> 
> 
> 
>> +       if [[ -z "$MY_KERNEL_VERSION" ]]; then
>> +               if [[ -d /lib/modules/$KERNEL_VERSION ]]; then
>> +                       MY_KERNEL_VERSION="${KERNEL_VERSION}"
>> +               fi
>> +       fi
>> +       [[ -z "$MY_KERNEL_VERSION" ]] && echo COULD NOT DETERMINE KERNEL VERSION TO RUN DEPMOD AND DRACUT && echo PLEASE DO IT MANUALLY && exit 0
>> +       cat <<EOF > $OPKG_INTERCEPT_DIR/execute-dracut
>> +echo RUNNING: depmod -a $MY_KERNEL_VERSION
>> +depmod -a $MY_KERNEL_VERSION
>> +echo RUNNING: dracut -f $@ /boot/initramfs.img $MY_KERNEL_VERSION
>> +echo "dracut: $(dracut --help | grep 'Version:')"
>> +dracut -f $@ /boot/initramfs.img $MY_KERNEL_VERSION
>> +EOF
>> +       chmod +x $OPKG_INTERCEPT_DIR/execute-dracut
>> +fi
>> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>> index a1d7cb119..cb49d9539 100644
>> --- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>> @@ -12,6 +12,7 @@ PV = "049"
>>   SRCREV = "225e4b94cbdb702cf512490dcd2ad9ca5f5b22c1"
>>   SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http \
>>              file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
>> +           file://execute_dracut \
>>              "
>>
>>   DEPENDS += "kmod"
>> @@ -49,11 +50,15 @@ do_install() {
>>       # Its Makefile uses cp -arx to install modules.d, so fix the owner
>>       # to root:root
>>       chown -R root:root ${D}/${prefix}/lib/dracut/modules.d
>> +
>> +    install -d -m0755 ${D}${datadir}/opkg/intercept
>> +    install -m0755 ${WORKDIR}/execute_dracut ${D}${datadir}/opkg/intercept
>>   }
>>
>>   FILES_${PN} += "${prefix}/lib/kernel \
>>                   ${prefix}/lib/dracut \
>>                   ${systemd_unitdir} \
>> +                ${datadir}/opkg/intercept \
>>                  "
>>   FILES_${PN}-dbg += "${prefix}/lib/dracut/.debug"
>>
>> --
>> 2.20.1
>>
> 


