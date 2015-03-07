Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 349BC6013D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Mar 2015 10:25:24 +0000 (UTC)
Received: by wesu56 with SMTP id u56so64141542wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Mar 2015 02:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ncbgzFFGDEYQXtRytro/o+bxHYTy6So2e4NHehjjQMY=;
	b=ezdjysadyr/xmrWP6YjIGL4xBqYvscKRwt3dseqT/Aa7KILhDdXQb6hm3zERpLlGsr
	z1GANNoIu52on2CgNSRoW+htM9qs+kCJdxlQcWofjgdfp8FPiIsaPGnUZcOu5CKS/e4J
	QpGUC8vPB7+kVuawcIHtfFHlh+oxIMLcgmIua9mM1uA3JC7lD4OukFArUqGCyVPjW5mu
	hBwOpv3KpLfIpIV3VHYkZWf6y17DCs2XkJClBfbpO6ICGSR9VJugHraWfMRfk36cKAMe
	qmmmbx00RBN3nfK5fTie7+k/AvxVy0wI2Bo4eI37r+ikdoik2FpdFoE/rleaepp3E6TU
	TEkA==
X-Received: by 10.180.126.98 with SMTP id mx2mr83657077wib.18.1425723925672;
	Sat, 07 Mar 2015 02:25:25 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dj4sm18786615wjc.13.2015.03.07.02.25.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Mar 2015 02:25:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 7 Mar 2015 11:25:31 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150307102531.GH2337@jama>
References: <1425518853-20124-1-git-send-email-raj.khem@gmail.com>
	<20150305141706.GS2337@jama>
MIME-Version: 1.0
In-Reply-To: <20150305141706.GS2337@jama>
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
X-List-Received-Date: Sat, 07 Mar 2015 10:25:25 -0000
X-Groupsio-MsgNum: 54675
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NJ866PXMcXz+O0Zc"
Content-Disposition: inline

--NJ866PXMcXz+O0Zc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2015 at 03:17:06PM +0100, Martin Jansa wrote:
> On Thu, Mar 05, 2015 at 01:27:32AM +0000, Khem Raj wrote:
> > Tested on mips1
> >=20
> > Change-Id: I54211c2c323dbec1d38eb526ae183775ba3241f1
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb | 83 ++++++++++++++++=
++++++++
> >  meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb | 44 -------------
> >  2 files changed, 83 insertions(+), 44 deletions(-)
> >  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb
> >  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> >=20
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb b/meta-oe=
/recipes-devtools/nodejs/nodejs_0.12.0.bb
> > new file mode 100644
> > index 0000000..fae4b59
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb
> > @@ -0,0 +1,83 @@
> > +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> > +HOMEPAGE =3D "http://nodejs.org"
> > +LICENSE =3D "MIT & BSD & Artistic-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D14115ff11211df04b031ec7d40b=
6d31b"
> > +
> > +DEPENDS =3D "openssl"
>=20
> This breaks cloud9, but I'm willing to take this (because cloud9 was
> blocking all nodejs upgrades for too long already), but can you please
> fix this first:
>=20
> nodejs-0.12.0: nodejs-npm requires /bin/bash, but no providers in its
> RDEPENDS [file-rdeps]
>=20
> btw: is it time to remove nodejs4 as well if nobody steps-up to fix cloud=
9?

It also fails for arm devices with thumb enabled:

| In file included from ../deps/v8/src/base/atomicops.h:146:0,
|                  from ../deps/v8/src/base/once.h:55,
|                  from ../deps/v8/src/base/lazy-instance.h:72,
|                  from ../deps/v8/src/base/platform/mutex.h:8,
|                  from ../deps/v8/src/base/platform/platform.h:29,
|                  from ../deps/v8/src/assert-scope.h:9,
|                  from ../deps/v8/src/v8.h:33,
|                  from ../deps/v8/src/accessors.cc:5:
| ../deps/v8/src/base/atomicops_internals_arm_gcc.h:258:4: error: #error "Y=
our CPU's ARM architecture is not supported yet"
|  #  error "Your CPU's ARM architecture is not supported yet"
|     ^

but the same problem existed in old nodejs and nodejs4 already, I think it =
started to fail after:
http://git.openembedded.org/openembedded-core/commit/?id=3D3e760031f91fb87c=
3e2f62b77a117eb41164f259

whole log:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20150305_21=
3704.log/3_min/failed/nodejs.log

> > +SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
> > +SRC_URI[md5sum] =3D "62c8d9c74c8f68193f60e4cba020eb48"
> > +SRC_URI[sha256sum] =3D "9700e23af4e9b3643af48cef5f2ad20a1331ff531a1215=
4eef2bfb0bb1682e32"
> > +
> > +S =3D "${WORKDIR}/node-v${PV}"
> > +
> > +# v8 errors out if you have set CCACHE
> > +CCACHE =3D ""
> > +
> > +def map_nodejs_arch(a, d):
> > +    import re
> > +
> > +    if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
> > +    elif re.match('i.86$', a): return 'ia32'
> > +    elif re.match('x86_64$', a): return 'x64'
> > +    elif re.match('arm64$', a): return 'arm'
> > +    return a
> > +
> > +ARCHFLAGS_arm =3D "${@bb.utils.contains('TUNE_FEATURES', 'callconventi=
on-hard', '--with-arm-float-abi=3Dhard', '--with-arm-float-abi=3Dsoftfp', d=
)}"
> > +GYP_DEFINES_append_mipsel =3D " mips_arch_variant=3D'r1' "
> > +ARCHFLAGS ?=3D ""
> > +
> > +# Node is way too cool to use proper autotools, so we install two wrap=
pers to forcefully inject proper arch cflags to workaround gypi
> > +do_configure () {
> > +    export LD=3D"${CXX}"
> > +    GYP_DEFINES=3D"${GYP_DEFINES}" export GYP_DEFINES
> > +    # $TARGET_ARCH settings don't match --dest-cpu settings
> > +   ./configure --prefix=3D${prefix} --without-snapshot --shared-openss=
l \
> > +               --dest-cpu=3D"${@map_nodejs_arch(d.getVar('TARGET_ARCH'=
, True), d)}" \
> > +               --dest-os=3Dlinux \
> > +               ${ARCHFLAGS}
> > +}
> > +
> > +do_compile () {
> > +    export LD=3D"${CXX}"
> > +    make BUILDTYPE=3DRelease
> > +}
> > +
> > +do_install () {
> > +    oe_runmake install DESTDIR=3D${D}
> > +}
> > +
> > +do_install_append_class-native() {
> > +    # use node from PATH instead of absolute path to sysroot
> > +    # node-v0.10.25/tools/install.py is using:
> > +    # shebang =3D os.path.join(node_prefix, 'bin/node')
> > +    # update_shebang(link_path, shebang)
> > +    # and node_prefix can be very long path to bindir in native sysroo=
t and
> > +    # when it exceeds 128 character shebang limit it's stripped to inc=
orrect path
> > +    # and npm fails to execute like in this case with 133 characters s=
how in log.do_install:
> > +    # updating shebang of /home/jenkins/workspace/build-webos-nightly/=
device/qemux86/label/open-webos-builder/BUILD-qemux86/work/x86_64-linux/nod=
ejs-native/0.10.15-r0/image/home/jenkins/workspace/build-webos-nightly/devi=
ce/qemux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr=
/bin/npm to /home/jenkins/workspace/build-webos-nightly/device/qemux86/labe=
l/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/node
> > +    # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli=
=2Ejs
> > +    # use sed on npm-cli.js because otherwise symlink is replaced with=
 normal file and
> > +    # npm-cli.js continues to use old shebang
> > +    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${libdir}/node_modules/n=
pm/bin/npm-cli.js
> > +}
> > +
> > +do_install_append_class-target() {
> > +    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${libdir}/node_modules/=
npm/bin/npm-cli.js
> > +}
> > +
> > +RDEPENDS_${PN} =3D "curl"
> > +RDEPENDS_${PN}_class-native =3D ""
> > +
> > +PACKAGES =3D+ "${PN}-npm"
> > +FILES_${PN}-npm =3D "${libdir}/node_modules ${bindir}/npm"
> > +RDEPENDS_${PN}-npm =3D "python-shell python-datetime python-subprocess=
 python-textutils"
> > +
> > +PACKAGES =3D+ "${PN}-dtrace"
> > +FILES_${PN}-dtrace =3D "${libdir}/dtrace"
> > +
> > +PACKAGES =3D+ "${PN}-systemtap"
> > +FILES_${PN}-systemtap =3D "${datadir}/systemtap"
> > +
> > +
> > +BBCLASSEXTEND =3D "native"
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe=
/recipes-devtools/nodejs/nodejs_0.8.18.bb
> > deleted file mode 100644
> > index 839bfa4..0000000
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -SUMMARY =3D "nodeJS Evented I/O for V8 JavaScript"
> > -HOMEPAGE =3D "http://nodejs.org"
> > -LICENSE =3D "MIT & BSD"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D95a589a3257ab7dfe37d8a8379e=
3c72d"
> > -
> > -DEPENDS =3D "openssl"
> > -
> > -inherit pythonnative
> > -
> > -SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> > -           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-whe=
n-in-.patch \
> > -"
> > -SRC_URI[md5sum] =3D "25ed6aa5710ac46b867ff3f17a4da1d6"
> > -SRC_URI[sha256sum] =3D "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1d=
da3b71306fe9ae00f9"
> > -
> > -S =3D "${WORKDIR}/node-v${PV}"
> > -
> > -# v8 errors out if you have set CCACHE
> > -CCACHE =3D ""
> > -
> > -ARCHFLAGS_arm =3D "${@bb.utils.contains('TUNE_FEATURES', 'callconventi=
on-hard', '--with-arm-float-abi=3Dhard', '--with-arm-float-abi=3Dsoftfp', d=
)}"
> > -ARCHFLAGS ?=3D ""
> > -
> > -# Node is way too cool to use proper autotools, so we install two wrap=
pers to forcefully inject proper arch cflags to workaround gypi
> > -do_configure () {
> > -    export LD=3D"${CXX}"
> > -
> > -    ./configure --prefix=3D${prefix} --without-snapshot ${ARCHFLAGS}
> > -}
> > -
> > -do_compile () {
> > -    export LD=3D"${CXX}"
> > -    make BUILDTYPE=3DRelease
> > -}
> > -
> > -do_install () {
> > -    oe_runmake install DESTDIR=3D${D}
> > -}
> > -
> > -RDEPENDS_${PN} =3D "curl python-shell python-datetime python-subproces=
s python-crypt python-textutils python-netclient "
> > -RDEPENDS_${PN}_class-native =3D ""
> > -
> > -FILES_${PN} +=3D "${libdir}/node/wafadmin ${libdir}/node_modules ${lib=
dir}/dtrace ${libdir}/*"
> > -BBCLASSEXTEND =3D "native"
> > --=20
> > 2.1.4
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NJ866PXMcXz+O0Zc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT60hsACgkQN1Ujt2V2gBw/+gCfSbIESPflUqIGpSPXRxPwCyOX
DjIAn3e7z7BZVo5XO+l/hCrkt6A8baoN
=oWA6
-----END PGP SIGNATURE-----

--NJ866PXMcXz+O0Zc--
