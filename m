Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TE2DD-0007dM-Ii
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 20:07:55 +0200
Received: by oagn9 with SMTP id n9so158075oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 10:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=iLMOO13u9UCQjgUNFUEu5rWNs4Ur2IuCe+XlRgKurCI=;
	b=Kvjrab1wWXqdOhVoo9NaPgsuLms4MS5w5YQsKvrr3gXDxgGiFc//6zhwkMKRIzh82k
	J0x1xMtI58VNMAwyXcYV/EQxGAV07A80RxshFxq+0yyr5N1l6q44ynhZuaV1d6jM09OP
	9owzoaCDd/ymUPFNnxYa79SbpgDWgYHv/4JjsjXQmLtPxBvK/A2WyUy22vTSzvKhXUlj
	s5Yt5QBRRabBe0tDXCQw23GhRbA9KDB9IFuSG/quiGscEiVtEdPFatyqOB/gtLcGvoPG
	a1Jl8CIbt9VHvrLItQecAlEjWIrEIg1sc5D4NqSYFGpnQbI5869gXAAjcokQS3W83ZQi
	7aOA==
Received: by 10.182.187.98 with SMTP id fr2mr905046obc.73.1347990914845; Tue,
	18 Sep 2012 10:55:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.93.35 with HTTP; Tue, 18 Sep 2012 10:54:54 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <k3aceg$7an$1@ger.gmane.org>
References: <CAK18fxHzC+3nrhVbsntm+3DbF=pzwtZoF8R0EcZ33z3G4uv9Mg@mail.gmail.com>
	<E5E9389A-9AA7-4BE9-85A7-BD6D5DDC9A88@dominion.thruhere.net>
	<CAK18fxFZjKMhLU_UZZe4zOHjbdYpgmKydvdWAzr5c20Z=f9hUg@mail.gmail.com>
	<k3aceg$7an$1@ger.gmane.org>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 18 Sep 2012 20:54:54 +0300
Message-ID: <CAK18fxF7c7AY_=LXEF61U9nrbKSJEzkp-1gaMAP3Ysxn-yTYhA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkgJvfT/NnEjLNSBiuZ0Yab3mKm6Z3Lbeg6rT3yClVIco5ueTmrFTBYtWD1CcDCt5TwdxoY
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe] zram service in meta-systemd
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
X-List-Received-Date: Tue, 18 Sep 2012 18:07:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thank you. meta-oe patch sent. meta-systemd patch coming.

ag


On Tue, Sep 18, 2012 at 8:53 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 18-09-12 17:43, Andrei Gherzan schreef:
> > On Tue, Sep 18, 2012 at 6:35 PM, Koen Kooi
> > <koen@dominion.thruhere.net>wrote:
> >
> >>
> >> Op 18 sep. 2012, om 16:58 heeft Andrei Gherzan <andrei@gherzan.ro> het
> >> volgende geschreven:
> >>
> >>> Hello,
> >>>
> >>> I would like to move the zram service from meta-raspberrypi to
> >> meta-systemd. This is not specific to raspberrypi and can be used by
> >> others as well.
> >>> Koen, what do you think about this move? And if so, what recipes
> >> directory should i use? recipes-extended?
> >>
> >> What other machines use zram as well?
> >
> >
> > Don't know. What i'm sure of is that raspberry uses this and is included
> > in meta-rasberrypi even if this is not rpi specific.
>
> I had a look and it's certainly not r-pi specific, it's support for
> enabling
> compressed pages in RAM/swap, so I'm fine with it going into
> meta-oe+meta-systemd.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQWLUWMkyGM64RGpERAhEoAJ959GVpZ193zdTOULnLu+oA5yP1jACfTvPB
> zsqAFAWjxJgihEOEaih8Jgs=
> =S+el
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

