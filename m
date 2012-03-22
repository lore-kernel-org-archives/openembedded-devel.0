Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAeZG-0005DQ-Ef
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 10:44:26 +0100
Received: by wera1 with SMTP id a1so1645464wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 02:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=DD15fZ54MtkeSFg8zZAAaS+0XLuBM/HpavAjUNu8j0Q=;
	b=vfRTNloeEmqePF5bDVKeowQpPUNU50FjU9KsFcwAhgUoOqdMBH1mas7TLOR4kY+EUu
	6G9YAzXcT4eRUT7Ij93jEwAyxhKDzCXHf3PTvF9J3rnmPZpWVXrLXFKbUj1+VhXfcXcH
	7ae/cSIkwsZcLUuGPwFj5Wc5XVTvYUs8bNBCqHCeoZj7LRBE0tHVRtphJ+y7gBPLgACO
	qKbS5MoVF7gQrrUxfr0afT5tBnOgLJwO8non0Khh3LNOP5/rerAAwUD5TSiITC72QBcP
	gr3hMBoaYsW03jvo1+ftkqb3s5IGq2CzwwF1NKvXcBAwhGC/QF+d1xkufTcBTYyaeoFZ
	6wlQ==
MIME-Version: 1.0
Received: by 10.180.80.9 with SMTP id n9mr3497790wix.4.1332408931853; Thu, 22
	Mar 2012 02:35:31 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Thu, 22 Mar 2012 02:35:31 -0700 (PDT)
In-Reply-To: <20120322092859.GE4010@jama.jama.net>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
	<jkdg34$om0$1@dough.gmane.org>
	<CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
	<20120322092859.GE4010@jama.jama.net>
Date: Thu, 22 Mar 2012 10:35:31 +0100
Message-ID: <CAGiJk9ex0qxUQrxyCSjH33dpH_sg40MmLj+Gq5SSgW2AkyoL_w@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Mar 2012 09:44:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/3/22 Martin Jansa <martin.jansa@gmail.com>:
> On Thu, Mar 22, 2012 at 10:24:38AM +0100, Samuel Stirtzel wrote:
>> 2012/3/21 Koen Kooi <koen@dominion.thruhere.net>:
>> > -----BEGIN PGP SIGNED MESSAGE-----
>> > Hash: SHA1
>> >
>> > Op 21-03-12 15:17, Samuel Stirtzel schreef:
>> >> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>> >
>> > OE-core needs to slim down, not get fatter. You are basically saying "=
layer
>> > suck, let's move back to oe-classic"
>>
>> That is definitively not what I want to say.
>> In my point of view there is no value in maintaining an existing
>> recipe redundantly in meta-oe and kde-core or anywhere else.
>>
>>
>> And IMHO we need to get over this, how is it supposed to work?
>> Should I make a meta-devtools layer?
>> Or should I copy giflib from meta-oe and all recipes from oe-core that
>> meta-kde depends on over to my own layer?
>
> why not add meta-oe dependency to meta-kde/README?

It is already listed as dependency [1].
But somehow it seems like that there are users, interested in testing
this layer, with an use case which excludes the meta-oe layer.



>
>> > -----BEGIN PGP SIGNATURE-----
>> > Version: GnuPG v1.4.11 (Darwin)
>> > Comment: GPGTools - http://gpgtools.org
>> >
>> > iQIcBAEBAgAGBQJPakOkAAoJEHZqAkdh1vT6zyQP/R7/viIEf4trbFzR3ZaD2cRd
>> > D4U4q7eDF5DM/fC85yoLBj7byBfryB/I2JWDir9YOAcGgaBysvpL5vApTWFt1hJZ
>> > MOc3NFNdIsALL/jnMzjmY4OB5bIAYHj4nC0XGiRj6CuEvkyz6IueAAR3k2O6NU64
>> > L32Ou0iGD0GKg6gl8LSBfixVKYAjIFfehP5rWv1L0P7cJiYmVy4Gj7CalmmRpPZz
>> > zMhmwoUze4dIx9z6X5WSIXs44aBOFs3MZjtYRfBQsUDkjBheLWI5tMIekhFX0Ega
>> > wKjU9GUwerPzI0oI2DG+9n7nS1wlBJesrHAQKh3pwCWRC19NQuqFjArdaF80DwPk
>> > ZHZNnTzB5Dd/NbPcSkRG5V0DAFYB54Xty6A2w7ONbPoQs5h3vjS4g8V560Kvgqaa
>> > O/efrZi2VgYA/1RAaz7COjNkMF/OBeH9aE9oRNPweOBYcwMFzhbrTEXPUL/pZ7gg
>> > 5oI0JdJj5lmqi6q9+jk8hDVJvYIkM45l9xqy6nDnIa0tUnDTzCRxj+jr7LEyPp/R
>> > p+/6GO5aPG8S4JPbmgFbmJN7hrLzNyg6JS962VVYiOhw0cIVwkj/hX+9oYPE4pRe
>> > AHXoBtWrfflkL4RIadYI64uMJHNpHzfuzd6+0JljL8sA969nh36GXsd4OwMdUx6b
>> > AVqAIeCDYo30C3i9BXRL
>> > =3D1Xye
>> > -----END PGP SIGNATURE-----
>> >
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>>
>> --
>> Regards
>> Samuel
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

[1] https://gitorious.org/openembedded-core-layers/meta-kde/blobs/master/RE=
ADME#line4

--=20
Regards
Samuel


