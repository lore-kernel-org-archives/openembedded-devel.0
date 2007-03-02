Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HN41M-0001hH-7V
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Mar 2007 10:25:48 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id BDD831F4CA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2007 04:25:47 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Fri, 02 Mar 2007 04:25:47 -0500
X-Sasl-enc: 4wSv7mRklSbriNbHMmJs8Z8n+e8g1jNP0O6a03buTbRd 1172827547
Received: from [127.0.0.1] (unknown [58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id BAE3B245C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2007 04:25:46 -0500 (EST)
Message-ID: <45E7ED77.2090103@whitby.id.au>
Date: Fri, 02 Mar 2007 19:55:11 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <HOECLKEKOHLAMMGDLLBHIEJEKEAA.skoroneos@digital-opsis.com>
In-Reply-To: <HOECLKEKOHLAMMGDLLBHIEJEKEAA.skoroneos@digital-opsis.com>
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE, policy:	remove feed management tools
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
X-List-Received-Date: Fri, 02 Mar 2007 09:25:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Stelios Koroneos wrote:
> I am not sure how many of you are building multimachine distro's but the old
> system was not a very good solution.
> We are building a distro for a number of machines x86 arch (i486, i585,
> i686), a number of powerpc targets  and recently mipsel and puttinng
> everything in a giant ipk pool is not the best of solutions.
> 
> As far as i can understand its a case where  single machine distro's made
> use of this OE feature while multimachine distros had to look for other ways
> (i.e post processing).

Perhaps when multimachine was added, the deploy ipk feed support should
have been updated to continue to work, instead of later breaking single
machine feed support.

Just because it works for some, doesn't mean it works for all.  Just
because it doesn't work for some, doesn't mean it's not useful for others.

> From what i read so far there seems to be 2 solutions
> Either allow for the old behaviur of OE through some 'switch' and let the
> distro mainter decide what do to or document the new way of handling feeds.
> In my case i would prefer the second option, as both single and multimachine
> distro's could use the same mechanism to update their feeds

The third (and my preferred) option is not just to document the new way
of handling feeds, but fix OE to handle feeds in the multimachine case.
 OE is meant to make things easier and more consistent, not meant to
force people to *all* do postprocessing to do a common action (like
having a development feed or a simply rsync'ed public feed).

If a feature is commonly used, and fervently wanted by those who use it,
then breaking or deleting it is not a way to keep developers using OE
... especially in corporate situations like Andy recounted, where ease
of development feeds is a selling feature internally against other
home-grown build solutions.

-- Rod


