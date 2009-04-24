Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LxFyo-0006MT-5z
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 09:37:50 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIL00IDJGYKMXXN@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	24 Apr 2009 02:32:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 792AF6B83A8; Fri,
	24 Apr 2009 03:32:44 -0400 (EDT)
Date: Fri, 24 Apr 2009 03:32:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090424073244.GB28636@denix.org>
References: <1240557934-13305-1-git-send-email-k.kooi@student.utwente.nl>
MIME-version: 1.0
In-reply-to: <1240557934-13305-1-git-send-email-k.kooi@student.utwente.nl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH] man: GNU_HASH QA fix.
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
X-List-Received-Date: Fri, 24 Apr 2009 07:37:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 24, 2009 at 09:25:34AM +0200, Koen Kooi wrote:
> From: Stanislav Brabec <utx@penguin.cz>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/man/man_1.5p.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/man/man_1.5p.bb b/recipes/man/man_1.5p.bb
> index 2a1ed7f..c3412a5 100644
> --- a/recipes/man/man_1.5p.bb
> +++ b/recipes/man/man_1.5p.bb
> @@ -14,13 +14,14 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/man/man-${PV}.tar.bz2 \
>  # Disable parallel make or it tries to link objects before they are built
>  PARALLEL_MAKE = ""
>  
> -EXTRA_OEMAKE = ""
> +EXTRA_OEMAKE = 'LFDLAGS="${LDFLAGS}"'
>  GS = "-DGREPSILENT=\"q\""
>  DEFS = "-DUSG -DDO_COMPRESS ${GS}"
>  
>  do_configure() {
>  	# this doesn't support cross compilation, so it generates a
>  	# bogus configuration
> +	sed -i /^LDFLAGS/d src/Makefile.in
>  	./configure -d -confdir ${sysconfdir}
>  }
>  
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


