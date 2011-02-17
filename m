Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1Pq6gz-0008V1-Av
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 17:26:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 271992C821
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 16:24:51 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqs0QN+QSp2d
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 16:24:46 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 115FA2C7D7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 16:24:44 +0000 (UTC)
Message-ID: <4D5D4BFF.5040504@gmail.com>
Date: Thu, 17 Feb 2011 17:25:35 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297956266-30032-1-git-send-email-tom_rini@mentor.com>
In-Reply-To: <1297956266-30032-1-git-send-email-tom_rini@mentor.com>
Subject: Re: [PATCH 1/2] db: Bring in 5.1.19 from poky
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
X-List-Received-Date: Thu, 17 Feb 2011 16:26:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Tom Rini ha scritto, Il 17/02/2011 16:24:
> Based on e77207ccdf15f34651a086099ed4816712e3656b in poky, bring in
> 5.1.19 (no RPATH issues when using libtool 2.2) and drop un-pinned
> 4.3.29 and 5.0.21 as this is backwards compatible.
>=20
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  recipes/db/db-5.0.21/cp.patch                  |   15 ----
>  recipes/db/db-5.1.19/arm-thumb-mutex_db5.patch |   36 +++++++++
>  recipes/db/db-native_4.3.29.bb                 |    5 -
>  recipes/db/db-native_5.0.21.bb                 |    2 -
>  recipes/db/db4-native.inc                      |   15 ----
>  recipes/db/db4.inc                             |   82 ----------------=
---
>  recipes/db/db5.inc                             |   85 ----------------=
----
>  recipes/db/db_4.3.29.bb                        |   15 ----
>  recipes/db/db_5.0.21.bb                        |   16 ----
>  recipes/db/db_5.1.19.bb                        |  100 ++++++++++++++++=
++++++++
>  recipes/db/files/arm-thumb-mutex.patch         |   36 ---------
>  recipes/db/files/db5-arm-thumb-mutex.patch     |   38 ---------
>  12 files changed, 136 insertions(+), 309 deletions(-)
>  delete mode 100644 recipes/db/db-5.0.21/cp.patch
>  create mode 100644 recipes/db/db-5.1.19/arm-thumb-mutex_db5.patch
>  delete mode 100644 recipes/db/db-native_4.3.29.bb
>  delete mode 100644 recipes/db/db-native_5.0.21.bb
>  delete mode 100644 recipes/db/db4-native.inc
>  delete mode 100644 recipes/db/db4.inc
>  delete mode 100644 recipes/db/db5.inc
>  delete mode 100644 recipes/db/db_4.3.29.bb
>  delete mode 100644 recipes/db/db_5.0.21.bb
>  create mode 100644 recipes/db/db_5.1.19.bb
>  delete mode 100644 recipes/db/files/arm-thumb-mutex.patch
>  delete mode 100644 recipes/db/files/db5-arm-thumb-mutex.patch
>=20
> diff --git a/recipes/db/db-5.0.21/cp.patch b/recipes/db/db-5.0.21/cp.pa=
tch
> deleted file mode 100644
> index b916b06..0000000
> --- a/recipes/db/db-5.0.21/cp.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> ----
> - Makefile.in |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> ---- dist.orig/Makefile.in
> -+++ dist/Makefile.in
> -@@ -1116,7 +1116,7 @@ install_docs:
> -	    ($(MKDIR) -p $(DESTDIR)$(docdir) && \
> -	    $(CHMOD) $(dmode) $(DESTDIR)$(docdir))
> -	@cd $(DESTDIR)$(docdir) && $(RM) -r $(DOCLIST)
> --	@cd $(srcdir)/docs && $(CP) -pr $(DOCLIST) $(DESTDIR)$(docdir)/
> -+	@cd $(srcdir)/docs && $(CP) -pR $(DOCLIST) $(DESTDIR)$(docdir)/
> -
> - uninstall_docs:
> -	@cd $(DESTDIR)$(docdir) && $(RM) -r $(DOCLIST)
> diff --git a/recipes/db/db-5.1.19/arm-thumb-mutex_db5.patch b/recipes/d=
b/db-5.1.19/arm-thumb-mutex_db5.patch
> new file mode 100644
> index 0000000..37d0d93
> --- /dev/null
> +++ b/recipes/db/db-5.1.19/arm-thumb-mutex_db5.patch
> @@ -0,0 +1,36 @@
> +--- db-5.1.19/../src/dbinc/mutex_int.h.orig	2011-01-05 19:21:42.181805=
366 -0600
> ++++ db-5.1.19/../src/dbinc/mutex_int.h	2011-01-05 19:24:53.141853117 -=
0600
> +@@ -474,6 +474,25 @@
> +=20
> + #ifdef LOAD_ACTUAL_MUTEX_CODE
> + /* gcc/arm: 0 is clear, 1 is set. */
> ++#if defined __thumb__
> ++#define	MUTEX_SET(tsl) ({						\
> ++	int __r, __p;							\
> ++	__asm__ volatile(						\
> ++		".align 2\n\t"                                          \
> ++		"bx     pc\n\t"                                         \
> ++		"nop\n\t"                                               \
> ++		".arm\n\t"                                              \
> ++		"swpb   %0, %2, [%3]\n\t"                               \
> ++		"eor    %0, %0, #1\n\t"                                 \
> ++		"orr    %1, pc, #1\n\t"                                 \
> ++		"bx     %1\n\t"                                         \
> ++		".force_thumb"                                          \
> ++	    : "=3D&r" (__r), "=3Dr" (__p)                                   =
\
> ++	    : "r" (1), "r" (tsl)                                        \
> ++	    );                                                          \
> ++	__r & 1;							\
> ++})
> ++#else
> + #define	MUTEX_SET(tsl) ({						\
> + 	int __r;							\
> + 	__asm__ volatile(						\
> +@@ -484,6 +503,7 @@
> + 	    );								\
> + 	__r & 1;							\
> + })
> ++#endif
> +=20
> + #define	MUTEX_UNSET(tsl)	(*(volatile tsl_t *)(tsl) =3D 0)
> + #define	MUTEX_INIT(tsl)         (MUTEX_UNSET(tsl), 0)
> diff --git a/recipes/db/db-native_4.3.29.bb b/recipes/db/db-native_4.3.=
29.bb
> deleted file mode 100644
> index 07ac448..0000000
> --- a/recipes/db/db-native_4.3.29.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require db_${PV}.bb
> -require db4-native.inc
> -
> -SRC_URI[md5sum] =3D "200b9f5d74175875fcb3ee54adbf0007"
> -SRC_URI[sha256sum] =3D "a1fa714482f25a67a19490303a0164326ac63bd7653ae3=
f4664c2536b14f3337"
> diff --git a/recipes/db/db-native_5.0.21.bb b/recipes/db/db-native_5.0.=
21.bb
> deleted file mode 100644
> index 0e6381b..0000000
> --- a/recipes/db/db-native_5.0.21.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require db_${PV}.bb
> -require db4-native.inc
> diff --git a/recipes/db/db4-native.inc b/recipes/db/db4-native.inc
> deleted file mode 100644
> index 7fd753d..0000000
> --- a/recipes/db/db4-native.inc
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -# This wrapper builds a native version of the Oracal
> -# Berkeley DB for those packages which need it (e.g.
> -# perl).
> -
> -VIRTUAL_NAME =3D "virtual/db-native"
> -CONFLICTS =3D "db3-native"
> -#PR tracks the non-native package
> -
> -inherit native
> -
> -do_package() {
> -:
> -}
> -
> -PACKAGES =3D ""
> diff --git a/recipes/db/db4.inc b/recipes/db/db4.inc
> deleted file mode 100644
> index 2595d81..0000000
> --- a/recipes/db/db4.inc
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -# Version 4 of the Berkeley DB from Oracle
> -#
> -# At present this package only installs the DB code
> -# itself (shared libraries, .a in the dev package),
> -# documentation and headers.
> -#
> -# The headers have the same names as those as v3
> -# of the DB, only one version can be used *for dev*
> -# at once - DB3 and DB4 can both be installed on the
> -# same system at the same time if really necessary.
> -
> -
> -DESCRIPTION =3D "Berkeley DB v4."
> -HOMEPAGE =3D "http://www.oracle.com/technology/products/berkeley-db/db=
/index.html"
> -SECTION =3D "libs"
> -LICENSE =3D "BSD"
> -VIRTUAL_NAME ?=3D "virtual/db"
> -CONFLICTS =3D "db3"
> -
> -SRC_URI =3D "ftp://ftp.freebsd.org/pub/FreeBSD/distfiles/bdb/db-${PV}.=
tar.gz"
> -
> -inherit autotools
> -
> -# Put virtual/db in any appropriate provider of a
> -# relational database, use it as a dependency in
> -# place of a specific db and use:
> -#
> -# PREFERRED_PROVIDER_virtual/db
> -#
> -# to select the correct db in the build (distro) .conf
> -PROVIDES +=3D "${VIRTUAL_NAME}"
> -
> -# bitbake isn't quite clever enough to deal with db,
> -# the distribution sits in the expected directory, but all
> -# the builds must occur from a sub-directory.  The following
> -# persuades bitbake to go to the right place
> -S =3D "${WORKDIR}/db-${PV}/dist"
> -B =3D "${WORKDIR}/db-${PV}/build_unix"
> -
> -# The executables go in a separate package - typically there
> -# is no need to install these unless doing real database
> -# management on the system.
> -PACKAGES +=3D " ${PN}-bin"
> -
> -# Package contents
> -FILES_${PN} =3D "${libdir}/libdb-${PVM}${SOLIBSDEV}"
> -FILES_${PN}-bin =3D "${bindir}/*"
> -# The dev package has the .so link (as in db3) and the .a's -
> -# it is therefore incompatible (cannot be installed at the
> -# same time) as the db3 package
> -
> -EXTRA_OECONF =3D "${DB4_CONFIG}"
> -
> -# Override the MUTEX setting here, the POSIX library is
> -# the default - "POSIX/pthreads/library".
> -# Don't ignore the nice SWP instruction on the ARM:
> -# These enable the ARM assembler mutex code, this won't
> -# work with thumb compilation...
> -ARM_MUTEX =3D "--with-mutex=3DARM/gcc-assembly"
> -MUTEX =3D ""
> -MUTEX_arm =3D "${ARM_MUTEX}"
> -MUTEX_armeb =3D "${ARM_MUTEX}"
> -EXTRA_OECONF +=3D "${MUTEX}"
> -
> -# Cancel the site stuff - it's set for db3 and destroys the
> -# configure.
> -CONFIG_SITE =3D ""
> -do_configure() {
> -	( cd ${WORKDIR}/db-${PV}/dist ; gnu-configize )=20
> -	oe_runconf
> -}
> -
> -
> -do_install_append() {
> -	# The docs end up in /usr/docs - not right.
> -	if test -d "${D}/${prefix}/docs"
> -	then
> -		mkdir -p "${D}/${datadir}"
> -		test ! -d "${D}/${docdir}" || rm -rf "${D}/${docdir}"
> -		mv "${D}/${prefix}/docs" "${D}/${docdir}"
> -	fi
> -}
> diff --git a/recipes/db/db5.inc b/recipes/db/db5.inc
> deleted file mode 100644
> index 390dfac..0000000
> --- a/recipes/db/db5.inc
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -# Version 5 of the Berkeley DB from Oracle
> -#
> -# At present this package only installs the DB code
> -# itself (shared libraries, .a in the dev package),
> -# documentation and headers.
> -#
> -# The headers have the same names as those as v3
> -# of the DB, only one version can be used *for dev*
> -# at once - DB3 and DB5 both be installed on the
> -# same system at the same time if really necessary.
> -
> -
> -DESCRIPTION =3D "Berkeley DB v5."
> -HOMEPAGE =3D "http://www.oracle.com/technology/products/berkeley-db/db=
/index.html"
> -SECTION =3D "libs"
> -LICENSE =3D "BSD"
> -VIRTUAL_NAME ?=3D "virtual/db"
> -CONFLICTS =3D "db3 db4"
> -
> -SRC_URI =3D "ftp://ftp.freebsd.org/pub/FreeBSD/distfiles/bdb/db-${PV}.=
tar.gz"
> -
> -inherit autotools
> -
> -# Put virtual/db in any appropriate provider of a
> -# relational database, use it as a dependency in
> -# place of a specific db and use:
> -#
> -# PREFERRED_PROVIDER_virtual/db
> -#
> -# to select the correct db in the build (distro) .conf
> -PROVIDES +=3D "${VIRTUAL_NAME}"
> -
> -# bitbake isn't quite clever enough to deal with db,
> -# the distribution sits in the expected directory, but all
> -# the builds must occur from a sub-directory.  The following
> -# persuades bitbake to go to the right place
> -S =3D "${WORKDIR}/db-${PV}/dist"
> -B =3D "${WORKDIR}/db-${PV}/build_unix"
> -
> -# The executables go in a separate package - typically there
> -# is no need to install these unless doing real database
> -# management on the system.
> -PACKAGES +=3D " ${PN}-bin"
> -
> -# Package contents
> -FILES_${PN} =3D "${libdir}/libdb-${PVM}${SOLIBSDEV}"
> -FILES_${PN}-bin =3D "${bindir}/*"
> -# The dev package has the .so link (as in db3) and the .a's -
> -# it is therefore incompatible (cannot be installed at the
> -# same time) as the db3 package
> -
> -EXTRA_OECONF =3D "${DB5_CONFIG}"
> -
> -# Override the MUTEX setting here, the POSIX library is
> -# the default - "POSIX/pthreads/library".
> -# Don't ignore the nice SWP instruction on the ARM:
> -# These enable the ARM assembler mutex code, this won't
> -# work with thumb compilation...
> -ARM_MUTEX =3D "--with-mutex=3DARM/gcc-assembly"
> -MUTEX =3D ""
> -MUTEX_arm =3D "${ARM_MUTEX}"
> -MUTEX_armeb =3D "${ARM_MUTEX}"
> -EXTRA_OECONF +=3D "${MUTEX}"
> -
> -LIBTOOL =3D "${HOST_SYS}-libtool --tag=3DCXX"
> -EXTRA_OEMAKE =3D "'LIBTOOL=3D${LIBTOOL}'"
> -
> -# Cancel the site stuff - it's set for db3 and destroys the
> -# configure.
> -CONFIG_SITE =3D ""
> -do_configure() {
> -	( cd ${WORKDIR}/db-${PV}/dist ; gnu-configize )=20
> -	oe_runconf
> -}
> -
> -
> -do_install_append() {
> -	# The docs end up in /usr/docs - not right.
> -	if test -d "${D}/${prefix}/docs"
> -	then
> -		mkdir -p "${D}/${datadir}"
> -		test ! -d "${D}/${docdir}" || rm -rf "${D}/${docdir}"
> -		mv "${D}/${prefix}/docs" "${D}/${docdir}"
> -	fi
> -}
> diff --git a/recipes/db/db_4.3.29.bb b/recipes/db/db_4.3.29.bb
> deleted file mode 100644
> index 08ca12d..0000000
> --- a/recipes/db/db_4.3.29.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -PR =3D "r12"
> -
> -# major version number
> -PVM =3D "4.3"
> -
> -require db4.inc
> -
> -SRC_URI +=3D "file://arm-thumb-mutex.patch"
> -
> -#configuration - set in local.conf to override
> -# All the --disable-* options replace --enable-smallbuild, which break=
s a bunch of stuff (eg. postfix)
> -DB4_CONFIG ?=3D "--enable-o_direct --disable-cryptography --disable-qu=
eue --disable-replication --disable-statistics --disable-verify --enable-=
compat185"
> -
> -SRC_URI[md5sum] =3D "200b9f5d74175875fcb3ee54adbf0007"
> -SRC_URI[sha256sum] =3D "a1fa714482f25a67a19490303a0164326ac63bd7653ae3=
f4664c2536b14f3337"
> diff --git a/recipes/db/db_5.0.21.bb b/recipes/db/db_5.0.21.bb
> deleted file mode 100644
> index 1a4907f..0000000
> --- a/recipes/db/db_5.0.21.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -PR =3D "r3"
> -
> -# major version number
> -PVM =3D "5.0"
> -
> -#configuration - set in local.conf to override
> -# All the --disable-* options replace --enable-smallbuild, which break=
s a bunch of stuff (eg. postfix)
> -DB5_CONFIG ?=3D "--enable-o_direct --disable-cryptography --disable-qu=
eue --disable-replication --disable-statistics --disable-verify --enable-=
compat185"
> -
> -require db5.inc
> -
> -SRC_URI +=3D "file://db5-arm-thumb-mutex.patch \
> -            file://cp.patch"
> -
> -SRC_URI[md5sum] =3D "9a749fd2e98fe15840493ddc34cc66d8"
> -SRC_URI[sha256sum] =3D "061a31a962e992dd1eae5f1e3193241d497a18968e7507=
07526d104b53ab3cc4"
> diff --git a/recipes/db/db_5.1.19.bb b/recipes/db/db_5.1.19.bb
> new file mode 100644
> index 0000000..c44b958
> --- /dev/null
> +++ b/recipes/db/db_5.1.19.bb
> @@ -0,0 +1,100 @@
> +# Version 5 of the Berkeley DB from Sleepycat
> +#
> +# At present this package only installs the DB code
> +# itself (shared libraries, .a in the dev package),
> +# documentation and headers.
> +#
> +# The headers have the same names as those as v3
> +# of the DB, only one version can be used *for dev*
> +# at once - DB3 and DB5 can both be installed on the
> +# same system at the same time if really necessary.
> +SECTION =3D "libs"
> +DESCRIPTION =3D "Berkeley DB v5."
> +HOMEPAGE =3D "http://www.oracle.com/technology/products/berkeley-db/db=
/index.html"
> +LICENSE =3D "BSD Sleepycat"
> +VIRTUAL_NAME ?=3D "virtual/db"
> +CONFLICTS =3D "db3"
> +PR =3D "r1"
> +
> +SRC_URI =3D "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
> +SRC_URI +=3D "file://arm-thumb-mutex_db5.patch"
> +
> +SRC_URI[md5sum] =3D "76fcbfeebfcd09ba0b4d96bfdf8d884d"
> +SRC_URI[sha256sum] =3D "0194d4ca9266ba1a1c0bfbc233b18bfd05f63163453c81=
ebcdfdc7112d5ac850"
> +
> +inherit autotools
> +
> +# Put virtual/db in any appropriate provider of a
> +# relational database, use it as a dependency in
> +# place of a specific db and use:
> +#
> +# PREFERRED_PROVIDER_virtual/db
> +#
> +# to select the correct db in the build (distro) .conf
> +PROVIDES +=3D "${VIRTUAL_NAME}"
> +
> +# bitbake isn't quite clever enough to deal with sleepycat,
> +# the distribution sits in the expected directory, but all
> +# the builds must occur from a sub-directory.  The following
> +# persuades bitbake to go to the right place
> +S =3D "${WORKDIR}/db-${PV}/dist"
> +B =3D "${WORKDIR}/db-${PV}/build_unix"
> +
> +# The executables go in a separate package - typically there
> +# is no need to install these unless doing real database
> +# management on the system.
> +PACKAGES +=3D " ${PN}-bin"
> +
> +# Package contents
> +FILES_${PN} =3D "${libdir}/libdb-5*so*"
> +FILES_${PN}-bin =3D "${bindir}/*"
> +# The dev package has the .so link (as in db3) and the .a's -
> +# it is therefore incompatible (cannot be installed at the
> +# same time) as the db3 package
> +FILES_${PN}-dev =3D "${includedir} ${libdir}/*"
> +
> +#configuration - set in local.conf to override
> +# All the --disable-* options replace --enable-smallbuild, which break=
s a bunch of stuff (eg. postfix)
> +DB5_CONFIG ?=3D "--enable-o_direct --disable-cryptography --disable-qu=
eue --disable-replication --disable-statistics --disable-verify --disable=
-compat185 --disable-sql"
> +
> +EXTRA_OECONF =3D "${DB5_CONFIG}"
> +
> +# Override the MUTEX setting here, the POSIX library is
> +# the default - "POSIX/pthreads/library".
> +# Don't ignore the nice SWP instruction on the ARM:
> +# These enable the ARM assembler mutex code, this won't
> +# work with thumb compilation...
> +ARM_MUTEX =3D "--with-mutex=3DARM/gcc-assembly"
> +MUTEX =3D ""
> +MUTEX_arm =3D "${ARM_MUTEX}"
> +MUTEX_armeb =3D "${ARM_MUTEX}"
> +EXTRA_OECONF +=3D "${MUTEX}"
> +
> +# Cancel the site stuff - it's set for db3 and destroys the
> +# configure.
> +CONFIG_SITE =3D ""
> +do_configure() {
> +	oe_runconf
> +}
> +
> +do_install_append() {
> +	mkdir -p ${D}/${includedir}/db51
> +	#mv ${D}/${includedir}/db_185.h ${D}/${includedir}/db51/.
> +	mv ${D}/${includedir}/db.h ${D}/${includedir}/db51/.
> +	mv ${D}/${includedir}/db_cxx.h ${D}/${includedir}/db51/.
> +	#mv ${D}/${includedir}/dbsql.h ${D}/${includedir}/db51/.
> +	#ln -s db51/db_185.h ${D}/${includedir}/db_185.h
> +	ln -s db51/db.h ${D}/${includedir}/db.h
> +	ln -s db51/db_cxx.h ${D}/${includedir}/db_cxx.h
> +	#ln -s db51/dbsql.h ${D}/${includedir}/dbsql.h
> +
> +	# The docs end up in /usr/docs - not right.
> +	if test -d "${D}/${prefix}/docs"
> +	then
> +		mkdir -p "${D}/${datadir}"
> +		test ! -d "${D}/${docdir}" || rm -rf "${D}/${docdir}"
> +		mv "${D}/${prefix}/docs" "${D}/${docdir}"
> +	fi
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/recipes/db/files/arm-thumb-mutex.patch b/recipes/db/files/=
arm-thumb-mutex.patch
> deleted file mode 100644
> index acd446f..0000000
> --- a/recipes/db/files/arm-thumb-mutex.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> ---- db-4.3.29-dist/../dbinc/mutex.h	2005-11-15 07:33:27.761042518 -080=
0
> -+++ db-4.3.29-dist/../dbinc/mutex.h	2005-11-15 07:55:24.823920060 -080=
0
> -@@ -470,6 +470,25 @@
> - #ifdef LOAD_ACTUAL_MUTEX_CODE
> - #define	MUTEX_SET_TEST	1		/* gcc/arm: 0 is clear, 1 is set. */
> -=20
> -+#if defined __thumb__
> -+#define	MUTEX_SET(tsl) ({						\
> -+	int __r, __p;							\
> -+	asm volatile(							\
> -+		".align	2\n\t"						\
> -+		"bx	pc\n\t"						\
> -+		"nop\n\t"						\
> -+		".arm\n\t"						\
> -+		"swpb	%0, %2, [%3]\n\t"				\
> -+		"eor	%0, %0, #1\n\t"					\
> -+		"orr	%1, pc, #1\n\t"					\
> -+		"bx	%1\n\t"						\
> -+		".force_thumb"						\
> -+	    : "=3D&r" (__r), "=3Dr" (__p)					\
> -+	    : "r" (1), "r" (tsl)					\
> -+	    );								\
> -+	__r & 1;							\
> -+})
> -+#else
> - #define	MUTEX_SET(tsl) ({						\
> - 	int __r;							\
> - 	asm volatile(							\
> -@@ -480,6 +499,7 @@
> - 	    );								\
> - 	__r & 1;							\
> - })
> -+#endif
> -=20
> - #define	MUTEX_UNSET(tsl)	(*(volatile tsl_t *)(tsl) =3D 0)
> - #define	MUTEX_INIT(tsl)		MUTEX_UNSET(tsl)
> diff --git a/recipes/db/files/db5-arm-thumb-mutex.patch b/recipes/db/fi=
les/db5-arm-thumb-mutex.patch
> deleted file mode 100644
> index 51b8882..0000000
> --- a/recipes/db/files/db5-arm-thumb-mutex.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Index: db-5.0.21/../dbinc/mutex_int.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- db-5.0.21.orig/../dbinc/mutex_int.h	2010-03-30 10:36:09.000000000 =
-0700
> -+++ db-5.0.21/../dbinc/mutex_int.h	2010-05-22 12:07:38.281286337 -0700
> -@@ -474,6 +474,25 @@ typedef unsigned char tsl_t;
> -=20
> - #ifdef LOAD_ACTUAL_MUTEX_CODE
> - /* gcc/arm: 0 is clear, 1 is set. */
> -+#if defined __thumb__
> -+#define	MUTEX_SET(tsl) ({						\
> -+	int __r, __p;							\
> -+	asm volatile(							\
> -+		".align	2\n\t"						\
> -+		"bx	pc\n\t"						\
> -+		"nop\n\t"						\
> -+		".arm\n\t"						\
> -+		"swpb	%0, %2, [%3]\n\t"				\
> -+		"eor	%0, %0, #1\n\t"					\
> -+		"orr	%1, pc, #1\n\t"					\
> -+		"bx	%1\n\t"						\
> -+		".force_thumb"						\
> -+	    : "=3D&r" (__r), "=3Dr" (__p)					\
> -+	    : "r" (1), "r" (tsl)					\
> -+	    );								\
> -+	__r & 1;							\
> -+})
> -+#else
> - #define	MUTEX_SET(tsl) ({						\
> - 	int __r;							\
> - 	__asm__ volatile(						\
> -@@ -484,6 +503,7 @@ typedef unsigned char tsl_t;
> - 	    );								\
> - 	__r & 1;							\
> - })
> -+#endif
> -=20
> - #define	MUTEX_UNSET(tsl)	(*(volatile tsl_t *)(tsl) =3D 0)
> - #define	MUTEX_INIT(tsl)         (MUTEX_UNSET(tsl), 0)


ACK


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com


