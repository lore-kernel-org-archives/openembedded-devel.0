Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1TCeCc-0005fl-Qn
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 00:17:35 +0200
Received: by pbcwy7 with SMTP id wy7so5955538pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 15:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=+EktQl3znIvHtx974D9Hul10qEomhc30Li1hzyAoMB4=;
	b=wjT/ngOfHwfMz97xQl+e8QI0mOtwMh+o/Kx8BpzY2j/P0g8CiA53WHZazpsTVz2wc+
	hTIXRRpGcOdxJwhr9wMR7VKKTgQBbA3rF/0AuEH2WJb8opkJJzesax46fo1Hi/DCu2yx
	BPpq2RA03ZRudF/Wy9dibmxoCvBF/89+BQNRs1fIJIHCqCRNYvMUjEIrMleTYnFTwM3b
	tnTJKH30gWfB4cERz6vWaE2/nawT7VRptDHeifSGIX9U9Av1v0aRjbSUR2+0l2vIwO8x
	AM6eUt0pleGug1Qy54Yc0vGSAjZwXSZWCzdD0oFiPtsqkvkaQLM2Rg0QarOnZFCLNMlG
	/zvw==
Received: by 10.68.130.131 with SMTP id oe3mr6742012pbb.102.1347660298858;
	Fri, 14 Sep 2012 15:04:58 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:e81d:b69a:2f88:8c48])
	by mx.google.com with ESMTPS id ps2sm1666803pbb.0.2012.09.14.15.04.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Sep 2012 15:04:57 -0700 (PDT)
Date: Fri, 14 Sep 2012 15:05:04 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20120914220504.GQ22028@bill-the-cat>
References: <cover.1347029881.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <cover.1347029881.git.sledz@dresearch-fe.de>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/1] pull request 20120907
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
X-List-Received-Date: Fri, 14 Sep 2012 22:17:35 -0000
X-Groupsio-MsgNum: 40670
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C01fF7hLGvN0zd9s"
Content-Disposition: inline

--C01fF7hLGvN0zd9s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 07, 2012 at 05:04:29PM +0200, Steffen Sledz wrote:

> Hi Tom,
>=20
> please pull this commit into 2011.03-maintenance branch.
> It fixes a build problem with llvm2.7.
>=20
> Thx,
> Steffen
>=20
> The following changes since commit 3b1d1112a9a80aba8dbee8b7bd54fe83a1acc6=
a1:
>=20
>   gtk+_2.20.1: Depend on gdk-pixbuf-native (2012-08-31 14:06:28 -0700)
>=20
> are available in the git repository at:
>=20
>   git://github.com/sledz/oe pull-request-1
>   https://github.com/sledz/oe/tree/pull-request-1
>=20
> Steffen Sledz (1):
>   llvm2.7: provide "lseek64" symbol
>=20
>  recipes/llvm/llvm2.7/r137567-lseek64.patch |   23 +++++++++++++++++++++++
>  recipes/llvm/llvm2.7_2.7.bb                |    3 ++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 recipes/llvm/llvm2.7/r137567-lseek64.patch

Applied, thanks!

--=20
Tom

--C01fF7hLGvN0zd9s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlBTqhAACgkQdZngf2G4WwMTTACfQve3IWM8dt6BxV+KLsE7UKVK
TYgAn0tX4wGAiWy8k1dIcLDgne2OGV/f
=L9Sx
-----END PGP SIGNATURE-----

--C01fF7hLGvN0zd9s--
