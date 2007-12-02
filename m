Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1IywNC-00039o-0m
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Dec 2007 22:29:10 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 349EE5B6CE;
	Sun,  2 Dec 2007 16:25:48 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Sun, 02 Dec 2007 16:25:48 -0500
X-Sasl-enc: R6Vyoyx3DwbQNhV2He1kXqEpIaPSmcdwUv5y9u9PyZw6 1196630747
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 3523D27218;
	Sun,  2 Dec 2007 16:25:46 -0500 (EST)
Message-ID: <475322B8.8000501@whitby.id.au>
Date: Mon, 03 Dec 2007 07:55:12 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <47520EA7.8030507@whitby.id.au> <47526A83.30109@student.utwente.nl>
	<475283BC.2030903@whitby.id.au>
	<525897579.20071202212734@gmail.com>
In-Reply-To: <525897579.20071202212734@gmail.com>
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
X-List-Received-Date: Sun, 02 Dec 2007 21:29:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>   This raises the question if user should be allowed (far less
> required) to change bootloader's standard cmdline as *the normal
> course of using distro* (== task-base). So, maybe the 1st choice ("Is
> it good idea at all") is worth more attention.

Ah, this is a question about which parts of task-base a DISTRO should
include or not (by use of it's DISTRO_FEATURES).  Not about whether
task-base should give distros the choice in the first place.

Is Angstrom (the only DISTRO which currently has this feature enabled)
meant to be a hand-holding-for-naive-users distro, or a power-users distro?

And yes, it's most likely that an end-user distro would put a shell script
wrapper around the bootloader utility to safeguard the user for normal
end-user operations like changing the rootfs load location, or setting up
nfsroot operation.

-- Rod


