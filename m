Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1HnXbj-0008B5-BC
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2007 12:16:47 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id E5EB921FF41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2007 06:17:13 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Mon, 14 May 2007 06:16:43 -0400
X-Sasl-enc: r3ov0tHrdexSWjWuOAh7Kdb3qU0ZvCY7mDvYJ2v4j4Ji 1179137802
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 7E0722A87B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2007 06:16:42 -0400 (EDT)
Message-ID: <464836A0.6050705@whitby.id.au>
Date: Mon, 14 May 2007 19:44:56 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1HnWn2-0007PS-SW@linuxtogo.org>
	<46482F23.9050504@dominion.kabel.utwente.nl>
In-Reply-To: <46482F23.9050504@dominion.kabel.utwente.nl>
Subject: Re: [oe-commits] org.oe.dev ixp4xx-kernel: Dropped support for 2.6.21, we're sticking to 2.6.20 stable and 2.6.22 development
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
X-List-Received-Date: Mon, 14 May 2007 10:16:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> rwhitby commit schreef:
>>> ixp4xx-kernel: Dropped support for 2.6.21, we're sticking to 2.6.20 stable and 2.6.22 development
> 
>>> # delete "packages/linux/ixp4xx-kernel_2.6.21.bb"
> 
> You broke feeds and upgrade paths for users of that recipe, could you next time just add
> DEFAULT_PREFERENCE = "-1" or something? Slugos isn't the only user of OE!

My apologies.  Mea culpa.

>  I just got .21 running on my ixp4xx board, and now I have to remove all kernel packages,
> packages built against .21 and find a way for angstrom to deal with that in the feeds for
> people doing 'ipkg upgrade'.

I'll put it back immediately.

-- Rod


