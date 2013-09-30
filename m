Return-Path: <stefan@datenfreihafen.org>
Received: from sirius.lasnet.de (sirius.lasnet.de [78.47.116.19])
	by mail.openembedded.org (Postfix) with ESMTP id EEEA060EAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 17:19:50 +0000 (UTC)
Received: from host-78-149-139-187.as13285.net ([78.149.139.187]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69 #1)
	id 1VQh8L-0007Nm-VD by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 19:19:51 +0200
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.80)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1VQh8L-0005SG-JF for openembedded-devel@lists.openembedded.org;
	Mon, 30 Sep 2013 18:19:45 +0100
Date: Mon, 30 Sep 2013 18:19:45 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130930171945.GA6008@novatech.datenfreihafen.org>
References: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
	<1380407119-2352-4-git-send-email-stefan@datenfreihafen.org>
	<20130929070845.GC3575@jama>
	<20130929094828.GD14909@novatech.datenfreihafen.org>
	<20130929220238.GD3575@jama>
MIME-Version: 1.0
In-Reply-To: <20130929220238.GD3575@jama>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
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
X-List-Received-Date: Mon, 30 Sep 2013 17:19:51 -0000
X-Groupsio-MsgNum: 46395
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline

--EuxKj2iCbKjpUGkD
Content-Type: multipart/mixed; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Mon, 2013-09-30 at 00:02, Martin Jansa wrote:
> On Sun, Sep 29, 2013 at 10:48:28AM +0100, Stefan Schmidt wrote:
> > Hello.
> >=20
> > On Sun, 2013-09-29 at 09:08, Martin Jansa wrote:
> > > On Sat, Sep 28, 2013 at 11:25:17PM +0100, Stefan Schmidt wrote:
> > > > ---
> > > >  recipes-qt/maliit/maliit-framework-qt5_git.bb | 7 ++++---
> > > >  recipes-qt/maliit/maliit-plugins-qt5_git.bb   | 1 +
> > > >  2 files changed, 5 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipe=
s-qt/maliit/maliit-framework-qt5_git.bb
> > > > index 7b336ff..4f2da19 100644
> > > > --- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
> > > > +++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
> > > > @@ -54,7 +54,7 @@ EXTRA_QMAKEVARS_PRE =3D "\
> > > >      PREFIX=3D${prefix} \
> > > >      LIBDIR=3D${libdir} \
> > > >      QT_IM_PLUGIN_PATH=3D${libdir}/qt4/plugins/inputmethods \
> > > > -    MALIIT_INSTALL_PRF=3D${datadir}/qt4/mkspecs/features \
> > > > +    MALIIT_INSTALL_PRF=3D${QMAKE_MKSPEC_PATH}/mkspecs/features \
> > > >      SCHEMADIR=3D${sysconfdir}/gconf/schemas \
> > > >      CONFIG+=3Ddisable-gconf \
> > > >      CONFIG+=3Ddisable-gtk-cache-update \
> > > > @@ -68,8 +68,9 @@ EXTRA_OEMAKE +=3D "INSTALL_ROOT=3D${D}"
> > > > =20
> > > >  do_install_append() {
> > > >      #Fix absolute paths
> > > > -    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${data=
dir}/qt4/mkspecs/features/maliit-framework.prf
> > > > -    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${data=
dir}/qt4/mkspecs/features/maliit-plugins.prf
> > > > +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/li=
b/qt5/mkspecs/features/maliit-framework.prf
> > > > +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/li=
b/qt5/mkspecs/features/maliit-plugins.prf
> > > > +    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/li=
b/qt5/mkspecs/features/maliit-defines.prf
> > >=20
> > > Why not use QMAKE_MKSPEC_PATH here as well?
> >=20
> > Because it does not work. I tried to use it initially. Just checked
> > again it fails with:
> > sed: can't read /data/WebOS/webos-ports-env/webos-ports/tmp-eglibc/sysr=
oots/maguro/usr/lib/qt5/mkspecs/features/maliit-framework.prf: No such file=
 or directory
>=20
> Ah sorry, I looks like I've already forgot what's in QMAKE_MKSPEC_PATH,
> what you can use is:
> ${libdir}/${QT_DIR_NAME} instead of /usr/lib/qt5/

Fair enough. Changed it and attched the updated patch. Pushed it into
the branch as well. I can also re-submit the whole lot if you want and
if you are happy with rest.

regards
Stefan Schmidt

--vtzGhvizbBRQ85DL
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0004-maliit-qt5-Adjust-MKSPEC-path.patch"
Content-Transfer-Encoding: quoted-printable

From f2ba7e0875f9dc5ed468628566a748fed9371722 Mon Sep 17 00:00:00 2001
From: Stefan Schmidt <stefan@datenfreihafen.org>
Date: Thu, 19 Sep 2013 21:35:51 +0100
Subject: [PATCH 4/6] maliit-*-qt5: Adjust MKSPEC path

---
 recipes-qt/maliit/maliit-framework-qt5_git.bb | 7 ++++---
 recipes-qt/maliit/maliit-plugins-qt5_git.bb   | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/mal=
iit/maliit-framework-qt5_git.bb
index 7b336ff..35415a9 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -54,7 +54,7 @@ EXTRA_QMAKEVARS_PRE =3D "\
     PREFIX=3D${prefix} \
     LIBDIR=3D${libdir} \
     QT_IM_PLUGIN_PATH=3D${libdir}/qt4/plugins/inputmethods \
-    MALIIT_INSTALL_PRF=3D${datadir}/qt4/mkspecs/features \
+    MALIIT_INSTALL_PRF=3D${QMAKE_MKSPEC_PATH}/mkspecs/features \
     SCHEMADIR=3D${sysconfdir}/gconf/schemas \
     CONFIG+=3Ddisable-gconf \
     CONFIG+=3Ddisable-gtk-cache-update \
@@ -68,8 +68,9 @@ EXTRA_OEMAKE +=3D "INSTALL_ROOT=3D${D}"
=20
 do_install_append() {
     #Fix absolute paths
-    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4=
/mkspecs/features/maliit-framework.prf
-    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4=
/mkspecs/features/maliit-plugins.prf
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}/${QT=
_DIR_NAME}/mkspecs/features/maliit-framework.prf
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}/${QT=
_DIR_NAME}/mkspecs/features/maliit-plugins.prf
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}/${QT=
_DIR_NAME}/mkspecs/features/maliit-defines.prf
=20
     install -d ${D}${datadir}/applications
     install -m 644 ${WORKDIR}/maliit-server.desktop ${D}${datadir}/applica=
tions
diff --git a/recipes-qt/maliit/maliit-plugins-qt5_git.bb b/recipes-qt/malii=
t/maliit-plugins-qt5_git.bb
index 9d5b0e2..6b019ef 100644
--- a/recipes-qt/maliit/maliit-plugins-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
@@ -23,6 +23,7 @@ PV =3D "0.99.0+git${SRCPV}"
=20
 EXTRA_QMAKEVARS_PRE =3D "\
     PREFIX=3D${prefix} \
+    MALIIT_INSTALL_PRF=3D${QMAKE_MKSPEC_PATH}/mkspecs/features \
     LIBDIR=3D${libdir} \
     CONFIG+=3Dnodoc \
 "
--=20
1.8.4.rc3


--vtzGhvizbBRQ85DL--

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: http://www.datenfreihafen.org/contact.html

iEYEARECAAYFAlJJsrEACgkQbNSsvd31FmW+fACgtBecFyAsJl9KLtp/EIMLz/mp
ia0AnAjWmlq9ZsPi6wDmHqlf7SRtj4Gm
=upR9
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
