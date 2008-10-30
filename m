Received: from [76.96.30.96] (helo=QMTA09.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tmtalpey@rcn.com>) id 1Kvdux-0005WP-D6
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 21:15:04 +0100
Received: from OMTA01.emeryville.ca.mail.comcast.net ([76.96.30.11])
	by QMTA09.emeryville.ca.mail.comcast.net with comcast
	id YyKg1a0040EPchoA98Dqug; Thu, 30 Oct 2008 20:13:50 +0000
Received: from tmt.rcn.com ([98.229.118.72])
	by OMTA01.emeryville.ca.mail.comcast.net with comcast
	id Z8Dn1a00C1ZoUlN8M8DoK8; Thu, 30 Oct 2008 20:13:49 +0000
X-Authority-Analysis: v=1.0 c=1 a=rrURNiKU2znL3d7GMEkA:9
	a=0zQ4K94IzrJC0GrXg2DpZJ8uPRAA:4 a=h9s5Ru71U4oA:10
X-Mailer: QUALCOMM Windows Eudora Version 7.1.0.9
Date: Thu, 30 Oct 2008 16:10:46 -0400
To: openembedded-devel@lists.openembedded.org
From: Tom Talpey <tmtalpey@rcn.com>
In-Reply-To: <1225393313.4235.451.camel@lenovo.internal.reciva.com>
References: <1225294016.3822.81.camel@mill.internal.reciva.com>
	<E1KvYmj-0007s2-Og@linuxtogo.org>
	<1225379284.3822.154.camel@mill.internal.reciva.com>
	<E1Kvahy-0001AR-Sj@linuxtogo.org>
	<1225386831.17961.15.camel@mill.internal.reciva.com>
	<E1Kvc17-0001Gl-VY@linuxtogo.org> <E1KvcSD-0007H7-V3@linuxtogo.org>
	<1225393313.4235.451.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
Subject: Re: arm kernel configurations
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
X-List-Received-Date: Thu, 30 Oct 2008 20:16:46 -0000
Message-ID: <MADEUP.15FE1A160A8047CE.13558@groups.io>
Content-Type: text/plain; charset="us-ascii"

At 03:01 PM 10/30/2008, Phil Blundell wrote:
>On Thu, 2008-10-30 at 14:37 -0400, Tom Talpey wrote:
>> Interesting. This time it booted all the way to GPE. But, hid2hci
>> faulted and the kernel trapped on it. Nothing strange at all about
>> that binary, and the same one works fine on the OABI kernel.
>
>That's very strange indeed.  Does it do the same thing every time or is
>it more random than that?

Perfectly repeatable.

>> >Unable to handle kernel paging request at virtual address 560000b8
>
>This doesn't seem to have any obvious relation at all to the OABI
>setting.  There's no reason why the kernel should be trying to access
>that memory address during a core dump.  At a first appearance I would
>say that you have some kind of hardware problem (misconfigured memory or
>the like) but obviously in that case you would expect it to fail under
>OABI too.  So, all in all, very weird.

I don't think it's hardware, because it works fine at all other times (i.e.
booting other kernels and no other changes). And, there's nothing really
to mess up on the H1940 configuration-wise.

The good news for me is that I'm having really good success running a
new 2.6.27 kernel. I've done a ton of stuff to it, but having the new
upstream s3c mci driver is a huge boon to making it work properly. I also
got sound working, by writing some code to use the uda1380 codec driver
already upstream, and turning on "alsa" in the oe machine.conf.

Except for a bootloader, reading the battery level and this OABI strangeness
(plus a couple of other kernel config glitches) I dare say it's a complete port.
Almost ready to share it...

Tom.



