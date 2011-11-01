Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9UL-0007sE-CU
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:14:29 +0100
Received: by faas16 with SMTP id s16so6972952faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=g0obTN4GNGbFhDVqAxOEtQamKLJRrEwSDhfibkOIzt4=;
	b=CeWk9X7wz+znl+WLAKnGDY71DRfj5UOmrxrRSqBLpOpqaCi32z7Gtg3kgTJWx8rPL7
	gimqd7j4IIeaxg1g4u87x435SkdD9Z3aSAr5xCwXZ1PSd73Hop7oLW5TTsg4vEQSEVeB
	5gdsWtYQwRTch0JCKI+IglmXs0ALx+qFoQL9U=
Received: by 10.223.15.13 with SMTP id i13mr35300212faa.36.1320134901621;
	Tue, 01 Nov 2011 01:08:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g25sm43235639fae.16.2011.11.01.01.08.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:08:20 -0700 (PDT)
Date: Tue, 1 Nov 2011 09:08:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111101080814.GB4714@jama.jama.net>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<941836c79ce4b08c62672c36c77f47d3a8b89b83.1319884094.git.Martin.Jansa@gmail.com>
	<j8o884$2bp$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j8o884$2bp$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][meta-oe 09/12] task-x11-server: import from Angstrom
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
X-List-Received-Date: Tue, 01 Nov 2011 08:14:29 -0000
X-Groupsio-MsgNum: 35135
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline

--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2011 at 08:48:20AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 29-10-11 12:29, Martin Jansa schreef:
> > * from meta-angstrom revision 8aa9581a920abae8878df2f3faf9857474edd1f8 *
> > added RPROVIDES to be able to drop server part from task-x11 * updated
> > DESCRIPTION to match * renamed to task-x11-server for upgradeable path
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---=20
> > meta-oe/recipes-core/tasks/task-x11-server_1.0.bb |   24
> > +++++++++++++++++++++ 1 files changed, 24 insertions(+), 0 deletions(-)=
=20
> > create mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
> >=20
> > diff --git a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
> > b/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb new file mode 10064=
4=20
> > index 0000000..86de1ec --- /dev/null +++
> > b/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb @@ -0,0 +1,24 @@=20
> > +DESCRIPTION =3D "Task for a image with Xserver" +LICENSE =3D "MIT"=20
> > +LIC_FILES_CHKSUM =3D
> > "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58" +PR=
 =3D
> > "r9" + +inherit task + +# for backwards compatibility +RPROVIDES_${PN} =
=3D
> > "task-x11-server"
>=20
> I think that shoud read:
>=20
> RPROVIDES_${PN} +=3D "task-xserver"
>=20
> To provide a proper upgrade path.

Ah you're right.. I had this before renaming the recipe to
task-x11-server and then forgot to change it.

Will fix it in branch.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6vqO4ACgkQN1Ujt2V2gBxcFgCgnSCf5nfu3Xr0t2N+u1i7cvNI
KnYAoJhylyXHQybERRNGCTjY1COaA2n+
=JuQ4
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
