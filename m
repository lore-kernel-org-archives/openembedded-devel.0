Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRQZf-0000iH-KK
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 17:09:39 +0200
Received: by fxm19 with SMTP id 19so3621659fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ohTGpcb6Ses73U2Hsth+mKX5BoAsTzwms2OFFMR5isc=;
	b=Sz4TI3v2jW82BkZxY3674Xnu3ZQvge8MyKJ0+dVRfokyIwwIDRVZzD2Rw9TcRaIuYv
	s7L3p+8Hly6lUfG8cgHWhPjZqkjF5YEJiK20coZi4ja6ovTg4YRjKnBJzLWRZbVdySl3
	dOyF30DfcZG5OzXoiMsfB9Jkuxt0aOlvGOT24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QgA4n6Co6hdReYHkD4Dd8KQt4TRkw8Yfmf3zwoN/1O8guqB6qMG7Jg9iP5x6sTY5D/
	6yvhS9SI0YokqBaftgZ027vM5EPz582VtjKo+rmeOGyj7+PUNi9Rp4ZRjyvZQ+RLOk5C
	94hJ2mhISiX5g+JRdNSkVaIeivdNfZjhBj/ik=
Received: by 10.223.94.129 with SMTP id z1mr61508fam.144.1306854389846;
	Tue, 31 May 2011 08:06:29 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q10sm75119fan.8.2011.05.31.08.06.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 08:06:28 -0700 (PDT)
Date: Tue, 31 May 2011 17:06:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110531150626.GD6506@jama.jama.net>
References: <201105220001.36288.schnitzeltony@gmx.de>
	<201105220143.54594.schnitzeltony@gmx.de>
	<1306782978.4106.483.camel@mattotaupa>
	<4DE50256.1020000@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4DE50256.1020000@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] Revert "perl-native: create_wrapper on perl${PV} too"
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
X-List-Received-Date: Tue, 31 May 2011 15:09:39 -0000
X-Groupsio-MsgNum: 32424
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline

--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 07:59:34AM -0700, Tom Rini wrote:
> On 05/30/2011 12:16 PM, Paul Menzel wrote:
> > From: Paul Menzel <paulepanter@users.sourceforge.net>
> > Date: Mon, 30 May 2011 21:08:24 +0200
> >=20
> > This reverts commit 1e255fbd296e95ff178d66c4a1fe4875a988d7e1.
> >=20
> > 	Author: Tom Rini <tom_rini@mentor.com>
> > 	Date:   Mon May 16 13:06:33 2011 -0700
> >=20
> > 		  perl-native: create_wrapper on perl${PV} too
> >=20
> > 		  perl${PV} becomes hostperl when building for the target so we need a
> > 		  wrapper on that too.
> >=20
> > 		  Signed-off-by: Tom Rini <tom_rini@mentor.com>
> >=20
> > It breaks task compile of perl using `angstrom-2010.x` or `minimal{,-uc=
libc}` for `MACHINE =3D "beagleboard"` [1].
>=20
> Didn't another change go in which fixes this go in?

IIRC this fixed it in oe-core:
http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=3Da10bd97=
6f4cef54ac50b0c82f885c17a26e5989f

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3lA/IACgkQN1Ujt2V2gBwiDgCdG5qOEpcZmFp2w2WYxd2dUtrz
CPgAn1hHS8pWpSBGnJeOkAghXUbHQH/g
=lkhO
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--
