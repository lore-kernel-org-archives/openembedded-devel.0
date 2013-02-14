Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U5vcb-0000Vl-00
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 11:01:08 +0100
Received: by mail-pa0-f42.google.com with SMTP id kq12so1270900pab.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 01:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YpR3/16Ap3Y6YvIHEKjHO5mDyiGPJfcKsN+R/tJu2Sw=;
	b=zZ0GmqXiZI3nLgSCg9lJoGA5tYzhj+cK0fIpb69Po3XHamx5/EANyJC0wcx8+mWNzw
	+g079pe9z45ClPW2Zzq5+B1ZLXkbeokGI4NhywKonylh3SXhJzppMHyu4u+wxRAW5Pve
	1bqmX0kgknGB60MdnwEqBEJgQfh5Ng8jqaFraxo4QLIAA9eAeF3fdbUPtwMF1AuztXt6
	cx+RGkgfsCdd2I563EclCY8c+aw6k4jDHejF7kgQgUzwTOh6DYmsLm4ArVddUuvbn86P
	ASaYr3cjGi3AdVwYLN4/LWMW09cVs3ONBu9qBKcOm0oA9qkk+bQlkGSKN1GbAZvHRW20
	z86A==
X-Received: by 10.66.83.6 with SMTP id m6mr2227993pay.52.1360835090207;
	Thu, 14 Feb 2013 01:44:50 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vq9sm807733pbc.36.2013.02.14.01.44.47
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 14 Feb 2013 01:44:48 -0800 (PST)
Date: Thu, 14 Feb 2013 10:44:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130214094445.GJ3300@jama>
References: <1360834325-22890-1-git-send-email-florin.sarbu@windriver.com>
	<1360834325-22890-2-git-send-email-florin.sarbu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1360834325-22890-2-git-send-email-florin.sarbu@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-systemd][] rpcbind: Add ${PN}-systemd to PACKAGES
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
X-List-Received-Date: Thu, 14 Feb 2013 10:01:09 -0000
X-Groupsio-MsgNum: 43153
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEkEgRdBLZYkpbX2"
Content-Disposition: inline

--PEkEgRdBLZYkpbX2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 14, 2013 at 11:32:05AM +0200, Florin Sarbu wrote:
> The ${PN}-systemd should be added to PACKAGES
> so that the package gets created.
>=20
> Added do_install_append to have the systemd.service
> installed in the proper location.

see khem's patch fixing this in many recipes including rpcbind.

>=20
> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> ---
>  .../meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend    |    8 ++=
+++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.=
bbappend b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbap=
pend
> index 0fa7f97..8197550 100644
> --- a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
> +++ b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
> @@ -1,6 +1,8 @@
>  inherit systemd
> =20
> -PRINC :=3D "${@int(PRINC) + 1}"
> +PACKAGES =3D+ "${PN}-systemd"
> +
> +PRINC :=3D "${@int(PRINC) + 2}"
> =20
>  # look for files in the layer first
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> @@ -10,3 +12,7 @@ SRC_URI +=3D "file://rpcbind.service"
>  SYSTEMD_PACKAGES =3D "${PN}-systemd"
>  SYSTEMD_SERVICE =3D "rpcbind.service"
> =20
> +do_install_append() {
> +        install -d ${D}${systemd_unitdir}/system/
> +        install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir=
}/system
> +}
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PEkEgRdBLZYkpbX2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEcsg0ACgkQN1Ujt2V2gBykwwCfZPbxoY55u9oHNnMbnkXsxcTO
v9oAnjVHQ249f6tBeKBrd5+Exi4gcEyt
=rwbt
-----END PGP SIGNATURE-----

--PEkEgRdBLZYkpbX2--
