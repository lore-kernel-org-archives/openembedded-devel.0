Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SbWuA-0002js-5s
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2012 15:01:06 +0200
Received: by bkcjm2 with SMTP id jm2so3696102bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8H0vWbxkMB07AE4BTZpXRpSOJADToI66nsOCBEiR2hs=;
	b=Wt3YqsHL2x68e68onQvkaT4OgJT0NxkI1RHDOn1cN6VCerWdqbqnqOosZs7Qykfcrk
	gCHL24/pqFdykn/w6ia4pe55L3F9GgUu9eYwmSn17NK9yGyTKvy27CQwtjKzUuxwfBlb
	CY4Tz/4U6A6Z1MoRPxXbbt/NMpUbKBJGLpx5ZSGMYgc9WFBAOF1n4DODnk2wTQ1Xw2AD
	z8d9buJobRXbiwHsNnShPEOFeYdc42Uc/Y/oleZtk/jwciB+2+E5lf7zr04EEDbJu3J6
	HSeAlM181Cmzc9y/ii06UqIUwJoBos78wCrpfuf3TlvzTkmd+hIG2lR08a6b0/sM1gBe
	TaYA==
Received: by 10.204.151.82 with SMTP id b18mr6651531bkw.132.1338814241538;
	Mon, 04 Jun 2012 05:50:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ig1sm10295351bkc.4.2012.06.04.05.50.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 05:50:40 -0700 (PDT)
Date: Mon, 4 Jun 2012 14:50:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120604125054.GA3138@jama.jama.net>
References: <1338542426-29985-1-git-send-email-schnitzeltony@googlemail.com>
	<1338542426-29985-3-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1338542426-29985-3-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe, v3 3/4] systemd.bbclass: extract SYSTEMD_SERVICE properly
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
X-List-Received-Date: Mon, 04 Jun 2012 13:01:06 -0000
X-Groupsio-MsgNum: 39130
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ozVqH6bFr/3sC51"
Content-Disposition: inline

--1ozVqH6bFr/3sC51
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 01, 2012 at 11:20:25AM +0200, Andreas M=FCller wrote:
> To set service files the following syntax is allowed:
>=20
> SYSTEMD_SERVICE =3D <service_file>
> or
> SYSTEMD_SERVICE_{<systemd_package_name>} =3D <service_file>
>=20
> A function get_package_var was introduced to handle all use-cases [1]
> properly.
>=20
> Build tested / buildhistory checks
>=20
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-May/0398=
70.html

whole patchset looks good:

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/classes/systemd.bbclass |   14 +++++++++-----
>  1 files changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bb=
class
> index 2881abf..2e585c3 100644
> --- a/meta-oe/classes/systemd.bbclass
> +++ b/meta-oe/classes/systemd.bbclass
> @@ -24,6 +24,12 @@ systemd_postrm() {
>  systemctl disable ${SYSTEMD_SERVICE}
>  }
> =20
> +def get_package_var(d, var, pkg):
> +	val =3D (d.getVar('%s_%s' % (var, pkg), d, 1) or "").strip()
> +	if val =3D=3D "":
> +		val =3D (d.getVar(var, d, 1) or "").strip()
> +	return val
> +
>  def systemd_after_parse(d):
>  	def systemd_check_vars():
>  		if d.getVar('BB_WORKERCONTEXT', True) is not None:
> @@ -155,8 +161,7 @@ python populate_packages_prepend () {
>  		systemd_packages =3D d.getVar('SYSTEMD_PACKAGES', 1)
>  		has_exactly_one_service =3D len(systemd_packages.split()) =3D=3D 1
>  		if has_exactly_one_service:
> -			systemd_services =3D d.getVar('SYSTEMD_SERVICE' + "_" + systemd_packa=
ges, 1) or d.getVar('SYSTEMD_SERVICE', 1)
> -			has_exactly_one_service =3D len(systemd_services.split()) =3D=3D 1
> +			has_exactly_one_service =3D len(get_package_var(d, 'SYSTEMD_SERVICE',=
 systemd_packages).split()) =3D=3D 1
> =20
>  		keys =3D 'Also' # Conflicts??
>  		if has_exactly_one_service:
> @@ -164,8 +169,7 @@ python populate_packages_prepend () {
>  			keys =3D 'Also Conflicts'
>  		# scan for all in SYSTEMD_SERVICE[]
>  		for pkg_systemd in systemd_packages.split():
> -			systemd_services =3D d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, =
1) or d.getVar('SYSTEMD_SERVICE', 1)
> -			for service in systemd_services.split():
> +			for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).spl=
it():
>  				path_found =3D ''
>  				for path in searchpaths.split():
>  					if os.path.exists('${D}' + path + service):
> @@ -196,7 +200,7 @@ python populate_packages_prepend () {
>  	# run all modifications once when creating package
>  	if os.path.exists('${D}'):
>  		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
> -			if d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) and d.getVar('S=
YSTEMD_SERVICE' + "_" + pkg_systemd, 1).strip():
> +			if get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd) !=3D "":
>  				systemd_generate_package_scripts(pkg_systemd)
>  				systemd_add_rdepends(pkg_systemd)
>  		systemd_check_services()
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

--1ozVqH6bFr/3sC51
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/Mry4ACgkQN1Ujt2V2gBwRkwCeMhOU41ifVcGxvV5CFVm9XRMF
2kkAn2438sz85DSn8sHUKenBp8ppVyBW
=1/JR
-----END PGP SIGNATURE-----

--1ozVqH6bFr/3sC51--
