Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DDFF86017E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2014 20:11:09 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XlkRa-00026s-Iw from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Nov 2014 12:11:10 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 4 Nov 2014 12:11:09 -0800
Received: by burninator (Postfix, from userid 1000)	id 56226581737; Tue,  4
	Nov 2014 15:11:09 -0500 (EST)
Date: Tue, 4 Nov 2014 15:11:09 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141104201109.GN25009@mentor.com>
References: <1414658065-32307-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1414658065-32307-1-git-send-email-Chong.Lu@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] ntp: add sntp.service for sntp package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Nov 2014 20:11:09 -0000
X-Groupsio-MsgNum: 52730
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iq/fWD14IMVFWBCD"
Content-Disposition: inline

--iq/fWD14IMVFWBCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] ntp: add sntp.service for sntp package] On 1=
4.10.30 (Thu 16:34) Chong Lu wrote:

> This solves the following warning:
>=20
> lib32-ntp-4.2.6p5: lib32-ntp: Files/directories were installed but not sh=
ipped
>   /lib/systemd/system/sntp.service [installed-vs-shipped]
>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  recipes-support/ntp/ntp.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index fd45219..6897587 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -128,6 +128,7 @@ FILES_ntpdate =3D "${sbindir}/ntpdate \
>  "
>  FILES_sntp =3D "${sbindir}/sntp \
>                ${sysconfdir}/default/sntp \
> +              ${systemd_unitdir}/system/sntp.service \
>               "
> =20
>  CONFFILES_${PN} =3D "${sysconfdir}/ntp.conf"
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--iq/fWD14IMVFWBCD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUWTLcAAoJEEn8ffcsOfaWOmgIAJj2J3T+7pQrmmzgqlPeuOb7
EVN53KL6w3xQ/R6eqpK+MMWxX5SZHN62/CuC9VeFHjKkP68RH8cBUjjmJdS+NwWr
+krPGC5CCZTNSbAbJ7KRxYfhWN/JwolmFeMGi/wflk8T+mcv+yNT4T9sodbfv2s5
4XcaQ1jd3OdGHpWWVCs+CMgfVacujLDYd7lz7f9rydp0AkMEWnomVKYxWQOo8TMk
bhVuOygfUwAxc7MP8KEuo9wsAd5PG23DwQCl6AKM5Rbb4GtPlEW1os877uhG82hO
GbKhgVuS+3XphqB5D12oDochNmnrhUP8sB6xOuhu1K5ugvaZCmtxkn7fWENGAso=
=TJDx
-----END PGP SIGNATURE-----

--iq/fWD14IMVFWBCD--
