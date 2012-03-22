Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAeOj-0000Jv-JW
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 10:33:33 +0100
Received: by wera1 with SMTP id a1so1639481wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 02:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=nIj3bx+Evd2GvOIHWA8/HJBalyanHVPfTGphX2HPKmI=;
	b=cK/Asg5zMd7TUccu0mQGXz+ljDBnQ92sXgsfNHhAuyVtHyLyFQ7Cg8cjDmVUYnVljd
	Z65pE25s6uw/ROyT8DiX4/6PovhrFmrbEdM8QpxSuHD5LgGYLD1n2Crca8JXofkMbj9t
	1LAKzHy8U7Lw0Ls3tD2SrRyM3zoMJz1NvLpdEYTLBmdH4fpGO4M6aRoCb6r0NIxfwyuv
	loD5u8aFepYQC5k7YEtjVsdiv28LZ7KDNBI29z24lt0hU42IbkzWjSIwiVLTUOxbgho9
	a4xRk+nalk8eRd1uOxxd1kJxqij3BpWxva7/AruBY1DdieB8TjNe6OtJz1DrZs3qnPr1
	j2ig==
MIME-Version: 1.0
Received: by 10.180.101.136 with SMTP id fg8mr3278613wib.4.1332408278958; Thu,
	22 Mar 2012 02:24:38 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Thu, 22 Mar 2012 02:24:38 -0700 (PDT)
In-Reply-To: <jkdg34$om0$1@dough.gmane.org>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
	<jkdg34$om0$1@dough.gmane.org>
Date: Thu, 22 Mar 2012 10:24:38 +0100
Message-ID: <CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Mar 2012 09:33:33 -0000
Content-Type: text/plain; charset=UTF-8

2012/3/21 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 21-03-12 15:17, Samuel Stirtzel schreef:
>> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>
> OE-core needs to slim down, not get fatter. You are basically saying "layer
> suck, let's move back to oe-classic"

That is definitively not what I want to say.
In my point of view there is no value in maintaining an existing
recipe redundantly in meta-oe and kde-core or anywhere else.


And IMHO we need to get over this, how is it supposed to work?
Should I make a meta-devtools layer?
Or should I copy giflib from meta-oe and all recipes from oe-core that
meta-kde depends on over to my own layer?

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iQIcBAEBAgAGBQJPakOkAAoJEHZqAkdh1vT6zyQP/R7/viIEf4trbFzR3ZaD2cRd
> D4U4q7eDF5DM/fC85yoLBj7byBfryB/I2JWDir9YOAcGgaBysvpL5vApTWFt1hJZ
> MOc3NFNdIsALL/jnMzjmY4OB5bIAYHj4nC0XGiRj6CuEvkyz6IueAAR3k2O6NU64
> L32Ou0iGD0GKg6gl8LSBfixVKYAjIFfehP5rWv1L0P7cJiYmVy4Gj7CalmmRpPZz
> zMhmwoUze4dIx9z6X5WSIXs44aBOFs3MZjtYRfBQsUDkjBheLWI5tMIekhFX0Ega
> wKjU9GUwerPzI0oI2DG+9n7nS1wlBJesrHAQKh3pwCWRC19NQuqFjArdaF80DwPk
> ZHZNnTzB5Dd/NbPcSkRG5V0DAFYB54Xty6A2w7ONbPoQs5h3vjS4g8V560Kvgqaa
> O/efrZi2VgYA/1RAaz7COjNkMF/OBeH9aE9oRNPweOBYcwMFzhbrTEXPUL/pZ7gg
> 5oI0JdJj5lmqi6q9+jk8hDVJvYIkM45l9xqy6nDnIa0tUnDTzCRxj+jr7LEyPp/R
> p+/6GO5aPG8S4JPbmgFbmJN7hrLzNyg6JS962VVYiOhw0cIVwkj/hX+9oYPE4pRe
> AHXoBtWrfflkL4RIadYI64uMJHNpHzfuzd6+0JljL8sA969nh36GXsd4OwMdUx6b
> AVqAIeCDYo30C3i9BXRL
> =1Xye
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Regards
Samuel


