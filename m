Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pdq5k-0004jY-U5
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 21:17:49 +0100
Received: by ywi6 with SMTP id 6so1040838ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jan 2011 12:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=yvKfM9up55DALkqhrw8N5i3ArXXG1urQVRqYL3sZZE0=;
	b=SIq3a2TCKVrqTUAMTP+GcNNZrcNNP4Ua94JI1ilmiZqK5F21cCa+qpyHyPSOVEY6+K
	8a7Xc8++wjBxo4+Qj0niiYEAh3911J+h0O102kUtYw1XLyTqbqhLRdMifxH24QU1skQt
	YosVdEOjL9YWG5IYtJhyvrhRLMPxrX9e2JwPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=lkzeLinUapjEJpdr49EdBN11HepdZ0geYPdD88nFlgaBJBzH6g+5EEVLi1BOoW3OMH
	H1eY00xRJa+JTJBD7WPNR5YliUK5eYhLgsybm4ImMdQrakGj9FMDY04jcbVca7o67w4o
	OsDeJws8mBHBPewXkqIN2zlbuLMdsLLqBz0pg=
Received: by 10.90.10.21 with SMTP id 21mr1676483agj.112.1295036233445; Fri,
	14 Jan 2011 12:17:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Fri, 14 Jan 2011 12:16:49 -0800 (PST)
In-Reply-To: <igq7l2$a8s$1@dough.gmane.org>
References: <1294996238.3578.1.camel@mattotaupa> <igq6d1$36s$1@dough.gmane.org>
	<igq7l2$a8s$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jan 2011 12:16:49 -0800
Message-ID: <AANLkTineRKBLdhFHm-p2K1qK49vXe0tp6N1c3XeSUVbS@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Jan 2011 20:17:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2011 at 11:20 AM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 14-01-11 19:58, Koen Kooi wrote:
>> On 14-01-11 10:10, Paul Menzel wrote:
>>> From b2e249702a0f6b5e36a4b095f5a4c495aa5ec14f Mon Sep 17 00:00:00 2001
>>> From: Paul Menzel <paulepanter@users.sourceforge.net>
>>> Date: Fri, 14 Jan 2011 09:48:08 +0100
>>> Subject: [PATCH] python.inc: add `--disable-ipv6` to `EXTRA_OECONF`
>>
>>> Since commit d729d14d [1] task `configure` for `python_2.6.5` and `pyth=
on_2.7.1` fails with the following error message when compiling with `angst=
rom_2008.1` for `MACHINE =3D "beagleboard"`.
>>
>>> =C2=A0 =C2=A0 =C2=A0checking for major... yes
>>> =C2=A0 =C2=A0 =C2=A0checking for getaddrinfo... yes
>>> =C2=A0 =C2=A0 =C2=A0checking getaddrinfo bug... buggy
>>> =C2=A0 =C2=A0 =C2=A0Fatal: You must get working getaddrinfo() function.
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or you c=
an specify "--disable-ipv6".
>>> =C2=A0 =C2=A0 =C2=A0ERROR: Function do_configure failed
>>
>>> Disable IPv6 for now in Python unconditionally until a better solution =
is found.
>>
>> I don't think disabling ipv6 is the way to go, I'm comparing the eglibc
>> before and after d729d14d to see if that reveals a clue. If it doesn't,
>> let's put in your patch for the time being.
>
> .... and the difference is that options-group.config is empty before d72
> and fully populated after it. OPTION_EGLIBC_ADVANCED_INET6 is set to Y
> in both cases it seems.

I was expecting it to converge to this. Do u see that libraries
libc.so before and after have different content too ?
Could be that the option config mechanism is getting it wrong somehow
may be I should only populate options-group.config
with disabled features

>
> Khem, help!
>
> This feels like the broken wide getaddrinfo test in ruby all over again :=
(
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNMKHiMkyGM64RGpERAuFJAJ0XtYegAEgZ6wpVswCCGPb6a3YcQQCdGbhc
> gwL/7gtHyRYXX+oiAEtgx/c=3D
> =3DXyNb
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


