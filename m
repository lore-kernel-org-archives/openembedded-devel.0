Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JJeql-0003il-TB
	for openembedded-devel@openembedded.org; Tue, 29 Jan 2008 02:01:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0T11Pw3001187;
	Tue, 29 Jan 2008 01:01:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01058-03; Tue, 29 Jan 2008 01:01:12 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0T10r5u001149
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 29 Jan 2008 01:00:53 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <20080129023105.1a0cf354@widy.localdomain>
References: <20080129011635.42467fc9@widy.localdomain>
	<1201562570.4687.79.camel@localhost.localdomain>
	<20080129023105.1a0cf354@widy.localdomain>
Date: Tue, 29 Jan 2008 01:00:52 +0000
Message-Id: <1201568452.4687.123.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] A case of distro config overriding DISTRO var
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
X-List-Received-Date: Tue, 29 Jan 2008 01:01:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-01-29 at 02:31 +0200, Paul Sokolovsky wrote:
> On Mon, 28 Jan 2008 23:22:50 +0000
> Richard Purdie <rpurdie@rpsys.net> wrote:
> > You need to put the := directly before the code that changes DISTRO.
> > Yes, you could add this in bitbake.conf after local.conf and before
> > including ${DISTRO}.conf but that seems ugly to me.
> 
> Ugly (or better, unclean) is to reuse top-level input parameter from
> user for different purpose. So, at first, the meaning of DISTRO is
> "name of the distro config", and then suddenly it changes to "value to
> use for overrides, etc". The second use should have different name then,
> as again, DISTRO is user's primary input param for OE. That would be
> clean solution...

Distro maintainers have chosen to do this. They could use an
ANGSTROM_DISTRO_VERSION variable to do this instead...
 
> > I'd prefer USERDISTRO = "${DISTRO}" in bitbake.conf and then having
> > angstrom overriding that using := if it really has to...
> 
> ... But as we don't want to revamp OE up to that level ;-), then we
> should find good place to work that around. The issue here is that
> overriding DISTRO is common practice, we even have pe(a)rls like:
> 
> DISTRO = "Jornada Linux Mobility Edition"

Whoever merged that should be shot...

> So, it should be worked around on OE's level (== bitbake.conf), not on
> distro's level.

Distro maintainers dug themselves into this hole...

But yes, I think something at OE level can help. That was my proposal...

> Also, what's exactly ugly? ":="? 

It breaks the way standard variables work and catches people out. It has
a long history of confusing users, developers and even the core devs. I
ended up purging hundreds of the things from the metadata a while back
since all but about 10 were totally unneeded and just confused and broke
things. I have no desire to return to that.

It also stops people from overriding something from their local.conf.

> Then we for sure should make exception
> for bitbake.conf, simply because := is unavoidable for meta-stuff, and
> bitbake.conf already has bunch of them. 

Ok, looking through the conf directory, bitbake.conf has exactly 3 of
them. DATE and TIME are obvious special cases and CACHE is commented to
explain why its special.

Angstrom has one, there are several to trigger fatal errors and the
nylon distro is doing something that looks dubious at best.

In classes there are six references, I know three are valid offhand, the
others look dubious.

So we only have say 10 cases in the core, not very many at all and they
are avoidable.

> IMHO, it's uglier to have
> something defined as "=" in bitbake.conf, and require distro to
> override that with ":=".

The distro is the entity that is overriding DISTRO and making it do two
things. Having it jump through an extra hoop because of that isn't a
problem.

Cheers,

Richard




