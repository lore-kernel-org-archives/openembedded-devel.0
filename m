Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9vU-00050g-ON
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:42:32 +0100
Received: by faas16 with SMTP id s16so6988113faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=e3eqriv10Fuzm65j5UjIu91wfLnvDEO/SqWVuW5sXhI=;
	b=oTx4wwHJBN4QzHNKYDgEAPsV+Nk5zitYODlV5LTJQ683Ivy3d8r9SVs+J0mF0sCxom
	IeAJoOs7lfUJGhjKUeqIIn/aH3ptYLMCZQm1uICKRX4GXT7IpcusdJq6/ed4dRPNch7n
	4VGeSY68yEKDvlW+lxLA7dpwe1dYAkugt4kK8=
Received: by 10.223.5.66 with SMTP id 2mr35505499fau.26.1320136586766;
	Tue, 01 Nov 2011 01:36:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y2sm43380193fag.12.2011.11.01.01.36.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:36:26 -0700 (PDT)
Date: Tue, 1 Nov 2011 09:36:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111101083619.GC4714@jama.jama.net>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<1881c344694290d71556dec7d9e784b6819f7a17.1319884094.git.Martin.Jansa@gmail.com>
	<j8oahf$g4n$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j8oahf$g4n$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][meta-oe 07/12] e-base: bump EFL_SRCREV and refresh patches and elementary version
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
X-List-Received-Date: Tue, 01 Nov 2011 08:42:33 -0000
X-Groupsio-MsgNum: 35153
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline

--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2011 at 09:27:27AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 29-10-11 12:29, Martin Jansa schreef:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> I get:
>=20
> c evas_engine.c  -fPIC -DPIC -o .libs/module_la-evas_engine.o
> | evas_engine.c: In function '_sym_init':
> | evas_engine.c:493:115: warning: assignment from incompatible pointer ty=
pe
> | evas_engine.c:493:273: warning: assignment from incompatible pointer ty=
pe
> | evas_engine.c: In function 'eng_gl_make_current':
> | evas_engine.c:3223:9: error: 'rsc' undeclared (first use in this functi=
on)
> | evas_engine.c:3223:9: note: each undeclared identifier is reported only
> once for each function it appears in
> | evas_engine.c: In function 'eng_gl_api_get':
> | evas_engine.c:3600:30: warning: assignment from incompatible pointer ty=
pe
> | make[5]: *** [module_la-evas_engine.lo] Error 1
> | make[5]: *** Waiting for unfinished jobs...
>=20
> regards,

Ah, sorry didn't fail here (probably gl_x11 isn't build), but it was fixed =
fw commits later,

can you try with SRCREV =3D "64516" in evas?

commit ae081608293eadb01a7bef6998baf35cc6b5354c
Author: caro <caro@7cbeb6ba-43b4-40fd-8cce-4c39aea84d33>
Date:   Sun Oct 30 05:02:05 2011 +0000

    declare the variables at the beginning of the block


    git-svn-id: svn+ssh://svn.enlightenment.org/var/svn/e/trunk@64516 7cbeb=
6ba-43b4-40fd-8cce-4c39aea84d33

commit a8f05145fc9fd2397493b668a8d8618a85414a74
Author: discomfitor <discomfitor@7cbeb6ba-43b4-40fd-8cce-4c39aea84d33>
Date:   Sun Oct 30 02:04:50 2011 +0000

    add missing variable from r64139
    direct all spankies to raster and Sung W. Park


    git-svn-id: svn+ssh://svn.enlightenment.org/var/svn/e/trunk@64514 7cbeb=
6ba-43b4-40fd-8cce-4c39aea84d33


>=20
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD4DBQFOr61vMkyGM64RGpERAnBUAJoD72qOUzuULyChDz8vLl13lBE5rgCY2RHN
> HcL5T8UkOy84Lr+z6i7dIg=3D=3D
> =3D6yE7
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6vr4MACgkQN1Ujt2V2gBzwxACfU9o1FEbNpcUsEMxZk8JUZupC
sR8An3iueYjVqQc1yQeROTu4T+AYa/NF
=M6Ee
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--
