Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0B08D65F34
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 May 2014 16:28:57 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id ec20so4275318lab.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 09:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=A2DofBhJAsDPf+oIhcVkT5SOG5x9xNe22mYR5qf/vZ8=;
	b=wiFlpSawy4vnPv8lTPkOC7AYkWNJPis+Nc6iczj7va5l2Qoz+DtieW1744JKTlUoFb
	5ahAWx2toIvMC8FTmEhXDR1gHH71iC+MhVwtxucIvcphqZ04Ws6T3rzfw3OQ29gDRMCB
	0JbHD95Jt5J0tSEN5P7uvL4XbmUFKAIk8y00gic6TB8T5SbfgofcGcX+tjJVBcoqBZyM
	n+ofTnglTMV5PVM0Xe0e5EmSdyDDdSF6AIbUkmBpDxQO6N29D/y895Sr9skJhhS5WKIf
	WZZTCnFzjA9YyLftjKNBjOgGvZC+sADw6YvXnuwnXTFTUWk7j6/8bCU7pU9IFxkr/Tv2
	g4AQ==
X-Received: by 10.112.154.102 with SMTP id vn6mr2003736lbb.55.1399307337602;
	Mon, 05 May 2014 09:28:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r5sm10096167lbb.7.2014.05.05.09.28.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 09:28:56 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 May 2014 18:29:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140505162916.GL2486@jama>
References: <1399305083-21507-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
In-Reply-To: <1399305083-21507-1-git-send-email-Matthieu.Crapet@ingenico.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] tk: cleanup
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
X-List-Received-Date: Mon, 05 May 2014 16:29:02 -0000
X-Groupsio-MsgNum: 49697
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6RX2ilOjXGLymYnx"
Content-Disposition: inline

--6RX2ilOjXGLymYnx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 05, 2014 at 05:51:23PM +0200, Matthieu Crapet wrote:
> Changes:
> - use ${BPN} and ${PV}
> - use ${VER} intermediate variable for readability
> - fulfill LIC_FILES_CHKSUM
> - remove BINCONFIG_GLOB: inherit binconfig is not present, lib/tkConfig.s=
h paths are valid
> - add SSTATE_SCAN_FILES, like it is done in tcl recipe (OE-Core)

Does it also fix the tk issues which were shown in all world build reports?

> Note: tcl and tk are sharing the same licence, it will be added to OE-Cor=
e soon.
> It will drop QA warning.
>=20
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb | 40 ++++++++++++++++++++++--=
------
>  1 file changed, 29 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb b/meta-oe/recipes=
-devtools/tcltk/tk_8.6.0.bb
> index d12973c..58862e7 100644
> --- a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
> +++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
> @@ -1,12 +1,24 @@
>  SUMMARY =3D "Tool Command Language ToolKit Extension"
>  HOMEPAGE =3D "http://tcl.sourceforge.net"
>  SECTION =3D "devel/tcltk"
> +
> +# http://www.tcl.tk/software/tcltk/license.html
>  LICENSE =3D "tcl"
> -LIC_FILES_CHKSUM =3D "file://license.terms;md5=3Dc88f99decec11afa967ad33=
d314f87fe"
> +LIC_FILES_CHKSUM =3D "file://../license.terms;md5=3Dc88f99decec11afa967a=
d33d314f87fe \
> +    file://../compat/license.terms;md5=3Dc88f99decec11afa967ad33d314f87f=
e \
> +    file://../doc/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
> +    file://../library/license.terms;md5=3Dc88f99decec11afa967ad33d314f87=
fe \
> +    file://../macosx/license.terms;md5=3Dc88f99decec11afa967ad33d314f87f=
e \
> +    file://../tests/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe=
 \
> +    file://../unix/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
> +    file://../win/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
> +    file://../xlib/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
> +"
> +
>  DEPENDS =3D "tcl virtual/libx11 libxt"
> =20
>  SRC_URI =3D "\
> -    ${SOURCEFORGE_MIRROR}/tcl/tk${PV}-src.tar.gz \
> +    ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
>      file://confsearch.diff;striplevel=3D2 \
>      file://non-linux.diff;striplevel=3D2 \
>      file://tklibrary.diff;striplevel=3D2 \
> @@ -16,8 +28,12 @@ SRC_URI =3D "\
>  SRC_URI[md5sum] =3D "b883a1a3c489c17413fb602a94bf54e8"
>  SRC_URI[sha256sum] =3D "5c708b2b6f658916df59190b27750fa1ea2bc10992108e10=
f961c0700f058de6"
> =20
> -S =3D "${WORKDIR}/tk${PV}/unix"
> -LDFLAGS +=3D "-Wl,-rpath,${libdir}/tcltk/8.6.0/lib"
> +S =3D "${WORKDIR}/${BPN}${PV}/unix"
> +
> +# Short version format: "8.6"
> +VER =3D "${@os.path.splitext(d.getVar('PV', True))[0]}"
> +
> +LDFLAGS +=3D "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
>  inherit autotools
> =20
>  EXTRA_OECONF =3D "\
> @@ -28,14 +44,14 @@ EXTRA_OECONF =3D "\
>  "
> =20
>  do_install_append() {
> -    ln -sf libtk8.6.so ${D}${libdir}/libtk8.6.so.0
> -    oe_libinstall -so libtk8.6 ${D}${libdir}
> -    ln -sf wish8.6 ${D}${bindir}/wish
> -=09
> +    ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
> +    oe_libinstall -so libtk${VER} ${D}${libdir}
> +    ln -sf wish${VER} ${D}${bindir}/wish
> +
>      # Even after passing libdir=3D${libdir} at config, some incorrect di=
rs are still generated for the multilib build
>      if [ "$libdir" !=3D "/usr/lib" ]; then
>          # Move files to correct library directory
> -        mv ${D}/usr/lib/tk8.6/* ${D}/${libdir}/tk8.6/
> +        mv ${D}/usr/lib/tk${VER}/* ${D}/${libdir}/tk${VER}/
>          # Remove unneeded/incorrect dir ('usr/lib/')
>          rm -rf ${D}/usr/lib
>      fi
> @@ -43,12 +59,14 @@ do_install_append() {
> =20
>  PACKAGES =3D+ "${PN}-lib"
> =20
> -FILES_${PN}-lib =3D "${libdir}/libtk8.6.so*"
> +FILES_${PN}-lib =3D "${libdir}/libtk${VER}.so*"
>  FILES_${PN} +=3D "${libdir}/tk*"
> =20
>  # isn't getting picked up by shlibs code
>  RDEPENDS_${PN} +=3D "tk-lib"
>  RDEPENDS_${PN}_class-native =3D ""
> =20
> -BINCONFIG_GLOB =3D "*Config.sh"
>  BBCLASSEXTEND =3D "native"
> +
> +# Fix the path in sstate
> +SSTATE_SCAN_FILES +=3D "*Config.sh"
> --=20
> 1.8.5.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6RX2ilOjXGLymYnx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNnvFwACgkQN1Ujt2V2gBwZxQCfdyx1yKcLOLcVJmUo7DYOxFvq
o0gAoKT9J/rY1jzOmiJ+hsjnYUoc2mTe
=elIh
-----END PGP SIGNATURE-----

--6RX2ilOjXGLymYnx--
