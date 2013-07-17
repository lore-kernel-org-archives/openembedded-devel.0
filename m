Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 853766B289
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 20:01:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6HK1lJw008871
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 13:01:47 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 17 Jul 2013 13:01:45 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id EF1FB7FE8;
	Wed, 17 Jul 2013 16:01:44 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 06C55410E5; Wed,
	17 Jul 2013 15:55:19 -0400 (EDT)
Date: Wed, 17 Jul 2013 15:55:19 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <rongqing.li@windriver.com>
Message-ID: <20130717195519.GE31259@windriver.com>
References: <1373968419-2952-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1373968419-2952-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] The ip is being installed into /sbin as of the latest busybox.
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
X-List-Received-Date: Wed, 17 Jul 2013 20:01:47 -0000
X-Groupsio-MsgNum: 45399
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="65ImJOski3p8EhYV"
Content-Disposition: inline

--65ImJOski3p8EhYV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged.  Thanks.

-J.

[[meta-networking][PATCH] The ip is being installed into /sbin as of the la=
test busybox.] On 13.07.16 (Tue 17:53) rongqing.li@windriver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> The ip is being installed into /sbin as of the latest busybox, or oe-core.
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  .../recipes-protocols/zeroconf/zeroconf/debian-zeroconf            |    =
4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf/debian-z=
eroconf b/meta-networking/recipes-protocols/zeroconf/zeroconf/debian-zeroco=
nf
> index c3705d2..0c9d15b 100644
> --- a/meta-networking/recipes-protocols/zeroconf/zeroconf/debian-zeroconf
> +++ b/meta-networking/recipes-protocols/zeroconf/zeroconf/debian-zeroconf
> @@ -35,10 +35,10 @@ done
> =20
>  # should we only allocate an address if we do not already have one?
>  if [ -n "$FALLBACK" ]; then
> -    /bin/ip addr show $IFACE scope global | grep -q "inet"
> +    /sbin/ip addr show $IFACE scope global | grep -q "inet"
>      IP=3D$?
>      if [ $IP -eq 0 ]; then
> -        /bin/ip route add 169.254.0.0/16 dev $IFACE
> +        /sbin/ip route add 169.254.0.0/16 dev $IFACE
>          exit 0
>      fi
>  fi
--=20
-Joe MacDonald.
:wq

--65ImJOski3p8EhYV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHm9qcACgkQPN8S4W6ZZnfljQCeIPALYRyUVueWg0l0qJvQXgCt
gC4AnRXyq8jniz/uVX3jpPZpxMDDtnRu
=rxv6
-----END PGP SIGNATURE-----

--65ImJOski3p8EhYV--
