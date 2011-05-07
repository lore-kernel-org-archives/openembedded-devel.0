Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QIf1P-0003e3-1B
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 12:46:03 +0200
Received: by bwz5 with SMTP id 5so3441731bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to:x-pgp-key
	:user-agent; bh=Hd7TzrD70sjEPiU7FZMTXuuOlBxb164mAp4Ff7z01NU=;
	b=hPt/XhF5V/UPp8BBTAtOBuXSQJurxlBygysJ1hA4zIh7VuinmNJgN6pub37Hp+fFYi
	Tr3rtCP/Wp6VDih3xT+3lJycoRa2emBQxeG2fv4/Gdp6KymAao1vJataYHC99LPpvtwN
	Y/nIsPkFl6q/JVnwGxCQnvKTxsUqcJ7CawJmM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:x-pgp-key:user-agent;
	b=BsRoTSgABi9Scbep2kljb0jHO+9+DT6cftDq9PR3gctzKdeLve72w75gxwz2lSs94V
	mBWzKwpTJLjzEYbXyR3E501NJ4QfqQKlYNQfby1c0IjyLXKid6zNohbz6QBsGjDu96EA
	Q001MhwNdrQmAYvDJk5dZ1aprs29z6a0wCopU=
Received: by 10.204.84.142 with SMTP id j14mr2449821bkl.20.1304765000864;
	Sat, 07 May 2011 03:43:20 -0700 (PDT)
Received: from becca.fritz.box (85-127-63-62.dynamic.xdsl-line.inode.at
	[85.127.63.62])
	by mx.google.com with ESMTPS id q24sm2505122bks.9.2011.05.07.03.43.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 03:43:20 -0700 (PDT)
Date: Sat, 7 May 2011 12:43:20 +0200
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110507104319.GA7356@becca.fritz.box>
References: <20110507093351.GA28914@free.fr>
MIME-Version: 1.0
In-Reply-To: <20110507093351.GA28914@free.fr>
X-PGP-Key: http://cs.uni-salzburg.at/~mlippautz/pub.asc
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: problem with fetching u-boot git and bitbake git fetch debugging
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
X-List-Received-Date: Sat, 07 May 2011 10:46:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I assume you merge [1] into org.oe.dev tree and tried to build that.

On Sat, May 07, 2011 at 11:33:51AM +0200, Patrice Dumas wrote:
> ...
> #@TYPE: Machine
> #@NAME: OMAP3 based Archos Gen 8
> #@DESCRIPTION: Machine configuration for the Archos Gen8 devices
> 
> TARGET_ARCH = "arm"
> require conf/machine/include/omap3.inc
> 
> #ASSUME_PROVIDED += "u-boot"
>

You should comment that line in, telling OE that it can assume some u-boot, so
doesn't try to build it. (It is commented in the archos default configuration.)

Otherwise you have to tell OE which revision of the u-boot git sources you want
to build. Have a look at [2] for this. 

If there's no explicit need for building u-boot (maybe it's binary is shipped
somewhere else) I would go with commenting ASSUME_PROVIDED in.

>
> PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> XSERVER = "xserver-xorg \
>            xf86-input-evdev \
>            xf86-input-mouse \
>            xf86-input-tslib \
>            xf86-video-omapfb \
>            xf86-input-keyboard"
> 
> #What is the correct one, both seem in use?
> MACHINE_GUI_CLASS = "bigscreen"
> GUI_MACHINE_CLASS = "bigscreen"
> 
> #1024 * 600 Widescreen
> MACHINE_DISPLAY_WIDTH_PIXELS = "1024"
> MACHINE_DISPLAY_HEIGHT_PIXELS = "600"
> 
> KERNEL_IMAGETYPE = "zImage"
> 
> PREFERRED_PROVIDER_virtual/kernel = "linux-omap-archos"
> 
> # Ship all kernel modules
> MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
> 
> IMAGE_FSTYPES += "tar.bz2"
> EXTRA_IMAGECMD_jffs2 = "-lnp "
> 
> SERIAL_CONSOLE = "115200 ttyS2"
> 
> MACHINE_FEATURES = "kernel26 apm alsa bluetooth usbgadget usbhost keyboard vfat ext2 screen touchscreen wifi"
> 

-Michael

[1] http://www.archos.com/support/download/firm_dev/archos-gen8-openembedded.tar.gz
[2] http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/u-boot/u-boot_git.bb


