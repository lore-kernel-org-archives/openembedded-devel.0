Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Sqq9w-0005c5-0f; Mon, 16 Jul 2012 20:36:40 +0200
Received: by wibhm11 with SMTP id hm11so2649386wib.6
	for <multiple recipients>; Mon, 16 Jul 2012 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/sBs+bbGsDv285NfIghqeF9+IH/fRwVyMtD2nY5Kqoc=;
	b=FRKmmCROMe8DDbr4CRWdJJ1N4SFLwSfIQNLdFmuar63J2V63VydIM0LrswBK8tT9mg
	oCzSh29m97tFdXWGxQZ9Mh0PFEBT24NXtrpMBqbS0JDxvJLqO7SgZW7vmwj3Dc8XOrLQ
	gQC3HozYQbGL3jwhVvO7+iFQEcd0eV9j6qozIvrMFSoCALfwzhlngbpClSrhFc2zSdCW
	YPyYL4OtizmbN8swfkgMtW7Sm2SqBVslhMa4Pig2LgMcfKFBEqXuEWKG1J2cXPpm5yR5
	H2LdUWx7fvjJx6g4mH3zN40HRh8U7xi/+83Z2LL0kKtAfu2VGXr/aHuTOObClCKPJM/B
	1cSA==
Received: by 10.180.83.105 with SMTP id p9mr20130840wiy.12.1342463121653;
	Mon, 16 Jul 2012 11:25:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm22687889wiz.1.2012.07.16.11.25.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 11:25:19 -0700 (PDT)
Date: Mon, 16 Jul 2012 20:25:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120716182528.GO3729@jama.jama.net>
References: <20120716074256.12AC410334@opal>
MIME-Version: 1.0
In-Reply-To: <20120716074256.12AC410334@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFtvZS1jb21taXRzXSBBbmRyZWFzIE3DvGxsZXIgOiBzeXN0ZW1kLmJiY2xhc3M6IGFkZCAqLXN5c3RlbWQgcGFja2FnZXMgdG8gUlJFQ09NTUVORFM=?=
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
X-List-Received-Date: Mon, 16 Jul 2012 18:36:40 -0000
X-Groupsio-MsgNum: 39697
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZmZU9S7l/XJx5q9b"
Content-Disposition: inline

--ZmZU9S7l/XJx5q9b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2012 at 07:42:56AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 264e5a44e1111f939b43c11bb9514a0b435918db
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D264e5a44e1111f939b43c11bb9514a0b435918db
>=20
> Author: Andreas M=FCller <schnitzeltony@googlemail.com>
> Date:   Wed Jul 11 20:46:07 2012 +0200
>=20
> systemd.bbclass: add *-systemd packages to RRECOMMENDS

This is a bit unfortunate e.g. when busybox is used in small chroot
image.
busybox pulls busybox-syslog, which now adds busybox-syslog-systemd and
it ends with systemd/dbus/udev/shadow/pam/util-linux/kmod being added to pr=
eviously small image, see:

http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dblobdiff;f=3Dimage=
s/crespo/eglibc/chroot-image/installed-package-names.txt;h=3D07187b9e51bd01=
99910152a8019d117ed41cc2db;hp=3D8f401e657dd449e30fe8183dc86a791d09614d9f;hb=
=3Dac04304bb15221b49e5af6838068f158e7d628ed;hpb=3D4c0555e7fa689c3c20902c7fc=
1ec8e525769723f

So it could be solved by image specific BAD_RECOMMENDATIONs or something
like that, but by default it doesn't work very well in this use-case.

Cheers,

>=20
> ---
>=20
>  meta-systemd/classes/systemd.bbclass |   26 ++++++++++++++++++++++----
>  1 files changed, 22 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/=
systemd.bbclass
> index 2e585c3..fce314d 100644
> --- a/meta-systemd/classes/systemd.bbclass
> +++ b/meta-systemd/classes/systemd.bbclass
> @@ -180,8 +180,21 @@ python populate_packages_prepend () {
>  					raise bb.build.FuncFailed, "\n\nFor package %s SYSTEMD_SERVICE-entr=
y %s does not exist" % \
>  						(pkg_systemd, service)
> =20
> -	# *-systemd packages get RDEPENDS to systemd and their base package
> -	def systemd_add_rdepends(pkg_systemd):
> +	"""     Setup rdepends / rrecommmends as:
> +
> +                -----------------------------
> +                |  pkg_systemd_base: 'foo'  |
> +                -----------------------------
> +                           |    ^
> +                           |    |                 --------------
> +               rrecommends |    | rdepends        | 'systemd'  |
> +                           |    |               ->--------------
> +                           V    |              / rdepends
> +                ------------------------------/
> +                | pkg_systemd: 'foo-systemd' |
> +                ------------------------------
> +	"""
> +	def systemd_add_rdepends_rrecommends(pkg_systemd):
>  		# RDEPENDS_${pkg_systemd} +=3D pkg_systemd_base systemd
>  		rdepends =3D d.getVar('RDEPENDS_' + pkg_systemd, 1) or ""
>  		rdepends_arr =3D rdepends.split()
> @@ -195,13 +208,18 @@ python populate_packages_prepend () {
>  		if len(rdepends_arr) =3D=3D 0 and pkg_systemd !=3D '${PN}' and not pkg=
_systemd_base in rdepends:
>  			rdepends =3D '%s %s' % (rdepends, pkg_systemd_base)
>  		d.setVar('RDEPENDS_' + pkg_systemd, rdepends)
> -
> +		# RRECOMMENDS_${pkg_systemd_base} +=3D pkg_systemd systemd
> +		rrecommends =3D d.getVar('RRECOMMENDS_' + pkg_systemd_base, 1) or ""
> +		# not rrecommending myself AND avoid double entries
> +		if pkg_systemd !=3D pkg_systemd_base and not pkg_systemd in rrecommend=
s.split():
> +			rrecommends =3D '%s %s' % (rrecommends, pkg_systemd)
> +		d.setVar('RRECOMMENDS_' + pkg_systemd_base, rrecommends)
> =20
>  	# run all modifications once when creating package
>  	if os.path.exists('${D}'):
>  		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
>  			if get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd) !=3D "":
>  				systemd_generate_package_scripts(pkg_systemd)
> -				systemd_add_rdepends(pkg_systemd)
> +				systemd_add_rdepends_rrecommends(pkg_systemd)
>  		systemd_check_services()
>  }
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZmZU9S7l/XJx5q9b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAEXJgACgkQN1Ujt2V2gBz1dACeM9fpLm74yiOXj5N9ERGk8P53
S3AAoLUlF5mO74hOIAqYkEJh9MFnymUH
=VVov
-----END PGP SIGNATURE-----

--ZmZU9S7l/XJx5q9b--
