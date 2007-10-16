Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IhucL-0001fd-4Z
	for openembedded-devel@openembedded.org; Wed, 17 Oct 2007 00:10:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9GLcskF022149
	for <openembedded-devel@openembedded.org>;
	Tue, 16 Oct 2007 22:38:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21942-02-2 for <openembedded-devel@openembedded.org>;
	Tue, 16 Oct 2007 22:38:48 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9GLcB4L022005
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 16 Oct 2007 22:38:11 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20071016171922.2ef1992d@cimmeria>
References: <4714C315.9000508@student.utwente.nl>
	<20071016171922.2ef1992d@cimmeria>
Date: Tue, 16 Oct 2007 22:38:11 +0100
Message-Id: <1192570691.6344.68.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: no-distro goal and SRCREV=1 in bitbake.conf
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
X-List-Received-Date: Tue, 16 Oct 2007 22:10:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-10-16 at 17:19 +0100, Graeme Gregory wrote:
> On Tue, 16 Oct 2007 15:56:37 +0200
> Koen Kooi <k.kooi@student.utwente.nl> wrote:
> 
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > Hi,
> > 
> > SRCREV=1 in bitbake.conf forces people to use a distro, which is
> > bad(TM) according to the OEDEM minutes.
> > 
> > My short term solution:
> > 
> > * SRCREV = "${@bb.fetch.get_srcrev(d)}" in bitbake.conf
> > * SRCREV ?= <foo> in recipes
> > * SRCREV_pn-baz ?= <bar> in distro includes or local.conf
> > 
> > For the medium and long term we should consider adding snapshot
> > recipes for 'proven' revisions next to the 'floating' ones, even if
> > Richard thinks it's a waste of space. Having a host of 'unbreak me'
> > includes is also against our 'sane defaults' goal we decided on at
> > OEDEM.
> > 
> > Comments/ideas/flames?
> > 
> 
> My opinion is with the goal to build with no DISTRO= set then no
> software should be build with floating SVN versions by default.
> 
> So I would opt for the "snapshot" releases style that we have been doing
> for a long time now anyway. For stuff that is needed for basic images
> but has never had a working release.

To put my comment into context, I regard recipes that do SRCREV = "123"
as a waste of space as we may as well just use the svn version for that
with a value for SRCREV set. All the extra recipe does is increase
parsing time by adding files.

If a tarball is created and used for a given recipe that is a bit
different. Is that any different to using the svn recipe with a locked
down SRCREV and a decent tarball mirror source though?

In general the people who want floating recipes know exactly who they
are and what they want. The openmoko people want a certain set of
packages floating and thats fine and definable. They wouldn't want
something like glibc floating for example. I don't think anyone wants
floating everything. This suggests floating recipes should be opt-in.

I'd therefore propose SRCREV="1" stays and sane-srcrevs is included as
standard, containing ?= (it already does) so users/distros/whatever can
override as they see fit.

If we want to change that policy to SRCREV ?= <foo> in recipes, I'm ok
with that and perhaps it would be more obvious, I don't know...

Yes, there are also some issues to do with educating people about minrev
and maxrev but I'm sure with time that can be sorted out and it is
mainly an education issue.

Cheers,

Richard




