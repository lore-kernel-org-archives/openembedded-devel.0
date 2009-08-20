Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mdypq-0004Fb-S6
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 06:01:14 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KON005UHP0LB9Y2@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	19 Aug 2009 22:43:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 655F014AF5F; Wed,
	19 Aug 2009 23:43:33 -0400 (EDT)
Date: Wed, 19 Aug 2009 23:43:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820034333.GD32010@denix.org>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com>
	<1250738680-20274-4-git-send-email-clarson@mvista.com>
MIME-version: 1.0
In-reply-to: <1250738680-20274-4-git-send-email-clarson@mvista.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Dale Farnsworth <dfarnsworth@mvista.com>
Subject: Re: [PATCH] kernel.bbclass: Set EXTRA_OEMAKE to null for	kernel
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
X-List-Received-Date: Thu, 20 Aug 2009 04:02:01 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 19, 2009 at 08:24:35PM -0700, Chris Larson wrote:
> From: Dale Farnsworth <dfarnsworth@mvista.com>
> 
> Currently the only thing in EXTRA_OEMAKE is '-e MAKEFLAGS='.  We don't
> want to overide the kernel's Makefile variables from the environment.
> It caused the passed -j<N> parameter from PARALLEL_MAKE to be ignored.
> 
> Signed-off-by: Dale Farnsworth <dfarnsworth@mvista.com>
> Signed-off-by: Chris Larson <clarson@mvista.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

Had a similar fix in my own tree locally, but not specifically for -jN...

> ---
>  classes/kernel.bbclass |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 3ee7f53..2947d4d 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -78,6 +78,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  UBOOT_ENTRYPOINT ?= "20008000"
>  UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
>  
> +# For the kernel, we don't want the '-e MAKEFLAGS=' in EXTRA_OEMAKE.
> +# We don't want to override kernel Makefile variables from the environment
> +EXTRA_OEMAKE = ""
> +
>  kernel_do_compile() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>  	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> -- 
> 1.6.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


