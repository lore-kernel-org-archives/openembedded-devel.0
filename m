Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R1Fbq-0004Ha-V5
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 12:43:59 +0200
Received: by eyb7 with SMTP id 7so5108678eyb.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 03:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xK3sRq/hxPDVZjKE/A9sVVs5ZXmRbKA6L5ATtirUTs0=;
	b=uUiUBqoH5ds3GB9FK/L70claLSILcDmDzU/6zvnNdzEMK2MZwtO4vgVtRkAcUZNhes
	i4YCeUYqaYcJuY++gFcRQ6KFKtkQhFIl8lfiupDQCKBXCrGQxNGac1bXjiZhBk3w/fGx
	/xtspWAlthA9fP+j5qdCNrjAzMEtOvix536UI=
Received: by 10.213.28.74 with SMTP id l10mr238545ebc.45.1315391936612;
	Wed, 07 Sep 2011 03:38:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm5948903eef.2.2011.09.07.03.38.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 03:38:55 -0700 (PDT)
Date: Wed, 7 Sep 2011 12:38:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110907103848.GB19221@jama.jama.net>
References: <1315349980-6611-1-git-send-email-eric@eukrea.com>
	<1315387357-21355-1-git-send-email-eric@eukrea.com>
	<CAAQYJAtpPps4s7Y5FYEmOYCUX3ynwY+_Hn=37KD2xbDD2k3hrg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAtpPps4s7Y5FYEmOYCUX3ynwY+_Hn=37KD2xbDD2k3hrg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe v2] tzdata & tzcode: update to 2011i
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
X-List-Received-Date: Wed, 07 Sep 2011 10:43:59 -0000
X-Groupsio-MsgNum: 34115
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline

--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2011 at 12:25:44PM +0200, Andrea Adami wrote:
> 2011/9/7 Eric B=E9nard <eric@eukrea.com>
>=20
> > Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> > ---
> >  ...code-native_2011g.bb =3D> tzcode-native_2011i.bb} |   11 +++++------
> >  .../tzdata/{tzdata_2011g.bb =3D> tzdata_2011i.bb}    |    4 ++--
> >  2 files changed, 7 insertions(+), 8 deletions(-)
> >  rename meta-oe/recipes-extended/tzcode/{tzcode-native_2011g.bb =3D>
> > tzcode-native_2011i.bb} (56%)
> >  rename meta-oe/recipes-extended/tzdata/{tzdata_2011g.bb =3D>
> > tzdata_2011i.bb} (72%)
> >
> > diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bbb/me=
ta-oe/recipes-extended/tzcode/
> > tzcode-native_2011i.bb
> > similarity index 56%
> > rename from meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
> > rename to meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
> > index 651d1dd..358a313 100644
> > --- a/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
> > +++ b/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
> > @@ -9,12 +9,11 @@ LIC_FILES_CHKSUM =3D
> > "file://README;md5=3D3ae8198f82258417ce29066d3b034035"
> >  # Also, tzdata (and it is needed to build tzcode) version can differ f=
rom
> >  # tzcode version, thus this variable
> >
> > -TZDATA_PV =3D "2011h"
> > +TZDATA_PV =3D "2011i"
> >
> >  PR =3D "${INC_PR}.1"
> >
> > -SRC_URI[tzcode-2011g.md5sum] =3D "ecb564279b28c5b184421c525d997d6c"
> > -SRC_URI[tzcode-2011g.sha256sum] =3D
> > "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
> > -SRC_URI[tzdata-2011h.md5sum] =3D "546d27b6c1e5e1097bd512651815017f"
> > -SRC_URI[tzdata-2011h.sha256sum] =3D
> > "c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"
> > -
> > +SRC_URI[tzcode-2011i.md5sum] =3D "cf7f4335b7c8682899fa2814e711c1b2"
> > +SRC_URI[tzcode-2011i.sha256sum] =3D
> > "f0dd991de3f8d6c599c104e294377c9befa1ef40aa5a1d09e2e295a453f3c1ec"
> > +SRC_URI[tzdata-2011i.md5sum] =3D "c7a86ec34f30f8d6aa77ef94902a3047"
> > +SRC_URI[tzdata-2011i.sha256sum] =3D
> > "f8dde7ca5e61f21ac34c8cdbef5568d00c829981211098f059d8104964c81ffa"
> > diff --git a/meta-oe/recipes-extended/tzdata/tzdata_2011g.bbb/meta-oe/r=
ecipes-extended/tzdata/
> > tzdata_2011i.bb
> > similarity index 72%
> > rename from meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
> > rename to meta-oe/recipes-extended/tzdata/tzdata_2011i.bb
> > index 6863b5a..783b38e 100644
> > --- a/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
> > +++ b/meta-oe/recipes-extended/tzdata/tzdata_2011i.bb
> > @@ -8,5 +8,5 @@ LIC_FILES_CHKSUM =3D
> > "file://asia;beginline=3D2;endline=3D3;md5=3D06468c0e84ef4d4c97045a
> >  # just bump it to the latest available version, removing the old one
> >
> >  PR =3D "${INC_PR}.0"
> > -SRC_URI[md5sum] =3D "a068c27e7e426fdb12ab0c88506df20d"
> > -SRC_URI[sha256sum] =3D
> > "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
> > +SRC_URI[md5sum] =3D "c7a86ec34f30f8d6aa77ef94902a3047"
> > +SRC_URI[sha256sum] =3D
> > "f8dde7ca5e61f21ac34c8cdbef5568d00c829981211098f059d8104964c81ffa"
> > --
> > 1.7.6
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
>=20
> tzdata and tzcode 2011i are already in oe-core.
> Why do we keep another version here? Maybe because the different do_insta=
ll?

I've imported 2011e from meta-shr to meta-oe on Sun, 10 Apr 2011, just
because oe-core had 2010o in that time and I didn't want to downgrade.
Now with newer version in oe-core already I'm fine with dropping it from
meta-oe.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5nSbgACgkQN1Ujt2V2gBxwqACcCmCQatTIem7JVKPPbAuWBluw
zoEAn0UsMj2e6ZErhr7EIJ/wXY1J6Alk
=KIXv
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
