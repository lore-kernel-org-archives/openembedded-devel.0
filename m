Received: from [209.85.200.173] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LuLrb-0000j0-PU
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 09:21:04 +0200
Received: by wf-out-1314.google.com with SMTP id 25so273667wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2009 00:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=t/hiyPjAbaWECbt6EwNke247uMjSxLN96mlyqVauJgE=;
	b=VjwXreyCnJ7ZipBXu8cSG70VIimZeOhd+lYBlAU6GAHlOd6hko5aRw+80M9dJQsSk4
	0BN4pSOqJ7nItwbae0gwR0+uf/z9IMt5VIk5HdU8kSNu0P3YUXb+wGEj6aGQ7BD470Jc
	kQFaOssspDIPr9mHTgOPJPt2yhVeRvCNejAVk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=vuEQJohN6y6CR3oP40B/YPyjGmpGLPcD/ClWpsaDCRuplMO4jettMJ0NXCn7HRPb6M
	OrfU9ZKA/fLT5Ch5RkCi2UAzoSqzSP/qM/d2YaJlA4P09oM6JsY4nsthy9ZAUcMpP/cu
	06oegSYDE/ap7NNGJ8Esqs3RYs0P35ExxKKVA=
Received: by 10.142.77.11 with SMTP id z11mr1714878wfa.277.1239866071625;
	Thu, 16 Apr 2009 00:14:31 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id 29sm2844395wfg.13.2009.04.16.00.14.30
	(version=SSLv3 cipher=RC4-MD5); Thu, 16 Apr 2009 00:14:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2009 00:14:29 -0700
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
References: <200904151633.49146.khimov@altell.ru>
	<20090415192512.GC29623@gmail.com>
	<200904160928.57879.khimov@altell.ru>
In-Reply-To: <200904160928.57879.khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <200904160014.29402.raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.200.173
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 02/11] binutils: add	binutils-x86_64_i386_biarch.patch
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
X-List-Received-Date: Thu, 16 Apr 2009 07:21:27 -0000
X-Groupsio-MsgNum: 9422
Content-Type: multipart/signed; boundary="nextPart1587395.H6GUSoVHEP";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1587395.H6GUSoVHEP
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 15 April 2009 10:28:57 pm Roman I Khimov wrote:
> On Wednesday 15 April 2009 23:25:12 Khem Raj wrote:
> > On (15/04/09 16:35), Roman I Khimov wrote:
> > > ---
> > >  .../binutils-x86_64_i386_biarch.patch              |   25
> > > ++++++++++++++++++++ recipes/binutils/binutils_2.18.bb               =
   |
> > >    2 +-
> > >  2 files changed, 26 insertions(+), 1 deletions(-)
> > >  create mode 100644
> > > recipes/binutils/binutils-2.18/binutils-x86_64_i386_biarch.patch
> >
> > Looks ok. Could you also make this on later versions of toolchains.
> > I am not worried about the older ones.
>=20
> Works good with 2.19 and 2.19.1, but not 2.18.50.0.7.

=46WIW 2.18.50.0.7 is default binutils for some distros (angstrom)

> Not sure it makes sense=20
> to adapt it there and add more patch versions to tree. See attached.
>=20

=2D-=20
Khem Raj

--nextPart1587395.H6GUSoVHEP
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknm2tUACgkQHnJKy6V6em6rFwCfVfPTfeD5NWm4mqbF6D7pHmRx
J4YAn3NPfUrdBEh5Z7Q3gFkpiH0ZfiKG
=AfT6
-----END PGP SIGNATURE-----

--nextPart1587395.H6GUSoVHEP--
