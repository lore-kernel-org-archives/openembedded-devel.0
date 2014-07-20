Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id CBA6F6AC9D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 09:49:19 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so6315602wes.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 02:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HxuX8FCUCxxV4CFpzrjOCZNm+TFx0vtFVeseOFwWp9g=;
	b=FOhJN0XUohZWi7seO/pnuMnv+R7Bnob0kXPcwacIhbLkgs+lL9iqme2ASg0PL0VNNd
	PUfMh37ykNE5Fkd4lT7ARsoVxsjbBtPZ9zK0Fyhcf/f2aWFTg5YLq0FmbMDvfrTdltHC
	GtC8W0tMiVg4RANvjDYfi/SnAmp5K2y9pQ0RfpDb9QzGhCEYwACEflJKtpo4GqPnM8Ba
	KNzdCjGQLu9OOuAPoNiB4JsiTHlSNzgBfvOD1cnLUGuS6z2XZ8DgpGQDhVu5S/ltoCN2
	xijR7eM0wWvggEtPaXUqn4z2LH6LoF8Zg3bvCu7pDkAOVxw9Z24q4QUHf09C6Y6NtUmR
	xKdA==
X-Received: by 10.194.63.196 with SMTP id i4mr11871641wjs.50.1405849760098;
	Sun, 20 Jul 2014 02:49:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ub11sm28295036wib.1.2014.07.20.02.49.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 02:49:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 20 Jul 2014 11:49:33 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140720094933.GW2433@jama>
References: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
	<1405829260-13293-5-git-send-email-TicoTimo@gmail.com>
	<20140720081931.GU2433@jama>
MIME-Version: 1.0
In-Reply-To: <20140720081931.GU2433@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-multimedia][PATCH 4/4] vlc: add patches to fix B!=S and pkg-config
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
X-List-Received-Date: Sun, 20 Jul 2014 09:49:28 -0000
X-Groupsio-MsgNum: 51105
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9JI8GIjjmo2K4enO"
Content-Disposition: inline

--9JI8GIjjmo2K4enO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2014 at 10:19:31AM +0200, Martin Jansa wrote:
> On Sat, Jul 19, 2014 at 09:07:40PM -0700, Tim Orling wrote:
> > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > ---
> >  meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb b/meta=
-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
> > index 46a2712..f9be48d 100644
> > --- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
> > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
> > @@ -5,6 +5,8 @@ EXTRA_OECONF +=3D " --enable-libxml2=3Dno"
> > =20
> >  SRC_URI +=3D "file://0001-enable-subdir-objects.patch \
> >              file://0002-glibc-does-not-provide-strlcpy.patch \
> > +            file://0003-use-am-path-libgcrypt.patch \
> > +            file://0004-modules-gui-qt4-out-of-tree-build.patch \
> >  "
>=20
> Please add this together with .patch file itself.

nvm, I did that when cherry-picking to master-next

>=20
> >  SRC_URI[md5sum] =3D "7ed67d22f7425011078772bfc62ac222"
> > --=20
> > 1.9.3
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9JI8GIjjmo2K4enO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPLkK0ACgkQN1Ujt2V2gBzXEgCeKg0zITK8S2xeeLWBVwDz+qm6
EToAmQFeLhH/tRS/RDStCNOMPnO5Znhp
=07r5
-----END PGP SIGNATURE-----

--9JI8GIjjmo2K4enO--
