Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NaeUq-0002n1-79
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 01:14:04 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NaeSW-0007KX-2c from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 16:11:36 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 28 Jan 2010 16:11:35 -0800
Received: from 172.30.80.228 ([172.30.80.228]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri, 29 Jan 2010 00:10:40 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	28 Jan 2010 17:10:39 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a51001281522u2f7007efr5a306a9e33bbf2bc@mail.gmail.com>
References: <20100128200049.GA4958@gmail.com>
	<1264719585.17979.5.camel@trini-m4400>
	<b6ebd0a51001281522u2f7007efr5a306a9e33bbf2bc@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Thu, 28 Jan 2010 17:10:39 -0700
Message-Id: <1264723839.17979.6.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 29 Jan 2010 00:11:35.0579 (UTC)
	FILETIME=[9E97EEB0:01CAA077]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: update hook for git to check push commit message
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
X-List-Received-Date: Fri, 29 Jan 2010 00:14:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2010-01-28 at 16:22 -0700, Chris Larson wrote:
> On Thu, Jan 28, 2010 at 3:59 PM, Tom Rini <tom_rini@mentor.com> wrote:
> 
> > On Thu, 2010-01-28 at 12:00 -0800, Khem Raj wrote:
> > > Hi
> > >
> > > Attached is a small hook for updates that are pushed into repo.
> > > Right now it only checks the first line of the commit and expects
> > > module: summary
> >
> > Is there any way to force the commit to happen, even if the script
> > doesn't like it?  Can the script edit the commit message, even?  ie if
> > there's no git commit --ignore-prehook type option, could it see if the
> > first line is FORCE or something, edit that out and commit?  This will
> > catch the poorly formed commit messages without being a big burden on
> > people doing things that don't fit well into the "module: summary" model
> > (that said, lib*-perl-native: Convert to BBCLASSEXTEND as a first line
> > makes sense to me).
> >
> 
> My worry with editing a commit at push time is, the user's local repository
> now no longer matches upstream.  One would hope a rebase would intelligently
> handle it, but from a configuration management perspective I don't think
> modifying commits behind the user's back is a very sane thing.
> 
> Now, if you did this locally at commit time rather than push time, I think
> that would be less crazy, but unfortunately a clone can't bring along hooks
> :\

Ah, I forgot it would be on the server side and I don't see a way to
force the push if a hook fails.

-- 
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


