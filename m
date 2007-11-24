Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IvlBd-0000pu-7R
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Nov 2007 03:56:05 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 272934C474
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2007 21:53:35 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 23 Nov 2007 21:53:35 -0500
X-Sasl-enc: GmypW8mDS73h4+0Wwk5igB0Mhj7bldraoExeUlRJ8pEC 1195872814
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 5C9402460A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2007 21:53:34 -0500 (EST)
Message-ID: <4747921A.8000300@whitby.id.au>
Date: Sat, 24 Nov 2007 13:23:14 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1Iv6U0-0003D9-3S@linuxtogo.org>	<4746C4A5.6040501@student.utwente.nl>	<05db01c82dfe$1401e230$6e01a8c0@twilight>
	<c384c5ea0711231351u1b91c5b6o437ecc5d512991e8@mail.gmail.com>
In-Reply-To: <c384c5ea0711231351u1b91c5b6o437ecc5d512991e8@mail.gmail.com>
Subject: Re: [oe-commits] org.oe.dev SlugOS: ixp4xx-kernel - added	2.6.23.8 recipe and supporting files. (Note that
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
X-List-Received-Date: Sat, 24 Nov 2007 02:56:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> On Nov 23, 2007 7:24 PM, Mike (mwester) <mwester@dls.net> wrote:
>> The set of developers that will actually be using that recipe is
>> extraordinarily small (two at present), so the relative benefit of such
>>
> Sorry, this seems to be some misconception amongst the nslu2 
> developers. The use base for the mainline bleeding edge kernels is
> much larger*. I assume that every active board developer want to try
> and verify the new kernels against his hardware *and* is using
> OpenEmbedded to do so ;-)

No misconception at all.  In fact, that's the very reason why the
ixp4xx-kernel.inc file exists - to make it very easy to test the
absolute latest bleeding edge kernel.

For example, just by naming your .bb file ixp4xx-kernel_2.6.24-rc3-git1
(which is about as bleeding edge as you can get right now), you get
exactly that version built, without having to do anything else in the
SRC_URI field.  So tracking the latest -gitNN bleeding edge checkin by
Linus (or by Alan with the -ac series, or by Andrew with the -mm series)
is as simple as changing the name of the .bb file.

This is all clearly explained in the voluminous comments at the top of
the ixp4xx-kernel.inc file.

Of course Koen didn't write it, so instead of reading the comments to
understand what it does, he says the following:

Koen Kooi wrote:
> I would have fixed it myself, but the huge block of
> python magic in ixp4xx-kernel.inc scared me away.

Which is pretty much par for the course for Koen ... anything he didn't
write is by definition substandard and shouldn't be used.  He'll
probably even reply to this to explain why all this ixp4xx-kernel.inc
functionality has been implemented the wrong way and doesn't follow the
unwritten "spirit" of OE ...

-- Rod


