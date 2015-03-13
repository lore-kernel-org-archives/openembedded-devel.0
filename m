Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id EDC0872C29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:49:52 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so6354674wiw.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EI/QBH8ZYvrTYsto7ogszMzFph7MGOv3MEGR8nkfyBE=;
	b=0/NU6Q52J5EOr3LXxtE7sZ0r546J8Vaq76CZ9WILlnFeYYJ/ZMSZoQ0lnVsyaVxcDf
	kw35hV4R4iuU3RhI+ZLGPUrFlIUmgXumxmy2HPZoFib346RdaqpNIG2quCJ4XY8utBTM
	k9HdT8Lfjy1bSchoeZe74ZMtQExt9wb0i6GIF4oqQZKktZVcMN5L+R7vuznrR8G43dat
	Jj5IrTUiSDnQlC6jahLgjW8JkG5cFy8CovO0oAfRk/nNI4470gHY5hp94eKNGsDzSWiR
	tL/yiDW1GgZtSnFSiC4l6NanletaJH2QR+OjlLyf/4RygFL4mUgaVScYbDp5y9scCLk+
	EiTw==
X-Received: by 10.194.187.46 with SMTP id fp14mr9749415wjc.86.1426254593151;
	Fri, 13 Mar 2015 06:49:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lb6sm2904140wjb.22.2015.03.13.06.49.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 06:49:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Mar 2015 14:50:46 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150313135046.GC2345@jama>
References: <1426231791-25435-1-git-send-email-erik.boto@pelagicore.com>
MIME-Version: 1.0
In-Reply-To: <1426231791-25435-1-git-send-email-erik.boto@pelagicore.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][daisy][PATCH] qt5-git.inc: Move to code.qt.io
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
X-List-Received-Date: Fri, 13 Mar 2015 13:49:55 -0000
X-Groupsio-MsgNum: 54767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline

--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2015 at 08:29:51AM +0100, Erik Bot=F6 wrote:
> Gitorious switch of git:// protocol and will close down in a while, so
> move over to code.qt.io.

This isn't enough.. I'll cherry-pick commit from master instead.

> Signed-off-by: Erik Bot=F6 <erik.boto@pelagicore.com>
> ---
>  recipes-qt/qt5/qt5-git.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index fa0c06e..2281b75 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -5,7 +5,7 @@ QT_MODULE_BRANCH ?=3D "stable"
> =20
>  # each module needs to define valid SRCREV
>  SRC_URI +=3D " \
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRAN=
CH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
> =20
>  S =3D "${WORKDIR}/git"
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

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUC6zYACgkQN1Ujt2V2gBwVOgCfcNonM5NlzMtiL6E3pJV6xLxi
WNUAoIe+k3Q+MriV9u0f+r5ZPsIswvse
=CO1q
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
