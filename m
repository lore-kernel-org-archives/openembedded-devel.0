Return-Path: <stefan@datenfreihafen.org>
Received: from sirius.lasnet.de (sirius.lasnet.de [78.47.116.19])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6D7610DC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2013 09:48:29 +0000 (UTC)
Received: from host-78-149-139-187.as13285.net ([78.149.139.187]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69 #1)
	id 1VQDc4-0005uX-Mj by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2013 11:48:30 +0200
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.80)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1VQDc4-0001uF-Bl for openembedded-devel@lists.openembedded.org;
	Sun, 29 Sep 2013 10:48:28 +0100
Date: Sun, 29 Sep 2013 10:48:28 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130929094828.GD14909@novatech.datenfreihafen.org>
References: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
	<1380407119-2352-4-git-send-email-stefan@datenfreihafen.org>
	<20130929070845.GC3575@jama>
MIME-Version: 1.0
In-Reply-To: <20130929070845.GC3575@jama>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Sun, 29 Sep 2013 09:48:31 -0000
X-Groupsio-MsgNum: 46386
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Sun, 2013-09-29 at 09:08, Martin Jansa wrote:
> On Sat, Sep 28, 2013 at 11:25:17PM +0100, Stefan Schmidt wrote:
> > ---
> >  recipes-qt/maliit/maliit-framework-qt5_git.bb | 7 ++++---
> >  recipes-qt/maliit/maliit-plugins-qt5_git.bb   | 1 +
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt=
/maliit/maliit-framework-qt5_git.bb
> > index 7b336ff..4f2da19 100644
> > --- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
> > +++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
> > @@ -54,7 +54,7 @@ EXTRA_QMAKEVARS_PRE =3D "\
> >      PREFIX=3D${prefix} \
> >      LIBDIR=3D${libdir} \
> >      QT_IM_PLUGIN_PATH=3D${libdir}/qt4/plugins/inputmethods \
> > -    MALIIT_INSTALL_PRF=3D${datadir}/qt4/mkspecs/features \
> > +    MALIIT_INSTALL_PRF=3D${QMAKE_MKSPEC_PATH}/mkspecs/features \
> >      SCHEMADIR=3D${sysconfdir}/gconf/schemas \
> >      CONFIG+=3Ddisable-gconf \
> >      CONFIG+=3Ddisable-gtk-cache-update \
> > @@ -68,8 +68,9 @@ EXTRA_OEMAKE +=3D "INSTALL_ROOT=3D${D}"
> > =20
> >  do_install_append() {
> >      #Fix absolute paths
> > -    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}=
/qt4/mkspecs/features/maliit-framework.prf
> > -    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}=
/qt4/mkspecs/features/maliit-plugins.prf
> > +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/lib/qt=
5/mkspecs/features/maliit-framework.prf
> > +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/lib/qt=
5/mkspecs/features/maliit-plugins.prf
> > +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/lib/qt=
5/mkspecs/features/maliit-defines.prf
>=20
> Why not use QMAKE_MKSPEC_PATH here as well?

Because it does not work. I tried to use it initially. Just checked
again it fails with:
sed: can't read /data/WebOS/webos-ports-env/webos-ports/tmp-eglibc/sysroots=
/maguro/usr/lib/qt5/mkspecs/features/maliit-framework.prf: No such file or =
directory

At this stage the files are in ${D} but not in the maguro sysroot.

regards
Stefan Schmidt

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: http://www.datenfreihafen.org/contact.html

iEYEARECAAYFAlJH92wACgkQbNSsvd31FmXzugCfRe/p7EykSvJxpSYWakUcUI0v
o7AAnRQHy9CXohf3D21yVMrQNy7gaXI+
=6E5i
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
