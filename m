Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GhYSU-0005nv-G7
	for openembedded-devel@openembedded.org; Tue, 07 Nov 2006 22:26:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kA7LOnhf013748;
	Tue, 7 Nov 2006 21:24:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13054-10-2; Tue,  7 Nov 2006 21:24:44 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kA7LOXc5013701
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 7 Nov 2006 21:24:33 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <20061010221107.GB20799@twibble.org>
References: <20060914001918.GA8432@twibble.org>
	<452B83DC.2020503@dominion.kabel.utwente.nl>
	<20061010221107.GB20799@twibble.org>
Date: Tue, 07 Nov 2006 21:24:33 +0000
Message-Id: <1162934673.5714.5.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: site/* Common site files
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
X-List-Received-Date: Tue, 07 Nov 2006 21:26:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2006-10-11 at 08:11 +1000, Jamie Lenehan wrote:
> On Tue, Oct 10, 2006 at 01:28:28PM +0200, Koen Kooi wrote:
> > 
> > The consensus is that we want this in OE, how to we proceed to get this added into .dev?
> 
> If my implementation was ok then I can push it in over a few days.

I did a little experimenting with this. I did find some of it a little
overcomplex for what we need so I came up with a slightly modified
version:

http://www.rpsys.net/openzaurus/temp/oe_site_reorg-r0.patch

The main difference is instead of a set of separate options, you provide
a list of compatible site files for each target. You can add more than
one alias which was a key limitation of the previous version I wanted to
avoid.

As you can see, I started to move the site files around too (for
testing). I've not stress tested it yet but my gut instinct says it can
be safely pushed.

If Jamie is ok with the changes I made and nobody else objects, I'll
push sometime soon :)

Richard





