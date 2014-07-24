Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4FFD670668
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 11:02:14 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so2524670wgh.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 04:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nMJ1Mu1DpGRoqUvAPIsqVeIa9JiKY599sOUy3ZZwtzE=;
	b=SLrgcynzuzRii0rAB5Gpo2VOFGyXrTMU1fGDzuTxEKSbOUG5H3i7w2BUIV3SLGCjwV
	sr86qCexyKlp4DTjBhoZy8s8S6yCqa3YZUn0QCZzR/Ya2ljV6+Ubmkp7uNsDBFjTEh9J
	VmoC/cAjLk9dHE9F+7GE1vnzbOaHy9EM9VkHq1lv0kI4pu2SfkdC6jA3E+CvgFSEXApb
	hbcbx1G2Grz0nXFd8l8fG6EPpFmKhMEhkho5LgrWs/qUTQL6xDuqBYgwAYi15baOw5je
	zS7Q8LRHm2d7mD3FvMtnXZuGzvlyY5/hHpx31dAildoINdfTWym6p3r6YbkZhBrNqQp0
	aT1w==
X-Received: by 10.180.7.163 with SMTP id k3mr48947223wia.0.1406199735770;
	Thu, 24 Jul 2014 04:02:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	au7sm14895855wjc.41.2014.07.24.04.02.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 04:02:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Jul 2014 13:02:31 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140724110231.GG2492@jama>
References: <1406184181-23969-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1406184181-23969-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-networking] openvpn: not use the hardcoded libdir
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
X-List-Received-Date: Thu, 24 Jul 2014 11:02:17 -0000
X-Groupsio-MsgNum: 51228
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WHz+neNWvhIGAO8A"
Content-Disposition: inline

--WHz+neNWvhIGAO8A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2014 at 02:43:01PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> it will lead to QA failure, since .debug dir can not be installed into db=
g package
>=20
>     ERROR: QA Issue: non debug package contains .debug directory: openvpn=
 path
>     /work/core2-64-wrs-linux/openvpn/2.3.4-r0/packages-split/openvpn/usr/=
lib64i
>     /openvpn/plugins/.debug/openvpn-plugin-down-root.so [debug-files]

Can you please check this floating dependency?

snort/snort/latest lost dependency on  util-linux-libuuid                  =
                                                                           =
       =20

>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb b/m=
eta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
> index a3322a0..48e04b7 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
> @@ -28,4 +28,4 @@ do_install_append() {
> =20
>  RRECOMMENDS_${PN} =3D "kernel-module-tun"
> =20
> -FILES_${PN}-dbg +=3D "/usr/lib/openvpn/plugins/.debug"
> +FILES_${PN}-dbg +=3D "${libdir}/openvpn/plugins/.debug"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WHz+neNWvhIGAO8A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPQ58cACgkQN1Ujt2V2gBwQSACeJfOKxCCAg9S3dcRpRguRYk5G
6AsAoIhUspD1wF8ylBnrlfQl6zNxJaeW
=Y4hd
-----END PGP SIGNATURE-----

--WHz+neNWvhIGAO8A--
