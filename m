Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3885360761
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:22:23 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so182524741wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 09:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yLiWsUKPJaK9t6sj1VrXXEyRrnxTzIJHwDPNSDpZP4c=;
	b=M8tYO8/wwF4GiQlso/ghh/pXWHwuVRUq0ACdr4y7nUi7jamoR2OOqRpRuSqjoLH07e
	rBjroubziyHHxV4t+nSRHRA8CEqmmdDKkKZqj6uH8rLsWgTTPkl7AI+OxNGZs3LDeoKv
	V6uEGJxZEE6m8S/ZIKj8zjThsTAAh6bOTa/jOhHsC02jtB4Pwi1SvdpAtF5tTpJ38s8o
	ykUuMr2Xiyq5p+uCpCarwj0CN/7qUefCC2n4AD6/Fjvwmiq7JWlI0/vLwjATCuNulkJF
	/Q3rl5w/RrSq9fpPROh1w/yIwACLgIIMfFuRfNADZcZEkj752KL8pWfZdFBpN3tt9LU7
	dhxg==
MIME-Version: 1.0
X-Received: by 10.28.142.205 with SMTP id q196mr39345269wmd.42.1448990543325; 
	Tue, 01 Dec 2015 09:22:23 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Tue, 1 Dec 2015 09:22:23 -0800 (PST)
In-Reply-To: <1448990151-27720-2-git-send-email-twoerner@gmail.com>
References: <1448990151-27720-1-git-send-email-twoerner@gmail.com>
	<1448990151-27720-2-git-send-email-twoerner@gmail.com>
Date: Tue, 1 Dec 2015 18:22:23 +0100
Message-ID: <CA+chaQfVj-tTBhe-5SbVCrYuzA9h0TdmvN44cEvvQkAKpQGRGw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] nodejs: cleanup
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
X-List-Received-Date: Tue, 01 Dec 2015 17:22:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> A user would
naturally assume nodejs4 would be for the latest stable, but they would be
wrong. Nodejs4 refers to version 0.4.12.

It was using different recipe name intentionally, because both versions
were meant to be built and installed in parallel, because some other
recipes (like cloud9 mentioned in PNBLACKLIST) were (maybe still are) only
with the older version 0.4.*.

As it was already PNBLACKLISTed I wouldn't mind removing it completely and
replacing 0.12.7 with new version (without introducing the .inc) file.

One-version-to-rule-them-all is even more useful here as different nodejs
versions aren't compatible with other recipes, so you cannot just change
PREFERRED_VERSION and hope to build world.

Regards,

On Tue, Dec 1, 2015 at 6:15 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> Currently the latest stable version of node.js is 4.2.2. Also, currently,
> there are two nodejs recipes: one for nodejs and one for nodejs4. A user
> would
> naturally assume nodejs4 would be for the latest stable, but they would b=
e
> wrong. Nodejs4 refers to version 0.4.12.
>
> Cleanup the node recipes such that there are two nodejs recipes from whic=
h
> to
> choose. A user can select between them using the regular
> PREFERRED_VERSION_nodejs notation.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  .../enable-armv5e-build.patch                      |  0
>  .../{nodejs =3D> nodejs-0.12.7}/no-registry.patch    |  0
>  .../libev-cross-cc_0.4.12.patch                    |  0
>  meta-oe/recipes-devtools/nodejs/nodejs.inc         | 80
> ++++++++++++++++++++++
>  meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb   | 74
> +-------------------
>  .../nodejs/{nodejs4_0.4.12.bb =3D> nodejs_0.4.12.bb} |  2 +-
>  6 files changed, 83 insertions(+), 73 deletions(-)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs =3D>
> nodejs-0.12.7}/enable-armv5e-build.patch (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs =3D>
> nodejs-0.12.7}/no-registry.patch (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs4 =3D>
> nodejs-0.4.12}/libev-cross-cc_0.4.12.patch (100%)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs.inc
>  rename meta-oe/recipes-devtools/nodejs/{nodejs4_0.4.12.bb =3D>
> nodejs_0.4.12.bb} (87%)
>
> diff --git
> a/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
> b/meta-oe/recipes-devtools/nodejs/nodejs-0.12.7/enable-armv5e-build.patch
> similarity index 100%
> rename from
> meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
> rename to
> meta-oe/recipes-devtools/nodejs/nodejs-0.12.7/enable-armv5e-build.patch
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/no-registry.patch
> b/meta-oe/recipes-devtools/nodejs/nodejs-0.12.7/no-registry.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/nodejs/nodejs/no-registry.patch
> rename to meta-oe/recipes-devtools/nodejs/nodejs-0.12.7/no-registry.patch
> diff --git
> a/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
> b/meta-oe/recipes-devtools/nodejs/nodejs-0.4.12/libev-cross-cc_0.4.12.pat=
ch
> similarity index 100%
> rename from
> meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
> rename to
> meta-oe/recipes-devtools/nodejs/nodejs-0.4.12/libev-cross-cc_0.4.12.patch
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs.inc
> b/meta-oe/recipes-devtools/nodejs/nodejs.inc
> new file mode 100644
> index 0000000..41eb5ee
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs.inc
> @@ -0,0 +1,80 @@
> +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> +HOMEPAGE =3D "http://nodejs.org"
> +LICENSE =3D "MIT & BSD & Artistic-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D14115ff11211df04b031ec7d40b6d=
31b"
> +
> +DEPENDS =3D "openssl"
> +
> +SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> +    file://enable-armv5e-build.patch \
> +    file://no-registry.patch \
> +"
> +SRC_URI[md5sum] =3D "5523ec4347d7fe6b0f6dda1d1c7799d5"
> +SRC_URI[sha256sum] =3D
> "b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d"
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
> +ARCHFLAGS_arm =3D "${@bb.utils.contains('TUNE_FEATURES',
> 'callconvention-hard', '--with-arm-float-abi=3Dhard',
> '--with-arm-float-abi=3Dsoftfp', d)}"
> +GYP_DEFINES_append_mipsel =3D " mips_arch_variant=3D'r1' "
> +ARCHFLAGS ?=3D ""
> +
> +# Node is way too cool to use proper autotools, so we install two
> wrappers to forcefully inject proper arch cflags to workaround gypi
> +do_configure () {
> +    export LD=3D"${CXX}"
> +    GYP_DEFINES=3D"${GYP_DEFINES}" export GYP_DEFINES
> +    # $TARGET_ARCH settings don't match --dest-cpu settings
> +   ./configure --prefix=3D${prefix} --without-snapshot --shared-openssl =
\
> +               --dest-cpu=3D"${@map_nodejs_arch(d.getVar('TARGET_ARCH',
> True), d)}" \
> +               --dest-os=3Dlinux \
> +               ${ARCHFLAGS}
> +}
> +
> +do_compile () {
> +    export LD=3D"${CXX}"
> +    oe_runmake BUILDTYPE=3DRelease
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
> +    # and node_prefix can be very long path to bindir in native sysroot
> and
> +    # when it exceeds 128 character shebang limit it's stripped to
> incorrect path
> +    # and npm fails to execute like in this case with 133 characters sho=
w
> in log.do_install:
> +    # updating shebang of
> /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-web=
os-builder/BUILD-qemux86/work/x86_64-linux/nodejs-native/0.10.15-r0/image/h=
ome/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-b=
uilder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/npm
> to
> /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-web=
os-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/node
> +    # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.j=
s
> +    # use sed on npm-cli.js because otherwise symlink is replaced with
> normal file and
> +    # npm-cli.js continues to use old shebang
> +    sed "1s^.*^#\!/usr/bin/env node^g" -i
> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +}
> +
> +do_install_append_class-target() {
> +    sed "1s^.*^#\!${bindir}/env node^g" -i
> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +}
> +
> +PACKAGES =3D+ "${PN}-npm"
> +FILES_${PN}-npm =3D "${exec_prefix}/lib/node_modules ${bindir}/npm"
> +RDEPENDS_${PN}-npm =3D "bash python-shell python-datetime python-subproc=
ess
> python-textutils"
> +
> +PACKAGES =3D+ "${PN}-systemtap"
> +FILES_${PN}-systemtap =3D "${datadir}/systemtap"
> +
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
> index 41eb5ee..f9d3f04 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
> @@ -1,9 +1,6 @@
> -DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> -HOMEPAGE =3D "http://nodejs.org"
> -LICENSE =3D "MIT & BSD & Artistic-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D14115ff11211df04b031ec7d40b6d=
31b"
> +require nodejs.inc
>
> -DEPENDS =3D "openssl"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D14115ff11211df04b031ec7d40b6d=
31b"
>
>  SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
>      file://enable-armv5e-build.patch \
> @@ -11,70 +8,3 @@ SRC_URI =3D "
> http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
>  "
>  SRC_URI[md5sum] =3D "5523ec4347d7fe6b0f6dda1d1c7799d5"
>  SRC_URI[sha256sum] =3D
> "b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d"
> -
> -S =3D "${WORKDIR}/node-v${PV}"
> -
> -# v8 errors out if you have set CCACHE
> -CCACHE =3D ""
> -
> -def map_nodejs_arch(a, d):
> -    import re
> -
> -    if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
> -    elif re.match('i.86$', a): return 'ia32'
> -    elif re.match('x86_64$', a): return 'x64'
> -    elif re.match('arm64$', a): return 'arm'
> -    return a
> -
> -ARCHFLAGS_arm =3D "${@bb.utils.contains('TUNE_FEATURES',
> 'callconvention-hard', '--with-arm-float-abi=3Dhard',
> '--with-arm-float-abi=3Dsoftfp', d)}"
> -GYP_DEFINES_append_mipsel =3D " mips_arch_variant=3D'r1' "
> -ARCHFLAGS ?=3D ""
> -
> -# Node is way too cool to use proper autotools, so we install two
> wrappers to forcefully inject proper arch cflags to workaround gypi
> -do_configure () {
> -    export LD=3D"${CXX}"
> -    GYP_DEFINES=3D"${GYP_DEFINES}" export GYP_DEFINES
> -    # $TARGET_ARCH settings don't match --dest-cpu settings
> -   ./configure --prefix=3D${prefix} --without-snapshot --shared-openssl =
\
> -               --dest-cpu=3D"${@map_nodejs_arch(d.getVar('TARGET_ARCH',
> True), d)}" \
> -               --dest-os=3Dlinux \
> -               ${ARCHFLAGS}
> -}
> -
> -do_compile () {
> -    export LD=3D"${CXX}"
> -    oe_runmake BUILDTYPE=3DRelease
> -}
> -
> -do_install () {
> -    oe_runmake install DESTDIR=3D${D}
> -}
> -
> -do_install_append_class-native() {
> -    # use node from PATH instead of absolute path to sysroot
> -    # node-v0.10.25/tools/install.py is using:
> -    # shebang =3D os.path.join(node_prefix, 'bin/node')
> -    # update_shebang(link_path, shebang)
> -    # and node_prefix can be very long path to bindir in native sysroot
> and
> -    # when it exceeds 128 character shebang limit it's stripped to
> incorrect path
> -    # and npm fails to execute like in this case with 133 characters sho=
w
> in log.do_install:
> -    # updating shebang of
> /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-web=
os-builder/BUILD-qemux86/work/x86_64-linux/nodejs-native/0.10.15-r0/image/h=
ome/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-b=
uilder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/npm
> to
> /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-web=
os-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/node
> -    # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.j=
s
> -    # use sed on npm-cli.js because otherwise symlink is replaced with
> normal file and
> -    # npm-cli.js continues to use old shebang
> -    sed "1s^.*^#\!/usr/bin/env node^g" -i
> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> -}
> -
> -do_install_append_class-target() {
> -    sed "1s^.*^#\!${bindir}/env node^g" -i
> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> -}
> -
> -PACKAGES =3D+ "${PN}-npm"
> -FILES_${PN}-npm =3D "${exec_prefix}/lib/node_modules ${bindir}/npm"
> -RDEPENDS_${PN}-npm =3D "bash python-shell python-datetime python-subproc=
ess
> python-textutils"
> -
> -PACKAGES =3D+ "${PN}-systemtap"
> -FILES_${PN}-systemtap =3D "${datadir}/systemtap"
> -
> -
> -BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
> similarity index 87%
> rename from meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
> index c73cefc..0525143 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dd6237f3a840aef5b7880fb4e49eecfe5"
>
>  DEPENDS =3D "openssl"
>
> -PNBLACKLIST[nodejs4] ?=3D "Used only by currently blacklisted cloud9 and
> fails to build for qemuarm with thumb: error: #error For thumb
> inter-working we require an architecture which supports blx"
> +PNBLACKLIST[nodejs_0.4.12] ?=3D "Used only by currently blacklisted clou=
d9
> and fails to build for qemuarm with thumb: error: #error For thumb
> inter-working we require an architecture which supports blx"
>
>  SRC_URI =3D " \
>      http://nodejs.org/dist/node-v${PV}.tar.gz \
> --
> 2.6.0.rc3
>
>

