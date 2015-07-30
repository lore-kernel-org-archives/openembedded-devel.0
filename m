Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8044C6E630;
	Thu, 30 Jul 2015 20:58:48 +0000 (UTC)
Received: by lbqc9 with SMTP id c9so9415779lbq.1;
	Thu, 30 Jul 2015 13:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=66sZk2zmS1cVWrU4jnHKw5C40YDkZqT4EzLs52F1pdo=;
	b=jz34J21qZLI2V97PLiriaDhy1Zs0s3PRF4mkwQmicCufzQHQXmmpE18/96EC2bFi6S
	aB2+BYVSDBV2aZkOiLItnGsfPgvUaib8szHzGyRksMGG0yG/lCYHNX8ms6dAb9EQ1Q7I
	I1W1lesRA1kFAXHVx7VOBIo0AiCBGKziA3DD5YvWzuDCfvAnF0O6D2FvdPobF4oQd21e
	/9mTQAh9oICmHA5dMnFIZJki2JgwZpkrXEq3k+3U1mGpWAenRYGsmGaOCTlbsOD39eNA
	lamJCOJhkMf/jJBHfUXFWKkS2FqmX6oxz4ScLGPoaFAAEvKq/BwDWzaTGMQzSxkIIYD4
	DzMw==
MIME-Version: 1.0
X-Received: by 10.152.234.42 with SMTP id ub10mr45219590lac.60.1438289927732; 
	Thu, 30 Jul 2015 13:58:47 -0700 (PDT)
Received: by 10.25.28.69 with HTTP; Thu, 30 Jul 2015 13:58:47 -0700 (PDT)
In-Reply-To: <20150730180140.GN2457@jama>
References: <20150730180140.GN2457@jama>
Date: Thu, 30 Jul 2015 13:58:47 -0700
Message-ID: <CANx9H-B6493-JS0RjXujBR-HVC0XVLNSajB5sD59aOgcOHe5AA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2015-07-29
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jul 2015 20:58:52 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 30, 2015 at 11:01 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> I have tried to move failing meta-oe pending patches to
> contrib/jansa/master-next-unresolved-review but there is still
> too many issues, if nobody steps-up to fix some of them I'll
> add more PNBLACKLISTs next week.
>
> OE @ ~/openembedded-core $ git log --oneline origin/master..jansa/master
> d9caaef guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable
> thumb where it fails for qemuarm
> d5d329c initramfs-framework: Drop allarch
> 72aff24 linux-firmware: Drop allarch
> 9b44610 ppp-dialin: Drop allarch
> 87fccbb usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
> 451fbad resolvconf: Drop allarch
> af1fb2d icu: force arm mode
> 0705b85 gdb: force arm mode
> ae88c77 DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
> fff2944 libsdl: Add support for libsdl-native
> d7efb06 WIP: Add KERNEL_EXTRA_ARGS?
> d7ecccc sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
> 453cd75 report-error: Allow to upload reports automatically
> 6c27943 qemux86: Add identical qemux86copy variant for tests
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2015-07-29 ==
>
> INFO: jenkins-job.sh-1.3.1 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150730_174523.log
>
> === common (12) ===
>     * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
>     * /meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/
> smbnetfs_git.bb, do_configure
>     * /meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb,
> do_compile
>     * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/
> mkvtoolnix_git.bb, do_compile
>     * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/
> vlc_2.1.4.bb, do_compile
>
I will try again to reproduce the error. Upstream is at 2.2.1... time
permitting.

    * /meta-openembedded/meta-networking/recipes-connectivity/crda/
> crda_3.18.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb,
> do_compile
>     * /meta-openembedded/meta-oe/recipes-support/imagemagick/
> imagemagick_6.9.1.bb, do_fetch
>     * /meta-openembedded/meta-perl/recipes-perl/libextutils/
> libextutils-cppguess-perl_0.07.bb, do_configure
>
I will see if the 0.09 version can be built without Module::Build (since
oe-core moved to perl 5.22 it is not available anymore :(
It looks like it only depends on Module::Build for testing.

    * /meta-openembedded/meta-perl/recipes-perl/libmodule/
> libmodule-pluggable-perl_5.1.bb, do_configure
>
This has not been updated to use ExtUtils::MakeMaker so configuration
depends on Module::Build
I will try to find time to put a libmodule-build-perl recipe into
oe-core... or perhaps a patch to use ExtUtils::MakeMaker...or
Module::Build::Tiny


>     * /meta-openembedded/meta-perl/recipes-perl/libmodule/
> libmodule-runtime-perl_0.014.bb, do_configure
>
same as libmodule-pluggable-perl ;(


> [...]


--Tim

