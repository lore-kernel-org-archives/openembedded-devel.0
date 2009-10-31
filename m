Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N48p2-0004MN-0G
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Oct 2009 08:56:31 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSD00K80CO6CKUR@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Oct 2009 02:55:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5110014AF60; Sat,
	31 Oct 2009 03:55:18 -0400 (EDT)
Date: Sat, 31 Oct 2009 03:55:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091031075518.GL16188@denix.org>
References: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1256726758-22996-7-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1256726758-22996-7-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: Re: [STABLE][PATCH 6/6] netcat: use update-alternatives as we	have netcat in busybox too
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
X-List-Received-Date: Sat, 31 Oct 2009 07:56:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 28, 2009 at 11:45:58AM +0100, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <hrw@openembedded.org>
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/netcat/netcat_0.7.1.bb |   13 +++++++++++--
>  1 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/netcat/netcat_0.7.1.bb b/recipes/netcat/netcat_0.7.1.bb
> index c7ceccd..7c4dfc5 100644
> --- a/recipes/netcat/netcat_0.7.1.bb
> +++ b/recipes/netcat/netcat_0.7.1.bb
> @@ -2,8 +2,17 @@ DESCRIPTION = "GNU Netcat"
>  HOMEPAGE = "http://netcat.sourceforge.net"
>  SECTION = "console/network"
>  LICENSE = "GPLv2"
> -PR = "r1"
> +PR = "r3"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
>  
> -inherit autotools
> +inherit autotools update-alternatives
> +
> +do_install_append() {
> +	mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
> +}
> +
> +ALTERNATIVE_NAME = "nc"
> +ALTERNATIVE_LINK = "${bindir}/nc"
> +ALTERNATIVE_PATH = "${bindir}/nc.${PN}"
> +ALTERNATIVE_PRIORITY = "100"
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


