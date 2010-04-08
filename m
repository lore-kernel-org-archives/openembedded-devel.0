Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NzrH6-0007p1-9w
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 14:56:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id BFA71A47B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 13:52:38 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id I8JVb1UgZhP9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 13:52:36 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 0348BA452E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 13:52:35 +0100 (BST)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id ED60E28A46; Thu,  8 Apr 2010 13:53:17 +0100 (BST)
Date: Thu, 8 Apr 2010 13:53:17 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100408125317.GC2262@xora-desktop.xora.org.uk>
References: <l2pfca63bcf1004080544ze5d9af0cw4c3b1ea9ea30e597@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <l2pfca63bcf1004080544ze5d9af0cw4c3b1ea9ea30e597@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] omap3-mkcard.sh: Adding sleep and umounts to fix race cond.
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
X-List-Received-Date: Thu, 08 Apr 2010 12:56:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Wont those extra umounts make the script exit when I have set my
machine not to automount the partitions?

Graeme

On Thu, Apr 08, 2010 at 02:44:15PM +0200, Michael Lippautz wrote:
> * Adds sleep to wait for blocknodes in /dev
> * Adds unmounts to fix possible automounts
> 
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  contrib/angstrom/omap3-mkcard.sh |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
> 
> diff --git a/contrib/angstrom/omap3-mkcard.sh b/contrib/angstrom/omap3-mkcard.sh
> index d8b5b43..1cf6817 100755
> --- a/contrib/angstrom/omap3-mkcard.sh
> +++ b/contrib/angstrom/omap3-mkcard.sh
> @@ -1,5 +1,5 @@
>  #! /bin/sh
> -# mkcard.sh v0.4
> +# mkcard.sh v0.5
>  # (c) Copyright 2009 Graeme Gregory <dp@xora.org.uk>
>  # Licensed under terms of GPLv2
>  #
> @@ -30,10 +30,14 @@ echo ,9,0x0C,*
>  echo ,,,-
>  } | sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE
> 
> +sleep 1
> +
>  if [ -b ${DRIVE}1 ]; then
> +	umount ${DRIVE}1
>  	mkfs.vfat -F 32 -n "boot" ${DRIVE}1
>  else
>  	if [ -b ${DRIVE}p1 ]; then
> +		umount ${DRIVE}p1
>  		mkfs.vfat -F 32 -n "boot" ${DRIVE}p1
>  	else
>  		echo "Cant find boot partition in /dev"
> @@ -41,9 +45,11 @@ else
>  fi
> 
>  if [ -b ${DRIVE}2 ]; then
> +	umount ${DRIVE}2
>  	mke2fs -j -L "rootfs" ${DRIVE}2
>  else
>  	if [ -b ${DRIVE}p2 ]; then
> +		umount ${DRIVE}p2
>  		mke2fs -j -L "rootfs" ${DRIVE}p2
>  	else
>  		echo "Cant find rootfs partition in /dev"
> -- 
> 1.6.4.4
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


