Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OEwFd-00063v-5x
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 05:16:50 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L2P004CL7JIS612@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	19 May 2010 22:11:48 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5500014AF60; Wed,
	19 May 2010 23:11:42 -0400 (EDT)
Date: Wed, 19 May 2010 23:11:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: arago-devel@gforge.ti.com
Message-id: <20100520031142.GD25484@denix.org>
References: <q2vade1bdc1004260340j4881a020t22a79b4e1279ade3@mail.gmail.com>
	<20100426174411.GA22763@denix.org>
	<x2rade1bdc1004261848k1f9cfc01yc64057689a22fbb1@mail.gmail.com>
	<20100427025702.GC10320@denix.org>
	<t2gade1bdc1005052310je365713at72a3997b449e46a1@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <t2gade1bdc1005052310je365713at72a3997b449e46a1@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [arago-devel] dm365 and OE
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
X-List-Received-Date: Thu, 20 May 2010 03:16:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 06, 2010 at 08:10:42AM +0200, Raffaele Recalcati wrote:
> 2010/4/27 Denys Dmytriyenko <denis@denix.org>
> 
> >
> > arago-next was merged back to the master branch recently, but it shouldn't
> > matter, as DVSDK was buildable before the merge. If you are referring to
> > the
> > fact that some components are not fetchable and need to be downloaded
> > manually, it's still the case for a few of them, as explained in the
> > README.
> > AFAIK, codecs for some platforms were not public at the time, I believe
> > dm365
> > being one of them. I'll ping some people internally and see if/when this
> > will
> > be fixed.
> >
> 
> The ping is going on?
> 
> I have unzipped the dvsdk and tried to associate it to arago/OE recipes, but
> what is the corrispondence?
> 
> Doing an 'ls -1' in my dvsdk dir I obtain:
> bin
> bios_5_41_00_06
> biosutils_1_02_02
> codec_engine_2_25_01_06
> dm365_codecs_01_00_06
> dm365mm_01_00_03
> dmai_2_10_00_06
> docs
> dsplink_linux_1_64
> DVSDK_3_10_00_12_release_notes.html
> dvsdk_demos_3_10_00_10
> dvtb_4_20_02
> edma3_lld_01_11_00_03
> examples
> framework_components_2_25_01_05
> linux_dvsdk_3_10_beta_manifest.pdf
> linuxutils_2_25_01_06
> Makefile
> mapdmaq
> mapdmaq-hd
> Rules.make
> uninstall
> xdais_6_25_01_08
> xdctools_3_16_01_27
> 
> I guess that each directory has to become a tgz in this dir and from
> localhost I need to reach it (using a link from /var/www to this dir):
> 
> But:
> 
> arago/recipes/ti/ti-codecs-dm365_3.10.00.02.bb
> uses
> 
> PV = "03_10_00_02"
> BASE_SRC_URI = "http://install.source.dir.local"
> SRC_URI = "${BASE_SRC_URI}/dm365_codecs_${PV}.tar.gz;name=dm365codecs \
>            file://mapdmaq"
> 
> but in my dvsdk I have
> dm365_codecs_01_00_06
> and so ${PV} seems wrong.
> 
>  ${PV} is similar, but not equal, to dvsdk version, 3_10_00_02 versus
> 3_10_00_12.
> 
> ----------------
> ti-dmai points to svn, instead in dvsdk I have dmai_2_10_00_06 .
> -----------------
> 
> I could rebuild from dvsdk 3_10_00_12 sources using arago or not, but,
> first, I'd like some check if it is the good starting point.

Sorry for the mess - this is still not resolved the way we had hoped. While 
the combined DVSDK is now available in beta, some of the individual 
components, like codecs, are still not available for download separately. 
Looks like we may need to write a recipe to extract necessary pieces from 
DVSDK release... Please be patient, hopefully we'll have the solution soon.

-- 
Denys


