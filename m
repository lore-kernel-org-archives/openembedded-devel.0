Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OcDk8-0002qI-OQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 10:36:47 +0200
Received: by bwz10 with SMTP id 10so1503886bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 01:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=u9L0RWOrF5P43UeL7oWxt4xEaEWRn55nvbxKp+dg4k4=;
	b=SRwOwBVnlScILXN1XN6jSLtX6fOL9Whe86dy8XemgnKQKfcEnNjfss8sIVBcYMLHLd
	ja/4+0qECiC7aI3Nv1GRiaZHkNa+Weawg8dNesivq66+yxom8z4MDX7rOSl6ukQeRmh9
	nWYtHZ3smeLInIlSzvKPLm40OenpLyBxQwuz8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DPZYTl8HcvdnBFo001AlqZ6Q8DC6MODylpwVp5/0s3/cYg8fyhf9eRIoNMZckruk9Y
	nksp8xpRO6/nrcLaImA2UJ4mbG2UQQS+5CmuMWZeygWREpVJkuxemBXo6HTr2A3FAWhe
	p9ddmVVOmyPzg/O+0Vc02wjA7dr5T9Lb0JbQ4=
MIME-Version: 1.0
Received: by 10.204.102.2 with SMTP id e2mr2326287bko.112.1279874181830; Fri, 
	23 Jul 2010 01:36:21 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Fri, 23 Jul 2010 01:36:21 -0700 (PDT)
In-Reply-To: <i2bf8b$joo$2@dough.gmane.org>
References: <i2bf8b$joo$2@dough.gmane.org>
Date: Fri, 23 Jul 2010 10:36:21 +0200
Message-ID: <AANLkTim=jp4BQTg_nPkMg2yN_-g-6_Stta6ZkjD3H-Xb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: binutils-cross problem with multimachine config after cross changes
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
X-List-Received-Date: Fri, 23 Jul 2010 08:36:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/23 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I was doing a multimachine build and the armv7a bits completed
> beautifully, but the armv5te bits break in binutils-cross:
>
> | /usr/bin/ld:
>
> /work/autobuilder/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/lib/libiberty.a(cplus-dem.o):
> relocation R_X86_64_32
> used when making a shared object; recompile with -fPIC
> |
>
> /work/autobuilder/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/lib/libiberty.a:
> could not read symbols: Bad value
> | collect2: ld returned 1 exit status
>
> Does anyone have a quick fix for that? My tinderbox looks so said with
> all that red :(
>

Yesterday I noticed a similar issue with binutils 2.20.1 for nios2 when ld
was called with -shared.
2.17.50 did not have the problem.
Didn't have time to investigate yet. (and probably it'll take a day or two
before I get to this)

Are you using the same version of binutils for v5 and v7? (and which one).

Frans

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMSUBLMkyGM64RGpERAgopAJ96q9OiWD8Eywv0L/09b8wP92QfnwCgpt11
> EoOVgGxVY+MeWMPJcoF8pg8=
> =1cA2
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

