Received: from [206.46.173.13] (helo=vms173013pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N48oJ-0004GJ-0T
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Oct 2009 08:55:46 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSD00AV0CMIFJDG@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Oct 2009 02:54:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 06C9A14AF60; Sat,
	31 Oct 2009 03:54:18 -0400 (EDT)
Date: Sat, 31 Oct 2009 03:54:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091031075417.GI16188@denix.org>
References: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1256726758-22996-4-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1256726758-22996-4-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH 3/6] coreutils-native: make mandatory dep	for all packages
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
X-List-Received-Date: Sat, 31 Oct 2009 07:55:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 28, 2009 at 11:45:55AM +0100, Marcin Juszkiewicz wrote:
> From: Roman I Khimov <khimov@altell.ru>
> 
> Gives us guaranteed sane GNU coreutils on any host. Should greatly ease
> support for various non-GNU host systems and allow to safely remove some other
> native packages like 'install-native'.
> 
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  classes/base.bbclass |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 611c71d..e622aee 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -134,9 +134,11 @@ def base_dep_prepend(d):
>  	# the case where host == build == target, for now we don't work in
>  	# that case though.
>  	#
> -	deps = "shasum-native "
> -	if bb.data.getVar('PN', d, True) == "shasum-native":
> +	deps = "shasum-native coreutils-native"
> +	if bb.data.getVar('PN', d, True) == "shasum-native" or bb.data.getVar('PN', d, True) == "stagemanager-native":
>  		deps = ""
> +	if bb.data.getVar('PN', d, True) == "coreutils-native":
> +		deps = "shasum-native"
>  
>  	# INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
>  	# we need that built is the responsibility of the patch function / class, not
> -- 
> 1.6.5
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


