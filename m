Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1IzCQI-0001Cf-6o
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2007 15:37:26 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 140AA59771;
	Mon,  3 Dec 2007 09:34:00 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Mon, 03 Dec 2007 09:34:00 -0500
X-Sasl-enc: Ois05fvGcqIvycWjYVj7ZwWcocLLM0Y1+2WgQrrJohh5 1196692439
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id E1F6410CAB;
	Mon,  3 Dec 2007 09:33:58 -0500 (EST)
Message-ID: <475413AF.9050603@whitby.id.au>
Date: Tue, 04 Dec 2007 01:03:19 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <47520EA7.8030507@whitby.id.au> <47526A83.30109@student.utwente.nl>
	<475283BC.2030903@whitby.id.au>
	<525897579.20071202212734@gmail.com>
	<475322B8.8000501@whitby.id.au>
	<783254142.20071203161951@gmail.com>
In-Reply-To: <783254142.20071203161951@gmail.com>
X-Enigmail-Version: 0.95.5
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Inclusion of bootloader utilities in task-base
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
X-List-Received-Date: Mon, 03 Dec 2007 14:37:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>   But well, I'm not arguing if you should include the utils in
> question or not, but rather on more general question what should go
> into standard image (or images of different types), and what not.

That's my goal too.  A couple of sentences at the top of each image file
giving it's intent would go a long way to answering these questions.

For example, I'm writing a nas-server-image.bb file right now, and I've
put at the top:

# This image is intended to provide a configuration
# for a network attached storage server device.
#
# Key features are:
#
# 1) Must be able to mount attached storage devices like
# internal disks, external USB disks, etc.  Should support
# various filesystem choices, but ext2 at a minimum.
#
# 2) Must be able to boot from internal flash, or directly
# from a filesystem stored on the attached storage.
#
# 3) Must be able to share that storage across the network
# using various protocols like Samba, NFS, etc.
#
# 4) Bonus points for being able to support other central
# network services like a central gateway machine might.
#
# Although it is tested with the Angstrom distro, it is
# intended to be distro-agnostic.

-- Rod


