Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7A79965D8D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:38:33 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so2889848eei.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7vWeo9qNVD2fJNdpkdwv4Vb0ILUnhYXG06H22AHgC+s=;
	b=uutXKzDHH+b5RnC1ATm4tI44E43gdPrmnBAggVaHyTEHsjlrCDTuDwQM2n5B1nGHAG
	HKLoBFtyjCyBssC6rlkPCkIxMf96HN5Y+yEAAUJBHlRvyE9OIL6JeaKl/FDuyyPc/3om
	Z3iG/tzF9AEdNY1Wki5rYBaIy2nLqQG7qn1A+hddMC5ZupiGmFVOu93w1mlBE/rCxAJM
	naEds9h4pjPLh7IW0x2SWlf6qKtlGhIhLVgISsru2PA6wDga8cP0Vao7D25YRp2UXKUf
	BUfFM94iw2KjKiir81+UAIA3MyJjolKnpAKEipWmBCjaRkdLeQ+UAsXrlhDxi/SvnqoW
	+y3Q==
X-Received: by 10.15.91.77 with SMTP id r53mr8412eez.70.1397993914592;
	Sun, 20 Apr 2014 04:38:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z48sm93892937eel.27.2014.04.20.04.38.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:38:33 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:38:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420113838.GW2486@jama>
References: <1397067991-1308-1-git-send-email-trevor.woerner@linaro.org>
	<1397067991-1308-2-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1397067991-1308-2-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: patches@linaro.org
Subject: Re: [meta-gpe][PATCH] fbreader: remove old, non-building version
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
X-List-Received-Date: Sun, 20 Apr 2014 11:38:38 -0000
X-Groupsio-MsgNum: 49330
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KG+zyBxh8BrwB1om"
Content-Disposition: inline

--KG+zyBxh8BrwB1om
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 02:26:31PM -0400, Trevor Woerner wrote:
> The download for fbreader-0.12.10 doesn't exist at the location provided =
by
> this recipe. Most of the downloads appear to have moved to
> fbreader.org/files/desktop, but trying to retrieve version 0.12.10 from t=
hat
> location fails too.

The old one was building fine for me (tarball from PREMIRROR)

_git version has few QA issues:
log.world.20140418_190059.log/bitbake.log:WARNING: QA Issue: File '/usr/lib=
/libzlcore.so.0.14.0' from fbreader was already stripped, this will prevent=
 future debugging!
log.world.20140418_190059.log/bitbake.log:WARNING: QA Issue: File '/usr/lib=
/libzltext.so.0.14.0' from fbreader was already stripped, this will prevent=
 future debugging!
log.world.20140418_190059.log/bitbake.log:WARNING: QA Issue: File '/usr/lib=
/zlibrary/ui/zlui-gtk.so' from fbreader was already stripped, this will pre=
vent future debugging!
log.world.20140418_190059.log/bitbake.log:WARNING: QA Issue: File '/usr/bin=
/FBReader' from fbreader was already stripped, this will prevent future deb=
ugging!

not sure if the old one had the same QA issues (I don't think so) so we sho=
uld
resolve this before changing the version.

>=20
> There is a _git version of this recipe which builds just fine.
>=20
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  .../fbreader/fbreader-0.12.10/Makefile.patch       | 22 ------------
>  .../fbreader/fbreader-0.12.10/gcc45.patch          | 20 -----------
>  .../recipes-support/fbreader/fbreader_0.12.10.bb   | 42 ----------------=
------
>  3 files changed, 84 deletions(-)
>  delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Ma=
kefile.patch
>  delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gc=
c45.patch
>  delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
>=20
> diff --git a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.=
patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
> deleted file mode 100644
> index 0e498c7..0000000
> --- a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -diff -uri fbreader-0.12.1.orig/fbreader/Makefile fbreader-0.12.1/fbreade=
r/Makefile
> ---- fbreader-0.12.1.orig/fbreader/Makefile	2009-12-13 09:03:11.000000000=
 +0100
> -+++ fbreader-0.12.1/fbreader/Makefile	2009-12-14 17:18:47.548638783 +0100
> -@@ -37,7 +37,6 @@
> - 	@install $(TARGET) $(DESTDIR)$(BINDIR)/FBReader
> - 	@install -d $(FBSHAREDIR)
> - 	@install -d $(FBSHAREDIR)/help
> --	@./scripts/install_help.sh $(VARIANT) $(FBSHAREDIR)/help
> - 	@install -d $(FBSHAREDIR)/network
> - 	@install -m 0644 $(wildcard data/network/*.xml) $(FBSHAREDIR)/network
> - 	@install -d $(FBSHAREDIR)/network/certificates
> -@@ -58,8 +57,8 @@
> - 	@install -d $(FBSHAREDIR)/resources
> - 	@install -m 0644 $(wildcard data/resources/*.xml) $(FBSHAREDIR)/resour=
ces
> - 	@install -d $(DESTDIR)$(APPIMAGEDIR_REAL)
> --	@install -m 0644 $(wildcard data/icons/toolbar/$(VARIANT)/*.*) $(DESTD=
IR)$(APPIMAGEDIR_REAL)
> --	@install -m 0644 $(wildcard data/icons/filetree/$(VARIANT)/*.*) $(DEST=
DIR)$(APPIMAGEDIR_REAL)
> -+	@install -m 0644 $(wildcard data/icons/toolbar/$(TARGET_ARCH)/*.*) $(D=
ESTDIR)$(APPIMAGEDIR_REAL)
> -+	@install -m 0644 $(wildcard data/icons/filetree/$(TARGET_ARCH)/*.*) $(=
DESTDIR)$(APPIMAGEDIR_REAL)
> - 	@install -m 0644 $(wildcard data/icons/booktree/new/*.*) $(DESTDIR)$(A=
PPIMAGEDIR_REAL)
> - 	@make -C $(TARGET_ARCH) RESOLUTION=3D$(RESOLUTION) install
> -=20
> diff --git a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.pat=
ch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
> deleted file mode 100644
> index 00cba10..0000000
> --- a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -  Fix compilation with gcc 4.5
> -
> -  [FBreader Ticket #340] -- http://old.fbreader.org/mantis/view.php?id=
=3D340
> -
> -  Without that patch we have:
> -    Compiling Library.o ...Library.cpp:42:1: error: 'Library::Library' n=
ames the constructor, not the type
> -
> -  Upstream-Status: Accepted [Fixed in Version 0.14.0]
> -
> ---- fbreader-0.12.10-orig/fbreader/src/library/Library.cpp	2010-04-01 15=
:14:24.000000000 +0200
> -+++ fbreader-0.12.10/fbreader/src/library/Library.cpp	2010-04-13 13:34:0=
6.000000000 +0200
> -@@ -39,7 +39,7 @@
> - shared_ptr<Library> Library::ourInstance;
> - const size_t Library::MaxRecentListSize =3D 10;
> -=20
> --Library::Library &Library::Instance() {
> -+Library &Library::Instance() {
> - 	if (ourInstance.isNull()) {
> - 		ourInstance =3D new Library();
> - 	}
> diff --git a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta=
-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
> deleted file mode 100644
> index e9ead0f..0000000
> --- a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -SUMMARY =3D "FBreader is an ebook reader"
> -HOMEPAGE =3D "http://www.fbreader.org"
> -SECTION =3D "x11/utils"
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://fbreader/LICENSE;md5=3D94d55d512a9ba36caa9b=
7df079bae19f"
> -DEPENDS =3D "gtk+ enca expat bzip2 libgpewidget virtual/libiconv libline=
break libfribidi curl sqlite3"
> -
> -PR =3D "r1"
> -
> -SRC_URI =3D "http://www.fbreader.org/fbreader-sources-${PV}.tgz \
> -file://Makefile.patch \
> -file://gcc45.patch"
> -
> -# Set the defaults
> -READER_RESOLUTION ?=3D "1024x600"
> -READER_ARCH       ?=3D "desktop"
> -READER_UI         ?=3D "gtk"
> -READER_STATUS     ?=3D "release"
> -
> -FILES_${PN} +=3D "${datadir}/FBReader ${datadir}/zlibrary ${libdir}/zlib=
rary"
> -FILES_${PN}-dbg +=3D "${libdir}/zlibrary/ui/.debug/"
> -
> -CFLAGS_append =3D " RESOLUTION=3D${READER_RESOLUTION} INSTALLDIR=3D${pre=
fix}"
> -EXTRA_OEMAKE =3D "CC=3D'${CXX}' LD=3D'${CXX}' LDFLAGS=3D'${LDFLAGS}' INC=
PATH=3D'${STAGING_INCDIR}' LIBPATH=3D'${STAGING_LIBDIR}'"
> -
> -inherit pkgconfig
> -
> -do_configure() {
> -    cd ${WORKDIR}/${PN}-${PV}
> -    mv makefiles/target.mk makefiles/target.mk.orig
> -
> -    echo "TARGET_ARCH =3D ${READER_ARCH}" > makefiles/target.mk
> -    echo "UI_TYPE =3D ${READER_UI}" >> makefiles/target.mk
> -    echo "TARGET_STATUS =3D ${READER_STATUS}" >> makefiles/target.mk
> -}
> -
> -do_install() {
> -    oe_runmake install DESTDIR=3D${D} RESOLUTION=3D${READER_RESOLUTION}
> -}
> -
> -SRC_URI[md5sum] =3D "da9ec4721efdb0ec0aaa182bff16ad82"
> -SRC_URI[sha256sum] =3D "328aec454db80e225aa0b5c31adef74bf62a14357482947e=
87e9731686b3c624"
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KG+zyBxh8BrwB1om
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTsb4ACgkQN1Ujt2V2gByD2QCguPJLSPcbHipBX2t7gBI3aU7Q
2LcAoISjI9NZT5hq5SjvzVciRxRvwfLx
=YBFb
-----END PGP SIGNATURE-----

--KG+zyBxh8BrwB1om--
