Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Oy7tq-0005x0-1U
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 20:49:07 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9400HF01L5NORO@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	21 Sep 2010 13:48:47 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7E38914AF64; Tue,
	21 Sep 2010 14:48:41 -0400 (EDT)
Date: Tue, 21 Sep 2010 14:48:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100921184841.GC11562@denix.org>
References: <AANLkTinWU3xoXzvcF7J6ExWjuh+gB9O6U2uChdTi77Bj@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTinWU3xoXzvcF7J6ExWjuh+gB9O6U2uChdTi77Bj@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: trying to use external-toolchain-csl with angstrom
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
X-List-Received-Date: Tue, 21 Sep 2010 18:49:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 21, 2010 at 02:27:23PM -0400, George C. Huntington, III wrote:
> I had to set TARGET_SYS = "arm-none-linux-gnueabi" in my local.conf to get
> the toolchain to be used, but now it appears that the gmp configure script
> doesn't like getting passed "--target=arm-none-linux-gnueabi"  am I just
> configuring things wrong?

Hi,

I see that you copied most of toolchain setup in your local.conf from arago. 
But, in reality, you don't need all that. I haven't tried external toolchain 
with Agstrom lately, but you should only need to setup these 4 variables:

TOOLCHAIN_PATH = "/opt/arm/arm-2009q3"
TARGET_VENDOR = "-none"
TOOLCHAIN_TYPE = "external"
TOOLCHAIN_BRAND = "csl"

You may also need PATH_prepend like in your example below, if you don't set 
your system PATH accordingly before using OE. Everything else should be taken 
care by the framework automatically.

-- 
Denys


> here is my local.conf:
> 
> DISTRO = "angstrom-2008.1"
> 
> DL_DIR = "${OEDIR}/downloads"
> 
> BBFILES := "${OEDIR}/openembedded/recipes/*/*.bb
> ${OEDIR}/openembedded.custom/recipes/*/*.bb"
> BBFILE_COLLECTIONS = "upstream custom"
> BBFILE_PATTERN_upstream = "^${OEDIR}/openembedded/recipes/"
> BBFILE_PATTERN_custom = "^${OEDIR}/openembedded.custom/recipes"
> BBFILE_PRIORITY_upstream = "5"
> BBFILE_PRIORITY_custom = "10"
> 
> IMAGE_FSTYPES = "jffs2 tar cpio.gz"
> 
> BBINCLUDELOGS = "yes"
> 
> CVS_TARBALL_STASH = ""
> ANGSTROM_FEED_CONFIGS = ""
> #DEBIAN_MIRROR = "ftp://ftp.us.debian.org/debian/pool"
> 
> #ENABLE_BINARY_LOCALE_GENERATION = "0"
> 
> PREFERRED_VERSION_mono = "2.4.2.3"
> PREFERRED_VERSION_mono-mcs-intermediate = "2.4.2.3"
> PREFERRED_VERSION_mono-native = "2.4.2.3"
> 
> #PREFERRED_VERSION_directfb = "1.4.1"
> 
> #PREFERRED_VERSION_mono = "svn"
> #PREFERRED_VERSION_mono-mcs-intermediate = "svn"
> #PREFERRED_VERSION_mono-native = "svn"
> 
> # Black magic to automatically set SDK_PATH out of PATH - don't touch this!
> # Works with pretty much any external toolchain, like CS Lite or MV Pro 5
> # Handles cross-toolchain vs. native toolchain
> # SDK_PATH can be overwritten externally by META_SDK_PATH, e.g. for SDK
> TOOLCHAIN_PATH = "/opt/arm/arm-2009q3"
> TOOLCHAIN_SYSPATH = "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi"
> #~ PATH_prepend = "${TOOLCHAIN_PATH}/bin"
> SDK_PATH = "${@[bb.data.getVar('TOOLCHAIN_PATH', d, 1),
> bb.data.getVar('META_SDK_PATH', d, 1)][bool(bb.data.getVar('META_SDK_PATH',
> d, 1))]}"
> # Set the necessary variables to use binary CodeSourcery Lite
> TARGET_VENDOR = "-none"
> TARGET_SYS = "arm-none-linux-gnueabi"
> TARGET_CPPFLAGS_append = " -I${SDK_PATH}/${TARGET_SYS}/libc/usr/include "
> TARGET_LDFLAGS_prepend = " -L${SDK_PATH}/${TARGET_SYS}/libc/lib
> -Wl,-rpath-link,${SDK_PATH}/${TARGET_SYS}/libc/lib "
> TOOLCHAIN_TYPE = "external"
> TOOLCHAIN_BRAND = "csl"
> 
> 
> # add the following to site.conf if you want to go
> # faster, use less space, etc
> #PARALLEL_MAKE = "-j 5"
> #BB_NUMBER_THREADS = "4"
> #INHERIT += "rm_work"
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


