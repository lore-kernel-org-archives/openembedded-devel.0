Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QOclB-0004uG-Md
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 23:33:57 +0200
Received: by vws2 with SMTP id 2so5068921vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 14:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=0YxP7PqKm5I+WWgX2vcazAfEYNaxGbfpDgjYtXO2uuk=;
	b=T4QhTEI3eGCHe+izQOj6suiOR6RTpvSqaTkurIRduGsEkS7EVMc0JR1dYL88su1y+I
	JZSGSJk7vMKqYeedjTW6AB7HoNJDAXAd9nisR9uMHoMoaFMLB6FXBVEK2rkWijL+kvh0
	6xGfziO9j2up+3tQOWYS+JI0g3dXQ7izYuPII=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=f5akmRjU/KpMtAQp0Vdg7lcXs6SPjb6od3LdiKDnE973hzkp7OZDpStAUM1vIKjj7J
	5hlWc5HSjHBg+REu8RTAYJI17rLH1GWqMG58iQuoUDZaR+OPu7n0IxkMjcx3+tEjyvNX
	lVK0Lsp7wNjy9g6vNyOhnkJkb58OcQpk7yzuo=
Received: by 10.52.32.102 with SMTP id h6mr4156921vdi.34.1306186255725; Mon,
	23 May 2011 14:30:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.183.162 with HTTP; Mon, 23 May 2011 14:30:35 -0700 (PDT)
In-Reply-To: <1306185965.5948.19.camel@utx.lan>
References: <1306185965.5948.19.camel@utx.lan>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 23 May 2011 14:30:35 -0700
X-Google-Sender-Auth: oOe6e3V35oax82R-ezOW8ayHoFk
Message-ID: <BANLkTikddk3Ft89jpeXAtstHdow-kXJ0=g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Remove -e from default EXTRA_OEMAKE
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
X-List-Received-Date: Mon, 23 May 2011 21:33:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 23, 2011 at 2:26 PM, Stanislav Brabec <utx@penguin.cz> wrote:
>
> EXTRA_OEMAKE contains -e by default for years (in bitbake.conf). In my
> opinion it causes more bad than good.
>
> It makes live simpler in (rare) cases when Makefile proposes its own
> default CFLAGS without chance to easily change them from outside, but it
> causes subtle (and often overseen) breakages in many other cases. For
> example "-e" in EXTRA_OEMAKE caused breakage of crda (tested with GNU
> make 3.82):
> ifeq ($(USE_OPENSSL),1)
> CFLAGS += -DUSE_OPENSSL
> endif
>
> As you can check, there are several hundreds of recipes that need to
> override this default. Also autotools.bbclass,
> distutils-common-base.bbclass, qmake_base.bbclass and kernel.bbclass
> remove "-e" from default make flags. It means that at least 6000 recipes
> remove "-e" from EXTRA_OEMAKE.
>
> That is why I think that "-e" should not be a default. If needed, it
> would be easy to add it for particular recipes.

I have to agree, here. The biggest problem, I think, in addition to
the above breakage, is that it's too much "magic". It's too implicit.
It might simplify recipe creation in some cases, but that isn't
necessarily a good thing. If you're creating a recipe for a
non-autotools thing, you need to sit down and read its makefiles.
Hoping and crossing your fingers that the default behavior will work
is just asking for trouble. It would be better for things to not "just
work" for regular make and make the user read the makefiles and pass
the vars explicitly in EXTRA_OEMAKE, which thereby increases their
knowledge of the system, and encodes more of that knowledge in the
recipe for future maintenance.

It took me a heck of a lot of trial and error to come up with the -e
MAKEFLAGS='' hack to make sure the -e only took effect at the toplevel
make -- more trouble than its worth.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


