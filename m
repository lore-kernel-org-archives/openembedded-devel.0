Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Namzv-0001I5-Dd
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 10:18:42 +0100
Received: by fxm4 with SMTP id 4so1655777fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 01:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=gdj9WWJXvrNXW2vDwstjm6uRf2N/Ei1o156A0EPMauc=;
	b=LhtBWf2faGVlmNxcWjwdq+EnRUaPqka3gvwBcdEATpf1a4aopxFgd6MR7NR8rNbTqe
	Gz5MH0ab3/eXwmClR3cFbP9guZ9e/JnIs9JRYasP1NJlI/JNnHRQFLsSdW+6GAwSeroW
	quIwdQqC7QxnquShKl6YmihGtUkg9OFWc8P/Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=se5k/ja5hLEoBlj5Ee9TnrHyLaL+LmbfGJymsfpufirCB8gLZIbb/S5HQcamMmSg+u
	WeOKf96hGvrLuMwZqa3FS+IryZHYc0beGtowaip5XvNvm43Gzm457fynCtEW0n0rBqNI
	OWzG+WxtY64mRGB1XIT3DNJLY1Uw5z7qFaHyQ=
Received: by 10.223.94.201 with SMTP id a9mr424110fan.78.1264756576011;
	Fri, 29 Jan 2010 01:16:16 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm367342fxm.4.2010.01.29.01.16.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 29 Jan 2010 01:16:15 -0800 (PST)
Date: Fri, 29 Jan 2010 10:15:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100129091538.GP17310@jama>
References: <20100128200049.GA4958@gmail.com>
	<1264719585.17979.5.camel@trini-m4400>
	<b6ebd0a51001281522u2f7007efr5a306a9e33bbf2bc@mail.gmail.com>
	<20100129082137.GA26715@merkur.sol.de>
MIME-Version: 1.0
In-Reply-To: <20100129082137.GA26715@merkur.sol.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
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
X-List-Received-Date: Fri, 29 Jan 2010 09:18:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 29, 2010 at 09:21:38AM +0100, Jens Seidel wrote:
> On Thu, Jan 28, 2010 at 04:22:32PM -0700, Chris Larson wrote:
> > On Thu, Jan 28, 2010 at 3:59 PM, Tom Rini <tom_rini@mentor.com> wrote:
> > > On Thu, 2010-01-28 at 12:00 -0800, Khem Raj wrote:
> > > > Attached is a small hook for updates that are pushed into repo.
> > >
> > > Is there any way to force the commit to happen, even if the script
> > > doesn't like it?  Can the script edit the commit message, even?  ie if
> > > there's no git commit --ignore-prehook type option, could it see if the
> > > first line is FORCE or something, edit that out and commit?  This will
> > > catch the poorly formed commit messages without being a big burden on
> > > people doing things that don't fit well into the "module: summary" model
> > > (that said, lib*-perl-native: Convert to BBCLASSEXTEND as a first line
> > > makes sense to me).
> > 
> > My worry with editing a commit at push time is, the user's local repository
> > now no longer matches upstream.
> 
> Right, what about two repositories, one with a hook which denies some
> commits and another one without such a hook. The second repository could be
> synced with the first via a cronjob and users are always forced to commit
> to the first repository except they know *exactly* what they are doing
> (maybe by restricting access to a few people only) and want to bypass these
> checks?

This looks like a bit overcomplicated sollution. I think that every
commit message "on edge" of commit policy can be made to go through.

ie: 
fso_recipes: switch from SRCREV to SRCPV
instead of
fso recipes: switch from SRCREV to SRCPV

lib*-perl-native: Convert to BBCLASSEXTEND
could go through as long as it's splited by ' '

is almost as readable as original and easier to s/ /_/ then pusing to
different repo and waiting for cron job to sync it, hoping that nobody
else didn't commit conflicting change to right repo with right commit
message first.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


