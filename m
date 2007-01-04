Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H2aIs-00053J-3T
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jan 2007 22:39:14 +0100
Received: by nf-out-0910.google.com with SMTP id l24so7486209nfc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2007 13:37:56 -0800 (PST)
Received: by 10.48.217.20 with SMTP id p20mr25692070nfg.1167946676633;
	Thu, 04 Jan 2007 13:37:56 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id q27sm93851519nfc.2007.01.04.13.37.55;
	Thu, 04 Jan 2007 13:37:56 -0800 (PST)
Date: Thu, 4 Jan 2007 23:38:09 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <343253992.20070104233809@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1167944118.7757.164.camel@localhost.localdomain>
References: <53610736.20061228191750@gmail.com>
	<459403F2.4080102@dominion.kabel.utwente.nl>
	<1167337946.5596.77.camel@localhost.localdomain>
	<1065634639.20061229040545@gmail.com>
	<1167392044.5616.16.camel@localhost.localdomain>
	<271237233.20070104210332@gmail.com>
	<1167944118.7757.164.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] [RFC] Get rid of adhoc machine-specific messing with [linux-handhelds-2.6] kernel packages
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
X-List-Received-Date: Thu, 04 Jan 2007 21:39:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Thursday, January 4, 2007, 10:55:18 PM, you wrote:

> On Thu, 2007-01-04 at 21:03 +0200, Paul Sokolovsky wrote:
>>   No. My original mail said that it lead to broken snapshots released
>> for hx4700, so I RFCed its removal for it, and for another PocketPC
>> machine, htcuniversal, because I'm pretty sure it can live without it.

> Why were the snapshots broken? Was the problem not the total lack of a
> zImage file. The fact that doesn't automatically deploy atm is actually
> a bitbake trunk issue as it doesn't see any dependency to trigger that.

  It was quite simple: while usually snapshots include standalone
zImage, 1219 lacked it. It's not issue for the most devices, because
zImage can be taken from rootfs, but hx4700 for example lacks it,
rendering snapshot for it useless.

  Obviously, it's small release mistake, but mistakes like this will
come up again and again.

> If those devices don't boot from a kernel within the image and need a
> separate one, this would appear to be an unrelated problem as most users
> are not going to extract the zImage from the image file.

  It's a matter of habit. I personally find it quite natural to have
kernel in /boot, because that's what I have with all other Linuxes I
run around.


>> > Machine config files set information that is specific to the machine.
>> > Whether of not a given machine has a sucky bootloader is a property of
>> > the machine.
>> 
>>   Point of view. It's all just point of view. Many-many people would
>> consider you crazy for wanting to install something else, handmade,
>> instead of vendor-carved-in stuff. But you smile and do just that. And
>> yet you tell that /home partition and bootloader are carved in stone.
>> But someone else will flash them away just as easily.

> I was thinking of the Zaurus case where the separate zImage is a
> property of the machine at this time as there are no practical
> alternatives to having a kernel outside the rootfs. The hh.org case is
> admittedly less clear cut. There are documented standard methods of
> using these handhelds with Linux and its machine specific whether a
> separate kernel is required or not. Having this documented on a per
> machine basis therefore makes more sense than hardcoding it into the
> linux-*.inc files. The example would be when I try a Zaurus kernel from
> hh.org. If its set in the machine files, the hh.org kernel would stand a
> better chance of working.

  Yes, machine config is much better than kernel recipes. And as long
as machine choices can be overridden by distro's, that's just perfect
solution too.

> At the end of the day its the machine maintainer's choice. You put RFC
> in the subject and you got comments. You don't have to agree with them!

  Well, I didn't expect that to be easy, that's why I decided to raise
this topic early ;-)

>>   As argued, on the order of magnitude you'd have been had already.
>> But err..., I don't ask Zaurus to switch. Just to let PocketPCs try it,
>> and preferably, consistently. We already have user support nightmare
>> just because there're few adhoc kernel install/upgrade methods for each of
>> the few well supported models, and lack of any booting for the rest.

> I said this reply was to both you and Koen. Koen called for one unified
> approach which implies the Zaurus would have to follow your proposal. I
> took issue with that for the reasons I outlined. 

>>   Ok, so it's clear that Zaurus machines need to keep using existing
>> methods, and those methods should not be touched. On the other hand, I
>> hope I was able to argue that other machines might have other
>> requirements. In this regard, I'll still need to argue to machine
>> mentors of (PocketPC!) machines in question to drop
>> FILES_kernel-image_MACH = "".

> You've shown your position, I've not seen other PocketPC machine
> maintainers comment. You won't change my view regarding the hx2000
> either though ;-).

>>   But anyway, I think that ROOTFS_POSTPROCESS_COMMAND +=  "remove_zimages; "
>> thing is still useful. It doesn't mean that machines should switch to
>> it, but it offers nice, potentially machine-independent, way to remove
>> zImage file from the image. So, besides alternative way to produce
>> real rootfs image without zImage which will be still possible to
>> upgrade with ipkg (even if semi-manually) - and that's considered to
>> be a feature, not breakage, it can be useful for other things, like
>> initrd creation.

> In one breath you complain about the zimage packages being a "hack at
> best". You then propose hacking the generated images ;-).

  Because packages and images are two different things. Packages can
be used for different purposes - at lease for initial rootfs creation
and for following upgrades, whereas image's purpose is more specific
and constrained. So as usual, the question is not to do or not to do,
but how (in particular, in what place). I'll raise question of initrd
creation later in separate topic.


> Richard





-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



