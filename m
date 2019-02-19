Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 3FA867C893
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 08:43:10 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gw0zf-00053a-Pk; Tue, 19 Feb 2019 09:43:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s4liOmS8pOt4VuCXJLdb4u7zjppq3bLlramNPSvMykQ=;
	b=Q17Q5dampgmnXUvaZa65C1ruin
	ubUVcZP1QPtNTdikseeYlI8XmliLaR5I6aJyGd74uqF43Ga2IrRSkRuUVjpK8LK4O/0L3PrP8ry1Y
	E6MEJwIu348ZD39V4ZYIORgbwIqLL7K4QhW/fs/lc6kn/bKwIF16x8nBKANuFvy6ysGpBDjlQFZHG
	ZyywaiwsfTXIuFkVxt2llv2SjCTiQgnPBSKWVgw9nqKF2srG465ky3D2l045oXrEaTeDHyBHe05J3
	gLEGwsVEuZeS/zX4OHlFB+u81CNIVQ71Lk+3ABxqOwhkmXvvlxxIVm6Jz1tf7Xhch9sNYALkoJ/+D
	5AlgFMkA==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1gw0zb-0002Sr-ML; Tue, 19 Feb 2019 09:43:09 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20190216170354.10645-1-zboszor@pr.hu>
	<20190218104704.14623-1-zboszor@pr.hu>
	<CAMKF1spwdGaXKr51oZM-g5Pmw8jNsUQLOs=DRsOfD3pYfAYRZg@mail.gmail.com>
	<CAMKF1spGuo6q450qviwopWk4LMpqDNzVAgAUrQbLQPBwc-zyNw@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <6bc2f073-19bf-85c4-0f0f-581700557c4e@pr.hu>
Date: Tue, 19 Feb 2019 09:43:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spGuo6q450qviwopWk4LMpqDNzVAgAUrQbLQPBwc-zyNw@mail.gmail.com>
X-Spam-Score: -1.3 (-)
X-Scan-Signature: d44d414421fb166c200efb3fd2b2349e
X-Spam-Tracer: backend.mail.pr.hu -1.3 20190219084309Z
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 0/6 v2] Run dracut from rootfs
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
X-List-Received-Date: Tue, 19 Feb 2019 08:43:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2019. 02. 19. 8:14 keltezéssel, Khem Raj írta:
> more here
> 
> NOTE: Started PRServer with DBfile: /mnt/a/yoe/cache/prserv.sqlite3,
> IP: 127.0.0.1, PORT: 45089, PID: 43331
> Parsing recipes...done.
> Parsing of 3233 .bb files complete (0 cached, 3233 parsed). 4441
> targets, 574 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'plymouth-initrd' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'plymouth-initrd' is unbuildable, removing...

Questions:

1. What removes "initrd" from the plymouth PACKAGECONFIG for this setup?

2. Can a PACKAGECONFIG string of one recipe queried from another recipe?
    E.g. would bb.utils.contains("PACKAGECONFIG_pn-plymouth", ...) work
    from the dracut recipe if the variable does not exit at a layer level
    but only in a plymouth bbappend?

3. Would moving plymouth-initrd from RDEPENDS to RRECOMMENDS in the dracut
    recipe solve this problem? If not, why? intel-microcode is also in
    RRECOMMENDS, but it's mentioned in the errors below. Why?

> Missing or unbuildable dependency chain was: ['plymouth-initrd']
> NOTE: Runtime target 'dracut' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['dracut', 'plymouth-initrd']
> NOTE: Runtime target 'dracut-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['dracut-dev', 'plymouth-initrd']
> ERROR: Nothing RPROVIDES 'intel-microcode' (but
> /mnt/a/yoe/sources/meta-openembedded/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'intel-microcode' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['intel-microcode']
> 
> Build Configuration:
> BB_VERSION           = "1.40.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "arch"
> TARGET_SYS           = "arm-yoe-linux-musleabi"
> MACHINE              = "sama5d27-som1-ek-sd"
> DISTRO               = "yoe-musl-sysvinit-wayland"
> DISTRO_VERSION       = "2.6"
> TUNE_FEATURES        = "arm vfp cortexa5 neon vfpv4 thumb callconvention-hard"
> TARGET_FPU           = "hard"
> meta-yoe             = "yoe/mut:f14a20d6c6b23391aa0b8636d0b20752e074830a"
> meta-96boards        = "HEAD:6e8a11ea878698742e83832ef06df2c11604c338"
> meta-atmel           = "HEAD:ac803d348433d7755803f5429c7c40f4883a5ae4"
> meta-freescale       = "HEAD:2e83203ebd8439a45bc7a931ace6871e6b238658"
> meta-freescale-3rdparty = "HEAD:8b38f230d4d7cd6c283d75c17eddfbe51eca90a5"
> meta-odroid
> meta-odroid-extras   = "yoe/mut:688ff9c5f549f072af204ee64d5ad3ee18b9e47f"
> meta-qcom            = "yoe/mut:f708a3a9b6a61cd4d83a32dec4532453a127b54a"
> meta-raspberrypi     = "HEAD:6305aa7b693fb3423bd40921144666dadd7185b8"
> meta-riscv           = "yoe/mut:2ec848f8f37ea3c0d3538f32a59133294a9234cc"
> meta-ti              = "yoe/mut:04c4fef39d62396ea855b5f086a969269d740562"
> meta-browser         = "yoe/mut:974e22e9ffcba92a1d7e7aab90a6cb88b9c3e77f"
> meta-qt5             = "HEAD:fb71293f257c6fd02ccc06765a96dbf11d4569a0"
> meta-rust            = "HEAD:f4517aaba8026b44576c6407adf0175663d5a7b4"
> meta-filesystems
> meta-gnome
> meta-initramfs
> meta-multimedia
> meta-networking
> meta-oe
> meta-perl
> meta-python
> meta-webserver
> meta-xfce            = "yoe/mut:6adca5007190518de21ff406a141944c9d601588"
> meta                 = "yoe/mut:36242003ab8ff7e5dd93206ff672d92f9dbbd6e4"
> meta-clang           = "master:e96a34778c238692769c488fbe0d7781f0b929ce"
> workspace            = "kraj/master:8a94ccf193a33feb1546455fd190ac880ff66fb2"
> 
> On Mon, Feb 18, 2019 at 11:01 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> https://errors.yoctoproject.org/Errors/Details/228793/
>>
>> On Mon, Feb 18, 2019 at 2:47 AM Böszörményi Zoltán <zboszor@pr.hu> wrote:
>>>
>>> This patchset adds the necessary pieces to create the initramfs
>>> with dracut during do_rootfs.
>>>
>>> The 6th patch references a GitHub branch for which a pull request
>>> was made against dracut. See https://github.com/dracutdevs/dracut/pull/535
>>>
>>> Best regards,
>>> Zoltán Böszörményi
>>>
>>>
> 


