Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4752073237
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 16:34:02 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so147660748wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=d4bBxb5MTHHZKrNfkyIqIL19qnxHKX2zV3mvadYSbpQ=;
	b=HZpoAFhrl0uEbkQG1kILX9UtkS06kfOa4AmM4njV4qr50qU+jiQmR79vYIhgzlCsoI
	NNGtur3m3RERGE43eSxa4huL/q0bEMaTgnpzzPWJCDBoIvJu501KribfC6gxQXaA+5VW
	Qsx1AJAeWyH9VtU6Tu/weMLR8hybd4teVy/3OVl5NoHaBpKrwGkHb5GDGVmjcoz/qEmL
	D2vTfGDc0iZy+8nV8rsaEPr4mXVy2uWJVhGD58szDs9kYGraIypa9WTsATk/3LQsap7/
	podX1fy4WqByqQPMN41oM/wEqd1gFExerOwu7IQ8p897ACd5+F5vJdwSw60Z0rkmujKY
	xo/w==
X-Received: by 10.180.205.230 with SMTP id lj6mr26531569wic.82.1438014842665; 
	Mon, 27 Jul 2015 09:34:02 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id k2sm14469595wif.4.2015.07.27.09.34.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 09:34:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Jul 2015 18:34:05 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150727163405.GE307@jama>
References: <1437743901-28008-1-git-send-email-adraszik@digisoft.tv>
MIME-Version: 1.0
In-Reply-To: <1437743901-28008-1-git-send-email-adraszik@digisoft.tv>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] rsnapshot: make this an allarch package
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
X-List-Received-Date: Mon, 27 Jul 2015 16:34:05 -0000
X-Groupsio-MsgNum: 56394
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zaRBsRFn0XYhEU69"
Content-Disposition: inline

--zaRBsRFn0XYhEU69
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2015 at 02:18:21PM +0100, Andr=E9 Draszik wrote:
> From: Andr=E9 Draszik <git@andred.net>
>=20
> rsnapshot is just some perl script(s), no machine specific binaries.

NAK

The recipe has bunch of RDEPENDS on TUNE_PKGARCH recipes so it cannot be
allarch.

Recipe by default is TUNE_PKGARCH not MACHINE_ARCH as commit message may
suggest.

> ---
>  meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe=
/recipes-support/rsnapshot/rsnapshot_git.bb
> index d680511..0593eef 100644
> --- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> +++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> @@ -29,7 +29,7 @@ SRC_URI =3D "git://github.com/DrHyde/${BPN};branch=3Dma=
ster;protocol=3Dgit \
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -inherit autotools
> +inherit allarch autotools
> =20
>  # Fix rsnapshot.conf.default:
>  # don't inject the host path into target configs.
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zaRBsRFn0XYhEU69
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW2XXwACgkQN1Ujt2V2gBxHRQCgmoF4dc/jXCBb0AHZJPz8EljI
F3oAoJ4oUlbCDn/i4RSGykitttW4+RVL
=21r4
-----END PGP SIGNATURE-----

--zaRBsRFn0XYhEU69--
