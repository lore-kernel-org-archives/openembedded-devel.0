Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7F79360B9B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 23:11:35 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so933325eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 15:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dmdn+EWdVg9tw6Bv20yG1cpeCZmZh77ocmwYTOFTDqE=;
	b=nwaIQH4xm8WsCfkjEaT0B97eB5x5VtxdFs4hfF3PO6OORmahi6BfxjlR2sPAGU1s1b
	mfUC9sWuqToCMEY9neIdCCMCsoYuICjoGoKKW+g/ExZD61my2eRQbiiFCTw4iESTIrRh
	KEmRnzvf0pph+NrAsQJlyP6rBzf/mBCIwgtu7+N78CgOWfxkDK/ddsBexQgFX1JJLpdu
	MG4/wb2W8iKmwxvnDau0U6qLhFmrXkBk9KAcdfAZ21RQKvc6HMZ+vCvOshuzXfz9ygcZ
	WCMtGXEKXyuwj0TVsCXBm1UWDgWYv4bJb7FE0XH2fXyY8op84koCEBaTVBBxZJH40cFH
	HCkQ==
X-Received: by 10.15.22.65 with SMTP id e41mr9679071eeu.5.1393456294576;
	Wed, 26 Feb 2014 15:11:34 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i1sm9444029eeo.16.2014.02.26.15.11.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 15:11:33 -0800 (PST)
Date: Thu, 27 Feb 2014 00:11:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20140226231134.GU26981@jama>
References: <cover.1393308745.git.hongxu.jia@windriver.com>
	<69f299d4f94277fcebacb27c0820b30d27dca4c1.1393308745.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <69f299d4f94277fcebacb27c0820b30d27dca4c1.1393308745.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] traceroute: rename alternatives name
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
X-List-Received-Date: Wed, 26 Feb 2014 23:11:39 -0000
X-Groupsio-MsgNum: 48372
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bE2XbrxqIoa/xW9+"
Content-Disposition: inline

--bE2XbrxqIoa/xW9+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2014 at 02:14:30PM +0800, Hongxu Jia wrote:
> Rename traceroute's alternatives name from 'traceroute6' to 'traceroute'.

Please use [meta-networking] tag in subject so it's easier to filter
them on patchwork to separate bundles.

>=20
> The 'traceroute6' is equivalent to 'traceroute -6' which means traceroute
> in IPv6, and traceroute also supports IPv4. So traceroute6 is part of
> traceroute and they are not equivalent.
>=20
> The Ubuntu 13.04 treated them as two different alternatives name also.
> ...
> $ ls -al /usr/bin/traceroute*
> lrwxrwxrwx 1 root root    28 Feb 25 13:31 /usr/bin/traceroute -> /etc/alt=
ernatives/traceroute
> lrwxrwxrwx 1 root root    29 Oct 22  2012 /usr/bin/traceroute6 -> /etc/al=
ternatives/traceroute6
> ...
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18=
=2Ebb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> index e6718db..83ac5a7 100644
> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> @@ -39,5 +39,5 @@ do_install() {
> =20
>  }
> =20
> -ALTERNATIVE_${PN} =3D "traceroute6"
> -ALTERNATIVE_LINK_NAME[traceroute6] =3D "${bindir}/traceroute"
> +ALTERNATIVE_${PN} =3D "traceroute"
> +ALTERNATIVE_LINK_NAME[traceroute] =3D "${bindir}/traceroute"
> --=20
> 1.8.1.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bE2XbrxqIoa/xW9+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMOdKYACgkQN1Ujt2V2gBzXggCfecCd6afwZoUst90RF2OCjSb6
XocAoKRSVVHp9DEksUbXxkJ7iQPjkSE9
=dsfZ
-----END PGP SIGNATURE-----

--bE2XbrxqIoa/xW9+--
