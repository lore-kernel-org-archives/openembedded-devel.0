Return-Path: <joe@deserted.net>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id CC5166D1BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 14:27:12 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id f11so600318qae.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 07:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=4iLA9BAx4Z0LX0UQMikgdQiW9xZ4ft+QmQGu35dV/do=;
	b=RuUorSsDd46SbjNK5fE35srhG376rvPD88LQgl0BeMpbN769xKuM0+3eP3gSa8uvgH
	pQyANe5yjT778nXhUG/1rMZ/pPHNYAbsY2d9s7Eb6ZdFs1rh58rIeNU2QSSW0xlUrxGh
	0lVwj5C4lWWwL8z1BmdHGt5a8M+fszHJ1edgub4KMJSS29z4meGyGbLa8oxPSlNX9ybn
	8jnHMcQ77VeVZpHjd8mZSh7J2UrIzhY7d1aMYEftcYWacQPNpC16ON+M5EP2D2jdwSA1
	1L4un8l6CX2c34nbK2vSZq9CDkei9EXTdYxCLN1iHTt7uXQGepcl9ewLF4Kf53ScP0pm
	SNuA==
X-Gm-Message-State: ALoCoQnwNRA9U4YBvzN33mey5DE0Ou53gFJ10SI/PYocEBpZ5F0BE4KcznxjcMr7zzguDENoywV7
X-Received: by 10.49.94.172 with SMTP id dd12mr11330777qeb.4.1382711234528;
	Fri, 25 Oct 2013 07:27:14 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id ge5sm13806821qeb.5.2013.10.25.07.27.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Oct 2013 07:27:13 -0700 (PDT)
Date: Fri, 25 Oct 2013 10:27:11 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131025142709.GC4566@deserted.net>
References: <1382678604-2326-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1382678604-2326-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] macchanger: fix PN -> BPN in FILES_${PN} for multilibs
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
X-List-Received-Date: Fri, 25 Oct 2013 14:27:13 -0000
X-Groupsio-MsgNum: 46891
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UoPmpPX/dBe4BELn"
Content-Disposition: inline

--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [PATCH] macchanger: fix PN -> BPN in FILES_${PN} for multilibs] On 13=
=2E10.25 (Fri 13:23) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb |    6 ++=
+---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.=
bb b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> index 2ecfab2..8491dc0 100644
> --- a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> +++ b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> @@ -12,9 +12,9 @@ SRC_URI[md5sum] =3D "79b7cdaeca3d8ebafa764c4b0dd03ab7"
>  SRC_URI[sha256sum] =3D "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb203=
1120826cd73fa8fe"
> =20
>  FILES_${PN} =3D " \
> -    ${bindir}/${PN} \
> -    ${datadir}/${PN}/wireless.list \
> -    ${datadir}/${PN}/OUI.list \
> +    ${bindir}/${BPN} \
> +    ${datadir}/${BPN}/wireless.list \
> +    ${datadir}/${BPN}/OUI.list \
>  "
> =20
>  FILES_${PN}-doc =3D " \
--=20
-Joe MacDonald.
:wq

--UoPmpPX/dBe4BELn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJqf70ACgkQwFvcllog0Xyu/gCeNlKl4gYPrtF6Lts+M1Z0jBHL
9BkAoJAEHBYRWfhRE/TtW7Hx67969Etb
=YSN9
-----END PGP SIGNATURE-----

--UoPmpPX/dBe4BELn--
