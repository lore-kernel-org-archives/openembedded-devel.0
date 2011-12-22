Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RdifZ-00041F-CP
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Dec 2011 14:26:49 +0100
Received: by eeit10 with SMTP id t10so4244421eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2011 05:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ixv1DQFWaQeDT+zw4yZeVAxo9sBH0DRK6n5vLXZFy4k=;
	b=LT3addK3C9A6s9jatey/q54QZEih7Alzxhz/dIbb81f+QrMOQQDpRbHlRzkcl58EUn
	PIVaeAc0WS2fglU/108sZk3qzmcW5xc7gsZoyU1r7LoKTcMyyeO22eL5xdXFtSHYI7PQ
	tqJ6bYDpW1e26b7XlHsrOhHKU/Y1g+mjN1kJc=
Received: by 10.14.52.4 with SMTP id d4mr4272675eec.124.1324559983235;
	Thu, 22 Dec 2011 05:19:43 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t59sm34020479eeh.10.2011.12.22.05.19.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 05:19:41 -0800 (PST)
Date: Thu, 22 Dec 2011 14:19:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111222131940.GA1471@jama.jama.net>
References: <cover.1324559278.git.otavio@ossystems.com.br>
	<06703197a0e4b89243cacc36ac59cdb88992b9ca.1324559278.git.otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <06703197a0e4b89243cacc36ac59cdb88992b9ca.1324559278.git.otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 2/3] rsyslog: move systemd support to rsyslog-systemd
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
X-List-Received-Date: Thu, 22 Dec 2011 13:26:49 -0000
X-Groupsio-MsgNum: 36254
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2011 at 01:08:23PM +0000, Otavio Salvador wrote:
> This makes the package consistent with others supporting systemd and
> also cleans up the recipe using the systemd.bbclass.

Do you have similar change for xserver-nodm-init? to make it even more
consistent? :)

Cheers,

>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog.inc |   23 ++++++++------------=
---
>  1 files changed, 8 insertions(+), 15 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc b/meta-oe/recip=
es-extended/rsyslog/rsyslog.inc
> index 856d965..ea7fa22 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
> @@ -4,32 +4,25 @@ HOMEPAGE =3D "http://www.rsyslog.com/"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D51d9635e646fb75e1b74c074f788e=
973"
> =20
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"
> =20
>  SRC_URI =3D "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.t=
ar.gz \
>             file://rsyslog.conf"
>            =20
> =20
> -inherit autotools
> +inherit autotools systemd
> +
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> +SYSTEMD_SERVICE =3D "${PN}.service"
> =20
>  do_install_append() {
>          install -d ${D}/${sysconfdir}/${PN}
>          install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
>  }
> =20
> +PACKAGES =3D+ "${PN}-systemd"
> =20
> -pkg_postinst_${PN} () {
> -	if test "x$D" !=3D "x"; then
> -		exit 1
> -	fi
> -	systemctl enable rsyslog.service
> -}
> -
> -pkg_prerm_${PN} () {
> -	systemctl disable rsyslog.service
> -}
> -
> -RRECOMMENDS_${PN} +=3D "systemd"
>  CONFFILES_${PN} =3D "${sysconfdir}/rsyslog.conf"
> -FILES_${PN} +=3D "${base_libdir}/systemd"
> =20
> +FILES_${PN}-systemd +=3D "${base_libdir}/systemd"
> +RDEPENDS_${PN}-systemd +=3D "${PN}"
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

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7zLmwACgkQN1Ujt2V2gBwX3QCffRwYmDo9UOBrcxplLXpvUMzW
yZoAn0T2AMXXlWxFPy4n9TAoYDjTuHi1
=A+Eo
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
