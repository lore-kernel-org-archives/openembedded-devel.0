Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HMvoq-0006tP-Aj
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Mar 2007 01:40:21 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 3C2841F1FCA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2007 19:40:20 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Thu, 01 Mar 2007 19:40:20 -0500
X-Sasl-enc: 6XPCqCM+s5LIrjWrLCdVXiEix0p3+Q3vJLsSxeX8gcOX 1172796019
Received: from [127.0.0.1] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 5ABC6245A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2007 19:40:18 -0500 (EST)
Message-ID: <45E7725C.7040705@whitby.id.au>
Date: Fri, 02 Mar 2007 11:09:56 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1HMgkl-0004SM-Gs@linuxtogo.org>	<1439152940.20070301165525@vanille-media.de>	<45E6FDF8.2040103@dominion.kabel.utwente.nl>
	<1172794651.19220.109.camel@localhost.localdomain>
In-Reply-To: <1172794651.19220.109.camel@localhost.localdomain>
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per	OE	policy:	remove feed management tools
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
X-List-Received-Date: Fri, 02 Mar 2007 00:40:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

">" = RP, ">>" = Koen ...

> Mickey has a point here. There are a number of people upset by the
> recent deploy directory changes. I would like a calm rational discussion
> to take place before any further commits are made on this subject.

The voices of reason.  Thank you.

> Personally, I'm currently undecided. I'd like to hear more from both
> sides. If there is a convincing reason for breaking deploy as a feed
> behaviour, I'm listening. If we can use deploy as a feed and just need
> to fix some broken tools, we should consider allowing that (even if its
> a case of user beware and not officially supported).

Unslung and SlugOS has been using an rsync of the tmp/deploy/ipk
directory (with no changes) for over two years, without a single
complaint from either developers or users.

>> All feed management was removed a long time ago from OE because
>>
>> a) it's out of scope

I want it to be in scope.  Who makes the decision as to what's in scope
and what's out of scope.  If I want to bring something that was
previously out of scope (and we've seen no documentation that OE feeds
falls in this category, so I don't concede that at all), and it does not
affect any existing use of OE, then who makes the final decision on
whether it can be brought in scope or not?  I truly hope it's not just
the will of a single developer, or a single distro ...

>> b) can't be done right in an automated fashion
> 
> Can you explain b) a bit more?

Seconded.  As stated above, Unslung and SlugOS have been doing this for
two years in an automated way with nothing more than "rsync" and what's
already in OE.  No complaints from developers or users.  No upgrade
problems.  No bugs reported.  That doesn't mean it works for any other
distros, but we haven't been given the technical information of how it
breaks for anyone yet ...

> I will add that feed generation is something that most OE users have to
> deal with at some point. It would be nice to have a wiki page or
> something showing some best practise in managing them. I know I'll have
> to face this with poky at some point and others are in a similar
> position. I don't think feed management should dictate how OE's
> directory structure works but I'm also not sure saying feed management
> is something external is a good idea either since we're all going to
> have to deal with it at some point.

If OE wants to ensure that developers and users handle feeds correctly,
then the support should (IMHO) be added to OE, so that any bugs in that
handling are fixed in a central place, rather than each distro or
maintainer or developer handling feed generation in multiple
incompatible ways ...

-- Rod


