Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1TLbCF-00064E-HR
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 16:54:11 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so4774213pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 07:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=ts5ukgA2rSlFbYT/ZSSx30Dw0aS+03xsa9wpE4cNt74=;
	b=mwByLiT332iJf0NGjgo8j7D/dtmFTBrtDsLJaUmHXccQ7y3eFZxb0LmbRmG9fORG6h
	qKdf0x9ibou18PsnLp7dSI9pK+Aq21YQ1s3S1Yw9FdP+QOyYZLHc7fai8JR66ha5MB9p
	orr84ZKSQevLB0CcOLvmj2E3oHuyr+EcwOxil9sz7YS4cSLnZJPRF9D6KutDaI4foesx
	9ytiDqKQ+34ge7+llmDJPQSCHELPR9sx22qlrz9MGQvYoDA6xLqN3+45jjfiOMsWXTYJ
	ceyIqx0jcnsa1fLe818+GqOSjyLj5aHv/yEaedfUQ8trzCywdl4Or7ywL3T4MPDPczxw
	RFMw==
Received: by 10.68.226.136 with SMTP id rs8mr24001126pbc.153.1349793665806;
	Tue, 09 Oct 2012 07:41:05 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:d921:cb9:5b45:279c])
	by mx.google.com with ESMTPS id oe5sm12502048pbb.8.2012.10.09.07.41.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 07:41:04 -0700 (PDT)
Date: Tue, 9 Oct 2012 07:41:11 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20121009144111.GC16530@bill-the-cat>
References: <cover.1349266768.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <cover.1349266768.git.sledz@dresearch-fe.de>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/1] pull request 20121003
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
X-List-Received-Date: Tue, 09 Oct 2012 14:54:11 -0000
X-Groupsio-MsgNum: 41027
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline

--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 03, 2012 at 02:22:29PM +0200, Steffen Sledz wrote:

> Hi Tom,
>=20
> please pull this commit which fixes the QA issue
>=20
>  ERROR: This autoconf log indicates errors, it looked at host includes.
>=20
> for subversion by backporting some build related patches and recipe
> modifications from oe-core.
>=20
> Thx,
> Steffen
>=20
> The following changes since commit a35ceaacb2019750dc9f4b4fd5ea927cf2ad47=
fb:
>=20
>   gdk-pixbuf: add missing dependencies (2012-09-14 15:07:04 -0700)
>=20
> are available in the git repository at:
>=20
>   git://github.com/sledz/oe pull-request-2
>   https://github.com/sledz/oe/tree/pull-request-2
>=20
> Steffen Sledz (1):
>   subversion-1.6.5: fix QA issue
>=20
>  recipes/subversion/files/fix-install-depends.patch |   45 ++++++++++++++=
++++++
>  recipes/subversion/files/libtool2.patch            |   17 ++++++++
>  recipes/subversion/subversion_1.6.5.bb             |   21 ++++++---
>  3 files changed, 76 insertions(+), 7 deletions(-)
>  create mode 100644 recipes/subversion/files/fix-install-depends.patch
>  create mode 100644 recipes/subversion/files/libtool2.patch

Applied to 2011.03-maintenance, thanks and sorry for the delay.

--=20
Tom

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlB0N4YACgkQdZngf2G4WwPJGgCeIw+Kf6nJxNvc5D3a1TVgMoJu
lE0An0wM5eKigdynfISTnjLL6Q6tJRA/
=ZZM6
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
