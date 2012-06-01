Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SaKgr-0004KJ-0o
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 07:46:28 +0200
Received: by wibhm14 with SMTP id hm14so219039wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 22:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KaxshLXkzTCujlrQ8vqKKtQ/JnAwTlg6Zknr7LV/tEA=;
	b=xqZj+0JGH4ZdJjiDImuMregIJo6YzsQ8XnOElMD343PxpujG5/Upm3lD01vxKNAUNW
	ZpTJVs4u/Xu9iSYiTuZaE0ln85fAHI41jejR5XOf1HrrzAXJa3V6dEq0C2Vey9ay7c/L
	U9PvKx2OyLlHPeJ5c5ibvH9w9etfhdDN7XTiHCWrELwh7afhBcj1khHCpJC043GQ0hNb
	NdZGPQgfj9ExADZlMr1rb9ZLsmf6wBwdtcyIUP/VbcD/gHQI98DrNh9Lk4g1kLavr/nK
	ivAMDrPyrhI0GPrFxMTIigVT7sEDLulOVGp4dNNMy9JfAgRVzmNkikBlaO2ceStpiLtI
	ttaQ==
Received: by 10.216.196.147 with SMTP id r19mr1207436wen.87.1338528964338;
	Thu, 31 May 2012 22:36:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q6sm961353wiy.0.2012.05.31.22.36.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 22:36:03 -0700 (PDT)
Date: Fri, 1 Jun 2012 07:36:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120601053614.GV3138@jama.jama.net>
References: <1338510443-29579-1-git-send-email-schnitzeltony@googlemail.com>
	<1338510443-29579-3-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1338510443-29579-3-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe, v2 3/4] systemd.bbclass: extract SYSTEMD_SERVICE properly
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
X-List-Received-Date: Fri, 01 Jun 2012 05:46:29 -0000
X-Groupsio-MsgNum: 39085
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8EXHJdkEfksMlRxO"
Content-Disposition: inline

--8EXHJdkEfksMlRxO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 01, 2012 at 02:27:22AM +0200, Andreas M=FCller wrote:
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
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/classes/systemd.bbclass |   14 +++++++++-----
>  1 files changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bb=
class
> index 2881abf..00e108e 100644
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
 systemd_packages)) =3D=3D 1

^ isn't split() still needed here?

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
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8EXHJdkEfksMlRxO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/IVM4ACgkQN1Ujt2V2gBw1EQCgupPvXAmKh5KObNhmdRg0f1rL
hBYAn0LHqERErfrAQRf5CU9OXAhROdsb
=d+3r
-----END PGP SIGNATURE-----

--8EXHJdkEfksMlRxO--
