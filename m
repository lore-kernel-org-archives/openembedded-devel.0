Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gxga9-00014C-Kb
	for openembedded-devel@openembedded.org; Fri, 22 Dec 2006 10:20:49 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBM9IFox014785 for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2006 10:18:15 +0100
Message-ID: <458BA2D4.3050107@dominion.kabel.utwente.nl>
Date: Fri, 22 Dec 2006 10:18:12 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <458AC366.3030405@dominion.kabel.utwente.nl>	<1151969252.20061221194402@gmail.com>	<458AD0BE.2090100@dominion.kabel.utwente.nl>
	<161362296.20061222011234@gmail.com>
In-Reply-To: <161362296.20061222011234@gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] Enable tune-thumb.inc for all armv5t and armv6t	machines
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
X-List-Received-Date: Fri, 22 Dec 2006 09:20:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Koen,
> 
> Thursday, December 21, 2006, 8:21:50 PM, you wrote:
> 
> []
> 
>>>> Today I seperated the thumb bits from
>>>> conf/machine/include/ipx4xx.conf into
>>>> conf/machine/include/. I'd like to enable for all >=v5t machines, but I'm unsure about
>>>> using positive or negative logic.
>>>   What about armv4t?
> 
>> The codesourcery people are telling horror stories to everyone about armv4t, but I don't
>> believe them anymore after
>> http://www.openembedded.org/repo/org.openembedded.dev/packages/gcc/gcc-4.1.1/unbreak-armv4t.patch
>> 'fixed' EABI on armv4t. I get the distinct feeling csl is trying to strongarm people into
>> using armv5 and armv6.
> 
>>>  plus, thumb has known drawback of reduced performance.
> 
>> I know the 'bx' insn causes a pipeline flush on xscales, any other drawbacks? And more
>> importantly, any numbers?
> 
>   Well common Thumb intros usually have something like "Using Thumb
> can usually reduce code size 1.5 times, while reducing performance by
> 20% because of longer instruction sequences for some operations.".

Yeah, that's what you'd usually see. When I was attending a talk about DSPs[1] at SPS, the
speaker declared "[..] using thumb for better performance." which amused me and other
attendees :)

It's all about which kool-aid you drink.

regards,

Koen

[1] http://acivs.org/sps2006/AbstractList.php?type=regular#159
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFi6LUMkyGM64RGpERAiyGAKCoIoe0p2tAqbJ1J6iPPFnIghzcWACfXdt/
QK9W1UbPFtwgqKc4iiF+Fn8=
=2vJM
-----END PGP SIGNATURE-----


