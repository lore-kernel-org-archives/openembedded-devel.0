Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PsR7s-0000ru-Ue
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 03:40:20 +0100
Received: by fxm8 with SMTP id 8so107044fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 18:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=XItxlDjyY1j1+S6INapFyQK5o7u3NKtAyu2ISACgx+o=;
	b=M00oAHdFvK/23MwhbJycPYGEzEcBj/acC656FSyDd/1zJ+88YEtW9/gMMj1RiZ7ig7
	g61/OXSJuXfjHQxWjvxMuBatxQwNY28F4pnW3b1HWUHwpbJpzlZOXJV76Ap24S9Qw7kK
	3sDfOS+idELjcp2ys8gyBz68g8jyv/WiQpS8o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=RAPR9L0q3sI6PDTnwfHHpABHAaaHr9Lexkc31vic3REvrN/ec5y4p/wU7/AWtzwD5g
	Z7b9yfCcN8zcQ5PKCzN5dvAcliKLkr2SQ0GpdHLQgbBfbXpqIP022RPGVesuDxw6v6l0
	NZhfFVurQmLkxu5FKxPiL9+mkyxIj3y4WqF48=
Received: by 10.223.83.6 with SMTP id d6mr302846fal.95.1298515141071; Wed, 23
	Feb 2011 18:39:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 23 Feb 2011 18:38:41 -0800 (PST)
In-Reply-To: <87r5blzcgl.fsf@gmail.com>
References: <87r5blzcgl.fsf@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Feb 2011 18:38:41 -0800
Message-ID: <AANLkTi=t3WkLFmE8GF9DNbbzX1G8j1qA==pg3BEypg9c@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: Ada(GNAT) support in OE
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
X-List-Received-Date: Thu, 24 Feb 2011 02:40:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 6, 2011 at 2:16 AM, Andrey Smirnov <andrew.smirnov@gmail.com> w=
rote:
> Hi, everyone!
>
> Bitbake-1.10.2 and OE from git here and I am trying to add some
> rudimentary support of Ada language(GNAT) to OE(for now it is just
> building a cross compiler)

OK

>
> As of this moment I managed to build some semblance of a cross compiler
> (it builds simple "hello world" executable) by creating a verbatim copy
> of gcc-cross_4.4.4.bb, all files it depends upon to my local recipes
> directory and making slight modification to gcc-configure-common.inc
> (see modifications.patch) but this rises a couple of questions:
>
> =C2=A0- Would anyone be interested in adding such changes? If so, am I go=
ing
> =C2=A0 in right direction or is there another more elegant and preferred =
way
> =C2=A0 to add compiler support?
>

it would be interesting however I think this should be a default
optout feature with possibility to optin
so probably what you have is an ok approach. Somehow we should have a
global knob controlled
by distros to specify what language environments to enable

> =C2=A0- Ada compiler bootstrapping process requires host system to have
> =C2=A0 working Ada compiler implementation, how can this, and should it a=
ll
> =C2=A0 be reflected in the recipe?

yeah those are complications either you can demand those from build distro
by adding them to required_software in sanity class or you can provide a -n=
ative
recipe and then DEPEND on that one first one would be easier

>
> =C2=A0- Provided I am successful in my endeavor, writing BitBake recipe f=
or
> =C2=A0 Ada program would require gnatmake, gnatbind, gnatlink tools to be
> =C2=A0 accessible through some variables(the same way C compiler is
> =C2=A0 available via CC) how can this be implemented?

they would be in bitbake.conf or base class.

>
> Thanks in advance for answering!
>
> Andrey Smirnov
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


