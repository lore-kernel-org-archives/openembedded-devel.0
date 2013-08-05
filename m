Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6738961223
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2013 14:04:10 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so1647958eaj.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2013 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=l/25jpcIrP/bAb0kNCbmJ2Urj45Hm8N8ZhOcGzj7nPg=;
	b=pw8NsByLG3BX0nALNUY0aRAjDPjHQxPsji1UNHxTCQC7J/CPKW956M4mL3wOYrHGPk
	mimHsoI8C3yyhpRNanKEBKVvnwdGnmNizDczLOyx+bvFmrSps1sVonvhsn9NZvyPGDQ4
	dXYLGiaa76zY56MxX41/ndFlXCcxDI6PDWrwXtiq7/evkTVr8F7v7iVIDBMFwnuGG5QN
	OGW79/7jzZJZ9WXtKWCpz2lYkBkStd+uJzGdTUZgDegd1WPyhedvsfsVJovSpgvUVWbR
	/Sx4xF8HhJEMXSHSZOrC+XGkfwzwbTYoBoBdRJ+jMDeHyFQbGhCgTuGZjTazOmIx6ETT
	9feA==
X-Received: by 10.14.9.72 with SMTP id 48mr14255282ees.42.1375711450146;
	Mon, 05 Aug 2013 07:04:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	v41sm33504228eep.10.2013.08.05.07.04.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 05 Aug 2013 07:04:09 -0700 (PDT)
Date: Mon, 5 Aug 2013 16:04:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130805140451.GD3280@jama>
References: <alpine.DEB.2.02.1308050937380.6693@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1308050937380.6693@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: proper way to express dependencies from meta-oe to meta-gnome?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Aug 2013 14:04:10 -0000
X-Groupsio-MsgNum: 45590
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vN1VrOpIkjMGbM/7"
Content-Disposition: inline

--vN1VrOpIkjMGbM/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2013 at 09:43:34AM -0400, Robert P. J. Day wrote:
>=20
>   for the entertainment value, while building for the beaglebone
> black, i did:
>=20
>   $ bitbake -c fetchall world
>=20
> and got:
>=20
> ERROR: Nothing RPROVIDES 'gvfs' (but
> /home/rpjday/oe/dist/layers/meta-openembedded/meta-oe/recipes-support/tra=
cker/tracker_0.14.2.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'gvfs' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['gvfs']
> ERROR: Required build target 'tracker' has no buildable providers.
> Missing or unbuildable dependency chain was: ['tracker', 'gvfs']
>=20
> and it's easy enough to see that, yes, tracker RDEPENDS on gvfs, which
> is defined in meta-gnome which is a layer i'm not including.
>=20
>   so what is the preferred way to resolve stuff like that? is one
> simply supposed to *know* (or check) that tracker requires gvfs? or
> read the diagnostics and adjust accordingly?
>=20
>   given that tracker's home page is at gnome.org, would it make more
> sense for tracker to be part of meta-gnome instead of meta-oe? just
> trying to understand how recipes are distributed among the layers.

As nothing else in meta-oe depends on tracker, easiest way to
resolve this is to move tracker to meta-gnome.

With optional dependencies it's common to use PACKAGECONFIG and let
people enable PACKAGECONFIG option only when they also have required
layer.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vN1VrOpIkjMGbM/7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH/sQMACgkQN1Ujt2V2gBweFQCffDCOyU/sehbb2Y3HFbB+wOXF
eEIAn1eTb0HttnRUkpESiWwRH8FWoE5t
=k/av
-----END PGP SIGNATURE-----

--vN1VrOpIkjMGbM/7--
