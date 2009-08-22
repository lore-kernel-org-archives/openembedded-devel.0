Received: from [209.85.216.177] (helo=mail-px0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mf07C-0007AV-Il
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Aug 2009 01:35:18 +0200
Received: by pxi7 with SMTP id 7so4972413pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 16:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=E5CMgrXPhfexUhKiYq27L0pFAwpgiEvccwP7+nbHIKU=;
	b=RgTAybRKzn214fq+Ta6NX9r2RWeqObWs0LKBzx2VJtfhrSSHIOXJM8UQYpQdnFzCmp
	kWP/XONWRLQs7jonZDqp6eOdpwaEVVVcRDgWRkTdAfr53UazMT1AVlAfHGqZ/y3awQ/o
	a4Svzw0n+DhpKlFMuWhNZ8ciQ1uWlbkeDnLRg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=aVMgOZoDSwqugCjpNJhpXraPGK1xrxASkKxVyjdcYu95jl2DkBTbx43/wl5/sSvFfC
	unH84i+9UHa+og3UpnymcO8MiG3KNcccc7E3d6aP50JLjyIr+UOWknMpyir/31LNrNyo
	kvcz9j+TqVRr/ys06Uz7Hm6jYd6celhXOodhg=
Received: by 10.114.214.22 with SMTP id m22mr4223791wag.218.1250983062973;
	Sat, 22 Aug 2009 16:17:42 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id j26sm5133718waf.63.2009.08.22.16.17.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 22 Aug 2009 16:17:41 -0700 (PDT)
Date: Sat, 22 Aug 2009 16:17:35 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090822231735.GA12848@gmail.com>
References: <4A8D4947.5030108@gmail.com>
	<200908201526.46349.holger+oe@freyther.de>
	<4A8D98FB.5000400@gmail.com>
	<200908210343.48652.holger+oe@freyther.de>
	<4A8F9BE3.1020606@gmail.com> <4A8FA20F.5050401@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4A8FA20F.5050401@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: LPC3250, helloworld-image, configure: error: cannot run C compiled programs
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
X-List-Received-Date: Sat, 22 Aug 2009 23:35:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/08/09 13:45), Dmitry Vinokurov wrote:
> Dmitry Vinokurov wrote:
> >Holger Hans Peter Freyther wrote:
> >>On Thursday 20 August 2009 20:42:03 Dmitry Vinokurov wrote:
> >>
> >>I will update the documentation with these bits:
> >>
> >>
> >>ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
> >>ASSUME_PROVIDED += " virtual/libc "
> >>ASSUME_PROVIDED += "linux-libc-headers "
> >>ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc "
> >>ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc-initial "
> >>ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc-intermediate "
> >>ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}binutils "
> >>ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}libc-for-gcc "
> >>ASSUME_PROVIDED += "virtual/libintl "
> >>ASSUME_PROVIDED += "virtual/libiconv "
> >>
> >>TARGET_PREFIX = "arm-linux-gnueabi-"
> >>ASSUME_SHLIBS = "libc.so.6:libc"
> >>
> >>
> >>The main difference are. Assume provided more
> >>binaries/libraries, use the TARGET_PREFIX instead of CC, CXX,
> >>NM....
> >>
> >>
> >>does this work any better?
> >>    z.
> >>
> >I changed my config according to your advises, final version
> >attached. Tried to build helloworld application: 'bitbake -v -DDD
> >helloworld', it compiles and runs on target board fine. Tried to
> >build linux kernel: 'bitbake -v -DDD linux-2.6.27', it fails with
> >--------
> >checking build system type... i686-pc-linux-gnu
> >checking host system type... i686-pc-linux-gnu
> >checking target system type... arm-oe-linux-gnueabi
> >checking for a BSD-compatible install... /home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/bin/install
> >-c
> >checking whether build environment is sane... yes
> >checking for a thread-safe mkdir -p... /home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/bin/mkdir
> >-p
> >checking for gawk... gawk
> >checking whether make sets $(MAKE)... yes
> >checking for i686-linux-gcc... /opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc
> >
> >checking for C compiler default output file name... a.out
> >checking whether the C compiler works... configure: error: cannot
> >run C compiled programs.
> >If you meant to cross compile, use `--host'.
> >See `config.log' for more details.
> >+ oefatal 'oe_runconf failed'
> >+ echo FATAL: 'oe_runconf failed'
> >FATAL: oe_runconf failed
> >+ exit 1
> >ERROR: function do_configure failed
> >ERROR: see log in /home/raydan/work/oe/build-linux/tmp/work/arm-oe-linux-gnueabi/module-init-tools-cross-3.2.2-r5/temp/log.do_configure.30320
> >
> >NOTE: Task failed: /home/raydan/work/oe/build-linux/tmp/work/arm-oe-linux-gnueabi/module-init-tools-cross-3.2.2-r5/temp/log.do_configure.30320
> >
> >ERROR: TaskFailed event exception, aborting
> >ERROR: Build of /home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb
> >do_configure failed
> >ERROR: Task 107 (/home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb,
> >do_configure) failed
> >NOTE: Tasks Summary: Attempted 86 tasks of which 21 didn't need to
> >be rerun and 1 failed.
> >ERROR: '/home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb'
> >failed
> >--------
> >
> >I.e. bitbake again confused cross-gcc and x86-gcc. Updated my OE
> >with git pull, removed tmp/ and made rebuild -- same result.
> Looks like error is in wrong ./configure parameter:
> --host=i686-linux instead of --host=arm-oe-linux-gnueabi .
> Now I'm trying to find, why --host was set to i686 and where it can
> be changed.

its a cross package so host being i686-linux (I suppose you are building
on i686 box) is ok. Look into the config.log error message should be in
there

-Khem


