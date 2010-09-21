Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Oy7ae-00015c-3p
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 20:29:23 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9400BCW0NL4KYW@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	21 Sep 2010 13:28:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0FC2214AF64; Tue,
	21 Sep 2010 14:28:33 -0400 (EDT)
Date: Tue, 21 Sep 2010 14:28:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100921182833.GB11562@denix.org>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
	<AANLkTim57opnM=fn47pQ-GeNsNbSyydHd3TKSWhdD5z5@mail.gmail.com>
	<AANLkTikyFRQskds_P9AH+=_km46KEf1cPm-Vq1+MhdhC@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFA4A2@dlee06.ent.ti.com>
	<AANLkTik599XZfY1Abq+gdDqGSOOLnqHUiqL1VVK9Rh87@mail.gmail.com>
	<20100910185711.GG28148@denix.org>
	<AANLkTimyXbmVN0P9pNXKhoxOoNRrnpxKUUqCsuwD=p1B@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTimyXbmVN0P9pNXKhoxOoNRrnpxKUUqCsuwD=p1B@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make	it global
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
X-List-Received-Date: Tue, 21 Sep 2010 18:29:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Sep 12, 2010 at 09:40:30AM +0200, Frans Meulenbroeks wrote:
> 2010/9/10 Denys Dmytriyenko <denis@denix.org>:
> :>
> > Frans,
> >
> > I guess then you haven't read the original discussion closely enough. Chase
> > only made a change to add existing SOC_FAMILY override into COMPATIBLE_MACHINE
> > variable... I keep repeating myself - SOC_FAMILY feature is about a year old.
> > It was introduced as part of a large merge from Arago. Here is the original
> > commit and some description:
> >
> > http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b788499815bfc1974d4277c0a261b9a7c24aa816

Frans,

Sorry for the delay in replying - I was awfully busy lately.
And thank you for your continuing interest in SOC_FAMILY feature. :)

> I did some more research on this, as I could not recall any specific info.
> The patch you give above is from dec, so 9 months old.

Since it was a merge from arago, you can add couple more months for the 
design and initial implementation... :)

> At that time it was not discussed at the mailing list as far as I can
> see. As the commit message said "recipes/ti: merge in updates"
> I (and I guess most of the non-ti devs) gave little attention to it.
> 
> Also I did a quick grep on the source tree. Currently it is only used
> in the following files
> 
> frans@linux-suse:~/oe/openembedded> grep -r SOC_FAMILY .
> ./conf/local.conf:SOC_FAMILY_local = "none"
> ./conf/distro/include/angstrom.inc:SOC_FAMILY ?= "Unknown"
> ./conf/distro/include/angstrom.inc:# Add FEED_ARCH and SOC_FAMILY to overrides
> ./conf/distro/include/angstrom.inc:OVERRIDES .= ":${FEED_ARCH}:${SOC_FAMILY}"
> ./conf/machine/include/dm6467.inc:SOC_FAMILY = "dm6467"
> ./conf/machine/include/omap3.inc:SOC_FAMILY = "omap3"
> ./conf/machine/include/omapl137.inc:SOC_FAMILY = "omapl137"
> ./conf/machine/include/dm365.inc:SOC_FAMILY = "dm365"
> ./conf/machine/include/dm6446.inc:SOC_FAMILY = "dm6446"
> ./conf/machine/include/dm355.inc:SOC_FAMILY = "dm355"
> ./conf/machine/include/omapl138.inc:SOC_FAMILY = "omapl138"
> ./recipes/ti/ti-linuxutils.inc:    case ${SOC_FAMILY} in
> ./recipes/ti/ti-linuxutils.inc:    if [ ${SOC_FAMILY} == "dm365" ] ; then
> ./recipes/ti/ti-local-power-manager.inc:# SOC_FAMILY configuration
> ./recipes/ti/ti-codec-engine.inc:# SOC_FAMILY configuration
> ./recipes/ti/ti-dsplink.inc:# SOC_FAMILY configuration
> ./classes/base.bbclass:                this_soc_family =
> bb.data.getVar('SOC_FAMILY', d, 1)

That is not a correct assessment. As you see, SOC_FAMILY is a variable, which 
being mostly used in overrides, so it is referenced not by variable name, but 
by its value. See a more accurate grep below...

> Anyway, wrt the breakage, I'll push the patch for now as it has been
> out for review quite a while (and I got an ack and a looks good).
> If SOC_FAMILY is not desired we can also revert that one.

Thank you for taking care of the fix.

$ grep '[_:\"|]\(omap3\|omapl137\|omapl138\|dm355\|dm365\|dm6446\|dm6467\)[ :\"|]' . -r|grep -v -e '.patch' -e '.diff'
conf/machine/include/omapl137.inc:SOC_FAMILY = "omapl137"
conf/machine/include/dm6467.inc:SOC_FAMILY = "dm6467"
conf/machine/include/omap3.inc:SOC_FAMILY = "omap3"
conf/machine/include/dm355.inc:SOC_FAMILY = "dm355"
conf/machine/include/dm365.inc:SOC_FAMILY = "dm365"
conf/machine/include/omapl138.inc:SOC_FAMILY = "omapl138"
conf/machine/include/dm6446.inc:SOC_FAMILY = "dm6446"
conf/machine/nokia900.conf:SOC_FAMILY = "omap3"
conf/distro/include/angstrom-codec-engine-2.25.02-preferred-versions.inc:PREFERRED_VERSION_ti-codecs_omapl137 = "1_00_00"
conf/distro/include/angstrom-codec-engine-2.25.02-preferred-versions.inc:PREFERRED_VERSION_ti-codecs_omapl138 = "1_00_00"
conf/distro/include/angstrom-codec-engine-latestproduction-preferred-versions.inc:PREFERRED_VERSION_ti-codecs_omapl137 = "1_00_00"
conf/distro/include/angstrom-codec-engine-latestproduction-preferred-versions.inc:PREFERRED_VERSION_ti-codecs_omapl138 = "1_00_00"
conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc:PREFERRED_VERSION_ti-codecs_omapl137 = "1_00_00"
conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc:PREFERRED_VERSION_ti-codecs_omapl138 = "1_00_00"
conf/distro/include/angstrom-codec-engine-2.25.01-preferred-versions.inc:PREFERRED_VERSION_ti-codecs_omapl137 = "1_00_00"
conf/distro/include/angstrom-codec-engine-2.25.01-preferred-versions.inc:PREFERRED_VERSION_ti-codecs_omapl138 = "1_00_00"
docs/usermanual/chapters/common_use_cases.xml:            "omap3" and this value can be used in overrides to prevent
recipes/ti/ti-audio-soc-example.inc:PLATFORM_da830-omapl137-evm = "omapl137" 
recipes/ti/ti-audio-soc-example.inc:PLATFORM_da850-omapl138-evm = "omapl138" 
recipes/ti/ti-codecs-omap3530_1.01.00.bb:DSPSUFFIX_omap3 = "x64P"
recipes/ti/ti-dmai.inc:DEPENDS_append_dm6446 	= " ti-codecs-dm6446   ti-dspbios ti-cgt6x ti-linuxutils"
recipes/ti/ti-dmai.inc:DEPENDS_append_dm6467 	= " ti-codecs-dm6467   ti-dspbios ti-cgt6x ti-linuxutils"
recipes/ti/ti-dmai.inc:DEPENDS_append_omap3    = " ti-codecs-omap3530 ti-dspbios ti-cgt6x ti-linuxutils"
recipes/ti/ti-dmai.inc:DEPENDS_append_dm355  	= " ti-codecs-dm355"
recipes/ti/ti-dmai.inc:DEPENDS_append_dm365    = " ti-codecs-dm365"
recipes/ti/ti-dmai.inc:DEPENDS_append_omapl137 = " ti-codecs-omapl137 ti-dspbios ti-cgt6x ti-linuxutils"
recipes/ti/ti-dmai.inc:DEPENDS_append_omapl138 = " ti-codecs-omapl138 ti-dspbios ti-cgt6x ti-linuxutils"
recipes/ti/ti-dmai.inc:DMAIPLATFORM_dm6446    = "dm6446_al"
recipes/ti/ti-dmai.inc:DMAIPLATFORM_dm6467    = "dm6467_al"
recipes/ti/ti-dmai.inc:DMAIPLATFORM_omap3     = "o3530_al"
recipes/ti/ti-dmai.inc:DMAIPLATFORM_dm355     = "dm355_al"
recipes/ti/ti-dmai.inc:DMAIPLATFORM_dm365     = "dm365_al"
recipes/ti/ti-dmai.inc:DMAIPLATFORM_omapl137  = "ol137_al"
recipes/ti/ti-dmai.inc:DMAIPLATFORM_omapl138  = "ol138_al"
recipes/ti/ti-dmai.inc:#GPPOS_dm355      = "LINUX_GCC"
recipes/ti/ti-dmai.inc:#GPPOS_dm365      = "LINUX_GCC"
recipes/ti/ti-dmai.inc:RDEPENDS_ti-dmai-apps_dm6446    += "ti-codecs-dm6446-server   ti-cmem-module ti-dsplink-module"
recipes/ti/ti-dmai.inc:RDEPENDS_ti-dmai-apps_dm6467    += "ti-codecs-dm6467          ti-cmem-module ti-dsplink-module"
recipes/ti/ti-dmai.inc:RDEPENDS_ti-dmai-apps_omap3     += "ti-codecs-omap3530-server ti-cmem-module ti-dsplink-module ti-lpm-module ti-sdma-module"
recipes/ti/ti-dmai.inc:RDEPENDS_ti-dmai-apps_dm355     += "ti-codecs-dm355           ti-cmem-module ti-dm355mm-module"
recipes/ti/ti-dmai.inc:RDEPENDS_ti-dmai-apps_dm365     += "ti-codecs-dm365           ti-cmem-module ti-dm365mm-module ti-edma-module ti-irq-module"
recipes/ti/ti-dmai.inc:RDEPENDS_ti-dmai-apps_omapl137  += "ti-codecs-omapl137-server ti-cmem-module ti-dsplink-module"
recipes/ti/ti-dmai.inc:RDEPENDS_ti-dmai-apps_omapl138  += "ti-codecs-omapl138-server ti-cmem-module ti-dsplink-module"
recipes/ti/gstreamer-ti.inc:PLATFORM_dm6446        = "dm6446"
recipes/ti/gstreamer-ti.inc:PLATFORM_dm6467        = "dm6467"
recipes/ti/gstreamer-ti.inc:PLATFORM_omap3         = "omap3530"
recipes/ti/gstreamer-ti.inc:PLATFORM_dm355         = "dm355"
recipes/ti/gstreamer-ti.inc:PLATFORM_dm365         = "dm365"
recipes/ti/gstreamer-ti.inc:PLATFORM_omapl137      = "omapl137"
recipes/ti/gstreamer-ti.inc:PLATFORM_omapl138      = "omapl138"
recipes/ti/gstreamer-ti.inc:XDC_PLATFORM_dm6446    = "ti.platforms.evmDM6446"
recipes/ti/gstreamer-ti.inc:XDC_PLATFORM_dm6467    = "ti.platforms.evmDM6467"
recipes/ti/gstreamer-ti.inc:XDC_PLATFORM_omap3     = "ti.platforms.evm3530"
recipes/ti/gstreamer-ti.inc:XDC_PLATFORM_dm355     = "ti.platforms.evmDM355"
recipes/ti/gstreamer-ti.inc:XDC_PLATFORM_dm365     = "ti.platforms.evmDM365"
recipes/ti/gstreamer-ti.inc:XDC_PLATFORM_omapl137  = "ti.platforms.evmOMAPL137"
recipes/ti/gstreamer-ti.inc:XDC_PLATFORM_omapl138  = "ti.platforms.evmOMAPL138"
recipes/ti/gstreamer-ti.inc:RRECOMMENDS_${PN}_append_dm6446    += "ti-codecs-dm6446-server   ti-cmem-module ti-dsplink-module"
recipes/ti/gstreamer-ti.inc:RRECOMMENDS_${PN}_append_dm6467    += "ti-codecs-dm6467          ti-cmem-module ti-dsplink-module"
recipes/ti/gstreamer-ti.inc:RRECOMMENDS_${PN}_append_omap3     += "ti-codecs-omap3530-server ti-cmem-module ti-dsplink-module ti-lpm-module ti-sdma-module"
recipes/ti/gstreamer-ti.inc:RRECOMMENDS_${PN}_append_dm355     += "ti-codecs-dm355           ti-cmem-module ti-dm355mm-module"
recipes/ti/gstreamer-ti.inc:RRECOMMENDS_${PN}_append_dm365     += "ti-codecs-dm365           ti-cmem-module ti-dm365mm-module ti-edma-module ti-irq-module"
recipes/ti/gstreamer-ti.inc:RRECOMMENDS_${PN}_append_omapl137  += "ti-codecs-omapl137-server ti-cmem-module ti-dsplink-module"
recipes/ti/gstreamer-ti.inc:RRECOMMENDS_${PN}_append_omapl138  += "ti-codecs-omapl138-server ti-cmem-module ti-dsplink-module"
recipes/ti/gstreamer-ti_svn.bb:SRC_URI_append_dm365 = " file://loadmodules.sh"
recipes/ti/gstreamer-ti_svn.bb:SRC_URI_append_omapl137 = " file://loadmodules.sh"
recipes/ti/gstreamer-ti_svn.bb:SRC_URI_append_omapl138 = " file://loadmodules.sh "
recipes/ti/gstreamer-ti_svn.bb:SRC_URI_append_omap3 = " file://loadmodules.sh "
recipes/ti/ti-codecs-dm6467_1.00.00.03.bb:DSPSUFFIX_dm6467 = "x64P"
recipes/ti/ti-codec-engine.inc:DEPENDS_append_dm6446 	= " ti-dspbios ti-dsplink ti-local-power-manager ti-cgt6x ti-biosutils ti-edma3lld"
recipes/ti/ti-codec-engine.inc:DEPENDS_append_dm6467 	= " ti-dspbios ti-dsplink ti-cgt6x ti-biosutils ti-edma3lld"
recipes/ti/ti-codec-engine.inc:DEPENDS_append_omapl137 = " ti-dspbios ti-dsplink ti-cgt6x ti-biosutils ti-edma3lld"
recipes/ti/ti-codec-engine.inc:DEPENDS_append_omapl138 = " ti-dspbios ti-dsplink ti-cgt6x ti-biosutils ti-edma3lld"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESDEVICES_dm6446     = "DM6446"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESDEVICES_dm6467     = "DM6467"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESDEVICES_omap3      = "OMAP3530"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESDEVICES_dm355      = "DM355"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESDEVICES_dm365      = "DM365"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESDEVICES_omapl137   = "OMAPL137"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESDEVICES_omapl138   = "OMAPL138"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESGPPOS_dm6446       = "LINUX_GCC"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESGPPOS_dm6467       = "LINUX_GCC"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESGPPOS_omap3        = "LINUX_GCC"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESGPPOS_dm355        = "LINUX_GCC"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESGPPOS_dm365        = "LINUX_GCC"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESGPPOS_omapl137     = "LINUX_GCC"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESGPPOS_omapl138     = "LINUX_GCC"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESPROGRAMS_dm6446    = "APP_CLIENT DSP_SERVER"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESPROGRAMS_dm6467    = "APP_CLIENT DSP_SERVER"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESPROGRAMS_omap3     = "APP_CLIENT DSP_SERVER"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESPROGRAMS_dm355     = "APP_LOCAL"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESPROGRAMS_dm365     = "APP_LOCAL"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESPROGRAMS_omapl137  = "APP_CLIENT DSP_SERVER"
recipes/ti/ti-codec-engine.inc:CEEXAMPLESPROGRAMS_omapl138  = "APP_CLIENT DSP_SERVER"
recipes/ti/ti-codec-engine.inc:RDEPENDS_ti-codec-engine-examples_append_dm6446   = " ti-dsplink-module ti-lpm-module"
recipes/ti/ti-codec-engine.inc:RDEPENDS_ti-codec-engine-examples_append_dm6467   = " ti-dsplink-module"
recipes/ti/ti-codec-engine.inc:RDEPENDS_ti-codec-engine-examples_append_omap3    = " ti-dsplink-module ti-lpm-module"
recipes/ti/ti-codec-engine.inc:RDEPENDS_ti-codec-engine-examples_append_omapl137 = " ti-dsplink-module"
recipes/ti/ti-codec-engine.inc:RDEPENDS_ti-codec-engine-examples_append_omapl138 = " ti-dsplink-module"
recipes/ti/ti-codecs-omapl137_1.00.00.bb:DSPSUFFIX_omapl137 = "x64P"
recipes/ti/ti-dvsdk-demos.inc:DEMOSPLATFORM_dm355    = "dm355"
recipes/ti/ti-dvsdk-demos.inc:DEMOSPLATFORM_dm365    = "dm365"
recipes/ti/ti-dvsdk-demos.inc:DEMOSPLATFORM_dm6446   = "dm6446"
recipes/ti/ti-dvsdk-demos.inc:DEMOSPLATFORM_dm6467   = "dm6467"
recipes/ti/ti-dvsdk-demos.inc:DEMOSPLATFORM_omap3    = "omap3530"
recipes/ti/ti-dvsdk-demos.inc:DEMOSPLATFORM_omapl137 = "ol137"
recipes/ti/ti-dvsdk-demos.inc:DEMOSPLATFORM_omapl138 = "ol138"
recipes/ti/ti-dvsdk-demos.inc:RDEPENDS_ti-dvsdk-demos_dm355 += "ti-dm355mm-module ti-cmem-module alsa-lib libpng freetype jpeg libpng12"
recipes/ti/ti-dvsdk-demos.inc:RDEPENDS_ti-dvsdk-demos_dm365 += "ti-dm365mm-module ti-cmem-module alsa-lib libpng freetype jpeg ti-codecs-dm365 ti-edma-module ti-irq-module libpng12"
recipes/ti/ti-linuxutils.inc:    if [ ${SOC_FAMILY} == "dm365" ] ; then
recipes/ti/ti-dsplink.inc:DSPLINKPLATFORM_dm6446    = "DAVINCI"
recipes/ti/ti-dsplink.inc:DSPLINKPLATFORM_dm6467    = "DAVINCIHD"
recipes/ti/ti-dsplink.inc:DSPLINKPLATFORM_omapl137  = "OMAPL1XX"
recipes/ti/ti-dsplink.inc:DSPLINKPLATFORM_omapl138  = "OMAPL138"
recipes/ti/ti-dsplink.inc:DSPLINKPLATFORM_omap3     = "OMAP3530"
recipes/ti/ti-dsplink.inc:DSPLINKDSPCFG_dm6446      = "DM6446GEMSHMEM"
recipes/ti/ti-dsplink.inc:DSPLINKDSPCFG_dm6467      = "DM6467GEMSHMEM"
recipes/ti/ti-dsplink.inc:DSPLINKDSPCFG_omapl137    = "OMAPL1XXGEMSHMEM"
recipes/ti/ti-dsplink.inc:DSPLINKDSPCFG_omapl138    = "OMAPL138GEMSHMEM"
recipes/ti/ti-dsplink.inc:DSPLINKDSPCFG_omap3       = "OMAP3530SHMEM"
recipes/ti/ti-dsplink.inc:DSPLINKDSP_dm6446         = "DM6446GEM_0"
recipes/ti/ti-dsplink.inc:DSPLINKDSP_dm6467         = "DM6467GEM_0"
recipes/ti/ti-dsplink.inc:DSPLINKDSP_omapl137       = "OMAPL1XXGEM_0"
recipes/ti/ti-dsplink.inc:DSPLINKDSP_omapl138       = "OMAPL138GEM_0"
recipes/ti/ti-dsplink.inc:DSPLINKDSP_omap3          = "OMAP3530_0"
recipes/ti/ti-dsplink.inc:DSPLINKGPPOS_dm6446       = "DM6446LSP"
recipes/ti/ti-dsplink.inc:DSPLINKGPPOS_dm6467       = "DM6467LSP"
recipes/ti/ti-dsplink.inc:DSPLINKGPPOS_omapl137     = "ARM"
recipes/ti/ti-dsplink.inc:DSPLINKGPPOS_omapl138     = "ARM"
recipes/ti/ti-dsplink.inc:DSPLINKGPPOS_omap3        = "OMAPLSP"
recipes/ti/ti-dsplink.inc:RDEPENDS_ti-dsplink-examples_append_omap3 += " ti-lpm-module ti-lpm-utils"
recipes/ti/ti-codecs-omapl138_1.00.00.bb:DSPSUFFIX_omapl138 = "x64P"
recipes/ti/ti-codecs-omap3530_1.00.01.bb:DSPSUFFIX_omap3 = "x64P"
recipes/ti/ti-codec-engine_2.25.01.06.bb:SRC_URI_append_dm365 += "file://loadmodules.sh"
recipes/ti/ti-dmai_svn.bb:DMAIBRANCH_dm6446     = "trunk"
recipes/ti/ti-dmai_svn.bb:DMAIBRANCH_dm6467     = "branches/GITPSP_INT_101009"
recipes/ti/ti-dmai_svn.bb:DMAIBRANCH_omap3      = "trunk"
recipes/ti/ti-dmai_svn.bb:DMAIBRANCH_dm355      = "branches/GITPSP_INT_101009"
recipes/ti/ti-dmai_svn.bb:DMAIBRANCH_dm365      = "branches/GITPSP_INT_101009"
recipes/ti/ti-dmai_svn.bb:DMAIBRANCH_omapl137   = "trunk"
recipes/ti/ti-dmai_svn.bb:DMAIBRANCH_omapl138   = "trunk"
recipes/ti/ti-dmai_svn.bb:SRCREV_dm6446         = "423"
recipes/ti/ti-dmai_svn.bb:SRCREV_dm6467         = "441"
recipes/ti/ti-dmai_svn.bb:SRCREV_omap3          = "423"
recipes/ti/ti-dmai_svn.bb:SRCREV_dm355          = "424"
recipes/ti/ti-dmai_svn.bb:SRCREV_dm365          = "441"
recipes/ti/ti-dmai_svn.bb:SRCREV_omapl137       = "423"
recipes/ti/ti-dmai_svn.bb:SRCREV_omapl138       = "423"
recipes/ti/ti-local-power-manager.inc:LPMDSPPOWERSOC_omap3  = "omap3530"
recipes/ti/ti-local-power-manager.inc:LPMDSPPOWERSOC_dm6446 = "dm6446"
recipes/ti/ti-local-power-manager.inc:XDC_PLATFORM_dm6446   = "ti.platforms.evmDM6446"
recipes/ti/ti-local-power-manager.inc:XDC_PLATFORM_omap3    = "ti.platforms.evm3530"
recipes/ti/ti-codecs-dm6446_2.05.00.00.bb:DSPSUFFIX_dm6446 = "x64P"
recipes/ti/ti-codecs-dm6467_1.00.00.08.bb:DSPSUFFIX_dm6467 = "x64P"
recipes/ti/ti-paths.inc:DSPSUFFIX_omapl137 = "x674"
recipes/ti/ti-paths.inc:DSPSUFFIX_omapl138 = "x674"
recipes/tasks/task-arago-toolchain-dvsdk-host.bb:DVSDK_HOST_PACKAGE_dm6446 = "\
recipes/tasks/task-arago-toolchain-dvsdk-host.bb:DVSDK_HOST_PACKAGE_dm6467 = "\
recipes/tasks/task-arago-toolchain-dvsdk-host.bb:DVSDK_HOST_PACKAGE_omap3 = "\
recipes/xorg-xserver/xserver-xorg-conf_0.1.bb:RDEPENDS_omap3 = "xf86-video-omapfb"
recipes/egl/egl.inc:COMPATIBLE_MACHINE = "omap3"
recipes/powertop/powertop_svn.bb:CFLAGS_append_omap3 = " -DOMAP3"
recipes/kexecboot/linux-kexecboot_2.6.32.bb:S_omap3 = "${WORKDIR}/git"
recipes/kexecboot/linux-kexecboot_2.6.32.bb:DEFAULT_PREFERENCE_omap3 = "1"
recipes/kexecboot/linux-kexecboot_2.6.32.bb:SRC_URI_append_omap3 = " git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git;rev=6833f1a8cdcb65a370f898bde6b6af63f81962df \
recipes/kexecboot/kexecboot.inc:EXTRA_OECONF_omap3 = "--with-uimage"
recipes/linux/linux-davinci_git.bb:SRCREV_dm355           = ${ARAGO_DM_REV}
recipes/linux/linux-davinci_git.bb:SRCREV_dm365           = ${ARAGO_DM_REV}
recipes/linux/linux-davinci_git.bb:SRCREV_dm6446          = ${ARAGO_DM_REV}
recipes/linux/linux-davinci_git.bb:SRCREV_dm6467          = ${ARAGO_DM_REV}
recipes/linux/linux-davinci_git.bb:PV_dm355               = ${ARAGO_DM_PV}
recipes/linux/linux-davinci_git.bb:PV_dm365               = ${ARAGO_DM_PV}
recipes/linux/linux-davinci_git.bb:PV_dm6446              = ${ARAGO_DM_PV}
recipes/linux/linux-davinci_git.bb:PV_dm6467              = ${ARAGO_DM_PV}
recipes/linux/linux-davinci_git.bb:BRANCH_dm355           = ${ARAGO_DM_BR}
recipes/linux/linux-davinci_git.bb:BRANCH_dm365           = ${ARAGO_DM_BR}
recipes/linux/linux-davinci_git.bb:BRANCH_dm6446          = ${ARAGO_DM_BR}
recipes/linux/linux-davinci_git.bb:BRANCH_dm6467          = ${ARAGO_DM_BR}
recipes/linux/linux-davinci_git.bb:SRC_URI_append_dm355   = ${ARAGO_DM_URI}
recipes/linux/linux-davinci_git.bb:SRC_URI_append_dm365   = ${ARAGO_DM_URI}
recipes/linux/linux-davinci_git.bb:SRC_URI_append_dm6446  = ${ARAGO_DM_URI}
recipes/linux/linux-davinci_git.bb:SRC_URI_append_dm6467  = ${ARAGO_DM_URI}
recipes/jack/jack_0.118.0.bb:PACKAGE_ARCH_omap3 = "${MACHINE_ARCH}"


