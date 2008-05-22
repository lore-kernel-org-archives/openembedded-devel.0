Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1Jz3kq-0007Ms-Bk
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 May 2008 07:54:21 +0200
Received: (qmail invoked by alias); 22 May 2008 05:51:39 -0000
Received: from brln-4db8892a.pool.einsundeins.de (EHLO [192.168.4.110])
	[77.184.137.42]
	by mail.gmx.net (mp008) with SMTP; 22 May 2008 07:51:39 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+LK9llBr+L/8ZGZPWZW5kxRJK9W/RZCCCoB8pYwQ
	VRYZZRR5MJQHga
Message-ID: <483509EA.4080902@gmx.net>
Date: Thu, 22 May 2008 07:51:38 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.12 (X11/20080420)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	John Lee <john_lee@openmoko.com>
References: <20080521120136.903A91892F8@amethyst.openembedded.net>
In-Reply-To: <20080521120136.903A91892F8@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] org.oe.dev cacao: add hg version 8190 and the	corresponding cacaoh-native.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 22 May 2008 05:54:42 -0000
X-Groupsio-MsgNum: 5222
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigD32385ED0016DAF02320CE9E"

--------------enigD32385ED0016DAF02320CE9E
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi John Lee,
please use the corresponding date instead of the hg revision number.
Reason is that in mercurial revision numbers are local and not equal
between different users.

Regards
Robert

john_lee commit schrieb:
> cacao: add hg version 8190 and the corresponding cacaoh-native.
>=20
> Author: john_lee@openembedded.org
> Branch: org.openembedded.dev
> Revision: e7e8e506f89a6a1476f5dc6b5fbd52227c4bc198
> ViewMTN: http://monotone.openembedded.org/revision/info/e7e8e506f89a6a1=
476f5dc6b5fbd52227c4bc198
> Files:
> 1
> packages/cacao/cacao_0.98+hg8190.bb
> packages/cacao/cacaoh-native_0.98+hg8190.bb
> packages/cacao/files/cacao-hg8190-classpath_var.patch
> packages/cacao/files/cacao-hg8190-libdir.patch
> Diffs:
>=20
> #
> # mt diff -rd3e6d2bafdfc9d3b6ae568792b3d8843a955a119 -re7e8e506f89a6a14=
76f5dc6b5fbd52227c4bc198
> #
> #
> #
> # add_file "packages/cacao/cacao_0.98+hg8190.bb"
> #  content [7796571ddad2e693b74e3cf2891c18934c196fde]
> #=20
> # add_file "packages/cacao/cacaoh-native_0.98+hg8190.bb"
> #  content [126e7d435273831e60739cc2c81d607a445e9197]
> #=20
> # add_file "packages/cacao/files/cacao-hg8190-classpath_var.patch"
> #  content [62477b682d6cb20be67ab015423d22c6412ac5f8]
> #=20
> # add_file "packages/cacao/files/cacao-hg8190-libdir.patch"
> #  content [7b12857a339294deb7df47da33c5e9db8290107a]
> #
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/cacao/cacao_0.98+hg8190.bb	7796571ddad2e693b74e3cf2891c189=
34c196fde
> +++ packages/cacao/cacao_0.98+hg8190.bb	7796571ddad2e693b74e3cf2891c189=
34c196fde
> @@ -0,0 +1,24 @@
> +require cacao.inc
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://downloads.openmoko.org/sources/cacao-0.98+hg8190.t=
ar.gz;md5sum=3D1c6e0530be63ec8a4c0ab2935c2fdc8f \
> +           file://cacao-hg8190-classpath_var.patch;patch=3D1 \
> +           file://cacao-hg8190-libdir.patch;patch=3D1 \
> +          "
> +
> +S =3D "${WORKDIR}/cacao"
> +
> +EXTRA_OECONF =3D "\
> +        ${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) =
=3D=3D 'soft']} \
> +        --enable-debug \
> +        --with-vm-zip=3D${datadir}/cacao/vm.zip \
> +        --with-cacaoh=3D${STAGING_BINDIR_NATIVE}/cacaoh-${PV} \
> +        --with-java-runtime-library-classes=3D${STAGING_DATADIR}/class=
path/glibj.zip \
> +        --with-target-java-runtime-library-classes=3D${datadir}/classp=
ath/glibj.zip \
> +        --with-java-runtime-library-libdir=3D${libdir} \
> +        --with-jni_md_h=3D${STAGING_INCDIR}/classpath \
> +        --with-jni_h=3D${STAGING_INCDIR}/classpath \
> +        "
> +
> +DEFAULT_PREFERENCE =3D "-1"
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/cacao/cacaoh-native_0.98+hg8190.bb	126e7d435273831e60739cc=
2c81d607a445e9197
> +++ packages/cacao/cacaoh-native_0.98+hg8190.bb	126e7d435273831e60739cc=
2c81d607a445e9197
> @@ -0,0 +1,15 @@
> +require cacaoh-native.inc
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://downloads.openmoko.org/sources/cacao-0.98+hg8190.t=
ar.gz;md5sum=3D1c6e0530be63ec8a4c0ab2935c2fdc8f"
> +
> +S =3D "${WORKDIR}/cacao"
> +
> +EXTRA_OECONF =3D " \
> +        --with-java-runtime-library-classes=3D${STAGING_DATADIR}/class=
path/glibj.zip \
> +        --with-jni_md_h=3D${STAGING_INCDIR}/classpath \
> +        --with-jni_h=3D${STAGING_INCDIR}/classpath \
> +    "
> +
> +DEFAULT_PREFERENCE =3D "-1"
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/cacao/files/cacao-hg8190-classpath_var.patch	62477b682d6cb=
20be67ab015423d22c6412ac5f8
> +++ packages/cacao/files/cacao-hg8190-classpath_var.patch	62477b682d6cb=
20be67ab015423d22c6412ac5f8
> @@ -0,0 +1,67 @@
> +Index: cacao/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- cacao.orig/configure.ac	2008-05-21 14:16:33.000000000 +0800
> ++++ cacao/configure.ac	2008-05-21 15:57:42.000000000 +0800
> +@@ -772,6 +772,7 @@
> +=20
> + AC_CHECK_WITH_JAVA_RUNTIME_LIBRARY_PREFIX
> + AC_CHECK_WITH_JAVA_RUNTIME_LIBRARY_CLASSES
> ++AC_CHECK_WITH_TARGET_JAVA_RUNTIME_LIBRARY_CLASSES
> +=20
> + if test x"${ENABLE_JRE_LAYOUT}" =3D "xno"; then
> +    AC_CHECK_WITH_JAVA_RUNTIME_LIBRARY_LIBDIR
> +Index: cacao/m4/java-runtime-library.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- cacao.orig/m4/java-runtime-library.m4	2008-05-21 14:16:34.00000000=
0 +0800
> ++++ cacao/m4/java-runtime-library.m4	2008-05-21 16:18:23.000000000 +08=
00
> +@@ -106,6 +106,29 @@
> + ])
> +=20
> +=20
> ++dnl where are Java runtime library classes installed on the target
> ++
> ++AC_DEFUN([AC_CHECK_WITH_TARGET_JAVA_RUNTIME_LIBRARY_CLASSES],[
> ++AC_MSG_CHECKING(where Java runtime library classes are installed on t=
he target)
> ++AC_ARG_WITH([target-java-runtime-library-classes],
> ++            [AS_HELP_STRING(--with-target-java-runtime-library-classe=
s=3D<path>,path to Java runtime library classes (includes the name of the=
 file and may be flat) [[default=3D(gnuclasspath:${JAVA_RUNTIME_LIBRARY_P=
REFIX}/share/classpath/glibj.zip,openjdk:${JAVA_RUNTIME_LIBRARY_PREFIX}/c=
ontrol/build/${OS_DIR}-${JAVA_ARCH}/classes,*:${JAVA_RUNTIME_LIBRARY_PREF=
IX})]])],
> ++            [TARGET_JAVA_RUNTIME_LIBRARY_CLASSES=3D${withval}],
> ++            [case "${WITH_JAVA_RUNTIME_LIBRARY}" in
> ++                 gnuclasspath)
> ++                     TARGET_JAVA_RUNTIME_LIBRARY_CLASSES=3D${JAVA_RUN=
TIME_LIBRARY_PREFIX}/share/classpath/glibj.zip
> ++                     ;;
> ++                 openjdk)
> ++                     TARGET_JAVA_RUNTIME_LIBRARY_CLASSES=3D${JAVA_RUN=
TIME_LIBRARY_PREFIX}/control/build/${OS_DIR}-${JAVA_ARCH}/classes
> ++                     ;;
> ++                 *)
> ++                     TARGET_JAVA_RUNTIME_LIBRARY_CLASSES=3D${JAVA_RUN=
TIME_LIBRARY_PREFIX}
> ++                     ;;
> ++             esac])
> ++AC_MSG_RESULT(${TARGET_JAVA_RUNTIME_LIBRARY_CLASSES})
> ++AC_DEFINE_UNQUOTED([TARGET_JAVA_RUNTIME_LIBRARY_CLASSES], "${TARGET_J=
AVA_RUNTIME_LIBRARY_CLASSES}", [Java runtime library classes on the targe=
t])
> ++AC_SUBST(TARGET_JAVA_RUNTIME_LIBRARY_CLASSES)
> ++])
> ++
> + dnl where are Java runtime library native libraries installed
> +=20
> + AC_DEFUN([AC_CHECK_WITH_JAVA_RUNTIME_LIBRARY_LIBDIR],[
> +Index: cacao/src/vm/properties.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- cacao.orig/src/vm/properties.c	2008-05-21 14:16:34.000000000 +0800=

> ++++ cacao/src/vm/properties.c	2008-05-21 16:16:24.000000000 +0800
> +@@ -295,14 +295,14 @@
> + 		len =3D
> + 			strlen(CACAO_VM_ZIP) +
> + 			strlen(":") +
> +-			strlen(JAVA_RUNTIME_LIBRARY_CLASSES) +
> ++			strlen(TARGET_JAVA_RUNTIME_LIBRARY_CLASSES) +
> + 			strlen("0");
> +=20
> + 		boot_class_path =3D MNEW(char, len);
> +=20
> + 		strcpy(boot_class_path, CACAO_VM_ZIP);
> + 		strcat(boot_class_path, ":");
> +-		strcat(boot_class_path, JAVA_RUNTIME_LIBRARY_CLASSES);
> ++		strcat(boot_class_path, TARGET_JAVA_RUNTIME_LIBRARY_CLASSES);
> +=20
> + # elif defined(WITH_JAVA_RUNTIME_LIBRARY_OPENJDK)
> +=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/cacao/files/cacao-hg8190-libdir.patch	7b12857a339294deb7df=
47da33c5e9db8290107a
> +++ packages/cacao/files/cacao-hg8190-libdir.patch	7b12857a339294deb7df=
47da33c5e9db8290107a
> @@ -0,0 +1,30 @@
> +Index: cacao/src/vm/properties.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- cacao.orig/src/vm/properties.c	2008-05-21 15:26:21.000000000 +0800=

> ++++ cacao/src/vm/properties.c	2008-05-21 15:28:59.000000000 +0800
> +@@ -211,15 +211,22 @@
> +=20
> + # if defined(WITH_JAVA_RUNTIME_LIBRARY_GNU_CLASSPATH)
> +=20
> +-	boot_library_path =3D JAVA_RUNTIME_LIBRARY_LIBDIR"/classpath";
> ++	boot_library_path =3D JAVA_RUNTIME_LIBRARY_LIBDIR"/classpath:OE_LIBD=
IR_JNI";
> +=20
> + # elif defined(WITH_JAVA_RUNTIME_LIBRARY_OPENJDK)
> +=20
> +-	boot_library_path =3D JAVA_RUNTIME_LIBRARY_LIBDIR;
> ++	boot_library_path =3D JAVA_RUNTIME_LIBRARY_LIBDIR":OE_LIBDIR_JNI";
> +=20
> + # elif defined(WITH_JAVA_RUNTIME_LIBRARY_CLDC1_1)
> +=20
> +-	/* No boot_library_path required. */
> ++	/* No boot_library_path required.
> ++	   Well, don't be that strict on Debian-like
> ++	   environments. Setting this to /usr/lib/jni
> ++	   makes it unneccessary to fumble with
> ++	   LD_LIBRARY_PATH to get things like MIDPath
> ++	   running.
> ++	*/
> ++	boot_library_path =3D "OE_LIBDIR_JNI";
> +=20
> + # else
> + #  error unknown classpath configuration
>=20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commit=
s
>=20
=09


--------------enigD32385ED0016DAF02320CE9E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFINQnqG9cfwmwwEtoRCPaoAJ94r24CHEuyrt7qa2L1wF17JAgq3QCbB6sI
WXah/TNYCJlC5fp34Z1ApQY=
=MAso
-----END PGP SIGNATURE-----

--------------enigD32385ED0016DAF02320CE9E--
