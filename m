Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAgUd-0003Pg-BS
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 12:47:47 +0100
Received: by wibhj13 with SMTP id hj13so546633wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 04:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=cQGrtVLR0Rtj9yCJlI8+dYUl7ETY+oNfagVNj/p8EHw=;
	b=hC9mnnKtN0vgqvanhvx/bQeG8iN/pAfAyYDPceBCG583zuqhCOR9UZN53NoE5PSD8H
	vpLSG2N889JlkMlHVLC5RlnZMm6Fnw8fojzejNpJY60+2AWFVQkZPVIa2YAwJoS9b0Tv
	Cj3QCez/h3AxBhQP512CzWbILCgL+CSiAdL4Z91v5xBYX/7oTAbqh0wYXzZmzTp2aXjF
	lx4OB2DW5LoXL+ERAV0YQtPAk9tF1Kl80g+tboRRW/AI/FuxK5QFBzXfNIg097KBTPn8
	bNr58/drSXtVVjiLB0mUYrssKp52u+eleI4AZqG7YadLwgtW6g5cpZcmlcsknxgOMam0
	cDpA==
MIME-Version: 1.0
Received: by 10.180.101.136 with SMTP id fg8mr4275684wib.4.1332416332600; Thu,
	22 Mar 2012 04:38:52 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Thu, 22 Mar 2012 04:38:52 -0700 (PDT)
In-Reply-To: <jkf2bu$9pb$1@dough.gmane.org>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
	<jkdg34$om0$1@dough.gmane.org>
	<CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
	<20120322092859.GE4010@jama.jama.net>
	<CAGiJk9ex0qxUQrxyCSjH33dpH_sg40MmLj+Gq5SSgW2AkyoL_w@mail.gmail.com>
	<20120322104009.6a4ed04e@eb-e6520>
	<CAGiJk9cUPhrLHQicRsDfa-e_vn=0OdmE=BuyXxvi7cJX1XUfrw@mail.gmail.com>
	<jkf2bu$9pb$1@dough.gmane.org>
Date: Thu, 22 Mar 2012 12:38:52 +0100
Message-ID: <CAGiJk9fXnA24HKjF9rkhkoimDO1etb9eEExNG1Div1bze=XQSA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [meta-oe] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 11:47:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/3/22 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 22-03-12 11:12, Samuel Stirtzel schreef:
>> 2012/3/22 Eric B=C3=A9nard <eric@eukrea.com>:
>>> Le Thu, 22 Mar 2012 10:35:31 +0100, Samuel Stirtzel
>>> <s.stirtzel@googlemail.com> a =C3=A9crit :
>>>> 2012/3/22 Martin Jansa <martin.jansa@gmail.com>:
>>>>> why not add meta-oe dependency to meta-kde/README?
>>>>
>>>> It is already listed as dependency [1]. But somehow it seems like
>>>> that there are users, interested in testing this layer, with an use
>>>> case which excludes the meta-oe layer.
>>>>
>>>>
>>> can you describe this use case so that meta-oe gets a chance to adapt.
>>
>> Since I have the common use case of the installation provided from the
>> setup-scripts and I don't know the exact use case, I cannot provide this
>> information myself right now.
>
> So you can't explain why it should move to oe-core, that should be enough=
 to
> NAK this patch without even looking at it.

If the explanation that an user group that has another use case than
you won't be enought then NAK it.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iQIcBAEBAgAGBQJPawy/AAoJEHZqAkdh1vT6cdAP/3CIpSE6k6BOPHXEri6hgLU4
> kfQhs6GKHRxgyCB63jDWJ1EShrErKUrCksWMAXO6p7tBniuMk8X5mJmQ4mBfHH9b
> 0yTu5bPFxB/zsK0lFqoOfWMOuwaJLZJQCuEQLJP4VvlVxexb5sZMbzMvudh+pGwQ
> DZEgDGbTF+hUrcxu0Rjxug9UXJa4nqfiCJ7ShKy3U2+ichZnr4tU9YfUl5ZGoofT
> W/xtJOBwEKogGB0KxIb2tphtChpoA8rPMy5WvRqlJ39lDsUOdOHUl5/Vu83Czpee
> ynFe5aRxYjsz0NUovuiBc5SUwVCwqJApR164FCFIkhHg7l1G7OJelSrn1+oqA62f
> fX6MTno5dYpaWImx2KiGqHOKqJF4wo+C0QqGNFBYde4Yu9Xu2Wdx/GQnycov6TOf
> deQtQnDHFZ4K4oaT4ptQvzcb0qN4KU5f3scCjSAR9SMNfPjjuaI7wmlRD8UwGB61
> s1oipV+SNE9icv8qSGbV9gw1Bo+B9w4AHRZllt9tdsDhnoMldBot7Fhc+FuW0MbH
> uFOmzi4R1j9lXmoh5pcFkmZKSYra4/UhU9DkwGZ4IZzEMCE4cxfwDc3MYGyPPOTE
> 0oMbq01pmAfPsio7gQ1bE73WC0JWBhKfbFJ7KxF3mH0oC1+mrBw9y2Al+7Zd0o7P
> B+y8ooG5B0ELZdWvczXO
> =3DEYSh
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--=20
Regards
Samuel


