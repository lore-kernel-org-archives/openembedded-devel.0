Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Qbbvc-0004Bp-7n
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 19:18:24 +0200
Received: by gxk3 with SMTP id 3so172518gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 10:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=9HvIVkZt1ME0eoE+HQ4NEQFGOt4ILXt5jJyMNXLuCl8=;
	b=vlWS3q3IPd/lY+8F2UWqwytXH7SlR2xvklnordAF6XIbV1oyhOZnFT7qfnJVyC8RWH
	tEH/4dE/jV4DKTFtzAwB3bc1rVOeZxyefBPPxRTkcA1bO/w0WQQPSb6OAF/sKAqjMDTY
	o6taZfr2UmaqGzZKj736pSW7EehmTCsHS8ZO4=
MIME-Version: 1.0
Received: by 10.91.21.37 with SMTP id y37mr8668857agi.63.1309281281872; Tue,
	28 Jun 2011 10:14:41 -0700 (PDT)
Received: by 10.90.75.8 with HTTP; Tue, 28 Jun 2011 10:14:41 -0700 (PDT)
In-Reply-To: <iucsbb$gp2$1@dough.gmane.org>
References: <cover.1309272010.git.otavio@ossystems.com.br>
	<iucpq7$uav$1@dough.gmane.org>
	<BANLkTinqwZhxLGtp997dgKh9BmAD02LU-A@mail.gmail.com>
	<iucsbb$gp2$1@dough.gmane.org>
Date: Tue, 28 Jun 2011 19:14:41 +0200
Message-ID: <BANLkTinrcfQvNW4=s5vbjD=8FhaqVYpbEQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 0/2] Fix parse errors
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
X-List-Received-Date: Tue, 28 Jun 2011 17:18:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/6/28 Koen Kooi <koen@dominion.thruhere.net>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 28-06-11 16:59, Otavio Salvador wrote:
> > On Tue, Jun 28, 2011 at 11:51, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> >> I'm not going pull those in, since the whole point was to not make them
> >> machine specific. RP has pushed a workaround for it so parsing
> >> continues. I'll push a proper fix for systemd later.
> >
> > What's the difference if the package will be built from same source?
> >
> > In case you change anything you'll need to rebuild all packages anyway
> > so I see no gain in having it per package.
>
> It makes it easier to deploy updates for the main packages (e.g.
> sysvinit, systemd) to all the targets without having to build it for all
> targets. It's a weird optimization, but makes life a lot easier for
> people needing to support a ton of machines :)
>

Hm. saving some CPU cycles and wall clock time makes life a lot easier.
Guess you haven't too much of a life then :-)
No kidding, why not keep things simple. and elegant.
(and actually people needing to maintain a lot of machines and keeping them
up to date is somewhat an oddity anyway; My experience is that most embedded
developers need to support only a few machines and typically freeze their
sources and stabilize their product).

Have fun!
Frans

