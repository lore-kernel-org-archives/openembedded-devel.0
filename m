Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Nadjg-0000jK-5k
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 00:25:20 +0100
Received: by pzk30 with SMTP id 30so981716pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 15:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=n5wWPWPlKqbA+TUv1uoQHtUDUYDNqlTFy0XBA4nv9jk=;
	b=XX1NptlPNia8LjglOFC4GVnHb5t38S7EZYkjSMBGXRySdTKXwUWeAl01ClHWSK8JBB
	r1G3/HzhKyWl5CN2R8hfOovVeDNgYKIx25Hl+c8TRXlflOMq8da8mmnVVG6Aya4j8Jo3
	ULconbGUsvDXhso2Ne/vQMrqRAH95CzdFW+mA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=N15gX/g9ULn3uDJV5/jLMZOlswV6jrQg1X9Tz45qMO+bFdtbgbuBZOya5DGeFuYGnn
	qTWtyuBBe/GBTv+anK5gqYiECXdFeh+ky8uwkI0lGofezfNvXRnNEg/cocXr1QHo16nd
	WOUCorvQHUA5E5MM77OvFJDIAl8aYNI/OyTPo=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.4.39 with SMTP id 39mr12457wfd.76.1264720972070; Thu, 28 
	Jan 2010 15:22:52 -0800 (PST)
In-Reply-To: <1264719585.17979.5.camel@trini-m4400>
References: <20100128200049.GA4958@gmail.com>
	<1264719585.17979.5.camel@trini-m4400>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 28 Jan 2010 16:22:32 -0700
X-Google-Sender-Auth: b8c4227dcbd3a917
Message-ID: <b6ebd0a51001281522u2f7007efr5a306a9e33bbf2bc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Thu, 28 Jan 2010 23:25:20 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 28, 2010 at 3:59 PM, Tom Rini <tom_rini@mentor.com> wrote:

> On Thu, 2010-01-28 at 12:00 -0800, Khem Raj wrote:
> > Hi
> >
> > Attached is a small hook for updates that are pushed into repo.
> > Right now it only checks the first line of the commit and expects
> > module: summary
>
> Is there any way to force the commit to happen, even if the script
> doesn't like it?  Can the script edit the commit message, even?  ie if
> there's no git commit --ignore-prehook type option, could it see if the
> first line is FORCE or something, edit that out and commit?  This will
> catch the poorly formed commit messages without being a big burden on
> people doing things that don't fit well into the "module: summary" model
> (that said, lib*-perl-native: Convert to BBCLASSEXTEND as a first line
> makes sense to me).
>

My worry with editing a commit at push time is, the user's local repository
now no longer matches upstream.  One would hope a rebase would intelligently
handle it, but from a configuration management perspective I don't think
modifying commits behind the user's back is a very sane thing.

Now, if you did this locally at commit time rather than push time, I think
that would be less crazy, but unfortunately a clone can't bring along hooks
:\
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.

