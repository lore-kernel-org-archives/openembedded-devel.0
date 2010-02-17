Received: from mail-gx0-f220.google.com ([209.85.217.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nhp9L-0007pG-UO
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 20:01:31 +0100
Received: by gxk20 with SMTP id 20so1343643gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 10:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Dg6ejwQVw2Xslah74sn1EU/JDf0cOHEpBlcN/B0kUxU=;
	b=jfTbWENwWhTX3hXzFHIkm7S5D3C/fd5OZjbHvQti9Zk9f4xll0t8XVIQHoAlEAKdNF
	tv7Tz+MyGNk8fX7uCwtCK/wCuHeYw+Q9ygLJJpALLMwjEBVEPS6sScx93PVv4E553jg8
	MYgZG/2IutWhnza5mKNGP95aKUR4oJsBf0s6E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LoioonccOCn0vbgIl1utZrjX3KtF98DJn9dcqMM5MqKjyW2t3NMHxGu4KniwG0iadO
	iZV5bycPCKm7Vg9FmPd4ykVi8WdNlnIFsKw6eO4mECPp1z7GplP9BzVdnpRBNmvXNT/N
	XyGrt1UeyzvlCvDBDQfzQkXufpycuoos9EPy0=
MIME-Version: 1.0
Received: by 10.101.105.1 with SMTP id h1mr5538051anm.131.1266433127652; Wed, 
	17 Feb 2010 10:58:47 -0800 (PST)
In-Reply-To: <hlhc1p$t19$1@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
	<hk12nm$sdo$1@ger.gmane.org> <hlhc1p$t19$1@ger.gmane.org>
Date: Wed, 17 Feb 2010 19:58:47 +0100
Message-ID: <ac9c93b11002171058o7f48b417yee87d06da09c7577@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.220
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Wed, 17 Feb 2010 19:01:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 30-01-10 11:47, Rolf Leggewie wrote:
>> Frans Meulenbroeks wrote:
>>> Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
>>> DISTRO_EXTRA_INSTALL ?
>>
>> This has been discussed before, but not changed. =A0I think it made sens=
e
>> back then and I think it makes sense now.
>>
>> I believe there is even a better name than DISTRO_EXTRA_INSTALL to be
>> found for the variable. =A0Maybe IMAGE_EXTRA_INSTALL?
>
> of all the ways to solve it, you just had to go out of your way to annoy
> people.

I BEG YOUR PARDON

I did not make the change, actually I have not even seen it. I think
you owe me an apology for this.
I also would like to get the opinion of the TSC on the above accusation.
>
> A simple IMAGE_EXTRA_INSTALL +=3D ANGSTROM_EXTRA_INSTALL would have done
> the job, but no, lets create more work for people, break existing docs
> and especially ignore what the maintainer of the recipes said.
>
> Way to go

FYI: I popped a question three weeks ago.
Today Rolf asked me about the status in #oe.
As you can see above 4 people (Rolf, Mickey, Phil and me were in
favour of the proposal. In irc mckoan also backed the proposal.
There was one person opposed to it: you.
Rolf asked whether he could make the change. As I was about to leave I
agreed that he made the change.

If you want it to be an angstrom recipe, please name it as such (or,
even better: start your own angstrom tree or branch).
If it is a common recipe, I am equally entitled to change it as you
change the mythtv recipes or the eee701.conf file.

Frans.


> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLfDN7MkyGM64RGpERAk0eAKCxLVowYlE4h9ls/kmdCcbj4uZesACfZxa0
> VPWpTNi7tN+GxEfF/BYBf5Q=3D
> =3D0Idf
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


