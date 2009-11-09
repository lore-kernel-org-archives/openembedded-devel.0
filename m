Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N7XM3-0006l0-K9
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 17:44:39 +0100
Received: by bwz9 with SMTP id 9so3399966bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2009 08:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=XJwOfr7SSt6Bp+BTJ0QsGCePFdU4hJ7duly49N4BXV4=;
	b=icHIYXRYh7+l/7U6y1WUKOwrxXYa5D+us4BMqInIfC2G9+0oZBRYAtrzIUhKxBXB5y
	V+Iq5IObCqBFvVpeyLlBTwF8evv893l/BDBjaN51e/W226/Dh9cmHXz21NV8sQm4Mtg5
	y+8DauEzXLOGXznfBYT6yH8DVdkuagRm6VoAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=uNypDouNb37K3Bn8y7Cnb5jMd42uE7tpeLTYoD2YEK99sgfxPM2vq3z/GZhqkr3wgZ
	CWppXKpKQRiC87FvQuzdgpksWSsiNOz1JI/CLDkLhECJSP3vkDuhsJdXsDfUMfhWFmhy
	HZj/DlAtZMZza4qFbKNi8aIEpowXyGiDorQDM=
Received: by 10.204.153.22 with SMTP id i22mr1250977bkw.123.1257783035683;
	Mon, 09 Nov 2009 08:10:35 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm802532fxm.1.2009.11.09.08.10.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 09 Nov 2009 08:10:35 -0800 (PST)
Date: Mon, 9 Nov 2009 17:10:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091109161020.GE17505@jama>
References: <4AF353C8.80904@cs.put.poznan.pl>
	<4AF74838.6020308@cs.put.poznan.pl> <4AF837F4.1050501@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <4AF837F4.1050501@cbnco.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: menuconfig task for kernels
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
X-List-Received-Date: Mon, 09 Nov 2009 16:44:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2009 at 10:40:36AM -0500, Michael Smith wrote:
> Przemyslaw Wesolek wrote:
> >>Is this the "right" way to do? If so, maybe menuconfig should be added
> >>as 'after do_configure', instead of 'after do_patch'?
> >
> >Anyone?
> 
> Hi Przemek,
> 
> I find if I'm configuring for a new machine, I need to do_patch,
> copy a "close" defconfig into place, run make menuconfig, and copy
> the .config back to the filesdir where it belongs. The menuconfig
> task doesn't save much, as you still have to copy the defconfigs
> around. I don't use the task for that reason, and maybe others are
> in the same boat.
> 
> I think you're right about the order, though; if you sent a patch, I
> would ack it, for what it's worth.
> 
> Mike
Hi,

From what I checked now in linux.inc, then you're right that
do_menuconfig is called just after do_patch, which seems wrong, because
in do_configure_prepend it prepares few lines to .config (like logo,
*abi, thumb) and then appends defconfig without conflicting lines.

If I need to enable some options temporary then I use
-c configure (for sane .config)
-c menuconfig (for temporary modification)
-c build 

But if you want to use menuconfig for updating defconfig used in OE tree
or default config in kernel (like arch/arm/configs/gta02_defconfig) then
do_configure phase would change some options you didn't want to touch
(as they can be OE specific, ie disabling deprecated sysfs paths for
${UDEV_GE_141}.

So 1st case is easily workarounded by user in current state.

2nd will be a bit more difficult if its moved to after do_configure
as you need to revert all changes automagically introduced in 
do_configure_prepend in menuconfig or replace .config with defconfig
between do_configure and do_menuconfig or just use load ../defconfig
option from menuconfig. (Hmm doesn't look more difficult now :))

Btw: haven't checked but if you use
-c menuconfig (create custom config)
-c build

isn't your custom .config rewritten in do_configure phase with defconfig
+ do_configure_prepend automagic?.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


