Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SfnAI-0008FC-Pq
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jun 2012 09:11:22 +0200
Received: by wgbdr1 with SMTP id dr1so3297270wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2012 00:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+tG5QeiJQFkC5qfzuF5Nthtm2niilbDCkFlqqvJkBB8=;
	b=xA+gz+u4NRhxJHT9X9uVLW25c+JSTo6MnufUs82vAYX2tUHsQshQkasPPkz0aU6JIs
	K5HOaEx8NFQNR9RFLN4NrBbWxteLwoYxsn0831RBOf8DUTfdEKSATIwuRbxIM6h+Y+Ot
	q2YULCYwUWGG0Dn4G2JzhF/jhlW0+ofYtkjsYoDX/wPneX7EYpXJVcoe5HBQ98i0bgiU
	Nua35ATsvsBTAC4ahlX7o91JhBq/y6wEyBDlM1bKKqutLK58AIWpKEHiFVqBFudj14UU
	X5eYLpZ2qFWezAprTJPV+y4/hktpu+5U2yETDrQ1PgrNv3ssyTwz7MPIUA3s8ceoPYLh
	oEGA==
Received: by 10.216.210.225 with SMTP id u75mr4666759weo.13.1339830039902;
	Sat, 16 Jun 2012 00:00:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i10sm14621146wiy.10.2012.06.16.00.00.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Jun 2012 00:00:38 -0700 (PDT)
Date: Sat, 16 Jun 2012 09:00:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120616070059.GB3140@jama.jama.net>
References: <1337788230-8841-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1337788230-8841-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-initramfs][PATCH] meta-initramfs: append to BBPATH instead of prepend so order of bblayers.conf is respected
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
X-List-Received-Date: Sat, 16 Jun 2012 07:11:22 -0000
X-Groupsio-MsgNum: 39253
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mZSo2Zk6iB5ZAp9g"
Content-Disposition: inline

--mZSo2Zk6iB5ZAp9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 23, 2012 at 05:50:30PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

ping

> ---
>  meta-initramfs/conf/layer.conf |   11 ++++++++---
>  1 files changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.c=
onf
> index 469cde5..cc78c1a 100644
> --- a/meta-initramfs/conf/layer.conf
> +++ b/meta-initramfs/conf/layer.conf
> @@ -1,11 +1,16 @@
>  # Layer configuration for meta-initramfs layer
> =20
> -# We have a conf and classes directory, prepend to BBPATH to prefer our =
versions
> -BBPATH :=3D "${LAYERDIR}:${BBPATH}"
> +# We have a conf and classes directory, append to BBPATH
> +BBPATH .=3D ":${LAYERDIR}"
> =20
>  # We have a recipes directory, add to BBFILES
> -BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipe=
s-*/*/*.bbappend"
> +BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bba=
ppend"
> =20
>  BBFILE_COLLECTIONS +=3D "meta-initramfs"
>  BBFILE_PATTERN_meta-initramfs :=3D "^${LAYERDIR}/"
> +
> +# Define the priority for recipes (.bb files) from this layer,
> +# choosing carefully how this layer interacts with all of the
> +# other layers.
> +
>  BBFILE_PRIORITY_meta-initramfs =3D "8"
> --=20
> 1.7.8.6
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mZSo2Zk6iB5ZAp9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/cLysACgkQN1Ujt2V2gBwDgQCfdeOB7SK6MYsEYuC9DMEXIQ7r
cF8An1PJC+JO4oJgceiCkKnthAR6D+RZ
=uQYt
-----END PGP SIGNATURE-----

--mZSo2Zk6iB5ZAp9g--
