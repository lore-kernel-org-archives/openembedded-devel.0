Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SAZgn-0002Mt-PK
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 05:31:53 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1900HPKO21MYP1@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	21 Mar 2012 22:22:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B08402016F; Wed,
	21 Mar 2012 23:22:49 -0400 (EDT)
Date: Wed, 21 Mar 2012 23:22:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120322032249.GH6857@denix.org>
References: <003901cd07a7$bc69de00$353d9a00$@slingshot.co.nz>
MIME-version: 1.0
In-reply-to: <003901cd07a7$bc69de00$353d9a00$@slingshot.co.nz>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: ti-eula-unpack problem
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
X-List-Received-Date: Thu, 22 Mar 2012 04:31:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 22, 2012 at 10:15:26AM +1300, R U Local wrote:
> Dear List,
> 
> A resent change to ti-eula-unpack.inc to test for 32 bit compatability on 64
> bit systems has broken the build on Ubuntu x64 11.10.

Ah, you cross-posted this to different mailing lists, but not the correct 
one... :) This should have gone to meta-ti, which this change belongs to and 
where I copied the reply to:

https://lists.yoctoproject.org/listinfo/meta-ti

> Ubuntu created multi-arch functionality between 11.4 and 11.10. There is are
> now  /lib /lib64 and /lib32 directories and no symlinks.
> 
> The following patch corrects this on my system but I have no idea of its
> effect on others.
> 
>  
> 
> diff --git a/recipes-ti/includes/ti-eula-unpack.inc
> b/recipes-ti/includes/ti-eula-unpack.inc
> 
> index dcabe9d..f37f026 100644
> 
> --- a/recipes-ti/includes/ti-eula-unpack.inc
> 
> +++ b/recipes-ti/includes/ti-eula-unpack.inc
> 
> @@ -21,7 +21,7 @@ python ti_bin_do_unpack() {
> 
>      # InstallJammer requires 32bit version of glibc
> 
>      lib32path = '/lib'
> 
> -    if os.path.exists('/lib64') and ( os.path.islink('/lib64') or
> os.path.islink('/lib') ):
> 
> +    if os.path.exists('/lib64') and ( os.path.islink('/lib64') or
> os.path.islink('/lib') or os.path.exists('/lib32')):
> 
>         lib32path = '/lib32'
> 
>      if not os.path.exists('%s/libc.so.6' % lib32path):
> 
>         raise bb.build.FuncFailed, \
> 
>  
> 
> Cheers Mike.
> 
>  
> 
>  
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


