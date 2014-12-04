Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9ABF760670;
	Thu,  4 Dec 2014 14:31:28 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id n12so14597550wgh.36
	for <multiple recipients>; Thu, 04 Dec 2014 06:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jybbi6TiA5nX22TxdjlZt6nos9URakLTnoUxMJkENS8=;
	b=bbuHZpPJw6pF/r+qCrt9U8b2ScodkhtpIrMMeIxwDF6ms4VFo2lHBTDPK5B7g4Dvmp
	WLj9lZzo7UdWl4drBZq1rtsMsio08RKEoKHC8m9EtlGHxzLbZriwCzvXV5wEpYuzcys2
	ZGqB7w0jgxQ8aJw6CfbdrYx3/H9NK7Jv1SeXEt8hI5R7Y8K3Mz1KZlJsFFxuYXWOvF48
	EuNlEMeNUav3R6aH4qy5h5fpmNCIAwJuSBRrTc891jQ3WmuFnehI3dlYr8RMvzw9ukyR
	PTRzONlrXJjGiZF2f7JNw58qzVaFsQbKj5nqzd2JLpM5syh1cYk7j92wmqZCTtRjW0iS
	LJOQ==
X-Received: by 10.180.74.68 with SMTP id r4mr21391038wiv.33.1417703488738;
	Thu, 04 Dec 2014 06:31:28 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fq1sm55203337wib.12.2014.12.04.06.31.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Dec 2014 06:31:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Dec 2014 15:31:30 +0100
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>,
	Joe MacDonald <joe_macdonald@mentor.com>
Message-ID: <20141204143130.GB2453@jama>
References: <20141203213917.576C6503EA@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20141203213917.576C6503EA@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Armin Kuster : netkit-rpc: New package
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
X-List-Received-Date: Thu, 04 Dec 2014 14:31:35 -0000
X-Groupsio-MsgNum: 53189
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline

--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2014 at 09:39:17PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 9bacae2ff83c7f89be184c48eb981861b1e7c68b
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D9bacae2ff83c7f89be184c48eb981861b1e7c68b
>=20
> Author: Armin Kuster <akuster808@gmail.com>
> Date:   Mon Dec  1 17:49:56 2014 -0800
>=20
> netkit-rpc: New package
>=20
> this adds rpcinfo and rpcgen
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>=20
> ---
>=20
>  .../netkit-rpc/netkit-rpc/gcc4.patch               | 39 ++++++++++++++++=
++++++
>  .../recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb   | 38 ++++++++++++++++=
+++++
>  2 files changed, 77 insertions(+)
>=20
> diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb=
 b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
> new file mode 100644
> index 0000000..4d8d95a
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
> @@ -0,0 +1,38 @@
> +DESCRIPTION =3D "netkit-rpc includes rpcinfo and rpcgen."
> +HOMEPAGE =3D "http://ftp.linux.org.uk/pub/linux/Networking/netkit"
> +SECTION =3D "networking"
> +LICENSE =3D "SPL-1.0"
> +LIC_FILES_CHKSUM =3D "file://rpcinfo/rpcinfo.c;beginline=3D2;endline=3D3=
;md5=3D3e6339e3ce266e1122c5ba293e04bc89"
> +
> +SRC_URI =3D "http://sources.openembedded.org/${BPN}-${PV}.tar.gz \

Is sources.openembedded.org really the primary source?

It's in default mirrors, for primary source we should use something
else and keep sources.oe.org only as fallback.

> +           file://gcc4.patch"
> +SRC_URI[md5sum] =3D "67212720482ea1aea9182a98653a9642"
> +SRC_URI[sha256sum] =3D "421d63b414162237a72867061f1bd3e3752a0d962cd5d30b=
5e933ddad8a14d3b"
> +

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSAcEIACgkQN1Ujt2V2gBz2FQCggg+Znm33GOvI+GiaUlr6sCZU
m+IAn2eJYavlNAKB2SEi3gWnGylAjYq6
=WCkH
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
