Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1L8eqP-00085N-PZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Dec 2008 18:52:02 +0100
Received: from gandalf.denix.org ([71.255.226.167]) by vms173001.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KBF00DGV0474H58@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	05 Dec 2008 11:48:09 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CC8286B83A8; Fri,
	05 Dec 2008 12:48:06 -0500 (EST)
Date: Fri, 05 Dec 2008 12:48:06 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <200812051715.45106.openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081205174806.GA12852@denix.org>
MIME-version: 1.0
References: <200812051715.45106.openembedded@haerwu.biz>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] Auto resizing ext2/ext3 images (from Poky)
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
X-List-Received-Date: Fri, 05 Dec 2008 17:52:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Dec 05, 2008 at 05:15:41PM +0100, Marcin Juszkiewicz wrote:
> 
> During my work for OpenedHand I wrote one usefull thing which we used for
> ext2/ext3 images - autosizing.

Great! I often face this issue of not fitting everything in a predefined image 
size. This patch should be very helpful!

> In few words: it checks how big rootfs is, adds IMAGE_EXTRA_SPACE amount
> of kilobytes to it and gives that size to genext2fs.
> 
> Below is a patch with code changes. Check it and say what You think about
> it. One thing is missing - support for fixed size ext2/3 images big enough
> to fit resulting rootfs.
> 
> diff --git a/classes/image.bbclass b/classes/image.bbclass
> index e9c0ecd..901ab34 100644
> --- a/classes/image.bbclass
> +++ b/classes/image.bbclass
> @@ -107,6 +107,7 @@ fakeroot do_rootfs () {
>  
>  	${IMAGE_PREPROCESS_COMMAND}
>  
> +	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{print ${IMAGE_EXTRA_SPACE} + $1}'`

Can it be done like this:

ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = ${IMAGE_EXTRA_SPACE} + $1; \
 print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`

>  	${@get_imagecmds(d)}
>  
>  	${IMAGE_POSTPROCESS_COMMAND}

-- 
Denys


