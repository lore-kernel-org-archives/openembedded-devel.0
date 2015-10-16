Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9B235770E7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 13:37:07 +0000 (UTC)
Received: by wijp11 with SMTP id p11so10888953wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=j1IJptc4IDX0XHfh+gu7tLFLrjSkhjQiVYEzFFVrmiY=;
	b=wR9g3Plhz5Zm2yzcyQr6bjIZarjvi3XgPWyyJnfEAo/RzXRvi5JPr9C1ZU2XB4Yagi
	VWdU96RplRVjsYSojQn2cyPChnaW95h3DkflcXVjV8X5tkipBzXAt7br4BFe/Mb3mRuP
	BJn4qvjwCBSwuYx+A4uLYxlGmJhd51ZS1euMwngaOKakkTSe+QFDIlJHmt0X/zBP0ldT
	8Eb43MH9SFpLNIAnlp+WzN3UsOj61xHV0g52GcwK0n2TaOOB/r+/gJdFM3LbL8J7oBn/
	A67rifinooIbvOnO55+BJPlV/zRIW5yzan1yC01w3ggOY6olvPpnZyJYF4/qdiAPnM6G
	d3Jw==
X-Received: by 10.194.114.104 with SMTP id jf8mr18726688wjb.155.1445002627437; 
	Fri, 16 Oct 2015 06:37:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	xt1sm22590792wjb.32.2015.10.16.06.37.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 06:37:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 16 Oct 2015 15:37:34 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151016133734.GA2544@jama>
References: <1444990953-4567-1-git-send-email-folkus@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1444990953-4567-1-git-send-email-folkus@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH] There is missing line, which is setting the OE_BLUEZ_ENABLED. It was broken when merging .inc with _git.bb files. Without this missing line libQt5Bluetooth isn't working with bluez!
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
X-List-Received-Date: Fri, 16 Oct 2015 13:37:11 -0000
X-Groupsio-MsgNum: 57870
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2015 at 12:22:33PM +0200, S=C5=82awomir Paszko wrote:
> From: folkien <folkus@gmail.com>

Add commit summary (separated with blank line from what you currently
have in commit message) and use full name in your git configuration.

> ---
>  recipes-qt/qt5/qtconnectivity_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconn=
ectivity_git.bb
> index c758d04..2915327 100644
> --- a/recipes-qt/qt5/qtconnectivity_git.bb
> +++ b/recipes-qt/qt5/qtconnectivity_git.bb
> @@ -22,3 +22,4 @@ do_configure_prepend() {
>  }
> =20
>  SRCREV =3D "aa00047183008edd739df472cf0490e9fffbe655"
> +EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'bluez4', 'C=
ONFIG+=3DOE_BLUEZ_ENABLED', '', d)}"
> --=20
> 2.6.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYg/ZoACgkQN1Ujt2V2gBwIdQCfZQVaTiaEVG2Ppr7FxMnmmtrc
hesAn0DZCqjxAM8eU4BN9Ul09zPKcDUg
=ETCw
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
