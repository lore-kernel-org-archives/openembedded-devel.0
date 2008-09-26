Received: from [206.46.252.42] (helo=vms042pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1KjHLL-0001Pc-31
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Sep 2008 19:43:03 +0200
Received: from gandalf.denix.org ([71.255.232.65])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K7T00MGPD12NYJ3@vms042.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	26 Sep 2008 12:39:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E62C86B8008; Fri,
	26 Sep 2008 13:39:01 -0400 (EDT)
Date: Fri, 26 Sep 2008 13:39:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20080925042321.GC4510@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20080926173901.GA16384@denix.org>
MIME-version: 1.0
References: <20080925042321.GC4510@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: base.bbclass problem? Was: package-stagefile-shell() breaks if	DEPLOY_DIR is outside of TMPDIR
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
X-List-Received-Date: Fri, 26 Sep 2008 17:43:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Does anybody have any comments? Am I doing something totally wrong? Or is it 
too low-level so nobody wants to touch it? Please let me know. Thanks.

On Thu, Sep 25, 2008 at 12:23:21AM -0400, Denys Dmytriyenko wrote:
> Hi,
> 
> I just submitted a bug report #4580, but wanted to follow up here as my 
> description/fix maybe controversial or at least touches the low-level stuff. 
> 
> Here is the description from the ticket:
> 
> When DEPLOY_DIR is configured to be outside of TMPDIR, building a kernel
> breaks, as "cp" cannot copy a file into itself:
> 
> cp: `/OE/deploy/glibc/images/omap3evm/uImage.bin' and `/OE/deploy/glibc/images/omap3evm/uImage.bin' are the same file
> 
> What happens is inside the do_deploy() function of the kernel.bbclass it calls
> package-stagefile-shell() with the uImage binary in DEPLOY_DIR as a parameter:
> 
> package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
> 
> That function is supposed to save a copy of the file in the staging directory
> (packaged-staging magic):
> 
> package_stagefile_shell() {
>         if [ "$PSTAGING_ACTIVE" = "1" ]; then
>                 srcfile=$1
>                 destfile=`echo $srcfile | sed s#${TMPDIR}#${PSTAGE_TMPDIR_STAGE}#`
>                 destdir=`dirname $destfile`
>                 mkdir -p $destdir
>                 cp -dp $srcfile $destfile
>         fi
> }
> 
> The problem there is it substitutes (sed) TMPDIR with PSTAGE_TMPDIR_STAGE in
> file's path. It works if DEPLOY_DIR is inside TMPDIR, but the path remains the
> same if otherwise, leading to the mentioned error.
> 
> The function above is a shell counterpart of the python package_stagefile(). I
> grepped both of them and it appears the python function is used inside the
> package.bbclass to do some actual staging, while the shell function is only
> used in recipes for kernels and bootloaders (u-boot, x-load) and is always
> called with files in DEPLOY_DIR.
> 
> So, changing above sed command to:
> 
> sed s#${DEPLOY_DIR}#${PSTAGE_TMPDIR_STAGE}#`
> 
> makes it work and doesn't seem to break anything else for me. I think the
> function maybe renamed to package_stagefile_deploy() to reflect its purpose,
> but that would require changes in several recipes.
> 
> I'm attaching the actual patch for review. It works for me, but I'm not sure 
> how correct it is, so I'm asking here. Thanks.
> 
> -- 
> Denys

> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 540b891..1172b8f 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -389,7 +389,7 @@ def package_stagefile(file, d):
>  package_stagefile_shell() {
>  	if [ "$PSTAGING_ACTIVE" = "1" ]; then
>  		srcfile=$1
> -		destfile=`echo $srcfile | sed s#${TMPDIR}#${PSTAGE_TMPDIR_STAGE}#`
> +		destfile=`echo $srcfile | sed s#${DEPLOY_DIR}#${PSTAGE_TMPDIR_STAGE}#`
>  		destdir=`dirname $destfile`
>  		mkdir -p $destdir
>  		cp -dp $srcfile $destfile


