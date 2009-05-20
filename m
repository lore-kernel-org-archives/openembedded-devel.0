Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M6ZkV-0000m0-AF
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 02:33:35 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJX00IEO2IQKZX2@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	19 May 2009 19:25:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 378C014AF5F; Tue,
	19 May 2009 20:25:38 -0400 (EDT)
Date: Tue, 19 May 2009 20:25:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090520002538.GF23803@denix.org>
References: <4A12BC2C.5020402@taupro.com>
MIME-version: 1.0
In-reply-to: <4A12BC2C.5020402@taupro.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: rootfs_tar.bbclass not found?
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
X-List-Received-Date: Wed, 20 May 2009 00:33:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, May 19, 2009 at 09:03:24AM -0500, Jeff Rush wrote:
> Hopefully a trivial question.
> 
> Objective: I am trying to generate a tarball of an executable program, the
> helloworld.bb program, for installation onto a system that lacks support for
> ipk files.
> 
> To get a tarball package, I add to my local.conf:
> 
>    INHERIT += "package_tar package_ipk"
> 
> but when I do:
> 
>    bitbake helloworld
> 
> or indeed any target, I get the following error during the parse stage:
> 
> ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
> /home/jeff/Projects/OpenEmbedded/openembedded/recipes/images/slugos-image.bb
> 
> This error is repeated for every *-image.bb file parsed.  The reason is
> because the file classes/image.bbclass has this line at the top of the file:
> 
>   inherit rootfs_${IMAGE_PKGTYPE}
> 
> so it is looking for "rootfs_tar.bbclass" but the only rootfs-*.bbclass files
> that exist are:
> 
>   classes/rootfs_deb.bbclass
>   classes/rootfs_ipk.bbclass
>   classes/rootfs_rpm.bbclass
> 
> So building an image from tar'd packages is not support - fine, because in
> this case I really do not want to build an image, just a single helloworld.tar
> package.  But I cannot get past the parsing phase because of this problem.
> 
> What can I add to my local.conf to 'short circuit' this logic related to the
> building of images?

Can you try setting BBMASK = "image" in your local.conf?

-- 
Denys


