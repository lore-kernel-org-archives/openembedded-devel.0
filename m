Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OWets-0001ML-JL
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 02:23:37 +0200
Received: by iwn34 with SMTP id 34so290287iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 17:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=bqcJBVPG21Rw1/5Ld35kDfG0YsaHvRvcagRk207Pdns=;
	b=ZcI5EPxSRM+WPy3Z7WTLPYESBDsLwUYIlO7pYBOzmgGwpGUHAcouvJiARcB58tAgTK
	XD2gBTQ4wz0T/yWaEpFIhUNSoocA4qt9895O2OYDjJfFLmmIuy1Q1FPRMUcKklso2ALz
	34YJmDVygtipf1Mav4vHMvSD1QIa+gRTwfSEo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Ip2F4nqvu09xevI4biOXoRbyRy4nbwuAKwjcYLQOi/rljlSytrUlxDoCNxOv5CWGAj
	brjpN6ZZpDLM5mQUuWe4K+DUlev8LHk4hqLErqxGxhVhTsB7XKMBQo6I9wtgom1QmlE3
	i5H9olujd13pEfe9lrooZWcVzmMc9J8hz048o=
Received: by 10.231.10.137 with SMTP id p9mr6987742ibp.91.1278548326157; Wed, 
	07 Jul 2010 17:18:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Wed, 7 Jul 2010 17:18:26 -0700 (PDT)
In-Reply-To: <i119n7$ej7$1@dough.gmane.org>
References: <i108p5$hd$1@dough.gmane.org> <4C33B301.7010006@mentor.com> 
	<i119n7$ej7$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Jul 2010 17:18:26 -0700
Message-ID: <AANLkTimqD1rrAIpTyF_vMQccsdfMNF9LgynX-So-jkaw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit 4d6a63850b4dc7ca2f060aedda26ddf4efa0e5cc
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
X-List-Received-Date: Thu, 08 Jul 2010 00:23:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 7, 2010 at 12:17 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 07-07-10 00:49, Tom Rini wrote:
>> Koen Kooi wrote:
>>
>>> +PREFERRED_VERSION_gcc-cross =3D "4.1.2"
>>> +PREFERRED_VERSION_gcc-cross-initial =3D "4.1.2"
>>> +PREFERRED_VERSION_gcc-cross-intermediate =3D "4.1.2"
>>> +PREFERRED_VERSION_binutils =3D "2.17.50.0.12"
>>> +PREFERRED_VERSION_binutils-cross =3D "2.17.50.0.12"
>> [snip]
>>> do NOT belong in a machine.conf (or machine include). Those belong in
>>> the distro (or local.conf), not in the machine.
>>
>> Just putting this out there (and it's indeed _not_ how things are
>> today). =A0Why would we not want to move towards having this kind of stu=
ff
>> be in the tune-ARCH.inc file, when a specific version is really needed
>> (more avr32 or new'ish core on an existing overall arch) ?
>
> Putting it in a tune-arch is not a problem, just put it in
> conf/distro/include.
> Experience has shown that putting it the machine includes is a bad idea,
> It rots and after a while a new machine gets added that doesn't use said
> machine include.
> And not to mention the need to change DISTRO_PR for editing a
> machine.conf, that's just backwards.
>
>> Yes, it
>> should be up to the distro to say "we want 4.4.x + 2.20.x" or whatever,
>> but then we also get the downside of "special case, XXXX only works well
>> with 4.3.4 + 2.19.x" or what have you, and those special cases get
>> introduced in one place and copy/pasted elsewhere.
>
> So you have an include file in conf/distro that people can optionally
> use or copy/paste. Not all distros can/want to support all machines in
> OE. Angstrom tries to, but that's because it's the reference implemention=
 :)
>
> It boils down to this:
>
> The distro needs to make a decision to do strange stuff to support a
> platform. Silently forcing it is bad.
>
> In this specific case no distro except angstrom has expressed interest
> in supporting nios2, so we could even but this in an angstrom.inc.
> Seriously, can the distro maintainers that are willing to support nios2
> please raise their hands?

yes it belongs to distro. Logically machines pin machine specific things
toolchain is more akin to distro than a machine. Its how OE is designed.
I agree with Koen here. If you propose fixes for say sane-toochain.inc
many other distro will support nios2.

>
> regards,
>
> Koen
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMNConMkyGM64RGpERAon3AJ9keLb8YBEVmCsvWzhEqb3qtLCWKgCfcX+4
> kuDgy1Jqhl4qdAIVEWkiTfc=3D
> =3D0Lny
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


