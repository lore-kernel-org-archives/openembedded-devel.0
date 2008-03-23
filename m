Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JdZGl-0002DC-PE
	for openembedded-devel@openembedded.org; Mon, 24 Mar 2008 00:06:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2NN6TOq031899
	for <openembedded-devel@openembedded.org>; Sun, 23 Mar 2008 23:06:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31584-08 for <openembedded-devel@openembedded.org>;
	Sun, 23 Mar 2008 23:06:24 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2NN6Kkf031893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 23 Mar 2008 23:06:20 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47E5A67B.5030809@dls.net>
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
	<200803180849.21108.geoffrey@pager.net>	<frojpb$m6j$1@ger.gmane.org>
	<1205858910.7500.39.camel@dax.rpnet.com> <frosov$c0b$1@ger.gmane.org>
	<47E5A67B.5030809@dls.net>
Date: Sun, 23 Mar 2008 23:06:19 +0000
Message-Id: <1206313579.4529.85.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Sun, 23 Mar 2008 23:06:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm not going to comment specifically on the various aspects of this
thread, it makes depressing reading and I can sympathise with the
various sides.

Yes, there is a strong desire to remove ipkg from OE entirely from
certain parties and the reasons are political and complicated since
there is a lot of history involved. Personally I'm on the fence, ipkg is
a known quantity, bugs and all but I can see benefits of opkg.

Personally I wasn't particularly keen on changing Poky but others were
and I have other things that I feel more strongly about to expend energy
on so Poky changed. I don't have a problem with the changes in Poky, I'm
not sure that change should have rolled into OE quite as quickly
however.

The main problem is the situation that OE has left some distributions
in. Opkg is not compatible with ipkg despite their similarities due to
the changed files locations. We've therefore just forced a massive ABI
change on users and I'm not sure the consequences have been considered
and it did need more discussion than it got :/. Solutions to the issues
were certainly not mentioned in the discussion although I did hint at
the problems.

Where do we go from here?

Judging from the comments we have some people who want to continue to
use ipkg, is OE.dev going to support that? I know what several people
are going to answer and there is going to be a conflict here :(. There
is no technical reason both ipkg and opkg can't be in OE.dev with the
appropriate magic.

This does raise the question of whether basing a distribution directly
off .dev is a good idea? I know some people do, I also know its called
the OE development branch for a reason.

The thing is I don't think this is a technical problem, its more a
question about how OE.dev is managed and who can do what and how. If we
all had to write down the aims and objectives of OE.dev, every one would
be different :/.

I could wade into this discussion as I've done in others but I don't
particularly want to and I'd prefer to let someone else deal with it.
I've already wasted far too much time trying to type this so far, this
is about the 3rd version since I'm not getting across what I think is
the right message to all parties :/.

The battering I've had recently on list, off list and on irc are enough
to make me seriously consider why I do what I do and whether I want to
continue doing it.

Richard - wishing everyone could coexist



