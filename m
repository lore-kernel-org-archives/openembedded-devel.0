Received: from mail-pd0-f178.google.com ([209.85.192.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UUaRT-0006CO-9U
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Apr 2013 12:27:20 +0200
Received: by mail-pd0-f178.google.com with SMTP id w11so338313pde.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2013 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cGxUaD6cyq1SWGSUogmQ3RbwGgB8HXqTx3y5o93xQ0w=;
	b=b0Qje+aE8N/D7P87bgPiI3CjjIg4ycDBY+VfcTCgwbFQ7QIoZV+Pwu4Gxo6coS6Ftg
	505DNV966WGslyVJFM+OHT9RtZbtlcaO3cwTpc9PO6EnEsYGWov7SEx9CYJXsjCRgEUi
	crBc+kjGTROXcTT0c2FVa2z0EAfh2eJ9W5QhfX8R2sPInZfhFnAoqp/NxGKlKG/H69Nl
	Pzha258sfvy166BkdnGmIBbgSdiCOLcyWsjQW+T3ARg9Ebz70mKig1UpfGM1+UZFlHF6
	2ZDpAFt8CNn4pMIFwuBuP7UMKvy3Ai6fk5zCYYGnj5aQVbRwG6OXq5OpzZNi1RQTkMMc
	V+Bg==
X-Received: by 10.68.88.194 with SMTP id bi2mr38666919pbb.12.1366711778288;
	Tue, 23 Apr 2013 03:09:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPS id 9sm4619914pbi.45.2013.04.23.03.09.35
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 23 Apr 2013 03:09:36 -0700 (PDT)
Date: Tue, 23 Apr 2013 12:09:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130423100945.GC3217@jama>
References: <1366707335-53174-1-git-send-email-paul@paulbarker.me.uk>
	<CANyK_8cMTd4aTzAhHX8V3Zrs6pjZoctEfVr8hLNYJXo1WQUzFw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8cMTd4aTzAhHX8V3Zrs6pjZoctEfVr8hLNYJXo1WQUzFw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] ttf-inconsolata: fix license name
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
X-List-Received-Date: Tue, 23 Apr 2013 10:27:26 -0000
X-Groupsio-MsgNum: 44388
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline

--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2013 at 10:00:55AM +0100, Paul Barker wrote:
> On 23 April 2013 09:55, Paul Barker <paul@paulbarker.me.uk> wrote:
> > We have "SIL Open Font License" 1.1 in common-licenses as OFL-1.1.
> >
>=20
> There's also a copy of the OFL 1.1 in
> meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata/OFL.txt as the
> bitbake recipe just downloads a single font file. I don't know how to
> do this as it goes across layers (not sure if relative paths would
> work) but would it be better to replace this with reference to the
> file in common-licenses? I realise this is there to satisfy having
> something in LIC_FILES_CHKSUM but it isn't doing the intended job as
> upstream could update the license and it wouldn't break this checksum.

You can use
LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/OFL-1.1;md5=3Dhash"

it's true, that this does not catch license change in upstream source,
but if there isn't any information about license in SRC_URI, then having
OFL.txt is as bad as ${COMMON_LICENSE_DIR}/OFL-1.1 reference imho.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF2XekACgkQN1Ujt2V2gBxs6wCgpfcxSZfv+kUUBlbhbskwucHd
9hkAnA+bVk6YFT1a35wzTrPBSbMFXrCT
=i0ZM
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
