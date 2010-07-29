Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OeQPW-0004oQ-77
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 12:32:23 +0200
Received: by bwz10 with SMTP id 10so103879bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 03:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=BXVIXmgn6cBbEDIjjB2L001eNfuCYJZbgOWYiVEhqfw=;
	b=G4Ub/SUje0icn8X3uJbR/tNunSFGM9LwTIUzztR1bXopteN/aA3lMT6fGoxh6wq7zt
	hVj2H3+Mu0DT43/V+aB/4Mfmr4iQaW/UHs6Fm/9SJDEUJp/W+tElYDc/ND5SdIJz++Fp
	CVKSxb13CuJVGgVXGq6N10uySdi3MuqEMy4GA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HoWYSJHjxZk3lw4zqI3MYPTK9TWMrB6FQ1wRvSKJ2N5ju+of0E3vYOFX+BeJn+LD1L
	2dnCQC6hFqp+73Rojf2CtGpOhf9Ukd/QZeznSDiYtx2iFVJvE6SnacvVPWC3s4QrEiYl
	cxVPrSKXrYEXJjSfi6UsGgdzdCNRhssokl3mk=
MIME-Version: 1.0
Received: by 10.204.83.84 with SMTP id e20mr8583321bkl.214.1280399524889; Thu, 
	29 Jul 2010 03:32:04 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Thu, 29 Jul 2010 03:32:04 -0700 (PDT)
In-Reply-To: <i2rik7$ds1$1@dough.gmane.org>
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
	<i2rik7$ds1$1@dough.gmane.org>
Date: Thu, 29 Jul 2010 12:32:04 +0200
Message-ID: <AANLkTik0kGdggGrhTg=-O5bfmc1c4vjHtspPL=DShQWd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OE recipe tree quality
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
X-List-Received-Date: Thu, 29 Jul 2010 10:32:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Wrt the message of Thomas and the blacklisting
Maybe I'll try minimal later on.

Wrt Koen's message, see below:

2010/7/29 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 29-07-10 10:50, Frans Meulenbroeks wrote:
> > Dear all,
> >
> > Given the discussions on quality that sometimes pop up (and also
> triggered
> > by Robert's message), I decided to kick off a bitbake -k world.
>
> Could you first explain to me why 'bitbake world' is a good way to
> measure quality?


> I would think that building something like console-image and looking at
> the following would be a much better metric:
>
> * does it build?
> * are all the rootfs types working?
> * does the image do what it is supposed to do?
> * Are all the licenses of the output packages correct?
> * Do the output packages have any spurious deps?
> * Is the content of the output packages correct?
> * Are there any known CVEs in the resulting packages?
> * Did packaged-staging do its job?
> * What kind of QA errors and warnings were raised?
> * Did all recipes pass recipe_sanity?
> * Did all recipes conform to oe-stylize.py?
>

That is a fine set of criteria, but the focus of this exercise is not to
look at the recipes that are often build and that work.
What I want is buildable recipes. A recipe that does not build in my opinion
is useless and should either be fixed or removed.

There is a lot of crud in recipes, and the objective of this exercise was to
identify what junk there is around there and call for action on it.
You probably do not care if there is a non-buildable recipe around, but I
(and I guess others) do.

We as openembedded deliver a set of recipes. If a substantial amount of
recipes does not build that gives a bad perception of the quality of the
environment.
Apart from I perceive every non-buildable recipe as a bug.

My two cents...

>
> etc
>
> I would actually advocate removing the 'world' feature from bitbake/OE
> to stop people from wasting time on looking at bitbake world and have
> them fix actual problems.
>

Yeah. Shoot the messenger and hide the problem under the carpet.

For me removing world from bitbake/OE would be a no no.

And I must say that I am kind a surprised that you don't consider a non
buildable recipe as an actual problem.
I (and I hope others as well) do.

And wrt time:
Fortunately it is up to me  and not up to you to decide on how I waste my
time (even though in this case I do not feel it wasted, and the actual
amount of time invested in it is pretty small, it are mostly unused CPU
cycles that are used up by this).

Enjoy!
Frans.

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMUU3HMkyGM64RGpERAgioAJ90DxRRG5meARUBbMcQ25jadn4k4QCeKkEd
> r4DWO6n6DTFhAucGqx78Yxc=
> =Dv4L
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

