Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 368BF610F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 09:16:59 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id hz20so4141679lab.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 02:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i4sDM+JC0/huOhoTM5+urDw2K7j8sKPNGOpwf89MdHY=;
	b=PPQtGBy6IgD8rrdLd4bQBnN64D0f2gLrvsR1p7N+lHwp+q1XRdslEKw6KfP+BN3cmi
	SsDgZMW1CUPW8I9w0Q6yhH8fvw4BIlS6i3VgLLm+yf5MQOz1jskTW9uWB/r5MzdiUngE
	E3aDtWH/D6kdvT8XoUIG/3ZwcfCxfdKVEUNsASynijE8QN9h8Ldfjx0OWEViciOlR2pe
	3pUvtHXuoUFeTdJzU9Boy5FcvBajkzHV48JyWwDi1M1lijq9cruOV7WWtyLudgmDx+db
	ODWzzU+2tJ9aTuO6krvm9BIUAbJV7eP4P2x4BvhvHM9OmgfnHlvuzmKVSKm1wb0ORbrh
	WXyQ==
X-Received: by 10.112.14.199 with SMTP id r7mr26928587lbc.58.1408353419819;
	Mon, 18 Aug 2014 02:16:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pq3sm8812000lbc.20.2014.08.18.02.16.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Aug 2014 02:16:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 18 Aug 2014 11:16:58 +0200
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-ID: <20140818091658.GJ3660@jama>
References: <1408345522-29466-1-git-send-email-maciej.borzecki@open-rnd.pl>
MIME-Version: 1.0
In-Reply-To: <1408345522-29466-1-git-send-email-maciej.borzecki@open-rnd.pl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] collectd: make pinba support a selectable feature
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
X-List-Received-Date: Mon, 18 Aug 2014 09:17:01 -0000
X-Groupsio-MsgNum: 51741
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jITzwD3HDGXid3BE"
Content-Disposition: inline

--jITzwD3HDGXid3BE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2014 at 09:05:22AM +0200, Maciej Borzecki wrote:
> Pinba support requires protobuf-c that is currently only available in
> meta-virtualization layer. Make this a selectable feature.

I'll add this as comment above PACKAGECONFIG as requested.

> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> ---
>=20
> Notes:
>     Updated pinba plugin dependency to protobuf-c.
>=20
>  meta-oe/recipes-extended/collectd/collectd_5.2.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-o=
e/recipes-extended/collectd/collectd_5.2.2.bb
> index 30279c2..443f85d 100644
> --- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> +++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> @@ -32,6 +32,7 @@ PACKAGECONFIG[sensors] =3D "--enable-sensors --with-lib=
sensors=3Dyes, \
>          --disable-sensors --with-libsensors=3Dno,lmsensors"
>  PACKAGECONFIG[amqp] =3D "--enable-amqp --with-librabbitmq=3Dyes, \
>          --disable-amqp --with-librabbitmq=3Dno,rabbitmq-c"
> +PACKAGECONFIG[pinba] =3D "--enable-pinba,--disable-pinba,protobuf-c-nati=
ve protobuf-c"
> =20
>  EXTRA_OECONF =3D " \
>                  ${FPLAYOUT} \
> --=20
> 1.9.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jITzwD3HDGXid3BE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPxxIoACgkQN1Ujt2V2gBysEgCcD6CstCg/Djlz7TxgVZeX+MCM
6mEAoKRIO7clkfdhgrPoyz+oz56ob4TH
=MTZX
-----END PGP SIGNATURE-----

--jITzwD3HDGXid3BE--
