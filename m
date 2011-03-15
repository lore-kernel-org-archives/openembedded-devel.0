Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PzaT2-0005rh-Kt
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 21:03:44 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI40024Q7MK0I73@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	15 Mar 2011 15:01:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id ECF5E14AF6A; Tue,
	15 Mar 2011 16:01:31 -0400 (EDT)
Date: Tue, 15 Mar 2011 16:01:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110315200131.GA3042@denix.org>
References: <1300212835-8779-1-git-send-email-bengardiner@nanometrics.ca>
MIME-version: 1.0
In-reply-to: <1300212835-8779-1-git-send-email-bengardiner@nanometrics.ca>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Tom Rini <trini@embeddedalley.com>
Subject: Re: [PATCH 1/2] image.bbclass: add link to .rootfs.<type> or	.<type>.img
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
X-List-Received-Date: Tue, 15 Mar 2011 20:03:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 15, 2011 at 02:13:54PM -0400, Ben Gardiner wrote:
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
> CC: Tom Rini <trini@embeddedalley.com>

The naming seems reasonable to me, considering the previous discussion on this 
topic.

Acked-by: Denys Dmytriyenko <denys@ti.com>


> Tested successfully in arago; I'm sorry I couldn't find a combination of
> MACHINE and DISTRO and image that would build on org.openembedded.dev.
> 
> This patch is a git am fix-up of the patch tested in arago.

I'll try building it from the tip of oe.dev, but arago should be reasonable up 
to date with no changes to image.bbclass or bitbake.conf...

> ---
> 
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


