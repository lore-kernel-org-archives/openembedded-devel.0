Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mdz13-0004kP-Jj
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 06:12:45 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KON00KUUPKGEJF2@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	19 Aug 2009 22:55:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 11C7414AF5F; Wed,
	19 Aug 2009 23:55:28 -0400 (EDT)
Date: Wed, 19 Aug 2009 23:55:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820035528.GE32010@denix.org>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com>
MIME-version: 1.0
In-reply-to: <1250738680-20274-3-git-send-email-clarson@mvista.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Dale Farnsworth <dfarnsworth@mvista.com>
Subject: Re: [PATCH] patch.bbclass: Add "git" patchtool mechanism, which uses git-apply
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
X-List-Received-Date: Thu, 20 Aug 2009 04:12:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 19, 2009 at 08:24:34PM -0700, Chris Larson wrote:
> From: Dale Farnsworth <dfarnsworth@mvista.com>
> 
> It can be selected by setting PATCHTOOL = "git".
> 
> This is useful because git-apply honors the permissions information
> produced by git-format-patch.
> 
> Signed-off-by: Dale Farnsworth <dfarnsworth@mvista.com>
> Signed-off-by: Chris Larson <clarson@mvista.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

Nice one, thanks!

> ---
>  classes/patch.bbclass |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/patch.bbclass b/classes/patch.bbclass
> index 2aa63c0..650d9c1 100644
> --- a/classes/patch.bbclass
> +++ b/classes/patch.bbclass
> @@ -189,6 +189,24 @@ def patch_init(d):
>  		def Clean(self):
>  			""""""
>  
> +	class GitApplyTree(PatchTree):
> +		def __init__(self, dir, d):
> +			PatchTree.__init__(self, dir, d)
> +
> +		def _applypatch(self, patch, force = False, reverse = False, run = True):
> +			shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
> +
> +			if reverse:
> +				shellcmd.append('-R')
> +
> +			shellcmd.append(patch['file'])
> +
> +			if not run:
> +				return "sh" + "-c" + " ".join(shellcmd)
> +
> +			return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
> +
> +
>  	class QuiltTree(PatchSet):
>  		def _runcmd(self, args, run = True):
>  			quiltrc = bb.data.getVar('QUILTRCFILE', self.d, 1)
> @@ -424,6 +442,7 @@ def patch_init(d):
>  	g["PatchSet"] = PatchSet
>  	g["PatchTree"] = PatchTree
>  	g["QuiltTree"] = QuiltTree
> +	g["GitApplyTree"] = GitApplyTree
>  	g["Resolver"] = Resolver
>  	g["UserResolver"] = UserResolver
>  	g["NOOPResolver"] = NOOPResolver
> @@ -449,6 +468,7 @@ python patch_do_patch() {
>  	patchsetmap = {
>  		"patch": PatchTree,
>  		"quilt": QuiltTree,
> +		"git": GitApplyTree,
>  	}
>  
>  	cls = patchsetmap[bb.data.getVar('PATCHTOOL', d, 1) or 'quilt']
> -- 
> 1.6.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


