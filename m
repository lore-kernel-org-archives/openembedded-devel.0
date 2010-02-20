Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NiyJ2-00005B-0u
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Feb 2010 00:00:15 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o1KMqfrn004181 for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Feb 2010 22:52:41 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vyv7tRKBUOy3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Feb 2010 22:52:41 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o1KMqZeO004173
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Feb 2010 22:52:37 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a51002191739r245abeafq23de526308a29bab@mail.gmail.com>
References: <1266316492.6436.127.camel@rex>
	<b6ebd0a51002160616m462683b3nd2f4b17524395ddf@mail.gmail.com>
	<1266334604.6436.159.camel@rex>
	<201002181009.07359.marcin@juszkiewicz.com.pl>
	<b6ebd0a51002180813q171a3d41kef83d708f4ba6eea@mail.gmail.com>
	<1266512303.6436.1199.camel@rex>
	<b6ebd0a51002191739r245abeafq23de526308a29bab@mail.gmail.com>
Date: Sat, 20 Feb 2010 22:58:15 +0000
Message-Id: <1266706695.2134.23.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Improve our default conf file setup
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
X-List-Received-Date: Sat, 20 Feb 2010 23:00:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2010-02-19 at 18:39 -0700, Chris Larson wrote:
> On Thu, Feb 18, 2010 at 9:58 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> > On Thu, 2010-02-18 at 09:13 -0700, Chris Larson wrote:
> > > With COLLECTIONS (and BBLAYERS could work similarly), all the overlay
> > > priorities and bbpath ordering are automatically determined based on the
> > > order of entries in the variable.  Documented as highest-to-lowest.
> > >
> > > Note that I'm not necessarily arguing against the use of a per-layer
> > > configuration file, as this seems like it would be quite useful, but I
> > > question the need for the boilerplate.
> >
> > Its certainly possible to put defaults in which would handle the
> > "standard" case. My main dislike is having to hardcode behaviour and
> > variable handing into bitbake in that case.
> 
> Not hardcoding *any* behavior into bitbake is how we got into the mess that
> we're in,

In many ways, its helped make bitbake what it is IMO. Bitbake and OE
have a fairly clearly modularised structure where you can replace
individual elements and this is a major attraction of it. Yes it causes
some pain at times but it also makes many things possible too.

>  and is likely the source of a large amount of confusion on the
> part of our userbase, and is likely the cause of some of the performance
> issues as well.  Flexibility is good, but there's a point at which the
> benefits no longer outweigh the drawbacks.

The performance issues seem to stem from two things, the anonymous
methods and the way our data store works as far as I can tell. We could
do with finding a better way to handle the methods I agree but they also
have massive benefits too. 

As for confusion of the userbase, this i still more a documentation
problem. Those who really understand it don't document it. The
documentation I have written is for Poky and few people bother to read
it, even if most of it is generic :(. Starting to hardcode behaviour is
unlikely to lead to much improvement for the users IMO.

> > The idea that adding an empty layer.conf file breaks a previously
> > working overlay seems counter intuitive too...
> >
> 
> The layer itself deciding where it goes in the BBPATH is not obvious or nice
> or clear to me the way it seems to be to you.  How can a given layer claim
> to know where it should go in the bbpath, what its priority should be?

Think about how people are going to use layers. Its never likely that a
random collection of layers are going to work together without some
(possibly minor) effort. Layers are going to end up advertised as being
enhancements for OE, Poky or some specific choice.

The "policy" on where in BBPATH (prepend or append) and actual priority
numbers are going to be a policy decision for those projects, just like
the bitbake.conf.

I'm quite happy if a standard emerges. My point is that policy should
not be in bitbake if we can help it.

>   I
> think it makes a great deal more sense to let the order/information in
> bblayers.conf define that, as the user has direct control over that.  Can
> you think of any cases where a given layer could possibly know better than
> the user, or where defining the priority via BBLAYERS is insufficient?
>  Regarding BBFILES, there's nothing to hardcode.  Add the layer to BBFILES,
> let bitbake find the recipes, and you have BBMASK to remove the ones you
> don't want.

I disagree but its pointless to take this further and spoil what
otherwise is a useful patch, we'll just add the default behaviour you
describe.

Cheers,

Richard





