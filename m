Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MKNpz-00036z-BS
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Jun 2009 04:40:19 +0200
Received: by wa-out-1112.google.com with SMTP id j4so611290wah.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2009 19:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:organization:to:subject
	:date:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=8GPTZOGl0YtLqdnQ2Btz796STGszE1N7YTYSC/eayMI=;
	b=c/BnFF7SIpG0UA1B4lBiSB/b1Bs53IsZ7h+lVmQpiVM50dGEzJG6A0zkV5VlGyH/rp
	4u7RPCt6Pt8V8EpNnR6Ye8DLr/9d5dxGW1aTDuQEbesSqgf5JmlgOnyEwnQymwhV5VdD
	NO04Jrj9bHbTn8geQTZ8JMlrh++sT+BIZb5CY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:cc:references
	:in-reply-to:mime-version:content-type:content-transfer-encoding
	:message-id;
	b=Z1ur07TrsDb/IOmOidDJKvgqvfqindu6V6Rez/ffFmOGq6HotWdhzQSUTk7XgkxUF4
	cplSyyN+P5ulA32PC/M4XzBvkjWzKfRidjgV1IIY+7diDylOhQWLOxzrFRCUg6BkqBhe
	vI0ZV+Sg4HgCVVLxNWK8gYv8mHLX5pzME5sUQ=
Received: by 10.114.130.15 with SMTP id c15mr6905889wad.59.1246069732279;
	Fri, 26 Jun 2009 19:28:52 -0700 (PDT)
Received: from morpheus (adsl-71-146-23-253.dsl.pltn13.sbcglobal.net
	[71.146.23.253])
	by mx.google.com with ESMTPS id m34sm7037470waf.57.2009.06.26.19.28.50
	(version=SSLv3 cipher=RC4-MD5); Fri, 26 Jun 2009 19:28:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Organization: Home Inc.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jun 2009 19:28:39 -0700
User-Agent: KMail/1.11.90 (Linux/2.6.28-13-generic; KDE/4.2.90; x86_64; ; )
References: <9220ACA993BF4B17ADA77AB934CFA607@ronaldlatd600>
In-Reply-To: <9220ACA993BF4B17ADA77AB934CFA607@ronaldlatd600>
MIME-Version: 1.0
Message-Id: <200906261928.47276.raj.khem@gmail.com>
Subject: Re: SH4A on OpenEmbedded
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
X-List-Received-Date: Sat, 27 Jun 2009 02:40:19 -0000
X-Groupsio-MsgNum: 11654
Content-Type: multipart/signed; boundary="nextPart5798425.oqzi331m23";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart5798425.oqzi331m23
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 25 June 2009 05:38:46 pm Ronald Chu wrote:
> Hello,
>=20
> I wonder if OE have the TARGET_ARCH as sh4a? It only contain sh4 (titan..=
=2E etc)
>=20
> Is there possible to add sh4a? How would I do that?

You need to add machine conf for whatever board/device that
has sh4a that you are interested in.=20

i.e.

machine/<yourmachine>.conf

If you want to add special
tuning for toolchains then you might also want to add
machine/include/tune-sh4a.inc

after that you can chose a distro in your local.conf (like angstrom or some=
thing) and machine
DISTRO=3Dangstrom-2008.1
MACHINE=3D<yourmachine>

Thats should be a start

Thanks

=2DKhem

>=20
>=20
> Ronald Chu <Ronald@SysRealTime.com>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20

--nextPart5798425.oqzi331m23
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkpFg9gACgkQHnJKy6V6em71agCeICaPf12eDMVQU2S++st0qO/q
fp4Anif93cHZ18WiH2XXOP7VNKHIC5BU
=RAm+
-----END PGP SIGNATURE-----

--nextPart5798425.oqzi331m23--
