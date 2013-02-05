Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2fu3-000061-Rc
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 11:37:34 +0100
Received: by mail-wi0-f182.google.com with SMTP id hi18so2725851wib.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 02:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+jIZsyB7Nool1BlC5Hd3xQwUBOO4v+lZVn6yzWlDvZY=;
	b=0jIyAS/OPirFs+ZnBS6to13sIVyUCbLtHPTzyUNTJlXIT61THHxiJrunmTtfZcI2s2
	0QBGRPT6q4FtVeoHIb5DVUE5ry2ogGcwJl9kaxf0r1/xpFQ8+h1EI3EDxNQ51x6MWGz4
	Uv2Gu7NopEw0g2IinPe6qZMWuUyLo0MXD7KqzJ8/wgq7kDcJEJixHzf2h2B2wxkoIzwy
	C2ySyAiXvwKa7mcfBnij9jozwfaDjsv342WhCp969O/rqZ/Aej3eekzOdZcDT3eoU3k2
	X+2BPtU5ZVKUo628fFbDc8kczVa6HP8muG3Js88n7Ek5xlqaagoi8Oc+TACRutc6RdXR
	mVug==
X-Received: by 10.194.24.42 with SMTP id r10mr41272508wjf.2.1360059698701;
	Tue, 05 Feb 2013 02:21:38 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q13sm4214574wie.0.2013.02.05.02.21.37
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 02:21:38 -0800 (PST)
Date: Tue, 5 Feb 2013 11:21:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130205102138.GL3271@jama>
References: <cover.1359639067.git.ross.burton@intel.com>
	<8368232e3997a3553addd705aacd0d1c56177682.1359639067.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <8368232e3997a3553addd705aacd0d1c56177682.1359639067.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia][PATCH 1/1] libmusicbrainz: add
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
X-List-Received-Date: Tue, 05 Feb 2013 10:37:34 -0000
X-Groupsio-MsgNum: 42998
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AptwxgnoZDC4KQWS"
Content-Disposition: inline

--AptwxgnoZDC4KQWS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2013 at 01:34:14PM +0000, Ross Burton wrote:
> Moved from oe-core.

Merged, thanks

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../musicbrainz/files/allow-libdir-override.patch  |   21 +++++++++++
>  .../musicbrainz/libmusicbrainz_git.bb              |   38 ++++++++++++++=
++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/files/=
allow-libdir-override.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/libmus=
icbrainz_git.bb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-l=
ibdir-override.patch b/meta-multimedia/recipes-multimedia/musicbrainz/files=
/allow-libdir-override.patch
> new file mode 100644
> index 0000000..d59d12e
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-o=
verride.patch
> @@ -0,0 +1,21 @@
> +Allow LIB_INSTALL_DIR to be set by the the cmake configure invocation.  =
We dont
> +easily have a way of determining something that patches ${LIB_SUFFIX} so=
 we'll
> +set LIB_INSTALL_DIR.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> +
> +Index: libmusicbrainz-3.0.3/CMakeLists.txt
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libmusicbrainz-3.0.3.orig/CMakeLists.txt
> ++++ libmusicbrainz-3.0.3/CMakeLists.txt
> +@@ -26,7 +26,7 @@ FIND_PACKAGE(DiscId)
> + SET(LIB_SUFFIX "" CACHE STRING "Define suffix of directory name (32/64)=
")
> + SET(EXEC_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} CACHE PATH "Installatio=
n prefix for executables and object code libraries" FORCE)
> + SET(BIN_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/bin CACHE PATH "Installation=
 prefix for user executables" FORCE)
> +-SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH =
 "Installation prefix for object code libraries" FORCE)
> ++SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH =
 "Installation prefix for object code libraries")
> + SET(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include CACHE PATH "Ins=
tallation prefix for C header files" FORCE)
> +=20
> + CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libmusicbrainz3.pc.cmake ${C=
MAKE_CURRENT_BINARY_DIR}/libmusicbrainz3.pc)
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrain=
z_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_gi=
t.bb
> new file mode 100644
> index 0000000..051db7b
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> @@ -0,0 +1,38 @@
> +SUMMARY =3D "MusicBrainz client library"
> +DESCRIPTION =3D "The MusicBrainz client is a library which can be built =
into other programs.  The library allows you to access the data held on the=
 MusicBrainz server."
> +HOMEPAGE =3D "http://musicbrainz.org"
> +LICENSE =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dfbc093901857fcd118f065f90=
0982c24"
> +DEPENDS =3D "expat neon"
> +
> +PV =3D "5.0.1+git${SRCPV}"
> +PR =3D "r0"
> +
> +SRCREV =3D "0749dd0a35b4a54316da064475863a4ac6e28e7e"
> +SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz.git \
> +           file://allow-libdir-override.patch "
> +
> +S =3D "${WORKDIR}/git"
> +
> +LDFLAGS_prepend_libc-uclibc =3D " -lpthread "
> +
> +
> +inherit cmake pkgconfig
> +
> +do_configure_prepend() {
> +    # The native build really doesn't like being rebuilt, so delete
> +    # it if it's already present.
> +    rm -rf build-native
> +    mkdir build-native
> +    cd build-native
> +    cmake -DCMAKE_C_FLAGS=3D${BUILD_CFLAGS} \
> +          -DCMAKE_C_COMPILER=3D${BUILD_CC} \
> +          -DCMAKE_CXX_FLAGS=3D${BUILD_CXXFLAGS} \
> +          -DCMAKE_CXX_COMPILER=3D${BUILD_CXX} \
> +          ..
> +    make make-c-interface
> +    cd ..
> +}
> +
> +EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR:PATH=3D${libdir} \
> +                 -DIMPORT_EXECUTABLES=3Dbuild-native/ImportExecutables.c=
make"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AptwxgnoZDC4KQWS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEQ3TIACgkQN1Ujt2V2gBw10gCfWAS9OdKsOryi8jjFour+w4mm
zyQAnRqylL4v15QI8ReSNRE/dL184hSy
=iyWs
-----END PGP SIGNATURE-----

--AptwxgnoZDC4KQWS--
