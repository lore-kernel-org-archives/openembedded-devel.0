Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JDekG-0001X5-1g
	for openembedded-devel@openembedded.org; Sat, 12 Jan 2008 12:41:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0CBfUMV017323
	for <openembedded-devel@openembedded.org>; Sat, 12 Jan 2008 11:41:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17083-06 for <openembedded-devel@openembedded.org>;
	Sat, 12 Jan 2008 11:41:24 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0CBfKPF017317
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sat, 12 Jan 2008 11:41:20 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fma5ih$5k5$2@ger.gmane.org>
References: <c67f1650801111257g286daeb5xfdec6550eca69dc6@mail.gmail.com>
	<fma5ih$5k5$2@ger.gmane.org>
Date: Sat, 12 Jan 2008 11:41:19 +0000
Message-Id: <1200138079.5288.2.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: mtn disapprove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Jan 2008 11:41:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-01-12 at 11:42 +0100, Rolf Leggewie wrote: 
> John, thank you for being so observative.  I made the changes to
> tune-strongarm.inc as you suggested.  zImage instead of zImage.bin has
> already been committed a couple of days ago.  In fact it was the commit
> that originally started this thread IIRC.  Thanks again.
> 
> I updated http://oz.leggewie.org/wip/machine-config.diff once more to
> reflect the latest status.

Looks good and is fine with me, some really minor comments inline below:

> --- conf/machine/collie.conf	8ec2568fe9cb9c9b5580adf5e26eb873400e040c
> +++ conf/machine/collie.conf	b40e4db0893370c9b1145d8ad93ca1069a1f1002
> @@ -5,22 +5,18 @@ MACHINE_KERNEL_VERSION ?= "2.6"
[...]
> PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>  
> -# This is needed for the ramdisk script to work
> -MACHINE_EXTRA_RDEPENDS += "e2fsprogs-mke2fs"
> -

What happened to this? It looks wrong, I just want to make sure the
underlying problem was fixed...

> --- conf/machine/include/tune-strongarm.inc	4bb1dc721e55061bb98b49bae4f57bd4ff088f02
> +++ conf/machine/include/tune-strongarm.inc	ffef523af56befe09f34efee482f2cb5677e4caf
> @@ -1,2 +1,3 @@
> -TARGET_CC_ARCH = "-march=armv4 -mtune=xscale"
> +TARGET_CC_ARCH ?= "-march=armv4 -mtune=strongarm1100"
> +TARGET_CC_ARCH_collie = "-march=armv4 -mtune=strongarm1110"

We should really have tune-strongarm1100.inc and
tune-strongarm1110.inc...
 
> --- conf/machine/include/zaurus-2.6.inc	7d4d7255328d5d3f3d61e09ec7b527085533b4d6
> +++ conf/machine/include/zaurus-2.6.inc	88f14d96b91bd44fabb62b5b7c9158ed161774be
> @@ -1,8 +1,9 @@
[...] 
>  TARGET_ARCH = "arm"
> -PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5e armv5te"
> +PACKAGE_EXTRA_ARCHS ?= "armv4 armv4t armv5e armv5te"
> +PACKAGE_EXTRA_ARCHS_collie = ""

No need for the ?= here...

> @@ -10,20 +11,14 @@ EXTRA_IMAGECMD_jffs2 = "--little-endian 
>  ERASEBLOCKSIZE_akita = "0x20000"
>  
>  EXTRA_IMAGECMD_jffs2 = "--little-endian --eraseblock=${ERASEBLOCKSIZE} --pad --faketime -n" 
> -
>  IMAGE_CMD_jffs2 = "mkfs.jffs2 -x lzo --root=${IMAGE_ROOTFS} --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
> -
>  EXTRA_IMAGEDEPENDS += "zaurus-updater"
>  
> -# Use tune-xscale per default. Machine independent feeds should be built with tune-strongarm.
> -include conf/machine/include/tune-xscale.inc
> +SERIAL_CONSOLE ?= "115200 ttyS0"

or here...

Cheers,

Richard





