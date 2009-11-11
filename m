Received: from [206.46.173.1] (helo=vms173001.mailsrvcs.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N8GLC-0000Mq-Dm
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 17:46:45 +0100
Received: from gandalf.denix.org ([unknown] [71.251.63.147])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KSY00DZTBRBF043@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	11 Nov 2009 09:45:12 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 115B014AF60; Wed,
	11 Nov 2009 10:45:11 -0500 (EST)
Date: Wed, 11 Nov 2009 10:45:11 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091111154511.GA2761@denix.org>
References: <1257953228-2353-1-git-send-email-Martin.Jansa@gmail.com>
MIME-version: 1.0
In-reply-to: <1257953228-2353-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] bitbake.conf: SRCPV always upgradeable paths for	git recipes
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
X-List-Received-Date: Wed, 11 Nov 2009 16:46:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Nov 11, 2009 at 04:27:08PM +0100, Martin Jansa wrote:
> * Holger Hans Peter Freyther <zecke@openmoko.org> did for the OM git
>   tree that was never merged back into OE.
> * Taken from xora/angstrom-srcpv branch where it rot for long enough

We also discussed it during the OEDEM...

-- 
Denys


> ---
>  conf/bitbake.conf |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 39a1f27..7c0defe 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -570,7 +570,8 @@ UPDATECOMMAND_cvs = "/usr/bin/env 'PATH=${PATH}' cvs -d${CVSROOT} update -d -P $
>  UPDATECOMMAND_svn = "/usr/bin/env svn update ${SVNCOOPTS}"
>  SRCDATE = "${DATE}"
>  SRCREV = "1"
> -AUTOREV = "${@bb.fetch.get_srcrev(d)}"
> +SRCPV = "${@bb.fetch.get_srcrev(d)}"
> +AUTOREV = "${SRCPV}"
>  
>  SRC_URI = "file://${FILE}"
>  
> -- 
> 1.6.5.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


