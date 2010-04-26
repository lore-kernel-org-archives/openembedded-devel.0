Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O6PqB-0006rP-78
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 17:03:19 +0200
Received: by vws5 with SMTP id 5so375486vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=n6W6eRO6W7FIrFSa4bnKcKREnfPbJXbRBYmFs3e2PlA=;
	b=CpRUCU0aipd1URmiok5n6Qepyxv2DkaoQbtI3yk/Y4IECGOwht2S6aEQ2w5SDZyizG
	OFgcwMQ6sqgdhgeO5F9i16omMxETRZndHQz8ckid6zmvZjIQXwWcM5J+Lbr+hZbTu1kD
	rAuECE+ghKAmc72OjXPkzE5Hl24ZYeLLiX1Kk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Da+8Z2dbQIc6Q/v2lrrHSsCtuZ88JC1ICYMT168JRA6jVHTyGai0APil3ZKel6qsNl
	gyjip7g3OVxT6v+ybxbnMNkEpK/fgw/BazRYcLtTHp/BpKOjVWsb/TFEGyfxN+rrdcMZ
	nhRzZqN3H/k7AZqEooMpFJVy/0cJmY8AtsMmI=
Received: by 10.229.227.10 with SMTP id iy10mr5166597qcb.55.1272293979097; 
	Mon, 26 Apr 2010 07:59:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.188.213 with HTTP; Mon, 26 Apr 2010 07:59:18 -0700 (PDT)
In-Reply-To: <hr3buu$pps$1@dough.gmane.org>
References: <1272217739.3865.546.camel@trini-m4400>
	<hr254d$kkn$1@dough.gmane.org> 
	<1272225464.3865.549.camel@trini-m4400> <hr3buu$pps$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 26 Apr 2010 07:59:18 -0700
X-Google-Sender-Auth: ef48302bc5a623d3
Message-ID: <g2mb6ebd0a51004260759x5b267754t680a4489908164d3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: The coreutils-native race...
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
X-List-Received-Date: Mon, 26 Apr 2010 15:03:20 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 25, 2010 at 11:30 PM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 25-04-10 21:57, Tom Rini wrote:
> > On Sun, 2010-04-25 at 21:28 +0200, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> On 25-04-10 19:48, Tom Rini wrote:
> >>> Hey all.  I thought I would try and explain what Chris has been up to
> >>> with at least some of the base.bbclass changes (the ones related to
> >>> md5sum and cp).
> >>>
> >>> Right now, with a big enough BB_NUM_THREADS we can get into a race
> where
> >>> coreutils-native is installing programs and elsewhere we are in a
> >>> do_fetch and either trying to use 'cp' or 'md5sum', and blam, we try
> and
> >>> invoke the program while it's being installed (and see things like
> >>> sh: /path/to/staging/i686-linux/usr/bin/cp: Textfile is busy).
> >>>
> >>> There's a few ways out of this:
> >>> 1) Don't rely on 'cp' and 'md5sum' anymore but use python for it.
> >>> 2) Make an oe_cp and oe_md5sum to go with oe_sha256sum
> >>> 3) IIRC, the big part of coreutils-native was a fully functional,
> >>> always, 'install'.  We could just copy the install we build or provide
> >>> an install wrapper (oe_install) or so
> >>> 4) ???
> >>
> >> Even thought I loathe python, option 1 sounds like a nice way to go
> >> since it doesn't involve butchering recipes.
> >
> > I think we're OK, except in the case of when we can't rely on a built-in
> > md5sum (and then the race comes back) and just need to figure out if the
> > libpam-base-files recipe does things (a) optimally and (b) if that's a
> > common thing.
> >
> > Currently, with a quick glance at the recipe, I don't see any
> > distro-specific overrides, so I'd be inclined to call it lazy recipe
> > writing, until someone points out history of why that's a good thing..
>
> I have no problem with changing the libpam-base-files SRC_URI to
>
> file://pam.d/
>
> or
>
> file://foo.pam \
> file://bar.pam \
> ...
> etc
>
> But I would like to see it documented in the OE manual that file://dir/*
> can't be used, and why.
>

Agreed.  In this particular case, it was never, as far as I'm aware,
*directly* supported, but was one of many cases where we depend on
implementation details - it happens that the argument was directly shoved
onto a 'cp' command line, and that was executed via a shell, so the shell
could expand the glob.  I'll take on adjusting such cases and updating the
docs.

The issue I see with trying to support a globbing mechanism for this is that
the semantics of such a thing are not obvious.  Does it grab everything in
every 'dir' that exists in filespath, or only the first?  It's unclear what
the user intends by that, whereas a 'file://dir/' is rather more clear.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

