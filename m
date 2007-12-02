Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1IydXe-0006Fc-Rq
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 02:22:44 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id C710A59466;
	Sat,  1 Dec 2007 20:19:24 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Sat, 01 Dec 2007 20:19:24 -0500
X-Sasl-enc: b6nMIVdv6E1yQVkYTKwuDfdakp5Yc+VAr4IWGAtyv94u 1196558364
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id C11BB3A21;
	Sat,  1 Dec 2007 20:19:23 -0500 (EST)
Message-ID: <475207FB.8020405@whitby.id.au>
Date: Sun, 02 Dec 2007 11:48:51 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@openembedded.org>
Cc: angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
Subject: RFC: Add ipkg to minimal image
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
X-List-Received-Date: Sun, 02 Dec 2007 01:22:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I just realised that minimal-image.bb doesn't include ipkg, whereas the
first image which does include ipkg (console-image) includes a whole lot
of other stuff which could be installed using ipkg after first boot and
network access, and which make the image too big for a machine with
limited flash space (like an NSLU2).

Is there a reason why minimal-image does not include ipkg?  What exactly
is the definition of what should be in minimal-image which excludes the
ability to install further packages?

Does anyone object to me adding ipkg support to minimal-image?

FYI, minimal-image.rootfs.jffs2 for ixp4xx is 3.8M whereas
console-image.rootfs.jffs2 for ixp4xx is 7.1M

-- Rod


