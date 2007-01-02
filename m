Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1H1sJ7-00070c-J2
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jan 2007 23:40:33 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 048335A4F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jan 2007 17:37:11 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by out1.internal (MEProxy); Tue, 02 Jan 2007 17:37:11 -0500
X-Sasl-enc: H+06Xb0uA5bxWcOJc3C+kf8zUEwpT0zar2TVAZuMYBcX 1167777430
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 3990812A99
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jan 2007 17:37:09 -0500 (EST)
Message-ID: <459ADF1C.4060506@whitby.id.au>
Date: Wed, 03 Jan 2007 09:09:24 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <459AB9D0.2090904@dominion.kabel.utwente.nl>
In-Reply-To: <459AB9D0.2090904@dominion.kabel.utwente.nl>
Subject: Re: Spurious merges with monotone
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
X-List-Received-Date: Tue, 02 Jan 2007 22:40:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Someone (or something) just pushed over 170 csets consisting only of merges. Looking at
> the key that committed them it seems that it was a automatic merge. Could the guilty admin
> stop that please?

Apologies - that was (inadvertently) me.

RP pushed a bitbake change, and I updated it on our autobuilder machine
(cause that's where the bitbake problem was being exhibited, so it was
the quickest place to test the fix).  I then did a "make push-bitbake"
to update our org.nslu2-linux.bitbake branch.

Unfortunately, an oversight in our Master Makefile meant that "make
push-bitbake" did not push just the bitbake branch, but pushed all
branches (which meant that it pushed all the auto-merges that the
autobuilder does when org.openembedded.dev has multiple heads).

I have corrected the Makefile so that it only pushes the branch
requested.  Note that the autobuilder still doesn't auto-push anything -
it was (and continues to be) a manual choice (and a manual step) to push
anything back from the autobuilder.

And our monotone.nslu2-linux.org server does not do any merging (it
leaves multiple heads as-is for developers to deal with), so it cannot
be the source of such merge cset pushes (unless some other human pushes
such csets through it).

-- Rod


