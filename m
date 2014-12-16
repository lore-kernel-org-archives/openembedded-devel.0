Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0CEEB7259C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 10:47:00 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so11814645wiw.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 02:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=I2WZiNeI8iBVG3E230kfxZS2+0nGi2hMOxyRKpuFc3U=;
	b=BfTa4GnyeQwwJNW2qEHs4VCkT8nrneE7NxrYIQBSMoZ5NubjzG5S4SZAZy4laUDXq8
	jErUJWs4hsFppl+5qMC29FX119ORUn8z9CeQOHfVmgXpwbmMPAl07W9JD9/jGoRPZD9j
	4PoWdD71RuDxuTQ61nHEQEgDYJ0cOhAy000hx5OKiTPqH7KjVm3r3tORV9aq6T6gZbxT
	6Dj8DXo3f5ufmEwyorDKb+RTa28UcqyJ/pqw/iQ6YV0pMgOLRSWaQbdLFZQaAjSire3n
	IrDgqxCltM3ZcWQRPmyGJrjT737c5z3AyXDmtNvNX/oDusJGcNKZo7XEOdo3zPE1Tx/q
	bAZA==
X-Received: by 10.180.109.45 with SMTP id hp13mr3636394wib.4.1418726819845;
	Tue, 16 Dec 2014 02:46:59 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dg7sm1638097wib.24.2014.12.16.02.46.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Dec 2014 02:46:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 16 Dec 2014 11:46:59 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141216104659.GA2466@jama>
References: <1418695179-32300-1-git-send-email-wenzong.fan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1418695179-32300-1-git-send-email-wenzong.fan@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-oe] collectd: add PACKAGECONFIG for libvirt
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
X-List-Received-Date: Tue, 16 Dec 2014 10:47:02 -0000
X-Groupsio-MsgNum: 53339
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline

--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2014 at 09:59:39AM +0800, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> Add PACKAGECONFIG for 'libvirt', otherwise there would be warnings
> like below:
>=20
> WARN: collectd: collectd rdepends on libvirt, but it isn't a build
> dependency?

What about other floating dependencies reported in test-dependencies
e-mail?

WARN: collectd: collectd rdepends on libcrypto, but it isn't a build
dependency?                                                                =
             =20
WARN: collectd: collectd rdepends on libesmtp, but it isn't a build
dependency?                                                                =
              =20
WARN: collectd: collectd rdepends on libssl, but it isn't a build
dependency?                                                                =
                =20

>=20
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta-oe/recipes-extended/collectd/collectd_5.4.1.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb b/meta-o=
e/recipes-extended/collectd/collectd_5.4.1.bb
> index 46752c8..6e82bbc 100644
> --- a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
> +++ b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
> @@ -35,8 +35,9 @@ PACKAGECONFIG[sensors] =3D "--enable-sensors --with-lib=
sensors=3Dyes, \
>          --disable-sensors --with-libsensors=3Dno,lmsensors"
>  PACKAGECONFIG[amqp] =3D "--enable-amqp --with-librabbitmq=3Dyes, \
>          --disable-amqp --with-librabbitmq=3Dno,rabbitmq-c"
> -# protobuf-c that is currently only available in meta-virtualization lay=
er
> +# protobuf-c, libvirt that are currently only available in meta-virtuali=
zation layer
>  PACKAGECONFIG[pinba] =3D "--enable-pinba,--disable-pinba,protobuf-c-nati=
ve protobuf-c"
> +PACKAGECONFIG[libvirt] =3D "--enable-libvirt,--disable-libvirt,libvirt"
> =20
>  EXTRA_OECONF =3D " \
>                  ${FPLAYOUT} \
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSQDaMACgkQN1Ujt2V2gBx+xACfa5FPRWZR4DNEOOAxwEyWYvMK
pgAAoJsXx5xQ9gEVZcNW6inbjlF4KJjJ
=XUyF
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
