Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRUX9-000524-4Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 22:27:51 +0200
Received: by werb13 with SMTP id b13so1053201wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 13:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/0gKfTc5/VHVg1HaDfjm0rRM5zcLk2p8hwaL2A85FHg=;
	b=gwb1aapUKYY7XcyllPM0xQOILo0SnVeTrFFdLowNfX/b1xt2jNM0nZ0VO1acLjeVzC
	LeZDHdKvdr5cyhSCZTfAfgtgmVE8EgJC2oeBPzdP3VN31H7Gm2IZW2VmG/7EpM6g/BLn
	MsqKwq3VHbIKzVNDWk2T4+rWKFdMeFK0LgL6dVKHwU+5zRhCOfWnJawoSiV2oY0dr/ke
	w4Y7eQ/Ou9BEBKXJG/a+pWxaLhncjOzz0P6tkOZdGCeiZWmEFePVkkV0+m3s9ZsHg6Xu
	CoCuiZQ67ybOJTNT2k0Yj81EB3Ob+41ZakUzp7t80YWckUnipXsaAbEVkBuMjbImNKxR
	Ib0Q==
Received: by 10.180.78.233 with SMTP id e9mr8428005wix.5.1336421880426;
	Mon, 07 May 2012 13:18:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff2sm37550202wib.9.2012.05.07.13.17.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 13:17:59 -0700 (PDT)
Date: Mon, 7 May 2012 22:17:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120507201758.GC3146@jama.jama.net>
References: <cover.1336418115.git.Martin.Jansa@gmail.com>
	<5c22d88fe27592f4ef279e562cba063676f8d1fe.1336418115.git.Martin.Jansa@gmail.com>
	<20120507194138.GA3146@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120507194138.GA3146@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-efl][meta-gpe][PATCH 7/7] kernel.bbclass: Use kmod-native instead of module-init-tools-cross
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
X-List-Received-Date: Mon, 07 May 2012 20:27:51 -0000
X-Groupsio-MsgNum: 38610
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Content-Disposition: inline

--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 07, 2012 at 09:41:38PM +0200, Martin Jansa wrote:
> On Mon, May 07, 2012 at 09:17:02PM +0200, Martin Jansa wrote:
> > From: Khem Raj <raj.khem@gmail.com>
>=20
> This is needed in meta-oe because without module-init-tools in oe-core
> we get failures like this:
>=20
> ERROR: Nothing PROVIDES 'virtual/arm-oe-linux-gnueabi-depmod' (but
> /OE/shr-core/meta-smartphone/meta-openmoko/recipes-kernel/linux/linux-ope=
nmoko_3.2.bb,
> /OE/shr-core/meta-smartphone/meta-samsung/recipes-kernel/linux/linux-sams=
ung-crespo_git.bb,
> /OE/shr-core/meta-handheld/recipes-kernel/linux/linux_3.0.1.bb DEPENDS
> on or otherwise requires it)
> NOTE: Runtime target 'kernel' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['kernel',
> 'virtual/arm-oe-linux-gnueabi-depmod']
>=20
> kmod recipes should be droped from meta-oe too to get rid of this
> warning:
> ERROR: Multiple .bb files are due to be built which each provide kmod
> (/OE/shr-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb
> /OE/shr-core/meta-openembedded/meta-oe/recipes-kernel/kmod/kmod_git.bb).
>=20
> I have patch for it in jansa/pull2 too, but
> ERROR: Package version for package kmod went backwards which would break
> package feeds from (0:git-r3 to
> 0:7+git02629fa02e96763db7460a930239cc93649a52f8-r0.0)
> so we need PE bump preferably in oe-core.

This seems to be fine for opkg.. only buildhistory doesn't play nice
with gitpkgv.bbclass, because actual version was 7-r3 and opkg upgrades
it on target (this is after "fixing" libkmod packaging by including
libdir as well as base_libdir pattern..)
Upgrading libkmod2 on root from 7-r3 to
7+git02629fa02e96763db7460a930239cc93649a52f8-r0.0...

And
CONFLICTS_${PN} +=3D "module-init-tools-insmod-static module-init-tools-dep=
mod module-init-tools"
should be probably
RCONFLICTS_${PN} +=3D "module-init-tools-insmod-static module-init-tools-de=
pmod module-init-tools"
RREPLACES_${PN} +=3D "module-init-tools-insmod-static module-init-tools-dep=
mod module-init-tools"

Cheers,

>=20
> And also libkmod*so.* is now packaged in kmod package not libkmod but tha=
t's
> probably bug in oe-core recipe... because
> FILES_libkmod =3D "${base_libdir}/libkmod*${SOLIBS}"
> and they are installed in ${libdir}.
> probably that's from where this comment in kmod recipe comes from
> # libdir =3D "${base_libdir}"
>=20
> Cheers,
>=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/classes/kernel.bbclass |    7 +++----
> >  1 files changed, 3 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bb=
class
> > index 66398ef..b431f8e 100644
> > --- a/meta-oe/classes/kernel.bbclass
> > +++ b/meta-oe/classes/kernel.bbclass
> > @@ -1,7 +1,7 @@
> >  inherit linux-kernel-base module_strip
> > =20
> >  PROVIDES +=3D "virtual/kernel"
> > -DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depm=
od virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
> > +DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET=
_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
> > =20
> >  # we include gcc above, we dont need virtual/libc
> >  INHIBIT_DEFAULT_DEPS =3D "1"
> > @@ -274,7 +274,7 @@ if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> >  	mkdir -p $D/lib/modules/${KERNEL_VERSION}
> >  fi
> >  if [ -n "$D" ]; then
> > -	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${K=
ERNEL_VERSION} ${KERNEL_VERSION}
> > +	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION}=
 ${KERNEL_VERSION}
> >  else
> >  	depmod -a
> >  fi
> > @@ -352,9 +352,8 @@ python populate_packages_prepend () {
> >  		if m:
> >  			kernelver_stripped =3D m.group(1)
> >  		path =3D d.getVar("PATH", True)
> > -		host_prefix =3D d.getVar("HOST_PREFIX", True) or ""
> > =20
> > -		cmd =3D "PATH=3D\"%s\" %sdepmod -n -a -r -b %s -F %s/boot/System.map=
-%s %s" % (path, host_prefix, dvar, dvar, kernelver, kernelver_stripped)
> > +		cmd =3D "PATH=3D\"%s\" depmod -n -a -b %s -F %s/boot/System.map-%s %=
s" % (path, dvar, dvar, kernelver, kernelver_stripped)
> >  		f =3D os.popen(cmd, 'r')
> > =20
> >  		deps =3D {}
> > --=20
> > 1.7.8.6
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+oLfYACgkQN1Ujt2V2gBzb9ACePxEF4VsshD/J1lihUUThgEUE
6kwAoKtckbvwZ2Y+V+McYpG00ahjCdS6
=M02o
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--
