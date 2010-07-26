Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OdMUF-0000c2-TY
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 14:08:53 +0200
Received: by bwz10 with SMTP id 10so2939762bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 05:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=f4w1H05fH4BhD0MMt/m52FRak3evTBbINJukw5NdEJk=;
	b=ILhO4uVd8yDIhQrSz/4llqZj8yCLdFxdOJXHymJdOvUfthWIBxSx8ur5T6WE/bTgIE
	cPpDPZZb9MYZ7cXRkp2aPmF7UUhQsEQu4Zp3Ze0QVW/jJPrtYz7wAIpbNoi6vIFIPmo6
	ZuJlULvYooUIu54r0f8deWmzGVaODXwgGVH64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mDtrm/JGPCzIu7hzaGCD7FCmeR77C+4TKTJbcIX/1UCcbP8VF6+INxWqmDWsEUsSfv
	Lx7qL0QmBFN+NKEKo/czUPuL7J0u970xWKF1ZuPR5QMLGKBtxXqaMpQND0nByozz//WF
	c1bMr04gcPPr/qF35B6EFHyiBtEgb0FF/DOcc=
MIME-Version: 1.0
Received: by 10.204.82.18 with SMTP id z18mr5502602bkk.125.1280146117400; Mon, 
	26 Jul 2010 05:08:37 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Mon, 26 Jul 2010 05:08:37 -0700 (PDT)
In-Reply-To: <i2jrnl$4j3$2@dough.gmane.org>
References: <4C4D586A.5040202@kernelconcepts.de> <i2jrnl$4j3$2@dough.gmane.org>
Date: Mon, 26 Jul 2010 14:08:37 +0200
Message-ID: <AANLkTimRxtBib-WUkcm75eNLQvws8Rw-Nf-Z6uQvFetR@mail.gmail.com>
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
Subject: Re: native preferences
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
X-List-Received-Date: Mon, 26 Jul 2010 12:08:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/26 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 26-07-10 11:42, Florian Boor wrote:
> > Hi all,
> >
> > I tried to build a "minimal" distribution image lately and ran into some
> trouble
> >  because the old-style native packages seem to be preferred over the new
> ones
> > using BBCLASSEXTEND.
> > In this case we have glib-2.0-native 2.24.1 provided by the new mechanism
> and
> > 2.22.1 gets build which is the latest old-style native bb.
>
> That's minimals broken by design behaviour, it refuses to pin any
> version. So either pin the version or switch to a sane distro like
> angstrom or shr.
>


Hm. I would expect that if there is a glib-2.0 recipe 2.24.1 with
BBCLASSEXTEND = "native" and  no pinning and no DEFAULT_PREFERENCE being in
effect, that 2.24.1 gets build and not 2.22.1 which has a real native
recipe. To me recipes with -native and implict ones with BBCLASSEXTEND =
"native" are equivalent prioritywise, so I'd say this is a bug in the class
code.

Frans

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMTXI1MkyGM64RGpERAi1eAJ4q5Zwx4OTwV4sfjDFQ4GBE4uClbACfd2wo
> dYefl4wTR0njfF5r+bezfKs=
> =SfWy
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

