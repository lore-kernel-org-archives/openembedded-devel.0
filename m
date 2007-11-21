Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IuiQL-0005ya-Bd
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 06:46:57 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 74A0E4C324
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 00:44:44 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Wed, 21 Nov 2007 00:44:44 -0500
X-Sasl-enc: jHlzYaOjkst5wS9aeFdxq/1/1J1Jf9z4nEWiveQHJ3vy 1195623883
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 948A420B3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 00:44:43 -0500 (EST)
Message-ID: <4743C5B8.4030209@whitby.id.au>
Date: Wed, 21 Nov 2007 16:14:24 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>	<4742217C.9060506@whitby.id.au>	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>	<4743201F.8000202@am.sony.com>
	<617697824.20071121042405@gmail.com>
In-Reply-To: <617697824.20071121042405@gmail.com>
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Wed, 21 Nov 2007 05:46:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>    Why not default? Well, because what make builds is usually ones to
> tens of megabytes, while bitbake builds tens to hundreds gigabytes.
> Those who're brave to undertake such endeavour, are expected to get
> some understanding of what they're going to be thru by learning and
> doing some setup with their own hands.

And therein lies the rub.  The reason why the Makefiles came about is
because there is a large number of distribution users who are forced to
use OE (cause it is the only way to develop applications for or build
custom images for a certain platform), but they have *no* interest in
understanding how to build tens to hundreds of gigabytes of stuff with
bitbake.  They are application developers and image customisers, not
distribution developers.

And yes, we all agree with BitBake/OE was not designed for the "casual
user" who has been forced to use it cause there is no other way (for
example) to build an OpenMoko image or create a new application for
OpenMoko.  But the reality of today is that there is a large number of
such users, and they seem to prefer the convenience of the Makefiles.

-- Rod


