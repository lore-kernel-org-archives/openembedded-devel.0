Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Mfpnk-0007Wi-2R
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 08:46:42 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id CBD8316DFDD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 08:28:51 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 897412A424D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 08:28:51 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 25 Aug 2009 08:28:43 +0200
Message-ID: <4A938478.9010105@dresearch.de>
Date: Tue, 25 Aug 2009 08:28:08 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A92AECA.6070309@dresearch.de>
	<d1b08f940908240835o462431b5j13a983016675a0dc@mail.gmail.com>
In-Reply-To: <d1b08f940908240835o462431b5j13a983016675a0dc@mail.gmail.com>
X-OriginalArrivalTime: 25 Aug 2009 06:28:43.0812 (UTC)
	FILETIME=[4B378640:01CA254D]
Subject: Re: IMAGE_FSTYPES for u-boot initrd images?
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
X-List-Received-Date: Tue, 25 Aug 2009 06:46:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Andrea Adami schrieb:
> for something similar, check in recipes/images, specifically the
> initramfs-* and the bootcd images.
> Another image using a cpio.gz and a custom init is initramfs-kexecboot-image.

Good examples for initrd/initramfs. But that's not the point.

These recipes create cpio.gz images but not images ready for u-boot. Such images need to be wrapped with [uboot-]mkimage similar to kernel uImages. Would be great to have support for this in a central place, to be able to choose e.g. cpio.gz.uimage in IMAGE_FSTYPES.

Steffen





