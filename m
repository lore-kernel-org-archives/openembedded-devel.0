Received: from [67.121.157.153] (helo=integratus.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <andy@protium.com>) id 1J4Khd-0003kL-86
	for openembedded-devel@openembedded.org; Mon, 17 Dec 2007 19:28:33 +0100
Received: (qmail 4084 invoked from network); 17 Dec 2007 18:22:30 -0000
Received: from pool-71-116-93-90.snfcca.dsl-w.verizon.net (HELO
	?192.168.1.200?) (andy@71.116.93.90)
	by cuba.integratus.com with ESMTPA; 17 Dec 2007 18:22:30 -0000
Message-ID: <4766BEA8.1020709@protium.com>
Date: Mon, 17 Dec 2007 10:23:36 -0800
From: Andy Wilcox <andy@protium.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20070728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4765E992.2040805@protium.com>
	<4710722265.20071217130911@gmail.com>
	<47668695.5010701@protium.com> <828321445.20071217170249@gmail.com>
In-Reply-To: <828321445.20071217170249@gmail.com>
Subject: Re: RFC: Renaming uboot-utils
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
X-List-Received-Date: Mon, 17 Dec 2007 18:28:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>
>> OP is the only distro that currently needs u-boot-utils (for fw_setenv,
>> a target
>> utility).  I was trying to bend that out of the way: this package won't do
>> anything if you aren't building OP.  But perhaps that was wrong - I should
>> always built that utility, and you can use this package or not.  Is the
>> latter
>> way the right OE way?
>>     
>
>   Yes, I'd say the right way for mainline OE is to use machine/distro
> overrides very sparingly, in selected places only. OE provides
> flexible overrides mechanism to address special needs a vendor may have
> to build its product per its requirements, but such overrides better live
> in vendor trees/overlays. For mainline OE, I'd say it's better to err
> on generality, than create complex and non-maintainable overrides maze
> (an example is OPIE which risked removal from OE due to this, and by
> now has been almost completely cleared off from any
> machine-specific hacks).
>
>   
Sounds reasonable.  I'll adjust that.
>
>> Perhaps the MACHINE|DISTRO_FEATURES uboot should just
>> go away?  It was only needed to make the native mkimage program,
>> which really should be a kernel DEPENDS anyway.  Sound
>> reasonable?
>>     
Let me answer my own question here.  It appears that
MACHINE|DISTRO_FEATURES was serving two purposes - one -
to actually make a u-boot.bin file for the target, and two - to
generate mkimage on the build host.   Given the former, it
should definitely not go away!

A few kernels will need to add the u-boot-utils-native dependency,
notably the linkstation.  I'll make these adjustments in the commit.

Regards,
Andy



