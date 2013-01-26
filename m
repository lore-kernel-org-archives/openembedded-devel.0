Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Tz4Sb-0002HC-TJ; Sat, 26 Jan 2013 13:02:14 +0100
Received: by mail-da0-f46.google.com with SMTP id p5so553089dak.5
	for <multiple recipients>; Sat, 26 Jan 2013 03:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ftE7vQrBbPvP7JFm2JJomYXScolFLE1zn/05RrRlmwA=;
	b=dcMU/+v+2v0eI1YWyNGX3bDvMYea2VeAXMXLBjZJH1Q1Xky5QwiLeog8Ss0a7u0nQZ
	zmdv4OBxi6xH7UEQVEw+S1ZOzK+COzUggb9Ahje7vnXUMb/GGEJUp7Y98Bkt0xLihoUj
	d0zpux9W8YAFmKsRSTNFxFTHpzrLlvlL25/fVFtKWtQ0C4RAnivaA4TOTHlqDaOb1MbF
	ZBx+4OD7Fr7hemQAQuFBiR60lp8D1VZYlBGcX8PJDfmDxTPWNtnXLQr6mbyrVorBl0xp
	TlWu2sT642CGpoUFfAg9jIRIA1Q8bm4qlNeXKHZuhGKiRYFI+d6bXq+m+ttjJECMI3ct
	sXrw==
X-Received: by 10.68.212.167 with SMTP id nl7mr21894180pbc.12.1359200797212;
	Sat, 26 Jan 2013 03:46:37 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ue7sm2466961pbc.53.2013.01.26.03.46.34
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 26 Jan 2013 03:46:35 -0800 (PST)
Date: Sat, 26 Jan 2013 12:46:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130126114633.GG16904@jama.palm1.palmone.com>
References: <20130122122421.A87761034C@opal>
MIME-Version: 1.0
In-Reply-To: <20130122122421.A87761034C@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : apcupsd: add 3.14.10
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
X-List-Received-Date: Sat, 26 Jan 2013 12:02:14 -0000
X-Groupsio-MsgNum: 42851
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vJguvTgX93MxBIIe"
Content-Disposition: inline

--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 12:24:21PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: be12fb6c0762fe474a4d7cda94e814c0c622dfb5
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Dbe12fb6c0762fe474a4d7cda94e814c0c622dfb5
>=20
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date:   Sun Jan 20 11:32:05 2013 +0000
>=20
> apcupsd: add 3.14.10
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

There is new QA warning, can you fix that?

apcupsd-3.14.10: apcupsd: Files/directories were installed but not shipped
  /usr/share/hal
  /usr/share/hal/fdi
  /usr/share/hal/fdi/policy
  /usr/share/hal/fdi/policy/20thirdparty
  /usr/share/hal/fdi/policy/20thirdparty/80-apcupsd-ups-policy.fdi

Thanks

>=20
> ---
>=20
>  meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb |   35 ++++++++++++++=
++++++
>  1 files changed, 35 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-oe=
/recipes-support/apcupsd/apcupsd_3.14.10.bb
> new file mode 100644
> index 0000000..e50d03f
> --- /dev/null
> +++ b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "foo"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc12853cc7fdf20d17b4fddefd26b7=
802"
> +
> +SRC_URI =3D "http://garr.dl.sourceforge.net/project/apcupsd/apcupsd%20-%=
20Stable/3.14.10/apcupsd-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "5928822d855c5cf7ac29655e3e0b8c23"
> +SRC_URI[sha256sum] =3D "0707b5ec9916fbde9e44eb8d18037c8d8f75dfd6aeef51ab=
a5487e189eef2032"
> +
> +inherit autotools
> +
> +LD =3D "${CXX}"
> +
> +EXTRA_OECONF =3D "--enable-usb \
> +                --with-distname=3D${DISTRO}"
> +
> +do_configure() {
> +	export topdir=3D${S}
> +	cp -a ${S}/autoconf/configure.in ${S}
> +
> +	if ! [ -d ${S}/platforms/${DISTRO} ] ; then
> +		cp -a ${S}/platforms/unknown ${S}/platforms/${DISTRO}=20
> +	fi
> +
> +	gnu-configize --force
> +	# install --help says '-c' is an ignored option, but it turns out that =
the argument to -c isn't ignored, so drop the complete '-c path/to/strip' l=
ine
> +	sed -i -e 's:$(INSTALL_PROGRAM) $(STRIP):$(INSTALL_PROGRAM):g' ${S}/aut=
oconf/targets.mak
> +	# Searching in host dirs triggers the QA checks
> +	sed -i -e 's:-I/usr/local/include::g' -e 's:-L/usr/local/lib64::g' -e '=
s:-L/usr/local/lib::g' ${S}/configure
> +
> +	# m4 macros are missing, using autotools_do_configure leads to linking =
errors with gethostname_re
> +	oe_runconf
> +}
> +
> +
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vJguvTgX93MxBIIe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEDwhkACgkQN1Ujt2V2gBzZjACdHNgbKc97F1NOVCB/srMgsxUd
wB0AoLG6qNQCbsDDpUWd8ehWyGnawkVj
=/lHO
-----END PGP SIGNATURE-----

--vJguvTgX93MxBIIe--
