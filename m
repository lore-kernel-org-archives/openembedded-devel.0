Return-Path: <joe@deserted.net>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8B4FE6F75F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 14:29:39 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id lx4so2612983iec.38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 07:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=OX9aJUxvmh5YIZI4dO2OsoCyQ+Ubj0b1dblg4Bl0yPY=;
	b=KniQFA9uUY/GsDmZmA9MyrETfpLbxJVdlnCD81msgCre88WmYZo4CQBdhS+lJ3f53e
	PNEnXfrJg5dYKSs6yIJ/LMhxcFML1vhn+NxrtLCx7Q8sJosq5d2gzbvsafXpkyuBJUa9
	oAl4IiFcA22s79T5X0ASqx8lpfg0Whnlg6CcbtK84WmExJ+/2TRunB6wuh39SJMdvLbw
	LBBLUTigl+lwMW/wca++CPRpTX2rVySiYoZFAJCVooqF+mvGwDSVhegNpJCG9PJtO3JA
	Vd1yX+tulqrXnseLSue9Y/eRGg6jiVS0295B3DoF6N/oltsEAraMhgT1SfPLOXrrddbp
	CVNA==
X-Gm-Message-State: ALoCoQluchG1apyz1uemQpyQOhdk2DONT1Sz7U3ZfHejAB5k5gpyBSPLWAhaRc4vuA4kfNSLr7BP
X-Received: by 10.42.48.79 with SMTP id r15mr1422580icf.88.1394807380023;
	Fri, 14 Mar 2014 07:29:40 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	ro10sm79705857igb.6.2014.03.14.07.29.38 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 14 Mar 2014 07:29:38 -0700 (PDT)
Date: Fri, 14 Mar 2014 10:29:34 -0400
From: Joe MacDonald <joe@deserted.net>
To: Javier Viguera <javier.viguera@digi.com>
Message-ID: <20140314142924.GA8326@deserted.net>
References: <1394638020-27867-1-git-send-email-javier.viguera@digi.com>
MIME-Version: 1.0
In-Reply-To: <1394638020-27867-1-git-send-email-javier.viguera@digi.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] crda: fix udev rule
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
X-List-Received-Date: Fri, 14 Mar 2014 14:29:40 -0000
X-Groupsio-MsgNum: 48667
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[meta-networking] crda: fix udev rule] On 14.03.12 (Wed 16:27) Javier Vigu=
era wrote:

> The SBINDIR variable in makefile's install rule needs to have a trailing
> slash so the path to the 'crda' binary in the udev rule is correct.
>=20
> Otherwise the udev rule has a wrong path:
>=20
> KERNEL=3D=3D"regulatory*", ACTION=3D=3D"change", SUBSYSTEM=3D=3D"platform=
", RUN+=3D"/usr/sbincrda"
>=20
> and at runtime udev complains:
>=20
> failed to execute '/usr/sbincrda'
>=20
> when a regulatory domain event is triggered.
>=20
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> Acked-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> ---
> meta-networking/recipes-connectivity/crda/crda_1.1.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb b/me=
ta-networking/recipes-connectivity/crda/crda_1.1.3.bb
> index bee3e826d9a8..0bb899860bc4 100644
> --- a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
> +++ b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
> @@ -24,7 +24,7 @@ do_compile() {
>  }
> =20
>  do_install() {
> -    oe_runmake SBINDIR=3D${sbindir} install
> +    oe_runmake SBINDIR=3D${sbindir}/ install
> =20
>      install -d ${D}${libdir}/crda/
> =20

--=20
-Joe MacDonald.
:wq

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlMjEkQACgkQwFvcllog0XyFGQCeJ028Rca0EnHWywIYOHoTamW2
hp8An2l16dMjDWgKHPfZm8WDoWhWG6fI
=KhlP
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
