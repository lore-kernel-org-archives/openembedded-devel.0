Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbvTC-0008Su-T1
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:47:11 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so5074012eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2012 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uufoOVZjzK1Aj5L48dSy1BNPlsrp0yRgsJl3b/Gm7wM=;
	b=D8jumY2w8ZHSTJx5kHB8hloonH3wV17xE1OkfLe6j2DX5u1WT08h7Z84zfqPMNTFTq
	mYxIY8YNwGAVfaPI3r87uZIkbU6h40KIidaseHf23fgrOlaDMMaW70I9V7lG4M8OFzKz
	rZgn7X+GUaTEqjo2uKmFF8+28xVueIxlAD0+eop8PQclt+mq7kk+qE29aGXDozeJMrgj
	K5qg4xcxpQ21nn/FNJisUOmJnr+9fF9AXq+J0guIy6RU7JyX3AIgn/obirjvmnJTcrMZ
	wfSlYDHA/EyXukrQISsIL1LAQBs74qJovgJzKzBapawem9vQKoCrRgq0Au5ytDT9DgS5
	PnRQ==
Received: by 10.14.223.4 with SMTP id u4mr14568593eep.19.1353684783392;
	Fri, 23 Nov 2012 07:33:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b44sm14251389eep.12.2012.11.23.07.33.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Nov 2012 07:33:02 -0800 (PST)
Date: Fri, 23 Nov 2012 16:33:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121123153303.GR12637@jama.jama.net>
References: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1353684287-19180-5-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1353684287-19180-5-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 4/9] packagegroup-cli-tools: remove mdbus2, mterm2, mkdump, mioctl
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
X-List-Received-Date: Fri, 23 Nov 2012 15:47:11 -0000
X-Groupsio-MsgNum: 41689
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hu4eBwDcaFkzFmlO"
Content-Disposition: inline

--hu4eBwDcaFkzFmlO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2012 at 04:24:42PM +0100, Marcin Juszkiewicz wrote:
> Missing or unbuildable dependency chain was: ['mdbus2']
> Missing or unbuildable dependency chain was: ['mterm2']
> Missing or unbuildable dependency chain was: ['mkdump']
> Missing or unbuildable dependency chain was: ['mioctl']

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb=
 b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> index 07fb056..88b62b8 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> @@ -4,7 +4,7 @@ SECTION =3D "console"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
>  PV =3D "1.0"
> -PR =3D "r20"
> +PR =3D "r21"
> =20
>  inherit packagegroup allarch
> =20
> @@ -24,9 +24,7 @@ RDEPENDS_${PN} =3D "\
>    iptables \
>    lsof \
>    mbuffer \
> -  mdbus2 \
>    mtd-utils \
> -  mterm2 \
>    nano \
>    nfs-utils-client \
>    nmon \
> @@ -41,8 +39,6 @@ RDEPENDS_${PN}-debug =3D "\
>    devmem2 \
>    i2c-tools \
>    gdb \
> -  mkdump \
> -  mioctl \
>    procps \
>    pxaregs \
>    s3c24xx-gpio \
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hu4eBwDcaFkzFmlO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCvly8ACgkQN1Ujt2V2gBxUXwCgpw3DuRuwAsUrokmO1vMpVxtE
s0kAnjBP2+MysiSlElRE3cktbwoyT6Jj
=ZNu1
-----END PGP SIGNATURE-----

--hu4eBwDcaFkzFmlO--
