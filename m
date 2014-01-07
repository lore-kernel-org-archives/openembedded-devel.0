Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 586306BF4E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 12:37:08 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id d10so176040eaj.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jan 2014 04:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D0hI22QnII6ANKJeVdWSs6jjo64bXDxrPuN9K7J9XA4=;
	b=G1GGKCBLJk86ZFhhSFySXiH110Owfh+WbwXrlNTTZ5r/1uTPQt3w29BJSOcb8cy66W
	qK3e2Zbg7iX9IoBe5VgcEY5n0hfqprQ7wGN2TDAN2wH+yh6rgY/tiBgMmMI2pQUq1yDB
	SJdvjJXtjvyOw1g4NulFDyr2FRuU77+mp9AVjNxOwDuP1kwr7lkOk5i0GiU13PmKPNNM
	1cgmRNdmwvI33yv9+NVHAR1g+gfMKaJluWrTNssGXOGI32KCuL6VVK4ZXRlJFbz0Q7gg
	/fq8z4D3raoYv/6ojnBQjt1o+MOhCVozPVWPPFxgWTV73RDGhRZbhTV5GYRCp9Fn/1KH
	EE/w==
X-Received: by 10.14.3.130 with SMTP id 2mr39799355eeh.36.1389098228593;
	Tue, 07 Jan 2014 04:37:08 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 1sm179577737eeg.4.2014.01.07.04.37.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jan 2014 04:37:07 -0800 (PST)
Date: Tue, 7 Jan 2014 13:37:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140107123716.GO3709@jama>
References: <AAE0766F5AF36B46BAB7E0EFB9273206331489E795@GBTWK10E001.Technology.local>
MIME-Version: 1.0
In-Reply-To: <AAE0766F5AF36B46BAB7E0EFB9273206331489E795@GBTWK10E001.Technology.local>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: Patch to fix libxml++ build failure in meta-oe
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
X-List-Received-Date: Tue, 07 Jan 2014 12:37:09 -0000
X-Groupsio-MsgNum: 47625
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AwNVUpjOmSj7UnwZ"
Content-Disposition: inline

--AwNVUpjOmSj7UnwZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2014 at 10:29:28AM +0000, Lewis, Nick wrote:
> From c77c6adf075f314209f7cd071fb5b99c0d8d0e70 Mon Sep 17 00:00:00 2001
> From: Nick Lewis <nick.lewis@usa.g4s.com>
> Date: Mon, 6 Jan 2014 17:16:03 +0000
> Subject: [PATCH] Use libxml++ version 2.37.1 and add ptest support
>=20

SOB line is missing, but I've already added it manually from you first
version of this patch.

http://patchwork.openembedded.org/patch/64207/

seems to work, version with attachement wasn't picked by patchwork

> ---
>  .../libxml/libxml++-2.37.1/libxml++_ptest.patch    |   73 ++++++++++++++=
++++++
>  .../recipes-core/libxml/libxml++-2.37.1/run-ptest  |    3 +
>  meta-oe/recipes-core/libxml/libxml++_2.35.3.bb     |   22 ------
>  meta-oe/recipes-core/libxml/libxml++_2.37.1.bb     |   34 +++++++++
>  4 files changed, 110 insertions(+), 22 deletions(-)  create mode 100644 =
meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.patch
>  create mode 100644 meta-oe/recipes-core/libxml/libxml++-2.37.1/run-ptest
>  delete mode 100644 meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
>  create mode 100644 meta-oe/recipes-core/libxml/libxml++_2.37.1.bb
>=20
> diff --git a/meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.p=
atch b/meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.patch
> new file mode 100644
> index 0000000..a18822f
> --- /dev/null
> +++ b/meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.patch
> @@ -0,0 +1,73 @@
> +diff --git a/Makefile.am b/Makefile.am
> +index d4aadb1..0e36756 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -253,5 +253,8 @@ post-html: docs/index.html
> +       rsync $(rsync_args) -r docs/index.html $$USER,libxmlplusplus@web.=
sourceforge.net:$(web_path_project)
> +       rsync $(rsync_args) -r examples
> +$$USER,libxmlplusplus@web.sourceforge.net:$(web_path_project)
> +
> ++install-ptest:
> ++      make -C examples install-ptest
> ++
> + # Optional: auto-generate the ChangeLog file from the git log on make
> +dist  include $(top_srcdir)/macros/dist-changelog.am
> +diff --git a/examples/Makefile.am b/examples/Makefile.am index
> +d9541ca..c28b49c 100644
> +--- a/examples/Makefile.am
> ++++ b/examples/Makefile.am
> +@@ -36,6 +36,23 @@ check_PROGRAMS =3D \
> +   schemavalidation/schemavalidation \
> +   textreader/textreader
> +
> ++check_DOTLIBS =3D \
> ++  dom_build/.libs/dom_build \
> ++  dom_parse_entities/.libs/dom_parse_entities \
> ++  dom_parser/.libs/dom_parser \
> ++  dom_parser_raw/.libs/dom_parser_raw \
> ++  dom_read_write/.libs/dom_read_write \
> ++  dom_xinclude/.libs/dom_xinclude \
> ++  dom_xpath/.libs/dom_xpath \
> ++  dtdvalidation/.libs/dtdvalidation \
> ++  import_node/.libs/import_node \
> ++  sax_exception/.libs/sax_exception \
> ++  sax_parser/.libs/sax_parser \
> ++  sax_parser_build_dom/.libs/sax_parser_build_dom \
> ++  sax_parser_entities/.libs/sax_parser_entities \
> ++  schemavalidation/.libs/schemavalidation \
> ++  textreader/.libs/textreader
> ++
> + # Shell scripts that call the example programs.
> + check_SCRIPTS =3D \
> +   dom_build/make_check.sh \
> +@@ -147,10 +164,10 @@ dist_noinst_DATA =3D \  # file are located in
> +different directories.
> + dom_read_write/make_check.sh: Makefile
> +       echo '# Generated and used by "make check"' >$@
> +-      echo 'dom_read_write/dom_read_write "$(srcdir)/dom_read_write/exa=
mple.xml" dom_read_write/example_output.xml >/dev/null' >>$@
> ++      echo 'dom_read_write/.libs/dom_read_write
> ++"$(srcdir)/dom_read_write/example.xml"
> ++dom_read_write/example_output.xml >/dev/null' >>$@
> +       chmod +x $@
> +
> +-script_template =3D cd "$(srcdir)/<!progname!>" &&
> +"$(abs_builddir)/<!progname!>/<!progname!>" >/dev/null
> ++script_template =3D cd "$(srcdir)/<!progname!>" && ".libs/<!progname!>"
> ++>/dev/null
> + standard_scripts =3D $(filter-out
> + dom_read_write/make_check.sh,$(check_SCRIPTS))
> +
> + # All other script files are generated like so:
> +@@ -162,3 +179,18 @@ $(standard_scripts): Makefile  CLEANFILES =3D \
> +   dom_read_write/example_output.xml \
> +   $(check_SCRIPTS)
> ++
> ++buildtest: all
> ++      $(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS) $(check_SCRIPTS)
> ++      $(MAKE) $(AM_MAKEFLAGS) buildtest-TESTS
> ++
> ++install-ptest:
> ++      $(MKDIR_P) $(DESTDIR)/examples
> ++      cp --parents $(check_DOTLIBS) $(DESTDIR)/examples
> ++      cp --parents $(check_SCRIPTS) $(DESTDIR)/examples
> ++      cp --parents $(dist_noinst_DATA) $(DESTDIR)/examples
> ++      cp Makefile $(DESTDIR)/examples
> ++      $(MKDIR_P) $(DESTDIR)/macros
> ++      cp ../macros/test-driver $(DESTDIR)/macros
> ++      sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/examples/Makefile

These last 4 lines are missing in the patch you have sent as
attachement, which version is the right one?

> ++
> diff --git a/meta-oe/recipes-core/libxml/libxml++-2.37.1/run-ptest b/meta=
-oe/recipes-core/libxml/libxml++-2.37.1/run-ptest
> new file mode 100644
> index 0000000..236f667
> --- /dev/null
> +++ b/meta-oe/recipes-core/libxml/libxml++-2.37.1/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +cd examples
> +make -k check-TESTS
> diff --git a/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb b/meta-oe/rec=
ipes-core/libxml/libxml++_2.35.3.bb
> deleted file mode 100644
> index fb9cdd9..0000000
> --- a/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -SUMMARY =3D "C++ wrapper for libxml library"
> -DESCRIPTION =3D "C++ wrapper for libxml library"
> -HOMEPAGE =3D "http://libxmlplusplus.sourceforge.net"
> -BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml%2=
B%2B"
> -SECTION =3D "libs"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903=
e34 "
> -
> -PR =3D "r1"
> -
> -SHRT_VER =3D "${@d.getVar('PV',True).split('.')[0]}.${@d.getVar('PV',Tru=
e).split('.')[1]}"
> -SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz"
> -
> -SRC_URI[md5sum] =3D "196a2dcdc84ab987fe3852b3f29cafd7"
> -SRC_URI[sha256sum] =3D "715a4214bbff90365cc8406a28e427febd90461006d608fb=
dcdcea7fc9891eaf"
> -
> -DEPENDS =3D "libxml2 glibmm"
> -
> -inherit autotools pkgconfig
> -
> -FILES_${PN}-doc +=3D "${datadir}/devhelp"
> -FILES_${PN}-dev +=3D "${libdir}/libxml++-2.6/include/libxml++config.h"
> diff --git a/meta-oe/recipes-core/libxml/libxml++_2.37.1.bb b/meta-oe/rec=
ipes-core/libxml/libxml++_2.37.1.bb
> new file mode 100644
> index 0000000..604877d
> --- /dev/null
> +++ b/meta-oe/recipes-core/libxml/libxml++_2.37.1.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "C++ wrapper for libxml library"
> +DESCRIPTION =3D "C++ wrapper for libxml library"
> +HOMEPAGE =3D "http://libxmlplusplus.sourceforge.net"
> +BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml%2=
B%2B"
> +SECTION =3D "libs"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903=
e34 "
> +
> +PR =3D "r0"
> +
> +SHRT_VER =3D "${@d.getVar('PV',True).split('.')[0]}.${@d.getVar('PV',Tru=
e).split('.')[1]}"
> +SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz"
> +
> +SRC_URI[md5sum] =3D "2f9372a6eba6e40206c11f558a8fbc32"
> +SRC_URI[sha256sum] =3D "f3b183600532a92af355719210223f858857092b8b1531c7=
907155c59a6db39f"
> +
> +DEPENDS =3D "libxml2 glibmm"
> +
> +inherit autotools pkgconfig
> +
> +FILES_${PN}-doc +=3D "${datadir}/devhelp"
> +FILES_${PN}-dev +=3D "${libdir}/libxml++-2.6/include/libxml++config.h"
> +
> +SRC_URI +=3D "file://libxml++_ptest.patch \
> +            file://run-ptest"
> +
> +inherit ptest
> +
> +RDEPENDS_${PN}-ptest +=3D "make"
> +
> +do_compile_ptest() {
> +  oe_runmake -C examples buildtest
> +}
> +
> --
> 1.7.9.5
>=20
>=20
> The details of this company are as follows:
> G4S Technology Limited, Registered Office: Challenge House, International=
 Drive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 238=
2338.
>=20
> This communication may contain information which is confidential, persona=
l and/or privileged.
>=20
> It is for the exclusive use of the intended recipient(s).
> If you are not the intended recipient(s), please note that any distributi=
on, forwarding, copying or use of this communication or the information in =
it is strictly prohibited.
>=20
> Any personal views expressed in this e-mail are those of the individual s=
ender and the company does not endorse or accept responsibility for them.
>=20
> Prior to taking any action based upon this e-mail message, you should see=
k appropriate confirmation of its authenticity.
>=20
> This e-mail has been scanned for all viruses by MessageLabs.
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AwNVUpjOmSj7UnwZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLL9PwACgkQN1Ujt2V2gBwcuwCeKxM373WQaauynILjXycqkd1C
R7gAn1i6nnUS8I4lCeUjsgQY2O9ZXzXi
=hyi8
-----END PGP SIGNATURE-----

--AwNVUpjOmSj7UnwZ--
