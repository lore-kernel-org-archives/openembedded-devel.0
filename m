Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8AA606BF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jul 2016 12:01:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o80so12651275wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jul 2016 05:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bpNpURjb9xHQMwFBTUVP17+ZqU277SAKkpIEZzhf/F4=;
	b=ZSNpWQtcxcx8XczGVhdM3whTzWO91irmzQdstbnw9QTiUVY/W4rFs+x3VP+GEWy2us
	zphqkafLAeJmp/BC9UDMWOuzLFzw/WwCm/QFyNLHJeOS56hsHQ3zAgQf1zsIZCraYMQ2
	xRmmUbcLW5k08nFg7/vZhmkwEv3CmUupqIOIIJA/NOzRbqI7V65DmhSHrf1wkzPKWPfb
	N4YQ9c7DyEXE4PSjh17qNddhIreq2HqR3NNtFETlebvsWij4IHQf8HA1ZUUobyQ8/+Zv
	gcz7gyLURJ8VZFZdi0eKmSJtuBMotm7UNKHw+Su1XDOxT2Enhe4tmQKUuhPxPoZExui/
	hXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bpNpURjb9xHQMwFBTUVP17+ZqU277SAKkpIEZzhf/F4=;
	b=GlwwBethRylvwCC7yfPC113HKTqKJamDUM+HznUzlKoa7gHJG8Xn0Oa35yXk1csRSA
	3F6T92ibs1H5dKJSfCc0asF8vE/MQZa4RhA/DuAOIbZmdsqDUsDxQC0uDXv89KrZGhrD
	vPlMvtBtIdmXQH/07YdVlmp9hoLIvoOwGJqFS+1rLqtLSMitmNCa+I8QUuh8KNwi0/Pl
	pihpCutuvcetvOKXbERJSkTcMONNPnJGlw+r62hYJQUWECct8uD6MULPjstsFaJ7rvrF
	bNYCw+AlICmawJt3farDvwLrzAOQzvD5kcUApa4P9Ac5cg7MZvyeC8Dl2QDCXSpg1NSX
	RTcQ==
X-Gm-Message-State: AEkoouvzcROkGe8FORZduznvucqaCQKc063WwMR9SNpO9KR9O12UteGd6Wbb5N5XpmEm4Q==
X-Received: by 10.28.86.65 with SMTP id k62mr6646521wmb.53.1469361666069;
	Sun, 24 Jul 2016 05:01:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	i7sm10375633wjg.42.2016.07.24.05.01.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 24 Jul 2016 05:01:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 24 Jul 2016 14:01:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160724120116.mdahisqaltbr53ya@jama>
References: <1466195689-14012-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1466195689-14012-1-git-send-email-kergoth@gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-multimedia][PATCH] libebml: don't rely on make -e, obey LDFLAGS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Jul 2016 12:01:06 -0000
X-Groupsio-MsgNum: 62323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lwnynvkp5jmgd4rk"
Content-Disposition: inline

--lwnynvkp5jmgd4rk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 01:34:49PM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> We need to obey LDFLAGS to get the correct hash style for external toolch=
ains,
> and passing vars explicitly is better than relying on implicitly overridi=
ng
> everything blindly from the environment.
>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  .../recipes-mkv/libebml/libebml/ldflags.patch      | 57 ++++++++++++++++=
++++++
>  .../libebml/libebml/override-uname.patch           | 42 ++++++++++++++++
>  .../recipes-mkv/libebml/libebml_1.3.0.bb           | 44 +++++++++++++++--
>  3 files changed, 138 insertions(+), 5 deletions(-)
>  create mode 100644 meta-multimedia/recipes-mkv/libebml/libebml/ldflags.p=
atch
>  create mode 100644 meta-multimedia/recipes-mkv/libebml/libebml/override-=
uname.patch
>=20
> diff --git a/meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch b/=
meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
> new file mode 100644
> index 0000000..a01c754
> --- /dev/null
> +++ b/meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
> @@ -0,0 +1,57 @@
> +Use LD and obey LDFLAGS
> +
> +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> +Upstream-Status: Pending
> +
> +diff --git a/make/linux/Makefile b/make/linux/Makefile
> +index 391b6e3..a2ac13e 100644
> +--- a/make/linux/Makefile
> ++++ b/make/linux/Makefile
> +@@ -64,6 +64,7 @@ objects_so:=3D$(patsubst %$(EXTENSION),%.lo,$(sources))
> + WARNINGFLAGS=3D-Wall -Wextra -Wno-unknown-pragmas -ansi -fno-gnu-keywor=
ds -Wshadow
> + COMPILEFLAGS=3D$(WARNINGFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(DEBUGFLAGS) $(=
INCLUDE)
> + DEPENDFLAGS  =3D $(CXXFLAGS) $(INCLUDE)
> ++LINKFLAGS=3D$(LDFLAGS)
> +
> + ifeq (Darwin,$(shell uname -s))
> + all: staticlib
> +@@ -91,7 +92,7 @@ $(LIBRARY): $(objects)
> +	$(RANLIB) $@
> +
> + $(LIBRARY_SO): $(objects_so)
> +-	$(CXX) -shared -Wl,-soname,$(LIBRARY_SO_VER) -o $(LIBRARY_SO_VER) $(ob=
jects_so)
> ++	$(LD) $(LINKFLAGS) -shared -Wl,-soname,$(LIBRARY_SO_VER) -o $(LIBRARY_=
SO_VER) $(objects_so)
> +	rm -f $(LIBRARY_SO)
> +	ln -s $(LIBRARY_SO_VER) $(LIBRARY_SO)
> +
> +diff --git a/make/mingw32/Makefile b/make/mingw32/Makefile
> +index e5986ef..6ca16aa 100644
> +--- a/make/mingw32/Makefile
> ++++ b/make/mingw32/Makefile
> +@@ -18,6 +18,7 @@ DEBUGFLAGS=3D-g -DDEBUG
> + endif
> + CROSS   =3D
> + CXX     =3D $(CROSS)g++
> ++LD      =3D $(CXX)
> + CC      =3D $(CROSS)gcc
> + WINDRES =3D $(CROSS)windres
> + RANLIB  =3D $(CROSS)ranlib
> +@@ -33,6 +34,7 @@ LIBS =3D libebml.a
> + endif
> + INCS =3D -I"$(shell pwd)/../.."
> + COMPILEFLAGS =3D $(DEBUGFLAGS) $(INCS) $(DLLFLAGS) $(CXXFLAGS)
> ++LINKFLAGS =3D $(LDFLAGS)
> +
> + .PHONY: all all-before all-after clean clean-custom
> +
> +@@ -54,7 +56,7 @@ libebml.a: $(OBJ)
> +	$(RANLIB) $@
> +
> + libebml.dll: $(OBJ)
> +-	$(CXX) -shared -Wl,--export-all -Wl,--out-implib=3D$@.a -o $@ $(OBJ)
> ++	$(LD) $(LINKFLAGS) -shared -Wl,--export-all -Wl,--out-implib=3D$@.a -o=
 $@ $(OBJ)
> +
> + depend:
> +	@echo Calculating dependecies:
> +--
> +2.8.0
> diff --git a/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.p=
atch b/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
> new file mode 100644
> index 0000000..57eb345
> --- /dev/null
> +++ b/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
> @@ -0,0 +1,42 @@
> +Allow override of the 'uname -s' for cross-compilation
> +
> +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> +Upstream-Status: Pending
> +
> +diff --git a/make/linux/Makefile b/make/linux/Makefile
> +index a2ac13e..4188bee 100644
> +--- a/make/linux/Makefile
> ++++ b/make/linux/Makefile
> +@@ -9,9 +9,11 @@
> + # 'make DEBUG=3Dyes'.
> + #
> +
> ++TARGET_OS ?=3D $(shell uname -s)
> ++
> + # Paths
> + # BeOS wants the libs and headers in /boot/home/config
> +-ifeq (BeOS,$(shell uname -s))
> ++ifeq (BeOS,$(TARGET_OS))
> + prefix=3D/boot/home/config
> + else
> + prefix=3D/usr/local
> +@@ -66,7 +68,7 @@ COMPILEFLAGS=3D$(WARNINGFLAGS) $(CXXFLAGS) $(CPPFLAGS)=
 $(DEBUGFLAGS) $(INCLUDE)
> + DEPENDFLAGS  =3D $(CXXFLAGS) $(INCLUDE)
> + LINKFLAGS=3D$(LDFLAGS)
> +
> +-ifeq (Darwin,$(shell uname -s))
> ++ifeq (Darwin,$(TARGET_OS))
> + all: staticlib
> + else
> + all: staticlib sharedlib
> +@@ -116,7 +118,7 @@ depend:
> +		$(CXX) $(DEPENDFLAGS) -MM -MT $$o $$i >> .depend ; \
> +	done
> +
> +-ifeq (Darwin,$(shell uname -s))
> ++ifeq (Darwin,$(TARGET_OS))
> + install: install_staticlib install_headers
> + else
> + install: install_staticlib install_sharedlib install_headers
> +--
> +2.8.0
> diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb b/meta-=
multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> index 71e2bfc..b756a39 100644
> --- a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> +++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> @@ -2,15 +2,49 @@ SUMMARY =3D "libebml is a C++ libary to parse EBML file=
s"
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3Df14599a2f089f6ff8c97e2ba=
a4e3d575"
> =20
> -SRC_URI =3D "http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.=
bz2"
> +SRC_URI =3D "\
> +    http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.bz2 \
> +    file://ldflags.patch \
> +    file://override-uname.patch \
> +"
>  SRC_URI[md5sum] =3D "efec729bf5a51e649e1d9d1f61c0ae7a"
>  SRC_URI[sha256sum] =3D "83b074d6b62715aa0080406ea84d33df2e44b5d874096640=
233a4db49b8096de"
> =20
> -EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> +do_unpack[postfuncs] +=3D "dos2unix"
> =20
> -do_compile() {
> -    cd ${S}/make/linux
> -    oe_runmake CROSS=3D"${TARGET_PREFIX}"
> +dos2unix () {
> +    cr=3D"$(printf '\r')"
> +    for f in make/*/Makefile; do
> +        tr -d "$cr" <"$f" >"$f.new" && \
> +            mv "$f.new" "$f"
> +    done
> +}

This doesn't seem to work now:

| NOTE: Unpacking /home/jenkins/oe/world/shr-core/meta-openembedded/meta-mu=
ltimedia/recipes-mkv/libebml/libebml/override-uname.patch to /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libebml/1.3.0-r0/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function do_qa_unpack
| NOTE: Checking has ${S} been created
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing shell function dos2unix
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/l=
ibebml/1.3.0-r0/temp/run.dos2unix.30265: 104: /home/jenkins/oe/world/shr-co=
re/tmp-glibc/work/armv5te-oe-linux-gnueabi/libebml/1.3.0-r0/temp/run.dos2un=
ix.30265: cannot open make/*/Makefile: No such file
| WARNING: exit code 2 from a shell command.
| ERROR: Function failed: dos2unix (log file is located at /home/jenkins/oe=
/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libebml/1.3.0-r0/te=
mp/log.do_unpack.30265)
NOTE: recipe libebml-1.3.0-r0: task do_unpack: Failed


> +
> +LIBEBML_OS =3D "Unknown"
> +LIBEBML_OS_linux =3D "Linux"
> +LIBEBML_OS_darwin =3D "Darwin"
> +LIBEBML_OS_mingw32 =3D "Windows"
> +
> +EXTRA_OEMAKE =3D "\
> +    'TARGET_OS=3D${LIBEBML_OS}' \
> +    \
> +    'CXX=3D${CXX}' \
> +    'LD=3D${CXX}' \
> +    'AR=3D${AR}' \
> +    'RANLIB=3D${RANLIB}' \
> +    \
> +    'DEBUGFLAGS=3D' \
> +    'CPPFLAGS=3D${CPPFLAGS}' \
> +    'CXXFLAGS=3D${CXXFLAGS}' \
> +    'LDFLAGS=3D${LDFLAGS}' \
> +    \
> +    'prefix=3D${prefix}' \
> +    'libdir=3D${libdir}' \
> +    'includedir=3D${includedir}/ebml' \
> +"
> +
> +do_compile () {
> +    oe_runmake -C make/linux
>  }
> =20
>  do_install() {
> --=20
> 2.8.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lwnynvkp5jmgd4rk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleUrf8ACgkQN1Ujt2V2gBxw3ACggoVFu2Qc1dvXr1vJJ79rjIuw
onoAnisaft+Heynx9A8zPGXMlPGvRqsi
=TYCd
-----END PGP SIGNATURE-----

--lwnynvkp5jmgd4rk--
