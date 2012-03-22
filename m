Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAiEi-0000vL-Lf
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 14:39:28 +0100
Received: by wera1 with SMTP id a1so1805093wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gCOLxzPIDpXhKfAte461w/QTkRbNuLAzcYLDBLlGv9M=;
	b=GkHrCC4gSJOrXaQTGhTALPInTxMkcZHoYZ3VIRGiakpQTzfsQZFoUBliw4u/jbj4P1
	y24O7F10cB86BCL1l04V04ZRCoxQAJw/06tGrRXGh2iDxwhKJRZ93Jjn/lcqIAlqqHE6
	Cs1jWzAHYGKes1NwAAmgMGN7Uo5QYUUEydp9Iza0OO0iVoAnCFVxysOssEuuRH7NWboO
	A1Fr0zTl9LTzoEEYXQMsHwx6+/XoGjRE3d8/ojhK9zqE8GLyZBlXCRIWH+J3s5LWwOEz
	FChmdLJD86NYSTAjKhZhUZLei7HAxx8F3PBA5HZLrXibIg4cON3oHmwgTc3S7nndNKwr
	U2vA==
MIME-Version: 1.0
Received: by 10.180.101.72 with SMTP id fe8mr5298604wib.4.1332423033550; Thu,
	22 Mar 2012 06:30:33 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Thu, 22 Mar 2012 06:30:33 -0700 (PDT)
In-Reply-To: <jkf820$orr$1@dough.gmane.org>
References: <1332420014-3653-1-git-send-email-s.stirtzel@googlemail.com>
	<jkf820$orr$1@dough.gmane.org>
Date: Thu, 22 Mar 2012 14:30:33 +0100
Message-ID: <CAGiJk9dfFD8HFiVC7oJjPQdBb7xmrgqw6NZA9yULiZJeSFo_bg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] [meta-oe] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 13:39:28 -0000
Content-Type: text/plain; charset=UTF-8

2012/3/22 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 22-03-12 13:40, Samuel Stirtzel schreef:
>
>> * Allow Users with an use case that excludes meta-oe to test and use
>> meta-kde.
>
> What's that usecase? As other people said in a different thread: please explain.

The first comment is a direct explicit target group / use case.
Then second comment is about a generic use case.
So it is rather making meta-kde more independent of meta-oe than any
specific development setup.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iQIcBAEBAgAGBQJPayOBAAoJEHZqAkdh1vT6nLgP/3yrPJGfjPfDjPN3YNQ8EVDJ
> p87Vx1lFzs2zwdxU3PsOVI9jTANCSye386YsQxlQUQbw4EmNAXWck0eYSEbRvlK4
> 8M6+o+O2g1wUoBu+z0WH+GZxkHDkKXbUgE5bEjImyDJVSdxQgIuYZipo2LGQ7E4G
> zJg+1GaYd8wA6VnxiK2Q/pwKCWjiW2D1NrAouVfNN2cyawVdMkh8NsgaHyGDmgVh
> 9hsKxquaXAWKkqj8T/NIPUXvOCbKlFlTTl5Aqmj4KEM4Y5bPlMuOmkp6oFApaGWn
> k2f6c6GO8tSzdXVfMjus7jLeXIz1qIU+4YPi8N/vErnk05miFKo6rCXUFJV3BVDs
> Hbpnir9ufWl2H0Q3SG0otxqtj5Mwg9j7fB7iVQOudbYDlW8PGKfV01c9KYyLrgtY
> 9wFy1204AS+MsoGaWMA12dmhZeBaypm0FND85gVs0AsTRBrEsi7zVdhauOXpGZcg
> GHoUV+LIoWSHBjsaU+97aflH2+8la+zyDNVdzpBmik3sxlT9Xh8KffJOOHhkyy90
> NQKeZ3lB+52GdXCh31MrAJz2huPESFAcLa+18mU+i8rxeYZYLh9/9QQMJmZyZFBT
> myP8Oj/2EGWRMCpH+D2NMxEZWKvqLuXjffLirr6pF3jwI6xMsCQzq7OmR+1pR2DL
> ijrM+EtzEDEOeog+HTbC
> =LzmU
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


