Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M9lzo-0000kt-9a
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 May 2009 22:14:36 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KKD00BSED44Y8M0@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	28 May 2009 14:36:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2C21714AF5F; Thu,
	28 May 2009 15:36:04 -0400 (EDT)
Date: Thu, 28 May 2009 15:36:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090528193604.GB2625@denix.org>
References: <1243535013-10090-1-git-send-email-msmith@cbnco.com>
MIME-version: 1.0
In-reply-to: <1243535013-10090-1-git-send-email-msmith@cbnco.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 1/2] tcpdump: fix mix of tabs and spaces in	do_configure()
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
X-List-Received-Date: Thu, 28 May 2009 20:14:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 28, 2009 at 02:23:32PM -0400, Michael Smith wrote:
> I randomly picked tabs.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>

I'm not sure this kind of cleanup requires patch review...

> ---
>  recipes/tcpdump/tcpdump_3.9.7.bb |    4 ++--
>  recipes/tcpdump/tcpdump_4.0.0.bb |    6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes/tcpdump/tcpdump_3.9.7.bb b/recipes/tcpdump/tcpdump_3.9.7.bb
> index ba9710d..962663f 100644
> --- a/recipes/tcpdump/tcpdump_3.9.7.bb
> +++ b/recipes/tcpdump/tcpdump_3.9.7.bb
> @@ -15,6 +15,6 @@ EXTRA_OECONF = "--without-crypto"
>  do_configure() {
>  	gnu-configize
>  	oe_runconf
> -        sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
> -        sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
> +	sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
> +	sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
>  }
> diff --git a/recipes/tcpdump/tcpdump_4.0.0.bb b/recipes/tcpdump/tcpdump_4.0.0.bb
> index 537cb36..c807fb1 100644
> --- a/recipes/tcpdump/tcpdump_4.0.0.bb
> +++ b/recipes/tcpdump/tcpdump_4.0.0.bb
> @@ -18,8 +18,8 @@ EXTRA_OECONF = "--without-crypto"
>  
>  do_configure() {
>  	gnu-configize
> -    autoconf
> +	autoconf
>  	oe_runconf
> -        sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
> -        sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
> +	sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
> +	sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
>  }
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


