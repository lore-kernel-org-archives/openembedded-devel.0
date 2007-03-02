Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HMvSt-0004yz-E6
	for openembedded-devel@openembedded.org; Fri, 02 Mar 2007 01:17:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l220Hdfo012137
	for <openembedded-devel@openembedded.org>; Fri, 2 Mar 2007 00:17:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11341-07 for <openembedded-devel@openembedded.org>;
	Fri,  2 Mar 2007 00:17:36 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l220HTKh012076
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 2 Mar 2007 00:17:29 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45E6FDF8.2040103@dominion.kabel.utwente.nl>
References: <E1HMgkl-0004SM-Gs@linuxtogo.org>
	<1439152940.20070301165525@vanille-media.de>
	<45E6FDF8.2040103@dominion.kabel.utwente.nl>
Date: Fri, 02 Mar 2007 00:17:30 +0000
Message-Id: <1172794651.19220.109.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE	policy:	remove feed management tools
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
X-List-Received-Date: Fri, 02 Mar 2007 00:17:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2007-03-01 at 17:23 +0100, Koen Kooi wrote:
> Michael 'Mickey' Lauer schreef:
> > koen commit wrote:
> >> rootfs_ipk: as per OE policy: remove feed management tools
> > 
> > Guys, please don't play games. Since it is a handy feature indeed,
> > can we perhaps agree on making this a seperate bbclass to keep both of
> > you satisfied?

Mickey has a point here. There are a number of people upset by the
recent deploy directory changes. I would like a calm rational discussion
to take place before any further commits are made on this subject.

Personally, I'm currently undecided. I'd like to hear more from both
sides. If there is a convincing reason for breaking deploy as a feed
behaviour, I'm listening. If we can use deploy as a feed and just need
to fix some broken tools, we should consider allowing that (even if its
a case of user beware and not officially supported).

Moving on to Koen's comments:

> All feed management was removed a long time ago from OE because
> 
> a) it's out of scope
> b) can't be done right in an automated fashion

Can you explain b) a bit more?

> And after discovering some bugs in ipkg-utils a while ago it seems you have to manually
> munge the Packages file to get something that ipkg will handle correctly when upgrading stuff.

Does this not mean we need to fix ipkg or ipkg-utils? Can you explain
what the problem is as a lot of people would like to know. We might even
the find someone to fix it...

> So whichever way you look at it it's going to add broken behaviour to OE. I don't want to
> explain to users why their 'feeds' don't work because they disabled common sense because
> 'OE generated it'.
>
> But but but but but... OE generates feeds now as well!! Right, deploy/ipk contains
> subdirectories people could abuse as feeds if they want, but I wouldn't recommend it.

Something a little more technical would be good here. 

We have a spectrum of users with differing abilities. I do things I'd
not recommend people did all the time. In a lot of those cases, if
someone's patches stopped me doing them for no good reason, I'd want to
fix that.

> So *if* people *need* OE to generate feeds, there you have them. However, I strongly
> oppose adding know broken behaviour to satisfy lazy people.

What is this known broken behaviour you keep talking about?

I will add that feed generation is something that most OE users have to
deal with at some point. It would be nice to have a wiki page or
something showing some best practise in managing them. I know I'll have
to face this with poky at some point and others are in a similar
position. I don't think feed management should dictate how OE's
directory structure works but I'm also not sure saying feed management
is something external is a good idea either since we're all going to
have to deal with it at some point.

Cheers,

Richard




