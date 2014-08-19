Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 13AFE65DEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 12:07:39 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so5279692wiv.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 05:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+sC5MMoKdrcR89jnBR9kXpv7I6lQmLB4cQP+8sTAvLI=;
	b=z9wxWsw99i5wq4ott+aQ2/FeMp2lKv+n2F7UMaweuuSRB2PFvLU4W51teVobUrlzOv
	BwMsd/DkoZd3+YGUccqEiueLF7McbWzsB6kFqUUFc4P6IjP0Xr9oGJT7dJ9klZuHV43l
	gOa3jxC4TIhyzrnSqUCO2Do+3G8xqDQCP9T3i8RTjhxq1dSxmIZKEEECFlJLqU/a25zU
	YmfCd81R4uESXQJ3MYYrR6904Mt1OP3MM6foy8ZbMe+U7pWKeWZqmDrGaaKnzWAcdLiF
	QVeDSN9/AaFaPeP7j3/AO50WwWZfr5P/1J/bMWrgU+gjrmQm0IpXxd1m9kKBhLCHYQd5
	dvjw==
X-Received: by 10.194.103.41 with SMTP id ft9mr2018131wjb.93.1408450059743;
	Tue, 19 Aug 2014 05:07:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ge8sm48135703wib.4.2014.08.19.05.07.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 05:07:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Aug 2014 14:07:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140819120740.GR3660@jama>
References: <1408448964-11764-1-git-send-email-yasir_khan@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1408448964-11764-1-git-send-email-yasir_khan@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH] lmbench: if a machine config file exists, install it
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
X-List-Received-Date: Tue, 19 Aug 2014 12:07:44 -0000
X-Groupsio-MsgNum: 51775
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+d/sD+4Memv8CeGA"
Content-Disposition: inline

--+d/sD+4Memv8CeGA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 04:49:24PM +0500, Yasir-Khan wrote:
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> ---
>  .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-o=
e/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> index 41db150..a3873a6 100644
> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> @@ -60,6 +60,13 @@ do_install () {
>             ${D}${bindir}/lmbench-run
>      install -m 0755 ${S}/scripts/lmbench ${D}${bindir}
>      install -m 0755 ${S}/scripts/* ${D}${datadir}/lmbench/scripts
> +
> +    # If the machine installs a config file, install it to the appropria=
te place
> +    if [ -f ${WORKDIR}/CONFIG.${MACHINE} ]; then
> +        install -D 0644 ${WORKDIR}/CONFIG.${MACHINE} \
> +                        ${D}/${datadir}/lmbench/bin/${TARGET_PREFIX}/CON=
FIG.${MACHINE}
> +    fi

that makes lmbench MACHINE_ARCH and PACKAGE_ARCH isn't set that way.

> =20
>  pkg_postinst_${PN} () {
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+d/sD+4Memv8CeGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPzPgwACgkQN1Ujt2V2gBy7VQCfWgDofQA5yaRF/4sjxg8b54ai
Vw0AmgICA2l3SLGbnPrvhhN3MvMgmBdM
=s9at
-----END PGP SIGNATURE-----

--+d/sD+4Memv8CeGA--
