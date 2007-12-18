Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J4jkj-0004pN-KX
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 22:13:25 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 1D7D57FF70
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2007 16:08:29 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Tue, 18 Dec 2007 16:08:29 -0500
X-Sasl-enc: QKxVF2u6YQTZmpg2ikYZLaCoHPtGtI13YIzVYzkwpWP/ 1198012108
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTP id 5861821C4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2007 16:08:28 -0500 (EST)
Message-ID: <4768368B.3010103@whitby.id.au>
Date: Wed, 19 Dec 2007 07:37:23 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1J4SUo-0006ZZ-Ov@linuxtogo.org>	<74d0deb30712180217q5cb2c911l8a61567b5511b9d@mail.gmail.com>	<978793792.20071218133500@gmail.com>	<74d0deb30712180638y20795870o9e1d0b688298658f@mail.gmail.com>
	<1211397506.20071218170516@gmail.com>
In-Reply-To: <1211397506.20071218170516@gmail.com>
X-Enigmail-Version: 0.95.5
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
X-List-Received-Date: Tue, 18 Dec 2007 21:13:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

pHilipp Zabel wrote:
>> So now that we have the easy method implemented, let's strive for a correct one.
>> I'd say vfat as other file systems should be a distro-only feature,
>> cardslot (or "removablestorage") a machine-only one:
> 
>> "vfat" in DISTRO_FEATURES and "cardslot" in MACHINE_FEATURES --> task-base-vfat
>> "ext2" in DISTRO_FEATURES and ("cardslot" in MACHINE_FEATURES or "hdd"
>> in MACHINE_FEATURES) --> task-base-ext2 (without the hdparm
>> dependency)
>> "hdd" in MACHINE_FEATURES --> hdparm
>> etc.

I agree with the principle.  We also need to add 'usbhost' to the list
of machine features which can enable the ext2 and vfat distro features
(for usb flash sticks on devices with usb host ports).

And of course we need to work out the best way (and appropriate timing)
for implementation. :-)

Marcin, Koen, Richard: Do you guys have an opinion on this
machine/distro features independent naming and combinations of different
names feeding into combined features?  We need agreement on the
principle before getting too far into implementation discussion.

-- Rod



