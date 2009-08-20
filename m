Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MdzBR-0002Ur-8G
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 06:23:29 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KON007PEQ26WUJ2@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	19 Aug 2009 23:06:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D294C14AF5F; Thu,
	20 Aug 2009 00:06:05 -0400 (EDT)
Date: Thu, 20 Aug 2009 00:06:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820040605.GF32010@denix.org>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com>
	<1250738680-20274-4-git-send-email-clarson@mvista.com>
	<1250738680-20274-5-git-send-email-clarson@mvista.com>
	<1250738680-20274-6-git-send-email-clarson@mvista.com>
MIME-version: 1.0
In-reply-to: <1250738680-20274-6-git-send-email-clarson@mvista.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] bitbake.conf: Kill CCACHE. Implicit, automatic	use of things which can fail is bad.
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
X-List-Received-Date: Thu, 20 Aug 2009 04:23:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 19, 2009 at 08:24:37PM -0700, Chris Larson wrote:
> To re-enable, set CCACHE = "ccache ".
> 
> Signed-off-by: Chris Larson <clarson@mvista.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

CCACHE-related issues are one of the most commonly reported...

> ---
>  conf/bitbake.conf |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index c4af34e..0b35ea8 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -390,7 +390,6 @@ export PATH
>  # Build utility info.
>  ##################################################################
>  
> -CCACHE = "${@bb.which(bb.data.getVar('PATH', d, 1), 'ccache') and 'ccache '}"
>  TOOLCHAIN_OPTIONS = ""
>  
>  export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> -- 
> 1.6.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


