Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFhUa-0005AI-O2
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 09:20:12 +0200
Received: by bkat8 with SMTP id t8so5453212bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 00:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vB9b1d7bzHC9PCLsimSkJU+tbbqcDwF8gCM+lXiXANI=;
	b=GDahCL0HNhiWJTVRlmue90NS3KT8Ba8HouKmO7B8cFHs7Dg/CBvfGz46L1VqaR06I8
	ozUpdmjBi3tzbOv9PadjgJPFe3KMOjGemlriOIDrDZY9sTMe7WuRQpSvGD+j9zFCs6Rv
	bifeLGBcucYnrYsRCC2Lb4xyeC8OFS8LwJPwc=
Received: by 10.204.130.85 with SMTP id r21mr13488700bks.38.1318835655517;
	Mon, 17 Oct 2011 00:14:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm16094902bka.0.2011.10.17.00.14.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 00:14:14 -0700 (PDT)
Date: Mon, 17 Oct 2011 09:14:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111017071406.GF12684@jama.jama.net>
References: <CAAQYJAt+o+Wcp1aSa5pxSd_FAHYVJv-ZYLfKLYUt6n+tdkjjQw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAt+o+Wcp1aSa5pxSd_FAHYVJv-ZYLfKLYUt6n+tdkjjQw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: xserver-common and x11-common conflicting
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
X-List-Received-Date: Mon, 17 Oct 2011 07:20:12 -0000
X-Groupsio-MsgNum: 34792
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ni93GHxFvA+th69W"
Content-Disposition: inline

--ni93GHxFvA+th69W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2011 at 12:42:08AM +0200, Andrea Adami wrote:
> Hello,
>=20
> using oe-core and meta-oe my xserver settings are "touched" by two packag=
es:
>=20
> xserver-common: seems more complete, provides some xmodmaps (should be in
> BSP layers). Though it invocates fbset which is not in path.
> x11-common: needs maybe care but is using the formfactor settings from BSP
> so obviously is more modular
>=20
> I suppose once the merge is finished we'll have sane default settings.
> (atm the xserver-common is providing some extra cruft)

It was part of my original xorg patchset, but it needed more work
(rework ROOTLESS_X) and you wanted xorg in oe-core faster :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ni93GHxFvA+th69W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6b1b4ACgkQN1Ujt2V2gBwnEACdGNdUFQAMLKL3SKPThbV6IaPg
07IAn2y3i7rK4L017KNusQzcvKoXD/XN
=yNYs
-----END PGP SIGNATURE-----

--ni93GHxFvA+th69W--
