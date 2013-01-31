Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0xgS-00026x-QC
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 18:12:21 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so1818555pac.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 08:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=F9IamLGSShww6OXaBRY0EAHBQsp7Z5nxMW0ARJGrqsY=;
	b=Kuu5kK2oHgAuaGF9lhAP/3f61iqs9G+RXBIen7n+JTB53YADnQlFMkxY5PUzOtyMLQ
	iGkjxQVSJ0B5x+1gtJlWQUWoCgeTQI9qJv2FJ/EwZKwPJUWPMN/fLKx66JVIXuNyLDIr
	YUZuRw4JYYN92CxwkBc7OBcwO0zzNheFg/8wA33TCuzlaYB1uzwdIlvOSF7qs1PZH9VM
	m7dTRB/EWCOa4pc069nN+ZKk8YOIPV9j6/xhnRtCKnx9rAm//6TRDtdepbYIdcRAtxFZ
	XzXR9E5Q4+tQZu264FhEWwLezqV1leiqhU8ow/s6IZGTjm2V7lWWzDa3loag1hzvvjeK
	AZWA==
X-Received: by 10.68.202.65 with SMTP id kg1mr24039761pbc.28.1359651397173;
	Thu, 31 Jan 2013 08:56:37 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pw10sm5497448pbb.28.2013.01.31.08.56.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 08:56:35 -0800 (PST)
Date: Thu, 31 Jan 2013 17:56:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130131165633.GF2102@jama.dyndns-home.com>
References: <1359532955-16954-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1359532955-16954-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][[RFC][PATCH] nodejs: add 0.8.18
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
X-List-Received-Date: Thu, 31 Jan 2013 17:12:21 -0000
X-Groupsio-MsgNum: 42942
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qftxBdZWiueWNAVY"
Content-Disposition: inline

--qftxBdZWiueWNAVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2013 at 09:02:35AM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../nodejs/nodejs/0002-Enable-NEON.patch           | 27 ++++++++++
>  ...0003-Resolve-bad-rpath-issue-when-linking.patch | 29 ++++++++++
>  meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb   | 61 ++++++++++++++++=
++++++
>  3 files changed, 117 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NE=
ON.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-b=
ad-rpath-issue-when-linking.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb

FWIW: 0.6.21 fails exactly the same as 0.6.20 but I've merged it as it's
not worse.

I've tried 0.8.18 today and it fails:
ERROR: Function failed: do_configure (see /home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/temp/log.do=
_configure.30923 for further information)
ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/temp/log.do_conf=
igure.30923
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/=
nodejs-native/0.8.18-r0/gcc: 2: /home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/gcc: Cannot fork
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/=
nodejs-native/0.8.18-r0/gcc: 2: /home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/gcc: Cannot fork
| Traceback (most recent call last):
|   File "./configure", line 473, in <module>
|     configure_node(output)
|   File "./configure", line 371, in configure_node
|     cc_version, is_clang =3D compiler_version()
|   File "./configure", line 331, in compiler_version
|     version =3D tuple(map(int, proc.communicate()[0].split('.')))
| ValueError: invalid literal for int() with base 10: ''
| ERROR: Function failed: do_configure (see /home/jenkins/oe/shr-core-branc=
hes/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/temp/log.=
do_configure.30923 for further information)
NOTE: recipe nodejs-native-0.8.18-r0: task do_configure: Failed
ERROR: Task 22884 (virtual:native:/home/jenkins/oe/shr-core-branches/shr-co=
re/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb, do_c=
onfigure) failed with exit code '1'

Any idea?

> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patc=
h b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch
> new file mode 100644
> index 0000000..2b83ff8
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch
> @@ -0,0 +1,27 @@
> +From 8891cb4cae57a6b7db54edb33a43743c4b09c53a Mon Sep 17 00:00:00 2001
> +From: Jason Kridner <jdk@ti.com>
> +Date: Wed, 7 Nov 2012 14:43:55 -0500
> +Subject: [PATCH] Enable NEON
> +
> +Read this was necessary on a blog.
> +
> +http://www.code-with-passion.com/2012/11/07/cross-compiling-nodejs-and-n=
ode-modules-for-armbeaglebone/
> +---
> + deps/v8/build/common.gypi |    1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/deps/v8/build/common.gypi b/deps/v8/build/common.gypi
> +index 7a780cc..237f53f 100644
> +--- a/deps/v8/build/common.gypi
> ++++ b/deps/v8/build/common.gypi
> +@@ -29,6 +29,7 @@
> +=20
> + {
> +   'variables': {
> ++    'arm_neon%': 1,
> +     'use_system_v8%': 0,
> +     'msvs_use_common_release': 0,
> +     'gcc_version%': 'unknown',
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpat=
h-issue-when-linking.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Re=
solve-bad-rpath-issue-when-linking.patch
> new file mode 100644
> index 0000000..b7e8b6c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue=
-when-linking.patch
> @@ -0,0 +1,29 @@
> +From aaf38f17911941d979074e4d5f8475f4ad5595a8 Mon Sep 17 00:00:00 2001
> +From: Nathan Rajlich <nathan@tootallnate.net>
> +Date: Tue, 9 Oct 2012 09:49:00 -0700
> +Subject: [PATCH] Resolve bad rpath issue when linking
> +
> +See http://piscisaureus.no.de/libuv/2012-10-09#16:42:44.577 to
> +understand the issue.
> +
> +Added to OE by Jason Kridner <jdk@ti.com>
> +---
> + common.gypi |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/common.gypi b/common.gypi
> +index b26d2f3..8ae671b 100644
> +--- a/common.gypi
> ++++ b/common.gypi
> +@@ -163,7 +163,7 @@
> +       [ 'OS=3D=3D"linux" or OS=3D=3D"freebsd" or OS=3D=3D"openbsd" or O=
S=3D=3D"solaris"', {
> +         'cflags': [ '-Wall', '-pthread', ],
> +         'cflags_cc': [ '-fno-rtti', '-fno-exceptions' ],
> +-        'ldflags': [ '-pthread', '-rdynamic' ],
> ++        'ldflags': [ '-pthread' ],
> +         'conditions': [
> +           [ 'target_arch=3D=3D"ia32"', {
> +             'cflags': [ '-m32' ],
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/r=
ecipes-devtools/nodejs/nodejs_0.8.18.bb
> new file mode 100644
> index 0000000..4670ae9
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> @@ -0,0 +1,61 @@
> +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> +HOMEPAGE =3D "http://nodejs.org"
> +LICENSE =3D "MIT & BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D95a589a3257ab7dfe37d8a8379e3c=
72d"
> +
> +DEPENDS =3D "openssl"
> +
> +SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> +           file://0002-Enable-NEON.patch \
> +           file://0003-Resolve-bad-rpath-issue-when-linking.patch \
> +"
> +SRC_URI[md5sum] =3D "25ed6aa5710ac46b867ff3f17a4da1d6"
> +SRC_URI[sha256sum] =3D "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda=
3b71306fe9ae00f9"
> +
> +S =3D "${WORKDIR}/node-v${PV}"
> +
> +# v8 errors out if you have set CCACHE
> +CCACHE =3D ""
> +
> +# Node is way too cool to use proper autotools, so we install two wrappe=
rs to forcefully inject proper arch cflags to workaround gypi
> +do_configure () {
> +  echo '#!/bin/sh' > ${WORKDIR}/gcc
> +  echo '${CC} $@' >> ${WORKDIR}/gcc
> +
> +  echo '#!/bin/sh' > ${WORKDIR}/g++
> +  echo '${CXX} $@'>> ${WORKDIR}/g++
> +
> +  echo '#!/bin/sh' > ${WORKDIR}/ld
> +  echo '${CXX} $@'>> ${WORKDIR}/ld
> +
> +  chmod +x ${WORKDIR}/gcc ${WORKDIR}/g++ ${WORKDIR}/ld
> +
> +  export PATH=3D${WORKDIR}:${PATH}
> +  export CC=3Dgcc
> +  export CXX=3Dg++
> +  export LD=3Dld
> +
> +  ./configure --prefix=3D${prefix} --without-snapshot
> +}
> +
> +do_compile_virtclass-native () {
> +  make BUILDTYPE=3DRelease
> +}
> +
> +do_compile () {
> +  export PATH=3D${WORKDIR}:${PATH}
> +  export CC=3Dgcc
> +  export CXX=3Dg++
> +  export LD=3Dld
> +  make BUILDTYPE=3DRelease
> +}
> +
> +do_install () {
> +  DESTDIR=3D${D} oe_runmake install
> +}
> +
> +RDEPENDS_${PN} =3D "curl python-shell python-datetime python-subprocess =
python-crypt python-textutils python-netclient "
> +RDEPENDS_${PN}_virtclass-native =3D "curl-native python-native"
> +
> +FILES_${PN} +=3D "${libdir}/node/wafadmin ${libdir}/node_modules ${libdi=
r}/dtrace"
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.8.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qftxBdZWiueWNAVY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEKokEACgkQN1Ujt2V2gBzJYgCfYNepgmVgnfXNYJds16ka1TPR
IUIAnjT1PpOqlpUy85XHg7emQVafMYBz
=sRAL
-----END PGP SIGNATURE-----

--qftxBdZWiueWNAVY--
