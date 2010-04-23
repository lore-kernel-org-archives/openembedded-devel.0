Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O5LHk-0003E9-5x
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 17:59:52 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1C00DZ46W4GQ10@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	23 Apr 2010 10:55:16 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EAC3314AF60; Fri,
	23 Apr 2010 11:55:15 -0400 (EDT)
Date: Fri, 23 Apr 2010 11:55:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100423155515.GA27322@denix.org>
References: <4BD170BC.8020103@road.de>
MIME-version: 1.0
In-reply-to: <4BD170BC.8020103@road.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Patch] locking in do_package_tar
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
X-List-Received-Date: Fri, 23 Apr 2010 15:59:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 23, 2010 at 12:04:44PM +0200, Jens Erdmann wrote:
> Hey folks,
>
> I would like to introduce locking in do_package_tar. I had a case here were 
> do_package_tar and do_package_ipk where running parallel. Because of this 
> "tar: .: file changed as we read it" occurs. I fixed it by introduce 
> locking in do_package_tar. What do you think about it?

Ah, I've been suffering from this problem for quite some time now, when making 
parallel builds with BB_NUMBER_THREADS. I was trying to debug it and noticed 
it would fail when kernel recipe would try to do_deploy at the same time 
another package would try to do_package_stage, so I was digging in the 
packaged staging direction. Tom Rini even made a patch to add an extra lock in 
there, which didn't help with my issue...
So, let me try your patch and see if this problem is gone for good! Thanks.

-- 
Denys

> -- 
> ------- ROAD ...the handyPC Company - - -  ) ) )
>
> Jens Erdmann
> Software Development
>
> ROAD GmbH
> Bennigsenstr. 14 | 12159 Berlin | Germany
> fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
> url: www.road.de
>
> Amtsgericht Charlottenburg: HRB 96688 B
> Managing director: Hans-Peter Constien
>

> diff --git a/classes/package_tar.bbclass b/classes/package_tar.bbclass
> index b905e17..47bf2cc 100644
> --- a/classes/package_tar.bbclass
> +++ b/classes/package_tar.bbclass
> @@ -58,6 +58,7 @@ python do_package_tar () {
>  		localdata = bb.data.createCopy(d)
>  		pkgdest = bb.data.getVar('PKGDEST', d, 1)
>  		root = "%s/%s" % (pkgdest, pkg)
> +		lf = bb.utils.lockfile(root + ".lock")
>  
>  		bb.data.setVar('ROOT', '', localdata)
>  		bb.data.setVar('ROOT_%s' % pkg, root, localdata)
> @@ -65,6 +66,7 @@ python do_package_tar () {
>  
>  		overrides = bb.data.getVar('OVERRIDES', localdata)
>  		if not overrides:
> +			bb.utils.unlockfile(lf)
>  			raise bb.build.FuncFailed('OVERRIDES not defined')
>  		overrides = bb.data.expand(overrides, localdata)
>  		bb.data.setVar('OVERRIDES', '%s:%s' % (overrides, pkg), localdata)
> @@ -82,10 +84,12 @@ python do_package_tar () {
>  		from glob import glob
>  		if not glob('*') + glob('.[!.]*'):
>  			bb.note("Not creating empty archive for %s-%s" % (pkg, bb.data.expand('${PV}-${PR}${DISTRO_PR}', d, True)))
> +			bb.utils.unlockfile(lf)
>  			continue
>  		ret = os.system("tar -czf %s %s" % (tarfn, '.'))
>  		if ret != 0:
>  			bb.error("Creation of tar %s failed." % tarfn)
> +		bb.utils.unlockfile(lf)
>  }
>  
>  python () {

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



