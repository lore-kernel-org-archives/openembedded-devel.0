Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1PYV8C-0008Lz-Mg
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 03:54:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oBV2ggdV020619;
	Fri, 31 Dec 2010 02:42:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20454-03; Fri, 31 Dec 2010 02:42:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oBV2gW5T020613
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 31 Dec 2010 02:42:32 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Fri, 31 Dec 2010 02:42:28 +0000
Message-ID: <1293763348.17519.11220.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Bitbake Architecture, Roadmap, Maintainers and the future
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Dec 2010 02:54:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is a little friction around bitbake at the moment. I think after a
discussion I had with Chris earlier on some things are clearer and its
probably good to summarise how things stand.

I should make it clear I've not abandoned bitbake. Anyone who has
attended any OEDEM or other Yocto/Poky discussions will know that I
still think/talk a lot about it. I send RFC type emails about major
feature changes before implementation. I've also been actively
developing new bitbake features (checksums and sstate) which just
haven't been ready IMO for bitbake upstream until recently. People have
yet to see the real power of these but they're *very* close to being
useful in the real world now as anyone watching Poky will have seen.

Poky and bitbake upstream were in sync earlier this year. Unfortunately
a bad combination of circumstances have conspired to mean they've
diverged and I've not had a chance to sync between the two. Now I've
come to do so I've found some features I rely on as part of the roadmap
for bitbake have been removed, thus complicating the sync up and further
delaying it.

As a quick summary, the Poky bitbake has the checksum code and next
generation packaged-staging (sstate) whilst bitbake upstream has
parallel parsing and a number of other significant cleanups and features
such as the logging overhaul. For a while Poky's bitbake used a
different execution model to bitbake upstream but we've ended up backing
those changes out due to performance which took a long time and
complicated things as it wasn't desired (or particularly practical to
have that history in bitbake master).

Rightly or wrongly, maintainership of a project like bitbake is as much
about socialising changes and getting discussion and agreement on them
as it is about developing code. It eats a lot of time, you don't get
much thanks for it but it does make life smoother in the long run. I
tend to focus on this a lot having had bad experiences in the past where
ideas don't get socialised properly as it creates friction. I know
others much prefer just to share patches, request review and push, its a
different way of working. This is fine if you know one or the other is
going to happen but if one happens and you expect the other it causes
friction in itself. Discussion first can have benefits as "review" of
code already considered finished is hard as changes are unwelcome.

I consider myself a maintainer of bitbake as I've a long track record of
looking after the architecture of the project long term and ignoring the
past few  months, a strong record of improving the code base, certainly
not making it worse. I don't claim to write perfect code, far from it. I
do intend to continue to work steadily on improving bitbake as per the
roadmaps I've published over the past few years (taking on board input
from others as always as these aren't set in stone).

At present I don't know what role Chris wants to claim with regard to
bitbake, I have assumed now he's back working on it he wanted a
maintainership type role but that brings responsibility for roadmaps and
architecture discussion which I'm not sure he wants. I believe the
nature of bitbake needs these though.

So, bitbake in the future? At present it has bits on berlios (releases,
mailing list and a web manpage) and the git source SCM on
git.openembedded.org. Are we happy with those locations? I find it a bit
confusing...

There are a bunch of people who can commit to bitbake, some inactive,
some active in different areas with different priorities. I think mine
are clear above, I'd appreciate others to make their objectives clear so
everyone understand people's positions and what people plan and don't
plan to do.

Some things bitbake does need are more regular releases and a decent
website and manual overhaul. I know Chris has helped the regular
releases and I appreciate that. I also appreciate the work Chris has
done on bitbake over the past while in general. I have mentioned this
before but people often forget to say thanks so I'll mention it again.
This email isn't meant in any negative way against Chris btw, I just
want to work out what we can do better in future.

For releases, I know the berlios interface isn't ideal and it might be
possible to automate things more which the investment might be worth it
into for more regular releases.

There is also the possibility Yocto could help in some way,
infrastructure wise, manpower to undertake certain tasks (release
automation) and maybe others. What I don't want is for any assistance
offered to be seen as "takeover" or other "interference" from Yocto as
that isn't the intention and I'd rather stay clear than have that
happen.

Thoughts/Comments?

Cheers,

Richard




