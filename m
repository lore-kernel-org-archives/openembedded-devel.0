Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CE3C46012C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 May 2016 16:18:11 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1axGXz-0003dZ-3X from Joe_MacDonald@mentor.com ;
	Mon, 02 May 2016 09:18:11 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 May 2016 09:18:10 -0700
Received: by burninator (Postfix, from userid 1000)	id EAD55580673; Mon,  2
	May 2016 12:18:09 -0400 (EDT)
Date: Mon, 2 May 2016 12:18:09 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20160502161809.GD17714@mentor.com>
References: <1462204748-3435-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1462204748-3435-1-git-send-email-akuster808@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Armin Kuster <akuster@mvista.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][master][krogoth][jethro][fido][PATCH] ntp: Security fixes via update to 4.2.8p7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 May 2016 16:18:12 -0000
X-Groupsio-MsgNum: 61291
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5gxpn/Q6ypwruk0T"
Content-Disposition: inline

--5gxpn/Q6ypwruk0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[meta-networking][master][krogoth][jethro][fido][PATCH] ntp: Security fixe=
s via update to 4.2.8p7] On 16.05.02 (Mon 08:59) Armin Kuster wrote:

> From: Armin Kuster <akuster@mvista.com>
>=20
> CVE-2016-1551
> CVE-2016-2516
> CVE-2016-2517
> CVE-2016-2518
> CVE-2016-2519
> CVE-2016-1547
> CVE-2015-7704
> CVE-2015-8138
> CVE-2016-1550
>=20
> for more info see:
> http://support.ntp.org/bin/view/Main/SecurityNotice#April_2016_NTP_4_2_8p=
7_Security
>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>

Acked-by: Joe MacDonald <joe_macdonald@mentor.com>

> ---
>  .../recipes-support/ntp/{ntp_4.2.8p6.bb =3D> ntp_4.2.8p7.bb}            =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/ntp/{ntp_4.2.8p6.bb =3D> ntp_4.2.=
8p7.bb} (97%)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb b/meta-ne=
tworking/recipes-support/ntp/ntp_4.2.8p7.bb
> similarity index 97%
> rename from meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
> rename to meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
> index a7b998a..ff4ba64 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
> @@ -23,8 +23,8 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/n=
tp4/ntp-4.2/ntp-${PV}.tar.g
>             file://ntpd.list \
>  "
> =20
> -SRC_URI[md5sum] =3D "60049f51e9c8305afe30eb22b711c5c6"
> -SRC_URI[sha256sum] =3D "583d0e1c573ace30a9c6afbea0fc52cae9c8c916dbc15c02=
6e485a0dda4ba048"
> +SRC_URI[md5sum] =3D "46dfba933c3e4bc924d8e55068797578"
> +SRC_URI[sha256sum] =3D "81d20c06a0b01abe3b84fac092185bf014252d38fe5e7b27=
58f604680a0220dc"
> =20
>  inherit autotools update-rc.d useradd systemd pkgconfig
> =20
--=20
-Joe MacDonald.
:wq

--5gxpn/Q6ypwruk0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXJ33BAAoJEEn8ffcsOfaWucwH/ivLko6UWoq3PGUF4P20j30s
xkanl2CZ/1gx3Wf5mOXbToHwEQumCpniqTxFB3vfIRroEzBCHNwDTeTZE6J+/0yB
CRSxSwdEVen7o1ZueJqeffnOVL+CIGQj8wUJML2fVEoM3ryTuLvOF9LffDxu57Pp
xTuqm4NYtdZx72e65p0YuAHB2FWVqawPrDToQ0Q8QGdXgZq7EwUzl0jVf2hwggqY
v2oIE6c8YMHCK7mG+OFjiHiJtd9WPdvL4i9o2myuRFo3X03U5pi/wf+uE96N3fIZ
piIThyx26/mABdKHSgQvijA/1ueNHyz4cFyAGj+rDI4aSlWQ3Qin0AM5Mw2ekD8=
=H+xI
-----END PGP SIGNATURE-----

--5gxpn/Q6ypwruk0T--
