Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 843417EC65
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 10:38:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45tsJY1dKgz23;
	Wed, 24 Jul 2019 12:38:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563964717;
	bh=/SHsCyqhQLu/K2l61oq8e+0BNTy79w7QzEKyRp+smQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPv3aWvqC2BPmfMEsUZZo08DRtkksxphUes5v8lZVqugfyCfvISUCZsoN7TWHAWTV
	fGVD5zQWXzIGSR4m7MkQZSC3p30TpN8nR/AzwDQCn3N8jsA3ehOEGiaycukcMpeuQp
	KzulNEL9ll+XnIAhHXWicccnFNOFp67zrVeS23Fn+1YyCR0a9ueS18tpYT2gJ6ukS/
	98aUrps/K5+SlB0n3vJd8gX23p8reO8HbI1wDUtT6jkz1xk9LVpmRcQw6H3hGTv931
	cqj/pp8QrR1rJKEcMXRJsLF+lm4zGMu9AYT5BCsG/I3qD+Idq0wsThVjbq1VOF1bOj
	KSnbbhBdAdVFD78wEkvzdaOoFr59GcyNxFP+YgbYH8V7l9NtMqlH1IMtfPoGuhOkib
	dVFn5rhC1TUgonrnqM9xVKUR6l1DaDVeZ5fq5mi2OI9/IAbW/USz04IIJBdGvJ6tJf
	O8822yailpPDjLc/p9l1EXNtcnTgE3s0PWCExfxZ+3R4eV6S+2mH4dP851h3pWWz5r
	OoMQnPgrei6PY3dejmD4L0PsQdKiFWGpoD6+QqbDa4BdFjwnaxOSJftn5ccbhYbpGX
	aP9Nv9rADNYY3ANw5gWvecyxqM1fZHNM4VeFLQY5xfLhmY16H1uHEx5SPVY4Jeh9KR
	wFYTgU4WZ+ztk1IXSHZTBPGk=
Date: Wed, 24 Jul 2019 13:38:35 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190724103835.GA27634@localhost>
References: <20190723151649.9238-1-bunk@stusta.de>
	<CAMKF1srWP3iFCHveAGELyZzQ0QeB16PG7+2H536au1QAoWOqCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srWP3iFCHveAGELyZzQ0QeB16PG7+2H536au1QAoWOqCA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] meta-oe: Inherit gnomebase instead of gnome
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2019 10:38:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 23, 2019 at 06:44:49PM -0700, Khem Raj wrote:
> This causes
> https://errors.yoctoproject.org/Errors/Details/253988/
> maybe due to atkmm change is exposing another missing inherit
>  gnome-system-monitor -> gtkmm3 -> atkmm

Does gnome-system-monitor build for you with musl without my patches 
applied? It doesn't for me.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


