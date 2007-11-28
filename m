Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1IxG4N-0004pc-Dx
	for openembedded-devel@openembedded.org; Wed, 28 Nov 2007 07:06:47 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 13F8757371
	for <openembedded-devel@openembedded.org>;
	Wed, 28 Nov 2007 01:03:53 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 28 Nov 2007 01:03:53 -0500
X-Sasl-enc: szU7u7F1S28vvkrN+901xtgND49W97FvFCQEboQ6/5mp 1196229832
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 484C71E667
	for <openembedded-devel@openembedded.org>;
	Wed, 28 Nov 2007 01:03:51 -0500 (EST)
Message-ID: <474D04AC.2010700@whitby.id.au>
Date: Wed, 28 Nov 2007 16:33:24 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: OpenEmbedded Developers <openembedded-devel@openembedded.org>
References: <474C18A5.4030402@whitby.id.au>
In-Reply-To: <474C18A5.4030402@whitby.id.au>
Subject: Re: RFC: Replacing ixp4xx-kernel with linux-ixp4xx
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
X-List-Received-Date: Wed, 28 Nov 2007 06:06:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> Now that SRCREV is assumed available in bitbake and OE, it is time to
> revisit the ixp4xx-kernel recipes and use modern-day ways of doing things.
> 
> To accomplish this, I intend gradually replacing the ixp4xx-kernel
> recipes with linux-ixp4xx recipes which more closely follow OE best
> practices, and allow for sensible usage of linux-ixp4xx kernel recipes
> for all ixp4xx devices (not just those used by nslu2-linux firmware).
...
> This will happen over the coming weeks, and I'll make sure the whole set
> of linux-ixp4xx recipes and supporting files are in place well before
> removing or changing any of the existing ixp4xx-kernel recipes.

Well, I had a spurt of productivity last night, and can build angstrom
using the new linux-ixp4xx kernel, so I've checked in linux-ixp4xx
replacements for all the old ixp4xx-kernel recipes.

I'll wait a reasonable time for review and testing of the new recipes
before removing any old ixp4xx-kernel recipes (and will double check
that nothing else is still using them before doing so).  I will mail
again with a notification before doing so.

Style comments on the new linux-ixp4xx kernel recipes are welcome.
(I guess I should have run them through oe-style-thingo before saying
that ...)

-- Rod


