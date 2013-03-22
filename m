Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIySA-0007wj-Sz
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:40:05 +0100
Received: by mail-pb0-f42.google.com with SMTP id xb4so2939711pbc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O7nzYDAlSP2B3ZTzwPESq73iQ6FJ0/3zOtEH94/CePw=;
	b=cza0qOkivt+CCLNb8tu5BBUndZB+3DdSx/7oYJd1U+tQRglkbXuHSQvBOHWQsy7pzw
	H5ChMU10rZJYJ3UdhNAdPWzsNU1u5K9JAv6XDPvHVTceGV+1ZfwGZkE59QWFrWJajvZN
	w147deYXrLfvQrVz0DQCHaemZnRJ1xojitWukua1WHyC9NYQf6/7Ne9n8YWH2GUP5mRd
	eyyPkfE+ogm+P3YiptAxfSwZuy9xQjpX8+IblFNQ+RHXQSbZUhziNkU9BpQXHwnlgp8j
	JGaS4bgPypCpmSiuNSRFKwiumc2SJ+Hr8f7JO4nzeTMVaAvaz0b2Vjgn46MB9Z4ozHjU
	AN3w==
X-Received: by 10.66.220.10 with SMTP id ps10mr2169698pac.117.1363944188731;
	Fri, 22 Mar 2013 02:23:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pb3sm1748861pbc.7.2013.03.22.02.23.06
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:23:07 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:23:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322092306.GN3219@jama>
References: <1363332414-10484-1-git-send-email-jukka.rissanen@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1363332414-10484-1-git-send-email-jukka.rissanen@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] wpa_supplicant: Location of systemd services files changed
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
X-List-Received-Date: Fri, 22 Mar 2013 09:40:19 -0000
X-Groupsio-MsgNum: 43655
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0aF+6pWUK5w8WdCh"
Content-Disposition: inline

--0aF+6pWUK5w8WdCh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2013 at 09:26:54AM +0200, Jukka Rissanen wrote:
>=20
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
>  .../recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend     =
| 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa=
-supplicant_2.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-su=
pplicant/wpa-supplicant_2.0.bbappend
> index 23dcc82..91ee4ad 100644
> --- a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-suppli=
cant_2.0.bbappend
> +++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-suppli=
cant_2.0.bbappend
> @@ -8,7 +8,7 @@ SYSTEMD_AUTO_ENABLE =3D "disable"
> =20
>  do_install_append () {
>      install -d ${D}${systemd_unitdir}/system
> -    install -m 644 ${S}/systemd/*.service ${D}${systemd_unitdir}/system
> +    install -m 644 ${S}/wpa_supplicant/systemd/*.service ${D}${systemd_u=
nitdir}/system
>  }
> =20
>  # systemd.bbclass does not catch all multiple-instance-service-files

Applied, thanks!

> --=20
> 1.7.11.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0aF+6pWUK5w8WdCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMIvoACgkQN1Ujt2V2gBzqegCeJ58P7ROvo+EmpCo4+Cfui2N+
+KcAn3Fj0nCpkB1AidP3X/Xfrqc7ZNrv
=bfTk
-----END PGP SIGNATURE-----

--0aF+6pWUK5w8WdCh--
