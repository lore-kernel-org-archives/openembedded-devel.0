Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U36YD-0002TB-5S
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Feb 2013 16:04:43 +0100
Received: by mail-pa0-f42.google.com with SMTP id kq12so864415pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Feb 2013 06:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zBkiuMmKMI3Xw1syE9iNch+gcNFLhYOy5FJWNBSnODU=;
	b=fKe2vxqs8b6Q9GP7RwkJJ/IKneXVDOqCpfAAubDWPTrQE1fqwamUKF0KtfvqCnOX4P
	6lqPRDZKE9xByGnICpU/FL6dULMnEkxive0C6UDmhOK8/3c2Hzq9lU51GcYw20FlDG0I
	9HGKB7jqg5rcrVIGwNJjn1UYmf6gag9ZF5/3sU1zpJ+A+pzx5E72B5AvjtUS+Z9V6PUb
	BSPyVyXlqol7frbjHnhN06pJERC1MIzR9bs7i2Xu2Z/5kM8k7QU3DY3PSg2akAP8KjyE
	bnUfgwjv98kMaX9HfFEFRTsE7mZ1vcciM4gFRwsX3htigUTkCtZ/GJ+tEO5RJgvblnnW
	R7kg==
X-Received: by 10.66.76.37 with SMTP id h5mr76145741paw.33.1360162129284;
	Wed, 06 Feb 2013 06:48:49 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x2sm38277817paw.8.2013.02.06.06.48.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 06:48:48 -0800 (PST)
Date: Wed, 6 Feb 2013 15:48:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130206144840.GZ3271@jama>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
	<1360102723-27891-5-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1360102723-27891-5-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe-meta-systemd 4/5] pointercal-xinput: remove
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
X-List-Received-Date: Wed, 06 Feb 2013 15:04:44 -0000
X-Groupsio-MsgNum: 43025
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L+ytD9kXoSFEJYhc"
Content-Disposition: inline

--L+ytD9kXoSFEJYhc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2013 at 11:18:42PM +0100, Andreas M=FCller wrote:
> Calibration values are stored now in /etc/xorg.conf.d/99-<device>.conf. A=
fter

So the plan to replace pointercal-xinput in BSP layers
is to convert pointercal.xinput files to 99-<device>.conf files provided
by xserver-xf86-conf bbappend?

And do you have some script to convert them or do you convert them
manually?

Regards,

> this is accepted patches to layers appending pointercal-xinput will be se=
nd.
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../pointercal-xinput/pointercal.xinput            |    1 -
>  .../xinput-calibrator/pointercal-xinput_0.0.bb     |   19 --------------=
-----
>  .../xinput-calibrator/xinput-calibrator_git.bb     |    3 +--
>  3 files changed, 1 insertions(+), 22 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal=
-xinput/pointercal.xinput
>  delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal=
-xinput_0.0.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput=
/pointercal.xinput b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-=
xinput/pointercal.xinput
> deleted file mode 100644
> index 9633fc5..0000000
> --- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointe=
rcal.xinput
> +++ /dev/null
> @@ -1 +0,0 @@
> -# replace with valid machine specific pointercal.xinput
> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput=
_0.0.bb b/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.=
bb
> deleted file mode 100644
> index 9b68d54..0000000
> --- a/meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION =3D "Touchscreen calibration data from xinput-calibrator"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> -
> -PR =3D "r4"
> -
> -SRC_URI =3D "file://pointercal.xinput"
> -S =3D "${WORKDIR}"
> -
> -do_install() {
> -	# Only install file if it has a contents
> -	if [ -s ${S}/pointercal.xinput ]; then
> -	        install -d ${D}${sysconfdir}/
> -	        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
> -	fi
> -}
> -
> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> -CONFFILES_${PN} =3D "${sysconfdir}/pointercal.xinput"
> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator=
_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.=
bb
> index 199ee34..8ef774b 100644
> --- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> +++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://src/calibrator.cpp;endline=
=3D22;md5=3D1bcba08f67cdb56f340
>  DEPENDS =3D "virtual/libx11 libxi"
> =20
>  PV =3D "0.7.5+git${SRCPV}"
> -PR =3D "r3"
> +PR =3D "r4"
> =20
>  inherit autotools
> =20
> @@ -58,4 +58,3 @@ do_install_append() {
> =20
>  FILES_${PN} +=3D "${sysconfdir}/xdg/autostart ${systemd_unitdir}/system"
>  RDEPENDS_${PN} =3D "xterm"
> -RRECOMMENDS_${PN} =3D "pointercal-xinput"
> --=20
> 1.7.6.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L+ytD9kXoSFEJYhc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlESbUgACgkQN1Ujt2V2gByTfwCgtRyCSnz/alM0QIA8tqSK7Sbt
q4sAnirF1k2kGRgRM1fM3WX1Erx4+K4z
=Tja1
-----END PGP SIGNATURE-----

--L+ytD9kXoSFEJYhc--
