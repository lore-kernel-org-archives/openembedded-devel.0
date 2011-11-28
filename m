Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RV1rU-0002dv-5K
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 15:07:12 +0100
Received: by bkbzs2 with SMTP id zs2so7862500bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 06:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nf6DoEPZH9dXaykTisTbIIk0Wbd9f3Nt6OYNZWTIe3k=;
	b=IA5a5l6PqC4WSAWMTfEJFL9uvT/w9vjfz4M/Bp05uMSyqtu9ksqLUCFSI+2Uq8LAjn
	TtOgPNkUCjczlcOnQdSA65LtmOoyXeGCr92aySsko9/M9Jyj9srDEzkS4EcxPh61HLBF
	U7lCLNSVNvPj731l3zfpBX3U8z40zXU9gdA+M=
Received: by 10.204.9.216 with SMTP id m24mr44937984bkm.98.1322488834466;
	Mon, 28 Nov 2011 06:00:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e18sm29808364bkr.15.2011.11.28.06.00.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 06:00:31 -0800 (PST)
Date: Mon, 28 Nov 2011 15:00:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111128140019.GA3565@jama.jama.net>
References: <cover.1322484731.git.otavio@ossystems.com.br>
	<e32fd0221c36927758fffdda5b4235c39fb5b3d0.1322484731.git.otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <e32fd0221c36927758fffdda5b4235c39fb5b3d0.1322484731.git.otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/1] systemd-serialgetty: use a wrapper script to find getty
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
X-List-Received-Date: Mon, 28 Nov 2011 14:07:12 -0000
X-Groupsio-MsgNum: 35699
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jE+K4o1MICf3EEet"
Content-Disposition: inline

--jE+K4o1MICf3EEet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2011 at 12:52:39PM +0000, Otavio Salvador wrote:
> The following binaries are checked:
>=20
>   /sbin/agetty
>   /sbin/mingetty
>   /sbin/getty
>=20
> So this works out of box in most cases and doesn't enforce one getty
> as dependency.

FWIW: I have 2 patches for tinylogin and util-linux-agetty to provide
/sbin/getty u-a

openembedded-core-contrib/shr
util-linux: use u-a to provide /sbin/getty from util-linux-agetty
tinylogin: use u-a for getty so we can provide /sbin/getty from util-linux-=
agetty too
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dshr&id=3D=
f6aa6fc06af906ab7ee374d544b81f1ef9948403
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dshr&id=3D=
e34e002f33660591705cd7b21e3a815382a50b3e

I didn't send pull request with them, because I'm still waiting for
previous pull request (with libsdl changes) to be applied.

We can add u-a to mingetty and solve whole problem even for sysvinit
etc...

Cheers,

>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-core/systemd/systemd-serialgetty.bb    |   13 ++++++++++---
>  .../systemd-serialgetty/serial-getty@.service      |    2 +-
>  .../systemd-serialgetty/systemd-serialgetty        |   13 +++++++++++++
>  3 files changed, 24 insertions(+), 4 deletions(-)
>  create mode 100755 meta-oe/recipes-core/systemd/systemd-serialgetty/syst=
emd-serialgetty
>=20
> diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb b/meta-o=
e/recipes-core/systemd/systemd-serialgetty.bb
> index 2b88d0c..c79ae84 100644
> --- a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
> +++ b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
> @@ -2,12 +2,13 @@ DESCRIPTION =3D "Systemd serial config"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE;md5=3D751419260aa954499f=
7abaabaa882bbe"
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SERIAL_CONSOLE ?=3D "115200 ttyS0"
> =20
>  SRC_URI =3D "file://LICENSE \
> -           file://serial-getty@.service"
> +           file://serial-getty@.service \
> +           file://systemd-serialgetty"
> =20
>  def get_baudrate(bb, d):
>      return bb.data.getVar('SERIAL_CONSOLE', d, 1).split()[0]
> @@ -22,6 +23,9 @@ do_install() {
>  		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
>  		install ${WORKDIR}/serial-getty@.service ${D}${base_libdir}/systemd/sy=
stem/
> =20
> +		# Install wrapper that looks for available getty binary
> +		install -m 755 ${WORKDIR}/systemd-serialgetty ${D}${base_libdir}/syste=
md/
> +
>  		# enable the service
>  		ln -sf ${base_libdir}/systemd/system/serial-getty@.service \
>  			${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@${@g=
et_console(bb, d)}.service
> @@ -34,5 +38,8 @@ RRECOMMENDS_${PN} =3D ""
>  RDEPENDS_${PN} =3D "systemd"
> =20
>  # This is a machine specific file
> -FILES_${PN} =3D "${base_libdir}/systemd/system/serial-getty@.service ${s=
ysconfdir}"
> +FILES_${PN} =3D "${base_libdir}/systemd/systemd-serialgetty \
> +               ${base_libdir}/systemd/system/serial-getty@.service \
> +               ${sysconfdir} \
> +               "
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty/serial-gett=
y@.service b/meta-oe/recipes-core/systemd/systemd-serialgetty/serial-getty@=
=2Eservice
> index daf0dac..ee60a37 100644
> --- a/meta-oe/recipes-core/systemd/systemd-serialgetty/serial-getty@.serv=
ice
> +++ b/meta-oe/recipes-core/systemd/systemd-serialgetty/serial-getty@.serv=
ice
> @@ -17,7 +17,7 @@ Before=3Dgetty.target
> =20
>  [Service]
>  Environment=3DTERM=3Dvt100
> -ExecStart=3D-/sbin/getty @BAUDRATE@ %I
> +ExecStart=3D-/lib/systemd/systemd-serialgetty @BAUDRATE@ %I
>  Restart=3Dalways
>  RestartSec=3D0
>  UtmpIdentifier=3D%I
> diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty/systemd-ser=
ialgetty b/meta-oe/recipes-core/systemd/systemd-serialgetty/systemd-serialg=
etty
> new file mode 100755
> index 0000000..688b4b4
> --- /dev/null
> +++ b/meta-oe/recipes-core/systemd/systemd-serialgetty/systemd-serialgetty
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +
> +for g in /sbin/agetty \
> +         /sbin/mingetty \
> +         /sbin/getty; do
> +	if [ -x "$g" ]; then
> +		$g $@
> +		exit 0
> +	fi
> +done
> +
> +echo "Failed to find the getty binary to use."
> +exit 1
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jE+K4o1MICf3EEet
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Tk/MACgkQN1Ujt2V2gByu8gCfVmKry8q3Y85NTWQIDx6qsJW8
68gAn2xEF9/GyNHZL0ulx7HBrRM5USbW
=CgTa
-----END PGP SIGNATURE-----

--jE+K4o1MICf3EEet--
