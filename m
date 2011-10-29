Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK8Ee-0002QM-V3
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 14:42:04 +0200
Received: by faas16 with SMTP id s16so4859003faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 05:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6CrusOOt4nYL2n2pVCq0WB4CtalnthhqamCX91bazGs=;
	b=RmDh64UJVDyOsw7ZUX1tjeY4cP733eanJaBemmEHD2ETeTR+kKTDxicIa/PuV5/fBa
	83fIaseZRnDXg6j/x+YCnmUPZUwoi1q2DhCvtssMuLzaHXOGqLjBf4L+UAqZEc0vr06c
	Jw62zOAPULvf2fj132rmftXa2AnxqagrZRrds=
Received: by 10.223.15.13 with SMTP id i13mr13523983faa.36.1319891762545;
	Sat, 29 Oct 2011 05:36:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p14sm24004148faf.20.2011.10.29.05.36.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 05:36:01 -0700 (PDT)
Date: Sat, 29 Oct 2011 14:35:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111029123556.GF12609@jama.jama.net>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<941836c79ce4b08c62672c36c77f47d3a8b89b83.1319884094.git.Martin.Jansa@gmail.com>
	<1319889545.3756.10.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1319889545.3756.10.camel@mattotaupa>
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
X-List-Received-Date: Sat, 29 Oct 2011 12:42:05 -0000
X-Groupsio-MsgNum: 35067
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9ToWwKEyhugL+MAz"
Content-Disposition: inline

--9ToWwKEyhugL+MAz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2011 at 01:59:05PM +0200, Paul Menzel wrote:
> Dear Martin,
>=20
>=20
> Am Samstag, den 29.10.2011, 12:29 +0200 schrieb Martin Jansa:
> > * from meta-angstrom revision 8aa9581a920abae8878df2f3faf9857474edd1f8
>=20
> I am not knowledgeable about the new infrastructure, so I cannot comment
> on the import.
>=20
> > * added RPROVIDES to be able to drop server part from task-x11
> > * updated DESCRIPTION to match
> > * renamed to task-x11-server for upgradeable path
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-core/tasks/task-x11-server_1.0.bb |   24 +++++++++++++=
++++++++
> >  1 files changed, 24 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
> >=20
> > diff --git a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb b/meta-o=
e/recipes-core/tasks/task-x11-server_1.0.bb
> > new file mode 100644
> > index 0000000..86de1ec
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
> > @@ -0,0 +1,24 @@
> > +DESCRIPTION =3D "Task for a image with Xserver"
>=20
> s/a image/an image/
>=20
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109=
285ec7b81fdeb3b58"
> > +PR =3D "r9"
> > +
> > +inherit task
> > +
> > +# for backwards compatibility
> > +RPROVIDES_${PN} =3D "task-x11-server"
> > +
> > +XSERVER ?=3D "xserver-xorg \
> > +           xf86-input-evdev \
> > +           xf86-input-mouse \
> > +           xf86-video-fbdev \
> > +           xf86-input-keyboard \
> > +"
> > +
> > +
> > +RDEPENDS_${PN} =3D " \
> > +  ${XSERVER} \
> > +"
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
>=20
> No newline needed at the end?
>=20
>=20
> Thanks,
>=20
> Paul

Thanks for review, updated in branch

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9ToWwKEyhugL+MAz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6r8ywACgkQN1Ujt2V2gBxDbQCgu8bRX57VzqRCuVfoj6tO8rfI
e0sAnRf+Kd5rOLbIHgxnUb0TNRozlMxa
=47Lk
-----END PGP SIGNATURE-----

--9ToWwKEyhugL+MAz--
