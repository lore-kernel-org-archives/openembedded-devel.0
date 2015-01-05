Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6533265CF4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 16:50:14 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so3687929wiv.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 08:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2ofXsp9tppDA5qTNqDibwkw8e3dgy7YL6z2kdpbPZBE=;
	b=tVZPUp3a+4qmjuhhwsoHIJp95pkKpxjRdh+XMdIxV5lhj4pOAxfLUkRFGkjAbsqTXC
	0OKe0/KI4UKCktd/dBuPiRV0NF2RbWAuaYrj3oiTzkq/4JY7AzVuFTzGkeIupRwH2/NA
	OPGefbkJJxiY+yAODQhegZd4YhxSM2XFDapbq6y8ro0asPTC2Mhr72Rmj+UROknEcTdi
	QgNbOLWwgBh16ZBR5j8gvw7t8HVuvgwjqIoYes9sgethAQxwHKV9fH99+boEXycQk6Zv
	ZaraB//IfqnrtlIaSBg85+y14vijyoa+Qrx3bD0582xa0sZmiluw55LnVYa0j49SiM9o
	183w==
X-Received: by 10.194.184.171 with SMTP id
	ev11mr178003731wjc.119.1420476613789; 
	Mon, 05 Jan 2015 08:50:13 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bj3sm10601574wib.3.2015.01.05.08.50.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 08:50:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Jan 2015 17:50:14 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150105165014.GM2484@jama>
References: <1420475028-17290-1-git-send-email-ben.shelton@ni.com>
MIME-Version: 1.0
In-Reply-To: <1420475028-17290-1-git-send-email-ben.shelton@ni.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] iperf3: Add recipe for version 3.0.10
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
X-List-Received-Date: Mon, 05 Jan 2015 16:50:19 -0000
X-Groupsio-MsgNum: 53664
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QGBKWVSgmlsIyJ+t"
Content-Disposition: inline

--QGBKWVSgmlsIyJ+t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2015 at 10:23:48AM -0600, Ben Shelton wrote:
> iperf3 is the new successor of iperf. The project is now mature enough
> as it started in 2009 and has stable releases. It supports reporting
> results in the portable JSON format, provides more information than
> iperf does and also adds some features from other tools such as nuttcp
> and netperf that were missing from the original iperf.
>=20
> This recipe is based on the iperf v3.0.8 recipe posted to the list by
> Guy Morand
>=20
> (http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/=
098403.html)
>=20
> with the following changes:
>=20
> - Per feedback on the mailing list, remove the AUTOINC git version of
>   the recipe, and merge the .bb and .inc files.

This "review" comments belong bellow --- line (so not included in final
commit message).

> - Pass the 'foreign' option to automake.
>=20
> - The Makefiles for the examples only work properly when the build is
>   done in the same directory as the source.  Fix this in Makefile.am and
>   run bootstrap.sh to regenerate Makefile.in.
>=20
> - Bump the version to the latest stable release.
>=20
> Upstream-Status: Pending [iperf-dev@googlegroups.com]

This belongs into individual .patch files (which should also have some
explanation and Signed-off-by lines.

> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>  .../iperf3/files/automake-foreign.patch            | 12 +++
>  .../iperf3/files/fix-examples.patch                | 98 ++++++++++++++++=
++++++

Please files -> iperf3 for slightly faster lookup.

>  meta-oe/recipes-benchmark/iperf3/iperf3_3.0.10.bb  | 26 ++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/files/automake-forei=
gn.patch
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/files/fix-examples.p=
atch
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3_3.0.10.bb
>=20
> diff --git a/meta-oe/recipes-benchmark/iperf3/files/automake-foreign.patc=
h b/meta-oe/recipes-benchmark/iperf3/files/automake-foreign.patch
> new file mode 100644
> index 0000000..07d8b49
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/iperf3/files/automake-foreign.patch
> @@ -0,0 +1,12 @@
> +diff -rupN iperf-3.0.10.old/configure.ac iperf-3.0.10/configure.ac
> +--- iperf-3.0.10.old/configure.ac	2014-12-16 13:39:58.000000000 -0600
> ++++ iperf-3.0.10/configure.ac	2014-12-29 15:09:27.534992643 -0600
> +@@ -32,7 +32,7 @@ AC_CONFIG_AUX_DIR(config)
> +=20
> +=20
> + # Initialize the automake system
> +-AM_INIT_AUTOMAKE
> ++AM_INIT_AUTOMAKE([foreign])
> +=20
> + AM_MAINTAINER_MODE
> + AM_CONFIG_HEADER(src/config.h)
> diff --git a/meta-oe/recipes-benchmark/iperf3/files/fix-examples.patch b/=
meta-oe/recipes-benchmark/iperf3/files/fix-examples.patch
> new file mode 100644
> index 0000000..db5a37e
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/iperf3/files/fix-examples.patch
> @@ -0,0 +1,98 @@
> +diff -rupN iperf-3.0.10.old/examples/Makefile.am iperf-3.0.10/examples/M=
akefile.am
> +--- iperf-3.0.10.old/examples/Makefile.am	2014-12-16 13:39:58.000000000 =
-0600
> ++++ iperf-3.0.10/examples/Makefile.am	2014-12-29 17:12:02.238979626 -0600
> +@@ -2,11 +2,13 @@ noinst_PROGRAMS		=3D mic mis		# Build, but
> +=20
> + mic_SOURCES		=3D mic.c
> + mic_CFLAGS		=3D -g
> +-mic_LDADD		=3D ../src/libiperf.la
> ++mic_LDADD		=3D $(top_builddir)/src/libiperf.la
> + mic_LDFLAGS		=3D -g
> ++mic_CPPFLAGS		=3D -I$(top_srcdir)/src
> +=20
> + mis_SOURCES		=3D mis.c
> + mis_CFLAGS		=3D -g
> +-mis_LDADD		=3D ../src/libiperf.la
> ++mis_LDADD		=3D $(top_builddir)/src/libiperf.la
> + mis_LDFLAGS		=3D -g
> ++mis_CPPFLAGS		=3D -I$(top_srcdir)/src
> +=20
> +diff -rupN iperf-3.0.10.old/examples/Makefile.in iperf-3.0.10/examples/M=
akefile.in
> +--- iperf-3.0.10.old/examples/Makefile.in	2014-12-16 13:39:58.000000000 =
-0600
> ++++ iperf-3.0.10/examples/Makefile.in	2014-12-29 17:12:07.518979616 -0600
> +@@ -94,7 +94,7 @@ CONFIG_CLEAN_VPATH_FILES =3D
> + PROGRAMS =3D $(noinst_PROGRAMS)
> + am_mic_OBJECTS =3D mic-mic.$(OBJEXT)
> + mic_OBJECTS =3D $(am_mic_OBJECTS)
> +-mic_DEPENDENCIES =3D ../src/libiperf.la
> ++mic_DEPENDENCIES =3D $(top_builddir)/src/libiperf.la
> + AM_V_lt =3D $(am__v_lt_@AM_V@)
> + am__v_lt_ =3D $(am__v_lt_@AM_DEFAULT_V@)
> + am__v_lt_0 =3D --silent
> +@@ -104,7 +104,7 @@ mic_LINK =3D $(LIBTOOL) $(AM_V_lt) --tag=3DC
> + 	$(mic_LDFLAGS) $(LDFLAGS) -o $@
> + am_mis_OBJECTS =3D mis-mis.$(OBJEXT)
> + mis_OBJECTS =3D $(am_mis_OBJECTS)
> +-mis_DEPENDENCIES =3D ../src/libiperf.la
> ++mis_DEPENDENCIES =3D $(top_builddir)/src/libiperf.la
> + mis_LINK =3D $(LIBTOOL) $(AM_V_lt) --tag=3DCC $(AM_LIBTOOLFLAGS) \
> + 	$(LIBTOOLFLAGS) --mode=3Dlink $(CCLD) $(mis_CFLAGS) $(CFLAGS) \
> + 	$(mis_LDFLAGS) $(LDFLAGS) -o $@
> +@@ -286,12 +286,14 @@ top_builddir =3D @top_builddir@
> + top_srcdir =3D @top_srcdir@
> + mic_SOURCES =3D mic.c
> + mic_CFLAGS =3D -g
> +-mic_LDADD =3D ../src/libiperf.la
> ++mic_LDADD =3D $(top_builddir)/src/libiperf.la
> + mic_LDFLAGS =3D -g
> ++mic_CPPFLAGS =3D -I$(top_srcdir)/src
> + mis_SOURCES =3D mis.c
> + mis_CFLAGS =3D -g
> +-mis_LDADD =3D ../src/libiperf.la
> ++mis_LDADD =3D $(top_builddir)/src/libiperf.la
> + mis_LDFLAGS =3D -g
> ++mis_CPPFLAGS =3D -I$(top_srcdir)/src
> + all: all-am
> +=20
> + .SUFFIXES:
> +@@ -375,32 +377,32 @@ distclean-compile:
> + @am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(LTCOMPILE) -c -o $@ $<
> +=20
> + mic-mic.o: mic.c
> +-@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCL=
UDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.o -MD =
-MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.o `test -f 'mic.c' || echo '$(s=
rcdir)/'`mic.c
> ++@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCL=
UDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.o -MD=
 -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.o `test -f 'mic.c' || echo '$(=
srcdir)/'`mic.c
> + @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) $(DEPDIR)/mic-mic.Tpo $(DEPDIR=
)/mic-mic.Po
> + @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source=3D'mic.c' object=3D'=
mic-mic.o' libtool=3Dno @AMDEPBACKSLASH@
> + @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=3D$(DEPDIR) $(CCDEPMODE) $(dep=
comp) @AMDEPBACKSLASH@
> +-@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCL=
UDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o =
mic-mic.o `test -f 'mic.c' || echo '$(srcdir)/'`mic.c
> ++@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCL=
UDES) $(INCLUDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o=
 mic-mic.o `test -f 'mic.c' || echo '$(srcdir)/'`mic.c
> +=20
> + mic-mic.obj: mic.c
> +-@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCL=
UDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.obj -M=
D -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.obj `if test -f 'mic.c'; then=
 $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W) '$(srcdir)/mic.c'; fi`
> ++@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCL=
UDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -MT mic-mic.obj -=
MD -MP -MF $(DEPDIR)/mic-mic.Tpo -c -o mic-mic.obj `if test -f 'mic.c'; the=
n $(CYGPATH_W) 'mic.c'; else $(CYGPATH_W) '$(srcdir)/mic.c'; fi`
> + @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) $(DEPDIR)/mic-mic.Tpo $(DEPDIR=
)/mic-mic.Po
> + @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source=3D'mic.c' object=3D'=
mic-mic.obj' libtool=3Dno @AMDEPBACKSLASH@
> + @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=3D$(DEPDIR) $(CCDEPMODE) $(dep=
comp) @AMDEPBACKSLASH@
> +-@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCL=
UDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o =
mic-mic.obj `if test -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else $(CYGPATH_=
W) '$(srcdir)/mic.c'; fi`
> ++@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCL=
UDES) $(INCLUDES) $(mic_CPPFLAGS) $(CPPFLAGS) $(mic_CFLAGS) $(CFLAGS) -c -o=
 mic-mic.obj `if test -f 'mic.c'; then $(CYGPATH_W) 'mic.c'; else $(CYGPATH=
_W) '$(srcdir)/mic.c'; fi`
> +=20
> + mis-mis.o: mis.c
> +-@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCL=
UDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.o -MD =
-MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.o `test -f 'mis.c' || echo '$(s=
rcdir)/'`mis.c
> ++@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCL=
UDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.o -MD=
 -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.o `test -f 'mis.c' || echo '$(=
srcdir)/'`mis.c
> + @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) $(DEPDIR)/mis-mis.Tpo $(DEPDIR=
)/mis-mis.Po
> + @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source=3D'mis.c' object=3D'=
mis-mis.o' libtool=3Dno @AMDEPBACKSLASH@
> + @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=3D$(DEPDIR) $(CCDEPMODE) $(dep=
comp) @AMDEPBACKSLASH@
> +-@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCL=
UDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o =
mis-mis.o `test -f 'mis.c' || echo '$(srcdir)/'`mis.c
> ++@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCL=
UDES) $(INCLUDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o=
 mis-mis.o `test -f 'mis.c' || echo '$(srcdir)/'`mis.c
> +=20
> + mis-mis.obj: mis.c
> +-@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCL=
UDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.obj -M=
D -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.obj `if test -f 'mis.c'; then=
 $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W) '$(srcdir)/mis.c'; fi`
> ++@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCL=
UDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -MT mis-mis.obj -=
MD -MP -MF $(DEPDIR)/mis-mis.Tpo -c -o mis-mis.obj `if test -f 'mis.c'; the=
n $(CYGPATH_W) 'mis.c'; else $(CYGPATH_W) '$(srcdir)/mis.c'; fi`
> + @am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) $(DEPDIR)/mis-mis.Tpo $(DEPDIR=
)/mis-mis.Po
> + @AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source=3D'mis.c' object=3D'=
mis-mis.obj' libtool=3Dno @AMDEPBACKSLASH@
> + @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=3D$(DEPDIR) $(CCDEPMODE) $(dep=
comp) @AMDEPBACKSLASH@
> +-@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCL=
UDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o =
mis-mis.obj `if test -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else $(CYGPATH_=
W) '$(srcdir)/mis.c'; fi`
> ++@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCL=
UDES) $(INCLUDES) $(mis_CPPFLAGS) $(CPPFLAGS) $(mis_CFLAGS) $(CFLAGS) -c -o=
 mis-mis.obj `if test -f 'mis.c'; then $(CYGPATH_W) 'mis.c'; else $(CYGPATH=
_W) '$(srcdir)/mis.c'; fi`
> +=20
> + mostlyclean-libtool:
> + 	-rm -f *.lo
> diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.10.bb b/meta-oe/=
recipes-benchmark/iperf3/iperf3_3.0.10.bb
> new file mode 100644
> index 0000000..c37f464
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.10.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "Network benchmark tool"
> +DESCRIPTION =3D "\
> +iperf is a tool for active measurements of the maximum achievable bandwi=
dth \
> +on IP networks. It supports tuning of various parameters related to timi=
ng, \
> +protocols, and buffers. For each test it reports the bandwidth, loss, an=
d \
> +other parameters."
> +HOMEPAGE =3D "http://software.es.net/iperf/"
> +SECTION =3D "console/network"
> +BUGTRACKER =3D "https://github.com/esnet/iperf/issues"
> +AUTHOR =3D "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <=
websupport@lbl.gov>"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dab59a0c3a4bc3954d1ece68ea19d7=
7a4"
> +
> +BRANCH =3D "master"
This variable doesn't seem to be used anywhere.

> +SRC_URI =3D "\
> +           git://github.com/esnet/iperf.git;branch=3D3.0-STABLE \
> +           file://automake-foreign.patch \
> +           file://fix-examples.patch \
> +           "

Please use 4 spaces for indentation and closing quote as first character
on separate line.

> +
> +SRCREV =3D "de420cc741dd8967ebc57f80b7712556442de81b"

Does this SRCREV point to 3.0.10 tag? I would still prefer the recipe to
be named iperf3_git.bb and set
PV =3D "3.0.10+gitr${SRCPV}"
inside to prevent people accidentally bumping SRCREV without updating PV
to reflect that.

> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> +
> --=20
> 2.2.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QGBKWVSgmlsIyJ+t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSqwMYACgkQN1Ujt2V2gBx8ugCeMXVblp0mISHXpdqXRbc9KaKj
y0kAoIDe3sNaNocmnTbx8iwssStt123M
=bsB3
-----END PGP SIGNATURE-----

--QGBKWVSgmlsIyJ+t--
