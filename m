Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 873BB61005
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2013 22:02:35 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so2286894eaj.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2013 15:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AiQRmnG5kfyomq0eR6jl/yZmPfb8WqbHoGqjUNDHSaM=;
	b=HpcMBNJlCN93zDqiJYgm54XSfaVqLKP6JCWW0TIgtJTr0kYi5b81ZqEWR5NCRgInSB
	ud32v87njfLj8lQu9dEMHZKji5rTiyrM/NTUozBMU6Vazs5fAeEAf5VQuwGPMfHcCpVZ
	4VlYopRiBOU0nFKLS4VID4hQ07HasPbybTDKhpFIZlSJMuLvbzsZCb4wFVt0Mn5dQHb5
	gJsoXDvxKK8uSiSJXAZ1vm6g9or0cMDmpkFXDaipb8Irx8fimzJGQl49IyqUvD+DDTX/
	7b1jZPhPQ62NuLtARuuyP8b3zDe8saFkuYzBYQTqUxF6CmV3RiJePfEKUnz5z4737BYu
	9Ymw==
X-Received: by 10.14.107.68 with SMTP id n44mr32269123eeg.26.1380492157116;
	Sun, 29 Sep 2013 15:02:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm43690439eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 29 Sep 2013 15:02:36 -0700 (PDT)
Date: Mon, 30 Sep 2013 00:02:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130929220238.GD3575@jama>
References: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
	<1380407119-2352-4-git-send-email-stefan@datenfreihafen.org>
	<20130929070845.GC3575@jama>
	<20130929094828.GD14909@novatech.datenfreihafen.org>
MIME-Version: 1.0
In-Reply-To: <20130929094828.GD14909@novatech.datenfreihafen.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 4/6] maliit-*-qt5: Adjust MKSPEC path
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
X-List-Received-Date: Sun, 29 Sep 2013 22:02:36 -0000
X-Groupsio-MsgNum: 46388
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Content-Disposition: inline

--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2013 at 10:48:28AM +0100, Stefan Schmidt wrote:
> Hello.
>=20
> On Sun, 2013-09-29 at 09:08, Martin Jansa wrote:
> > On Sat, Sep 28, 2013 at 11:25:17PM +0100, Stefan Schmidt wrote:
> > > ---
> > >  recipes-qt/maliit/maliit-framework-qt5_git.bb | 7 ++++---
> > >  recipes-qt/maliit/maliit-plugins-qt5_git.bb   | 1 +
> > >  2 files changed, 5 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-=
qt/maliit/maliit-framework-qt5_git.bb
> > > index 7b336ff..4f2da19 100644
> > > --- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
> > > +++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
> > > @@ -54,7 +54,7 @@ EXTRA_QMAKEVARS_PRE =3D "\
> > >      PREFIX=3D${prefix} \
> > >      LIBDIR=3D${libdir} \
> > >      QT_IM_PLUGIN_PATH=3D${libdir}/qt4/plugins/inputmethods \
> > > -    MALIIT_INSTALL_PRF=3D${datadir}/qt4/mkspecs/features \
> > > +    MALIIT_INSTALL_PRF=3D${QMAKE_MKSPEC_PATH}/mkspecs/features \
> > >      SCHEMADIR=3D${sysconfdir}/gconf/schemas \
> > >      CONFIG+=3Ddisable-gconf \
> > >      CONFIG+=3Ddisable-gtk-cache-update \
> > > @@ -68,8 +68,9 @@ EXTRA_OEMAKE +=3D "INSTALL_ROOT=3D${D}"
> > > =20
> > >  do_install_append() {
> > >      #Fix absolute paths
> > > -    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadi=
r}/qt4/mkspecs/features/maliit-framework.prf
> > > -    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadi=
r}/qt4/mkspecs/features/maliit-plugins.prf
> > > +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/lib/=
qt5/mkspecs/features/maliit-framework.prf
> > > +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/lib/=
qt5/mkspecs/features/maliit-plugins.prf
> > > +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/lib/=
qt5/mkspecs/features/maliit-defines.prf
> >=20
> > Why not use QMAKE_MKSPEC_PATH here as well?
>=20
> Because it does not work. I tried to use it initially. Just checked
> again it fails with:
> sed: can't read /data/WebOS/webos-ports-env/webos-ports/tmp-eglibc/sysroo=
ts/maguro/usr/lib/qt5/mkspecs/features/maliit-framework.prf: No such file o=
r directory

Ah sorry, I looks like I've already forgot what's in QMAKE_MKSPEC_PATH,
what you can use is:
${libdir}/${QT_DIR_NAME} instead of /usr/lib/qt5/

Regards,


>=20
> At this stage the files are in ${D} but not in the maguro sysroot.
>=20
> regards
> Stefan Schmidt



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJIo34ACgkQN1Ujt2V2gBwRDQCgkKU0JTYOvxf6Y7S5hfWyr7Vl
SzgAn0BKxRN4+XysLLvByKrc8mNmMXQb
=rksA
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--
