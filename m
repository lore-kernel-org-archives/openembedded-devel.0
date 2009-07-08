Received: from [209.85.216.187] (helo=mail-px0-f187.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MOKzX-0005oh-Mu
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jul 2009 02:26:31 +0200
Received: by pxi17 with SMTP id 17so2529734pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2009 17:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:organization:to:subject
	:date:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=AksJe7HvNOxDHQt+AS41UwP5p8xsdOIRzhwcJcmZ94M=;
	b=mqmcyrmBkVD1Q4Q7uQJ51KpB8ISCYN9B05ZcuGlItzZfkByhn7/mWFea7Hvz2UzLqs
	KwWHHagUo1zGAQvA9kSs+Bb86A+XcymPrMzDIkFilpnINVn6Pj1e9RYrvnQgM5mciB/7
	zehblkIRzfVAFVdPUMqqxhE/SisGlOxEWPVb8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:cc:references
	:in-reply-to:mime-version:content-type:content-transfer-encoding
	:message-id;
	b=FQTR9U8pCut2OGrN5ocYUZUIclZ57QB4maKjfiCZ0h5V1fMWUK0Eu9/GJZNwRnJR3/
	iLgax6YOpZM2UbDpHhLuXsWoXGnjBYIc8HjE5pHNEpGvOT8C7H1/kNMKQirVbzLPRlb2
	n4BOS9qvFMtlEFFvmQR5w+7pSYZFRi7EKrwyI=
Received: by 10.142.77.7 with SMTP id z7mr2143019wfa.208.1247012033461;
	Tue, 07 Jul 2009 17:13:53 -0700 (PDT)
Received: from morpheus (adsl-71-146-5-22.dsl.pltn13.sbcglobal.net
	[71.146.5.22])
	by mx.google.com with ESMTPS id 22sm417302wfd.28.2009.07.07.17.13.52
	(version=SSLv3 cipher=RC4-MD5); Tue, 07 Jul 2009 17:13:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Organization: Home Inc.
To: openembedded-devel@lists.openembedded.org
Date: Tue, 7 Jul 2009 17:13:44 -0700
User-Agent: KMail/1.12.0 (Linux/2.6.28-13-generic; KDE/4.2.95; x86_64; ; )
References: <022254FBC8645942BBF88A022862CDD33C60BA@3putt.int.lantronix.com>
In-Reply-To: <022254FBC8645942BBF88A022862CDD33C60BA@3putt.int.lantronix.com>
MIME-Version: 1.0
Message-Id: <200907071713.50012.raj.khem@gmail.com>
Cc: Lars Holowko <Lars.Holowko@lantronix.com>
Subject: Re: How does OE determine the kernel version that gets build?
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
X-List-Received-Date: Wed, 08 Jul 2009 00:26:32 -0000
X-Groupsio-MsgNum: 11817
Content-Type: multipart/signed; boundary="nextPart2672344.LE5hmqjkVJ";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2672344.LE5hmqjkVJ
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 07 July 2009 03:13:56 pm Lars Holowko wrote:
> Hi everybody,
>=20
> I am working with an Atmel AT91SAM9G20-EK evaluation board. I was able
> to successfully build the console-image and the default 2.6.28 kernel
> for it.
>=20
> Now I want to switch to a 2.6.30 kernel (for better wireless support)
> but bitbake linux or bitbake console-image always builds 2.6.28 instead.
> I copied a defconfig to recipies/linux/linux-2.6.30/at91sam9g20ek,
> copied the AT91 patches for 2.6.30 in its place and added a
> DEFAULT_PREFERENCE_at91sam9g20ek =3D "30" line to
> recipies/linux/linux_2.6.30.bb hoping to make the 2.6.30 kernel active.
>=20
> I can build a running kernel 2.6.30 with bitbake -b
> recipies/linux/linux_2.6.30.bb.
>=20
> Funnily there is no DEFAULT_PREFERENCE_at91sam9g20ek line in
> recipies/linux/linux_2.6.28.bb and its DEFAULT_PREFERENCE =3D "-1" so I do
> not even understand why that kernel gets chosen at all.


because in conf/machine/at91sam9g20ek.conf it says it wants 2.6.28

PREFERRED_VERSION_linux =3D "2.6.28"

change that and it should pick whatever you chose instead of 2.6.28

Khem

--nextPart2672344.LE5hmqjkVJ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkpT5LgACgkQHnJKy6V6em4bygCcDOGYzOuPyXzxJ4TR8n0AsFM0
XVUAoJdK6rqZ+VeOeKm2gzKE1tyeHCKh
=OIbK
-----END PGP SIGNATURE-----

--nextPart2672344.LE5hmqjkVJ--
