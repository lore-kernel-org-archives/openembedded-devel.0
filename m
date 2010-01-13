Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NV6mH-00042e-PL
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 18:13:08 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KW700MR43PZ4RS0@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	13 Jan 2010 11:10:47 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CDCDE14AF60; Wed,
	13 Jan 2010 12:10:46 -0500 (EST)
Date: Wed, 13 Jan 2010 12:10:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100113171046.GD24151@denix.org>
References: <1263314629-15492-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1263314629-15492-1-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <hrw@koansoftware.com>
Subject: Re: [STABLE][PATCH] matchbox-session: simple provider of	Matchbox session for X11 startup
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
X-List-Received-Date: Wed, 13 Jan 2010 17:13:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 12, 2010 at 05:43:49PM +0100, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <hrw@koansoftware.com>
> 
> In GPE images we use gpe-session-scripts to provide Xsession init
> scripts for launching Matchbox components. But what if someone do not
> want GPE but want Matchbox?
> 
> Poky has it cleaned in other way.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/matchbox-session/matchbox-session.bb |   14 ++++++++++++++
>  1 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/matchbox-session/matchbox-session.bb
> 
> diff --git a/recipes/matchbox-session/matchbox-session.bb b/recipes/matchbox-session/matchbox-session.bb
> new file mode 100644
> index 0000000..c9014f9
> --- /dev/null
> +++ b/recipes/matchbox-session/matchbox-session.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Matchbox session support"
> +RDEPENDS = "matchbox-common"
> +# they do the same in other way
> +RCONFLICTS = "gpe-session-scripts"
> +
> +do_install() {
> +        install -d ${D}${sysconfdir}/X11/Xsession.d/
> +        ln -sf ${bindir}/matchbox-session ${D}${sysconfdir}/X11/Xsession.d/90matchbox-session
> +}
> +
> +PACKAGE_ARCH = "all"
> +PACKAGES = "${PN}"
> +
> +FILES_${PN} = "${sysconfdir}"
> -- 
> 1.6.6
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


