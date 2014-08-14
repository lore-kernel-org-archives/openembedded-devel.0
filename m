Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 785DF60196
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:41:44 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id el20so1336881lab.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uGZ2RZg1HkRE0rnf3tkI7zG//zuvhGgHPPi+n31xiNM=;
	b=b1J/x8hqWlMbFEpSbpj0YGbSRmbexauGemLsvDf82JRE1Grv6PqcalS8TJdYq9986D
	NgXTXuxFWE3WzyMLu/mTYW2171F8ZD7xISjXIkcuXk/q5bh60Qx9PvYIQWw1+62Bou2L
	4wkxKIYOHymHPigDjRkfYms8m+UOGag6AL4UZ+WnV695Mb6zmCjTp1t/pwhq+LY0gEvN
	pXr4OfjwTBsCrCeTMfCQ/PQD0yJPqmZ7mT8YgDbaQFJXfnPJYjDmnEHWq92NIty96C5j
	4e3QgKag7jcTJISqu1UjA1J8f5kTMn+CX4nC4ak987hiIX+i9if5AybrsB6dcCiTjKq+
	V0ow==
X-Received: by 10.152.42.196 with SMTP id q4mr5970859lal.47.1408030904433;
	Thu, 14 Aug 2014 08:41:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	as3sm8394134lbc.7.2014.08.14.08.41.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 08:41:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 17:42:20 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140814154220.GL14848@jama>
References: <1408030303-742-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1408030303-742-3-git-send-email-maciej.borzecki@open-rnd.pl>
MIME-Version: 1.0
In-Reply-To: <1408030303-742-3-git-send-email-maciej.borzecki@open-rnd.pl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [meta-oe][PATCH 2/2] collectd: make pinba support a selectable feature
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
X-List-Received-Date: Thu, 14 Aug 2014 15:41:51 -0000
X-Groupsio-MsgNum: 51700
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+FXO89QiasSPfgz+"
Content-Disposition: inline

--+FXO89QiasSPfgz+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 05:31:43PM +0200, Maciej Borzecki wrote:
> Pinba support requires protobuf-c that is currently only available in
> meta-virtualization layer. Make this a selectable feature.

There is some protobuf in meta-oe
meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb

is protobuf-c something else?

> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> ---
>  meta-oe/recipes-extended/collectd/collectd_5.2.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-o=
e/recipes-extended/collectd/collectd_5.2.2.bb
> index 30279c2..837eae5 100644
> --- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> +++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> @@ -32,6 +32,7 @@ PACKAGECONFIG[sensors] =3D "--enable-sensors --with-lib=
sensors=3Dyes, \
>          --disable-sensors --with-libsensors=3Dno,lmsensors"
>  PACKAGECONFIG[amqp] =3D "--enable-amqp --with-librabbitmq=3Dyes, \
>          --disable-amqp --with-librabbitmq=3Dno,rabbitmq-c"
> +PACKAGECONFIG[pinba] =3D "--enable-pinba,--disable-pinba,protobuf protob=
uf-native"
> =20
>  EXTRA_OECONF =3D " \
>                  ${FPLAYOUT} \
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+FXO89QiasSPfgz+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPs2NwACgkQN1Ujt2V2gBxyLgCghmIYG+KQKGDzaI75pGBVv3BV
TnoAoLShnGPL+h/bl8ocGImcEBvnPGN4
=p4mi
-----END PGP SIGNATURE-----

--+FXO89QiasSPfgz+--
