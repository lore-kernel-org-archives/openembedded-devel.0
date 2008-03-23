Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1JdZu5-0007mz-80
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Mar 2008 00:47:05 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id CC22FDB270
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Mar 2008 19:47:04 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Sun, 23 Mar 2008 19:47:04 -0400
X-Sasl-enc: foAINwih23msoTVObthqz0namPTP3dIYB01v1AfuYQxX 1206316024
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTPSA id DD4992F718
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Mar 2008 19:47:03 -0400 (EDT)
Message-ID: <47E6EBC0.7070004@whitby.id.au>
Date: Mon, 24 Mar 2008 10:16:08 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>	<200803180849.21108.geoffrey@pager.net>	<frojpb$m6j$1@ger.gmane.org>	<1205858910.7500.39.camel@dax.rpnet.com>
	<frosov$c0b$1@ger.gmane.org>	<47E5A67B.5030809@dls.net>
	<1206313579.4529.85.camel@dax.rpnet.com>
In-Reply-To: <1206313579.4529.85.camel@dax.rpnet.com>
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Sun, 23 Mar 2008 23:47:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> Judging from the comments we have some people who want to continue to
> use ipkg, is OE.dev going to support that? I know what several people
> are going to answer and there is going to be a conflict here :(. There
> is no technical reason both ipkg and opkg can't be in OE.dev with the
> appropriate magic.

I personally would be happy to use opkg on .dev, if the transition to it 
was managed properly.  ipkg has been stagnant for some years now.

> This does raise the question of whether basing a distribution directly
> off .dev is a good idea? I know some people do, I also know its called
> the OE development branch for a reason.

If you don't base the unstable HEAD of your distribution off .dev, then 
.dev will never get the testing it requires, and you will never be able 
to get your distribution included in the next stable branch.

> The thing is I don't think this is a technical problem, its more a
> question about how OE.dev is managed and who can do what and how. If we
> all had to write down the aims and objectives of OE.dev, every one would
> be different :/.

I think here it is simply a case of some people being unable to say 
"sorry, I made a mistake, lets see how we can fix it" and instead trying 
to point the blame at others.

We all realise that pushing .dev forward will cause breakage, and that 
there should be no stigma associated with that breakage as long as there 
is a transition proposal reviewed on the ML first.  In this instance, 
(as I remember it), there was a proposal to move, but no transition plan 
reviewed.  If there is a transition plan, and implementing that reviewed 
plan causes breakage, then no-one should complain about that, and 
everyone should just put their egos aside and pitch in and help fix the 
problems.  The escalation occurs when people try to deflect the issue on 
to others instead of dealing with it directly in a technical manner.

-- Rod


