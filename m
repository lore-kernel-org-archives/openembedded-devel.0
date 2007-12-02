Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1Iyvrm-0006RY-1G
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Dec 2007 21:56:42 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 4E78C5AC6B;
	Sun,  2 Dec 2007 15:53:20 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Sun, 02 Dec 2007 15:53:20 -0500
X-Sasl-enc: /mIfVU8tfwfPLy25h9FX6XU9gmRc3eNpFU/hmyNubPwK 1196628799
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 4CA80262ED;
	Sun,  2 Dec 2007 15:53:19 -0500 (EST)
Message-ID: <47531B1B.9000700@whitby.id.au>
Date: Mon, 03 Dec 2007 07:22:43 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <475207FB.8020405@whitby.id.au>
	<704452397.20071202201743@gmail.com>
In-Reply-To: <704452397.20071202201743@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Angstrom-devel] RFC: Add ipkg to minimal image
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
X-List-Received-Date: Sun, 02 Dec 2007 20:56:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>   While your work on getting useful small Angstrom images are of
> course great, I think definition of minimal image as above as perfect
> as it can get, so it would be better to create separate image. That
> would lead to proliferation, as we already have
> minimal-image-with-mtd-utils, but well, forking stuff for copies to
> undergo evolution is apparently better than hacking axiom for each
> occasion. Just my 2 cents.

That's why I'm asking.  The axiom is not documented anywhere
(there should be a comment at the top of each image file saying
what the definition and intent of the image is), so one has to
first determine whether a fork is required, or whether the changes
fit in the definition of the intent of the image.

By the conflicting replies here, it is clear that the intent of
minimal-image.bb is not well defined.  Who is the maintainer of
that image, and could that person please document the intent at
the top of the minimal-image.bb file?

I do agree with those who need a *really* minimal image, and I
poked CoreDump to free up the essential-image.bb namespace as a
candidate for the name of that type of image, in case the
not-really-that-minimal definition of minimal-image prevails.

-- Rod


