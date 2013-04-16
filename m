Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1US50P-0006kr-Oz
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 14:29:06 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz11so314877pad.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 05:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=kcKdG00UapcW7+8+/qANpbqpTZ1nKjIIftSNZ8fZDIc=;
	b=vGTnyshdbISwTNKfOwGH3zNZDEDbZwDcLopev4UjmtmJLiW8GzvZy4pC6TtvXEgU7j
	o23i+cWzSnJN6VKysTtwRz3Nv6JtvVgx4IB9u8/f1PhQ8giVQ3joeVHnInekvoDHcOe9
	AiTHRCeV+qYK1JHx8neixTDUaC54Wa6VJhZqYqI5/FSUT9NP9MPRwPhRx2IST6/gU17C
	TVqghBtmfpNZy2jWwpHNDUE4noo9JSIHKcpD4BSrQ3H8RvjQQ8qyKiWhhp966l88icS5
	twxdrH0vPkh1F5kgWD6CK06K8OCncRC1yCIB/RfsdyWMRc7L4X8+n7kdNCRswFkyptH+
	N8mw==
X-Received: by 10.66.167.69 with SMTP id zm5mr3417231pab.90.1366114285416;
	Tue, 16 Apr 2013 05:11:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id xl10sm2454016pac.15.2013.04.16.05.11.22
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 05:11:24 -0700 (PDT)
Date: Tue, 16 Apr 2013 14:11:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130416121122.GM10628@jama.dyndns-home.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
	<kkjbhk$h9r$1@ger.gmane.org> <1561352.OujRcMfYWi@helios>
	<5C3F1A93-CC39-45E6-AF2B-FF29F50C67CD@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <5C3F1A93-CC39-45E6-AF2B-FF29F50C67CD@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking, meta-oe][PATCH 0/9] Move networking recipes to meta-networking
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
X-List-Received-Date: Tue, 16 Apr 2013 12:29:12 -0000
X-Groupsio-MsgNum: 44241
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1hVIwB4NpNcOOTEe"
Content-Disposition: inline

--1hVIwB4NpNcOOTEe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 01:30:29PM +0200, Koen Kooi wrote:
>=20
> Op 16 apr. 2013, om 13:19 heeft Paul Eggleton <paul.eggleton@linux.intel.=
com> het volgende geschreven:
>=20
> > On Tuesday 16 April 2013 13:09:46 Koen Kooi wrote:
> >> These look good to me, but
> >>=20
> >>> iw: move to meta-networking and update
> >>=20
> >> This is receferenced by a packagegroup in meta-oe:
> >>=20
> >> 	meta-oe/recipes-core/packagegroups/packagegroup-basic.bb:
> >> ${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "", d=
)} \
> >>=20
> >>=20
> >> With the 'meta-oe shall only depend on oe-core' rule,=20
> >=20
> > Are you sure nothing in meta-oe depends on anything in other layers wit=
hin=20
> > meta-openembedded already?
>=20
> I can't say for certain, but Martin and I have been very strict about it =
in the past. If there are such external dependencies they should be looked =
at and fixed.

There were some issues few months ago and hrw send some patches to move
recipes in right layers, since then I don't know about any dependency.

But it's true that all my builds have more layers included so I don't
test this scenario directly.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1hVIwB4NpNcOOTEe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFtP+oACgkQN1Ujt2V2gBzXXwCfbVlG/8Xbv4SNspFisLynFQUi
9cIAoJiBzjYRFhPj2bkMufy13763W/4v
=lbzR
-----END PGP SIGNATURE-----

--1hVIwB4NpNcOOTEe--
