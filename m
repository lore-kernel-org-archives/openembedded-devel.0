Return-Path: <joe@deserted.net>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0FFAF6D34D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 14:27:30 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id l13so2487823qcy.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2013 07:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=gz8V5eCgC6iCNBYX7po5rFHvfMArMSGfyZrtE95GZBE=;
	b=IsqbpB6FhlYMzrgD+2oaUOgh3+ippomHQVIDgyLhP+bERre9dl3y1cykfH+CzyaCaR
	ussjDCpaKurCTG455YGLXt9f/o20+3O5JMRzbmVcQnpz557lLZqqLi43UWLJ0XrAMjWK
	S/jnFlo64dsjd5TXuluEMRPCynpCjgoDdRqzQtGHGfWdpJo5Lf0QvUQOG7YVC1qfWXpA
	KxN6cpzA36MqNK54rY/AYH3x9OxwxuL+JSWmtH4mKJ516nbaYqptjeSzZ2wKaHA7ecxl
	f/COvk6nC6Td4uJofzrXTCbB2ab2wda1+E6QNhnrj2RSby0/Hp9W+TvKlPJgrO/Zf9WK
	03/A==
X-Gm-Message-State: ALoCoQk3DZxXXeHdUPaw0VQH9ncVAoSMmrBSuUESOvb7AyPYQFiPn5PJJcKUiu+xwAyZUlfFboTn
X-Received: by 10.224.151.76 with SMTP id b12mr4332059qaw.49.1383316052807;
	Fri, 01 Nov 2013 07:27:32 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id jw9sm17999468qeb.2.2013.11.01.07.27.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Nov 2013 07:27:32 -0700 (PDT)
Date: Fri, 1 Nov 2013 10:27:29 -0400
From: Joe MacDonald <joe@deserted.net>
To: Qi.Chen@windriver.com
Message-ID: <20131101142728.GE4412@deserted.net>
References: <1383200986-18674-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1383200986-18674-1-git-send-email-Qi.Chen@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/5] cyrus-sasl: remove the unnecessary pkg_postinst
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
X-List-Received-Date: Fri, 01 Nov 2013 14:27:31 -0000
X-Groupsio-MsgNum: 46979
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ryJZkp9/svQ58syV"
Content-Disposition: inline

--ryJZkp9/svQ58syV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged this set.  Thanks.
-J.

[[oe][meta-networking][PATCH 1/5] cyrus-sasl: remove the unnecessary pkg_po=
stinst] On 13.10.31 (Thu 14:29) Qi.Chen@windriver.com wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> saslpasswd2 is used by an administrator to set a user's sasl password,
> setting a default one in pkg_postinst in not only unnecessary but also
> inappropriate.
>=20
> Besides, running saslpasswd2 takes a significant amount of time to finish,
> so this pkg_postinst will make the first boot take longer time.
>=20
> According to the above two reasons, the patch remove the pkg_postint.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |    5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26=
=2Ebb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> index f05ab85..b4e9190 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -54,11 +54,6 @@ USERADD_PACKAGES =3D "${PN}-bin"
>  GROUPADD_PARAM_${PN}-bin =3D "--system mail"
>  USERADD_PARAM_${PN}-bin =3D "--system --home=3D/var/spool/mail -g mail c=
yrus"
> =20
> -pkg_postinst_${PN}-bin () {
> -    echo "cyrus" | saslpasswd2 -p -c cyrus
> -    chgrp mail /etc/sasldb2
> -}
> -
>  SRC_URI[md5sum] =3D "a7f4e5e559a0e37b3ffc438c9456e425"
>  SRC_URI[sha256sum] =3D "8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16=
b3d406f1345b7bc3"
> =20
--=20
-Joe MacDonald.
:wq

--ryJZkp9/svQ58syV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJzulAACgkQwFvcllog0XxTEgCghDsWnmvxioD93789U7nx80s+
WzAAoIQfNxkSKif57L4zSAcY8YAH1meL
=VTT/
-----END PGP SIGNATURE-----

--ryJZkp9/svQ58syV--
