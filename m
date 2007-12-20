Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1J5QMb-0007NE-4d
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2007 19:43:21 +0100
Received: by an-out-0708.google.com with SMTP id b33so801865ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2007 10:38:13 -0800 (PST)
Received: by 10.101.67.11 with SMTP id u11mr604602ank.16.1198175892926;
	Thu, 20 Dec 2007 10:38:12 -0800 (PST)
Received: by 10.90.29.19 with HTTP; Thu, 20 Dec 2007 10:38:12 -0800 (PST)
Message-ID: <c384c5ea0712201038v167f7a86jfc2189e04bae0ec1@mail.gmail.com>
Date: Thu, 20 Dec 2007 19:38:12 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Paul Sokolovsky" <pmiscml@gmail.com>
In-Reply-To: <1515905492.20071215173513@gmail.com>
MIME-Version: 1.0
References: <164348748.20071215043923@gmail.com>
	<c384c5ea0712150526i2a8147c5ud43b5e79c52a7feb@mail.gmail.com>
	<1515905492.20071215173513@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] ANGSTROM_MODE -> SYSTYPE
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
X-List-Received-Date: Thu, 20 Dec 2007 18:43:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Paul,

> ...the proposal
> is about introduction of the standard OE variable name for distro
> parameter tweaking. Its meaning however completely depends on the
> distro.
>
Do you see the contradiction? A *standard* OE variable name that
*completely depends* on the
distro. Please, no.

> Some distro needs switch libc's. Some needs to switch WMs.
> Others need to switch many other things, possibly, in combinations.
> Very good. OE recommends a standard general syntax for that - a
> SYSTYPE. Exact format of what goes into SYSTYPE and its semantics is
> up to distro (and users will know about all that by reading distro's
> docs). (Now that we talk about validation, it puts additional
> syntactic constraints on SYSTYPE value, that's why I'm personally not
> keen to start with [rigid] validation from the beginning).
>
MACHINE and DISTRO are extremely well understood: they select one
option out of a list, and the name implies what you select.

Extremely user friendly.

SYSTYPE does not fulfill these two properties in your proposal.

> > +0 for the making DISTRO_LIBC a global C library selector.
>
>   Gotcha! That's exactly what I'm trying to avoid - proliferation of
> adhoc distro config parameters! We have ANGSTROM_MODE now, supposedly
> FooNas will want to call it FOONAS_LIBC, with lots others alike. Then
>
No, "DISTRO_LIBC". Literally. Like Marcin set out more explicitly than I did.
> bitbake --distro=foo --systype=bar --machine=baz package
>
Argh. No!

>   And nothing really precludes SYSTYPE to be not just "libc", but
> "libc,release", or "libc,release,wm=xfce", or
> "libc,release,wm=xfce,weird_user_config=some_file.conf".
>
Sorry, you didn't convince me, at all.

I strongly agree with Richard to either not do this (therefore my -2),
or either to define a sane namespace that some distro's might support,
agreeing with Marcin.

Regards,
-- 
Leon


