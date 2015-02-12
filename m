Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C7F7473372
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 03:22:43 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1YLkMX-0004qY-C1 from Joe_MacDonald@mentor.com ;
	Wed, 11 Feb 2015 19:22:45 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Feb 2015 19:22:45 -0800
Received: by burninator (Postfix, from userid 1000)	id 76495581332; Wed, 11
	Feb 2015 22:22:44 -0500 (EST)
Date: Wed, 11 Feb 2015 22:22:44 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <rongqing.li@windriver.com>
Message-ID: <20150212032244.GO30457@mentor.com>
References: <1423019863-22139-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1423019863-22139-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] postfix: start the postfix daemon by default when init is systemd
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
X-List-Received-Date: Thu, 12 Feb 2015 03:22:44 -0000
X-Groupsio-MsgNum: 54201
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iq/fWD14IMVFWBCD"
Content-Disposition: inline

--iq/fWD14IMVFWBCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks Roy.
-J.

[[oe] [PATCH][meta-networking] postfix: start the postfix daemon by default=
 when init is systemd] On 15.02.04 (Wed 11:17) rongqing.li@windriver.com wr=
ote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> postfix should be started by default, so that the root user can
> receive mail, and if init is not systemd, it is started by default
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-daemons/postfix/postfix.inc | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-n=
etworking/recipes-daemons/postfix/postfix.inc
> index 28563af..3801e61 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -124,7 +124,6 @@ do_install_prepend_virtclass-native() {
>  }
> =20
>  SYSTEMD_SERVICE_${PN} =3D "postfix.service"
> -SYSTEMD_AUTO_ENABLE =3D "disable"
> =20
>  do_install () {
>      sh ./postfix-install 'install_root=3D${D}' \
> --=20
> 2.1.0
>=20
--=20
-Joe MacDonald.
:wq

--iq/fWD14IMVFWBCD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU3ByEAAoJEEn8ffcsOfaWN+QH/387kZZuOb+NI5H6nsksBhWF
HmR4DcxPuIJUzzpNqNwrh2PKr82qg3w/fj+vGJTvIe7xjphYVpgO7IQN/Q/DZ64A
Pq7P+8OGqaDCGN+xCGi0bgv6EtZuQy/4koI8TUJLwH5zCI8ZGtt77zA9S8h3VGXs
I6FwSRX2RlROHN9rS9sSZD1KFBPOP+ewIwGIJbAUTlZuedEGOVwtZ2MWEdSpZQh2
2JZTDEwspiaTeu6VyIO7BSLb+EE98PRcv7u14BrH3eG1eMrkn+kRUY7MKf8Z1CWM
MoSdfEDGQBMi1xQGr6i/HvpFKhGvu3b60JJpOAmUZnliO3JcMZkzsaP4azhxCIE=
=RljZ
-----END PGP SIGNATURE-----

--iq/fWD14IMVFWBCD--
