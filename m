Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MM5aw-0003hq-0N
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 21:35:50 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM400KOBB6V2OU4@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	01 Jul 2009 14:23:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0E5DA14AF5F; Wed,
	01 Jul 2009 15:23:19 -0400 (EDT)
Date: Wed, 01 Jul 2009 15:23:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090701192319.GD20815@denix.org>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
	<1246474461-16671-11-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1246474461-16671-11-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 016/125] bitbake.conf: weakly assign	OLDEST_KERNEL ?= "2.4.0" *after* machine and distro configs are	included
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
X-List-Received-Date: Wed, 01 Jul 2009 19:35:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jul 01, 2009 at 08:54:17PM +0200, Marcin Juszkiewicz wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  conf/bitbake.conf |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index c411b95..2226d5c 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -310,7 +310,6 @@ SDK_PATH = "/usr/local/${SDK_NAME}"
>  # Kernel info.
>  ##################################################################
>  
> -OLDEST_KERNEL = "2.4.0"
>  STAGING_KERNEL_DIR = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/kernel"
>  
>  ##################################################################
> @@ -644,6 +643,8 @@ require conf/enterprise.conf
>  # Weak variables (usually to retain backwards compatibility)
>  ##################################################################
>  
> +OLDEST_KERNEL ?= "2.4.0"
> +
>  DL_DIR ?= "${TMPDIR}/downloads"
>  IMAGE_FSTYPES ?= "tar.gz"
>  PCMCIA_MANAGER ?= "pcmcia-cs"
> -- 
> 1.6.3.1
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


