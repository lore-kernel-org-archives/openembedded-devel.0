Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>)
	id 1Pf8cD-0004xd-JZ; Tue, 18 Jan 2011 11:16:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p0IAG3wg003445;
	Tue, 18 Jan 2011 10:16:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02946-09; Tue, 18 Jan 2011 10:15:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p0IAFr6W003438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 18 Jan 2011 10:15:55 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-members@lists.openembedded.org
In-Reply-To: <4D355990.6010304@xora.org.uk>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D355990.6010304@xora.org.uk>
Date: Tue, 18 Jan 2011 10:15:52 +0000
Message-ID: <1295345752.14388.17245.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Tue, 18 Jan 2011 10:16:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-01-18 at 09:12 +0000, Graeme Gregory wrote:
> On 18/01/2011 08:05, Otavio Salvador wrote:
> > On Tue, Jan 18, 2011 at 05:21, Graeme Gregory<dp@xora.org.uk>  wrote:
> >> On 17/01/2011 19:01, Frans Meulenbroeks wrote:
> >>> - where possible stick to one recipe per package. This reduces the
> >>> maintenance work and reduces the QA nightmare of lots of different
> >>> permutations.
> >>> I feel one recipe per package should be the common case for
> >>> applications, and preferably also for libs (although I am well aware
> >>> that especially in the latter case multiple versions cannot always be
> >>> avoided).
> >> OE is not a distro so this is a non starter already, please don't bog
> >> down this discussion by re-opening this again. Angstrom 2008, Angstrom
> >> 2010, kaelios and slugos are all released distributions with different
> >> versions of apps just as a starter and they arent even near the total
> >> number of distros in OE.
> > I disagree. I think having too many versions of a package just makes
> > difficult to get things done:
> >
> >   - it increases the amount of maintainence work;
> >   - has a bigger time to get bugs spoted;
> >
> > Users of old distros ought to use a specific repository and branch.
> > Master ought to be kept clean for 'next distro release'.
> >
> >
> The ultimate end to this way of thinking is that OE reduces to becoming 
> OE-core only as anything else in there is going to be useless to 
> multiple distros.
> 
> This then leads to the big distros like Angstrom maintaining their own 
> large meta data which is basically a fork of todays OE. Then comes the 
> point if Angstrom is providing a much better service to other DISTROS 
> like SlugOS than OE-core does then they might save themselves 
> maintenance time by re-using our large data set. Basically destroying 
> the value of OE and forcing a fork.
> 
> People really have to get out of the mindset that OE is a DISTRO, it is 
> not and must provide services to all DISTRO.
> 
> Ill also point out that gentoo which is probably closest to OE in 
> management of metadata does not pathalogically delete old versions.

Let me just clearly differentiate between the core layer we're trying to
create and meta-oe, the latter of which may contain different layers
with different focuses.

I think the policy in the core can differ from that in meta-oe, it fact
it has to or they are the same thing as Graeme points out.

Different distros have different needs and meta-oe needs to support them
as OE does today. 

The idea is the high quality and testing of the core allows OE to move
forward technologically and gives a shared known quantity for people to
base things off. By known quantity, I mean that people can see and
expect a certain level of tests and functionality to work from it. If
for whatever reason those core versions aren't good enough for a distro
then the distros can override and they can pool their knowledge about
those overrides. If it appears they have to override more often that
they don't, I'd suggest the core isn't fulfilling people's needs and we
should fix the core, testing or processes leading to that. Only time and
experimentation will show exactly how this will work out but I'm pretty
sure it can be done.

I'm certainly planning to learn what difficulties Koen is having with
Yocto and see what we can do to address them. I'd also like to thank
Koen for his efforts in working through this as its only by doing that
we're going to learn and move forward.

Cheers,

Richard




