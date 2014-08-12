Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 15CC770C27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:50:55 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so9640874wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 04:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2ZC573guR2e4N8KPhpTTuTl6p5TR7khe5ZwW+E6ygZs=;
	b=JB2OrQVun33ziKqeRJgWe15/3UNmtG2GGlRTt4qXs0Bb6e0wP0yBPItb82Di3sF1lW
	L8nYPV1jPsULYlmfyKFWOlrlOW9ZkzPd4RWigak3BL+N13Tfz+XuH0l6w9BdeMDPnFwm
	Bh4NcKnPfuxThl8VZLOEpG19qvGiTt/8o7iNREhNc4x5frbBoF9BmtxYWlgpeYKduEDi
	NLbUsESdV4A6SdmDx/z258b5ztW1uQGOmsgA1Wp5/oUQZNzLHNZYjf0jryyNe846ps/o
	ucQkwSUYKC5mJCeV4pJhAEs91alOrqfrwnw8njYbOH4kWA9XAI89ChfQ61ga9VAYhsjI
	PJqQ==
X-Received: by 10.194.90.201 with SMTP id by9mr4784185wjb.94.1407844256606;
	Tue, 12 Aug 2014 04:50:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	10sm8753449wjx.26.2014.08.12.04.50.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 04:50:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 13:51:32 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140812115132.GK14848@jama>
References: <1407826864-32606-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1407826864-32606-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-networking] ifenslave: add recipes
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
X-List-Received-Date: Tue, 12 Aug 2014 11:50:58 -0000
X-Groupsio-MsgNum: 51617
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Aheoz1xTfOXEcBpP"
Content-Disposition: inline

--Aheoz1xTfOXEcBpP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 03:01:04PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../recipes-support/ifenslave/ifenslave_1.1.0.bb    |   19 +++++++++++++=
++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ifenslave/ifenslave_1=
=2E1.0.bb
>=20
> diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb=
 b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> new file mode 100644
> index 0000000..d6252a9
> --- /dev/null
> +++ b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "Configure network interfaces for parallel routing"

^ dropped in master-next

> +DESCRIPTION =3D "Configure network interfaces for parallel routing"
> +HOMEPAGE =3D "http://www.linuxfoundation.org/collaborate/workgroups/netw=
orking/bonding"
> +SECTION =3D "network"
> +LICENSE =3D "GPLv2"
> +
> +SRC_URI =3D "http://ftp.debian.org/debian/pool/main/i/${BPN}-2.6/${BPN}-=
2.6_${PV}.orig.tar.gz"
> +
> +do_compile() {
> +    ${CC} ifenslave.c -o ifenslave
> +}
> +do_install() {
> +    install -d "${D}${sbindir}"
> +    install -m 755 "${S}/ifenslave" "${D}${sbindir}/"
> +}
> +

^ moved next to LICENSE in master-next

> +LIC_FILES_CHKSUM =3D "file://ifenslave.c;beginline=3D8;endline=3D12;md5=
=3Da9f0bd2324cdc1b36d1f44f0e643a62a"
> +SRC_URI[md5sum] =3D "56126cd1013cefe0ce6f81613e677bdd"
> +SRC_URI[sha256sum] =3D "7917bf34de80a2492eb225adf9168c83a4854ac8a008ed0f=
d5b3fd147ccd3041"

^ moved next to SRC_URI in master-next
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

--Aheoz1xTfOXEcBpP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPp/8QACgkQN1Ujt2V2gBzgeACgr/EJcW4ql8BBPp6pYsnzdCYC
Pt8AoLr986i0NzqRYVzFOY8Rv7hb3mcm
=X1AY
-----END PGP SIGNATURE-----

--Aheoz1xTfOXEcBpP--
