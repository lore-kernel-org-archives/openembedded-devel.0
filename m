Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtyLU-0007V5-Hz
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:53:00 +0200
Received: by bkbzu17 with SMTP id zu17so1478189bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 01:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wXwDBg6bAUOcTXfhfNdoKqZmFSB09qY1Dncx9dkRTQM=;
	b=vj5BmsfszrJDn+o3Bd72VR6VM/3vTg7eh+82eu/ylyxu8k86BVwtIWYzdXndjMIz61
	IMMuKAiUTLoHo7FEmkPOkrlrQQzWjBcCn79j+SmhIL+SdvkhYSAM1XQlq5/uTy4vR2JU
	d9IOmP9l8N2YBBd0m+xcVZPp88yv2A5LXuD8M=
Received: by 10.204.233.11 with SMTP id jw11mr213148bkb.270.1313657301412;
	Thu, 18 Aug 2011 01:48:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z7sm647868bkt.39.2011.08.18.01.48.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Aug 2011 01:48:20 -0700 (PDT)
Date: Thu, 18 Aug 2011 10:48:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110818084813.GB6465@jama.jama.net>
References: <cover.1313655217.git.Martin.Jansa@gmail.com>
	<b70d3308cd1493c12b7e1ba39fbfa5bb38c8ecc1.1313655217.git.Martin.Jansa@gmail.com>
	<1313656846.4016.18.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1313656846.4016.18.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/3] kexec-tools-klibc: import from meta-zaurus layer
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
X-List-Received-Date: Thu, 18 Aug 2011 08:53:00 -0000
X-Groupsio-MsgNum: 33687
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline

--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2011 at 10:40:46AM +0200, Paul Menzel wrote:
> Dear Martin,
>=20
>=20
> Am Donnerstag, den 18.08.2011, 10:14 +0200 schrieb Martin Jansa:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> please include the commit id as documented in the Commit Patch Message
> Guidelines [1].

OK, I'll add it, but meta-zaurus is just temporary layer so later it
will be removed completely.

> Why was is not included into meta-oe in the first place? Should it be
> included in oe-core right away?

It's easier to test it somewhere first and as zaurus layer was first to
use kexec-tools-klibc for linux-kexecboot then it was added to
meta-zaurus first and now after tests and cleanup, it's good enough to
be moved to meta-oe.

It cannot be moved to oe-core, because klibc was added few days ago only
to meta-oe.

>=20
> > ---
> >  .../kexec/kexec-tools-klibc-2.0.2/elf.patch        |   94 ++++++++++++=
+++++++
> >  .../kexec/kexec-tools-klibc-2.0.2/errno.patch      |   13 +++
> >  .../kexec/kexec-tools-klibc-2.0.2/other.patch      |   97 ++++++++++++=
++++++++
> >  .../kexec/kexec-tools-klibc-2.0.2/string.patch     |   11 ++
> >  .../kexec/kexec-tools-klibc-2.0.2/syscall.patch    |   46 +++++++++
> >  .../kexec/kexec-tools-klibc_2.0.2.bb               |   27 ++++++
> >  6 files changed, 288 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.=
2/elf.patch
> >  create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.=
2/errno.patch
> >  create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.=
2/other.patch
> >  create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.=
2/string.patch
> >  create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.=
2/syscall.patch
> >  create mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.=
2.bb
>=20
> [=E2=80=A6]
>=20
> > diff --git a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/=
meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
> > new file mode 100644
> > index 0000000..e4f126e
> > --- /dev/null
> > +++ b/meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
> > @@ -0,0 +1,27 @@
> > +# the binaries are statically linked against klibc
> > +require recipes-kernel/kexec/kexec-tools.inc
> > +SRC_URI[md5sum] =3D "bc401cf3262b25ff7c9a51fc76c8ab91"
> > +SRC_URI[sha256sum] =3D "549ab65c18a2229b6bf21b6875ca6bbe0e579bca08c354=
3ce6aaf8287a0b4188"
> > +
> > +PR =3D "r6"
>=20
> Start with "r0" or will that cause problems for the meta-zaurus users?

I can reset it if we don't care about upgrade-path for meta-zaurus
users..

> > +inherit klibc
> > +
> > +FILESPATH =3D. "${FILE_DIRNAME}/kexec-tools-${PV}:"
> > +
> > +SRC_URI +=3D "file://elf.patch \
> > +            file://errno.patch \
> > +            file://string.patch \
> > +            file://syscall.patch \
> > +            file://other.patch \
> > +            "
> > +
> > +S =3D "${WORKDIR}/kexec-tools-${PV}"
> > +
> > +EXTRA_OECONF =3D " --without-zlib"
>=20
> Is `+=3D` needed? Either way the space could be removed in a fix up patch.

klibc.bbclass doesn't add anything to EXTRA_OECONF but you're right +=3D
can be usefull later when someone finds some option usefull for all
klibc builds (but I doubt that).

> > +
> > +PACKAGES =3D+ "kexec-klibc kdump-klibc"
> > +
> > +CFLAGS +=3D "-I${STAGING_DIR_HOST}${base_libdir}/klibc/include -I${STA=
GING_DIR_HOST}${base_libdir}/klibc/include/bits32"
> > +
> > +FILES_kexec-klibc =3D "${sbindir}/kexec"
> > +FILES_kdump-klibc =3D "${sbindir}/kdump"
>=20
> Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
>=20
>=20
> Thanks,

Thanks for review!.

>=20
> Paul
>=20
>=20
> [1] http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guideline=
s#Importing_from_Elsewhere



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5M0c0ACgkQN1Ujt2V2gByicQCfX21KIVIIbREQfZI90mbWD62q
7DQAnicTGOgd55CPP6qqeq5+FgSIU8lB
=JnIi
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
