Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Nk1rf-0003ST-W5
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 22:00:24 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYB00LC6BJGFWV1@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	23 Feb 2010 14:57:22 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 83C4314AF60; Tue,
	23 Feb 2010 15:57:16 -0500 (EST)
Date: Tue, 23 Feb 2010 15:57:16 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100223205716.GC27420@denix.org>
References: <1266950939-3302-1-git-send-email-clarson@kergoth.com>
MIME-version: 1.0
In-reply-to: <1266950939-3302-1-git-send-email-clarson@kergoth.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] kernel.bbclass: Stage the raw zImage and modules	tarball for inclusion in pstage
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
X-List-Received-Date: Tue, 23 Feb 2010 21:00:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 23, 2010 at 11:48:59AM -0700, Chris Larson wrote:
> From: Tom Rini <tom_rini@mentor.com>

How is it different from [1]? Or is it meant to be pushed to stable/2009?
[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=8dc84badb1d772f5953492c4022c1f644c4fe278


> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>
> ---
>  classes/kernel.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 83530b5..8121339 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -536,10 +536,12 @@ MODULES_IMAGE_BASE_NAME ?= modules-${PV}-${PR}-${MACHINE}
>  do_deploy() {
>  	install -d ${DEPLOY_DIR_IMAGE}
>  	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
> +	package_stagefile_shell ${S}/${KERNEL_OUTPUT}
>  	package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
>  
>  	if [ -d "${PKGD}/lib" ]; then
>  		fakeroot tar -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tgz -C ${PKGD} lib
> +		package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tgz
>  	fi
>  
>  	cd ${DEPLOY_DIR_IMAGE}
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


