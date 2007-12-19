Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4v09-0002fW-4Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2007 10:14:05 +0100
Received: by fg-out-1718.google.com with SMTP id 22so428259fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2007 01:09:05 -0800 (PST)
Received: by 10.86.1.1 with SMTP id 1mr8695605fga.2.1198055345785;
	Wed, 19 Dec 2007 01:09:05 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 13sm20721051fks.2007.12.19.01.09.03
	(version=SSLv3 cipher=OTHER); Wed, 19 Dec 2007 01:09:04 -0800 (PST)
Date: Wed, 19 Dec 2007 11:14:21 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <737651158.20071219111421@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4768D18E.2000105@student.utwente.nl>
References: <E1J4SUo-0006ZZ-Ov@linuxtogo.org>
	<74d0deb30712180217q5cb2c911l8a61567b5511b9d@mail.gmail.com>
	<978793792.20071218133500@gmail.com>
	<74d0deb30712180638y20795870o9e1d0b688298658f@mail.gmail.com>
	<1211397506.20071218170516@gmail.com>
	<4768368B.3010103@whitby.id.au>
	<4768D18E.2000105@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev PDA-like machines with card slots: Enable "vfat" feature.
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
X-List-Received-Date: Wed, 19 Dec 2007 09:14:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Wednesday, December 19, 2007, 10:08:46 AM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Rod Whitby schreef:
>> pHilipp Zabel wrote:
>>>> So now that we have the easy method implemented, let's strive for a correct one.
>>>> I'd say vfat as other file systems should be a distro-only feature,
>>>> cardslot (or "removablestorage") a machine-only one:
>>>> "vfat" in DISTRO_FEATURES and "cardslot" in MACHINE_FEATURES --> task-base-vfat
>>>> "ext2" in DISTRO_FEATURES and ("cardslot" in MACHINE_FEATURES or "hdd"
>>>> in MACHINE_FEATURES) --> task-base-ext2 (without the hdparm
>>>> dependency)
>>>> "hdd" in MACHINE_FEATURES --> hdparm
>>>> etc.
>> 
>> I agree with the principle.  We also need to add 'usbhost' to the list
>> of machine features which can enable the ext2 and vfat distro features
>> (for usb flash sticks on devices with usb host ports).
>> 
>> And of course we need to work out the best way (and appropriate timing)
>> for implementation. :-)
>> 
>> Marcin, Koen, Richard: Do you guys have an opinion on this
>> machine/distro features independent naming and combinations of different
>> names feeding into combined features?  We need agreement on the
>> principle before getting too far into implementation discussion.

> My opinion is that 'DISTRO_*' is a misnomer since it essentially decides
> what gets into an image.

  But the content of the image is one of the most important aspect of
the distro! Actually, a distro in OE is nothing but a name associated
with a set of specific packages with specific versions, with the name
being patched in some packages. So, how "DISTRO_FEATURES" can be a
misnomer?

> But it works on a 'global' task-base, so it
> isn't IMAGE_* either. Maybe we should have a look at what Steve Sakoman
> cooked up for the gumstix people.

> regards,

> Koen




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



