Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OYzeD-0000hp-D7
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 12:57:12 +0200
Received: from [192.168.10.100] (95.232.142.62) by smtp208.alice.it
	(8.5.124.08) (authenticated as editempo)
	id 4C1A271601C58F77 for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 12:51:45 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100711145445.r2ay8zxe1wwoggoc@webmail.htc-linux.org>
References: <20100711145445.r2ay8zxe1wwoggoc@webmail.htc-linux.org>
Date: Wed, 14 Jul 2010 07:53:41 +0200
Message-ID: <1279086821.2869.8.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 82.57.200.104
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_03_06 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xf86-video-msm
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
X-List-Received-Date: Wed, 14 Jul 2010 10:57:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-07-11 at 14:54 +0100, lukas gorris wrote:
> Hello,
> 
> As I was told the bugtracker is not frequented much, I am taking the  
> liberty to quote
> from oebug http://bugs.openembedded.org/show_bug.cgi?id=5451 in the  
> following :
> 
> Project Website:
> 
> https://www.codeaurora.org/contribute/projects/xwinp/
> 
> 
> Problem:
> 
> currently xf86-video-msm is only confirmed to compile on armv6-novfp htcdream
> device. htcdream selects patches to remove the neon support and other stuff
> from the driver that is actually designed for the cortex-a8 based qualcomm
> qsd8xxxx.
> 
> Building for the htc-qsd8 htcleo machine in current org.openembedded.dev
> revision it fails.
> 
> 
> 
> Recipe:
> 
> require xorg-driver-video.inc
> DESCRIPTION = "X.Org X server -- MSM display driver"
> PE = "1"
> PV = "1.1.0+${PR}+gitr${SRCREV}"
> PR = "${INC_PR}.0"
> 
> SRC_URI =
> "git://codeaurora.org/quic/xwin/xf86-video-msm.git;protocol=git;branch=chromium
> \
>             file://compile_cfbbd17f0d4ab0f30915594d74e1b2b12c4ff8a1.patch \
>             file://kgsl_drm.h "
> SRC_URI_append_htcdream =
> "file://no_neon_cfbbd17f0d4ab0f30915594d74e1b2b12c4ff8a1.patch"
> 
> SRCREV = "cfbbd17f0d4ab0f30915594d74e1b2b12c4ff8a1"
> S = "${WORKDIR}/git"
> 
> do_compile_prepend() {
>          install -d ${S}/src/linux
>          install -d ${S}/src/drm
>          install -m 0644 ${STAGING_KERNEL_DIR}/include/linux/msm_mdp.h
> ${S}/src/linux/
>          install -m 0644 ${WORKDIR}/kgsl_drm.h ${S}/src/drm/
> }
> 
> PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> ARM_INSTRUCTION_SET = "arm"
> 
> CFLAGS += " -I${STAGING_INCDIR}/xorg "
> CFLAGS += " -Wno-error "
> 
> 
> Error:
> 
> | msm-driver.c: In function 'MSMPreInit':
> | msm-driver.c:413: error: 'MSMFB_RESUME_SW_REFRESHER' undeclared  
> (first use in
> this function)
> | msm-driver.c:413: error: (Each undeclared identifier is reported only once
> | msm-driver.c:413: error: for each function it appears in.)
> | msm-driver.c:624: error: 'MDP_FB_PAGE_PROTECTION_WRITETHROUGHCACHE'
> undeclared (first use in this function)
> | make[2]: *** [msm-driver.lo] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | mv -f .deps/msm-exa-mixed.Tpo .deps/msm-exa-mixed.Plo
> | mv -f .deps/msm-exa.Tpo .deps/msm-exa.Plo
> | mv -f .deps/msm-exa-neon.Tpo .deps/msm-exa-neon.Plo
> | make[2]: Leaving directory
> `/media/lenny/home/luke-g/build/openembedded/tmp/work/htcleo-angstrom-linux-gnueabi/xf86-video-msm-1_1.1.0+r14.0+gitrcfbbd17f0d4ab0f30915594d74e1b2b12c4ff8a1-r14.0/git/src'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/media/lenny/home/luke-g/build/openembedded/tmp/work/htcleo-angstrom-linux-gnueabi/xf86-video-msm-1_1.1.0+r14.0+gitrcfbbd17f0d4ab0f30915594d74e1b2b12c4ff8a1-r14.0/git'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> 
> It seems like it is missing some variables from the msm_fb driver inside the
> kernel. Currently the recipe installs parts from it (include/linux/msm_mdp.h,
> kgsl_drm.h) . I am not sure if it is taken from the right kernel source as
> there are quite some different versions of both, xf86-video-msm and msm_fb
> driver..
> Maybe for the above error we just need to add an additional header file. I
> searched for the missing defines in the current kernel branch for htcleo at
> http://linuxtogo.org/cgi-bin/gitweb.cgi?p=groups/mobile-linux/kernel.git;a=shortlog;h=refs/heads/htc-msm-2.6.32
>   but could not find them.
Sorry I can't look I'm offline.
> I guess this means we need to
> 
> *pick a different/older version of the xf86-video-msm to match htcleo  
> kernel or
*I had some issues with garbage on screen with gtk+ with older versions
*it may not fix the issue
> *find correct kernel tree which has the missing defines and try putting the
> headers and still use unmodified kernel on device or
look at codeaurora's kernel,and grep for the missing defines.
> *patch the kernel with matching msm_fb version
should work but you could also patch xf86-video-msmfb
> It might be a good approach to cleanly start over with the recipe for both
> machines.
> 
> Different kernel versions for the qsd8 devices are available at
> https://www.codeaurora.org/gitweb/quic/kernel/
> Like I mentioned I have no clue which xf86-video-msm version matches which
> drivers/video/msm version. I can't see where this is documented.
> 
> On a side note, I tried to compile xf86-video-msm manually outside of  
> OE but it
> did not compile. And I am very puzzled about the total lack of information on
> kernel in the README
> https://www.codeaurora.org/gitweb/quic/xwin/?p=xf86-video-msm.git;a=blob;f=README;h=c38a80e901d0ff033c39ac157cdfb80530b4830a;hb=refs/heads/chromium
> 
> As this a bit out of my league I will be happy about any comment.
> 
> 

btw: I abandoned the recipe before fully fixing it.
You should make your kernel stage the headers instead of using my copied
header files.


> Best regards,
> 
> Lukas
Denis.




