Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4D6246F3A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 23:11:50 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id o10so787550eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 15:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fUwjTbRpNljdPPYgY+xLVcMSRByHuPHainrQQUJz6EM=;
	b=jOpyzMPlql4l+lxmas7cmq/0JPG1yWsrD12a6iUl7JKbBdvVtxsIcWJ6ToRJuiQN+0
	l0gXW+XjyXrNhh85rP6yxR4CiOEvyNANHmIhYCES3LlfDIvp1TsOSyDRdanWzu8+wA7R
	jfnK3wY/Mw5dexSRMYtRO/eVwevhf1tQtgnL7CAQYfA93wymMy8dNowT9gXiY+NXGU9X
	YwWqHZaAKUzCDgU+1h60Yes9dQy2aL27dLUsK7BzFvXYvxnvqEsrPfwYSussZQ8/HN0u
	SnxfBMqKqRH+cmlygQfzECwR4hPFe7ByCb8IvkIG4DPfEBZkGwBh2Cw3bj6hr6+DOp4H
	ndug==
X-Received: by 10.15.48.1 with SMTP id g1mr9400450eew.51.1393456310701;
	Wed, 26 Feb 2014 15:11:50 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id m1sm9388613een.7.2014.02.26.15.11.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 15:11:49 -0800 (PST)
Date: Thu, 27 Feb 2014 00:11:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20140226231150.GV26981@jama>
References: <cover.1393325556.git.hongxu.jia@windriver.com>
	<a1776d6a50c9a7fcd20a4fc7ce55931088872cfb.1393325556.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <a1776d6a50c9a7fcd20a4fc7ce55931088872cfb.1393325556.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] strongswan: fix building lib32-strongswan failed while systemd enabled
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
X-List-Received-Date: Wed, 26 Feb 2014 23:11:51 -0000
X-Groupsio-MsgNum: 48373
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2+K7TauFN1Oc3ugB"
Content-Disposition: inline

--2+K7TauFN1Oc3ugB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2014 at 06:54:16PM +0800, Hongxu Jia wrote:
> While systemd enabled, there was an error to build lib32-strongswan:
> ...
> | ERROR: Function failed: SYSTEMD_SERVICE_lib32-strongswan value
> lib32-strongswan.service does not exist
> ...

Please use [meta-networking] tag in subject so it's easier to filter=20
them on patchwork to separate bundles.

>=20
> The name of the service file should be the hardcoded
> 'strongswan.service' rather than '${PN}.service', so
> the 'strongswan.service' will be found while building
> lib32-strongswan.
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.0.0.=
bb b/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
> index eb49494..e45e81a 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
> @@ -33,4 +33,4 @@ INSANE_SKIP_${PN}-plugins =3D "staticdev"
>  RPROVIDES_${PN} +=3D "${PN}-systemd"
>  RREPLACES_${PN} +=3D "${PN}-systemd"
>  RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "${PN}.service"
> +SYSTEMD_SERVICE_${PN} =3D "strongswan.service"
> --=20
> 1.8.1.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2+K7TauFN1Oc3ugB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMOdLYACgkQN1Ujt2V2gBwrpACfZhWUFATyPmlMRxyX4YpAQH/Y
lPcAniNoDTbnglMqMB5DYCQ08ygumcWy
=MI/n
-----END PGP SIGNATURE-----

--2+K7TauFN1Oc3ugB--
