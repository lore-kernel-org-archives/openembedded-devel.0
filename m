Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HTSAH-0003oe-ME
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2007 01:25:25 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 6973220037A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2007 20:25:23 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Mon, 19 Mar 2007 20:25:23 -0400
X-Sasl-enc: l113yRCAbzcYYuRHuKcSCadhiX31XFntSW9Pdmvf1T0P 1174350324
Received: from [127.0.0.1] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 9826E32FEB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2007 20:25:24 -0400 (EDT)
Message-ID: <45FF29BF.1040008@whitby.id.au>
Date: Tue, 20 Mar 2007 10:54:31 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <74d0deb30701310740p73af77a7j25a8b4597345903a@mail.gmail.com>
	<1174346093.5824.89.camel@localhost.localdomain>
In-Reply-To: <1174346093.5824.89.camel@localhost.localdomain>
Subject: Re: [PATCH] Epoch support for bitbake
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
X-List-Received-Date: Tue, 20 Mar 2007 00:25:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> Thanks for this, I just checked it in unchanged to bitbake trunk
> (1.9.x). If people test it and are happy, I'm happy for it to be
> backported for 1.8.2 too, at which point OE.dev can maybe start to rely
> upon it.

Dunno whether this is important or not, but OpenMoko (which is now using
svn overlaying OE .dev, not a frozen OE version) uses bitbake 1.6.x with
custom svnnow patches.

So OE.dev starting to rely on epoch support may (I dunno, just asking
the experts) break OpenMoko until they port their svnnow patches to 1.8
and move everyone building openmoko from the official openmoko svn/OE
distro (not the OE.dev-only "openmoko" distro) over to that.

[Please refrain from comments about what OpenMoko should or should not
do with regard to SVN and OE.dev - that's not the issue here.  Or at
least please use a different subject header if you do.]

-- Rod


