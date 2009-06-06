Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MCqkS-0000YT-Nn
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jun 2009 09:55:28 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KKT008NR48WA379@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	06 Jun 2009 02:46:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 378FA14AF5F; Sat,
	06 Jun 2009 03:46:06 -0400 (EDT)
Date: Sat, 06 Jun 2009 03:46:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090606074606.GF4988@denix.org>
References: <046B8D02-FF75-4D9E-BBB9-2D2DF22E37BC@mac.com>
MIME-version: 1.0
In-reply-to: <046B8D02-FF75-4D9E-BBB9-2D2DF22E37BC@mac.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Where do the extra #include <mach/board-overo.h> come	from in linux-omap3-2.6.29.bb recipe?
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
X-List-Received-Date: Sat, 06 Jun 2009 07:55:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Jun 06, 2009 at 11:26:12AM +0400, Elvis Dowson wrote:
> Hi,
> 	I am using the overo-oe repository.
>
> I have a linux-omap3-2.6.29.bb recipe that pulls in the sources from the 
> master branch of the linux-omap-2.6 repository, as follows:
>
> SRC_URI = 
> "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;branch=master;protocol=git 
> \
> 	   file://defconfig \
>
> If I run the bitbake linux-omap3-2.6.29 command in the 
> /tool/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.29-r41/git/arch/arm/mach-omap2/board-overo.c 
> file,
>
> on line 41, there is a #include <mach/board-overo.h> entry as shown below.
>
> 39 #include <asm/mach/map.h>
> 40
> 41 #include <mach/board-overo.h>
> 42 #include <mach/board.h>
>
>
> Now, I have in a separate folder, cloned the same repository using the 
> following command:
>
> $ git clone 
> git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git
>
> However, when I look at arch/arm/mach-omap2/board-overo.c file, the 
> #include <mach/board-overo.h> entry is missing
>
> 39 #include <asm/mach/map.h>
> 40
> 41 #include <mach/board.h>
>
> What task is contributing to this extra code, when I run the bitbake 
> recipe, compared to the original linux-omap-2.6 master branch?

The recipe pulls 2.6.29 version (specified by SRCREV), while you are looking 
at the latest source after git clone. Somewhere in between the file was 
removed:

http://git.kernel.org/?p=linux/kernel/git/tmlind/linux-omap-2.6.git;a=commitdiff;h=ed99db8e5c53acced1a7c02aa9a94d50bea48409

> I'm trying to patch in Tomi's DSS2 and Kevin's PM patches, for the Overo by 
> modifying the linux-omap3-2.6.29.bb recipe. I'm getting stuck because of 
> this apparent difference, and cannot make modifications to Tomi's patch 
> files without first being able to manually fast forward to the appropriate 
> state.
>
> Best regards,
>
> Elvis
>
>
> # Linux OMAP3 2.6.29 recipie
> DEFAULT_PREFERENCE = 1
>
> # Required packages
> require linux.inc
>
> # Package information
> DESCRIPTION = "Linux kernel for OMAP3 processors"
> KERNEL_IMAGETYPE = "uImage"
>
> COMPATIBLE_MACHINE = "beagleboard|omap3evm|overo"
>
> SRCREV = "90e758af52ba803cba233fabee81176d99589f09"
>
> PN = "linux-omap3"
> PV = "2.6.29"
> PR = "r41"
>
> SRC_URI = 
> "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;branch=master;protocol=git 
> \
> 	   file://defconfig \
>           "
>
> SRC_URI_append = " \
>            "
>
>
> SRC_URI_append_beagleboard = " \
>            file://beagle-ehci.patch;patch=1 \
>           "
>
> SRC_URI_append_omap3evm = " \
>           "
>
> SRC_URI_append_overo = " \
>           "
>
>
> S = "${WORKDIR}/git"
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


