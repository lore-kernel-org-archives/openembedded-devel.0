Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1Iyg1d-000076-Fp
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 05:01:49 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id F0AA658AEC;
	Sat,  1 Dec 2007 22:58:31 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sat, 01 Dec 2007 22:58:31 -0500
X-Sasl-enc: CitfYfTeh1EoxiPyPUoAo/Z62qGJ9Y2ddSh0sM3ciEf6 1196567911
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id EB3952BF6;
	Sat,  1 Dec 2007 22:58:30 -0500 (EST)
Message-ID: <47522D46.1050309@whitby.id.au>
Date: Sun, 02 Dec 2007 14:27:58 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@openembedded.org>, 
	angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
References: <475207FB.8020405@whitby.id.au>
In-Reply-To: <475207FB.8020405@whitby.id.au>
Subject: Re: RFC: Add ipkg to minimal image
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
X-List-Received-Date: Sun, 02 Dec 2007 04:01:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> I just realised that minimal-image.bb doesn't include ipkg, whereas the
> first image which does include ipkg (console-image) includes a whole lot
> of other stuff which could be installed using ipkg after first boot and
> network access, and which make the image too big for a machine with
> limited flash space (like an NSLU2).

RFC #1:
> Is there a reason why minimal-image does not include ipkg?  What exactly
> is the definition of what should be in minimal-image which excludes the
> ability to install further packages?

RFC #2:
> Does anyone object to me adding ipkg support to minimal-image?

OK, of course the choice of ipkg as the package manager is
distro-specific, and depends on the distro including feed configuration
(although just having a package manager on hand even with a feed
configuration would be a useful addition to a minimal image).

So my revised RFC #2 is to add a DISTRO_PACKAGE_MANAGER variable, which
DISTROs define (along with their feeds), and use that variable directly
in the tasks and images which should include the ability to install
additional packages after first boot, instead of the package manager
stuff just being part of the generic DISTRO_EXTRA_RDEPENDS additions and
all the additional stuff that includes which could be ipkg installed
later if you have limited flash space and need to pick and choose what
you include.

Whether or not that gets added to minimal-image, or whether we need a
new minimal-but-expandable-by-installing-packages-image, will depend on
the answer to RFC #1.

Comments?

-- Rod


