Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MLL6F-0002Sc-IB
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Jun 2009 19:57:03 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM0007MJHACP9QE@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	29 Jun 2009 12:44:42 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E755414AF5F; Mon,
	29 Jun 2009 13:44:35 -0400 (EDT)
Date: Mon, 29 Jun 2009 13:44:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090629174435.GD5905@denix.org>
References: <4A41C00B.3030409@tait.co.nz>
	<1245882237-30230-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1245882237-30230-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH] /etc/profile: stricter root PATH - require	absolute pathname for bins in cwd
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
X-List-Received-Date: Mon, 29 Jun 2009 17:57:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jun 24, 2009 at 06:23:57PM -0400, Denys Dmytriyenko wrote:
> Having current directory (either '.' or empty string) in PATH is considered
> dangerous for root.
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> Acked-by: Phil Blundell <philb@gnu.org>
> Acked-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/base-files/base-files/profile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/base-files/base-files/profile b/recipes/base-files/base-files/profile
> index 5797535..b5ce69d 100644
> --- a/recipes/base-files/base-files/profile
> +++ b/recipes/base-files/base-files/profile
> @@ -12,7 +12,7 @@ if [ ! -e /etc/localtime ]; then
>  fi
>  
>  if [ "`id -u`" -eq 0 ]; then
> -   PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin:
> +   PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
>  fi
>  if [ "$PS1" ]; then
>  # works for bash and ash (no other shells known to be in use here)
> -- 
> 1.6.0.6
> 

ping?


