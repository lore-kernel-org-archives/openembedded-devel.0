Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H2Zdh-00031d-Fv
	for openembedded-devel@openembedded.org; Thu, 04 Jan 2007 21:56:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l04KtKfs000324;
	Thu, 4 Jan 2007 20:55:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32685-02; Thu,  4 Jan 2007 20:55:16 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l04KtGct000317
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 4 Jan 2007 20:55:16 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <271237233.20070104210332@gmail.com>
References: <53610736.20061228191750@gmail.com>
	<459403F2.4080102@dominion.kabel.utwente.nl>
	<1167337946.5596.77.camel@localhost.localdomain>
	<1065634639.20061229040545@gmail.com>
	<1167392044.5616.16.camel@localhost.localdomain>
	<271237233.20070104210332@gmail.com>
Date: Thu, 04 Jan 2007 20:55:18 +0000
Message-Id: <1167944118.7757.164.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org, angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] [RFC] Get rid of adhoc machine-specific	messing with [linux-handhelds-2.6] kernel packages
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
X-List-Received-Date: Thu, 04 Jan 2007 20:56:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-01-04 at 21:03 +0200, Paul Sokolovsky wrote:
>   No. My original mail said that it lead to broken snapshots released
> for hx4700, so I RFCed its removal for it, and for another PocketPC
> machine, htcuniversal, because I'm pretty sure it can live without it.

Why were the snapshots broken? Was the problem not the total lack of a
zImage file. The fact that doesn't automatically deploy atm is actually
a bitbake trunk issue as it doesn't see any dependency to trigger that.
If those devices don't boot from a kernel within the image and need a
separate one, this would appear to be an unrelated problem as most users
are not going to extract the zImage from the image file.

> > Machine config files set information that is specific to the machine.
> > Whether of not a given machine has a sucky bootloader is a property of
> > the machine.
> 
>   Point of view. It's all just point of view. Many-many people would
> consider you crazy for wanting to install something else, handmade,
> instead of vendor-carved-in stuff. But you smile and do just that. And
> yet you tell that /home partition and bootloader are carved in stone.
> But someone else will flash them away just as easily.

I was thinking of the Zaurus case where the separate zImage is a
property of the machine at this time as there are no practical
alternatives to having a kernel outside the rootfs. The hh.org case is
admittedly less clear cut. There are documented standard methods of
using these handhelds with Linux and its machine specific whether a
separate kernel is required or not. Having this documented on a per
machine basis therefore makes more sense than hardcoding it into the
linux-*.inc files. The example would be when I try a Zaurus kernel from
hh.org. If its set in the machine files, the hh.org kernel would stand a
better chance of working.

At the end of the day its the machine maintainer's choice. You put RFC
in the subject and you got comments. You don't have to agree with them!

>   As argued, on the order of magnitude you'd have been had already.
> But err..., I don't ask Zaurus to switch. Just to let PocketPCs try it,
> and preferably, consistently. We already have user support nightmare
> just because there're few adhoc kernel install/upgrade methods for each of
> the few well supported models, and lack of any booting for the rest.

I said this reply was to both you and Koen. Koen called for one unified
approach which implies the Zaurus would have to follow your proposal. I
took issue with that for the reasons I outlined. 

>   Ok, so it's clear that Zaurus machines need to keep using existing
> methods, and those methods should not be touched. On the other hand, I
> hope I was able to argue that other machines might have other
> requirements. In this regard, I'll still need to argue to machine
> mentors of (PocketPC!) machines in question to drop
> FILES_kernel-image_MACH = "".

You've shown your position, I've not seen other PocketPC machine
maintainers comment. You won't change my view regarding the hx2000
either though ;-).

>   But anyway, I think that ROOTFS_POSTPROCESS_COMMAND +=  "remove_zimages; "
> thing is still useful. It doesn't mean that machines should switch to
> it, but it offers nice, potentially machine-independent, way to remove
> zImage file from the image. So, besides alternative way to produce
> real rootfs image without zImage which will be still possible to
> upgrade with ipkg (even if semi-manually) - and that's considered to
> be a feature, not breakage, it can be useful for other things, like
> initrd creation.

In one breath you complain about the zimage packages being a "hack at
best". You then propose hacking the generated images ;-).

Richard





