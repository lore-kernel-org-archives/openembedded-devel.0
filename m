Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SWNQS-0006UT-C9
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 09:53:08 +0200
Received: by lbol5 with SMTP id l5so3373221lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 00:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=v74gnOytRBgNaC509G+pq0iUax0xlNoMBMIIDGoC4JM=;
	b=KaVUu33nUkWNZAkVzwr+ueSZHAoTyeXuXRWJGAhdHtBYdwwakTsrIYxNwiikmPuA0y
	3sd7LqOIdvLd42zywTFUH9dklfXNx5FAzlqDK8zPjdtZkrtl9af3JjLFUdA+pVRqvq3f
	5LCZYXsyHKFr3Y9nyajR4M03ZFJ0xf5ELxIBjBRBwXPP3UpuGHsciOyKUN5wIL+SVq38
	z+ccZuyCIwFoELXA5FMw7YCBOlSuptZccrSI9/6fAHi1rmyhtHxTwM3Qfxa33Z4inSqO
	X0W0nU2DUG4k3+6ITAzJNNg/oMzi7r/mwH8B4RmrDV3LMaxdrhzo0D0wc1SrqwjbUL+w
	LdTA==
MIME-Version: 1.0
Received: by 10.112.86.132 with SMTP id p4mr8117128lbz.22.1337586180293; Mon,
	21 May 2012 00:43:00 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Mon, 21 May 2012 00:43:00 -0700 (PDT)
In-Reply-To: <20120518213950.GA4208@denix.org>
References: <CADZ6=avSzGXb3h1BunDQqqojA7tv-gO2VRicC6nt9KzAuNOcUg@mail.gmail.com>
	<20120518213950.GA4208@denix.org>
Date: Mon, 21 May 2012 09:43:00 +0200
Message-ID: <CADZ6=at_MQ1FWKW+m3eBpK+ysacLZPw0J8KrASRvsk11Wpwg2A@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkjr2+5rsF9rMLrLF2Tu7z2rd25hymlQxbq+FK7CR8Oxm5O7eBV7V7a9lQvshClvdtJaKNa
Subject: Re: Introducing the HidaV layer
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
X-List-Received-Date: Mon, 21 May 2012 07:53:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Denys,

>> The code is here: <https://github.com/DFE/HidaV>
>> Some initial documentation: <https://github.com/DFE/HidaV/wiki>
>
> Just couple questions - wouldn't it be better to send fixes to the underl=
ying
> layers that you integrate, instead of holding them in your own integratio=
n
> layer?

In my opinion it's best to have both. We certainly plan to integrate
our fixes and extensions with upstream layers and projects; actually,
that's what meta-hidav/recipes-upstream/ is for. Until they're
accepted, however, they will live in our own layer. This way we have
better tracking of changes requested by upstream.

Maintaining our own layer also allows for stunts like providing
continued support for gcc-4.5 with the current Angstrom even though
meta-oe/toolchain-layer deprecated and removed that version of gcc.

> And if it's for your unique ti8148-based board, then it's fine, it may
> warrant a separate BSP layer for that. But why did you chose to pre-integ=
rate
> other layers into yours? Although you seem to be using sub-modules, but i=
t's
> still pre-integration, a-la Yocto/Poky releases...

It is. The point is that HidaV is actually a BSP _and_ a distribution,
but it seems to be too small for now to be split into two separate
layers (hidav-bsp and hidav-dist). I do second your suggestion,
though. So the split might happen at a later point.

> Ah, and BTW, I think your layer ordering and priorities[1] are slightly w=
rong,
> as usually BSP layers reside lower than Software layers (i.e. meta-oe), b=
ut
> Distro layers (i.e. angstrom) should probably be on top...

You're right, it sure looks unusual. It's because of the Dist/BSP mashup.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


