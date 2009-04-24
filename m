Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LxGCw-0006p0-Gv
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 09:52:29 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIL00993HNH7FDM@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	24 Apr 2009 02:47:42 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0FF2D6B83A8; Fri,
	24 Apr 2009 03:47:41 -0400 (EDT)
Date: Fri, 24 Apr 2009 03:47:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090424074741.GD28636@denix.org>
References: <1240558043-13385-1-git-send-email-k.kooi@student.utwente.nl>
MIME-version: 1.0
In-reply-to: <1240558043-13385-1-git-send-email-k.kooi@student.utwente.nl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH] pxaregs: GNU_HASH QA fix.
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
X-List-Received-Date: Fri, 24 Apr 2009 07:52:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 24, 2009 at 09:27:23AM +0200, Koen Kooi wrote:
> From: Stanislav Brabec <utx@penguin.cz>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/pxaregs/pxaregs_1.14.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/pxaregs/pxaregs_1.14.bb b/recipes/pxaregs/pxaregs_1.14.bb
> index d57dace..ada5220 100644
> --- a/recipes/pxaregs/pxaregs_1.14.bb
> +++ b/recipes/pxaregs/pxaregs_1.14.bb
> @@ -12,7 +12,7 @@ SRC_URI = "http://www.mn-logistik.de/unsupported/pxa250/pxaregs.c \
>  S = "${WORKDIR}"
>  
>  do_compile() {
> -    ${CC} pxaregs.c -o pxaregs ${CFLAGS}
> +    ${CC} pxaregs.c -o pxaregs ${CFLAGS} ${LDFLAGS}
>  }
>  
>  do_install() {
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


