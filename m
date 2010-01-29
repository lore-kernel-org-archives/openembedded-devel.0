Received: from fmmailgate01.web.de ([217.72.192.221])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1Namme-0000Du-Dr
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 10:04:59 +0100
Received: from smtp06.web.de (fmsmtp06.dlan.cinetic.de [172.20.5.172])
	by fmmailgate01.web.de (Postfix) with ESMTP id 4CC32145CFD74
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 09:39:02 +0100 (CET)
Received: from [79.215.3.251] (helo=merkur.sol.de)
	by smtp06.web.de with asmtp (TLSv1:AES256-SHA:256)
	(WEB.DE 4.110 #314) id 1NamNZ-0004em-00
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 09:39:01 +0100
Received: from jens by merkur.sol.de with local (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1Nam6k-0006xN-2P
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 09:21:38 +0100
Date: Fri, 29 Jan 2010 09:21:38 +0100
From: Jens Seidel <jensseidel@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100129082137.GA26715@merkur.sol.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20100128200049.GA4958@gmail.com>
	<1264719585.17979.5.camel@trini-m4400>
	<b6ebd0a51001281522u2f7007efr5a306a9e33bbf2bc@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6ebd0a51001281522u2f7007efr5a306a9e33bbf2bc@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: tux-master@web.de
X-Sender: tux-master@web.de
X-Provags-ID: V01U2FsdGVkX19VWq56ckWKEXh6sCAdPa962qEFf8acLBKPbUX6
	/TMnrOSwxBr3fLR0c+6lMs9ZU7CviMB2NA1AlhwS/OH9Oiwn/o TaNhOMfFw=
X-SA-Exim-Connect-IP: 217.72.192.221
X-SA-Exim-Mail-From: tux-master@web.de
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
X-List-Received-Date: Fri, 29 Jan 2010 09:05:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 28, 2010 at 04:22:32PM -0700, Chris Larson wrote:
> On Thu, Jan 28, 2010 at 3:59 PM, Tom Rini <tom_rini@mentor.com> wrote:
> > On Thu, 2010-01-28 at 12:00 -0800, Khem Raj wrote:
> > > Attached is a small hook for updates that are pushed into repo.
> >
> > Is there any way to force the commit to happen, even if the script
> > doesn't like it?  Can the script edit the commit message, even?  ie if
> > there's no git commit --ignore-prehook type option, could it see if the
> > first line is FORCE or something, edit that out and commit?  This will
> > catch the poorly formed commit messages without being a big burden on
> > people doing things that don't fit well into the "module: summary" model
> > (that said, lib*-perl-native: Convert to BBCLASSEXTEND as a first line
> > makes sense to me).
> 
> My worry with editing a commit at push time is, the user's local repository
> now no longer matches upstream.

Right, what about two repositories, one with a hook which denies some
commits and another one without such a hook. The second repository could be
synced with the first via a cronjob and users are always forced to commit
to the first repository except they know *exactly* what they are doing
(maybe by restricting access to a few people only) and want to bypass these
checks?

Jens


