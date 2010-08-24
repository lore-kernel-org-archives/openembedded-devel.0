Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OniAI-0008MY-Cl
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 03:19:20 +0200
Received: by wyb36 with SMTP id 36so15057wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 18:18:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.0.76 with SMTP id 54mr138733wea.38.1282612717205; Mon, 23
	Aug 2010 18:18:37 -0700 (PDT)
Received: by 10.216.206.138 with HTTP; Mon, 23 Aug 2010 18:18:37 -0700 (PDT)
In-Reply-To: <1282447709-15130-1-git-send-email-coolaj86@gmail.com>
References: <1282447709-15130-1-git-send-email-coolaj86@gmail.com>
Date: Mon, 23 Aug 2010 21:18:37 -0400
Message-ID: <AANLkTimDtHVY_9SV_2qC_UAs17bED0Z4UBDqRKs_V76B@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] [v2] added recipe for nodejs
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
X-List-Received-Date: Tue, 24 Aug 2010 01:19:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 21, 2010 at 11:28 PM, AJ ONeal <coolaj86@gmail.com> wrote:
> ---
> =A0recipes/nodejs/files/libev-cross-cc.patch =A0 =A0 =A0 =A0 =A0| =A0 18 =
++++++++++++
> =A0recipes/nodejs/files/node-cross-cc.patch =A0 =A0 =A0 =A0 =A0 | =A0 14 =
++++++++++
> =A0.../node-dont-include-hosts-usr-include.patch =A0 =A0 =A0| =A0 22 ++++=
+++++++++++
> =A0recipes/nodejs/nodejs_0.2.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 28 ++++++++++++++++++++
> =A04 files changed, 82 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/nodejs/files/libev-cross-cc.patch
> =A0create mode 100644 recipes/nodejs/files/node-cross-cc.patch
> =A0create mode 100644 recipes/nodejs/files/node-dont-include-hosts-usr-in=
clude.patch
> =A0create mode 100644 recipes/nodejs/nodejs_0.2.0.bb
>
> diff --git a/recipes/nodejs/files/libev-cross-cc.patch b/recipes/nodejs/f=
iles/libev-cross-cc.patch
> new file mode 100644
> index 0000000..446015b
> --- /dev/null
> +++ b/recipes/nodejs/files/libev-cross-cc.patch
> @@ -0,0 +1,18 @@
> +diff --git node-v0.2.0/deps/libev/wscript.orig node-v0.2.0/deps/libev/ws=
cript
> +index 19e7bb2..f0a3d3b 100644
> +--- node-v0.2.0/deps/libev/wscript.orig
> ++++ node-v0.2.0/deps/libev/wscript
> +@@ -52,7 +52,12 @@ def configure(conf):
> + =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> + =A0 """
> +- =A0conf.check_cc(fragment=3Dcode, define_name=3D"HAVE_CLOCK_SYSCALL", =
execute=3DTrue,
> ++ =A0# TODO determine this dynamically
> ++ =A0CROSS =3D True
> ++ =A0execute =3D True
> ++ =A0if CROSS:
> ++ =A0 =A0execute =3D False
> ++ =A0conf.check_cc(fragment=3Dcode, define_name=3D"HAVE_CLOCK_SYSCALL", =
execute=3Dexecute,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 msg=3D"Checking for SYS_clock_gettime")
> +
> + =A0 have_librt =3D conf.check(lib=3D'rt', uselib_store=3D'RT')
> diff --git a/recipes/nodejs/files/node-cross-cc.patch b/recipes/nodejs/fi=
les/node-cross-cc.patch
> new file mode 100644
> index 0000000..48a6226
> --- /dev/null
> +++ b/recipes/nodejs/files/node-cross-cc.patch
> @@ -0,0 +1,14 @@
> +diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
> +index df9ef53..a55d464 100644
> +--- node-v0.2.0/wscript.orig
> ++++ node-v0.2.0/wscript
> +@@ -326,6 +326,9 @@ def v8_cmd(bld, variant):
> + =A0 arch =3D ""
> + =A0 if bld.env['DEST_CPU'] =3D=3D 'x86_64':
> + =A0 =A0 arch =3D "arch=3Dx64"
> ++ =A0# XXX Better support cross-compilation
> ++ =A0else:
> ++ =A0 =A0arch =3D "arch=3D" + bld.env['DEST_CPU']
> +
> + =A0 if variant =3D=3D "default":
> + =A0 =A0 mode =3D "release"
> diff --git a/recipes/nodejs/files/node-dont-include-hosts-usr-include.pat=
ch b/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
> new file mode 100644
> index 0000000..edbf7c4
> --- /dev/null
> +++ b/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
> @@ -0,0 +1,22 @@
> +diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
> +index 3c5ebc5..905bd58 100644
> +--- node-v0.2.0/wscript.orig
> ++++ node-v0.2.0/wscript
> +@@ -162,11 +162,12 @@ def configure(conf):
> + =A0 if Options.options.efence:
> + =A0 =A0 conf.check(lib=3D'efence', libpath=3D['/usr/lib', '/usr/local/l=
ib'], uselib_store=3D'EFENCE')
> +
> +- =A0if not conf.check(lib=3D"execinfo", includes=3D['/usr/include', '/u=
sr/local/include'], libpath=3D['/usr/lib', '/usr/local/lib'], uselib_store=
=3D"EXECINFO"):
> +- =A0 =A0# Note on Darwin/OS X: This will fail, but will still be used a=
s the
> +- =A0 =A0# execinfo stuff are part of the standard library.
> +- =A0 =A0if sys.platform.startswith("freebsd"):
> +- =A0 =A0 =A0conf.fatal("Install the libexecinfo port from /usr/ports/de=
vel/libexecinfo.")
> ++ =A0# OpenEmbedded doesn't like us checking here
> ++ =A0#if not conf.check(lib=3D"execinfo", includes=3D['/usr/include', '/=
usr/local/include'], libpath=3D['/usr/lib', '/usr/local/lib'], uselib_store=
=3D"EXECINFO"):
> ++ =A0# =A0# Note on Darwin/OS X: This will fail, but will still be used =
as the
> ++ =A0# =A0# execinfo stuff are part of the standard library.
> ++ =A0# =A0if sys.platform.startswith("freebsd"):
> ++ =A0# =A0 =A0conf.fatal("Install the libexecinfo port from /usr/ports/d=
evel/libexecinfo.")
> +
> + =A0 if not Options.options.without_ssl:
> + =A0 =A0 if conf.check_cfg(package=3D'openssl',
> diff --git a/recipes/nodejs/nodejs_0.2.0.bb b/recipes/nodejs/nodejs_0.2.0=
.bb
> new file mode 100644
> index 0000000..83bfa2e
> --- /dev/null
> +++ b/recipes/nodejs/nodejs_0.2.0.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> +HOMEPAGE =3D "http://nodejs.org"
> +LICENSE =3D "MIT"
> +DEPENDS =3D "openssl"
> +SRC_URI =3D " \
> + =A0http://nodejs.org/dist/node-v${PV}.tar.gz \
> + =A0file://node-cross-cc.patch \
> + =A0file://libev-cross-cc.patch \
> + =A0file://node-dont-include-hosts-usr-include.patch \
> +"
> +#file://libev-arm-cross.patch \
> +SRC_URI[md5sum] =3D "99a6dacc44b3f9c6ec376ccb446dd0b8"
> +SRC_URI[sha256sum] =3D "3d3eff9287c9917af4044f3cef99ae5b17946710a71e8303=
9de4fcb4b0a26631"
> +S =3D "${WORKDIR}/node-v${PV}"
> +do_configure () {
> + =A0./configure --prefix=3D${D} --without-snapshot
> +}
> +do_compile () {
> + =A0make
> +}
> +do_install () {
> + =A0#oe_runmake install # doesn't install to correct location
> +
> + =A0# This works
> + =A0install -d ${D}${bindir}/
> + =A0install -m 0755 ${S}/node ${D}${bindir}/
> +}
> +FILES_${PN} =3D "${bindir}/node"
> --
> 1.6.0.4

I confirmed that this builds fine--haven't run-tested it yet.  'git
am' gave me some trailing whitespace warnings, but I can't otherwise
comment on the patch.


