Received: from mail-yi0-f41.google.com ([209.85.218.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdrtP-0000vH-FT
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 23:13:11 +0100
Received: by yia25 with SMTP id 25so1518165yia.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jan 2011 14:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=ctlOrXg+lT2htnd4vks6834sB3twAd7EexfVHw1cWMU=;
	b=UsnpCipyahKKx+NQsbg2ef0eknFJO0eByh57j0ygzPUNE/1snyFfeR5KCG+ZkyixJT
	7sN6w2eoKFYWy/OAZMft0NbWqMvqhJMO6VtW9ORphUB4GOyevCkK0xYh2FX9q4taymHL
	WBwZVgz1RRVjsCAPa4Cvfma/Myt9TiPrBwB9c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gFFiWGLk/aXC/ytqNnDNmnMY1y00rJqYvh3Srao+E2Lu5Bq6wOv3y/hdNJBFqyBqEm
	6WDhIAC9vyoVxR9B2lfUQVmrE5cqAYrz00oRJcqWtS5p/0mhUdxAQB9vw9LwlLdXBe5s
	2dg8CioXn4fKXsMuZr6XCyeKweuMaPYYW84eE=
Received: by 10.91.163.27 with SMTP id q27mr1803789ago.139.1295043156069; Fri,
	14 Jan 2011 14:12:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Fri, 14 Jan 2011 14:12:15 -0800 (PST)
In-Reply-To: <igqg4k$lv7$1@dough.gmane.org>
References: <1294996238.3578.1.camel@mattotaupa> <igq6d1$36s$1@dough.gmane.org>
	<igq7l2$a8s$1@dough.gmane.org>
	<AANLkTineRKBLdhFHm-p2K1qK49vXe0tp6N1c3XeSUVbS@mail.gmail.com>
	<igqg4k$lv7$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jan 2011 14:12:15 -0800
Message-ID: <AANLkTi=nQgfcQ0LE3Pvz2DqJwt5ABaJqmkxvsR+Bg6O7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python.inc: add `--disable-ipv6` to `EXTRA_OECONF`
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
X-List-Received-Date: Fri, 14 Jan 2011 22:13:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2011 at 1:44 PM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 14-01-11 21:16, Khem Raj wrote:
>> On Fri, Jan 14, 2011 at 11:20 AM, Koen Kooi <k.kooi@student.utwente.nl> =
wrote:
>> On 14-01-11 19:58, Koen Kooi wrote:
>>>>> On 14-01-11 10:10, Paul Menzel wrote:
>>>>>> From b2e249702a0f6b5e36a4b095f5a4c495aa5ec14f Mon Sep 17 00:00:00 20=
01
>>>>>> From: Paul Menzel <paulepanter@users.sourceforge.net>
>>>>>> Date: Fri, 14 Jan 2011 09:48:08 +0100
>>>>>> Subject: [PATCH] python.inc: add `--disable-ipv6` to `EXTRA_OECONF`
>>>>>
>>>>>> Since commit d729d14d [1] task `configure` for `python_2.6.5` and `p=
ython_2.7.1` fails with the following error message when compiling with `an=
gstrom_2008.1` for `MACHINE =3D "beagleboard"`.
>>>>>
>>>>>> =C2=A0 =C2=A0 =C2=A0checking for major... yes
>>>>>> =C2=A0 =C2=A0 =C2=A0checking for getaddrinfo... yes
>>>>>> =C2=A0 =C2=A0 =C2=A0checking getaddrinfo bug... buggy
>>>>>> =C2=A0 =C2=A0 =C2=A0Fatal: You must get working getaddrinfo() functi=
on.
>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or yo=
u can specify "--disable-ipv6".
>>>>>> =C2=A0 =C2=A0 =C2=A0ERROR: Function do_configure failed
>>>>>
>>>>>> Disable IPv6 for now in Python unconditionally until a better soluti=
on is found.
>>>>>
>>>>> I don't think disabling ipv6 is the way to go, I'm comparing the egli=
bc
>>>>> before and after d729d14d to see if that reveals a clue. If it doesn'=
t,
>>>>> let's put in your patch for the time being.
>>
>> .... and the difference is that options-group.config is empty before d72
>> and fully populated after it. OPTION_EGLIBC_ADVANCED_INET6 is set to Y
>> in both cases it seems.
>>
>>> I was expecting it to converge to this. Do u see that libraries
>>> libc.so before and after have different content too ?
>>> Could be that the option config mechanism is getting it wrong somehow
>>> may be I should only populate options-group.config
>>> with disabled features
>
> Populating it only with disabled features would match the old behaviour
> and should make python build again. I doesn't give us the root cause,
> but at least it would build :)

yeah it would be a bug in option config if it could not deal with an
option being set to 'y' twice

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNMMPUMkyGM64RGpERAr0QAKCg3AB+AqMcNQM8svqVbvnIpD6WLwCgri+J
> 2dimtKfPQ/BC9sqTzfURWrA=3D
> =3DqmN5
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


