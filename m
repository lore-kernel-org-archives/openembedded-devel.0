Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 888BF738C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:17:01 +0000 (UTC)
Received: by wevm14 with SMTP id m14so53207533wev.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 06:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JzGtHlrzDb7xqX52Zedt44zcO3RVvo3NDLVIE05Bx8Q=;
	b=QBGn1/P3OnmDhl2XCL3Mhu6RswU6InYsmm5RE7l5xVCmB/hZJ0RW2shpqYabXlW42i
	fBffyPTv36S4Qlns2b+iCL/l24uI1bOBuGXQltDFQPovRAFIjjJLgObIXSeB6nrNsXn3
	R/h7c8XskL6RCm5k8ywS5O/5WpyqE/d7mzvxOLCKsehbiYJwG1T9Y3MaoA+KVRHuveox
	GoJotjxj7XvJlSNyVm6tnulFHYXWXDBI8dxMn3sYW5/BlzWhGsoZVYvjHGXWn/5yY+KD
	oaPDRbrymQv71sHZOwTu7gLbTNY1mAVCmaJ1hiUajo6Hs37IV9j7/ZX9BH2BVdz3Ihyh
	zgAQ==
X-Received: by 10.180.14.196 with SMTP id r4mr65528735wic.77.1425565021904;
	Thu, 05 Mar 2015 06:17:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	yr10sm7914005wjc.0.2015.03.05.06.17.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 06:17:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Mar 2015 15:17:06 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150305141706.GS2337@jama>
References: <1425518853-20124-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1425518853-20124-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/2] nodejs: Upgrade to 0.12.0
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
X-List-Received-Date: Thu, 05 Mar 2015 14:17:04 -0000
X-Groupsio-MsgNum: 54646
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3dBJfKlFjfsS/piO"
Content-Disposition: inline

--3dBJfKlFjfsS/piO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2015 at 01:27:32AM +0000, Khem Raj wrote:
> Tested on mips1
>=20
> Change-Id: I54211c2c323dbec1d38eb526ae183775ba3241f1
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb | 83 ++++++++++++++++++=
++++++
>  meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb | 44 -------------
>  2 files changed, 83 insertions(+), 44 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
>=20
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb b/meta-oe/r=
ecipes-devtools/nodejs/nodejs_0.12.0.bb
> new file mode 100644
> index 0000000..fae4b59
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb
> @@ -0,0 +1,83 @@
> +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> +HOMEPAGE =3D "http://nodejs.org"
> +LICENSE =3D "MIT & BSD & Artistic-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D14115ff11211df04b031ec7d40b6d=
31b"
> +
> +DEPENDS =3D "openssl"

This breaks cloud9, but I'm willing to take this (because cloud9 was
blocking all nodejs upgrades for too long already), but can you please
fix this first:

nodejs-0.12.0: nodejs-npm requires /bin/bash, but no providers in its
RDEPENDS [file-rdeps]

btw: is it time to remove nodejs4 as well if nobody steps-up to fix cloud9?

> +SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "62c8d9c74c8f68193f60e4cba020eb48"
> +SRC_URI[sha256sum] =3D "9700e23af4e9b3643af48cef5f2ad20a1331ff531a12154e=
ef2bfb0bb1682e32"
> +
> +S =3D "${WORKDIR}/node-v${PV}"
> +
> +# v8 errors out if you have set CCACHE
> +CCACHE =3D ""
> +
> +def map_nodejs_arch(a, d):
> +    import re
> +
> +    if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
> +    elif re.match('i.86$', a): return 'ia32'
> +    elif re.match('x86_64$', a): return 'x64'
> +    elif re.match('arm64$', a): return 'arm'
> +    return a
> +
> +ARCHFLAGS_arm =3D "${@bb.utils.contains('TUNE_FEATURES', 'callconvention=
-hard', '--with-arm-float-abi=3Dhard', '--with-arm-float-abi=3Dsoftfp', d)}"
> +GYP_DEFINES_append_mipsel =3D " mips_arch_variant=3D'r1' "
> +ARCHFLAGS ?=3D ""
> +
> +# Node is way too cool to use proper autotools, so we install two wrappe=
rs to forcefully inject proper arch cflags to workaround gypi
> +do_configure () {
> +    export LD=3D"${CXX}"
> +    GYP_DEFINES=3D"${GYP_DEFINES}" export GYP_DEFINES
> +    # $TARGET_ARCH settings don't match --dest-cpu settings
> +   ./configure --prefix=3D${prefix} --without-snapshot --shared-openssl \
> +               --dest-cpu=3D"${@map_nodejs_arch(d.getVar('TARGET_ARCH', =
True), d)}" \
> +               --dest-os=3Dlinux \
> +               ${ARCHFLAGS}
> +}
> +
> +do_compile () {
> +    export LD=3D"${CXX}"
> +    make BUILDTYPE=3DRelease
> +}
> +
> +do_install () {
> +    oe_runmake install DESTDIR=3D${D}
> +}
> +
> +do_install_append_class-native() {
> +    # use node from PATH instead of absolute path to sysroot
> +    # node-v0.10.25/tools/install.py is using:
> +    # shebang =3D os.path.join(node_prefix, 'bin/node')
> +    # update_shebang(link_path, shebang)
> +    # and node_prefix can be very long path to bindir in native sysroot =
and
> +    # when it exceeds 128 character shebang limit it's stripped to incor=
rect path
> +    # and npm fails to execute like in this case with 133 characters sho=
w in log.do_install:
> +    # updating shebang of /home/jenkins/workspace/build-webos-nightly/de=
vice/qemux86/label/open-webos-builder/BUILD-qemux86/work/x86_64-linux/nodej=
s-native/0.10.15-r0/image/home/jenkins/workspace/build-webos-nightly/device=
/qemux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/b=
in/npm to /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/=
open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/node
> +    # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.js
> +    # use sed on npm-cli.js because otherwise symlink is replaced with n=
ormal file and
> +    # npm-cli.js continues to use old shebang
> +    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${libdir}/node_modules/npm=
/bin/npm-cli.js
> +}
> +
> +do_install_append_class-target() {
> +    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${libdir}/node_modules/np=
m/bin/npm-cli.js
> +}
> +
> +RDEPENDS_${PN} =3D "curl"
> +RDEPENDS_${PN}_class-native =3D ""
> +
> +PACKAGES =3D+ "${PN}-npm"
> +FILES_${PN}-npm =3D "${libdir}/node_modules ${bindir}/npm"
> +RDEPENDS_${PN}-npm =3D "python-shell python-datetime python-subprocess p=
ython-textutils"
> +
> +PACKAGES =3D+ "${PN}-dtrace"
> +FILES_${PN}-dtrace =3D "${libdir}/dtrace"
> +
> +PACKAGES =3D+ "${PN}-systemtap"
> +FILES_${PN}-systemtap =3D "${datadir}/systemtap"
> +
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/r=
ecipes-devtools/nodejs/nodejs_0.8.18.bb
> deleted file mode 100644
> index 839bfa4..0000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -SUMMARY =3D "nodeJS Evented I/O for V8 JavaScript"
> -HOMEPAGE =3D "http://nodejs.org"
> -LICENSE =3D "MIT & BSD"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D95a589a3257ab7dfe37d8a8379e3c=
72d"
> -
> -DEPENDS =3D "openssl"
> -
> -inherit pythonnative
> -
> -SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> -           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-=
in-.patch \
> -"
> -SRC_URI[md5sum] =3D "25ed6aa5710ac46b867ff3f17a4da1d6"
> -SRC_URI[sha256sum] =3D "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda=
3b71306fe9ae00f9"
> -
> -S =3D "${WORKDIR}/node-v${PV}"
> -
> -# v8 errors out if you have set CCACHE
> -CCACHE =3D ""
> -
> -ARCHFLAGS_arm =3D "${@bb.utils.contains('TUNE_FEATURES', 'callconvention=
-hard', '--with-arm-float-abi=3Dhard', '--with-arm-float-abi=3Dsoftfp', d)}"
> -ARCHFLAGS ?=3D ""
> -
> -# Node is way too cool to use proper autotools, so we install two wrappe=
rs to forcefully inject proper arch cflags to workaround gypi
> -do_configure () {
> -    export LD=3D"${CXX}"
> -
> -    ./configure --prefix=3D${prefix} --without-snapshot ${ARCHFLAGS}
> -}
> -
> -do_compile () {
> -    export LD=3D"${CXX}"
> -    make BUILDTYPE=3DRelease
> -}
> -
> -do_install () {
> -    oe_runmake install DESTDIR=3D${D}
> -}
> -
> -RDEPENDS_${PN} =3D "curl python-shell python-datetime python-subprocess =
python-crypt python-textutils python-netclient "
> -RDEPENDS_${PN}_class-native =3D ""
> -
> -FILES_${PN} +=3D "${libdir}/node/wafadmin ${libdir}/node_modules ${libdi=
r}/dtrace ${libdir}/*"
> -BBCLASSEXTEND =3D "native"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3dBJfKlFjfsS/piO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT4ZWIACgkQN1Ujt2V2gByQfACfS+zMNYucBzggu1ZKu4jk4cxY
ADMAn1mxTn6rxGpL06nocbZ9oBO8lWPr
=Mbp6
-----END PGP SIGNATURE-----

--3dBJfKlFjfsS/piO--
