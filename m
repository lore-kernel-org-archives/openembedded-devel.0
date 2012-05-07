Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRTxz-0002dH-0n
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 21:51:31 +0200
Received: by wibhj13 with SMTP id hj13so3222959wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 12:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Li2zy1pwU/iN+o1W2r2TzMiW6zFIf1V1NuauzaLH+90=;
	b=0bs/71uh/IHrgpAJEzXEHU1q1jTIGAHlsoRpIOqrNUadIMtXhLaqk1dicPM/ytLSs0
	SHrzX7wSQw1hKcT9Oo4K5ZBg68RiQoSkzEYj93u6f0VN16xzXLIRP6N2QWsLB5eHBpmK
	MNkJXHG4+0QNqEu8aHuckjXIhIFNRFtt5pSlKufdL+CN8exZH+sgcS9m+0itOzNVOqIr
	UP9f0rBkacPNMx2SQ66FQIRCIe8/N2Dzx5tCYX0uChsbKgQio9hpJvoYr3M4y9TEo32C
	417PTVZAjG/1Id30Ql6sKcizTWcsxsIVs0FTMClVJojoPwaRFRFN5wW0yXken+cusrjh
	y8Pg==
Received: by 10.180.104.168 with SMTP id gf8mr14793932wib.12.1336419700419;
	Mon, 07 May 2012 12:41:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f19sm37244097wiw.11.2012.05.07.12.41.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 12:41:39 -0700 (PDT)
Date: Mon, 7 May 2012 21:41:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120507194138.GA3146@jama.jama.net>
References: <cover.1336418115.git.Martin.Jansa@gmail.com>
	<5c22d88fe27592f4ef279e562cba063676f8d1fe.1336418115.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5c22d88fe27592f4ef279e562cba063676f8d1fe.1336418115.git.Martin.Jansa@gmail.com>
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
X-List-Received-Date: Mon, 07 May 2012 19:51:31 -0000
X-Groupsio-MsgNum: 38607
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 07, 2012 at 09:17:02PM +0200, Martin Jansa wrote:
> From: Khem Raj <raj.khem@gmail.com>

This is needed in meta-oe because without module-init-tools in oe-core
we get failures like this:

ERROR: Nothing PROVIDES 'virtual/arm-oe-linux-gnueabi-depmod' (but
/OE/shr-core/meta-smartphone/meta-openmoko/recipes-kernel/linux/linux-openm=
oko_3.2.bb,
/OE/shr-core/meta-smartphone/meta-samsung/recipes-kernel/linux/linux-samsun=
g-crespo_git.bb,
/OE/shr-core/meta-handheld/recipes-kernel/linux/linux_3.0.1.bb DEPENDS
on or otherwise requires it)
NOTE: Runtime target 'kernel' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['kernel',
'virtual/arm-oe-linux-gnueabi-depmod']

kmod recipes should be droped from meta-oe too to get rid of this
warning:
ERROR: Multiple .bb files are due to be built which each provide kmod
(/OE/shr-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb
/OE/shr-core/meta-openembedded/meta-oe/recipes-kernel/kmod/kmod_git.bb).

I have patch for it in jansa/pull2 too, but
ERROR: Package version for package kmod went backwards which would break
package feeds from (0:git-r3 to
0:7+git02629fa02e96763db7460a930239cc93649a52f8-r0.0)
so we need PE bump preferably in oe-core.

And also libkmod*so.* is now packaged in kmod package not libkmod but that's
probably bug in oe-core recipe... because
FILES_libkmod =3D "${base_libdir}/libkmod*${SOLIBS}"
and they are installed in ${libdir}.
probably that's from where this comment in kmod recipe comes from
# libdir =3D "${base_libdir}"

Cheers,

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/classes/kernel.bbclass |    7 +++----
>  1 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbcl=
ass
> index 66398ef..b431f8e 100644
> --- a/meta-oe/classes/kernel.bbclass
> +++ b/meta-oe/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>  inherit linux-kernel-base module_strip
> =20
>  PROVIDES +=3D "virtual/kernel"
> -DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod=
 virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
> +DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_P=
REFIX}gcc${KERNEL_CCSUFFIX} update-modules"
> =20
>  # we include gcc above, we dont need virtual/libc
>  INHIBIT_DEFAULT_DEPS =3D "1"
> @@ -274,7 +274,7 @@ if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>  	mkdir -p $D/lib/modules/${KERNEL_VERSION}
>  fi
>  if [ -n "$D" ]; then
> -	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KER=
NEL_VERSION} ${KERNEL_VERSION}
> +	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} $=
{KERNEL_VERSION}
>  else
>  	depmod -a
>  fi
> @@ -352,9 +352,8 @@ python populate_packages_prepend () {
>  		if m:
>  			kernelver_stripped =3D m.group(1)
>  		path =3D d.getVar("PATH", True)
> -		host_prefix =3D d.getVar("HOST_PREFIX", True) or ""
> =20
> -		cmd =3D "PATH=3D\"%s\" %sdepmod -n -a -r -b %s -F %s/boot/System.map-%=
s %s" % (path, host_prefix, dvar, dvar, kernelver, kernelver_stripped)
> +		cmd =3D "PATH=3D\"%s\" depmod -n -a -b %s -F %s/boot/System.map-%s %s"=
 % (path, dvar, dvar, kernelver, kernelver_stripped)
>  		f =3D os.popen(cmd, 'r')
> =20
>  		deps =3D {}
> --=20
> 1.7.8.6
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+oJXIACgkQN1Ujt2V2gBz/uACfa7dI36HW4UKEXSZbRtPUcvb1
7yIAoKuFngDkw8/CFF0inHf67Jo5bIiI
=KcVS
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
