Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2Lw3-0005cI-Lo
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 14:18:12 +0100
Received: by mail-da0-f51.google.com with SMTP id i30so2674713dad.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 05:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=DKcApDFM6VScnwxCXgQoH/eUANBD7mOVJp+FHUIaRpY=;
	b=WTDGKDTO2JBmuzufCW9gAgab0u6+HqTLd3xw1DKO9A7yBp9FzM5nAWfyDurmeir0bf
	IsbGqBgofLNjUz/MwalobTHVnJzye6rMyq3VPscPBKAhrCUcac9PXerahWGKKSXWF2Oy
	nVWFeCwD52Um8htY1GEbDt+nsiMnBGUKMX38o0OlILmPmEQxMxy3tOpPvVELKHUVCacA
	yXAr8QCTXEvkrGlNWXB0GMLWx2oc2UgUeRGRVIFnG1R9osikgOdKbtNWraJ1OUKYJSSf
	qAttvoCPnZxBhQLVJYKlnwFqeJf04kzDBaNtLRq9oOBmxwzfpyhxH+gJJEw++A/lcl0x
	iA2g==
X-Received: by 10.66.82.200 with SMTP id k8mr52867463pay.56.1359982942698;
	Mon, 04 Feb 2013 05:02:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x2sm21241040paw.8.2013.02.04.05.02.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 05:02:21 -0800 (PST)
Date: Mon, 4 Feb 2013 13:02:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130204120212.GA3271@jama>
References: <1359982426-9836-1-git-send-email-mario@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1359982426-9836-1-git-send-email-mario@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [PATCH] xinput-calibrator: add --boot-mode comand line option to wrapper script
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
X-List-Received-Date: Mon, 04 Feb 2013 13:18:14 -0000
X-Groupsio-MsgNum: 42973
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline

--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2013 at 10:53:46AM -0200, Mario Domenech Goulart wrote:
> xinput_calibrator_once.sh has been renamed to
> run-xinput-calibrator.sh, which now also handles the --boot-mode
> command line option.
>=20
> When in boot mode (i.e., when --boot-mode is provided on the command
> line), the script exits if calibration data is found in the
> calibration data file.  When not in boot mode (i.e., no command line
> option), the script runs xinput-calibrator and creates/overwrites the
> calibration data file.
>=20
> This change allows other applications to use a common wrapper
> (run-xinput-calibrator.sh) for xinput-calibrator.

Did you send this upstream?

Can you provide Upstream-Status?

Cheers,
=20
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> ---
>  .../xinput-calibrator/boot-mode.patch              |   35 ++++++++++++++=
++++++
>  .../xinput-calibrator/xinput-calibrator_git.bb     |    9 +++--
>  2 files changed, 40 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-cal=
ibrator/boot-mode.patch
>=20
> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator=
/boot-mode.patch b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibr=
ator/boot-mode.patch
> new file mode 100644
> index 0000000..8af9fc4
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/boot-m=
ode.patch
> @@ -0,0 +1,35 @@
> +diff --git a/scripts/xinput_calibrator_pointercal.sh b/scripts/xinput_ca=
librator_pointercal.sh
> +index fccb197..253455b 100755
> +--- a/scripts/xinput_calibrator_pointercal.sh
> ++++ b/scripts/xinput_calibrator_pointercal.sh
> +@@ -7,6 +7,7 @@
> + # original script: Martin Jansa <Martin.Jansa@gmail.com>, 2010-01-31
> + # updated by Tias Guns <tias@ulyssis.org>, 2010-02-15
> + # updated by Koen Kooi <koen@dominion.thruhere.net>, 2012-02-28
> ++# updated by Mario Domenech Goulart <mario@ossystems.com.br>, 2013-02-01
> +=20
> + PATH=3D"/usr/bin:$PATH"
> +=20
> +@@ -14,13 +15,21 @@ BINARY=3D"xinput_calibrator"
> + CALFILE=3D"/etc/pointercal.xinput"
> + LOGFILE=3D"/var/log/xinput_calibrator.pointercal.log"
> +=20
> ++# In boot mode, this script exits if calibration data is found in
> ++# $CALFILE.  If not in boot-mode, it runs the calibrator and
> ++# creates/overwrites $CALFILE (in other words: it always recalibrate).
> ++if [ "$1" =3D "--boot-mode" ]; then
> ++    BOOT_MODE=3D1
> ++fi
> ++
> + if [ -e $CALFILE ] ; then
> +   if grep replace $CALFILE ; then
> +     echo "Empty calibration file found, removing it"
> +     rm $CALFILE
> +   else
> +     echo "Using calibration data stored in $CALFILE"
> +-    . $CALFILE && exit 0
> ++    . $CALFILE
> ++    [ -z "$BOOT_MODE" ] || exit 0
> +   fi
> + fi
> +=20
> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator=
_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.=
bb
> index 97f9343..21fd382 100644
> --- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> +++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> @@ -5,12 +5,13 @@ LIC_FILES_CHKSUM =3D "file://src/calibrator.cpp;endline=
=3D22;md5=3D1bcba08f67cdb56f340
>  DEPENDS =3D "virtual/libx11 libxi"
> =20
>  PV =3D "0.7.5+git${SRCPV}"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  inherit autotools
> =20
>  SRCREV =3D "c01c5af807cb4b0157b882ab07a893df9a810111"
> -SRC_URI =3D "git://github.com/tias/xinput_calibrator.git;protocol=3Dgit"
> +SRC_URI =3D "git://github.com/tias/xinput_calibrator.git;protocol=3Dgit \
> +           file://boot-mode.patch"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> @@ -19,10 +20,10 @@ EXTRA_OECONF +=3D "--with-gui=3Dx11"
> =20
>  do_install_append() {
>          install -d ${D}${bindir}
> -        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bi=
ndir}/xinput_calibrator_once.sh
> +        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bi=
ndir}/run-xinput-calibrator.sh
> =20
>          install -d ${D}${sysconfdir}/xdg/autostart
> -        sed -i -e 's,^Exec=3D.*,Exec=3D${bindir}/xinput_calibrator_once.=
sh,' scripts/xinput_calibrator.desktop
> +        sed -i -e 's,^Exec=3D.*,Exec=3D${bindir}/run-xinput-calibrator.s=
h --boot-mode,' scripts/xinput_calibrator.desktop
>          install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfd=
ir}/xdg/autostart
>  }
> =20
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

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEPo0QACgkQN1Ujt2V2gByjcACguL81GTlxwZ16DGEmeMYgzUjf
uokAmgLa+yW8KoHYJaQuYyqXSYX31N42
=gf0C
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
