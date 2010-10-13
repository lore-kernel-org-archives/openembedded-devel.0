Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P64gv-0001H7-IK
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 19:00:38 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LA800HEAN7WJIM5@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	13 Oct 2010 11:59:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C31BF14AF64; Wed,
	13 Oct 2010 12:59:56 -0400 (EDT)
Date: Wed, 13 Oct 2010 12:59:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101013165956.GE11514@denix.org>
References: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
	<1286978491-13427-5-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1286978491-13427-5-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 5/5] matrix-tui: use INC_PR in versioned recipe
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
X-List-Received-Date: Wed, 13 Oct 2010 17:00:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 13, 2010 at 09:01:31AM -0500, Chase Maupin wrote:
> * Added an INC_PR to the matrix-tui.inc file to be used
>   by the individual version recipes.
> * Modified the version recipe to use INC_PR in its PR setting.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/ti/matrix-tui.inc    |    2 ++
>  recipes/ti/matrix-tui_1.0.bb |    2 +-
>  2 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/ti/matrix-tui.inc b/recipes/ti/matrix-tui.inc
> index c8fd70d..6983406 100644
> --- a/recipes/ti/matrix-tui.inc
> +++ b/recipes/ti/matrix-tui.inc
> @@ -5,6 +5,8 @@ SECTION = "multimedia"
>  PRIORITY = "optional"
>  DEPENDS = "libxml2 zlib ncurses"
>  
> +INC_PR = "r5"
> +
>  INSANE_SKIP_${PN} = "True"
>  
>  SRC_URI = "svn://gforge.ti.com/svn/matrix_tui/;module=trunk;proto=https;user=anonymous;pswd='' \
> diff --git a/recipes/ti/matrix-tui_1.0.bb b/recipes/ti/matrix-tui_1.0.bb
> index c82dc14..81e622b 100644
> --- a/recipes/ti/matrix-tui_1.0.bb
> +++ b/recipes/ti/matrix-tui_1.0.bb
> @@ -2,4 +2,4 @@ require matrix-tui.inc
>  
>  SRCREV = "29"
>  PV = "1.0"
> -PR = "r4"
> +PR = "${INC_PR}.0"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


