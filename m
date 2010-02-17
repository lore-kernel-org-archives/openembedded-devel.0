Received: from mail-pz0-f184.google.com ([209.85.222.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NhYHH-0007wL-1R
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 02:00:34 +0100
Received: by pzk14 with SMTP id 14so7687223pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 16:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=LWv85ZidpOcItuAEuctnboh1rWFnr0yr8KM/eevFcq8=;
	b=AoBYIwICDmYrN/AaZkD4cvxcn9fLTXErjcyBB9Ie1oScYAlszM3gdRIQuW1tXOPcKG
	k4XyfS18yLkxMmbgbcQ4n6T6blKsfZIdeOwsBFJhWZ94n3eANHpLXdeBThl0GaousZAH
	XOdPJgkODCsLHOma99UBOLmWxwIKJ3S/3A+8M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=QCwIg8Z5rDUgdu15AzMwvwTHGKvxo533Uf63QHu07AhTs2MxSxd7wfM+VnqEdS6eZ+
	1HAWbxpzAIngrj7NYy9Xk4hCevlLzLDAcWNdbAmAMsUgWluDOE5YwKWDMG9M/qKUJdHu
	DDX6j8G5NQlgPkRHGQN1worWltETH1AG23pjo=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.249.29 with SMTP id w29mr4880380wfh.163.1266368271102; 
	Tue, 16 Feb 2010 16:57:51 -0800 (PST)
In-Reply-To: <1266363056.31865.68.camel@trini-m4400>
References: <b6ebd0a51002151538o524cdf17s228535e93b28d4d4@mail.gmail.com> 
	<hldk2b$5tt$2@ger.gmane.org>
	<ac9c93b11002160039j717d1611wbdd1d2fac220dd55@mail.gmail.com> 
	<1266363056.31865.68.camel@trini-m4400>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 16 Feb 2010 17:57:31 -0700
X-Google-Sender-Auth: e6aa94a2a6a89b13
Message-ID: <b6ebd0a51002161657o788910ferd49f4106cde6a91e@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.184
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Cleanup / janitors
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
X-List-Received-Date: Wed, 17 Feb 2010 01:00:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 16, 2010 at 4:30 PM, Tom Rini <tom_rini@mentor.com> wrote:

> On Tue, 2010-02-16 at 09:39 +0100, Frans Meulenbroeks wrote:
> > 2010/2/16 Koen Kooi <k.kooi@student.utwente.nl>:
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >
> > > On 16-02-10 00:38, Chris Larson wrote:
> > >> Greetings all,
> > >>
> > >> Per discussion in the TSC meeting this month, I'm sending out this
> email as
> > >> a probe.  Would anyone on the list benefit from a "janitors" type
> project,
> > >> to outline and document specific cleanup tasks and how they should be
> done?
> > >> There are many tasks that need doing which involve editing of large
> amounts
> > >> of files in relatively simple ways, and I suspect, but am not yet
> certain,
> > >> that there are a group of individuals who wish to contribute to the
> project,
> > >> but are new enough that they don't feel confident diving into anything
> > >> invasive.  This sort of a task could be a starting point for that sort
> of
> > >> individual.  Thoughts?  Anyone out there in that camp currently that
> would
> > >> benefit from something like this?
> > >
> > > The first project that comes to mind is converting simple recipes (e.g.
> > > not perl) to new style staging. It's a fairly simple job that has a
> huge
> > > impact.
> >
> > Problem is to do that reliable.
>
> Isn't that a document it right, for Janitors problem?  ie:
> 1. Build recipe foo, with packaged-staging, your resuling pstage file
> is ..../foo_VERSION...ipk.  Copy this somewhere safe.
> 2. Modify recipe foo to use new style
> 3. -c clean foo, build again.
> 4. Examine contents of old and new pstaging file.  If the contents are
> the same (and say, diff rather than just checking names, so that any
> munging is caught), good to go!  If not ...
>
> The idea behind janitors is that there's tasks that can be explained and
> people can pick up and do, but there's some manual intervention and
> checking.  So, if someone fleshed out the above a little more, that
> should be enough for a legacy staging task.


Exactly, yes.  The expectation is these are things that may require a
certain amount of manual work.  If they didn't, we could write a sed script
and call it done.  The thread seems to have gotten quickly sidetracked into
the particular details of this one task.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

