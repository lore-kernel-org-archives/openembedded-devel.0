Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PzxGi-0003nu-LS
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 21:24:33 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI600CPG37IVJW7@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Mar 2011 15:21:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EA89014AF6A; Wed,
	16 Mar 2011 16:21:17 -0400 (EDT)
Date: Wed, 16 Mar 2011 16:21:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110316202117.GE3042@denix.org>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
	<08cb84d24fdd8e9d40a5db836b98a3706187c7c6.1300293663.git.bengardiner@nanometrics.ca>
MIME-version: 1.0
In-reply-to: <08cb84d24fdd8e9d40a5db836b98a3706187c7c6.1300293663.git.bengardiner@nanometrics.ca>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [2010.03-maintenance] [PATCH 1/7] image.bbclass: add link	to .rootfs.<type> or .<type>.img
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
X-List-Received-Date: Wed, 16 Mar 2011 20:24:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 16, 2011 at 12:50:34PM -0400, Ben Gardiner wrote:
> The current image link-creation code will unconditionaly create a link
> from .<type> pointing to the .rootfs.<type> output.
> 
> This is not compatible with the UBIFS images produced which have
> .<type>.img extension since they are not considered to be valid rootfs
> images when they are not included in a UBI container.
> 
> Check for existence of the link target .rootfs.<type> before creating the
> link and fallback to a check for the .<type>.img target after that.
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> Acked-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> (cherry picked from commit cfde49e8d0f1cf09d589910f1a342849db148519)
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  classes/image.bbclass |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/image.bbclass b/classes/image.bbclass
> index 9621614..d7fe9b0 100644
> --- a/classes/image.bbclass
> +++ b/classes/image.bbclass
> @@ -140,7 +140,11 @@ def get_imagecmds(d):
>          cmd  = "\t#Code for image type " + type + "\n"
>          cmd += "\t${IMAGE_CMD_" + type + "}\n"
>          cmd += "\tcd ${DEPLOY_DIR_IMAGE}/\n"
> -        cmd += "\tln -fs ${IMAGE_NAME}.rootfs." + type + " ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}." + type + "\n\n"
> +        cmd += "\tif [ -f ${IMAGE_NAME}.rootfs." + type + " ]; then\n"
> +        cmd += "\tln -fs ${IMAGE_NAME}.rootfs." + type + " ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}." + type + "\n"
> +        cmd += "\telif [ -f ${IMAGE_NAME}." + type + ".img ]; then\n"
> +        cmd += "\tln -fs ${IMAGE_NAME}." + type + ".img ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}." + type + "\n"
> +        cmd += "\tfi\n\n"
>          cmds += bb.data.expand(cmd, localdata)
>      return cmds
>  
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


