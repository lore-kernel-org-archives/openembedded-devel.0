Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Lm2c6-0003Tv-Uf
	for openembedded-devel@openembedded.org; Tue, 24 Mar 2009 10:08:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2O96XC6030173
	for <openembedded-devel@openembedded.org>; Tue, 24 Mar 2009 09:06:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30020-03 for <openembedded-devel@openembedded.org>;
	Tue, 24 Mar 2009 09:06:29 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2O96RwK030166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 24 Mar 2009 09:06:28 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>
Date: Tue, 24 Mar 2009 09:06:46 +0000
Message-Id: <1237885606.5348.8.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 09:08:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-03-23 at 13:35 -0700, Chris Larson wrote:
> On Tue, Mar 17, 2009 at 12:18 PM, Chris Larson <clarson@kergoth.com> wrote:
> > I'd like to propose re-establishing MAINTAINER, set per package, to
> > individuals, or left as default for packages which aren't directly
> > maintained.
> >
> > Doing this would:
> > - Facilitate dumping a list of unmaintained packages to give to new
> > users wanting to volunteer to help us, but not knowing how to
> > contribute.
> > - Return some individual responsibility to the project, giving one
> > person the blame for brokenness for that package, as well as giving
> > responsibility for pushing patches upstream to that person.  In my
> > opinion, a number of the recent issues in the project are due, in
> > part, to a lack of that individual responsibility.  Everything is
> > fuzzy, determined by a group, instead.
> > - Allow us to physically separate, in the repository, those packages
> > which get the most attention (are maintained) from those which get the
> > least (maintained by the entire team).  We could finally be *honest*
> > with our users about what we work on, telling them that the packages
> > which are maintained by the team are in need of an individual
> > maintainer, and get less attention, so bugs there will be fixed more
> > slowly, and there are no guarantees on functionality there.  I think
> > it'd be better to have a core set of *functional* recipes than have a
> > huge set of "might work, might not" recipes as things stand today.  In
> > my opinion, this would be more likely to give new users stability than
> > creating a stable branch, while making better use of our limited
> > manpower, rather than increasing the load drastically.
> 
> If no one is against this, I'd say we should start taking ownership of
> packages and setting MAINTAINER in the recipes, after ensuring that
> the packaging code won't put MAINTAINER into the packages.
> 
> Unless someone else wants them, as a start, I'd be willing to take
> autoconf, automake, libtool, and perhaps autotools.bbclass, though
> there's no good mechanism to record that.

Can we use something other than the MAINTAINER variable? The package
classes inject that value into the packages and that is really something
that should be set by the distribution. I'd don't want to end up back in
the position where that variable doesn't have a clear meaning.

It was also intended that the Maintainers file we added when MAINTAINERS
were removes would replace these variables in individual recipes. That
file format was designed to be machine readable so someone could have
written a script to find out who maintained a class/.bb/.conf file. This
has the advantage that is can handle .bbclass file maintainership which
is an issue with the MAINTAINERS variable...

Cheers,

Richard






