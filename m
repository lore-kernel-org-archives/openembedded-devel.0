Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LkMlb-0002ug-RU
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 19:14:56 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGR004KMMMX4S77@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	19 Mar 2009 13:13:45 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C1AE36B83A8; Thu,
	19 Mar 2009 14:13:44 -0400 (EDT)
Date: Thu, 19 Mar 2009 14:13:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090319181344.GA31639@denix.org>
References: <alpine.DEB.1.00.0903191053260.9107@localhost.localdomain>
MIME-version: 1.0
In-reply-to: <alpine.DEB.1.00.0903191053260.9107@localhost.localdomain>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] local.conf.sample: Replace packages/ with	recipes/.
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
X-List-Received-Date: Thu, 19 Mar 2009 18:14:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 19, 2009 at 10:57:01AM -0700, Theodore A. Roth wrote:
> 
> ---
>  conf/local.conf.sample |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/local.conf.sample b/conf/local.conf.sample
> index 36407b0..022d65d 100644
> --- a/conf/local.conf.sample
> +++ b/conf/local.conf.sample
> @@ -23,7 +23,7 @@
>  DL_DIR = "${HOME}/sources"
>  
>  # Delete the line below. Then specify which .bb files to consider for
> -# your build. Typically this will be something like BBFILES = "/path/to/openembedded/packages/*/*.bb"
> +# your build. Typically this will be something like BBFILES = "/path/to/openembedded/recipes/*/*.bb"
>  BBFILES := "${@bb.fatal('Edit your conf/local.conf: BBFILES')}"
>  
>  # Use the BBMASK below to instruct BitBake to _NOT_ consider some .bb files
> -- 
> 1.5.4.3
> 
> Signed-off-by: Theodore A. Roth <taroth@gmail.com>

Thanks! I've been meaning to make this change, but got sidetracked. It is 
applied now.

-- 
Denys


