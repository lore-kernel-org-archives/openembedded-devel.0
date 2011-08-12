Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QrlLb-00016N-8o
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Aug 2011 08:36:04 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LPS00EHZY4DHGX3@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	12 Aug 2011 01:31:26 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8047514AF5D; Fri,
	12 Aug 2011 02:31:25 -0400 (EDT)
Date: Fri, 12 Aug 2011 02:31:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110812063125.GD13857@denix.org>
References: <1313126272-32091-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1313126272-32091-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [meta-oe][PATCH] gcc: append PR to S to match oe-core and	fix do_headerfix
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
X-List-Received-Date: Fri, 12 Aug 2011 06:36:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Aug 12, 2011 at 01:17:52AM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> This fixes the gcc-cross-inital failure, as reported here:
> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/6150

BTW, one of the Linaro patches fails because the file got previously updated 
by do_headerfix(), which runs before do_patch(). A little manual intervention 
is currently required through TERMCMDRUN...

-- 
Denys


> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-oe/recipes-devtools/gcc/gcc-4.5.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
> index 662402c..aabc1cf 100644
> --- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
> +++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
> @@ -232,7 +232,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
>  FORTRAN = ""
>  JAVA = ""
>  
> -S = "${TMPDIR}/work-shared/gcc-${PV}/${BRANCH}"
> +S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
>  B = "${WORKDIR}/${BRANCH}/build.${HOST_SYS}.${TARGET_SYS}"
>  
>  #EXTRA_OECONF_BASE = "  --enable-cheaders=c_std \
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


