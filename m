Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 96B867C677
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2019 09:58:18 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gvfgp-00075Y-5Z; Mon, 18 Feb 2019 10:58:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wuNyaRKGf0nxEoYm26r5EirutcYR42EEjUa5xb2/I0w=;
	b=gVAYlGgfJZuA3Inwh+j8lOsy7C
	qPqmXTBN/T4T/lgTXhbgCRy4WI2OUeXagBOxqDqqKG/hx1mD9OXbaxD0Y/i81uHrqpedmMDFwotMQ
	SVR407x06O3sUnEgoD1I/Cg0Objx5zXcm9C+Vu2L2ZPNYNUAKlyLpm7DPiI3Q3V/wFH37pp9Nvc6T
	Qp1CWPBI0zioz6VIz9KZAgJiGGAkVV7RCU27nYllh9WbkqnKmLcmhjHi1Op1tq3KRx3Q29wHSAcHR
	R82BzQ29wkr4Ck2oV+8ft/R4cdbn2hJ8GSIH7L6vkMdIWTtjD66169U0Qt31r21EKLTczSM/+IHHr
	O9JeLGCw==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1gvfgl-0003sa-Aj; Mon, 18 Feb 2019 10:58:17 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20190216170354.10645-1-zboszor@pr.hu>
	<20190216170354.10645-3-zboszor@pr.hu>
	<CAMKF1srU-Pjfq_U5aSZ+_oDO9FYdHE3F27fMZd0SpiDh7RWtZg@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <0956efd5-0afb-b2d8-e615-b6da232e33f9@pr.hu>
Date: Mon, 18 Feb 2019 10:58:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srU-Pjfq_U5aSZ+_oDO9FYdHE3F27fMZd0SpiDh7RWtZg@mail.gmail.com>
X-Spam-Score: -1.3 (-)
X-Scan-Signature: 123237abfafbe34d1fffac85ccaf8f59
X-Spam-Tracer: backend.mail.pr.hu -1.3 20190218095817Z
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 2/6] dracut: Allow native build
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
X-List-Received-Date: Mon, 18 Feb 2019 09:58:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2019. 02. 17. 21:40 keltezéssel, Khem Raj írta:
> On Sat, Feb 16, 2019 at 9:04 AM Böszörményi Zoltán <zboszor@pr.hu> wrote:
>>
>> For useful modules to be successfully included into the initramfs,
>> the dependencies must be extended.
>>
>> Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
>> ---
>>   meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>> index dd2e8bbb3..71926c3b8 100644
>> --- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>> @@ -59,11 +59,19 @@ FILES_${PN}-dbg += "${prefix}/lib/dracut/.debug"
>>
>>   CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
>>
>> -RDEPENDS_${PN} = "findutils cpio util-linux-blkid util-linux-getopt util-linux bash ldd"
>> +RDEPENDS_${PN}_class-target = " \
>> +                     findutils cpio util-linux-blkid util-linux-getopt util-linux-losetup util-linux-umount util-linux \
>> +                     bash ldd xz plymouth-initrd kbd-consolefonts kbd-consoletrans kbd-keymaps kbd-unimaps gzip tar sed \
>> +                     openssh-scp openssh-ssh systemd udev linux-firmware \
>> +                    "
>> +RDEPENDS_${PN}_class-native = "coreutils-native findutils-native cpio-native util-linux-native bash-native cross-compiler-ldd"
>>
> 
> this adds unconditional dependency on systemd, if this is the case
> then we need to make it such that it does not get pulled
> into non systemd builds e.g. when using sysvinit

Thanks, I will fix it.

I will need to send a v2 patch for other patches in the series, so

1. allarch packages can also use dracut.bbclass, like script-only dracut
    module packages, and
2. for the s,execute-dracut,execute_dracut, change for the opkg intercept
    script name so its name is identical to the do_rootfs variant

As for (1), with such a package that uses "inherit allarch" but with
dracut.bbclass depending on binutils-cross-${TUNE_ARCH} and
gcc-cross-${TUNE_ARCH}, I get these warnings in Yocto 2.5 for an i686 target:

WARNING: sicom-pos-initramfs-1.24-r0 do_prepare_recipe_sysroot: Manifest 
/data/OE/sicom-manifest-2.5/build/tmp-sicom-glibc/sstate-control/manifest-x86_64_allarch-binutils-cross-i686.populate_sysroot 
not found in x86_64_allarch (variant '')?
WARNING: sicom-pos-initramfs-1.24-r0 do_prepare_recipe_sysroot: Manifest 
/data/OE/sicom-manifest-2.5/build/tmp-sicom-glibc/sstate-control/manifest-x86_64_allarch-gcc-cross-i686.populate_sysroot 
not found in x86_64_allarch (variant '')?
WARNING: sicom-pos-initramfs-1.24-r0 do_install: Manifest 
/data/OE/sicom-manifest-2.5/build/tmp-sicom-glibc/sstate-control/manifest-x86_64_allarch-binutils-cross-i686.populate_sysroot 
not found in x86_64_allarch (variant '')?
WARNING: sicom-pos-initramfs-1.24-r0 do_install: Manifest 
/data/OE/sicom-manifest-2.5/build/tmp-sicom-glibc/sstate-control/manifest-x86_64_allarch-gcc-cross-i686.populate_sysroot 
not found in x86_64_allarch (variant '')?
WARNING: sicom-pos-initramfs-1.24-r0 do_package: Manifest 
/data/OE/sicom-manifest-2.5/build/tmp-sicom-glibc/sstate-control/manifest-x86_64_allarch-binutils-cross-i686.populate_sysroot 
not found in x86_64_allarch (variant '')?
WARNING: sicom-pos-initramfs-1.24-r0 do_package: Manifest 
/data/OE/sicom-manifest-2.5/build/tmp-sicom-glibc/sstate-control/manifest-x86_64_allarch-gcc-cross-i686.populate_sysroot 
not found in x86_64_allarch (variant '')?
WARNING: sicom-pos-initramfs-1.24-r0 do_package_write_ipk: Manifest 
/data/OE/sicom-manifest-2.5/build/tmp-sicom-glibc/sstate-control/manifest-x86_64_allarch-binutils-cross-i686.populate_sysroot 
not found in x86_64_allarch (variant '')?
WARNING: sicom-pos-initramfs-1.24-r0 do_package_write_ipk: Manifest 
/data/OE/sicom-manifest-2.5/build/tmp-sicom-glibc/sstate-control/manifest-x86_64_allarch-gcc-cross-i686.populate_sysroot 
not found in x86_64_allarch (variant '')?

Can it be worked around cleanly or are these warnings acceptable?

> 
> ERROR: Nothing RPROVIDES 'systemd' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> RDEPENDS on or otherwise requires it)
> systemd was skipped: missing required distro feature 'systemd' (not in
> DISTRO_FEATURES)
> 
> 
> 
>>   # This could be optimized a bit, but let's avoid non-booting systems :)
>> -RRECOMMENDS_${PN} = " \
>> +RRECOMMENDS_${PN}_class-target = " \
>>                        kernel-modules \
>>                        busybox \
>>                        coreutils \
>> +                     intel-microcode \
>>                       "
>> +
>> +BBCLASSEXTEND = "native"
>> --
>> 2.20.1
>>
> 


