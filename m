Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P64fm-0000nG-Nw
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 18:59:27 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LA800EVBN5SVVM1@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	13 Oct 2010 11:58:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 71D7214AF64; Wed,
	13 Oct 2010 12:58:40 -0400 (EDT)
Date: Wed, 13 Oct 2010 12:58:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101013165840.GA11514@denix.org>
References: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 1/5] matrix-gui-common: skip qa check on prebuilt	binaries
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
X-List-Received-Date: Wed, 13 Oct 2010 16:59:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 13, 2010 at 09:01:27AM -0500, Chase Maupin wrote:
> * Skip the QA check on the prebuilt binaries used for dm365
>   devices.

And why do we have prebuilt binaries in OE?

> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  recipes/ti/matrix-gui-common.inc |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/ti/matrix-gui-common.inc b/recipes/ti/matrix-gui-common.inc
> index 096c321..46c0bd6 100644
> --- a/recipes/ti/matrix-gui-common.inc
> +++ b/recipes/ti/matrix-gui-common.inc
> @@ -32,4 +32,7 @@ do_install() {
>  
>  }
>  
> +# Skip the QA for pre-built binaries
> +INSANE_SKIP_${PN}_dm365 = "True"
> +
>  FILES_${PN} += "${datadir}/matrix/*"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


