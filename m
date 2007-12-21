Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1J5pif-0007mV-Gb
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 22:47:49 +0100
Received: by an-out-0708.google.com with SMTP id b33so100031ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2007 13:42:34 -0800 (PST)
Received: by 10.100.210.9 with SMTP id i9mr3532104ang.40.1198273354780;
	Fri, 21 Dec 2007 13:42:34 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Fri, 21 Dec 2007 13:42:34 -0800 (PST)
Message-ID: <c384c5ea0712211342h6a826c79u7aa7702cd1bd1ad6@mail.gmail.com>
Date: Fri, 21 Dec 2007 22:42:34 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Paul Sokolovsky" <pmiscml@gmail.com>
In-Reply-To: <30318843.20071220221048@gmail.com>
MIME-Version: 1.0
References: <164348748.20071215043923@gmail.com>
	<c384c5ea0712150526i2a8147c5ud43b5e79c52a7feb@mail.gmail.com>
	<1515905492.20071215173513@gmail.com>
	<c384c5ea0712201038v167f7a86jfc2189e04bae0ec1@mail.gmail.com>
	<30318843.20071220221048@gmail.com>
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
X-List-Received-Date: Fri, 21 Dec 2007 21:47:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Paul,

On Dec 20, 2007 9:10 PM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
> Thursday, December 20, 2007, 8:38:12 PM, you wrote:
> >> ...the proposal
> >> is about introduction of the standard OE variable name for distro
> >> parameter tweaking. Its meaning however completely depends on the
> >> distro.
> >>
> > Do you see the contradiction? A *standard* OE variable name that
> > *completely depends* on the
> > distro. Please, no.
>
>   Well, it seems you mix up *levels*. The variable with standard
> *name*, whose *value* gets interpreted by a distro, what's a problem
> here? You know, it's like PATH unix envvar - it is standard,
> but different systems and different users put different stuff there.
>
Yes, it is standard, well understood and behaves as follows:
1) the variables have proper names, such as LD_LIBRARY_PATH.
2) the variables except 1 value, or in rare circumstances multiple
values of 1 type (such as PATH).

The name alone "SYSTYPE" raises more question than answers. The type
of the system. Right.

DISTRO_LIBC


> >> Some distro needs switch libc's. Some needs to switch WMs.

DISTRO_LIBC=eglibc
to instruct the distribution to build (against) eglibc.

DISTRO_WM=twm

> >> Others need to switch many other things, possibly, in combinations.
> >> Very good. OE recommends a standard general syntax for that - a
> >> SYSTYPE. Exact format of what goes into SYSTYPE and its semantics is
> >> up to distro (and users will know about all that by reading distro's
> >> docs). (Now that we talk about validation, it puts additional
> >> syntactic constraints on SYSTYPE value, that's why I'm personally not
> >> keen to start with [rigid] validation from the beginning).
> >>
Too confusing.

> > MACHINE and DISTRO are extremely well understood: they select one
> > option out of a list, and the name implies what you select.
>
> > Extremely user friendly.
>
> > SYSTYPE does not fulfill these two properties in your proposal.
>
>  ??? How it is not? Do you have a proposal for better name?
>
See all the reasoning above.

> >> > +0 for the making DISTRO_LIBC a global C library selector.
> >>
> >>   Gotcha! That's exactly what I'm trying to avoid - proliferation of
> >> adhoc distro config parameters! We have ANGSTROM_MODE now, supposedly
> >> FooNas will want to call it FOONAS_LIBC, with lots others alike. Then
> >>
> > No, "DISTRO_LIBC". Literally. Like Marcin set out more explicitly than I did.
> >> bitbake --distro=foo --systype=bar --machine=baz package
> >>
> > Argh. No!
>
>   Indeed? Maybe you even have arguments? ;-) Or rather, maybe you have
>

First you write "Exact format of what goes into SYSTYPE and its
semantics is up to distro" and then you affect bitbake (which is a
tool) with the distro-specifics as *options*??

> users? Please share, that's what I'm trying to solve here.
>
> >>   And nothing really precludes SYSTYPE to be not just "libc", but
> >> "libc,release", or "libc,release,wm=xfce", or
> >> "libc,release,wm=xfce,weird_user_config=some_file.conf".
> >>
> > Sorry, you didn't convince me, at all.
>
> > I strongly agree with Richard to either not do this (therefore my -2),
> > or either to define a sane namespace that some distro's might support,
> > agreeing with Marcin.
>
>   We somehow interpret differently what Richard wrote. Per my
> understanding, his concern was that it won't be clear if given feature
> will be supported by some distro, or no. SYSTYPE offers validation to
> solve this issue.
>
The concern is that users are not able to track which distro does, and
which distro does not support SYSTYPE, let alone the distro-specifics.

I think I fully understood your proposal (and your care for user
friendlier OE), but my first concerns fully remain.

SYSTYPE is not a good way forward.

Regards,
-- 
Leon


