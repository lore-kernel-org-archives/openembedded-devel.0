Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NhPWO-0003Wi-AP
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 16:39:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1GFarsp025534
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 15:36:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25434-03 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 15:36:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1GFajNN025528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 15:36:46 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a51002160616m462683b3nd2f4b17524395ddf@mail.gmail.com>
References: <1266316492.6436.127.camel@rex>
	<ac9c93b11002160258m2ddee8absd0510adad4179c6d@mail.gmail.com>
	<1266320987.6436.135.camel@rex>
	<b6ebd0a51002160616m462683b3nd2f4b17524395ddf@mail.gmail.com>
Date: Tue, 16 Feb 2010 15:36:44 +0000
Message-ID: <1266334604.6436.159.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
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
X-List-Received-Date: Tue, 16 Feb 2010 15:39:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-02-16 at 07:16 -0700, Chris Larson wrote:
> On Tue, Feb 16, 2010 at 4:49 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> 
> > On Tue, 2010-02-16 at 11:58 +0100, Frans Meulenbroeks wrote:
> > > Sounds quite nice.
> > > Didn't study the class code, but it would be nice if within layer.conf
> > > I could use a relative path, which then is turned into an absolute
> > > path when the layer.conf file is read
> >
> > This is what the LAYERDIR variable gives us.
> >
> > Having relative paths would lose all context outside the layer.conf
> > file. We could hardcode a list of variables that needed to be processed
> > and so on but LAYERDIR removes all that complexity whilst still letting
> > you move things around.
> >
> > > That means layer.conf can become very standard wrt BBPATH etc. and you
> > > can even move layers around.
> >
> > You should be able to do that with my proposal, the only file that would
> > need changing is bblayers.conf, not the layers themselves.
> 
> Can you explain what the use case is for needing this much control?  I find
> it unlikely that it would be problematic to simply add each layer as a full
> path to a list of layers in a single file, and leave it at that (i.e.
> bblayers.conf).  If site files aren't in the layer, they won't be used.  If
> recipes aren't around, they won't be used.  It seems a bit silly if every
> layer.conf ends up being a copy of every other layer.conf.  And this sort of
> blind copying tends to lead to problems and cruft (just look at distros that
> copy angstrom).

Several reasons:

a) I like the idea of a given overlay shipping with a description in
some form of what it contains. Its intuitive.
b) I don't want to hardcode behaviour in bitbake (see c/d)
c) Are recipes in a recipes or a packages directory?
d) How deep are the paths to the .bb files?
e) What priority are assigned to the layers?
f) Should a given layer append or prepend to BBPATH? 

It also means that if we add some kind of new functionality we have to
update bitbake to add the appropriate variables, or add horrible
anonymous methods to poke around BBLAYERS.

When the alternative is a single .conf file describing a layer, I know
which I prefer even if most might be two lines of boilerplate.

I was also thinking of your recursive bitbake 'abomination' ;-). With
this new functionality, its possible some code in one of the layers
could check ahead and checkout other layers if it noticed they were
missing. We'd need some additional code for that but its an idea in the
back of my mind.

Cheers,

Richard




