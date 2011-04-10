Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q8idA-0004n7-J0
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 02:36:00 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJE00E26UVBRW82@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	09 Apr 2011 19:33:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7190914AF5B; Sat,
	09 Apr 2011 20:33:11 -0400 (EDT)
Date: Sat, 09 Apr 2011 20:33:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110410003311.GA32652@denix.org>
References: <1302328581-30367-1-git-send-email-heroor@gmail.com>
	<1302328581-30367-3-git-send-email-heroor@gmail.com>
MIME-version: 1.0
In-reply-to: <1302328581-30367-3-git-send-email-heroor@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Siddharth Heroor <heroor@ti.com>
Subject: Re: [PATCH 3/3] libgles-omap3: Remove SGX Fixup for TI816x.
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
X-List-Received-Date: Sun, 10 Apr 2011 00:36:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Apr 09, 2011 at 11:26:21AM +0530, Siddharth Heroor wrote:
> From: Siddharth Heroor <heroor@ti.com>
> 
> * Unlike OMAP3, the SGX core has not undergone revisions in TI816x.
>   The libraries for TI816x are also fixed and do not need fixup based
>   on revision of the SGX core.

Sid,

So, you are modifying generic rc script, which still apllies to OMAP3 
platforms, by removing fixups used in OMAP3... Is that correct?

-- 
Denys


> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  recipes/powervr-drivers/libgles-omap3/rc.pvr |   10 +++-------
>  1 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes/powervr-drivers/libgles-omap3/rc.pvr b/recipes/powervr-drivers/libgles-omap3/rc.pvr
> index 395d085..1b141a0 100755
> --- a/recipes/powervr-drivers/libgles-omap3/rc.pvr
> +++ b/recipes/powervr-drivers/libgles-omap3/rc.pvr
> @@ -90,15 +90,11 @@ case $CPUTYPE in
>  	devmem2 0x48180900 w 0x2
>  	devmem2 0x48180920 w 0x2
>  
> +	sleep 2
> +
>  	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:5: -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
>  
> -	if [ "${ES_REVISION}" != "${SAVED_ESREVISION}" ] ; then
> -		echo -n "Starting SGX fixup for"
> -		echo " ES${ES_REVISION}.x"
> -		cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
> -		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin	
> -		echo "${ES_REVISION}" > /etc/powervr-esrev
> -	fi
> +	echo "${ES_REVISION}" > /etc/powervr-esrev
>  	/usr/bin/pvrsrvinit
>  
>  	;;
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


