Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M7cSd-0002oj-Lq
	for openembedded-devel@openembedded.org; Fri, 22 May 2009 23:39:28 +0200
Received: (qmail 31113 invoked from network); 22 May 2009 21:31:43 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 22 May 2009 14:31:43 -0700
Date: Fri, 22 May 2009 14:31:43 -0700
From: Tom Rini <trini@embeddedalley.com>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090522213142.GF23842@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Kernel recipes with broken PRs now
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
X-List-Received-Date: Fri, 22 May 2009 21:39:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey all.  With the MACHINE_KERNEL_PR stuff, the following recipes will
now revert to r0 rather than:
openembedded/recipes/linux$ grep -E "^PR[[:blank:]]+=" *.inc *.bb
gumstix-linux.inc:PR = "r1"
openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.inc:PR = "r46"
c7x0-kernels-2.4-embedix.bb:PR = "r1"
chumby-kernel_2.6.16-chumby-1.2.bb:PR = "r4"
collie-kernels-2.4-embedix.bb:PR = "r2"
compulab-pxa270_2.6.16.bb:PR = "r6"
devkitidp-pxa255_2.6.19.bb:PR = "r4"
em-x270_2.6.23.bb:PR = "r1"
ep93xx-kernel_2.6.17+2.6.18-rc1.bb:PR = "r1"
ep93xx-kernel_2.6.19+2.6.20-rc7.bb:PR = "r1"
fsg3-kernel_2.6.18.bb:PR = "r1.${IXP4XX_KERNEL_SVN_REV}"
ixp4xx-kernel_2.6.18.bb:PR = "r1.${IXP4XX_KERNEL_SVN_REV}"
ixp4xx-kernel_2.6.19.bb:PR = "r1.${IXP4XX_KERNEL_SVN_REV}"
ixp4xx-kernel_2.6.20.bb:PR = "r4.${IXP4XX_KERNEL_SVN_REV}"
ixp4xx-kernel_2.6.21.6.bb:PR = "r2.${IXP4XX_KERNEL_SVN_REV}"
ixp4xx-kernel_2.6.23.8.bb:PR = "r0.${IXP4XX_KERNEL_SVN_REV}"
linux_2.6.20.bb:PR = "r8"
linux_2.6.21+2.6.22-rc1.bb:PR = "r2"
linux_2.6.21.bb:PR = "r12"
linux_2.6.22+2.6.23-rc3.bb:PR = "r1"
linux_2.6.22+2.6.23-rc5.bb:PR = "r1"
linux_2.6.22.6.bb:PR = "r1"
linux_2.6.22.bb:PR = "r5"
linux_2.6.23+2.6.24-rc5.bb:PR = "r3"
linux_2.6.23.bb:PR = "r12"
linux_2.6.24.bb:PR = "r31"
linux_2.6.25.20.bb:PR = "r2"
linux_2.6.25.bb:PR = "r6"
linux_2.6.26.bb:PR = "r9"
linux_2.6.27.bb:PR = "r8"
linux_2.6.28.bb:PR = "r8"
linux_2.6.28-rc6.bb:PR = "r3"
linux_2.6.29+2.6.30-rc4.bb:PR = "r1"
linux_2.6.29+2.6.30-rc5.bb:PR = "r1"
linux_2.6.29.bb:PR = "r4"
linux-bd-neon-2.6_2.6.22.bb:PR = "r2"
linux-bug_2.6.27.2.bb:PR = "r27"
linux-davinci_2.6.25.bb:PR = "r3"
linux-davinci_git.bb:PR = "r4"
linux-dht-walnut_2.6.20.bb:PR = "r4"
linux-efika_2.6.18+2.6.19-rc6.bb:PR = "r3"
linux-efika_2.6.20.20.bb:PR = "r2"
linux-efika_2.6.20.bb:PR = "r2"
linux-epia_2.6.19.2.bb:PR = "r1"
linux-epia_2.6.8.1.bb:PR = "r15"
linux-eten_2.6.28-rc4+git.bb:PR = "r2"
linux-gumstix_2.6.15.bb:PR = "r2"
linux-h1940_2.6.17-h1940.bb:PR = "r1"
linux-hackndev-2.6_git.bb:PR = "r14"
linux-handhelds-2.6_2.6.17-hh4.bb:PR = "r1"
linux-handhelds-2.6_2.6.19-hh13.bb:PR = "r1"
linux-handhelds-2.6_2.6.20-hh10.bb:PR = "r1"
linux-handhelds-2.6_2.6.21-hh20.bb:PR = "r25"
linux-ixp4xx_2.6.24.7.bb:PR = "r1"
linux-ixp4xx_2.6.27.8.bb:PR = "r2"
linux-jlime-current.bb:PR = "r1"
linux-magicbox_2.6.18.6.bb:PR = "r2"
linux-magicbox_2.6.19.2.bb:PR = "r3"
linux-ml403-mvista-2.6.x_git.bb:PR = "r1"
linux-msm7xxxx_git.bb:PR = "r13"
linux-mtx-1_2.4.27.bb:PR = "r11"
linux-mtx-1u_2.4.27.bb:PR = "r11"
linux-mtx-2_2.4.27.bb:PR = "r11"
linux-mtx-3_2.6.15.4.bb:PR = "r11"
linux-mtx-3_2.6.15.bb:PR = "r11"
linux-n1200_2.6.27-rc9+git.bb:PR = "r3"
linux-neuros_2.6.15.bb:PR = "r5"
linux-neuros_git.bb:PR = "r14"
linux-nokia800_2.6.18-osso40.bb:PR = "r5"
linux-nokia800_2.6.21-osso71.bb:PR = "r5"
linux-omap1_2.6.12-rc2.bb:PR = "r4"
linux-omap1_2.6.18+git.bb:PR = "r2"
linux-omap_2.6.26.bb:PR = "r65"
linux-omap_2.6.27.bb:PR = "r14"
linux-omap2_git.bb:PR = "r64"
linux-omap-pm_2.6.28.bb:PR = "r7"
linux-openmoko-2.6.24_git.bb:PR = "r1"
linux-openmoko-devel_git.bb:PR = "r1"
linux-palm-omap1_2.6.22-omap1.bb:PR = "r2"
linux-rp_2.6.23.bb:PR = "r35"
linux-rp_2.6.24.bb:PR = "r22"
linux-rp_2.6.25+2.6.26-rc4.bb:PR = "r6"
linux-rp_2.6.26.bb:PR = "r11"
linux-rt_2.6.24.bb:PR = "r9"
linux-rt_2.6.25.bb:PR = "r4"
linux-smdk2440_2.6.20+git.bb:PR = "r1"
linux-smdk2443_2.6.20+git.bb:PR = "r1"
linux-storcenter_2.6.27.7.bb:PR = "r2"
linux-sun4cdm_2.6.8.1.bb:PR = "r1"
linux-tornado-omap2_2.6.16.16.bb:PR = "r1"
linux-turbostation_2.6.20.2.bb:PR = "r2"
linux-wrt_2.4.20.bb:PR = "r1"
linux-wrt_2.4.30.bb:PR = "r2"
linux-x86_2.6.17.9.bb:PR = "r2"
linux-x86_2.6.20.bb:PR = "r5"
linux-xilinx-slab_git.bb:PR = "r3"
logicpd-pxa270_2.6.17-rc5.bb:PR = "r3"
logicpd-pxa270_2.6.19.2.bb:PR = "r1"
mainstone-kernel_2.6.11.bb:PR = "r1"
mainstone-kernel_2.6.18.bb:PR = "r2"
mnci-ramses_2.4.21-rmk2-pxa1.bb:PR = "r5"
mx21ads-kernel_2.6.19rc6.bb:PR = "r2"
mx31ads-kernel_2.6.19rc6.bb:PR = "r3"
netbook-pro-kernel_2.6.17.bb:PR = "r2"
openezx-kernel_git.bb:PR = "r3"
opensimpad_2.4.25-vrs2-pxa1-jpm1.bb:PR = "r22"
opensimpad_2.4.27-vrs1-pxa1-jpm1.bb:PR = "r4"
openzaurus-pxa27x_2.4.20-rmk2-embedix20050602.bb:PR = "r18"
openzaurus-sa_2.4.18-rmk7-pxa3-embedix20030509.bb:PR = "r23"
xanadux-un-2.6_2.6.12.bb:PR ="r2"

In current .dev.

-- 
Tom Rini


