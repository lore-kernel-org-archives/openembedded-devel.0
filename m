Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OnguD-0006bW-Um for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 01:58:27 +0200
Received: from e178249013.adsl.alicedsl.de ([85.178.249.13]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ongtq-0003bD-Vw for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 23:57:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinbVA1Cj2arRmrANWQH_VFMnhZ2x7i=LHdnNWp7@mail.gmail.com>
References: <1282447709-15130-1-git-send-email-coolaj86@gmail.com>
	<AANLkTinbVA1Cj2arRmrANWQH_VFMnhZ2x7i=LHdnNWp7@mail.gmail.com>
Date: Tue, 24 Aug 2010 01:57:56 +0200
Message-ID: <1282607876.3775.33.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
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
X-List-Received-Date: Mon, 23 Aug 2010 23:58:27 -0000
X-Groupsio-MsgNum: 22592
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-JE/uffPbQCXfUbr/3lHp"

--=-JE/uffPbQCXfUbr/3lHp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear AJ,


sorry I overlooked that message. I will reply to your other message
tomorrow.


Am Montag, den 23.08.2010, 17:22 -0600 schrieb AJ ONeal:
> bump
>=20
> AJ ONeal
>=20
> On Sat, Aug 21, 2010 at 9:28 PM, AJ ONeal <coolaj86@gmail.com> wrote:
>=20
> > ---

After this line a short summary of the changes compared to previous
iterations would be great. Git will ignore this when applying the patch
but it eases the work of the reviewers.

> >  recipes/nodejs/files/libev-cross-cc.patch          |   18 ++++++++++++
> >  recipes/nodejs/files/node-cross-cc.patch           |   14 ++++++++++
> >  .../node-dont-include-hosts-usr-include.patch      |   22 ++++++++++++=
+++
> >  recipes/nodejs/nodejs_0.2.0.bb                     |   28
> > ++++++++++++++++++++
> >  4 files changed, 82 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/nodejs/files/libev-cross-cc.patch
> >  create mode 100644 recipes/nodejs/files/node-cross-cc.patch
> >  create mode 100644
> > recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
> >  create mode 100644 recipes/nodejs/nodejs_0.2.0.bb
> >
> > diff --git a/recipes/nodejs/files/libev-cross-cc.patch
> > b/recipes/nodejs/files/libev-cross-cc.patch
> > new file mode 100644
> > index 0000000..446015b
> > --- /dev/null
> > +++ b/recipes/nodejs/files/libev-cross-cc.patch
> > @@ -0,0 +1,18 @@
> > +diff --git node-v0.2.0/deps/libev/wscript.orig
> > node-v0.2.0/deps/libev/wscript
> > +index 19e7bb2..f0a3d3b 100644
> > +--- node-v0.2.0/deps/libev/wscript.orig
> > ++++ node-v0.2.0/deps/libev/wscript
> > +@@ -52,7 +52,12 @@ def configure(conf):
> > +           return 0;
> > +       }
> > +   """
> > +-  conf.check_cc(fragment=3Dcode, define_name=3D"HAVE_CLOCK_SYSCALL",
> > execute=3DTrue,
> > ++  # TODO determine this dynamically
> > ++  CROSS =3D True
> > ++  execute =3D True
> > ++  if CROSS:
> > ++    execute =3D False
> > ++  conf.check_cc(fragment=3Dcode, define_name=3D"HAVE_CLOCK_SYSCALL",
> > execute=3Dexecute,
> > +                 msg=3D"Checking for SYS_clock_gettime")
> > +
> > +   have_librt =3D conf.check(lib=3D'rt', uselib_store=3D'RT')
> > diff --git a/recipes/nodejs/files/node-cross-cc.patch
> > b/recipes/nodejs/files/node-cross-cc.patch
> > new file mode 100644
> > index 0000000..48a6226
> > --- /dev/null
> > +++ b/recipes/nodejs/files/node-cross-cc.patch
> > @@ -0,0 +1,14 @@
> > +diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
> > +index df9ef53..a55d464 100644
> > +--- node-v0.2.0/wscript.orig
> > ++++ node-v0.2.0/wscript
> > +@@ -326,6 +326,9 @@ def v8_cmd(bld, variant):
> > +   arch =3D ""
> > +   if bld.env['DEST_CPU'] =3D=3D 'x86_64':
> > +     arch =3D "arch=3Dx64"
> > ++  # XXX Better support cross-compilation
> > ++  else:
> > ++    arch =3D "arch=3D" + bld.env['DEST_CPU']
> > +
> > +   if variant =3D=3D "default":
> > +     mode =3D "release"
> > diff --git a/recipes/nodejs/files/node-dont-include-hosts-usr-include.p=
atch
> > b/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
> > new file mode 100644
> > index 0000000..edbf7c4
> > --- /dev/null
> > +++ b/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
> > @@ -0,0 +1,22 @@
> > +diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
> > +index 3c5ebc5..905bd58 100644
> > +--- node-v0.2.0/wscript.orig
> > ++++ node-v0.2.0/wscript
> > +@@ -162,11 +162,12 @@ def configure(conf):
> > +   if Options.options.efence:
> > +     conf.check(lib=3D'efence', libpath=3D['/usr/lib', '/usr/local/lib=
'],
> > uselib_store=3D'EFENCE')
> > +
> > +-  if not conf.check(lib=3D"execinfo", includes=3D['/usr/include',
> > '/usr/local/include'], libpath=3D['/usr/lib', '/usr/local/lib'],
> > uselib_store=3D"EXECINFO"):
> > +-    # Note on Darwin/OS X: This will fail, but will still be used as =
the
> > +-    # execinfo stuff are part of the standard library.
> > +-    if sys.platform.startswith("freebsd"):
> > +-      conf.fatal("Install the libexecinfo port from
> > /usr/ports/devel/libexecinfo.")
> > ++  # OpenEmbedded doesn't like us checking here
> > ++  #if not conf.check(lib=3D"execinfo", includes=3D['/usr/include',
> > '/usr/local/include'], libpath=3D['/usr/lib', '/usr/local/lib'],
> > uselib_store=3D"EXECINFO"):
> > ++  #  # Note on Darwin/OS X: This will fail, but will still be used as=
 the
> > ++  #  # execinfo stuff are part of the standard library.
> > ++  #  if sys.platform.startswith("freebsd"):
> > ++  #    conf.fatal("Install the libexecinfo port from
> > /usr/ports/devel/libexecinfo.")
> > +
> > +   if not Options.options.without_ssl:
> > +     if conf.check_cfg(package=3D'openssl',

Did you sent these patches upstream? Maybe document that in the patch
headers. There is also a page in the Wiki regarding this.

> > diff --git a/recipes/nodejs/nodejs_0.2.0.bb b/recipes/nodejs/
> > nodejs_0.2.0.bb
> > new file mode 100644
> > index 0000000..83bfa2e
> > --- /dev/null
> > +++ b/recipes/nodejs/nodejs_0.2.0.bb
> > @@ -0,0 +1,28 @@
> > +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> > +HOMEPAGE =3D "http://nodejs.org"
> > +LICENSE =3D "MIT"
> > +DEPENDS =3D "openssl"
> > +SRC_URI =3D " \
> > +  http://nodejs.org/dist/node-v${PV}.tar.gz \
> > +  file://node-cross-cc.patch \
> > +  file://libev-cross-cc.patch \
> > +  file://node-dont-include-hosts-usr-include.patch \
> > +"
> > +#file://libev-arm-cross.patch \

Is that commented line needed?

> > +SRC_URI[md5sum] =3D "99a6dacc44b3f9c6ec376ccb446dd0b8"
> > +SRC_URI[sha256sum] =3D
> > "3d3eff9287c9917af4044f3cef99ae5b17946710a71e83039de4fcb4b0a26631"
> > +S =3D "${WORKDIR}/node-v${PV}"
> > +do_configure () {
> > +  ./configure --prefix=3D${D} --without-snapshot
> > +}

Can you use `EXTRA_OECONF` (Do `git grep EXTRA_OECONF` in the repository
to get examples.)

I think you might need `inherit autotools`, but I am not sure.

> > +do_compile () {
> > +  make
> > +}

Is that needed? What about Frans=E2=80=99 suggestion?

> > +do_install () {
> > +  #oe_runmake install # doesn't install to correct location
> > +
> > +  # This works
> > +  install -d ${D}${bindir}/
> > +  install -m 0755 ${S}/node ${D}${bindir}/
> > +}
> > +FILES_${PN} =3D "${bindir}/node"

Why is that needed?

I am a beginner, so I hope my comments are correct. If so please submit
a v3 and do not forget your Signed-off-by line.


Thanks,

Paul

--=-JE/uffPbQCXfUbr/3lHp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxzCwQACgkQPX1aK2wOHVgynACfdCYKjzkR7l5T/+cvZxUlbruc
ObwAn2WFL+E1fw+LCuU1U/Xdu75CW32S
=l09V
-----END PGP SIGNATURE-----

--=-JE/uffPbQCXfUbr/3lHp--
